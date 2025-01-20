@interface LocalStickerEffectEditorViewControllerConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUUID)stickerIdentifier;
- (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration)init;
- (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setStickerIdentifier:(id)a3;
@end

@implementation LocalStickerEffectEditorViewControllerConfiguration

- (NSUUID)stickerIdentifier
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self
     + OBJC_IVAR____TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration_stickerIdentifier;
  swift_beginAccess();
  sub_245203C74((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_268ECEC40);
  uint64_t v7 = sub_2453FCCB8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_2453FCC78();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSUUID *)v9;
}

- (void)setStickerIdentifier:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2453FCC98();
    uint64_t v8 = sub_2453FCCB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_2453FCCB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self
      + OBJC_IVAR____TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration_stickerIdentifier;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_2452285BC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (char *)self
     + OBJC_IVAR____TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration_stickerIdentifier;
  uint64_t v5 = sub_2453FCCB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(LocalStickerEffectEditorViewControllerConfiguration *)&v7 init];
}

- (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration *)sub_245345D18(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_2453411D4(a3);
  swift_unknownObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_2453413CC((uint64_t)v8);

  sub_245203CD8((uint64_t)v8, &qword_268ECEFA0);
  return v6 & 1;
}

- (void).cxx_destruct
{
}

@end