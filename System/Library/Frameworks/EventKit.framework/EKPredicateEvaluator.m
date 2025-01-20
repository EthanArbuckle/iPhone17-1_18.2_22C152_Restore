@interface EKPredicateEvaluator
+ (BOOL)evaluatePredicate:(id)a3 withObject:(id)a4;
@end

@implementation EKPredicateEvaluator

+ (BOOL)evaluatePredicate:(id)a3 withObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    char v7 = [v5 ekPredicateEvaluateWithObject:v6];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

@end