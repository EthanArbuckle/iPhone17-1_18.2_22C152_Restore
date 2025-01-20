@interface UARPTLVPersonalizationManifestPrefix
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)ticketPrefix;
- (UARPTLVPersonalizationManifestPrefix)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTicketPrefix:(id)a3;
@end

@implementation UARPTLVPersonalizationManifestPrefix

- (UARPTLVPersonalizationManifestPrefix)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationManifestPrefix;
  return [(UARPMetaDataTLVString *)&v3 init];
}

- (void)setTicketPrefix:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  ticketPrefix = v4->_ticketPrefix;
  v4->_ticketPrefix = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationManifestPrefix metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %@>", v5, self->_ticketPrefix];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563389;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationManifestPrefix tlvType];
  ticketPrefix = self->_ticketPrefix;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationManifestPrefix;
  uint64_t v5 = [(UARPMetaDataTLVString *)&v7 generateTLV:v3 tlvValue:ticketPrefix];
  return v5;
}

- (id)tlvValue
{
  ticketPrefix = self->_ticketPrefix;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationManifestPrefix;
  uint64_t v3 = [(UARPMetaDataTLVString *)&v5 tlvValue:ticketPrefix];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Manifest Prefix";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationManifestPrefix tlvType](UARPTLVPersonalizationManifestPrefix, "tlvType"));
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
    [v4 setTicketPrefix:v3];
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
  [v6 setTicketPrefix:v7];

  return v6;
}

- (NSString)ticketPrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end