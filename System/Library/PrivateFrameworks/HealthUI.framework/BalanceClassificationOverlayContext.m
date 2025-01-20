@interface BalanceClassificationOverlayContext
@end

@implementation BalanceClassificationOverlayContext

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI35BalanceClassificationOverlayContext_selectedClassification;
  uint64_t v4 = sub_1E0ECBEA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8HealthUI35BalanceClassificationOverlayContext_dataSourceDelegate);
}

@end