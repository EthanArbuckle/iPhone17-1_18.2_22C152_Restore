@interface MFRecentComposeRecipient
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isRemovableFromSearchResults;
- (MFRecentComposeRecipient)initWithCoder:(id)a3;
- (MFRecentComposeRecipient)initWithRecentContact:(id)a3;
- (id)description;
- (id)placeholderName;
- (id)preferredSendingAddress;
- (id)recentContact;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFRecentComposeRecipient

- (MFRecentComposeRecipient)initWithRecentContact:(id)a3
{
  id v5 = a3;
  v6 = (const void *)[v5 person];
  uint64_t RecordID = ABRecordGetRecordID(v6);
  uint64_t v8 = [v5 property];
  uint64_t v9 = [v5 matchedIdentifier];
  v10 = [v5 address];
  v15.receiver = self;
  v15.super_class = (Class)MFRecentComposeRecipient;
  v11 = [(MFComposeRecipient *)&v15 initWithRecord:v6 recordID:RecordID property:v8 identifier:v9 address:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recent, a3);
    v13 = v12;
  }

  return v12;
}

- (BOOL)isRemovableFromSearchResults
{
  return self->super._recordID == -1;
}

- (id)recentContact
{
  return self->_recent;
}

- (id)preferredSendingAddress
{
  return (id)[(CRRecentContact *)self->_recent lastSendingAddress];
}

- (id)placeholderName
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"RECENT_PLACEHOLDER_NAME" value:&stru_1F0817A00 table:@"Main"];

  return v3;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 recentContact];
    v6 = [v5 address];
    v7 = [(MFRecentComposeRecipient *)self recentContact];
    uint64_t v8 = [v7 address];
    char v9 = [v6 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MFComposeRecipient *)self address];
  v7 = [v3 stringWithFormat:@"<%@: %p> \"%@\"", v5, self, v6];

  return v7;
}

- (MFRecentComposeRecipient)initWithCoder:(id)a3
{
  id v4 = [a3 decodeObjectForKey:@"recent"];
  id v5 = [(MFRecentComposeRecipient *)self initWithRecentContact:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end