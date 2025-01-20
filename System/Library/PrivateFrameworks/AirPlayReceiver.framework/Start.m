@interface Start
@end

@implementation Start

void __aprscreen_Start_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 32);
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 40);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if ((*(_DWORD *)(DerivedStorage + 228) & 0x80000000) != 0)
  {
    block[0] = 28;
    FigCFDictionaryGetInt32IfPresent();
    APSLogErrorAt();
    if (gLogCategory_APReceiverScreenSession <= 90
      && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_17;
  }
  socklen_t v5 = SocketAccept();
  if (!v5)
  {
    if (gLogCategory_APReceiverScreenSession <= 50
      && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v6 = *(_DWORD *)(DerivedStorage + 228);
    if ((v6 & 0x80000000) == 0)
    {
      if (close(v6) && *__error()) {
        __error();
      }
      *(_DWORD *)(DerivedStorage + 228) = -1;
    }
    if (*(unsigned char *)(DerivedStorage + 187)) {
      SocketSetQoS();
    }
    uint64_t v7 = CMBaseObjectGetDerivedStorage();
    pthread_mutex_lock(*(pthread_mutex_t **)(v7 + 240));
    if (*(unsigned char *)(v7 + 248))
    {
      pthread_mutex_unlock(*(pthread_mutex_t **)(v7 + 240));
LABEL_17:
      Mutable = 0;
      socklen_t v9 = 0;
      goto LABEL_269;
    }
    socklen_t v9 = NetSocket_CreateWithNative();
    pthread_mutex_unlock(*(pthread_mutex_t **)(v7 + 240));
    if (v9)
    {
      if (v9 == -6723) {
        goto LABEL_17;
      }
      goto LABEL_268;
    }
    if (v3)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      Value = CFDictionaryGetValue(v3, @"PresentationLayer");
      if (Value) {
        CFDictionarySetValue(Mutable, @"PresentationLayer", Value);
      }
      v11 = CFDictionaryGetValue(v3, @"PresentationContext");
      if (v11) {
        CFDictionarySetValue(Mutable, @"PresentationContext", v11);
      }
      v12 = CFDictionaryGetValue(v3, @"ReportedDisplaySize");
      if (v12) {
        CFDictionarySetValue(Mutable, @"ReportedDisplaySize", v12);
      }
    }
    else
    {
      Mutable = 0;
    }
    uint64_t v13 = *(void *)(DerivedStorage + 144);
    v14 = (uint64_t *)MEMORY[0x263EFFB38];
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v135 = *v14;
    v17 = *(void (**)(uint64_t, __CFString *, uint64_t))(v16 + 56);
    if (v17) {
      v17(v13, @"ScreenFadeOutOnStop", v135);
    }
    uint64_t v18 = *(void *)(DerivedStorage + 144);
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    v21 = *(uint64_t (**)(uint64_t, __CFDictionary *))(v20 + 8);
    if (v21)
    {
      socklen_t v22 = v21(v18, Mutable);
      if (!v22)
      {
        if (Mutable) {
          CFRelease(Mutable);
        }
        if (FigGetCFPreferenceNumberWithDefault()) {
          aprscreen_captureStart(v2, 0, 0);
        }
        uint64_t v132 = v1;
        if (gLogCategory_APReceiverScreenSession <= 50
          && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        uint64_t v131 = DerivedStorage;
        APTTrafficMetricsConnectionFormed();
        v23 = (unsigned int *)CMBaseObjectGetDerivedStorage();
        uint64_t v134 = *MEMORY[0x263EFFB40];
        CFAllocatorRef v138 = (const __CFAllocator *)*MEMORY[0x263EFFB18];
        CFAllocatorRef v139 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        uint64_t v133 = v2;
        while (2)
        {
          APTTrafficMetricsMessageReadStarted();
          socklen_t v9 = (*(uint64_t (**)(void))(*((void *)v23 + 29) + 24))();
          APTTrafficMetricsMessageReadFinished();
          if (v9)
          {
            BOOL v118 = v9 == -6753 || v9 == -6723;
            uint64_t DerivedStorage = v131;
            uint64_t v1 = v132;
            if (v118) {
              goto LABEL_254;
            }
            APSLogErrorAt();
            v25 = 0;
            goto LABEL_262;
          }
          uint64_t v24 = aprscreen_ntpTimestamp();
          *((void *)v23 + 38) = v24;
          *((void *)v23 + 39) = v24;
          if (*v23)
          {
            v25 = malloc_type_malloc(*v23, 0x45AA9998uLL);
            if (!v25)
            {
              APSLogErrorAt();
              socklen_t v9 = -6728;
LABEL_259:
              uint64_t v1 = v132;
LABEL_261:
              uint64_t DerivedStorage = v131;
LABEL_262:
              if (gLogCategory_APReceiverScreenSession <= 90
                && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              if (v25) {
                free(v25);
              }
              goto LABEL_268;
            }
            APTTrafficMetricsMessageReadStarted();
            socklen_t v9 = (*(uint64_t (**)(void))(*((void *)v23 + 29) + 24))();
            APTTrafficMetricsMessageReadFinished();
            if (v9)
            {
              uint64_t v1 = v132;
              if (v9 == -6723)
              {
                free(v25);
                uint64_t DerivedStorage = v131;
LABEL_254:
                if (gLogCategory_APReceiverScreenSession <= 50
                  && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                uint64_t v127 = *(void *)(DerivedStorage + 144);
                uint64_t v128 = *(void *)(CMBaseObjectGetVTable() + 8);
                if (v128) {
                  uint64_t v129 = v128;
                }
                else {
                  uint64_t v129 = 0;
                }
                v130 = *(void (**)(uint64_t, __CFString *, uint64_t))(v129 + 56);
                if (v130) {
                  v130(v127, @"ScreenFadeOutOnStop", v134);
                }
                goto LABEL_17;
              }
              APSLogErrorAt();
              goto LABEL_261;
            }
          }
          else
          {
            v25 = 0;
          }
          *((void *)v23 + 40) = aprscreen_ntpTimestamp();
          uint64_t v26 = CMBaseObjectGetDerivedStorage();
          pthread_mutex_lock(*(pthread_mutex_t **)(v26 + 208));
          switch(*(unsigned char *)(v26 + 4))
          {
            case 0:
              v39 = (unsigned int *)CMBaseObjectGetDerivedStorage();
              CMBlockBufferRef blockBufferOut = 0;
              uint64_t v40 = *((void *)v39 + 1);
              uint64_t v41 = *((void *)v39 + 5);
              uint64_t v42 = CMBaseObjectGetDerivedStorage();
              v141[0] = 0;
              if (*(unsigned char *)(v42 + 188))
              {
                uint64_t v43 = mach_absolute_time();
              }
              else
              {
                v46 = (void *)v42;
                uint64_t v47 = *(void *)(v42 + 128);
                if (v47)
                {
                  uint64_t v48 = *(void *)(CMBaseObjectGetVTable() + 16);
                  if (v48) {
                    uint64_t v49 = v48;
                  }
                  else {
                    uint64_t v49 = 0;
                  }
                  v72 = *(unsigned int (**)(uint64_t, socklen_t *, void *))(v49 + 24);
                  if (!v72
                    || (*(void *)block = v41,
                        uint64_t v146 = v40 << 32,
                        v147 = (void (*)(void *))HIDWORD(v40),
                        v72(v47, block, v141)))
                  {
                    if (gLogCategory_APReceiverScreenSession <= 90
                      && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF();
                    }
                    uint64_t v43 = v46[35];
                  }
                  else
                  {
                    uint64_t v43 = v141[0];
                    v46[35] = v141[0];
                  }
                }
                else
                {
                  uint64_t v69 = NTPtoUpTicks();
                  uint64_t v70 = v69;
                  if (v46[42])
                  {
                    uint64_t v71 = v46[37];
                  }
                  else
                  {
                    v46[37] = v46[36] - v69;
                    uint64_t v71 = v46[37] + MillisecondsToUpTicks();
                    v46[37] = v71;
                  }
                  uint64_t v43 = v71 + v70;
                }
              }
              size_t v83 = *v39;
              BOOL v84 = (*((unsigned char *)v39 + 5) & 0x10) != 0 || *((void *)v39 + 42) == 0;
              uint64_t v85 = CMBaseObjectGetDerivedStorage();
              block[0] = 0;
              if (!v25) {
                goto LABEL_177;
              }
              v86 = (_DWORD *)v85;
              if (*(unsigned char *)(v85 + 4)) {
                goto LABEL_177;
              }
              if (*(unsigned char *)(v85 + 352))
              {
                if (*(_DWORD *)v85 >= 0x10u)
                {
                  BOOL v87 = v84;
                  uint64_t v88 = v85 + 648;
                  chacha20_poly1305_init_64x64();
                  chacha20_poly1305_add_aad();
                  uint64_t v89 = chacha20_poly1305_decrypt();
                  uint64_t v90 = chacha20_poly1305_verify();
                  if (!block[0])
                  {
                    uint64_t v91 = (*v86 - 16);
                    if (v90 + v89 == v91)
                    {
                      uint64_t v92 = 0;
                      _DWORD *v86 = v91;
                      BOOL v84 = v87;
                      uint64_t v2 = v133;
                      do
                      {
                        if (++*(unsigned char *)(v88 + v92)) {
                          BOOL v94 = 1;
                        }
                        else {
                          BOOL v94 = v92 == 7;
                        }
                        ++v92;
                      }
                      while (!v94);
                      goto LABEL_177;
                    }
                    APSLogErrorAt();
                    socklen_t v9 = -6762;
                    block[0] = -6762;
                    BOOL v84 = v87;
                    uint64_t v2 = v133;
LABEL_237:
                    if (gLogCategory_APReceiverScreenSession >= 91) {
                      goto LABEL_242;
                    }
                    if (gLogCategory_APReceiverScreenSession != -1
                      || (v117 = _LogCategory_Initialize(), socklen_t v9 = block[0], v117))
                    {
                      LogPrintF();
                      socklen_t v9 = block[0];
                    }
                    if (v9) {
                      goto LABEL_242;
                    }
                    goto LABEL_177;
                  }
                  APSLogErrorAt();
                  socklen_t v9 = block[0];
                  BOOL v84 = v87;
                  uint64_t v2 = v133;
                  if (block[0]) {
                    goto LABEL_237;
                  }
                }
              }
              else if (*(unsigned char *)(v85 + 704))
              {
                socklen_t v95 = AES_CTR_Update();
                block[0] = v95;
                if (v95)
                {
                  socklen_t v9 = v95;
                  APSLogErrorAt();
                  goto LABEL_237;
                }
              }
LABEL_177:
              OSStatus v96 = CMBlockBufferCreateWithMemoryBlock(v139, v25, v83, v138, 0, 0, *v39, 0, &blockBufferOut);
              if (!v96)
              {
                *((void *)v39 + 41) = aprscreen_ntpTimestamp();
                uint64_t v97 = CMBaseObjectGetDerivedStorage();
                CFDataRef v144 = 0;
                uint64_t v98 = *(void *)(v97 + 136);
                if (v98)
                {
                  uint64_t v99 = *(void *)(v97 + 88);
                  v141[0] = v43;
                  v141[1] = v99;
                  v141[2] = *(void *)(v97 + 32);
                  v141[3] = v97 + 96;
                  v141[4] = v97 + 304;
                  v141[5] = 0x400000010;
                  int v142 = *(_DWORD *)v97;
                  int v143 = *(_DWORD *)(v97 + 24);
                  v100 = (const void **)&v144;
                  if (!*(unsigned char *)(v97 + 705)) {
                    v100 = 0;
                  }
                  v101 = *(NSObject **)(v98 + 16);
                  *(void *)block = MEMORY[0x263EF8330];
                  uint64_t v146 = 3221225472;
                  v147 = __APReceiverStatsCollectorUpdateAndCopyFrameStats_block_invoke;
                  v148 = &__block_descriptor_56_e5_v8__0l;
                  uint64_t v149 = v98;
                  v150 = v141;
                  v151 = v100;
                  dispatch_sync(v101, block);
                  CFDataRef v102 = v144;
                }
                else
                {
                  CFDataRef v102 = 0;
                }
                uint64_t v103 = *((void *)v39 + 18);
                CMBlockBufferRef v104 = blockBufferOut;
                uint64_t v105 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v105) {
                  uint64_t v106 = v105;
                }
                else {
                  uint64_t v106 = 0;
                }
                v107 = *(uint64_t (**)(uint64_t, CMBlockBufferRef, uint64_t, const __CFData *, BOOL))(v106 + 24);
                if (v107)
                {
                  socklen_t v108 = v107(v103, v104, v43, v102, v84);
                  if (!v108)
                  {
                    uint64_t v109 = *((void *)v39 + 21);
                    if (v109)
                    {
                      if (v84 && *((unsigned char *)v39 + 176)) {
                        *((unsigned char *)v39 + 177) = 1;
                      }
                      if (*((unsigned char *)v39 + 177))
                      {
                        CMBlockBufferRef v110 = blockBufferOut;
                        uint64_t v111 = *(void *)(CMBaseObjectGetVTable() + 16);
                        uint64_t v112 = v111 ? v111 : 0;
                        v113 = *(void (**)(uint64_t, CMBlockBufferRef, uint64_t, const __CFData *, BOOL))(v112 + 24);
                        if (v113) {
                          v113(v109, v110, v43, v102, v84);
                        }
                      }
                    }
                    socklen_t v9 = 0;
                    v25 = 0;
                    ++*((void *)v39 + 42);
                    goto LABEL_205;
                  }
                  socklen_t v9 = v108;
                }
                else
                {
                  socklen_t v9 = -12782;
                }
                APSLogErrorAt();
                v25 = 0;
LABEL_196:
                if (gLogCategory_APReceiverScreenSession <= 90
                  && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
LABEL_205:
                if (blockBufferOut) {
                  CFRelease(blockBufferOut);
                }
                if (v102)
                {
                  CFDataRef v114 = v102;
                  goto LABEL_222;
                }
                goto LABEL_223;
              }
              socklen_t v9 = v96;
LABEL_242:
              APSLogErrorAt();
              CFDataRef v102 = 0;
              goto LABEL_196;
            case 1:
              v32 = (unsigned int *)CMBaseObjectGetDerivedStorage();
              *(void *)block = 0;
              uint64_t v33 = *((unsigned __int8 *)v32 + 5);
              unsigned int v34 = *((unsigned __int8 *)v32 + 6);
              *((unsigned char *)v32 + 706) = (v34 & 0x10) != 0;
              if (!*((void *)v32 + 36)) {
                *((void *)v32 + 36) = mach_absolute_time();
              }
              double v35 = *((float *)v32 + 4);
              double v36 = *((float *)v32 + 8);
              double v136 = *((float *)v32 + 9);
              double v137 = *((float *)v32 + 5);
              double v37 = *((float *)v32 + 10);
              double v38 = *((float *)v32 + 11);
              if (gLogCategory_APReceiverScreenSession <= 50
                && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              uint64_t v50 = *((void *)v32 + 18);
              if (v34) {
                uint64_t v51 = v134;
              }
              else {
                uint64_t v51 = v135;
              }
              uint64_t v52 = *(void *)(CMBaseObjectGetVTable() + 8);
              if (v52) {
                uint64_t v53 = v52;
              }
              else {
                uint64_t v53 = 0;
              }
              v54 = *(void (**)(uint64_t, __CFString *, uint64_t))(v53 + 56);
              if (v54) {
                v54(v50, @"StatsDisplayEnabled", v51);
              }
              size_t v55 = *v32;
              if (!v55) {
                goto LABEL_134;
              }
              if ((v34 >> 3))
              {
                OSStatus v60 = CMBlockBufferCreateWithMemoryBlock(v139, v25, v55, v138, 0, 0, v55, 0, (CMBlockBufferRef *)block);
                if (v60)
                {
                  socklen_t v9 = v60;
                  APSLogErrorAt();
                  goto LABEL_141;
                }
                uint64_t v61 = *((void *)v32 + 18);
                CFTypeRef v62 = *(CFTypeRef *)block;
                uint64_t v63 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v63) {
                  uint64_t v64 = v63;
                }
                else {
                  uint64_t v64 = 0;
                }
                v73 = *(uint64_t (**)(uint64_t, CFTypeRef, uint64_t, double, double, double, double, double, double))(v64 + 40);
                if (!v73)
                {
                  socklen_t v9 = -12782;
                  goto LABEL_140;
                }
                socklen_t v74 = v73(v61, v62, v33, v35, v137, v36, v136, v37, v38);
                if (v74)
                {
                  socklen_t v9 = v74;
LABEL_140:
                  APSLogErrorAt();
                  v25 = 0;
LABEL_141:
                  CFDataRef v56 = 0;
                  goto LABEL_150;
                }
                v25 = (void *)*((void *)v32 + 21);
                if (!v25)
                {
LABEL_134:
                  CFDataRef v56 = 0;
LABEL_135:
                  if ((v34 & 0x40) == 0) {
                    goto LABEL_217;
                  }
                  goto LABEL_136;
                }
                CFTypeRef v75 = *(CFTypeRef *)block;
                uint64_t v76 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v76) {
                  uint64_t v77 = v76;
                }
                else {
                  uint64_t v77 = 0;
                }
                v116 = *(void (**)(void *, CFTypeRef, uint64_t, double, double, double, double, double, double))(v77 + 40);
                if (v116) {
                  v116(v25, v75, v33, v35, v137, v36, v136, v37, v38);
                }
                CFDataRef v56 = 0;
              }
              else
              {
                CFDataRef v56 = CFDataCreateWithBytesNoCopy(v139, (const UInt8 *)v25, v55, v138);
                if (!v56)
                {
                  APSLogErrorAt();
                  socklen_t v9 = -72120;
                  goto LABEL_150;
                }
                uint64_t v57 = *((void *)v32 + 18);
                uint64_t v58 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v58) {
                  uint64_t v59 = v58;
                }
                else {
                  uint64_t v59 = 0;
                }
                v65 = *(uint64_t (**)(uint64_t, CFDataRef, uint64_t, double, double, double, double, double, double))(v59 + 32);
                if (!v65)
                {
                  socklen_t v9 = -12782;
LABEL_118:
                  APSLogErrorAt();
                  v25 = 0;
                  goto LABEL_150;
                }
                socklen_t v66 = v65(v57, v56, v33, v35, v137, v36, v136, v37, v38);
                if (v66)
                {
                  socklen_t v9 = v66;
                  goto LABEL_118;
                }
                v25 = (void *)*((void *)v32 + 21);
                if (!v25) {
                  goto LABEL_135;
                }
                uint64_t v67 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v67) {
                  uint64_t v68 = v67;
                }
                else {
                  uint64_t v68 = 0;
                }
                v115 = *(void (**)(void *, CFDataRef, uint64_t, double, double, double, double, double, double))(v68 + 32);
                if (v115) {
                  v115(v25, v56, v33, v35, v137, v36, v136, v37, v38);
                }
              }
              v25 = 0;
              *((unsigned char *)v32 + 176) = 1;
              if ((v34 & 0x40) == 0) {
                goto LABEL_217;
              }
LABEL_136:
              if (gLogCategory_APReceiverScreenSession <= 50
                && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              uint64_t v78 = *((void *)v32 + 18);
              uint64_t v79 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v79) {
                uint64_t v80 = v79;
              }
              else {
                uint64_t v80 = 0;
              }
              v81 = *(uint64_t (**)(uint64_t))(v80 + 48);
              if (!v81 || (v82 = v81(v78), v82 == -12782) || (socklen_t v9 = v82) == 0)
              {
LABEL_217:
                socklen_t v9 = 0;
                ++*((void *)v32 + 43);
                goto LABEL_218;
              }
              APSLogErrorAt();
LABEL_150:
              if (gLogCategory_APReceiverScreenSession <= 90
                && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
LABEL_218:
              if (*(void *)block) {
                CFRelease(*(CFTypeRef *)block);
              }
              if (v56)
              {
                CFDataRef v114 = v56;
LABEL_222:
                CFRelease(v114);
              }
LABEL_223:
              if (v25) {
                free(v25);
              }
LABEL_225:
              pthread_mutex_unlock(*(pthread_mutex_t **)(v26 + 208));
              if (v9)
              {
                APSLogErrorAt();
                v25 = 0;
                goto LABEL_259;
              }
LABEL_226:
              APTTrafficMetricsMessageProcessed();
              continue;
            case 2:
            case 5:
              block[0] = 0;
              uint64_t v27 = CMBaseObjectGetDerivedStorage();
              aprstats_logEnable(*(void *)(v27 + 136), (*(unsigned char *)(v27 + 5) & 2) != 0);
              *(unsigned char *)(v27 + 705) = *(unsigned char *)(v27 + 5) & 1;
              if (v25 && *(unsigned char *)(v27 + 4) == 5)
              {
                v28 = (const void *)*(float *)(v27 + 124);
                if (v28)
                {
                  CFDictionaryGetTypeID();
                  v28 = (const void *)CFCreateWithPlistBytes();
                  if (block[0]) {
                    goto LABEL_83;
                  }
                }
              }
              else
              {
                v28 = 0;
              }
              uint64_t v29 = *(void *)(v27 + 144);
              uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v30) {
                uint64_t v31 = v30;
              }
              else {
                uint64_t v31 = 0;
              }
              v44 = *(uint64_t (**)(uint64_t, const void *))(v31 + 56);
              if (!v44 || (socklen_t v45 = v44(v29, v28), v45 == -12782))
              {
                block[0] = 0;
                goto LABEL_77;
              }
              block[0] = v45;
              if (v45)
              {
LABEL_83:
                APSLogErrorAt();
                if (block[0]
                  && gLogCategory_APReceiverScreenSession <= 90
                  && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
              }
LABEL_77:
              if (v28) {
                CFRelease(v28);
              }
              if (v25) {
                free(v25);
              }
              socklen_t v9 = block[0];
              goto LABEL_225;
            case 4:
              goto LABEL_91;
            default:
              if (gLogCategory_APReceiverScreenSession <= 50
                && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
LABEL_91:
              if (v25) {
                free(v25);
              }
              pthread_mutex_unlock(*(pthread_mutex_t **)(v26 + 208));
              goto LABEL_226;
          }
        }
      }
      socklen_t v9 = v22;
    }
    else
    {
      socklen_t v9 = -12782;
    }
    APSLogErrorAt();
    goto LABEL_269;
  }
  socklen_t v9 = v5;
LABEL_268:
  APSLogErrorAt();
  Mutable = 0;
LABEL_269:
  aprscreen_captureStop();
  uint64_t v119 = *(void *)(DerivedStorage + 144);
  uint64_t v120 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v120) {
    uint64_t v121 = v120;
  }
  else {
    uint64_t v121 = 0;
  }
  v122 = *(void (**)(uint64_t))(v121 + 16);
  if (v122) {
    v122(v119);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v123 = CMBaseObjectGetDerivedStorage();
  v124 = *(pthread_mutex_t **)(v123 + 240);
  if (v124)
  {
    pthread_mutex_lock(v124);
    if (*(void *)(v123 + 232))
    {
      NetSocket_Delete();
      *(void *)(v123 + 232) = 0;
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(v123 + 240));
  }
  if (v9
    && gLogCategory_APReceiverScreenSession <= 90
    && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(void *)(DerivedStorage + 152))
  {
    CFMutableDictionaryRef v125 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    FigCFDictionarySetInt32();
    (*(void (**)(uint64_t, __CFString *, CFMutableDictionaryRef, void))(DerivedStorage + 152))(v2, @"SessionTerminated", v125, *(void *)(DerivedStorage + 160));
    CFRelease(v125);
  }
  v126 = *(const void **)(v1 + 40);
  if (v126) {
    CFRelease(v126);
  }
}

@end