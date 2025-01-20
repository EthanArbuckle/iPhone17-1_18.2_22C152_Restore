@interface AMSUIWebButtonModel
- (AMSUIWebActionRunnable)action;
- (AMSUIWebActivityIndicatorModel)activityIndicator;
- (AMSUIWebButtonModel)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)bold;
- (BOOL)enabled;
- (NSDictionary)underlyingJSObject;
- (NSString)accessibilityLabel;
- (NSString)description;
- (NSString)identifier;
- (NSString)keyEquivalent;
- (NSString)systemImageName;
- (NSString)title;
- (id)_imageForButtonWithNavStyle:(int64_t)a3;
- (id)_makeActivityIndicatorView;
- (id)_makeProxCardButtonWithActionBlock:(id)a3;
- (id)actionBlock;
- (id)createDialogAction;
- (int64_t)_barButtonItemStyle;
- (int64_t)style;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setBold:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyEquivalent:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSystemImageName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnderlyingJSObject:(id)a3;
@end

@implementation AMSUIWebButtonModel

- (AMSUIWebButtonModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v38.receiver = self;
    v38.super_class = (Class)AMSUIWebButtonModel;
    v10 = [(AMSUIWebButtonModel *)&v38 init];
    if (v10)
    {
      v11 = [v7 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }

      if (v12) {
        v13 = v12;
      }
      else {
        v13 = &stru_26CC491D8;
      }
      objc_storeStrong((id *)&v10->_title, v13);

      objc_storeStrong((id *)&v10->_underlyingJSObject, a3);
      v14 = [v7 objectForKeyedSubscript:@"accessibilityLabel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }

      accessibilityLabel = v10->_accessibilityLabel;
      v10->_accessibilityLabel = v15;

      v17 = [v7 objectForKeyedSubscript:@"action"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }

      uint64_t v19 = +[AMSUIWebActionMapper actionFromJSObject:v18 context:v8];
      action = v10->_action;
      v10->_action = (AMSUIWebActionRunnable *)v19;

      v21 = [v7 objectForKeyedSubscript:@"activityIndicator"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v22 = v21;
      }
      else {
        id v22 = 0;
      }

      if (v22)
      {
        v23 = [[AMSUIWebActivityIndicatorModel alloc] initWithJSObject:v22 context:v8];
        activityIndicator = v10->_activityIndicator;
        v10->_activityIndicator = v23;
      }
      v25 = [v7 objectForKeyedSubscript:@"bold"];
      if (objc_opt_respondsToSelector()) {
        char v26 = [v25 BOOLValue];
      }
      else {
        char v26 = 0;
      }
      v10->_bold = v26;
      v27 = [v7 objectForKeyedSubscript:@"enabled"];
      if (objc_opt_respondsToSelector()) {
        char v28 = [v27 BOOLValue];
      }
      else {
        char v28 = 1;
      }
      v10->_enabled = v28;
      v29 = [v7 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v30 = v29;
      }
      else {
        v30 = 0;
      }

      identifier = v10->_identifier;
      v10->_identifier = v30;

      v32 = [v7 objectForKeyedSubscript:@"keyEquivalent"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v33 = v32;
      }
      else {
        v33 = 0;
      }

      keyEquivalent = v10->_keyEquivalent;
      v10->_keyEquivalent = v33;

      v35 = [v7 objectForKeyedSubscript:@"style"];
      if (objc_opt_respondsToSelector())
      {
        v36 = [v7 objectForKeyedSubscript:@"style"];
        v10->_style = [v36 integerValue];
      }
      else
      {
        v10->_style = 0;
      }
    }
    self = v10;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_barButtonItemStyle
{
  if ([(AMSUIWebButtonModel *)self bold]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)_makeActivityIndicatorView
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  v4 = [(AMSUIWebButtonModel *)self activityIndicator];
  int v5 = [v4 animate];

  if (v5) {
    [v3 startAnimating];
  }
  else {
    [v3 stopAnimating];
  }
  return v3;
}

- (id)_makeProxCardButtonWithActionBlock:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F62368] buttonWithProximityType:2];
  int v5 = (void *)MEMORY[0x263F823D0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__AMSUIWebButtonModel__makeProxCardButtonWithActionBlock___block_invoke;
  v9[3] = &unk_2643E48F8;
  id v10 = v3;
  id v6 = v3;
  id v7 = [v5 actionWithHandler:v9];
  [v4 addAction:v7 forControlEvents:64];

  return v4;
}

uint64_t __58__AMSUIWebButtonModel__makeProxCardButtonWithActionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createDialogAction
{
  id v3 = (void *)MEMORY[0x263F27C08];
  uint64_t v4 = [(AMSUIWebButtonModel *)self title];
  int v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26CC491D8;
  }
  id v7 = [v3 actionWithTitle:v6];

  id v8 = [(AMSUIWebButtonModel *)self identifier];

  if (v8)
  {
    v9 = [(AMSUIWebButtonModel *)self identifier];
    [v7 setIdentifier:v9];
  }
  unint64_t v10 = [(AMSUIWebButtonModel *)self style] - 1;
  if (v10 > 3) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_21C2CE368[v10];
  }
  [v7 setStyle:v11];
  v12 = [(AMSUIWebButtonModel *)self underlyingJSObject];
  v13 = (void *)[v12 mutableCopy];
  [v7 setUserInfo:v13];

  return v7;
}

- (NSString)description
{
  v2 = [(AMSUIWebButtonModel *)self underlyingJSObject];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (id)_imageForButtonWithNavStyle:(int64_t)a3
{
  if ([(AMSUIWebButtonModel *)self style] == 3)
  {
    if (a3 == 7)
    {
      int v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"];
      uint64_t v6 = objc_msgSend(v5, "ams_imageForResource:", @"navigation-close-button");
      goto LABEL_8;
    }
LABEL_5:
    id v7 = 0;
    goto LABEL_9;
  }
  if ([(AMSUIWebButtonModel *)self style] == 4) {
    goto LABEL_5;
  }
  id v7 = [(AMSUIWebButtonModel *)self systemImageName];

  if (!v7) {
    goto LABEL_9;
  }
  id v8 = (void *)MEMORY[0x263F827E8];
  int v5 = [(AMSUIWebButtonModel *)self systemImageName];
  uint64_t v6 = [v8 systemImageNamed:v5];
LABEL_8:
  id v7 = (void *)v6;

LABEL_9:
  return v7;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (AMSUIWebActionRunnable)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (AMSUIWebActivityIndicatorModel)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (BOOL)bold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)keyEquivalent
{
  return self->_keyEquivalent;
}

- (void)setKeyEquivalent:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
}

- (NSDictionary)underlyingJSObject
{
  return self->_underlyingJSObject;
}

- (void)setUnderlyingJSObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingJSObject, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keyEquivalent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end