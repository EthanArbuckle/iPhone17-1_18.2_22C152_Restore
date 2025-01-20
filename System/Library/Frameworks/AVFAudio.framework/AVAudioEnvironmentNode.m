@interface AVAudioEnvironmentNode
- (AVAudio3DAngularOrientation)listenerAngularOrientation;
- (AVAudio3DPoint)listenerPosition;
- (AVAudio3DVectorOrientation)listenerVectorOrientation;
- (AVAudioEnvironmentDistanceAttenuationParameters)distanceAttenuationParameters;
- (AVAudioEnvironmentNode)init;
- (AVAudioEnvironmentOutputType)outputType;
- (AVAudioEnvironmentReverbParameters)reverbParameters;
- (AVAudioNodeBus)nextAvailableInputBus;
- (BOOL)isListenerHeadTrackingEnabled;
- (NSArray)applicableRenderingAlgorithms;
- (float)outputVolume;
- (void)setListenerAngularOrientation:(AVAudio3DAngularOrientation)listenerAngularOrientation;
- (void)setListenerHeadTrackingEnabled:(BOOL)a3;
- (void)setListenerPosition:(AVAudio3DPoint)listenerPosition;
- (void)setListenerVectorOrientation:(AVAudio3DVectorOrientation *)listenerVectorOrientation;
- (void)setOutputType:(AVAudioEnvironmentOutputType)outputType;
- (void)setOutputVolume:(float)outputVolume;
@end

@implementation AVAudioEnvironmentNode

- (AVAudioEnvironmentReverbParameters)reverbParameters
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (AVAudioEnvironmentReverbParameters *)*((void *)self->super._impl + 45);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (AVAudioEnvironmentDistanceAttenuationParameters)distanceAttenuationParameters
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (AVAudioEnvironmentDistanceAttenuationParameters *)*((void *)self->super._impl + 42);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (AVAudio3DAngularOrientation)listenerAngularOrientation
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  float v4 = impl[75];
  float v5 = impl[76];
  float v6 = impl[77];
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  float v7 = v4;
  float v8 = v5;
  float v9 = v6;
  result.roll = v9;
  result.pitch = v8;
  result.yaw = v7;
  return result;
}

- (void)setListenerAngularOrientation:(AVAudio3DAngularOrientation)listenerAngularOrientation
{
  float roll = listenerAngularOrientation.roll;
  float pitch = listenerAngularOrientation.pitch;
  float yaw = listenerAngularOrientation.yaw;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super._impl);
  impl = (char *)self->super._impl;
  if (*((float *)impl + 75) != yaw || *((float *)impl + 76) != pitch || *((float *)impl + 77) != roll)
  {
    *((float *)impl + 75) = yaw;
    *((float *)impl + 76) = pitch;
    *((float *)impl + 77) = roll;
    *(void *)(impl + 292) = 1065353216;
    *(_OWORD *)(impl + 276) = kInitialVectorOrientation;
    RotateVectorByEulerAngles(yaw, pitch, roll, (AVAudio3DPoint *)impl + 23);
    RotateVectorByEulerAngles(*((float *)impl + 75), *((float *)impl + 76), *((float *)impl + 77), (AVAudio3DPoint *)impl + 24);
    (*(void (**)(char *, uint64_t, void, void, float))(*(void *)impl + 128))(impl, 19, 0, 0, *((float *)impl + 75));
    (*(void (**)(char *, uint64_t, void, void, float))(*(void *)impl + 128))(impl, 20, 0, 0, *((float *)impl + 76));
    (*(void (**)(char *, uint64_t, void, void, float))(*(void *)impl + 128))(impl, 21, 0, 0, *((float *)impl + 77));
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10)
  {
    float v8 = v9;
    std::recursive_mutex::unlock(v8);
  }
}

- (AVAudio3DVectorOrientation)listenerVectorOrientation
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  *retstr = *(AVAudio3DVectorOrientation *)((char *)self->super._impl + 276);
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    float v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
  return result;
}

- (void)setListenerVectorOrientation:(AVAudio3DVectorOrientation *)listenerVectorOrientation
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v107, (uint64_t)self->super._impl);
  float v5 = (char *)*p_impl;
  float x = listenerVectorOrientation->forward.x;
  float y = listenerVectorOrientation->forward.y;
  float z = listenerVectorOrientation->forward.z;
  *(void *)&long long v9 = *(void *)&listenerVectorOrientation->up.x;
  v10.i32[0] = LODWORD(listenerVectorOrientation->forward.x);
  v10.f32[1] = z;
  v10.i64[1] = v9;
  float v11 = listenerVectorOrientation->up.z;
  if (((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v10)))) & 1) != 0
     || y != 0.0
     || v11 != 0.0)
    && (*((float *)v5 + 69) != x
     || *((float *)v5 + 70) != y
     || *((float *)v5 + 71) != z
     || *((float *)v5 + 72) != *(float *)&v9
     || *((float *)v5 + 73) != *((float *)&v9 + 1)
     || *((float *)v5 + 74) != v11))
  {
    float v12 = sqrtf((float)((float)(y * y) + (float)(x * x)) + (float)(z * z));
    if (v12 != 0.0)
    {
      float v13 = 1.0 / v12;
      float x = x * v13;
      float y = y * v13;
      float z = z * v13;
    }
    float v14 = *((float *)&v9 + 1);
    float v15 = sqrtf(vmlas_n_f32(vmuls_lane_f32(*((float *)&v9 + 1), *(float32x2_t *)&v9, 1), *(float *)&v9, *(float *)&v9)+ (float)(v11 * v11));
    if (v15 != 0.0)
    {
      float v16 = 1.0 / v15;
      *(float *)&long long v9 = *(float *)&v9 * v16;
      float v14 = *((float *)&v9 + 1) * v16;
      float v11 = v11 * v16;
    }
    *((float *)v5 + 69) = x;
    *((float *)v5 + 70) = y;
    *((float *)v5 + 71) = z;
    *((_DWORD *)v5 + 72) = v9;
    *((float *)v5 + 73) = v14;
    *((float *)v5 + 74) = v11;
    float v105 = z;
    float v106 = v11;
    if (fabsf(z) <= 0.0001)
    {
      *((_DWORD *)v5 + 75) = 0;
      float v21 = (double)((SLODWORD(y) >> 31) | 1) * 90.0;
      *((float *)v5 + 76) = v21;
      float v22 = 1.0;
      if (v11 <= 1.0)
      {
        float v22 = v11;
        if (v11 < -1.0) {
          float v22 = -1.0;
        }
      }
      float v23 = acosf(v22);
      float v26 = v106;
      float v27 = 57.296;
    }
    else
    {
      int v17 = (SLODWORD(x) >> 31) | 1;
      float v18 = (float)((float)((float)(x * 0.0) + 0.0) - z) / sqrtf((float)((float)(x * x) + 0.0) + (float)(z * z));
      float v103 = x;
      long long v104 = v9;
      if ((LODWORD(z) & 0x80000000) != 0)
      {
        float v28 = 1.0;
        if (v18 <= 1.0)
        {
          float v28 = v18;
          if (v18 < -1.0) {
            float v28 = -1.0;
          }
        }
        float v20 = (float)((float)v17 * 57.296) * acosf(v28);
      }
      else
      {
        float v19 = 1.0;
        if (v18 <= 1.0)
        {
          float v19 = v18;
          if (v18 < -1.0) {
            float v19 = -1.0;
          }
        }
        float v20 = ((float)(acosf(v19) * -57.296) + 180.0) * -(double)v17;
      }
      *((float *)v5 + 75) = v20;
      __float2 v31 = __sincosf_stret((float)(v20 * 0.017453) * 0.5);
      float cosval = v31.__cosval;
      LODWORD(v29) = *(void *)&v31;
      float v32 = (float)(v29 * 0.0) + (float)(cosval * 0.0);
      float v33 = v29 - (float)(cosval * 0.0);
      float v34 = cosval + (float)((float)(v29 * 0.0) * 0.0);
      float v35 = -v33;
      float v36 = -(float)((float)(cosval * 0.0) - (float)(v29 * 0.0));
      float v37 = sqrtf((float)((float)((float)(v32 * v32) + (float)(v34 * v34)) + (float)(v33 * v33))+ (float)((float)-(float)((float)(v29 * 0.0) - (float)(cosval * 0.0))* (float)-(float)((float)(v29 * 0.0) - (float)(cosval * 0.0))));
      if (v37 == 0.0)
      {
        float v39 = cosval + (float)((float)(v29 * 0.0) * 0.0);
      }
      else
      {
        float v38 = 1.0 / v37;
        float v39 = v34 * (float)(1.0 / v37);
        float v32 = v32 * v38;
        float v35 = v38 * v35;
        float v36 = v38 * v36;
      }
      float v40 = v36 + (float)((float)((float)(v32 * -0.0) + (float)(v39 * 0.0)) + (float)(v35 * -0.0));
      float v41 = (float)((float)((float)(v32 * 0.0) + (float)(v39 * 0.0)) - v35) + (float)(v36 * -0.0);
      float v42 = (float)((float)(v32 + (float)(v39 * 0.0)) + (float)(v35 * 0.0)) + (float)(v36 * 0.0);
      float v43 = (float)((float)((float)(v32 * 0.0) - v39) + (float)(v35 * -0.0)) + (float)(v36 * 0.0);
      float v44 = (float)((float)((float)(v34 * v41) - (float)(v40 * v32)) - (float)(v42 * v36)) + (float)(v43 * v35);
      float v45 = (float)((float)((float)(v36 * v41) - (float)(v40 * v35)) + (float)(v42 * v34)) - (float)(v43 * v32);
      float v46 = (float)((float)((float)-(float)(v35 * v41) - (float)(v40 * v36)) + (float)(v42 * v32)) + (float)(v43 * v34);
      float v47 = (float)((float)((float)(y * v45) + (float)(v103 * v44)) + (float)(v105 * v46))
          / sqrtf((float)((float)(v45 * v45) + (float)(v44 * v44)) + (float)(v46 * v46));
      float v48 = 1.0;
      if (v47 <= 1.0)
      {
        float v48 = v47;
        if (v47 < -1.0) {
          float v48 = -1.0;
        }
      }
      int v49 = (SLODWORD(y) >> 31) | 1;
      float v50 = (float)(acosf(v48) * 57.296) * (float)v49;
      *((float *)v5 + 76) = v50;
      __float2 v51 = __sincosf_stret((float)(v50 * 0.017453) * 0.5);
      float v52 = -(float)((float)(v29 * v51.__sinval) - (float)((float)(cosval * v51.__cosval) * 0.0));
      float v53 = (float)(v29 * (float)(v51.__cosval * 0.0)) + (float)(v51.__sinval * cosval);
      float v54 = (float)(cosval * (float)(v51.__sinval * -0.0)) + (float)(v51.__cosval * v29);
      float v55 = (float)(cosval * v51.__cosval) + (float)((float)(v29 * v51.__sinval) * 0.0);
      float v56 = -v54;
      float v57 = -(float)((float)((float)(cosval * v51.__cosval) * 0.0) - (float)(v29 * v51.__sinval));
      float v58 = sqrtf((float)((float)((float)(v53 * v53) + (float)(v55 * v55)) + (float)(v54 * v54)) + (float)(v52 * v52));
      if (v58 == 0.0)
      {
        float v60 = (float)(cosval * v51.__cosval) + (float)((float)(v29 * v51.__sinval) * 0.0);
      }
      else
      {
        float v59 = 1.0 / v58;
        float v60 = v55 * (float)(1.0 / v58);
        float v53 = v53 * v59;
        float v56 = v59 * v56;
        float v57 = v59 * v57;
      }
      float v61 = (float)((float)((float)(v53 * -0.0) + (float)(v60 * 0.0)) - v56) + (float)(v57 * -0.0);
      float v62 = (float)((float)((float)(v53 * 0.0) + (float)(v60 * 0.0)) + (float)(v56 * 0.0)) - v57;
      float v63 = (float)((float)(v60 + (float)(v53 * -0.0)) + (float)(v56 * 0.0)) + (float)(v57 * 0.0);
      float v64 = (float)((float)(v53 + (float)(v60 * 0.0)) + (float)(v56 * -0.0)) + (float)(v57 * 0.0);
      float v65 = (float)((float)((float)(v55 * v62) - (float)(v61 * v53)) - (float)(v63 * v57)) + (float)(v64 * v56);
      float v66 = (float)((float)((float)(v57 * v62) - (float)(v61 * v56)) + (float)(v63 * v55)) - (float)(v64 * v53);
      float v67 = (float)((float)((float)-(float)(v56 * v62) - (float)(v61 * v57)) + (float)(v63 * v53)) + (float)(v64 * v55);
      float v68 = (float)((float)((float)(v14 * v66) + (float)(*(float *)&v104 * v65)) + (float)(v106 * v67))
          / sqrtf((float)((float)(v66 * v66) + (float)(v65 * v65)) + (float)(v67 * v67));
      float v69 = 1.0;
      if (v68 <= 1.0)
      {
        float v69 = v68;
        if (v68 < -1.0) {
          float v69 = -1.0;
        }
      }
      float v23 = acosf(v69) * 57.296;
      float v26 = v106;
      v24.i64[1] = *((void *)&v104 + 1);
      if (COERCE_INT((float)(v67 * *(float *)&v104) - (float)(v65 * v106)) >= 0) {
        int v70 = (SLODWORD(y) >> 31) | 1;
      }
      else {
        int v70 = -v49;
      }
      float v27 = (float)v70;
    }
    *((float *)v5 + 77) = v23 * v27;
    v25.i64[0] = *(void *)(v5 + 276);
    v25.f32[2] = v105;
    int32x4_t v71 = (int32x4_t)vnegq_f32(v25);
    v24.i64[0] = *((void *)v5 + 36);
    float32x4_t v72 = v24;
    v72.f32[2] = v26;
    float32x4_t v73 = vmlsq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v71, v71), (int8x16_t)v71, 0xCuLL), vnegq_f32(v72)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v72, (int32x4_t)v72), (int8x16_t)v72, 0xCuLL), v25);
    float v74 = *(float *)&v71.i32[2] + (float)(v24.f32[1] + v73.f32[2]);
    if (v74 >= 0.0)
    {
      float v84 = sqrtf(v74 + 1.0);
      float v85 = v84 + v84;
      float32x2_t v86 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v84 + v84));
      float32x2_t v87 = vmul_f32(v86, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v84 + v84), v86));
      float v88 = vmul_f32(v87, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v84 + v84), v87)).f32[0];
      float v94 = (float)(v26 - *(float *)&v71.i32[1]) * v88;
      float v95 = (float)(*(float *)v71.i32 - v73.f32[1]) * v88;
      float v96 = (float)(v73.f32[0] - v24.f32[0]) * v88;
      float v83 = v85 * 0.25;
    }
    else
    {
      if (v73.f32[2] >= v24.f32[1] && v73.f32[2] >= *(float *)&v71.i32[2])
      {
        float v89 = sqrtf((float)((float)(1.0 - v24.f32[1]) - *(float *)&v71.i32[2]) + v73.f32[2]);
        *(float *)&unsigned int v90 = v89 + v89;
        float32x2_t v91 = vrecpe_f32((float32x2_t)v90);
        float32x2_t v92 = vmul_f32(v91, vrecps_f32((float32x2_t)v90, v91));
        float v93 = vmul_f32(v92, vrecps_f32((float32x2_t)v90, v92)).f32[0];
        float v94 = *(float *)&v90 * 0.25;
        float v95 = (float)(v24.f32[0] + v73.f32[0]) * v93;
        float v96 = (float)(*(float *)v71.i32 + v73.f32[1]) * v93;
        float v97 = v26 - *(float *)&v71.i32[1];
LABEL_54:
        float v83 = v97 * v93;
        goto LABEL_55;
      }
      float v76 = 1.0 - v73.f32[2];
      float v77 = *(float *)&v71.i32[1] + v26;
      if (v24.f32[1] >= *(float *)&v71.i32[2])
      {
        float v98 = sqrtf(v24.f32[1] + (float)(v76 - *(float *)&v71.i32[2]));
        float v99 = v98 + v98;
        float32x2_t v100 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v98 + v98));
        float32x2_t v101 = vmul_f32(v100, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v98 + v98), v100));
        float v93 = vmul_f32(v101, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v98 + v98), v101)).f32[0];
        float v94 = (float)(v24.f32[0] + v73.f32[0]) * v93;
        float v95 = v99 * 0.25;
        float v96 = v77 * v93;
        float v97 = *(float *)v71.i32 - v73.f32[1];
        goto LABEL_54;
      }
      float v78 = sqrtf(*(float *)&v71.i32[2] + (float)(v76 - v24.f32[1]));
      float v79 = v78 + v78;
      float32x2_t v80 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v78 + v78));
      float32x2_t v81 = vmul_f32(v80, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v78 + v78), v80));
      float v82 = vmul_f32(v81, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v78 + v78), v81)).f32[0];
      float v94 = (float)(*(float *)v71.i32 + v73.f32[1]) * v82;
      float v95 = v77 * v82;
      float v96 = v79 * 0.25;
      float v83 = (float)(v73.f32[0] - v24.f32[0]) * v82;
    }
LABEL_55:
    *(float *)&long long v102 = -v96;
    *((float *)&v102 + 1) = v94;
    *((float *)&v102 + 2) = -v95;
    *((float *)&v102 + 3) = v83;
    long long v111 = v102;
    (*(void (**)(char *, uint64_t, void, void, long long *, uint64_t))(*(void *)v5 + 144))(v5, 3102, 0, 0, &v111, 16);
  }
  if (v110) {
    std::recursive_mutex::unlock(v109);
  }
  if (v108) {
    std::recursive_mutex::unlock(v107);
  }
}

- (AVAudio3DPoint)listenerPosition
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  float v4 = impl[66];
  float v5 = impl[67];
  float v6 = impl[68];
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  float v7 = v4;
  float v8 = v5;
  float v9 = v6;
  result.float z = v9;
  result.float y = v8;
  result.float x = v7;
  return result;
}

- (void)setListenerPosition:(AVAudio3DPoint)listenerPosition
{
  float z = listenerPosition.z;
  float y = listenerPosition.y;
  float x = listenerPosition.x;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  if (impl[66] != x || impl[67] != y || impl[68] != z)
  {
    impl[66] = x;
    impl[67] = y;
    impl[68] = z;
    float v8 = (float *)*((void *)impl + 39);
    float v9 = impl + 80;
    if (v8 != impl + 80)
    {
      do
      {
        AVAudio3DMixingImpl::RecalculateAndSetSphericalCoordsOnMixer(*((AVAudio3DMixingImpl **)v8 + 4));
        float32x4_t v10 = (float *)*((void *)v8 + 1);
        if (v10)
        {
          do
          {
            char v11 = v10;
            float32x4_t v10 = *(float **)v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            char v11 = (float *)*((void *)v8 + 2);
            BOOL v12 = *(void *)v11 == (void)v8;
            float v8 = v11;
          }
          while (!v12);
        }
        float v8 = v11;
      }
      while (v11 != v9);
    }
  }
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  if (v15)
  {
    char v13 = v14;
    std::recursive_mutex::unlock(v13);
  }
}

- (NSArray)applicableRenderingAlgorithms
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->super._impl);
  unsigned int v3 = objc_msgSend((id)(*(uint64_t (**)(void *, void))(*(void *)self->super._impl + 48))(self->super._impl, 0), "channelCount");
  float v4 = (void *)MEMORY[0x1E4F1C978];
  if (v3 < 3)
  {
    uint64_t v7 = [NSNumber numberWithInteger:0];
    uint64_t v8 = [NSNumber numberWithInteger:1];
    uint64_t v9 = [NSNumber numberWithInteger:2];
    uint64_t v10 = [NSNumber numberWithInteger:6];
    uint64_t v11 = [NSNumber numberWithInteger:3];
    uint64_t v6 = objc_msgSend(v4, "arrayWithObjects:", v7, v8, v9, v10, v11, objc_msgSend(NSNumber, "numberWithInteger:", 7), 0);
  }
  else
  {
    uint64_t v5 = [NSNumber numberWithInteger:3];
    uint64_t v6 = objc_msgSend(v4, "arrayWithObjects:", v5, objc_msgSend(NSNumber, "numberWithInteger:", 7), 0);
  }
  BOOL v12 = (NSArray *)v6;
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  if (v15) {
    std::recursive_mutex::unlock(v14);
  }
  return v12;
}

- (AVAudioNodeBus)nextAvailableInputBus
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  impl = self->super._impl;
  AVAudioNodeBus v4 = impl[4];
  if (v4)
  {
    AVAudioNodeBus v5 = 0;
    uint64_t v6 = impl[3];
    while (((*(void *)(v6 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    {
      if (v4 == ++v5)
      {
        AVAudioNodeBus v5 = v4;
        break;
      }
    }
  }
  else
  {
    AVAudioNodeBus v5 = 0;
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  return v5;
}

- (float)outputVolume
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  float v3 = *((float *)self->super._impl + 46);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (BOOL)isListenerHeadTrackingEnabled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  float v3 = *p_impl;
  int v11 = 0;
  if (((*(uint64_t (**)(void *, uint64_t, void, void, int *, uint64_t))(*(void *)v3 + 152))(v3, 3111, 0, 0, &v11, 4) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    AVAudioNodeBus v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      char v13 = "AVAudioEnvironmentNodeImpl.mm";
      __int16 v14 = 1024;
      int v15 = 372;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d error getting spatial mixer headtracking property", buf, 0x12u);
    }
  }
  int v5 = v11;
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  return v5 != 0;
}

- (void)setListenerHeadTrackingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  int v5 = *p_impl;
  BOOL v12 = v3;
  if (((*(uint64_t (**)(void *, uint64_t, void, void, BOOL *, uint64_t))(*(void *)v5 + 144))(v5, 3111, 0, 0, &v12, 4) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    char v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = "Enabling";
      __int16 v14 = "AVAudioEnvironmentNodeImpl.mm";
      *(_DWORD *)buf = 136315650;
      if (!v12) {
        uint64_t v7 = "Disabling";
      }
      __int16 v15 = 1024;
      int v16 = 358;
      __int16 v17 = 2080;
      float v18 = v7;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d error %s spatial mixer headtracking", buf, 0x1Cu);
    }
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
}

- (void)setOutputVolume:(float)outputVolume
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  if (impl[46] != outputVolume)
  {
    float v7 = 1.0;
    if (outputVolume < 1.0) {
      float v7 = outputVolume;
    }
    if (outputVolume <= 0.0) {
      float v7 = 0.0;
    }
    impl[46] = v7;
    if (v7 <= 0.0) {
      v5.n128_u32[0] = -1024458752;
    }
    else {
      v5.n128_f32[0] = log10f(v7) * 20.0;
    }
    (*(void (**)(float *, uint64_t, uint64_t, void, __n128))(*(void *)impl + 128))(impl, 3, 2, 0, v5);
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10)
  {
    char v8 = v9;
    std::recursive_mutex::unlock(v8);
  }
}

- (AVAudioEnvironmentOutputType)outputType
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  AVAudioEnvironmentOutputType v3 = *((void *)self->super._impl + 24);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setOutputType:(AVAudioEnvironmentOutputType)outputType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  __n128 v5 = (AVAudioEnvironmentNodeImpl *)*p_impl;
  if (*((void *)v5 + 24) != outputType)
  {
    *((void *)v5 + 24) = outputType;
    switch(outputType)
    {
      case AVAudioEnvironmentOutputTypeAuto:
        AVAudioEnvironmentNodeImpl::UpdateAutomaticOutputType(v5);
        break;
      case AVAudioEnvironmentOutputTypeHeadphones:
        int v14 = 1;
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        char v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        int v7 = 1;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          int v16 = "AVAudioEnvironmentNodeImpl.mm";
          __int16 v17 = 1024;
          int v18 = 328;
          _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d setting output type = headphones", buf, 0x12u);
        }
        goto LABEL_18;
      case AVAudioEnvironmentOutputTypeBuiltInSpeakers:
        int v14 = 2;
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        char v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          int v16 = "AVAudioEnvironmentNodeImpl.mm";
          __int16 v17 = 1024;
          int v18 = 333;
          _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d setting output type = built-in speakers", buf, 0x12u);
        }
        int v7 = 2;
        goto LABEL_18;
      case AVAudioEnvironmentOutputTypeExternalSpeakers:
        int v14 = 3;
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        char v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          int v16 = "AVAudioEnvironmentNodeImpl.mm";
          __int16 v17 = 1024;
          int v18 = 323;
          _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d setting output type = external speakers", buf, 0x12u);
        }
        int v7 = 3;
LABEL_18:
        if (v7 != *((_DWORD *)v5 + 50))
        {
          *((_DWORD *)v5 + 50) = v7;
          (*(void (**)(AVAudioEnvironmentNodeImpl *, uint64_t, void, void, int *, uint64_t))(*(void *)v5 + 144))(v5, 3100, 0, 0, &v14, 4);
        }
        break;
      default:
        break;
    }
  }
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
}

- (AVAudioEnvironmentNode)init
{
}

@end