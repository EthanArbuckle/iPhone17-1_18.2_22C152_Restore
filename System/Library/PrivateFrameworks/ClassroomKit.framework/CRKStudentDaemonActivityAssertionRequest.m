@interface CRKStudentDaemonActivityAssertionRequest
+ (BOOL)supportsSecureCoding;
- (CRKStudentDaemonActivityAssertionRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKStudentDaemonActivityAssertionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKStudentDaemonActivityAssertionRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRKStudentDaemonActivityAssertionRequest;
  return [(CATTaskRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRKStudentDaemonActivityAssertionRequest;
  [(CATTaskRequest *)&v3 encodeWithCoder:a3];
}

@end