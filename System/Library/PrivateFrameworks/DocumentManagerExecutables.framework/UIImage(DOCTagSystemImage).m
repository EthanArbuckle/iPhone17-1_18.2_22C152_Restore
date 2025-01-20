@interface UIImage(DOCTagSystemImage)
+ (__CFString)_doc_imageOutlineNameForColorType:()DOCTagSystemImage differentiateWithShapes:;
+ (id)_doc_imageFillNameForColorType:()DOCTagSystemImage differentiateWithShapes:;
+ (id)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:;
+ (id)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:renderedColor:;
@end

@implementation UIImage(DOCTagSystemImage)

+ (id)_doc_imageFillNameForColorType:()DOCTagSystemImage differentiateWithShapes:
{
  v1 = objc_msgSend(a1, "_doc_imageOutlineNameForColorType:differentiateWithShapes:");
  v2 = [v1 stringByAppendingString:@".fill"];

  return v2;
}

+ (__CFString)_doc_imageOutlineNameForColorType:()DOCTagSystemImage differentiateWithShapes:
{
  v12[8] = *MEMORY[0x263EF8340];
  v11[0] = &unk_26DF541A8;
  v11[1] = &unk_26DF541C0;
  v6 = @"circle";
  v12[0] = @"circle";
  v12[1] = @"square";
  v11[2] = &unk_26DF541D8;
  v11[3] = &unk_26DF541F0;
  v12[2] = @"diamond";
  v12[3] = @"hexagon";
  v11[4] = &unk_26DF54208;
  v11[5] = &unk_26DF54220;
  v12[4] = @"triangle";
  v12[5] = @"seal";
  v11[6] = &unk_26DF54238;
  v11[7] = &unk_26DF54250;
  v12[6] = @"pentagon";
  v12[7] = @"circle";
  v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:8];
  if (a4)
  {
    v8 = [NSNumber numberWithInteger:a3];
    v9 = [v7 objectForKeyedSubscript:v8];

    if (v9) {
      v6 = v9;
    }
    else {
      v6 = @"circle";
    }
  }

  return v6;
}

+ (id)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:
{
  v9 = [MEMORY[0x263F3ABC0] untitledTagForRendering:a5];
  v10 = [v9 tagColorIfNotClear];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x263F3ABC0] nonClearNoneTagColor];
  }
  v13 = v12;

  v14 = objc_msgSend(a1, "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:", a3, a4, a5, v13);

  return v14;
}

+ (id)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:renderedColor:
{
  id v9 = a6;
  if (!v9)
  {
    v10 = (NSObject **)MEMORY[0x263F3AC28];
    v11 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[UIImage(DOCTagSystemImage) _doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:](v11);
    }
    id v12 = [MEMORY[0x263F3ABC0] untitledTagForRendering:a5];
    id v9 = [v12 tagColor];
  }
  v13 = [MEMORY[0x263F3ABC0] untitledTagForRendering:a5];
  v14 = v13;
  if (v9)
  {
    id v15 = v9;
  }
  else
  {
    v16 = [v13 tagColorIfNotClear];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x263F3ABC0] nonClearNoneTagColor];
    }
    id v15 = v18;
  }
  if (a3 == 1)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x263F827E8], "_doc_imageOutlineNameForColorType:differentiateWithShapes:", a5, a4);
    goto LABEL_17;
  }
  if (!a3)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x263F827E8], "_doc_imageFillNameForColorType:differentiateWithShapes:", a5, a4);
LABEL_17:
    v20 = (void *)v19;
    goto LABEL_19;
  }
  v20 = 0;
LABEL_19:
  v21 = +[DOCTagAppearance renderingAppearance];
  uint64_t v22 = [v21 imageWeightForVariant:a3];

  v23 = [MEMORY[0x263F827E8] systemImageNamed:v20];
  v24 = [MEMORY[0x263F82818] configurationWithWeight:v22];
  v25 = [v23 imageWithConfiguration:v24];

  v26 = [v25 imageWithTintColor:v15 renderingMode:1];

  return v26;
}

+ (void)_doc_tagImageForRenderingVariant:()DOCTagSystemImage differentiateWithShapes:tagColorType:renderedColor:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22BDC5000, log, OS_LOG_TYPE_FAULT, "Invalid nil parameter for 'renderedColor', using fallback", v1, 2u);
}

@end