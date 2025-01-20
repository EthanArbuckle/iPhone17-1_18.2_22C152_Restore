@interface VCPMediaAnalysisDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (VCPMediaAnalysisDaemon)init;
- (int)run:(int)a3 argv:(const char *)a4;
- (void)registerClient:(id)a3 forPhotoLibraryURL:(id)a4 withReply:(id)a5;
- (void)registerPhotosTasks;
- (void)storeAnalysis:(id)a3 forAsset:(id)a4 fromPhotoLibraryURL:(id)a5 withReply:(id)a6;
@end

@implementation VCPMediaAnalysisDaemon

- (VCPMediaAnalysisDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)VCPMediaAnalysisDaemon;
  v2 = [(VCPMediaAnalysisDaemon *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(MADDatabaseRestoreFastPassBackgroundSystemTask);
    databaseRestoreFastPassProcessing = v2->_databaseRestoreFastPassProcessing;
    v2->_databaseRestoreFastPassProcessing = v3;

    v5 = objc_alloc_init(MADPhotosSceneFastPassBackgroundSystemTask);
    photosSceneFastPassProcessing = v2->_photosSceneFastPassProcessing;
    v2->_photosSceneFastPassProcessing = v5;

    v7 = objc_alloc_init(MADPhotosFaceFastPassBackgroundSystemTask);
    photosFaceFastPassProcessing = v2->_photosFaceFastPassProcessing;
    v2->_photosFaceFastPassProcessing = v7;

    uint64_t v9 = +[NSMutableArray array];
    analysisClients = v2->_analysisClients;
    v2->_analysisClients = (NSMutableArray *)v9;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_publicServiceListener != v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Checking client entitlements...", buf, 2u);
      }
    }
    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    SecTaskRef v10 = SecTaskCreateWithAuditToken(0, &token);
    SecTaskRef v33 = v10;
    if (!v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v18, v19))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to query client entitlements; denying connection",
            buf,
            2u);
        }
      }
      goto LABEL_41;
    }
    CFErrorRef error = 0;
    CFTypeRef v11 = SecTaskCopyValueForEntitlement(v10, @"com.apple.mediaanalysisd.client", &error);
    CFTypeRef cf1 = v11;
    if (error)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        objc_super v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v12, v13))
        {
          *(_DWORD *)buf = 138412290;
          CFErrorRef v35 = error;
          v14 = "Failed to copy value for entitlement (%@)";
          v15 = v12;
          os_log_type_t v16 = v13;
          uint32_t v17 = 12;
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
          goto LABEL_39;
        }
        goto LABEL_39;
      }
      goto LABEL_40;
    }
    if (!v11 || (CFTypeID v20 = CFGetTypeID(v11), v20 != CFBooleanGetTypeID()) || !CFEqual(cf1, kCFBooleanTrue))
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        objc_super v12 = VCPLogInstance();
        os_log_type_t v24 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v12, v24))
        {
          *(_WORD *)buf = 0;
          v14 = "Client not entitled; denying connection";
          v15 = v12;
          os_log_type_t v16 = v24;
          uint32_t v17 = 2;
          goto LABEL_38;
        }
LABEL_39:
      }
LABEL_40:
      sub_100004484(&cf1);
      sub_100004484((const void **)&error);
LABEL_41:
      sub_100004484((const void **)&v33);
      goto LABEL_42;
    }
    sub_100004484(&cf1);
    sub_100004484((const void **)&error);
    sub_100004484((const void **)&v33);
  }
  if (self->_storageListener == v6)
  {
    v23 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPStorageServiceProtocol];
    [v7 setExportedInterface:v23];

    [v7 setExportedObject:self];
    goto LABEL_45;
  }
  if (self->_realTimeListener == v6
    || self->_analysisListener == v6
    || self->_publicServiceListener == v6
    || self->_homeKitListener == v6
    || self->_homeKitSessionListener == v6
    || self->_macsListener == v6
    || self->_embeddingStoreListener == v6)
  {
    v26 = [(id)objc_opt_class() clientHandlerWithXPCConnection:v7];
    if (!v26)
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_42;
      }
      v21 = VCPLogInstance();
      os_log_type_t v29 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v21, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v29, "Failed to add client; dropping connection", buf, 2u);
      }
      goto LABEL_33;
    }
    v27 = +[VCPClientManager sharedManager];
    [v27 addClientHandler:v26];

LABEL_45:
    objc_msgSend(v7, "resume", cf1);
    BOOL v25 = 1;
    goto LABEL_46;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v21 = VCPLogInstance();
    os_log_type_t v22 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v21, v22))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Unknown service requested; denying connection", buf, 2u);
    }
LABEL_33:
  }
LABEL_42:
  BOOL v25 = 0;
LABEL_46:

  return v25;
}

- (void)storeAnalysis:(id)a3 forAsset:(id)a4 fromPhotoLibraryURL:(id)a5 withReply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_super v12 = (void (**)(void))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      v15 = MediaAnalysisTypeDescription((uint64_t)objc_msgSend(v9, "vcp_types"));
      *(_DWORD *)buf = 138412546;
      id v37 = v10;
      __int16 v38 = 2112;
      v39 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "  [%@] Received storage request with analysis types: (%@)", buf, 0x16u);
    }
  }
  os_log_type_t v16 = +[VCPPhotoLibraryManager sharedManager];
  uint32_t v17 = [v16 photoLibraryWithURL:v11];

  if (!v17)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v25, v26))
      {
        v27 = [v11 path];
        *(_DWORD *)buf = 138412290;
        id v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, " Failed to open Photos Library at %@; cannot store analysis",
          buf,
          0xCu);
      }
    }
    goto LABEL_23;
  }
  v18 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v17];
  if (!v18) {
    goto LABEL_23;
  }
  os_log_type_t v19 = +[PHAsset vcp_fetchOptionsForLibrary:v17 forTaskID:1];
  id v35 = v10;
  CFTypeID v20 = +[NSArray arrayWithObjects:&v35 count:1];
  v21 = +[PHAsset fetchAssetsWithLocalIdentifiers:v20 options:v19];

  if ([v21 count] == (id)1)
  {
    os_log_type_t v22 = [v21 objectAtIndexedSubscript:0];
    unsigned int v23 = [v18 storeAnalysisForAsset:v22 analysis:v9];

    if (v23 == -108 || v23 == -36)
    {
      unsigned int v24 = v23;
    }
    else
    {
      unsigned int v24 = v23;
      if (v23 != -23) {
        unsigned int v24 = 0;
      }
    }
    if (v23 == -108 || v23 == -36 || v23 == -23)
    {
      int v28 = v24;
    }
    else
    {
      unsigned int v31 = [v18 commit];
      if (v31 == -108 || v31 == -36)
      {
        int v28 = v31;
      }
      else
      {
        int v28 = v31;
        if (v31 != -23) {
          int v28 = v24;
        }
      }
      if (v31 != -108
        && v31 != -36
        && v31 != -23
        && +[VCPVideoCNNAnalyzer isMUBackboneEnabled])
      {
        SecTaskRef v33 = [v21 objectAtIndexedSubscript:0];
        v32 = [v33 localIdentifier];
        v34 = +[VSKAsset mad_assetsWithLocalIdentifier:v32 mediaAnalysisResults:v9];

        if ([v34 count]) {
          +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:v34 photoLibrary:v17 cancelBlock:&stru_100219798 error:0];
        }
      }
    }
  }
  else
  {
    int v28 = -18;
  }

  if (v28)
  {
LABEL_23:
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v10;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "  [%@] Failed to store analysis", buf, 0xCu);
      }
    }
  }
  v12[2](v12);
}

- (void)registerClient:(id)a3 forPhotoLibraryURL:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = +[VCPPhotoLibraryManager sharedManager];
  id v11 = [v10 photoLibraryWithURL:v8];

  if (v11)
  {
    objc_msgSend(v11, "vcp_mediaAnalysisDirectory");
    id v12 = objc_claimAutoreleasedReturnValue();
    [v12 UTF8String];
    os_log_type_t v13 = (void *)sandbox_extension_issue_file();
    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v14 = VCPLogInstance();
        os_log_type_t v15 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v14, v15))
        {
          int v22 = 138412546;
          id v23 = v12;
          __int16 v24 = 2112;
          id v25 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "Issuing sandbox extension for %@ to %@", (uint8_t *)&v22, 0x16u);
        }
      }
      os_log_type_t v16 = +[NSString stringWithUTF8String:v13];
      v9[2](v9, v16);

      free(v13);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        CFTypeID v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v20, v21))
        {
          int v22 = 138412546;
          id v23 = v12;
          __int16 v24 = 2112;
          id v25 = v7;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to issue sandbox extension on %@ for %@", (uint8_t *)&v22, 0x16u);
        }
      }
      v9[2](v9, 0);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint32_t v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v17, v18))
      {
        os_log_type_t v19 = [v8 path];
        int v22 = 138412290;
        id v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to open Photos Library at %@; cannot issue sandbox extension",
          (uint8_t *)&v22,
          0xCu);
      }
    }
    v9[2](v9, 0);
  }
}

- (void)registerPhotosTasks
{
  id v2 = +[MADPhotosSceneBackgroundSystemTask sharedTask];
  [v2 registerTask];

  id v3 = +[MADPhotosFullBackgroundSystemTask sharedTask];
  [v3 registerTask];

  id v4 = +[MADPhotosFaceBackgroundSystemTask sharedTask];
  [v4 registerTask];

  id v5 = +[MADPhotosMaintenanceBackgroundSystemTask sharedTask];
  [v5 registerTask];

  id v6 = +[MADPhotosOCRBackgroundSystemTask sharedTask];
  [v6 registerTask];

  id v7 = +[MADProgressReporterBackgroundSystemTask sharedTask];
  [v7 registerTask];

  id v8 = +[MADPhotosVisualSearchBackgroundSystemTask sharedTask];
  [v8 registerTask];

  if (_os_feature_enabled_impl())
  {
    id v9 = +[MADPhotosPECBackgroundSystemTask sharedTask];
    [v9 registerTask];
  }
}

- (int)run:(int)a3 argv:(const char *)a4
{
  +[PHPhotoLibrary enableMultiLibraryMode];
  id v5 = +[MADPhotosDeferredBackgroundSystemTask sharedTask];
  [v5 registerTask];

  id v6 = +[MADMomentsDeferredBackgroundSystemTask sharedTask];
  [v6 registerTask];

  id v7 = +[MADSpotlightImageBackgroundSystemTask sharedTask];
  [v7 registerTask];

  id v8 = +[MADSpotlightMovieBackgroundSystemTask sharedTask];
  [v8 registerTask];

  id v9 = +[MADComputeServiceBackgroundSystemTask sharedTask];
  [v9 registerTask];

  id v10 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mediaanalysisd.photos"];
  storageListener = self->_storageListener;
  self->_storageListener = v10;

  [(NSXPCListener *)self->_storageListener setDelegate:self];
  [(NSXPCListener *)self->_storageListener resume];
  id v12 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mediaanalysisd.analysis"];
  analysisListener = self->_analysisListener;
  self->_analysisListener = v12;

  [(NSXPCListener *)self->_analysisListener setDelegate:self];
  [(NSXPCListener *)self->_analysisListener resume];
  os_log_type_t v14 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mediaanalysisd.homekit"];
  homeKitListener = self->_homeKitListener;
  self->_homeKitListener = v14;

  [(NSXPCListener *)self->_homeKitListener setDelegate:self];
  [(NSXPCListener *)self->_homeKitListener resume];
  os_log_type_t v16 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mediaanalysisd.homekitsession"];
  homeKitSessionListener = self->_homeKitSessionListener;
  self->_homeKitSessionListener = v16;

  [(NSXPCListener *)self->_homeKitSessionListener setDelegate:self];
  [(NSXPCListener *)self->_homeKitSessionListener resume];
  id v18 = objc_alloc((Class)NSXPCListener);
  os_log_type_t v19 = (NSXPCListener *)[v18 initWithMachServiceName:MediaAnalysisRealTimeServiceName];
  realTimeListener = self->_realTimeListener;
  self->_realTimeListener = v19;

  [(NSXPCListener *)self->_realTimeListener setDelegate:self];
  [(NSXPCListener *)self->_realTimeListener resume];
  os_log_type_t v21 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mediaanalysisd.service.public"];
  publicServiceListener = self->_publicServiceListener;
  self->_publicServiceListener = v21;

  [(NSXPCListener *)self->_publicServiceListener setDelegate:self];
  [(NSXPCListener *)self->_publicServiceListener resume];
  id v23 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mediaanalysisd.computeservice"];
  macsListener = self->_macsListener;
  self->_macsListener = v23;

  [(NSXPCListener *)self->_macsListener setDelegate:self];
  [(NSXPCListener *)self->_macsListener resume];
  id v25 = objc_alloc((Class)NSXPCListener);
  os_log_type_t v26 = +[MADEmbeddingStoreService serviceName];
  v27 = (NSXPCListener *)[v25 initWithMachServiceName:v26];
  embeddingStoreListener = self->_embeddingStoreListener;
  self->_embeddingStoreListener = v27;

  [(NSXPCListener *)self->_embeddingStoreListener setDelegate:self];
  [(NSXPCListener *)self->_embeddingStoreListener resume];
  if (+[VCPDeviceInformation isHomePod])
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      os_log_type_t v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)id v37 = 138412290;
        *(void *)&v37[4] = objc_opt_class();
        id v31 = *(id *)&v37[4];
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%@] HomePod system; bypassing registering core activities",
          v37,
          0xCu);
      }
    }
  }
  else
  {
    [(VCPMediaAnalysisDaemon *)self registerPhotosTasks];
    v32 = +[MADOTAMaintenanceBackgroundSystemTask sharedTask];
    [v32 registerTask];
  }
  [(MADFastPassBackgroundSystemTask *)self->_databaseRestoreFastPassProcessing registerTask];
  [(MADFastPassBackgroundSystemTask *)self->_photosSceneFastPassProcessing registerTask];
  [(MADFastPassBackgroundSystemTask *)self->_photosFaceFastPassProcessing registerTask];
  SecTaskRef v33 = +[MADPreheatBackgroundSystemTask sharedTask];
  [v33 registerTask];

  v34 = +[MADHomeMaintenanceBackgroundSystemTask sharedTask];
  [v34 registerTask];

  id v35 = +[MADSchedulerBackgroundSystemTask sharedTask];
  [v35 registerTask];

  CFRunLoopRun();
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macsListener, 0);
  objc_storeStrong((id *)&self->_homeKitSessionListener, 0);
  objc_storeStrong((id *)&self->_homeKitListener, 0);
  objc_storeStrong((id *)&self->_embeddingStoreListener, 0);
  objc_storeStrong((id *)&self->_publicServiceListener, 0);
  objc_storeStrong((id *)&self->_realTimeListener, 0);
  objc_storeStrong((id *)&self->_analysisListener, 0);
  objc_storeStrong((id *)&self->_storageListener, 0);
  objc_storeStrong((id *)&self->_analysisClients, 0);
  objc_storeStrong((id *)&self->_photosSceneFastPassProcessing, 0);
  objc_storeStrong((id *)&self->_photosFaceFastPassProcessing, 0);
  objc_storeStrong((id *)&self->_databaseRestoreFastPassProcessing, 0);
}

@end