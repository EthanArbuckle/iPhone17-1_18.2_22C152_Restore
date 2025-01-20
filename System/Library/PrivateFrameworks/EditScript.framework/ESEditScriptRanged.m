@interface ESEditScriptRanged
+ (id)editScriptForSmallestSingleEditFromString:(id)a3 toString:(id)a4;
+ (id)editScriptForSmallestSingleEditFromString:(id)a3 toString:(id)a4 chunkSize:(int64_t)a5;
+ (id)editScriptFromString:(id)a3 toString:(id)a4;
+ (id)editScriptFromString:(id)a3 toString:(id)a4 chunkSize:(int64_t)a5 orderAtomsAscending:(BOOL)a6 operationPrecedence:(int64_t)a7 options:(int64_t)a8;
- (ESEditScriptRanged)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 chunkSize:(int64_t)a5 stringA:(id)a6 stringB:(id)a7 orderAtomsAscending:(BOOL)a8 options:(int64_t)a9;
- (NSString)stringA;
- (NSString)stringB;
- (id)applyToString:(id)a3;
- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6;
- (void)computeSmallestSingleEdit;
- (void)finalizeCurrentScriptAtom;
- (void)initializeCurrentScriptAtom;
- (void)removeAnyOverlapBetweenIndexOfFirstDifference:(int64_t *)a3 andReverseIndexOfLastDifference:(int64_t *)a4 shouldShortenFirstDifference:(BOOL)a5;
@end

@implementation ESEditScriptRanged

- (ESEditScriptRanged)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 chunkSize:(int64_t)a5 stringA:(id)a6 stringB:(id)a7 orderAtomsAscending:(BOOL)a8 options:(int64_t)a9
{
  BOOL v9 = a8;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ESEditScriptRanged;
  v17 = [(ESEditScript *)&v23 initWithOperationPrecedence:a3 orderAtomsAscending:v9];
  if (v17)
  {
    uint64_t v18 = [(objc_class *)a4 EditScriptDataWithString:v15 chunkSize:a5];
    itemAData = v17->super._itemAData;
    v17->super._itemAData = (ESEditScriptData *)v18;

    uint64_t v20 = [(objc_class *)a4 EditScriptDataWithString:v16 chunkSize:a5];
    itemBData = v17->super._itemBData;
    v17->super._itemBData = (ESEditScriptData *)v20;

    v17->_options = a9;
  }

  return v17;
}

- (NSString)stringA
{
  return (NSString *)[(ESEditScriptData *)self->super._itemAData stringValue];
}

- (NSString)stringB
{
  return (NSString *)[(ESEditScriptData *)self->super._itemBData stringValue];
}

+ (id)editScriptFromString:(id)a3 toString:(id)a4
{
  return (id)[a1 editScriptFromString:a3 toString:a4 chunkSize:0 orderAtomsAscending:0 operationPrecedence:-1 options:1];
}

+ (id)editScriptFromString:(id)a3 toString:(id)a4 chunkSize:(int64_t)a5 orderAtomsAscending:(BOOL)a6 operationPrecedence:(int64_t)a7 options:(int64_t)a8
{
  BOOL v10 = a6;
  v13 = (__CFString *)a3;
  v14 = (__CFString *)a4;
  id v15 = [[ESEditScriptRanged alloc] initWithOperationPrecedence:a7 dataClass:objc_opt_class() chunkSize:a5 stringA:v13 stringB:v14 orderAtomsAscending:v10 options:a8];
  if (v13) {
    id v16 = v13;
  }
  else {
    id v16 = &stru_26EC8A8E0;
  }
  if (v14) {
    v17 = v14;
  }
  else {
    v17 = &stru_26EC8A8E0;
  }
  if ([(__CFString *)v16 length])
  {
    uint64_t v18 = [(__CFString *)v17 length];
    if ((a8 & 1) != 0 && !v18) {
      goto LABEL_10;
    }
  }
  else if (a8)
  {
LABEL_10:
    v19 = [(ESEditScript *)v15 script];
    uint64_t v20 = +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 0, [(__CFString *)v16 length], v17);
    [v19 addObject:v20];

    goto LABEL_13;
  }
  [(ESEditScript *)v15 computeDistanceMatrix];
  [(ESEditScript *)v15 computeEditsFromMatrix];
LABEL_13:

  return v15;
}

- (id)applyToString:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_26EC8A8E0;
  }
  v6 = (void *)[(__CFString *)v5 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = [(ESEditScript *)self script];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 editRange];
        uint64_t v15 = v14;
        id v16 = [v12 replacementText];
        objc_msgSend(v6, "replaceCharactersInRange:withString:", v13, v15, v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)initializeCurrentScriptAtom
{
  self->_currentScriptAtom = 0;
  MEMORY[0x270F9A758]();
}

- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v17 = a5;
  if (self->super._currentOperation != a3 || (self->_options & 1) == 0)
  {
    [(ESEditScriptRanged *)self finalizeCurrentScriptAtom];
    self->super._currentOperation = a3;
  }
  if (a3)
  {
    currentScriptAtom = self->_currentScriptAtom;
    if (a3 == 2)
    {
      uint64_t v10 = 0;
      if (currentScriptAtom)
      {
LABEL_7:
        uint64_t v11 = [(ESAtomRanged *)self->_currentScriptAtom editRange];
        [(ESAtomRanged *)self->_currentScriptAtom editRange];
        -[ESAtomRanged setEditRange:](self->_currentScriptAtom, "setEditRange:", v11 - v10, v12 + v10);
        uint64_t v13 = NSString;
        uint64_t v14 = [(ESAtomRanged *)self->_currentScriptAtom replacementText];
        uint64_t v15 = [v13 stringWithFormat:@"%@%@", v17, v14];
        [(ESAtomRanged *)self->_currentScriptAtom setReplacementText:v15];

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v10 = [(ESEditScriptData *)self->super._itemAData lengthOfItem:a4 - 1];
      if (currentScriptAtom) {
        goto LABEL_7;
      }
    }
    +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", [(ESEditScriptData *)self->super._itemAData characterIndexForItem:a4] - v10, v10, v17);
    id v16 = (ESAtomRanged *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = self->_currentScriptAtom;
    self->_currentScriptAtom = v16;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)finalizeCurrentScriptAtom
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  currentScriptAtom = self->_currentScriptAtom;
  if (currentScriptAtom)
  {
    if (self->super._orderAtomsAscending)
    {
      v4 = [(ESAtomRanged *)currentScriptAtom replacementText];
      uint64_t v5 = [v4 length];
      [(ESAtomRanged *)self->_currentScriptAtom editRange];
      uint64_t v7 = v6;

      uint64_t v8 = v5 - v7;
      if (v5 != v7)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [(ESEditScript *)self script];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v15 = [v14 editRange];
              objc_msgSend(v14, "setEditRange:", v8 + v15, v16);
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v11);
        }
      }
      id v17 = [(ESEditScript *)self script];
      [v17 insertObject:self->_currentScriptAtom atIndex:0];
    }
    else
    {
      id v17 = [(ESEditScript *)self script];
      [v17 addObject:self->_currentScriptAtom];
    }

    long long v18 = self->_currentScriptAtom;
    self->_currentScriptAtom = 0;
  }
}

- (void)removeAnyOverlapBetweenIndexOfFirstDifference:(int64_t *)a3 andReverseIndexOfLastDifference:(int64_t *)a4 shouldShortenFirstDifference:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = [(ESEditScriptData *)self->super._itemAData length];
  uint64_t v10 = [(ESEditScriptData *)self->super._itemBData length];
  if (v9 >= v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  int64_t v12 = *a3;
  int64_t v13 = *a3 - v11 + *a4;
  if (v13 >= 1)
  {
    if (v5)
    {
      uint64_t v14 = a3;
    }
    else
    {
      int64_t v12 = *a4;
      uint64_t v14 = a4;
    }
    int64_t *v14 = (v12 - v13) & ~((v12 - v13) >> 63);
  }
}

- (void)computeSmallestSingleEdit
{
  itemAData = self->super._itemAData;
  char v17 = 0;
  uint64_t v16 = [(ESEditScriptData *)itemAData indexOfFirstDifferenceWithOtherData:self->super._itemBData shouldReverseIterate:0 fallsOnWordBoundary:&v17];
  if (v16 != -1)
  {
    uint64_t v15 = [(ESEditScriptData *)self->super._itemAData indexOfFirstDifferenceWithOtherData:self->super._itemBData shouldReverseIterate:1 fallsOnWordBoundary:0];
    [(ESEditScriptRanged *)self removeAnyOverlapBetweenIndexOfFirstDifference:&v16 andReverseIndexOfLastDifference:&v15 shouldShortenFirstDifference:v17 == 0];
    uint64_t v4 = [(ESEditScriptData *)self->super._itemAData length];
    uint64_t v5 = v4 - v15;
    uint64_t v6 = [(ESEditScriptData *)self->super._itemBData length];
    uint64_t v7 = v6 - v15;
    uint64_t v8 = [(ESEditScriptData *)self->super._itemAData characterIndexForItem:v16];
    uint64_t v9 = [(ESEditScriptData *)self->super._itemAData characterIndexForItem:v5];
    uint64_t v10 = [(ESEditScriptData *)self->super._itemBData characterIndexForItem:v7] - v8;
    uint64_t v11 = [(ESEditScriptData *)self->super._itemBData stringValue];
    int64_t v12 = objc_msgSend(v11, "substringWithRange:", v8, v10);

    int64_t v13 = +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", v8, v9 - v8, v12);
    uint64_t v14 = [(ESEditScript *)self script];
    [v14 addObject:v13];
  }
}

+ (id)editScriptForSmallestSingleEditFromString:(id)a3 toString:(id)a4
{
  return (id)[a1 editScriptForSmallestSingleEditFromString:a3 toString:a4 chunkSize:0];
}

+ (id)editScriptForSmallestSingleEditFromString:(id)a3 toString:(id)a4 chunkSize:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[ESEditScriptRanged alloc] initWithOperationPrecedence:-1 dataClass:objc_opt_class() chunkSize:a5 stringA:v8 stringB:v7 orderAtomsAscending:1 options:1];

  [(ESEditScriptRanged *)v9 computeSmallestSingleEdit];
  return v9;
}

- (void).cxx_destruct
{
}

@end