@interface AEConcretePerformancePrimitives
- (id)beginIntervalWithCategory:(id)a3 name:(id)a4;
- (void)initWithSubsystem:(void *)a1;
@end

@implementation AEConcretePerformancePrimitives

- (void)initWithSubsystem:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)AEConcretePerformancePrimitives;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (id)beginIntervalWithCategory:(id)a3 name:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self) {
    subsystem = self->_subsystem;
  }
  else {
    subsystem = 0;
  }
  v8 = subsystem;
  id v9 = a3;
  v10 = [(NSString *)v8 UTF8String];
  id v11 = v9;
  v12 = (const char *)[v11 UTF8String];

  v13 = os_log_create(v10, v12);
  v14 = (char *)os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    int v19 = 136446210;
    uint64_t v20 = [v6 UTF8String];
    _os_signpost_emit_with_name_impl(&dword_23D508000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "AAC Signposts", "%{public}s", (uint8_t *)&v19, 0xCu);
  }

  v17 = -[AEConcretePerformancePrimitivesInFlightInterval initWithName:signpostID:log:]((id *)[AEConcretePerformancePrimitivesInFlightInterval alloc], v6, v14, v16);
  return v17;
}

- (void).cxx_destruct
{
}

@end