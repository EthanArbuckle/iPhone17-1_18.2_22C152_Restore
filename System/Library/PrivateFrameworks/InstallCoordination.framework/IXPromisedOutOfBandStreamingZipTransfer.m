@interface IXPromisedOutOfBandStreamingZipTransfer
+ (BOOL)supportsSecureCoding;
- (BOOL)doesConsumeExtractedData;
- (BOOL)useProgressFromSZExtractor;
- (Class)seedClass;
- (IXPromisedOutOfBandStreamingZipTransfer)initWithCoder:(id)a3;
- (IXPromisedOutOfBandStreamingZipTransfer)initWithName:(id)a3 client:(unint64_t)a4 streamingZipOptions:(id)a5 archiveSize:(unint64_t)a6 diskSpaceNeeded:(unint64_t)a7;
- (IXPromisedOutOfBandStreamingZipTransfer)initWithSeed:(id)a3;
- (NSURL)extractionPath;
- (SZExtractor)extractor;
- (SZExtractorDelegate)extractorDelegate;
- (unint64_t)archiveBytesConsumed;
- (void)addBytesTransferred:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)extractionCompleteAtArchivePath:(id)a3;
- (void)extractionEnteredPassThroughMode;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)prepareForExtraction:(id)a3;
- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4;
- (void)resetWithCompletion:(id)a3;
- (void)setArchiveBytesConsumed:(unint64_t)a3;
- (void)setExtractionProgress:(double)a3;
- (void)setExtractor:(id)a3;
- (void)setExtractorDelegate:(id)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation IXPromisedOutOfBandStreamingZipTransfer

- (IXPromisedOutOfBandStreamingZipTransfer)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  v3 = [(IXOpaqueDataPromise *)&v14 initWithCoder:a3];
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = objc_alloc(MEMORY[0x1E4FA8A48]);
  v5 = [(IXDataPromise *)v3 seed];
  v6 = [v5 szOptions];
  v7 = (void *)[v4 initWithOptions:v6];
  [(IXPromisedOutOfBandStreamingZipTransfer *)v3 setExtractor:v7];

  v8 = [(IXPromisedOutOfBandStreamingZipTransfer *)v3 extractor];

  if (!v8)
  {
    v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(IXDataPromise *)v3 seed];
      v12 = [v11 szOptions];
      *(_DWORD *)buf = 136315394;
      v16 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithCoder:]";
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: -[SZExtractor initWithOptions:] returned nil for options %@", buf, 0x16u);
    }
    v9 = 0;
  }
  else
  {
LABEL_3:
    v9 = v3;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  [(IXOpaqueDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedOutOfBandStreamingZipTransfer)initWithName:(id)a3 client:(unint64_t)a4 streamingZipOptions:(id)a5 archiveSize:(unint64_t)a6 diskSpaceNeeded:(unint64_t)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  objc_super v14 = [(IXDataPromise *)&v29 initWithName:v12 client:a4 diskSpaceNeeded:a7];
  v15 = v14;
  if (v14)
  {
    v16 = [(IXDataPromise *)v14 seed];
    [v16 setArchiveSizeBytes:a6];

    __int16 v17 = [(IXDataPromise *)v15 seed];
    [v17 setSzOptions:v13];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4FA8A48]) initWithOptions:v13];
    [(IXPromisedOutOfBandStreamingZipTransfer *)v15 setExtractor:v18];

    uint64_t v19 = [(IXPromisedOutOfBandStreamingZipTransfer *)v15 extractor];
    LODWORD(v18) = v19 == 0;

    if (v18)
    {
      v23 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[IXPromisedOutOfBandStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSi"
                             "ze:diskSpaceNeeded:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1A7B2D000, v23, OS_LOG_TYPE_DEFAULT, "%s: -[SZExtractor initWithOptions:] returned nil for options %@", buf, 0x16u);
      }
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v31 = 0;
      v20 = +[IXServerConnection sharedConnection];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke;
      v28[3] = &unk_1E5D172A8;
      v28[4] = buf;
      v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v28];

      if (!v21)
      {
        _Block_object_dispose(buf, 8);
        goto LABEL_11;
      }
      v22 = [(IXDataPromise *)v15 seed];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke_6;
      v25[3] = &unk_1E5D18280;
      v27 = buf;
      v26 = v15;
      [(IXPromisedOutOfBandStreamingZipTransfer *)v21 _remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:v22 completion:v25];

      LODWORD(v22) = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (!v22) {
        goto LABEL_5;
      }
    }
    v21 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v21 = v15;
LABEL_11:

  return v21;
}

void __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up out of band StreamingZip transfer promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) _updateInitWithSeed:a2 notifyDaemon:0];
  }
}

- (BOOL)useProgressFromSZExtractor
{
  v2 = [(IXDataPromise *)self seed];
  BOOL v3 = [v2 archiveSizeBytes] == 0;

  return v3;
}

- (void)prepareForExtraction:(id)a3
{
  BOOL v3 = kIXLoggingSubsystem;
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = IXGetLoggingHandle((uint64_t)v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXPromisedOutOfBandStreamingZipTransfer prepareForExtraction:]();
  }

  _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer prepareForExtraction:]", 111, @"IXErrorDomain", 4uLL, 0, 0, @"You must call -prepareForExtractionToPath: instead; -prepareForExtraction: is not valid on this type of promise.",
    v6,
  int v7 = v8);
  v4[2](v4, 0, v7);
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];

  if (v8)
  {
    __int16 v9 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = (uint64_t)__86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke;
    v13[3] = (uint64_t)&unk_1E5D17348;
    v13[4] = (uint64_t)self;
    id v14 = v7;
    [v9 prepareForExtractionToPath:v6 completionBlock:v13];
  }
  else
  {
    id v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IXPromisedOutOfBandStreamingZipTransfer prepareForExtractionToPath:completionBlock:]();
    }

    id v12 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer prepareForExtractionToPath:completionBlock:]", 118, @"IXErrorDomain", 1uLL, 0, 0, @"self.extractor was unexpectedly nil!", v11, v13[0]);
    [(IXDataPromise *)self cancelForReason:v12 client:15 error:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke_2;
    v9[3] = &unk_1E5D17398;
    id v11 = *(id *)(a1 + 40);
    id v10 = v4;
    [v5 cancelForReason:v10 client:15 completion:v9];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) extractor];
    [v6 setExtractorDelegate:v5];

    uint64_t v7 = [*(id *)(a1 + 32) useProgressFromSZExtractor];
    uint64_t v8 = [*(id *)(a1 + 32) extractor];
    [v8 setActiveExtractorDelegateMethods:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXPromisedOutOfBandStreamingZipTransfer prepareForExtractionToPath:completionBlock:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  __int16 v7 = (void (**)(id, void *, uint64_t))a4;
  if ([(IXDataPromise *)self localIsComplete])
  {
    id v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]();
    }

    id v10 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]", 153, @"IXErrorDomain", 4uLL, 0, 0, @"-supplyBytes:withCompletionBlock: called after promise was complete", v9, v17);
    goto LABEL_6;
  }
  id v10 = [(IXDataPromise *)self localError];
  if (v10)
  {
LABEL_6:
    v7[2](v7, v10, 1);
    goto LABEL_7;
  }
  id v11 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];

  if (v11)
  {
    uint64_t v12 = [v6 length];
    id v13 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke;
    v18[3] = &unk_1E5D182A8;
    v18[4] = self;
    uint64_t v19 = v7;
    uint64_t v20 = v12;
    [v13 supplyBytes:v6 withCompletionBlock:v18];
  }
  else
  {
    id v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]();
    }

    v16 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]", 165, @"IXErrorDomain", 1uLL, 0, 0, @"self.extractor was unexpectedly nil!", v15, v17);
    [(IXDataPromise *)self cancelForReason:v16 client:15 error:0];
    v7[2](v7, v16, 1);
  }
LABEL_7:
}

void __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E5D17398;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 cancelForReason:v6 client:15 completion:v5];
  }
  else
  {
    if (([*(id *)(a1 + 32) useProgressFromSZExtractor] & 1) == 0) {
      [*(id *)(a1 + 32) addBytesTransferred:*(void *)(a1 + 48)];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];

  if (v5)
  {
    id v6 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = (uint64_t)__76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke;
    v10[3] = (uint64_t)&unk_1E5D17348;
    v10[4] = (uint64_t)self;
    id v11 = v4;
    [v6 suspendStreamWithCompletionBlock:v10];
  }
  else
  {
    __int16 v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[IXPromisedOutOfBandStreamingZipTransfer suspendStreamWithCompletionBlock:]();
    }

    uint64_t v9 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer suspendStreamWithCompletionBlock:]", 196, @"IXErrorDomain", 1uLL, 0, 0, @"self.extractor was unexpectedly nil!", v8, v10[0]);
    [(IXDataPromise *)self cancelForReason:v9 client:15 error:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

void __76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke_2;
    v6[3] = &unk_1E5D17398;
    int v5 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v7 = v4;
    [v5 cancelForReason:v7 client:15 completion:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXPromisedOutOfBandStreamingZipTransfer suspendStreamWithCompletionBlock:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];

  if (v5)
  {
    id v6 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = (uint64_t)__75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke;
    v10[3] = (uint64_t)&unk_1E5D181F0;
    v10[4] = (uint64_t)self;
    id v11 = v4;
    [v6 finishStreamWithCompletionBlock:v10];
  }
  else
  {
    __int16 v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[IXPromisedOutOfBandStreamingZipTransfer finishStreamWithCompletionBlock:]();
    }

    uint64_t v9 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer finishStreamWithCompletionBlock:]", 219, @"IXErrorDomain", 1uLL, 0, 0, @"self.extractor was unexpectedly nil!", v8, v10[0]);
    [(IXDataPromise *)self cancelForReason:v9 client:15 error:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

void __75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E5D17398;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 cancelForReason:v6 client:15 completion:v5];
  }
  else
  {
    [*(id *)(a1 + 32) setComplete:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXPromisedOutOfBandStreamingZipTransfer finishStreamWithCompletionBlock:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  __int16 v7 = (void (**)(id, void *))a4;
  if ([(IXDataPromise *)self localIsComplete])
  {
    id v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]();
    }

    id v10 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]", 244, @"IXErrorDomain", 4uLL, 0, 0, @"-terminateStreamWithError:completionBlock: called after promise was complete", v9, v16);
    v7[2](v7, v10);
  }
  else
  {
    id v11 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];

    if (v11)
    {
      uint64_t v12 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke;
      v17[3] = &unk_1E5D18218;
      v17[4] = self;
      id v18 = v6;
      uint64_t v19 = v7;
      [v12 terminateStreamWithError:v18 completionBlock:v17];
    }
    else
    {
      id v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]();
      }

      uint64_t v15 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]", 250, @"IXErrorDomain", 1uLL, 0, 0, @"self.extractor was unexpectedly nil!", v14, v16);
      [(IXDataPromise *)self cancelForReason:v15 client:15 error:0];
      v7[2](v7, v15);
    }
  }
}

void __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Terminating stream failed with error: %@", buf, 0x16u);
    }
  }
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke_20;
  v7[3] = &unk_1E5D171B8;
  id v8 = *(id *)(a1 + 48);
  [v5 cancelForReason:v6 client:15 completion:v7];
}

void __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  int v5 = [(IXDataPromise *)self seed];
  [v5 setArchiveBytesConsumed:0];

  id v6 = objc_alloc(MEMORY[0x1E4FA8A48]);
  __int16 v7 = [(IXDataPromise *)self seed];
  id v8 = [v7 szOptions];
  uint64_t v9 = (void *)[v6 initWithOptions:v8];
  [(IXPromisedOutOfBandStreamingZipTransfer *)self setExtractor:v9];

  id v10 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];

  if (v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
    [(IXDataPromise *)&v16 resetWithCompletion:v4];
  }
  else
  {
    __int16 v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[IXPromisedOutOfBandStreamingZipTransfer resetWithCompletion:](self, v11);
    }

    id v12 = [(IXDataPromise *)self seed];
    uint64_t v13 = [v12 szOptions];
    uint64_t v15 = _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer resetWithCompletion:]", 276, @"IXErrorDomain", 1uLL, 0, 0, @"-[SZExtractor initWithOptions:] returned nil for options %@", v14, (uint64_t)v13);

    v4[2](v4, v15);
  }
}

- (BOOL)doesConsumeExtractedData
{
  return 0;
}

- (unint64_t)archiveBytesConsumed
{
  v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 archiveBytesConsumed];

  return v3;
}

- (void)setArchiveBytesConsumed:(unint64_t)a3
{
  int v5 = [(IXDataPromise *)self seed];
  [v5 setArchiveBytesConsumed:a3];

  id v9 = +[IXServerConnection sharedConnection];
  id v6 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6];
  __int16 v7 = [(IXDataPromise *)self uniqueIdentifier];
  id v8 = [(IXDataPromise *)self seed];
  objc_msgSend(v6, "_remote_IXSPromisedOutOfBandStreamingZipTransfer:setArchiveBytesConsumed:", v7, objc_msgSend(v8, "archiveBytesConsumed"));
}

void __67__IXPromisedOutOfBandStreamingZipTransfer_setArchiveBytesConsumed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unint64_t v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[IXPromisedOutOfBandStreamingZipTransfer setArchiveBytesConsumed:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to set bytes completed: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)addBytesTransferred:(unint64_t)a3
{
  int v5 = [(IXDataPromise *)self seed];
  unint64_t v6 = [v5 archiveBytesConsumed] + a3;
  [v5 setArchiveBytesConsumed:v6];

  [(IXPromisedOutOfBandStreamingZipTransfer *)self setArchiveBytesConsumed:v6];
}

- (NSURL)extractionPath
{
  id v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 extractionPath];

  return (NSURL *)v3;
}

- (void)setExtractorDelegate:(id)a3
{
  id obj = a3;
  if ([(IXPromisedOutOfBandStreamingZipTransfer *)self useProgressFromSZExtractor])
  {
    uint64_t v4 = 1;
    int v5 = obj;
    if (!obj) {
      goto LABEL_12;
    }
  }
  else
  {
    int v5 = obj;
    if (!obj)
    {
      uint64_t v4 = 0;
      goto LABEL_12;
    }
    LODWORD(v4) = objc_opt_respondsToSelector() & 1;
  }
  if (objc_opt_respondsToSelector()) {
    LODWORD(v4) = v4 | 2;
  }
  char v6 = objc_opt_respondsToSelector();
  int v5 = obj;
  if (v6) {
    uint64_t v4 = v4 | 4;
  }
  else {
    uint64_t v4 = v4;
  }
LABEL_12:
  objc_storeWeak((id *)&self->_extractorDelegate, v5);
  id v7 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractor];
  [v7 setActiveExtractorDelegateMethods:v4];
}

- (void)setExtractionProgress:(double)a3
{
  id v7 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractorDelegate];
  if ([(IXPromisedOutOfBandStreamingZipTransfer *)self useProgressFromSZExtractor]) {
    [(IXDataPromise *)self setPercentComplete:a3];
  }
  int v5 = v7;
  if (v7)
  {
    char v6 = objc_opt_respondsToSelector();
    int v5 = v7;
    if (v6)
    {
      [v7 setExtractionProgress:a3];
      int v5 = v7;
    }
  }
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractorDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 extractionCompleteAtArchivePath:v5];
  }
}

- (void)extractionEnteredPassThroughMode
{
  uint64_t v2 = [(IXPromisedOutOfBandStreamingZipTransfer *)self extractorDelegate];
  unint64_t v3 = (void *)v2;
  if (v2)
  {
    id v5 = (void *)v2;
    char v4 = objc_opt_respondsToSelector();
    unint64_t v3 = v5;
    if (v4)
    {
      [v5 extractionEnteredPassThroughMode];
      unint64_t v3 = v5;
    }
  }
}

- (IXPromisedOutOfBandStreamingZipTransfer)initWithSeed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  unint64_t v3 = [(IXDataPromise *)&v14 initWithSeed:a3];
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = objc_alloc(MEMORY[0x1E4FA8A48]);
  id v5 = [(IXDataPromise *)v3 seed];
  char v6 = [v5 szOptions];
  id v7 = (void *)[v4 initWithOptions:v6];
  [(IXPromisedOutOfBandStreamingZipTransfer *)v3 setExtractor:v7];

  uint64_t v8 = [(IXPromisedOutOfBandStreamingZipTransfer *)v3 extractor];

  if (!v8)
  {
    id v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [(IXDataPromise *)v3 seed];
      id v12 = [v11 szOptions];
      *(_DWORD *)buf = 136315394;
      objc_super v16 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithSeed:]";
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: -[SZExtractor initWithOptions:] returned nil for options %@", buf, 0x16u);
    }
    id v9 = 0;
  }
  else
  {
LABEL_3:
    id v9 = v3;
  }

  return v9;
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (SZExtractorDelegate)extractorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractorDelegate);

  return (SZExtractorDelegate *)WeakRetained;
}

- (SZExtractor)extractor
{
  return self->_extractor;
}

- (void)setExtractor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);

  objc_destroyWeak((id *)&self->_extractorDelegate);
}

- (void)prepareForExtraction:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: You must call -prepareForExtractionToPath: instead; -prepareForExtraction: is not valid on this type of promise. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)prepareForExtractionToPath:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:withCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: -supplyBytes:withCompletionBlock: called after promise was complete : %@", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:withCompletionBlock:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
}

- (void)suspendStreamWithCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
}

- (void)finishStreamWithCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
}

- (void)terminateStreamWithError:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: -terminateStreamWithError:completionBlock: called after promise was complete : %@", v2, v3, v4, v5, 2u);
}

- (void)terminateStreamWithError:completionBlock:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
}

- (void)resetWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 seed];
  uint64_t v4 = [v3 szOptions];
  int v5 = 136315650;
  char v6 = "-[IXPromisedOutOfBandStreamingZipTransfer resetWithCompletion:]";
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_ERROR, "%s: -[SZExtractor initWithOptions:] returned nil for options %@ : %@", (uint8_t *)&v5, 0x20u);
}

@end