@interface OS_nw_dictionary
- (id)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_nw_dictionary

- (void)dealloc
{
  Class isa = self[2].super.super.isa;
  if (isa)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 0x40000000;
    applier[2] = __nw_dictionary_dispose_block_invoke;
    applier[3] = &__block_descriptor_tmp_48720;
    applier[4] = self;
    xpc_dictionary_apply(isa, applier);
    Class v4 = self[2].super.super.isa;
    if (v4)
    {
      xpc_release(v4);
      self[2].super.super.Class isa = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_nw_dictionary;
  [(OS_nw_dictionary *)&v5 dealloc];
}

- (id)description
{
  if (nw_dictionary_get_count((uint64_t)self))
  {
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    Class v4 = Mutable;
    if (Mutable)
    {
      char v7 = 1;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48__OS_nw_dictionary_nw_descriptions__description__block_invoke;
      v6[3] = &__block_descriptor_48_e36_B24__0r_8__NSObject_OS_nw_object__16l;
      v6[4] = &v7;
      v6[5] = Mutable;
      nw_dictionary_apply((uint64_t)self, (uint64_t)v6);
      CFStringAppend(v4, @"}");
    }
  }
  else
  {
    Class v4 = @"{}";
  }

  return v4;
}

- (id)redactedDescription
{
  if (nwlog_get_sensitive_redacted::onceToken != -1) {
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_75);
  }
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    if (nw_dictionary_get_count((uint64_t)self))
    {
      CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      Class v4 = Mutable;
      if (Mutable)
      {
        char v7 = 1;
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __56__OS_nw_dictionary_nw_descriptions__redactedDescription__block_invoke;
        v6[3] = &__block_descriptor_48_e36_B24__0r_8__NSObject_OS_nw_object__16l;
        v6[4] = &v7;
        v6[5] = Mutable;
        nw_dictionary_apply((uint64_t)self, (uint64_t)v6);
        CFStringAppend(v4, @"}");
      }
    }
    else
    {
      Class v4 = @"{}";
    }
  }
  else
  {
    Class v4 = [(OS_nw_dictionary *)self description];
  }

  return v4;
}

@end