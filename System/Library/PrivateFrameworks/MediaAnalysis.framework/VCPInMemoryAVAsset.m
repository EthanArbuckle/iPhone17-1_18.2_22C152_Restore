@interface VCPInMemoryAVAsset
+ (id)assetWithData:(id)a3;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (VCPInMemoryAVAsset)initWithData:(id)a3;
@end

@implementation VCPInMemoryAVAsset

- (VCPInMemoryAVAsset)initWithData:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"mediaanalysis://in-memory"];
  v11.receiver = self;
  v11.super_class = (Class)VCPInMemoryAVAsset;
  v7 = [(VCPInMemoryAVAsset *)&v11 initWithURL:v6 options:0];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaanalysisd.VCPInMemoryAVAsset", 0);
    v9 = [(VCPInMemoryAVAsset *)v7 resourceLoader];
    [v9 setDelegate:v7 queue:v8];
  }
  return v7;
}

+ (id)assetWithData:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v3];

  return v4;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [v7 contentInformationRequest];
  v9 = v8;
  if (v8)
  {
    [v8 setContentType:*MEMORY[0x1E4F15AA8]];
    objc_msgSend(v9, "setContentLength:", -[NSData length](self->_data, "length"));
    [v9 setByteRangeAccessSupported:1];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "  Fullfilled content request: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  objc_super v11 = [v7 dataRequest];
  if (!v11) {
    goto LABEL_16;
  }
  v12 = (void *)MEMORY[0x1C186D320]();
  if (([v11 requestedOffset] & 0x8000000000000000) == 0
    && ([v11 requestedLength] & 0x8000000000000000) == 0)
  {
    uint64_t v13 = [v11 requestedOffset];
    uint64_t v14 = [v11 requestedLength];
    if (v14 + v13 <= [(NSData *)self->_data length])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__46;
      v29 = __Block_byref_object_dispose__46;
      p_data = &self->_data;
      v30 = self->_data;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__VCPInMemoryAVAsset_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
      aBlock[3] = &unk_1E629BE60;
      aBlock[4] = &buf;
      v17 = _Block_copy(aBlock);
      uint64_t v18 = [(NSData *)*p_data bytes];
      uint64_t v19 = [v11 requestedOffset];
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:deallocator:", v18 + v19, objc_msgSend(v11, "requestedLength"), v17);
      [v11 respondWithData:v20];

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v24 = 138412290;
          v25 = v11;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "  Fullfilled data request: %@", v24, 0xCu);
        }
      }
      _Block_object_dispose(&buf, 8);

LABEL_16:
      [v7 finishLoading];
      BOOL v15 = 1;
      goto LABEL_17;
    }
  }
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

void __77__VCPInMemoryAVAsset_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void).cxx_destruct
{
}

@end