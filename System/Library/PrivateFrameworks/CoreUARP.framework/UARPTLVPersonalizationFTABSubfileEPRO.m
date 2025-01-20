@interface UARPTLVPersonalizationFTABSubfileEPRO
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationFTABSubfileEPRO)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)epro;
- (void)setEpro:(unsigned __int16)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileEPRO

- (UARPTLVPersonalizationFTABSubfileEPRO)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileEPRO;
  return [(UARPMetaDataTLV16 *)&v3 init];
}

- (void)setEpro:(unsigned __int16)a3
{
  obj = self;
  objc_sync_enter(obj);
  *((_WORD *)&obj->super.super._tlvLength + 2) = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationFTABSubfileEPRO metaDataTableEntry];
  v4 = NSString;
  v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %u>", v5, *((unsigned __int16 *)&self->super.super._tlvLength + 2)];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563370;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileEPRO tlvType];
  uint64_t v4 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationFTABSubfileEPRO;
  v5 = [(UARPMetaDataTLV16 *)&v7 generateTLV:v3 tlvValue:v4];
  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationFTABSubfileEPRO;
  uint64_t v3 = [(UARPMetaDataTLV16 *)&v5 tlvValue:v2];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization FTAB Payload Production Mode";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileEPRO tlvType](UARPTLVPersonalizationFTABSubfileEPRO, "tlvType"));
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
    uint64_t v6 = [v4 unsignedShortValue];

    [v5 setEpro:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 2)
  {
    objc_super v5 = objc_opt_new();
    [v5 setEpro:uarpHtons(*(unsigned __int16 *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (unsigned)epro
{
  return *((_WORD *)&self->super.super._tlvLength + 2);
}

@end