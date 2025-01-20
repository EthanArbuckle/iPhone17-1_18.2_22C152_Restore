@interface JTMotionData
+ (id)sharedInstance;
- ($01BB1521EC52D44A8E7628F5261DCEC8)currentAttitude;
- ($01BB1521EC52D44A8E7628F5261DCEC8)currentOrientation;
- ($01BB1521EC52D44A8E7628F5261DCEC8)getOrientation:(id)result;
- ($01BB1521EC52D44A8E7628F5261DCEC8)syntheticOrientation;
- (BOOL)started;
- (CMAttitude)refAttitude;
- (CMMotionManager)motionManager;
- (JTMotionData)init;
- (NSOperationQueue)motionQueue;
- (double)pitchRadians;
- (double)rollRadians;
- (double)yawRadians;
- (void)setCurrentAttitude:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)setMotionQueue:(id)a3;
- (void)setPitchRadians:(double)a3;
- (void)setRefAttitude:(id)a3;
- (void)setRollRadians:(double)a3;
- (void)setStarted:(BOOL)a3;
- (void)setYawRadians:(double)a3;
- (void)startMotion;
- (void)stopMotion;
@end

@implementation JTMotionData

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__JTMotionData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_sharedMotionData;
  return v2;
}

uint64_t __30__JTMotionData_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedMotionData = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (JTMotionData)init
{
  v6.receiver = self;
  v6.super_class = (Class)JTMotionData;
  v2 = [(JTMotionData *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F01788]);
    [(JTMotionData *)v2 setMotionManager:v3];
    [v3 setDeviceMotionUpdateInterval:0.0333333333];
    id v4 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v4 setName:@"motion queue"];
    [(JTMotionData *)v2 setMotionQueue:v4];
  }
  return v2;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)getOrientation:(id)result
{
  if (result.var0 == 0.0 && result.var1 == 0.0 && result.var2 == 0.0 && result.var3 == 0.0)
  {
    *(void *)&result.var0 = getOrientation__previous_value_0;
    *(void *)&result.var1 = getOrientation__previous_value_1;
    *(void *)&result.var2 = getOrientation__previous_value_2;
    *(void *)&result.var3 = getOrientation__previous_value_3;
  }
  else
  {
    getOrientation__previous_value_0 = *(void *)&result.var0;
    getOrientation__previous_value_1 = *(void *)&result.var1;
    getOrientation__previous_value_2 = *(void *)&result.var2;
    getOrientation__previous_value_3 = *(void *)&result.var3;
  }
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)syntheticOrientation
{
  int v2 = syntheticOrientation_i % 720;
  long double v3 = sin(((double)v2 / 719.0 + (double)v2 / 719.0) * 3.14159265);
  syntheticOrientation_i = v2 + 1;
  __double2 v5 = __sincos_stret(v3 * 1.57079633 * 0.5);
  v4.f64[0] = v5.__sinval;
  float64x2_t v6 = vmulq_n_f64((float64x2_t)xmmword_234D61130, v5.__sinval);
  *(void *)&v4.f64[0] = *(_OWORD *)&vmulq_f64(v4, (float64x2_t)0);
  v4.f64[1] = v5.__cosval;
  float64x2_t v7 = vnegq_f64(v6);
  float64x2_t v8 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)vnegq_f64(v4), 8uLL);
  float64x2_t v9 = (float64x2_t)vdupq_n_s64(0x3FE6839557CA3B94uLL);
  float64x2_t v10 = vmlaq_f64(vmulq_f64(v4, (float64x2_t)0), v9, v8);
  float64x2_t v11 = (float64x2_t)vdupq_n_s64(0x3FE6BD826298E569uLL);
  float64x2_t v12 = vmulq_f64(v4, v11);
  float64x2_t v13 = vmlaq_f64(vmulq_f64(v6, v11), (float64x2_t)0, (float64x2_t)vextq_s8((int8x16_t)v7, (int8x16_t)v6, 8uLL));
  float64x2_t v14 = vaddq_f64(vmlaq_f64(v12, (float64x2_t)0, v8), vmlaq_f64(vmulq_f64(v7, (float64x2_t)0), v9, (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)v7, 8uLL)));
  float64x2_t v15 = vaddq_f64(v13, v10);
  double v16 = v15.f64[1];
  double v17 = v14.f64[1];
  result.var2 = v14.f64[0];
  result.var0 = v15.f64[0];
  result.var3 = v17;
  result.var1 = v16;
  return result;
}

- (void)startMotion
{
  int v2 = self;
  objc_sync_enter(v2);
  v2->_started = 1;
  long double v3 = [(JTMotionData *)v2 motionManager];
  float64x2_t v4 = [v3 deviceMotion];
  uint64_t v5 = [v4 attitude];
  refAttitude = v2->_refAttitude;
  v2->_refAttitude = (CMAttitude *)v5;

  float64x2_t v7 = [(JTMotionData *)v2 motionManager];
  float64x2_t v8 = [(JTMotionData *)v2 motionQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__JTMotionData_startMotion__block_invoke;
  v9[3] = &unk_264C0B1E0;
  v9[4] = v2;
  [v7 startDeviceMotionUpdatesUsingReferenceFrame:4 toQueue:v8 withHandler:v9];

  objc_sync_exit(v2);
}

void __27__JTMotionData_startMotion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v98 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  float64x2_t v7 = [v98 attitude];
  [v7 quaternion];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "getOrientation:", v9, v11, v13, v15);
  v17.f64[0] = v16;
  v17.f64[1] = v18;
  v20.f64[0] = v19;
  v20.f64[1] = v21;
  int8x16_t v22 = (int8x16_t)vnegq_f64(v20);
  float64x2_t v23 = vmulq_f64(v17, (float64x2_t)xmmword_234D61370);
  float64x2_t v87 = vmulq_f64(v20, (float64x2_t)0);
  float64x2_t v88 = vmulq_f64(v23, (float64x2_t)0);
  float64x2_t v90 = (float64x2_t)vextq_s8(v22, (int8x16_t)v20, 8uLL);
  float64x2_t v92 = (float64x2_t)vextq_s8((int8x16_t)v23, (int8x16_t)vnegq_f64(v23), 8uLL);
  float64x2_t v86 = (float64x2_t)vextq_s8((int8x16_t)v20, v22, 8uLL);
  float64x2_t v24 = vaddq_f64(v86, vmlaq_f64(v88, (float64x2_t)0, v92));
  float64x2_t v25 = vaddq_f64(v92, vmlaq_f64(v87, (float64x2_t)0, v90));
  float64x2_t v26 = vnegq_f64(v24);
  float64x2_t v27 = (float64x2_t)vextq_s8((int8x16_t)v25, (int8x16_t)vnegq_f64(v25), 8uLL);
  uint64_t v95 = *(void *)&v19;
  double v96 = v21;
  double v97 = v18;
  uint64_t v94 = *(void *)&v16;
  float64x2_t v83 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v25, v18), v27, v16), vmlaq_n_f64(vmulq_n_f64(v26, v21), (float64x2_t)vextq_s8((int8x16_t)v24, (int8x16_t)v26, 8uLL), v19));
  float64x2_t v84 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v24, v18), (float64x2_t)vextq_s8((int8x16_t)v26, (int8x16_t)v24, 8uLL), v16), vmlaq_n_f64(vmulq_n_f64(v25, v21), v27, v19));
  double v28 = v83.f64[0] + vaddvq_f64(vmulq_f64(v84, (float64x2_t)0));
  if (v28 <= 1.0) {
    double v29 = v28;
  }
  else {
    double v29 = 1.0;
  }
  if (v28 >= -1.0) {
    double v30 = v29;
  }
  else {
    double v30 = -1.0;
  }
  long double v31 = acos(v30);
  double v32 = 0.0;
  if (v31 > 0.00001)
  {
    float64x2_t v33 = vmulq_f64(v83, (float64x2_t)0);
    float64x2_t v34 = vmulq_f64(v84, (float64x2_t)xmmword_234D61140);
    v34.f64[0] = v33.f64[0] + vaddvq_f64(v34);
    v33.f64[0] = v33.f64[0] + vaddvq_f64(vmulq_f64(v84, (float64x2_t)xmmword_234D61130));
    float64x2_t v35 = vmulq_f64(v33, (float64x2_t)0);
    float64x2_t v36 = vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_234D61130, v33.f64[0]), (float64x2_t)xmmword_234D61140, v34.f64[0]);
    float64x2_t v37 = vmlaq_f64(v35, (float64x2_t)0, v34);
    float64x2_t v38 = vmulq_f64(v37, v37);
    v38.f64[0] = 1.0 / sqrt(v38.f64[0] + vaddvq_f64(vmulq_f64(v36, v36)));
    float64x2_t v85 = vmulq_n_f64(v36, v38.f64[0]);
    float64x2_t v82 = vmulq_f64(vmulq_f64(v37, v38), (float64x2_t)0);
    double v39 = v82.f64[0] + vaddvq_f64(vmulq_f64(v85, (float64x2_t)xmmword_234D61140));
    if (v39 <= 1.0) {
      double v40 = v39;
    }
    else {
      double v40 = 1.0;
    }
    if (v39 >= -1.0) {
      double v41 = v40;
    }
    else {
      double v41 = -1.0;
    }
    double v42 = acos(v41);
    if (v82.f64[0] + vaddvq_f64(vmulq_f64(v85, (float64x2_t)xmmword_234D61130)) < 0.0) {
      double v42 = 6.28318531 - v42;
    }
    double v32 = v42 + 1.57079633;
  }
  double v43 = fmod(v32, 6.28318531);
  if (v32 < 0.0) {
    double v43 = v43 + 6.28318531;
  }
  objc_msgSend(*(id *)(a1 + 32), "setYawRadians:", v43, *(_OWORD *)&v82);
  float64x2_t v44 = (float64x2_t)vdupq_lane_s64(v95, 0);
  float64x2_t v45 = (float64x2_t)vdupq_lane_s64(v94, 0);
  float64x2_t v46 = vmlaq_f64(vaddq_f64(v90, v87), (float64x2_t)0, v92);
  float64x2_t v47 = vmlaq_f64(vaddq_f64(v92, v88), (float64x2_t)0, v86);
  float64x2_t v48 = vnegq_f64(v47);
  float64x2_t v49 = (float64x2_t)vextq_s8((int8x16_t)v46, (int8x16_t)vnegq_f64(v46), 8uLL);
  float64x2_t v91 = vaddq_f64(vmlaq_f64(vmulq_n_f64(v47, v97), (float64x2_t)vextq_s8((int8x16_t)v48, (int8x16_t)v47, 8uLL), v45), vmlaq_f64(vmulq_n_f64(v46, v96), v49, v44));
  float64x2_t v93 = vaddq_f64(vmlaq_f64(vmulq_n_f64(v46, v97), v49, v45), vmlaq_f64(vmulq_n_f64(v48, v96), (float64x2_t)vextq_s8((int8x16_t)v47, (int8x16_t)v48, 8uLL), v44));
  __double2 v50 = __sincos_stret(v32 * 0.5);
  float64x2_t v89 = vmulq_n_f64((float64x2_t)0, v50.__sinval);
  __double2 v52 = __sincos_stret(v31 * 0.5);
  v51.f64[0] = v52.__sinval;
  v53.i64[0] = *(_OWORD *)&vmulq_f64(v51, (float64x2_t)0);
  v53.i64[1] = *(void *)&v52.__cosval;
  float64x2_t v54 = vmulq_n_f64((float64x2_t)xmmword_234D61140, v52.__sinval);
  float64x2_t v55 = vnegq_f64(v54);
  float64x2_t v56 = (float64x2_t)vextq_s8(v53, (int8x16_t)vnegq_f64((float64x2_t)v53), 8uLL);
  float64x2_t v57 = vmlaq_n_f64(vmulq_n_f64(v54, v50.__cosval), (float64x2_t)vextq_s8((int8x16_t)v55, (int8x16_t)v54, 8uLL), v50.__sinval);
  float64x2_t v58 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)v53, v50.__cosval), v56, v50.__sinval), vmlaq_n_f64(vmulq_laneq_f64(v55, v89, 1), (float64x2_t)vextq_s8((int8x16_t)v54, (int8x16_t)v55, 8uLL), v89.f64[0]));
  float64x2_t v59 = vaddq_f64(v57, vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)v53, v89, 1), v56, v89.f64[0]));
  int8x16_t v60 = (int8x16_t)vnegq_f64(v59);
  float64x2_t v61 = vmulq_f64(v58, (float64x2_t)xmmword_234D61370);
  float64x2_t v62 = (float64x2_t)vextq_s8((int8x16_t)v59, v60, 8uLL);
  float64x2_t v63 = (float64x2_t)vextq_s8((int8x16_t)v61, (int8x16_t)vnegq_f64(v61), 8uLL);
  float64x2_t v64 = (float64x2_t)vextq_s8(v60, (int8x16_t)v59, 8uLL);
  float64x2_t v65 = vmulq_f64(v61, (float64x2_t)0);
  float64x2_t v66 = vmlaq_f64(vmlaq_f64(v59, (float64x2_t)0, v64), (float64x2_t)0, v63);
  float64x2_t v67 = vmlaq_f64(vmlaq_f64(v61, (float64x2_t)0, v63), (float64x2_t)0, v62);
  float64x2_t v68 = vnegq_f64(v67);
  float64x2_t v69 = (float64x2_t)vextq_s8((int8x16_t)v66, (int8x16_t)vnegq_f64(v66), 8uLL);
  double v70 = vmulq_f64(v93, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v66, v58, 1), v69, v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v68, v59, 1), (float64x2_t)vextq_s8((int8x16_t)v67, (int8x16_t)v68, 8uLL), v59.f64[0]))).f64[0]+ vaddvq_f64(vmulq_f64(v91, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v67, v58, 1), (float64x2_t)vextq_s8((int8x16_t)v68, (int8x16_t)v67, 8uLL), v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v66, v59, 1), v69, v59.f64[0]))));
  float64x2_t v71 = vmlaq_f64(vaddq_f64(v64, vmulq_f64(v59, (float64x2_t)0)), (float64x2_t)0, v63);
  float64x2_t v72 = vmlaq_f64(vaddq_f64(v63, v65), (float64x2_t)0, v62);
  float64x2_t v73 = vnegq_f64(v72);
  float64x2_t v74 = (float64x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)vnegq_f64(v71), 8uLL);
  double v75 = vmulq_f64(v93, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v71, v58, 1), v74, v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v73, v59, 1), (float64x2_t)vextq_s8((int8x16_t)v72, (int8x16_t)v73, 8uLL), v59.f64[0]))).f64[0]+ vaddvq_f64(vmulq_f64(v91, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v72, v58, 1), (float64x2_t)vextq_s8((int8x16_t)v73, (int8x16_t)v72, 8uLL), v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v71, v59, 1), v74, v59.f64[0]))));
  double v76 = 1.0;
  if (v75 <= 1.0) {
    double v76 = v75;
  }
  if (v75 >= -1.0) {
    double v77 = v76;
  }
  else {
    double v77 = -1.0;
  }
  double v78 = acos(v77);
  if (v70 <= 0.0) {
    double v79 = v78;
  }
  else {
    double v79 = -v78;
  }
  double v80 = fmod(v79, 6.28318531);
  if (v79 < 0.0) {
    double v80 = v80 + 6.28318531;
  }
  [*(id *)(a1 + 32) setRollRadians:v80];
  double v81 = fmod(v31, 6.28318531);
  if (v31 < 0.0) {
    double v81 = v81 + 6.28318531;
  }
  [*(id *)(a1 + 32) setPitchRadians:v81];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAttitude:", *(double *)&v95, v96, *(double *)&v94, v97);
  objc_sync_exit(v6);
}

- (void)stopMotion
{
  obj = self;
  objc_sync_enter(obj);
  int v2 = obj;
  if (obj->_started)
  {
    long double v3 = [(JTMotionData *)obj motionManager];
    [v3 stopDeviceMotionUpdates];

    int v2 = obj;
  }
  objc_sync_exit(v2);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)currentOrientation
{
  int v2 = self;
  objc_sync_enter(v2);
  double x = v2->_currentAttitude.x;
  double y = v2->_currentAttitude.y;
  double z = v2->_currentAttitude.z;
  double w = v2->_currentAttitude.w;
  objc_sync_exit(v2);

  double v7 = x;
  double v8 = y;
  double v9 = z;
  double v10 = w;
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)yawRadians
{
  int v2 = self;
  objc_sync_enter(v2);
  double yawRadians = v2->_yawRadians;
  objc_sync_exit(v2);

  return yawRadians;
}

- (double)rollRadians
{
  int v2 = self;
  objc_sync_enter(v2);
  double rollRadians = v2->_rollRadians;
  objc_sync_exit(v2);

  return rollRadians;
}

- (double)pitchRadians
{
  int v2 = self;
  objc_sync_enter(v2);
  double pitchRadians = v2->_pitchRadians;
  objc_sync_exit(v2);

  return pitchRadians;
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (NSOperationQueue)motionQueue
{
  return self->_motionQueue;
}

- (void)setMotionQueue:(id)a3
{
}

- (CMAttitude)refAttitude
{
  return self->_refAttitude;
}

- (void)setRefAttitude:(id)a3
{
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)currentAttitude
{
  double x = self->_currentAttitude.x;
  double y = self->_currentAttitude.y;
  double z = self->_currentAttitude.z;
  double w = self->_currentAttitude.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setCurrentAttitude:(id)a3
{
  self->_currentAttitude = ($BD458D890A0AD74B3ABF726E1329EF14)a3;
}

- (void)setYawRadians:(double)a3
{
  self->_double yawRadians = a3;
}

- (void)setRollRadians:(double)a3
{
  self->_double rollRadians = a3;
}

- (void)setPitchRadians:(double)a3
{
  self->_double pitchRadians = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refAttitude, 0);
  objc_storeStrong((id *)&self->_motionQueue, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end