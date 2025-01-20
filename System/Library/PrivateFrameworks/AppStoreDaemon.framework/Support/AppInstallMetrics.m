@interface AppInstallMetrics
+ (_TtC9appstored17AppInstallMetrics)shared;
- (_TtC9appstored17AppInstallMetrics)init;
- (void)recordInstallWithBundleID:(NSString *)a3 appInstallType:(unsigned __int8)a4 token:(NSString *)a5 logKey:(_TtC9appstored6LogKey *)a6 completionHandler:(id)a7;
@end

@implementation AppInstallMetrics

+ (_TtC9appstored17AppInstallMetrics)shared
{
  if (qword_1005A3010 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B14C0;
  return (_TtC9appstored17AppInstallMetrics *)v2;
}

- (void)recordInstallWithBundleID:(NSString *)a3 appInstallType:(unsigned __int8)a4 token:(NSString *)a5 logKey:(_TtC9appstored6LogKey *)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(unsigned char *)(v17 + 24) = a4;
  *(void *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1005A4878;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1005A35A0;
  v20[5] = v19;
  v21 = a3;
  v22 = a5;
  v23 = a6;
  v24 = self;
  sub_1000DFAB0((uint64_t)v15, (uint64_t)&unk_1005A4930, (uint64_t)v20);
  swift_release();
}

- (_TtC9appstored17AppInstallMetrics)init
{
  return (_TtC9appstored17AppInstallMetrics *)sub_10006481C();
}

- (void).cxx_destruct
{
}

@end