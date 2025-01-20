@interface WFPhotoAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (unint64_t)status;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFPhotoAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v8 = (void *)getPHPhotoLibraryClass_softClass_42471;
  uint64_t v17 = getPHPhotoLibraryClass_softClass_42471;
  if (!getPHPhotoLibraryClass_softClass_42471)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getPHPhotoLibraryClass_block_invoke_42472;
    v13[3] = &unk_264E5EC88;
    v13[4] = &v14;
    __getPHPhotoLibraryClass_block_invoke_42472((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v14, 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__WFPhotoAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v11[3] = &unk_264E5B9F0;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 requestAuthorization:v11];
}

uint64_t __74__WFPhotoAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAvailabilityWithForcedNotification];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (unint64_t)status
{
  return 4;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.mobileslideshow";
}

@end