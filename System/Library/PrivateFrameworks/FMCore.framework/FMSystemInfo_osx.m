@interface FMSystemInfo_osx
- (id)deviceClass;
- (id)deviceModelName;
- (id)deviceName;
- (id)deviceUDID;
- (id)osVersion;
- (id)productName;
- (id)productType;
- (void)deviceUDID;
@end

@implementation FMSystemInfo_osx

- (id)productType
{
  v2 = (void *)productType__productType;
  if (!productType__productType)
  {
    size_t size = 0;
    sysctlbyname("hw.model", 0, &size, 0, 0);
    v3 = malloc_type_malloc(size, 0x27F6A66CuLL);
    sysctlbyname("hw.model", v3, &size, 0, 0);
    if (v3)
    {
      uint64_t v4 = [NSString stringWithCString:v3 encoding:4];
      v5 = (void *)productType__productType;
      productType__productType = v4;
    }
    free(v3);
    v2 = (void *)productType__productType;
  }
  return v2;
}

- (id)productName
{
  if (productName_onceToken_0 != -1) {
    dispatch_once(&productName_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)productName__value_0;
  return v2;
}

- (id)deviceClass
{
  return @"Mac";
}

- (id)deviceUDID
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)deviceUDID__deviceUDID;
  if (!deviceUDID__deviceUDID)
  {
    memset(v8, 0, sizeof(v8));
    timespec v7 = (timespec)xmmword_1D0EDDCB0;
    if (gethostuuid(v8, &v7))
    {
      v3 = LogCategory_Unspecified();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[FMSystemInfo_osx deviceUDID](v3);
      }
    }
    else
    {
      v3 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:16];
      uint64_t v4 = [v3 fm_hexString];
      v5 = (void *)deviceUDID__deviceUDID;
      deviceUDID__deviceUDID = v4;
    }
    v2 = (void *)deviceUDID__deviceUDID;
  }
  return v2;
}

- (id)osVersion
{
  v2 = (void *)osVersion__osVersion;
  if (!osVersion__osVersion)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v4 = v3;
    if (v3) {
      [v3 operatingSystemVersion];
    }
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu.%lu", 0, 0, v8);
    v6 = (void *)osVersion__osVersion;
    osVersion__osVersion = v5;

    v2 = (void *)osVersion__osVersion;
  }
  return v2;
}

- (id)deviceName
{
  return 0;
}

- (id)deviceModelName
{
  v3 = (void *)deviceModelName__deviceModelName;
  if (!deviceModelName__deviceModelName)
  {
    uint64_t v4 = [(FMSystemInfo_osx *)self productType];
    uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789,"];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
    timespec v7 = (void *)deviceModelName__deviceModelName;
    deviceModelName__deviceModelName = v6;

    v3 = (void *)deviceModelName__deviceModelName;
  }
  return v3;
}

- (void)deviceUDID
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "Error getting device UDID", v1, 2u);
}

@end