@interface VNHumanBodyPose3DSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)_stringRepresentationForRequestRevision:(unint64_t)a3 abpkJoint:(id)a4 error:(id *)a5;
+ (id)supportedHumanBodyPose3DKeypointsRev1;
- (BOOL)isEqual:(id)a3;
- (CGSize)inputSize;
- (VNHumanBodyPose3DSpecifier)initWithCoder:(id)a3;
- (VNHumanBodyPose3DSpecifier)initWithHumanBody3DOutput:(id)a3 originatingRequestSpecifier:(id)a4;
- (__n128)cameraIntrinsics;
- (__n128)cameraRenderTransformMatrix;
- (__n128)cameraTransformMatrix;
- (float)bodyHeight;
- (float)heightEstimatedScale;
- (id)availableGroupKeys;
- (id)pointKeyGroupLabelsMapping;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNHumanBodyPose3DSpecifier

- (void).cxx_destruct
{
}

- (CGSize)inputSize
{
  double width = self->_inputSize.width;
  double height = self->_inputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[8];
}

- (__n128)cameraRenderTransformMatrix
{
  return a1[11];
}

- (__n128)cameraTransformMatrix
{
  return a1[2];
}

- (float)heightEstimatedScale
{
  return self->_heightEstimatedScale;
}

- (VNHumanBodyPose3DSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VNHumanBodyPose3DSpecifier;
  v5 = [(VNRecognizedPoints3DSpecifier *)&v30 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"OrderedHuman3DKeypoints"];
    orderedHumanBodyPose3DKeypoints = v5->_orderedHumanBodyPose3DKeypoints;
    v5->_orderedHumanBodyPose3DKeypoints = (NSArray *)v9;

    if (v5->_orderedHumanBodyPose3DKeypoints)
    {
      objc_msgSend(v4, "vn_decode3x3MatrixForKey:", @"CameraIntrinsics");
      *(void *)v5->_anon_80 = v11;
      *(_DWORD *)&v5->_anon_80[8] = v12;
      *(void *)&v5->_anon_80[16] = v13;
      *(_DWORD *)&v5->_anon_80[24] = v14;
      *(_DWORD *)&v5->_anon_80[40] = v15;
      *(void *)&v5->_anon_80[32] = v16;
      v17 = [v4 error];

      if (!v17)
      {
        objc_msgSend(v4, "vn_decode4x4MatrixForKey:", @"CameraTransform");
        *(_OWORD *)v5->_anon_20 = v18;
        *(_OWORD *)&v5->_anon_20[16] = v19;
        *(_OWORD *)&v5->_anon_20[32] = v20;
        *(_OWORD *)&v5->_anon_20[48] = v21;
        v22 = [v4 error];

        if (!v22)
        {
          [v4 decodeFloatForKey:@"HeightEstimatedScale"];
          v5->_heightEstimatedScale = v23;
          [v4 decodeFloatForKey:@"HumanHeight"];
          v5->_humanHeight = v24;
          objc_msgSend(v4, "vn_decodeSizeForKey:", @"InputSize");
          v5->_inputSize.double width = v25;
          v5->_inputSize.double height = v26;
          v27 = v5;
LABEL_9:

          goto LABEL_10;
        }
      }
    }
    else
    {
      v28 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"ordered model human keypoints were not available"];
      [v4 failWithError:v28];
    }
    v27 = 0;
    goto LABEL_9;
  }
  v27 = 0;
LABEL_10:

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNHumanBodyPose3DSpecifier;
  [(VNRecognizedPoints3DSpecifier *)&v7 encodeWithCoder:v4];
  [v4 encodeObject:self->_orderedHumanBodyPose3DKeypoints forKey:@"OrderedHuman3DKeypoints"];
  objc_msgSend(v4, "vn_encode3x3Matrix:forKey:", @"CameraIntrinsics", *(double *)self->_anon_80, *(double *)&self->_anon_80[16], *(double *)&self->_anon_80[32]);
  objc_msgSend(v4, "vn_encode4x4Matrix:forKey:", @"CameraTransform", *(double *)self->_anon_20, *(double *)&self->_anon_20[16], *(double *)&self->_anon_20[32], *(double *)&self->_anon_20[48]);
  *(float *)&double v5 = self->_heightEstimatedScale;
  [v4 encodeFloat:@"HeightEstimatedScale" forKey:v5];
  *(float *)&double v6 = self->_humanHeight;
  [v4 encodeFloat:@"HumanHeight" forKey:v6];
  objc_msgSend(v4, "vn_encodeSize:forKey:", @"InputSize", self->_inputSize.width, self->_inputSize.height);
}

- (float)bodyHeight
{
  return self->_humanHeight;
}

- (id)pointKeyGroupLabelsMapping
{
  if (-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::onceToken != -1) {
    dispatch_once(&-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::onceToken, &__block_literal_global_12);
  }
  v2 = (void *)-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::mapping;

  return v2;
}

void __56__VNHumanBodyPose3DSpecifier_pointKeyGroupLabelsMapping__block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"human_top_head_3D", @"human_center_head_3D", 0);
  v9[0] = v0;
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"human_left_shoulder_3D", @"human_right_shoulder_3D", @"human_center_shoulder_3D", @"human_spine_3D", @"human_left_hip_3D", @"human_root_3D", @"human_right_hip_3D", 0, @"human_joint_group_head_3D", @"human_joint_group_torso_3D");
  v9[1] = v1;
  v8[2] = @"human_joint_group_left_arm_3D";
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"human_left_shoulder_3D", @"human_left_elbow_3D", @"human_left_wrist_3D", 0);
  v9[2] = v2;
  v8[3] = @"human_joint_group_right_arm_3D";
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"human_right_shoulder_3D", @"human_right_elbow_3D", @"human_right_wrist_3D", 0);
  v9[3] = v3;
  v8[4] = @"human_joint_group_left_leg_3D";
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"human_left_hip_3D", @"human_left_knee_3D", @"human_left_ankle_3D", 0);
  v9[4] = v4;
  v8[5] = @"human_joint_group_right_leg_3D";
  double v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"human_right_hip_3D", @"human_right_knee_3D", @"human_right_ankle_3D", 0);
  v9[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  objc_super v7 = (void *)-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::mapping;
  -[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::mapping = v6;
}

- (id)availableGroupKeys
{
  if (-[VNHumanBodyPose3DSpecifier availableGroupKeys]::onceToken != -1) {
    dispatch_once(&-[VNHumanBodyPose3DSpecifier availableGroupKeys]::onceToken, &__block_literal_global_9);
  }
  v2 = (void *)-[VNHumanBodyPose3DSpecifier availableGroupKeys]::groupKeys;

  return v2;
}

void __48__VNHumanBodyPose3DSpecifier_availableGroupKeys__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"human_joint_group_head_3D";
  v2[1] = @"human_joint_group_torso_3D";
  v2[2] = @"human_joint_group_left_arm_3D";
  v2[3] = @"human_joint_group_right_arm_3D";
  v2[4] = @"human_joint_group_left_leg_3D";
  v2[5] = @"human_joint_group_right_leg_3D";
  v2[6] = @"VNIPOAll";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)-[VNHumanBodyPose3DSpecifier availableGroupKeys]::groupKeys;
  -[VNHumanBodyPose3DSpecifier availableGroupKeys]::groupKeys = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNHumanBodyPose3DSpecifier *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VNHumanBodyPose3DSpecifier;
    if ([(VNRecognizedPoints3DSpecifier *)&v11 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v5 = v4;
      uint64_t v6 = v5;
      BOOL v7 = self->_inputSize.width == v5->_inputSize.width && self->_inputSize.height == v5->_inputSize.height;
      BOOL v9 = v7
        && self->_heightEstimatedScale == v5->_heightEstimatedScale
        && self->_humanHeight == v5->_humanHeight
        && (uint32x4_t v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_80[16], *(float32x4_t *)&v5->_anon_80[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_80, *(float32x4_t *)v5->_anon_80)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_80[32], *(float32x4_t *)&v5->_anon_80[32])), v8.i32[3] = v8.i32[2], (vminvq_u32(v8) & 0x80000000) != 0)&& (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_20[16], *(float32x4_t *)&v5->_anon_20[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_20, *(float32x4_t *)v5->_anon_20)), vandq_s8(
                                       (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_20[32], *(float32x4_t *)&v5->_anon_20[32]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_20[48], *(float32x4_t *)&v5->_anon_20[48])))) & 0x80000000) != 0&& [(NSArray *)self->_orderedHumanBodyPose3DKeypoints isEqualToArray:v5->_orderedHumanBodyPose3DKeypoints];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (VNHumanBodyPose3DSpecifier)initWithHumanBody3DOutput:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v6 = a3;
  id v78 = a4;
  BOOL v7 = [v6 liftedSkeleton];
  uint32x4_t v8 = [v7 skeletonDefinition];
  uint64_t v9 = [v8 jointCount];

  uint64_t v90 = [v78 requestRevision];
  v80 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v9];
  v79 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    v82 = v7;
    id v83 = v6;
    v81 = self;
    while (1)
    {
      uint64_t v13 = [v7 modelPoses];
      long long v88 = *(_OWORD *)(v13 + v10 + 16);
      long long v89 = *(_OWORD *)(v13 + v10);
      long long v86 = *(_OWORD *)(v13 + v10 + 48);
      long long v87 = *(_OWORD *)(v13 + v10 + 32);
      uint64_t v14 = [v7 localPoses];
      float32x4_t v84 = *(float32x4_t *)(v14 + v11);
      long long v85 = *(_OWORD *)(v14 + v11 + 16);
      int v15 = [v7 skeletonDefinition];
      v91 = [v15 jointName:v12];

      uint64_t v16 = objc_opt_class();
      v94[0] = 0;
      v17 = [v16 _stringRepresentationForRequestRevision:v90 abpkJoint:v91 error:v94];
      id v18 = v94[0];
      long long v19 = v18;
      if (v17)
      {
        long long v20 = [v7 skeletonDefinition];
        uint64_t v21 = [v20 parentJoint:v12];

        v22 = [v7 skeletonDefinition];
        float v23 = v22;
        uint64_t v24 = v21 >= 0 ? v21 : v12;
        CGFloat v25 = [v22 jointName:v24];

        CGFloat v26 = objc_opt_class();
        id v93 = v19;
        v27 = [v26 _stringRepresentationForRequestRevision:v90 abpkJoint:v25 error:&v93];
        id v28 = v93;

        if (v27)
        {
          v29 = [VNHumanBodyRecognizedPoint3D alloc];
          _Q19 = v84;
          _S0 = v84.i32[2];
          _S1 = v84.i32[1];
          _S2 = v84.i32[3];
          __asm
          {
            FMLA            S3, S19, V19.S[2]
            FMLA            S5, S0, V19.S[1]
            FMLA            S16, S0, V19.S[2]
            FMLS            S16, S19, V19.S[0]
            FMLS            S16, S1, V19.S[1]
          }
          *(float *)&double v43 = _S3 + _S3;
          *((float *)&v43 + 1) = _S5 + _S5;
          float v44 = vmlas_n_f32(-(float)(v84.f32[2] * v84.f32[3]), v84.f32[1], v84.f32[0]);
          __asm
          {
            FMLA            S17, S1, V19.S[1]
            FMLA            S17, S2, V19.S[3]
            FMLS            S17, S19, V19.S[0]
            FMLA            S4, S0, V19.S[1]
          }
          *(float *)&double v49 = v44 + v44;
          HIDWORD(v49) = _S17;
          __asm
          {
            FMLS            S16, S0, V19.S[2]
            FMLA            S16, S2, V19.S[3]
          }
          float v52 = vmlas_n_f32(vmuls_lane_f32(v84.f32[2], v84, 3), v84.f32[1], v84.f32[0]);
          LODWORD(v53) = _S16;
          *((float *)&v53 + 1) = v52 + v52;
          v54 = -[VNHumanBodyRecognizedPoint3D initWithModelPosition:localPosition:jointName:parentJoint:](v29, "initWithModelPosition:localPosition:jointName:parentJoint:", v17, v27, *(double *)&v89, *(double *)&v88, *(double *)&v87, *(double *)&v86, v53, v49, v43, *(double *)&v85);
          [v80 setObject:v54 forKey:v17];
          [v79 addObject:v54];
          int v55 = 0;
        }
        else
        {
          v54 = [v28 localizedDescription];
          +[VNError VNAssert:0 log:v54];
          int v55 = 1;
        }
      }
      else
      {
        CGFloat v25 = [v18 localizedDescription];
        +[VNError VNAssert:0 log:v25];
        int v55 = 1;
        id v28 = v19;
      }

      if (v55) {
        break;
      }
      ++v12;
      v11 += 32;
      v10 += 64;
      BOOL v7 = v82;
      id v6 = v83;
      self = v81;
      if (v9 == v12) {
        goto LABEL_14;
      }
    }
    v56 = 0;
    BOOL v7 = v82;
    id v6 = v83;
    orderedHumanBodyPose3DKeypoints = v81;
    goto LABEL_20;
  }
LABEL_14:
  v92.receiver = self;
  v92.super_class = (Class)VNHumanBodyPose3DSpecifier;
  v56 = [(VNRecognizedPoints3DSpecifier *)&v92 initWithOriginatingRequestSpecifier:v78 allRecognizedPoints:v80];
  if (v56)
  {
    [v7 estimatedScale];
    v56->_heightEstimatedScale = v57;
    if (v57 == -1.0) {
      int v58 = 1072064102;
    }
    else {
      [v7 computeHeight];
    }
    LODWORD(v56->_humanHeight) = v58;
    [v7 cameraRootTransform];
    *(_OWORD *)v56->_anon_20 = v60;
    *(_OWORD *)&v56->_anon_20[16] = v61;
    *(_OWORD *)&v56->_anon_20[32] = v62;
    *(_OWORD *)&v56->_anon_20[48] = v63;
    [v7 renderingCameraRootTransform];
    *(_OWORD *)&v56[1].super.super.isa = v64;
    *(_OWORD *)&v56[1].super._allRecognizedPoints = v65;
    *(_OWORD *)v56[1]._anon_20 = v66;
    *(_OWORD *)&v56[1]._anon_20[16] = v67;
    [v6 cameraIntrinsics];
    *(void *)v56->_anon_80 = v68;
    *(_DWORD *)&v56->_anon_80[8] = v69;
    *(void *)&v56->_anon_80[16] = v70;
    *(_DWORD *)&v56->_anon_80[24] = v71;
    *(_DWORD *)&v56->_anon_80[40] = v72;
    *(void *)&v56->_anon_80[32] = v73;
    [v6 inputSize];
    v56->_inputSize.double width = v74;
    v56->_inputSize.double height = v75;
    uint64_t v76 = [v79 copy];
    orderedHumanBodyPose3DKeypoints = (VNHumanBodyPose3DSpecifier *)v56->_orderedHumanBodyPose3DKeypoints;
    v56->_orderedHumanBodyPose3DKeypoints = (NSArray *)v76;
LABEL_20:
  }
  return v56;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_stringRepresentationForRequestRevision:(unint64_t)a3 abpkJoint:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (a3 == 1)
  {
    uint32x4_t v8 = [(id)objc_opt_class() supportedHumanBodyPose3DKeypointsRev1];
    uint64_t v9 = [v8 objectForKey:v7];
  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequestClass:objc_opt_class()];
    uint64_t v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)supportedHumanBodyPose3DKeypointsRev1
{
  if (+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::onceToken != -1) {
    dispatch_once(&+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::onceToken, &__block_literal_global_34057);
  }
  v2 = (void *)+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::supportedHumanBodyPose3DKeypointsRev1;

  return v2;
}

void __67__VNHumanBodyPose3DSpecifier_supportedHumanBodyPose3DKeypointsRev1__block_invoke()
{
  uint64_t v25 = 0;
  CGFloat v26 = &v25;
  uint64_t v27 = 0x2050000000;
  uint64_t v0 = (void *)getABPKSkeletonDefinitionClass(void)::softClass;
  uint64_t v28 = getABPKSkeletonDefinitionClass(void)::softClass;
  if (!getABPKSkeletonDefinitionClass(void)::softClass)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = ___ZL30getABPKSkeletonDefinitionClassv_block_invoke;
    v24[3] = &unk_1E5B20220;
    v24[4] = &v25;
    ___ZL30getABPKSkeletonDefinitionClassv_block_invoke((uint64_t)v24);
    uint64_t v0 = (void *)v26[3];
  }
  v1 = v0;
  _Block_object_dispose(&v25, 8);
  v2 = (void *)[[v1 alloc] initWithType:3];
  uint64_t v3 = [v2 jointCount];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v3];
  double v5 = [v2 jointName:0];
  [v4 setObject:@"human_root_3D" forKey:v5];

  id v6 = [v2 jointName:1];
  [v4 setObject:@"human_right_hip_3D" forKey:v6];

  id v7 = [v2 jointName:2];
  [v4 setObject:@"human_right_knee_3D" forKey:v7];

  uint32x4_t v8 = [v2 jointName:3];
  [v4 setObject:@"human_right_ankle_3D" forKey:v8];

  uint64_t v9 = [v2 jointName:4];
  [v4 setObject:@"human_left_hip_3D" forKey:v9];

  uint64_t v10 = [v2 jointName:5];
  [v4 setObject:@"human_left_knee_3D" forKey:v10];

  uint64_t v11 = [v2 jointName:6];
  [v4 setObject:@"human_left_ankle_3D" forKey:v11];

  uint64_t v12 = [v2 jointName:7];
  [v4 setObject:@"human_spine_3D" forKey:v12];

  uint64_t v13 = [v2 jointName:8];
  [v4 setObject:@"human_center_shoulder_3D" forKey:v13];

  uint64_t v14 = [v2 jointName:9];
  [v4 setObject:@"human_center_head_3D" forKey:v14];

  int v15 = [v2 jointName:10];
  [v4 setObject:@"human_top_head_3D" forKey:v15];

  uint64_t v16 = [v2 jointName:11];
  [v4 setObject:@"human_left_shoulder_3D" forKey:v16];

  v17 = [v2 jointName:12];
  [v4 setObject:@"human_left_elbow_3D" forKey:v17];

  id v18 = [v2 jointName:13];
  [v4 setObject:@"human_left_wrist_3D" forKey:v18];

  long long v19 = [v2 jointName:14];
  [v4 setObject:@"human_right_shoulder_3D" forKey:v19];

  long long v20 = [v2 jointName:15];
  [v4 setObject:@"human_right_elbow_3D" forKey:v20];

  uint64_t v21 = [v2 jointName:16];
  [v4 setObject:@"human_right_wrist_3D" forKey:v21];

  uint64_t v22 = [v4 copy];
  float v23 = (void *)+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::supportedHumanBodyPose3DKeypointsRev1;
  +[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::supportedHumanBodyPose3DKeypointsRev1 = v22;
}

@end