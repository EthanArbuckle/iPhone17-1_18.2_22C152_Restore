@interface NSString
@end

@implementation NSString

uint64_t __54__NSString_FPAdditions__fp_prettyPathWithObfuscation___block_invoke()
{
  fp_prettyPathWithObfuscation__temporaryDirectory = NSTemporaryDirectory();

  return MEMORY[0x1F41817F8]();
}

void __56__NSString_FPAdditions__fp_commonParentPathForItemURLs___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] > a3)
  {
    v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a3];
    char v8 = [v12 isEqualToString:v7];

    if (v8) {
      goto LABEL_5;
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  *a4 = 1;
LABEL_5:
}

CFStringTokenizerRef __41__NSString_FPAdditions__fp_wordTokenizer__block_invoke()
{
  CFLocaleRef System = CFLocaleGetSystem();
  v2.location = 0;
  v2.length = 0;
  CFStringTokenizerRef result = CFStringTokenizerCreate(0, &stru_1EF68D1F8, v2, 0, System);
  fp_wordTokenizer_tokenizerRef = (uint64_t)result;
  return result;
}

void __51__NSString_FPAdditions__fp_isCJKLanguageIdentifier__block_invoke()
{
  v0 = (void *)fp_isCJKLanguageIdentifier_cjkLanguages;
  fp_isCJKLanguageIdentifier_cjkLanguages = (uint64_t)&unk_1EF6C3A10;
}

@end