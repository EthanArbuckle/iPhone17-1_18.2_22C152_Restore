@interface CTLazuliSuggestedActionComposeVideoRecording
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionComposeVideoRecording:(id)a3;
- (CTLazuliSuggestedActionComposeVideoRecording)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionComposeVideoRecording)initWithReflection:(const void *)a3;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation CTLazuliSuggestedActionComposeVideoRecording

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionComposeVideoRecording *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionComposeVideoRecording:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliSuggestedActionComposeVideoRecording *)self phoneNumber];
  v6 = [v4 phoneNumber];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliSuggestedActionComposeVideoRecording *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionComposeVideoRecording *)self isEqualToCTLazuliSuggestedActionComposeVideoRecording:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliSuggestedActionComposeVideoRecording allocWithZone:a3];
  [(CTLazuliSuggestedActionComposeVideoRecording *)v4 setPhoneNumber:self->_phoneNumber];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliSuggestedActionComposeVideoRecording)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionComposeVideoRecording;
  v5 = [(CTLazuliSuggestedActionComposeVideoRecording *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPhoneNumberKey"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliSuggestedActionComposeVideoRecording)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionComposeVideoRecording;
  id v4 = [(CTLazuliSuggestedActionComposeVideoRecording *)&v9 init];
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

- (void).cxx_destruct
{
}

@end