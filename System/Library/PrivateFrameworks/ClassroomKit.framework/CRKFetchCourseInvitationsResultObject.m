@interface CRKFetchCourseInvitationsResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchCourseInvitationsResultObject)initWithCoder:(id)a3;
- (NSArray)courseInvitations;
- (NSSet)acceptedInvitationIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptedInvitationIdentifiers:(id)a3;
- (void)setCourseInvitations:(id)a3;
@end

@implementation CRKFetchCourseInvitationsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchCourseInvitationsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKFetchCourseInvitationsResultObject;
  v5 = [(CATTaskResultObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"courseInvitations"];
    courseInvitations = v5->_courseInvitations;
    v5->_courseInvitations = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"acceptedInvitationIdentifiers"];
    acceptedInvitationIdentifiers = v5->_acceptedInvitationIdentifiers;
    v5->_acceptedInvitationIdentifiers = (NSSet *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchCourseInvitationsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchCourseInvitationsResultObject *)self courseInvitations];
  [v4 encodeObject:v5 forKey:@"courseInvitations"];

  v6 = [(CRKFetchCourseInvitationsResultObject *)self acceptedInvitationIdentifiers];
  [v4 encodeObject:v6 forKey:@"acceptedInvitationIdentifiers"];
}

- (NSArray)courseInvitations
{
  return self->_courseInvitations;
}

- (void)setCourseInvitations:(id)a3
{
}

- (NSSet)acceptedInvitationIdentifiers
{
  return self->_acceptedInvitationIdentifiers;
}

- (void)setAcceptedInvitationIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedInvitationIdentifiers, 0);

  objc_storeStrong((id *)&self->_courseInvitations, 0);
}

@end