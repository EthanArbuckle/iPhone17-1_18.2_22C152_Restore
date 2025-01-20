@interface VCMediaQueue
@end

@implementation VCMediaQueue

void ___VCMediaQueue_ReportingRegisterPeriodicTask_block_invoke(uint64_t a1, uint64_t a2, __CFDictionary *a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    int valuePtr = *(_DWORD *)(a2 + 412);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSchBytes", v6);
    CFRelease(v6);
    int valuePtr = *(_DWORD *)(a2 + 416);
    CFNumberRef v7 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSchHeaderBytes", v7);
    CFRelease(v7);
    int valuePtr = *(_DWORD *)(a2 + 420);
    CFNumberRef v8 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSchPkts", v8);
    CFRelease(v8);
    int valuePtr = *(_DWORD *)(a2 + 424);
    CFNumberRef v9 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSentBytes", v9);
    CFRelease(v9);
    int valuePtr = *(_DWORD *)(a2 + 428);
    CFNumberRef v10 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSentHeaderBytes", v10);
    CFRelease(v10);
    int valuePtr = *(_DWORD *)(a2 + 436);
    CFNumberRef v11 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSentPkts", v11);
    CFRelease(v11);
    int valuePtr = *(_DWORD *)(a2 + 440);
    CFNumberRef v12 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQUnsentPkts", v12);
    CFRelease(v12);
    int valuePtr = *(_DWORD *)(a2 + 432);
    CFNumberRef v13 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSavedBytes", v13);
    CFRelease(v13);
    int valuePtr = *(_DWORD *)(a2 + 420) - *(_DWORD *)(a2 + 436);
    CFNumberRef v14 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQSavedPkts", v14);
    CFRelease(v14);
    int valuePtr = -1431655766;
    int v15 = atomic_load((unint64_t *)(a2 + 512));
    int valuePtr = v15;
    CFNumberRef v16 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQIngressAudioPkts", v16);
    CFRelease(v16);
    int valuePtr = -1431655766;
    int v17 = atomic_load((unint64_t *)(a2 + 504));
    int valuePtr = v17;
    CFNumberRef v18 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQIngressVideoPkts", v18);
    CFRelease(v18);
    int valuePtr = -1431655766;
    int v19 = atomic_load((unint64_t *)(a2 + 520));
    int valuePtr = v19;
    CFNumberRef v20 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQIngressPkts", v20);
    CFRelease(v20);
    int valuePtr = -1431655766;
    int v21 = atomic_load((unint64_t *)(a2 + 528));
    int valuePtr = v21;
    CFNumberRef v22 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQIngressQueuedPkts", v22);
    CFRelease(v22);
    int valuePtr = *(void *)(a2 + 536);
    CFNumberRef v23 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQFlushedPkts", v23);
    CFRelease(v23);
    int valuePtr = *(void *)(a2 + 552);
    CFNumberRef v24 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQEgressAudioPkts", v24);
    CFRelease(v24);
    int valuePtr = *(void *)(a2 + 544);
    CFNumberRef v25 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQEgressVideoPkts", v25);
    CFRelease(v25);
    int valuePtr = *(void *)(a2 + 560);
    CFNumberRef v26 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQEgressPkts", v26);
    CFRelease(v26);
    int valuePtr = *(void *)(a2 + 568);
    CFNumberRef v27 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQEgressNonDupAudioPkts", v27);
    CFRelease(v27);
    int valuePtr = *(void *)(a2 + 576);
    CFNumberRef v28 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQEgressNonDupVideoPkts", v28);
    CFRelease(v28);
    int valuePtr = *(void *)(a2 + 584);
    CFNumberRef v29 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VCMQEgressNonDupPkts", v29);
    CFRelease(v29);
    v30 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    v31 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v33 = CFDictionaryCreateMutable(v5, 0, v30, v31);
    v34 = CFDictionaryCreateMutable(v5, 0, v30, v31);
    if (Mutable && v33)
    {
      v63 = a3;
      CFDictionaryRef theDict = Mutable;
      int v35 = atomic_load((unsigned int *)(a2 + 760));
      int valuePtr = 0;
      if (v35 >= 1)
      {
        uint64_t v36 = 0;
        uint64_t v65 = 176 * v35;
        do
        {
          unint64_t v37 = *(void *)(a2 + 624);
          unint64_t v38 = v37 + v36;
          if (!(v37 + v36)) {
            break;
          }
          unint64_t v39 = v37 + 176 * *(unsigned int *)(a2 + 348);
          if (v38 < v39 && v38 >= v37)
          {
            uint64_t v41 = v37 + v36;
            unsigned __int8 v42 = atomic_load((unsigned __int8 *)(v37 + v36 + 97));
            if (v42)
            {
              uint64_t v44 = 2;
            }
            else
            {
              unsigned __int8 v43 = atomic_load((unsigned __int8 *)(v41 + 96));
              uint64_t v44 = (v43 & 1) != 0 ? 3 : 1;
            }
            if (v41 + 176 <= v39) {
              continue;
            }
          }
          __break(0x5519u);
          uint64_t v45 = v37 + v36;
          if (*(_DWORD *)(v37 + v36 + 156))
          {
            CFStringRef v46 = CFStringCreateWithFormat(v5, 0, @"%d", v44);
            int v47 = *(_DWORD *)(v45 + 156);
            if (FigCFDictionaryGetInt32IfPresent())
            {
              int v48 = valuePtr;
              if (v47 > valuePtr) {
                int v48 = v47;
              }
              int v66 = v48;
              CFNumberRef v49 = CFNumberCreate(v5, kCFNumberIntType, &v66);
              v50 = theDict;
            }
            else
            {
              int v66 = v47;
              CFNumberRef v49 = CFNumberCreate(v5, kCFNumberIntType, &v66);
              v50 = v34;
            }
            CFDictionaryAddValue(v50, v46, v49);
            CFRelease(v49);
            if (v46) {
              CFRelease(v46);
            }
          }
          *(_DWORD *)(v45 + 156) = 0;
          if (*(_DWORD *)(v45 + 72))
          {
            CFStringRef v51 = CFStringCreateWithFormat(v5, 0, @"%d", v44);
            unsigned int v52 = *(_DWORD *)(v45 + 72);
            if (v52) {
              double v53 = *(double *)(v37 + v36 + 56) / (double)v52 * 1000.0;
            }
            else {
              double v53 = 0.0;
            }
            int v54 = (int)v53;
            if (FigCFDictionaryGetInt32IfPresent())
            {
              int v55 = valuePtr;
              if (valuePtr <= v54) {
                int v55 = v54;
              }
              int v66 = v55;
            }
            else
            {
              int v66 = v54;
            }
            CFNumberRef v56 = CFNumberCreate(v5, kCFNumberIntType, &v66);
            CFDictionaryAddValue(v33, v51, v56);
            CFRelease(v56);
            int v57 = (int)(*(double *)(v37 + v36 + 64) * 1000.0);
            if (FigCFDictionaryGetInt32IfPresent())
            {
              int v58 = valuePtr;
              if (valuePtr <= v57) {
                int v58 = v57;
              }
              int v66 = v58;
            }
            else
            {
              int v66 = v57;
            }
            CFNumberRef v59 = CFNumberCreate(v5, kCFNumberIntType, &v66);
            CFDictionaryAddValue(v34, v51, v59);
            CFRelease(v59);
            if (v51) {
              CFRelease(v51);
            }
          }
          uint64_t v60 = v37 + v36;
          *(void *)(v60 + 56) = 0;
          *(void *)(v60 + 64) = 0;
          *(_DWORD *)(v60 + 72) = 0;
          v36 += 176;
        }
        while (v65 != v36);
      }
      CFMutableDictionaryRef Mutable = theDict;
      if (CFDictionaryGetCount(theDict) >= 1) {
        CFDictionaryAddValue(v63, @"VCMQFlushPerStream", theDict);
      }
      if (CFDictionaryGetCount(v33) >= 1) {
        CFDictionaryAddValue(v63, @"VCMQQSizePerStream", v33);
      }
      if (CFDictionaryGetCount(v34) >= 1) {
        CFDictionaryAddValue(v63, @"VCMQMaxQSizePerStream", v34);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v61 = VRTraceErrorLogLevelToCSTR();
      v62 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int valuePtr = 136316162;
        uint64_t v68 = v61;
        __int16 v69 = 2080;
        v70 = "_VCMediaQueue_ReportingRegisterPeriodicTask_block_invoke";
        __int16 v71 = 1024;
        int v72 = 621;
        __int16 v73 = 2048;
        CFMutableDictionaryRef v74 = Mutable;
        __int16 v75 = 2048;
        v76 = v33;
        _os_log_error_impl(&dword_1E1EA4000, v62, OS_LOG_TYPE_ERROR, "VCMediaQueue [%s] %s:%d Failed to allocate dictionaries in reporting flushCountDict=%p queueSizeDict=%p", (uint8_t *)&valuePtr, 0x30u);
      }
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v33) {
      CFRelease(v33);
    }
    if (v34) {
      CFRelease(v34);
    }
  }
}

@end