@interface NSRegularExpression
@end

@implementation NSRegularExpression

uint64_t __68__NSRegularExpression_ECMessageBodyParser__ec_attributionExpression__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 0);
  ec_attributionExpression_regex = result;
  return result;
}

uint64_t __74__NSRegularExpression_ECMessageBodyParser__ec_attributionPrefixExpression__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 1);
  ec_attributionPrefixExpression_regex = result;
  return result;
}

uint64_t __73__NSRegularExpression_ECMessageBodyParser__ec_forwardSeparatorExpression__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 2);
  ec_forwardSeparatorExpression_regex = result;
  return result;
}

uint64_t __66__NSRegularExpression_ECMessageBodyParser__ec_signatureExpression__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 3);
  ec_signatureExpression_regex = result;
  return result;
}

void __65__NSRegularExpression_SubjectParser__ec_regularExpressionForList__block_invoke()
{
  id v6 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^\\[.*?\\][[:space:]]" options:1 error:&v6];
  id v1 = v6;
  v2 = (void *)ec_regularExpressionForList_listRegex;
  ec_regularExpressionForList_listRegex = v0;

  if (!ec_regularExpressionForList_listRegex)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    v4 = [v1 description];
    id v5 = [v3 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v4 userInfo:0];

    objc_exception_throw(v5);
  }
}

@end