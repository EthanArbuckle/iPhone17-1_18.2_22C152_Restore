@interface VCPFaceCropUtils
+ (BOOL)isValidFaceCrop:(id)a3;
+ (CGImageMetadata)createOutputMetadataFromDictionary:(id)a3;
+ (CGRect)cropBoundsInOriginalImageFromFaceCrop:(id)a3 error:(id *)a4;
+ (CGRect)faceBoundsFromFaceCrop:(id)a3 error:(id *)a4;
+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4;
+ (id)groupingIdentifierFromFaceCrop:(id)a3 error:(id *)a4;
+ (id)imageCreationOptions;
+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3;
+ (id)newDictionaryRepresentationOfFaceCropDataFromFaceBox:(CGRect)a3 andCropRegion:(CGRect)a4 andGroupingIdentifier:(id)a5;
+ (id)newFaceCropFromCGImageSource:(const CGImageSource *)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6;
+ (id)newFaceCropFromImageData:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6;
+ (id)newFaceCropFromImageURL:(id)a3 withNormalizedFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6;
@end

@implementation VCPFaceCropUtils

+ (CGImageMetadata)createOutputMetadataFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1C186D320]();
  Mutable = CGImageMetadataCreateMutable();
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, @"tiff:Orientation", @"1"))
  {
    v9 = @"Could not set output orientation";
    goto LABEL_9;
  }
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"com.apple/PhotoVision/FaceCrop/", @"PVFC", 0))
  {
    v9 = @"Could not register face crop namespace";
LABEL_9:
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:0];
  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not generate serialized metadata representation" userInfo:0];
    objc_exception_throw(v11);
  }
  v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  if (!v7)
  {
    v12 = @"Could not convert metadata representation into serialized format";
    goto LABEL_13;
  }
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, @"PVFC:PVFC", v7))
  {
    v12 = @"Could not set face crop metadata";
LABEL_13:
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v12 userInfo:0];
    objc_exception_throw(v13);
  }

  return Mutable;
}

+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1C186D320]();
    v5 = CGImageSourceCreateWithData(v3, 0);
    v6 = v5;
    if (!v5)
    {
      id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not create image source" userInfo:0];
      objc_exception_throw(v16);
    }
    v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    v8 = v7;
    if (!v7)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"No meta data exists on image" userInfo:0];
      objc_exception_throw(v17);
    }
    v9 = (__CFString *)CGImageMetadataCopyStringValueWithPath(v7, 0, @"PVFC:PVFC");
    id v10 = v9;
    if (v9)
    {
      id v11 = (void *)MEMORY[0x1E4F28D90];
      v12 = [(__CFString *)v9 dataUsingEncoding:4];
      uint64_t v13 = [v11 JSONObjectWithData:v12 options:1 error:0];
    }
    else
    {
      uint64_t v13 = 0;
    }

    CFRelease(v8);
    v14 = (void *)v13;
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)newDictionaryRepresentationOfFaceCropDataFromFaceBox:(CGRect)a3 andCropRegion:(CGRect)a4 andGroupingIdentifier:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v13 = a5;
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [v14 setObject:&unk_1F15EBB98 forKey:@"PVFC_VER"];
  v18.origin.CGFloat x = v12;
  v18.origin.CGFloat y = v11;
  v18.size.CGFloat width = v10;
  v18.size.CGFloat height = v9;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v18);
  [v14 setObject:DictionaryRepresentation forKey:@"PVFC_FB"];

  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CFDictionaryRef v16 = CGRectCreateDictionaryRepresentation(v19);
  [v14 setObject:v16 forKey:@"PVFC_CB"];

  [v14 setObject:&unk_1F15EBB98 forKey:@"PVFC_VER"];
  if (v13) {
    [v14 setObject:v13 forKey:@"PVFC_GID"];
  }

  return v14;
}

+ (id)imageCreationOptions
{
  if (imageCreationOptions_onceToken != -1) {
    dispatch_once(&imageCreationOptions_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)imageCreationOptions_kImageCreationOptions;
  return v2;
}

void __40__VCPFaceCropUtils_imageCreationOptions__block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F2FF80];
  v4[0] = *MEMORY[0x1E4F2FF08];
  v4[1] = v0;
  v5[0] = MEMORY[0x1E4F1CC28];
  v5[1] = MEMORY[0x1E4F1CC38];
  uint64_t v1 = *MEMORY[0x1E4F2FF48];
  v4[2] = *MEMORY[0x1E4F2FF88];
  v4[3] = v1;
  v5[2] = MEMORY[0x1E4F1CC28];
  v5[3] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  CFDataRef v3 = (void *)imageCreationOptions_kImageCreationOptions;
  imageCreationOptions_kImageCreationOptions = v2;
}

+ (id)newFaceCropFromCGImageSource:(const CGImageSource *)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1C186D320]();
  if (!a3)
  {
    id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"unexpected nil image source" userInfo:0];
    objc_exception_throw(v43);
  }
  v54[0] = -1;
  size_t v52 = 0;
  size_t v53 = 0;
  if ((getImagePropertiesFromCGImageSource(a3, v54, &v53, &v52) & 1) == 0)
  {
    v42 = @"invalid image source";
LABEL_39:
    id v44 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v42 userInfo:0];
    objc_exception_throw(v44);
  }
  if (!(unint64_t)(width + 0.5) || !(unint64_t)(height + 0.5))
  {
    v42 = @"zero dimensioned face rect submitted";
    goto LABEL_39;
  }
  unint64_t v14 = v53;
  if (x < 0.0 || y < 0.0)
  {
    unint64_t v15 = v52;
LABEL_14:
    v67.size.double width = (double)v53;
    v67.size.double height = (double)v15;
    v67.origin.double x = 0.0;
    v67.origin.double y = 0.0;
    v64.origin.double x = x;
    v64.origin.double y = y;
    v64.size.double width = width;
    v64.size.double height = height;
    CGRect v65 = CGRectIntersection(v64, v67);
    double x = v65.origin.x;
    double width = v65.size.width;
    unint64_t v15 = v52;
    unint64_t v14 = v53;
    goto LABEL_15;
  }
  unint64_t v15 = v52;
  if (v53 < (unint64_t)(width + x + 0.5) || v52 < (unint64_t)(height + y + 0.5)) {
    goto LABEL_14;
  }
LABEL_15:
  v66.origin.double x = makeRectWithAllIntegers(x + width * 0.5 - (width + width) * 0.5);
  v68.size.double width = (double)v14;
  v68.size.double height = (double)v15;
  v68.origin.double x = 0.0;
  v68.origin.double y = 0.0;
  *(void *)&double v17 = (unint64_t)CGRectIntersection(v66, v68);
  double RectWithAllIntegers = makeRectWithAllIntegers(v17);
  double v50 = v21;
  double v51 = RectWithAllIntegers;
  double v22 = v19;
  double v23 = v20;
  if (v19 >= v20) {
    double v24 = v19;
  }
  else {
    double v24 = v20;
  }
  if (v19 >= v20) {
    double v25 = v20;
  }
  else {
    double v25 = v19;
  }
  if (v24 > 256.0)
  {
    double v26 = 256.0 / v24;
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_31;
    }
    v27 = VCPLogInstance();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 134218496;
    double v58 = v22;
    __int16 v59 = 2048;
    double v60 = v23;
    __int16 v61 = 2048;
    double v62 = v26;
    v28 = "[FaceCropGeneration] Scaling down from %.0fx%.0f with factor: %.3f";
    goto LABEL_29;
  }
  double v26 = 1.0;
  if (v25 < 128.0)
  {
    double v26 = 128.0 / v25;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v27 = VCPLogInstance();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
LABEL_30:

        goto LABEL_31;
      }
      *(_DWORD *)buf = 134218496;
      double v58 = v22;
      __int16 v59 = 2048;
      double v60 = v23;
      __int16 v61 = 2048;
      double v62 = 128.0 / v25;
      v28 = "[FaceCropGeneration] Scaling up from %.0fx%.0f with factor: %.3f";
LABEL_29:
      _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, v28, buf, 0x20u);
      goto LABEL_30;
    }
  }
LABEL_31:
  double v49 = makeRectWithAllIntegers((x - v51) * v26);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  OrientedCroppedAndScaledImageFromCGImageSource = createOrientedCroppedAndScaledImageFromCGImageSource(a3, v51, v50, v22, v23, v26);
  if (!OrientedCroppedAndScaledImageFromCGImageSource)
  {
    id v45 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not create cropped face crop image" userInfo:0];
    objc_exception_throw(v45);
  }
  v36 = objc_msgSend(a1, "newDictionaryRepresentationOfFaceCropDataFromFaceBox:andCropRegion:andGroupingIdentifier:", v12, v49, v30, v32, v34, v51, v50, v22, v23);
  v37 = (const CGImageMetadata *)[a1 createOutputMetadataFromDictionary:v36];
  if (!v37)
  {
    id v46 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not create face crop metadata" userInfo:0];
    objc_exception_throw(v46);
  }
  v38 = [MEMORY[0x1E4F1CA58] data];
  v39 = CGImageDestinationCreateWithData(v38, @"public.jpeg", 1uLL, 0);
  if (!v39)
  {
    id v47 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not create face crop data" userInfo:0];
    objc_exception_throw(v47);
  }
  uint64_t v55 = *MEMORY[0x1E4F2F430];
  v56 = &unk_1F15EB098;
  CFDictionaryRef v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  CGImageDestinationAddImageAndMetadata(v39, OrientedCroppedAndScaledImageFromCGImageSource, v37, v40);
  if (!CGImageDestinationFinalize(v39))
  {
    id v48 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not write face crop data" userInfo:0];
    objc_exception_throw(v48);
  }

  CGImageRelease(OrientedCroppedAndScaledImageFromCGImageSource);
  CFRelease(v37);
  CFRelease(v39);

  return v38;
}

+ (id)newFaceCropFromImageURL:(id)a3 withNormalizedFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFURLRef v12 = (const __CFURL *)a3;
  id v13 = a5;
  context = (void *)MEMORY[0x1C186D320]();
  if (!v12)
  {
    double v34 = @"image url is nil";
    goto LABEL_43;
  }
  unint64_t v14 = CGImageSourceCreateWithURL(v12, (CFDictionaryRef)[a1 imageCreationOptions]);
  if (!v14)
  {
    double v34 = @"Could not create image source";
LABEL_43:
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v34 userInfo:0];
    objc_exception_throw(v35);
  }
  ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v14, 0, (CFDictionaryRef)[a1 imageCreationOptions]);
  if (!ImageAtIndex)
  {
    id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not create image ref" userInfo:0];
    objc_exception_throw(v36);
  }
  CFDictionaryRef v16 = CGImageSourceCopyMetadataAtIndex(v14, 0, 0);
  double v17 = v16;
  if (v16)
  {
    CFStringRef v18 = CGImageMetadataCopyStringValueWithPath(v16, 0, @"tiff:Orientation");
    CFStringRef v19 = v18;
    if (v18)
    {
      unsigned int IntValue = CFStringGetIntValue(v18);
      if (IntValue - 9 <= 0xFFFFFFF7)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          double v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v42 = IntValue;
            _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Invalid orientation found: %d. Using a default value of 1", buf, 8u);
          }
        }
        unsigned int IntValue = 1;
      }
      CFRelease(v19);
    }
    else
    {
      unsigned int IntValue = 1;
    }
    CFRelease(v17);
  }
  else
  {
    unsigned int IntValue = 1;
  }
  size_t v22 = CGImageGetWidth(ImageAtIndex);
  size_t v23 = CGImageGetHeight(ImageAtIndex);
  if (x < 0.0 || x > 1.0 || y < 0.0 || y > 1.0 || width < 0.0 || width > 1.0 || height < 0.0 || height > 1.0)
  {
    double v27 = *MEMORY[0x1E4F1DB20];
    double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v30 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    double v24 = (double)v23;
    if (IntValue <= 4) {
      double v25 = (double)v22;
    }
    else {
      double v25 = (double)v23;
    }
    if (IntValue > 4) {
      double v24 = (double)v22;
    }
    if (v25 >= v24) {
      double v26 = v25;
    }
    else {
      double v26 = v24;
    }
    double v27 = x * v25;
    double v28 = width * v26;
    double v29 = y * v24;
    double v30 = height * v26;
  }
  v44.origin.double x = v27;
  v44.origin.double y = v29;
  v44.size.double width = v28;
  v44.size.double height = v30;
  if (CGRectIsNull(v44))
  {
    id v37 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not create face rect" userInfo:0];
    objc_exception_throw(v37);
  }
  v40[0] = 0;
  double v31 = objc_msgSend(a1, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v14, v13, v40, v27, v29, v28, v30);
  id v32 = v40[0];
  CFRelease(ImageAtIndex);
  CFRelease(v14);
  if (a6 && v32) {
    *a6 = v32;
  }

  return v31;
}

+ (id)newFaceCropFromImageData:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v22[3] = *(id *)MEMORY[0x1E4F143B8];
  CFDataRef v13 = (const __CFData *)a3;
  id v14 = a5;
  unint64_t v15 = (void *)MEMORY[0x1C186D320]();
  if (!v13)
  {
    double v20 = @"image data is nil";
    goto LABEL_9;
  }
  CGImageSourceRef v16 = CGImageSourceCreateWithData(v13, (CFDictionaryRef)[a1 imageCreationOptions]);
  if (!v16)
  {
    double v20 = @"Could not create image source from data";
LABEL_9:
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  v22[0] = 0;
  double v17 = objc_msgSend(a1, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v16, v14, v22, x, y, width, height);
  id v18 = v22[0];
  CFRelease(v16);
  if (a6 && v18) {
    *a6 = v18;
  }

  return v17;
}

+ (BOOL)isValidFaceCrop:(id)a3
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1C186D320]();
  v7 = (void *)[a1 newDictionaryPopulatedWithFaceCropDataFromImageData:v5];
  v8 = v7;
  if (v7)
  {
    CGFloat v9 = [v7 objectForKeyedSubscript:@"PVFC_VER"];
    char v10 = [v9 isEqualToNumber:&unk_1F15EBB98];
    if ((v10 & 1) != 0
      || ([v8 objectForKeyedSubscript:@"PVFC_VER"],
          CFDataRef v3 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToNumber:&unk_1F15EBBB0]))
    {
      CGFloat v11 = [v8 objectForKeyedSubscript:@"PVFC_FB"];
      if (v11)
      {
        CFURLRef v12 = [v8 objectForKeyedSubscript:@"PVFC_CB"];
        BOOL v13 = v12 != 0;
      }
      else
      {
        BOOL v13 = 0;
      }

      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v13 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

+ (CGRect)faceBoundsFromFaceCrop:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v6;
  v7 = (void *)MEMORY[0x1C186D320]();
  v8 = (void *)[a1 newDictionaryPopulatedWithFaceCropDataFromImageData:v5];
  CGFloat v9 = v8;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"invalid face crop supplied" userInfo:0];
    objc_exception_throw(v16);
  }
  CFDictionaryRef v10 = [v8 objectForKeyedSubscript:@"PVFC_FB"];
  CFDictionaryRef v11 = v10;
  if (v10) {
    CGRectMakeWithDictionaryRepresentation(v10, &rect);
  }

  double x = rect.origin.x;
  double y = rect.origin.y;
  double width = rect.size.width;
  double height = rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (CGRect)cropBoundsInOriginalImageFromFaceCrop:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v6;
  v7 = (void *)MEMORY[0x1C186D320]();
  v8 = (void *)[a1 newDictionaryPopulatedWithFaceCropDataFromImageData:v5];
  CGFloat v9 = v8;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"invalid face crop supplied" userInfo:0];
    objc_exception_throw(v16);
  }
  CFDictionaryRef v10 = [v8 objectForKeyedSubscript:@"PVFC_CB"];
  CFDictionaryRef v11 = v10;
  if (v10) {
    CGRectMakeWithDictionaryRepresentation(v10, &rect);
  }

  double x = rect.origin.x;
  double y = rect.origin.y;
  double width = rect.size.width;
  double height = rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (id)groupingIdentifierFromFaceCrop:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CGSize v6 = (void *)MEMORY[0x1C186D320]();
  v7 = (void *)[a1 newDictionaryPopulatedWithFaceCropDataFromImageData:v5];
  v8 = v7;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"invalid face crop supplied" userInfo:0];
    objc_exception_throw(v11);
  }
  CGFloat v9 = [v7 objectForKeyedSubscript:@"PVFC_GID"];

  return v9;
}

+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (const __CFData *)a3;
  CGSize v6 = (void *)MEMORY[0x1C186D320]();
  if (([a1 isValidFaceCrop:v5] & 1) == 0)
  {
    BOOL v13 = @"the supplied data is not a facecrop";
    goto LABEL_7;
  }
  v7 = CGImageSourceCreateWithData(v5, (CFDictionaryRef)[a1 imageCreationOptions]);
  v8 = v7;
  if (!v7)
  {
    BOOL v13 = @"could not create an image source";
LABEL_7:
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v13 userInfo:0];
    objc_exception_throw(v14);
  }
  v18[0] = -1;
  size_t v16 = 0;
  size_t v17 = 0;
  if ((getImagePropertiesFromCGImageSource(v7, v18, &v17, &v16) & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not retrieve image properties" userInfo:0];
    objc_exception_throw(v15);
  }
  double v9 = (double)v17;
  double v10 = (double)v16;
  CFRelease(v8);

  double v11 = v9;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

@end