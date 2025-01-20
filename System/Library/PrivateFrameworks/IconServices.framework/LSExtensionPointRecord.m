@interface LSExtensionPointRecord
@end

@implementation LSExtensionPointRecord

void __77__LSExtensionPointRecord_IconServicesAdditions___IS_extensionsCanProvideIcon__block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.watchkit";
  v4[1] = @"com.apple.message-payload-provider";
  v4[2] = @"com.apple.services";
  v4[3] = @"com.apple.ui-services";
  v4[4] = @"com.apple.fileprovider-nonui";
  v4[5] = @"com.apple.fileprovider-actionsui";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_IS_extensionsCanProvideIcon_extensionPointsWithIcons;
  _IS_extensionsCanProvideIcon_extensionPointsWithIcons = v2;
}

void __92__LSExtensionPointRecord_IconServicesAdditions___IS_extensionsShouldFallbackToContainerIcon__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.watchkit";
  v4[1] = @"com.apple.message-payload-provider";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_IS_extensionsShouldFallbackToContainerIcon_extensionPointsHavingExtensionThatMustProvideIcons;
  _IS_extensionsShouldFallbackToContainerIcon_extensionPointsHavingExtensionThatMustProvideIcons = v2;
}

@end