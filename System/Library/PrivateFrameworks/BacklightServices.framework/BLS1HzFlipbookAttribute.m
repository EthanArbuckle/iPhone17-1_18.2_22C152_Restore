@interface BLS1HzFlipbookAttribute
+ (id)set1HzFlipbooForFBSSceneIdentityToken:(id)a3;
+ (id)set1HzFlipbook;
+ (id)set1HzFlipbookForFBSScene:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLS1HzFlipbookAttribute

+ (id)set1HzFlipbookForFBSScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFBSScene:v4];

  return v5;
}

+ (id)set1HzFlipbooForFBSSceneIdentityToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSceneIdentityToken:v4];

  return v5;
}

+ (id)set1HzFlipbook
{
  v2 = objc_alloc_init(BLSGlobal1HzFlipbookAttribute);

  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40CA0 error:a4];
}

@end