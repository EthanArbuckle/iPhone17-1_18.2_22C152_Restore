@interface UIWebBrowserView_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_rangeStringMatch:(id)a3 wordText:(id)a4;
- (id)_accessibilitySearchTextRangeFromRange:(id)a3 withString:(id)a4 selectedRange:(id)a5;
- (id)_accessibilityTextRectsForRange:(id)a3 singleTextRect:(CGRect *)a4 selectedRange:(id)a5 string:(id)a6;
- (id)_adjustedRange:(id)a3 withText:(id)a4 matchText:(id)a5 initiator:(id)a6;
@end

@implementation UIWebBrowserView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"UIWebBrowserView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UIWebBrowserView" isKindOfClass:@"UIWebDocumentView"];
  [v3 validateClass:@"UIWebDocumentView" conformsToProtocol:@"UITextInputPrivate"];
}

- (id)_accessibilityTextRectsForRange:(id)a3 singleTextRect:(CGRect *)a4 selectedRange:(id)a5 string:(id)a6
{
  v8 = [(UIWebBrowserView_QSExtras *)self _accessibilitySearchTextRangeFromRange:a3 withString:a6 selectedRange:a5];
  v9 = [(UIWebBrowserView_QSExtras *)self _accessibilityTextRectsForRange:v8 singleTextRect:a4];

  return v9;
}

- (id)_accessibilitySearchTextRangeFromRange:(id)a3 withString:(id)a4 selectedRange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = [(UIWebBrowserView_QSExtras *)v11 textInRange:v8];
  if ([(UIWebBrowserView_QSExtras *)v11 _rangeStringMatch:v12 wordText:v9])
  {
    v13 = [(UIWebBrowserView_QSExtras *)v11 _adjustedRange:v8 withText:v12 matchText:v9 initiator:v11];
    goto LABEL_35;
  }
  v35 = v12;
  v14 = [v10 start];
  v38 = v10;
  v15 = [v10 end];
  uint64_t v16 = [(UIWebBrowserView_QSExtras *)v11 offsetFromPosition:v14 toPosition:v15];

  uint64_t v17 = [v9 length];
  uint64_t v18 = [v8 start];
  uint64_t v19 = [v8 start];
  id v36 = v8;
  id v34 = v8;
  BOOL v20 = v18 != 0;
  BOOL v21 = v19 != 0;
  if (!(v18 | v19))
  {
LABEL_29:
    v12 = v35;
    id v8 = v36;
    id v10 = v38;
    v13 = v34;
    goto LABEL_35;
  }
  uint64_t v37 = v16;
  while (1)
  {
    if (v20)
    {
      v22 = [(UIWebBrowserView_QSExtras *)v11 positionFromPosition:v18 offset:1];
    }
    else
    {
      v22 = 0;
    }

    if (v21)
    {
      v23 = [(UIWebBrowserView_QSExtras *)v11 positionFromPosition:v19 offset:-1];
    }
    else
    {
      v23 = 0;
    }

    if (v22) {
      break;
    }
    uint64_t v18 = 0;
    if (v23) {
      goto LABEL_21;
    }
LABEL_17:
    uint64_t v19 = 0;
LABEL_28:
    BOOL v20 = v18 != 0;
    BOOL v21 = v19 != 0;
    if (!(v18 | v19)) {
      goto LABEL_29;
    }
  }
  v24 = [(UIWebBrowserView_QSExtras *)v11 positionFromPosition:v22 offset:v17];
  v25 = [(UIWebBrowserView_QSExtras *)v11 textRangeFromPosition:v22 toPosition:v24];
  if (!v25)
  {
    v26 = 0;
    v29 = 0;
    if ([(UIWebBrowserView_QSExtras *)v11 _rangeStringMatch:0 wordText:v9]) {
      goto LABEL_31;
    }
LABEL_19:

    v22 = 0;
    goto LABEL_20;
  }
  v26 = [(UIWebBrowserView_QSExtras *)v11 textInRange:v25];
  if ([(UIWebBrowserView_QSExtras *)v11 _rangeStringMatch:v26 wordText:v9])
  {
    v29 = v26;
LABEL_31:
    v13 = [(UIWebBrowserView_QSExtras *)v11 _adjustedRange:v25 withText:v29 matchText:v9 initiator:v11];
    goto LABEL_34;
  }
  v27 = [v38 start];
  uint64_t v28 = [(UIWebBrowserView_QSExtras *)v11 offsetFromPosition:v27 toPosition:v24];

  if (v28 > v37) {
    goto LABEL_19;
  }
LABEL_20:

  uint64_t v18 = (uint64_t)v22;
  if (!v23) {
    goto LABEL_17;
  }
LABEL_21:
  v24 = [(UIWebBrowserView_QSExtras *)v11 positionFromPosition:v23 offset:v17];
  v25 = [(UIWebBrowserView_QSExtras *)v11 textRangeFromPosition:v23 toPosition:v24];
  if (!v25)
  {
    v30 = 0;
    v29 = 0;
    if ([(UIWebBrowserView_QSExtras *)v11 _rangeStringMatch:0 wordText:v9]) {
      goto LABEL_33;
    }
LABEL_26:

    v23 = 0;
LABEL_27:

    uint64_t v19 = (uint64_t)v23;
    goto LABEL_28;
  }
  v30 = [(UIWebBrowserView_QSExtras *)v11 textInRange:v25];
  if (![(UIWebBrowserView_QSExtras *)v11 _rangeStringMatch:v30 wordText:v9])
  {
    v31 = [v38 start];
    uint64_t v32 = [(UIWebBrowserView_QSExtras *)v11 offsetFromPosition:v31 toPosition:v23];

    if (v32 < 0) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v29 = v30;
LABEL_33:
  v13 = [(UIWebBrowserView_QSExtras *)v11 _adjustedRange:v25 withText:v29 matchText:v9 initiator:v11];
  v22 = (void *)v18;
LABEL_34:

  v12 = v35;
  id v8 = v36;
  id v10 = v38;
LABEL_35:

  return v13;
}

- (id)_adjustedRange:(id)a3 withText:(id)a4 matchText:(id)a5 initiator:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = [v10 length];
  if (v13 >= [v11 length])
  {
    uint64_t v17 = 0;
  }
  else
  {
    v14 = [v9 start];
    v15 = [v9 end];
    uint64_t v16 = objc_msgSend(v12, "positionFromPosition:offset:", v15, objc_msgSend(v11, "length") - objc_msgSend(v10, "length"));
    uint64_t v17 = [v12 textRangeFromPosition:v14 toPosition:v16];
  }
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v9;
  }
  id v19 = v18;

  return v19;
}

- (BOOL)_rangeStringMatch:(id)a3 wordText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length]) {
    BOOL v7 = [v5 rangeOfString:v6] != 0x7FFFFFFFFFFFFFFFLL
  }
      || [v6 rangeOfString:v5] != 0x7FFFFFFFFFFFFFFFLL;
  else {
    BOOL v7 = 0;
  }

  return v7;
}

@end