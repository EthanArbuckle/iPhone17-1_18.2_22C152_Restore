@interface AKLineStylesViewController
+ (id)generateLineImageForTag:(int64_t)a3 selected:(BOOL)a4;
- (AKController)controller;
- (AKLineStylesViewController)initWithController:(id)a3;
- (NSArray)lineWidthTags;
- (UITableView)tableView;
- (id)indexPathForLineWidthTag:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)currentLineWidthTag;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)selectRowForTag:(int64_t)a3;
- (void)selectedLineWidthChanged:(int64_t)a3;
- (void)setController:(id)a3;
- (void)setLineWidthTags:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKLineStylesViewController

- (AKLineStylesViewController)initWithController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKLineStylesViewController;
  v5 = [(AKLineStylesViewController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(AKLineStylesViewController *)v5 setController:v4];
    [(AKLineStylesViewController *)v6 setLineWidthTags:&unk_26EA75D28];
    v7 = [(AKLineStylesViewController *)v6 lineWidthTags];
    -[AKLineStylesViewController setPreferredContentSize:](v6, "setPreferredContentSize:", 60.0, (double)(unint64_t)(48 * [v7 count]));
  }
  return v6;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)AKLineStylesViewController;
  [(AKLineStylesViewController *)&v23 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  id v4 = [(AKLineStylesViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x263F1CA40]);
  v6 = objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AKLineStylesViewController *)self setTableView:v6];

  v7 = [(AKLineStylesViewController *)self tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [MEMORY[0x263F1C550] clearColor];
  objc_super v9 = [(AKLineStylesViewController *)self tableView];
  [v9 setBackgroundColor:v8];

  v10 = [(AKLineStylesViewController *)self tableView];
  [v10 setAlwaysBounceVertical:0];

  v11 = [(AKLineStylesViewController *)self tableView];
  [v11 setSeparatorStyle:0];

  v12 = [(AKLineStylesViewController *)self tableView];
  [v12 setRowHeight:48.0];

  v13 = [(AKLineStylesViewController *)self tableView];
  [v13 setDelegate:self];

  v14 = [(AKLineStylesViewController *)self tableView];
  [v14 setDataSource:self];

  v15 = [(AKLineStylesViewController *)self tableView];
  [v15 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKLineStylesRowIdentifier"];

  v16 = [(AKLineStylesViewController *)self view];
  v17 = [(AKLineStylesViewController *)self tableView];
  [v16 addSubview:v17];

  v18 = _NSDictionaryOfVariableBindings(&cfstr_Tableview.isa, self->_tableView, 0);
  v19 = (void *)MEMORY[0x263F08938];
  v20 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:0 views:v18];
  [v19 activateConstraints:v20];

  v21 = (void *)MEMORY[0x263F08938];
  v22 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:0 views:v18];
  [v21 activateConstraints:v22];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKLineStylesViewController;
  [(AKLineStylesViewController *)&v4 viewWillAppear:a3];
  [(AKLineStylesViewController *)self selectRowForTag:[(AKLineStylesViewController *)self currentLineWidthTag]];
}

- (id)indexPathForLineWidthTag:(int64_t)a3
{
  objc_super v4 = [(AKLineStylesViewController *)self lineWidthTags];
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263F088C8] indexPathForRow:v6 inSection:0];
  }

  return v7;
}

- (void)selectRowForTag:(int64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v4 = [(AKLineStylesViewController *)self indexPathForLineWidthTag:a3];
  if (v4)
  {
    id v5 = [(AKLineStylesViewController *)self tableView];
    v7[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v5 reloadRowsAtIndexPaths:v6 withRowAnimation:0];
  }
}

- (int64_t)currentLineWidthTag
{
  v2 = [(AKLineStylesViewController *)self controller];
  v3 = [v2 attributeController];
  objc_super v4 = [v2 currentPageController];
  id v5 = [v2 currentPageController];
  uint64_t v6 = [v5 pageModelController];

  [v3 strokeWidth];
  double v8 = round(v7);
  objc_super v9 = [v6 selectedAnnotations];
  [v4 modelBaseScaleFactor];
  double v11 = v10;
  if ([v9 count] == 1)
  {
    v12 = [v9 anyObject];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [v9 anyObject];
      [v14 strokeWidth];
      double v8 = round(v15 / v11);
    }
  }

  return (uint64_t)v8 + 765000;
}

- (void)selectedLineWidthChanged:(int64_t)a3
{
  id v5 = [(AKLineStylesViewController *)self tableView];
  id v8 = [v5 selectedCell];

  if (v8)
  {
    if ((unint64_t)(a3 - 765001) < 0xF) {
      int64_t v6 = a3 - 765000;
    }
    else {
      int64_t v6 = a3;
    }
    [v8 setLineWidth:(float)v6];
    [v8 setTag:a3];
    double v7 = [(AKLineStylesViewController *)self controller];
    [v7 performActionForSender:v8];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(AKLineStylesViewController *)self lineWidthTags];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"AKLineStylesRowIdentifier" forIndexPath:v6];
  id v8 = [(AKLineStylesViewController *)self lineWidthTags];
  uint64_t v9 = [v6 row];

  double v10 = [v8 objectAtIndex:v9];
  uint64_t v11 = [v10 integerValue];

  v12 = objc_msgSend((id)objc_opt_class(), "generateLineImageForTag:selected:", v11, v11 == -[AKLineStylesViewController currentLineWidthTag](self, "currentLineWidthTag"));
  char v13 = [v7 imageView];
  [v13 setImage:v12];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKLineStylesViewController *)self lineWidthTags];
  uint64_t v9 = [v6 row];

  id v10 = [v8 objectAtIndex:v9];

  -[AKLineStylesViewController selectedLineWidthChanged:](self, "selectedLineWidthChanged:", [v10 integerValue]);
  [v7 reloadData];
}

+ (id)generateLineImageForTag:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  v20.width = 38.0;
  v20.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v7 = CurrentContext;
  if (v4)
  {
    CGContextSaveGState(CurrentContext);
    v21.size.width = 36.0;
    v21.origin.x = 1.0;
    v21.origin.y = 1.0;
    v21.size.height = 36.0;
    id v8 = CGPathCreateWithEllipseInRect(v21, 0);
    id v9 = [MEMORY[0x263F1C550] systemBlueColor];
    CGContextSetStrokeColorWithColor(v7, (CGColorRef)[v9 CGColor]);

    CGContextSetLineWidth(v7, 2.0);
    CGContextAddPath(v7, v8);
    CGContextStrokePath(v7);
    CGPathRelease(v8);
    CGContextRestoreGState(v7);
  }
  CGContextSaveGState(v7);
  id v10 = [MEMORY[0x263F1C550] grayColor];
  [v10 set];

  double v11 = (double)(a3 - 765000);
  double v12 = v11 * 1.5;
  if (a3 < 765007) {
    double v11 = v11 * 1.25;
  }
  if (a3 >= 765003) {
    double v13 = v11;
  }
  else {
    double v13 = v12;
  }
  double v14 = (38.0 - v13) * 0.5;
  double v15 = v14;
  double v16 = v13;
  CGContextFillEllipseInRect(v7, *(CGRect *)(&v13 - 2));
  CGContextRestoreGState(v7);
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)lineWidthTags
{
  return self->_lineWidthTags;
}

- (void)setLineWidthTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineWidthTags, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end