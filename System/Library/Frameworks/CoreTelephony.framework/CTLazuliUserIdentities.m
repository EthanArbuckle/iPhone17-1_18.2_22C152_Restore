@interface CTLazuliUserIdentities
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliUserIdentities:(id)a3;
- (CTLazuliUserIdentities)initWithCoder:(id)a3;
- (CTLazuliUserIdentities)initWithReflection:(const void *)a3;
- (NSArray)impus;
- (NSString)impi;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setImpi:(id)a3;
- (void)setImpus:(id)a3;
@end

@implementation CTLazuliUserIdentities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliUserIdentities *)self impi];
  [v3 appendFormat:@", impi = %@", v4];

  v5 = [(CTLazuliUserIdentities *)self impus];
  [v3 appendFormat:@", impus = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliUserIdentities:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliUserIdentities *)self impi];
  v6 = [v4 impi];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliUserIdentities *)self impus];
    v8 = [v4 impus];
    char v9 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliUserIdentities *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliUserIdentities *)self isEqualToCTLazuliUserIdentities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliUserIdentities allocWithZone:a3];
  [(CTLazuliUserIdentities *)v4 setImpi:self->_impi];
  [(CTLazuliUserIdentities *)v4 setImpus:self->_impus];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_impi forKey:@"kImpiKey"];
  [v4 encodeObject:self->_impus forKey:@"kImpusKey"];
}

- (CTLazuliUserIdentities)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliUserIdentities;
  v5 = [(CTLazuliUserIdentities *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kImpiKey"];
    impi = v5->_impi;
    v5->_impi = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kImpusKey"];
    impus = v5->_impus;
    v5->_impus = (NSArray *)v11;
  }
  return v5;
}

- (CTLazuliUserIdentities)initWithReflection:(const void *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliUserIdentities;
  id v4 = [(CTLazuliUserIdentities *)&v16 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    impi = v4->_impi;
    v4->_impi = (NSString *)v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = (uint64_t *)*((void *)a3 + 3);
    v10 = (uint64_t *)*((void *)a3 + 4);
    while (v9 != v10)
    {
      id v11 = [NSString alloc];
      v12 = v9;
      if (*((char *)v9 + 23) < 0) {
        v12 = (uint64_t *)*v9;
      }
      v13 = (void *)[v11 initWithUTF8String:v12];
      [(NSArray *)v8 addObject:v13];

      v9 += 3;
    }
    impus = v4->_impus;
    v4->_impus = v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)impi
{
  return self->_impi;
}

- (void)setImpi:(id)a3
{
}

- (NSArray)impus
{
  return self->_impus;
}

- (void)setImpus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impus, 0);

  objc_storeStrong((id *)&self->_impi, 0);
}

@end