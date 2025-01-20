@interface VOTSettings
- (AXCVoiceSelection)_systemVoiceSelection;
- (AXCVoiceSelection)systemVoiceSelection;
- (AXVoiceOverActivity)_currentActivity;
- (AXVoiceOverActivity)currentActivity;
- (BOOL)speakUpEnabled;
- (BOOL)stringIsSupported:(id)a3 language:(id)a4;
- (NSArray)voiceRotors;
- (NSString)selectedLanguageIdentifier;
- (NSString)systemLanguageIdentifier;
- (_TtC3vot11VOTSettings)init;
- (void)currentElementDidUpdate:(id)a3;
- (void)initialize;
- (void)rotorRateWithCompletionHandler:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setRotorRate:(float)a3 completionHandler:(id)a4;
- (void)setSelectedLanguageIdentifier:(id)a3;
- (void)setSystemVoiceSelection:(id)a3;
- (void)set_currentActivity:(id)a3;
- (void)set_systemVoiceSelection:(id)a3;
- (void)voiceSelectionForAction:(id)a3 languageCode:(id)a4 completionHandler:(id)a5;
- (void)voiceSelectionWithLanguageCode:(id)a3 withActivity:(id)a4 completionHandler:(id)a5;
@end

@implementation VOTSettings

- (NSString)systemLanguageIdentifier
{
  return (NSString *)sub_10011343C(self, (uint64_t)a2, (void (*)(void))sub_100110360);
}

- (AXCVoiceSelection)_systemVoiceSelection
{
  return (AXCVoiceSelection *)sub_100110ED8((uint64_t)self, (uint64_t)a2, &qword_1001EB578, &OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection, (uint64_t (*)(void))&type metadata accessor for VoiceSelection, (uint64_t (*)(void))&VoiceSelection._bridgeToObjectiveC());
}

- (void)set_systemVoiceSelection:(id)a3
{
  uint64_t v5 = sub_10010FF74(&qword_1001EB578);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    id v9 = a3;
    static VoiceSelection._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v10 = type metadata accessor for VoiceSelection();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for VoiceSelection();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    v12 = self;
  }
  v13 = (char *)self + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection;
  swift_beginAccess();
  sub_100119ED0((uint64_t)v7, (uint64_t)v13, &qword_1001EB578);
  swift_endAccess();
}

- (AXCVoiceSelection)systemVoiceSelection
{
  uint64_t v3 = sub_10010FF74(&qword_1001EB578);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v12[1] = self;
  sub_100119AEC(&qword_1001EB4C0, (void (*)(uint64_t))type metadata accessor for VOTSettings);
  uint64_t v6 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v7 = (uint64_t)v6 + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection;
  swift_beginAccess();
  sub_100119E0C(v7, (uint64_t)v5, &qword_1001EB578);

  uint64_t v8 = type metadata accessor for VoiceSelection();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    uint64_t v10 = (void *)VoiceSelection._bridgeToObjectiveC()();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }

  return (AXCVoiceSelection *)v10;
}

- (void)setSystemVoiceSelection:(id)a3
{
  uint64_t v5 = sub_10010FF74(&qword_1001EB578);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v8 = self;
    id v9 = a3;
    static VoiceSelection._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v10 = type metadata accessor for VoiceSelection();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for VoiceSelection();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    v12 = self;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  v14[-2] = self;
  v14[-1] = v7;
  v14[1] = self;
  sub_100119AEC(&qword_1001EB4C0, (void (*)(uint64_t))type metadata accessor for VOTSettings);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  sub_100119BE8((uint64_t)v7, &qword_1001EB578);
}

- (NSArray)voiceRotors
{
  v2 = self;
  uint64_t v3 = (void *)AXPreferences.VoiceOver.$voiceRotors.getter();
  dispatch thunk of AXSetting.cachedValue.getter();

  type metadata accessor for AXPreferences.VoiceOver.VoiceRotorItem();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (AXVoiceOverActivity)_currentActivity
{
  return (AXVoiceOverActivity *)sub_100110ED8((uint64_t)self, (uint64_t)a2, &qword_1001EB4D0, &OBJC_IVAR____TtC3vot11VOTSettings__currentActivity, (uint64_t (*)(void))&type metadata accessor for AXPreferences.VoiceOver.Activity, (uint64_t (*)(void))&AXPreferences.VoiceOver.Activity._bridgeToObjectiveC());
}

- (void)set_currentActivity:(id)a3
{
  uint64_t v5 = sub_10010FF74(&qword_1001EB4D0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v10 = &v17[-v9];
  if (a3)
  {
    uint64_t v11 = self;
    id v12 = a3;
    static AXPreferences.VoiceOver.Activity._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v13 = type metadata accessor for AXPreferences.VoiceOver.Activity();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for AXPreferences.VoiceOver.Activity();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 1, 1, v14);
    v15 = self;
  }
  v16 = (char *)self + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity;
  swift_beginAccess();
  sub_100119E0C((uint64_t)v16, (uint64_t)v8, &qword_1001EB4D0);
  swift_beginAccess();
  sub_100119B84((uint64_t)v10, (uint64_t)v16, &qword_1001EB4D0);
  swift_endAccess();
  sub_100111204((uint64_t)v8);
  sub_100119BE8((uint64_t)v10, &qword_1001EB4D0);
  sub_100119BE8((uint64_t)v8, &qword_1001EB4D0);
}

- (AXVoiceOverActivity)currentActivity
{
  uint64_t v3 = sub_10010FF74(&qword_1001EB4D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v12[1] = self;
  sub_100119AEC(&qword_1001EB4C0, (void (*)(uint64_t))type metadata accessor for VOTSettings);
  uint64_t v6 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v7 = (uint64_t)v6 + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity;
  swift_beginAccess();
  sub_100119E0C(v7, (uint64_t)v5, &qword_1001EB4D0);

  uint64_t v8 = type metadata accessor for AXPreferences.VoiceOver.Activity();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    uint64_t v10 = (void *)AXPreferences.VoiceOver.Activity._bridgeToObjectiveC()();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }

  return (AXVoiceOverActivity *)v10;
}

- (void)setCurrentActivity:(id)a3
{
  uint64_t v5 = sub_10010FF74(&qword_1001EB4D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v8 = self;
    id v9 = a3;
    static AXPreferences.VoiceOver.Activity._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v10 = type metadata accessor for AXPreferences.VoiceOver.Activity();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for AXPreferences.VoiceOver.Activity();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    id v12 = self;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  v14[-2] = self;
  v14[-1] = v7;
  v14[1] = self;
  sub_100119AEC(&qword_1001EB4C0, (void (*)(uint64_t))type metadata accessor for VOTSettings);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  sub_100119BE8((uint64_t)v7, &qword_1001EB4D0);
}

- (void)currentElementDidUpdate:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100111FF0((uint64_t)v5);
}

- (BOOL)speakUpEnabled
{
  v2 = self;
  uint64_t v3 = (void *)AXPreferences.VoiceOver.$speakUpEnabled.getter();
  dispatch thunk of AXSetting.cachedValue.getter();

  return v5;
}

- (NSString)selectedLanguageIdentifier
{
  return (NSString *)sub_10011343C(self, (uint64_t)a2, (void (*)(void))sub_1001134BC);
}

- (void)setSelectedLanguageIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  sub_10011389C(v4, v6);
}

- (void)rotorRateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10010FF74(&qword_1001EB4D8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001EB610;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  void v12[4] = &unk_1001EB618;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100118928((uint64_t)v7, (uint64_t)&unk_1001EB620, (uint64_t)v12);
  swift_release();
}

- (void)setRotorRate:(float)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10010FF74(&qword_1001EB4D8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(float *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001EB5D0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001EB5E0;
  v14[5] = v13;
  v15 = self;
  sub_100118928((uint64_t)v9, (uint64_t)&unk_1001EB5F0, (uint64_t)v14);
  swift_release();
}

- (void)voiceSelectionForAction:(id)a3 languageCode:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v13 = a3;
  uint64_t v12 = self;
  sub_100115A2C(a3, v8, v10, (uint64_t)sub_100119FAC, v11);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)voiceSelectionWithLanguageCode:(id)a3 withActivity:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_10010FF74(&qword_1001EB4D0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (a4)
  {
    v15 = self;
    id v16 = a4;
    static AXPreferences.VoiceOver.Activity._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v17 = type metadata accessor for AXPreferences.VoiceOver.Activity();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = type metadata accessor for AXPreferences.VoiceOver.Activity();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
    v19 = self;
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v11;
  sub_100116588(v12, v14, (uint64_t)v10, (uint64_t)sub_100119FAC, v20);
  swift_release();
  swift_bridgeObjectRelease();

  sub_100119BE8((uint64_t)v10, &qword_1001EB4D0);
}

- (_TtC3vot11VOTSettings)init
{
  return (_TtC3vot11VOTSettings *)sub_100116E3C();
}

- (void)initialize
{
  uint64_t v7 = self;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = v2;
  sub_10011238C((uint64_t)sub_10011A5AC, v3);
  swift_release();
  dispatch_group_enter(v4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = v4;
  sub_100113D98((uint64_t)sub_100119F6C, v5);
  swift_release();
  OS_dispatch_group.wait()();
}

- (BOOL)stringIsSupported:(id)a3 language:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = self;
  char v12 = sub_1001179A0(v6, v8, v9, (uint64_t)a4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100119BE8((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__systemLanguage, &qword_1001EB4B8);
  sub_100119BE8((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection, &qword_1001EB578);
  sub_100119BE8((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity, &qword_1001EB4D0);
  sub_100119BE8((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings___overrideLanguage, &qword_1001EB4B8);
  sub_100119BE8((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__selectedLanguage, &qword_1001EB4B8);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC3vot11VOTSettings___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end