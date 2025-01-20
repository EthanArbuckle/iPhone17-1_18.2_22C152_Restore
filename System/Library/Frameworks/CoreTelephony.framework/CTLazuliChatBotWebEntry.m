@interface CTLazuliChatBotWebEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotWebEntry:(id)a3;
- (CTLazuliChatBotWebEntry)initWithCoder:(id)a3;
- (CTLazuliChatBotWebEntry)initWithReflection:(const void *)a3;
- (NSString)label;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CTLazuliChatBotWebEntry

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotWebEntry *)self label];
  [v3 appendFormat:@", label = %@", v4];

  v5 = [(CTLazuliChatBotWebEntry *)self url];
  [v3 appendFormat:@", url = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotWebEntry:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotWebEntry *)self label];
  v6 = [v4 label];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliChatBotWebEntry *)self url];
    v8 = [v4 url];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotWebEntry *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotWebEntry *)self isEqualToCTLazuliChatBotWebEntry:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotWebEntry allocWithZone:a3];
  [(CTLazuliChatBotWebEntry *)v4 setLabel:self->_label];
  [(CTLazuliChatBotWebEntry *)v4 setUrl:self->_url];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_label forKey:@"kLabelKey"];
  [v4 encodeObject:self->_url forKey:@"kUrlKey"];
}

- (CTLazuliChatBotWebEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotWebEntry;
  v5 = [(CTLazuliChatBotWebEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLabelKey"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUrlKey"];
    url = v5->_url;
    v5->_url = (NSURL *)v8;
  }
  return v5;
}

- (CTLazuliChatBotWebEntry)initWithReflection:(const void *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CTLazuliChatBotWebEntry;
  id v4 = [(CTLazuliChatBotWebEntry *)&v20 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    label = v4->_label;
    v4->_label = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    char v9 = NSString;
    v12 = (char *)*((void *)a3 + 3);
    v10 = (char *)a3 + 24;
    objc_super v11 = v12;
    int v13 = v10[23];
    uint64_t v14 = [NSString defaultCStringEncoding];
    if (v13 >= 0) {
      v15 = v10;
    }
    else {
      v15 = v11;
    }
    v16 = [v9 stringWithCString:v15 encoding:v14];
    uint64_t v17 = [v8 URLWithString:v16];
    url = v4->_url;
    v4->_url = (NSURL *)v17;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end