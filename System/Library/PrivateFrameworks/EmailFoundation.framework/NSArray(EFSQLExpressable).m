@interface NSArray(EFSQLExpressable)
- (id)ef_SQLExpression;
- (id)ef_SQLIsolatedExpression;
- (void)ef_renderSQLExpressionInto:()EFSQLExpressable;
- (void)ef_renderSQLExpressionInto:()EFSQLExpressable conjoiner:;
@end

@implementation NSArray(EFSQLExpressable)

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable conjoiner:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  id v9 = v6;
  id v10 = v7;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      uint64_t v16 = -v13;
      uint64_t v21 = v13 + v12;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v20 = [MEMORY[0x1E4F28B00] currentHandler];
          v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void EFRenderSQLExpression(NSString *__strong, __strong id<NSFastEnumeration>, NSMutableString *__strong, NSString *__strong)");
          [v20 handleFailureInFunction:v19, @"EFSQLExpressable.m", 104, @"Objects in the %@ must conform to protocol EFSQLValueExpressable", @"array" file lineNumber description];
        }
        if (v16 != v15) {
          [v9 appendString:v10];
        }
        v18 = objc_msgSend(v17, "ef_SQLIsolatedExpression");
        objc_msgSend(v18, "ef_renderSQLExpressionInto:", v9);

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v13 = v21;
    }
    while (v12);
  }
}

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  id v6 = v4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = -v9;
      uint64_t v17 = v9 + v8;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void EFRenderSQLExpression(NSString *__strong, __strong id<NSFastEnumeration>, NSMutableString *__strong, NSString *__strong)");
          [v16 handleFailureInFunction:v15, @"EFSQLExpressable.m", 104, @"Objects in the %@ must conform to protocol EFSQLValueExpressable", @"array" file lineNumber description];
        }
        if (v12 != v11) {
          [v6 appendString:@", "];
        }
        uint64_t v14 = objc_msgSend(v13, "ef_SQLIsolatedExpression");
        objc_msgSend(v14, "ef_renderSQLExpressionInto:", v6);

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v17;
    }
    while (v8);
  }
}

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueCollectionExpressable:a1];
}

- (id)ef_SQLExpression
{
  v2 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(a1, "ef_renderSQLExpressionInto:", v2);
  return v2;
}

@end