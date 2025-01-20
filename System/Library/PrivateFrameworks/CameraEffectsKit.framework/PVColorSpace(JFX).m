@interface PVColorSpace(JFX)
+ (id)JFX_nclcDictionaryForColorSpace:()JFX;
+ (id)jfx_compareAndChooseGreaterColorSpace:()JFX right:;
+ (id)jfx_compareAndChooseLesserColorSpace:()JFX right:;
+ (id)jfx_getColorSpaceFromCGColorSpace:()JFX;
+ (id)jfx_getColorSpaceFromCaptureColorSpace:()JFX;
+ (id)jfx_getColorSpaceFromColorPrimaries:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_compareTriplets:()JFX transferFunction:matrix:validNCLCTriplets:;
+ (uint64_t)JFX_isP3D65:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isP3HLG:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isP3PQ:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isRec2020Linear:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isRec2100HLG:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isRec2100PQ:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isRec601Gamma:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isRec709Gamma:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isRec709Linear:()JFX transferFunction:matrix:;
+ (uint64_t)JFX_isSRGBColorSpace:()JFX transferFunction:matrix:;
+ (uint64_t)jfx_getColorSpaceFromImageBuffer:()JFX;
+ (uint64_t)jfx_getColorSpaceFromPixelBuffer:()JFX;
- (id)jfx_videoExportColorSpace;
- (uint64_t)jfx_getCVPixelFormatForDisplay;
- (uint64_t)jfx_getCVPixelFormatForExport;
- (void)jfx_attachColorSpaceToPixelBuffer:()JFX;
@end

@implementation PVColorSpace(JFX)

+ (id)jfx_getColorSpaceFromColorPrimaries:()JFX transferFunction:matrix:
{
  if (objc_msgSend(MEMORY[0x263F61230], "JFX_isRec709Gamma:transferFunction:matrix:"))
  {
    v8 = [MEMORY[0x263F61230] rec709GammaColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isP3D65:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] p3d65GammaColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isSRGBColorSpace:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] sRGBColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isRec601Gamma:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = objc_msgSend(MEMORY[0x263F61230], "rec601_1_1_6_GammaColorSpace");
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isRec709Linear:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] rec709LinearColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isP3HLG:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] p3HLGGammaColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isP3PQ:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] p3PQGammaColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isRec2100HLG:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] rec2100HLGColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isRec2100PQ:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] rec2100PQColorSpace];
  }
  else if (objc_msgSend(MEMORY[0x263F61230], "JFX_isRec2020Linear:transferFunction:matrix:", a3, a4, a5))
  {
    v8 = [MEMORY[0x263F61230] rec2020LinearColorSpace];
  }
  else
  {
    v9 = JFXLog_core();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[PVColorSpace(JFX) jfx_getColorSpaceFromColorPrimaries:transferFunction:matrix:](v9);
    }

    v8 = 0;
  }
  return v8;
}

+ (uint64_t)jfx_getColorSpaceFromPixelBuffer:()JFX
{
  CFDictionaryRef v4 = CVBufferCopyAttachments(buffer, kCVAttachmentMode_ShouldPropagate);
  Value = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F03ED8]);
  v6 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F03FC0]);
  v7 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F04020]);
  if (v4) {
    CFRelease(v4);
  }
  return objc_msgSend(a1, "jfx_getColorSpaceFromColorPrimaries:transferFunction:matrix:", Value, v6, v7);
}

+ (uint64_t)jfx_getColorSpaceFromImageBuffer:()JFX
{
  uint64_t v3 = [a3 cvPixelBuffer];
  CFDictionaryRef v4 = (void *)MEMORY[0x263F61230];
  return objc_msgSend(v4, "jfx_getColorSpaceFromPixelBuffer:", v3);
}

+ (id)jfx_getColorSpaceFromCaptureColorSpace:()JFX
{
  if (a3 == 2)
  {
    uint64_t v3 = [MEMORY[0x263F61230] rec2100HLGColorSpace];
  }
  else
  {
    if (a3 == 1) {
      [MEMORY[0x263F61230] p3d65GammaColorSpace];
    }
    else {
    uint64_t v3 = [MEMORY[0x263F61230] rec709GammaColorSpace];
    }
  }
  return v3;
}

+ (id)jfx_getColorSpaceFromCGColorSpace:()JFX
{
  if (jfx_getColorSpaceFromCGColorSpace__onceToken != -1) {
    dispatch_once(&jfx_getColorSpaceFromCGColorSpace__onceToken, &__block_literal_global_54);
  }
  CFDictionaryRef v4 = CGColorSpaceGetName(space);
  v5 = [(id)jfx_getColorSpaceFromCGColorSpace__s_HDRColorSpaceLookup objectForKeyedSubscript:v4];
  if (!v5)
  {
    if (CGColorSpaceIsWideGamutRGB(space))
    {
      uint64_t v6 = [MEMORY[0x263F61230] p3d65GammaColorSpace];
    }
    else
    {
      if ([v4 isEqualToString:*MEMORY[0x263F00298]]) {
        [MEMORY[0x263F61230] rec709GammaColorSpace];
      }
      else {
      uint64_t v6 = [MEMORY[0x263F61230] sRGBColorSpace];
      }
    }
    v5 = (void *)v6;
  }

  return v5;
}

+ (id)jfx_compareAndChooseGreaterColorSpace:()JFX right:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = __65__PVColorSpace_JFX__jfx_compareAndChooseGreaterColorSpace_right___block_invoke((uint64_t)v6, v5);
  if (v7 >= __65__PVColorSpace_JFX__jfx_compareAndChooseGreaterColorSpace_right___block_invoke(v7, v6))v8 = v5; {
  else
  }
    v8 = v6;
  id v9 = v8;

  return v9;
}

+ (id)jfx_compareAndChooseLesserColorSpace:()JFX right:
{
  id v5 = (void *)MEMORY[0x263F61230];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v5, "jfx_compareAndChooseGreaterColorSpace:right:", v7, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6) {
    id v9 = v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (uint64_t)jfx_getCVPixelFormatForDisplay
{
  uint64_t v2 = 1111970369;
  if (([a1 isP3d65GammaColorSpace] & 1) == 0)
  {
    uint64_t v2 = 2016686640;
    if (([a1 isWideGamutSpace] & 1) == 0)
    {
      if ([a1 isHDRSpace]) {
        return 2016686640;
      }
      else {
        return 1111970369;
      }
    }
  }
  return v2;
}

- (uint64_t)jfx_getCVPixelFormatForExport
{
  if ([a1 isHDRSpace]) {
    return 2016686640;
  }
  else {
    return 875704438;
  }
}

- (void)jfx_attachColorSpaceToPixelBuffer:()JFX
{
  id v4 = [a1 nclcTriplet];
  CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x263F03ED8], (CFTypeRef)[v4 colorPrimary], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x263F03FC0], (CFTypeRef)[v4 transferFunction], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x263F04020], (CFTypeRef)[v4 ycbcrMatrix], kCVAttachmentMode_ShouldPropagate);
}

- (id)jfx_videoExportColorSpace
{
  if ([a1 isHDRSpace])
  {
    uint64_t v2 = [MEMORY[0x263F61230] rec2100HLGColorSpace];
  }
  else
  {
    if ([a1 isWideGamutSpace]) {
      [MEMORY[0x263F61230] p3d65GammaColorSpace];
    }
    else {
    uint64_t v2 = [MEMORY[0x263F61230] rec709GammaColorSpace];
    }
  }
  return v2;
}

+ (uint64_t)JFX_compareTriplets:()JFX transferFunction:matrix:validNCLCTriplets:
{
  id v9 = a6;
  id v10 = [v9 objectForKeyedSubscript:@"ColorPrimaries"];
  int v11 = [v10 containsObject:a3];

  v12 = [v9 objectForKeyedSubscript:@"TransferFunctions"];
  int v13 = [v12 containsObject:a4];

  if (a5)
  {
    v14 = [v9 objectForKeyedSubscript:@"Matrices"];
    int v15 = [v14 containsObject:a5];
  }
  else
  {
    int v15 = 1;
  }

  return v11 & v13 & v15;
}

+ (id)JFX_nclcDictionaryForColorSpace:()JFX
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 nclcTriplet];
  v12[0] = @"ColorPrimaries";
  uint64_t v11 = [v3 colorPrimary];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v13[0] = v4;
  v12[1] = @"TransferFunctions";
  uint64_t v10 = [v3 transferFunction];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v13[1] = v5;
  v12[2] = @"Matrices";
  uint64_t v9 = [v3 ycbcrMatrix];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  v13[2] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v7;
}

+ (uint64_t)JFX_isRec709Gamma:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = [MEMORY[0x263F61230] rec709GammaColorSpace];
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isSRGBColorSpace:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = [MEMORY[0x263F61230] sRGBColorSpace];
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isP3D65:()JFX transferFunction:matrix:
{
  v22[3] = *MEMORY[0x263EF8340];
  id v8 = [MEMORY[0x263F61230] p3d65GammaColorSpace];
  uint64_t v9 = [v8 nclcTriplet];

  v21[0] = @"ColorPrimaries";
  uint64_t v20 = [v9 colorPrimary];
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v22[0] = v10;
  v21[1] = @"TransferFunctions";
  uint64_t v19 = [v9 transferFunction];
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  v22[1] = v11;
  v21[2] = @"Matrices";
  uint64_t v12 = [v9 ycbcrMatrix];
  uint64_t v13 = *MEMORY[0x263F04038];
  v18[0] = v12;
  v18[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v22[2] = v14;
  int v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  uint64_t v16 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v15);
  return v16;
}

+ (uint64_t)JFX_isRec601Gamma:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = objc_msgSend(MEMORY[0x263F61230], "rec601_1_1_6_GammaColorSpace");
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec709Linear:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = [MEMORY[0x263F61230] rec709LinearColorSpace];
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isP3HLG:()JFX transferFunction:matrix:
{
  v22[3] = *MEMORY[0x263EF8340];
  id v8 = [MEMORY[0x263F61230] p3HLGGammaColorSpace];
  uint64_t v9 = [v8 nclcTriplet];

  v21[0] = @"ColorPrimaries";
  uint64_t v20 = [v9 colorPrimary];
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v22[0] = v10;
  v21[1] = @"TransferFunctions";
  uint64_t v19 = [v9 transferFunction];
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  v22[1] = v11;
  v21[2] = @"Matrices";
  uint64_t v12 = [v9 ycbcrMatrix];
  uint64_t v13 = *MEMORY[0x263F04028];
  v18[0] = v12;
  v18[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v22[2] = v14;
  int v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  uint64_t v16 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v15);
  return v16;
}

+ (uint64_t)JFX_isP3PQ:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = [MEMORY[0x263F61230] p3PQGammaColorSpace];
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec2100HLG:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = [MEMORY[0x263F61230] rec2100HLGColorSpace];
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec2100PQ:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = [MEMORY[0x263F61230] rec2100PQColorSpace];
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec2020Linear:()JFX transferFunction:matrix:
{
  id v8 = (void *)MEMORY[0x263F61230];
  uint64_t v9 = [MEMORY[0x263F61230] rec2020LinearColorSpace];
  uint64_t v10 = objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);

  uint64_t v11 = objc_msgSend(MEMORY[0x263F61230], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (void)jfx_getColorSpaceFromColorPrimaries:()JFX transferFunction:matrix:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "Unsupported NCLC triplet colorspace", v1, 2u);
}

@end