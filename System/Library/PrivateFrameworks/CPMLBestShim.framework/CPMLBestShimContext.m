@interface CPMLBestShimContext
- (NSArray)orderedSuggestions;
- (void)setOrderedSuggestions:(id)a3;
@end

@implementation CPMLBestShimContext

- (NSArray)orderedSuggestions
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOrderedSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end