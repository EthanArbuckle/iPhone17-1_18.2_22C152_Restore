@interface CATTaskResultObject
+ (BOOL)supportsSecureCoding;
- (CATTaskResultObject)init;
- (CATTaskResultObject)initWithCoder:(id)a3;
@end

@implementation CATTaskResultObject

- (CATTaskResultObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)CATTaskResultObject;
  return [(CATTaskResultObject *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskResultObject)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CATTaskResultObject;
  return [(CATTaskResultObject *)&v4 init];
}

@end