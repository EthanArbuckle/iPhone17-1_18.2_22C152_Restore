@interface CTLazuliFetchRemoteCapabilitiesOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliFetchRemoteCapabilitiesOptions:(id)a3;
- (CTLazuliFetchRemoteCapabilitiesOptions)initWithCoder:(id)a3;
- (CTLazuliFetchRemoteCapabilitiesOptions)initWithReflection:(const FetchRemoteCapabilitiesOptions *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliFetchRemoteCapabilitiesOptions

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliFetchRemoteCapabilitiesOptions *)self type];
  int64_t v6 = [(CTLazuliFetchRemoteCapabilitiesOptions *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliCapabilitiesDiscoveryOptionsType(&v6)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliFetchRemoteCapabilitiesOptions:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliFetchRemoteCapabilitiesOptions *)self type];
  LOBYTE(v5) = v5 == [v4 type];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliFetchRemoteCapabilitiesOptions *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliFetchRemoteCapabilitiesOptions *)self isEqualToCTLazuliFetchRemoteCapabilitiesOptions:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliFetchRemoteCapabilitiesOptions allocWithZone:a3];
  [(CTLazuliFetchRemoteCapabilitiesOptions *)v4 setType:self->_type];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];
}

- (CTLazuliFetchRemoteCapabilitiesOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliFetchRemoteCapabilitiesOptions;
  id v5 = [(CTLazuliFetchRemoteCapabilitiesOptions *)&v8 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];
  }
  return v5;
}

- (CTLazuliFetchRemoteCapabilitiesOptions)initWithReflection:(const FetchRemoteCapabilitiesOptions *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliFetchRemoteCapabilitiesOptions;
  id v4 = [(CTLazuliFetchRemoteCapabilitiesOptions *)&v6 init];
  if (v4) {
    v4->_type = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end