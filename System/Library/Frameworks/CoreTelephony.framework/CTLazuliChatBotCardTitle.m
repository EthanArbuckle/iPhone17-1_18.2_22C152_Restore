@interface CTLazuliChatBotCardTitle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotCardTitle:(id)a3;
- (CTLazuliChatBotCardTitle)initWithCoder:(id)a3;
- (CTLazuliChatBotCardTitle)initWithReflection:(const void *)a3;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CTLazuliChatBotCardTitle

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotCardTitle *)self text];
  [v3 appendFormat:@", text = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardTitle:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotCardTitle *)self text];
  v6 = [v4 text];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotCardTitle *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotCardTitle *)self isEqualToCTLazuliChatBotCardTitle:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotCardTitle allocWithZone:a3];
  [(CTLazuliChatBotCardTitle *)v4 setText:self->_text];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotCardTitle)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotCardTitle;
  v5 = [(CTLazuliChatBotCardTitle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTextKey"];
    text = v5->_text;
    v5->_text = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliChatBotCardTitle)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotCardTitle;
  id v4 = [(CTLazuliChatBotCardTitle *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    text = v4->_text;
    v4->_text = (NSString *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end