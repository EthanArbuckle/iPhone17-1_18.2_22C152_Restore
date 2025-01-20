@interface DOCTextFieldRoundedBackgroundView
- (BOOL)usePillShape;
- (CGRect)bounds;
- (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView)initWithCoder:(id)a3;
- (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setUsePillShape:(BOOL)a3;
@end

@implementation DOCTextFieldRoundedBackgroundView

- (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView_usePillShape) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView____lazy_storage___backgroundProvidingTextField) = 0;
  id v4 = a3;

  result = (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *)sub_22BE93778();
  __break(1u);
  return result;
}

- (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *)DOCTextFieldRoundedBackgroundView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)usePillShape
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView_usePillShape;
  swift_beginAccess();
  return *v2;
}

- (void)setUsePillShape:(BOOL)a3
{
  int v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView_usePillShape;
  swift_beginAccess();
  int v6 = *v5;
  unsigned char *v5 = v3;
  if (v6 != v3)
  {
    v7 = self;
    sub_22BE6C21C();
  }
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCTextFieldRoundedBackgroundView();
  [(DOCTextFieldRoundedBackgroundView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for DOCTextFieldRoundedBackgroundView();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  [(DOCTextFieldRoundedBackgroundView *)&v19 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[DOCTextFieldRoundedBackgroundView setBounds:](&v18, sel_setBounds_, x, y, width, height);
  [(DOCTextFieldRoundedBackgroundView *)v9 bounds];
  v21.origin.double x = v11;
  v21.origin.double y = v13;
  v21.size.double width = v15;
  v21.size.double height = v17;
  if (!CGRectEqualToRect(v20, v21)) {
    sub_22BE6C21C();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView____lazy_storage___backgroundProvidingTextField));
}

@end