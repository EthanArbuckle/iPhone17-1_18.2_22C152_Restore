@interface NamePredicateSortKeyWrapper
- (__CFArray)tokenizationSortKeys;
- (void)dealloc;
- (void)setTokenizationSortKeys:(__CFArray *)a3;
@end

@implementation NamePredicateSortKeyWrapper

- (void)dealloc
{
  tokenizationSortKeys = self->_tokenizationSortKeys;
  if (tokenizationSortKeys) {
    releaseTokenizationSortKeys(tokenizationSortKeys);
  }
  v4.receiver = self;
  v4.super_class = (Class)NamePredicateSortKeyWrapper;
  [(NamePredicateSortKeyWrapper *)&v4 dealloc];
}

- (__CFArray)tokenizationSortKeys
{
  return self->_tokenizationSortKeys;
}

- (void)setTokenizationSortKeys:(__CFArray *)a3
{
  self->_tokenizationSortKeys = a3;
}

@end