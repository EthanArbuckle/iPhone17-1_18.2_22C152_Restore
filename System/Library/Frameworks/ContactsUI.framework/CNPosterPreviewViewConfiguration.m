@interface CNPosterPreviewViewConfiguration
+ (id)configurationForExistingPosterConfiguration:(id)a3 displayName:(id)a4;
+ (id)configurationForNewPosterWithPhotoAssetID:(id)a3 backgroundColor:(id)a4 displayName:(id)a5 isEditingSNaP:(BOOL)a6;
+ (id)configurationForNewPosterWithPhotoAssetID:(id)a3 backgroundColor:(id)a4 displayName:(id)a5 isEditingSNaP:(BOOL)a6 monogramText:(id)a7;
+ (id)configurationForPosterArchiveData:(id)a3 displayName:(id)a4;
- (BOOL)hasExistingPoster;
- (_TtC10ContactsUI32CNPosterPreviewViewConfiguration)init;
@end

@implementation CNPosterPreviewViewConfiguration

- (BOOL)hasExistingPoster
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration)
      || *(void *)&self->posterArchiveData[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData] >> 60 != 15;
}

+ (id)configurationForNewPosterWithPhotoAssetID:(id)a3 backgroundColor:(id)a4 displayName:(id)a5 isEditingSNaP:(BOOL)a6
{
  if (a3)
  {
    uint64_t v8 = sub_18B985E68();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = sub_18B985E68();
  uint64_t v13 = v12;
  id v14 = a4;
  id v15 = sub_18B727AC0(v8, v10, a4, v11, v13, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v15;
}

+ (id)configurationForNewPosterWithPhotoAssetID:(id)a3 backgroundColor:(id)a4 displayName:(id)a5 isEditingSNaP:(BOOL)a6 monogramText:(id)a7
{
  if (a3)
  {
    uint64_t v10 = sub_18B985E68();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_18B985E68();
  uint64_t v15 = v14;
  if (a7)
  {
    uint64_t v16 = sub_18B985E68();
    a7 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v18 = a4;
  id v19 = sub_18B727BB4(v10, v12, a4, v13, v15, a6, v16, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

+ (id)configurationForExistingPosterConfiguration:(id)a3 displayName:(id)a4
{
  uint64_t v4 = sub_18B985E68();
  uint64_t v6 = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for CNPosterPreviewViewConfiguration());
  uint64_t v8 = swift_unknownObjectRetain();
  id v9 = sub_18B727938(v8, 0, 0xF000000000000000, v4, v6, 0, 0, 0, 0, 0, 0);
  swift_unknownObjectRelease();

  return v9;
}

+ (id)configurationForPosterArchiveData:(id)a3 displayName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sub_18B983BD8();
  unint64_t v9 = v8;

  uint64_t v10 = sub_18B985E68();
  uint64_t v12 = v11;

  id v13 = sub_18B727CE4(v7, v9, v10, v12);
  swift_bridgeObjectRelease();
  sub_18B64B8F0(v7, v9);

  return v13;
}

- (_TtC10ContactsUI32CNPosterPreviewViewConfiguration)init
{
  result = (_TtC10ContactsUI32CNPosterPreviewViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B64B8DC(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData), *(void *)&self->posterArchiveData[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor));

  swift_bridgeObjectRelease();
}

@end