@interface NSPredicateUtilities
@end

@implementation NSPredicateUtilities

uint64_t __66___NSPredicateUtilities__extendedExpressionClassesForSecureCoding__block_invoke()
{
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t result = objc_msgSend(v15, "initWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_lookUpClass("NSFetchRequestExpression"), 0);
  qword_1EB1ED950 = result;
  return result;
}

uint64_t __58___NSPredicateUtilities__expressionClassesForSecureCoding__block_invoke()
{
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t result = objc_msgSend(v14, "initWithObjects:", v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_lookUpClass("NSFetchRequestExpression"), 0);
  qword_1EB1ED940 = result;
  return result;
}

uint64_t __65___NSPredicateUtilities__compoundPredicateClassesForSecureCoding__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  qword_1EB1ED930 = result;
  return result;
}

uint64_t __56___NSPredicateUtilities__operatorClassesForSecureCoding__block_invoke()
{
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t result = objc_msgSend(v11, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  qword_1EB1ED960 = result;
  return result;
}

uint64_t __61___NSPredicateUtilities__constantValueClassesForSecureCoding__block_invoke()
{
  uint64_t v0 = (uint64_t)objc_lookUpClass("CLLocation");
  uint64_t v1 = (uint64_t)objc_lookUpClass("NSXPCStoreManagedObjectArchivingToken");
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  if (!v0)
  {
    uint64_t v0 = objc_opt_class();
    if (v1) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v1 = objc_opt_class();
    goto LABEL_3;
  }
  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t result = objc_msgSend(v16, "initWithObjects:", v15, v14, v13, v12, v11, v10, v2, v3, v4, v5, v6, v7, v8, v0, v1, 0);
  qword_1EB1ED970 = result;
  return result;
}

uint64_t __57___NSPredicateUtilities__predicateClassesForSecureCoding__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  _MergedGlobals_133 = result;
  return result;
}

@end