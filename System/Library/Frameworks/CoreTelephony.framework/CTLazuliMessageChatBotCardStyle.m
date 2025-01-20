@interface CTLazuliMessageChatBotCardStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageChatBotCardStyle:(id)a3;
- (CTLazuliMessageChatBotCardStyle)initWithCoder:(id)a3;
- (CTLazuliMessageChatBotCardStyle)initWithReflection:(const void *)a3;
- (NSURL)uri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation CTLazuliMessageChatBotCardStyle

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageChatBotCardStyle *)self uri];
  [v3 appendFormat:@", uri = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCardStyle:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliMessageChatBotCardStyle *)self uri];
  v6 = [v4 uri];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageChatBotCardStyle *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageChatBotCardStyle *)self isEqualToCTLazuliMessageChatBotCardStyle:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageChatBotCardStyle allocWithZone:a3];
  [(CTLazuliMessageChatBotCardStyle *)v4 setUri:self->_uri];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliMessageChatBotCardStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageChatBotCardStyle;
  v5 = [(CTLazuliMessageChatBotCardStyle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUriKey"];
    uri = v5->_uri;
    v5->_uri = (NSURL *)v6;
  }
  return v5;
}

- (CTLazuliMessageChatBotCardStyle)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageChatBotCardStyle;
  id v4 = [(CTLazuliMessageChatBotCardStyle *)&v15 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = NSString;
    int v7 = *((char *)a3 + 23);
    v8 = *(const void **)a3;
    uint64_t v9 = [NSString defaultCStringEncoding];
    if (v7 >= 0) {
      v10 = a3;
    }
    else {
      v10 = v8;
    }
    v11 = [v6 stringWithCString:v10 encoding:v9];
    uint64_t v12 = [v5 URLWithString:v11];
    uri = v4->_uri;
    v4->_uri = (NSURL *)v12;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (void).cxx_destruct
{
}

@end