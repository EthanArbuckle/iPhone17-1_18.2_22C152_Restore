@interface HDSampleTypesQueryServer
+ (Class)queryClass;
- (void)_queue_start;
@end

@implementation HDSampleTypesQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)HDSampleTypesQueryServer;
  [(HDQueryServer *)&v25 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self queryUUID];
  v6 = [(HDQueryServer *)self filter];
  v7 = [(HDQueryServer *)self profile];
  v8 = [v6 predicateWithProfile:v7];

  v9 = [(HDQueryServer *)self profile];
  id v24 = 0;
  v10 = +[HDSampleEntity sampleTypesForSamplesMatchingPredicate:v8 profile:v9 error:&v24];
  id v11 = v24;

  -[HDQueryServer setDataCount:](self, "setDataCount:", [v10 count]);
  if (v11)
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v11, v5);
  }
  else
  {
    v19 = v5;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v15);
    }

    v5 = v19;
    objc_msgSend(v4, "client_deliverSampleTypes:query:", v12, v19);
  }
}

@end