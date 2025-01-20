@interface NSString
- (id)_escapeForXML;
@end

@implementation NSString

void __77__NSString_EmailFoundationAdditions___ef_sqliteFormattedWithFormatSpecifier___block_invoke(int a1, void *a2)
{
}

void __88__NSString_EmailFoundationAdditions__ef_stringByRemovingUnbalancedOpenQuote_closeQuote___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [a2 first];
  uint64_t v3 = [v5 rangeValue];
  objc_msgSend(v2, "deleteCharactersInRange:", v3, v4);
}

void __74__NSString_EmailFoundationAdditions__ef_quotedWordComponentsForLanguages___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v10 = v5;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(v5, "ef_stringByRemovingQuotesForLanguages:", *(void *)(a1 + 32));

    id v10 = (id)v6;
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v8 = [*(id *)(a1 + 48) firstObject];
    v9 = objc_msgSend(v10, "ef_wordComponentsForLocale:", v8);
    [v7 addObjectsFromArray:v9];
  }
}

void __100__NSString_EmailFoundationAdditions__ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v7 = a2;
  id v5 = [NSString stringWithFormat:@"%C%@", a3, v7];
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v7, v5, 0, 0, objc_msgSend(v6, "length"));
}

void __62__NSString_EmailFoundationAdditions__ef_substringWithIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:");
}

void __64__NSString_EmailFoundationAdditions__ef_isUnsignedIntegerString__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)ef_isUnsignedIntegerString_nonDigitCharacterSet;
  ef_isUnsignedIntegerString_nonDigitCharacterSet = v0;
}

- (id)_escapeForXML
{
  if (a1)
  {
    v1 = (void *)[a1 mutableCopy];
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
      0,
      0,
      [v1 length]);
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
      0,
      0,
      [v1 length]);
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
      0,
      0,
      [v1 length]);
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"'", @"&apos;",
      0,
      0,
      [v1 length]);
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\", @"&quot;"",
      0,
      0,
      [v1 length]);
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id __83__NSString_EmailFoundationAdditions__ef_pathByReplacingRelativePathWithFolderName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"."] & 1) != 0
    || (int v4 = [v3 isEqualToString:@".."], v5 = v3, v4))
  {
    id v5 = *(void **)(a1 + 32);
  }
  id v6 = v5;

  return v6;
}

@end