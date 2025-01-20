@interface AUDistortionViewController
- (_TtC12CoreAudioKit26AUDistortionViewController)init;
- (_TtC12CoreAudioKit26AUDistortionViewController)initWithCoder:(id)a3;
- (void)layoutChangedWithNotification:(id)a3;
- (void)tabSelectionChangedWithNotification:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AUDistortionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_21E5A6600();
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_21E5A9894();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUDistortionViewController();
  [(AUAppleViewControllerBase *)&v8 viewWillDisappear:v3];
}

- (void)tabSelectionChangedWithNotification:(id)a3
{
}

- (void)layoutChangedWithNotification:(id)a3
{
}

- (_TtC12CoreAudioKit26AUDistortionViewController)init
{
  return (_TtC12CoreAudioKit26AUDistortionViewController *)sub_21E5A86A0();
}

- (_TtC12CoreAudioKit26AUDistortionViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit26AUDistortionViewController *)sub_21E5A8784(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_tabView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_distortionView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_v3AU);
}

@end