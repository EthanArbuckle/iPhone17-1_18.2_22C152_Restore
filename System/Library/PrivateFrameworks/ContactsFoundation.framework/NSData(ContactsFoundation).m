@interface NSData(ContactsFoundation)
+ (id)_cn_dataFromHexString:()ContactsFoundation;
- (BOOL)_cn_containsData:()ContactsFoundation;
- (id)_cn_SHA1String;
- (id)_cn_SHA256HashDataWithSalt:()ContactsFoundation;
- (id)_cn_decodeBase64;
- (id)_cn_decodeBase64IgnoringWhitespace;
- (id)_cn_hexString;
- (id)_cn_md5Hash;
- (id)_cn_padDataToLength:()ContactsFoundation;
- (id)_cn_trimTrailingZeros;
- (id)_cn_writeToURL:()ContactsFoundation options:;
- (uint64_t)_cn_distanceFromData:()ContactsFoundation;
@end

@implementation NSData(ContactsFoundation)

- (BOOL)_cn_containsData:()ContactsFoundation
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "rangeOfData:options:range:", v4, 0, 0, objc_msgSend(a1, "length"));

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_decodeBase64
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(a1, "length")) >> 2);
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  uint64_t v5 = [v3 length];
  if (v5 >= 1)
  {
    unint64_t v6 = v4 + v5;
LABEL_3:
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    v9 = (unsigned char *)(v4 + 1);
    uint64_t v10 = 1;
    while (2)
    {
      uint64_t v11 = v10;
      uint64_t v10 = 0;
      switch(Decode64Table[*(v9 - 1) & 0x7F])
      {
        case -5:
          LODWORD(v10) = v7 == 0;
          if (v7) {
            uint64_t v12 = v8;
          }
          else {
            uint64_t v12 = v8 + 1;
          }
          if (v8 >= 2) {
            LODWORD(v10) = 0;
          }
          BOOL v13 = (v11 & 1) == 0;
          if (v11) {
            uint64_t v8 = v12;
          }
          goto LABEL_14;
        case -4:
          if ((v11 & (v7 == 0)) != 0) {
            unint64_t v7 = (unint64_t)(v9 - 1);
          }
          uint64_t v10 = v11;
          goto LABEL_20;
        case -3:
          v19 = v9 - 1;
          if ((unint64_t)v9 < v6 && *v9 == 10) {
            v19 = v9;
          }
          goto LABEL_29;
        case -2:
          v19 = v9 - 1;
LABEL_29:
          uint64_t v17 = (uint64_t)(v19 + 1);
          BOOL v16 = (unint64_t)(v19 + 1) < v6;
          if ((v11 & 1) == 0) {
            goto LABEL_37;
          }
          v18 = v9 - 1;
          goto LABEL_31;
        case -1:
          goto LABEL_20;
        default:
          LODWORD(v10) = (v8 | v7) == 0;
          BOOL v13 = (v11 & 1) == 0;
LABEL_14:
          if (v13) {
            uint64_t v10 = 0;
          }
          else {
            uint64_t v10 = v10;
          }
LABEL_20:
          v14 = v9 + 1;
          if ((unint64_t)v9++ < v6) {
            continue;
          }
          BOOL v16 = 0;
          uint64_t v17 = (uint64_t)(v14 - 1);
          if (v10)
          {
            v18 = 0;
LABEL_31:
            if (!v7) {
              unint64_t v7 = (unint64_t)v18;
            }
            if (!v7) {
              unint64_t v7 = v6;
            }
            uint64_t v20 = v8 + v4;
            unint64_t v21 = v7 - v20;
            if (v7 == v20)
            {
              unint64_t v22 = 0;
            }
            else
            {
              uint64_t v27 = 0;
              unint64_t v22 = 0;
              do
              {
                if ((Decode64Table[*(unsigned char *)(v4 + v27) & 0x7F] & 0x80000000) == 0)
                {
                  unint64_t v22 = Decode64Table[*(unsigned char *)(v4 + v27) & 0x7F] + (v22 << 6);
                  if ((~(_BYTE)v27 & 3) == 0)
                  {
                    char v29 = BYTE2(v22);
                    [v2 appendBytes:&v29 length:1];
                    char v30 = BYTE1(v22);
                    [v2 appendBytes:&v30 length:1];
                    char v31 = v22;
                    [v2 appendBytes:&v31 length:1];
                    unint64_t v22 = 0;
                  }
                }
                ++v27;
              }
              while (v21 != v27);
            }
            if ((v21 & 3) == 2)
            {
              char v34 = v22 >> 4;
              v26 = &v34;
            }
            else
            {
              if ((v21 & 3) != 3) {
                goto LABEL_52;
              }
              char v32 = v22 >> 10;
              [v2 appendBytes:&v32 length:1];
              char v33 = v22 >> 2;
              v26 = &v33;
            }
            v25 = v2;
            uint64_t v24 = 1;
          }
          else
          {
LABEL_37:
            if (v16) {
              unint64_t v23 = v17;
            }
            else {
              unint64_t v23 = v6;
            }
            uint64_t v24 = v23 - v4;
            v25 = v2;
            v26 = (char *)v4;
          }
          [v25 appendBytes:v26 length:v24];
LABEL_52:
          uint64_t v4 = v17;
          if (!v16) {
            goto LABEL_53;
          }
          goto LABEL_3;
      }
    }
  }
LABEL_53:

  return v2;
}

- (id)_cn_decodeBase64IgnoringWhitespace
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(a1, "length")) >> 2);
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  uint64_t v5 = [v3 length];
  if (v5 < 1) {
    goto LABEL_31;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  unint64_t v9 = v4 + v5;
  unint64_t v10 = v4 + 1;
  do
  {
    int v11 = Decode64Table[*(unsigned char *)(v10 - 1) & 0x7F];
    if ((v11 + 4) >= 3)
    {
      if (v11 == -5)
      {
        v7 <<= 6;
        ++v6;
        BOOL v13 = ++v8 < 3;
        goto LABEL_13;
      }
      if (v11 == -1 || v8 != 0) {
        goto LABEL_31;
      }
      unint64_t v8 = 0;
      unint64_t v7 = Decode64Table[*(unsigned char *)(v10 - 1) & 0x7F] + (v7 << 6);
      ++v6;
    }
    BOOL v13 = 1;
LABEL_13:
    if (v6 == 4 && v13)
    {
      char v17 = BYTE2(v7);
      BOOL v13 = 1;
      [v2 appendBytes:&v17 length:1];
      if (v8 > 1)
      {
        unint64_t v7 = 0;
        uint64_t v6 = 0;
      }
      else
      {
        char v18 = BYTE1(v7);
        BOOL v13 = 1;
        [v2 appendBytes:&v18 length:1];
        if (v8)
        {
          unint64_t v7 = 0;
          uint64_t v6 = 0;
          unint64_t v8 = 1;
        }
        else
        {
          char v19 = v7;
          BOOL v13 = 1;
          [v2 appendBytes:&v19 length:1];
          unint64_t v7 = 0;
          uint64_t v6 = 0;
        }
      }
    }
    if (v10 >= v9) {
      break;
    }
    ++v10;
  }
  while (v13);
  if (v6) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    if (v6 == 3)
    {
      char v21 = v7 >> 10;
      [v2 appendBytes:&v21 length:1];
      char v22 = v7 >> 2;
      v15 = &v22;
LABEL_30:
      [v2 appendBytes:v15 length:1];
    }
    else if (v6 == 2)
    {
      char v20 = v7 >> 4;
      v15 = &v20;
      goto LABEL_30;
    }
  }
LABEL_31:

  return v2;
}

- (id)_cn_SHA256HashDataWithSalt:()ContactsFoundation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 dataUsingEncoding:4];
  uint64_t v5 = [MEMORY[0x1E4F1CA58] dataWithData:v4];
  [v5 appendData:a1];
  id v6 = v5;
  CC_SHA256((const void *)[v6 bytes], objc_msgSend(v6, "length"), md);
  uint64_t v7 = 0;
  unint64_t v8 = v13;
  do
  {
    unint64_t v9 = md[v7];
    *(v8 - 1) = cn_nibbleToChar_byteMap[v9 >> 4];
    *unint64_t v8 = cn_nibbleToChar_byteMap[v9 & 0xF];
    v8 += 2;
    ++v7;
  }
  while (v7 != 32);
  unint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v12 length:64];

  return v10;
}

- (id)_cn_md5Hash
{
  v2 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  id v3 = a1;
  uint64_t v4 = (const void *)[v3 bytes];
  LODWORD(v3) = [v3 length];
  id v5 = v2;
  CC_MD5(v4, (CC_LONG)v3, (unsigned __int8 *)[v5 mutableBytes]);

  return v5;
}

- (id)_cn_hexString
{
  uint64_t v2 = [a1 length];
  id v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * v2];
  id v4 = a1;
  uint64_t v5 = [v4 bytes];
  if ([v4 length])
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @"%02lX", *(unsigned __int8 *)(v5 + v6++));
    while (v6 < [v4 length]);
  }
  uint64_t v7 = [NSString stringWithString:v3];

  return v7;
}

- (id)_cn_SHA1String
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v2, "appendFormat:", @"%x", md[i]);

  return v2;
}

+ (id)_cn_dataFromHexString:()ContactsFoundation
{
  id v3 = [a3 lowercaseString];
  id v4 = [MEMORY[0x1E4F1CA58] data];
  __int16 v12 = 0;
  uint64_t v5 = [v3 length];
  unint64_t v6 = v5 - 1;
  if (v5 != 1)
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = v7 + 1;
      unsigned __int8 v9 = [v3 characterAtIndex:v7];
      if ((char)v9 >= 48 && v9 <= 0x66u && v9 - 58 >= 0x27)
      {
        __str[0] = v9;
        __str[1] = [v3 characterAtIndex:v7 + 1];
        HIBYTE(v12) = strtol(__str, 0, 16);
        [v4 appendBytes:(char *)&v12 + 1 length:1];
        unint64_t v8 = v7 + 2;
      }
      unint64_t v7 = v8;
    }
    while (v8 < v6);
  }

  return v4;
}

- (id)_cn_writeToURL:()ContactsFoundation options:
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NSData_ContactsFoundation___cn_writeToURL_options___block_invoke;
  v10[3] = &unk_1E56A1A20;
  v10[4] = a1;
  id v11 = v6;
  uint64_t v12 = a4;
  id v7 = v6;
  unint64_t v8 = +[CNFuture futureWithBlock:v10];

  return v8;
}

- (id)_cn_trimTrailingZeros
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  uint64_t v3 = [v1 length];
  if (v3)
  {
    unint64_t v4 = v3;
    while (!*(unsigned char *)(v2 - 1 + v4))
    {
      if (!--v4) {
        goto LABEL_5;
      }
    }
    if (v4 >= [v1 length])
    {
      id v5 = v1;
    }
    else
    {
      objc_msgSend(v1, "subdataWithRange:", 0, v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_5:
    id v5 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v5;
}

- (id)_cn_padDataToLength:()ContactsFoundation
{
  if ([a1 length] >= a3)
  {
    id v5 = a1;
  }
  else
  {
    id v5 = (id)[a1 mutableCopy];
    objc_msgSend(v5, "increaseLengthBy:", a3 - objc_msgSend(a1, "length"));
  }

  return v5;
}

- (uint64_t)_cn_distanceFromData:()ContactsFoundation
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  if (v5 == [v4 length])
  {
    if (([a1 isEqualToData:v4] & 1) != 0
      || (id v6 = a1,
          id v7 = (char *)[v6 bytes],
          unint64_t v8 = (char *)[v4 bytes],
          (uint64_t v9 = [v6 length]) == 0))
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      do
      {
        char v12 = *v7++;
        char v11 = v12;
        char v13 = *v8++;
        uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)(v13 ^ v11));
        v14.i16[0] = vaddlv_u8(v14);
        v10 += v14.u32[0];
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

@end