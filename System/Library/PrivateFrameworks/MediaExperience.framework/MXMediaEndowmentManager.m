@interface MXMediaEndowmentManager
+ (id)sharedInstance;
- (MXMediaEndowmentManager)init;
- (id)getRecordingAttributions:(int)a3;
- (int)grantMediaEndowment:(int)a3 environmentID:(id)a4 endowmentPayload:(id)a5;
- (int)revokeMediaEndowment:(int)a3 environmentID:(id)a4;
- (void)dealloc;
- (void)dumpDebugInfo;
- (void)handleEndowmentTreeUpdate;
- (void)iterateEndowmentTree:(id)a3 rootPID:(id)a4 environment:(id)a5 endowmentLinks:(id)a6;
- (void)loadMediaEndowments;
- (void)processStateUpdateHandler:(id)a3 process:(id)a4 update:(id)a5;
- (void)refreshAssertions;
- (void)refreshDomainAssertions:(id)a3 currentlyActivePIDs:(id)a4;
- (void)refreshEndowmentTrees;
- (void)storeMediaEndowments;
@end

@implementation MXMediaEndowmentManager

uint64_t __44__MXMediaEndowmentManager_refreshAssertions__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v33;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v2;
        v3 = *(void **)(*((void *)&v32 + 1) + 8 * v2);
        if ([v3 isPlaying])
        {
          uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "clientPID"), "unsignedIntValue");
          if (v4)
          {
            uint64_t v5 = v4;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v19 = *(id *)(*(void *)(a1 + 32) + 40);
            uint64_t v22 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
            if (v22)
            {
              uint64_t v20 = *(void *)v29;
              do
              {
                uint64_t v6 = 0;
                do
                {
                  if (*(void *)v29 != v20) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v23 = v6;
                  uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * v6);
                  v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v7];
                  long long v24 = 0u;
                  long long v25 = 0u;
                  long long v26 = 0u;
                  long long v27 = 0u;
                  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
                  if (v9)
                  {
                    uint64_t v10 = v9;
                    uint64_t v11 = *(void *)v25;
                    do
                    {
                      for (uint64_t i = 0; i != v10; ++i)
                      {
                        if (*(void *)v25 != v11) {
                          objc_enumerationMutation(v8);
                        }
                        v13 = (void *)[v8 objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
                        if (objc_msgSend(v13, "containsObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v5))&& objc_msgSend(v3, "isPlaying"))
                        {
                          [v1 addObject:v7];
                          objc_msgSend(v1, "addObjectsFromArray:", objc_msgSend(v13, "allObjects"));
                        }
                      }
                      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
                    }
                    while (v10);
                  }
                  uint64_t v6 = v23 + 1;
                }
                while (v23 + 1 != v22);
                uint64_t v22 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
              }
              while (v22);
            }
          }
        }
        uint64_t v2 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v17);
  }

  return [*(id *)(a1 + 32) refreshDomainAssertions:@"MediaPlayback" currentlyActivePIDs:v1];
}

- (void)refreshDomainAssertions:(id)a3 currentlyActivePIDs:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id obj = (id)[MEMORY[0x1E4F1CA80] set];
  if ([a3 isEqualToString:@"MediaPlayback"])
  {
    mMediaPlaybackAssertions = self->mMediaPlaybackAssertions;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v7 = [a4 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v51 != v9) {
            objc_enumerationMutation(a4);
          }
          uint64_t v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (!-[NSMutableDictionary objectForKey:](mMediaPlaybackAssertions, "objectForKey:", v11, v33, v35))
          {
            uint64_t v49 = 0;
            uint64_t v12 = [NSString stringWithFormat:@"{originator:\"com.apple.mediaexperience\", clientPID:%@ DomainName:%@}", v11, a3];
            uint64_t v13 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.mediaexperience" name:a3];
            id v14 = objc_alloc(MEMORY[0x1E4F96318]);
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4F96478], "targetWithPid:", objc_msgSend(v11, "unsignedIntValue"));
            uint64_t v62 = v13;
            uint64_t v16 = objc_msgSend(v14, "initWithExplanation:target:attributes:", v12, v15, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v62, 1));
            if ([v16 acquireWithError:&v49])
            {
              if (dword_1E9359EF8)
              {
                *(_DWORD *)v48 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              -[NSMutableDictionary setObject:forKey:](mMediaPlaybackAssertions, "setObject:forKey:", v16, v11, v33, v35);
            }
            else
            {
              *(_DWORD *)v48 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
        uint64_t v8 = [a4 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v8);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mMediaPlaybackAssertions, "countByEnumeratingWithState:objects:count:", &v43, v55, 16, v33, v35);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(mMediaPlaybackAssertions);
          }
          uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          if (([a4 containsObject:v23] & 1) == 0) {
            [obj addObject:v23];
          }
        }
        uint64_t v20 = [(NSMutableDictionary *)mMediaPlaybackAssertions countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v20);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v24 = [obj countByEnumeratingWithState:&v39 objects:v54 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8 * k);
          objc_msgSend((id)-[NSMutableDictionary objectForKey:](mMediaPlaybackAssertions, "objectForKey:", v28), "invalidate");
          if (dword_1E9359EF8)
          {
            LODWORD(v49) = 0;
            v48[0] = OS_LOG_TYPE_DEFAULT;
            long long v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v30 = v49;
            if (os_log_type_enabled(v29, v48[0])) {
              unsigned int v31 = v30;
            }
            else {
              unsigned int v31 = v30 & 0xFFFFFFFE;
            }
            if (v31)
            {
              int v56 = 136315650;
              v57 = "-[MXMediaEndowmentManager refreshDomainAssertions:currentlyActivePIDs:]";
              __int16 v58 = 2114;
              id v59 = a3;
              __int16 v60 = 2114;
              uint64_t v61 = v28;
              LODWORD(v36) = 32;
              long long v34 = &v56;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[NSMutableDictionary removeObjectForKey:](mMediaPlaybackAssertions, "removeObjectForKey:", v28, v34, v36);
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v39 objects:v54 count:16];
      }
      while (v25);
    }
  }
  else
  {
    long long v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)processStateUpdateHandler:(id)a3 process:(id)a4 update:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "previousState", a3), "endowmentNamespaces"), "containsObject:", @"com.apple.mediaexperience.session-Media");
  int v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "state"), "endowmentNamespaces"), "containsObject:", @"com.apple.mediaexperience.session-Media");
  if (v6)
  {
    if (v7) {
      return;
    }
    if (!dword_1E9359EF8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (!v7) {
    return;
  }
  if (dword_1E9359EF8)
  {
LABEL_7:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_8:
  [+[MXMediaEndowmentManager sharedInstance] handleEndowmentTreeUpdate];
}

uint64_t __31__MXMediaEndowmentManager_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = +[MXMediaEndowmentManager sharedInstance];
  return [(MXMediaEndowmentManager *)v7 processStateUpdateHandler:a2 process:a3 update:a4];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_5);
  }
  return (id)sharedInstance_sSharedInstance_2;
}

- (void)refreshAssertions
{
  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MXMediaEndowmentManager_refreshAssertions__block_invoke;
  v3[3] = &unk_1E57C6368;
  v3[4] = self;
  MXDispatchAsync((uint64_t)"-[MXMediaEndowmentManager refreshAssertions]", (uint64_t)"MX_MediaEndowmentManager.m", 660, 0, 0, mSerialQueue, (uint64_t)v3);
}

- (id)getRecordingAttributions:(int)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  mSerialQueue = self->mSerialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__MXMediaEndowmentManager_getRecordingAttributions___block_invoke;
  v8[3] = &unk_1E57C6468;
  int v9 = a3;
  v8[4] = self;
  v8[5] = v5;
  MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager getRecordingAttributions:]", (uint64_t)"MX_MediaEndowmentManager.m", 499, 0, 0, mSerialQueue, (uint64_t)v8);
  if (![v5 count])
  {

    id v5 = 0;
  }
  return v5;
}

uint64_t __52__MXMediaEndowmentManager_getRecordingAttributions___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t result = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  uint64_t v15 = result;
  if (result)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v20 + 1) + 8 * v3);
        id v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v4];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v17;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v17 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
              uint64_t v11 = (void *)[v5 objectForKey:v10];
              if (objc_msgSend(v11, "containsObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", *(unsigned int *)(a1 + 48))))
              {
                uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v4), "objectForKey:", v10);
                if (v12) {
                  [*(id *)(a1 + 40) addObject:v12];
                }
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v7);
        }
        ++v3;
      }
      while (v3 != v15);
      uint64_t result = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      uint64_t v15 = result;
    }
    while (result);
  }
  return result;
}

MXMediaEndowmentManager *__41__MXMediaEndowmentManager_sharedInstance__block_invoke()
{
  uint64_t result = objc_alloc_init(MXMediaEndowmentManager);
  sharedInstance_sSharedInstance_2 = (uint64_t)result;
  return result;
}

- (MXMediaEndowmentManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MXMediaEndowmentManager;
  uint64_t v2 = [(MXMediaEndowmentManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->mSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.MediaEndowmentManager", v3);
    v2->mEndowments = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->mEndowmentPayloads = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->mEndowmentTrees = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->mMediaPlaybackAssertions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = (RBSProcessMonitor *)[MEMORY[0x1E4F96418] monitorWithConfiguration:&__block_literal_global_6];
    v2->mProcessMonitor = v4;
    id v5 = v4;
  }
  return v2;
}

uint64_t __31__MXMediaEndowmentManager_init__block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F96448] descriptor];
  [v3 setEndowmentNamespaces:&unk_1EE605DB8];
  [v3 setValues:32];
  [a2 setStateDescriptor:v3];
  Class v4 = NSClassFromString(&cfstr_Rbsprocessever.isa);
  v6[0] = [(objc_class *)v4 performSelector:NSSelectorFromString(&cfstr_Everythingpred.isa)];
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, 1));
  return [a2 setUpdateHandler:&__block_literal_global_18];
}

- (void)dealloc
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  mSerialQueue = self->mSerialQueue;
  if (mSerialQueue)
  {
    dispatch_release(mSerialQueue);
    self->mSerialQueue = 0;
  }
  [(RBSProcessMonitor *)self->mProcessMonitor invalidate];

  self->mProcessMonitor = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  mEndowments = self->mEndowments;
  uint64_t v5 = [(NSMutableDictionary *)mEndowments countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(mEndowments);
        }
        int v9 = (void *)[(NSMutableDictionary *)self->mEndowments objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_msgSend((id)objc_msgSend(v9, "objectForKey:", *(void *)(*((void *)&v24 + 1) + 8 * j)), "invalidate");
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)mEndowments countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }

  self->mEndowments = 0;
  self->mEndowmentPayloads = 0;

  self->mEndowmentTrees = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mMediaPlaybackAssertions = self->mMediaPlaybackAssertions;
  uint64_t v15 = [(NSMutableDictionary *)mMediaPlaybackAssertions countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(mMediaPlaybackAssertions);
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mMediaPlaybackAssertions, "objectForKey:", *(void *)(*((void *)&v20 + 1) + 8 * k)), "invalidate");
      }
      uint64_t v16 = [(NSMutableDictionary *)mMediaPlaybackAssertions countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v16);
  }

  self->mMediaPlaybackAssertions = 0;
  v19.receiver = self;
  v19.super_class = (Class)MXMediaEndowmentManager;
  [(MXMediaEndowmentManager *)&v19 dealloc];
}

- (void)iterateEndowmentTree:(id)a3 rootPID:(id)a4 environment:(id)a5 endowmentLinks:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [a6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(a6);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mEndowmentTrees, "objectForKey:", a4), "objectForKey:", a5);
        objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v14, "targetPid")));
        -[MXMediaEndowmentManager iterateEndowmentTree:rootPID:environment:endowmentLinks:](self, "iterateEndowmentTree:rootPID:environment:endowmentLinks:", a3, a4, a5, [a3 childrenLinks:v14]);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [a6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)refreshEndowmentTrees
{
  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__MXMediaEndowmentManager_refreshEndowmentTrees__block_invoke;
  v3[3] = &unk_1E57C6368;
  v3[4] = self;
  MXDispatchAsync((uint64_t)"-[MXMediaEndowmentManager refreshEndowmentTrees]", (uint64_t)"MX_MediaEndowmentManager.m", 279, 0, 0, mSerialQueue, (uint64_t)v3);
}

uint64_t __48__MXMediaEndowmentManager_refreshEndowmentTrees__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F96378] endowmentTreeForNamespace:@"com.apple.mediaexperience.session-Media"];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (void *)[v2 rootLinks];
  uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v7, "targetPid"));
        if (![*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v8]) {
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v8);
        }
        int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v8];
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA80], "set"), objc_msgSend(v7, "targetEnvironment"));
        objc_msgSend(*(id *)(a1 + 32), "iterateEndowmentTree:rootPID:environment:endowmentLinks:", v2, v8, objc_msgSend(v7, "targetEnvironment"), objc_msgSend(v2, "childrenLinks:", v7));
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v4);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        if (![*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v15])
        {
          uint64_t v16 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v15];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v27;
            do
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v16);
                }
                objc_msgSend((id)objc_msgSend(v16, "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * k)), "invalidate");
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
            }
            while (v18);
          }
          if (dword_1E9359EF8)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectForKey:", v15, v23, v24);
          [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v12);
  }
  return [*(id *)(a1 + 32) storeMediaEndowments];
}

- (void)handleEndowmentTreeUpdate
{
  [(MXMediaEndowmentManager *)self refreshEndowmentTrees];
  [(MXMediaEndowmentManager *)self refreshAssertions];
}

- (int)grantMediaEndowment:(int)a3 environmentID:(id)a4 endowmentPayload:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  uint64_t v9 = [a5 objectForKey:@"AuditToken"];
  uint64_t v10 = [a5 objectForKey:@"BundleID"];
  [a5 objectForKey:@"RecordingWebsite"];
  if (a3 && a4 && (v9 ? (BOOL v11 = v10 == 0) : (BOOL v11 = 1), !v11))
  {
    mSerialQueue = self->mSerialQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__MXMediaEndowmentManager_grantMediaEndowment_environmentID_endowmentPayload___block_invoke;
    v16[3] = &unk_1E57C6418;
    int v17 = a3;
    v16[4] = self;
    v16[5] = a4;
    v16[7] = v10;
    v16[8] = &v20;
    v16[6] = a5;
    MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager grantMediaEndowment:environmentID:endowmentPayload:]", (uint64_t)"MX_MediaEndowmentManager.m", 370, 0, 0, mSerialQueue, (uint64_t)v16);
    int v13 = *((_DWORD *)v21 + 6);
  }
  else
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v13 = -15681;
  }
  _Block_object_dispose(&v20, 8);
  return v13;
}

void __78__MXMediaEndowmentManager_grantMediaEndowment_environmentID_endowmentPayload___block_invoke(uint64_t a1)
{
  v22[18] = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 72)];
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2), "objectForKey:", *(void *)(a1 + 40)))
  {
    if (dword_1E9359EF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2, v17, v19), "objectForKey:", *(void *)(a1 + 40)), "invalidate");
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2), "removeObjectForKey:", *(void *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v2), "removeObjectForKey:", *(void *)(a1 + 40));
  }
  uint64_t v4 = [MEMORY[0x1E4F96478] targetWithPid:*(unsigned int *)(a1 + 72) environmentIdentifier:*(void *)(a1 + 40)];
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [MEMORY[0x1E4F96370] grantWithNamespace:@"com.apple.mediaexperience.session-Media" endowment:*(void *)(a1 + 48)];
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:1];
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [NSString stringWithFormat:@"{originator:\"com.apple.mediaexperience\", bundleID:\"%@\" clientPID:%d, environmentID:\"%@\"}", *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), *(void *)(a1 + 40)];
  id v11 = objc_alloc(MEMORY[0x1E4F96318]);
  v22[0] = v7;
  v22[1] = v9;
  uint64_t v12 = objc_msgSend(v11, "initWithExplanation:target:attributes:", v10, v5, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 2));
  if (v12)
  {
    int v13 = v12;
    if (([v12 acquireWithError:&v21] & 1) == 0)
    {
      uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -15687;
    }
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (dword_1E9359EF8)
      {
        uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2, v18, v20))
      {
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v2);
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v2);
      }
      objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2), "setObject:forKey:", v13, *(void *)(a1 + 40));
      objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v2), "setObject:forKey:", *(void *)(a1 + 48), *(void *)(a1 + 40));
      [*(id *)(a1 + 32) refreshEndowmentTrees];
    }
  }
  else
  {
LABEL_11:
    uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -15687;
  }
}

- (int)revokeMediaEndowment:(int)a3 environmentID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  if (a3 && a4)
  {
    mSerialQueue = self->mSerialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__MXMediaEndowmentManager_revokeMediaEndowment_environmentID___block_invoke;
    v8[3] = &unk_1E57C6440;
    int v9 = a3;
    v8[4] = self;
    v8[5] = a4;
    void v8[6] = &v12;
    MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager revokeMediaEndowment:environmentID:]", (uint64_t)"MX_MediaEndowmentManager.m", 464, 0, 0, mSerialQueue, (uint64_t)v8);
    int v5 = *((_DWORD *)v13 + 6);
  }
  else
  {
    int v11 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v5 = -15681;
  }
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __62__MXMediaEndowmentManager_revokeMediaEndowment_environmentID___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 56)];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2), "objectForKey:", *(void *)(a1 + 40));
  if (v3)
  {
    [v3 invalidate];
    if (dword_1E9359EF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2, v7, v8), "removeObjectForKey:", *(void *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v2), "removeObjectForKey:", *(void *)(a1 + 40));
    if (!objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v2), "count"))
    {
      [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v2];
      [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v2];
    }
    return [*(id *)(a1 + 32) refreshEndowmentTrees];
  }
  else
  {
    int v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -15685;
  }
  return result;
}

- (void)storeMediaEndowments
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = self->mEndowments;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v8 = (void *)[(NSMutableDictionary *)self->mEndowments objectForKey:v6];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_msgSend(v7, "setObject:forKey:", objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mEndowmentPayloads, "objectForKey:", v6), "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * j)), *(void *)(*((void *)&v16 + 1) + 8 * j));
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }
        [v15 setObject:v7, objc_msgSend(NSString, "stringWithFormat:", @"%@", v6) forKey];
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(@"mediaEndowments", v15);
}

- (void)loadMediaEndowments
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "systemUptime");
  if (v2 > 45.0)
  {
    uint64_t v3 = (void *)MXCFPreferencesCopyPreference(@"mediaEndowments");
    id v26 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v26 setNumberStyle:1];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v3;
    uint64_t v23 = [v3 countByEnumeratingWithState:&v32 objects:v47 count:16];
    if (!v23) {
      goto LABEL_27;
    }
    uint64_t v22 = *(void *)v33;
    while (1)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        uint64_t v5 = *(void *)(*((void *)&v32 + 1) + 8 * v4);
        uint64_t v6 = objc_msgSend(obj, "objectForKey:", v5, v20, v21);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v46 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v29 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v12 = objc_msgSend(v6, "objectForKey:", v11, v20, v21);
              if (-[MXMediaEndowmentManager grantMediaEndowment:environmentID:endowmentPayload:](self, "grantMediaEndowment:environmentID:endowmentPayload:", objc_msgSend((id)objc_msgSend(v26, "numberFromString:", v5), "unsignedIntValue"), v11, v12))
              {
                unsigned int v37 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v14 = v37;
                if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
                  unsigned int v15 = v14;
                }
                else {
                  unsigned int v15 = v14 & 0xFFFFFFFE;
                }
                if (v15) {
                  goto LABEL_22;
                }
              }
              else
              {
                unsigned int v37 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                long long v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v17 = v37;
                if (os_log_type_enabled(v16, type)) {
                  unsigned int v18 = v17;
                }
                else {
                  unsigned int v18 = v17 & 0xFFFFFFFE;
                }
                if (v18)
                {
LABEL_22:
                  int v38 = 136315906;
                  long long v39 = "-[MXMediaEndowmentManager loadMediaEndowments]";
                  __int16 v40 = 2114;
                  uint64_t v41 = v5;
                  __int16 v42 = 2114;
                  uint64_t v43 = v11;
                  __int16 v44 = 2114;
                  uint64_t v45 = v12;
                  LODWORD(v21) = 42;
                  long long v20 = &v38;
                  _os_log_send_and_compose_impl();
                }
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v46 count:16];
          }
          while (v8);
        }
        uint64_t v4 = v25 + 1;
      }
      while (v25 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v47 count:16];
      if (!v23)
      {
LABEL_27:

        [(MXMediaEndowmentManager *)self refreshEndowmentTrees];
        return;
      }
    }
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(@"mediaEndowments", 0);
  if (dword_1E9359EF8)
  {
    long long v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)dumpDebugInfo
{
  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__MXMediaEndowmentManager_dumpDebugInfo__block_invoke;
  v3[3] = &unk_1E57C6368;
  v3[4] = self;
  MXDispatchSync((uint64_t)"-[MXMediaEndowmentManager dumpDebugInfo]", (uint64_t)"MX_MediaEndowmentManager.m", 722, 0, 0, mSerialQueue, (uint64_t)v3);
}

uint64_t __40__MXMediaEndowmentManager_dumpDebugInfo__block_invoke(uint64_t a1)
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359EF8)
  {
    unsigned int v164 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359EF8)
    {
      unsigned int v164 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      double v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 24);
  id v125 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v178, 16, v100, v107);
  if (v125)
  {
    uint64_t v122 = *(void *)v160;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v160 != v122) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v159 + 1) + 8 * v3);
        uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v4, v101, v108);
        if (dword_1E9359EF8)
        {
          unsigned int v164 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v7 = v164;
          if (os_log_type_enabled(v6, type)) {
            unsigned int v8 = v7;
          }
          else {
            unsigned int v8 = v7 & 0xFFFFFFFE;
          }
          if (v8)
          {
            int v171 = 136315394;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            __int16 v173 = 2114;
            uint64_t v174 = v4;
            LODWORD(v109) = 22;
            v102 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v128 = v3;
        long long v157 = 0u;
        long long v158 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        uint64_t v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v155, v177, 16, v102, v109);
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v156;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v156 != v11) {
                objc_enumerationMutation(v5);
              }
              if (dword_1E9359EF8)
              {
                uint64_t v13 = *(void *)(*((void *)&v155 + 1) + 8 * i);
                unsigned int v164 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                unsigned int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v15 = v164;
                if (os_log_type_enabled(v14, type)) {
                  unsigned int v16 = v15;
                }
                else {
                  unsigned int v16 = v15 & 0xFFFFFFFE;
                }
                if (v16)
                {
                  uint64_t v17 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v13), "explanation");
                  int v171 = 136315650;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  __int16 v173 = 2114;
                  uint64_t v174 = v13;
                  __int16 v175 = 2114;
                  uint64_t v176 = v17;
                  LODWORD(v108) = 32;
                  v101 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            uint64_t v10 = [v5 countByEnumeratingWithState:&v155 objects:v177 count:16];
          }
          while (v10);
        }
        if (dword_1E9359EF8)
        {
          unsigned int v164 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          unsigned int v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v19 = v164;
          if (os_log_type_enabled(v18, type)) {
            unsigned int v20 = v19;
          }
          else {
            unsigned int v20 = v19 & 0xFFFFFFFE;
          }
          if (v20)
          {
            int v171 = 136315138;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            LODWORD(v108) = 12;
            v101 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v3;
      }
      while ((id)(v128 + 1) != v125);
      id v125 = (id)[obj countByEnumeratingWithState:&v159 objects:v178 count:16];
    }
    while (v125);
  }
  if (dword_1E9359EF8)
  {
    unsigned int v164 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v22 = v164;
    if (os_log_type_enabled(v21, type)) {
      unsigned int v23 = v22;
    }
    else {
      unsigned int v23 = v22 & 0xFFFFFFFE;
    }
    if (v23)
    {
      int v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      LODWORD(v108) = 12;
      v101 = &v171;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359EF8)
    {
      unsigned int v164 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v25 = v164;
      if (os_log_type_enabled(v24, type)) {
        unsigned int v26 = v25;
      }
      else {
        unsigned int v26 = v25 & 0xFFFFFFFE;
      }
      if (v26)
      {
        int v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        LODWORD(v108) = 12;
        v101 = &v171;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v114 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v151, v170, 16, v101, v108);
  if (v116)
  {
    uint64_t v115 = *(void *)v152;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v152 != v115)
        {
          uint64_t v28 = v27;
          objc_enumerationMutation(v114);
          uint64_t v27 = v28;
        }
        uint64_t v117 = v27;
        uint64_t v29 = *(void *)(*((void *)&v151 + 1) + 8 * v27);
        id v126 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v29, v103, v110);
        if (dword_1E9359EF8)
        {
          unsigned int v164 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          long long v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v31 = v164;
          if (os_log_type_enabled(v30, type)) {
            unsigned int v32 = v31;
          }
          else {
            unsigned int v32 = v31 & 0xFFFFFFFE;
          }
          if (v32)
          {
            int v171 = 136315394;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            __int16 v173 = 2114;
            uint64_t v174 = v29;
            LODWORD(v111) = 22;
            v104 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        long long v149 = 0u;
        long long v150 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        uint64_t v123 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v147, v169, 16, v104, v111);
        if (v123)
        {
          id obja = *(id *)v148;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(id *)v148 != obja) {
                objc_enumerationMutation(v126);
              }
              uint64_t v129 = v33;
              uint64_t v34 = *(void *)(*((void *)&v147 + 1) + 8 * v33);
              if (dword_1E9359EF8)
              {
                unsigned int v164 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                long long v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v36 = v164;
                if (os_log_type_enabled(v35, type)) {
                  unsigned int v37 = v36;
                }
                else {
                  unsigned int v37 = v36 & 0xFFFFFFFE;
                }
                if (v37)
                {
                  int v171 = 136315394;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  __int16 v173 = 2114;
                  uint64_t v174 = v34;
                  LODWORD(v110) = 22;
                  v103 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              int v38 = objc_msgSend(v126, "objectForKey:", v34, v103, v110);
              long long v143 = 0u;
              long long v144 = 0u;
              long long v145 = 0u;
              long long v146 = 0u;
              uint64_t v39 = [v38 countByEnumeratingWithState:&v143 objects:v168 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v144;
                do
                {
                  for (uint64_t j = 0; j != v40; ++j)
                  {
                    if (*(void *)v144 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    if (dword_1E9359EF8)
                    {
                      uint64_t v43 = *(void *)(*((void *)&v143 + 1) + 8 * j);
                      unsigned int v164 = 0;
                      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                      __int16 v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                      unsigned int v45 = v164;
                      if (os_log_type_enabled(v44, type)) {
                        unsigned int v46 = v45;
                      }
                      else {
                        unsigned int v46 = v45 & 0xFFFFFFFE;
                      }
                      if (v46)
                      {
                        uint64_t v47 = [v38 objectForKey:v43];
                        int v171 = 136315650;
                        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                        __int16 v173 = 2114;
                        uint64_t v174 = v43;
                        __int16 v175 = 2114;
                        uint64_t v176 = v47;
                        LODWORD(v110) = 32;
                        v103 = &v171;
                        _os_log_send_and_compose_impl();
                      }
                      fig_log_call_emit_and_clean_up_after_send_and_compose();
                    }
                  }
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v143 objects:v168 count:16];
                }
                while (v40);
              }
              if (dword_1E9359EF8)
              {
                unsigned int v164 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                uint64_t v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v49 = v164;
                if (os_log_type_enabled(v48, type)) {
                  unsigned int v50 = v49;
                }
                else {
                  unsigned int v50 = v49 & 0xFFFFFFFE;
                }
                if (v50)
                {
                  int v171 = 136315138;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  LODWORD(v110) = 12;
                  v103 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              uint64_t v33 = v129 + 1;
            }
            while (v129 + 1 != v123);
            uint64_t v123 = [v126 countByEnumeratingWithState:&v147 objects:v169 count:16];
          }
          while (v123);
        }
        if (dword_1E9359EF8)
        {
          unsigned int v164 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          long long v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v52 = v164;
          if (os_log_type_enabled(v51, type)) {
            unsigned int v53 = v52;
          }
          else {
            unsigned int v53 = v52 & 0xFFFFFFFE;
          }
          if (v53)
          {
            int v171 = 136315138;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            LODWORD(v110) = 12;
            v103 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v27 = v117 + 1;
      }
      while (v117 + 1 != v116);
      uint64_t v116 = [v114 countByEnumeratingWithState:&v151 objects:v170 count:16];
    }
    while (v116);
  }
  if (dword_1E9359EF8)
  {
    unsigned int v164 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v55 = v164;
    if (os_log_type_enabled(v54, type)) {
      unsigned int v56 = v55;
    }
    else {
      unsigned int v56 = v55 & 0xFFFFFFFE;
    }
    if (v56)
    {
      int v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      LODWORD(v110) = 12;
      v103 = &v171;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359EF8)
    {
      unsigned int v164 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v58 = v164;
      if (os_log_type_enabled(v57, type)) {
        unsigned int v59 = v58;
      }
      else {
        unsigned int v59 = v58 & 0xFFFFFFFE;
      }
      if (v59)
      {
        int v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        LODWORD(v110) = 12;
        v103 = &v171;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id objb = *(id *)(*(void *)(a1 + 32) + 40);
  id v127 = (id)objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v139, v167, 16, v103, v110);
  if (v127)
  {
    uint64_t v124 = *(void *)v140;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v140 != v124) {
          objc_enumerationMutation(objb);
        }
        uint64_t v61 = *(void *)(*((void *)&v139 + 1) + 8 * v60);
        uint64_t v62 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectForKey:", v61, v105, v112);
        if (dword_1E9359EF8)
        {
          unsigned int v164 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v64 = v164;
          if (os_log_type_enabled(v63, type)) {
            unsigned int v65 = v64;
          }
          else {
            unsigned int v65 = v64 & 0xFFFFFFFE;
          }
          if (v65)
          {
            int v171 = 136315394;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            __int16 v173 = 2114;
            uint64_t v174 = v61;
            LODWORD(v113) = 22;
            v106 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v130 = v60;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        uint64_t v66 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v135, v166, 16, v106, v113);
        if (v66)
        {
          uint64_t v67 = v66;
          uint64_t v68 = *(void *)v136;
          do
          {
            for (uint64_t k = 0; k != v67; ++k)
            {
              if (*(void *)v136 != v68) {
                objc_enumerationMutation(v62);
              }
              if (dword_1E9359EF8)
              {
                uint64_t v70 = *(void *)(*((void *)&v135 + 1) + 8 * k);
                unsigned int v164 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v72 = v164;
                if (os_log_type_enabled(v71, type)) {
                  unsigned int v73 = v72;
                }
                else {
                  unsigned int v73 = v72 & 0xFFFFFFFE;
                }
                if (v73)
                {
                  uint64_t v74 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "objectForKey:", v70), "allObjects"), "componentsJoinedByString:", @",");
                  int v171 = 136315650;
                  v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
                  __int16 v173 = 2114;
                  uint64_t v174 = v70;
                  __int16 v175 = 2114;
                  uint64_t v176 = v74;
                  LODWORD(v112) = 32;
                  v105 = &v171;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            uint64_t v67 = [v62 countByEnumeratingWithState:&v135 objects:v166 count:16];
          }
          while (v67);
        }
        if (dword_1E9359EF8)
        {
          unsigned int v164 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v75 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v76 = v164;
          if (os_log_type_enabled(v75, type)) {
            unsigned int v77 = v76;
          }
          else {
            unsigned int v77 = v76 & 0xFFFFFFFE;
          }
          if (v77)
          {
            int v171 = 136315138;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            LODWORD(v112) = 12;
            v105 = &v171;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v60 = v130 + 1;
      }
      while ((id)(v130 + 1) != v127);
      id v127 = (id)[objb countByEnumeratingWithState:&v139 objects:v167 count:16];
    }
    while (v127);
  }
  if (dword_1E9359EF8)
  {
    unsigned int v164 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v78 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v79 = v164;
    if (os_log_type_enabled(v78, type)) {
      unsigned int v80 = v79;
    }
    else {
      unsigned int v80 = v79 & 0xFFFFFFFE;
    }
    if (v80)
    {
      int v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      LODWORD(v112) = 12;
      v105 = &v171;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359EF8)
    {
      unsigned int v164 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v82 = v164;
      if (os_log_type_enabled(v81, type)) {
        unsigned int v83 = v82;
      }
      else {
        unsigned int v83 = v82 & 0xFFFFFFFE;
      }
      if (v83)
      {
        int v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        LODWORD(v112) = 12;
        v105 = &v171;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v84 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t result = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v131, v165, 16, v105, v112);
  if (result)
  {
    uint64_t v86 = result;
    uint64_t v87 = *(void *)v132;
    do
    {
      uint64_t v88 = 0;
      do
      {
        if (*(void *)v132 != v87) {
          objc_enumerationMutation(v84);
        }
        if (dword_1E9359EF8)
        {
          uint64_t v89 = *(void *)(*((void *)&v131 + 1) + 8 * v88);
          unsigned int v164 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v90 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v91 = v164;
          if (os_log_type_enabled(v90, type)) {
            unsigned int v92 = v91;
          }
          else {
            unsigned int v92 = v91 & 0xFFFFFFFE;
          }
          if (v92)
          {
            uint64_t v93 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKey:", v89), "explanation");
            int v171 = 136315650;
            v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
            __int16 v173 = 2114;
            uint64_t v174 = v89;
            __int16 v175 = 2114;
            uint64_t v176 = v93;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v88;
      }
      while (v86 != v88);
      uint64_t result = [v84 countByEnumeratingWithState:&v131 objects:v165 count:16];
      uint64_t v86 = result;
    }
    while (result);
  }
  if (dword_1E9359EF8)
  {
    unsigned int v164 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v94 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v95 = v164;
    if (os_log_type_enabled(v94, type)) {
      unsigned int v96 = v95;
    }
    else {
      unsigned int v96 = v95 & 0xFFFFFFFE;
    }
    if (v96)
    {
      int v171 = 136315138;
      v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359EF8)
    {
      unsigned int v164 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v98 = v164;
      if (os_log_type_enabled(v97, type)) {
        unsigned int v99 = v98;
      }
      else {
        unsigned int v99 = v98 & 0xFFFFFFFE;
      }
      if (v99)
      {
        int v171 = 136315138;
        v172 = "-[MXMediaEndowmentManager dumpDebugInfo]_block_invoke";
        _os_log_send_and_compose_impl();
      }
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

@end