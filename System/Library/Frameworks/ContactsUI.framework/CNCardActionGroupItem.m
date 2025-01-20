@interface CNCardActionGroupItem
+ (id)actionGroupItemWithAction:(id)a3;
+ (id)actionGroupItemWithActions:(id)a3;
- (CNCardActionGroupItem)init;
- (CNCardActionGroupItem)initWithAction:(id)a3;
- (Class)cellClass;
- (NSArray)actions;
- (void)addAction:(id)a3;
@end

@implementation CNCardActionGroupItem

- (void).cxx_destruct
{
}

- (NSArray)actions
{
  return &self->_actions->super;
}

- (void)addAction:(id)a3
{
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CNCardActionGroupItem)initWithAction:(id)a3
{
  id v4 = a3;
  v5 = [(CNCardActionGroupItem *)self init];
  v6 = v5;
  if (v5) {
    [(CNCardActionGroupItem *)v5 addAction:v4];
  }

  return v6;
}

- (CNCardActionGroupItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNCardActionGroupItem;
  v2 = [(CNCardActionGroupItem *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v2->_actions;
    v2->_actions = v3;
  }
  return v2;
}

+ (id)actionGroupItemWithActions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] != 1 && objc_msgSend(v5, "count") != 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:a1 file:@"CNCardActionGroupItem.m" lineNumber:49 description:@"We currently only support at most two actions in a cell"];
  }
  id v6 = objc_alloc_init((Class)a1);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addAction:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)actionGroupItemWithAction:(id)a3
{
  id v3 = a3;
  id v4 = [[CNCardActionGroupItem alloc] initWithAction:v3];

  return v4;
}

@end