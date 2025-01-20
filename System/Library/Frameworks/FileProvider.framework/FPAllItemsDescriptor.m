@interface FPAllItemsDescriptor
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
@end

@implementation FPAllItemsDescriptor

- (id)name
{
  return (id)[NSString stringWithUTF8String:"ALL."];
}

- (id)queryStringForMountPoint:(id)a3
{
  return @"(true)";
}

@end