@interface CPSLearnMoreResponse
+ (BOOL)supportsSecureCoding;
- (CPSLearnMoreResponse)initWithCoder:(id)a3;
@end

@implementation CPSLearnMoreResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSLearnMoreResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSLearnMoreResponse;
  return [(CPSLearnMoreResponse *)&v4 init];
}

@end