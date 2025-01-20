@interface CRLSystemInfo
+ (NSString)deviceName;
+ (NSString)hwModel;
+ (NSString)macAddress;
+ (NSString)operatingSystemName;
+ (NSString)osVersion;
+ (NSString)processorName;
+ (NSString)systemVersion;
@end

@implementation CRLSystemInfo

+ (NSString)macAddress
{
  memset(v15, 0, 12);
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    v7 = 0;
  }
  else
  {
    int v3 = v2;
    LODWORD(v15[0]) = 4000;
    *(void *)((char *)v15 + 4) = v16;
    if (ioctl(v2, 0xC00C6924uLL, v15) < 0 || SLODWORD(v15[0]) < 1)
    {
      v7 = 0;
    }
    else
    {
      v4 = &v16[SLODWORD(v15[0])];
      v5 = v16;
      do
      {
        if (v5[17] == 18
          && ((uint64_t v13 = 0,
               uint64_t v14 = 0,
               uint64_t v12 = 0,
               v6 = ether_ntoa((const ether_addr *)&v5[v5[21] + 24]),
               sscanf(v6, "%x:%x:%x:%x:%x:%x", (char *)&v14 + 4, &v14, (char *)&v13 + 4, &v13, (char *)&v12 + 4, &v12),
               v14)
           || v13
           || v12))
        {
          v7 = +[NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", HIDWORD(v14), v14, HIDWORD(v13), v13, HIDWORD(v12), v12];
        }
        else
        {
          v7 = 0;
        }
        uint64_t v8 = v5[16];
        if (v8 <= 0x10) {
          uint64_t v9 = 32;
        }
        else {
          uint64_t v9 = v8 + 16;
        }
        v5 += v9;
      }
      while (v5 < v4 && v7 == 0);
    }
    close(v3);
  }
  return (NSString *)v7;
}

+ (NSString)processorName
{
  *(void *)v5 = 0xC00000006;
  size_t v4 = 257;
  if (sysctl(v5, 2u, v6, &v4, 0, 0) < 0
    || (+[NSString stringWithFormat:@"%s", v6],
        (int v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v2 = +[UIDevice crl_platformString];
  }
  return (NSString *)v2;
}

+ (NSString)operatingSystemName
{
  int v2 = +[UIDevice currentDevice];
  int v3 = [v2 systemName];

  return (NSString *)v3;
}

+ (NSString)systemVersion
{
  int v2 = +[UIDevice currentDevice];
  int v3 = [v2 systemVersion];

  return (NSString *)v3;
}

+ (NSString)osVersion
{
  if (osVersion_onceToken != -1) {
    dispatch_once(&osVersion_onceToken, &__block_literal_global_0);
  }
  int v2 = (void *)osVersion_osVersion;
  return (NSString *)v2;
}

void __26__CRLSystemInfo_osVersion__block_invoke(id a1)
{
  size_t size = 0;
  sysctlbyname("kern.osversion", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0xACBDD60AuLL);
  sysctlbyname("kern.osversion", v1, &size, 0, 0);
  id v2 = [objc_alloc((Class)NSString) initWithUTF8String:v1];
  int v3 = (void *)osVersion_osVersion;
  osVersion_osVersion = (uint64_t)v2;

  free(v1);
}

+ (NSString)hwModel
{
  if (hwModel_onceToken != -1) {
    dispatch_once(&hwModel_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)hwModel_hwModel;
  return (NSString *)v2;
}

void __24__CRLSystemInfo_hwModel__block_invoke(id a1)
{
  size_t size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0x3B240CF6uLL);
  sysctlbyname("hw.model", v1, &size, 0, 0);
  id v2 = [objc_alloc((Class)NSString) initWithUTF8String:v1];
  int v3 = (void *)hwModel_hwModel;
  hwModel_hwModel = (uint64_t)v2;

  free(v1);
}

+ (NSString)deviceName
{
  id v2 = +[UIDevice currentDevice];
  int v3 = [v2 name];

  if (v3 && ![v3 length])
  {

    int v3 = 0;
  }
  return (NSString *)v3;
}

@end