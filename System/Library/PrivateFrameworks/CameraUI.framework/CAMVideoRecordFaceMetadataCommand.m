@interface CAMVideoRecordFaceMetadataCommand
- (BOOL)_isEnabled;
- (CAMVideoRecordFaceMetadataCommand)initWithCoder:(id)a3;
- (CAMVideoRecordFaceMetadataCommand)initWithEnabled:(BOOL)a3;
- (id)_connectionForMovieFileOutput:(id)a3 metadataPortType:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addMetadataConnectionForPortType:(id)a3 videoDeviceInput:(id)a4 movieFileOutput:(id)a5 captureSession:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoRecordFaceMetadataCommand

- (CAMVideoRecordFaceMetadataCommand)initWithEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  id v11 = [v4 currentMovieFileOutput];
  v5 = [v4 currentVideoDeviceInput];
  v6 = [v4 currentCaptureSession];

  if (v11 && v5 && v6)
  {
    uint64_t v7 = *MEMORY[0x263EF9E40];
    objc_super v8 = [(CAMVideoRecordFaceMetadataCommand *)self _connectionForMovieFileOutput:v11 metadataPortType:*MEMORY[0x263EF9E40]];
    BOOL v9 = [(CAMVideoRecordFaceMetadataCommand *)self _isEnabled];
    int v10 = [v8 isEnabled];
    if (v9 || !v8)
    {
      if (((!v9 | v10) & 1) == 0) {
        [(CAMVideoRecordFaceMetadataCommand *)self _addMetadataConnectionForPortType:v7 videoDeviceInput:v5 movieFileOutput:v11 captureSession:v6];
      }
    }
    else
    {
      [v6 removeConnection:v8];
    }
  }
}

- (CAMVideoRecordFaceMetadataCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMVideoRecordFaceMetadataCommandEnabled"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoRecordFaceMetadataCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMVideoRecordFaceMetadataCommandEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMVideoRecordFaceMetadataCommand *)self _isEnabled];
  return v4;
}

- (id)_connectionForMovieFileOutput:(id)a3 metadataPortType:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  [v5 connections];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  uint64_t v7 = 0;
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        int v10 = [v9 inputPorts];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = (const opaqueCMFormatDescription *)[*(id *)(*((void *)&v22 + 1) + 8 * j) formatDescription];
              if (v15)
              {
                v16 = v15;
                if (CMFormatDescriptionGetMediaType(v15) == 1835365473)
                {
                  if ([(__CFArray *)CMMetadataFormatDescriptionGetIdentifiers(v16) containsObject:v6])
                  {
                    id v17 = v9;

                    uint64_t v7 = v17;
                  }
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  return v7;
}

- (void)_addMetadataConnectionForPortType:(id)a3 videoDeviceInput:(id)a4 movieFileOutput:(id)a5 captureSession:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v23 = a6;
  uint64_t v11 = [a4 ports];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v17 = (const opaqueCMFormatDescription *)[v16 formatDescription];
        if (v17)
        {
          v18 = v17;
          if (CMFormatDescriptionGetMediaType(v17) == 1835365473)
          {
            if ([(__CFArray *)CMMetadataFormatDescriptionGetIdentifiers(v18) containsObject:v9])
            {
              v19 = (void *)MEMORY[0x263EFA560];
              long long v29 = v16;
              uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
              uint64_t v21 = [v19 connectionWithInputPorts:v20 output:v10];

              if (v21)
              {
                [v23 addConnection:v21];
              }
              else
              {
                long long v22 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2099F8000, v22, OS_LOG_TYPE_DEFAULT, "Unable to add metadata connection to our capture session, the connection is invalid.", buf, 2u);
                }
              }
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v13);
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end