@interface AXUITextViewParagraphElement
@end

@implementation AXUITextViewParagraphElement

double __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [v5 range];
  objc_msgSend(WeakRetained, "_accessibilityBoundsForRange:", v7, v1);
  double v8 = v2;

  return v8;
}

uint64_t __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  char v8 = 0;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = (id)__UIAccessibilityCastAsSafeCategory();

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = -[UITextViewAccessibility _accessibilityActivateLink:](v6, v2);

  return v3 & 1;
}

@end