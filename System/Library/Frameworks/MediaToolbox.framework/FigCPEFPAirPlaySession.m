@interface FigCPEFPAirPlaySession
- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 contentInfo:(id)a4 routeInfo:(id)a5 playbackSession:(OpaqueFigEndpointPlaybackSession *)a6 mediaControlUUID:(id)a7;
- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 protectionInfo:(id)a4 routeInfo:(id)a5 playbackSession:(OpaqueFigEndpointPlaybackSession *)a6 mediaControlUUID:(id)a7;
- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 routeInfo:(id)a4 playbackSession:(OpaqueFigEndpointPlaybackSession *)a5 mediaControlUUID:(id)a6;
- (id)createPicRequestWithError:(id *)a3;
- (id)legacySinfs;
- (id)mediaControlParamsWithStoreResponse:(id)a3;
- (id)sicWithPic:(id)a3;
- (void)authorizeItemCompletionHandler_objc:(id *)a3 picData:(__CFData *)a4 playerGUID:(__CFString *)a5 error:(int)a6;
- (void)beginSessionWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)endSession;
@end

@implementation FigCPEFPAirPlaySession

- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 protectionInfo:(id)a4 routeInfo:(id)a5 playbackSession:(OpaqueFigEndpointPlaybackSession *)a6 mediaControlUUID:(id)a7
{
  v8 = [(FigCPEFPAirPlaySession *)self initWithFairPlayContext:*(void *)&a3 routeInfo:a5 playbackSession:a6 mediaControlUUID:a7];
  if (v8) {
    v8->_protectionInfo = (NSDictionary *)a4;
  }
  return v8;
}

- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 contentInfo:(id)a4 routeInfo:(id)a5 playbackSession:(OpaqueFigEndpointPlaybackSession *)a6 mediaControlUUID:(id)a7
{
  v8 = [(FigCPEFPAirPlaySession *)self initWithFairPlayContext:*(void *)&a3 routeInfo:a5 playbackSession:a6 mediaControlUUID:a7];
  if (v8) {
    v8->_contentInfo = (NSDictionary *)a4;
  }
  return v8;
}

- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 routeInfo:(id)a4 playbackSession:(OpaqueFigEndpointPlaybackSession *)a5 mediaControlUUID:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)FigCPEFPAirPlaySession;
  v10 = [(FigCPEFPAirPlaySession *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_invalid = 0;
    v10->_fairPlayContext = a3;
    v10->_protectionInfo = 0;
    v10->_contentInfo = 0;
    v10->_playbackSession = (OpaqueFigEndpointPlaybackSession *)CFRetain(a5);
    v11->_mediaControlUUID = (NSString *)a6;
    v11->_fairPlayDeallocator = (__CFAllocator *)FigFairPlayCopyDisposeStorageAllocator();
    v11->_vodkaVersion = 0;
    if (a4)
    {
      v12 = (void *)[a4 objectForKey:@"AirPlayVodkaVersion"];
      if (v12) {
        v11->_vodkaVersion = [v12 unsignedIntValue];
      }
    }
    v11->_fairPlaySession = 0;
    v11->_serializationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.cpefpairplay", 0);
    if (sSSOnceToken != -1) {
      dispatch_once(&sSSOnceToken, &__block_literal_global_130);
    }
  }
  return v11;
}

void *__93__FigCPEFPAirPlaySession_initWithFairPlayContext_routeInfo_playbackSession_mediaControlUUID___block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 1);
  if (result)
  {
    sSSPlayInfoRequestContext = (uint64_t)objc_getClass("SSPlayInfoRequestContext");
    sSSAccountStore = (uint64_t)objc_getClass("SSAccountStore");
    result = objc_getClass("SSPlayInfoRequest");
    sSSPlayInfoRequest = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  CFRelease(self->_playbackSession);
  CFRelease(self->_fairPlayDeallocator);
  if (self->_fairPlaySession)
  {
    TsbHVdUOnzCHizuzrAdwYFpb();
    FAIRPLAY_CALL_LOG(v3);
  }
  dispatch_release((dispatch_object_t)self->_serializationQueue);
  v4.receiver = self;
  v4.super_class = (Class)FigCPEFPAirPlaySession;
  [(FigCPEFPAirPlaySession *)&v4 dealloc];
}

- (id)createPicRequestWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v38 = 0;
  uint64_t v39 = 0;
  memset(length, 0, sizeof(length));
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  if (!self->_fairPlayContext
    || self->_fairPlaySession
    || (protectionInfo = self->_protectionInfo,
        contentInfo = self->_contentInfo,
        (protectionInfo != 0) ^ (contentInfo == 0))
    || !self->_fairPlayDeallocator)
  {
    CFDataRef v26 = 0;
    uint64_t v27 = 4294955138;
    goto LABEL_30;
  }
  v31 = a3;
  if (protectionInfo)
  {
    LODWORD(v37) = 1;
    LODWORD(v39) = [(NSDictionary *)protectionInfo count];
    v7 = (char *)malloc_type_calloc(v39, 0x20uLL, 0x1050040E8CD93FDuLL);
    v38 = v7;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v8 = self->_protectionInfo;
    uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v8);
          }
          CFDictionaryRef v14 = [(NSDictionary *)self->_protectionInfo objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          LegacySinfFromSinfExtensions = (void *)FigFairPlayGetLegacySinfFromSinfExtensions(v14);
          ExtendedSinfFromSinfExtensions = (void *)FigFairPlayGetExtendedSinfFromSinfExtensions(v14);
          uint64_t v17 = 32 * (v11 + i);
          if (LegacySinfFromSinfExtensions)
          {
            *(_DWORD *)&v7[32 * (v11 + i)] = [LegacySinfFromSinfExtensions length];
            uint64_t v18 = [LegacySinfFromSinfExtensions bytes];
            v7 = (char *)v38;
            *(void *)((char *)v38 + v17 + 8) = v18;
          }
          if (ExtendedSinfFromSinfExtensions)
          {
            *(_DWORD *)&v7[v17 + 16] = [ExtendedSinfFromSinfExtensions length];
            uint64_t v19 = [ExtendedSinfFromSinfExtensions bytes];
            v7 = (char *)v38;
            *(void *)((char *)v38 + v17 + 24) = v19;
          }
        }
        uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        v11 += i;
      }
      while (v10);
    }
    goto LABEL_27;
  }
  LODWORD(v37) = 2;
  id v20 = [(NSDictionary *)contentInfo objectForKey:0x1EE571CD8];
  if (v20) {
    v38 = (void *)[v20 unsignedLongValue];
  }
  id v21 = [(NSDictionary *)self->_contentInfo objectForKey:0x1EE571D18];
  if (!v21) {
    goto LABEL_27;
  }
  v22 = v21;
  if ([v21 isEqualToString:0x1EE55C858])
  {
    int v23 = 1;
LABEL_25:
    HIDWORD(v37) = v23;
    goto LABEL_27;
  }
  if ([v22 isEqualToString:0x1EE55C838])
  {
    int v23 = 2;
    goto LABEL_25;
  }
  HIDWORD(v37) = 0;
LABEL_27:
  J3NocDTIn(self->_vodkaVersion, self->_fairPlayContext, (uint64_t)&v37);
  uint64_t v25 = FAIRPLAY_CALL_LOG(v24);
  if (v25)
  {
    uint64_t v27 = v25;
    CFDataRef v26 = 0;
    a3 = v31;
  }
  else
  {
    CFDataRef v26 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(const UInt8 **)&length[1], length[0], self->_fairPlayDeallocator);
    a3 = v31;
    if (v26)
    {
      uint64_t v27 = 0;
      *(void *)&length[1] = 0;
    }
    else
    {
      uint64_t v27 = 4294955145;
    }
  }
LABEL_30:
  if (v37 == 1) {
    free(v38);
  }
  if (*(void *)&length[1])
  {
    jEHf8Xzsv8K(*(uint64_t *)&length[1]);
    FAIRPLAY_CALL_LOG(v28);
  }
  if (a3 && v27)
  {
    if (dword_1E93513B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *a3 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)FigFairPlayMapFairPlayErrorToCPEError(v27) userInfo:0];
  }
  return v26;
}

- (id)sicWithPic:(id)a3
{
  *(void *)&length[1] = 0;
  if (!a3 || (fairPlaySession = self->_fairPlaySession) == 0 || !self->_fairPlayDeallocator)
  {
LABEL_11:
    CFDataRef v8 = 0;
    return v8;
  }
  OflR7BMjGok3A7mYQFt9((uint64_t)fairPlaySession, [a3 bytes], objc_msgSend(a3, "length"), 0, 0, (uint64_t)&length[1]);
  int v6 = FAIRPLAY_CALL_LOG(v5);
  uint64_t v7 = *(void *)&length[1];
  if (v6)
  {
LABEL_9:
    if (v7)
    {
      jEHf8Xzsv8K(v7);
      FAIRPLAY_CALL_LOG(v10);
    }
    goto LABEL_11;
  }
  CFDataRef v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(const UInt8 **)&length[1], 0, self->_fairPlayDeallocator);
  if (!v8)
  {
    uint64_t v7 = *(void *)&length[1];
    goto LABEL_9;
  }
  *(void *)&length[1] = 0;
  return v8;
}

- (id)mediaControlParamsWithStoreResponse:(id)a3
{
  id v3 = a3;
  *(void *)&length[1] = 0;
  if (!a3)
  {
    CFDataRef v6 = 0;
    fairPlaySession = 0;
    goto LABEL_12;
  }
  fairPlaySession = self->_fairPlaySession;
  if (fairPlaySession)
  {
    if (!self->_fairPlayDeallocator) {
      goto LABEL_13;
    }
    if (self->_protectionInfo)
    {
      fairPlaySession = (FPStreamOpaque_ *)*MEMORY[0x1E4F20808];
      CFDataRef v6 = (CFDataRef)a3;
LABEL_9:
      id v3 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:fairPlaySession];
      goto LABEL_10;
    }
    length[0] = 0;
    TBGzuU3p5n1n((uint64_t)fairPlaySession, [a3 bytes], objc_msgSend(a3, "length"), (uint64_t)&length[1], (uint64_t)length);
    if (FAIRPLAY_CALL_LOG(v7))
    {
LABEL_13:
      fairPlaySession = 0;
    }
    else
    {
      fairPlaySession = (FPStreamOpaque_ *)*MEMORY[0x1E4F20800];
      CFDataRef v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(const UInt8 **)&length[1], length[0], self->_fairPlayDeallocator);
      if (v8)
      {
        CFDataRef v6 = v8;
        *(void *)&length[1] = 0;
        goto LABEL_9;
      }
    }
  }
  CFDataRef v6 = 0;
  id v3 = 0;
LABEL_10:
  if (*(void *)&length[1])
  {
    jEHf8Xzsv8K(*(uint64_t *)&length[1]);
    FAIRPLAY_CALL_LOG(v9);
  }
LABEL_12:

  return v3;
}

- (id)legacySinfs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSDictionary count](self->_protectionInfo, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  protectionInfo = self->_protectionInfo;
  uint64_t v5 = [(NSDictionary *)protectionInfo countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(protectionInfo);
        }
        objc_msgSend(v3, "addObject:", FigFairPlayGetLegacySinfFromSinfExtensions((const __CFDictionary *)-[NSDictionary objectForKey:](self->_protectionInfo, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i))));
      }
      uint64_t v6 = [(NSDictionary *)protectionInfo countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)authorizeItemCompletionHandler_objc:(id *)a3 picData:(__CFData *)a4 playerGUID:(__CFString *)a5 error:(int)a6
{
  var2 = a3->var2;
  id var3 = a3->var3;
  if (self->_invalid)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_8;
    v16[3] = &unk_1E579CDB0;
    v16[4] = var3;
    CFDataRef v8 = v16;
LABEL_14:
    dispatch_async(var2, v8);
    return;
  }
  if (a6)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke;
    v21[3] = &unk_1E57AAB60;
    int v22 = a6;
    v21[4] = var3;
    CFDataRef v8 = v21;
    goto LABEL_14;
  }
  if (![(__CFString *)a5 length] || ![(__CFData *)a4 length])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_7;
    block[3] = &unk_1E579CDB0;
    block[4] = var3;
    CFDataRef v8 = block;
    goto LABEL_14;
  }
  id v12 = [(FigCPEFPAirPlaySession *)self sicWithPic:a4];
  if (!v12)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_6;
    v18[3] = &unk_1E579CDB0;
    v18[4] = var3;
    CFDataRef v8 = v18;
    goto LABEL_14;
  }
  if (!sSSPlayInfoRequest || !sSSAccountStore || (id v13 = v12, !sSSPlayInfoRequestContext))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_5;
    v19[3] = &unk_1E579CDB0;
    v19[4] = var3;
    CFDataRef v8 = v19;
    goto LABEL_14;
  }
  id v14 = objc_alloc_init((Class)sSSPlayInfoRequestContext);
  [v14 setPlayerGUID:a5];
  [v14 setSICData:v13];
  if (self->_protectionInfo)
  {
    objc_msgSend(v14, "setSinfs:", -[FigCPEFPAirPlaySession legacySinfs](self, "legacySinfs"));
  }
  else
  {
    objc_msgSend(v14, "setAccountIdentifier:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)sSSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier"));
    objc_msgSend(v14, "setContentIdentifier:", -[NSDictionary objectForKey:](self->_contentInfo, "objectForKey:", 0x1EE571CD8));
  }
  id v15 = (id)[objc_alloc((Class)sSSPlayInfoRequest) initWithPlayInfoContext:v14];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_2;
  v20[3] = &unk_1E57AABD8;
  v20[4] = self;
  v20[5] = var2;
  v20[6] = var3;
  [v15 startWithPlayInfoResponseBlock:v20];
}

void __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199711A30]();
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = (id)[v3 initWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(a1 + 40) userInfo:0];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"Error"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_3;
  block[3] = &unk_1E57AABB0;
  block[4] = v3;
  void block[5] = a2;
  block[6] = a3;
  long long v6 = *(_OWORD *)(a1 + 40);
  dispatch_async(v4, block);
}

void __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_3(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[8])
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (!v3 || (uint64_t v4 = objc_msgSend(v1, "mediaControlParamsWithStoreResponse:", objc_msgSend(v3, "playInfoData"))) == 0) {
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    uint64_t v5 = *(void **)(a1 + 48);
    if (v5)
    {
      if ([v5 code] != 110 && objc_msgSend(*(id *)(a1 + 48), "code") != 3)
      {
        uint64_t v9 = *(void *)(a1 + 48);
        goto LABEL_11;
      }
      long long v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28760];
      uint64_t v8 = -16222;
    }
    else
    {
      long long v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28760];
      uint64_t v8 = 0;
    }
    uint64_t v9 = [v6 errorWithDomain:v7 code:v8 userInfo:0];
LABEL_11:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_4;
    block[3] = &unk_1E57AAB88;
    long long v10 = *(NSObject **)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    void block[5] = v9;
    block[6] = v11;
    block[4] = v4;
    dispatch_async(v10, block);
  }
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_4(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a1[4], @"AirPlayParams", a1[5], @"Error", 0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -12162, 0), @"Error");
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -12162, 0), @"Error");
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] data];
  uint64_t v4 = objc_msgSend(v2, "dictionaryWithObject:forKey:", objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, *MEMORY[0x1E4F20808]), @"AirPlayParams");
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v5(v1, v4);
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -12162, 0), @"Error");
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)beginSessionWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E57AAC28;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

void __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_4;
    block[3] = &unk_1E579CDB0;
    uint64_t v3 = *(NSObject **)(a1 + 40);
    block[4] = *(void *)(a1 + 48);
    uint64_t v4 = block;
LABEL_3:
    dispatch_async(v3, v4);
    return;
  }
  uint64_t v19 = 0;
  uint64_t v5 = [v2 createPicRequestWithError:&v19];
  if (!v5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_3;
    v17[3] = &unk_1E57AAC00;
    uint64_t v3 = *(NSObject **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v17[4] = v19;
    v17[5] = v14;
    uint64_t v4 = v17;
    goto LABEL_3;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_2;
    v18[3] = &unk_1E579CDB0;
    uint64_t v3 = *(NSObject **)(a1 + 40);
    v18[4] = *(void *)(a1 + 48);
    uint64_t v4 = v18;
    goto LABEL_3;
  }
  uint64_t v6 = v5;
  uint64_t v7 = malloc_type_malloc(0x20uLL, 0xE00409EA085F3uLL);
  void *v7 = *(id *)(a1 + 32);
  uint64_t v8 = (const void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKey:0x1EE571CF8];
  v7[1] = v8;
  if (v8) {
    CFRetain(v8);
  }
  v7[3] = *(id *)(a1 + 48);
  v7[2] = *(void *)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v9 + 40);
  uint64_t v10 = *(void *)(v9 + 48);
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v15 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(CFTypeRef, CFTypeRef, int, uint64_t), void *))(v13 + 16);
  if (v15) {
    v15(v11, v6, v10, authorizeItemCompletionHandler, v7);
  }
}

uint64_t __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -12150, 0), @"Error");
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

uint64_t __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v2) {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-12162 userInfo:0];
  }
  uint64_t v4 = [v1 dictionaryWithObject:v2 forKey:@"Error"];
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);

  return v5(v3, v4);
}

uint64_t __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -12162, 0), @"Error");
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)endSession
{
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FigCPEFPAirPlaySession_endSession__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = self;
  dispatch_sync(serializationQueue, block);
}

uint64_t __36__FigCPEFPAirPlaySession_endSession__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

@end