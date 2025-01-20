@interface NSNull(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSNull(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ((a3 & 1) == 0)
    {
      v4 = a4 + 2;
      v5 = (void (*)(void))a4[2];
      v6 = a4;
      v5();
      strcpy(v7, "{NSNull=#}");
      (*v4)(v6, v7, 11);
      (*v4)(v6, AFSecurityDigestibleChunksProviderData, 4);
      (*v4)(v6, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end