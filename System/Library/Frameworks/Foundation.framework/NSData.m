@interface NSData
@end

@implementation NSData

void *__54__NSData_NSData___base64EncodingAsString_withOptions___block_invoke(void *result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  for (; a4; --a4)
  {
    unsigned int v5 = *a2++;
    unint64_t v4 = v5;
    unint64_t v6 = *(void *)(*(void *)(result[4] + 8) + 24) % 3uLL;
    switch(v6)
    {
      case 2uLL:
        char v23 = _base64EncodingAsString_withOptions__DataEncodeTable[((unint64_t)(v4 | (*(unsigned __int8 *)(*(void *)(result[7] + 8) + 24) << 8)) >> 6) & 0x3F];
        uint64_t v24 = result[10];
        uint64_t v25 = *(void *)(result[6] + 8);
        uint64_t v26 = *(void *)(v25 + 24);
        *(void *)(v25 + 24) = v26 + 1;
        *(unsigned char *)(v24 + v26) = v23;
        char v27 = _base64EncodingAsString_withOptions__DataEncodeTable[v4 & 0x3F];
        uint64_t v28 = result[10];
        uint64_t v29 = *(void *)(result[6] + 8);
        uint64_t v30 = *(void *)(v29 + 24);
        *(void *)(v29 + 24) = v30 + 1;
        *(unsigned char *)(v28 + v30) = v27;
        break;
      case 1uLL:
        char v19 = _base64EncodingAsString_withOptions__DataEncodeTable[((unint64_t)(v4 | (*(unsigned __int8 *)(*(void *)(result[7] + 8) + 24) << 8)) >> 4) & 0x3F];
        uint64_t v20 = result[10];
        uint64_t v21 = *(void *)(result[6] + 8);
        uint64_t v22 = *(void *)(v21 + 24);
        *(void *)(v21 + 24) = v22 + 1;
        *(unsigned char *)(v20 + v22) = v19;
        break;
      case 0uLL:
        uint64_t v7 = result[6];
        if (result[8])
        {
          uint64_t v8 = *(void *)(*(void *)(result[5] + 8) + 24);
          uint64_t v9 = *(void *)(v7 + 8);
          if (v8 == *(void *)(v9 + 24))
          {
            uint64_t v10 = result[9];
            if ((v10 & 0x10) != 0)
            {
              uint64_t v11 = result[10];
              *(void *)(v9 + 24) = v8 + 1;
              *(unsigned char *)(v11 + v8) = 13;
              uint64_t v10 = result[9];
              uint64_t v7 = result[6];
            }
            if ((v10 & 0x20) != 0)
            {
              uint64_t v12 = result[10];
              uint64_t v13 = *(void *)(v7 + 8);
              uint64_t v14 = *(void *)(v13 + 24);
              *(void *)(v13 + 24) = v14 + 1;
              *(unsigned char *)(v12 + v14) = 10;
              uint64_t v7 = result[6];
            }
            *(void *)(*(void *)(result[5] + 8) + 24) = result[8] + *(void *)(*(void *)(v7 + 8) + 24);
            uint64_t v7 = result[6];
          }
        }
        char v15 = _base64EncodingAsString_withOptions__DataEncodeTable[v4 >> 2];
        uint64_t v16 = result[10];
        uint64_t v17 = *(void *)(v7 + 8);
        uint64_t v18 = *(void *)(v17 + 24);
        *(void *)(v17 + 24) = v18 + 1;
        *(unsigned char *)(v16 + v18) = v15;
        break;
    }
    *(unsigned char *)(*(void *)(result[7] + 8) + 24) = v4;
    ++*(void *)(*(void *)(result[4] + 8) + 24);
  }
  return result;
}

void __32__NSData_NSData__initWithCoder___block_invoke(uint64_t a1)
{
}

uint64_t __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "processBytes:size:", a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

uint64_t __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(result + 32) appendBytes:a2 length:a3];
    }
  }
  return result;
}

uint64_t __38__NSData_NSData__mutableCopyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", a2);
}

uint64_t __78__NSData_NSDataCompression___decompressedDataUsingCompressionAlgorithm_error___block_invoke(uint64_t result, void *a2)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v5 = [a2 bytes];
    uint64_t v6 = [a2 length];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__NSData_NSDataCompression___decompressedDataUsingCompressionAlgorithm_error___block_invoke_2;
    v7[3] = &unk_1E51F7040;
    v7[4] = a2;
    uint64_t result = [v4 initWithBytesNoCopy:v5 length:v6 deallocator:v7];
    *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t __76__NSData_NSDataCompression___compressedDataUsingCompressionAlgorithm_error___block_invoke(uint64_t result, void *a2)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v5 = [a2 bytes];
    uint64_t v6 = [a2 length];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__NSData_NSDataCompression___compressedDataUsingCompressionAlgorithm_error___block_invoke_2;
    v7[3] = &unk_1E51F7040;
    v7[4] = a2;
    uint64_t result = [v4 initWithBytesNoCopy:v5 length:v6 deallocator:v7];
    *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t __55__NSData_NSData___initWithBase64EncodedObject_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) _decodeBase64EncodedCharacterBuffer:a2 length:a4 options:*(void *)(a1 + 48) buffer:*(void *)(a1 + 56) bufferLength:*(void *)(a1 + 64) state:*(void *)(*(void *)(a1 + 40) + 8) + 32];
  if ((result & 1) == 0) {
    *a5 = 1;
  }
  return result;
}

uint64_t __28__NSData_NSData___isCompact__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) length];
  if (a4 != result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  *a5 = 1;
  return result;
}

uint64_t __32__NSData_NSData__isEqualToData___block_invoke(void *a1, const void *a2, uint64_t a3, size_t __n, unsigned char *a5)
{
  uint64_t v7 = a1[5];
  if (!v7) {
    uint64_t v7 = a1[6];
  }
  uint64_t result = memcmp((const void *)(v7 + a3), a2, __n);
  if (result) {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
  }
  *a5 = *(unsigned char *)(*(void *)(a1[4] + 8) + 24) ^ 1;
  return result;
}

uint64_t __32__NSData_NSData__isEqualToData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v9[8] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__NSData_NSData__isEqualToData___block_invoke_3;
  v9[3] = &unk_1E51F70B8;
  v9[6] = a4;
  v9[7] = a2;
  v9[4] = *(void *)(a1 + 40);
  v9[5] = a3;
  uint64_t result = [v7 enumerateByteRangesUsingBlock:v9];
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

void *__32__NSData_NSData__isEqualToData___block_invoke_3(void *result, uint64_t a2, unint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v6 = result;
  unint64_t v7 = result[5];
  unint64_t v8 = result[6] + v7;
  if (v8 <= a3)
  {
    *a5 = 1;
    unint64_t v9 = result[5];
    unint64_t v8 = v9 + result[6];
  }
  else
  {
    unint64_t v9 = result[5];
  }
  if (v8 >= a3 + a4) {
    unint64_t v10 = a3 + a4;
  }
  else {
    unint64_t v10 = v8;
  }
  if (a3 <= v9 && v9 < a3 + a4)
  {
    size_t v13 = v10 - v9;
    if (v10 == v9) {
      return result;
    }
    goto LABEL_19;
  }
  if (v9 <= a3 && a3 < v8)
  {
    size_t v13 = v10 - a3;
    unint64_t v9 = a3;
    if (v10 != a3)
    {
LABEL_19:
      unint64_t v14 = v9 - a3;
      unint64_t v15 = v9 - v7;
      BOOL v16 = a3 >= v7;
      if (a3 >= v7) {
        unint64_t v17 = v15;
      }
      else {
        unint64_t v17 = 0;
      }
      uint64_t v18 = (const void *)(result[7] + v17);
      if (v16) {
        unint64_t v19 = 0;
      }
      else {
        unint64_t v19 = v14;
      }
      uint64_t result = (void *)memcmp(v18, (const void *)(a2 + v19), v13);
      *(unsigned char *)(*(void *)(v6[4] + 8) + 24) = result == 0;
      *a5 = *(unsigned char *)(*(void *)(v6[4] + 8) + 24) ^ 1;
    }
  }
  return result;
}

@end