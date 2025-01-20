@interface CAMBurstSession
- (BOOL)_isFinalized;
- (CAMBurstSession)init;
- (CIBurstImageSet)_burstImageSet;
- (NSString)identifier;
- (id)description;
- (id)performBurstAnalysisForDevice:(int64_t)a3;
- (unint64_t)count;
- (unint64_t)estimatedCount;
- (void)_setCount:(unint64_t)a3;
- (void)_setEstimatedCount:(unint64_t)a3;
- (void)_setFinalized:(BOOL)a3;
- (void)addStillImageCaptureResult:(id)a3;
- (void)addStillImageLocalPersistenceResult:(id)a3 withFaces:(id)a4;
@end

@implementation CAMBurstSession

- (CAMBurstSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)CAMBurstSession;
  v2 = [(CAMBurstSession *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_estimatedCount = 0;
    v2->_count = 0;
    v4 = (CIBurstImageSet *)objc_alloc_init(MEMORY[0x263F00600]);
    burstImageSet = v3->__burstImageSet;
    v3->__burstImageSet = v4;

    v6 = v3;
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAMBurstSession *)self identifier];
  unint64_t v6 = [(CAMBurstSession *)self count];
  unint64_t v7 = [(CAMBurstSession *)self estimatedCount];
  BOOL v8 = [(CAMBurstSession *)self _isFinalized];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = [v3 stringWithFormat:@"<%@ identifier:%@, count:%ld, estimatedCount:%ld, finalized:%@>", v4, v5, v6, v7, v9];

  return v10;
}

- (NSString)identifier
{
  v2 = [(CAMBurstSession *)self _burstImageSet];
  v3 = [v2 burstId];

  return (NSString *)v3;
}

- (id)performBurstAnalysisForDevice:(int64_t)a3
{
  if ([(CAMBurstSession *)self _isFinalized])
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [(CAMBurstSession *)self identifier];
    unint64_t v6 = [(CAMBurstSession *)self _burstImageSet];
    unint64_t v7 = [v6 allImageIdentifiers];
    BOOL v8 = [v6 bestImageIdentifiers];
    v9 = [v6 coverImageIdentifier];
    uint64_t v4 = [[CAMBurstAnalysisResult alloc] initWithIdentifier:v5 allAssetIdentifiers:v7 goodAssetIdentifiers:v8 bestAssetIdentifier:v9];
  }
  return v4;
}

- (void)addStillImageCaptureResult:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(CAMBurstSession *)self _isFinalized];
  id v5 = v7;
  if (!v4)
  {
    unint64_t v6 = [v7 error];
    if (!v6) {
      [(CAMBurstSession *)self _setEstimatedCount:[(CAMBurstSession *)self estimatedCount] + 1];
    }

    id v5 = v7;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)addStillImageLocalPersistenceResult:(id)a3 withFaces:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(CAMBurstSession *)self _isFinalized])
  {
    BOOL v8 = [v6 captureResult];
    v9 = [v8 error];
    if (v9)
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CAMBurstSession addStillImageLocalPersistenceResult:withFaces:]((uint64_t)v9, v10);
      }
    }
    else
    {
      uint64_t v20 = [v8 stillImageUnfilteredPreviewSurface];
      v22 = [v8 metadata];
      id v21 = [v22 mutableCopy];
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = [*(id *)(*((void *)&v23 + 1) + 8 * i) burstMetadataRepresentation];
            [v11 addObject:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v14);
      }

      [v21 setObject:v11 forKey:@"AccumulatedFaceMetadata"];
      v18 = [v6 localPersistenceUUID];
      v19 = [(CAMBurstSession *)self _burstImageSet];
      [v19 addImageFromIOSurface:v20 properties:v21 identifier:v18 completionBlock:0];
      [(CAMBurstSession *)self _setCount:[(CAMBurstSession *)self count] + 1];

      v10 = v22;
      v9 = 0;
    }
  }
}

- (unint64_t)estimatedCount
{
  return self->_estimatedCount;
}

- (void)_setEstimatedCount:(unint64_t)a3
{
  self->_estimatedCount = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)_setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (BOOL)_isFinalized
{
  return self->_finalized;
}

- (void)_setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (CIBurstImageSet)_burstImageSet
{
  return self->__burstImageSet;
}

- (void).cxx_destruct
{
}

- (void)addStillImageLocalPersistenceResult:(uint64_t)a1 withFaces:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Unable to enqueue still image capture result for burst analysis due to a capture error (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end