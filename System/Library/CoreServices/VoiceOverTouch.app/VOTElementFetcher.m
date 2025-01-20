@interface VOTElementFetcher
- (BOOL)_wasCanceledWithCountGeneration:(unint64_t)a3;
- (BOOL)_wasCanceledWithSearchGeneration:(unint64_t)a3;
- (BOOL)shouldPerformSearchSynchronously;
- (BOOL)triggerSignpostCollection;
- (VOTElementFetchDelegateProtocol)delegate;
- (VOTElementFetcher)init;
- (id)_debugElementCache;
- (id)_handleOpaqueSearchForElementInDirection:(int64_t)a3 opaqueParent:(id)a4 searchType:(int64_t)a5 range:(_NSRange *)a6 matchBlock:(id)a7 resetContentOffsetInOpaqueParent:(BOOL *)a8 peeking:(BOOL)a9;
- (id)_hitTestedElementForOriginalElement:(id)a3 hitTestPoint:(CGPoint)a4 opaqueParent:(id)a5;
- (void)_countElementsMatchingBlock:(id)a3 generation:(id)a4;
- (void)_forceUpdate;
- (void)_informDelegateOfRetrieveElements;
- (void)_initializeThread;
- (void)_retrieveElementsWithElement:(id)a3 groupNavigationStyle:(id)a4;
- (void)_searchForElementWithParameters:(id)a3;
- (void)_searchForElementWithParameters:(id)a3 searchFromOpaqueElementsInRemoteParent:(BOOL)a4;
- (void)_updateCacheWithElement:(id)a3;
- (void)cancelPreviousCount;
- (void)cancelPreviousSearch;
- (void)countElementsMatchingBlock:(id)a3;
- (void)dealloc;
- (void)didFinishBatchPeeking;
- (void)fillCacheWithElements:(id)a3;
- (void)forceUpdate;
- (void)invalidate;
- (void)retrieveElementsWithElement:(id)a3 groupNavigationStyle:(BOOL)a4;
- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10;
- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10 peeking:(BOOL)a11;
- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 needsForceCacheUpdate:(BOOL)a5 matchBlock:(id)a6 rangeMatch:(id)a7 searchType:(int64_t)a8 generation:(unint64_t)a9 startingRange:(_NSRange)a10 groupNavigationStyle:(BOOL)a11 peeking:(BOOL)a12;
- (void)setDelegate:(id)a3;
- (void)setShouldPerformSearchSynchronously:(BOOL)a3;
- (void)setTriggerSignpostCollection:(BOOL)a3;
- (void)updateCacheWithElement:(id)a3;
@end

@implementation VOTElementFetcher

- (VOTElementFetcher)init
{
  v18.receiver = self;
  v18.super_class = (Class)VOTElementFetcher;
  v2 = [(VOTElementFetcher *)&v18 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_cacheSize = xmmword_10016EA50;
    v4 = (SCRCThread *)[objc_allocWithZone((Class)SCRCThread) init];
    fillerThread = v3->_fillerThread;
    v3->_fillerThread = v4;

    v6 = (SCRCThreadKey *)[objc_allocWithZone((Class)SCRCThreadKey) initWithObject:v3];
    fillerThreadKey = v3->_fillerThreadKey;
    v3->_fillerThreadKey = v6;

    [(SCRCThread *)v3->_fillerThread performSelector:"_initializeThread" onTarget:v3 count:0 objects:0];
    v8 = (NSMutableArray *)[objc_allocWithZone((Class)NSMutableArray) initWithCapacity:v3->_cacheSize + 1];
    elementCache = v3->_elementCache;
    v3->_elementCache = v8;

    v3->_canceledSearchGeneration = 0;
    v3->_currentSearchGeneration = 0;
    dispatch_queue_t v10 = dispatch_queue_create("SearchGenerationQueue", 0);
    searchGenerationQueue = v3->_searchGenerationQueue;
    v3->_searchGenerationQueue = (OS_dispatch_queue *)v10;

    v3->_canceledCountGeneration = 0;
    v3->_currentCountGeneration = 0;
    dispatch_queue_t v12 = dispatch_queue_create("CountGenerationQueue", 0);
    countGenerationQueue = v3->_countGenerationQueue;
    v3->_countGenerationQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = objc_opt_new();
    opaqueElementCache = v3->_opaqueElementCache;
    v3->_opaqueElementCache = (NSMutableDictionary *)v14;

    v16 = v3;
  }

  return v3;
}

- (void)invalidate
{
  [(SCRCThread *)self->_fillerThread setIsInvalid:1];
  [(NSLock *)self->_cacheLock lock];
  cacheLock = self->_cacheLock;
  self->_cacheLock = 0;
  v6 = cacheLock;

  [(NSLock *)v6 unlock];
  searchGenerationQueue = self->_searchGenerationQueue;
  self->_searchGenerationQueue = 0;

  countGenerationQueue = self->_countGenerationQueue;
  self->_countGenerationQueue = 0;
}

- (void)dealloc
{
  [(VOTElementFetcher *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VOTElementFetcher;
  [(VOTElementFetcher *)&v3 dealloc];
}

- (void)_initializeThread
{
  AXSetThreadPriority();
  id v4 = +[NSThread currentThread];
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  [v4 setName:v3];
}

- (void)_updateCacheWithElement:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    [(NSLock *)self->_cacheLock lock];
    [(NSMutableArray *)self->_elementCache removeAllObjects];
    [(NSLock *)self->_cacheLock unlock];
    goto LABEL_70;
  }
  v6 = [v4 localOpaqueParent];

  if (!v6)
  {
    if ([(VOTElementFetcher *)self triggerSignpostCollection])
    {
      v7 = VOTLogElement();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FetchElements", "", buf, 2u);
      }
    }
    v8 = VOTLogElement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100123380();
    }

    [(NSLock *)self->_cacheLock lock];
    p_elementCache = &self->_elementCache;
    uint64_t v10 = (uint64_t)[(NSMutableArray *)self->_elementCache count];
    id v11 = [(NSMutableArray *)self->_elementCache indexOfObject:v5];
    if (v10 < 1)
    {
      v13 = 0;
      dispatch_queue_t v12 = 0;
    }
    else
    {
      dispatch_queue_t v12 = [(NSMutableArray *)*p_elementCache objectAtIndex:0];
      v13 = [(NSMutableArray *)*p_elementCache lastObject];
    }
    [(NSLock *)self->_cacheLock unlock];
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v14 = self->_cacheSize >> 1;
      id v15 = v5;
      [(NSLock *)self->_cacheLock lock];
      [(NSMutableArray *)self->_elementCache removeAllObjects];
      [(NSMutableArray *)self->_elementCache addObject:v15];
      [(NSLock *)self->_cacheLock unlock];
      id v16 = v15;
      goto LABEL_27;
    }
    int64_t cacheBufferEdge = self->_cacheBufferEdge;
    if ((uint64_t)v11 < cacheBufferEdge)
    {
      objc_super v18 = *p_elementCache;
      if (![(NSMutableArray *)v18 count]
        || ([(NSMutableArray *)v18 objectAtIndex:0],
            v19 = objc_claimAutoreleasedReturnValue(),
            +[NSNull null],
            v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            v19 != v20))
      {

        id v15 = v12;
        unint64_t v14 = (self->_cacheSize >> 1) - (void)v11;
        goto LABEL_26;
      }

      int64_t cacheBufferEdge = self->_cacheBufferEdge;
    }
    if ((uint64_t)v11 > v10 - cacheBufferEdge)
    {
      v21 = *p_elementCache;
      if (![(NSMutableArray *)v21 count]
        || ([(NSMutableArray *)v21 lastObject],
            v22 = objc_claimAutoreleasedReturnValue(),
            +[NSNull null],
            v23 = objc_claimAutoreleasedReturnValue(),
            v23,
            v22,
            v22 != v23))
      {

        unint64_t v14 = (unint64_t)v11 + (self->_cacheSize >> 1) - v10;
        id v16 = v13;
        id v15 = 0;
        goto LABEL_27;
      }
    }
    unint64_t v14 = 0;
    id v15 = 0;
LABEL_26:
    id v16 = 0;
LABEL_27:
    v24 = VOTLogElement();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v62 = v14;
      __int16 v63 = 2114;
      id v64 = v15;
      __int16 v65 = 2114;
      id v66 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "fetch count: %lu -- startFromBehind: %{public}@, startFromAhead:%{public}@", buf, 0x20u);
    }

    if (v16)
    {
      v55 = [v16 elementsInDirection:1 withCount:v14];
      if (v15)
      {
LABEL_31:
        v54 = [v15 elementsInDirection:2 withCount:v14];
LABEL_34:
        v25 = VOTLogElement();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_100123310((uint64_t)v55);
        }

        [(NSLock *)self->_cacheLock lock];
        if ([v55 count])
        {
          [(NSMutableArray *)self->_elementCache addObjectsFromArray:v55];
          if ((unint64_t)[(NSMutableArray *)self->_elementCache count] > self->_cacheSize)
          {
            v26 = (char *)[(NSMutableArray *)self->_elementCache count] - self->_cacheSize;
            v27 = VOTLogElement();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              sub_10012328C((uint64_t)v26, v27);
            }

            -[NSMutableArray removeObjectsInRange:](*p_elementCache, "removeObjectsInRange:", 0, v26);
          }
        }
        id v47 = v16;
        if (v16 && v14 > (unint64_t)objc_msgSend(v55, "count", v16))
        {
          v28 = *p_elementCache;
          v29 = +[NSNull null];
          [(NSMutableArray *)v28 addObject:v29];
        }
        if (objc_msgSend(v54, "count", v47))
        {
          elementCache = self->_elementCache;
          v30 = [v54 reverseObjectEnumerator];
          [v30 allObjects];
          v31 = unint64_t v52 = v14;
          p_elementCache = &self->_elementCache;
          v32 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v54 count]);
          [(NSMutableArray *)elementCache insertObjects:v31 atIndexes:v32];

          unint64_t v14 = v52;
          if ((unint64_t)[(NSMutableArray *)self->_elementCache count] > self->_cacheSize)
          {
            v33 = (char *)[(NSMutableArray *)self->_elementCache count] - self->_cacheSize;
            -[NSMutableArray removeObjectsInRange:](self->_elementCache, "removeObjectsInRange:", (unsigned char *)[(NSMutableArray *)self->_elementCache count] - v33, v33);
            v34 = VOTLogElement();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              sub_1001231F0((id *)p_elementCache, (uint64_t)v33, v34);
            }
          }
        }
        v53 = v5;
        if (v15 && v14 > (unint64_t)[v54 count])
        {
          v35 = *p_elementCache;
          v36 = +[NSNull null];
          [(NSMutableArray *)v35 insertObject:v36 atIndex:0];
        }
        v50 = v12;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v37 = *p_elementCache;
        id v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v38)
        {
          id v39 = v38;
          v40 = 0;
          uint64_t v41 = *(void *)v57;
          uint64_t v42 = kAXAllowsDirectInteractionTrait;
          do
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v57 != v41) {
                objc_enumerationMutation(v37);
              }
              v44 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v44 doesHaveTraits:v42])
              {
                if (!v40)
                {
                  v40 = +[NSMutableArray array];
                }
                [v40 addObject:v44];
              }
            }
            id v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v56 objects:v60 count:16];
          }
          while (v39);
        }
        else
        {
          v40 = 0;
        }

        [(NSLock *)self->_cacheLock unlock];
        v45 = [(VOTElementFetcher *)self delegate];
        [v45 elementFetchFoundDirectTouchElements:v40];

        v5 = v53;
        if ([(VOTElementFetcher *)self triggerSignpostCollection])
        {
          v46 = VOTLogElement();
          if (os_signpost_enabled(v46))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FetchElements", "", buf, 2u);
          }

          [(VOTElementFetcher *)self setTriggerSignpostCollection:0];
        }
        goto LABEL_70;
      }
    }
    else
    {
      v55 = 0;
      if (v15) {
        goto LABEL_31;
      }
    }
    v54 = 0;
    goto LABEL_34;
  }
LABEL_70:
}

- (void)updateCacheWithElement:(id)a3
{
  *(_OWORD *)&self->_cacheSize = xmmword_10016EA50;
  fillerThread = self->_fillerThread;
  id v5 = [a3 copyWithCache];
  [(SCRCThread *)fillerThread performSelector:"_updateCacheWithElement:" onTarget:self cancelMask:1 count:1 objects:v5];
}

- (void)_forceUpdate
{
  [(NSLock *)self->_cacheLock lock];
  [(NSMutableArray *)self->_elementCache removeAllObjects];
  cacheLock = self->_cacheLock;

  [(NSLock *)cacheLock unlock];
}

- (void)forceUpdate
{
  objc_super v3 = VOTLogElement();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001233E8();
  }

  [(SCRCThread *)self->_fillerThread performSelector:"_forceUpdate" onTarget:self cancelMask:0 count:0 objects:0];
}

- (void)cancelPreviousCount
{
  countGenerationQueue = self->_countGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE688;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_sync(countGenerationQueue, block);
}

- (BOOL)_wasCanceledWithCountGeneration:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  countGenerationQueue = self->_countGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE748;
  block[3] = &unk_1001B69D0;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(countGenerationQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_countElementsMatchingBlock:(id)a3 generation:(id)a4
{
  id v15 = (uint64_t (**)(id, void *, void))a3;
  id v6 = [a4 unsignedLongLongValue];
  if ([(VOTElementFetcher *)self _wasCanceledWithCountGeneration:v6]) {
    goto LABEL_23;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(NSLock *)self->_cacheLock lock];
  if (![(NSMutableArray *)self->_elementCache count])
  {
    [(NSLock *)self->_cacheLock unlock];
    [(VOTElementFetcher *)self _updateCacheWithElement:0];
    [(NSLock *)self->_cacheLock lock];
  }
  uint64_t v8 = (uint64_t)[(NSMutableArray *)self->_elementCache count];
  if (v8 < 1)
  {
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = (char *)v8;
  uint64_t v10 = 0;
  id v11 = 0;
  while (1)
  {
    dispatch_queue_t v12 = [(NSMutableArray *)self->_elementCache objectAtIndex:v11];
    if ([(VOTElementFetcher *)self _wasCanceledWithCountGeneration:v6])
    {
      [(NSLock *)self->_cacheLock unlock];
      goto LABEL_22;
    }
    v13 = +[NSNull null];

    if (v12 != v13) {
      break;
    }
    if (v11) {
      goto LABEL_19;
    }
LABEL_15:

    if ((uint64_t)++v11 >= (uint64_t)v9) {
      goto LABEL_20;
    }
  }
  if (v11 == v9 - 1)
  {
    unint64_t v14 = +[NSNull null];

    if (v12 != v14)
    {
      [(NSLock *)self->_cacheLock unlock];
      [(VOTElementFetcher *)self _updateCacheWithElement:v12];
      [(NSLock *)self->_cacheLock lock];
      uint64_t v9 = (char *)[(NSMutableArray *)self->_elementCache count];
    }
  }
  v10 += v15[2](v15, v12, 0) & 1;
  if ((char *)(50 * ((unint64_t)v11 / 0x32)) != v11 || CFAbsoluteTimeGetCurrent() - Current <= 1.1) {
    goto LABEL_15;
  }
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

LABEL_20:
  [(NSLock *)self->_cacheLock unlock];
  if (![(VOTElementFetcher *)self _wasCanceledWithCountGeneration:v6])
  {
    dispatch_queue_t v12 = [(VOTElementFetcher *)self delegate];
    [v12 elementsCounted:v10];
LABEL_22:
  }
LABEL_23:
}

- (id)_handleOpaqueSearchForElementInDirection:(int64_t)a3 opaqueParent:(id)a4 searchType:(int64_t)a5 range:(_NSRange *)a6 matchBlock:(id)a7 resetContentOffsetInOpaqueParent:(BOOL *)a8 peeking:(BOOL)a9
{
  id v14 = a4;
  v33 = (uint64_t (**)(id, void *, void))a7;
  [v14 contentOffset];
  double v16 = v15;
  double v18 = v17;
  if (a3 == 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 2;
  }
  v20 = [(NSMutableDictionary *)self->_opaqueElementCache objectForKey:v14];
  v21 = [v14 opaqueElementInDirection:v19 searchType:a5 range:a6 peeking:a9 startOpaqueElement:v20];

  if (v21) {
    [(NSMutableDictionary *)self->_opaqueElementCache setObject:v21 forKey:v14];
  }
  v22 = VOTLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = (uint64_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Next header in direction %@", buf, 0xCu);
  }

  if (v21)
  {
    uint64_t v23 = kAXSpacerTrait;
    while (([v21 doesHaveTraits:v23] & 1) != 0 || (v33[2](v33, v21, 0) & 1) == 0)
    {
      v24 = [(NSMutableDictionary *)self->_opaqueElementCache objectForKey:v14];
      uint64_t v25 = [v14 opaqueElementInDirection:v19 searchType:a5 range:a6 peeking:a9 startOpaqueElement:v24];

      if (v25) {
        [(NSMutableDictionary *)self->_opaqueElementCache setObject:v25 forKey:v14];
      }
      v26 = VOTLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Try again header search element %@", buf, 0xCu);
      }

      v21 = (void *)v25;
      if (!v25) {
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v27 = VOTLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Did not find a match, reset offset", buf, 2u);
    }

    [v14 contentOffset];
    if (vabdd_f64(v16, v29) >= 0.001 || vabdd_f64(v18, v28) >= 0.001)
    {
      objc_msgSend(v14, "setContentOffset:", v16, v18);
      v21 = 0;
      *a8 = 1;
    }
    else
    {
      v21 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didSearchForOpaqueElement];

  return v21;
}

- (id)_hitTestedElementForOriginalElement:(id)a3 hitTestPoint:(CGPoint)a4 opaqueParent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = -[VOTElement initWithPosition:]([VOTElement alloc], "initWithPosition:", x, y);
  if ([(VOTElement *)v10 isValid]
    && ![(VOTElement *)v10 isEqual:v8]
    && [(VOTElement *)v10 isAccessibleElement]
    && (!v9
     || ([(VOTElement *)v10 opaqueParent],
         id v11 = objc_claimAutoreleasedReturnValue(),
         unsigned int v12 = [v11 isEqual:v9],
         v11,
         v12)))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_wasCanceledWithSearchGeneration:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  searchGenerationQueue = self->_searchGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEE64;
  block[3] = &unk_1001B69D0;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(searchGenerationQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_searchForElementWithParameters:(id)a3
{
}

- (void)_searchForElementWithParameters:(id)a3 searchFromOpaqueElementsInRemoteParent:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  id v8 = [v7 generation];
  if (![(VOTElementFetcher *)self _wasCanceledWithSearchGeneration:v8])
  {
    BOOL v151 = v5;
    id v148 = v8;
    v163 = [v7 element];
    id v158 = [v7 searchType];
    id v159 = [v7 direction];
    uint64_t v9 = [v7 matchBlock];
    v155 = [v7 rangeBlock];
    uint64_t v193 = 0;
    v194 = (NSRange *)&v193;
    uint64_t v195 = 0x3010000000;
    uint64_t v198 = 0;
    v196 = &unk_100168CC9;
    id v197 = 0;
    id v197 = [v7 startingRange];
    uint64_t v198 = v10;
    unsigned int v157 = [v7 needsForceCacheUpdate];
    uint64_t v189 = 0;
    v190 = &v189;
    uint64_t v191 = 0x2020000000;
    char v192 = 0;
    unsigned int v154 = [v7 groupNavigationStyle];
    unsigned __int8 v150 = [v7 peeking];
    v152 = [v163 groupedParent];
    id v11 = [v163 opaqueParent];
    v162 = [v163 localOpaqueParent];
    v160 = [v163 outermostLocalOpaqueParent];
    v164 = v11;
    if (v11)
    {
      unsigned int v12 = v11;
    }
    else
    {
      unsigned int v12 = [v7 fallbackOpaqueParent];
    }
    if (v162)
    {
      v149 = v162;
    }
    else
    {
      v149 = [v7 fallbackLocalOpaqueParent];
    }
    v13 = [v7 fallbackOpaqueParent];
    if (v11 == v13
      || ([v7 fallbackOpaqueParent],
          char v4 = objc_claimAutoreleasedReturnValue(),
          ([v11 isEqual:v4] & 1) != 0))
    {
      id v14 = [v7 fallbackLocalOpaqueParent];
      double v15 = v14;
      if (v162 == v14)
      {

        if (v11 != v13)
        {

          id v11 = v13;
        }
        goto LABEL_20;
      }
      double v16 = [v7 fallbackLocalOpaqueParent];
      unsigned __int8 v17 = [(NSMutableArray *)v162 isEqual:v16];

      if (v164 == v13)
      {
      }
      else
      {
      }
      if (v17)
      {
LABEL_21:
        v178[0] = _NSConcreteStackBlock;
        v178[1] = 3221225472;
        v178[2] = sub_1000F0804;
        v178[3] = &unk_1001B69F8;
        id v184 = v159;
        id v185 = v158;
        v178[4] = self;
        v182 = &v193;
        id v153 = v9;
        id v181 = v153;
        v183 = &v189;
        unsigned __int8 v186 = v150;
        double v18 = v12;
        v179 = v18;
        char v187 = v157;
        id v19 = v7;
        id v180 = v19;
        char v188 = v154;
        v156 = objc_retainBlock(v178);
        if (v160) {
          int v20 = 1;
        }
        else {
          int v20 = v151;
        }
        if (v18) {
          int v21 = v20;
        }
        else {
          int v21 = 0;
        }
        v22 = v163;
        if (v21 == 1)
        {
          if (v151) {
            uint64_t v23 = v18;
          }
          else {
            uint64_t v23 = v160;
          }
          v161 = v163;
          if (((uint64_t (*)(void *, NSObject *))v156[2])(v156, v23)) {
            goto LABEL_159;
          }
          v24 = VOTLogElement();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            sub_1001239B8();
          }

          v22 = v18;
        }
        [(NSLock *)self->_cacheLock lock];
        p_elementCache = &self->_elementCache;
        elementCache = self->_elementCache;
        v176[0] = _NSConcreteStackBlock;
        v176[1] = 3221225472;
        v176[2] = sub_1000F0A4C;
        v176[3] = &unk_1001B6A20;
        v161 = v22;
        v177 = v161;
        v27 = [(NSMutableArray *)elementCache indexesOfObjectsPassingTest:v176];
        v147 = v27;
        if (v159 == (id)1) {
          double v28 = (char *)[v27 lastIndex];
        }
        else {
          double v28 = (char *)[v27 firstIndex];
        }
        double v29 = v28;
        if (v28 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = VOTLogElement();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            sub_100123940();
          }

          [(NSLock *)self->_cacheLock unlock];
          [(VOTElementFetcher *)self _updateCacheWithElement:v161];
          [(NSLock *)self->_cacheLock lock];
          double v29 = (char *)[(NSMutableArray *)*p_elementCache indexOfObject:v161];
          v31 = VOTLogElement();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            sub_1001238FC(v31);
          }
        }
        v32 = VOTLogElement();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v41 = *p_elementCache;
          *(_DWORD *)buf = 138543874;
          v202 = v161;
          __int16 v203 = 2048;
          v204 = v29;
          __int16 v205 = 2114;
          v206 = v41;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Location of element %{public}@ in cache: %ld\nCache: %{public}@", buf, 0x20u);
        }

        if ([(VOTElementFetcher *)self _wasCanceledWithSearchGeneration:v8])
        {
          [(NSLock *)self->_cacheLock unlock];
LABEL_158:

LABEL_159:
          _Block_object_dispose(&v189, 8);
          _Block_object_dispose(&v193, 8);

          goto LABEL_160;
        }
        if (v29 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          [(NSLock *)self->_cacheLock unlock];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          id v34 = [v19 clientGeneration];
          uint64_t v35 = +[VOTElementFetchFoundData fetchFoundData:forceUpdate:direction:generation:range:searchType:](VOTElementFetchFoundData, "fetchFoundData:forceUpdate:direction:generation:range:searchType:", 0, v157, v159, v34, v194[2].location, v194[2].length, v158);
          [WeakRetained elementFetchFound:v35];

LABEL_157:
          goto LABEL_158;
        }
        v170[0] = _NSConcreteStackBlock;
        v170[1] = 3221225472;
        v170[2] = sub_1000F0A58;
        v170[3] = &unk_1001B6A48;
        id v137 = v155;
        id v172 = v137;
        id v173 = v159;
        char v175 = v157;
        id v36 = v19;
        id v171 = v36;
        id v174 = v158;
        v145 = objc_retainBlock(v170);
        v165[0] = _NSConcreteStackBlock;
        v165[1] = 3221225472;
        v165[2] = sub_1000F0B94;
        v165[3] = &unk_1001B6A70;
        id v167 = v158;
        id v168 = v159;
        char v169 = v157;
        id v139 = v36;
        id v166 = v139;
        v144 = objc_retainBlock(v165);
        ((void (*)(void *, NSObject *, NSUInteger, NSUInteger, void))v145[2])(v145, v161, v194[2].location, v194[2].length, 0);
        v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          id v38 = objc_loadWeakRetained((id *)&self->_delegate);
          [v38 elementFetchFound:v37];
LABEL_156:

          id WeakRetained = v172;
          goto LABEL_157;
        }
        id v38 = [0 searchUUID];
        uint64_t v39 = ((void (*)(void *, NSObject *, NSUInteger, NSUInteger, void *))v144[2])(v144, v161, v194[2].location, v194[2].length, v38);
        v40 = [(id)v39 element];
        v143 = (void *)v39;
        LOBYTE(v39) = v40 == 0;

        if ((v39 & 1) == 0)
        {
          v146 = objc_loadWeakRetained((id *)&self->_delegate);
          [v146 elementFetchFound:v143];
          v37 = 0;
          goto LABEL_155;
        }
        v138 = [v143 searchUUID];

        v44 = (char *)[(NSMutableArray *)*p_elementCache count];
        if (v159 == (id)1) {
          uint64_t v45 = 1;
        }
        else {
          uint64_t v45 = -1;
        }
        uint64_t v134 = v45;
        v135 = v44;
        v46 = &v29[v45];
        BOOL v47 = (uint64_t)&v29[v45] < (uint64_t)v44;
        context = v46;
        BOOL v48 = (uint64_t)v46 >= 0;
        if (v159 != (id)1) {
          BOOL v47 = v48;
        }
        if (v47)
        {
          v136 = 0;
          char v131 = 0;
          uint64_t v49 = 0x7FFFFFFFLL;
          if (v159 == (id)1) {
            uint64_t v49 = 0;
          }
          uint64_t v132 = kAXSpacerTrait;
          NSUInteger v133 = v49;
          uint64_t v50 = -1;
          if (v159 != (id)1) {
            uint64_t v50 = 1;
          }
          uint64_t v130 = v50;
          while (1)
          {
            if ([(VOTElementFetcher *)self _wasCanceledWithSearchGeneration:v148]) {
              goto LABEL_125;
            }
            v146 = [(NSMutableArray *)*p_elementCache objectAtIndex:context];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned int v51 = [v146 pid];
              if (((v51 == [v161 pid]) & v21) == 1)
              {
                if ([v161 isAccessibilityOpaqueElementProvider])
                {
                  if (((uint64_t (*)(void *, NSObject *))v156[2])(v156, v161))
                  {
                    id v38 = v138;
                    v37 = v136;
                    goto LABEL_155;
                  }
                  LOBYTE(v21) = 0;
                }
                else
                {
                  LOBYTE(v21) = 1;
                }
              }
            }
            unint64_t v52 = v194;
            v194[2].location = v133;
            v52[2].length = 0;
            v53 = +[NSNull null];
            BOOL v54 = v146 == v53;

            if (v54)
            {
              unint64_t v62 = 0;
LABEL_127:
              unsigned int v140 = 0;
              goto LABEL_137;
            }
            v55 = VOTLogElement();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v202 = v146;
              _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "Checking element %{public}@", buf, 0xCu);
            }

            if (([v146 doesHaveTraits:v132] & 1) == 0) {
              break;
            }
LABEL_105:

            BOOL v68 = (uint64_t)&context[v134] < (uint64_t)v135;
            context += v134;
            if (v159 != (id)1) {
              BOOL v68 = (uint64_t)context >= 0;
            }
            if (!v68) {
              goto LABEL_125;
            }
          }
          if (v154)
          {
            uint64_t v56 = [v146 groupedParent];
            long long v57 = (void *)v56;
            if (!v56 && v152)
            {
              long long v57 = 0;
LABEL_131:
              v81 = VOTLogElement();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
                sub_100123894();
              }

              v82 = VOTLogElement();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
                sub_100123820();
              }

LABEL_136:
              unint64_t v62 = 0;
              unsigned int v140 = 1;
LABEL_137:

              goto LABEL_138;
            }
            if (v56 && !v152 || v56 && v152 && ([v152 isEqual:v56] & 1) == 0) {
              goto LABEL_131;
            }
          }
          unsigned int v58 = [v146 isAccessibilityOpaqueElementProvider];
          if (v158 == 999999) {
            unsigned int v59 = 0;
          }
          else {
            unsigned int v59 = v58;
          }
          if (v59 != 1 || v154 && ([v146 isAccessibleGroup] & 1) != 0)
          {
            if (([v146 isAccessibleElement] & 1) != 0
              || ([v146 isTouchContainer] & 1) != 0
              || v154 && [v146 isAccessibleGroup])
            {
              if ((*((uint64_t (**)(id, NSObject *, NSObject *))v153 + 2))(v153, v146, v161))
              {
                unint64_t v62 = v146;
                goto LABEL_127;
              }
              if (v60 == 1) {
                goto LABEL_136;
              }
            }
            else if (([v146 isAlive] & 1) == 0)
            {
              if (v131)
              {
                char v131 = 0;
                goto LABEL_105;
              }
              if (v159 == (id)1 && (uint64_t)context >= 1)
              {
                v70 = [(NSMutableArray *)*p_elementCache objectAtIndex:context - 1];
                v71 = +[NSNull null];
                BOOL v72 = v70 == v71;

                if (!v72)
                {
                  v73 = [(NSMutableArray *)*p_elementCache objectAtIndex:context - 1];
                  v74 = [v73 elementsInDirection:1 withCount:1];
                  uint64_t v75 = [v74 firstObject];
                  goto LABEL_118;
                }
              }
              else if (v159 != (id)1 && context < (char *)[(NSMutableArray *)*p_elementCache count] - 1)
              {
                v77 = [(NSMutableArray *)*p_elementCache objectAtIndex:context + 1];
                v78 = +[NSNull null];
                BOOL v79 = v77 == v78;

                if (!v79)
                {
                  v73 = [(NSMutableArray *)*p_elementCache objectAtIndex:context + 1];
                  v74 = [v73 elementsInDirection:2 withCount:1];
                  uint64_t v75 = [v74 firstObject];
LABEL_118:
                  v76 = (void *)v75;

                  if (v76)
                  {
                    [(NSMutableArray *)*p_elementCache replaceObjectAtIndex:context withObject:v76];

                    context += v130;
                    char v131 = 1;
                    goto LABEL_105;
                  }
                }
              }
            }
          }
          else
          {
            v61 = VOTLogElement();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v202 = v146;
              _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Try opaque element: %@", buf, 0xCu);
            }

            LOBYTE(v128) = v150;
            unint64_t v62 = [(VOTElementFetcher *)self _handleOpaqueSearchForElementInDirection:v159 opaqueParent:v146 searchType:v158 range:&v194[2] matchBlock:v153 resetContentOffsetInOpaqueParent:v190 + 3 peeking:v128];
            if (v62) {
              goto LABEL_127;
            }
          }
          ((void (*)(void *, NSObject *, NSUInteger, NSUInteger, void *))v145[2])(v145, v146, v194[2].location, v194[2].length, v138);
          v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

          __int16 v63 = VOTLogElement();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromRange(v194[2]);
            v69 = (char *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v202 = v146;
            __int16 v203 = 2112;
            v204 = v69;
            __int16 v205 = 2112;
            v206 = v37;
            _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "search range fetch: %@ %@ -> %@", buf, 0x20u);
          }
          if (v37 && [(NSMutableArray *)v37 range] != (id)0x7FFFFFFF)
          {
            id v80 = objc_loadWeakRetained((id *)&self->_delegate);
            [v80 elementFetchFound:v37];
            goto LABEL_154;
          }
          id v64 = ((void (*)(void *, NSObject *, NSUInteger, NSUInteger, void *))v144[2])(v144, v146, v194[2].location, v194[2].length, v138);

          uint64_t v65 = [v64 searchUUID];

          id v66 = [v64 element];
          BOOL v67 = v66 == 0;

          if (!v67)
          {
            id v80 = objc_loadWeakRetained((id *)&self->_delegate);
            [v80 elementFetchFound:v64];
            v138 = (void *)v65;
            v143 = v64;
            goto LABEL_154;
          }
          v143 = v64;
          v138 = (void *)v65;
          v136 = v37;
          goto LABEL_105;
        }
        v136 = 0;
LABEL_125:
        unint64_t v62 = 0;
        unsigned int v140 = 0;
LABEL_138:
        [(NSLock *)self->_cacheLock unlock];
        v83 = VOTLogElement();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v202 = v62;
          __int16 v203 = 2048;
          v204 = v29;
          __int16 v205 = 2048;
          v206 = (NSMutableArray *)v135;
          _os_log_debug_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "Found element: %{public}@ (%ld, %ld)", buf, 0x20u);
        }

        if (v62)
        {
          if (![v62 isAccessibilityOpaqueElementProvider]|| v154 && ([v62 isAccessibleGroup] & 1) != 0)
          {
            v146 = v62;
          }
          else
          {
            v85 = v62;
            LOBYTE(v128) = v150;
            v146 = [(VOTElementFetcher *)self _handleOpaqueSearchForElementInDirection:v159 opaqueParent:v85 searchType:v158 range:&v194[2] matchBlock:v153 resetContentOffsetInOpaqueParent:v190 + 3 peeking:v128];

            if (!v146)
            {
              id v93 = [v139 clientGeneration];
              BYTE1(v129) = v150;
              LOBYTE(v129) = v154;
              [(VOTElementFetcher *)self searchForElementInDirection:v159 fromElement:v85 needsForceCacheUpdate:0 matchBlock:v153 rangeMatch:v137 searchType:v158 generation:v93 startingRange:v194[2].location groupNavigationStyle:v194[2].length peeking:v129];
              v146 = 0;
              id v80 = 0;
              id v87 = 0;
              goto LABEL_152;
            }
          }
          v85 = objc_loadWeakRetained((id *)&self->_delegate);
          v86 = +[VOTElementFetchFoundData fetchFoundData:forceUpdate:direction:generation:range:searchType:](VOTElementFetchFoundData, "fetchFoundData:forceUpdate:direction:generation:range:searchType:", v146, v157, v159, [v139 clientGeneration], 0x7FFFFFFFLL, 0, v158);
          [v85 elementFetchFound:v86];
          id v80 = 0;
          goto LABEL_150;
        }
        [(NSLock *)self->_cacheLock lock];
        v84 = *p_elementCache;
        if (v159 == (id)1) {
          [(NSMutableArray *)v84 lastObject];
        }
        else {
        id v80 = [(NSMutableArray *)v84 objectAtIndex:0];
        }

        [(NSLock *)self->_cacheLock unlock];
        if (v151) {
          goto LABEL_177;
        }
        v88 = [v163 remoteParent];
        if (!v88) {
          goto LABEL_177;
        }
        id v89 = +[NSNull null];
        if (v80 == v89)
        {
          id v89 = v80;
          if (v18)
          {

            if (!v149)
            {
LABEL_174:
              [(VOTElementFetcher *)self _searchForElementWithParameters:v139 searchFromOpaqueElementsInRemoteParent:1];
              goto LABEL_182;
            }
LABEL_177:
            id v94 = +[NSNull null];
            BOOL v95 = v80 == v94;

            if (!v95)
            {
              v96 = VOTLogElement();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG)) {
                sub_1001237B8();
              }

              if (![(VOTElementFetcher *)self _wasCanceledWithSearchGeneration:v148])
              {
                [(VOTElementFetcher *)self _updateCacheWithElement:v80];
                if (![(VOTElementFetcher *)self _wasCanceledWithSearchGeneration:v148])
                {
                  [(NSLock *)self->_cacheLock lock];
                  v123 = *p_elementCache;
                  if (v159 == (id)1) {
                    [(NSMutableArray *)v123 lastObject];
                  }
                  else {
                  id v87 = [(NSMutableArray *)v123 objectAtIndex:0];
                  }

                  [(NSLock *)self->_cacheLock unlock];
                  if (([v80 isEqual:v87] | v140) != 1)
                  {
                    v126 = VOTLogElement();
                    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG)) {
                      sub_100123750();
                    }

                    id v127 = [v139 clientGeneration];
                    BYTE1(v129) = v150;
                    LOBYTE(v129) = v154;
                    [(VOTElementFetcher *)self searchForElementInDirection:v159 fromElement:v80 needsForceCacheUpdate:v157 matchBlock:v153 rangeMatch:v137 searchType:v158 generation:v127 startingRange:v194[2].location groupNavigationStyle:v194[2].length peeking:v129];
                    v146 = 0;
                    goto LABEL_153;
                  }
                  v125 = VOTLogElement();
                  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG)) {
                    sub_1001236E8();
                  }

                  v85 = +[VOTElementFetchFoundData fetchFoundData:forceUpdate:direction:generation:range:searchType:](VOTElementFetchFoundData, "fetchFoundData:forceUpdate:direction:generation:range:searchType:", 0, v157, v159, [v139 clientGeneration], 0x7FFFFFFFLL, 0, v158);
                  [v85 setSearchEndedWithDifferentGroup:v140];
                  v86 = objc_loadWeakRetained((id *)&self->_delegate);
                  [v86 elementFetchFound:v85];
                  v146 = 0;
                  goto LABEL_151;
                }
              }
LABEL_182:
              v146 = 0;
              id v87 = 0;
              goto LABEL_153;
            }
            [v163 updateVisiblePoint];
            [v163 visiblePoint];
            double v98 = v97;
            double v100 = v99;
            v101 = VOTLogElement();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
            {
              v211.double x = v98;
              v211.double y = v100;
              v102 = NSStringFromCGPoint(v211);
              sub_100123678((uint64_t)v163, v102, buf, v101);
            }

            id v103 = [v163 windowContextId];
            v104 = +[VOTElement systemWideElement];
            objc_msgSend(v104, "convertPoint:fromContextId:", v103, v98, v100);
            double v106 = v105;
            double v108 = v107;

            v109 = VOTLogElement();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
            {
              v212.double x = v106;
              v212.double y = v108;
              v110 = NSStringFromCGPoint(v212);
              sub_1001235F8(v110, (uint64_t)v200, (int)v103, v109);
            }

            int v111 = 1;
            if (v106 == CGPointZero.x)
            {
              double y = CGPointZero.y;
              if (v108 == y)
              {
                [v139 hitTestPoint];
                double v106 = v113;
                double v108 = v114;
                v115 = VOTLogElement();
                if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                {
                  v213.double x = v106;
                  v213.double y = v108;
                  v116 = NSStringFromCGPoint(v213);
                  sub_100123588((uint64_t)v163, v116, v199, v115);
                }

                int v111 = 1;
                if (v106 == CGPointZero.x && v108 == y)
                {
                  v117 = VOTLogElement();
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
                    sub_100123544(v117);
                  }

                  int v111 = 0;
                }
              }
            }
            if ((v111 & ([v163 isRemoteElement] ^ 1)) == 1)
            {
              v118 = -[VOTElementFetcher _hitTestedElementForOriginalElement:hitTestPoint:opaqueParent:](self, "_hitTestedElementForOriginalElement:hitTestPoint:opaqueParent:", v163, 0, v106, v108);
              v85 = v118;
              if (!*((unsigned char *)v190 + 24)
                || ([v118 opaqueParent],
                    v119 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v120 = [v18 isEqual:v119],
                    v119,
                    !v120))
              {
                if (v85
                  && (!v154
                   || ([v163 elementIsDescendant:v85] & 1) == 0))
                {
                  v124 = VOTLogElement();
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG)) {
                    sub_1001234DC();
                  }

                  BYTE1(v129) = v150;
                  LOBYTE(v129) = v154;
                  -[VOTElementFetcher searchForElementInDirection:fromElement:needsForceCacheUpdate:matchBlock:rangeMatch:searchType:generation:startingRange:groupNavigationStyle:peeking:](self, "searchForElementInDirection:fromElement:needsForceCacheUpdate:matchBlock:rangeMatch:searchType:generation:startingRange:groupNavigationStyle:peeking:", v159, v85, 1, v153, v137, v158, [v139 clientGeneration], 0x7FFFFFFFLL, 0, v129);
                  v146 = 0;
                  id v87 = 0;
                  goto LABEL_152;
                }
                goto LABEL_201;
              }
            }
            v85 = 0;
LABEL_201:
            v121 = VOTLogElement();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG)) {
              sub_100123474();
            }

            v86 = +[VOTElementFetchFoundData fetchFoundData:forceUpdate:direction:generation:range:searchType:](VOTElementFetchFoundData, "fetchFoundData:forceUpdate:direction:generation:range:searchType:", 0, v157, v159, [v139 clientGeneration], 0x7FFFFFFFLL, 0, v158);
            [v86 setSearchEndedWithDifferentGroup:v140];
            id v122 = objc_loadWeakRetained((id *)&self->_delegate);
            [v122 elementFetchFound:v86];

            v146 = 0;
LABEL_150:
            id v87 = 0;
LABEL_151:

LABEL_152:
LABEL_153:

            v37 = v136;
LABEL_154:

            id v38 = v138;
LABEL_155:

            goto LABEL_156;
          }
        }
        else
        {
          v90 = [v163 immediateRemoteParent];
          unsigned __int8 v91 = [v90 isEqual:v80];
          if (v18) {
            unsigned __int8 v92 = v91;
          }
          else {
            unsigned __int8 v92 = 0;
          }
          if (v92)
          {

            if (!v149) {
              goto LABEL_174;
            }
            goto LABEL_177;
          }
        }
        goto LABEL_177;
      }
    }
    else
    {
    }
    id v11 = VOTLogElement();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v42 = [v7 fallbackOpaqueParent];
      v43 = [v7 fallbackLocalOpaqueParent];
      *(_DWORD *)buf = 138544386;
      v202 = v164;
      __int16 v203 = 2114;
      v204 = v42;
      __int16 v205 = 2114;
      v206 = v162;
      __int16 v207 = 2114;
      v208 = v43;
      __int16 v209 = 1024;
      BOOL v210 = v151;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Had to use fallback opaque parents. Opaque parent %{public}@ (fallback %{public}@), local opaque parent %{public}@ (fallback %{public}@), searchOpaqueRemoteParents %i,", buf, 0x30u);
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_160:
}

- (void)cancelPreviousSearch
{
  searchGenerationQueue = self->_searchGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F0E6C;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_sync(searchGenerationQueue, block);
  self->_retrievingAllElements = 0;
}

- (void)countElementsMatchingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  countGenerationQueue = self->_countGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F0FF8;
  block[3] = &unk_1001B34C0;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(countGenerationQueue, block);
  self->_cacheSize = 1000;
  id v6 = [v4 copy];
  fillerThread = self->_fillerThread;
  id v8 = +[NSNumber numberWithUnsignedLongLong:v11[3]];
  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:](fillerThread, "performSelector:onTarget:cancelMask:count:objects:", "_countElementsMatchingBlock:generation:", self, 1, 2, v6, v8);

  _Block_object_dispose(&v10, 8);
}

- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 needsForceCacheUpdate:(BOOL)a5 matchBlock:(id)a6 rangeMatch:(id)a7 searchType:(int64_t)a8 generation:(unint64_t)a9 startingRange:(_NSRange)a10 groupNavigationStyle:(BOOL)a11 peeking:(BOOL)a12
{
  BOOL v15 = a5;
  id v18 = a4;
  id v52 = a6;
  id v53 = a7;
  uint64_t v55 = 0;
  v56[0] = &v55;
  v56[1] = 0x2020000000;
  v56[2] = 0;
  searchGenerationQueue = self->_searchGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F1608;
  block[3] = &unk_1001B34C0;
  block[4] = self;
  void block[5] = &v55;
  dispatch_sync(searchGenerationQueue, block);
  *(_OWORD *)&self->_cacheSize = xmmword_10016EA60;
  self->_retrievingAllElements = 0;
  int v20 = VOTLogElement();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100123CC8((uint64_t)v56);
  }

  id v21 = v18;
  v22 = [v21 opaqueParent];
  uint64_t v23 = [v21 localOpaqueParent];
  [v21 centerPoint];
  double MidX = v24;
  double MidY = v26;
  [v21 frame];
  CGFloat x = v68.origin.x;
  CGFloat y = v68.origin.y;
  CGFloat width = v68.size.width;
  CGFloat height = v68.size.height;
  v73.origin.CGFloat x = CGRectZero.origin.x;
  v73.origin.CGFloat y = CGRectZero.origin.y;
  v73.size.CGFloat width = CGRectZero.size.width;
  v73.size.CGFloat height = CGRectZero.size.height;
  if (!CGRectEqualToRect(v68, v73))
  {
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = y;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = height;
    v67.CGFloat x = MidX;
    v67.CGFloat y = MidY;
    if (!CGRectContainsPoint(v69, v67))
    {
      v32 = VOTLogElement();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v70.origin.CGFloat x = x;
        v70.origin.CGFloat y = y;
        v70.size.CGFloat width = width;
        v70.size.CGFloat height = height;
        v33 = NSStringFromCGRect(v70);
        sub_100123C70(v33, v63, v32);
      }

      v71.origin.CGFloat x = x;
      v71.origin.CGFloat y = y;
      v71.size.CGFloat width = width;
      v71.size.CGFloat height = height;
      double MidX = CGRectGetMidX(v71);
      v72.origin.CGFloat x = x;
      v72.origin.CGFloat y = y;
      v72.size.CGFloat width = width;
      v72.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v72);
    }
  }
  unsigned int v34 = [v21 windowContextId];
  uint64_t v35 = +[VOTElement systemWideElement];
  objc_msgSend(v35, "convertPoint:fromContextId:", objc_msgSend(v21, "windowContextId"), MidX, MidY);
  double v37 = v36;
  double v39 = v38;

  v40 = VOTLogElement();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    v65.CGFloat x = v37;
    v65.CGFloat y = v39;
    NSStringFromCGPoint(v65);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    v66.CGFloat x = MidX;
    v66.CGFloat y = MidY;
    uint64_t v50 = NSStringFromCGPoint(v66);
    *(_DWORD *)buf = 138543874;
    id v58 = v49;
    __int16 v59 = 1024;
    unsigned int v60 = v34;
    __int16 v61 = 2114;
    unsigned int v51 = (void *)v50;
    uint64_t v62 = v50;
    _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Hit test point is %{public}@ with window context id %u and original center point %{public}@", buf, 0x1Cu);
  }
  uint64_t v41 = v21;
  if (!v21)
  {
    uint64_t v41 = 0;
    if (v22)
    {
      uint64_t v42 = VOTLogElement();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        v64.CGFloat x = v37;
        v64.CGFloat y = v39;
        v43 = NSStringFromCGPoint(v64);
        sub_100123C10((uint64_t)v22, v43, (uint64_t)buf, v42);
      }

      uint64_t v41 = -[VOTElementFetcher _hitTestedElementForOriginalElement:hitTestPoint:opaqueParent:](self, "_hitTestedElementForOriginalElement:hitTestPoint:opaqueParent:", 0, v22, v37, v39);
      if (v41)
      {
        v44 = VOTLogElement();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          sub_100123BA8();
        }

        id v45 = v41;
      }
    }
  }
  if (v41 || !v22)
  {
    id WeakRetained = objc_alloc_init(VOTElementFetcherSearchParameters);
    [(VOTElementFetcherSearchParameters *)WeakRetained setDirection:a3];
    [(VOTElementFetcherSearchParameters *)WeakRetained setElement:v41];
    [(VOTElementFetcherSearchParameters *)WeakRetained setNeedsForceCacheUpdate:v15];
    [(VOTElementFetcherSearchParameters *)WeakRetained setMatchBlock:v52];
    [(VOTElementFetcherSearchParameters *)WeakRetained setRangeBlock:v53];
    [(VOTElementFetcherSearchParameters *)WeakRetained setSearchType:a8];
    -[VOTElementFetcherSearchParameters setStartingRange:](WeakRetained, "setStartingRange:", a10.location, a10.length);
    [(VOTElementFetcherSearchParameters *)WeakRetained setFallbackOpaqueParent:v22];
    [(VOTElementFetcherSearchParameters *)WeakRetained setFallbackLocalOpaqueParent:v23];
    -[VOTElementFetcherSearchParameters setHitTestPoint:](WeakRetained, "setHitTestPoint:", v37, v39);
    [(VOTElementFetcherSearchParameters *)WeakRetained setGeneration:*(void *)(v56[0] + 24)];
    [(VOTElementFetcherSearchParameters *)WeakRetained setClientGeneration:a9];
    [(VOTElementFetcherSearchParameters *)WeakRetained setGroupNavigationStyle:a11];
    [(VOTElementFetcherSearchParameters *)WeakRetained setPeeking:a12];
    if ([(VOTElementFetcher *)self shouldPerformSearchSynchronously]) {
      [(VOTElementFetcher *)self _searchForElementWithParameters:WeakRetained];
    }
    else {
      [(SCRCThread *)self->_fillerThread performSelector:"_searchForElementWithParameters:" onTarget:self cancelMask:1 count:1 objects:WeakRetained];
    }
  }
  else
  {
    v46 = VOTLogElement();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      sub_100123B64(v46);
    }

    id WeakRetained = (VOTElementFetcherSearchParameters *)objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v48 = +[VOTElementFetchFoundData fetchFoundData:forceUpdate:direction:generation:range:searchType:](VOTElementFetchFoundData, "fetchFoundData:forceUpdate:direction:generation:range:searchType:", 0, v15, a3, a9, 0x7FFFFFFFLL, 0, a8);
    [(VOTElementFetcherSearchParameters *)WeakRetained elementFetchFound:v48];
  }
  _Block_object_dispose(&v55, 8);
}

- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10 peeking:(BOOL)a11
{
  LOWORD(v11) = __PAIR16__(a11, a10);
  [(VOTElementFetcher *)self searchForElementInDirection:a3 fromElement:a4 needsForceCacheUpdate:0 matchBlock:a5 rangeMatch:a6 searchType:a7 generation:a8 startingRange:a9.location groupNavigationStyle:a9.length peeking:v11];
}

- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10
{
  LOWORD(v10) = a10;
  [(VOTElementFetcher *)self searchForElementInDirection:a3 fromElement:a4 needsForceCacheUpdate:0 matchBlock:a5 rangeMatch:a6 searchType:a7 generation:a8 startingRange:a9.location groupNavigationStyle:a9.length peeking:v10];
}

- (void)didFinishBatchPeeking
{
  objc_super v3 = (NSMutableDictionary *)objc_opt_new();
  opaqueElementCache = self->_opaqueElementCache;
  self->_opaqueElementCache = v3;

  _objc_release_x1(v3, opaqueElementCache);
}

- (void)_informDelegateOfRetrieveElements
{
  [(NSLock *)self->_cacheLock lock];
  id v3 = [(NSMutableArray *)self->_elementCache copyWithZone:0];
  [(NSLock *)self->_cacheLock unlock];
  id v4 = VOTLogElement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100123D40(v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained elementsRetrieved:v3 finished:!self->_retrievingAllElements];
}

- (void)_retrieveElementsWithElement:(id)a3 groupNavigationStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_retrievingAllElements) {
    goto LABEL_49;
  }
  id v8 = [(NSMutableArray *)self->_elementCache count];
  self->_retrievingAllElements = 1;
  self->_cacheSize = 1000;
  if (v8)
  {
    uint64_t v9 = [(NSMutableArray *)self->_elementCache objectAtIndex:0];
    id v10 = [(NSMutableArray *)self->_elementCache lastObject];
  }
  else
  {
    uint64_t v11 = [v6 opaqueParent];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;

      id v6 = v13;
    }
    id v10 = v6;
    if (v10) {
      [(NSMutableArray *)self->_elementCache addObject:v10];
    }

    uint64_t v9 = v10;
    id v6 = v10;
  }
  id v45 = v6;
  id v14 = VOTLogElement();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100123F30((uint64_t)v9);
  }

  id v15 = +[NSNull null];

  BOOL v16 = 1;
  if (v10 != v15)
  {
    unsigned __int8 v17 = [v10 elementsInDirection:1 withCount:300];
    if (v17)
    {
      [(NSLock *)self->_cacheLock lock];
      [(NSMutableArray *)self->_elementCache addObjectsFromArray:v17];
      id v18 = [v17 count];
      BOOL v16 = (unint64_t)v18 < 0x12C;
      if ((unint64_t)v18 <= 0x12B)
      {
        elementCache = self->_elementCache;
        int v20 = +[NSNull null];
        [(NSMutableArray *)elementCache addObject:v20];
      }
      [(NSLock *)self->_cacheLock unlock];
    }
    id v21 = VOTLogElement();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100123EB0(v17, v21);
    }

    [(VOTElementFetcher *)self _informDelegateOfRetrieveElements];
  }
  v22 = +[NSNull null];

  v43 = v9;
  v44 = v10;
  if (v9 == v22)
  {
    if (v16)
    {
LABEL_30:
      self->_retrievingAllElements = 0;
      int v42 = 1;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v23 = [v9 elementsInDirection:2 withCount:300];
    if (v23)
    {
      double v24 = (void *)v23;
      [(NSLock *)self->_cacheLock lock];
      uint64_t v25 = self->_elementCache;
      double v26 = [v24 reverseObjectEnumerator];
      v27 = [v26 allObjects];
      double v28 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v24 count]);
      [(NSMutableArray *)v25 insertObjects:v27 atIndexes:v28];

      if ((unint64_t)[v24 count] > 0x12B)
      {
        LOBYTE(v16) = 0;
      }
      else
      {
        double v29 = self->_elementCache;
        v30 = +[NSNull null];
        [(NSMutableArray *)v29 insertObject:v30 atIndex:0];
      }
      v31 = VOTLogElement();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100123E30(v24, v31);
      }

      [(NSLock *)self->_cacheLock unlock];
    }
    if (v16) {
      goto LABEL_30;
    }
  }
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000F1CE0;
  v50[3] = &unk_1001B3448;
  v50[4] = self;
  id v51 = v7;
  [(VOTElementFetcher *)self performAsyncBlock:v50 forThreadKey:self->_fillerThreadKey];

  int v42 = 0;
LABEL_31:
  [(NSLock *)self->_cacheLock lock];
  id v32 = [(NSMutableArray *)self->_elementCache mutableCopy];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v33 = v32;
  id v34 = [v33 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v47;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(v33);
        }
        double v38 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v38 isAccessibilityOpaqueElementProvider]
          && (!v7 || ([v38 isAccessibleGroup] & 1) == 0))
        {
          double v39 = [v38 visibleOpaqueElements];
          if ([v39 count])
          {
            id v40 = [(NSMutableArray *)self->_elementCache indexOfObject:v38];
            if (v40 != (id)0x7FFFFFFFFFFFFFFFLL) {
              -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_elementCache, "replaceObjectsInRange:withObjectsFromArray:", v40, 1, v39);
            }
          }
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v35);
  }

  [(NSLock *)self->_cacheLock unlock];
  uint64_t v41 = VOTLogElement();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_100123DB8(v42, v41);
  }

  [(VOTElementFetcher *)self _informDelegateOfRetrieveElements];
  id v6 = v45;
LABEL_49:
}

- (void)retrieveElementsWithElement:(id)a3 groupNavigationStyle:(BOOL)a4
{
  if (!self->_retrievingAllElements)
  {
    BOOL v4 = a4;
    self->_retrievingAllElements = 1;
    id v6 = a3;
    [(VOTElementFetcher *)self _informDelegateOfRetrieveElements];
    fillerThread = self->_fillerThread;
    id v8 = +[NSNumber numberWithBool:v4];
    -[SCRCThread performSelector:onTarget:cancelMask:count:objects:](fillerThread, "performSelector:onTarget:cancelMask:count:objects:", "_retrieveElementsWithElement:groupNavigationStyle:", self, 1, 2, v6, v8);
  }
}

- (id)_debugElementCache
{
  [(NSLock *)self->_cacheLock lock];
  id v3 = [(NSMutableArray *)self->_elementCache copy];
  [(NSLock *)self->_cacheLock unlock];

  return v3;
}

- (void)fillCacheWithElements:(id)a3
{
  cacheLock = self->_cacheLock;
  id v5 = a3;
  [(NSLock *)cacheLock lock];
  [(NSMutableArray *)self->_elementCache removeAllObjects];
  elementCache = self->_elementCache;
  id v7 = +[NSNull null];
  [(NSMutableArray *)elementCache addObject:v7];

  [(NSMutableArray *)self->_elementCache addObjectsFromArray:v5];
  id v8 = self->_elementCache;
  uint64_t v9 = +[NSNull null];
  [(NSMutableArray *)v8 addObject:v9];

  [(NSLock *)self->_cacheLock unlock];

  [(VOTElementFetcher *)self setShouldPerformSearchSynchronously:1];
}

- (VOTElementFetchDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTElementFetchDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldPerformSearchSynchronously
{
  return self->_shouldPerformSearchSynchronously;
}

- (void)setShouldPerformSearchSynchronously:(BOOL)a3
{
  self->_shouldPerformSearchSynchronouslCGFloat y = a3;
}

- (BOOL)triggerSignpostCollection
{
  return self->_triggerSignpostCollection;
}

- (void)setTriggerSignpostCollection:(BOOL)a3
{
  self->_triggerSignpostCollection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_opaqueElementCache, 0);
  objc_storeStrong((id *)&self->_countGenerationQueue, 0);
  objc_storeStrong((id *)&self->_searchGenerationQueue, 0);
  objc_storeStrong((id *)&self->_currentElement, 0);
  objc_storeStrong((id *)&self->_elementCache, 0);
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_fillerThreadKey, 0);

  objc_storeStrong((id *)&self->_fillerThread, 0);
}

@end