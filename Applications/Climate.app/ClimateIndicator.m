@interface ClimateIndicator
- (_TtC7Climate16ClimateIndicator)init;
- (void)layoutSubviews;
@end

@implementation ClimateIndicator

- (_TtC7Climate16ClimateIndicator)init
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Climate16ClimateIndicator_circularBackgroundView) = 0;
  v2 = (char *)self + OBJC_IVAR____TtC7Climate16ClimateIndicator_circleDiameter;
  *(void *)v2 = 0;
  v2[8] = 1;
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate16ClimateIndicator_isAutoMode) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate16ClimateIndicator_isIndicatorOn) = 0;

  result = (_TtC7Climate16ClimateIndicator *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100016798();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateIndicator_circularBackgroundView));
}

@end