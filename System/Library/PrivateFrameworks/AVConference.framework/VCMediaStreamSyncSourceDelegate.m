@interface VCMediaStreamSyncSourceDelegate
@end

@implementation VCMediaStreamSyncSourceDelegate

void __VCMediaStreamSyncSourceDelegate_updateSourceState_block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 40) != *(_DWORD *)(*(void *)(a1 + 32) + 100))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        BOOL v5 = *(_DWORD *)(a1 + 40) == 0;
        int v7 = 136316162;
        uint64_t v8 = v2;
        __int16 v9 = 2080;
        v10 = "VCMediaStreamSyncSourceDelegate_updateSourceState_block_invoke";
        __int16 v11 = 1024;
        int v12 = 310;
        __int16 v13 = 2048;
        uint64_t v14 = v4;
        __int16 v15 = 1024;
        BOOL v16 = v5;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: isSourceActive:%d", (uint8_t *)&v7, 0x2Cu);
      }
    }
    int v6 = *(_DWORD *)(a1 + 40);
    if (v6 == 1)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 64) = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 96) = 0;
      int v6 = *(_DWORD *)(a1 + 40);
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 100) = v6;
  }
}

void __VCMediaStreamSyncSourceDelegate_resetSourceState_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "VCMediaStreamSyncSourceDelegate_resetSourceState_block_invoke";
      __int16 v9 = 1024;
      int v10 = 327;
      __int16 v11 = 2048;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: resetting source state", (uint8_t *)&v5, 0x26u);
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 64) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 96) = 0;
}

double __VCMediaStreamSyncSourceDelegate_updateSourcePlayoutSampleRTPTimestamp_block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _VCMediaStreamSynchronizer_updateSourcePlayoutSampleRTPTimestampInternal(*(void *)(a1 + 32), *(_DWORD *)(a1 + 56), &v3, *(double *)(a1 + 48));
  double result = *(double *)&v3.value;
  *(CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v3;
  return result;
}

CMTime *__VCMediaStreamSyncSourceDelegate_updateSourcePlayoutSampleRTPTimestamp_block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  return _VCMediaStreamSynchronizer_updateSourcePlayoutSampleRTPTimestampInternal(*(void *)(a1 + 32), *(_DWORD *)(a1 + 48), &v2, *(double *)(a1 + 40));
}

double __VCMediaStreamSyncSourceDelegate_updateSourceNTPTimeWithRTPTimeStamp_block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 48) = result;
  *(_DWORD *)(*(void *)(a1 + 32) + 64) = *(_DWORD *)(a1 + 48);
  return result;
}

@end