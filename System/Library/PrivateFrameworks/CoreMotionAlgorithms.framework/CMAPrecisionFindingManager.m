@interface CMAPrecisionFindingManager
- (BOOL)deviceFindingClient;
- (CMAPrecisionFindingAnalytics)analyticsManager;
- (CMAPrecisionFindingDelegate)delegate;
- (CMAPrecisionFindingManager)initWithDelegate:(id)a3 dispatchQueue:(id)a4;
- (OS_dispatch_queue)delegateQueue;
- (id).cxx_construct;
- (void)dealloc;
- (void)setAnalyticsManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDeviceFindingClient:(BOOL)a3;
- (void)startDeviceFindingUpdates;
- (void)stopDeviceFindingUpdates;
- (void)updateAltimeterData:(id)a3;
- (void)updateAnalytics;
- (void)updateDeviceMotion:(id)a3;
- (void)updatePeerState:(id)a3;
- (void)updateRanging:(id)a3;
- (void)updateWatchOrientation:(id)a3;
@end

@implementation CMAPrecisionFindingManager

- (CMAPrecisionFindingManager)initWithDelegate:(id)a3 dispatchQueue:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)CMAPrecisionFindingManager;
  v6 = [(CMAPrecisionFindingManager *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    dispatch_retain((dispatch_object_t)a4);
    v7->_delegateQueue = (OS_dispatch_queue *)a4;
    v7->_analyticsManager = objc_alloc_init(CMAPrecisionFindingAnalytics);
    id v8 = objc_alloc(MEMORY[0x263EFFA40]);
    v11 = objc_msgSend_initWithSuiteName_(v8, v9, @"com.apple.CoreMotionAlgorithms.Msl.nearbyd", v10);
    objc_msgSend_setObject_forKey_(v11, v12, @"private/var/mobile/Library/Caches/com.apple.CoreMotionAlgorithms/", @"FileBasePath");
    objc_msgSend_setObject_forKey_(v11, v13, @"1", @"LoggingEnabled");

    id v14 = objc_alloc(MEMORY[0x263EFFA40]);
    v17 = objc_msgSend_initWithSuiteName_(v14, v15, @"com.apple.CoreMotionAlgorithms", v16);
    uint64_t v20 = objc_msgSend_objectForKey_(v17, v18, @"NumParticlesDeviceFinding", v19);
    if (v20)
    {
      v21 = (void *)v20;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v25 = objc_msgSend_unsignedLongLongValue(v21, v22, v23, v24);
        sub_227CA3384((uint64_t)&v7->_positionEstimator, v25);
      }
    }

    sub_227CA2724();
    v7->_analyticsDownsampler.fMinimumToleratedDt = 99500;
  }
  return v7;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  self->_delegateQueue = 0;

  v3.receiver = self;
  v3.super_class = (Class)CMAPrecisionFindingManager;
  [(CMAPrecisionFindingManager *)&v3 dealloc];
}

- (void)startDeviceFindingUpdates
{
  if (qword_2681B9A60 != -1) {
    dispatch_once(&qword_2681B9A60, &unk_26DC29948);
  }
  objc_super v3 = qword_2681B9A68;
  if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_227B19000, v3, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,starting updates.", v6, 2u);
  }
  objc_msgSend_setDeviceFindingClient_(self, v4, 1, v5);
}

- (void)stopDeviceFindingUpdates
{
  if (qword_2681B9A60 != -1) {
    dispatch_once(&qword_2681B9A60, &unk_26DC29948);
  }
  objc_super v3 = qword_2681B9A68;
  if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_227B19000, v3, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,stopping updates.", v6, 2u);
  }
  objc_msgSend_setDeviceFindingClient_(self, v4, 0, v5);
}

- (void)updateDeviceMotion:(id)a3
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  if (objc_msgSend_deviceFindingClient(self, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_timestamp(a3, v6, v7, v8);
    *(void *)&long long v89 = v9;
    objc_msgSend_quaternion(a3, v10, v11, v12);
    *((void *)&v89 + 1) = v13;
    objc_msgSend_quaternion(a3, v14, v15, v16);
    *(void *)&long long v90 = v17;
    objc_msgSend_quaternion(a3, v18, v19, v20);
    *((void *)&v90 + 1) = v21;
    objc_msgSend_quaternion(a3, v22, v23, v24);
    *(void *)&long long v91 = v25;
    objc_msgSend_rotationRate(a3, v26, v27, v28);
    *((void *)&v91 + 1) = v29;
    objc_msgSend_rotationRate(a3, v30, v31, v32);
    *(void *)&long long v92 = v33;
    objc_msgSend_rotationRate(a3, v34, v35, v36);
    *((void *)&v92 + 1) = v37;
    objc_msgSend_acceleration(a3, v38, v39, v40);
    *(void *)&long long v93 = v41;
    objc_msgSend_acceleration(a3, v42, v43, v44);
    *((void *)&v93 + 1) = v45;
    objc_msgSend_acceleration(a3, v46, v47, v48);
    uint64_t v94 = v49;
    sub_227CA33B8((uint64_t)&self->_positionEstimator, (uint64_t)&v89);
    sub_227CA27C0((double *)&v89);
    v53 = objc_msgSend_analyticsManager(self, v50, v51, v52);
    v87[2] = v91;
    v87[3] = v92;
    v87[4] = v93;
    uint64_t v88 = v94;
    v87[0] = v89;
    v87[1] = v90;
    objc_msgSend_feedDeviceMotion_(v53, v54, (uint64_t)v87, v55);
    objc_msgSend_timestamp(a3, v56, v57, v58);
    unint64_t v60 = (unint64_t)(v59 * 1000000.0);
    unint64_t fMinimumToleratedDt = self->_deviceMotionDownsampler.fMinimumToleratedDt;
    if (fMinimumToleratedDt && self->_deviceMotionDownsampler.fLastTimestamp + fMinimumToleratedDt > v60)
    {
      os_log_type_t v62 = OS_LOG_TYPE_INFO;
    }
    else
    {
      os_log_type_t v62 = OS_LOG_TYPE_DEFAULT;
      self->_deviceMotionDownsampler.fLastTimestamp = v60;
    }
    if (qword_2681B9A60 != -1) {
      dispatch_once(&qword_2681B9A60, &unk_26DC29948);
    }
    v63 = qword_2681B9A68;
    if (os_log_type_enabled((os_log_t)qword_2681B9A68, v62))
    {
      objc_msgSend_timestamp(a3, v64, v65, v66);
      *(_DWORD *)buf = 134351616;
      *(void *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = *((void *)&v89 + 1);
      *(_WORD *)&buf[22] = 2050;
      *(void *)&buf[24] = v90;
      __int16 v96 = 2050;
      uint64_t v97 = *((void *)&v90 + 1);
      __int16 v98 = 2050;
      uint64_t v99 = v91;
      __int16 v100 = 2050;
      uint64_t v101 = *((void *)&v91 + 1);
      __int16 v102 = 2050;
      uint64_t v103 = v92;
      __int16 v104 = 2050;
      uint64_t v105 = *((void *)&v92 + 1);
      __int16 v106 = 2050;
      uint64_t v107 = v93;
      __int16 v108 = 2050;
      uint64_t v109 = *((void *)&v93 + 1);
      __int16 v110 = 2050;
      uint64_t v111 = v94;
      _os_log_impl(&dword_227B19000, v63, v62, "CMAPrecisionFindingManager,timestamp,%{public}f,quaternion.x,%{public}f,quaternion.y,%{public}f,quaternion.z,%{public}f,quaternion.w,%{public}f,rotationRate.x,%{public}f,rotationRate.y,%{public}f,rotationRate.z,%{public}f,acceleration.x,%{public}f,acceleration.y,%{public}f,acceleration.z,%{public}f", buf, 0x70u);
    }
    objc_msgSend_delegate(self, v64, v65, v66);
    if (objc_opt_respondsToSelector())
    {
      long long v71 = *(_OWORD *)&self->_positionEstimator.fPosition.horizontalAngleUncertainty;
      *(_OWORD *)buf = *(_OWORD *)&self->_positionEstimator.fPosition.timestamp;
      *(_OWORD *)&buf[16] = v71;
      long long v72 = *(_OWORD *)&self->_positionEstimator.fParticleFilterState.stateEstimate.__elems_[1];
      long long v85 = *(_OWORD *)&self->_positionEstimator.fParticleFilterState.timestamp;
      long long v86 = v72;
      v73 = objc_msgSend_delegateQueue(self, v68, v69, v70);
      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = sub_227CAA394;
      v80[3] = &unk_2648308A8;
      long long v81 = *(_OWORD *)buf;
      long long v82 = *(_OWORD *)&buf[16];
      long long v83 = v85;
      long long v84 = v86;
      v80[4] = self;
      v80[5] = a3;
      dispatch_async(v73, v80);
    }
    objc_msgSend_timestamp(a3, v68, v69, v70);
    unint64_t v78 = (unint64_t)(v77 * 1000000.0);
    unint64_t v79 = self->_analyticsDownsampler.fMinimumToleratedDt;
    if (!v79 || self->_analyticsDownsampler.fLastTimestamp + v79 <= v78)
    {
      self->_analyticsDownsampler.fLastTimestamp = v78;
      objc_msgSend_updateAnalytics(self, v74, v75, v76);
    }
  }
}

- (void)updatePeerState:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3);
  uint64_t v11 = v6;
  uint64_t v12 = objc_msgSend_motionState(a3, v7, v8, v9);
  sub_227CA4084((uint64_t)&self->_positionEstimator, (uint64_t)&v11);
  sub_227CA2990(&v11);
  if (qword_2681B9A60 != -1) {
    dispatch_once(&qword_2681B9A60, &unk_26DC29948);
  }
  uint64_t v10 = qword_2681B9A68;
  if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    uint64_t v14 = v11;
    __int16 v15 = 1026;
    int v16 = v12;
    _os_log_impl(&dword_227B19000, v10, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,timestamp,%{public}f,peerState,%{public}d", buf, 0x12u);
  }
}

- (void)updateRanging:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3);
  *(void *)&long long v32 = v6;
  objc_msgSend_range(a3, v7, v8, v9);
  *((void *)&v32 + 1) = v10;
  objc_msgSend_rangeError(a3, v11, v12, v13);
  *(void *)&long long v33 = v14;
  objc_msgSend_rssi(a3, v15, v16, v17);
  *((void *)&v33 + 1) = v18;
  uint64_t v34 = (unsigned __int16)objc_msgSend_cycleIndex(a3, v19, v20, v21);
  double v22 = sub_227CA3D50((uint64_t)&self->_positionEstimator, (uint64_t)&v32);
  v26 = objc_msgSend_analyticsManager(self, v23, v24, v25, v22);
  v30[0] = v32;
  v30[1] = v33;
  uint64_t v31 = v34;
  objc_msgSend_feedRange_(v26, v27, (uint64_t)v30, v28);
  sub_227CA2A30((double *)&v32);
  if (qword_2681B9A60 != -1) {
    dispatch_once(&qword_2681B9A60, &unk_26DC29948);
  }
  uint64_t v29 = qword_2681B9A68;
  if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349824;
    uint64_t v36 = v32;
    __int16 v37 = 2050;
    uint64_t v38 = *((void *)&v32 + 1);
    __int16 v39 = 2050;
    uint64_t v40 = *((void *)&v33 + 1);
    __int16 v41 = 1026;
    int v42 = (unsigned __int16)v34;
    _os_log_impl(&dword_227B19000, v29, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,timestamp,%{public}f,range,%{public}f,rssi,%{public}f,cycleIndex,%{public}d", buf, 0x26u);
  }
}

- (void)updateWatchOrientation:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3);
  uint64_t v20 = v6;
  LODWORD(v21) = objc_msgSend_wrist(a3, v7, v8, v9);
  HIDWORD(v21) = objc_msgSend_crown(a3, v10, v11, v12);
  double v13 = sub_227CA40F8((uint64_t)&self->_positionEstimator, (uint64_t)&v20);
  uint64_t v17 = objc_msgSend_analyticsManager(self, v14, v15, v16, v13);
  objc_msgSend_feedWatchOrientation_(v17, v18, v20, v21);
  sub_227CA2B5C((uint64_t)&v20);
  if (qword_2681B9A60 != -1) {
    dispatch_once(&qword_2681B9A60, &unk_26DC29948);
  }
  uint64_t v19 = qword_2681B9A68;
  if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349568;
    uint64_t v23 = v20;
    __int16 v24 = 1026;
    int v25 = v21;
    __int16 v26 = 1026;
    int v27 = HIDWORD(v21);
    _os_log_impl(&dword_227B19000, v19, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,timestamp,%{public}f,wrist,%{public}d,crown,%{public}d,", buf, 0x18u);
  }
}

- (void)updateAltimeterData:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_msgSend_machAbsoluteTimestamp(a3, a2, (uint64_t)a3, v3, 0);
  uint64_t v17 = v6;
  objc_msgSend_relativeAltitude(a3, v7, v8, v9);
  uint64_t v18 = v10;
  objc_msgSend_pressure(a3, v11, v12, v13);
  uint64_t v19 = v14;
  sub_227CA41E4((uint64_t)&self->_positionEstimator, (uint64_t)&v16);
  sub_227CA2D0C(&v16);
  if (qword_2681B9A60 != -1) {
    dispatch_once(&qword_2681B9A60, &unk_26DC29948);
  }
  uint64_t v15 = qword_2681B9A68;
  if (os_log_type_enabled((os_log_t)qword_2681B9A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349568;
    uint64_t v21 = v17;
    __int16 v22 = 2050;
    uint64_t v23 = v19;
    __int16 v24 = 2050;
    uint64_t v25 = v18;
    _os_log_impl(&dword_227B19000, v15, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,machAbsoluteTimestamp,%{public}f,pressure,%{public}f,relativeAltitude,%{public}f", buf, 0x20u);
  }
}

- (void)updateAnalytics
{
  objc_msgSend_delegate(self, a2, v2, v3);
  if (objc_opt_respondsToSelector())
  {
    if (self->_positionEstimator.fAcceptedRange.__engaged_)
    {
      uint64_t v8 = objc_msgSend_analyticsManager(self, v5, v6, v7);
      if (!self->_positionEstimator.fAcceptedRange.__engaged_) {
        sub_227CAB358();
      }
      long long v11 = *(_OWORD *)&self->_positionEstimator.fAcceptedRange.var0.__val_.rangeError;
      v14[0] = *(_OWORD *)&self->_positionEstimator.fAcceptedRange.var0.__null_state_;
      v14[1] = v11;
      uint64_t v15 = *(void *)&self->_positionEstimator.fAcceptedRange.var0.__val_.cycleIndex;
      objc_msgSend_feedAcceptedRange_(v8, v9, (uint64_t)v14, v10);
    }
    uint64_t v12 = objc_msgSend_delegateQueue(self, v5, v6, v7);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_227CAB13C;
    block[3] = &unk_264830740;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

- (CMAPrecisionFindingDelegate)delegate
{
  return (CMAPrecisionFindingDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (BOOL)deviceFindingClient
{
  return self->_deviceFindingClient;
}

- (void)setDeviceFindingClient:(BOOL)a3
{
  self->_deviceFindingClient = a3;
}

- (CMAPrecisionFindingAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  begin = self->_positionEstimator.fParticleFilter.fParticleFilter.fWeights.__begin_;
  if (begin)
  {
    self->_positionEstimator.fParticleFilter.fParticleFilter.fWeights.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_positionEstimator.fParticleFilter.fParticleFilter.fParticles.__begin_;
  if (v4)
  {
    self->_positionEstimator.fParticleFilter.fParticleFilter.fParticles.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_deviceMotionDownsampler.unint64_t fMinimumToleratedDt = xmmword_227CC66B0;
  self->_deviceMotionDownsampler._vptr$CMDownsampler = (void **)&unk_26DC29978;
  self->_positionDownsampler.fLastTimestamp = 0;
  self->_positionDownsampler.unint64_t fMinimumToleratedDt = 39500;
  self->_positionDownsampler._vptr$CMDownsampler = (void **)&unk_26DC29978;
  *(_OWORD *)&self->_analyticsDownsampler.unint64_t fMinimumToleratedDt = xmmword_227CC66B0;
  self->_analyticsDownsampler._vptr$CMDownsampler = (void **)&unk_26DC29978;
  return self;
}

@end