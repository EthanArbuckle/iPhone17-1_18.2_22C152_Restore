@interface HMDAppleHomePod_6_1_Accessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isHomePod2ndGen;
- (HMDAppleHomePod_6_1_Accessory)initWithCoder:(id)a3;
@end

@implementation HMDAppleHomePod_6_1_Accessory

- (BOOL)isHomePod2ndGen
{
  return 1;
}

- (HMDAppleHomePod_6_1_Accessory)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAppleHomePod_6_1_Accessory;
  v3 = [(HMDAppleMediaAccessory *)&v6 initWithCoder:a3];
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v3, v4);
    [(HMDAppleMediaAccessory *)v3 setVariant:4];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end