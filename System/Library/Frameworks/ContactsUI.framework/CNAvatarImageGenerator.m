@interface CNAvatarImageGenerator
+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 scaleMultiplier:(double)a4;
+ (id)imageDataFromMetadata:(id)a3;
+ (void)imageDataFromMetadata:(id)a3 size:(CGSize)a4 completionHandler:(id)a5;
@end

@implementation CNAvatarImageGenerator

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 scaleMultiplier:(double)a4
{
  id v5 = a3;
  v6 = +[CNAvatarImageUtilities trimmedImageByTrimmingTransparentPixelsFromImage:v5];
  [v6 size];
  double v8 = v7 / a4;
  [v6 size];
  double v10 = v9 / a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4FB17E0]);
  [v11 setOpaque:0];
  [v5 scale];
  double v13 = v12;

  [v11 setScale:v13];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v11, v8, v10);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__CNAvatarImageGenerator_croppedAndCenteredAvatarImageForImage_scaleMultiplier___block_invoke;
  v18[3] = &unk_1E5498110;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  id v19 = v6;
  double v22 = v8;
  double v23 = v10;
  id v15 = v6;
  v16 = [v14 imageWithActions:v18];

  return v16;
}

uint64_t __80__CNAvatarImageGenerator_croppedAndCenteredAvatarImageForImage_scaleMultiplier___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
  [*(id *)(a1 + 32) size];
  double v5 = MidX - v4 * 0.5;
  double MidY = CGRectGetMidY(*(CGRect *)(a1 + 40));
  [*(id *)(a1 + 32) size];
  double v8 = MidY - v7 * 0.5;

  return objc_msgSend(v2, "drawAtPoint:", v5, v8);
}

+ (void)imageDataFromMetadata:(id)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  double v10 = (void *)getAVTStickerGeneratorClass_softClass;
  uint64_t v30 = getAVTStickerGeneratorClass_softClass;
  if (!getAVTStickerGeneratorClass_softClass)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __getAVTStickerGeneratorClass_block_invoke;
    v25 = &unk_1E549AD00;
    v26 = &v27;
    __getAVTStickerGeneratorClass_block_invoke((uint64_t)&v22);
    double v10 = (void *)v28[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v27, 8);
  id v12 = [v11 alloc];
  double v13 = [v8 avatar];
  v14 = (void *)[v12 initWithAvatar:v13];

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v15 = (void *)getAVTStickerGeneratorPosterOptionsClass_softClass;
  uint64_t v30 = getAVTStickerGeneratorPosterOptionsClass_softClass;
  if (!getAVTStickerGeneratorPosterOptionsClass_softClass)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __getAVTStickerGeneratorPosterOptionsClass_block_invoke;
    v25 = &unk_1E549AD00;
    v26 = &v27;
    __getAVTStickerGeneratorPosterOptionsClass_block_invoke((uint64_t)&v22);
    id v15 = (void *)v28[3];
  }
  v16 = v15;
  _Block_object_dispose(&v27, 8);
  id v17 = objc_alloc_init(v16);
  objc_msgSend(v17, "setSize:", width, height);
  v18 = [v8 poseConfiguration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__CNAvatarImageGenerator_imageDataFromMetadata_size_completionHandler___block_invoke;
  v20[3] = &unk_1E54980E8;
  id v21 = v9;
  id v19 = v9;
  [v14 posterWithConfiguration:v18 options:v17 completionHandler:v20];
}

void __71__CNAvatarImageGenerator_imageDataFromMetadata_size_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 HEICRepresentation];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

+ (id)imageDataFromMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  double v4 = (void *)getAVTAvatarRecordImageProviderClass_softClass_22184;
  uint64_t v22 = getAVTAvatarRecordImageProviderClass_softClass_22184;
  if (!getAVTAvatarRecordImageProviderClass_softClass_22184)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getAVTAvatarRecordImageProviderClass_block_invoke_22185;
    id v17 = &unk_1E549AD00;
    v18 = &v19;
    __getAVTAvatarRecordImageProviderClass_block_invoke_22185((uint64_t)&v14);
    double v4 = (void *)v20[3];
  }
  double v5 = v4;
  _Block_object_dispose(&v19, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  double v7 = (void *)getAVTRenderingScopeClass_softClass_22186;
  uint64_t v22 = getAVTRenderingScopeClass_softClass_22186;
  if (!getAVTRenderingScopeClass_softClass_22186)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getAVTRenderingScopeClass_block_invoke_22187;
    id v17 = &unk_1E549AD00;
    v18 = &v19;
    __getAVTRenderingScopeClass_block_invoke_22187((uint64_t)&v14);
    double v7 = (void *)v20[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v19, 8);
  id v9 = [v8 largeThumbnailScope];
  double v10 = [v3 avatarRecord];
  id v11 = [v6 imageForRecord:v10 scope:v9];
  id v12 = [v11 HEICRepresentation];

  return v12;
}

@end