@interface CTLazuliGroupChatUri
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatUri:(id)a3;
- (CTLazuliGroupChatUri)initWithCoder:(id)a3;
- (CTLazuliGroupChatUri)initWithReflection:(const void *)a3;
- (NSString)conversationID;
- (NSString)destination;
- (NSString)focus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDestination:(id)a3;
- (void)setFocus:(id)a3;
@end

@implementation CTLazuliGroupChatUri

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliGroupChatUri *)self destination];
  [v3 appendFormat:@", destination = %@", v4];

  v5 = [(CTLazuliGroupChatUri *)self focus];
  [v3 appendFormat:@", focus = %@", v5];

  v6 = [(CTLazuliGroupChatUri *)self conversationID];
  [v3 appendFormat:@", conversationID = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatUri:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliGroupChatUri *)self destination];
  v6 = [v4 destination];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliGroupChatUri *)self focus];
    v8 = [v4 focus];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(CTLazuliGroupChatUri *)self conversationID];
      v10 = [v4 conversationID];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliGroupChatUri *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatUri *)self isEqualToCTLazuliGroupChatUri:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliGroupChatUri allocWithZone:a3];
  [(CTLazuliGroupChatUri *)v4 setDestination:self->_destination];
  [(CTLazuliGroupChatUri *)v4 setFocus:self->_focus];
  [(CTLazuliGroupChatUri *)v4 setConversationID:self->_conversationID];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_destination forKey:@"kDestinationKey"];
  [v4 encodeObject:self->_focus forKey:@"kFocusKey"];
  [v4 encodeObject:self->_conversationID forKey:@"kConversationIDKey"];
}

- (CTLazuliGroupChatUri)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliGroupChatUri;
  v5 = [(CTLazuliGroupChatUri *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDestinationKey"];
    destination = v5->_destination;
    v5->_destination = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFocusKey"];
    focus = v5->_focus;
    v5->_focus = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kConversationIDKey"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v10;
  }
  return v5;
}

- (CTLazuliGroupChatUri)initWithReflection:(const void *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CTLazuliGroupChatUri;
  id v4 = [(CTLazuliGroupChatUri *)&v18 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    destination = v4->_destination;
    v4->_destination = (NSString *)v6;

    if (*((char *)a3 + 47) >= 0) {
      uint64_t v8 = (char *)a3 + 24;
    }
    else {
      uint64_t v8 = (char *)*((void *)a3 + 3);
    }
    uint64_t v9 = [NSString stringWithUTF8String:v8];
    focus = v4->_focus;
    v4->_focus = (NSString *)v9;

    objc_super v13 = (char *)*((void *)a3 + 6);
    v12 = (char *)a3 + 48;
    char v11 = v13;
    if (v12[23] >= 0) {
      v14 = v12;
    }
    else {
      v14 = v11;
    }
    uint64_t v15 = [NSString stringWithUTF8String:v14];
    conversationID = v4->_conversationID;
    v4->_conversationID = (NSString *)v15;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSString)focus
{
  return self->_focus;
}

- (void)setFocus:(id)a3
{
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_focus, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end