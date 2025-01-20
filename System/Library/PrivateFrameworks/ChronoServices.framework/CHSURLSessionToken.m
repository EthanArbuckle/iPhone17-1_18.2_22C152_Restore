@interface CHSURLSessionToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (CHSURLSessionToken)initWithCoder:(id)a3;
@end

@implementation CHSURLSessionToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSURLSessionToken)initWithCoder:(id)a3
{
  v4 = objc_alloc_init(CHSURLSessionToken);

  return v4;
}

- (BOOL)isValid
{
  return 1;
}

@end