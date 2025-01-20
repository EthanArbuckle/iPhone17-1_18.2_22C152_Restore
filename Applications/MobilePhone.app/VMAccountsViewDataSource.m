@interface VMAccountsViewDataSource
- (NSArray)accounts;
- (VMAccountsViewDataSource)init;
- (VMAccountsViewDataSource)initWithAccounts:(id)a3;
- (id)accountAtIndex:(unint64_t)a3;
- (id)accountsView:(id)a3 buttonForRowAtIndex:(unint64_t)a4;
- (id)titleForAccountsView:(id)a3;
- (unint64_t)numberOfRowsForAccountsView:(id)a3;
- (void)setAccounts:(id)a3;
@end

@implementation VMAccountsViewDataSource

- (VMAccountsViewDataSource)init
{
  return 0;
}

- (VMAccountsViewDataSource)initWithAccounts:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMAccountsViewDataSource;
  v5 = [(VMAccountsViewDataSource *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    accounts = v5->_accounts;
    v5->_accounts = v6;
  }
  return v5;
}

- (id)accountAtIndex:(unint64_t)a3
{
  id v4 = [(VMAccountsViewDataSource *)self accounts];
  if ((unint64_t)[v4 count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)accountsView:(id)a3 buttonForRowAtIndex:(unint64_t)a4
{
  v6 = +[VMAccountButton accountButton];
  v7 = [(VMAccountsViewDataSource *)self accountAtIndex:a4];
  v8 = [v7 accountDescription];
  [v6 setTitle:v8 forState:0];

  return v6;
}

- (unint64_t)numberOfRowsForAccountsView:(id)a3
{
  v3 = [(VMAccountsViewDataSource *)self accounts];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)titleForAccountsView:(id)a3
{
  return 0;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end