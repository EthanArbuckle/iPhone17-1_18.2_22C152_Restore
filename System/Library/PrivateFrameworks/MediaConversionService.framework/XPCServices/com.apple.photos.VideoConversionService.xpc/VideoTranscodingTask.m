@interface VideoTranscodingTask
+ (BOOL)shouldMaximizeVideoConversionPowerEfficiencyForOptions:(id)a3 inputAssetDuration:(double)a4 taskIdentifier:(id)a5;
+ (id)metadataItemsByApplyingSignatureMetadataFromOptions:(id)a3 toMetadataItems:(id)a4;
+ (id)signatureOptionToIdentifierMapping;
- (BOOL)didDetectHang;
- (BOOL)hasProgress;
- (BOOL)hasSlowMotionAdjustments;
- (VideoConversionHangDetector)hangDetector;
- (double)currentFractionCompleted;
- (id)outputAssetInformationWithError:(id *)a3;
- (void)callCompletionHandler;
- (void)cancel;
- (void)cancelProgressUpdateTimerAndMarkEndTime;
- (void)cancelTranscode;
- (void)determineAndNotifyProgress;
- (void)performConversion;
- (void)performExport;
- (void)setHangDetector:(id)a3;
- (void)startProgressUpdateTimerAndMarkStartTime;
- (void)transitionToRunningStateAndConditionallyRunBlock:(id)a3;
@end

@implementation VideoTranscodingTask

- (void).cxx_destruct
{
}

- (void)setHangDetector:(id)a3
{
}

- (VideoConversionHangDetector)hangDetector
{
  return (VideoConversionHangDetector *)objc_getProperty(self, a2, 144, 1);
}

- (id)outputAssetInformationWithError:(id *)a3
{
  if (!a3)
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2, self, @"VideoConversionService.m", 490, @"Invalid parameter not satisfying: %@", @"outError" object file lineNumber description];
  }
  v5 = [(VideoConversionTask *)self outputMainResourceURL];
  if ([(VideoConversionTask *)self isMetadataTrackExtractionConversion])
  {
    v6 = 0;
    v7 = 0;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    double v10 = height;
    double v11 = CGSizeZero.width;
    goto LABEL_8;
  }
  v7 = +[AVURLAsset URLAssetWithURL:v5 options:0];
  v12 = +[PFMediaUtilities tracksWithMediaType:AVMediaTypeVideo forAsset:v7];
  v6 = [v12 lastObject];

  if (v7 && v6)
  {
    [v6 naturalSize];
    double v11 = v13;
    double v10 = v14;
    [v6 preferredTransform];
    double width = v10 * *(double *)&v35[3] + *(double *)&v35[1] * v11;
    double height = v10 * *(double *)&v35[4] + *(double *)&v35[2] * v11;
LABEL_8:
    v15 = +[NSFileManager defaultManager];
    v16 = [v5 path];
    v35[0] = 0;
    v17 = [v15 attributesOfItemAtPath:v16 error:v35];
    id v18 = v35[0];

    if (v17)
    {
      v19 = [v17 objectForKeyedSubscript:NSFileSize];
      if ([v19 integerValue])
      {
        v36[0] = @"PAMediaConversionServicePixelWidthKey";
        id v34 = v18;
        v20 = +[NSNumber numberWithDouble:v11];
        v37[0] = v20;
        v36[1] = @"PAMediaConversionServicePixelHeightKey";
        v21 = +[NSNumber numberWithDouble:v10];
        v37[1] = v21;
        v36[2] = @"PAMediaConversionServiceOrientedPixelWidthKey";
        +[NSNumber numberWithDouble:fabs(width)];
        v22 = v7;
        v24 = v23 = v5;
        v37[2] = v24;
        v36[3] = @"PAMediaConversionServiceOrientedPixelHeightKey";
        v25 = +[NSNumber numberWithDouble:fabs(height)];
        v36[4] = @"PAMediaConversionServiceFileSizeKey";
        v37[3] = v25;
        v37[4] = v19;
        v26 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];

        id v18 = v34;
        v5 = v23;
        v7 = v22;

        v27 = 0;
LABEL_18:

        goto LABEL_19;
      }
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      CFStringRef v39 = @"Unable to get file information about converted asset";
      v27 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v28 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:v27];
    }
    else
    {
      v40[0] = NSLocalizedDescriptionKey;
      v40[1] = NSUnderlyingErrorKey;
      v41[0] = @"Unable to get file system information about converted asset";
      v41[1] = v18;
      v27 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      id v28 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:v27];
      v19 = 0;
    }
    v26 = 0;
    *a3 = v28;
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v31 = [v5 path];
    *(_DWORD *)buf = 138412802;
    v45 = v31;
    __int16 v46 = 2112;
    v47 = v7;
    __int16 v48 = 2112;
    v49 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get AV information about converted asset at %@ (%@/%@)", buf, 0x20u);
  }
  NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
  v29 = +[NSString stringWithFormat:@"Unable to get AV information about converted asset (%@/%@)", v7, v6];
  v43 = v29;
  v27 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

  if (a3)
  {
    +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:v27];
    v26 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
LABEL_19:

  return v26;
}

- (void)cancelProgressUpdateTimerAndMarkEndTime
{
  obj = self;
  objc_sync_enter(obj);
  if ((id)[(VideoConversionTask *)obj timerStatus] != (id)2)
  {
    [(VideoConversionTask *)obj setTimerStatus:2];
    v2 = +[NSDate date];
    [(VideoConversionTask *)obj setConversionEndTime:v2];

    v3 = [(VideoConversionTask *)obj progressUpdateTimerSource];

    if (v3)
    {
      v4 = [(VideoConversionTask *)obj progressUpdateTimerSource];
      dispatch_source_cancel(v4);

      [(VideoConversionTask *)obj setProgressUpdateTimerSource:0];
    }
  }
  objc_sync_exit(obj);
}

- (void)startProgressUpdateTimerAndMarkStartTime
{
  v2 = self;
  objc_sync_enter(v2);
  if (![(VideoConversionTask *)v2 timerStatus])
  {
    [(VideoConversionTask *)v2 setTimerStatus:1];
    v3 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    [(VideoConversionTask *)v2 setProgressUpdateTimerSource:v4];

    v5 = [(VideoConversionTask *)v2 progressUpdateTimerSource];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001B3E0;
    handler[3] = &unk_1000415B8;
    handler[4] = v2;
    dispatch_source_set_event_handler(v5, handler);

    v6 = [(VideoConversionTask *)v2 options];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionProgressUpdateTimeIntervalKey"];
    v8 = (void *)v7;
    v9 = &off_100043EB8;
    if (v7) {
      v9 = (_UNKNOWN **)v7;
    }
    double v10 = v9;

    [v10 doubleValue];
    double v12 = v11;
    double v13 = [(VideoConversionTask *)v2 progressUpdateTimerSource];
    dispatch_source_set_timer(v13, 0, (unint64_t)(v12 * 1000000000.0), 0x5F5E100uLL);

    double v14 = [(VideoConversionTask *)v2 options];
    v15 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldSimulateConversionHangKey"];
    unsigned int v16 = [v15 BOOLValue];

    v17 = [VideoConversionHangDetector alloc];
    double v18 = 3600.0;
    if (v16) {
      double v18 = 5.0;
    }
    v19 = [(VideoConversionHangDetector *)v17 initWithThresholdTimeInterval:v18];
    [(VideoTranscodingTask *)v2 setHangDetector:v19];

    [(VideoTranscodingTask *)v2 determineAndNotifyProgress];
    v20 = [(VideoConversionTask *)v2 progressUpdateTimerSource];
    dispatch_resume(v20);

    v21 = +[NSDate date];
    [(VideoConversionTask *)v2 setConversionStartTime:v21];
  }
  objc_sync_exit(v2);
}

- (void)callCompletionHandler
{
  v3.receiver = self;
  v3.super_class = (Class)VideoTranscodingTask;
  [(VideoConversionTask *)&v3 callCompletionHandler];
  [(VideoTranscodingTask *)self cancelProgressUpdateTimerAndMarkEndTime];
}

- (BOOL)hasSlowMotionAdjustments
{
  v2 = [(VideoConversionTask *)self options];
  objc_super v3 = [v2 objectForKey:@"PAMediaConversionServiceOptionVideoAdjustmentsPropertyListKey"];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)transitionToRunningStateAndConditionallyRunBlock:(id)a3
{
  v5 = (void (**)(void))a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  if ((id)[(VideoConversionTask *)v4 status] != (id)4)
  {
    [(VideoConversionTask *)v4 setStatus:6];
    v5[2]();
  }
  objc_sync_exit(v4);
}

- (void)cancelTranscode
{
  NSStringFromSelector(a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSInternalInconsistencyException, @"Subclasses must override %@", v2 format];
}

- (double)currentFractionCompleted
{
  id v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"Subclasses must override %@", v2 format];

  return NAN;
}

- (BOOL)hasProgress
{
  id v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"Subclasses must override %@", v2 format];

  return 0;
}

- (void)performExport
{
  NSStringFromSelector(a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSInternalInconsistencyException, @"Subclasses must override %@", v2 format];
}

- (void)cancel
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(VideoConversionTask *)v2 status];
  [(VideoConversionTask *)v2 setStatus:4];
  if (v3 == (id)5)
  {
    NSErrorUserInfoKey v8 = NSDebugDescriptionErrorKey;
    CFStringRef v9 = @"Export was cancelled while conversion task was still enqueued";
    BOOL v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v5 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:5 userInfo:v4];
    [(VideoConversionTask *)v2 setError:v5];

    [(VideoTranscodingTask *)v2 callCompletionHandler];
  }
  else if (v3 == (id)6)
  {
    [(VideoTranscodingTask *)v2 cancelTranscode];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Ignoring cancellation request for transcode task in state %ld", (uint8_t *)&v6, 0xCu);
  }
  objc_sync_exit(v2);
}

- (BOOL)didDetectHang
{
  id v2 = [(VideoTranscodingTask *)self hangDetector];
  unsigned __int8 v3 = [v2 didDetectHang];

  return v3;
}

- (void)determineAndNotifyProgress
{
  if ((id)[(VideoConversionTask *)self status] == (id)6
    && [(VideoTranscodingTask *)self hasProgress])
  {
    [(VideoTranscodingTask *)self currentFractionCompleted];
    double v4 = v3;
    v5 = [(VideoTranscodingTask *)self hangDetector];
    [v5 updateCurrentProgress:v4];
  }
  else
  {
    double v4 = NAN;
  }
  int v6 = [(VideoConversionTask *)self progressObserver];
  if (v6)
  {
    id v7 = v6;
    [v6 videoConversionTask:self didUpdateFractionCompleted:v4];
    int v6 = v7;
  }
}

- (void)performConversion
{
  if ((id)[(VideoConversionTask *)self status] != (id)4
    && (id)[(VideoConversionTask *)self status] != (id)5)
  {
    double v4 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"VideoConversionService.m", 299, @"Job in unexpected status %ld", -[VideoConversionTask status](self, "status"));
  }
  if ((id)[(VideoConversionTask *)self status] != (id)4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VideoTranscodingTask;
    [(VideoConversionTask *)&v5 performConversion];
    [(VideoConversionTask *)self loadAsset];
    [(VideoTranscodingTask *)self performExport];
  }
}

+ (BOOL)shouldMaximizeVideoConversionPowerEfficiencyForOptions:(id)a3 inputAssetDuration:(double)a4 taskIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    double v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"VideoConversionService.m", 421, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  if (a4 == 0.0)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"VideoConversionService.m", 422, @"Invalid parameter not satisfying: %@", @"inputAssetDuration" object file lineNumber description];
  }
  double v11 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionPowerEfficiencyKey"];
  id v12 = [v11 integerValue];

  if (v12 == (id)1)
  {
    BOOL v16 = 1;
  }
  else if (v12 == (id)2)
  {
    double v13 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionPowerEfficiencyMinimumDurationKey"];
    [v13 doubleValue];
    double v15 = v14;

    if (v15 <= 0.0)
    {
      v20 = +[NSAssertionHandler currentHandler];
      [v20 handleFailureInMethod:a2 object:a1 file:@"VideoConversionService.m" lineNumber:430 description:@"PAMediaConversionServiceOptionPowerEfficiencyMinimumDurationKey option is required for PAMediaConversionServicePowerEfficiencyMaximizeWithMinimumDuration"];
    }
    BOOL v16 = v15 < a4;
  }
  else
  {
    BOOL v16 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    BOOL v22 = v16;
    __int16 v23 = 2048;
    id v24 = v12;
    __int16 v25 = 2048;
    double v26 = a4;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Maximize video conversion power efficiency: %d (mode = %ld, duration = %f, conversion task = %{public}@)", buf, 0x26u);
  }

  return v16;
}

+ (id)metadataItemsByApplyingSignatureMetadataFromOptions:(id)a3 toMetadataItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = sub_10001BDF4;
  v19 = sub_10001BE04;
  id v20 = +[NSMutableArray arrayWithArray:v7];
  NSErrorUserInfoKey v8 = [a1 signatureOptionToIdentifierMapping];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001BE0C;
  v12[3] = &unk_100041590;
  id v9 = v6;
  id v13 = v9;
  double v14 = &v15;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

+ (id)signatureOptionToIdentifierMapping
{
  if (qword_10004A0A8 != -1) {
    dispatch_once(&qword_10004A0A8, &stru_100041568);
  }
  id v2 = (void *)qword_10004A0A0;
  return v2;
}

@end