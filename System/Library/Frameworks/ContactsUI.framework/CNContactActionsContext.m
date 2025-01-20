@interface CNContactActionsContext
- (CNContactActionsContext)init;
- (CNContactActionsContext)initWithDataSource:(id)a3 environment:(id)a4;
- (CNUIContactsEnvironment)environment;
- (CNUIUserActionListDataSource)dataSource;
- (id)description;
- (void)setCacheEntryExpirationAge:(double)a3;
- (void)setCacheEntryLimit:(unint64_t)a3;
- (void)setCacheEntryRefreshAge:(double)a3;
@end

@implementation CNContactActionsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (CNUIContactsEnvironment)environment
{
  return (CNUIContactsEnvironment *)objc_getProperty(self, a2, 16, 1);
}

- (CNUIUserActionListDataSource)dataSource
{
  return (CNUIUserActionListDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCacheEntryExpirationAge:(double)a3
{
}

- (void)setCacheEntryRefreshAge:(double)a3
{
}

- (void)setCacheEntryLimit:(unint64_t)a3
{
  if (!a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CNContactActionsContext.m", 50, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];
  }
  dataSource = self->_dataSource;

  [(CNUIUserActionListDataSource *)dataSource setCacheCapacity:a3];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"dataSource" object:self->_dataSource];
  v5 = [v3 build];

  return v5;
}

- (CNContactActionsContext)initWithDataSource:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactActionsContext;
  v9 = [(CNContactActionsContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
    v11 = v10;
  }

  return v10;
}

- (CNContactActionsContext)init
{
  v3 = +[CNUIContactsEnvironment currentEnvironment];
  id v4 = objc_alloc(MEMORY[0x1E4F5A720]);
  v5 = [v3 actionDiscoveringEnvironment];
  v6 = (void *)[v4 initWithDiscoveringEnvironment:v5];

  id v7 = [(CNContactActionsContext *)self initWithDataSource:v6 environment:v3];
  return v7;
}

@end