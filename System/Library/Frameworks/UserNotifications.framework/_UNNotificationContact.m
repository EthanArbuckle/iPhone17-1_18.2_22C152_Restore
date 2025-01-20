@interface _UNNotificationContact
+ (BOOL)supportsSecureCoding;
+ (id)contactFromINPerson:(id)a3 serviceName:(id)a4;
- (BOOL)isCNContactIdentifierSuggested;
- (BOOL)isDisplayNameSuggested;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredNameReal;
- (BOOL)isSimilar:(id)a3;
- (NSString)cnContactFullname;
- (NSString)cnContactIdentifier;
- (NSString)customIdentifier;
- (NSString)displayName;
- (NSString)handle;
- (NSString)preferredName;
- (NSString)serviceName;
- (_UNNotificationContact)initWithCoder:(id)a3;
- (id)_initWithhandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11;
- (id)debugDescription;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)handleType;
- (unint64_t)hash;
- (unint64_t)similarHash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UNNotificationContact

- (NSString)preferredName
{
  if ([(_UNNotificationContact *)self isDisplayNameSuggested]
    && ([(_UNNotificationContact *)self displayName],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 length],
        v3,
        v4))
  {
    v5 = UNLocalizedFormatStringForKey(@"%@", @"CONTACT_MAYBE_PREFIX_FORMAT");
    v6 = NSString;
    v7 = [(_UNNotificationContact *)self displayName];
    v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7, 0);
  }
  else
  {
    v9 = [(_UNNotificationContact *)self displayName];
    v5 = v9;
    if (v9)
    {
      id v10 = v9;
      v5 = v10;
    }
    else
    {
      id v10 = [(_UNNotificationContact *)self handle];
    }
    v8 = v10;
  }

  return (NSString *)v8;
}

- (BOOL)isPreferredNameReal
{
  v2 = [(_UNNotificationContact *)self displayName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_initWithhandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)_UNNotificationContact;
  v23 = [(_UNNotificationContact *)&v37 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    handle = v23->_handle;
    v23->_handle = (NSString *)v24;

    v23->_handleType = a4;
    uint64_t v26 = [v18 copy];
    serviceName = v23->_serviceName;
    v23->_serviceName = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    displayName = v23->_displayName;
    v23->_displayName = (NSString *)v28;

    v23->_displayNameSuggested = a7;
    uint64_t v30 = [v20 copy];
    customIdentifier = v23->_customIdentifier;
    v23->_customIdentifier = (NSString *)v30;

    uint64_t v32 = [v21 copy];
    cnContactIdentifier = v23->_cnContactIdentifier;
    v23->_cnContactIdentifier = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    cnContactFullname = v23->_cnContactFullname;
    v23->_cnContactFullname = (NSString *)v34;

    v23->_cnContactIdentifierSuggested = a11;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_12:
      LOBYTE(v20) = 0;
      goto LABEL_13;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_12;
  }
  if (![(_UNNotificationContact *)self isSimilar:v5]) {
    goto LABEL_12;
  }
  v6 = [(_UNNotificationContact *)self serviceName];
  v7 = [v5 serviceName];
  int v8 = UNEqualStrings(v6, v7);

  if (!v8) {
    goto LABEL_12;
  }
  v9 = [(_UNNotificationContact *)self displayName];
  id v10 = [v5 displayName];
  int v11 = UNEqualStrings(v9, v10);

  if (!v11) {
    goto LABEL_12;
  }
  int v12 = [(_UNNotificationContact *)self isDisplayNameSuggested];
  if (v12 != [v5 isDisplayNameSuggested]) {
    goto LABEL_12;
  }
  v13 = [(_UNNotificationContact *)self cnContactIdentifier];
  v14 = [v5 cnContactIdentifier];
  int v15 = UNEqualStrings(v13, v14);

  if (!v15) {
    goto LABEL_12;
  }
  v16 = [(_UNNotificationContact *)self cnContactFullname];
  id v17 = [v5 cnContactFullname];
  int v18 = UNEqualStrings(v16, v17);

  if (!v18) {
    goto LABEL_12;
  }
  BOOL v19 = [(_UNNotificationContact *)self isCNContactIdentifierSuggested];
  int v20 = v19 ^ [v5 isCNContactIdentifierSuggested] ^ 1;
LABEL_13:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_UNNotificationContact *)self similarHash];
  NSUInteger v4 = [(NSString *)self->_serviceName hash] + v3;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  NSUInteger v6 = v4 + v5 + [(NSString *)self->_cnContactIdentifier hash];
  return v6 + [(NSString *)self->_cnContactFullname hash] + self->_cnContactIdentifierSuggested;
}

- (id)debugDescription
{
  return [(_UNNotificationContact *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = +[_UNMutableNotificationContact allocWithZone:a3];
  NSUInteger v5 = [(_UNNotificationContact *)self handle];
  int64_t v6 = [(_UNNotificationContact *)self handleType];
  v7 = [(_UNNotificationContact *)self serviceName];
  int v8 = [(_UNNotificationContact *)self displayName];
  BOOL v9 = [(_UNNotificationContact *)self isDisplayNameSuggested];
  id v10 = [(_UNNotificationContact *)self customIdentifier];
  int v11 = [(_UNNotificationContact *)self cnContactIdentifier];
  int v12 = [(_UNNotificationContact *)self cnContactFullname];
  LOBYTE(v15) = [(_UNNotificationContact *)self isCNContactIdentifierSuggested];
  id v13 = [(_UNNotificationContact *)v4 _initWithhandle:v5 handleType:v6 serviceName:v7 displayName:v8 displayNameSuggested:v9 customIdentifier:v10 cnContactIdentifier:v11 cnContactFullname:v12 cnContactIdentifierSuggested:v15];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(_UNNotificationContact *)self handle];
  [v10 encodeObject:v4 forKey:@"handle"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[_UNNotificationContact handleType](self, "handleType"), @"handleType");
  NSUInteger v5 = [(_UNNotificationContact *)self serviceName];
  [v10 encodeObject:v5 forKey:@"serviceName"];

  int64_t v6 = [(_UNNotificationContact *)self displayName];
  [v10 encodeObject:v6 forKey:@"displayName"];

  objc_msgSend(v10, "encodeBool:forKey:", -[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested"), @"displayNameSuggested");
  v7 = [(_UNNotificationContact *)self customIdentifier];
  [v10 encodeObject:v7 forKey:@"customIdentifier"];

  int v8 = [(_UNNotificationContact *)self cnContactIdentifier];
  [v10 encodeObject:v8 forKey:@"cnContactIdentifier"];

  BOOL v9 = [(_UNNotificationContact *)self cnContactFullname];
  [v10 encodeObject:v9 forKey:@"cnContactFullname"];

  objc_msgSend(v10, "encodeBool:forKey:", -[_UNNotificationContact isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"), @"cnContactSuggested");
}

- (_UNNotificationContact)initWithCoder:(id)a3
{
  id v3 = a3;
  NSUInteger v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"handleType"];
  int64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  uint64_t v8 = [v3 decodeBoolForKey:@"displayNameSuggested"];
  BOOL v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"customIdentifier"];
  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"cnContactIdentifier"];
  int v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"cnContactFullname"];
  char v12 = [v3 decodeBoolForKey:@"cnContactSuggested"];

  LOBYTE(v15) = v12;
  id v13 = [(_UNNotificationContact *)self _initWithhandle:v4 handleType:v5 serviceName:v6 displayName:v7 displayNameSuggested:v8 customIdentifier:v9 cnContactIdentifier:v10 cnContactFullname:v11 cnContactIdentifierSuggested:v15];

  return v13;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_UNNotificationContact *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  int64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___UNNotificationContact_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E5F06128;
  id v7 = v6;
  id v11 = v7;
  char v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

- (id)succinctDescription
{
  v2 = [(_UNNotificationContact *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  NSUInteger v4 = [(_UNNotificationContact *)self handle];
  id v5 = objc_msgSend(v4, "un_logDigest");
  id v6 = (id)[v3 appendObject:v5 withName:@"handle"];

  id v7 = [(_UNNotificationContact *)self displayName];
  id v8 = objc_msgSend(v7, "un_logDigest");
  id v9 = (id)[v3 appendObject:v8 withName:@"displayName"];

  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested"), @"isDisplayNameSuggested");
  id v11 = [(_UNNotificationContact *)self serviceName];
  char v12 = objc_msgSend(v11, "un_logDigest");
  id v13 = (id)[v3 appendObject:v12 withName:@"serviceName"];

  v14 = [(_UNNotificationContact *)self customIdentifier];
  uint64_t v15 = objc_msgSend(v14, "un_logDigest");
  id v16 = (id)[v3 appendObject:v15 withName:@"customIdentifier"];

  id v17 = [(_UNNotificationContact *)self cnContactIdentifier];
  id v18 = (id)[v3 appendObject:v17 withName:@"cnContactIdentifier"];

  BOOL v19 = [(_UNNotificationContact *)self cnContactFullname];
  int v20 = objc_msgSend(v19, "un_logDigest");
  id v21 = (id)[v3 appendObject:v20 withName:@"cnContactFullname"];

  id v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationContact isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"), @"isCNContactIdentifierSuggested");

  return v3;
}

- (NSString)handle
{
  return self->_handle;
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isDisplayNameSuggested
{
  return self->_displayNameSuggested;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (BOOL)isCNContactIdentifierSuggested
{
  return self->_cnContactIdentifierSuggested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

- (unint64_t)similarHash
{
  NSUInteger v3 = self->_handleType + [(NSString *)self->_handle hash];
  return v3 + [(NSString *)self->_customIdentifier hash];
}

- (BOOL)isSimilar:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_8:
      char v12 = 0;
      goto LABEL_9;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_8;
  }
  id v6 = [(_UNNotificationContact *)self handle];
  id v7 = [v5 handle];
  int v8 = UNEqualStrings(v6, v7);

  if (!v8) {
    goto LABEL_8;
  }
  int64_t v9 = [(_UNNotificationContact *)self handleType];
  if (v9 != [v5 handleType]) {
    goto LABEL_8;
  }
  id v10 = [(_UNNotificationContact *)self customIdentifier];
  id v11 = [v5 customIdentifier];
  char v12 = UNEqualStrings(v10, v11);

LABEL_9:
  return v12;
}

+ (id)contactFromINPerson:(id)a3 serviceName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMe])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_alloc_init(_UNMutableNotificationContact);
    int v8 = [v5 personHandle];
    int64_t v9 = [v8 value];

    [(_UNMutableNotificationContact *)v7 setHandle:v9];
    [(_UNMutableNotificationContact *)v7 setServiceName:v6];
    id v10 = [v5 personHandle];
    uint64_t v11 = [v10 type];

    if (v11 == 2) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v11 == 1;
    }
    [(_UNMutableNotificationContact *)v7 setHandleType:v12];
    id v13 = [v5 displayName];
    if (([v13 isEqualToString:v9] & 1) == 0) {
      [(_UNMutableNotificationContact *)v7 setDisplayName:v13];
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = [v5 isContactSuggestion];
    }
    else {
      uint64_t v14 = 0;
    }
    [(_UNMutableNotificationContact *)v7 setDisplayNameSuggested:v14];
    uint64_t v15 = [v5 customIdentifier];
    [(_UNMutableNotificationContact *)v7 setCustomIdentifier:v15];

    id v16 = [v5 contactIdentifier];
    [(_UNMutableNotificationContact *)v7 setCnContactIdentifier:v16];
  }

  return v7;
}

@end