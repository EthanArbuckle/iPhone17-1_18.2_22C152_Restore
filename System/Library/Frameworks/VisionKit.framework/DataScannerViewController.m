@interface DataScannerViewController
- (_TtC9VisionKit25DataScannerViewController)initWithCoder:(id)a3;
- (_TtC9VisionKit25DataScannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didEnterBackground;
- (void)loadView;
- (void)onPinch:(id)a3;
- (void)onTap:(id)a3;
- (void)removeFromParentViewController;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willEnterForeground;
@end

@implementation DataScannerViewController

- (_TtC9VisionKit25DataScannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_217979DBC();
}

- (_TtC9VisionKit25DataScannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_217979DBC();
}

- (void)dealloc
{
  id v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DataScannerViewController();
  [(DataScannerViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21796937C((uint64_t)self + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView));
  swift_bridgeObjectRelease();
  sub_21796937C((uint64_t)self + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);

  swift_bridgeObjectRelease();
}

- (void)didEnterBackground
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  id v4 = self;
  unsigned __int8 v3 = objc_msgSend(v2, sel_isProcessing);
  *((unsigned char *)&v4->super.super.super.isa
  + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground) = v3;
  objc_msgSend(v2, sel_stopRunning);
}

- (void)willEnterForeground
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  unsigned __int8 v3 = self;
  objc_msgSend(v2, sel_startRunning);
  if (*((unsigned char *)&v3->super.super.super.isa
       + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground) == 1)
    objc_msgSend(v2, sel_startProcessing);
}

- (void)loadView
{
  v2 = self;
  sub_2179757CC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_217975BB8();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_217975EB8(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_21797605C(a3);
}

- (void)removeFromParentViewController
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DataScannerViewController();
  v2 = (char *)v3.receiver;
  [(DataScannerViewController *)&v3 removeFromParentViewController];
  sub_21797777C();
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_stopRunning, v3.receiver, v3.super_class);
}

- (void)onTap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2179768A0(v4);
}

- (void)onPinch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_217976E70(v4);
}

@end