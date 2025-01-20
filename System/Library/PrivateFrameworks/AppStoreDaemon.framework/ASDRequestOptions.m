@interface ASDRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDRequestOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation ASDRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[ASDRequestOptions allocWithZone:a3];
  return [(ASDRequestOptions *)v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRequestOptions)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASDRequestOptions;
  return [(ASDRequestOptions *)&v4 init];
}

@end