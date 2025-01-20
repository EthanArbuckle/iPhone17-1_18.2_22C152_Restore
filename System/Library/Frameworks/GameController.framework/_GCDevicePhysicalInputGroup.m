@interface _GCDevicePhysicalInputGroup
- (BOOL)isSnapshot;
- (_GCDevicePhysicalInputGroup)capture;
- (_GCDevicePhysicalInputGroup)init;
- (_GCDevicePhysicalInputGroup)initWithPhysicalInputs:(id)a3;
- (id)dataSource;
- (id)defaultPhysicalInput;
- (id)physicalInputQueue:(id)a3;
- (id)physicalInputWithAttributes:(id)a3;
- (id)physicalInputs;
- (id)queue;
- (id)setDataSource:(id *)result;
- (uint64_t)transactionQueueDepth;
- (void)_locked_setClientQueue:(int)a3 override:;
- (void)dealloc;
- (void)handleGamepadEvent:(uint64_t)a1;
- (void)physicalInput:(id)a3 setQueue:(id)a4;
- (void)physicalInputPoll:(id)a3 forLatest:(BOOL)a4;
- (void)physicalInputTransactionQueueDepthDidChange:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceDispatchQueue:(void *)a1;
@end

@implementation _GCDevicePhysicalInputGroup

- (_GCDevicePhysicalInputGroup)initWithPhysicalInputs:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v26 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputGroup.m", 41, @"Invalid parameter not satisfying: %s", "physicalInputs != nil");
  }
  if (![v4 count])
  {
    v27 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputGroup.m", 42, @"Invalid parameter not satisfying: %s", "physicalInputs.count > 0");
  }
  v34.receiver = self;
  v34.super_class = (Class)_GCDevicePhysicalInputGroup;
  v5 = [(_GCDevicePhysicalInputGroup *)&v34 init];
  if ([v4 count] == 1)
  {
    v6 = [v4 firstObject];
    [v6 setDataSource:v5];

    v7 = +[NSSet set];
    v36 = v7;
    v8 = [v4 firstObject];
    v37 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    physicalInputs = v5->_physicalInputs;
    v5->_physicalInputs = (NSDictionary *)v9;
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)&off_26D2B4CF0), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v17 = -[_GCDevicePhysicalInputBase attributes]((uint64_t)v16);
          v18 = [v7 objectForKey:v17];

          if (v18)
          {
            v19 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
            [v19 handleFailureInMethod:a2, v5, @"_GCDevicePhysicalInputGroup.m", 52, @"Multiple physical inputs with attributes %@: %@", v17, v11 object file lineNumber description];
          }
          [v7 setObject:v16 forKey:v17];
          [v16 setDataSource:v5];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }

    uint64_t v20 = [v7 copy];
    v8 = v5->_physicalInputs;
    v5->_physicalInputs = (NSDictionary *)v20;
  }

  v21 = v5->_physicalInputs;
  v22 = +[NSSet set];
  uint64_t v23 = [(NSDictionary *)v21 objectForKey:v22];
  defaultPhysicalInput = v5->_defaultPhysicalInput;
  v5->_defaultPhysicalInput = (_GCDevicePhysicalInputBase *)v23;

  if (!v5->_defaultPhysicalInput)
  {
    v28 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v28 handleFailureInMethod:a2 object:v5 file:@"_GCDevicePhysicalInputGroup.m" lineNumber:59 description:@"Missing default physical input"];
  }
  objc_opt_class();
  v5->_isSnapshot = (objc_opt_isKindOfClass() & 1) == 0;

  return v5;
}

- (_GCDevicePhysicalInputGroup)init
{
  return 0;
}

- (void)dealloc
{
  [(NSDictionary *)self->_physicalInputs enumerateKeysAndObjectsUsingBlock:&__block_literal_global_14];
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputGroup;
  [(_GCDevicePhysicalInputGroup *)&v3 dealloc];
}

- (void)setDevice:(id)a3
{
}

- (id)physicalInputs
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) allValues];
    v2 = +[NSSet setWithArray:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)physicalInputWithAttributes:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [(NSDictionary *)self->_physicalInputs objectForKey:v5];
  }
  else
  {
    v6 = self->_defaultPhysicalInput;
  }
  v7 = v6;

  return v7;
}

- (id)queue
{
  if (!a1 || a1[40])
  {
    id v2 = 0;
  }
  else
  {
    v1 = a1;
    objc_sync_enter(v1);
    id v2 = v1[4];
    objc_sync_exit(v1);
  }

  return v2;
}

- (void)_locked_setClientQueue:(int)a3 override:
{
  id v6 = a2;
  if (a1 && !*(unsigned char *)(a1 + 40))
  {
    if (a3) {
      *(unsigned char *)(a1 + 41) = 1;
    }
    if (*(id *)(a1 + 24) != v6)
    {
      id v11 = v6;
      [*(id *)(a1 + 8) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_106];
      objc_storeStrong((id *)(a1 + 24), a2);
      v7 = *(NSObject **)(a1 + 24);
      if (v7)
      {
        dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("GCDevicePhysicalInput", 0, v7);
        uint64_t v9 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v8;
      }
      else
      {
        uint64_t v9 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = 0;
      }

      [*(id *)(a1 + 8) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_112];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained physicalInputGroupQueueDidChange:a1];

      id v6 = v11;
    }
  }
}

- (id)dataSource
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)setDeviceDispatchQueue:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_super v3 = a1;
    objc_sync_enter(v3);
    if (!v3[41]) {
      -[_GCDevicePhysicalInputGroup _locked_setClientQueue:override:]((uint64_t)v3, v4, 0);
    }
    objc_sync_exit(v3);
  }
}

- (uint64_t)transactionQueueDepth
{
  if (!a1 || *(unsigned char *)(a1 + 40)) {
    return 0;
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v1 = *(void **)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __52___GCDevicePhysicalInputGroup_transactionQueueDepth__block_invoke;
  v4[3] = &unk_26D22BBA0;
  v4[4] = &v5;
  [v1 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)physicalInputQueue:(id)a3
{
  objc_super v3 = self;
  objc_sync_enter(v3);
  id v4 = v3->_clientQueue;
  objc_sync_exit(v3);

  return v4;
}

- (void)physicalInput:(id)a3 setQueue:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  -[_GCDevicePhysicalInputGroup _locked_setClientQueue:override:]((uint64_t)v7, v6, 1);
  objc_sync_exit(v7);
}

- (void)physicalInputTransactionQueueDepthDidChange:(id)a3
{
  objc_super v3 = self;
  if (self) {
    self = (_GCDevicePhysicalInputGroup *)objc_loadWeakRetained((id *)&self->_dataSource);
  }
  id v4 = self;
  [(_GCDevicePhysicalInputGroup *)self physicalInputGroupPreferredTransactionQueueDepthDidChange:v3];
}

- (void)physicalInputPoll:(id)a3 forLatest:(BOOL)a4
{
  id v4 = self;
  if (self) {
    self = (_GCDevicePhysicalInputGroup *)objc_loadWeakRetained((id *)&self->_dataSource);
  }
  uint64_t v5 = self;
  [(_GCDevicePhysicalInputGroup *)self physicalInputGroupPoll:v4 forLatest:0];
}

- (id)defaultPhysicalInput
{
  if (result) {
    return objc_getProperty(result, a2, 16, 1);
  }
  return result;
}

- (id)setDataSource:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 6, a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_defaultPhysicalInput, 0);

  objc_storeStrong((id *)&self->_physicalInputs, 0);
}

- (BOOL)isSnapshot
{
  if (result) {
    return *(unsigned char *)(result + 40) != 0;
  }
  return result;
}

- (_GCDevicePhysicalInputGroup)capture
{
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = [*(id *)(a1 + 8) allValues];
      objc_super v3 = objc_msgSend(v2, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_189);

      id v4 = [_GCDevicePhysicalInputGroup alloc];
    }
    else
    {
      uint64_t v5 = [_GCDevicePhysicalInputGroup alloc];
      objc_super v3 = [*(id *)(a1 + 8) allValues];
      id v4 = v5;
    }
    id v6 = [(_GCDevicePhysicalInputGroup *)v4 initWithPhysicalInputs:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)handleGamepadEvent:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 8);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __65___GCDevicePhysicalInputGroup_EventHandling__handleGamepadEvent___block_invoke;
    v6[3] = &unk_26D22BBE8;
    id v7 = v3;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

@end