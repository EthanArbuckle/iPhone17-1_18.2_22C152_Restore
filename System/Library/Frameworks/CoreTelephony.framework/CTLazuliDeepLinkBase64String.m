@interface CTLazuliDeepLinkBase64String
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliDeepLinkBase64String:(id)a3;
- (CTLazuliDeepLinkBase64String)initWithCoder:(id)a3;
- (CTLazuliDeepLinkBase64String)initWithReflection:(const void *)a3;
- (NSString)base64String;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBase64String:(id)a3;
@end

@implementation CTLazuliDeepLinkBase64String

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliDeepLinkBase64String *)self base64String];
  [v3 appendFormat:@", base64String = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliDeepLinkBase64String:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliDeepLinkBase64String *)self base64String];
  v6 = [v4 base64String];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliDeepLinkBase64String *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliDeepLinkBase64String *)self isEqualToCTLazuliDeepLinkBase64String:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliDeepLinkBase64String allocWithZone:a3];
  [(CTLazuliDeepLinkBase64String *)v4 setBase64String:self->_base64String];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliDeepLinkBase64String)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliDeepLinkBase64String;
  v5 = [(CTLazuliDeepLinkBase64String *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBase64StringKey"];
    base64String = v5->_base64String;
    v5->_base64String = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliDeepLinkBase64String)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliDeepLinkBase64String;
  id v4 = [(CTLazuliDeepLinkBase64String *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    base64String = v4->_base64String;
    v4->_base64String = (NSString *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)base64String
{
  return self->_base64String;
}

- (void)setBase64String:(id)a3
{
}

- (void).cxx_destruct
{
}

@end