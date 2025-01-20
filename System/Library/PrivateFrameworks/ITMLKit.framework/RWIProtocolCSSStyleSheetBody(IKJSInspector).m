@interface RWIProtocolCSSStyleSheetBody(IKJSInspector)
+ (id)ik_stylesheetBodyFromRuleList:()IKJSInspector forStyleMarkup:withHeader:;
- (id)ik_ruleList;
- (id)ik_textNewLineIndexSet;
- (void)ik_setRuleList:()IKJSInspector;
- (void)ik_setTextNewLineIndexSet:()IKJSInspector;
@end

@implementation RWIProtocolCSSStyleSheetBody(IKJSInspector)

+ (id)ik_stylesheetBodyFromRuleList:()IKJSInspector forStyleMarkup:withHeader:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v11 = objc_msgSend(MEMORY[0x1E4FB6C38], "ik_newLineIndexSetForStyleMarkup:", v8);
    if ([v7 count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v7 ruleAtIndex:v12];
        v14 = objc_msgSend(MEMORY[0x1E4FB6C08], "ik_cssRuleForRule:withOrdinal:forStyleSheetHeader:forStyleMarkup:withNewLineIndexSet:", v13, v12, v9, v8, v11);
        [v10 addObject:v14];

        ++v12;
      }
      while ([v7 count] > v12);
    }
    v15 = (void *)MEMORY[0x1E4FB6C58];
    v16 = [v9 styleSheetId];
    v17 = objc_msgSend(v15, "safe_initWithStyleSheetId:rules:", v16, v10);

    [v17 setText:v8];
    objc_msgSend(v17, "ik_setTextNewLineIndexSet:", v11);
    objc_msgSend(v17, "ik_setRuleList:", v7);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)ik_ruleList
{
  return objc_getAssociatedObject(a1, sel_ik_ruleList);
}

- (void)ik_setRuleList:()IKJSInspector
{
  id value = a3;
  objc_msgSend(a1, "ik_ruleList");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_ik_ruleList, value, (void *)1);
    v5 = value;
  }
}

- (id)ik_textNewLineIndexSet
{
  return objc_getAssociatedObject(a1, sel_ik_textNewLineIndexSet);
}

- (void)ik_setTextNewLineIndexSet:()IKJSInspector
{
  id value = a3;
  objc_msgSend(a1, "ik_textNewLineIndexSet");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_ik_textNewLineIndexSet, value, (void *)1);
    v5 = value;
  }
}

@end