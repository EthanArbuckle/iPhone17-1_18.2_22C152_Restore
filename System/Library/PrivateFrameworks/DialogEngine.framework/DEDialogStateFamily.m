@interface DEDialogStateFamily
- (double)lastTimestamp;
- (int)usageCount;
@end

@implementation DEDialogStateFamily

- (double)lastTimestamp
{
  [(DEDialogState *)self getFamily];
  return v2;
}

- (int)usageCount
{
  return [(DEDialogState *)self getFamily];
}

@end