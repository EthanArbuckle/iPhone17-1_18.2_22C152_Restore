@interface JXHTTPFileBody
+ (id)withFilePath:(id)a3;
+ (id)withFilePath:(id)a3 contentType:(id)a4;
- (JXHTTPFileBody)initWithFilePath:(id)a3 contentType:(id)a4;
- (NSString)filePath;
- (NSString)httpContentType;
- (id)httpInputStream;
- (int64_t)httpContentLength;
- (void)setFilePath:(id)a3;
- (void)setHttpContentType:(id)a3;
@end

@implementation JXHTTPFileBody

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpContentType, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)setHttpContentType:(id)a3
{
}

- (NSString)httpContentType
{
  return self->_httpContentType;
}

- (void)setFilePath:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (int64_t)httpContentLength
{
  v3 = [(JXHTTPFileBody *)self filePath];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return -1;
  }
  v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [(JXHTTPFileBody *)self filePath];
  id v16 = 0;
  v7 = [v5 attributesOfItemAtPath:v6 error:&v16];
  id v8 = v16;

  if (v8)
  {
    v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPFileBody.m"];
    v10 = [v9 lastPathComponent];
    v11 = [v8 localizedDescription];
    NSLog(&cfstr_DError.isa, v10, 41, v11);
  }
  v12 = [v7 objectForKey:*MEMORY[0x263F080B8]];
  v13 = v12;
  if (v12) {
    int64_t v14 = [v12 longLongValue];
  }
  else {
    int64_t v14 = -1;
  }

  return v14;
}

- (id)httpInputStream
{
  id v3 = objc_alloc(MEMORY[0x263EFF950]);
  uint64_t v4 = [(JXHTTPFileBody *)self filePath];
  v5 = (void *)[v3 initWithFileAtPath:v4];

  return v5;
}

- (JXHTTPFileBody)initWithFilePath:(id)a3 contentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)JXHTTPFileBody;
  id v8 = [(JXHTTPFileBody *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(JXHTTPFileBody *)v8 setFilePath:v6];
    [(JXHTTPFileBody *)v9 setHttpContentType:v7];
  }

  return v9;
}

+ (id)withFilePath:(id)a3
{
  return (id)[a1 withFilePath:a3 contentType:0];
}

+ (id)withFilePath:(id)a3 contentType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithFilePath:v7 contentType:v6];

  return v8;
}

@end