@interface HPSCaseEngravingView
+ (void)getEngravedCaseImage:(NSString *)a3 productID:(unsigned int)a4 completionHandler:(id)a5;
- (_TtC16HeadphoneConfigs20HPSCaseEngravingView)init;
@end

@implementation HPSCaseEngravingView

+ (void)getEngravedCaseImage:(NSString *)a3 productID:(unsigned int)a4 completionHandler:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D5A0);
  MEMORY[0x1F4188790]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(_DWORD *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = a1;
  uint64_t v13 = sub_1E4CBF330();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE8D5B0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EAE8D5C0;
  v15[5] = v14;
  v16 = a3;
  sub_1E4C7924C((uint64_t)v10, (uint64_t)&unk_1EAE8D5D0, (uint64_t)v15);
  swift_release();
}

- (_TtC16HeadphoneConfigs20HPSCaseEngravingView)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HPSCaseEngravingView();
  return [(HPSCaseEngravingView *)&v3 init];
}

@end