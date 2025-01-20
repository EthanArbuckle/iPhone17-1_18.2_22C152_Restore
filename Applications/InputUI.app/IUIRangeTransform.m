@interface IUIRangeTransform
+ (_NSRange)rangeInDocumentState:(id)a3 fromTextRange:(id)a4 inUITextInput:(id)a5;
+ (id)textRangeInUITextInput:(id)a3 fromRange:(_NSRange)a4 inDocumentState:(id)a5;
@end

@implementation IUIRangeTransform

+ (_NSRange)rangeInDocumentState:(id)a3 fromTextRange:(id)a4 inUITextInput:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v8 selectedTextRange];
  v11 = [v10 end];

  v12 = [v9 start];
  v36 = (char *)[v8 offsetFromPosition:v12 toPosition:v11];

  v13 = [v9 end];

  v35 = (char *)[v8 offsetFromPosition:v13 toPosition:v11];
  v14 = [v7 contextBeforeInput];
  v34 = (char *)[v14 length];
  v15 = [v7 markedText];
  if (v15)
  {
    v16 = (char *)[v7 selectedRangeInMarkedText];
    v18 = &v16[v17];
  }
  else
  {
    v19 = [v7 selectedText];
    v18 = (char *)[v19 length];
  }
  v20 = [v7 contextBeforeInput];
  id v21 = [v20 length];
  v22 = [v7 markedText];
  if (v22) {
    [v7 markedText];
  }
  else {
  v23 = [v7 selectedText];
  }
  id v24 = [v23 length];
  v25 = [v7 contextAfterInput];
  id v26 = [v25 length];

  BOOL v29 = &v34[(void)v18] - v36 < 0
     || (uint64_t)((uint64_t)v21 + (void)v24 + (unint64_t)v26) < &v34[(void)v18] - v35
     || (uint64_t)v36 < (uint64_t)v35;
  if (v29) {
    NSUInteger v30 = 0;
  }
  else {
    NSUInteger v30 = v36 - v35;
  }
  if (v29) {
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v31 = &v34[(void)v18] - v36;
  }

  NSUInteger v32 = v31;
  NSUInteger v33 = v30;
  result.length = v33;
  result.location = v32;
  return result;
}

+ (id)textRangeInUITextInput:(id)a3 fromRange:(_NSRange)a4 inDocumentState:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (location == 0x7FFFFFFFFFFFFFFFLL || (NSUInteger v11 = location + length, (uint64_t)(location + length) < 0))
  {
    v18 = 0;
  }
  else
  {
    v12 = [v9 contextBeforeInput];
    v13 = (char *)[v12 length];
    v14 = [v10 markedText];
    if (v14)
    {
      v15 = (char *)[v10 selectedRangeInMarkedText];
      uint64_t v17 = &v15[v16];
    }
    else
    {
      v19 = [v10 selectedText];
      uint64_t v17 = (char *)[v19 length];
    }
    v20 = &v13[(void)v17];

    NSUInteger v21 = location - (void)v20;
    NSUInteger v22 = v11 - (void)v20;
    v23 = [v8 selectedTextRange];
    id v24 = [v23 end];

    v25 = [v8 positionFromPosition:v24 offset:v21];
    uint64_t v26 = [v8 positionFromPosition:v24 offset:v22];
    v27 = (void *)v26;
    v18 = 0;
    if (v25 && v26)
    {
      v18 = [v8 textRangeFromPosition:v25 toPosition:v26];
    }
  }

  return v18;
}

@end