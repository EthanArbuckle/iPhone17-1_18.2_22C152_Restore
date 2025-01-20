@interface NSData(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSData(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      v8 = v6 + 2;
      v6[2](v6, AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v12, "{NSData=#}");
      (*v8)(v7, v12, 11);
      (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__NSData_AFSecurityDigestibleChunksProvider__af_enumerateDigestibleChunksWithOptions_usingBlock___block_invoke;
    v10[3] = &unk_1E5925B68;
    v9 = v7;
    v11 = v9;
    [a1 enumerateByteRangesUsingBlock:v10];
    if ((a3 & 1) == 0) {
      v9[2](v9, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end