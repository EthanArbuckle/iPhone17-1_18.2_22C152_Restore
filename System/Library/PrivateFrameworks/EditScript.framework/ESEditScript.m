@interface ESEditScript
- (ESEditScript)initWithOperationPrecedence:(int64_t)a3 orderAtomsAscending:(BOOL)a4;
- (NSArray)operationPrecedenceArray;
- (NSMutableArray)script;
- (id)description;
- (id)operationPrecedenceArrayFromOperationPrecedence:(int64_t)a3;
- (void)computeDistanceMatrix;
- (void)computeEditsFromMatrix;
- (void)setOperationPrecedenceArray:(id)a3;
- (void)setScript:(id)a3;
@end

@implementation ESEditScript

- (id)operationPrecedenceArrayFromOperationPrecedence:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return &unk_26EC8C068;
  }
  else {
    return (id)qword_264D85998[a3 - 1];
  }
}

- (ESEditScript)initWithOperationPrecedence:(int64_t)a3 orderAtomsAscending:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ESEditScript;
  v6 = [(ESEditScript *)&v13 init];
  v7 = v6;
  if (v6)
  {
    distanceMatrix = v6->_distanceMatrix;
    v6->_distanceMatrix = 0;

    v7->_orderAtomsAscending = a4;
    uint64_t v9 = [(ESEditScript *)v7 operationPrecedenceArrayFromOperationPrecedence:a3];
    operationPrecedenceArray = v7->_operationPrecedenceArray;
    v7->_operationPrecedenceArray = (NSArray *)v9;

    v11 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
    [(ESEditScript *)v7 setScript:v11];
  }
  return v7;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  distanceMatrix = self->_distanceMatrix;
  if (distanceMatrix)
  {
    v5 = [(ESIntArray2D *)distanceMatrix description];
    [v3 appendFormat:@"Distance Matrix:\n%@\n", v5];
  }
  operationPrecedenceArray = self->_operationPrecedenceArray;
  if (operationPrecedenceArray)
  {
    v7 = [(NSArray *)operationPrecedenceArray description];
    [v3 appendFormat:@"Order of Precedence:%@\n", v7];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_script;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v3 appendString:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v3;
}

- (void)computeDistanceMatrix
{
  unint64_t v3 = [(ESEditScriptData *)self->_itemAData length];
  unint64_t v4 = [(ESEditScriptData *)self->_itemBData length];
  v5 = +[ESIntArray2D arrayWithISize:v3 + 1 jSize:v4 + 1];
  [(ESIntArray2D *)v5 setShouldBoundsCheck:1];
  if (v3)
  {
    for (unint64_t i = 1; i <= v3; ++i)
      [(ESIntArray2D *)v5 :i :0 newValue:i];
  }
  if (v4)
  {
    for (unint64_t j = 1; j <= v4; ++j)
      [(ESIntArray2D *)v5 :0 :j newValue:j];
    unint64_t v8 = 1;
    unint64_t v18 = v4;
    do
    {
      if (v3)
      {
        for (unint64_t k = 1; k <= v3; ++k)
        {
          uint64_t v10 = [(ESEditScriptData *)self->_itemAData stringAtIndex:k - 1];
          uint64_t v11 = [(ESEditScriptData *)self->_itemBData stringAtIndex:v8 - 1];
          int v12 = [v10 isEqualToString:v11];

          if (v12)
          {
            uint64_t v13 = [(ESIntArray2D *)v5 :k - 1 :v8 - 1];
          }
          else
          {
            uint64_t v14 = [(ESIntArray2D *)v5 :k - 1 :v8] + 1;
            uint64_t v15 = [(ESIntArray2D *)v5 :k :v8 - 1];
            if (v14 >= v15 + 1) {
              uint64_t v14 = v15 + 1;
            }
            uint64_t v16 = [(ESIntArray2D *)v5 :k - 1 :v8 - 1];
            if (v14 >= v16 + 1) {
              uint64_t v13 = v16 + 1;
            }
            else {
              uint64_t v13 = v14;
            }
          }
          [(ESIntArray2D *)v5 :k :v8 newValue:v13];
        }
      }
      ++v8;
    }
    while (v8 <= v18);
  }
  distanceMatrix = self->_distanceMatrix;
  self->_distanceMatrix = v5;
}

- (void)computeEditsFromMatrix
{
  [(ESEditScript *)self initializeCurrentScriptAtom];
  self->_currentOperation = 0;
  v29 = self->_distanceMatrix;
  uint64_t v3 = [(ESIntArray2D *)v29 iSize] - 1;
  uint64_t v4 = [(ESIntArray2D *)v29 jSize] - 1;
  if (v3 <= 0 && v4 < 1) {
    goto LABEL_57;
  }
  uint64_t v6 = 0;
  do
  {
    uint64_t v27 = v6;
    uint64_t v7 = v3--;
    uint64_t v8 = [(ESIntArray2D *)v29 :v3 :v4 outOfBoundsReturnValue:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v28 = v4;
    uint64_t v9 = v4 - 1;
    uint64_t v10 = [(ESIntArray2D *)v29 :v7 :v4 - 1 outOfBoundsReturnValue:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v11 = [(ESIntArray2D *)v29 :v3 :v4 - 1 outOfBoundsReturnValue:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v12 = [(NSArray *)self->_operationPrecedenceArray count];
    uint64_t v13 = v12 - 1;
    if (v12 < 1)
    {
LABEL_37:
      uint64_t v3 = v7;
      uint64_t v6 = v27;
      if (v27 == 1)
      {
LABEL_38:
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v6 = 1;
        v24 = &stru_26EC8A8E0;
        uint64_t v4 = v28;
      }
      else
      {
        uint64_t v3 = v7;
        v24 = &stru_26EC8A8E0;
        uint64_t v4 = v28;
        uint64_t v9 = v28;
      }
      goto LABEL_55;
    }
    int v15 = v11 < v8 && v11 < v10;
    int v17 = v10 < v8 && v10 < v11;
    BOOL v19 = v8 < v10 && v8 < v11;
    while (1)
    {
      uint64_t v20 = [(NSArray *)self->_operationPrecedenceArray objectAtIndex:v13];
      uint64_t v21 = [v20 integerValue];

      if (v21 == 3) {
        break;
      }
      if (v21 == 2)
      {
        if (((v13 != 0) & ~v17) == 0)
        {
          if (v28 < 1)
          {
            v24 = 0;
          }
          else
          {
            v24 = [(ESEditScriptData *)self->_itemBData stringAtIndex:v9];
          }
          uint64_t v6 = 2;
          uint64_t v3 = v7;
          goto LABEL_54;
        }
      }
      else if (v21 == 1 && (!v13 || v19))
      {
        goto LABEL_38;
      }
LABEL_36:
      unint64_t v23 = v13-- + 1;
      if (v23 <= 1) {
        goto LABEL_37;
      }
    }
    if (((v13 != 0) & ~v15) != 0) {
      goto LABEL_36;
    }
    if (v7 < 1)
    {
      v25 = 0;
    }
    else
    {
      v25 = [(ESEditScriptData *)self->_itemAData stringAtIndex:v3];
    }
    if (v28 < 1)
    {
      v26 = 0;
    }
    else
    {
      v26 = [(ESEditScriptData *)self->_itemBData stringAtIndex:v9];
    }
    if ([v25 isEqualToString:v26])
    {
      uint64_t v6 = 0;
      v24 = &stru_26EC8A8E0;
    }
    else
    {
      v24 = v26;
      uint64_t v6 = 3;
    }

LABEL_54:
    uint64_t v4 = v9;
LABEL_55:
    [(ESEditScript *)self addToCurrentScriptAtomEditOperation:v6 editIndex:v7 newText:v24 indexInArrayB:v9];
  }
  while (v3 > 0 || v4 > 0);
LABEL_57:
  [(ESEditScript *)self finalizeCurrentScriptAtom];
}

- (NSArray)operationPrecedenceArray
{
  return self->_operationPrecedenceArray;
}

- (void)setOperationPrecedenceArray:(id)a3
{
}

- (NSMutableArray)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_script, 0);
  objc_storeStrong((id *)&self->_operationPrecedenceArray, 0);
  objc_storeStrong((id *)&self->_itemBData, 0);
  objc_storeStrong((id *)&self->_itemAData, 0);
  objc_storeStrong((id *)&self->_distanceMatrix, 0);
}

@end