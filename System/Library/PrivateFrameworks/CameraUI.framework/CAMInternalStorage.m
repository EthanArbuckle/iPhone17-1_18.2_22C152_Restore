@interface CAMInternalStorage
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_cachedEstimatedSpace;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:(SEL)a3 minimumDiskUsageThreshold:(int64_t)a4;
- (BOOL)_isLockScreenExtension;
- (BOOL)_purging;
- (BOOL)_shouldCancelNextPurge;
- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4;
- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5;
- (BOOL)hasPurgeableResources;
- (BOOL)isCancelingPurge;
- (CAMCaptureGraphConfiguration)graphConfiguration;
- (CAMInternalStorage)init;
- (CAMPurgeableStorageContainerDelegate)delegate;
- (CacheDeleteToken)_queryQueue_currentToken;
- (NSByteCountFormatter)_byteFormatter;
- (NSDate)_lastPurgeRequestUpdateTime;
- (NSURL)_storageMountPoint;
- (OS_dispatch_queue)_cacheDeleteQueryQueue;
- (double)_availableRecordingTimeInMinutesForFreeBytes:(int64_t)a3 minimumDiskUsageThreshold:(int64_t)a4 bytesPerMinute:(int64_t)a5;
- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3;
- (id)_cacheDeleteVolume;
- (id)_stringFromAvailableSpace:(id *)a3;
- (id)_stringFromByteCount:(int64_t)a3;
- (int64_t)_absoluteMinimumBytesForMode:(int64_t)a3;
- (int64_t)_cachedLowDiskThreshold;
- (int64_t)_fastPurgeThreshold;
- (int64_t)_fastPurgeThresholdForRequestType:(int64_t)a3;
- (int64_t)_preferredMinimumBytesForConfiguration:(id)a3;
- (int64_t)_proResMinimumDiskUsageThreshold;
- (int64_t)_requestTypeFromNonZeroFastPurgeThreshold:(int64_t)a3;
- (int64_t)_resourceValueForKey:(id)a3;
- (int64_t)_totalBytes;
- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3;
- (int64_t)totalFreeBytes;
- (void)_copyAndApplyByteStringFormattingFromDictionary:(id)a3 toDictionary:(id)a4 keys:(id)a5;
- (void)_copyFromDictionary:(id)a3 toDictionary:(id)a4 keys:(id)a5;
- (void)_legacyDiskSpaceDidBecomeLowNotification;
- (void)_loadFreeDiskThresholds;
- (void)_notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason:(id)a3 analyticsEvent:(id)a4;
- (void)_purgeFastPurgeableSpaceWithThreshold:(int64_t)a3 calledFromPurgeCompletion:(BOOL)a4 forceStopReason:(id)a5 analyticsEvent:(id)a6;
- (void)_queryQueue_aggregateLowDiskEventWithIdentifier:(id)a3;
- (void)_queryQueue_cancelCurrentPurge;
- (void)_queryQueue_purgeFastPurgeableResourcesWithThreshold:(int64_t)a3 analyticsEvent:(id)a4;
- (void)_queryQueue_updatePurgeRequestStateForTotalFreeBytes:(int64_t)a3 preferredFreeBytes:(int64_t)a4;
- (void)_setCachedEstimatedSpace:(id *)a3;
- (void)_setFastPurgeThreshold:(int64_t)a3;
- (void)_setProResMinimumDiskUsageThreshold:(int64_t)a3;
- (void)_setPurging:(BOOL)a3;
- (void)_setShouldCancelNextPurge:(BOOL)a3;
- (void)_statMountPoint:(statfs *)a3;
- (void)_updateAvailablePurgeableSpaceAsync;
- (void)_updatePurgeRequestStateForConfiguration:(id)a3 totalFreeBytes:(int64_t)a4;
- (void)cancelPurge;
- (void)purgeFastPurgeableSpaceWithRequestType:(int64_t)a3;
- (void)reportLowDiskEventWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGraphConfiguration:(id)a3;
- (void)set_cachedLowDiskThreshold:(int64_t)a3;
- (void)set_lastPurgeRequestUpdateTime:(id)a3;
- (void)set_queryQueue_currentToken:(CacheDeleteToken *)a3;
- (void)set_storageMountPoint:(id)a3;
@end

@implementation CAMInternalStorage

- (CAMInternalStorage)init
{
  v16.receiver = self;
  v16.super_class = (Class)CAMInternalStorage;
  v2 = [(CAMInternalStorage *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.cachedelete", v3);
    cacheDeleteQueryQueue = v2->__cacheDeleteQueryQueue;
    v2->__cacheDeleteQueryQueue = (OS_dispatch_queue *)v4;

    v2->__cachedLowDiskThreshold = 0;
    v2->fastPurgeableBytes = 0;
    v2->slowPurgeableBytes = 0;
    v2->freeBytes = 0;
    v6 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x263F086F0]);
    byteFormatter = v2->__byteFormatter;
    v2->__byteFormatter = v6;

    [(NSByteCountFormatter *)v2->__byteFormatter setAllowedUnits:8];
    [(NSByteCountFormatter *)v2->__byteFormatter setCountStyle:3];
    [(NSByteCountFormatter *)v2->__byteFormatter setIncludesActualByteCount:0];
    v8 = NSURL;
    v9 = NSHomeDirectory();
    uint64_t v10 = [v8 URLWithString:v9];
    storageMountPoint = v2->__storageMountPoint;
    v2->__storageMountPoint = (NSURL *)v10;

    v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 bundleIdentifier];

    v2->__isLockScreenExtension = [v13 isEqualToString:@"com.apple.camera.lockscreen"];
    [(CAMInternalStorage *)v2 _loadFreeDiskThresholds];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v2 selector:sel__legacyDiskSpaceDidBecomeLowNotification name:*MEMORY[0x263F5DBA0] object:0];
  }
  return v2;
}

- (void)_setPurging:(BOOL)a3
{
  if (self->__purging != a3)
  {
    self->__purging = a3;
    id v4 = [(CAMInternalStorage *)self delegate];
    [v4 storageControllerDidChangePurgingState:self];
  }
}

- (BOOL)isCancelingPurge
{
  BOOL v3 = [(CAMInternalStorage *)self isPurging];
  if (v3)
  {
    LOBYTE(v3) = [(CAMInternalStorage *)self _shouldCancelNextPurge];
  }
  return v3;
}

- (void)_setShouldCancelNextPurge:(BOOL)a3
{
  if (self->__shouldCancelNextPurge != a3)
  {
    self->__shouldCancelNextPurge = a3;
    id v4 = [(CAMInternalStorage *)self delegate];
    [v4 storageControllerDidChangePurgingState:self];
  }
}

- (void)_setCachedEstimatedSpace:(id *)a3
{
  [(CAMInternalStorage *)self _cachedEstimatedSpace];
  if (v8[5] != a3->var0 || v8[6] != a3->var1 || v8[7] != a3->var2)
  {
    long long v7 = *(_OWORD *)&a3->var0;
    self->slowPurgeableBytes = a3->var2;
    *(_OWORD *)&self->freeBytes = v7;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__CAMInternalStorage__setCachedEstimatedSpace___block_invoke;
    v8[3] = &unk_263FA0208;
    v8[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

void __47__CAMInternalStorage__setCachedEstimatedSpace___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 availableDiskSpaceChanged:*(void *)(a1 + 32)];
}

- (void)setGraphConfiguration:(id)a3
{
  v5 = (CAMCaptureGraphConfiguration *)a3;
  p_graphConfiguration = &self->_graphConfiguration;
  if (self->_graphConfiguration != v5)
  {
    long long v7 = v5;
    objc_storeStrong((id *)p_graphConfiguration, a3);
    p_graphConfiguration = (CAMCaptureGraphConfiguration **)[(CAMInternalStorage *)self _updateAvailablePurgeableSpaceAsync];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_graphConfiguration, v5);
}

- (void)_setFastPurgeThreshold:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->__fastPurgeThreshold != a3)
  {
    self->__fastPurgeThreshold = a3;
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 2) {
        v5 = 0;
      }
      else {
        v5 = off_263FA6BE8[a3];
      }
      int v6 = 138543362;
      long long v7 = v5;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "CAMStorageController: changed fast purge threshold to %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4
{
  return [(CAMInternalStorage *)self hasDiskSpaceToAllowCaptureWithConfiguration:a3 allowPurging:a4 verbose:0];
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [(CAMInternalStorage *)self totalFreeBytes];
  int64_t v10 = -[CAMInternalStorage _absoluteMinimumBytesForMode:](self, "_absoluteMinimumBytesForMode:", [v8 mode]);
  int64_t v11 = [(CAMInternalStorage *)self minimumDiskUsageThresholdInBytesForGraphConfiguration:v8];
  if (v10 <= v11) {
    int64_t v10 = v11;
  }
  if (v9 <= v10)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(CAMInternalStorage *)self _stringFromByteCount:v9];
      v14 = [(CAMInternalStorage *)self _stringFromByteCount:v10];
      int v17 = 138543618;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      v15 = "CAMStorageController: Total free disk %{public}@ lower than absolute minimum for this mode (%{public}@)";
      goto LABEL_12;
    }
  }
  else if (v9 >= 2 * v10)
  {
    if (!v5) {
      goto LABEL_14;
    }
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(CAMInternalStorage *)self _stringFromByteCount:v9];
      v14 = [(CAMInternalStorage *)self _stringFromByteCount:v10];
      int v17 = 138543618;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      v15 = "CAMStorageController: Total free disk (%{public}@) exceeds absolute minimum for this mode (%{public}@)";
      goto LABEL_12;
    }
  }
  else
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(CAMInternalStorage *)self _stringFromByteCount:v9];
      v14 = [(CAMInternalStorage *)self _stringFromByteCount:v10];
      int v17 = 138543618;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      v15 = "CAMStorageController: Total free disk (%{public}@) approaching absolute minimum for this mode (%{public}@)";
LABEL_12:
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0x16u);
    }
  }

LABEL_14:
  if (v6) {
    [(CAMInternalStorage *)self _updatePurgeRequestStateForConfiguration:v8 totalFreeBytes:v9];
  }

  return v9 > v10;
}

- (void)reportLowDiskEventWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CAMCaptureCapabilities capabilities];
  unint64_t v6 = [v5 hostProcess];
  if (v6 <= 4 && ((1 << v6) & 0x15) != 0)
  {
    id v8 = +[CAMUserPreferences preferences];
    uint64_t v9 = [v8 preferredMinimumFreeBytes];
    if ([v5 isInternalInstall]) {
      BOOL v10 = v9 <= 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      objc_initWeak(&location, self);
      int64_t v11 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__CAMInternalStorage_reportLowDiskEventWithIdentifier___block_invoke;
      block[3] = &unk_263FA0868;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      dispatch_async(v11, block);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __55__CAMInternalStorage_reportLowDiskEventWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queryQueue_aggregateLowDiskEventWithIdentifier:", *(void *)(a1 + 32));
}

- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 mode];
  if (v5 > 8 || ((1 << v5) & 0x186) == 0)
  {
    double v13 = 0.0;
  }
  else
  {
    long long v7 = +[CAMCaptureCapabilities capabilities];
    uint64_t v8 = [v7 bytesPerMinuteForGraphConfiguration:v4 outputToExternalStorage:0];
    if (v8)
    {
      uint64_t v9 = v8;
      int64_t v10 = [(CAMInternalStorage *)self totalFreeBytes];
      int64_t v11 = [(CAMInternalStorage *)self minimumDiskUsageThresholdInBytesForGraphConfiguration:v4];
      double v12 = (double)(v10 - v11) * 60.0;
      if (v10 <= v11) {
        double v12 = 0.0;
      }
      double v13 = v12 / (double)v9;
    }
    else
    {
      double v13 = 0.0;
    }
  }
  return v13;
}

- (double)_availableRecordingTimeInMinutesForFreeBytes:(int64_t)a3 minimumDiskUsageThreshold:(int64_t)a4 bytesPerMinute:(int64_t)a5
{
  if (a5 < 1) {
    return 0.0;
  }
  else {
    return (double)(a3 - a4) / (double)a5;
  }
}

- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = -[CAMInternalStorage _absoluteMinimumBytesForMode:](self, "_absoluteMinimumBytesForMode:", [v4 mode]);
  uint64_t v6 = [v4 videoEncodingBehavior];

  if (v6 != 2) {
    return v5;
  }
  long long v7 = +[CAMCaptureCapabilities capabilities];
  if (![(CAMInternalStorage *)self _proResMinimumDiskUsageThreshold])
  {
    double v8 = (double)[(CAMInternalStorage *)self _totalBytes];
    uint64_t v9 = (uint64_t)(v8 * 0.1);
    if ([v7 proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace])
    {
      int64_t v10 = [(CAMInternalStorage *)self totalFreeBytes];
      uint64_t v11 = v10 + ([v7 proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace] << 20);
      double v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v18 = 134218240;
        *(void *)&v18[4] = v11;
        *(_WORD *)&v18[12] = 2048;
        *(void *)&v18[14] = (uint64_t)(v8 * 0.1);
        double v13 = "CAMStorageController: overriding ProRes minimum disk usage threshold to be %lld (used relative override). Default is %lld";
LABEL_9:
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, v13, v18, 0x16u);
      }
    }
    else
    {
      [v7 proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal];
      if (v14 == 0.0)
      {
LABEL_11:
        -[CAMInternalStorage _setProResMinimumDiskUsageThreshold:](self, "_setProResMinimumDiskUsageThreshold:", v9, *(_OWORD *)v18, *(void *)&v18[16], v19);
        goto LABEL_12;
      }
      [v7 proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal];
      uint64_t v11 = (uint64_t)(v15 * v8);
      double v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v18 = 134218240;
        *(void *)&v18[4] = v11;
        *(_WORD *)&v18[12] = 2048;
        *(void *)&v18[14] = (uint64_t)(v8 * 0.1);
        double v13 = "CAMStorageController: overriding ProRes minimum disk usage threshold to be %lld (used fraction override). Default is %lld";
        goto LABEL_9;
      }
    }

    uint64_t v9 = v11;
    goto LABEL_11;
  }
LABEL_12:
  int64_t v16 = [(CAMInternalStorage *)self _proResMinimumDiskUsageThreshold];
  if (v5 <= v16) {
    int64_t v5 = v16;
  }

  return v5;
}

- (void)_updateAvailablePurgeableSpaceAsync
{
  BOOL v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isCacheDeleteSupported];

  if (v4)
  {
    int64_t v5 = +[CAMCaptureCapabilities capabilities];
    uint64_t v6 = [(CAMInternalStorage *)self graphConfiguration];
    long long v7 = (void *)[v5 bytesPerMinuteForGraphConfiguration:v6 outputToExternalStorage:0];

    double v8 = [(CAMInternalStorage *)self graphConfiguration];
    uint64_t v9 = [(CAMInternalStorage *)self minimumDiskUsageThresholdInBytesForGraphConfiguration:v8];

    objc_initWeak(&location, self);
    int64_t v10 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__CAMInternalStorage__updateAvailablePurgeableSpaceAsync__block_invoke;
    v11[3] = &unk_263FA21F8;
    objc_copyWeak(v12, &location);
    v12[1] = v7;
    v12[2] = v9;
    dispatch_async(v10, v11);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __57__CAMInternalStorage__updateAvailablePurgeableSpaceAsync__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:minimumDiskUsageThreshold:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (int64_t)_fastPurgeThresholdForRequestType:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

- (int64_t)_requestTypeFromNonZeroFastPurgeThreshold:(int64_t)a3
{
  return a3 == 2;
}

- (void)purgeFastPurgeableSpaceWithRequestType:(int64_t)a3
{
  int64_t v4 = [(CAMInternalStorage *)self _fastPurgeThresholdForRequestType:a3];
  [(CAMInternalStorage *)self _purgeFastPurgeableSpaceWithThreshold:v4 calledFromPurgeCompletion:0 forceStopReason:0 analyticsEvent:0];
}

- (void)_purgeFastPurgeableSpaceWithThreshold:(int64_t)a3 calledFromPurgeCompletion:(BOOL)a4 forceStopReason:(id)a5 analyticsEvent:(id)a6
{
  BOOL v7 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a5;
  uint64_t v11 = (CAMAnalyticsProResPurgeEvent *)a6;
  double v12 = +[CAMCaptureCapabilities capabilities];
  int v13 = [v12 isCacheDeleteSupported];

  if (v13)
  {
    if (a3 && !v11)
    {
      int64_t v14 = [(CAMInternalStorage *)self _requestTypeFromNonZeroFastPurgeThreshold:a3];
      double v15 = [CAMAnalyticsProResPurgeEvent alloc];
      int64_t v16 = [(CAMInternalStorage *)self graphConfiguration];
      uint64_t v11 = [(CAMAnalyticsProResPurgeEvent *)v15 initWithRequestType:v14 graphConfiguration:v16 totalBytesInSystem:[(CAMInternalStorage *)self _totalBytes]];
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke;
    aBlock[3] = &unk_263FA0868;
    objc_copyWeak(&v38, &location);
    int v17 = v11;
    v37 = v17;
    v18 = (void (**)(void))_Block_copy(aBlock);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2;
    v34[3] = &unk_263FA0408;
    v34[4] = self;
    uint64_t v11 = v17;
    v35 = v11;
    uint64_t v19 = (void (**)(void))_Block_copy(v34);
    if (v7 && [(CAMInternalStorage *)self _shouldCancelNextPurge])
    {
      [(CAMAnalyticsProResPurgeEvent *)v11 updateForCancelRequest];
      v20 = @"honoring cancelation";
LABEL_29:
      v28 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v20;
        _os_log_impl(&dword_2099F8000, v28, OS_LOG_TYPE_DEFAULT, "CAMStorageController: stopping purge (%{public}@)", buf, 0xCu);
      }

      v18[2](v18);
LABEL_36:

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
      goto LABEL_37;
    }
    if (v10)
    {
      v20 = (__CFString *)v10;
      if (v7) {
        goto LABEL_29;
      }
    }
    else if ([(CAMInternalStorage *)self hasPurgeableResources])
    {
      if (a3)
      {
        if (a3 != 1
          || ([(CAMInternalStorage *)self graphConfiguration],
              uint64_t v21 = objc_claimAutoreleasedReturnValue(),
              [(CAMInternalStorage *)self availableRecordingTimeInSecondsForGraphConfiguration:v21], double v23 = v22, v21, v23 < 300.0))
        {
          v24 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = @"ProResAutoPurgeRecordTime";
            if (a3 != 1) {
              v25 = 0;
            }
            if (a3 == 2) {
              v25 = @"Infinite";
            }
            v26 = v25;
            *(_DWORD *)buf = 138543362;
            v41 = v26;
            _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Kicking off a fast purge (threshold: %{public}@)", buf, 0xCu);
          }
          [(CAMInternalStorage *)self _setPurging:1];
          [(CAMInternalStorage *)self _setFastPurgeThreshold:a3];
          [(CAMInternalStorage *)self _setShouldCancelNextPurge:0];
          v27 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_20;
          block[3] = &unk_263FA6B28;
          objc_copyWeak(v33, &location);
          v33[1] = (id)a3;
          v31 = v11;
          v32 = v18;
          dispatch_async(v27, block);

          objc_destroyWeak(v33);
          v20 = 0;
          goto LABEL_36;
        }
        if (v7)
        {
          v20 = @"above auto purge threshold";
          goto LABEL_29;
        }
        v19[2](v19);
        v20 = @"above auto purge threshold";
      }
      else
      {
        v20 = @"zero threshold";
        if (v7) {
          goto LABEL_29;
        }
      }
    }
    else
    {
      if (v7)
      {
        v20 = @"no purgeable resources";
        goto LABEL_29;
      }
      v19[2](v19);
      v20 = @"no purgeable resources";
    }
    v29 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v20;
      _os_log_impl(&dword_2099F8000, v29, OS_LOG_TYPE_DEFAULT, "CAMStorageController: ignoring purge request (%{public}@)", buf, 0xCu);
    }

    goto LABEL_36;
  }
LABEL_37:
}

void __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setPurging:0];
  [WeakRetained _setShouldCancelNextPurge:0];
  [WeakRetained _setFastPurgeThreshold:0];
  [*(id *)(a1 + 32) publish];
}

uint64_t __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 _cachedEstimatedSpace];
    BOOL v3 = *(void **)(a1 + 32);
  }
  else
  {
    BOOL v3 = 0;
  }
  int64_t v4 = [v3 graphConfiguration];
  [v3 availableRecordingTimeInSecondsForGraphConfiguration:v4];
  double v6 = v5;

  objc_msgSend(*(id *)(a1 + 40), "updateForSkippedPurgeOperationWithFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:", objc_msgSend(*(id *)(a1 + 32), "totalFreeBytes"), 0, 0, v6);
  return [*(id *)(a1 + 40) publish];
}

void __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queryQueue_purgeFastPurgeableResourcesWithThreshold:analyticsEvent:", *(void *)(a1 + 56), *(void *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "_queryQueue_currentToken"))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2_21;
    block[3] = &unk_263FA3140;
    id v4 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2_21(uint64_t a1)
{
  id v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Did not successfully purge, resetting state", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasPurgeableResources
{
  BOOL v3 = +[CAMCaptureCapabilities capabilities];
  id v4 = [(CAMInternalStorage *)self graphConfiguration];
  uint64_t v5 = [v3 bytesPerMinuteForGraphConfiguration:v4 outputToExternalStorage:0];

  [(CAMInternalStorage *)self _cachedEstimatedSpace];
  return 10 * (v5 / 60) < 0;
}

- (void)cancelPurge
{
  if ([(CAMInternalStorage *)self _purging])
  {
    BOOL v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Requesting to cancel purge", (uint8_t *)buf, 2u);
    }

    [(CAMInternalStorage *)self _setShouldCancelNextPurge:1];
    objc_initWeak(buf, self);
    id v4 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__CAMInternalStorage_cancelPurge__block_invoke;
    block[3] = &unk_263FA0E00;
    objc_copyWeak(&v6, buf);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __33__CAMInternalStorage_cancelPurge__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryQueue_cancelCurrentPurge");
}

- (void)_queryQueue_purgeFastPurgeableResourcesWithThreshold:(int64_t)a3 analyticsEvent:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
  dispatch_assert_queue_V2(v7);

  if ([(CAMInternalStorage *)self _queryQueue_currentToken])
  {
    double v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "CAMStorageController: Ignoring request to purge since we have an active token";
      id v10 = v8;
      uint32_t v11 = 2;
LABEL_4:
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    if (!a3)
    {
      double v8 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = @"Zero";
      uint64_t v9 = "CAMStorageController: Ignoring request to purge, threshold set to %{public}@";
      id v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_4;
    }
    double v8 = [(CAMInternalStorage *)self _cacheDeleteVolume];
    if (v8)
    {
      double v12 = +[CAMCaptureCapabilities capabilities];
      int v13 = [(CAMInternalStorage *)self graphConfiguration];
      uint64_t v14 = [v12 bytesPerMinuteForGraphConfiguration:v13 outputToExternalStorage:0];

      double v15 = [(CAMInternalStorage *)self graphConfiguration];
      int64_t v16 = [(CAMInternalStorage *)self minimumDiskUsageThresholdInBytesForGraphConfiguration:v15];

      memset(buf, 0, sizeof(buf));
      uint64_t v44 = 0;
      [(CAMInternalStorage *)self _queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:v14 minimumDiskUsageThreshold:v16];
      if (10 * (v14 / 60) >= 0)
      {
        double v23 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 134217984;
          id v42 = *(id *)&buf[8];
          _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "CAMStorageController ignoring request to purge space since there is only %lld of fast purgeable space available", v41, 0xCu);
        }
      }
      else
      {
        uint64_t v17 = *(void *)buf;
        if (v14 <= v16 + 10 * (v14 / 60) - *(void *)buf) {
          uint64_t v18 = v16 + 10 * (v14 / 60) - *(void *)buf;
        }
        else {
          uint64_t v18 = v14;
        }
        v40[0] = v8;
        v39[0] = @"CACHE_DELETE_VOLUME";
        v39[1] = @"CACHE_DELETE_AMOUNT";
        uint64_t v19 = [NSNumber numberWithLongLong:v18];
        v40[1] = v19;
        v39[2] = @"CACHE_DELETE_URGENCY_LIMIT";
        v20 = NSNumber;
        uint64_t v21 = +[CAMCaptureCapabilities capabilities];
        double v22 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "cacheDeleteUrgency"));
        v39[3] = @"CACHE_DELETE_SERVICES";
        v40[2] = v22;
        v40[3] = &unk_26BDE0508;
        double v23 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];

        id v24 = [v23 mutableCopy];
        [(CAMInternalStorage *)self _copyAndApplyByteStringFormattingFromDictionary:v23 toDictionary:v24 keys:&unk_26BDE0520];
        v25 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 138543362;
          id v42 = v24;
          _os_log_impl(&dword_2099F8000, v25, OS_LOG_TYPE_DEFAULT, "CAMStorageController fast purge request: %{public}@", v41, 0xCu);
        }

        [(CAMInternalStorage *)self _availableRecordingTimeInMinutesForFreeBytes:v17 minimumDiskUsageThreshold:v16 bytesPerMinute:v14];
        [v6 updateBeforePurgeOperationWithFreeBytes:v17 fastPurgeableBytes:*(void *)&buf[8] slowPurgeableBytes:v44 maxRecordingTimeSeconds:v26 * 60.0];
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke;
        aBlock[3] = &unk_263FA6B78;
        CFAbsoluteTime v32 = Current;
        void aBlock[4] = self;
        uint64_t v33 = v14;
        int64_t v34 = v16;
        long long v35 = *(_OWORD *)buf;
        uint64_t v36 = v44;
        uint64_t v37 = v29;
        uint64_t v38 = 10 * (v14 / 60);
        id v31 = v6;
        v28 = _Block_copy(aBlock);
        [(CAMInternalStorage *)self set_queryQueue_currentToken:CacheDeletePurgeSpaceWithInfo()];
      }
    }
  }
LABEL_19:
}

void __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke(uint64_t a1, void *a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = *(double *)(a1 + 48);
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) totalFreeBytes];
  objc_initWeak(&location, *(id *)(a1 + 32));
  double v8 = [*(id *)(a1 + 32) _cacheDeleteQueryQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_2;
  v11[3] = &unk_263FA6B50;
  objc_copyWeak(&v14, &location);
  long long v15 = *(_OWORD *)(a1 + 56);
  uint64_t v16 = v7;
  uint64_t v9 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  double v17 = Current - v5;
  long long v18 = *(_OWORD *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 88);
  long long v20 = *(_OWORD *)(a1 + 96);
  id v13 = v9;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  BOOL v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:minimumDiskUsageThreshold:", *(void *)(a1 + 64), *(void *)(a1 + 72));
    BOOL v3 = *(void **)(a1 + 32);
  }
  [v3 _availableRecordingTimeInMinutesForFreeBytes:*(void *)(a1 + 80) minimumDiskUsageThreshold:*(void *)(a1 + 72) bytesPerMinute:*(void *)(a1 + 64)];
  uint64_t v5 = v4;
  id v6 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [*(id *)(a1 + 32) _copyAndApplyByteStringFormattingFromDictionary:*(void *)(a1 + 40) toDictionary:v6 keys:&unk_26BDE0538];
  uint64_t v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 88);
    uint64_t v9 = *(void **)(a1 + 32);
    *(_OWORD *)buf = v25;
    *(void *)&uint8_t buf[16] = v26;
    id v10 = [v9 _stringFromAvailableSpace:buf];
    uint32_t v11 = [*(id *)(a1 + 32) _stringFromByteCount:*(void *)(a1 + 80)];
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v28 = v10;
    __int16 v29 = 2114;
    v30 = v11;
    __int16 v31 = 2048;
    uint64_t v32 = v5;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Purge completed (%.3f seconds) with results: %{public}@\n%{public}@\n%{public}@ free\nAvailable time: %.2f minutes", buf, 0x34u);
  }
  id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v13 = [v12 longLongValue];

  uint64_t v14 = *(void *)(a1 + 104) - v13;
  uint64_t v15 = v25;
  uint64_t v16 = v26;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_54;
  block[3] = &unk_263FA53D0;
  void block[4] = *(void *)(a1 + 32);
  block[5] = v25;
  block[6] = v14;
  block[7] = v26;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v17 = *(void *)(a1 + 120);
  uint64_t v18 = *(void *)(a1 + 128);
  [*(id *)(a1 + 32) _availableRecordingTimeInMinutesForFreeBytes:v15 minimumDiskUsageThreshold:*(void *)(a1 + 72) bytesPerMinute:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) updateAfterPurgeOperationWithFreeBytes:v15 fastPurgeableBytes:v14 slowPurgeableBytes:v16 maxRecordingTimeSeconds:v13 bytesPurged:v19 * 60.0];
  long long v20 = (const void *)objc_msgSend(WeakRetained, "_queryQueue_currentToken");
  if (v20) {
    CFRelease(v20);
  }
  uint64_t v21 = @"not enough purgeable space remaining";
  if (v14 >= v18) {
    uint64_t v21 = 0;
  }
  if (v13 < v18 && v13 < v17) {
    double v23 = @"did not make significant progress";
  }
  else {
    double v23 = v21;
  }
  objc_msgSend(WeakRetained, "set_queryQueue_currentToken:", 0);
  [WeakRetained _notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason:v23 analyticsEvent:*(void *)(a1 + 48)];
}

uint64_t __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_54(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  return [*(id *)(a1 + 32) _setCachedEstimatedSpace:&v2];
}

- (void)_queryQueue_cancelCurrentPurge
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CAMInternalStorage *)self _queryQueue_currentToken];
  uint64_t v5 = os_log_create("com.apple.camera", "Camera");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 138543362;
      uint64_t v8 = [(CAMInternalStorage *)self _queryQueue_currentToken];
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "CAMStorageController canceling purge for token %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(CAMInternalStorage *)self _queryQueue_currentToken];
    CacheDeleteCancelPurge();
  }
  else
  {
    if (v6)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "CAMStorageController could not cancel purge (invalid token)", (uint8_t *)&v7, 2u);
    }
  }
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:(SEL)a3 minimumDiskUsageThreshold:(int64_t)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CAMInternalStorage *)self _cacheDeleteVolume];
  if (v10)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    __int16 v31 = @"CACHE_DELETE_VOLUME";
    v32[0] = v10;
    [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v12 = (void *)CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
    double v13 = CFAbsoluteTimeGetCurrent();
    retstr->var1 = 0;
    retstr->int64_t var2 = 0;
    retstr->var0 = 0;
    int64_t v14 = [(CAMInternalStorage *)self totalFreeBytes];
    retstr->var0 = v14;
    uint64_t v15 = [v12 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_FSPURGEABLE"];
    int64_t v16 = [v15 longLongValue];
    retstr->var1 = v16;

    uint64_t v17 = [v12 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
    retstr->int64_t var2 = [v17 longLongValue] - v16;

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __121__CAMInternalStorage__queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute_minimumDiskUsageThreshold___block_invoke;
    v24[3] = &unk_263FA53D0;
    v24[4] = self;
    long long v25 = *(_OWORD *)&retstr->var0;
    int64_t var2 = retstr->var2;
    dispatch_async(MEMORY[0x263EF83A0], v24);
    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    [(CAMInternalStorage *)self _copyAndApplyByteStringFormattingFromDictionary:v12 toDictionary:v18 keys:&unk_26BDE0550];
    [(CAMInternalStorage *)self _copyFromDictionary:v12 toDictionary:v18 keys:&unk_26BDE0568];
    [(CAMInternalStorage *)self _availableRecordingTimeInMinutesForFreeBytes:v14 minimumDiskUsageThreshold:a5 bytesPerMinute:a4];
    uint64_t v20 = v19;
    uint64_t v21 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)buf = *(_OWORD *)&retstr->var0;
      *(void *)&uint8_t buf[16] = retstr->var2;
      double v22 = [(CAMInternalStorage *)self _stringFromAvailableSpace:buf];
      *(_DWORD *)buf = 134218754;
      *(double *)&uint8_t buf[4] = v13 - Current;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v28 = v22;
      __int16 v29 = 2048;
      uint64_t v30 = v20;
      _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "CAMStorageController _queryAvailableSpace (%.3f seconds)\nCacheDeleteCopyItemizedPurgeableSpaceWithInfo: %{public}@ \n%{public}@\nAvailable time: %.2f minutes", buf, 0x2Au);
    }
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->int64_t var2 = 0;
  }

  return result;
}

uint64_t __121__CAMInternalStorage__queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute_minimumDiskUsageThreshold___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  return [*(id *)(a1 + 32) _setCachedEstimatedSpace:&v2];
}

- (id)_cacheDeleteVolume
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CAMInternalStorage__cacheDeleteVolume__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  if (_cacheDeleteVolume_onceToken != -1) {
    dispatch_once(&_cacheDeleteVolume_onceToken, block);
  }
  return (id)_cacheDeleteVolume_volume;
}

void __40__CAMInternalStorage__cacheDeleteVolume__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(&v7.f_mntonname[392], 0, 32);
  objc_msgSend(*(id *)(a1 + 32), "_storageMountPoint", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  v1 = 0);
  id v2 = [v1 path];
  int v3 = statfs((const char *)[v2 fileSystemRepresentation], &v7);

  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __40__CAMInternalStorage__cacheDeleteVolume__block_invoke_cold_1(v4);
    }
  }
  uint64_t v5 = [NSString stringWithCString:v7.f_mntonname encoding:4];
  BOOL v6 = (void *)_cacheDeleteVolume_volume;
  _cacheDeleteVolume_volume = v5;
}

- (void)_statMountPoint:(statfs *)a3
{
  uint64_t v5 = [(CAMInternalStorage *)self _storageMountPoint];
  id v6 = [v5 path];
  int v7 = statfs((const char *)[v6 fileSystemRepresentation], a3);

  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMInternalStorage _statMountPoint:](self, v8);
    }

    bzero(a3, 0x878uLL);
  }
}

- (int64_t)totalFreeBytes
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(CAMInternalStorage *)self _isLockScreenExtension])
  {
    uint64_t v3 = *MEMORY[0x263EFF858];
    return [(CAMInternalStorage *)self _resourceValueForKey:v3];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    [(CAMInternalStorage *)self _statMountPoint:&v5];
    return *((void *)&v6 + 1) * v5;
  }
}

- (int64_t)_resourceValueForKey:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/"];
  v22[0] = v4;
  long long v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v15 = 0;
  long long v7 = [v5 resourceValuesForKeys:v6 error:&v15];
  id v8 = v15;

  if (v7)
  {
    long long v9 = [v7 objectForKeyedSubscript:v4];
    int64_t v10 = [v9 longValue];
  }
  else
  {
    long long v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v12 = [(CAMInternalStorage *)self _storageMountPoint];
      long long v13 = [v12 path];
      long long v14 = [v8 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v17 = v4;
      __int16 v18 = 2114;
      long long v19 = v13;
      __int16 v20 = 2114;
      long long v21 = v14;
      _os_log_error_impl(&dword_2099F8000, v9, OS_LOG_TYPE_ERROR, "CAMStorageController: resourceValuesForKeys failed to get resource for key %{public}@ at storage mount point %{public}@ with error %{public}@", buf, 0x20u);
    }
    int64_t v10 = 0;
  }

  return v10;
}

- (int64_t)_totalBytes
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(CAMInternalStorage *)self _isLockScreenExtension])
  {
    uint64_t v3 = *MEMORY[0x263EFF8B0];
    return [(CAMInternalStorage *)self _resourceValueForKey:v3];
  }
  else
  {
    memset(v5, 0, 512);
    [(CAMInternalStorage *)self _statMountPoint:v5];
    return *((void *)&v5[0] + 1) * LODWORD(v5[0]);
  }
}

- (int64_t)_absoluteMinimumBytesForMode:(int64_t)a3
{
  uint64_t v3 = +[CAMCaptureCapabilities capabilities];
  int64_t v4 = [v3 minimumDiskSpaceReserved];

  return v4;
}

- (void)_loadFreeDiskThresholds
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0(&dword_2099F8000, v1, v2, "CAMStorageController: fsctl for HFSIOC_GET_LOW_DISK failed: %s", v3, v4, v5, v6, 2u);
}

- (void)_notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason:(id)a3 analyticsEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__CAMInternalStorage__notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason_analyticsEvent___block_invoke;
  block[3] = &unk_263FA0CD0;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __117__CAMInternalStorage__notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason_analyticsEvent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_purgeFastPurgeableSpaceWithThreshold:calledFromPurgeCompletion:forceStopReason:analyticsEvent:", objc_msgSend(*(id *)(a1 + 32), "_fastPurgeThreshold"), 1, *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 availableDiskSpaceChanged:*(void *)(a1 + 32)];
}

- (int64_t)_preferredMinimumBytesForConfiguration:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMInternalStorage *)self _cachedLowDiskThreshold];
  unint64_t v6 = [v4 mode];
  if (v6 <= 9)
  {
    if (((1 << v6) & 0x259) != 0)
    {
      id v7 = +[CAMCaptureCapabilities capabilities];
      uint64_t v8 = [MEMORY[0x263EFA620] maxLivePhotoDataSize];
      if ([v7 isLivePhotoSupported]) {
        uint64_t v9 = 4 * v8;
      }
      else {
        uint64_t v9 = v8;
      }
      goto LABEL_8;
    }
    if (((1 << v6) & 0x186) != 0)
    {
      id v7 = +[CAMCaptureCapabilities capabilities];
      uint64_t v9 = [v7 bytesPerMinuteForGraphConfiguration:v4 outputToExternalStorage:0];
LABEL_8:
      v5 += v9;
    }
  }

  return v5;
}

- (void)_updatePurgeRequestStateForConfiguration:(id)a3 totalFreeBytes:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = +[CAMCaptureCapabilities capabilities];
  int v8 = [v7 isCacheDeleteSupported];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    int64_t v10 = [(CAMInternalStorage *)self _lastPurgeRequestUpdateTime];
    if (!v10 || ([v9 timeIntervalSinceDate:v10], v11 >= 60.0))
    {
      id v12 = [(CAMInternalStorage *)self _preferredMinimumBytesForConfiguration:v6];
      long long v13 = [(CAMInternalStorage *)self _byteFormatter];
      if ((uint64_t)v12 > a4)
      {
        long long v14 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v13 stringFromByteCount:a4];
          long long v16 = [v13 stringFromByteCount:v12];
          *(_DWORD *)buf = 138543618;
          long long v21 = v15;
          __int16 v22 = 2114;
          long long v23 = v16;
          _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Total free disk (%{public}@) is less than PREFERRED minimum for this mode (%{public}@)", buf, 0x16u);
        }
        [(CAMInternalStorage *)self _setPurging:1];
        objc_initWeak((id *)buf, self);
        id v17 = [(CAMInternalStorage *)self _cacheDeleteQueryQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __78__CAMInternalStorage__updatePurgeRequestStateForConfiguration_totalFreeBytes___block_invoke;
        block[3] = &unk_263FA21F8;
        objc_copyWeak(v19, (id *)buf);
        v19[1] = (id)a4;
        v19[2] = v12;
        dispatch_async(v17, block);

        [(CAMInternalStorage *)self set_lastPurgeRequestUpdateTime:v9];
        objc_destroyWeak(v19);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

void __78__CAMInternalStorage__updatePurgeRequestStateForConfiguration_totalFreeBytes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryQueue_updatePurgeRequestStateForTotalFreeBytes:preferredFreeBytes:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queryQueue_aggregateLowDiskEventWithIdentifier:(id)a3
{
  uint64_t v3 = NSURL;
  id v4 = a3;
  int64_t v5 = NSHomeDirectory();
  id v6 = [v3 fileURLWithPath:v5];

  CacheDeleteRegisterLowDiskFailure();
}

- (void)_queryQueue_updatePurgeRequestStateForTotalFreeBytes:(int64_t)a3 preferredFreeBytes:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(CAMInternalStorage *)self _queryQueue_currentToken])
  {
    id v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Ignoring request to purge preferred free bytes since we have an active token", buf, 2u);
    }
  }
  else
  {
    id v7 = [(CAMInternalStorage *)self _cacheDeleteVolume];
    if (v7)
    {
      v23[5] = 0;
      int v8 = (void *)CacheDeleteCopyAvailableSpaceForVolume();
      int64_t v9 = a4 - a3;
      uint64_t v10 = [v8 longLongValue];
      double v11 = +[CAMCaptureCapabilities capabilities];
      uint64_t v12 = [v11 cacheDeleteUrgency];

      long long v13 = [(CAMInternalStorage *)self _byteFormatter];
      long long v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v13 stringFromByteCount:v10 - a3];
        uint64_t v16 = [v13 stringFromByteCount:v9];
        id v17 = (void *)v16;
        if ((v12 + 1) > 5) {
          __int16 v18 = 0;
        }
        else {
          __int16 v18 = off_263FA6C00[(int)v12 + 1];
        }
        *(_DWORD *)buf = 138543874;
        long long v27 = v15;
        __int16 v28 = 2114;
        uint64_t v29 = v16;
        __int16 v30 = 2114;
        long long v31 = v18;
        _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "CAMStorageController: CacheDelete indicates %{public}@ bytes purgeable; requesting purge of %{public}@ at %{public}@ urgency",
          buf,
          0x20u);
      }
      v25[0] = v7;
      v24[0] = @"CACHE_DELETE_VOLUME";
      v24[1] = @"CACHE_DELETE_URGENCY_LIMIT";
      long long v19 = [NSNumber numberWithInt:v12];
      v25[1] = v19;
      v24[2] = @"CACHE_DELETE_AMOUNT";
      __int16 v20 = [NSNumber numberWithLongLong:v9];
      v25[2] = v20;
      long long v21 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke;
      v23[3] = &unk_263FA6BC8;
      v23[4] = self;
      __int16 v22 = _Block_copy(v23);
      [(CAMInternalStorage *)self set_queryQueue_currentToken:CacheDeletePurgeSpaceWithInfo()];
    }
  }
}

void __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke(uint64_t a1, void *a2)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) _cacheDeleteQueryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke_2;
  block[3] = &unk_263FA6BA0;
  objc_copyWeak(v6, &location);
  v6[1] = a2;
  dispatch_async(v4, block);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "CAMStorageController: CacheDelete purge completed with result:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  int64_t v5 = (const void *)objc_msgSend(WeakRetained, "_queryQueue_currentToken");
  if (v5) {
    CFRelease(v5);
  }
  objc_msgSend(WeakRetained, "set_queryQueue_currentToken:", 0);
  [WeakRetained _notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason:0 analyticsEvent:0];
}

- (void)_legacyDiskSpaceDidBecomeLowNotification
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CAMInternalStorage__legacyDiskSpaceDidBecomeLowNotification__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__CAMInternalStorage__legacyDiskSpaceDidBecomeLowNotification__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 availableDiskSpaceChanged:*(void *)(a1 + 32)];
}

- (void)_copyFromDictionary:(id)a3 toDictionary:(id)a4 keys:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v15 = [v7 objectForKeyedSubscript:v14];
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)_copyAndApplyByteStringFormattingFromDictionary:(id)a3 toDictionary:(id)a4 keys:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [v7 objectForKeyedSubscript:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", [v15 longLongValue]);

          id v15 = (void *)v16;
        }
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)_stringFromByteCount:(int64_t)a3
{
  uint64_t v4 = NSString;
  int64_t v5 = [(CAMInternalStorage *)self _byteFormatter];
  int v6 = [v5 stringFromByteCount:a3];
  id v7 = [v4 stringWithFormat:@"%lld (%@)", a3, v6];

  return v7;
}

- (id)_stringFromAvailableSpace:(id *)a3
{
  int64_t v5 = NSString;
  int v6 = [(CAMInternalStorage *)self _stringFromByteCount:a3->var0];
  id v7 = [(CAMInternalStorage *)self _stringFromByteCount:a3->var1];
  id v8 = [(CAMInternalStorage *)self _stringFromByteCount:a3->var2];
  id v9 = [v5 stringWithFormat:@"Available space:\n\tFree=%@\n\tFast=%@\n\tSlow=%@", v6, v7, v8];

  return v9;
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

- (int64_t)_cachedLowDiskThreshold
{
  return self->__cachedLowDiskThreshold;
}

- (void)set_cachedLowDiskThreshold:(int64_t)a3
{
  self->__cachedLowDiskThreshold = a3;
}

- (NSDate)_lastPurgeRequestUpdateTime
{
  return self->__lastPurgeRequestUpdateTime;
}

- (void)set_lastPurgeRequestUpdateTime:(id)a3
{
}

- (OS_dispatch_queue)_cacheDeleteQueryQueue
{
  return self->__cacheDeleteQueryQueue;
}

- (CacheDeleteToken)_queryQueue_currentToken
{
  return self->__queryQueue_currentToken;
}

- (void)set_queryQueue_currentToken:(CacheDeleteToken *)a3
{
  self->__queryQueue_currentToken = a3;
}

- (BOOL)_purging
{
  return self->__purging;
}

- (BOOL)_shouldCancelNextPurge
{
  return self->__shouldCancelNextPurge;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_cachedEstimatedSpace
{
  *($B281C814454105D39E4829273636FC1A *)retstr = ($B281C814454105D39E4829273636FC1A)self[4];
  return self;
}

- (NSByteCountFormatter)_byteFormatter
{
  return self->__byteFormatter;
}

- (int64_t)_proResMinimumDiskUsageThreshold
{
  return self->__proResMinimumDiskUsageThreshold;
}

- (void)_setProResMinimumDiskUsageThreshold:(int64_t)a3
{
  self->__proResMinimumDiskUsageThreshold = a3;
}

- (int64_t)_fastPurgeThreshold
{
  return self->__fastPurgeThreshold;
}

- (NSURL)_storageMountPoint
{
  return self->__storageMountPoint;
}

- (void)set_storageMountPoint:(id)a3
{
}

- (BOOL)_isLockScreenExtension
{
  return self->__isLockScreenExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__storageMountPoint, 0);
  objc_storeStrong((id *)&self->__byteFormatter, 0);
  objc_storeStrong((id *)&self->__cacheDeleteQueryQueue, 0);
  objc_storeStrong((id *)&self->__lastPurgeRequestUpdateTime, 0);
  objc_storeStrong((id *)&self->_graphConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __40__CAMInternalStorage__cacheDeleteVolume__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "CAMStorageController: Unable to get storage mount point. Storage controller cannot proceed without a target volume.", v1, 2u);
}

- (void)_statMountPoint:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 _storageMountPoint];
  uint64_t v4 = [v3 path];
  int64_t v5 = __error();
  int v6 = strerror(*v5);
  int v7 = 138543618;
  id v8 = v4;
  __int16 v9 = 2080;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "CAMStorageController: statfs failed for %{public}@ : %s", (uint8_t *)&v7, 0x16u);
}

- (void)_queryQueue_updatePurgeRequestStateForTotalFreeBytes:(void *)a1 preferredFreeBytes:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "CAMStorageController: Unable to fetch space for essential content bytes from CacheDelete: %{public}@", v4, v5, v6, v7, 2u);
}

@end