@interface CTLazuliChatBotTelephoneNumber
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotTelephoneNumber:(id)a3;
- (CTLazuliChatBotTelephoneNumber)initWithCoder:(id)a3;
- (CTLazuliChatBotTelephoneNumber)initWithReflection:(const void *)a3;
- (NSString)number;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setNumber:(id)a3;
@end

@implementation CTLazuliChatBotTelephoneNumber

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotTelephoneNumber *)self number];
  [v3 appendFormat:@", number = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotTelephoneNumber:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotTelephoneNumber *)self number];
  v6 = [v4 number];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotTelephoneNumber *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotTelephoneNumber *)self isEqualToCTLazuliChatBotTelephoneNumber:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotTelephoneNumber allocWithZone:a3];
  [(CTLazuliChatBotTelephoneNumber *)v4 setNumber:self->_number];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotTelephoneNumber)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotTelephoneNumber;
  v5 = [(CTLazuliChatBotTelephoneNumber *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNumberKey"];
    number = v5->_number;
    v5->_number = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliChatBotTelephoneNumber)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotTelephoneNumber;
  id v4 = [(CTLazuliChatBotTelephoneNumber *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    number = v4->_number;
    v4->_number = (NSString *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end