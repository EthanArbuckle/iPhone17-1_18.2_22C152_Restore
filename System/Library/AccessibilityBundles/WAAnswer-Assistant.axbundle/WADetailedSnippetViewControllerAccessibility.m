@interface WADetailedSnippetViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityLabelForAnswerAtIndex:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)loadView;
@end

@implementation WADetailedSnippetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WADetailedSnippetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForAnswerAtIndex:(unint64_t)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v4 = [(WADetailedSnippetViewControllerAccessibility *)self safeValueForKey:@"snippet"];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v5 = [v4 safeValueForKey:@"answers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke;
    v8[3] = &unk_265168178;
    v8[4] = v9;
    v8[5] = &v10;
    v8[6] = a3;
    [v5 enumerateObjectsUsingBlock:v8];
  }
  id v6 = (id)v11[5];

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = v6;
  uint64_t v8 = *(void *)(a1[4] + 8);
  uint64_t v9 = *(void *)(v8 + 24);
  if (a1[6] == v9)
  {
    uint64_t v10 = [v6 safeValueForKey:@"title"];
    uint64_t v11 = *(void *)(a1[5] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
    uint64_t v8 = *(void *)(a1[4] + 8);
    uint64_t v9 = *(void *)(v8 + 24);
  }
  *(void *)(v8 + 24) = v9 + 1;
  v13 = [v7 safeValueForKey:@"lines"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke_2;
    v15[3] = &unk_265168150;
    uint64_t v14 = a1[6];
    long long v16 = *((_OWORD *)a1 + 2);
    uint64_t v17 = v14;
    v18 = a4;
    [v13 enumerateObjectsUsingBlock:v15];
  }
}

void __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (*(void *)(a1 + 48) == v5)
  {
    uint64_t v8 = [a2 safeValueForKey:@"text"];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void *)(v4 + 24);
  }
  *(void *)(v4 + 24) = v5 + 1;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)WADetailedSnippetViewControllerAccessibility;
  [(WADetailedSnippetViewControllerAccessibility *)&v5 loadView];
  v3 = [(WADetailedSnippetViewControllerAccessibility *)self safeValueForKey:@"_answerViews"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__WADetailedSnippetViewControllerAccessibility_loadView__block_invoke;
  v4[3] = &unk_2651681A0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __56__WADetailedSnippetViewControllerAccessibility_loadView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  id v6 = [*(id *)(a1 + 32) _accessibilityLabelForAnswerAtIndex:a3];
  [v5 setAccessibilityLabel:v6];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WADetailedSnippetViewControllerAccessibility;
  id v6 = a4;
  v7 = [(WADetailedSnippetViewControllerAccessibility *)&v12 collectionView:a3 cellForItemAtIndexPath:v6];
  objc_msgSend(v7, "setIsAccessibilityElement:", 1, v12.receiver, v12.super_class);
  uint64_t v8 = [v6 row];

  uint64_t v9 = [(WADetailedSnippetViewControllerAccessibility *)self _accessibilityLabelForAnswerAtIndex:v8];
  [v7 setAccessibilityLabel:v9];
  NSClassFromString(&cfstr_Watextheadervi.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = (void *)MEMORY[0x263F1CEF8];
LABEL_3:
    [v7 setAccessibilityTraits:*v10];
    goto LABEL_6;
  }
  NSClassFromString(&cfstr_Waimageview.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v9 length])
  {
    uint64_t v10 = (void *)MEMORY[0x263F1CF00];
    goto LABEL_3;
  }
LABEL_6:

  return v7;
}

@end