@interface FBSSceneSettings(FBUIApplicationSceneSettings)
- (id)fb_fallbackSpecification;
@end

@implementation FBSSceneSettings(FBUIApplicationSceneSettings)

- (id)fb_fallbackSpecification
{
  if (objc_msgSend(a1, "_uikitShimming_isUISubclass")
    && UIKitLibraryCore()
    && getUIApplicationSceneSpecificationClass())
  {
    id v1 = (id)UIKitLibraryCore();
    if (v1) { {
      id v1 = getUIApplicationSceneSpecificationClass();
    }
    }
    id v2 = v1;
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F62AB0];
  }
  v3 = [v2 specification];

  return v3;
}

@end