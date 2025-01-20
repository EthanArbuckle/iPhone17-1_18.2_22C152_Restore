@interface PAMediaConversionServiceSharedUtilitiesServiceSide
+ (BOOL)isOutputCorruptionLikelyComparingFileSizeOfInputURL:(id)a3 toOutputURL:(id)a4;
+ (BOOL)isOutputCorruptionLikelyUsingSSIMOfInputURL:(id)a3 toOutputURL:(id)a4;
+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 inputSize:(PFIntSize_st)a4 outputSize:(PFIntSize_st)a5 sx:(double)a6 sy:(double)a7 orientation:(int64_t)a8 colorspace:(CGColorSpace *)space;
+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 scaleFactor:(double)a4 orientation:(int64_t)a5 colorspace:(CGColorSpace *)a6;
+ (CGSize)imageSizeForImageData:(id)a3;
+ (id)adjustmentInformationForComposition:(id)a3 error:(id *)a4;
+ (id)compositionForConversionJob:(id)a3 error:(id *)a4;
+ (id)compositionForPhotosAdjustmentInformation:(id)a3 error:(id *)a4;
+ (id)compositionForPhotosAdjustmentInformation:(id)a3 secondaryDataURL:(id)a4 error:(id *)a5;
+ (id)emptyGenericCompositionWithAdjustmentForOrientation:(int64_t)a3;
+ (id)exporterImageOptionsForScaleFactor:(double)a3 maximumPixelCount:(int64_t)a4 metadataPolicy:(id)a5 shouldApplyOrientationTransform:(BOOL)a6 outputFileType:(id)a7;
+ (id)exporterVideoOptionsForScaleFactor:(double)a3 maximumPixelCount:(int64_t)a4;
+ (id)generatePortraitAdjustmentForURL:(id)a3 contentType:(id)a4 orientation:(unsigned int)a5 error:(id *)a6;
+ (id)imageDataForPhotosAdjustmentsComposition:(id)a3 source:(id)a4 exporterImageOptions:(id)a5 outOutputSize:(CGSize *)a6 job:(id)a7;
+ (id)loadCompositionFrom:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 secondaryDataURL:(id)a6 error:(id *)a7;
+ (id)scalePolicyForScaleFactor:(double)a3 maximumPixelCount:(int64_t)a4;
+ (id)temporaryDestinationURLCollectionForFinalDestinationURLCollection:(id)a3 inParentDirectoryURL:(id)a4;
+ (id)temporaryFilesDirectoryURLForConversionTaskIdentifier:(id)a3 error:(id *)a4;
+ (void)checkConversionResultForOutputCorruptionAndMarkJobAsFailed:(id)a3;
+ (void)configureSourcesForComposition:(id)a3 fromPhotosAdjustmentsJob:(id)a4;
+ (void)executeConversionJob:(id)a3;
+ (void)registerPhotosAdjustmentsSubsystems;
+ (void)renderPhotosAdjustmentsComposition:(id)a3 forConversionJob:(id)a4;
@end

@implementation PAMediaConversionServiceSharedUtilitiesServiceSide

+ (id)temporaryFilesDirectoryURLForConversionTaskIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = NSTemporaryDirectory();
  v7 = +[PFMediaUtilities protectedTemporaryItemsSubdirectoryName];
  v8 = [v6 stringByAppendingPathComponent:v7];

  v9 = +[NSString stringWithFormat:@"com.apple.photos.mediaconversion-%d-%@", getpid(), v5];

  v10 = [v8 stringByAppendingPathComponent:v9];

  v11 = +[NSURL fileURLWithPath:v10 isDirectory:1];
  v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:a4];
  id v14 = 0;
  if (v13) {
    id v14 = v11;
  }

  return v14;
}

+ (id)temporaryDestinationURLCollectionForFinalDestinationURLCollection:(id)a3 inParentDirectoryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2110, @"Invalid parameter not satisfying: %@", @"finalDestinationURLCollection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2111, @"Invalid parameter not satisfying: %@", @"parentDirectoryURL" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001433C;
  v17[3] = &unk_1000414A0;
  id v18 = v9;
  id v10 = (id)objc_opt_new();
  id v19 = v10;
  id v11 = v9;
  [v7 enumerateResourceURLs:v17];
  v12 = v19;
  id v13 = v10;

  return v13;
}

+ (CGSize)imageSizeForImageData:(id)a3
{
  CFDataRef v5 = (const __CFData *)a3;
  if (!v5)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2092, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v18[0] = &__kCFBooleanFalse;
  v17[0] = kCGImageSourceShouldCache;
  v17[1] = kCGImageSourceRasterizationDPI;
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[PFMediaUtilities defaultRasterizationDPI]);
  v18[1] = v6;
  id v7 = CGImageSourceCreateWithData(v5, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2]);

  if (v7)
  {
    CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
    v9 = [(__CFDictionary *)v8 objectForKeyedSubscript:kCGImagePropertyPixelWidth];
    double width = (double)(uint64_t)[v9 integerValue];
    id v11 = [(__CFDictionary *)v8 objectForKeyedSubscript:kCGImagePropertyPixelHeight];
    double height = (double)(uint64_t)[v11 integerValue];

    CFRelease(v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create image source from output data", buf, 2u);
    }
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 scaleFactor:(double)a4 orientation:(int64_t)a5 colorspace:(CGColorSpace *)a6
{
  if (!a3) {
    return 0;
  }
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  uint64_t v13 = IPAOrientationTransformIntegralImageSize();
  unint64_t v15 = v14;
  if (a4 < 1.0)
  {
    v16 = +[IPAImageSizePolicy scalePolicyWithScale:a4];
    objc_msgSend(v16, "transformSize:", (double)(unint64_t)v13, (double)v15);
    uint64_t v13 = llround(v17);
    unint64_t v15 = llround(v18);
  }
  if (!v13 || !v15) {
    return 0;
  }
  double v19 = 1.0;
  if (a4 <= 1.0) {
    double v19 = a4;
  }
  return (CGImage *)objc_msgSend(a1, "newScaledImageForImageRef:inputSize:outputSize:sx:sy:orientation:colorspace:", a3, Width, Height, v13, v15, a5, v19, v19, a6);
}

+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 inputSize:(PFIntSize_st)a4 outputSize:(PFIntSize_st)a5 sx:(double)a6 sy:(double)a7 orientation:(int64_t)a8 colorspace:(CGColorSpace *)space
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  unint64_t v15 = CGBitmapContextCreate(0, a5.var0, a5.var1, 8uLL, (4 * a5.var0 + 15) & 0xFFFFFFFFFFFFFFF0, space, 2u);
  if (v15)
  {
    v16 = v15;
    CGContextSetInterpolationQuality(v15, kCGInterpolationHigh);
    CGContextScaleCTM(v16, a6, a7);
    if (a8 == 1)
    {
      double v17 = (double)var0;
      double v18 = (double)var1;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      *(_OWORD *)buf = 0u;
      double v17 = (double)var0;
      double v18 = (double)var1;
      IPAOrientationMakeTransformWithSize();
      memset(&v21, 0, sizeof(v21));
      CGContextConcatCTM(v16, &v21);
    }
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.double width = v17;
    v25.size.double height = v18;
    CGContextDrawImage(v16, v25, a3);
    Image = CGBitmapContextCreateImage(v16);
    CGContextRelease(v16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create output bitmap context", buf, 2u);
    }
    return 0;
  }
  return Image;
}

+ (id)imageDataForPhotosAdjustmentsComposition:(id)a3 source:(id)a4 exporterImageOptions:(id)a5 outOutputSize:(CGSize *)a6 job:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ([v11 mediaType] == (id)1)
  {
    id v15 = v14;
    *(void *)buf = 0;
    v35 = buf;
    uint64_t v36 = 0x3032000000;
    v37 = sub_10000F0E8;
    v38 = sub_10000F0F8;
    id v39 = 0;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &stru_100041478);
    id v17 = objc_alloc_init((Class)PICompositionExporter);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100014BD4;
    v31[3] = &unk_100041430;
    v33 = buf;
    id v18 = v16;
    id v32 = v18;
    [v17 exportImageToDataWithComposition:v11 options:v13 completion:v31];
    v29 = v17;
    dispatch_block_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    double v19 = (void *)*((void *)v35 + 5);
    id v30 = 0;
    v20 = [v19 result:&v30];
    id v21 = v30;
    if (v20)
    {
      if (a6)
      {
        id v28 = v12;
        v22 = [v20 geometry];
        id v23 = [v22 scaledSize];
        long long v24 = [v20 geometry];
        [v24 scaledSize];
        a6->double width = (double)(uint64_t)v23;
        a6->double height = (double)v25;

        id v12 = v28;
        id v14 = v15;
      }
      v26 = [v20 data];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v40 = 138543362;
        id v41 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to render adjustments to data destination: %{public}@", v40, 0xCu);
      }
      v26 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Multi-output adjustments conversions can only be rendered to URL collections, not data", buf, 2u);
    }
    v26 = 0;
  }

  return v26;
}

+ (id)exporterVideoOptionsForScaleFactor:(double)a3 maximumPixelCount:(int64_t)a4
{
  id v6 = objc_alloc_init((Class)PICompositionExporterVideoOptions);
  if (a4)
  {
    id v7 = [objc_alloc((Class)NUPixelCountScalePolicy) initWithTargetPixelCount:a4];
  }
  else
  {
    if (a3 == 1.0) {
      goto LABEL_6;
    }
    id v8 = objc_alloc((Class)NUFixedScalePolicy);
    uint64_t v9 = NUScaleFromDouble();
    id v7 = objc_msgSend(v8, "initWithScale:", v9, v10);
  }
  id v11 = v7;
  [v6 setScalePolicy:v7];

LABEL_6:
  [v6 setApplyVideoOrientationAsMetadata:1];
  return v6;
}

+ (id)scalePolicyForScaleFactor:(double)a3 maximumPixelCount:(int64_t)a4
{
  if (a4)
  {
    id v4 = [objc_alloc((Class)NUPixelCountScalePolicy) initWithTargetPixelCount:a4];
  }
  else if (a3 == 1.0)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = objc_alloc((Class)NUFixedScalePolicy);
    uint64_t v6 = NUScaleFromDouble();
    id v4 = objc_msgSend(v5, "initWithScale:", v6, v7);
  }
  return v4;
}

+ (id)exporterImageOptionsForScaleFactor:(double)a3 maximumPixelCount:(int64_t)a4 metadataPolicy:(id)a5 shouldApplyOrientationTransform:(BOOL)a6 outputFileType:(id)a7
{
  BOOL v8 = a6;
  id v13 = a5;
  id v14 = a7;
  if (!v14)
  {
    id v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1937, @"Invalid parameter not satisfying: %@", @"outputFileType" object file lineNumber description];
  }
  id v15 = objc_alloc_init((Class)PICompositionExporterImageOptions);
  dispatch_block_t v16 = +[PFUniformTypeUtilities typeWithIdentifier:v14];
  if ([v16 conformsToType:UTTypeJPEG])
  {
    id v17 = objc_alloc_init((Class)NUImageExportFormatJPEG);
    [v17 setCompressionQuality:0.800000012];
LABEL_7:
    [v15 setImageExportFormat:v17];

    id v18 = [a1 scalePolicyForScaleFactor:a4 maximumPixelCount:a3];
    if (v18) {
      [v15 setScalePolicy:v18];
    }
    if (v13)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100015044;
      v22[3] = &unk_100041458;
      id v23 = v13;
      [v15 setMetadataProcessor:v22];
    }
    [v15 setApplyImageOrientationAsMetadata:!v8];
    [v15 setOptimizeForBackgroundProcessing:1];
    [v15 setEnableHDR:1];
    id v19 = v15;

    goto LABEL_15;
  }
  if ([v16 conformsToType:UTTypeHEIC])
  {
    id v17 = objc_alloc_init((Class)NUImageExportFormatHEIF);
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected output file type: %@", buf, 0xCu);
  }
  id v19 = 0;
LABEL_15:

  return v19;
}

+ (void)renderPhotosAdjustmentsComposition:(id)a3 forConversionJob:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v59 = +[NSAssertionHandler currentHandler];
    [v59 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1810, @"Invalid parameter not satisfying: %@", @"job" object file lineNumber description];
  }
  uint64_t v9 = [v8 outputFileType];

  if (!v9)
  {
    v60 = +[NSAssertionHandler currentHandler];
    [v60 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1811, @"Invalid parameter not satisfying: %@", @"job.outputFileType" object file lineNumber description];
  }
  [a1 registerPhotosAdjustmentsSubsystems];
  [v8 scaleFactor];
  double v11 = v10;
  id v12 = [v8 requestedMaximumPixelCount];
  id v13 = [v8 metadataPolicy];
  id v14 = [v8 applySourceOrientationTransform];
  id v15 = [v8 outputFileType];
  dispatch_block_t v16 = [a1 exporterImageOptionsForScaleFactor:v12 maximumPixelCount:v13 metadataPolicy:v14 shouldApplyOrientationTransform:v15 outputFileType:v11];

  if (!v16)
  {
    [v8 setStatus:2];
    NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
    CFStringRef v83 = @"Unable to determine image options";
    id v69 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    id v28 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v69];
    [v8 setError:v28];
    goto LABEL_70;
  }
  id v69 = [objc_alloc((Class)NUPriority) initWithLevel:1];
  objc_msgSend(v16, "setPriority:");
  unint64_t v17 = (unint64_t)[v7 mediaType];
  v70 = +[PIPhotoEditHelper validatedCompositionCopyForComposition:mediaType:](PIPhotoEditHelper, "validatedCompositionCopyForComposition:mediaType:", v7, [v7 mediaType]);

  unint64_t v18 = (unint64_t)[v70 mediaType];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Render photos adjustment composition: input/output media types %ld/%ld", buf, 0x16u);
  }
  BOOL v20 = v17 == 3 && v18 == 2;
  if ((v17 | 2) != 3 || (v17 == v18 ? (char v21 = 1) : (char v21 = v20), (v21 & 1) == 0))
  {
    v22 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1836, @"Unexpected input/output media type combination %ld/%ld", v17, v18);
  }
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, a1);
  id v24 = &_os_log_default;
  os_signpost_id_t spid = v23;
  unint64_t v25 = v23 - 1;
  if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    v26 = [v8 requestIdentifier];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v26;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_BEGIN, spid, "com.apple.photos.mediaconversion.service.neutrino", "Media conversion request %{public}@", buf, 0xCu);
  }
  v27 = [v8 destinationResourceURLCollection];
  id v28 = v27;
  if (v27)
  {
    v68 = [v27 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];
    if (!v68)
    {
      v61 = +[NSAssertionHandler currentHandler];
      [v61 handleFailureInMethod:a2 object:a1 file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1845 description:@"Missing destination image URL"];
    }
    if ((v18 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v67 = [v28 resourceURLForRole:@"PAMediaConversionResourceRoleVideoComplement"];
      if (v67) {
        BOOL v29 = 0;
      }
      else {
        BOOL v29 = v20;
      }
      if (!v29)
      {
LABEL_33:
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v79 = sub_10000F0E8;
        v80 = sub_10000F0F8;
        id v81 = 0;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_100015BA4;
        v73[3] = &unk_100041430;
        v75 = buf;
        dispatch_block_t block = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &stru_100041408);
        id v74 = block;
        v65 = objc_retainBlock(v73);
        id v66 = objc_alloc_init((Class)PICompositionExporter);
        if (v18 == 3)
        {
          v31 = objc_opt_new();
          [v31 setPrimaryURL:v68];
          [v31 setVideoComplementURL:v67];
          [v31 setPriority:v69];
          [v31 setOptimizeForBackgroundProcessing:1];
          objc_msgSend(v31, "setApplyImageOrientationAsMetadata:", objc_msgSend(v8, "applySourceOrientationTransform") ^ 1);
          [v31 setApplyVideoOrientationAsMetadata:1];
          [v8 scaleFactor];
          v33 = objc_msgSend(a1, "scalePolicyForScaleFactor:maximumPixelCount:", objc_msgSend(v8, "requestedMaximumPixelCount"), v32);
          if (v33) {
            [v31 setScalePolicy:v33];
          }
          v34 = dispatch_get_global_queue(0, 0);
          id v35 = [v66 exportComposition:v70 options:v31 completionQueue:v34 completion:v65];
        }
        else
        {
          if (!v20)
          {
            [v66 exportImageToURL:v68 composition:v70 options:v16 completion:v65];
LABEL_44:
            dispatch_block_wait(block, 0xFFFFFFFFFFFFFFFFLL);
            id v39 = &_os_log_default;
            if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
            {
              *(_WORD *)v76 = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_BEGIN, spid, "com.apple.photos.mediaconversion.service.neutrino.postprocessing", (const char *)&unk_10003D619, v76, 2u);
            }

            v40 = *(void **)(*(void *)&buf[8] + 40);
            id v72 = 0;
            id v41 = [v40 result:&v72];
            id v42 = v72;
            if (v41)
            {
              if (v20)
              {
                v43 = [v41 geometry];
                id v44 = [v43 scaledSize];
                uint64_t v45 = [v41 geometry];
                [(id)v45 scaledSize];
                uint64_t v62 = v46;

                v47 = [v8 outputFileType];
                double width = CGSizeZero.width;
                double height = CGSizeZero.height;
                id v71 = v42;
                LOBYTE(v45) = +[PAMediaConversionServiceImagingUtilities generatePosterFrameExportForVideoURL:destinationURL:maximumSize:outputFileType:error:](PAMediaConversionServiceImagingUtilities, "generatePosterFrameExportForVideoURL:destinationURL:maximumSize:outputFileType:error:", v67, v68, v47, &v71, CGSizeZero.width, height);
                id v50 = v71;

                if (v45)
                {
                  double width = (double)(uint64_t)v44;
                  double height = (double)v62;
                  uint64_t v51 = 1;
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v76 = 138543362;
                    id v77 = v50;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to render separate still image output for live photo -> video transformation: %{public}@", v76, 0xCu);
                  }
                  uint64_t v51 = 2;
                }
                id v42 = v50;
              }
              else
              {
                v52 = [v41 geometry];
                id v53 = [v52 scaledSize];
                v54 = [v41 geometry];
                [v54 scaledSize];
                uint64_t v56 = v55;

                double width = (double)(uint64_t)v53;
                double height = (double)v56;
                uint64_t v51 = 1;
              }
              [v8 setStatus:v51];
              objc_msgSend(v8, "setOutputImageSize:", width, height);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v76 = 138543362;
                id v77 = v42;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to render adjustments to URL destination: %{public}@", v76, 0xCu);
              }
              [v8 setStatus:2];
              [v8 setError:v42];
            }
            id v57 = &_os_log_default;
            if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
            {
              *(_WORD *)v76 = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_END, spid, "com.apple.photos.mediaconversion.service.neutrino.postprocessing", (const char *)&unk_10003D619, v76, 2u);
            }

            _Block_object_dispose(buf, 8);
            goto LABEL_66;
          }
          [v8 scaleFactor];
          v31 = objc_msgSend(a1, "exporterVideoOptionsForScaleFactor:maximumPixelCount:", objc_msgSend(v8, "requestedMaximumPixelCount"), v37);
          id v38 = [v66 exportVideoToURL:v67 composition:v70 options:v31 completion:v65];
        }

        goto LABEL_44;
      }
      id v30 = +[NSAssertionHandler currentHandler];
      [v30 handleFailureInMethod:a2 object:a1 file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1851 description:@"Live Photo conversion producing video output must provide image and video output URLs"];
    }
    v67 = 0;
    goto LABEL_33;
  }
  v68 = [v70 objectForKeyedSubscript:@"source"];
  *(CGSize *)buf = CGSizeZero;
  uint64_t v36 = [a1 imageDataForPhotosAdjustmentsComposition:v70 source:v68 exporterImageOptions:v16 outOutputSize:buf job:v8];
  if (v36)
  {
    [v8 setStatus:1];
    [v8 setDestinationData:v36];
    objc_msgSend(v8, "setOutputImageSize:", *(double *)buf, *(double *)&buf[8]);
  }
  else
  {
    [v8 setStatus:2];
  }

LABEL_66:
  id v58 = &_os_log_default;
  if (v25 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_END, spid, "com.apple.photos.mediaconversion.service.neutrino", (const char *)&unk_10003D619, buf, 2u);
  }

  id v7 = v70;
LABEL_70:
}

+ (void)configureSourcesForComposition:(id)a3 fromPhotosAdjustmentsJob:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 sourceResourceURLCollection];
  id v8 = [v7 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"];
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      dispatch_block_t v16 = [v7 logMessageSummary];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v23 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to determine type identifier of main resource: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  v21[0] = @"PAMediaConversionResourceRoleMainResource";
  v21[1] = @"PAMediaConversionResourceRoleVideoComplement";
  uint64_t v9 = +[NSArray arrayWithObjects:v21 count:2];
  unsigned int v10 = [v7 containsAllRoles:v9];

  if (v10)
  {
    double v11 = [v6 mainSourceResourceURL];
    id v12 = +[PIPhotoEditHelper imageSourceWithURL:v11 type:v8 useEmbeddedPreview:0];

    id v13 = [v7 resourceURLForRole:@"PAMediaConversionResourceRoleVideoComplement"];
    id v14 = +[PIPhotoEditHelper videoSourceWithURL:v13];

    id v15 = +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:v12 videoSource:v14];
  }
  else
  {
    CFStringRef v20 = @"PAMediaConversionResourceRoleMainResource";
    unint64_t v17 = +[NSArray arrayWithObjects:&v20 count:1];
    unsigned int v18 = [v7 containsAllRoles:v17];

    if (!v18) {
      goto LABEL_13;
    }
    id v12 = [v6 mainSourceResourceURL];
    id v15 = +[PIPhotoEditHelper imageSourceWithURL:v12 type:v8 useEmbeddedPreview:0];
  }

  if (!v15)
  {
LABEL_13:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to determine photos adjustments request main source configuration", buf, 2u);
    }
LABEL_15:
    [v6 setStatus:2];
    goto LABEL_16;
  }
  [v5 setObject:v15 forKeyedSubscript:@"source"];
  if ([v6 hasLivePhotoSourceURLs]) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 1;
  }
  [v5 setMediaType:v19];

LABEL_16:
}

+ (id)loadCompositionFrom:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 secondaryDataURL:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!a7)
  {
    id v53 = +[NSAssertionHandler currentHandler];
    [v53 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1703, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  if ((+[PIPhotoEditHelper canInterpretDataWithFormatIdentifier:v14 formatVersion:v15] & 1) == 0)
  {
    id v48 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v79 = NSLocalizedFailureReasonErrorKey;
    v49 = +[NSString stringWithFormat:@"Cannot interpret data with identifier (%@) and format version (%@)", v14, v15];
    v80 = v49;
    id v50 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    *a7 = [v48 initWithDomain:@"PICompositionSerializerDomain" code:0 userInfo:v50];

LABEL_29:
    v47 = 0;
    goto LABEL_30;
  }
  if (([v14 isEqualToString:PIPhotoEditFormatIdentifierVideoSloMo] & 1) != 0
    || [v14 isEqualToString:PIPhotoEditFormatIdentifierVideo])
  {
    id v56 = v16;
    unint64_t v17 = objc_opt_new();
    id v58 = v13;
    id v59 = v14;
    id v57 = v15;
    uint64_t v55 = a7;
    +[IPASerializationManager deserialize:v13 originator:IPAAdjustmentOriginator_Unknown format:v14 formatVersion:v15 error:a7];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v54 = long long v67 = 0u;
    unsigned int v18 = [v54 adjustmentStack];
    uint64_t v19 = [v18 adjustments];

    CFStringRef v20 = v19;
    id v21 = [v19 countByEnumeratingWithState:&v64 objects:v78 count:16];
    if (!v21) {
      goto LABEL_27;
    }
    id v22 = v21;
    uint64_t v23 = *(void *)v65;
    uint64_t v24 = IPAPhotoAdjustment_SloMo_Identifier;
    uint64_t v62 = IPAPhotoAdjustment_PosterFrame_Identifier;
    uint64_t v63 = IPAVideoAdjustment_Trim_Identifier;
    uint64_t v60 = IPAVideoAdjustment_PosterFrame_Key_Time_Legacy;
    uint64_t v61 = IPAPhotoAdjustment_PosterFrame_Key_Time;
    while (1)
    {
      unint64_t v25 = 0;
      do
      {
        if (*(void *)v65 != v23) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v25);
        v27 = [v26 identifier];
        unsigned int v28 = [v27 isEqualToString:v24];

        if (v28)
        {
          BOOL v29 = objc_opt_new();
          [v29 setObject:@"SlowMotion" forKeyedSubscript:@"identifier"];
LABEL_15:
          v33 = [v26 settings];
          [v29 setObject:v33 forKeyedSubscript:@"settings"];

          [v29 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enabled"];
          [v17 addObject:v29];

          goto LABEL_16;
        }
        id v30 = [v26 identifier];
        unsigned int v31 = [v30 isEqualToString:v63];

        if (v31)
        {
          BOOL v29 = objc_opt_new();
          double v32 = [v26 identifier];
          [v29 setObject:v32 forKeyedSubscript:@"identifier"];

          goto LABEL_15;
        }
        v34 = [v26 identifier];
        unsigned int v35 = [v34 isEqualToString:v62];

        if (v35)
        {
          uint64_t v36 = v20;
          double v37 = [v26 settings];
          uint64_t v38 = [v37 objectForKeyedSubscript:v61];
          if (v38)
          {
            id v39 = (void *)v38;

LABEL_22:
            id v41 = objc_opt_new();
            [v41 setObject:@"VideoPosterFrame" forKeyedSubscript:@"identifier"];
            CFStringRef v76 = @"time";
            id v77 = v39;
            id v42 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
            [v41 setObject:v42 forKeyedSubscript:@"settings"];

            [v41 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enabled"];
            [v17 addObject:v41];

LABEL_23:
            CFStringRef v20 = v36;
            goto LABEL_16;
          }
          v40 = [v26 settings];
          id v39 = [v40 objectForKeyedSubscript:v60];

          if (v39) {
            goto LABEL_22;
          }
          CFStringRef v20 = v36;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            v43 = [v26 identifier];
            id v44 = [v26 version];
            uint64_t v45 = [v26 settings];
            *(_DWORD *)buf = 138413058;
            id v69 = v59;
            __int16 v70 = 2112;
            id v71 = v43;
            __int16 v72 = 2112;
            v73 = v44;
            __int16 v74 = 2112;
            v75 = v45;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PosterFrame adjustment has unexpected format, will not migrate: %@, %@, %@, %@", buf, 0x2Au);

            goto LABEL_23;
          }
        }
LABEL_16:
        unint64_t v25 = (char *)v25 + 1;
      }
      while (v22 != v25);
      id v46 = [v20 countByEnumeratingWithState:&v64 objects:v78 count:16];
      id v22 = v46;
      if (!v46)
      {
LABEL_27:

        id v14 = v59;
        id v15 = v57;
        v47 = +[PICompositionSerializer deserializeCompositionFromAdjustments:v17 metadata:&__NSDictionary0__struct formatIdentifier:v59 formatVersion:v57 error:v55];

        id v13 = v58;
        id v16 = v56;
        goto LABEL_30;
      }
    }
  }
  if (v16)
  {
    v52 = +[PICompositionSidecarData loadFromURL:v16 error:a7];
    if (!v52) {
      goto LABEL_29;
    }
  }
  else
  {
    v52 = 0;
  }
  v47 = +[PICompositionSerializer deserializeCompositionFromData:v13 formatIdentifier:v14 formatVersion:v15 sidecarData:v52 error:a7];

LABEL_30:
  return v47;
}

+ (id)compositionForPhotosAdjustmentInformation:(id)a3 error:(id *)a4
{
  return [a1 compositionForPhotosAdjustmentInformation:a3 secondaryDataURL:0 error:a4];
}

+ (id)compositionForConversionJob:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1682, @"Invalid parameter not satisfying: %@", @"job != nil" object file lineNumber description];
  }
  id v8 = [v7 adjustmentInformation];
  uint64_t v9 = [v7 adjustmentSidecarDataResourceURL];
  unsigned int v10 = [a1 compositionForPhotosAdjustmentInformation:v8 secondaryDataURL:v9 error:a4];

  return v10;
}

+ (id)compositionForPhotosAdjustmentInformation:(id)a3 secondaryDataURL:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  double v11 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentDataKey"];
  if (!v11)
  {
    unint64_t v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1663, @"Invalid parameter not satisfying: %@", @"adjustmentData" object file lineNumber description];
  }
  id v12 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatIdentifierKey"];
  if (!v12)
  {
    unsigned int v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1665, @"Invalid parameter not satisfying: %@", @"formatIdentifier" object file lineNumber description];
  }
  id v13 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatVersionKey"];
  if (!v13)
  {
    uint64_t v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1667, @"Invalid parameter not satisfying: %@", @"formatVersion" object file lineNumber description];
  }
  id v20 = 0;
  id v14 = [a1 loadCompositionFrom:v11 formatIdentifier:v12 formatVersion:v13 secondaryDataURL:v10 error:&v20];
  id v15 = v20;
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138543362;
    id v22 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create photos adjustment composition: %{public}@", buf, 0xCu);
    if (a5) {
LABEL_10:
    }
      *a5 = v15;
  }
LABEL_11:

  return v14;
}

+ (id)adjustmentInformationForComposition:(id)a3 error:(id *)a4
{
  id v4 = +[PICompositionSerializer adjustmentInformationForComposition:a3 error:a4];
  id v5 = [v4 mutableCopy];

  id v6 = [v5 objectForKeyedSubscript:PIAssetAdjustmentsDataBlobKey];
  [v5 setObject:v6 forKeyedSubscript:@"PAMediaConversionServiceAdjustmentDataKey"];

  id v7 = [v5 objectForKeyedSubscript:PIAssetAdjustmentsFormatIdentifierKey];
  [v5 setObject:v7 forKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatIdentifierKey"];

  id v8 = [v5 objectForKeyedSubscript:PIAssetAdjustmentsFormatVersionKey];
  [v5 setObject:v8 forKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatVersionKey"];

  return v5;
}

+ (id)generatePortraitAdjustmentForURL:(id)a3 contentType:(id)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  id v53 = a3;
  id v54 = a4;
  uint64_t v55 = +[PISchema registeredPhotosSchemaIdentifier];
  id v8 = [objc_alloc((Class)NUGenericComposition) initWithIdentifier:v55];
  id v9 = [v54 identifier];
  id v10 = +[PIPhotoEditHelper imageSourceWithURL:v53 type:v9 useEmbeddedPreview:0];
  [v8 setObject:v10 forKeyedSubscript:@"source"];

  [v8 setMediaType:1];
  id v11 = objc_alloc((Class)NUGenericAdjustment);
  id v12 = [objc_alloc((Class)NUIdentifier) initWithName:@"Orientation"];
  id v52 = [v11 initWithIdentifier:v12];

  id v13 = +[NSNumber numberWithUnsignedInt:v6];
  [v52 setObject:v13 forKeyedSubscript:@"value"];

  [v8 setObject:v52 forKeyedSubscript:@"orientation"];
  id v14 = [objc_alloc((Class)PIPortraitAutoCalculator) initWithComposition:v8];
  id v15 = [objc_alloc((Class)NUPriority) initWithLevel:1];
  [v14 setPriority:v15];

  uint64_t v74 = 0;
  v75 = (id *)&v74;
  uint64_t v76 = 0x3032000000;
  id v77 = sub_10000F0E8;
  v78 = sub_10000F0F8;
  id v79 = 0;
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  id v71 = sub_10000F0E8;
  __int16 v72 = sub_10000F0F8;
  id v73 = 0;
  id v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100017128;
  v64[3] = &unk_100041398;
  long long v66 = &v68;
  long long v67 = &v74;
  unint64_t v17 = v16;
  long long v65 = v17;
  [v14 submit:v64];
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  unsigned int v18 = (void *)v69[5];
  id v48 = v14;
  if (v18)
  {
    id v19 = v18;
    id v20 = [objc_alloc((Class)PICompositionController) initWithComposition:v8];
    v49 = [v19 objectForKeyedSubscript:PIDepthInfoKey];
    id v50 = [v19 objectForKeyedSubscript:PIPortraitInfoKey];
    id v21 = [v19 objectForKeyedSubscript:PIPortraitStrengthKey];
    [v21 floatValue];
    int v23 = v22;

    uint64_t v24 = [v20 portraitAdjustmentController];
    unint64_t v25 = [v24 portraitInfo];
    id v46 = v24;
    if (v25) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = v50 == 0;
    }
    int v27 = !v26;

    if (v27)
    {
      uint64_t v28 = PIPortraitAdjustmentKey;
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_1000171A4;
      v61[3] = &unk_1000413C0;
      id v62 = v50;
      int v63 = v23;
      [v20 modifyAdjustmentWithKey:v28 modificationBlock:v61];
    }
    BOOL v29 = [v19 objectForKeyedSubscript:PIDepthApertureKey];
    [v29 floatValue];
    int v31 = v30;

    v47 = [v19 objectForKeyedSubscript:PIDepthFocusRectKey];
    double v32 = [v20 depthAdjustmentController];
    v33 = [v32 depthInfo];
    if (v33) {
      BOOL v34 = 1;
    }
    else {
      BOOL v34 = v49 == 0;
    }
    int v35 = !v34;

    if (v35)
    {
      uint64_t v36 = [v20 adjustmentConstants];
      double v37 = [v36 PIDepthAdjustmentKey];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100017210;
      v57[3] = &unk_1000413E8;
      id v58 = v49;
      int v60 = v31;
      id v59 = v47;
      [v20 modifyAdjustmentWithKey:v37 modificationBlock:v57];
    }
    uint64_t v38 = [v20 composition];
    id v39 = v75;
    id obj = 0;
    v40 = +[PICompositionSerializer adjustmentInformationForComposition:v38 error:&obj];
    objc_storeStrong(v39 + 5, obj);

    if (v40)
    {
      v80[0] = @"PAMediaConversionServiceAdjustmentDataKey";
      id v41 = [v40 objectForKeyedSubscript:PIAssetAdjustmentsDataBlobKey];
      v81[0] = v41;
      v80[1] = @"PAMediaConversionServiceAdjustmentFormatIdentifierKey";
      id v42 = [v40 objectForKeyedSubscript:PIAssetAdjustmentsFormatIdentifierKey];
      v81[1] = v42;
      v80[2] = @"PAMediaConversionServiceAdjustmentFormatVersionKey";
      v43 = [v40 objectForKeyedSubscript:PIAssetAdjustmentsFormatVersionKey];
      v81[2] = v43;
      id v44 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:3];
    }
    else
    {
      id v44 = 0;
    }
  }
  else
  {
    id v44 = 0;
  }
  if (a6) {
    *a6 = v75[5];
  }

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  return v44;
}

+ (id)emptyGenericCompositionWithAdjustmentForOrientation:(int64_t)a3
{
  if ((IPAOrientationIsValid() & 1) == 0)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1581, @"Invalid parameter not satisfying: %@", @"IPAOrientationIsValid(orientation)" object file lineNumber description];
  }
  uint64_t v6 = +[PISchema registeredPhotosSchemaIdentifier];
  id v7 = [objc_alloc((Class)NUGenericComposition) initWithIdentifier:v6];
  id v8 = objc_alloc((Class)NUGenericAdjustment);
  id v9 = [objc_alloc((Class)NUIdentifier) initWithName:@"Orientation"];
  id v10 = [v8 initWithIdentifier:v9];

  id v11 = +[NSNumber numberWithInteger:a3];
  [v10 setObject:v11 forKeyedSubscript:@"value"];

  [v7 setObject:v10 forKeyedSubscript:@"orientation"];
  return v7;
}

+ (void)registerPhotosAdjustmentsSubsystems
{
  id v2 = +[PISchema registeredPhotosSchemaIdentifier];
}

+ (BOOL)isOutputCorruptionLikelyUsingSSIMOfInputURL:(id)a3 toOutputURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[CIImage imageWithContentsOfURL:v5 options:0];
  id v8 = +[CIImage imageWithContentsOfURL:v6 options:0];
  PFImageMetricComputeSSIMForCIImage();
  if (NAN >= 94.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v9 = [v5 path];
      id v10 = [v6 path];
      *(_DWORD *)buf = 134218754;
      uint64_t v13 = 0x7FF8000000000000;
      __int16 v14 = 2048;
      uint64_t v15 = 0x4057800000000000;
      __int16 v16 = 2112;
      unint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "SSIM %f >= %f for conversion of %@ to %@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v13 = 0x7FF8000000000000;
    __int16 v14 = 2048;
    uint64_t v15 = 0x4057800000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Conversion output corruption likely based on SSIM: %f < %f", buf, 0x16u);
  }

  return NAN < 94.0;
}

+ (BOOL)isOutputCorruptionLikelyComparingFileSizeOfInputURL:(id)a3 toOutputURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v37[0] = NSURLFileSizeKey;
  v37[1] = NSURLTypeIdentifierKey;
  id v7 = +[NSArray arrayWithObjects:v37 count:2];
  [v5 removeCachedResourceValueForKey:NSURLFileSizeKey];
  id v28 = 0;
  id v8 = [v5 resourceValuesForKeys:v7 error:&v28];
  id v9 = v28;
  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:NSURLFileSizeKey];
    unint64_t v25 = [v10 unsignedLongLongValue];

    id v11 = [v8 objectForKeyedSubscript:NSURLTypeIdentifierKey];
    id v12 = +[PFUniformTypeUtilities typeWithIdentifier:v11];

    [v6 removeCachedResourceValueForKey:NSURLFileSizeKey];
    id v27 = v9;
    uint64_t v13 = [v6 resourceValuesForKeys:v7 error:&v27];
    id v26 = v27;

    if (!v13)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v6 path];
        *(_DWORD *)buf = 138412546;
        double v30 = *(double *)&v24;
        __int16 v31 = 2112;
        id v9 = v26;
        uint64_t v32 = (uint64_t)v26;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to read output image file attributes for %@: %@", buf, 0x16u);

        BOOL v19 = 0;
        goto LABEL_21;
      }
      BOOL v19 = 0;
LABEL_20:
      id v9 = v26;
LABEL_21:

      goto LABEL_22;
    }
    __int16 v14 = [v13 objectForKeyedSubscript:NSURLFileSizeKey];
    uint64_t v15 = [v14 unsignedLongLongValue];

    __int16 v16 = [v13 objectForKeyedSubscript:NSURLTypeIdentifierKey];
    unint64_t v17 = +[PFUniformTypeUtilities typeWithIdentifier:v16];

    if ([v12 isEqual:v17])
    {
      double v18 = (double)(v15 - v25) / (double)(unint64_t)v25 * 100.0;
      if (fabs(v18) > 10.0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218752;
          double v30 = (double)(v15 - v25) / (double)(unint64_t)v25 * 100.0;
          __int16 v31 = 2048;
          uint64_t v32 = 0x4024000000000000;
          __int16 v33 = 2048;
          BOOL v34 = v25;
          __int16 v35 = 2048;
          uint64_t v36 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Conversion output corruption possible based on input/output file size comparison: abs(%f) > %f, %llu/%llu", buf, 0x2Au);
        }
        BOOL v19 = 1;
        goto LABEL_19;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        id v20 = [v5 path];
        id v21 = [v6 path];
        *(_DWORD *)buf = 134218754;
        double v30 = v18;
        __int16 v31 = 2048;
        uint64_t v32 = 0x4024000000000000;
        __int16 v33 = 2112;
        BOOL v34 = v20;
        __int16 v35 = 2112;
        uint64_t v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "File size percentage change abs(%f) < %f for conversion of %@ to %@", buf, 0x2Au);
        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v5 path];
      id v21 = [v6 path];
      *(_DWORD *)buf = 138413058;
      double v30 = *(double *)&v20;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v12;
      __int16 v33 = 2112;
      BOOL v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to check for output corruption based on file size because the file types are different: %@ (%@) / %@ (%@)", buf, 0x2Au);
LABEL_17:

      BOOL v19 = 0;
LABEL_19:

      goto LABEL_20;
    }
    BOOL v19 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v23 = [v5 path];
    *(_DWORD *)buf = 138412546;
    double v30 = *(double *)&v23;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v9;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to read input image file attributes for %@: %@", buf, 0x16u);
  }
  BOOL v19 = 0;
LABEL_22:

  return v19;
}

+ (void)checkConversionResultForOutputCorruptionAndMarkJobAsFailed:(id)a3
{
  id v5 = a3;
  id v6 = [v5 mainSourceResourceURL];
  if (v6)
  {
    id v7 = [v5 destinationResourceURLCollection];
    id v8 = [v7 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];

    if (!v8)
    {
      uint64_t v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1467, @"Unexpected nil output url: %@/%@", v6, 0 object file lineNumber description];
    }
    unsigned int v9 = [a1 isOutputCorruptionLikelyComparingFileSizeOfInputURL:v6 toOutputURL:v8];
    id v10 = +[NSUserDefaults standardUserDefaults];
    id v11 = [v10 objectForKey:@"MediaConversionServiceUseSSIMOutputCorruptionCheck"];

    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_9;
    }
    unsigned int v12 = [v11 BOOLValue];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)unint64_t v17 = 0;
      *(_WORD *)&void v17[4] = 1024;
      *(_DWORD *)&v17[6] = v12;
      *(_WORD *)double v18 = 2112;
      *(void *)&void v18[2] = @"MediaConversionServiceUseSSIMOutputCorruptionCheck";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Overriding enabled state of output corruption SSIM check from %d to %d because %@ user default key is set", buf, 0x18u);
    }
    if (v12)
    {
      unsigned int v13 = [a1 isOutputCorruptionLikelyUsingSSIMOfInputURL:v6 toOutputURL:v8];
      unsigned int v14 = v13;
    }
    else
    {
LABEL_9:
      unsigned int v14 = 0;
      unsigned int v13 = v9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)unint64_t v17 = v14;
      *(_WORD *)&void v17[4] = 1024;
      *(_DWORD *)&v17[6] = v9;
      *(_WORD *)double v18 = 1024;
      *(_DWORD *)&void v18[2] = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Output corruption checks: %d/%d (%d)", buf, 0x14u);
    }
    if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)unint64_t v17 = v6;
      *(_WORD *)&v17[8] = 2112;
      *(void *)double v18 = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Possible conversion output corruption detected for %@/%@", buf, 0x16u);
    }
  }
}

+ (void)executeConversionJob:(id)a3
{
  id v5 = a3;
  id v6 = [v5 sourceResourceURLCollection];

  if (!v6)
  {
    uint64_t v70 = +[NSAssertionHandler currentHandler];
    [v70 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1276, @"Invalid parameter not satisfying: %@", @"job.sourceResourceURLCollection" object file lineNumber description];
  }
  if ([v5 validateSourceAndOptions])
  {
    if ([v5 isRAWSourceUTI]
      && ([v5 sourceImageSize],
          uint64_t v9 = (uint64_t)(v7 * v8),
          id v10 = +[PFMediaUtilities rawSourceMaximumPixelCountForBackgroundProcessing], (uint64_t)v10 < v9))
    {
      id v11 = v10;
      int v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)uint64_t v76 = v9;
        *(_WORD *)&v76[8] = 2048;
        *(void *)&v76[10] = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to process full size RAW source with pixel count %zd (exceeds limit of %zd), falling back to embedded preview", buf, 0x16u);
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 1;
    }
    unsigned int v13 = [v5 destinationImageProperties];
    if ([v5 sourceRequiresRasterization])
    {
      unsigned int v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 rasterizationDPI]);
      [v13 setObject:v14 forKeyedSubscript:kCGImageSourceRasterizationDPI];
    }
    if ([v5 colorspaceMode] == (id)2)
    {
      CFStringRef v15 = (const __CFString *)&__kCFBooleanTrue;
    }
    else
    {
      if ([v5 colorspaceMode])
      {
LABEL_17:
        id v16 = [v5 orientationTransformBehavior];
        if (([v5 formatConversionOnly] & 1) != 0 || v16 != (id)2) {
          unsigned int v17 = [v5 sourceRequiresRasterization];
        }
        else {
          unsigned int v17 = 1;
        }
        unsigned int v18 = [v5 hasPhotosAdjustments];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          BOOL v19 = [v5 sourceUTI];
          [v5 sourceImageSize];
          int v21 = (int)v20;
          [v5 sourceImageSize];
          *(_DWORD *)buf = 67110914;
          *(_DWORD *)uint64_t v76 = v18;
          *(_WORD *)&uint8_t v76[4] = 2048;
          *(void *)&v76[6] = v16;
          *(_WORD *)&v76[14] = 1024;
          *(_DWORD *)&v76[16] = v18;
          __int16 v77 = 1024;
          unsigned int v78 = v17;
          __int16 v79 = 2114;
          v80 = v19;
          __int16 v81 = 1024;
          int v82 = v12;
          __int16 v83 = 1024;
          int v84 = v21;
          __int16 v85 = 1024;
          int v86 = (int)v22;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Image conversion: requiresCustomOrientationTransform %d, orientationBehavior %lu, requiresPhotosAdjustmentRendering %d, requiresDrawing %d, source UTI %{public}@, canProcessFullSizeRaw %d, inputImageSize %dx%d", buf, 0x3Au);
        }
        if (v18)
        {
          os_signpost_id_t v23 = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, v5);
          id v24 = &_os_log_default;
          if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
          {
            unint64_t v25 = [v5 requestIdentifier];
            *(_DWORD *)buf = 138543362;
            *(void *)uint64_t v76 = v25;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_BEGIN, v23, "com.apple.photos.mediaconversion.service.adjusted", "Media conversion request %{public}@", buf, 0xCu);
          }
          [a1 registerPhotosAdjustmentsSubsystems];
          if ([v5 hasPhotosAdjustments])
          {
            id v72 = 0;
            id v26 = [a1 compositionForConversionJob:v5 error:&v72];
            id v27 = v72;
            if (v26)
            {
              id v28 = [v26 objectForKeyedSubscript:@"orientation"];

              if (!v28)
              {
                id v29 = objc_alloc((Class)NUGenericAdjustment);
                id v30 = [objc_alloc((Class)NUIdentifier) initWithName:@"Orientation"];
                id v31 = [v29 initWithIdentifier:v30];

                uint64_t v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 sourceOrientation]);
                [v31 setObject:v32 forKeyedSubscript:@"value"];

                [v26 setObject:v31 forKeyedSubscript:@"orientation"];
              }

              [a1 configureSourcesForComposition:v26 fromPhotosAdjustmentsJob:v5];
              [a1 renderPhotosAdjustmentsComposition:v26 forConversionJob:v5];
              if ([v5 shouldCheckForOutputCorruption]) {
                [a1 checkConversionResultForOutputCorruptionAndMarkJobAsFailed:v5];
              }
              id v33 = &_os_log_default;
              if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_END, v23, "com.apple.photos.mediaconversion.service.adjusted", (const char *)&unk_10003D619, buf, 2u);
              }

              goto LABEL_62;
            }
            [v5 setStatus:2];
            [v5 setError:v27];
          }
          else
          {
            v43 = +[NSAssertionHandler currentHandler];
            [v43 handleFailureInMethod:a2 object:a1 file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1347 description:@"Unknown photos adjustments rendering request"];

            [v5 setStatus:2];
          }
LABEL_63:

          goto LABEL_64;
        }
        BOOL v34 = (CGImageSource *)[v5 imageSource];
        __int16 v35 = (CGImageDestination *)[v5 imageDestination];
        uint64_t v36 = [v5 sourceUTI];
        id v26 = +[PFUniformTypeUtilities typeWithIdentifier:v36];

        if (v17)
        {
          double v37 = (CGImage *)[v5 sourceImageRef];
          if (!v37) {
            goto LABEL_60;
          }
          uint64_t v38 = v37;
          CGColorSpaceRef v39 = sub_1000189C0(v37, v26, (uint64_t)[v5 colorspaceMode]);
          [v5 scaleFactor];
          id v41 = (CGImage *)objc_msgSend(a1, "newScaledImageForImageRef:scaleFactor:orientation:colorspace:", v38, objc_msgSend(v5, "orientation"), v39, v40);
          if (!v41)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              uint64_t v51 = [v5 sourceResourceURLCollection];
              id v52 = [v51 logMessageSummary];
              *(_DWORD *)buf = 138412290;
              *(void *)uint64_t v76 = v52;
              id v53 = "Unable to create output image for %@";
              goto LABEL_75;
            }
LABEL_60:
            uint64_t v50 = 2;
            goto LABEL_61;
          }
          id v42 = v41;
          CGImageDestinationAddImage(v35, v41, (CFDictionaryRef)v13);
          CGImageRelease(v42);
LABEL_55:
          if (CGImageDestinationFinalize(v35))
          {
            id v48 = [v5 imageDestinationData];
            [v5 setDestinationData:v48];

            v49 = [v5 imageDestinationData];
            +[PAMediaConversionServiceSharedUtilitiesServiceSide imageSizeForImageData:v49];
            objc_msgSend(v5, "setOutputImageSize:");

            uint64_t v50 = 1;
LABEL_61:
            [v5 setStatus:v50];
LABEL_62:

            goto LABEL_63;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            uint64_t v51 = [v5 sourceResourceURLCollection];
            id v52 = [v51 logMessageSummary];
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v76 = v52;
            id v53 = "Unable to finalize output image for image conversion of %@";
LABEL_75:
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v53, buf, 0xCu);

            goto LABEL_60;
          }
          goto LABEL_60;
        }
        if (v12
          && (([v5 isRAWSourceUTI] & 1) != 0
           || [v26 isEqual:UTTypeTIFF])
          && ([v5 shouldUseEmbeddedImageAsSource] & 1) == 0)
        {
          v73[0] = kCIContextCacheIntermediates;
          v73[1] = kCIContextName;
          v74[0] = &__kCFBooleanFalse;
          v74[1] = @"PAMediaConversionSeriveSharedUtilitiesServerSide-executeConversionJob";
          v73[2] = kCIContextIntermediateMemoryTarget;
          v74[2] = &off_100043E88;
          id v54 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];
          uint64_t v55 = +[CIContext contextWithOptions:v54];

          id v56 = +[NSMutableDictionary dictionary];
          [v5 scaleFactor];
          if (v57 != 1.0)
          {
            [v5 scaleFactor];
            id v58 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v56 setObject:v58 forKeyedSubscript:kCIInputScaleFactorKey];
          }
          id v59 = [v5 mainSourceResourceURL];
          int v60 = +[CIFilter filterWithImageURL:v59 options:v56];

          uint64_t v61 = [v60 outputImage];
          CGColorSpaceRef v62 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
          int v63 = (CGColorSpace *)CFAutorelease(v62);
          [v61 extent];
          uint64_t v68 = (CGImage *)objc_msgSend(v55, "createCGImage:fromRect:format:colorSpace:deferred:", v61, kCIFormatRGBA8, sub_100018A84((uint64_t)objc_msgSend(v5, "colorspaceMode"), v63), 1, v64, v65, v66, v67);
          if (v68)
          {
            [v13 setObject:&off_100043EA0 forKeyedSubscript:kCGImagePropertyOrientation];
            [v13 removeObjectForKey:kCGImageDestinationOptimizeColorForSharing];
            CGImageDestinationAddImage(v35, v68, (CFDictionaryRef)v13);
            CFRelease(v68);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              id v71 = [v5 sourceResourceURLCollection];
              id v69 = [v71 logMessageSummary];
              *(_DWORD *)buf = 138412290;
              *(void *)uint64_t v76 = v69;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to generate image using CIRawFilter for %@", buf, 0xCu);
            }
            [v5 setStatus:2];
          }

          if (!v68) {
            goto LABEL_62;
          }
          goto LABEL_55;
        }
        [v5 scaleFactor];
        if (v44 != 1.0)
        {
          uint64_t v45 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 requestedOrCalculatedMaximumLongSideLength]);
          [v13 setObject:v45 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];
        }
        [v13 setObject:kCGImageSourceDecodeToSDR forKeyedSubscript:kCGImageSourceDecodeRequest];
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationCreateHDRGainMap];
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationPreserveGainMap];
        [v13 setObject:&off_100043EE8 forKeyedSubscript:kCGImageDestinationLossyCompressionQuality];
        if (v16)
        {
          if (v16 == (id)1)
          {
            [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageSourceCreateThumbnailWithTransform];
LABEL_53:
            id v46 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 requestedOrCalculatedMaximumLongSideLength]);
            [v13 setObject:v46 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];
          }
        }
        else if ([v5 shouldUseEmbeddedImageAsSource])
        {
          goto LABEL_53;
        }
        size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v34);
        CGImageDestinationAddImageFromSource(v35, v34, PrimaryImageIndex, (CFDictionaryRef)v13);
        goto LABEL_55;
      }
      CFStringRef v15 = @"sRGB";
    }
    [v13 setObject:v15 forKeyedSubscript:kCGImageDestinationOptimizeColorForSharing];
    goto LABEL_17;
  }
  [v5 setStatus:2];
LABEL_64:
}

@end