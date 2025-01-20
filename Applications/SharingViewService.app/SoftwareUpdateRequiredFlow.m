@interface SoftwareUpdateRequiredFlow
- (_TtC18SharingViewService26SoftwareUpdateRequiredFlow)initWithCoder:(id)a3;
- (_TtC18SharingViewService26SoftwareUpdateRequiredFlow)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SoftwareUpdateRequiredFlow

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(const void *))_Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = v6[2];
    id v9 = a3;
    v10 = self;
    v8(v7);
    _Block_release(v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(SoftwareUpdateRequiredFlow *)&v8 viewDidAppear:v3];
  v5 = (void *)sub_10007340C();
  if (v5)
  {
    [v5 setStatusBarHidden:1 withDuration:0.3];
    swift_unknownObjectRelease();
  }
  id v6 = [objc_allocWithZone((Class)PRXSoftwareUpdateViewController) init];
  id v7 = [v4 presentProxCardFlowWithDelegate:v4 initialViewController:v6];
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 0);
}

- (_TtC18SharingViewService26SoftwareUpdateRequiredFlow)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(SoftwareUpdateRequiredFlow *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC18SharingViewService26SoftwareUpdateRequiredFlow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SoftwareUpdateRequiredFlow *)&v5 initWithCoder:a3];
}

- (void)proxCardFlowDidDismiss
{
  BOOL v3 = self;
  v2 = (void *)sub_10007340C();
  if (v2)
  {
    [v2 dismiss];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end