@interface NSDecimalNumber(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSDecimalNumber(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      v8 = (void (**)(char *, char *, uint64_t))(v6 + 16);
      (*((void (**)(char *, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy((char *)v9, "{NSDecimalNumber=#b8b4b1b1b1b1b16^S}");
      (*v8)(v7, (char *)v9, 37);
      (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
    }
    LODWORD(v9[2]) = 0;
    objc_msgSend(a1, "decimalValue", 0, 0, v9[2]);
    (*((void (**)(char *, void *, uint64_t))v7 + 2))(v7, v9, 20);
    if ((a3 & 1) == 0) {
      (*((void (**)(char *, char *, uint64_t))v7 + 2))(v7, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end