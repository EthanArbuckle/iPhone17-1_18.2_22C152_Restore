@interface UpdatesContext
- (BOOL)includeMetrics;
- (BOOL)isBackgroundRequest;
- (BOOL)isVPPLookup;
- (BOOL)shouldPerformUpdates;
- (BOOL)userInitiated;
- (NSNumber)bridgedTargetedItemID;
- (NSString)humanReadableReason;
- (XPCRequestToken)requestToken;
- (_TtC9appstored14UpdatesContext)init;
- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3;
- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3 requestToken:(id)a4 logKey:(id)a5 callbackHandler:(id)a6 includeMetrics:(BOOL)a7 isVPPLookup:(BOOL)a8 userInitiated:(BOOL)a9 targetedItemID:(id)a10;
- (_TtC9appstored6LogKey)logKey;
- (id)callbackHandler;
- (int64_t)reason;
@end

@implementation UpdatesContext

- (void).cxx_destruct
{
  sub_100018DD4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_callbackHandler));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_requestToken);
}

- (BOOL)includeMetrics
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_includeMetrics);
}

- (BOOL)isVPPLookup
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_isVPPLookup);
}

- (_TtC9appstored6LogKey)logKey
{
  return (_TtC9appstored6LogKey *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC9appstored14UpdatesContext_logKey));
}

- (int64_t)reason
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
}

- (XPCRequestToken)requestToken
{
  return (XPCRequestToken *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC9appstored14UpdatesContext_requestToken));
}

- (BOOL)userInitiated
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_userInitiated);
}

- (BOOL)isBackgroundRequest
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
  if (v2 >= 9)
  {
    type metadata accessor for LoadSoftwareUpdatesReason(0);
    v5 = self;
    LOBYTE(v3) = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  else
  {
    return (0xD6u >> v2) & 1;
  }
  return v3;
}

- (BOOL)shouldPerformUpdates
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
  if (v2 >= 9)
  {
    type metadata accessor for LoadSoftwareUpdatesReason(0);
    v5 = self;
    LOBYTE(v3) = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  else
  {
    return (0x42u >> v2) & 1;
  }
  return v3;
}

- (NSNumber)bridgedTargetedItemID
{
  if (self->callbackHandler[OBJC_IVAR____TtC9appstored14UpdatesContext_targetedItemID]) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_allocWithZone((Class)NSNumber) initWithLongLong:*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_targetedItemID)];
  }
  return (NSNumber *)v2;
}

- (_TtC9appstored14UpdatesContext)init
{
  id v2 = objc_allocWithZone((Class)swift_getObjectType());
  int v3 = (_TtC9appstored14UpdatesContext *)sub_1000B9258(0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3
{
  id v4 = objc_allocWithZone((Class)swift_getObjectType());
  v5 = (_TtC9appstored14UpdatesContext *)sub_1000B9258(a3, 0, 0, 0, 0, 0, 0, 0, 0, 1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3 requestToken:(id)a4 logKey:(id)a5 callbackHandler:(id)a6 includeMetrics:(BOOL)a7 isVPPLookup:(BOOL)a8 userInitiated:(BOOL)a9 targetedItemID:(id)a10
{
  v13 = _Block_copy(a6);
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    v13 = sub_100018DA4;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = a4;
  id v16 = a5;
  id v17 = a10;
  v18 = (_TtC9appstored14UpdatesContext *)sub_1000B93D8(a3, a4, a5, (uint64_t)v13, v14, a7, a8, a9, a10);

  sub_100018DD4((uint64_t)v13);
  return v18;
}

- (id)callbackHandler
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_callbackHandler);
  if (v2)
  {
    uint64_t v3 = *(void *)&self->callbackHandler[OBJC_IVAR____TtC9appstored14UpdatesContext_callbackHandler];
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    v6[4] = sub_1000B9250;
    v6[5] = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1000B9028;
    v6[3] = &unk_100515938;
    id v2 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  return v2;
}

- (NSString)humanReadableReason
{
  id v2 = self;
  sub_1000B8940();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end