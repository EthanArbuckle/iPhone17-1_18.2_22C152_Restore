@interface HPSSpatialProfileAnalytics
+ (BOOL)isRBSProcessHandleAvailable;
- (HPSSpatialProfileAnalytics)init;
- (void)incrementFrameCount;
- (void)incrementLeftEarOcclusionCount;
- (void)incrementRightEarOcclusionCount;
- (void)initFrameRateDetection;
- (void)submitHPSSpatialProfileEnrollAnalytics;
- (void)submitHPSSpatialProfileResetAnalytics;
- (void)updateFaceEnrollDuration;
- (void)updateFaceEnrollStart;
- (void)updateLeftEarBackAnglelDuration;
- (void)updateLeftEarEnrollDuration;
- (void)updateLeftEarEnrollStart;
- (void)updateLeftEarFrontAnglelDuration;
- (void)updateLeftEarMidAnglelDuration;
- (void)updateRightEarBackAnglelDuration;
- (void)updateRightEarEnrollDuration;
- (void)updateRightEarEnrollStart;
- (void)updateRightEarFrontAnglelDuration;
- (void)updateRightEarMidAnglelDuration;
- (void)updateSoundProfileCreationDuration;
- (void)updateSoundProfileCreationDurationStart;
- (void)updateStatus:(BOOL)a3 EnrollmentResult:(id)a4;
@end

@implementation HPSSpatialProfileAnalytics

- (HPSSpatialProfileAnalytics)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HPSSpatialProfileAnalytics;
  v2 = [(HPSSpatialProfileAnalytics *)&v15 init];
  if (v2)
  {
    v2->_enrollmentStartTime = CACurrentMediaTime();
    v2->_status = 0;
    *(_OWORD *)&v2->_faceEnrollmentTime = 0u;
    *(_OWORD *)&v2->_rightEarEnrollmentStartTime = 0u;
    *(_OWORD *)&v2->_rightEarFrontAngleTime = 0u;
    *(_OWORD *)&v2->_rightEarBackAngleTime = 0u;
    *(_OWORD *)&v2->_leftEarEnrollmentTime = 0u;
    *(_OWORD *)&v2->_leftEarMidAngleTime = 0u;
    *(_OWORD *)&v2->_soundProfileCreationStartTime = 0u;
    *(_WORD *)&v2->_leftEarOcclusionDetectCount = 0;
    v2->_frameDetectionStartTime = 0.0;
    v2->_frameCount = 0;
    parentBundleID = v2->_parentBundleID;
    v2->_parentBundleID = 0;

    v2->_submitted = 0;
    v4 = v2->_result;
    v2->_result = (NSString *)@"Cancel";

    if (+[HPSSpatialProfileAnalytics isRBSProcessHandleAvailable])
    {
      v5 = [MEMORY[0x1E4F96400] identifierWithPid:getpid()];
      if (v5)
      {
        id v14 = 0;
        v6 = [MEMORY[0x1E4F963F0] handleForIdentifier:v5 error:&v14];
        id v7 = v14;
        if (v6)
        {
          v8 = [v6 bundle];
          uint64_t v9 = [v8 identifier];
          v10 = v2->_parentBundleID;
          v2->_parentBundleID = (NSString *)v9;
        }
      }
      else
      {
        id v7 = 0;
      }
      v11 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v2->_parentBundleID;
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Initialized Analytics From Client %@", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (void)updateFaceEnrollStart
{
  self->_faceEnrollmentStartTime = CACurrentMediaTime();
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Face Enroll Start Time", v3, 2u);
  }
}

- (void)updateSoundProfileCreationDurationStart
{
  if (self->_soundProfileCreationStartTime == 0.0)
  {
    self->_soundProfileCreationStartTime = CACurrentMediaTime();
    v2 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Profile Creation Time", v3, 2u);
    }
  }
}

- (void)updateSoundProfileCreationDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_soundProfileCreationStartTime != 0.0) {
    self->_soundProfileCreationTime = CACurrentMediaTime() - self->_soundProfileCreationStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double faceEnrollmentTime = self->_faceEnrollmentTime;
    int v5 = 134217984;
    double v6 = faceEnrollmentTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Face Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateFaceEnrollDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_faceEnrollmentStartTime != 0.0) {
    self->_double faceEnrollmentTime = CACurrentMediaTime() - self->_faceEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double faceEnrollmentTime = self->_faceEnrollmentTime;
    int v5 = 134217984;
    double v6 = faceEnrollmentTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Face Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateRightEarEnrollStart
{
  self->_rightEarEnrollmentStartTime = CACurrentMediaTime();
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Enroll Time", v3, 2u);
  }
}

- (void)updateRightEarFrontAnglelDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_rightEarEnrollmentStartTime != 0.0) {
    self->_double rightEarFrontAngleTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double rightEarFrontAngleTime = self->_rightEarFrontAngleTime;
    int v5 = 134217984;
    double v6 = rightEarFrontAngleTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Front Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateRightEarMidAnglelDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_rightEarEnrollmentStartTime != 0.0) {
    self->_double rightEarMidAngleTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double rightEarMidAngleTime = self->_rightEarMidAngleTime;
    int v5 = 134217984;
    double v6 = rightEarMidAngleTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Mid Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateRightEarBackAnglelDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_rightEarEnrollmentStartTime != 0.0) {
    self->_double rightEarBackAngleTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double rightEarBackAngleTime = self->_rightEarBackAngleTime;
    int v5 = 134217984;
    double v6 = rightEarBackAngleTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Back Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateLeftEarFrontAnglelDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_leftEarEnrollmentStartTime != 0.0) {
    self->_double leftEarFrontAngleTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double leftEarFrontAngleTime = self->_leftEarFrontAngleTime;
    int v5 = 134217984;
    double v6 = leftEarFrontAngleTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Front Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateLeftEarMidAnglelDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_leftEarEnrollmentStartTime != 0.0) {
    self->_double leftEarMidAngleTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double leftEarMidAngleTime = self->_leftEarMidAngleTime;
    int v5 = 134217984;
    double v6 = leftEarMidAngleTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Mid Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateLeftEarBackAnglelDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_leftEarEnrollmentStartTime != 0.0) {
    self->_double leftEarBackAngleTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double leftEarBackAngleTime = self->_leftEarBackAngleTime;
    int v5 = 134217984;
    double v6 = leftEarBackAngleTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Back Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateRightEarEnrollDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_rightEarEnrollmentStartTime != 0.0) {
    self->_double rightEarEnrollmentTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double rightEarEnrollmentTime = self->_rightEarEnrollmentTime;
    int v5 = 134217984;
    double v6 = rightEarEnrollmentTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateLeftEarEnrollStart
{
  self->_leftEarEnrollmentStartTime = CACurrentMediaTime();
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Enroll Time", v3, 2u);
  }
}

- (void)updateLeftEarEnrollDuration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_leftEarEnrollmentStartTime != 0.0) {
    self->_double leftEarEnrollmentTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  }
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double leftEarEnrollmentTime = self->_leftEarEnrollmentTime;
    int v5 = 134217984;
    double v6 = leftEarEnrollmentTime;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Enroll Time: %f ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateStatus:(BOOL)a3 EnrollmentResult:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  objc_storeStrong((id *)&self->_result, a4);
  self->_BOOL status = a3;
  v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL status = self->_status;
    result = self->_result;
    v11[0] = 67109378;
    v11[1] = status;
    __int16 v12 = 2112;
    v13 = result;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Status : %d Result %@", (uint8_t *)v11, 0x12u);
  }
}

- (void)incrementLeftEarOcclusionCount
{
}

- (void)incrementRightEarOcclusionCount
{
}

- (void)initFrameRateDetection
{
  self->_frameDetectionStartTime = CACurrentMediaTime();
  self->_frameCount = 0;
}

- (void)incrementFrameCount
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_frameDetectionStartTime == 0.0)
  {
    [(HPSSpatialProfileAnalytics *)self initFrameRateDetection];
  }
  else
  {
    ++self->_frameCount;
    double v3 = CACurrentMediaTime() - self->_frameDetectionStartTime;
    if (v3 > 2.0)
    {
      v4 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t frameCount = self->_frameCount;
        int v6 = 134218496;
        double v7 = (double)frameCount / v3;
        __int16 v8 = 2048;
        unint64_t v9 = frameCount;
        __int16 v10 = 2048;
        double v11 = v3;
        _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Rate : Frame Per sec %f   [ Num : %llu Time :%f]", (uint8_t *)&v6, 0x20u);
      }

      [(HPSSpatialProfileAnalytics *)self initFrameRateDetection];
    }
  }
}

- (void)submitHPSSpatialProfileEnrollAnalytics
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_submitted)
  {
    if (self->_faceEnrollmentTime == 0.0) {
      [(HPSSpatialProfileAnalytics *)self updateFaceEnrollDuration];
    }
    if (self->_rightEarEnrollmentTime == 0.0) {
      [(HPSSpatialProfileAnalytics *)self updateRightEarEnrollDuration];
    }
    if (self->_leftEarEnrollmentTime == 0.0) {
      [(HPSSpatialProfileAnalytics *)self updateLeftEarEnrollDuration];
    }
    double v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = @"EnrollmentStatus";
      uint64_t v4 = [NSNumber numberWithBool:self->_status];
      result = self->_result;
      v24 = (void *)v4;
      v26[0] = v4;
      v26[1] = result;
      v25[1] = @"EnrollmentResult";
      v25[2] = @"EnrollmentDuration";
      int v6 = NSNumber;
      double faceEnrollmentStartTime = self->_faceEnrollmentStartTime;
      if (faceEnrollmentStartTime != 0.0) {
        double faceEnrollmentStartTime = CACurrentMediaTime() - self->_faceEnrollmentStartTime;
      }
      v23 = [v6 numberWithDouble:faceEnrollmentStartTime];
      v26[2] = v23;
      v25[3] = @"EnrollmentScanDuration";
      v22 = [NSNumber numberWithDouble:self->_faceEnrollmentTime + self->_rightEarEnrollmentTime + self->_leftEarEnrollmentTime];
      v26[3] = v22;
      v25[4] = @"FaceEnrollmentDuration";
      v21 = [NSNumber numberWithDouble:self->_faceEnrollmentTime];
      v26[4] = v21;
      v25[5] = @"RightEarEnrollmentDuration";
      v20 = [NSNumber numberWithDouble:self->_rightEarEnrollmentTime];
      v26[5] = v20;
      v25[6] = @"LeftEarEnrollmentDuration";
      v19 = [NSNumber numberWithDouble:self->_leftEarEnrollmentTime];
      v26[6] = v19;
      v25[7] = @"LeftEarOcclusionCount";
      uint64_t v18 = [NSNumber numberWithUnsignedChar:self->_leftEarOcclusionDetectCount];
      v26[7] = v18;
      v25[8] = @"RightEarOcclusionCount";
      v17 = [NSNumber numberWithUnsignedChar:self->_rightEarOcclusionDetectCount];
      v26[8] = v17;
      v25[9] = @"SoundProfileCreationDuration";
      __int16 v8 = [NSNumber numberWithDouble:self->_soundProfileCreationTime];
      v26[9] = v8;
      v25[10] = @"RightEarFrontAngleDuration";
      unint64_t v9 = [NSNumber numberWithDouble:self->_rightEarFrontAngleTime];
      v26[10] = v9;
      v25[11] = @"RightEarMidAngleDuration";
      __int16 v10 = [NSNumber numberWithDouble:self->_rightEarMidAngleTime];
      v26[11] = v10;
      v25[12] = @"RightEarBackAngleDuration";
      double v11 = [NSNumber numberWithDouble:self->_rightEarBackAngleTime];
      v26[12] = v11;
      v25[13] = @"LeftEarFrontAngleDuration";
      uint64_t v12 = [NSNumber numberWithDouble:self->_leftEarFrontAngleTime];
      v26[13] = v12;
      v25[14] = @"LeftEarMidAngleDuration";
      v13 = [NSNumber numberWithDouble:self->_leftEarMidAngleTime];
      v26[14] = v13;
      v25[15] = @"LeftEarBackAngleDuration";
      uint64_t v14 = [NSNumber numberWithDouble:self->_leftEarBackAngleTime];
      v26[15] = v14;
      objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:16];
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Submit analysis : %@", buf, 0xCu);
    }
    AnalyticsSendEventLazy();
    if (!self->_status)
    {
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"SpatialProfileEnrollmentNotCompleted" object:0];
    }
    self->_submitted = 1;
  }
}

id __68__HPSSpatialProfileAnalytics_submitHPSSpatialProfileEnrollAnalytics__block_invoke(uint64_t a1)
{
  v25[17] = *MEMORY[0x1E4F143B8];
  v24[0] = @"EnrollmentStatus";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 160)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 152);
  v23 = (void *)v2;
  v25[0] = v2;
  v25[1] = v4;
  v24[1] = @"EnrollmentResult";
  v24[2] = @"EnrollmentEntry";
  v25[2] = *(void *)(v3 + 168);
  v24[3] = @"EnrollmentDuration";
  int v5 = NSNumber;
  double v6 = *(double *)(v3 + 24);
  if (v6 != 0.0) {
    double v6 = CACurrentMediaTime() - *(double *)(*(void *)(a1 + 32) + 24);
  }
  v22 = [v5 numberWithDouble:v6];
  v25[3] = v22;
  v24[4] = @"EnrollmentScanDuration";
  v21 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 16)+ *(double *)(*(void *)(a1 + 32) + 40)+ *(double *)(*(void *)(a1 + 32) + 80)];
  v25[4] = v21;
  v24[5] = @"FaceEnrollmentDuration";
  v20 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 16)];
  v25[5] = v20;
  v24[6] = @"RightEarEnrollmentDuration";
  v19 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 40)];
  v25[6] = v19;
  v24[7] = @"LeftEarEnrollmentDuration";
  uint64_t v18 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 80)];
  v25[7] = v18;
  v24[8] = @"LeftEarOcclusionCount";
  double v7 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(*(void *)(a1 + 32) + 128)];
  v25[8] = v7;
  v24[9] = @"RightEarOcclusionCount";
  __int16 v8 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(*(void *)(a1 + 32) + 129)];
  v25[9] = v8;
  v24[10] = @"SoundProfileCreationDuration";
  unint64_t v9 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 120)];
  v25[10] = v9;
  v24[11] = @"RightEarFrontAngleDuration";
  __int16 v10 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 48)];
  v25[11] = v10;
  v24[12] = @"RightEarMidAngleDuration";
  double v11 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 56)];
  v25[12] = v11;
  v24[13] = @"RightEarBackAngleDuration";
  uint64_t v12 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 64)];
  v25[13] = v12;
  v24[14] = @"LeftEarFrontAngleDuration";
  v13 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 88)];
  v25[14] = v13;
  v24[15] = @"LeftEarMidAngleDuration";
  uint64_t v14 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 96)];
  v25[15] = v14;
  v24[16] = @"LeftEarBackAngleDuration";
  objc_super v15 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 104)];
  void v25[16] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:17];

  return v16;
}

- (void)submitHPSSpatialProfileResetAnalytics
{
  if (!self->_submitted)
  {
    uint64_t v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Reset Submit analysis", v4, 2u);
    }

    AnalyticsSendEventLazy();
    self->_submitted = 1;
  }
}

void *__67__HPSSpatialProfileAnalytics_submitHPSSpatialProfileResetAnalytics__block_invoke()
{
  return &unk_1F40ABCB0;
}

+ (BOOL)isRBSProcessHandleAvailable
{
  if (isRBSProcessHandleAvailable_onceToken != -1) {
    dispatch_once(&isRBSProcessHandleAvailable_onceToken, &__block_literal_global_74);
  }
  return isRBSProcessHandleAvailable_available;
}

Class __57__HPSSpatialProfileAnalytics_isRBSProcessHandleAvailable__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Rbsprocesshand.isa);
  isRBSProcessHandleAvailable_available = result != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleID, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

@end