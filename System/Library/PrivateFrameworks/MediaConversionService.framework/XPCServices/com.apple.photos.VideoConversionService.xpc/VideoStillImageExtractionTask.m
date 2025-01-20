@interface VideoStillImageExtractionTask
- (NSData)imageData;
- (double)posterFrameScaleFactorForCGImage:(CGImage *)a3;
- (void)extractStillImage;
- (void)performConversion;
- (void)setImageData:(id)a3;
- (void)storeImage;
@end

@implementation VideoStillImageExtractionTask

- (void).cxx_destruct
{
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (void)storeImage
{
  v3 = [(VideoStillImageExtractionTask *)self imageData];

  if (v3)
  {
    if ([(VideoConversionTask *)self wantsResultAsData])
    {
      id v4 = [(VideoStillImageExtractionTask *)self imageData];
      v5 = [(VideoConversionTask *)self resultInformation];
      [v5 setObject:v4 forKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];

LABEL_6:
      v10 = [(VideoStillImageExtractionTask *)self imageData];
      v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 length]);
      v12 = [(VideoConversionTask *)self resultInformation];
      [v12 setObject:v11 forKeyedSubscript:@"PAMediaConversionServiceFileSizeKey"];

      [(VideoConversionTask *)self setStatus:1];
      return;
    }
    v6 = [(VideoConversionTask *)self outputMainResourceURL];

    if (v6)
    {
      v7 = [(VideoStillImageExtractionTask *)self imageData];
      v8 = [(VideoConversionTask *)self outputMainResourceURL];
      id v17 = 0;
      unsigned int v9 = [v7 writeToURL:v8 options:1 error:&v17];
      id v4 = v17;

      if (v9) {
        goto LABEL_6;
      }
      v20[0] = NSLocalizedDescriptionKey;
      v20[1] = NSUnderlyingErrorKey;
      v21[0] = @"Unable to write output data";
      v21[1] = v4;
      v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      v16 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v15];
      [(VideoConversionTask *)self setError:v16];
    }
    else
    {
      NSErrorUserInfoKey v18 = NSDebugDescriptionErrorKey;
      CFStringRef v19 = @"Caller wants result to URL but no URL is provided";
      v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v14 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:v13];
      [(VideoConversionTask *)self setError:v14];
    }
  }
}

- (double)posterFrameScaleFactorForCGImage:(CGImage *)a3
{
  double Width = (double)CGImageGetWidth(a3);
  double Height = (double)CGImageGetHeight(a3);
  v7 = [(VideoConversionTask *)self options];
  v8 = [v7 objectForKeyedSubscript:@"PAMediaConversionServiceOptionBoundingBoxKey"];

  unsigned int v9 = [(VideoConversionTask *)self options];
  v10 = v9;
  if (v8)
  {
    v11 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionBoundingBoxKey"];

    NSSize v13 = NSSizeFromString(v11);
    double v12 = v13.width;
    if (v13.width >= v13.height) {
      double v14 = v13.height;
    }
    else {
      double v14 = v13.width;
    }
    if (v13.width < v13.height) {
      double v12 = v13.height;
    }
    if (Width >= Height) {
      double v15 = Height;
    }
    else {
      double v15 = Width;
    }
    double v16 = v14 / v15;
    if (Width >= Height) {
      double v17 = Width;
    }
    else {
      double v17 = Height;
    }
    double v18 = v12 / v17;
    if (v16 < v18) {
      double v18 = v16;
    }
    double v19 = fmin(v18, 1.0);

    return v19;
  }
  v21 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"];

  if (!v21) {
    return 1.0;
  }
  v22 = [(VideoConversionTask *)self options];
  v23 = [v22 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"];
  [v23 integerValue];

  PFScaleFactorForMaximumPixelCount();
  return result;
}

- (void)extractStillImage
{
  v3 = [(VideoConversionTask *)self asset];
  if (v3)
  {
    id v4 = [objc_alloc((Class)AVAssetImageGenerator) initWithAsset:v3];
    [v4 setAppliesPreferredTrackTransform:1];
    memset(v54, 0, sizeof(v54));
    CGSize v50 = *(CGSize *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    id v52 = 0;
    id v5 = +[PFMediaUtilities copyCGImageFromImageGenerator:v4 atTime:&v50 actualTime:v54 error:&v52];
    id v6 = v52;
    CFTypeRef arg = v5;
    if (v5)
    {
      PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround();
      CFAutorelease(arg);
      [(VideoStillImageExtractionTask *)self posterFrameScaleFactorForCGImage:arg];
      double v8 = v7;
      unsigned int v9 = [(VideoConversionTask *)self options];
      id v10 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"];

      if (!v10
        || ([(VideoConversionTask *)self options],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"],
            double v12 = objc_claimAutoreleasedReturnValue(),
            id v10 = [v12 integerValue],
            v12,
            v11,
            (unint64_t)v10 < 3))
      {
        NSSize v13 = [(VideoConversionTask *)self options];
        double v14 = [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"];

        if (!v14)
        {
          double v15 = [(VideoConversionTask *)self outputURLCollection];
          double v16 = [v15 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"];
          double v17 = v16;
          if (v16)
          {
            double v18 = v16;
          }
          else
          {
            double v18 = [UTTypeJPEG identifier];
          }
          double v14 = v18;
        }
        if ([(VideoConversionTask *)self requiresPhotosAdjustmentRendering])
        {
          +[PAMediaConversionServiceSharedUtilitiesServiceSide registerPhotosAdjustmentsSubsystems];
          v21 = [(VideoConversionTask *)self options];
          uint64_t v22 = [v21 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAdjustmentInformationKey"];

          v23 = +[CIImage imageWithCGImage:arg];
          v24 = +[PIPhotoEditHelper imageSourceWithCIImage:v23 orientation:1];
          v48 = (__CFData *)v22;
          id v49 = v6;
          v25 = +[PAMediaConversionServiceSharedUtilitiesServiceSide compositionForPhotosAdjustmentInformation:v22 error:&v49];
          id v26 = v49;

          if (v25)
          {
            id v46 = v26;
            [v25 setObject:v24 forKeyedSubscript:@"source"];
            [v25 setMediaType:1];
            v47 = v14;
            uint64_t v27 = +[PAMediaConversionServiceSharedUtilitiesServiceSide exporterImageOptionsForScaleFactor:0 maximumPixelCount:0 metadataPolicy:1 shouldApplyOrientationTransform:v14 outputFileType:v8];
            CGSize v50 = CGSizeZero;
            v45 = (void *)v27;
            v28 = +[PAMediaConversionServiceSharedUtilitiesServiceSide imageDataForPhotosAdjustmentsComposition:source:exporterImageOptions:outOutputSize:job:](PAMediaConversionServiceSharedUtilitiesServiceSide, "imageDataForPhotosAdjustmentsComposition:source:exporterImageOptions:outOutputSize:job:", v25, v24);
            if (v28
              || (double width = v50.width, v50.width == CGSizeZero.width)
              && (double width = v50.height, v50.height == CGSizeZero.height))
            {
              [(VideoStillImageExtractionTask *)self setImageData:v28];
              v30 = [(VideoConversionTask *)self resultInformation];
              v63[0] = @"PAMediaConversionServicePixelWidthKey";
              v31 = +[NSNumber numberWithInteger:(uint64_t)v50.width];
              v63[1] = @"PAMediaConversionServicePixelHeightKey";
              v64[0] = v31;
              v32 = +[NSNumber numberWithInteger:(uint64_t)v50.height];
              v64[1] = v32;
              v33 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
              [v30 addEntriesFromDictionary:v33];
            }
            else
            {
              NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
              CFStringRef v66 = @"Unable to render video still frame or determine output size";
              v30 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1, width);
              v31 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v30];
              [(VideoConversionTask *)self setError:v31];
            }

            id v26 = v46;
            double v14 = v47;
          }
          else
          {
            [(VideoConversionTask *)self setError:v26];
          }

          id v6 = v26;
          v36 = v48;
          goto LABEL_31;
        }
        if (fabs(v8 + -1.0) > 2.22044605e-16)
        {
          v34 = +[PAMediaConversionServiceSharedUtilitiesServiceSide newScaledImageForImageRef:arg scaleFactor:1 orientation:sub_1000189C0((CGImage *)arg, 0, (uint64_t)v10) colorspace:v8];
          if (!v34)
          {
            NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
            CFStringRef v62 = @"Unable to rotate image to preferred orientation";
            v36 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
            v23 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v36];
            [(VideoConversionTask *)self setError:v23];
            goto LABEL_31;
          }
          v35 = v34;
          CFAutorelease(v34);
          CFTypeRef arg = v35;
        }
        v36 = +[NSMutableData data];
        v37 = CGImageDestinationCreateWithData(v36, v14, 1uLL, 0);
        if (v37)
        {
          v38 = v37;
          CGImageDestinationAddImage(v37, (CGImageRef)arg, (CFDictionaryRef)&__NSDictionary0__struct);
          BOOL v39 = CGImageDestinationFinalize(v38);
          CFRelease(v38);
          if (v39)
          {
            [(VideoStillImageExtractionTask *)self setImageData:v36];
            v23 = [(VideoConversionTask *)self resultInformation];
            v55[0] = @"PAMediaConversionServicePixelWidthKey";
            v40 = +[NSNumber numberWithUnsignedLong:CGImageGetWidth((CGImageRef)arg)];
            v55[1] = @"PAMediaConversionServicePixelHeightKey";
            v56[0] = v40;
            v41 = +[NSNumber numberWithUnsignedLong:CGImageGetHeight((CGImageRef)arg)];
            v56[1] = v41;
            v42 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
            [v23 addEntriesFromDictionary:v42];

LABEL_30:
LABEL_31:

            goto LABEL_32;
          }
          NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
          CFStringRef v58 = @"Unable to finalize image";
          v43 = &v58;
          v44 = &v57;
        }
        else
        {
          NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
          CFStringRef v60 = @"Unable to create image destination";
          v43 = &v60;
          v44 = &v59;
        }
        v23 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v44 count:1];
        v40 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v23];
        [(VideoConversionTask *)self setError:v40];
        goto LABEL_30;
      }
      NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
      CFStringRef v68 = @"Illegal ColorSpace option";
      double v19 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v20 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v19];
      [(VideoConversionTask *)self setError:v20];
    }
    else
    {
      [(VideoConversionTask *)self setError:v6];
    }
LABEL_32:
  }
}

- (void)performConversion
{
  v3.receiver = self;
  v3.super_class = (Class)VideoStillImageExtractionTask;
  [(VideoConversionTask *)&v3 performConversion];
  [(VideoConversionTask *)self loadAsset];
  [(VideoStillImageExtractionTask *)self extractStillImage];
  [(VideoStillImageExtractionTask *)self storeImage];
  [(VideoConversionTask *)self callCompletionHandler];
}

@end