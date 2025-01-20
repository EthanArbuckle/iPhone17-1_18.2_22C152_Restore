@interface LNExportTransientEntitiesOperation
- (_TtC12LinkServicesP33_D8B6462C04E82DA0D5A4ABC704B0DC8934LNExportTransientEntitiesOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7;
- (void)finishWithError:(id)a3;
- (void)start;
@end

@implementation LNExportTransientEntitiesOperation

- (void)start
{
  v2 = self;
  sub_1A4443C74();
}

- (void)finishWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1A4443F0C((uint64_t)a3);
}

- (_TtC12LinkServicesP33_D8B6462C04E82DA0D5A4ABC704B0DC8934LNExportTransientEntitiesOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7
{
  uint64_t v9 = sub_1A44F92B0();
  MEMORY[0x1F4188790](v9 - 8);
  v10 = _Block_copy(a7);
  sub_1A44F9290();
  *(void *)(swift_allocObject() + 16) = v10;
  swift_unknownObjectRetain();
  id v11 = a6;
  sub_1A444402C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12LinkServicesP33_D8B6462C04E82DA0D5A4ABC704B0DC8934LNExportTransientEntitiesOperation_exportConfiguration));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12LinkServicesP33_D8B6462C04E82DA0D5A4ABC704B0DC8934LNExportTransientEntitiesOperation_completionHandler);
  sub_1A4444218(v3);
}

@end