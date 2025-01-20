@interface SHShazamKitService
+ (id)machServiceName;
+ (void)initializeGlobalServiceState;
- (SHAudioTapProvider)audioTapProvider;
- (SHClientCredentials)clientCredentials;
- (SHEventSignalScheduler)eventSignaller;
- (SHHapticsFetcher)hapticsFetcher;
- (SHMatcherControllerProvider)matcherControllerProvider;
- (SHMediaItemFetcher)mediaItemFetcher;
- (SHMediaLibraryClient)libraryClient;
- (SHMediaLibraryQueryManager)libraryQueryManager;
- (SHPrivacyDisclosureManager)privacyDisclosureManager;
- (SHServiceDelegate)serviceDelegate;
- (SHShazamKitClient)delegate;
- (SHShazamKitService)initWithClientCredentials:(id)a3;
- (SHShazamKitService)initWithClientCredentials:(id)a3 audioTapProvider:(id)a4 eventSignaller:(id)a5 privacyDisclosureManager:(id)a6;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)dealloc;
- (void)disableSpectralOutputNotification;
- (void)finishedWorker:(id)a3;
- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4;
- (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4;
- (void)prepareMatcherForRequestID:(id)a3 completionHandler:(id)a4;
- (void)registerMatcherController:(id)a3 forRequest:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setServiceDelegate:(id)a3;
- (void)setUpSpectralOutputNotification;
- (void)shutdownService;
- (void)startRecognitionForRequest:(id)a3;
- (void)startRecognitionForRequest:(id)a3 completionHandler:(id)a4;
- (void)startUpdatingLocationForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
- (void)synchronizeSnapshot:(id)a3 startCondition:(id)a4 completionHandler:(id)a5;
@end

@implementation SHShazamKitService

+ (id)machServiceName
{
  return SHShazamKitServiceName;
}

+ (void)initializeGlobalServiceState
{
  if (qword_100090A68 != -1) {
    dispatch_once(&qword_100090A68, &stru_1000752F8);
  }
}

- (void)dealloc
{
  v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Deallocating the Shazam Service", buf, 2u);
  }

  [(SHShazamKitService *)self disableSpectralOutputNotification];
  v4.receiver = self;
  v4.super_class = (Class)SHShazamKitService;
  [(SHShazamKitService *)&v4 dealloc];
}

- (SHShazamKitService)initWithClientCredentials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHShazamKitService;
  v6 = [(SHShazamKitService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientCredentials, a3);
  }

  return v7;
}

- (SHShazamKitService)initWithClientCredentials:(id)a3 audioTapProvider:(id)a4 eventSignaller:(id)a5 privacyDisclosureManager:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(SHShazamKitService *)self initWithClientCredentials:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_audioTapProvider, a4);
    objc_storeStrong((id *)&v15->_eventSignaller, a5);
    objc_storeStrong((id *)&v15->_privacyDisclosureManager, a6);
  }

  return v15;
}

- (void)setUpSpectralOutputNotification
{
  v3 = [(SHShazamKitService *)self clientCredentials];
  unsigned int v4 = [v3 canEnableSpectralOutput];

  if (v4)
  {
    id v5 = sh_log_object();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Started observing spectral output notifications", (uint8_t *)buf, 2u);
    }

    v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = SHNotificationNameDaemonSpectralOutput;
    [v6 removeObserver:self name:SHNotificationNameDaemonSpectralOutput object:0];

    objc_initWeak(buf, self);
    v8 = +[NSNotificationCenter defaultCenter];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100017284;
    v10[3] = &unk_100075320;
    objc_copyWeak(&v11, buf);
    id v9 = [v8 addObserverForName:v7 object:0 queue:0 usingBlock:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (void)disableSpectralOutputNotification
{
  v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stopped observing spectral output notifications", v5, 2u);
  }

  unsigned int v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:SHNotificationNameDaemonSpectralOutput object:0];
}

- (void)prepareMatcherForRequestID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  v8 = [SHPreRecordingWorker alloc];
  id v9 = [(SHShazamKitService *)self audioTapProvider];
  v10 = [(SHPreRecordingWorker *)v8 initWithRequestID:v6 audioTapProvider:v9];

  if (v10)
  {
    id v11 = [(SHShazamKitService *)self serviceDelegate];
    id v16 = 0;
    unsigned int v12 = [v11 service:self registerWorker:v10 watchdogTimeout:&v16 error:120.0];
    id v13 = v16;

    if (v12)
    {
      [(SHPreRecordingWorker *)v10 setWorkerDelegate:self];
      [(SHPreRecordingWorker *)v10 startRecordingWithCompletionHandler:v7];
    }
    else
    {
      v15 = sh_log_object();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v18 = v10;
        __int16 v19 = 2112;
        id v20 = v6;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to start prerecording for worker %@ - the pre recording is already running with the same worker id %@ running - %@", buf, 0x20u);
      }

      if (v7) {
        v7[2](v7);
      }
    }
  }
  else
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to start pre recording - it is likely some required entitlements are missing", buf, 2u);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)startRecognitionForRequest:(id)a3
{
  NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSInternalInconsistencyException, @"%@ is not supported by shazamd, please use startRecognitionForRequest:completionHandler", v3 format];
}

- (void)startRecognitionForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  v8 = [(SHShazamKitService *)self serviceDelegate];
  id v9 = [(SHShazamKitService *)self matcherControllerProvider];
  [v9 setDelegate:v8];

  if ([v6 type] == (id)3
    && ([(SHShazamKitService *)self privacyDisclosureManager],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 privacyDisclosureAcknowledgementRequired],
        v10,
        v11))
  {
    unsigned int v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138412290;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to create matcher for request %@ as privacy disclosure acknowledgement is required", (uint8_t *)&v30, 0xCu);
    }

    id v13 = +[SHError privateErrorWithCode:204 underlyingError:0];
    v14 = [(SHShazamKitService *)self delegate];
    v15 = [v6 signature];
    id v16 = v15;
    if (!v15) {
      id v16 = objc_opt_new();
    }
    v17 = +[SHMatcherResponse errorResponseForSignature:v16 error:v13];
    [v14 matcher:self didProduceResponse:v17];

    if (!v15) {
    if (v7)
    }
      v7[2](v7);
  }
  else
  {
    v18 = [(SHShazamKitService *)self matcherControllerProvider];
    id v13 = [v18 matcherControllerForRequest:v6];

    if ([v6 type] == (id)2 || objc_msgSend(v6, "type") == (id)3)
    {
      __int16 v19 = sh_log_object();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 138412290;
        id v31 = v6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Enabling spectral output for matcher request %@", (uint8_t *)&v30, 0xCu);
      }

      [(SHShazamKitService *)self setUpSpectralOutputNotification];
    }
    if (v13)
    {
      if ([v6 type] == (id)2)
      {
        id v20 = sh_log_object();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v30) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Request type is record, starting location updates", (uint8_t *)&v30, 2u);
        }

        [(SHShazamKitService *)self startUpdatingLocationForRequest:v6];
      }
      __int16 v21 = [(SHShazamKitService *)self clientCredentials];
      id v22 = [v21 attribution];
      v23 = [v22 bundleIdentifier];

      if (([v23 isEqualToString:@"com.apple.springboard"] & 1) != 0
        || [v23 isEqualToString:@"com.apple.musicrecognition.MusicRecognitionControls"])
      {
        v24 = [(SHShazamKitService *)self eventSignaller];
        [v24 sendEventSignal:@"com.apple.musicrecognition.recognition-activated"];
      }
      [(SHShazamKitService *)self registerMatcherController:v13 forRequest:v6 completionHandler:v7];
    }
    else
    {
      v25 = sh_log_object();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unable to fetch matcher controller - it is likely some required entitlements are missing", (uint8_t *)&v30, 2u);
      }

      v23 = +[SHCoreError errorWithCode:102 underlyingError:0];
      v26 = [(SHShazamKitService *)self delegate];
      v27 = [v6 signature];
      v28 = v27;
      if (!v27) {
        v28 = objc_opt_new();
      }
      v29 = +[SHMatcherResponse errorResponseForSignature:v28 error:v23];
      [v26 matcher:self didProduceResponse:v29];

      if (!v27) {
      if (v7)
      }
        v7[2](v7);
    }
  }
}

- (void)startUpdatingLocationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestID];
  id v6 = [v5 UUIDString];
  uint64_t v7 = [(SHShazamKitService *)self clientCredentials];
  v8 = +[SHLocationProvider locationProviderForRequestIdentifier:clientType:](SHLocationProvider, "locationProviderForRequestIdentifier:clientType:", v6, [v7 clientType]);

  [v8 setWorkerDelegate:self];
  if (v8)
  {
    id v9 = [(SHShazamKitService *)self serviceDelegate];
    [v4 watchdogTimeout];
    id v14 = 0;
    unsigned int v10 = objc_msgSend(v9, "service:registerWorker:watchdogTimeout:error:", self, v8, &v14);
    id v11 = v14;

    unsigned int v12 = sh_log_object();
    id v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Registering location provider %@", buf, 0xCu);
      }

      [v8 startUpdatingLocation];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to register location provider %@", buf, 0xCu);
      }
    }
  }
}

- (void)registerMatcherController:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(void))a5;
  id v11 = [(SHShazamKitService *)self serviceDelegate];
  [v9 watchdogTimeout];
  id v21 = 0;
  unsigned int v12 = objc_msgSend(v11, "service:registerWorker:watchdogTimeout:error:", self, v8, &v21);
  id v13 = v21;

  if (v12)
  {
    [v8 setWorkerDelegate:self];
    id v14 = [(SHShazamKitService *)self delegate];
    [v8 setDelegate:v14];

    [v8 setCompletionHandler:v10];
    [v8 startRecognitionForRequest:v9];
  }
  else
  {
    v15 = sh_log_object();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 workerID];
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to register worker %@ - the matcher is already running with the same worker id %@ running", buf, 0x16u);
    }
    v17 = [(SHShazamKitService *)self delegate];
    v18 = [v9 signature];
    __int16 v19 = v18;
    if (!v18) {
      __int16 v19 = objc_opt_new();
    }
    id v20 = +[SHMatcherResponse errorResponseForSignature:v19 error:v13];
    [v17 matcher:self didProduceResponse:v20];

    if (!v18) {
    if (v10)
    }
      v10[2](v10);
  }
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSInternalInconsistencyException, @"%@ is not supported by shazamd, please use synchronizeSnapshot:startCondition:completionHandler", v4 format];
}

- (void)synchronizeSnapshot:(id)a3 startCondition:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [SHMediaLibrarySyncManager alloc];
  unsigned int v12 = [(SHShazamKitService *)self libraryClient];
  v15 = [(SHMediaLibrarySyncManager *)v11 initWithClient:v12 completionHandler:v8];

  [(SHMediaLibrarySyncManager *)v15 setWorkerDelegate:self];
  id v13 = [(SHShazamKitService *)self delegate];
  [(SHMediaLibrarySyncManager *)v15 setDelegate:v13];

  id v14 = [(SHShazamKitService *)self serviceDelegate];
  [v14 service:self registerWorker:v15 watchdogTimeout:0 error:1.79769313e308];

  [(SHMediaLibrarySyncManager *)v15 _synchronizeSnapshot:v10 startCondition:v9];
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHShazamKitService *)self libraryQueryManager];
  [v5 _libraryInfoWithCompletionHandler:v4];
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHShazamKitService *)self libraryQueryManager];
  [v8 _queryLibraryWithParameters:v7 completionHandler:v6];
}

- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHShazamKitService *)self mediaItemFetcher];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000181E4;
  v10[3] = &unk_100075348;
  id v11 = v6;
  id v9 = v6;
  [v8 mediaItemsForShazamIDs:v7 completionHandler:v10];
}

- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHShazamKitService *)self hapticsFetcher];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018334;
  v10[3] = &unk_100075348;
  id v11 = v6;
  id v9 = v6;
  [v8 hapticsForMediaItems:v7 completionHandler:v10];
}

- (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHShazamKitService *)self hapticsFetcher];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018484;
  v10[3] = &unk_100074DC0;
  id v11 = v6;
  id v9 = v6;
  [v8 hasHapticTrackForMediaItem:v7 completionHandler:v10];
}

- (void)finishedWorker:(id)a3
{
  id v4 = a3;
  id v5 = sh_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Worker %@ stopped running", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SHShazamKitService *)self serviceDelegate];
  [v6 service:self unregisterWorker:v4];
}

- (SHMediaLibraryQueryManager)libraryQueryManager
{
  libraryQueryManager = self->_libraryQueryManager;
  if (!libraryQueryManager)
  {
    id v4 = [SHMediaLibraryQueryManager alloc];
    id v5 = [(SHShazamKitService *)self libraryClient];
    id v6 = [(SHMediaLibraryQueryManager *)v4 initWithClient:v5];
    int v7 = self->_libraryQueryManager;
    self->_libraryQueryManager = v6;

    libraryQueryManager = self->_libraryQueryManager;
  }

  return libraryQueryManager;
}

- (SHMediaItemFetcher)mediaItemFetcher
{
  mediaItemFetcher = self->_mediaItemFetcher;
  if (!mediaItemFetcher)
  {
    id v4 = [SHMediaItemFetcher alloc];
    id v5 = [(SHShazamKitService *)self clientCredentials];
    id v6 = [v5 attribution];
    int v7 = [v6 containingAppBundleIdentifier];
    id v8 = [(SHShazamKitService *)self clientCredentials];
    id v9 = -[SHMediaItemFetcher initWithBundleIdentifier:clientType:](v4, "initWithBundleIdentifier:clientType:", v7, [v8 clientType]);
    id v10 = self->_mediaItemFetcher;
    self->_mediaItemFetcher = v9;

    mediaItemFetcher = self->_mediaItemFetcher;
  }

  return mediaItemFetcher;
}

- (SHHapticsFetcher)hapticsFetcher
{
  hapticsFetcher = self->_hapticsFetcher;
  if (!hapticsFetcher)
  {
    id v4 = objc_alloc_init(SHHapticsFetcher);
    id v5 = self->_hapticsFetcher;
    self->_hapticsFetcher = v4;

    hapticsFetcher = self->_hapticsFetcher;
  }

  return hapticsFetcher;
}

- (SHAudioTapProvider)audioTapProvider
{
  audioTapProvider = self->_audioTapProvider;
  if (!audioTapProvider)
  {
    id v4 = [SHAudioTapProvider alloc];
    id v5 = +[SHAudioManager sharedInstance];
    id v6 = [v5 audioRecordingManager];
    int v7 = [(SHShazamKitService *)self clientCredentials];
    id v8 = [(SHAudioTapProvider *)v4 initWithAudioRecordingManager:v6 clientCredentials:v7];
    id v9 = self->_audioTapProvider;
    self->_audioTapProvider = v8;

    audioTapProvider = self->_audioTapProvider;
  }

  return audioTapProvider;
}

- (SHEventSignalScheduler)eventSignaller
{
  eventSignaller = self->_eventSignaller;
  if (!eventSignaller)
  {
    id v4 = objc_alloc_init(SHEventSignalScheduler);
    id v5 = self->_eventSignaller;
    self->_eventSignaller = v4;

    eventSignaller = self->_eventSignaller;
  }

  return eventSignaller;
}

- (SHMediaLibraryClient)libraryClient
{
  libraryClient = self->_libraryClient;
  if (!libraryClient)
  {
    id v4 = [SHMediaLibraryClient alloc];
    id v5 = [(SHShazamKitService *)self clientCredentials];
    id v6 = [(SHMediaLibraryClient *)v4 initWithCredentials:v5];
    int v7 = self->_libraryClient;
    self->_libraryClient = v6;

    libraryClient = self->_libraryClient;
  }

  return libraryClient;
}

- (SHPrivacyDisclosureManager)privacyDisclosureManager
{
  privacyDisclosureManager = self->_privacyDisclosureManager;
  if (!privacyDisclosureManager)
  {
    id v4 = objc_alloc_init(SHPrivacyDisclosureManager);
    id v5 = self->_privacyDisclosureManager;
    self->_privacyDisclosureManager = v4;

    privacyDisclosureManager = self->_privacyDisclosureManager;
  }

  return privacyDisclosureManager;
}

- (SHMatcherControllerProvider)matcherControllerProvider
{
  matcherControllerProvider = self->_matcherControllerProvider;
  if (!matcherControllerProvider)
  {
    id v4 = [SHMatcherControllerProvider alloc];
    id v5 = [(SHShazamKitService *)self audioTapProvider];
    id v6 = [(SHShazamKitService *)self clientCredentials];
    int v7 = [v6 attribution];
    id v8 = [(SHShazamKitService *)self clientCredentials];
    id v9 = -[SHMatcherControllerProvider initWithAudioTapProvider:attribution:clientType:](v4, "initWithAudioTapProvider:attribution:clientType:", v5, v7, [v8 clientType]);
    id v10 = self->_matcherControllerProvider;
    self->_matcherControllerProvider = v9;

    matcherControllerProvider = self->_matcherControllerProvider;
  }

  return matcherControllerProvider;
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  int v7 = [(SHShazamKitService *)self serviceDelegate];
  id v8 = [v7 allWorkersForService:self];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v15 = [v14 taskID];
        id v16 = [v6 runningAssociatedRequestID];
        if ([v15 isEqual:v16])
        {
          unsigned int v17 = [v14 conformsToProtocol:&OBJC_PROTOCOL___SHMatcherDelegate];

          if (v17)
          {
            id v23 = v25;
            [v14 matcher:v25 didProduceResponse:v6];
            __int16 v24 = v9;
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }

  v18 = sh_log_object();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = [v6 runningAssociatedRequestID];
    *(_DWORD *)buf = 138412290;
    id v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Tried to return response ID %@ but could not find a running worker", buf, 0xCu);
  }
  __int16 v24 = +[SHError errorWithCode:500 underlyingError:0];
  id v20 = [(SHShazamKitService *)self delegate];
  id v21 = [v6 signature];
  id v22 = +[SHMatcherResponse errorResponseForSignature:v21 error:v24];
  [v20 matcher:self didProduceResponse:v22];

  id v23 = v25;
LABEL_15:
}

- (void)stopRecognition
{
  id v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Shazam service stopRecognition called", buf, 2u);
  }

  id v4 = [(SHShazamKitService *)self serviceDelegate];
  id v5 = [v4 allWorkersForService:self];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___SHMatcher, (void)v12)) {
          [v11 stopRecognition];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = sh_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    long long v28 = self;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] stopRecognition called for worker with task ID %@", buf, 0x16u);
  }

  id v6 = [(SHShazamKitService *)self serviceDelegate];
  id v7 = [v6 allWorkersForService:self];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    *(void *)&long long v10 = 138412290;
    long long v21 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "taskID", v21);
        if ([v15 isEqual:v4])
        {
          unsigned int v16 = [v14 conformsToProtocol:&OBJC_PROTOCOL___SHMatcher];

          if (v16)
          {
            unsigned int v17 = sh_log_object();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v18 = [v14 workerID];
              *(_DWORD *)buf = 138412546;
              long long v28 = v18;
              __int16 v29 = 2112;
              id v30 = v4;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Worker with worker ID %@ stopping task ID %@", buf, 0x16u);
            }
            [v14 stopRecognitionForRequestID:v4];
            continue;
          }
        }
        else
        {
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          __int16 v19 = sh_log_object();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            id v20 = [v14 workerID];
            *(_DWORD *)buf = v21;
            long long v28 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Worker of type SHLocationProvider shutting down with worker ID %@", buf, 0xCu);
          }
        }
        [v14 shutdownWorker];
      }
      id v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

- (void)shutdownService
{
  id v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Shazam service stop called", buf, 2u);
  }

  id v4 = [(SHShazamKitService *)self serviceDelegate];
  id v5 = [v4 allWorkersForService:self];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "shutdownWorker", (void)v11);
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (SHServiceDelegate)serviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceDelegate);

  return (SHServiceDelegate *)WeakRetained;
}

- (void)setServiceDelegate:(id)a3
{
}

- (SHShazamKitClient)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHShazamKitClient *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHClientCredentials)clientCredentials
{
  return self->_clientCredentials;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCredentials, 0);
  objc_storeStrong((id *)&self->_privacyDisclosureManager, 0);
  objc_storeStrong((id *)&self->_matcherControllerProvider, 0);
  objc_storeStrong((id *)&self->_libraryClient, 0);
  objc_storeStrong((id *)&self->_audioTapProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventSignaller, 0);
  objc_storeStrong((id *)&self->_hapticsFetcher, 0);
  objc_storeStrong((id *)&self->_mediaItemFetcher, 0);
  objc_storeStrong((id *)&self->_libraryQueryManager, 0);

  objc_destroyWeak((id *)&self->_serviceDelegate);
}

@end