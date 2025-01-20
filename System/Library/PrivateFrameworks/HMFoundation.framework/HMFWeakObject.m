@interface HMFWeakObject
- (BOOL)isEqual:(id)a3;
- (HMFWeakObject)init;
- (HMFWeakObject)initWithWeakObject:(id)a3;
- (id)object;
- (unint64_t)hash;
- (unint64_t)objectHash;
@end

@implementation HMFWeakObject

- (HMFWeakObject)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFWeakObject)initWithWeakObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMFWeakObject;
    v5 = [(HMFWeakObject *)&v12 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak(&v5->_object, v4);
      v6->_objectHash = [v4 hash];
    }
    self = v6;
    id v7 = self;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A87A0]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_ERROR, "%{public}@A valid object is required", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_objectHash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFWeakObject *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMFWeakObject *)self object];
      uint64_t v8 = [(HMFWeakObject *)v6 object];
      if (v7 | v8) {
        char v9 = [(id)v7 isEqual:v8];
      }
      else {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (unint64_t)objectHash
{
  return self->_objectHash;
}

- (void).cxx_destruct
{
}

@end