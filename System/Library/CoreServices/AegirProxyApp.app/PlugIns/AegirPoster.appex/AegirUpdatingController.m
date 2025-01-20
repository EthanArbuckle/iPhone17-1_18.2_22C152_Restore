@interface AegirUpdatingController
- (_TtC11AegirPoster23AegirUpdatingController)init;
- (void)updateConfiguration:(id)a3 withSessionInfo:(id)a4 completion:(id)a5;
- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5;
@end

@implementation AegirUpdatingController

- (_TtC11AegirPoster23AegirUpdatingController)init
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AegirUpdatingController();
  v2 = [(AegirUpdatingController *)&v8 init];
  if (qword_1000442D8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100031B18();
  sub_100008F70(v3, (uint64_t)qword_100046CC0);
  v4 = sub_100031AF8();
  os_log_type_t v5 = sub_100031F18();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "AegirUpdatingController created", v6, 2u);
    swift_slowDealloc();
  }

  return v2;
}

- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_1000203F4(0, (unint64_t *)&unk_1000454A0);
  uint64_t v8 = sub_100031BC8();
  _Block_copy(v7);
  id v9 = a4;
  v10 = self;
  sub_10001EFA8(v8, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)updateConfiguration:(id)a3 withSessionInfo:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  uint64_t v9 = qword_1000442D8;
  id v10 = a3;
  id v11 = a4;
  v16 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100031B18();
  sub_100008F70(v12, (uint64_t)qword_100046CC0);
  v13 = sub_100031AF8();
  os_log_type_t v14 = sub_100031F18();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "updateConfiguration", v15, 2u);
    swift_slowDealloc();
  }

  (*((void (**)(void *, id, void))v8 + 2))(v8, v10, 0);
  _Block_release(v8);
  _Block_release(v8);
}

@end