@interface CRKAcceptCourseInvitationRequest
+ (BOOL)supportsSecureCoding;
- (CRKAcceptCourseInvitationRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSDictionary)studentInformation;
- (NSString)pin;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setPin:(id)a3;
- (void)setStudentInformation:(id)a3;
@end

@implementation CRKAcceptCourseInvitationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKAcceptCourseInvitationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRKAcceptCourseInvitationRequest;
  v5 = [(CATTaskRequest *)&v15 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"pin"];
    pin = v5->_pin;
    v5->_pin = (NSString *)v10;

    uint64_t v12 = [v4 decodePropertyListForKey:@"studentInformation"];
    studentInformation = v5->_studentInformation;
    v5->_studentInformation = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKAcceptCourseInvitationRequest *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKAcceptCourseInvitationRequest *)self pin];
  [v4 encodeObject:v6 forKey:@"pin"];

  id v7 = [(CRKAcceptCourseInvitationRequest *)self studentInformation];
  [v4 encodeObject:v7 forKey:@"studentInformation"];
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
}

- (NSDictionary)studentInformation
{
  return self->_studentInformation;
}

- (void)setStudentInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentInformation, 0);
  objc_storeStrong((id *)&self->_pin, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end