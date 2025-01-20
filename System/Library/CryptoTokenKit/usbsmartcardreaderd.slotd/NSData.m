@interface NSData
- (id)hexString;
@end

@implementation NSData

- (id)hexString
{
  v3 = +[NSMutableString stringWithCapacity:2 * [(NSData *)self length]];
  if ([(NSData *)self length])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = self;
      objc_msgSend(v3, "appendFormat:", @"%02hhX", *((unsigned __int8 *)-[NSData bytes](v5, "bytes") + v4++));
    }
    while (v4 < [(NSData *)v5 length]);
  }

  return v3;
}

@end