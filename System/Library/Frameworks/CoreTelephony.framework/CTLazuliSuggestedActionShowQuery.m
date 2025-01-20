@interface CTLazuliSuggestedActionShowQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionShowQuery:(id)a3;
- (CTLazuliSuggestedActionShowQuery)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionShowQuery)initWithReflection:(const void *)a3;
- (NSString)query;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation CTLazuliSuggestedActionShowQuery

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionShowQuery *)self query];
  [v3 appendFormat:@", query = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionShowQuery:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliSuggestedActionShowQuery *)self query];
  if (!v6)
  {
    v3 = [v5 query];
    if (!v3)
    {
      char v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [(CTLazuliSuggestedActionShowQuery *)self query];
  v8 = [v5 query];
  char v9 = [v7 isEqualToString:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliSuggestedActionShowQuery *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionShowQuery *)self isEqualToCTLazuliSuggestedActionShowQuery:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliSuggestedActionShowQuery allocWithZone:a3];
  [(CTLazuliSuggestedActionShowQuery *)v4 setQuery:self->_query];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliSuggestedActionShowQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionShowQuery;
  id v5 = [(CTLazuliSuggestedActionShowQuery *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kQueryKey"];
    query = v5->_query;
    v5->_query = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliSuggestedActionShowQuery)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliSuggestedActionShowQuery;
  id v4 = [(CTLazuliSuggestedActionShowQuery *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    if (*((unsigned char *)a3 + 24))
    {
      if (*((char *)a3 + 23) >= 0) {
        uint64_t v6 = a3;
      }
      else {
        uint64_t v6 = *(const void **)a3;
      }
      uint64_t v7 = [NSString stringWithUTF8String:v6];
      query = v5->_query;
      v5->_query = (NSString *)v7;
    }
    else
    {
      query = v4->_query;
      v4->_query = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end