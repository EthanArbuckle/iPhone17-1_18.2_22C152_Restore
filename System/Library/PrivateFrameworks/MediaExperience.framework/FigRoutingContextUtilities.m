@interface FigRoutingContextUtilities
@end

@implementation FigRoutingContextUtilities

void *__FigRoutingContextUtilities_IsFollowingAnotherContext_block_invoke(uint64_t a1)
{
  result = (void *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    result = (void *)_routingContextUtilities_getLeaderWeakRef((uint64_t)result);
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

const UInt8 *__FigRoutingContextUtilities_SetLeaderUUIDForContext_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _routingContextUtilities_setLeaderUUIDForContext(*(void **)(a1 + 48), *(void **)(a1 + 56));
  result = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 64) + 480), *(void **)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __FigRoutingContextUtilities_UnfollowUUIDFromLeader_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 48) + 480), *(void **)(a1 + 56));
  LeaderWeakRef = _routingContextUtilities_getLeaderWeakRef(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  ContextFromWeakRef = _routingContextUtilities_getContextFromWeakRef((uint64_t)LeaderWeakRef);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v4) {
    BOOL v5 = ContextFromWeakRef == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -17420;
  }
  else
  {
    v6 = ContextFromWeakRef;
    CFIndex IndexOfFollower = _routingContextUtilities_getIndexOfFollower((uint64_t)ContextFromWeakRef, v4);
    if ((IndexOfFollower & 0x8000000000000000) == 0) {
      CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)v6 + 11), IndexOfFollower);
    }
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    _routingContextUtilities_removeLeader(v8);
  }
}

void __FigRoutingContextUtilities_CopyLeaderUUIDForContext_block_invoke(uint64_t a1)
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
          CFTypeRef v7 = (CFTypeRef)*((void *)BytePtr + 1);
          if (v7) {
            CFTypeRef v7 = CFRetain(v7);
          }
          **(void **)(a1 + 56) = v7;
        }
        CFRelease(v5);
      }
    }
    uint64_t v8 = *(void **)(a1 + 56);
    if (!*v8)
    {
      CFTypeRef v9 = *(CFTypeRef *)(v3 + 8);
      if (v9)
      {
        CFTypeRef v9 = CFRetain(v9);
        uint64_t v8 = *(void **)(a1 + 56);
      }
      *uint64_t v8 = v9;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -17420;
  }
}

CFIndex __FigRoutingContextUtilities_GetIndexOfCurrentlyActivatingSubEndpoints_block_invoke(uint64_t a1)
{
  CFIndex result = (CFIndex)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    CFIndex v3 = result;
    CFIndex v4 = 0;
    CFArrayRef v5 = *(const __CFArray **)(a1 + 56);
    while (1)
    {
      CFIndex result = *(void *)(v3 + 112);
      if (result) {
        CFIndex result = CFArrayGetCount((CFArrayRef)result);
      }
      if (v4 >= result) {
        break;
      }
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 112), v4);
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"CurrentlyActivatingEndpointsInfo_SubEndpoints");
      CFIndex result = MXCFArrayAreArrayContentsEqual(Value, v5);
      if (result) {
        goto LABEL_9;
      }
      ++v4;
    }
    CFIndex v4 = -1;
LABEL_9:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  }
  return result;
}

int *__FigRoutingContextUtilities_CreateStateInfoStringForContext_block_invoke(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  CFIndex result = (int *)_routingContextUtilities_getContextForUUIDFromDict(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 480), *(void **)(a1 + 48));
  if (result)
  {
    CFIndex v3 = result;
    [*(id *)(a1 + 32) appendFormat:@"[type: %@]\n", routingContextUtilities_getFeatureString(*result)];
    [*(id *)(a1 + 32) appendFormat:@"[uuid: %@]\n", *((void *)v3 + 1)];
    [*(id *)(a1 + 32) appendFormat:@"[hijackID: %@]\n", *((void *)v3 + 2)];
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"[clientPID: %d]\n", v3[6]);
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"[avoidAuthPrompt: %hhu]\n", *((unsigned __int8 *)v3 + 28));
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"[routeSelectionClientPID: %d]\n", v3[8]);
    [*(id *)(a1 + 32) appendFormat:@"[groupID: %@]\n", *((void *)v3 + 5)];
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"[pickingState: %d]\n", v3[14]);
    CFIndex v4 = *(void **)(a1 + 32);
    CFArrayRef v5 = (const void *)*((void *)v3 + 8);
    if (v5) {
      CFStringRef v6 = (id)CFCopyDescription(v5);
    }
    else {
      CFStringRef v6 = @"NULL";
    }
    [v4 appendFormat:@"[aggregateEndpoint: %@]\n", v6];
    v70 = v3;
    uint64_t v71 = a1;
    v78 = *(void **)(a1 + 32);
    CFTypeRef v7 = (void *)*((void *)v3 + 9);
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v95 objects:v99 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v96;
      obuint64_t j = (id)*MEMORY[0x1E4F20E38];
      uint64_t v12 = *MEMORY[0x1E4F1CF80];
      uint64_t v13 = *MEMORY[0x1E4F20F28];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v96 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v95 + 1) + 8 * i);
          cf[0] = 0;
          v85[0] = 0;
          uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
          uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v17) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = 0;
          }
          v19 = *(void (**)(uint64_t, id, uint64_t, CFTypeRef *))(v18 + 48);
          if (v19) {
            v19(CMBaseObject, obj, v12, cf);
          }
          uint64_t v20 = FigEndpointGetCMBaseObject();
          uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v21) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = 0;
          }
          v23 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v22 + 48);
          if (v23) {
            v23(v20, v13, v12, v85);
          }
          [v8 appendFormat:@"endpoint: %@ endpointID: %@ endpointName: %@\n", v15, cf[0], v85[0]];
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          if (v85[0]) {
            CFRelease(v85[0]);
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v95 objects:v99 count:16];
      }
      while (v10);
    }
    [v78 appendFormat:@"[currentEndpoints: %@]\n", v8];
    [*(id *)(v71 + 32) appendFormat:@"[defaultLeaderUUID: %@]\n", *((void *)v70 + 12)];
    [*(id *)(v71 + 32) appendFormat:@"[commChannelUUID: %@]\n", *((void *)v70 + 13)];
    v79 = *(void **)(v71 + 32);
    v24 = (void *)*((void *)v70 + 14);
    id v25 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v26 = [v24 countByEnumeratingWithState:&v95 objects:v99 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v96;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v96 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t Value = FigCFDictionaryGetValue();
          uint64_t v31 = FigCFDictionaryGetValue();
          uint64_t v32 = FigCFDictionaryGetValue();
          [v25 appendFormat:@"endpoint: %@ clientRoutingContextUUID: %@ ClientRouteChangeOptions: %@ internalRouteChangeOptions:%@\r", Value, v31, v32, FigCFDictionaryGetValue()];
          CFArrayRef v33 = (const __CFArray *)FigCFDictionaryGetValue();
          CFIndex v34 = 0;
          if (v33)
          {
LABEL_32:
            CFIndex Count = CFArrayGetCount(v33);
            goto LABEL_34;
          }
          while (1)
          {
            CFIndex Count = 0;
LABEL_34:
            if (v34 >= Count) {
              break;
            }
            [v25 appendFormat:@"\tsubEndpoint: %@\r", CFArrayGetValueAtIndex(v33, v34++)];
            if (v33) {
              goto LABEL_32;
            }
          }
        }
        uint64_t v27 = [v24 countByEnumeratingWithState:&v95 objects:v99 count:16];
      }
      while (v27);
    }
    [v79 appendFormat:@"[currentlyActivatingEndpointsInfo: %@]\n", v25];
    v69 = *(void **)(v71 + 32);
    v36 = (void *)*((void *)v70 + 15);
    id obja = (id)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    *(_OWORD *)cf = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v72 = v36;
    uint64_t v75 = [v36 countByEnumeratingWithState:cf objects:v99 count:16];
    if (v75)
    {
      uint64_t v73 = *(void *)v92;
      uint64_t v80 = *MEMORY[0x1E4F20F28];
      uint64_t v77 = *MEMORY[0x1E4F20E38];
      theArray = Mutable;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v92 != v73) {
            objc_enumerationMutation(v72);
          }
          uint64_t v76 = v38;
          CFDictionaryRef v39 = (const __CFDictionary *)*((void *)cf[1] + v38);
          id v40 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          uint64_t v41 = FigCFDictionaryGetValue();
          uint64_t v42 = FigCFDictionaryGetValue();
          FigCFDictionaryGetValue();
          FigCFDictionaryGetValue();
          v43 = (void *)CFDictionaryGetValue(v39, @"ActivatedEndpointsInfo_SubEndpointsInfo");
          CFTypeRef v89 = 0;
          CFTypeRef v90 = 0;
          if (v41)
          {
            uint64_t v44 = FigEndpointGetCMBaseObject();
            uint64_t v45 = *(void *)(CMBaseObjectGetVTable() + 8);
            if (v45) {
              uint64_t v46 = v45;
            }
            else {
              uint64_t v46 = 0;
            }
            v47 = *(void (**)(uint64_t, uint64_t, id, CFTypeRef *))(v46 + 48);
            if (v47) {
              v47(v44, v80, obja, &v90);
            }
            uint64_t v48 = FigEndpointGetCMBaseObject();
            uint64_t v49 = *(void *)(CMBaseObjectGetVTable() + 8);
            if (v49) {
              uint64_t v50 = v49;
            }
            else {
              uint64_t v50 = 0;
            }
            v51 = *(void (**)(uint64_t, uint64_t, id, CFTypeRef *))(v50 + 48);
            if (v51) {
              v51(v48, v77, obja, &v89);
            }
          }
          CFTypeRef v53 = v89;
          CFTypeRef v52 = v90;
          uint64_t UInt64 = FigCFNumberGetUInt64();
          [v40 appendFormat:@"<endpoint %p endpointName: %@ endpointID %@ activationSeed %llu transportType: %@ endpointFeatures: %llu>\r", v41, v52, v53, UInt64, v42, FigCFNumberGetUInt64()];
          if (v90)
          {
            CFRelease(v90);
            CFTypeRef v90 = 0;
          }
          if (v89)
          {
            CFRelease(v89);
            CFTypeRef v89 = 0;
          }
          long long v87 = 0u;
          long long v88 = 0u;
          *(_OWORD *)v85 = 0u;
          long long v86 = 0u;
          uint64_t v55 = [v43 countByEnumeratingWithState:v85 objects:&v95 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v86;
            do
            {
              for (uint64_t k = 0; k != v56; ++k)
              {
                if (*(void *)v86 != v57) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v59 = FigCFDictionaryGetValue();
                FigCFDictionaryGetValue();
                CFTypeRef v83 = 0;
                CFTypeRef v84 = 0;
                if (v59)
                {
                  uint64_t v60 = FigEndpointGetCMBaseObject();
                  uint64_t v61 = *(void *)(CMBaseObjectGetVTable() + 8);
                  if (v61) {
                    uint64_t v62 = v61;
                  }
                  else {
                    uint64_t v62 = 0;
                  }
                  v63 = *(void (**)(uint64_t, uint64_t, id, CFTypeRef *))(v62 + 48);
                  if (v63) {
                    v63(v60, v80, obja, &v84);
                  }
                  uint64_t v64 = FigEndpointGetCMBaseObject();
                  uint64_t v65 = *(void *)(CMBaseObjectGetVTable() + 8);
                  if (v65) {
                    uint64_t v66 = v65;
                  }
                  else {
                    uint64_t v66 = 0;
                  }
                  v67 = *(void (**)(uint64_t, uint64_t, id, CFTypeRef *))(v66 + 48);
                  if (v67) {
                    v67(v64, v77, obja, &v83);
                  }
                }
                [v40 appendFormat:@"\t<subEndpoint %p subEndpointName: %@ subEndpointID %@ activationSeed %llu>\r", v59, v84, v83, FigCFNumberGetUInt64()];
                if (v84)
                {
                  CFRelease(v84);
                  CFTypeRef v84 = 0;
                }
                if (v83) {
                  CFRelease(v83);
                }
              }
              uint64_t v56 = [v43 countByEnumeratingWithState:v85 objects:&v95 count:16];
            }
            while (v56);
          }
          CFMutableArrayRef Mutable = theArray;
          CFArrayAppendValue(theArray, v40);

          uint64_t v38 = v76 + 1;
        }
        while (v76 + 1 != v75);
        uint64_t v75 = [v72 countByEnumeratingWithState:cf objects:v99 count:16];
      }
      while (v75);
    }
    id v68 = (id)[(__CFArray *)Mutable componentsJoinedByString:@"\n"];
    if (Mutable) {
      CFRelease(Mutable);
    }
    [v69 appendFormat:@"[activatedEndpointsInfo: %@]\n", v68];
    [*(id *)(v71 + 32) appendFormat:@"[currentPickedRouteDescriptors: %@]\n", *((void *)v70 + 16)];
    objc_msgSend(*(id *)(v71 + 32), "appendFormat:", @"[multiRouteSelectionSucceeded: %hhu]\n", *((unsigned __int8 *)v70 + 136));
    [*(id *)(v71 + 32) appendFormat:@"[scaleFactorsForEndpoints: %@]\n", *((void *)v70 + 18)];
    objc_msgSend(*(id *)(v71 + 32), "appendFormat:", @"[mainVolume: %f]\n", *((float *)v70 + 38));
    [*(id *)(v71 + 32) appendFormat:@"[cachedScreenEndpointID: %@]\n", *((void *)v70 + 20)];
    [*(id *)(v71 + 32) appendFormat:@"[cachedAudioEndpointID: %@]\n", *((void *)v70 + 21)];
    return (int *)[*(id *)(v71 + 32) appendFormat:@"[supportedOutputChannelLayouts: %@]\n", *((void *)v70 + 26)];
  }
  return result;
}

@end