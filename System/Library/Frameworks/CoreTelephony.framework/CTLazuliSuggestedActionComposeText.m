@interface CTLazuliSuggestedActionComposeText
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionComposeText:(id)a3;
- (CTLazuliSuggestedActionComposeText)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionComposeText)initWithReflection:(const void *)a3;
- (NSString)phoneNumber;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CTLazuliSuggestedActionComposeText

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionComposeText *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber = %@", v4];

  v5 = [(CTLazuliSuggestedActionComposeText *)self text];
  [v3 appendFormat:@", text = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionComposeText:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliSuggestedActionComposeText *)self phoneNumber];
  v6 = [v4 phoneNumber];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliSuggestedActionComposeText *)self text];
    v8 = [v4 text];
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
  id v4 = (CTLazuliSuggestedActionComposeText *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionComposeText *)self isEqualToCTLazuliSuggestedActionComposeText:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliSuggestedActionComposeText allocWithZone:a3];
  [(CTLazuliSuggestedActionComposeText *)v4 setPhoneNumber:self->_phoneNumber];
  [(CTLazuliSuggestedActionComposeText *)v4 setText:self->_text];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_phoneNumber forKey:@"kPhoneNumberKey"];
  [v4 encodeObject:self->_text forKey:@"kTextKey"];
}

- (CTLazuliSuggestedActionComposeText)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliSuggestedActionComposeText;
  v5 = [(CTLazuliSuggestedActionComposeText *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPhoneNumberKey"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTextKey"];
    text = v5->_text;
    v5->_text = (NSString *)v8;
  }
  return v5;
}

- (CTLazuliSuggestedActionComposeText)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliSuggestedActionComposeText;
  id v4 = [(CTLazuliSuggestedActionComposeText *)&v15 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    phoneNumber = v4->_phoneNumber;
    v4->_phoneNumber = (NSString *)v6;

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
    text = v4->_text;
    v4->_text = (NSString *)v12;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end