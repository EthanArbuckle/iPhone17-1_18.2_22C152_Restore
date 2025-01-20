@interface CTLazuliSuggestedActionDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionDevice:(id)a3;
- (CTLazuliSuggestedActionDevice)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionDevice)initWithReflection:(const SuggestedActionDevice *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliSuggestedActionDevice

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliSuggestedActionDevice *)self type];
  int64_t v6 = [(CTLazuliSuggestedActionDevice *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliDeviceActionType(&v6)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionDevice:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliSuggestedActionDevice *)self type];
  LOBYTE(v5) = v5 == [v4 type];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliSuggestedActionDevice *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionDevice *)self isEqualToCTLazuliSuggestedActionDevice:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliSuggestedActionDevice allocWithZone:a3];
  [(CTLazuliSuggestedActionDevice *)v4 setType:self->_type];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];
}

- (CTLazuliSuggestedActionDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliSuggestedActionDevice;
  id v5 = [(CTLazuliSuggestedActionDevice *)&v8 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];
  }
  return v5;
}

- (CTLazuliSuggestedActionDevice)initWithReflection:(const SuggestedActionDevice *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliSuggestedActionDevice;
  id v4 = [(CTLazuliSuggestedActionDevice *)&v6 init];
  if (v4) {
    v4->_type = encode_CTLazuliChatBotMediaLabelType(a3);
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