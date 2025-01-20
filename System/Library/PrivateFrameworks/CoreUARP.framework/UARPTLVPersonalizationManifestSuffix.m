@interface UARPTLVPersonalizationManifestSuffix
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)manifestSuffix;
- (UARPTLVPersonalizationManifestSuffix)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setManifestSuffix:(id)a3;
@end

@implementation UARPTLVPersonalizationManifestSuffix

- (UARPTLVPersonalizationManifestSuffix)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationManifestSuffix;
  return [(UARPMetaDataTLVString *)&v3 init];
}

- (void)setManifestSuffix:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  manifestSuffix = v4->_manifestSuffix;
  v4->_manifestSuffix = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationManifestSuffix metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %@>", v5, self->_manifestSuffix];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563340;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationManifestSuffix tlvType];
  manifestSuffix = self->_manifestSuffix;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationManifestSuffix;
  uint64_t v5 = [(UARPMetaDataTLVString *)&v7 generateTLV:v3 tlvValue:manifestSuffix];
  return v5;
}

- (id)tlvValue
{
  manifestSuffix = self->_manifestSuffix;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationManifestSuffix;
  uint64_t v3 = [(UARPMetaDataTLVString *)&v5 tlvValue:manifestSuffix];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Manifest Suffix";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationManifestSuffix tlvType](UARPTLVPersonalizationManifestSuffix, "tlvType"));
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
    [v4 setManifestSuffix:v3];
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
  objc_super v7 = (void *)[[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
  [v6 setManifestSuffix:v7];

  return v6;
}

- (NSString)manifestSuffix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end