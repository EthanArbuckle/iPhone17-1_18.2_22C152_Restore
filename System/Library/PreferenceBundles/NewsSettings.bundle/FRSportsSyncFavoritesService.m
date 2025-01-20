@interface FRSportsSyncFavoritesService
- (FRSportsSyncFavoritesService)init;
- (void)fetchSyncSettingWithCompletionHandler:(id)a3;
- (void)updateSyncSettingWithIsEnabled:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation FRSportsSyncFavoritesService

- (FRSportsSyncFavoritesService)init
{
  uint64_t v3 = sub_C0D0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C0C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v7 = (objc_class *)type metadata accessor for SportsSyncFavoritesService();
  v9.receiver = self;
  v9.super_class = v7;
  return [(FRSportsSyncFavoritesService *)&v9 init];
}

- (void)fetchSyncSettingWithCompletionHandler:(id)a3
{
  sub_A5D4(&qword_14990);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_C100();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_149E8;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_149F0;
  v11[5] = v10;
  v12 = self;
  sub_AA38((uint64_t)v6, (uint64_t)&unk_149F8, (uint64_t)v11);
  swift_release();
}

- (void)updateSyncSettingWithIsEnabled:(BOOL)a3 completionHandler:(id)a4
{
  sub_A5D4(&qword_14990);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = v9;
  *(void *)(v10 + 32) = self;
  uint64_t v11 = sub_C100();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_149A0;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_149B0;
  v13[5] = v12;
  v14 = self;
  sub_AA38((uint64_t)v8, (uint64_t)&unk_149C0, (uint64_t)v13);
  swift_release();
}

@end