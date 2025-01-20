@interface CFPDMirroredSource
- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7;
- (CFPDMirroredSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 mirroredKeys:(__CFArray *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9;
- (id)acceptMessage:(id)a3;
- (id)createDiskWrite;
- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6;
- (void)clearCacheForReason:(__CFString *)a3;
- (void)dealloc;
- (void)drainPendingChanges;
- (void)enqueueMirrorSignatureForKey:(xpc_object_t)xdict fromMessage:;
- (void)handleWritingResult:(__CFDictionary *)a3;
- (void)lock;
- (void)unlock;
@end

@implementation CFPDMirroredSource

- (CFPDMirroredSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 mirroredKeys:(__CFArray *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  v23.receiver = self;
  v23.super_class = (Class)CFPDMirroredSource;
  v14 = [(CFPDSource *)&v23 initWithDomain:a3 userName:a4 byHost:a5 managed:a6 shmemIndex:a8 daemon:a9];
  if (v14)
  {
    uint64_t Count = CFArrayGetCount(a7);
    v14->_mirroredKeys = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFCopyStringSetCallBacks);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        mirroredKeys = v14->_mirroredKeys;
        ValueAtIndex = CFArrayGetValueAtIndex(a7, i);
        CFSetAddValue(mirroredKeys, ValueAtIndex);
      }
    }
    int v19 = CFEqual(a3, @"kCFPreferencesAnyApplication");
    v20 = @".GlobalPreferences";
    if (!v19) {
      v20 = a3;
    }
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@_m", v20);
    v14->_mirrorSource = [[CFPDSource alloc] initWithDomain:v21 userName:a4 byHost:v11 managed:v10 shmemIndex:0 daemon:0];
    CFRelease(v21);
  }
  return v14;
}

- (void)unlock
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  [(CFPDSource *)self->_mirrorSource unlock];
  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  [(CFPDSource *)&v3 unlock];
}

- (void)lock
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  [(CFPDSource *)&v3 lock];
  [(CFPDSource *)self->_mirrorSource lock];
}

- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = a3;
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  v14.receiver = self;
  v14.super_class = (Class)CFPDMirroredSource;
  unsigned int v11 = [(CFPDSource *)&v14 cacheFileInfoForWriting:v9 euid:v8 egid:v7 didCreate:a6];
  if (v11 <= 1)
  {
    char v13 = 0;
    [(CFPDSource *)self->_mirrorSource cacheFileInfoForWriting:v9 euid:v8 egid:v7 didCreate:&v13];
  }
  return v11;
}

- (id)acceptMessage:(id)a3
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  v10.receiver = self;
  v10.super_class = (Class)CFPDMirroredSource;
  id v5 = -[CFPDSource acceptMessage:](&v10, sel_acceptMessage_);
  if (xpc_dictionary_get_int64(a3, "CFPreferencesOperation") == 1
    && !xpc_dictionary_get_value(v5, "CFPreferencesErrorType")
    && (_CFPrefsDecodeKeyValuePairFromXPCMessage(a3, 0, 0, 0) & 1) == 0)
  {
    id v6 = [(CFPDSource *)self->_mirrorSource copyPropertyListValidatingPlist:0];
    uint64_t v7 = (void *)[v6 copyXPCData];
    if (v7)
    {
      uint64_t v8 = v7;
      xpc_dictionary_set_value(v5, "CFPreferencesValidationPropertyList", v7);
      xpc_release(v8);
    }
  }
  -[CFPDSource closeFileDescriptors]((uint64_t)self->_mirrorSource);
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  CFRelease(self->_mirroredKeys);

  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  [(CFPDSource *)&v3 dealloc];
}

- (void)enqueueMirrorSignatureForKey:(xpc_object_t)xdict fromMessage:
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    memset(buffer, 0, sizeof(buffer));
    remote_connection = xpc_dictionary_get_remote_connection(xdict);
    if (!remote_connection)
    {
      value = (_xpc_connection_s *)xpc_dictionary_get_value(xdict, "connection");
      if (!value || (remote_connection = value, object_getClass(value) != (Class)off_1ECE0A678)) {
        -[CFPDMirroredSource enqueueMirrorSignatureForKey:fromMessage:]();
      }
    }
    uint64_t pid = xpc_connection_get_pid(remote_connection);
    uint64_t v9 = pid;
    objc_super v10 = "Unknown";
    if (pid != -1 && proc_name(pid, buffer, 0x40u) >= 0) {
      objc_super v10 = (const char *)buffer;
    }
    v16.tv_sec = 0;
    *(void *)&v16.tv_usec = 0;
    memset(&v15, 0, sizeof(v15));
    gettimeofday(&v16, 0);
    localtime_r(&v16.tv_sec, &v15);
    uint64_t v11 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%s(%d): %04d-%02d-%02d %02d:%02d:%02d (%s)", v10, v9, (v15.tm_year + 1900), (v15.tm_mon + 1), v15.tm_mday, v15.tm_hour, v15.tm_min, v15.tm_sec, v15.tm_zone);
    v12 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%s%@", "Sig_", a2);
    xpc_object_t v13 = _CFXPCCreateXPCObjectFromCFObject(v12);
    xpc_object_t v14 = _CFXPCCreateXPCObjectFromCFObject(v11);
    [*(id *)(a1 + 152) enqueueNewKey:v13 value:v14 encoding:0 inBatch:0 fromMessage:xdict];
    CFRelease(v11);
    CFRelease(v12);
    xpc_release(v13);
    xpc_release(v14);
  }
}

- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  v18[5] = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  string_ptr = xpc_string_get_string_ptr(a3);
  if (string_ptr)
  {
    CFStringRef v14 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, string_ptr, 0x8000100u);
    if (v14)
    {
      CFStringRef v15 = v14;
      if (CFSetContainsValue(self->_mirroredKeys, v14))
      {
        if (!a4 || object_getClass(a4) == (Class)off_1ECE0A6B0)
        {
          CFRelease(v15);
          v18[0] = off_1ECE0A5A0;
          v18[1] = 3221225472;
          v18[2] = __ERROR_WRITE_REJECTED_block_invoke;
          v18[3] = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
          v18[4] = "the key cannot be deleted";
          _extractCFPDBits(a7, a3, self, (uint64_t)v18);
          return 0;
        }
        [(CFPDSource *)self->_mirrorSource enqueueNewKey:a3 value:a4 encoding:v9 inBatch:v8 fromMessage:a7];
        -[CFPDMirroredSource enqueueMirrorSignatureForKey:fromMessage:]((uint64_t)self, (uint64_t)v15, a7);
      }
      CFRelease(v15);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CFPDMirroredSource;
  [(CFPDSource *)&v17 enqueueNewKey:a3 value:a4 encoding:v9 inBatch:v8 fromMessage:a7];
  return 1;
}

- (void)drainPendingChanges
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  [(CFPDSource *)self->_mirrorSource drainPendingChanges];
  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  [(CFPDSource *)&v3 drainPendingChanges];
}

- (id)createDiskWrite
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  v7.receiver = self;
  v7.super_class = (Class)CFPDMirroredSource;
  id result = [(CFPDSource *)&v7 createDiskWrite];
  if (result)
  {
    id v4 = result;
    id v5 = [(CFPDSource *)self->_mirrorSource createDiskWrite];
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __37__CFPDMirroredSource_createDiskWrite__block_invoke;
    v6[3] = &unk_1ECE00398;
    v6[4] = v4;
    v6[5] = v5;
    return (id)[v6 copy];
  }
  return result;
}

uint64_t __37__CFPDMirroredSource_createDiskWrite__block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      uint64_t v2 = (*(uint64_t (**)(void))(v3 + 16))();
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

- (void)handleWritingResult:(__CFDictionary *)a3
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  v5.receiver = self;
  v5.super_class = (Class)CFPDMirroredSource;
  [(CFPDSource *)&v5 handleWritingResult:a3];
  [(CFPDSource *)self->_mirrorSource handleWritingResult:a3];
}

- (void)clearCacheForReason:(__CFString *)a3
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  -[CFPDSource clearCacheForReason:](self->_mirrorSource, "clearCacheForReason:");
  v5.receiver = self;
  v5.super_class = (Class)CFPDMirroredSource;
  [(CFPDSource *)&v5 clearCacheForReason:a3];
}

- (void)enqueueMirrorSignatureForKey:fromMessage:.cold.1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end