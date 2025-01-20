@interface IDSMPConversationGroup
+ (IDSMPConversationGroup)conversationGroupWithConversationKey:(id)a3 fromPublicData:(id)a4 publicKey:(id)a5 signature:(id)a6 groupID:(id)a7 parent:(id)a8 parentPublicKey:(id)a9 forwardingTicket:(id)a10 sponsor:(id)a11 error:(id *)a12;
+ (IDSMPConversationGroup)conversationGroupWithParent:(id)a3 members:(id)a4 sponsor:(id)a5 applicationData:(id)a6 error:(id *)a7;
+ (IDSMPConversationGroup)conversationGroupWithParent:(id)a3 members:(id)a4 sponsorAlias:(id)a5 sponsor:(id)a6 applicationData:(id)a7 error:(id *)a8;
+ (IDSMPConversationGroup)conversationGroupWithParent:(id)a3 sponsor:(id)a4 deviceIdentity:(id)a5 groupID:(id)a6 publicKeyData:(id)a7 publicData:(id)a8 signature:(id)a9 error:(id *)a10;
+ (IDSMPConversationGroup)conversationGroupWithPrivateDataRepresentation:(id)a3;
+ (id)conversationSponsorPairFromPublicData:(id)a3 publicKey:(id)a4 signature:(id)a5 groupID:(id)a6 parent:(id)a7 parentPublicKey:(id)a8 forwardingTicket:(id)a9 fullDeviceIdentity:(id)a10 error:(id *)a11;
- (BOOL)isParentOfGroup:(id)a3;
- (ENGroupID)groupID;
- (IDSMPConversationGroup)conversationGroupWithUpdatedGroupID:(id)a3 error:(id *)a4;
- (NSData)applicationData;
- (NSData)forwardingTicket;
- (NSData)publicKeyData;
- (NSDictionary)groupMembers;
- (NSString)sponsorAlias;
- (id)privateDataRepresentationWithError:(id *)a3;
- (id)publicDataRepresentationWithSponsor:(id)a3 error:(id *)a4;
- (id)signAndProtectData:(id)a3 senderSigningIdentity:(id)a4 members:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 error:(id *)a4;
- (id)verifyAndExposeData:(id)a3 senderSigningIdentity:(id)a4 members:(id)a5 error:(id *)a6;
- (unint64_t)generation;
@end

@implementation IDSMPConversationGroup

+ (IDSMPConversationGroup)conversationGroupWithParent:(id)a3 members:(id)a4 sponsor:(id)a5 applicationData:(id)a6 error:(id *)a7
{
  return 0;
}

+ (IDSMPConversationGroup)conversationGroupWithParent:(id)a3 sponsor:(id)a4 deviceIdentity:(id)a5 groupID:(id)a6 publicKeyData:(id)a7 publicData:(id)a8 signature:(id)a9 error:(id *)a10
{
  return 0;
}

- (id)signAndProtectData:(id)a3 senderSigningIdentity:(id)a4 members:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)verifyAndExposeData:(id)a3 senderSigningIdentity:(id)a4 members:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)signData:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)publicDataRepresentationWithSponsor:(id)a3 error:(id *)a4
{
  return 0;
}

- (IDSMPConversationGroup)conversationGroupWithUpdatedGroupID:(id)a3 error:(id *)a4
{
  return 0;
}

+ (IDSMPConversationGroup)conversationGroupWithParent:(id)a3 members:(id)a4 sponsorAlias:(id)a5 sponsor:(id)a6 applicationData:(id)a7 error:(id *)a8
{
  return 0;
}

+ (id)conversationSponsorPairFromPublicData:(id)a3 publicKey:(id)a4 signature:(id)a5 groupID:(id)a6 parent:(id)a7 parentPublicKey:(id)a8 forwardingTicket:(id)a9 fullDeviceIdentity:(id)a10 error:(id *)a11
{
  return 0;
}

- (id)privateDataRepresentationWithError:(id *)a3
{
  return 0;
}

+ (IDSMPConversationGroup)conversationGroupWithPrivateDataRepresentation:(id)a3
{
  return 0;
}

+ (IDSMPConversationGroup)conversationGroupWithConversationKey:(id)a3 fromPublicData:(id)a4 publicKey:(id)a5 signature:(id)a6 groupID:(id)a7 parent:(id)a8 parentPublicKey:(id)a9 forwardingTicket:(id)a10 sponsor:(id)a11 error:(id *)a12
{
  return 0;
}

- (BOOL)isParentOfGroup:(id)a3
{
  return 1;
}

- (ENGroupID)groupID
{
  return self->_groupID;
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (NSData)forwardingTicket
{
  return self->_forwardingTicket;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (NSString)sponsorAlias
{
  return self->_sponsorAlias;
}

- (NSDictionary)groupMembers
{
  return self->_groupMembers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupMembers, 0);
  objc_storeStrong((id *)&self->_sponsorAlias, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_forwardingTicket, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

@end