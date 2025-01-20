@interface ComponentLightningController
- (BOOL)base64EncodeData:(id)a3 result:(id *)a4;
- (BOOL)isPresent;
- (id)accessoryManagerESN;
- (id)deviceID;
- (id)registryESN;
- (id)reverseByteOrder:(id)a3;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentLightningController

- (BOOL)isPresent
{
  v2 = (unsigned __int8 *)[@"tristar" UTF8String];

  return findDeviceWithName(v2);
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ComponentLightningController *)self registryESN];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [(ComponentLightningController *)self accessoryManagerESN];
    if (v8)
    {
      uint64_t v6 = v8;
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v6 = +[NSNull null];
      uint64_t v7 = 2;
    }
  }
  id v12 = (id)v6;
  [v4 setObject:v6 forKeyedSubscript:@"esn"];
  v9 = +[NSNumber numberWithUnsignedInteger:v7];
  [v4 setObject:v9 forKeyedSubscript:@"source"];

  v10 = [(ComponentLightningController *)self deviceID];
  v11 = stringOrNull(v10);
  [v4 setObject:v11 forKeyedSubscript:@"deviceID"];
}

- (id)registryESN
{
  v3 = +[DAComponentUtil getIORegistryName:@"tristar" property:@"esn" optionalKey:0];
  if (v3)
  {
    id v4 = [(ComponentLightningController *)self reverseByteOrder:v3];

    v3 = [v4 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = 0;
  }

  return v3;
}

- (id)accessoryManagerESN
{
  uint64_t v5 = 0;
  MFAAComponentAuthCreateSignature();
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to get esn from MFAAComponentAuthCreateSignature()", v4, 2u);
  }

  return 0;
}

- (id)deviceID
{
  v2 = +[DAComponentUtil getIORegistryName:@"AppleHPMDevice" property:@"Device ID" optionalKey:0];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)base64EncodeData:(id)a3 result:(id *)a4
{
  id v5 = [a3 base64EncodedStringWithOptions:0];
  *a4 = v5;
  return v5 != 0;
}

- (id)reverseByteOrder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = (char *)[v5 bytes];
  if (v4)
  {
    uint64_t v7 = (char *)&v11 - ((unint64_t)(v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v8 = v4;
    do
      *v7++ = (v8--)[(void)(v6 - 1)];
    while (v8);
  }
  v9 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");

  return v9;
}

@end