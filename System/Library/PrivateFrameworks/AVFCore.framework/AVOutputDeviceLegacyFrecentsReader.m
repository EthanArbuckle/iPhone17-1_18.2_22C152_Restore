@interface AVOutputDeviceLegacyFrecentsReader
+ (id)defaultFrecentsReader;
- (NSArray)deviceIDs;
- (id)frecencyInfoForDeviceWithID:(id)a3;
@end

@implementation AVOutputDeviceLegacyFrecentsReader

- (id)frecencyInfoForDeviceWithID:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.avfoundation.frecents");
  return v3;
}

+ (id)defaultFrecentsReader
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)deviceIDs
{
  CFArrayRef v2 = CFPreferencesCopyKeyList(@"com.apple.avfoundation.frecents", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return (NSArray *)v2;
}

@end