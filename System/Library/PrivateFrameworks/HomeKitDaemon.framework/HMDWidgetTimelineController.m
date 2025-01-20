@interface HMDWidgetTimelineController
- (id)reloadTimelineWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 reason:(id)a5;
@end

@implementation HMDWidgetTimelineController

- (id)reloadTimelineWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F31E68]) initWithExtensionBundleIdentifier:v8 kind:v9];
    v12 = [v11 reloadTimelineWithReason:v10];
  }
  else
  {
    v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  }

  return v12;
}

@end