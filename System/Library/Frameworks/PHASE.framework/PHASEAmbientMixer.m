@interface PHASEAmbientMixer
+ (id)new;
- (AVAudioChannelLayout)inputChannelLayout;
- (PHASEAmbientMixer)init;
- (PHASEAmbientMixer)initWithIdentifier:(uint64_t)a3 listener:(void *)a4 inputChannelLayout:(void *)a5 orientation:(void *)a6 engine:(void *)a7 actionTreeObjectId:(unint64_t)a8;
- (PHASEListener)listener;
- (__n128)orientation;
- (void)setOrientation:;
- (void)setOrientation:(uint64_t)a1;
@end

@implementation PHASEAmbientMixer

- (PHASEAmbientMixer)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEAmbientMixer)initWithIdentifier:(uint64_t)a3 listener:(void *)a4 inputChannelLayout:(void *)a5 orientation:(void *)a6 engine:(void *)a7 actionTreeObjectId:(unint64_t)a8
{
  v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v25.receiver = a1;
  v25.super_class = (Class)PHASEAmbientMixer;
  v19 = [(PHASEMixer *)&v25 initWithIdentifier:v15];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_listener, a5);
    objc_storeStrong((id *)&v20->_inputChannelLayout, a6);
    *(__n128 *)&v20[1].super.super.isa = a2;
    v20->_actionTreeManager = (void *)Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v18 implementation] + 48), 7);
    v20->_submixHashName = Phase::GetStringHashId(v15, v21);
    v20->_actionTreeObjectId.mStorage[0] = a8;
    v20->_actionTreeObjectId.mStorage[1] = a9;
    v22 = v20;
  }

  return v20;
}

- (void)setOrientation:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  float v2 = a2.f32[1];
  float v3 = a2.f32[2];
  float v4 = a2.f32[3];
  float v5 = 1.0
     - sqrtf(vmuls_lane_f32(a2.f32[3], a2, 3)+ (float)(vmuls_lane_f32(a2.f32[2], a2, 2)+ (float)(vmulq_f32(a2, a2).f32[0] + vmuls_lane_f32(a2.f32[1], *(float32x2_t *)a2.f32, 1))));
  if (v5 < 0.0) {
    float v5 = -v5;
  }
  if (v5 <= 0.1)
  {
    *(float32x4_t *)(a1 + 96) = a2;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 72);
    long long v18 = *(_OWORD *)(a1 + 56);
    uint64_t v9 = **(void **)(v7 + 8);
    unint64_t v17 = 0;
    BOOL v16 = 1;
    uint64_t v10 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v9, 64, &v17, &v16);
    if (!v10)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v13 = **(id **)(v9 + 48);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "CommandQueue.hpp";
        __int16 v21 = 1024;
        int v22 = 100;
        _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v16)
    {
      v11 = **(id **)(v9 + 48);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "CommandQueue.hpp";
        __int16 v21 = 1024;
        int v22 = 89;
        __int16 v23 = 2048;
        double v24 = *(double *)&v17;
        __int16 v25 = 2048;
        uint64_t v26 = 64;
        _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)uint64_t v10 = &unk_26D479198;
    *(void *)(v10 + 16) = v7;
    *(_OWORD *)(v10 + 24) = v18;
    *(void *)(v10 + 40) = v8;
    *(float32x4_t *)(v10 + 48) = a2;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v9, 64);
    atomic_store(0, (unsigned __int8 *)(v9 + 40));
  }
  else
  {
    v6 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)a1) + 432);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "PHASEMixer.mm";
      __int16 v21 = 1024;
      int v22 = 576;
      __int16 v23 = 2048;
      double v24 = a2.f32[0];
      __int16 v25 = 2048;
      *(double *)&uint64_t v26 = v2;
      __int16 v27 = 2048;
      double v28 = v3;
      __int16 v29 = 2048;
      double v30 = v4;
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to initialize Ambient Mixer: orientation [%f, %f, %f, %f] must be normalized", buf, 0x3Au);
    }
  }
}

- (PHASEListener)listener
{
  return self->_listener;
}

- (__n128)orientation
{
  return a1[6];
}

- (AVAudioChannelLayout)inputChannelLayout
{
  return self->_inputChannelLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputChannelLayout, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setOrientation:
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  return Phase::ActionTreeManager::SetAmbientOrientation(v2, v1, v3, v4, &v6);
}

@end