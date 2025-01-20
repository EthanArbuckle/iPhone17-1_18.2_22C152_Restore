@interface UARPTLVPersonalizationFTABSubfileLongname
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)longname;
- (UARPTLVPersonalizationFTABSubfileLongname)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setLongname:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileLongname

- (UARPTLVPersonalizationFTABSubfileLongname)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongname;
  return [(UARPMetaDataTLVString *)&v3 init];
}

- (void)setLongname:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  longname = v4->_longname;
  v4->_longname = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationFTABSubfileLongname metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %@>", v5, self->_longname];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563374;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileLongname tlvType];
  longname = self->_longname;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongname;
  uint64_t v5 = [(UARPMetaDataTLVString *)&v7 generateTLV:v3 tlvValue:longname];
  return v5;
}

- (id)tlvValue
{
  longname = self->_longname;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongname;
  uint64_t v3 = [(UARPMetaDataTLVString *)&v5 tlvValue:longname];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization FTAB Payload Longname";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileLongname tlvType](UARPTLVPersonalizationFTABSubfileLongname, "tlvType"));
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
    [v4 setLongname:v3];
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
  [v5 setLongname:v6];

  free(v4);
  return v5;
}

- (NSString)longname
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end