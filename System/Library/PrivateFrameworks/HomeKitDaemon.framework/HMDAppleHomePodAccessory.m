@interface HMDAppleHomePodAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isHomePodMini;
- (HMDAppleHomePodAccessory)initWithCoder:(id)a3;
@end

@implementation HMDAppleHomePodAccessory

- (BOOL)isHomePodMini
{
  return 1;
}

- (HMDAppleHomePodAccessory)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAppleHomePodAccessory;
  v3 = [(HMDAppleMediaAccessory *)&v6 initWithCoder:a3];
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v3, v4);
    [(HMDAppleMediaAccessory *)v3 setVariant:2];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end