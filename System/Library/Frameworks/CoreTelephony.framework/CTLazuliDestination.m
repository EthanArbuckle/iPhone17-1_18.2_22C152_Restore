@interface CTLazuliDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)isBot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliDestination:(id)a3;
- (CTLazuliAlternateIdentities)identities;
- (CTLazuliDestination)initWithCoder:(id)a3;
- (CTLazuliDestination)initWithReflection:(const void *)a3;
- (NSString)conversationID;
- (NSString)extractedUri;
- (NSString)uri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setExtractedUri:(id)a3;
- (void)setIdentities:(id)a3;
- (void)setIsBot:(BOOL)a3;
- (void)setUri:(id)a3;
@end

@implementation CTLazuliDestination

- (void)setUri:(id)a3
{
}

- (NSString)uri
{
  return self->_uri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_extractedUri, 0);

  objc_storeStrong((id *)&self->_uri, 0);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliDestination *)self uri];
  [v3 appendFormat:@", uri = %@", v4];

  v5 = [(CTLazuliDestination *)self extractedUri];
  [v3 appendFormat:@", extractedUri = %@", v5];

  [v3 appendFormat:@", isBot = %d", -[CTLazuliDestination isBot](self, "isBot")];
  v6 = [(CTLazuliDestination *)self identities];
  [v3 appendFormat:@", identities = %@", v6];

  v7 = [(CTLazuliDestination *)self conversationID];
  [v3 appendFormat:@", conversationID = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliDestination:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliDestination *)self uri];
  v7 = [v5 uri];
  if ([v6 isEqualToString:v7])
  {
    v8 = [(CTLazuliDestination *)self extractedUri];
    v9 = [v5 extractedUri];
    if (![v8 isEqualToString:v9]
      || (int v10 = -[CTLazuliDestination isBot](self, "isBot"), v10 != [v5 isBot]))
    {
      char v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v12 = [(CTLazuliDestination *)self identities];
    if (v12 || ([v5 identities], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = [(CTLazuliDestination *)self identities];
      v3 = [v5 identities];
      if (![v18 isEqualToCTLazuliAlternateIdentities:v3])
      {
        char v11 = 0;
        goto LABEL_13;
      }
      int v17 = 1;
    }
    else
    {
      v16 = 0;
      int v17 = 0;
    }
    v13 = [(CTLazuliDestination *)self conversationID];
    v14 = [v5 conversationID];
    char v11 = [v13 isEqualToString:v14];

    if (!v17)
    {
LABEL_14:
      if (!v12) {

      }
      goto LABEL_17;
    }
LABEL_13:

    goto LABEL_14;
  }
  char v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliDestination *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliDestination *)self isEqualToCTLazuliDestination:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliDestination allocWithZone:a3];
  [(CTLazuliDestination *)v4 setUri:self->_uri];
  [(CTLazuliDestination *)v4 setExtractedUri:self->_extractedUri];
  [(CTLazuliDestination *)v4 setIsBot:self->_isBot];
  [(CTLazuliDestination *)v4 setIdentities:self->_identities];
  [(CTLazuliDestination *)v4 setConversationID:self->_conversationID];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_uri forKey:@"kUriKey"];
  [v4 encodeObject:self->_extractedUri forKey:@"kExtractedUriKey"];
  [v4 encodeBool:self->_isBot forKey:@"kIsBotKey"];
  [v4 encodeObject:self->_identities forKey:@"kIdentitiesKey"];
  [v4 encodeObject:self->_conversationID forKey:@"kConversationIDKey"];
}

- (CTLazuliDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliDestination;
  id v5 = [(CTLazuliDestination *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUriKey"];
    uri = v5->_uri;
    v5->_uri = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kExtractedUriKey"];
    extractedUri = v5->_extractedUri;
    v5->_extractedUri = (NSString *)v8;

    v5->_isBot = [v4 decodeBoolForKey:@"kIsBotKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentitiesKey"];
    identities = v5->_identities;
    v5->_identities = (CTLazuliAlternateIdentities *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kConversationIDKey"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v12;
  }
  return v5;
}

- (CTLazuliDestination)initWithReflection:(const void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CTLazuliDestination;
  id v4 = [(CTLazuliDestination *)&v21 init];
  if (!v4) {
    return v4;
  }
  if (*((char *)a3 + 23) >= 0) {
    id v5 = a3;
  }
  else {
    id v5 = *(const void **)a3;
  }
  uint64_t v6 = [NSString stringWithUTF8String:v5];
  uri = v4->_uri;
  v4->_uri = (NSString *)v6;

  if (*((char *)a3 + 47) >= 0) {
    uint64_t v8 = (char *)a3 + 24;
  }
  else {
    uint64_t v8 = (char *)*((void *)a3 + 3);
  }
  uint64_t v9 = [NSString stringWithUTF8String:v8];
  extractedUri = v4->_extractedUri;
  v4->_extractedUri = (NSString *)v9;

  v4->_isBot = *((unsigned char *)a3 + 48);
  if (!*((unsigned char *)a3 + 80))
  {
    identities = v4->_identities;
    v4->_identities = 0;
    goto LABEL_12;
  }
  char v11 = [CTLazuliAlternateIdentities alloc];
  if (*((unsigned char *)a3 + 80))
  {
    uint64_t v12 = [(CTLazuliAlternateIdentities *)v11 initWithReflection:(char *)a3 + 56];
    identities = v4->_identities;
    v4->_identities = (CTLazuliAlternateIdentities *)v12;
LABEL_12:

    v16 = (char *)*((void *)a3 + 11);
    objc_super v15 = (char *)a3 + 88;
    v14 = v16;
    if (v15[23] >= 0) {
      int v17 = v15;
    }
    else {
      int v17 = v14;
    }
    uint64_t v18 = [NSString stringWithUTF8String:v17];
    conversationID = v4->_conversationID;
    v4->_conversationID = (NSString *)v18;

    return v4;
  }
  result = (CTLazuliDestination *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)extractedUri
{
  return self->_extractedUri;
}

- (void)setExtractedUri:(id)a3
{
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (void)setIsBot:(BOOL)a3
{
  self->_isBot = a3;
}

- (CTLazuliAlternateIdentities)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

@end