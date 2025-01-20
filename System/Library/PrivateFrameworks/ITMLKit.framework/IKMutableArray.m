@interface IKMutableArray
- (IKMutableArray)initWithCapacity:(int64_t)a3;
- (int64_t)expectedCapacity;
- (void)_convertToArrayStore;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)insertObject:(id)a3 atIndex:(int64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(int64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)setObject:(id)a3 atIndexedSubscript:(int64_t)a4;
@end

@implementation IKMutableArray

- (IKMutableArray)initWithCapacity:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKMutableArray;
  result = [(IKMutableArray *)&v5 init];
  if (result) {
    result->_expectedCapacity = a3;
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(int64_t)a4
{
  id v6 = a3;
  [(IKMutableArray *)self removeObjectAtIndex:a4];
  [(IKMutableArray *)self insertObject:v6 atIndex:a4];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  [(IKMutableArray *)self insertObject:v4 atIndex:[(IKArray *)self count]];
}

- (void)removeObject:(id)a3
{
  unint64_t v4 = [(IKArray *)self indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(IKMutableArray *)self removeObjectAtIndex:v4];
  }
}

- (void)insertObject:(id)a3 atIndex:(int64_t)a4
{
  id v14 = a3;
  if (!v14)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    objc_msgSend(NSString, "stringWithFormat:", @"Cannot insert nil object", v13);
    goto LABEL_6;
  }
  if (a4 < 0 || [(IKArray *)self count] < a4)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_msgSend(NSString, "stringWithFormat:", @"Index :%ld out of range", a4);
    v8 = LABEL_6:;
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  if ([(IKArray *)self count] == 2) {
    [(IKMutableArray *)self _convertToArrayStore];
  }
  v10 = [(IKArray *)self arrayStore];

  if (v10)
  {
    v11 = [(IKArray *)self arrayStore];
    [v11 insertObject:v14 atIndex:a4];
  }
  else if (a4)
  {
    [(IKArray *)self setObj1:v14];
  }
  else
  {
    v12 = [(IKArray *)self obj0];
    [(IKArray *)self setObj1:v12];

    [(IKArray *)self setObj0:v14];
  }
}

- (void)removeObjectAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(IKArray *)self count] <= a3)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C4A8];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Index :%ld out of range", a3);
    v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
    [v8 raise];
  }
  v9 = [(IKArray *)self arrayStore];

  if (v9)
  {
    v10 = [(IKArray *)self arrayStore];
    [v10 removeObjectAtIndex:a3];

    v11 = [(IKArray *)self arrayStore];
    uint64_t v12 = [v11 count];

    if (v12 == 2)
    {
      uint64_t v13 = [(IKArray *)self arrayStore];
      id v14 = [v13 objectAtIndexedSubscript:0];
      [(IKArray *)self setObj0:v14];

      v15 = [(IKArray *)self arrayStore];
      v16 = [v15 objectAtIndexedSubscript:1];
      [(IKArray *)self setObj1:v16];

      [(IKArray *)self setArrayStore:0];
    }
  }
  else
  {
    if (!a3)
    {
      v17 = [(IKArray *)self obj1];
      [(IKArray *)self setObj0:v17];
    }
    [(IKArray *)self setObj1:0];
  }
}

- (void)addObjectsFromArray:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [v10 obj0];

  if (v4)
  {
    objc_super v5 = [v10 obj0];
    [(IKMutableArray *)self addObject:v5];

    uint64_t v6 = [v10 obj1];

    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = [v10 obj1];
    [(IKMutableArray *)self addObject:v7];
  }
  else
  {
    v8 = [v10 arrayStore];

    if (!v8) {
      goto LABEL_7;
    }
    [(IKMutableArray *)self _convertToArrayStore];
    uint64_t v7 = [(IKArray *)self arrayStore];
    v9 = [v10 arrayStore];
    [v7 addObjectsFromArray:v9];
  }
LABEL_7:
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v13 obj0];

  if (v7)
  {
    v8 = [v13 obj0];
    -[IKMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v8, [v6 firstIndex]);

    v9 = [v13 obj1];

    if (!v9) {
      goto LABEL_7;
    }
    id v10 = [v13 obj1];
    -[IKMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v10, [v6 lastIndex]);
  }
  else
  {
    v11 = [v13 arrayStore];

    if (!v11) {
      goto LABEL_7;
    }
    [(IKMutableArray *)self _convertToArrayStore];
    id v10 = [(IKArray *)self arrayStore];
    uint64_t v12 = [v13 arrayStore];
    [v10 insertObjects:v12 atIndexes:v6];
  }
LABEL_7:
}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [(IKArray *)self arrayStore];

  if (v4)
  {
    objc_super v5 = [(IKArray *)self arrayStore];
    [v5 removeObjectsAtIndexes:v14];

    id v6 = [(IKArray *)self arrayStore];
    uint64_t v7 = [v6 count];

    if (v7 > 2) {
      goto LABEL_13;
    }
    if (v7 == 1)
    {
      id v10 = [(IKArray *)self arrayStore];
      v11 = [v10 objectAtIndexedSubscript:0];
      [(IKArray *)self setObj0:v11];
    }
    else
    {
      if (v7 != 2)
      {
LABEL_12:
        [(IKArray *)self setArrayStore:0];
        goto LABEL_13;
      }
      v8 = [(IKArray *)self arrayStore];
      v9 = [v8 objectAtIndexedSubscript:0];
      [(IKArray *)self setObj0:v9];

      id v10 = [(IKArray *)self arrayStore];
      v11 = [v10 objectAtIndexedSubscript:1];
      [(IKArray *)self setObj1:v11];
    }

    goto LABEL_12;
  }
  uint64_t v12 = [v14 lastIndex];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v12; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v14 indexLessThanIndex:i])
      [(IKMutableArray *)self removeObjectAtIndex:i];
  }
LABEL_13:
}

- (void)_convertToArrayStore
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  int64_t v4 = [(IKMutableArray *)self expectedCapacity];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 2;
  }
  id v10 = [v3 arrayWithCapacity:v5];
  id v6 = [(IKArray *)self obj0];

  if (v6)
  {
    uint64_t v7 = [(IKArray *)self obj0];
    [v10 addObject:v7];

    [(IKArray *)self setObj0:0];
    v8 = [(IKArray *)self obj1];

    if (v8)
    {
      v9 = [(IKArray *)self obj1];
      [v10 addObject:v9];

      [(IKArray *)self setObj1:0];
    }
  }
  [(IKArray *)self setArrayStore:v10];
}

- (int64_t)expectedCapacity
{
  return self->_expectedCapacity;
}

@end