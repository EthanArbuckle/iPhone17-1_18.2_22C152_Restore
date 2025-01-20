@interface NSConcreteOrderedSetChanges
- (NSConcreteOrderedSetChanges)init;
- (NSConcreteOrderedSetChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)changeCount;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_enumerateChanges:(unint64_t)a3 stop:(BOOL *)a4 usingBlock:(id)a5;
- (void)addChange:(id)a3;
- (void)dealloc;
- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
@end

@implementation NSConcreteOrderedSetChanges

- (NSConcreteOrderedSetChanges)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSConcreteOrderedSetChanges;
  v2 = [(NSConcreteOrderedSetChanges *)&v6 init];
  uint64_t v5 = 0;
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    _NSOrderedChangesInit((uint64_t)&v2->_changes, v3, (uint64_t)&v5, 0);
  }
  return v2;
}

- (NSConcreteOrderedSetChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteOrderedSetChanges;
  objc_super v6 = [(NSConcreteOrderedSetChanges *)&v9 init];
  if (v6)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    _NSOrderedChangesInit((uint64_t)&v6->_changes, v7, (uint64_t)a3, a4);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _NSOrderedChangesRelease((uint64_t)&self->_changes);
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteOrderedSetChanges;
  [(NSConcreteOrderedSetChanges *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NSOrderedSetChanges allocWithZone:a3];
  _NSOrderedChangesCopy((uint64_t)&self->_changes, (uint64_t)&v4->_changes);
  return v4;
}

- (unint64_t)count
{
  return [(isMutable *)self->_changes.objects count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(isMutable *)self->_changes.objects objectAtIndex:a3];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(isMutable *)self->_changes.objects countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
}

- (unint64_t)changeCount
{
  return self->_changes.list.count;
}

- (void)_enumerateChanges:(unint64_t)a3 stop:(BOOL *)a4 usingBlock:(id)a5
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__NSConcreteOrderedSetChanges__enumerateChanges_stop_usingBlock___block_invoke;
  v5[3] = &unk_1E51F9930;
  v5[4] = a5;
  _NSOrderedChangesEnumerateChanges((uint64_t)&self->_changes, a3, a4, (uint64_t)v5);
}

void __65__NSConcreteOrderedSetChanges__enumerateChanges_stop_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = [NSOrderedSetChange alloc];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = a3;
  }
  v12 = [(NSOrderedSetChange *)v10 initWithType:a2 sourceIndex:v11 destinationIndex:a4 value:a5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  [(NSConcreteOrderedSetChanges *)self _enumerateChanges:62 stop:&v3 usingBlock:a3];
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  char v4 = 0;
  [(NSConcreteOrderedSetChanges *)self _enumerateChanges:1 << a3 stop:&v4 usingBlock:a4];
}

- (void)addChange:(id)a3
{
  uint64_t v5 = [a3 sourceIndex];
  uint64_t v6 = [a3 destinationIndex];
  [(NSConcreteOrderedSetChanges *)self willChangeValueForKey:@"changeCount"];
  uint64_t v7 = [a3 changeType];
  if (v5 == v6) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _NSOrderedChangesAddChange((uint64_t)&self->_changes, v7, v5, v6, (void *)[a3 value]);

  [(NSConcreteOrderedSetChanges *)self didChangeValueForKey:@"changeCount"];
}

@end