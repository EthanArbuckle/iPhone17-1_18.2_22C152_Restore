@interface CSDiscoverySuggestionAndListItemTuple
- (ATXUserEducationSuggestion)discoverySuggestion;
- (CSListItem)listItem;
- (void)setDiscoverySuggestion:(id)a3;
- (void)setListItem:(id)a3;
@end

@implementation CSDiscoverySuggestionAndListItemTuple

- (ATXUserEducationSuggestion)discoverySuggestion
{
  return self->_discoverySuggestion;
}

- (void)setDiscoverySuggestion:(id)a3
{
}

- (CSListItem)listItem
{
  return self->_listItem;
}

- (void)setListItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItem, 0);

  objc_storeStrong((id *)&self->_discoverySuggestion, 0);
}

@end