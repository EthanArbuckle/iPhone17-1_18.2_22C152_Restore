@interface DigitalPresentmentSession
- (_TtC7CoreIDV25DigitalPresentmentSession)init;
- (void)cancelRequest;
- (void)checkCanRequestDocument:(DIIdentityDocumentDescriptor *)a3 completionHandler:(id)a4;
- (void)requestDocument:(DIIdentityRequest *)a3 completionHandler:(id)a4;
@end

@implementation DigitalPresentmentSession

- (_TtC7CoreIDV25DigitalPresentmentSession)init
{
  return (_TtC7CoreIDV25DigitalPresentmentSession *)DigitalPresentmentSession.init()();
}

- (void)checkCanRequestDocument:(DIIdentityDocumentDescriptor *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782E4B0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2148A1D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26782E518;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26782E520;
  v14[5] = v13;
  swift_unknownObjectRetain();
  swift_retain();
  sub_2148610D8((uint64_t)v9, (uint64_t)&unk_26782E528, (uint64_t)v14);
  swift_release();
}

- (void)requestDocument:(DIIdentityRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782E4B0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2148A1D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26782E4F8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26782E500;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2148610D8((uint64_t)v9, (uint64_t)&unk_26782E508, (uint64_t)v14);
  swift_release();
}

- (void)cancelRequest
{
  swift_retain();
  sub_21484CA44();
  swift_release();
}

@end