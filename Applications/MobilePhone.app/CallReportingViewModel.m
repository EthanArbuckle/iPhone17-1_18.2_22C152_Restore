@interface CallReportingViewModel
- (BOOL)allUnknownContactInRecentCall:(id)a3;
- (BOOL)atLeastOneUnknownCallerInRecentCall:(id)a3;
- (BOOL)isBlockedWithContacts:(id)a3;
- (BOOL)isInitiatorUnknownForCall:(id)a3;
- (BOOL)shouldShowContactBlockReportButtonForCall:(id)a3;
- (BOOL)shouldShowReportActionForCall:(id)a3;
- (UIImage)reportActionImage;
- (_TtC11MobilePhone22CallReportingViewModel)init;
- (id)getCarrierNameOfCallForCall:(id)a3;
- (id)getCarrierSpamReportAlertTitleWithCarrierName:(id)a3;
- (id)getReportInitiatorMessageWithFormattedHandle:(id)a3;
- (id)reportActionTitleOfFlow:(int64_t)a3;
- (int64_t)reportingFaceTimeFlowFor:(id)a3;
- (int64_t)reportingFlowForCall:(id)a3;
- (void)blockInitiatorWithSpamCall:(id)a3;
- (void)blockWithContacts:(id)a3;
- (void)blockWithHandles:(id)a3;
- (void)blockWithUnknownContacts:(id)a3;
- (void)logEventForCancelledVoiceCallSpamReport:(id)a3;
- (void)reportSpamVoiceCall:(id)a3;
- (void)reportWithCall:(id)a3;
- (void)unblockWithContacts:(id)a3;
@end

@implementation CallReportingViewModel

- (_TtC11MobilePhone22CallReportingViewModel)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = [objc_allocWithZone((Class)TUFeatureFlags) init];
  id v4 = [objc_allocWithZone((Class)type metadata accessor for FaceTimeSpamReportManager()) init];
  type metadata accessor for VoiceSpamReportTelephonyManager();
  static VoiceSpamReportTelephonyManager.shared.getter();
  type metadata accessor for CarrierVoiceSpamReportHelper();
  swift_allocObject();
  uint64_t v5 = CarrierVoiceSpamReportHelper.init(voiceSpamReportTelephonyManager:)();
  id v6 = objc_allocWithZone(ObjectType);
  specialized CallReportingViewModel.init(featureFlags:spamReportManager:carrierVoiceSpamReportHelper:)(v3, v4, v5);
  v8 = v7;

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)blockWithContacts:(id)a3
{
}

- (void)blockWithHandles:(id)a3
{
}

- (void)blockInitiatorWithSpamCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized CallReportingViewModel.blockInitiator(spamCall:)();
}

- (void)unblockWithContacts:(id)a3
{
}

- (void)blockWithUnknownContacts:(id)a3
{
  type metadata accessor for VMAccount(0, &lazy cache variable for type metadata for CNContact);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = one-time initialization token for spamReport;
  id v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Logger.spamReport);
  v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "blocking", v10, 2u);
    swift_slowDealloc();
  }

  specialized CallReportingViewModel.block(contacts:)(v4);

  swift_bridgeObjectRelease();
}

- (BOOL)isBlockedWithContacts:(id)a3
{
  type metadata accessor for VMAccount(0, &lazy cache variable for type metadata for CNContact);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  char v6 = specialized CallReportingViewModel.isBlocked(contacts:)(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)reportWithCall:(id)a3
{
  unint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobilePhone22CallReportingViewModel_spamReportManager);
  id v5 = a3;
  char v6 = self;
  id v7 = v4;
  FaceTimeSpamReportManager.reportSpam(call:)(v5);
}

- (int64_t)reportingFlowForCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = CallReportingViewModel.reportingFlow(for:)(v4);

  return v6;
}

- (int64_t)reportingFaceTimeFlowFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = CallReportingViewModel.reportingFaceTimeFlow(for:)(v4);

  return v6;
}

- (id)reportActionTitleOfFlow:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    id v5 = self;
    id result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return v3;
  }
  return result;
}

- (UIImage)reportActionImage
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self systemImageNamed:v3];

  return (UIImage *)v4;
}

- (id)getReportInitiatorMessageWithFormattedHandle:(id)a3
{
  return @objc CallReportingViewModel.getReportInitiatorMessage(formattedHandle:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))specialized CallReportingViewModel.getReportInitiatorMessage(formattedHandle:));
}

- (BOOL)allUnknownContactInRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = CallReportingViewModel.contactByHandles(in:)(v4)[2];

  swift_bridgeObjectRelease();
  return v6 == 0;
}

- (BOOL)atLeastOneUnknownCallerInRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = CallReportingViewModel.atLeastOneUnknownCaller(in:)(v4);

  return self & 1;
}

- (BOOL)isInitiatorUnknownForCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = CallReportingViewModel.isInitiatorUnknown(in:)(v4);

  return self & 1;
}

- (id)getCarrierNameOfCallForCall:(id)a3
{
  v9[3] = type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for CHRecentCall);
  v9[4] = lazy protocol witness table accessor for type CHHandle and conformance NSObject(&lazy protocol witness table cache variable for type CHRecentCall and conformance CHRecentCall, (unint64_t *)&lazy cache variable for type metadata for CHRecentCall);
  v9[0] = a3;
  id v5 = a3;
  uint64_t v6 = self;
  swift_retain();
  dispatch thunk of CarrierVoiceSpamReportHelper.reportSpamAlertControllerCarrierName(for:)();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)getCarrierSpamReportAlertTitleWithCarrierName:(id)a3
{
  return @objc CallReportingViewModel.getReportInitiatorMessage(formattedHandle:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))specialized CallReportingViewModel.getCarrierSpamReportAlertTitle(carrierName:));
}

- (void)reportSpamVoiceCall:(id)a3
{
}

- (BOOL)shouldShowReportActionForCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = CallReportingViewModel.shouldShowReportAction(for:)(v4);

  return self & 1;
}

- (void)logEventForCancelledVoiceCallSpamReport:(id)a3
{
}

- (BOOL)shouldShowContactBlockReportButtonForCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 isComingFaceTimeCall]) {
    BOOL v6 = CallReportingViewModel.atLeastOneUnknownCaller(in:)(v4);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

@end