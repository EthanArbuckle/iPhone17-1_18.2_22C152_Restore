@interface UARPTLVPersonalizationECID
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationECID)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unint64_t)ecID;
- (void)setEcID:(unint64_t)a3;
@end

@implementation UARPTLVPersonalizationECID

- (UARPTLVPersonalizationECID)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationECID;
  return [(UARPMetaDataTLV64 *)&v3 init];
}

- (void)setEcID:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_ecID = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationECID metaDataTableEntry];
  v4 = NSString;
  v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: 0x%016llx>", v5, self->_ecID];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563386;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationECID tlvType];
  unint64_t ecID = self->_ecID;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationECID;
  v5 = [(UARPMetaDataTLV64 *)&v7 generateTLV:v3 tlvValue:ecID];
  return v5;
}

- (id)tlvValue
{
  unint64_t ecID = self->_ecID;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationECID;
  uint64_t v3 = [(UARPMetaDataTLV64 *)&v5 tlvValue:ecID];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization ECID";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationECID tlvType](UARPTLVPersonalizationECID, "tlvType"));
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
    uint64_t v6 = [v4 unsignedLongLongValue];

    [v5 setEcID:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 8)
  {
    objc_super v5 = objc_opt_new();
    [v5 setEcID:uarpHtonll(*(void *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

@end