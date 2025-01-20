@interface PHAsset(VCPFingerprint)
- (id)vcp_fingerprint:()VCPFingerprint;
@end

@implementation PHAsset(VCPFingerprint)

- (id)vcp_fingerprint:()VCPFingerprint
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = a3;
  v5 = [a1 objectID];

  if (v5)
  {
    if (!v4) {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__45;
    v17 = __Block_byref_object_dispose__45;
    id v18 = 0;
    v6 = (void *)MEMORY[0x1E4F38EC0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__PHAsset_VCPFingerprint__vcp_fingerprint___block_invoke;
    v11[3] = &unk_1E629BE38;
    p_long long buf = &buf;
    v11[4] = a1;
    dispatch_semaphore_t v4 = v4;
    dispatch_semaphore_t v12 = v4;
    [v6 _computeFingerPrintsOfAsset:a1 completionHandler:v11];
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    id v7 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [a1 localIdentifier];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "  [%@] Fingerprint requested for asset with no objectID", (uint8_t *)&buf, 0xCu);
      }
    }
    id v7 = 0;
  }

  return v7;
}

@end