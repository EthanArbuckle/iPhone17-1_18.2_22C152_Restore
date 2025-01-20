@interface AEConcretePerformancePrimitivesInFlightInterval
- (id)initWithName:(void *)a3 signpostID:(void *)a4 log:;
- (void)dealloc;
- (void)endInterval;
@end

@implementation AEConcretePerformancePrimitivesInFlightInterval

- (void)dealloc
{
  [(AEConcretePerformancePrimitivesInFlightInterval *)self endInterval];
  v3.receiver = self;
  v3.super_class = (Class)AEConcretePerformancePrimitivesInFlightInterval;
  [(AEConcretePerformancePrimitivesInFlightInterval *)&v3 dealloc];
}

- (id)initWithName:(void *)a3 signpostID:(void *)a4 log:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)AEConcretePerformancePrimitivesInFlightInterval;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v9 = [v7 copy];
      id v10 = a1[2];
      a1[2] = (id)v9;

      a1[3] = a3;
      objc_storeStrong(a1 + 4, a4);
      *((unsigned char *)a1 + 8) = 0;
    }
  }

  return a1;
}

- (void)endInterval
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self)
  {
    if (self->_isEnded) {
      return;
    }
    self->_isEnded = 1;
    objc_super v3 = self->_log;
    v4 = v3;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
    {
      v6 = self->_name;
      int v7 = 136446210;
      uint64_t v8 = [(NSString *)v6 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_23D508000, v4, OS_SIGNPOST_INTERVAL_END, signpostID, "AAC Signposts", "%{public}s", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v4 = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end