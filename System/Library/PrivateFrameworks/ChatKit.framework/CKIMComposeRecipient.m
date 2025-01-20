@interface CKIMComposeRecipient
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemovableFromSearchResults;
- (BOOL)useAbbreviatedDisplayName;
- (CKIMComposeRecipient)initWithCoder:(id)a3;
- (CKIMComposeRecipient)initWithHandle:(id)a3;
- (IMHandle)handle;
- (id)address;
- (id)commentedAddress;
- (id)compositeName;
- (id)displayString;
- (id)supportedDragTypes;
- (id)uncommentedAddress;
- (id)unlocalizedLabel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUseAbbreviatedDisplayName:(BOOL)a3;
@end

@implementation CKIMComposeRecipient

- (CKIMComposeRecipient)initWithHandle:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKIMComposeRecipient;
  v6 = [(CKIMComposeRecipient *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handle, a3);
    v8 = [v5 ID];
    BOOL v9 = [v8 length] == 0;

    if (v9 && IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v5;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Handle passed to CKIMComposeRecipient was nil or has no address: %@", buf, 0xCu);
      }
    }
    v11 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    v12 = [v5 ID];
    v13 = [v11 fetchCNContactForHandleWithID:v12];

    v14 = [v5 ID];
    if ([v14 _appearsToBePhoneNumber])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 _appearsToBeEmail])
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = 2;
    }
    v16 = [(IMHandle *)v7->_handle ID];
    v18.receiver = v7;
    v18.super_class = (Class)CKIMComposeRecipient;
    v7 = [(CKIMComposeRecipient *)&v18 initWithContact:v13 address:v16 kind:v15];
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKIMComposeRecipient;
  id v4 = a3;
  [(CKIMComposeRecipient *)&v6 encodeWithCoder:v4];
  id v5 = [(CKIMComposeRecipient *)self handle];
  [v4 encodeObject:v5 forKey:@"handle"];
}

- (CKIMComposeRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKIMComposeRecipient;
  id v5 = [(CKIMComposeRecipient *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (IMHandle *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)address
{
  return (id)[(IMHandle *)self->_handle ID];
}

- (id)commentedAddress
{
  return (id)[(IMHandle *)self->_handle nameAndID];
}

- (id)unlocalizedLabel
{
  return 0;
}

- (id)compositeName
{
  return (id)[(IMHandle *)self->_handle fullName];
}

- (id)displayString
{
  if ([(CKIMComposeRecipient *)self useAbbreviatedDisplayName])
  {
    uint64_t v3 = [(IMHandle *)self->_handle _displayNameWithAbbreviation];
  }
  else
  {
    int v4 = CKIsRunningInMacCatalyst();
    handle = self->_handle;
    if (v4) {
      [(IMHandle *)handle name];
    }
    else {
    uint64_t v3 = [(IMHandle *)handle fullName];
    }
  }
  uint64_t v6 = (void *)v3;
  if (!v3)
  {
    v7 = CKFrameworkBundle();
    uint64_t v6 = [v7 localizedStringForKey:@"NO_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  return v6;
}

- (id)uncommentedAddress
{
  return (id)[(IMHandle *)self->_handle ID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(CKIMComposeRecipient *)self handle];
    v7 = [v5 handle];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CKIMComposeRecipient *)self handle];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)supportedDragTypes
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F5A0B0]];
}

- (BOOL)isRemovableFromSearchResults
{
  return 0;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (BOOL)useAbbreviatedDisplayName
{
  return self->_useAbbreviatedDisplayName;
}

- (void)setUseAbbreviatedDisplayName:(BOOL)a3
{
  self->_useAbbreviatedDisplayName = a3;
}

- (void).cxx_destruct
{
}

@end