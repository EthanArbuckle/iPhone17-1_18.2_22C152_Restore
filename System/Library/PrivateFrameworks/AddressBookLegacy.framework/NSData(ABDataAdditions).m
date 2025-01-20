@interface NSData(ABDataAdditions)
- (BOOL)abIsUTF16EntourageVCard;
- (char)abDecodedUTF7;
- (id)abStringAtRange:()ABDataAdditions inEncoding:;
- (uint64_t)abEncodeVCardBase64DataWithInitialLength:()ABDataAdditions;
- (void)abDecodeVCardBase64;
@end

@implementation NSData(ABDataAdditions)

- (id)abStringAtRange:()ABDataAdditions inEncoding:
{
  v6 = objc_msgSend(a1, "subdataWithRange:");
  if (a5 == 4000100)
  {
    return (id)[v6 abDecodedUTF7];
  }
  else
  {
    v8 = (void *)[[NSString alloc] initWithData:v6 encoding:a5];
    return v8;
  }
}

- (BOOL)abIsUTF16EntourageVCard
{
  unint64_t v2 = [a1 length];
  if (v2 >= 0x16) {
    unint64_t v3 = 22;
  }
  else {
    unint64_t v3 = v2;
  }
  if (v3)
  {
    unint64_t v4 = 0;
    int v5 = 0;
    char v8 = 0;
    do
    {
      objc_msgSend(a1, "getBytes:range:", &v8, v4, 1);
      if (!v8) {
        ++v5;
      }
      v4 += 2;
    }
    while (v4 < v3);
    double v6 = (float)v5;
  }
  else
  {
    double v6 = 0.0;
  }
  return v6 / ((double)v3 * 0.5) > 0.8;
}

- (uint64_t)abEncodeVCardBase64DataWithInitialLength:()ABDataAdditions
{
  unint64_t v5 = 4 * [a1 length] / 3uLL;
  double v6 = (int *)NSZoneMalloc(0, 0x10uLL);
  if (v5 <= 1) {
    LODWORD(v5) = 1;
  }
  *(void *)double v6 = NSZoneMalloc(0, (int)v5);
  v6[2] = 0;
  v6[3] = v5;
  v7 = (unsigned char *)[a1 bytes];
  uint64_t v8 = [a1 length];
  if (v8 < 1) {
    goto LABEL_18;
  }
  unint64_t v9 = v8;
  unint64_t v10 = 0;
  uint64_t v11 = v8;
  do
  {
    unint64_t v12 = v10 % 3;
    if (v10 % 3 == 2)
    {
      a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[((unint64_t)(*v7 | (*(v7 - 1) << 8)) >> 6) & 0x3F], a3);
      unint64_t v13 = *v7 & 0x3F;
    }
    else if (v12 == 1)
    {
      unint64_t v13 = ((unint64_t)(*v7 | (*(v7 - 1) << 8)) >> 4) & 0x3F;
    }
    else
    {
      if (v12) {
        goto LABEL_12;
      }
      unint64_t v13 = (unint64_t)*v7 >> 2;
    }
    a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[v13], a3);
LABEL_12:
    ++v10;
    ++v7;
    --v11;
  }
  while (v11);
  if (v9 % 3 == 2)
  {
    char v16 = Encode64Table[4 * (*(v7 - 1) & 0xF)];
    uint64_t v15 = (uint64_t)v6;
    uint64_t v14 = a3;
LABEL_17:
    uint64_t v17 = appendToBufferWithLineFolding(v15, v16, v14);
    appendToBufferWithLineFolding((uint64_t)v6, 61, v17);
  }
  else if (v9 % 3 == 1)
  {
    uint64_t v14 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[16 * (*(v7 - 1) & 3)], a3);
    uint64_t v15 = (uint64_t)v6;
    char v16 = 61;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)v6 length:v6[2]];
  NSZoneFree(0, v6);
  return v18;
}

- (char)abDecodedUTF7
{
  unint64_t v2 = (char *)[a1 length];
  if (v2)
  {
    __int16 v14 = 0;
    unint64_t v3 = (char *)[a1 bytes];
    unint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v2];
    id v5 = 0;
    char v6 = 0;
    while (1)
    {
      int v8 = *v3++;
      int v7 = v8;
      char v15 = v8;
      if (v6)
      {
        BOOL v10 = (v7 - 48) >= 0xA
           && (v7 - 64) >= 0x1Bu
           && (v7 - 97) >= 0x1Au;
        if (v10 && ((v7 - 43) & 0xFB) != 0)
        {
          uint64_t v11 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
          unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];

          if (v12)
          {
            [v4 appendData:v12];

            id v5 = 0;
          }
          LOWORD(v7) = v15;
          if (v15 != 45)
          {
LABEL_20:
            __int16 v14 = v7;
            [v4 appendBytes:&v14 length:2];
          }
          char v6 = 0;
          goto LABEL_22;
        }
        char v6 = 1;
        [v5 appendBytes:&v15 length:1];
      }
      else
      {
        if (v7 != 43) {
          goto LABEL_20;
        }

        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        char v6 = 1;
      }
LABEL_22:
      if (!--v2)
      {
        unint64_t v2 = (char *)(id)[[NSString alloc] initWithData:v4 encoding:10];

        return v2;
      }
    }
  }
  return v2;
}

- (void)abDecodeVCardBase64
{
  unint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(a1, "length")) >> 2);
  uint64_t v3 = [a1 bytes];
  uint64_t v4 = [a1 length];
  if (v4 < 1) {
    return v2;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  unint64_t v8 = v3 + v4;
  unint64_t v9 = v3 + 1;
  do
  {
    int v10 = Decode64Table[*(unsigned char *)(v9 - 1) & 0x7F];
    if ((v10 + 4) >= 3)
    {
      if (v10 == -5)
      {
        v5 <<= 6;
        ++v7;
        BOOL v12 = ++v6 < 3;
        goto LABEL_13;
      }
      if (v10 == -1 || v6 != 0) {
        return v2;
      }
      unint64_t v6 = 0;
      unint64_t v5 = Decode64Table[*(unsigned char *)(v9 - 1) & 0x7F] + (v5 << 6);
      ++v7;
    }
    BOOL v12 = 1;
LABEL_13:
    if (v7 == 4 && v12)
    {
      char v16 = BYTE2(v5);
      BOOL v12 = 1;
      [v2 appendBytes:&v16 length:1];
      if (v6 > 1)
      {
        uint64_t v7 = 0;
        unint64_t v5 = 0;
      }
      else
      {
        char v17 = BYTE1(v5);
        BOOL v12 = 1;
        [v2 appendBytes:&v17 length:1];
        if (v6)
        {
          uint64_t v7 = 0;
          unint64_t v5 = 0;
          unint64_t v6 = 1;
        }
        else
        {
          char v18 = v5;
          BOOL v12 = 1;
          [v2 appendBytes:&v18 length:1];
          uint64_t v7 = 0;
          unint64_t v5 = 0;
        }
      }
    }
    if (v9 >= v8) {
      break;
    }
    ++v9;
  }
  while (v12);
  if (v7) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    if (v7 == 3)
    {
      char v20 = v5 >> 10;
      [v2 appendBytes:&v20 length:1];
      char v21 = v5 >> 2;
      __int16 v14 = &v21;
LABEL_30:
      [v2 appendBytes:v14 length:1];
    }
    else if (v7 == 2)
    {
      char v19 = v5 >> 4;
      __int16 v14 = &v19;
      goto LABEL_30;
    }
  }
  return v2;
}

@end