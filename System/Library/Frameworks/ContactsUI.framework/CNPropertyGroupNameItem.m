@interface CNPropertyGroupNameItem
+ (Class)classForProperty:(id)a3;
- (BOOL)supportsLabel;
@end

@implementation CNPropertyGroupNameItem

- (BOOL)supportsLabel
{
  return 0;
}

+ (Class)classForProperty:(id)a3
{
  return (Class)self;
}

@end