@interface HeaderWithRightAlignedButton
- (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton)initWithReuseIdentifier:(id)a3;
- (void)buttonTapped:(id)a3;
- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation HeaderWithRightAlignedButton

- (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1C254F470();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton *)HeaderWithRightAlignedButton.init(reuseIdentifier:)(v3, v4);
}

- (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C242E32C();
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1C242E4D8(a4);
  swift_unknownObjectRelease();
}

- (void)buttonTapped:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_delegate;
  swift_beginAccess();
  if (MEMORY[0x1C875A200](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    id v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_button));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_delegate;
  sub_1C2201FD8((uint64_t)v3);
}

@end