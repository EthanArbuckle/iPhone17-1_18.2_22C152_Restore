@interface CTLazuliChatBotMenuL1
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotMenuL1:(id)a3;
- (CTLazuliChatBotMenuL1)initWithCoder:(id)a3;
- (CTLazuliChatBotMenuL1)initWithReflection:(const void *)a3;
- (NSArray)list;
- (NSString)displayText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setList:(id)a3;
@end

@implementation CTLazuliChatBotMenuL1

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotMenuL1 *)self displayText];
  [v3 appendFormat:@", displayText = %@", v4];

  v5 = [(CTLazuliChatBotMenuL1 *)self list];
  [v3 appendFormat:@", list = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMenuL1:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotMenuL1 *)self displayText];
  v6 = [v4 displayText];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliChatBotMenuL1 *)self list];
    v8 = [v4 list];
    char v9 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotMenuL1 *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotMenuL1 *)self isEqualToCTLazuliChatBotMenuL1:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotMenuL1 allocWithZone:a3];
  [(CTLazuliChatBotMenuL1 *)v4 setDisplayText:self->_displayText];
  [(CTLazuliChatBotMenuL1 *)v4 setList:self->_list];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_displayText forKey:@"kDisplayTextKey"];
  [v4 encodeObject:self->_list forKey:@"kListKey"];
}

- (CTLazuliChatBotMenuL1)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotMenuL1;
  v5 = [(CTLazuliChatBotMenuL1 *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDisplayTextKey"];
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kListKey"];
    list = v5->_list;
    v5->_list = (NSArray *)v11;
  }
  return v5;
}

- (CTLazuliChatBotMenuL1)initWithReflection:(const void *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotMenuL1;
  id v4 = [(CTLazuliChatBotMenuL1 *)&v14 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    displayText = v4->_displayText;
    v4->_displayText = (NSString *)v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = *((void *)a3 + 3);
    for (uint64_t i = *((void *)a3 + 4); v9 != i; v9 += 248)
    {
      uint64_t v11 = [[CTLazuliChatBotMenuL1Content alloc] initWithReflection:v9];
      [(NSArray *)v8 addObject:v11];
    }
    list = v4->_list;
    v4->_list = v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
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
  objc_storeStrong((id *)&self->_list, 0);

  objc_storeStrong((id *)&self->_displayText, 0);
}

@end