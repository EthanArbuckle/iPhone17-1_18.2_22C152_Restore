@interface CNContactMenuDisplayingAction
+ (id)contactActionWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5;
- (CNContactMenuDisplayingAction)initWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5;
- (id)menuProvider;
@end

@implementation CNContactMenuDisplayingAction

- (void).cxx_destruct
{
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (CNContactMenuDisplayingAction)initWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNContactMenuDisplayingAction;
  v9 = [(CNContactAction *)&v14 initWithTitle:a3 target:0 selector:0 destructive:v5];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id menuProvider = v9->_menuProvider;
    v9->_id menuProvider = v10;

    v12 = v9;
  }

  return v9;
}

+ (id)contactActionWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[CNContactMenuDisplayingAction alloc] initWithTitle:v8 menuProvider:v7 destructive:v5];

  return v9;
}

@end