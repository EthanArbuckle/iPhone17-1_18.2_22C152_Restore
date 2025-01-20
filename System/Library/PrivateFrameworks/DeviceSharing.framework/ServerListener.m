@interface ServerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener)init;
@end

@implementation ServerListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_delegate;
  if (MEMORY[0x253310490]((char *)self + OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_delegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v10 = *(uint64_t (**)(id, id, uint64_t, uint64_t))(v8 + 8);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    char v14 = v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

- (_TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener)init
{
  result = (_TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24CC8C3A8((uint64_t)self + OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_xpcListener);
}

@end