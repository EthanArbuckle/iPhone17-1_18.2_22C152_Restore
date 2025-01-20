@interface TopHeaderView
- (_TtC13FTMInternal_413TopHeaderView)initWithCoder:(id)a3;
- (_TtC13FTMInternal_413TopHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation TopHeaderView

- (_TtC13FTMInternal_413TopHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_413TopHeaderView *)sub_100176F90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_413TopHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_413TopHeaderView____lazy_storage___separatorView) = 0;
  id v4 = a3;

  result = (_TtC13FTMInternal_413TopHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_413TopHeaderView____lazy_storage___separatorView));
}

@end