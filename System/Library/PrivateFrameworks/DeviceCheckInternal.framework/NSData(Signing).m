@interface NSData(Signing)
- (id)dc_compressedData:()Signing;
@end

@implementation NSData(Signing)

- (id)dc_compressedData:()Signing
{
  uint64_t v5 = [a1 length];
  if (v5 < 0)
  {
    v12 = _DCLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSData(Signing) dc_compressedData:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_9;
  }
  size_t v6 = 2 * v5;
  v7 = (uint8_t *)malloc_type_malloc(2 * v5, 0x7C50DA5EuLL);
  if (!v7)
  {
    v12 = _DCLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSData(Signing) dc_compressedData:](v12, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_9:

    goto LABEL_10;
  }
  v8 = v7;
  id v9 = a1;
  size_t v10 = compression_encode_buffer(v8, v6, (const uint8_t *)[v9 bytes], objc_msgSend(v9, "length"), 0, a3);
  if (v10)
  {
    v11 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v8 length:v10 freeWhenDone:1];
    goto LABEL_11;
  }
  v28 = _DCLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[NSData(Signing) dc_compressedData:](v28, v29, v30, v31, v32, v33, v34, v35);
  }

  free(v8);
LABEL_10:
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)dc_compressedData:()Signing .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dc_compressedData:()Signing .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dc_compressedData:()Signing .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end