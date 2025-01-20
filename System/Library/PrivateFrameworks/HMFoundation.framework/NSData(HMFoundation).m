@interface NSData(HMFoundation)
+ (NSString)shortDescription;
- (__CFString)hmf_hexadecimalStringWithOptions:()HMFoundation;
- (id)hmf_initWithHexadecimalString:()HMFoundation options:;
- (id)shortDescription;
- (uint64_t)hmf_hexadecimalRepresentation;
- (uint64_t)hmf_isZeroed;
@end

@implementation NSData(HMFoundation)

- (id)shortDescription
{
  if (qword_1EB4EECB0 != -1) {
    dispatch_once(&qword_1EB4EECB0, &__block_literal_global_3);
  }
  unint64_t v2 = [a1 length];
  unint64_t v3 = v2 - 8;
  if (v2 > 8)
  {
    unint64_t v5 = v2;
    v6 = objc_msgSend(a1, "subdataWithRange:", 0, 8);
    uint64_t v7 = [v6 length];
    v8 = 0;
    unint64_t v9 = v5 - v7;
    if (v5 != v7)
    {
      if (v3 <= 8) {
        uint64_t v10 = 8;
      }
      else {
        uint64_t v10 = v3;
      }
      if (v9 >= 8) {
        uint64_t v11 = 8;
      }
      else {
        uint64_t v11 = v5 - v7;
      }
      v8 = objc_msgSend(a1, "subdataWithRange:", v10, v11);
    }
    v12 = NSString;
    v13 = [v6 description];
    uint64_t v14 = [v13 stringByTrimmingCharactersInSet:_MergedGlobals_55];
    v15 = (void *)v14;
    if (v9 <= 8) {
      v16 = &stru_1EEF0F5E0;
    }
    else {
      v16 = @" ... ";
    }
    if (v8)
    {
      v17 = [v8 description];
      v18 = [v17 stringByTrimmingCharactersInSet:_MergedGlobals_55];
      v4 = [v12 stringWithFormat:@"<[%tu] %@%@%@>", v5, v15, v16, v18];
    }
    else
    {
      v4 = [v12 stringWithFormat:@"<[%tu] %@%@%@>", v5, v14, v16, &stru_1EEF0F5E0];
    }
  }
  else
  {
    v4 = [a1 description];
  }
  return v4;
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)hmf_isZeroed
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__NSData_HMFoundation__hmf_isZeroed__block_invoke;
  v3[3] = &unk_1E5957820;
  v3[4] = &v4;
  [a1 enumerateByteRangesUsingBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (id)hmf_initWithHexadecimalString:()HMFoundation options:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = v6;
  if (a4)
  {
    uint64_t v8 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EEF0F5E0];

    char v7 = (void *)v8;
  }
  if ([v7 hasPrefix:@"0x"])
  {
    unint64_t v9 = 2;
  }
  else if ([v7 hasPrefix:@"0X"])
  {
    unint64_t v9 = 2;
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v10 = [v7 length];
  unint64_t v11 = v10;
  if (v10)
  {
LABEL_36:
    v26 = 0;
  }
  else
  {
    size_t v12 = (v10 - v9) >> 1;
    v13 = malloc_type_malloc(v12, 0xE54D36D4uLL);
    uint64_t v14 = v13;
    if (v11 > v9)
    {
      v15 = v13;
      do
      {
        if (v11 - v9 >= 0x200) {
          unint64_t v16 = 512;
        }
        else {
          unint64_t v16 = v11 - v9;
        }
        objc_msgSend(v7, "getCharacters:range:", v28, v9, v16);
        if (v16)
        {
          for (unint64_t i = 0; i < v16; i += 2)
          {
            int v18 = (unsigned __int16)v28[i];
            unsigned int v19 = v18 - 48;
            unsigned int v20 = v18 - 65;
            if ((v18 - 97) >= 6) {
              int v21 = -1;
            }
            else {
              int v21 = v18 - 87;
            }
            unsigned int v22 = v18 - 55;
            if (v20 > 5) {
              unsigned int v22 = v21;
            }
            if (v19 <= 9) {
              unsigned int v22 = v19;
            }
            int v23 = (unsigned __int16)v28[i + 1];
            if ((v23 - 48) >= 0xA)
            {
              if ((v23 - 65) >= 6)
              {
                if ((v23 - 97) > 5 || (int v24 = -87, (v22 & 0x80000000) != 0))
                {
LABEL_35:
                  free(v14);
                  goto LABEL_36;
                }
              }
              else
              {
                int v24 = -55;
                if ((v22 & 0x80000000) != 0) {
                  goto LABEL_35;
                }
              }
            }
            else
            {
              int v24 = -48;
              if ((v22 & 0x80000000) != 0) {
                goto LABEL_35;
              }
            }
            int v25 = v24 + v23;
            if (v25 < 0) {
              goto LABEL_35;
            }
            *v15++ = v25 | (16 * v22);
          }
        }
        v9 += v16;
      }
      while (v9 < v11);
    }
    v26 = (void *)[a1 initWithBytesNoCopy:v14 length:v12 freeWhenDone:1];
  }

  return v26;
}

- (__CFString)hmf_hexadecimalStringWithOptions:()HMFoundation
{
  uint64_t v5 = a3 & 1;
  uint64_t v6 = [a1 length];
  if (v6)
  {
    size_t v7 = 2 * (v6 + v5);
    uint64_t v8 = malloc_type_malloc(v7, 0x9851D322uLL);
    unint64_t v9 = v8;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    unint64_t v16 = v8;
    if (v5)
    {
      unsigned char *v8 = 48;
      unint64_t v16 = v8 + 2;
      v8[1] = 120;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__NSData_HMFoundation__hmf_hexadecimalStringWithOptions___block_invoke;
    v13[3] = &unk_1E5957848;
    v13[4] = v15;
    BOOL v14 = (a3 & 2) != 0;
    [a1 enumerateByteRangesUsingBlock:v13];
    uint64_t v10 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:v9 length:v7 encoding:1 freeWhenDone:1];
    _Block_object_dispose(v15, 8);
  }
  else
  {
    unint64_t v11 = @"0x";
    if (!v5) {
      unint64_t v11 = &stru_1EEF0F5E0;
    }
    uint64_t v10 = v11;
  }
  return v10;
}

- (uint64_t)hmf_hexadecimalRepresentation
{
  return objc_msgSend(a1, "hmf_hexadecimalStringWithOptions:", 0);
}

@end