@interface CNPropertyGroupEmailAddressItem
- (id)defaultActionURL;
@end

@implementation CNPropertyGroupEmailAddressItem

- (id)defaultActionURL
{
  v2 = NSString;
  v3 = [(CNPropertyGroupItem *)self labeledValue];
  v4 = [v3 value];
  v5 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];
  v7 = [v2 stringWithFormat:@"mailto:%@", v6];

  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v8;
}

@end