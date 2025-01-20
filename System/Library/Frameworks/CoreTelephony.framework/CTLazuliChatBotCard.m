@interface CTLazuliChatBotCard
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotCard:(id)a3;
- (CTLazuliChatBotCard)initWithCoder:(id)a3;
- (CTLazuliChatBotCard)initWithReflection:(const void *)a3;
- (CTLazuliChatBotCardContent)content;
- (CTLazuliChatBotCardLayout)layout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation CTLazuliChatBotCard

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotCard *)self layout];
  [v3 appendFormat:@", layout = %@", v4];

  v5 = [(CTLazuliChatBotCard *)self content];
  [v3 appendFormat:@", content = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCard:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotCard *)self layout];
  v6 = [v4 layout];
  if ([v5 isEqualToCTLazuliChatBotCardLayout:v6])
  {
    v7 = [(CTLazuliChatBotCard *)self content];
    v8 = [v4 content];
    char v9 = [v7 isEqualToCTLazuliChatBotCardContent:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotCard *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotCard *)self isEqualToCTLazuliChatBotCard:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotCard allocWithZone:a3];
  [(CTLazuliChatBotCard *)v4 setLayout:self->_layout];
  [(CTLazuliChatBotCard *)v4 setContent:self->_content];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_layout forKey:@"kLayoutKey"];
  [v4 encodeObject:self->_content forKey:@"kContentKey"];
}

- (CTLazuliChatBotCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotCard;
  v5 = [(CTLazuliChatBotCard *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLayoutKey"];
    layout = v5->_layout;
    v5->_layout = (CTLazuliChatBotCardLayout *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentKey"];
    content = v5->_content;
    v5->_content = (CTLazuliChatBotCardContent *)v8;
  }
  return v5;
}

- (CTLazuliChatBotCard)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotCard;
  id v4 = [(CTLazuliChatBotCard *)&v10 init];
  if (v4)
  {
    v5 = [[CTLazuliChatBotCardLayout alloc] initWithReflection:a3];
    layout = v4->_layout;
    v4->_layout = v5;

    v7 = [[CTLazuliChatBotCardContent alloc] initWithReflection:(char *)a3 + 48];
    content = v4->_content;
    v4->_content = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCardLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (CTLazuliChatBotCardContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_layout, 0);
}

@end