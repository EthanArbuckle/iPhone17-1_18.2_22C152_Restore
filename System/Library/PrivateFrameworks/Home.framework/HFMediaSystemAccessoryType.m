@interface HFMediaSystemAccessoryType
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation HFMediaSystemAccessoryType

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"mediaSystemType"];
}

@end