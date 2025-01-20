@interface NSString(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSString(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      v8 = (void (**)(char *, char *, uint64_t))(v6 + 16);
      (*((void (**)(char *, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v10, "{NSString=#}");
      (*v8)(v7, v10, 13);
      (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
    }
    v9 = [a1 dataUsingEncoding:4];
    objc_msgSend(v9, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);
    if ((a3 & 1) == 0) {
      (*((void (**)(char *, char *, uint64_t))v7 + 2))(v7, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end