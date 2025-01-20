@interface CATIDSServiceConnectionInvitationRequest
- (CATCancelable)assertion;
- (CATIDSServiceConnectionInvitationRequest)initWithInvitationIdentifier:(id)a3 appleID:(id)a4 assertion:(id)a5 userInfo:(id)a6;
- (NSDictionary)userInfo;
- (NSString)appleID;
- (NSUUID)invitationIdentifier;
@end

@implementation CATIDSServiceConnectionInvitationRequest

- (CATIDSServiceConnectionInvitationRequest)initWithInvitationIdentifier:(id)a3 appleID:(id)a4 assertion:(id)a5 userInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CATIDSServiceConnectionInvitationRequest;
  v15 = [(CATIDSServiceConnectionInvitationRequest *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_invitationIdentifier, a3);
    uint64_t v17 = [v12 copy];
    appleID = v16->_appleID;
    v16->_appleID = (NSString *)v17;

    objc_storeStrong((id *)&v16->_assertion, a5);
    uint64_t v19 = [v14 copy];
    userInfo = v16->_userInfo;
    v16->_userInfo = (NSDictionary *)v19;
  }
  return v16;
}

- (NSUUID)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (CATCancelable)assertion
{
  return self->_assertion;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_appleID, 0);

  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end