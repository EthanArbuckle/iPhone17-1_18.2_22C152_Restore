@interface BMDKEventCodec
+ (id)codecWithVersion:(unsigned int)a3;
- (BMDKEventCodec)init;
- (BOOL)decodeMetadata;
- (id)decodeWithProto:(id)a3;
- (id)decodeWithProtoData:(id)a3;
- (id)encodeAsProto:(id)a3;
- (id)encodeAsProtoData:(id)a3;
- (void)setDecodeMetadata:(BOOL)a3;
@end

@implementation BMDKEventCodec

- (id)encodeAsProtoData:(id)a3
{
  v3 = [(BMDKEventCodec *)self encodeAsProto:a3];
  v4 = [v3 data];

  return v4;
}

+ (id)codecWithVersion:(unsigned int)a3
{
  if (a3 == 2)
  {
    v4 = _BMDKEventCodec_DKPREvent;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = _BMDKEventCodec_BMPBDKEvent;
LABEL_5:
    id v5 = objc_alloc_init(v4);
    goto LABEL_9;
  }
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[BMDKEventCodec codecWithVersion:](a3, v6);
  }

  id v5 = 0;
LABEL_9:

  return v5;
}

- (BMDKEventCodec)init
{
  v3.receiver = self;
  v3.super_class = (Class)BMDKEventCodec;
  result = [(BMDKEventCodec *)&v3 init];
  if (result) {
    result->_decodeMetadata = 1;
  }
  return result;
}

- (BOOL)decodeMetadata
{
  return self->_decodeMetadata;
}

- (void)setDecodeMetadata:(BOOL)a3
{
  self->_decodeMetadata = a3;
}

- (id)encodeAsProto:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v3);
  return 0;
}

- (id)decodeWithProto:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v3);
  return 0;
}

- (id)decodeWithProtoData:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_5(v3);
  return 0;
}

+ (void)codecWithVersion:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMDKEventCodec: Invalid data version %u", (uint8_t *)v2, 8u);
}

@end