@interface ClimateCompressorIndicator
- (void)cabinService:(id)a3 didUpdateCompressorOn:(BOOL)a4;
@end

@implementation ClimateCompressorIndicator

- (void).cxx_destruct
{
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate26ClimateCompressorIndicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateCompressorIndicator_cabin));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate26ClimateCompressorIndicator_compressorButton);
}

- (void)cabinService:(id)a3 didUpdateCompressorOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100050CA8(v5);
}

@end