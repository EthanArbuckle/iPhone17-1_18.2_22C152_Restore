@interface CTLazuliSuggestedActionOpenUrlInApplication
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionOpenUrlInApplication:(id)a3;
- (CTLazuliSuggestedActionOpenUrlInApplication)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionOpenUrlInApplication)initWithReflection:(const void *)a3;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CTLazuliSuggestedActionOpenUrlInApplication

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionOpenUrlInApplication *)self url];
  [v3 appendFormat:@", url = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionOpenUrlInApplication:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliSuggestedActionOpenUrlInApplication *)self url];
  v6 = [v4 url];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliSuggestedActionOpenUrlInApplication *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionOpenUrlInApplication *)self isEqualToCTLazuliSuggestedActionOpenUrlInApplication:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliSuggestedActionOpenUrlInApplication allocWithZone:a3];
  [(CTLazuliSuggestedActionOpenUrlInApplication *)v4 setUrl:self->_url];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliSuggestedActionOpenUrlInApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionOpenUrlInApplication;
  v5 = [(CTLazuliSuggestedActionOpenUrlInApplication *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUrlKey"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (CTLazuliSuggestedActionOpenUrlInApplication)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliSuggestedActionOpenUrlInApplication;
  id v4 = [(CTLazuliSuggestedActionOpenUrlInApplication *)&v15 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = NSString;
    int v7 = *((char *)a3 + 23);
    v8 = *(const void **)a3;
    uint64_t v9 = [NSString defaultCStringEncoding];
    if (v7 >= 0) {
      v10 = a3;
    }
    else {
      v10 = v8;
    }
    v11 = [v6 stringWithCString:v10 encoding:v9];
    uint64_t v12 = [v5 URLWithString:v11];
    url = v4->_url;
    v4->_url = (NSURL *)v12;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end