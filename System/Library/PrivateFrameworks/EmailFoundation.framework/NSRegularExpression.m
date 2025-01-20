@interface NSRegularExpression
@end

@implementation NSRegularExpression

void __95__NSRegularExpression_EmailFoundationAdditions__ef_enumerateTokensInString_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  unint64_t v3 = [v13 range];
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v8 = *(void *)(v7 + 32);
  if (v3 > v8)
  {
    *(void *)(v7 + 40) = v3 - v8;
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    (*(void (**)(uint64_t, void *, void, void, void))(v9 + 16))(v9, v10, 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  uint64_t v11 = *(void *)(a1 + 40);
  v12 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v6);
  (*(void (**)(uint64_t, void *, uint64_t, unint64_t, uint64_t))(v11 + 16))(v11, v12, 1, v4, v6);

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v4 + v6;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(void *)(a1 + 56)
                                                              - *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 32);
}

void __141__NSRegularExpression_EmailFoundationAdditions__ef_stringByRemovingTokensFromString_matchingOptions_tokenizationOptions_tokenizationHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v9 = v5;
      uint64_t v7 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v5, "length") - 1));

      uint64_t v8 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v7, "rangeOfComposedCharacterSequenceAtIndex:", 0) + 1);

      id v6 = (id)v8;
    }
    id v10 = v6;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v10 = v5;
    [*(id *)(a1 + 32) appendString:v5];
  }
}

id __95__NSRegularExpression_EmailFoundationAdditions__ef_regularExpressionForQuotedStringsInLocales___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 first];
  unint64_t v4 = [v2 second];
  id v5 = [NSString stringWithFormat:@"((%@[^%@]+?%@)+)", v3, v4, v4];

  return v5;
}

@end