@interface CPMessageListItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (CPListTemplate)listTemplate;
- (CPMessageListItem)initWithCoder:(id)a3;
- (CPMessageListItem)initWithConversationIdentifier:(NSString *)conversationIdentifier text:(NSString *)text leadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration trailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration detailText:(NSString *)detailText trailingText:(NSString *)trailingText;
- (CPMessageListItem)initWithFullName:(NSString *)fullName phoneOrEmailAddress:(NSString *)phoneOrEmailAddress leadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration trailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration detailText:(NSString *)detailText trailingText:(NSString *)trailingText;
- (CPMessageListItemLeadingConfiguration)leadingConfiguration;
- (CPMessageListItemTrailingConfiguration)trailingConfiguration;
- (NSString)conversationIdentifier;
- (NSString)description;
- (NSString)detailText;
- (NSString)phoneOrEmailAddress;
- (NSString)text;
- (NSString)trailingText;
- (NSUUID)identifier;
- (id)userInfo;
- (unint64_t)hash;
- (void)_setNeedsUpdate;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationIdentifier:(NSString *)conversationIdentifier;
- (void)setDetailText:(NSString *)detailText;
- (void)setEnabled:(BOOL)enabled;
- (void)setLeadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration;
- (void)setListTemplate:(id)a3;
- (void)setPhoneOrEmailAddress:(NSString *)phoneOrEmailAddress;
- (void)setText:(NSString *)text;
- (void)setTrailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration;
- (void)setTrailingText:(NSString *)trailingText;
- (void)setUserInfo:(id)userInfo;
@end

@implementation CPMessageListItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMessageListItem)initWithConversationIdentifier:(NSString *)conversationIdentifier text:(NSString *)text leadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration trailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration detailText:(NSString *)detailText trailingText:(NSString *)trailingText
{
  v24 = conversationIdentifier;
  v23 = text;
  v22 = leadingConfiguration;
  v15 = trailingConfiguration;
  v16 = detailText;
  v17 = trailingText;
  v25.receiver = self;
  v25.super_class = (Class)CPMessageListItem;
  v18 = [(CPMessageListItem *)&v25 init];
  if (v18)
  {
    uint64_t v19 = [MEMORY[0x263F08C38] UUID];
    identifier = v18->_identifier;
    v18->_identifier = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_text, text);
    objc_storeStrong((id *)&v18->_conversationIdentifier, conversationIdentifier);
    objc_storeStrong((id *)&v18->_leadingConfiguration, leadingConfiguration);
    objc_storeStrong((id *)&v18->_trailingConfiguration, trailingConfiguration);
    objc_storeStrong((id *)&v18->_detailText, detailText);
    objc_storeStrong((id *)&v18->_trailingText, trailingText);
    v18->_enabled = 1;
  }

  return v18;
}

- (CPMessageListItem)initWithFullName:(NSString *)fullName phoneOrEmailAddress:(NSString *)phoneOrEmailAddress leadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration trailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration detailText:(NSString *)detailText trailingText:(NSString *)trailingText
{
  v24 = fullName;
  v23 = phoneOrEmailAddress;
  v22 = leadingConfiguration;
  v15 = trailingConfiguration;
  v16 = detailText;
  v17 = trailingText;
  v25.receiver = self;
  v25.super_class = (Class)CPMessageListItem;
  v18 = [(CPMessageListItem *)&v25 init];
  if (v18)
  {
    uint64_t v19 = [MEMORY[0x263F08C38] UUID];
    identifier = v18->_identifier;
    v18->_identifier = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_text, fullName);
    objc_storeStrong((id *)&v18->_phoneOrEmailAddress, phoneOrEmailAddress);
    objc_storeStrong((id *)&v18->_leadingConfiguration, leadingConfiguration);
    objc_storeStrong((id *)&v18->_trailingConfiguration, trailingConfiguration);
    objc_storeStrong((id *)&v18->_detailText, detailText);
    objc_storeStrong((id *)&v18->_trailingText, trailingText);
    v18->_enabled = 1;
  }

  return v18;
}

- (CPMessageListItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPMessageListItem;
  v5 = [(CPMessageListItem *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemTextKey"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemConversationIdentifierKey"];
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemPhoneOrEmailKey"];
    phoneOrEmailAddress = v5->_phoneOrEmailAddress;
    v5->_phoneOrEmailAddress = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemLeadingConfigurationKey"];
    leadingConfiguration = v5->_leadingConfiguration;
    v5->_leadingConfiguration = (CPMessageListItemLeadingConfiguration *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemTrailingConfigurationKey"];
    trailingConfiguration = v5->_trailingConfiguration;
    v5->_trailingConfiguration = (CPMessageListItemTrailingConfiguration *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemDetailTextKey"];
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMessageListItemTrailingTextKey"];
    trailingText = v5->_trailingText;
    v5->_trailingText = (NSString *)v20;

    v5->_enabled = [v4 decodeBoolForKey:@"kCPMessageListItemEnabledKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(CPMessageListItem *)self text];
  [v12 encodeObject:v4 forKey:@"kCPMessageListItemTextKey"];

  v5 = [(CPMessageListItem *)self identifier];
  [v12 encodeObject:v5 forKey:@"kCPMessageListItemIdentifierKey"];

  uint64_t v6 = [(CPMessageListItem *)self conversationIdentifier];
  [v12 encodeObject:v6 forKey:@"kCPMessageListItemConversationIdentifierKey"];

  v7 = [(CPMessageListItem *)self phoneOrEmailAddress];
  [v12 encodeObject:v7 forKey:@"kCPMessageListItemPhoneOrEmailKey"];

  uint64_t v8 = [(CPMessageListItem *)self leadingConfiguration];
  [v12 encodeObject:v8 forKey:@"kCPMessageListItemLeadingConfigurationKey"];

  v9 = [(CPMessageListItem *)self trailingConfiguration];
  [v12 encodeObject:v9 forKey:@"kCPMessageListItemTrailingConfigurationKey"];

  uint64_t v10 = [(CPMessageListItem *)self detailText];
  [v12 encodeObject:v10 forKey:@"kCPMessageListItemDetailTextKey"];

  v11 = [(CPMessageListItem *)self trailingText];
  [v12 encodeObject:v11 forKey:@"kCPMessageListItemTrailingTextKey"];

  objc_msgSend(v12, "encodeBool:forKey:", -[CPMessageListItem isEnabled](self, "isEnabled"), @"kCPMessageListItemEnabledKey");
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CPMessageListItem;
  id v4 = [(CPMessageListItem *)&v10 description];
  v5 = [(CPMessageListItem *)self identifier];
  uint64_t v6 = [(CPMessageListItem *)self conversationIdentifier];
  v7 = [(CPMessageListItem *)self text];
  uint64_t v8 = [v3 stringWithFormat:@"%@: {identifier: %@, conversationIdentifier: %@, text: %@, detailText: %@, trailingText: %@, leadingConfiguration: %@, trailingConfiguration: %@}", v4, v5, v6, v7, self->_detailText, self->_trailingText, self->_leadingConfiguration, self->_trailingConfiguration];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  v3 = [(CPMessageListItem *)self text];
  uint64_t v4 = [v3 hash];
  v5 = [(CPMessageListItem *)self conversationIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CPMessageListItem *)self identifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 conversationIdentifier];
    uint64_t v6 = [(CPMessageListItem *)self conversationIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    [(CPMessageListItem *)self _setNeedsUpdate];
  }
}

- (void)_setNeedsUpdate
{
  id v3 = [(CPMessageListItem *)self listTemplate];
  [v3 _setItemNeedsUpdate:self];
}

- (void)setConversationIdentifier:(NSString *)conversationIdentifier
{
  v5 = conversationIdentifier;
  if (!-[NSString isEqualToString:](self->_conversationIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_conversationIdentifier, conversationIdentifier);
    [(CPMessageListItem *)self _setNeedsUpdate];
  }
}

- (void)setLeadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration
{
  objc_storeStrong((id *)&self->_leadingConfiguration, leadingConfiguration);

  [(CPMessageListItem *)self _setNeedsUpdate];
}

- (void)setTrailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration
{
  objc_storeStrong((id *)&self->_trailingConfiguration, trailingConfiguration);

  [(CPMessageListItem *)self _setNeedsUpdate];
}

- (void)setTrailingText:(NSString *)trailingText
{
  v5 = trailingText;
  if (!-[NSString isEqualToString:](self->_trailingText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_trailingText, trailingText);
    [(CPMessageListItem *)self _setNeedsUpdate];
  }
}

- (void)setText:(NSString *)text
{
  v5 = text;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, text);
    [(CPMessageListItem *)self _setNeedsUpdate];
  }
}

- (void)setDetailText:(NSString *)detailText
{
  v5 = detailText;
  if (!-[NSString isEqualToString:](self->_detailText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_detailText, detailText);
    [(CPMessageListItem *)self _setNeedsUpdate];
  }
}

- (void)setPhoneOrEmailAddress:(NSString *)phoneOrEmailAddress
{
  v5 = phoneOrEmailAddress;
  if (!-[NSString isEqualToString:](self->_phoneOrEmailAddress, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_phoneOrEmailAddress, phoneOrEmailAddress);
    [(CPMessageListItem *)self _setNeedsUpdate];
  }
}

- (NSString)text
{
  return self->_text;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)phoneOrEmailAddress
{
  return self->_phoneOrEmailAddress;
}

- (CPMessageListItemLeadingConfiguration)leadingConfiguration
{
  return self->_leadingConfiguration;
}

- (CPMessageListItemTrailingConfiguration)trailingConfiguration
{
  return self->_trailingConfiguration;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPListTemplate)listTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listTemplate);

  return (CPListTemplate *)WeakRetained;
}

- (void)setListTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_trailingConfiguration, 0);
  objc_storeStrong((id *)&self->_leadingConfiguration, 0);
  objc_storeStrong((id *)&self->_phoneOrEmailAddress, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end