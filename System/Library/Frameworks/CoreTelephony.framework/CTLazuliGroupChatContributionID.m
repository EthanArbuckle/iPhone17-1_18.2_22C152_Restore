@interface CTLazuliGroupChatContributionID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatContributionID:(id)a3;
- (CTLazuliGroupChatContributionID)initWithCoder:(id)a3;
- (CTLazuliGroupChatContributionID)initWithReflection:(const void *)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CTLazuliGroupChatContributionID

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliGroupChatContributionID *)self identifier];
  [v3 appendFormat:@", identifier = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatContributionID:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliGroupChatContributionID *)self identifier];
  v6 = [v4 identifier];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliGroupChatContributionID *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatContributionID *)self isEqualToCTLazuliGroupChatContributionID:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliGroupChatContributionID allocWithZone:a3];
  [(CTLazuliGroupChatContributionID *)v4 setIdentifier:self->_identifier];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliGroupChatContributionID)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatContributionID;
  v5 = [(CTLazuliGroupChatContributionID *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliGroupChatContributionID)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatContributionID;
  id v4 = [(CTLazuliGroupChatContributionID *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end