@interface CHSActivityService.ConnectionClient
- (_TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient)init;
- (void)activityDidUpdate:(id)a3 payloadID:(id)a4;
@end

@implementation CHSActivityService.ConnectionClient

- (void)activityDidUpdate:(id)a3 payloadID:(id)a4
{
  uint64_t v4 = sub_190D41978();
  uint64_t v6 = v5;
  uint64_t v7 = sub_190D41978();
  uint64_t v9 = v8;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient_activityPayloadUpdateHandler);
  v11 = self;
  if (v10)
  {
    sub_190CEF1D0((uint64_t)v10);
    v10(v4, v6, v7, v9);
    sub_190CDAA9C((uint64_t)v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient_activityPayloadUpdateHandler);
  uint64_t v4 = (objc_class *)_s16ConnectionClientCMa();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(CHSActivityService.ConnectionClient *)&v6 init];
}

- (void).cxx_destruct
{
  sub_190CDAA9C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE14ChronoServicesCSo18CHSActivityService16ConnectionClient_activityPayloadUpdateHandler));
}

@end