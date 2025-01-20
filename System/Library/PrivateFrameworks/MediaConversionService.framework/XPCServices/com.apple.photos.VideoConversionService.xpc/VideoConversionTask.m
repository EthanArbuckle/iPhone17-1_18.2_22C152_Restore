@interface VideoConversionTask
+ (BOOL)supportsDeduplication;
+ (id)temporaryFileURLWithNameComponent:(id)a3 pathExtension:(id)a4;
- (AVAsset)asset;
- (BOOL)didCallCompletionHandler;
- (BOOL)didDetectHang;
- (BOOL)isMetadataTrackExtractionConversion;
- (BOOL)isPassthroughConversion;
- (BOOL)requiresPhotosAdjustmentRendering;
- (BOOL)wantsResultAsData;
- (MediaConversionRequestTracker)requestTracker;
- (NSDate)conversionEndTime;
- (NSDate)conversionStartTime;
- (NSDate)enqueueTime;
- (NSError)error;
- (NSMutableDictionary)options;
- (NSMutableDictionary)resultInformation;
- (NSString)identifier;
- (NSURL)outputMainResourceURL;
- (NSURL)sourceMainResourceURL;
- (OS_dispatch_source)progressUpdateTimerSource;
- (PAMediaConversionServiceResourceURLCollection)outputURLCollection;
- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection;
- (VideoConversionTask)initWithSourceBookmarkDictionary:(id)a3 outputURLCollection:(id)a4 options:(id)a5 requestTracker:(id)a6;
- (VideoConversionTaskProgressUpdateObserver)progressObserver;
- (id)completionHandler;
- (int64_t)status;
- (unint64_t)timerStatus;
- (void)callCompletionHandler;
- (void)didEnqueue;
- (void)loadAsset;
- (void)performConversion;
- (void)resolveSourceBookmarkDictionary:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversionEndTime:(id)a3;
- (void)setConversionStartTime:(id)a3;
- (void)setDidCallCompletionHandler:(BOOL)a3;
- (void)setEnqueueTime:(id)a3;
- (void)setError:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOutputURLCollection:(id)a3;
- (void)setProgressObserver:(id)a3;
- (void)setProgressUpdateTimerSource:(id)a3;
- (void)setRequestTracker:(id)a3;
- (void)setResultInformation:(id)a3;
- (void)setSourceURLCollection:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimerStatus:(unint64_t)a3;
- (void)updateResultTracker;
@end

@implementation VideoConversionTask

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressObserver);
  objc_storeStrong((id *)&self->_requestTracker, 0);
  objc_storeStrong((id *)&self->_conversionEndTime, 0);
  objc_storeStrong((id *)&self->_conversionStartTime, 0);
  objc_storeStrong((id *)&self->_enqueueTime, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_progressUpdateTimerSource, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resultInformation, 0);
  objc_storeStrong((id *)&self->_outputURLCollection, 0);
  objc_storeStrong((id *)&self->_sourceURLCollection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setProgressObserver:(id)a3
{
}

- (VideoConversionTaskProgressUpdateObserver)progressObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressObserver);
  return (VideoConversionTaskProgressUpdateObserver *)WeakRetained;
}

- (void)setRequestTracker:(id)a3
{
}

- (MediaConversionRequestTracker)requestTracker
{
  return (MediaConversionRequestTracker *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)didDetectHang
{
  return self->_didDetectHang;
}

- (void)setDidCallCompletionHandler:(BOOL)a3
{
  self->_didCallCompletionHandler = a3;
}

- (BOOL)didCallCompletionHandler
{
  return self->_didCallCompletionHandler;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setConversionEndTime:(id)a3
{
}

- (NSDate)conversionEndTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setConversionStartTime:(id)a3
{
}

- (NSDate)conversionStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEnqueueTime:(id)a3
{
}

- (NSDate)enqueueTime
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setTimerStatus:(unint64_t)a3
{
  self->_timerStatus = a3;
}

- (unint64_t)timerStatus
{
  return self->_timerStatus;
}

- (void)setProgressUpdateTimerSource:(id)a3
{
}

- (OS_dispatch_source)progressUpdateTimerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAsset:(id)a3
{
}

- (AVAsset)asset
{
  return (AVAsset *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResultInformation:(id)a3
{
}

- (NSMutableDictionary)resultInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)outputURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSMutableDictionary)options
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)requiresPhotosAdjustmentRendering
{
  v2 = [(VideoConversionTask *)self options];
  v3 = [v2 objectForKey:@"PAMediaConversionServiceOptionAdjustmentInformationKey"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isMetadataTrackExtractionConversion
{
  v2 = [(VideoConversionTask *)self options];
  v3 = [v2 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsVideoMetadataTrackExtractionKey"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isPassthroughConversion
{
  v2 = [(VideoConversionTask *)self options];
  v3 = [v2 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPassthroughConversionKey"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)performConversion
{
  id v4 = +[NSDate date];
  v3 = [(VideoConversionTask *)self resultInformation];
  [v3 setObject:v4 forKeyedSubscript:@"PAMediaConversionServiceConversionStartDateKey"];
}

- (void)didEnqueue
{
  [(VideoConversionTask *)self setStatus:5];
  id v3 = +[NSDate date];
  [(VideoConversionTask *)self setEnqueueTime:v3];
}

- (BOOL)wantsResultAsData
{
  v2 = [(VideoConversionTask *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)updateResultTracker
{
  [(MediaConversionRequestTracker *)self->_requestTracker setOutputInformation:self->_resultInformation];
  id v3 = [(VideoConversionTask *)self error];
  [(MediaConversionRequestTracker *)self->_requestTracker setError:v3];

  v8[0] = @"videoConversionStatus";
  unsigned __int8 v4 = +[NSNumber numberWithInteger:self->_status];
  v8[1] = @"videoConversionOperationType";
  v9[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v9[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [(MediaConversionRequestTracker *)self->_requestTracker setServiceInformation:v7];
}

- (void)callCompletionHandler
{
  obj = self;
  objc_sync_enter(obj);
  if ([(VideoConversionTask *)obj didCallCompletionHandler])
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(VideoConversionTask *)obj setDidCallCompletionHandler:1];
    objc_sync_exit(obj);

    if ((id)[(VideoConversionTask *)obj status] != (id)1)
    {
      v2 = [(VideoConversionTask *)obj error];

      if (!v2)
      {
        NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
        CFStringRef v16 = @"Conversion failed for unknown reason";
        id v3 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        unsigned __int8 v4 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v3];
        [(VideoConversionTask *)obj setError:v4];
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v8 = [(VideoConversionTask *)obj identifier];
        v9 = [(VideoConversionTask *)obj error];
        *(_DWORD *)buf = 138543618;
        v12 = v8;
        __int16 v13 = 2114;
        v14 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Video conversion error for conversion task %{public}@: %{public}@", buf, 0x16u);
      }
    }
    v5 = +[NSDate date];
    v6 = [(VideoConversionTask *)obj resultInformation];
    [v6 setObject:v5 forKeyedSubscript:@"PAMediaConversionServiceConversionEndDateKey"];

    [(VideoConversionTask *)obj updateResultTracker];
    v7 = [(VideoConversionTask *)obj completionHandler];
    v7[2](v7, [(VideoConversionTask *)obj status]);
  }
}

- (void)loadAsset
{
  id v3 = [(VideoConversionTask *)self error];

  if (!v3)
  {
    v9 = AVURLAssetPreferPreciseDurationAndTimingKey;
    v10 = &__kCFBooleanTrue;
    unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v5 = [(VideoConversionTask *)self sourceMainResourceURL];
    v6 = +[AVURLAsset URLAssetWithURL:v5 options:v4];
    [(VideoConversionTask *)self setAsset:v6];

    v7 = [(VideoConversionTask *)self asset];

    if (!v7)
    {
      v8 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:0];
      [(VideoConversionTask *)self setError:v8];
    }
  }
}

- (NSURL)outputMainResourceURL
{
  v2 = [(VideoConversionTask *)self outputURLCollection];
  id v3 = [v2 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];

  return (NSURL *)v3;
}

- (NSURL)sourceMainResourceURL
{
  v2 = [(VideoConversionTask *)self sourceURLCollection];
  id v3 = [v2 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];

  return (NSURL *)v3;
}

- (void)resolveSourceBookmarkDictionary:(id)a3
{
  id v4 = a3;
  v5 = [PAMediaConversionServiceResourceURLCollectionAccessProvider alloc];
  v6 = [(VideoConversionTask *)self options];
  v7 = [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)v5 initWithOptions:v6];

  id v13 = 0;
  v8 = +[PAMediaConversionServiceResourceURLCollection collectionForBookmarkDataDictionaryRepresentation:v4 accessProvider:v7 error:&v13];

  id v9 = v13;
  if (!v8) {
    [(VideoConversionTask *)self setError:v9];
  }
  [(VideoConversionTask *)self setSourceURLCollection:v8];
  v10 = [(VideoConversionTask *)self requestTracker];
  [v10 setSourceURLCollection:v8];

  if ([v8 allURLsAreReadable])
  {
    v11 = v9;
  }
  else
  {
    v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v12 = [(VideoConversionTask *)self identifier];
      *(_DWORD *)buf = 138543618;
      NSErrorUserInfoKey v15 = v12;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to access source URL for conversion task %{public}@: %{public}@", buf, 0x16u);
    }
    [(VideoConversionTask *)self setError:v11];
  }
}

- (VideoConversionTask)initWithSourceBookmarkDictionary:(id)a3 outputURLCollection:(id)a4 options:(id)a5 requestTracker:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VideoConversionTask;
  v14 = [(VideoConversionTask *)&v19 init];
  NSErrorUserInfoKey v15 = v14;
  if (v14)
  {
    [(VideoConversionTask *)v14 setRequestTracker:v13];
    __int16 v16 = +[NSMutableDictionary dictionaryWithDictionary:v12];
    [(VideoConversionTask *)v15 setOptions:v16];

    [(VideoConversionTask *)v15 resolveSourceBookmarkDictionary:v10];
    [(VideoConversionTask *)v15 setOutputURLCollection:v11];
    v17 = +[NSMutableDictionary dictionary];
    [(VideoConversionTask *)v15 setResultInformation:v17];
  }
  return v15;
}

+ (id)temporaryFileURLWithNameComponent:(id)a3 pathExtension:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = NSTemporaryDirectory();
  v8 = [v7 stringByAppendingPathComponent:v6];

  if (v5)
  {
    uint64_t v9 = [v8 stringByAppendingPathExtension:v5];

    v8 = (void *)v9;
  }
  id v10 = +[NSURL fileURLWithPath:v8];

  return v10;
}

+ (BOOL)supportsDeduplication
{
  return 1;
}

@end