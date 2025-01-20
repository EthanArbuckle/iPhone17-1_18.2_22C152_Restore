@interface CPSSharingResponse
+ (BOOL)supportsSecureCoding;
- (CPSSharingResponse)initWithCoder:(id)a3;
@end

@implementation CPSSharingResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSharingResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSSharingResponse;
  return [(CPSSharingResponse *)&v4 init];
}

@end