@interface UARPMetaDataTLV64
- (UARPMetaDataTLV64)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(unint64_t)a4;
- (id)tlvValue:(unint64_t)a3;
@end

@implementation UARPMetaDataTLV64

- (UARPMetaDataTLV64)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV64;
  return [(UARPMetaDataTLV *)&v3 init];
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  int v12 = uarpHtonl(a3);
  [v7 appendBytes:&v12 length:4];
  int v11 = uarpHtonl(8u);
  [v7 appendBytes:&v11 length:4];
  v8 = [(UARPMetaDataTLV64 *)self tlvValue:a4];
  [v7 appendData:v8];
  v9 = [MEMORY[0x263EFF8F8] dataWithData:v7];

  return v9;
}

- (id)tlvValue:(unint64_t)a3
{
  unint64_t v5 = uarpHtonll(a3);
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v5 length:8];
  return v3;
}

@end