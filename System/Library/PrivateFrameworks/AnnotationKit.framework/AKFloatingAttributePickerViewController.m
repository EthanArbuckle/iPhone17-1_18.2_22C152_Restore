@interface AKFloatingAttributePickerViewController
- (AKColorPaletteView)colorPalette;
- (AKController)controller;
- (AKFloatingAttributePickerViewController)initWithController:(id)a3;
- (NSArray)rightButtonItems;
- (NSArray)staticItems;
- (UIBarButtonItem)colorPaletteButtonItem;
- (UIColor)color;
- (UIToolbar)toolbar;
- (UIView)separatorView;
- (id)convertTextAttributes:(id)a3;
- (int64_t)colorAttributeTag;
- (int64_t)tag;
- (void)setColor:(id)a3;
- (void)setColorAttributeTag:(int64_t)a3;
- (void)setColorPalette:(id)a3;
- (void)setColorPaletteButtonItem:(id)a3;
- (void)setController:(id)a3;
- (void)setRightButtonItems:(id)a3;
- (void)setRightButtonItems:(id)a3 animated:(BOOL)a4;
- (void)setSeparatorView:(id)a3;
- (void)setStaticItems:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setToolbar:(id)a3;
- (void)valueChanged:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AKFloatingAttributePickerViewController

- (AKFloatingAttributePickerViewController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKFloatingAttributePickerViewController;
  v5 = [(AKFloatingAttributePickerViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(AKFloatingAttributePickerViewController *)v5 setController:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v43[2] = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)AKFloatingAttributePickerViewController;
  [(AKFloatingAttributePickerViewController *)&v42 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  id v4 = [(AKFloatingAttributePickerViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(AKFloatingAttributePickerViewController *)self view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(AKFloatingAttributePickerViewController *)self view];
  v7 = (void *)MEMORY[0x263F08938];
  objc_super v8 = _NSDictionaryOfVariableBindings(&cfstr_View.isa, v6, 0);
  v9 = [v7 constraintsWithVisualFormat:@"V:[view(44)]" options:0 metrics:0 views:v8];
  [v7 activateConstraints:v9];

  v10 = [(AKFloatingAttributePickerViewController *)self controller];
  id v11 = objc_alloc(MEMORY[0x263F1CAE0]);
  double v12 = *MEMORY[0x263F001A8];
  double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], v13, v14, v15);
  [(AKFloatingAttributePickerViewController *)self setToolbar:v16];

  v17 = [(AKFloatingAttributePickerViewController *)self toolbar];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [v10 toolbarView];
  v19 = [v18 tintColor];
  v20 = [(AKFloatingAttributePickerViewController *)self toolbar];
  [v20 setTintColor:v19];

  v21 = [(AKFloatingAttributePickerViewController *)self view];
  v22 = [(AKFloatingAttributePickerViewController *)self toolbar];
  [v21 addSubview:v22];

  v23 = -[AKColorPaletteView initWithFrame:]([AKColorPaletteView alloc], "initWithFrame:", v12, v13, v14, v15);
  [(AKFloatingAttributePickerViewController *)self setColorPalette:v23];

  v24 = [(AKFloatingAttributePickerViewController *)self colorPalette];
  [v24 setScrollDirection:1];

  v25 = [(AKFloatingAttributePickerViewController *)self colorPalette];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:1];

  v26 = [(AKFloatingAttributePickerViewController *)self colorPalette];
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, 256.0, 44.0);

  v27 = [(AKFloatingAttributePickerViewController *)self colorPalette];
  [v27 setTag:765101];

  v28 = [(AKFloatingAttributePickerViewController *)self colorPalette];
  [v28 addTarget:self action:sel_valueChanged_ forControlEvents:4096];

  id v29 = objc_alloc(MEMORY[0x263F1C468]);
  v30 = [(AKFloatingAttributePickerViewController *)self colorPalette];
  v31 = (void *)[v29 initWithCustomView:v30];
  [(AKFloatingAttributePickerViewController *)self setColorPaletteButtonItem:v31];

  v32 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
  v33 = [(AKFloatingAttributePickerViewController *)self colorPaletteButtonItem];
  v43[0] = v33;
  v43[1] = v32;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
  [(AKFloatingAttributePickerViewController *)self setStaticItems:v34];

  v35 = [(AKFloatingAttributePickerViewController *)self staticItems];
  v36 = [(AKFloatingAttributePickerViewController *)self toolbar];
  [v36 setItems:v35];

  v37 = _NSDictionaryOfVariableBindings(&cfstr_Toolbar.isa, self->_toolbar, 0);
  v38 = (void *)MEMORY[0x263F08938];
  v39 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_toolbar]|" options:0 metrics:0 views:v37];
  [v38 activateConstraints:v39];

  v40 = (void *)MEMORY[0x263F08938];
  v41 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_toolbar]|" options:0 metrics:0 views:v37];
  [v40 activateConstraints:v41];
}

- (void)valueChanged:(id)a3
{
  id v8 = a3;
  id v4 = [(AKFloatingAttributePickerViewController *)self controller];
  v5 = [v8 color];
  objc_storeStrong((id *)&self->_color, v5);
  if ([(AKFloatingAttributePickerViewController *)self colorAttributeTag] == 765101)
  {
    [v4 performActionForSender:v8];
  }
  else if ([(AKFloatingAttributePickerViewController *)self colorAttributeTag] == 765106)
  {
    v6 = [MEMORY[0x263F1C408] sharedApplication];
    v7 = [v4 actionController];
    [v6 sendAction:sel_performActionForSender_ to:v7 from:self forEvent:0];
  }
  else
  {
    NSLog(&cfstr_SCalledWithInc.isa, "-[AKFloatingAttributePickerViewController valueChanged:]", [(AKFloatingAttributePickerViewController *)self colorAttributeTag]);
  }
}

- (void)setColor:(id)a3
{
  v6 = (UIColor *)a3;
  if (self->_color != v6)
  {
    objc_storeStrong((id *)&self->_color, a3);
    v5 = [(AKFloatingAttributePickerViewController *)self colorPalette];
    [v5 setColor:v6];
  }
}

- (void)setRightButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (([v10 isEqualToArray:self->_rightButtonItems] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_rightButtonItems, a3);
    v7 = [(AKFloatingAttributePickerViewController *)self staticItems];
    id v8 = (void *)[v7 mutableCopy];

    [v8 addObjectsFromArray:v10];
    v9 = [(AKFloatingAttributePickerViewController *)self toolbar];
    [v9 setItems:v8 animated:v4];
  }
}

- (NSArray)rightButtonItems
{
  return self->_rightButtonItems;
}

- (void)setColorAttributeTag:(int64_t)a3
{
  self->_colorAttributeTag = a3;
  self->_tag = a3;
}

- (void)viewDidLayoutSubviews
{
  v3 = [(AKFloatingAttributePickerViewController *)self toolbar];
  [v3 frame];
  double v4 = CGRectGetWidth(v15) + -100.0;

  if (v4 > 0.0)
  {
    v5 = [(AKFloatingAttributePickerViewController *)self colorPalette];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    if (v4 >= 256.0) {
      double v12 = 256.0;
    }
    else {
      double v12 = 200.0;
    }
    id v13 = [(AKFloatingAttributePickerViewController *)self colorPalette];
    objc_msgSend(v13, "setFrame:", v7, v9, v12, v11);
  }
}

- (id)convertTextAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F1C240];
  double v6 = [v4 objectForKey:*MEMORY[0x263F1C240]];
  double v7 = [(AKFloatingAttributePickerViewController *)self color];
  if (!v6)
  {
    double v6 = [MEMORY[0x263F1C550] blackColor];
  }
  if ([v6 akIsEqualToColor:v7])
  {
    double v8 = 0;
  }
  else
  {
    if (v4)
    {
      double v9 = (void *)[v4 mutableCopy];
    }
    else
    {
      double v9 = [MEMORY[0x263EFF9A0] dictionary];
    }
    double v8 = v9;
    [v9 setObject:v7 forKey:v5];
  }
  if (v8) {
    double v10 = v8;
  }
  else {
    double v10 = v4;
  }
  id v11 = v10;

  return v11;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)colorAttributeTag
{
  return self->_colorAttributeTag;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKColorPaletteView)colorPalette
{
  return self->_colorPalette;
}

- (void)setColorPalette:(id)a3
{
}

- (UIBarButtonItem)colorPaletteButtonItem
{
  return self->_colorPaletteButtonItem;
}

- (void)setColorPaletteButtonItem:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (NSArray)staticItems
{
  return self->_staticItems;
}

- (void)setStaticItems:(id)a3
{
}

- (void)setRightButtonItems:(id)a3
{
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButtonItems, 0);
  objc_storeStrong((id *)&self->_staticItems, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_colorPaletteButtonItem, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end