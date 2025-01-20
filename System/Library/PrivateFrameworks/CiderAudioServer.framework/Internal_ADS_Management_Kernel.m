@interface Internal_ADS_Management_Kernel
+ (BOOL)IsDeviceWithAOIDConnected:(unsigned int)a3;
+ (__CFData)GetPropertyData:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 error:(id *)a5;
+ (unsigned)ConnectDevice:(id)a3 error:(id *)a4;
+ (void)DisconnectAllDevices;
+ (void)DisconnectDeviceByAudioObjectID:(unsigned int)a3 error:(id *)a4;
+ (void)DisconnectDeviceByUID:(id)a3 error:(id *)a4;
+ (void)GetPropertyData_TypeRef:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 error:(id *)a5;
+ (void)SetPropertyDataPrivileged:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 dataSize:(unsigned int)a5 data:(const void *)a6 error:(id *)a7;
+ (void)SetPropertyDataPrivileged_TypeRef:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 data:(void *)a5 error:(id *)a6;
@end

@implementation Internal_ADS_Management_Kernel

+ (void)SetPropertyDataPrivileged_TypeRef:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 data:(void *)a5 error:(id *)a6
{
  CFTypeRef cf = a5;
  if (cf) {
    CFRelease(cf);
  }
  if (v10)
  {
    *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"InCider" code:v10 userInfo:0];
  }
}

+ (void)SetPropertyDataPrivileged:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 dataSize:(unsigned int)a5 data:(const void *)a6 error:(id *)a7
{
  if (v12)
  {
    *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"InCider" code:v12 userInfo:0];
  }
}

+ (void)GetPropertyData_TypeRef:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 error:(id *)a5
{
  v7 = *(const AudioObjectPropertyAddress **)&a3;
  if (v9)
  {
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"InCider");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

+ (__CFData)GetPropertyData:(unsigned int)a3 address:(AudioObjectPropertyAddress *)a4 error:(id *)a5
{
  v7 = *(const AudioObjectPropertyAddress **)&a3;
  if (v9)
  {
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"InCider");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

+ (void)DisconnectDeviceByUID:(id)a3 error:(id *)a4
{
  v5 = (_anonymous_namespace_ *)a3;
  v6 = v5;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(_anonymous_namespace_ *)v6 UTF8String]);
  int v8 = v7;
  if ((v10 & 0x80000000) == 0)
  {
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  operator delete(__p[0]);
  if (v8)
  {
LABEL_5:
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"InCider" code:v8 userInfo:0];
  }
LABEL_6:
}

+ (void)DisconnectDeviceByAudioObjectID:(unsigned int)a3 error:(id *)a4
{
  if (v6)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"InCider" code:v6 userInfo:0];
  }
}

+ (unsigned)ConnectDevice:(id)a3 error:(id *)a4
{
  v5 = (_anonymous_namespace_ *)a3;
  int v6 = v5;
  int v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

  char v10 = v9;
  if (cf) {
    CFRelease(cf);
  }
  if (v8)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"InCider" code:(int)v8 userInfo:0];
    LODWORD(v11) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v10) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    unint64_t v11 = HIDWORD(v8);
  }

  return v11;
}

+ (void)DisconnectAllDevices
{
}

+ (BOOL)IsDeviceWithAOIDConnected:(unsigned int)a3
{
}

@end