@interface CRKFetchSignInHistoryRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchSignInHistoryRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKFetchSignInHistoryRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchSignInHistoryRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRKFetchSignInHistoryRequest;
  return [(CATTaskRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRKFetchSignInHistoryRequest;
  [(CATTaskRequest *)&v3 encodeWithCoder:a3];
}

@end