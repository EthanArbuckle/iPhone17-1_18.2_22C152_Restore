@interface MicrophoneTestViewController
- (MicrophoneTestViewController)initWithCoder:(id)a3;
- (MicrophoneTestViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancel;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
- (void)viewDidLoad;
@end

@implementation MicrophoneTestViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100014B80();
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_100015D90((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)start
{
  v2 = self;
  sub_100014E08();
}

- (void)cancel
{
}

- (void)teardown
{
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (MicrophoneTestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100016400();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MicrophoneTestViewController *)sub_1000158E4(v5, v7, a4);
}

- (MicrophoneTestViewController)initWithCoder:(id)a3
{
  return (MicrophoneTestViewController *)sub_100015A3C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(void **)&self->DKDiagnosticViewController_opaque[OBJC_IVAR___MicrophoneTestViewController_headphonesDetector];
}

@end