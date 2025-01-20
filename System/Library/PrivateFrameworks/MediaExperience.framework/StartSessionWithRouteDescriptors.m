@interface StartSessionWithRouteDescriptors
@end

@implementation StartSessionWithRouteDescriptors

uint64_t __routingSessionManagerResilientRemote_StartSessionWithRouteDescriptors_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 72);
  if (!v6) {
    return 4294954514;
  }
  return v6(a2, v3);
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (const void *)a1[5];
  if (v5)
  {
    CFRetain(v5);
    uint64_t v6 = a1[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = *(NSObject **)(a1[6] + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_2;
  v9[3] = &unk_1E57CB700;
  v9[5] = a3;
  v9[6] = v6;
  v9[4] = a1[4];
  MXDispatchAsync((uint64_t)"routingSessionManager_StartSessionWithRouteDescriptors_block_invoke", (uint64_t)"FigRoutingSessionManager.m", 2681, 0, 0, v7, (uint64_t)v9);
  v8 = (const void *)a1[5];
  if (v8) {
    CFRelease(v8);
  }
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_2(uint64_t a1)
{
  routingSessionManager_setPredictionContextForSession(*(void *)(a1 + 48), [*(id *)(a1 + 32) newSession], *(void **)(a1 + 40));
  [*(id *)(a1 + 32) setPredictionContext:*(void *)(a1 + 40)];
  v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_3(uint64_t a1, const __CFArray *a2)
{
  uint64_t result = (uint64_t)routingSessionManager_createAvailableDestinationFromAvailableRoutes(a2, *(CFDictionaryRef *)(a1 + 40));
  if (result)
  {
    uint64_t v4 = (const void *)result;
    CFRetain((CFTypeRef)result);
    uint64_t v5 = *(const void **)(a1 + 48);
    if (v5) {
      CFRetain(v5);
    }
    uint64_t v6 = *(const void **)(a1 + 56);
    if (v6)
    {
      CFRetain(v6);
      uint64_t v7 = *(void *)(a1 + 56);
    }
    else
    {
      uint64_t v7 = 0;
    }
    v8 = *(NSObject **)(*(void *)(a1 + 64) + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_4;
    v10[3] = &unk_1E57CB750;
    uint64_t v9 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v4;
    __int16 v11 = *(_WORD *)(a1 + 72);
    v10[6] = v9;
    v10[7] = v7;
    MXDispatchAsync((uint64_t)"routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_3", (uint64_t)"FigRoutingSessionManager.m", 2706, 0, 0, v8, (uint64_t)v10);
    CFRelease(v4);
    return 1;
  }
  return result;
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_4(uint64_t a1)
{
  CFTypeRef cf = 0;
  if (!FigRoutingSessionCreate(*MEMORY[0x1E4F1CF80], 0, *(const void **)(a1 + 40), &cf))
  {
    routingSessionManager_updateCurrentSession(*(const void **)(a1 + 48), cf, (void *)[*(id *)(a1 + 32) predictionContext], *(unsigned char *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), 0, 0, 1, *(void *)(a1 + 56), 1, @"Update route descriptors of pending route session", 0);
    [*(id *)(a1 + 32) setNewSession:cf];
  }
  if (cf) {
    CFRelease(cf);
  }
  v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 56);
  if (v4) {
    CFRelease(v4);
  }
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_5(uint64_t a1, int a2)
{
  if (a2) {
    routingSessionManager_updateCurrentSession(*(const void **)(a1 + 32), 0, 0, 0, 0, 0, 0, 1, *(void *)(a1 + 40), 0, @"Failed to discover pending route", 0);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    CFRelease(v5);
  }
}

@end