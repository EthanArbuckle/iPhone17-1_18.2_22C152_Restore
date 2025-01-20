@interface CTLazuliSuggestedActionOpenUrlInWebView
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionOpenUrlInWebView:(id)a3;
- (CTLazuliSuggestedActionOpenUrlInWebView)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionOpenUrlInWebView)initWithReflection:(const void *)a3;
- (NSString)parameters;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setParameters:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CTLazuliSuggestedActionOpenUrlInWebView

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliSuggestedActionOpenUrlInWebView *)self mode];
  int64_t v8 = [(CTLazuliSuggestedActionOpenUrlInWebView *)self mode];
  [v3 appendFormat:@", mode = [%ld - %s]", v4, print_CTLazuliViewModeType(&v8)];
  v5 = [(CTLazuliSuggestedActionOpenUrlInWebView *)self url];
  [v3 appendFormat:@", url = %@", v5];

  v6 = [(CTLazuliSuggestedActionOpenUrlInWebView *)self parameters];
  [v3 appendFormat:@", parameters = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionOpenUrlInWebView:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliSuggestedActionOpenUrlInWebView *)self mode];
  if (v5 == [v4 mode])
  {
    v6 = [(CTLazuliSuggestedActionOpenUrlInWebView *)self url];
    v7 = [v4 url];
    if ([v6 isEqual:v7])
    {
      int64_t v8 = [(CTLazuliSuggestedActionOpenUrlInWebView *)self parameters];
      v9 = [v4 parameters];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliSuggestedActionOpenUrlInWebView *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionOpenUrlInWebView *)self isEqualToCTLazuliSuggestedActionOpenUrlInWebView:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliSuggestedActionOpenUrlInWebView allocWithZone:a3];
  [(CTLazuliSuggestedActionOpenUrlInWebView *)v4 setMode:self->_mode];
  [(CTLazuliSuggestedActionOpenUrlInWebView *)v4 setUrl:self->_url];
  [(CTLazuliSuggestedActionOpenUrlInWebView *)v4 setParameters:self->_parameters];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_mode];
  [v5 encodeObject:v4 forKey:@"kModeKey"];

  [v5 encodeObject:self->_url forKey:@"kUrlKey"];
  [v5 encodeObject:self->_parameters forKey:@"kParametersKey"];
}

- (CTLazuliSuggestedActionOpenUrlInWebView)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliSuggestedActionOpenUrlInWebView;
  id v5 = [(CTLazuliSuggestedActionOpenUrlInWebView *)&v12 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kModeKey"];
    v5->_mode = [v6 longValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUrlKey"];
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kParametersKey"];
    parameters = v5->_parameters;
    v5->_parameters = (NSString *)v9;
  }
  return v5;
}

- (CTLazuliSuggestedActionOpenUrlInWebView)initWithReflection:(const void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CTLazuliSuggestedActionOpenUrlInWebView;
  id v4 = [(CTLazuliSuggestedActionOpenUrlInWebView *)&v21 init];
  if (v4)
  {
    v4->_mode = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v6 = NSString;
    uint64_t v7 = (char *)*((void *)a3 + 1);
    int v8 = *((char *)a3 + 31);
    uint64_t v9 = [NSString defaultCStringEncoding];
    if (v8 >= 0) {
      char v10 = (char *)a3 + 8;
    }
    else {
      char v10 = v7;
    }
    v11 = [v6 stringWithCString:v10 encoding:v9];
    uint64_t v12 = [v5 URLWithString:v11];
    url = v4->_url;
    v4->_url = (NSURL *)v12;

    v16 = (char *)*((void *)a3 + 4);
    v15 = (char *)a3 + 32;
    v14 = v16;
    if (v15[23] >= 0) {
      v17 = v15;
    }
    else {
      v17 = v14;
    }
    uint64_t v18 = [NSString stringWithUTF8String:v17];
    parameters = v4->_parameters;
    v4->_parameters = (NSString *)v18;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end