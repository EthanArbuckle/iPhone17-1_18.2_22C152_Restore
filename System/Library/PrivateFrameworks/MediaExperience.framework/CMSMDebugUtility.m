@interface CMSMDebugUtility
@end

@implementation CMSMDebugUtility

void __CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = MXGetSerialQueue();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a2;
  MXDispatchAsyncAndWait((uint64_t)"CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke", (uint64_t)"MXSessionManagerDebugUtilitiesCommon.m", 724, 0, 0, v3, (uint64_t)v4);
}

uint64_t __CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke_2(uint64_t result)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v1 = *(FILE **)(result + 32);
  if (v1)
  {
    [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
    fwrite("CMSESSION STATE\n", 0x10uLL, 1uLL, v1);
    fwrite("Playing Sessions\n", 0x11uLL, 1uLL, v1);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v2 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
    uint64_t v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v7 isPlaying])
          {
            v25[0] = 0;
            [v7 clientName];
            CStringPtrAndBufferToFree = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
            fprintf(v1, "Name: %s\n", CStringPtrAndBufferToFree);
            free(v25[0]);
          }
        }
        uint64_t v4 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v4);
    }
    fwrite("\nActive Sessions\n", 0x11uLL, 1uLL, v1);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
    uint64_t v10 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * j);
          if ([v14 isActive])
          {
            [v14 clientName];
            v15 = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
            if ([v14 displayID]) {
              [v14 displayID];
            }
            v16 = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
            fprintf(v1, "Name: %s DisplayID %s \n", v15, v16);
            free(0);
            free(0);
          }
        }
        uint64_t v11 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }
    fwrite("\n\n", 2uLL, 1uLL, v1);
    return [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  }
  return result;
}

@end