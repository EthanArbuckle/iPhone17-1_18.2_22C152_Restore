@interface CMVO2MaxRetrocomputeStatePublisher
- (_TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher)init;
- (void)dealloc;
- (void)vo2MaxRetrocomputeManager:(id)a3 didUpdateState:(id)a4;
- (void)vo2MaxRetrocomputeManager:(id)a3 updateFailedWithError:(id)a4;
@end

@implementation CMVO2MaxRetrocomputeStatePublisher

- (void)vo2MaxRetrocomputeManager:(id)a3 didUpdateState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_240A2F43C(v7);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher_manager);
  v5 = self;
  objc_msgSend(v4, sel_stopRetrocomputeStatusUpdates);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(CMVO2MaxRetrocomputeStatePublisher *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher_manager));

  swift_release();
}

- (void)vo2MaxRetrocomputeManager:(id)a3 updateFailedWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_240B380B0(v8);
}

- (_TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher)init
{
  result = (_TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end