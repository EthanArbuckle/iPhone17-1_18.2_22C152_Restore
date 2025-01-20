@interface NSObject_QSSupport
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsTextInput;
- (BOOL)_accessibilityIsTextInteraction;
- (id)_accessibilityQuickSpeakContent;
- (id)_accessibilityQuickSpeakEnclosingSentence:(id *)a3;
- (id)_accessibilityQuickSpeakTokenizer;
- (id)_accessibilitySentenceRectsForRange:(id)a3;
- (id)_accessibilityTextRectsForRange:(id)a3 singleTextRect:(CGRect *)a4;
- (id)_accessibilityUITextInput;
- (void)_accessibilityQuickSpeakContent;
@end

@implementation NSObject_QSSupport

+ (id)safeCategoryTargetClassName
{
  return @"NSObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityQuickSpeakTokenizer
{
  return 0;
}

- (BOOL)_accessibilityIsTextInput
{
  if (objc_opt_respondsToSelector()) {
    char v2 = objc_opt_respondsToSelector();
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (BOOL)_accessibilityIsTextInteraction
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)_accessibilityUITextInput
{
  if ([(NSObject_QSSupport *)self _accessibilityIsTextInput]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  if ([(NSObject_QSSupport *)self _accessibilityIsTextInteraction])
  {
    uint64_t v4 = [(NSObject_QSSupport *)self safeValueForKey:@"_textInput"];

    v3 = (NSObject_QSSupport *)v4;
  }
  return v3;
}

- (id)_accessibilityQuickSpeakEnclosingSentence:(id *)a3
{
  v5 = [(NSObject_QSSupport *)self _accessibilityUITextInput];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 selectedTextRange];
    v8 = [(NSObject_QSSupport *)self safeValueForKey:@"_accessibilityQuickSpeakTokenizer"];
    v9 = AXUISentenceTextRangeForInput(v6, v7, v8);
    v10 = v9;
    if (v9)
    {
      if (a3) {
        *a3 = v9;
      }
      v11 = [v6 textInRange:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
    }
    v11 = 0;
LABEL_8:

    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)_accessibilityQuickSpeakContent
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(NSObject_QSSupport *)self _accessibilityUITextInput];
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = [v3 selectedTextRange];
    if (v5)
    {
      v6 = [v4 textInRange:v5];
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {

        goto LABEL_14;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (buf[0] = 0,
        objc_opt_class(),
        __UIAccessibilityCastAsClass(),
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 canPerformAction:sel_copy_ withSender:0],
        v7,
        v8))
  {
    uint64_t v9 = [MEMORY[0x1E4FB1A78] _accessibilityUseQuickSpeakPasteBoard];
    [MEMORY[0x1E4FB1A78] _accessibilitySetUseQuickSpeakPasteBoard:1];
    v10 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v10 setStrings:0];
    v11 = AXLogSpeakSelection();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [(NSObject_QSSupport *)v13 _accessibilityQuickSpeakContent];
    }

    [(NSObject_QSSupport *)self performSelector:sel_copy_ withObject:0];
    v14 = [MEMORY[0x1E4F28E78] string];
    v15 = [v10 strings];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __53__NSObject_QSSupport__accessibilityQuickSpeakContent__block_invoke;
    v23 = &unk_1E649C9F0;
    id v24 = v14;
    id v25 = v15;
    id v16 = v15;
    id v17 = v14;
    [v16 enumerateObjectsUsingBlock:&v20];
    objc_msgSend(MEMORY[0x1E4FB1A78], "_accessibilitySetUseQuickSpeakPasteBoard:", v9, v20, v21, v22, v23);
    v18 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v6 = [v17 stringByTrimmingCharactersInSet:v18];
  }
  else
  {
    v6 = 0;
  }
LABEL_14:

  return v6;
}

- (id)_accessibilitySentenceRectsForRange:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(NSObject_QSSupport *)self safeValueForKey:@"_accessibilityQuickSpeakTokenizer"];
  v7 = self;
  int v8 = AXUISentenceTextRangeForInput(v7, v4, v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__NSObject_QSSupport__accessibilitySentenceRectsForRange___block_invoke;
  aBlock[3] = &unk_1E649CA18;
  uint64_t v9 = v7;
  v22 = v9;
  id v10 = v8;
  id v23 = v10;
  v11 = (unsigned int (**)(void *, void *))_Block_copy(aBlock);
  v12 = [v10 start];
  uint64_t v13 = [(NSObject_QSSupport *)v9 positionFromPosition:v12 offset:1];
  if (v13)
  {
    v14 = (void *)v13;
    while (v11[2](v11, v14))
    {
      v15 = [(NSObject_QSSupport *)v9 textRangeFromPosition:v12 toPosition:v14];
      long long v19 = 0u;
      long long v20 = 0u;
      id v16 = [(NSObject_QSSupport *)v9 _accessibilityTextRectsForRange:v15 singleTextRect:&v19];
      if (*(double *)&v20 > 0.0) {
        QSUnionRectsWithRect(v5, *(CGFloat *)&v19, *((double *)&v19 + 1), *(CGFloat *)&v20, *((CGFloat *)&v20 + 1));
      }
      id v17 = v14;

      v14 = [(NSObject_QSSupport *)v9 positionFromPosition:v17 offset:1];

      v12 = v17;
      if (!v14)
      {
        v12 = v17;
        break;
      }
    }
  }
  return v5;
}

- (id)_accessibilityTextRectsForRange:(id)a3 singleTextRect:(CGRect *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(NSObject_QSSupport *)self _accessibilityIsTextInput]) {
    goto LABEL_6;
  }
  v7 = self;
  int v8 = [v6 start];
  uint64_t v9 = [v6 end];
  uint64_t v10 = [(NSObject_QSSupport *)v7 offsetFromPosition:v8 toPosition:v9];

  if (!v10)
  {

LABEL_6:
    v12 = 0;
    goto LABEL_33;
  }
  if (objc_opt_respondsToSelector())
  {
    v11 = [(NSObject_QSSupport *)v7 selectionRectsForRange:v6];
  }
  else
  {
    v11 = 0;
  }
  unint64_t v13 = 0x1E4F1C000;
  if ([v11 count])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v52 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            unint64_t v13 = 0x1E4F1C000uLL;
            goto LABEL_26;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v51 objects:v58 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v19 = v14;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = (void *)MEMORY[0x1E4F29238];
          objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "rect", (void)v47);
          id v25 = objc_msgSend(v24, "valueWithCGRect:");
          [v12 addObject:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v21);
    }

    v26 = [v12 firstObject];
    [v26 CGRectValue];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;

    unint64_t v13 = 0x1E4F1C000;
  }
  else
  {
LABEL_26:
    [(NSObject_QSSupport *)v7 firstRectForRange:v6];
    CGFloat v28 = v35;
    CGFloat v30 = v36;
    CGFloat v32 = v37;
    CGFloat v34 = v38;
    v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
    v56 = v39;
    v12 = [*(id *)(v13 + 2424) arrayWithObjects:&v56 count:1];
  }
  v61.origin.x = v28;
  v61.origin.y = v30;
  v61.size.width = v32;
  v61.size.height = v34;
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v61) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(NSObject_QSSupport *)v7 _accessibilitySpeakRectForRange:v6];
    CGFloat v28 = v40;
    CGFloat v30 = v41;
    CGFloat v32 = v42;
    CGFloat v34 = v43;
    v44 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
    v55 = v44;
    uint64_t v45 = [*(id *)(v13 + 2424) arrayWithObjects:&v55 count:1];

    v12 = (void *)v45;
  }
  if (a4)
  {
    a4->origin.x = v28;
    a4->origin.y = v30;
    a4->size.width = v32;
    a4->size.height = v34;
  }

LABEL_33:
  return v12;
}

- (void)_accessibilityQuickSpeakContent
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1C39D1000, log, OS_LOG_TYPE_DEBUG, "Wil call copy: on %@<%p> for speak selection content", buf, 0x16u);
}

@end