@interface DOCEncryptedVolumeNode
- (_TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode)initWithCoder:(id)a3;
- (_TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode)initWithSubject:(id)a3;
@end

@implementation DOCEncryptedVolumeNode

- (_TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode)initWithCoder:(id)a3
{
  return (_TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode *)sub_22BDFABA4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode_needsAuthNode, (void (*)(void))type metadata accessor for DOCEncryptedVolumeNode);
}

- (_TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode)initWithSubject:(id)a3
{
  id v3 = a3;
  result = (_TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode_domain));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables22DOCEncryptedVolumeNode_needsAuthNode);
}

@end