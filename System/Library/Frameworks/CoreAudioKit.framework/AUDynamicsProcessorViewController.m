@interface AUDynamicsProcessorViewController
- (_TtC12CoreAudioKit33AUDynamicsProcessorViewController)init;
- (_TtC12CoreAudioKit33AUDynamicsProcessorViewController)initWithCoder:(id)a3;
- (void)auParameterValueChangedWithNotification:(id)a3;
- (void)graphControlTouchedWithNotification:(id)a3;
- (void)knobReleasedWithNotification:(id)a3;
- (void)knobTouchedWithNotification:(id)a3;
- (void)knobValueChangedWithNotification:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AUDynamicsProcessorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_21E577EBC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_21E57A6AC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUDynamicsProcessorViewController();
  [(AUAppleViewControllerBase *)&v8 viewWillDisappear:v3];
}

- (void)auParameterValueChangedWithNotification:(id)a3
{
}

- (void)graphControlTouchedWithNotification:(id)a3
{
}

- (void)knobValueChangedWithNotification:(id)a3
{
}

- (void)knobTouchedWithNotification:(id)a3
{
}

- (void)knobReleasedWithNotification:(id)a3
{
  uint64_t v4 = sub_21E5B6398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  objc_super v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E5B6378();
  v9 = self;
  sub_21E57BC50();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)viewDidLayoutSubviews
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_viewContainer);
  if (v2)
  {
    BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_headerView);
    uint64_t v4 = self;
    id v5 = v2;
    id v8 = v3;
    objc_msgSend(v5, sel_frame);
    sub_21E59DC68(v6, v7);
  }
}

- (_TtC12CoreAudioKit33AUDynamicsProcessorViewController)init
{
  return (_TtC12CoreAudioKit33AUDynamicsProcessorViewController *)sub_21E57C534();
}

- (_TtC12CoreAudioKit33AUDynamicsProcessorViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit33AUDynamicsProcessorViewController *)sub_21E57C7B4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_viewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_graphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_edgeControlSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_inputLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_outputLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_meterLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_meter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_attackKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_releaseKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_gainKnob));
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit33AUDynamicsProcessorViewController_rightWidthConstraint);
}

@end