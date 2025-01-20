@interface NSRegularExpression(EmailFoundationAdditions)
+ (id)ef_regularExpressionForQuotedStringsInLocales:()EmailFoundationAdditions;
- (id)ef_stringByRemovingTokensFromString:()EmailFoundationAdditions matchingOptions:tokenizationOptions:tokenizationHandler:;
- (id)ef_stringByRemovingTokensFromString:()EmailFoundationAdditions tokenizationHandler:;
- (void)ef_enumerateTokensInString:()EmailFoundationAdditions options:usingBlock:;
@end

@implementation NSRegularExpression(EmailFoundationAdditions)

- (void)ef_enumerateTokensInString:()EmailFoundationAdditions options:usingBlock:
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 length];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3010000000;
  v25 = &unk_1B5ADDE1D;
  uint64_t v26 = 0;
  uint64_t v27 = v10;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __95__NSRegularExpression_EmailFoundationAdditions__ef_enumerateTokensInString_options_usingBlock___block_invoke;
  v17 = &unk_1E6122910;
  v20 = &v22;
  id v11 = v9;
  id v19 = v11;
  id v12 = v8;
  id v18 = v12;
  uint64_t v21 = v10;
  objc_msgSend(a1, "enumerateMatchesInString:options:range:usingBlock:", v12, a4, v26, v27, &v14);
  if (v23[5])
  {
    v13 = objc_msgSend(v12, "substringWithRange:", v23[4], v14, v15, v16, v17);
    (*((void (**)(id, void *, void, uint64_t, uint64_t))v11 + 2))(v11, v13, 0, v23[4], v23[5]);
  }
  _Block_object_dispose(&v22, 8);
}

- (id)ef_stringByRemovingTokensFromString:()EmailFoundationAdditions matchingOptions:tokenizationOptions:tokenizationHandler:
{
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __141__NSRegularExpression_EmailFoundationAdditions__ef_stringByRemovingTokensFromString_matchingOptions_tokenizationOptions_tokenizationHandler___block_invoke;
  v19[3] = &unk_1E6122938;
  char v22 = a5 & 1;
  id v13 = v11;
  id v21 = v13;
  id v14 = v12;
  id v20 = v14;
  objc_msgSend(a1, "ef_enumerateTokensInString:options:usingBlock:", v10, a4, v19);
  id v15 = v14;
  v16 = v15;
  if ((a5 & 2) != 0)
  {
    v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v16 = [v15 stringByTrimmingCharactersInSet:v17];
  }
  return v16;
}

- (id)ef_stringByRemovingTokensFromString:()EmailFoundationAdditions tokenizationHandler:
{
  v4 = objc_msgSend(a1, "ef_stringByRemovingTokensFromString:matchingOptions:tokenizationOptions:tokenizationHandler:", a3, 0, 0, a4);
  return v4;
}

+ (id)ef_regularExpressionForQuotedStringsInLocales:()EmailFoundationAdditions
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_quotePairsForLocales:");
  v5 = objc_msgSend(v4, "ef_map:", &__block_literal_global_20);
  v6 = [v5 componentsJoinedByString:@"|"];
  id v11 = 0;
  v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v6 options:0 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"EFNSRegularExpressionAdditions.m", 96, @"Failed to create regular expression. Error:", v8);
  }
  return v7;
}

@end