@interface CKContainerID(HMB)
- (id)hmbDescription;
@end

@implementation CKContainerID(HMB)

- (id)hmbDescription
{
  if ([a1 environment] == 1)
  {
    v2 = [a1 containerIdentifier];
  }
  else
  {
    v3 = NSString;
    [a1 environment];
    v4 = CKContainerEnvironmentString();
    v5 = [a1 containerIdentifier];
    v2 = [v3 stringWithFormat:@"%@.%@", v4, v5];
  }
  return v2;
}

@end