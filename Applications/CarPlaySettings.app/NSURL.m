@interface NSURL
- (BOOL)isDevicePickerURL;
@end

@implementation NSURL

- (BOOL)isDevicePickerURL
{
  v2 = self;
  char v3 = NSURL.isDevicePickerURL.getter();

  return v3 & 1;
}

@end