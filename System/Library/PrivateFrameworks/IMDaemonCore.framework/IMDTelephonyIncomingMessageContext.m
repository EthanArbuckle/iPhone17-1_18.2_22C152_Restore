@interface IMDTelephonyIncomingMessageContext
- (BOOL)isGroupChat;
- (BOOL)isGroupMessagingEnabled;
- (BOOL)isSendEnabled;
- (BOOL)wasRelayed;
- (NSMutableArray)countryCodes;
- (NSMutableArray)participants;
- (NSMutableArray)unformattedIDs;
- (NSString)chatIdentifier;
- (NSString)countryCode;
- (NSString)destinationCallerID;
- (NSString)displayName;
- (NSString)groupID;
- (NSString)myNumberString;
- (NSString)mySIMIDString;
- (NSString)originalAlias;
- (NSString)originalGroupID;
- (NSString)sender;
- (NSString)senderUnformatted;
- (NSString)spamExtensionName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)capability;
- (int64_t)category;
- (int64_t)subCategory;
- (unsigned)style;
- (void)replaceCountryCodes:(id)a3;
- (void)replaceParticipants:(id)a3;
- (void)replaceUnformattedIDs:(id)a3;
- (void)setCapability:(int64_t)a3;
- (void)setCategory:(int64_t)a3;
- (void)setChatIdentifier:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCountryCodes:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setIsSendEnabled:(BOOL)a3;
- (void)setMyNumberString:(id)a3;
- (void)setMySIMIDString:(id)a3;
- (void)setOriginalAlias:(id)a3;
- (void)setOriginalGroupID:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setSender:(id)a3;
- (void)setSenderUnformatted:(id)a3;
- (void)setSpamExtensionName:(id)a3;
- (void)setStyle:(unsigned __int8)a3;
- (void)setSubCategory:(int64_t)a3;
- (void)setUnformattedIDs:(id)a3;
- (void)setWasRelayed:(BOOL)a3;
@end

@implementation IMDTelephonyIncomingMessageContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(IMDTelephonyIncomingMessageContext);
  [(IMDTelephonyIncomingMessageContext *)v4 setCategory:[(IMDTelephonyIncomingMessageContext *)self category]];
  [(IMDTelephonyIncomingMessageContext *)v4 setSubCategory:[(IMDTelephonyIncomingMessageContext *)self subCategory]];
  v5 = [(IMDTelephonyIncomingMessageContext *)self spamExtensionName];
  [(IMDTelephonyIncomingMessageContext *)v4 setSpamExtensionName:v5];

  [(IMDTelephonyIncomingMessageContext *)v4 setIsSendEnabled:[(IMDTelephonyIncomingMessageContext *)self isSendEnabled]];
  [(IMDTelephonyIncomingMessageContext *)v4 setCapability:[(IMDTelephonyIncomingMessageContext *)self capability]];
  v6 = [(IMDTelephonyIncomingMessageContext *)self originalAlias];
  [(IMDTelephonyIncomingMessageContext *)v4 setOriginalAlias:v6];

  v7 = [(IMDTelephonyIncomingMessageContext *)self chatIdentifier];
  [(IMDTelephonyIncomingMessageContext *)v4 setChatIdentifier:v7];

  v8 = [(IMDTelephonyIncomingMessageContext *)self mySIMIDString];
  [(IMDTelephonyIncomingMessageContext *)v4 setMySIMIDString:v8];

  v9 = [(IMDTelephonyIncomingMessageContext *)self myNumberString];
  [(IMDTelephonyIncomingMessageContext *)v4 setMyNumberString:v9];

  v10 = [(IMDTelephonyIncomingMessageContext *)self sender];
  [(IMDTelephonyIncomingMessageContext *)v4 setSender:v10];

  v11 = [(IMDTelephonyIncomingMessageContext *)self senderUnformatted];
  [(IMDTelephonyIncomingMessageContext *)v4 setSenderUnformatted:v11];

  v12 = [(IMDTelephonyIncomingMessageContext *)self countryCode];
  [(IMDTelephonyIncomingMessageContext *)v4 setCountryCode:v12];

  v13 = [(IMDTelephonyIncomingMessageContext *)self participants];
  v14 = (void *)[v13 mutableCopy];
  [(IMDTelephonyIncomingMessageContext *)v4 setParticipants:v14];

  v15 = [(IMDTelephonyIncomingMessageContext *)self unformattedIDs];
  v16 = (void *)[v15 mutableCopy];
  [(IMDTelephonyIncomingMessageContext *)v4 setUnformattedIDs:v16];

  v17 = [(IMDTelephonyIncomingMessageContext *)self countryCodes];
  v18 = (void *)[v17 mutableCopy];
  [(IMDTelephonyIncomingMessageContext *)v4 setCountryCodes:v18];

  [(IMDTelephonyIncomingMessageContext *)v4 setStyle:[(IMDTelephonyIncomingMessageContext *)self style]];
  [(IMDTelephonyIncomingMessageContext *)v4 setWasRelayed:[(IMDTelephonyIncomingMessageContext *)self wasRelayed]];
  v19 = [(IMDTelephonyIncomingMessageContext *)self groupID];
  [(IMDTelephonyIncomingMessageContext *)v4 setGroupID:v19];

  v20 = [(IMDTelephonyIncomingMessageContext *)self originalGroupID];
  [(IMDTelephonyIncomingMessageContext *)v4 setOriginalGroupID:v20];

  v21 = [(IMDTelephonyIncomingMessageContext *)self displayName];
  [(IMDTelephonyIncomingMessageContext *)v4 setDisplayName:v21];

  return v4;
}

- (BOOL)isGroupMessagingEnabled
{
  if ([(IMDTelephonyIncomingMessageContext *)self wasRelayed]) {
    return 1;
  }
  v4 = (void *)MEMORY[0x1E4F6E660];
  v5 = [(IMDTelephonyIncomingMessageContext *)self myNumberString];
  v6 = [(IMDTelephonyIncomingMessageContext *)self mySIMIDString];
  LOBYTE(v4) = [v4 IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v5 simID:v6];

  return (char)v4;
}

- (BOOL)isGroupChat
{
  v3 = [(IMDTelephonyIncomingMessageContext *)self participants];
  BOOL v4 = (unint64_t)[v3 count] >= 2
    && [(IMDTelephonyIncomingMessageContext *)self isGroupMessagingEnabled];

  return v4;
}

- (NSString)destinationCallerID
{
  v3 = [(IMDTelephonyIncomingMessageContext *)self myNumberString];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(IMDTelephonyIncomingMessageContext *)self mySIMIDString];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)replaceParticipants:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(IMDTelephonyIncomingMessageContext *)self setParticipants:v4];
}

- (void)replaceUnformattedIDs:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(IMDTelephonyIncomingMessageContext *)self setUnformattedIDs:v4];
}

- (void)replaceCountryCodes:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(IMDTelephonyIncomingMessageContext *)self setCountryCodes:v4];
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (int64_t)subCategory
{
  return self->_subCategory;
}

- (void)setSubCategory:(int64_t)a3
{
  self->_subCategory = a3;
}

- (NSString)spamExtensionName
{
  return self->_spamExtensionName;
}

- (void)setSpamExtensionName:(id)a3
{
}

- (BOOL)isSendEnabled
{
  return self->_isSendEnabled;
}

- (void)setIsSendEnabled:(BOOL)a3
{
  self->_isSendEnabled = a3;
}

- (int64_t)capability
{
  return self->_capability;
}

- (void)setCapability:(int64_t)a3
{
  self->_capability = a3;
}

- (NSString)originalAlias
{
  return self->_originalAlias;
}

- (void)setOriginalAlias:(id)a3
{
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void)setChatIdentifier:(id)a3
{
}

- (NSString)mySIMIDString
{
  return self->_mySIMIDString;
}

- (void)setMySIMIDString:(id)a3
{
}

- (NSString)myNumberString
{
  return self->_myNumberString;
}

- (void)setMyNumberString:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)senderUnformatted
{
  return self->_senderUnformatted;
}

- (void)setSenderUnformatted:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSMutableArray)unformattedIDs
{
  return self->_unformattedIDs;
}

- (void)setUnformattedIDs:(id)a3
{
}

- (NSMutableArray)countryCodes
{
  return self->_countryCodes;
}

- (void)setCountryCodes:(id)a3
{
}

- (unsigned)style
{
  return self->_style;
}

- (void)setStyle:(unsigned __int8)a3
{
  self->_style = a3;
}

- (BOOL)wasRelayed
{
  return self->_wasRelayed;
}

- (void)setWasRelayed:(BOOL)a3
{
  self->_wasRelayed = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)originalGroupID
{
  return self->_originalGroupID;
}

- (void)setOriginalGroupID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_countryCodes, 0);
  objc_storeStrong((id *)&self->_unformattedIDs, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_senderUnformatted, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_myNumberString, 0);
  objc_storeStrong((id *)&self->_mySIMIDString, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_originalAlias, 0);

  objc_storeStrong((id *)&self->_spamExtensionName, 0);
}

@end