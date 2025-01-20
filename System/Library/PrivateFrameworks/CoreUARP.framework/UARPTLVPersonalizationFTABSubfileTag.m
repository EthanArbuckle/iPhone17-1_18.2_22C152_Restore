@interface UARPTLVPersonalizationFTABSubfileTag
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPAssetTag)tag;
- (UARPTLVPersonalizationFTABSubfileTag)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTag:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileTag

- (UARPTLVPersonalizationFTABSubfileTag)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileTag;
  return [(UARPMetaDataTLV *)&v3 init];
}

- (void)setTag:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  tag = v4->_tag;
  v4->_tag = (UARPAssetTag *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = +[UARPTLVPersonalizationFTABSubfileTag metaDataTableEntry];
  v4 = NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = [v4 stringWithFormat:@"<%@: %@>", v5, self->_tag];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563375;
}

- (id)generateTLV
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  int v8 = uarpHtonl(+[UARPTLVPersonalizationFTABSubfileTag tlvType]);
  [v3 appendBytes:&v8 length:4];
  int v7 = uarpHtonl(4u);
  [v3 appendBytes:&v7 length:4];
  v4 = [(UARPTLVPersonalizationFTABSubfileTag *)self tlvValue];
  [v3 appendData:v4];

  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithData:v3];

  return v5;
}

- (id)tlvValue
{
  unsigned int v4 = [(UARPAssetTag *)self->_tag tag];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v4 length:4];
  return v2;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization FTAB Payload Tag";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileTag tlvType](UARPTLVPersonalizationFTABSubfileTag, "tlvType"));
  v6[1] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 length] == 4)
    {
      uint64_t v5 = (char *)[v4 UTF8String];
      v6 = objc_opt_new();
      int v7 = [[UARPAssetTag alloc] initWithChar1:*v5 char2:v5[1] char3:v5[2] char4:v5[3]];
      [v6 setTag:v7];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    uint64_t v5 = objc_opt_new();
    v6 = [[UARPAssetTag alloc] initWithChar1:*(char *)a4 char2:*((char *)a4 + 1) char3:*((char *)a4 + 2) char4:*((char *)a4 + 3)];
    [v5 setTag:v6];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end