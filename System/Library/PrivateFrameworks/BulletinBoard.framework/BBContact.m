@interface BBContact
+ (BBContact)contactWithCustomHandle:(id)a3 customHandleType:(int64_t)a4 serviceName:(id)a5 customDisplayName:(id)a6 cnContactIdentifier:(id)a7 cnContactFullname:(id)a8 cnContactIdentifierSuggested:(BOOL)a9;
+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 cnContactIdentifier:(id)a7 cnContactFullname:(id)a8 cnContactIdentifierSuggested:(BOOL)a9;
+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 customIdentifier:(id)a7 cnContactIdentifier:(id)a8 cnContactFullname:(id)a9 cnContactIdentifierSuggested:(BOOL)a10;
+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11;
+ (BOOL)supportsSecureCoding;
- (BBContact)initWithCoder:(id)a3;
- (BOOL)isCNContactIdentifierSuggested;
- (BOOL)isDisplayNameSuggested;
- (BOOL)isEqual:(id)a3;
- (NSString)cnContactFullname;
- (NSString)cnContactIdentifier;
- (NSString)customDisplayName;
- (NSString)customHandle;
- (NSString)customIdentifier;
- (NSString)displayName;
- (NSString)handle;
- (NSString)serviceName;
- (id)_initWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11;
- (id)description;
- (int64_t)customHandleType;
- (int64_t)handleType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BBContact

+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 cnContactIdentifier:(id)a7 cnContactFullname:(id)a8 cnContactIdentifierSuggested:(BOOL)a9
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  LOBYTE(v21) = a9;
  id v19 = [[BBContact alloc] _initWithHandle:v18 handleType:a4 serviceName:v17 displayName:v16 displayNameSuggested:0 customIdentifier:0 cnContactIdentifier:v15 cnContactFullname:v14 cnContactIdentifierSuggested:v21];

  return (BBContact *)v19;
}

+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 customIdentifier:(id)a7 cnContactIdentifier:(id)a8 cnContactFullname:(id)a9 cnContactIdentifierSuggested:(BOOL)a10
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  LOBYTE(v24) = a10;
  id v22 = [[BBContact alloc] _initWithHandle:v21 handleType:a4 serviceName:v20 displayName:v19 displayNameSuggested:0 customIdentifier:v18 cnContactIdentifier:v17 cnContactFullname:v16 cnContactIdentifierSuggested:v24];

  return (BBContact *)v22;
}

+ (BBContact)contactWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11
{
  BOOL v12 = a7;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  LOBYTE(v25) = a11;
  id v23 = [[BBContact alloc] _initWithHandle:v22 handleType:a4 serviceName:v21 displayName:v20 displayNameSuggested:v12 customIdentifier:v19 cnContactIdentifier:v18 cnContactFullname:v17 cnContactIdentifierSuggested:v25];

  return (BBContact *)v23;
}

- (id)_initWithHandle:(id)a3 handleType:(int64_t)a4 serviceName:(id)a5 displayName:(id)a6 displayNameSuggested:(BOOL)a7 customIdentifier:(id)a8 cnContactIdentifier:(id)a9 cnContactFullname:(id)a10 cnContactIdentifierSuggested:(BOOL)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)BBContact;
  id v23 = [(BBContact *)&v37 init];
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

- (unint64_t)hash
{
  NSUInteger v3 = self->_handleType ^ [(NSString *)self->_handle hash];
  NSUInteger v4 = [(NSString *)self->_serviceName hash];
  NSUInteger v5 = v3 ^ v4 ^ [(NSString *)self->_displayName hash];
  BOOL displayNameSuggested = self->_displayNameSuggested;
  NSUInteger v7 = displayNameSuggested ^ [(NSString *)self->_customIdentifier hash];
  NSUInteger v8 = v5 ^ v7 ^ [(NSString *)self->_cnContactIdentifier hash];
  return v8 ^ [(NSString *)self->_cnContactFullname hash] ^ self->_cnContactIdentifierSuggested;
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
      v6 = 0;
LABEL_14:
      BOOL v22 = 0;
      goto LABEL_15;
    }
  }
  id v5 = v4;
  v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  NSUInteger v7 = [v5 handle];
  int v8 = BSEqualStrings();

  if (!v8) {
    goto LABEL_14;
  }
  int64_t handleType = self->_handleType;
  if (handleType != [v6 handleType]) {
    goto LABEL_14;
  }
  v10 = [v6 serviceName];
  int v11 = BSEqualStrings();

  if (!v11) {
    goto LABEL_14;
  }
  BOOL v12 = [v6 displayName];
  int v13 = BSEqualStrings();

  if (!v13) {
    goto LABEL_14;
  }
  int displayNameSuggested = self->_displayNameSuggested;
  if (displayNameSuggested != [v6 isDisplayNameSuggested]) {
    goto LABEL_14;
  }
  id v15 = [v6 customIdentifier];
  int v16 = BSEqualStrings();

  if (!v16) {
    goto LABEL_14;
  }
  id v17 = [v6 cnContactIdentifier];
  int v18 = BSEqualStrings();

  if (!v18) {
    goto LABEL_14;
  }
  id v19 = [v6 cnContactFullname];
  int v20 = BSEqualStrings();

  if (!v20) {
    goto LABEL_14;
  }
  int cnContactIdentifierSuggested = self->_cnContactIdentifierSuggested;
  BOOL v22 = cnContactIdentifierSuggested == [v6 isCNContactIdentifierSuggested];
LABEL_15:

  return v22;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; handle: %@, handleType: %li, serviceName: %@, displayName: %@, displayNameSuggested:%d, customIdentifier: %@, cnContactIdentifier: %@, cnContactFullname: %@, suggestedContactIdentifier: %d>",
               objc_opt_class(),
               self,
               self->_handle,
               self->_handleType,
               self->_serviceName,
               self->_displayName,
               self->_displayNameSuggested,
               self->_customIdentifier,
               self->_cnContactIdentifier,
               self->_cnContactFullname,
               self->_cnContactIdentifierSuggested);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"handle"];
  [v5 encodeInteger:self->_handleType forKey:@"handleType"];
  [v5 encodeObject:self->_serviceName forKey:@"serviceName"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeBool:self->_displayNameSuggested forKey:@"displayNameSuggested"];
  [v5 encodeObject:self->_customIdentifier forKey:@"customIdentifier"];
  [v5 encodeObject:self->_cnContactIdentifier forKey:@"cnContactIdentifier"];
  [v5 encodeObject:self->_cnContactFullname forKey:@"cnContactFullname"];
  [v5 encodeBool:self->_cnContactIdentifierSuggested forKey:@"suggestedContactIdentifier"];
}

- (BBContact)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"handleType"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
  NSUInteger v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  uint64_t v8 = [v3 decodeBoolForKey:@"displayNameSuggested"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"customIdentifier"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"cnContactIdentifier"];
  int v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"cnContactFullname"];
  char v12 = [v3 decodeBoolForKey:@"suggestedContactIdentifier"];

  LOBYTE(v15) = v12;
  int v13 = [(BBContact *)self _initWithHandle:v4 handleType:v5 serviceName:v6 displayName:v7 displayNameSuggested:v8 customIdentifier:v9 cnContactIdentifier:v10 cnContactFullname:v11 cnContactIdentifierSuggested:v15];

  return v13;
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

+ (BBContact)contactWithCustomHandle:(id)a3 customHandleType:(int64_t)a4 serviceName:(id)a5 customDisplayName:(id)a6 cnContactIdentifier:(id)a7 cnContactFullname:(id)a8 cnContactIdentifierSuggested:(BOOL)a9
{
  return 0;
}

- (NSString)customHandle
{
  return 0;
}

- (int64_t)customHandleType
{
  return 0;
}

- (NSString)customDisplayName
{
  return 0;
}

@end