@interface ReviewsHorizontalShelfDataSource.CardView
- (_TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView)initWithCoder:(id)a3;
- (_TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReviewsHorizontalShelfDataSource.CardView

- (_TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView_reviewCell) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView_editorsChoiceCell) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ReviewsHorizontalShelfDataSource.CardView();
  v7 = -[ReviewsHorizontalShelfDataSource.CardView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  -[ReviewsHorizontalShelfDataSource.CardView setLayoutMargins:](v7, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v7;
}

- (_TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView_reviewCell) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView_editorsChoiceCell) = 0;
  id v4 = a3;

  result = (_TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001E9CD4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView_reviewCell));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC20ProductPageExtension32ReviewsHorizontalShelfDataSource8CardView_editorsChoiceCell);
}

@end