@interface UIImage(MPArtworkCatalog)
- (id)artworkCatalogBackingFileURL;
@end

@implementation UIImage(MPArtworkCatalog)

- (id)artworkCatalogBackingFileURL
{
  return objc_getAssociatedObject(a1, "MPArtworkRepresentationBackingFileURLAssociatedKey");
}

@end