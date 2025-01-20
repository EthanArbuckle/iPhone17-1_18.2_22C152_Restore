@interface FigRoutingManagerContextUtilities
@end

@implementation FigRoutingManagerContextUtilities

void __FigRoutingManagerContextUtilities_CopyActivatedEndpoints_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
    return;
  }
  v3 = ContextForUUIDFromDict;
  CFArrayRef v4 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 15);
  if (v4)
  {
    CFIndex Count = CFArrayGetCount(v4);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), i);
        Value = CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_Endpoint");
        if (Value) {
          CFArrayAppendValue(Mutable, Value);
        }
      }
    }
    if (Mutable) {
      goto LABEL_9;
    }
LABEL_14:
    **(void **)(a1 + 56) = 0;
    return;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (!Mutable) {
    goto LABEL_14;
  }
LABEL_9:
  **(void **)(a1 + 56) = CFRetain(Mutable);

  CFRelease(Mutable);
}

_DWORD *__FigRoutingManagerContextUtilities_IsContextVideoAndIndependent_block_invoke(uint64_t a1)
{
  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*result == 5)
    {
      result = _routingContextUtilities_getLeaderWeakRef((uint64_t)result);
      if (!result) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyRoutingContextUUID_block_invoke(uint64_t a1)
{
  int64_t Count = FigCFDictionaryGetCount();
  v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (!v3) {
    goto LABEL_10;
  }
  CFArrayRef v4 = v3;
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), 0, v3);
  if (Count < 1)
  {
LABEL_9:
    free(v4);
    goto LABEL_10;
  }
  uint64_t v5 = 0;
  while (1)
  {
    CFDataRef v6 = (const __CFData *)v4[v5];
    if (v6) {
      break;
    }
LABEL_8:
    if (Count == ++v5) {
      goto LABEL_9;
    }
  }
  BytePtr = CFDataGetBytePtr(v6);
  v8 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  v9 = v8;
  if (*(const void **)(a1 + 40) != v8)
  {
    if (v8) {
      CFRelease(v8);
    }
    goto LABEL_8;
  }
  v10 = (const void *)*((void *)BytePtr + 1);
  if (v10)
  {
    CFTypeRef v11 = CFRetain(v10);
    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    CFTypeRef v11 = 0;
    if (v9) {
LABEL_13:
    }
      CFRelease(v9);
  }
  free(v4);
  if (!v11)
  {
LABEL_10:
    **(void **)(a1 + 48) = 0;
    return;
  }
  **(void **)(a1 + 48) = CFRetain(v11);

  CFRelease(v11);
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemAudioContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 528);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_GetContextType_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)result;
  }
  else {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyPickedEndpointAtIndex_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    CFIndex v3 = *(void *)(a1 + 56);
    CFArrayRef v4 = *(void **)(a1 + 64);
    _routingContextUtilities_copyPickedEndpointAtIndex((uint64_t)ContextForUUIDFromDict, v3, v4);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

void __FigRoutingManagerContextUtilities_CopyPickedEndpoints_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    CFIndex v3 = *(void **)(a1 + 56);
    _routingContextUtilities_copyPickedEndpoints((uint64_t)ContextForUUIDFromDict, v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_CopyEndpointsToDeactivateInfoAndUUIDsForPID_block_invoke(uint64_t a1)
{
  int64_t Count = FigCFDictionaryGetCount();
  CFIndex v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (v3)
  {
    CFArrayRef v4 = v3;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), 0, v3);
    if (Count >= 1)
    {
      uint64_t v5 = (CFDataRef *)v4;
      do
      {
        if (*v5)
        {
          BytePtr = CFDataGetBytePtr(*v5);
          v7 = BytePtr;
          if (*(_DWORD *)BytePtr == 5)
          {
            if (*(_DWORD *)(a1 + 56) == 1) {
              goto LABEL_14;
            }
          }
          else if (*(_DWORD *)BytePtr == 6)
          {
            unsigned int v8 = *(_DWORD *)(a1 + 56);
            BOOL v9 = v8 > 4;
            int v10 = (1 << v8) & 0x16;
            if (!v9 && v10 != 0)
            {
LABEL_14:
              if (*((_DWORD *)BytePtr + 8) == *(_DWORD *)(a1 + 60))
              {
                v12 = (const void *)*((void *)BytePtr + 15);
                if (v12)
                {
                  CFArrayRef v13 = (const __CFArray *)CFRetain(v12);
                  if (v13)
                  {
                    CFArrayRef v14 = v13;
                    if (CFArrayGetCount(v13) >= 1)
                    {
                      v15 = *(__CFArray **)(a1 + 40);
                      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v14, 0);
                      CFArrayAppendValue(v15, ValueAtIndex);
                      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), *((const void **)v7 + 1));
                    }
                    CFRelease(v14);
                  }
                }
              }
            }
          }
        }
        ++v5;
        --Count;
      }
      while (Count);
    }
    free(v4);
  }
}

_DWORD *__FigRoutingManagerContextUtilities_IsContextSystemMusicAndIndependent_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*result == 3)
    {
      CFTypeRef result = _routingContextUtilities_getLeaderWeakRef((uint64_t)result);
      if (!result) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyCachedSelectedRouteDescriptors_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    uint64_t v3 = (uint64_t)ContextForUUIDFromDict;
    if (_routingContextUtilities_getLeaderWeakRef((uint64_t)ContextForUUIDFromDict))
    {
      _routingContextUtilities_getLeaderWeakRef(v3);
      CFDataRef v4 = (const __CFData *)FigCFWeakReferenceHolderCopyReferencedObject();
      if (v4)
      {
        CFDataRef v5 = v4;
        BytePtr = CFDataGetBytePtr(v4);
        if (BytePtr)
        {
          CFTypeRef v7 = (CFTypeRef)*((void *)BytePtr + 16);
          if (v7) {
            CFTypeRef v7 = CFRetain(v7);
          }
          **(void **)(a1 + 56) = v7;
        }
        CFRelease(v5);
      }
    }
    else
    {
      CFTypeRef v8 = *(CFTypeRef *)(v3 + 128);
      if (v8) {
        CFTypeRef v8 = CFRetain(v8);
      }
      **(void **)(a1 + 56) = v8;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

uint64_t __FigRoutingManagerContextUtilities_CopyRoutingContextForContextUUID_block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (result)
  {
    uint64_t result = FigCFWeakReferenceHolderCopyReferencedObject();
    **(void **)(a1 + 48) = result;
  }
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemMusicContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 544);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemMirroringContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 536);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

void __FigRoutingManagerContextUtilities_CopySystemRoutingContext_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  uint64_t v3 = *(uint64_t **)(a1 + 40);
  if (routingContextUtilities_getSharedContextUtilities_sContextUtilitiesStateSetupOnce != -1) {
    dispatch_once(&routingContextUtilities_getSharedContextUtilities_sContextUtilitiesStateSetupOnce, &__block_literal_global_2);
  }
  if (byte_1E9358E28) {
    CFDataRef v4 = (CFDictionaryRef *)&routingContextUtilities_getSharedContextUtilities_contextState;
  }
  else {
    CFDataRef v4 = 0;
  }
  CFDataRef v5 = (const void **)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(v4[4 * v2 + 1], 0, v5);
  if (_routingContextUtilities_getContextFromWeakRef((uint64_t)*v5))
  {
    int v6 = 0;
    uint64_t *v3 = FigCFWeakReferenceHolderCopyReferencedObject();
  }
  else
  {
    int v6 = -17420;
  }
  free(v5);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
}

int *__FigRoutingManagerContextUtilities_GetContextString_block_invoke(uint64_t a1)
{
  CFTypeRef result = (int *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    CFTypeRef result = (int *)routingContextUtilities_getFeatureString(*result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v3 = *(const void **)(a1 + 56);
  CFDataRef v4 = *(const void **)(a1 + 64);

  _routingContextUtilities_postNotificationToContextAndItsFollowers(v2, v3, v4);
}

void *__FigRoutingManagerContextUtilities_Create_block_invoke(void *result)
{
  *(void *)(result[5] + 488) = result[6];
  *(void *)(result[5] + 496) = result[4];
  return result;
}

void __FigRoutingManagerContextUtilities_AddContext_block_invoke(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (dword_1E9359DC0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  FigCFDictionaryGetInt32IfPresent();
  *(void *)(*(void *)(a1 + 56) + 8) = CFRetain(*(CFTypeRef *)(a1 + 32));
  *(void *)(*(void *)(a1 + 56) + 16) = CFUUIDCreateString(v2, v3);
  *(void *)(*(void *)(a1 + 56) + 48) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  **(_DWORD **)(a1 + 56) = *(_DWORD *)(a1 + 88);
  FigCFDictionaryGetBooleanIfPresent();
  CFDataRef v5 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  *(void *)(*(void *)(a1 + 56) + 88) = CFArrayCreateMutable(v2, 0, MEMORY[0x1E4F1D510]);
  *(void *)(*(void *)(a1 + 56) + 80) = CFArrayCreateMutable(v2, 0, v5);
  *(void *)(*(void *)(a1 + 56) + 120) = CFArrayCreateMutable(v2, 0, v5);
  *(void *)(*(void *)(a1 + 56) + 112) = CFArrayCreateMutable(v2, 0, v5);
  *(unsigned char *)(*(void *)(a1 + 56) + 136) = 1;
  *(void *)(*(void *)(a1 + 56) + 128) = CFArrayCreateMutable(v2, 0, v5);
  *(void *)(*(void *)(a1 + 56) + 160) = 0;
  *(void *)(*(void *)(a1 + 56) + 168) = 0;
  int v6 = *(void **)(a1 + 56);
  v6[25] = 0;
  v6[22] = 0;
  v6[23] = 0;
  *(void *)(*(void *)(a1 + 56) + 192) = 0;
  *(void *)(*(void *)(a1 + 56) + 208) = CFArrayCreateMutable(v2, 0, v5);
  *(void *)(*(void *)(a1 + 56) + 64) = 0;
  *(void *)(*(void *)(a1 + 56) + 64) = 0;
  *(_DWORD *)(*(void *)(a1 + 56) + 152) = -1082130432;
  *(void *)(*(void *)(a1 + 56) + 144) = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeRef v7 = (const void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 80) + 32 * *(unsigned int *)(a1 + 88) + 8), *(const void **)(a1 + 32), v7);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 80) + 480), *(const void **)(a1 + 32), *(const void **)(a1 + 72));
  switch(*(_DWORD *)(a1 + 88))
  {
    case 1:
      CFTypeRef v8 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v8) {
        CFTypeRef v8 = CFRetain(v8);
      }
      *(void *)(*(void *)(a1 + 80) + 528) = v8;
      if (v7) {
        goto LABEL_43;
      }
      goto LABEL_44;
    case 2:
      CFTypeRef v9 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v9) {
        CFTypeRef v9 = CFRetain(v9);
      }
      *(void *)(*(void *)(a1 + 80) + 536) = v9;
      if (v7) {
        goto LABEL_43;
      }
      goto LABEL_44;
    case 3:
      CFTypeRef v10 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v10) {
        CFTypeRef v10 = CFRetain(v10);
      }
      *(void *)(*(void *)(a1 + 80) + 544) = v10;
      if (v7) {
        goto LABEL_43;
      }
      goto LABEL_44;
    case 4:
      CFTypeRef v11 = *(__CFArray **)(*(void *)(a1 + 80) + 616);
      if (v11) {
        goto LABEL_21;
      }
      goto LABEL_42;
    case 5:
      CFTypeRef v11 = *(__CFArray **)(*(void *)(a1 + 80) + 608);
      if (!v11) {
        goto LABEL_42;
      }
      goto LABEL_21;
    case 6:
      CFTypeRef v11 = *(__CFArray **)(*(void *)(a1 + 80) + 600);
      if (!v11) {
        goto LABEL_42;
      }
LABEL_21:
      CFArrayAppendValue(v11, *(const void **)(*(void *)(a1 + 56) + 8));
      if (!v7) {
        goto LABEL_44;
      }
      goto LABEL_43;
    case 9:
      CFTypeRef v12 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v12) {
        CFTypeRef v12 = CFRetain(v12);
      }
      *(void *)(*(void *)(a1 + 80) + 560) = v12;
      if (!v7) {
        goto LABEL_44;
      }
      goto LABEL_43;
    case 0xA:
      CFTypeRef v13 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v13) {
        CFTypeRef v13 = CFRetain(v13);
      }
      *(void *)(*(void *)(a1 + 80) + 576) = v13;
      if (!v7) {
        goto LABEL_44;
      }
      goto LABEL_43;
    case 0xB:
      CFTypeRef v14 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v14) {
        CFTypeRef v14 = CFRetain(v14);
      }
      *(void *)(*(void *)(a1 + 80) + 568) = v14;
      if (!v7) {
        goto LABEL_44;
      }
      goto LABEL_43;
    case 0xC:
      CFTypeRef v15 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v15) {
        CFTypeRef v15 = CFRetain(v15);
      }
      *(void *)(*(void *)(a1 + 80) + 552) = v15;
      if (!v7) {
        goto LABEL_44;
      }
      goto LABEL_43;
    case 0xD:
      CFTypeRef v16 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v16) {
        CFTypeRef v16 = CFRetain(v16);
      }
      *(void *)(*(void *)(a1 + 80) + 584) = v16;
      goto LABEL_42;
    case 0xE:
      CFTypeRef v17 = *(CFTypeRef *)(*(void *)(a1 + 56) + 8);
      if (v17) {
        CFTypeRef v17 = CFRetain(v17);
      }
      *(void *)(*(void *)(a1 + 80) + 592) = v17;
      if (!v7) {
        goto LABEL_44;
      }
      goto LABEL_43;
    default:
LABEL_42:
      if (v7) {
LABEL_43:
      }
        CFRelease(v7);
LABEL_44:
      if (v3) {
        CFRelease(v3);
      }
      return;
  }
}

void __FigRoutingManagerContextUtilities_ResetCurrentlyActivatingEndpointInfo_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    uint64_t v3 = (uint64_t)ContextForUUIDFromDict;
    CFArrayRef v4 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 14);
    if (v4 && (CFIndex Count = CFArrayGetCount(v4), Count >= 1))
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 112), v7);
        if (CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_Endpoint") == *(const void **)(a1 + 56)) {
          break;
        }
        if (v6 == ++v7) {
          goto LABEL_7;
        }
      }
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_ClientRouteChangeOptions");
      CFDictionaryRef v9 = Value;
      if (Value)
      {
        CFTypeRef v11 = CFDictionaryGetValue(Value, @"clientRouteRequestID");
        if (v11) {
          CFTypeRef v11 = CFRetain(v11);
        }
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
        CFTypeRef v12 = CFDictionaryGetValue(v9, @"initiator");
        if (v12) {
          CFDictionaryRef v9 = (const __CFDictionary *)CFRetain(v12);
        }
        else {
          CFDictionaryRef v9 = 0;
        }
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v3 + 112), v7);
    }
    else
    {
LABEL_7:
      CFDictionaryRef v9 = 0;
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    _routingContextUtilities_postNotificationToContextAndItsFollowers(v3, @"routeConfigUpdated", Mutable);
    *(unsigned char *)(v3 + 136) = 1;
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v9)
    {
      CFRelease(v9);
    }
  }
}

void __FigRoutingManagerContextUtilities_ResetCurrentlyActivatingSubEndpointsInfo_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  uint64_t v3 = ContextForUUIDFromDict;
  CFArrayRef v4 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 14);
  if (v4)
  {
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 14), v7);
        if (CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_Endpoint") == *(const void **)(a1 + 56)) {
          break;
        }
        if (v6 == ++v7) {
          return;
        }
      }
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_SubEndpoints");
      if (!Value)
      {
        int v14 = 0;
LABEL_22:
        CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v3 + 14), v7);
LABEL_23:
        if (v14) {
          *((unsigned char *)v3 + 136) = 1;
        }
        return;
      }
      CFArrayRef v10 = Value;
      CFIndex v11 = CFArrayGetCount(Value);
      if (v11 >= 1)
      {
        CFIndex v12 = v11;
        CFIndex v13 = 0;
        while (CFArrayGetValueAtIndex(v10, v13) != *(const void **)(a1 + 64))
        {
          if (v12 == ++v13) {
            goto LABEL_15;
          }
        }
        CFArrayRemoveValueAtIndex(v10, v13);
        if (*(unsigned char *)(a1 + 88) || *(unsigned char *)(a1 + 89))
        {
          CFTypeRef v15 = *(void **)(a1 + 48);
          CFDictionaryRef v16 = *(const __CFDictionary **)(a1 + 72);
LABEL_20:
          _routingContextUtilities_postRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(v15, v16);
          int v14 = 1;
LABEL_21:
          if (CFArrayGetCount(v10)) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        if (!FigCFEqual()) {
          *((unsigned char *)v3 + 136) = 0;
        }
        if (!CFArrayGetCount(v10))
        {
          CFTypeRef v15 = *(void **)(a1 + 48);
          CFDictionaryRef v16 = *(const __CFDictionary **)(a1 + 72);
          goto LABEL_20;
        }
      }
LABEL_15:
      int v14 = 0;
      goto LABEL_21;
    }
  }
}

void __FigRoutingManagerContextUtilities_SaveCommChannelUUID_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    uint64_t v3 = ContextForUUIDFromDict;
    CFArrayRef v4 = (const void *)*((void *)ContextForUUIDFromDict + 13);
    CFDataRef v5 = *(const void **)(a1 + 56);
    *((void *)v3 + 13) = v5;
    if (v5) {
      CFRetain(v5);
    }
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  uint64_t v3 = ContextForUUIDFromDict;
  CFArrayRef v4 = (void *)MEMORY[0x1E4F1CF80];
  if (*(void *)(a1 + 56))
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    CFArrayAppendValue(*((CFMutableArrayRef *)v3 + 14), Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  FigCFDictionaryGetInt32IfPresent();
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 72);
  if (v6 && (CFArrayRef Value = CFDictionaryGetValue(v6, @"clientRouteRequestID")) != 0) {
    CFTypeRef v8 = CFRetain(Value);
  }
  else {
    CFTypeRef v8 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9 && !FigRoutingManagerIsEndpointOfType(v9))
  {
    CFArrayRef v10 = *(const void **)(a1 + 56);
    if (v10) {
      CFRetain(v10);
    }
    if (v8) {
      CFRetain(v8);
    }
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    uint64_t v12 = *(void *)(a1 + 40);
    CFIndex v13 = *(NSObject **)(v12 + 496);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_2;
    block[3] = &__block_descriptor_56_e5_v8__0l;
    block[4] = v12;
    block[5] = v8;
    block[6] = *(void *)(a1 + 56);
    dispatch_after(v11, v13, block);
  }
  _routingContextUtilities_postRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void **)(a1 + 48), *(const __CFDictionary **)(a1 + 72));
  if (v8) {
    CFRelease(v8);
  }
  if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 56)))
  {
    CFNumberRef number = 0;
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    CFTypeRef v17 = *(void (**)(uint64_t, void, void, CFNumberRef *))(v16 + 48);
    if (v17)
    {
      v17(CMBaseObject, *MEMORY[0x1E4F20FC0], *v4, &number);
      uint64_t valuePtr = 0;
      if (number)
      {
        CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
        CFRelease(number);
        CFNumberRef number = 0;
        if ((valuePtr & 0x10) != 0) {
          return;
        }
      }
    }
    else
    {
      uint64_t valuePtr = 0;
    }
    FigRouteDiscoveryManagerLowerBTDiscoveryModeFromDetailed();
  }
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_2(uint64_t a1)
{
  CFAllocatorRef v2 = *(NSObject **)(*(void *)(a1 + 32) + 504);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_3;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  long long v6 = *(_OWORD *)(a1 + 40);
  MXDispatchSync((uint64_t)"FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_2", (uint64_t)"FigRoutingManagerContextUtilities.m", 1622, 0, 0, v2, (uint64_t)v5);
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  CFArrayRef v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingEndpoint_block_invoke_3(uint64_t a1)
{
}

void __FigRoutingManagerContextUtilities_RemoveCurrentlyActivatingEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    uint64_t v3 = (uint64_t)ContextForUUIDFromDict;
    CFMutableDictionaryRef RouteConfigUpdatedPayload = routingContextUtilities_createRouteConfigUpdatedPayload(*(const __CFDictionary **)(a1 + 56));
    _routingContextUtilities_postNotificationToContextAndItsFollowers(v3, @"routeConfigUpdated", RouteConfigUpdatedPayload);
    _routingContextUtilities_removeCurrentlyActivatingEndpointWithID(*(void **)(a1 + 48), *(const __CFString **)(a1 + 64));
    if (RouteConfigUpdatedPayload)
    {
      CFRelease(RouteConfigUpdatedPayload);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_AddCurrentlyActivatingSubEndpoints_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    uint64_t v3 = ContextForUUIDFromDict;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    FigCFDictionaryGetInt32IfPresent();
    CFArrayRef v6 = *(const __CFArray **)(a1 + 64);
    if (v6) {
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(v4, 0, v6);
    }
    else {
      CFMutableArrayRef MutableCopy = CFArrayCreateMutable(v4, 0, MEMORY[0x1E4F1D510]);
    }
    CFMutableArrayRef v8 = MutableCopy;
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    CFArrayRef v9 = (const __CFArray *)*((void *)v3 + 14);
    if (v9 && (CFIndex Count = CFArrayGetCount(v9), Count >= 1))
    {
      CFIndex v11 = Count;
      CFIndex v12 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 14), v12);
        if (CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_Endpoint") == *(const void **)(a1 + 80)) {
          break;
        }
        if (v11 == ++v12) {
          goto LABEL_11;
        }
      }
      FigCFDictionaryGetBooleanIfPresent();
      CFDictionarySetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_SubEndpoints", v8);
    }
    else
    {
LABEL_11:
      CFArrayAppendValue(*((CFMutableArrayRef *)v3 + 14), Mutable);
    }
    _routingContextUtilities_postRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void **)(a1 + 48), *(const __CFDictionary **)(a1 + 56));
    if (v8) {
      CFRelease(v8);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_SetPickedEndpoints_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -17422;
    return;
  }
  if (*(_DWORD *)v2 == 13 || *(_DWORD *)v2 == 3)
  {
    FigRoutingContextUtilities_LogRouteDescriptors(*(const __CFArray **)(v2 + 128), *(const __CFArray **)(a1 + 64));
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFAllocatorRef v4 = *(const void **)(v2 + 72);
  CFDataRef v5 = *(const void **)(a1 + 72);
  *(void *)(v2 + 72) = v5;
  if (v5) {
    CFRetain(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  CFIndex v7 = *(const void **)(v6 + 128);
  CFMutableArrayRef v8 = *(const void **)(a1 + 64);
  *(void *)(v6 + 128) = v8;
  if (v8) {
    CFRetain(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!*(void *)(v9 + 72))
  {
    CFArrayRef v10 = *(void **)(v9 + 96);
    if (v10) {
      _routingContextUtilities_setLeaderUUIDForContext(*(void **)(a1 + 56), v10);
    }
  }
  CFDictionaryRef v11 = *(const __CFDictionary **)(a1 + 80);
  if (v11)
  {
    CFArrayRef Value = CFDictionaryGetValue(v11, @"clientRouteRequestID");
    if (Value) {
      CFIndex v13 = CFRetain(Value);
    }
    else {
      CFIndex v13 = 0;
    }
    uint64_t v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), @"initiator");
    if (v15) {
      CFTypeRef v14 = CFRetain(v15);
    }
    else {
      CFTypeRef v14 = 0;
    }
  }
  else
  {
    CFIndex v13 = 0;
    CFTypeRef v14 = 0;
  }
  int v16 = 0;
  CFIndex v17 = 0;
  uint64_t v30 = *MEMORY[0x1E4F20E38];
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (1)
  {
    CFArrayRef Count = *(const __CFArray **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 112);
    if (Count) {
      CFArrayRef Count = (const __CFArray *)CFArrayGetCount(Count);
    }
    if (v17 >= (uint64_t)Count) {
      break;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)+ 112), v17);
    v20 = CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_Endpoint");
    CFTypeRef cf = 0;
    FigRoutingManagerLogEndpointID(@"currently activating endpoint:", (uint64_t)v20, 0, 1);
    if (v20)
    {
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
      uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v23 = v22 ? v22 : 0;
      v24 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(v23 + 48);
      if (v24) {
        v24(CMBaseObject, v30, alloc, &cf);
      }
    }
    if (FigRoutingContextUtilities_DoesArrayOfEndpointsContainEndpoint(*(const __CFArray **)(a1 + 72), (uint64_t)v20))
    {
      if (v13)
      {
LABEL_40:
        if (!FigRoutingManagerIsEndpointOfType((uint64_t)v20)) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 112), v17--);
        }
        _routingContextUtilities_removeCurrentlyActivatingEndpointWithID(*(void **)(a1 + 56), (const __CFString *)cf);
        _routingContextUtilities_notifyClientsOfChangeInPickedEndpoints(*(void *)(a1 + 88), (uint64_t)v13, (int)v14, *(void **)(a1 + 56));
        if (v13) {
          CFRelease(v13);
        }
        if (v14)
        {
          CFRelease(v14);
          CFIndex v13 = 0;
          CFTypeRef v14 = 0;
        }
        else
        {
          CFIndex v13 = 0;
        }
        int v16 = 1;
        goto LABEL_54;
      }
      CFDictionaryRef v25 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_ClientRouteChangeOptions");
      if (!v25)
      {
        CFIndex v13 = 0;
        goto LABEL_40;
      }
      CFDictionaryRef v26 = v25;
      v27 = CFDictionaryGetValue(v25, @"clientRouteRequestID");
      if (v27)
      {
        CFIndex v13 = CFRetain(v27);
        if (v14) {
          goto LABEL_49;
        }
      }
      else
      {
        CFIndex v13 = 0;
        if (v14) {
LABEL_49:
        }
          CFRelease(v14);
      }
      v28 = CFDictionaryGetValue(v26, @"initiator");
      if (v28) {
        CFTypeRef v14 = CFRetain(v28);
      }
      else {
        CFTypeRef v14 = 0;
      }
      goto LABEL_40;
    }
LABEL_54:
    if (cf) {
      CFRelease(cf);
    }
    ++v17;
  }
  if (!v16)
  {
    if (!v13)
    {
      if (v14) {
        CFRelease(v14);
      }
      uint64_t v29 = mach_absolute_time();
      CFIndex v13 = CFStringCreateWithFormat(alloc, 0, @"%lld", v29);
      CFTypeRef v14 = 0;
    }
    _routingContextUtilities_notifyClientsOfChangeInPickedEndpoints(*(void *)(a1 + 88), (uint64_t)v13, (int)v14, *(void **)(a1 + 56));
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v14) {
    CFRelease(v14);
  }
}

void __FigRoutingManagerContextUtilities_AddActivatedEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  uint64_t v3 = ContextForUUIDFromDict;
  CFArrayRef v4 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 15);
  if (!v4) {
    goto LABEL_14;
  }
  CFIndex Count = CFArrayGetCount(v4);
  if (!Count)
  {
    CFArrayRef v4 = (const __CFArray *)*((void *)v3 + 15);
LABEL_14:
    CFDictionaryRef v11 = *(const void **)(a1 + 56);
    CFArrayAppendValue(v4, v11);
    return;
  }
  CFIndex v6 = Count;
  if (Count < 1) {
    goto LABEL_18;
  }
  CFIndex v7 = 0;
  int v8 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), v7);
    CFArrayRef Value = CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_Endpoint");
    FigCFDictionaryGetInt64IfPresent();
    if (Value == *(const void **)(a1 + 64)) {
      break;
    }
LABEL_9:
    if (v6 == ++v7)
    {
      if (v8) {
        return;
      }
      goto LABEL_18;
    }
  }
  if (!*(void *)(a1 + 72))
  {
    int v8 = 1;
    goto LABEL_9;
  }
  FigCFDictionarySetValue();
  if (v8) {
    return;
  }
LABEL_18:
  CFArrayAppendValue(*((CFMutableArrayRef *)v3 + 15), *(const void **)(a1 + 56));
}

void __FigRoutingManagerContextUtilities_RemoveActivatedEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    uint64_t v3 = ContextForUUIDFromDict;
    CFArrayRef v4 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 15);
    if (v4)
    {
      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        CFIndex v7 = 0;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), v7);
          CFArrayRef Value = CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_Endpoint");
          FigCFDictionaryGetInt64IfPresent();
          if (Value == *(const void **)(a1 + 56) && !*(void *)(a1 + 64)) {
            break;
          }
          if (v6 == ++v7) {
            return;
          }
        }
        if (!FigRoutingManagerIsEndpointOfType((uint64_t)Value)
          || (CFArrayRef v10 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_SubEndpointsInfo")) == 0|| !CFArrayGetCount(v10))
        {
          CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v3 + 15), v7);
        }
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
}

const UInt8 *__FigRoutingManagerContextUtilities_GetPickingState_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result) {
    **(_DWORD **)(a1 + 56) = *((_DWORD *)result + 14);
  }
  else {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_SetPickingState_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result) {
    *((_DWORD *)result + 14) = *(_DWORD *)(a1 + 56);
  }
  else {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void *__FigRoutingManagerContextUtilities_SetDefaultLeaderUUIDForContext_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    uint64_t v3 = result;
    CFTypeRef result = *(void **)(a1 + 56);
    if (result) {
      CFTypeRef result = CFRetain(result);
    }
    v3[12] = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyAllAudioContexts_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 32) + 616);
  if (v2)
  {
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        CFDictionaryRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 616), i);
        if (_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), ValueAtIndex))
        {
          CFIndex v7 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
          if (v7)
          {
            int v8 = v7;
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v7);
            CFRelease(v8);
          }
        }
      }
    }
  }
}

void __FigRoutingManagerContextUtilities_CopyPickedIndividualEndpoints_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 32);
  if (v2)
  {
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      CFIndex v5 = 0;
      uint64_t v6 = *MEMORY[0x1E4F20FB0];
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v5);
        if (ValueAtIndex && (FigEndpointAggregateGetClassID(), CMBaseObjectIsMemberOfClass()))
        {
          CFArrayRef theArray = 0;
          uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
          uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v10) {
            uint64_t v11 = v10;
          }
          else {
            uint64_t v11 = 0;
          }
          CFIndex v12 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFArrayRef *))(v11 + 48);
          if (v12) {
            v12(CMBaseObject, v6, v7, &theArray);
          }
          if (theArray)
          {
            CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(v7, 0, theArray);
            if (theArray)
            {
              if (FigRoutingManagerIsEndpointOfSubtype((uint64_t)ValueAtIndex))
              {
                CFTypeRef v14 = FigRoutingManagerCopyLocalAirPlayEndpoint();
                if (v14)
                {
                  uint64_t v15 = v14;
                  if (!FigRoutingManagerIsClusterLocalEndpoint((uint64_t)v14))
                  {
                    CFArrayRef v17 = theArray;
                    v27.length = CFArrayGetCount(theArray);
                    v27.location = 0;
                    FirstIndexOfCFArrayRef Value = CFArrayGetFirstIndexOfValue(v17, v27, v15);
                    if (FirstIndexOfValue != -1)
                    {
                      CFIndex idx = FirstIndexOfValue;
                      uint64_t v19 = *(void *)(a1 + 40);
                      v20 = *(const void **)(v19 + 528);
                      if (v20)
                      {
                        v21 = (void *)CFRetain(v20);
                        uint64_t v19 = *(void *)(a1 + 40);
                      }
                      else
                      {
                        v21 = 0;
                      }
                      CFDictionaryRef v25 = 0;
                      ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(v19 + 480), v21);
                      _routingContextUtilities_copyPickedEndpointAtIndex((uint64_t)ContextForUUIDFromDict, 0, &v25);
                      uint64_t v23 = v25;
                      if (v25)
                      {
                        if (FigRoutingManagerIsEndpointWHAGroupable((uint64_t)v25)) {
                          CFArraySetValueAtIndex(MutableCopy, idx, v23);
                        }
                        CFRelease(v23);
                      }
                      if (v21) {
                        CFRelease(v21);
                      }
                    }
                  }
                  CFRelease(v15);
                }
              }
              int v16 = *(__CFArray **)(a1 + 48);
              v28.length = CFArrayGetCount(theArray);
              v28.location = 0;
              CFArrayAppendArray(v16, MutableCopy, v28);
              if (theArray)
              {
                CFRelease(theArray);
                CFArrayRef theArray = 0;
              }
            }
            if (MutableCopy) {
              CFRelease(MutableCopy);
            }
          }
        }
        else
        {
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), ValueAtIndex);
        }
        ++v5;
      }
      while (v4 != v5);
    }
  }
}

void __FigRoutingManagerContextUtilities_CopyPickedEndpointForRemoteControl_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (!ContextForUUIDFromDict)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
    return;
  }
  int v3 = *(_DWORD *)ContextForUUIDFromDict;
  if (*(_DWORD *)ContextForUUIDFromDict == 9)
  {
LABEL_5:
    CFTypeRef v4 = (CFTypeRef)*((void *)ContextForUUIDFromDict + 8);
    if (v4) {
      CFTypeRef v4 = CFRetain(v4);
    }
    **(void **)(a1 + 56) = v4;
    return;
  }
  if (v3 != 7)
  {
    if (v3 != 3)
    {
      **(void **)(a1 + 56) = 0;
      return;
    }
    goto LABEL_5;
  }
  CFIndex v5 = *(void **)(a1 + 56);

  _routingContextUtilities_copyPickedEndpointAtIndex((uint64_t)ContextForUUIDFromDict, 0, v5);
}

void __FigRoutingManagerContextUtilities_GetActivatedEndpointFeatures_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    int v3 = ContextForUUIDFromDict;
    CFArrayRef v4 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 15);
    if (v4)
    {
      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0; i != v6; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), i);
          if (CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_Endpoint") == *(const void **)(a1 + 56)) {
            FigCFDictionaryGetInt64IfPresent();
          }
        }
      }
    }
    if (!**(void **)(a1 + 64))
    {
      int64_t v9 = FigCFDictionaryGetCount();
      uint64_t v10 = (const void **)malloc_type_calloc(v9, 8uLL, 0x80040B8603338uLL);
      if (v10)
      {
        uint64_t v11 = v10;
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), 0, v10);
        if (v9 >= 1)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            CFDataRef v13 = (const __CFData *)v11[j];
            if (v13)
            {
              BytePtr = CFDataGetBytePtr(v13);
              CFArrayRef v15 = (const __CFArray *)*((void *)BytePtr + 15);
              if (v15)
              {
                CFIndex v16 = CFArrayGetCount(v15);
                if (v16 >= 1)
                {
                  CFIndex v17 = v16;
                  for (CFIndex k = 0; k != v17; ++k)
                  {
                    CFDictionaryRef v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)BytePtr + 15), k);
                    if (CFDictionaryGetValue(v19, @"ActivatedEndpointsInfo_Endpoint") == *(const void **)(a1 + 56)) {
                      FigCFDictionaryGetInt64IfPresent();
                    }
                  }
                }
              }
            }
          }
        }
        free(v11);
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void __FigRoutingManagerContextUtilities_GetActivationSeedForEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    int v3 = ContextForUUIDFromDict;
    CFArrayRef v4 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 15);
    if (v4)
    {
      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0; i != v6; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 15), i);
          if (CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_Endpoint") == *(const void **)(a1 + 56)) {
            FigCFDictionaryGetInt64IfPresent();
          }
        }
      }
    }
    if (!**(void **)(a1 + 64))
    {
      int64_t v9 = FigCFDictionaryGetCount();
      uint64_t v10 = (const void **)malloc_type_calloc(v9, 8uLL, 0x80040B8603338uLL);
      if (v10)
      {
        uint64_t v11 = v10;
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), 0, v10);
        if (v9 >= 1)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            CFDataRef v13 = (const __CFData *)v11[j];
            if (v13)
            {
              BytePtr = CFDataGetBytePtr(v13);
              CFArrayRef v15 = (const __CFArray *)*((void *)BytePtr + 15);
              if (v15)
              {
                CFIndex v16 = CFArrayGetCount(v15);
                if (v16 >= 1)
                {
                  CFIndex v17 = v16;
                  for (CFIndex k = 0; k != v17; ++k)
                  {
                    CFDictionaryRef v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)BytePtr + 15), k);
                    if (CFDictionaryGetValue(v19, @"ActivatedEndpointsInfo_Endpoint") == *(const void **)(a1 + 56)) {
                      FigCFDictionaryGetInt64IfPresent();
                    }
                  }
                }
              }
            }
          }
        }
        free(v11);
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
}

void *__FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpointInfoAtIndex_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result
    && (uint64_t v3 = *(void *)(a1 + 56), (v3 & 0x8000000000000000) == 0)
    && (CFArrayRef v4 = result, (result = (void *)result[14]) != 0)
    && (CFTypeRef result = (void *)CFArrayGetCount((CFArrayRef)result), v3 < (uint64_t)result))
  {
    CFTypeRef result = CFArrayGetValueAtIndex((CFArrayRef)v4[14], *(void *)(a1 + 56));
    if (result) {
      CFTypeRef result = CFRetain(result);
    }
    **(void **)(a1 + 64) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_RemoveCurrentlyActivatingEndpointInfoAtIndex_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    CFIndex v3 = *(void *)(a1 + 56);
    if ((v3 & 0x8000000000000000) == 0)
    {
      CFArrayRef v4 = ContextForUUIDFromDict;
      CFArrayRef v5 = (const __CFArray *)*((void *)ContextForUUIDFromDict + 14);
      if (v5)
      {
        if (v3 < CFArrayGetCount(v5))
        {
          CFIndex v6 = (__CFArray *)*((void *)v4 + 14);
          CFIndex v7 = *(void *)(a1 + 56);
          CFArrayRemoveValueAtIndex(v6, v7);
        }
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

void __FigRoutingManagerContextUtilities_AppendCurrentlyActivatingEndpointInfo_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    CFIndex v3 = (__CFArray *)*((void *)ContextForUUIDFromDict + 14);
    CFArrayRef v4 = *(const void **)(a1 + 56);
    CFArrayAppendValue(v3, v4);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

void __FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpoints_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    CFIndex v3 = ContextForUUIDFromDict;
    CFArrayRef v4 = *(CFTypeRef **)(a1 + 56);
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    CFArrayRef v6 = (const __CFArray *)*((void *)v3 + 14);
    if (v6)
    {
      CFIndex Count = CFArrayGetCount(v6);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 14), i);
          CFArrayRef Value = CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_Endpoint");
          if (Value) {
            CFArrayAppendValue(Mutable, Value);
          }
        }
      }
    }
    if (Mutable)
    {
      *CFArrayRef v4 = CFRetain(Mutable);
      CFRelease(Mutable);
    }
    else
    {
      *CFArrayRef v4 = 0;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

void *__FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpointsInfo_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    CFTypeRef result = (void *)result[14];
    if (result) {
      CFTypeRef result = CFRetain(result);
    }
    **(void **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

uint64_t __FigRoutingManagerContextUtilities_CopyCurrentlyActivatingSubEndpoints_block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = *(void *)(result + 112);
    if (result)
    {
      uint64_t result = CFArrayGetCount((CFArrayRef)result);
      if (result >= 1)
      {
        uint64_t v4 = result;
        CFIndex v5 = 0;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 112), v5);
          uint64_t result = (uint64_t)CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_Endpoint");
          if (result == *(void *)(a1 + 56)) {
            break;
          }
          if (v4 == ++v5) {
            return result;
          }
        }
        uint64_t result = (uint64_t)CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_SubEndpoints");
        if (result) {
          uint64_t result = (uint64_t)CFRetain((CFTypeRef)result);
        }
        **(void **)(a1 + 64) = result;
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void *__FigRoutingManagerContextUtilities_CopyActivatedEndpointsInfo_block_invoke(uint64_t a1)
{
  uint64_t result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    uint64_t result = (void *)result[15];
    if (result) {
      uint64_t result = CFRetain(result);
    }
    **(void **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyRoutingContextUUIDForActivatedEndpoint_block_invoke(uint64_t a1)
{
  int64_t Count = FigCFDictionaryGetCount();
  uint64_t v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (v3)
  {
    uint64_t v4 = v3;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), 0, v3);
    if (Count <= 0)
    {
      free(v4);
    }
    else
    {
      uint64_t v5 = 0;
      CFTypeRef cf = 0;
      do
      {
        CFDataRef v6 = (const __CFData *)v4[v5];
        if (v6)
        {
          BytePtr = CFDataGetBytePtr(v6);
          CFIndex v8 = (const void *)*((void *)BytePtr + 15);
          if (v8)
          {
            CFArrayRef v9 = (const __CFArray *)CFRetain(v8);
            if (v9)
            {
              CFArrayRef v10 = v9;
              CFIndex v11 = CFArrayGetCount(v9);
              if (v11 >= 1)
              {
                CFIndex v12 = v11;
                CFIndex v13 = 0;
                while (1)
                {
                  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v13);
                  if (CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_Endpoint") == *(const void **)(a1 + 40))
                  {
                    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"ActivatedEndpointsInfo_ActivationSeed");
                    uint64_t valuePtr = 0;
                    if (Value)
                    {
                      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
                      uint64_t v16 = valuePtr;
                    }
                    else
                    {
                      uint64_t v16 = 0;
                    }
                    if (v16 == *(void *)(a1 + 48)) {
                      break;
                    }
                  }
                  if (v12 == ++v13) {
                    goto LABEL_15;
                  }
                }
                CFIndex v17 = (const void *)*((void *)BytePtr + 1);
                if (v17) {
                  CFTypeRef cf = CFRetain(v17);
                }
                else {
                  CFTypeRef cf = 0;
                }
              }
LABEL_15:
              CFRelease(v10);
            }
          }
        }
        ++v5;
      }
      while (v5 != Count);
      free(v4);
      if (cf)
      {
        **(void **)(a1 + 56) = CFRetain(cf);
        CFRelease(cf);
        return;
      }
    }
  }
  **(void **)(a1 + 56) = 0;
}

void __FigRoutingManagerContextUtilities_RemoveContext_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 64) + 480), *(void **)(a1 + 72));
  CFArrayRef v2 = *(_DWORD **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -17420;
    return;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *v2;
  int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  switch(v3)
  {
    case 4:
      uint64_t v9 = *(void *)(a1 + 64);
      CFArrayRef v10 = *(const __CFArray **)(v9 + 616);
      if (v10)
      {
        v19.length = CFArrayGetCount(*(CFArrayRef *)(v9 + 616));
        v19.location = 0;
        FirstIndexOfCFNumberRef Value = CFArrayGetFirstIndexOfValue(v10, v19, *(const void **)(a1 + 72));
        if (FirstIndexOfValue != -1)
        {
          CFIndex v7 = FirstIndexOfValue;
          CFIndex v8 = (CFMutableArrayRef *)(*(void *)(a1 + 64) + 616);
          goto LABEL_15;
        }
      }
      break;
    case 6:
      uint64_t v12 = *(void *)(a1 + 64);
      CFArrayRef v13 = *(const __CFArray **)(v12 + 600);
      if (v13)
      {
        v20.length = CFArrayGetCount(*(CFArrayRef *)(v12 + 600));
        v20.location = 0;
        CFIndex v14 = CFArrayGetFirstIndexOfValue(v13, v20, *(const void **)(a1 + 72));
        if (v14 != -1)
        {
          CFIndex v7 = v14;
          CFIndex v8 = (CFMutableArrayRef *)(*(void *)(a1 + 64) + 600);
          goto LABEL_15;
        }
      }
      break;
    case 5:
      uint64_t v4 = *(void *)(a1 + 64);
      CFArrayRef v5 = *(const __CFArray **)(v4 + 608);
      if (v5)
      {
        v18.length = CFArrayGetCount(*(CFArrayRef *)(v4 + 608));
        v18.location = 0;
        CFIndex v6 = CFArrayGetFirstIndexOfValue(v5, v18, *(const void **)(a1 + 72));
        if (v6 != -1)
        {
          CFIndex v7 = v6;
          CFIndex v8 = (CFMutableArrayRef *)(*(void *)(a1 + 64) + 608);
LABEL_15:
          CFArrayRemoveValueAtIndex(*v8, v7);
        }
      }
      break;
  }
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 64)+ 32 * *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)+ 8), *(const void **)(a1 + 72)))
  {
    CFDataRef v15 = (const __CFData *)FigCFWeakReferenceHolderCopyReferencedObject();
    if (v15)
    {
      CFDataRef v16 = v15;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDataGetBytePtr(v15);
      if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
      CFRelease(v16);
    }
  }
}

void __FigRoutingManagerContextUtilities_RemoveContext_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  int v3 = *(const void **)(v2 + 64);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  uint64_t v4 = *(const void **)(v2 + 8);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFArrayRef v5 = *(const void **)(v2 + 16);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFIndex v6 = *(const void **)(v2 + 80);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 80) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFIndex v7 = *(const void **)(v2 + 88);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 88) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFIndex v8 = *(const void **)(v2 + 48);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 48) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  uint64_t v9 = *(const void **)(v2 + 72);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 72) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFArrayRef v10 = *(const void **)(v2 + 112);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 112) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFIndex v11 = *(const void **)(v2 + 120);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 120) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  uint64_t v12 = *(const void **)(v2 + 40);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFArrayRef v13 = *(const void **)(v2 + 128);
  if (v13)
  {
    CFRelease(v13);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 128) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  CFIndex v14 = *(const void **)(v2 + 144);
  if (v14)
  {
    CFRelease(v14);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 144) = 0;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  *(_DWORD *)(v2 + 24) = 0;
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 32) = 0;
  *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 28) = 0;
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 152) = -1082130432;
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  CFDataRef v16 = *(void **)(v15 + 24);
  CFIndex v17 = (const void *)v16[21];
  if (v17)
  {
    CFRelease(v17);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 168) = 0;
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    CFDataRef v16 = *(void **)(v15 + 24);
  }
  CFRange v18 = (const void *)v16[20];
  if (v18)
  {
    CFRelease(v18);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 160) = 0;
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    CFDataRef v16 = *(void **)(v15 + 24);
  }
  CFRange v19 = v16[22];
  if (v19)
  {
    dispatch_source_cancel(v19);
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    CFDataRef v16 = *(void **)(v15 + 24);
    CFRange v20 = v16[22];
    if (v20)
    {
      dispatch_release(v20);
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 176) = 0;
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      CFDataRef v16 = *(void **)(v15 + 24);
    }
  }
  v21 = v16[23];
  if (v21)
  {
    dispatch_source_cancel(v21);
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    CFDataRef v16 = *(void **)(v15 + 24);
    uint64_t v22 = v16[23];
    if (v22)
    {
      dispatch_release(v22);
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 184) = 0;
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      CFDataRef v16 = *(void **)(v15 + 24);
    }
  }
  uint64_t v23 = (const void *)v16[25];
  if (v23)
  {
    CFRelease(v23);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 200) = 0;
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    CFDataRef v16 = *(void **)(v15 + 24);
  }
  v24 = v16[24];
  if (v24)
  {
    dispatch_release(v24);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 192) = 0;
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    CFDataRef v16 = *(void **)(v15 + 24);
  }
  CFDictionaryRef v25 = (const void *)v16[26];
  if (v25)
  {
    CFRelease(v25);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 208) = 0;
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v15 + 24) = 0;
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 48)+ 32 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)+ 8), *(const void **)(a1 + 56));
  CFDictionaryRef v26 = *(const void **)(a1 + 56);
  CFRange v27 = *(__CFDictionary **)(*(void *)(a1 + 48) + 480);

  CFDictionaryRemoveValue(v27, v26);
}

void *__FigRoutingManagerContextUtilities_CopyHijackID_block_invoke(uint64_t a1)
{
  uint64_t result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    uint64_t result = (void *)result[2];
    if (result) {
      uint64_t result = CFRetain(result);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_SetAggregateEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    int v3 = ContextForUUIDFromDict;
    if (dword_1E9359DC0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CFArrayRef v5 = (const void *)*((void *)v3 + 8);
    CFIndex v6 = *(const void **)(a1 + 56);
    *((void *)v3 + 8) = v6;
    if (v6) {
      CFRetain(v6);
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

void *__FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpointAggregate_block_invoke(uint64_t a1)
{
  uint64_t result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    uint64_t result = (void *)result[8];
    if (result) {
      uint64_t result = CFRetain(result);
    }
    **(void **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void *__FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpoint_block_invoke(uint64_t a1)
{
  uint64_t result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    uint64_t result = (void *)result[8];
    if (result) {
      uint64_t result = CFRetain(result);
    }
    **(void **)(a1 + 56) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_CopyNonControlPickedContexts_block_invoke(uint64_t a1)
{
  int64_t Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480));
  int v3 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), v3, 0);
  if (Count >= 1)
  {
    CFIndex v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    CFIndex v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    CFIndex v8 = (void **)v3;
    do
    {
      ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *v8);
      if (*(_DWORD *)ContextForUUIDFromDict != 7 && *(_DWORD *)ContextForUUIDFromDict != 9)
      {
        CFIndex v11 = ContextForUUIDFromDict;
        uint64_t v12 = CFDictionaryCreateMutable(v4, 0, v6, v7);
        CFArrayRef v13 = v12;
        CFIndex v14 = (const void *)*((void *)v11 + 9);
        if (v14) {
          CFDictionarySetValue(v12, @"CurrentEndpoints", v14);
        }
        CFArrayRef v15 = (const __CFArray *)*((void *)v11 + 14);
        if (v15 && CFArrayGetCount(v15) >= 1) {
          CFDictionarySetValue(v13, @"CurrentlyActivatingEndpointsInfo", *((const void **)v11 + 14));
        }
        CFDataRef v16 = (const void *)*((void *)v11 + 15);
        if (v16) {
          CFDictionarySetValue(v13, @"ActivatedEndpointsInfo", v16);
        }
        CFDictionarySetValue(Mutable, *((const void **)v11 + 1), v13);
        if (v13) {
          CFRelease(v13);
        }
      }
      ++v8;
      --Count;
    }
    while (Count);
  }
  CFIndex v17 = *(__CFDictionary ***)(a1 + 40);
  if (v17)
  {
    *CFIndex v17 = Mutable;
    free(v3);
  }
  else
  {
    free(v3);
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
}

void __FigRoutingManagerContextUtilities_CopyAllRoutingContextUUIDs_block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  int v3 = Mutable;
  CFAllocatorRef v4 = *(void **)(a1 + 32);
  CFArrayRef v5 = (const void *)v4[66];
  if (v5)
  {
    CFArrayAppendValue(Mutable, v5);
    CFAllocatorRef v4 = *(void **)(a1 + 32);
  }
  CFIndex v6 = (const void *)v4[67];
  if (v6)
  {
    CFArrayAppendValue(v3, v6);
    CFAllocatorRef v4 = *(void **)(a1 + 32);
  }
  CFIndex v7 = (const void *)v4[68];
  if (v7)
  {
    CFArrayAppendValue(v3, v7);
    CFAllocatorRef v4 = *(void **)(a1 + 32);
  }
  CFIndex v8 = (const void *)v4[74];
  if (v8)
  {
    CFArrayAppendValue(v3, v8);
    CFAllocatorRef v4 = *(void **)(a1 + 32);
  }
  uint64_t v9 = (const void *)v4[69];
  if (v9)
  {
    CFArrayAppendValue(v3, v9);
    CFAllocatorRef v4 = *(void **)(a1 + 32);
  }
  CFArrayRef v10 = (const void *)v4[72];
  if (v10)
  {
    CFArrayAppendValue(v3, v10);
    CFAllocatorRef v4 = *(void **)(a1 + 32);
  }
  CFArrayRef v11 = (const __CFArray *)v4[75];
  if (v11)
  {
    CFIndex Count = CFArrayGetCount(v11);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      for (CFIndex i = 0; i != v13; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 600), i);
        CFArrayAppendValue(v3, ValueAtIndex);
      }
    }
  }
  CFArrayRef v16 = *(const __CFArray **)(*(void *)(a1 + 32) + 608);
  if (v16)
  {
    CFIndex v17 = CFArrayGetCount(v16);
    if (v17 >= 1)
    {
      CFIndex v18 = v17;
      for (CFIndex j = 0; j != v18; ++j)
      {
        CFRange v20 = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 608), j);
        CFArrayAppendValue(v3, v20);
      }
    }
  }
  CFArrayRef v21 = *(const __CFArray **)(*(void *)(a1 + 32) + 616);
  if (v21)
  {
    CFIndex v22 = CFArrayGetCount(v21);
    if (v22 >= 1)
    {
      CFIndex v23 = v22;
      for (CFIndex k = 0; k != v23; ++k)
      {
        CFDictionaryRef v25 = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 616), k);
        CFArrayAppendValue(v3, v25);
      }
    }
  }
  CFDictionaryRef v26 = *(void **)(a1 + 40);
  if (v26)
  {
    if (v3)
    {
      CFTypeRef v27 = CFRetain(v3);
      CFDictionaryRef v26 = *(void **)(a1 + 40);
    }
    else
    {
      CFTypeRef v27 = 0;
    }
    *CFDictionaryRef v26 = v27;
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemRemoteDisplayContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 592);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySidePlayContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 552);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemRemotePoolContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 560);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemVideoContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 568);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopySystemAudioInputContextUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 584);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopyAudioContextUUIDs_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 616);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

CFTypeRef __FigRoutingManagerContextUtilities_CopyPerAppSecondDisplayContextUUIDs_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 600);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  **(void **)(a1 + 32) = result;
  return result;
}

void __FigRoutingManagerContextUtilities_CopyArrayOfFollowerUUIDs_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    int v3 = ContextForUUIDFromDict;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    CFArrayRef v5 = (const __CFArray *)*((void *)v3 + 11);
    if (v5)
    {
      CFIndex Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        for (CFIndex i = 0; i != v7; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)v3 + 11), i);
          ContextFromWeakRef = _routingContextUtilities_getContextFromWeakRef((uint64_t)ValueAtIndex);
          if (ContextFromWeakRef)
          {
            CFArrayRef v11 = (const void *)*((void *)ContextFromWeakRef + 1);
            if (v11) {
              CFArrayAppendValue(Mutable, v11);
            }
          }
        }
      }
    }
    uint64_t v12 = *(__CFArray ***)(a1 + 56);
    if (v12)
    {
      __CFDictionary *v12 = Mutable;
    }
    else if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

const UInt8 *__FigRoutingManagerContextUtilities_IsContextSidePlay_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*(_DWORD *)result == 12) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_IsContextSystemAudio_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

const UInt8 *__FigRoutingManagerContextUtilities_IsContextSystemRemoteDisplay_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  if (result)
  {
    if (*(_DWORD *)result == 14) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17422;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_UpdateRouteDescriptorForGivenContext_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    int v3 = ContextForUUIDFromDict;
    if ((*(_DWORD *)ContextForUUIDFromDict | 2) == 3) {
      FigRoutingContextUtilities_LogRouteDescriptors(*((const __CFArray **)ContextForUUIDFromDict + 16), *(const __CFArray **)(a1 + 56));
    }
    CFAllocatorRef v4 = (const void *)*((void *)v3 + 16);
    CFArrayRef v5 = *(const void **)(a1 + 56);
    *((void *)v3 + 16) = v5;
    if (v5) {
      CFRetain(v5);
    }
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

CFDictionaryRef *__FigRoutingManagerContextUtilities_GetMainVolumeScaleFactorForEndpointID_block_invoke(uint64_t a1)
{
  CFTypeRef result = (CFDictionaryRef *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    CFTypeRef result = (CFDictionaryRef *)CFDictionaryGetValue(result[18], *(const void **)(a1 + 56));
    if (result)
    {
      int v3 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      return (CFDictionaryRef *)CFNumberGetValue((CFNumberRef)result, kCFNumberFloat32Type, v3);
    }
  }
  return result;
}

void __FigRoutingManagerContextUtilities_SetMainVolumeScaleFactorForEndpointID_block_invoke(uint64_t a1)
{
  if (_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *(void **)(a1 + 40)))
  {
    CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat32Type, (const void *)(a1 + 56));
    FigCFDictionarySetValue();
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

void __FigRoutingManagerContextUtilities_SetScreenEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    int v3 = ContextForUUIDFromDict;
    CFAllocatorRef v4 = *(const void **)(a1 + 48);
    CFArrayRef v5 = (const void *)*((void *)v3 + 20);
    if (v4)
    {
      *((void *)v3 + 20) = v4;
      CFRetain(v4);
      if (v5)
      {
        CFRelease(v5);
      }
    }
    else if (v5)
    {
      CFRelease(*((CFTypeRef *)v3 + 20));
      *((void *)v3 + 20) = 0;
    }
  }
}

void *__FigRoutingManagerContextUtilities_CopyScreenEndpointUUID_block_invoke(uint64_t a1)
{
  CFTypeRef result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    CFTypeRef result = (void *)result[20];
    if (result)
    {
      CFTypeRef result = CFRetain(result);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

void __FigRoutingManagerContextUtilities_SetAudioEndpoint_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    int v3 = (const void *)*((void *)ContextForUUIDFromDict + 21);
    CFAllocatorRef v4 = *(const void **)(a1 + 48);
    *((void *)ContextForUUIDFromDict + 21) = v4;
    if (v4) {
      CFRetain(v4);
    }
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

uint64_t __FigRoutingManagerContextUtilities_IsRoutedToLocalAirplayReceiver_block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    uint64_t result = FigCFEqual();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __FigRoutingManagerContextUtilities_StopDiscoveryTimer_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    CFNumberRef v2 = ContextForUUIDFromDict;
    int v3 = *((void *)ContextForUUIDFromDict + 23);
    if (v3) {
      dispatch_source_cancel(v3);
    }
    CFAllocatorRef v4 = (const void *)*((void *)v2 + 25);
    if (v4)
    {
      CFRelease(v4);
      *((void *)v2 + 25) = 0;
    }
    CFArrayRef v5 = *((void *)v2 + 24);
    if (v5)
    {
      dispatch_release(v5);
      *((void *)v2 + 24) = 0;
    }
  }
}

void __FigRoutingManagerContextUtilities_StopMirroringTimer_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    CFNumberRef v2 = ContextForUUIDFromDict;
    if (*((void *)ContextForUUIDFromDict + 20))
    {
      if (dword_1E9359DC0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CFAllocatorRef v4 = *((void *)v2 + 22);
      if (v4)
      {
        dispatch_source_cancel(v4);
        CFArrayRef v5 = *((void *)v2 + 22);
        if (v5)
        {
          dispatch_release(v5);
          *((void *)v2 + 22) = 0;
        }
      }
      CFIndex v6 = (const void *)*((void *)v2 + 20);
      if (v6)
      {
        CFRelease(v6);
        *((void *)v2 + 20) = 0;
      }
    }
  }
}

void __FigRoutingManagerContextUtilities_CacheSupportedOutputChannelLayouts_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 480), *(void **)(a1 + 40));
  if (ContextForUUIDFromDict)
  {
    int v3 = (const void *)*((void *)ContextForUUIDFromDict + 26);
    CFAllocatorRef v4 = *(const void **)(a1 + 48);
    *((void *)ContextForUUIDFromDict + 26) = v4;
    if (v4) {
      CFRetain(v4);
    }
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

void __FigRoutingManagerContextUtilities_CopySupportedOutputChannelLayouts_block_invoke(uint64_t a1)
{
  ContextForUUIDFromDict = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (ContextForUUIDFromDict)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    CFAllocatorRef v4 = *(const void **)(v3 + 24);
    CFArrayRef v5 = (const void *)*((void *)ContextForUUIDFromDict + 26);
    *(void *)(v3 + 24) = v5;
    if (v5) {
      CFRetain(v5);
    }
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

@end