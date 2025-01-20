@interface ComponentUSBCController
- (BOOL)isPresent;
- (NSString)challengeString;
- (NSString)signatureString;
- (unsigned)deviceNode;
- (void)populateAttributes:(id)a3;
- (void)setChallengeString:(id)a3;
- (void)setDeviceNode:(unsigned int)a3;
- (void)setSignatureString:(id)a3;
@end

@implementation ComponentUSBCController

- (BOOL)isPresent
{
  return +[DAComponentUtil IORegistryNameExists:@"Port-USB-C" optionalKey:0];
}

- (void)populateAttributes:(id)a3
{
  id v10 = a3;
  uint64_t v3 = +[DAComponentUtil getIORegistryName:@"AppleHPMDeviceHALType3" property:@"UUID" optionalKey:0];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = +[NSString stringWithFormat:@"%llx", MGGetSInt64Answer()];
    CFStringRef v6 = @"ecid";
    goto LABEL_3;
  }
  uint64_t v7 = +[DAComponentUtil getIORegistryName:@"AppleHPMDevice" property:@"UUID" optionalKey:0];
  if (v7)
  {
    v4 = (void *)v7;
    id v8 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    if (!v8)
    {
      v9 = +[NSNull null];
      [v10 setObject:v9 forKeyedSubscript:@"UUID"];

      v5 = 0;
      goto LABEL_4;
    }
    v5 = v8;
    CFStringRef v6 = @"UUID";
LABEL_3:
    [v10 setObject:v5 forKeyedSubscript:v6];
LABEL_4:
  }
}

- (unsigned)deviceNode
{
  return self->_deviceNode;
}

- (void)setDeviceNode:(unsigned int)a3
{
  self->_deviceNode = a3;
}

- (NSString)challengeString
{
  return self->_challengeString;
}

- (void)setChallengeString:(id)a3
{
}

- (NSString)signatureString
{
  return self->_signatureString;
}

- (void)setSignatureString:(id)a3
{
  self->_signatureString = (NSString *)a3;
}

- (void).cxx_destruct
{
}

@end