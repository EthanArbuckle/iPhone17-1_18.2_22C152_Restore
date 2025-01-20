@interface BLSRequestUnrestrictedFramerateAttribute
+ (id)requestUnrestrictedFramerate;
+ (id)requestUnrestrictedFramerateForFBSScene:(id)a3;
+ (id)requestUnrestrictedFramerateForFBSSceneIdentityToken:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSRequestUnrestrictedFramerateAttribute

+ (id)requestUnrestrictedFramerateForFBSScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFBSScene:v4];

  return v5;
}

+ (id)requestUnrestrictedFramerateForFBSSceneIdentityToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSceneIdentityToken:v4];

  return v5;
}

+ (id)requestUnrestrictedFramerate
{
  v2 = objc_alloc_init(BLSRequestGlobalUnrestrictedFramerateAttribute);

  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40D00 error:a4];
}

@end