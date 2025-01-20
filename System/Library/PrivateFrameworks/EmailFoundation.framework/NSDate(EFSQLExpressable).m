@interface NSDate(EFSQLExpressable)
- (id)ef_SQLExpression;
- (void)ef_renderSQLExpressionInto:()EFSQLExpressable;
@end

@implementation NSDate(EFSQLExpressable)

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  id v5 = a3;
  [a1 timeIntervalSince1970];
  objc_msgSend(v5, "appendFormat:", @"%lld", vcvtmd_s64_f64(v4));
}

- (id)ef_SQLExpression
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(a1, "ef_renderSQLExpressionInto:", v2);
  return v2;
}

@end