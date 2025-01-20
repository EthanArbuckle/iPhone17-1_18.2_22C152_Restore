@interface NSArray(CNFRegUtilities)
- (id)CNFRegArrayPassingTest:()CNFRegUtilities;
- (id)CNFRegArrayPassingTests:()CNFRegUtilities;
@end

@implementation NSArray(CNFRegUtilities)

- (id)CNFRegArrayPassingTests:()CNFRegUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v4 && (uint64_t v6 = v5, [v4 count]) && v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__NSArray_CNFRegUtilities__CNFRegArrayPassingTests___block_invoke;
    v12[3] = &unk_2644F05C0;
    id v13 = v4;
    id v8 = v7;
    id v14 = v8;
    [a1 enumerateObjectsUsingBlock:v12];
    v9 = v14;
    id v10 = v8;
  }
  else
  {
    id v10 = a1;
  }

  return v10;
}

- (id)CNFRegArrayPassingTest:()CNFRegUtilities
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    id v6 = [v4 alloc];
    v7 = (void *)MEMORY[0x223C3AA40](v5);

    id v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);
    v9 = [a1 CNFRegArrayPassingTests:v8];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end