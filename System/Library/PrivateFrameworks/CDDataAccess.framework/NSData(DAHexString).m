@interface NSData(DAHexString)
+ (id)da_dataWithHexString:()DAHexString stringIsUppercase:;
+ (uint64_t)da_dataWithHexString:()DAHexString;
- (id)da_hexString;
- (id)da_lowercaseHexStringWithoutSpaces;
- (id)da_uppercaseHexStringWithoutSpaces;
@end

@implementation NSData(DAHexString)

- (id)da_hexString
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  unint64_t v3 = [v1 length];
  v4 = malloc_type_malloc(((9 * v3) >> 2) & 0x1FFFFFFFFFFFFFFFLL, 0xACE2245uLL);
  if (v3 < 5)
  {
    uint64_t v5 = 0;
    v7 = v4;
    if (!v3) {
      goto LABEL_24;
    }
    goto LABEL_15;
  }
  uint64_t v5 = 0;
  uint64_t v6 = v2;
  v7 = v4;
  do
  {
    uint64_t v8 = 0;
    ++v7;
    do
    {
      if (*(unsigned __int8 *)(v6 + v8) <= 0x9Fu) {
        char v9 = 48;
      }
      else {
        char v9 = 87;
      }
      *(v7 - 1) = v9 + (*(unsigned char *)(v6 + v8) >> 4);
      unsigned int v10 = *(unsigned char *)(v6 + v8) & 0xF;
      if (v10 <= 9) {
        char v11 = 48;
      }
      else {
        char v11 = 87;
      }
      unsigned char *v7 = v11 + v10;
      v7 += 2;
      ++v8;
    }
    while (v8 != 4);
    *(v7 - 1) = 32;
    v5 += 4;
    v3 -= 4;
    v6 += 4;
  }
  while (v3 > 4);
  if (v3)
  {
LABEL_15:
    v12 = (char *)(v2 + v5);
    do
    {
      if (*v12 <= 0x9Fu) {
        char v13 = 48;
      }
      else {
        char v13 = 87;
      }
      unsigned char *v7 = v13 + (*v12 >> 4);
      char v14 = *v12++;
      unsigned int v15 = v14 & 0xF;
      if (v15 <= 9) {
        char v16 = 48;
      }
      else {
        char v16 = 87;
      }
      char v17 = v16 + v15;
      v18 = v7 + 2;
      v7[1] = v17;
      v7 += 2;
      --v3;
    }
    while (v3);
    v7 = v18;
  }
LABEL_24:
  v19 = (void *)[[NSString alloc] initWithBytesNoCopy:v4 length:v7 - v4 encoding:1 freeWhenDone:1];
  return v19;
}

- (id)da_lowercaseHexStringWithoutSpaces
{
  id v1 = objc_msgSend(a1, "da_hexString");
  uint64_t v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_1F231BAB0, 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)da_uppercaseHexStringWithoutSpaces
{
  id v1 = objc_msgSend(a1, "da_hexString");
  uint64_t v2 = [v1 uppercaseString];
  unint64_t v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_1F231BAB0, 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)da_dataWithHexString:()DAHexString stringIsUppercase:
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  if (a4) {
    v7 = @"0123456789ABCDEF";
  }
  else {
    v7 = @"0123456789abcdef";
  }
  if (a4) {
    char v8 = -55;
  }
  else {
    char v8 = -87;
  }
  char v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v7];
  if ([v5 length])
  {
    unsigned int v10 = 0;
    do
    {
      unint64_t v11 = v10;
      if ([v5 length] <= (unint64_t)v10)
      {
LABEL_13:
        char v13 = -1;
      }
      else
      {
        unsigned int v12 = v10 + 1;
        while (1)
        {
          unsigned int v10 = v12;
          char v13 = [v5 characterAtIndex:v11];
          unint64_t v11 = v10;
          if ([v9 characterIsMember:(unsigned __int16)v13]) {
            break;
          }
          unint64_t v14 = [v5 length];
          unsigned int v12 = v10 + 1;
          if (v14 <= v10) {
            goto LABEL_13;
          }
        }
      }
      if ([v5 length] <= v11) {
        break;
      }
      ++v10;
      while (1)
      {
        char v15 = [v5 characterAtIndex:v11];
        if ([v9 characterIsMember:(unsigned __int16)v15]) {
          break;
        }
        unint64_t v11 = v10;
        if ([v5 length] <= (unint64_t)v10++) {
          goto LABEL_27;
        }
      }
      if (v13 == -1 || v15 == -1) {
        break;
      }
      char v17 = v15 - 48;
      if ((v15 - 48) >= 0xAu) {
        char v17 = v8 + v15;
      }
      char v18 = (v13 - 48) >= 0xAu ? 16 * v13 - 112 : 16 * v13;
      char v20 = v17 + v18;
      [v6 appendBytes:&v20 length:1];
    }
    while ([v5 length] > (unint64_t)v10);
  }
LABEL_27:

  return v6;
}

+ (uint64_t)da_dataWithHexString:()DAHexString
{
  return objc_msgSend(a1, "da_dataWithHexString:stringIsUppercase:", a3, 0);
}

@end