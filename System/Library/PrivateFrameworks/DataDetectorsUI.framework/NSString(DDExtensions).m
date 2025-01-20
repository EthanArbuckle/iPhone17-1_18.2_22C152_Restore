@interface NSString(DDExtensions)
- (id)dd_EmailCoding:()DDExtensions;
- (id)dd_uidna:()DDExtensions;
- (uint64_t)dd_encodedEmail;
- (uint64_t)dd_userFriendlyEmail;
@end

@implementation NSString(DDExtensions)

- (id)dd_uidna:()DDExtensions
{
  id v4 = a1;
  UErrorCode pErrorCode = U_ZERO_ERROR;
  uint64_t v5 = MEMORY[0x1A6236FD0](0, &pErrorCode);
  if (pErrorCode <= U_ZERO_ERROR)
  {
    v6 = (const UIDNA *)v5;
    uint64_t v7 = [v4 lengthOfBytesUsingEncoding:4];
    v8 = (char *)malloc_type_malloc(v7, 0xD1DD3C3uLL);
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v8, v7, 0, 4, 0, 0, objc_msgSend(v4, "length"), 0))
      {
        v10 = (char *)malloc_type_malloc(4 * v7, 0x771E4D41uLL);
        if (v10)
        {
          v11 = v10;
          UIDNAInfo pInfo = (UIDNAInfo)xmmword_1A175CCD0;
          int32_t v12 = 4 * v7;
          if (a3) {
            int32_t v13 = uidna_nameToUnicodeUTF8(v6, v9, v7, v10, v12, &pInfo, &pErrorCode);
          }
          else {
            int32_t v13 = uidna_nameToASCII_UTF8(v6, v9, v7, v10, v12, &pInfo, &pErrorCode);
          }
          if (pErrorCode <= U_ZERO_ERROR && !pInfo.errors)
          {
            uint64_t v14 = [[NSString alloc] initWithBytes:v11 length:v13 encoding:4];

            id v4 = (id)v14;
          }
          free(v11);
        }
      }
      free(v9);
    }
    uidna_close(v6);
  }
  return v4;
}

- (id)dd_EmailCoding:()DDExtensions
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  uint64_t v5 = [v4 componentsSeparatedByString:@"@"];
  if ([v5 count] != 2) {
    goto LABEL_15;
  }
  v6 = [v5 firstObject];
  uint64_t v7 = [v5 lastObject];
  if (![v6 length] || !objc_msgSend(v7, "length"))
  {

LABEL_15:
    id v16 = v4;
    goto LABEL_16;
  }
  uint64_t v8 = [v6 stringByRemovingPercentEncoding];
  v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = v6;
  }
  id v11 = v10;

  uint64_t v12 = (uint64_t)v11;
  if ((a3 & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B88] URLUserAllowedCharacterSet];
    uint64_t v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v6];
    v9 = (void *)v13;
    if (v13) {
      uint64_t v12 = v13;
    }
    else {
      uint64_t v12 = (uint64_t)v11;
    }
  }
  v18[0] = v12;
  uint64_t v14 = objc_msgSend(v7, "dd_uidna:", a3);
  v18[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v16 = [v15 componentsJoinedByString:@"@"];

  if ((a3 & 1) == 0)
  {
  }
LABEL_16:

  return v16;
}

- (uint64_t)dd_userFriendlyEmail
{
  return objc_msgSend(a1, "dd_EmailCoding:", 1);
}

- (uint64_t)dd_encodedEmail
{
  return objc_msgSend(a1, "dd_EmailCoding:", 0);
}

@end