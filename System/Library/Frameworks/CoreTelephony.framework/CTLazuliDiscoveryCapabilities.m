@interface CTLazuliDiscoveryCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliDiscoveryCapabilities:(id)a3;
- (CTLazuliDiscoveryCapabilities)initWithCoder:(id)a3;
- (CTLazuliDiscoveryCapabilities)initWithReflection:(const DiscoveryCapabilities *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliDiscoveryCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliDiscoveryCapabilities *)self type];
  int64_t v6 = [(CTLazuliDiscoveryCapabilities *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliDiscoveryCapabilitiesType(&v6)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliDiscoveryCapabilities:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliDiscoveryCapabilities *)self type];
  LOBYTE(v5) = v5 == [v4 type];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliDiscoveryCapabilities *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliDiscoveryCapabilities *)self isEqualToCTLazuliDiscoveryCapabilities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliDiscoveryCapabilities allocWithZone:a3];
  [(CTLazuliDiscoveryCapabilities *)v4 setType:self->_type];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];
}

- (CTLazuliDiscoveryCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliDiscoveryCapabilities;
  id v5 = [(CTLazuliDiscoveryCapabilities *)&v8 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];
  }
  return v5;
}

- (CTLazuliDiscoveryCapabilities)initWithReflection:(const DiscoveryCapabilities *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliDiscoveryCapabilities;
  id v4 = [(CTLazuliDiscoveryCapabilities *)&v6 init];
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