@interface CNAutocompleteSuggestionsViewControllerOptions
- (BOOL)supplementSuggestionsWithZKWRecipients;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxNumberOfSuggestions;
- (unint64_t)searchType;
- (void)setMaxNumberOfSuggestions:(int64_t)a3;
- (void)setSearchType:(unint64_t)a3;
- (void)setSupplementSuggestionsWithZKWRecipients:(BOOL)a3;
@end

@implementation CNAutocompleteSuggestionsViewControllerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSearchType:", -[CNAutocompleteSuggestionsViewControllerOptions searchType](self, "searchType"));
  objc_msgSend(v4, "setMaxNumberOfSuggestions:", -[CNAutocompleteSuggestionsViewControllerOptions maxNumberOfSuggestions](self, "maxNumberOfSuggestions"));
  objc_msgSend(v4, "setSupplementSuggestionsWithZKWRecipients:", -[CNAutocompleteSuggestionsViewControllerOptions supplementSuggestionsWithZKWRecipients](self, "supplementSuggestionsWithZKWRecipients"));
  return v4;
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(unint64_t)a3
{
  self->_searchType = a3;
}

- (int64_t)maxNumberOfSuggestions
{
  return self->_maxNumberOfSuggestions;
}

- (void)setMaxNumberOfSuggestions:(int64_t)a3
{
  self->_maxNumberOfSuggestions = a3;
}

- (BOOL)supplementSuggestionsWithZKWRecipients
{
  return self->_supplementSuggestionsWithZKWRecipients;
}

- (void)setSupplementSuggestionsWithZKWRecipients:(BOOL)a3
{
  self->_supplementSuggestionsWithZKWRecipients = a3;
}

@end