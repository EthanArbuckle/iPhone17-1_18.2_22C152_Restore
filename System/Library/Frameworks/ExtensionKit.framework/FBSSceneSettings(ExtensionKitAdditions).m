@interface FBSSceneSettings(ExtensionKitAdditions)
- (id)ex_role;
@end

@implementation FBSSceneSettings(ExtensionKitAdditions)

- (id)ex_role
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20211529];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = (void *)*MEMORY[0x263F04E28];
  }
  id v8 = v7;

  return v8;
}

@end