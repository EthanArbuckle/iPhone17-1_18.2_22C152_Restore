@interface NSPredicate(EmailFoundationAdditions)
+ (id)_ef_compoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:isAnd:;
+ (id)_ef_compoundPredicateWithSubpredicates:()EmailFoundationAdditions isAnd:;
+ (id)ef_andCompoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:;
+ (id)ef_andCompoundPredicateWithSubpredicates:()EmailFoundationAdditions;
+ (id)ef_orCompoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:;
+ (id)ef_orCompoundPredicateWithSubpredicates:()EmailFoundationAdditions;
+ (uint64_t)ef_matchEverythingPredicate;
+ (uint64_t)ef_matchNothingPredicate;
- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions;
- (uint64_t)ef_containsSubpredicate:()EmailFoundationAdditions;
- (uint64_t)ef_matchesEverything;
- (uint64_t)ef_matchesNothing;
@end

@implementation NSPredicate(EmailFoundationAdditions)

+ (id)ef_andCompoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:
{
  v4 = objc_msgSend(a1, "_ef_compoundPredicateForOptionalPredicate:second:isAnd:", a3, a4, 1);
  return v4;
}

+ (id)_ef_compoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:isAnd:
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (void *)MEMORY[0x1E4F28BA0];
    if (a5)
    {
      v17[0] = v7;
      v17[1] = v8;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      v12 = [v10 andPredicateWithSubpredicates:v11];
    }
    else
    {
      v16[0] = v7;
      v16[1] = v8;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      v12 = [v10 orPredicateWithSubpredicates:v14];
    }
  }
  else
  {
    if (v7) {
      id v13 = v7;
    }
    else {
      id v13 = v8;
    }
    v12 = v13;
  }

  return v12;
}

+ (id)ef_orCompoundPredicateWithSubpredicates:()EmailFoundationAdditions
{
  v3 = objc_msgSend(a1, "_ef_compoundPredicateWithSubpredicates:isAnd:", a3, 0);
  return v3;
}

+ (id)ef_andCompoundPredicateWithSubpredicates:()EmailFoundationAdditions
{
  v3 = objc_msgSend(a1, "_ef_compoundPredicateWithSubpredicates:isAnd:", a3, 1);
  return v3;
}

+ (id)_ef_compoundPredicateWithSubpredicates:()EmailFoundationAdditions isAnd:
{
  id v5 = a3;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      uint64_t v6 = [v5 firstObject];
    }
    else
    {
      if (a4) {
        [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
      }
      else {
      uint64_t v6 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
      }
    }
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (uint64_t)ef_matchesEverything
{
  return [a1 evaluateWithObject:0];
}

+ (uint64_t)ef_matchEverythingPredicate
{
  return [MEMORY[0x1E4F28F60] predicateWithValue:1];
}

- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions
{
  return 0;
}

- (uint64_t)ef_containsSubpredicate:()EmailFoundationAdditions
{
  return [a3 isEqual:a1];
}

- (uint64_t)ef_matchesNothing
{
  return [a1 evaluateWithObject:0] ^ 1;
}

+ (uint64_t)ef_matchNothingPredicate
{
  return [MEMORY[0x1E4F28F60] predicateWithValue:0];
}

+ (id)ef_orCompoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:
{
  v4 = objc_msgSend(a1, "_ef_compoundPredicateForOptionalPredicate:second:isAnd:", a3, a4, 0);
  return v4;
}

@end