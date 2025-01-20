@interface CTLazuliChatBotWebResources
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotWebResources:(id)a3;
- (CTLazuliChatBotWebResources)initWithCoder:(id)a3;
- (CTLazuliChatBotWebResources)initWithReflection:(const void *)a3;
- (NSArray)list;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setList:(id)a3;
@end

@implementation CTLazuliChatBotWebResources

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotWebResources *)self list];
  [v3 appendFormat:@", list = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotWebResources:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotWebResources *)self list];
  v6 = [v4 list];
  char v7 = [v5 isEqualToArray:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotWebResources *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotWebResources *)self isEqualToCTLazuliChatBotWebResources:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotWebResources allocWithZone:a3];
  [(CTLazuliChatBotWebResources *)v4 setList:self->_list];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotWebResources)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotWebResources;
  v5 = [(CTLazuliChatBotWebResources *)&v12 init];
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

- (CTLazuliChatBotWebResources)initWithReflection:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotWebResources;
  id v4 = [(CTLazuliChatBotWebResources *)&v11 init];
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = *(void *)a3;
    uint64_t v7 = *((void *)a3 + 1);
    if (*(void *)a3 != v7)
    {
      do
      {
        v8 = [[CTLazuliChatBotWebEntry alloc] initWithReflection:v6];
        [(NSArray *)v5 addObject:v8];

        v6 += 48;
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