@interface UARPTLVPersonalizationECIDData
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSData)ecID;
- (UARPTLVPersonalizationECIDData)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setEcID:(id)a3;
@end

@implementation UARPTLVPersonalizationECIDData

- (UARPTLVPersonalizationECIDData)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationECIDData;
  return [(UARPMetaDataTLVData *)&v3 init];
}

- (void)setEcID:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  ecID = v4->_ecID;
  v4->_ecID = (NSData *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationECIDData metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %@>", v5, self->_ecID];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563339;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationECIDData tlvType];
  ecID = self->_ecID;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationECIDData;
  uint64_t v5 = [(UARPMetaDataTLVData *)&v7 generateTLV:v3 tlvValue:ecID];
  return v5;
}

- (id)tlvValue
{
  return self->_ecID;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization ECID Data";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationECIDData tlvType](UARPTLVPersonalizationECIDData, "tlvType"));
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
    [v4 setEcID:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  v6 = objc_opt_new();
  objc_super v7 = [MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a3];
  [v6 setEcID:v7];

  return v6;
}

- (NSData)ecID
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end