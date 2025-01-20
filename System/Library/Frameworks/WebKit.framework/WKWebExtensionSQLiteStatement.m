@interface WKWebExtensionSQLiteStatement
@end

@implementation WKWebExtensionSQLiteStatement

uint64_t __41___WKWebExtensionSQLiteStatement_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handle];
  if (result)
  {
    v3 = *(sqlite3_stmt **)(a1 + 40);
    return sqlite3_finalize(v3);
  }
  return result;
}

@end