@interface AVAudioPlayerNode
- (AVAudioPlayerNode)init;
- (AVAudioTime)nodeTimeForPlayerTime:(AVAudioTime *)playerTime;
- (AVAudioTime)playerTimeForNodeTime:(AVAudioTime *)nodeTime;
- (BOOL)isPlaying;
- (void)callLegacyCompletionHandlerForType:(int64_t)a3 legacyHandler:(id)a4;
- (void)didAttachToEngine:(id)a3;
- (void)pause;
- (void)play;
- (void)playAtTime:(AVAudioTime *)when;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(AVAudioPlayerNodeBufferOptions)options completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(AVAudioPlayerNodeBufferOptions)options completionHandler:(AVAudioNodeCompletionHandler)completionHandler;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler;
- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionHandler:(AVAudioNodeCompletionHandler)completionHandler;
- (void)scheduleFile:(AVAudioFile *)file atTime:(AVAudioTime *)when completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler;
- (void)scheduleFile:(AVAudioFile *)file atTime:(AVAudioTime *)when completionHandler:(AVAudioNodeCompletionHandler)completionHandler;
- (void)scheduleSegment:(AVAudioFile *)file startingFrame:(AVAudioFramePosition)startFrame frameCount:(AVAudioFrameCount)numberFrames atTime:(AVAudioTime *)when completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler;
- (void)scheduleSegment:(AVAudioFile *)file startingFrame:(AVAudioFramePosition)startFrame frameCount:(AVAudioFrameCount)numberFrames atTime:(AVAudioTime *)when completionHandler:(AVAudioNodeCompletionHandler)completionHandler;
- (void)stop;
@end

@implementation AVAudioPlayerNode

- (void)didAttachToEngine:(id)a3
{
  uint64_t v5 = [a3 implementation];
  v6 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  v7 = (std::recursive_mutex *)(v5 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  v11.receiver = self;
  v11.super_class = (Class)AVAudioPlayerNode;
  [(AVAudioNode *)&v11 didAttachToEngine:a3];
  impl = (id *)self->super._impl;

  impl[23] = 0;
  v9 = (void *)(*((uint64_t (**)(id *, void))*impl + 6))(impl, 0);
  impl[23] = v9;
  id v10 = v9;
  std::recursive_mutex::unlock(v6);
  std::recursive_mutex::unlock(v7);
}

- (BOOL)isPlaying
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  char v3 = (*(uint64_t (**)(void *))(*(void *)self->super._impl + 432))(self->super._impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (AVAudioTime)playerTimeForNodeTime:(AVAudioTime *)nodeTime
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (nodeTime
    && ![(AVAudioTime *)nodeTime isSampleTimeValid]
    && ![(AVAudioTime *)nodeTime isHostTimeValid])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      __int16 v9 = 1024;
      *(_DWORD *)id v10 = 71;
      *(_WORD *)&v10[4] = 2080;
      *(void *)&v10[6] = "AVAudioPlayerNode.mm";
      __int16 v11 = 1024;
      int v12 = 1181;
      __int16 v13 = 2080;
      v14 = "-[AVAudioPlayerNode playerTimeForNodeTime:]";
      __int16 v15 = 2080;
      v16 = "nodeTime == nil || nodeTime.sampleTimeValid || nodeTime.hostTimeValid";
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nodeTime == nil || nodeTime.sampleTimeValid || nodeTime.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)buf, (uint64_t)self->super._impl);
  char v6 = AVAudioPlayerNodeImpl::PlayerTimeForNodeTime((AVAudioPlayerNodeImpl *)self->super._impl, nodeTime);
  if (v10[10]) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)&v10[2]);
  }
  if (buf[8]) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
  }
  return v6;
}

- (AVAudioTime)nodeTimeForPlayerTime:(AVAudioTime *)playerTime
{
  char v3 = playerTime;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (playerTime
    && ![(AVAudioTime *)playerTime isSampleTimeValid]
    && ![(AVAudioTime *)v3 isHostTimeValid])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVAudioPlayerNode.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 1173;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "-[AVAudioPlayerNode nodeTimeForPlayerTime:]";
      *(_WORD *)&buf[44] = 2080;
      *(void *)&buf[46] = "playerTime == nil || playerTime.sampleTimeValid || playerTime.hostTimeValid";
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "playerTime == nil || playerTime.sampleTimeValid || playerTime.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v16, (uint64_t)self->super._impl);
  impl = self->super._impl;
  if (*((_DWORD *)impl + 48) == 1)
  {
    memset(buf, 0, 64);
    if (v3)
    {
      [(AVAudioTime *)v3 audioTimeStamp];
      uint8_t v7 = buf[56];
      double v8 = *(double *)&buf[16];
      char v3 = *(AVAudioTime **)&buf[8];
      double v9 = *(double *)buf;
    }
    else
    {
      uint8_t v7 = 0;
      double v9 = 0.0;
      double v8 = 0.0;
    }
    int v11 = v7 & 7;
    int v27 = v11;
    double v26 = v8;
    v25 = v3;
    double v12 = v9 + *((double *)impl + 25);
    double v24 = v12;
    if ((v7 & 3) != 3)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      __int16 v13 = (void *)(*(uint64_t (**)(void *))(*(void *)impl + 352))(impl);
      if (v13)
      {
        [v13 currentAudioTimeStamp];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
      }
      [*((id *)impl + 23) sampleRate];
      if (v11 != 7 && (v7 & 3) != 0 && (BYTE8(v23) & 3) == 3)
      {
        if ((v7 & 4) == 0)
        {
          double v8 = 1.0;
          if ((BYTE8(v23) & 4) != 0)
          {
            int v11 = v7 & 3 | 4;
            double v8 = *(double *)&v21;
            double v26 = *(double *)&v21;
          }
        }
        if ((v11 & 2) == 0)
        {
          char v3 = (AVAudioTime *)((double)*((uint64_t *)&v20 + 1) + (v12 - *(double *)&v20) * (v8 * 24000000.0 / v14));
          v25 = v3;
        }
        if ((v11 & 1) == 0) {
          double v24 = *(double *)&v20 + round(v14 / (v8 * 24000000.0) * (double)((uint64_t)v3 - *((void *)&v20 + 1)));
        }
        int v27 = v11 | 3;
      }
    }
    [*((id *)impl + 23) sampleRate];
    id v10 = +[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", &v24);
  }
  else
  {
    id v10 = 0;
  }
  if (v19) {
    std::recursive_mutex::unlock(v18);
  }
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  return v10;
}

- (void)stop
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v4, (uint64_t)self->super._impl);
  AVAudioNodeImplBase::Stop((AVAudioNodeImplBase *)self->super._impl);
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  if (v5)
  {
    char v3 = v4;
    std::recursive_mutex::unlock(v3);
  }
}

- (void)pause
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v4, (uint64_t)self->super._impl);
  AVAudioNodeImplBase::Pause((AVAudioNodeImplBase *)self->super._impl);
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  if (v5)
  {
    char v3 = v4;
    std::recursive_mutex::unlock(v3);
  }
}

- (void)playAtTime:(AVAudioTime *)when
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super._impl);
  AVAudioNodeImplBase::Start((AVAudioNodeImplBase *)self->super._impl, when);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    char v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (void)play
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v4, (uint64_t)self->super._impl);
  AVAudioNodeImplBase::Start((AVAudioNodeImplBase *)self->super._impl, 0);
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  if (v5)
  {
    char v3 = v4;
    std::recursive_mutex::unlock(v3);
  }
}

- (void)scheduleSegment:(AVAudioFile *)file startingFrame:(AVAudioFramePosition)startFrame frameCount:(AVAudioFrameCount)numberFrames atTime:(AVAudioTime *)when completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!file)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      __int16 v20 = 1024;
      *(_DWORD *)long long v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(void *)&v21[6] = "AVAudioPlayerNode.mm";
      __int16 v22 = 1024;
      int v23 = 1127;
      __int16 v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      __int16 v26 = 2080;
      int v27 = "stream != nil";
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "stream != nil");
  }
  if (when
    && ![(AVAudioTime *)when isSampleTimeValid]
    && ![(AVAudioTime *)when isHostTimeValid])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      __int16 v20 = 1024;
      *(_DWORD *)long long v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(void *)&v21[6] = "AVAudioPlayerNode.mm";
      __int16 v22 = 1024;
      int v23 = 1128;
      __int16 v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      __int16 v26 = 2080;
      int v27 = "when == nil || when.sampleTimeValid || when.hostTimeValid";
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "when == nil || when.sampleTimeValid || when.hostTimeValid");
  }
  if (startFrame < 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    char v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      __int16 v20 = 1024;
      *(_DWORD *)long long v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(void *)&v21[6] = "AVAudioPlayerNode.mm";
      __int16 v22 = 1024;
      int v23 = 1129;
      __int16 v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      __int16 v26 = 2080;
      int v27 = "startFrame >= 0";
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "startFrame >= 0");
  }
  if (!numberFrames)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v18 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      __int16 v20 = 1024;
      *(_DWORD *)long long v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(void *)&v21[6] = "AVAudioPlayerNode.mm";
      __int16 v22 = 1024;
      int v23 = 1130;
      __int16 v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      __int16 v26 = 2080;
      int v27 = "numberFrames > 0";
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "numberFrames > 0");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)buf, (uint64_t)self->super._impl);
  AVAudioPlayerNodeImpl::ScheduleSegment((uint64_t)self->super._impl, (uint64_t)file, startFrame, numberFrames, (uint64_t)when, callbackType, (uint64_t)completionHandler);
  if (v21[10]) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)&v21[2]);
  }
  if (buf[8]) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
  }
}

- (void)scheduleSegment:(AVAudioFile *)file startingFrame:(AVAudioFramePosition)startFrame frameCount:(AVAudioFrameCount)numberFrames atTime:(AVAudioTime *)when completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__AVAudioPlayerNode_scheduleSegment_startingFrame_frameCount_atTime_completionHandler___block_invoke;
  v7[3] = &unk_1E59659F0;
  v7[4] = self;
  v7[5] = completionHandler;
  [(AVAudioPlayerNode *)self scheduleSegment:file startingFrame:startFrame frameCount:*(void *)&numberFrames atTime:when completionCallbackType:0 completionHandler:v7];
}

uint64_t __87__AVAudioPlayerNode_scheduleSegment_startingFrame_frameCount_atTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callLegacyCompletionHandlerForType:a2 legacyHandler:*(void *)(a1 + 40)];
}

- (void)scheduleFile:(AVAudioFile *)file atTime:(AVAudioTime *)when completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!file)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 71;
      *(_WORD *)&v15[4] = 2080;
      *(void *)&v15[6] = "AVAudioPlayerNode.mm";
      __int16 v16 = 1024;
      int v17 = 1110;
      __int16 v18 = 2080;
      char v19 = "-[AVAudioPlayerNode scheduleFile:atTime:completionCallbackType:completionHandler:]";
      __int16 v20 = 2080;
      long long v21 = "file != nil";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "file != nil");
  }
  if (when
    && ![(AVAudioTime *)when isSampleTimeValid]
    && ![(AVAudioTime *)when isHostTimeValid])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    double v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "AVAEInternal.h";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 71;
      *(_WORD *)&v15[4] = 2080;
      *(void *)&v15[6] = "AVAudioPlayerNode.mm";
      __int16 v16 = 1024;
      int v17 = 1111;
      __int16 v18 = 2080;
      char v19 = "-[AVAudioPlayerNode scheduleFile:atTime:completionCallbackType:completionHandler:]";
      __int16 v20 = 2080;
      long long v21 = "when == nil || when.sampleTimeValid || when.hostTimeValid";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "when == nil || when.sampleTimeValid || when.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)buf, (uint64_t)self->super._impl);
  AVAudioPlayerNodeImpl::ScheduleSegment((uint64_t)self->super._impl, (uint64_t)file, 0, -1, (uint64_t)when, callbackType, (uint64_t)completionHandler);
  if (v15[10]) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)&v15[2]);
  }
  if (buf[8]) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
  }
}

- (void)scheduleFile:(AVAudioFile *)file atTime:(AVAudioTime *)when completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVAudioPlayerNode_scheduleFile_atTime_completionHandler___block_invoke;
  v5[3] = &unk_1E59659F0;
  v5[4] = self;
  v5[5] = completionHandler;
  [(AVAudioPlayerNode *)self scheduleFile:file atTime:when completionCallbackType:0 completionHandler:v5];
}

uint64_t __59__AVAudioPlayerNode_scheduleFile_atTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callLegacyCompletionHandlerForType:a2 legacyHandler:*(void *)(a1 + 40)];
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(AVAudioPlayerNodeBufferOptions)options completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (when
    && ![(AVAudioTime *)when isSampleTimeValid]&& ![(AVAudioTime *)when isHostTimeValid])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    id v10 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v15 = "AVAEInternal.h";
      __int16 v16 = 1024;
      int v17 = 71;
      __int16 v18 = 2080;
      char v19 = "AVAudioPlayerNode.mm";
      __int16 v20 = 1024;
      int v21 = 1095;
      __int16 v22 = 2080;
      int v23 = "-[AVAudioPlayerNode scheduleBuffer:atTime:options:completionCallbackType:completionHandler:]";
      __int16 v24 = 2080;
      v25 = "when == nil || when.sampleTimeValid || when.hostTimeValid";
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "when == nil || when.sampleTimeValid || when.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->super._impl);
  int v11 = [*((id *)self->super._impl + 23) channelCount];
  if (v11 != [(AVAudioFormat *)[(AVAudioBuffer *)buffer format] channelCount])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    double v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v15 = "AVAEInternal.h";
      __int16 v16 = 1024;
      int v17 = 71;
      __int16 v18 = 2080;
      char v19 = "AVAudioPlayerNode.mm";
      __int16 v20 = 1024;
      int v21 = 740;
      __int16 v22 = 2080;
      int v23 = "ScheduleBuffer";
      __int16 v24 = 2080;
      v25 = "_outputFormat.channelCount == buffer.format.channelCount";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_outputFormat.channelCount == buffer.format.channelCount");
  }
  operator new();
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(AVAudioPlayerNodeBufferOptions)options completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__AVAudioPlayerNode_scheduleBuffer_atTime_options_completionHandler___block_invoke;
  v6[3] = &unk_1E59659F0;
  v6[4] = self;
  v6[5] = completionHandler;
  [(AVAudioPlayerNode *)self scheduleBuffer:buffer atTime:when options:options completionCallbackType:0 completionHandler:v6];
}

uint64_t __69__AVAudioPlayerNode_scheduleBuffer_atTime_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callLegacyCompletionHandlerForType:a2 legacyHandler:*(void *)(a1 + 40)];
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
}

- (void)callLegacyCompletionHandlerForType:(int64_t)a3 legacyHandler:(id)a4
{
  if (!a3)
  {
    if (a4) {
      (*((void (**)(id))a4 + 2))(a4);
    }
  }
}

- (AVAudioPlayerNode)init
{
}

@end