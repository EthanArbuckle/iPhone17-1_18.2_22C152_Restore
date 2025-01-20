@interface ImageConversionService
+ (id)adjustmentInformationForComposition:(id)a3 error:(id *)a4;
+ (void)configureCompositionController:(id)a3 sourceURLCollection:(id)a4;
+ (void)run;
- (BOOL)convertImageWithOptions:(id)a3 sourceURLCollection:(id)a4 outputURLCollection:(id)a5 outputData:(id *)a6 outputFileType:(id *)a7 outputImageInfo:(id *)a8 error:(id *)a9;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)setupSourceAndDestinationForRequestTracker:(id)a3 imageConversionOptions:(id)a4 error:(id *)a5;
- (BOOL)validatePhotosAdjustmentsCalculationRequestOptions:(id)a3 error:(id *)a4;
- (BOOL)validateRequestOptions:(id)a3 error:(id *)a4;
- (ImageConversionService)init;
- (MediaConversionQueue)requestQueue;
- (NSXPCListener)listener;
- (id)adjustmentInformationForCropAdjustmentInformation:(id)a3 sourceURLCollection:(id)a4 error:(id *)a5;
- (id)performPhotosPortraitAdjustmentsCalculationForURL:(id)a3 contentType:(id)a4 orientation:(unsigned int)a5 error:(id *)a6;
- (id)urlCollectionForBookmarkDictionaryKey:(id)a3 inOptions:(id)a4 removeExistingEmptyFiles:(BOOL)a5 error:(id *)a6;
- (int64_t)incrementPendingRequestCountWithRequestIdentifier:(id)a3;
- (int64_t)pendingRequestCount;
- (void)conversionQueue:(id)a3 processNextEntry:(id)a4;
- (void)conversionQueueDidFinishProcessingEntry:(id)a3;
- (void)convertImageWithOptions:(id)a3 reply:(id)a4;
- (void)decrementPendingRequestCountWithRequestIdentifier:(id)a3;
- (void)enumerateEnvironmentVariablePairsInRequestOptions:(id)a3 block:(id)a4;
- (void)performBeginRequestActionsForUnitTestSupportOptions:(id)a3;
- (void)performEndRequestActionsForUnitTestSupportOptions:(id)a3;
- (void)replyToCompletionHandler:(id)a3 requestIdentifier:(id)a4 resultData:(id)a5 resultImageInformation:(id)a6 signpostID:(unint64_t)a7 error:(id)a8;
- (void)requestStatusWithReply:(id)a3;
- (void)run;
- (void)setListener:(id)a3;
- (void)setPendingRequestCount:(int64_t)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation ImageConversionService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setRequestQueue:(id)a3
{
}

- (MediaConversionQueue)requestQueue
{
  return (MediaConversionQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingRequestCount:(int64_t)a3
{
  self->_pendingRequestCount = a3;
}

- (int64_t)pendingRequestCount
{
  return self->_pendingRequestCount;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  uint64_t v5 = +[NSUUID UUID];
  v6 = [v4 _xpcConnection];
  pid_t pid = xpc_connection_get_pid(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v5;
    __int16 v27 = 1024;
    pid_t v28 = pid;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Connection %{public}@ [%d] accepted", buf, 0x12u);
  }
  CFStringRef v23 = @"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY";
  uint64_t v24 = v5;
  v21 = (void *)v5;
  v8 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  [v4 setUserInfo:v8];

  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ImageConversionService];
  uint64_t v20 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  [v9 setClasses:v18 forSelector:"convertImageWithOptions:reply:" argumentIndex:0 ofReply:0];
  [v4 setExportedInterface:v9];
  [v4 setExportedObject:self];
  [v4 resume];

  return 1;
}

- (void)conversionQueueDidFinishProcessingEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (!v5->_pendingRequestCount)
  {
    CMPhotoReleaseHardwareResources();
    +[NUFactory reset];
    if (pc_session_create())
    {
      getpid();
      pc_session_set_procpid();
      if (!pc_session_begin())
      {
        *(void *)buf = 0;
        pc_session_get_value();
      }
      pc_session_destroy();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = 0x7FF8000000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Finished processing last queue entry, dirty memory = %.0f KB", buf, 0xCu);
    }
  }
  objc_sync_exit(v5);
}

- (void)conversionQueue:(id)a3 processNextEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 initialRequestConversionOptions];
  v47 = self;
  [(ImageConversionService *)self performBeginRequestActionsForUnitTestSupportOptions:v8];
  uint64_t v9 = [v6 anyDestinationURLCollectionForQueueEntry:v7];
  v43 = v6;
  v40 = (void *)v9;
  v41 = (void *)v8;
  if (!v9)
  {
    uint64_t v14 = 0;
    id v13 = 0;
    goto LABEL_5;
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v7 identifier];
  id v56 = 0;
  uint64_t v12 = +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryFilesDirectoryURLForConversionTaskIdentifier:v11 error:&v56];
  id v13 = v56;

  if (v12)
  {
    uint64_t v14 = +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryDestinationURLCollectionForFinalDestinationURLCollection:v10 inParentDirectoryURL:v12];
    [v7 setTemporaryFilesParentDirectoryURL:v12];

LABEL_5:
    uint64_t v16 = [v7 sourceURLCollection];
    id v54 = 0;
    id v55 = 0;
    id v52 = v13;
    id v53 = 0;
    BOOL v17 = [(ImageConversionService *)v47 convertImageWithOptions:v8 sourceURLCollection:v16 outputURLCollection:v14 outputData:&v55 outputFileType:&v54 outputImageInfo:&v53 error:&v52];
    id v18 = v55;
    id v19 = v54;
    id v20 = v53;
    id v21 = v52;

    id v22 = v20;
    id v13 = v21;
    CFStringRef v23 = v18;
    id v6 = v43;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v59 = v7;
    __int16 v60 = 2112;
    id v61 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create temporary files directory for request %{public}@: %@", buf, 0x16u);
  }
  uint64_t v14 = 0;
  BOOL v17 = 0;
  CFStringRef v23 = 0;
  id v22 = 0;
  id v19 = 0;
LABEL_9:
  v46 = v13;
  v37 = v22;
  v42 = v7;
  v38 = v19;
  v39 = (void *)v14;
  BOOL v45 = v17;
  objc_msgSend(v6, "markCompletionAndRetrieveClientRequestsForQueueEntry:resultURLCollection:didConvertSuccessfully:conversionOutputInformation:conversionOutputData:conversionOutputFileType:conversionError:", v7, v14, v17, v13);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v24 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        pid_t v28 = v23;
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v31 = [v29 requestTracker];
        v32 = v31;
        if (v45)
        {
          v33 = [v31 outputInformation];
        }
        else
        {
          v33 = 0;
        }
        v34 = [v29 imageClientReplyHandler];
        v35 = [v29 identifier];
        id v36 = [v29 signpostID];
        CFStringRef v23 = v28;
        [(ImageConversionService *)v47 replyToCompletionHandler:v34 requestIdentifier:v35 resultData:v28 resultImageInformation:v33 signpostID:v36 error:v46];
      }
      id v25 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v25);
  }

  [(ImageConversionService *)v47 performEndRequestActionsForUnitTestSupportOptions:v41];
}

- (id)adjustmentInformationForCropAdjustmentInformation:(id)a3 sourceURLCollection:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentCropKey"];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentOrientationKey"];

  if (v9)
  {
    [v9 rectValue];
    if (!NSIsEmptyRect(v32))
    {
      if (v10)
      {
        id v11 = [v10 integerValue];
        id v12 = +[PIPhotoEditHelper newComposition];
        id v13 = +[PIPhotoEditHelper newCompositionControllerWithComposition:v12];

        [(id)objc_opt_class() configureCompositionController:v13 sourceURLCollection:v7];
        uint64_t v14 = [v13 adjustmentConstants];
        uint64_t v15 = [v14 PICropAdjustmentKey];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100017FCC;
        v25[3] = &unk_1000353B0;
        id v26 = v9;
        [v13 modifyAdjustmentWithKey:v15 modificationBlock:v25];

        uint64_t v16 = [v14 PIOrientationAdjustmentKey];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10001802C;
        v24[3] = &unk_1000353D0;
        v24[4] = v11;
        [v13 modifyAdjustmentWithKey:v16 modificationBlock:v24];

        BOOL v17 = objc_opt_class();
        id v18 = [v13 composition];
        id v23 = 0;
        id v19 = [v17 adjustmentInformationForComposition:v18 error:&v23];
        id v20 = v23;

        if (a5 && !v19)
        {
          v27[0] = NSLocalizedDescriptionKey;
          v27[1] = NSUnderlyingErrorKey;
          v28[0] = @"Error creating adjustment from crop adjustment.";
          v28[1] = v20;
          id v21 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
          *a5 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v21];
        }
        goto LABEL_10;
      }
    }
  }
  if (a5)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"Crop adjustment missing PAMediaConversionServiceAdjustmentCropKey and/or PAMediaConversionServiceAdjustmentOrientationKey";
    id v13 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v13];
    id v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_12;
  }
  id v19 = 0;
LABEL_12:

  return v19;
}

- (id)urlCollectionForBookmarkDictionaryKey:(id)a3 inOptions:(id)a4 removeExistingEmptyFiles:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 objectForKeyedSubscript:v9];
  if (v11)
  {
    if ([v9 isEqualToString:@"PAMediaConversionServiceSourceBookmarkCollectionKey"])id v12 = -[PAMediaConversionServiceResourceURLCollectionAccessProvider initWithOptions:]([PAMediaConversionServiceResourceURLCollectionAccessProvider alloc], "initWithOptions:", v10); {
    else
    }
      id v12 = 0;
    uint64_t v15 = +[PAMediaConversionServiceResourceURLCollection collectionForBookmarkDataDictionaryRepresentation:v11 accessProvider:v12 error:a6];
    if (!v15)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create URL collection for key %{public}@", buf, 0xCu);
      }
      id v13 = 0;
      id v14 = 0;
      goto LABEL_26;
    }
    id v13 = v15;
    if ([v15 urlCount])
    {
      if (v7)
      {
        id v21 = 0;
        unsigned __int8 v16 = [v13 removeExistingEmptyFilesWithError:&v21];
        id v17 = v21;
        id v18 = v17;
        if ((v16 & 1) == 0)
        {
          id v14 = 0;
          if (a6 && v17)
          {
            v26[0] = @"PAMediaConversionServiceErrorOffendingItemNameKey";
            v26[1] = NSUnderlyingErrorKey;
            v27[0] = v9;
            v27[1] = v17;
            id v19 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
            *a6 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:v19];

            id v14 = 0;
          }
          goto LABEL_25;
        }
      }
      else
      {
        id v18 = 0;
      }
      id v14 = v13;
LABEL_25:

      goto LABEL_26;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Empty url collection for key %{public}@", buf, 0xCu);
    }

    if (!a6)
    {
LABEL_22:
      id v14 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Nil %{public}@ URL collection bookmark dictionary in options", buf, 0xCu);
    }
    id v13 = 0;
    if (!a6) {
      goto LABEL_22;
    }
  }
  CFStringRef v22 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
  id v23 = v9;
  id v12 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:1 userInfo:v12];
  id v14 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_27:
  return v14;
}

- (id)performPhotosPortraitAdjustmentsCalculationForURL:(id)a3 contentType:(id)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"ImageConversionService.m", 581, @"Invalid parameter not satisfying: %@", @"contentType" object file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  unsigned __int8 v16 = +[NSAssertionHandler currentHandler];
  [v16 handleFailureInMethod:a2, self, @"ImageConversionService.m", 580, @"Invalid parameter not satisfying: %@", @"sourceURL" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v7) {
    goto LABEL_4;
  }
LABEL_9:
  id v18 = +[NSAssertionHandler currentHandler];
  [v18 handleFailureInMethod:a2, self, @"ImageConversionService.m", 582, @"Invalid parameter not satisfying: %@", @"orientation" object file lineNumber description];

LABEL_4:
  id v14 = +[PAMediaConversionServiceSharedUtilitiesServiceSide generatePortraitAdjustmentForURL:v11 contentType:v13 orientation:v7 error:a6];

  return v14;
}

- (BOOL)convertImageWithOptions:(id)a3 sourceURLCollection:(id)a4 outputURLCollection:(id)a5 outputData:(id *)a6 outputFileType:(id *)a7 outputImageInfo:(id *)a8 error:(id *)a9
{
  id v14 = a3;
  id v117 = a4;
  id v15 = a5;
  if (!a8)
  {
    v98 = +[NSAssertionHandler currentHandler];
    [v98 handleFailureInMethod:a2, self, @"ImageConversionService.m", 344, @"Invalid parameter not satisfying: %@", @"outputImageInfo" object file lineNumber description];
  }
  v115 = a8;
  if (!v15)
  {
    unsigned __int8 v16 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"];
    unsigned __int8 v17 = [v16 BOOLValue];

    if ((v17 & 1) == 0)
    {
      id v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2, self, @"ImageConversionService.m", 346, @"Neither destination URL collection nor NSData output option, should have been rejected at request enqueue time" object file lineNumber description];
    }
  }
  SEL v111 = a2;
  id v19 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPassthroughConversionKey"];
  unsigned int v20 = [v19 BOOLValue];

  id v21 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPhotosAdjustmentsCalculationKey"];
  unsigned int v22 = [v21 BOOLValue];

  id v23 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"];
  if (!v23)
  {
    id v23 = [v15 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"];
    if (!v23)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to determine output file type from destination URL, defaulting to JPEG.", buf, 2u);
      }
      id v23 = [UTTypeJPEG identifier];
    }
  }
  v114 = self;
  CGSize v121 = CGSizeZero;
  v116 = +[NSMutableDictionary dictionary];
  id v24 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMetadataPolicyKey"];
  if (v24) {
    char v25 = 1;
  }
  else {
    char v25 = v22;
  }
  if ((v25 & 1) == 0)
  {
    v99 = +[NSAssertionHandler currentHandler];
    [v99 handleFailureInMethod:v111 object:v114 file:@"ImageConversionService.m" lineNumber:372 description:@"Missing metadata policy"];
  }
  id v26 = a9;
  __int16 v27 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequiresBlastDoorAccessKey"];
  if ([v27 BOOLValue])
  {
    pid_t v28 = +[NSUserDefaults standardUserDefaults];
    char v29 = [v28 BOOLForKey:@"PADisablePhotosBlastDoorProcessing"] ^ 1;
  }
  else
  {
    char v29 = 0;
  }

  if (!v20 || (v29 & 1) != 0)
  {
    if (v22)
    {
      v38 = [v117 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];
      v39 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceInputFileTypeKey"];
      v40 = +[PFUniformTypeUtilities typeWithIdentifier:v39];

      v41 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"];
      id v42 = [v41 unsignedIntValue];

      id v120 = 0;
      v43 = [(ImageConversionService *)v114 performPhotosPortraitAdjustmentsCalculationForURL:v38 contentType:v40 orientation:v42 error:&v120];
      id v37 = v120;
      if (v43)
      {
        v109 = v24;
        v34 = a9;
        [v116 setObject:v43 forKeyedSubscript:@"PAMediaConversionServiceCalculatedAdjustmentInformationKey"];

        id v31 = 0;
        unsigned __int8 v36 = 1;
        goto LABEL_40;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v125 = v38;
        __int16 v126 = 2112;
        id v127 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to calculate photos adjustments information for %@: %@", buf, 0x16u);
      }

      NSRect v32 = 0;
      goto LABEL_97;
    }
    v44 = [PAMediaConversionServiceImageConversionJob alloc];
    BOOL v45 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
    v46 = [(PAMediaConversionServiceImageConversionJob *)v44 initWithRequestIdentifier:v45 sourceResourceURLCollection:v117 outputFileType:v23];

    [(PAMediaConversionServiceImageConversionJob *)v46 setDestinationResourceURLCollection:v15];
    [(PAMediaConversionServiceImageConversionJob *)v46 setMetadataPolicy:v24];
    v47 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"];

    if (v47)
    {
      long long v48 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"];
      id v49 = [v48 integerValue];
    }
    else
    {
      id v52 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRotationAngleDegreesKey"];

      if (!v52)
      {
        [(PAMediaConversionServiceImageConversionJob *)v46 setOrientation:0];
        goto LABEL_48;
      }
      long long v48 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRotationAngleDegreesKey"];
      [v48 integerValue];
      id v49 = (id)IPAOrientationFromClockwiseRotation();
    }
    [(PAMediaConversionServiceImageConversionJob *)v46 setOrientation:v49];

LABEL_48:
    id v53 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"];

    if (v53)
    {
      id v54 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"];
      id v53 = [v54 integerValue];

      if ((unint64_t)v53 >= 3)
      {
        if (a9)
        {
          NSErrorUserInfoKey v122 = NSLocalizedDescriptionKey;
          CFStringRef v123 = @"Illegal ColorSpace option";
          v58 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
          *a9 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:2 userInfo:v58];
        }
        id v37 = 0;
        NSRect v32 = 0;
        goto LABEL_103;
      }
    }
    [(PAMediaConversionServiceImageConversionJob *)v46 setColorspaceMode:v53];
    id v55 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionScaleFactorKey"];
    id v56 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"];
    v57 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumLongSideLengthKey"];
    v108 = v57;
    v110 = v56;
    if (v55)
    {
      [v55 doubleValue];
      -[PAMediaConversionServiceImageConversionJob setScaleFactor:](v46, "setScaleFactor:");
    }
    else if (v56)
    {
      -[PAMediaConversionServiceImageConversionJob setRequestedMaximumPixelCount:](v46, "setRequestedMaximumPixelCount:", [v56 integerValue]);
    }
    else
    {
      if (!v57)
      {
        v107 = +[NSAssertionHandler currentHandler];
        [v107 handleFailureInMethod:v111 object:v114 file:@"ImageConversionService.m" lineNumber:478 description:@"Missing scale parameters"];
        id v37 = 0;
        int v105 = 0;
        NSRect v32 = 0;
        LODWORD(v66) = 1;
        goto LABEL_93;
      }
      -[PAMediaConversionServiceImageConversionJob setRequestedMaximumLongSideLength:](v46, "setRequestedMaximumLongSideLength:", [v57 integerValue]);
    }
    id v59 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionApplyOrientationTransformKey"];
    -[PAMediaConversionServiceImageConversionJob setApplySourceOrientationTransform:](v46, "setApplySourceOrientationTransform:", [v59 BOOLValue]);

    __int16 v60 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionFormatConversionOnlyKey"];
    -[PAMediaConversionServiceImageConversionJob setFormatConversionOnly:](v46, "setFormatConversionOnly:", [v60 BOOLValue]);

    id v61 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRasterizationDPIKey"];
    v62 = v61;
    if (v61) {
      -[PAMediaConversionServiceImageConversionJob setRasterizationDPI:](v46, "setRasterizationDPI:", [v61 integerValue]);
    }
    v107 = v62;
    uint64_t v63 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionCropAdjustmentInformationKey"];
    v106 = (void *)v63;
    if (v63)
    {
      v64 = [(ImageConversionService *)v114 adjustmentInformationForCropAdjustmentInformation:v63 sourceURLCollection:v117 error:a9];
      [(PAMediaConversionServiceImageConversionJob *)v46 setAdjustmentInformation:v64];

      v65 = [(PAMediaConversionServiceImageConversionJob *)v46 adjustmentInformation];

      if (!v65)
      {
        id v37 = 0;
        int v105 = 0;
        NSRect v32 = 0;
        LODWORD(v66) = 1;
LABEL_92:

LABEL_93:
        if (v66)
        {
LABEL_104:
          unsigned __int8 v36 = 0;
          goto LABEL_105;
        }
        if (v105)
        {
          if (!v32)
          {
            v109 = v24;
            v34 = a9;
            id v31 = 0;
            unsigned __int8 v36 = 1;
LABEL_38:
            long long v50 = +[NSNumber numberWithDouble:v121.width];
            [v116 setObject:v50 forKeyedSubscript:@"PAMediaConversionServicePixelWidthKey"];

            long long v51 = +[NSNumber numberWithDouble:v121.height];
            [v116 setObject:v51 forKeyedSubscript:@"PAMediaConversionServicePixelHeightKey"];

            if (a7) {
              *a7 = v23;
            }
LABEL_40:
            id *v115 = v116;
            NSRect v32 = v31;
            id v26 = v34;
            id v24 = v109;
            if (!v26) {
              goto LABEL_105;
            }
            goto LABEL_98;
          }
          v33 = v37;
          id v31 = v32;
LABEL_23:
          v109 = v24;
          if (v15)
          {
            v34 = a9;
            v35 = [v15 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];
            id v118 = v33;
            unsigned __int8 v36 = [v31 writeToURL:v35 options:0 error:&v118];
            id v37 = v118;

            if ((v36 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v125 = v37;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error writing result image data to URL passed in destination URL collection: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            id v15 = 0;
            v34 = a9;
            if (a6)
            {
              id v31 = v31;
              *a6 = v31;
            }
            else
            {
              v100 = +[NSAssertionHandler currentHandler];
              [v100 handleFailureInMethod:v111, v114, @"ImageConversionService.m", 542, @"Invalid request output configuration, missing both destination URL collection and data pointer" object file lineNumber description];
            }
            unsigned __int8 v36 = 1;
            id v37 = v33;
          }
          goto LABEL_38;
        }
LABEL_97:
        unsigned __int8 v36 = 0;
        if (!a9) {
          goto LABEL_105;
        }
        goto LABEL_98;
      }
    }
    else
    {
      v67 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAdjustmentInformationKey"];
      [(PAMediaConversionServiceImageConversionJob *)v46 setAdjustmentInformation:v67];
    }
    v68 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionEnableOutputCorruptionDetectionHeuristicsKey"];
    -[PAMediaConversionServiceImageConversionJob setShouldCheckForOutputCorruption:](v46, "setShouldCheckForOutputCorruption:", [v68 BOOLValue]);

    v69 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUseEmbeddedImageAsSourceKey"];
    -[PAMediaConversionServiceImageConversionJob setShouldUseEmbeddedImageAsSource:](v46, "setShouldUseEmbeddedImageAsSource:", [v69 BOOLValue]);

    +[PAMediaConversionServiceSharedUtilitiesServiceSide executeConversionJob:v46];
    if (![(PAMediaConversionServiceImageConversionJob *)v46 status])
    {
      v101 = +[NSAssertionHandler currentHandler];
      [v101 handleFailureInMethod:v111 object:v114 file:@"ImageConversionService.m" lineNumber:504 description:@"Unexpected unknown image conversion job state after execution"];
    }
    id v70 = [(PAMediaConversionServiceImageConversionJob *)v46 status];
    BOOL v71 = v70 == (id)1;
    if (v70 != (id)1)
    {
      uint64_t v73 = [(PAMediaConversionServiceImageConversionJob *)v46 error];
      if (v73)
      {
        id v37 = (id)v73;
        LODWORD(v66) = 0;
        int v105 = 0;
        NSRect v32 = 0;
        goto LABEL_92;
      }
      int v105 = v71;
      v104 = v55;
      v86 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
      unsigned int v87 = [v86 isBlastDoorAccessRequired];

      if (v87)
      {
        v66 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
        id v37 = [v66 blastDoorError];
        NSRect v32 = 0;
LABEL_84:
        id v55 = v104;
        goto LABEL_85;
      }
      LODWORD(v66) = 0;
      id v37 = 0;
      int v105 = 0;
      NSRect v32 = 0;
LABEL_91:
      id v55 = v104;
      goto LABEL_92;
    }
    int v105 = 1;
    v72 = [(PAMediaConversionServiceImageConversionJob *)v46 destinationData];

    if (v72)
    {
      NSRect v32 = [(PAMediaConversionServiceImageConversionJob *)v46 destinationData];
    }
    else
    {
      NSRect v32 = 0;
    }
    [(PAMediaConversionServiceImageConversionJob *)v46 outputImageSize];
    v121.width = v74;
    v121.height = v75;
    v66 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
    if ([v66 isBlastDoorAccessRequired])
    {
      v104 = v55;
      v76 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
      [v76 blastDoorMainSourceProperties];
      v66 = v77 = v66;

      if (v66)
      {
        v78 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
        v79 = [v78 blastDoorMainSourceProperties];
        [v116 setObject:v79 forKeyedSubscript:@"PAMediaConversionServiceBlastDoorSourcePropertiesKey"];

        v80 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
        v81 = [v80 blastDoorVideoComplementProperties];
        [v116 setObject:v81 forKeyedSubscript:@"PAMediaConversionServiceBlastDoorVideoComplementSourcePropertiesKey"];

        v82 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
        id v37 = [v82 blastDoorSourceURL];

        if (v37)
        {
          v83 = +[NSFileManager defaultManager];
          v84 = [(PAMediaConversionServiceImageConversionJob *)v46 sourceResourceURLCollection];
          v85 = [v84 blastDoorSourceURL];
          id v119 = 0;
          unsigned __int8 v103 = [v83 removeItemAtURL:v85 error:&v119];
          id v102 = v119;

          if ((v103 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v66 = v102;
            id v125 = v102;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Failed to remove temporary blast door source file: %{public}@", buf, 0xCu);
            id v37 = 0;
            goto LABEL_84;
          }
          id v37 = 0;
          id v55 = v104;
          v66 = v102;
LABEL_85:

          LODWORD(v66) = 0;
          goto LABEL_92;
        }
        LODWORD(v66) = 0;
      }
      else
      {
        id v37 = 0;
      }
      int v105 = 1;
      goto LABEL_91;
    }
    id v37 = 0;
    goto LABEL_85;
  }
  CFStringRef v30 = [v117 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];
  id v31 = +[PAMediaConversionServiceImagingUtilities imageDataForPassthroughConversionForSourceURL:v30 metadataPolicy:v24 outResultImageSize:&v121];

  NSRect v32 = 0;
  if (v31)
  {
    v33 = 0;
    goto LABEL_23;
  }
  unsigned __int8 v36 = 0;
  id v37 = 0;
  if (!a9) {
    goto LABEL_105;
  }
LABEL_98:
  if ((v36 & 1) == 0)
  {
    v46 = +[NSMutableDictionary dictionary];
    v88 = [v117 logMessageSummary];
    [(PAMediaConversionServiceImageConversionJob *)v46 setObject:v88 forKeyedSubscript:@"PAMediaConversionServiceErrorSourceResourceSummaryKey"];

    v89 = [v37 description];
    [(PAMediaConversionServiceImageConversionJob *)v46 setObject:v89 forKeyedSubscript:@"PAMediaConversionServiceErrorUnderlyingErrorDescriptionKey"];

    v90 = [v37 domain];
    v91 = v23;
    v92 = v24;
    id v93 = v15;
    v94 = v26;
    unsigned int v95 = [v90 isEqualToString:@"BlastDoor.Explosion"];

    if (v95) {
      uint64_t v96 = 12;
    }
    else {
      uint64_t v96 = 2;
    }
    id *v94 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:v96 userInfo:v46];
    id v15 = v93;
    id v24 = v92;
    id v23 = v91;
LABEL_103:

    goto LABEL_104;
  }
LABEL_105:

  return v36;
}

- (void)enumerateEnvironmentVariablePairsInRequestOptions:(id)a3 block:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void *))a4;
  id obj = [a3 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportExtraEnvironmentVariablesKey"];
  if (obj)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v11 = [v10 componentsSeparatedByString:@"="];
          if ([v11 count] != (id)2)
          {
            id v14 = +[NSAssertionHandler currentHandler];
            [v14 handleFailureInMethod:a2, self, @"ImageConversionService.m", 324, @"Unexpected env var item count: %@", v10 object file lineNumber description];
          }
          id v12 = [v11 objectAtIndexedSubscript:0];
          id v13 = [v11 objectAtIndexedSubscript:1];
          if ([v12 rangeOfString:@"^CI_.+$" options:1024] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Ignoring unsupported env var key %@", buf, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v23 = v12;
              __int16 v24 = 2112;
              char v25 = v13;
              __int16 v26 = 2112;
              CFStringRef v27 = @"PAMediaConversionServiceOptionUnitTestSupportExtraEnvironmentVariablesKey";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting environment variable '%@' to '%@' because %@ request option is set", buf, 0x20u);
            }
            v5[2](v5, v12, v13);
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v7);
    }
  }
}

- (void)performEndRequestActionsForUnitTestSupportOptions:(id)a3
{
  id v4 = a3;
  [(ImageConversionService *)self enumerateEnvironmentVariablePairsInRequestOptions:v4 block:&stru_100035388];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitAfterRequestKey"];

  LODWORD(v4) = [v5 BOOLValue];
  if (v4)
  {
    _xpc_transaction_exit_clean();
  }
}

- (void)performBeginRequestActionsForUnitTestSupportOptions:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v8 = @"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Terminating process because %@ request option is set", buf, 0xCu);
    }
    exit(1);
  }
  [(ImageConversionService *)self enumerateEnvironmentVariablePairsInRequestOptions:v6 block:&stru_100035368];
}

- (void)decrementPendingRequestCountWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = v5->_pendingRequestCount - 1;
  v5->_pendingRequestCount = v6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Sent reply for image conversion request %{public}@, pending request count now %ld", (uint8_t *)&v7, 0x16u);
  }
  objc_sync_exit(v5);
}

- (void)replyToCompletionHandler:(id)a3 requestIdentifier:(id)a4 resultData:(id)a5 resultImageInformation:(id)a6 signpostID:(unint64_t)a7 error:(id)a8
{
  id v14 = (void (*)(id, id, id, id))*((void *)a3 + 2);
  id v15 = a4;
  v14(a3, a5, a6, a8);
  id v16 = &_os_log_default;
  if (a7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)unsigned __int8 v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_END, a7, "com.apple.photos.mediaconversion.service", "", v17, 2u);
  }

  [(ImageConversionService *)self decrementPendingRequestCountWithRequestIdentifier:v15];
}

- (int64_t)incrementPendingRequestCountWithRequestIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  int64_t pendingRequestCount = v6->_pendingRequestCount;
  if (pendingRequestCount < 0)
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:v6 file:@"ImageConversionService.m" lineNumber:264 description:@"Pending request count underflow"];

    int64_t pendingRequestCount = v6->_pendingRequestCount;
  }
  int64_t v8 = pendingRequestCount + 1;
  v6->_int64_t pendingRequestCount = pendingRequestCount + 1;
  objc_sync_exit(v6);

  return v8;
}

- (BOOL)validatePhotosAdjustmentsCalculationRequestOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceInputFileTypeKey"];
  int v7 = +[PFUniformTypeUtilities typeWithIdentifier:v6];
  if (v7)
  {
    int64_t v8 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"];
    unsigned int v9 = [v8 unsignedIntValue] - 1;
    BOOL v10 = v9 < 8;
    if (a4 && v9 >= 8)
    {
      CFStringRef v13 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
      CFStringRef v14 = @"PAMediaConversionServiceOptionOrientationKey";
      id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a4 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:1 userInfo:v11];

      BOOL v10 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      BOOL v10 = 0;
      goto LABEL_8;
    }
    CFStringRef v15 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
    CFStringRef v16 = @"PAMediaConversionServiceInputFileTypeKey";
    int64_t v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:1 userInfo:v8];
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v10;
}

- (BOOL)validateRequestOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPhotosAdjustmentsCalculationKey"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    unsigned __int8 v9 = [(ImageConversionService *)self validatePhotosAdjustmentsCalculationRequestOptions:v6 error:a4];
    goto LABEL_17;
  }
  BOOL v10 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionApplyOrientationTransformKey"];
  unsigned int v11 = [v10 BOOLValue];

  id v12 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionEnableOutputCorruptionDetectionHeuristicsKey"];
  unsigned int v13 = [v12 BOOLValue];

  if (!v13 || !v11)
  {
    CFStringRef v16 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMetadataPolicyKey"];
    if (v16)
    {
      unsigned __int8 v17 = [v6 allKeys];
      long long v18 = +[NSMutableSet setWithArray:v17];

      v27[0] = @"PAMediaConversionServiceOptionScaleFactorKey";
      v27[1] = @"PAMediaConversionServiceOptionMaximumPixelCountKey";
      void v27[2] = @"PAMediaConversionServiceOptionMaximumLongSideLengthKey";
      long long v19 = +[NSArray arrayWithObjects:v27 count:3];
      long long v20 = +[NSSet setWithArray:v19];

      [v18 intersectSet:v20];
      id v21 = [v18 count];
      unsigned __int8 v9 = v21 == (id)1;
      if (a4 && v21 != (id)1)
      {
        NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
        unsigned int v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Expected exactly one scaling request option but received %lu: %@", [v18 count], v18);
        __int16 v26 = v22;
        id v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        *a4 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:6 userInfo:v23];
      }
    }
    else
    {
      if (!a4)
      {
        unsigned __int8 v9 = 0;
        goto LABEL_16;
      }
      CFStringRef v28 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
      CFStringRef v29 = @"PAMediaConversionServiceOptionMetadataPolicyKey";
      long long v18 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:1 userInfo:v18];
      unsigned __int8 v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_16:
    goto LABEL_17;
  }
  if (a4)
  {
    NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
    CFStringRef v14 = +[NSString stringWithFormat:@"Invalid combination of %@ and %@ request options", @"PAMediaConversionServiceOptionApplyOrientationTransformKey", @"PAMediaConversionServiceOptionEnableOutputCorruptionDetectionHeuristicsKey"];
    id v31 = v14;
    CFStringRef v15 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    *a4 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:6 userInfo:v15];
  }
  unsigned __int8 v9 = 0;
LABEL_17:

  return v9;
}

- (BOOL)setupSourceAndDestinationForRequestTracker:(id)a3 imageConversionOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(ImageConversionService *)self urlCollectionForBookmarkDictionaryKey:@"PAMediaConversionServiceSourceBookmarkCollectionKey" inOptions:v9 removeExistingEmptyFiles:0 error:a5];
  if (!v10) {
    goto LABEL_11;
  }
  [v8 setSourceURLCollection:v10];
  unsigned int v11 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceDestinationBookmarkCollectionKey"];

  if (!v11)
  {
    CFStringRef v14 = [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"];
    uint64_t v15 = [v14 BOOLValue];

    if (v15) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v18 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Neither destination URL collection nor wants-data option specified", v18, 2u);
      if (!a5) {
        goto LABEL_11;
      }
    }
    else if (!a5)
    {
      goto LABEL_11;
    }
    +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:0];
    BOOL v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  uint64_t v12 = [(ImageConversionService *)self urlCollectionForBookmarkDictionaryKey:@"PAMediaConversionServiceDestinationBookmarkCollectionKey" inOptions:v9 removeExistingEmptyFiles:1 error:a5];
  if (!v12)
  {
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  unsigned int v13 = (void *)v12;
  [v8 setDestinationURLCollection:v12];

LABEL_6:
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (void)requestStatusWithReply:(id)a3
{
  CFStringRef v7 = @"PAMediaConversionServiceProcessIdentifierKey";
  id v4 = a3;
  id v5 = +[NSNumber numberWithInt:getpid()];
  id v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v6, 0);
}

- (void)convertImageWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  CFStringRef v7 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
  id v8 = objc_opt_new();
  objc_msgSend(v8, "setSignpostID:", os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, v7));
  id v9 = (char *)[v8 signpostID];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = (os_signpost_id_t)v9;
    if (os_signpost_enabled((os_log_t)&_os_log_default))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_BEGIN, v10, "com.apple.photos.mediaconversion.service", "", buf, 2u);
    }
  }
  int64_t v34 = [(ImageConversionService *)self incrementPendingRequestCountWithRequestIdentifier:v7];
  id v37 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"];
  unsigned int v11 = +[NSXPCConnection currentConnection];
  unsigned __int8 v36 = [v11 userInfo];
  v39 = [v36 objectForKeyedSubscript:@"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY"];
  unint64_t v12 = [(MediaConversionQueue *)self->_requestQueue nextRequestNumber];
  unsigned int v13 = [[MediaConversionRequestTracker alloc] initWithRequestOptions:v6 requestNumber:v12];
  CFStringRef v14 = [(MediaConversionQueue *)self->_requestQueue queueEntryWithConversionOptions:v6];
  [v14 setTaskTypeSupportsDeduplication:1];
  id v42 = 0;
  unsigned __int8 v15 = [(ImageConversionService *)self validateRequestOptions:v6 error:&v42];
  id v16 = v42;
  unsigned __int8 v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v44 = (unint64_t)v14;
      __int16 v45 = 2114;
      v46 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid request options for %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_17;
  }
  id v41 = v16;
  unsigned __int8 v18 = [(ImageConversionService *)self setupSourceAndDestinationForRequestTracker:v13 imageConversionOptions:v6 error:&v41];
  id v33 = v41;

  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v29 = [(MediaConversionRequestTracker *)v13 clientProcessIdentifier];
      *(_DWORD *)buf = 138543618;
      unint64_t v44 = (unint64_t)v14;
      __int16 v45 = 1024;
      LODWORD(v46) = v29;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Rejecting conversion request (image) %{public}@ from [%d] because source or destination URLs are invalid", buf, 0x12u);
    }
    unsigned __int8 v17 = v33;
    [(MediaConversionRequestTracker *)v13 setError:v33];
    [(MediaConversionRequestTracker *)v13 markAsCompletedWithInitialRequestIdentifier:0];
LABEL_17:
    id v21 = [(MediaConversionRequestTracker *)v13 requestIdentifier];
    __int16 v26 = v38;
    -[ImageConversionService replyToCompletionHandler:requestIdentifier:resultData:resultImageInformation:signpostID:error:](self, "replyToCompletionHandler:requestIdentifier:resultData:resultImageInformation:signpostID:error:", v38, v21, 0, 0, [v8 signpostID], v17);
    goto LABEL_21;
  }
  long long v19 = [(MediaConversionRequestTracker *)v13 sourceURLCollection];
  [v14 setSourceURLCollection:v19];

  [v8 setImageClientReplyHandler:v38];
  [v8 setRequestTracker:v13];
  [v8 setConnection:v11];
  [v8 setConnectionIdentifier:v39];
  requestQueue = self->_requestQueue;
  id v40 = 0;
  [(MediaConversionQueue *)requestQueue enqueueEntry:v14 clientRequest:v8 isDuplicateOfOriginalQueueEntry:&v40];
  id v21 = v40;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    if (v21) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = v14;
    }
    id v23 = v22;
    unint64_t v24 = [(MediaConversionRequestTracker *)v13 effectivePriority];
    if (v24 > 4) {
      NSErrorUserInfoKey v25 = 0;
    }
    else {
      NSErrorUserInfoKey v25 = off_100035418[v24];
    }
    NSRect v32 = v25;
    NSErrorUserInfoKey v30 = [(MediaConversionRequestTracker *)v13 requestOptionsSignatureString];
    CFStringRef v27 = [(MediaConversionRequestTracker *)v13 sourceURLFilenameOnlySummary];
    [v23 identifier];
    CFStringRef v28 = v31 = v23;
    *(_DWORD *)buf = 134220291;
    unint64_t v44 = v12;
    __int16 v45 = 2114;
    v46 = v7;
    __int16 v47 = 2112;
    long long v48 = v32;
    __int16 v49 = 2114;
    long long v50 = v37;
    __int16 v51 = 2114;
    id v52 = v30;
    __int16 v53 = 2113;
    id v54 = v27;
    __int16 v55 = 2114;
    id v56 = v28;
    __int16 v57 = 1024;
    BOOL v58 = v21 != 0;
    __int16 v59 = 2114;
    __int16 v60 = v39;
    __int16 v61 = 2048;
    int64_t v62 = v34;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received conversion request #%lu %{public}@ (%@, %{public}@) with signature %{public}@ for %{private}@, attached to conversion task %{public}@, isDuplicate = %d, connection %{public}@, pending request count now %ld", buf, 0x62u);
  }
  unsigned __int8 v17 = v33;
  __int16 v26 = v38;
LABEL_21:
}

- (void)run
{
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.photos.ImageConversionService"];
  [(ImageConversionService *)self setListener:v3];

  id v4 = [(ImageConversionService *)self listener];
  [v4 setDelegate:self];

  id v5 = [(ImageConversionService *)self listener];
  [v5 resume];

  dispatch_main();
}

- (ImageConversionService)init
{
  v9.receiver = self;
  v9.super_class = (Class)ImageConversionService;
  v2 = [(ImageConversionService *)&v9 init];
  if (v2)
  {
    os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, v2);
    id v4 = &_os_log_default;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
    {
      *(_WORD *)id v8 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_EVENT, v3, "com.apple.photos.mediaconversion.service.init", "", v8, 2u);
    }

    id v5 = [[MediaConversionQueue alloc] initWithDelegate:v2];
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v5;
  }
  return v2;
}

+ (id)adjustmentInformationForComposition:(id)a3 error:(id *)a4
{
  id v4 = +[PICompositionSerializer adjustmentInformationForComposition:a3 error:a4];
  id v5 = [v4 mutableCopy];

  uint64_t v6 = PIAssetAdjustmentsDataBlobKey;
  CFStringRef v7 = [v5 objectForKeyedSubscript:PIAssetAdjustmentsDataBlobKey];
  [v5 setObject:v7 forKeyedSubscript:@"PAMediaConversionServiceAdjustmentDataKey"];

  uint64_t v8 = PIAssetAdjustmentsFormatIdentifierKey;
  objc_super v9 = [v5 objectForKeyedSubscript:PIAssetAdjustmentsFormatIdentifierKey];
  [v5 setObject:v9 forKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatIdentifierKey"];

  uint64_t v10 = PIAssetAdjustmentsFormatVersionKey;
  unsigned int v11 = [v5 objectForKeyedSubscript:PIAssetAdjustmentsFormatVersionKey];
  [v5 setObject:v11 forKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatVersionKey"];

  v14[0] = v6;
  v14[1] = v8;
  v14[2] = v10;
  unint64_t v12 = +[NSArray arrayWithObjects:v14 count:3];
  [v5 removeObjectsForKeys:v12];

  return v5;
}

+ (void)configureCompositionController:(id)a3 sourceURLCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CFStringRef v7 = [v5 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];
  CFStringRef v16 = @"PAMediaConversionResourceRoleVideoComplement";
  uint64_t v8 = 1;
  objc_super v9 = +[NSArray arrayWithObjects:&v16 count:1];
  unsigned int v10 = [v5 containsAnyRole:v9];

  unsigned int v11 = [v5 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"];
  unint64_t v12 = +[PIPhotoEditHelper imageSourceWithURL:v7 type:v11 useEmbeddedPreview:0];

  if (v10)
  {
    unsigned int v13 = [v5 resourceURLForRole:@"PAMediaConversionResourceRoleVideoComplement"];
    CFStringRef v14 = +[PIPhotoEditHelper videoSourceWithURL:v13];
    uint64_t v15 = +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:v12 videoSource:v14];

    uint64_t v8 = 3;
    unint64_t v12 = (void *)v15;
  }
  [v6 setSource:v12 mediaType:v8];
}

+ (void)run
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 run];
}

@end