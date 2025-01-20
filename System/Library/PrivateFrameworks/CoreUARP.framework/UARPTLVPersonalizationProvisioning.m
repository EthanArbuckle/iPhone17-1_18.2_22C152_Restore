@interface UARPTLVPersonalizationProvisioning
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationProvisioning)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)provisioning;
- (void)setProvisioning:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationProvisioning

- (UARPTLVPersonalizationProvisioning)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationProvisioning;
  return [(UARPMetaDataTLV8 *)&v3 init];
}

- (void)setProvisioning:(unsigned __int8)a3
{
  obj = self;
  objc_sync_enter(obj);
  *((unsigned char *)&obj->super.super._tlvLength + 4) = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationProvisioning metaDataTableEntry];
  v4 = NSString;
  v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: 0x%02x>", v5, *((unsigned __int8 *)&self->super.super._tlvLength + 4)];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563342;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationProvisioning tlvType];
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationProvisioning;
  v5 = [(UARPMetaDataTLV8 *)&v7 generateTLV:v3 tlvValue:v4];
  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationProvisioning;
  uint64_t v3 = [(UARPMetaDataTLV8 *)&v5 tlvValue:v2];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Provisioning";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationProvisioning tlvType](UARPTLVPersonalizationProvisioning, "tlvType"));
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
    id v4 = v3;
    objc_super v5 = objc_opt_new();
    uint64_t v6 = [v4 unsignedCharValue];

    [v5 setProvisioning:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 1)
  {
    objc_super v5 = objc_opt_new();
    [v5 setProvisioning:*(unsigned __int8 *)a4];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (unsigned)provisioning
{
  return *((unsigned char *)&self->super.super._tlvLength + 4);
}

@end