@interface RWIProtocolCSSStyle(IKJSInspector)
+ (id)ik_cssStyleFromDeclarationList:()IKJSInspector forStyleMarkup:withNewLineIndexSet:existingStyle:;
@end

@implementation RWIProtocolCSSStyle(IKJSInspector)

+ (id)ik_cssStyleFromDeclarationList:()IKJSInspector forStyleMarkup:withNewLineIndexSet:existingStyle:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v41 = a6;
  v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  if ([v9 count])
  {
    unint64_t v13 = 0;
    do
    {
      v14 = [v9 declarationAtIndex:v13];
      v15 = v14;
      if (v10)
      {
        uint64_t v16 = [v14 valueRange];
        objc_msgSend(v10, "substringWithRange:", v16, v17);
      }
      else
      {
        [v14 stringValue];
      v18 = };
      v19 = (void *)MEMORY[0x1E4FB6BF0];
      v20 = [v15 name];
      v21 = objc_msgSend(v19, "safe_initWithName:value:", v20, v18);

      [v21 setParsedOk:1];
      [v21 setStatus:0];
      if (v10)
      {
        uint64_t v22 = [v15 range];
        v24 = objc_msgSend(v10, "substringWithRange:", v22, v23);
        [v21 setText:v24];
      }
      v25 = (void *)MEMORY[0x1E4FB6C38];
      uint64_t v26 = [v15 range];
      v28 = objc_msgSend(v25, "ik_cssSourceRangeForRange:withNewLineIndexSet:", v26, v27, v11);
      if (v28) {
        [v21 setRange:v28];
      }
      [v12 addObject:v21];

      ++v13;
    }
    while ([v9 count] > v13);
  }
  id v29 = v41;
  v30 = v29;
  if (v29)
  {
    [v29 setCssProperties:v12];
    v31 = v30;
    if (!v9) {
      goto LABEL_23;
    }
  }
  else
  {
    v31 = objc_msgSend(MEMORY[0x1E4FB6C40], "safe_initWithCssProperties:shorthandEntries:", v12, MEMORY[0x1E4F1CBF0]);
    if (!v9) {
      goto LABEL_23;
    }
  }
  uint64_t v32 = [v9 range];
  uint64_t v42 = v33;
  v34 = [v30 styleId];
  v35 = [v34 styleSheetId];
  int v36 = [v35 isEqualToString:@"inline"];

  if (v36)
  {
    uint64_t v37 = [v10 length];
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v37 = v42;
  }
  v38 = objc_msgSend(MEMORY[0x1E4FB6C38], "ik_cssSourceRangeForRange:withNewLineIndexSet:", v32, v37, v11);
  if (v38) {
    [v31 setRange:v38];
  }
  if (v10)
  {
    v39 = objc_msgSend(v10, "substringWithRange:", v32, v37);
    [v31 setCssText:v39];
  }
LABEL_23:

  return v31;
}

@end