@interface NSData(CKUtilsAdditions)
+ (id)CKDataWithHexString:()CKUtilsAdditions stringIsUppercase:;
+ (uint64_t)CKDataWithHexString:()CKUtilsAdditions;
- (id)CKHexString;
- (id)CKLowercaseHexStringWithoutSpaces;
- (id)CKUppercaseHexStringWithoutSpaces;
@end

@implementation NSData(CKUtilsAdditions)

- (id)CKHexString
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  unint64_t v3 = [v1 length];
  if (v3 > 0x5555555555555555)
  {
    uint64_t v4 = 0;
    v5 = 0;
    goto LABEL_27;
  }
  unint64_t v6 = v3;
  v7 = malloc_type_calloc(1uLL, ((9 * v3) >> 2) & 0x1FFFFFFFFFFFFFFFLL, 0x9D46FE2BuLL);
  v5 = v7;
  if (v6 >= 5)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v2;
    v10 = v7;
    do
    {
      uint64_t v11 = 0;
      ++v10;
      do
      {
        if (*(unsigned __int8 *)(v9 + v11) <= 0x9Fu) {
          char v12 = 48;
        }
        else {
          char v12 = 87;
        }
        *(v10 - 1) = v12 + (*(unsigned char *)(v9 + v11) >> 4);
        unsigned int v13 = *(unsigned char *)(v9 + v11) & 0xF;
        if (v13 <= 9) {
          char v14 = 48;
        }
        else {
          char v14 = 87;
        }
        unsigned char *v10 = v14 + v13;
        v10 += 2;
        ++v11;
      }
      while (v11 != 4);
      *(v10 - 1) = 32;
      v8 += 4;
      v6 -= 4;
      v9 += 4;
    }
    while (v6 > 4);
    if (!v6) {
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  uint64_t v8 = 0;
  v10 = v7;
  if (v6)
  {
LABEL_17:
    v15 = (char *)(v2 + v8);
    do
    {
      if (*v15 <= 0x9Fu) {
        char v16 = 48;
      }
      else {
        char v16 = 87;
      }
      unsigned char *v10 = v16 + (*v15 >> 4);
      char v17 = *v15++;
      unsigned int v18 = v17 & 0xF;
      if (v18 <= 9) {
        char v19 = 48;
      }
      else {
        char v19 = 87;
      }
      char v20 = v19 + v18;
      v21 = v10 + 2;
      v10[1] = v20;
      v10 += 2;
      --v6;
    }
    while (v6);
    v10 = v21;
  }
LABEL_26:
  uint64_t v4 = v10 - v7;
LABEL_27:
  v22 = (void *)[[NSString alloc] initWithBytesNoCopy:v5 length:v4 encoding:1 freeWhenDone:1];

  return v22;
}

- (id)CKLowercaseHexStringWithoutSpaces
{
  id v1 = [a1 CKHexString];
  uint64_t v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_26D5A68A0, 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)CKUppercaseHexStringWithoutSpaces
{
  id v1 = [a1 CKHexString];
  uint64_t v2 = [v1 uppercaseString];
  unint64_t v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_26D5A68A0, 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)CKDataWithHexString:()CKUtilsAdditions stringIsUppercase:
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  if (a4) {
    v7 = @"0123456789ABCDEF";
  }
  else {
    v7 = @"0123456789abcdef";
  }
  if (a4) {
    char v8 = -65;
  }
  else {
    char v8 = -97;
  }
  uint64_t v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v7];
  if ([v5 length])
  {
    unsigned int v10 = 0;
    do
    {
      unint64_t v11 = v10;
      if ([v5 length] <= (unint64_t)v10)
      {
        LODWORD(v13) = 0;
        char v16 = 1;
      }
      else
      {
        unsigned int v12 = v10 + 1;
        do
        {
          unsigned int v10 = v12;
          uint64_t v13 = [v5 characterAtIndex:v11];
          char v14 = [v9 characterIsMember:v13];
          unint64_t v11 = v10;
          if (v14) {
            break;
          }
          unint64_t v15 = [v5 length];
          unsigned int v12 = v10 + 1;
        }
        while (v15 > v10);
        char v16 = v14 ^ 1;
      }
      if ([v5 length] <= v11) {
        break;
      }
      ++v10;
      while (1)
      {
        uint64_t v17 = [v5 characterAtIndex:v11];
        if ([v9 characterIsMember:v17]) {
          break;
        }
        unint64_t v11 = v10;
        if ([v5 length] <= (unint64_t)v10++) {
          goto LABEL_27;
        }
      }
      if (v16) {
        break;
      }
      if ((v13 - 48) >= 0xA) {
        char v19 = v13 + 9;
      }
      else {
        char v19 = v13;
      }
      char v20 = v17 - 48;
      if ((v17 - 48) >= 0xA) {
        char v20 = v8 + v17 + 10;
      }
      char v22 = v20 + 16 * v19;
      [v6 appendBytes:&v22 length:1];
    }
    while ([v5 length] > (unint64_t)v10);
  }
LABEL_27:

  return v6;
}

+ (uint64_t)CKDataWithHexString:()CKUtilsAdditions
{
  return [a1 CKDataWithHexString:a3 stringIsUppercase:0];
}

@end