@interface PPSBundleService
- (_TtC34PosterPlatformSupportBundleService16PPSBundleService)init;
- (void)hostConfigurationForBundleAtURL:(NSURL *)a3 forRole:(NSString *)a4 completion:(id)a5;
@end

@implementation PPSBundleService

- (void)hostConfigurationForBundleAtURL:(NSURL *)a3 forRole:(NSString *)a4 completion:(id)a5
{
  sub_10000470C(&qword_10000CB30);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_100006C70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10000CB40;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10000CB50;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_100004CC0((uint64_t)v10, (uint64_t)&unk_10000CB60, (uint64_t)v15);
  swift_release();
}

- (_TtC34PosterPlatformSupportBundleService16PPSBundleService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PPSBundleService();
  return [(PPSBundleService *)&v3 init];
}

@end