@interface AKMarkupBarButtonItem
+ (id)markupBarButtonWithTarget:(id)a3 action:(SEL)a4;
- (AKMarkupBarButtonItem)init;
- (AKMarkupButtonContainerView)toggleView;
- (UIButton)toggleButton;
- (void)setAction:(SEL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)setToggleButton:(id)a3;
- (void)setToggleView:(id)a3;
@end

@implementation AKMarkupBarButtonItem

+ (id)markupBarButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(AKMarkupBarButtonItem);
  [(AKMarkupBarButtonItem *)v6 setTarget:v5];

  [(AKMarkupBarButtonItem *)v6 setAction:a4];

  return v6;
}

- (AKMarkupBarButtonItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKMarkupBarButtonItem;
  v2 = [(UIBarItem *)&v7 init];
  if (v2)
  {
    v3 = [AKMarkupButtonContainerView alloc];
    uint64_t v4 = -[AKMarkupButtonContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    toggleView = v2->_toggleView;
    v2->_toggleView = (AKMarkupButtonContainerView *)v4;

    [(AKMarkupBarButtonItem *)v2 setCustomView:v2->_toggleView];
  }
  return v2;
}

- (void)setTarget:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKMarkupBarButtonItem;
  [(AKMarkupBarButtonItem *)&v9 setTarget:a3];
  uint64_t v4 = [(AKMarkupBarButtonItem *)self toggleView];
  id v5 = [v4 button];
  [v5 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  v6 = [(AKMarkupBarButtonItem *)self toggleView];
  objc_super v7 = [v6 button];
  v8 = [(AKMarkupBarButtonItem *)self target];
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, -[AKMarkupBarButtonItem action](self, "action"), 64);
}

- (void)setAction:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKMarkupBarButtonItem;
  [(AKMarkupBarButtonItem *)&v9 setAction:a3];
  uint64_t v4 = [(AKMarkupBarButtonItem *)self toggleView];
  id v5 = [v4 button];
  [v5 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  v6 = [(AKMarkupBarButtonItem *)self toggleView];
  objc_super v7 = [v6 button];
  v8 = [(AKMarkupBarButtonItem *)self target];
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, -[AKMarkupBarButtonItem action](self, "action"), 64);
}

- (void)setSelected:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKMarkupBarButtonItem;
  [(AKMarkupBarButtonItem *)&v5 setSelected:a3];
  uint64_t v4 = [(AKMarkupBarButtonItem *)self toggleView];
  objc_msgSend(v4, "setSelected:", -[AKMarkupBarButtonItem isSelected](self, "isSelected"));
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKMarkupBarButtonItem;
  -[AKMarkupBarButtonItem setEnabled:](&v7, sel_setEnabled_);
  objc_super v5 = [(AKMarkupBarButtonItem *)self toggleView];
  v6 = [v5 button];
  [v6 setEnabled:v3];
}

- (UIButton)toggleButton
{
  return self->_toggleButton;
}

- (void)setToggleButton:(id)a3
{
}

- (AKMarkupButtonContainerView)toggleView
{
  return self->_toggleView;
}

- (void)setToggleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleView, 0);

  objc_storeStrong((id *)&self->_toggleButton, 0);
}

@end