@interface NSSetChanges
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isToManyChangeInformation;
- (int64_t)_toManyPropertyType;
- (unint64_t)changeCount;
- (void)addChange:(id)a3;
- (void)addObject:(id)a3;
- (void)applyChangesToSet:(id)a3;
- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation NSSetChanges

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSSetChanges == a1)
  {
    return +[NSSetChanges allocWithZone:a3];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSSetChanges;
    return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (BOOL)_isToManyChangeInformation
{
  return 1;
}

- (int64_t)_toManyPropertyType
{
  return 0;
}

- (void)addChange:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
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

- (void)addObject:(id)a3
{
  objc_super v4 = [[NSSetChange alloc] initWithType:2 object:a3];
  [(NSSetChanges *)self addChange:v4];
}

- (void)removeObject:(id)a3
{
  objc_super v4 = [[NSSetChange alloc] initWithType:3 object:a3];
  [(NSSetChanges *)self addChange:v4];
}

- (void)applyChangesToSet:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__NSSetChanges_NSSetChangeActions__applyChangesToSet___block_invoke;
  v3[3] = &unk_1E51FA900;
  v3[4] = a3;
  [(NSSetChanges *)self enumerateChangesUsingBlock:v3];
}

uint64_t __54__NSSetChanges_NSSetChangeActions__applyChangesToSet___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 changeType] == 2)
  {
    objc_super v4 = *(void **)(a1 + 32);
    uint64_t v5 = [a2 value];
    return [v4 addObject:v5];
  }
  else
  {
    uint64_t result = [a2 changeType];
    if (result == 3)
    {
      v7 = *(void **)(a1 + 32);
      uint64_t v8 = [a2 value];
      return [v7 removeObject:v8];
    }
  }
  return result;
}

@end