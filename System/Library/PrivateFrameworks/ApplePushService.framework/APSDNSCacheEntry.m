@interface APSDNSCacheEntry
- (APSDNSCacheEntry)initWithHostname:(id)a3;
- (NSMutableArray)cachedIPAddresses;
- (NSString)hostname;
- (id)getAddressListForHostname:(id)a3 now:(id)a4 addressFamily:(unint64_t)a5;
- (void)addCacheIPAddress:(id)a3 addressFamily:(unint64_t)a4 timeToLive:(double)a5;
@end

@implementation APSDNSCacheEntry

- (APSDNSCacheEntry)initWithHostname:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSDNSCacheEntry;
  v6 = [(APSDNSCacheEntry *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hostname, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cachedIPAddresses = v7->_cachedIPAddresses;
    v7->_cachedIPAddresses = v8;
  }
  return v7;
}

- (void)addCacheIPAddress:(id)a3 addressFamily:(unint64_t)a4 timeToLive:(double)a5
{
  id v8 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = self->_cachedIPAddresses;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10)
  {

LABEL_15:
    v18 = [[APSDNSCacheIPAddress alloc] initWithIPAddress:v8 addressFamily:a4 timeToLive:a5];
    [(NSMutableArray *)self->_cachedIPAddresses addObject:v18];

    goto LABEL_16;
  }
  id v11 = v10;
  v19 = self;
  char v12 = 0;
  uint64_t v13 = *(void *)v21;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      v16 = [v15 ipAddress];
      if ([v16 isEqualToString:v8])
      {
        id v17 = [v15 addressFamily];

        if (v17 == (id)a4)
        {
          [v15 updateExpirationTime:a5];
          char v12 = 1;
        }
      }
      else
      {
      }
    }
    id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);

  self = v19;
  if ((v12 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:
}

- (id)getAddressListForHostname:(id)a3 now:(id)a4 addressFamily:(unint64_t)a5
{
  id v8 = a3;
  id v23 = a4;
  if ([v8 isEqualToString:self->_hostname])
  {
    long long v21 = self;
    id v22 = v8;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v9 = self->_cachedIPAddresses;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      id v12 = 0;
      id v13 = 0;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v16 addressFamily] == (id)a5)
          {
            id v17 = [v16 expirationTime];
            id v18 = [v23 compare:v17];

            if (v18 == (id)-1)
            {
              if (!v12) {
                id v12 = objc_alloc_init((Class)NSMutableArray);
              }
              v19 = [v16 ipAddress];
              [v12 addObject:v19];
            }
            else
            {
              if (!v13) {
                id v13 = objc_alloc_init((Class)NSMutableArray);
              }
              [v13 addObject:v16];
            }
          }
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
      id v13 = 0;
    }

    [(NSMutableArray *)v21->_cachedIPAddresses removeObjectsInArray:v13];
    id v8 = v22;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSString)hostname
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)cachedIPAddresses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIPAddresses, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end