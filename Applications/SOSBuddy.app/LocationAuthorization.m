@interface LocationAuthorization
- (_TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationAuthorization

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001CB45C(v4);
}

- (_TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization)init
{
  result = (_TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_locationManagerQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_locationManager));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_handler);

  sub_10005BEA0(v3);
}

@end