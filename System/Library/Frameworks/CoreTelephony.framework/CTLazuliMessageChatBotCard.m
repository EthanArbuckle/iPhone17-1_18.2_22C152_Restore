@interface CTLazuliMessageChatBotCard
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageChatBotCard:(id)a3;
- (CTLazuliChatBotCard)card;
- (CTLazuliChatBotSuggestedChipList)chipList;
- (CTLazuliMessageChatBotCard)initWithCoder:(id)a3;
- (CTLazuliMessageChatBotCard)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCard:(id)a3;
- (void)setChipList:(id)a3;
@end

@implementation CTLazuliMessageChatBotCard

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageChatBotCard *)self card];
  [v3 appendFormat:@", card = %@", v4];

  v5 = [(CTLazuliMessageChatBotCard *)self chipList];
  [v3 appendFormat:@", chipList = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCard:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliMessageChatBotCard *)self card];
  v7 = [v5 card];
  if ([v6 isEqualToCTLazuliChatBotCard:v7])
  {
    v8 = [(CTLazuliMessageChatBotCard *)self chipList];
    if (v8 || ([v5 chipList], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(CTLazuliMessageChatBotCard *)self chipList];
      v10 = [v5 chipList];
      char v11 = [v9 isEqualToCTLazuliChatBotSuggestedChipList:v10];

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v11 = 1;
    }

    goto LABEL_9;
  }
  char v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliMessageChatBotCard *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageChatBotCard *)self isEqualToCTLazuliMessageChatBotCard:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageChatBotCard allocWithZone:a3];
  [(CTLazuliMessageChatBotCard *)v4 setCard:self->_card];
  [(CTLazuliMessageChatBotCard *)v4 setChipList:self->_chipList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_card forKey:@"kCardKey"];
  [v4 encodeObject:self->_chipList forKey:@"kChipListKey"];
}

- (CTLazuliMessageChatBotCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliMessageChatBotCard;
  id v5 = [(CTLazuliMessageChatBotCard *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCardKey"];
    card = v5->_card;
    v5->_card = (CTLazuliChatBotCard *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipListKey"];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;
  }
  return v5;
}

- (CTLazuliMessageChatBotCard)initWithReflection:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliMessageChatBotCard;
  id v4 = [(CTLazuliMessageChatBotCard *)&v11 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliChatBotCard alloc] initWithReflection:a3];
  card = v4->_card;
  v4->_card = v5;

  if (!*((unsigned char *)a3 + 352))
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
    goto LABEL_6;
  }
  v7 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((unsigned char *)a3 + 352))
  {
    uint64_t v8 = [(CTLazuliChatBotSuggestedChipList *)v7 initWithReflection:(char *)a3 + 328];
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;
LABEL_6:

    return v4;
  }
  result = (CTLazuliMessageChatBotCard *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
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

  objc_storeStrong((id *)&self->_card, 0);
}

@end