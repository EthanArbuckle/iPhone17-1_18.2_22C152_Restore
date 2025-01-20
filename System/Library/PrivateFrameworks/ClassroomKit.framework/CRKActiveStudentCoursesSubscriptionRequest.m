@interface CRKActiveStudentCoursesSubscriptionRequest
+ (BOOL)supportsSecureCoding;
- (CRKActiveStudentCoursesSubscriptionRequest)init;
@end

@implementation CRKActiveStudentCoursesSubscriptionRequest

- (CRKActiveStudentCoursesSubscriptionRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRKActiveStudentCoursesSubscriptionRequest;
  v2 = [(CATTaskRequest *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CATTaskRequest *)v2 setHandlesNotifications:1];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end