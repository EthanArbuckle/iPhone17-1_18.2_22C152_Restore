@interface CADFilter(EKPredicateEvaluating)
- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating;
@end

@implementation CADFilter(EKPredicateEvaluating)

- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating
{
  v0 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[CADFilter(EKPredicateEvaluating) ekPredicateFilterMatches:](v0);
  }
  return 0;
}

- (void)ekPredicateFilterMatches:()EKPredicateEvaluating .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_ERROR, "Unknown CADFilter subclass: %@", (uint8_t *)&v4, 0xCu);
}

@end