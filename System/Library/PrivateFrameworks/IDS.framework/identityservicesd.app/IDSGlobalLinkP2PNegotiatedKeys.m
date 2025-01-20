@interface IDSGlobalLinkP2PNegotiatedKeys
- (BOOL)isServer;
- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)avc;
- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)ids;
- (NSString)description;
- (_TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys)init;
@end

@implementation IDSGlobalLinkP2PNegotiatedKeys

- (BOOL)isServer
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys_isServer);
}

- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)avc
{
  v2 = (void *)swift_unknownObjectRetain();

  return (IDSGlobalLinkP2PNegotiatedKeySetProtocol *)v2;
}

- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)ids
{
  v2 = (void *)swift_unknownObjectRetain();

  return (IDSGlobalLinkP2PNegotiatedKeySetProtocol *)v2;
}

- (NSString)description
{
  return (NSString *)sub_1004552E4(self, (uint64_t)a2, (void (*)(void))sub_100455354);
}

- (_TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys)init
{
  result = (_TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end