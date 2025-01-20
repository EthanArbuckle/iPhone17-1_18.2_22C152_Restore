@interface UpdateController
- (_TtC20PridePosterExtension16UpdateController)init;
- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
@end

@implementation UpdateController

- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  sub_100004858(&qword_100038DE8);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_100024D28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100038DF8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100038E08;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_100004E0C((uint64_t)v10, (uint64_t)&unk_100038E18, (uint64_t)v15);
  swift_release();
}

- (_TtC20PridePosterExtension16UpdateController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpdateController();
  return [(UpdateController *)&v3 init];
}

@end