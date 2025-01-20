@interface UIMenu
@end

@implementation UIMenu

uint64_t __72__UIMenu_ChatKit__ck_indexOfMenuWithMenuIdentifier_inMenuElementsArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 identifier];
    uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    *a4 = v8;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end