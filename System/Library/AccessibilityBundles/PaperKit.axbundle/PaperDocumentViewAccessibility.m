@interface PaperDocumentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)axInsertFormFieldsIntoHierarchy;
- (void)axRemoveFormFieldFromHierarchy:(id)a3;
@end

@implementation PaperDocumentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PaperKit.PaperDocumentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PaperKit.PaperDocumentView"];
  [v3 validateClass:@"PDFView"];
  [v3 validateClass:@"PaperKit.PaperDocumentView" hasSwiftField:@"pdfView" withSwiftType:"Optional<PDFView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PaperKit.PaperDocumentView", @"axDetectedFormElements", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PaperKit.PaperDocumentView", @"axCurrentPageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PaperKit.PaperDocumentView", @"axTapOnShapeView:", "v", "@", 0);
  if (NSClassFromString(&cfstr_Pdfpageviewacc.isa))
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFPageViewAccessibility", @"_accessibilityInsertAnnotation:", "B", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFPageViewAccessibility", @"_accessibilityRemoveAnnotation:", "B", "@", 0);
  }
}

- (void)axInsertFormFieldsIntoHierarchy
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy_;
  v39[4] = __Block_byref_object_dispose_;
  id v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __65__PaperDocumentViewAccessibility_axInsertFormFieldsIntoHierarchy__block_invoke;
  v29 = &unk_265140798;
  v30 = self;
  v31 = v39;
  v32 = &v33;
  AXPerformSafeBlock();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)v34[5];
  uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v41 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v23;
    v10 = v14;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v23 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v6 = objc_msgSend(v5, "accessibilityContainer", v10);
        NSClassFromString(&cfstr_PaperkitFormfi.isa);
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id location = 0;
          p_id location = &location;
          uint64_t v20 = 0x2020000000;
          char v21 = 0;
          from[1] = (id)MEMORY[0x263EF8330];
          from[2] = (id)3221225472;
          from[3] = __65__PaperDocumentViewAccessibility_axInsertFormFieldsIntoHierarchy__block_invoke_2;
          from[4] = &unk_2651407C0;
          from[6] = &location;
          from[7] = v39;
          from[5] = v5;
          AXPerformSafeBlock();
          int v8 = *((unsigned __int8 *)p_location + 24);
          _Block_object_dispose(&location, 8);
          if (v8)
          {
            objc_initWeak(&location, v5);
            objc_initWeak(from, self);
            v13[0] = MEMORY[0x263EF8330];
            v13[1] = 3221225472;
            v14[0] = __65__PaperDocumentViewAccessibility_axInsertFormFieldsIntoHierarchy__block_invoke_3;
            v14[1] = &unk_265140810;
            objc_copyWeak(&v15, from);
            objc_copyWeak(&v16, &location);
            [v5 setAccessibilityActivateBlock:v13];
            uint64_t v9 = [v5 accessibilityTraits];
            [v5 setAccessibilityTraits:*MEMORY[0x263F81408] | v9];
            objc_destroyWeak(&v16);
            objc_destroyWeak(&v15);
            objc_destroyWeak(from);
            objc_destroyWeak(&location);
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v41 count:16];
    }
    while (v2);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v39, 8);
}

uint64_t __65__PaperDocumentViewAccessibility_axInsertFormFieldsIntoHierarchy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) axCurrentPageView];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) axDetectedFormElements];

  return MEMORY[0x270F9A758]();
}

uint64_t __65__PaperDocumentViewAccessibility_axInsertFormFieldsIntoHierarchy__block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(*(void *)(a1[6] + 8) + 40) _accessibilityInsertAnnotation:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __65__PaperDocumentViewAccessibility_axInsertFormFieldsIntoHierarchy__block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_copyWeak(&v4, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v3);
  return 1;
}

void __65__PaperDocumentViewAccessibility_axInsertFormFieldsIntoHierarchy__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained axTapOnShapeView:v2];
}

- (void)axRemoveFormFieldFromHierarchy:(id)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy_;
  v4[4] = __Block_byref_object_dispose_;
  id v5 = 0;
  id v3 = a3;
  AXPerformSafeBlock();

  _Block_object_dispose(v4, 8);
}

uint64_t __65__PaperDocumentViewAccessibility_axRemoveFormFieldFromHierarchy___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) axCurrentPageView];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 40);
  v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v6 _accessibilityRemoveAnnotation:v5];
}

@end