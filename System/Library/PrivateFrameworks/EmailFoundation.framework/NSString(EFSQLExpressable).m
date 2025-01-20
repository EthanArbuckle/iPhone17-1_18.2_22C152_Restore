@interface NSString(EFSQLExpressable)
- (uint64_t)ef_renderSQLExpressionInto:()EFSQLExpressable;
@end

@implementation NSString(EFSQLExpressable)

- (uint64_t)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  return objc_msgSend(a3, "ef_appendQuotedSQLEscapedString:", a1);
}

@end