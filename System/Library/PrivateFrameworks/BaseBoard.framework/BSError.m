@interface BSError
- (NSString)description;
@end

@implementation BSError

- (NSString)description
{
  return (NSString *)[(NSError *)self descriptionWithMultilinePrefix:0];
}

@end