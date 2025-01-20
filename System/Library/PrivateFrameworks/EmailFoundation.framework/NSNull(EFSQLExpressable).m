@interface NSNull(EFSQLExpressable)
- (__CFString)ef_SQLExpression;
- (uint64_t)ef_renderSQLExpressionInto:()EFSQLExpressable;
@end

@implementation NSNull(EFSQLExpressable)

- (uint64_t)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  return [a3 appendString:@"NULL"];
}

- (__CFString)ef_SQLExpression
{
  return @"NULL";
}

@end