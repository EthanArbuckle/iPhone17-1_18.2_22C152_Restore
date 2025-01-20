@interface PostEvent
@end

@implementation PostEvent

void __ftd_PostEvent_block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  long long v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[2] = __ftd_PostEvent_block_invoke_2;
  v5[3] = &unk_1E567E1A8;
  long long v6 = v2;
  int v7 = *(_DWORD *)(a1 + 56);
  v5[4] = &v8;
  dispatch_sync(v3, v5);
  if (*((unsigned char *)v9 + 24)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 16))();
  }
  v4 = *(const void **)(a1 + 48);
  if (v4) {
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(&v8, 8);
}

CFIndex __ftd_PostEvent_block_invoke_2(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 40) + 32);
  v4.length = CFArrayGetCount(v2);
  v4.location = 0;
  CFIndex result = CFArrayGetFirstIndexOfValue(v2, v4, *(const void **)(a1 + 48));
  if (result != -1 && **(_DWORD **)(a1 + 48) == *(_DWORD *)(a1 + 56)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end