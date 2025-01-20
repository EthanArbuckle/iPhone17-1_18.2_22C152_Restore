@interface CKShareParticipant
- (NSString)hashedDescription;
- (int64_t)participantRole;
- (int64_t)participantStatus;
@end

@implementation CKShareParticipant

- (int64_t)participantRole
{
  CKShareParticipantRole v2 = [(CKShareParticipant *)self role];
  if ((unint64_t)v2 > CKShareParticipantRolePublicUser) {
    return 1;
  }
  else {
    return qword_1001C9B88[v2];
  }
}

- (int64_t)participantStatus
{
  CKShareParticipantAcceptanceStatus v2 = [(CKShareParticipant *)self acceptanceStatus];
  if ((unint64_t)v2 > CKShareParticipantAcceptanceStatusRemoved) {
    return 1;
  }
  else {
    return qword_1001C9BB0[v2];
  }
}

- (NSString)hashedDescription
{
  uint64_t v13 = objc_opt_class();
  v3 = [(CKShareParticipant *)self userIdentity];
  v4 = [v3 nameComponents];
  v5 = [v4 givenName];
  v6 = AMSHashIfNeeded();
  v7 = [(CKShareParticipant *)self userIdentity];
  v8 = [v7 nameComponents];
  v9 = [v8 familyName];
  v10 = AMSHashIfNeeded();
  v11 = +[NSString stringWithFormat:@"<%@: %p name = %@ %@ | role = %ld | status = %ld", v13, self, v6, v10, [(CKShareParticipant *)self participantRole], [(CKShareParticipant *)self participantStatus]];

  return (NSString *)v11;
}

@end