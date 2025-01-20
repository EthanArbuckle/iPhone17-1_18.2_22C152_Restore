@interface AVFigEndpointFigRoutingContextOutputDeviceTranslator
+ (id)sharedOutputDeviceTranslator;
- (AVFigEndpointFigRoutingContextOutputDeviceTranslator)init;
- (id)initForUsingRouteConfigUpdatedNotification:(BOOL)a3;
- (id)outputDeviceFromRoutingContext:(OpaqueFigRoutingContext *)a3;
- (id)outputDevicesFromRoutingContext:(OpaqueFigRoutingContext *)a3;
- (id)predictedOutputDeviceFromRoutingContext:(OpaqueFigRoutingContext *)a3;
- (void)addOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 toRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6;
- (void)removeOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 fromRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6;
- (void)setOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 onRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6;
- (void)setOutputDevices:(id)a3 withOptions:(__CFDictionary *)a4 onRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6;
@end

@implementation AVFigEndpointFigRoutingContextOutputDeviceTranslator

+ (id)sharedOutputDeviceTranslator
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (AVFigEndpointFigRoutingContextOutputDeviceTranslator)init
{
  BOOL v3 = AVOutputContextUsesRouteConfigUpdatedNotification();
  return (AVFigEndpointFigRoutingContextOutputDeviceTranslator *)[(AVFigEndpointFigRoutingContextOutputDeviceTranslator *)self initForUsingRouteConfigUpdatedNotification:v3];
}

- (id)initForUsingRouteConfigUpdatedNotification:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVFigEndpointFigRoutingContextOutputDeviceTranslator;
  v4 = [(AVFigEndpointFigRoutingContextOutputDeviceTranslator *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_useRouteConfigUpdatedNotification = a3;
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)outputDeviceFromRoutingContext:(OpaqueFigRoutingContext *)a3
{
  CFTypeRef cf = 0;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(OpaqueFigRoutingContext *, CFTypeRef *))(v5 + 24);
  if (!v6) {
    return 0;
  }
  int v7 = v6(a3, &cf);
  CFTypeRef v8 = cf;
  if (v7)
  {
    v9 = 0;
    if (!cf) {
      return v9;
    }
    goto LABEL_7;
  }
  v9 = +[AVOutputDevice outputDeviceWithFigEndpoint:cf];
  CFTypeRef v8 = cf;
  if (cf) {
LABEL_7:
  }
    CFRelease(v8);
  return v9;
}

- (void)setOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 onRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  CFTypeRef v15 = 0;
  v11 = objc_alloc_init(AVEventWaiter);
  if (AVOutputDeviceGetFigEndpoint(a3, &v15))
  {
    v12 = AVMakeSelectEndpointOperation(a5, v15, a4, self->_useRouteConfigUpdatedNotification);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevice_withOptions_onRoutingContext_completionHandler___block_invoke;
    v14[3] = &unk_1E57B3CA8;
    v14[5] = v11;
    v14[6] = a6;
    v14[4] = v12;
    [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v12 setCompletionBlock:v14];
    [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v12 start];
    if ([(AVOperation *)v12 isFinished]) {
      [(AVEventWaiter *)v11 waitUntilEventIsCompleted];
    }
  }
  else
  {
    v13 = objc_alloc_init(AVOutputContextDestinationChange);
    [(AVOutputContextDestinationChange *)v13 markAsFailed];
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v13);
  }
}

uint64_t __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevice_withOptions_onRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 32) result]);
  id v2 = *(void **)(a1 + 40);
  return [v2 markEventAsCompleted];
}

- (id)outputDevicesFromRoutingContext:(OpaqueFigRoutingContext *)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFArrayRef theArray = 0;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  int v7 = *(unsigned int (**)(OpaqueFigRoutingContext *, CFArrayRef *))(v6 + 56);
  if (v7 && !v7(a3, &theArray))
  {
    for (CFIndex i = 0; ; ++i)
    {
      CFIndex Count = (CFIndex)theArray;
      if (theArray) {
        CFIndex Count = CFArrayGetCount(theArray);
      }
      if (i >= Count) {
        break;
      }
      v10 = +[AVOutputDevice outputDeviceWithFigEndpoint:CFArrayGetValueAtIndex(theArray, i)];
      if (v10) {
        [v4 addObject:v10];
      }
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
  return v4;
}

- (void)setOutputDevices:(id)a3 withOptions:(__CFDictionary *)a4 onRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(a3);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        value = 0;
        if (!AVOutputDeviceGetFigEndpoint(v16, &value))
        {
          if (Mutable) {
            CFRelease(Mutable);
          }
          goto LABEL_15;
        }
        if (value) {
          CFArrayAppendValue(Mutable, value);
        }
      }
      uint64_t v13 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  if (Mutable)
  {
    v17 = AVMakeSelectEndpointsOperation(a5, Mutable, a4, self->_useRouteConfigUpdatedNotification);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __120__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevices_withOptions_onRoutingContext_completionHandler___block_invoke;
    v19[3] = &unk_1E57B4540;
    v19[4] = v17;
    v19[5] = a6;
    [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v17 setCompletionBlock:v19];
    objc_msgSend(+[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue"), "enqueueOperation:", v17);
    CFRelease(Mutable);
  }
  else
  {
LABEL_15:
    v18 = objc_alloc_init(AVOutputContextDestinationChange);
    [(AVOutputContextDestinationChange *)v18 markAsFailed];
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v18);
  }
}

uint64_t __120__AVFigEndpointFigRoutingContextOutputDeviceTranslator_setOutputDevices_withOptions_onRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) result];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)addOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 toRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  CFTypeRef v15 = 0;
  int FigEndpoint = AVOutputDeviceGetFigEndpoint(a3, &v15);
  char v11 = FigEndpoint;
  if (FigEndpoint && v15)
  {
    uint64_t v12 = AVMakeAddEndpointOperation(a5, v15, a4, self->_useRouteConfigUpdatedNotification);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_addOutputDevice_withOptions_toRoutingContext_completionHandler___block_invoke;
    v14[3] = &unk_1E57B4540;
    v14[4] = v12;
    v14[5] = a6;
    [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v12 setCompletionBlock:v14];
    objc_msgSend(+[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue"), "enqueueOperation:", v12);
  }
  if ((v11 & 1) == 0)
  {
    uint64_t v13 = objc_alloc_init(AVOutputContextDestinationChange);
    [(AVOutputContextDestinationChange *)v13 markAsFailed];
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v13);
  }
}

uint64_t __119__AVFigEndpointFigRoutingContextOutputDeviceTranslator_addOutputDevice_withOptions_toRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) result];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)removeOutputDevice:(id)a3 withOptions:(__CFDictionary *)a4 fromRoutingContext:(OpaqueFigRoutingContext *)a5 completionHandler:(id)a6
{
  CFTypeRef v13 = 0;
  if (AVOutputDeviceGetFigEndpoint(a3, &v13) && v13)
  {
    v10 = AVMakeRemoveEndpointOperation(a5, v13, a4, self->_useRouteConfigUpdatedNotification);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __124__AVFigEndpointFigRoutingContextOutputDeviceTranslator_removeOutputDevice_withOptions_fromRoutingContext_completionHandler___block_invoke;
    v12[3] = &unk_1E57B4540;
    v12[4] = v10;
    v12[5] = a6;
    [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v10 setCompletionBlock:v12];
    objc_msgSend(+[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue"), "enqueueOperation:", v10);
  }
  else
  {
    char v11 = objc_alloc_init(AVOutputContextDestinationChange);
    [(AVOutputContextDestinationChange *)v11 markAsFailed];
    (*((void (**)(id, AVOutputContextDestinationChange *))a6 + 2))(a6, v11);
  }
}

uint64_t __124__AVFigEndpointFigRoutingContextOutputDeviceTranslator_removeOutputDevice_withOptions_fromRoutingContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) result];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (id)predictedOutputDeviceFromRoutingContext:(OpaqueFigRoutingContext *)a3
{
  return 0;
}

@end