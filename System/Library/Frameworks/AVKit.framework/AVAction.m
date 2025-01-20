@interface AVAction
+ (id)actionWithHandler:(id)a3;
+ (id)actionWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 handler:(id)a6;
- (UIColor)tintColor;
- (UIMenu)contextMenu;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localHandler;
- (void)setContextMenu:(id)a3;
- (void)setLocalHandler:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation AVAction

+ (id)actionWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 handler:(id)a6
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___AVAction;
  id v9 = a6;
  v10 = objc_msgSendSuper2(&v12, sel_actionWithTitle_image_identifier_handler_, a3, a4, a5, v9);
  objc_msgSend(v10, "setLocalHandler:", v9, v12.receiver, v12.super_class);

  return v10;
}

+ (id)actionWithHandler:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVAction;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v6, sel_actionWithHandler_, v3);
  objc_msgSend(v4, "setLocalHandler:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_localHandler, 0);
  objc_storeStrong((id *)&self->_contextMenu, 0);

  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (void)setLocalHandler:(id)a3
{
}

- (id)localHandler
{
  return self->_localHandler;
}

- (void)setContextMenu:(id)a3
{
}

- (UIMenu)contextMenu
{
  return self->_contextMenu;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  v5 = [(UIMenuElement *)self title];
  objc_super v6 = [(UIMenuElement *)self image];
  v7 = [(AVAction *)self identifier];
  v8 = [(AVAction *)self localHandler];
  id v9 = [v4 actionWithTitle:v5 image:v6 identifier:v7 handler:v8];

  v10 = [(AVAction *)self contextMenu];
  [v9 setContextMenu:v10];

  objc_msgSend(v9, "setAttributes:", -[AVAction attributes](self, "attributes"));
  v11 = [(AVAction *)self discoverabilityTitle];
  [v9 setDiscoverabilityTitle:v11];

  objc_msgSend(v9, "setState:", -[AVAction state](self, "state"));
  objc_super v12 = [(AVAction *)self tintColor];
  [v9 setTintColor:v12];

  v13 = [(AVAction *)self accessibilityHint];
  [v9 setAccessibilityHint:v13];

  v14 = [(AVAction *)self accessibilityLabel];
  [v9 setAccessibilityLabel:v14];

  v15 = [(UIMenuElement *)self accessibilityIdentifier];
  [v9 setAccessibilityIdentifier:v15];

  return v9;
}

@end