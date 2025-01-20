@interface NavdServerFormattedStringFormatter
- (id)stringForServerFormattedString:(id)a3;
@end

@implementation NavdServerFormattedStringFormatter

- (id)stringForServerFormattedString:(id)a3
{
  return +[NSString _navigation_stringForServerFormattedString:a3];
}

@end