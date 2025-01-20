@interface AFPreferencesDictationLanguagePrefixes
@end

@implementation AFPreferencesDictationLanguagePrefixes

void ___AFPreferencesDictationLanguagePrefixes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)_AFPreferencesDictationLanguagePrefixes_sLanguagePrefixes;
  AFLanguagePrefixForLanguageCode(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void ___AFPreferencesDictationLanguagePrefixes_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_AFPreferencesDictationLanguagePrefixes_sLanguagePrefixes;
  _AFPreferencesDictationLanguagePrefixes_sLanguagePrefixes = (uint64_t)v0;

  AFPreferencesSupportedDictationLanguages();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_1986];
}

@end