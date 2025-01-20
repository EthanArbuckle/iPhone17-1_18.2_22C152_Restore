@interface CTLazuliChatBotSuggestedChipList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotSuggestedChipList:(id)a3;
- (CTLazuliChatBotSuggestedChipList)initWithCoder:(id)a3;
- (CTLazuliChatBotSuggestedChipList)initWithReflection:(const void *)a3;
- (NSArray)list;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setList:(id)a3;
@end

@implementation CTLazuliChatBotSuggestedChipList

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotSuggestedChipList *)self list];
  [v3 appendFormat:@", list = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestedChipList:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliChatBotSuggestedChipList *)self list];
  if (!v6)
  {
    v3 = [v5 list];
    if (!v3)
    {
      char v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [(CTLazuliChatBotSuggestedChipList *)self list];
  v8 = [v5 list];
  char v9 = [v7 isEqualToArray:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotSuggestedChipList *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotSuggestedChipList *)self isEqualToCTLazuliChatBotSuggestedChipList:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotSuggestedChipList allocWithZone:a3];
  [(CTLazuliChatBotSuggestedChipList *)v4 setList:self->_list];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotSuggestedChipList)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotSuggestedChipList;
  id v5 = [(CTLazuliChatBotSuggestedChipList *)&v12 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kListKey"];
    list = v5->_list;
    v5->_list = (NSArray *)v9;
  }
  return v5;
}

- (CTLazuliChatBotSuggestedChipList)initWithReflection:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotSuggestedChipList;
  id v4 = [(CTLazuliChatBotSuggestedChipList *)&v11 init];
  if (v4)
  {
    id v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = *(void *)a3;
    uint64_t v7 = *((void *)a3 + 1);
    if (*(void *)a3 != v7)
    {
      do
      {
        v8 = [[CTLazuliChatBotSuggestedChip alloc] initWithReflection:v6];
        [(NSArray *)v5 addObject:v8];

        v6 += 232;
      }
      while (v6 != v7);
    }
    list = v4->_list;
    v4->_list = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end