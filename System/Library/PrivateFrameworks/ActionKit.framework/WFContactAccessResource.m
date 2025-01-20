@interface WFContactAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (unint64_t)status;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFContactAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v8 = (void *)getCNContactStoreClass_softClass;
  uint64_t v18 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getCNContactStoreClass_block_invoke;
    v14[3] = &unk_264E5EC88;
    v14[4] = &v15;
    __getCNContactStoreClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);
  v10 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v12[3] = &unk_264E5CD58;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 requestAccessForEntityType:0 completionHandler:v12];
}

void __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  v8[3] = &unk_264E587D8;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAvailabilityWithForcedNotification];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (unint64_t)status
{
  return 4;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.MobileAddressBook";
}

@end