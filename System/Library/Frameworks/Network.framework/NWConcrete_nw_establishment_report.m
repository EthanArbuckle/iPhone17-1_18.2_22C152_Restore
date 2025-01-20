@interface NWConcrete_nw_establishment_report
- (NSString)description;
- (NWConcrete_nw_establishment_report)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_establishment_report

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_establishment_report;
  [(NWConcrete_nw_establishment_report *)&v2 dealloc];
}

- (NWConcrete_nw_establishment_report)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_establishment_report;
  objc_super v2 = [(NWConcrete_nw_establishment_report *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_establishment_report init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_establishment_report init]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v8 = __nwlog_obj();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_establishment_report init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_establishment_report init]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_establishment_report init]";
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->resolution_reports, 0);
  objc_storeStrong((id *)&self->protocol_reports, 0);
  objc_storeStrong((id *)&self->proxied_next_hop_endpoints, 0);

  objc_storeStrong((id *)&self->proxy_endpoints, 0);
}

- (NSString)description
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  uint64_t duration_milliseconds = nw_establishment_report_get_duration_milliseconds(&self->super);
  uint64_t attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds(&self->super);
  uint64_t previous_attempt_count = nw_establishment_report_get_previous_attempt_count(&self->super);
  CFStringAppendFormat(Mutable, 0, @"Establishment Report:\n\tDuration: %llums\n\tAttempt Started After: %llums\n\tPrevious Attempts: %u\n", duration_milliseconds, attempt_started_after_milliseconds, previous_attempt_count);
  enumerate_block[0] = MEMORY[0x1E4F143A8];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke;
  enumerate_block[3] = &__block_descriptor_40_e51_B32__0__NSObject_OS_nw_protocol_definition__8Q16Q24l;
  enumerate_block[4] = Mutable;
  nw_establishment_report_enumerate_protocols(&self->super, enumerate_block);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke_2;
  v17[3] = &__block_descriptor_40_e41_B16__0__NWConcrete_nw_resolution_report_8l;
  v17[4] = Mutable;
  nw_establishment_report_enumerate_resolution_reports(&self->super, v17);
  if (nw_establishment_report_get_proxy_configured(&self->super)) {
    v7 = "";
  }
  else {
    v7 = "not ";
  }
  if (nw_establishment_report_get_used_proxy(&self->super)) {
    v8 = "";
  }
  else {
    v8 = "not ";
  }
  CFStringAppendFormat(Mutable, 0, @"\tProxy %sconfigured, %sused, to ", v7, v8);
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke_3;
  v12[3] = &unk_1E523B7B8;
  v12[4] = &v13;
  v12[5] = Mutable;
  nw_establishment_report_enumerate_proxy_endpoints(self, v12);
  if (!*((unsigned char *)v14 + 24)) {
    CFStringAppendFormat(Mutable, 0, @"unknown");
  }
  unsigned int v9 = self->privacy_stance - 1;
  if (v9 > 4) {
    v10 = "Unknown";
  }
  else {
    v10 = off_1E523B910[v9];
  }
  CFStringAppendFormat(Mutable, 0, @"\n\tPrivacy stance: %s", v10);
  _Block_object_dispose(&v13, 8);

  return (NSString *)Mutable;
}

@end