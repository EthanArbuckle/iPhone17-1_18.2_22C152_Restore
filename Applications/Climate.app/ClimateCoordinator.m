@interface ClimateCoordinator
- (_TtC7Climate18ClimateCoordinator)init;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4;
- (void)positionManagerDidUpdateTracking:(id)a3;
- (void)sessionDidConnect:(id)a3;
@end

@implementation ClimateCoordinator

- (_TtC7Climate18ClimateCoordinator)init
{
  return (_TtC7Climate18ClimateCoordinator *)sub_100035640();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__appActive;
  uint64_t v4 = sub_100006730(&qword_1000E5E38);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__currentCar;
  uint64_t v6 = sub_100006730(&qword_1000E5E30);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__climateSystem;
  uint64_t v8 = sub_100006730(&qword_1000E4BB0);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__activeZone;
  uint64_t v10 = sub_100006730((uint64_t *)&unk_1000E5E20);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__layoutSide;
  uint64_t v12 = sub_100006730(&qword_1000E5E18);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__layoutMode;
  uint64_t v14 = sub_100006730(&qword_1000E5E10);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__statusBarSteppersState;
  uint64_t v16 = sub_100006730((uint64_t *)&unk_1000E5490);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);

  swift_bridgeObjectRelease();
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100043A44(a4);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100038890(0xD00000000000001BLL, 0x80000001000B6F10);
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100038890(0xD000000000000022, 0x80000001000B6EE0);
}

- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100038890(0xD00000000000001DLL, 0x80000001000B6EC0);
}

- (void)positionManagerDidUpdateTracking:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100038890(0xD000000000000024, 0x80000001000B6E90);
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100038890(0xD000000000000028, 0x80000001000B6E60);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10003613C();
}

@end