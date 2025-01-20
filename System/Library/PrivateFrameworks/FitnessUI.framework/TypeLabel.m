@interface TypeLabel
@end

@implementation TypeLabel

void ___TypeLabel_block_invoke()
{
  v15[1] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F828E0]);
  uint64_t v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v2 = (void *)_TypeLabel___typeLabel;
  _TypeLabel___typeLabel = v1;

  [(id)_TypeLabel___typeLabel setLineBreakMode:0];
  [(id)_TypeLabel___typeLabel setNumberOfLines:0];
  [(id)_TypeLabel___typeLabel setTextAlignment:4];
  v3 = [MEMORY[0x263F825C8] whiteColor];
  [(id)_TypeLabel___typeLabel setTextColor:v3];

  [(id)_TypeLabel___typeLabel setAllowsDefaultTighteningForTruncation:1];
  v4 = _LabelFont();
  [(id)_TypeLabel___typeLabel setFont:v4];

  v5 = [MEMORY[0x263F81658] defaultParagraphStyle];
  v6 = (void *)[v5 mutableCopy];

  v7 = [MEMORY[0x263EFF960] currentLocale];
  v8 = [v7 languageCode];
  char v9 = [v8 isEqualToString:@"en"];

  if ((v9 & 1) == 0)
  {
    LODWORD(v10) = 1.0;
    [v6 setHyphenationFactor:v10];
  }
  v11 = [(id)_TypeLabel___typeLabel _defaultAttributes];
  uint64_t v14 = *MEMORY[0x263F81540];
  v15[0] = v6;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v13 = objc_msgSend(v11, "hk_dictionaryByAddingEntriesFromDictionary:", v12);
  [(id)_TypeLabel___typeLabel _setDefaultAttributes:v13];
}

@end