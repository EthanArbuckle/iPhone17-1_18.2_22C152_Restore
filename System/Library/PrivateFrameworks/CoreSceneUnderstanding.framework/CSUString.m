@interface CSUString
- (NSString)string;
- (void)setString:(id)a3;
@end

@implementation CSUString

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end