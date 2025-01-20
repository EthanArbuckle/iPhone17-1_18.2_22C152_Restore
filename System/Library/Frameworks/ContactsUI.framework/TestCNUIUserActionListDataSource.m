@interface TestCNUIUserActionListDataSource
+ (id)allActionTypes;
- (BOOL)tracksChanges;
- (CNContact)contact;
- (NSDictionary)actionsByActionTypeByContact;
- (NSDictionary)userActionListModelResultBlocksByActionTypeAskedFor;
- (TestCNUIUserActionListDataSource)initWithActionsByActionTypeByContact:(id)a3;
- (id)actionTypesForConsumer:(id)a3;
- (id)consumer:(id)a3 actionModelsForActionType:(id)a4;
- (id)consumer:(id)a3 actionModelsForActionType:(id)a4 handler:(id)a5;
- (id)consumer:(id)a3 imageForActionType:(id)a4;
- (id)consumer:(id)a3 localizedDisplayNameForActionType:(id)a4;
- (id)thirdPartyActionsForContactProperty:(id)a3;
- (id)thirdPartyActionsForCurrentContactAndPropertyKey:(id)a3 identifier:(id)a4;
- (id)thirdPartyTargetsForActionTypes:(id)a3;
- (void)setContact:(id)a3;
- (void)setTracksChanges:(BOOL)a3;
- (void)setUserActionListModelResultBlocksByActionTypeAskedFor:(id)a3;
@end

@implementation TestCNUIUserActionListDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionsByActionTypeByContact, 0);

  objc_storeStrong((id *)&self->_userActionListModelResultBlocksByActionTypeAskedFor, 0);
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSDictionary)actionsByActionTypeByContact
{
  return self->_actionsByActionTypeByContact;
}

- (void)setUserActionListModelResultBlocksByActionTypeAskedFor:(id)a3
{
}

- (NSDictionary)userActionListModelResultBlocksByActionTypeAskedFor
{
  return self->_userActionListModelResultBlocksByActionTypeAskedFor;
}

- (void)setTracksChanges:(BOOL)a3
{
  self->_tracksChanges = a3;
}

- (BOOL)tracksChanges
{
  return self->_tracksChanges;
}

- (id)consumer:(id)a3 imageForActionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)thirdPartyActionsForCurrentContactAndPropertyKey:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)thirdPartyActionsForContactProperty:(id)a3
{
  id v4 = a3;
  v5 = self;
  CNUnimplementedMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  id v4 = a3;
  v5 = self;
  CNUnimplementedMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)consumer:(id)a3 localizedDisplayNameForActionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)consumer:(id)a3 actionModelsForActionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)actionTypesForConsumer:(id)a3
{
  v3 = objc_opt_class();

  return (id)[v3 allActionTypes];
}

- (id)consumer:(id)a3 actionModelsForActionType:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(TestCNUIUserActionListDataSource *)self userActionListModelResultBlocksByActionTypeAskedFor];
  v10 = (void *)[v7 copy];

  [v9 setValue:v10 forKey:v8];
  id v11 = objc_alloc_init(MEMORY[0x1E4F5A368]);

  return v11;
}

- (void)setContact:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(TestCNUIUserActionListDataSource *)self userActionListModelResultBlocksByActionTypeAskedFor];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        v12 = [(TestCNUIUserActionListDataSource *)self userActionListModelResultBlocksByActionTypeAskedFor];
        v13 = [v12 objectForKeyedSubscript:v11];

        v14 = [(TestCNUIUserActionListDataSource *)self actionsByActionTypeByContact];
        v15 = [(TestCNUIUserActionListDataSource *)self contact];
        v16 = [v14 objectForKeyedSubscript:v15];
        v17 = [v16 objectForKeyedSubscript:v11];
        ((void (**)(void, void *))v13)[2](v13, v17);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (TestCNUIUserActionListDataSource)initWithActionsByActionTypeByContact:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TestCNUIUserActionListDataSource;
  id v6 = [(TestCNUIUserActionListDataSource *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionsByActionTypeByContact, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    userActionListModelResultBlocksByActionTypeAskedFor = v7->_userActionListModelResultBlocksByActionTypeAskedFor;
    v7->_userActionListModelResultBlocksByActionTypeAskedFor = (NSDictionary *)v8;

    uint64_t v10 = v7;
  }

  return v7;
}

+ (id)allActionTypes
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1AD48];
  v6[0] = *MEMORY[0x1E4F1AD38];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AD20];
  v6[2] = *MEMORY[0x1E4F1AD78];
  v6[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return v4;
}

@end