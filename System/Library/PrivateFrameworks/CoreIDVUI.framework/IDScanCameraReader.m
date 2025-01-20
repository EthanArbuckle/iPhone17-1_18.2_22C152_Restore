@interface IDScanCameraReader
- (BOOL)cameraReader:(id)a3 shouldReturnIDImage:(id)a4;
- (_TtC9CoreIDVUI18IDScanCameraReader)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI18IDScanCameraReader)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9CoreIDVUI18IDScanCameraReader)initWithOptions:(id)a3;
- (id)cameraReader:(id)a3 auxiliaryIDCornerDetection:(__CVBuffer *)a4;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidEnd:(id)a3;
- (void)timerAction;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation IDScanCameraReader

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4B1C7C();
}

- (void)cameraReaderDidEnd:(id)a3
{
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_21F4B3094(v8);
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  sub_21F46EFD8(0, &qword_267EDF320);
  unint64_t v6 = sub_21F551650();
  id v7 = a3;
  id v8 = self;
  sub_21F4B331C(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)cameraReader:(id)a3 shouldReturnIDImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unsigned __int8 v9 = sub_21F4B3968(v7);

  return v9 & 1;
}

- (id)cameraReader:(id)a3 auxiliaryIDCornerDetection:(__CVBuffer *)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = sub_21F4B3E94((uint64_t)v7);

  if (v9)
  {
    sub_21F46EFD8(0, &qword_267EDF318);
    v10 = (void *)sub_21F551640();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IDScanCameraReader();
  [(IDScanCameraReader *)&v4 viewDidAppear:v3];
}

- (void)timerAction
{
  v2 = self;
  sub_21F4B26D4();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IDScanCameraReader();
  id v4 = v5.receiver;
  [(IDScanCameraReader *)&v5 viewWillDisappear:v3];
  sub_21F4B2AFC();
}

- (_TtC9CoreIDVUI18IDScanCameraReader)initWithOptions:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_21F5514F0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (_TtC9CoreIDVUI18IDScanCameraReader *)sub_21F4B2C54(v3);
}

- (_TtC9CoreIDVUI18IDScanCameraReader)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_21F5515A0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC9CoreIDVUI18IDScanCameraReader *)sub_21F4B2D98(v5, v7, a4);
}

- (_TtC9CoreIDVUI18IDScanCameraReader)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI18IDScanCameraReader *)sub_21F4B2ED4(a3);
}

- (void).cxx_destruct
{
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_didCaptureImage));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_shouldReturnImage));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_detectIDCardCorners));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_onError);

  sub_21F47D8F8(v3);
}

@end