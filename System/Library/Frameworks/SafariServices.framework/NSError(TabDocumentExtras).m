@interface NSError(TabDocumentExtras)
- (id)failingURL;
@end

@implementation NSError(TabDocumentExtras)

- (id)failingURL
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F289B0]];

  return v2;
}

@end