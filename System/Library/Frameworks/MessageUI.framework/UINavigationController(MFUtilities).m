@interface UINavigationController(MFUtilities)
- (id)mf_viewControllerOfClass:()MFUtilities startFromTopOfStack:;
@end

@implementation UINavigationController(MFUtilities)

- (id)mf_viewControllerOfClass:()MFUtilities startFromTopOfStack:
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  v6 = [a1 viewControllers];
  v7 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__UINavigationController_MFUtilities__mf_viewControllerOfClass_startFromTopOfStack___block_invoke;
  v11[3] = &unk_1E5F7D3D8;
  if (a4) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  v11[4] = &v12;
  v11[5] = a3;
  [v6 enumerateObjectsWithOptions:v8 usingBlock:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

@end