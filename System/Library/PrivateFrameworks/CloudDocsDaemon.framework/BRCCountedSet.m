@interface BRCCountedSet
- (unint64_t)totalCount;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation BRCCountedSet

- (void)addObject:(id)a3
{
  ++self->_totalCount;
  v3.receiver = self;
  v3.super_class = (Class)BRCCountedSet;
  [(BRCCountedSet *)&v3 addObject:a3];
}

- (void)removeObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BRCCountedSet;
  id v4 = a3;
  if ([(BRCCountedSet *)&v6 countForObject:v4]) {
    --self->_totalCount;
  }
  v5.receiver = self;
  v5.super_class = (Class)BRCCountedSet;
  [(BRCCountedSet *)&v5 removeObject:v4];
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

@end