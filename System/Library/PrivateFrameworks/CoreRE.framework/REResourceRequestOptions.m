@interface REResourceRequestOptions
+ (BOOL)supportsSecureCoding;
- (REResourceRequestOptions)init;
- (REResourceRequestOptions)initWithCoder:(id)a3;
@end

@implementation REResourceRequestOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REResourceRequestOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)REResourceRequestOptions;
  return [(REResourceRequestOptions *)&v3 init];
}

- (REResourceRequestOptions)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REResourceRequestOptions;
  return [(REResourceRequestOptions *)&v4 init];
}

@end