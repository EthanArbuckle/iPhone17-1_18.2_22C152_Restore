@interface HMDCameraRecordingSession
+ (id)logCategory;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)clipStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapseClipStartTime;
- (BOOL)_createSessionDirectory;
- (BOOL)_isValidFirstSessionFragment:(id)a3;
- (BOOL)_isValidNonFirstSessionFragment:(id)a3;
- (BOOL)_shouldEndSessionAfterFragment:(id)a3;
- (BOOL)_shouldRecordFragmentWithAnalyzerResult:(id)a3 sequenceNumber:(unint64_t)a4 recordingEventTriggers:(unint64_t)a5 fragmentAnalyzedEvent:(id)a6;
- (BOOL)_shouldWriteSessionLogToDisk;
- (BOOL)activityZonesIncludedForSignificantEventDetection;
- (BOOL)isActive;
- (BOOL)noMoreFragmentsAvailable;
- (HMBLocalZone)localZone;
- (HMDCameraClipUploader)clipUploader;
- (HMDCameraClipUploader)timelapseClipUploader;
- (HMDCameraProfile)camera;
- (HMDCameraRecordingSession)initWithWorkQueue:(id)a3 camera:(id)a4 hapAccessory:(id)a5 home:(id)a6 localZone:(id)a7 configuredFragmentDuration:(double)a8 timelineManager:(id)a9 homePresenceByPairingIdentity:(id)a10;
- (HMDCameraRecordingSession)initWithWorkQueue:(id)a3 camera:(id)a4 hapAccessory:(id)a5 home:(id)a6 localZone:(id)a7 configuredFragmentDuration:(double)a8 timelineManager:(id)a9 homePresenceByPairingIdentity:(id)a10 factory:(id)a11;
- (HMDCameraRecordingSessionDelegate)delegate;
- (HMDCameraRecordingSessionFactory)factory;
- (HMDCameraRecordingSessionSignificantEventManager)significantEventManager;
- (HMDCameraRecordingSessionTimelineManager)timelineManager;
- (HMDCameraRecordingSessionVariantFragmentManager)timelapseFragmentManager;
- (HMDCameraRecordingSessionVideoAnalyzer)videoAnalyzer;
- (HMDDataStreamFragment)cameraVideoInitFragment;
- (HMFActivity)sessionActivity;
- (HMIVideoAnalyzerFragmentResult)introAnalyzerResult;
- (HMIVideoFragment)introFragment;
- (NSData)analysisTimelapseVideoInitData;
- (NSData)analysisVideoInitData;
- (NSDictionary)homePresenceByPairingIdentity;
- (NSDictionary)stateDump;
- (NSNumber)remainingRecordingExtensionDuration;
- (NSString)logIdentifier;
- (NSString)sessionDirectoryPath;
- (NSUUID)identifier;
- (OS_dispatch_queue)workQueue;
- (double)configuredFragmentDuration;
- (id)activityZones;
- (id)attributeDescriptions;
- (unint64_t)currentFragmentNumber;
- (unint64_t)pendingFragmentsCount;
- (unint64_t)recordingEventTriggers;
- (void)_endSessionWithError:(id)a3;
- (void)_finishCurrentClipUploader;
- (void)_finishCurrentTimelapseClipUploader;
- (void)_handleDidFailAnalysisWithError:(id)a3;
- (void)_handleFragmentResult:(id)a3;
- (void)_notifyForAnalyzerResult:(id)a3 fragment:(id)a4 timeOffsetWithinClip:(double)a5 recordingEventTriggers:(unint64_t)a6;
- (void)_notifyForSignificantEvent:(id)a3 recordingEventTriggers:(unint64_t)a4 fragmentNumber:(unint64_t)a5;
- (void)_submitNotificationSuccessMetricWithRecordingEventTriggers:(unint64_t)a3 fragmentNumber:(unint64_t)a4;
- (void)_uploadFragment:(id)a3 withDuration:(double)a4 clipFinalizedBecauseMaxDurationExceeded:(BOOL)a5;
- (void)_uploadTimelapseFragment:(id)a3;
- (void)_writeEvent:(id)a3;
- (void)_writeFragment:(id)a3;
- (void)analyzer:(id)a3 didAnalyzeFragmentWithResult:(id)a4;
- (void)analyzer:(id)a3 didCreateTimelapseFragment:(id)a4;
- (void)analyzer:(id)a3 didFailWithError:(id)a4;
- (void)configure;
- (void)dealloc;
- (void)handleFragment:(id)a3;
- (void)handleMotionActive:(BOOL)a3;
- (void)handleNoMoreFragmentsAvailable;
- (void)setActive:(BOOL)a3;
- (void)setAnalysisTimelapseVideoInitData:(id)a3;
- (void)setAnalysisVideoInitData:(id)a3;
- (void)setCameraVideoInitFragment:(id)a3;
- (void)setClipStartTime:(id *)a3;
- (void)setClipUploader:(id)a3;
- (void)setCurrentFragmentNumber:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIntroAnalyzerResult:(id)a3;
- (void)setIntroFragment:(id)a3;
- (void)setNoMoreFragmentsAvailable:(BOOL)a3;
- (void)setPendingFragmentsCount:(unint64_t)a3;
- (void)setRemainingRecordingExtensionDuration:(id)a3;
- (void)setSessionDirectoryPath:(id)a3;
- (void)setTimelapseClipStartTime:(id *)a3;
- (void)setTimelapseClipUploader:(id)a3;
- (void)uploaderDidFailUpload:(id)a3;
- (void)variantFragmentManager:(id)a3 didSelectVariantFragment:(id)a4 overlapsFullFragment:(BOOL)a5;
@end

@implementation HMDCameraRecordingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDirectoryPath, 0);
  objc_storeStrong((id *)&self->_remainingRecordingExtensionDuration, 0);
  objc_storeStrong((id *)&self->_analysisTimelapseVideoInitData, 0);
  objc_storeStrong((id *)&self->_analysisVideoInitData, 0);
  objc_storeStrong((id *)&self->_introAnalyzerResult, 0);
  objc_storeStrong((id *)&self->_introFragment, 0);
  objc_storeStrong((id *)&self->_cameraVideoInitFragment, 0);
  objc_storeStrong((id *)&self->_timelapseClipUploader, 0);
  objc_storeStrong((id *)&self->_clipUploader, 0);
  objc_storeStrong((id *)&self->_timelapseFragmentManager, 0);
  objc_storeStrong((id *)&self->_significantEventManager, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_videoAnalyzer, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timelineManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_homePresenceByPairingIdentity, 0);
}

- (void)setSessionDirectoryPath:(id)a3
{
}

- (NSString)sessionDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRemainingRecordingExtensionDuration:(id)a3
{
}

- (NSNumber)remainingRecordingExtensionDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAnalysisTimelapseVideoInitData:(id)a3
{
}

- (NSData)analysisTimelapseVideoInitData
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAnalysisVideoInitData:(id)a3
{
}

- (NSData)analysisVideoInitData
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setIntroAnalyzerResult:(id)a3
{
}

- (HMIVideoAnalyzerFragmentResult)introAnalyzerResult
{
  return (HMIVideoAnalyzerFragmentResult *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIntroFragment:(id)a3
{
}

- (HMIVideoFragment)introFragment
{
  return (HMIVideoFragment *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCameraVideoInitFragment:(id)a3
{
}

- (HMDDataStreamFragment)cameraVideoInitFragment
{
  return (HMDDataStreamFragment *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTimelapseClipUploader:(id)a3
{
}

- (HMDCameraClipUploader)timelapseClipUploader
{
  return (HMDCameraClipUploader *)objc_getProperty(self, a2, 152, 1);
}

- (void)setClipUploader:(id)a3
{
}

- (HMDCameraClipUploader)clipUploader
{
  return (HMDCameraClipUploader *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTimelapseClipStartTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapseClipStartTime
{
  objc_copyStruct(retstr, &self->_timelapseClipStartTime, 24, 1, 0);
  return result;
}

- (void)setClipStartTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)clipStartTime
{
  objc_copyStruct(retstr, &self->_clipStartTime, 24, 1, 0);
  return result;
}

- (void)setPendingFragmentsCount:(unint64_t)a3
{
  self->_pendingFragmentsCount = a3;
}

- (unint64_t)pendingFragmentsCount
{
  return self->_pendingFragmentsCount;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setNoMoreFragmentsAvailable:(BOOL)a3
{
  self->_noMoreFragmentsAvailable = a3;
}

- (BOOL)noMoreFragmentsAvailable
{
  return self->_noMoreFragmentsAvailable;
}

- (HMDCameraRecordingSessionVariantFragmentManager)timelapseFragmentManager
{
  return (HMDCameraRecordingSessionVariantFragmentManager *)objc_getProperty(self, a2, 128, 1);
}

- (HMDCameraRecordingSessionSignificantEventManager)significantEventManager
{
  return (HMDCameraRecordingSessionSignificantEventManager *)objc_getProperty(self, a2, 120, 1);
}

- (HMFActivity)sessionActivity
{
  return (HMFActivity *)objc_getProperty(self, a2, 112, 1);
}

- (HMDCameraRecordingSessionVideoAnalyzer)videoAnalyzer
{
  return (HMDCameraRecordingSessionVideoAnalyzer *)objc_getProperty(self, a2, 104, 1);
}

- (HMDCameraRecordingSessionFactory)factory
{
  return (HMDCameraRecordingSessionFactory *)objc_getProperty(self, a2, 96, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraProfile)camera
{
  return (HMDCameraProfile *)objc_getProperty(self, a2, 72, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraRecordingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraRecordingSessionDelegate *)WeakRetained;
}

- (HMDCameraRecordingSessionTimelineManager)timelineManager
{
  return (HMDCameraRecordingSessionTimelineManager *)objc_getProperty(self, a2, 48, 1);
}

- (double)configuredFragmentDuration
{
  return self->_configuredFragmentDuration;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCameraRecordingSession *)self identifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCameraRecordingSession *)self timelineManager];
  v8 = (void *)[v6 initWithName:@"Timeline Manager" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (void)variantFragmentManager:(id)a3 didSelectVariantFragment:(id)a4 overlapsFullFragment:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if (a5)
  {
LABEL_4:
    [(HMDCameraRecordingSession *)self _uploadTimelapseFragment:v9];
    if (![(HMDCameraRecordingSession *)self isActive]) {
      [(HMDCameraRecordingSession *)self _finishCurrentTimelapseClipUploader];
    }
    goto LABEL_9;
  }
  v11 = [(HMDCameraRecordingSession *)self timelapseClipUploader];

  if (v11)
  {
    uint64_t v12 = [v9 placeholderCopy];

    id v9 = (id)v12;
    goto LABEL_4;
  }
  v13 = (void *)MEMORY[0x1D9452090]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v16;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping upload for placeholder fragment because the timelapse clip uploader is not created yet, fragment: %@", (uint8_t *)&v17, 0x16u);
  }
LABEL_9:
}

- (void)uploaderDidFailUpload:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSession *)self clipUploader];

  if (v6 == v4)
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Current clip uploader did fail upload", (uint8_t *)&v19, 0xCu);
    }
    [(HMDCameraRecordingSession *)v15 _finishCurrentClipUploader];
  }
  else
  {
    id v7 = [(HMDCameraRecordingSession *)self timelapseClipUploader];

    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7 == v4)
    {
      if (v11)
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v18;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Timelapse clip uploader did fail upload", (uint8_t *)&v19, 0xCu);
      }
      [(HMDCameraRecordingSession *)v9 _finishCurrentTimelapseClipUploader];
    }
    else
    {
      if (v11)
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Previous clip uploader did fail upload", (uint8_t *)&v19, 0xCu);
      }
      id v13 = (id)[v4 finish];
    }
  }
}

- (void)_finishCurrentTimelapseClipUploader
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSession *)self timelapseClipUploader];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [(HMDCameraRecordingSession *)v6 timelapseClipUploader];
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      __int16 v16 = 2112;
      int v17 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Finishing timelapse clip uploader: %@", buf, 0x16u);
    }
    v10 = [(HMDCameraRecordingSession *)v6 timelapseClipUploader];
    id v11 = (id)[v10 finish];

    [(HMDCameraRecordingSession *)v6 setTimelapseClipUploader:0];
    long long v12 = *MEMORY[0x1E4F1F9F8];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [(HMDCameraRecordingSession *)v6 setTimelapseClipStartTime:&v12];
    [(HMDCameraRecordingSession *)v6 setAnalysisTimelapseVideoInitData:0];
  }
}

- (void)_finishCurrentClipUploader
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSession *)self clipUploader];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [(HMDCameraRecordingSession *)v6 clipUploader];
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Finishing clip uploader: %@", buf, 0x16u);
    }
    v10 = [(HMDCameraRecordingSession *)v6 clipUploader];
    id v11 = (id)[v10 finish];

    [(HMDCameraRecordingSession *)v6 setClipUploader:0];
    long long v13 = *MEMORY[0x1E4F1F9F8];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [(HMDCameraRecordingSession *)v6 setClipStartTime:&v13];
    [(HMDCameraRecordingSession *)v6 setAnalysisVideoInitData:0];
    [(HMDCameraRecordingSession *)v6 setRemainingRecordingExtensionDuration:0];
    long long v12 = [(HMDCameraRecordingSession *)v6 significantEventManager];
    [v12 resetState];
  }
}

- (BOOL)_isValidNonFirstSessionFragment:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isInitial])
  {
    char v6 = 0;
  }
  else
  {
    id v7 = [v4 type];
    char v6 = [v7 isEqual:@"mediaFragment"];
  }
  return v6;
}

- (BOOL)_isValidFirstSessionFragment:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isInitial])
  {
    char v6 = [v4 type];
    char v7 = [v6 isEqual:@"mediaInitialization"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_writeEvent:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDCameraRecordingSession *)self _shouldWriteSessionLogToDisk]
    && [(HMDCameraRecordingSession *)self _createSessionDirectory])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    char v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v6 setTimeZone:v7];

    objc_msgSend(v6, "setFormatOptions:", objc_msgSend(v6, "formatOptions") | 0x800);
    id v8 = (void *)[v4 mutableCopy];
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    v10 = [v6 stringFromDate:v9];
    [v8 setValue:v10 forKey:@"date"];

    id v38 = 0;
    id v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:&v38];
    id v12 = v38;
    if (!v11)
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = self;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v40 = v30;
        __int16 v41 = 2112;
        id v42 = v4;
        __int16 v43 = 2112;
        id v44 = v12;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize log event: %@ error: %@", buf, 0x20u);
      }
      goto LABEL_17;
    }
    long long v13 = (void *)[v11 mutableCopy];
    uint64_t v14 = [@"\n" dataUsingEncoding:4];
    [v13 appendData:v14];

    v15 = [(HMDCameraRecordingSession *)self identifier];
    __int16 v16 = [v15 UUIDString];
    uint64_t v17 = [v16 stringByAppendingPathExtension:@"jsonl"];

    uint64_t v18 = [(HMDCameraRecordingSession *)self sessionDirectoryPath];
    v34 = (void *)v17;
    uint64_t v19 = [v18 stringByAppendingPathComponent:v17];

    id v20 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v19];
    uint64_t v21 = v20;
    if (v20)
    {
      [v20 seekToEndOfFile];
      id v37 = 0;
      char v22 = [v21 writeData:v13 error:&v37];
      id v35 = v37;

      if ((v22 & 1) == 0)
      {
        context = (void *)MEMORY[0x1D9452090]();
        v23 = self;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v40 = v25;
          __int16 v41 = 2112;
          id v42 = v19;
          __int16 v43 = 2112;
          id v44 = v35;
          v26 = "%{public}@Failed to append log event to file at path: %@ error: %@";
LABEL_14:
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, v26, buf, 0x20u);

          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else
    {
      id v36 = v12;
      char v31 = [v13 writeToFile:v19 options:0 error:&v36];
      id v35 = v36;

      if ((v31 & 1) == 0)
      {
        context = (void *)MEMORY[0x1D9452090]();
        v32 = self;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v40 = v25;
          __int16 v41 = 2112;
          id v42 = v19;
          __int16 v43 = 2112;
          id v44 = v35;
          v26 = "%{public}@Failed to write log event to file at path: %@ error: %@";
          goto LABEL_14;
        }
LABEL_15:
      }
    }

    id v12 = v35;
LABEL_17:
  }
}

- (BOOL)_shouldWriteSessionLogToDisk
{
  v2 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v4 = [v3 preferenceForKey:@"writeSessionLogToDisk"];
  v5 = [v4 numberValue];

  if ([v5 BOOLValue])
  {
    BOOL v6 = 1;
  }
  else
  {
    char v7 = _os_feature_enabled_impl();
    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v7;
    }
  }

  return v6;
}

- (void)_writeFragment:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [MEMORY[0x1E4F65530] sharedPreferences];
  char v7 = [v6 preferenceForKey:@"writeAllReceivedVideoFragmentsToDisk"];
  int v8 = [v7 BOOLValue];

  if (v8 && [(HMDCameraRecordingSession *)self _createSessionDirectory])
  {
    id v9 = [(HMDCameraRecordingSession *)self identifier];
    v10 = [v9 UUIDString];
    id v11 = [v10 stringByAppendingPathExtension:@"mp4"];

    id v12 = [(HMDCameraRecordingSession *)self sessionDirectoryPath];
    long long v13 = [v12 stringByAppendingPathComponent:v11];

    uint64_t v14 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v13];
    v15 = v14;
    if (v14)
    {
      [v14 seekToEndOfFile];
      __int16 v16 = [v4 data];
      id v28 = 0;
      char v17 = [v15 writeData:v16 error:&v28];
      id v18 = v28;

      if ((v17 & 1) == 0)
      {
        uint64_t v19 = (void *)MEMORY[0x1D9452090]();
        id v20 = self;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          char v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v30 = v22;
          __int16 v31 = 2112;
          v32 = v13;
          __int16 v33 = 2112;
          id v34 = v18;
          v23 = "%{public}@Failed to append fragment data to file at path: %@ error: %@";
LABEL_10:
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x20u);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {
      v24 = [v4 data];
      id v27 = 0;
      char v25 = [v24 writeToFile:v13 options:0 error:&v27];
      id v18 = v27;

      if ((v25 & 1) == 0)
      {
        uint64_t v19 = (void *)MEMORY[0x1D9452090]();
        v26 = self;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          char v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v30 = v22;
          __int16 v31 = 2112;
          v32 = v13;
          __int16 v33 = 2112;
          id v34 = v18;
          v23 = "%{public}@Failed to write fragment data to file at path: %@ error: %@";
          goto LABEL_10;
        }
LABEL_11:
      }
    }
  }
}

- (BOOL)_createSessionDirectory
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSession *)self sessionDirectoryPath];

  if (v4) {
    return 1;
  }
  BOOL v6 = NSTemporaryDirectory();
  char v7 = [v6 stringByAppendingPathComponent:@"HKSV"];

  int v8 = [(HMDCameraRecordingSession *)self identifier];
  id v9 = [v8 UUIDString];
  v10 = [v7 stringByAppendingPathComponent:v9];
  [(HMDCameraRecordingSession *)self setSessionDirectoryPath:v10];

  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  long long v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    v15 = [(HMDCameraRecordingSession *)v12 sessionDirectoryPath];
    *(_DWORD *)buf = 138543618;
    id v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Writing session data to directory: %@", buf, 0x16u);
  }
  __int16 v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v17 = [(HMDCameraRecordingSession *)v12 sessionDirectoryPath];
  id v25 = 0;
  char v5 = [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v18 = v25;

  if ((v5 & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v12;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v22 = HMFGetLogIdentifier();
      v23 = [(HMDCameraRecordingSession *)v20 sessionDirectoryPath];
      *(_DWORD *)buf = 138543874;
      id v27 = v22;
      __int16 v28 = 2112;
      v29 = v23;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at path: %@ error: %@", buf, 0x20u);
    }
  }

  return v5;
}

- (BOOL)_shouldEndSessionAfterFragment:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (![(HMDCameraRecordingSession *)self noMoreFragmentsAvailable]
    || [(HMDCameraRecordingSession *)self pendingFragmentsCount])
  {
    BOOL v6 = [(HMDCameraRecordingSession *)self remainingRecordingExtensionDuration];

    if (v6)
    {
      char v7 = (void *)MEMORY[0x1D9452090]();
      int v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v56 = v10;
        id v11 = "%{public}@Recording extension active, continue session";
LABEL_6:
        id v12 = v9;
        uint32_t v13 = 12;
LABEL_19:
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
      }
LABEL_20:
      BOOL v15 = 0;
      goto LABEL_21;
    }
    if (v4) {
      [v4 timeRange];
    }
    else {
      memset(&v53, 0, sizeof(v53));
    }
    CMTimeRangeGetEnd(&time, &v53);
    double Seconds = CMTimeGetSeconds(&time);
    uint64_t v19 = [(HMDCameraRecordingSession *)self timelineManager];
    id v20 = [(HMDCameraRecordingSession *)self factory];
    [v20 recordingExtensionDuration];
    int v22 = [v19 isDoorbellTriggerActiveAtAnyTimeAfterOffset:Seconds forDuration:v21];

    if (v22)
    {
      char v7 = (void *)MEMORY[0x1D9452090](v23, v24, v25, v26, v27, v28);
      v29 = self;
      id v9 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v10;
      __int16 v57 = 2048;
      double v58 = Seconds;
      id v11 = "%{public}@Doorbell is active for next fragment at time offset: %f";
LABEL_18:
      id v12 = v9;
      uint32_t v13 = 22;
      goto LABEL_19;
    }
    __int16 v30 = [(HMDCameraRecordingSession *)self timelineManager];
    id v31 = [(HMDCameraRecordingSession *)self factory];
    [v31 recordingExtensionDuration];
    int v33 = [v30 isMotionTriggerActiveAtAnyTimeAfterOffset:Seconds forDuration:v32];

    if (v33)
    {
      char v7 = (void *)MEMORY[0x1D9452090](v34, v35, v36, v37, v38, v39);
      v40 = self;
      id v9 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v10;
      __int16 v57 = 2048;
      double v58 = Seconds;
      id v11 = "%{public}@Motion is active for next fragment at time offset: %f";
      goto LABEL_18;
    }
    uint64_t v42 = _os_feature_enabled_impl();
    if (v42)
    {
      v48 = [(HMDCameraRecordingSession *)self camera];
      v49 = [v48 hapAccessory];
      char v50 = [v49 hasBattery];

      if ((v50 & 1) == 0)
      {
        char v7 = (void *)MEMORY[0x1D9452090](v42, v43, v44, v45, v46, v47);
        v52 = self;
        id v9 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_20;
        }
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v56 = v10;
        id v11 = "%{public}@Continuous video analysis is enabled on powered camera, continue session";
        goto LABEL_6;
      }
    }
    char v7 = (void *)MEMORY[0x1D9452090](v42, v43, v44, v45, v46, v47);
    v51 = self;
    id v9 = HMFGetOSLogHandle();
    BOOL v15 = 1;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    __int16 v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v56 = v16;
    char v17 = "%{public}@Should end session";
LABEL_26:
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v17, buf, 0xCu);

    goto LABEL_21;
  }
  char v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v14 = self;
  id v9 = HMFGetOSLogHandle();
  BOOL v15 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v56 = v16;
    char v17 = "%{public}@No more fragment data to process, must end session";
    goto LABEL_26;
  }
LABEL_21:

  return v15;
}

- (BOOL)_shouldRecordFragmentWithAnalyzerResult:(id)a3 sequenceNumber:(unint64_t)a4 recordingEventTriggers:(unint64_t)a5 fragmentAnalyzedEvent:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v9 fragment];
  uint32_t v13 = v12;
  if (v12) {
    [v12 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  BOOL v15 = [v9 fragment];
  __int16 v16 = v15;
  if (v15) {
    [v15 timeRange];
  }
  else {
    memset(&v53, 0, sizeof(v53));
  }
  CMTime v54 = v53;
  double v17 = CMTimeGetSeconds(&v54);

  id v18 = [(HMDCameraRecordingSession *)self timelineManager];
  int v19 = [v18 isDoorbellTriggerActiveAtAnyTimeAfterOffset:v17 forDuration:Seconds];

  id v20 = (void *)MEMORY[0x1D9452090]();
  double v21 = self;
  int v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    uint64_t v24 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    __int16 v57 = v23;
    __int16 v58 = 2112;
    uint64_t v59 = v24;
    __int16 v60 = 2048;
    double v61 = v17;
    __int16 v62 = 2048;
    double v63 = Seconds;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Doorbell is active: %@ for fragment at time offset: %f and duration: %f", buf, 0x2Au);
  }
  if (v19)
  {
    uint64_t v25 = (void *)MEMORY[0x1D9452090]([v10 setRecordingReason:2]);
    uint64_t v26 = v21;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v57 = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Doorbell event detected, starting recording", buf, 0xCu);
    }
    goto LABEL_25;
  }
  v29 = [(HMDCameraRecordingSession *)v21 timelineManager];
  int v30 = [v29 isMotionTriggerActiveAtAnyTimeAfterOffset:v17 forDuration:Seconds];

  id v31 = (void *)MEMORY[0x1D9452090]();
  double v32 = v21;
  int v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    uint64_t v34 = HMFGetLogIdentifier();
    uint64_t v35 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    __int16 v57 = v34;
    __int16 v58 = 2112;
    uint64_t v59 = v35;
    __int16 v60 = 2048;
    double v61 = v17;
    __int16 v62 = 2048;
    double v63 = Seconds;
    _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Motion is active: %@ for fragment at time offset: %f and duration: %f", buf, 0x2Au);
  }
  uint64_t v36 = [v9 outcome];
  char v37 = [v36 isSuccess];

  if ((v37 & 1) == 0)
  {
    __int16 v41 = (void *)MEMORY[0x1D9452090]();
    uint64_t v42 = v32;
    uint64_t v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = HMFGetLogIdentifier();
      uint64_t v45 = HMCameraSignificantEventTypesAsString();
      uint64_t v46 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      __int16 v57 = v44;
      __int16 v58 = 2112;
      uint64_t v59 = v45;
      __int16 v60 = 2112;
      double v61 = *(double *)&v46;
      _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Fragment analysis was skipped, recordingTriggerEvent is %@ and motion is %@", buf, 0x20u);
    }
    if (a5) {
      int v47 = v30;
    }
    else {
      int v47 = 0;
    }
    if (v47 == 1)
    {
      [v10 setRecordingReason:3];
LABEL_25:
      BOOL v40 = 1;
      goto LABEL_30;
    }
LABEL_29:
    BOOL v40 = 0;
    goto LABEL_30;
  }
  uint64_t v38 = [(HMDCameraRecordingSession *)v32 significantEventManager];
  int v39 = [v38 isAnyEventInAnalyzerFragmentResult:v9 includedInRecordingEventTriggers:a5];

  if (!v39)
  {
    v48 = (void *)MEMORY[0x1D9452090]();
    v49 = v32;
    char v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v57 = v51;
      _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@No user recording trigger events match any detected significant events", buf, 0xCu);
    }
    goto LABEL_29;
  }
  BOOL v40 = 1;
  [v10 setRecordingReason:1];
LABEL_30:

  return v40;
}

- (void)_endSessionWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      double v21 = v10;
      __int16 v22 = 2112;
      id v23 = v4;
      id v11 = "%{public}@Ending session with error: %@";
      id v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v12, v13, v11, buf, v14);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    double v21 = v10;
    id v11 = "%{public}@Ending session";
    id v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 12;
    goto LABEL_6;
  }

  [(HMDCameraRecordingSession *)v7 setActive:0];
  [(HMDCameraRecordingSession *)v7 _finishCurrentClipUploader];
  BOOL v15 = [(HMDCameraRecordingSession *)v7 videoAnalyzer];
  [v15 cancel];

  __int16 v16 = [(HMDCameraRecordingSession *)v7 videoAnalyzer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__HMDCameraRecordingSession__endSessionWithError___block_invoke;
  v18[3] = &unk_1E6A196E0;
  v18[4] = v7;
  id v19 = v4;
  id v17 = v4;
  [v16 finishWithCompletionHandler:v18];
}

void __50__HMDCameraRecordingSession__endSessionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HMDCameraRecordingSession__endSessionWithError___block_invoke_2;
  block[3] = &unk_1E6A19668;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __50__HMDCameraRecordingSession__endSessionWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      BOOL v6 = *(void **)(a1 + 32);
      int v21 = 138543618;
      __int16 v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@Video analyzer finished with error: %@", (uint8_t *)&v21, 0x16u);
    }
  }
  id v7 = [*(id *)(a1 + 40) timelapseFragmentManager];
  int v8 = [v7 expectsVariantFragment];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Timelapse clip uploader is still expecting a timelapse fragment", (uint8_t *)&v21, 0xCu);
    }
  }
  os_log_type_t v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = *(id *)(a1 + 40);
  BOOL v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    id v17 = [*(id *)(a1 + 40) timelapseClipUploader];
    int v21 = 138543618;
    __int16 v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Finishing timelapse clip uploader: %@", (uint8_t *)&v21, 0x16u);
  }
  id v18 = [*(id *)(a1 + 40) timelapseClipUploader];
  id v19 = (id)[v18 finish];

  id v20 = [*(id *)(a1 + 40) delegate];
  [v20 session:*(void *)(a1 + 40) didEndWithError:*(void *)(a1 + 48)];
}

- (void)_handleDidFailAnalysisWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]([(HMDCameraRecordingSession *)self setPendingFragmentsCount:[(HMDCameraRecordingSession *)self pendingFragmentsCount] - 1]);
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Analysis failed with error: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDCameraRecordingSessionErrorDomain" code:2 userInfo:0];
  [(HMDCameraRecordingSession *)v7 _endSessionWithError:v10];
}

- (void)_submitNotificationSuccessMetricWithRecordingEventTriggers:(unint64_t)a3 fragmentNumber:(unint64_t)a4
{
  id v7 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v7);

  int v8 = [HMDCameraRecordingClipNotificationEvent alloc];
  id v9 = [(HMDCameraRecordingSession *)self identifier];
  id v10 = [(HMDCameraRecordingSession *)self camera];
  int v11 = [v10 uniqueIdentifier];
  __int16 v13 = [(HMDCameraRecordingClipNotificationEvent *)v8 initWithSessionID:v9 cameraID:v11 sequenceNumber:a4 recordingEventTriggers:a3];

  id v12 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v12 submitLogEvent:v13];
}

- (void)_notifyForSignificantEvent:(id)a3 recordingEventTriggers:(unint64_t)a4 fragmentNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(HMDCameraRecordingSession *)self clipUploader];
  int v11 = [(HMDCameraRecordingSession *)self homePresenceByPairingIdentity];
  id v12 = [v10 addNotificationForSignificantEvent:v8 homePresenceByPairingIdentity:v11];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__HMDCameraRecordingSession__notifyForSignificantEvent_recordingEventTriggers_fragmentNumber___block_invoke;
  v14[3] = &unk_1E6A14AA0;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  id v13 = (id)[v12 addSuccessBlock:v14];
}

uint64_t __94__HMDCameraRecordingSession__notifyForSignificantEvent_recordingEventTriggers_fragmentNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitNotificationSuccessMetricWithRecordingEventTriggers:*(void *)(a1 + 40) fragmentNumber:*(void *)(a1 + 48)];
}

- (void)_notifyForAnalyzerResult:(id)a3 fragment:(id)a4 timeOffsetWithinClip:(double)a5 recordingEventTriggers:(unint64_t)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDCameraRecordingSession *)self timelineManager];
  if (v11)
  {
    [v11 timeRange];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
  }
  *(_OWORD *)&time.value = v26;
  time.epoch = v27;
  id v14 = [v13 creationDateForFragmentAtTimeOffset:CMTimeGetSeconds(&time)];

  uint64_t v15 = [(HMDCameraRecordingSession *)self significantEventManager];
  __int16 v16 = [v15 significantEventsForAnalyzerFragmentResult:v10 dateOfOccurrence:v14 timeOffsetWithinClip:a6 recordingEventTriggers:a5];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[HMDCameraRecordingSession _notifyForSignificantEvent:recordingEventTriggers:fragmentNumber:](self, "_notifyForSignificantEvent:recordingEventTriggers:fragmentNumber:", *(void *)(*((void *)&v22 + 1) + 8 * v21++), a6, objc_msgSend(v11, "sequenceNumber", (void)v22));
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)_uploadTimelapseFragment:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v58 = v9;
    __int16 v59 = 2112;
    id v60 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Uploading timelapse fragment: %@", buf, 0x16u);
  }
  id v10 = [(HMDCameraRecordingSession *)v7 timelapseClipUploader];

  if (!v10)
  {
    if (v4)
    {
      [v4 timeRange];
    }
    else
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v54 = 0u;
    }
    long long v52 = v54;
    uint64_t v53 = v55;
    [(HMDCameraRecordingSession *)v7 setTimelapseClipStartTime:&v52];
    id v11 = [(HMDCameraRecordingSession *)v7 timelineManager];
    [(HMDCameraRecordingSession *)v7 timelapseClipStartTime];
    id v12 = [v11 creationDateForFragmentAtTimeOffset:CMTimeGetSeconds(&time)];

    id v13 = [(HMDCameraRecordingSession *)v7 factory];
    id v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [(HMDCameraRecordingSession *)v7 localZone];
    __int16 v16 = [(HMDCameraRecordingSession *)v7 workQueue];
    id v17 = [(HMDCameraRecordingSession *)v7 logIdentifier];
    uint64_t v18 = [v13 createUploaderWithClipUUID:v14 startDate:v12 targetFragmentDuration:1 quality:v15 localZone:v16 workQueue:v17 logIdentifier:60.0];
    [(HMDCameraRecordingSession *)v7 setTimelapseClipUploader:v18];

    uint64_t v19 = [(HMDCameraRecordingSession *)v7 timelapseClipUploader];
    [v19 setDelegate:v7];

    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = v7;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = HMFGetLogIdentifier();
      long long v24 = [(HMDCameraRecordingSession *)v21 timelapseClipUploader];
      *(_DWORD *)buf = 138543618;
      __int16 v58 = v23;
      __int16 v59 = 2112;
      id v60 = v24;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Created new timelapse clip uploader: %@", buf, 0x16u);
    }
    long long v25 = [(HMDCameraRecordingSession *)v21 timelapseClipUploader];
    id v26 = (id)[v25 createClip];
  }
  long long v27 = [(HMDCameraRecordingSession *)v7 analysisTimelapseVideoInitData];
  long long v28 = [v4 initializationSegment];
  if (!v27
    || ([(HMDCameraRecordingSession *)v7 factory],
        v29 = objc_claimAutoreleasedReturnValue(),
        char v30 = [v29 isVideoInitData:v27 combinableWithVideoInitData:v28],
        v29,
        (v30 & 1) == 0))
  {
    uint64_t v31 = (void *)MEMORY[0x1D9452090]();
    double v32 = v7;
    int v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v58 = v34;
      __int16 v59 = 2112;
      id v60 = v27;
      __int16 v61 = 2112;
      __int16 v62 = v28;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Analysis timelapse video init fragment changed from %@ to %@", buf, 0x20u);
    }
    [(HMDCameraRecordingSession *)v32 setAnalysisTimelapseVideoInitData:v28];
    uint64_t v35 = [(HMDCameraRecordingSession *)v32 timelapseClipUploader];
    id v36 = (id)[v35 addVideoInitData:v28];
  }
  if (v4)
  {
    [v4 timeRange];
    CMTime v50 = *(CMTime *)&v49[1];
    double Seconds = CMTimeGetSeconds(&v50);
    [v4 timeRange];
  }
  else
  {
    memset(v49, 0, sizeof(v49));
    long long v48 = 0u;
    *(_OWORD *)&v50.value = *(_OWORD *)&v49[1];
    v50.epoch = 0;
    double Seconds = CMTimeGetSeconds(&v50);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
  }
  *(_OWORD *)&lhs.value = v43;
  lhs.epoch = v44;
  [(HMDCameraRecordingSession *)v7 timelapseClipStartTime];
  CMTimeSubtract(&v47, &lhs, &rhs);
  double v38 = CMTimeGetSeconds(&v47);
  int v39 = [(HMDCameraRecordingSession *)v7 timelapseClipUploader];
  BOOL v40 = [v4 separableSegment];
  id v41 = (id)[v39 addVideoSegmentData:v40 duration:0 timeOffsetWithinClip:Seconds clipFinalizedBecauseMaxDurationExceeded:v38];
}

- (void)_uploadFragment:(id)a3 withDuration:(double)a4 clipFinalizedBecauseMaxDurationExceeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(HMDCameraRecordingSession *)self analysisVideoInitData];
  id v10 = [v8 initializationSegment];
  if (!v9
    || ([(HMDCameraRecordingSession *)self factory],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isVideoInitData:v9 combinableWithVideoInitData:v10],
        v11,
        (v12 & 1) == 0))
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      int v33 = v9;
      __int16 v34 = 2112;
      uint64_t v35 = v10;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Analysis video init fragment changed from %@ to %@", buf, 0x20u);
    }
    [(HMDCameraRecordingSession *)v14 setAnalysisVideoInitData:v10];
    id v17 = [(HMDCameraRecordingSession *)v14 clipUploader];
    id v18 = (id)[v17 addVideoInitData:v10];
  }
  if (v8)
  {
    [v8 timeRange];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
  }
  *(_OWORD *)&lhs.value = v25;
  lhs.epoch = v26;
  [(HMDCameraRecordingSession *)self clipStartTime];
  CMTimeSubtract(&time, &lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  uint64_t v20 = [(HMDCameraRecordingSession *)self clipUploader];
  uint64_t v21 = [v8 separableSegment];
  id v22 = (id)[v20 addVideoSegmentData:v21 duration:v5 timeOffsetWithinClip:a4 clipFinalizedBecauseMaxDurationExceeded:Seconds];

  long long v23 = [(HMDCameraRecordingSession *)self timelapseFragmentManager];
  [v23 handleFullFragment:v8];
}

- (void)_handleFragmentResult:(id)a3
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDCameraRecordingSession *)self setPendingFragmentsCount:[(HMDCameraRecordingSession *)self pendingFragmentsCount] - 1];
  if (![(HMDCameraRecordingSession *)self isActive]) {
    goto LABEL_65;
  }
  BOOL v6 = [v4 fragment];
  [(HMDCameraRecordingSession *)self clipStartTime];
  if ((v125 & 1) == 0) {
    goto LABEL_10;
  }
  if (v6) {
    [v6 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&lhs, &range);
  [(HMDCameraRecordingSession *)self clipStartTime];
  CMTimeSubtract(&time, &lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  id v8 = [(HMDCameraRecordingSession *)self factory];
  [v8 maximumClipDuration];
  double v10 = v9;

  if (Seconds > v10)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    char v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      if (v6) {
        [v6 timeRange];
      }
      else {
        memset(&v118, 0, sizeof(v118));
      }
      CMTimeRangeGetEnd(&v119, &v118);
      [(HMDCameraRecordingSession *)v12 clipStartTime];
      CMTimeSubtract(&v120, &v119, &v117);
      Float64 v15 = CMTimeGetSeconds(&v120);
      __int16 v16 = [(HMDCameraRecordingSession *)v12 factory];
      [v16 maximumClipDuration];
      *(_DWORD *)buf = 138543874;
      v129 = v14;
      __int16 v130 = 2048;
      Float64 v131 = v15;
      __int16 v132 = 2048;
      double v133 = v17;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Finishing current clip upload because segment would exceed max duration (%.2f > %.2f)", buf, 0x20u);
    }
    [(HMDCameraRecordingSession *)v12 _finishCurrentClipUploader];
    unsigned int v101 = 1;
  }
  else
  {
LABEL_10:
    unsigned int v101 = 0;
  }
  id v18 = [v4 configuration];
  uint64_t v19 = [v18 eventTriggers] & 0x1F;

  uint64_t v20 = (void *)MEMORY[0x1D9452090]();
  uint64_t v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    long long v23 = HMFGetLogIdentifier();
    HMCameraSignificantEventTypesAsString();
    double v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543618;
    v129 = v23;
    __int16 v130 = 2112;
    Float64 v131 = v24;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Comparing fragment with recording event triggers: %@", buf, 0x16u);
  }
  long long v25 = [HMDCameraRecordingFragmentAnalyzedEvent alloc];
  long long v26 = [(HMDCameraRecordingSession *)v21 identifier];
  long long v27 = [(HMDCameraRecordingSession *)v21 camera];
  long long v28 = [v27 uniqueIdentifier];
  v29 = -[HMDCameraRecordingFragmentAnalyzedEvent initWithSessionID:cameraID:sequenceNumber:](v25, "initWithSessionID:cameraID:sequenceNumber:", v26, v28, [v6 sequenceNumber]);

  char v30 = [v4 outcome];
  -[HMDCameraRecordingFragmentAnalyzedEvent setIsSuccess:](v29, "setIsSuccess:", [v30 isSuccess]);

  uint64_t v100 = v19;
  if (-[HMDCameraRecordingSession _shouldRecordFragmentWithAnalyzerResult:sequenceNumber:recordingEventTriggers:fragmentAnalyzedEvent:](v21, "_shouldRecordFragmentWithAnalyzerResult:sequenceNumber:recordingEventTriggers:fragmentAnalyzedEvent:", v4, [v6 sequenceNumber], v19, v29))
  {
    uint64_t v31 = NSNumber;
    __int16 v32 = [(HMDCameraRecordingSession *)v21 factory];
    [v32 recordingExtensionDuration];
    int v33 = objc_msgSend(v31, "numberWithDouble:");
    [(HMDCameraRecordingSession *)v21 setRemainingRecordingExtensionDuration:v33];
  }
  else
  {
    __int16 v34 = [(HMDCameraRecordingSession *)v21 remainingRecordingExtensionDuration];

    if (!v34)
    {
      uint64_t v38 = 0;
      goto LABEL_31;
    }
    [(HMDCameraRecordingFragmentAnalyzedEvent *)v29 setRecordingReason:4];
    uint64_t v35 = [(HMDCameraRecordingSession *)v21 remainingRecordingExtensionDuration];
    [v35 doubleValue];
    double v37 = v36;
    if (v6) {
      [v6 duration];
    }
    else {
      memset(&v116, 0, sizeof(v116));
    }
    double v39 = v37 - CMTimeGetSeconds(&v116);

    BOOL v40 = (void *)MEMORY[0x1D9452090]();
    id v41 = v21;
    uint64_t v42 = HMFGetOSLogHandle();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
    if (v39 <= 0.0)
    {
      if (v43)
      {
        CMTime v47 = HMFGetLogIdentifier();
        double v48 = [(HMDCameraRecordingSession *)v41 remainingRecordingExtensionDuration];
        *(_DWORD *)buf = 138543618;
        v129 = v47;
        __int16 v130 = 2112;
        Float64 v131 = v48;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Flagging fragment for recording because remaining recording extension duration is %@s. Extension duration will be cleared", buf, 0x16u);
      }
      [(HMDCameraRecordingSession *)v41 setRemainingRecordingExtensionDuration:0];
    }
    else
    {
      if (v43)
      {
        long long v44 = HMFGetLogIdentifier();
        double v45 = [(HMDCameraRecordingSession *)v41 remainingRecordingExtensionDuration];
        *(_DWORD *)buf = 138543874;
        v129 = v44;
        __int16 v130 = 2112;
        Float64 v131 = v45;
        __int16 v132 = 2048;
        double v133 = v39;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Flagging fragment for recording because remaining recording extension duration is %@s. New extension duration will be %fs", buf, 0x20u);
      }
      uint64_t v46 = [NSNumber numberWithDouble:v39];
      [(HMDCameraRecordingSession *)v41 setRemainingRecordingExtensionDuration:v46];
    }
  }
  uint64_t v38 = 1;
LABEL_31:
  v127[0] = @"FragmentResult";
  v126[0] = @"type";
  v126[1] = @"shouldRecordFragment";
  v49 = [NSNumber numberWithBool:v38];
  v127[1] = v49;
  v126[2] = @"sequenceNumber";
  CMTime v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "sequenceNumber"));
  v127[2] = v50;
  v126[3] = @"analysisFPS";
  v51 = NSNumber;
  long long v52 = [v4 outcome];
  [v52 analysisFPS];
  uint64_t v53 = objc_msgSend(v51, "numberWithDouble:");
  v127[3] = v53;
  long long v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:4];
  [(HMDCameraRecordingSession *)v21 _writeEvent:v54];

  long long v55 = (void *)MEMORY[0x1D9452090]();
  long long v56 = v21;
  __int16 v57 = HMFGetOSLogHandle();
  BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_INFO);
  if (!v38)
  {
    if (v58)
    {
      v65 = HMFGetLogIdentifier();
      *(double *)&uint64_t v66 = COERCE_DOUBLE([v6 sequenceNumber]);
      *(_DWORD *)buf = 138543618;
      v129 = v65;
      __int16 v130 = 2048;
      Float64 v131 = *(double *)&v66;
      _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Fragment %lu was not flagged for recording", buf, 0x16u);
    }
    [(HMDCameraRecordingSession *)v56 _finishCurrentClipUploader];
    [(HMDCameraRecordingSession *)v56 setIntroFragment:v6];
    [(HMDCameraRecordingSession *)v56 setIntroAnalyzerResult:v4];
    goto LABEL_62;
  }
  if (v58)
  {
    __int16 v59 = HMFGetLogIdentifier();
    *(double *)&uint64_t v60 = COERCE_DOUBLE([v6 sequenceNumber]);
    *(_DWORD *)buf = 138543618;
    v129 = v59;
    __int16 v130 = 2048;
    Float64 v131 = *(double *)&v60;
    _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Fragment %lu was flagged for recording", buf, 0x16u);
  }
  __int16 v61 = [(HMDCameraRecordingSession *)v56 introFragment];
  __int16 v62 = [(HMDCameraRecordingSession *)v56 introAnalyzerResult];
  uint64_t v63 = [(HMDCameraRecordingSession *)v56 clipUploader];

  uint64_t v64 = v100;
  if (v63)
  {
    if (v6)
    {
LABEL_36:
      [v6 timeRange];
      goto LABEL_50;
    }
  }
  else
  {
    if (v61) {
      v67 = v61;
    }
    else {
      v67 = v6;
    }
    id v68 = v67;
    v98 = v62;
    v99 = v61;
    v97 = v68;
    if (v68)
    {
      [v68 timeRange];
    }
    else
    {
      long long v114 = 0u;
      long long v115 = 0u;
      long long v113 = 0u;
    }
    long long v111 = v113;
    uint64_t v112 = v114;
    [(HMDCameraRecordingSession *)v56 setClipStartTime:&v111];
    v69 = [(HMDCameraRecordingSession *)v56 timelineManager];
    [(HMDCameraRecordingSession *)v56 clipStartTime];
    uint64_t v70 = [v69 creationDateForFragmentAtTimeOffset:CMTimeGetSeconds(&v110)];

    v71 = [(HMDCameraRecordingSession *)v56 factory];
    v72 = [MEMORY[0x1E4F29128] UUID];
    [(HMDCameraRecordingSession *)v56 configuredFragmentDuration];
    double v74 = v73;
    v75 = [(HMDCameraRecordingSession *)v56 localZone];
    v76 = [(HMDCameraRecordingSession *)v56 workQueue];
    v77 = [(HMDCameraRecordingSession *)v56 logIdentifier];
    v96 = (void *)v70;
    v78 = [v71 createUploaderWithClipUUID:v72 startDate:v70 targetFragmentDuration:0 quality:v75 localZone:v76 workQueue:v77 logIdentifier:v74];
    [(HMDCameraRecordingSession *)v56 setClipUploader:v78];

    v79 = [(HMDCameraRecordingSession *)v56 clipUploader];
    [v79 setDelegate:v56];

    v80 = (void *)MEMORY[0x1D9452090]();
    v81 = v56;
    v82 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      v83 = HMFGetLogIdentifier();
      double v84 = [(HMDCameraRecordingSession *)v81 clipUploader];
      *(_DWORD *)buf = 138543618;
      v129 = v83;
      __int16 v130 = 2112;
      Float64 v131 = v84;
      _os_log_impl(&dword_1D49D5000, v82, OS_LOG_TYPE_INFO, "%{public}@Created new clip uploader: %@", buf, 0x16u);
    }

    __int16 v61 = v99;
    uint64_t v64 = v100;
    __int16 v62 = v98;
    if (v6) {
      goto LABEL_36;
    }
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v105 = 0u;
LABEL_50:
  *(_OWORD *)&v108.value = v105;
  v108.epoch = v106;
  [(HMDCameraRecordingSession *)v56 clipStartTime];
  CMTimeSubtract(&v109, &v108, &v104);
  uint64_t v85 = [(HMDCameraRecordingSession *)v56 _notifyForAnalyzerResult:v4 fragment:v6 timeOffsetWithinClip:v64 recordingEventTriggers:CMTimeGetSeconds(&v109)];
  if (v61 && v62)
  {
    v86 = (void *)MEMORY[0x1D9452090](v85);
    v87 = v56;
    v88 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      v89 = HMFGetLogIdentifier();
      *(double *)&uint64_t v90 = COERCE_DOUBLE([v61 sequenceNumber]);
      *(_DWORD *)buf = 138543618;
      v129 = v89;
      __int16 v130 = 2048;
      Float64 v131 = *(double *)&v90;
      _os_log_impl(&dword_1D49D5000, v88, OS_LOG_TYPE_INFO, "%{public}@Uploading intro fragment %lu", buf, 0x16u);
    }
    v91 = [v62 fragment];
    v92 = v91;
    if (v91) {
      [v91 duration];
    }
    else {
      memset(&v103, 0, sizeof(v103));
    }
    [(HMDCameraRecordingSession *)v87 _uploadFragment:v61 withDuration:v101 clipFinalizedBecauseMaxDurationExceeded:CMTimeGetSeconds(&v103)];

    [(HMDCameraRecordingSession *)v87 setIntroFragment:0];
    [(HMDCameraRecordingSession *)v87 setIntroAnalyzerResult:0];
  }
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&v102, 0, sizeof(v102));
  }
  [(HMDCameraRecordingSession *)v56 _uploadFragment:v6 withDuration:v101 clipFinalizedBecauseMaxDurationExceeded:CMTimeGetSeconds(&v102)];
  v93 = [(HMDCameraRecordingSession *)v56 clipUploader];
  v94 = [v93 clipUUID];
  [(HMDCameraRecordingFragmentAnalyzedEvent *)v29 setClipModelID:v94];

LABEL_62:
  if ([(HMDCameraRecordingSession *)v56 _shouldEndSessionAfterFragment:v6]) {
    [(HMDCameraRecordingSession *)v56 _endSessionWithError:0];
  }
  v95 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v95 submitLogEvent:v29];

LABEL_65:
}

- (void)analyzer:(id)a3 didCreateTimelapseFragment:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(HMDCameraRecordingSession *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HMDCameraRecordingSession_analyzer_didCreateTimelapseFragment___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __65__HMDCameraRecordingSession_analyzer_didCreateTimelapseFragment___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Timelapse fragment was created: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) timelapseFragmentManager];
  [v7 handleVariantFragment:*(void *)(a1 + 40)];
}

- (void)analyzer:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDCameraRecordingSession *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HMDCameraRecordingSession_analyzer_didFailWithError___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __55__HMDCameraRecordingSession_analyzer_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFailAnalysisWithError:*(void *)(a1 + 40)];
}

- (void)analyzer:(id)a3 didAnalyzeFragmentWithResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDCameraRecordingSession *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HMDCameraRecordingSession_analyzer_didAnalyzeFragmentWithResult___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __67__HMDCameraRecordingSession_analyzer_didAnalyzeFragmentWithResult___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) fragment];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Fragment was analyzed: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _handleFragmentResult:*(void *)(a1 + 40)];
}

- (NSDictionary)homePresenceByPairingIdentity
{
  id v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  homePresenceByPairingIdentity = self->_homePresenceByPairingIdentity;
  return homePresenceByPairingIdentity;
}

- (void)handleNoMoreFragmentsAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory has no more fragments available for analysis", (uint8_t *)&v12, 0xCu);
  }
  [(HMDCameraRecordingSession *)v5 setNoMoreFragmentsAvailable:1];
  if (![(HMDCameraRecordingSession *)v5 pendingFragmentsCount]
    && [(HMDCameraRecordingSession *)v5 isActive])
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = v5;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Finalizing session because all fragments have been analyzed", (uint8_t *)&v12, 0xCu);
    }
    [(HMDCameraRecordingSession *)v9 _endSessionWithError:0];
  }
}

- (void)handleMotionActive:(BOOL)a3
{
  BOOL v3 = a3;
  v9[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v8[0] = @"type";
  v8[1] = @"motionActive";
  v9[0] = @"MotionActive";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [(HMDCameraRecordingSession *)self _writeEvent:v7];
}

- (void)handleFragment:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDCameraRecordingSession *)self delegate];
  id v7 = [(HMDCameraRecordingSession *)self cameraVideoInitFragment];
  if (!v7)
  {
    if ([(HMDCameraRecordingSession *)self _isValidFirstSessionFragment:v4])
    {
      [(HMDCameraRecordingSession *)self setCameraVideoInitFragment:v4];
      [(HMDCameraRecordingSession *)self _writeFragment:v4];
      id v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1F2DCB810];
      v29 = [(HMDCameraRecordingSession *)self camera];
      id v19 = [v29 accessory];

      char v30 = [v19 name];
      [v13 setObject:v30 forKeyedSubscript:@"cameraName"];

      uint64_t v31 = [v19 manufacturer];
      [v13 setObject:v31 forKeyedSubscript:@"cameraManufacturer"];

      __int16 v32 = [v19 model];
      [v13 setObject:v32 forKeyedSubscript:@"cameraModel"];

      int v33 = [(HMDCameraRecordingSession *)self camera];
      __int16 v34 = [v33 uniqueIdentifier];
      uint64_t v35 = [v34 UUIDString];
      [v13 setObject:v35 forKeyedSubscript:@"uniqueIdentifier"];

      double v36 = [(HMDCameraRecordingSession *)self camera];
      double v37 = [v36 currentSettings];
      [v37 recordingEventTriggers];
      uint64_t v38 = HMCameraSignificantEventTypesAsString();
      [v13 setObject:v38 forKeyedSubscript:@"recordingEventTriggers"];

      double v39 = [v19 room];
      BOOL v40 = [v39 name];
      [v13 setObject:v40 forKeyedSubscript:@"room"];

      [(HMDCameraRecordingSession *)self _writeEvent:v13];
LABEL_9:

LABEL_19:
      goto LABEL_20;
    }
    double v45 = (void *)MEMORY[0x1D9452090]();
    uint64_t v46 = self;
    CMTime v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      double v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      v49 = "%{public}@Received invalid first session fragment: %@";
LABEL_17:
      _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, v49, buf, 0x16u);
    }
LABEL_18:

    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDCameraRecordingSessionErrorDomain" code:1 userInfo:0];
    [v6 session:v46 didEndWithError:v13];
    goto LABEL_19;
  }
  [(HMDCameraRecordingSession *)self _writeFragment:v4];
  if ([(HMDCameraRecordingSession *)self isActive])
  {
    if ([(HMDCameraRecordingSession *)self _isValidNonFirstSessionFragment:v4])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F69888]);
      id v9 = [v7 data];
      __int16 v10 = [v4 data];
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingSession currentFragmentNumber](self, "currentFragmentNumber"));
      CMTime v50 = v11;
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      id v13 = (void *)[v8 initWithInitializationSegment:v9 separableSegment:v10 sequenceNumbers:v12];

      uint64_t v14 = [(HMDCameraRecordingSession *)self sessionActivity];
      objc_msgSend(v14, "markWithFormat:", @"Analyze fragment %lu", -[HMDCameraRecordingSession currentFragmentNumber](self, "currentFragmentNumber"));

      [(HMDCameraRecordingSession *)self setCurrentFragmentNumber:[(HMDCameraRecordingSession *)self currentFragmentNumber] + 1];
      Float64 v15 = (void *)MEMORY[0x1D9452090]([(HMDCameraRecordingSession *)self setPendingFragmentsCount:[(HMDCameraRecordingSession *)self pendingFragmentsCount] + 1]);
      __int16 v16 = self;
      double v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Requesting analysis for fragment: %@", buf, 0x16u);
      }
      id v19 = objc_alloc_init(MEMORY[0x1E4F69850]);
      objc_msgSend(v19, "setEventTriggers:", -[HMDCameraRecordingSession recordingEventTriggers](v16, "recordingEventTriggers") & 0x1F);
      uint64_t v20 = [(HMDCameraRecordingSession *)v16 activityZones];
      BOOL v21 = [(HMDCameraRecordingSession *)v16 activityZonesIncludedForSignificantEventDetection];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __hmiActivityZonesFromActivityZones_block_invoke;
      long long v52 = &__block_descriptor_33_e53___HMICameraActivityZone_16__0__HMCameraActivityZone_8l;
      BOOL v53 = v21;
      id v22 = objc_msgSend(v20, "na_map:", buf);
      long long v23 = [v22 allObjects];

      [v19 setActivityZones:v23];
      double v24 = [(HMDCameraProfile *)v16->_camera hapAccessory];
      long long v25 = [v24 home];
      long long v26 = [v25 personManagerSettings];
      objc_msgSend(v19, "setRecognizeFaces:", objc_msgSend(v26, "isFaceClassificationEnabled"));

      long long v27 = [(HMDCameraRecordingSession *)v16 videoAnalyzer];
      [v27 analyzeFragment:v13 configuration:v19];

      long long v28 = [(HMDCameraRecordingSession *)v16 videoAnalyzer];
      [v28 flushAsync];

      goto LABEL_9;
    }
    double v45 = (void *)MEMORY[0x1D9452090]();
    uint64_t v46 = self;
    CMTime v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      double v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      v49 = "%{public}@Received invalid non-first session fragment: %@";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v41 = (void *)MEMORY[0x1D9452090]();
  uint64_t v42 = self;
  BOOL v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    long long v44 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v44;
    _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Dropping fragment for analysis as session is no longer active", buf, 0xCu);
  }
  [v6 session:v42 didEndWithError:0];
LABEL_20:
}

- (void)configure
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDCameraRecordingSession *)self camera];
  id v4 = [v3 hapAccessory];
  id v5 = [v4 home];

  if (v5)
  {
    uint64_t v6 = [(HMDCameraRecordingSession *)self timelapseFragmentManager];
    [v6 setDelegate:self];

    id v7 = [(HMDCameraRecordingSession *)self videoAnalyzer];
    [v7 setDelegate:self];

    id v8 = [v5 personManager];
    id v9 = [v8 hmiPersonManager];
    __int16 v10 = [(HMDCameraRecordingSession *)self videoAnalyzer];
    [v10 setHomePersonManager:v9];

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    int v12 = [v5 users];
    id v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_159382);
    uint64_t v14 = [v11 setWithArray:v13];
    Float64 v15 = [(HMDCameraRecordingSession *)self videoAnalyzer];
    [v15 setExternalPersonManagers:v14];

    __int16 v16 = [v5 analysisStatePublisher];
    double v17 = [v16 analysisStateManager];
    id v18 = [(HMDCameraRecordingSession *)self videoAnalyzer];
    [v18 setAnalysisStateManager:v17];
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    uint64_t v20 = self;
    BOOL v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      int v23 = 138543362;
      double v24 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Can't configure recording session because home reference is nil", (uint8_t *)&v23, 0xCu);
    }
  }
}

id __38__HMDCameraRecordingSession_configure__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 photosPersonManager];
  BOOL v3 = [v2 hmiPersonManager];

  return v3;
}

- (BOOL)activityZonesIncludedForSignificantEventDetection
{
  BOOL v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSession *)self camera];
  id v5 = [v4 currentSettings];
  char v6 = [v5 areActivityZonesIncludedForSignificantEventDetection];

  return v6;
}

- (id)activityZones
{
  BOOL v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSession *)self camera];
  id v5 = [v4 currentSettings];
  char v6 = [v5 activityZones];

  return v6;
}

- (void)setCurrentFragmentNumber:(unint64_t)a3
{
  id v5 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  self->_currentFragmentNumber = a3;
}

- (unint64_t)currentFragmentNumber
{
  BOOL v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return self->_currentFragmentNumber;
}

- (unint64_t)recordingEventTriggers
{
  BOOL v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSession *)self camera];
  id v5 = [v4 currentSettings];
  unint64_t v6 = [v5 recordingEventTriggers];

  return v6;
}

- (NSDictionary)stateDump
{
  BOOL v3 = [(HMDCameraRecordingSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingSession isActive](self, "isActive"));
  [v4 setObject:v5 forKeyedSubscript:@"Active"];

  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingSession currentFragmentNumber](self, "currentFragmentNumber"));
  [v4 setObject:v6 forKeyedSubscript:@"Current Fragment Number"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingSession pendingFragmentsCount](self, "pendingFragmentsCount"));
  [v4 setObject:v7 forKeyedSubscript:@"Pending Fragments Count"];

  id v8 = [(HMDCameraRecordingSession *)self clipUploader];
  id v9 = [v8 stateDump];
  [v4 setObject:v9 forKeyedSubscript:@"Clip Uploader"];

  __int16 v10 = [(HMDCameraRecordingSession *)self timelapseClipUploader];
  uint64_t v11 = [v10 stateDump];
  [v4 setObject:v11 forKeyedSubscript:@"Timelapse Clip Uploader"];

  int v12 = (void *)[v4 copy];
  return (NSDictionary *)v12;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating recording session: %@", buf, 0x16u);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraRecordingSession;
  [(HMDCameraRecordingSession *)&v7 dealloc];
}

- (HMDCameraRecordingSession)initWithWorkQueue:(id)a3 camera:(id)a4 hapAccessory:(id)a5 home:(id)a6 localZone:(id)a7 configuredFragmentDuration:(double)a8 timelineManager:(id)a9 homePresenceByPairingIdentity:(id)a10 factory:(id)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  id v74 = v21;
  id v73 = a7;
  id v72 = a9;
  id v71 = a10;
  id v23 = a11;
  uint64_t v70 = v18;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v19)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v20)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  double v24 = v74;
  if (!v74)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v73)
  {
LABEL_18:
    _HMFPreconditionFailure();
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (a8 <= 0.0 || fabs(a8) < 2.22044605e-16) {
    goto LABEL_19;
  }
  if (!v72)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v71)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!v23)
  {
LABEL_22:
    BOOL v58 = (HMDCameraRecordingSession *)_HMFPreconditionFailure();
    return [(HMDCameraRecordingSession *)v58 initWithWorkQueue:v60 camera:v61 hapAccessory:v62 home:v63 localZone:v64 configuredFragmentDuration:v66 timelineManager:v65 homePresenceByPairingIdentity:a10];
  }
  id v68 = v23;
  v81.receiver = self;
  v81.super_class = (Class)HMDCameraRecordingSession;
  uint64_t v25 = [(HMDCameraRecordingSession *)&v81 init];
  long long v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_workQueue, a3);
    objc_storeStrong((id *)&v26->_camera, a4);
    objc_storeStrong((id *)&v26->_localZone, a7);
    v26->_configuredFragmentDuration = a8;
    objc_storeStrong((id *)&v26->_timelineManager, v22);
    objc_storeStrong((id *)&v26->_homePresenceByPairingIdentity, a10);
    objc_storeStrong((id *)&v26->_factory, a11);
    uint64_t v27 = [MEMORY[0x1E4F29128] UUID];
    identifier = v26->_identifier;
    v26->_identifier = (NSUUID *)v27;

    v26->_active = 1;
    v29 = (long long *)MEMORY[0x1E4F1F9F8];
    int64_t v30 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v26->_clipStartTime.epoch = v30;
    long long v31 = *v29;
    *(_OWORD *)&v26->_clipStartTime.value = *v29;
    *(_OWORD *)&v26->_timelapseClipStartTime.value = v31;
    v26->_timelapseClipStartTime.epoch = v30;
    __int16 v32 = NSString;
    int v33 = [v20 name];
    uint64_t v34 = [v32 stringWithFormat:@"%@/%@", v33, v26->_identifier];
    logIdentifier = v26->_logIdentifier;
    v26->_logIdentifier = (NSString *)v34;

    double v36 = [v74 personManagerSettings];
    uint64_t v37 = [v36 isFaceClassificationEnabled];

    obj = [[HMDAccessoryMetricVendorDetails alloc] initWithAccessory:v20];
    id v38 = objc_alloc(MEMORY[0x1E4F697D0]);
    double v39 = [v19 uniqueIdentifier];
    BOOL v40 = [v20 name];
    [(HMDAccessoryMetricVendorDetails *)obj manufacturer];
    v42 = id v41 = v19;
    BOOL v43 = [(HMDAccessoryMetricVendorDetails *)obj model];
    long long v44 = [(HMDAccessoryMetricVendorDetails *)obj firmwareVersion];
    double v45 = objc_msgSend(v38, "initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:", v39, v40, v42, v43, v44, objc_msgSend(v20, "hasBattery"));

    id v19 = v41;
    double v24 = v74;

    id v46 = objc_alloc_init(MEMORY[0x1E4F69848]);
    [v46 setMaxFragmentAnalysisDuration:20.0];
    CMTimeMakeWithSeconds(&v80, a8 * 2.5, 1000);
    CMTime v79 = v80;
    [v46 setMaxFragmentDuration:&v79];
    [v46 setCamera:v45];
    [v46 setTranscode:v37];
    CMTime v47 = [v74 uuid];
    [v46 setHomeUUID:v47];

    CMTimeMake(&v78, 1, 1);
    CMTime v77 = v78;
    [v46 setTimelapseInterval:&v77];
    CMTimeMakeWithSeconds(&v76, 60.0, 1000);
    CMTime v75 = v76;
    [v46 setTimelapsePreferredFragmentDuration:&v75];
    uint64_t v48 = [(HMDCameraRecordingSessionFactory *)v26->_factory createTimelapseFragmentManagerWithLogIdentifier:v26->_logIdentifier];
    timelapseFragmentManager = v26->_timelapseFragmentManager;
    v26->_timelapseFragmentManager = (HMDCameraRecordingSessionVariantFragmentManager *)v48;

    uint64_t v50 = [(HMDCameraRecordingSessionFactory *)v26->_factory createVideoAnalyzerWithConfiguration:v46 identifier:v26->_identifier];
    videoAnalyzer = v26->_videoAnalyzer;
    v26->_videoAnalyzer = (HMDCameraRecordingSessionVideoAnalyzer *)v50;

    uint64_t v52 = [objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Recording Session" parent:0 options:3];
    sessionActivity = v26->_sessionActivity;
    v26->_sessionActivity = (HMFActivity *)v52;

    uint64_t v54 = [[HMDCameraSignificantEventFaceClassificationResolver alloc] initWithHome:v74];
    uint64_t v55 = [(HMDCameraRecordingSessionFactory *)v26->_factory createSignificantEventManagerWithWorkQueue:v70 faceClassificationResolver:v54 logIdentifier:v26->_logIdentifier];
    significantEventManager = v26->_significantEventManager;
    v26->_significantEventManager = (HMDCameraRecordingSessionSignificantEventManager *)v55;
  }
  return v26;
}

- (HMDCameraRecordingSession)initWithWorkQueue:(id)a3 camera:(id)a4 hapAccessory:(id)a5 home:(id)a6 localZone:(id)a7 configuredFragmentDuration:(double)a8 timelineManager:(id)a9 homePresenceByPairingIdentity:(id)a10
{
  id v18 = a10;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  uint64_t v25 = objc_alloc_init(HMDCameraRecordingSessionFactory);
  long long v26 = [(HMDCameraRecordingSession *)self initWithWorkQueue:v24 camera:v23 hapAccessory:v22 home:v21 localZone:v20 configuredFragmentDuration:v19 timelineManager:a8 homePresenceByPairingIdentity:v18 factory:v25];

  return v26;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t52 != -1) {
    dispatch_once(&logCategory__hmf_once_t52, &__block_literal_global_150_159448);
  }
  v2 = (void *)logCategory__hmf_once_v53;
  return v2;
}

uint64_t __40__HMDCameraRecordingSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v53;
  logCategory__hmf_once_BOOL v53 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end