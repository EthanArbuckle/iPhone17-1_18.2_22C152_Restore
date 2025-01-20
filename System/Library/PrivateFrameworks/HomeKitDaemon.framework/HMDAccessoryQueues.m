@interface HMDAccessoryQueues
- (BOOL)_inQueue:(id)a3 queue:(id)a4;
- (BOOL)createQueue:(id)a3;
- (HMDAccessoryQueues)init;
- (NSMutableDictionary)queues;
- (id)getAccessoryForContext:(id)a3 fromQueue:(id)a4;
- (id)getContextForAccessory:(id)a3;
- (id)popAccessoryFromQueue:(id)a3;
- (id)whichQueueForAccessory:(id)a3;
- (int)countForQueue:(id)a3;
- (void)addAccessory:(id)a3 toQueue:(id)a4 context:(id)a5;
- (void)enumerateQueue:(id)a3 enumerateAccessory:(id)a4;
- (void)removeAccessory:(id)a3;
- (void)setQueues:(id)a3;
@end

@implementation HMDAccessoryQueues

- (void).cxx_destruct
{
}

- (void)setQueues:(id)a3
{
}

- (NSMutableDictionary)queues
{
  return self->queues;
}

- (id)getAccessoryForContext:(id)a3 fromQueue:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(HMDAccessoryQueues *)self queues];
    v9 = [v8 objectForKey:v7];

    if (v9)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = v9;
      v11 = (void *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "context", (void)v18);
            char v16 = [v15 isEqual:v6];

            if (v16)
            {
              v11 = [v14 accessory];
              goto LABEL_14;
            }
          }
          v11 = (void *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int)countForQueue:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryQueues *)self queues];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    int v7 = [v6 count];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (id)whichQueueForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(HMDAccessoryQueues *)self queues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v11 = [(HMDAccessoryQueues *)self queues];
          uint64_t v12 = [v11 objectForKey:v10];

          if ([(HMDAccessoryQueues *)self _inQueue:v4 queue:v12])
          {
            id v13 = v10;

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_12:
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_inQueue:(id)a3 queue:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "accessory", (void)v14);
          char v12 = [v11 isEqual:v5];

          if (v12)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)popAccessoryFromQueue:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMDAccessoryQueues *)self queues];
    id v6 = [v5 objectForKey:v4];

    if (v6 && [v6 count])
    {
      id v7 = [v6 objectAtIndexedSubscript:0];
      uint64_t v8 = [v7 accessory];
      [(HMDAccessoryQueues *)self removeAccessory:v8];

      uint64_t v9 = [v7 accessory];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)removeAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryQueues *)self whichQueueForAccessory:v4];
  if (v5)
  {
    id v6 = [(HMDAccessoryQueues *)self queues];
    id v7 = [v6 objectForKey:v5];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "accessory", (void)v16);
          int v15 = [v14 isEqual:v4];

          if (v15)
          {
            [v8 removeObject:v13];
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)getContextForAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryQueues *)self whichQueueForAccessory:v4];
  if (v5)
  {
    id v6 = [(HMDAccessoryQueues *)self queues];
    id v7 = [v6 objectForKey:v5];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          char v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "accessory", (void)v16);
          char v14 = [v13 isEqual:v4];

          if (v14)
          {
            uint64_t v9 = [v12 context];
            goto LABEL_12;
          }
        }
        uint64_t v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)addAccessory:(id)a3 toQueue:(id)a4 context:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (v13 && a4)
  {
    id v9 = a4;
    uint64_t v10 = [(HMDAccessoryQueues *)self queues];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      char v12 = [[HMDAccessoryBundle alloc] initWithAccessory:v13 context:v8];
      [v11 addObject:v12];
    }
  }
}

- (BOOL)createQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryQueues *)self queues];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v8 = [(HMDAccessoryQueues *)self queues];
    [v8 setObject:v7 forKey:v4];
  }
  return v6 == 0;
}

- (HMDAccessoryQueues)init
{
  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryQueues;
  v2 = [(HMDAccessoryQueues *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(HMDAccessoryQueues *)v2 setQueues:v3];
  }
  return v2;
}

- (void)enumerateQueue:(id)a3 enumerateAccessory:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (uint64_t (**)(id, void *, void *))a4;
  if (v6)
  {
    id v8 = [(HMDAccessoryQueues *)self queues];
    id v9 = [v8 objectForKey:v6];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        long long v16 = objc_msgSend(v15, "accessory", (void)v19);
        long long v17 = [v15 context];
        char v18 = v7[2](v7, v16, v17);

        if (v18) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

@end