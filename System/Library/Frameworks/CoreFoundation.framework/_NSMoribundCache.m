@interface _NSMoribundCache
- (BOOL)evictsObjectsWithDiscardedContent;
- (id)delegate;
- (id)name;
- (id)objectForKey:(id)a3;
- (unint64_t)countLimit;
- (unint64_t)retainCount;
- (unint64_t)totalCostLimit;
- (void)dealloc;
@end

@implementation _NSMoribundCache

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  v8.receiver = self;
  v8.super_class = (Class)_NSMoribundCache;
  [(NSCache *)&v8 dealloc];
  CFLog(3, @"Deallocating immortal cache!", v2, v3, v4, v5, v6, v7, (__int16)v8.receiver);
  __break(1u);
}

- (id)name
{
  return &stru_1ECE10768;
}

- (id)delegate
{
  return 0;
}

- (id)objectForKey:(id)a3
{
  return 0;
}

- (unint64_t)totalCostLimit
{
  return 0;
}

- (unint64_t)countLimit
{
  return 0;
}

- (BOOL)evictsObjectsWithDiscardedContent
{
  return 0;
}

@end