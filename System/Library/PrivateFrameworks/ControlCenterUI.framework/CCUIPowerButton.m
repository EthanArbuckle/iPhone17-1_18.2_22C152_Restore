@interface CCUIPowerButton
- (BOOL)isSelected;
- (CCUIPowerButton)init;
- (CCUIPowerButton)initWithCoder:(id)a3;
- (CCUIPowerButton)initWithFrame:(CGRect)a3;
- (CCUIPowerButton)initWithFrame:(CGRect)a3 luminanceMap:(id)a4;
- (void)setSelected:(BOOL)a3;
@end

@implementation CCUIPowerButton

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PowerButton();
  return [(CCUIPowerButton *)&v3 isSelected];
}

- (CCUIPowerButton)init
{
  return -[CCUIPowerButton initWithFrame:luminanceMap:](self, sel_initWithFrame_luminanceMap_, 0, 0.0, 0.0, 0.0, 0.0);
}

- (CCUIPowerButton)initWithFrame:(CGRect)a3 luminanceMap:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PowerButton();
  return -[CSProminentButtonControl initWithFrame:luminanceMap:](&v10, sel_initWithFrame_luminanceMap_, a4, x, y, width, height);
}

- (CCUIPowerButton)initWithCoder:(id)a3
{
  result = (CCUIPowerButton *)sub_1D7BB78A8();
  __break(1u);
  return result;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for PowerButton();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(CCUIPowerButton *)&v9 isSelected];
  v8.receiver = v6;
  v8.super_class = v5;
  [(CSProminentButtonControl *)&v8 setSelected:v3];
  if (v7 != [(CCUIPowerButton *)v6 isSelected]) {
    [(CCUIPowerButton *)v6 setSelected:0];
  }
}

- (CCUIPowerButton)initWithFrame:(CGRect)a3
{
  result = (CCUIPowerButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end