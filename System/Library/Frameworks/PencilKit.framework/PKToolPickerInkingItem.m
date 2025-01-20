@interface PKToolPickerInkingItem
+ (PKToolPickerInkingItem)_defaultInkingItemForType:(uint64_t)a1;
- (BOOL)_toolShouldBeSetOnCanvasView;
- (BOOL)allowsColorSelection;
- (PKInkingTool)inkingTool;
- (PKToolPickerInkingItem)initWithInkType:(id)a3;
- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4;
- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4 width:(double)a5;
- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4 width:(double)a5 identifier:(id)a6;
- (PKToolPickerInkingItem)initWithInkType:(id)a3 width:(double)a4;
- (double)width;
- (id)_dictionaryRepresentation;
- (id)_toolCopyWithColor:(id)a3;
- (id)_toolCopyWithWidth:(double)a3;
- (void)setAllowsColorSelection:(BOOL)a3;
@end

@implementation PKToolPickerInkingItem

- (PKToolPickerInkingItem)initWithInkType:(id)a3
{
  id v4 = a3;
  v5 = +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v4);
  +[PKInkingTool defaultWidthForInkType:v4];
  v6 = -[PKToolPickerInkingItem initWithInkType:color:width:identifier:](self, "initWithInkType:color:width:identifier:", v4, v5, 0);

  return v6;
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[PKInkingTool defaultWidthForInkType:v7];
  v8 = -[PKToolPickerInkingItem initWithInkType:color:width:identifier:](self, "initWithInkType:color:width:identifier:", v7, v6, 0);

  return v8;
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 width:(double)a4
{
  id v6 = a3;
  id v7 = +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v6);
  v8 = [(PKToolPickerInkingItem *)self initWithInkType:v6 color:v7 width:0 identifier:a4];

  return v8;
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4 width:(double)a5
{
  return [(PKToolPickerInkingItem *)self initWithInkType:a3 color:a4 width:0 identifier:a5];
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4 width:(double)a5 identifier:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [[PKInkingTool alloc] initWithInkType:v12 color:v11 width:a5];

  v16.receiver = self;
  v16.super_class = (Class)PKToolPickerInkingItem;
  v14 = [(PKToolPickerItem *)&v16 initWithTool:v13 identifier:v10];

  return v14;
}

- (PKInkingTool)inkingTool
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PKToolPickerItem *)self _tool];
  v5 = PKDynamicCast(v3, v4);

  return (PKInkingTool *)v5;
}

- (BOOL)allowsColorSelection
{
  v2 = [(PKToolPickerItem *)self _tool];
  uint64_t v3 = [v2 _configuration];
  char v4 = [v3 supportsColor];

  return v4;
}

- (void)setAllowsColorSelection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PKToolPickerItem *)self _tool];
  id v6 = [v5 _configuration];
  id v14 = (id)[v6 copy];

  id v7 = [v14 defaultColor];
  [v14 setSupportsColor:v3 andOpacity:v3 defaultColor:v7];

  v8 = [PKInkingTool alloc];
  v9 = [(PKToolPickerInkingItem *)self inkingTool];
  id v10 = [v9 ink];
  id v11 = [(PKTool *)v8 _initWithInk:v10 configuration:v14];

  id v12 = [(PKToolPickerItem *)self _tool];
  v13 = [v12 _toolPickerItemIdentifier];
  [v11 _setToolPickerItemIdentifier:v13];

  [(PKToolPickerItem *)self _updateTool:v11 shouldCallObserver:1];
}

- (double)width
{
  v2 = [(PKToolPickerInkingItem *)self inkingTool];
  [v2 width];
  double v4 = v3;

  return v4;
}

+ (PKToolPickerInkingItem)_defaultInkingItemForType:(uint64_t)a1
{
  id v2 = a2;
  self;
  double v3 = +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v2);
  +[PKInkingTool defaultWidthForInkType:v2];
  v5 = [[PKToolPickerInkingItem alloc] initWithInkType:v2 color:v3 width:v4];

  return v5;
}

- (id)_toolCopyWithWidth:(double)a3
{
  v5 = [(PKToolPickerInkingItem *)self inkingTool];
  id v6 = [v5 ink];
  id v7 = [v6 inkType];
  +[PKInkingTool _weightForWidth:v7 type:a3];
  double v9 = v8;

  id v10 = [v6 inkType];
  id v11 = [v6 color];
  id v12 = +[PKInk inkWithType:v10 color:v11 weight:v9];

  v13 = [PKInkingTool alloc];
  id v14 = [v5 _configuration];
  id v15 = [(PKTool *)v13 _initWithInk:v12 configuration:v14];

  objc_super v16 = [(PKToolPickerItem *)self _tool];
  v17 = [v16 _toolPickerItemIdentifier];
  [v15 _setToolPickerItemIdentifier:v17];

  return v15;
}

- (id)_toolCopyWithColor:(id)a3
{
  id v4 = a3;
  v5 = [(PKToolPickerInkingItem *)self inkingTool];
  id v6 = [v5 ink];
  id v7 = [v6 inkType];
  [v6 weight];
  double v8 = +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", v7, v4);

  double v9 = [PKInkingTool alloc];
  id v10 = [v5 _configuration];
  id v11 = [(PKTool *)v9 _initWithInk:v8 configuration:v10];

  id v12 = [(PKToolPickerItem *)self _tool];
  v13 = [v12 _toolPickerItemIdentifier];
  [v11 _setToolPickerItemIdentifier:v13];

  return v11;
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  double v3 = [(PKToolPickerInkingItem *)self inkingTool];
  id v4 = [v3 ink];
  v5 = [v4 dictionaryRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(PKToolPickerItem *)self identifier];
  [v6 setObject:v7 forKeyedSubscript:@"identifier"];

  return v6;
}

@end