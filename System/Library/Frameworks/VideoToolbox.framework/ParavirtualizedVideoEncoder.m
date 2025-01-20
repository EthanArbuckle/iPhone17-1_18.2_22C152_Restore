@interface ParavirtualizedVideoEncoder
@end

@implementation ParavirtualizedVideoEncoder

uint64_t __ParavirtualizedVideoEncoder_CreateInstanceWithSpecification_block_invoke(uint64_t a1, OpaqueCMBlockBuffer *a2)
{
  v2 = a2;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  int v80 = 0;
  uint64_t MessageTypeAndFlagsAndGuestUUID = VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(a2, &v80, 0, 0);
  if (!MessageTypeAndFlagsAndGuestUUID)
  {
    uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      v5 = (const void *)v4;
      unint64_t v6 = v80;
      if (v80 <= 1413837681)
      {
        if (v80 <= 1165193330)
        {
          if (v80 <= 1164338290)
          {
            if (v80 == 1115252001)
            {
              uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
              os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 84));
              CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(DerivedStorage + 88));
              os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 84));
              uint64_t v36 = CMBaseObjectGetDerivedStorage();
              os_unfair_lock_lock((os_unfair_lock_t)(v36 + 96));
              CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v36 + 104));
              os_unfair_lock_unlock((os_unfair_lock_t)(v36 + 96));
              v37 = (CFUUIDBytes *)CMBaseObjectGetDerivedStorage();
              v38 = VTParavirtualizationCopyNotificationQueueForGuestUUID(v37 + 4);
              CMNotificationCenterGetDefaultLocalCenter();
              FigDispatchAsyncPostNotification();
              if (v38) {
                dispatch_release(v38);
              }
              goto LABEL_307;
            }
            if (v80 == 1164275060)
            {
              uint64_t v7 = CMBaseObjectGetDerivedStorage();
              LODWORD(v86) = 0;
              *(void *)&long long v94 = 0;
              uint64_t v81 = 0;
              cf[0] = 0;
              CFTypeRef v88 = 0;
              *(void *)v89 = 0;
              theArray[0] = 0;
              CFTypeRef v87 = 0;
              if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v86, 0))
              {
                v8 = *(OpaqueCMBlockBuffer **)(v7 + 48);
                if ((v86 & 0x10) != 0)
                {
                  if (!v8)
                  {
                    if (v2) {
                      CFTypeRef v74 = CFRetain(v2);
                    }
                    else {
                      CFTypeRef v74 = 0;
                    }
                    CFDictionaryRef v9 = 0;
                    *(void *)(v7 + 48) = v74;
                    goto LABEL_280;
                  }
                  CMBlockBufferAppendBufferReference(v8, v2, 0, 0, 0);
                }
                else if ((!v8 || !CMBlockBufferAppendBufferReference(v8, v2, 0, 0, 0)) {
                       && !VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v88, &v87))
                }
                {
                  CFDictionaryRef v9 = *(CFDictionaryRef *)(v7 + 48);
                  if (v9)
                  {
                    *(void *)(v7 + 48) = 0;
                    v2 = v9;
                  }
                  if (!VTParavirtualizationMessageGetSInt64(v2, 744911469, &v94))
                  {
                    v10 = (const void *)v94;
                    if (!VTParavirtualizationMessageGetSInt32(v2, 744845938, (_DWORD *)&v81 + 1))
                    {
                      uint64_t v11 = HIDWORD(v81);
                      if (!VTParavirtualizationMessageGetUInt32(v2, 744842860, &v81))
                      {
                        unsigned int v12 = v81;
                        if (!VTParavirtualizationMessageCopyCMSampleBuffer(v2, 745759334, *(_DWORD *)(v7 + 80), v7 + 112, 0, cf)&& !VTParavirtualizationMessageCopyCFUUIDArray(v2, 745892139, theArray)&& (!theArray[0]|| CFArrayGetCount(theArray[0]) < 1|| !paravirtualizedVideoEncoder_forgetPendingFramePixelBuffersByUUIDs((uint64_t)v5, 0, 1, theArray[0]))&& !VTParavirtualizationMessageCopyCFUUID(v2, 745895273, (CFUUIDRef *)v89)&& (!*(void *)v89|| !paravirtualizedVideoEncoder_forgetPendingFramePixelBufferByUUID((uint64_t)v5, 0,
                                               1,
                                               *(const void **)v89)))
                        {
                          VTEncoderSessionEmitEncodedFrame(*(uint64_t **)v7, v10, v11, v12, (opaqueCMSampleBuffer *)cf[0]);
                          if (!VTParavirtualizationMessageAppendSInt32()) {
                            VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v88);
                          }
                        }
                      }
                    }
                  }
LABEL_280:
                  if (cf[0]) {
                    CFRelease(cf[0]);
                  }
                  if (*(void *)v89) {
                    CFRelease(*(CFTypeRef *)v89);
                  }
                  if (theArray[0]) {
                    CFRelease(theArray[0]);
                  }
                  if (v88) {
                    CFRelease(v88);
                  }
                  CFTypeRef v44 = v87;
                  if (!v87) {
                    goto LABEL_304;
                  }
                  goto LABEL_303;
                }
              }
              CFDictionaryRef v9 = 0;
              goto LABEL_280;
            }
LABEL_203:
            LODWORD(theArray[0]) = 0;
            LOBYTE(cf[0]) = 0;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v61 = theArray[0];
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)cf[0])) {
              unsigned int v62 = v61;
            }
            else {
              unsigned int v62 = v61 & 0xFFFFFFFE;
            }
            if (v62)
            {
              uint64_t v63 = MEMORY[0x1E4F14390];
              if ((v6 & 0x80000000) != 0) {
                int v64 = __maskrune(v6 >> 24, 0x40000uLL);
              }
              else {
                int v64 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * (v6 >> 24) + 60) & 0x40000;
              }
              if (v64) {
                int v66 = v6 >> 24;
              }
              else {
                int v66 = 46;
              }
              int v79 = v66;
              if (BYTE2(v6) > 0x7Fu) {
                int v67 = __maskrune(BYTE2(v6), 0x40000uLL);
              }
              else {
                int v67 = *(_DWORD *)(v63 + 4 * BYTE2(v6) + 60) & 0x40000;
              }
              if (v67) {
                int v68 = BYTE2(v6);
              }
              else {
                int v68 = 46;
              }
              uint64_t v69 = v63;
              if (BYTE1(v6) > 0x7Fu) {
                int v70 = __maskrune(BYTE1(v6), 0x40000uLL);
              }
              else {
                int v70 = *(_DWORD *)(v63 + 4 * BYTE1(v6) + 60) & 0x40000;
              }
              if (v70) {
                int v71 = BYTE1(v6);
              }
              else {
                int v71 = 46;
              }
              if (v6 > 0x7Fu) {
                int v72 = __maskrune(v6, 0x40000uLL);
              }
              else {
                int v72 = *(_DWORD *)(v69 + 4 * v6 + 60) & 0x40000;
              }
              *(void *)&v89[4] = "paravirtualizedVideoEncoder_HandleMessageFromHost";
              *(_DWORD *)v89 = 136316162;
              if (v72) {
                int v73 = v6;
              }
              else {
                int v73 = 46;
              }
              *(_WORD *)&v89[12] = 1024;
              *(_DWORD *)&v89[14] = v79;
              *(_WORD *)&v89[18] = 1024;
              *(_DWORD *)&v89[20] = v68;
              __int16 v90 = 1024;
              int v91 = v71;
              __int16 v92 = 1024;
              int v93 = v73;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            goto LABEL_307;
          }
          if (v80 != 1164338291)
          {
            if (v80 != 1164993121) {
              goto LABEL_203;
            }
            LODWORD(cf[0]) = 0;
            uint64_t v20 = CMBaseObjectGetDerivedStorage();
            *(void *)&long long v94 = 0;
            *(void *)v89 = 0;
            theArray[0] = 0;
            if (VTParavirtualizationMessageCopyCFDictionary(v2, 745562721, &v94))
            {
              v23 = 0;
              CFDictionaryRef v21 = 0;
              goto LABEL_223;
            }
            CFDictionaryRef v21 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            if (v21)
            {
              MutableCopy = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
              v23 = MutableCopy;
              if (!MutableCopy)
              {
                FigSignalErrorAt();
                goto LABEL_223;
              }
              CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E4F24D20], v21);
              int v24 = VTEncoderSessionSetPixelBufferAttributes(*(uint64_t **)v20, v23);
              if (VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, cf, 0))
              {
LABEL_223:
                if ((void)v94) {
                  CFRelease((CFTypeRef)v94);
                }
                if (v23) {
                  CFRelease(v23);
                }
                if (!v21)
                {
LABEL_236:
                  if (*(void *)v89) {
                    CFRelease(*(CFTypeRef *)v89);
                  }
                  CFArrayRef v27 = theArray[0];
                  if (!theArray[0]) {
                    goto LABEL_307;
                  }
                  goto LABEL_306;
                }
                CFDictionaryRef v65 = v21;
LABEL_235:
                CFRelease(v65);
                goto LABEL_236;
              }
              if (((uint64_t)cf[0] & 2) != 0)
              {
                if (VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)v89, theArray)|| VTParavirtualizationMessageAppendSInt32()|| VTParavirtualizationGuestSendMessageToHostAsync(*(OpaqueCMBlockBuffer **)v89))
                {
                  goto LABEL_223;
                }
              }
              else if (v24)
              {
                goto LABEL_223;
              }
              *(void *)(v20 + 24) = v23;
            }
            else
            {
              FigSignalErrorAt();
            }
            v23 = 0;
            goto LABEL_223;
          }
          v49 = (uint64_t **)CMBaseObjectGetDerivedStorage();
          *(void *)&long long v94 = 0;
          *(void *)v89 = 0;
          theArray[0] = 0;
          LODWORD(v88) = 0;
          LODWORD(v87) = 0;
          LODWORD(v86) = 0;
          cf[0] = 0;
          if (VTParavirtualizationMessageGetSInt32(v2, 744714084, &v88)
            || VTParavirtualizationMessageGetSInt32(v2, 746022004, &v87)
            || VTParavirtualizationMessageGetSInt32(v2, 745039732, &v86)
            || VTParavirtualizationMessageCopyCFDictionary(v2, 744847476, cf))
          {
            goto LABEL_159;
          }
          VTEncoderSessionCreateVideoFormatDescription(*v49, (CMVideoCodecType)v88, v87, (int)v86, (const __CFDictionary *)cf[0], theArray);
          goto LABEL_155;
        }
        if (v80 <= 1413834092)
        {
          if (v80 != 1165193331)
          {
            if (v80 != 1413833572) {
              goto LABEL_203;
            }
            uint64_t v16 = CMBaseObjectGetDerivedStorage();
            *(void *)&long long v94 = 0;
            *(void *)v89 = 0;
            theArray[0] = 0;
            LODWORD(v88) = 0;
            LODWORD(v87) = 0;
            LODWORD(v86) = 0;
            cf[0] = 0;
            if (VTParavirtualizationMessageGetSInt32(v2, 744714084, &v88)
              || VTParavirtualizationMessageGetSInt32(v2, 746022004, &v87)
              || VTParavirtualizationMessageGetSInt32(v2, 745039732, &v86)
              || VTParavirtualizationMessageCopyCFDictionary(v2, 744847476, cf))
            {
              goto LABEL_159;
            }
            VTTileEncoderSessionCreateVideoFormatDescription(*(unsigned char ***)(v16 + 8), (CMVideoCodecType)v88, (int32_t)v87, (int32_t)v86, (const __CFDictionary *)cf[0], theArray);
LABEL_155:
            if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v94, v89)
              && !VTParavirtualizationMessageAppendSInt32()
              && !VTParavirtualizationMessageAppendCMFormatDescription(*(uint64_t *)v89, 1030120563, theArray[0]))
            {
              VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v94);
            }
LABEL_159:
            if (cf[0]) {
              CFRelease(cf[0]);
            }
            if (theArray[0]) {
              CFRelease(theArray[0]);
            }
            goto LABEL_163;
          }
          v45 = (uint64_t **)CMBaseObjectGetDerivedStorage();
          *(void *)&long long v94 = 0;
          *(void *)v89 = 0;
          theArray[0] = 0;
          if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v94, v89)
            && !VTParavirtualizationMessageCopyCFData(v2, 745828964, theArray))
          {
            if (theArray[0])
            {
              unint64_t v46 = CFDataGetLength(theArray[0]) / 0x30uLL;
              BytePtr = (UInt8 *)CFDataGetBytePtr(theArray[0]);
            }
            else
            {
              unint64_t v46 = 0;
              BytePtr = 0;
            }
            VTEncoderSessionSetTimeRangesForNextPass(*v45, v46, BytePtr);
LABEL_232:
            if (!VTParavirtualizationMessageAppendSInt32()) {
              VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v94);
            }
            goto LABEL_234;
          }
          goto LABEL_234;
        }
        if (v80 != 1413834093)
        {
          if (v80 == 1413837665)
          {
            LODWORD(v88) = 0;
            uint64_t v28 = CMBaseObjectGetDerivedStorage();
            *(void *)&long long v94 = 0;
            *(void *)v89 = 0;
            theArray[0] = 0;
            cf[0] = 0;
            if (VTParavirtualizationMessageCopyCFDictionary(v2, 745562721, &v94))
            {
              v31 = 0;
              CFDictionaryRef v29 = 0;
            }
            else
            {
              CFDictionaryRef v29 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              if (v29)
              {
                v30 = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
                v31 = v30;
                if (v30)
                {
                  CFDictionaryAddValue(v30, (const void *)*MEMORY[0x1E4F24D20], v29);
                  if (!VTParavirtualizationMessageGetVTInt32Size(v2, 745830248, (int8x8_t *)v89))
                  {
                    VTTileEncoderSessionSetTileAttributes(*(uint64_t **)(v28 + 8), *(uint64_t *)v89, (uint64_t)v31);
                    if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v88, 0)&& (v88 & 2) != 0&& !VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf)&& !VTParavirtualizationMessageAppendSInt32())
                    {
                      VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]);
                    }
                  }
                }
                else
                {
                  FigSignalErrorAt();
                }
              }
              else
              {
                FigSignalErrorAt();
                v31 = 0;
              }
            }
            if ((void)v94) {
              CFRelease((CFTypeRef)v94);
            }
            if (v31) {
              CFRelease(v31);
            }
            if (v29) {
              CFRelease(v29);
            }
            if (theArray[0]) {
              CFRelease(theArray[0]);
            }
            CFArrayRef v27 = (CFArrayRef)cf[0];
            if (!cf[0]) {
              goto LABEL_307;
            }
            goto LABEL_306;
          }
          goto LABEL_203;
        }
        uint64_t v53 = CMBaseObjectGetDerivedStorage();
        LODWORD(v87) = 0;
        *(void *)&long long v94 = 0;
        LODWORD(v86) = 0;
        HIDWORD(v81) = 0;
        CFTypeRef v88 = 0;
        *(void *)v89 = 0;
        theArray[0] = 0;
        cf[0] = 0;
        if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v87, 0))
        {
          v54 = *(OpaqueCMBlockBuffer **)(v53 + 56);
          if ((v87 & 0x10) != 0)
          {
            if (!v54)
            {
              if (v2) {
                CFTypeRef v76 = CFRetain(v2);
              }
              else {
                CFTypeRef v76 = 0;
              }
              CFDictionaryRef v9 = 0;
              *(void *)(v53 + 56) = v76;
              goto LABEL_296;
            }
            CMBlockBufferAppendBufferReference(v54, v2, 0, 0, 0);
          }
          else if ((!v54 || !CMBlockBufferAppendBufferReference(v54, v2, 0, 0, 0)) {
                 && !VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)cf, &v88))
          }
          {
            CFDictionaryRef v9 = *(CFDictionaryRef *)(v53 + 56);
            if (v9)
            {
              *(void *)(v53 + 56) = 0;
              v2 = v9;
            }
            if (!VTParavirtualizationMessageGetSInt64(v2, 745826668, &v94))
            {
              uint64_t v55 = v94;
              if (!VTParavirtualizationMessageGetSInt32(v2, 744845938, &v86))
              {
                uint64_t v56 = v86;
                if (!VTParavirtualizationMessageGetUInt32(v2, 744842860, (_DWORD *)&v81 + 1))
                {
                  uint64_t v57 = HIDWORD(v81);
                  if (!VTParavirtualizationMessageCopyCFUUID(v2, 745895273, (CFUUIDRef *)v89)
                    && !VTParavirtualizationMessageCopyCMSampleBuffer(v2, 745759334, *(_DWORD *)(v53 + 80), v53 + 112, 0, (CFTypeRef *)theArray))
                  {
                    if (theArray[0])
                    {
                      if (!paravirtualizedVideoEncoder_lookupRetainAndForgetPendingTilePixelBufferByUUID((uint64_t)v5, v55, 0, 1, *(const void **)v89))
                      {
                        VTEncoderSessionEmitEncodedTile(*(uint64_t **)(v53 + 8), v55, v56, v57, (uint64_t)theArray[0]);
                        if (!VTParavirtualizationMessageAppendSInt32()) {
                          VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)cf[0]);
                        }
                      }
                    }
                    else
                    {
                      FigSignalErrorAt();
                    }
                  }
                }
              }
            }
LABEL_296:
            if (theArray[0]) {
              CFRelease(theArray[0]);
            }
            CFArrayRef v77 = *(CFArrayRef *)v89;
            if (*(void *)v89) {
              goto LABEL_299;
            }
            goto LABEL_300;
          }
        }
        CFDictionaryRef v9 = 0;
        goto LABEL_296;
      }
      if (v80 <= 1836083565)
      {
        if (v80 > 1836082291)
        {
          if (v80 == 1836082292)
          {
            uint64_t v50 = CMBaseObjectGetDerivedStorage();
            CFTypeRef v87 = 0;
            CFTypeRef v88 = 0;
            long long v94 = *MEMORY[0x1E4F1FA48];
            uint64_t v95 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            uint64_t v85 = v95;
            CFTypeRef v86 = 0;
            *(_OWORD *)v89 = v94;
            *(void *)&v89[16] = v95;
            *(_OWORD *)theArray = v94;
            if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v88, &v87)
              && !VTParavirtualizationMessageGetCMTime(v2, 744911987, (int8x8_t *)&v94)
              && !VTParavirtualizationMessageCopyCFPropertyList(v2, 745369715, &v86))
            {
              if (v86 && (CFTypeID v51 = CFGetTypeID(v86), v51 == CFStringGetTypeID()))
              {
                uint64_t v52 = *(void *)(v50 + 120);
                *(_OWORD *)cf = v94;
                uint64_t v83 = v95;
                VTMultiPassStorageGetTimeStampAndDuration(v52, (uint64_t)cf, v86, (uint64_t)v89, (uint64_t)theArray);
                *(_OWORD *)cf = *(_OWORD *)v89;
                uint64_t v83 = *(void *)&v89[16];
                if (!VTParavirtualizationMessageAppendCMTime())
                {
                  *(_OWORD *)cf = *(_OWORD *)theArray;
                  uint64_t v83 = v85;
                  if (!VTParavirtualizationMessageAppendCMTime()
                    && !VTParavirtualizationMessageAppendSInt32())
                  {
                    VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v88);
                  }
                }
              }
              else
              {
                FigSignalErrorAt();
              }
            }
            if (v88) {
              CFRelease(v88);
            }
            if (v87) {
              CFRelease(v87);
            }
            CFArrayRef v27 = (CFArrayRef)v86;
            if (!v86) {
              goto LABEL_307;
            }
            goto LABEL_306;
          }
          if (v80 == 1836083556)
          {
            uint64_t v25 = CMBaseObjectGetDerivedStorage();
            *(void *)&long long v94 = 0;
            *(void *)v89 = 0;
            if (VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v94, v89))
            {
              CFStringRef v26 = 0;
            }
            else
            {
              CFStringRef v26 = VTMultiPassStorageCopyIdentifier(*(void *)(v25 + 120));
              if (!VTParavirtualizationMessageAppendCFPropertyList()) {
                VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v94);
              }
            }
            if ((void)v94) {
              CFRelease((CFTypeRef)v94);
            }
            if (*(void *)v89) {
              CFRelease(*(CFTypeRef *)v89);
            }
            if (!v26) {
              goto LABEL_307;
            }
            CFArrayRef v27 = (CFArrayRef)v26;
            goto LABEL_306;
          }
          goto LABEL_203;
        }
        if (v80 != 1413837682)
        {
          if (v80 != 1836082020) {
            goto LABEL_203;
          }
          uint64_t v13 = CMBaseObjectGetDerivedStorage();
          theArray[0] = 0;
          cf[0] = 0;
          long long v94 = *MEMORY[0x1E4F1FA48];
          uint64_t v95 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          LODWORD(v87) = 0;
          CFTypeRef v88 = 0;
          if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf)
            && !VTParavirtualizationMessageGetCMTime(v2, 745829232, (int8x8_t *)&v94)
            && !VTParavirtualizationMessageGetSInt32(v2, 745107044, &v87))
          {
            uint64_t v14 = *(void *)(v13 + 120);
            *(_OWORD *)v89 = v94;
            *(void *)&v89[16] = v95;
            VTMultiPassStorageCopyDataAtTimeStamp(v14, (long long *)v89, (int)v87, (__CFData **)&v88);
            if (!VTParavirtualizationMessageAppendSInt32())
            {
              if (v88)
              {
                LOBYTE(v86) = 0;
                if (VTParavirtualizationMessageCFDataRequiresFragmentation((uint64_t)cf[0], 0x4000uLL, (const __CFData *)v88, (BOOL *)&v86))goto LABEL_266; {
                if ((_BYTE)v86)
                }
                {
                  *(void *)v89 = 0;
                  do
                  {
                    if (VTParavirtualizationMessageAppendCFDataWithLimitFromOffset((uint64_t)cf[0], 745369700, 0x4000uLL, (CFDataRef)v88, (CFIndex *)v89))break; {
                    unint64_t v15 = *(void *)v89;
                    }
                    if (v15 >= CFDataGetLength((CFDataRef)v88)) {
                      goto LABEL_265;
                    }
                    if (VTParavirtualizationMessageChangeMessageFlags(theArray[0], 16, 16)
                      || VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]))
                    {
                      break;
                    }
                    if (theArray[0])
                    {
                      CFRelease(theArray[0]);
                      theArray[0] = 0;
                    }
                    if (cf[0])
                    {
                      CFRelease(cf[0]);
                      cf[0] = 0;
                    }
                  }
                  while (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf));
                  goto LABEL_266;
                }
                if (VTParavirtualizationMessageAppendCFData((uint64_t)cf[0], 745369700, (const __CFData *)v88))goto LABEL_266; {
              }
                }
LABEL_265:
              VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]);
            }
          }
LABEL_266:
          if (theArray[0]) {
            CFRelease(theArray[0]);
          }
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          CFArrayRef v27 = (CFArrayRef)v88;
          if (!v88) {
            goto LABEL_307;
          }
          goto LABEL_306;
        }
        uint64_t v39 = CMBaseObjectGetDerivedStorage();
        *(void *)&long long v94 = 0;
        *(void *)v89 = 0;
        if (VTParavirtualizationMessageCopyCFDictionary(v2, 744710753, &v94))
        {
          CFDictionaryRef v9 = 0;
        }
        else
        {
          CFDictionaryRef v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          if (v9)
          {
            v40 = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
            uint64_t v41 = (uint64_t)v40;
            if (v40)
            {
              CFDictionaryAddValue(v40, (const void *)*MEMORY[0x1E4F24D20], v9);
              int v42 = VTParavirtualizationMessageCopyCFDictionary(v2, 745825650, v89);
              v43 = *(const void **)v89;
              if (!v42)
              {
                VTTileEncoderSessionSetTileEncodeRequirements(*(uint64_t **)(v39 + 8), v41, *(uint64_t *)v89);
                v43 = *(const void **)v89;
              }
              if (v43) {
                CFRelease(v43);
              }
            }
            else
            {
              FigSignalErrorAt();
            }
            goto LABEL_139;
          }
          FigSignalErrorAt();
        }
        uint64_t v41 = 0;
LABEL_139:
        if ((void)v94) {
          CFRelease((CFTypeRef)v94);
        }
        if (!v41) {
          goto LABEL_304;
        }
        CFTypeRef v44 = (CFTypeRef)v41;
LABEL_303:
        CFRelease(v44);
LABEL_304:
        if (!v9)
        {
LABEL_307:
          CFRelease(v5);
          return MessageTypeAndFlagsAndGuestUUID;
        }
        CFArrayRef v27 = v9;
LABEL_306:
        CFRelease(v27);
        goto LABEL_307;
      }
      if (v80 > 1836086120)
      {
        if (v80 != 1836086121)
        {
          if (v80 == 1836086132)
          {
            uint64_t v32 = CMBaseObjectGetDerivedStorage();
            cf[0] = 0;
            CFTypeRef v88 = 0;
            long long v94 = *MEMORY[0x1E4F1FA48];
            uint64_t v95 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            CFTypeRef v87 = 0;
            *(_OWORD *)v89 = v94;
            *(void *)&v89[16] = v95;
            if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)cf, &v88)
              && !VTParavirtualizationMessageGetCMTime(v2, 744911987, (int8x8_t *)&v94)
              && !VTParavirtualizationMessageCopyCFPropertyList(v2, 745369715, &v87))
            {
              if (v87 && (CFTypeID v33 = CFGetTypeID(v87), v33 == CFStringGetTypeID()))
              {
                uint64_t v34 = *(void *)(v32 + 120);
                *(_OWORD *)theArray = v94;
                uint64_t v85 = v95;
                VTMultiPassStorageGetTimeStamp(v34, (long long *)theArray, v87, (uint64_t)v89);
                *(_OWORD *)theArray = *(_OWORD *)v89;
                uint64_t v85 = *(void *)&v89[16];
                if (!VTParavirtualizationMessageAppendCMTime()
                  && !VTParavirtualizationMessageAppendSInt32())
                {
                  VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)cf[0]);
                }
              }
              else
              {
                FigSignalErrorAt();
              }
            }
            if (cf[0]) {
              CFRelease(cf[0]);
            }
            if (v88) {
              CFRelease(v88);
            }
            CFArrayRef v27 = (CFArrayRef)v87;
            if (!v87) {
              goto LABEL_307;
            }
            goto LABEL_306;
          }
          goto LABEL_203;
        }
        uint64_t v58 = CMBaseObjectGetDerivedStorage();
        *(void *)&long long v94 = 0;
        *(void *)v89 = 0;
        theArray[0] = 0;
        if (!VTParavirtualizationMessageCopyCFPropertyList(v2, 745957732, (CFTypeRef *)theArray))
        {
          if (!theArray[0] || (CFTypeID v59 = CFGetTypeID(theArray[0]), v59 != CFStringGetTypeID()))
          {
            FigSignalErrorAt();
            goto LABEL_234;
          }
          VTMultiPassStorageSetIdentifier(*(void *)(v58 + 120), theArray[0]);
          if (VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v94, v89)) {
            goto LABEL_234;
          }
          goto LABEL_232;
        }
LABEL_234:
        CFDictionaryRef v65 = (CFDictionaryRef)v94;
        if (!(void)v94) {
          goto LABEL_236;
        }
        goto LABEL_235;
      }
      if (v80 == 1836083566)
      {
        uint64_t v48 = CMBaseObjectGetDerivedStorage();
        *(void *)&long long v94 = 0;
        *(void *)v89 = 0;
        if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v94, v89))
        {
          VTMultiPassStorageInvalidate(*(void *)(v48 + 120));
          if (!VTParavirtualizationMessageAppendSInt32()) {
            VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v94);
          }
        }
LABEL_163:
        if ((void)v94) {
          CFRelease((CFTypeRef)v94);
        }
        CFArrayRef v27 = *(CFArrayRef *)v89;
        if (!*(void *)v89) {
          goto LABEL_307;
        }
        goto LABEL_306;
      }
      if (v80 != 1836086116) {
        goto LABEL_203;
      }
      uint64_t v17 = CMBaseObjectGetDerivedStorage();
      theArray[0] = 0;
      cf[0] = 0;
      long long v94 = *MEMORY[0x1E4F1FA48];
      uint64_t v95 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      LODWORD(v87) = 0;
      CFTypeRef v88 = 0;
      LODWORD(v86) = 0;
      if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v86, 0))
      {
        v18 = *(OpaqueCMBlockBuffer **)(v17 + 128);
        if ((v86 & 0x10) != 0)
        {
          if (!v18)
          {
            if (v2) {
              CFTypeRef v75 = CFRetain(v2);
            }
            else {
              CFTypeRef v75 = 0;
            }
            CFDictionaryRef v9 = 0;
            *(void *)(v17 + 128) = v75;
            goto LABEL_292;
          }
          CMBlockBufferAppendBufferReference(v18, v2, 0, 0, 0);
        }
        else if ((!v18 || !CMBlockBufferAppendBufferReference(v18, v2, 0, 0, 0)) {
               && !VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf))
        }
        {
          CFDictionaryRef v9 = *(CFDictionaryRef *)(v17 + 128);
          if (v9)
          {
            *(void *)(v17 + 128) = 0;
            v2 = v9;
          }
          if (!VTParavirtualizationMessageGetCMTime(v2, 745829232, (int8x8_t *)&v94)
            && !VTParavirtualizationMessageGetSInt32(v2, 745107044, &v87)
            && !VTParavirtualizationMessageCopyCFData(v2, 745369700, (__CFData **)&v88))
          {
            uint64_t v19 = *(void *)(v17 + 120);
            *(_OWORD *)v89 = v94;
            *(void *)&v89[16] = v95;
            VTMultiPassStorageSetDataAtTimeStamp(v19, (long long *)v89, (int)v87, (CFDataRef)v88);
            if (!VTParavirtualizationMessageAppendSInt32()) {
              VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]);
            }
          }
LABEL_292:
          CFArrayRef v77 = theArray[0];
          if (theArray[0]) {
LABEL_299:
          }
            CFRelease(v77);
LABEL_300:
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          CFTypeRef v44 = v88;
          if (!v88) {
            goto LABEL_304;
          }
          goto LABEL_303;
        }
      }
      CFDictionaryRef v9 = 0;
      goto LABEL_292;
    }
  }
  return MessageTypeAndFlagsAndGuestUUID;
}

@end