@interface CNTestQuickActionViewContainer
- (CNTestQuickActionViewContainer)initWithActionTypes:(id)a3;
- (NSDictionary)actionViewsByActionType;
- (id)viewForActionType:(id)a3;
@end

@implementation CNTestQuickActionViewContainer

- (void).cxx_destruct
{
}

- (NSDictionary)actionViewsByActionType
{
  return self->_actionViewsByActionType;
}

- (id)viewForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CNTestQuickActionViewContainer *)self actionViewsByActionType];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (CNTestQuickActionViewContainer)initWithActionTypes:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNTestQuickActionViewContainer;
  v5 = [(CNTestQuickActionViewContainer *)&v11 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "_cn_indexBy:", *MEMORY[0x1E4F5A248]);
    uint64_t v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_34834);
    actionViewsByActionType = v5->_actionViewsByActionType;
    v5->_actionViewsByActionType = (NSDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

id __54__CNTestQuickActionViewContainer_initWithActionTypes___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = a2;
  id v2 = a2;
  v3 = objc_alloc_init(CNTestQuickActionView);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

@end