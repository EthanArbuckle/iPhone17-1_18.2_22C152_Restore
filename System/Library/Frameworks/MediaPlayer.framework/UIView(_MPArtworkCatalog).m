@interface UIView(_MPArtworkCatalog)
- (id)_lastArtworkCatalog;
@end

@implementation UIView(_MPArtworkCatalog)

- (id)_lastArtworkCatalog
{
  return objc_getAssociatedObject(a1, (const void *)_MPArtworkCatalogLastAssociatedObjectKey);
}

@end