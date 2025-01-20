@interface CRKJoinControlGroupRequest
+ (BOOL)supportsSecureCoding;
- (CRKCourseInvitation)invitation;
- (CRKJoinControlGroupRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInvitation:(id)a3;
@end

@implementation CRKJoinControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKJoinControlGroupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKJoinControlGroupRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"invitation"];
    invitation = v5->_invitation;
    v5->_invitation = (CRKCourseInvitation *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKJoinControlGroupRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKJoinControlGroupRequest *)self invitation];
  [v4 encodeObject:v5 forKey:@"invitation"];
}

- (CRKCourseInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end