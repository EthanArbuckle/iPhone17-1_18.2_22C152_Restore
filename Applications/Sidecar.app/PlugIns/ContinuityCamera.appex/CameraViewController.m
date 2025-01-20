@interface CameraViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (_TtC16ContinuityCamera20CameraViewController)initWithCoder:(id)a3;
- (_TtC16ContinuityCamera20CameraViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)viewDidLoad;
@end

@implementation CameraViewController

- (BOOL)shouldAutorotate
{
  v2 = self;
  BOOL v3 = sub_100007C30();

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100007C94();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_100008438(type metadata accessor for CameraViewController, (SEL *)&selRef_didReceiveMemoryWarning);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_100008A90();
  uint64_t v6 = sub_1000094A0();
  id v7 = a3;
  v8 = self;
  sub_100007EA4((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100008138();
}

- (_TtC16ContinuityCamera20CameraViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100009500();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16ContinuityCamera20CameraViewController *)sub_1000081FC(v5, v7, a4);
}

- (_TtC16ContinuityCamera20CameraViewController)initWithCoder:(id)a3
{
  return (_TtC16ContinuityCamera20CameraViewController *)sub_100008344(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate;

  sub_100008AE0((uint64_t)v3);
}

@end