@interface CTLazuliMessageChatBotTitleStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageChatBotTitleStyle:(id)a3;
- (CTLazuliMessageChatBotFontStyle)style;
- (CTLazuliMessageChatBotTitleStyle)initWithCoder:(id)a3;
- (CTLazuliMessageChatBotTitleStyle)initWithReflection:(const MessageChatBotTitleStyle *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation CTLazuliMessageChatBotTitleStyle

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageChatBotTitleStyle *)self style];
  [v3 appendFormat:@", style = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotTitleStyle:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliMessageChatBotTitleStyle *)self style];
  v6 = [v4 style];
  char v7 = [v5 isEqualToCTLazuliMessageChatBotFontStyle:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageChatBotTitleStyle *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageChatBotTitleStyle *)self isEqualToCTLazuliMessageChatBotTitleStyle:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageChatBotTitleStyle allocWithZone:a3];
  [(CTLazuliMessageChatBotTitleStyle *)v4 setStyle:self->_style];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliMessageChatBotTitleStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageChatBotTitleStyle;
  v5 = [(CTLazuliMessageChatBotTitleStyle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStyleKey"];
    style = v5->_style;
    v5->_style = (CTLazuliMessageChatBotFontStyle *)v6;
  }
  return v5;
}

- (CTLazuliMessageChatBotTitleStyle)initWithReflection:(const MessageChatBotTitleStyle *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageChatBotTitleStyle;
  id v4 = [(CTLazuliMessageChatBotTitleStyle *)&v8 init];
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