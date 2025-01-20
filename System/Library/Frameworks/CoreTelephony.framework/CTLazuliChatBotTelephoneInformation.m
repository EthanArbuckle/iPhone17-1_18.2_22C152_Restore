@interface CTLazuliChatBotTelephoneInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotTelephoneInformation:(id)a3;
- (CTLazuliChatBotTelephoneInformation)initWithCoder:(id)a3;
- (CTLazuliChatBotTelephoneInformation)initWithReflection:(const void *)a3;
- (CTLazuliChatBotTelephoneNumber)telNumber;
- (NSString)label;
- (NSString)telephoneType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTelNumber:(id)a3;
- (void)setTelephoneType:(id)a3;
@end

@implementation CTLazuliChatBotTelephoneInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotTelephoneInformation *)self label];
  [v3 appendFormat:@", label = %@", v4];

  v5 = [(CTLazuliChatBotTelephoneInformation *)self telNumber];
  [v3 appendFormat:@", telNumber = %@", v5];

  v6 = [(CTLazuliChatBotTelephoneInformation *)self telephoneType];
  [v3 appendFormat:@", telephoneType = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotTelephoneInformation:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotTelephoneInformation *)self label];
  v6 = [v4 label];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliChatBotTelephoneInformation *)self telNumber];
    v8 = [v4 telNumber];
    if ([v7 isEqualToCTLazuliChatBotTelephoneNumber:v8])
    {
      v9 = [(CTLazuliChatBotTelephoneInformation *)self telephoneType];
      v10 = [v4 telephoneType];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotTelephoneInformation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotTelephoneInformation *)self isEqualToCTLazuliChatBotTelephoneInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotTelephoneInformation allocWithZone:a3];
  [(CTLazuliChatBotTelephoneInformation *)v4 setLabel:self->_label];
  [(CTLazuliChatBotTelephoneInformation *)v4 setTelNumber:self->_telNumber];
  [(CTLazuliChatBotTelephoneInformation *)v4 setTelephoneType:self->_telephoneType];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_label forKey:@"kLabelKey"];
  [v4 encodeObject:self->_telNumber forKey:@"kTelNumberKey"];
  [v4 encodeObject:self->_telephoneType forKey:@"kTelephoneTypeKey"];
}

- (CTLazuliChatBotTelephoneInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotTelephoneInformation;
  v5 = [(CTLazuliChatBotTelephoneInformation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLabelKey"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTelNumberKey"];
    telNumber = v5->_telNumber;
    v5->_telNumber = (CTLazuliChatBotTelephoneNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTelephoneTypeKey"];
    telephoneType = v5->_telephoneType;
    v5->_telephoneType = (NSString *)v10;
  }
  return v5;
}

- (CTLazuliChatBotTelephoneInformation)initWithReflection:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliChatBotTelephoneInformation;
  id v4 = [(CTLazuliChatBotTelephoneInformation *)&v17 init];
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

    uint64_t v8 = [[CTLazuliChatBotTelephoneNumber alloc] initWithReflection:(char *)a3 + 24];
    telNumber = v4->_telNumber;
    v4->_telNumber = v8;

    v12 = (char *)*((void *)a3 + 6);
    char v11 = (char *)a3 + 48;
    uint64_t v10 = v12;
    if (v11[23] >= 0) {
      objc_super v13 = v11;
    }
    else {
      objc_super v13 = v10;
    }
    uint64_t v14 = [NSString stringWithUTF8String:v13];
    telephoneType = v4->_telephoneType;
    v4->_telephoneType = (NSString *)v14;
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

- (CTLazuliChatBotTelephoneNumber)telNumber
{
  return self->_telNumber;
}

- (void)setTelNumber:(id)a3
{
}

- (NSString)telephoneType
{
  return self->_telephoneType;
}

- (void)setTelephoneType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephoneType, 0);
  objc_storeStrong((id *)&self->_telNumber, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end