@interface CTLazuliChatBotMenuL2Content
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotMenuL2Content:(id)a3;
- (CTLazuliChatBotMenuL2Content)initWithCoder:(id)a3;
- (CTLazuliChatBotMenuL2Content)initWithReflection:(const void *)a3;
- (CTLazuliChatBotSuggestedChip)chip;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChip:(id)a3;
@end

@implementation CTLazuliChatBotMenuL2Content

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotMenuL2Content *)self chip];
  [v3 appendFormat:@", chip = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMenuL2Content:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotMenuL2Content *)self chip];
  v6 = [v4 chip];
  char v7 = [v5 isEqualToCTLazuliChatBotSuggestedChip:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotMenuL2Content *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotMenuL2Content *)self isEqualToCTLazuliChatBotMenuL2Content:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotMenuL2Content allocWithZone:a3];
  [(CTLazuliChatBotMenuL2Content *)v4 setChip:self->_chip];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotMenuL2Content)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMenuL2Content;
  v5 = [(CTLazuliChatBotMenuL2Content *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipKey"];
    chip = v5->_chip;
    v5->_chip = (CTLazuliChatBotSuggestedChip *)v6;
  }
  return v5;
}

- (CTLazuliChatBotMenuL2Content)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliChatBotMenuL2Content;
  id v4 = [(CTLazuliChatBotMenuL2Content *)&v8 init];
  if (v4)
  {
    v5 = [[CTLazuliChatBotSuggestedChip alloc] initWithReflection:a3];
    chip = v4->_chip;
    v4->_chip = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotSuggestedChip)chip
{
  return self->_chip;
}

- (void)setChip:(id)a3
{
}

- (void).cxx_destruct
{
}

@end