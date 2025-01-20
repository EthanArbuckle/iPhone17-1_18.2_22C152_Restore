@interface MXEndpointDescriptorCache
+ (id)sharedInstance;
- (MXEndpointDescriptorCache)init;
- (OpaqueFigEndpoint)copyEndpointFromRouteDescriptor:(__CFDictionary *)a3 routingContextUUID:(__CFString *)a4 retryCount:(unint64_t)a5;
- (OpaqueFigEndpoint)copyEndpointWithDeviceID:(__CFString *)a3 isStreamID:(BOOL)a4 managerType:(__CFString *)a5 routingContextUUID:(__CFString *)a6;
- (OpaqueFigEndpointManager)getEndpointManagerForType:(__CFString *)a3;
- (OpaqueFigReentrantMutex)_getCacheMutex;
- (__CFArray)_copyEndpoints:(__CFArray *)a3 withPredicate:(id)a4;
- (__CFArray)_copyMatchingEndpointsForManagerType:(__CFString *)a3 predicateMatchFunction:(void *)a4 inEndpointPredicateRefCon:(void *)a5;
- (__CFArray)copyAvailableEndpointsForManager:(OpaqueFigEndpointManager *)a3;
- (__CFArray)copyAvailableRouteDescriptorsForManager:(OpaqueFigEndpointManager *)a3;
- (__CFArray)copyRegisteredEndpointMangers;
- (__CFArray)copyRouteDescriptorsForEndpoints:(__CFArray *)a3;
- (__CFDictionary)copyRouteDescriptorForEndpoint:(OpaqueFigEndpoint *)a3;
- (void)_availableEndpointsDidChangeForEndpointManager:(OpaqueFigEndpointManager *)a3 atDate:(id)a4;
- (void)_endpointDescriptionDidChangeForEndpoint:(OpaqueFigEndpoint *)a3;
- (void)_endpointDescriptionDidChangeForEndpoint:(OpaqueFigEndpoint *)a3 notificationName:(__CFString *)a4 payload:(__CFDictionary *)a5;
- (void)dealloc;
- (void)registerEndpointManagerForCaching:(OpaqueFigEndpointManager *)a3;
@end

@implementation MXEndpointDescriptorCache

void __83__MXEndpointDescriptorCache__availableEndpointsDidChangeForEndpointManager_atDate___block_invoke_2(const void **a1)
{
  FigRoutingManagerAvailableEndpointsDidChangeForEndpointManager(a1[4], a1[5], a1[6], a1[7]);
  v2 = a1[4];
  if (v2) {
    CFRelease(v2);
  }
  v3 = a1[5];
  if (v3) {
    CFRelease(v3);
  }
  v4 = a1[6];
  if (v4) {
    CFRelease(v4);
  }
  v5 = a1[7];
  if (v5)
  {
    CFRelease(v5);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1) {
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_76);
  }
  return (id)sharedInstance_sSharedInstance_12;
}

- (__CFArray)copyRegisteredEndpointMangers
{
  MEMORY[0x199716E90](self->_cacheMutex, a2);
  registeredEndpointManagers = self->_registeredEndpointManagers;
  if (registeredEndpointManagers) {
    Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], registeredEndpointManagers);
  }
  else {
    Copy = 0;
  }
  MEMORY[0x199716EA0](self->_cacheMutex);
  return Copy;
}

- (__CFArray)copyRouteDescriptorsForEndpoints:(__CFArray *)a3
{
  MEMORY[0x199716E90](self->_cacheMutex, a2);
  v4 = MXEndpointDescriptorCopyAvailableRouteDescriptorsFromEndpoints(self->_availableEndpointsInfo);
  MEMORY[0x199716EA0](self->_cacheMutex);
  return v4;
}

- (OpaqueFigEndpointManager)getEndpointManagerForType:(__CFString *)a3
{
  MEMORY[0x199716E90](self->_cacheMutex, a2);
  CFIndex v4 = 0;
  uint64_t v5 = *MEMORY[0x1E4F20620];
  uint64_t v6 = *MEMORY[0x1E4F1CF80];
  while (1)
  {
    CFArrayRef registeredEndpointManagers = self->_registeredEndpointManagers;
    if (registeredEndpointManagers) {
      CFArrayRef registeredEndpointManagers = (const __CFArray *)CFArrayGetCount(registeredEndpointManagers);
    }
    if (v4 >= (uint64_t)registeredEndpointManagers)
    {
      ValueAtIndex = 0;
      goto LABEL_17;
    }
    ValueAtIndex = (OpaqueFigEndpointManager *)CFArrayGetValueAtIndex(self->_registeredEndpointManagers, v4);
    CFTypeRef cf = 0;
    uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v11 + 48);
    if (v12) {
      v12(CMBaseObject, v5, v6, &cf);
    }
    if (FigCFEqual()) {
      break;
    }
    if (cf) {
      CFRelease(cf);
    }
    ++v4;
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_17:
  MEMORY[0x199716EA0](self->_cacheMutex);
  return ValueAtIndex;
}

- (__CFArray)copyAvailableEndpointsForManager:(OpaqueFigEndpointManager *)a3
{
  v15 = 0;
  if (a3)
  {
    CFTypeRef cf = 0;
    uint64_t v4 = *MEMORY[0x1E4F1CF80];
    uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v7 + 48);
    if (v8) {
      v8(CMBaseObject, *MEMORY[0x1E4F20620], v4, &cf);
    }
    if (FigCFEqual())
    {
      uint64_t v9 = FigEndpointManagerGetCMBaseObject();
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      v12 = *(void (**)(uint64_t, void, uint64_t, __CFArray **))(v11 + 48);
      if (v12) {
        v12(v9, *MEMORY[0x1E4F20608], v4, &v15);
      }
    }
    else
    {
      MEMORY[0x199716E90](self->_cacheMutex);
      v15 = MXEndpointDescriptorCopyReducedForManager(self->_availableEndpointsInfo, @"Endpoint");
      MEMORY[0x199716EA0](self->_cacheMutex);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  return v15;
}

- (OpaqueFigReentrantMutex)_getCacheMutex
{
  return self->_cacheMutex;
}

- (void)_availableEndpointsDidChangeForEndpointManager:(OpaqueFigEndpointManager *)a3 atDate:(id)a4
{
  v45[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFTypeRef v43 = 0;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, void, const __CFAllocator *, CFTypeRef *))(v8 + 48);
  if (v9) {
    v9(CMBaseObject, *MEMORY[0x1E4F20620], allocator, &v43);
  }
  if (dword_1E9359ED0)
  {
    int v42 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFTypeRef cf = 0;
  uint64_t v11 = FigEndpointManagerGetCMBaseObject();
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = *(void (**)(uint64_t, void, const __CFAllocator *, CFTypeRef *))(v13 + 48);
  if (v14) {
    v14(v11, *MEMORY[0x1E4F20608], allocator, &cf);
  }
  v15 = -[MXEndpointDescriptorCache _copyEndpoints:withPredicate:](self, "_copyEndpoints:withPredicate:", cf, &__block_literal_global_19_0, v32, v33);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  v16 = MXEndpointDescriptorCopyReducedForManager(self->_availableEndpointsInfo, @"Endpoint");
  v17 = MXCopyCFArrayDifferenceFromArray((uint64_t)v16, v15);
  v35 = v16;
  v36 = v15;
  theArray = MXCopyCFArrayDifferenceFromArray((uint64_t)v15, v16);
  if (theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      MXEndpointDescriptorLogRouteDelta((uint64_t)v43, self->_availableEndpointsInfo, (uint64_t)theArray, 1);
      availableEndpointsInfo = self->_availableEndpointsInfo;
      if (availableEndpointsInfo)
      {
        CFIndex Count = CFArrayGetCount(self->_availableEndpointsInfo);
        if (Count >= 1)
        {
          CFIndex v20 = Count;
          for (CFIndex i = 0; i < v20; ++i)
          {
            CFArrayGetValueAtIndex(availableEndpointsInfo, i);
            FigCFDictionaryGetValue();
            if (FigCFArrayContainsValue())
            {
              CMNotificationCenterGetDefaultLocalCenter();
              +[MXEndpointDescriptorCache sharedInstance];
              CMNotificationCenterRemoveListener();
              CFArrayRemoveValueAtIndex(availableEndpointsInfo, i--);
              CFIndex v20 = CFArrayGetCount(availableEndpointsInfo);
            }
          }
        }
      }
    }
  }
  if (v17 && CFArrayGetCount(v17))
  {
    v34 = self;
    v22 = self->_availableEndpointsInfo;
    if (CFArrayGetCount(v17) >= 1)
    {
      CFIndex v23 = 0;
      uint64_t v37 = *MEMORY[0x1E4F20FC0];
      v24 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
      do
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], v24);
        FigCFDictionarySetValue();
        CFArrayGetValueAtIndex(v17, v23);
        FigCFDictionarySetValue();
        v45[0] = 0;
        CFArrayGetValueAtIndex(v17, v23);
        uint64_t v26 = FigEndpointGetCMBaseObject();
        uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v27) {
          uint64_t v28 = v27;
        }
        else {
          uint64_t v28 = 0;
        }
        v29 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(v28 + 48);
        if (v29) {
          v29(v26, v37, allocator, v45);
        }
        FigCFDictionarySetValue();
        if (v45[0])
        {
          CFRelease(v45[0]);
          v45[0] = 0;
        }
        CFArrayAppendValue(v22, Mutable);
        if (Mutable) {
          CFRelease(Mutable);
        }
        ++v23;
      }
      while (v23 < CFArrayGetCount(v17));
    }
    if (CFArrayGetCount(v17) >= 1)
    {
      CFIndex v30 = 0;
      do
      {
        CFArrayGetValueAtIndex(v17, v30);
        FigEndpointDescriptorUtility_IsEndpointOfType();
        CMNotificationCenterGetDefaultLocalCenter();
        +[MXEndpointDescriptorCache sharedInstance];
        CMNotificationCenterAddListener();
        [+[MXEndpointDescriptorCache sharedInstance]];
      }
      while (v30 < CFArrayGetCount(v17));
    }
    self = v34;
    MXEndpointDescriptorLogRouteDelta((uint64_t)v43, v34->_availableEndpointsInfo, (uint64_t)v17, 0);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (v36) {
    CFRetain(v36);
  }
  if (v17) {
    CFRetain(v17);
  }
  if (theArray) {
    CFRetain(theArray);
  }
  notificationQueue = self->_notificationQueue;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __83__MXEndpointDescriptorCache__availableEndpointsDidChangeForEndpointManager_atDate___block_invoke_2;
  v40[3] = &__block_descriptor_64_e5_v8__0l;
  v40[4] = a3;
  v40[5] = v36;
  v40[6] = v17;
  v40[7] = theArray;
  MXDispatchAsync((uint64_t)"-[MXEndpointDescriptorCache _availableEndpointsDidChangeForEndpointManager:atDate:]", (uint64_t)"MXEndpointDescriptorCache.m", 792, 0, 0, notificationQueue, (uint64_t)v40);
  if (v43)
  {
    CFRelease(v43);
    CFTypeRef v43 = 0;
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v36) {
    CFRelease(v36);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (theArray) {
    CFRelease(theArray);
  }
}

- (__CFArray)_copyEndpoints:(__CFArray *)a3 withPredicate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(__CFArray *)a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(const void **)(*((void *)&v13 + 1) + 8 * i);
        if ((*((unsigned int (**)(id, const void *))a4 + 2))(a4, v11)) {
          CFArrayAppendValue(v6, v11);
        }
      }
      uint64_t v8 = [(__CFArray *)a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v6;
}

MXEndpointDescriptorCache *__43__MXEndpointDescriptorCache_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXEndpointDescriptorCache);
  sharedInstance_sSharedInstance_12 = (uint64_t)result;
  return result;
}

- (MXEndpointDescriptorCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)MXEndpointDescriptorCache;
  v2 = [(MXEndpointDescriptorCache *)&v7 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v4 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    v2->_CFArrayRef registeredEndpointManagers = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    v2->_availableEndpointsInfo = CFArrayCreateMutable(v3, 0, v4);
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.mxendpointdescriptor.notificationQueue", v5);
    v2->_cacheMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
  }
  return v2;
}

- (void)dealloc
{
  CFArrayRef registeredEndpointManagers = self->_registeredEndpointManagers;
  if (registeredEndpointManagers) {
    CFRelease(registeredEndpointManagers);
  }
  self->_CFArrayRef registeredEndpointManagers = 0;
  availableEndpointsInfo = self->_availableEndpointsInfo;
  if (availableEndpointsInfo) {
    CFRelease(availableEndpointsInfo);
  }
  self->_availableEndpointsInfo = 0;
  dispatch_release((dispatch_object_t)self->_notificationQueue);
  self->_notificationQueue = 0;
  FigSimpleMutexDestroy();
  self->_cacheMutex = 0;
  v5.receiver = self;
  v5.super_class = (Class)MXEndpointDescriptorCache;
  [(MXEndpointDescriptorCache *)&v5 dealloc];
}

- (void)registerEndpointManagerForCaching:(OpaqueFigEndpointManager *)a3
{
  cf[20] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (a3)
  {
    MEMORY[0x199716E90](self->_cacheMutex, a2);
    if (!FigCFArrayContainsValue())
    {
      cf[0] = 0;
      uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v7 + 48);
      if (v8) {
        v8(CMBaseObject, *MEMORY[0x1E4F20620], *MEMORY[0x1E4F1CF80], cf);
      }
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (FigCFEqual())
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        CFArrayInsertValueAtIndex(self->_registeredEndpointManagers, 0, a3);
      }
      else
      {
        CFArrayAppendValue(self->_registeredEndpointManagers, a3);
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        -[MXEndpointDescriptorCache _availableEndpointsDidChangeForEndpointManager:atDate:](self, "_availableEndpointsDidChangeForEndpointManager:atDate:", a3, [MEMORY[0x1E4F1C9C8] date]);
      }
      if (cf[0]) {
        CFRelease(cf[0]);
      }
    }
    MEMORY[0x199716EA0](self->_cacheMutex);
  }
}

- (__CFArray)copyAvailableRouteDescriptorsForManager:(OpaqueFigEndpointManager *)a3
{
  if (!a3) {
    return 0;
  }
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7) {
    v7(CMBaseObject, *MEMORY[0x1E4F20620], *MEMORY[0x1E4F1CF80], &cf);
  }
  MEMORY[0x199716E90](self->_cacheMutex);
  uint64_t v8 = MXEndpointDescriptorCopyReducedForManager(self->_availableEndpointsInfo, @"RouteDescriptor");
  MEMORY[0x199716EA0](self->_cacheMutex);
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

- (__CFDictionary)copyRouteDescriptorForEndpoint:(OpaqueFigEndpoint *)a3
{
  if (!a3) {
    return 0;
  }
  MEMORY[0x199716E90](self->_cacheMutex, a2);
  [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  uint64_t v5 = MXEndpointDescriptorCopyAvailableRouteDescriptorsFromEndpoints(self->_availableEndpointsInfo);
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5) && (ValueAtIndex = CFArrayGetValueAtIndex(v6, 0)) != 0) {
      uint64_t v8 = (__CFDictionary *)CFRetain(ValueAtIndex);
    }
    else {
      uint64_t v8 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
  MEMORY[0x199716EA0](self->_cacheMutex);
  return v8;
}

- (OpaqueFigEndpoint)copyEndpointWithDeviceID:(__CFString *)a3 isStreamID:(BOOL)a4 managerType:(__CFString *)a5 routingContextUUID:(__CFString *)a6
{
  BOOL v42 = a4;
  if (!a3) {
    return 0;
  }
  int ContextType = FigRoutingManagerContextUtilities_GetContextType((uint64_t)a6);
  MEMORY[0x199716E90](self->_cacheMutex);
  CFArrayRef registeredEndpointManagers = self->_registeredEndpointManagers;
  if (registeredEndpointManagers && (CFIndex v11 = CFArrayGetCount(registeredEndpointManagers), v11 >= 1))
  {
    CFIndex v12 = v11;
    CFIndex v13 = 0;
    CFMutableDictionaryRef Mutable = 0;
    uint64_t v44 = *MEMORY[0x1E4F20620];
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    int v43 = ContextType;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_registeredEndpointManagers, v13);
      CFTypeRef cf = 0;
      uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
      uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 0;
      }
      CFIndex v20 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(v19 + 48);
      if (v20) {
        v20(CMBaseObject, v44, v15, &cf);
      }
      if (FigCFEqual() && !FigRoutingManagerShouldSkipEndpointManager())
      {
        if (FigCFEqual())
        {
          CFArrayRef theArray = 0;
          if (ContextType == 13)
          {
            uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 24);
            if (v22) {
              uint64_t v23 = v22;
            }
            else {
              uint64_t v23 = 0;
            }
            uint64_t v28 = *(void (**)(const void *, uint64_t, const __CFAllocator *, void, void, CFArrayRef *))(v23 + 24);
            if (v28) {
              v28(ValueAtIndex, 0x1EE5F36A8, v15, 0, 0, &theArray);
            }
          }
          else
          {
            uint64_t v25 = FigEndpointManagerGetCMBaseObject();
            uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
            if (v26) {
              uint64_t v27 = v26;
            }
            else {
              uint64_t v27 = 0;
            }
            v29 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFArrayRef *))(v27 + 48);
            if (v29) {
              v29(v25, 0x1EE5F3688, v15, &theArray);
            }
          }
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v15, 0, MEMORY[0x1E4F1D510]);
          if (theArray)
          {
            CFIndex Count = CFArrayGetCount(theArray);
            if (Count >= 1)
            {
              CFIndex v31 = Count;
              for (CFIndex i = 0; i != v31; ++i)
              {
                uint64_t v33 = CFArrayGetValueAtIndex(theArray, i);
                if (FigEndpointUtility_EndpointPredicate_ContainsID()) {
                  CFArrayAppendValue(Mutable, v33);
                }
              }
            }
          }
          if (Mutable && !CFArrayGetCount(Mutable))
          {
            CFRelease(Mutable);
            CFMutableDictionaryRef Mutable = 0;
          }
          int ContextType = v43;
          if (theArray) {
            CFRelease(theArray);
          }
        }
        else
        {
          if (v42) {
            uint64_t v24 = MEMORY[0x1E4F1EB70];
          }
          else {
            uint64_t v24 = MEMORY[0x1E4F1EB68];
          }
          CFMutableDictionaryRef Mutable = [(MXEndpointDescriptorCache *)self _copyMatchingEndpointsForManagerType:a5 predicateMatchFunction:v24 inEndpointPredicateRefCon:a3];
        }
        int v21 = 1;
      }
      else
      {
        int v21 = 0;
      }
      if (cf) {
        CFRelease(cf);
      }
      if (++v13 == v12) {
        int v34 = 1;
      }
      else {
        int v34 = v21;
      }
    }
    while (v34 != 1);
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
  }
  if (FigCFEqual())
  {
    if (Mutable) {
      CFIndex v35 = CFArrayGetCount(Mutable);
    }
    else {
      CFIndex v35 = 0;
    }
    if (ContextType == 7 || ContextType == 9)
    {
      if (v35 < 1) {
        goto LABEL_71;
      }
      CFIndex v38 = 0;
      while (1)
      {
        v39 = CFArrayGetValueAtIndex(Mutable, v38);
        if ((FigEndpointGetSupportedFeatures() & 0x10) != 0) {
          break;
        }
        if (v35 == ++v38) {
          goto LABEL_71;
        }
      }
    }
    else
    {
      if (v35 < 1) {
        goto LABEL_71;
      }
      CFIndex v40 = 0;
      while (1)
      {
        v39 = CFArrayGetValueAtIndex(Mutable, v40);
        if ((FigEndpointGetSupportedFeatures() & 0x10) == 0) {
          break;
        }
        if (v35 == ++v40) {
          goto LABEL_71;
        }
      }
    }
    if (v39)
    {
      uint64_t v37 = (OpaqueFigEndpoint *)CFRetain(v39);
      goto LABEL_72;
    }
LABEL_71:
    uint64_t v37 = 0;
LABEL_72:
    if (!Mutable) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
  if (!Mutable)
  {
    uint64_t v37 = 0;
    goto LABEL_76;
  }
  if (CFArrayGetCount(Mutable) >= 1 && (v36 = CFArrayGetValueAtIndex(Mutable, 0)) != 0) {
    uint64_t v37 = (OpaqueFigEndpoint *)CFRetain(v36);
  }
  else {
    uint64_t v37 = 0;
  }
LABEL_75:
  CFRelease(Mutable);
LABEL_76:
  MEMORY[0x199716EA0](self->_cacheMutex);
  return v37;
}

- (OpaqueFigEndpoint)copyEndpointFromRouteDescriptor:(__CFDictionary *)a3 routingContextUUID:(__CFString *)a4 retryCount:(unint64_t)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t Value = FigCFDictionaryGetValue();
  if (!Value) {
    goto LABEL_99;
  }
  uint64_t v10 = Value;
  unint64_t v56 = a5;
  v57 = a4;
  int ContextType = (MXEndpointDescriptorCache *)FigRoutingManagerContextUtilities_GetContextType((uint64_t)a4);
  MEMORY[0x199716E90](self->_cacheMutex);
  theDict = a3;
  CFDictionaryGetValue(a3, @"AudioRouteName");
  CFIndex v12 = 0;
  CFIndex v13 = 0;
  uint64_t v58 = *MEMORY[0x1E4F20620];
  uint64_t v14 = *MEMORY[0x1E4F1CF80];
  uint64_t v59 = *MEMORY[0x1E4F20660];
  while (1)
  {
    CFArrayRef registeredEndpointManagers = self->_registeredEndpointManagers;
    if (registeredEndpointManagers) {
      CFArrayRef registeredEndpointManagers = (const __CFArray *)CFArrayGetCount(registeredEndpointManagers);
    }
    if (v13 >= (uint64_t)registeredEndpointManagers)
    {
      uint64_t v24 = v12;
      goto LABEL_28;
    }
    ValueAtIndex = CFArrayGetValueAtIndex(self->_registeredEndpointManagers, v13);
    if (!FigRoutingManagerShouldSkipEndpointManager()) {
      break;
    }
LABEL_24:
    ++v13;
  }
  v17 = ValueAtIndex;
  uint64_t v18 = ContextType;
  int ContextType = self;
  v68[0] = 0;
  uint64_t v19 = v17;
  uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
  uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v22 + 48);
  if (v23) {
    v23(CMBaseObject, v58, v14, v68);
  }
  if (!FigCFEqual() || !FigCFEqual())
  {
    self = ContextType;
    int ContextType = v18;
    if (FigCFEqual() && v18 != 13 && (FigCFEqual() || FigCFEqual()))
    {
      if (!CFDictionaryGetValue(theDict, @"PortNumber")) {
        goto LABEL_26;
      }
      goto LABEL_22;
    }
    if (!FigCFEqual() || (CFIndex v12 = v19, v18 != 13))
    {
LABEL_22:
      if (v68[0]) {
        CFRelease(v68[0]);
      }
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v24 = v19;
    CFTypeRef v25 = v68[0];
    if (!v68[0]) {
      goto LABEL_28;
    }
LABEL_27:
    CFRelease(v25);
    goto LABEL_28;
  }
  CFTypeRef v25 = v68[0];
  self = ContextType;
  LODWORD(ContextType) = v18;
  uint64_t v24 = v19;
  if (v68[0]) {
    goto LABEL_27;
  }
LABEL_28:
  a3 = theDict;
  if (!v24)
  {
    MEMORY[0x199716EA0](self->_cacheMutex);
    a5 = v56;
    a4 = v57;
    goto LABEL_99;
  }
  if (ContextType == 13)
  {
    v68[0] = 0;
    uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v26) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    v61 = self;
    CFIndex v30 = *(void (**)(const void *, uint64_t, uint64_t, void, void, CFTypeRef *))(v27 + 24);
    if (v30) {
      v30(v24, 0x1EE5F36A8, v14, 0, 0, v68);
    }
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v32 = (id)v68[0];
    uint64_t v33 = [(id)v68[0] countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v64;
      uint64_t v36 = *MEMORY[0x1E4F20E38];
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v64 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v38 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          CFTypeRef cf = 0;
          uint64_t v39 = FigEndpointGetCMBaseObject();
          uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v40) {
            uint64_t v41 = v40;
          }
          else {
            uint64_t v41 = 0;
          }
          BOOL v42 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v41 + 48);
          if (v42) {
            v42(v39, v36, v14, &cf);
          }
          if ([(id)cf containsString:v10]) {
            [v31 addObject:v38];
          }
          if (cf) {
            CFRelease(cf);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v34);
    }
    v29 = (__CFArray *)v31;

    if (v68[0]) {
      CFRelease(v68[0]);
    }
    a3 = theDict;
    self = v61;
    LODWORD(ContextType) = 13;
  }
  else
  {
    uint64_t v28 = [(MXEndpointDescriptorCache *)self copyAvailableEndpointsForManager:v24];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __91__MXEndpointDescriptorCache_copyEndpointFromRouteDescriptor_routingContextUUID_retryCount___block_invoke;
    v62[3] = &__block_descriptor_40_e28_B16__0__OpaqueFigEndpoint__8l;
    v62[4] = v10;
    v29 = [(MXEndpointDescriptorCache *)self _copyEndpoints:v28 withPredicate:v62];
    if (v28) {
      CFRelease(v28);
    }
  }
  v68[0] = 0;
  uint64_t v43 = FigEndpointManagerGetCMBaseObject();
  uint64_t v44 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v44) {
    uint64_t v45 = v44;
  }
  else {
    uint64_t v45 = 0;
  }
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v45 + 48);
  if (v46) {
    v46(v43, v58, v14, v68);
  }
  FigRoutingManagerLogEndpointIDs(@"The matching endpoints are:", v29, 0, 1);
  if (!FigCFEqual())
  {
    a5 = v56;
    a4 = v57;
    if (!v29 || CFArrayGetCount(v29) < 1)
    {
      v52 = 0;
      goto LABEL_91;
    }
    v48 = self;
    v49 = a3;
    v50 = CFArrayGetValueAtIndex(v29, 0);
    if (v50) {
      goto LABEL_87;
    }
    goto LABEL_88;
  }
  a5 = v56;
  a4 = v57;
  if (v29) {
    CFIndex Count = CFArrayGetCount(v29);
  }
  else {
    CFIndex Count = 0;
  }
  v48 = self;
  if (ContextType != 7 && ContextType != 9)
  {
    if (Count < 1) {
      goto LABEL_85;
    }
    v49 = a3;
    CFIndex v53 = 0;
    while (1)
    {
      v50 = CFArrayGetValueAtIndex(v29, v53);
      if ((FigEndpointGetSupportedFeatures() & 0x10) == 0) {
        break;
      }
      if (Count == ++v53) {
        goto LABEL_88;
      }
    }
LABEL_86:
    if (v50)
    {
LABEL_87:
      v52 = (OpaqueFigEndpoint *)CFRetain(v50);
LABEL_89:
      a3 = v49;
      goto LABEL_90;
    }
LABEL_88:
    v52 = 0;
    goto LABEL_89;
  }
  if (Count >= 1)
  {
    v49 = a3;
    CFIndex v51 = 0;
    while (1)
    {
      v50 = CFArrayGetValueAtIndex(v29, v51);
      if ((FigEndpointGetSupportedFeatures() & 0x10) != 0) {
        goto LABEL_86;
      }
      if (Count == ++v51) {
        goto LABEL_88;
      }
    }
  }
LABEL_85:
  v52 = 0;
LABEL_90:
  self = v48;
LABEL_91:
  if (v68[0])
  {
    CFRelease(v68[0]);
    v68[0] = 0;
  }
  if (v29) {
    CFRelease(v29);
  }
  MEMORY[0x199716EA0](self->_cacheMutex);
  if (!v52
    || FigRoutingManagerIsEndpointOfType((uint64_t)v52)
    && CMSMVAUtility_IsPortAvailableForEndpoint((uint64_t)v52, 0)
    && (CFRelease(v52), (v52 = (OpaqueFigEndpoint *)FigRoutingManagerCopyEndpointWithDeviceID(v10, 0, v59, 0)) == 0))
  {
LABEL_99:
    if (a5)
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      usleep(0x186A0u);
      return [(MXEndpointDescriptorCache *)self copyEndpointFromRouteDescriptor:a3 routingContextUUID:a4 retryCount:a5 - 1];
    }
    else
    {
      return 0;
    }
  }
  return v52;
}

BOOL __91__MXEndpointDescriptorCache_copyEndpointFromRouteDescriptor_routingContextUUID_retryCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return !FigRoutingManagerIsEndpointDissociated(a2)
      && FigEndpointUtility_EndpointPredicate_ContainsID() != 0;
}

- (__CFArray)_copyMatchingEndpointsForManagerType:(__CFString *)a3 predicateMatchFunction:(void *)a4 inEndpointPredicateRefCon:(void *)a5
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  for (CFIndex i = 0; ; ++i)
  {
    CFArrayRef availableEndpointsInfo = self->_availableEndpointsInfo;
    if (availableEndpointsInfo) {
      CFArrayRef availableEndpointsInfo = (const __CFArray *)CFArrayGetCount(availableEndpointsInfo);
    }
    if (i >= (uint64_t)availableEndpointsInfo) {
      break;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(self->_availableEndpointsInfo, i);
    CFDictionaryGetValue(ValueAtIndex, @"ManagerType");
    uint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"Endpoint");
    if (FigCFEqual()
      && ((unsigned int (*)(const void *, void *))a4)(Value, a5)
      && !FigRoutingManagerIsEndpointDissociated((uint64_t)Value))
    {
      CFArrayAppendValue(Mutable, Value);
    }
  }
  return Mutable;
}

BOOL __83__MXEndpointDescriptorCache__availableEndpointsDidChangeForEndpointManager_atDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return !FigRoutingManagerIsEndpointDissociated(a2);
}

- (void)_endpointDescriptionDidChangeForEndpoint:(OpaqueFigEndpoint *)a3 notificationName:(__CFString *)a4 payload:(__CFDictionary *)a5
{
  if (a3)
  {
    for (CFIndex i = 0; ; ++i)
    {
      CFArrayRef availableEndpointsInfo = self->_availableEndpointsInfo;
      if (availableEndpointsInfo) {
        CFArrayRef availableEndpointsInfo = (const __CFArray *)CFArrayGetCount(availableEndpointsInfo);
      }
      if (i >= (uint64_t)availableEndpointsInfo) {
        break;
      }
      CFArrayGetValueAtIndex(self->_availableEndpointsInfo, i);
      FigCFDictionaryGetValue();
      if (FigCFEqual())
      {
        CFIndex v11 = FigEndpointDescriptorUtility_CopyDescriptorForNonVirtualAudioEndpoint((uint64_t)a3);
        FigCFDictionarySetValue();
        if (v11) {
          CFRelease(v11);
        }
      }
    }
    CFRetain(a3);
    if (a4) {
      CFRetain(a4);
    }
    if (a5) {
      CFRetain(a5);
    }
    notificationQueue = self->_notificationQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __95__MXEndpointDescriptorCache__endpointDescriptionDidChangeForEndpoint_notificationName_payload___block_invoke;
    v13[3] = &__block_descriptor_56_e5_v8__0l;
    v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    MXDispatchAsync((uint64_t)"-[MXEndpointDescriptorCache _endpointDescriptionDidChangeForEndpoint:notificationName:payload:]", (uint64_t)"MXEndpointDescriptorCache.m", 826, 0, 0, notificationQueue, (uint64_t)v13);
  }
}

void __95__MXEndpointDescriptorCache__endpointDescriptionDidChangeForEndpoint_notificationName_payload___block_invoke(const void **a1)
{
  FigRoutingManagerHandleFigEndpointDescriptionChangedNotificationFromCache(a1[4], a1[5], a1[6]);
  v2 = a1[4];
  if (v2) {
    CFRelease(v2);
  }
  CFAllocatorRef v3 = a1[5];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)_endpointDescriptionDidChangeForEndpoint:(OpaqueFigEndpoint *)a3
{
}

@end