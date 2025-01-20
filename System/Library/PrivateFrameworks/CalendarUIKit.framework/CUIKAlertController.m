@interface CUIKAlertController
+ (id)alertControllerWithTitle:(id)a3 message:(id)a4;
- (CUIKAlertController)initWithTitle:(id)a3 message:(id)a4;
- (NSArray)actions;
- (NSString)message;
- (NSString)title;
- (int64_t)_actionStyleForActionStyle:(int64_t)a3;
- (void)addAction:(id)a3;
- (void)presentFromSource:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CUIKAlertController

+ (id)alertControllerWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 message:v6];

  return v8;
}

- (CUIKAlertController)initWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CUIKAlertController;
  v9 = [(CUIKAlertController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_message, a4);
    uint64_t v11 = objc_opt_new();
    actions = v10->_actions;
    v10->_actions = (NSMutableArray *)v11;
  }
  return v10;
}

- (void)addAction:(id)a3
{
}

- (NSArray)actions
{
  v2 = (void *)[(NSMutableArray *)self->_actions copy];

  return (NSArray *)v2;
}

- (void)presentFromSource:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v19 = v4;
    id v6 = (void *)MEMORY[0x1E4FB1418];
    id v7 = [(CUIKAlertController *)self title];
    id v8 = [(CUIKAlertController *)self message];
    v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [(CUIKAlertController *)self actions];
    uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(obj);
          }
          objc_super v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1E4FB1410];
          v16 = [v14 title];
          int64_t v17 = -[CUIKAlertController _actionStyleForActionStyle:](self, "_actionStyleForActionStyle:", [v14 style]);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __41__CUIKAlertController_presentFromSource___block_invoke;
          v21[3] = &unk_1E636A360;
          v21[4] = v14;
          v18 = [v15 actionWithTitle:v16 style:v17 handler:v21];
          [v9 addAction:v18];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    v5 = v19;
    [v19 presentViewController:v9 animated:1 completion:0];
  }
}

void __41__CUIKAlertController_presentFromSource___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];
  v2[2](v2, *(void *)(a1 + 32));
}

- (int64_t)_actionStyleForActionStyle:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

@end