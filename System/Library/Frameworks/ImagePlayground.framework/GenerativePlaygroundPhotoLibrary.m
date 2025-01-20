@interface GenerativePlaygroundPhotoLibrary
- (_TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary)init;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation GenerativePlaygroundPhotoLibrary

- (_TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary)init
{
  result = (_TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary_photoLibrary));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary_writeQueue));

  swift_release();
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_2443BA950();
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  uint64_t v12 = sub_2443BA940();
  v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v10;
  v13[5] = v11;
  sub_243EACE30((uint64_t)v7, (uint64_t)&unk_268E448C8, (uint64_t)v13);

  swift_release();
}

@end