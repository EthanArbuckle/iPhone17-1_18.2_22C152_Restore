@interface HRStandardTableViewCell
+ (NSString)reuseIdentifier;
- (HRStandardTableViewCell)initWithCoder:(id)a3;
- (HRStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation HRStandardTableViewCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HRStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRStandardTableViewCell *)sub_1C24A8204((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))type metadata accessor for StandardTableViewCell);
}

- (HRStandardTableViewCell)initWithCoder:(id)a3
{
  return (HRStandardTableViewCell *)sub_1C24A82B4(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StandardTableViewCell);
}

@end