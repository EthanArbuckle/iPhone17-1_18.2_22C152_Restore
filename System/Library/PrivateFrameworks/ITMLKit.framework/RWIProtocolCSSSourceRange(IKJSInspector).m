@interface RWIProtocolCSSSourceRange(IKJSInspector)
+ (id)ik_cssSourceRangeForRange:()IKJSInspector withNewLineIndexSet:;
+ (id)ik_newLineIndexSetForStyleMarkup:()IKJSInspector;
+ (uint64_t)ik_emptySourceRange;
- (uint64_t)ik_rangeWithNewLineIndexSet:()IKJSInspector;
@end

@implementation RWIProtocolCSSSourceRange(IKJSInspector)

+ (id)ik_newLineIndexSetForStyleMarkup:()IKJSInspector
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E60] indexSet];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  if ([v3 length])
  {
    unint64_t v7 = 0;
    do
    {
      if (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v7))) {
        [v4 addIndex:v7];
      }
      ++v7;
    }
    while ([v3 length] > v7);
  }
  v8 = ITMLKitGetLogObject(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[RWIProtocolCSSSourceRange(IKJSInspector) ik_newLineIndexSetForStyleMarkup:]((uint64_t)v5);
  }

  return v4;
}

+ (uint64_t)ik_emptySourceRange
{
  return objc_msgSend(MEMORY[0x1E4FB6C38], "safe_initWithStartLine:startColumn:endLine:endColumn:", 0, 0, 0, 0);
}

+ (id)ik_cssSourceRangeForRange:()IKJSInspector withNewLineIndexSet:
{
  v6 = 0;
  if (a5)
  {
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = a3 + a4;
      id v9 = a5;
      int v10 = objc_msgSend(v9, "countOfIndexesInRange:", 0, a3);
      int v11 = objc_msgSend(v9, "countOfIndexesInRange:", 0, v8);
      uint64_t v12 = a3 + ~[v9 indexLessThanIndex:a3];
      int v13 = [v9 indexLessThanIndex:v8];

      v6 = objc_msgSend(MEMORY[0x1E4FB6C38], "safe_initWithStartLine:startColumn:endLine:endColumn:", (v10 + 1), v12, (v11 + 1), (v8 + ~v13));
    }
    uint64_t v5 = vars8;
  }
  return v6;
}

- (uint64_t)ik_rangeWithNewLineIndexSet:()IKJSInspector
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  if ([a1 startLine] == 1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = -100;
  }
  uint64_t v18 = v5;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if ([a1 endLine] == 1) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -100;
  }
  uint64_t v14 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__RWIProtocolCSSSourceRange_IKJSInspector__ik_rangeWithNewLineIndexSet___block_invoke;
  v10[3] = &unk_1E6DE3F60;
  v10[4] = a1;
  v10[5] = v19;
  v10[6] = &v15;
  v10[7] = &v11;
  [v4 enumerateIndexesUsingBlock:v10];
  uint64_t v7 = v16[3];
  if (v7 == -100) {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v8 = v7 + (int)[a1 startColumn];
  }
  if (v12[3] != -100) {
    [a1 endColumn];
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return v8;
}

+ (void)ik_newLineIndexSetForStyleMarkup:()IKJSInspector .cold.1(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:a1];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xCu);
}

@end