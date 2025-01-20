@interface _NSXPCConnectionRequestedReplies
- (_NSXPCConnectionRequestedReplies)init;
- (os_unfair_lock_s)progressForSequence:(os_unfair_lock_s *)result;
- (void)beginTransactionForSequence:(const char *)a3 selector:(const void *)a4 reply:(const void *)a5 withProgress:;
- (void)dealloc;
- (void)endTransactionForSequence:(uint64_t)a3 completionHandler:;
- (void)invalidate;
@end

@implementation _NSXPCConnectionRequestedReplies

- (_NSXPCConnectionRequestedReplies)init
{
  self->_lock._os_unfair_lock_opaque = 0;
  return self;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  replyDictionaryTable = self->_replyDictionaryTable;
  if (replyDictionaryTable) {
    CFRelease(replyDictionaryTable);
  }
  replyTransactionTable = self->_replyTransactionTable;
  if (replyTransactionTable) {
    CFRelease(replyTransactionTable);
  }
  progressTable = self->_progressTable;
  if (progressTable) {
    CFRelease(progressTable);
  }
  v6.receiver = self;
  v6.super_class = (Class)_NSXPCConnectionRequestedReplies;
  [(_NSXPCConnectionRequestedReplies *)&v6 dealloc];
}

- (void)invalidate
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 36) = 1;
    v3 = *(const void **)(a1 + 24);
    if (v3) {
      CFRelease(v3);
    }
    *(void *)(a1 + 24) = 0;
    v4 = *(const void **)(a1 + 8);
    if (v4) {
      CFRelease(v4);
    }
    *(void *)(a1 + 8) = 0;
    v5 = *(const void **)(a1 + 16);
    if (v5) {
      CFRelease(v5);
    }
    *(void *)(a1 + 16) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (void)beginTransactionForSequence:(const char *)a3 selector:(const void *)a4 reply:(const void *)a5 withProgress:
{
  if (a1)
  {
    v10 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    if (!*(unsigned char *)(a1 + 36))
    {
      sel_getName(a3);
      v11 = (void *)os_transaction_create();
      if (a5)
      {
        Mutable = *(__CFDictionary **)(a1 + 24);
        if (!Mutable)
        {
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, MEMORY[0x1E4F1D540]);
          *(void *)(a1 + 24) = Mutable;
        }
        CFDictionarySetValue(Mutable, a2, a5);
      }
      v13 = *(__CFDictionary **)(a1 + 8);
      if (!v13)
      {
        v13 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 1, 0, &_xpcTypeCallbacks);
        *(void *)(a1 + 8) = v13;
      }
      CFDictionarySetValue(v13, a2, a4);
      v14 = *(__CFDictionary **)(a1 + 16);
      if (!v14)
      {
        v14 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 1, 0, MEMORY[0x1E4F1D540]);
        *(void *)(a1 + 16) = v14;
      }
      CFDictionarySetValue(v14, a2, v11);
    }
    os_unfair_lock_unlock(v10);
  }
}

- (void)endTransactionForSequence:(uint64_t)a3 completionHandler:
{
  if (a1)
  {
    objc_super v6 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    int v7 = *(unsigned __int8 *)(a1 + 36);
    if (!*(unsigned char *)(a1 + 36))
    {
      v8 = *(__CFDictionary **)(a1 + 24);
      if (v8) {
        CFDictionaryRemoveValue(v8, a2);
      }
    }
    CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 8);
    if (v9)
    {
      Value = (void *)CFDictionaryGetValue(v9, a2);
      id v11 = Value;
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), a2);
    }
    else
    {
      Value = 0;
    }
    CFDictionaryRef v12 = *(const __CFDictionary **)(a1 + 16);
    if (v12)
    {
      v13 = (void *)CFDictionaryGetValue(v12, a2);
      id v14 = v13;
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), a2);
    }
    else
    {
      v13 = 0;
    }
    os_unfair_lock_unlock(v6);
    if (!v7) {
      (*(void (**)(uint64_t))(a3 + 16))(a3);
    }
  }
}

- (os_unfair_lock_s)progressForSequence:(os_unfair_lock_s *)result
{
  if (result)
  {
    v3 = result;
    v4 = result + 8;
    os_unfair_lock_lock_with_options();
    if (LOBYTE(v3[9]._os_unfair_lock_opaque) || (CFDictionaryRef v6 = *(const __CFDictionary **)&v3[6]._os_unfair_lock_opaque) == 0) {
      v5 = 0;
    }
    else {
      v5 = (id)CFDictionaryGetValue(v6, a2);
    }
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)v5;
  }
  return result;
}

@end