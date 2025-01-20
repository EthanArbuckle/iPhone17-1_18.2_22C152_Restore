@interface CNPhotoPickerImageWithEffectGenerator
+ (id)coreImageFilterDisplayNames;
+ (id)coreImageFilterNames;
+ (id)displayNameForFilterNamed:(id)a3;
+ (id)imageByApplyingEffect:(id)a3 withContext:(id)a4 toImage:(id)a5 withSize:(CGSize)a6;
+ (id)imageByApplyingEffect:(id)a3 withContext:(id)a4 toImageData:(id)a5;
+ (void)imagesByApplyingEffectsToImageData:(id)a3 withScaleFactor:(double)a4 originalImageScale:(double)a5 cropRect:(CGRect)a6 completion:(id)a7;
@end

@implementation CNPhotoPickerImageWithEffectGenerator

+ (id)imageByApplyingEffect:(id)a3 withContext:(id)a4 toImage:(id)a5 withSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v14 = [v12 imageByApplyingFilter:v10];
  uint64_t v15 = objc_msgSend(v11, "createCGImage:fromRect:", v14, 0.0, 0.0, width, height);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__CNPhotoPickerImageWithEffectGenerator_imageByApplyingEffect_withContext_toImage_withSize___block_invoke;
  v22[3] = &__block_descriptor_40_e5_v8__0l;
  v22[4] = v15;
  v16 = (void *)[v22 copy];
  v17 = self;
  v18 = _Block_copy(v17);
  [v13 push:v18];

  v19 = [MEMORY[0x1E4FB1818] imageWithCGImage:v15];

  [v13 popAllWithHandler:&__block_literal_global_64011];
  id v20 = self;

  return v19;
}

void __92__CNPhotoPickerImageWithEffectGenerator_imageByApplyingEffect_withContext_toImage_withSize___block_invoke(uint64_t a1)
{
}

uint64_t __92__CNPhotoPickerImageWithEffectGenerator_imageByApplyingEffect_withContext_toImage_withSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

+ (id)imageByApplyingEffect:(id)a3 withContext:(id)a4 toImageData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F1E050] imageWithData:v7];
  id v12 = [MEMORY[0x1E4FB1818] imageWithData:v7];

  [v12 size];
  id v13 = objc_msgSend(v10, "imageByApplyingEffect:withContext:toImage:withSize:", v9, v8, v11);

  return v13;
}

+ (void)imagesByApplyingEffectsToImageData:(id)a3 withScaleFactor:(double)a4 originalImageScale:(double)a5 cropRect:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v14 = (void (**)(id, void *, void, double, double, double, double))a7;
  uint64_t v15 = [MEMORY[0x1E4F1E050] imageWithData:a3];
  v16 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform"];
  v27 = (void *)v15;
  [v16 setValue:v15 forKey:@"inputImage"];
  double v17 = a4 / a5;
  *(float *)&double v17 = a4 / a5;
  v18 = [NSNumber numberWithFloat:v17];
  [v16 setValue:v18 forKey:@"inputScale"];

  [v16 setValue:&unk_1ED9155E0 forKey:@"inputAspectRatio"];
  v19 = [v16 valueForKey:@"outputImage"];
  id v20 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(id)objc_opt_class() coreImageFilterNames];
  uint64_t v21 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v26 = objc_msgSend((id)objc_opt_class(), "imageByApplyingEffect:withContext:toImage:withSize:", v25, v20, v19, width, height);
        v14[2](v14, v26, v25, x, y, width, height);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v22);
  }
}

+ (id)displayNameForFilterNamed:(id)a3
{
  id v4 = a3;
  v5 = [a1 coreImageFilterDisplayNames];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)coreImageFilterDisplayNames
{
  v23[9] = *MEMORY[0x1E4F143B8];
  v22[0] = @"CIPhotoEffect3DVivid";
  uint64_t v21 = CNContactsUIBundle();
  id v20 = [v21 localizedStringForKey:@"PHOTO_FILTER_VIVID_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[0] = v20;
  v22[1] = @"CIPhotoEffect3DVividWarm";
  v19 = CNContactsUIBundle();
  v18 = [v19 localizedStringForKey:@"PHOTO_FILTER_VIVIDWARM_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[1] = v18;
  v22[2] = @"CIPhotoEffect3DVividCool";
  double v17 = CNContactsUIBundle();
  v16 = [v17 localizedStringForKey:@"PHOTO_FILTER_VIVIDCOOL_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[2] = v16;
  v22[3] = @"CIPhotoEffect3DDramatic";
  uint64_t v15 = CNContactsUIBundle();
  v14 = [v15 localizedStringForKey:@"PHOTO_FILTER_DRAMATIC_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[3] = v14;
  v22[4] = @"CIPhotoEffect3DDramaticWarm";
  id v13 = CNContactsUIBundle();
  v2 = [v13 localizedStringForKey:@"PHOTO_FILTER_DRAMATICWARM_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[4] = v2;
  void v22[5] = @"CIPhotoEffect3DDramaticCool";
  v3 = CNContactsUIBundle();
  id v4 = [v3 localizedStringForKey:@"PHOTO_FILTER_DRAMATICCOOL_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[5] = v4;
  v22[6] = @"CIPhotoEffectMono";
  v5 = CNContactsUIBundle();
  v6 = [v5 localizedStringForKey:@"PHOTO_FILTER_MONO_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[6] = v6;
  v22[7] = @"CIPhotoEffect3DSilverplate";
  id v7 = CNContactsUIBundle();
  id v8 = [v7 localizedStringForKey:@"PHOTO_FILTER_SILVERTONE_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[7] = v8;
  v22[8] = @"CIPhotoEffect3DNoir";
  id v9 = CNContactsUIBundle();
  id v10 = [v9 localizedStringForKey:@"PHOTO_FILTER_NOIR_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23[8] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];

  return v11;
}

+ (id)coreImageFilterNames
{
  return &unk_1ED915C80;
}

@end