@interface CAMExternalStorage
- (AVExternalStorageDevice)_underlyingStorageDevice;
- (BOOL)connected;
- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4;
- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)notRecommendedForCaptureUse;
- (CAMCaptureGraphConfiguration)graphConfiguration;
- (CAMExternalStorage)initWithNoDevice;
- (CAMExternalStorage)initWithStorageDevice:(id)a3;
- (CAMPurgeableStorageContainerDelegate)delegate;
- (NSString)description;
- (NSString)displayName;
- (NSURL)_baseURL;
- (NSUUID)uniqueIdentifier;
- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3;
- (id)generateDestinationURLWithExtension:(id)a3;
- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3;
- (int64_t)totalFreeBytes;
- (void)setDelegate:(id)a3;
- (void)setGraphConfiguration:(id)a3;
- (void)totalFreeBytes;
@end

@implementation CAMExternalStorage

- (CAMExternalStorage)initWithStorageDevice:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMExternalStorage;
  v6 = [(CAMExternalStorage *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__underlyingStorageDevice, a3);
    uint64_t v8 = [v5 uuid];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v8;

    uint64_t v10 = [v5 displayName];
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v10;

    v7->_notRecommendedForCaptureUse = [v5 isNotRecommendedForCaptureUse];
    uint64_t v12 = [v5 baseURL];
    baseURL = v7->__baseURL;
    v7->__baseURL = (NSURL *)v12;
  }
  return v7;
}

- (CAMExternalStorage)initWithNoDevice
{
  v3.receiver = self;
  v3.super_class = (Class)CAMExternalStorage;
  return [(CAMExternalStorage *)&v3 init];
}

- (int64_t)totalFreeBytes
{
  objc_super v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(CAMExternalStorage *)self _baseURL];
  id v5 = [v4 path];
  id v12 = 0;
  v6 = [v3 attributesOfFileSystemForPath:v5 error:&v12];
  id v7 = v12;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v9 = [v6 objectForKey:*MEMORY[0x263F080C8]];
    int64_t v10 = [v9 longValue];
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(CAMExternalStorage *)self totalFreeBytes];
    }
    int64_t v10 = -1;
  }

  return v10;
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4
{
  return [(CAMExternalStorage *)self hasDiskSpaceToAllowCaptureWithConfiguration:a3 allowPurging:a4 verbose:0];
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5
{
  id v6 = a3;
  unint64_t v7 = [v6 mode];
  if (v7 > 8 || ((1 << v7) & 0x186) == 0)
  {
    BOOL v10 = [(CAMExternalStorage *)self totalFreeBytes] <= 104857600;
  }
  else
  {
    [(CAMExternalStorage *)self availableRecordingTimeInSecondsForGraphConfiguration:v6];
    BOOL v10 = v9 <= 2.0;
  }
  BOOL v11 = !v10;

  return v11;
}

- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 mode];
  double v6 = 0.0;
  if (v5 <= 8 && ((1 << v5) & 0x186) != 0)
  {
    BOOL v8 = +[CAMCaptureCapabilities capabilities];
    uint64_t v9 = [v8 bytesPerMinuteForGraphConfiguration:v4 outputToExternalStorage:1];

    if (v9) {
      double v6 = (double)[(CAMExternalStorage *)self totalFreeBytes] * 60.0 / (double)v9;
    }
  }

  return v6;
}

- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3
{
  return 0;
}

- (id)generateDestinationURLWithExtension:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(CAMExternalStorage *)self _underlyingStorageDevice];
    v18[0] = v4;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v15 = 0;
    unint64_t v7 = [v5 nextAvailableURLsWithPathExtensions:v6 error:&v15];
    id v8 = v15;

    if (v8 || ![v7 count])
    {
      uint64_t v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(CAMExternalStorage *)self generateDestinationURLWithExtension:v9];
      }

      BOOL v10 = 0;
    }
    else
    {
      BOOL v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v7 firstObject];
        v13 = [v12 path];
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "External storage: got destination url (%{public}@)", buf, 0xCu);
      }
      BOOL v10 = [v7 firstObject];
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CAMExternalStorage *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(CAMExternalStorage *)self _underlyingStorageDevice];

    if (v5)
    {
      double v6 = [(CAMExternalStorage *)self _underlyingStorageDevice];
      unint64_t v7 = [(CAMExternalStorage *)v4 _underlyingStorageDevice];
      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = self == v4;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v2 = NSString;
  objc_super v3 = [(CAMExternalStorage *)self displayName];
  id v4 = [v2 stringWithFormat:@"External storage: %@", v3];

  return (NSString *)v4;
}

- (BOOL)connected
{
  v2 = [(CAMExternalStorage *)self _underlyingStorageDevice];
  char v3 = [v2 isConnected];

  return v3;
}

- (CAMPurgeableStorageContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPurgeableStorageContainerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAMCaptureGraphConfiguration)graphConfiguration
{
  return self->_graphConfiguration;
}

- (void)setGraphConfiguration:(id)a3
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)notRecommendedForCaptureUse
{
  return self->_notRecommendedForCaptureUse;
}

- (AVExternalStorageDevice)_underlyingStorageDevice
{
  return self->__underlyingStorageDevice;
}

- (NSURL)_baseURL
{
  return self->__baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__baseURL, 0);
  objc_storeStrong((id *)&self->__underlyingStorageDevice, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_graphConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)totalFreeBytes
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a1 _baseURL];
  double v6 = [v5 path];
  int v7 = 138543618;
  BOOL v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "External storage: failed to retrieve free space from %{public}@ : (%{public}@)", (uint8_t *)&v7, 0x16u);
}

- (void)generateDestinationURLWithExtension:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v6 = [a1 description];
  int v7 = [a1 uniqueIdentifier];
  int v8 = 138543874;
  __int16 v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "External storage: unable to generate url for external storage device (%{public}@/%{public}@) with error (%{public}@)", (uint8_t *)&v8, 0x20u);
}

@end