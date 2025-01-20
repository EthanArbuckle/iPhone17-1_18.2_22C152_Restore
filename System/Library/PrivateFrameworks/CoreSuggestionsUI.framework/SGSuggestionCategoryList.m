@interface SGSuggestionCategoryList
- (BOOL)supportsDismissAll;
- (NSString)listTitle;
- (SGSuggestionCategoryList)init;
- (void)setListTitle:(id)a3;
- (void)setSupportsDismissAll:(BOOL)a3;
@end

@implementation SGSuggestionCategoryList

- (void).cxx_destruct
{
}

- (void)setSupportsDismissAll:(BOOL)a3
{
  self->_supportsDismissAll = a3;
}

- (BOOL)supportsDismissAll
{
  return self->_supportsDismissAll;
}

- (void)setListTitle:(id)a3
{
}

- (NSString)listTitle
{
  return self->_listTitle;
}

- (SGSuggestionCategoryList)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGSuggestionCategoryList;
  v2 = [(SGSuggestionCategoryList *)&v6 init];
  v3 = v2;
  if (v2)
  {
    listTitle = v2->_listTitle;
    v2->_listTitle = 0;

    v3->_supportsDismissAll = 0;
  }
  return v3;
}

@end