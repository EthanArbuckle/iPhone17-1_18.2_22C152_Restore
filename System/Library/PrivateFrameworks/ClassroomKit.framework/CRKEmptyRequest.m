@interface CRKEmptyRequest
+ (BOOL)supportsSecureCoding;
- (CRKEmptyRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKEmptyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKEmptyRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRKEmptyRequest;
  return [(CATTaskRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRKEmptyRequest;
  [(CATTaskRequest *)&v3 encodeWithCoder:a3];
}

@end