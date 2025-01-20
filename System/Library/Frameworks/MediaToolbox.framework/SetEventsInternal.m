@interface SetEventsInternal
@end

@implementation SetEventsInternal

void __fpic_SetEventsInternal_block_invoke(void *a1)
{
  v1 = a1;
  CFArrayRef v2 = (const __CFArray *)a1[12];
  uint64_t v3 = a1[13];
  uint64_t v4 = a1[14];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v2) {
    uint64_t Count = CFArrayGetCount(v2);
  }
  else {
    uint64_t Count = 0;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (!Mutable)
  {
    int v21 = FigSignalErrorAt();
    CFDictionaryRef v9 = 0;
    goto LABEL_18;
  }
  CFDictionaryRef v9 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v9)
  {
    int v21 = FigSignalErrorAt();
    CFRelease(Mutable);
    CFMutableArrayRef Mutable = 0;
    goto LABEL_18;
  }
  v50.location = 0;
  v50.length = Count;
  CFArrayAppendArray(Mutable, v2, v50);
  if (Count < 1)
  {
    int v21 = 0;
    goto LABEL_18;
  }
  CFAllocatorRef allocator = v7;
  theArray = Mutable;
  v45 = v1;
  v10 = (uint64_t (**)(uint64_t, uint64_t, const void *))(DerivedStorage + 80);
  uint64_t v11 = Count + 1;
  theDict = v9;
  uint64_t v46 = v3;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, v11 - 2);
    uint64_t v13 = (*v10)(v3, v4, ValueAtIndex);
    v14 = (__CFString *)FigPlayerInterstitialEventCopyPrimaryItem(v13);
    if (!v14)
    {
      int v21 = FigSignalErrorAt();
      goto LABEL_63;
    }
    v15 = v14;
    if (!fpic_doesPlayerItemWrapperBelongToCurrentlyEngagedPrimaryItem(v3, v14, v4)) {
      break;
    }
LABEL_15:
    CFRelease(v15);
    if ((unint64_t)--v11 <= 1)
    {
      int v21 = 0;
      v1 = v45;
      CFMutableArrayRef Mutable = theArray;
      goto LABEL_18;
    }
  }
  if (CFDictionaryContainsKey(v9, v15))
  {
LABEL_13:
    Value = (__CFArray *)CFDictionaryGetValue(v9, v15);
    CFArrayInsertValueAtIndex(Value, 0, ValueAtIndex);
    CFArrayRemoveValueAtIndex(theArray, v11 - 2);
    if (dword_1E9351550)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CFDictionaryRef v9 = theDict;
    }
    goto LABEL_15;
  }
  CFMutableArrayRef v16 = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E4F1D510]);
  if (v16)
  {
    CFMutableArrayRef v17 = v16;
    CFDictionaryAddValue(theDict, v15, v16);
    CFMutableArrayRef v18 = v17;
    CFDictionaryRef v9 = theDict;
    uint64_t v3 = v46;
    CFRelease(v18);
    goto LABEL_13;
  }
  int v21 = FigSignalErrorAt();
  CFRelease(v15);
  CFDictionaryRef v9 = theDict;
LABEL_63:
  CFRelease(theArray);
  CFRelease(v9);
  CFMutableArrayRef Mutable = 0;
  CFDictionaryRef v9 = 0;
  v1 = v45;
LABEL_18:
  *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = v21;
  if (!*(_DWORD *)(*(void *)(v1[4] + 8) + 24))
  {
    if (Mutable) {
      CFIndex v22 = CFArrayGetCount(Mutable);
    }
    else {
      CFIndex v22 = 0;
    }
    CFDictionaryRef v23 = v9;
    if (!FigCFEqual() && v22 < 1)
    {
      v24 = 0;
      goto LABEL_42;
    }
    if (v22 < 1)
    {
      v24 = 0;
    }
    else
    {
      uint64_t v25 = v1[13];
      v26 = CFArrayGetValueAtIndex(Mutable, 0);
      uint64_t v27 = fpic_UnwrapEvent(v25, (uint64_t)v26);
      v24 = (__CFString *)FigPlayerInterstitialEventCopyPrimaryItem(v27);
    }
    if (*((unsigned char *)v1 + 128))
    {
      uint64_t v28 = v1[15];
      if (v22) {
        BOOL v29 = 1;
      }
      else {
        BOOL v29 = *(void *)(v28 + 192) == 0;
      }
      *(unsigned char *)(v28 + 972) = v29;
    }
    else
    {
      uint64_t v30 = v1[15];
      v31 = *(const void **)(v30 + 192);
      *(void *)(v30 + 192) = Mutable;
      if (Mutable) {
        CFRetain(Mutable);
      }
      if (v31) {
        CFRelease(v31);
      }
    }
    uint64_t v32 = v1[15];
    CFArrayRef v33 = Mutable;
    CFDictionaryRef v9 = v23;
    if (*((unsigned char *)v1 + 128))
    {
      if (!*(unsigned char *)(v32 + 972)) {
        CFArrayRef v33 = *(const __CFArray **)(v32 + 192);
      }
      goto LABEL_41;
    }
    if (!*(unsigned char *)(v32 + 972))
    {
LABEL_41:
      *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = fpic_setEventsInAddOrderForPlayerItem((const void *)v1[13], v24, v33, v1[14], (void *)(*(void *)(v1[5] + 8) + 24), (void *)(*(void *)(v1[6] + 8) + 24), (void *)(*(void *)(v1[7] + 8) + 24), *(__CFArray **)(*(void *)(v1[8] + 8) + 24), (unsigned char *)(*(void *)(v1[9] + 8) + 24), (unsigned char *)(*(void *)(v1[10] + 8) + 24), *(void *)(v1[11] + 8) + 32);
      if (!*(_DWORD *)(*(void *)(v1[4] + 8) + 24))
      {
LABEL_42:
        v34 = (const void *)v1[13];
        uint64_t v35 = v1[14];
        CFArrayRef v36 = (const __CFArray *)FigCFDictionaryCopyArrayOfKeys();
        if (v36)
        {
          CFArrayRef v37 = v36;
          CFIndex v38 = CFArrayGetCount(v36);
          CFIndex v39 = v38 - 1;
          if (v38 < 1)
          {
            int v43 = 0;
          }
          else
          {
            CFIndex v40 = 0;
            do
            {
              v41 = (__CFString *)CFArrayGetValueAtIndex(v37, v40);
              CFArrayRef v42 = (const __CFArray *)CFDictionaryGetValue(v23, v41);
              int v43 = fpic_setEventsInAddOrderForPlayerItem(v34, v41, v42, v35, 0, 0, 0, 0, 0, 0, 0);
              if (v43) {
                break;
              }
            }
            while (v39 != v40++);
          }
          CFRelease(v37);
        }
        else
        {
          int v43 = 0;
        }
        *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = v43;
        if (!*(_DWORD *)(*(void *)(v1[4] + 8) + 24)) {
          fpic_ReplaceNetworkURLsWithOfflineURLs((const void *)v1[13], v1[14]);
        }
        CFDictionaryRef v9 = v23;
      }
    }
    if (v24) {
      CFRelease(v24);
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v9) {
    CFRelease(v9);
  }
}

@end