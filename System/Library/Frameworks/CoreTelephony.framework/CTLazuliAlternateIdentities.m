@interface CTLazuliAlternateIdentities
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliAlternateIdentities:(id)a3;
- (CTLazuliAlternateIdentities)initWithCoder:(id)a3;
- (CTLazuliAlternateIdentities)initWithReflection:(const void *)a3;
- (NSArray)identityList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityList:(id)a3;
@end

@implementation CTLazuliAlternateIdentities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliAlternateIdentities *)self identityList];
  [v3 appendFormat:@", identityList = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliAlternateIdentities:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliAlternateIdentities *)self identityList];
  v6 = [v4 identityList];
  char v7 = [v5 isEqualToArray:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliAlternateIdentities *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliAlternateIdentities *)self isEqualToCTLazuliAlternateIdentities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliAlternateIdentities allocWithZone:a3];
  [(CTLazuliAlternateIdentities *)v4 setIdentityList:self->_identityList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliAlternateIdentities)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliAlternateIdentities;
  v5 = [(CTLazuliAlternateIdentities *)&v12 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kIdentityListKey"];
    identityList = v5->_identityList;
    v5->_identityList = (NSArray *)v9;
  }
  return v5;
}

- (CTLazuliAlternateIdentities)initWithReflection:(const void *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliAlternateIdentities;
  id v4 = [(CTLazuliAlternateIdentities *)&v13 init];
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v6 = *(uint64_t **)a3;
    uint64_t v7 = (uint64_t *)*((void *)a3 + 1);
    if (*(uint64_t **)a3 != v7)
    {
      do
      {
        id v8 = [NSString alloc];
        uint64_t v9 = v6;
        if (*((char *)v6 + 23) < 0) {
          uint64_t v9 = (uint64_t *)*v6;
        }
        v10 = (void *)[v8 initWithUTF8String:v9];
        [(NSArray *)v5 addObject:v10];

        v6 += 3;
      }
      while (v6 != v7);
    }
    identityList = v4->_identityList;
    v4->_identityList = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)identityList
{
  return self->_identityList;
}

- (void)setIdentityList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end