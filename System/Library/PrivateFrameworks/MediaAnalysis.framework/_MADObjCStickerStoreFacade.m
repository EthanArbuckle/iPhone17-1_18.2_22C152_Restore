@interface _MADObjCStickerStoreFacade
- (BOOL)addAnimatedRepresentationWithIdentifiers:(id)a3 data:(id)a4 uti:(id)a5 size:(CGSize)a6 isPreferred:(BOOL)a7 error:(id *)a8;
- (_MADObjCStickerStoreFacade)init;
@end

@implementation _MADObjCStickerStoreFacade

- (_MADObjCStickerStoreFacade)init
{
  uint64_t v3 = sub_1BC2641B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](*(void **)(v4 + 64), v3, v5, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1BC264188();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v8, *MEMORY[0x1E4FA8018], v3);
  uint64_t v10 = sub_1BC2641C8();
  swift_allocObject();
  uint64_t v11 = sub_1BC2641A8();
  uint64_t v12 = MEMORY[0x1E4FA8020];
  v13 = (uint64_t *)((char *)v9 + OBJC_IVAR____MADObjCStickerStoreFacade_store);
  v13[3] = v10;
  v13[4] = v12;
  uint64_t *v13 = v11;

  v14 = (objc_class *)type metadata accessor for _MADObjCStickerStoreFacade();
  v16.receiver = v9;
  v16.super_class = v14;
  return [(_MADObjCStickerStoreFacade *)&v16 init];
}

- (BOOL)addAnimatedRepresentationWithIdentifiers:(id)a3 data:(id)a4 uti:(id)a5 size:(CGSize)a6 isPreferred:(BOOL)a7 error:(id *)a8
{
  v25[1] = a8;
  BOOL v8 = a7;
  uint64_t v26 = sub_1BC264168();
  uint64_t v12 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](*(void **)(v12 + 64), v26, v13, v14);
  objc_super v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2640F8();
  uint64_t v17 = sub_1BC264308();
  id v18 = a4;
  id v19 = a5;
  v20 = self;
  uint64_t v21 = sub_1BC2640D8();
  unint64_t v23 = v22;

  sub_1BC264158();
  sub_1BC21434C(v17, v21, v23, (uint64_t)v16, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v26);

  sub_1BC214F70(v21, v23);
  swift_bridgeObjectRelease();
  return 1;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____MADObjCStickerStoreFacade_store);
  uint64_t v3 = (char *)self + OBJC_IVAR____MADObjCStickerStoreFacade_logger;
  uint64_t v4 = sub_1BC264198();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end