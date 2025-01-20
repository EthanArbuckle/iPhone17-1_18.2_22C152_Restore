@interface UARPMetaDataTLVData
- (UARPMetaDataTLVData)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4;
@end

@implementation UARPMetaDataTLVData

- (UARPMetaDataTLVData)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVData;
  return [(UARPMetaDataTLV *)&v3 init];
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF990];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  int v11 = uarpHtonl(a3);
  [v7 appendBytes:&v11 length:4];
  int v10 = uarpHtonl([v6 length]);
  [v7 appendBytes:&v10 length:4];
  [v7 appendData:v6];

  v8 = [MEMORY[0x263EFF8F8] dataWithData:v7];

  return v8;
}

@end