@interface AKSparseMutableControllerArray
- (AKSparseMutableControllerArray)initWithCapacity:(unint64_t)a3;
- (BOOL)containsAnyObjects:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)_backFillUntilCount:(unint64_t)a3;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeLastObject;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation AKSparseMutableControllerArray

- (BOOL)containsAnyObjects:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  backendArray = self->_backendArray;
  id v5 = a3;
  v6 = [v3 setWithArray:backendArray];
  v7 = [MEMORY[0x263EFFA08] setWithObject:v5];

  LOBYTE(v5) = [v6 intersectsSet:v7];
  return (char)v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_backendArray count] > a3)
  {
    id v5 = [(NSMutableArray *)self->_backendArray objectAtIndex:a3];
    v6 = [MEMORY[0x263EFF9D0] null];
    int v7 = [v5 isEqual:v6];

    if (!v7) {
      goto LABEL_5;
    }
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

- (id)objectsAtIndexes:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = [v4 array];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_237666DB4;
  v11[3] = &unk_264CDB550;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateIndexesUsingBlock:v11];

  v8 = v12;
  id v9 = v7;

  return v9;
}

- (AKSparseMutableControllerArray)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKSparseMutableControllerArray;
  v4 = [(AKSparseMutableControllerArray *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    backendArray = v4->_backendArray;
    v4->_backendArray = (NSMutableArray *)v5;
  }
  return v4;
}

- (void)addObject:(id)a3
{
}

- (void)_backFillUntilCount:(unint64_t)a3
{
  while ([(NSMutableArray *)self->_backendArray count] < a3)
  {
    backendArray = self->_backendArray;
    v6 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)backendArray addObject:v6];
  }
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [(AKSparseMutableControllerArray *)self _backFillUntilCount:a4];
  [(NSMutableArray *)self->_backendArray insertObject:v6 atIndex:a4];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  unint64_t v6 = a3 + 1;
  id v7 = a4;
  [(AKSparseMutableControllerArray *)self _backFillUntilCount:v6];
  [(NSMutableArray *)self->_backendArray setObject:v7 atIndexedSubscript:a3];
}

- (unint64_t)count
{
  uint64_t v3 = [(NSMutableArray *)self->_backendArray count];
  while (v3-- >= 1)
  {
    uint64_t v5 = [(NSMutableArray *)self->_backendArray objectAtIndexedSubscript:v3];
    unint64_t v6 = [MEMORY[0x263EFF9D0] null];
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0) {
      return v3 + 1;
    }
  }
  return 0;
}

- (void)removeObject:(id)a3
{
}

- (void)removeLastObject
{
  uint64_t v3 = [(NSMutableArray *)self->_backendArray count];
  do
  {
    if (v3-- < 1) {
      break;
    }
    uint64_t v5 = [(NSMutableArray *)self->_backendArray objectAtIndexedSubscript:v3];
    [(NSMutableArray *)self->_backendArray removeObjectAtIndex:v3];
    unint64_t v6 = [MEMORY[0x263EFF9D0] null];
    char v7 = [v5 isEqual:v6];
  }
  while ((v7 & 1) != 0);
}

- (void)removeAllObjects
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_backendArray count] > a3)
  {
    backendArray = self->_backendArray;
    [(NSMutableArray *)backendArray removeObjectAtIndex:a3];
  }
}

- (void).cxx_destruct
{
}

@end