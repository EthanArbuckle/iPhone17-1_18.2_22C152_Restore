@interface __HMFSoftwareVersionDataSource
- (HMFSoftwareVersion)softwareVersion;
@end

@implementation __HMFSoftwareVersionDataSource

- (HMFSoftwareVersion)softwareVersion
{
  CFDictionaryRef v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F1CD10]);
    if (Value)
    {
      v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFStringGetTypeID()) {
        v7 = v5;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;
    CFRelease(v3);
  }
  else
  {
    id v8 = 0;
  }
  v9 = [MEMORY[0x1E4F28F80] processInfo];
  v10 = v9;
  if (v9) {
    [v9 operatingSystemVersion];
  }

  v11 = [[HMFSoftwareVersion alloc] initWithMajorVersion:0 minorVersion:0 updateVersion:0 buildVersion:v8];
  return v11;
}

@end