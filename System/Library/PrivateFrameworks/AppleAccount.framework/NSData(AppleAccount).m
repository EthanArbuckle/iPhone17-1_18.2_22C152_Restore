@interface NSData(AppleAccount)
- (id)aa_compressedData:()AppleAccount;
- (id)aa_hexString;
@end

@implementation NSData(AppleAccount)

- (id)aa_hexString
{
  uint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * v2];
  if (v2 >= 1)
  {
    do
    {
      unsigned int v5 = *v3++;
      objc_msgSend(v4, "appendFormat:", @"%02X", v5);
      --v2;
    }
    while (v2);
  }
  v6 = (void *)[v4 copy];

  return v6;
}

- (id)aa_compressedData:()AppleAccount
{
  uint64_t v5 = [a1 length];
  if (v5 < 0)
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSData(AppleAccount) aa_compressedData:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_9;
  }
  size_t v6 = 2 * v5;
  v7 = (uint8_t *)malloc_type_malloc(2 * v5, 0x79C38BuLL);
  if (!v7)
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSData(AppleAccount) aa_compressedData:](v12, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_9:

    goto LABEL_10;
  }
  v8 = v7;
  id v9 = a1;
  size_t v10 = compression_encode_buffer(v8, v6, (const uint8_t *)[v9 bytes], objc_msgSend(v9, "length"), 0, a3);
  if (v10)
  {
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:v10 freeWhenDone:1];
    goto LABEL_11;
  }
  v28 = _AALogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[NSData(AppleAccount) aa_compressedData:](v28, v29, v30, v31, v32, v33, v34, v35);
  }

  free(v8);
LABEL_10:
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)aa_compressedData:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_compressedData:()AppleAccount .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aa_compressedData:()AppleAccount .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end