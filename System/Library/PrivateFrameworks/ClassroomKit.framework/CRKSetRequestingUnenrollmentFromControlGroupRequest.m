@interface CRKSetRequestingUnenrollmentFromControlGroupRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)requestingUnenroll;
- (CRKSetRequestingUnenrollmentFromControlGroupRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)groupIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setRequestingUnenroll:(BOOL)a3;
@end

@implementation CRKSetRequestingUnenrollmentFromControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetRequestingUnenrollmentFromControlGroupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKSetRequestingUnenrollmentFromControlGroupRequest;
  v5 = [(CATTaskRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingUnenroll"];
    v5->_requestingUnenroll = [v9 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKSetRequestingUnenrollmentFromControlGroupRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(CRKSetRequestingUnenrollmentFromControlGroupRequest *)self groupIdentifier];
  [v4 encodeObject:v5 forKey:@"groupIdentifier"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKSetRequestingUnenrollmentFromControlGroupRequest requestingUnenroll](self, "requestingUnenroll"));
  [v4 encodeObject:v6 forKey:@"requestingUnenroll"];
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (BOOL)requestingUnenroll
{
  return self->_requestingUnenroll;
}

- (void)setRequestingUnenroll:(BOOL)a3
{
  self->_requestingUnenroll = a3;
}

- (void).cxx_destruct
{
}

@end