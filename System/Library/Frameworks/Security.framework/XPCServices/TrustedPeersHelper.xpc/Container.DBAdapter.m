@interface Container.DBAdapter
- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4;
- (id)allPeerIDs:(id *)a3;
- (id)allRegisteredPolicyVersions:(id *)a3;
- (id)peerWithID:(id)a3 error:(id *)a4;
- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4;
- (unint64_t)peerCount:(id *)a3;
- (unint64_t)voucherCount:(id *)a3;
@end

@implementation Container.DBAdapter

- (id)allPeerIDs:(id *)a3
{
  swift_retain();
  sub_10011A8A4();
  swift_release();
  v3.super.isa = sub_1002223B0().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (unint64_t)peerCount:(id *)a3
{
  return sub_10011DE44((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_10011B82C);
}

- (id)peerWithID:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_100222270();
  uint64_t v6 = v5;
  swift_retain();
  v7 = sub_10011BC34(v4, v6);
  swift_release();
  swift_bridgeObjectRelease();

  return v7;
}

- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4
{
  return sub_10011D960((int)self, (int)a2, a3, (uint64_t)a4, (uint64_t)&unk_100285598, (uint64_t)sub_1001B3FBC, sub_10011BFB0);
}

- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4
{
  return sub_10011D960((int)self, (int)a2, a3, (uint64_t)a4, (uint64_t)&unk_100285570, (uint64_t)sub_1001B8858, (void (*)(uint64_t, uint64_t))sub_10011D408);
}

- (unint64_t)voucherCount:(id *)a3
{
  return sub_10011DE44((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_10011DA3C);
}

- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4
{
  swift_retain();
  uint64_t v6 = (void *)sub_10011DE98(a3, a4);
  swift_release();

  return v6;
}

- (id)allRegisteredPolicyVersions:(id *)a3
{
  swift_retain();
  sub_10011E4E8();
  swift_release();
  sub_1000047D8(0, (unint64_t *)&qword_10029EDB0);
  sub_1001B1ED0((unint64_t *)&qword_10029EDE0, (unint64_t *)&qword_10029EDB0);
  v3.super.isa = sub_100222420().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

@end