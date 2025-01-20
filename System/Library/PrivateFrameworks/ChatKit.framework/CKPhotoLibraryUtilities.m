@interface CKPhotoLibraryUtilities
+ (id)cameraRollMostRecentImage;
@end

@implementation CKPhotoLibraryUtilities

+ (id)cameraRollMostRecentImage
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getDCIMImageWellUtilitiesClass_softClass;
  uint64_t v10 = getDCIMImageWellUtilitiesClass_softClass;
  if (!getDCIMImageWellUtilitiesClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getDCIMImageWellUtilitiesClass_block_invoke;
    v6[3] = &unk_1E5620B90;
    v6[4] = &v7;
    __getDCIMImageWellUtilitiesClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 cameraPreviewWellImage];

  return v4;
}

@end