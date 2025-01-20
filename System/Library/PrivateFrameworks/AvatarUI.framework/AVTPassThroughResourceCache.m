@interface AVTPassThroughResourceCache
- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4;
- (id)imageForItem:(id)a3 scope:(id)a4;
- (id)imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5;
- (id)resourceForItem:(id)a3 scope:(id)a4;
- (id)resourceForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5;
@end

@implementation AVTPassThroughResourceCache

- (id)imageForItem:(id)a3 scope:(id)a4
{
  return 0;
}

- (id)imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  return (id)(*((uint64_t (**)(id, id, id))a5 + 2))(a5, a3, a4);
}

- (id)resourceForItem:(id)a3 scope:(id)a4
{
  return 0;
}

- (id)resourceForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  return (id)(*((uint64_t (**)(id, id, id))a5 + 2))(a5, a3, a4);
}

- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4
{
  return 0;
}

@end