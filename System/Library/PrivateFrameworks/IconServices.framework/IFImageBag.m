@interface IFImageBag
@end

@implementation IFImageBag

void __60__IFImageBag_IconServicesAdditions__defaultAppIconAssetsBag__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  uint64_t v0 = [MEMORY[0x1E4F6F1F0] imageBagWithResourcesNamed:@"DefaultIcon" fromBundle:v2];
  v1 = (void *)defaultAppIconAssetsBag_bag;
  defaultAppIconAssetsBag_bag = v0;
}

void __60__IFImageBag_IconServicesAdditions__defaultAppClipAssetsBag__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  uint64_t v0 = [MEMORY[0x1E4F6F1F0] imageBagWithResourcesNamed:@"AppClipDefaultIcon" fromBundle:v2];
  v1 = (void *)defaultAppClipAssetsBag_bag;
  defaultAppClipAssetsBag_bag = v0;
}

@end