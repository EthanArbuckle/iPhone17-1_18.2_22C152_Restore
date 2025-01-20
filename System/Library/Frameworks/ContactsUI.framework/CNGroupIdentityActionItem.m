@interface CNGroupIdentityActionItem
+ (id)imageForSystemImageNamed:(id)a3;
+ (id)imageForSystemImageNamed:(id)a3 withPointSize:(double)a4;
+ (id)imageForSystemImageNamed:(id)a3 withTextStyle:(id)a4;
- (BOOL)overrideEnabledState;
- (BOOL)shouldOverrideEnabledState;
- (BOOL)shouldPresentDisambiguationUI;
- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 actionBlock:(id)a5;
- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 image:(id)a5 actionBlock:(id)a6;
- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 systemImageName:(id)a5 actionBlock:(id)a6;
- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 systemImageName:(id)a5 overrideEnabledState:(BOOL)a6 actionBlock:(id)a7;
- (CNGroupIdentityActionItemDelegate)delegate;
- (NSString)actionType;
- (NSString)title;
- (UIImage)image;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOverrideEnabledState:(BOOL)a3;
- (void)setShouldOverrideEnabledState:(BOOL)a3;
- (void)setShouldPresentDisambiguationUI:(BOOL)a3;
@end

@implementation CNGroupIdentityActionItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_actionBlock, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CNGroupIdentityActionItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNGroupIdentityActionItemDelegate *)WeakRetained;
}

- (void)setShouldPresentDisambiguationUI:(BOOL)a3
{
  self->_shouldPresentDisambiguationUI = a3;
}

- (BOOL)shouldPresentDisambiguationUI
{
  return self->_shouldPresentDisambiguationUI;
}

- (BOOL)overrideEnabledState
{
  return self->_overrideEnabledState;
}

- (void)setShouldOverrideEnabledState:(BOOL)a3
{
  self->_shouldOverrideEnabledState = a3;
}

- (BOOL)shouldOverrideEnabledState
{
  return self->_shouldOverrideEnabledState;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)title
{
  return self->_title;
}

- (void)setActionBlock:(id)a3
{
  id v4 = a3;
  if (self->_actionBlock != v4)
  {
    id v10 = v4;
    v5 = _Block_copy(v4);
    id actionBlock = self->_actionBlock;
    self->_id actionBlock = v5;

    v7 = [(CNGroupIdentityActionItem *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    id v4 = v10;
    if (v8)
    {
      v9 = [(CNGroupIdentityActionItem *)self delegate];
      [v9 groupIdentityActionItem:self didUpdateActionBlock:v10];

      id v4 = v10;
    }
  }
}

- (void)setOverrideEnabledState:(BOOL)a3
{
  if (self->_overrideEnabledState != a3)
  {
    BOOL v3 = a3;
    self->_overrideEnabledState = a3;
    v5 = [(CNGroupIdentityActionItem *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(CNGroupIdentityActionItem *)self delegate];
      [v7 groupIdentityActionItem:self didUpdateOverrideEnabledState:v3];
    }
  }
}

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 image:(id)a5 actionBlock:(id)a6
{
  id v11 = a3;
  v12 = (NSString *)a4;
  v13 = (UIImage *)a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNGroupIdentityActionItem;
  v15 = [(CNGroupIdentityActionItem *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    v16->_actionType = v12;
    v16->_image = v13;
    uint64_t v17 = [v14 copy];
    id actionBlock = v16->_actionBlock;
    v16->_id actionBlock = (id)v17;

    v16->_shouldPresentDisambiguationUI = 1;
    v19 = v16;
  }

  return v16;
}

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 systemImageName:(id)a5 actionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() imageForSystemImageNamed:v11];

  v15 = [(CNGroupIdentityActionItem *)self initWithTitle:v13 actionType:v12 image:v14 actionBlock:v10];
  return v15;
}

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 systemImageName:(id)a5 overrideEnabledState:(BOOL)a6 actionBlock:(id)a7
{
  char v8 = [(CNGroupIdentityActionItem *)self initWithTitle:a3 actionType:a4 systemImageName:a5 actionBlock:a7];
  v9 = v8;
  if (v8)
  {
    v8->_shouldOverrideEnabledState = 1;
    v8->_overrideEnabledState = a6;
    id v10 = v8;
  }

  return v9;
}

- (CNGroupIdentityActionItem)initWithTitle:(id)a3 actionType:(id)a4 actionBlock:(id)a5
{
  return [(CNGroupIdentityActionItem *)self initWithTitle:a3 actionType:a4 image:0 actionBlock:a5];
}

+ (id)imageForSystemImageNamed:(id)a3 withPointSize:(double)a4
{
  v5 = (void *)MEMORY[0x1E4FB1830];
  id v6 = a3;
  id v7 = [v5 configurationWithPointSize:0 weight:2 scale:a4];
  char v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v6 withConfiguration:v7];

  return v8;
}

+ (id)imageForSystemImageNamed:(id)a3 withTextStyle:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", a3, 2, 0, 1, a4);
}

+ (id)imageForSystemImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() imageForSystemImageNamed:v3 withTextStyle:*MEMORY[0x1E4FB2998]];

  return v4;
}

@end