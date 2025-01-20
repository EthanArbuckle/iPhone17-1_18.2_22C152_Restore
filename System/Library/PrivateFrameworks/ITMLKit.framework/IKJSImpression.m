@interface IKJSImpression
+ (id)impressionsMapForViewElements:(id)a3 appContext:(id)a4 timestamp:(int64_t)a5;
+ (id)impressionsMapForViewElements:(id)a3 appContext:(id)a4 timestamp:(int64_t)a5 existingImpressionsMap:(id)a6;
- (IKJSImpression)initWithAppContext:(id)a3 data:(id)a4 index:(unint64_t)a5 queueTag:(id)a6;
- (IKJSImpression)parentImpression;
- (NSArray)children;
- (NSArray)timestamps;
- (NSMutableArray)mutableChildren;
- (NSMutableArray)mutableTimestamps;
- (NSString)description;
- (NSString)metricsData;
- (NSString)metricsTag;
- (id)asPrivateIKJSImpression;
- (id)parent;
- (int64_t)indexInParent;
- (void)addChild:(id)a3;
- (void)addTimestamp:(int64_t)a3;
- (void)linkReferences;
- (void)setIndexInParent:(int64_t)a3;
- (void)setMetricsData:(id)a3;
- (void)setMetricsTag:(id)a3;
- (void)setMutableChildren:(id)a3;
- (void)setMutableTimestamps:(id)a3;
- (void)setParentImpression:(id)a3;
@end

@implementation IKJSImpression

- (id)asPrivateIKJSImpression
{
  if ([(IKJSImpression *)self conformsToProtocol:&unk_1F3E56370]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (id)impressionsMapForViewElements:(id)a3 appContext:(id)a4 timestamp:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(id)objc_opt_class() impressionsMapForViewElements:v8 appContext:v7 timestamp:a5 existingImpressionsMap:0];

  return v9;
}

+ (id)impressionsMapForViewElements:(id)a3 appContext:(id)a4 timestamp:(int64_t)a5 existingImpressionsMap:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v55 = a4;
  id v10 = a6;
  unint64_t v11 = 0x1E4F1C000uLL;
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v47 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v57 = v12;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v9;
  uint64_t v51 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v51)
  {
    uint64_t v13 = *(void *)v69;
    uint64_t v48 = *(void *)v69;
    int64_t v49 = a5;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v69 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v14;
        v15 = *(void **)(*((void *)&v68 + 1) + 8 * v14);
        if (objc_msgSend(v15, "isImpressionable", v47))
        {
          id v58 = objc_alloc_init(*(Class *)(v11 + 2656));
          v16 = [v15 impressionableAttributes];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v53 = v16;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v73 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v65 != v19) {
                  objc_enumerationMutation(v53);
                }
                v21 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                v22 = [v53 objectForKey:v21];
                objc_opt_class();
                v23 = _KeyedDictionaryObject(v57, v21);
                v24 = _KeyFromElement(v15);
                v25 = [v23 objectForKey:v24];

                if (!v25)
                {
                  v25 = [[IKJSImpression alloc] initWithAppContext:v55 data:v22 index:_IndexForElement(v15) queueTag:v21];
                  v26 = _KeyFromElement(v15);
                  [v23 setObject:v25 forKey:v26];

                  objc_opt_class();
                  v27 = _KeyedDictionaryObject(v54, v21);
                  [v27 addObject:v25];
                }
                [(IKJSImpression *)v25 addTimestamp:a5];
                [v58 setObject:v25 forKey:v21];

                unint64_t v11 = 0x1E4F1C000uLL;
              }
              uint64_t v18 = [v53 countByEnumeratingWithState:&v64 objects:v73 count:16];
            }
            while (v18);
          }
          uint64_t v28 = [v15 parent];
          v29 = v58;
          if (v28)
          {
            v30 = (void *)v28;
            do
            {
              if ([v30 isImpressionable])
              {
                v31 = [v29 allKeys];
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                id v56 = v31;
                uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v72 count:16];
                if (v32)
                {
                  uint64_t v33 = v32;
                  uint64_t v59 = *(void *)v61;
                  do
                  {
                    for (uint64_t j = 0; j != v33; ++j)
                    {
                      if (*(void *)v61 != v59) {
                        objc_enumerationMutation(v56);
                      }
                      v35 = *(void **)(*((void *)&v60 + 1) + 8 * j);
                      v36 = [v30 impressionableAttributes];
                      v37 = [v36 objectForKey:v35];

                      if (v37)
                      {
                        objc_opt_class();
                        v38 = _KeyedDictionaryObject(v57, v35);
                        v39 = [v29 objectForKey:v35];
                        v40 = _KeyFromElement(v30);
                        v41 = [v38 objectForKey:v40];

                        if (!v41)
                        {
                          v41 = [[IKJSImpression alloc] initWithAppContext:v55 data:v37 index:_IndexForElement(v30) queueTag:v35];
                          v42 = _KeyFromElement(v30);
                          [v38 setObject:v41 forKey:v42];

                          objc_opt_class();
                          v43 = _KeyedDictionaryObject(v54, v35);
                          [v43 addObject:v41];
                        }
                        [(IKJSImpression *)v41 addChild:v39];
                        [v29 setObject:v41 forKey:v35];

                        unint64_t v11 = 0x1E4F1C000;
                      }
                    }
                    uint64_t v33 = [v56 countByEnumeratingWithState:&v60 objects:v72 count:16];
                  }
                  while (v33);
                }
              }
              uint64_t v44 = [v30 parent];

              v30 = (void *)v44;
            }
            while (v44);
          }

          uint64_t v13 = v48;
          a5 = v49;
        }
        uint64_t v14 = v52 + 1;
      }
      while (v52 + 1 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v51);
  }

  v45 = (void *)[v54 copy];
  return v45;
}

- (IKJSImpression)initWithAppContext:(id)a3 data:(id)a4 index:(unint64_t)a5 queueTag:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)IKJSImpression;
  uint64_t v13 = [(IKJSObject *)&v16 initWithAppContext:a3];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metricsData, a4);
    objc_storeStrong((id *)&v14->_metricsTag, a6);
    if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
      v14->_indexInParent = a5;
    }
  }

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(IKJSImpression *)self data];
  id v7 = [(IKJSImpression *)self mutableTimestamps];
  id v8 = [(IKJSImpression *)self parent];
  id v9 = [(IKJSImpression *)self mutableChildren];
  int64_t v10 = [(IKJSImpression *)self index];
  id v11 = [(IKJSImpression *)self impressionQueueTag];
  id v12 = [v3 stringWithFormat:@"<%@: %p, data [%@ %p] timestamps [%@] parent [%p] children [%@] index [%ld] tag [%@]>", v5, self, v6, self, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (NSArray)timestamps
{
  v3 = [(IKJSImpression *)self mutableTimestamps];
  if (v3)
  {
    v4 = [(IKJSImpression *)self mutableTimestamps];
    v5 = (void *)[v4 copy];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (NSArray)children
{
  v3 = [(IKJSImpression *)self mutableChildren];
  if (v3)
  {
    v4 = [(IKJSImpression *)self mutableChildren];
    v5 = (void *)[v4 copy];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (id)parent
{
  v2 = [(IKJSImpression *)self parentImpression];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v5 = v4;

  return v5;
}

- (void)linkReferences
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(IKJSImpression *)self children];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = [(IKJSObject *)self appContext];
        int64_t v10 = [v9 jsContext];
        id v11 = [v10 virtualMachine];

        [v11 addManagedReference:v8 withOwner:self];
        [v11 addManagedReference:self withOwner:v8];
        [v8 linkReferences];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)addTimestamp:(int64_t)a3
{
  if (a3)
  {
    uint64_t v5 = [(IKJSImpression *)self mutableTimestamps];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(IKJSImpression *)self setMutableTimestamps:v6];
    }
    id v8 = [(IKJSImpression *)self mutableTimestamps];
    uint64_t v7 = [NSNumber numberWithLongLong:a3];
    [v8 addObject:v7];
  }
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = [(IKJSImpression *)self mutableChildren];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(IKJSImpression *)self setMutableChildren:v6];
    }
    uint64_t v7 = [v9 parentImpression];

    id v4 = v9;
    if (v7 != self)
    {
      [v9 setParentImpression:self];
      id v8 = [(IKJSImpression *)self mutableChildren];
      [v8 addObject:v9];

      id v4 = v9;
    }
  }
}

- (IKJSImpression)parentImpression
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentImpression);
  return (IKJSImpression *)WeakRetained;
}

- (void)setParentImpression:(id)a3
{
}

- (NSString)metricsTag
{
  return self->_metricsTag;
}

- (void)setMetricsTag:(id)a3
{
}

- (NSString)metricsData
{
  return self->_metricsData;
}

- (void)setMetricsData:(id)a3
{
}

- (NSMutableArray)mutableTimestamps
{
  return self->_mutableTimestamps;
}

- (void)setMutableTimestamps:(id)a3
{
}

- (NSMutableArray)mutableChildren
{
  return self->_mutableChildren;
}

- (void)setMutableChildren:(id)a3
{
}

- (int64_t)indexInParent
{
  return self->_indexInParent;
}

- (void)setIndexInParent:(int64_t)a3
{
  self->_indexInParent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableChildren, 0);
  objc_storeStrong((id *)&self->_mutableTimestamps, 0);
  objc_storeStrong((id *)&self->_metricsData, 0);
  objc_storeStrong((id *)&self->_metricsTag, 0);
  objc_destroyWeak((id *)&self->_parentImpression);
}

@end