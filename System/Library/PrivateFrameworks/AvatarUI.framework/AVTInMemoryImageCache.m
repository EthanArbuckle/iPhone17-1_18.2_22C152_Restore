@interface AVTInMemoryImageCache
- (AVTInMemoryImageCache)initWithLockProvider:(id)a3 logger:(id)a4;
@end

@implementation AVTInMemoryImageCache

- (AVTInMemoryImageCache)initWithLockProvider:(id)a3 logger:(id)a4
{
  return [(AVTInMemoryResourceCache *)self initWithLockProvider:a3 totalCostLimit:688900 logger:a4];
}

@end