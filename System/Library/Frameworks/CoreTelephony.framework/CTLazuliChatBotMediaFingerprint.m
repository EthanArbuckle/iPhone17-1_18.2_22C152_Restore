@interface CTLazuliChatBotMediaFingerprint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotMediaFingerprint:(id)a3;
- (CTLazuliChatBotMediaFingerprint)initWithCoder:(id)a3;
- (CTLazuliChatBotMediaFingerprint)initWithReflection:(const void *)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation CTLazuliChatBotMediaFingerprint

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotMediaFingerprint *)self data];
  [v3 appendFormat:@", data = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMediaFingerprint:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotMediaFingerprint *)self data];
  v6 = [v4 data];
  char v7 = [v5 isEqualToData:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotMediaFingerprint *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotMediaFingerprint *)self isEqualToCTLazuliChatBotMediaFingerprint:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotMediaFingerprint allocWithZone:a3];
  [(CTLazuliChatBotMediaFingerprint *)v4 setData:self->_data];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotMediaFingerprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMediaFingerprint;
  v5 = [(CTLazuliChatBotMediaFingerprint *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDataKey"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (CTLazuliChatBotMediaFingerprint)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliChatBotMediaFingerprint;
  id v4 = [(CTLazuliChatBotMediaFingerprint *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)a3 length:*((void *)a3 + 1) - *(void *)a3];
    data = v4->_data;
    v4->_data = (NSData *)v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end