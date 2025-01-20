@interface NSRegularExpression(ENAGRegex)
+ (id)enRegexWithPattern:()ENAGRegex;
- (BOOL)enFindInString:()ENAGRegex;
- (id)enCapturedSubstringsOfString:()ENAGRegex;
- (id)enReplaceWithString:()ENAGRegex inString:;
- (uint64_t)enMatchesString:()ENAGRegex;
@end

@implementation NSRegularExpression(ENAGRegex)

- (id)enReplaceWithString:()ENAGRegex inString:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), v7);

  return v8;
}

- (id)enCapturedSubstringsOfString:()ENAGRegex
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [v4 length];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__NSRegularExpression_ENAGRegex__enCapturedSubstringsOfString___block_invoke;
  v9[3] = &unk_264E55D28;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  objc_msgSend(a1, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v5, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (uint64_t)enMatchesString:()ENAGRegex
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  id v6 = objc_msgSend(a1, "firstMatchInString:options:range:", v4, 0, 0, v5);

  if (v6)
  {
    if ([v6 range]) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v7 == v5;
    }
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)enFindInString:()ENAGRegex
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v5 != 0;
}

+ (id)enRegexWithPattern:()ENAGRegex
{
  id v3 = a3;
  id v8 = 0;
  id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v3 options:0 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if (!v4) {
    NSLog(&cfstr_Regularexpress.isa, v3, v5);
  }

  return v4;
}

@end