@interface AMSUIWebConditionalButtonModel
- (AMSUIWebButtonModel)button;
- (AMSUIWebConditionalButtonModel)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)hideOnModal;
- (BOOL)hideOnPush;
- (NSString)description;
- (void)setButton:(id)a3;
- (void)setHideOnModal:(BOOL)a3;
- (void)setHideOnPush:(BOOL)a3;
@end

@implementation AMSUIWebConditionalButtonModel

- (AMSUIWebConditionalButtonModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebConditionalButtonModel;
  self = [(AMSUIWebConditionalButtonModel *)&v19 init];
  if (!self) {
    goto LABEL_15;
  }
  v9 = [v6 objectForKeyedSubscript:@"hideOnPush"];
  char v10 = (objc_opt_respondsToSelector() & 1) != 0 ? [v9 BOOLValue] : 0;
  self->_hideOnPush = v10;
  v11 = [v6 objectForKeyedSubscript:@"hideOnModal"];
  char v12 = (objc_opt_respondsToSelector() & 1) != 0 ? [v11 BOOLValue] : 0;
  self->_hideOnModal = v12;
  v13 = [v6 objectForKeyedSubscript:@"button"];
  objc_opt_class();
  id v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;

  v15 = [[AMSUIWebButtonModel alloc] initWithJSObject:v14 context:v7];
  button = self->_button;
  self->_button = v15;

  v17 = self->_button;
  if (!v17)
  {
LABEL_3:
    v8 = 0;
  }
  else
  {
LABEL_15:
    self = self;
    v8 = self;
  }

  return v8;
}

- (NSString)description
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"button";
  v3 = [(AMSUIWebConditionalButtonModel *)self button];
  v10[0] = v3;
  v9[1] = @"hideOnPush";
  if ([(AMSUIWebConditionalButtonModel *)self hideOnPush]) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  v10[1] = v4;
  v9[2] = @"hideOnModal";
  if ([(AMSUIWebConditionalButtonModel *)self hideOnModal]) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  v10[2] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  id v7 = [v6 description];

  return (NSString *)v7;
}

- (AMSUIWebButtonModel)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (BOOL)hideOnModal
{
  return self->_hideOnModal;
}

- (void)setHideOnModal:(BOOL)a3
{
  self->_hideOnModal = a3;
}

- (BOOL)hideOnPush
{
  return self->_hideOnPush;
}

- (void)setHideOnPush:(BOOL)a3
{
  self->_hideOnPush = a3;
}

- (void).cxx_destruct
{
}

@end