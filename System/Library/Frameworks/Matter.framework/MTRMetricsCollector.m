@interface MTRMetricsCollector
+ (id)sharedInstance;
- (MTRMetricsCollector)init;
- (id).cxx_construct;
- (id)metricSnapshot:(BOOL)a3;
- (void)handleMetricEvent:(MetricEvent *)a3;
- (void)registerTracingBackend;
- (void)resetMetrics;
- (void)unregisterTracingBackend;
@end

@implementation MTRMetricsCollector

+ (id)sharedInstance
{
  if (qword_268EBE9B8 != -1) {
    dispatch_once(&qword_268EBE9B8, &unk_26F952AC8);
  }
  v2 = (void *)qword_268EBE9B0;

  return v2;
}

- (MTRMetricsCollector)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRMetricsCollector;
  v2 = [(MTRMetricsCollector *)&v10 init];
  v5 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v3, v4);
    metricsDataCollection = v5->_metricsDataCollection;
    v5->_metricsDataCollection = (NSMutableDictionary *)v6;

    v5->_tracingBackendRegistered = 0;
    v8 = v5;
  }

  return v5;
}

- (void)registerTracingBackend
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_tracingBackendRegistered)
  {
    sub_244D7E1FC(&self->_tracingBackend._vptr$Backend);
    uint64_t v4 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Registered tracing backend with the registry", v5, 2u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    self->_tracingBackendRegistered = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterTracingBackend
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_tracingBackendRegistered)
  {
    sub_244D7E290(&self->_tracingBackend._vptr$Backend);
    uint64_t v4 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Unregistered tracing backend with the registry", v5, 2u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    self->_tracingBackendRegistered = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)handleMetricEvent:(MetricEvent *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (*((unsigned __int8 *)&a3->var2 + 4) <= 3u)
  {
    v7 = @"_end";
    if (a3->var0 != 1) {
      v7 = @"_begin";
    }
    if (a3->var0 == 2) {
      objc_msgSend_stringWithFormat_(NSString, v6, @"%s%@", a3->var1, @"_event");
    }
    else {
    v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"%s%@", a3->var1, v7);
    }
    v9 = [MTRMetricData alloc];
    v12 = objc_msgSend_initWithMetricEvent_(v9, v10, (uint64_t)a3);
    if (a3->var0 == 1)
    {
      v13 = objc_msgSend_stringWithFormat_(NSString, v11, @"%s%@", a3->var1, @"_begin");
      v16 = objc_msgSend_objectForKeyedSubscript_(self->_metricsDataCollection, v14, (uint64_t)v13);
      if (v16)
      {
        objc_msgSend_setDurationFromMetricData_(v12, v15, (uint64_t)v16);
      }
      else
      {
        v17 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          var1 = a3->var1;
          *(_DWORD *)buf = 136315138;
          v24 = var1;
          _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_ERROR, "Unable to find Begin event corresponding to Metric Event: %s", buf, 0xCu);
        }

        if (sub_244CC4E58(1u))
        {
          v22 = a3->var1;
          sub_244CC4DE0(0, 1);
        }
      }
    }
    v19 = objc_msgSend_valueForKey_(self->_metricsDataCollection, v11, (uint64_t)v8, v22);
    BOOL v20 = v19 == 0;

    if (v20) {
      objc_msgSend_setValue_forKey_(self->_metricsDataCollection, v21, (uint64_t)v12, v8);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)metricSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [MTRMetrics alloc];
  uint64_t v9 = objc_msgSend_count(self->_metricsDataCollection, v7, v8);
  v11 = objc_msgSend_initWithCapacity_(v6, v10, v9);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = self->_metricsDataCollection;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, v28, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v19 = objc_msgSend_objectForKeyedSubscript_(self->_metricsDataCollection, v14, v18, (void)v24);
        objc_msgSend_setMetricData_forKey_(v11, v20, (uint64_t)v19, v18);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v24, v28, 16);
    }
    while (v15);
  }

  if (v3) {
    objc_msgSend_removeAllObjects(self->_metricsDataCollection, v21, v22);
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)resetMetrics
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeAllObjects(self->_metricsDataCollection, v4, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  sub_24479DFF4(&self->_tracingBackend.mPrev);

  objc_storeStrong((id *)&self->_metricsDataCollection, 0);
}

- (id).cxx_construct
{
  return self;
}

@end