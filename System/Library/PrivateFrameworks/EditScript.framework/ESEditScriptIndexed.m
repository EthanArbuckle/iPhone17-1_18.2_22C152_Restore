@interface ESEditScriptIndexed
+ (id)editScriptFromArray:(id)a3 toArray:(id)a4;
+ (id)editScriptFromArray:(id)a3 toArray:(id)a4 orderAtomsAscending:(BOOL)a5 operationPrecedence:(int64_t)a6;
- (ESEditScriptIndexed)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 fromArray:(id)a5 toArray:(id)a6 orderAtomsAscending:(BOOL)a7;
- (id)applyToArray:(id)a3;
- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6;
- (void)finalizeCurrentScriptAtom;
- (void)initializeCurrentScriptAtom;
@end

@implementation ESEditScriptIndexed

- (ESEditScriptIndexed)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 fromArray:(id)a5 toArray:(id)a6 orderAtomsAscending:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ESEditScriptIndexed;
  v14 = [(ESEditScript *)&v20 initWithOperationPrecedence:a3 orderAtomsAscending:v7];
  if (v14)
  {
    uint64_t v15 = [(objc_class *)a4 EditScriptDataWithArray:v12];
    itemAData = v14->super._itemAData;
    v14->super._itemAData = (ESEditScriptData *)v15;

    uint64_t v17 = [(objc_class *)a4 EditScriptDataWithArray:v13];
    itemBData = v14->super._itemBData;
    v14->super._itemBData = (ESEditScriptData *)v17;
  }
  return v14;
}

+ (id)editScriptFromArray:(id)a3 toArray:(id)a4
{
  return (id)[a1 editScriptFromArray:a3 toArray:a4 orderAtomsAscending:0 operationPrecedence:-1];
}

+ (id)editScriptFromArray:(id)a3 toArray:(id)a4 orderAtomsAscending:(BOOL)a5 operationPrecedence:(int64_t)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[ESEditScriptIndexed alloc] initWithOperationPrecedence:a6 dataClass:objc_opt_class() fromArray:v10 toArray:v9 orderAtomsAscending:v7];

  [(ESEditScript *)v11 computeDistanceMatrix];
  [(ESEditScript *)v11 computeEditsFromMatrix];
  return v11;
}

- (id)applyToArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (void *)MEMORY[0x263EFFA68];
  }
  v6 = (void *)[v5 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v7 = [(ESEditScript *)self script];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v12 editOperation];
        if (v13 == 1)
        {
          objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v12, "indexToEdit"));
        }
        else
        {
          if (v13 == 2)
          {
            v14 = [v12 replacementText];
            objc_msgSend(v6, "insertObject:atIndex:", v14, objc_msgSend(v12, "indexToEdit"));
          }
          else
          {
            if (v13 != 3) {
              continue;
            }
            v14 = [v12 replacementText];
            objc_msgSend(v6, "setObject:atIndexedSubscript:", v14, objc_msgSend(v12, "indexToEdit"));
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
  id v10 = a5;
  id v11 = v10;
  if (a3)
  {
    if (a3 == 2) {
      unint64_t v12 = a4;
    }
    else {
      unint64_t v12 = a4 - 1;
    }
    id v15 = v10;
    uint64_t v13 = +[ESAtomIndexed atomWithEditOperation:a3 indexToEdit:v12 newText:v10 indexInArrayB:a6];
    currentScriptAtom = self->_currentScriptAtom;
    self->_currentScriptAtom = v13;

    id v10 = (id)[(ESEditScriptIndexed *)self finalizeCurrentScriptAtom];
    id v11 = v15;
  }
  MEMORY[0x270F9A758](v10, v11);
}

- (void)finalizeCurrentScriptAtom
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  currentScriptAtom = self->_currentScriptAtom;
  if (currentScriptAtom)
  {
    if (self->super._orderAtomsAscending)
    {
      if ([(ESAtomIndexed *)currentScriptAtom editOperation] == 2)
      {
        uint64_t v4 = 1;
      }
      else if ([(ESAtomIndexed *)self->_currentScriptAtom editOperation] == 1)
      {
        uint64_t v4 = -1;
      }
      else
      {
        uint64_t v4 = 0;
      }
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v6 = [(ESEditScript *)self script];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setIndexToEdit:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "indexToEdit") + v4);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }

      v5 = [(ESEditScript *)self script];
      [v5 insertObject:self->_currentScriptAtom atIndex:0];
    }
    else
    {
      v5 = [(ESEditScript *)self script];
      [v5 addObject:self->_currentScriptAtom];
    }

    id v11 = self->_currentScriptAtom;
    self->_currentScriptAtom = 0;
  }
}

- (void).cxx_destruct
{
}

@end