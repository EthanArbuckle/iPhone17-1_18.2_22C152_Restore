@interface NSError(BacklightServices)
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
@end

@implementation NSError(BacklightServices)

- (id)bls_loggingString
{
  v2 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__NSError_BacklightServices__bls_loggingString__block_invoke;
  v9[3] = &unk_1E6106FA8;
  id v3 = v2;
  id v10 = v3;
  v11 = a1;
  [v3 appendProem:0 block:v9];
  v4 = [a1 underlyingErrors];
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__NSError_BacklightServices__bls_loggingString__block_invoke_3;
    v7[3] = &unk_1E61075C0;
    id v8 = v3;
    [v8 appendCollection:v4 withName:@"underlyingErrors" itemBlock:v7];
  }
  v5 = [v3 description];

  return v5;
}

- (id)bls_shortLoggingString
{
  v2 = objc_opt_new();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NSError_BacklightServices__bls_shortLoggingString__block_invoke;
  v5[3] = &unk_1E6106F58;
  v5[4] = a1;
  [v2 appendCustomFormatWithName:0 block:v5];
  id v3 = [v2 description];

  return v3;
}

@end