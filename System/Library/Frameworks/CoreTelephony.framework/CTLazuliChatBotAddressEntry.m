@interface CTLazuliChatBotAddressEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotAddressEntry:(id)a3;
- (CTLazuliChatBotAddressEntry)initWithCoder:(id)a3;
- (CTLazuliChatBotAddressEntry)initWithReflection:(const void *)a3;
- (NSString)address;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CTLazuliChatBotAddressEntry

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotAddressEntry *)self address];
  [v3 appendFormat:@", address = %@", v4];

  v5 = [(CTLazuliChatBotAddressEntry *)self label];
  [v3 appendFormat:@", label = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotAddressEntry:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotAddressEntry *)self address];
  v6 = [v4 address];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliChatBotAddressEntry *)self label];
    v8 = [v4 label];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotAddressEntry *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotAddressEntry *)self isEqualToCTLazuliChatBotAddressEntry:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotAddressEntry allocWithZone:a3];
  [(CTLazuliChatBotAddressEntry *)v4 setAddress:self->_address];
  [(CTLazuliChatBotAddressEntry *)v4 setLabel:self->_label];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_address forKey:@"kAddressKey"];
  [v4 encodeObject:self->_label forKey:@"kLabelKey"];
}

- (CTLazuliChatBotAddressEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotAddressEntry;
  v5 = [(CTLazuliChatBotAddressEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAddressKey"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLabelKey"];
    label = v5->_label;
    v5->_label = (NSString *)v8;
  }
  return v5;
}

- (CTLazuliChatBotAddressEntry)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotAddressEntry;
  id v4 = [(CTLazuliChatBotAddressEntry *)&v15 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    address = v4->_address;
    v4->_address = (NSString *)v6;

    v10 = (char *)*((void *)a3 + 3);
    char v9 = (char *)a3 + 24;
    uint64_t v8 = v10;
    if (v9[23] >= 0) {
      objc_super v11 = v9;
    }
    else {
      objc_super v11 = v8;
    }
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    label = v4->_label;
    v4->_label = (NSString *)v12;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end