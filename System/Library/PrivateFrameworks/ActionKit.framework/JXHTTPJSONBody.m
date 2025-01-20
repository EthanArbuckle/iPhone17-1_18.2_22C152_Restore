@interface JXHTTPJSONBody
+ (id)withData:(id)a3;
+ (id)withJSONObject:(id)a3;
+ (id)withString:(id)a3;
- (JXHTTPJSONBody)initWithData:(id)a3;
- (NSData)requestData;
- (id)httpContentType;
- (id)httpInputStream;
- (int64_t)httpContentLength;
- (void)httpOperationDidFinishLoading:(id)a3;
- (void)setRequestData:(id)a3;
@end

@implementation JXHTTPJSONBody

- (void).cxx_destruct
{
}

- (void)setRequestData:(id)a3
{
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)httpOperationDidFinishLoading:(id)a3
{
}

- (int64_t)httpContentLength
{
  v2 = [(JXHTTPJSONBody *)self requestData];
  int64_t v3 = [v2 length];

  return v3;
}

- (id)httpContentType
{
  return @"application/json; charset=utf-8";
}

- (id)httpInputStream
{
  id v3 = objc_alloc(MEMORY[0x263EFF950]);
  v4 = [(JXHTTPJSONBody *)self requestData];
  v5 = (void *)[v3 initWithData:v4];

  return v5;
}

- (JXHTTPJSONBody)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JXHTTPJSONBody;
  v5 = [(JXHTTPJSONBody *)&v8 init];
  v6 = v5;
  if (v5) {
    [(JXHTTPJSONBody *)v5 setRequestData:v4];
  }

  return v6;
}

+ (id)withJSONObject:(id)a3
{
  id v11 = 0;
  id v4 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:0 error:&v11];
  id v5 = v11;
  if (v5)
  {
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPJSONBody.m"];
    v7 = [v6 lastPathComponent];
    objc_super v8 = [v5 localizedDescription];
    NSLog(&cfstr_DError.isa, v7, 34, v8);
  }
  v9 = [a1 withData:v4];

  return v9;
}

+ (id)withString:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  id v5 = [a1 withData:v4];

  return v5;
}

+ (id)withData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithData:v4];

  return v5;
}

@end