@interface CNPhotoPickerCapabilities
+ (BOOL)allowsAvatarFaceTracking;
+ (BOOL)allowsAvatarStoreAccess;
+ (BOOL)allowsAvatarUI;
+ (BOOL)allowsCameraAccess;
+ (BOOL)allowsPhotoLibraryAccess;
+ (BOOL)isCameraTCCEnabled;
@end

@implementation CNPhotoPickerCapabilities

+ (BOOL)allowsPhotoLibraryAccess
{
  if (allowsPhotoLibraryAccess_onceToken != -1) {
    dispatch_once(&allowsPhotoLibraryAccess_onceToken, &__block_literal_global_9_41348);
  }
  return allowsPhotoLibraryAccess_enabled;
}

void __53__CNPhotoPickerCapabilities_allowsPhotoLibraryAccess__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v0 objectForInfoDictionaryKey:@"NSPhotoLibraryUsageDescription"];

  v1 = v4;
  if (v4)
  {
    char v2 = 1;
  }
  else
  {
    BOOL v3 = TCCAccessPreflight() == 0;
    v1 = 0;
    char v2 = v3;
  }
  allowsPhotoLibraryAccess_enabled = v2;
}

+ (BOOL)allowsCameraAccess
{
  BOOL v2 = 1;
  char v3 = [MEMORY[0x1E4FB1828] isSourceTypeAvailable:1];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v4 userInterfaceIdiom] == 1) {
    BOOL v2 = [(id)*MEMORY[0x1E4FB2608] applicationState] != 2;
  }

  return v3 & v2 & [(id)objc_opt_class() isCameraTCCEnabled];
}

+ (BOOL)isCameraTCCEnabled
{
  if (isCameraTCCEnabled_onceToken != -1) {
    dispatch_once(&isCameraTCCEnabled_onceToken, &__block_literal_global_41356);
  }
  return isCameraTCCEnabled_enabled;
}

uint64_t __47__CNPhotoPickerCapabilities_isCameraTCCEnabled__block_invoke()
{
  uint64_t result = TCCAccessPreflight();
  isCameraTCCEnabled_enabled = result == 0;
  return result;
}

+ (BOOL)allowsAvatarFaceTracking
{
  int v2 = [a1 allowsCameraAccess];
  if (v2)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v3 = (uint64_t (*)(void))getAVTUIIsFacetrackingSupportedSymbolLoc_ptr;
    v11 = getAVTUIIsFacetrackingSupportedSymbolLoc_ptr;
    if (!getAVTUIIsFacetrackingSupportedSymbolLoc_ptr)
    {
      id v4 = AvatarUILibrary_41358();
      v9[3] = (uint64_t)dlsym(v4, "AVTUIIsFacetrackingSupported");
      getAVTUIIsFacetrackingSupportedSymbolLoc_ptr = (_UNKNOWN *)v9[3];
      char v3 = (uint64_t (*)(void))v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (v3)
    {
      LOBYTE(v2) = v3();
    }
    else
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"BOOL CNSoftLinkAVTUIIsFacetrackingSupported(void)"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"CNAvatarSoftLink.h", 33, @"%s", dlerror());

      __break(1u);
    }
  }
  return v2;
}

+ (BOOL)allowsAvatarStoreAccess
{
  int v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  char v3 = [v2 entitlementVerifier];
  uint64_t v4 = *MEMORY[0x1E4F5A200];
  id v12 = 0;
  char v5 = [v3 currentProcessHasBooleanEntitlement:v4 error:&v12];
  id v6 = v12;

  if ((v5 & 1) == 0) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPhotoPickerCapabilities.m", 35, 3, @"Photo Picker doesn't have access to avatar store %@", v7, v8, v9, v10, (uint64_t)v6);
  }

  return v5;
}

+ (BOOL)allowsAvatarUI
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  int v2 = (void *)getAVTAvatarStoreClass_softClass_41378;
  v18 = (void *)getAVTAvatarStoreClass_softClass_41378;
  if (!getAVTAvatarStoreClass_softClass_41378)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __getAVTAvatarStoreClass_block_invoke_41379;
    v13 = &unk_1E549AD00;
    v14 = &v15;
    __getAVTAvatarStoreClass_block_invoke_41379((uint64_t)&v10);
    int v2 = (void *)v16[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v15, 8);
  if (!v3) {
    return 0;
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(void))getAVTUIAreAvatarsSupportedSymbolLoc_ptr;
  v18 = getAVTUIAreAvatarsSupportedSymbolLoc_ptr;
  if (!getAVTUIAreAvatarsSupportedSymbolLoc_ptr)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __getAVTUIAreAvatarsSupportedSymbolLoc_block_invoke;
    v13 = &unk_1E549AD00;
    v14 = &v15;
    char v5 = AvatarUILibrary_41358();
    id v6 = dlsym(v5, "AVTUIAreAvatarsSupported");
    *(void *)(v14[1] + 24) = v6;
    getAVTUIAreAvatarsSupportedSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
    uint64_t v4 = (uint64_t (*)(void))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (v4) {
    return v4();
  }
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"BOOL CNSoftLinkAVTUIAreAvatarsSupported(void)"];
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"CNAvatarSoftLink.h", 32, @"%s", dlerror());

  __break(1u);
  return result;
}

@end