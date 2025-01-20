@interface NSObject(NSObjectAccessibilityUI)
- (id)_accessibilityUIFindAXDescendants:()NSObjectAccessibilityUI byAddingElements:;
- (id)_accessibilityUIFindAnyAXDescendant:()NSObjectAccessibilityUI byAddingElements:;
- (uint64_t)_accessibilityUIFindSubviewDescendant:()NSObjectAccessibilityUI;
@end

@implementation NSObject(NSObjectAccessibilityUI)

- (id)_accessibilityUIFindAnyAXDescendant:()NSObjectAccessibilityUI byAddingElements:
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__NSObject_NSObjectAccessibilityUI___accessibilityUIFindAnyAXDescendant_byAddingElements___block_invoke;
  aBlock[3] = &unk_1E649C858;
  id v14 = v6;
  id v7 = v6;
  id v8 = a4;
  v9 = _Block_copy(aBlock);
  v10 = [a1 _accessibilityUIFindAXDescendants:v9 byAddingElements:v8];

  v11 = [v10 firstObject];

  return v11;
}

- (id)_accessibilityUIFindAXDescendants:()NSObjectAccessibilityUI byAddingElements:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
  [v8 addObject:a1];
  v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v8 count])
  {
    while (1)
    {
      v10 = [v8 lastObject];
      [v8 removeLastObject];
      char v12 = 0;
      if (v6[2](v6, v10, &v12)) {
        [v9 addObject:v10];
      }
      if (v12) {
        break;
      }
      v7[2](v7, v8, v10);

      if (![v8 count]) {
        goto LABEL_8;
      }
    }
  }
LABEL_8:

  return v9;
}

- (uint64_t)_accessibilityUIFindSubviewDescendant:()NSObjectAccessibilityUI
{
  return [a1 _accessibilityUIFindAnyAXDescendant:a3 byAddingElements:&__block_literal_global_11];
}

@end