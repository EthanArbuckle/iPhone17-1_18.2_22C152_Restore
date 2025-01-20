@interface NSNumber(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSNumber(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (!v6) {
    goto LABEL_13;
  }
  if ((a3 & 1) == 0)
  {
    v8 = (void (**)(char *, char *, uint64_t))(v6 + 16);
    (*((void (**)(char *, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
    strcpy((char *)v13, "{NSNumber=#}");
    (*v8)(v7, (char *)v13, 13);
    (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
  }
  id v9 = a1;
  unsigned int v10 = *(char *)[v9 objCType] - 66;
  if (v10 <= 0x31)
  {
    if (((1 << v10) & 0x28483) != 0)
    {
      uint64_t v11 = [v9 unsignedLongLongValue];
      goto LABEL_9;
    }
    if (((1 << v10) & 0x2848200000000) != 0)
    {
      uint64_t v11 = [v9 longLongValue];
LABEL_9:
      v13[0] = v11;
LABEL_10:
      (*((void (**)(char *, void *, uint64_t))v7 + 2))(v7, v13, 8);
      goto LABEL_11;
    }
    if (((1 << v10) & 0x1400000000) != 0)
    {
      [v9 doubleValue];
      v13[0] = v12;
      goto LABEL_10;
    }
  }
LABEL_11:
  if ((a3 & 1) == 0) {
    (*((void (**)(char *, char *, uint64_t))v7 + 2))(v7, AFSecurityDigestibleChunksProviderEnd, 4);
  }
LABEL_13:
}

@end