@interface AccelerometerDelegate
- (_TtC11MobilePhoneP33_4C1B1F2DAAC46834EA132CE9DCD273E421AccelerometerDelegate)init;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)dealloc;
@end

@implementation AccelerometerDelegate

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobilePhoneP33_4C1B1F2DAAC46834EA132CE9DCD273E421AccelerometerDelegate_accelerometer);
  v3 = self;
  [v2 setDelegate:0];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AccelerometerDelegate();
  [(AccelerometerDelegate *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobilePhoneP33_4C1B1F2DAAC46834EA132CE9DCD273E421AccelerometerDelegate_accelerometer);
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  specialized AccelerometerDelegate.accelerometer(_:didChange:)(a4);
}

- (_TtC11MobilePhoneP33_4C1B1F2DAAC46834EA132CE9DCD273E421AccelerometerDelegate)init
{
  result = (_TtC11MobilePhoneP33_4C1B1F2DAAC46834EA132CE9DCD273E421AccelerometerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end