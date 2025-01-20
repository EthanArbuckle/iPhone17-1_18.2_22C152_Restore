@interface RWIProtocolCSSRule(IKJSInspector)
+ (id)ik_cssRuleForRule:()IKJSInspector withOrdinal:forStyleSheetHeader:forStyleMarkup:withNewLineIndexSet:;
- (id)ik_ruleMatchForClassSelectors:()IKJSInspector andIdSelector:;
@end

@implementation RWIProtocolCSSRule(IKJSInspector)

+ (id)ik_cssRuleForRule:()IKJSInspector withOrdinal:forStyleSheetHeader:forStyleMarkup:withNewLineIndexSet:
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  v14 = (void *)MEMORY[0x1E4FB6C28];
  id v15 = a7;
  id v16 = a6;
  v17 = [v12 selectorList];
  v18 = objc_msgSend(v14, "ik_cssSelectorListFromSelectorList:forStyleMarkup:withNewLineIndexSet:", v17, v16, v15);

  v19 = (void *)MEMORY[0x1E4FB6C40];
  v20 = [v12 declarationList];
  v21 = objc_msgSend(v19, "ik_cssStyleFromDeclarationList:forStyleMarkup:withNewLineIndexSet:existingStyle:", v20, v16, v15, 0);

  v22 = (void *)MEMORY[0x1E4FB6C50];
  v23 = [v13 styleSheetId];
  v24 = objc_msgSend(v22, "safe_initWithStyleSheetId:ordinal:", v23, a4);

  [v21 setStyleId:v24];
  v25 = (void *)MEMORY[0x1E4FB6C08];
  if (v16)
  {
    v7 = [v18 range];
    uint64_t v26 = [v7 startLine];
  }
  else
  {
    uint64_t v26 = 0;
  }
  v27 = objc_msgSend(v25, "safe_initWithSelectorList:sourceLine:origin:style:", v18, v26, objc_msgSend(v13, "origin"), v21);
  if (v16) {

  }
  v28 = (void *)MEMORY[0x1E4FB6C10];
  v29 = [v13 styleSheetId];
  v30 = objc_msgSend(v28, "safe_initWithStyleSheetId:ordinal:", v29, a4);

  [v27 setRuleId:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = (void *)MEMORY[0x1E4FB6BE0];
    id v32 = v12;
    v33 = objc_msgSend(v31, "safe_initWithType:", 0);
    v34 = [v32 mediaQuery];

    v35 = [v34 queryExpression];
    [v33 setText:v35];

    v38[0] = v33;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [v27 setGroupings:v36];
  }
  return v27;
}

- (id)ik_ruleMatchForClassSelectors:()IKJSInspector andIdSelector:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  v27 = a1;
  v9 = [a1 selectorList];
  v10 = [v9 selectors];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    while (1)
    {
      id v13 = [v9 selectors];
      v14 = [v13 objectAtIndex:v12];

      if ([v7 length])
      {
        id v15 = [v14 text];
        if ([v15 hasPrefix:@"#"])
        {
          id v16 = [v14 text];
          v17 = [NSString stringWithFormat:@"#%@", v7];
          char v18 = [v16 isEqualToString:v17];

          if (v18) {
            break;
          }
        }
        else
        {
        }
      }
      if ([v6 count])
      {
        v19 = [v14 text];
        if (![v19 hasPrefix:@"."]) {
          goto LABEL_12;
        }
        v20 = [v14 text];
        v21 = [v20 substringFromIndex:1];
        int v22 = [v6 containsObject:v21];

        if (v22) {
          break;
        }
      }
LABEL_13:

      ++v12;
      v23 = [v9 selectors];
      unint64_t v24 = [v23 count];

      if (v12 >= v24) {
        goto LABEL_14;
      }
    }
    v19 = [NSNumber numberWithUnsignedInteger:v12];
    [v8 addObject:v19];
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
  v25 = objc_msgSend(MEMORY[0x1E4FB6C18], "safe_initWithRule:matchingSelectors:", v27, v8);

  return v25;
}

@end