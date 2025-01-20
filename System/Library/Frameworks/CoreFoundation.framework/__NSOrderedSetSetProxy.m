@interface __NSOrderedSetSetProxy
- (__NSOrderedSetSetProxy)initWithOrderedSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation __NSOrderedSetSetProxy

- (__NSOrderedSetSetProxy)initWithOrderedSet:(id)a3
{
  self->_orderedSet = a3;
  return self;
}

- (id)member:(id)a3
{
  uint64_t v4 = [self->_orderedSet indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v6 = v4;
  id orderedSet = self->_orderedSet;

  return (id)[orderedSet objectAtIndex:v6];
}

- (unint64_t)count
{
  return [self->_orderedSet count];
}

- (id)objectEnumerator
{
  return (id)[self->_orderedSet objectEnumerator];
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetSetProxy;
  [(__NSOrderedSetSetProxy *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NSSet allocWithZone:a3];

  return [(NSSet *)v4 initWithSet:self copyItems:0];
}

@end