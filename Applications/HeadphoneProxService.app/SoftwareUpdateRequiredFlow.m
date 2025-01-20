@interface SoftwareUpdateRequiredFlow
- (_TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow)initWithCoder:(id)a3;
- (_TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow)initWithNibName:(id)a3 bundle:(id)a4;
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
  v4 = self;
  sub_10003282C(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 0);
}

- (_TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow)initWithNibName:(id)a3 bundle:(id)a4
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

- (_TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SoftwareUpdateRequiredFlow *)&v5 initWithCoder:a3];
}

- (void)proxCardFlowDidDismiss
{
  v3 = self;
  v2 = (void *)sub_1000326D8();
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