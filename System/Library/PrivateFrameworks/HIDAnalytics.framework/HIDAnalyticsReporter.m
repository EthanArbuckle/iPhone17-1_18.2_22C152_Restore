@interface HIDAnalyticsReporter
- (HIDAnalyticsReporter)init;
- (id)createBucketData:(id)a3 fieldvalue:(id)a4 fieldDescription:(id)a5;
- (void)dealloc;
- (void)dispatchAnalyticsForEvent:(id)a3;
- (void)logAnalyticsEvent:(id)a3;
- (void)logAnalyticsEvent:(id)a3 eventDescription:(id)a4 eventValue:(id)a5;
- (void)registerEvent:(id)a3;
- (void)start;
- (void)stop;
- (void)unregisterEvent:(id)a3;
@end

@implementation HIDAnalyticsReporter

void __42__HIDAnalyticsReporter_logAnalyticsEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained logAnalyticsEvent:*(void *)(a1 + 32) eventDescription:*(void *)(a1 + 40) eventValue:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)logAnalyticsEvent:(id)a3 eventDescription:(id)a4 eventValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke;
    v11[3] = &unk_2645A3E08;
    v11[4] = self;
    id v12 = v9;
    id v13 = v8;
    [a5 enumerateObjectsUsingBlock:v11];
  }
}

- (void)registerEvent:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_events addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

void __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

- (void)unregisterEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_events removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (([v4 isLogged] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v4 name];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_22133A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "HIDAnalytics Unregister Send event %@", (uint8_t *)&v6, 0xCu);
    }
    [(HIDAnalyticsReporter *)self logAnalyticsEvent:v4];
  }
}

- (void)logAnalyticsEvent:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [v4 value];
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v5, 2uLL);

  v7 = [v4 name];
  if (v7)
  {
    uint64_t v8 = NSString;
    id v9 = [v4 name];
    v10 = [v8 stringWithFormat:@"%@", v9];
  }
  else
  {
    v10 = @"unknown";
  }

  v11 = [v4 desc];
  if (v11)
  {
    id v12 = NSString;
    id v13 = [v4 desc];
    v14 = [v12 stringWithFormat:@"%@", v13];
  }
  else
  {
    v14 = 0;
  }

  if (DeepCopy)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__HIDAnalyticsReporter_logAnalyticsEvent___block_invoke;
    block[3] = &unk_2645A3E80;
    objc_copyWeak(&v20, &location);
    v17 = v10;
    id v18 = v14;
    id v19 = DeepCopy;
    dispatch_async(queue, block);

    objc_destroyWeak(&v20);
  }

  objc_destroyWeak(&location);
}

void __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke(uint64_t a1, void *a2)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 objectForKeyedSubscript:@"Name"];
    int v6 = [v4 objectForKeyedSubscript:@"Type"];
    v7 = [v4 objectForKeyedSubscript:@"Value"];
    if (!v7 || !v5 || !v6) {
      goto LABEL_10;
    }
    if ([v6 unsignedIntegerValue] == 1)
    {
      uint64_t v8 = [*(id *)(a1 + 32) createBucketData:v5 fieldvalue:v7 fieldDescription:*(void *)(a1 + 40)];
      if (!v8)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v9 = (id)v8;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_2;
      v12[3] = &unk_2645A3E58;
      v10 = &v13;
      id v13 = *(id *)(a1 + 48);
      [v9 enumerateObjectsUsingBlock:v12];
    }
    else
    {
      v14[0] = @"FieldName";
      v14[1] = @"FieldValue";
      v15[0] = v5;
      v15[1] = v7;
      [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      v10 = &v11;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = v11;
      AnalyticsSendEventLazy();
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (id)createBucketData:(id)a3 fieldvalue:(id)a4 fieldDescription:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (objc_class *)MEMORY[0x263EFF980];
    id v11 = v8;
    id v12 = objc_alloc_init(v10);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__HIDAnalyticsReporter_createBucketData_fieldvalue_fieldDescription___block_invoke;
    v17[3] = &unk_2645A3E08;
    id v18 = v7;
    id v19 = v9;
    id v13 = v12;
    id v20 = v13;
    [v11 enumerateObjectsUsingBlock:v17];

    v14 = v20;
    id v15 = v13;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __69__HIDAnalyticsReporter_createBucketData_fieldvalue_fieldDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [NSString stringWithFormat:@"%@BucketID", *(void *)(a1 + 32)];
    int v6 = [NSNumber numberWithUnsignedInteger:a3];
    id v7 = [NSString stringWithFormat:@"%@BucketCount", *(void *)(a1 + 32)];
    id v8 = v12;
    id v9 = [NSString stringWithFormat:@"%@Description", *(void *)(a1 + 32)];
    id v10 = *(id *)(a1 + 40);
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v11 setObject:v6 forKeyedSubscript:v5];
    [v11 setObject:v8 forKeyedSubscript:v7];
    if (v10) {
      [v11 setObject:v10 forKeyedSubscript:v9];
    }
    if ([v8 unsignedIntValue]) {
      [*(id *)(a1 + 48) addObject:v11];
    }
  }
}

id __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (HIDAnalyticsReporter)init
{
  v16.receiver = self;
  v16.super_class = (Class)HIDAnalyticsReporter;
  id v2 = [(HIDAnalyticsReporter *)&v16 init];
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    *((_DWORD *)v2 + 8) = 0;
    id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.hidanalytics", v5);
    id v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    id v8 = *((void *)v2 + 2);
    if (v8)
    {
      dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
      id v10 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v9;

      id v11 = (HIDAnalyticsReporter *)*((void *)v2 + 3);
      if (v11)
      {
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __28__HIDAnalyticsReporter_init__block_invoke;
        v13[3] = &unk_2645A3DE0;
        objc_copyWeak(&v14, &location);
        dispatch_source_set_event_handler(&v11->super, v13);
        dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
        dispatch_activate(*((dispatch_object_t *)v2 + 3));
        id v11 = (HIDAnalyticsReporter *)v2;
        objc_destroyWeak(&v14);
      }
    }
    else
    {
      id v11 = 0;
    }
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __28__HIDAnalyticsReporter_init__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 8);
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:*(void *)&v2[2]._os_unfair_lock_opaque];
    os_unfair_lock_unlock(v2 + 8);
    if (v3)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v19 = v3;
      id obj = v3;
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v21 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v23 != v21) {
              objc_enumerationMutation(obj);
            }
            id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
            {
              id v8 = [v7 name];
              *(_DWORD *)buf = 138412290;
              v27 = v8;
              _os_log_impl(&dword_22133A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "HIDAnalytics Timer Send event %@", buf, 0xCu);
            }
            dispatch_source_t v9 = [v7 value];
            DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v9, 2uLL);

            id v11 = [v7 name];
            if (v11)
            {
              id v12 = NSString;
              id v13 = [v7 name];
              id v14 = [v12 stringWithFormat:@"%@", v13];
            }
            else
            {
              id v14 = @"unknown";
            }

            id v15 = [v7 desc];
            if (v15)
            {
              objc_super v16 = NSString;
              v17 = [v7 desc];
              id v18 = [v16 stringWithFormat:@"%@", v17];
            }
            else
            {
              id v18 = 0;
            }

            if (!DeepCopy)
            {

              goto LABEL_24;
            }
            os_unfair_lock_lock(v2 + 8);
            if ([*(id *)&v2[2]._os_unfair_lock_opaque containsObject:v7])
            {
              [v7 setValue:&unk_26D33D3B0];
              os_unfair_lock_unlock(v2 + 8);
              [(os_unfair_lock_s *)v2 logAnalyticsEvent:v14 eventDescription:v18 eventValue:DeepCopy];
            }
            else
            {
              os_unfair_lock_unlock(v2 + 8);
            }
          }
          uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      id v3 = v19;
    }
  }
}

- (void)dealloc
{
  [(NSMutableSet *)self->_events removeAllObjects];
  [(HIDAnalyticsReporter *)self stop];
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)HIDAnalyticsReporter;
  [(HIDAnalyticsReporter *)&v3 dealloc];
}

id __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)start
{
  timer = self->_timer;
  dispatch_time_t v3 = dispatch_time(0x8000000000000000, 0);
  dispatch_source_set_timer(timer, v3, 0x274A48A78000uLL, 0);
}

- (void)stop
{
}

- (void)dispatchAnalyticsForEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  int v5 = [(NSMutableSet *)self->_events containsObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v6 = [v4 name];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_22133A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "HIDAnalytics Set Value Send event %@", (uint8_t *)&v7, 0xCu);
    }
    [(HIDAnalyticsReporter *)self logAnalyticsEvent:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end