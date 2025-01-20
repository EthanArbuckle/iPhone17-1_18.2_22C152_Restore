@interface BMDeviceMetadata_v0
- (int)platform;
@end

@implementation BMDeviceMetadata_v0

- (int)platform
{
  v4.receiver = self;
  v4.super_class = (Class)BMDeviceMetadata_v0;
  unsigned int v2 = [(BMDeviceMetadata *)&v4 platform];
  if (v2 > 8) {
    return 0;
  }
  else {
    return dword_1B35D9310[v2];
  }
}

@end