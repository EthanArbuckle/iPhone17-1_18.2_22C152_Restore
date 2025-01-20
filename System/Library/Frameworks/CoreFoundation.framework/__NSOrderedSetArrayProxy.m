@interface __NSOrderedSetArrayProxy
- (__NSOrderedSetArrayProxy)initWithOrderedSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation __NSOrderedSetArrayProxy

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[self->_orderedSet objectAtIndex:a3];
}

- (unint64_t)count
{
  return [self->_orderedSet count];
}

- (__NSOrderedSetArrayProxy)initWithOrderedSet:(id)a3
{
  self->_orderedSet = a3;
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetArrayProxy;
  [(__NSOrderedSetArrayProxy *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NSArray allocWithZone:a3];
  unint64_t v5 = [(__NSOrderedSetArrayProxy *)self count];

  return -[NSArray initWithArray:range:copyItems:](v4, "initWithArray:range:copyItems:", self, 0, v5, 0);
}

@end