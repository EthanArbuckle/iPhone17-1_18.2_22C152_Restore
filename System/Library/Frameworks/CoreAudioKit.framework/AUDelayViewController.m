@interface AUDelayViewController
- (_TtC12CoreAudioKit21AUDelayViewController)init;
- (_TtC12CoreAudioKit21AUDelayViewController)initWithCoder:(id)a3;
- (void)auParameterValueChangedWithNotification:(id)a3;
- (void)knobTouchedWithNotification:(id)a3;
- (void)knobValueChangedWithNotification:(id)a3;
- (void)modeControlChanged;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation AUDelayViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_21E58F0AC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  id v7 = (id)sub_21E5B65B8();
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v5, sel_auParameterValueChangedWithNotification_, v7, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self;
  id v6 = self;
  id v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUDelayViewController();
  [(AUAppleViewControllerBase *)&v8 viewWillDisappear:v3];
}

- (void)auParameterValueChangedWithNotification:(id)a3
{
}

- (void)zoomIn
{
  v2 = self;
  sub_21E591310();
}

- (void)zoomOut
{
  v2 = self;
  sub_21E5913F8();
}

- (void)modeControlChanged
{
  v2 = self;
  sub_21E5914E4();
}

- (void)knobValueChangedWithNotification:(id)a3
{
}

- (void)knobTouchedWithNotification:(id)a3
{
}

- (_TtC12CoreAudioKit21AUDelayViewController)init
{
  return (_TtC12CoreAudioKit21AUDelayViewController *)sub_21E592BA8();
}

- (_TtC12CoreAudioKit21AUDelayViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit21AUDelayViewController *)sub_21E592DC4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_edgeControlSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_modeControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController____lazy_storage___decimalFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_zoomInButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_zoomOutButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_mixKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_cutoffKnob));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit21AUDelayViewController_rightWidthConstraint);
}

@end