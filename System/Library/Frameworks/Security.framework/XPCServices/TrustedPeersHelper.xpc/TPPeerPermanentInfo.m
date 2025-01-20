@interface TPPeerPermanentInfo
- (BOOL)matchesPeer:(id)a3;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
@end

@implementation TPPeerPermanentInfo

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)sub_10004406C(self, (uint64_t)a2, (SEL *)&selRef_encryptionPubKey);
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)sub_10004406C(self, (uint64_t)a2, (SEL *)&selRef_signingPubKey);
}

- (BOOL)matchesPeer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = [(TPPeerPermanentInfo *)v5 peerID];
  uint64_t v7 = sub_100222270();
  uint64_t v9 = v8;

  id v10 = [a3 peerID];
  uint64_t v11 = sub_100222270();
  uint64_t v13 = v12;

  if (v7 == v11 && v9 == v13) {
    char v15 = 1;
  }
  else {
    char v15 = sub_100222A30();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v15 & 1;
}

@end