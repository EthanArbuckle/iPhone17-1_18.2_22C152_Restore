@interface CKWalletMediaObjectMetadataHandler
+ (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (double)colorValueForKey:(id)a3 inDictionary:(id)a4;
+ (id)colorDictionaryFromColor:(id)a3;
+ (id)colorFromDictionaryRepresentation:(id)a3;
+ (id)dictionaryRepresentationForText:(id)a3 color:(id)a4;
+ (id)dictionaryRepresentationForText:(id)a3 optionalColor:(id)a4;
+ (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4 presentationProperties:(id)a5;
+ (id)paddedImage:(id)a3 horizontalPadding:(double)a4 verticalPadding:(double)a5;
+ (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4;
+ (id)replyPreviewIconFromFullImage:(id)a3;
@end

@implementation CKWalletMediaObjectMetadataHandler

+ (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4 presentationProperties:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  v7 = (objc_class *)MEMORY[0x1E4F30A98];
  id v8 = a5;
  v9 = (void *)[[v7 alloc] initWithPresentationProperties:v8 URL:0];

  [v9 _setApplyCornerRadius:0];
  [v9 _setAction:0 withText:&stru_1EDE4CA38 buttonType:1];
  [v9 layoutIfNeeded];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, width, height);
  [v9 layoutIfNeeded];
  [v9 bounds];
  v16.double width = v10;
  v16.double height = v11;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  v12 = [v9 layer];
  [v12 renderInContext:UIGraphicsGetCurrentContext()];

  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

+ (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithContentsOfURL:v6];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
    }
    else
    {
      _IMWarn();
      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6DF38] code:13 userInfo:0];
        id v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6DF38] code:11 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = 0;
    id v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v19];
    id v10 = v19;
    if (v9)
    {
      CGFloat v11 = [v8 path];
      BOOL v12 = 1;
      char v13 = [v9 writeToFile:v11 atomically:1];

      if (v13)
      {
LABEL_15:

        goto LABEL_17;
      }
      if (_IMWillLog())
      {
        v18 = [v8 path];
        _IMAlwaysLog();
      }
      if (a5)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6DF38] code:9 userInfo:0];
        BOOL v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      if (a5)
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = *MEMORY[0x1E4F6DF38];
        uint64_t v20 = *MEMORY[0x1E4F28A50];
        v21[0] = v10;
        CGSize v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        *a5 = [v14 errorWithDomain:v15 code:13 userInfo:v16];
      }
    }
    BOOL v12 = 0;
    goto LABEL_15;
  }
  _IMWarn();
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6DF38] code:13 userInfo:0];
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_17:

  return v12;
}

+ (id)paddedImage:(id)a3 horizontalPadding:(double)a4 verticalPadding:(double)a5
{
  id v7 = a3;
  [v7 size];
  double v9 = v8 + a4 * 2.0;
  [v7 size];
  double v11 = v10 + a5 * 2.0;
  BOOL v12 = [MEMORY[0x1E4F42A60] preferredFormat];
  [v7 scale];
  objc_msgSend(v12, "setScale:");
  [v12 setOpaque:0];
  [v12 setPreferredRange:0];
  char v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v12, v9, v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__CKWalletMediaObjectMetadataHandler_paddedImage_horizontalPadding_verticalPadding___block_invoke;
  v17[3] = &unk_1E5625B10;
  id v18 = v7;
  double v19 = a4;
  double v20 = a5;
  id v14 = v7;
  uint64_t v15 = [v13 imageWithActions:v17];

  return v15;
}

uint64_t __84__CKWalletMediaObjectMetadataHandler_paddedImage_horizontalPadding_verticalPadding___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

+ (id)replyPreviewIconFromFullImage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F42A58]);
  [v3 size];
  v5 = objc_msgSend(v4, "initWithSize:");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__CKWalletMediaObjectMetadataHandler_replyPreviewIconFromFullImage___block_invoke;
  v9[3] = &unk_1E5620DE8;
  id v10 = v3;
  id v6 = v3;
  id v7 = [v5 imageWithActions:v9];

  return v7;
}

void __68__CKWalletMediaObjectMetadataHandler_replyPreviewIconFromFullImage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) size];
  double v3 = v2;
  [*(id *)(a1 + 32) size];
  double v5 = v4;
  [*(id *)(a1 + 32) size];
  objc_msgSend(MEMORY[0x1E4F427D0], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, 0.0, 0.0, v3, v5, fmin(v6, v7) * 0.0416666667);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addClip];
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, v3, v5);
}

+ (id)colorFromDictionaryRepresentation:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F428B8];
  uint64_t v5 = *MEMORY[0x1E4F6E4F8];
  id v6 = a3;
  [a1 colorValueForKey:v5 inDictionary:v6];
  double v8 = v7;
  [a1 colorValueForKey:*MEMORY[0x1E4F6E4F0] inDictionary:v6];
  double v10 = v9;
  [a1 colorValueForKey:*MEMORY[0x1E4F6E4E8] inDictionary:v6];
  double v12 = v11;
  [a1 colorValueForKey:*MEMORY[0x1E4F6E4E0] inDictionary:v6];
  double v14 = v13;

  return (id)[v4 colorWithRed:v8 green:v10 blue:v12 alpha:v14];
}

+ (id)dictionaryRepresentationForText:(id)a3 color:(id)a4
{
  id v6 = a3;
  double v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  double v9 = (__CFDictionary *)objc_alloc_init(v7);
  id v10 = v6;
  if (v10)
  {
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E538], v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:]();
  }

  double v11 = [a1 colorDictionaryFromColor:v8];

  if (v11)
  {
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E530], v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:]();
  }

  return v9;
}

+ (id)dictionaryRepresentationForText:(id)a3 optionalColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = v6;
  if (v9)
  {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E538], v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:]();
  }

  if (v7)
  {
    id v10 = [a1 colorDictionaryFromColor:v7];
    if (v10) {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E530], v10);
    }
  }

  return v8;
}

+ (id)colorDictionaryFromColor:(id)a3
{
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  [a3 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
  double v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = [NSNumber numberWithDouble:v12];
  if (v4)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6E4F8], v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:].cold.4();
  }

  uint64_t v5 = [NSNumber numberWithDouble:v11];
  if (v5)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6E4F0], v5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:]();
  }

  id v6 = [NSNumber numberWithDouble:v10];
  if (v6)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6E4E8], v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:]();
  }

  id v7 = [NSNumber numberWithDouble:v9];
  if (v7)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6E4E0], v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:]();
  }

  return v3;
}

+ (double)colorValueForKey:(id)a3 inDictionary:(id)a4
{
  double v4 = [a4 objectForKeyedSubscript:a3];
  objc_opt_class();
  double v5 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    double v5 = v6;
  }

  return v5;
}

+ (void)dictionaryRepresentationForText:color:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

+ (void)dictionaryRepresentationForText:color:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

+ (void)colorDictionaryFromColor:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

+ (void)colorDictionaryFromColor:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

+ (void)colorDictionaryFromColor:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

+ (void)colorDictionaryFromColor:.cold.4()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

@end