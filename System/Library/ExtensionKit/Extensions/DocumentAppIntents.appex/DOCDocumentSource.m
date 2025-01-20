@interface DOCDocumentSource
- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors;
- (UIImage)iconPreferingSymbolImages;
@end

@implementation DOCDocumentSource

- (UIImage)iconPreferingSymbolImages
{
  id v2 = [(DOCDocumentSource *)self iconForSize:1];

  return (UIImage *)v2;
}

- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors
{
  return 0;
}

@end