@interface CACodingProxy
+ (BOOL)supportsSecureCoding;
- (CACodingProxy)initWithCoder:(id)a3;
- (CACodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
@end

@implementation CACodingProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CACodingProxy)initWithCoder:(id)a3
{
  return 0;
}

- (id)decodedObject
{
  return 0;
}

- (CACodingProxy)initWithObject:(id)a3
{
  return 0;
}

@end