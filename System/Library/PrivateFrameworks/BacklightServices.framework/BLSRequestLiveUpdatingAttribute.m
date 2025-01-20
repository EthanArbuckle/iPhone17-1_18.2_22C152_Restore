@interface BLSRequestLiveUpdatingAttribute
+ (id)requestLiveUpdatingForFBSScene:(id)a3;
+ (id)requestLiveUpdatingForFBSSceneIdentityToken:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSRequestLiveUpdatingAttribute

+ (id)requestLiveUpdatingForFBSScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFBSScene:v4];

  return v5;
}

+ (id)requestLiveUpdatingForFBSSceneIdentityToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSceneIdentityToken:v4];

  return v5;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40CE0 error:a4];
}

@end