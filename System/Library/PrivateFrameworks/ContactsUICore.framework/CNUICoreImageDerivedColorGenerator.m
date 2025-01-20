@interface CNUICoreImageDerivedColorGenerator
+ (id)ciContextWithHighPriority:(BOOL)a3;
+ (id)colorsForImageRef:(CGImage *)a3;
+ (id)colorsForUIImage:(id)a3;
+ (id)defaultDarkGrayColors;
+ (id)defaultGrayColors;
+ (id)scheduler;
+ (id)tintedUIColorsFromUIColors:(id)a3 isLight:(BOOL)a4;
+ (unint64_t)colorArraySize;
+ (void)fetchColorsForImage:(id)a3 ciContext:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CNUICoreImageDerivedColorGenerator

+ (unint64_t)colorArraySize
{
  return 5;
}

+ (id)colorsForUIImage:(id)a3
{
  id v4 = a3;
  if ([v4 ioSurface])
  {
    v5 = (CGImage *)UICreateCGImageFromIOSurface();
    v6 = [a1 colorsForImageRef:v5];
    CGImageRelease(v5);
  }
  else
  {
    v6 = objc_msgSend(a1, "colorsForImageRef:", objc_msgSend(v4, "CGImage"));
  }

  return v6;
}

+ (id)colorsForImageRef:(CGImage *)a3
{
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  if (Width && Height)
  {
    if ((double)Height <= 160.0) {
      double v7 = (double)Height;
    }
    else {
      double v7 = 160.0;
    }
    uint64_t v8 = (unint64_t)v7;
    v9 = (char *)malloc_type_malloc(vcvtd_n_u64_f64(v7, 2uLL), 0x930010B0uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v11 = CGBitmapContextCreate(v9, 1uLL, (unint64_t)v7, 8uLL, 4uLL, DeviceRGB, 0x4001u);
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = 1.0;
    v30.size.height = v7;
    CGContextDrawImage(v11, v30, a3);
    CGContextRelease(v11);
    CGColorSpaceRelease(DeviceRGB);
    unint64_t v12 = 0;
    if ((unint64_t)v7)
    {
      v13 = v9 + 3;
      while (!*(v13 - 3) && !*(v13 - 2) && !*(v13 - 1) || !*v13)
      {
        ++v12;
        v13 += 4;
        if (v8 == v12)
        {
          unint64_t v12 = (unint64_t)v7;
          break;
        }
      }
      unint64_t v14 = v8 - 1;
      if (v8 - 1 >= 1)
      {
        v15 = &v9[4 * v8 - 2];
        while (!*(v15 - 2) && !*(v15 - 1) && !*v15 || !v15[1])
        {
          --v8;
          v15 -= 4;
          if (v8 <= 1)
          {
            unint64_t v14 = 0;
            goto LABEL_27;
          }
        }
        unint64_t v14 = v8 - 1;
      }
    }
    else
    {
      unint64_t v14 = -1;
    }
LABEL_27:
    v18 = objc_opt_new();
    if (v14 > v12)
    {
      unint64_t v20 = 0.25;
      double v19 = (double)(v14 - v12) * 0.25;
      unint64_t v24 = vcvtpd_u64_f64(v19);
      v25 = &v9[4 * v12 + 3];
      do
      {
        LOBYTE(v19) = *(v25 - 3);
        LOBYTE(v20) = *(v25 - 2);
        LOBYTE(v21) = *(v25 - 1);
        LOBYTE(v22) = *v25;
        objc_msgSend(v18, "addObject:", objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v19 / 255.0, (double)v20 / 255.0, (double)v21 / 255.0, (double)v22 / 255.0));
        v12 += v24;
        v25 += 4 * v24;
      }
      while (v12 < v14);
    }
    v26 = &v9[4 * v14];
    LOBYTE(v19) = *v26;
    LOBYTE(v20) = v26[1];
    LOBYTE(v21) = v26[2];
    LOBYTE(v23) = v26[3];
    objc_msgSend(v18, "addObject:", objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v19 / 255.0, (double)v20 / 255.0, (double)v21 / 255.0, (double)v23 / 255.0));
    free(v9);
    if ((unint64_t)[v18 count] >= 5)
    {
      id v27 = v18;
    }
    else
    {
      id v27 = [a1 defaultGrayColors];
    }
    v17 = v27;
  }
  else
  {
    v16 = background_color_os_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[CNUICoreImageDerivedColorGenerator colorsForImageRef:](v16);
    }

    v17 = [a1 defaultGrayColors];
  }
  return v17;
}

+ (id)scheduler
{
  if (scheduler_cn_once_token_378 != -1) {
    dispatch_once(&scheduler_cn_once_token_378, &__block_literal_global_28);
  }
  v2 = (void *)scheduler_cn_once_object_378;
  return v2;
}

uint64_t __47__CNUICoreImageDerivedColorGenerator_scheduler__block_invoke()
{
  scheduler_cn_once_object_378 = [MEMORY[0x263F33660] serialDispatchQueueSchedulerWithName:@"com.apple.contacts.colorExtraction"];
  return MEMORY[0x270F9A758]();
}

+ (void)fetchColorsForImage:(id)a3 ciContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = [a1 scheduler];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke;
    v12[3] = &unk_2640182B0;
    id v13 = v8;
    id v14 = v9;
    id v16 = a1;
    id v15 = v10;
    [v11 performBlock:v12];
  }
}

void __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke(uint64_t a1)
{
  v70[1] = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = [*(id *)(a1 + 32) hash];
  v3 = background_color_os_log();
  id v4 = v3;
  unint64_t v58 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_20B704000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CNImageDerivedColorFetchColors", "", (uint8_t *)&buf, 2u);
  }
  os_signpost_id_t spid = v2;

  v5 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithImage:*(void *)(a1 + 32)];
  [v5 extent];
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_alloc(MEMORY[0x263F1EF40]);
  v11 = (void *)[v10 initWithCIImage:v5 options:MEMORY[0x263EFFA78]];
  unint64_t v12 = objc_opt_new();
  id v13 = (void *)MEMORY[0x210538660]([v12 setRevision:2]);
  v70[0] = v12;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:1];
  id v67 = 0;
  v60 = v11;
  char v15 = [v11 performRequests:v14 error:&v67];
  id v16 = v67;

  if (v16 || (v15 & 1) == 0)
  {
    v17 = background_color_os_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_cold_1((uint64_t)v16, v17);
    }
  }
  v59 = v12;
  v18 = [v12 results];
  double v19 = [v18 firstObject];

  v57 = v19;
  unint64_t v20 = objc_msgSend(MEMORY[0x263F00650], "imageWithCVPixelBuffer:", objc_msgSend(v19, "pixelBuffer"));
  [v20 extent];
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, v7 / v21, v9 / v22);
  CGAffineTransform v65 = buf;
  v54 = v20;
  uint64_t v23 = [v20 imageByApplyingTransform:&v65];
  unint64_t v24 = [MEMORY[0x263F00640] colorThresholdFilter];
  v56 = (void *)v23;
  [v24 setInputImage:v23];
  LODWORD(v25) = 0.5;
  [v24 setThreshold:v25];
  uint64_t v26 = [v24 outputImage];
  id v27 = [MEMORY[0x263F00640] maskToAlphaFilter];
  v55 = (void *)v26;
  [v27 setInputImage:v26];
  uint64_t v28 = [v27 outputImage];
  v29 = [MEMORY[0x263F00640] sourceOutCompositingFilter];
  v61 = v5;
  [v29 setInputImage:v5];
  v53 = (void *)v28;
  [v29 setBackgroundImage:v28];
  CGRect v30 = [v29 outputImage];
  v31 = (void *)MEMORY[0x210538660]();
  v68[0] = @"inputWidth";
  v32 = [NSNumber numberWithDouble:v7];
  v68[1] = @"inputHeight";
  v69[0] = v32;
  v33 = [NSNumber numberWithDouble:v9];
  v69[1] = v33;
  v34 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
  v35 = [v30 imageByApplyingFilter:@"CISmartGradient" withInputParameters:v34];

  [v35 extent];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = *(void **)(a1 + 40);
  if (v42)
  {
    id v43 = v42;
  }
  else
  {
    id v43 = [*(id *)(a1 + 56) ciContextWithHighPriority:1];
  }
  v44 = v43;
  v45 = (const void *)objc_msgSend(v43, "createCGImage:fromRect:", v35, v37, v39, 8.0, v41);
  v46 = [(id)objc_opt_class() colorsForImageRef:v45];
  if (v45) {
    CFRelease(v45);
  }
  v47 = background_color_os_log();
  v48 = v47;
  if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    LOWORD(v65.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_20B704000, v48, OS_SIGNPOST_INTERVAL_END, spid, "CNImageDerivedColorFetchColors", "", (uint8_t *)&v65, 2u);
  }

  v49 = [MEMORY[0x263F33660] mainThreadScheduler];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_55;
  v62[3] = &unk_264018288;
  id v50 = *(id *)(a1 + 48);
  id v63 = v46;
  id v64 = v50;
  id v51 = v46;
  [v49 performBlock:v62];
}

uint64_t __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)ciContextWithHighPriority:(BOOL)a3
{
  v12[5] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F00628];
  uint64_t v4 = *MEMORY[0x263F00818];
  v11[0] = *MEMORY[0x263F00830];
  v11[1] = v4;
  v12[0] = @"CNUICoreImageDerivedColorGenerator";
  v12[1] = &unk_26BFD9A90;
  v11[2] = *MEMORY[0x263F00848];
  v5 = [NSNumber numberWithBool:a3];
  uint64_t v6 = *MEMORY[0x263F00820];
  v12[2] = v5;
  v12[3] = MEMORY[0x263EFFA88];
  uint64_t v7 = *MEMORY[0x263F00808];
  v11[3] = v6;
  v11[4] = v7;
  void v12[4] = MEMORY[0x263EFFA80];
  double v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  double v9 = [v3 contextWithOptions:v8];

  return v9;
}

+ (id)defaultGrayColors
{
  v9[5] = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = [MEMORY[0x263F1C550] colorWithRed:0.631372549 green:0.643137255 blue:0.690196078 alpha:1.0];
  v3 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.654901961, 0.666666667, 0.709803922, 1.0, v2);
  v9[1] = v3;
  uint64_t v4 = [MEMORY[0x263F1C550] colorWithRed:0.682352941 green:0.694117647 blue:0.725490196 alpha:1.0];
  v9[2] = v4;
  v5 = [MEMORY[0x263F1C550] colorWithRed:0.729411765 green:0.733333333 blue:0.752941176 alpha:1.0];
  v9[3] = v5;
  uint64_t v6 = [MEMORY[0x263F1C550] colorWithRed:0.752941176 green:0.756862745 blue:0.77254902 alpha:1.0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)defaultDarkGrayColors
{
  v9[5] = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = [MEMORY[0x263F1C550] colorWithRed:0.156862745 green:0.164705882 blue:0.2 alpha:1.0];
  v3 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.184313725, 0.196078431, 0.231372549, 1.0, v2);
  v9[1] = v3;
  uint64_t v4 = [MEMORY[0x263F1C550] colorWithRed:0.219607843 green:0.231372549 blue:0.258823529 alpha:1.0];
  v9[2] = v4;
  v5 = [MEMORY[0x263F1C550] colorWithRed:0.258823529 green:0.270588235 blue:0.298039216 alpha:1.0];
  v9[3] = v5;
  uint64_t v6 = [MEMORY[0x263F1C550] colorWithRed:0.301960784 green:0.309803922 blue:0.329411765 alpha:1.0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)tintedUIColorsFromUIColors:(id)a3 isLight:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__CNUICoreImageDerivedColorGenerator_tintedUIColorsFromUIColors_isLight___block_invoke;
  v9[3] = &unk_2640182D8;
  BOOL v11 = a4;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __73__CNUICoreImageDerivedColorGenerator_tintedUIColorsFromUIColors_isLight___block_invoke(uint64_t a1, void *a2)
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  uint64_t v9 = 0;
  double v6 = 0.0;
  double v7 = 0.0;
  [a2 getRed:&v8 green:&v7 blue:&v6 alpha:0];
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 0.65;
  }
  double v7 = v3 + v7 * 0.35;
  double v8 = v3 + v8 * 0.35;
  double v6 = v3 + v6 * 0.35;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", *(void *)&v6, *(void *)&v7, *(void *)&v8);
  [v4 getHue:&v11 saturation:&v10 brightness:&v9 alpha:0];
  double v10 = v10 * 1.6 / (v10 + 0.6);
  id v5 = objc_msgSend(MEMORY[0x263F1C550], "colorWithHue:saturation:brightness:alpha:", v11);
  [*(id *)(a1 + 32) addObject:v5];
}

+ (void)colorsForImageRef:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20B704000, log, OS_LOG_TYPE_DEBUG, "ImageRef for colors had size 0", v1, 2u);
}

void __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "Error performing VNGenerateObjectnessBasedSaliencyImageRequest in fetchColorsForImage: %@", (uint8_t *)&v2, 0xCu);
}

@end