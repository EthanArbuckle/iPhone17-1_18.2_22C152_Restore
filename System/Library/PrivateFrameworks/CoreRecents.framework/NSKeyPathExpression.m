@interface NSKeyPathExpression
- (id)cr_expressionValue;
@end

@implementation NSKeyPathExpression

- (id)cr_expressionValue
{
  return [(NSKeyPathExpression *)self keyPath];
}

@end