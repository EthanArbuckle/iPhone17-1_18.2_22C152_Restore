@interface IKJSDataSource
+ (id)_titlesByIndexFromValue:(id)a3;
+ (id)jsExportedProperties;
+ (id)makeDataSource:(id)a3 :(id)a4 :(int64_t)a5;
- (IKJSDataSource)initWithItems:(id)a3;
- (IKJSDataSource)initWithItems:(id)a3 indexTitles:(id)a4;
- (IKJSDataSource)initWithItems:(id)a3 indexTitles:(id)a4 segmentSize:(int64_t)a5;
- (NSDictionary)indexTitles;
- (NSMutableArray)dataSourceViewPointers;
- (NSMutableDictionary)loadIndexesRequestsBySegmentIndex;
- (NSMutableIndexSet)loadedSegmentIndexes;
- (id)_dataSourceViews;
- (id)_spliceAtIndex:(int64_t)a3 deleteCount:(int64_t)a4 insertions:(id)a5;
- (id)asPrivateIKJSDataSource;
- (id)boxedItem:(int64_t)a3;
- (id)delete:(int64_t)a3 :(int64_t)a4;
- (id)extraInfoForChangeInPathWithAccessorSequence:(id)a3 extraInfo:(id)a4;
- (id)item:(int64_t)a3;
- (id)replace:(int64_t)a3 :(id)a4;
- (id)valuesForSubscripts:(_NSRange)a3 boxed:(BOOL)a4;
- (int64_t)_segmentIndexForItemIndex:(int64_t)a3;
- (int64_t)length;
- (int64_t)segmentSize;
- (void)_didAdjustSegmentIndexesFromIndex:(int64_t)a3;
- (void)_loadUsedIndexes;
- (void)_resetLoadedSegments;
- (void)_resetUsedIndexesAndMigrateItems:(id)a3;
- (void)_updateTitlesFromIndex:(int64_t)a3 deleteCount:(int64_t)a4 insertionCount:(int64_t)a5 title:(id)a6;
- (void)addDataSourceView:(id)a3;
- (void)insert:(int64_t)a3 :(id)a4 :(id)a5;
- (void)markDataSourceViewsUpdated;
- (void)move:(int64_t)a3 :(int64_t)a4 :(int64_t)a5 :(id)a6;
- (void)removeDataSourceView:(id)a3;
- (void)update:(id)a3 :(id)a4 :(int64_t)a5;
@end

@implementation IKJSDataSource

- (id)asPrivateIKJSDataSource
{
  if ([(IKJSDataSource *)self conformsToProtocol:&unk_1F3E4AAC0]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKJSDataSource)initWithItems:(id)a3
{
  return [(IKJSDataSource *)self initWithItems:a3 indexTitles:0];
}

- (IKJSDataSource)initWithItems:(id)a3 indexTitles:(id)a4
{
  return [(IKJSDataSource *)self initWithItems:a3 indexTitles:a4 segmentSize:0];
}

- (IKJSDataSource)initWithItems:(id)a3 indexTitles:(id)a4 segmentSize:(int64_t)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IKJSDataSource;
  v9 = [(IKJSDataObservable *)&v20 initWithTargetValue:a3];
  if (v9)
  {
    v10 = (void *)[v8 copy];
    v11 = v10;
    if (!v10)
    {
      v11 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    objc_storeStrong((id *)&v9->_indexTitles, v11);
    if (!v10) {

    }
    int64_t v12 = 20;
    if (a5 > 0) {
      int64_t v12 = a5;
    }
    v9->_segmentSize = v12;
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    dataSourceViewPointers = v9->_dataSourceViewPointers;
    v9->_dataSourceViewPointers = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E60] indexSet];
    loadedSegmentIndexes = v9->_loadedSegmentIndexes;
    v9->_loadedSegmentIndexes = (NSMutableIndexSet *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    loadIndexesRequestsBySegmentIndex = v9->_loadIndexesRequestsBySegmentIndex;
    v9->_loadIndexesRequestsBySegmentIndex = (NSMutableDictionary *)v17;

    [(IKJSDataSource *)v9 _resetLoadedSegments];
  }

  return v9;
}

- (id)valuesForSubscripts:(_NSRange)a3 boxed:(BOOL)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0)
  {
    v5 = 0;
  }
  else
  {
    BOOL v6 = a4;
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    v9 = [(IKJSDataObservable *)self targetValue];
    v10 = v9;
    if (length == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = [v9 valueForProperty:@"length"];
      if ([v11 isNumber])
      {
        int64_t v12 = [v11 toNumber];
        NSUInteger length = [v12 integerValue];
      }
      else
      {
        NSUInteger length = 0;
      }
    }
    for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:length];
    {
      v14 = [v10 valueAtIndex:location];
      uint64_t v15 = +[IKJSDataObservable toDataObservable:v14];
      if (v15) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = !v6;
      }
      if (v16)
      {
        uint64_t v17 = (void *)v15;
        if (!v15) {
          goto LABEL_24;
        }
      }
      else
      {
        id v25 = 0;
        uint64_t v17 = +[IKJSDataObservable toDataObservable:v14 proxy:&v25];
        id v18 = v25;
        v19 = v18;
        if (v17)
        {
          [v10 setValue:v18 atIndex:location];
          id v20 = v19;

          v14 = v20;
        }

        if (!v17) {
          goto LABEL_24;
        }
      }
      v21 = [[IKDataSubscript alloc] initWithSubscriptIndex:location];
      v26[0] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      [v17 setParent:self accessorSequence:v22];

LABEL_24:
      [i addObject:v14];

      ++location;
    }
    if ([i count]) {
      v5 = (void *)[i copy];
    }
    else {
      v5 = 0;
    }
  }
  return v5;
}

+ (id)makeDataSource:(id)a3 :(id)a4 :(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend(v8, "ikdt_isArray"))
  {
    id v10 = objc_alloc((Class)a1);
    v11 = [a1 _titlesByIndexFromValue:v9];
    int64_t v12 = (void *)[v10 initWithItems:v8 indexTitles:v11 segmentSize:a5];

    [v12 exportValue];
  }
  else
  {
    uint64_t v13 = +[IKAppContext currentAppContext];
    [v13 setException:0 withErrorMessage:@"DataSource: Invalid args; construct with an array"];

    v14 = (void *)MEMORY[0x1E4F30938];
    int64_t v12 = [MEMORY[0x1E4F30920] currentContext];
    [v14 valueWithNullInContext:v12];
  uint64_t v15 = };

  return v15;
}

- (int64_t)length
{
  v2 = [(IKJSDataObservable *)self targetValue];
  v3 = [v2 valueForProperty:@"length"];

  if ([v3 isNumber])
  {
    v4 = [v3 toNumber];
    int64_t v5 = [v4 integerValue];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)item:(int64_t)a3
{
  v4 = [(IKJSDataObservable *)self targetValue];
  int64_t v5 = [v4 valueAtIndex:a3];

  return v5;
}

- (void)update:(id)a3 :(id)a4 :(int64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  if (objc_msgSend(v13, "ikdt_isArray"))
  {
    id v9 = [(IKJSDataObservable *)self targetValue];
    [(IKJSDataObservable *)self setTargetValue:v13];
    id v10 = [(id)objc_opt_class() _titlesByIndexFromValue:v8];
    v11 = v10;
    if (!v10)
    {
      v11 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    objc_storeStrong((id *)&self->_indexTitles, v11);
    if (!v10) {

    }
    int64_t v12 = 20;
    if (a5 > 0) {
      int64_t v12 = a5;
    }
    self->_segmentSize = v12;
    [(IKJSDataSource *)self _resetLoadedSegments];
    [(IKJSDataSource *)self _resetUsedIndexesAndMigrateItems:v9];
    [(IKJSDataObservable *)self touchPathWithAccessorSequence:MEMORY[0x1E4F1CBF0] extraInfo:0];
  }
  else
  {
    id v9 = +[IKAppContext currentAppContext];
    [v9 setException:0 withErrorMessage:@"DataSource: Invalid args; update with an array"];
  }
}

- (void)insert:(int64_t)a3 :(id)a4 :(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 < 0 || [(IKJSDataSource *)self length] < a3)
  {
    id v10 = [(IKJSObject *)self appContext];
    v11 = v10;
    int64_t v12 = @"insert: index out of bounds";
LABEL_4:
    [v10 setException:0 withErrorMessage:v12];

    goto LABEL_5;
  }
  if ((objc_msgSend(v8, "ikdt_isArray") & 1) == 0)
  {
    id v10 = [(IKJSObject *)self appContext];
    v11 = v10;
    int64_t v12 = @"insert: items must be an array";
    goto LABEL_4;
  }
  id v13 = [v8 valueForProperty:@"length"];
  v14 = [v13 toNumber];
  uint64_t v15 = [v14 integerValue];

  if (v15 < 1)
  {
    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, v15);
  }
  uint64_t v17 = [IKChangeSet alloc];
  id v18 = (void *)[v16 copy];
  v19 = [(IKChangeSet *)v17 initWithAddedIndexes:v18 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:0];

  id v20 = [(IKJSDataSource *)self _spliceAtIndex:a3 deleteCount:0 insertions:v8];
  if ([v9 isString])
  {
    v21 = [v9 toString];
    [(IKJSDataSource *)self _updateTitlesFromIndex:a3 deleteCount:0 insertionCount:v15 title:v21];
  }
  else
  {
    [(IKJSDataSource *)self _updateTitlesFromIndex:a3 deleteCount:0 insertionCount:v15 title:0];
  }
  [(IKJSDataSource *)self _didAdjustSegmentIndexesFromIndex:[(IKJSDataSource *)self _segmentIndexForItemIndex:a3]];
  v23 = @"changeSet";
  v24[0] = v19;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [(IKJSDataObservable *)self touchPathWithAccessorSequence:MEMORY[0x1E4F1CBF0] extraInfo:v22];

LABEL_5:
}

- (id)delete:(int64_t)a3 :(int64_t)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a3 < 0 || [(IKJSDataSource *)self length] <= a3)
  {
    v7 = [(IKJSObject *)self appContext];
    id v8 = v7;
    id v9 = @"insert: index out of bounds";
  }
  else
  {
    if (a4 + a3 <= [(IKJSDataSource *)self length])
    {
      if (a4 < 1)
      {
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, a4);
      }
      BOOL v16 = [IKChangeSet alloc];
      uint64_t v17 = (void *)[v15 copy];
      id v18 = [(IKChangeSet *)v16 initWithAddedIndexes:0 removedIndexes:v17 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:0];

      id v13 = [(IKJSDataSource *)self _spliceAtIndex:a3 deleteCount:a4 insertions:0];
      [(IKJSDataSource *)self _updateTitlesFromIndex:a3 deleteCount:a4 insertionCount:0 title:0];
      [(IKJSDataSource *)self _didAdjustSegmentIndexesFromIndex:[(IKJSDataSource *)self _segmentIndexForItemIndex:a3]];
      id v20 = @"changeSet";
      v21[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [(IKJSDataObservable *)self touchPathWithAccessorSequence:MEMORY[0x1E4F1CBF0] extraInfo:v19];

      goto LABEL_7;
    }
    v7 = [(IKJSObject *)self appContext];
    id v8 = v7;
    id v9 = @"insert: deleteCount out of bounds";
  }
  [v7 setException:0 withErrorMessage:v9];

  id v10 = (void *)MEMORY[0x1E4F30938];
  v11 = [(IKJSObject *)self appContext];
  int64_t v12 = [v11 jsContext];
  id v13 = [v10 valueWithUndefinedInContext:v12];

LABEL_7:
  return v13;
}

- (id)replace:(int64_t)a3 :(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 < 0 || [(IKJSDataSource *)self length] <= a3)
  {
    id v10 = [(IKJSObject *)self appContext];
    v11 = v10;
    int64_t v12 = @"replace: index out of bounds";
  }
  else if (objc_msgSend(v6, "ikdt_isArray"))
  {
    v7 = [v6 valueForProperty:@"length"];
    id v8 = [v7 toNumber];
    uint64_t v9 = [v8 integerValue];

    if (v9 + a3 <= [(IKJSDataSource *)self length])
    {
      if (v9 < 1)
      {
        id v18 = 0;
      }
      else
      {
        id v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v9];
        int64_t v19 = a3;
        uint64_t v20 = v9;
        do
        {
          v21 = [NSNumber numberWithInteger:v19];
          v22 = [NSNumber numberWithInteger:v19];
          [v18 setObject:v21 forKeyedSubscript:v22];

          ++v19;
          --v20;
        }
        while (v20);
      }
      v23 = [IKChangeSet alloc];
      v24 = (void *)[v18 copy];
      id v25 = [(IKChangeSet *)v23 initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v24];

      BOOL v16 = [(IKJSDataSource *)self _spliceAtIndex:a3 deleteCount:v9 insertions:v6];
      v27 = @"changeSet";
      v28[0] = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      [(IKJSDataObservable *)self touchPathWithAccessorSequence:MEMORY[0x1E4F1CBF0] extraInfo:v26];

      goto LABEL_8;
    }
    id v10 = [(IKJSObject *)self appContext];
    v11 = v10;
    int64_t v12 = @"replace: items length out of bounds";
  }
  else
  {
    id v10 = [(IKJSObject *)self appContext];
    v11 = v10;
    int64_t v12 = @"replace: items must be an array";
  }
  [v10 setException:0 withErrorMessage:v12];

  id v13 = (void *)MEMORY[0x1E4F30938];
  v14 = [(IKJSObject *)self appContext];
  uint64_t v15 = [v14 jsContext];
  BOOL v16 = [v13 valueWithUndefinedInContext:v15];

LABEL_8:
  return v16;
}

- (void)move:(int64_t)a3 :(int64_t)a4 :(int64_t)a5 :(id)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (a3 < 0 || [(IKJSDataSource *)self length] <= a3)
  {
    v11 = [(IKJSObject *)self appContext];
    int64_t v12 = v11;
    id v13 = @"move: oldIndex out of bounds";
    goto LABEL_6;
  }
  if (a5 + a3 > [(IKJSDataSource *)self length])
  {
    v11 = [(IKJSObject *)self appContext];
    int64_t v12 = v11;
    id v13 = @"move: count out of bounds";
LABEL_6:
    [v11 setException:0 withErrorMessage:v13];

    goto LABEL_7;
  }
  if (a4 < 0 || [(IKJSDataSource *)self length] - a5 < a4)
  {
    v11 = [(IKJSObject *)self appContext];
    int64_t v12 = v11;
    id v13 = @"move: newIndex out of bounds";
    goto LABEL_6;
  }
  if (a3 >= a4) {
    int64_t v14 = a4;
  }
  else {
    int64_t v14 = a3;
  }
  [(IKJSDataSource *)self _didAdjustSegmentIndexesFromIndex:[(IKJSDataSource *)self _segmentIndexForItemIndex:v14]];
  if (a5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a5];
    BOOL v16 = (void *)v15;
    if (a5 >= 1)
    {
      int64_t v30 = a4;
      int64_t v17 = a3;
      int64_t v18 = a4;
      int64_t v19 = a5;
      uint64_t v20 = (void *)v15;
      do
      {
        v21 = [NSNumber numberWithInteger:v17];
        v22 = [NSNumber numberWithInteger:v18];
        [v20 setObject:v21 forKeyedSubscript:v22];

        ++v18;
        ++v17;
        --v19;
      }
      while (v19);
      BOOL v16 = v20;
      a4 = v30;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  v23 = [IKChangeSet alloc];
  v24 = (void *)[v16 copy];
  id v25 = [(IKChangeSet *)v23 initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:v24 updatedIndexesByNewIndex:0];

  v26 = [(IKJSDataSource *)self _spliceAtIndex:a3 deleteCount:a5 insertions:0];
  id v27 = [(IKJSDataSource *)self _spliceAtIndex:a4 deleteCount:0 insertions:v26];
  [(IKJSDataSource *)self _updateTitlesFromIndex:a3 deleteCount:a5 insertionCount:0 title:0];
  if ([v10 isString])
  {
    v28 = [v10 toString];
    [(IKJSDataSource *)self _updateTitlesFromIndex:a4 deleteCount:0 insertionCount:a5 title:v28];
  }
  else
  {
    [(IKJSDataSource *)self _updateTitlesFromIndex:a4 deleteCount:0 insertionCount:a5 title:0];
  }
  v31 = @"changeSet";
  v32[0] = v25;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  [(IKJSDataObservable *)self touchPathWithAccessorSequence:MEMORY[0x1E4F1CBF0] extraInfo:v29];

LABEL_7:
}

- (id)boxedItem:(int64_t)a3
{
  int64_t v5 = [(IKJSDataObservable *)self targetValue];
  id v6 = [v5 valueAtIndex:a3];
  id v7 = +[IKJSDataObservable toDataObservable:v6];
  if (v7) {
    goto LABEL_4;
  }
  id v14 = 0;
  uint64_t v8 = +[IKJSDataObservable toDataObservable:v6 proxy:&v14];
  id v7 = v14;
  if (v8)
  {
    [v5 setValue:v7 atIndex:a3];

    id v7 = (id)v8;
LABEL_4:
    uint64_t v9 = (void *)MEMORY[0x1E4F30938];
    id v10 = [(IKJSObject *)self appContext];
    v11 = [v10 jsContext];
    int64_t v12 = [v9 valueWithObject:v7 inContext:v11];

    goto LABEL_5;
  }
  int64_t v12 = 0;
LABEL_5:

  return v12;
}

+ (id)jsExportedProperties
{
  v3 = +[IKAppContext currentAppContext];
  int v4 = [v3 isPrivileged];

  if (v4)
  {
    int64_t v5 = [&unk_1F3E3DAB8 arrayByAddingObject:@"boxedItem"];
  }
  else
  {
    int64_t v5 = &unk_1F3E3DAB8;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___IKJSDataSource;
  id v6 = objc_msgSendSuper2(&v9, sel_jsExportedProperties);
  id v7 = [v6 arrayByAddingObjectsFromArray:v5];

  return v7;
}

- (id)extraInfoForChangeInPathWithAccessorSequence:(id)a3 extraInfo:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v4 = [a3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 subscriptIndex];
    id v6 = [IKChangeSet alloc];
    id v7 = [NSNumber numberWithInteger:v5];
    uint64_t v15 = v7;
    uint64_t v8 = [NSNumber numberWithInteger:v5];
    v16[0] = v8;
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v10 = [(IKChangeSet *)v6 initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v9];

    id v13 = @"changeSet";
    id v14 = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addDataSourceView:(id)a3
{
  id v5 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  int v4 = [(IKJSDataSource *)self dataSourceViewPointers];
  [v4 addObject:v5];

  [(IKJSDataSource *)self markDataSourceViewsUpdated];
}

- (void)removeDataSourceView:(id)a3
{
  id v5 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  int v4 = [(IKJSDataSource *)self dataSourceViewPointers];
  [v4 removeObject:v5];

  [(IKJSDataSource *)self markDataSourceViewsUpdated];
}

- (void)markDataSourceViewsUpdated
{
  if (!self->_dataSourceViewsDirty)
  {
    self->_dataSourceViewsDirty = 1;
    objc_initWeak(&location, self);
    v3 = [(IKJSObject *)self appContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__IKJSDataSource_markDataSourceViewsUpdated__block_invoke;
    v4[3] = &unk_1E6DE3DE0;
    objc_copyWeak(&v5, &location);
    [v3 addPostEvaluateBlock:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __44__IKJSDataSource_markDataSourceViewsUpdated__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[80])
  {
    WeakRetained[80] = 0;
    v2 = WeakRetained;
    [WeakRetained _loadUsedIndexes];
    WeakRetained = v2;
  }
}

+ (id)_titlesByIndexFromValue:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "ikdt_isArray"))
  {
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v3 objectForKeyedSubscript:@"length"];
    id v6 = [v5 toNumber];
    uint64_t v7 = [v6 integerValue];

    if (v7 >= 1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        objc_super v9 = [v3 valueAtIndex:i];
        if ([v9 isString])
        {
          id v10 = [v9 toString];
          v11 = [NSNumber numberWithInteger:i];
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
      }
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)_spliceAtIndex:(int64_t)a3 deleteCount:(int64_t)a4 insertions:(id)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  objc_super v9 = [(IKJSDataObservable *)self targetValue];
  id v10 = [NSNumber numberWithInteger:a3];
  v30[0] = v10;
  v11 = [NSNumber numberWithInteger:a4];
  v30[1] = v11;
  int64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v13 = [v9 invokeMethod:@"splice" withArguments:v12];

  if (v8)
  {
    id v14 = [NSNumber numberWithInteger:a3];
    v29 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    BOOL v16 = [v9 invokeMethod:@"slice" withArguments:v15];

    int64_t v17 = [v8 objectForKeyedSubscript:@"length"];
    int64_t v18 = [v17 toObject];
    uint64_t v19 = [v18 integerValue];

    if (v19 >= 1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        v21 = [v8 valueAtIndex:i];
        [v9 setValue:v21 atIndex:a3 + i];
      }
    }
    v22 = [v16 objectForKeyedSubscript:@"length"];
    v23 = [v22 toObject];
    uint64_t v24 = [v23 integerValue];

    if (v24 >= 1)
    {
      uint64_t v25 = 0;
      uint64_t v26 = v19 + a3;
      do
      {
        id v27 = [v16 valueAtIndex:v25];
        [v9 setValue:v27 atIndex:v26 + v25];

        ++v25;
      }
      while (v24 != v25);
    }
  }
  return v13;
}

- (void)_updateTitlesFromIndex:(int64_t)a3 deleteCount:(int64_t)a4 insertionCount:(int64_t)a5 title:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v28 = a6;
  objc_super v9 = [(IKJSDataSource *)self indexTitles];
  v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  id v27 = self;
  int64_t v10 = [(IKJSDataSource *)self length];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v11 = [v9 allKeys];
  int64_t v12 = [v11 sortedArrayUsingSelector:sel_compare_];

  id obj = v12;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v33 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = [*(id *)(*((void *)&v32 + 1) + 8 * v16) integerValue];
      int64_t v18 = v17 - a3;
      if (v17 - a3 >= a4) {
        int64_t v18 = a4;
      }
      int64_t v19 = a5;
      if (v17 < a3)
      {
        int64_t v19 = 0;
        int64_t v18 = 0;
      }
      int64_t v20 = v17 - v18 + v19;
      if (v20 >= v10) {
        break;
      }
      v21 = [NSNumber numberWithInteger:v17];
      v22 = [v9 objectForKeyedSubscript:v21];
      v23 = [NSNumber numberWithInteger:v20];
      [v31 setObject:v22 forKeyedSubscript:v23];

      if (v14 == ++v16)
      {
        uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v28)
  {
    uint64_t v24 = [NSNumber numberWithInteger:a3];
    [v31 setObject:v28 forKeyedSubscript:v24];
  }
  uint64_t v25 = [v31 copy];
  indexTitles = v27->_indexTitles;
  v27->_indexTitles = (NSDictionary *)v25;
}

- (void)_loadUsedIndexes
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(IKJSDataSource *)self length];
  double v4 = (double)[(IKJSDataSource *)self segmentSize];
  v39 = [(IKJSDataSource *)self loadIndexesRequestsBySegmentIndex];
  v36 = [(IKJSDataSource *)self loadedSegmentIndexes];
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  v38 = self;
  id v6 = [(IKJSDataSource *)self _dataSourceViews];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v53 objects:v58 count:16];
  uint64_t v37 = v6;
  unint64_t v42 = v3;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v54;
    unint64_t v10 = (uint64_t)(v4 * 0.5);
    int64_t obj = ~v3;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v12 = [*(id *)(*((void *)&v53 + 1) + 8 * i) usedIndexRange];
        if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0)
        {
          unint64_t v15 = v12;
          uint64_t v16 = v13;
          uint64_t v17 = v12 + v13;
          unint64_t v18 = v3 - (v12 + v13);
          if (v3 >= v12 + v13)
          {
            if (v12 >= v10) {
              uint64_t v24 = (uint64_t)(v4 * 0.5);
            }
            else {
              uint64_t v24 = v12;
            }
            if (v18 >= v10) {
              unint64_t v18 = (uint64_t)(v4 * 0.5);
            }
            unint64_t v21 = (unint64_t)((double)(v12 - v24) / v4);
            double v23 = (double)(v12 - v24) - (double)v21 * v4 + (double)(v24 + v13 + v18) + v4;
          }
          else
          {
            uint64_t v19 = v17 + obj;
            if (v17 + obj >= v10) {
              uint64_t v19 = (uint64_t)(v4 * 0.5);
            }
            if (v3 - v13 - v19 >= v10) {
              uint64_t v20 = (uint64_t)(v4 * 0.5);
            }
            else {
              uint64_t v20 = v3 - v13 - v19;
            }
            objc_msgSend(v5, "addIndexesInRange:", (unint64_t)((double)(v12 - v19) / v4), (unint64_t)(((double)(v12 - v19)- (double)(unint64_t)((double)(v12 - v19) / v4) * v4+ (double)(v42 - (v12 - v19))+ v4+ -1.0)/ v4));
            unint64_t v21 = 0;
            unint64_t v22 = v16 - v42 + v15 + v20;
            unint64_t v3 = v42;
            id v6 = v37;
            double v23 = v4 + (double)v22;
          }
          objc_msgSend(v5, "addIndexesInRange:", v21, (unint64_t)((v23 + -1.0) / v4));
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v8);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obja = [v39 allKeys];
  uint64_t v25 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(obja);
        }
        v29 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        if ((objc_msgSend(v5, "containsIndex:", objc_msgSend(v29, "integerValue")) & 1) == 0)
        {
          int64_t v30 = [v39 objectForKeyedSubscript:v29];
          [v30 cancel];
          v31 = [(IKJSObject *)v38 appContext];
          long long v32 = [v31 jsContext];

          long long v33 = [v32 virtualMachine];
          [v33 removeManagedReference:v30 withOwner:v38];

          [v39 removeObjectForKey:v29];
        }
      }
      uint64_t v26 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v26);
  }

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __34__IKJSDataSource__loadUsedIndexes__block_invoke;
  v43[3] = &unk_1E6DE4F60;
  double v47 = v4;
  unint64_t v48 = v42;
  id v44 = v36;
  id v45 = v39;
  v46 = v38;
  id v34 = v39;
  id v35 = v36;
  [v5 enumerateIndexesUsingBlock:v43];
}

void __34__IKJSDataSource__loadUsedIndexes__block_invoke(uint64_t a1, void *a2)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  double v4 = *(double *)(a1 + 56);
  unint64_t v5 = (unint64_t)(v4 * (double)(unint64_t)a2);
  unint64_t v6 = *(void *)(a1 + 64) - v5;
  if (v4 >= (double)v6) {
    double v7 = (double)v6;
  }
  else {
    double v7 = *(double *)(a1 + 56);
  }
  if (([*(id *)(a1 + 32) containsIndex:a2] & 1) == 0)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a2];
    unint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (!v10)
    {
      v11 = -[IKJSDataSourceLoadIndexesRequest initWithDataSource:range:]([IKJSDataSourceLoadIndexesRequest alloc], "initWithDataSource:range:", *(void *)(a1 + 48), v5, (unint64_t)v7);
      objc_initWeak(&location, *(id *)(a1 + 48));
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      unint64_t v22 = __34__IKJSDataSource__loadUsedIndexes__block_invoke_2;
      double v23 = &unk_1E6DE4F38;
      objc_copyWeak(v24, &location);
      v24[1] = a2;
      [(IKJSDataSourceLoadIndexesRequest *)v11 setCompletion:&v20];
      unint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a2, v20, v21, v22, v23);
      [v12 setObject:v11 forKeyedSubscript:v13];

      uint64_t v14 = [*(id *)(a1 + 48) appContext];
      unint64_t v15 = [v14 jsContext];

      uint64_t v16 = [v15 virtualMachine];
      [v16 addManagedReference:v11 withOwner:*(void *)(a1 + 48)];

      uint64_t v17 = *(void **)(a1 + 48);
      v26[0] = @"request";
      v26[1] = @"target";
      v27[0] = v11;
      unint64_t v18 = [v17 exportValue];
      v27[1] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      [v17 invokeListeners:@"loadindexes" extraInfo:v19];

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);
    }
  }
}

void __34__IKJSDataSource__loadUsedIndexes__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    unint64_t v5 = [WeakRetained loadIndexesRequestsBySegmentIndex];
    unint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    double v7 = [v5 objectForKeyedSubscript:v6];

    if (a2)
    {
      uint64_t v8 = [v14 loadedSegmentIndexes];
      [v8 addIndex:*(void *)(a1 + 40)];

      uint64_t v9 = [v14 appContext];
      unint64_t v10 = [v9 jsContext];

      v11 = [v10 virtualMachine];
      [v11 removeManagedReference:v7 withOwner:v14];

      unint64_t v12 = [v14 loadIndexesRequestsBySegmentIndex];
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
      [v12 removeObjectForKey:v13];
    }
    id WeakRetained = v14;
  }
}

- (void)_didAdjustSegmentIndexesFromIndex:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(IKJSDataSource *)self loadIndexesRequestsBySegmentIndex];
  unint64_t v6 = [(IKJSDataSource *)self loadedSegmentIndexes];
  double v7 = [v5 allKeys];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v12 integerValue] >= a3)
        {
          uint64_t v13 = [v5 objectForKeyedSubscript:v12];
          [v13 cancel];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__IKJSDataSource__didAdjustSegmentIndexesFromIndex___block_invoke;
  void v27[3] = &__block_descriptor_40_e12_B24__0Q8_B16l;
  v27[4] = a3;
  id v14 = [v6 indexesPassingTest:v27];
  unint64_t v22 = v6;
  [v6 removeIndexes:v14];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v15 = [(IKJSDataSource *)self _dataSourceViews];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        uint64_t v21 = [v20 usedIndexRange];
        if (v21 != 0x7FFFFFFFFFFFFFFFLL
          && [(IKJSDataSource *)self _segmentIndexForItemIndex:v21] >= a3)
        {
          [v20 reset];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v17);
  }
}

BOOL __52__IKJSDataSource__didAdjustSegmentIndexesFromIndex___block_invoke(uint64_t a1, unint64_t a2)
{
  return *(void *)(a1 + 32) <= a2;
}

- (id)_dataSourceViews
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  double v4 = [(IKJSDataSource *)self dataSourceViewPointers];
  unint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v6 = [(IKJSDataSource *)self dataSourceViewPointers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "pointerValue"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v11 = (void *)[v5 copy];
  return v11;
}

- (int64_t)_segmentIndexForItemIndex:(int64_t)a3
{
  return a3 / [(IKJSDataSource *)self segmentSize];
}

- (void)_resetLoadedSegments
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(IKJSDataSource *)self length];
  uint64_t v4 = [(IKJSDataSource *)self segmentSize];
  uint64_t v5 = vcvtpd_s64_f64((double)v3 / (double)v4);
  unint64_t v6 = [(IKJSDataSource *)self loadedSegmentIndexes];
  [v6 removeAllIndexes];

  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 1;
    uint64_t v29 = v5;
    do
    {
      unint64_t v9 = v7 * v4;
      uint64_t v10 = v3 - v7 * v4;
      if (v4 < v10) {
        uint64_t v10 = v4;
      }
      unint64_t v11 = v10 + v9;
      if (v9 < v10 + v9)
      {
        uint64_t v12 = v3;
        char v13 = 0;
        unint64_t v14 = v8;
        do
        {
          long long v15 = [(IKJSDataSource *)self item:v14 - 1];
          if ([v15 isNull])
          {
            uint64_t v3 = v12;
            uint64_t v5 = v29;
            goto LABEL_14;
          }
          char v16 = [v15 isUndefined];
          v13 |= v16;

          if (v16) {
            break;
          }
        }
        while (v14++ < v11);
        uint64_t v3 = v12;
        uint64_t v5 = v29;
        if (v13) {
          goto LABEL_15;
        }
      }
      long long v15 = [(IKJSDataSource *)self loadedSegmentIndexes];
      [v15 addIndex:v7];
LABEL_14:

LABEL_15:
      ++v7;
      v8 += v4;
    }
    while (v7 != v5);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v18 = [(IKJSDataSource *)self loadIndexesRequestsBySegmentIndex];
  uint64_t v19 = [v18 allValues];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v24 cancel];
        long long v25 = [(IKJSObject *)self appContext];
        long long v26 = [v25 jsContext];

        uint64_t v27 = [v26 virtualMachine];
        [v27 removeManagedReference:v24 withOwner:self];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  long long v28 = [(IKJSDataSource *)self loadIndexesRequestsBySegmentIndex];
  [v28 removeAllObjects];
}

- (void)_resetUsedIndexesAndMigrateItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(IKJSDataObservable *)self targetValue];
  unint64_t v6 = [v5 valueForProperty:@"length"];
  int v7 = [v6 toInt32];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v20 = self;
  id obj = [(IKJSDataSource *)self _dataSourceViews];
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v22 = *(void *)v25;
    uint64_t v23 = v7;
    unint64_t v10 = v7 - 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unint64_t v13 = [v12 usedIndexRange];
        if (v13 >= v10) {
          unint64_t v15 = v10;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v14 >= v23 - v15) {
          unint64_t v16 = v23 - v15;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16) {
          BOOL v17 = v15 >= v16;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          do
          {
            uint64_t v18 = [v5 valueAtIndex:v15];
            if (([v18 isNull] & 1) != 0 || objc_msgSend(v18, "isUndefined"))
            {
              uint64_t v19 = [v4 valueAtIndex:v15];
              [v5 setValue:v19 atIndex:v15];
            }
            ++v15;
          }
          while (v16 != v15);
        }
        [v12 reset];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  v20->_dataSourceViewsDirty = 0;
}

- (int64_t)segmentSize
{
  return self->_segmentSize;
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (NSMutableArray)dataSourceViewPointers
{
  return self->_dataSourceViewPointers;
}

- (NSMutableDictionary)loadIndexesRequestsBySegmentIndex
{
  return self->_loadIndexesRequestsBySegmentIndex;
}

- (NSMutableIndexSet)loadedSegmentIndexes
{
  return self->_loadedSegmentIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedSegmentIndexes, 0);
  objc_storeStrong((id *)&self->_loadIndexesRequestsBySegmentIndex, 0);
  objc_storeStrong((id *)&self->_dataSourceViewPointers, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
}

@end