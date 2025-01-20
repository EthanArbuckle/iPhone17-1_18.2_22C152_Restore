@interface NSArray(AXSSDocumentTextRuleExtension)
- (BOOL)containsString:()AXSSDocumentTextRuleExtension caseSensitive:;
@end

@implementation NSArray(AXSSDocumentTextRuleExtension)

- (BOOL)containsString:()AXSSDocumentTextRuleExtension caseSensitive:
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__NSArray_AXSSDocumentTextRuleExtension__containsString_caseSensitive___block_invoke;
  v10[3] = &unk_264855868;
  id v11 = v6;
  char v12 = a4;
  id v7 = v6;
  BOOL v8 = [a1 indexOfObjectPassingTest:v10] != 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

@end