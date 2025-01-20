@interface ParavirtualizedVideoDecoder
@end

@implementation ParavirtualizedVideoDecoder

uint64_t __ParavirtualizedVideoDecoder_CreateInstanceWithSpecification_block_invoke(uint64_t a1, OpaqueCMBlockBuffer *a2)
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  int v108 = 0;
  uint64_t MessageTypeAndFlagsAndGuestUUID = VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(a2, &v108, 0, 0);
  if (!MessageTypeAndFlagsAndGuestUUID)
  {
    uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      v5 = (const void *)v4;
      unint64_t v6 = v108;
      if (v108 > 1147565409)
      {
        if (v108 > 1148215904)
        {
          if (v108 != 1413772146)
          {
            if (v108 != 1413768557)
            {
              if (v108 == 1148215905)
              {
                VTVideoDecoderGetCMBaseObject(v4);
                DerivedStorage = (uint64_t **)CMBaseObjectGetDerivedStorage();
                cf[0] = 0;
                if (!VTParavirtualizationMessageCopyCFDictionary(a2, 745562721, cf)) {
                  VTDecoderSessionSetPixelBufferAttributes(*DerivedStorage, cf[0]);
                }
LABEL_62:
                CFTypeRef v44 = cf[0];
                if (!cf[0]) {
                  goto LABEL_185;
                }
                goto LABEL_184;
              }
              goto LABEL_82;
            }
            VTVideoDecoderGetCMBaseObject(v4);
            uint64_t v45 = CMBaseObjectGetDerivedStorage();
            cf[0] = 0;
            LODWORD(v115) = 0;
            LODWORD(IOSurface) = 0;
            CVPixelBufferRef pixelBuffer = 0;
            *(void *)v119 = 0;
            CFArrayRef theArray = 0;
            if (VTParavirtualizationMessageGetSInt64(a2, 745826668, cf)
              || (CFTypeRef v46 = cf[0], VTParavirtualizationMessageGetSInt32(a2, 744845938, &v115))
              || (uint64_t v47 = v115, VTParavirtualizationMessageGetUInt32(a2, 745107046, &IOSurface))|| (v48 = IOSurface, VTParavirtualizationMessageCopyCFUUID(a2, 745895273, (CFUUIDRef *)v119)))
            {
              v56 = 0;
              goto LABEL_107;
            }
            v49 = *(const void **)v119;
            if (*(void *)v119)
            {
              unsigned int v100 = v48;
              unsigned int v102 = v47;
              uint64_t v105 = v45;
              VTVideoDecoderGetCMBaseObject(v5);
              uint64_t v50 = CMBaseObjectGetDerivedStorage();
              SInt64 = (const void *)FigCFNumberCreateSInt64();
              v52 = (os_unfair_lock_s *)(v50 + 72);
              os_unfair_lock_lock((os_unfair_lock_t)(v50 + 72));
              CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v50 + 80), v49);
              if (Value)
              {
                CFDictionaryRef v54 = Value;
                v55 = CFDictionaryGetValue(Value, @"PixelBufferKey");
                v56 = v55;
                if (v55)
                {
                  CFRetain(v55);
                  CFArrayRef v57 = (const __CFArray *)CFDictionaryGetValue(v54, @"TilesUsingPixelBuffer");
                  if (v57)
                  {
                    CFArrayRef v58 = v57;
                    CFIndex Count = CFArrayGetCount(v57);
                    if (Count)
                    {
                      v129.length = Count;
                      v129.location = 0;
                      FirstIndexOfCFDictionaryRef Value = CFArrayGetFirstIndexOfValue(v58, v129, SInt64);
                      if (FirstIndexOfValue != -1) {
                        CFArrayRemoveValueAtIndex(v58, FirstIndexOfValue);
                      }
                      if (!CFArrayGetCount(v58)) {
                        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v50 + 80), v49);
                      }
                    }
                  }
                  int v61 = 0;
                }
                else
                {
                  int v61 = FigSignalErrorAt();
                }
              }
              else
              {
                int v61 = FigSignalErrorAt();
                v56 = 0;
              }
              uint64_t v45 = v105;
              uint64_t v47 = v102;
              os_unfair_lock_unlock(v52);
              if (SInt64) {
                CFRelease(SInt64);
              }
              uint64_t v48 = v100;
              if (v61)
              {
LABEL_107:
                if (*(void *)v119) {
                  CFRelease(*(CFTypeRef *)v119);
                }
                if (v56) {
                  CFRelease(v56);
                }
                if (pixelBuffer) {
                  CFRelease(pixelBuffer);
                }
                CFTypeRef v44 = theArray;
                if (!theArray) {
                  goto LABEL_185;
                }
                goto LABEL_184;
              }
            }
            else
            {
              v56 = 0;
            }
            VTTileDecoderSessionEmitDecodedTile(*(uint64_t **)(v45 + 8), (uint64_t)v46, v47, v48, (uint64_t)v56);
            if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, &pixelBuffer, &theArray)
              && !VTParavirtualizationMessageAppendSInt32())
            {
              VTParavirtualizationGuestSendMessageToHostAsync(pixelBuffer);
            }
            goto LABEL_107;
          }
          VTVideoDecoderGetCMBaseObject(v4);
          uint64_t v40 = CMBaseObjectGetDerivedStorage();
          cf[0] = 0;
          *(void *)v119 = 0;
          if (VTParavirtualizationMessageCopyCFDictionary(a2, 744710753, cf))
          {
            CFDictionaryRef v41 = 0;
          }
          else
          {
            CFDictionaryRef v41 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            if (v41)
            {
              MutableCopy = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
              v43 = MutableCopy;
              if (MutableCopy)
              {
                CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E4F24D20], v41);
                if (!VTParavirtualizationMessageCopyCFDictionary(a2, 745825394, v119)) {
                  VTTileDecoderSessionSetTileDecodeRequirements(*(uint64_t **)(v40 + 8), cf[0], *(const void **)v119);
                }
              }
              else
              {
                FigSignalErrorAt();
              }
              goto LABEL_50;
            }
            FigSignalErrorAt();
          }
          v43 = 0;
LABEL_50:
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          if (*(void *)v119) {
            CFRelease(*(CFTypeRef *)v119);
          }
          if (v41) {
            CFRelease(v41);
          }
          if (!v43) {
            goto LABEL_185;
          }
          CFTypeRef v44 = v43;
          goto LABEL_184;
        }
        if (v108 == 1147565410)
        {
          cf[0] = 0;
          if (!VTParavirtualizationMessageCopyCFUUIDArray(a2, 745892139, (__CFArray **)cf))
          {
            if (!cf[0])
            {
LABEL_185:
              CFRelease(v5);
              return MessageTypeAndFlagsAndGuestUUID;
            }
            if (CFArrayGetCount((CFArrayRef)cf[0]) >= 1) {
              paravirtualizedVideoDecoder_lookupRetainAndForgetPendingFramePixelBuffersByUUIDs((uint64_t)v5, (const __CFArray *)cf[0], 0);
            }
          }
          goto LABEL_62;
        }
        if (v108 != 1148021094)
        {
LABEL_82:
          LODWORD(pixelBuffer) = 0;
          LOBYTE(theArray) = 0;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v63 = pixelBuffer;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)theArray)) {
            unsigned int v64 = v63;
          }
          else {
            unsigned int v64 = v63 & 0xFFFFFFFE;
          }
          if (v64)
          {
            uint64_t v65 = MEMORY[0x1E4F14390];
            if ((v6 & 0x80000000) != 0) {
              int v66 = __maskrune(v6 >> 24, 0x40000uLL);
            }
            else {
              int v66 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * (v6 >> 24) + 60) & 0x40000;
            }
            if (v66) {
              int v70 = v6 >> 24;
            }
            else {
              int v70 = 46;
            }
            int v106 = v70;
            if (BYTE2(v6) > 0x7Fu) {
              int v71 = __maskrune(BYTE2(v6), 0x40000uLL);
            }
            else {
              int v71 = *(_DWORD *)(v65 + 4 * BYTE2(v6) + 60) & 0x40000;
            }
            if (v71) {
              int v72 = BYTE2(v6);
            }
            else {
              int v72 = 46;
            }
            uint64_t v73 = v65;
            if (BYTE1(v6) > 0x7Fu) {
              int v74 = __maskrune(BYTE1(v6), 0x40000uLL);
            }
            else {
              int v74 = *(_DWORD *)(v65 + 4 * BYTE1(v6) + 60) & 0x40000;
            }
            if (v74) {
              int v75 = BYTE1(v6);
            }
            else {
              int v75 = 46;
            }
            if (v6 > 0x7Fu) {
              int v76 = __maskrune(v6, 0x40000uLL);
            }
            else {
              int v76 = *(_DWORD *)(v73 + 4 * v6 + 60) & 0x40000;
            }
            *(void *)&v119[4] = "paravirtualizedVideoDecoder_HandleMessageFromHost";
            *(_DWORD *)v119 = 136316162;
            if (v76) {
              int v77 = v6;
            }
            else {
              int v77 = 46;
            }
            __int16 v120 = 1024;
            int v121 = v106;
            __int16 v122 = 1024;
            int v123 = v72;
            __int16 v124 = 1024;
            int v125 = v75;
            __int16 v126 = 1024;
            int v127 = v77;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          goto LABEL_185;
        }
        VTVideoDecoderGetCMBaseObject(v4);
        v26 = (uint64_t **)CMBaseObjectGetDerivedStorage();
        CFArrayRef theArray = 0;
        CVPixelBufferRef pixelBuffer = 0;
        CFArrayRef v115 = 0;
        *(void *)v116 = 0;
        v113 = 0;
        CFTypeRef IOSurface = 0;
        CFTypeRef v111 = 0;
        CFArrayRef v112 = 0;
        uint64_t v27 = VTParavirtualizationMessageGetSInt64(a2, 744911469, &pixelBuffer);
        if (v27)
        {
          uint64_t v91 = v27;
          uint64_t v31 = 0;
          CVPixelBufferRef v28 = 0;
        }
        else
        {
          CVPixelBufferRef v28 = pixelBuffer;
          uint64_t SInt32 = VTParavirtualizationMessageGetSInt32(a2, 744845938, &v116[4]);
          if (SInt32
            || (uint64_t v30 = *(unsigned int *)&v116[4],
                uint64_t SInt32 = VTParavirtualizationMessageGetUInt32(a2, 745107046, v116),
                SInt32))
          {
            uint64_t v91 = SInt32;
            uint64_t v31 = 0;
          }
          else
          {
            uint64_t v31 = *(unsigned int *)v116;
            uint64_t v32 = VTParavirtualizationMessageCopyCFUUIDArray(a2, 745892139, &theArray);
            if (!v32)
            {
              if (!theArray
                || CFArrayGetCount(theArray) < 1
                || (uint64_t v32 = paravirtualizedVideoDecoder_lookupRetainAndForgetPendingFramePixelBuffersByUUIDs((uint64_t)v5, theArray, &v115), !v32))
              {
                uint64_t v32 = VTParavirtualizationMessageCopyFigTagCollectionArray(a2, 745825067, &v112);
                if (!v32)
                {
                  if (v115) {
                    CFIndex v33 = CFArrayGetCount(v115);
                  }
                  else {
                    CFIndex v33 = 0;
                  }
                  CFIndex v68 = (CFIndex)v112;
                  if (v112) {
                    CFIndex v68 = CFArrayGetCount(v112);
                  }
                  if (v33 == v68)
                  {
                    if (!v115)
                    {
                      v69 = 0;
                      goto LABEL_134;
                    }
                    uint64_t v32 = MEMORY[0x199705780](*MEMORY[0x1E4F1CF80], v112, v115, &v111);
                    if (!v32)
                    {
                      v69 = (OpaqueCMTaggedBufferGroup *)v111;
LABEL_134:
                      VTDecoderSessionEmitDecodedMultiImageFrame(*v26, v28, v30, v31, v69);
                      if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, (CMBlockBufferRef *)&IOSurface, &v113)&& !VTParavirtualizationMessageAppendSInt32())
                      {
                        VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)IOSurface);
                      }
                      goto LABEL_137;
                    }
                  }
                  else
                  {
                    uint64_t v32 = FigSignalErrorAt();
                  }
                }
              }
            }
            uint64_t v91 = v32;
          }
        }
        unsigned int v110 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v92 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v93 = v110;
        if (os_log_type_enabled(v92, type)) {
          unsigned int v94 = v93;
        }
        else {
          unsigned int v94 = v93 & 0xFFFFFFFE;
        }
        if (v94)
        {
          *(_DWORD *)v119 = 136315394;
          *(void *)&v119[4] = "ParavirtualizedVideoDecoder_HandleDecoderSessionEmitDecodedMultiImageFrame";
          __int16 v120 = 1024;
          int v121 = v91;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        VTDecoderSessionEmitDecodedMultiImageFrame(*v26, v28, v91, v31, 0);
LABEL_137:
        if (v111) {
          CFRelease(v111);
        }
        if (v112) {
          CFRelease(v112);
        }
        if (v115) {
          CFRelease(v115);
        }
        if (theArray) {
          CFRelease(theArray);
        }
        if (IOSurface) {
          CFRelease(IOSurface);
        }
        CFTypeRef v44 = v113;
        if (!v113) {
          goto LABEL_185;
        }
        goto LABEL_184;
      }
      if (v108 <= 1147433056)
      {
        if (v108 == 1115252001)
        {
          VTVideoDecoderGetCMBaseObject(v4);
          uint64_t v34 = CMBaseObjectGetDerivedStorage();
          os_unfair_lock_lock((os_unfair_lock_t)(v34 + 56));
          CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v34 + 64));
          os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 56));
          VTVideoDecoderGetCMBaseObject(v5);
          uint64_t v35 = CMBaseObjectGetDerivedStorage();
          os_unfair_lock_lock((os_unfair_lock_t)(v35 + 72));
          CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v35 + 80));
          os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 72));
          VTVideoDecoderGetCMBaseObject(v5);
          uint64_t v36 = CMBaseObjectGetDerivedStorage();
          v37 = VTParavirtualizationCopyNotificationQueueForGuestUUID((CFUUIDBytes *)(v36 + 24));
          CMNotificationCenterGetDefaultLocalCenter();
          FigDispatchAsyncPostNotification();
          if (v37) {
            dispatch_release(v37);
          }
          goto LABEL_185;
        }
        if (v108 != 1147303270) {
          goto LABEL_82;
        }
        VTVideoDecoderGetCMBaseObject(v4);
        v8 = (uint64_t **)CMBaseObjectGetDerivedStorage();
        cf[0] = 0;
        CVPixelBufferRef pixelBuffer = 0;
        *(void *)v119 = 0;
        CFArrayRef theArray = 0;
        CFTypeRef IOSurface = 0;
        CFArrayRef v115 = 0;
        if (VTParavirtualizationMessageGetSInt64(a2, 744911469, cf)
          || (CFTypeRef v9 = cf[0], VTParavirtualizationMessageCopyCFDictionary(a2, 745566064, v119)))
        {
          CFUUIDRef v10 = 0;
        }
        else
        {
          VTDecoderSessionCreatePixelBufferWithOptions(*v8, v9, *(uint64_t *)v119, &pixelBuffer);
          if (pixelBuffer)
          {
            CFUUIDRef v10 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
            CVPixelBufferRef v11 = pixelBuffer;
            VTVideoDecoderGetCMBaseObject(v5);
            uint64_t v12 = CMBaseObjectGetDerivedStorage();
            os_unfair_lock_lock((os_unfair_lock_t)(v12 + 56));
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), v10, v11);
            CFDictionaryGetCount(*(CFDictionaryRef *)(v12 + 64));
            os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 56));
          }
          else
          {
            CFUUIDRef v10 = 0;
          }
          if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, &theArray, &v115)
            && !VTParavirtualizationMessageAppendSInt32()
            && (!v10 || !VTParavirtualizationMessageAppendCFUUID((uint64_t)v115, 745895273, v10)))
          {
            if (pixelBuffer) {
              CFTypeRef IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
            }
            VTParavirtualizationGuestSendMessageWithIOSurfacesToHostAsync(theArray);
          }
        }
        if (pixelBuffer) {
          CFRelease(pixelBuffer);
        }
        if (v10) {
          CFRelease(v10);
        }
        if (theArray) {
          CFRelease(theArray);
        }
        if (v115) {
          CFRelease(v115);
        }
        CFTypeRef v44 = *(CFTypeRef *)v119;
        if (!*(void *)v119) {
          goto LABEL_185;
        }
LABEL_184:
        CFRelease(v44);
        goto LABEL_185;
      }
      if (v108 == 1147433057)
      {
        VTVideoDecoderGetCMBaseObject(v4);
        v38 = (uint64_t *)CMBaseObjectGetDerivedStorage();
        cf[0] = 0;
        *(void *)v119 = 0;
        uint64_t DestinationPixelBufferAttributes = VTDecoderSessionGetDestinationPixelBufferAttributes(*v38);
        if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, (CMBlockBufferRef *)cf, v119)
          && (!DestinationPixelBufferAttributes
           || !VTParavirtualizationMessageAppendCFDictionary(*(void *)v119, 745562721, DestinationPixelBufferAttributes)))
        {
          VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)cf[0]);
        }
        goto LABEL_185;
      }
      if (v108 != 1147497844) {
        goto LABEL_82;
      }
      VTVideoDecoderGetCMBaseObject(v4);
      v13 = (uint64_t **)CMBaseObjectGetDerivedStorage();
      CFArrayRef theArray = 0;
      CVPixelBufferRef pixelBuffer = 0;
      LODWORD(v113) = 0;
      LODWORD(v112) = 0;
      CFTypeRef IOSurface = 0;
      CFArrayRef v115 = 0;
      LODWORD(v111) = 0;
      unsigned int v14 = VTParavirtualizationMessageGetSInt64(a2, 744911469, &pixelBuffer);
      if (v14)
      {
        unsigned int v103 = v14;
        v25 = 0;
        unsigned int v104 = 0;
        CVPixelBufferRef v90 = 0;
        goto LABEL_221;
      }
      CVPixelBufferRef v15 = pixelBuffer;
      unsigned int UInt32 = VTParavirtualizationMessageGetSInt32(a2, 744845938, &v113);
      if (UInt32
        || (v17 = v113, (unsigned int UInt32 = VTParavirtualizationMessageGetUInt32(a2, 745107046, &v112)) != 0))
      {
        CVPixelBufferRef v90 = v15;
        unsigned int v103 = UInt32;
        v25 = 0;
        unsigned int v104 = 0;
        goto LABEL_221;
      }
      uint64_t v18 = v112;
      unsigned int v19 = VTParavirtualizationMessageCopyCFUUID(a2, 745895273, &theArray);
      if (v19)
      {
        unsigned int v104 = v18;
        CVPixelBufferRef v90 = v15;
        unsigned int v103 = v19;
        v25 = 0;
        goto LABEL_221;
      }
      CFArrayRef v20 = theArray;
      if (theArray)
      {
        uint64_t v21 = v17;
        unsigned int v104 = v18;
        VTVideoDecoderGetCMBaseObject(v5);
        uint64_t v22 = CMBaseObjectGetDerivedStorage();
        v23 = (os_unfair_lock_s *)(v22 + 56);
        os_unfair_lock_lock((os_unfair_lock_t)(v22 + 56));
        v24 = (__CVBuffer *)CFDictionaryGetValue(*(CFDictionaryRef *)(v22 + 64), v20);
        v25 = v24;
        if (v24)
        {
          CFRetain(v24);
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v22 + 64), v20);
          os_unfair_lock_unlock(v23);
        }
        else
        {
          CVPixelBufferRef v90 = v15;
          unsigned int v95 = FigSignalErrorAt();
          os_unfair_lock_unlock(v23);
          unsigned int v103 = v95;
          if (v95) {
            goto LABEL_221;
          }
        }
        uint64_t v18 = v104;
        uint64_t v17 = v21;
      }
      else
      {
        v25 = 0;
      }
      unsigned int v67 = VTParavirtualizationMessageSetAttachmentsOnPixelBufferAndIOSurfaceIfPresent(a2, v25);
      if (!v67)
      {
        unsigned int v67 = VTParavirtualizationMessageGetSInt32(a2, 744909164, &v111);
        if (!v67)
        {
          if (v111)
          {
            if (v17)
            {
              paravirtualizedVideoDecoder_FillPixelBufferWithYCbCrColor(v25, 78, 124, 218);
            }
            else
            {
              CVPixelBufferGetIOSurface(v25);
              if (IOSurfaceGetProtectionOptions()) {
                goto LABEL_174;
              }
              unsigned int v107 = v18;
              v101 = v15;
              paravirtualizedVideoDecoder_FillPixelBufferWithYCbCrColor(v25, 69, 182, 90);
              CVPixelBufferLockBaseAddress(v25, 0);
              int v99 = (int)pixelBuffer;
              unint64_t v79 = (int)(CVPixelBufferGetWidth(v25) - 20) / 0xF0uLL;
              uint64_t v80 = 0;
              int v81 = (int)(CVPixelBufferGetHeight(v25) - 20) / 27;
              if (v81 >= (int)v79) {
                int v81 = v79;
              }
              if (v81 <= 1) {
                int v82 = 1;
              }
              else {
                int v82 = v81;
              }
              int v83 = -9 * v82;
              while (1)
              {
                int Height = CVPixelBufferGetHeight(v25);
                int v85 = Height >= 0 ? Height : Height + 1;
                int v86 = v83 + (v85 >> 1);
                int v87 = strlen(off_1E5785580[v80]);
                if (paravirtualizedVideoDecoder_DrawCharsToPixelBuffer(v25, 20, v86, v82, (uint64_t)off_1E5785580[v80], v87))break; {
                ++v80;
                }
                v83 += 9 * v82;
                if (v80 == 3)
                {
                  snprintf((char *)cf, 0x13uLL, "frameNumber: %5d", v99);
                  int v88 = strlen((const char *)cf);
                  int v89 = CVPixelBufferGetWidth(v25) - 6 * v82 * v88;
                  paravirtualizedVideoDecoder_DrawCharsToPixelBuffer(v25, v89 / 2, 36, v82, (uint64_t)cf, v88);
                  break;
                }
              }
              CVPixelBufferUnlockBaseAddress(v25, 0);
              CVPixelBufferRef v15 = v101;
              uint64_t v18 = v107;
              uint64_t v17 = 0;
            }
            CVBufferSetAttachment(v25, @"IsDRMSubstitute", (CFTypeRef)*MEMORY[0x1E4F1CFD0], kCVAttachmentMode_ShouldPropagate);
          }
LABEL_174:
          VTDecoderSessionEmitDecodedFrame(*v13, v15, v17, v18, v25);
          if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, &v115, &IOSurface)
            && !VTParavirtualizationMessageAppendSInt32())
          {
            VTParavirtualizationGuestSendMessageToHostAsync(v115);
          }
          if (v25) {
LABEL_178:
          }
            CFRelease(v25);
LABEL_179:
          if (theArray) {
            CFRelease(theArray);
          }
          if (v115) {
            CFRelease(v115);
          }
          CFTypeRef v44 = IOSurface;
          if (!IOSurface) {
            goto LABEL_185;
          }
          goto LABEL_184;
        }
      }
      unsigned int v104 = v18;
      CVPixelBufferRef v90 = v15;
      unsigned int v103 = v67;
LABEL_221:
      *(_DWORD *)&v116[4] = 0;
      v116[0] = OS_LOG_TYPE_DEFAULT;
      v96 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v97 = *(_DWORD *)&v116[4];
      if (os_log_type_enabled(v96, v116[0])) {
        unsigned int v98 = v97;
      }
      else {
        unsigned int v98 = v97 & 0xFFFFFFFE;
      }
      if (v98)
      {
        *(_DWORD *)v119 = 136315394;
        *(void *)&v119[4] = "ParavirtualizedVideoDecoder_HandleDecoderSessionEmitDecodedFrameMessage";
        __int16 v120 = 1024;
        int v121 = v103;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      VTDecoderSessionEmitDecodedFrame(*v13, v90, v103, v104, 0);
      if (v25) {
        goto LABEL_178;
      }
      goto LABEL_179;
    }
  }
  return MessageTypeAndFlagsAndGuestUUID;
}

@end