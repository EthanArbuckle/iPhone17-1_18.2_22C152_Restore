@interface HUTileCellToggleSizeButton
- (BOOL)isExpanding;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (HUTileCellToggleSizeButton)init;
- (HUTileCellToggleSizeButton)initWithCoder:(id)a3;
- (HUTileCellToggleSizeButton)initWithFrame:(CGRect)a3;
- (UIImageSymbolConfiguration)symbolConfiguration;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsExpanding:(BOOL)a3;
- (void)setSymbolConfiguration:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation HUTileCellToggleSizeButton

- (BOOL)isExpanding
{
  v2 = (BOOL *)self + OBJC_IVAR___HUTileCellToggleSizeButton_isExpanding;
  swift_beginAccess();
  return *v2;
}

- (void)setIsExpanding:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___HUTileCellToggleSizeButton_isExpanding;
  swift_beginAccess();
  BOOL *v5 = a3;
  v6 = self;
  sub_1BE3B4424();
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUTileCellToggleSizeButton_symbolConfiguration);
  swift_beginAccess();
  return (UIImageSymbolConfiguration *)*v2;
}

- (void)setSymbolConfiguration:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___HUTileCellToggleSizeButton_symbolConfiguration);
  swift_beginAccess();
  v6 = *v5;
  BOOL *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_1BE3B4424();
}

- (HUTileCellToggleSizeButton)init
{
  return (HUTileCellToggleSizeButton *)TileCellToggleSizeButton.init()();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(HUTileCellToggleSizeButton *)v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(HUTileCellToggleSizeButton *)v8 _touchInsets];
  v22.origin.CGFloat x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, v17, v18);
  v21.CGFloat x = x;
  v21.CGFloat y = y;
  BOOL v19 = CGRectContainsPoint(v22, v21);

  return v19;
}

- (HUTileCellToggleSizeButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BE3B4A90();
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_1BE3B3A08(a3, a4);
}

- (void)updateConstraints
{
  v2 = self;
  sub_1BE3B3E0C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BE3B40DC(a3);
}

- (HUTileCellToggleSizeButton)initWithFrame:(CGRect)a3
{
  result = (HUTileCellToggleSizeButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUTileCellToggleSizeButton_arrowImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HUTileCellToggleSizeButton_symbolConfiguration);
}

@end