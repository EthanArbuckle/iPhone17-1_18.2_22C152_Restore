@interface VCMediaStreamSynchronizer
- (VCMediaStreamSynchronizer)initWithSourceSampleRate:(unsigned int)a3 destinationSampleRate:(unsigned int)a4;
- (unsigned)sourceSampleRate;
- (void)dealloc;
@end

@implementation VCMediaStreamSynchronizer

- (VCMediaStreamSynchronizer)initWithSourceSampleRate:(unsigned int)a3 destinationSampleRate:(unsigned int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    v17.receiver = self;
    v17.super_class = (Class)VCMediaStreamSynchronizer;
    v7 = [(VCMediaStreamSynchronizer *)&v17 init];
    v8 = v7;
    if (v7)
    {
      v7->_source.int64_t sampleRate = a3;
      v7->_destination.int64_t sampleRate = a4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int64_t sampleRate = v8->_source.sampleRate;
          int64_t v12 = v8->_destination.sampleRate;
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCMediaStreamSynchronizer initWithSourceSampleRate:destinationSampleRate:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 47;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v8;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = sampleRate;
          *(_WORD *)&buf[48] = 2048;
          *(void *)&buf[50] = v12;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: sourceSampleRate:%ld destinationSampleRate:%ld", buf, 0x3Au);
        }
      }
      v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v8->_mediaStreamSynchronizerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCMediaStreamSynchronizer.mediaStreamSynchronizerQueue", v13);
      uint64_t v19 = 0;
      memset(buf, 0, sizeof(buf));
      VCVideoPlayer_Create((uint64_t *)&v8->_videoPlayerHandle, (uint64_t)buf);
      v8->_sourceState = 1;
      *(void *)&v8->_sourcePlayoutHandlerLock._os_unfair_lock_opaque = 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMediaStreamSynchronizer initWithSourceSampleRate:destinationSampleRate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 41;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = self;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a3;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = a4;
        _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p] failed! sourceSampleRate:%u destinationSampleRate:%u", buf, 0x32u);
      }
    }
    return 0;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  dispatch_release((dispatch_object_t)self->_mediaStreamSynchronizerQueue);
  _Block_release(self->_destinationHandler);
  self->_destinationHandler = 0;
  _Block_release(self->_sourcePlayoutTimeUpdatedHandler);
  VCVideoPlayer_Destroy(&self->_videoPlayerHandle);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSynchronizer;
  [(VCMediaStreamSynchronizer *)&v3 dealloc];
}

- (unsigned)sourceSampleRate
{
  return self->_source.sampleRate;
}

double __VCMediaStreamSynchronizer_updateDestinationNTPTime_block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 72) = result;
  *(_DWORD *)(*(void *)(a1 + 32) + 88) = *(_DWORD *)(a1 + 48);
  return result;
}

uint64_t __VCMediaStreamSynchronizer_resetDestinationState_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = 0;
  *(_DWORD *)(*(void *)(result + 32) + 88) = 0;
  return result;
}

uint64_t __VCMediaStreamSynchronizer_scheduleTimeForDestinationRTPTimestamp_block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unsigned int v19 = 0;
  uint64_t result = _VCMediaStreamSynchronizer_sourceRTPTimestampFromDestinationRTPTimestampInternal(*(void *)(a1 + 32), *(_DWORD *)(a1 + 48), (int *)&v19);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(v3 + 16);
    unsigned int v5 = *(_DWORD *)(v3 + 96);
    BOOL v6 = v19 >= v5 || v19 - v5 >= 0x7FFFFFFF;
    int v7 = !v6;
    BOOL v6 = v5 >= v19;
    unsigned int v8 = v5 - v19;
    if (v6 || v8 >= 0x7FFFFFFF) {
      int v10 = v7;
    }
    else {
      int v10 = -1;
    }
    int v11 = v4 + v10;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ((double)v19 + (double)(v4 + v10) * 4294967300.0)
                                                                / (double)*(uint64_t *)(v3 + 56);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          *(_DWORD *)buf = 136316418;
          uint64_t v21 = v12;
          __int16 v22 = 2080;
          v23 = "VCMediaStreamSynchronizer_scheduleTimeForDestinationRTPTimestamp_block_invoke";
          __int16 v24 = 1024;
          int v25 = 187;
          __int16 v26 = 2048;
          uint64_t v27 = v15;
          __int16 v28 = 1024;
          int v29 = v11;
          __int16 v30 = 2048;
          uint64_t v31 = v16;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: wrapCount=%d sourceTime=%.9f", buf, 0x36u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = v12;
        __int16 v22 = 2080;
        v23 = "VCMediaStreamSynchronizer_scheduleTimeForDestinationRTPTimestamp_block_invoke";
        __int16 v24 = 1024;
        int v25 = 187;
        __int16 v26 = 2048;
        uint64_t v27 = v17;
        __int16 v28 = 1024;
        int v29 = v11;
        __int16 v30 = 2048;
        uint64_t v31 = v18;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: wrapCount=%d sourceTime=%.9f", buf, 0x36u);
      }
    }
    return kdebug_trace();
  }
  return result;
}

BOOL __VCMediaStreamSynchronizer_sourceRTPTimestampFromDestinationRTPTimestamp_block_invoke(uint64_t a1)
{
  BOOL result = _VCMediaStreamSynchronizer_sourceRTPTimestampFromDestinationRTPTimestampInternal(*(void *)(a1 + 32), *(_DWORD *)(a1 + 56), (int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  v1 = *(_DWORD **)(a1 + 32);
  if (v1[25] != 1 && v1[16] && v1[24])
  {
    int v4 = v1[22];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v4)
    {
      BOOL v6 = (unsigned char *)MEMORY[0x1E4F47A40];
      int v7 = (NSObject **)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *v7;
        int v10 = *v7;
        if (*v6)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = *(void *)(a1 + 32);
            int v12 = *(_DWORD *)(v11 + 96);
            int v13 = *(_DWORD *)(v11 + 64);
            uint64_t v14 = *(void *)(v11 + 48);
            uint64_t v15 = *(void *)(v11 + 56);
            int v16 = **(_DWORD **)(a1 + 48);
            int v17 = *(_DWORD *)(v11 + 88);
            uint64_t v18 = *(void *)(v11 + 72);
            uint64_t v19 = *(void *)(v11 + 80);
            int v47 = 136317954;
            uint64_t v48 = v8;
            __int16 v49 = 2080;
            v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
            __int16 v51 = 1024;
            int v52 = 225;
            __int16 v53 = 2048;
            uint64_t v54 = v11;
            __int16 v55 = 1024;
            int v56 = v12;
            __int16 v57 = 1024;
            int v58 = v13;
            __int16 v59 = 2048;
            uint64_t v60 = v14;
            __int16 v61 = 1024;
            int v62 = v15;
            __int16 v63 = 1024;
            int v64 = v16;
            __int16 v65 = 1024;
            int v66 = v17;
            __int16 v67 = 2048;
            uint64_t v68 = v18;
            __int16 v69 = 1024;
            int v70 = v19;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: lastSrcRTP=%u srcSRRTP=%u srcSRNPT=%.9f srcRate=%d dstRTP=%u dstSrRTP=%u dstSRNTP=%.9f dstRate=%d", (uint8_t *)&v47, 0x5Eu);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v36 = *(void *)(a1 + 32);
          int v37 = *(_DWORD *)(v36 + 96);
          int v38 = *(_DWORD *)(v36 + 64);
          uint64_t v39 = *(void *)(v36 + 48);
          uint64_t v40 = *(void *)(v36 + 56);
          int v41 = **(_DWORD **)(a1 + 48);
          int v42 = *(_DWORD *)(v36 + 88);
          uint64_t v43 = *(void *)(v36 + 72);
          uint64_t v44 = *(void *)(v36 + 80);
          int v47 = 136317954;
          uint64_t v48 = v8;
          __int16 v49 = 2080;
          v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
          __int16 v51 = 1024;
          int v52 = 225;
          __int16 v53 = 2048;
          uint64_t v54 = v36;
          __int16 v55 = 1024;
          int v56 = v37;
          __int16 v57 = 1024;
          int v58 = v38;
          __int16 v59 = 2048;
          uint64_t v60 = v39;
          __int16 v61 = 1024;
          int v62 = v40;
          __int16 v63 = 1024;
          int v64 = v41;
          __int16 v65 = 1024;
          int v66 = v42;
          __int16 v67 = 2048;
          uint64_t v68 = v43;
          __int16 v69 = 1024;
          int v70 = v44;
          _os_log_debug_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEBUG, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: lastSrcRTP=%u srcSRRTP=%u srcSRNPT=%.9f srcRate=%d dstRTP=%u dstSrRTP=%u dstSRNTP=%.9f dstRate=%d", (uint8_t *)&v47, 0x5Eu);
        }
      }
      int64_t v28 = _VCMediaStreamSynchronizer_differenceBetweenRtpTimestamp(*(_DWORD *)(a1 + 56), *(_DWORD *)(*(void *)(a1 + 32) + 64));
      uint64_t v29 = *(void *)(a1 + 32);
      int v30 = *(_DWORD *)(v29 + 88)
          + (int)((*(double *)(v29 + 48) + (double)v28 / (double)*(uint64_t *)(v29 + 56) - *(double *)(v29 + 72))
                * (double)*(uint64_t *)(v29 + 80));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        uint64_t v32 = *v7;
        v33 = *v7;
        if (*v6)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = *(void *)(a1 + 32);
            int v35 = *(_DWORD *)(a1 + 56);
            int v47 = 136316418;
            uint64_t v48 = v31;
            __int16 v49 = 2080;
            v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
            __int16 v51 = 1024;
            int v52 = 230;
            __int16 v53 = 2048;
            uint64_t v54 = v34;
            __int16 v55 = 1024;
            int v56 = v35;
            __int16 v57 = 1024;
            int v58 = v30;
            _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: SToD: %u->%u", (uint8_t *)&v47, 0x32u);
          }
        }
        else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v45 = *(void *)(a1 + 32);
          int v46 = *(_DWORD *)(a1 + 56);
          int v47 = 136316418;
          uint64_t v48 = v31;
          __int16 v49 = 2080;
          v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
          __int16 v51 = 1024;
          int v52 = 230;
          __int16 v53 = 2048;
          uint64_t v54 = v45;
          __int16 v55 = 1024;
          int v56 = v46;
          __int16 v57 = 1024;
          int v58 = v30;
          _os_log_debug_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEBUG, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: SToD: %u->%u", (uint8_t *)&v47, 0x32u);
        }
      }
      **(_DWORD **)(a1 + 48) = v30;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      return;
    }
    if (ErrorLogLevelForModule < 8) {
      return;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    __int16 v26 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v27 = *v2;
      int v47 = 136315906;
      uint64_t v48 = v25;
      __int16 v49 = 2080;
      v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
      __int16 v51 = 1024;
      int v52 = 221;
      __int16 v53 = 2048;
      uint64_t v54 = v27;
      __int16 v24 = "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: destination info not ready";
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v47, 0x26u);
      return;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_2();
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    __int16 v22 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v23 = *v2;
      int v47 = 136315906;
      uint64_t v48 = v20;
      __int16 v49 = 2080;
      v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
      __int16 v51 = 1024;
      int v52 = 216;
      __int16 v53 = 2048;
      uint64_t v54 = v23;
      __int16 v24 = "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: source info not ready";
      goto LABEL_13;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_1();
    }
  }
}

void __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: source info not ready", v2, v3, v4, v5);
}

void __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: destination info not ready", v2, v3, v4, v5);
}

@end