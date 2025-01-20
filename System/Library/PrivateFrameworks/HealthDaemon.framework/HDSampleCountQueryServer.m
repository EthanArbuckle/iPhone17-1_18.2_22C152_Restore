@interface HDSampleCountQueryServer
+ (Class)queryClass;
- (HDSampleCountQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDSampleCountQueryServer

- (HDSampleCountQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSampleCountQueryServer;
  v11 = [(HDQueryServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v12 = [v10 queryDescriptors];
    uint64_t v13 = [v12 copy];
    queryDescriptors = v11->_queryDescriptors;
    v11->_queryDescriptors = (NSArray *)v13;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)HDSampleCountQueryServer;
  [(HDQueryServer *)&v31 _queue_start];
  if ([(NSArray *)self->_queryDescriptors count])
  {
    v3 = [(HDQueryServer *)self clientProxy];
    v21 = [v3 remoteObjectProxy];

    v4 = (void *)MEMORY[0x1E4F1CA60];
    NSUInteger v5 = [(NSArray *)self->_queryDescriptors count];
    if (v5 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    v20 = [v4 dictionaryWithCapacity:v6];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obj = self->_queryDescriptors;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v28;
LABEL_7:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * v9);
        id v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x2020000000;
        uint64_t v26 = 0;
        int v11 = HKWithAutoreleasePool();
        id v12 = 0;
        if (v11)
        {
          uint64_t v13 = [NSNumber numberWithInteger:v24[3]];
          [v20 setObject:v13 forKeyedSubscript:v10];
        }
        else
        {
          uint64_t v13 = [(HDQueryServer *)self queryUUID];
          objc_msgSend(v21, "client_deliverError:forQuery:", v12, v13);
        }

        _Block_object_dispose(&v23, 8);
        if (!v11) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v7) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:

      obj = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v21, "client_deliverSampleCountDictionary:forQuery:", v20, obj);
    }
  }
  else
  {
    v14 = [(HDQueryServer *)self clientProxy];
    v15 = [v14 remoteObjectProxy];

    objc_super v16 = [(HDQueryServer *)self profile];
    id v23 = 0;
    v17 = +[HDSampleEntity sampleCountsByTypeForProfile:v16 error:&v23];
    id v18 = v23;

    v19 = [(HDQueryServer *)self queryUUID];
    if (v17) {
      objc_msgSend(v15, "client_deliverSampleTypeCountDictionary:forQuery:", v17, v19);
    }
    else {
      objc_msgSend(v15, "client_deliverError:forQuery:", v18, v19);
    }
  }
}

BOOL __40__HDSampleCountQueryServer__queue_start__block_invoke(uint64_t a1, void *a2)
{
  v4 = [*(id *)(a1 + 32) sampleType];
  NSUInteger v5 = [*(id *)(a1 + 32) _filter];
  uint64_t v6 = [*(id *)(a1 + 40) profile];
  uint64_t v7 = [v5 predicateWithProfile:v6];

  uint64_t v8 = objc_msgSend((id)objc_msgSend(v4, "dataObjectClass"), "hd_dataEntityClass");
  uint64_t v9 = [*(id *)(a1 + 40) profile];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 countOfSamplesWithType:v4 profile:v9 matchingPredicate:v7 withError:a2];

  BOOL v10 = *a2 == 0;
  return v10;
}

- (void).cxx_destruct
{
}

@end