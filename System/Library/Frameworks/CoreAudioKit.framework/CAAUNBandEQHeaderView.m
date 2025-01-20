@interface CAAUNBandEQHeaderView
- (_TtC12CoreAudioKit21CAAUNBandEQHeaderView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit21CAAUNBandEQHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation CAAUNBandEQHeaderView

- (_TtC12CoreAudioKit21CAAUNBandEQHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit21CAAUNBandEQHeaderView *)sub_21E5A9BA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit21CAAUNBandEQHeaderView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12CoreAudioKit21CAAUNBandEQHeaderView_typeControl);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  *(_OWORD *)((char *)v4 + 25) = 0u;
  id v5 = a3;

  result = (_TtC12CoreAudioKit21CAAUNBandEQHeaderView *)sub_21E5B6A78();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21E5ACA74(*(void **)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12CoreAudioKit21CAAUNBandEQHeaderView_typeControl));
}

@end