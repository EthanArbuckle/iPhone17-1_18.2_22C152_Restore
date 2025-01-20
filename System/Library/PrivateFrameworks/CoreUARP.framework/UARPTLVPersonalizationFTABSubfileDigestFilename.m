@interface UARPTLVPersonalizationFTABSubfileDigestFilename
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)filename;
- (UARPTLVPersonalizationFTABSubfileDigestFilename)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setFilename:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileDigestFilename

- (UARPTLVPersonalizationFTABSubfileDigestFilename)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigestFilename;
  return [(UARPMetaDataTLVString *)&v3 init];
}

- (void)setFilename:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  filename = v4->_filename;
  v4->_filename = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationFTABSubfileDigestFilename metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %@>", v5, self->_filename];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563338;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileDigestFilename tlvType];
  filename = self->_filename;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigestFilename;
  uint64_t v5 = [(UARPMetaDataTLVString *)&v7 generateTLV:v3 tlvValue:filename];
  return v5;
}

- (id)tlvValue
{
  filename = self->_filename;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigestFilename;
  uint64_t v3 = [(UARPMetaDataTLVString *)&v5 tlvValue:filename];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = &unk_26CEFE590;
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileDigestFilename tlvType](UARPTLVPersonalizationFTABSubfileDigestFilename, "tlvType"));
  v6[1] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_opt_new();
    [v4 setFilename:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  v4 = strndup((const char *)a4, a3);
  objc_super v5 = objc_opt_new();
  v6 = [NSString stringWithUTF8String:v4];
  [v5 setFilename:v6];

  free(v4);
  return v5;
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end