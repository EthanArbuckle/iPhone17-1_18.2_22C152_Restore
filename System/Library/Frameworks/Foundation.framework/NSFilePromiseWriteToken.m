@interface NSFilePromiseWriteToken
- (NSURL)logicalURL;
- (NSURL)promiseURL;
- (void)dealloc;
- (void)setLogicalURL:(id)a3;
- (void)setPromiseURL:(id)a3;
@end

@implementation NSFilePromiseWriteToken

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePromiseWriteToken;
  [(NSFilePromiseWriteToken *)&v3 dealloc];
}

- (NSURL)promiseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPromiseURL:(id)a3
{
}

- (NSURL)logicalURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogicalURL:(id)a3
{
}

@end