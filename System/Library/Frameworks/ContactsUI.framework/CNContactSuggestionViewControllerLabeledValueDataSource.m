@interface CNContactSuggestionViewControllerLabeledValueDataSource
- (CNContactSuggestionViewControllerLabeledValueDataSource)initWithLabeledValue:(id)a3;
- (CNLabeledValue)labeledValue;
- (NSAttributedString)formattedSnippet;
- (NSString)appName;
- (NSString)date;
- (NSString)title;
- (NSString)with;
- (NSURL)url;
- (unint64_t)type;
- (void)setLabeledValue:(id)a3;
@end

@implementation CNContactSuggestionViewControllerLabeledValueDataSource

- (void).cxx_destruct
{
}

- (void)setLabeledValue:(id)a3
{
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (NSURL)url
{
  return 0;
}

- (NSString)with
{
  return 0;
}

- (NSString)date
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (NSAttributedString)formattedSnippet
{
  return 0;
}

- (NSString)appName
{
  v2 = [(CNContactSuggestionViewControllerLabeledValueDataSource *)self labeledValue];
  v3 = [v2 valueOrigin];
  v4 = [v3 localizedApplicationName];

  return (NSString *)v4;
}

- (unint64_t)type
{
  return 0;
}

- (CNContactSuggestionViewControllerLabeledValueDataSource)initWithLabeledValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactSuggestionViewControllerLabeledValueDataSource;
  v6 = [(CNContactSuggestionViewControllerLabeledValueDataSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_labeledValue, a3);
    v8 = v7;
  }

  return v7;
}

@end