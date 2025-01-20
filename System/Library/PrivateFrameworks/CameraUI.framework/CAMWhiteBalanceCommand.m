@interface CAMWhiteBalanceCommand
- (BOOL)_matchExposureMode;
- (CAMWhiteBalanceCommand)initWithCoder:(id)a3;
- (CAMWhiteBalanceCommand)initWithMatchExposureMode;
- (CAMWhiteBalanceCommand)initWithWhiteBalanceMode:(int64_t)a3;
- (id)_descriptionForWhiteBalanceMode:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_whiteBalanceMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMWhiteBalanceCommand

- (CAMWhiteBalanceCommand)initWithMatchExposureMode
{
  v6.receiver = self;
  v6.super_class = (Class)CAMWhiteBalanceCommand;
  v2 = [(CAMCaptureCommand *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->__matchExposureMode = 1;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMWhiteBalanceCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[4] = [(CAMWhiteBalanceCommand *)self _whiteBalanceMode];
  *((unsigned char *)v4 + 24) = [(CAMWhiteBalanceCommand *)self _matchExposureMode];
  return v4;
}

- (int64_t)_whiteBalanceMode
{
  return self->__whiteBalanceMode;
}

- (BOOL)_matchExposureMode
{
  return self->__matchExposureMode;
}

- (CAMWhiteBalanceCommand)initWithWhiteBalanceMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMWhiteBalanceCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__whiteBalanceMode = a3;
    objc_super v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = [a3 currentVideoDevice];
  int64_t v5 = +[CAMCaptureConversions captureWhiteBalanceModeForWhiteBalanceMode:2];
  if ([(CAMWhiteBalanceCommand *)self _matchExposureMode])
  {
    unint64_t v6 = [v4 exposureMode];
    if (v6 < 4) {
      int64_t v5 = qword_209C7B5D0[v6];
    }
  }
  else
  {
    int64_t v5 = +[CAMCaptureConversions captureWhiteBalanceModeForWhiteBalanceMode:[(CAMWhiteBalanceCommand *)self _whiteBalanceMode]];
  }
  if ([v4 isWhiteBalanceModeSupported:v5])
  {
    uint64_t v7 = v5;
LABEL_7:
    objc_super v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(CAMWhiteBalanceCommand *)self executeWithContext:v8];
    }

    [v4 setWhiteBalanceMode:v7];
  }
  else
  {
    while (1)
    {
      uint64_t v7 = 2 * (v5 != 1);
      v9 = os_log_create("com.apple.camera", "Camera");
      v10 = v9;
      if (v7 == v5) {
        break;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = [(CAMWhiteBalanceCommand *)self _descriptionForWhiteBalanceMode:v7];
        v12 = [(CAMWhiteBalanceCommand *)self _descriptionForWhiteBalanceMode:v5];
        *(_DWORD *)buf = 138543874;
        v15 = v11;
        __int16 v16 = 2114;
        v17 = v12;
        __int16 v18 = 2114;
        v19 = v4;
        _os_log_debug_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEBUG, "Falling back to %{public}@ because %{public}@ isn't supported by %{public}@", buf, 0x20u);
      }
      int64_t v5 = v7;
      if ([v4 isWhiteBalanceModeSupported:v7]) {
        goto LABEL_7;
      }
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(CAMWhiteBalanceCommand *)self _descriptionForWhiteBalanceMode:v5];
      *(_DWORD *)buf = 138543618;
      v15 = v13;
      __int16 v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Failed to set white balance mode %{public}@, as it is not supported by %{public}@", buf, 0x16u);
    }
  }
}

- (CAMWhiteBalanceCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMWhiteBalanceCommand;
  int64_t v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->__whiteBalanceMode = [v4 decodeIntegerForKey:@"CAMWhiteBalanceCommandWhiteBalance"];
    v5->__matchExposureMode = [v4 decodeBoolForKey:@"CAMWhiteBalanceCommandMatchExposureMode"];
    unint64_t v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMWhiteBalanceCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMWhiteBalanceCommand _whiteBalanceMode](self, "_whiteBalanceMode", v5.receiver, v5.super_class), @"CAMWhiteBalanceCommandWhiteBalance");
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMWhiteBalanceCommand _matchExposureMode](self, "_matchExposureMode"), @"CAMWhiteBalanceCommandMatchExposureMode");
}

- (id)_descriptionForWhiteBalanceMode:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_263FA4F70[a3];
  }
}

- (void)executeWithContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = [a1 _descriptionForWhiteBalanceMode:a2];
  int v5 = 138543362;
  unint64_t v6 = v4;
  _os_log_debug_impl(&dword_2099F8000, a3, OS_LOG_TYPE_DEBUG, "Applying white balance mode %{public}@", (uint8_t *)&v5, 0xCu);
}

@end