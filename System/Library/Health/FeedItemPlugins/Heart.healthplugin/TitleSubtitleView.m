@interface TitleSubtitleView
- (_TtC5Heart17TitleSubtitleView)initWithCoder:(id)a3;
- (_TtC5Heart17TitleSubtitleView)initWithFrame:(CGRect)a3;
@end

@implementation TitleSubtitleView

- (_TtC5Heart17TitleSubtitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___subtitleLabel) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC5Heart17TitleSubtitleView_item;
  v9 = (objc_class *)type metadata accessor for TitleSubtitleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[TitleSubtitleView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_240B16C5C();

  return v10;
}

- (_TtC5Heart17TitleSubtitleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___subtitleLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC5Heart17TitleSubtitleView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC5Heart17TitleSubtitleView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___subtitleLabel));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart17TitleSubtitleView_item;

  sub_240A478C0((uint64_t)v3);
}

@end