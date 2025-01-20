@interface NSLikePredicateOperator
- (BOOL)_shouldEscapeForLike;
- (SEL)selector;
- (id)symbol;
@end

@implementation NSLikePredicateOperator

- (id)symbol
{
  id v2 = [(NSStringPredicateOperator *)self _modifierString];

  return (id)[@"LIKE" stringByAppendingString:v2];
}

- (SEL)selector
{
  return sel_like_;
}

- (BOOL)_shouldEscapeForLike
{
  return 1;
}

@end