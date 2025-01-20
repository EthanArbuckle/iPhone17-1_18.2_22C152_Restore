@interface MUVendorLinkSortParameters
- (BOOL)sortAlphabetically;
- (NSArray)preferredOrdering;
- (NSString)winningAdamId;
- (void)setPreferredOrdering:(id)a3;
- (void)setSortAlphabetically:(BOOL)a3;
- (void)setWinningAdamId:(id)a3;
@end

@implementation MUVendorLinkSortParameters

- (NSArray)preferredOrdering
{
  return self->_preferredOrdering;
}

- (void)setPreferredOrdering:(id)a3
{
}

- (NSString)winningAdamId
{
  return self->_winningAdamId;
}

- (void)setWinningAdamId:(id)a3
{
}

- (BOOL)sortAlphabetically
{
  return self->_sortAlphabetically;
}

- (void)setSortAlphabetically:(BOOL)a3
{
  self->_sortAlphabetically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winningAdamId, 0);
  objc_storeStrong((id *)&self->_preferredOrdering, 0);
}

@end