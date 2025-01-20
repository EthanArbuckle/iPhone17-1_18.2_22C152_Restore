@interface CKRecordZoneID(HMB)
- (id)hmbDescription;
@end

@implementation CKRecordZoneID(HMB)

- (id)hmbDescription
{
  v2 = [a1 ownerName];
  int v3 = [v2 isEqual:*MEMORY[0x1E4F19C08]];

  if (v3)
  {
    v4 = [a1 zoneName];
  }
  else
  {
    v5 = NSString;
    v6 = [a1 ownerName];
    v7 = [a1 zoneName];
    v4 = [v5 stringWithFormat:@"%@/%@", v6, v7];
  }
  return v4;
}

@end