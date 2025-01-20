@interface SAGKSnippet
- (BOOL)sirigk_isMapOnlySnippet;
@end

@implementation SAGKSnippet

- (BOOL)sirigk_isMapOnlySnippet
{
  v3 = [(SAGKSnippet *)self pods];
  v4 = (char *)[v3 count];

  if (v4 != (unsigned char *)&dword_0 + 1) {
    return 0;
  }
  uint64_t v5 = [(SAGKSnippet *)self pods];
  v6 = [(id)v5 objectAtIndex:0];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  return (v5 & 1) != 0;
}

@end