@interface NSData(DYNSDataCompressionAdditions)
+ (uint64_t)DYCompressionAlgorithmFromString:()DYNSDataCompressionAdditions;
+ (uint64_t)DYStringFromCompressionAlgorithm:()DYNSDataCompressionAdditions;
- (uint64_t)dy_compressedDataWithAlgorithm:()DYNSDataCompressionAdditions;
- (uint64_t)dy_decompressedDataWithAlgorithm:()DYNSDataCompressionAdditions outputLength:;
@end

@implementation NSData(DYNSDataCompressionAdditions)

+ (uint64_t)DYCompressionAlgorithmFromString:()DYNSDataCompressionAdditions
{
  if ([a3 isEqualToString:*MEMORY[0x263F3FEA8]]) {
    return 0;
  }
  if ([a3 isEqualToString:*MEMORY[0x263F3FEB0]]) {
    return 1;
  }
  if ([a3 isEqualToString:*MEMORY[0x263F3FEA0]]) {
    return 2;
  }
  if ([a3 isEqualToString:*MEMORY[0x263F3FE98]]) {
    return 3;
  }
  return 0;
}

+ (uint64_t)DYStringFromCompressionAlgorithm:()DYNSDataCompressionAdditions
{
  switch(a3)
  {
    case 0:
      v3 = (uint64_t *)MEMORY[0x263F3FEA8];
      goto LABEL_7;
    case 1:
      v3 = (uint64_t *)MEMORY[0x263F3FEB0];
      goto LABEL_7;
    case 2:
      v3 = (uint64_t *)MEMORY[0x263F3FEA0];
      goto LABEL_7;
    case 3:
      v3 = (uint64_t *)MEMORY[0x263F3FE98];
LABEL_7:
      uint64_t result = *v3;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (uint64_t)dy_compressedDataWithAlgorithm:()DYNSDataCompressionAdditions
{
  v3 = a1;
  if (!a3) {
    return (uint64_t)v3;
  }
  if (a3 == 1) {
    int v4 = 517;
  }
  else {
    int v4 = 2049;
  }
  if (a3 == 3) {
    compression_algorithm v5 = COMPRESSION_LZ4;
  }
  else {
    compression_algorithm v5 = v4;
  }
  size_t v6 = [a1 length];
  v7 = (const uint8_t *)[v3 bytes];
  v8 = (uint8_t *)malloc_type_malloc(v6 + 128, 0x71A70526uLL);
  mach_absolute_time();
  size_t v9 = compression_encode_buffer(v8, v6 + 128, v7, v6, 0, v5);
  if (!v9 || (size_t v10 = v9, (v11 = malloc_type_realloc(v8, v9, 0x7C7DC975uLL)) == 0))
  {
    free(v8);
    return 0;
  }
  v12 = v11;
  v13 = (void *)MEMORY[0x263EFF8F8];
  return [v13 dataWithBytesNoCopy:v12 length:v10 freeWhenDone:1];
}

- (uint64_t)dy_decompressedDataWithAlgorithm:()DYNSDataCompressionAdditions outputLength:
{
  int v4 = a1;
  if (!a3) {
    return (uint64_t)v4;
  }
  if (a3 == 1) {
    int v6 = 517;
  }
  else {
    int v6 = 2049;
  }
  if (a3 == 3) {
    compression_algorithm v7 = COMPRESSION_LZ4;
  }
  else {
    compression_algorithm v7 = v6;
  }
  uint64_t v8 = [a1 length];
  if (!v8) {
    return 0;
  }
  size_t v9 = v8;
  size_t v10 = (const uint8_t *)[v4 bytes];
  v11 = (uint8_t *)malloc_type_malloc(a4, 0x65CCCB78uLL);
  mach_absolute_time();
  size_t v12 = compression_decode_buffer(v11, a4, v10, v9, 0, v7);
  if (a4 && !v12)
  {
    free(v11);
    return 0;
  }
  v14 = (void *)MEMORY[0x263EFF8F8];
  return [v14 dataWithBytesNoCopy:v11 length:a4 freeWhenDone:1];
}

@end