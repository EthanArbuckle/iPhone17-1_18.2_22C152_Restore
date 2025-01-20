@interface VideoTransmitter
@end

@implementation VideoTransmitter

uint64_t ___VideoTransmitter_DispatchEncoderCallback_block_invoke(uint64_t a1)
{
  _VideoTransmitter_TransmitFrame(*(void *)(a1 + 32), *(void *)(a1 + 40), *(opaqueCMSampleBuffer **)(a1 + 48));
  _VideoTransmitter_ProcessEncoderArgs(*(void *)(a1 + 32), *(_DWORD **)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }

  return CheckOutHandleDebug();
}

uint64_t ___VideoTransmitter_HandleUncompressedVideo_block_invoke(uint64_t a1)
{
  _VideoTransmitter_TransmitFrame(*(void *)(a1 + 32), *(void *)(a1 + 40), *(opaqueCMSampleBuffer **)(a1 + 48));
  _VideoTransmitter_ProcessEncoderArgs(*(void *)(a1 + 32), *(_DWORD **)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }

  return CheckOutHandleDebug();
}

uint64_t ___VideoTransmitter_RetransmitPacketDispatched_block_invoke(uint64_t a1)
{
  uint64_t result = RTPTransportResendRTP(*(double *)(a1 + 48), *(void *)(a1 + 40), *(_DWORD *)(a1 + 64), *(unsigned __int16 *)(a1 + 68), *(int **)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___VideoTransmitter_ReportingRegisterPeriodicTask_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  uint64_t result = CheckInHandleDebug();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = result + 17780;
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)(result + 18264));
    if (v7)
    {
      v8 = (_WORD *)(result + 16486);
      double v134 = 0.0;
      VideoTransmitter_GetFramerate(1.0, *(void *)(a1 + 32), &v134);
      double v10 = v134;
      if (v134 > 0.0)
      {
        ++*(_WORD *)(v5 + 16558);
        LOWORD(v9) = *(_WORD *)(v5 + 16552);
        *(double *)&unint64_t v11 = v10 + (double)v9;
        *(_WORD *)(v5 + 16552) = (int)*(double *)&v11;
        LOWORD(v11) = *(_WORD *)(v5 + 16554);
        double v12 = (double)v11;
        int v13 = (int)v10;
        if (v10 > v12) {
          *(_WORD *)(v5 + 16554) = v13;
        }
        LOWORD(v12) = *(_WORD *)(v5 + 16556);
        if (v10 < (double)*(unint64_t *)&v12) {
          *(_WORD *)(v5 + 16556) = v13;
        }
      }
      double v133 = 0.0;
      VideoTransmitter_GetBitrate(1.0, *(void *)(a1 + 32), &v133);
      double v14 = v133;
      if (*(double *)(v5 + 368) < v133) {
        *(double *)(v5 + 368) = v133;
      }
      if (*(double *)(v5 + 376) > v14) {
        *(double *)(v5 + 376) = v14;
      }
      if (a2)
      {
        v15 = (double *)(v5 + 328);
        _VideoTransmitter_GetBitrates(v5, (double *)(v5 + 328), (double *)(v5 + 336), (double *)(v5 + 344), (double *)(v5 + 352), (double *)(v5 + 360), (float)*(unsigned int *)(v5 + 12));
        v16 = (__CFDictionary *)selectDestinationForRTMetrics();
        unsigned int v17 = *(_DWORD *)(v5 + 12);
        double v18 = 0.0;
        double v19 = 0.0;
        double v20 = 0.0;
        if (v17)
        {
          double v19 = (double)*(int *)(v5 + 320) / (double)v17;
          double v20 = (double)*(int *)(v5 + 324) / (double)v17;
        }
        *(_DWORD *)valuePtr = (v19 / 1000.0 + 0.5);
        CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFNumberRef v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRHDRVCP", v22);
        CFRelease(v22);
        *(_DWORD *)valuePtr = (v20 / 1000.0 + 0.5);
        CFNumberRef v23 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRFECVCP", v23);
        CFRelease(v23);
        if (*v15 > 0.0) {
          double v18 = *(double *)(v5 + 344) * 100.0 / *v15;
        }
        float v24 = v18;
        *(float *)valuePtr = v24;
        CFNumberRef v25 = CFNumberCreate(v21, kCFNumberFloat32Type, valuePtr);
        CFDictionaryAddValue(v16, @"VTxFECOverhead", v25);
        CFRelease(v25);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 328) / 1000.0 + 0.5);
        CFNumberRef v26 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRMedia", v26);
        CFRelease(v26);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 336) / 1000.0 + 0.5);
        CFNumberRef v27 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRHDR", v27);
        CFRelease(v27);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 344) / 1000.0 + 0.5);
        CFNumberRef v28 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRFEC", v28);
        CFRelease(v28);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 360) / 1000.0 + 0.5);
        CFNumberRef v29 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxR", v29);
        CFRelease(v29);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 368) / 1000.0 + 0.5);
        CFNumberRef v30 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRMax", v30);
        CFRelease(v30);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 376) / 1000.0 + 0.5);
        CFNumberRef v31 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRMin", v31);
        CFRelease(v31);
        *(_DWORD *)valuePtr = (int)((double)*(int *)(v5 + 36) / 1000.0 + 0.5);
        CFNumberRef v32 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxRTarget", v32);
        CFRelease(v32);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 352) / 1000.0 + 0.5);
        CFNumberRef v33 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxMetadataOverhead", v33);
        CFRelease(v33);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16);
        CFNumberRef v34 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"CodecPayload", v34);
        CFRelease(v34);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 320);
        CFNumberRef v35 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"QID", v35);
        CFRelease(v35);
        if (*(_WORD *)(v5 + 16558))
        {
          LOWORD(v36) = *(_WORD *)(v5 + 16552);
          *(float *)&unint64_t v36 = (double)v36 / (double)*(unsigned __int16 *)(v5 + 16558);
        }
        else
        {
          LODWORD(v36) = 0;
        }
        *(_DWORD *)valuePtr = v36;
        CFNumberRef v37 = CFNumberCreate(v21, kCFNumberFloat32Type, valuePtr);
        CFDictionaryAddValue(v16, @"ATFr", v37);
        CFRelease(v37);
        *(_DWORD *)valuePtr = *(unsigned __int16 *)(v5 + 16554);
        CFNumberRef v38 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"XTFr", v38);
        CFRelease(v38);
        int v39 = *(unsigned __int16 *)(v5 + 16556);
        if (v39 == 0xFFFF) {
          int v39 = 0;
        }
        *(_DWORD *)valuePtr = v39;
        CFNumberRef v40 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"NTFr", v40);
        CFRelease(v40);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 4432);
        CFNumberRef v41 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VFEC", v41);
        CFRelease(v41);
        *(_DWORD *)valuePtr = (unsigned __int16)*v8;
        CFNumberRef v42 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"AFECL", v42);
        CFRelease(v42);
        _WORD *v8 = 0;
        *(_DWORD *)valuePtr = (int)(VCFECGenerator_GetProcessingAverageTime(*(void *)(v5 + 18160)) * 10000000.0);
        CFNumberRef v43 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxFECTime", v43);
        CFRelease(v43);
        if (*(_DWORD *)(v6 + 476))
        {
          *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 476);
          CFNumberRef v44 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
          CFDictionaryAddValue(v16, @"LTRAckRx", v44);
          CFRelease(v44);
          *(_DWORD *)(v6 + 476) = 0;
        }
        if (*(_DWORD *)(v6 + 480))
        {
          *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 480);
          CFNumberRef v45 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
          CFDictionaryAddValue(v16, @"RtcpAppLTRAckRx", v45);
          CFRelease(v45);
          *(_DWORD *)(v6 + 480) = 0;
        }
        uint64_t v46 = *(void *)(v5 + 18272);
        if (v46 && *(unsigned char *)(v6 + 406)) {
          VCNACKConsumer_GetStatistics(v46, v16);
        }
        *(_OWORD *)(v5 + 368) = xmmword_1E259E6C0;
        *(void *)(v5 + 16552) = 0xFFFF00000000;
        if (*(_DWORD *)(v5 + 1600))
        {
          unint64_t v47 = 0;
          int v48 = 0;
          unint64_t v49 = 0;
          v50 = (uint64_t *)(v5 + 520);
          do
          {
            int v132 = 0;
            RTPGetPacketSent(*v50, &v132);
            v48 += v132;
            *(void *)valuePtr = 0;
            uint64_t v51 = *v50;
            v50 += 15;
            RTPGetUplinkReportingStats(v51, valuePtr);
            v49 += *(void *)valuePtr;
            ++v47;
          }
          while (v47 < *(unsigned int *)(v5 + 1600));
        }
        else
        {
          unint64_t v49 = 0;
          int v48 = 0;
        }
        v128 = (_DWORD *)(v5 + 16896);
        unint64_t v52 = *(void *)(v5 + 18072);
        if (v49 <= v52) {
          LODWORD(v52) = 0;
        }
        int v53 = *(_DWORD *)(v5 + 264);
        int v54 = v53 - *(_DWORD *)(v5 + 268);
        *(_DWORD *)(v5 + 268) = v53;
        *(_DWORD *)valuePtr = v49 - v52;
        CFNumberRef v55 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"RTPUplinkIngressVideoPkts", v55);
        CFRelease(v55);
        *(_DWORD *)valuePtr = v48;
        CFNumberRef v56 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VPS", v56);
        CFRelease(v56);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16560);
        CFNumberRef v57 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VMediaPktSent", v57);
        CFRelease(v57);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16512);
        CFNumberRef v58 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VNWET", v58);
        CFRelease(v58);
        *(_DWORD *)valuePtr = *(_DWORD *)v6;
        CFNumberRef v59 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VFCCnt", v59);
        CFRelease(v59);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 28);
        CFNumberRef v60 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"IdleFrameCount", v60);
        CFRelease(v60);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 8);
        CFNumberRef v61 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"EncInFrameCnt", v61);
        CFRelease(v61);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 12);
        CFNumberRef v62 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"EncOutFrameCnt", v62);
        CFRelease(v62);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 24);
        CFNumberRef v63 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxNoFecTF", v63);
        CFRelease(v63);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16592);
        CFNumberRef v64 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxSinglePktFrame", v64);
        CFRelease(v64);
        *(_DWORD *)valuePtr = v53;
        CFNumberRef v65 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxKeyFramesSent", v65);
        CFRelease(v65);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 272);
        CFNumberRef v66 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, @"VTxTotalIDR", v66);
        CFRelease(v66);
        *(_DWORD *)valuePtr = v54;
        CFNumberRef v67 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        v129 = v16;
        CFDictionaryAddValue(v16, @"VTxDeltaKeyFramesSent", v67);
        CFRelease(v67);
        int v68 = *(_DWORD *)(v6 + 12);
        int v69 = *(_DWORD *)(v6 + 308);
        if ((int)VRTraceGetErrorLogLevelForModule() > 5)
        {
          uint64_t v70 = VRTraceErrorLogLevelToCSTR();
          v71 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v72 = *(unsigned __int16 *)(v5 + 440);
            int v73 = *(_DWORD *)v6;
            int v74 = *(_DWORD *)(v6 + 4);
            unsigned int v75 = *(_DWORD *)(v5 + 12);
            int v76 = *(_DWORD *)(v6 + 8);
            int v77 = *(_DWORD *)(v6 + 12);
            int v78 = *(_DWORD *)(v6 + 16);
            int v79 = *(_DWORD *)(v6 + 20);
            int v80 = *(_DWORD *)(v6 + 24);
            int v81 = *(_DWORD *)(v5 + 16592);
            *(_DWORD *)valuePtr = 136320514;
            uint64_t v82 = *(void *)(v5 + 328);
            uint64_t v83 = *(void *)(v5 + 336);
            uint64_t v84 = *(void *)(v5 + 344);
            uint64_t v85 = *(void *)(v5 + 360);
            int v86 = *(_DWORD *)(v5 + 4380);
            *(void *)&valuePtr[4] = v70;
            float v87 = (float)v75;
            __int16 v136 = 2080;
            v137 = "_VideoTransmitter_ReportingRegisterPeriodicTask_block_invoke";
            __int16 v138 = 1024;
            int v139 = 816;
            __int16 v140 = 1024;
            *(_DWORD *)v141 = v72;
            *(_WORD *)&v141[4] = 1024;
            *(_DWORD *)&v141[6] = v73;
            *(_WORD *)v142 = 1024;
            *(_DWORD *)&v142[2] = v74;
            LOWORD(v143) = 1024;
            *(_DWORD *)((char *)&v143 + 2) = v78;
            HIWORD(v143) = 1024;
            *(_DWORD *)v144 = v76;
            *(_WORD *)&v144[4] = 1024;
            *(_DWORD *)&v144[6] = v68 / v69;
            __int16 v145 = 2048;
            double v146 = (float)((float)(v68 / v69) / v87);
            __int16 v147 = 1024;
            int v148 = v77;
            __int16 v149 = 2048;
            double v150 = (float)((float)v77 / v87);
            __int16 v151 = 1024;
            int v152 = v79;
            __int16 v153 = 1024;
            int v154 = v80;
            __int16 v155 = 1024;
            int v156 = v81;
            __int16 v157 = 2048;
            uint64_t v158 = v82;
            __int16 v159 = 2048;
            uint64_t v160 = v83;
            __int16 v161 = 2048;
            uint64_t v162 = v84;
            __int16 v163 = 2048;
            uint64_t v164 = v85;
            __int16 v165 = 2048;
            double v166 = v18;
            __int16 v167 = 1024;
            int v168 = v86;
            __int16 v169 = 1024;
            int v170 = v54;
            _os_log_impl(&dword_1E1EA4000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VideoTransmitter streamID=%d, toBeBufferedFrameCount=%d, bufferedFrameCount=%d, encoderProcCount=%d, toBeEncodedFrameCount=%d, encodedFullFrameCount=%d, encodedFullFrameRate=%f, encodedFrameCount=%d, encodedFrameRate=%f, transmittedFrameCount=%d, transmittedNonFECFrameCount=%d, singlePacketFrameCount=%d, currentMediaBitrate=%f, currentHeaderBitrate=%f, currentFECBitrate=%f, currentTotalBitrate=%f, currentFECOverhead=%2.4f targetBitrate=%d deltaKeyFramesSent=%d", valuePtr, 0xAAu);
          }
        }
        v127 = (_OWORD *)(v5 + 408);
        *(void *)(v5 + 360) = 0;
        *(_DWORD *)(v5 + 16592) = 0;
        *(_OWORD *)(v5 + 320) = 0u;
        *(_OWORD *)(v5 + 336) = 0u;
        *(_OWORD *)uint64_t v6 = 0u;
        *(_OWORD *)(v6 + 16) = 0u;
        v88 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
        v89 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
        uint64_t v131 = v5;
        theDict = CFDictionaryCreateMutable(v21, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v126 = (_OWORD *)(v5 + 17816);
        Mutable = CFDictionaryCreateMutable(v21, 0, v88, v89);
        v91 = CFDictionaryCreateMutable(v21, 0, v88, v89);
        v92 = CFDictionaryCreateMutable(v21, 0, v88, v89);
        uint64_t v93 = v6;
        uint64_t v94 = 0;
        uint64_t v130 = v93;
        v95 = (_DWORD *)(v93 + 52);
        do
        {
          if (*v95)
          {
            uint64_t v96 = FECUtil_FECLevelofProtectionToFECPercentage(v94);
            CFStringRef v97 = CFStringCreateWithFormat(v21, 0, @"%u", v96);
            *(_DWORD *)valuePtr = *((void *)v95 - 2);
            CFNumberRef v98 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
            CFDictionaryAddValue(Mutable, v97, v98);
            CFRelease(v98);
            *(_DWORD *)valuePtr = *((void *)v95 - 1);
            CFNumberRef v99 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
            CFDictionaryAddValue(v91, v97, v99);
            CFRelease(v99);
            *(_DWORD *)valuePtr = *v95;
            CFNumberRef v100 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
            CFDictionaryAddValue(v92, v97, v100);
            CFRelease(v100);
            CFRelease(v97);
          }
          ++v94;
          v95 += 10;
        }
        while (v94 != 6);
        CFDictionaryAddValue(theDict, @"VFecDB", Mutable);
        CFDictionaryAddValue(theDict, @"VFecPB", v91);
        CFDictionaryAddValue(theDict, @"VFecTF", v92);
        CFRelease(Mutable);
        CFRelease(v91);
        CFRelease(v92);
        CFDictionaryAddValue(v129, @"VTxFecStats", theDict);
        CFRelease(theDict);
        uint64_t v101 = 0;
        v102 = (_DWORD *)(v130 + 52);
        do
        {
          if (*v102)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v103 = VRTraceErrorLogLevelToCSTR();
              v104 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v105 = *((void *)v102 - 2);
                uint64_t v106 = *((void *)v102 - 1);
                int v107 = *v102;
                *(_DWORD *)valuePtr = 136316930;
                *(void *)&valuePtr[4] = v103;
                __int16 v136 = 2080;
                v137 = "_VideoTransmitter_ReportingRegisterPeriodicTask_block_invoke";
                __int16 v138 = 1024;
                int v139 = 842;
                __int16 v140 = 2048;
                *(void *)v141 = v131;
                *(_WORD *)&v141[8] = 1024;
                *(_DWORD *)v142 = v101;
                *(_WORD *)&v142[4] = 2048;
                uint64_t v143 = v105;
                *(_WORD *)v144 = 2048;
                *(void *)&v144[2] = v106;
                __int16 v145 = 1024;
                LODWORD(v146) = v107;
                _os_log_impl(&dword_1E1EA4000, v104, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoTransmitter[%p] FEC health report: fecLevel:%d data:%llu, parity:%llu, totalFrame:%d", valuePtr, 0x46u);
              }
            }
          }
          ++v101;
          v102 += 10;
        }
        while (v101 != 6);
        v126[13] = 0u;
        v126[14] = 0u;
        v126[11] = 0u;
        v126[12] = 0u;
        v126[9] = 0u;
        v126[10] = 0u;
        v126[7] = 0u;
        v126[8] = 0u;
        v126[5] = 0u;
        v126[6] = 0u;
        v126[3] = 0u;
        v126[4] = 0u;
        v126[1] = 0u;
        v126[2] = 0u;
        _OWORD *v126 = 0u;
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v108 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"AVPEL", v108);
        CFRelease(v108);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v109 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"AVEL", v109);
        CFRelease(v109);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v110 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"AVPL", v110);
        CFRelease(v110);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v111 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"APSL", v111);
        CFRelease(v111);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v112 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"ATSL", v112);
        CFRelease(v112);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v113 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"MVPEL", v113);
        CFRelease(v113);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v114 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"MVEL", v114);
        CFRelease(v114);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v115 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"MVEL", v115);
        CFRelease(v115);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v116 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"MPSL", v116);
        CFRelease(v116);
        *(_DWORD *)valuePtr = 0;
        CFNumberRef v117 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"MTSL", v117);
        CFRelease(v117);
        pthread_mutex_lock((pthread_mutex_t *)(v131 + 16832));
        *(_DWORD *)valuePtr = *v128;
        CFNumberRef v118 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"AFL", v118);
        CFRelease(v118);
        *(_DWORD *)valuePtr = v128[1];
        CFNumberRef v119 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"VFL", v119);
        CFRelease(v119);
        *(void *)(v131 + 16896) = 0;
        pthread_mutex_unlock((pthread_mutex_t *)(v131 + 16832));
        *(_DWORD *)valuePtr = *(_DWORD *)(v131 + 424);
        CFNumberRef v120 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, @"AVHTDCount", v120);
        CFRelease(v120);
        *(void *)valuePtr = *(void *)(v131 + 408);
        CFNumberRef v121 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, @"AVHTDMax", v121);
        CFRelease(v121);
        *(void *)valuePtr = *(void *)(v131 + 416);
        CFNumberRef v122 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, @"AVHTDMin", v122);
        CFRelease(v122);
        *(void *)valuePtr = *(void *)(v131 + 400);
        CFNumberRef v123 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, @"AVHTDSum", v123);
        CFRelease(v123);
        *(void *)valuePtr = *(void *)(v131 + 392);
        CFNumberRef v124 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, @"AVHTDAbsSum", v124);
        CFRelease(v124);
        *(_DWORD *)(v131 + 424) = 0;
        _OWORD *v127 = xmmword_1E259EC50;
        *(void *)(v131 + 392) = 0;
        *(void *)(v131 + 400) = 0;
        *(void *)(v131 + 18072) = v49;
      }
      return CheckOutHandleDebug();
    }
    else
    {
      return CheckOutHandleDebug();
    }
  }
  return result;
}

int32x2_t ___VideoTransmitter_RegisterStatistics_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 == 3)
  {
    v2 = *(int32x2_t **)(a1 + 32);
    int32x2_t v3 = *(int32x2_t *)(a2 + 48);
    v2[2258].i32[0] = *(double *)(a2 + 40);
    int32x2_t result = vrev64_s32(v3);
    v2[2257] = result;
  }
  return result;
}

@end