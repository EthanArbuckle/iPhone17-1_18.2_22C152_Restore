@interface BMAccount
+ (BOOL)supportsSecureCoding;
+ (BOOL)verifyFormattedLikeIdentifier:(id)a3;
+ (id)_hashOfString:(id)a3;
- (BMAccount)initWithAltDSID:(id)a3;
- (BMAccount)initWithCoder:(id)a3;
- (BMAccount)initWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)biomeAccountIdentifier;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMAccount

- (BMAccount)initWithAltDSID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BMAccount.m", 21, @"Invalid parameter not satisfying: %@", @"altDSID" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)BMAccount;
  v6 = [(BMAccount *)&v13 init];
  if (v6)
  {
    uint64_t v7 = +[BMAccount _hashOfString:v5];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    uint64_t v9 = [v5 copy];
    altDSID = v6->_altDSID;
    v6->_altDSID = (NSString *)v9;
  }
  return v6;
}

- (BMAccount)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BMAccount.m", 32, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if (+[BMAccount verifyFormattedLikeIdentifier:v5])
  {
    v14.receiver = self;
    v14.super_class = (Class)BMAccount;
    v6 = [(BMAccount *)&v14 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v7;

      altDSID = v6->_altDSID;
      v6->_altDSID = 0;
    }
    self = v6;
    v10 = self;
  }
  else
  {
    v11 = __biome_log_for_category(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMAccount initWithIdentifier:]((uint64_t)v5, v11);
    }

    v10 = 0;
  }

  return v10;
}

+ (id)_hashOfString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (const char *)[a3 cStringUsingEncoding:4];
  CC_LONG v4 = strlen(v3);
  CC_SHA1(v3, v4, md);
  id v5 = [MEMORY[0x1E4F28E78] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);

  return v5;
}

+ (BOOL)verifyFormattedLikeIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 40)
  {
    CC_LONG v4 = (__CFString *)v3;
    id v5 = self;

    if (!v5) {
      goto LABEL_31;
    }
    memset(v23, 0, sizeof(v23));
    CFIndex Length = CFStringGetLength(v4);
    CFStringRef theString = v4;
    uint64_t v27 = 0;
    CFIndex v28 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v4);
    CStringPtr = 0;
    v25 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
    }
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    v26 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 64;
      while (1)
      {
        uint64_t v13 = (unint64_t)v11 >= 4 ? 4 : v11;
        CFIndex v14 = v28;
        if (v28 <= v11)
        {
          UniChar v15 = 0;
        }
        else if (v25)
        {
          UniChar v15 = v25[v11 + v27];
        }
        else if (v26)
        {
          UniChar v15 = v26[v27 + v11];
        }
        else
        {
          if (v30 <= v11 || v10 > v11)
          {
            uint64_t v17 = v13 + v9;
            uint64_t v18 = v12 - v13;
            uint64_t v19 = v11 - v13;
            CFIndex v20 = v19 + 64;
            if (v19 + 64 >= v28) {
              CFIndex v20 = v28;
            }
            uint64_t v29 = v19;
            uint64_t v30 = v20;
            if (v28 >= v18) {
              CFIndex v14 = v18;
            }
            v31.length = v14 + v17;
            v31.location = v19 + v27;
            CFStringGetCharacters(theString, v31, (UniChar *)v23);
            uint64_t v10 = v29;
          }
          UniChar v15 = *((_WORD *)v23 + v11 - v10);
        }
        if ((unsigned __int16)(v15 - 48) >= 0xAu && (unsigned __int16)(v15 - 97) >= 6u) {
          break;
        }
        ++v11;
        --v9;
        ++v12;
        if (Length == v11) {
          goto LABEL_31;
        }
      }
      BOOL v21 = 0;
    }
    else
    {
LABEL_31:
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"id"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
}

- (BMAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
  if (v5)
  {
    v6 = [(BMAccount *)self initWithAltDSID:v5];
  }
  else
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    v6 = [(BMAccount *)self initWithIdentifier:v7];
  }
  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->_identifier isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"BMAccount(identifier: %@ altDSID: %@)", self->_identifier, self->_altDSID];
}

- (NSString)biomeAccountIdentifier
{
  return self->_identifier;
}

- (NSString)accountIdentifier
{
  return self->_altDSID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "BMAccount passed invalid identifier %@", (uint8_t *)&v2, 0xCu);
}

@end