@interface LTCombinedTranslationResult
@end

@implementation LTCombinedTranslationResult

uint64_t __68___LTCombinedTranslationResult_initWithParagraphResults_localePair___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disambiguableResult];
}

id __46___LTCombinedTranslationResult_translatedText__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() _translatedTextWithAttributesForResult:v2];

  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

id __44___LTCombinedTranslationResult_romanization__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 translations];
  v3 = [v2 firstObject];
  v4 = [v3 romanization];

  if ([v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end