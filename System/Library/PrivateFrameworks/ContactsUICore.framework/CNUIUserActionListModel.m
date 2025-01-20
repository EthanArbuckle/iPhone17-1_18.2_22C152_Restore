@interface CNUIUserActionListModel
+ (id)emptyModel;
- (BOOL)hasDefaultApp;
- (BOOL)isEmpty;
- (CNUIUserActionItem)defaultAction;
- (CNUIUserActionListModel)initWithDefaultAction:(id)a3 actions:(id)a4 directoryServiceActions:(id)a5 foundOnDeviceActions:(id)a6 hasDefaultApp:(BOOL)a7;
- (CNUIUserActionListModel)initWithModel:(id)a3 actions:(id)a4;
- (NSArray)actions;
- (NSArray)directoryServiceActions;
- (NSArray)foundOnDeviceActions;
- (id)allActions;
- (id)description;
- (void)setActions:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setDirectoryServiceActions:(id)a3;
- (void)setFoundOnDeviceActions:(id)a3;
@end

@implementation CNUIUserActionListModel

+ (id)emptyModel
{
  if (emptyModel_cn_once_token_1 != -1) {
    dispatch_once(&emptyModel_cn_once_token_1, &__block_literal_global_53);
  }
  v2 = (void *)emptyModel_cn_once_object_1;
  return v2;
}

uint64_t __37__CNUIUserActionListModel_emptyModel__block_invoke()
{
  v0 = [CNUIUserActionListModel alloc];
  emptyModel_cn_once_object_1 = [(CNUIUserActionListModel *)v0 initWithDefaultAction:0 actions:MEMORY[0x263EFFA68] directoryServiceActions:MEMORY[0x263EFFA68] foundOnDeviceActions:MEMORY[0x263EFFA68] hasDefaultApp:0];
  return MEMORY[0x270F9A758]();
}

- (CNUIUserActionListModel)initWithDefaultAction:(id)a3 actions:(id)a4 directoryServiceActions:(id)a5 foundOnDeviceActions:(id)a6 hasDefaultApp:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNUIUserActionListModel;
  v17 = [(CNUIUserActionListModel *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_defaultAction, a3);
    objc_storeStrong((id *)&v18->_actions, a4);
    objc_storeStrong((id *)&v18->_directoryServiceActions, a5);
    objc_storeStrong((id *)&v18->_foundOnDeviceActions, a6);
    v18->_hasDefaultApp = a7;
    v19 = v18;
  }

  return v18;
}

- (CNUIUserActionListModel)initWithModel:(id)a3 actions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 defaultAction];
  v9 = [v7 directoryServiceActions];
  v10 = [v7 foundOnDeviceActions];
  uint64_t v11 = [v7 hasDefaultApp];

  v12 = [(CNUIUserActionListModel *)self initWithDefaultAction:v8 actions:v6 directoryServiceActions:v9 foundOnDeviceActions:v10 hasDefaultApp:v11];
  return v12;
}

- (id)allActions
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(CNUIUserActionListModel *)self actions];
  [v3 addObjectsFromArray:v4];

  v5 = [(CNUIUserActionListModel *)self directoryServiceActions];
  [v3 addObjectsFromArray:v5];

  id v6 = [(CNUIUserActionListModel *)self foundOnDeviceActions];
  [v3 addObjectsFromArray:v6];

  id v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)isEmpty
{
  v3 = [(CNUIUserActionListModel *)self defaultAction];

  if (v3) {
    return 0;
  }
  uint64_t v4 = *MEMORY[0x263F334B0];
  v5 = [(CNUIUserActionListModel *)self actions];
  int v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (!v6) {
    return 0;
  }
  id v7 = [(CNUIUserActionListModel *)self directoryServiceActions];
  int v8 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v7);

  if (!v8) {
    return 0;
  }
  v9 = [(CNUIUserActionListModel *)self foundOnDeviceActions];
  char v10 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v9);

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  uint64_t v4 = [(CNUIUserActionListModel *)self defaultAction];
  v5 = __38__CNUIUserActionListModel_description__block_invoke((uint64_t)v4, v4);
  id v6 = (id)[v3 appendName:@"default" object:v5];

  id v7 = [(CNUIUserActionListModel *)self actions];
  int v8 = objc_msgSend(v7, "_cn_map:", &__block_literal_global_4_1);
  v9 = [v8 componentsJoinedByString:@", "];
  id v10 = (id)[v3 appendName:@"actions" object:v9];

  uint64_t v11 = [v3 build];

  return v11;
}

id __38__CNUIUserActionListModel_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 targetHandle];
  v5 = [v2 stringWithFormat:@"%@ (%p)", v4, v3];

  return v5;
}

- (CNUIUserActionItem)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSArray)directoryServiceActions
{
  return self->_directoryServiceActions;
}

- (void)setDirectoryServiceActions:(id)a3
{
}

- (NSArray)foundOnDeviceActions
{
  return self->_foundOnDeviceActions;
}

- (void)setFoundOnDeviceActions:(id)a3
{
}

- (BOOL)hasDefaultApp
{
  return self->_hasDefaultApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundOnDeviceActions, 0);
  objc_storeStrong((id *)&self->_directoryServiceActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
}

@end