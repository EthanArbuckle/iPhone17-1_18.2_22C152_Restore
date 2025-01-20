@interface MOVWriterInterfaceUtil
+ (id)makeDeviceString;
@end

@implementation MOVWriterInterfaceUtil

+ (id)makeDeviceString
{
  v9 = &unk_26CB5E4F8;
  sub_21B5C5868((uint64_t)&v9, (char *)__p);
  nullsub_2(&v9);
  v2 = NSString;
  int v3 = v11;
  v4 = (void **)__p[0];
  uint64_t v5 = [NSString defaultCStringEncoding];
  if (v3 >= 0) {
    v6 = __p;
  }
  else {
    v6 = v4;
  }
  v7 = [v2 stringWithCString:v6 encoding:v5];
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  return v7;
}

@end