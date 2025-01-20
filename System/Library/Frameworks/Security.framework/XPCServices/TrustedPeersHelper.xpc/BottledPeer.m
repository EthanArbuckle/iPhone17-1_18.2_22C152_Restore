@interface BottledPeer
- (_TtC18TrustedPeersHelper11BottledPeer)init;
@end

@implementation BottledPeer

- (_TtC18TrustedPeersHelper11BottledPeer)init
{
  result = (_TtC18TrustedPeersHelper11BottledPeer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005A40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_secret), *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_secret]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_100005A40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey), *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey]);
  sub_100005A40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingPeerKey), *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingPeerKey]);
  sub_100005A40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningPublicKey), *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningPublicKey]);
  sub_100005A40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI), *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI]);
  sub_100005A40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peersigningSPKI), *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peersigningSPKI]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_contents);
  unint64_t v4 = *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_contents];

  sub_100005A40(v3, v4);
}

@end