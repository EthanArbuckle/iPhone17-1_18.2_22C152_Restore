@interface CNContactDataSourceSafeDelegate
- (CNContactDataSourceDelegate)delegate;
- (CNContactDataSourceSafeDelegate)initWithDelegate:(id)a3;
- (void)contactDataSourceDidChange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CNContactDataSourceSafeDelegate

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (CNContactDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactDataSourceDelegate *)WeakRetained;
}

- (void)contactDataSourceDidChange:(id)a3
{
  id v7 = a3;
  v4 = [(CNContactDataSourceSafeDelegate *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(CNContactDataSourceSafeDelegate *)self delegate];
    [v6 contactDataSourceDidChange:v7];
  }
}

- (CNContactDataSourceSafeDelegate)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactDataSourceSafeDelegate;
  char v5 = [(CNContactDataSourceSafeDelegate *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = v6;
  }

  return v6;
}

@end