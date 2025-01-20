@interface ListOfResultItemsView
- (_TtC5Heart21ListOfResultItemsView)initWithCoder:(id)a3;
- (_TtC5Heart21ListOfResultItemsView)initWithFrame:(CGRect)a3;
@end

@implementation ListOfResultItemsView

- (_TtC5Heart21ListOfResultItemsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart21ListOfResultItemsView____lazy_storage___stackView) = 0;
  id v4 = a3;

  result = (_TtC5Heart21ListOfResultItemsView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (_TtC5Heart21ListOfResultItemsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart21ListOfResultItemsView____lazy_storage___stackView));

  swift_bridgeObjectRelease();
}

@end