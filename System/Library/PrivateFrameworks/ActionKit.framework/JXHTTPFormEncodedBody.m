@interface JXHTTPFormEncodedBody
+ (id)withDictionary:(id)a3;
- (JXHTTPFormEncodedBody)init;
- (JXHTTPFormEncodedBody)initWithDictionary:(id)a3;
- (NSMutableDictionary)dictionary;
- (id)httpContentType;
- (id)httpInputStream;
- (id)requestData;
- (int64_t)httpContentLength;
- (void)setDictionary:(id)a3;
@end

@implementation JXHTTPFormEncodedBody

- (void).cxx_destruct
{
}

- (void)setDictionary:(id)a3
{
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (int64_t)httpContentLength
{
  v2 = [(JXHTTPFormEncodedBody *)self requestData];
  int64_t v3 = [v2 length];

  return v3;
}

- (id)httpContentType
{
  return @"application/x-www-form-urlencoded; charset=utf-8";
}

- (id)httpInputStream
{
  id v3 = objc_alloc(MEMORY[0x263EFF950]);
  v4 = [(JXHTTPFormEncodedBody *)self requestData];
  v5 = (void *)[v3 initWithData:v4];

  return v5;
}

- (id)requestData
{
  v2 = [(JXHTTPFormEncodedBody *)self dictionary];
  id v3 = +[JXURLEncoding formEncodedDictionary:v2];
  v4 = [v3 dataUsingEncoding:4];

  return v4;
}

- (JXHTTPFormEncodedBody)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(JXHTTPFormEncodedBody *)self init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v4];
    [(JXHTTPFormEncodedBody *)v5 setDictionary:v6];
  }
  return v5;
}

- (JXHTTPFormEncodedBody)init
{
  v5.receiver = self;
  v5.super_class = (Class)JXHTTPFormEncodedBody;
  v2 = [(JXHTTPFormEncodedBody *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(JXHTTPFormEncodedBody *)v2 setDictionary:v3];
  }
  return v2;
}

+ (id)withDictionary:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

@end