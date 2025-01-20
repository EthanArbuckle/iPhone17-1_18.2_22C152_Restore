@interface NTKParmesanPhotoProcessor
+ (void)fetchAssetsInGalleryShuffle:(_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID *)a3 completion:(id)a4;
+ (void)fetchGalleryShufflesWithCompletion:(id)a3;
+ (void)fullSizeMaskDataForAssetIdentifier:(NSString *)a3 completion:(id)a4;
+ (void)processAssetsWithIdentifiers:(NSArray *)a3 dstDir:(NSString *)a4 completion:(id)a5;
+ (void)streamAssetsInAlbum:(id)a3 updateBlock:(id)a4;
+ (void)streamAssetsInAlbum:(id)a3 updateBlock:(id)a4 completionBlock:(id)a5;
+ (void)streamAssetsInShuffle:(id)a3 updateBlock:(id)a4;
+ (void)streamAssetsInShuffle:(id)a3 updateBlock:(id)a4 completionBlock:(id)a5;
- (NTKParmesanPhotoProcessor)init;
@end

@implementation NTKParmesanPhotoProcessor

+ (void)processAssetsWithIdentifiers:(NSArray *)a3 dstDir:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = sub_246B80250(&qword_2691D6FB0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_246C2CE28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2691D8528;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2691D8530;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_246C00520((uint64_t)v11, (uint64_t)&unk_2691D8538, (uint64_t)v16);
  swift_release();
}

+ (void)fullSizeMaskDataForAssetIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_246B80250(&qword_2691D6FB0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_246C2CE28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2691D8500;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2691D8508;
  v14[5] = v13;
  v15 = a3;
  sub_246C00520((uint64_t)v9, (uint64_t)&unk_2691D8510, (uint64_t)v14);
  swift_release();
}

+ (void)streamAssetsInAlbum:(id)a3 updateBlock:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_getObjCClassMetadata();
  id v7 = a3;
  sub_246BFC27C(v7, (void (*)(void, void *))sub_246C06FE8, v6, (void (*)(void))nullsub_2, 0);

  swift_release();
}

+ (void)streamAssetsInAlbum:(id)a3 updateBlock:(id)a4 completionBlock:(id)a5
{
  id v7 = _Block_copy(a4);
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  swift_getObjCClassMetadata();
  id v11 = a3;
  sub_246BFC27C(v11, (void (*)(void, void *))sub_246C06FE8, v9, (void (*)(void))sub_246C06FEC, (void (*)(void))v10);

  swift_release();

  swift_release();
}

+ (void)streamAssetsInShuffle:(id)a3 updateBlock:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_getObjCClassMetadata();
  id v7 = a3;
  sub_246BFD7D4(v7, (void (*)(void, void *))sub_246C06FE8, v6, (void (*)(void))nullsub_2, 0);

  swift_release();
}

+ (void)streamAssetsInShuffle:(id)a3 updateBlock:(id)a4 completionBlock:(id)a5
{
  id v7 = _Block_copy(a4);
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  swift_getObjCClassMetadata();
  id v11 = a3;
  sub_246BFD7D4(v11, (void (*)(void, void *))sub_246C063BC, v9, (void (*)(void))sub_246C063C4, (void (*)(void))v10);

  swift_release();

  swift_release();
}

+ (void)fetchGalleryShufflesWithCompletion:(id)a3
{
  uint64_t v5 = sub_246B80250(&qword_2691D6FB0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_246C2CE28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2691D84D8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2691D84E0;
  v12[5] = v11;
  sub_246C00520((uint64_t)v7, (uint64_t)&unk_2691D84E8, (uint64_t)v12);
  swift_release();
}

+ (void)fetchAssetsInGalleryShuffle:(_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID *)a3 completion:(id)a4
{
  uint64_t v7 = sub_246B80250(&qword_2691D6FB0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_246C2CE28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2691D8480;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2691D8490;
  v14[5] = v13;
  v15 = a3;
  sub_246C00520((uint64_t)v9, (uint64_t)&unk_2691D84A0, (uint64_t)v14);
  swift_release();
}

- (NTKParmesanPhotoProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParmesanPhotoProcessor();
  return [(NTKParmesanPhotoProcessor *)&v3 init];
}

@end