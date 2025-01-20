@interface ReportViewController
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (_TtC27DeviceActivityReportService20ReportViewController)initWithCoder:(id)a3;
- (_TtC27DeviceActivityReportService20ReportViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didRefreshData:(id)a3;
- (void)discoverClientExtensionWithConfiguration:(id)a3 :(id)a4;
- (void)fetchActivitySegmentWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4 segmentInterval:(int64_t)a5 recordName:(id)a6 :(id)a7;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4;
- (void)updateClientConfiguration:(id)a3 :(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ReportViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ReportViewController();
  v4 = v5.receiver;
  [(ReportViewController *)&v5 viewWillAppear:v3];
  if (v4[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData] == 1)
  {
    if (qword_100029420 != -1) {
      swift_once();
    }
    sub_10001076C((uint64_t)&v4[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataRefresherObserverID]);
  }
  sub_100014580();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData) == 1)
  {
    uint64_t v5 = qword_100029420;
    v6 = self;
    if (v5 != -1) {
      swift_once();
    }
    sub_100011AF8((uint64_t)v6 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataRefresherObserverID);
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReportViewController();
  [(ReportViewController *)&v8 viewDidDisappear:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ReportViewController();
  id v2 = v5.receiver;
  [(ReportViewController *)&v5 viewDidLoad];
  id v3 = sub_100013E78();
  sub_100013080(v3);

  id v4 = objc_msgSend(self, "defaultCenter", v5.receiver, v5.super_class);
  if (qword_100029418 != -1) {
    swift_once();
  }
  [v4 addObserver:v2 selector:"didRefreshData:" name:qword_100029DF8 object:0];
}

- (void)didRefreshData:(id)a3
{
  uint64_t v4 = sub_10001E138();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001E128();
  objc_super v8 = self;
  id v9 = [(ReportViewController *)v8 viewIfLoaded];
  id v10 = [v9 window];

  if (v10)
  {

    if (*((unsigned char *)&v8->super.super.super.isa
         + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData) == 1)
      sub_100014580();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC27DeviceActivityReportService20ReportViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10001E6B8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC27DeviceActivityReportService20ReportViewController *)sub_10001592C(v5, v7, a4);
}

- (_TtC27DeviceActivityReportService20ReportViewController)initWithCoder:(id)a3
{
  return (_TtC27DeviceActivityReportService20ReportViewController *)sub_100015EF8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_sceneRole));
  sub_10000FCA4((uint64_t)self + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_filter, &qword_100029C10);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___reportExtensionHostingController));
  sub_10000FCA4((uint64_t)self+ OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___extensionController, &qword_100029C88);
  sub_10000FCA4((uint64_t)self + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___dataSource, &qword_100029C80);
  id v3 = (char *)self + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataRefresherObserverID;
  uint64_t v4 = sub_10001E298();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataUpdateQueue);
}

- (void)discoverClientExtensionWithConfiguration:(id)a3 :(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  id v8 = self;
  uint64_t v9 = sub_10001E238();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  Class isa = sub_10001E228().super.isa;
  v14 = (void *)swift_allocObject();
  v14[2] = sub_10001AE74;
  v14[3] = v12;
  v14[4] = v8;
  v17[4] = sub_10001AEBC;
  v17[5] = v14;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100015688;
  v17[3] = &unk_100025650;
  v15 = _Block_copy(v17);
  v16 = v8;
  swift_retain();
  swift_release();
  [(ReportViewController *)v16 updateClientConfiguration:isa :v15];
  _Block_release(v15);
  swift_release();

  sub_10000F9F0(v9, v11);
}

- (void)updateClientConfiguration:(id)a3 :(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  unint64_t v11 = self;
  uint64_t v8 = sub_10001E238();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_100018AA4(v8, v10, v11, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_10000F9F0(v8, v10);
}

- (void)fetchActivitySegmentWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4 segmentInterval:(int64_t)a5 recordName:(id)a6 :(id)a7
{
  unint64_t v10 = _Block_copy(a7);
  if (a3)
  {
    uint64_t v11 = sub_10001E6B8();
    a3 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v13 = (unsigned int (**)(char *, uint64_t, uint64_t))sub_10001E6B8();
  v15 = v14;
  uint64_t v16 = sub_10001E6B8();
  v18 = v17;
  _Block_copy(v10);
  v19 = self;
  sub_1000197E4(v11, (unint64_t)a3, v13, v15, a5, v16, v18, (char *)v19, (unint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100016FF4(v4);

  return 1;
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  uint64_t v6 = sub_100004A08(&qword_100029BD8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001AEF0(0, (unint64_t *)&unk_100029BE0);
  sub_10001E9D8();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_100013E78();
  sub_1000176B8(v10, v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10001851C(v4, (char *)v5);
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = a4;
  sub_10001A938();
}

@end