@interface IMPerfProfiler
+ (id)instance;
- (IMPerfProfiler)init;
- (void)addSink:(id)a3 withBehavior:(id)a4;
- (void)logMeasurement:(IMPerfMeasurement_t *)a3;
@end

@implementation IMPerfProfiler

+ (id)instance
{
  if (qword_1E92DB608 != -1) {
    dispatch_once(&qword_1E92DB608, &unk_1EE22FB98);
  }
  v2 = (void *)qword_1E92DB600;
  return v2;
}

- (IMPerfProfiler)init
{
  v15.receiver = self;
  v15.super_class = (Class)IMPerfProfiler;
  v2 = [(IMPerfProfiler *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sinks = v2->_sinks;
    v2->_sinks = v3;

    v8 = objc_msgSend_instance(IMPerfNSLogProfilerSink, v5, v6, v7);
    v12 = objc_msgSend_instance(IMPerfProfilerDefaultBehavior, v9, v10, v11);
    objc_msgSend_addSink_withBehavior_(v2, v13, (uint64_t)v8, (uint64_t)v12);
  }
  return v2;
}

- (void)addSink:(id)a3 withBehavior:(id)a4
{
  sinks = self->_sinks;
  id v6 = a4;
  id v7 = a3;
  v8 = [IMPerfSinkPair alloc];
  id v12 = (id)objc_msgSend_initWithBehavior_sink_(v8, v9, (uint64_t)v6, (uint64_t)v7);

  objc_msgSend_addObject_(sinks, v10, (uint64_t)v12, v11);
}

- (void)logMeasurement:(IMPerfMeasurement_t *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = self;
  objc_sync_enter(v4);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = v4->_sinks;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = objc_msgSend_behavior(v13, v7, v8, v9, (void)v20);
        v18 = objc_msgSend_sink(v13, v15, v16, v17);
        objc_msgSend_perfProfiler_measurementDidFinish_withSink_(v14, v19, (uint64_t)v4, (uint64_t)a3, v18);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end