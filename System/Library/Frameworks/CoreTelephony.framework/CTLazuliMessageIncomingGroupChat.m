@interface CTLazuliMessageIncomingGroupChat
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageIncomingGroupChat:(id)a3;
- (CTLazuliGroupChatInformation)chat;
- (CTLazuliMessageIncomingGroupChat)initWithCoder:(id)a3;
- (CTLazuliMessageIncomingGroupChat)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChat:(id)a3;
@end

@implementation CTLazuliMessageIncomingGroupChat

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageIncomingGroupChat *)self chat];
  [v3 appendFormat:@", chat = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageIncomingGroupChat:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliMessageIncomingGroupChat *)self chat];
  v6 = [v4 chat];
  char v7 = [v5 isEqualToCTLazuliGroupChatInformation:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageIncomingGroupChat *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageIncomingGroupChat *)self isEqualToCTLazuliMessageIncomingGroupChat:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageIncomingGroupChat allocWithZone:a3];
  [(CTLazuliMessageIncomingGroupChat *)v4 setChat:self->_chat];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliMessageIncomingGroupChat)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageIncomingGroupChat;
  v5 = [(CTLazuliMessageIncomingGroupChat *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChatKey"];
    chat = v5->_chat;
    v5->_chat = (CTLazuliGroupChatInformation *)v6;
  }
  return v5;
}

- (CTLazuliMessageIncomingGroupChat)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageIncomingGroupChat;
  id v4 = [(CTLazuliMessageIncomingGroupChat *)&v8 init];
  if (v4)
  {
    v5 = [[CTLazuliGroupChatInformation alloc] initWithReflection:a3];
    chat = v4->_chat;
    v4->_chat = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatInformation)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
}

- (void).cxx_destruct
{
}

@end