@interface VCAudioReceiver
@end

@implementation VCAudioReceiver

void __VCAudioReceiver_Finalize_block_invoke(uint64_t a1)
{
  VCRealTimeThread_Finalize(*(void *)(*(void *)(a1 + 32) + 568));
  uint64_t v2 = *(void *)(a1 + 32);

  _VCAudioReceiver_Cleanup(v2);
}

uint64_t __VCAudioReceiver_PullAudioSamples_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, BOOL *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = a3 + 32;
  unint64_t v12 = a3 + 5;
  long long v13 = xmmword_1E25A2B60;
  *(unsigned char *)(a3 + 21) = 16;
  *(unsigned char *)(a3 + 4) = 0;
  v9 = (BOOL *)(a3 + 4);
  VCAudioBufferList_GetTimestamp(a2);
  kdebug_trace();
  uint64_t v10 = *(void *)(a1 + 32);
  ++*(_DWORD *)(v10 + 9136);
  if (v8 <= a3) {
    __break(0x5519u);
  }
  VCJitterBuffer_PlaybackGetSamples(*(void *)(v10 + 440), a2, (int *)a3, v9, (uint64_t)&v12, (int *)(a3 + 24), (int *)(a3 + 28));
  *(unsigned char *)(a3 + 21) = BYTE8(v13);
  *a4 = *(_DWORD *)(a3 + 24) != 0;
  return kdebug_trace();
}

void ___VCAudioReceiver_RegisterStatistics_block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    if (*(_DWORD *)a2 == 11)
    {
      int v4 = *(unsigned __int16 *)(a2 + 100);
      if (v4 != 0xFFFF)
      {
        unsigned __int8 v5 = *(unsigned char *)(a2 + 97);
        __int16 v6 = *(_WORD *)(a2 + 98);
        *(void *)&long long v7 = *(void *)(a2 + 32);
        *((void *)&v7 + 1) = v5;
        WORD5(v7) = v6;
        WORD6(v7) = v4;
        VCJitterBuffer_ProcessWiFiNetworkNotification(*(void *)(v3 + 440), &v7, a3);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_1();
    }
  }
}

void ___VCAudioReceiver_RegisterTransportCallbacks_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void ___VCAudioReceiver_RegisterTransportCallbacks_block_invoke_2(uint64_t a1, uint64_t *a2, uint64_t a3)
{
}

uint64_t ___VCAudioReceiver_RegisterReportingTask_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return result;
  }
  uint64_t v2 = (void *)result;
  unint64_t v3 = *(void *)(result + 40);
  if (v3)
  {
    if (v3 >= v2[6] || v3 < v2[7]) {
      goto LABEL_77;
    }
  }
  result = CheckInHandleDebug();
  if (!result) {
    return result;
  }
  unsigned __int8 v5 = (unsigned int *)result;
  uint64_t v6 = *(void *)(result + 440);
  if (!v6)
  {
    if (*((unsigned char *)v5 + 600))
    {
      uint64_t v6 = 0;
    }
    else
    {
      *((unsigned char *)v5 + 600) = 1;
      reportingSymptom();
      uint64_t v6 = *((void *)v5 + 55);
    }
  }
  if (!VCJitterBuffer_GetIsRunning(v6))
  {
    unint64_t v79 = v2[5];
    if (v79 && (v79 >= v2[6] || v79 < v2[7])) {
      goto LABEL_77;
    }
    return CheckOutHandleDebug();
  }
  uint64_t v163 = 0;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  VCJitterBuffer_GetPlaybackReportingMetrics(*((void *)v5 + 55), (uint64_t)&v153);
  long long v7 = (__CFDictionary *)selectDestinationForRTMetrics();
  *(_DWORD *)valuePtr = v153;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"AAL", v9);
  CFRelease(v9);
  *(_DWORD *)valuePtr = DWORD1(v153);
  CFNumberRef v10 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"AWL", v10);
  CFRelease(v10);
  *(_DWORD *)valuePtr = HIDWORD(v153);
  CFNumberRef v11 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"AJQS", v11);
  CFRelease(v11);
  *(float *)valuePtr = *((float *)&v153 + 2) * 1000.0;
  CFNumberRef v12 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"XJoW", v12);
  CFRelease(v12);
  *(_DWORD *)valuePtr = DWORD1(v154);
  CFNumberRef v13 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"FrameErasureRate", v13);
  CFRelease(v13);
  *(_DWORD *)valuePtr = DWORD2(v154);
  CFNumberRef v14 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"FrameErasureRateAlt", v14);
  CFRelease(v14);
  *(_DWORD *)valuePtr = HIDWORD(v154);
  CFNumberRef v15 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"FrameSpeechErasureRate", v15);
  CFRelease(v15);
  *(_DWORD *)valuePtr = v155;
  CFNumberRef v16 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"JitterErasureRate", v16);
  CFRelease(v16);
  *(_DWORD *)valuePtr = DWORD1(v155);
  CFNumberRef v17 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"WindowedFrameErasureRate", v17);
  CFRelease(v17);
  *(_DWORD *)valuePtr = DWORD2(v155);
  CFNumberRef v18 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"RedErasureCompensationRate", v18);
  CFRelease(v18);
  *(_DWORD *)valuePtr = (int)(float)(*((float *)&v155 + 3) * 1000.0);
  CFNumberRef v19 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"MaxRedFrameRecoveryDepth", v19);
  CFRelease(v19);
  *(_DWORD *)valuePtr = v156;
  CFNumberRef v20 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"RedRxPlayedCount", v20);
  CFRelease(v20);
  *(_DWORD *)valuePtr = DWORD1(v156);
  CFNumberRef v21 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"RedRxPlayedBytes", v21);
  CFRelease(v21);
  *(_DWORD *)valuePtr = DWORD2(v156);
  CFNumberRef v22 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"FramesPlayedCount", v22);
  CFRelease(v22);
  *(_DWORD *)valuePtr = DWORD2(v157);
  CFNumberRef v23 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"FrameErasureCount", v23);
  CFRelease(v23);
  *(_DWORD *)valuePtr = HIDWORD(v157);
  CFNumberRef v24 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"FrameErasureCountAlt", v24);
  CFRelease(v24);
  *(_DWORD *)valuePtr = HIDWORD(v158);
  CFNumberRef v25 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"MaxConsecutiveAudioErasures", v25);
  CFRelease(v25);
  *(_DWORD *)valuePtr = BYTE12(v161);
  CFNumberRef v26 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"EnhancedJBAdaptationsEnabled", v26);
  CFRelease(v26);
  *(_DWORD *)valuePtr = v162;
  CFNumberRef v27 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"JBJumpSpikeCount", v27);
  CFRelease(v27);
  *(_DWORD *)valuePtr = DWORD1(v162);
  CFNumberRef v28 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"JBSlopeSpikeCount", v28);
  CFRelease(v28);
  float v29 = *((double *)&v162 + 1);
  *(float *)valuePtr = v29;
  CFNumberRef v30 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"JBSpikeSizeDelta", v30);
  CFRelease(v30);
  *(_DWORD *)valuePtr = DWORD1(v160);
  CFNumberRef v31 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"TimescaleRate", v31);
  CFRelease(v31);
  *(_DWORD *)valuePtr = DWORD2(v160);
  CFNumberRef v32 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"SpeechTimescaleRate", v32);
  CFRelease(v32);
  *(_DWORD *)valuePtr = HIDWORD(v160);
  CFNumberRef v33 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"SilenceTimescaleRate", v33);
  CFRelease(v33);
  *(_DWORD *)valuePtr = v159;
  CFNumberRef v34 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"TotalTimescaleCount", v34);
  CFRelease(v34);
  *(_DWORD *)valuePtr = HIDWORD(v159);
  CFNumberRef v35 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"TotalExpandTimescaleCount", v35);
  CFRelease(v35);
  *(_DWORD *)valuePtr = v160;
  CFNumberRef v36 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"TotalCompressTimescaleCount", v36);
  CFRelease(v36);
  *(_DWORD *)valuePtr = DWORD2(v159);
  CFNumberRef v37 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"TotalSpeechTimescaleCount", v37);
  CFRelease(v37);
  *(_DWORD *)valuePtr = DWORD1(v159);
  CFNumberRef v38 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"TotalSilenceTimescaleCount", v38);
  CFRelease(v38);
  memcpy(v5 + 2460, v5 + 2332, 0x200uLL);
  *((_OWORD *)v5 + 583) = 0u;
  *((_OWORD *)v5 + 584) = 0u;
  *((_OWORD *)v5 + 585) = 0u;
  *((_OWORD *)v5 + 586) = 0u;
  *((_OWORD *)v5 + 587) = 0u;
  *((_OWORD *)v5 + 588) = 0u;
  *((_OWORD *)v5 + 589) = 0u;
  *((_OWORD *)v5 + 590) = 0u;
  *((_OWORD *)v5 + 591) = 0u;
  *((_OWORD *)v5 + 592) = 0u;
  *((_OWORD *)v5 + 593) = 0u;
  *((_OWORD *)v5 + 594) = 0u;
  *((_OWORD *)v5 + 595) = 0u;
  *((_OWORD *)v5 + 596) = 0u;
  *((_OWORD *)v5 + 597) = 0u;
  *((_OWORD *)v5 + 598) = 0u;
  *((_OWORD *)v5 + 599) = 0u;
  *((_OWORD *)v5 + 600) = 0u;
  *((_OWORD *)v5 + 601) = 0u;
  *((_OWORD *)v5 + 602) = 0u;
  *((_OWORD *)v5 + 603) = 0u;
  *((_OWORD *)v5 + 604) = 0u;
  *((_OWORD *)v5 + 605) = 0u;
  *((_OWORD *)v5 + 606) = 0u;
  *((_OWORD *)v5 + 607) = 0u;
  *((_OWORD *)v5 + 608) = 0u;
  *((_OWORD *)v5 + 609) = 0u;
  *((_OWORD *)v5 + 610) = 0u;
  *((_OWORD *)v5 + 611) = 0u;
  *((_OWORD *)v5 + 612) = 0u;
  *((_OWORD *)v5 + 613) = 0u;
  *((_OWORD *)v5 + 614) = 0u;
  StringForPayloadData = _VCAudioReceiver_CreateStringForPayloadData((uint64_t)v5);
  if (StringForPayloadData)
  {
    v46 = StringForPayloadData;
    CFDictionaryAddValue(v7, @"Payload", StringForPayloadData);
    CFRelease(v46);
  }
  *((_OWORD *)v5 + 645) = 0u;
  *((_OWORD *)v5 + 646) = 0u;
  *((_OWORD *)v5 + 643) = 0u;
  *((_OWORD *)v5 + 644) = 0u;
  *((_OWORD *)v5 + 641) = 0u;
  *((_OWORD *)v5 + 642) = 0u;
  *((_OWORD *)v5 + 639) = 0u;
  *((_OWORD *)v5 + 640) = 0u;
  *((_OWORD *)v5 + 637) = 0u;
  *((_OWORD *)v5 + 638) = 0u;
  *((_OWORD *)v5 + 635) = 0u;
  *((_OWORD *)v5 + 636) = 0u;
  *((_OWORD *)v5 + 633) = 0u;
  *((_OWORD *)v5 + 634) = 0u;
  *((_OWORD *)v5 + 631) = 0u;
  *((_OWORD *)v5 + 632) = 0u;
  *((_OWORD *)v5 + 629) = 0u;
  *((_OWORD *)v5 + 630) = 0u;
  *((_OWORD *)v5 + 627) = 0u;
  *((_OWORD *)v5 + 628) = 0u;
  *((_OWORD *)v5 + 625) = 0u;
  *((_OWORD *)v5 + 626) = 0u;
  *((_OWORD *)v5 + 623) = 0u;
  *((_OWORD *)v5 + 624) = 0u;
  *((_OWORD *)v5 + 621) = 0u;
  *((_OWORD *)v5 + 622) = 0u;
  *((_OWORD *)v5 + 619) = 0u;
  *((_OWORD *)v5 + 620) = 0u;
  *((_OWORD *)v5 + 617) = 0u;
  *((_OWORD *)v5 + 618) = 0u;
  *((_OWORD *)v5 + 615) = 0u;
  *((_OWORD *)v5 + 616) = 0u;
  uint64_t v152 = 0;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v149 = 0u;
  VCJitterBuffer_GetReportingMetrics(*((void *)v5 + 55), (uint64_t)&v149, v40, v41, v42, v43, v44, v45);
  *(float *)valuePtr = *((float *)&v149 + 1) * 1000.0;
  CFNumberRef v47 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"NJB", v47);
  CFRelease(v47);
  *(float *)valuePtr = *((float *)&v149 + 2) * 1000.0;
  CFNumberRef v48 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"UJBL", v48);
  CFRelease(v48);
  float v49 = *((double *)&v151 + 1);
  *(float *)valuePtr = v49;
  CFNumberRef v50 = CFNumberCreate(v8, kCFNumberFloat32Type, valuePtr);
  CFDictionaryAddValue(v7, @"RedOverheadDelay", v50);
  CFRelease(v50);
  *(_DWORD *)valuePtr = HIDWORD(v149);
  CFNumberRef v51 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"RedRxCount", v51);
  CFRelease(v51);
  *(_DWORD *)valuePtr = v150;
  CFNumberRef v52 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"RedRxBytes", v52);
  CFRelease(v52);
  *(_DWORD *)valuePtr = DWORD1(v150);
  CFNumberRef v53 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"RedRxDiscardCount", v53);
  CFRelease(v53);
  *(_DWORD *)valuePtr = DWORD2(v150);
  CFNumberRef v54 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"RedRxDiscardBytes", v54);
  CFRelease(v54);
  *(_DWORD *)valuePtr = v151;
  CFNumberRef v55 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"RedRxBitrate", v55);
  CFRelease(v55);
  *(_DWORD *)valuePtr = HIDWORD(v150);
  CFNumberRef v56 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v7, @"JitterBufferTargetChanges", v56);
  CFRelease(v56);
  *(_DWORD *)valuePtr = v5[121];
  CFNumberRef v57 = CFNumberCreate(v8, kCFNumberIntType, valuePtr);
  v129 = v7;
  CFDictionaryAddValue(v7, @"ARCC", v57);
  CFRelease(v57);
  unsigned int v58 = atomic_exchange((atomic_uint *volatile)v5 + 192, 0);
  unsigned int v59 = atomic_exchange((atomic_uint *volatile)v5 + 205, 0);
  double v60 = micro();
  unsigned int v61 = 0;
  unsigned int v62 = 0;
  double v63 = v60 - *((double *)v5 + 523);
  *((double *)v5 + 523) = v60;
  if (v63 >= 0.5)
  {
    unsigned int v62 = ((double)(8 * v58) / v63 / 1000.0 + 0.5);
    unsigned int v61 = ((double)(8 * v59) / v63 / 1000.0 + 0.5);
  }
  CFAllocatorRef allocator = v8;
  v130 = v2;
  unsigned int v131 = v61;
  unsigned int v132 = v62;
  v5[1048] = v62;
  v5[1049] = v61;
  float v64 = *((float *)&v153 + 1);
  v65 = (NSObject **)MEMORY[0x1E4F47A50];
  unsigned int v66 = 0;
  unsigned int v67 = 0;
  if (*v5)
  {
    unsigned int v148 = 0;
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    unint64_t v71 = 0;
    unint64_t v72 = (unint64_t)(v5 + 2);
    while (1)
    {
      uint64_t v168 = 0;
      unsigned int v167 = 0;
      if (v72 >= (unint64_t)(v5 + 58) || v72 < (unint64_t)(v5 + 2)) {
        break;
      }
      RTPGetPacketLossMetrics(*(void *)v72, (unsigned int *)&v168 + 1, (unsigned int *)&v168, &v167);
      int v142 = HIDWORD(v168);
      int v144 = v168;
      unsigned int v146 = v167;
      uint64_t v164 = 0;
      uint64_t v165 = 0;
      uint64_t v166 = 0;
      RTPGetDownlinkReportingStats(*(void *)v72, (uint64_t)&v164);
      uint64_t v73 = v165;
      uint64_t v138 = v166;
      uint64_t v140 = v164;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v133 = VRTraceErrorLogLevelToCSTR();
        v74 = *v65;
        log = *v65;
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
            int v76 = *(unsigned __int16 *)(v72 + 8);
            *(_DWORD *)valuePtr = 136317186;
            *(void *)&valuePtr[4] = v133;
            *(_WORD *)&valuePtr[12] = 2080;
            *(void *)&valuePtr[14] = "_VCAudioReceiver_GetRTPMetricsFromStreams";
            *(_WORD *)&valuePtr[22] = 1024;
            *(_DWORD *)&valuePtr[24] = 536;
            *(_WORD *)&valuePtr[28] = 2048;
            *(void *)&valuePtr[30] = v5;
            v65 = (NSObject **)MEMORY[0x1E4F47A50];
            *(_WORD *)&valuePtr[38] = 2080;
            *(void *)&valuePtr[40] = CStringPtr;
            *(_WORD *)&valuePtr[48] = 1024;
            *(_DWORD *)&valuePtr[50] = v76;
            *(_WORD *)&valuePtr[54] = 1024;
            *(_DWORD *)&valuePtr[56] = HIDWORD(v168);
            *(_WORD *)&valuePtr[60] = 1024;
            *(_DWORD *)&valuePtr[62] = v168;
            *(_WORD *)&valuePtr[66] = 1024;
            *(_DWORD *)&valuePtr[68] = v167;
            _os_log_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s idsStreamID=%u Total(Received=%u expected=%u lost=%u)", valuePtr, 0x48u);
          }
        }
        else if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          v77 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
          int v78 = *(unsigned __int16 *)(v72 + 8);
          *(_DWORD *)valuePtr = 136317186;
          *(void *)&valuePtr[4] = v133;
          *(_WORD *)&valuePtr[12] = 2080;
          *(void *)&valuePtr[14] = "_VCAudioReceiver_GetRTPMetricsFromStreams";
          *(_WORD *)&valuePtr[22] = 1024;
          *(_DWORD *)&valuePtr[24] = 536;
          *(_WORD *)&valuePtr[28] = 2048;
          *(void *)&valuePtr[30] = v5;
          v65 = (NSObject **)MEMORY[0x1E4F47A50];
          *(_WORD *)&valuePtr[38] = 2080;
          *(void *)&valuePtr[40] = v77;
          *(_WORD *)&valuePtr[48] = 1024;
          *(_DWORD *)&valuePtr[50] = v78;
          *(_WORD *)&valuePtr[54] = 1024;
          *(_DWORD *)&valuePtr[56] = HIDWORD(v168);
          *(_WORD *)&valuePtr[60] = 1024;
          *(_DWORD *)&valuePtr[62] = v168;
          *(_WORD *)&valuePtr[66] = 1024;
          *(_DWORD *)&valuePtr[68] = v167;
          _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s idsStreamID=%u Total(Received=%u expected=%u lost=%u)", valuePtr, 0x48u);
        }
      }
      v66 += v142;
      v67 += v144;
      v148 += v146;
      v68 += v73;
      v69 += v138;
      v70 += v140;
      ++v71;
      v72 += 56;
      if (v71 >= *v5) {
        goto LABEL_37;
      }
    }
LABEL_77:
    __break(0x5519u);
  }
  unsigned int v148 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
LABEL_37:
  unsigned int v80 = v5[195];
  unsigned int v81 = v67 - v80;
  uint64_t v143 = v70;
  uint64_t v145 = v68;
  uint64_t v141 = v69;
  if (v67 >= v80)
  {
    unsigned int v147 = v66 - v5[193];
    unsigned int v83 = v148 - v5[196];
    uint64_t v82 = v68 - *((void *)v5 + 99);
    uint64_t v137 = v70 - *((void *)v5 + 100);
    uint64_t v139 = v69 - *((void *)v5 + 101);
    v84 = v129;
    v85 = v130;
    CFAllocatorRef v86 = allocator;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v90 = VRTraceErrorLogLevelToCSTR();
      v91 = *MEMORY[0x1E4F47A50];
      v136 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          v92 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
          *(_DWORD *)valuePtr = 136317698;
          *(void *)&valuePtr[4] = v90;
          *(_WORD *)&valuePtr[12] = 2080;
          *(void *)&valuePtr[14] = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
          *(_WORD *)&valuePtr[22] = 1024;
          *(_DWORD *)&valuePtr[24] = 567;
          *(_WORD *)&valuePtr[28] = 2048;
          *(void *)&valuePtr[30] = v5;
          *(_WORD *)&valuePtr[38] = 2080;
          *(void *)&valuePtr[40] = v92;
          *(_WORD *)&valuePtr[48] = 1024;
          *(_DWORD *)&valuePtr[50] = v66;
          *(_WORD *)&valuePtr[54] = 1024;
          *(_DWORD *)&valuePtr[56] = v67;
          *(_WORD *)&valuePtr[60] = 1024;
          *(_DWORD *)&valuePtr[62] = v148;
          *(_WORD *)&valuePtr[66] = 1024;
          *(_DWORD *)&valuePtr[68] = v147;
          *(_WORD *)&valuePtr[72] = 1024;
          *(_DWORD *)&valuePtr[74] = v81;
          *(_WORD *)&valuePtr[78] = 1024;
          LODWORD(v170) = v83;
          _os_log_impl(&dword_1E1EA4000, v136, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Total(Received=%u expected=%u lost=%u) Reporting interval(Received=%u expected=%u lost=%u)", valuePtr, 0x54u);
        }
      }
      else if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        v127 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
        *(_DWORD *)valuePtr = 136317698;
        *(void *)&valuePtr[4] = v90;
        *(_WORD *)&valuePtr[12] = 2080;
        *(void *)&valuePtr[14] = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
        *(_WORD *)&valuePtr[22] = 1024;
        *(_DWORD *)&valuePtr[24] = 567;
        *(_WORD *)&valuePtr[28] = 2048;
        *(void *)&valuePtr[30] = v5;
        *(_WORD *)&valuePtr[38] = 2080;
        *(void *)&valuePtr[40] = v127;
        *(_WORD *)&valuePtr[48] = 1024;
        *(_DWORD *)&valuePtr[50] = v66;
        *(_WORD *)&valuePtr[54] = 1024;
        *(_DWORD *)&valuePtr[56] = v67;
        *(_WORD *)&valuePtr[60] = 1024;
        *(_DWORD *)&valuePtr[62] = v148;
        *(_WORD *)&valuePtr[66] = 1024;
        *(_DWORD *)&valuePtr[68] = v147;
        *(_WORD *)&valuePtr[72] = 1024;
        *(_DWORD *)&valuePtr[74] = v81;
        *(_WORD *)&valuePtr[78] = 1024;
        LODWORD(v170) = v83;
        _os_log_debug_impl(&dword_1E1EA4000, v136, OS_LOG_TYPE_DEBUG, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Total(Received=%u expected=%u lost=%u) Reporting interval(Received=%u expected=%u lost=%u)", valuePtr, 0x54u);
      }
    }
    goto LABEL_51;
  }
  LODWORD(v137) = v70;
  LODWORD(v139) = v69;
  LODWORD(v82) = v68;
  unsigned int v83 = v148;
  unsigned int v81 = v67;
  unsigned int v147 = v66;
  v84 = v129;
  v85 = v130;
  CFAllocatorRef v86 = allocator;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    os_log_t v135 = (os_log_t)VRTraceErrorLogLevelToCSTR();
    v87 = *MEMORY[0x1E4F47A50];
    v88 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      LODWORD(v82) = v145;
      LODWORD(v137) = v143;
      LODWORD(v139) = v141;
      unsigned int v83 = v148;
      unsigned int v81 = v67;
      unsigned int v147 = v66;
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      v89 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
      *(_DWORD *)valuePtr = 136316930;
      *(void *)&valuePtr[4] = v135;
      *(_WORD *)&valuePtr[12] = 2080;
      *(void *)&valuePtr[14] = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
      *(_WORD *)&valuePtr[22] = 1024;
      *(_DWORD *)&valuePtr[24] = 576;
      *(_WORD *)&valuePtr[28] = 2048;
      *(void *)&valuePtr[30] = v5;
      *(_WORD *)&valuePtr[38] = 2080;
      *(void *)&valuePtr[40] = v89;
      *(_WORD *)&valuePtr[48] = 1024;
      *(_DWORD *)&valuePtr[50] = v66;
      *(_WORD *)&valuePtr[54] = 1024;
      *(_DWORD *)&valuePtr[56] = v67;
      *(_WORD *)&valuePtr[60] = 1024;
      unsigned int v83 = v148;
      *(_DWORD *)&valuePtr[62] = v148;
      _os_log_impl(&dword_1E1EA4000, v87, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Expected packet count decreased, resetting counts. Received=%u expected=%u lost=%u", valuePtr, 0x42u);
      goto LABEL_42;
    }
    LODWORD(v82) = v145;
    LODWORD(v137) = v143;
    LODWORD(v139) = v141;
    unsigned int v83 = v148;
    unsigned int v81 = v67;
    unsigned int v147 = v66;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      v93 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
      *(_DWORD *)valuePtr = 136316930;
      *(void *)&valuePtr[4] = v135;
      *(_WORD *)&valuePtr[12] = 2080;
      *(void *)&valuePtr[14] = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
      *(_WORD *)&valuePtr[22] = 1024;
      *(_DWORD *)&valuePtr[24] = 576;
      *(_WORD *)&valuePtr[28] = 2048;
      *(void *)&valuePtr[30] = v5;
      *(_WORD *)&valuePtr[38] = 2080;
      *(void *)&valuePtr[40] = v93;
      *(_WORD *)&valuePtr[48] = 1024;
      *(_DWORD *)&valuePtr[50] = v66;
      *(_WORD *)&valuePtr[54] = 1024;
      *(_DWORD *)&valuePtr[56] = v67;
      *(_WORD *)&valuePtr[60] = 1024;
      unsigned int v83 = v148;
      *(_DWORD *)&valuePtr[62] = v148;
      _os_log_debug_impl(&dword_1E1EA4000, v87, OS_LOG_TYPE_DEBUG, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Expected packet count decreased, resetting counts. Received=%u expected=%u lost=%u", valuePtr, 0x42u);
LABEL_42:
      LODWORD(v82) = v145;
      LODWORD(v137) = v143;
      LODWORD(v139) = v141;
      unsigned int v81 = v67;
      unsigned int v147 = v66;
    }
  }
LABEL_51:
  int v94 = 0;
  float v95 = 0.0;
  if (v81 && v83)
  {
    double v96 = (float)((float)v83 / (float)v81);
    double v97 = 100.0;
    if (v96 * 100.0 <= 100.0) {
      double v97 = v96 * 100.0;
    }
    float v95 = v97;
    int v94 = (int)(v96 * 10000.0);
  }
  *(_DWORD *)valuePtr = v94;
  CFNumberRef v98 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"ARxPLR", v98);
  CFRelease(v98);
  *(_DWORD *)valuePtr = v82;
  CFNumberRef v99 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"RTPDownlinkIngressAudioPkts", v99);
  CFRelease(v99);
  *(_DWORD *)valuePtr = v137;
  CFNumberRef v100 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"RTPDownlinkIngressNonDupMediaPkts", v100);
  CFRelease(v100);
  *(_DWORD *)valuePtr = v139;
  CFNumberRef v101 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"RTPDownlinkEgressAudioPkts", v101);
  CFRelease(v101);
  VCUtil_ExponentialMovingAverage((float *)v5 + 204, v95, 3.0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v102 = VRTraceErrorLogLevelToCSTR();
    v103 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v104 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
      *(_DWORD *)valuePtr = 136317442;
      double v105 = *((float *)v5 + 204);
      *(void *)&valuePtr[4] = v102;
      *(_WORD *)&valuePtr[12] = 2080;
      *(void *)&valuePtr[14] = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
      *(_WORD *)&valuePtr[22] = 1024;
      *(_DWORD *)&valuePtr[24] = 590;
      *(_WORD *)&valuePtr[28] = 2080;
      *(void *)&valuePtr[30] = v104;
      *(_WORD *)&valuePtr[38] = 2048;
      *(double *)&valuePtr[40] = v64 * 100.0;
      *(_WORD *)&valuePtr[48] = 2048;
      *(double *)&valuePtr[50] = v105;
      *(_WORD *)&valuePtr[58] = 2048;
      *(double *)&valuePtr[60] = v95;
      *(_WORD *)&valuePtr[68] = 1024;
      *(_DWORD *)&valuePtr[70] = v147;
      *(_WORD *)&valuePtr[74] = 1024;
      *(_DWORD *)&valuePtr[76] = v81;
      LOWORD(v170) = 1024;
      *(_DWORD *)((char *)&v170 + 2) = v83;
      _os_log_impl(&dword_1E1EA4000, v103, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d @=@ Health: VCAudioReceiver ParticipantID=%s erasure percentage=%.2f%% PLR percentage=%.2f%% current percentage:%.2f%% (rec:%u exp:%u, loss:%u)", valuePtr, 0x56u);
    }
  }
  v5[193] = v66;
  v5[194] += v147;
  v5[195] = v67;
  v5[196] = v148;
  *((void *)v5 + 99) = v145;
  *((void *)v5 + 100) = v143;
  *((void *)v5 + 101) = v141;
  *(_DWORD *)valuePtr = v132;
  CFNumberRef v106 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"ARxR", v106);
  CFRelease(v106);
  *(_DWORD *)valuePtr = v5[194];
  CFNumberRef v107 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"APktRx", v107);
  CFRelease(v107);
  *(_DWORD *)valuePtr = v131;
  CFNumberRef v108 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"AMRR", v108);
  CFRelease(v108);
  *(_DWORD *)valuePtr = v152;
  CFNumberRef v109 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
  CFDictionaryAddValue(v84, @"ARxDecodeBitrate", v109);
  CFRelease(v109);
  if (*((unsigned char *)v5 + 9128))
  {
    *(_DWORD *)valuePtr = v5[2324];
    CFNumberRef v110 = CFNumberCreate(v86, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v84, @"MSTC", v110);
    CFRelease(v110);
    v5[2324] = 0;
    float v111 = *((double *)v5 + 1160);
    *(float *)valuePtr = v111;
    CFNumberRef v112 = CFNumberCreate(v86, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v84, @"MSTT", v112);
    CFRelease(v112);
    *((void *)v5 + 1160) = 0;
    float v113 = *((double *)v5 + 1161);
    *(float *)valuePtr = v113;
    CFNumberRef v114 = CFNumberCreate(v86, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v84, @"MMST", v114);
    CFRelease(v114);
    *((void *)v5 + 1161) = 0;
  }
  v115 = (int *)*((void *)v5 + 1164);
  v116 = (NSObject **)MEMORY[0x1E4F47A50];
  if (v115)
  {
    *(_WORD *)valuePtr = 0;
    VCAudioIssueDetector_GetReportingStats(v115, valuePtr);
  }
  v117 = (unsigned int *)v85[8];
  if (!*((unsigned char *)v117 + 276) && *v117)
  {
    unint64_t v118 = 0;
    uint64_t v119 = 2;
    while (&v117[v119] < v117 + 58 && &v117[v119] >= v117 + 2)
    {
      uint64_t v120 = *(void *)&v117[v119];
      long long v173 = v161;
      long long v174 = v162;
      uint64_t v175 = v163;
      *(_OWORD *)&valuePtr[64] = v157;
      long long v170 = v158;
      long long v171 = v159;
      long long v172 = v160;
      *(_OWORD *)valuePtr = v153;
      *(_OWORD *)&valuePtr[16] = v154;
      *(_OWORD *)&valuePtr[32] = v155;
      *(_OWORD *)&valuePtr[48] = v156;
      _VCAudioReceiver_ReportAWDMetrics((uint64_t)v117, v120, (uint64_t)valuePtr);
      ++v118;
      v117 = (unsigned int *)v85[8];
      v119 += 14;
      if (v118 >= *v117) {
        goto LABEL_69;
      }
    }
    goto LABEL_77;
  }
LABEL_69:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v121 = VRTraceErrorLogLevelToCSTR();
    v122 = *v116;
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v123 = v5[2331];
      int v124 = *((unsigned __int16 *)v5 + 4566);
      unsigned int v125 = v5[194];
      *(_DWORD *)valuePtr = 136317442;
      *(void *)&valuePtr[4] = v121;
      *(_WORD *)&valuePtr[12] = 2080;
      *(void *)&valuePtr[14] = "_VCAudioReceiver_RegisterReportingTask_block_invoke";
      *(_WORD *)&valuePtr[22] = 1024;
      *(_DWORD *)&valuePtr[24] = 775;
      *(_WORD *)&valuePtr[28] = 2048;
      *(void *)&valuePtr[30] = v5;
      *(_WORD *)&valuePtr[38] = 1024;
      *(_DWORD *)&valuePtr[40] = v132;
      *(_WORD *)&valuePtr[44] = 1024;
      *(_DWORD *)&valuePtr[46] = v131;
      *(_WORD *)&valuePtr[50] = 1024;
      *(_DWORD *)&valuePtr[52] = v123;
      *(_WORD *)&valuePtr[56] = 1024;
      *(_DWORD *)&valuePtr[58] = v124;
      *(_WORD *)&valuePtr[62] = 1024;
      *(_DWORD *)&valuePtr[64] = ((double)(8 * DWORD1(v156)) / v63 / 1000.0 + 0.5);
      *(_WORD *)&valuePtr[68] = 1024;
      *(_DWORD *)&valuePtr[70] = v125;
      _os_log_impl(&dword_1E1EA4000, v122, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d @=@ Health: VCAudioReceiver [%p] audioRxBitrate=%ukbps, primaryAudioRxRate=%ukbps payload=%d streamID=%d redBitrate=%ukbps totalPacketsReceived=%d", valuePtr, 0x4Au);
    }
  }
  unint64_t v126 = v85[5];
  if (v126 && (v126 >= v85[6] || v126 < v85[7])) {
    goto LABEL_77;
  }
  return CheckOutHandleDebug();
}

void ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioReceiver [%s] %s:%d AudioReceiver is NULL", v2, v3, v4, v5, v6);
}

void ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VCAudioReceiver_ProcessWiFiNetworkNotification";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioReceiver [%s] %s:%d Wrong type of statistics message is processed by VCAudioStream type=%d", v2, *(const char **)v3, (unint64_t)"_VCAudioReceiver_ProcessWiFiNetworkNotification" >> 16, v4);
}

@end