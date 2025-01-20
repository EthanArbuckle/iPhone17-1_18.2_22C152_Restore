@interface _CPUIBaseTableCell
+ (UIColor)disabledColor;
+ (UIColor)disabledHighlightedColor;
+ (double)minimumHeight;
+ (double)rowHeight;
+ (id)cellForTableView:(id)a3;
- (BOOL)itemEnabled;
- (void)_updateTintColors;
- (void)setItemEnabled:(BOOL)a3;
@end

@implementation _CPUIBaseTableCell

+ (id)cellForTableView:(id)a3
{
  id v4 = a3;
  v5 = [a1 identifier];
  v6 = [v4 dequeueReusableCellWithIdentifier:v5];

  if (!v6)
  {
    v6 = (void *)[objc_alloc((Class)a1) initWithStyle:3 reuseIdentifier:v5];
    [v6 configureCell];
  }

  return v6;
}

- (void)_updateTintColors
{
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] labelColor];
  }
  else {
  v3 = +[_CPUIBaseTableCell disabledColor];
  }
  id v4 = [(_CPUIBaseTableCell *)self textLabel];
  [v4 setTextColor:v3];

  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  v5 = +[_CPUIBaseTableCell disabledHighlightedColor];
  }
  v6 = [(_CPUIBaseTableCell *)self textLabel];
  [v6 setHighlightedTextColor:v5];

  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  }
  else {
  v7 = +[_CPUIBaseTableCell disabledColor];
  }
  v8 = [(_CPUIBaseTableCell *)self detailTextLabel];
  [v8 setTextColor:v7];

  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  }
  else {
  id v10 = +[_CPUIBaseTableCell disabledHighlightedColor];
  }
  v9 = [(_CPUIBaseTableCell *)self detailTextLabel];
  [v9 setHighlightedTextColor:v10];
}

+ (double)minimumHeight
{
  return 44.0;
}

+ (double)rowHeight
{
  return 44.0;
}

+ (UIColor)disabledColor
{
  if (disabledColor_onceToken != -1) {
    dispatch_once(&disabledColor_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)disabledColor_disabled;
  return (UIColor *)v2;
}

+ (UIColor)disabledHighlightedColor
{
  if (disabledHighlightedColor_onceToken != -1) {
    dispatch_once(&disabledHighlightedColor_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)disabledHighlightedColor_disabled;
  return (UIColor *)v2;
}

- (BOOL)itemEnabled
{
  return self->_itemEnabled;
}

- (void)setItemEnabled:(BOOL)a3
{
  self->_itemEnabled = a3;
}

@end