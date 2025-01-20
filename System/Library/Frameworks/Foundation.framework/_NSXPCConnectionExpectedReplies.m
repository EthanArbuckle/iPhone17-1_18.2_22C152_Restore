@interface _NSXPCConnectionExpectedReplies
- (_NSXPCConnectionExpectedReplies)init;
- (char)sequenceForProgress:(uint64_t)a1;
- (os_unfair_lock_s)progressForSequence:(os_unfair_lock_s *)result;
- (void)dealloc;
- (void)removeProgressSequence:(uint64_t)a1;
@end

@implementation _NSXPCConnectionExpectedReplies

- (_NSXPCConnectionExpectedReplies)init
{
  self->_sequence = 1;
  self->_lock._os_unfair_lock_opaque = 0;
  return self;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  replyTable = self->_replyTable;
  if (replyTable) {
    CFRelease(replyTable);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSXPCConnectionExpectedReplies;
  [(_NSXPCConnectionExpectedReplies *)&v4 dealloc];
}

- (char)sequenceForProgress:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  objc_super v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock_with_options();
  uint64_t v5 = *(char **)(a1 + 16);
  *(void *)(a1 + 16) = v5 + 1;
  if (a2)
  {
    Mutable = *(__CFDictionary **)(a1 + 8);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, MEMORY[0x1E4F1D540]);
      *(void *)(a1 + 8) = Mutable;
    }
    CFDictionarySetValue(Mutable, v5, a2);
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

- (void)removeProgressSequence:(uint64_t)a1
{
  if (a1)
  {
    objc_super v4 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock_with_options();
    Mutable = *(__CFDictionary **)(a1 + 8);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, MEMORY[0x1E4F1D540]);
      *(void *)(a1 + 8) = Mutable;
    }
    CFDictionaryRemoveValue(Mutable, a2);
    os_unfair_lock_unlock(v4);
  }
}

- (os_unfair_lock_s)progressForSequence:(os_unfair_lock_s *)result
{
  if (result)
  {
    v3 = result;
    objc_super v4 = result + 6;
    os_unfair_lock_lock_with_options();
    CFDictionaryRef Mutable = *(const __CFDictionary **)&v3[2]._os_unfair_lock_opaque;
    if (!Mutable)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, MEMORY[0x1E4F1D540]);
      *(void *)&v3[2]._os_unfair_lock_opaque = Mutable;
    }
    Value = (void *)CFDictionaryGetValue(Mutable, a2);
    id v7 = Value;
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)Value;
  }
  return result;
}

@end