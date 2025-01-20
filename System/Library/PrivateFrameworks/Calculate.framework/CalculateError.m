@interface CalculateError
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithResultError:(int)a3;
- (CalculateError)initWithCode:(int64_t)a3 userInfo:(id)a4;
- (id)initIncorrectArguments:(int)a3 correctArguments:(int)a4 inFunction:(id)a5;
- (id)initIncorrectArguments:(int)a3 minArguments:(int)a4 maxArguments:(int)a5 inFunction:(id)a6;
- (id)initInvalidFlipArgument:(id)a3;
- (id)initInvalidNegativeArgument:(id)a3;
- (id)initUnbalancedSymbol:(id)a3;
- (id)initUnexpectedPunctuation:(id)a3;
- (id)initUnexpectedSymbol:(id)a3;
- (id)initUnknownVariable:(id)a3;
@end

@implementation CalculateError

- (id)initInvalidFlipArgument:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F28588];
  v4 = NSString;
  id v5 = a3;
  v6 = +[Localize systemLocale];
  v7 = +[Localize localizationForLocale:v6];
  v8 = +[Localize localizedStringForKey:@"-1005.desc.flip" value:0 table:@"LocalizableErrors" localization:v7];
  v9 = objc_msgSend(v4, "stringWithFormat:", v8, v5, v13);

  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = [(CalculateError *)self initWithCode:-1005 userInfo:v10];

  return v11;
}

- (id)initInvalidNegativeArgument:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F28588];
  v4 = NSString;
  id v5 = a3;
  v6 = +[Localize systemLocale];
  v7 = +[Localize localizationForLocale:v6];
  v8 = +[Localize localizedStringForKey:@"-1005.desc.negative" value:0 table:@"LocalizableErrors" localization:v7];
  v9 = objc_msgSend(v4, "stringWithFormat:", v8, v5, v13);

  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = [(CalculateError *)self initWithCode:-1005 userInfo:v10];

  return v11;
}

- (id)initUnbalancedSymbol:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = initUnbalancedSymbol__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initUnbalancedSymbol__onceToken, &__block_literal_global_98);
  }
  uint64_t v6 = [(id)initUnbalancedSymbol__normalizeMap objectForKeyedSubscript:v5];
  v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;

  v10 = [NSString stringWithFormat:@"Unbalanced %@", v9];
  v11 = +[Localize systemLocale];
  v12 = +[Localize localizationForLocale:v11];
  uint64_t v13 = +[Localize localizedStringForKey:v10 value:0 table:@"LocalizableErrors" localization:v12];

  if (!v13)
  {
    v14 = NSString;
    v15 = +[Localize systemLocale];
    v16 = +[Localize localizationForLocale:v15];
    v17 = +[Localize localizedStringForKey:@"Unbalanced Unknown" value:0 table:@"LocalizableErrors" localization:v16];
    uint64_t v13 = objc_msgSend(v14, "stringWithFormat:", v17, v9);
  }
  uint64_t v21 = *MEMORY[0x1E4F28568];
  v22[0] = v13;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v19 = [(CalculateError *)self initWithCode:-1001 userInfo:v18];

  return v19;
}

void __39__CalculateError_initUnbalancedSymbol___block_invoke()
{
  v0 = (void *)initUnbalancedSymbol__normalizeMap;
  initUnbalancedSymbol__normalizeMap = (uint64_t)&unk_1F1872E00;
}

- (id)initUnexpectedSymbol:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = +[Localize systemLocale];
  v7 = +[Localize localizationForLocale:v6];
  v8 = +[Localize localizedStringForKey:@"-1012" value:0 table:@"LocalizableErrors" localization:v7];
  id v9 = objc_msgSend(v4, "stringWithFormat:", v8, v5, v13);

  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = [(CalculateError *)self initWithCode:-1012 userInfo:v10];

  return v11;
}

- (id)initUnexpectedPunctuation:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = +[Localize systemLocale];
  v7 = +[Localize localizationForLocale:v6];
  v8 = +[Localize localizedStringForKey:@"-1011" value:0 table:@"LocalizableErrors" localization:v7];
  id v9 = objc_msgSend(v4, "stringWithFormat:", v8, v5, v13);

  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = [(CalculateError *)self initWithCode:-1011 userInfo:v10];

  return v11;
}

- (id)initUnknownVariable:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"CalculateErrorKeySuggestions";
  v10[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [(CalculateError *)self initWithCode:-1003 userInfo:v6];
  return v7;
}

- (id)initIncorrectArguments:(int)a3 minArguments:(int)a4 maxArguments:(int)a5 inFunction:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = *MEMORY[0x1E4F28588];
  id v9 = NSString;
  id v10 = a6;
  v11 = +[Localize systemLocale];
  v12 = +[Localize localizationForLocale:v11];
  uint64_t v13 = +[Localize localizedStringForKey:@"-1006.desc.range" value:0 table:@"LocalizableErrors" localization:v12];
  v14 = objc_msgSend(v9, "stringWithFormat:", v13, v10, v7, v6, v18);

  v19[0] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v16 = [(CalculateError *)self initWithCode:-1006 userInfo:v15];

  return v16;
}

- (id)initIncorrectArguments:(int)a3 correctArguments:(int)a4 inFunction:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = *MEMORY[0x1E4F28588];
  uint64_t v7 = NSString;
  id v8 = a5;
  id v9 = +[Localize systemLocale];
  id v10 = +[Localize localizationForLocale:v9];
  v11 = +[Localize localizedStringForKey:@"-1006.desc.exact" value:0 table:@"LocalizableErrors" localization:v10];
  v12 = objc_msgSend(v7, "stringWithFormat:", v11, v8, v5);

  v17[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = [(CalculateError *)self initWithCode:-1006 userInfo:v13];

  return v14;
}

- (CalculateError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v6 = (void *)[a4 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  id v10 = +[Localize systemLocale];
  v11 = +[Localize localizationForLocale:v10];

  uint64_t v12 = *MEMORY[0x1E4F28568];
  uint64_t v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (!v13)
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a3);
    v15 = +[Localize localizedStringForKey:v14 value:0 table:@"LocalizableErrors" localization:v11];
    [v9 setObject:v15 forKeyedSubscript:v12];
  }
  uint64_t v16 = *MEMORY[0x1E4F28588];
  v17 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];

  if (!v17)
  {
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d.desc", a3);
    v19 = +[Localize localizedStringForKey:v18 value:@"NOT_FOUND" table:@"LocalizableErrors" localization:v11];

    if (([v19 isEqualToString:@"NOT_FOUND"] & 1) == 0) {
      [v9 setObject:v19 forKeyedSubscript:v16];
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)CalculateError;
  v20 = [(CalculateError *)&v22 initWithDomain:CalculateErrorDomain code:a3 userInfo:v9];

  return v20;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[CalculateError alloc] initWithCode:a3 userInfo:v5];

  return v6;
}

+ (id)errorWithResultError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  if (errorWithResultError__onceToken[0] != -1) {
    dispatch_once(errorWithResultError__onceToken, &__block_literal_global_422);
  }
  uint64_t v4 = (void *)errorWithResultError__mapping;
  id v5 = [NSNumber numberWithInt:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = +[CalculateError errorWithCode:userInfo:](CalculateError, "errorWithCode:userInfo:", [v6 integerValue], 0);
  }
  else if (v3 == 10)
  {
    uint64_t v13 = *MEMORY[0x1E4F28588];
    id v8 = +[Localize systemLocale];
    id v9 = +[Localize localizationForLocale:v8];
    id v10 = +[Localize localizedStringForKey:@"-2006.desc.trig" value:0 table:@"LocalizableErrors" localization:v9];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v7 = +[CalculateError errorWithCode:-2006 userInfo:v11];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __39__CalculateError_errorWithResultError___block_invoke()
{
  v3[15] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1872470;
  v2[1] = &unk_1F18724A0;
  v3[0] = &unk_1F1872488;
  v3[1] = &unk_1F18724B8;
  v2[2] = &unk_1F18724D0;
  v2[3] = &unk_1F1872500;
  v3[2] = &unk_1F18724E8;
  v3[3] = &unk_1F1872518;
  v2[4] = &unk_1F1872530;
  v2[5] = &unk_1F1872560;
  v3[4] = &unk_1F1872548;
  v3[5] = &unk_1F1872578;
  v2[6] = &unk_1F1872590;
  v2[7] = &unk_1F18725A8;
  v3[6] = &unk_1F1872578;
  v3[7] = &unk_1F18725C0;
  v2[8] = &unk_1F18725D8;
  v2[9] = &unk_1F1872608;
  v3[8] = &unk_1F18725F0;
  v3[9] = &unk_1F1872620;
  v2[10] = &unk_1F1872638;
  v2[11] = &unk_1F1872668;
  v3[10] = &unk_1F1872650;
  v3[11] = &unk_1F1872680;
  v2[12] = &unk_1F1872698;
  v2[13] = &unk_1F18726C8;
  v3[12] = &unk_1F18726B0;
  v3[13] = &unk_1F18726E0;
  v2[14] = &unk_1F18726F8;
  v3[14] = &unk_1F1872710;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:15];
  v1 = (void *)errorWithResultError__mapping;
  errorWithResultError__mapping = v0;
}

@end