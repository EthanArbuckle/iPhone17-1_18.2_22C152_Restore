@interface CADNotifiableEventsPredicate(EKPredicateEvaluating)
- (BOOL)ekPredicateEvaluateWithObject:()EKPredicateEvaluating;
@end

@implementation CADNotifiableEventsPredicate(EKPredicateEvaluating)

- (BOOL)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 invitationStatus] != 0;

  return v4;
}

@end