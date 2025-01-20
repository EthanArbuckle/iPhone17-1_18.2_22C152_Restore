@interface UARPTLVPersonalizationRequired
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationRequired)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)isRequired;
- (void)setIsRequired:(unsigned int)a3;
@end

@implementation UARPTLVPersonalizationRequired

- (UARPTLVPersonalizationRequired)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationRequired;
  return [(UARPMetaDataTLV32 *)&v3 init];
}

- (void)setIsRequired:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  *(&obj->super.super._tlvLength + 1) = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationRequired metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = (void *)v5;
  if (*(&self->super.super._tlvLength + 1)) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [v4 stringWithFormat:@"<%@: %@>", v5, v7];

  return v8;
}

+ (unsigned)tlvType
{
  return -2001563392;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationRequired tlvType];
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationRequired;
  uint64_t v5 = [(UARPMetaDataTLV32 *)&v7 generateTLV:v3 tlvValue:v4];
  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationRequired;
  uint64_t v3 = [(UARPMetaDataTLV32 *)&v5 tlvValue:v2];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Required";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationRequired tlvType](UARPTLVPersonalizationRequired, "tlvType"));
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

    [v5 setIsRequired:v6];
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
    [v5 setIsRequired:uarpHtonl(*(_DWORD *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (unsigned)isRequired
{
  return *(&self->super.super._tlvLength + 1);
}

@end