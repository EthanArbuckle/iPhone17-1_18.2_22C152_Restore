@interface CAMCTMCancelMomentCaptureCommand
- (CAMCTMCancelMomentCaptureCommand)initWithCoder:(id)a3;
- (CAMCTMCancelMomentCaptureCommand)initWithPersistenceUUID:(id)a3;
- (NSString)_persistenceUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMCTMCancelMomentCaptureCommand

- (CAMCTMCancelMomentCaptureCommand)initWithPersistenceUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMCancelMomentCaptureCommand;
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

- (CAMCTMCancelMomentCaptureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMCancelMomentCaptureCommand;
  v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMCTMCancelCaptureCommandPersistenceUUID"];
    persistenceUUID = v5->__persistenceUUID;
    v5->__persistenceUUID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCTMCancelMomentCaptureCommand *)self _persistenceUUID];
  [v4 encodeObject:v5 forKey:@"CAMCTMCancelCaptureCommandPersistenceUUID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCTMCancelMomentCaptureCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMCTMCancelMomentCaptureCommand *)self _persistenceUUID];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CAMCTMCancelMomentCaptureCommand *)self _persistenceUUID];
  uint64_t v6 = [v4 currentStillImageOutput];
  id v7 = v5;
  objc_super v8 = [v4 cachedMomentCaptureSettingsForIdentifier:v7];
  [v4 clearCachedMomentCaptureSettingsForIdentifier:v7];

  if (v8)
  {
    objc_msgSend(v6, "cancelMomentCaptureWithUniqueID:", objc_msgSend(v8, "uniqueID"));
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = [v8 uniqueID];
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "captureID:%lld Called cancelMomentCaptureWithUniqueID:", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAMCTMCancelMomentCaptureCommand executeWithContext:]((uint64_t)v7, v9);
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
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to find cached initiation settings for persistenceUUID %{public}@ in CAMCTMCancelMomentCaptureCommand", (uint8_t *)&v2, 0xCu);
}

@end