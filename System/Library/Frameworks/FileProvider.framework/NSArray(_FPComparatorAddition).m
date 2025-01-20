@interface NSArray(_FPComparatorAddition)
- (id)fp_comparator;
- (uint64_t)fp_compareItem:()_FPComparatorAddition toItem:;
@end

@implementation NSArray(_FPComparatorAddition)

- (id)fp_comparator
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__NSArray__FPComparatorAddition__fp_comparator__block_invoke;
  v3[3] = &unk_1E5AF41E0;
  v3[4] = a1;
  v1 = (void *)MEMORY[0x1A6248B00](v3);

  return v1;
}

- (uint64_t)fp_compareItem:()_FPComparatorAddition toItem:
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(a1, "fp_comparator");
  v8 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v9 = ((uint64_t (**)(void, id, id))v8)[2](v8, v7, v6);

  return v9;
}

@end