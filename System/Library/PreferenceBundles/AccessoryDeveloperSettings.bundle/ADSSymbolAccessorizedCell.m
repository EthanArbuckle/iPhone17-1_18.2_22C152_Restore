@interface ADSSymbolAccessorizedCell
+ (id)leadingSymbolNamePropertyKey;
+ (id)trailingSymbolNamePropertyKey;
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ADSSymbolAccessorizedCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ADSSymbolAccessorizedCell;
  -[ADSSymbolAccessorizedCell refreshCellContentsWithSpecifier:](&v13, "refreshCellContentsWithSpecifier:");
  id v5 = objc_msgSend(a3, "propertyForKey:", +[ADSSymbolAccessorizedCell leadingSymbolNamePropertyKey](ADSSymbolAccessorizedCell, "leadingSymbolNamePropertyKey"));
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_alloc_init((Class)NSTextAttachment);
    objc_msgSend(v7, "setImage:", +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v6));
    id v8 = [+[NSAttributedString attributedStringWithAttachment:v7] mutableCopy];
    objc_msgSend(v8, "appendAttributedString:", objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", @" "));
    objc_msgSend(v8, "appendAttributedString:", objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", objc_msgSend(a3, "name")));
    objc_msgSend(-[ADSSymbolAccessorizedCell textLabel](self, "textLabel"), "setAttributedText:", v8);
  }
  else
  {
    objc_msgSend(-[ADSSymbolAccessorizedCell textLabel](self, "textLabel"), "setText:", objc_msgSend(a3, "name"));
  }
  objc_msgSend(-[ADSSymbolAccessorizedCell textLabel](self, "textLabel"), "setTextColor:", 0);
  id v9 = objc_msgSend(a3, "propertyForKey:", +[ADSSymbolAccessorizedCell trailingSymbolNamePropertyKey](ADSSymbolAccessorizedCell, "trailingSymbolNamePropertyKey"));
  if (v9)
  {
    v10 = [+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v9) imageWithTintColor:+[UIColor tableCellBlueTextColor]];
    id v11 = objc_alloc_init((Class)NSTextAttachment);
    [v11 setImage:v10];
    objc_msgSend(-[ADSSymbolAccessorizedCell detailTextLabel](self, "detailTextLabel"), "setAttributedText:", +[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v11));
  }
  else
  {
    id v12 = [(ADSSymbolAccessorizedCell *)self detailTextLabel];
    objc_msgSend(v12, "setText:", objc_msgSend(a3, "propertyForKey:", PSValueKey));
  }
  [(ADSSymbolAccessorizedCell *)self setNeedsLayout];
}

- (BOOL)canReload
{
  return 1;
}

+ (id)trailingSymbolNamePropertyKey
{
  return @"ADSSymbolAccessorizedCell.trailing";
}

+ (id)leadingSymbolNamePropertyKey
{
  return @"ADSSymbolAccessorizedCell.leading";
}

+ (int64_t)cellStyle
{
  return 1;
}

@end