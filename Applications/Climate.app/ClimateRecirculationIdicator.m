@interface ClimateRecirculationIdicator
- (void)recirculationService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)recirculationService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateRecirculationIdicator

- (void).cxx_destruct
{
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_recirculation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_recirculationButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_autoModeGlyph);
}

- (void)recirculationService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1000304AC(v5);
}

- (void)recirculationService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1000307A8(v6, a4);
}

@end