@interface _MADObjCModelCatalogModel
- (_MADObjCModelCatalogModel)init;
- (id)getModelURL:(int64_t)a3;
@end

@implementation _MADObjCModelCatalogModel

- (_MADObjCModelCatalogModel)init
{
  sub_1BC264188();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _MADObjCModelCatalogModel();
  return [(_MADObjCModelCatalogModel *)&v4 init];
}

- (id)getModelURL:(int64_t)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB723578);
  MEMORY[0x1F4188790](*(void **)(*(void *)(v5 - 8) + 64), v5 - 8, v6, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_1BC2126C0(a3, (uint64_t)v9);

  uint64_t v11 = sub_1BC2640C8();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
  {
    v13 = (void *)sub_1BC2640B8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
  }
  return v13;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____MADObjCModelCatalogModel_logger;
  uint64_t v3 = sub_1BC264198();
  objc_super v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end