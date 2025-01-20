@interface HMDAccessoryBundle
- (HMDAccessoryBundle)initWithAccessory:(id)a3 context:(id)a4;
- (HMDHAPAccessory)accessory;
- (HMFObject)context;
- (void)setAccessory:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation HMDAccessoryBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->accessory, 0);
}

- (void)setContext:(id)a3
{
}

- (HMFObject)context
{
  return self->context;
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  return self->accessory;
}

- (HMDAccessoryBundle)initWithAccessory:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryBundle;
  v8 = [(HMDAccessoryBundle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(HMDAccessoryBundle *)v8 setAccessory:v6];
    [(HMDAccessoryBundle *)v9 setContext:v7];
  }

  return v9;
}

@end