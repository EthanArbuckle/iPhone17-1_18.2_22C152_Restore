@interface APBraveAndIconoclasticSafeAreaUsingButtonTray
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray)initWithCoder:(id)a3;
- (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation APBraveAndIconoclasticSafeAreaUsingButtonTray

- (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray)initWithFrame:(CGRect)a3
{
  return (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray *)sub_247E113D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_247E11FE0();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray();
  v2 = (char *)v13.receiver;
  [(APBraveAndIconoclasticSafeAreaUsingButtonTray *)&v13 layoutSubviews];
  objc_msgSend(v2, sel_layoutMargins, v13.receiver, v13.super_class);
  double v4 = v3;
  double v6 = v5;
  v7 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v7, sel_setFrame_, UIEdgeInsetsInsetRect(v8, v9, v10, v11, v4, v6));
  v12 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[APBraveAndIconoclasticSafeAreaUsingButtonTray systemLayoutSizeFittingSize:](self, sel_systemLayoutSizeFittingSize_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = self;
  [(APBraveAndIconoclasticSafeAreaUsingButtonTray *)v9 layoutMargins];
  double v11 = v10;
  double v13 = v12;
  UIEdgeInsetsInsetRect(0.0, 0.0, width, height, v10, v14);
  double v16 = v15;
  double v18 = v17;
  *(float *)&double v15 = a4;
  *(float *)&double v17 = a5;
  objc_msgSend(*(id *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack), sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v16, v18, v15, v17);
  double v20 = v19;

  double v23 = CGPointMake(width, v13 + v11 + v20, v21, v22);
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(APBraveAndIconoclasticSafeAreaUsingButtonTray *)v2 bounds];
  [(APBraveAndIconoclasticSafeAreaUsingButtonTray *)v2 sizeThatFits:CGPointMake(v3, 0.0, v3, v4)];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background);
}

@end