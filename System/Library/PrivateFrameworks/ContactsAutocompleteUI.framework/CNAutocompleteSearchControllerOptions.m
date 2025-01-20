@interface CNAutocompleteSearchControllerOptions
- (NSNumber)labelLeadingPadding;
- (NSNumber)labelTopPadding;
- (NSNumber)shouldAlwaysShowAddContactsButton;
- (NSNumber)shouldHideSeparator;
- (NSNumber)trailingButtonMidlineInsetFromLayoutMargin;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)addressableGroupResultStyle;
- (void)setAddressableGroupResultStyle:(int64_t)a3;
- (void)setLabelLeadingPadding:(id)a3;
- (void)setLabelTopPadding:(id)a3;
- (void)setShouldAlwaysShowAddContactsButton:(id)a3;
- (void)setShouldHideSeparator:(id)a3;
- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(id)a3;
@end

@implementation CNAutocompleteSearchControllerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(CNAutocompleteSearchControllerOptions *)self trailingButtonMidlineInsetFromLayoutMargin];
  [v4 setTrailingButtonMidlineInsetFromLayoutMargin:v5];

  v6 = [(CNAutocompleteSearchControllerOptions *)self labelTopPadding];
  [v4 setLabelTopPadding:v6];

  v7 = [(CNAutocompleteSearchControllerOptions *)self labelLeadingPadding];
  [v4 setLabelLeadingPadding:v7];

  v8 = [(CNAutocompleteSearchControllerOptions *)self shouldHideSeparator];
  [v4 setShouldHideSeparator:v8];

  v9 = [(CNAutocompleteSearchControllerOptions *)self shouldAlwaysShowAddContactsButton];
  [v4 setShouldAlwaysShowAddContactsButton:v9];

  objc_msgSend(v4, "setAddressableGroupResultStyle:", -[CNAutocompleteSearchControllerOptions addressableGroupResultStyle](self, "addressableGroupResultStyle"));
  return v4;
}

- (NSNumber)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(id)a3
{
}

- (NSNumber)labelTopPadding
{
  return self->_labelTopPadding;
}

- (void)setLabelTopPadding:(id)a3
{
}

- (NSNumber)labelLeadingPadding
{
  return self->_labelLeadingPadding;
}

- (void)setLabelLeadingPadding:(id)a3
{
}

- (NSNumber)shouldHideSeparator
{
  return self->_shouldHideSeparator;
}

- (void)setShouldHideSeparator:(id)a3
{
}

- (NSNumber)shouldAlwaysShowAddContactsButton
{
  return self->_shouldAlwaysShowAddContactsButton;
}

- (void)setShouldAlwaysShowAddContactsButton:(id)a3
{
}

- (int64_t)addressableGroupResultStyle
{
  return self->_addressableGroupResultStyle;
}

- (void)setAddressableGroupResultStyle:(int64_t)a3
{
  self->_addressableGroupResultStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldAlwaysShowAddContactsButton, 0);
  objc_storeStrong((id *)&self->_shouldHideSeparator, 0);
  objc_storeStrong((id *)&self->_labelLeadingPadding, 0);
  objc_storeStrong((id *)&self->_labelTopPadding, 0);

  objc_storeStrong((id *)&self->_trailingButtonMidlineInsetFromLayoutMargin, 0);
}

@end