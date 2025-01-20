@interface HRNoGatewaysFoundTableViewCell
+ (NSString)defaultReuseIdentifier;
- (HRNoGatewaysFoundTableViewCell)initWithCoder:(id)a3;
- (HRNoGatewaysFoundTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation HRNoGatewaysFoundTableViewCell

+ (NSString)defaultReuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HRNoGatewaysFoundTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (HRNoGatewaysFoundTableViewCell *)sub_1C22E70E8(a3, (uint64_t)a4, v6);
}

- (HRNoGatewaysFoundTableViewCell)initWithCoder:(id)a3
{
  result = (HRNoGatewaysFoundTableViewCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

@end