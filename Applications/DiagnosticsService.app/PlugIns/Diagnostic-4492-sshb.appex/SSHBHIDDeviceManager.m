@interface SSHBHIDDeviceManager
- (NSMutableDictionary)deviceUsageMap;
- (NSMutableDictionary)usageDeviceMap;
- (NSMutableDictionary)usageSubscribers;
- (SSHBHIDDeviceManager)init;
- (id)devicesFromUsage:(id)a3;
- (id)subscribersFromDevice:(__IOHIDDevice *)a3;
- (id)subscribersFromUsage:(id)a3;
- (id)usageFromDevice:(__IOHIDDevice *)a3;
- (void)addDevice:(__IOHIDDevice *)a3 forUsage:(id)a4;
- (void)addSubscriber:(id)a3 forUsage:(id)a4;
- (void)removeDevice:(__IOHIDDevice *)a3;
- (void)removeSubscriber:(id)a3 forUsage:(id)a4;
- (void)setDeviceUsageMap:(id)a3;
- (void)setUsageDeviceMap:(id)a3;
- (void)setUsageSubscribers:(id)a3;
@end

@implementation SSHBHIDDeviceManager

- (SSHBHIDDeviceManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SSHBHIDDeviceManager;
  v2 = [(SSHBHIDDeviceManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    usageSubscribers = v2->_usageSubscribers;
    v2->_usageSubscribers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    usageDeviceMap = v2->_usageDeviceMap;
    v2->_usageDeviceMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceUsageMap = v2->_deviceUsageMap;
    v2->_deviceUsageMap = v7;
  }
  return v2;
}

- (void)addSubscriber:(id)a3 forUsage:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  v7 = [(SSHBHIDDeviceManager *)self usageSubscribers];
  v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 hash]);
  v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = objc_alloc_init((Class)NSMutableSet);
    v11 = [(SSHBHIDDeviceManager *)self usageSubscribers];
    v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 hash]);
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
  v13 = [(SSHBHIDDeviceManager *)self usageSubscribers];
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 hash]);
  v15 = [v13 objectForKeyedSubscript:v14];
  [v15 addObject:v6];
}

- (void)removeSubscriber:(id)a3 forUsage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(SSHBHIDDeviceManager *)self usageSubscribers];
  id v8 = [v6 hash];

  v9 = +[NSNumber numberWithUnsignedInteger:v8];
  id v10 = [v11 objectForKeyedSubscript:v9];
  [v10 removeObject:v7];
}

- (void)addDevice:(__IOHIDDevice *)a3 forUsage:(id)a4
{
  id v17 = a4;
  id v6 = [(SSHBHIDDeviceManager *)self usageDeviceMap];
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 hash]);
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableSet);
    id v10 = [(SSHBHIDDeviceManager *)self usageDeviceMap];
    id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 hash]);
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  v12 = [(SSHBHIDDeviceManager *)self usageDeviceMap];
  v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 hash]);
  v14 = [v12 objectForKeyedSubscript:v13];
  [v14 addObject:a3];

  v15 = +[NSValue valueWithNonretainedObject:a3];
  id v16 = [(SSHBHIDDeviceManager *)self deviceUsageMap];
  [v16 setObject:v17 forKeyedSubscript:v15];
}

- (void)removeDevice:(__IOHIDDevice *)a3
{
  +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(SSHBHIDDeviceManager *)self deviceUsageMap];
  id v6 = [v5 objectForKeyedSubscript:v13];

  if (v6)
  {
    id v7 = [(SSHBHIDDeviceManager *)self deviceUsageMap];
    id v8 = [v7 objectForKeyedSubscript:v13];

    id v9 = [(SSHBHIDDeviceManager *)self deviceUsageMap];
    [v9 removeObjectForKey:v13];

    if (v8)
    {
      id v10 = [(SSHBHIDDeviceManager *)self deviceUsageMap];
      id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 hash]);
      v12 = [v10 objectForKeyedSubscript:v11];
      [v12 removeObject:a3];
    }
  }
}

- (id)subscribersFromUsage:(id)a3
{
  id v4 = a3;
  v5 = [(SSHBHIDDeviceManager *)self usageSubscribers];
  id v6 = [v4 hash];

  id v7 = +[NSNumber numberWithUnsignedInteger:v6];
  id v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (id)subscribersFromDevice:(__IOHIDDevice *)a3
{
  id v4 = [(SSHBHIDDeviceManager *)self usageFromDevice:a3];
  v5 = [(SSHBHIDDeviceManager *)self usageSubscribers];
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 hash]);
  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)usageFromDevice:(__IOHIDDevice *)a3
{
  id v4 = +[NSValue valueWithNonretainedObject:a3];
  v5 = [(SSHBHIDDeviceManager *)self deviceUsageMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)devicesFromUsage:(id)a3
{
  id v4 = a3;
  v5 = [(SSHBHIDDeviceManager *)self usageDeviceMap];
  id v6 = [v4 hash];

  id v7 = +[NSNumber numberWithUnsignedInteger:v6];
  id v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (NSMutableDictionary)usageSubscribers
{
  return self->_usageSubscribers;
}

- (void)setUsageSubscribers:(id)a3
{
}

- (NSMutableDictionary)usageDeviceMap
{
  return self->_usageDeviceMap;
}

- (void)setUsageDeviceMap:(id)a3
{
}

- (NSMutableDictionary)deviceUsageMap
{
  return self->_deviceUsageMap;
}

- (void)setDeviceUsageMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUsageMap, 0);
  objc_storeStrong((id *)&self->_usageDeviceMap, 0);

  objc_storeStrong((id *)&self->_usageSubscribers, 0);
}

@end