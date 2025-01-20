@interface AKColorPickerViewController
- (AKColorPaletteView)colorPalette;
- (AKColorPickerViewController)initWithController:(id)a3;
- (AKController)controller;
- (UIColor)color;
- (id)convertTextAttributes:(id)a3;
- (int64_t)colorAttributeTag;
- (int64_t)tag;
- (void)setColor:(id)a3;
- (void)setColorAttributeTag:(int64_t)a3;
- (void)setColorPalette:(id)a3;
- (void)setController:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)valueChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKColorPickerViewController

- (AKColorPickerViewController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKColorPickerViewController;
  v5 = [(AKColorPickerViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(AKColorPickerViewController *)v5 setController:v4];
    -[AKColorPickerViewController setPreferredContentSize:](v6, "setPreferredContentSize:", 60.0, 382.0);
  }

  return v6;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)AKColorPickerViewController;
  [(AKColorPickerViewController *)&v19 viewDidLoad];
  v3 = [AKColorPaletteView alloc];
  [(AKColorPickerViewController *)self preferredContentSize];
  double v5 = v4;
  [(AKColorPickerViewController *)self preferredContentSize];
  v7 = -[AKColorPaletteView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, v5, v6);
  [(AKColorPickerViewController *)self setColorPalette:v7];

  objc_super v8 = [(AKColorPickerViewController *)self colorPalette];
  [v8 setScrollDirection:0];

  v9 = [(AKColorPickerViewController *)self colorPalette];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(AKColorPickerViewController *)self colorPalette];
  [v10 setTag:765101];

  v11 = [(AKColorPickerViewController *)self colorPalette];
  [v11 addTarget:self action:sel_valueChanged_ forControlEvents:4096];

  v12 = [(AKColorPickerViewController *)self view];
  v13 = [(AKColorPickerViewController *)self colorPalette];
  [v12 addSubview:v13];

  v14 = _NSDictionaryOfVariableBindings(&cfstr_Colorpalette.isa, self->_colorPalette, 0);
  v15 = (void *)MEMORY[0x263F08938];
  v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_colorPalette]|" options:0 metrics:0 views:v14];
  [v15 activateConstraints:v16];

  v17 = (void *)MEMORY[0x263F08938];
  v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_colorPalette]|" options:0 metrics:0 views:v14];
  [v17 activateConstraints:v18];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKColorPickerViewController;
  [(AKColorPickerViewController *)&v6 viewWillAppear:a3];
  double v4 = [(AKColorPickerViewController *)self color];
  double v5 = [(AKColorPickerViewController *)self colorPalette];
  [v5 setColor:v4];
}

- (void)valueChanged:(id)a3
{
  id v9 = a3;
  double v4 = [(AKColorPickerViewController *)self colorPalette];
  double v5 = [v4 color];
  [(AKColorPickerViewController *)self setColor:v5];

  objc_super v6 = [(AKColorPickerViewController *)self controller];
  if ([(AKColorPickerViewController *)self colorAttributeTag] == 765101)
  {
    [v6 performActionForSender:v9];
  }
  else if ([(AKColorPickerViewController *)self colorAttributeTag] == 765106)
  {
    v7 = [MEMORY[0x263F1C408] sharedApplication];
    objc_super v8 = [v6 actionController];
    [v7 sendAction:sel_performActionForSender_ to:v8 from:self forEvent:0];
  }
  else
  {
    NSLog(&cfstr_SCalledWithInc.isa, "-[AKColorPickerViewController valueChanged:]", [(AKColorPickerViewController *)self colorAttributeTag]);
  }
}

- (void)setColorAttributeTag:(int64_t)a3
{
  self->_colorAttributeTag = a3;
  self->_tag = a3;
}

- (id)convertTextAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F1C240];
  objc_super v6 = [v4 objectForKey:*MEMORY[0x263F1C240]];
  v7 = [(AKColorPickerViewController *)self color];
  if (!v6)
  {
    objc_super v6 = [MEMORY[0x263F1C550] blackColor];
  }
  if ([v6 akIsEqualToColor:v7])
  {
    objc_super v8 = 0;
  }
  else
  {
    if (v4)
    {
      id v9 = (void *)[v4 mutableCopy];
    }
    else
    {
      id v9 = [MEMORY[0x263EFF9A0] dictionary];
    }
    objc_super v8 = v9;
    [v9 setObject:v7 forKey:v5];
  }
  if (v8) {
    v10 = v8;
  }
  else {
    v10 = v4;
  }
  id v11 = v10;

  return v11;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
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
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_destroyWeak((id *)&self->_controller);

  objc_storeStrong((id *)&self->_color, 0);
}

@end