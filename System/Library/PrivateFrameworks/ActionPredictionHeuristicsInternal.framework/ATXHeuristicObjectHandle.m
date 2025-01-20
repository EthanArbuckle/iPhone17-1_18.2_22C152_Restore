@interface ATXHeuristicObjectHandle
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicObjectHandle)initWithCoder:(id)a3;
- (ATXHeuristicObjectHandle)initWithDevice:(id)a3 wrapping:(id)a4;
- (id)obj;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicObjectHandle

- (ATXHeuristicObjectHandle)initWithDevice:(id)a3 wrapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXHeuristicObjectHandle;
  v8 = [(ATXHeuristicObjectHandle *)&v18 init];
  if (v8)
  {
    id v9 = v6;
    uint64_t v10 = [NSNumber numberWithUnsignedLong:v9];
    pthread_mutex_lock(&deviceHandlesLock);
    v11 = (void *)deviceHandles;
    if (!deviceHandles)
    {
      uint64_t v12 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      v13 = (void *)deviceHandles;
      deviceHandles = v12;

      v11 = (void *)deviceHandles;
    }
    [v11 setObject:v9 forKey:v10];
    pthread_mutex_unlock(&deviceHandlesLock);

    deviceHandle = v8->_deviceHandle;
    v8->_deviceHandle = (NSNumber *)v10;

    uint64_t v15 = [v9 _wrap:v7];
    objHandle = v8->_objHandle;
    v8->_objHandle = (NSNumber *)v15;

    objc_storeStrong(&v8->_obj, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  deviceHandle = self->_deviceHandle;
  id v5 = a3;
  [v5 encodeObject:deviceHandle forKey:@"deviceHandle"];
  [v5 encodeObject:self->_objHandle forKey:@"objHandle"];
}

- (ATXHeuristicObjectHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXHeuristicObjectHandle;
  id v5 = [(ATXHeuristicObjectHandle *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceHandle"];
    deviceHandle = v5->_deviceHandle;
    v5->_deviceHandle = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objHandle"];
    objHandle = v5->_objHandle;
    v5->_objHandle = (NSNumber *)v8;

    uint64_t v10 = v5->_deviceHandle;
    if (v10)
    {
      if (v5->_objHandle)
      {
        v11 = v10;
        pthread_mutex_lock(&deviceHandlesLock);
        uint64_t v12 = [(id)deviceHandles objectForKey:v11];

        pthread_mutex_unlock(&deviceHandlesLock);
        uint64_t v13 = [v12 _unwrap:v5->_objHandle];
        id obj = v5->_obj;
        v5->_id obj = (id)v13;
      }
    }
  }

  return v5;
}

- (id)obj
{
  return self->_obj;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_obj, 0);
  objc_storeStrong((id *)&self->_objHandle, 0);

  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

@end