@interface NSSet(Photos)
- (void)ph_enumerateIntersectionWithSet:()Photos usingBlock:;
@end

@implementation NSSet(Photos)

- (void)ph_enumerateIntersectionWithSet:()Photos usingBlock:
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [a1 count];
  unint64_t v9 = [v6 count];
  id v10 = a1;
  BOOL v11 = v8 >= v9;
  if (v8 >= v9) {
    v12 = v6;
  }
  else {
    v12 = v10;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__NSSet_Photos__ph_enumerateIntersectionWithSet_usingBlock___block_invoke;
  v17[3] = &unk_1E5841BF8;
  if (v11) {
    v13 = v10;
  }
  else {
    v13 = v6;
  }
  id v18 = v13;
  id v19 = v7;
  id v14 = v7;
  id v15 = v13;
  id v16 = v6;
  [v12 enumerateObjectsUsingBlock:v17];
}

@end