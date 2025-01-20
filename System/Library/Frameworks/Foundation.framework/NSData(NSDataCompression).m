@interface NSData(NSDataCompression)
- (id)_compressedDataUsingCompressionAlgorithm:()NSDataCompression error:;
- (id)_decompressedDataUsingCompressionAlgorithm:()NSDataCompression error:;
- (uint64_t)compressedDataUsingAlgorithm:()NSDataCompression error:;
- (uint64_t)decompressedDataUsingAlgorithm:()NSDataCompression error:;
- (void)_produceDataWithCompressionOperation:()NSDataCompression algorithm:handler:;
@end

@implementation NSData(NSDataCompression)

- (void)_produceDataWithCompressionOperation:()NSDataCompression algorithm:handler:
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v10 = [_NSDataCompressor alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke;
  v20[3] = &unk_1E51F7130;
  v20[4] = v9;
  v11 = [(_NSDataCompressor *)v10 initWithAlgorithm:a4 operation:a3 dataHandler:v20];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke_2;
  v15[3] = &unk_1E51F7158;
  v15[4] = v11;
  v15[5] = &v16;
  [a1 enumerateByteRangesUsingBlock:v15];
  v12 = v17;
  if (*((unsigned char *)v17 + 24))
  {
    BOOL v13 = [(_NSDataCompressor *)v11 finishProcessing];
    v12 = v17;
  }
  else
  {
    BOOL v13 = 0;
  }
  *((unsigned char *)v12 + 24) = v13;

  if (*((unsigned char *)v17 + 24)) {
    id v14 = v9;
  }
  else {
    id v14 = 0;
  }
  (*(void (**)(uint64_t, id))(a5 + 16))(a5, v14);

  _Block_object_dispose(&v16, 8);
}

- (uint64_t)compressedDataUsingAlgorithm:()NSDataCompression error:
{
  uint64_t v6 = _NSAlgToCompAlg(a3);

  return [a1 _compressedDataUsingCompressionAlgorithm:v6 error:a4];
}

- (uint64_t)decompressedDataUsingAlgorithm:()NSDataCompression error:
{
  uint64_t v6 = _NSAlgToCompAlg(a3);

  return [a1 _decompressedDataUsingCompressionAlgorithm:v6 error:a4];
}

- (id)_compressedDataUsingCompressionAlgorithm:()NSDataCompression error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__1;
  BOOL v13 = __Block_byref_object_dispose__1;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSData_NSDataCompression___compressedDataUsingCompressionAlgorithm_error___block_invoke;
  v8[3] = &unk_1E51F7180;
  v8[4] = &v9;
  [a1 _produceDataWithCompressionOperation:0 algorithm:a3 handler:v8];
  v5 = (void *)v10[5];
  if (a4 && !v5)
  {
    *a4 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:5376 userInfo:0];
    v5 = (void *)v10[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_decompressedDataUsingCompressionAlgorithm:()NSDataCompression error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__1;
  BOOL v13 = __Block_byref_object_dispose__1;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__NSData_NSDataCompression___decompressedDataUsingCompressionAlgorithm_error___block_invoke;
  v8[3] = &unk_1E51F7180;
  v8[4] = &v9;
  [a1 _produceDataWithCompressionOperation:1 algorithm:a3 handler:v8];
  v5 = (void *)v10[5];
  if (a4 && !v5)
  {
    *a4 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:5377 userInfo:0];
    v5 = (void *)v10[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

@end