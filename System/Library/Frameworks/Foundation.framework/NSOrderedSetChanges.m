@interface NSOrderedSetChanges
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isToManyChangeInformation;
- (NSOrderedSetChanges)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_toManyPropertyType;
- (unint64_t)changeCount;
- (void)addChange:(id)a3;
- (void)addChanges:(id)a3;
- (void)applyChangesToOrderedSet:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)updateObject:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation NSOrderedSetChanges

- (BOOL)_isToManyChangeInformation
{
  return 1;
}

- (int64_t)_toManyPropertyType
{
  return 2;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSOrderedSetChanges == a1)
  {
    return +[NSOrderedSetChanges allocWithZone:a3];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSOrderedSetChanges;
    return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (NSOrderedSetChanges)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSOrderedSetChanges;
  objc_super v4 = [(NSOrderedSetChanges *)&v8 init];
  if (v4)
  {
    unint64_t v7 = 0;
    [a3 decodeValueOfObjCType:"Q" at:&v7 size:8];
    if (v7)
    {
      for (unint64_t i = 0; i < v7; ++i)
        -[NSOrderedSetChanges addChange:](v4, "addChange:", [a3 decodeObject]);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = [(NSOrderedSetChanges *)self changeCount];
  [a3 encodeValueOfObjCType:"Q" at:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__NSOrderedSetChanges_encodeWithCoder___block_invoke;
  v5[3] = &unk_1E51FA258;
  v5[4] = a3;
  [(NSOrderedSetChanges *)self enumerateChangesUsingBlock:v5];
}

uint64_t __39__NSOrderedSetChanges_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) encodeObject:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [+[NSOrderedSetChanges allocWithZone:a3] init];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __36__NSOrderedSetChanges_copyWithZone___block_invoke;
  v6[3] = &unk_1E51FA258;
  v6[4] = v4;
  [(NSOrderedSetChanges *)self enumerateChangesUsingBlock:v6];
  return v4;
}

uint64_t __36__NSOrderedSetChanges_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addChange:a2];
}

- (unint64_t)changeCount
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  v6 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)addChange:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  if (a3 != a4)
  {
    unint64_t v5 = a4;
    uint64_t v8 = -[NSOrderedSetChanges objectAtIndex:](self, "objectAtIndex:");
    uint64_t v9 = [(NSOrderedSetChanges *)self objectAtIndex:v5];
    if (a3 <= v5) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v9;
    }
    if (a3 > v5)
    {
      unint64_t v11 = a3;
    }
    else
    {
      uint64_t v8 = v9;
      unint64_t v11 = v5;
    }
    if (a3 < v5) {
      unint64_t v5 = a3;
    }
    v12 = [[NSOrderedSetChange alloc] initWithType:5 sourceIndex:v5 destinationIndex:v11 value:v10];
    v13 = [[NSOrderedSetChange alloc] initWithType:5 sourceIndex:v11 - 1 destinationIndex:v5 value:v8];
    [(NSOrderedSetChanges *)self addChange:v12];
    [(NSOrderedSetChanges *)self addChange:v13];
  }
}

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 firstIndex];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    do
    {
      [(NSOrderedSetChanges *)self moveObjectAtIndex:v8 toIndex:a4];
      uint64_t v8 = [a3 indexGreaterThanIndex:v8];
      ++a4;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)addChanges:(id)a3
{
  if ([a3 count])
  {
    unint64_t v5 = 0;
    do
      -[NSOrderedSetChanges addChange:](self, "addChange:", [a3 objectAtIndexedSubscript:v5++]);
    while (v5 < [a3 count]);
  }
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v5 = [[NSOrderedSetChange alloc] initWithType:2 sourceIndex:a4 destinationIndex:a4 value:a3];
  [(NSOrderedSetChanges *)self addChange:v5];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v4 = [[NSOrderedSetChange alloc] initWithType:3 sourceIndex:a3 destinationIndex:a3 value:0];
  [(NSOrderedSetChanges *)self addChange:v4];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  unint64_t v5 = [[NSOrderedSetChange alloc] initWithType:4 sourceIndex:a3 destinationIndex:a3 value:a4];
  [(NSOrderedSetChanges *)self addChange:v5];
}

- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  unint64_t v5 = [[NSOrderedSetChange alloc] initWithType:5 sourceIndex:a3 destinationIndex:a4 value:[(NSOrderedSetChanges *)self objectAtIndex:a3]];
  [(NSOrderedSetChanges *)self addChange:v5];
}

- (void)updateObject:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v5 = [[NSOrderedSetChange alloc] initWithType:1 sourceIndex:a4 destinationIndex:a4 value:a3];
  [(NSOrderedSetChanges *)self addChange:v5];
}

- (void)applyChangesToOrderedSet:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__NSOrderedSetChanges_NSArrayChangeActions__applyChangesToOrderedSet___block_invoke;
  v3[3] = &unk_1E51FA258;
  v3[4] = a3;
  [(NSOrderedSetChanges *)self enumerateChangesUsingBlock:v3];
}

uint64_t __70__NSOrderedSetChanges_NSArrayChangeActions__applyChangesToOrderedSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 changeType];
  switch(result)
  {
    case 1:
      return result;
    case 2:
      unint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = [a2 value];
      uint64_t v7 = [a2 destinationIndex];
      uint64_t result = [v5 insertObject:v6 atIndex:v7];
      break;
    case 3:
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [a2 destinationIndex];
      uint64_t result = [v8 removeObjectAtIndex:v9];
      break;
    case 4:
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [a2 destinationIndex];
      uint64_t v12 = [a2 value];
      uint64_t result = [v10 replaceObjectAtIndex:v11 withObject:v12];
      break;
    default:
      uint64_t result = [a2 changeType];
      if (result == 5)
      {
        v13 = *(void **)(a1 + 32);
        v14 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [a2 sourceIndex]);
        uint64_t v15 = [a2 destinationIndex];
        uint64_t result = [v13 moveObjectsAtIndexes:v14 toIndex:v15];
      }
      break;
  }
  return result;
}

@end