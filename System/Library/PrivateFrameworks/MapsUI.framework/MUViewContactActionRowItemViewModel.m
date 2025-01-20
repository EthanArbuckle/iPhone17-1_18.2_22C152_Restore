@interface MUViewContactActionRowItemViewModel
- (BOOL)isEnabled;
- (id)accessibilityIdentifier;
- (id)symbolName;
- (id)titleText;
@end

@implementation MUViewContactActionRowItemViewModel

- (id)titleText
{
  return _MULocalizedStringFromThisBundle(@"Contacts [Placecard]");
}

- (id)symbolName
{
  return @"person.fill";
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return (id)[@"ActionRowItemType" stringByAppendingString:@"Contacts"];
}

@end