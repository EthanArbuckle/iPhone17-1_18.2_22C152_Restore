@interface UIMenu(ChatKit)
+ (uint64_t)ck_indexOfMenuWithMenuIdentifier:()ChatKit inMenuElementsArray:;
+ (unint64_t)ck_menuInsertionIndexAfterIndex:()ChatKit inMenuElementsArray:;
@end

@implementation UIMenu(ChatKit)

+ (uint64_t)ck_indexOfMenuWithMenuIdentifier:()ChatKit inMenuElementsArray:
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__UIMenu_ChatKit__ck_indexOfMenuWithMenuIdentifier_inMenuElementsArray___block_invoke;
  v9[3] = &unk_1E562A1E0;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = [a4 indexOfObjectPassingTest:v9];

  return v7;
}

+ (unint64_t)ck_menuInsertionIndexAfterIndex:()ChatKit inMenuElementsArray:
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = a3 + 1;
    if (v7 > [v5 count]) {
      unint64_t v7 = [v6 count];
    }
  }

  return v7;
}

@end