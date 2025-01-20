@interface WKMarketplaceKit
+ (void)requestAppInstallationWithTopOrigin:(id)a3 url:(id)a4 completionHandler:(id)a5;
- (WKMarketplaceKit)init;
@end

@implementation WKMarketplaceKit

+ (void)requestAppInstallationWithTopOrigin:(id)a3 url:(id)a4 completionHandler:(id)a5
{
  id v38 = a4;
  uint64_t ObjCClassMetadata = (uint64_t)a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v8;
  uint64_t v9 = sub_2464262C0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v37 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  v15 = (char *)&v36 - v14;
  v36 = (char *)&v36 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v18 = (char *)&v36 - v17;
  MEMORY[0x270FA5388](v16);
  v20 = (char *)&v36 - v19;
  v21 = _Block_copy(a5);
  sub_2464262B0();
  v40 = v18;
  sub_2464262B0();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v21;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v23 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v8, 1, 1, v23);
  v24 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v24(v15, v18, v9);
  v24((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v9);
  sub_2464267E0();
  swift_retain();
  uint64_t v25 = sub_2464267D0();
  uint64_t v26 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v27 = (v26 + 32) & ~v26;
  uint64_t v28 = (v11 + v26 + v27) & ~v26;
  unint64_t v29 = (v11 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = MEMORY[0x263F8F500];
  *(void *)(v30 + 16) = v25;
  *(void *)(v30 + 24) = v31;
  uint64_t v32 = v30 + v27;
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
  v33(v32, v36, v9);
  v33(v30 + v28, v37, v9);
  *(void *)(v30 + v29) = ObjCClassMetadata;
  v34 = (void (**)(uint64_t))(v30 + ((v29 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v34 = sub_2464090E8;
  v34[1] = (void (*)(uint64_t))v22;
  sub_246408A30((uint64_t)v39, (uint64_t)&unk_268F7AFF0, v30);
  swift_release();
  swift_release();
  v35 = *(void (**)(char *, uint64_t))(v10 + 8);
  v35(v40, v9);
  v35(v20, v9);
}

- (WKMarketplaceKit)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(WKMarketplaceKit *)&v3 init];
}

@end