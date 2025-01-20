@interface XPC
@end

@implementation XPC

void __dsrxpc_callback_handleEmitFrame_XPC_block_invoke(uint64_t a1)
{
  uint64_t v14 = 0;
  if (dsrxpc_tryDecrementPendingFrameInfoOutstandingEmitCountToEmit(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 16)))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(uint64_t **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(unsigned int *)(a1 + 64);
    uint64_t v6 = *(unsigned int *)(a1 + 68);
    long long v12 = *(_OWORD *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 88);
    long long v10 = *(_OWORD *)(a1 + 96);
    uint64_t v11 = *(void *)(a1 + 112);
    dsrxpc_handleEmitFrame(v2, v3, v4, v5, v6, &v12, &v10);
  }
  if (!FigXPCCreateBasicMessage()) {
    FigXPCRemoteClientSendSyncMessage();
  }
  FigXPCRelease();
  v7 = *(const void **)(a1 + 48);
  if (v7) {
    CFRelease(v7);
  }
  v8 = *(const void **)(a1 + 40);
  if (v8) {
    CFRelease(v8);
  }
  v9 = *(const void **)(a1 + 32);
  if (v9) {
    CFRelease(v9);
  }
}

@end