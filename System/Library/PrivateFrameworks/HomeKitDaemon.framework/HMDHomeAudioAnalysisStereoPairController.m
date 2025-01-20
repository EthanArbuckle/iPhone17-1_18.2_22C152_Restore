@interface HMDHomeAudioAnalysisStereoPairController
- (HMDHomeAudioAnalysisStereoPairController)init;
- (void)compareOrUpdateRecentAudioAnalysisStereoPairEvent:(id)a3 key:(id)a4 accessory:(id)a5 notificationUUID:(id)a6 window:(unint64_t)a7 completion:(id)a8;
- (void)updateAudioAnalysisStereoPairDetectedEvent:(id)a3 key:(id)a4 accessory:(id)a5 notificationUUID:(id)a6 completion:(id)a7;
@end

@implementation HMDHomeAudioAnalysisStereoPairController

- (void).cxx_destruct
{
}

- (void)updateAudioAnalysisStereoPairDetectedEvent:(id)a3 key:(id)a4 accessory:(id)a5 notificationUUID:(id)a6 completion:(id)a7
{
  v12 = (void (**)(id, uint64_t, id, id))a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[HMAudioAnalysisStereoPairDetectedEvent alloc] initWithEventBulletin:v16 accessory:v14 notificationUUID:v13];

  [(NSMutableDictionary *)self->_audioAnalysisStereoPairDetectedEventsMap setObject:v17 forKeyedSubscript:v15];
  v12[2](v12, 1, v14, v13);
}

- (void)compareOrUpdateRecentAudioAnalysisStereoPairEvent:(id)a3 key:(id)a4 accessory:(id)a5 notificationUUID:(id)a6 window:(unint64_t)a7 completion:(id)a8
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v56 = a5;
  id v57 = a6;
  id v16 = a8;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  audioAnalysisStereoPairDetectedEventsMap = self->_audioAnalysisStereoPairDetectedEventsMap;
  if (!audioAnalysisStereoPairDetectedEventsMap)
  {
    v18 = (NSMutableDictionary *)objc_opt_new();
    v19 = self->_audioAnalysisStereoPairDetectedEventsMap;
    self->_audioAnalysisStereoPairDetectedEventsMap = v18;

    audioAnalysisStereoPairDetectedEventsMap = self->_audioAnalysisStereoPairDetectedEventsMap;
  }
  v20 = [(NSMutableDictionary *)audioAnalysisStereoPairDetectedEventsMap objectForKeyedSubscript:v15];
  if (v20)
  {
    uint64_t v21 = [v14 state];
    v22 = [v20 event];
    uint64_t v23 = [v22 state];

    if (v21 == v23)
    {
      v24 = [v14 accessoryIdentifier];
      v25 = [v20 event];
      v26 = [v25 accessoryIdentifier];
      int v27 = [v24 isEqual:v26];

      if (v27)
      {
        v28 = (void *)MEMORY[0x230FBD990]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v59 = v31;
          __int16 v60 = 2112;
          id v61 = v15;
          __int16 v62 = 2112;
          id v63 = v14;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, sequential event from accessory", buf, 0x20u);
        }
        v32 = [v20 accessory];
        v33 = [v20 notificationUUID];
        [(HMDHomeAudioAnalysisStereoPairController *)v29 updateAudioAnalysisStereoPairDetectedEvent:v14 key:v15 accessory:v32 notificationUUID:v33 completion:v16];
        goto LABEL_15;
      }
      v43 = [v14 dateOfOccurrence];
      v44 = [v20 event];
      v45 = [v44 dateOfOccurrence];
      [v43 timeIntervalSinceDate:v45];
      double v47 = v46;

      if (v47 < 0.0) {
        double v47 = -v47;
      }
      v48 = (void *)MEMORY[0x230FBD990]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v51 = (id)objc_claimAutoreleasedReturnValue();
        v52 = [NSNumber numberWithDouble:v47];
        *(_DWORD *)buf = 138543874;
        id v59 = v51;
        __int16 v60 = 2112;
        id v61 = v52;
        __int16 v62 = 2112;
        id v63 = v15;
        _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_DEBUG, "%{public}@latency:%@ key:%@", buf, 0x20u);
      }
      if (v47 < (double)a7)
      {
        (*((void (**)(id, void, void, void))v16 + 2))(v16, 0, 0, 0);
        goto LABEL_16;
      }
      v38 = (void *)MEMORY[0x230FBD990]();
      v39 = v49;
      HMFGetOSLogHandle();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        v54 = [NSNumber numberWithDouble:v47];
        *(_DWORD *)buf = 138544130;
        id v59 = v53;
        __int16 v60 = 2112;
        id v61 = v15;
        __int16 v62 = 2112;
        id v63 = v14;
        __int16 v64 = 2112;
        v65 = v54;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, latency:%@", buf, 0x2Au);
      }
    }
    else
    {
      v38 = (void *)MEMORY[0x230FBD990]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "state"));
        *(_DWORD *)buf = 138544130;
        id v59 = v41;
        __int16 v60 = 2112;
        id v61 = v15;
        __int16 v62 = 2112;
        id v63 = v14;
        __int16 v64 = 2112;
        v65 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, new state:%@", buf, 0x2Au);
      }
    }

    v32 = [v20 accessory];
    v33 = [v20 notificationUUID];
    [(HMDHomeAudioAnalysisStereoPairController *)v39 updateAudioAnalysisStereoPairDetectedEvent:v14 key:v15 accessory:v32 notificationUUID:v33 completion:v16];
LABEL_15:

    goto LABEL_16;
  }
  v34 = (void *)MEMORY[0x230FBD990]();
  v35 = self;
  HMFGetOSLogHandle();
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v59 = v37;
    __int16 v60 = 2112;
    id v61 = v15;
    __int16 v62 = 2112;
    id v63 = v14;
    _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, first known event", buf, 0x20u);
  }
  [(HMDHomeAudioAnalysisStereoPairController *)v35 updateAudioAnalysisStereoPairDetectedEvent:v14 key:v15 accessory:v56 notificationUUID:v57 completion:v16];
LABEL_16:

  os_unfair_lock_unlock(lock);
}

- (HMDHomeAudioAnalysisStereoPairController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDHomeAudioAnalysisStereoPairController;
  result = [(HMDHomeAudioAnalysisStereoPairController *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end