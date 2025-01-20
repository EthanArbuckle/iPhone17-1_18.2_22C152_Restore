@interface ECHeaderAuthenticationResultsParser
@end

@implementation ECHeaderAuthenticationResultsParser

ECHeaderAuthenticationResults *__78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v3];
  if ([*(id *)(a1 + 32) _skipCFWSWithScanner:v4])
  {
    v5 = *(void **)(a1 + 32);
    id v17 = 0;
    int v6 = [v5 _scanQuotedValueWithScanner:v4 intoString:&v17];
    id v7 = v17;
    if (v6 && ([*(id *)(a1 + 32) _skipCFWSWithScanner:v4] & 1) != 0)
    {
      uint64_t v8 = [*(id *)(a1 + 32) _versionWithScanner:v4];
      v9 = *(void **)(a1 + 32);
      id v16 = 0;
      char v10 = [v9 _statementsWithScanner:v4 intoArray:&v16];
      v11 = v16;
      if (v10)
      {
        v12 = [ECHeaderAuthenticationResults alloc];
        v13 = [v11 ef_notEmpty];
        v14 = [(ECHeaderAuthenticationResults *)v12 initWithAuthenticationServiceIdentifier:v7 version:v8 statements:v13];
      }
      else
      {
        v13 = _ef_log_ECHeaderAuthenticationResults();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_1(v13);
        }
        v14 = 0;
      }

      goto LABEL_10;
    }
  }
  else
  {
    id v7 = 0;
  }
  v11 = _ef_log_ECHeaderAuthenticationResults();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_2(v11);
  }
  v14 = 0;
LABEL_10:

  return v14;
}

uint64_t __61___ECHeaderAuthenticationResultsParser__skipCFWSWithScanner___block_invoke()
{
  _skipCFWSWithScanner__parentheses = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"()"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __85___ECHeaderAuthenticationResultsParser__scanToCFWSOrSemicolonWithScanner_intoString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  v1 = (void *)_scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon;
  _scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon = v0;

  v2 = (void *)_scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon;
  return objc_msgSend(v2, "addCharactersInString:", @"(;");
}

uint64_t __79___ECHeaderAuthenticationResultsParser__scanQuotedValueWithScanner_intoString___block_invoke()
{
  _scanQuotedValueWithScanner_intoString__quotes = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\""];
  return MEMORY[0x1F41817F8]();
}

uint64_t __81___ECHeaderAuthenticationResultsParser__scanToCFWSOrEqualWithScanner_intoString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  v1 = (void *)_scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual;
  _scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual = v0;

  v2 = (void *)_scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual;
  return objc_msgSend(v2, "addCharactersInString:", @"(=");
}

uint64_t __93___ECHeaderAuthenticationResultsParser__scanToCFWSOrPeriodOrSemicolonWithScanner_intoString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  v1 = (void *)_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon;
  _scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon = v0;

  v2 = (void *)_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon;
  return objc_msgSend(v2, "addCharactersInString:", @"(.;");
}

void __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Invalid authentication result statements", v1, 2u);
}

void __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Invalid authentication service identifier", v1, 2u);
}

@end