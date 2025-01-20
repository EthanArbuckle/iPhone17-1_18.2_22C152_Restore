@interface MUISearchSuggestionCategoryScope
+ (MUISearchSuggestionCategoryScope)scopeWithTitle:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (NSString)parsecScope;
- (NSString)title;
- (id)description;
- (id)predicateApplier;
- (id)predicateForSuggestion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParsecScope:(id)a3;
- (void)setPredicateApplier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MUISearchSuggestionCategoryScope

+ (MUISearchSuggestionCategoryScope)scopeWithTitle:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MUISearchSuggestionCategoryScope);
  [(MUISearchSuggestionCategoryScope *)v7 setTitle:v6];

  [(MUISearchSuggestionCategoryScope *)v7 setIdentifier:v5];
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_identifier];
}

- (id)predicateForSuggestion:(id)a3
{
  return (id)(*((uint64_t (**)(void))self->_predicateApplier + 2))();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)parsecScope
{
  return self->_parsecScope;
}

- (void)setParsecScope:(id)a3
{
}

- (id)predicateApplier
{
  return self->_predicateApplier;
}

- (void)setPredicateApplier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicateApplier, 0);
  objc_storeStrong((id *)&self->_parsecScope, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end