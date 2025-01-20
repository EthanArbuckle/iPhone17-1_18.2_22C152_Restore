@interface OS_nw_array
- (id)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_nw_array

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = self + 40;
  LOBYTE(v3) = atomic_load_explicit((atomic_uchar *volatile)&self[5], memory_order_acquire);
  if (!v3)
  {
    isa = self[2].super.super.isa;
    if (isa)
    {
      Class v6 = self[3].super.super.isa;
      Class v7 = self[2].super.super.isa;
      if (v6 != isa)
      {
        Class v8 = self[3].super.super.isa;
        do
        {
          v10 = (void *)*((void *)v8 - 1);
          Class v8 = (Class)((char *)v8 - 8);
          v9 = v10;
          if (v10) {
            os_release(v9);
          }
          *((void *)v6 - 1) = 0;
          Class v6 = v8;
        }
        while (v8 != isa);
        Class v7 = self[2].super.super.isa;
      }
      self[3].super.super.isa = isa;
      operator delete(v7);
    }
    goto LABEL_12;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_ERROR);
  int v14 = 136446210;
  v15 = "nw_array_dispose";
  int v12 = 12;
  v11 = &v14;
  v4 = (void *)_os_log_send_and_compose_impl();
  if (!__nwlog_abort((uint64_t)v4))
  {
    free(v4);
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)OS_nw_array;
    [(OS_nw_array *)&v13 dealloc];
    return;
  }
  __break(1u);
}

- (id)redactedDescription
{
  if (nwlog_get_sensitive_redacted::onceToken != -1) {
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_75);
  }
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    if (self && (int64_t v3 = self[3].super.super.isa - self[2].super.super.isa, (unint64_t)v3 >= 8))
    {
      uint64_t v5 = v3 >> 3;
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      Class v6 = nw_array_get_object_at_index((uint64_t)self, 0);
      Class v7 = @"<redacted>";
      if (v5 == 1)
      {
        if (objc_opt_respondsToSelector())
        {
          Class v7 = [v6 redactedDescription];
        }
        CFStringAppendFormat(Mutable, 0, @"[%zu - %@]", 0, v7);
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          Class v7 = [v6 redactedDescription];
        }
        CFStringAppendFormat(Mutable, 0, @"[%zu - %@", 0, v7);

        uint64_t v8 = 0;
        do
        {
          v9 = nw_array_get_object_at_index((uint64_t)self, v8 + 1);
          v10 = @"<redacted>";
          if (objc_opt_respondsToSelector())
          {
            v10 = [v9 redactedDescription];
          }
          if (v5 - 2 == v8) {
            CFStringAppendFormat(Mutable, 0, @", %zu - %@]", v8 + 1, v10);
          }
          else {
            CFStringAppendFormat(Mutable, 0, @", %zu - %@", v8 + 1, v10);
          }

          ++v8;
        }
        while (v5 - 1 != v8);
      }
    }
    else
    {
      Mutable = @"[]";
    }
  }
  else
  {
    Mutable = [(OS_nw_array *)self description];
  }

  return Mutable;
}

- (id)description
{
  if (self && (int64_t v3 = self[3].super.super.isa - self[2].super.super.isa, (unint64_t)v3 >= 8))
  {
    uint64_t v6 = v3 >> 3;
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    uint64_t v7 = nw_array_get_object_at_index((uint64_t)self, 0);
    uint64_t v8 = (void *)v7;
    unint64_t v9 = v6 - 1;
    if (v6 == 1)
    {
      CFStringAppendFormat(Mutable, 0, @"[%zu - %@]", 0, v7);
    }
    else
    {
      CFStringAppendFormat(Mutable, 0, @"[%zu - %@", 0, v7);

      uint64_t v10 = 0;
      do
      {
        if (v6 - 2 == v10)
        {
          v11 = nw_array_get_object_at_index((uint64_t)self, v9);
          CFStringAppendFormat(Mutable, 0, @", %zu - %@]", v9, v11);
        }
        else
        {
          v11 = nw_array_get_object_at_index((uint64_t)self, v10 + 1);
          CFStringAppendFormat(Mutable, 0, @", %zu - %@", v10 + 1, v11);
        }

        ++v10;
      }
      while (v9 != v10);
    }
  }
  else
  {
    Mutable = @"[]";
  }

  return Mutable;
}

@end