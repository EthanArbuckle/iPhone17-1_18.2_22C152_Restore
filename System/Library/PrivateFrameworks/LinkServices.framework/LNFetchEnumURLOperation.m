@interface LNFetchEnumURLOperation
- (_TtC12LinkServicesP33_83709CDB751C9A1520D54649973F712123LNFetchEnumURLOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7;
- (void)finishWithError:(id)a3;
- (void)start;
@end

@implementation LNFetchEnumURLOperation

- (void)start
{
  v2 = self;
  sub_1A4449050();
}

- (void)finishWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1A44492F0((uint64_t)a3);
}

- (_TtC12LinkServicesP33_83709CDB751C9A1520D54649973F712123LNFetchEnumURLOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12LinkServicesP33_83709CDB751C9A1520D54649973F712123LNFetchEnumURLOperation_completionHandler);
  sub_1A4444218(v3);
}

@end