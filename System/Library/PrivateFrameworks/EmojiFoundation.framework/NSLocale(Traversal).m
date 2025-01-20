@interface NSLocale(Traversal)
+ (void)_enumerateLanguageFallbackGraphForLocaleIdentifier:()Traversal usingBlock:;
@end

@implementation NSLocale(Traversal)

+ (void)_enumerateLanguageFallbackGraphForLocaleIdentifier:()Traversal usingBlock:
{
  v5 = a4;
  v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  v7 = [v6 languageIdentifier];

  id v8 = v7;
  v9 = 0;
  char v12 = 0;
  id v10 = v8;
  do
  {
    if ([v10 isEqualToString:v9]) {
      break;
    }
    v11 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v10];

    id v10 = v11;
    v5[2](v5, v10, &v12);
    v9 = v10;
  }
  while (!v12);
}

@end