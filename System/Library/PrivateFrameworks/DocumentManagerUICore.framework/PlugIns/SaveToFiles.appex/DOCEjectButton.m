@interface DOCEjectButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)frame;
- (_TtC11SaveToFiles14DOCEjectButton)initWithCoder:(id)a3;
- (_TtC11SaveToFiles14DOCEjectButton)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConfiguration;
@end

@implementation DOCEjectButton

- (_TtC11SaveToFiles14DOCEjectButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10026E590();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCEjectButton();
  [(DOCEjectButton *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for DOCEjectButton();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  [(DOCEjectButton *)&v19 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[DOCEjectButton setFrame:](&v18, "setFrame:", x, y, width, height);
  [(DOCEjectButton *)v9 frame];
  v21.origin.double x = v11;
  v21.origin.double y = v13;
  v21.size.double width = v15;
  v21.size.double height = v17;
  if (!CGRectEqualToRect(v20, v21)) {
    [(DOCEjectButton *)v9 setNeedsLayout];
  }
}

- (void)updateConfiguration
{
  double v2 = self;
  sub_10026D3F8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_10026D8AC(a3);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCEjectButton();
  id v2 = v3.receiver;
  [(DOCEjectButton *)&v3 didMoveToWindow];
  if (*((unsigned char *)v2 + OBJC_IVAR____TtC11SaveToFiles14DOCEjectButton_iconUpdateNeeded) == 1)
  {
    objc_msgSend(v2, "setNeedsUpdateConfiguration", v3.receiver, v3.super_class);
    [v2 updateConfiguration];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(DOCEjectButton *)v8 bounds];
  CGFloat v9 = v20.origin.x;
  CGFloat v10 = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double v13 = CGRectGetWidth(v20);
  v21.origin.CGFloat x = v9;
  v21.origin.CGFloat y = v10;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v21);
  if (v13 > v14) {
    double v14 = v13;
  }
  if (v14 < 45.0) {
    double v15 = 22.5;
  }
  else {
    double v15 = v14 * 0.5;
  }
  v22.origin.CGFloat x = v9;
  v22.origin.CGFloat y = v10;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v16 = CGRectGetMidX(v22) - v15;
  v23.origin.CGFloat x = v9;
  v23.origin.CGFloat y = v10;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  v24.origin.CGFloat y = CGRectGetMidY(v23) - v15;
  v24.size.CGFloat width = v15 + v15;
  v24.origin.CGFloat x = v16;
  v24.size.CGFloat height = v15 + v15;
  v26.origin.CGFloat x = v9;
  v26.origin.CGFloat y = v10;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v25 = CGRectUnion(v24, v26);
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  BOOL v17 = CGRectContainsPoint(v25, v19);

  return v17;
}

- (_TtC11SaveToFiles14DOCEjectButton)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC11SaveToFiles14DOCEjectButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC11SaveToFiles14DOCEjectButton_buttonSize;
  uint64_t v4 = sub_1004D2780();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC11SaveToFiles14DOCEjectButton_color);
}

@end