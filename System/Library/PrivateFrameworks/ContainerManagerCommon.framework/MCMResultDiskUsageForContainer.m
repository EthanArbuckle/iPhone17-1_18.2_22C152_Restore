@interface MCMResultDiskUsageForContainer
+ (id)_reportingWorkloop;
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultDiskUsageForContainer)initWithDiskUsageBytes:(unint64_t)a3 descendants:(unint64_t)a4 containerClass:(unint64_t)a5 personaType:(int)a6;
- (int)personaType;
- (unint64_t)_roundToTwoSignificantDigitsWithNumber:(unint64_t)a3;
- (unint64_t)containerClass;
- (unint64_t)descendants;
- (unint64_t)diskUsageBytes;
- (void)_report;
- (void)setContainerClass:(unint64_t)a3;
- (void)setDescendants:(unint64_t)a3;
- (void)setDiskUsageBytes:(unint64_t)a3;
- (void)setPersonaType:(int)a3;
@end

@implementation MCMResultDiskUsageForContainer

- (void)setPersonaType:(int)a3
{
  self->_personaType = a3;
}

- (int)personaType
{
  return self->_personaType;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_containerClass = a3;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (void)setDescendants:(unint64_t)a3
{
  self->_descendants = a3;
}

- (unint64_t)descendants
{
  return self->_descendants;
}

- (void)setDiskUsageBytes:(unint64_t)a3
{
  self->_diskUsageBytes = a3;
}

- (unint64_t)diskUsageBytes
{
  return self->_diskUsageBytes;
}

- (unint64_t)_roundToTwoSignificantDigitsWithNumber:(unint64_t)a3
{
  double v3 = (double)a3;
  double v4 = log10((double)a3);
  double v5 = __exp10(ceil(v4) + -2.0);
  return (unint64_t)(v5 * floor(v3 / v5 + 0.5));
}

- (void)_report
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MCMResultDiskUsageForContainer *)self _roundToTwoSignificantDigitsWithNumber:self->_descendants];
  unint64_t v4 = [(MCMResultDiskUsageForContainer *)self _roundToTwoSignificantDigitsWithNumber:self->_diskUsageBytes];
  int personaType = self->_personaType;
  unint64_t containerClass = self->_containerClass;
  v7 = container_log_handle_for_category();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  v9 = [(id)objc_opt_class() _reportingWorkloop];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__MCMResultDiskUsageForContainer__report__block_invoke;
  v10[3] = &__block_descriptor_68_e5_v8__0l;
  int v11 = personaType;
  v10[4] = containerClass;
  v10[5] = v8;
  v10[6] = v3;
  v10[7] = v4;
  dispatch_async(v9, v10);
}

void __41__MCMResultDiskUsageForContainer__report__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == 7)
  {
    int v10 = *(_DWORD *)(a1 + 64);
    if (v10 == 1)
    {
      v21 = container_log_handle_for_category();
      double v5 = v21;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
        goto LABEL_29;
      }
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v23 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v22;
      __int16 v29 = 2050;
      uint64_t v30 = v23;
      v9 = "DiskUsage_Managed_appGroup";
    }
    else
    {
      if (v10) {
        return;
      }
      int v11 = container_log_handle_for_category();
      double v5 = v11;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v11)) {
        goto LABEL_29;
      }
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v12;
      __int16 v29 = 2050;
      uint64_t v30 = v13;
      v9 = "DiskUsage_appGroup";
    }
    goto LABEL_28;
  }
  if (v2 != 4)
  {
    if (v2 != 2) {
      return;
    }
    int v3 = *(_DWORD *)(a1 + 64);
    if (v3 == 1)
    {
      v18 = container_log_handle_for_category();
      double v5 = v18;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v18)) {
        goto LABEL_29;
      }
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v19;
      __int16 v29 = 2050;
      uint64_t v30 = v20;
      v9 = "DiskUsage_Managed_appData";
    }
    else
    {
      if (v3) {
        return;
      }
      unint64_t v4 = container_log_handle_for_category();
      double v5 = v4;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v4)) {
        goto LABEL_29;
      }
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v7;
      __int16 v29 = 2050;
      uint64_t v30 = v8;
      v9 = "DiskUsage_appData";
    }
    goto LABEL_28;
  }
  int v14 = *(_DWORD *)(a1 + 64);
  if (v14 == 1)
  {
    v24 = container_log_handle_for_category();
    double v5 = v24;
    os_signpost_id_t v6 = *(void *)(a1 + 40);
    if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_29;
    }
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 56);
    int v27 = 134349312;
    uint64_t v28 = v25;
    __int16 v29 = 2050;
    uint64_t v30 = v26;
    v9 = "DiskUsage_Managed_pluginData";
    goto LABEL_28;
  }
  if (v14) {
    return;
  }
  v15 = container_log_handle_for_category();
  double v5 = v15;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    int v27 = 134349312;
    uint64_t v28 = v16;
    __int16 v29 = 2050;
    uint64_t v30 = v17;
    v9 = "DiskUsage_pluginData";
LABEL_28:
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v5, OS_SIGNPOST_EVENT, v6, v9, " enableTelemetry=YES  descendants=%{public, signpost.telemetry:number1}llu bytes=%{public, signpost.telemetry:number2}llu", (uint8_t *)&v27, 0x16u);
  }
LABEL_29:
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCMResultDiskUsageForContainer;
  BOOL v5 = [(MCMResultBase *)&v8 encodeResultOntoReply:v4];
  if (v5)
  {
    os_signpost_id_t v6 = [(MCMResultBase *)self error];

    if (!v6) {
      xpc_dictionary_set_uint64(v4, "ReplyDiskUsage", [(MCMResultDiskUsageForContainer *)self diskUsageBytes]);
    }
  }

  return v5;
}

- (MCMResultDiskUsageForContainer)initWithDiskUsageBytes:(unint64_t)a3 descendants:(unint64_t)a4 containerClass:(unint64_t)a5 personaType:(int)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MCMResultDiskUsageForContainer;
  int v10 = [(MCMResultBase *)&v13 init];
  int v11 = v10;
  if (v10)
  {
    v10->_diskUsageBytes = a3;
    v10->_descendants = a4;
    v10->_unint64_t containerClass = a5;
    v10->_int personaType = a6;
    [(MCMResultDiskUsageForContainer *)v10 _report];
  }
  return v11;
}

+ (id)_reportingWorkloop
{
  if (_reportingWorkloop_onceToken != -1) {
    dispatch_once(&_reportingWorkloop_onceToken, &__block_literal_global_13568);
  }
  uint64_t v2 = (void *)_reportingWorkloop_workloop;

  return v2;
}

uint64_t __52__MCMResultDiskUsageForContainer__reportingWorkloop__block_invoke()
{
  _reportingWorkloop_workloop = (uint64_t)dispatch_workloop_create("com.apple.containermanagerd.disk-usage-reporting");

  return MEMORY[0x1F41817F8]();
}

@end