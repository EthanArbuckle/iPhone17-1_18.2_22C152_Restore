@interface UARPTLVPersonalizationFTABSubfileDigest
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSData)digest;
- (UARPTLVPersonalizationFTABSubfileDigest)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setDigest:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileDigest

- (UARPTLVPersonalizationFTABSubfileDigest)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigest;
  return [(UARPMetaDataTLVData *)&v3 init];
}

- (void)setDigest:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  digest = v4->_digest;
  v4->_digest = (NSData *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationFTABSubfileDigest metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %@>", v5, self->_digest];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563373;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileDigest tlvType];
  digest = self->_digest;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigest;
  uint64_t v5 = [(UARPMetaDataTLVData *)&v7 generateTLV:v3 tlvValue:digest];
  return v5;
}

- (id)tlvValue
{
  return self->_digest;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = &unk_26CEFE4E8;
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileDigest tlvType](UARPTLVPersonalizationFTABSubfileDigest, "tlvType"));
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
    [v4 setDigest:v3];
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
  [v6 setDigest:v7];

  return v6;
}

- (NSData)digest
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end