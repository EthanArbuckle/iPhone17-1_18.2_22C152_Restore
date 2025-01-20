@interface _MSConversationState
+ (BOOL)supportsSecureCoding;
- (BOOL)isBusiness;
- (BOOL)isiMessage;
- (MSMessage)activeMessage;
- (NSArray)conversationContext;
- (NSArray)draftAssetArchives;
- (NSArray)recipientAddresses;
- (NSArray)recipientIdentifiers;
- (NSData)conversationEngramID;
- (NSString)conversationID;
- (NSString)generatedSummary;
- (NSString)groupID;
- (NSString)iMessageLoginID;
- (NSString)senderAddress;
- (NSUUID)conversationIdentifier;
- (NSUUID)senderIdentifier;
- (_MSConversationState)init;
- (_MSConversationState)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveMessage:(id)a3;
- (void)setConversationContext:(id)a3;
- (void)setConversationEngramID:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setDraftAssetArchives:(id)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setIsBusiness:(BOOL)a3;
- (void)setIsiMessage:(BOOL)a3;
- (void)setRecipientAddresses:(id)a3;
- (void)setRecipientIdentifiers:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSenderIdentifier:(id)a3;
- (void)setiMessageLoginID:(id)a3;
@end

@implementation _MSConversationState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_MSConversationState)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MSConversationState;
  return [(_MSConversationState *)&v3 init];
}

- (id)description
{
  v2 = @"YES";
  if (self->_isiMessage) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  if (!self->_isBusiness) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"conversationID: %@, senderIdentifier: %@, recipientIdentifiers: %@, activeMessage: %@, conversationIdentifier: %@, iMessageLoginID: %@, senderAddress: %@, recipientAddresses: %@, isiMessage: %@, isBusiness: %@", self->_conversationID, self->_senderIdentifier, self->_recipientIdentifiers, self->_activeMessage, self->_conversationIdentifier, self->_iMessageLoginID, self->_senderAddress, self->_recipientAddresses, v3, v2];
}

- (_MSConversationState)initWithCoder:(id)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_MSConversationState;
  v5 = [(_MSConversationState *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_conversationID"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_conversationEngramID"];
    conversationEngramID = v5->_conversationEngramID;
    v5->_conversationEngramID = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_senderIdentifier"];
    senderIdentifier = v5->_senderIdentifier;
    v5->_senderIdentifier = (NSUUID *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    v16 = [v14 setWithArray:v15];

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_recipientIdentifiers"];
    recipientIdentifiers = v5->_recipientIdentifiers;
    v5->_recipientIdentifiers = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activeMessage"];
    activeMessage = v5->_activeMessage;
    v5->_activeMessage = (MSMessage *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cid"];
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSUUID *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lid"];
    iMessageLoginID = v5->_iMessageLoginID;
    v5->_iMessageLoginID = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sad"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    v29 = [v27 setWithArray:v28];

    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"_rad"];
    recipientAddresses = v5->_recipientAddresses;
    v5->_recipientAddresses = (NSArray *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smry"];
    generatedSummary = v5->_generatedSummary;
    v5->_generatedSummary = (NSString *)v32;

    v34 = (void *)MEMORY[0x1E4F1CAD0];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    v47[2] = objc_opt_class();
    v47[3] = objc_opt_class();
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    v36 = [v34 setWithArray:v35];

    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"_ccxt"];
    conversationContext = v5->_conversationContext;
    v5->_conversationContext = (NSArray *)v37;

    v5->_isiMessage = [v4 decodeBoolForKey:@"_isiMessage"];
    v5->_isBusiness = [v4 decodeBoolForKey:@"_isBusiness"];
    v39 = (void *)MEMORY[0x1E4F1CAD0];
    v46[0] = objc_opt_class();
    v46[1] = objc_opt_class();
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    v41 = [v39 setWithArray:v40];

    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"_dap"];
    draftAssetArchives = v5->_draftAssetArchives;
    v5->_draftAssetArchives = (NSArray *)v42;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  conversationID = self->_conversationID;
  id v5 = a3;
  [v5 encodeObject:conversationID forKey:@"_conversationID"];
  [v5 encodeObject:self->_conversationEngramID forKey:@"_conversationEngramID"];
  [v5 encodeObject:self->_groupID forKey:@"_groupID"];
  [v5 encodeObject:self->_iMessageLoginID forKey:@"_lid"];
  [v5 encodeObject:self->_senderIdentifier forKey:@"_senderIdentifier"];
  [v5 encodeObject:self->_recipientIdentifiers forKey:@"_recipientIdentifiers"];
  [v5 encodeObject:self->_activeMessage forKey:@"_activeMessage"];
  [v5 encodeObject:self->_conversationIdentifier forKey:@"_cid"];
  [v5 encodeObject:self->_senderAddress forKey:@"_sad"];
  [v5 encodeObject:self->_recipientAddresses forKey:@"_rad"];
  [v5 encodeObject:self->_generatedSummary forKey:@"_smry"];
  [v5 encodeObject:self->_conversationContext forKey:@"_ccxt"];
  [v5 encodeBool:self->_isiMessage forKey:@"_isiMessage"];
  [v5 encodeBool:self->_isBusiness forKey:@"_isBusiness"];
  [v5 encodeObject:self->_draftAssetArchives forKey:@"_dap"];
}

- (NSUUID)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (NSUUID)senderIdentifier
{
  return self->_senderIdentifier;
}

- (void)setSenderIdentifier:(id)a3
{
}

- (NSArray)recipientIdentifiers
{
  return self->_recipientIdentifiers;
}

- (void)setRecipientIdentifiers:(id)a3
{
}

- (MSMessage)activeMessage
{
  return self->_activeMessage;
}

- (void)setActiveMessage:(id)a3
{
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (NSData)conversationEngramID
{
  return self->_conversationEngramID;
}

- (void)setConversationEngramID:(id)a3
{
}

- (NSString)iMessageLoginID
{
  return self->_iMessageLoginID;
}

- (void)setiMessageLoginID:(id)a3
{
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
}

- (NSString)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
}

- (NSArray)conversationContext
{
  return self->_conversationContext;
}

- (void)setConversationContext:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (BOOL)isiMessage
{
  return self->_isiMessage;
}

- (void)setIsiMessage:(BOOL)a3
{
  self->_isiMessage = a3;
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (NSArray)draftAssetArchives
{
  return self->_draftAssetArchives;
}

- (void)setDraftAssetArchives:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftAssetArchives, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_iMessageLoginID, 0);
  objc_storeStrong((id *)&self->_conversationEngramID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_activeMessage, 0);
  objc_storeStrong((id *)&self->_recipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_senderIdentifier, 0);

  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
}

@end