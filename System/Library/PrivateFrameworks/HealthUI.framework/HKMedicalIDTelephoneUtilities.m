@interface HKMedicalIDTelephoneUtilities
+ (id)dialRequest:(id)a3;
+ (id)emergencyContactURL:(id)a3;
+ (void)callEmergencyContact:(id)a3;
@end

@implementation HKMedicalIDTelephoneUtilities

+ (id)dialRequest:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v4 = (void *)getTUCallProviderManagerClass_softClass;
  uint64_t v24 = getTUCallProviderManagerClass_softClass;
  if (!getTUCallProviderManagerClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getTUCallProviderManagerClass_block_invoke;
    v19 = &unk_1E6D514F8;
    v20 = &v21;
    __getTUCallProviderManagerClass_block_invoke((uint64_t)&v16);
    v4 = (void *)v22[3];
  }
  v5 = v4;
  _Block_object_dispose(&v21, 8);
  id v6 = objc_alloc_init(v5);
  v7 = [v6 defaultProvider];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v8 = (void *)getTUDialRequestClass_softClass;
  uint64_t v24 = getTUDialRequestClass_softClass;
  if (!getTUDialRequestClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getTUDialRequestClass_block_invoke;
    v19 = &unk_1E6D514F8;
    v20 = &v21;
    __getTUDialRequestClass_block_invoke((uint64_t)&v16);
    v8 = (void *)v22[3];
  }
  v9 = v8;
  _Block_object_dispose(&v21, 8);
  v10 = (void *)[[v9 alloc] initWithProvider:v7];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v11 = (void *)getTUHandleClass_softClass;
  uint64_t v24 = getTUHandleClass_softClass;
  if (!getTUHandleClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getTUHandleClass_block_invoke;
    v19 = &unk_1E6D514F8;
    v20 = &v21;
    __getTUHandleClass_block_invoke((uint64_t)&v16);
    v11 = (void *)v22[3];
  }
  v12 = v11;
  _Block_object_dispose(&v21, 8);
  v13 = (void *)[[v12 alloc] initWithType:2 value:v3];
  [v10 setHandle:v13];
  [v10 setShowUIPrompt:0];
  [v10 setPreferDefaultApp:0];
  if ([v10 isValid]) {
    id v14 = v10;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

+ (void)callEmergencyContact:(id)a3
{
  id v5 = [a1 dialRequest:a3];
  if (v5)
  {
    id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v4 = [v5 URL];
    [v3 openURL:v4 configuration:0 completionHandler:0];
  }
}

+ (id)emergencyContactURL:(id)a3
{
  id v3 = [a1 dialRequest:a3];
  v4 = [v3 URL];

  return v4;
}

@end