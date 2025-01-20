@interface B389SetupMainViewController
- (SPPairingSession)accessibilitySession;
- (_TtC18SharingViewService27B389SetupMainViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService27B389SetupMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)b389NFCPromptUpdateConfiguration:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didLosePeripheral:(id)a4 forType:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setResponseHandler:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389SetupMainViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = sub_100039A5C();

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100039B64(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10003A904(a3);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_10006A128;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10003C0FC((uint64_t)a3, (uint64_t)v6, v7);
  sub_100017C38((uint64_t)v6);
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100017EF4(0, (unint64_t *)&qword_1001C9600);
    sub_100069EE8();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_10003D84C(v4);

  swift_bridgeObjectRelease();
}

- (void)dismiss:(int)a3
{
  uint64_t v5 = sub_100009A0C(&qword_1001C7620);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_nfcVC];
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_response;
    *(void *)uint64_t v9 = 2;
    *(unsigned char *)(v9 + 8) = 0;
  }
  uint64_t v10 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = self;
  sub_10003E5C4(a3, (uint64_t)v7, 0, 0, 391);
  sub_1000118F8((uint64_t)v7, &qword_1001C7620);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_100069EE0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  sub_1000409D8(a3, (uint64_t)v6, v7);
  sub_100017C38((uint64_t)v6);
}

- (SPPairingSession)accessibilitySession
{
  return (SPPairingSession *)*(id *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_session];
}

- (_TtC18SharingViewService27B389SetupMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService27B389SetupMainViewController *)sub_100060958((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100040E68);
}

- (_TtC18SharingViewService27B389SetupMainViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService27B389SetupMainViewController *)sub_1000414F8(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001CAD4(*(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo], *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo+ 8], *(void **)((char *)&self->super._userInfo+ OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo));
  swift_release();
  sub_1000118F8((uint64_t)self + OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_presentationConfig, &qword_1001C9418);
  swift_release();

  swift_unknownObjectRelease();
  swift_errorRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10002B7E4(*(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_storeS1], *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_storeS1+ 8]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000118F8((uint64_t)self + OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_nfcUUID, (uint64_t *)&unk_1001C9450);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000619CC(*(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue+ 8], *(uint64_t *)((char *)&self->super._userInfo+ OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue), *(void *)&self->__doNotReference[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(void *)&self->inFlightOperations[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(void *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(void *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 8], *(void *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 16], *(void *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 24], *(void *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 32], (void (*)(void))sub_10000A5B8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)setResponseHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_100042158((uint64_t)sub_100069A04, v5);

  swift_release();
}

- (void)b389NFCPromptUpdateConfiguration:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1000424D0(a3);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100053A28(v4);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100064BD0(v7);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 didLosePeripheral:(id)a4 forType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100065B54(v9, v10);
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_100065F0C(a4, (uint64_t)a5);
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100066364(a4);
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_100066BC0(a4, a5);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_100053EC8(v6, (uint64_t)a4);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_100067718(v8);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_100067DD8(v8, v9);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
}

@end