@interface AURightEdgeControlsBaseViewController
- (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController)init;
- (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController)initWithCoder:(id)a3;
- (void)auParameterValueChangedWithNotification:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AURightEdgeControlsBaseViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_21E56FC2C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  id v7 = (id)sub_21E5B65B8();
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v5, sel_auParameterValueChangedWithNotification_, v7, 0);
}

- (void)auParameterValueChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_21E5B6398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E5B6378();
  v9 = self;
  sub_21E56F35C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_21E571258();
}

- (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController)init
{
  return (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *)sub_21E571534();
}

- (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit37AURightEdgeControlsBaseViewController *)sub_21E5716D4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_edgeControlSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_bandControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_gainKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController____lazy_storage___decimalFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController____lazy_storage___wholeNumberFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_rightWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_bandWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit37AURightEdgeControlsBaseViewController_bandHeightConstraint));

  swift_release();
}

@end