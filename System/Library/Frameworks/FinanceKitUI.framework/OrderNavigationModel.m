@interface OrderNavigationModel
- (_TtC12FinanceKitUI20OrderNavigationModel)init;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
@end

@implementation OrderNavigationModel

- (_TtC12FinanceKitUI20OrderNavigationModel)init
{
  return (_TtC12FinanceKitUI20OrderNavigationModel *)sub_243D33E08();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI20OrderNavigationModel__path;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E20CA8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1E318);
  MEMORY[0x270FA5388](v12 - 8);
  v14 = &v26[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v15);
  v17 = &v26[-v16];
  id v18 = a3;
  swift_unknownObjectRetain();
  v19 = self;
  id v20 = a5;
  id v21 = a7;
  sub_243DFF0C0();
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_243DFC090();

    uint64_t v22 = sub_243DFC0A0();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_243DFC0A0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  if (v21)
  {
    sub_243DFC090();

    uint64_t v24 = sub_243DFC0A0();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v14, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = sub_243DFC0A0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v14, 1, 1, v25);
  }
  sub_243D36544((uint64_t)v26, (uint64_t)v17, a6);

  sub_243A56808((uint64_t)v14, &qword_268E1E318);
  sub_243A56808((uint64_t)v17, &qword_268E1E318);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

@end