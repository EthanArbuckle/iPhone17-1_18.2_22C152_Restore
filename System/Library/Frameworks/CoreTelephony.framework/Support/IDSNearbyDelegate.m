@interface IDSNearbyDelegate
- (BOOL)fIsDeviceNearby;
- (IDSNearbyDelegate)initWithCallback:(function<void)(BOOL queue:;
- (id).cxx_construct;
- (void)dealloc;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setFIsDeviceNearby:(BOOL)a3;
- (void)udpateNearbyInfo:(BOOL)a3;
@end

@implementation IDSNearbyDelegate

- (IDSNearbyDelegate)initWithCallback:(function<void)(BOOL queue:
{
  v9.receiver = self;
  v9.super_class = (Class)IDSNearbyDelegate;
  id v6 = [(IDSNearbyDelegate *)&v9 init];
  if (v6)
  {
    if (a4) {
      dispatch_retain((dispatch_object_t)a4);
    }
    v7 = *((void *)v6 + 1);
    *((void *)v6 + 1) = a4;
    if (v7) {
      dispatch_release(v7);
    }
    sub_10033A644((void *)v6 + 2, (uint64_t)a3);
    operator new();
  }
  return 0;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = a4;
  uint64_t v6 = (uint64_t)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isNearby", (void)v9))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = (uint64_t)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(IDSNearbyDelegate *)self udpateNearbyInfo:v6];
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = a4;
  uint64_t v6 = (uint64_t)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isNearby", (void)v9))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = (uint64_t)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(IDSNearbyDelegate *)self udpateNearbyInfo:v6];
}

- (void)udpateNearbyInfo:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IDSNearbyDelegate *)self fIsDeviceNearby] != a3)
  {
    [(IDSNearbyDelegate *)self setFIsDeviceNearby:v3];
    if (self->fCallback.__f_.__f_)
    {
      sub_1000607A8((uint64_t)&self->fCallback, v3);
    }
  }
}

- (void)dealloc
{
  [self->fIDSService removeDelegate:self];
  fIDSService = self->fIDSService;
  self->fIDSService = 0;

  v4.receiver = self;
  v4.super_class = (Class)IDSNearbyDelegate;
  [(IDSNearbyDelegate *)&v4 dealloc];
}

- (BOOL)fIsDeviceNearby
{
  return self->_fIsDeviceNearby;
}

- (void)setFIsDeviceNearby:(BOOL)a3
{
  self->_fIsDeviceNearby = a3;
}

- (void).cxx_destruct
{
  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
  objc_storeStrong((id *)&self->fIDSService, 0);
  sub_100060644(self->fCallback.__f_.__buf_.__lx);
  fObj = self->fQueue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end