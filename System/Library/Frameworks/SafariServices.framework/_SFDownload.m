@interface _SFDownload
+ (id)_sharedQueue;
+ (id)downloadDestinationPathWithFilename:(id)a3;
+ (id)provisionalDownloadWithMIMEType:(id)a3 request:(id)a4 response:(id)a5 filename:(id)a6 uti:(id)a7 userInitiatedAction:(id)a8;
- (BOOL)canResume;
- (BOOL)canReveal;
- (BOOL)createFluidProgressState;
- (BOOL)explicitlySaved;
- (BOOL)hasFailedURL;
- (BOOL)isIdle;
- (BOOL)suppressesPrompt;
- (NSDate)dateAdded;
- (NSDate)dateFinished;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSString)fileDownloadPath;
- (NSString)filename;
- (NSString)filenameWithoutExtension;
- (NSString)mimeType;
- (NSString)uti;
- (NSURL)completedFileURL;
- (NSURL)sourceURL;
- (NSURLResponse)response;
- (NSUUID)identifier;
- (SFQuickLookDocument)quickLookDocument;
- (WBSFluidProgressController)fluidProgressController;
- (WKDownload)wkDownload;
- (_SFDownload)init;
- (_SFDownload)initWithDictionaryRepresentation:(id)a3 didUpdateRepresentation:(BOOL *)a4;
- (_SFDownloadDelegate)delegate;
- (_SFDownloadPlaceholderImporter)placeholderImporter;
- (_WKUserInitiatedAction)userInitiatedAction;
- (double)estimatedProgress;
- (double)progress;
- (id)_createResumeData;
- (id)completedFileURL:(BOOL *)a3;
- (id)expectedOrCurrentURL;
- (id)progressState;
- (int64_t)bytesExpected;
- (int64_t)dataOwner;
- (int64_t)fileType;
- (int64_t)state;
- (unint64_t)bytesLoaded;
- (void)_cancelReportUpdatedProgressTimer;
- (void)_continueAfterDecidingFileDownloadPath:(id)a3;
- (void)_continueAfterDownloadConfirmation:(BOOL)a3 destinationCompletionHandler:(id)a4;
- (void)_createResumeData;
- (void)_didImportFileAtURL:(id)a3 completionHandler:(id)a4;
- (void)_didImportPlaceholderAtURL:(id)a3 completionHandler:(id)a4;
- (void)_didUpdateBytesLoaded;
- (void)_importCompleteDownloadIfNeeded;
- (void)_importPlaceholderIfNeeded:(id)a3;
- (void)_notifyDelegateOfFinishedDownload;
- (void)_reportUpdatedProgressNow;
- (void)_reportUpdatedProgressSoon;
- (void)_validateSandboxAccessToURL:(id)a3;
- (void)cancel;
- (void)clearFluidProgressState;
- (void)dealloc;
- (void)dictionaryRepresentation;
- (void)download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5;
- (void)download:(id)a3 decidePlaceholderPolicy:(id)a4;
- (void)download:(id)a3 didFailWithError:(id)a4 resumeData:(id)a5;
- (void)download:(id)a3 didReceiveFinalURL:(id)a4;
- (void)download:(id)a3 didReceivePlaceholderURL:(id)a4 completionHandler:(id)a5;
- (void)download:(id)a3 didReceiveResponse:(id)a4;
- (void)download:(id)a3 didWriteTotalBytes:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5;
- (void)downloadDidFinish:(id)a3;
- (void)downloadDidStart:(id)a3;
- (void)downloadFileContentsDidChange:(id)a3;
- (void)downloadFileDidChangeURL:(id)a3;
- (void)downloadFileWillBeDeleted:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeDataAndPlaceholderFromDisk;
- (void)removeFromDisk;
- (void)resume;
- (void)resumeInWebView:(id)a3;
- (void)reveal;
- (void)setDelegate:(id)a3;
- (void)setExplicitlySaved:(BOOL)a3;
- (void)setFluidProgressController:(id)a3;
- (void)setPlaceholderImporter:(id)a3;
- (void)setQuickLookDocument:(id)a3;
- (void)setSuppressesPrompt:(BOOL)a3;
- (void)setWKDownload:(id)a3;
@end

@implementation _SFDownload

- (_SFDownload)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SFDownload;
  v2 = [(_SFDownload *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_bytesExpected = -1;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    dateAdded = v3->_dateAdded;
    v3->_dateAdded = (NSDate *)v4;

    v6 = v3;
  }

  return v3;
}

+ (id)provisionalDownloadWithMIMEType:(id)a3 request:(id)a4 response:(id)a5 filename:(id)a6 uti:(id)a7 userInitiatedAction:(id)a8
{
  id v14 = a3;
  id obj = a4;
  id v47 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v46 = a8;
  id v18 = a8;
  v19 = (char *)objc_alloc_init((Class)a1);
  uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
  v21 = (void *)*((void *)v19 + 21);
  *((void *)v19 + 21) = v20;

  if (v16)
  {
    id v22 = v16;
    v23 = (uint64_t *)(v19 + 96);
    v24 = (void *)*((void *)v19 + 12);
    *((void *)v19 + 12) = v22;
  }
  else
  {
    v24 = [v15 suggestedFilename];
    uint64_t v25 = objc_msgSend(v24, "safari_filenameByFixingIllegalCharacters");
    v23 = (uint64_t *)(v19 + 96);
    v26 = (void *)*((void *)v19 + 12);
    *((void *)v19 + 12) = v25;
  }
  v27 = (void *)*v23;
  if (*v23)
  {
    id v28 = v17;
    id v29 = v14;
    id v30 = v15;
    id v31 = a5;
    v32 = (void *)MEMORY[0x1E4F78328];
    [v47 URL];
    v33 = id v44 = v16;
    v34 = v32;
    a5 = v31;
    id v15 = v30;
    id v14 = v29;
    id v17 = v28;
    uint64_t v35 = [v34 properFilenameForOriginalFilename:v27 typeIdentifier:v28 mimeType:v14 sourceURL:v33];
    v36 = (void *)*v23;
    uint64_t *v23 = v35;

    id v16 = v44;
  }
  objc_storeStrong((id *)v19 + 13, obj);
  uint64_t v37 = [v17 copy];
  v38 = (void *)*((void *)v19 + 18);
  *((void *)v19 + 18) = v37;

  uint64_t v39 = [v14 copy];
  v40 = (void *)*((void *)v19 + 19);
  *((void *)v19 + 19) = v39;

  *((void *)v19 + 5) = _SFDownloadingFileTypeFromUTIAndMIMEType(v17, v14);
  uint64_t v41 = [v47 URL];
  v42 = (void *)*((void *)v19 + 15);
  *((void *)v19 + 15) = v41;

  objc_storeStrong((id *)v19 + 17, v46);
  if (v15)
  {
    objc_storeStrong((id *)v19 + 20, a5);
    *((void *)v19 + 22) = [v15 expectedContentLength];
  }

  return v19;
}

+ (id)_sharedQueue
{
  if (_sharedQueue_onceToken != -1) {
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_68);
  }
  v2 = (void *)_sharedQueue_queue;

  return v2;
}

- (void)dealloc
{
  [(SFDownloadFile *)self->_completedFile invalidate];
  [(SFDownloadFile *)self->_placeholderFile invalidate];
  [(_SFDownload *)self setWKDownload:0];
  v3.receiver = self;
  v3.super_class = (Class)_SFDownload;
  [(_SFDownload *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier=%@>",
                       objc_opt_class(),
                       self,
                       self->_identifier);
}

- (void)_cancelReportUpdatedProgressTimer
{
  [(NSTimer *)self->_reportUpdatedProgressTimer invalidate];
  reportUpdatedProgressTimer = self->_reportUpdatedProgressTimer;
  self->_reportUpdatedProgressTimer = 0;
}

- (void)_reportUpdatedProgressSoon
{
  if (!self->_reportUpdatedProgressTimer)
  {
    objc_super v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__reportUpdatedProgressTimerFired_ selector:0 userInfo:0 repeats:0.2];
    reportUpdatedProgressTimer = self->_reportUpdatedProgressTimer;
    self->_reportUpdatedProgressTimer = v3;

    [(NSTimer *)self->_reportUpdatedProgressTimer setTolerance:0.2];
    id v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addTimer:self->_reportUpdatedProgressTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_reportUpdatedProgressNow
{
  [(_SFDownload *)self _cancelReportUpdatedProgressTimer];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_SFDownloadDidChangeNotification" object:self];
}

- (double)progress
{
  double result = 1.0;
  if (self->_state != 4)
  {
    int64_t bytesExpected = self->_bytesExpected;
    if (bytesExpected < 1) {
      return 0.0;
    }
    else {
      return (double)self->_bytesLoaded / (double)bytesExpected;
    }
  }
  return result;
}

- (BOOL)isIdle
{
  return (self->_state < 5uLL) & (0x19u >> self->_state);
}

- (void)removeFromDisk
{
  id v3 = [(NSString *)self->_fileDownloadPath stringByDeletingLastPathComponent];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = *MEMORY[0x1E4FB2748];
  uint64_t v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __29___SFDownload_removeFromDisk__block_invoke;
  v14[3] = &unk_1E5C723B0;
  v14[4] = &v15;
  uint64_t v5 = [v4 beginBackgroundTaskWithName:@"com.apple.mobilesafari.RemoveDownload" expirationHandler:v14];
  v16[3] = v5;
  v6 = +[_SFDownload _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29___SFDownload_removeFromDisk__block_invoke_2;
  block[3] = &unk_1E5C78770;
  id v10 = v3;
  v11 = self;
  id v12 = v4;
  v13 = &v15;
  id v7 = v4;
  id v8 = v3;
  dispatch_async(v6, block);

  _Block_object_dispose(&v15, 8);
}

- (void)removeDataAndPlaceholderFromDisk
{
  [(_SFDownload *)self removeFromDisk];
  id v3 = [(SFDownloadFile *)self->_placeholderFile URL];
  if (v3)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = *MEMORY[0x1E4FB2748];
    uint64_t v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke;
    v14[3] = &unk_1E5C723B0;
    v14[4] = &v15;
    uint64_t v5 = [v4 beginBackgroundTaskWithName:@"com.apple.mobilesafari.RemoveDownloadPlaceholder" expirationHandler:v14];
    v16[3] = v5;
    v6 = +[_SFDownload _sharedQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_2;
    block[3] = &unk_1E5C78770;
    id v10 = v3;
    v11 = self;
    id v7 = v4;
    id v12 = v7;
    v13 = &v15;
    dispatch_async(v6, block);

    [(SFDownloadFile *)self->_placeholderFile invalidate];
    placeholderFile = self->_placeholderFile;
    self->_placeholderFile = 0;

    _Block_object_dispose(&v15, 8);
  }
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "%{public}@: cancellation requested", buf, 0xCu);
  }
  if (!self->_wasCanceled)
  {
    download = self->_download;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __21___SFDownload_cancel__block_invoke;
    v5[3] = &unk_1E5C78798;
    v5[4] = self;
    [(WKDownload *)download cancel:v5];
  }
  self->_wasCanceled = 1;
  [(_SFDownload *)self _reportUpdatedProgressNow];
}

- (int64_t)fileType
{
  int64_t result = self->_cachedFileType;
  if (!result)
  {
    uti = self->_uti;
    uint64_t v5 = [(NSURLResponse *)self->_response MIMEType];
    self->_cachedFileType = _SFDownloadingFileTypeFromUTIAndMIMEType(uti, v5);

    return self->_cachedFileType;
  }
  return result;
}

- (WKDownload)wkDownload
{
  return self->_download;
}

- (void)setWKDownload:(id)a3
{
  id v8 = a3;
  uint64_t v5 = self->_download;
  if ((WBSIsEqual() & 1) == 0)
  {
    v6 = [(WKDownload *)v5 progress];
    [v6 removeObserver:self forKeyPath:@"completedUnitCount" context:0];

    objc_storeStrong((id *)&self->_download, a3);
    id v7 = [v8 progress];
    [v7 addObserver:self forKeyPath:@"completedUnitCount" options:1 context:0];
  }
}

- (NSDictionary)dictionaryRepresentation
{
  v34[4] = *MEMORY[0x1E4F143B8];
  v33[0] = @"BytesLoaded";
  id v3 = [NSNumber numberWithUnsignedInteger:self->_bytesLoaded];
  v34[0] = v3;
  v33[1] = @"BytesExpected";
  uint64_t v4 = [NSNumber numberWithLongLong:self->_bytesExpected];
  v34[1] = v4;
  v33[2] = @"State";
  uint64_t v5 = [NSNumber numberWithInteger:self->_state];
  v34[2] = v5;
  v33[3] = @"Identifier";
  v6 = [(NSUUID *)self->_identifier UUIDString];
  v34[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
  id v8 = (void *)[v7 mutableCopy];

  sourceURL = self->_sourceURL;
  if (sourceURL)
  {
    id v10 = [(NSURL *)sourceURL safari_originalDataAsString];
    [v8 setObject:v10 forKeyedSubscript:@"SourceURL"];
  }
  uti = self->_uti;
  if (uti) {
    [v8 setObject:uti forKeyedSubscript:@"UTI"];
  }
  mimeType = self->_mimeType;
  if (mimeType) {
    [v8 setObject:mimeType forKeyedSubscript:@"MIMEType"];
  }
  if (self->_fileDownloadPath)
  {
    v13 = _SFSafariContainerURL();
    id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_fileDownloadPath isDirectory:0];
    uint64_t v15 = objc_msgSend(v13, "safari_relativePathToURL:", v14);
    [v8 setObject:v15 forKeyedSubscript:@"Path"];
  }
  resumeData = self->_resumeData;
  if (resumeData) {
    [v8 setObject:resumeData forKeyedSubscript:@"ResumeData"];
  }
  uint64_t v17 = [(SFDownloadFile *)self->_placeholderFile bookmarkData];
  if (v17) {
    [v8 setObject:v17 forKeyedSubscript:@"PlaceholderBookmarkData"];
  }
  uint64_t v18 = [(SFDownloadFile *)self->_completedFile bookmarkData];
  if (v18) {
    [v8 setObject:v18 forKeyedSubscript:@"BookmarkData"];
  }
  dateAdded = self->_dateAdded;
  if (dateAdded) {
    [v8 setObject:dateAdded forKeyedSubscript:@"DateAdded"];
  }
  dateFinished = self->_dateFinished;
  if (dateFinished) {
    [v8 setObject:dateFinished forKeyedSubscript:@"DateFinished"];
  }
  if (self->_explicitlySaved) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ExplicitlySaved"];
  }
  request = self->_request;
  if (request)
  {
    id v32 = 0;
    id v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:request requiringSecureCoding:1 error:&v32];
    id v23 = v32;
    if (v22)
    {
      [v8 setObject:v22 forKeyedSubscript:@"Request"];
    }
    else
    {
      v24 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_SFDownload dictionaryRepresentation](v24);
      }
    }
  }
  response = self->_response;
  if (response)
  {
    id v31 = 0;
    v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:response requiringSecureCoding:1 error:&v31];
    id v27 = v31;
    if (v26)
    {
      [v8 setObject:v26 forKeyedSubscript:@"Response"];
    }
    else
    {
      id v28 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[_SFDownload dictionaryRepresentation](v28);
      }
    }
  }
  id v29 = (void *)[v8 copy];

  return (NSDictionary *)v29;
}

- (_SFDownload)initWithDictionaryRepresentation:(id)a3 didUpdateRepresentation:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(_SFDownload *)self init];
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = objc_msgSend(v6, "safari_stringForKey:", @"SourceURL");
    uint64_t v10 = objc_msgSend(v8, "safari_URLWithDataAsString:", v9);
    sourceURL = v7->_sourceURL;
    v7->_sourceURL = (NSURL *)v10;

    id v12 = objc_msgSend(v6, "safari_numberForKey:", @"BytesLoaded");
    v7->_bytesLoaded = [v12 unsignedIntegerValue];

    v13 = objc_msgSend(v6, "safari_numberForKey:", @"BytesExpected");
    v7->_int64_t bytesExpected = [v13 longLongValue];

    uint64_t v14 = objc_msgSend(v6, "safari_stringForKey:", @"UTI");
    uti = v7->_uti;
    v7->_uti = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v6, "safari_stringForKey:", @"MIMEType");
    mimeType = v7->_mimeType;
    v7->_mimeType = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v6, "safari_numberForKey:", @"State");
    v7->_state = [v18 integerValue];

    if (v7->_state == 2) {
      v7->_state = 3;
    }
    uint64_t v19 = objc_msgSend(v6, "safari_dataForKey:", @"ResumeData");
    resumeData = v7->_resumeData;
    v7->_resumeData = (NSData *)v19;

    if (![(NSData *)v7->_resumeData length])
    {
      v21 = v7->_resumeData;
      v7->_resumeData = 0;
    }
    uint64_t v22 = objc_msgSend(v6, "safari_dataForKey:", @"PlaceholderBookmarkData");
    uint64_t v23 = objc_msgSend(v6, "safari_dataForKey:", @"BookmarkData");
    v7->_explicitlySaved = objc_msgSend(v6, "safari_BOOLForKey:", @"ExplicitlySaved");
    uint64_t v24 = objc_msgSend(v6, "safari_dataForKey:", @"Request");
    if (v24)
    {
      id v71 = 0;
      uint64_t v25 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v24 error:&v71];
      id v26 = v71;
      request = v7->_request;
      v7->_request = (NSURLRequest *)v25;

      if (!v7->_request)
      {
        id v28 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[_SFDownload initWithDictionaryRepresentation:didUpdateRepresentation:](v28);
        }
      }
    }
    uint64_t v29 = objc_msgSend(v6, "safari_dataForKey:", @"Response");
    if (v29)
    {
      id v70 = 0;
      uint64_t v30 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v29 error:&v70];
      id v31 = v70;
      response = v7->_response;
      v7->_response = (NSURLResponse *)v30;

      if (!v7->_response)
      {
        v33 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[_SFDownload initWithDictionaryRepresentation:didUpdateRepresentation:](v33);
        }
      }
    }
    v34 = objc_msgSend(v6, "safari_stringForKey:", @"Identifier");
    if (v34)
    {
      uint64_t v35 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v34];
      v36 = v35;
      if (v35)
      {
        uint64_t v37 = v35;
      }
      else
      {
        uint64_t v37 = [MEMORY[0x1E4F29128] UUID];
      }
      identifier = v7->_identifier;
      v7->_identifier = v37;
    }
    else
    {
      uint64_t v38 = [MEMORY[0x1E4F29128] UUID];
      v36 = v7->_identifier;
      v7->_identifier = (NSUUID *)v38;
    }
    uint64_t v67 = v29;

    if (v23)
    {
      v40 = -[SFDownloadFile initWithBookmarkData:]([SFDownloadFile alloc], "initWithBookmarkData:", v23, v29);
      completedFile = v7->_completedFile;
      v7->_completedFile = v40;

      [(SFDownloadFile *)v7->_completedFile setDelegate:v7];
      if (a4)
      {
        if (!v7->_completedFile) {
          *a4 = 1;
        }
      }
    }
    v42 = (void *)v24;
    v69 = (void *)v23;
    if (v22)
    {
      v43 = [[SFDownloadFile alloc] initWithBookmarkData:v22];
      placeholderFile = v7->_placeholderFile;
      v7->_placeholderFile = v43;

      [(SFDownloadFile *)v7->_placeholderFile setDelegate:v7];
      if (a4)
      {
        if (!v7->_placeholderFile) {
          *a4 = 1;
        }
      }
    }
    v45 = a4;
    id v46 = (void *)v22;
    uint64_t v47 = objc_msgSend(v6, "safari_stringForKey:", @"Path", v67);
    p_fileDownloadPath = (void **)&v7->_fileDownloadPath;
    fileDownloadPath = v7->_fileDownloadPath;
    v7->_fileDownloadPath = (NSString *)v47;

    v50 = v7->_fileDownloadPath;
    if (v50)
    {
      v51 = (void *)MEMORY[0x1E4F1CB10];
      v52 = _SFSafariContainerURL();
      v53 = [v51 fileURLWithPath:v50 relativeToURL:v52];
      uint64_t v54 = [v53 path];
      v55 = *p_fileDownloadPath;
      *p_fileDownloadPath = (void *)v54;
    }
    if (v7->_state == 1)
    {
      v7->_state = 3;
      v56 = [MEMORY[0x1E4F28CB8] defaultManager];
      v57 = [v56 attributesOfItemAtPath:v7->_fileDownloadPath error:0];
      v7->_bytesLoaded = [v57 fileSize];

      v58 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[_SFDownload initWithDictionaryRepresentation:didUpdateRepresentation:]((uint64_t)&v7->_fileDownloadPath, v58);
      }
    }
    uint64_t v59 = objc_msgSend(v6, "safari_dateForKey:", @"DateFinished");
    dateFinished = v7->_dateFinished;
    v7->_dateFinished = (NSDate *)v59;

    if (!v7->_dateFinished)
    {
      uint64_t v61 = [MEMORY[0x1E4F1C9C8] date];
      v62 = v7->_dateFinished;
      v7->_dateFinished = (NSDate *)v61;

      if (v45) {
        BOOL *v45 = 1;
      }
    }
    uint64_t v63 = objc_msgSend(v6, "safari_dateForKey:", @"DateAdded");
    dateAdded = v7->_dateAdded;
    v7->_dateAdded = (NSDate *)v63;

    if (!v7->_dateAdded)
    {
      objc_storeStrong((id *)&v7->_dateAdded, v7->_dateFinished);
      if (v45) {
        BOOL *v45 = 1;
      }
    }
    v65 = v7;
  }
  return v7;
}

- (NSString)filename
{
  id v3 = [(SFDownloadFile *)self->_completedFile URL];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 path];
    id v6 = [v5 lastPathComponent];
  }
  else
  {
    fileDownloadPath = self->_fileDownloadPath;
    if (fileDownloadPath)
    {
      id v8 = [(NSString *)fileDownloadPath lastPathComponent];
    }
    else
    {
      suggestedFilename = self->_suggestedFilename;
      if (suggestedFilename)
      {
        id v8 = suggestedFilename;
      }
      else
      {
        id v8 = [(NSURL *)self->_sourceURL _webkit_suggestedFilenameWithMIMEType:0];
      }
    }
    id v6 = v8;
  }

  return (NSString *)v6;
}

- (NSString)filenameWithoutExtension
{
  v2 = [(_SFDownload *)self filename];
  id v3 = [v2 stringByDeletingPathExtension];

  return (NSString *)v3;
}

- (NSURL)completedFileURL
{
  return (NSURL *)[(_SFDownload *)self completedFileURL:0];
}

- (id)completedFileURL:(BOOL *)a3
{
  if (self->_state != 4)
  {
    id v8 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [(SFDownloadFile *)self->_completedFile URL];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = 1;
    }
    id v7 = v5;
  }
  else
  {
    fileDownloadPath = self->_fileDownloadPath;
    if (!fileDownloadPath)
    {
      id v8 = 0;
      goto LABEL_12;
    }
    if (a3)
    {
      *a3 = 0;
      fileDownloadPath = self->_fileDownloadPath;
    }
    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:fileDownloadPath isDirectory:0];
  }
  id v8 = v7;
LABEL_12:

LABEL_13:

  return v8;
}

- (int64_t)dataOwner
{
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v3 isURLManaged:self->_sourceURL]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 3;
  }

  return v4;
}

- (BOOL)canResume
{
  return !self->_download && self->_state == 3;
}

- (void)_validateSandboxAccessToURL:(id)a3
{
  id v3 = a3;
  getpid();
  id v4 = v3;
  [v4 fileSystemRepresentation];
  int v5 = sandbox_check();
  if (v5 == -1)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[_SFDownload _validateSandboxAccessToURL:](v7);
    }
  }
  else if (v5 == 1)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_SFDownload _validateSandboxAccessToURL:]();
    }
  }
}

- (void)resume
{
  WeakRetained = (WKWebView *)objc_loadWeakRetained((id *)&self->_originatingWebView);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E4F46710], "safari_webViewForDownloadsForProfileWithIdentifier:", *MEMORY[0x1E4F99128]);
    id v4 = (WKWebView *)objc_claimAutoreleasedReturnValue();
    webViewForResuming = self->_webViewForResuming;
    self->_webViewForResuming = v4;

    WeakRetained = self->_webViewForResuming;
  }
  id v6 = WeakRetained;
  [(_SFDownload *)self resumeInWebView:WeakRetained];
}

- (void)resumeInWebView:(id)a3
{
  id v4 = a3;
  resumeData = self->_resumeData;
  if (resumeData)
  {
    id v6 = resumeData;
  }
  else
  {
    id v6 = [(_SFDownload *)self _createResumeData];
  }
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __31___SFDownload_resumeInWebView___block_invoke;
  uint64_t v16 = &unk_1E5C787C0;
  uint64_t v17 = self;
  id v7 = v6;
  uint64_t v18 = v7;
  id v8 = (void *)MEMORY[0x1AD0C36A0](&v13);
  if (v7)
  {
    objc_msgSend(v4, "resumeDownloadFromResumeData:completionHandler:", v7, v8, v13, v14, v15, v16, v17);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F18DA8];
    uint64_t v10 = [(NSURLRequest *)self->_request URL];
    sourceURL = v10;
    if (!v10) {
      sourceURL = self->_sourceURL;
    }
    id v12 = objc_msgSend(v9, "safari_nonAppInitiatedRequestWithURL:", sourceURL);

    [v4 startDownloadUsingRequest:v12 completionHandler:v8];
  }
}

- (void)_importPlaceholderIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_placeholderFile)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = objc_loadWeakRetained((id *)&self->_placeholderImporter);
    if (v7)
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_SFDownload _importPlaceholderIfNeeded:]();
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0 {
           || ([WeakRetained downloadShouldImportPlaceholderToDownloadsFolder:self] & 1) == 0)
    }
    {
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = self;
        _os_log_impl(&dword_1A690B000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: not importing placeholder to the Downloads folder because the delegate says not to", buf, 0xCu);
      }
      goto LABEL_16;
    }
    v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = self;
      _os_log_impl(&dword_1A690B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: starting to import placeholder to the Downloads folder", buf, 0xCu);
    }
    if (v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9B8] data];
      v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_fileDownloadPath isDirectory:0];
      id v12 = [v11 URLByAppendingPathExtension:@"download"];

      uint64_t v13 = +[_SFDownload _sharedQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke;
      block[3] = &unk_1E5C78838;
      id v18 = v10;
      id v19 = v12;
      uint64_t v20 = self;
      id v22 = v4;
      id v21 = v7;
      id v14 = v12;
      id v15 = v10;
      dispatch_async(v13, block);

LABEL_17:
      goto LABEL_18;
    }
LABEL_16:
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    goto LABEL_17;
  }
  int v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFDownload _importPlaceholderIfNeeded:]();
  }
  (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_18:
}

- (void)_didImportPlaceholderAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__16;
  uint64_t v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke;
  v13[3] = &unk_1E5C76C40;
  id v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  objc_msgSend(v8, "safari_accessingSecurityScopedResource:", v13);
  if (v17[5])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke_143;
    block[3] = &unk_1E5C78860;
    void block[4] = self;
    id v12 = &v16;
    id v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_SFDownload _didImportPlaceholderAtURL:completionHandler:]();
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)_importCompleteDownloadIfNeeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1A690B000, v0, v1, "%{public}@: there is no placeholder; not importing complete download",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_didImportFileAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = __Block_byref_object_copy__16;
    v33 = __Block_byref_object_dispose__16;
    id v34 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__16;
    id v27 = __Block_byref_object_dispose__16;
    id v28 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5C788B0;
    id v9 = v6;
    id v19 = v9;
    uint64_t v20 = self;
    id v21 = &v23;
    id v22 = &v29;
    objc_msgSend(v9, "safari_accessingSecurityScopedResource:", v18);
    if (v24[5])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_150;
      block[3] = &unk_1E5C76EE0;
      void block[4] = self;
      id v14 = v9;
      id v15 = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);

      uint64_t v10 = &v14;
    }
    else
    {
      id v11 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = objc_msgSend((id)v30[5], "safari_privacyPreservingDescription");
        [(_SFDownload *)(uint64_t)self _didImportFileAtURL:buf completionHandler:v11];
      }

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_149;
      v16[3] = &unk_1E5C73380;
      v16[4] = self;
      uint64_t v10 = &v17;
      id v17 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v16);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke;
    v35[3] = &unk_1E5C73380;
    v35[4] = self;
    id v36 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v35);
  }
}

- (BOOL)canReveal
{
  uint64_t v3 = [(SFDownloadFile *)self->_completedFile URL];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(SFDownloadFile *)self->_placeholderFile URL];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)reveal
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SFDownloadFile *)self->_completedFile URL];
  if (v3
    || ([(SFDownloadFile *)self->_placeholderFile URL], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v3 resolvingAgainstBaseURL:0];
    [v4 setScheme:@"shareddocuments"];
    uint64_t v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"reveal" value:@"YES"];
    v10[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v4 setQueryItems:v6];

    id v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.DocumentsApp"];
    id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v9 = [v4 URL];
    objc_msgSend(v8, "_sf_openURL:inApplication:withOptions:completionHandler:", v9, v7, 0, 0);
  }
}

- (id)_createResumeData
{
  p_fileDownloadPath = &self->_fileDownloadPath;
  if (self->_fileDownloadPath)
  {
    BOOL v4 = self->_request;
    uint64_t v5 = [(NSURLRequest *)v4 URL];
    int v6 = objc_msgSend(v5, "safari_isHTTPFamilyURL");

    if (v6
      && ([(NSURLRequest *)v4 HTTPMethod],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", @"GET"),
          v7,
          v8))
    {
      id v9 = [(NSURLResponse *)self->_response allHeaderFields];
      uint64_t v10 = objc_msgSend(v9, "safari_stringForKey:", @"Etag");
      uint64_t v11 = objc_msgSend(v9, "safari_stringForKey:", @"Last-Modified");
      if (v11 | v10)
      {
        id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v13 = *p_fileDownloadPath;
        id v30 = 0;
        id v14 = [v12 attributesOfItemAtPath:v13 error:&v30];
        id v15 = v30;
        uint64_t v16 = objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E4F28390]);

        id v17 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(_SFDownload *)(uint64_t)p_fileDownloadPath _createResumeData];
        }
        if ([v16 unsignedIntegerValue])
        {
          id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v18 setObject:&unk_1EFBDF0D0 forKeyedSubscript:@"NSURLSessionResumeInfoVersion"];
          [v18 setObject:v16 forKeyedSubscript:@"NSURLSessionResumeBytesReceived"];
          [v18 setObject:*p_fileDownloadPath forKeyedSubscript:@"NSURLSessionResumeInfoLocalPath"];
          id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
          [v19 encodeObject:v4 forKey:@"NSKeyedArchiveRootObjectKey"];
          uint64_t v20 = [v19 encodedData];
          [v18 setObject:v20 forKeyedSubscript:@"NSURLSessionResumeCurrentRequest"];

          if (v11) {
            [v18 setObject:v11 forKeyedSubscript:@"NSURLSessionResumeServerDownloadDate"];
          }
          id v28 = v16;
          if (v10) {
            [v18 setObject:v10 forKeyedSubscript:@"NSURLSessionResumeEntityTag"];
          }
          id v29 = v15;
          id v21 = [(NSURLRequest *)v4 allHTTPHeaderFields];
          id v22 = objc_msgSend(v21, "safari_stringForKey:", @"Range");
          if ([v22 hasPrefix:@"bytes="])
          {
            uint64_t v23 = [v22 componentsSeparatedByString:@"="];
            if ((unint64_t)[v23 count] >= 2)
            {
              uint64_t v24 = [v23 objectAtIndexedSubscript:1];
              [v18 setObject:v24 forKeyedSubscript:@"NSURLSessionResumeByteRange"];
            }
          }
          uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
          [v25 encodeObject:v18 forKey:@"NSKeyedArchiveRootObjectKey"];
          id v26 = [v25 encodedData];

          uint64_t v16 = v28;
          id v15 = v29;
        }
        else
        {
          id v26 = 0;
        }
      }
      else
      {
        id v26 = 0;
      }
    }
    else
    {
      id v26 = 0;
    }
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (void)_notifyDelegateOfFinishedDownload
{
  self->_state = 4;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  dateFinished = self->_dateFinished;
  self->_dateFinished = v3;

  [(_SFDownload *)self _reportUpdatedProgressNow];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained downloadDidFinish:self];

  [(_SFDownload *)self setWKDownload:0];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"_SFDownloadDidStopNotification" object:self];
}

- (void)downloadFileContentsDidChange:(id)a3
{
  if (self->_completedFile == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained downloadContentsDidChange:self];
    }
  }
}

- (void)downloadFileWillBeDeleted:(id)a3
{
  if (self->_completedFile == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained downloadWillBeDeleted:self];
    }
  }
  else
  {
    download = self->_download;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41___SFDownload_downloadFileWillBeDeleted___block_invoke;
    v7[3] = &unk_1E5C78798;
    v7[4] = self;
    [(WKDownload *)download cancel:v7];
    [(SFDownloadFile *)self->_placeholderFile invalidate];
    placeholderFile = self->_placeholderFile;
    self->_placeholderFile = 0;
  }
}

- (void)downloadFileDidChangeURL:(id)a3
{
  if (self->_completedFile == a3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"_SFDownloadDidChangeCompletedURLNotification" object:self];
  }
}

- (void)downloadDidStart:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "%{public}@: starting download %{public}@", (uint8_t *)&v11, 0x16u);
  }
  self->_wasCanceled = 0;
  [(_SFDownload *)self setWKDownload:v4];
  id v6 = [v4 webView];
  objc_storeWeak((id *)&self->_originatingWebView, v6);

  self->_timeLastProgressNotificationWasSent = CFAbsoluteTimeGetCurrent();
  id v7 = [(_SFDownload *)self fluidProgressController];
  [v7 startFluidProgressWithProgressStateSource:self];

  self->_state = 1;
  dateFinished = self->_dateFinished;
  self->_dateFinished = 0;

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"_SFDownloadDidStartNotification" object:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained downloadDidStart:self];

  [(_SFDownload *)self _reportUpdatedProgressNow];
}

- (void)download:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v5 = (NSURLResponse *)a4;
  id v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_SFDownload download:didReceiveResponse:]();
  }
  self->_bytesLoaded = 0;
  self->_int64_t bytesExpected = [(NSURLResponse *)v5 expectedContentLength];
  id v7 = [(NSURLResponse *)v5 URL];
  sourceURL = self->_sourceURL;
  self->_sourceURL = v7;

  [(WBSFluidProgressState *)self->_fluidProgressState setHasCommittedLoad:1];
  typeIdentifierForDownloadFromResponse(v5);
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  uti = self->_uti;
  self->_uti = v9;

  int v11 = [(NSURLResponse *)v5 MIMEType];
  id v12 = (NSString *)[v11 copy];
  mimeType = self->_mimeType;
  self->_mimeType = v12;

  response = self->_response;
  self->_response = v5;
  uint64_t v15 = v5;

  self->_cachedFileType = 0;
  [(_SFDownload *)self _reportUpdatedProgressNow];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(response) = objc_opt_respondsToSelector();

  if (response) {
    [WeakRetained downloadDidReceiveResponse:self];
  }
}

- (void)download:(id)a3 didWriteTotalBytes:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5
{
  self->_int64_t bytesExpected = a5;
  self->_bytesLoaded = a4;
  [(_SFDownload *)self _didUpdateBytesLoaded];
}

- (void)download:(id)a3 decidePlaceholderPolicy:(id)a4
{
  int v8 = a4;
  uint64_t v5 = [(SFDownloadFile *)self->_placeholderFile URL];

  if (v5)
  {
    id WeakRetained = [(SFDownloadFile *)self->_placeholderFile URL];
    id v7 = (void (*)(void))v8[2];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained downloadShouldImportPlaceholderToDownloadsFolder:self];
    }
    id v7 = (void (*)(void))v8[2];
  }
  v7();
}

- (void)download:(id)a3 didReceivePlaceholderURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[_SFDownload _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67___SFDownload_download_didReceivePlaceholderURL_completionHandler___block_invoke;
  block[3] = &unk_1E5C76EE0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)download:(id)a3 didReceiveFinalURL:(id)a4
{
  id v5 = a4;
  id v6 = [(SFDownloadFile *)self->_placeholderFile URL];
  if (v6)
  {
    id v7 = +[_SFDownload _sharedQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43___SFDownload_download_didReceiveFinalURL___block_invoke;
    v9[3] = &unk_1E5C72238;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(v7, v9);
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_SFDownload download:didReceiveFinalURL:]();
    }
    [(_SFDownload *)self _notifyDelegateOfFinishedDownload];
  }
}

- (void)_didUpdateBytesLoaded
{
  [(_SFDownload *)self _reportUpdatedProgressSoon];
  if (self->_bytesExpected != -1)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (Current - self->_timeLastProgressNotificationWasSent >= 0.2)
    {
      self->_timeLastProgressNotificationWasSent = Current;
      id v4 = [(_SFDownload *)self fluidProgressController];
      [v4 updateFluidProgressWithProgressStateSource:self];
    }
  }
}

+ (id)downloadDestinationPathWithFilename:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v6 = objc_msgSend(v5, "_webkit_createTemporaryDirectoryWithTemplatePrefix:", @"Download");
  id v7 = [v6 stringByAppendingPathComponent:v4];

  id v8 = objc_msgSend(v5, "_web_pathWithUniqueFilenameForPath:", v7);

  return v8;
}

- (void)download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_SFDownload download:decideDestinationWithSuggestedFilename:completionHandler:]();
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke;
  v19[3] = &unk_1E5C788D8;
  v19[4] = self;
  id v10 = v8;
  id v20 = v10;
  id v11 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v19);
  if (self->_wasCanceled)
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_SFDownload download:decideDestinationWithSuggestedFilename:completionHandler:]();
    }
    v11[2](v11, 0);
  }
  else
  {
    if (!self->_suggestedFilename)
    {
      id v13 = [MEMORY[0x1E4F78328] properFilenameForOriginalFilename:v7 typeIdentifier:self->_uti mimeType:self->_mimeType sourceURL:self->_sourceURL];
      suggestedFilename = self->_suggestedFilename;
      self->_suggestedFilename = v13;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[_SFDownload download:decideDestinationWithSuggestedFilename:completionHandler:]();
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_227;
      v17[3] = &unk_1E5C737D0;
      v17[4] = self;
      id v18 = v11;
      [WeakRetained downloadShouldContinueAfterReceivingResponse:self decisionHandler:v17];
    }
    else
    {
      [(_SFDownload *)self _continueAfterDownloadConfirmation:1 destinationCompletionHandler:v11];
    }
  }
}

- (void)_continueAfterDownloadConfirmation:(BOOL)a3 destinationCompletionHandler:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!a3)
  {
    fileDownloadPath = self->_fileDownloadPath;
    self->_fileDownloadPath = 0;
LABEL_6:

    [(_SFDownload *)self _continueAfterDecidingFileDownloadPath:v6];
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v9 = [(id)objc_opt_class() downloadDestinationPathWithFilename:self->_suggestedFilename];
    fileDownloadPath = self->_fileDownloadPath;
    self->_fileDownloadPath = v9;
    goto LABEL_6;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke;
  v10[3] = &unk_1E5C76E50;
  v10[4] = self;
  id v11 = v6;
  [WeakRetained createDirectoryForDownload:self completionHandler:v10];

LABEL_7:
}

- (void)_continueAfterDecidingFileDownloadPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fileDownloadPath)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke;
    v6[3] = &unk_1E5C737D0;
    v6[4] = self;
    id v7 = v4;
    [(_SFDownload *)self _importPlaceholderIfNeeded:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)downloadDidFinish:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_wasCanceled)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_INFO, "%{public}@: finished download", (uint8_t *)&v6, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);
    [WeakRetained finishFluidProgressWithProgressStateSource:self];

    [(_SFDownload *)self _importCompleteDownloadIfNeeded];
  }
}

- (void)download:(id)a3 didFailWithError:(id)a4 resumeData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[_SFDownload download:didFailWithError:resumeData:]((uint64_t)self, v9, v7);
  }
  self->_state = 3;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  dateFinished = self->_dateFinished;
  self->_dateFinished = v10;

  p_resumeData = &self->_resumeData;
  objc_storeStrong((id *)&self->_resumeData, a5);
  if (![(NSData *)self->_resumeData length])
  {
    id v13 = *p_resumeData;
    *p_resumeData = 0;
  }
  if (!*p_resumeData) {
    [(_SFDownload *)self removeFromDisk];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);
  [WeakRetained cancelFluidProgressWithProgressStateSource:self];

  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [v15 downloadDidFail:self];

  [(_SFDownload *)self setWKDownload:0];
  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:@"_SFDownloadDidStopNotification" object:self];

  [(_SFDownload *)self _reportUpdatedProgressNow];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62___SFDownload_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E5C72238;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

- (BOOL)createFluidProgressState
{
  if (!self->_fluidProgressState)
  {
    uint64_t v3 = (WBSFluidProgressState *)[objc_alloc(MEMORY[0x1E4F98B10]) initWithType:1];
    fluidProgressState = self->_fluidProgressState;
    self->_fluidProgressState = v3;

    id v5 = self->_fluidProgressState;
    int v6 = [(NSURL *)self->_sourceURL safari_originalDataAsString];
    [(WBSFluidProgressState *)v5 setLoadURL:v6];

    if (self->_response) {
      [(WBSFluidProgressState *)self->_fluidProgressState setHasCommittedLoad:1];
    }
  }
  return 1;
}

- (void)clearFluidProgressState
{
  fluidProgressState = self->_fluidProgressState;
  self->_fluidProgressState = 0;
}

- (id)progressState
{
  return self->_fluidProgressState;
}

- (id)expectedOrCurrentURL
{
  return self->_sourceURL;
}

- (double)estimatedProgress
{
  int64_t bytesExpected = self->_bytesExpected;
  if (bytesExpected < 1) {
    return 0.0;
  }
  else {
    return (double)self->_bytesLoaded / (double)bytesExpected;
  }
}

- (BOOL)hasFailedURL
{
  return self->_state == 3;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSString)fileDownloadPath
{
  return self->_fileDownloadPath;
}

- (_WKUserInitiatedAction)userInitiatedAction
{
  return self->_userInitiatedAction;
}

- (NSString)uti
{
  return self->_uti;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSURLResponse)response
{
  return self->_response;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)explicitlySaved
{
  return self->_explicitlySaved;
}

- (void)setExplicitlySaved:(BOOL)a3
{
  self->_explicitlySaved = a3;
}

- (BOOL)suppressesPrompt
{
  return self->_suppressesPrompt;
}

- (void)setSuppressesPrompt:(BOOL)a3
{
  self->_suppressesPrompt = a3;
}

- (int64_t)bytesExpected
{
  return self->_bytesExpected;
}

- (unint64_t)bytesLoaded
{
  return self->_bytesLoaded;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (NSDate)dateFinished
{
  return self->_dateFinished;
}

- (WBSFluidProgressController)fluidProgressController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);

  return (WBSFluidProgressController *)WeakRetained;
}

- (void)setFluidProgressController:(id)a3
{
}

- (_SFDownloadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFDownloadDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SFDownloadPlaceholderImporter)placeholderImporter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderImporter);

  return (_SFDownloadPlaceholderImporter *)WeakRetained;
}

- (void)setPlaceholderImporter:(id)a3
{
}

- (SFQuickLookDocument)quickLookDocument
{
  return self->_quickLookDocument;
}

- (void)setQuickLookDocument:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_destroyWeak((id *)&self->_placeholderImporter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_fluidProgressController);
  objc_storeStrong((id *)&self->_dateFinished, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_userInitiatedAction, 0);
  objc_storeStrong((id *)&self->_fileDownloadPath, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_suggestedFilename, 0);
  objc_storeStrong((id *)&self->_completedFile, 0);
  objc_storeStrong((id *)&self->_placeholderFile, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_webViewForResuming, 0);
  objc_destroyWeak((id *)&self->_originatingWebView);
  objc_storeStrong((id *)&self->_reportUpdatedProgressTimer, 0);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

- (void)dictionaryRepresentation
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to encode request data: %{public}@", v6, v7, v8, v9, v10);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a1 didUpdateRepresentation:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = objc_msgSend(0, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(&dword_1A690B000, v2, OS_LOG_TYPE_ERROR, "Failed to check file size at %{private}@: %{public}@", v4, 0x16u);
}

- (void)initWithDictionaryRepresentation:(void *)a1 didUpdateRepresentation:.cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to decode response data: %{public}@", v6, v7, v8, v9, v10);
}

- (void)initWithDictionaryRepresentation:(void *)a1 didUpdateRepresentation:.cold.3(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to decode request data: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_validateSandboxAccessToURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1A690B000, v0, OS_LOG_TYPE_FAULT, "Download has no sandbox access to placeholder file: %{private}@", v1, 0xCu);
}

- (void)_validateSandboxAccessToURL:(void *)a1 .cold.2(void *a1)
{
  id v1 = a1;
  __error();
  OUTLINED_FUNCTION_6_0(&dword_1A690B000, v2, v3, "Error checking sandbox access to placeholder file: errno=%ld, url=%{private}@", v4, v5, v6, v7, 3u);
}

- (void)_importPlaceholderIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1A690B000, v0, v1, "%{public}@ has custom placeholder importer. Not calling -downloadShouldImportPlaceholderToDownloadsFolder:", v2, v3, v4, v5, v6);
}

- (void)_importPlaceholderIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1A690B000, v0, v1, "%{public}@: we already have a placeholder; skipping import",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_didImportPlaceholderAtURL:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A690B000, v0, OS_LOG_TYPE_ERROR, "%{public}@: failed to create bookmark for imported placeholder", v1, 0xCu);
}

- (void)_didImportFileAtURL:(uint8_t *)buf completionHandler:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "%{public}@: failed to create bookmark data: %{public}@", buf, 0x16u);
}

- (void)_createResumeData
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v5, v6, "Failed to check file size at %{private}@: %{public}@", v7, v8, v9, v10, v11);
}

- (void)download:didReceiveResponse:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2117;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A690B000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: received response: %{sensitive}@", v2, 0x16u);
}

- (void)download:didReceiveFinalURL:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1A690B000, v0, v1, "%p: there is no placeholder.", v2, v3, v4, v5, v6);
}

- (void)download:decideDestinationWithSuggestedFilename:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1A690B000, v0, v1, "%{public}@: consulting delegate for confirmation", v2, v3, v4, v5, v6);
}

- (void)download:decideDestinationWithSuggestedFilename:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1A690B000, v0, v1, "%{public}@: Cancelling WebKit download via nil destination because _SFDownload has already been canceled", v2, v3, v4, v5, v6);
}

- (void)download:decideDestinationWithSuggestedFilename:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1A690B000, v0, v1, "%{public}@: deciding destination", v2, v3, v4, v5, v6);
}

- (void)download:(uint64_t)a1 didFailWithError:(void *)a2 resumeData:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint8_t v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "%{public}@: download failed: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end