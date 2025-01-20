@interface CFXNotificationCenterCopyDebugInfo
@end

@implementation CFXNotificationCenterCopyDebugInfo

void ___CFXNotificationCenterCopyDebugInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), @"{\n");
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, @"    token = %llx\n", *(void *)(a2 + 48));
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, @"    name = %@\n", *(void *)a2);
  CFStringRef v4 = @"    object = %@\n";
  if ((*(unsigned char *)(a2 + 25) & 4) == 0
    && (CFXNotificationRegistrarGetOptions(*(void *)(*(void *)(a1 + 40) + 16)) & 2) == 0)
  {
    CFStringRef v4 = @"    object = %p\n";
  }
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, v4, *(void *)(a2 + 8));
  if ((*(void *)(a2 + 24) & 0x400) != 0) {
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, @"    observer = %@\n", *(void *)(a2 + 16));
  }
  else {
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, @"    observer = %p\n", *(void *)(a2 + 16));
  }
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, @"    options = 0x%lx\n", *(void *)(a2 + 24));
  uint64_t v5 = *(void *)(a2 + 24);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *(void *)(a2 + 32);
    if (*(void *)(v8 + 16)) {
      v9 = *(const void **)(v8 + 16);
    }
    else {
      v9 = 0;
    }
    memset(&v13, 0, sizeof(v13));
    dladdr(v9, &v13);
    v11 = *(__CFString **)(a1 + 32);
    if (v13.dli_sname) {
      CFStringAppendFormat(v11, 0, @"    block = %s (%p)\n", v13.dli_sname, v8);
    }
    else {
      CFStringAppendFormat(v11, 0, @"    block = %p\n", v8);
    }
  }
  else if ((v5 & 0x40000) != 0)
  {
    v10 = *(__CFString **)(a1 + 32);
    Name = sel_getName(*(SEL *)(a2 + 32));
    CFStringAppendFormat(v10, 0, @"    selector = %s\n", Name);
  }
  else if ((v5 & 0x80000) != 0)
  {
    memset(&v13, 0, sizeof(v13));
    dladdr(*(const void **)(a2 + 32), &v13);
    v6 = *(__CFString **)(a1 + 32);
    uint64_t v7 = *(void *)(a2 + 32);
    if (v13.dli_sname) {
      CFStringAppendFormat(v6, 0, @"    callback = %s (%p)\n", v13.dli_sname, v7);
    }
    else {
      CFStringAppendFormat(v6, 0, @"    callback = %p\n", v7);
    }
  }
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), @"}\n");
}

@end