@interface VCRemoteImageQueue
@end

@implementation VCRemoteImageQueue

uint64_t ___VCRemoteImageQueue_Enqueue_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(_DWORD *)(a4 + 16);
      int v11 = 136316162;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      v14 = "_VCRemoteImageQueue_Enqueue_block_invoke";
      __int16 v15 = 1024;
      int v16 = 130;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      __int16 v19 = 1024;
      int v20 = v9;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteImageQueue=%p msgType=%d Queue is full. Resetting....", (uint8_t *)&v11, 0x2Cu);
    }
  }
  return 0;
}

@end