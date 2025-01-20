@interface HDNSOperatingSystemVersion
+ (HDNSOperatingSystemVersion)unknownVersion;
+ (HDNSOperatingSystemVersion)versionWithMajor:(uint64_t)a3 minor:(uint64_t)a4 patch:;
@end

@implementation HDNSOperatingSystemVersion

+ (HDNSOperatingSystemVersion)unknownVersion
{
  self;
  v0 = objc_alloc_init(HDNSOperatingSystemVersion);
  v1 = v0;
  if (v0)
  {
    long long v3 = HDDataProvenanceOperatingSystemVersionUnknown;
    uint64_t v4 = 0;
    objc_copyStruct(&v0->_versionStruct, &v3, 24, 1, 0);
  }

  return v1;
}

+ (HDNSOperatingSystemVersion)versionWithMajor:(uint64_t)a3 minor:(uint64_t)a4 patch:
{
  self;
  v7 = objc_alloc_init(HDNSOperatingSystemVersion);
  v8 = v7;
  if (v7)
  {
    src[0] = a2;
    src[1] = a3;
    src[2] = a4;
    objc_copyStruct(&v7->_versionStruct, src, 24, 1, 0);
  }

  return v8;
}

@end