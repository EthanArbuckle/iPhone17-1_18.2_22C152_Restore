@interface CNContactTargetActionWrapper
- (CNContactTargetActionWrapper)initWithTarget:(id)a3 action:(SEL)a4;
- (SEL)action;
- (id)description;
- (id)target;
- (void)performActionWithSender:(id)a3;
@end

@implementation CNContactTargetActionWrapper

- (void).cxx_destruct
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNContactTargetActionWrapper *)self target];
  id v5 = (id)[v3 appendName:@"target" object:v4];

  id v6 = (id)objc_msgSend(v3, "appendName:selector:", @"action", -[CNContactTargetActionWrapper action](self, "action"));
  v7 = [v3 build];

  return v7;
}

- (void)performActionWithSender:(id)a3
{
  id v7 = a3;
  v4 = [(CNContactTargetActionWrapper *)self target];
  [(CNContactTargetActionWrapper *)self action];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactTargetActionWrapper *)self target];
    objc_msgSend(v6, -[CNContactTargetActionWrapper action](self, "action"), v7);
  }
}

- (CNContactTargetActionWrapper)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNContactTargetActionWrapper;
  id v7 = [(CNContactTargetActionWrapper *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_action = v9;
  }

  return v8;
}

@end