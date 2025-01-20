@interface UARPMetaDataTLV8
- (UARPMetaDataTLV8)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned __int8)a4;
- (id)tlvValue:(unsigned __int8)a3;
@end

@implementation UARPMetaDataTLV8

- (UARPMetaDataTLV8)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV8;
  return [(UARPMetaDataTLV *)&v3 init];
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  int v12 = uarpHtonl(a3);
  [v7 appendBytes:&v12 length:4];
  int v11 = uarpHtonl(1u);
  [v7 appendBytes:&v11 length:4];
  v8 = [(UARPMetaDataTLV8 *)self tlvValue:v4];
  [v7 appendData:v8];
  v9 = [MEMORY[0x263EFF8F8] dataWithData:v7];

  return v9;
}

- (id)tlvValue:(unsigned __int8)a3
{
  unsigned __int8 v5 = a3;
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v5 length:1];
  return v3;
}

@end