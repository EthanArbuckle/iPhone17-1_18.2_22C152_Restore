@interface NSUUID(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSUUID(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      v8 = (void (**)(char *, void *, uint64_t))(v6 + 16);
      (*((void (**)(char *, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy((char *)v9, "{NSUUID=#}");
      (*v8)(v7, v9, 11);
      (*v8)(v7, &AFSecurityDigestibleChunksProviderData, 4);
    }
    v9[0] = 0;
    v9[1] = 0;
    [a1 getUUIDBytes:v9];
    (*((void (**)(char *, void *, uint64_t))v7 + 2))(v7, v9, 16);
    if ((a3 & 1) == 0) {
      (*((void (**)(char *, void *, uint64_t))v7 + 2))(v7, &AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end