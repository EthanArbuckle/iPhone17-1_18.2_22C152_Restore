@interface SNKShotLabel
- (SNKShotLabel)init;
- (id)initAsNegativeLabel;
- (id)initAsPositiveLabel;
- (int64_t)type;
@end

@implementation SNKShotLabel

- (id)initAsNegativeLabel
{
  return sub_1DC88DCAC(0);
}

- (id)initAsPositiveLabel
{
  return sub_1DC88DCAC(1);
}

- (int64_t)type
{
  return sub_1DC88DD38();
}

- (SNKShotLabel)init
{
}

@end