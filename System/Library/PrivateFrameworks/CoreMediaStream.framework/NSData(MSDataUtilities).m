@interface NSData(MSDataUtilities)
- (id)MSBase64Encoding;
- (id)MSHexString;
- (id)MSInitWithBase64Encoding:()MSDataUtilities;
@end

@implementation NSData(MSDataUtilities)

- (id)MSHexString
{
  uint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  uint64_t v4 = 2 * v2;
  v5 = malloc_type_malloc((2 * v2) | 1, 0x70C6BC9BuLL);
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A0] format:@"Cannot allocate space for hex conversion buffer"];
  }
  v6 = v5;
  if (v2)
  {
    v7 = v5;
    do
    {
      unsigned int v8 = *v3++;
      unsigned char *v7 = a0123456789abcd[(unint64_t)v8 >> 4];
      v6 = v7 + 2;
      v7[1] = a0123456789abcd[v8 & 0xF];
      v7 += 2;
      --v2;
    }
    while (v2);
  }
  unsigned char *v6 = 0;
  v9 = (void *)[[NSString alloc] initWithBytes:v5 length:v4 encoding:1];
  free(v5);
  return v9;
}

- (id)MSBase64Encoding
{
  unint64_t v2 = [a1 length];
  unint64_t v3 = v2 % 3;
  size_t v4 = 4 * (v2 / 3) + 4 * (v2 % 3 != 0);
  if (v4 < v2) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8] format:@"data is too large to encode"];
  }
  v5 = malloc_type_malloc(v4, 0xE99ED157uLL);
  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A0], @"unable to allocate memory for length (%lu)", v4);
  }
  uint64_t v6 = [a1 bytes];
  if (!v2) {
    goto LABEL_21;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  v9 = (unsigned __int8 *)(v6 - 1);
  do
  {
    unint64_t v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      uint64_t v12 = v7 + 1;
      v5[v7] = MSPCUCreateBase64StringFromData_DataEncodeTable[((unint64_t)(v9[1] | (*v9 << 8)) >> 6) & 0x3F];
      unint64_t v11 = v9[1] & 0x3F;
      uint64_t v13 = 2;
    }
    else
    {
      if (v10 == 1)
      {
        unint64_t v11 = ((unint64_t)(v9[1] | (*v9 << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v10) {
          goto LABEL_15;
        }
        unint64_t v11 = (unint64_t)v9[1] >> 2;
      }
      uint64_t v13 = 1;
      uint64_t v12 = v7;
    }
    v7 += v13;
    v5[v12] = MSPCUCreateBase64StringFromData_DataEncodeTable[v11];
LABEL_15:
    ++v8;
    ++v9;
    --v2;
  }
  while (v2);
  if (v3 == 2)
  {
    char v16 = MSPCUCreateBase64StringFromData_DataEncodeTable[4 * (*v9 & 0xF)];
    uint64_t v17 = 1;
    uint64_t v15 = v7;
LABEL_20:
    v5[v15] = v16;
    v5[v7 + v17] = 61;
  }
  else if (v3 == 1)
  {
    char v14 = MSPCUCreateBase64StringFromData_DataEncodeTable[16 * (*v9 & 3)];
    uint64_t v15 = v7 + 1;
    v5[v7] = v14;
    char v16 = 61;
    uint64_t v17 = 2;
    goto LABEL_20;
  }
LABEL_21:
  v18 = (void *)[[NSString alloc] initWithBytesNoCopy:v5 length:v4 encoding:1 freeWhenDone:1];
  return v18;
}

- (id)MSInitWithBase64Encoding:()MSDataUtilities
{
  id v23 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  v5 = malloc_type_malloc(3 * (v4 >> 2), 0xB54753B8uLL);
  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A0], @"Unable to allocate memory for length (%lu)", 3 * (v4 >> 2));
  }
  v24 = &v22;
  v25 = v5;
  if (v4 >= 0x3E8) {
    unint64_t v6 = 1000;
  }
  else {
    unint64_t v6 = v4;
  }
  uint64_t v7 = (char *)&v22 - ((2 * (_WORD)v6 + 15) & 0xFF0);
  id v26 = v3;
  objc_msgSend(v3, "getCharacters:range:", v7, 0, v6);
  if (v4)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    char v14 = 0;
    unint64_t v15 = v6;
    while (1)
    {
      if (v8 >= v6)
      {
        if (v4 - (v11 + v15) < v6) {
          unint64_t v15 = v4 - (v11 + v15);
        }
        objc_msgSend(v26, "getCharacters:range:", v7, v9, v15);
        unint64_t v8 = 0;
        uint64_t v11 = v9;
      }
      uint64_t v16 = *(unsigned __int16 *)&v7[2 * v8];
      if (v16 > 0x7F || MSInitWithBase64Encoding__DataDecodeTable[v16] < 0) {
        goto LABEL_19;
      }
      if (v16 == 61)
      {
        if ((v14 & 3) == 0) {
          goto LABEL_19;
        }
        ++v13;
      }
      else if (v13)
      {
        goto LABEL_28;
      }
      ++v14;
      int v10 = MSInitWithBase64Encoding__DataDecodeTable[v16] + (v10 << 6);
      if ((v14 & 3) == 0)
      {
        v18 = v25;
        v25[v12] = BYTE2(v10);
        if (v13 > 1)
        {
          uint64_t v17 = v12 + 1;
        }
        else
        {
          uint64_t v17 = v12 + 2;
          v18[v12 + 1] = BYTE1(v10);
          if (v13)
          {
            unint64_t v13 = 1;
          }
          else
          {
            v18[v17] = v10;
            uint64_t v17 = v12 + 3;
          }
        }
        goto LABEL_20;
      }
LABEL_19:
      uint64_t v17 = v12;
LABEL_20:
      ++v9;
      ++v8;
      uint64_t v12 = v17;
      if (v4 == v9) {
        goto LABEL_29;
      }
    }
  }
  char v14 = 0;
  unint64_t v13 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
LABEL_28:
  uint64_t v17 = v12;
  if (v9 == v4)
  {
LABEL_29:
    if ((v14 & 3) == 0 && v13 <= 2)
    {
      id v19 = v23;
      v20 = (void *)[v19 initWithBytesNoCopy:v25 length:v17 freeWhenDone:1];
      goto LABEL_33;
    }
  }
  free(v25);
  v20 = 0;
LABEL_33:

  return v20;
}

@end