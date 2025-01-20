@interface ClarityUIEnhancedEmergencyCoordinator
- (_TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator)init;
- (id)getAudioRouteMenu;
- (id)getCurrentCall;
- (void)addMediaRequestViewController:(id)a3;
- (void)addWebRTCViewController:(id)a3;
- (void)dealloc;
- (void)requestHapticForRequest;
- (void)requestToAddResumeCameraLabel;
- (void)requestToDisableMediaUploadButton;
- (void)requestToDisableVideoStreamingButton;
- (void)requestToEnableMediaUploadButton;
- (void)requestToEnableVideoStreamingButton;
@end

@implementation ClarityUIEnhancedEmergencyCoordinator

- (_TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator)init
{
  return (_TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *)sub_1001B8748();
}

- (void)dealloc
{
  v2 = self;
  sub_1001B89A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator_coordinator));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)addWebRTCViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001B8F68();
}

- (void)addMediaRequestViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001B9334();
}

- (void)requestToEnableVideoStreamingButton
{
  v2 = self;
  sub_1001BA430();
}

- (void)requestToDisableVideoStreamingButton
{
  v2 = self;
  sub_1001BA48C();
}

- (void)requestToEnableMediaUploadButton
{
  v2 = self;
  sub_1001BA4E4();
}

- (void)requestToDisableMediaUploadButton
{
  v2 = self;
  sub_1001BA53C();
}

- (void)requestHapticForRequest
{
  v2 = self;
  sub_1001BA688();
}

- (void)requestToAddResumeCameraLabel
{
  v2 = self;
  sub_1001BA7E4();
}

- (id)getCurrentCall
{
  v2 = self;
  id v3 = sub_1001BA950();

  return v3;
}

- (id)getAudioRouteMenu
{
  return 0;
}

@end