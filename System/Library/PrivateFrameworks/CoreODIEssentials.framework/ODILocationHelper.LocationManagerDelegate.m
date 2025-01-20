@interface ODILocationHelper.LocationManagerDelegate
- (_TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate)init;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation ODILocationHelper.LocationManagerDelegate

- (void)dealloc
{
  v2 = self;
  sub_214BF763C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate__locationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_lock));
  swift_release();
  sub_214B59CE0((uint64_t)self+ OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_locationFetchRequestedAt, &qword_26ACE3B10);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_214B6A264(0, &qword_26784DB90);
  unint64_t v6 = sub_214D1A268();
  id v8 = a3;
  v7 = self;
  sub_214BF9A84(v6);
  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_214BF8FEC((uint64_t)v6);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_lock);
  id v8 = a3;
  v7 = self;
  objc_msgSend(v6, sel_lock);
  if (MEMORY[0x2166B1650]((char *)v7 + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_parent))
  {
    sub_214BF7264(a4);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v6, sel_unlock);
}

- (_TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate)init
{
  result = (_TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end