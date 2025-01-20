@interface JXHTTPDataBody
+ (id)withData:(id)a3;
+ (id)withData:(id)a3 contentType:(id)a4;
- (JXHTTPDataBody)initWithData:(id)a3 contentType:(id)a4;
- (NSData)data;
- (NSString)httpContentType;
- (id)httpInputStream;
- (int64_t)httpContentLength;
- (void)setData:(id)a3;
- (void)setHttpContentType:(id)a3;
@end

@implementation JXHTTPDataBody

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpContentType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setHttpContentType:(id)a3
{
}

- (NSString)httpContentType
{
  return self->_httpContentType;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)httpContentLength
{
  v2 = [(JXHTTPDataBody *)self data];
  int64_t v3 = [v2 length];

  return v3;
}

- (id)httpInputStream
{
  id v3 = objc_alloc(MEMORY[0x263EFF950]);
  v4 = [(JXHTTPDataBody *)self data];
  v5 = (void *)[v3 initWithData:v4];

  return v5;
}

- (JXHTTPDataBody)initWithData:(id)a3 contentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)JXHTTPDataBody;
  v8 = [(JXHTTPDataBody *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(JXHTTPDataBody *)v8 setData:v6];
    [(JXHTTPDataBody *)v9 setHttpContentType:v7];
  }

  return v9;
}

+ (id)withData:(id)a3
{
  return (id)[a1 withData:a3 contentType:0];
}

+ (id)withData:(id)a3 contentType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithData:v7 contentType:v6];

  return v8;
}

@end