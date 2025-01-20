@interface UARPTLVRequiredPersonalizationOption
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVRequiredPersonalizationOption)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)tssOption;
- (void)setTssOption:(unsigned int)a3;
@end

@implementation UARPTLVRequiredPersonalizationOption

- (UARPTLVRequiredPersonalizationOption)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVRequiredPersonalizationOption;
  return [(UARPMetaDataTLV32 *)&v3 init];
}

- (void)setTssOption:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  *(&obj->super.super._tlvLength + 1) = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = +[UARPTLVRequiredPersonalizationOption metaDataTableEntry];
  v4 = NSString;
  v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = +[UARPMetaDataTLV tlvTypeName:*(&self->super.super._tlvLength + 1)];
  v7 = [v4 stringWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

+ (unsigned)tlvType
{
  return -2001563351;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVRequiredPersonalizationOption tlvType];
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVRequiredPersonalizationOption;
  v5 = [(UARPMetaDataTLV32 *)&v7 generateTLV:v3 tlvValue:v4];
  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVRequiredPersonalizationOption;
  uint64_t v3 = [(UARPMetaDataTLV32 *)&v5 tlvValue:v2];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Required Personalization Option";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVRequiredPersonalizationOption tlvType](UARPTLVRequiredPersonalizationOption, "tlvType"));
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
    uint64_t v6 = [v4 unsignedLongValue];

    [v5 setTssOption:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    objc_super v5 = objc_opt_new();
    [v5 setTssOption:uarpHtonl(*(_DWORD *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (unsigned)tssOption
{
  return *(&self->super.super._tlvLength + 1);
}

@end