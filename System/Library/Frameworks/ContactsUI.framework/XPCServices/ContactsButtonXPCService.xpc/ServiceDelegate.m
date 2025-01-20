@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC24ContactsButtonXPCService15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000047D4(v7);

  return v9 & 1;
}

- (_TtC24ContactsButtonXPCService15ServiceDelegate)init
{
  uint64_t v2 = OBJC_IVAR____TtC24ContactsButtonXPCService15ServiceDelegate_logger;
  uint64_t v3 = qword_10002DB58;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10001FBF8();
  uint64_t v6 = sub_100003F4C(v5, (uint64_t)qword_10002E740);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ServiceDelegate();
  return [(ServiceDelegate *)&v8 init];
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR____TtC24ContactsButtonXPCService15ServiceDelegate_logger;
  uint64_t v3 = sub_10001FBF8();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end