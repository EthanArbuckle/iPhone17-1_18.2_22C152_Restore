@interface EMMessageHeaders
+ (BOOL)supportsSecureCoding;
- (EMMessageHeaders)initWithCoder:(id)a3;
- (EMMessageHeaders)initWithHeaders:(id)a3;
- (NSArray)headerKeys;
- (NSDictionary)headers;
- (id)firstHeaderForKey:(id)a3;
- (id)headersForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHeaders:(id)a3;
@end

@implementation EMMessageHeaders

- (EMMessageHeaders)initWithHeaders:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageHeaders;
  v5 = [(EMMessageHeaders *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v6;
  }
  return v5;
}

- (NSArray)headerKeys
{
  v2 = [(NSDictionary *)self->_headers allKeys];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)headersForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_headers objectForKeyedSubscript:a3];
  return v3;
}

- (id)firstHeaderForKey:(id)a3
{
  v3 = [(EMMessageHeaders *)self headersForKey:a3];
  id v4 = [v3 firstObject];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageHeaders)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_headers"];

  v10 = [(EMMessageHeaders *)self initWithHeaders:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(EMMessageHeaders *)self headers];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_headers"];
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end