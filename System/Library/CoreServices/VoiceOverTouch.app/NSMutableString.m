@interface NSMutableString
- (void)appendStringWithComma:(id)a3;
@end

@implementation NSMutableString

- (void)appendStringWithComma:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([(NSMutableString *)self length]) {
      [(NSMutableString *)self appendString:@", "];
    }
    [(NSMutableString *)self appendString:v4];
  }
}

@end