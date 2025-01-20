@interface HMDBackingStoreUpdateObjectReference
- (HMDBackingStoreUpdateObjectReference)initWithObject:(id)a3 uuid:(id)a4;
- (NSUUID)uuid;
- (id)object;
- (void)main;
- (void)setObject:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation HMDBackingStoreUpdateObjectReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak(&self->_object);
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setObject:(id)a3
{
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void)main
{
  id v6 = +[HMDBackingStoreSingleton sharedInstance];
  v3 = [v6 objectLookup];
  v4 = [(HMDBackingStoreUpdateObjectReference *)self object];
  v5 = [(HMDBackingStoreUpdateObjectReference *)self uuid];
  [v3 setObject:v4 forKey:v5];
}

- (HMDBackingStoreUpdateObjectReference)initWithObject:(id)a3 uuid:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDBackingStoreUpdateObjectReference;
  v7 = [(HMDBackingStoreUpdateObjectReference *)&v11 init];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_object, v8);

    objc_storeStrong((id *)&v7->_uuid, a4);
    v9 = v7;
  }

  objc_destroyWeak(&location);
  return v7;
}

@end