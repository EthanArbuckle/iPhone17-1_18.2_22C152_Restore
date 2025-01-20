@interface Audio_Device_Serialization
+ (id)Serialize_All_Devices:(id *)a3;
@end

@implementation Audio_Device_Serialization

+ (id)Serialize_All_Devices:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  util::WriteDevicesExceptionSafe((util *)&v10);
  if (v10)
  {
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"DeviceSerialization");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v11;
  for (i = v12; v5 != i; v5 += 3)
  {
    v7 = v5;
    if (*((char *)v5 + 23) < 0) {
      v7 = (uint64_t *)*v5;
    }
    v8 = [NSString stringWithCString:v7 encoding:4];
    [v4 addObject:v8];
  }
  v13 = (void **)&v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v4;
}

@end