@interface ClimateSyncIndicator
- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateSyncIndicator

- (void).cxx_destruct
{
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimateSyncIndicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimateSyncIndicator_sync));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate20ClimateSyncIndicator_syncButton);
}

- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1000801CC(v5);
}

@end