@interface ECMessageBodyParsingUtils
+ (id)snippetFromHTMLBody:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5 preservingQuotedForwardedContent:(BOOL)a6;
@end

@implementation ECMessageBodyParsingUtils

+ (id)snippetFromHTMLBody:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5 preservingQuotedForwardedContent:(BOOL)a6
{
  id v9 = a3;
  v10 = [[ECMessageBodyHTMLParser alloc] initWithHTML:v9];
  v11 = objc_alloc_init(ECMessageBodyOriginalTextSubparser);
  [(ECMessageBodyParser *)v10 addSubparser:v11];
  id v12 = [(ECMessageBodyParser *)v10 newStringAccumulatorWithOptions:a4 lengthLimit:a5];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke;
  v19[3] = &unk_1E63EE830;
  BOOL v21 = a6;
  id v13 = v12;
  id v20 = v13;
  [(ECMessageBodyOriginalTextSubparser *)v11 setFoundTextBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke_2;
  v17[3] = &unk_1E63EE858;
  id v14 = v13;
  id v18 = v14;
  [(ECMessageBodyOriginalTextSubparser *)v11 setFoundWhitespaceBlock:v17];
  if ([(ECMessageBodyHTMLParser *)v10 parse])
  {
    v15 = [v14 accumulatedString];
  }
  else
  {
    v15 = &stru_1F1A635E8;
  }

  return v15;
}

void __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = v7;
  if (!a3 || a3 == 2 && *(unsigned char *)(a1 + 40))
  {
    if (![v7 valueForAttributes:64]) {
      [*(id *)(a1 + 32) appendInnerTextWithConsumableNode:v8];
    }
  }
  else
  {
    [*(id *)(a1 + 32) appendCustomEntityWithTag:0 stringRepresentation:@" "];
  }
  *a4 = [*(id *)(a1 + 32) isFull];
}

uint64_t __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendInnerTextWithConsumableNode:a2];
}

@end