@interface VideoReceiver
@end

@implementation VideoReceiver

void ___VideoReceiver_SendRTCP_block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (int *)(a1 + 32);
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 200);
  if ((v2 & 0x40) != 0) {
    int v5 = RTPSendControlPacket(v4, v3);
  }
  else {
    int v5 = RTPSendRTCP(v4);
  }
  int v6 = v5;
  if (v5 < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 208);
        int v11 = 136316418;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        v14 = "_VideoReceiver_SendRTCP_block_invoke";
        __int16 v15 = 1024;
        int v16 = 1569;
        __int16 v17 = 1024;
        int v18 = 1569;
        __int16 v19 = 2048;
        uint64_t v20 = v10;
        __int16 v21 = 1024;
        int v22 = v6;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VideoReceiver [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Others/VideoReceiver.c:%d: VideoReceiver[%p] send rtcp failed (%08X)", (uint8_t *)&v11, 0x32u);
      }
    }
  }
  else
  {
    _VideoReceiver_HandleSendRTCPSuccess(*(void *)(a1 + 216), v3, *(double *)(a1 + 224));
  }
  v9 = *(void **)(a1 + 232);
  if (v9) {
    VCMemoryPool_Free(*(OSQueueHead **)(*(void *)(a1 + 208) + 41408), v9);
  }
}

__n128 ___VideoReceiver_RegisterStatistics_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = *(unsigned int **)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  long long v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  _VideoReceiver_ProcessRTTStatistics(v2, v10);
  return result;
}

uint64_t __VideoReceiver_SetSynchronizer_block_invoke(uint64_t a1, void *a2)
{
  return VideoReceiver_UpdateSourcePlayoutTime(*(void *)(a1 + 32), a2);
}

uint64_t ___VideoReceiver_ReportingRegisterPeriodicTask_block_invoke(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  CFAllocatorRef allocator = v2;
  uint64_t v3 = v1;
  v275[5279] = *MEMORY[0x1E4F143B8];
  double v4 = micro();
  double v272 = 0.0;
  uint64_t result = CheckInHandleDebug();
  if (result)
  {
    long long v6 = (unsigned int *)result;
    uint64_t v7 = result + 41000;
    uint64_t v8 = result + 40672;
    VideoReceiver_GetFramerate(1.0, *(void *)(v3 + 32), &v272);
    double v10 = v272;
    if (v272 > 0.0)
    {
      ++*(_WORD *)(v8 + 284);
      LOWORD(v9) = *(_WORD *)(v8 + 282);
      *(_WORD *)(v8 + 282) = (int)(v10 + (double)v9);
      if (*(double *)(v7 + 64) < v10) {
        *(double *)(v7 + 64) = v10;
      }
      if (*(double *)(v7 + 72) > v10) {
        *(double *)(v7 + 72) = v10;
      }
    }
    double v271 = 0.0;
    VideoReceiver_GetBitrate(1.0, *(void *)(v3 + 32), (uint64_t)&v271, 0, 0, 0, 0);
    double v11 = v271;
    if (*(double *)(v7 + 88) < v271) {
      *(double *)(v7 + 88) = v271;
    }
    if (*(double *)(v7 + 96) > v11) {
      *(double *)(v7 + 96) = v11;
    }
    uint64_t v240 = v8;
    double v269 = 0.0;
    double v270 = 0.0;
    double v267 = 0.0;
    double v268 = 0.0;
    v236 = (void *)(v7 + 80);
    VideoReceiver_GetBitrate((float)*(unsigned int *)(v7 + 452), *(void *)(v3 + 32), v7 + 80, &v270, &v269, &v268, &v267);
    uint64_t v243 = v7;
    if (*v6)
    {
      unint64_t v12 = 0;
      unsigned int v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      unint64_t v16 = 0;
      unint64_t v17 = 0;
      uint64_t v18 = 380;
      do
      {
        LODWORD(valuePtr[0]) = -1431655766;
        LODWORD(v257[0]) = -1431655766;
        unsigned int v273 = -1431655766;
        RTPGetPacketLossMetrics(*(void *)&v6[v18], (unsigned int *)valuePtr, (unsigned int *)v257, &v273);
        v13 += LODWORD(v257[0]);
        v14 += v273;
        memset(v275, 0, 24);
        RTPGetDownlinkReportingStats(*(void *)&v6[v18], (uint64_t)v275);
        v15 += v275[1];
        v16 += v275[2];
        v17 += v275[0];
        ++v12;
        v18 += 1080;
      }
      while (v12 < *v6);
    }
    else
    {
      unint64_t v17 = 0;
      unint64_t v16 = 0;
      unint64_t v15 = 0;
      unsigned int v14 = 0;
      unsigned int v13 = 0;
    }
    unsigned int v238 = v14;
    unint64_t v239 = v16;
    unint64_t v242 = v17;
    v244 = v6;
    __int16 v19 = v6 + 10093;
    uint64_t v20 = v240;
    unsigned int v21 = *(_DWORD *)(v240 + 288);
    int v22 = v13 - v21;
    unsigned int v23 = v13;
    if (v13 >= v21)
    {
      unsigned int v24 = v238 - *(_DWORD *)(v240 + 292);
    }
    else
    {
      *(_DWORD *)(v240 + 288) = v13;
      unsigned int v24 = v238;
      *(_DWORD *)(v240 + 292) = v238;
      int v22 = v13;
    }
    unint64_t v25 = *(void *)(v240 + 312);
    unint64_t v241 = v15;
    if (v15 <= *(void *)(v240 + 304)) {
      LODWORD(v26) = 0;
    }
    else {
      uint64_t v26 = *(void *)(v240 + 304);
    }
    if (v239 <= v25) {
      CStringPtr = *(const char **)(v240 + 312);
    }
    else {
      LODWORD(CStringPtr) = v239 - v25;
    }
    if (v242 <= *(void *)(v240 + 320)) {
      LODWORD(v28) = 0;
    }
    else {
      uint64_t v28 = *(void *)(v240 + 320);
    }
    if (v22 < 1 || (v24 & 0x80000000) != 0)
    {
      float v31 = 0.0;
      if (!allocator) {
        return CheckOutHandleDebug();
      }
    }
    else
    {
      double v29 = (double)v24 / (double)v22;
      if (v29 <= 1.0) {
        double v30 = v29 * 100.0;
      }
      else {
        double v30 = 100.0;
      }
      float v31 = v30;
      double v32 = *(double *)(v240 + 64);
      BOOL v33 = v32 == 0.0;
      double v34 = v31 * 0.5 + v32 * 0.5;
      if (v33) {
        double v34 = v31;
      }
      *(double *)(v240 + 64) = v34;
      if (*v19 == 1 && (v22 > 0xA || v34 > 0.0))
      {
        memset(&v275[4], 0, 40);
        memset(&v275[10], 0, 120);
        uint64_t v35 = *((void *)v244 + 144);
        uint64_t v36 = *(void *)(v243 + 416);
        v275[0] = 3;
        *(double *)&v275[1] = v4;
        v275[2] = 0;
        *(double *)&v275[3] = v34;
        v275[9] = v35;
        VCRateControlSetStatistics(v36, v275);
      }
      if (!allocator) {
        return CheckOutHandleDebug();
      }
      uint64_t v37 = *((void *)v244 + 154);
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v37)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          int theDict = v28;
          uint64_t v39 = VRTraceErrorLogLevelToCSTR();
          v40 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v248 = v26;
            int v41 = (int)CStringPtr;
            CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)v244 + 154), 0x8000100u);
            uint64_t v42 = *(void *)(v240 + 64);
            v43 = FourccToCStr(v244[312]);
            LODWORD(v275[0]) = 136317442;
            *(void *)((char *)v275 + 4) = v39;
            WORD2(v275[1]) = 2080;
            *(void *)((char *)&v275[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
            HIWORD(v275[2]) = 1024;
            LODWORD(v275[3]) = 4401;
            WORD2(v275[3]) = 2048;
            *(void *)((char *)&v275[3] + 6) = v244;
            uint64_t v20 = v240;
            HIWORD(v275[4]) = 2080;
            v275[5] = CStringPtr;
            LODWORD(CStringPtr) = v41;
            LODWORD(v26) = v248;
            LOWORD(v275[6]) = 2048;
            *(void *)((char *)&v275[6] + 2) = v42;
            WORD1(v275[7]) = 2048;
            *(double *)((char *)&v275[7] + 4) = v31;
            WORD2(v275[8]) = 1024;
            *(_DWORD *)((char *)&v275[8] + 6) = v22;
            WORD1(v275[9]) = 1024;
            HIDWORD(v275[9]) = v24;
            LOWORD(v275[10]) = 2080;
            *(void *)((char *)&v275[10] + 2) = v43;
            v44 = "VideoReceiver [%s] %s:%d VideoReceiver[%p] FEC health report for participantId:%s with PLR percentage:"
                  "%.2f, current percentage:%.2f (exp:%d, loss:%d) streamGroupID:%s";
            v45 = v40;
            uint32_t v46 = 90;
LABEL_50:
            _os_log_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_DEFAULT, v44, (uint8_t *)v275, v46);
            goto LABEL_51;
          }
          goto LABEL_51;
        }
      }
      else if (ErrorLogLevelForModule >= 7)
      {
        int theDict = v28;
        uint64_t v47 = VRTraceErrorLogLevelToCSTR();
        v48 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v49 = *((void *)v244 + 144);
          uint64_t v50 = *(void *)(v240 + 64);
          LODWORD(v275[0]) = 136317186;
          *(void *)((char *)v275 + 4) = v47;
          WORD2(v275[1]) = 2080;
          *(void *)((char *)&v275[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
          HIWORD(v275[2]) = 1024;
          LODWORD(v275[3]) = 4403;
          WORD2(v275[3]) = 2048;
          *(void *)((char *)&v275[3] + 6) = v244;
          HIWORD(v275[4]) = 2048;
          v275[5] = v49;
          LOWORD(v275[6]) = 2048;
          *(void *)((char *)&v275[6] + 2) = v50;
          WORD1(v275[7]) = 2048;
          *(double *)((char *)&v275[7] + 4) = v31;
          WORD2(v275[8]) = 1024;
          *(_DWORD *)((char *)&v275[8] + 6) = v22;
          WORD1(v275[9]) = 1024;
          HIDWORD(v275[9]) = v24;
          v44 = "VideoReceiver [%s] %s:%d VideoReceiver[%p] FEC health report for participantId:%llu with PLR percentage:"
                "%.2f, current percentage:%.2f (exp:%d, loss:%d)";
          v45 = v48;
          uint32_t v46 = 80;
          goto LABEL_50;
        }
LABEL_51:
        LODWORD(v28) = theDict;
      }
    }
    int theDicta = v28;
    int v234 = (int)CStringPtr;
    unsigned int v235 = v23;
    v51 = (__CFDictionary *)selectDestinationForRTMetrics();
    unsigned int v52 = (v269 / 1000.0 + 0.5);
    unsigned int v230 = (*(double *)(v243 + 80) / 1000.0 + 0.5);
    LODWORD(v275[0]) = v230;
    CFAllocatorRef v53 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v54 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VRxR", v54);
    CFRelease(v54);
    LODWORD(v275[0]) = (*(double *)(v243 + 88) / 1000.0 + 0.5);
    CFNumberRef v55 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VRxRMax", v55);
    CFRelease(v55);
    LODWORD(v275[0]) = (*(double *)(v243 + 96) / 1000.0 + 0.5);
    CFNumberRef v56 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VRxRMin", v56);
    CFRelease(v56);
    LODWORD(v275[0]) = (v270 / 1000.0 + 0.5);
    CFNumberRef v57 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VRFECRxR", v57);
    CFRelease(v57);
    unsigned int v231 = v52;
    LODWORD(v275[0]) = v52;
    CFNumberRef v58 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VRxMetadataOverhead", v58);
    CFRelease(v58);
    LODWORD(v275[0]) = (v268 / 1000.0 + 0.5);
    CFNumberRef v59 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VRxMR", v59);
    CFRelease(v59);
    LODWORD(v275[0]) = (v267 / 1000.0 + 0.5);
    CFNumberRef v60 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VRxDMR", v60);
    CFRelease(v60);
    _VideoReceiver_CheckIfVideoStalling((uint64_t)v244);
    if (*(_WORD *)(v20 + 284))
    {
      LOWORD(v61) = *(_WORD *)(v20 + 282);
      float v62 = (float)v61 / (float)*(unsigned __int16 *)(v20 + 284);
    }
    else
    {
      float v62 = 0.0;
    }
    double v63 = 0.0;
    float v64 = *(double *)(v243 + 72);
    *(float *)v275 = v62;
    CFNumberRef v65 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
    CFDictionaryAddValue(v51, @"ARFr", v65);
    CFRelease(v65);
    LODWORD(v275[0]) = (int)*(double *)(v243 + 64);
    CFNumberRef v66 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"XRFr", v66);
    CFRelease(v66);
    LODWORD(v275[0]) = (int)v64;
    CFNumberRef v67 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"NRFr", v67);
    CFRelease(v67);
    float v68 = *(double *)(v243 + 104);
    *(float *)v275 = v68;
    CFNumberRef v69 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
    CFDictionaryAddValue(v51, @"VST", v69);
    CFRelease(v69);
    double v70 = *(double *)(v243 + 112);
    double v71 = *(double *)(v243 + 104) - v70;
    LODWORD(v70) = *(_DWORD *)(v243 + 452);
    *(float *)&double v71 = v71 / (double)*(unint64_t *)&v70;
    LODWORD(v275[0]) = LODWORD(v71);
    CFNumberRef v72 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
    CFDictionaryAddValue(v51, @"iVSP", v72);
    CFRelease(v72);
    float v73 = *(double *)(v243 + 152);
    *(float *)v275 = v73;
    CFNumberRef v74 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
    CFDictionaryAddValue(v51, @"VSTSM", v74);
    CFRelease(v74);
    LODWORD(v275[0]) = *(_DWORD *)(v243 + 128);
    CFNumberRef v75 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VSTCNT", v75);
    CFRelease(v75);
    *(_DWORD *)(v243 + 128) = 0;
    int v76 = *(_DWORD *)(v243 + 572);
    int v77 = v76 - *(_DWORD *)(v243 + 576);
    *(_DWORD *)(v243 + 576) = v76;
    int v229 = v77;
    LODWORD(v275[0]) = v77;
    CFNumberRef v78 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VFrErCnt", v78);
    CFRelease(v78);
    int v228 = *(unsigned __int16 *)(v20 + 104);
    double PlaybackTimeOffset = VCVideoPlayer_GetPlaybackTimeOffset();
    long long v265 = 0u;
    long long v266 = 0u;
    long long v264 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    memset(v257, 0, sizeof(v257));
    VCVideoPlayer_CollectVideoPlayerStatsForReporting(v4, *(void *)(v19 + 19), (uint64_t)v257);
    _VideoReceiver_ReportVideoPlayerStatsForReporting((uint64_t)v257, v51);
    VCVideoPlayer_ResetVideoPlayerStatsForReporting(v4);
    if (*((unsigned char *)v244 + 1180))
    {
      float v80 = *(double *)(v20 + 88);
      *(float *)v275 = v80;
      CFNumberRef v81 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
      CFDictionaryAddValue(v51, @"VJ", v81);
      CFRelease(v81);
      LODWORD(v275[0]) = *(unsigned __int16 *)(v20 + 104);
      CFNumberRef v82 = CFNumberCreate(v53, kCFNumberIntType, v275);
      CFDictionaryAddValue(v51, @"VJBTC", v82);
      CFRelease(v82);
      *(_WORD *)(v20 + 104) = 0;
      v83 = (double *)(v20 + 120);
      double v84 = *(double *)(v20 + 120);
      double v85 = v4 - *(double *)(v20 + 112);
      if (*(double *)(v20 + 96) != 0.0)
      {
        double v84 = v85 + v84;
        double *v83 = v84;
      }
      float v86 = v84;
      *(float *)v275 = v86;
      CFNumberRef v87 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
      CFDictionaryAddValue(v51, @"VJBTNZT", v87);
      CFRelease(v87);
      uint64_t v227 = *(void *)(v20 + 120);
      double v88 = *(double *)(v20 + 128);
      double v89 = v88 + v85 * *(double *)(v20 + 88);
      *(double *)(v20 + 128) = v89;
      LODWORD(v88) = *(_DWORD *)(v243 + 452);
      double v63 = v89 / (double)*(unint64_t *)&v88;
      *(float *)&double v89 = v63;
      LODWORD(v275[0]) = LODWORD(v89);
      CFNumberRef v90 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
      CFDictionaryAddValue(v51, @"VJBTWA", v90);
      CFRelease(v90);
      double *v83 = 0.0;
      *(void *)(v20 + 128) = 0;
      *(double *)(v20 + 112) = v4;
      float v91 = PlaybackTimeOffset;
      *(float *)v275 = v91;
      CFNumberRef v92 = CFNumberCreate(v53, kCFNumberFloat32Type, v275);
      CFDictionaryAddValue(v51, @"VPO", v92);
      CFRelease(v92);
      if (*((unsigned char *)v244 + 1216) && *((unsigned char *)v244 + 1217))
      {
        LODWORD(v275[0]) = (int)*(double *)&v258;
        CFNumberRef v93 = CFNumberCreate(v53, kCFNumberIntType, v275);
        CFDictionaryAddValue(v51, @"AVSyncOffsetMin", v93);
        CFRelease(v93);
        LODWORD(v275[0]) = (int)*((double *)&v258 + 1);
        CFNumberRef v94 = CFNumberCreate(v53, kCFNumberIntType, v275);
        CFDictionaryAddValue(v51, @"AVSyncOffsetMax", v94);
        CFRelease(v94);
        if (v260) {
          double v95 = *(double *)&v259 / (double)(int)v260;
        }
        else {
          double v95 = 0.0;
        }
        LODWORD(v275[0]) = (int)v95;
        CFNumberRef v96 = CFNumberCreate(v53, kCFNumberIntType, v275);
        CFDictionaryAddValue(v51, @"AVSyncOffset", v96);
        CFRelease(v96);
      }
    }
    else
    {
      uint64_t v227 = 0;
    }
    LODWORD(v275[0]) = (int)*(double *)&v266;
    CFNumberRef v97 = CFNumberCreate(v53, kCFNumberIntType, v275);
    CFDictionaryAddValue(v51, @"VPFDC", v97);
    CFRelease(v97);
    v275[0] = *((void *)&v266 + 1);
    CFNumberRef v98 = CFNumberCreate(v53, kCFNumberDoubleType, v275);
    CFDictionaryAddValue(v51, @"VPFDCD", v98);
    CFRelease(v98);
    uint64_t v99 = *(void *)(v243 + 640);
    if (v99) {
      VCNACKGenerator_GetStatistics(v99, v51);
    }
    bzero(v275, 0xA4F8uLL);
    _VideoReceiver_GetVPBStats((uint64_t)v244);
    unint64_t v100 = *v244;
    if (v100)
    {
      unint64_t v101 = 0;
      uint64_t v102 = 396;
      do
      {
        uint64_t v103 = *(void *)&v244[v102];
        if (v103)
        {
          VideoPacketBuffer_ResetStatistics(v103);
          unint64_t v100 = *v244;
        }
        ++v101;
        v102 += 1080;
      }
      while (v101 < v100);
    }
    int v232 = v241 - v26;
    int v233 = v242 - theDicta;
    if (LODWORD(v275[73])) {
      *(double *)&v275[70] = *(double *)&v275[69] / (double)LODWORD(v275[73]);
    }
    Mutable = CFArrayCreateMutable(0, 23, MEMORY[0x1E4F1D510]);
    CFIndex v105 = 0;
    v106 = (char *)&v275[57] + 4;
    do
    {
      CFNumberRef v107 = CFNumberCreate(0, kCFNumberIntType, v106);
      CFArraySetValueAtIndex(Mutable, v105, v107);
      if (v107) {
        CFRelease(v107);
      }
      ++v105;
      v106 += 4;
    }
    while (v105 != 23);
    CFDictionaryAddValue(v51, @"VFEVLtPktDelayHist", Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
    LODWORD(valuePtr[0]) = HIDWORD(v275[72]);
    CFNumberRef v108 = CFNumberCreate(v53, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v51, @"VFEVTrCnt", v108);
    CFRelease(v108);
    float v109 = *(double *)&v275[70];
    *(float *)valuePtr = v109;
    CFNumberRef v110 = CFNumberCreate(v53, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v51, @"VFEVLtPktDelay", v110);
    CFRelease(v110);
    float v111 = *(double *)&v275[71];
    *(float *)valuePtr = v111;
    CFNumberRef v112 = CFNumberCreate(v53, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v51, @"VFEVMaxLtPktDelay", v112);
    CFRelease(v112);
    LODWORD(valuePtr[0]) = v275[72];
    CFNumberRef v113 = CFNumberCreate(v53, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v51, @"VFrLateCount", v113);
    CFRelease(v113);
    LODWORD(valuePtr[0]) = v275[73];
    CFNumberRef v114 = CFNumberCreate(v53, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v51, @"VFEVRecoveredCnt", v114);
    CFRelease(v114);
    LODWORD(valuePtr[0]) = v275[75];
    CFNumberRef v115 = CFNumberCreate(v53, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v51, @"NacksFrmsSchWithRTX", v115);
    CFRelease(v115);
    LODWORD(valuePtr[0]) = HIDWORD(v275[75]);
    CFNumberRef v116 = CFNumberCreate(v53, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v51, @"NacksFrmsAssemWithRTX", v116);
    CFRelease(v116);
    LODWORD(valuePtr[0]) = v275[76];
    CFNumberRef v117 = CFNumberCreate(v53, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v51, @"NacksFrmsFailedAssemWithRTX", v117);
    CFRelease(v117);
    LODWORD(valuePtr[0]) = HIDWORD(v275[5278]);
    CFNumberRef v118 = CFNumberCreate(v53, kCFNumberIntType, valuePtr);
    v237 = v51;
    CFDictionaryAddValue(v51, @"VRxIDRC", v118);
    CFRelease(v118);
    v119 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    v120 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    v246 = CFDictionaryCreateMutable(v53, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    memcpy(valuePtr, v275, 0xA4F8uLL);
    theDictb = CFDictionaryCreateMutable(v53, 0, v119, v120);
    v249 = CFDictionaryCreateMutable(v53, 0, v119, v120);
    v121 = CFDictionaryCreateMutable(v53, 0, v119, v120);
    v122 = CFDictionaryCreateMutable(v53, 0, v119, v120);
    v123 = CFDictionaryCreateMutable(v53, 0, v119, v120);
    CFAllocatorRef allocatora = v53;
    v124 = CFDictionaryCreateMutable(v53, 0, v119, v120);
    uint64_t v125 = 0;
    v126 = (unsigned int *)&valuePtr[5] + 1;
    do
    {
      unsigned int v127 = *(v126 - 3);
      if (v127)
      {
        uint64_t v128 = FECUtil_FECLevelofProtectionToFECPercentage(v125);
        CFStringRef v129 = CFStringCreateWithFormat(v53, 0, @"%u", v128);
        unsigned int v273 = *(void *)(v126 - 7);
        CFNumberRef v130 = CFNumberCreate(v53, kCFNumberIntType, &v273);
        CFDictionaryAddValue(theDictb, v129, v130);
        CFRelease(v130);
        unsigned int v273 = *(void *)(v126 - 5);
        CFNumberRef v131 = CFNumberCreate(v53, kCFNumberIntType, &v273);
        CFDictionaryAddValue(v249, v129, v131);
        CFRelease(v131);
        unsigned int v273 = v127;
        CFNumberRef v132 = CFNumberCreate(v53, kCFNumberIntType, &v273);
        CFDictionaryAddValue(v121, v129, v132);
        CFRelease(v132);
        unsigned int v273 = *(v126 - 2);
        CFNumberRef v133 = CFNumberCreate(v53, kCFNumberIntType, &v273);
        CFDictionaryAddValue(v122, v129, v133);
        CFRelease(v133);
        unsigned int v273 = *(v126 - 1);
        CFNumberRef v134 = CFNumberCreate(v53, kCFNumberIntType, &v273);
        CFDictionaryAddValue(v123, v129, v134);
        CFRelease(v134);
        unsigned int v273 = *v126;
        CFNumberRef v135 = CFNumberCreate(v53, kCFNumberIntType, &v273);
        CFDictionaryAddValue(v124, v129, v135);
        CFRelease(v135);
        CFRelease(v129);
      }
      ++v125;
      v126 += 10;
    }
    while (v125 != 6);
    CFDictionaryAddValue(v246, @"VFecDB", theDictb);
    CFDictionaryAddValue(v246, @"VFecPB", v249);
    CFDictionaryAddValue(v246, @"VFecTF", v121);
    CFDictionaryAddValue(v246, @"VFecCF", v122);
    CFDictionaryAddValue(v246, @"VFecNF", v123);
    CFDictionaryAddValue(v246, @"VFecFF", v124);
    CFRelease(theDictb);
    CFRelease(v249);
    CFRelease(v121);
    CFRelease(v122);
    CFRelease(v123);
    CFRelease(v124);
    v136 = CFDictionaryCreateMutable(v53, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v137 = 0;
    uint64_t v138 = v243;
    do
    {
      v139 = (char *)valuePtr + 2 * v137;
      unsigned int v140 = *((unsigned __int16 *)v139 + 128);
      if (*((_WORD *)v139 + 128))
      {
        CFStringRef v141 = CFStringCreateWithFormat(v53, 0, @"%d", v137);
        unsigned int v273 = v140;
        CFNumberRef v142 = CFNumberCreate(v53, kCFNumberIntType, &v273);
        CFDictionaryAddValue(v136, v141, v142);
        CFRelease(v142);
        CFRelease(v141);
      }
      ++v137;
    }
    while (v137 != 102);
    CFDictionaryAddValue(v246, @"VRLossPattern", v136);
    CFRelease(v136);
    _VideoReceiver_ComputePacketLoss2DHistogram(v246, @"VRLossHistogram", (uint64_t)&valuePtr[76] + 4);
    _VideoReceiver_ComputePacketLoss2DHistogram(v246, @"VRLossFecHistogram", (uint64_t)&valuePtr[2677] + 4);
    CFDictionaryAddValue(v237, @"VFecStats", v246);
    CFRelease(v246);
    uint64_t v143 = 0;
    *(_DWORD *)(v243 + 668) = 0;
    v144 = (double *)&v275[6];
    v145 = "VideoReceiver";
    v146 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if (*((void *)v144 - 4) || *((_DWORD *)v144 - 4))
      {
        *(_DWORD *)(v138 + 668) = v143;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v147 = VRTraceErrorLogLevelToCSTR();
          v148 = *v146;
          if (os_log_type_enabled(*v146, OS_LOG_TYPE_DEFAULT))
          {
            v149 = v145;
            v150 = CFStringGetCStringPtr(*((CFStringRef *)v244 + 154), 0x8000100u);
            double v151 = *(v144 - 4);
            uint64_t v152 = *((void *)v144 - 3);
            int v153 = *((_DWORD *)v144 - 4);
            int v245 = *((_DWORD *)v144 - 3);
            int v247 = *((_DWORD *)v144 - 2);
            int v250 = *((_DWORD *)v144 - 1);
            int theDictc = *(_DWORD *)v144;
            v154 = FourccToCStr(v244[312]);
            LODWORD(valuePtr[0]) = 136318466;
            *(void *)((char *)valuePtr + 4) = v147;
            WORD2(valuePtr[1]) = 2080;
            *(void *)((char *)&valuePtr[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
            HIWORD(valuePtr[2]) = 1024;
            LODWORD(valuePtr[3]) = 4549;
            WORD2(valuePtr[3]) = 2048;
            *(void *)((char *)&valuePtr[3] + 6) = v244;
            HIWORD(valuePtr[4]) = 1024;
            LODWORD(valuePtr[5]) = v143;
            WORD2(valuePtr[5]) = 2080;
            *(void *)((char *)&valuePtr[5] + 6) = v150;
            v145 = v149;
            HIWORD(valuePtr[6]) = 2048;
            valuePtr[7] = v151;
            LOWORD(valuePtr[8]) = 2048;
            *(void *)((char *)&valuePtr[8] + 2) = v152;
            uint64_t v138 = v243;
            WORD1(valuePtr[9]) = 1024;
            HIDWORD(valuePtr[9]) = v153;
            LOWORD(valuePtr[10]) = 1024;
            *(_DWORD *)((char *)&valuePtr[10] + 2) = v245;
            v146 = (os_log_t *)MEMORY[0x1E4F47A50];
            HIWORD(valuePtr[10]) = 1024;
            LODWORD(valuePtr[11]) = v247;
            WORD2(valuePtr[11]) = 1024;
            *(_DWORD *)((char *)&valuePtr[11] + 6) = v250;
            WORD1(valuePtr[12]) = 1024;
            HIDWORD(valuePtr[12]) = theDictc;
            LOWORD(valuePtr[13]) = 2080;
            *(void *)((char *)&valuePtr[13] + 2) = v154;
            _os_log_impl(&dword_1E1EA4000, v148, OS_LOG_TYPE_DEFAULT, "VideoReceiver [%s] %s:%d VideoReceiver[%p] FEC health report: fecLevel:%d participantID:%s data:%llu, parity:%llu, totalFrame:%d complete:%d, notRecoverable:%d, failedToRecover:%d, recovered:%d streamGroupId:%s", (uint8_t *)valuePtr, 0x72u);
          }
        }
      }
      ++v143;
      v144 += 5;
    }
    while (v143 != 6);
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      uint64_t v155 = VRTraceErrorLogLevelToCSTR();
      v156 = *v146;
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        v157 = CFStringGetCStringPtr(*((CFStringRef *)v244 + 154), 0x8000100u);
        unsigned int v158 = v244[254];
        v159 = FourccToCStr(v244[312]);
        uint64_t v160 = *(void *)(v138 + 64);
        double v161 = *(double *)(v138 + 104) * 1000.0;
        double v162 = *(double *)(v138 + 152) * 1000.0;
        double v163 = *(double *)(v240 + 88) * 1000.0;
        int v164 = *(_DWORD *)(v240 + 296);
        int v165 = *(_DWORD *)(v138 + 476);
        int v166 = *(_DWORD *)(v138 + 472);
        LODWORD(valuePtr[0]) = 136320514;
        *(void *)((char *)valuePtr + 4) = v155;
        WORD2(valuePtr[1]) = 2080;
        *(void *)((char *)&valuePtr[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
        HIWORD(valuePtr[2]) = 1024;
        LODWORD(valuePtr[3]) = 4553;
        WORD2(valuePtr[3]) = 2080;
        *(void *)((char *)&valuePtr[3] + 6) = v157;
        HIWORD(valuePtr[4]) = 1024;
        LODWORD(valuePtr[5]) = v158;
        WORD2(valuePtr[5]) = 2080;
        *(void *)((char *)&valuePtr[5] + 6) = v159;
        HIWORD(valuePtr[6]) = 2048;
        valuePtr[7] = v62;
        LOWORD(valuePtr[8]) = 2048;
        *(double *)((char *)&valuePtr[8] + 2) = v64;
        WORD1(valuePtr[9]) = 2048;
        *(void *)((char *)&valuePtr[9] + 4) = v160;
        WORD2(valuePtr[10]) = 1024;
        *(_DWORD *)((char *)&valuePtr[10] + 6) = v230;
        WORD1(valuePtr[11]) = 2048;
        *(double *)((char *)&valuePtr[11] + 4) = v161;
        WORD2(valuePtr[12]) = 2048;
        *(double *)((char *)&valuePtr[12] + 6) = v162;
        HIWORD(valuePtr[13]) = 2048;
        valuePtr[14] = v163;
        LOWORD(valuePtr[15]) = 2048;
        *(double *)((char *)&valuePtr[15] + 2) = PlaybackTimeOffset * 1000.0;
        WORD1(valuePtr[16]) = 1024;
        HIDWORD(valuePtr[16]) = v228;
        LOWORD(valuePtr[17]) = 2048;
        *(void *)((char *)&valuePtr[17] + 2) = v227;
        WORD1(valuePtr[18]) = 2048;
        *(double *)((char *)&valuePtr[18] + 4) = v63 * 1000.0;
        WORD2(valuePtr[19]) = 1024;
        *(_DWORD *)((char *)&valuePtr[19] + 6) = v229;
        WORD1(valuePtr[20]) = 1024;
        HIDWORD(valuePtr[20]) = v164;
        LOWORD(valuePtr[21]) = 1024;
        *(_DWORD *)((char *)&valuePtr[21] + 2) = v165;
        HIWORD(valuePtr[21]) = 1024;
        LODWORD(valuePtr[22]) = v166;
        WORD2(valuePtr[22]) = 1024;
        *(_DWORD *)((char *)&valuePtr[22] + 6) = v231;
        _os_log_impl(&dword_1E1EA4000, v156, OS_LOG_TYPE_DEFAULT, "VideoReceiver [%s] %s:%d @=@ Health: VideoReceiver participantID=%s, mode=%d, streamGroupId=%s, videoRxAvgFrameRate=%.2f, videoRxMinFrameRate=%.2f, videoRxMaxFrameRate=%.2f, videoRxBitrate=%d kbps, videoStallTime=%.1f ms, videoSegmentMaxStall=%.1f ms, videoJitterQueueSize=%.1f ms, playbackOffset=%f ms, numOfJitterQueueSizeChanges=%d, timeSpentInNonZeroJBQueueSize=%f s, averageJitterQueueSize=%f ms, frameErasureCount=%u, packetReceived=%u, callbackCount=%u significantOutOfOrderPacketCount=%d, metadataRxBitrateKbps=%u", (uint8_t *)valuePtr, 0xBAu);
      }
    }
    if (*((unsigned char *)v244 + 1181)) {
      VCVideoJitterBuffer_HealthPrint(*(void *)(v138 + 536));
    }
    float v167 = *(double *)(v240 + 64);
    *(float *)valuePtr = v167;
    CFNumberRef v168 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v237, @"VRxAvgPktLoss", v168);
    CFRelease(v168);
    *(float *)valuePtr = v31;
    CFNumberRef v169 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v237, @"VRxPktLoss", v169);
    CFRelease(v169);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v170 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VPktRx", v170);
    CFRelease(v170);
    unsigned int v171 = *(unsigned __int16 *)(v138 + 40);
    int v172 = (__int16)(v171 - *(_WORD *)(v138 + 38));
    float v173 = 0.0;
    double v174 = (double)v171;
    float v175 = 0.0;
    if (v172 >= 1) {
      float v175 = (double)v172 / v174;
    }
    int v176 = (__int16)(v171 - *(_WORD *)(v138 + 36));
    if (v176 >= 1) {
      float v173 = (double)v176 / v174;
    }
    *(float *)valuePtr = v175;
    CFNumberRef v177 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v237, @"VRFrLoss", v177);
    CFRelease(v177);
    *(float *)valuePtr = v173;
    CFNumberRef v178 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v237, @"VRFrShown", v178);
    CFRelease(v178);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v138 + 40);
    CFNumberRef v179 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VRFrExpected", v179);
    CFRelease(v179);
    unsigned int v181 = *(unsigned __int16 *)(v138 + 276);
    if (*(_WORD *)(v138 + 276))
    {
      unsigned int v182 = *(unsigned __int16 *)(v240 + 284);
      if (*(_WORD *)(v240 + 284))
      {
        LOWORD(v180) = *(_WORD *)(v138 + 274);
        float v183 = (float)(*(unsigned __int16 *)(v138 + 272) / v181);
        float v184 = (float)-(float)v180 / (float)v181;
        float v185 = (float)(1.0 - expf((float)(v184 * (float)(int)(*(unsigned __int16 *)(v240 + 282) / v182 - 1)) / 30.0))
             * v183;
        float v186 = v185 / (float)(1.0 - expf(v184));
        if ((int)v186 <= 0xA) {
          unsigned int v182 = (5 * (int)v186 + 50);
        }
        else {
          unsigned int v182 = 100;
        }
        *(_WORD *)(v138 + 272) = 0;
        *(_WORD *)(v138 + 276) = 0;
      }
    }
    else
    {
      unsigned int v182 = 0;
    }
    LODWORD(valuePtr[0]) = v182;
    CFNumberRef v187 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VQS", v187);
    CFRelease(v187);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v138 + 472);
    CFNumberRef v188 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VRSOOOCnt", v188);
    CFRelease(v188);
    LODWORD(valuePtr[0]) = v275[0];
    CFNumberRef v189 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VFIRDCnt", v189);
    CFRelease(v189);
    LODWORD(valuePtr[0]) = *(_DWORD *)v138;
    CFNumberRef v190 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VFIRCnt", v190);
    CFRelease(v190);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v138 + 8);
    CFNumberRef v191 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VFIRFSCnt", v191);
    CFRelease(v191);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v138 + 44);
    CFNumberRef v192 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VFDBSCnt", v192);
    CFRelease(v192);
    LODWORD(valuePtr[0]) = HIDWORD(v275[0]);
    CFNumberRef v193 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VFTICnt", v193);
    CFRelease(v193);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v138 + 52);
    CFNumberRef v194 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"DecOutFrameCnt", v194);
    CFRelease(v194);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v138 + 54);
    CFNumberRef v195 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"DecOutMLEnhancedFrameCnt", v195);
    CFRelease(v195);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v138 + 36);
    CFNumberRef v196 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"DVFECnt", v196);
    CFRelease(v196);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v138 + 38);
    CFNumberRef v197 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VFRxCnt", v197);
    CFRelease(v197);
    LODWORD(valuePtr[0]) = HIDWORD(v275[1]);
    CFNumberRef v198 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VNoFecTF", v198);
    CFRelease(v198);
    LODWORD(valuePtr[0]) = v275[1];
    CFNumberRef v199 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VNoFecCF", v199);
    CFRelease(v199);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v138 + 56);
    CFNumberRef v200 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"DecNoShowFrameCnt", v200);
    CFRelease(v200);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v240 + 156);
    CFNumberRef v201 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"Width", v201);
    CFRelease(v201);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v240 + 160);
    CFNumberRef v202 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"Height", v202);
    CFRelease(v202);
    LODWORD(valuePtr[0]) = (unsigned __int16)(*(_WORD *)(v138 + 26) - *(_WORD *)(v138 + 28));
    CFNumberRef v203 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VFExCnt", v203);
    CFRelease(v203);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v138 + 48);
    CFNumberRef v204 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VRxSinglePktFrame", v204);
    CFRelease(v204);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v205 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"APRL", v205);
    CFRelease(v205);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v206 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"AVDL", v206);
    CFRelease(v206);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v207 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"ADL", v207);
    CFRelease(v207);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v208 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"ATRL", v208);
    CFRelease(v208);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v209 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"MPRL", v209);
    CFRelease(v209);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v210 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"MVDL", v210);
    CFRelease(v210);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v211 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"MDL", v211);
    CFRelease(v211);
    LODWORD(valuePtr[0]) = 0;
    CFNumberRef v212 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"MTRL", v212);
    CFRelease(v212);
    LODWORD(valuePtr[0]) = (int)(_VideoReceiver_GetTotalPLR(v244) * 10000.0);
    CFNumberRef v213 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"VRxPLR", v213);
    CFRelease(v213);
    LODWORD(valuePtr[0]) = v232;
    CFNumberRef v214 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"RTPDownlinkIngressVideoPkts", v214);
    CFRelease(v214);
    LODWORD(valuePtr[0]) = v234;
    CFNumberRef v215 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"RTPDownlinkEgressVideoPkts", v215);
    CFRelease(v215);
    LODWORD(valuePtr[0]) = v233;
    CFNumberRef v216 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v237, @"RTPDownlinkIngressNonDupMediaPkts", v216);
    CFRelease(v216);
    unint64_t v217 = v241;
    if (*v244)
    {
      uint64_t v218 = 0;
      int v219 = 0;
      int v220 = 0;
      do
      {
        v219 += v244[v218 + 1433];
        v220 += v244[v218 + 1434];
        v218 += 1080;
      }
      while (1080 * *v244 != v218);
      if (v219)
      {
        LODWORD(valuePtr[0]) = v219;
        CFNumberRef v221 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v237, @"LTRAckTx", v221);
        CFRelease(v221);
      }
      if (v220)
      {
        LODWORD(valuePtr[0]) = v220;
        CFNumberRef v222 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v237, @"LossFbTx", v222);
        CFRelease(v222);
      }
      uint64_t v223 = *v244;
      unint64_t v217 = v241;
      if (v223)
      {
        int v224 = 0;
        v225 = v244 + 1435;
        do
        {
          v224 += *v225;
          v225 += 1080;
          --v223;
        }
        while (v223);
        if (v224)
        {
          LODWORD(valuePtr[0]) = v224;
          CFNumberRef v226 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
          CFDictionaryAddValue(v237, @"RtcpAppLTRAckTx", v226);
          CFRelease(v226);
          unint64_t v217 = v241;
        }
      }
    }
    *(_WORD *)(v138 + 28) = *(_WORD *)(v138 + 26);
    *(_DWORD *)uint64_t v138 = 0;
    *(_DWORD *)(v138 + 8) = 0;
    *(_DWORD *)(v138 + 44) = 0;
    *(_DWORD *)(v138 + 48) = 0;
    *(_DWORD *)(v240 + 282) = 0;
    *(_OWORD *)(v138 + 64) = xmmword_1E259E6C0;
    *(_DWORD *)(v138 + 36) = 0;
    *(void *)(v138 + 52) = 0;
    void *v236 = 0;
    v236[1] = 0;
    *(void *)(v138 + 96) = 0x7FF8000000000000;
    *(_DWORD *)(v138 + 472) = 0;
    *(void *)(v138 + 112) = *(void *)(v138 + 104);
    *(_DWORD *)(v240 + 288) = v235;
    *(_DWORD *)(v240 + 292) = v238;
    *(void *)(v240 + 304) = v217;
    *(void *)(v240 + 312) = v239;
    *(void *)(v240 + 320) = v242;
    _VideoReceiver_ResetStreamStats(v244);
    return CheckOutHandleDebug();
  }
  return result;
}

uint64_t ___VideoReceiver_RegisterTransportCallbacks_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 41211))
  {
    long long v5 = *(FILE **)(*(void *)(a1 + 32) + 41216);
    if (v5) {
      _VideoReceiverUtil_LogRtpMediaPacket(a3 + 8, v5, *(_DWORD *)(a1 + 40));
    }
  }

  return _VideoReceiver_RTPPacketCallback(a2, a3);
}

uint64_t ___VideoReceiver_RegisterTransportCallbacks_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = CheckInHandleDebug();
  if (result)
  {
    _VideoReceiver_ProcessVideoRTCPInternal(result, a2, a3);
    return CheckOutHandleDebug();
  }
  return result;
}

@end