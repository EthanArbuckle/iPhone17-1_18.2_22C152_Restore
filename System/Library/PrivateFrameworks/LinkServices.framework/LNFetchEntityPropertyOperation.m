@interface LNFetchEntityPropertyOperation
- (_TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7;
- (void)finishWithError:(id)a3;
- (void)start;
@end

@implementation LNFetchEntityPropertyOperation

- (void)start
{
  v2 = self;
  sub_1A4450444();
}

- (void)finishWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1A44506C8((uint64_t)a3);
}

- (_TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7
{
  uint64_t v9 = sub_1A44F92B0();
  MEMORY[0x1F4188790](v9 - 8);
  v10 = _Block_copy(a7);
  sub_1A44F9290();
  *(void *)(swift_allocObject() + 16) = v10;
  swift_unknownObjectRetain();
  id v11 = a6;
  sub_1A44507E8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation_entity));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation_completionHandler);
  sub_1A4444218(v3);
}

@end