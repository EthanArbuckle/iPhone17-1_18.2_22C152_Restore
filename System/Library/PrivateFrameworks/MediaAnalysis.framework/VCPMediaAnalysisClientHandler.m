@interface VCPMediaAnalysisClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
+ (id)errorForStatus:(int)a3 withDescription:(id)a4;
+ (unint64_t)disablePhotosPostCaptureProcessing;
- (VCPMediaAnalysisClientHandler)init;
- (VCPMediaAnalysisClientHandler)initWithXPCConnection:(id)a3;
- (id).cxx_construct;
- (id)assetWithIdentifier:(id)a3 identifierType:(unint64_t)a4 fromPhotoLibraryWithURL:(id)a5 error:(id *)a6;
- (int64_t)consumeSandboxExtension:(id)a3 url:(id)a4;
- (void)_resetPECFailureVersionForPhotoLibrary:(id)a3;
- (void)_resetProcessingStatusForTaskID:(unint64_t)a3 andPhotoLibrary:(id)a4;
- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4;
- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 engagementSuggestionType:(id)a5;
- (void)cancelAllRequests;
- (void)cancelBackgroundActivityWithReply:(id)a3;
- (void)cancelRequest:(int)a3;
- (void)currentOutstandingTasksWithReply:(id)a3;
- (void)downloadVideoEncoderIfNeededWithReply:(id)a3;
- (void)endEntryPoint;
- (void)notifyLibraryAvailableAtURL:(id)a3;
- (void)queryAssetsPendingDeferredProcessingWithPhotoLibraryURL:(id)a3 andReply:(id)a4;
- (void)queryAutoCounterOptInStatus:(int)a3 withPhotoLibraryURL:(id)a4 personLocalIdentifiers:(id)a5 andReply:(id)a6;
- (void)queryImagePriority1MCEnableDateWithPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)queryPerformanceMeasurementsWithReply:(id)a3;
- (void)queryUserSafetyEnablement:(id)a3;
- (void)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5;
- (void)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)requestAssetAnalysis:(int)a3 forLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withOptions:(id)a6 analysisTypes:(unint64_t)a7 withReply:(id)a8;
- (void)requestAssetAnalysis:(int)a3 forPhotoLibraryURL:(id)a4 withLocalIdentifiers:(id)a5 realTime:(BOOL)a6 withReply:(id)a7;
- (void)requestAssetProcessing:(int)a3 withTaskID:(unint64_t)a4 forLocalIdentifiers:(id)a5 fromPhotoLibraryWithURL:(id)a6 withOptions:(id)a7 andReply:(id)a8;
- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 clusterStateURL:(id)a5 groundTruthURL:(id)a6 andReply:(id)a7;
- (void)requestAutoCounterSIMLValidation:(int)a3 withPhotoLibraryURL:(id)a4 simlGroundTruthURL:(id)a5 andReply:(id)a6;
- (void)requestClusterCacheValidation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestDatabaseRestoreFastPassProcessing:(int)a3 reply:(id)a4;
- (void)requestDeferredProcessingTypes:(id)a3 forAssetsWithLocalIdentifiers:(id)a4 withPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestDumpAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestFaceCandidatesforKeyFace:(int)a3 withPersonsWithLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestForceDeferredProcessing:(int)a3 andReply:(id)a4;
- (void)requestIdentificationOfFacesWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withRequestID:(int)a5 andReply:(id)a6;
- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forAssetWithCloudIdentifier:(id)a4 requestID:(int)a5 andReply:(id)a6;
- (void)requestImageProcessing:(id)a3 forAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 requestID:(int)a8 andReply:(id)a9;
- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forImageData:(id)a4 withUniformTypeIdentifier:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessingWithCloudIdentifierRequests:(id)a3 requestID:(int)a4 andReply:(id)a5;
- (void)requestLibraryProcessing:(int)a3 withTaskID:(unint64_t)a4 forPhotoLibraryURL:(id)a5 withOptions:(id)a6 andReply:(id)a7;
- (void)requestMediaAnalysisDatabaseAccessSandboxExtensionWithPhotoLibraryURL:(id)a3 andReply:(id)a4;
- (void)requestMediaAnalysisDatabaseBackup:(int)a3 withPhotoLibraryURL:(id)a4 forceBackup:(BOOL)a5 andReply:(id)a6;
- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestOTAMaintenance:(int)a3 options:(id)a4 reply:(id)a5;
- (void)requestOptInAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 persons:(id)a5 andReply:(id)a6;
- (void)requestPersonPreferenceForPhotoLibraryURL:(id)a3 andReply:(id)a4;
- (void)requestPersonPromoterStatus:(int)a3 withAdvancedFlag:(BOOL)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestPhotosFaceFastPassProcessing:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestPhotosSceneFastPassProcessing:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withRequestID:(int)a6 andReply:(id)a7;
- (void)requestRebuildPersons:(int)a3 withLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestRecentsProcessing:(int)a3 withTaskID:(unint64_t)a4 photoLibraryWithURL:(id)a5 reply:(id)a6;
- (void)requestReclusterFaces:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetFaceClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetFaceClusteringState:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetPersons:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetPetClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestStaticStickerScoring:(int)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6;
- (void)requestSuggestedMePersonIdentifier:(int)a3 withContext:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestSuggestedPersons:(int)a3 withPersonWithLocalIdentifier:(id)a4 toBeConfirmedPersonSuggestions:(id)a5 toBeRejectedPersonSuggestions:(id)a6 andPhotoLibraryURL:(id)a7 andReply:(id)a8;
- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestURLAssetAnalysis:(int)a3 forAssetWithResourcePaths:(id)a4 withOptions:(id)a5 analysisTypes:(unint64_t)a6 sandboxTokens:(id)a7 withReply:(id)a8;
- (void)requestUpdateKeyFacesOfPersons:(int)a3 withLocalIdentifiers:(id)a4 andForceUpdate:(BOOL)a5 andPhotoLibraryURL:(id)a6 andReply:(id)a7;
- (void)requestVIPModelStorageFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 andReply:(id)a5;
- (void)requestVideoFramesProcessing:(int)a3 withTaskID:(unint64_t)a4 frames:(id)a5 options:(id)a6 andReply:(id)a7;
- (void)requestVideoProcessing:(id)a3 asset:(id)a4 requestID:(int)a5 isIncremental:(BOOL)a6 reply:(id)a7;
- (void)requestVideoProcessing:(id)a3 assetIdentifier:(id)a4 identifierType:(unint64_t)a5 photoLibraryURL:(id)a6 requestID:(int)a7 isIncremental:(BOOL)a8 reply:(id)a9;
- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8;
- (void)requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)requestWallpaperUpgrade:(int)a3 atSourceURL:(id)a4 toDestinationURL:(id)a5 withOptions:(id)a6 sandboxTokens:(id)a7 andReply:(id)a8;
- (void)resetPerformanceMeasurements;
- (void)startEntryPointWithQueryID:(unint64_t)a3;
- (void)startEntryPointWithQueryID:(unint64_t)a3 andEvent:(unint64_t)a4;
- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8;
@end

@implementation VCPMediaAnalysisClientHandler

- (VCPMediaAnalysisClientHandler)init
{
  return 0;
}

- (VCPMediaAnalysisClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)VCPMediaAnalysisClientHandler;
  v6 = [(VCPMediaAnalysisClientHandler *)&v50 init];
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v7);
    [*p_connection setExportedObject:v7];
    id v9 = *p_connection;
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMediaAnalysisClientProtocol];
    [v9 setRemoteObjectInterface:v10];

    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMediaAnalysisServerProtocol];
    +[MADServicePrivate configureServerInterface:v11];
    v54[0] = objc_opt_class();
    v54[1] = objc_opt_class();
    v12 = +[NSArray arrayWithObjects:v54 count:2];
    v13 = +[NSSet setWithArray:v12];
    [v11 setClasses:v13 forSelector:"requestVideoFramesProcessing:withTaskID:frames:options:andReply:" argumentIndex:2 ofReply:0];

    [*p_connection setExportedInterface:v11];
    id v14 = *p_connection;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000545B8;
    v47[3] = &unk_1002198D0;
    objc_copyWeak(&v48, &location);
    [v14 setInterruptionHandler:v47];
    id v15 = *p_connection;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100054670;
    v45[3] = &unk_1002198D0;
    objc_copyWeak(&v46, &location);
    [v15 setInvalidationHandler:v45];
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaanalysisd.clientmanagment", 0);
    managementQueue = v7->_managementQueue;
    v7->_managementQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [*p_connection remoteObjectProxy];
    clientProxy = v7->_clientProxy;
    v7->_clientProxy = (VCPMediaAnalysisClientProtocol *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    taskIDMapping = v7->_taskIDMapping;
    v7->_taskIDMapping = (NSMutableDictionary *)v20;

    CFTypeRef v43 = 0;
    CFTypeRef cf = 0;
    if (*p_connection) {
      [*p_connection auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    *(void *)buf = SecTaskCreateWithAuditToken(0, &token);
    sub_10000636C((const void **)&v7->_secTask.value_, (const void **)buf);
    sub_100004484((const void **)buf);
    value = v7->_secTask.value_;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    CFStringRef v23 = SecTaskCopySigningIdentifier(value, (CFErrorRef *)&cf);
    clientBundleID = v7->_clientBundleID;
    v7->_clientBundleID = &v23->isa;

    if (v43)
    {
      CFRelease(v43);
      CFTypeRef v43 = 0;
    }
    uint64_t v25 = SecTaskCopyTeamIdentifier();
    clientTeamID = v7->_clientTeamID;
    v7->_clientTeamID = (NSString *)v25;

    if (cf && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v27 = v5;
      v28 = VCPLogInstance();
      os_log_type_t v29 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v28, v29))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = cf;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "[MAClientHandler] Failed to query client bundle ID (%@)", buf, 0xCu);
      }

      id v5 = v27;
    }
    if (v43 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v30 = v5;
      v31 = VCPLogInstance();
      os_log_type_t v32 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v43;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "[MAClientHandler] Failed to query client team ID (%@)", buf, 0xCu);
      }

      id v5 = v30;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v33 = v5;
      v34 = VCPLogInstance();
      os_log_type_t v35 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v34, v35))
      {
        v36 = v7->_clientBundleID;
        v37 = v7->_clientTeamID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v36;
        __int16 v52 = 2112;
        v53 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "[MAClientHandler] Client BundleID: %@ TeamID: %@", buf, 0x16u);
      }

      id v5 = v33;
    }
    v7->_userSafetyEntitled = +[MADUserSafetySettings isTaskEntitled:v7->_secTask.value_];
    v38 = [[MADServiceClientTaskQueuingScheduler alloc] initWithClientBundleID:v7->_clientBundleID];
    queuingTaskScheduler = v7->_queuingTaskScheduler;
    v7->_queuingTaskScheduler = v38;

    v40 = v7;
    sub_100004484(&v43);
    sub_100004484(&cf);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);

    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithXPCConnection:v3];

  return v4;
}

+ (id)errorForStatus:(int)a3 withDescription:(id)a4
{
  id v5 = a4;
  if (a3 == -128)
  {
    v6 = @"[MAClientHandler] Analysis was canceled";
  }
  else
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_14;
    }
    if (a3 == -50) {
      +[NSString stringWithFormat:@"[MAClientHandler] Invalid parameter - %@", v5];
    }
    else {
    v6 = +[NSString stringWithFormat:@"[MAClientHandler] Analysis failed - %@", v5];
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@", buf, 0xCu);
    }
  }
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  v13 = v6;
  v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v7 = +[NSError errorWithDomain:@"MediaAnalysisService" code:a3 userInfo:v10];

LABEL_14:
  return v7;
}

- (void)requestMediaAnalysisDatabaseAccessSandboxExtensionWithPhotoLibraryURL:(id)a3 andReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = +[VCPPhotoLibraryManager sharedManager];
  v8 = [v7 photoLibraryWithURL:v5];

  if (v8)
  {
    objc_msgSend(v8, "vcp_mediaAnalysisDirectory");
    id v9 = objc_claimAutoreleasedReturnValue();
    [v9 UTF8String];
    v10 = (void *)sandbox_extension_issue_file();
    if (v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v11, v12))
        {
          int v19 = 138412290;
          id v20 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MAClientHandler] Issuing sandbox extension for %@", (uint8_t *)&v19, 0xCu);
        }
      }
      v13 = +[NSString stringWithUTF8String:v10];
      v6[2](v6, v13);

      free(v10);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v17, v18))
        {
          int v19 = 138412290;
          id v20 = v9;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "[MAClientHandler] Failed to issue sandbox extension on %@", (uint8_t *)&v19, 0xCu);
        }
      }
      v6[2](v6, 0);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v14, v15))
      {
        dispatch_queue_t v16 = [v5 path];
        int v19 = 138412290;
        id v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MAClientHandler] Failed to open Photos Library at %@; cannot issue sandbox extension",
          (uint8_t *)&v19,
          0xCu);
      }
    }
    v6[2](v6, 0);
  }
}

- (int64_t)consumeSandboxExtension:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 fileSystemRepresentation];
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  int v10 = sandbox_check_by_audit_token();
  if (v10 == -1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = v8;
        v13 = "[MAClientHandler] Failed to check for client read access to file %s";
        goto LABEL_11;
      }
LABEL_12:
      int64_t v14 = -1;
LABEL_13:

      goto LABEL_19;
    }
LABEL_18:
    int64_t v14 = -1;
    goto LABEL_19;
  }
  if (v10 == 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = v8;
        v13 = "[MAClientHandler] Client does not have read access to file %s";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v13, buf, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  objc_msgSend(v6, "UTF8String", v8);
  int64_t v14 = sandbox_extension_consume();
  if (v14 < 0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v11 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v11, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v15, "[MAClientHandler] Failed to consume sandbox extension", buf, 2u);
    }
    goto LABEL_13;
  }
LABEL_19:

  return v14;
}

- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  surface = (__IOSurface *)a4;
  id v15 = a6;
  dispatch_queue_t v16 = (void (**)(id, void, void *))a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[MAClientHandler] Received on-demand image processing request (CVPixelBuffer) with MADRequestID %d", buf, 8u);
    }
  }
  id v33 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v15];
  id v20 = VCPSignPostLog();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  v22 = VCPSignPostLog();
  CFStringRef v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMediaAnalysisClientHandler_IOSurface", "%@", buf, 0xCu);
  }

  *(void *)buf = 0;
  CVReturn v24 = CVPixelBufferCreateWithIOSurface(0, surface, 0, (CVPixelBufferRef *)buf);
  if (v24)
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    uint64_t v25 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to create CVPixelBuffer from specified IOSurface"];
    v45 = v25;
    v26 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v27 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v24 userInfo:v26];
    v16[2](v16, 0, v27);
  }
  else
  {
    uint64_t v25 = +[VCPMADServiceImageAsset assetWithPixelBuffer:*(void *)buf orientation:v11 identifier:v15 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v28 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v25 setUserSafetyEligible:v28];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100055470;
    v37[3] = &unk_10021B420;
    int v43 = v9;
    os_signpost_id_t v41 = v21;
    id v29 = v33;
    id v38 = v29;
    uint64_t v42 = 0;
    id v30 = v16;
    id v40 = v30;
    id v39 = v14;
    v31 = +[VCPMADServiceImageProcessingTask taskWithRequests:v39 forAsset:v25 cancelBlock:&stru_10021B3F8 andCompletionHandler:v37];
    [v31 setSignpostPayload:v29];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100055624;
    v35[3] = &unk_100219940;
    v36 = v30;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v31 withRequestID:(int)v9 schedulingErrorHandler:v35];

    v26 = v38;
  }

  sub_100004484((const void **)buf);
}

- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v32 = a3;
  id v36 = a4;
  id v34 = a5;
  id v14 = a6;
  os_log_type_t v35 = (void (**)(id, void, void *))a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v51) = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[MAClientHandler] Received on-demand image processing request (URL) with MADRequestID %d", buf, 8u);
    }
  }
  id v33 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v14];
  os_log_type_t v18 = VCPSignPostLog();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  id v20 = VCPSignPostLog();
  os_signpost_id_t v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCPMediaAnalysisClientHandler_URL", "%@", buf, 0xCu);
  }

  int64_t v22 = [(VCPMediaAnalysisClientHandler *)self consumeSandboxExtension:v34 url:v36];
  if (v22 < 0)
  {
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    CFStringRef v23 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to consume sandbox extension"];
    v49 = v23;
    uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
    v35[2](v35, 0, v26);
  }
  else
  {
    CFStringRef v23 = +[VCPMADServiceImageAsset assetWithURL:v36 identifier:v14 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v24 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v23 setUserSafetyEligible:v24];
    id v27 = v17;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100055BA4;
    v40[3] = &unk_10021B468;
    int v47 = v9;
    os_signpost_id_t v44 = v19;
    id v28 = v33;
    id v41 = v28;
    uint64_t v45 = 0;
    id v29 = v35;
    id v43 = v29;
    id v42 = v32;
    int64_t v46 = v22;
    id v30 = +[VCPMADServiceImageProcessingTask taskWithRequests:v42 forAsset:v23 cancelBlock:&stru_10021B440 andCompletionHandler:v40];
    [v30 setSignpostPayload:v28];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100055D60;
    v37[3] = &unk_1002199B0;
    id v38 = v29;
    int64_t v39 = v22;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v30 withRequestID:(int)v9 schedulingErrorHandler:v37];

    v17 = v27;
    uint64_t v25 = v41;
  }
}

- (void)requestImageProcessing:(id)a3 forImageData:(id)a4 withUniformTypeIdentifier:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v34 = a3;
  id v14 = a4;
  id v15 = a5;
  id v36 = a6;
  id v35 = a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[MAClientHandler] Received on-demand image processing request (ImageData) with MADRequestID %d", buf, 8u);
    }
  }
  os_signpost_id_t v19 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v36];
  id v20 = VCPSignPostLog();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  int64_t v22 = VCPSignPostLog();
  CFStringRef v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    int v47 = v19;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMediaAnalysisClientHandler_URL", "%@", buf, 0xCu);
  }

  BOOL v24 = +[VCPMADServiceImageAsset assetWithImageData:v14 uniformTypeIdentifier:v15 identifier:v36 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
  id v33 = v15;
  BOOL v25 = self->_userSafetyEntitled
     && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
  [v24 setUserSafetyEligible:v25];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100056250;
  v39[3] = &unk_10021B420;
  int v45 = v9;
  os_signpost_id_t v43 = v21;
  id v26 = v19;
  id v40 = v26;
  uint64_t v44 = 0;
  id v27 = v35;
  id v42 = v27;
  id v28 = v34;
  id v41 = v28;
  id v29 = +[VCPMADServiceImageProcessingTask taskWithRequests:v28 forAsset:v24 cancelBlock:&stru_10021B488 andCompletionHandler:v39];
  [v29 setSignpostPayload:v26];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v31 = (int)v9;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100056404;
  v37[3] = &unk_100219940;
  id v32 = v27;
  id v38 = v32;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v29 withRequestID:v31 schedulingErrorHandler:v37];
}

- (id)assetWithIdentifier:(id)a3 identifierType:(unint64_t)a4 fromPhotoLibraryWithURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v9)
  {
    if (!a6)
    {
      BOOL v24 = 0;
      goto LABEL_38;
    }
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    os_log_type_t v16 = +[NSString stringWithFormat:@"[MAClientHandler] Specified nil identifier"];
    int64_t v46 = v16;
    os_signpost_id_t v19 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    CFStringRef v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v19];
    BOOL v24 = 0;
    BOOL v25 = *a6;
    *a6 = v23;
    goto LABEL_36;
  }
  if (a4 == 2 && !v10)
  {
    uint64_t v12 = +[PHPhotoLibrary wellKnownPhotoLibraryURLForIdentifier:3];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Fetch Syndication Photo library at %@", buf, 0xCu);
      }
    }
    uint64_t v11 = (void *)v12;
  }
  id v15 = +[VCPPhotoLibraryManager sharedManager];
  os_log_type_t v16 = [v15 photoLibraryWithURL:v11];

  if (!v16)
  {
    if (!a6)
    {
      BOOL v24 = 0;
      goto LABEL_37;
    }
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    os_signpost_id_t v19 = +[NSString stringWithFormat:@"[MAClientHandler] Specified Photo Library is invalid (%@)", v11];
    id v42 = v19;
    BOOL v25 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
    id v27 = *a6;
    *a6 = v26;

    goto LABEL_35;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = (uint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[MAClientHandler] Fetching Photos asset with identifier %@", buf, 0xCu);
    }
  }
  os_signpost_id_t v19 = +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v16];
  [v19 setIncludeHiddenAssets:1];
  [v19 setIncludeTrashedAssets:1];
  [v19 setIncludeGuestAssets:1];
  v40[0] = PHAssetPropertySetCharacterRecognition;
  v40[1] = PHAssetPropertySetMediaAnalysis;
  v40[2] = PHAssetPropertySetOriginalMetadata;
  v40[3] = PHAssetPropertySetPhotoIris;
  void v40[4] = PHAssetPropertySetSceneAnalysis;
  v40[5] = PHAssetPropertySetVisualSearch;
  v40[6] = PHAssetPropertySetPhotosInfoPanelExtended;
  id v20 = +[NSArray arrayWithObjects:v40 count:7];
  [v19 addFetchPropertySets:v20];

  if (a4 == 1)
  {
    id v38 = v9;
    os_signpost_id_t v21 = +[NSArray arrayWithObjects:&v38 count:1];
    uint64_t v22 = +[PHAsset fetchAssetsWithCloudIdentifiers:v21 options:v19];
  }
  else if (a4)
  {
    if (a4 != 2)
    {
      BOOL v25 = 0;
      goto LABEL_26;
    }
    id v37 = v9;
    os_signpost_id_t v21 = +[NSArray arrayWithObjects:&v37 count:1];
    uint64_t v22 = +[PHAsset fetchAssetsWithSyndicationIdentifiers:v21 options:v19];
  }
  else
  {
    id v39 = v9;
    os_signpost_id_t v21 = +[NSArray arrayWithObjects:&v39 count:1];
    uint64_t v22 = +[PHAsset fetchAssetsWithLocalIdentifiers:v21 options:v19];
  }
  BOOL v25 = (void *)v22;

LABEL_26:
  if ([v25 count])
  {
    if ((unint64_t)[v25 count] >= 2 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v28 = VCPLogInstance();
      os_log_type_t v29 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v28, v29))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = (uint64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "[MAClientHandler] Fetch returned multiple assets for identifier (%@)", buf, 0xCu);
      }
    }
    BOOL v24 = [v25 firstObject];
    goto LABEL_36;
  }
  if (a6)
  {
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    id v30 = +[NSString stringWithFormat:@"[MAClientHandler] Specified identifier not found (%@)", v9];
    id v36 = v30;
    uint64_t v31 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v32 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v31];
    id v33 = *a6;
    *a6 = v32;
  }
LABEL_35:
  BOOL v24 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

  return v24;
}

- (void)requestImageProcessing:(id)a3 forAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v31 = a6;
  id v32 = a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[MAClientHandler] Received on-demand image processing request (Photos) with MADRequestID %d", buf, 8u);
    }
  }
  id v30 = +[NSString stringWithFormat:@"Request: %d Identifier: (%lu)%@", v9, a5, v15];
  os_signpost_id_t v19 = VCPSignPostLog();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  os_signpost_id_t v21 = VCPSignPostLog();
  uint64_t v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v30;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPMediaAnalysisClientHandler_PHAsset", "%@", buf, 0xCu);
  }

  *(void *)buf = 0;
  CFStringRef v23 = [(VCPMediaAnalysisClientHandler *)self assetWithIdentifier:v15 identifierType:a5 fromPhotoLibraryWithURL:v31 error:buf];
  if (v23)
  {
    BOOL v24 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v23 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v25 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v24 setUserSafetyEligible:v25];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100056FA8;
    v35[3] = &unk_10021B420;
    int v41 = v9;
    os_signpost_id_t v39 = v20;
    id v26 = v30;
    id v36 = v26;
    uint64_t v40 = 0;
    id v27 = v32;
    id v38 = v27;
    id v37 = v14;
    id v28 = +[VCPMADServiceImageProcessingTask taskWithRequests:v37 forAsset:v24 cancelBlock:&stru_10021B4A8 andCompletionHandler:v35];
    [v28 setSignpostPayload:v26];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10005715C;
    v33[3] = &unk_100219940;
    id v34 = v27;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v28 withRequestID:(int)v9 schedulingErrorHandler:v33];
  }
  else
  {
    (*((void (**)(id, void, void))v32 + 2))(v32, 0, *(void *)buf);
  }
}

- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 requestID:(int)a8 andReply:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  surface = (__IOSurface *)a4;
  id v16 = a6;
  id v37 = a7;
  os_log_type_t v17 = (void (**)(id, void, void *))a9;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v18 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "[MAClientHandler] Received on-demand image processing request (Photos+IOSurface) with MADRequestID %d", buf, 8u);
    }
  }
  NSErrorUserInfoKey v35 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v16];
  os_signpost_id_t v20 = VCPSignPostLog();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  uint64_t v22 = VCPSignPostLog();
  CFStringRef v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v35;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMediaAnalysisClientHandler_PHAsset", "%@", buf, 0xCu);
  }

  *(void *)buf = 0;
  BOOL v24 = [(VCPMediaAnalysisClientHandler *)self assetWithIdentifier:v16 identifierType:0 fromPhotoLibraryWithURL:v37 error:buf];
  if (v24)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    CVReturn v25 = CVPixelBufferCreateWithIOSurface(0, surface, 0, &pixelBufferOut);
    if (v25)
    {
      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      id v26 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to create CVPixelBuffer from specified IOSurface"];
      v49 = v26;
      id v27 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      id v28 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v25 userInfo:v27];
      v17[2](v17, 0, v28);
    }
    else
    {
      id v26 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v24 pixelBuffer:pixelBufferOut orientation:v12 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
      BOOL v29 = self->_userSafetyEntitled
         && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
      [v26 setUserSafetyEligible:v29];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100057750;
      v40[3] = &unk_10021B420;
      int v46 = v9;
      os_signpost_id_t v44 = v21;
      id v30 = v35;
      id v41 = v30;
      uint64_t v45 = 0;
      id v31 = v17;
      id v43 = v31;
      id v42 = v15;
      id v32 = +[VCPMADServiceImageProcessingTask taskWithRequests:v42 forAsset:v26 cancelBlock:&stru_10021B4C8 andCompletionHandler:v40];
      [v32 setSignpostPayload:v30];
      queuingTaskScheduler = self->_queuingTaskScheduler;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100057904;
      v38[3] = &unk_100219940;
      os_signpost_id_t v39 = v31;
      [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v32 withRequestID:(int)v9 schedulingErrorHandler:v38];

      id v27 = v41;
    }

    sub_100004484((const void **)&pixelBufferOut);
  }
  else
  {
    v17[2](v17, 0, *(void **)buf);
  }
}

- (void)requestImageProcessing:(id)a3 forAssetWithCloudIdentifier:(id)a4 requestID:(int)a5 andReply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v39 = a4;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v54) = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MAClientHandler] Received on-demand image processing request (Photos) with MADRequestID %d", buf, 8u);
    }
  }
  id v38 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v7, v39];
  id v14 = VCPSignPostLog();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  id v16 = VCPSignPostLog();
  os_log_type_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v38;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VCPMediaAnalysisClientHandler_PHAsset", "%@", buf, 0xCu);
  }

  os_log_type_t v18 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  if (objc_msgSend(v18, "vcp_isCPLEnabled"))
  {
    id v52 = 0;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412546;
        id v54 = v39;
        __int16 v55 = 1024;
        int v56 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MAClientHandler] Process asset (%@) for MADRequestID %d", buf, 0x12u);
      }
    }
    os_signpost_id_t v21 = [v18 photoLibraryURL];
    uint64_t v22 = [(VCPMediaAnalysisClientHandler *)self assetWithIdentifier:v39 identifierType:1 fromPhotoLibraryWithURL:v21 error:&v52];

    if (v22)
    {
      id v36 = +[VCPMADServiceImageAsset assetWithPhotosAsset:v22 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
      BOOL v23 = self->_userSafetyEntitled
         && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
      [v36 setUserSafetyEligible:v23];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000580A4;
      v44[3] = &unk_10021B510;
      int v51 = v7;
      os_signpost_id_t v49 = v15;
      id v31 = v38;
      id v45 = v31;
      uint64_t v50 = 0;
      id v32 = v39;
      id v46 = v32;
      id v33 = v11;
      id v48 = v33;
      id v47 = v10;
      id v34 = +[VCPMADServiceImageProcessingTask taskWithRequests:v47 forAsset:v36 cancelBlock:&stru_10021B4E8 andCompletionHandler:v44];
      [v34 setSignpostPayload:v31];
      queuingTaskScheduler = self->_queuingTaskScheduler;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100058368;
      v40[3] = &unk_10021B538;
      id v41 = v32;
      int v43 = v7;
      id v42 = v33;
      [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v34 withRequestID:(int)v7 schedulingErrorHandler:v40];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        BOOL v29 = VCPLogInstance();
        os_log_type_t v30 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138412802;
          id v54 = v39;
          __int16 v55 = 1024;
          int v56 = v7;
          __int16 v57 = 2112;
          id v58 = v52;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "[MAClientHandler] Failed to fetch asset (%@) for MADRequestID %d - %@", buf, 0x1Cu);
        }
      }
      (*((void (**)(id, void, id))v11 + 2))(v11, 0, v52);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v54) = v7;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[MAClientHandler] iCloud photo library is not enabled for MADRequestID %d", buf, 8u);
      }
    }
    NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
    id v26 = +[NSString stringWithFormat:@"iCloud photo library is not enabled"];
    v60 = v26;
    id v27 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v28 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v27];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v28);
  }
}

- (void)requestImageProcessingWithCloudIdentifierRequests:(id)a3 requestID:(int)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MAClientHandler] Received on-demand image processing request (Photos) with MADRequestID %d", buf, 8u);
    }
  }
  uint64_t v12 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
  if (objc_msgSend(v12, "vcp_isCPLEnabled"))
  {
    id v24 = v8;
    os_log_type_t v13 = +[NSString stringWithFormat:@"MADRequestID: %d", v6];
    clientBundleID = self->_clientBundleID;
    clientTeamID = self->_clientTeamID;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000588DC;
    v29[3] = &unk_10021B580;
    int v32 = v6;
    id v16 = v9;
    id v31 = v16;
    id v17 = v8;
    id v30 = v17;
    os_log_type_t v18 = +[VCPMADServiceImageProcessingTaskBatch taskWithCloudIdentifierRequests:v17 photoLibrary:v12 clientBundleID:clientBundleID clientTeamID:clientTeamID cancelBlock:&stru_10021B558 andCompletionHandler:v29];
    [v18 setSignpostPayload:v13];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100058A78;
    v25[3] = &unk_10021B538;
    id v26 = v17;
    int v28 = v6;
    id v27 = v16;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v18 withRequestID:(int)v6 schedulingErrorHandler:v25];

    id v8 = v24;
    os_log_type_t v20 = v31;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_signpost_id_t v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 67109120;
        int v36 = v6;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[MAClientHandler] iCloud photo library is not enabled for MADRequestID %d", buf, 8u);
      }
    }
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    os_log_type_t v13 = +[NSString stringWithFormat:@"iCloud photo library is not enabled"];
    id v34 = v13;
    os_log_type_t v20 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    BOOL v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v20];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v23);
  }
}

- (void)requestVideoProcessing:(id)a3 asset:(id)a4 requestID:(int)a5 isIncremental:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v28 = a7;
  id v14 = [v13 identifier];
  BOOL v29 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v14];

  os_signpost_id_t v15 = VCPSignPostLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  id v17 = VCPSignPostLog();
  os_log_type_t v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138412290;
    int v43 = v29;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPMediaAnalysisClientHandler_VideoE2E", "%@", buf, 0xCu);
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100058F90;
  v40[3] = &unk_1002199D8;
  void v40[4] = self;
  int v41 = v9;
  os_log_type_t v19 = objc_retainBlock(v40);
  if (v8)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100058FAC;
    v38[3] = &unk_10021B5A8;
    void v38[4] = self;
    int v39 = v9;
    os_log_type_t v20 = objc_retainBlock(v38);
  }
  else
  {
    os_log_type_t v20 = 0;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100058FD8;
  v32[3] = &unk_10021B5F0;
  int v37 = v9;
  os_signpost_id_t v35 = v16;
  id v21 = v29;
  id v33 = v21;
  uint64_t v36 = 0;
  id v22 = v28;
  id v34 = v22;
  BOOL v23 = +[MADServiceVideoProcessingTask taskWithRequests:v12 forAsset:v13 cancelBlock:&stru_10021B5C8 progressHandler:v19 resultHandler:v20 andCompletionHandler:v32];
  id v24 = v12;
  [v23 setSignpostPayload:v21];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v26 = (int)v9;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000591A4;
  v30[3] = &unk_100219940;
  id v27 = v22;
  id v31 = v27;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v23 withRequestID:v26 schedulingErrorHandler:v30];
}

- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  os_log_type_t v18 = (void (**)(id, void, void *))a8;
  int64_t v19 = [(VCPMediaAnalysisClientHandler *)self consumeSandboxExtension:v16 url:v15];
  if (v19 < 0)
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    os_log_type_t v20 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to consume sandbox extension"];
    id v28 = v20;
    id v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    BOOL v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v22];
    v18[2](v18, 0, v23);
  }
  else
  {
    os_log_type_t v20 = +[MADServiceVideoAsset assetWithURL:v15 identifier:v17 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v21 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v20 setUserSafetyEligible:v21];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100059488;
    v24[3] = &unk_10021B618;
    int64_t v26 = v19;
    os_log_type_t v25 = v18;
    [(VCPMediaAnalysisClientHandler *)self requestVideoProcessing:v14 asset:v20 requestID:v9 isIncremental:0 reply:v24];
    id v22 = v25;
  }
}

- (void)requestVideoProcessing:(id)a3 assetIdentifier:(id)a4 identifierType:(unint64_t)a5 photoLibraryURL:(id)a6 requestID:(int)a7 isIncremental:(BOOL)a8 reply:(id)a9
{
  BOOL v9 = a8;
  uint64_t v10 = *(void *)&a7;
  id v15 = a3;
  id v16 = (void (**)(id, void, id))a9;
  id v20 = 0;
  id v17 = [(VCPMediaAnalysisClientHandler *)self assetWithIdentifier:a4 identifierType:a5 fromPhotoLibraryWithURL:a6 error:&v20];
  if (v17)
  {
    os_log_type_t v18 = +[MADServiceVideoAsset assetWithPhotosAsset:v17 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v19 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v18 setUserSafetyEligible:v19];
    [(VCPMediaAnalysisClientHandler *)self requestVideoProcessing:v15 asset:v18 requestID:v10 isIncremental:v9 reply:v16];
  }
  else
  {
    v16[2](v16, 0, v20);
  }
}

- (void)requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v37 = +[NSString stringWithFormat:@"[MAClientHandler][VUGalleryDirectoryURLAccess]"];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412546;
      id v48 = v37;
      __int16 v49 = 2112;
      id v50 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Received request for vision cache storage directory URL (%@)", buf, 0x16u);
    }
  }
  if (v5)
  {
    BOOL v9 = +[VCPPhotoLibraryManager sharedManager];
    uint64_t v10 = [v9 photoLibraryWithURL:v5];

    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v10 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    if (v10)
    {
LABEL_7:
      uint64_t v36 = objc_msgSend(v10, "vcp_visionCacheStorageDirectoryURL");
      os_log_type_t v11 = [v36 URLByAppendingPathComponent:@"VUIndex.sqlite"];
      if (!v11)
      {
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        id v13 = +[NSString stringWithFormat:@"%@ Failed to query VUIndex URL for library %@", v37, v5];
        id v44 = v13;
        os_signpost_id_t v35 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        id v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -18);
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v14);
LABEL_41:

        goto LABEL_42;
      }
      id v38 = 0;
      id v12 = [objc_alloc((Class)VUWGallery) initWithPath:v11 error:&v38];
      id v13 = v38;
      os_signpost_id_t v35 = v12;
      if (v12)
      {
        id v14 = objc_msgSend(v10, "vcp_visionCacheStorageDirectoryURL");
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v15 = VCPLogInstance();
          os_log_type_t v16 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)buf = 138412546;
            id v48 = v37;
            __int16 v49 = 2112;
            id v50 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Creating sandbox extension for directory %@", buf, 0x16u);
          }
        }
        id v17 = [v14 path];
        [v17 UTF8String];
        os_log_type_t v18 = (void *)sandbox_extension_issue_file();

        if (v18)
        {
          BOOL v19 = +[NSString stringWithUTF8String:v18];
          free(v18);
          if ([v19 length])
          {
            id v20 = v19;
            id v21 = [v20 UTF8String];
            id v22 = v20;
            BOOL v23 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v21, strlen((const char *)[v22 UTF8String]) + 1);

            if (v23)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                id v24 = VCPLogInstance();
                os_log_type_t v25 = VCPLogToOSLogType[7];
                if (os_log_type_enabled(v24, v25))
                {
                  *(_DWORD *)buf = 138412290;
                  id v48 = v37;
                  _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ Returning sandbox extension for vision cache storage directory URL ...", buf, 0xCu);
                }
              }
              (*((void (**)(id, void *, void *, void))v6 + 2))(v6, v14, v23, 0);
              goto LABEL_40;
            }
          }
          else
          {
          }
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v31 = VCPLogInstance();
          os_log_type_t v32 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v31, v32))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v37;
            _os_log_impl((void *)&_mh_execute_header, v31, v32, "%@ Failed to generate sandbox extension", buf, 0xCu);
          }
        }
        NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
        id v30 = +[NSString stringWithFormat:@"%@ Failed to generate sandbox extension", v37];
        uint64_t v40 = v30;
        id v33 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v34 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v33];
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v34);

        BOOL v23 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v28 = VCPLogInstance();
          os_log_type_t v29 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v28, v29))
          {
            *(_DWORD *)buf = 138412546;
            id v48 = v37;
            __int16 v49 = 2112;
            id v50 = v10;
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "%@ Failed to obtain gallery for Photo Library (%@)", buf, 0x16u);
          }
        }
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        id v14 = +[NSString stringWithFormat:@"%@ Failed to obtain Gallery for Photo Library", v37];
        id v42 = v14;
        BOOL v23 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v30 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v23];
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v30);
      }

LABEL_40:
      goto LABEL_41;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int64_t v26 = VCPLogInstance();
    os_log_type_t v27 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v26, v27))
    {
      *(_DWORD *)buf = 138412546;
      id v48 = v37;
      __int16 v49 = 2112;
      id v50 = v5;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ Failed to obtain specified Photo Library (%@)", buf, 0x16u);
    }
  }
  NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
  uint64_t v36 = +[NSString stringWithFormat:@"%@ Failed to obtain specified Photo Library", v37];
  id v46 = v36;
  os_log_type_t v11 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  id v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v11];
  (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v13);
LABEL_42:
}

- (void)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5
{
  id v7 = a4;
  os_log_type_t v8 = (void (**)(id, id, void))a5;
  id v33 = +[NSString stringWithFormat:@"[MAClientHandler][VUGalleryAssetCount]"];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    BOOL v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v36 = v33;
      __int16 v37 = 1024;
      *(_DWORD *)id v38 = a3;
      *(_WORD *)&void v38[4] = 2112;
      *(void *)&v38[6] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Received request to query VU index asset count for type %d (%@)", buf, 0x1Cu);
    }
  }
  if (v7)
  {
    os_log_type_t v11 = +[VCPPhotoLibraryManager sharedManager];
    id v12 = [v11 photoLibraryWithURL:v7];

    if (v12) {
      goto LABEL_7;
    }
  }
  else
  {
    id v12 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    if (v12)
    {
LABEL_7:
      os_log_type_t v32 = objc_msgSend(v12, "vcp_visionCacheStorageDirectoryURL");
      id v13 = [v32 URLByAppendingPathComponent:@"VUIndex.sqlite"];
      if (v13)
      {
        id v34 = 0;
        id v14 = [objc_alloc((Class)VUWGallery) initWithPath:v13 error:&v34];
        id v15 = v34;
        if (v14)
        {
          os_log_type_t v16 = VCPSignPostLog();
          os_signpost_id_t v17 = os_signpost_id_generate(v16);

          os_log_type_t v18 = VCPSignPostLog();
          BOOL v19 = v18;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v36) = a3;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMediaAnalysisClientHandler_VUGalleryAssetCountForType", "%d", buf, 8u);
          }

          id v31 = [v14 assetCountForType:a3];
          id v20 = VCPSignPostLog();
          id v21 = v20;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v36) = a3;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v17, "VCPMediaAnalysisClientHandler_VUGalleryAssetCountForType", "%d", buf, 8u);
          }

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v22 = VCPLogInstance();
            os_log_type_t v23 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v22, v23))
            {
              *(_DWORD *)buf = 138413058;
              uint64_t v36 = v33;
              __int16 v37 = 1024;
              *(_DWORD *)id v38 = a3;
              *(_WORD *)&void v38[4] = 2112;
              *(void *)&v38[6] = v7;
              __int16 v39 = 1024;
              int v40 = (int)v31;
              _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Queried asset count for type %d for Photo Library (%@): %d", buf, 0x22u);
            }
          }
          v8[2](v8, v31, 0);
          goto LABEL_33;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v27 = VCPLogInstance();
          os_log_type_t v28 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v27, v28))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = v33;
            __int16 v37 = 2112;
            *(void *)id v38 = v7;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Failed to obtain VU gallery for Photo Library (%@)", buf, 0x16u);
          }
        }
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        int64_t v26 = +[NSString stringWithFormat:@"%@ Failed to obtain VU gallery for Photo Library (%@)", v33, v7];
        id v42 = v26;
        os_log_type_t v29 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v30 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v29];
        ((void (**)(id, id, void *))v8)[2](v8, 0, v30);
      }
      else
      {
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        id v15 = +[NSString stringWithFormat:@"%@ Failed to query VUIndex URL for library %@", v33, v7];
        id v44 = v15;
        id v14 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        int64_t v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v14];
        ((void (**)(id, id, void *))v8)[2](v8, 0, v26);
      }

LABEL_33:
      goto LABEL_34;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v24 = VCPLogInstance();
    os_log_type_t v25 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v33;
      __int16 v37 = 2112;
      *(void *)id v38 = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ Failed to obtain specified Photo Library (%@)", buf, 0x16u);
    }
  }
  NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
  os_log_type_t v32 = +[NSString stringWithFormat:@"%@ Failed to obtain specified Photo Library (%@)", v33, v7];
  id v46 = v32;
  id v13 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  id v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v13];
  ((void (**)(id, id, id))v8)[2](v8, 0, v15);
LABEL_34:
}

- (void)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = +[NSString stringWithFormat:@"[MAClientHandler][VUFullModeClusterDate]"];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ Received request to query VU last full-mode cluster date (%@)", buf, 0x16u);
    }
  }
  if (v5)
  {
    os_log_type_t v10 = +[VCPPhotoLibraryManager sharedManager];
    os_log_type_t v11 = [v10 photoLibraryWithURL:v5];

    if (v11)
    {
LABEL_7:
      id v12 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v11];
      if ([v12 keyExistsInKeyValueStore:@"MediaAnalysisImagePriority1LastFullModeClusterTimestamp"])
      {
        id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v12 valueForKey:@"MediaAnalysisImagePriority1LastFullModeClusterTimestamp"]);
      }
      else
      {
        id v13 = 0;
      }
      +[VCPDatabaseManager releaseSharedDatabaseForPhotoLibrary:v11];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_signpost_id_t v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v17, v18))
        {
          CFStringRef v19 = @"is";
          *(_DWORD *)buf = 138413058;
          id v21 = v7;
          if (!v13) {
            CFStringRef v19 = @"is NOT";
          }
          __int16 v22 = 2112;
          id v23 = v5;
          __int16 v24 = 2112;
          CFStringRef v25 = v19;
          __int16 v26 = 2112;
          os_log_type_t v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ VU index for Photo Library (%@) %@ full-mode clustered (last clustered date: %@)", buf, 0x2Au);
        }
      }
      v6[2](v6, v13, 0);
      goto LABEL_23;
    }
  }
  else
  {
    os_log_type_t v11 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    if (v11) {
      goto LABEL_7;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ Failed to obtain specified Photo Library (%@)", buf, 0x16u);
    }
  }
  NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
  id v12 = +[NSString stringWithFormat:@"%@ Failed to obtain specified Photo Library (%@)", v7, v5];
  os_log_type_t v29 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  os_log_type_t v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v13];
  ((void (**)(id, void *, void *))v6)[2](v6, 0, v16);

LABEL_23:
}

- (void)queryImagePriority1MCEnableDateWithPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = +[NSString stringWithFormat:@"[MAClientHandler][ImagePriority1MCEnableDate]"];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ Received request to query image priority 1 MC enable date (%@)", buf, 0x16u);
    }
  }
  if (v5)
  {
    os_log_type_t v10 = +[VCPPhotoLibraryManager sharedManager];
    os_log_type_t v11 = [v10 photoLibraryWithURL:v5];

    if (v11)
    {
LABEL_7:
      id v12 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v11];
      if ([v12 keyExistsInKeyValueStore:@"MediaAnalysisImagePriority1MCEnableTimestamp"])
      {
        id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v12 valueForKey:@"MediaAnalysisImagePriority1MCEnableTimestamp"]);
      }
      else
      {
        id v13 = 0;
      }
      +[VCPDatabaseManager releaseSharedDatabaseForPhotoLibrary:v11];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_signpost_id_t v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v17, v18))
        {
          CFStringRef v19 = @"is";
          *(_DWORD *)buf = 138413058;
          id v21 = v7;
          if (!v13) {
            CFStringRef v19 = @"is NOT";
          }
          __int16 v22 = 2112;
          id v23 = v5;
          __int16 v24 = 2112;
          CFStringRef v25 = v19;
          __int16 v26 = 2112;
          os_log_type_t v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Photo Library (%@) %@ image priority 1 MC enabled (enabled date: %@)", buf, 0x2Au);
        }
      }
      v6[2](v6, v13, 0);
      goto LABEL_23;
    }
  }
  else
  {
    os_log_type_t v11 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    if (v11) {
      goto LABEL_7;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ Failed to obtain specified Photo Library (%@)", buf, 0x16u);
    }
  }
  NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
  id v12 = +[NSString stringWithFormat:@"%@ Failed to obtain specified Photo Library (%@)", v7, v5];
  os_log_type_t v29 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  os_log_type_t v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v13];
  ((void (**)(id, void *, void *))v6)[2](v6, 0, v16);

LABEL_23:
}

- (void)queryPerformanceMeasurementsWithReply:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  Measurements = (void *)VCPPerformance_QueryMeasurements();
  v4[2](v4, Measurements);
}

- (void)resetPerformanceMeasurements
{
}

- (void)queryUserSafetyEnablement:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (!self->_userSafetyEntitled)
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v5 = +[NSString stringWithFormat:@"Client not entitled to query User Safety enablement"];
    os_log_type_t v10 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v6];
    v4[2](v4, 0, v7);
  }
  os_log_type_t v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MADUserSafetySettings policyForTask:self->_secTask.value_]);
  ((void (**)(id, void *, void *))v4)[2](v4, v8, 0);
}

- (void)startEntryPointWithQueryID:(unint64_t)a3
{
}

- (void)startEntryPointWithQueryID:(unint64_t)a3 andEvent:(unint64_t)a4
{
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4
{
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 engagementSuggestionType:(id)a5
{
  id v8 = a5;
  NSErrorUserInfoKey v9 = +[NSMutableDictionary dictionary];
  os_log_type_t v10 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v9 setObject:v10 forKeyedSubscript:VIACacheHitContextQueryIDKey];

  os_log_type_t v11 = +[NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v11 forKeyedSubscript:VIACacheHitContextCachedResultQueryID];

  clientBundleID = self->_clientBundleID;
  if (clientBundleID) {
    [v9 setObject:clientBundleID forKeyedSubscript:VIACacheHitContextApplicationIdentifierKey];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:VIACacheHitContextEngagementSuggestionTypeKey];
  }
  id v17 = 0;
  id v13 = +[VIACacheHitContext contextWithDictionary:v9 error:&v17];
  id v14 = v17;
  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to create VIACacheHitContext, error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    VIAnalyticsLogCacheHitWithContext();
  }
}

- (void)endEntryPoint
{
}

- (void)requestOTAMaintenance:(int)a3 options:(id)a4 reply:(id)a5
{
  id v7 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005B674;
  v20[3] = &unk_1002199D8;
  v20[4] = self;
  int v21 = a3;
  id v8 = objc_retainBlock(v20);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005B690;
  v17[3] = &unk_10021B640;
  int v19 = a3;
  id v9 = v7;
  v17[4] = self;
  id v18 = v9;
  os_log_type_t v10 = objc_retainBlock(v17);
  os_log_type_t v11 = +[MADOTAMaintenanceProcessingTask taskWithCancelBlock:&stru_10021B660 progressHandler:v8 completionHandler:v10];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v13 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005B880;
  v15[3] = &unk_100219940;
  id v14 = v9;
  id v16 = v14;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v11 withRequestID:v13 schedulingErrorHandler:v15];
}

- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8
{
  id v46 = a3;
  id v47 = (_UNKNOWN **)a4;
  uint64_t v13 = a5;
  id v14 = a6;
  id v45 = a7;
  os_log_type_t v15 = (void (**)(id, _UNKNOWN **))a8;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412802;
      v62 = v47;
      __int16 v63 = 2112;
      v64 = v13;
      __int16 v65 = 2112;
      id v66 = v46;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[Spotlight] Scheduling asset (UUID: %@ BundleID: %@ URL: %@)", buf, 0x20u);
    }
  }
  id v18 = +[UTType typeWithIdentifier:v14];
  if (([v18 conformsToType:UTTypeMovie] & 1) != 0
    || ([v18 conformsToType:UTTypeVideo] & 1) != 0)
  {
    int v44 = 0;
    uint64_t v19 = 2;
  }
  else
  {
    if (([v18 conformsToType:UTTypeImage] & 1) == 0)
    {
      NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
      id v31 = +[NSString stringWithFormat:@"Type identifier (%@), does not resolve to image/video", v14];
      v60 = v31;
      CFStringRef v25 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      __int16 v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
      v15[2](v15, v24);
      goto LABEL_50;
    }
    int v44 = 1;
    uint64_t v19 = 1;
  }
  id v20 = [v13 lowercaseString];
  unsigned int v21 = [v20 containsString:@"apple"];

  __int16 v22 = [v13 lowercaseString];
  unsigned int v23 = [v22 isEqualToString:@"com.apple.jujubectl"];

  if ((v21 ^ 1 | v23))
  {
    __int16 v24 = &ADClientSetValueForScalarKey_ptr;
    id v52 = 0;
    CFStringRef v25 = +[MADManagedSpotlightEntry fetchEntryWithUniqueIdentifier:v47 error:&v52];
    __int16 v26 = v52;
    if (v26 && (int)MediaAnalysisLogLevel() >= 4)
    {
      os_log_type_t v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v47;
        __int16 v63 = 2112;
        v64 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[Spotlight] Failed to fetch entry with %@ (%@). New entry will still be created", buf, 0x16u);
      }
    }
    if (v25)
    {
      [v25 setUrl:v46];
      [v25 setSandboxToken:v45];
      os_log_type_t v29 = +[MADSystemDataStore systemDataStore];
      id v51 = v26;
      unsigned int v30 = [v29 commitChangesOrRollback:&v51];
      id v31 = v51;

      if (v30)
      {
        __int16 v26 = v31;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_log_type_t v32 = VCPLogInstance();
          __int16 v26 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v32, (os_log_type_t)VCPLogToOSLogType[6]))
          {
            *(_DWORD *)buf = 138412290;
            v62 = (_UNKNOWN **)v25;
            _os_log_impl((void *)&_mh_execute_header, v32, (os_log_type_t)v26, "[Spotlight] Updated asset %@", buf, 0xCu);
          }
        }
        id v33 = 0;
      }
      else
      {
        NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
        __int16 v24 = +[NSString stringWithFormat:@"Failed to update entry (%@)", v31];
        int v56 = v24;
        __int16 v26 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        id v33 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v26];
      }
      v15[2](v15, v33);
      if ((v30 & 1) == 0)
      {

LABEL_49:
        goto LABEL_50;
      }
    }
    else
    {
      id v50 = v26;
      id v34 = +[MADManagedSpotlightEntry entryWithURL:v46 uniqueIdentifier:v47 bundleIdentifier:v13 typeIdentifier:v14 sandboxToken:v45 mediaType:v19 error:&v50];
      id v31 = v50;

      if (v34)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_signpost_id_t v35 = VCPLogInstance();
          __int16 v26 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v35, (os_log_type_t)VCPLogToOSLogType[6]))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v26, "[Spotlight] Scheduled asset %@", buf, 0xCu);
          }
        }
        uint64_t v36 = 0;
      }
      else
      {
        NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
        __int16 v24 = +[NSString stringWithFormat:@"Failed to store entry %@", v31];
        id v54 = v24;
        __int16 v26 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        uint64_t v36 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v26];
      }
      v15[2](v15, v36);
      if (!v34)
      {

        goto LABEL_49;
      }
    }
    __int16 v37 = v31;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v38 = VCPLogInstance();
      os_log_type_t v39 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v38, v39))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "[Spotlight] Submit BGST task", buf, 2u);
      }
    }
    if (v44)
    {
      uint64_t v40 = +[MADSpotlightImageBackgroundSystemTask identifier];
      NSErrorUserInfoKey v41 = +[MADSpotlightImageBackgroundSystemTask sharedTask];
      __int16 v49 = v31;
      id v42 = (id *)&v49;
      [v41 submitTask:&v49];
    }
    else
    {
      uint64_t v40 = +[MADSpotlightMovieBackgroundSystemTask identifier];
      NSErrorUserInfoKey v41 = +[MADSpotlightMovieBackgroundSystemTask sharedTask];
      id v48 = v31;
      id v42 = (id *)&v48;
      [v41 submitTask:&v48];
    }
    __int16 v24 = (_UNKNOWN **)v40;
    id v31 = *v42;

    if (v31 && (int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v26 = VCPLogInstance();
      os_log_type_t v43 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v26, v43))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v24;
        __int16 v63 = 2112;
        v64 = v31;
        _os_log_impl((void *)&_mh_execute_header, v26, v43, "[Spotlight][%@] Failed to submit the BGST task with error: %@", buf, 0x16u);
      }
      goto LABEL_49;
    }
  }
  else
  {
    NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
    id v31 = +[NSString stringWithFormat:@"BundleID %@ is not supported", v13];
    id v58 = v31;
    CFStringRef v25 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    __int16 v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
    v15[2](v15, v24);
  }
LABEL_50:
}

- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADService] Received text pre-warming request", buf, 2u);
    }
  }
  id v12 = +[NSString stringWithFormat:@"Request: %d", v6];
  uint64_t v13 = VCPSignPostLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  os_log_type_t v15 = VCPSignPostLog();
  id v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    os_log_type_t v32 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPMediaAnalysisClientHandler_TextPrewarmingE2E", "%@", buf, 0xCu);
  }

  id v17 = objc_alloc((Class)MADServiceTextPrewarmingTask);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005C5A4;
  v26[3] = &unk_100219A68;
  os_signpost_id_t v29 = v14;
  id v18 = v12;
  id v27 = v18;
  uint64_t v30 = 0;
  id v19 = v9;
  id v28 = v19;
  id v20 = [v17 initWithRequests:v8 cancelBlock:&stru_10021B680 completionHandler:v26];
  [v20 setSignpostPayload:v18];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v22 = (int)v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005C6CC;
  v24[3] = &unk_100219940;
  id v23 = v19;
  id v25 = v23;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v20 withRequestID:v22 schedulingErrorHandler:v24];
}

- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v27 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MADService] Received text processing request", buf, 2u);
    }
  }
  os_signpost_id_t v14 = +[NSString stringWithFormat:@"Request: %d", v7];
  os_log_type_t v15 = VCPSignPostLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  id v17 = VCPSignPostLog();
  id v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPMediaAnalysisClientHandler_TextProcessingE2E", "%@", buf, 0xCu);
  }

  id v19 = +[MADServiceTextAsset assetWithTextInputs:v10 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
  id v20 = objc_alloc((Class)MADServiceTextProcessingTask);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10005CA88;
  v30[3] = &unk_100219AB0;
  os_signpost_id_t v33 = v16;
  id v21 = v14;
  id v31 = v21;
  uint64_t v34 = 0;
  id v22 = v11;
  id v32 = v22;
  id v23 = [v20 initWithRequests:v27 asset:v19 cancelBlock:&stru_10021B6A0 completionHandler:v30];
  [v23 setSignpostPayload:v21];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v25 = (int)v7;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10005CBD0;
  v28[3] = &unk_100219940;
  id v26 = v22;
  id v29 = v26;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v23 withRequestID:v25 schedulingErrorHandler:v28];
}

- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADService] Received multi-modal pre-warming request", buf, 2u);
    }
  }
  id v12 = +[NSString stringWithFormat:@"Request: %d", v6];
  os_log_type_t v13 = VCPSignPostLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  os_log_type_t v15 = VCPSignPostLog();
  os_signpost_id_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPMediaAnalysisClientHandler_MultiModalPrewarmingE2E", "%@", buf, 0xCu);
  }

  id v17 = objc_alloc((Class)MADMultiModalPrewarmingTask);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005CF28;
  v26[3] = &unk_100219A68;
  os_signpost_id_t v29 = v14;
  id v18 = v12;
  id v27 = v18;
  uint64_t v30 = 0;
  id v19 = v9;
  id v28 = v19;
  id v20 = [v17 initWithRequests:v8 cancelBlock:&stru_10021B6C0 completionHandler:v26];
  [v20 setSignpostPayload:v18];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v22 = (int)v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005D050;
  v24[3] = &unk_100219940;
  id v23 = v19;
  id v25 = v23;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v20 withRequestID:v22 schedulingErrorHandler:v24];
}

- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received multi-modal processing request", buf, 2u);
    }
  }
  os_log_type_t v15 = +[NSString stringWithFormat:@"Request: %d", v7];
  os_signpost_id_t v16 = VCPSignPostLog();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  id v18 = VCPSignPostLog();
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v35 = v15;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMediaAnalysisClientHandler_MultiModalProcessingE2E", "%@", buf, 0xCu);
  }

  id v20 = objc_alloc((Class)MADMultiModalProcessingTask);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005D3B8;
  v29[3] = &unk_100219AB0;
  os_signpost_id_t v32 = v17;
  id v21 = v15;
  id v30 = v21;
  uint64_t v33 = 0;
  id v22 = v12;
  id v31 = v22;
  id v23 = [v20 initWithRequests:v10 inputs:v11 cancelBlock:&stru_10021B6E0 completionHandler:v29];
  [v23 setSignpostPayload:v21];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v25 = (int)v7;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005D500;
  v27[3] = &unk_100219940;
  id v26 = v22;
  id v28 = v26;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v23 withRequestID:v25 schedulingErrorHandler:v27];
}

+ (unint64_t)disablePhotosPostCaptureProcessing
{
  return 0;
}

- (void)requestURLAssetAnalysis:(int)a3 forAssetWithResourcePaths:(id)a4 withOptions:(id)a5 analysisTypes:(unint64_t)a6 sandboxTokens:(id)a7 withReply:(id)a8
{
  id v12 = a4;
  id v50 = a5;
  id v55 = a7;
  id v54 = a8;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = [v12 firstObject];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v81) = 2112;
      *(void *)((char *)&v81 + 2) = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received MADRequestID %d to analyze asset %@", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&long long v81 = buf;
  *((void *)&v81 + 1) = 0x3032000000;
  v82 = sub_10005DFF8;
  v83 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestURLAssetAnalysis");
  id v84 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v55 count];
  if (v16 == [v12 count])
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    NSErrorUserInfoKey v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v18 = 0;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v52 = VCPLogToOSLogType[3];
    while (1)
    {
      if (v18 >= (unint64_t)[v12 count])
      {
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10005E010;
        v66[3] = &unk_10021B758;
        v66[4] = self;
        NSErrorUserInfoKey v53 = v53;
        v67 = v53;
        id v41 = v17;
        id v68 = v41;
        int v71 = a3;
        id v42 = v54;
        id v69 = v42;
        v70 = buf;
        os_log_type_t v43 = objc_retainBlock(v66);
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_10005E4EC;
        v64[3] = &unk_1002199D8;
        v64[4] = self;
        int v65 = a3;
        int v44 = objc_retainBlock(v64);
        managementQueue = self->_managementQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10005E508;
        block[3] = &unk_10021B780;
        block[4] = self;
        int v63 = a3;
        id v59 = v42;
        id v17 = v41;
        id v57 = v17;
        id v58 = v50;
        id v60 = v44;
        id v61 = v43;
        unint64_t v62 = a6;
        id v46 = v43;
        id v47 = v44;
        dispatch_sync(managementQueue, block);

        goto LABEL_34;
      }
      id v20 = [v12 objectAtIndexedSubscript:v18];
      id v21 = +[NSURL fileURLWithPath:v20];

      id v22 = [v55 objectAtIndexedSubscript:v18];
      int64_t v23 = [(VCPMediaAnalysisClientHandler *)self consumeSandboxExtension:v22 url:v21];

      if (v23 < 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_signpost_id_t v35 = VCPLogInstance();
          if (os_log_type_enabled(v35, v52))
          {
            *(_DWORD *)v78 = 138412290;
            CFStringRef v79 = @"[MAClientHandler] Failed to consume sandbox extension";
            _os_log_impl((void *)&_mh_execute_header, v35, v52, "%@", v78, 0xCu);
          }
        }
        NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
        id v30 = +[NSString stringWithFormat:@"%@", @"[MAClientHandler] Failed to consume sandbox extension"];
        v75 = v30;
        os_signpost_id_t v32 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        uint64_t v33 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v32];
        (*((void (**)(id, void, void *))v54 + 2))(v54, 0, v33);
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          __int16 v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, type))
          {
            uint64_t v25 = [v12 objectAtIndexedSubscript:v18];
            *(_DWORD *)v78 = 138412290;
            CFStringRef v79 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, type, "[MAClientHandler] Consuming sandbox extension for %@", v78, 0xCu);
          }
        }
        id v26 = +[NSNumber numberWithLongLong:v23];
        [(__CFString *)v53 addObject:v26];

        [v17 addObject:v21];
        id v27 = [v12 objectAtIndexedSubscript:v18];
        +[NSURL fileURLWithPath:v27];
        uint64_t v28 = FigSandboxRegisterURLWithProcess();

        if (!v28)
        {
          char v36 = 1;
          goto LABEL_26;
        }
        os_signpost_id_t v29 = [v12 objectAtIndexedSubscript:v18];
        id v30 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to register sandbox extension (%@) to CoreMedia (%d)", v29, v28];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, v52))
          {
            *(_DWORD *)v78 = 138412290;
            CFStringRef v79 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, v52, "%@", v78, 0xCu);
          }
        }
        NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
        os_signpost_id_t v32 = +[NSString stringWithFormat:@"%@", v30];
        v73 = v32;
        uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        uint64_t v34 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v33];
        (*((void (**)(id, void, void *))v54 + 2))(v54, 0, v34);
      }
      char v36 = 0;
LABEL_26:

      ++v18;
      if ((v36 & 1) == 0) {
        goto LABEL_34;
      }
    }
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[MAClientHandler] Sandbox token count (%lu) does not match resource count (%lu)", [v55 count], objc_msgSend(v12, "count"));
  NSErrorUserInfoKey v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    __int16 v37 = VCPLogInstance();
    os_log_type_t v38 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v37, v38))
    {
      *(_DWORD *)v78 = 138412290;
      CFStringRef v79 = v53;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@", v78, 0xCu);
    }
  }
  NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
  id v17 = +[NSString stringWithFormat:@"%@", v53];
  id v77 = v17;
  os_log_type_t v39 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  uint64_t v40 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v39];
  (*((void (**)(id, void, void *))v54 + 2))(v54, 0, v40);

LABEL_34:
  _Block_object_dispose(buf, 8);
}

- (void)requestAssetAnalysis:(int)a3 forLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withOptions:(id)a6 analysisTypes:(unint64_t)a7 withReply:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v18 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "[MAClientHandler] Received on-demand analysis asset processing request (%d)", buf, 8u);
    }
  }
  id v20 = +[VCPPhotoLibraryManager sharedManager];
  __int16 v37 = [v20 photoLibraryWithURL:v15];

  if (v37)
  {
    *(void *)buf = 0;
    NSErrorUserInfoKey v53 = buf;
    uint64_t v54 = 0x3032000000;
    id v55 = sub_10005DFF8;
    int v56 = sub_10005E008;
    VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestAssetProcessing");
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10005ED24;
    v50[3] = &unk_1002199D8;
    v50[4] = self;
    int v51 = v12;
    uint64_t v34 = objc_retainBlock(v50);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10005ED40;
    v46[3] = &unk_10021A0D8;
    v46[4] = self;
    int v49 = v12;
    id v21 = v17;
    id v47 = v21;
    id v48 = buf;
    char v36 = objc_retainBlock(v46);
    id v22 = +[PHAsset vcp_fetchOptionsForLibrary:v37 forTaskID:1];
    int64_t v23 = +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v14);
    os_signpost_id_t v35 = [v23 fetchedObjects];
    if ([v35 count])
    {
      id v33 = v17;
      id v24 = v15;
      id v25 = v14;
      managementQueue = self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005F040;
      block[3] = &unk_10021B780;
      block[4] = self;
      int v45 = v12;
      id v41 = v21;
      id v39 = v35;
      unint64_t v44 = a7;
      id v40 = v16;
      id v42 = v34;
      os_log_type_t v43 = v36;
      id v27 = managementQueue;
      id v14 = v25;
      id v15 = v24;
      id v17 = v33;
      dispatch_sync(v27, block);
    }
    else
    {
      id v31 = +[NSString stringWithFormat:@"Failed to fetch localIdentifiers for asset processing MADRequestID %d", v12];
      os_signpost_id_t v32 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v31];
      (*((void (**)(id, void, void *))v21 + 2))(v21, 0, v32);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v28 = [v15 path];
    os_signpost_id_t v29 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@) for MADRequestID %d", v28, v12];

    id v30 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v29];
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v30);
  }
}

- (void)requestAssetAnalysis:(int)a3 forPhotoLibraryURL:(id)a4 withLocalIdentifiers:(id)a5 realTime:(BOOL)a6 withReply:(id)a7
{
  id v31 = a4;
  id v29 = a5;
  id v30 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = [v29 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = a3;
      *(_WORD *)&uint8_t buf[8] = 2048;
      *(void *)&buf[10] = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MAClientHandler] Received MADRequestID %d to analyze %lu assets", buf, 0x12u);
    }
  }
  id v15 = +[VCPPhotoLibraryManager sharedManager];
  os_signpost_id_t v32 = [v15 photoLibraryWithURL:v31];

  if (v32)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v48 = sub_10005DFF8;
    int v49 = sub_10005E008;
    VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10005F810;
    v45[3] = &unk_1002199D8;
    void v45[4] = self;
    int v46 = a3;
    id v16 = objc_retainBlock(v45);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10005F82C;
    v41[3] = &unk_10021B7D0;
    v41[4] = self;
    int v44 = a3;
    id v17 = v30;
    id v42 = v17;
    os_log_type_t v43 = buf;
    unint64_t v18 = objc_retainBlock(v41);
    managementQueue = self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005FB9C;
    block[3] = &unk_10021B7F8;
    block[4] = self;
    int v39 = a3;
    id v36 = v17;
    id v34 = v32;
    BOOL v40 = a6;
    id v35 = v29;
    id v37 = v16;
    id v38 = v18;
    id v20 = v18;
    id v21 = v16;
    dispatch_sync(managementQueue, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v22 = [v31 path];
    int64_t v23 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to find client specified Photos Library (%@)", v22];

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@", buf, 0xCu);
      }
    }
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    id v26 = +[NSString stringWithFormat:@"%@", v23];
    os_log_type_t v52 = v26;
    id v27 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    uint64_t v28 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v27];
    (*((void (**)(id, void, void *))v30 + 2))(v30, 0, v28);
  }
}

- (void)_resetPECFailureVersionForPhotoLibrary:(id)a3
{
  id v32 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[MAClientHandler] Reseting PEC Failure Versions", buf, 2u);
    }
  }
  id v31 = objc_alloc_init((Class)PHMediaProcessingAlgorithmVersionProvider);
  [v31 setVaAnalysisVersion:(__int16)VCPPhotosPECProcessingVersion_Failures];
  +[PHAsset mad_sceneConfidenceThresholdForTask:16];
  int v6 = v5;
  id v39 = 0;
  id v30 = objc_msgSend(v32, "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", 16, 0, v31, &v39);
  id v28 = v39;
  if (!v28)
  {
    BOOL v10 = 0;
    unint64_t v11 = 0;
    os_log_type_t type = VCPLogToOSLogType[3];
    *(void *)&long long v7 = 138412290;
    long long v27 = v7;
    while (1)
    {
      if (v10 || v11 >= (unint64_t)v30) {
        goto LABEL_36;
      }
      id v38 = 0;
      LODWORD(v13) = v6;
      id v14 = [v32 fetchProcessedAssetsForMediaProcessingTaskID:16 priority:0 algorithmVersion:v31 sceneConfidenceThreshold:&v38 error:v13];
      id v15 = v38;
      if (!v15) {
        break;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = v27;
          id v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, type, "[MAClientHandler] Failed to fetch PEC Failure assets: %@", buf, 0xCu);
        }
        BOOL v10 = 0;
        int v17 = 7;
LABEL_34:

        goto LABEL_35;
      }
      BOOL v10 = 0;
      int v17 = 7;
LABEL_35:

      if (v17) {
        goto LABEL_36;
      }
    }
    id v16 = +[NSMutableArray array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = v14;
    id v19 = [v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "localIdentifier", v27);
          [v16 addObject:v22];
        }
        id v19 = [v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v19);
    }

    id v33 = 0;
    [v32 resetStateForMediaProcessingTaskID:16 assetIdentifiers:v16 resetOptions:1 error:&v33];
    id v23 = v33;
    if (v23)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = v27;
          id v42 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, type, "[MAClientHandler] Error while clearing PEC Failure version: %@", buf, 0xCu);
        }
      }
      BOOL v10 = 0;
      int v17 = 7;
    }
    else
    {
      id v25 = [v18 count];
      id v26 = [v18 count];
      int v17 = 0;
      v11 += (unint64_t)v25;
      BOOL v10 = v26 == 0;
    }

    goto LABEL_34;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v28;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[MAClientHandler] Failed to count PEC Failures: %@", buf, 0xCu);
    }
  }
LABEL_36:
}

- (void)_resetProcessingStatusForTaskID:(unint64_t)a3 andPhotoLibrary:(id)a4
{
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    long long v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MAClientHandler] Canceling background activity if exists to avoid dual MADB writer scenario", buf, 2u);
    }
  }
  os_log_type_t v9 = +[VCPMADTaskScheduler sharedInstance];
  [v9 cancelBackgroundTasks];

  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    BOOL v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v4 = VCPTaskIDDescription(a3);
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MAClientHandler] Resetting processing status for %@ ...", buf, 0xCu);
    }
  }
  uint64_t v12 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v6];
  int v21 = 0;
  if ([v12 removeAllChangeTokensForTaskID:a3]
    || [v12 removeAllProcessingStatusForTaskID:a3])
  {
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    os_log_type_t v4 = +[NSDate now];
    if ([v12 ageOutBlacklistBefore:v4 count:&v21])
    {

      goto LABEL_11;
    }
  }
  unsigned int v19 = [v12 commit];
  if (a3 == 1)
  {
    BOOL v20 = v19 == 0;

    if (v20) {
      goto LABEL_21;
    }
    goto LABEL_11;
  }
  if (v19)
  {
LABEL_11:
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      double v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v14))
      {
        id v15 = VCPTaskIDDescription(a3);
        *(_DWORD *)buf = 138412290;
        id v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Failed to reset %@ state", buf, 0xCu);
      }
    }
  }
  if (a3 == 3)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "[MAClientHandler] Resetting person process timestamps timestamps ...", buf, 2u);
      }
    }
    [v12 removeKey:@"ContactIngestionTimestamp"];
    [v12 removeKey:@"HomePersonIngestionTimestamp"];
    [v12 removeKey:@"VUDeepSyncTimestamp"];
    [v12 commit];
  }
LABEL_21:
  id v18 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v6];
}

- (void)requestLibraryProcessing:(int)a3 withTaskID:(unint64_t)a4 forPhotoLibraryURL:(id)a5 withOptions:(id)a6 andReply:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v32 = a5;
  id v31 = a6;
  id v33 = a7;
  if (a4 <= 0xC && ((1 << a4) & 0x158E) != 0)
  {
    uint64_t v12 = v32;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v13, v14))
      {
        id v15 = VCPTaskIDDescription(a4);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&uint8_t buf[4] = v10;
        *(_WORD *)os_log_type_t v52 = 2112;
        *(void *)&v52[2] = v15;
        *(_WORD *)&v52[10] = 2048;
        *(void *)&v52[12] = a4;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received Photos analysis MADRequestID %d for task %@(%lu)", buf, 0x1Cu);
      }
    }
    id v16 = +[VCPPhotoLibraryManager sharedManager];
    os_log_type_t v17 = [v16 photoLibraryWithURL:v32];

    if (v17)
    {
      *(void *)buf = 0;
      *(void *)os_log_type_t v52 = buf;
      *(void *)&v52[8] = 0x3032000000;
      *(void *)&v52[16] = sub_10005DFF8;
      NSErrorUserInfoKey v53 = sub_10005E008;
      id v54 = objc_alloc_init((Class)VCPTimeMeasurement);
      [*(id *)(*(void *)v52 + 40) start];
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3032000000;
      v49[3] = sub_10005DFF8;
      v49[4] = sub_10005E008;
      VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestLibraryProcessing");
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100060CA0;
      v47[3] = &unk_1002199D8;
      void v47[4] = self;
      int v48 = v10;
      id v18 = objc_retainBlock(v47);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100060CBC;
      v42[3] = &unk_10021B848;
      int v46 = v10;
      v42[4] = self;
      int v44 = buf;
      id v19 = v33;
      id v43 = v19;
      int v45 = v49;
      BOOL v20 = objc_retainBlock(v42);
      managementQueue = self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100061074;
      block[3] = &unk_10021B780;
      block[4] = self;
      int v41 = v10;
      id v37 = v19;
      unint64_t v40 = a4;
      id v35 = v31;
      id v36 = v17;
      id v38 = v18;
      id v39 = v20;
      id v22 = v20;
      id v23 = v18;
      id v24 = managementQueue;
      uint64_t v12 = v32;
      dispatch_sync(v24, block);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v25 = [v32 path];
      id v26 = +[NSString stringWithFormat:@"Unable to open specified photo library (%@)", v25];

      long long v27 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v26];
      (*((void (**)(id, void *))v33 + 2))(v33, v27);
    }
  }
  else
  {
    id v28 = VCPTaskIDDescription(a4);
    uint64_t v12 = v32;
    id v29 = +[NSString stringWithFormat:@"MADRequestID %d requestLibraryProcessing with unsupported task %@(%lu)", v10, v28, a4];

    id v30 = [(id)objc_opt_class() errorForStatus:4294967292 withDescription:v29];
    (*((void (**)(id, void *))v33 + 2))(v33, v30);
  }
}

- (void)requestVideoFramesProcessing:(int)a3 withTaskID:(unint64_t)a4 frames:(id)a5 options:(id)a6 andReply:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v26 = a6;
  id v13 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = VCPTaskIDDescription(a4);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v10;
      *(_WORD *)id v39 = 2112;
      *(void *)&v39[2] = v16;
      *(_WORD *)&v39[10] = 2048;
      *(void *)&v39[12] = a4;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MAClientHandler] Received video frames processing MADRequestID %d for task %@(%lu)", buf, 0x1Cu);
    }
  }
  if (a4 == 15)
  {
    if ([v12 count])
    {
      *(void *)buf = 0;
      *(void *)id v39 = buf;
      *(void *)&v39[8] = 0x3032000000;
      *(void *)&v39[16] = sub_10005DFF8;
      unint64_t v40 = sub_10005E008;
      VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestVideoFramesProcessing");
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10006226C;
      v34[3] = &unk_10021A0D8;
      v34[4] = self;
      int v37 = v10;
      id v17 = v13;
      id v35 = v17;
      id v36 = buf;
      id v18 = objc_retainBlock(v34);
      managementQueue = self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006256C;
      block[3] = &unk_10021B930;
      block[4] = self;
      int v33 = v10;
      id v30 = v17;
      id v28 = v26;
      id v29 = v12;
      id v31 = v18;
      uint64_t v32 = 15;
      BOOL v20 = v18;
      dispatch_sync(managementQueue, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v24 = +[NSString stringWithFormat:@"No frames specified for MADRequestID %d", v10];
      id v25 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v24];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v25);
    }
  }
  else
  {
    int v21 = VCPTaskIDDescription(a4);
    id v22 = +[NSString stringWithFormat:@"MADRequestID %d requestVideoFramesProcessing with unsupported task %@(%lu)", v10, v21, a4];

    id v23 = [(id)objc_opt_class() errorForStatus:4294967292 withDescription:v22];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v23);
  }
}

- (void)requestAssetProcessing:(int)a3 withTaskID:(unint64_t)a4 forLocalIdentifiers:(id)a5 fromPhotoLibraryWithURL:(id)a6 withOptions:(id)a7 andReply:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v38 = a5;
  id v37 = a6;
  id v36 = a7;
  id v14 = a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = VCPTaskIDDescription(a4);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v12;
      *(_WORD *)id v59 = 2112;
      *(void *)&v59[2] = v17;
      *(_WORD *)&v59[10] = 2048;
      *(void *)&v59[12] = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[MAClientHandler] Received Photos asset processing MADRequestID %d for task %@(%lu)", buf, 0x1Cu);
    }
  }
  if (a4 - 2 < 5 || a4 == 8)
  {
    if ([v38 count])
    {
      id v18 = +[VCPPhotoLibraryManager sharedManager];
      id v19 = [v18 photoLibraryWithURL:v37];

      if (v19)
      {
        *(void *)buf = 0;
        *(void *)id v59 = buf;
        *(void *)&v59[8] = 0x3032000000;
        *(void *)&v59[16] = sub_10005DFF8;
        id v60 = sub_10005E008;
        VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestAssetProcessing");
        id v61 = (id)objc_claimAutoreleasedReturnValue();
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_100063048;
        v56[3] = &unk_1002199D8;
        v56[4] = self;
        int v57 = v12;
        int v33 = objc_retainBlock(v56);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_100063064;
        v52[3] = &unk_10021A0D8;
        v52[4] = self;
        int v55 = v12;
        id v20 = v14;
        id v53 = v20;
        id v54 = buf;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100063384;
        v50[3] = &unk_10021B958;
        long long v34 = objc_retainBlock(v52);
        v50[4] = self;
        id v51 = v34;
        id v35 = objc_retainBlock(v50);
        uint64_t v32 = +[PHAsset vcp_fetchOptionsForLibrary:v19 forTaskID:a4];
        int v21 = +[PHAsset fetchAssetsWithLocalIdentifiers:v38 options:v32];
        id v22 = [v21 fetchedObjects];
        if ([v22 count])
        {
          managementQueue = self->_managementQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10006340C;
          block[3] = &unk_10021B9A0;
          block[4] = self;
          int v49 = v12;
          id v44 = v20;
          unint64_t v48 = a4;
          id v40 = v22;
          int v45 = v33;
          int v46 = v34;
          id v41 = v38;
          id v42 = v37;
          id v47 = v35;
          id v43 = v36;
          dispatch_sync(managementQueue, block);
        }
        else
        {
          id v30 = +[NSString stringWithFormat:@"Failed to fetch localIdentifiers for asset processing MADRequestID %d", v12];
          id v31 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v30];
          (*((void (**)(id, void, void *))v20 + 2))(v20, 0, v31);
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        long long v27 = [v37 path];
        id v28 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@) for MADRequestID %d", v27, v12];

        id v29 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v28];
        (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v29);
      }
    }
    else
    {
      id v19 = +[NSString stringWithFormat:@"No localIdentifiers specified for MADRequestID %d", v12];
      id v24 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v19];
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v24);
    }
  }
  else
  {
    id v25 = VCPTaskIDDescription(a4);
    id v19 = +[NSString stringWithFormat:@"MADRequestID %d requestAssetProcessing with unsupported task %@(%lu)", v12, v25, a4];

    id v26 = [(id)objc_opt_class() errorForStatus:4294967292 withDescription:v19];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v26);
  }
}

- (void)requestWallpaperUpgrade:(int)a3 atSourceURL:(id)a4 toDestinationURL:(id)a5 withOptions:(id)a6 sandboxTokens:(id)a7 andReply:(id)a8
{
  uint64_t v39 = *(void *)&a3;
  id v41 = a4;
  id v42 = a5;
  id v40 = a6;
  id v13 = a7;
  id v43 = (void (**)(id, void, void *))a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = v39;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MAClientHandler] Received requestWallpaperUpgrade MADRequestID %d", buf, 8u);
    }
  }
  if ([v13 count] != (id)2)
  {
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    os_log_type_t v16 = +[NSString stringWithFormat:@"[MAClientHandler] Sandbox token count not euqal to 2"];
    int v57 = v16;
    id v25 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    id v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
    v43[2](v43, 0, v26);
    goto LABEL_36;
  }
  v55[0] = v41;
  v55[1] = v42;
  os_log_type_t v16 = +[NSArray arrayWithObjects:v55 count:2];
  unint64_t v17 = 0;
  os_log_type_t v18 = VCPLogToOSLogType[7];
  while (v17 < (unint64_t)[v13 count])
  {
    id v19 = [v13 objectAtIndexedSubscript:v17];
    id v20 = [v16 objectAtIndexedSubscript:v17];
    int64_t v21 = [(VCPMediaAnalysisClientHandler *)self consumeSandboxExtension:v19 url:v20];

    if (v21 < 0)
    {
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      id v25 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to consume sandbox extension"];
      id v54 = v25;
      id v26 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      long long v34 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v26];
      v43[2](v43, 0, v34);
      goto LABEL_35;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, v18))
      {
        id v23 = [v16 objectAtIndexedSubscript:v17];
        *(_DWORD *)buf = 138412290;
        os_log_type_t v52 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, v18, "[MAClientHandler] Consuming sandbox extension for %@", buf, 0xCu);
      }
    }
    id v24 = +[NSNumber numberWithLongLong:v21];
    [0 addObject:v24];

    ++v17;
  }
  id v27 = [objc_alloc((Class)VCPParallaxAnalyzer) initWithOptions:v40 andExistingResults:0];
  id v26 = v27;
  if (!v27)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v35 = VCPLogInstance();
      os_log_type_t v36 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v35, v36))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v52) = v39;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "[MAClientHandler] Failed to initialize analyzer MADRequestID %d", buf, 8u);
      }
    }
    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    id v31 = +[NSString stringWithFormat:@"[MAClientHandler] to initialize analyzer with MADRequestID %d", v39];
    id v50 = v31;
    uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    int v33 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-108 userInfo:v32];
    id v25 = 0;
    v43[2](v43, 0, v33);
    goto LABEL_28;
  }
  id v46 = 0;
  signed int v28 = [v27 upgradeWallPaperAtURL:v41 toURL:v42 cancel:0 results:&v46];
  id v25 = v46;
  if (v28)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v52) = v39;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[MAClientHandler] Failed to requestWallpaperUpgrade MADRequestID %d", buf, 8u);
      }
    }
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    id v31 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to requestWallpaperUpgrade with MADRequestID %d", v39];
    unint64_t v48 = v31;
    uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    int v33 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v28 userInfo:v32];
    v43[2](v43, 0, v33);
LABEL_28:

    goto LABEL_34;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v37 = VCPLogInstance();
    os_log_type_t v38 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v37, v38))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "[MAClientHandler] Completed requestWallpaperUpgrade MADRequestID %d", buf, 8u);
    }
  }
  ((void (**)(id, id, void *))v43)[2](v43, v25, 0);
LABEL_34:
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100064014;
  v44[3] = &unk_10021B708;
  id v45 = v16;
  [0 enumerateObjectsUsingBlock:v44];
  long long v34 = v45;
LABEL_35:

LABEL_36:
}

- (void)requestRecentsProcessing:(int)a3 withTaskID:(unint64_t)a4 photoLibraryWithURL:(id)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = VCPTaskIDDescription(a4);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v8;
      *(_WORD *)id v42 = 2112;
      *(void *)&v42[2] = v14;
      *(_WORD *)&v42[10] = 2048;
      *(void *)&v42[12] = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MAClientHandler] Received recents processing MADRequestID %d for task %@ (%lu)", buf, 0x1Cu);
    }
  }
  if (a4 == 12)
  {
    os_log_type_t v15 = +[VCPPhotoLibraryManager sharedManager];
    os_log_type_t v16 = [v15 photoLibraryWithURL:v10];

    if (v16)
    {
      *(void *)buf = 0;
      *(void *)id v42 = buf;
      *(void *)&v42[8] = 0x3032000000;
      *(void *)&v42[16] = sub_10005DFF8;
      id v43 = sub_10005E008;
      VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestRecentsProcessing");
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10006461C;
      v39[3] = &unk_1002199D8;
      void v39[4] = self;
      int v40 = v8;
      unint64_t v17 = objc_retainBlock(v39);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100064638;
      v35[3] = &unk_10021B9C8;
      void v35[4] = self;
      int v38 = v8;
      id v18 = v11;
      id v36 = v18;
      id v37 = buf;
      id v19 = objc_retainBlock(v35);
      managementQueue = self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000649B4;
      block[3] = &unk_10021BA30;
      block[4] = self;
      int v34 = v8;
      id v30 = v18;
      uint64_t v33 = 12;
      id v29 = v10;
      id v31 = v17;
      id v32 = v19;
      int64_t v21 = v19;
      id v22 = v17;
      dispatch_sync(managementQueue, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v25 = [v10 path];
      id v26 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@) for MADRequestID %d", v25, v8];

      id v27 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v26];
      (*((void (**)(id, void *))v11 + 2))(v11, v27);
    }
  }
  else
  {
    id v23 = VCPTaskIDDescription(a4);
    os_log_type_t v16 = +[NSString stringWithFormat:@"MADRequestID %d requestRecentsProcessing with unsupported task %@(%lu)", v8, v23, a4];

    id v24 = [(id)objc_opt_class() errorForStatus:4294967292 withDescription:v16];
    (*((void (**)(id, void *))v11 + 2))(v11, v24);
  }
}

- (void)cancelRequest:(int)a3
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[MAClientHandler] Service received call to cancel task for MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  os_log_type_t v16 = buf;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10005DFF8;
  managementQueue = self->_managementQueue;
  id v19 = sub_10005E008;
  id v20 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000651DC;
  block[3] = &unk_10021A170;
  block[4] = self;
  void block[5] = buf;
  int v12 = a3;
  dispatch_sync(managementQueue, block);
  if (*((void *)v16 + 5))
  {
    uint64_t v8 = +[VCPMADTaskScheduler sharedInstance];
    objc_msgSend(v8, "cancelTaskWithID:", objc_msgSend(*((id *)v16 + 5), "unsignedIntegerValue"));
  }
  else
  {
    [(MADServiceClientTaskQueuingScheduler *)self->_queuingTaskScheduler cancelTaskWithRequestID:a3];
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)os_log_type_t v13 = 67109120;
      int v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[MAClientHandler] Canceled task for MADRequestID %d ", v13, 8u);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)cancelAllRequests
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[MAClientHandler] Service received call to cancel all tasks", buf, 2u);
    }
  }
  *(void *)buf = 0;
  id v22 = buf;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10005DFF8;
  id v25 = sub_10005E008;
  id v26 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065590;
  block[3] = &unk_100219F30;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(managementQueue, block);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *((id *)v22 + 5);
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        os_log_type_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = +[VCPMADTaskScheduler sharedInstance];
        objc_msgSend(v11, "cancelTaskWithID:", objc_msgSend(v10, "unsignedIntegerValue"));
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v29 count:16];
    }
    while (v7);
  }

  unint64_t v12 = [(MADServiceClientTaskQueuingScheduler *)self->_queuingTaskScheduler cancelAllTasks];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (char *)[*((id *)v22 + 5) count];
      *(_DWORD *)id v27 = 134217984;
      signed int v28 = &v15[v12];
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Service canceled all %lu tasks", v27, 0xCu);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)notifyLibraryAvailableAtURL:(id)a3
{
  id v3 = a3;
  os_log_type_t v4 = +[VCPPhotoLibraryManager sharedManager];
  int v5 = [v4 photoLibraryWithURL:v3];

  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = [v5 photoLibraryURL];
        os_log_type_t v9 = [v8 path];
        int v12 = 138412290;
        os_log_type_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "[MAClientHandler] Added Photo Library %@", (uint8_t *)&v12, 0xCu);
      }
LABEL_8:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v6, v10))
    {
      id v11 = [v3 path];
      int v12 = 138412290;
      os_log_type_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, v10, "[MAClientHandler] Failed to add Photo Library with path %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_8;
  }
}

- (void)cancelBackgroundActivityWithReply:(id)a3
{
  os_log_type_t v4 = (void (**)(id, void))a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = [(VCPMediaAnalysisClientHandler *)self description];
      int v9 = 138412290;
      os_log_type_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[MAClientHandler] Service %@ to cancel background analysis", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = +[VCPMADTaskScheduler sharedInstance];
  [v8 cancelBackgroundTasks];

  v4[2](v4, 0);
}

- (void)currentOutstandingTasksWithReply:(id)a3
{
  os_log_type_t v6 = (void (**)(id, char *))a3;
  os_log_type_t v4 = +[VCPMADTaskScheduler sharedInstance];
  int v5 = (char *)[v4 currentOutstandingTasks];

  v6[2](v6, &v5[[(MADServiceClientTaskQueuingScheduler *)self->_queuingTaskScheduler currentPendingTasks]]);
}

- (void)requestSuggestedPersons:(int)a3 withPersonWithLocalIdentifier:(id)a4 toBeConfirmedPersonSuggestions:(id)a5 toBeRejectedPersonSuggestions:(id)a6 andPhotoLibraryURL:(id)a7 andReply:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    long long v19 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v48) = 2112;
      *(void *)((char *)&v48 + 2) = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MAClientHandler] Received requestSuggestedPersons MADRequestID %d to analyze %@", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&long long v48 = buf;
  *((void *)&v48 + 1) = 0x3032000000;
  NSErrorUserInfoKey v49 = sub_10005DFF8;
  id v50 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestSuggestedPersons");
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100065D74;
  v45[3] = &unk_1002199D8;
  void v45[4] = self;
  int v46 = a3;
  int64_t v21 = objc_retainBlock(v45);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100065D90;
  v41[3] = &unk_10021BA58;
  v41[4] = self;
  int v44 = a3;
  id v22 = v18;
  id v42 = v22;
  id v43 = buf;
  uint64_t v23 = objc_retainBlock(v41);
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066090;
  block[3] = &unk_10021BA80;
  int v40 = a3;
  block[4] = self;
  id v33 = v14;
  id v34 = v15;
  id v35 = v16;
  id v36 = v17;
  id v37 = v22;
  id v38 = v21;
  id v39 = v23;
  id v25 = v23;
  id v26 = v21;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  id v30 = v14;
  id v31 = v22;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestUpdateKeyFacesOfPersons:(int)a3 withLocalIdentifiers:(id)a4 andForceUpdate:(BOOL)a5 andPhotoLibraryURL:(id)a6 andReply:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v41) = 2112;
      *(void *)((char *)&v41 + 2) = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[MAClientHandler] Received requestUpdateKeyFacesOfPersons MADRequestID %d to analyze %@", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&long long v41 = buf;
  *((void *)&v41 + 1) = 0x3032000000;
  id v42 = sub_10005DFF8;
  id v43 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestUpdateKeyFacesOfPersons");
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100066650;
  v38[3] = &unk_1002199D8;
  void v38[4] = self;
  int v39 = a3;
  id v17 = objc_retainBlock(v38);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10006666C;
  v34[3] = &unk_10021BAD0;
  v34[4] = self;
  int v37 = a3;
  id v18 = v14;
  id v35 = v18;
  id v36 = buf;
  long long v19 = objc_retainBlock(v34);
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066950;
  block[3] = &unk_10021B7F8;
  int v32 = a3;
  block[4] = self;
  id v27 = v12;
  BOOL v33 = a5;
  id v28 = v13;
  id v29 = v18;
  id v30 = v17;
  id v31 = v19;
  int64_t v21 = v19;
  id v22 = v17;
  id v23 = v13;
  id v24 = v12;
  id v25 = v18;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestFaceCandidatesforKeyFace:(int)a3 withPersonsWithLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v38) = 2112;
      *(void *)((char *)&v38 + 2) = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received requestFaceCandidatesforKeyFace MADRequestID %d to analyze %@", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&long long v38 = buf;
  *((void *)&v38 + 1) = 0x3032000000;
  int v39 = sub_10005DFF8;
  int v40 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestFaceCandidatesforKeyFace");
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100066F08;
  v35[3] = &unk_1002199D8;
  void v35[4] = self;
  int v36 = a3;
  id v15 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100066F24;
  v31[3] = &unk_10021BA58;
  v31[4] = self;
  int v34 = a3;
  id v16 = v12;
  id v32 = v16;
  BOOL v33 = buf;
  id v17 = objc_retainBlock(v31);
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067224;
  block[3] = &unk_10021A100;
  int v30 = a3;
  block[4] = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v16;
  id v28 = v15;
  id v29 = v17;
  long long v19 = v17;
  os_log_type_t v20 = v15;
  id v21 = v11;
  id v22 = v10;
  id v23 = v16;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetPersons:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MAClientHandler] Received requestResetPersons MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  BOOL v33 = buf;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10005DFF8;
  int v36 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestResetPersons");
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000677A0;
  v30[3] = &unk_1002199D8;
  void v30[4] = self;
  int v31 = a3;
  id v12 = objc_retainBlock(v30);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000677BC;
  v26[3] = &unk_10021BAD0;
  void v26[4] = self;
  int v29 = a3;
  id v13 = v9;
  id v27 = v13;
  id v28 = buf;
  os_log_type_t v14 = objc_retainBlock(v26);
  managementQueue = self->_managementQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100067AA0;
  v20[3] = &unk_10021BAF8;
  int v25 = a3;
  v20[4] = self;
  id v21 = v8;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v8;
  id v19 = v13;
  dispatch_sync(managementQueue, v20);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetFaceClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MAClientHandler] Received requestResetFaceClassificationModel MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  BOOL v33 = buf;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10005DFF8;
  int v36 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestResetFaceClassificationModel");
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006801C;
  v30[3] = &unk_1002199D8;
  void v30[4] = self;
  int v31 = a3;
  id v12 = objc_retainBlock(v30);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100068038;
  v26[3] = &unk_10021BAD0;
  void v26[4] = self;
  int v29 = a3;
  id v13 = v9;
  id v27 = v13;
  id v28 = buf;
  os_log_type_t v14 = objc_retainBlock(v26);
  managementQueue = self->_managementQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006831C;
  v20[3] = &unk_10021BAF8;
  int v25 = a3;
  v20[4] = self;
  id v21 = v8;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v8;
  id v19 = v13;
  dispatch_sync(managementQueue, v20);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetPetClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MAClientHandler] Received requestResetPetClassificationModel MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  BOOL v33 = buf;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10005DFF8;
  int v36 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestResetPetClassificationModel");
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100068898;
  v30[3] = &unk_1002199D8;
  void v30[4] = self;
  int v31 = a3;
  id v12 = objc_retainBlock(v30);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000688B4;
  v26[3] = &unk_10021BAD0;
  void v26[4] = self;
  int v29 = a3;
  id v13 = v9;
  id v27 = v13;
  id v28 = buf;
  os_log_type_t v14 = objc_retainBlock(v26);
  managementQueue = self->_managementQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100068B98;
  v20[3] = &unk_10021BAF8;
  int v25 = a3;
  v20[4] = self;
  id v21 = v8;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v8;
  id v19 = v13;
  dispatch_sync(managementQueue, v20);

  _Block_object_dispose(buf, 8);
}

- (void)requestSuggestedMePersonIdentifier:(int)a3 withContext:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v38) = 2112;
      *(void *)((char *)&v38 + 2) = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received MADRequestID requestSuggestedMePersonIdentifier %d with context %@", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&long long v38 = buf;
  *((void *)&v38 + 1) = 0x3032000000;
  int v39 = sub_10005DFF8;
  int v40 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestSuggestedMePersonIdentifier");
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10006914C;
  v35[3] = &unk_1002199D8;
  void v35[4] = self;
  int v36 = a3;
  id v15 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100069168;
  v31[3] = &unk_10021BB20;
  v31[4] = self;
  int v34 = a3;
  id v16 = v12;
  id v32 = v16;
  BOOL v33 = buf;
  id v17 = objc_retainBlock(v31);
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069468;
  block[3] = &unk_10021A100;
  int v30 = a3;
  block[4] = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v16;
  id v28 = v15;
  id v29 = v17;
  id v19 = v17;
  os_log_type_t v20 = v15;
  id v21 = v11;
  id v22 = v10;
  id v23 = v16;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestPersonPromoterStatus:(int)a3 withAdvancedFlag:(BOOL)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MAClientHandler] Received requestPersonPromoterStatus MADRequestID %d", buf, 8u);
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100069894;
  v16[3] = &unk_1002199D8;
  v16[4] = self;
  int v17 = a3;
  os_log_type_t v14 = objc_retainBlock(v16);
  id v15 = +[VCPRequestPersonPromoterStatusTask taskWithAdvancedFlag:v7 andPhotoLibraryURL:v10 andProgressHandler:v14 andReply:v11];
  [v15 run];
}

- (void)requestClusterCacheValidation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MAClientHandler] Received requestClusterCacheValidation MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  BOOL v33 = buf;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10005DFF8;
  int v36 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestClusterCacheValidation");
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100069BB8;
  v30[3] = &unk_1002199D8;
  void v30[4] = self;
  int v31 = a3;
  id v12 = objc_retainBlock(v30);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100069BD4;
  v26[3] = &unk_10021A0D8;
  void v26[4] = self;
  int v29 = a3;
  id v13 = v9;
  id v27 = v13;
  id v28 = buf;
  os_log_type_t v14 = objc_retainBlock(v26);
  managementQueue = self->_managementQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100069ED4;
  v20[3] = &unk_10021BAF8;
  int v25 = a3;
  v20[4] = self;
  id v21 = v8;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  int v17 = v12;
  id v18 = v8;
  id v19 = v13;
  dispatch_sync(managementQueue, v20);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetFaceClusteringState:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Received requestResetFaceClusteringState MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  BOOL v33 = buf;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10005DFF8;
  int v36 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestResetFaceClusteringState");
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006A450;
  v30[3] = &unk_1002199D8;
  void v30[4] = self;
  int v31 = a3;
  id v12 = objc_retainBlock(v30);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10006A46C;
  v26[3] = &unk_10021BAD0;
  void v26[4] = self;
  int v29 = a3;
  id v13 = v9;
  id v27 = v13;
  id v28 = buf;
  os_log_type_t v14 = objc_retainBlock(v26);
  managementQueue = self->_managementQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006A750;
  v20[3] = &unk_10021BAF8;
  int v25 = a3;
  v20[4] = self;
  id v21 = v8;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  int v17 = v12;
  id v18 = v8;
  id v19 = v13;
  dispatch_sync(managementQueue, v20);

  _Block_object_dispose(buf, 8);
}

- (void)requestReclusterFaces:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Received requestReclusterFaces MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  BOOL v33 = buf;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10005DFF8;
  int v36 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestReclusterFaces");
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006ACCC;
  v30[3] = &unk_1002199D8;
  void v30[4] = self;
  int v31 = a3;
  id v12 = objc_retainBlock(v30);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10006ACE8;
  v26[3] = &unk_10021BAD0;
  void v26[4] = self;
  int v29 = a3;
  id v13 = v9;
  id v27 = v13;
  id v28 = buf;
  os_log_type_t v14 = objc_retainBlock(v26);
  managementQueue = self->_managementQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006AFCC;
  v20[3] = &unk_10021BAF8;
  int v25 = a3;
  v20[4] = self;
  id v21 = v8;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  int v17 = v12;
  id v18 = v8;
  id v19 = v13;
  dispatch_sync(managementQueue, v20);

  _Block_object_dispose(buf, 8);
}

- (void)requestRebuildPersons:(int)a3 withLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Received requestRebuildPersons MADRequestID %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  long long v38 = buf;
  uint64_t v39 = 0x3032000000;
  int v40 = sub_10005DFF8;
  id v41 = sub_10005E008;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestRebuildPersons");
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10006B574;
  v35[3] = &unk_1002199D8;
  void v35[4] = self;
  int v36 = a3;
  id v15 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10006B590;
  v31[3] = &unk_10021BAD0;
  v31[4] = self;
  int v34 = a3;
  id v16 = v12;
  id v32 = v16;
  BOOL v33 = buf;
  int v17 = objc_retainBlock(v31);
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B874;
  block[3] = &unk_10021A100;
  int v30 = a3;
  block[4] = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v16;
  id v28 = v15;
  id v29 = v17;
  id v19 = v17;
  os_log_type_t v20 = v15;
  id v21 = v11;
  id v22 = v10;
  id v23 = v16;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestPersonPreferenceForPhotoLibraryURL:(id)a3 andReply:(id)a4
{
  id v11 = a3;
  int v5 = (void (**)(id, void *, void))a4;
  os_log_type_t v6 = +[VCPPhotoLibraryManager sharedManager];
  BOOL v7 = [v6 photoLibraryWithURL:v11];

  if (v7)
  {
    id v8 = objc_msgSend(v7, "vcp_analysisPreferences");
    v5[2](v5, v8, 0);
  }
  else
  {
    id v9 = [v11 path];
    id v8 = +[NSString stringWithFormat:@"Failed to find specified Photos Library (%@)", v9];

    id v10 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v8];
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v10);
  }
}

- (void)requestVIPModelStorageFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void *))a5;
  id v10 = +[VCPPhotoLibraryManager sharedManager];
  id v11 = [v10 photoLibraryWithURL:v8];

  if (v11)
  {
    id v12 = objc_msgSend(v11, "vcp_vipModelFilepathForVIPType:", a4);
    if (v12)
    {
      id v13 = 0;
    }
    else
    {
      id v10 = +[NSString stringWithFormat:@"Unknown VIP model type %lu", a4, NSLocalizedDescriptionKey];
      id v18 = v10;
      int v5 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v5];
    }
    v9[2](v9, v12, v13);
    if (!v12)
    {
    }
  }
  else
  {
    os_log_type_t v14 = [v8 path];
    id v15 = +[NSString stringWithFormat:@"Failed to find specified Photos Library (%@)", v14];

    id v16 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v15];
    v9[2](v9, 0, v16);
  }
}

- (void)requestMediaAnalysisDatabaseBackup:(int)a3 withPhotoLibraryURL:(id)a4 forceBackup:(BOOL)a5 andReply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *(void *)&a3;
  id v36 = a4;
  id v35 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = v33;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Received requestMediaAnalysisDatabaseBackup MADRequestID %d", buf, 8u);
    }
  }
  id v10 = +[VCPPhotoLibraryManager sharedManager];
  id v37 = [v10 photoLibraryWithURL:v36];

  if (v37)
  {
    if (v7)
    {
      id v11 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v37];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v12 = [&off_100230398 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v44;
        os_log_type_t v14 = VCPLogToOSLogType[3];
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v44 != v13) {
              objc_enumerationMutation(&off_100230398);
            }
            id v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v18 = MADLastAnalysisBackupTimestampKeyForTask((uint64_t)[v16 unsignedIntegerValue]);
            if (v18)
            {
              [v11 removeKey:v18];
            }
            else if ((int)MediaAnalysisLogLevel() >= 3)
            {
              id v19 = VCPLogInstance();
              if (os_log_type_enabled(v19, v14))
              {
                *(_DWORD *)buf = 134217984;
                NSErrorUserInfoKey v49 = v16;
                _os_log_impl((void *)&_mh_execute_header, v19, v14, "  Unknown backup date key; skipping backup for task %llu",
                  buf,
                  0xCu);
              }
            }
            if (!v18)
            {

              goto LABEL_28;
            }
          }
          id v12 = [&off_100230398 countByEnumeratingWithState:&v43 objects:v50 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      [v11 commit];
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10006C54C;
    v41[3] = &unk_1002199D8;
    v41[4] = self;
    int v42 = v33;
    os_log_type_t v20 = objc_retainBlock(v41);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10006C568;
    v38[3] = &unk_10021BB70;
    void v38[4] = self;
    int v40 = v33;
    id v21 = v35;
    id v39 = v21;
    id v22 = objc_retainBlock(v38);
    NSErrorUserInfoKey v47 = v37;
    id v23 = +[NSArray arrayWithObjects:&v47 count:1];
    id v24 = +[VCPPhotosMaintenanceProcessingTask taskWithPhotoLibraries:v23 andProgressHandler:v20 andCompletionHandler:v22 andCancelBlock:&stru_10021BB90];

    id v25 = +[VCPMADTaskScheduler sharedInstance];
    id v26 = [v25 addForegroundTask:v24 withQoS:qos_class_self()];

    if (v26)
    {
      id v27 = +[NSNumber numberWithUnsignedInteger:v26];
      taskIDMapping = self->_taskIDMapping;
      id v29 = +[NSNumber numberWithInt:v33];
      [(NSMutableDictionary *)taskIDMapping setObject:v27 forKeyedSubscript:v29];
    }
    else
    {
      id v27 = +[NSString stringWithFormat:@"Failed to create task for MADRequestID %d", v33];
      id v29 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v27];
      (*((void (**)(id, void *))v21 + 2))(v21, v29);
    }
  }
  else
  {
    int v30 = [v36 path];
    int v31 = +[NSString stringWithFormat:@"Failed to find specified Photos Library (%@)", v30];

    id v32 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v31];
    (*((void (**)(id, void *))v35 + 2))(v35, v32);
  }
LABEL_28:
}

- (void)requestPhotosSceneFastPassProcessing:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      int v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Received requestFastPassSceneProcessing MADRequestID %d", buf, 8u);
    }
  }
  id v12 = +[VCPPhotoLibraryManager sharedManager];
  uint64_t v13 = [v12 photoLibraryWithURL:v8];

  if (v13)
  {
    if ([v13 isSystemPhotoLibrary])
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10006CD50;
      v31[3] = &unk_1002199D8;
      v31[4] = self;
      int v32 = v6;
      id v27 = objc_retainBlock(v31);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10006CD6C;
      v28[3] = &unk_10021BB70;
      void v28[4] = self;
      int v30 = v6;
      id v14 = v9;
      id v29 = v14;
      id v15 = objc_retainBlock(v28);
      id v16 = +[MADPhotosSceneFastPassProcessingTask taskWithCancelBlock:&stru_10021BBB0 progressHandler:v27 andCompletionHandler:v15];
      uint64_t v17 = +[VCPMADTaskScheduler sharedInstance];
      id v18 = [v17 addForegroundTask:v16 withQoS:qos_class_self()];

      if (v18)
      {
        id v19 = +[NSNumber numberWithUnsignedInteger:v18];
        taskIDMapping = self->_taskIDMapping;
        id v21 = +[NSNumber numberWithInt:v6];
        [(NSMutableDictionary *)taskIDMapping setObject:v19 forKeyedSubscript:v21];
      }
      else
      {
        id v19 = +[NSString stringWithFormat:@"Failed to create task for MADRequestID %d", v6];
        id v21 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v19];
        (*((void (**)(id, void *))v14 + 2))(v14, v21);
      }
    }
    else
    {
      id v25 = +[NSString stringWithFormat:@"Non-SPL is not supported"];
      id v26 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v25];
      (*((void (**)(id, void *))v9 + 2))(v9, v26);
    }
  }
  else
  {
    id v22 = [v8 path];
    id v23 = +[NSString stringWithFormat:@"Failed to find specified Photos Library (%@)", v22];

    id v24 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v23];
    (*((void (**)(id, void *))v9 + 2))(v9, v24);
  }
}

- (void)requestPhotosFaceFastPassProcessing:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      int v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Received requestFastPassFaceProcessing MADRequestID %d", buf, 8u);
    }
  }
  id v12 = +[VCPPhotoLibraryManager sharedManager];
  uint64_t v13 = [v12 photoLibraryWithURL:v8];

  if (v13)
  {
    if ([v13 isSystemPhotoLibrary])
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10006D554;
      v31[3] = &unk_1002199D8;
      v31[4] = self;
      int v32 = v6;
      id v27 = objc_retainBlock(v31);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10006D570;
      v28[3] = &unk_10021BB70;
      void v28[4] = self;
      int v30 = v6;
      id v14 = v9;
      id v29 = v14;
      id v15 = objc_retainBlock(v28);
      id v16 = +[MADPhotosFaceFastPassProcessingTask taskWithCancelBlock:&stru_10021BBD0 progressHandler:v27 andCompletionHandler:v15];
      uint64_t v17 = +[VCPMADTaskScheduler sharedInstance];
      id v18 = [v17 addForegroundTask:v16 withQoS:qos_class_self()];

      if (v18)
      {
        id v19 = +[NSNumber numberWithUnsignedInteger:v18];
        taskIDMapping = self->_taskIDMapping;
        id v21 = +[NSNumber numberWithInt:v6];
        [(NSMutableDictionary *)taskIDMapping setObject:v19 forKeyedSubscript:v21];
      }
      else
      {
        id v19 = +[NSString stringWithFormat:@"Failed to create task for MADRequestID %d", v6];
        id v21 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v19];
        (*((void (**)(id, void *))v14 + 2))(v14, v21);
      }
    }
    else
    {
      id v25 = +[NSString stringWithFormat:@"Non-SPL is not supported"];
      id v26 = [(id)objc_opt_class() errorForStatus:4294967246 withDescription:v25];
      (*((void (**)(id, void *))v9 + 2))(v9, v26);
    }
  }
  else
  {
    id v22 = [v8 path];
    id v23 = +[NSString stringWithFormat:@"Failed to find specified Photos Library (%@)", v22];

    id v24 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v23];
    (*((void (**)(id, void *))v9 + 2))(v9, v24);
  }
}

- (void)requestDatabaseRestoreFastPassProcessing:(int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Received requestDatabaseRestoreFastPassProcessing MADRequestID %d", buf, 8u);
    }
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10006DBD4;
  v25[3] = &unk_1002199D8;
  void v25[4] = self;
  int v26 = v4;
  id v9 = objc_retainBlock(v25);
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  os_log_type_t v20 = sub_10006DBF0;
  id v21 = &unk_10021BB70;
  id v22 = self;
  int v24 = v4;
  id v10 = v6;
  id v23 = v10;
  os_log_type_t v11 = objc_retainBlock(&v18);
  id v12 = +[MADDatabaseRestoreFastPassProcessingTask taskWithCancelBlock:&stru_10021BBF0 progressHandler:v9 andCompletionHandler:v11];
  uint64_t v13 = +[VCPMADTaskScheduler sharedInstance];
  id v14 = [v13 addForegroundTask:v12 withQoS:qos_class_self()];

  if (v14)
  {
    id v15 = +[NSNumber numberWithUnsignedInteger:v14];
    taskIDMapping = self->_taskIDMapping;
    uint64_t v17 = +[NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)taskIDMapping setObject:v15 forKeyedSubscript:v17];
  }
  else
  {
    id v15 = +[NSString stringWithFormat:@"Failed to create task for MADRequestID %d", v4, v18, v19, v20, v21, v22];
    uint64_t v17 = [(id)objc_opt_class() errorForStatus:4294967278 withDescription:v15];
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
  }
}

- (void)queryAutoCounterOptInStatus:(int)a3 withPhotoLibraryURL:(id)a4 personLocalIdentifiers:(id)a5 andReply:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = (void (**)(id, id, void))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MAClientHandler] Received queryAutoCounterOptInStatus MADRequestID %d", buf, 8u);
    }
  }
  id v14 = +[VCPPhotoLibraryManager sharedManager];
  id v15 = [v14 photoLibraryWithURL:v9];

  id v16 = +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:v15];
  uint64_t v17 = +[NSMutableDictionary dictionary];
  *(void *)buf = 0;
  id v36 = buf;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_10005DFF8;
  id v39 = sub_10005E008;
  id v40 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10006E2F0;
  v27[3] = &unk_10021BC18;
  id v18 = v16;
  id v28 = v18;
  int v30 = buf;
  id v19 = v17;
  id v29 = v19;
  [v10 enumerateObjectsUsingBlock:v27];
  if (*((void *)v36 + 5))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = *((void *)v36 + 5);
        *(_DWORD *)int v31 = 67109378;
        int v32 = a3;
        __int16 v33 = 2112;
        uint64_t v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[MAClientHandler] Failed to queryAutoCounterOptInStatus MADRequestID %d %@", v31, 0x12u);
      }
    }
    id v23 = 0;
    uint64_t v24 = *((void *)v36 + 5);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)int v31 = 67109120;
        int v32 = a3;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "[MAClientHandler] Completed queryAutoCounterOptInStatus MADRequestID %d", v31, 8u);
      }
    }
    uint64_t v24 = 0;
    id v23 = v19;
  }
  v11[2](v11, v23, v24);

  _Block_object_dispose(buf, 8);
}

- (void)requestOptInAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 persons:(id)a5 andReply:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = (void (**)(id, id, void))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MAClientHandler] Received requestOptInAutoCounter MADRequestID %d", buf, 8u);
    }
  }
  id v14 = +[VCPPhotoLibraryManager sharedManager];
  id v15 = [v14 photoLibraryWithURL:v9];

  id v16 = +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:v15];
  uint64_t v17 = +[NSMutableDictionary dictionary];
  *(void *)buf = 0;
  id v36 = buf;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_10005DFF8;
  id v39 = sub_10005E008;
  id v40 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10006E818;
  v27[3] = &unk_10021BC80;
  id v18 = v16;
  id v28 = v18;
  int v30 = buf;
  id v19 = v17;
  id v29 = v19;
  [v10 enumerateObjectsUsingBlock:v27];
  if (*((void *)v36 + 5))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = *((void *)v36 + 5);
        *(_DWORD *)int v31 = 67109378;
        int v32 = a3;
        __int16 v33 = 2112;
        uint64_t v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[MAClientHandler] Failed to requestOptInAutoCounter MADRequestID %d %@", v31, 0x12u);
      }
    }
    id v23 = 0;
    uint64_t v24 = *((void *)v36 + 5);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)int v31 = 67109120;
        int v32 = a3;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "[MAClientHandler] Completed requestOptInAutoCounter MADRequestID %d", v31, 8u);
      }
    }
    uint64_t v24 = 0;
    id v23 = v19;
  }
  v11[2](v11, v23, v24);

  _Block_object_dispose(buf, 8);
}

- (void)requestDumpAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v7 = a4;
  os_log_type_t v8 = (void (**)(id, void, void *))a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 67109120;
      int v34 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[MAClientHandler] Received requestDumpAutoCounter MADRequestID %d", buf, 8u);
    }
  }
  os_log_type_t v11 = +[VCPPhotoLibraryManager sharedManager];
  id v12 = [v11 photoLibraryWithURL:v7];

  os_log_type_t v13 = +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:v12];
  if (objc_msgSend(v12, "mad_useVUGallery"))
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    id v14 = (id *)&v29;
    id v15 = (id *)&v30;
    unsigned int v16 = [v13 exportVUGalleryClusterStates:&v30 error:&v29 extendTimeoutBlock:&stru_10021BCA0 cancelBlock:&stru_10021BCC0];
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    id v14 = (id *)&v27;
    id v15 = (id *)&v28;
    unsigned int v16 = [v13 exportClustersStates:&v28 error:&v27 extendTimeoutBlock:&stru_10021BCE0 cancelBlock:&stru_10021BD00];
  }
  unsigned int v17 = v16;
  id v18 = *v15;
  id v19 = *v14;
  os_log_type_t v20 = v19;
  if (v17 || v19)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 67109378;
        int v34 = a3;
        __int16 v35 = 2112;
        id v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "[MAClientHandler] Failed to requestDumpAutoCounter MADRequestID %d %@", buf, 0x12u);
      }
    }
    v8[2](v8, 0, v20);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 67109120;
        int v34 = a3;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[MAClientHandler] Completed requestDumpAutoCounter MADRequestID %d", buf, 8u);
      }
    }
    CFStringRef v31 = @"FileURL";
    id v23 = [v18 absoluteString];
    int v32 = v23;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    ((void (**)(id, void *, void *))v8)[2](v8, v24, 0);
  }
}

- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v30 = a4;
  uint64_t v29 = (void (**)(id, id, void))a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 67109120;
      int v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MAClientHandler] Received requestAutoCounterAccuracyCalculation MADRequestID %d", buf, 8u);
    }
  }
  id v9 = +[VCPPhotoLibraryManager sharedManager];
  os_log_type_t v10 = [v9 photoLibraryWithURL:v30];

  CFStringRef v31 = +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:v10];
  if (objc_msgSend(v10, "mad_useVUGallery"))
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    os_log_type_t v11 = (id *)&v35;
    id v12 = (id *)&v36;
    unsigned int v13 = [v31 exportVUGalleryClusterStates:&v36 error:&v35 extendTimeoutBlock:&stru_10021BD20 cancelBlock:&stru_10021BD40];
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    os_log_type_t v11 = (id *)&v33;
    id v12 = (id *)&v34;
    unsigned int v13 = [v31 exportClustersStates:&v34 error:&v33 extendTimeoutBlock:&stru_10021BD20 cancelBlock:&stru_10021BD40];
  }
  unsigned int v14 = v13;
  id v15 = *v12;
  id v16 = *v11;
  unsigned int v17 = v16;
  if (!v14 && !v16)
  {
    v32[1] = 0;
    signed int v18 = VCPFetchPersonPromoterClusterForEvaluation();
    id v19 = 0;
    if (v18)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        id v22 = 0;
        goto LABEL_26;
      }
      os_log_type_t v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 67109376;
        int v40 = v6;
        __int16 v41 = 1024;
        unsigned int v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[MAClientHandler] Failed to VCPFetchPersonPromoterClusterForEvaluation with MADRequestID %d %d", buf, 0xEu);
      }
      id v22 = 0;
    }
    else
    {
      v32[0] = 0;
      signed int v18 = [v31 calculateAndReportClusterAccuracyWithVisionClusterURL:v15 andPersonClusters:v19 results:v32 extendTimeoutBlock:&stru_10021BD20 cancelBlock:&stru_10021BD40];
      id v22 = v32[0];
      if (!v18)
      {
        v29[2](v29, v22, 0);
        goto LABEL_27;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_26;
      }
      os_log_type_t v20 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v25))
      {
        *(_DWORD *)buf = 67109376;
        int v40 = v6;
        __int16 v41 = 1024;
        unsigned int v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v25, "[MAClientHandler] Failed to calculate Vision and Person cluster accuracy with MADRequestID %d %d", buf, 0xEu);
      }
    }

LABEL_26:
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    os_log_type_t v26 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to calculate cluster accuracy with MADRequestID %d", v6];
    long long v38 = v26;
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v28 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v18 userInfo:v27];
    ((void (**)(id, id, void *))v29)[2](v29, 0, v28);

    goto LABEL_27;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v23 = VCPLogInstance();
    os_log_type_t v24 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v23, v24))
    {
      *(_DWORD *)buf = 67109376;
      int v40 = v6;
      __int16 v41 = 1024;
      unsigned int v42 = v14;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[MAClientHandler] Failed to requestAutoCounterAccuracyCalculation MADRequestID %d %d", buf, 0xEu);
    }
  }
  id v19 = 0;
  id v22 = 0;
  ((void (**)(id, id, void *))v29)[2](v29, 0, v17);
LABEL_27:
}

- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 clusterStateURL:(id)a5 groundTruthURL:(id)a6 andReply:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v28 = a4;
  id v27 = a5;
  id v11 = a6;
  id v12 = (void (**)(id, id, void))a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unsigned int v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      int v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received requestAutoCounterAccuracyCalculationWithgroundTruthURL MADRequestID %d", buf, 8u);
    }
  }
  id v15 = +[VCPPhotoLibraryManager sharedManager];
  id v16 = [v15 photoLibraryWithURL:v28];

  unsigned int v17 = +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:v16];
  v29[1] = 0;
  signed int v18 = VCPFetchPersonPromoterClusterForEvaluation();
  id v19 = 0;
  if (v18)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      id v22 = 0;
      goto LABEL_16;
    }
    os_log_type_t v20 = VCPLogInstance();
    os_log_type_t v21 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 67109120;
      int v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[MAClientHandler] Failed in fetching unverified persons with MADRequestID %d", buf, 8u);
    }
    id v22 = 0;
    goto LABEL_10;
  }
  v29[0] = 0;
  signed int v18 = [v17 calculateAndReportClusterAccuracyWithVisionClusterURL:v27 andPersonClusters:v19 withGroundtruth:v11 results:v29 extendTimeoutBlock:&stru_10021BD60 cancelBlock:&stru_10021BD80];
  id v22 = v29[0];
  if (!v18)
  {
    v12[2](v12, v22, 0);
    goto LABEL_17;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    os_log_type_t v20 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v20, v23))
    {
      *(_DWORD *)buf = 67109120;
      int v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, v23, "[MAClientHandler] Failed in calculating Vision and Person cluster accuracy with MADRequestID %d", buf, 8u);
    }
LABEL_10:
  }
LABEL_16:
  NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
  os_log_type_t v24 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to calculate cluster accuracy against GroundTruth %@ with MADRequestID %d", v11, v10];
  CFStringRef v31 = v24;
  os_log_type_t v25 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  os_log_type_t v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v18 userInfo:v25];
  ((void (**)(id, id, void *))v12)[2](v12, 0, v26);

LABEL_17:
}

- (void)requestAutoCounterSIMLValidation:(int)a3 withPhotoLibraryURL:(id)a4 simlGroundTruthURL:(id)a5 andReply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v23 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, void, void *))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MAClientHandler] Received requestAutoCounterSIMLValidation MADRequestID %d", buf, 8u);
    }
  }
  unsigned int v13 = +[VCPPhotoLibraryManager sharedManager];
  os_log_type_t v14 = [v13 photoLibraryWithURL:v23];

  id v15 = +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:v14];
  id v24 = 0;
  signed int v16 = [v15 validateClusterAccuracyWithSIMLGroundtruth:v9 results:&v24 extendTimeoutBlock:&stru_10021BDA0 cancelBlock:&stru_10021BDC0];
  id v17 = v24;
  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      signed int v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 67109120;
        int v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[MAClientHandler] Failed to validate against SIML ground truth with MADRequestID %d", buf, 8u);
      }
    }
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    os_log_type_t v20 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to validate against SIML ground truth %@ with MADRequestID %d", v9, v8];
    os_log_type_t v26 = v20;
    os_log_type_t v21 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v22 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v16 userInfo:v21];
    v10[2](v10, 0, v22);
  }
  else
  {
    ((void (**)(id, id, void *))v10)[2](v10, v17, 0);
  }
}

- (void)requestIdentificationOfFacesWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withRequestID:(int)a5 andReply:(id)a6
{
  id v10 = a3;
  id v24 = a4;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MAClientHandler] Received on-demand face identification request (%d)", buf, 8u);
    }
  }
  *(void *)buf = 0;
  uint64_t v34 = buf;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_10005DFF8;
  NSErrorUserInfoKey v37 = sub_10005E008;
  VCPTransactionWithName(@"com.apple.mediaanalysisd.service");
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  id v32[2] = sub_1000700A4;
  v32[3] = &unk_100219E10;
  void v32[4] = buf;
  id v15 = objc_retainBlock(v32);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000700B8;
  v28[3] = &unk_10021BDE8;
  int v31 = a5;
  id v16 = v11;
  id v29 = v16;
  id v17 = v15;
  id v30 = v17;
  signed int v18 = v10;
  os_log_type_t v19 = +[VCPPhotosFaceIdentificationTask taskWithFaceLocalIdentifiers:v10 fromPhotoLibraryWithURL:v24 withCompletionHandler:v28];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v21 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000701EC;
  v25[3] = &unk_10021BE10;
  id v22 = v16;
  id v26 = v22;
  id v23 = v17;
  id v27 = v23;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v19 withRequestID:v21 schedulingErrorHandler:v25];

  _Block_object_dispose(buf, 8);
}

- (void)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withRequestID:(int)a6 andReply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67109120;
      int v32 = a6;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[MAClientHandler] Received on-demand Photos asset processing request (%d)", buf, 8u);
    }
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  id v29[2] = sub_100070534;
  v29[3] = &unk_1002199D8;
  void v29[4] = self;
  int v30 = a6;
  signed int v18 = objc_retainBlock(v29);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100070550;
  v26[3] = &unk_10021BE38;
  int v28 = a6;
  id v19 = v14;
  id v27 = v19;
  os_log_type_t v20 = +[VCPPhotosAssetProcessingTask taskWithProcessingTypes:a3 forAssetsWithLocalIdentifiers:v12 fromPhotoLibraryWithURL:v13 withProgressHandler:v18 andCompletionHandler:v26];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v22 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100070654;
  v24[3] = &unk_100219940;
  id v23 = v19;
  id v25 = v23;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v20 withRequestID:v22 schedulingErrorHandler:v24];
}

- (void)requestDeferredProcessingTypes:(id)a3 forAssetsWithLocalIdentifiers:(id)a4 withPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(void))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = [v10 count];
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received Moments request to schedule deferred processing for %u assets", (uint8_t *)&buf, 8u);
    }
  }
  id v15 = +[VCPPhotoLibraryManager sharedManager];
  os_log_type_t v16 = [v15 photoLibraryWithURL:v11];

  if (v16)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000;
    NSErrorUserInfoKey v49 = sub_10005DFF8;
    id v50 = sub_10005E008;
    id v51 = 0;
    id v17 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v16];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100070CA0;
    v37[3] = &unk_10021BE60;
    id v38 = v10;
    id v18 = v17;
    id v39 = v18;
    p_long long buf = &buf;
    [v9 enumerateIndexesUsingBlock:v37];
    +[VCPDatabaseManager releaseSharedDatabaseForPhotoLibrary:v16];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v12[2](v12);
LABEL_21:

      _Block_object_dispose(&buf, 8);
      goto LABEL_22;
    }
    signed int v24 = [v18 commit];
    if (v24)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v25 = VCPLogInstance();
        os_log_type_t v26 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v25, v26))
        {
          *(_WORD *)__int16 v41 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "[MAClientHandler] Failed to schedule all assets for Moments deferred processing", v41, 2u);
        }
      }
      NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
      id v27 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to schedule all assets for Moments deferred processing"];
      long long v46 = v27;
      int v28 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v29 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v24 userInfo:v28];
      int v30 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v29;
    }
    else
    {
      int v31 = +[MADMomentsDeferredBackgroundSystemTask sharedTask];
      int v32 = (id *)(*((void *)&buf + 1) + 40);
      id obj = *(id *)(*((void *)&buf + 1) + 40);
      [v31 submitTask:&obj];
      objc_storeStrong(v32, obj);

      if (!*(void *)(*((void *)&buf + 1) + 40) || (int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_20;
      }
      id v27 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v27, v33))
      {
        uint64_t v34 = +[MADMomentsDeferredBackgroundSystemTask identifier];
        uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)__int16 v41 = 138412546;
        unsigned int v42 = v34;
        __int16 v43 = 2112;
        uint64_t v44 = v35;
        _os_log_impl((void *)&_mh_execute_header, v27, v33, "[MAClientHandler][%@] Failed to submit the BGST task with error: %@", v41, 0x16u);
      }
    }

LABEL_20:
    ((void (*)(void (**)(void), void))v12[2])(v12, *(void *)(*((void *)&buf + 1) + 40));
    goto LABEL_21;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v19 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v19, v20))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MAClientHandler] Invalid photo library URL (%@)", (uint8_t *)&buf, 0xCu);
    }
  }
  NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
  uint64_t v21 = +[NSString stringWithFormat:@"[MAClientHandler] Invalid photo library URL (%@)", v11];
  NSErrorUserInfoKey v53 = v21;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  id v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v22];
  ((void (*)(void (**)(void), void *))v12[2])(v12, v23);

LABEL_22:
}

- (void)requestForceDeferredProcessing:(int)a3 andReply:(id)a4
{
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MAClientHandler] Received Moments request to force deferred processing", buf, 2u);
    }
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000711B4;
  v21[3] = &unk_1002199D8;
  v21[4] = self;
  int v22 = a3;
  id v9 = objc_retainBlock(v21);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000711D0;
  v18[3] = &unk_10021B640;
  int v20 = a3;
  id v10 = v6;
  v18[4] = self;
  id v19 = v10;
  id v11 = objc_retainBlock(v18);
  id v12 = +[MADMomentsDeferredProcessingTask taskWithCancelBlock:&stru_10021BE80 progressHandler:v9 andCompletionHandler:v11];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v14 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000713C0;
  v16[3] = &unk_100219940;
  id v15 = v10;
  id v17 = v15;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v12 withRequestID:v14 schedulingErrorHandler:v16];
}

- (void)queryAssetsPendingDeferredProcessingWithPhotoLibraryURL:(id)a3 andReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MAClientHandler] Received Moments request to query scheduled assets in photo library %@", buf, 0xCu);
    }
  }
  id v9 = +[VCPPhotoLibraryManager sharedManager];
  id v10 = [v9 photoLibraryWithURL:v5];

  if (v10)
  {
    id v11 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v10];
    id v22 = 0;
    signed int v12 = [v11 fetchAllMomentsScheduledAssets:&v22];
    id v13 = v22;
    if (!v12)
    {
      id v21 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v10];
      v6[2](v6, v13, 0);
      goto LABEL_19;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MAClientHandler] Failed to fetch scheduled assets in Photo Library %@", buf, 0xCu);
      }
    }
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    os_log_type_t v16 = +[NSString stringWithFormat:@"[MAClientHandler] Failed to fetch scheduled assets in Photo Library %@", v5];
    signed int v24 = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v18 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v12 userInfo:v17];
    ((void (**)(id, id, void *))v6)[2](v6, 0, v18);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v5;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MAClientHandler] Invalid photo library URL (%@)", buf, 0xCu);
      }
    }
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    id v13 = +[NSString stringWithFormat:@"[MAClientHandler] Invalid photo library URL (%@)", v5];
    id v26 = v13;
    id v11 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    os_log_type_t v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v11];
    ((void (**)(id, id, void *))v6)[2](v6, 0, v16);
  }

LABEL_19:
}

- (void)downloadVideoEncoderIfNeededWithReply:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  uint64_t v4 = +[VCPMobileAssetManager sharedManager];
  id v5 = [v4 retrieveAssetLocalURL:0];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Video encoder mobile asset download failed", v11, 2u);
      }
    }
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    id v9 = +[NSString stringWithFormat:@"[MAClientHandler] Video encoder mobile asset download failed"];
    id v13 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v10];
  }
  v3[2](v3, v6);
}

- (void)requestStaticStickerScoring:(int)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v34) = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MAClientHandler] Received on-demand Photos static sticker scoring request (%d)", buf, 8u);
    }
  }
  os_log_type_t v16 = +[VCPPhotoLibraryManager sharedManager];
  id v17 = [v16 photoLibraryWithURL:v10];

  if (v17)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100071DF8;
    v28[3] = &unk_10021BEA8;
    int v30 = a3;
    id v18 = v12;
    id v29 = v18;
    id v19 = +[MADPhotosOnDemandStaticStickerScoreTask taskWithPhotoLibrary:v17 options:v11 completionHandler:v28];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100071EFC;
    v26[3] = &unk_100219940;
    id v27 = v18;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v19 withRequestID:a3 schedulingErrorHandler:v26];

    id v21 = v29;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)long long buf = 138412290;
        id v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[MAClientHandler] Invalid photo library URL (%@)", buf, 0xCu);
      }
    }
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    id v21 = +[NSString stringWithFormat:@"[MAClientHandler] Invalid photo library URL (%@)", v10];
    int v32 = v21;
    signed int v24 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    NSErrorUserInfoKey v25 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v24];
    (*((void (**)(id, void *))v12 + 2))(v12, v25);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuingTaskScheduler, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  sub_100004484((const void **)&self->_secTask.value_);
  objc_storeStrong((id *)&self->_taskIDMapping, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  return self;
}

@end