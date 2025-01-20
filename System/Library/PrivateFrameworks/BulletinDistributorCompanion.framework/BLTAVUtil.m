@interface BLTAVUtil
+ (void)_transcodeVideoAsync:(id)a3 outURL:(id)a4 maxBytes:(unint64_t)a5 completionHandler:(id)a6;
+ (void)transcodeURL:(id)a3 outURL:(id)a4 maxBytes:(unint64_t)a5 completion:(id)a6;
@end

@implementation BLTAVUtil

+ (void)transcodeURL:(id)a3 outURL:(id)a4 maxBytes:(unint64_t)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [NSDictionary dictionaryWithObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFA288]];
  v14 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v10 options:v13];
  v15 = [v14 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  int v16 = [v15 count];

  v17 = [v14 tracksWithMediaType:*MEMORY[0x263EF9CE8]];
  int v18 = [v17 count];

  v19 = blt_general_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v26 = v14;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 1024;
    int v30 = v16;
    __int16 v31 = 1024;
    int v32 = v18;
    _os_log_impl(&dword_222F4C000, v19, OS_LOG_TYPE_DEFAULT, "Transcoding: created asset %@ from URL: %@ with %d video tracks, %d audio tracks", buf, 0x22u);
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __53__BLTAVUtil_transcodeURL_outURL_maxBytes_completion___block_invoke;
  v22[3] = &unk_264684518;
  id v23 = v11;
  id v24 = v12;
  id v20 = v12;
  id v21 = v11;
  [a1 _transcodeVideoAsync:v14 outURL:v21 maxBytes:a5 completionHandler:v22];
}

void __53__BLTAVUtil_transcodeURL_outURL_maxBytes_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [*(id *)(a1 + 32) absoluteURL];
  v6 = [v5 path];
  id v13 = 0;
  v7 = [v4 attributesOfItemAtPath:v6 error:&v13];
  id v8 = v13;
  uint64_t v9 = [v7 fileSize];

  id v10 = blt_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_222F4C000, v10, OS_LOG_TYPE_DEFAULT, "Transcoding: File %@ has size %llu with error %@", buf, 0x20u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);
  }
}

+ (void)_transcodeVideoAsync:(id)a3 outURL:(id)a4 maxBytes:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v9 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  uint64_t v13 = [v12 count];

  v14 = [v9 tracksWithMediaType:*MEMORY[0x263EF9CE8]];
  uint64_t v15 = [v14 count];

  id v16 = (id)*MEMORY[0x263EF95A8];
  if (v13) {
    goto LABEL_4;
  }
  if (v15)
  {
    id v17 = (id)*MEMORY[0x263EF95B0];

    id v16 = v17;
LABEL_4:
    __int16 v18 = (void *)[objc_alloc(MEMORY[0x263EFA4A8]) initWithAsset:v9 presetName:v16];
    id v19 = blt_general_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        id v21 = [v18 supportedFileTypes];
        *(_DWORD *)buf = 138412290;
        id v33 = v21;
        _os_log_impl(&dword_222F4C000, v19, OS_LOG_TYPE_DEFAULT, "Transcoding: Supported file types: %@", buf, 0xCu);
      }
      v22 = [v18 supportedFileTypes];
      id v23 = [v22 objectAtIndex:0];

      id v24 = blt_general_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v23;
        _os_log_impl(&dword_222F4C000, v24, OS_LOG_TYPE_DEFAULT, "Transcoding:   outputFileType: %@", buf, 0xCu);
      }

      if (v23)
      {
        [v18 setOutputFileType:v23];
        [v18 setFileLengthLimit:a5];
        [v18 setOutputURL:v10];
        v25 = blt_general_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [v18 outputURL];
          *(_DWORD *)buf = 138412546;
          id v33 = v16;
          __int16 v34 = 2112;
          v35 = v26;
          _os_log_impl(&dword_222F4C000, v25, OS_LOG_TYPE_DEFAULT, "Transcoding:     Preset name: %@, outputURL: %@", buf, 0x16u);
        }
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __68__BLTAVUtil__transcodeVideoAsync_outURL_maxBytes_completionHandler___block_invoke;
        v29[3] = &unk_264684118;
        id v30 = v18;
        id v31 = v11;
        [v30 exportAsynchronouslyWithCompletionHandler:v29];

        id v27 = v30;
      }
      else
      {
        id v28 = blt_general_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222F4C000, v28, OS_LOG_TYPE_DEFAULT, "Transcoding: Could not find a valid outputType for Message presets", buf, 2u);
        }

        id v27 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.bulletindistributor.avutil" code:3 userInfo:0];
        if (v11) {
          (*((void (**)(id, id))v11 + 2))(v11, v27);
        }
      }
    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222F4C000, v19, OS_LOG_TYPE_DEFAULT, "Transcoding: Could not create export session with Message presets", buf, 2u);
      }

      id v23 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.bulletindistributor.avutil" code:3 userInfo:0];
      if (v11) {
        (*((void (**)(id, void *))v11 + 2))(v11, v23);
      }
    }

    goto LABEL_23;
  }
  __int16 v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.bulletindistributor.avutil" code:1 userInfo:0];
  if (v11) {
    (*((void (**)(id, void *))v11 + 2))(v11, v18);
  }
LABEL_23:
}

void __68__BLTAVUtil__transcodeVideoAsync_outURL_maxBytes_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) status];
  if (v2 == 5)
  {
    v7 = blt_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Transcoding: Export canceled", (uint8_t *)&v11, 2u);
    }

    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = 2;
    goto LABEL_9;
  }
  if (v2 == 4)
  {
    id v3 = blt_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [*(id *)(a1 + 32) error];
      int v11 = 138412290;
      uint64_t v12 = v4;
      _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_DEFAULT, "Transcoding: Export failed: %@", (uint8_t *)&v11, 0xCu);
    }
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = 3;
LABEL_9:
    id v8 = [v5 errorWithDomain:@"com.apple.bulletindistributor.avutil" code:v6 userInfo:0];
    goto LABEL_13;
  }
  id v9 = blt_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "Transcoding: Export succeeded!", (uint8_t *)&v11, 2u);
  }

  [*(id *)(a1 + 32) outputURL];
  id v8 = 0;
LABEL_13:
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
  }
}

@end