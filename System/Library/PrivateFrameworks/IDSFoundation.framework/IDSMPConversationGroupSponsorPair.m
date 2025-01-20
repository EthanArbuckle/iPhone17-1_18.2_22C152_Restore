@interface IDSMPConversationGroupSponsorPair
- (IDSMPConversationGroupSponsorPair)initWithConversationKey:(id)a3 sponsorAlias:(id)a4;
- (IDSMPConversationKey)conversationKey;
- (NSString)sponsorAlias;
@end

@implementation IDSMPConversationGroupSponsorPair

- (IDSMPConversationGroupSponsorPair)initWithConversationKey:(id)a3 sponsorAlias:(id)a4
{
  return 0;
}

- (IDSMPConversationKey)conversationKey
{
  return self->_conversationKey;
}

- (NSString)sponsorAlias
{
  return self->_sponsorAlias;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sponsorAlias, 0);
  objc_storeStrong((id *)&self->_conversationKey, 0);
}

@end