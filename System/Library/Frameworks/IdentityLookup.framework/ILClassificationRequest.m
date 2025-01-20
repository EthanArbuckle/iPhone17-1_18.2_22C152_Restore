@interface ILClassificationRequest
+ (BOOL)supportsSecureCoding;
- (ILClassificationRequest)initWithCoder:(id)a3;
- (id)description;
@end

@implementation ILClassificationRequest

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILClassificationRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ILClassificationRequest;
  return [(ILClassificationRequest *)&v4 init];
}

@end