@interface UARPTLVPayloadCompressionAlgorithm
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
- (UARPTLVPayloadCompressionAlgorithm)init;
- (id)generateTLV;
- (id)tlvValue;
- (int)compressionAlgorithm;
- (unsigned)tlvLength;
- (unsigned)tlvType;
- (void)setCompressionAlgorithm:(int)a3;
@end

@implementation UARPTLVPayloadCompressionAlgorithm

- (UARPTLVPayloadCompressionAlgorithm)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPayloadCompressionAlgorithm;
  result = [(UARPMetaDataTLV *)&v3 init];
  if (result)
  {
    *(&result->super._tlvLength + 1) = -858619636;
    result->_tlvType = 4;
  }
  return result;
}

- (unsigned)tlvType
{
  return *(&self->super._tlvLength + 1);
}

- (unsigned)tlvLength
{
  return self->_tlvType;
}

- (int)compressionAlgorithm
{
  return self->_tlvLength;
}

- (void)setCompressionAlgorithm:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_tlvLength = a3;
  objc_sync_exit(obj);
}

- (id)generateTLV
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  int v8 = uarpHtonl(*(&self->super._tlvLength + 1));
  [v3 appendBytes:&v8 length:4];
  int v7 = uarpHtonl(self->_tlvType);
  [v3 appendBytes:&v7 length:4];
  v4 = [(UARPTLVPayloadCompressionAlgorithm *)self tlvValue];
  [v3 appendData:v4];

  v5 = [MEMORY[0x263EFF8F8] dataWithData:v3];

  return v5;
}

- (id)tlvValue
{
  int v4 = uarpHtonl(self->_tlvLength);
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v4 length:4];
  return v2;
}

+ (id)metaDataTableEntry
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"Payload Compression Algorithm" forKeyedSubscript:@"Name"];
  [v2 setObject:&unk_26CEFE500 forKeyedSubscript:@"Value"];
  id v3 = [NSDictionary dictionaryWithDictionary:v2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = objc_opt_new();
    if ([v4 compare:@"LZBitmapFast2"]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2 * ([v4 compare:@"LZBitmap2"] != 0);
    }
    [v5 setCompressionAlgorithm:v6];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    v5 = objc_opt_new();
    [v5 setCompressionAlgorithm:uarpHtonl(*(_DWORD *)a4)];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end