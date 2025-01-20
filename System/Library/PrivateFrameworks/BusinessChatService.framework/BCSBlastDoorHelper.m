@interface BCSBlastDoorHelper
+ (BCSBlastDoorHelper)defaultHelper;
- (BCSBlastDoorHelper)initWithPersistentStore:(id)a3;
- (BCSBlastDoorImageCache)store;
- (id)_blastDoorImagePreviewFromImageURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6;
- (id)_dataFromCGImageRef:(CGImage *)a3;
- (id)_fileURLAfterWritingData:(id)a3 extension:(id)a4 error:(id *)a5;
- (id)safeCSSFromData:(id)a3 error:(id *)a4;
- (id)safeImageFromImage:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6;
- (id)safeImageURLFromImage:(id)a3 imageFormat:(id)a4 error:(id *)a5;
- (id)safeImageURLFromImage:(id)a3 imageFormat:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 error:(id *)a7;
- (id)safeImageURLFromImageURL:(id)a3 error:(id *)a4;
- (id)safeImageURLFromImageURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6;
- (void)setStore:(id)a3;
- (void)warmUpBlastDoor;
@end

@implementation BCSBlastDoorHelper

- (BCSBlastDoorHelper)initWithPersistentStore:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCSBlastDoorHelper;
  v6 = [(BCSBlastDoorHelper *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = objc_alloc_init(BCSExecutionTimer);
    id v9 = objc_alloc(MEMORY[0x263F556E0]);
    uint64_t v10 = [v9 initWithBlastDoorInstanceType:*MEMORY[0x263F2B8C0]];
    blastdoor = v7->_blastdoor;
    v7->_blastdoor = (IMMessagesBlastDoorInterface *)v10;

    v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(BCSExecutionTimer *)v8 milliseconds];
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v13;
      _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "BlastDoor init took  %llu ms", buf, 0xCu);
    }
  }
  return v7;
}

+ (BCSBlastDoorHelper)defaultHelper
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  id v9 = 0;
  v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v9];
  id v4 = v9;

  if (v3)
  {
    id v5 = [v3 URLByAppendingPathComponent:@"com.apple.businessservicesd/temp"];
    v6 = -[BCSBlastDoorPersistentStore initWithCacheURL:]((id *)[BCSBlastDoorPersistentStore alloc], v5);
    v7 = [[BCSBlastDoorHelper alloc] initWithPersistentStore:v6];
  }
  else
  {
    id v5 = ABSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_2154F4000, v5, OS_LOG_TYPE_ERROR, "Error finding default cache directory for BlastDoor image store: %@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void)warmUpBlastDoor
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = ABSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2154F4000, v3, OS_LOG_TYPE_DEFAULT, "Warming up BlastDoor interface", buf, 2u);
  }

  id v4 = [(BCSBlastDoorHelper *)self store];
  id v13 = 0;
  id v5 = [v4 fileURLForImageWithName:@"warmUp.gif" error:&v13];
  id v6 = v13;

  if (v5)
  {
    v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&warmUpBlastDoor_warmUpGIFBytes length:37];
    if ([v7 writeToURL:v5 atomically:0])
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke;
      v11[3] = &unk_264248948;
      v11[4] = self;
      id v12 = v5;
      unint64_t v8 = BCSTimeExecutionOfBlock((uint64_t)v11);
      id v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v15 = v8 / 0xF4240;
        _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "Warmed up BlastDoor interface in %llu ms", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = ABSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2154F4000, v10, OS_LOG_TYPE_ERROR, "Error writing temp file for warm up image", buf, 2u);
      }
    }
  }
  else
  {
    v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v15 = (unint64_t)v6;
      _os_log_error_impl(&dword_2154F4000, v7, OS_LOG_TYPE_ERROR, "Error creating temp file for warm up image: %@", buf, 0xCu);
    }
  }
}

void __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke_2;
  v5[3] = &unk_264249E38;
  id v6 = v1;
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  [v2 generatePreviewforAttachmentWithfileURL:v6 maxPixelDimension:v5 scale:v3 resultHandler:v4];
}

void __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

- (id)safeImageURLFromImageURL:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[BCSBlastDoorHelper safeImageURLFromImageURL:error:]";
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  LODWORD(v8) = 1127153664;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [(BCSBlastDoorHelper *)self safeImageURLFromImageURL:v6 maxPixelDimension:a4 scale:v8 error:v9];

  return v10;
}

- (id)safeImageURLFromImageURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[BCSBlastDoorHelper safeImageURLFromImageURL:maxPixelDimension:scale:error:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v12 = objc_alloc_init(BCSExecutionTimer);
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  unint64_t v15 = [(BCSBlastDoorHelper *)self _blastDoorImagePreviewFromImageURL:v10 maxPixelDimension:a6 scale:v13 error:v14];
  uint64_t v16 = NSString;
  uint64_t v17 = [v10 lastPathComponent];
  uint64_t v18 = [v17 stringByDeletingPathExtension];
  v19 = [v10 pathExtension];

  v20 = [v16 stringWithFormat:@"%@-safe.%@", v18, v19];

  v21 = [(BCSBlastDoorHelper *)self store];
  v22 = [v21 fileURLForImageWithName:v20 error:a6];

  if (!v22)
  {
    v26 = ABSLogCommon();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      id v28 = 0;
      goto LABEL_12;
    }
    v29 = (const char *)*a6;
    *(_DWORD *)buf = 138412290;
    v34 = v29;
    v30 = "Error creating temp file for image copy: %@";
LABEL_16:
    _os_log_error_impl(&dword_2154F4000, v26, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
    goto LABEL_11;
  }
  v23 = [v15 image];
  char v24 = [v23 writeToURL:v22 usingEncoding:0 error:a6];

  v25 = ABSLogCommon();
  v26 = v25;
  if ((v24 & 1) == 0)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    v32 = (const char *)*a6;
    *(_DWORD *)buf = 138412290;
    v34 = v32;
    v30 = "Error writing BlastDoor image copy: %@";
    goto LABEL_16;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [(BCSExecutionTimer *)v12 milliseconds];
    *(_DWORD *)buf = 134217984;
    v34 = (const char *)v27;
    _os_log_impl(&dword_2154F4000, v26, OS_LOG_TYPE_DEFAULT, "safeImageURLFromImageURL processing took  %llu ms (total)", buf, 0xCu);
  }

  id v28 = v22;
LABEL_12:

  return v28;
}

- (id)_blastDoorImagePreviewFromImageURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = objc_alloc_init(BCSExecutionTimer);
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  double v14 = [(IMMessagesBlastDoorInterface *)self->_blastdoor generateImagePreviewForFileURL:v10 maxPixelDimension:a6 scale:v12 error:v13];

  unint64_t v15 = ABSLogCommon();
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      uint64_t v21 = [(BCSExecutionTimer *)v11 milliseconds];
      _os_log_impl(&dword_2154F4000, v16, OS_LOG_TYPE_DEFAULT, "BlastDoor processing took  %llu ms", (uint8_t *)&v20, 0xCu);
    }

    id v17 = v14;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v19 = *a6;
      int v20 = 138412290;
      uint64_t v21 = (uint64_t)v19;
      _os_log_error_impl(&dword_2154F4000, v16, OS_LOG_TYPE_ERROR, "Error generating BlastDoor preview: %@", (uint8_t *)&v20, 0xCu);
    }
  }

  return v14;
}

- (id)safeImageURLFromImage:(id)a3 imageFormat:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 error:(id *)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a3;
  double v14 = ABSLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[BCSBlastDoorHelper safeImageURLFromImage:imageFormat:maxPixelDimension:scale:error:]";
    _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v21, 0xCu);
  }

  unint64_t v15 = [(BCSBlastDoorHelper *)self _fileURLAfterWritingData:v13 extension:v12 error:a7];

  *(float *)&double v16 = a5;
  *(float *)&double v17 = a6;
  uint64_t v18 = [(BCSBlastDoorHelper *)self safeImageURLFromImageURL:v15 maxPixelDimension:a7 scale:v16 error:v17];
  id v19 = [MEMORY[0x263F08850] defaultManager];
  [v19 removeItemAtURL:v15 error:0];

  return v18;
}

- (id)safeImageURLFromImage:(id)a3 imageFormat:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  id v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    double v16 = "-[BCSBlastDoorHelper safeImageURLFromImage:imageFormat:error:]";
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  LODWORD(v11) = 1127153664;
  LODWORD(v12) = 1.0;
  id v13 = [(BCSBlastDoorHelper *)self safeImageURLFromImage:v9 imageFormat:v8 maxPixelDimension:a5 scale:v11 error:v12];

  return v13;
}

- (id)safeImageFromImage:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  double v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    int v21 = "-[BCSBlastDoorHelper safeImageFromImage:maxPixelDimension:scale:error:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v20, 0xCu);
  }

  double v12 = [(BCSBlastDoorHelper *)self _fileURLAfterWritingData:v10 extension:@"unknown" error:a6];

  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  int v15 = [(BCSBlastDoorHelper *)self _blastDoorImagePreviewFromImageURL:v12 maxPixelDimension:a6 scale:v13 error:v14];
  double v16 = [v15 image];
  uint64_t v17 = -[BCSBlastDoorHelper _dataFromCGImageRef:](self, "_dataFromCGImageRef:", [v16 cgImage]);

  uint64_t v18 = [MEMORY[0x263F08850] defaultManager];
  [v18 removeItemAtURL:v12 error:0];

  return v17;
}

- (id)safeCSSFromData:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)_fileURLAfterWritingData:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = NSString;
  id v10 = (void *)MEMORY[0x263F08C38];
  id v11 = a4;
  double v12 = [v10 UUID];
  double v13 = [v12 UUIDString];
  double v14 = [v9 stringWithFormat:@"%@.%@", v13, v11];

  int v15 = [(BCSBlastDoorHelper *)self store];
  double v16 = [v15 fileURLForImageWithName:v14 error:a5];

  if (v16 && ([v8 writeToURL:v16 atomically:0] & 1) == 0)
  {
    uint64_t v18 = ABSLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v18, OS_LOG_TYPE_ERROR, "Failed to create copy of data", buf, 2u);
    }

    id v17 = 0;
  }
  else
  {
    id v17 = v16;
  }

  return v17;
}

- (id)_dataFromCGImageRef:(CGImage *)a3
{
  double v4 = [MEMORY[0x263EFF990] data];
  id v5 = [(id)*MEMORY[0x263F1DC08] identifier];
  CFStringRef v6 = CFStringCreateWithCString(0, (const char *)[v5 UTF8String], 0x8000100u);

  v7 = CGImageDestinationCreateWithData(v4, v6, 1uLL, 0);
  CFRelease(v6);
  if (v7)
  {
    CGImageDestinationAddImage(v7, a3, 0);
    if (CGImageDestinationFinalize(v7))
    {
      CFRelease(v7);
      id v8 = v4;
      goto LABEL_11;
    }
    id v10 = ABSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v12 = 0;
      _os_log_error_impl(&dword_2154F4000, v10, OS_LOG_TYPE_ERROR, "Failed to finalize CGImageDestination", v12, 2u);
    }

    CFRelease(v7);
  }
  else
  {
    id v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestination", buf, 2u);
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (BCSBlastDoorImageCache)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_blastdoor, 0);
}

@end