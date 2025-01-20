@interface BKFaceDetectStateInfo
- (BKFaceDetectStateInfo)initWithPresenceState:(BOOL)a3;
- (BKFaceDetectStateInfo)initWithPresenceState:(BOOL)a3 details:(id)a4;
- (BOOL)faceDetected;
- (BOOL)flare;
- (BOOL)glassesMismatch;
- (BOOL)multipleFaces;
- (BOOL)occlusion;
- (BOOL)partiallyOutOfView;
- (BOOL)tooCloseToCamera;
- (BOOL)tooFarFromCamera;
- (BOOL)unsupportedGlasses;
- (NSNumber)attentionScore;
- (NSNumber)cameraObstructionScore;
- (NSNumber)distance;
- (NSNumber)faceDetectionScore;
- (NSNumber)frameNumber;
- (NSNumber)isCameraObstructed;
- (NSNumber)pitch;
- (NSNumber)roll;
- (NSNumber)yaw;
- (id)dictionary;
- (id)initFromDictionary:(id)a3;
- (id)initFromFaceInfo:(id *)a3;
- (unint64_t)eyeReliefStatus;
- (unint64_t)orientation;
- (void)setDistance:(id)a3;
- (void)setEyeReliefStatus:(unint64_t)a3;
- (void)setFaceDetected:(BOOL)a3;
- (void)setFlare:(BOOL)a3;
- (void)setMultipleFaces:(BOOL)a3;
- (void)setOcclusion:(BOOL)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setPitch:(id)a3;
- (void)setRoll:(id)a3;
- (void)setTooCloseToCamera:(BOOL)a3;
- (void)setTooFarFromCamera:(BOOL)a3;
- (void)setYaw:(id)a3;
@end

@implementation BKFaceDetectStateInfo

- (BKFaceDetectStateInfo)initWithPresenceState:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKFaceDetectStateInfo;
  result = [(BKFaceDetectStateInfo *)&v5 init];
  if (result) {
    result->_faceDetected = a3;
  }
  return result;
}

- (BKFaceDetectStateInfo)initWithPresenceState:(BOOL)a3 details:(id)a4
{
  id v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)BKFaceDetectStateInfo;
  v7 = [(BKFaceDetectStateInfo *)&v36 init];
  v8 = v7;
  if (v7)
  {
    v7->_faceDetected = a3;
    uint64_t v9 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceDetectPitch"];
    pitch = v8->_pitch;
    v8->_pitch = (NSNumber *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceDetectYaw"];
    yaw = v8->_yaw;
    v8->_yaw = (NSNumber *)v11;

    uint64_t v13 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceDetectRoll"];
    roll = v8->_roll;
    v8->_roll = (NSNumber *)v13;

    uint64_t v15 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceDistance"];
    distance = v8->_distance;
    v8->_distance = (NSNumber *)v15;

    v8->_orientation = 0;
    v17 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceDetectOrientation"];
    v18 = v17;
    if (v17)
    {
      uint64_t v19 = [v17 unsignedIntegerValue];
      if ((unint64_t)(v19 - 1) >= 4) {
        unint64_t v20 = 0;
      }
      else {
        unint64_t v20 = v19;
      }
      v8->_orientation = v20;
    }
    v8->_eyeReliefStatus = 0;
    v21 = [v6 objectForKeyedSubscript:@"BKStatusDetailEyeReliefStatus"];
    v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 unsignedIntegerValue];
      if ((unint64_t)(v23 - 1) >= 5) {
        unint64_t v24 = 0;
      }
      else {
        unint64_t v24 = v23;
      }
      v8->_eyeReliefStatus = v24;
    }
    uint64_t v25 = [v6 objectForKeyedSubscript:@"BKStatusDetailFrameNumber"];
    frameNumber = v8->_frameNumber;
    v8->_frameNumber = (NSNumber *)v25;

    uint64_t v27 = [v6 objectForKeyedSubscript:@"BKStatusDetailAttentionScore"];
    attentionScore = v8->_attentionScore;
    v8->_attentionScore = (NSNumber *)v27;

    uint64_t v29 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceDetectionScore"];
    faceDetectionScore = v8->_faceDetectionScore;
    v8->_faceDetectionScore = (NSNumber *)v29;

    uint64_t v31 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceOcclusionState"];
    isCameraObstructed = v8->_isCameraObstructed;
    v8->_isCameraObstructed = (NSNumber *)v31;

    uint64_t v33 = [v6 objectForKeyedSubscript:@"BKStatusDetailFaceOcclusionScore"];
    cameraObstructionScore = v8->_cameraObstructionScore;
    v8->_cameraObstructionScore = (NSNumber *)v33;
  }
  return v8;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKFaceDetectStateInfo;
  objc_super v5 = [(BKFaceDetectStateInfo *)&v13 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"faceDetected"];
    v5->_faceDetected = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"tooCloseToCamera"];
    v5->_tooCloseToCamera = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:@"tooFarFromCamera"];
    v5->_tooFarFromCamera = [v8 BOOLValue];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"multipleFaces"];
    v5->_multipleFaces = [v9 BOOLValue];

    v10 = [v4 objectForKeyedSubscript:@"flare"];
    v5->_flare = [v10 BOOLValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"occlusion"];
    v5->_occlusion = [v11 BOOLValue];
  }
  return v5;
}

- (id)initFromFaceInfo:(id *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)BKFaceDetectStateInfo;
  id v4 = [(BKFaceDetectStateInfo *)&v34 init];
  id v6 = v4;
  if (v4)
  {
    __int16 v7 = *(_WORD *)(&a3->var0 + 1);
    v4->_faceDetected = (v7 & 4) == 0;
    v4->_tooCloseToCamera = (v7 & 0x20) != 0;
    v4->_tooFarFromCamera = (v7 & 0x40) != 0;
    v4->_multipleFaces = (v7 & 8) != 0;
    v4->_flare = 0;
    v4->_occlusion = (v7 & 0x200) != 0;
    v4->_unsupportedGlasses = (v7 & 0x1000) != 0;
    v4->_glassesMismatch = (v7 & 0x2000) != 0;
    LODWORD(v5) = *(unsigned int *)((char *)&a3->var5 + 1);
    uint64_t v8 = [NSNumber numberWithFloat:v5];
    pitch = v6->_pitch;
    v6->_pitch = (NSNumber *)v8;

    *(float *)&double v10 = *(float *)((char *)&a3->var6 + 1);
    uint64_t v11 = [NSNumber numberWithFloat:v10];
    yaw = v6->_yaw;
    v6->_yaw = (NSNumber *)v11;

    *(float *)&double v13 = *(float *)((char *)&a3->var7 + 1);
    uint64_t v14 = [NSNumber numberWithFloat:v13];
    roll = v6->_roll;
    v6->_roll = (NSNumber *)v14;

    LOWORD(v16) = *(unsigned __int16 *)((char *)&a3->var1 + 1);
    *(float *)&double v17 = (float)v16;
    uint64_t v18 = [NSNumber numberWithFloat:v17];
    distance = v6->_distance;
    v6->_distance = (NSNumber *)v18;

    uint64_t v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&a3->var8 + 1)];
    frameNumber = v6->_frameNumber;
    v6->_frameNumber = (NSNumber *)v20;

    LODWORD(v22) = *(unsigned int *)((char *)&a3->var9 + 1);
    uint64_t v23 = [NSNumber numberWithFloat:v22];
    attentionScore = v6->_attentionScore;
    v6->_attentionScore = (NSNumber *)v23;

    *(float *)&double v25 = *(float *)((char *)&a3->var10 + 1);
    uint64_t v26 = [NSNumber numberWithFloat:v25];
    faceDetectionScore = v6->_faceDetectionScore;
    v6->_faceDetectionScore = (NSNumber *)v26;

    uint64_t v28 = [NSNumber numberWithBool:BYTE1(a3->var11)];
    isCameraObstructed = v6->_isCameraObstructed;
    v6->_isCameraObstructed = (NSNumber *)v28;

    *(float *)&double v30 = *(float *)((char *)&a3->var11 + 2);
    uint64_t v31 = [NSNumber numberWithFloat:v30];
    cameraObstructionScore = v6->_cameraObstructionScore;
    v6->_cameraObstructionScore = (NSNumber *)v31;
  }
  return v6;
}

- (id)dictionary
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"BKFaceDetectStateInfo";
  v11[0] = @"class";
  v11[1] = @"faceDetected";
  v3 = [NSNumber numberWithBool:self->_faceDetected];
  v12[1] = v3;
  v11[2] = @"tooCloseToCamera";
  id v4 = [NSNumber numberWithBool:self->_tooCloseToCamera];
  v12[2] = v4;
  v11[3] = @"tooFarFromCamera";
  double v5 = [NSNumber numberWithBool:self->_tooFarFromCamera];
  v12[3] = v5;
  v11[4] = @"multipleFaces";
  id v6 = [NSNumber numberWithBool:self->_multipleFaces];
  v12[4] = v6;
  v11[5] = @"flare";
  __int16 v7 = [NSNumber numberWithBool:self->_flare];
  v12[5] = v7;
  v11[6] = @"occlusion";
  uint64_t v8 = [NSNumber numberWithBool:self->_occlusion];
  v12[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

- (BOOL)faceDetected
{
  return self->_faceDetected;
}

- (void)setFaceDetected:(BOOL)a3
{
  self->_faceDetected = a3;
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (void)setPitch:(id)a3
{
}

- (NSNumber)yaw
{
  return self->_yaw;
}

- (void)setYaw:(id)a3
{
}

- (NSNumber)roll
{
  return self->_roll;
}

- (void)setRoll:(id)a3
{
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (unint64_t)eyeReliefStatus
{
  return self->_eyeReliefStatus;
}

- (void)setEyeReliefStatus:(unint64_t)a3
{
  self->_eyeReliefStatus = a3;
}

- (NSNumber)isCameraObstructed
{
  return self->_isCameraObstructed;
}

- (NSNumber)cameraObstructionScore
{
  return self->_cameraObstructionScore;
}

- (NSNumber)frameNumber
{
  return self->_frameNumber;
}

- (NSNumber)attentionScore
{
  return self->_attentionScore;
}

- (NSNumber)faceDetectionScore
{
  return self->_faceDetectionScore;
}

- (BOOL)tooCloseToCamera
{
  return self->_tooCloseToCamera;
}

- (void)setTooCloseToCamera:(BOOL)a3
{
  self->_tooCloseToCamera = a3;
}

- (BOOL)tooFarFromCamera
{
  return self->_tooFarFromCamera;
}

- (void)setTooFarFromCamera:(BOOL)a3
{
  self->_tooFarFromCamera = a3;
}

- (BOOL)multipleFaces
{
  return self->_multipleFaces;
}

- (void)setMultipleFaces:(BOOL)a3
{
  self->_multipleFaces = a3;
}

- (BOOL)flare
{
  return self->_flare;
}

- (void)setFlare:(BOOL)a3
{
  self->_flare = a3;
}

- (BOOL)occlusion
{
  return self->_occlusion;
}

- (void)setOcclusion:(BOOL)a3
{
  self->_occlusion = a3;
}

- (BOOL)partiallyOutOfView
{
  return self->_partiallyOutOfView;
}

- (BOOL)unsupportedGlasses
{
  return self->_unsupportedGlasses;
}

- (BOOL)glassesMismatch
{
  return self->_glassesMismatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceDetectionScore, 0);
  objc_storeStrong((id *)&self->_attentionScore, 0);
  objc_storeStrong((id *)&self->_frameNumber, 0);
  objc_storeStrong((id *)&self->_cameraObstructionScore, 0);
  objc_storeStrong((id *)&self->_isCameraObstructed, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
}

@end