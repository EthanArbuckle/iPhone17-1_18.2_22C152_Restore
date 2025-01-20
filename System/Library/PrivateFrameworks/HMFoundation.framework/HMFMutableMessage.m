@interface HMFMutableMessage
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setActivity:(id)a3;
- (void)setHeaderValue:(id)a3 forKey:(id)a4;
- (void)setHeaders:(id)a3;
- (void)setName:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setTimeout:(double)a3;
- (void)setTransport:(id)a3;
- (void)setUntrustedClientIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoValue:(id)a3 forKey:(id)a4;
@end

@implementation HMFMutableMessage

- (void)setHeaderValue:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [(HMFMessage *)self headers];
    id v11 = (id)[v8 mutableCopy];

    [v11 setObject:v7 forKeyedSubscript:v6];
    v9 = [(HMFMessage *)self internal];
    v10 = (void *)[v11 copy];
    [v9 setHeaders:v10];
  }
}

- (void)setActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self internal];
  [v5 setActivity:v4];
}

- (void)setTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self internal];
  [v5 setTransport:v4];
}

- (void)setQualityOfService:(int64_t)a3
{
  id v4 = [(HMFMessage *)self internal];
  [v4 setQualityOfService:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(HMFMessage *)self internal];
  id v5 = (void *)[v4 copyWithZone:a3];

  id v6 = [MEMORY[0x1E4F29128] UUID];
  [v5 setIdentifier:v6];

  id v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithInternalMessage:", v5);
  return v7;
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [(HMFMessage *)self userInfo];
    id v11 = (id)[v8 mutableCopy];

    [v11 setObject:v7 forKeyedSubscript:v6];
    v9 = [(HMFMessage *)self internal];
    v10 = (void *)[v11 copy];
    [v9 setUserInfo:v10];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(HMFMessage *)self internal];
  id v5 = (void *)[v4 copyWithZone:a3];

  id v6 = [+[HMFMessage allocWithZone:a3] initWithInternalMessage:v5];
  return v6;
}

- (void)setName:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMFMessage *)self internal];
    [v5 setName:v4];
  }
}

- (void)setTimeout:(double)a3
{
  if (a3 >= 0.0) {
    [(HMFMessageInternal *)self->super._internal setTimeout:"setTimeout:"];
  }
}

- (void)setUserInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = (void *)MEMORY[0x19F3A87A0]();
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        id v7 = HMFGetLogIdentifier(0);
        int v9 = 138543618;
        v10 = v7;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_FAULT, "%{public}@Invalid userInfo class provided, %@, for message, see <rdar://problem/37677418>", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  v8 = [(HMFMessage *)self internal];
  [v8 setUserInfo:v4];
}

- (void)setHeaders:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self internal];
  [v5 setHeaders:v4];
}

- (void)setUntrustedClientIdentifier:(id)a3
{
  id v4 = (id)[a3 copy];
  [(HMFMutableMessage *)self setHeaderValue:v4 forKey:@"HMF.untrustedClientIdentifier"];
}

@end