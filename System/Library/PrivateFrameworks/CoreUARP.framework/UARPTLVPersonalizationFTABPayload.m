@interface UARPTLVPersonalizationFTABPayload
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSArray)tlvs;
- (UARPTLVPersonalizationFTABPayload)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTLVs:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABPayload

- (UARPTLVPersonalizationFTABPayload)init
{
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABPayload;
  v2 = [(UARPMetaDataTLV *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tlvs = v2->_tlvs;
    v2->_tlvs = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)setTLVs:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 bytes];
  if ([v11 length])
  {
    unint64_t v5 = 0;
    do
    {
      if (v5 + 4 > [v11 length]) {
        break;
      }
      uint64_t v6 = uarpHtonl(*(_DWORD *)(v4 + v5));
      unint64_t v7 = v5 + 8;
      if (v5 + 8 > [v11 length]) {
        break;
      }
      uint64_t v8 = uarpHtonl(*(_DWORD *)(v4 + v5 + 4));
      unint64_t v5 = v7 + v8;
      if (v5 > [v11 length]) {
        break;
      }
      uint64_t v9 = +[UARPMetaDataTLV tlvFromType:v6 length:v8 value:v4 + v7];
      if (!v9) {
        break;
      }
      v10 = (void *)v9;
      [(NSMutableArray *)self->_tlvs addObject:v9];
    }
    while (v5 < [v11 length]);
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[UARPTLVPersonalizationFTABPayload metaDataTableEntry];
  uint64_t v4 = objc_opt_new();
  unint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  [v4 appendFormat:@"<%@: \r", v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_tlvs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 appendFormat:@"        <%@>\r", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v4 appendFormat:@"    >"];
  id v11 = [NSString stringWithString:v4];

  return v11;
}

+ (unsigned)tlvType
{
  return -2001563376;
}

- (id)generateTLV
{
  return 0;
}

- (id)tlvValue
{
  return 0;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization FTAB Payload";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABPayload tlvType](UARPTLVPersonalizationFTABPayload, "tlvType"));
  v6[1] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a3];
  unint64_t v5 = objc_opt_new();
  [v5 setTLVs:v4];

  return v5;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end