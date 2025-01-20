@interface CMADeviceMotionVisionFusionPlayer
- (BOOL)isARSessionActive;
- (BOOL)isFusionEnabled;
- (BOOL)isPlayerActive;
- (CMADeviceMotionVisionFusionPlayer)init;
- (float)magneticDeclination;
- (id).cxx_construct;
- (id)getFusedDeviceMotionFrom:(id)a3;
- (id)getFusedDeviceMotionFrom:(id)a3 andAttitudeReferenceFrame:(unint64_t)a4;
- (void)reset;
- (void)setArSessionActive:(BOOL)a3;
- (void)setEnableFusion:(BOOL)a3;
- (void)setFusionEnabled:(BOOL)a3;
- (void)setPlayerActive:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)updateARSessionState:(unint64_t)a3;
- (void)updateLocation:(id)a3;
- (void)updateVLLocalizationResult:(id)a3;
@end

@implementation CMADeviceMotionVisionFusionPlayer

- (CMADeviceMotionVisionFusionPlayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMADeviceMotionVisionFusionPlayer;
  v2 = [(CMADeviceMotionVisionFusionPlayer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_fusionEnabled = 1;
    sub_227C93060("/System/Library/Frameworks/CoreLocation.framework/Support/WMM.dat");
    v3->fMagneticDeclination = 0.0;
    v3->fMagneticDeclinationTimestamp = -1.0;
    operator new();
  }
  return 0;
}

- (void)setEnableFusion:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isPlayerActive(self, a2, a3, v3))
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    v6 = qword_2681B9A88;
    if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disable";
      if (v4) {
        v7 = "enable";
      }
      int v8 = 136315138;
      v9 = v7;
      _os_log_impl(&dword_227B19000, v6, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, cannot %s fusion while player is active", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    self->_fusionEnabled = v4;
  }
}

- (void)start
{
  objc_sync_enter(self);
  if (objc_msgSend_isPlayerActive(self, v3, v4, v5))
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    v9 = qword_2681B9A88;
    if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_227B19000, v9, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, player is already active - nothing to start", v12, 2u);
    }
  }
  else
  {
    objc_msgSend_reset(self, v6, v7, v8);
    objc_msgSend_setPlayerActive_(self, v10, 1, v11);
  }
  objc_sync_exit(self);
}

- (void)stop
{
  objc_sync_enter(self);
  if (objc_msgSend_isPlayerActive(self, v3, v4, v5))
  {
    objc_msgSend_setPlayerActive_(self, v6, 0, v7);
  }
  else
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    uint64_t v8 = qword_2681B9A88;
    if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_227B19000, v8, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, player is already inactive - nothing to stop", v9, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)updateARSessionState:(unint64_t)a3
{
  objc_sync_enter(self);
  if (objc_msgSend_isPlayerActive(self, v5, v6, v7))
  {
    objc_msgSend_setArSessionActive_(self, v8, a3 == 1, v9);
  }
  else
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    uint64_t v10 = qword_2681B9A88;
    if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_227B19000, v10, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, ignoring AR Session State update, player is inactive - need to start the player", v11, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)updateVLLocalizationResult:(id)a3
{
  objc_sync_enter(self);
  if (objc_msgSend_isPlayerActive(self, v5, v6, v7))
  {
    value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
    if (value)
    {
      sub_227C96E78((uint64_t)value, a3, v8, v9);
      goto LABEL_13;
    }
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    uint64_t v11 = qword_2681B9A88;
    if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      v12 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring VL update, fuser is nil";
      v13 = (uint8_t *)&v14;
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    uint64_t v11 = qword_2681B9A88;
    if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      v12 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring VL update, player is inactive - need to start the player";
      v13 = (uint8_t *)&v15;
LABEL_12:
      _os_log_impl(&dword_227B19000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }
LABEL_13:
  objc_sync_exit(self);
}

- (void)updateLocation:(id)a3
{
  objc_sync_enter(self);
  if ((objc_msgSend_isPlayerActive(self, v5, v6, v7) & 1) == 0)
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    v36 = qword_2681B9A88;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, player is inactive - need to start the player";
LABEL_23:
    _os_log_impl(&dword_227B19000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    goto LABEL_24;
  }
  if (!a3)
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    v36 = qword_2681B9A88;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, location is nil";
    goto LABEL_23;
  }
  if ((objc_msgSend_isARSessionActive(self, v8, v9, v10) & 1) == 0)
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    v36 = qword_2681B9A88;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, AR session is not active";
    goto LABEL_23;
  }
  if (self->fVLFDeviceMotionFuser.__ptr_.__value_)
  {
    uint64_t v14 = objc_msgSend_clientLocation(a3, v11, v12, v13);
    float v18 = sub_227C9DBC0(v14, v15, v16, v17);
    objc_msgSend_clientLocation(a3, v19, v20, v21);
    double v22 = v43;
    objc_msgSend_clientLocation(a3, v23, v24, v25);
    double v26 = v42;
    objc_msgSend_clientLocation(a3, v27, v28, v29);
    float v30 = fmax(v22, 0.0);
    float v31 = v26;
    float v32 = v38;
    if (!sub_227C93074((uint64_t)v39, v31, v32, v30, v18))
    {
      self->fMagneticDeclination = v40;
      objc_msgSend_clientLocation(a3, v33, v34, v35);
      self->fMagneticDeclinationTimestamp = v44;
      *((_DWORD *)self->fVLFDeviceMotionFuser.__ptr_.__value_ + 2) = LODWORD(self->fMagneticDeclination);
    }
    goto LABEL_24;
  }
  if (qword_2681B9A80 != -1) {
    dispatch_once(&qword_2681B9A80, &unk_26DC29878);
  }
  v36 = qword_2681B9A88;
  if (os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, fuser is nil";
    goto LABEL_23;
  }
LABEL_24:
  objc_sync_exit(self);
}

- (id)getFusedDeviceMotionFrom:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_getFusedDeviceMotionFrom_andAttitudeReferenceFrame_, a3, 4);
}

- (id)getFusedDeviceMotionFrom:(id)a3 andAttitudeReferenceFrame:(unint64_t)a4
{
  objc_sync_enter(self);
  if ((objc_msgSend_isPlayerActive(self, v7, v8, v9) & 1) == 0)
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    v88 = qword_2681B9A88;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v89 = "#warning CMADeviceMotionVisionFusionPlayer, cannot get fused device motion, player is inactive - need to start the player";
    goto LABEL_10;
  }
  if (!objc_msgSend_isFusionEnabled(self, v10, v11, v12)) {
    goto LABEL_22;
  }
  if (!self->fVLFDeviceMotionFuser.__ptr_.__value_)
  {
    if (qword_2681B9A80 != -1) {
      dispatch_once(&qword_2681B9A80, &unk_26DC29878);
    }
    v88 = qword_2681B9A88;
    if (!os_log_type_enabled((os_log_t)qword_2681B9A88, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v89 = "#warning CMADeviceMotionVisionFusionPlayer, cannot get fused device motion, fuser is nil";
LABEL_10:
    _os_log_impl(&dword_227B19000, v88, OS_LOG_TYPE_DEFAULT, v89, buf, 2u);
LABEL_11:
    a3 = 0;
    goto LABEL_22;
  }
  long long v158 = 0u;
  long long v157 = 0u;
  uint64_t v16 = objc_msgSend_attitude(a3, v13, v14, v15);
  objc_msgSend_quaternion(v16, v17, v18, v19);
  float v21 = v20;
  *(double *)buf = v21;
  uint64_t v25 = objc_msgSend_attitude(a3, v22, v23, v24);
  objc_msgSend_quaternion(v25, v26, v27, v28);
  *(float *)&double v29 = v29;
  double v148 = *(float *)&v29;
  v33 = objc_msgSend_attitude(a3, v30, v31, v32);
  objc_msgSend_quaternion(v33, v34, v35, v36);
  float v38 = v37;
  double v149 = v38;
  double v42 = objc_msgSend_attitude(a3, v39, v40, v41);
  objc_msgSend_quaternion(v42, v43, v44, v45);
  float v47 = v46;
  double v150 = v47;
  objc_msgSend_userAcceleration(a3, v48, v49, v50);
  *(float *)&double v51 = v51;
  int v151 = LODWORD(v51);
  objc_msgSend_userAcceleration(a3, v52, v53, v54);
  float v56 = v55;
  float v152 = v56;
  objc_msgSend_userAcceleration(a3, v57, v58, v59);
  float v61 = v60;
  float v153 = v61;
  objc_msgSend_rotationRate(a3, v62, v63, v64);
  *(float *)&double v65 = v65;
  int v154 = LODWORD(v65);
  objc_msgSend_rotationRate(a3, v66, v67, v68);
  float v70 = v69;
  float v155 = v70;
  objc_msgSend_rotationRate(a3, v71, v72, v73);
  float v78 = v77;
  float v156 = v78;
  if (a3)
  {
    objc_msgSend_magneticField(a3, v74, v75, v76);
    float v79 = *(double *)&v137;
    *(float *)&long long v157 = v79;
    objc_msgSend_magneticField(a3, v80, v81, v82);
    float v83 = *((double *)&v145 + 1);
    *((float *)&v157 + 1) = v83;
    objc_msgSend_magneticField(a3, v84, v85, v86);
    float v87 = *(double *)&v144;
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    *(void *)&long long v157 = 0;
    float v87 = 0.0;
    long long v143 = 0u;
    long long v144 = 0u;
  }
  *((float *)&v157 + 2) = v87;
  HIDWORD(v157) = objc_msgSend_magneticFieldCalibrationLevel(a3, v74, v75, v76);
  LOBYTE(v158) = objc_msgSend_doingYawCorrection(a3, v90, v91, v92);
  BYTE1(v158) = objc_msgSend_doingBiasEstimation(a3, v93, v94, v95);
  BYTE2(v158) = 1;
  objc_msgSend_heading(a3, v96, v97, v98);
  *(float *)&double v99 = v99;
  DWORD1(v158) = LODWORD(v99);
  BYTE8(v158) = objc_msgSend_fusedWithVision(a3, v100, v101, v102);
  BYTE9(v158) = objc_msgSend_usingVisionCorrections(a3, v103, v104, v105);
  HIDWORD(v158) = 0;
  if (a4 == 8) {
    sub_227CA14E8((uint64_t)buf, self->fMagneticDeclination, self->fMagneticDeclinationTimestamp);
  }
  value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  objc_msgSend_headingAccuracy(a3, v106, v107, v108);
  double v111 = v110;
  objc_msgSend_timestamp(a3, v112, v113, v114);
  double v116 = v115;
  *(float *)&double v115 = v111;
  sub_227C969A0((uint64_t)value, (uint64_t)buf, *(float *)&v115, v116);
  v120 = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  long long v121 = *((_OWORD *)v120 + 1);
  long long v122 = *((_OWORD *)v120 + 2);
  long long v123 = *((_OWORD *)v120 + 3);
  long long v124 = *((_OWORD *)v120 + 5);
  long long v140 = *((_OWORD *)v120 + 4);
  long long v141 = v124;
  uint64_t v142 = *((void *)v120 + 12);
  long long v138 = v122;
  long long v139 = v123;
  long long v137 = v121;
  if (a4 == 8) {
    sub_227CA13D0((uint64_t)&v137, self->fMagneticDeclination, self->fMagneticDeclinationTimestamp);
  }
  objc_msgSend_headingAccuracy(a3, v117, v118, v119);
  double v126 = v125;
  id v127 = objc_alloc(MEMORY[0x263F01730]);
  objc_msgSend_timestamp(a3, v128, v129, v130, v137, v138, v139, v140, v141, v142);
  double v132 = v131;
  *(float *)&double v131 = v126;
  a3 = (id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v127, v133, (uint64_t)&v136, v134, v131, v132);
LABEL_22:
  objc_sync_exit(self);
  return a3;
}

- (void)reset
{
  value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  if (value) {
    sub_227C9693C((uint64_t)value);
  }
  self->fMagneticDeclination = 0.0;
  self->fMagneticDeclinationTimestamp = -1.0;
}

- (float)magneticDeclination
{
  return self->fMagneticDeclination;
}

- (BOOL)isFusionEnabled
{
  return self->_fusionEnabled;
}

- (void)setFusionEnabled:(BOOL)a3
{
  self->_fusionEnabled = a3;
}

- (BOOL)isPlayerActive
{
  return self->_playerActive;
}

- (void)setPlayerActive:(BOOL)a3
{
  self->_playerActive = a3;
}

- (BOOL)isARSessionActive
{
  return self->_arSessionActive;
}

- (void)setArSessionActive:(BOOL)a3
{
  self->_arSessionActive = a3;
}

- (void).cxx_destruct
{
  value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  self->fVLFDeviceMotionFuser.__ptr_.__value_ = 0;
  if (value)
  {
    *((void *)value + 22) = &unk_26DC29610;
    JUMPOUT(0x22A6850E0);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end