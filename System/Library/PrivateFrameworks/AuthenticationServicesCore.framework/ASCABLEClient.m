@interface ASCABLEClient
- (NSURL)qrCodeURL;
- (_TtC26AuthenticationServicesCore13ASCABLEClient)init;
- (_TtC26AuthenticationServicesCore13ASCABLEClient)initWithDelegate:(id)a3 isRegistrationRequest:(BOOL)a4;
- (void)cancelIfNecessary;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)performAuthenticationOperation:(int64_t)a3 forRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation ASCABLEClient

- (NSURL)qrCodeURL
{
  uint64_t v3 = sub_2193E1FF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v7 = *(_OWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 8];
  v11[0] = *(_OWORD *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct);
  v11[1] = v7;
  v12[0] = *(_OWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 24];
  *(_DWORD *)((char *)v12 + 15) = *(_DWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct
                                                               + 39];
  v8 = self;
  sub_219371058((uint64_t)v6);

  v9 = (void *)sub_2193E1F80();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v9;
}

- (_TtC26AuthenticationServicesCore13ASCABLEClient)initWithDelegate:(id)a3 isRegistrationRequest:(BOOL)a4
{
  BOOL v4 = a4;
  swift_unknownObjectRetain();
  return (_TtC26AuthenticationServicesCore13ASCABLEClient *)ASCABLEClient.init(delegate:isRegistrationRequest:)((uint64_t)a3, v4);
}

- (void)performAuthenticationOperation:(int64_t)a3 forRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5
{
  long long v7 = _Block_copy(a5);
  uint64_t v8 = sub_2193E2840();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_219362630(a3, v8, v10, (uint64_t)sub_219360404, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)cancelIfNecessary
{
  v2 = self;
  sub_219367648(4);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_219363080(v4);
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  id v6 = a3;
  long long v7 = self;
  id v8 = a4;
  sub_219367B9C(a4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10 = sub_2193E27A0();
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_219367DAC(v12, v10);

  swift_bridgeObjectRelease();
}

- (_TtC26AuthenticationServicesCore13ASCABLEClient)init
{
  result = (_TtC26AuthenticationServicesCore13ASCABLEClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 8];
  unint64_t v4 = *(void *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 16];
  sub_219348A70(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct), *(void *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct]);
  sub_219348A70(v3, v4);
  sub_2193699C0((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_bluetoothManager));
  swift_release();
  swift_bridgeObjectRelease();
  sub_21934CEB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_clientDataJSON), *(void *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_clientDataJSON]);

  sub_219360620((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_authenticatorAdvertisement, (uint64_t *)&unk_26AC27230);
  sub_219360334(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_completionHandler));

  sub_219360620((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_testDelegate, (uint64_t *)&unk_26AC27240);
}

@end