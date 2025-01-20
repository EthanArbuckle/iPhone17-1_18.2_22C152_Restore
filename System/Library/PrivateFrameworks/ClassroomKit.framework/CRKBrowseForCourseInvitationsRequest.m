@interface CRKBrowseForCourseInvitationsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoresDeviceIdleState;
- (CRKBrowseForCourseInvitationsRequest)init;
- (CRKBrowseForCourseInvitationsRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoresDeviceIdleState:(BOOL)a3;
@end

@implementation CRKBrowseForCourseInvitationsRequest

- (CRKBrowseForCourseInvitationsRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRKBrowseForCourseInvitationsRequest;
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

- (CRKBrowseForCourseInvitationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKBrowseForCourseInvitationsRequest;
  objc_super v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ignoresDeviceIdleState"];
    *(&v5->super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKBrowseForCourseInvitationsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  objc_super v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKBrowseForCourseInvitationsRequest ignoresDeviceIdleState](self, "ignoresDeviceIdleState", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"ignoresDeviceIdleState"];
}

- (BOOL)ignoresDeviceIdleState
{
  return *(&self->super._handlesNotifications + 1);
}

- (void)setIgnoresDeviceIdleState:(BOOL)a3
{
  *(&self->super._handlesNotifications + 1) = a3;
}

@end