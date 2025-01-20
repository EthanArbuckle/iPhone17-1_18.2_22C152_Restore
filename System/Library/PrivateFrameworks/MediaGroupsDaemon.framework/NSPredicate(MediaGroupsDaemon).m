@interface NSPredicate(MediaGroupsDaemon)
- (BOOL)mg_containsContainment;
- (uint64_t)mg_containsCurrentDevice;
- (uint64_t)mg_evaluateConstraint:()MediaGroupsDaemon;
- (uint64_t)mg_requiresCurrentDevice;
- (uint64_t)mg_restrictedToContainment;
@end

@implementation NSPredicate(MediaGroupsDaemon)

- (uint64_t)mg_requiresCurrentDevice
{
  return objc_msgSend(a1, "mg_evaluateConstraint:", &__block_literal_global_0);
}

- (uint64_t)mg_containsCurrentDevice
{
  v1 = [a1 predicateFormat];
  uint64_t v2 = [v1 containsString:@"$CURRENT_"];

  return v2;
}

- (uint64_t)mg_restrictedToContainment
{
  return objc_msgSend(a1, "mg_evaluateConstraint:", &__block_literal_global_3);
}

- (BOOL)mg_containsContainment
{
  uint64_t v2 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\ASUBQUERY\\(\\$CONTAINMENT_MAP\\[.+?\\], \\$container, identifier IN \\$container\\)\\[SIZE\\] > 0\\z", 0, 0 options error];
  v3 = [a1 predicateFormat];
  BOOL v4 = objc_msgSend(v2, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) == 1;

  return v4;
}

- (uint64_t)mg_evaluateConstraint:()MediaGroupsDaemon
{
  BOOL v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = v4[2](v4, a1);
    goto LABEL_12;
  }
  id v5 = a1;
  uint64_t v6 = [v5 compoundPredicateType];
  v7 = [v5 subpredicates];
  v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = v6 == 2;
  while (1)
  {
    v11 = v8;
    v8 = [v7 objectAtIndex:v9];

    char v12 = objc_msgSend(v8, "mg_evaluateConstraint:", v4);
    if (v6 != 2) {
      break;
    }
    if ((v12 & 1) == 0)
    {
      uint64_t v10 = 0;
      goto LABEL_11;
    }
LABEL_7:
    if (++v9 >= (unint64_t)[v7 count]) {
      goto LABEL_11;
    }
  }
  if ((v12 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v10 = 1;
LABEL_11:

LABEL_12:
  return v10;
}

@end