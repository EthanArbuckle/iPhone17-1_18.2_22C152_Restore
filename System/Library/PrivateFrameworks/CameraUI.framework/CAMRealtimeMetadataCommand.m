@interface CAMRealtimeMetadataCommand
- (CAMRealtimeMetadataCommand)initWithCoder:(id)a3;
- (CAMRealtimeMetadataCommand)initWithTypes:(id)a3;
- (NSArray)_desiredTypes;
- (id)_metadataObjectTypeForRealtimeMetadataType:(int64_t)a3;
- (id)_metadataObjectTypesForRealtimeMetadataTypes:(id)a3 withAvailableMetadataTypes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMRealtimeMetadataCommand

- (CAMRealtimeMetadataCommand)initWithTypes:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMRealtimeMetadataCommand;
  v5 = [(CAMCaptureCommand *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    desiredTypes = v5->__desiredTypes;
    v5->__desiredTypes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMRealtimeMetadataCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMRealtimeMetadataCommand *)self _desiredTypes];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (NSArray)_desiredTypes
{
  return self->__desiredTypes;
}

- (void).cxx_destruct
{
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentVideoDevice];
  if ([v5 isFaceDetectionSupported])
  {
    v29 = v5;
    uint64_t v6 = [v4 currentCaptureSession];
    v7 = [v4 currentMetadataOutput];
    objc_super v8 = [(CAMRealtimeMetadataCommand *)self _desiredTypes];
    int v9 = [v8 containsObject:&unk_26BDDE298];
    int v10 = [v7 isVideoPreviewHistogramMetadataSupported];
    if (v9 && v10) {
      [v7 setVideoPreviewHistogramMetadataObjectTypesAvailable:1];
    }
    int v11 = [v8 containsObject:&unk_26BDDE2B0];
    int v12 = [v7 isAppClipCodeMetadataSupported];
    if (v11 && v12) {
      [v7 setAppClipCodeMetadataObjectTypeAvailable:1];
    }
    int v13 = [v8 containsObject:&unk_26BDDE2C8];
    int v14 = [v7 isTextRegionMetadataSupported];
    if (v13 && v14)
    {
      [v7 setTextRegionMetadataObjectTypeAvailable:1];
    }
    else if (v13)
    {
      v16 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CAMRealtimeMetadataCommand executeWithContext:](v16);
      }
    }
    if (([v8 containsObject:&unk_26BDDE2E0] & 1) != 0
      || ([v8 containsObject:&unk_26BDDE2F8] & 1) != 0)
    {
      char v17 = 0;
    }
    else
    {
      char v17 = [v8 containsObject:&unk_26BDDE310] ^ 1;
    }
    int v18 = [v7 isHeadMetadataSupported];
    if ((v17 & 1) == 0 && v18) {
      [v7 setHeadMetadataObjectTypesAvailable:1];
    }
    v27 = [v7 availableMetadataObjectTypes];
    v19 = -[CAMRealtimeMetadataCommand _metadataObjectTypesForRealtimeMetadataTypes:withAvailableMetadataTypes:](self, "_metadataObjectTypesForRealtimeMetadataTypes:withAvailableMetadataTypes:", v8);
    v20 = [v7 metadataObjectTypes];
    v21 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v19];
    v22 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v20];
    char v23 = [v21 isEqual:v22];
    char v24 = [v6 isBeingConfigured];
    v28 = v6;
    if (v23 & 1) != 0 || (v24)
    {
      if (v23) {
        goto LABEL_28;
      }
    }
    else if (![v19 count])
    {
LABEL_28:
      uint64_t v25 = [v19 count];
      v26 = [v7 connectionWithMediaType:*MEMORY[0x263EF9D08]];
      if ((v25 != 0) != [v26 isEnabled]) {
        [v26 setEnabled:v25 != 0];
      }

      v15 = v28;
      uint64_t v5 = v29;
      goto LABEL_31;
    }
    [v7 setMetadataObjectTypes:v19];
    goto LABEL_28;
  }
  v15 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CAMFaceDrivenImageProcessingCommand executeWithContext:](v15);
  }
LABEL_31:
}

- (id)_metadataObjectTypesForRealtimeMetadataTypes:(id)a3 withAvailableMetadataTypes:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v14 = -[CAMRealtimeMetadataCommand _metadataObjectTypeForRealtimeMetadataType:](self, "_metadataObjectTypeForRealtimeMetadataType:", [v13 integerValue]);
        if (v14)
        {
          if ([v7 containsObject:v14])
          {
            [v18 addObject:v14];
          }
          else
          {
            v16 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v14;
              _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "Requested AVMetadataObjectType is unavailable: %{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
          v15 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            [(CAMRealtimeMetadataCommand *)v23 _metadataObjectTypesForRealtimeMetadataTypes:&v24 withAvailableMetadataTypes:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v10);
  }

  return v18;
}

- (CAMRealtimeMetadataCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMRealtimeMetadataCommand;
  uint64_t v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMRealtimeMetadataCommandTypes"];
    desiredTypes = v5->__desiredTypes;
    v5->__desiredTypes = (NSArray *)v6;

    id v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMRealtimeMetadataCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(CAMRealtimeMetadataCommand *)self _desiredTypes];
  [v4 encodeObject:v5 forKey:@"CAMRealtimeMetadataCommandTypes"];
}

- (id)_metadataObjectTypeForRealtimeMetadataType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_263FA32D0 + a3);
  }
  return v4;
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Text region metadata is unsupported", v1, 2u);
}

- (void)_metadataObjectTypesForRealtimeMetadataTypes:(uint64_t *)a3 withAvailableMetadataTypes:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = [a2 integerValue];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_2099F8000, a4, OS_LOG_TYPE_ERROR, "Did not find AVMetadataObjectType for CAMRealtimeMetadataType: %ld", a1, 0xCu);
}

@end