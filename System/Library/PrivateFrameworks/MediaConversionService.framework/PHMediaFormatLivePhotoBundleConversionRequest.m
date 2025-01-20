@interface PHMediaFormatLivePhotoBundleConversionRequest
- (BOOL)prepareWithError:(id *)a3;
- (PHMediaFormatLivePhotoConversionRequest)livePhotoConversionRequest;
- (void)enqueueSubrequestsOnConversionManager:(id)a3;
- (void)enumerateSubrequests:(id)a3;
- (void)postProcessSuccessfulCompositeRequest;
- (void)setLivePhotoConversionRequest:(id)a3;
@end

@implementation PHMediaFormatLivePhotoBundleConversionRequest

- (void).cxx_destruct
{
}

- (void)setLivePhotoConversionRequest:(id)a3
{
}

- (PHMediaFormatLivePhotoConversionRequest)livePhotoConversionRequest
{
  return (PHMediaFormatLivePhotoConversionRequest *)objc_getProperty(self, a2, 240, 1);
}

- (void)postProcessSuccessfulCompositeRequest
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 setMediaType:3];
  [v3 generateTemporaryOutputFileURLForRequest:self];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __86__PHMediaFormatLivePhotoBundleConversionRequest_postProcessSuccessfulCompositeRequest__block_invoke;
  v32[3] = &unk_1E6CFEA78;
  v32[4] = self;
  id v33 = 0;
  v4 = (void (**)(void))MEMORY[0x1E01C2040](v32);
  id v31 = 0;
  char v5 = [v3 createTemporaryOutputDirectoryWithError:&v31];
  id v6 = v31;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F8CE20]);
    v8 = [(PHMediaFormatConversionRequest *)self source];
    v9 = [v8 fileURL];
    v10 = (void *)[v7 initWithBundleAtURL:v9];

    if (v10)
    {
      v11 = [(PHMediaFormatLivePhotoBundleConversionRequest *)self livePhotoConversionRequest];
      v12 = [v11 videoConversionRequest];
      v13 = [v12 destination];
      v14 = [v13 fileURL];

      v15 = [(PHMediaFormatLivePhotoBundleConversionRequest *)self livePhotoConversionRequest];
      v16 = [v15 imageConversionRequest];
      v17 = [v16 destination];
      v18 = [v17 fileURL];

      if ([(PHMediaFormatConversionCompositeRequest *)self requiresFormatConversion]) {
        [(PHMediaFormatConversionRequest *)self livePhotoPairingIdentifier];
      }
      else {
      v19 = [v10 pairingIdentifier];
      }
      id v20 = objc_alloc(MEMORY[0x1E4F8CE20]);
      v28 = v14;
      v21 = [v14 path];
      v27 = v18;
      v22 = [v18 path];
      [v10 imageDisplayTime];
      v23 = (void *)[v20 initWithPathToVideo:v21 pathToImage:v22 imageDisplayTime:v30 pairingIdentifier:v19];

      v24 = [v3 temporaryOutputFileURL];
      id v29 = v6;
      char v25 = [v23 writeToBundleAtURL:v24 error:&v29];
      id v26 = v29;

      if (v25)
      {
        [(PHMediaFormatConversionRequest *)self setDestination:v3];
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v26;
          _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create live photo output bundle: %@", buf, 0xCu);
        }
        v4[2](v4);
      }

      id v6 = v26;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create live photo source bundle", buf, 2u);
      }
      v4[2](v4);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v6;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create temporary output parent directory for live photo bundle: %@", buf, 0xCu);
    }
    v4[2](v4);
  }
}

uint64_t __86__PHMediaFormatLivePhotoBundleConversionRequest_postProcessSuccessfulCompositeRequest__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v7 = *MEMORY[0x1E4F28A50];
    v8[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v4 = 0;
  }
  char v5 = [v2 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:7 userInfo:v4];
  [*(id *)(a1 + 32) setError:v5];

  if (v3) {
  return [*(id *)(a1 + 32) setStatus:5];
  }
}

- (void)enumerateSubrequests:(id)a3
{
  id v5 = a3;
  id v6 = [(PHMediaFormatLivePhotoBundleConversionRequest *)self livePhotoConversionRequest];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  id v4 = a3;
  [(PHMediaFormatConversionCompositeRequest *)self propagateRequestOptionsToSubrequests];
  id v5 = [(PHMediaFormatLivePhotoBundleConversionRequest *)self livePhotoConversionRequest];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__PHMediaFormatLivePhotoBundleConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke;
  v6[3] = &unk_1E6CFEE00;
  v6[4] = self;
  [v4 enqueueConversionRequest:v5 completionHandler:v6];
}

void __87__PHMediaFormatLivePhotoBundleConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v2 = [*(id *)(a1 + 32) livePhotoConversionRequest];
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Live photo bundle request subrequest finished: %@", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PHMediaFormatConversionRequest *)self source];
  id v6 = [v5 fileURL];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 imagePath];
    uint64_t v10 = [v8 videoPath];
    v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get image and video path from pvt bundle at path %@", buf, 0xCu);
      }
      BOOL v13 = 0;
    }
    else
    {
      id v29 = v9;
      v30 = (void *)v10;
      v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
      uint64_t v15 = +[PHMediaFormatConversionSource imageSourceForFileURL:v14];

      v16 = [(PHMediaFormatConversionRequest *)self destinationCapabilities];
      id v31 = (void *)v15;
      uint64_t v17 = +[PHMediaFormatConversionRequest requestForSource:v15 destinationCapabilities:v16 error:a3];

      v32 = (void *)v17;
      if (v17)
      {
        v11 = v30;
        v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v30];
        uint64_t v19 = +[PHMediaFormatConversionSource videoSourceForFileURL:v18];

        id v20 = [(PHMediaFormatConversionRequest *)self destinationCapabilities];
        v28 = (void *)v19;
        v21 = +[PHMediaFormatConversionRequest requestForSource:v19 destinationCapabilities:v20 error:a3];

        if (v21)
        {
          v22 = +[PHMediaFormatLivePhotoConversionRequest requestForImageConversionRequest:v17 videoConversionRequest:v21 error:a3];
          BOOL v13 = v22 != 0;
          if (v22)
          {
            [(PHMediaFormatConversionRequest *)self setLivePhotoPairingIdentifierBehavior:4];
            v23 = [MEMORY[0x1E4F29128] UUID];
            v24 = [v23 UUIDString];
            [(PHMediaFormatConversionRequest *)self setLivePhotoPairingIdentifier:v24];

            [(PHMediaFormatLivePhotoBundleConversionRequest *)self setLivePhotoConversionRequest:v22];
            [v22 setParentRequest:self];
            char v25 = v28;
          }
          else
          {
            char v25 = (void *)v19;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v6;
              _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle request for %@", buf, 0xCu);
            }
          }

          v9 = v29;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v30;
            _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle video subrequest for %@", buf, 0xCu);
          }
          BOOL v13 = 0;
          char v25 = (void *)v19;
          v9 = v29;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v29;
        v34 = v29;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle image subrequest for %@", buf, 0xCu);
        BOOL v13 = 0;
        v11 = v30;
      }
      else
      {
        BOOL v13 = 0;
        v9 = v29;
        v11 = v30;
      }
    }
  }
  else
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:5 userInfo:0];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v27 = [v6 path];
      *(_DWORD *)buf = 138412290;
      v34 = v27;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle with path %@", buf, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

@end