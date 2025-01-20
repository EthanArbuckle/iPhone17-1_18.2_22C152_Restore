@interface PHFigDecoder
+ (id)sharedDecoder;
- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6;
- (void)cancelInFlightAsyncDecodeForRequestHandle:(id)a3;
@end

@implementation PHFigDecoder

+ (id)sharedDecoder
{
  if (sharedDecoder_s_onceToken_46678 != -1) {
    dispatch_once(&sharedDecoder_s_onceToken_46678, &__block_literal_global_46679);
  }
  v2 = (void *)sharedDecoder_s_shared_46680;

  return v2;
}

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  PFSharedFigDecodeSession();
  int v14 = [v12 shouldLoadGainMap];
  if (v11) {
    id v15 = v11;
  }
  else {
    id v15 = v10;
  }
  id v60 = v15;
  v16 = malloc_type_calloc(1uLL, 0x70uLL, 0x10A0040365111DBuLL);
  objc_storeStrong((id *)v16 + 6, a5);
  *(void *)v16 = [v12 maximumLongSideLength];
  *((void *)v16 + 1) = [v12 resizeMode];
  *((unsigned char *)v16 + 16) = [v12 optimizeForDrawing];
  *((unsigned char *)v16 + 17) = [v12 highPriority];
  *((unsigned char *)v16 + 18) = [v12 waitUntilComplete];
  int v17 = v14;
  objc_storeStrong((id *)v16 + 8, a3);
  id v18 = a4;
  v19 = (void (**)(void, void, void, void, void))v13;
  objc_storeStrong((id *)v16 + 7, v18);
  v20 = _Block_copy(v13);
  v21 = (void *)*((void *)v16 + 9);
  *((void *)v16 + 9) = v20;

  *((void *)v16 + 11) = 0;
  *((unsigned char *)v16 + 19) = [v12 allowFallbackDecoder];
  *((unsigned char *)v16 + 20) = [v12 preferSWDecode];
  *((unsigned char *)v16 + 21) = [v12 useLowMemoryMode];
  *((void *)v16 + 12) = 0;
  if (v14) {
    int v22 = 2;
  }
  else {
    int v22 = 1;
  }
  *((_DWORD *)v16 + 8) = v22;
  atomic_store(0, (unsigned int *)v16 + 9);
  CMPhotoDecompressionSessionReserveRequestID();
  v23 = _figDecodeOptionsFromContext((uint64_t)v16, 0, 0);
  if ([v12 waitUntilComplete])
  {
    id v24 = v12;
    id v56 = v10;
    id v59 = v11;
    id v57 = v19;
    CFTypeRef cf = 0;
    int CGImageForIndex = CMPhotoDecompressionCreateCGImageForIndex();
    if (CGImageForIndex)
    {
      if (*((unsigned char *)v16 + 19))
      {
        int v26 = CGImageForIndex;
        id v27 = v24;
        v28 = PLImageManagerGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          buf[0] = 138412546;
          *(void *)&buf[1] = v60;
          __int16 v64 = 1024;
          int v65 = v26;
          _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEFAULT, "[RM] PHFigDecoder - failed sync decode of image: %@, status code: %d", (uint8_t *)buf, 0x12u);
        }

        v29 = +[PHImageIODecoder sharedDecoder];
        v30 = v56;
        v31 = v27;
        id v32 = v27;
        v33 = v57;
        id v34 = (id)[v29 decodeImageFromData:v56 orFileURL:v59 options:v32 completion:v57];

        id v24 = v31;
      }
      else
      {
        v30 = v56;
        v33 = v57;
        if (*((void *)v16 + 9)) {
          (*((void (**)(id, void, void, void, void))v57 + 2))(v57, 0, 0, 0, 0);
        }
      }
    }
    else
    {
      if ([v24 shouldLoadGainMap])
      {
        id v38 = v24;
        CFTypeRef v61 = 0;
        int Container = CMPhotoDecompressionSessionCreateContainer();
        v49 = PLImageManagerGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          buf[0] = 138412546;
          *(void *)&buf[1] = v60;
          __int16 v64 = 1024;
          int v65 = Container;
          _os_log_impl(&dword_19B043000, v49, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to open decompression container for gain map: %@, status code: %d", (uint8_t *)buf, 0x12u);
        }

        id v24 = v38;
      }
      v30 = v56;
      v33 = v57;
      (*((void (**)(id, CFTypeRef, void, uint64_t, void))v57 + 2))(v57, cf, 0, 1, 0);
      CGImageRelease((CGImageRef)cf);
    }
LABEL_39:
    v45 = 0;
LABEL_40:
    _cleanupContext((uint64_t)v16);
    goto LABEL_41;
  }
  CFTypeRef cf = 0;
  int v35 = CMPhotoDecompressionSessionCreateContainer();
  if (v35)
  {
    int v36 = v35;
    v37 = PLImageManagerGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 138412546;
      *(void *)&buf[1] = v60;
      __int16 v64 = 1024;
      int v65 = v36;
      _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEFAULT, "[RM] PHFigDecoder - failed to open container for image: %@, status code: %d", (uint8_t *)buf, 0x12u);
    }

    v19[2](v19, 0, 0, 0, 0);
    goto LABEL_39;
  }
  v55 = v19;
  v40 = [[PHImageDecoderAsyncDecodeRequestHandle alloc] initWithFigRequestID:0 container:cf figDecoder:self];
  CFRelease(cf);
  objc_storeStrong((id *)v16 + 10, v40);
  int v41 = CMPhotoDecompressionContainerDecodeImageForIndexAsyncF();
  if (v41)
  {
    int v42 = v41;
    v43 = PLImageManagerGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 138412546;
      *(void *)&buf[1] = v60;
      __int16 v64 = 1024;
      int v65 = v42;
      _os_log_impl(&dword_19B043000, v43, OS_LOG_TYPE_DEFAULT, "[RM] PHFigDecoder - failed to start decode for image: %@, status code: %d", (uint8_t *)buf, 0x12u);
    }

    if (*((unsigned char *)v16 + 19))
    {
      v44 = +[PHImageIODecoder sharedDecoder];
      v45 = [v44 decodeImageFromData:v10 orFileURL:v11 options:v12 completion:v55];
    }
    else
    {
      v55[2](v55, 0, 0, 0, 0);
      v45 = 0;
    }

    v19 = v55;
    goto LABEL_40;
  }
  v45 = v40;
  v19 = v55;
  if (v17)
  {
    CFTypeRef v61 = (CFTypeRef)0x7FFFFFFFFFFFFFFFLL;
    int v46 = _indexOfGainMapInContainer((uint64_t)cf, &v61);
    if (v46)
    {
      int v47 = v46;
      v48 = PLImageManagerGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 138412546;
        *(void *)&buf[1] = v60;
        __int16 v64 = 1024;
        int v65 = v47;
        _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to determine index of gain map: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }
    }
    else if (v61 != (CFTypeRef)0x7FFFFFFFFFFFFFFFLL)
    {
      CMPhotoDecompressionSessionReserveRequestID();
      [*((id *)v16 + 10) setFigGainMapRequestID:0];
      v51 = _figDecodeOptionsFromContext((uint64_t)v16, 0, 1);
      int v52 = CMPhotoDecompressionContainerDecodeAuxiliaryImageForIndexAsyncF();
      v53 = PLImageManagerGetLog();
      v54 = v53;
      if (!v52)
      {
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - started async gain map decode", (uint8_t *)buf, 2u);
        }

        v19 = v55;
        goto LABEL_50;
      }
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 138412546;
        *(void *)&buf[1] = v60;
        __int16 v64 = 1024;
        int v65 = v52;
        _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to start decode for gain map: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }

      v19 = v55;
    }
    atomic_fetch_add((atomic_uint *volatile)v16 + 9, 1u);
  }
LABEL_50:

LABEL_41:

  return v45;
}

void __29__PHFigDecoder_sharedDecoder__block_invoke()
{
  v0 = objc_alloc_init(PHFigDecoder);
  v1 = (void *)sharedDecoder_s_shared_46680;
  sharedDecoder_s_shared_46680 = (uint64_t)v0;
}

- (void)cancelInFlightAsyncDecodeForRequestHandle:(id)a3
{
  id v3 = a3;
  if ([v3 figRequestID] && objc_msgSend(v3, "figDecompressionContainer"))
  {
    [v3 figRequestID];
    CMPhotoDecompressionContainerCancelAsyncRequest();
    [v3 figGainMapRequestID];
    CMPhotoDecompressionContainerCancelAsyncRequest();
  }
}

@end