@interface CNPosterEditorViewConfiguration
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)init;
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithImageData:(id)a3 displayName:(id)a4;
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithImageData:(id)a3 displayName:(id)a4 contactIdentifier:(id)a5 isMe:(BOOL)a6;
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 displayName:(id)a4;
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 displayName:(id)a4 contactIdentifier:(id)a5 isMe:(BOOL)a6;
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 imageData:(id)a4 displayName:(id)a5;
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterConfiguration:(id)a3 displayName:(id)a4;
@end

@implementation CNPosterEditorViewConfiguration

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithImageData:(id)a3 displayName:(id)a4 contactIdentifier:(id)a5 isMe:(BOOL)a6
{
  return (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)sub_18B6E25D8(self, (uint64_t)a2, a3, a4, a5, a6, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData);
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 displayName:(id)a4 contactIdentifier:(id)a5 isMe:(BOOL)a6
{
  return (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)sub_18B6E25D8(self, (uint64_t)a2, a3, a4, a5, a6, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData);
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithImageData:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_18B983BD8();
  uint64_t v10 = v9;

  uint64_t v11 = sub_18B985E68();
  uint64_t v13 = v12;

  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData);
  uint64_t *v14 = v8;
  v14[1] = v10;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_displayName);
  uint64_t *v15 = v11;
  v15[1] = v13;
  v16 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_contactIdentifier);
  void *v16 = 0;
  v16[1] = 0xE000000000000000;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_isMe) = 1;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData) = xmmword_18B9C0860;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration) = 0;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for CNPosterEditorViewConfiguration();
  return [(CNPosterEditorViewConfiguration *)&v18 init];
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_18B983BD8();
  uint64_t v10 = v9;

  uint64_t v11 = sub_18B985E68();
  uint64_t v13 = v12;

  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData);
  uint64_t *v14 = v8;
  v14[1] = v10;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData) = xmmword_18B9C0860;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_displayName);
  uint64_t *v15 = v11;
  v15[1] = v13;
  v16 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_contactIdentifier);
  void *v16 = 0;
  v16[1] = 0xE000000000000000;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_isMe) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration) = 0;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for CNPosterEditorViewConfiguration();
  return [(CNPosterEditorViewConfiguration *)&v18 init];
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 imageData:(id)a4 displayName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_18B983BD8();
  uint64_t v13 = v12;

  uint64_t v14 = sub_18B983BD8();
  uint64_t v16 = v15;

  uint64_t v17 = sub_18B985E68();
  uint64_t v19 = v18;

  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData);
  uint64_t *v20 = v11;
  v20[1] = v13;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData);
  uint64_t *v21 = v14;
  v21[1] = v16;
  v22 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_displayName);
  uint64_t *v22 = v17;
  v22[1] = v19;
  v23 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_contactIdentifier);
  void *v23 = 0;
  v23[1] = 0xE000000000000000;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_isMe) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration) = 0;
  v25.receiver = self;
  v25.super_class = (Class)type metadata accessor for CNPosterEditorViewConfiguration();
  return [(CNPosterEditorViewConfiguration *)&v25 init];
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterConfiguration:(id)a3 displayName:(id)a4
{
  uint64_t v4 = sub_18B985E68();
  uint64_t v6 = v5;
  uint64_t v7 = swift_unknownObjectRetain();
  id v8 = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)sub_18B6E5D94(v7, v4, v6);
  swift_unknownObjectRelease();
  return v8;
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)init
{
  result = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B64B8F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData), *(void *)&self->imageData[OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18B64B8DC(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData), *(void *)&self->imageData[OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData]);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration);
}

@end