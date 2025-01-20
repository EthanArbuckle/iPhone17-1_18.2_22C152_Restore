@interface IDScanViewController
- (_TtC9CoreIDVUI20IDScanViewController)initWithCoder:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IDScanViewController

- (_TtC9CoreIDVUI20IDScanViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F485138();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F48015C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_21F480374(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IDScanViewController(0);
  v4 = v7.receiver;
  [(IDScanViewController *)&v7 viewDidAppear:v3];
  uint64_t v5 = sub_21F5502A0();
  sub_21F4804AC(v5, v6, 0, 0, v4[OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_scanSide]);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_21F47F030((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_docInfo, &qword_267EDE918);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_cameraReader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_docScanConfig));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController____lazy_storage___guidanceContainer));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController____lazy_storage___guidancePrompt);
}

@end