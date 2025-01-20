@interface CTLazuliChatBotMediaList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotMediaList:(id)a3;
- (CTLazuliChatBotMediaEntryList)entry;
- (CTLazuliChatBotMediaList)initWithCoder:(id)a3;
- (CTLazuliChatBotMediaList)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEntry:(id)a3;
@end

@implementation CTLazuliChatBotMediaList

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotMediaList *)self entry];
  [v3 appendFormat:@", entry = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMediaList:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotMediaList *)self entry];
  v6 = [v4 entry];
  char v7 = [v5 isEqualToCTLazuliChatBotMediaEntryList:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotMediaList *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotMediaList *)self isEqualToCTLazuliChatBotMediaList:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotMediaList allocWithZone:a3];
  [(CTLazuliChatBotMediaList *)v4 setEntry:self->_entry];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotMediaList)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMediaList;
  v5 = [(CTLazuliChatBotMediaList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kEntryKey"];
    entry = v5->_entry;
    v5->_entry = (CTLazuliChatBotMediaEntryList *)v6;
  }
  return v5;
}

- (CTLazuliChatBotMediaList)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliChatBotMediaList;
  id v4 = [(CTLazuliChatBotMediaList *)&v8 init];
  if (v4)
  {
    v5 = [[CTLazuliChatBotMediaEntryList alloc] initWithReflection:a3];
    entry = v4->_entry;
    v4->_entry = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotMediaEntryList)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end