@interface FPEvictableItemsQueryDescriptor
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
@end

@implementation FPEvictableItemsQueryDescriptor

- (id)name
{
  return (id)[NSString stringWithUTF8String:"EVCT"];
}

- (id)queryStringForMountPoint:(id)a3
{
  return (id)[NSString stringWithFormat:@"(FPEvictable == \"1\""];
}

@end