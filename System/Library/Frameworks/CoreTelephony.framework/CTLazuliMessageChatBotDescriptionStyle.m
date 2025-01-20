@interface CTLazuliMessageChatBotDescriptionStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageChatBotDescriptionStyle:(id)a3;
- (CTLazuliMessageChatBotDescriptionStyle)initWithCoder:(id)a3;
- (CTLazuliMessageChatBotDescriptionStyle)initWithReflection:(const MessageChatBotDescriptionStyle *)a3;
- (CTLazuliMessageChatBotFontStyle)style;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation CTLazuliMessageChatBotDescriptionStyle

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageChatBotDescriptionStyle *)self style];
  [v3 appendFormat:@", style = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotDescriptionStyle:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliMessageChatBotDescriptionStyle *)self style];
  v6 = [v4 style];
  char v7 = [v5 isEqualToCTLazuliMessageChatBotFontStyle:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageChatBotDescriptionStyle *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageChatBotDescriptionStyle *)self isEqualToCTLazuliMessageChatBotDescriptionStyle:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageChatBotDescriptionStyle allocWithZone:a3];
  [(CTLazuliMessageChatBotDescriptionStyle *)v4 setStyle:self->_style];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliMessageChatBotDescriptionStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageChatBotDescriptionStyle;
  v5 = [(CTLazuliMessageChatBotDescriptionStyle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStyleKey"];
    style = v5->_style;
    v5->_style = (CTLazuliMessageChatBotFontStyle *)v6;
  }
  return v5;
}

- (CTLazuliMessageChatBotDescriptionStyle)initWithReflection:(const MessageChatBotDescriptionStyle *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageChatBotDescriptionStyle;
  id v4 = [(CTLazuliMessageChatBotDescriptionStyle *)&v8 init];
  if (v4)
  {
    v5 = [[CTLazuliMessageChatBotFontStyle alloc] initWithReflection:a3];
    style = v4->_style;
    v4->_style = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessageChatBotFontStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end