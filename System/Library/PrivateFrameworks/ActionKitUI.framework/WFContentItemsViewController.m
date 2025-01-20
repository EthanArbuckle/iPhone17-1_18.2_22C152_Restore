@interface WFContentItemsViewController
- (BOOL)allowsCoercion;
- (NSArray)contentItems;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAllowsCoercion:(BOOL)a3;
- (void)setContentItems:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFContentItemsViewController

- (void).cxx_destruct
{
}

- (void)setAllowsCoercion:(BOOL)a3
{
  self->_allowsCoercion = a3;
}

- (BOOL)allowsCoercion
{
  return self->_allowsCoercion;
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndex:](self->_contentItems, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_allowsCoercion)
  {
    v5 = [[WFContentGraphViewController alloc] initWithContentItem:v23];
    v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F82E10]);
      v9 = [(WFContentItemsViewController *)self navigationController];
      v10 = [v9 view];
      [v10 bounds];
      double v12 = v11;
      v13 = [(WFContentItemsViewController *)self navigationController];
      v14 = [v13 view];
      [v14 bounds];
      double v16 = v15 + 20.0;
      v17 = [(WFContentGraphViewController *)v5 view];
      objc_msgSend(v17, "setFrame:", 0.0, 0.0, v12, v16);

      v18 = [(WFContentGraphViewController *)v5 view];
      [v18 setAutoresizingMask:0];

      [v8 addChildViewController:v5];
      [(WFContentGraphViewController *)v5 didMoveToParentViewController:v8];
      v19 = [v8 view];
      v20 = [(WFContentGraphViewController *)v5 view];
      [v19 addSubview:v20];

      v21 = [(WFContentGraphViewController *)v5 title];
      [v8 setTitle:v21];

      v22 = [(WFContentItemsViewController *)self navigationController];
      [v22 pushViewController:v8 animated:1];

      goto LABEL_6;
    }
  }
  else
  {
    v5 = [[WFContentItemViewController alloc] initWithContentItem:v23];
  }
  id v8 = [(WFContentItemsViewController *)self navigationController];
  [v8 pushViewController:v5 animated:1];
LABEL_6:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"WFContentItemCellIdentifier" forIndexPath:v6];
  contentItems = self->_contentItems;
  uint64_t v9 = [v6 row];

  v10 = [(NSArray *)contentItems objectAtIndex:v9];
  [v7 setAccessoryType:1];
  double v11 = [v10 icon];
  double v12 = [v11 UIImage];
  v13 = [v7 imageView];
  [v13 setImage:v12];

  v14 = [v10 name];
  double v15 = [v7 textLabel];
  [v15 setText:v14];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_contentItems count];
}

- (void)setContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_contentItems, a3);
  id v4 = [(WFContentItemsViewController *)self tableView];
  [v4 reloadData];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WFContentItemsViewController;
  [(WFContentItemsViewController *)&v5 viewDidLoad];
  v3 = WFLocalizedString(@"Items");
  [(WFContentItemsViewController *)self setTitle:v3];

  id v4 = [(WFContentItemsViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFContentItemCellIdentifier"];
}

@end