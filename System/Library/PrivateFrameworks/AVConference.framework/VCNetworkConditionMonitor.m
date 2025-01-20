@interface VCNetworkConditionMonitor
@end

@implementation VCNetworkConditionMonitor

uint64_t __VCNetworkConditionMonitor_Invalidate_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

void __VCNetworkConditionMonitor_SetBrokenNetworkStatus_block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned char *)(a1 + 41);
  int v3 = *(unsigned __int8 *)(a1 + 41);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    if (v3 == *(unsigned __int8 *)(v4 + 122)) {
      return;
    }
  }
  else
  {
    if (v3 == *(unsigned __int8 *)(v4 + 123)) {
      return;
    }
    LOBYTE(v3) = *(unsigned char *)(v4 + 122);
  }
  *(unsigned char *)(v4 + 122) = v3;
  if (*(unsigned char *)(a1 + 40)) {
    v2 = (unsigned char *)(v4 + 123);
  }
  *(unsigned char *)(v4 + 123) = *v2;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(unsigned __int8 *)(v8 + 122);
      LODWORD(v8) = *(unsigned __int8 *)(v8 + 123);
      int v11 = 136316674;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      v14 = "VCNetworkConditionMonitor_SetBrokenNetworkStatus_block_invoke";
      __int16 v15 = 1024;
      int v16 = 203;
      __int16 v17 = 1024;
      int v18 = 203;
      __int16 v19 = 1024;
      int v20 = v7;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 1024;
      int v24 = v8;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/ConnectionManager/VCNetworkConditionMonitor.c:%d: NetworkConditionMonitor: isLocal=%d isLocalNetworkBroken=%d isRemoteNetworkBroken=%d", (uint8_t *)&v11, 0x34u);
    }
  }
  v10 = *(unsigned char **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(v10);
  }
  else {
    _VCNetworkConditionMonitor_triggerNetworkConditionCallback((uint64_t)v10, 0);
  }
}

void __VCNetworkConditionMonitor_SetWiFiChannelQualityScore_block_invoke(uint64_t a1, double a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(v3 + 104);
  uint64_t v5 = 72;
  if (v4 < v2) {
    uint64_t v5 = 80;
  }
  double v6 = v4 * (1.0 - *(double *)(v3 + v5)) + v2 * *(double *)(v3 + v5);
  *(double *)(v3 + 104) = v6;
  int v7 = *(unsigned __int8 *)(v3 + 120);
  int v8 = v6 <= *(double *)(v3 + 40);
  *(unsigned char *)(v3 + 120) = v8;
  if (v7 != v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        __int16 v13 = "degraded";
        int v14 = *(unsigned __int8 *)(a1 + 40);
        if (!*(unsigned char *)(v12 + 120)) {
          __int16 v13 = "recovered";
        }
        uint64_t v15 = *(void *)(v12 + 104);
        int v16 = 136316418;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        __int16 v19 = "VCNetworkConditionMonitor_SetWiFiChannelQualityScore_block_invoke";
        __int16 v20 = 1024;
        int v21 = 224;
        __int16 v22 = 2080;
        __int16 v23 = v13;
        __int16 v24 = 1024;
        int v25 = v14;
        __int16 v26 = 2048;
        uint64_t v27 = v15;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkConditionMonitor: LocalWiFiQuality=%s. latestWiFiChannelQualityScore=%d WifiChannelQualityScoreEnvelopeValue=%.2f", (uint8_t *)&v16, 0x36u);
      }
    }
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(*(unsigned char **)(a1 + 32));
  }
}

void __VCNetworkConditionMonitor_SetCellSignalStrengthBars_block_invoke(uint64_t a1, double a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(v3 + 112);
  uint64_t v5 = 88;
  if (v4 < v2) {
    uint64_t v5 = 96;
  }
  double v6 = *(double *)(v3 + v5);
  *(double *)&unint64_t v7 = v4 * (1.0 - v6);
  double v8 = *(double *)&v7 + v2 * v6;
  *(double *)(v3 + 112) = v8;
  LOBYTE(v7) = *(unsigned char *)(a1 + 41);
  double v9 = (double)v7;
  *(double *)(v3 + 56) = v9;
  int v10 = *(unsigned __int8 *)(v3 + 121);
  int v11 = v8 <= *(double *)(v3 + 64) + *(double *)(v3 + 48) * v9;
  *(unsigned char *)(v3 + 121) = v11;
  if (v10 != v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = "degraded";
        int v17 = *(unsigned __int8 *)(a1 + 40);
        if (!*(unsigned char *)(v15 + 121)) {
          int v16 = "recovered";
        }
        int v18 = *(unsigned __int8 *)(a1 + 41);
        uint64_t v19 = *(void *)(v15 + 112);
        int v20 = 136316674;
        uint64_t v21 = v13;
        __int16 v22 = 2080;
        __int16 v23 = "VCNetworkConditionMonitor_SetCellSignalStrengthBars_block_invoke";
        __int16 v24 = 1024;
        int v25 = 247;
        __int16 v26 = 2080;
        uint64_t v27 = v16;
        __int16 v28 = 1024;
        int v29 = v17;
        __int16 v30 = 1024;
        int v31 = v18;
        __int16 v32 = 2048;
        uint64_t v33 = v19;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkConditionMonitor: LocalCellQuality=%s. latestCellSignalStrengthBars=%d latestMaxCellSignalStrengthBars=%d cellSignalStrengthBarsEnvelopeValue=%.2f", (uint8_t *)&v20, 0x3Cu);
      }
    }
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(*(unsigned char **)(a1 + 32));
  }
}

void __VCNetworkConditionMonitor_SetRemoteNetworkQuality_block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 125) != v2)
  {
    *(unsigned char *)(v1 + 125) = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 125);
        int v7 = 136316162;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        int v10 = "VCNetworkConditionMonitor_SetRemoteNetworkQuality_block_invoke";
        __int16 v11 = 1024;
        int v12 = 263;
        __int16 v13 = 1024;
        int v14 = 263;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/ConnectionManager/VCNetworkConditionMonitor.c:%d: NetworkConditionMonitor: isRemoteNetworkQualityBad=%d", (uint8_t *)&v7, 0x28u);
      }
    }
    _VCNetworkConditionMonitor_triggerNetworkConditionCallback(*(void *)(a1 + 32), 0);
  }
}

void __VCNetworkConditionMonitor_SetIsLocalActiveOnCellular_block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 126) != v2)
  {
    *(unsigned char *)(v1 + 126) = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 126);
        int v7 = 136316162;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        int v10 = "VCNetworkConditionMonitor_SetIsLocalActiveOnCellular_block_invoke";
        __int16 v11 = 1024;
        int v12 = 277;
        __int16 v13 = 1024;
        int v14 = 277;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/ConnectionManager/VCNetworkConditionMonitor.c:%d: NetworkConditionMonitor: isLocalActiveOnCellular=%d", (uint8_t *)&v7, 0x28u);
      }
    }
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(*(unsigned char **)(a1 + 32));
  }
}

@end