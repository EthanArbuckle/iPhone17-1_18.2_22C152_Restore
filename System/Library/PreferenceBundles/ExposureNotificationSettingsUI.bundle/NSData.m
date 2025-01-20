@interface NSData
- (NSString)enui_text;
@end

@implementation NSData

- (NSString)enui_text
{
  v3 = +[NSMutableString stringWithCapacity:2 * [(NSData *)self length]];
  v4 = self;
  v5 = [(NSData *)v4 bytes];
  if ([(NSData *)v4 length])
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @"%02X", v5[v6++]);
    while (v6 < [(NSData *)v4 length]);
  }
  id v7 = [v3 copy];

  return (NSString *)v7;
}

@end