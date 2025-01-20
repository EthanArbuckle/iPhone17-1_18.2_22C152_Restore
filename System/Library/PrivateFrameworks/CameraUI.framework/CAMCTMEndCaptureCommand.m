@interface CAMCTMEndCaptureCommand
- (CAMCTMEndCaptureCommand)initWithCoder:(id)a3;
- (CAMCTMEndCaptureCommand)initWithPersistenceUUID:(id)a3;
- (NSString)_persistenceUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMCTMEndCaptureCommand

- (CAMCTMEndCaptureCommand)initWithPersistenceUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMEndCaptureCommand;
  v5 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    persistenceUUID = v5->__persistenceUUID;
    v5->__persistenceUUID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (CAMCTMEndCaptureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMEndCaptureCommand;
  v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMCTMEndCaptureCommandPersistenceUUID"];
    persistenceUUID = v5->__persistenceUUID;
    v5->__persistenceUUID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCTMEndCaptureCommand *)self _persistenceUUID];
  [v4 encodeObject:v5 forKey:@"CAMCTMEndCaptureCommandPersistenceUUID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCTMEndCaptureCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMCTMEndCaptureCommand *)self _persistenceUUID];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CAMCTMEndCaptureCommand *)self _persistenceUUID];
  uint64_t v6 = [v4 currentStillImageOutput];
  id v7 = v5;
  objc_super v8 = [v4 cachedMomentCaptureSettingsForIdentifier:v7];
  [v4 clearCachedMomentCaptureSettingsForIdentifier:v7];
  v9 = [v4 currentVideoDevice];
  [v9 videoZoomFactor];
  double v11 = v10;

  [v4 registerVideoEndZoomFactor:v11];
  if (v8)
  {
    objc_msgSend(v6, "endMomentCaptureWithUniqueID:", objc_msgSend(v8, "uniqueID"));
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      uint64_t v14 = [v8 uniqueID];
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "captureID:%lld Called endMomentCaptureWithUniqueID:", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CAMCTMEndCaptureCommand executeWithContext:]((uint64_t)v7, v12);
    }
  }
}

- (NSString)_persistenceUUID
{
  return self->__persistenceUUID;
}

- (void).cxx_destruct
{
}

- (void)executeWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to find cached initiation settings for persistenceUUID %{public}@ in CAMCTMEndMomentCaptureCommand", (uint8_t *)&v2, 0xCu);
}

@end