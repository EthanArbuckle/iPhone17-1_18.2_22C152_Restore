@interface CMAPencilFusion
- (BOOL)isRunning;
- (BOOL)mslEnabled;
- (BOOL)preciseTipPositionLoggingEnabled;
- (BOOL)startPencilFusionUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (BOOL)verboseLoggingEnabled;
- (CMAPencilFusion)init;
- (CMAPencilFusionResult)currentEstimation;
- (NSMutableArray)estimations;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)handler;
- (uint64_t)logHostDeviceMotionQuaternion:(uint64_t)a3 rotationRate:(uint64_t)a4 acceleration:(__n128)a5 timestamp:(__n128)a6;
- (uint64_t)logPencilDeviceMotionQuaternion:(uint64_t)a3 rotationRate:(uint64_t)a4 acceleration:(int)a5 gyroBias:(uint64_t)a6 temperatureGyroBias:(__n128)a7 temperatureGyro:(__n128)a8 status:(__n128)a9 sensorTime:(__n128)a10 timestamp:(double)a11;
- (unint64_t)currentEstimationUpdateIndex;
- (void)dealloc;
- (void)flushMSL;
- (void)logPencilFusionResult:(id)a3;
- (void)logTouchAltitudeAngle:(float)a3 altitudeAngleConfidence:(float)a4 azimuthAngle:(float)a5 azimuthAngleConfidence:(float)a6 position:(float)a7 positionConfidence:(double)a8 timestamp:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)readUserDefaults;
- (void)sendPencilGyroBiasAxisStatistics:(CMAPencilGyroBiasAxisStatistics *)a3 axis:(int)a4;
- (void)sendPencilSensorContactTypeStatistics:(CMAPencilSensorContactTypeStatistics *)a3 contactType:(int)a4;
- (void)sendPencilStatistics;
- (void)sendPencilTimingStatistics:(CMAPencilTimingStatistics *)a3;
- (void)setCurrentEstimationUpdateIndex:(unint64_t)a3;
- (void)setDefaults:(id)a3;
- (void)setEstimations:(id)a3;
- (void)setHandler:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setMslEnabled:(BOOL)a3;
- (void)setPreciseTipPositionLoggingEnabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setVerboseLoggingEnabled:(BOOL)a3;
- (void)startUserDefaults;
- (void)stopPencilFusionUpdates;
- (void)stopUserDefaults;
- (void)updateEstimationsWithRealValuesWithQuaternion:(CMOQuaternion)a3 timestamp:(double)a4;
- (void)updateHostDeviceMotionQuaternion:(uint64_t)a3 rotationRate:(uint64_t)a4 acceleration:(__n128)a5 timestamp:(__n128)a6;
- (void)updatePencilDeviceMotionPayload:(id)a3;
- (void)updateTouchAltitudeAngle:(float)a3 altitudeAngleConfidence:(float)a4 azimuthAngle:(float)a5 azimuthAngleConfidence:(float)a6 position:(float)a7 positionConfidence:(double)a8 timestamp:;
@end

@implementation CMAPencilFusion

- (CMAPencilFusion)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4.receiver = self;
  v4.super_class = (Class)CMAPencilFusion;
  v2 = [(CMAPencilFusion *)&v4 init];
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("CMAPencilFusion", 0);
    v2->_estimations = (NSMutableArray *)objc_opt_new();
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_msgSend_stopPencilFusionUpdates(self, a2, v2, v3);

  v5.receiver = self;
  v5.super_class = (Class)CMAPencilFusion;
  [(CMAPencilFusion *)&v5 dealloc];
}

- (BOOL)startPencilFusionUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29898);
  }
  v7 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_DEFAULT, "startPencilFusionUpdatesToQueue:withHandler:", buf, 2u);
  }
  objc_msgSend_startUserDefaults(self, v8, v9, v10);
  v14 = objc_msgSend_queue(self, v11, v12, v13);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_227CA6458;
  block[3] = &unk_264830718;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(v14, block);
  return objc_msgSend_isRunning(self, v15, v16, v17);
}

- (void)stopPencilFusionUpdates
{
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29898);
  }
  uint64_t v3 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227B19000, v3, OS_LOG_TYPE_DEFAULT, "stopPencilFusionUpdates", buf, 2u);
  }
  v7 = objc_msgSend_queue(self, v4, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_227CA65D4;
  block[3] = &unk_264830740;
  block[4] = self;
  dispatch_sync(v7, block);
  objc_msgSend_stopUserDefaults(self, v8, v9, v10);
  objc_msgSend_flushMSL(self, v11, v12, v13);
}

- (CMAPencilFusionResult)currentEstimation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = sub_227CA6804;
  v18 = sub_227CA6814;
  uint64_t v19 = 0;
  uint64_t v5 = objc_msgSend_queue(self, a2, v2, v3);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_227CA6820;
  v13[3] = &unk_264830768;
  v13[4] = self;
  v13[5] = &v14;
  dispatch_sync(v5, v13);
  if (objc_msgSend_verboseLoggingEnabled(self, v6, v7, v8))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29898);
    }
    uint64_t v9 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = v15[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_227B19000, v9, OS_LOG_TYPE_DEBUG, "Pulled estimated angles, %{public}@", buf, 0xCu);
    }
  }
  v11 = (CMAPencilFusionResult *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (void)updateTouchAltitudeAngle:(float)a3 altitudeAngleConfidence:(float)a4 azimuthAngle:(float)a5 azimuthAngleConfidence:(float)a6 position:(float)a7 positionConfidence:(double)a8 timestamp:
{
  uint64_t v11 = v10;
  float v12 = *(float *)&a8;
  long long v23 = *(_OWORD *)&a7;
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (objc_msgSend_verboseLoggingEnabled(self, a2, v8, v9))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29898);
    }
    uint64_t v21 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134351104;
      double v34 = (float)(a3 * 57.296);
      __int16 v35 = 2050;
      double v36 = a4;
      __int16 v37 = 2050;
      double v38 = (float)(a5 * 57.296);
      __int16 v39 = 2050;
      double v40 = a6;
      __int16 v41 = 2050;
      double v42 = (float)(floorf(*(float *)&v23 / 15.0) * 15.0);
      __int16 v43 = 2050;
      double v44 = (float)(floorf(*((float *)&v23 + 1) / 15.0) * 15.0);
      __int16 v45 = 2050;
      double v46 = *((float *)&v23 + 2);
      __int16 v47 = 2050;
      double v48 = v12;
      __int16 v49 = 2050;
      uint64_t v50 = v11;
      _os_log_impl(&dword_227B19000, v21, OS_LOG_TYPE_DEBUG, "updateTouchAltitudeAngle:%{public}.1f altitudeAngleConfidence:%{public}.2f azimuthAngle:%{public}.1f azimuthAngleConfidence:%{public}.2f position:[%{public}.1f, %{public}.1f, %{public}.1f] positionConfidence:%{public}.2f timestamp:%{public}f", buf, 0x5Cu);
    }
  }
  uint64_t v22 = objc_msgSend_queue(self, v18, v19, v20);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_227CA6A7C;
  block[3] = &unk_264830790;
  v26 = self;
  float v28 = a3;
  float v29 = a4;
  float v30 = a5;
  float v31 = a6;
  long long v25 = v23;
  float v32 = v12;
  uint64_t v27 = v11;
  dispatch_async(v22, block);
}

- (void)updatePencilDeviceMotionPayload:(id)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, v3) == 43)
  {
    v59[47] = 0;
    *(_DWORD *)&v59[43] = 0;
  }
  else if (objc_msgSend_length(a3, v6, v7, v8) != 48)
  {
    if (objc_msgSend_verboseLoggingEnabled(self, v6, v9, v10))
    {
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29898);
      }
      uint64_t v19 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        double v61 = COERCE_DOUBLE(objc_msgSend_length(a3, v20, v21, v22));
        __int16 v62 = 2050;
        uint64_t v63 = 48;
        uint64_t v16 = "updateHostDeviceMotionQuaternion: packet size %{public}zd != expected %{public}zd";
        uint64_t v17 = v19;
        uint32_t v18 = 22;
        goto LABEL_22;
      }
    }
    return;
  }
  objc_msgSend_getBytes_length_(a3, v6, (uint64_t)v59, 48);
  if (v59[0] == 136)
  {
    if ((v59[13] + 121) > 0xFDu)
    {
      v14.f32[0] = (float)*(__int16 *)&v59[23];
      v14.f32[1] = (float)*(__int16 *)&v59[25];
      v14.f32[2] = (float)*(__int16 *)&v59[27];
      v23.i64[0] = 0x3800000038000000;
      v23.i64[1] = 0x3800000038000000;
      float32x4_t v24 = vmulq_f32(v14, v23);
      float32x4_t v25 = vmulq_f32(v24, v24);
      float v39 = sqrtf(1.0- vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0]);
      float32x4_t v40 = v24;
      float32x4_t v26 = v24;
      v26.f32[3] = v39;
      float32x4_t v41 = v26;
      v26.f32[0] = (float)*(__int16 *)&v59[29];
      v26.f32[1] = (float)*(__int16 *)&v59[31];
      v26.f32[2] = (float)*(__int16 *)&v59[33];
      v23.i64[0] = 0x3B0000003B000000;
      v23.i64[1] = 0x3B0000003B000000;
      v24.f32[0] = (float)*(__int16 *)&v59[35];
      float32x4_t v27 = vmulq_f32(v26, v23);
      v24.f32[1] = (float)*(__int16 *)&v59[37];
      v24.f32[2] = (float)*(__int16 *)&v59[39];
      v26.i64[0] = 0x3A0000003A000000;
      v26.i64[1] = 0x3A0000003A000000;
      float32x4_t v28 = vmulq_f32(v24, v26);
      float32x4_t v43 = v28;
      float32x4_t v44 = v27;
      int v29 = *(unsigned __int16 *)&v59[41];
      uint64_t v30 = *(void *)&v59[15];
      double v31 = (double)*(unint64_t *)&v59[5] * 0.000001;
      v28.f32[0] = (float)v59[43];
      v28.f32[1] = (float)v59[44];
      v28.f32[2] = (float)v59[45];
      float32x4_t v42 = vmulq_f32(v28, (float32x4_t)vdupq_n_s32(0x3C800000u));
      int v32 = v59[46];
      int v33 = v59[47];
      if (objc_msgSend_verboseLoggingEnabled(self, v11, v12, v13))
      {
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29898);
        }
        __int16 v37 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134353408;
          double v61 = v40.f32[0];
          __int16 v62 = 2050;
          *(double *)&uint64_t v63 = v40.f32[1];
          __int16 v64 = 2050;
          double v65 = v40.f32[2];
          __int16 v66 = 2050;
          double v67 = v39;
          __int16 v68 = 2050;
          double v69 = v44.f32[0];
          __int16 v70 = 2050;
          double v71 = v44.f32[1];
          __int16 v72 = 2050;
          double v73 = v44.f32[2];
          __int16 v74 = 2050;
          double v75 = v43.f32[0];
          __int16 v76 = 2050;
          double v77 = v43.f32[1];
          __int16 v78 = 2050;
          double v79 = v43.f32[2];
          __int16 v80 = 2050;
          double v81 = v42.f32[0];
          __int16 v82 = 2050;
          double v83 = v42.f32[1];
          __int16 v84 = 2050;
          double v85 = v42.f32[2];
          __int16 v86 = 2050;
          double v87 = (double)v32;
          __int16 v88 = 2050;
          double v89 = (double)v33;
          __int16 v90 = 1026;
          int v91 = v29;
          __int16 v92 = 2050;
          uint64_t v93 = v30;
          __int16 v94 = 2050;
          double v95 = v31;
          _os_log_impl(&dword_227B19000, v37, OS_LOG_TYPE_DEBUG, "updatePencilDeviceMotionPayload:[%{public}f, %{public}f, %{public}f, %{public}f] rotationRate:[%{public}f, %{public}f, %{public}f]  acceleration:[%{public}f, %{public}f, %{public}f] gyroBias:[%{public}f, %{public}f, %{public}f] temperatureGyroBias:%{public}f temperatureGyro:%{public}f status:0x%{public}.4x timestamp:%{public}llu timestamp:%{public}f", buf, 0xB2u);
        }
      }
      double v38 = objc_msgSend_queue(self, v34, v35, v36);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      long long v56 = *(_OWORD *)v59;
      block[2] = sub_227CA71DC;
      block[3] = &unk_2648307B8;
      long long v57 = *(_OWORD *)&v59[16];
      long long v58 = *(_OWORD *)&v59[32];
      float32x4_t v46 = v41;
      float32x4_t v47 = v44;
      float32x4_t v48 = v43;
      float32x4_t v49 = v42;
      float v53 = (float)v32;
      float v54 = (float)v33;
      __int16 v55 = v29;
      uint64_t v50 = self;
      uint64_t v51 = v30;
      double v52 = v31;
      dispatch_async(v38, block);
    }
    else if (objc_msgSend_verboseLoggingEnabled(self, v11, v12, v13))
    {
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29898);
      }
      uint64_t v15 = qword_2681B9A78;
      if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "updateHostDeviceMotionQuaternion: unknown data type";
LABEL_16:
        uint64_t v17 = v15;
        uint32_t v18 = 2;
LABEL_22:
        _os_log_impl(&dword_227B19000, v17, OS_LOG_TYPE_DEBUG, v16, buf, v18);
      }
    }
  }
  else if (objc_msgSend_verboseLoggingEnabled(self, v11, v12, v13))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29898);
    }
    uint64_t v15 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "updateHostDeviceMotionQuaternion: unknown packet report ID";
      goto LABEL_16;
    }
  }
}

- (void)updateHostDeviceMotionQuaternion:(uint64_t)a3 rotationRate:(uint64_t)a4 acceleration:(__n128)a5 timestamp:(__n128)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (objc_msgSend_verboseLoggingEnabled(a1, a2, a3, a4))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29898);
    }
    uint64_t v13 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134351616;
      double v25 = a5.n128_f32[0];
      __int16 v26 = 2050;
      double v27 = a5.n128_f32[1];
      __int16 v28 = 2050;
      double v29 = a5.n128_f32[2];
      __int16 v30 = 2050;
      double v31 = a5.n128_f32[3];
      __int16 v32 = 2050;
      double v33 = a6.n128_f32[0];
      __int16 v34 = 2050;
      double v35 = a6.n128_f32[1];
      __int16 v36 = 2050;
      double v37 = a6.n128_f32[2];
      __int16 v38 = 2050;
      double v39 = a7.n128_f32[0];
      __int16 v40 = 2050;
      double v41 = a7.n128_f32[1];
      __int16 v42 = 2050;
      double v43 = a7.n128_f32[2];
      __int16 v44 = 2050;
      double v45 = a8;
      _os_log_impl(&dword_227B19000, v13, OS_LOG_TYPE_DEBUG, "updateHostDeviceMotionQuaternion:[%{public}f, %{public}f, %{public}f, %{public}f] rotationRate:[%{public}f, %{public}f, %{public}f]  acceleration:[%{public}f, %{public}f, %{public}f] timestamp:%{public}f", buf, 0x70u);
    }
  }
  float32x4_t v14 = objc_msgSend_queue(a1, v10, v11, v12);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_227CA74C0;
  block[3] = &unk_2648307E0;
  uint64_t v22 = a1;
  double v23 = a8;
  __n128 v19 = a5;
  __n128 v20 = a6;
  __n128 v21 = a7;
  dispatch_async(v14, block);
}

- (void)updateEstimationsWithRealValuesWithQuaternion:(CMOQuaternion)a3 timestamp:(double)a4
{
  double v6 = *(double *)a3.var0;
  uint64_t v7 = (float32x2_t *)v4;
  uint64_t v101 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_queue(self, a2, v4, v5, *(double *)a3.var0, *(double *)&a3.var0[1], *(double *)&a3.var0[2], *(double *)&a3.var0[3], a4);
  dispatch_assert_queue_V2(v9);
  __int32 v10 = v7[1].i32[1];
  v11.f32[0] = -v7[1].f32[0];
  *(float32x2_t *)buf = vneg_f32(*v7);
  *(_DWORD *)&buf[8] = v11.i32[0];
  *(_DWORD *)uint64_t v96 = v10;
  sub_227CA506C((float32x4_t *)buf, v11);
  float v12 = sub_227C8E390((float *)buf);
  float v14 = v13;
  float v16 = v15;
  if (objc_msgSend_verboseLoggingEnabled(self, v17, v18, v19))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29898);
    }
    double v23 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349824;
      *(double *)&uint8_t buf[4] = (float)(v12 * 57.296);
      *(_WORD *)uint64_t v96 = 2050;
      *(double *)&v96[2] = (float)(v14 * 57.296);
      __int16 v97 = 2050;
      double v98 = (float)(v16 * 57.296);
      __int16 v99 = 2050;
      double v100 = v6;
      _os_log_impl(&dword_227B19000, v23, OS_LOG_TYPE_DEBUG, "updateEstimationsWithRealValuesWithQuaternion angles:[%{public}.1f, %{public}.1f, %{public}.1f] timestamp:%{public}.3f", buf, 0x2Au);
    }
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  float32x4_t v24 = objc_msgSend_estimations(self, v20, v21, v22);
  id v28 = (id)objc_msgSend_copy(v24, v25, v26, v27);
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v90, (uint64_t)v94, 16);
  if (v30)
  {
    uint64_t v35 = v30;
    uint64_t v36 = *(void *)v91;
    *(void *)&long long v34 = 134349056;
    long long v88 = v34;
    while (2)
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v91 != v36) {
          objc_enumerationMutation(v28);
        }
        __int16 v38 = *(void **)(*((void *)&v90 + 1) + 8 * v37);
        objc_msgSend_timestamp(v38, v31, v32, v33, v88);
        if (v42 >= v6 + -0.001)
        {
          objc_msgSend_timestamp(v38, v39, v40, v41);
          if (v54 <= v6 + 0.001)
          {
            long long v56 = objc_msgSend_copy(v38, v51, v52, v53);
            objc_msgSend_setEstimated_(v56, v57, 0, v58);
            *(float *)&double v59 = v12;
            objc_msgSend_setAltitudeAngle_(v56, v60, v61, v62, v59);
            *(float *)&double v63 = v14;
            objc_msgSend_setAzimuthAngle_(v56, v64, v65, v66, v63);
            *(float *)&double v67 = v16;
            objc_msgSend_setRollAngle_(v56, v68, v69, v70, v67);
            if (objc_msgSend_mslEnabled(self, v71, v72, v73)) {
              objc_msgSend_logPencilFusionResult_(self, v74, (uint64_t)v56, v76);
            }
            if (objc_msgSend_verboseLoggingEnabled(self, v74, v75, v76))
            {
              if (qword_2681B9A70 != -1) {
                dispatch_once(&qword_2681B9A70, &unk_26DC29898);
              }
              __int16 v80 = qword_2681B9A78;
              if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v56;
                _os_log_impl(&dword_227B19000, v80, OS_LOG_TYPE_DEBUG, "Pushing real angles, %{public}@", buf, 0xCu);
              }
            }
            double v81 = objc_msgSend_handlerQueue(self, v77, v78, v79);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = sub_227CA7A34;
            block[3] = &unk_264830808;
            void block[4] = self;
            void block[5] = v56;
            dispatch_async(v81, block);

            double v85 = objc_msgSend_estimations(self, v82, v83, v84);
            objc_msgSend_removeObject_(v85, v86, (uint64_t)v38, v87);
          }
          else
          {
            if (qword_2681B9A70 != -1) {
              dispatch_once(&qword_2681B9A70, &unk_26DC29898);
            }
            __int16 v55 = qword_2681B9A78;
            if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v88;
              *(double *)&uint8_t buf[4] = v6;
              _os_log_impl(&dword_227B19000, v55, OS_LOG_TYPE_DEBUG, "Received real angles for timestamp %{public}.3f without corresponding estimation", buf, 0xCu);
            }
          }
          return;
        }
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29898);
        }
        double v43 = qword_2681B9A78;
        if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_timestamp(v38, v44, v45, v46);
          *(_DWORD *)buf = v88;
          *(void *)&uint8_t buf[4] = v47;
          _os_log_impl(&dword_227B19000, v43, OS_LOG_TYPE_DEBUG, "Missing real angles for timestamp %{public}.3f", buf, 0xCu);
        }
        float32x4_t v48 = objc_msgSend_estimations(self, v44, v45, v46);
        objc_msgSend_removeObject_(v48, v49, (uint64_t)v38, v50);
        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v90, (uint64_t)v94, 16);
      if (v35) {
        continue;
      }
      break;
    }
  }
}

- (void)startUserDefaults
{
  if (!objc_msgSend_defaults(self, a2, v2, v3))
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA40]);
    id v8 = (id)objc_msgSend_initWithSuiteName_(v5, v6, @"com.apple.CoreMotionAlgorithms.PencilFusion", v7);
    objc_msgSend_setDefaults_(self, v9, (uint64_t)v8, v10);
    for (uint64_t i = 0; i != 3; ++i)
    {
      float v15 = off_264830828[i];
      float v16 = objc_msgSend_defaults(self, v11, v12, v13);
      uint64_t v20 = objc_msgSend_defaults(self, v17, v18, v19);
      objc_msgSend_addObserver_forKeyPath_options_context_(v16, v21, (uint64_t)self, (uint64_t)v15, 1, v20);
    }
    MEMORY[0x270F9A6D0](self, sel_readUserDefaults, v12, v13);
  }
}

- (void)stopUserDefaults
{
  if (objc_msgSend_defaults(self, a2, v2, v3))
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v9 = off_264830828[i];
      uint64_t v10 = objc_msgSend_defaults(self, v5, v6, v7);
      objc_msgSend_removeObserver_forKeyPath_(v10, v11, (uint64_t)self, (uint64_t)v9);
    }
    objc_msgSend_setDefaults_(self, v5, 0, v7);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend_defaults(self, a2, (uint64_t)a3, (uint64_t)a4) == a6)
  {
    MEMORY[0x270F9A6D0](self, sel_readUserDefaults, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CMAPencilFusion;
    [(CMAPencilFusion *)&v13 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (void)readUserDefaults
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_defaults(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_BOOLForKey_(v5, v6, @"VerboseLoggingEnabled", v7);
  objc_msgSend_setVerboseLoggingEnabled_(self, v9, v8, v10);
  float v14 = objc_msgSend_defaults(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_BOOLForKey_(v14, v15, @"MSLEnabled", v16);
  objc_msgSend_setMslEnabled_(self, v18, v17, v19);
  double v23 = objc_msgSend_defaults(self, v20, v21, v22);
  uint64_t v26 = objc_msgSend_BOOLForKey_(v23, v24, @"PreciseTipPositionLoggingEnabled", v25);
  objc_msgSend_setPreciseTipPositionLoggingEnabled_(self, v27, v26, v28);
  if (qword_2681B9A70 != -1) {
    dispatch_once(&qword_2681B9A70, &unk_26DC29898);
  }
  double v29 = qword_2681B9A78;
  if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEFAULT))
  {
    v36[0] = 67240448;
    v36[1] = objc_msgSend_verboseLoggingEnabled(self, v30, v31, v32);
    __int16 v37 = 1026;
    int v38 = objc_msgSend_mslEnabled(self, v33, v34, v35);
    _os_log_impl(&dword_227B19000, v29, OS_LOG_TYPE_DEFAULT, "verboseLoggingEnabled: %{public}d, mslEnabled: %{public}d", (uint8_t *)v36, 0xEu);
  }
}

- (void)logPencilFusionResult:(id)a3
{
  uint64_t v6 = objc_msgSend_queue(self, a2, (uint64_t)a3, v3);
  dispatch_assert_queue_V2(v6);
  sub_227BE19AC(v65);
  sub_227C041E8((uint64_t)v65);
  uint64_t v7 = v66;
  objc_msgSend_timestamp(a3, v8, v9, v10);
  *(_WORD *)(v7 + 76) |= 0x10u;
  *(void *)(v7 + 40) = v11;
  uint64_t v12 = v66;
  if (objc_msgSend_preciseTipPositionLoggingEnabled(self, v13, v14, v15))
  {
    objc_msgSend_position(a3, v16, v17, v18);
  }
  else
  {
    objc_msgSend_position(a3, v16, v17, v18);
    float v22 = floorf(v23 / 15.0) * 15.0;
  }
  *(_WORD *)(v12 + 76) |= 0x20u;
  *(double *)(v12 + 48) = v22;
  uint64_t v24 = v66;
  if (objc_msgSend_preciseTipPositionLoggingEnabled(self, v19, v20, v21))
  {
    objc_msgSend_position(a3, v25, v26, v27);
    float v32 = v31;
  }
  else
  {
    objc_msgSend_position(a3, v25, v26, v27);
    float v32 = floorf(v33 / 15.0) * 15.0;
  }
  *(_WORD *)(v24 + 76) |= 0x40u;
  *(double *)(v24 + 56) = v32;
  uint64_t v34 = v66;
  objc_msgSend_position(a3, v28, v29, v30);
  *(_WORD *)(v34 + 76) |= 0x80u;
  *(double *)(v34 + 64) = v35;
  uint64_t v36 = v66;
  objc_msgSend_altitudeAngle(a3, v37, v38, v39);
  *(_WORD *)(v36 + 76) |= 1u;
  *(double *)(v36 + 8) = v40;
  uint64_t v41 = v66;
  objc_msgSend_azimuthAngle(a3, v42, v43, v44);
  *(_WORD *)(v41 + 76) |= 2u;
  *(double *)(v41 + 16) = v45;
  uint64_t v46 = v66;
  objc_msgSend_rollAngle(a3, v47, v48, v49);
  *(_WORD *)(v46 + 76) |= 8u;
  *(double *)(v46 + 32) = v50;
  uint64_t v51 = v66;
  updated = objc_msgSend_estimationUpdateIndex(a3, v52, v53, v54);
  uint64_t v59 = objc_msgSend_unsignedLongLongValue(updated, v56, v57, v58);
  *(_WORD *)(v51 + 76) |= 4u;
  *(void *)(v51 + 24) = v59;
  uint64_t v60 = v66;
  char v64 = objc_msgSend_estimated(a3, v61, v62, v63);
  *(_WORD *)(v60 + 76) |= 0x100u;
  *(unsigned char *)(v60 + 72) = v64;
  sub_227CA175C((uint64_t)v65);
  sub_227BE6EB4((PB::Base *)v65);
}

- (void)logTouchAltitudeAngle:(float)a3 altitudeAngleConfidence:(float)a4 azimuthAngle:(float)a5 azimuthAngleConfidence:(float)a6 position:(float)a7 positionConfidence:(double)a8 timestamp:
{
  uint64_t v11 = v10;
  float v12 = *(float *)&a8;
  *(_OWORD *)uint64_t v38 = *(_OWORD *)&a7;
  uint64_t v18 = objc_msgSend_queue(self, a2, v8, v9);
  dispatch_assert_queue_V2(v18);
  sub_227BE19AC(v39);
  sub_227C040C8((uint64_t)v39);
  uint64_t v19 = v40;
  *(_WORD *)(v40 + 88) |= 0x20u;
  *(void *)(v19 + 48) = v11;
  uint64_t v20 = v40;
  char v24 = objc_msgSend_preciseTipPositionLoggingEnabled(self, v21, v22, v23);
  float v28 = v38[0];
  if ((v24 & 1) == 0) {
    float v28 = floorf(v38[0] / 15.0) * 15.0;
  }
  *(_WORD *)(v20 + 88) |= 0x40u;
  *(double *)(v20 + 56) = v28;
  uint64_t v29 = v40;
  char v30 = objc_msgSend_preciseTipPositionLoggingEnabled(self, v25, v26, v27);
  float v31 = v38[1];
  if ((v30 & 1) == 0) {
    float v31 = floorf(v38[1] / 15.0) * 15.0;
  }
  *(_WORD *)(v29 + 88) |= 0x80u;
  *(double *)(v29 + 64) = v31;
  uint64_t v32 = v40;
  *(_WORD *)(v40 + 88) |= 0x100u;
  *(double *)(v32 + 72) = v38[2];
  uint64_t v33 = v40;
  *(_WORD *)(v40 + 88) |= 1u;
  *(double *)(v33 + 8) = a3;
  uint64_t v34 = v40;
  *(_WORD *)(v40 + 88) |= 4u;
  *(double *)(v34 + 24) = a5;
  uint64_t v35 = v40;
  *(_WORD *)(v40 + 88) |= 2u;
  *(double *)(v35 + 16) = a4;
  uint64_t v36 = v40;
  *(_WORD *)(v40 + 88) |= 8u;
  *(double *)(v36 + 32) = a6;
  uint64_t v37 = v40;
  *(_WORD *)(v40 + 88) |= 0x10u;
  *(double *)(v37 + 40) = v12;
  sub_227CA175C((uint64_t)v39);
  sub_227BE6EB4((PB::Base *)v39);
}

- (uint64_t)logPencilDeviceMotionQuaternion:(uint64_t)a3 rotationRate:(uint64_t)a4 acceleration:(int)a5 gyroBias:(uint64_t)a6 temperatureGyroBias:(__n128)a7 temperatureGyro:(__n128)a8 status:(__n128)a9 sensorTime:(__n128)a10 timestamp:(double)a11
{
  int v14 = a4;
  int v15 = a3;
  uint64_t v16 = objc_msgSend_queue(a1, a2, a3, a4);
  dispatch_assert_queue_V2(v16);
  sub_227BE19AC(v204);
  sub_227C04158((uint64_t)v204);
  sub_227C67A84(v205);
  uint64_t v17 = *(void *)(v205 + 32);
  *(unsigned char *)(v17 + 152) |= 2u;
  *(double *)(v17 + 136) = a11;
  uint64_t v18 = *(void **)(v205 + 32);
  uint64_t v19 = (char *)v18[8];
  unint64_t v20 = v18[9];
  if ((unint64_t)v19 >= v20)
  {
    uint64_t v23 = (char *)v18[7];
    uint64_t v24 = (v19 - v23) >> 2;
    if ((unint64_t)(v24 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v25 = v20 - (void)v23;
    unint64_t v26 = (uint64_t)(v20 - (void)v23) >> 1;
    if (v26 <= v24 + 1) {
      unint64_t v26 = v24 + 1;
    }
    if (v25 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v27 = v26;
    }
    if (v27)
    {
      float v28 = (char *)sub_227B8BBB8((uint64_t)(v18 + 9), v27);
      uint64_t v23 = (char *)v18[7];
      uint64_t v19 = (char *)v18[8];
    }
    else
    {
      float v28 = 0;
    }
    uint64_t v29 = &v28[4 * v24];
    char v30 = &v28[4 * v27];
    *(_DWORD *)uint64_t v29 = a7.n128_u32[0];
    uint64_t v22 = v29 + 4;
    while (v19 != v23)
    {
      int v31 = *((_DWORD *)v19 - 1);
      v19 -= 4;
      *((_DWORD *)v29 - 1) = v31;
      v29 -= 4;
    }
    v18[7] = v29;
    v18[8] = v22;
    v18[9] = v30;
    if (v23) {
      operator delete(v23);
    }
    unsigned __int32 v21 = a7.n128_u32[1];
  }
  else
  {
    unsigned __int32 v21 = a7.n128_u32[1];
    *(_DWORD *)uint64_t v19 = a7.n128_u32[0];
    uint64_t v22 = v19 + 4;
  }
  v18[8] = v22;
  uint64_t v32 = *(void **)(v205 + 32);
  unsigned __int32 v33 = v21;
  uint64_t v34 = (unsigned __int32 *)v32[8];
  unint64_t v35 = v32[9];
  if ((unint64_t)v34 >= v35)
  {
    uint64_t v37 = (unsigned __int32 *)v32[7];
    uint64_t v38 = v34 - v37;
    if ((unint64_t)(v38 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v39 = v35 - (void)v37;
    unint64_t v40 = (uint64_t)(v35 - (void)v37) >> 1;
    if (v40 <= v38 + 1) {
      unint64_t v40 = v38 + 1;
    }
    if (v39 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v41 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v41 = v40;
    }
    if (v41)
    {
      double v42 = (char *)sub_227B8BBB8((uint64_t)(v32 + 9), v41);
      uint64_t v37 = (unsigned __int32 *)v32[7];
      uint64_t v34 = (unsigned __int32 *)v32[8];
    }
    else
    {
      double v42 = 0;
    }
    uint64_t v43 = (unsigned __int32 *)&v42[4 * v38];
    uint64_t v44 = &v42[4 * v41];
    *uint64_t v43 = v33;
    uint64_t v36 = v43 + 1;
    while (v34 != v37)
    {
      unsigned __int32 v45 = *--v34;
      *--uint64_t v43 = v45;
    }
    v32[7] = v43;
    v32[8] = v36;
    v32[9] = v44;
    if (v37) {
      operator delete(v37);
    }
  }
  else
  {
    *uint64_t v34 = v21;
    uint64_t v36 = v34 + 1;
  }
  v32[8] = v36;
  uint64_t v46 = *(void **)(v205 + 32);
  uint64_t v47 = (char *)v46[8];
  unint64_t v48 = v46[9];
  if ((unint64_t)v47 >= v48)
  {
    float v50 = (char *)v46[7];
    uint64_t v51 = (v47 - v50) >> 2;
    if ((unint64_t)(v51 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v52 = v48 - (void)v50;
    unint64_t v53 = (uint64_t)(v48 - (void)v50) >> 1;
    if (v53 <= v51 + 1) {
      unint64_t v53 = v51 + 1;
    }
    if (v52 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v54 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v54 = v53;
    }
    if (v54)
    {
      __int16 v55 = (char *)sub_227B8BBB8((uint64_t)(v46 + 9), v54);
      float v50 = (char *)v46[7];
      uint64_t v47 = (char *)v46[8];
    }
    else
    {
      __int16 v55 = 0;
    }
    long long v56 = &v55[4 * v51];
    uint64_t v57 = &v55[4 * v54];
    *(_DWORD *)long long v56 = a7.n128_u32[2];
    uint64_t v49 = v56 + 4;
    while (v47 != v50)
    {
      int v58 = *((_DWORD *)v47 - 1);
      v47 -= 4;
      *((_DWORD *)v56 - 1) = v58;
      v56 -= 4;
    }
    v46[7] = v56;
    v46[8] = v49;
    v46[9] = v57;
    if (v50) {
      operator delete(v50);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v47 = a7.n128_u32[2];
    uint64_t v49 = v47 + 4;
  }
  v46[8] = v49;
  uint64_t v59 = *(void **)(v205 + 32);
  uint64_t v60 = (char *)v59[8];
  unint64_t v61 = v59[9];
  if ((unint64_t)v60 >= v61)
  {
    uint64_t v63 = (char *)v59[7];
    uint64_t v64 = (v60 - v63) >> 2;
    if ((unint64_t)(v64 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v65 = v61 - (void)v63;
    unint64_t v66 = (uint64_t)(v61 - (void)v63) >> 1;
    if (v66 <= v64 + 1) {
      unint64_t v66 = v64 + 1;
    }
    if (v65 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v67 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v67 = v66;
    }
    if (v67)
    {
      __int16 v68 = (char *)sub_227B8BBB8((uint64_t)(v59 + 9), v67);
      uint64_t v63 = (char *)v59[7];
      uint64_t v60 = (char *)v59[8];
    }
    else
    {
      __int16 v68 = 0;
    }
    uint64_t v69 = &v68[4 * v64];
    uint64_t v70 = &v68[4 * v67];
    *(_DWORD *)uint64_t v69 = a7.n128_u32[3];
    uint64_t v62 = v69 + 4;
    while (v60 != v63)
    {
      int v71 = *((_DWORD *)v60 - 1);
      v60 -= 4;
      *((_DWORD *)v69 - 1) = v71;
      v69 -= 4;
    }
    v59[7] = v69;
    v59[8] = v62;
    v59[9] = v70;
    if (v63) {
      operator delete(v63);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v60 = a7.n128_u32[3];
    uint64_t v62 = v60 + 4;
  }
  v59[8] = v62;
  uint64_t v72 = *(void **)(v205 + 32);
  uint64_t v73 = (char *)v72[14];
  unint64_t v74 = v72[15];
  if ((unint64_t)v73 >= v74)
  {
    double v77 = (char *)v72[13];
    uint64_t v78 = (v73 - v77) >> 2;
    if ((unint64_t)(v78 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v79 = v74 - (void)v77;
    unint64_t v80 = (uint64_t)(v74 - (void)v77) >> 1;
    if (v80 <= v78 + 1) {
      unint64_t v80 = v78 + 1;
    }
    if (v79 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v81 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v81 = v80;
    }
    if (v81)
    {
      __int16 v82 = (char *)sub_227B8BBB8((uint64_t)(v72 + 15), v81);
      double v77 = (char *)v72[13];
      uint64_t v73 = (char *)v72[14];
    }
    else
    {
      __int16 v82 = 0;
    }
    uint64_t v83 = &v82[4 * v78];
    uint64_t v84 = &v82[4 * v81];
    *(_DWORD *)uint64_t v83 = a9.n128_u32[0];
    uint64_t v76 = v83 + 4;
    while (v73 != v77)
    {
      int v85 = *((_DWORD *)v73 - 1);
      v73 -= 4;
      *((_DWORD *)v83 - 1) = v85;
      v83 -= 4;
    }
    v72[13] = v83;
    v72[14] = v76;
    v72[15] = v84;
    if (v77) {
      operator delete(v77);
    }
    unsigned __int32 v75 = a9.n128_u32[1];
  }
  else
  {
    unsigned __int32 v75 = a9.n128_u32[1];
    *(_DWORD *)uint64_t v73 = a9.n128_u32[0];
    uint64_t v76 = v73 + 4;
  }
  v72[14] = v76;
  __int16 v86 = *(void **)(v205 + 32);
  unsigned __int32 v87 = v75;
  long long v88 = (unsigned __int32 *)v86[14];
  unint64_t v89 = v86[15];
  if ((unint64_t)v88 >= v89)
  {
    long long v91 = (unsigned __int32 *)v86[13];
    uint64_t v92 = v88 - v91;
    if ((unint64_t)(v92 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v93 = v89 - (void)v91;
    unint64_t v94 = (uint64_t)(v89 - (void)v91) >> 1;
    if (v94 <= v92 + 1) {
      unint64_t v94 = v92 + 1;
    }
    if (v93 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v95 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v95 = v94;
    }
    if (v95)
    {
      uint64_t v96 = (char *)sub_227B8BBB8((uint64_t)(v86 + 15), v95);
      long long v91 = (unsigned __int32 *)v86[13];
      long long v88 = (unsigned __int32 *)v86[14];
    }
    else
    {
      uint64_t v96 = 0;
    }
    __int16 v97 = (unsigned __int32 *)&v96[4 * v92];
    double v98 = &v96[4 * v95];
    *__int16 v97 = v87;
    long long v90 = v97 + 1;
    while (v88 != v91)
    {
      unsigned __int32 v99 = *--v88;
      *--__int16 v97 = v99;
    }
    v86[13] = v97;
    v86[14] = v90;
    v86[15] = v98;
    if (v91) {
      operator delete(v91);
    }
  }
  else
  {
    *long long v88 = v75;
    long long v90 = v88 + 1;
  }
  v86[14] = v90;
  double v100 = *(void **)(v205 + 32);
  uint64_t v101 = (char *)v100[14];
  unint64_t v102 = v100[15];
  if ((unint64_t)v101 >= v102)
  {
    v104 = (char *)v100[13];
    uint64_t v105 = (v101 - v104) >> 2;
    if ((unint64_t)(v105 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v106 = v102 - (void)v104;
    unint64_t v107 = (uint64_t)(v102 - (void)v104) >> 1;
    if (v107 <= v105 + 1) {
      unint64_t v107 = v105 + 1;
    }
    if (v106 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v108 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v108 = v107;
    }
    if (v108)
    {
      v109 = (char *)sub_227B8BBB8((uint64_t)(v100 + 15), v108);
      v104 = (char *)v100[13];
      uint64_t v101 = (char *)v100[14];
    }
    else
    {
      v109 = 0;
    }
    v110 = &v109[4 * v105];
    v111 = &v109[4 * v108];
    *(_DWORD *)v110 = a9.n128_u32[2];
    v103 = v110 + 4;
    while (v101 != v104)
    {
      int v112 = *((_DWORD *)v101 - 1);
      v101 -= 4;
      *((_DWORD *)v110 - 1) = v112;
      v110 -= 4;
    }
    v100[13] = v110;
    v100[14] = v103;
    v100[15] = v111;
    if (v104) {
      operator delete(v104);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v101 = a9.n128_u32[2];
    v103 = v101 + 4;
  }
  v100[14] = v103;
  v113 = *(void **)(v205 + 32);
  v114 = (char *)v113[11];
  unint64_t v115 = v113[12];
  if ((unint64_t)v114 >= v115)
  {
    v118 = (char *)v113[10];
    uint64_t v119 = (v114 - v118) >> 2;
    if ((unint64_t)(v119 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v120 = v115 - (void)v118;
    unint64_t v121 = (uint64_t)(v115 - (void)v118) >> 1;
    if (v121 <= v119 + 1) {
      unint64_t v121 = v119 + 1;
    }
    if (v120 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v122 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v122 = v121;
    }
    if (v122)
    {
      v123 = (char *)sub_227B8BBB8((uint64_t)(v113 + 12), v122);
      v118 = (char *)v113[10];
      v114 = (char *)v113[11];
    }
    else
    {
      v123 = 0;
    }
    v124 = &v123[4 * v119];
    v125 = &v123[4 * v122];
    *(_DWORD *)v124 = a8.n128_u32[0];
    v117 = v124 + 4;
    while (v114 != v118)
    {
      int v126 = *((_DWORD *)v114 - 1);
      v114 -= 4;
      *((_DWORD *)v124 - 1) = v126;
      v124 -= 4;
    }
    v113[10] = v124;
    v113[11] = v117;
    v113[12] = v125;
    if (v118) {
      operator delete(v118);
    }
    unsigned __int32 v116 = a8.n128_u32[1];
  }
  else
  {
    unsigned __int32 v116 = a8.n128_u32[1];
    *(_DWORD *)v114 = a8.n128_u32[0];
    v117 = v114 + 4;
  }
  v113[11] = v117;
  v127 = *(void **)(v205 + 32);
  unsigned __int32 v128 = v116;
  v129 = (unsigned __int32 *)v127[11];
  unint64_t v130 = v127[12];
  if ((unint64_t)v129 >= v130)
  {
    v132 = (unsigned __int32 *)v127[10];
    uint64_t v133 = v129 - v132;
    if ((unint64_t)(v133 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v134 = v130 - (void)v132;
    unint64_t v135 = (uint64_t)(v130 - (void)v132) >> 1;
    if (v135 <= v133 + 1) {
      unint64_t v135 = v133 + 1;
    }
    if (v134 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v136 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v136 = v135;
    }
    if (v136)
    {
      v137 = (char *)sub_227B8BBB8((uint64_t)(v127 + 12), v136);
      v132 = (unsigned __int32 *)v127[10];
      v129 = (unsigned __int32 *)v127[11];
    }
    else
    {
      v137 = 0;
    }
    v138 = (unsigned __int32 *)&v137[4 * v133];
    v139 = &v137[4 * v136];
    unsigned __int32 *v138 = v128;
    v131 = v138 + 1;
    while (v129 != v132)
    {
      unsigned __int32 v140 = *--v129;
      *--v138 = v140;
    }
    v127[10] = v138;
    v127[11] = v131;
    v127[12] = v139;
    if (v132) {
      operator delete(v132);
    }
  }
  else
  {
    unsigned __int32 *v129 = v116;
    v131 = v129 + 1;
  }
  v127[11] = v131;
  v141 = *(void **)(v205 + 32);
  v142 = (char *)v141[11];
  unint64_t v143 = v141[12];
  if ((unint64_t)v142 >= v143)
  {
    v145 = (char *)v141[10];
    uint64_t v146 = (v142 - v145) >> 2;
    if ((unint64_t)(v146 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v147 = v143 - (void)v145;
    unint64_t v148 = (uint64_t)(v143 - (void)v145) >> 1;
    if (v148 <= v146 + 1) {
      unint64_t v148 = v146 + 1;
    }
    if (v147 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v149 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v149 = v148;
    }
    if (v149)
    {
      v150 = (char *)sub_227B8BBB8((uint64_t)(v141 + 12), v149);
      v145 = (char *)v141[10];
      v142 = (char *)v141[11];
    }
    else
    {
      v150 = 0;
    }
    v151 = &v150[4 * v146];
    v152 = &v150[4 * v149];
    *(_DWORD *)v151 = a8.n128_u32[2];
    v144 = v151 + 4;
    while (v142 != v145)
    {
      int v153 = *((_DWORD *)v142 - 1);
      v142 -= 4;
      *((_DWORD *)v151 - 1) = v153;
      v151 -= 4;
    }
    v141[10] = v151;
    v141[11] = v144;
    v141[12] = v152;
    if (v145) {
      operator delete(v145);
    }
  }
  else
  {
    *(_DWORD *)v142 = a8.n128_u32[2];
    v144 = v142 + 4;
  }
  v141[11] = v144;
  v154 = (void *)v205;
  v155 = *(char **)(v205 + 16);
  unint64_t v156 = *(void *)(v205 + 24);
  if ((unint64_t)v155 >= v156)
  {
    v159 = *(char **)(v205 + 8);
    uint64_t v160 = (v155 - v159) >> 2;
    if ((unint64_t)(v160 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v161 = v156 - (void)v159;
    unint64_t v162 = (uint64_t)(v156 - (void)v159) >> 1;
    if (v162 <= v160 + 1) {
      unint64_t v162 = v160 + 1;
    }
    if (v161 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v163 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v163 = v162;
    }
    if (v163)
    {
      v164 = (char *)sub_227B8BBB8(v205 + 24, v163);
      v159 = (char *)v154[1];
      v155 = (char *)v154[2];
    }
    else
    {
      v164 = 0;
    }
    v165 = &v164[4 * v160];
    v166 = &v164[4 * v163];
    *(_DWORD *)v165 = a10.n128_u32[0];
    v158 = v165 + 4;
    while (v155 != v159)
    {
      int v167 = *((_DWORD *)v155 - 1);
      v155 -= 4;
      *((_DWORD *)v165 - 1) = v167;
      v165 -= 4;
    }
    v154[1] = v165;
    v154[2] = v158;
    v154[3] = v166;
    if (v159) {
      operator delete(v159);
    }
    unsigned __int32 v157 = a10.n128_u32[1];
  }
  else
  {
    unsigned __int32 v157 = a10.n128_u32[1];
    *(_DWORD *)v155 = a10.n128_u32[0];
    v158 = v155 + 4;
  }
  v154[2] = v158;
  v168 = (void *)v205;
  unsigned __int32 v169 = v157;
  v170 = *(unsigned __int32 **)(v205 + 16);
  unint64_t v171 = *(void *)(v205 + 24);
  if ((unint64_t)v170 >= v171)
  {
    v173 = *(unsigned __int32 **)(v205 + 8);
    uint64_t v174 = v170 - v173;
    if ((unint64_t)(v174 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v175 = v171 - (void)v173;
    unint64_t v176 = (uint64_t)(v171 - (void)v173) >> 1;
    if (v176 <= v174 + 1) {
      unint64_t v176 = v174 + 1;
    }
    if (v175 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v177 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v177 = v176;
    }
    if (v177)
    {
      v178 = (char *)sub_227B8BBB8(v205 + 24, v177);
      v173 = (unsigned __int32 *)v168[1];
      v170 = (unsigned __int32 *)v168[2];
    }
    else
    {
      v178 = 0;
    }
    v179 = (unsigned __int32 *)&v178[4 * v174];
    v180 = &v178[4 * v177];
    unsigned __int32 *v179 = v169;
    v172 = v179 + 1;
    while (v170 != v173)
    {
      unsigned __int32 v181 = *--v170;
      *--v179 = v181;
    }
    v168[1] = v179;
    v168[2] = v172;
    v168[3] = v180;
    if (v173) {
      operator delete(v173);
    }
  }
  else
  {
    unsigned __int32 *v170 = v157;
    v172 = v170 + 1;
  }
  v168[2] = v172;
  v182 = (void *)v205;
  v183 = *(char **)(v205 + 16);
  unint64_t v184 = *(void *)(v205 + 24);
  if ((unint64_t)v183 >= v184)
  {
    v186 = *(char **)(v205 + 8);
    uint64_t v187 = (v183 - v186) >> 2;
    if ((unint64_t)(v187 + 1) >> 62) {
      sub_227B8B89C();
    }
    unint64_t v188 = v184 - (void)v186;
    unint64_t v189 = (uint64_t)(v184 - (void)v186) >> 1;
    if (v189 <= v187 + 1) {
      unint64_t v189 = v187 + 1;
    }
    if (v188 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v190 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v190 = v189;
    }
    if (v190)
    {
      v191 = (char *)sub_227B8BBB8(v205 + 24, v190);
      v186 = (char *)v182[1];
      v183 = (char *)v182[2];
    }
    else
    {
      v191 = 0;
    }
    v192 = &v191[4 * v187];
    v193 = &v191[4 * v190];
    *(_DWORD *)v192 = a10.n128_u32[2];
    v185 = v192 + 4;
    while (v183 != v186)
    {
      int v194 = *((_DWORD *)v183 - 1);
      v183 -= 4;
      *((_DWORD *)v192 - 1) = v194;
      v192 -= 4;
    }
    v182[1] = v192;
    v182[2] = v185;
    v182[3] = v193;
    if (v186) {
      operator delete(v186);
    }
  }
  else
  {
    *(_DWORD *)v183 = a10.n128_u32[2];
    v185 = v183 + 4;
  }
  v182[2] = v185;
  uint64_t v195 = v205;
  *(unsigned char *)(v205 + 48) |= 2u;
  *(float *)(v195 + 44) = (float)v15;
  uint64_t v196 = v205;
  *(unsigned char *)(v205 + 48) |= 1u;
  *(float *)(v196 + 40) = (float)v14;
  uint64_t v197 = *(void *)(v205 + 32);
  *(unsigned char *)(v197 + 152) |= 4u;
  *(_DWORD *)(v197 + 144) = a5;
  uint64_t v198 = *(void *)(v205 + 32);
  *(unsigned char *)(v198 + 152) |= 1u;
  *(void *)(v198 + 128) = a6;
  sub_227CA175C((uint64_t)v204);
  return sub_227BE6EB4((PB::Base *)v204);
}

- (uint64_t)logHostDeviceMotionQuaternion:(uint64_t)a3 rotationRate:(uint64_t)a4 acceleration:(__n128)a5 timestamp:(__n128)a6
{
  uint64_t v9 = objc_msgSend_queue(a1, a2, a3, a4);
  dispatch_assert_queue_V2(v9);
  sub_227BE19AC(v25);
  sub_227C04278((uint64_t)v25);
  uint64_t v10 = v26;
  *(_DWORD *)(v26 + 124) |= 0x10u;
  *(double *)(v10 + 40) = a8;
  uint64_t v11 = v26;
  *(_DWORD *)(v26 + 124) |= 2u;
  *(double *)(v11 + 16) = a5.n128_f32[0];
  uint64_t v12 = v26;
  *(_DWORD *)(v26 + 124) |= 4u;
  *(double *)(v12 + 24) = a5.n128_f32[1];
  uint64_t v13 = v26;
  *(_DWORD *)(v26 + 124) |= 8u;
  *(double *)(v13 + 32) = a5.n128_f32[2];
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 124) |= 1u;
  *(double *)(v14 + 8) = a5.n128_f32[3];
  uint64_t v15 = v26;
  *(_DWORD *)(v26 + 124) |= 0x40000u;
  *(_DWORD *)(v15 + 100) = a7.n128_u32[0];
  uint64_t v16 = v26;
  *(_DWORD *)(v26 + 124) |= 0x80000u;
  *(_DWORD *)(v16 + 104) = a7.n128_u32[1];
  uint64_t v17 = v26;
  *(_DWORD *)(v26 + 124) |= 0x100000u;
  *(_DWORD *)(v17 + 108) = a7.n128_u32[2];
  uint64_t v18 = v26;
  *(_DWORD *)(v26 + 124) |= 0x2000u;
  *(_DWORD *)(v18 + 80) = a6.n128_u32[0];
  uint64_t v19 = v26;
  *(_DWORD *)(v26 + 124) |= 0x4000u;
  *(_DWORD *)(v19 + 84) = a6.n128_u32[1];
  uint64_t v20 = v26;
  *(_DWORD *)(v26 + 124) |= 0x8000u;
  *(_DWORD *)(v20 + 88) = a6.n128_u32[2];
  sub_227CA175C((uint64_t)v25);
  return sub_227BE6EB4((PB::Base *)v25);
}

- (void)setMslEnabled:(BOOL)a3
{
  if (!a3) {
    objc_msgSend_flushMSL(self, a2, a3, v3);
  }
  self->_mslEnabled = a3;
}

- (void)flushMSL
{
  if (objc_msgSend_mslEnabled(self, a2, v2, v3))
  {
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29898);
    }
    uint64_t v4 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_227B19000, v4, OS_LOG_TYPE_DEBUG, "Flushing MSL", v6, 2u);
    }
    uint64_t v5 = sub_227CA15F4();
    sub_227B8DC14(v5);
  }
}

- (void)setPreciseTipPositionLoggingEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (objc_msgSend_preciseTipPositionLoggingEnabled(self, a2, a3, v3) != a3)
  {
    self->_preciseTipPositionLoggingEnabled = v4;
    if (qword_2681B9A70 != -1) {
      dispatch_once(&qword_2681B9A70, &unk_26DC29898);
    }
    uint64_t v6 = qword_2681B9A78;
    if (os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG))
    {
      v9[0] = 67109120;
      v9[1] = v4;
      _os_log_impl(&dword_227B19000, v6, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilFusion] Setting preciseTipPositionLoggingEnabled to %d", (uint8_t *)v9, 8u);
      if (v4)
      {
        if (qword_2681B9A70 != -1) {
          dispatch_once(&qword_2681B9A70, &unk_26DC29898);
        }
        goto LABEL_9;
      }
      if (qword_2681B9A70 != -1) {
        dispatch_once(&qword_2681B9A70, &unk_26DC29898);
      }
    }
    else if (v4)
    {
LABEL_9:
      uint64_t v7 = qword_2681B9A78;
      if (!os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      LOWORD(v9[0]) = 0;
      uint64_t v8 = "[BarrelRoll]:[CMAPencilFusion] Logging pencil tip position in full input precision in accordance with the ass"
           "ociated user defaults setting.";
LABEL_15:
      _os_log_impl(&dword_227B19000, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)v9, 2u);
      return;
    }
    uint64_t v7 = qword_2681B9A78;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A78, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    LOWORD(v9[0]) = 0;
    uint64_t v8 = "[BarrelRoll]:[CMAPencilFusion] Logging pencil tip position in quantized  precision in accordance with the assoc"
         "iated user defaults setting.";
    goto LABEL_15;
  }
}

- (void)sendPencilStatistics
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = (char *)self->_barrelRollService.__ptr_.__value_ + 10032;
  memset(v18, 0, sizeof(v18));
  BOOL v4 = v18;
  sub_227C8A550((uint64_t)v3, (uint64_t)v18);
  for (uint64_t i = 0; i != 3; ++i)
  {
    long long v7 = v4[3];
    v16[2] = v4[2];
    v16[3] = v7;
    uint64_t v17 = *((void *)v4 + 8);
    long long v8 = v4[1];
    v16[0] = *v4;
    v16[1] = v8;
    objc_msgSend_sendPencilGyroBiasAxisStatistics_axis_(self, v5, (uint64_t)v16, i);
    BOOL v4 = (_OWORD *)((char *)v4 + 72);
  }
  uint64_t v9 = 0;
  uint64_t v10 = (_OWORD *)((char *)&v18[13] + 8);
  do
  {
    long long v11 = v10[1];
    v14[0] = *v10;
    v14[1] = v11;
    v15[0] = v10[2];
    *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)((char *)v10 + 44);
    objc_msgSend_sendPencilSensorContactTypeStatistics_contactType_(self, v5, (uint64_t)v14, v9++);
    uint64_t v10 = (_OWORD *)((char *)v10 + 60);
  }
  while (v9 != 3);
  v13[2] = v21;
  v13[3] = v22;
  v13[4] = v23;
  v13[5] = v24;
  v13[0] = v19;
  v13[1] = v20;
  objc_msgSend_sendPencilTimingStatistics_(self, v5, (uint64_t)v13, v12);
}

- (void)sendPencilGyroBiasAxisStatistics:(CMAPencilGyroBiasAxisStatistics *)a3 axis:(int)a4
{
}

- (void)sendPencilSensorContactTypeStatistics:(CMAPencilSensorContactTypeStatistics *)a3 contactType:(int)a4
{
}

- (void)sendPencilTimingStatistics:(CMAPencilTimingStatistics *)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSMutableArray)estimations
{
  return self->_estimations;
}

- (void)setEstimations:(id)a3
{
}

- (unint64_t)currentEstimationUpdateIndex
{
  return self->_currentEstimationUpdateIndex;
}

- (void)setCurrentEstimationUpdateIndex:(unint64_t)a3
{
  self->_currentEstimationUpdateIndex = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (BOOL)verboseLoggingEnabled
{
  return self->_verboseLoggingEnabled;
}

- (void)setVerboseLoggingEnabled:(BOOL)a3
{
  self->_verboseLoggingEnabled = a3;
}

- (BOOL)mslEnabled
{
  return self->_mslEnabled;
}

- (BOOL)preciseTipPositionLoggingEnabled
{
  return self->_preciseTipPositionLoggingEnabled;
}

- (void).cxx_destruct
{
  value = self->_barrelRollService.__ptr_.__value_;
  self->_barrelRollService.__ptr_.__value_ = 0;
  if (value) {
    sub_227CA9AF4(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end