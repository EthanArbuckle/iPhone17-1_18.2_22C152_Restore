@interface NSDate(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSDate(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      v8 = (void (**)(char *, char *, uint64_t))(v6 + 16);
      (*((void (**)(char *, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy((char *)v10, "{NSDate=#}");
      (*v8)(v7, (char *)v10, 11);
      (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
    }
    [a1 timeIntervalSince1970];
    v10[0] = v9;
    (*((void (**)(char *, void *, uint64_t))v7 + 2))(v7, v10, 8);
    if ((a3 & 1) == 0) {
      (*((void (**)(char *, char *, uint64_t))v7 + 2))(v7, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end