@interface NSExpression(BRAdditions)
- (uint64_t)br_isConstantValueExpression:()BRAdditions;
- (uint64_t)br_isKeyPathExpression:()BRAdditions;
@end

@implementation NSExpression(BRAdditions)

- (uint64_t)br_isKeyPathExpression:()BRAdditions
{
  id v4 = a3;
  if ([a1 expressionType] == 3)
  {
    v5 = [a1 keyPath];
    uint64_t v6 = [v5 isEqualToString:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)br_isConstantValueExpression:()BRAdditions
{
  id v4 = a3;
  if ([a1 expressionType])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [a1 constantValue];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = [v6 isEqualToString:v4];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

@end