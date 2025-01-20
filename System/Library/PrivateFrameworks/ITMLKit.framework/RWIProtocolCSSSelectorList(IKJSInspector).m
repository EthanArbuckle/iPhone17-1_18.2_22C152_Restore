@interface RWIProtocolCSSSelectorList(IKJSInspector)
+ (id)ik_cssSelectorListFromSelectorList:()IKJSInspector forStyleMarkup:withNewLineIndexSet:;
@end

@implementation RWIProtocolCSSSelectorList(IKJSInspector)

+ (id)ik_cssSelectorListFromSelectorList:()IKJSInspector forStyleMarkup:withNewLineIndexSet:
{
  id v6 = a3;
  id v28 = a5;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = [MEMORY[0x1E4F28E78] string];
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v6 selectorAtIndex:v9];
      v11 = (void *)MEMORY[0x1E4FB6C20];
      v12 = [v10 stringValue];
      v13 = objc_msgSend(v11, "safe_initWithText:", v12);

      [v7 addObject:v13];
      if (v9) {
        v14 = @", ";
      }
      else {
        v14 = &stru_1F3E09950;
      }
      v15 = [v10 stringValue];
      [v8 appendFormat:@"%@%@", v14, v15];

      ++v9;
    }
    while ([v6 count] > v9);
  }
  v16 = objc_msgSend(MEMORY[0x1E4FB6C28], "safe_initWithSelectors:text:", v7, v8);
  if ([v6 count])
  {
    v17 = [v6 selectorAtIndex:0];
    NSUInteger v18 = [v17 range];
    NSUInteger v20 = v19;

    v21 = objc_msgSend(v6, "selectorAtIndex:", objc_msgSend(v6, "count") - 1);
    NSUInteger v22 = [v21 range];
    NSUInteger v24 = v23;

    v30.location = v18;
    v30.length = v20;
    v31.location = v22;
    v31.length = v24;
    NSRange v25 = NSUnionRange(v30, v31);
    v26 = objc_msgSend(MEMORY[0x1E4FB6C38], "ik_cssSourceRangeForRange:withNewLineIndexSet:", v25.location, v25.length, v28);
    if (v26) {
      [v16 setRange:v26];
    }
  }
  return v16;
}

@end