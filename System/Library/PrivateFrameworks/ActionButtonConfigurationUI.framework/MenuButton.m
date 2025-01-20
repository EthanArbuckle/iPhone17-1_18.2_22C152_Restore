@interface MenuButton
- (_TtC27ActionButtonConfigurationUI10MenuButton)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI10MenuButton)initWithFrame:(CGRect)a3;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
@end

@implementation MenuButton

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = sub_2473EAB28((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (_TtC27ActionButtonConfigurationUI10MenuButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MenuButton();
  return -[MenuButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27ActionButtonConfigurationUI10MenuButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MenuButton();
  return [(MenuButton *)&v5 initWithCoder:a3];
}

@end