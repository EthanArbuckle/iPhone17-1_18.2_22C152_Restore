@interface PhotosAdjustmentsVideoTranscodingTask
- (BOOL)hasProgress;
- (NSProgress)progress;
- (PICompositionExporter)photosAdjustmentsCompositionExporter;
- (double)currentFractionCompleted;
- (id)photosAdjustmentsExporterCompletionHandler;
- (void)cancelTranscode;
- (void)dumpStatistics;
- (void)performExport;
- (void)setPhotosAdjustmentsCompositionExporter:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation PhotosAdjustmentsVideoTranscodingTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_photosAdjustmentsCompositionExporter, 0);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPhotosAdjustmentsCompositionExporter:(id)a3
{
}

- (PICompositionExporter)photosAdjustmentsCompositionExporter
{
  return (PICompositionExporter *)objc_getProperty(self, a2, 152, 1);
}

- (void)dumpStatistics
{
  v3 = [(VideoConversionTask *)self conversionEndTime];
  v4 = [(VideoConversionTask *)self conversionStartTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  v7 = [(VideoConversionTask *)self asset];
  v8 = v7;
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  v10 = +[PFMediaUtilities tracksWithMediaType:AVMediaTypeVideo forAsset:v8];
  v11 = [v10 firstObject];
  [v11 nominalFrameRate];
  float v13 = v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    double v14 = v13;
    float v15 = Seconds * v14 / v6;
    float v16 = v6 / Seconds;
    v17 = [(VideoConversionTask *)self identifier];
    *(_DWORD *)buf = 138544642;
    v20 = v17;
    __int16 v21 = 2048;
    double v22 = v6;
    __int16 v23 = 2048;
    double v24 = Seconds;
    __int16 v25 = 2048;
    double v26 = v14;
    __int16 v27 = 2048;
    double v28 = v16;
    __int16 v29 = 2048;
    double v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Photos adjustments video transcode conversion for conversion task %{public}@ finished, conversion duration %.1fs, input asset duration %.1fs (%.1ffps), %.1f x realtime (%.1ffps)", buf, 0x3Eu);
  }
}

- (void)cancelTranscode
{
  v4 = [(PhotosAdjustmentsVideoTranscodingTask *)self progress];

  if (!v4)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:691 description:@"Unexpected missing photos adjustments video transcode export progress with job in running state"];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(VideoConversionTask *)self identifier];
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancelling photos adjustments conversion task %{public}@", (uint8_t *)&v8, 0xCu);
  }
  double v6 = [(PhotosAdjustmentsVideoTranscodingTask *)self progress];
  [v6 cancel];
}

- (double)currentFractionCompleted
{
  v3 = [(PhotosAdjustmentsVideoTranscodingTask *)self progress];
  [v3 fractionCompleted];
  double v5 = v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    double v6 = [(VideoConversionTask *)self identifier];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2048;
    double v11 = v5 * 100.0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Photos adjustment export progress for conversion task %{public}@: %.1f", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (BOOL)hasProgress
{
  v2 = [(PhotosAdjustmentsVideoTranscodingTask *)self progress];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)photosAdjustmentsExporterCompletionHandler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C5D8;
  v4[3] = &unk_100041630;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (void)performExport
{
  BOOL v3 = [(VideoConversionTask *)self asset];
  if (!v3)
  {
    [(VideoConversionTask *)self setStatus:2];
    [(VideoTranscodingTask *)self callCompletionHandler];
    goto LABEL_32;
  }
  if (![(VideoTranscodingTask *)self hasSlowMotionAdjustments])
  {
    v7 = [(VideoConversionTask *)self sourceMainResourceURL];
    id v63 = 0;
    id v62 = 0;
    unsigned __int8 v8 = [v7 getResourceValue:&v63 forKey:NSURLTypeIdentifierKey error:&v62];
    id v9 = v63;
    id v10 = v62;

    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v47 = [(VideoConversionTask *)self identifier];
        v48 = [(VideoConversionTask *)self sourceMainResourceURL];
        v49 = [v48 path];
        *(_DWORD *)buf = 138543618;
        v67 = v47;
        __int16 v68 = 2112;
        v69 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Task %{public}@: Unable to determine type identifier for input file %@", buf, 0x16u);
      }
      [(VideoConversionTask *)self setStatus:2];
      NSErrorUserInfoKey v74 = NSUnderlyingErrorKey;
      id v75 = v10;
      v17 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      v18 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v17];
      [(VideoConversionTask *)self setError:v18];

      [(VideoTranscodingTask *)self callCompletionHandler];
      goto LABEL_31;
    }
    double v11 = [(VideoConversionTask *)self options];
    float v12 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionScaleFactorKey"];

    float v13 = [(VideoConversionTask *)self options];
    double v14 = [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"];

    if (v12 && v14)
    {
      [(VideoConversionTask *)self setStatus:2];
      NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
      CFStringRef v73 = @"Scale factor and maximum pixel count options are mutually exclusive";
      float v15 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      float v16 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:6 userInfo:v15];
      [(VideoConversionTask *)self setError:v16];

      [(VideoTranscodingTask *)self callCompletionHandler];
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    +[PAMediaConversionServiceSharedUtilitiesServiceSide registerPhotosAdjustmentsSubsystems];
    id v19 = +[NUVideoUtilities videoOrientationForAsset:v3 videoComposition:0];
    v20 = [(VideoConversionTask *)self options];
    uint64_t v21 = [v20 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAdjustmentInformationKey"];

    v55 = (void *)v21;
    if (v21)
    {
      id v61 = v10;
      double v22 = +[PAMediaConversionServiceSharedUtilitiesServiceSide compositionForPhotosAdjustmentInformation:v21 error:&v61];
      id v23 = v61;

      id v54 = v23;
      if (!v22)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v51 = [(VideoConversionTask *)self identifier];
          v52 = [(VideoConversionTask *)self sourceMainResourceURL];
          v53 = [v52 path];
          *(_DWORD *)buf = 138543874;
          v67 = v51;
          __int16 v68 = 2112;
          v69 = v53;
          __int16 v70 = 2114;
          id v71 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Task %{public}@: Unable to deserialize adjustment data for input file %@: %{public}@", buf, 0x20u);
        }
        [(VideoConversionTask *)self setStatus:2];
        if (v23)
        {
          CFStringRef v64 = @"PAMediaConversionServiceErrorUnderlyingErrorDescriptionKey";
          v46 = [v23 description];
          v65 = v46;
          id v43 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        }
        else
        {
          id v43 = 0;
        }
        v45 = v55;
        v50 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:6 userInfo:v43];
        [(VideoConversionTask *)self setError:v50];

        [(VideoTranscodingTask *)self callCompletionHandler];
        goto LABEL_29;
      }
      double v24 = [v22 objectForKeyedSubscript:@"orientation"];

      if (!v24)
      {
        id v25 = objc_alloc((Class)NUGenericAdjustment);
        id v26 = [objc_alloc((Class)NUIdentifier) initWithName:@"Orientation"];
        id v27 = [v25 initWithIdentifier:v26];

        double v28 = +[NSNumber numberWithInteger:v19];
        [v27 setObject:v28 forKeyedSubscript:@"value"];

        [v22 setObject:v27 forKeyedSubscript:@"orientation"];
      }
    }
    else
    {
      double v22 = +[PAMediaConversionServiceSharedUtilitiesServiceSide emptyGenericCompositionWithAdjustmentForOrientation:v19];
      id v54 = v10;
    }
    __int16 v29 = [(VideoConversionTask *)self sourceMainResourceURL];
    double v30 = +[PIPhotoEditHelper videoSourceWithURL:v29];
    [v22 setObject:v30 forKeyedSubscript:@"source"];

    [v22 setMediaType:2];
    v31 = +[PIPhotoEditHelper validatedCompositionCopyForComposition:v22 mediaType:2];

    id v32 = objc_alloc_init((Class)PICompositionExporter);
    id v33 = objc_alloc_init((Class)PICompositionExporterVideoOptions);
    id v34 = [objc_alloc((Class)NUPriority) initWithLevel:1];
    [v33 setPriority:v34];

    if (v12)
    {
      id v35 = objc_alloc((Class)NUFixedScalePolicy);
      [v12 doubleValue];
      uint64_t v36 = NUScaleFromDouble();
      id v38 = objc_msgSend(v35, "initWithScale:", v36, v37);
    }
    else
    {
      if (!v14)
      {
LABEL_22:
        [v33 setBypassOutputSettingsIfNoComposition:1];
        v40 = [(VideoConversionTask *)self options];
        v41 = [v40 objectForKeyedSubscript:@"PAMediaConversionServiceOptionApplyOrientationTransformKey"];
        objc_msgSend(v33, "setApplyVideoOrientationAsMetadata:", objc_msgSend(v41, "BOOLValue") ^ 1);

        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10001D178;
        v60[3] = &unk_1000415E0;
        v60[4] = self;
        [v33 setMetadataProcessor:v60];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10001D1FC;
        v56[3] = &unk_100041608;
        v56[4] = self;
        id v57 = v32;
        id v58 = v31;
        id v59 = v33;
        id v42 = v33;
        id v43 = v31;
        id v44 = v32;
        [(VideoTranscodingTask *)self transitionToRunningStateAndConditionallyRunBlock:v56];

        v45 = v55;
LABEL_29:

        id v10 = v54;
        goto LABEL_30;
      }
      id v38 = objc_msgSend(objc_alloc((Class)NUPixelCountScalePolicy), "initWithTargetPixelCount:", objc_msgSend(v14, "integerValue"));
    }
    v39 = v38;
    [v33 setScalePolicy:v38];

    goto LABEL_22;
  }
  double v4 = +[NSString stringWithFormat:@"%@ and %@ are mutually exclusive", @"PAMediaConversionServiceOptionAdjustmentInformationKey", @"PAMediaConversionServiceOptionVideoAdjustmentsPropertyListKey"];
  NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
  v77 = v4;
  double v5 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  double v6 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:6 userInfo:v5];
  [(VideoConversionTask *)self setError:v6];

  [(VideoConversionTask *)self setStatus:2];
  [(VideoTranscodingTask *)self callCompletionHandler];

LABEL_32:
}

@end