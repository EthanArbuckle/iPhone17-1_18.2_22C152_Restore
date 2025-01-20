@interface ICDocCamImageFilters
+ (id)bradleyAdaptiveThreshold:(id)a3;
+ (id)bradleyAdaptiveThreshold:(id)a3 orientation:(int64_t)a4;
+ (id)bradleyAdaptiveThresholdWithBlur:(id)a3 orientation:(int64_t)a4;
+ (id)colorDocument:(id)a3 orientation:(int64_t)a4;
+ (id)colorDocument:(id)a3 orientation:(int64_t)a4 constantColor:(BOOL)a5;
+ (id)colorDocument:(id)a3 orientation:(int64_t)a4 filterName:(id)a5 filterAmount:(float)a6 filterKey:(id)a7;
+ (id)convertImageToGrayScale:(id)a3;
+ (id)filteredImage:(id)a3 imageFilterType:(signed __int16)a4;
+ (id)filteredImage:(id)a3 imageFilterType:(signed __int16)a4 constantColor:(BOOL)a5;
+ (id)filteredImage:(id)a3 orientation:(int64_t)a4 imageFilterType:(signed __int16)a5;
+ (id)filteredImage:(id)a3 orientation:(int64_t)a4 imageFilterType:(signed __int16)a5 constantColor:(BOOL)a6;
+ (id)grayscale:(id)a3 orientation:(int64_t)a4;
+ (id)grayscaleDocument:(id)a3 orientation:(int64_t)a4;
+ (id)imageFilterNames;
+ (id)imageWithRGBColorspaceFromImage:(id)a3;
+ (id)localizedImageFilterNameForName:(id)a3;
+ (id)localizedImageFilterNameForType:(signed __int16)a3;
+ (id)nonLocalizedImageFilterNameForType:(signed __int16)a3;
+ (id)nonLocalizedImageFilterNames;
+ (id)perspectiveCorrectedCIImageFromCIImage:(id)a3 imageQuad:(id)a4;
+ (id)perspectiveCorrectedImageFromImage:(id)a3 imageQuad:(id)a4;
+ (id)perspectiveCorrectedImageFromImage:(id)a3 normalizedImageQuad:(id)a4;
+ (id)sharedCoreImageContext;
+ (id)whiteboardAndSaturation:(id)a3 orientation:(int64_t)a4;
+ (id)whiteboardFilter:(id)a3 orientation:(int64_t)a4;
+ (signed)imageFilterTypeFromName:(id)a3;
+ (signed)imageFilterTypeFromNonLocalizedName:(id)a3;
@end

@implementation ICDocCamImageFilters

+ (id)filteredImage:(id)a3 imageFilterType:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = objc_msgSend(a1, "filteredImage:orientation:imageFilterType:", v6, objc_msgSend(v6, "dc_imageOrientation"), v4);

  return v7;
}

+ (id)filteredImage:(id)a3 orientation:(int64_t)a4 imageFilterType:(signed __int16)a5
{
  int v5 = a5;
  id v8 = a3;
  v9 = (void *)MEMORY[0x21D44F7D0]();
  switch(v5)
  {
    case 0:
      uint64_t v10 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v8, "dc_CGImage"), a4, 1.0);
      goto LABEL_8;
    case 1:
      uint64_t v10 = [a1 colorDocument:v8 orientation:a4];
      goto LABEL_8;
    case 2:
      uint64_t v10 = [a1 grayscaleDocument:v8 orientation:a4];
      goto LABEL_8;
    case 3:
      uint64_t v10 = [a1 bradleyAdaptiveThreshold:v8 orientation:a4];
      goto LABEL_8;
    case 4:
      uint64_t v10 = [a1 whiteboardFilter:v8 orientation:a4];
LABEL_8:
      v11 = (void *)v10;
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

+ (id)imageFilterNames
{
  if (imageFilterNames_onceToken != -1) {
    dispatch_once(&imageFilterNames_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)imageFilterNames_sImageFilterNames;

  return v2;
}

void __40__ICDocCamImageFilters_imageFilterNames__block_invoke()
{
  v7[5] = *MEMORY[0x263EF8340];
  v0 = +[ICDocCamImageFilters localizedImageFilterNameForType:0];
  v1 = +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", 1, v0);
  v7[1] = v1;
  v2 = +[ICDocCamImageFilters localizedImageFilterNameForType:2];
  v7[2] = v2;
  v3 = +[ICDocCamImageFilters localizedImageFilterNameForType:3];
  v7[3] = v3;
  uint64_t v4 = +[ICDocCamImageFilters localizedImageFilterNameForType:4];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  id v6 = (void *)imageFilterNames_sImageFilterNames;
  imageFilterNames_sImageFilterNames = v5;
}

+ (id)nonLocalizedImageFilterNames
{
  if (nonLocalizedImageFilterNames_onceToken != -1) {
    dispatch_once(&nonLocalizedImageFilterNames_onceToken, &__block_literal_global_4_0);
  }
  v2 = (void *)nonLocalizedImageFilterNames_sImageFilterNames;

  return v2;
}

void __52__ICDocCamImageFilters_nonLocalizedImageFilterNames__block_invoke()
{
  v7[5] = *MEMORY[0x263EF8340];
  v0 = +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:0];
  v1 = +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", 1, v0);
  v7[1] = v1;
  v2 = +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:2];
  v7[2] = v2;
  v3 = +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:3];
  v7[3] = v3;
  uint64_t v4 = +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:4];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  id v6 = (void *)nonLocalizedImageFilterNames_sImageFilterNames;
  nonLocalizedImageFilterNames_sImageFilterNames = v5;
}

+ (signed)imageFilterTypeFromName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 imageFilterNames];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  else {
    return v6;
  }
}

+ (signed)imageFilterTypeFromNonLocalizedName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 nonLocalizedImageFilterNames];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  else {
    return v6;
  }
}

+ (id)localizedImageFilterNameForName:(id)a3
{
  uint64_t v4 = [a1 imageFilterTypeFromName:a3];

  return (id)[a1 localizedImageFilterNameForType:v4];
}

+ (id)localizedImageFilterNameForType:(signed __int16)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v5 = @"Photo";
      goto LABEL_10;
    case 1:
      uint64_t v5 = @"Color";
      goto LABEL_10;
    case 2:
      uint64_t v5 = @"Grayscale";
      goto LABEL_10;
    case 3:
      uint64_t v5 = @"Black & White";
      goto LABEL_10;
    case 4:
      uint64_t v5 = @"Whiteboard";
LABEL_10:
      uint64_t v6 = +[DCLocalization localizedStringForKey:v5, v5, @"Localizable", v3 value table];
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

+ (id)nonLocalizedImageFilterNameForType:(signed __int16)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_2642A9E20[a3];
  }
}

+ (id)sharedCoreImageContext
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedCoreImageContext_context)
  {
    uint64_t v3 = [MEMORY[0x263F00628] contextWithOptions:0];
    uint64_t v4 = (void *)sharedCoreImageContext_context;
    sharedCoreImageContext_context = v3;
  }
  objc_sync_exit(v2);

  uint64_t v5 = (void *)sharedCoreImageContext_context;

  return v5;
}

+ (id)bradleyAdaptiveThreshold:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (CGImage *)objc_msgSend(v3, "dc_CGImage");
  size_t Width = CGImageGetWidth(v4);
  size_t Height = CGImageGetHeight(v4);
  DataProvider = CGImageGetDataProvider(v4);
  CFDataRef v8 = CGDataProviderCopyData(DataProvider);
  uint64_t v9 = [(__CFData *)v8 bytes];

  DeviceGray = CGColorSpaceCreateDeviceGray();
  v11 = CGBitmapContextCreate(0, Width, Height, 8uLL, Width, DeviceGray, 0);
  Data = (char *)CGBitmapContextGetData(v11);
  unint64_t v13 = 8 * (int)Width;
  BOOL v14 = (Height & 0x80000000) != 0;
  if ((Height & 0x80000000) == 0) {
    unint64_t v15 = Height;
  }
  else {
    unint64_t v15 = -(int)Height;
  }
  BOOL v16 = !is_mul_ok(v15, v13);
  size_t v17 = v15 * v13;
  if (!v17) {
    BOOL v14 = 0;
  }
  if (v16 || v14)
  {
    v50 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      +[ICDocCamImageFilters bradleyAdaptiveThreshold:v50];
    }

    CGContextRelease(v11);
    id v49 = v3;
  }
  else
  {
    v18 = Data;
    if ((Height & 0x80000000) == 0) {
      size_t v19 = v17;
    }
    else {
      size_t v19 = -(uint64_t)v17;
    }
    v20 = malloc_type_malloc(v19, 0x7C49083AuLL);
    int v21 = Height - 1;
    if ((int)Height >= 1)
    {
      int v22 = 0;
      int v23 = 0;
      do
      {
        if ((int)Width >= 1)
        {
          uint64_t v24 = 0;
          v25 = &v20[v23];
          v26 = (unsigned __int8 *)(v9 + v23);
          v23 += Width;
          int v27 = Width;
          do
          {
            unsigned int v28 = *v26++;
            v24 += v28;
            uint64_t v29 = v24;
            if (v22) {
              uint64_t v29 = v25[-(int)Width] + v24;
            }
            *v25++ = v29;
            --v27;
          }
          while (v27);
        }
        ++v22;
      }
      while (v22 != Height);
      uint64_t v30 = 0;
      if ((Width & 0x80000000) == 0) {
        int v31 = Width;
      }
      else {
        int v31 = Width + 31;
      }
      uint64_t v32 = (uint64_t)v31 >> 5;
      uint64_t v33 = Height;
      int v34 = -(v31 >> 5);
      do
      {
        if ((int)Width >= 1)
        {
          int v35 = (v30 - v32) & ~(((int)v30 - (int)v32) >> 31);
          if (v30 + v32 >= v33) {
            int v36 = v21;
          }
          else {
            int v36 = v30 + v32;
          }
          int v37 = v36 - v35;
          int v38 = v36 * Width;
          int v39 = v35 * Width;
          v40 = (unsigned __int8 *)v9;
          v41 = v18;
          uint64_t v42 = v32;
          int v43 = v34;
          uint64_t v44 = Width;
          do
          {
            if (v42 >= (int)Width) {
              int v45 = Width - 1;
            }
            else {
              int v45 = v42;
            }
            int v46 = *v40++;
            if (v46 * (uint64_t)((v45 - (v43 & ~(v43 >> 31))) * v37) < (uint64_t)((double)(uint64_t)(v20[v45 + v38]
                                                                                                 - (v20[v45 + v39]
                                                                                                  + v20[(v43 & ~(v43 >> 31)) + v38])
                                                                                                 + v20[(v43 & ~(v43 >> 31)) + v39])
                                                                               * 0.849999994))
              char v47 = 0;
            else {
              char v47 = -1;
            }
            *v41++ = v47;
            ++v43;
            ++v42;
            --v44;
          }
          while (v44);
        }
        ++v30;
        v18 += (int)Width;
        v9 += (int)Width;
      }
      while (v30 != v33);
    }
    free(v20);
    Image = CGBitmapContextCreateImage(v11);
    objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:", Image);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    CGContextRelease(v11);
    CGImageRelease(Image);
  }
  CGColorSpaceRelease(DeviceGray);

  return v49;
}

+ (id)convertImageToGrayScale:(id)a3
{
  id v3 = (CGImage *)objc_msgSend(a3, "dc_CGImage");
  CGFloat Width = (double)CGImageGetWidth(v3);
  CGFloat Height = (double)CGImageGetHeight(v3);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v7 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, (unint64_t)Width, DeviceGray, 0);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = Width;
  v12.size.height = Height;
  CGContextDrawImage(v7, v12, v3);
  CGImageRef Image = CGBitmapContextCreateImage(v7);
  uint64_t v9 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:", Image);
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v7);
  CFRelease(Image);

  return v9;
}

+ (id)whiteboardFilter:(id)a3 orientation:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  uint64_t v6 = objc_alloc_init(WhiteboardFilter);
  [(WhiteboardFilter *)v6 setInputImage:v5];
  [(WhiteboardFilter *)v6 setStride:&unk_26C7ED748];
  v7 = [(WhiteboardFilter *)v6 outputImage];
  CFDataRef v8 = +[ICDocCamImageFilters sharedCoreImageContext];
  [v7 extent];
  uint64_t v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
  uint64_t v10 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", v9, a4, 1.0);
  CGImageRelease(v9);

  return v10;
}

+ (id)whiteboardAndSaturation:(id)a3 orientation:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  uint64_t v6 = objc_alloc_init(WhiteboardFilter);
  [(WhiteboardFilter *)v6 setInputImage:v5];
  [(WhiteboardFilter *)v6 setStride:&unk_26C7ED748];
  v7 = [(WhiteboardFilter *)v6 outputImage];
  CFDataRef v8 = +[ICDocCamImageFilters sharedCoreImageContext];
  [v7 extent];
  uint64_t v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
  uint64_t v10 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", v9, a4, 1.0);
  v11 = [MEMORY[0x263F00640] filterWithName:@"CIColorControls"];
  [v11 setDefaults];
  [v11 setValue:&unk_26C7ED760 forKey:@"inputSaturation"];
  CGRect v12 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:", objc_msgSend(v10, "dc_CGImage"));
  [v11 setValue:v12 forKey:@"inputImage"];

  unint64_t v13 = [v11 valueForKey:@"outputImage"];
  [v13 extent];
  BOOL v14 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v13);
  unint64_t v15 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", v14, a4, 1.0);
  CGImageRelease(v14);
  CGImageRelease(v9);

  return v15;
}

+ (id)grayscale:(id)a3 orientation:(int64_t)a4
{
  uint64_t v5 = +[ICDocCamImageFilters convertImageToGrayScale:a3];
  uint64_t v6 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v5, "dc_CGImage"), a4, 1.0);

  return v6;
}

+ (id)bradleyAdaptiveThreshold:(id)a3 orientation:(int64_t)a4
{
  uint64_t v5 = +[ICDocCamImageFilters convertImageToGrayScale:a3];
  uint64_t v6 = +[ICDocCamImageFilters bradleyAdaptiveThreshold:v5];
  v7 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v6, "dc_CGImage"), a4, 1.0);

  return v7;
}

+ (id)bradleyAdaptiveThresholdWithBlur:(id)a3 orientation:(int64_t)a4
{
  uint64_t v5 = +[ICDocCamImageFilters convertImageToGrayScale:a3];
  uint64_t v6 = +[ICDocCamImageFilters bradleyAdaptiveThreshold:v5];
  v7 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v6, "dc_CGImage"), a4, 1.0);

  CFDataRef v8 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:", objc_msgSend(v7, "dc_CGImage"));
  uint64_t v9 = objc_msgSend(MEMORY[0x263F00640], "filterWithName:keysAndValues:", @"CIGaussianBlur", *MEMORY[0x263F00968], v8, @"inputRadius", &unk_26C7ED778, 0);
  uint64_t v10 = [v9 outputImage];
  v11 = +[ICDocCamImageFilters sharedCoreImageContext];
  [v10 extent];
  CGRect v12 = (CGImage *)objc_msgSend(v11, "createCGImage:fromRect:", v10);
  unint64_t v13 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", v12, a4, 1.0);
  CGImageRelease(v12);

  return v13;
}

+ (id)colorDocument:(id)a3 orientation:(int64_t)a4
{
  LODWORD(v4) = 1.0;
  return +[ICDocCamImageFilters colorDocument:a3 orientation:a4 filterName:@"CIPaperWash" filterAmount:*MEMORY[0x263F00988] filterKey:v4];
}

+ (id)colorDocument:(id)a3 orientation:(int64_t)a4 constantColor:(BOOL)a5
{
  if (a5) {
    CFDataRef v8 = @"CIDocumentEnhancer";
  }
  else {
    CFDataRef v8 = @"CIPaperWash";
  }
  if (a5) {
    float v9 = *(float *)"333?";
  }
  else {
    float v9 = 1.0;
  }
  uint64_t v10 = (id *)MEMORY[0x263F00918];
  if (!a5) {
    uint64_t v10 = (id *)MEMORY[0x263F00988];
  }
  id v11 = *v10;
  *(float *)&double v12 = v9;
  unint64_t v13 = [a1 colorDocument:a3 orientation:a4 filterName:v8 filterAmount:v11 filterKey:v12];

  return v13;
}

+ (id)colorDocument:(id)a3 orientation:(int64_t)a4 filterName:(id)a5 filterAmount:(float)a6 filterKey:(id)a7
{
  id v11 = (void *)MEMORY[0x263F00650];
  id v12 = a7;
  id v13 = a5;
  BOOL v14 = objc_msgSend(v11, "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  unint64_t v15 = [MEMORY[0x263F00640] filterWithName:v13];

  *(float *)&double v16 = a6;
  size_t v17 = [NSNumber numberWithFloat:v16];
  [v15 setValue:v17 forKey:v12];

  [v15 setValue:v14 forKey:*MEMORY[0x263F00968]];
  v18 = [v15 outputImage];
  size_t v19 = +[ICDocCamImageFilters sharedCoreImageContext];
  [v18 extent];
  v20 = (CGImage *)objc_msgSend(v19, "createCGImage:fromRect:", v18);
  int v21 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", v20, a4, 1.0);
  CGImageRelease(v20);

  return v21;
}

+ (id)grayscaleDocument:(id)a3 orientation:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  uint64_t v6 = [MEMORY[0x263F00640] filterWithName:@"CIPaperWash"];
  [v6 setValue:v5 forKey:*MEMORY[0x263F00968]];
  [v6 setValue:&unk_26C7ED790 forKey:*MEMORY[0x263F00988]];
  v7 = [v6 outputImage];
  CFDataRef v8 = +[ICDocCamImageFilters sharedCoreImageContext];
  [v7 extent];
  float v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
  uint64_t v10 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", v9, a4, 1.0);
  CGImageRelease(v9);

  return v10;
}

+ (id)filteredImage:(id)a3 imageFilterType:(signed __int16)a4 constantColor:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  float v9 = objc_msgSend(a1, "filteredImage:orientation:imageFilterType:constantColor:", v8, objc_msgSend(v8, "dc_imageOrientation"), v6, v5);

  return v9;
}

+ (id)filteredImage:(id)a3 orientation:(int64_t)a4 imageFilterType:(signed __int16)a5 constantColor:(BOOL)a6
{
  BOOL v6 = a6;
  int v7 = a5;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x21D44F7D0]();
  switch(v7)
  {
    case 0:
      uint64_t v12 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v10, "dc_CGImage"), a4, 1.0);
      goto LABEL_8;
    case 1:
      uint64_t v12 = [a1 colorDocument:v10 orientation:a4 constantColor:v6];
      goto LABEL_8;
    case 2:
      uint64_t v12 = [a1 grayscaleDocument:v10 orientation:a4];
      goto LABEL_8;
    case 3:
      uint64_t v12 = [a1 bradleyAdaptiveThreshold:v10 orientation:a4];
      goto LABEL_8;
    case 4:
      uint64_t v12 = [a1 whiteboardFilter:v10 orientation:a4];
LABEL_8:
      id v13 = (void *)v12;
      break;
    default:
      id v13 = 0;
      break;
  }

  return v13;
}

+ (id)imageWithRGBColorspaceFromImage:(id)a3
{
  id v3 = a3;
  double v4 = (CGImage *)objc_msgSend(v3, "dc_CGImage");
  ColorSpace = CGImageGetColorSpace(v4);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
  {
    double Width = (double)CGImageGetWidth(v4);
    double Height = (double)CGImageGetHeight(v4);
    id v8 = DCTSUCreateRGBABitmapContext(0, Width, Height, 1.0);
    if (v8)
    {
      float v9 = v8;
      v16.origin.x = 0.0;
      v16.origin.y = 0.0;
      v16.size.width = Width;
      v16.size.height = Height;
      CGContextDrawImage(v8, v16, v4);
      CGImageRef Image = CGBitmapContextCreateImage(v9);
      if (Image)
      {
        CGImageRef v11 = Image;
        uint64_t v12 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", Image, objc_msgSend(v3, "dc_imageOrientation"), 1.0);

        CFRelease(v11);
        id v3 = (id)v12;
      }
      CGContextRelease(v9);
    }
  }
  id v13 = v3;

  return v13;
}

+ (id)perspectiveCorrectedCIImageFromCIImage:(id)a3 imageQuad:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x263F00640];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 filterWithName:@"CIPerspectiveCorrection"];
  float v9 = (void *)MEMORY[0x263F00680];
  [v6 topLeft];
  id v10 = objc_msgSend(v9, "vectorWithCGPoint:");
  [v8 setValue:v10 forKey:@"inputTopLeft"];

  CGImageRef v11 = (void *)MEMORY[0x263F00680];
  [v6 topRight];
  uint64_t v12 = objc_msgSend(v11, "vectorWithCGPoint:");
  [v8 setValue:v12 forKey:@"inputTopRight"];

  id v13 = (void *)MEMORY[0x263F00680];
  [v6 bottomLeft];
  BOOL v14 = objc_msgSend(v13, "vectorWithCGPoint:");
  [v8 setValue:v14 forKey:@"inputBottomLeft"];

  unint64_t v15 = (void *)MEMORY[0x263F00680];
  [v6 bottomRight];
  double v17 = v16;
  double v19 = v18;

  v20 = objc_msgSend(v15, "vectorWithCGPoint:", v17, v19);
  [v8 setValue:v20 forKey:@"inputBottomRight"];

  [v8 setValue:v7 forKey:*MEMORY[0x263F00968]];
  int v21 = [v8 valueForKey:*MEMORY[0x263F009D0]];
  [v21 extent];
  CGRect v26 = CGRectInset(v25, 1.0, 1.0);
  int v22 = objc_msgSend(v21, "imageByCroppingToRect:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

  return v22;
}

+ (id)perspectiveCorrectedImageFromImage:(id)a3 imageQuad:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICDocCamImageFilters sharedCoreImageContext];
  float v9 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:", objc_msgSend(v6, "dc_CGImage"));
  id v10 = [a1 perspectiveCorrectedCIImageFromCIImage:v9 imageQuad:v7];

  [v10 extent];
  uint64_t v11 = objc_msgSend(v8, "createCGImage:fromRect:", v10);
  if (v11)
  {
    uint64_t v12 = (CGImage *)v11;
    uint64_t v13 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", v11, objc_msgSend(v6, "dc_imageOrientation"), 1.0);

    CGImageRelease(v12);
    id v6 = (id)v13;
  }

  return v6;
}

+ (id)perspectiveCorrectedImageFromImage:(id)a3 normalizedImageQuad:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (CGImage *)objc_msgSend(v7, "dc_CGImage");
  double Width = (double)CGImageGetWidth(v8);
  id v10 = objc_msgSend(v6, "imageQuadByScalingBy:", Width, (double)CGImageGetHeight(v8));

  uint64_t v11 = [a1 perspectiveCorrectedImageFromImage:v7 imageQuad:v10];

  return v11;
}

+ (void)bradleyAdaptiveThreshold:(os_log_t)log .cold.1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "adaptiveThreshold() overflow check failed with %d x %d image", (uint8_t *)v3, 0xEu);
}

@end