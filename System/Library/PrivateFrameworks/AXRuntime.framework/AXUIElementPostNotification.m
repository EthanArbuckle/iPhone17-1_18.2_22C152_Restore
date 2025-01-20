@interface AXUIElementPostNotification
@end

@implementation AXUIElementPostNotification

void ___AXUIElementPostNotification_block_invoke_2()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v5 = 0u;
  CFDataRef v1 = *(const __CFData **)(*(void *)(*(void *)(v0 + 32) + 8) + 24);
  if (v1)
  {
    v37.length = *(unsigned int *)(v0 + 72);
    v37.location = 0;
    CFDataGetBytes(v1, v37, buffer);
  }
  _AXMIGPostNotification(*(unsigned int *)(*(void *)(v0 + 40) + 16), *(unsigned int *)(v0 + 76), *(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned int *)(v0 + 80), (uint64_t)buffer, *(unsigned int *)(v0 + 72), *(void *)(v0 + 64), *(_DWORD *)(v0 + 84), *(void *)(*(void *)(v0 + 40) + 24));
  size_t v2 = *(unsigned int *)(v0 + 84);
  if (v2) {
    munmap(*(void **)(v0 + 64), v2);
  }
  CFRelease(*(CFTypeRef *)(v0 + 40));
  v3 = *(const void **)(*(void *)(*(void *)(v0 + 32) + 8) + 24);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(*(void *)(v0 + 32) + 8) + 24) = 0;
  }
}

void ___AXUIElementPostNotification_block_invoke()
{
  size_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("post-ax-notify", v2);
  CFDataRef v1 = (void *)_AXUIElementPostNotification_DifferentQueue;
  _AXUIElementPostNotification_DifferentQueue = (uint64_t)v0;
}

@end