@interface NSURL(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSURL(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v10 = [a1 absoluteString];
      objc_msgSend(v10, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);
    }
    else
    {
      v8 = (void (**)(char *, char *, uint64_t))(v6 + 16);
      (*((void (**)(char *, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v11, "{NSURL=#@@^v^v}");
      (*v8)(v7, v11, 16);
      (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
      v9 = [a1 absoluteString];
      objc_msgSend(v9, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      (*v8)(v7, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end