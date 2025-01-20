@interface NSMetadataQuery
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (Class)_stitchingClass;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3;
+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3;
+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4;
+ (void)didEndPossibleFileOperation:(id)a3;
- (BOOL)_canModifyQueryOrObserversInCurrentContext;
- (BOOL)_isMDQuery;
- (BOOL)isGathering;
- (BOOL)isStarted;
- (BOOL)isStopped;
- (BOOL)startQuery;
- (NSArray)groupedResults;
- (NSArray)groupingAttributes;
- (NSArray)results;
- (NSArray)searchItems;
- (NSArray)searchScopes;
- (NSArray)sortDescriptors;
- (NSArray)valueListAttributes;
- (NSDictionary)valueLists;
- (NSMetadataQuery)init;
- (NSOperationQueue)operationQueue;
- (NSPredicate)predicate;
- (NSTimeInterval)notificationBatchingInterval;
- (NSUInteger)indexOfResult:(id)result;
- (NSUInteger)resultCount;
- (id)_allAttributes;
- (id)_externalDocumentsBundleIdentifier;
- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4;
- (id)_queryString;
- (id)_sortingAttributes;
- (id)delegate;
- (id)resultAtIndex:(NSUInteger)idx;
- (id)valueOfAttribute:(NSString *)attrName forResultAtIndex:(NSUInteger)idx;
- (void)_disableAutoUpdates;
- (void)_enableAutoUpdates;
- (void)_inOriginalContextInvokeBlock:(id)a3;
- (void)_noteNote1:(id)a3;
- (void)_noteNote2:(id)a3;
- (void)_noteNote3:(id)a3;
- (void)_noteNote4:(id)a3;
- (void)_postNotificationName:(id)a3 userInfo:(id)a4;
- (void)_recreateQuery;
- (void)_resetQueryState;
- (void)_setBatchingParams;
- (void)_setExternalDocumentsBundleIdentifier:(id)a3;
- (void)_update;
- (void)_validateInvocationContext;
- (void)_validatePredicate:(id)a3 withScopes:(id)a4;
- (void)_zapResultArrayIfIdenticalTo:(id)a3;
- (void)dealloc;
- (void)disableUpdates;
- (void)enableUpdates;
- (void)enumerateResultsUsingBlock:(void *)block;
- (void)enumerateResultsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setDelegate:(id)delegate;
- (void)setGroupingAttributes:(NSArray *)groupingAttributes;
- (void)setNotificationBatchingInterval:(NSTimeInterval)notificationBatchingInterval;
- (void)setOperationQueue:(NSOperationQueue *)operationQueue;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setSearchItems:(NSArray *)searchItems;
- (void)setSearchScopes:(NSArray *)searchScopes;
- (void)setSortDescriptors:(NSArray *)sortDescriptors;
- (void)setValueListAttributes:(NSArray *)valueListAttributes;
- (void)stopQuery;
@end

@implementation NSMetadataQuery

+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3
{
  v4 = (void *)[a1 _stitchingClass];

  return (id)[v4 willBeginPossibleCreationOfItemAtURL:a3];
}

+ (Class)_stitchingClass
{
  if (qword_1EB1ED000 != -1) {
    dispatch_once(&qword_1EB1ED000, &__block_literal_global_25);
  }
  return (Class)qword_1EB1ECFF8;
}

uint64_t __55__NSMetadataQuery_NSMetadataStitching___stitchingClass__block_invoke()
{
  qword_1EB1ECFF8 = (uint64_t)objc_lookUpClass("BRQuery");
  uint64_t result = objc_opt_respondsToSelector();
  if ((result & 1) == 0) {
    qword_1EB1ECFF8 = 0;
  }
  return result;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA80] set];
  if (([a3 isEqualToString:@"resultCount"] & 1) != 0
    || ([a3 isEqualToString:@"valueLists"] & 1) != 0
    || [a3 isEqualToString:@"groupedResults"])
  {
    [v5 addObject:@"results"];
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NSMetadataQuery;
  objc_msgSend(v5, "unionSet:", objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_, a3));
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (NSMetadataQuery)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSMetadataQuery;
  v2 = [(NSMetadataQuery *)&v4 init];
  if (qword_1EB1ED008 != -1) {
    dispatch_once(&qword_1EB1ED008, &__block_literal_global_646);
  }
  if (_MergedGlobals_7)
  {
    v2->_interval = 1.0;
    v2->_private[10] = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_private[1] = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_private[2] = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_private[3] = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_reserved = objc_alloc_init(_NSMetadataQueryPrivateIvars);
    LODWORD(v2->_flags) = v2->_flags & 0xFFFFFFE7 | 8;
  }
  else
  {

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];

  id v3 = self->_private[5];
  if (v3)
  {
    if ((self->_flags & 2) == 0)
    {
      [v3 stop];
      int flags = self->_flags;
      LODWORD(self->_flags) = flags | 2;
      if (flags)
      {
        if ([(NSMetadataQuery *)self operationQueue]
          || (id v5 = self->_private[9], v5 != (id)[MEMORY[0x1E4F1CAC0] currentRunLoop])
          || _CFExecutableLinkedOnOrAfter())
        {
          if ([(NSMetadataQuery *)self operationQueue]) {
            NSLog((NSString *)@"%@ is being deallocated without first calling -stopQuery. To avoid race conditions, you should first invoke -stopQuery on self.operationQueue.", self);
          }
          else {
            NSLog((NSString *)@"%@ is being deallocated without first calling -stopQuery. To avoid race conditions, you should first invoke -stopQuery on the run loop on which -startQuery was called", self);
          }
        }
      }
    }
    uint64_t v6 = [self->_private[5] resultCount];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        v9 = (void *)[self->_private[5] resultAtIndex:i];
        if (objc_opt_isKindOfClass()) {
          [v9 _setQuery:0];
        }
      }
    }
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"__kMDQueryWillChangeNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryProgressNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryDidUpdateNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryDidFinishNotification" object:self->_private[5]];

    self->_private[5] = 0;
  }

  self->_private[8] = 0;
  v10.receiver = self;
  v10.super_class = (Class)NSMetadataQuery;
  [(NSMetadataQuery *)&v10 dealloc];
}

- (BOOL)_canModifyQueryOrObserversInCurrentContext
{
  if ((self->_flags & 3) != 1) {
    return 1;
  }
  if ([(NSMetadataQuery *)self operationQueue])
  {
    id v3 = +[NSOperationQueue currentQueue];
    return v3 == [(NSMetadataQuery *)self operationQueue];
  }
  else
  {
    if (!self->_private[9]) {
      return 0;
    }
    return (id)[MEMORY[0x1E4F1CAC0] currentRunLoop] == self->_private[9];
  }
}

- (void)_validateInvocationContext
{
}

- (id)delegate
{
  return self->_private[8];
}

- (void)setDelegate:(id)delegate
{
  self->_private[8] = delegate;
  if (objc_opt_respondsToSelector()) {
    int v4 = 32;
  }
  else {
    int v4 = 0;
  }
  LODWORD(self->_flags) = self->_flags & 0xFFFFFFDF | v4;
  if (objc_opt_respondsToSelector()) {
    int v5 = 64;
  }
  else {
    int v5 = 0;
  }
  LODWORD(self->_flags) = self->_flags & 0xFFFFFFBF | v5;
}

- (NSPredicate)predicate
{
  id v2 = self->_private[0];

  return (NSPredicate *)v2;
}

- (void)_validatePredicate:(id)a3 withScopes:(id)a4
{
  if (a3 && [a4 count])
  {
    [a3 _validateForMetadataQueryScopes:a4];
  }
}

- (void)setPredicate:(NSPredicate *)predicate
{
  if (self->_private[0] != predicate)
  {
    [(NSMetadataQuery *)self _validateInvocationContext];
    [(NSMetadataQuery *)self _validatePredicate:predicate withScopes:self->_private[10]];
    [(NSMetadataQuery *)self willChangeValueForKey:@"predicate"];

    self->_private[0] = [(NSPredicate *)predicate copyWithZone:0];
    [(NSMetadataQuery *)self didChangeValueForKey:@"predicate"];
    if ((self->_flags & 3) == 1)
    {
      [(NSMetadataQuery *)self _recreateQuery];
    }
  }
}

- (NSArray)sortDescriptors
{
  id v2 = self->_private[1];

  return (NSArray *)v2;
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  if (self->_private[1] != sortDescriptors)
  {
    [(NSMetadataQuery *)self _validateInvocationContext];
    [(NSMetadataQuery *)self willChangeValueForKey:@"sortDescriptors"];

    self->_private[1] = (id)[(NSArray *)sortDescriptors copy];
    [(NSMetadataQuery *)self didChangeValueForKey:@"sortDescriptors"];
    if ((self->_flags & 3) == 1)
    {
      [(NSMetadataQuery *)self _recreateQuery];
    }
  }
}

- (NSArray)valueListAttributes
{
  id v2 = self->_private[2];

  return (NSArray *)v2;
}

- (void)setValueListAttributes:(NSArray *)valueListAttributes
{
  if (self->_private[2] != valueListAttributes)
  {
    [(NSMetadataQuery *)self willChangeValueForKey:@"valueListAttributes"];

    self->_private[2] = (id)[(NSArray *)valueListAttributes copy];
    [(NSMetadataQuery *)self didChangeValueForKey:@"valueListAttributes"];
    if ((self->_flags & 3) == 1)
    {
      [(NSMetadataQuery *)self _recreateQuery];
    }
  }
}

- (NSArray)groupingAttributes
{
  id v2 = self->_private[3];

  return (NSArray *)v2;
}

- (void)setGroupingAttributes:(NSArray *)groupingAttributes
{
  if (self->_private[3] != groupingAttributes)
  {
    [(NSMetadataQuery *)self _validateInvocationContext];
    [(NSMetadataQuery *)self willChangeValueForKey:@"groupingAttributes"];

    self->_private[3] = (id)[(NSArray *)groupingAttributes copy];
    [(NSMetadataQuery *)self didChangeValueForKey:@"groupingAttributes"];
    if ((self->_flags & 3) == 1)
    {
      [(NSMetadataQuery *)self _recreateQuery];
    }
  }
}

- (id)_sortingAttributes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_private[1];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "key"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)_allAttributes
{
  id v3 = [(NSMetadataQuery *)self valueListAttributes];
  id v4 = [(NSMetadataQuery *)self groupingAttributes];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = v5;
  if (v3) {
    [v5 addObjectsFromArray:v3];
  }
  if (v4) {
    [v6 addObjectsFromArray:v4];
  }
  objc_msgSend(v6, "addObjectsFromArray:", -[NSMetadataQuery _sortingAttributes](self, "_sortingAttributes"));
  return v6;
}

- (NSTimeInterval)notificationBatchingInterval
{
  return self->_interval;
}

- (void)setNotificationBatchingInterval:(NSTimeInterval)notificationBatchingInterval
{
  if (self->_interval != notificationBatchingInterval)
  {
    [(NSMetadataQuery *)self _validateInvocationContext];
    [(NSMetadataQuery *)self willChangeValueForKey:@"notificationBatchingInterval"];
    self->_interval = notificationBatchingInterval;
    [(NSMetadataQuery *)self _setBatchingParams];
    [(NSMetadataQuery *)self didChangeValueForKey:@"notificationBatchingInterval"];
  }
}

- (NSArray)searchScopes
{
  id v2 = self->_private[10];

  return (NSArray *)v2;
}

- (void)setSearchScopes:(NSArray *)searchScopes
{
  if (self->_private[10] != searchScopes)
  {
    [(NSMetadataQuery *)self _validateInvocationContext];
    [(NSMetadataQuery *)self _validatePredicate:self->_private[0] withScopes:searchScopes];
    [(NSMetadataQuery *)self willChangeValueForKey:@"searchScopes"];

    self->_private[10] = (id)[(NSArray *)searchScopes copy];
    [(NSMetadataQuery *)self didChangeValueForKey:@"searchScopes"];
    if (!self->_private[0]) {
      [(NSMetadataQuery *)self setPredicate:+[NSPredicate predicateWithValue:1]];
    }
    if ((self->_flags & 3) == 1)
    {
      [(NSMetadataQuery *)self _recreateQuery];
    }
  }
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getAssociatedObject(self, sel_operationQueue);
}

- (void)setOperationQueue:(NSOperationQueue *)operationQueue
{
  if ([(NSMetadataQuery *)self operationQueue] != operationQueue)
  {
    [(NSMetadataQuery *)self willChangeValueForKey:@"operationQueue"];
    id v5 = self->_private[5];
    if (v5) {
      [v5 setQueryQueue:operationQueue];
    }
    objc_setAssociatedObject(self, sel_operationQueue, operationQueue, (void *)0x301);
    [(NSMetadataQuery *)self didChangeValueForKey:@"operationQueue"];
  }
}

- (NSArray)searchItems
{
  return (NSArray *)objc_getAssociatedObject(self, sel_searchItems);
}

- (void)setSearchItems:(NSArray *)searchItems
{
  if ([(NSMetadataQuery *)self searchItems] != searchItems)
  {
    [(NSMetadataQuery *)self _validateInvocationContext];
    [(NSMetadataQuery *)self willChangeValueForKey:@"searchItems"];
    [(NSMetadataQuery *)self willChangeValueForKey:@"searchItemURLs"];
    objc_setAssociatedObject(self, sel_searchItems, searchItems, (void *)0x303);
    [(NSMetadataQuery *)self didChangeValueForKey:@"searchItemURLs"];
    [(NSMetadataQuery *)self didChangeValueForKey:@"searchItems"];
    if ((self->_flags & 3) == 1)
    {
      [(NSMetadataQuery *)self _recreateQuery];
    }
  }
}

- (id)_externalDocumentsBundleIdentifier
{
  return objc_getAssociatedObject(self, sel__externalDocumentsBundleIdentifier);
}

- (void)_setExternalDocumentsBundleIdentifier:(id)a3
{
  [(NSMetadataQuery *)self _validateInvocationContext];
  objc_setAssociatedObject(self, sel__externalDocumentsBundleIdentifier, a3, (void *)0x301);
  if ((self->_flags & 3) == 1)
  {
    [(NSMetadataQuery *)self _recreateQuery];
  }
}

- (void)_setBatchingParams
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = self->_private[5];
  if (v3)
  {
    unint64_t v4 = (unint64_t)(self->_interval * 1000.0);
    long long v5 = xmmword_182307660;
    uint64_t v6 = 50000;
    unint64_t v7 = v4;
    uint64_t v8 = 50000;
    unint64_t v9 = v4;
    [v3 setBatchingParameters:&v5];
  }
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  [(NSMetadataQuery *)self operationQueue];
  unint64_t v7 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v7 postNotificationName:a3 object:self userInfo:a4];
}

- (void)_noteNote1:(id)a3
{
  int flags = self->_flags;
  if ((flags & 0x80) == 0)
  {
    [(NSMetadataQuery *)self willChangeValueForKey:@"results"];
    int flags = self->_flags;
  }
  LODWORD(self->_flags) = flags | 0x80;
}

- (void)_noteNote2:(id)a3
{
  LODWORD(self->_flags) &= ~0x80u;
  [(NSMetadataQuery *)self didChangeValueForKey:@"results"];
  uint64_t v5 = [a3 userInfo];

  [(NSMetadataQuery *)self _postNotificationName:@"NSMetadataQueryGatheringProgressNotification" userInfo:v5];
}

- (void)_noteNote3:(id)a3
{
  LODWORD(self->_flags) &= ~0x80u;
  [(NSMetadataQuery *)self didChangeValueForKey:@"results"];
  uint64_t v5 = [a3 userInfo];

  [(NSMetadataQuery *)self _postNotificationName:@"NSMetadataQueryDidUpdateNotification" userInfo:v5];
}

- (void)_noteNote4:(id)a3
{
  id v3 = self;
  int flags = self->_flags;
  if ((flags & 0x80) != 0)
  {
    LODWORD(self->_flags) = flags & 0xFFFFFF7F;
    [(NSMetadataQuery *)self didChangeValueForKey:@"results"];
  }
  [(NSMetadataQuery *)self willChangeValueForKey:@"isGathering"];
  LODWORD(self->_flags) &= ~4u;
  [(NSMetadataQuery *)self didChangeValueForKey:@"isGathering"];
  [(NSMetadataQuery *)self _postNotificationName:@"NSMetadataQueryDidFinishGatheringNotification" userInfo:0];
  [(NSMetadataQuery *)self willChangeValueForKey:@"results"];
  LODWORD(self->_flags) |= 0x80u;
}

- (id)_queryString
{
  return (id)[self->_private[0] generateMetadataDescription];
}

- (void)_resetQueryState
{
  int flags = self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    [(NSMetadataQuery *)self willChangeValueForKey:@"isStarted"];
    LODWORD(self->_flags) &= ~1u;
    [(NSMetadataQuery *)self didChangeValueForKey:@"isStarted"];
    if ((self->_flags & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  [(NSMetadataQuery *)self willChangeValueForKey:@"isStopped"];
  LODWORD(self->_flags) &= ~2u;
  [(NSMetadataQuery *)self didChangeValueForKey:@"isStopped"];
  int flags = self->_flags;
  if (flags) {
    goto LABEL_6;
  }
LABEL_3:
  if ((flags & 4) == 0) {
    return;
  }
LABEL_7:
  [(NSMetadataQuery *)self willChangeValueForKey:@"isGathering"];
  LODWORD(self->_flags) &= ~4u;

  [(NSMetadataQuery *)self didChangeValueForKey:@"isGathering"];
}

- (void)_recreateQuery
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = self->_private[5];
  if (v3)
  {
    if ((self->_flags & 0x80) == 0)
    {
      [(NSMetadataQuery *)self willChangeValueForKey:@"results"];
      LODWORD(self->_flags) |= 0x80u;
      id v3 = self->_private[5];
    }
    [v3 stop];
    objc_sync_enter(self);
    if (*((void *)self->_reserved + 1))
    {
      [(NSMetadataQuery *)self _disableAutoUpdates];
      *((void *)self->_reserved + 1) = 0;
      unsigned int flags = self->_flags;
      BOOL v5 = flags >= 0x10000;
      unsigned int v6 = flags - 0x10000;
      if (v5) {
        LODWORD(self->_flags) = v6;
      }
    }
    objc_sync_exit(self);
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"__kMDQueryWillChangeNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryProgressNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryDidUpdateNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryDidFinishNotification" object:self->_private[5]];

    self->_private[5] = 0;
    [(NSMetadataQuery *)self didChangeValueForKey:@"results"];
    LODWORD(self->_flags) &= ~0x80u;
  }
  if (!self->_private[0])
  {
    [(NSMetadataQuery *)self _resetQueryState];
    return;
  }
  unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[NSMetadataQuery _sortingAttributes](self, "_sortingAttributes"));
  uint64_t v8 = v7;
  if (self->_private[3]) {
    objc_msgSend(v7, "addObjectsFromArray:");
  }
  v22 = v8;
  unint64_t v9 = [(NSMetadataQuery *)self searchItems];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
    if (!v12) {
      goto LABEL_28;
    }
    uint64_t v13 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = (id)[objc_alloc(objc_lookUpClass("BRItem")) initWithURL:v15];
        }
        else if (_NSIsNSString())
        {
          id v16 = (id)objc_msgSend(objc_alloc(objc_lookUpClass("BRItem")), "initWithURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v15));
        }
        else
        {
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v16 = (id)[v15 _item];
        }
        v17 = v16;
        if (v16)
        {
          [v11 addObject:v16];
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (!v12)
      {
LABEL_28:
        self->_private[5] = (id)[objc_alloc(objc_lookUpClass("BRQuery")) initWithQuery:self values:self->_private[2] sortingAttributes:v22 items:v11];

        id v18 = self->_private[5];
        if (v18) {
          goto LABEL_29;
        }
LABEL_48:
        [(NSMetadataQuery *)self _resetQueryState];
        return;
      }
    }
  }
  id v18 = (id)[objc_alloc(objc_lookUpClass("BRQuery")) initWithQuery:self values:self->_private[2] sortingAttributes:v8 items:0];
  self->_private[5] = v18;
  if (!v18) {
    goto LABEL_48;
  }
LABEL_29:
  v23[0] = xmmword_1ECA5C088;
  v23[1] = *(_OWORD *)&off_1ECA5C098;
  v24 = off_1ECA5C0A8;
  [v18 setCreateResultFunction:__NSMetadataCreateResult withContext:self callbacks:v23];
  [self->_private[5] setCreateValueFunction:__NSMetadataCreateValue withContext:self callbacks:v23];
  if ([self->_private[1] count]) {
    [self->_private[5] setSortComparator:__NSMetadataSortCompare withContext:self];
  }
  if ([self->_private[10] count]) {
    [self->_private[5] setSearchScope:self->_private[10] withOptions:0];
  }
  v19 = [(NSMetadataQuery *)self operationQueue];
  if (v19) {
    [self->_private[5] setQueryQueue:v19];
  }
  [(NSMetadataQuery *)self _setBatchingParams];
  if (LODWORD(self->_flags) >= 0x10000) {
    [self->_private[5] disableUpdates];
  }
  if ([self->_private[10] containsObject:@"NSMetadataQueryExternalDocumentsScope"])
  {
    id v20 = self->_private[5];
    id v21 = [(NSMetadataQuery *)self _externalDocumentsBundleIdentifier];
    if (objc_opt_respondsToSelector()) {
      [v20 performSelector:sel_setExternalDocumentsBundleIdentifier_ withObject:v21];
    }
  }
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:sel__noteNote1_ name:@"__kMDQueryWillChangeNotification" object:self->_private[5]];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:sel__noteNote2_ name:@"kMDQueryProgressNotification" object:self->_private[5]];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:sel__noteNote3_ name:@"kMDQueryDidUpdateNotification" object:self->_private[5]];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:sel__noteNote4_ name:@"kMDQueryDidFinishNotification" object:self->_private[5]];

  self->_private[9] = 0;
  if ([self->_private[5] executeWithOptions:0])
  {
    if (!v19) {
      self->_private[9] = (id)[MEMORY[0x1E4F1CAC0] currentRunLoop];
    }
    [(NSMetadataQuery *)self willChangeValueForKey:@"isGathering"];
    LODWORD(self->_flags) |= 4u;
    [(NSMetadataQuery *)self didChangeValueForKey:@"isGathering"];
    [(NSMetadataQuery *)self _postNotificationName:@"NSMetadataQueryDidStartGatheringNotification" userInfo:0];
  }
  else
  {
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"__kMDQueryWillChangeNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryProgressNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryDidUpdateNotification" object:self->_private[5]];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kMDQueryDidFinishNotification" object:self->_private[5]];

    self->_private[5] = 0;
    [(NSMetadataQuery *)self _resetQueryState];
  }
}

- (BOOL)startQuery
{
  if (!self->_private[0]) {
    return 0;
  }
  if ((self->_flags & 3) == 1) {
    return 0;
  }
  [(NSMetadataQuery *)self _recreateQuery];
  if (!self->_private[5]) {
    return 0;
  }
  int flags = self->_flags;
  if ((flags & 2) != 0)
  {
    [(NSMetadataQuery *)self willChangeValueForKey:@"isStopped"];
    LODWORD(self->_flags) &= ~2u;
    [(NSMetadataQuery *)self didChangeValueForKey:@"isStopped"];
    int flags = self->_flags;
  }
  if ((flags & 1) == 0)
  {
    [(NSMetadataQuery *)self willChangeValueForKey:@"isStarted"];
    LODWORD(self->_flags) |= 1u;
    [(NSMetadataQuery *)self didChangeValueForKey:@"isStarted"];
  }
  return 1;
}

- (void)_inOriginalContextInvokeBlock:(id)a3
{
  if ([(NSMetadataQuery *)self operationQueue])
  {
    BOOL v5 = +[NSOperationQueue currentQueue];
    if (v5 != [(NSMetadataQuery *)self operationQueue])
    {
      unsigned int v6 = [(NSMetadataQuery *)self operationQueue];
      [(NSOperationQueue *)v6 addOperationWithBlock:a3];
      return;
    }
    goto LABEL_11;
  }
  if (!self->_private[9]
    || (uint64_t v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop], v8 = self->_private[9], (id)v7 == v8))
  {
LABEL_11:
    uint64_t v10 = (void (*)(id))*((void *)a3 + 2);
    v10(a3);
    return;
  }
  unint64_t v9 = (__CFRunLoop *)[v8 getCFRunLoop];
  CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x1E4F1D418], a3);

  CFRunLoopWakeUp(v9);
}

- (void)stopQuery
{
  v3[5] = *MEMORY[0x1E4F143B8];
  if (self->_private[5])
  {
    if ((self->_flags & 2) == 0)
    {
      [(NSMetadataQuery *)self willChangeValueForKey:@"isStopped"];
      [self->_private[5] stop];
      LODWORD(self->_flags) |= 2u;
      [(NSMetadataQuery *)self didChangeValueForKey:@"isStopped"];
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __28__NSMetadataQuery_stopQuery__block_invoke;
      v3[3] = &unk_1E51F71D0;
      v3[4] = self;
      [(NSMetadataQuery *)self _inOriginalContextInvokeBlock:v3];
    }
  }
}

uint64_t __28__NSMetadataQuery_stopQuery__block_invoke(uint64_t a1)
{
  id v2 = *(_DWORD **)(a1 + 32);
  int v3 = v2[2];
  if ((v3 & 4) != 0)
  {
    [v2 willChangeValueForKey:@"isGathering"];
    *(_DWORD *)(*(void *)(a1 + 32) + 8) &= ~4u;
    [*(id *)(a1 + 32) didChangeValueForKey:@"isGathering"];
    id v2 = *(_DWORD **)(a1 + 32);
    int v3 = v2[2];
  }
  if ((v3 & 0x80) != 0)
  {
    v2[2] = v3 & 0xFFFFFF7F;
    [*(id *)(a1 + 32) didChangeValueForKey:@"results"];
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:*(void *)(a1 + 32) name:@"__kMDQueryWillChangeNotification" object:*(void *)(*(void *)(a1 + 32) + 64)];
  [+[NSNotificationCenter defaultCenter] removeObserver:*(void *)(a1 + 32) name:@"kMDQueryProgressNotification" object:*(void *)(*(void *)(a1 + 32) + 64)];
  [+[NSNotificationCenter defaultCenter] removeObserver:*(void *)(a1 + 32) name:@"kMDQueryDidUpdateNotification" object:*(void *)(*(void *)(a1 + 32) + 64)];
  unint64_t v4 = +[NSNotificationCenter defaultCenter];

  return -[NSNotificationCenter removeObserver:name:object:](v4, "removeObserver:name:object:");
}

- (BOOL)isStarted
{
  return self->_flags & 1;
}

- (BOOL)isGathering
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isStopped
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)disableUpdates
{
  int v2 = WORD1(self->_flags) << 16;
  WORD1(self->_flags) = (v2 + 0x10000) >> 16;
  if (!v2)
  {
    id v3 = self->_private[5];
    if (v3) {
      [v3 disableUpdates];
    }
  }
}

- (void)enableUpdates
{
  unsigned int flags = self->_flags;
  if (flags >= 0x10000)
  {
    LODWORD(self->_flags) = ((self->_flags & 0xFFFF0000) - 0x10000) & 0xFFFF0000 | (unsigned __int16)LODWORD(self->_flags);
    if ((flags & 0xFFFF0000) == 0x10000)
    {
      id v3 = self->_private[5];
      if (v3) {
        [v3 enableUpdates];
      }
    }
  }
}

- (void)_disableAutoUpdates
{
  id v3 = self->_private[4];
  if (v3)
  {
    [v3 invalidate];

    self->_private[4] = 0;
  }
  else
  {
    id v4 = self->_private[5];
    if (v4)
    {
      [v4 setSendHasUpdateNotification:0];
      BOOL v5 = +[NSNotificationCenter defaultCenter];
      id v6 = self->_private[5];
      [(NSNotificationCenter *)v5 removeObserver:self name:@"kMDQueryHasUpdateNotification" object:v6];
    }
  }
}

- (void)_enableAutoUpdates
{
  if (self->_private[5])
  {
    if (objc_opt_respondsToSelector())
    {
      [+[NSNotificationCenter defaultCenter] addObserver:self selector:sel__noteNote5_ name:@"kMDQueryHasUpdateNotification" object:self->_private[5]];
      id v3 = self->_private[5];
      [v3 setSendHasUpdateNotification:1];
    }
    else
    {
      self->_private[4] = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__update selector:0 userInfo:1 repeats:0.1];
    }
  }
}

- (void)_update
{
  if (LODWORD(self->_flags) >= 0x10000 && self->_private[5])
  {
    objc_sync_enter(self);
    id v3 = *((id *)self->_reserved + 1);
    objc_sync_exit(self);
    [self->_private[5] enableUpdates];
    [self->_private[5] processUpdates];
    [self->_private[5] disableUpdates];
  }
}

- (NSUInteger)resultCount
{
  NSUInteger result = (NSUInteger)self->_private[5];
  if (result) {
    return [(id)result resultCount];
  }
  return result;
}

- (id)resultAtIndex:(NSUInteger)idx
{
  id v6 = self->_private[5];
  if (!v6 || [v6 resultCount] <= (uint64_t)idx)
  {
    unint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQuery resultCount](self, "resultCount")), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  id v7 = self->_private[5];

  return (id)[v7 resultAtIndex:idx];
}

- (void)enumerateResultsUsingBlock:(void *)block
{
  if (!block)
  {
    id v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v4);
  }
  [(NSMetadataQuery *)self enumerateResultsWithOptions:0 usingBlock:block];
}

- (void)enumerateResultsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  if (!block)
  {
    id v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  [(NSMetadataQuery *)self disableUpdates];
  id v7 = [_NSMetadataQueryResultArray alloc];
  if (v7) {
    v7->_query = self;
  }
  [(_NSMetadataQueryResultArray *)v7 enumerateObjectsWithOptions:opts usingBlock:block];

  [(NSMetadataQuery *)self enableUpdates];
}

- (void)_zapResultArrayIfIdenticalTo:(id)a3
{
  if (*((id *)self->_reserved + 1) == a3)
  {
    [(NSMetadataQuery *)self _disableAutoUpdates];
    *((void *)self->_reserved + 1) = 0;
    [(NSMetadataQuery *)self enableUpdates];
  }
}

- (NSArray)results
{
  if (self->_private[5])
  {
    objc_sync_enter(self);
    uint64_t v3 = (void *)*((void *)self->_reserved + 1);
    if (!v3)
    {
      [(NSMetadataQuery *)self disableUpdates];
      id v4 = [_NSMetadataQueryResultArray alloc];
      if (v4) {
        v4->_query = self;
      }
      *((void *)self->_reserved + 1) = v4;
      [(NSMetadataQuery *)self _enableAutoUpdates];
      uint64_t v3 = (void *)*((void *)self->_reserved + 1);
    }
    id v5 = v3;
    objc_sync_exit(self);
    return (NSArray *)v5;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v7 array];
  }
}

- (NSUInteger)indexOfResult:(id)result
{
  id v3 = self->_private[5];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v4 = [v3 indexOfResult:result];
  if (v4 == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (NSDictionary)valueLists
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_private[5])
  {
    id v20 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = self->_private[2];
    uint64_t v21 = [obj countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v30;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v3;
          uint64_t v4 = *(void *)(*((void *)&v29 + 1) + 8 * v3);
          id v5 = (void *)[MEMORY[0x1E4F1CA48] array];
          id v6 = objc_msgSend((id)objc_msgSend(self->_private[5], "valuesOfAttribute:", v4), "copy");
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v23 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v25 != v9) {
                  objc_enumerationMutation(v6);
                }
                id v11 = -[NSMetadataQueryAttributeValueTuple _init:attribute:value:count:]([NSMetadataQueryAttributeValueTuple alloc], "_init:attribute:value:count:", self, v4, *(void *)(*((void *)&v24 + 1) + 8 * i), [self->_private[5] countOfResultsForAttributeName:v4 value:*(void *)(*((void *)&v24 + 1) + 8 * i)]);
                [v5 addObject:v11];
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v23 count:16];
            }
            while (v8);
          }
          if (v6) {
            CFRelease(v6);
          }
          uint64_t v12 = [self->_private[5] countOfResultsForAttributeName:v4 value:0];
          if (v12 >= 1)
          {
            uint64_t v13 = v12;
            long long v14 = [NSMetadataQueryAttributeValueTuple alloc];
            id v15 = -[NSMetadataQueryAttributeValueTuple _init:attribute:value:count:](v14, "_init:attribute:value:count:", self, v4, [MEMORY[0x1E4F1CA98] null], v13);
            [v5 addObject:v15];
          }
          [v20 addObject:v5];
          uint64_t v3 = v22 + 1;
        }
        while (v22 + 1 != v21);
        uint64_t v21 = [obj countByEnumeratingWithState:&v29 objects:v28 count:16];
      }
      while (v21);
    }
    return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:self->_private[2]];
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    return (NSDictionary *)[v17 dictionary];
  }
}

- (NSArray)groupedResults
{
  if (self->_private[5] && [self->_private[3] count])
  {
    uint64_t v3 = [(NSMetadataQuery *)self resultCount];
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [self->_private[3] objectAtIndex:0];
    if (v3 >= 1)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v3; ++i)
      {
        id v8 = [(NSMetadataQuery *)self valueOfAttribute:v6 forResultAtIndex:i];
        if (!v8) {
          id v8 = (id)[MEMORY[0x1E4F1CA98] null];
        }
        id v9 = (id)[v4 objectForKey:v8];
        if (!v9)
        {
          id v9 = [[NSMetadataQueryResultGroup alloc] _init:self attributes:self->_private[3] index:0 value:v8];
          [v4 setObject:v9 forKey:v8];
        }
        [v9 _addResult:i];
      }
    }
    return (NSArray *)[v4 allValues];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v11 array];
  }
}

- (id)valueOfAttribute:(NSString *)attrName forResultAtIndex:(NSUInteger)idx
{
  if (attrName == (NSString *)@"NSMetadataQueryResultContentRelevanceAttribute") {
    uint64_t v7 = (NSString *)@"kMDQueryResultContentRelevance";
  }
  else {
    uint64_t v7 = attrName;
  }
  id v8 = self->_private[5];
  if (!v8 || [v8 resultCount] <= (uint64_t)idx)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQuery resultCount](self, "resultCount")), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  id result = (id)[self->_private[5] attributeValueForName:v7 forResultAtIndex:idx];
  id v10 = result;
  if ((self->_flags & 0x40) != 0)
  {
    id v11 = self->_private[8];
    return (id)[v11 metadataQuery:self replacementValueForAttribute:v7 value:v10];
  }
  return result;
}

- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"results"]
    && [(NSMetadataQuery *)self operationQueue])
  {
    id result = (id)*((void *)self->_reserved + 2);
    if (result) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v4;
    }
    if (!v8)
    {
      *((void *)self->_reserved + 2) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &NSKVOPendingNotificationStackIdentifierCallbacks, MEMORY[0x1E4F1D540]);
      return (id)*((void *)self->_reserved + 2);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSMetadataQuery;
    return [(NSMetadataQuery *)&v9 _pendingChangeNotificationsArrayForKey:a3 create:v4];
  }
  return result;
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:@"results"]
    && ![(NSMetadataQuery *)self _canModifyQueryOrObserversInCurrentContext])
  {
    if ([(NSMetadataQuery *)self operationQueue])
    {
      uint64_t v7 = +[NSOperationQueue currentQueue];
      BOOL v8 = [(NSOperationQueue *)v7 name];
      if (![(NSString *)v8 length])
      {
        label = dispatch_queue_get_label(0);
        if (label) {
          BOOL v8 = +[NSString stringWithUTF8String:label];
        }
      }
      if (![(NSString *)v8 length])
      {
        if (v7) {
          BOOL v8 = [(NSOperationQueue *)v7 description];
        }
        else {
          BOOL v8 = (NSString *)@"an unknown queue";
        }
      }
      NSLog((NSString *)@"%@: A Key-Value Observer of NSMetadataQuery.results for this instance was removed, while the query was still running, on %@ instead of NSMetadataQuery.operationQueue, which is %@. To avoid race conditions, you should either ensure the query is stopped before removing observers, or remove them on the NSMetadataQuery.operationQueue", self, v8, [(NSMetadataQuery *)self operationQueue]);
    }
    else
    {
      NSLog((NSString *)@"%@: A Key-Value Observer of NSMetadataQuery.results for this instance was removed, while the query was still running, on NSRunLoop %p instead of the NSRunLoop it was started on, which is %p. To avoid race conditions, you shouuld either ensure the query is stopped before removing observers, or remove them on the same NSRunLoop that the query was started on.", self, [MEMORY[0x1E4F1CAC0] currentRunLoop], self->_private[9]);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)NSMetadataQuery;
  [(NSMetadataQuery *)&v10 removeObserver:a3 forKeyPath:a4];
}

- (BOOL)_isMDQuery
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4
{
  uint64_t v6 = (void *)[a1 _stitchingClass];

  return (id)[v6 willBeginPossibleMoveOfItemAtURL:a3 toURL:a4];
}

+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3
{
  BOOL v4 = (void *)[a1 _stitchingClass];

  return (id)[v4 willBeginPossibleDeletionOfItemAtURL:a3];
}

+ (void)didEndPossibleFileOperation:(id)a3
{
  BOOL v4 = (void *)[a1 _stitchingClass];

  [v4 didEndPossibleFileOperation:a3];
}

@end