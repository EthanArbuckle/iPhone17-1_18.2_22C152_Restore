@interface BLSHighLuminanceAlwaysOnAttribute
+ (id)highLuminanceWhileInAlwaysOn;
+ (id)highLuminanceWhileInAlwaysOnForFBSScene:(id)a3;
+ (id)highLuminanceWhileInAlwaysOnForFBSSceneIdentityToken:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSHighLuminanceAlwaysOnAttribute

+ (id)highLuminanceWhileInAlwaysOnForFBSScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFBSScene:v4];

  return v5;
}

+ (id)highLuminanceWhileInAlwaysOnForFBSSceneIdentityToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSceneIdentityToken:v4];

  return v5;
}

+ (id)highLuminanceWhileInAlwaysOn
{
  v2 = objc_alloc_init(BLSGlobalHighLuminanceAlwaysOnAttribute);

  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40C80 error:a4];
}

@end