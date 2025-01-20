@interface OctagonSelfPeerKeys
- (BOOL)matchesPeer:(id)a3;
- (NSString)description;
- (NSString)peerID;
- (_SFECKeyPair)encryptionKey;
- (_SFECKeyPair)signingKey;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (_TtC18TrustedPeersHelper19OctagonSelfPeerKeys)init;
- (void)setEncryptionKey:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPublicEncryptionKey:(id)a3;
- (void)setPublicSigningKey:(id)a3;
- (void)setSigningKey:(id)a3;
@end

@implementation OctagonSelfPeerKeys

- (_SFECKeyPair)encryptionKey
{
  return (_SFECKeyPair *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_encryptionKey));
}

- (void)setEncryptionKey:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_encryptionKey);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_encryptionKey) = (Class)a3;
  id v3 = a3;
}

- (_SFECKeyPair)signingKey
{
  return (_SFECKeyPair *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_signingKey));
}

- (void)setSigningKey:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_signingKey);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_signingKey) = (Class)a3;
  id v3 = a3;
}

- (NSString)peerID
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_100222260();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setPeerID:(id)a3
{
  uint64_t v4 = sub_100222270();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_peerID);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicEncryptionKey));
}

- (void)setPublicEncryptionKey:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicEncryptionKey);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicEncryptionKey) = (Class)a3;
  id v3 = a3;
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicSigningKey));
}

- (void)setPublicSigningKey:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicSigningKey);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicSigningKey) = (Class)a3;
  id v3 = a3;
}

- (BOOL)matchesPeer:(id)a3
{
  return 0;
}

- (NSString)description
{
  NSString v2 = self;
  sub_100043E98();

  NSString v3 = sub_100222260();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC18TrustedPeersHelper19OctagonSelfPeerKeys)init
{
  result = (_TtC18TrustedPeersHelper19OctagonSelfPeerKeys *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicEncryptionKey));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_publicSigningKey));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_encryptionVerificationKey));
  NSString v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18TrustedPeersHelper19OctagonSelfPeerKeys_signingVerificationKey);
}

@end