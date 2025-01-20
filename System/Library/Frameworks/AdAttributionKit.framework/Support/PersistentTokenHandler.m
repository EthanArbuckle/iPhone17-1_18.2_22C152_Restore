@interface PersistentTokenHandler
- (_TtC20AttributionKitDaemon22PersistentTokenHandler)init;
@end

@implementation PersistentTokenHandler

- (_TtC20AttributionKitDaemon22PersistentTokenHandler)init
{
  result = (_TtC20AttributionKitDaemon22PersistentTokenHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon22PersistentTokenHandler_utClient;
  uint64_t v4 = type metadata accessor for SKANUTClient();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC20AttributionKitDaemon22PersistentTokenHandler_privateInput);
  unint64_t v6 = *(void *)&self->timestamp[OBJC_IVAR____TtC20AttributionKitDaemon22PersistentTokenHandler_privateInput];

  sub_100020930(v5, v6);
}

@end