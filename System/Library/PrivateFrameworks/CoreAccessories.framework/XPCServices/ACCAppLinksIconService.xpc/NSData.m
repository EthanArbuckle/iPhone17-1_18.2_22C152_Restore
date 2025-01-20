@interface NSData
- (id)SHA1;
- (id)SHA256;
@end

@implementation NSData

- (id)SHA1
{
  memset(v5, 170, 20);
  v2 = self;
  CC_SHA1([(NSData *)v2 bytes], (CC_LONG)[(NSData *)v2 length], v5);
  v3 = +[NSData dataWithBytes:v5 length:20];

  return v3;
}

- (id)SHA256
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v6 = v2;
  long long v7 = v2;
  v3 = self;
  CC_SHA256([(NSData *)v3 bytes], (CC_LONG)[(NSData *)v3 length], (unsigned __int8 *)&v6);
  v4 = +[NSData dataWithBytes:&v6 length:16];

  return v4;
}

@end