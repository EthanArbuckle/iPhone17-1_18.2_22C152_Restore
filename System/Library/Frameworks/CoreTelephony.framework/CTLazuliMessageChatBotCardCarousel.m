@interface CTLazuliMessageChatBotCardCarousel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageChatBotCardCarousel:(id)a3;
- (CTLazuliChatBotSuggestedChipList)chipList;
- (CTLazuliMessageChatBotCardCarousel)initWithCoder:(id)a3;
- (CTLazuliMessageChatBotCardCarousel)initWithReflection:(const void *)a3;
- (CTLazuliMessageChatBotCardCarouselLayout)layout;
- (NSArray)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChipList:(id)a3;
- (void)setContent:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation CTLazuliMessageChatBotCardCarousel

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageChatBotCardCarousel *)self layout];
  [v3 appendFormat:@", layout = %@", v4];

  v5 = [(CTLazuliMessageChatBotCardCarousel *)self content];
  [v3 appendFormat:@", content = %@", v5];

  v6 = [(CTLazuliMessageChatBotCardCarousel *)self chipList];
  [v3 appendFormat:@", chipList = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCardCarousel:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliMessageChatBotCardCarousel *)self layout];
  v7 = [v5 layout];
  if ([v6 isEqualToCTLazuliMessageChatBotCardCarouselLayout:v7])
  {
    v8 = [(CTLazuliMessageChatBotCardCarousel *)self content];
    v9 = [v5 content];
    if (![v8 isEqualToArray:v9])
    {
      char v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = [(CTLazuliMessageChatBotCardCarousel *)self chipList];
    if (v10 || ([v5 chipList], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = [(CTLazuliMessageChatBotCardCarousel *)self chipList];
      v12 = [v5 chipList];
      char v13 = [v11 isEqualToCTLazuliChatBotSuggestedChipList:v12];

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      char v13 = 1;
    }

    goto LABEL_11;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliMessageChatBotCardCarousel *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageChatBotCardCarousel *)self isEqualToCTLazuliMessageChatBotCardCarousel:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageChatBotCardCarousel allocWithZone:a3];
  [(CTLazuliMessageChatBotCardCarousel *)v4 setLayout:self->_layout];
  [(CTLazuliMessageChatBotCardCarousel *)v4 setContent:self->_content];
  [(CTLazuliMessageChatBotCardCarousel *)v4 setChipList:self->_chipList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_layout forKey:@"kLayoutKey"];
  [v4 encodeObject:self->_content forKey:@"kContentKey"];
  [v4 encodeObject:self->_chipList forKey:@"kChipListKey"];
}

- (CTLazuliMessageChatBotCardCarousel)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliMessageChatBotCardCarousel;
  id v5 = [(CTLazuliMessageChatBotCardCarousel *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLayoutKey"];
    layout = v5->_layout;
    v5->_layout = (CTLazuliMessageChatBotCardCarouselLayout *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kContentKey"];
    content = v5->_content;
    v5->_content = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipListKey"];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v13;
  }
  return v5;
}

- (CTLazuliMessageChatBotCardCarousel)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageChatBotCardCarousel;
  id v4 = [(CTLazuliMessageChatBotCardCarousel *)&v15 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliMessageChatBotCardCarouselLayout alloc] initWithReflection:a3];
  layout = v4->_layout;
  v4->_layout = v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = *((void *)a3 + 7);
  for (uint64_t i = *((void *)a3 + 8); v8 != i; v8 += 280)
  {
    v10 = [[CTLazuliChatBotCardContent alloc] initWithReflection:v8];
    [v7 addObject:v10];
  }
  objc_storeStrong((id *)&v4->_content, v7);
  if (!*((unsigned char *)a3 + 104))
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
    goto LABEL_8;
  }
  uint64_t v11 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((unsigned char *)a3 + 104))
  {
    uint64_t v12 = [(CTLazuliChatBotSuggestedChipList *)v11 initWithReflection:(char *)a3 + 80];
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v12;
LABEL_8:

    return v4;
  }
  result = (CTLazuliMessageChatBotCardCarousel *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessageChatBotCardCarouselLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (NSArray)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (CTLazuliChatBotSuggestedChipList)chipList
{
  return self->_chipList;
}

- (void)setChipList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipList, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_layout, 0);
}

@end