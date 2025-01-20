@interface NSExpression
- (id)cr_expressionValue;
- (id)cr_sqlBindings;
@end

@implementation NSExpression

- (id)cr_expressionValue
{
  NSExpressionType v4 = [(NSExpression *)self expressionType];
  if (v4 == NSVariableExpressionType)
  {
    return [(NSExpression *)self variable];
  }
  else if (v4 == NSAggregateExpressionType)
  {
    id v6 = [(NSExpression *)self collection];
    return [v6 arrayByApplyingSelector:"cr_expressionValue"];
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSPredicateBindings.m" lineNumber:92 description:@"unhandled expression type"];
    return 0;
  }
}

- (id)cr_sqlBindings
{
  if ((id)[(NSExpression *)self expressionType] == (id)14)
  {
    id v4 = +[NSMutableArray array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(NSExpression *)self collection];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "cr_sqlBindings"));
        }
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSPredicateBindings.m" lineNumber:111 description:@"unhandled expression type"];
    return 0;
  }
  return v4;
}

@end