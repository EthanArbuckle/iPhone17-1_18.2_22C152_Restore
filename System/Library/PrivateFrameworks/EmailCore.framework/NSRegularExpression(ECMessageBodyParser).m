@interface NSRegularExpression(ECMessageBodyParser)
+ (uint64_t)ec_attributionExpression;
+ (uint64_t)ec_attributionPrefixExpression;
+ (uint64_t)ec_copyAttributionRegularExpressionForType:()ECMessageBodyParser;
+ (uint64_t)ec_forwardSeparatorExpression;
+ (uint64_t)ec_signatureExpression;
@end

@implementation NSRegularExpression(ECMessageBodyParser)

+ (uint64_t)ec_copyAttributionRegularExpressionForType:()ECMessageBodyParser
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"AttributionPatterns", @"plist"));
  v24 = a1;
  if (a3 > 3)
  {
    v22 = 0;
    v6 = 0;
  }
  else
  {
    v22 = off_1E63EE7E8[a3];
    v6 = off_1E63EE808[a3];
  }
  v23 = v5;
  v20 = v6;
  v7 = objc_msgSend(v5, "objectForKey:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = (void *)[MEMORY[0x1E4F28FD8] escapedPatternForString:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        v14 = v13;
        if (a3 == 1)
        {
          uint64_t v15 = [v13 rangeOfString:@"%@"];
          if (!v15) {
            uint64_t v15 = [v14 rangeOfString:@"%@", 0, 1, objc_msgSend(v14, "length") - 1 options range];
          }
          if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
            v14 = objc_msgSend((id)objc_msgSend(v14, "substringToIndex:"), "stringByAppendingString:", @"%@");
          }
        }
        [v8 addObject:objc_msgSend((id)objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", @"%@", @".+", "stringByReplacingOccurrencesOfString:withString:", @" ", @"\\s"];
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
  v16 = objc_msgSend([NSString alloc], "initWithFormat:", v22, objc_msgSend(v8, "componentsJoinedByString:", @"|"));
  uint64_t v25 = 0;
  uint64_t v17 = [[v24 alloc] initWithPattern:v16 options:1 error:&v25];
  if (!v17)
  {
    v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, v24, @"ECMessageBodyParser.m", 715, @"Couldn't create regular expression for key %@: %@", v20, v25 object file lineNumber description];
  }

  return v17;
}

+ (uint64_t)ec_attributionExpression
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NSRegularExpression_ECMessageBodyParser__ec_attributionExpression__block_invoke;
  block[3] = &unk_1E63EE7C8;
  block[4] = a1;
  if (ec_attributionExpression_onceToken != -1) {
    dispatch_once(&ec_attributionExpression_onceToken, block);
  }
  return ec_attributionExpression_regex;
}

+ (uint64_t)ec_attributionPrefixExpression
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__NSRegularExpression_ECMessageBodyParser__ec_attributionPrefixExpression__block_invoke;
  block[3] = &unk_1E63EE7C8;
  block[4] = a1;
  if (ec_attributionPrefixExpression_onceToken != -1) {
    dispatch_once(&ec_attributionPrefixExpression_onceToken, block);
  }
  return ec_attributionPrefixExpression_regex;
}

+ (uint64_t)ec_forwardSeparatorExpression
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NSRegularExpression_ECMessageBodyParser__ec_forwardSeparatorExpression__block_invoke;
  block[3] = &unk_1E63EE7C8;
  block[4] = a1;
  if (ec_forwardSeparatorExpression_onceToken != -1) {
    dispatch_once(&ec_forwardSeparatorExpression_onceToken, block);
  }
  return ec_forwardSeparatorExpression_regex;
}

+ (uint64_t)ec_signatureExpression
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NSRegularExpression_ECMessageBodyParser__ec_signatureExpression__block_invoke;
  block[3] = &unk_1E63EE7C8;
  block[4] = a1;
  if (ec_signatureExpression_onceToken != -1) {
    dispatch_once(&ec_signatureExpression_onceToken, block);
  }
  return ec_signatureExpression_regex;
}

@end