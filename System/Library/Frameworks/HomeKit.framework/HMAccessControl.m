@interface HMAccessControl
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMAccessControl)init;
- (HMAccessControl)initWithCoder:(id)a3;
- (HMAccessControl)initWithUser:(id)a3;
- (HMUser)user;
- (unint64_t)cachedHash;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation HMAccessControl

- (HMAccessControl)initWithUser:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessControl;
  v5 = [(HMAccessControl *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_user, v4);
    v6->_cachedHash = [v4 hash];
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessControl *)self user];
  [v4 encodeConditionalObject:v5 forKey:@"HM.user"];
}

- (HMAccessControl)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];

  v6 = [(HMAccessControl *)self initWithUser:v5];
  return v6;
}

- (void)setUser:(id)a3
{
  id obj = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_user, obj);
  if (obj) {
    self->_cachedHash = [obj hash];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (HMUser)user
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  os_unfair_lock_unlock(p_lock);

  return (HMUser *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessControl *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMAccessControl *)self user];
      uint64_t v8 = [(HMAccessControl *)v6 user];
      v9 = (void *)v8;
      char v10 = 0;
      if (v7 && v8)
      {
        v11 = [v7 uniqueIdentifier];
        v12 = [v9 uniqueIdentifier];
        char v10 = [v11 isEqual:v12];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  if ([(HMAccessControl *)self cachedHash])
  {
    return [(HMAccessControl *)self cachedHash];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)HMAccessControl;
    return [(HMAccessControl *)&v4 hash];
  }
}

- (HMAccessControl)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end