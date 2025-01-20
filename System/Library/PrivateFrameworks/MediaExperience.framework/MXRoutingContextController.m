@interface MXRoutingContextController
- (BOOL)isContextPrewarmed;
- (MXRoutingContextController)initWithRoutingContextUUID:(id)a3;
- (NSArray)currentRoutes;
- (NSString)routingContextUUID;
- (id)discoverRouteDescriptorsWithRouteUUIDS:(id)a3 forDiscoverer:(OpaqueFigRouteDiscoverer *)a4;
- (id)routeDescriptorsWithRouteIDs:(id)a3 discoverer:(OpaqueFigRouteDiscoverer *)a4;
- (void)dealloc;
- (void)prewarmRoutesWithUUIDs:(id)a3 completionHandler:(id)a4;
- (void)selectRouteDescriptors:(id)a3;
- (void)setContextPrewarmed:(BOOL)a3;
@end

@implementation MXRoutingContextController

- (MXRoutingContextController)initWithRoutingContextUUID:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MXRoutingContextController;
  v4 = [(MXRoutingContextController *)&v12 init];
  v4->_routingContextUUID = (NSString *)a3;
  FigRoutingManagerCopyContextWithUUID((uint64_t)a3, (uint64_t)&v4->mRoutingContext);
  CFTypeRef cf = 0;
  mRoutingContext = v4->mRoutingContext;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(void (**)(OpaqueFigRoutingContext *, __CFString *, void, CFTypeRef *))(v7 + 48);
  if (v8) {
    v8(mRoutingContext, @"contextType", *MEMORY[0x1E4F1CF80], &cf);
  }
  if (FigCFNumberGetUInt32() == 9) {
    int v9 = 5;
  }
  else {
    int v9 = 3;
  }
  v4->mDiscovererType = v9;
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

- (void)dealloc
{
  mRoutingContext = self->mRoutingContext;
  if (mRoutingContext)
  {
    CFRelease(mRoutingContext);
    self->mRoutingContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MXRoutingContextController;
  [(MXRoutingContextController *)&v4 dealloc];
}

- (id)routeDescriptorsWithRouteIDs:(id)a3 discoverer:(OpaqueFigRouteDiscoverer *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v21 = 0;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = *(void (**)(OpaqueFigRouteDiscoverer *, __CFString *, void, id *))(v8 + 48);
  if (v9)
  {
    v9(a4, @"availableRouteDescriptors", *MEMORY[0x1E4F1CF80], &v21);
    id v10 = v21;
  }
  else
  {
    id v10 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(v15, "objectForKey:", @"RouteUID"))) {
          [v6 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v12);
  }

  return v6;
}

- (id)discoverRouteDescriptorsWithRouteUUIDS:(id)a3 forDiscoverer:(OpaqueFigRouteDiscoverer *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__14;
  v25 = __Block_byref_object_dispose__14;
  uint64_t v26 = 0;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__MXRoutingContextController_discoverRouteDescriptorsWithRouteUUIDS_forDiscoverer___block_invoke;
  v18[3] = &unk_1E57CB208;
  objc_copyWeak(v19, &location);
  v18[4] = a3;
  v18[5] = v7;
  v19[1] = a4;
  v18[6] = &v21;
  uint64_t v9 = [v8 addObserverForName:@"Discoverer_AvailableRoutesChanged" object:a4 queue:0 usingBlock:v18];
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void (**)(OpaqueFigRouteDiscoverer *, __CFString *, __CFString *))(v11 + 56);
  if (v12) {
    v12(a4, @"DiscoveryMode", @"DiscoveryMode_Detailed");
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3.0];
  [v7 lock];
  LOBYTE(v13) = [v7 waitUntilDate:v13];
  [v7 unlock];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", v9);
  if (v13)
  {
    uint64_t v14 = [(id)v22[5] count];
    if (v14 != [a3 count] && dword_1E9359ED0) {
      goto LABEL_11;
    }
  }
  else if (dword_1E9359ED0)
  {
LABEL_11:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  id v16 = (id)v22[5];
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);
  return v16;
}

uint64_t __83__MXRoutingContextController_discoverRouteDescriptorsWithRouteUUIDS_forDiscoverer___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_loadWeak((id *)(a1 + 56)) routeDescriptorsWithRouteIDs:*(void *)(a1 + 32) discoverer:*(void *)(a1 + 64)];
  uint64_t v3 = [v2 count];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (v3 == result)
  {
    [*(id *)(a1 + 40) lock];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v2;
    [*(id *)(a1 + 40) signal];
    v5 = *(void **)(a1 + 40);
    return [v5 unlock];
  }
  return result;
}

- (void)selectRouteDescriptors:(id)a3
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  mRoutingContext = self->mRoutingContext;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigRoutingContext *, id, void))(v8 + 48);
  if (v9) {
    v9(mRoutingContext, a3, MEMORY[0x1E4F1CC08]);
  }
}

- (void)prewarmRoutesWithUUIDs:(id)a3 completionHandler:(id)a4
{
  v26[20] = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFTypeRef cf = 0;
  uint64_t v8 = *MEMORY[0x1E4F1CF80];
  v25 = @"discovererType";
  v26[0] = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", self->mDiscovererType, v20, v21);
  FigRouteDiscovererCreate(v8, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1], &cf);
  id v9 = [(MXRoutingContextController *)self discoverRouteDescriptorsWithRouteUUIDS:a3 forDiscoverer:cf];
  uint64_t v10 = objc_msgSend(v9, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", &__block_literal_global_71));
  uint64_t v11 = [v10 count];
  if (v11 == [a3 count])
  {
    [(MXRoutingContextController *)self setContextPrewarmed:1];
    uint64_t v12 = (void *)[a4 copy];
    v23[0] = @"PreviousRouteDescriptors";
    v24[0] = [(MXRoutingContextController *)self currentRoutes];
    v24[1] = v12;
    v23[1] = @"CompletionHandler";
    v23[2] = @"MXRoutingContextController";
    v24[2] = self;
    uint64_t v13 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

    id v14 = v13;
    mRoutingContext = self->mRoutingContext;
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    long long v19 = *(void (**)(OpaqueFigRoutingContext *, void *, void, void (*)(void *), void *))(v17 + 224);
    if (v19) {
      v19(mRoutingContext, v10, MEMORY[0x1E4F1CC08], MXRoutingContextControllerModificationCallback, v13);
    }
  }
  else
  {
    if (dword_1E9359ED0)
    {
      long long v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t __71__MXRoutingContextController_prewarmRoutesWithUUIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"AirPlayEndpointProperties"), "objectForKey:", @"ReceiverDeviceIsPlaying"), "BOOLValue") ^ 1;
}

- (BOOL)isContextPrewarmed
{
  CFTypeRef cf = 0;
  mRoutingContext = self->mRoutingContext;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(void (**)(OpaqueFigRoutingContext *, uint64_t, void, CFTypeRef *))(v4 + 48);
  if (v5) {
    v5(mRoutingContext, 0x1EE5F2668, *MEMORY[0x1E4F1CF80], &cf);
  }
  int v6 = FigCFEqual();
  if (cf) {
    CFRelease(cf);
  }
  return v6 != 0;
}

- (void)setContextPrewarmed:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  mRoutingContext = self->mRoutingContext;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(OpaqueFigRoutingContext *, uint64_t, uint64_t))(v6 + 56);
  if (v7)
  {
    uint64_t v8 = *v3;
    v7(mRoutingContext, 0x1EE5F2668, v8);
  }
}

- (NSArray)currentRoutes
{
  uint64_t v8 = 0;
  mRoutingContext = self->mRoutingContext;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(OpaqueFigRoutingContext *, void **))(v4 + 64);
  if (v5)
  {
    v5(mRoutingContext, &v8);
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSArray *)v6;
}

- (NSString)routingContextUUID
{
  return self->_routingContextUUID;
}

@end