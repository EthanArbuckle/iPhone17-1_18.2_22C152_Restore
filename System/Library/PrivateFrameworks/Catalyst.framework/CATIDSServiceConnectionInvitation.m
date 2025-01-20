@interface CATIDSServiceConnectionInvitation
- (CATCancelable)assertion;
- (CATIDSServiceConnectionInvitation)initWithConnectionIdentifier:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5 assertion:(id)a6 messagingVersion:(unint64_t)a7 userInfo:(id)a8;
- (CATIDSServiceConnectionInvitation)initWithSenderAppleID:(id)a3 senderAddress:(id)a4 assertion:(id)a5 messagingVersion:(unint64_t)a6 userInfo:(id)a7;
- (NSDictionary)userInfo;
- (NSString)senderAddress;
- (NSString)senderAppleID;
- (NSUUID)connectionIdentifier;
- (unint64_t)messagingVersion;
@end

@implementation CATIDSServiceConnectionInvitation

- (CATIDSServiceConnectionInvitation)initWithSenderAppleID:(id)a3 senderAddress:(id)a4 assertion:(id)a5 messagingVersion:(unint64_t)a6 userInfo:(id)a7
{
  v12 = (void *)MEMORY[0x263F08C38];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 UUID];
  v18 = [(CATIDSServiceConnectionInvitation *)self initWithConnectionIdentifier:v17 senderAppleID:v16 senderAddress:v15 assertion:v14 messagingVersion:a6 userInfo:v13];

  return v18;
}

- (CATIDSServiceConnectionInvitation)initWithConnectionIdentifier:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5 assertion:(id)a6 messagingVersion:(unint64_t)a7 userInfo:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CATIDSServiceConnectionInvitation;
  v20 = [(CATIDSServiceConnectionInvitation *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_connectionIdentifier, a3);
    uint64_t v22 = [v16 copy];
    senderAppleID = v21->_senderAppleID;
    v21->_senderAppleID = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    senderAddress = v21->_senderAddress;
    v21->_senderAddress = (NSString *)v24;

    objc_storeStrong((id *)&v21->_assertion, a6);
    v21->_messagingVersion = a7;
    uint64_t v26 = [v19 copy];
    userInfo = v21->_userInfo;
    v21->_userInfo = (NSDictionary *)v26;
  }
  return v21;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (CATCancelable)assertion
{
  return self->_assertion;
}

- (NSString)senderAppleID
{
  return self->_senderAppleID;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (unint64_t)messagingVersion
{
  return self->_messagingVersion;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_senderAppleID, 0);
  objc_storeStrong((id *)&self->_assertion, 0);

  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end