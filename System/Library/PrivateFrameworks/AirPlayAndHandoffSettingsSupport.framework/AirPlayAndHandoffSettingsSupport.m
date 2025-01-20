void AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.getter(char *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  sub_2477F4C04(a1);
}

void sub_2477F4968(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  type metadata accessor for AirPlayAndHandoffSettingsState();
  sub_2477F4C04(&v2);
  *a1 = v2;
}

uint64_t sub_2477F4A20()
{
  return swift_release();
}

uint64_t type metadata accessor for AirPlayAndHandoffSettingsState()
{
  uint64_t result = qword_269263518;
  if (!qword_269263518) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.setter()
{
  return swift_release();
}

void sub_2477F4C04(char *a1@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  char v2 = (__CFString *)sub_2478016C8();
  v3 = (__CFString *)sub_2478016C8();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v2, v3, &keyExistsAndHasValidFormat);

  if (AppBooleanValue) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = keyExistsAndHasValidFormat == 0;
  }
  int v6 = v5;
  Boolean v11 = 0;
  v7 = (__CFString *)sub_2478016C8();
  v8 = (__CFString *)sub_2478016C8();
  int v9 = CFPreferencesGetAppBooleanValue(v7, v8, &v11);

  if (v9)
  {
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    if (v6)
    {
      if (v11)
      {
        char v10 = 1;
        goto LABEL_15;
      }
LABEL_9:
      char v10 = 2;
LABEL_15:
      *a1 = v10;
      return;
    }
    if (v11)
    {
      char v10 = 0;
      goto LABEL_15;
    }
  }
  sub_2478018E8();
  __break(1u);
}

void sub_2477F4DA8()
{
  v0 = (__CFString *)sub_2478016C8();
  v1 = (void *)sub_247801768();
  char v2 = (__CFString *)sub_2478016C8();
  CFPreferencesSetAppValue(v0, v1, v2);

  v3 = (__CFString *)sub_2478016C8();
  v4 = (void *)sub_247801768();
  BOOL v5 = (__CFString *)sub_2478016C8();
  CFPreferencesSetAppValue(v3, v4, v5);
}

void sub_2477F4EB8()
{
}

void (*AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.modify(void *a1))(void **a1)
{
  v3 = malloc(0x28uLL);
  *a1 = v3;
  *((void *)v3 + 1) = v1;
  swift_getKeyPath();
  *((void *)v3 + 2) = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *(void *)v3 = v1;
  *((void *)v3 + 3) = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  sub_2477F4C04((char *)v3 + 32);
  return sub_2477F4FB8;
}

void sub_2477F4FB8(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  void *v1 = v1[1];
  sub_247801528();
  swift_release();
  free(v1);
}

uint64_t AirPlayAndHandoffSettingsState.transferToHomePodEnabled.getter()
{
  return sub_2477F9250((uint64_t)&unk_247801FC8, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled);
}

uint64_t sub_2477F5094@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F9304(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled, a2);
}

unsigned __int8 *sub_2477F50A8(unsigned __int8 *result, void *a2)
{
  if (*result != *(unsigned __int8 *)(*a2
                                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
    sub_247801528();
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

uint64_t AirPlayAndHandoffSettingsState.transferToHomePodEnabled.setter(uint64_t result)
{
  if (*(unsigned char *)(v1
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled) != (result & 1))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
    sub_247801528();
    return swift_release();
  }
  return result;
}

void sub_2477F52D0(uint64_t a1, char a2)
{
  *(unsigned char *)(a1
           + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled) = a2;
  if ((sub_2477FF77C() & 1) != (a2 & 1))
  {
    if (qword_269263420 != -1) {
      swift_once();
    }
    v3 = (void *)qword_269263428;
    if (qword_269263428)
    {
      v4 = (void *)sub_2478016C8();
      objc_msgSend(v3, sel_setBool_forKey_, a2 & 1, v4);
    }
  }
}

void sub_2477F5398()
{
  sub_2477F52D0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void (*AirPlayAndHandoffSettingsState.transferToHomePodEnabled.modify(void *a1))(uint64_t a1, char a2)
{
  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[3] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v4 = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled;
  *((unsigned char *)v3 + 40) = *(unsigned char *)(v1
                                 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled);
  v3[4] = v4;
  return sub_2477F54A4;
}

void sub_2477F54A4(uint64_t a1, char a2)
{
  char v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(*(void *)a1 + 40);
  if (a2)
  {
    if ((v4 ^ *(unsigned char *)(v3 + *(void *)(*(void *)a1 + 32)))) {
      goto LABEL_5;
    }
  }
  else if ((v4 ^ *(unsigned char *)(v3 + *(void *)(*(void *)a1 + 32))))
  {
LABEL_5:
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    *char v2 = v3;
    sub_247801528();
    swift_release();
  }
  free(v2);
}

uint64_t AirPlayAndHandoffSettingsState.isTogglingHandoff.getter()
{
  return sub_2477F9250((uint64_t)&unk_247801FF0, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff);
}

uint64_t sub_2477F5614@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F9304(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff, a2);
}

uint64_t sub_2477F5628()
{
  return swift_release();
}

id AirPlayAndHandoffSettingsState.handoffEnabled.getter()
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_msgSend(result, sel_isActivityContinuationAllowed);

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2477F57D8(unsigned __int8 *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id v2 = objc_msgSend(self, sel_sharedConnection);
  if (v2)
  {
    uint64_t v3 = v2;
    unsigned __int8 v4 = objc_msgSend(v2, sel_isActivityContinuationAllowed);

    *a1 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2477F58BC(char *a1)
{
  return AirPlayAndHandoffSettingsState.handoffEnabled.setter(*a1);
}

uint64_t AirPlayAndHandoffSettingsState.handoffEnabled.setter(char a1)
{
  if ((a1 & 1) != 0
    || (swift_getKeyPath(),
        sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState), sub_247801538(), swift_release(), v1 = objc_msgSend(self, sel_sharedPreferences), unsigned int v2 = objc_msgSend(v1, sel_enabled), v1, !v2))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
    sub_247801528();
  }
  else
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_247801528();
    swift_release();
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_247801528();
  }
  return swift_release();
}

id AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.getter()
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id v0 = objc_msgSend(self, sel_sharedPreferences);
  id v1 = objc_msgSend(v0, sel_enabled);

  return v1;
}

uint64_t AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.setter()
{
  return swift_release();
}

void sub_2477F5D2C(char a1)
{
  id v2 = objc_msgSend(self, sel_sharedConnection);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_setBoolValue_forSetting_, a1 & 1, *MEMORY[0x263F53718]);
  }
  else
  {
    __break(1u);
  }
}

uint64_t (*AirPlayAndHandoffSettingsState.handoffEnabled.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 8) = v1;
  swift_getKeyPath();
  *(void *)a1 = v1;
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id result = (uint64_t (*)(uint64_t))objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    unsigned __int8 v4 = result;
    unsigned __int8 v5 = objc_msgSend(result, sel_isActivityContinuationAllowed);

    *(unsigned char *)(a1 + 16) = v5;
    return sub_2477F5EA8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2477F5EA8(uint64_t a1)
{
  return AirPlayAndHandoffSettingsState.handoffEnabled.setter(*(unsigned char *)(a1 + 16));
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidTapDontAllowHandoff()()
{
}

void sub_2477F5FF4()
{
  id v0 = objc_msgSend(self, sel_sharedConnection);
  if (v0)
  {
    uint64_t v1 = v0;
    objc_msgSend(v0, sel_setBoolValue_forSetting_, 0, *MEMORY[0x263F53718]);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidCancelForTurnOffHandoff()()
{
}

uint64_t AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.getter()
{
  return sub_2477F9D40((uint64_t)&unk_247802068, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert);
}

uint64_t sub_2477F6144@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F9E0C(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert, a2);
}

uint64_t sub_2477F6158()
{
  return swift_release();
}

void (*AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[5] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_247801558();
  swift_release();
  swift_beginAccess();
  return sub_2477F6358;
}

void sub_2477F6358(void **a1)
{
}

uint64_t AirPlayAndHandoffSettingsState.onenessDevices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2477F6428@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  unsigned __int8 v4 = (void *)(v3 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__onenessDevices);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2477F64F4()
{
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.onenessDevices.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2477F66A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__onenessDevices);
  swift_beginAccess();
  void *v3 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*AirPlayAndHandoffSettingsState.onenessDevices.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[5] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_247801558();
  swift_release();
  swift_beginAccess();
  return sub_2477F6848;
}

void sub_2477F6848(void **a1)
{
}

uint64_t sub_2477F6854()
{
  return swift_retain();
}

uint64_t sub_2477F6900@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  *a2 = *(void *)(v3
                  + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager);
  return swift_retain();
}

uint64_t sub_2477F69B4()
{
  return swift_release();
}

void sub_2477F6A94(unsigned __int8 *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id v2 = objc_msgSend(self, sel_sharedPreferences);
  unsigned __int8 v3 = objc_msgSend(v2, sel_enabled);

  *a1 = v3;
}

uint64_t sub_2477F6B70()
{
  return swift_release();
}

void sub_2477F6C3C()
{
  sub_2477F5D2C(*(unsigned char *)(v0 + 16));
}

void sub_2477F6C58()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2477F6C70()
{
  return sub_247800DE0(&OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert);
}

uint64_t sub_2477F6C90()
{
  return sub_2477F66A8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.setter()
{
  return swift_release();
}

void sub_2477F6D78(char a1)
{
  id v2 = objc_msgSend(self, sel_sharedPreferences);
  objc_msgSend(v2, sel_setEnabled_, a1 & 1);
}

void sub_2477F6DE0()
{
  sub_2477F6D78(*(unsigned char *)(v0 + 16));
}

void (*AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.modify(void *a1))(void **a1)
{
  unsigned __int8 v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[3] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id v4 = objc_msgSend(self, sel_sharedPreferences);
  unsigned __int8 v5 = objc_msgSend(v4, sel_enabled);

  *((unsigned char *)v3 + 32) = v5;
  return sub_2477F6F10;
}

void sub_2477F6F10(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  void *v1 = v1[1];
  sub_247801528();
  swift_release();
  free(v1);
}

uint64_t AirPlayAndHandoffSettingsState.continuityCameraEnabled.getter()
{
  return FigContinuityCaptureGetUserPreferenceDisabled() ^ 1;
}

uint64_t sub_2477F707C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t result = FigContinuityCaptureGetUserPreferenceDisabled();
  *a1 = result ^ 1;
  return result;
}

uint64_t sub_2477F7128()
{
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.continuityCameraEnabled.setter()
{
  return swift_release();
}

uint64_t sub_2477F72C0()
{
  return FigContinuityCaptureSetUserPreferenceDisabled();
}

void (*AirPlayAndHandoffSettingsState.continuityCameraEnabled.modify(void *a1))(void **a1)
{
  unsigned __int8 v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[3] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  *((unsigned char *)v3 + 32) = FigContinuityCaptureGetUserPreferenceDisabled() ^ 1;
  return sub_2477F73D8;
}

void sub_2477F73D8(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  void *v1 = v1[1];
  sub_247801528();
  swift_release();
  free(v1);
}

id sub_2477F74A0()
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture);
  return v1;
}

id sub_2477F7558@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id v4 = *(void **)(v3
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture);
  *a2 = v4;
  return v4;
}

void sub_2477F7618(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  id v2 = v1;
  sub_247801528();
  swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.isContinuityCameraSupported.getter()
{
  return AVGestaltGetBoolAnswer();
}

id AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.getter()
{
  return objc_msgSend(self, sel_listeningForAlternateBonjourBrowsing);
}

id sub_2477F7854@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id result = objc_msgSend(self, sel_listeningForAlternateBonjourBrowsing);
  *a1 = (_BYTE)result;
  return result;
}

uint64_t sub_2477F7910()
{
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.setter()
{
  return swift_release();
}

id sub_2477F7AA8()
{
  return sub_247800D5C();
}

void (*AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[3] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  *((unsigned char *)v3 + 32) = objc_msgSend(self, sel_listeningForAlternateBonjourBrowsing);
  return sub_2477F7BB4;
}

void sub_2477F7BB4(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  void *v1 = v1[1];
  sub_247801528();
  swift_release();
  free(v1);
}

id AirPlayAndHandoffSettingsState.accessMode.getter()
{
  return objc_msgSend(self, sel_getAdvertisingAccessMode);
}

id sub_2477F7D30@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  id result = objc_msgSend(self, sel_getAdvertisingAccessMode);
  *a1 = result;
  return result;
}

uint64_t sub_2477F7DEC()
{
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.accessMode.setter()
{
  return swift_release();
}

void sub_2477F7F9C(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  v8[0] = 0;
  unsigned int v3 = objc_msgSend(self, sel_setAdvertisingAccessMode_withError_, a1, v8);
  char v4 = v3;
  if (v3)
  {
    id v5 = v8[0];
  }
  else
  {
    id v6 = v8[0];
    v7 = (void *)sub_2478012F8();

    swift_willThrow();
  }
  *a2 = v4 ^ 1;
}

void sub_2477F8070(unsigned char *a1@<X8>)
{
  sub_2477F7F9C(*(void *)(v1 + 16), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void (*AirPlayAndHandoffSettingsState.accessMode.modify(void *a1))(void **a1)
{
  unsigned int v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[2] = v1;
  swift_getKeyPath();
  v3[3] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  v3[1] = v1;
  v3[4] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  void *v3 = objc_msgSend(self, sel_getAdvertisingAccessMode);
  return sub_2477F81C8;
}

void sub_2477F81C8(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  v1[1] = v1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269263480);
  sub_247801528();
  swift_release();
  free(v1);
}

uint64_t AirPlayAndHandoffSettingsState.airPlayPassword.getter()
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t result = sub_2477FF940();
  if (!v1) {
    return 0;
  }
  return result;
}

uint64_t sub_2477F835C@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t result = sub_2477FF940();
  if (v3) {
    uint64_t v4 = result;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = 0xE000000000000000;
  if (v3) {
    unint64_t v5 = v3;
  }
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t sub_2477F8414()
{
  return notify_post("com.apple.airplay.prefsChanged");
}

uint64_t AirPlayAndHandoffSettingsState.airPlayPassword.setter()
{
  return notify_post("com.apple.airplay.prefsChanged");
}

void sub_2477F85E4(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_247801718();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v9 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    uint64_t v15 = sub_2478016C8();
    uint64_t v16 = a1;
    unint64_t v17 = a2;
    sub_247801708();
    sub_247800D08();
    sub_247801848();
    uint64_t v18 = v2;
    char v10 = *(void (**)(char *, uint64_t))(v6 + 8);
    v10(v8, v5);
    uint64_t v16 = a1;
    unint64_t v17 = a2;
    sub_247801708();
    sub_247801828();
    v10(v8, v5);
    Boolean v11 = (void *)v15;
    APSSettingsSetCString();

    swift_bridgeObjectRelease();
    v12 = (void *)sub_2478016C8();
    APSSettingsSetValue();

    uint64_t v13 = (void *)sub_2478016C8();
    APSSettingsSetValue();
  }
}

void (*AirPlayAndHandoffSettingsState.airPlayPassword.modify(void *a1))(void **a1, char a2)
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  v3[2] = v1;
  v3[5] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v4 = sub_2477FF940();
  if (v5) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = 0xE000000000000000;
  if (v5) {
    unint64_t v7 = v5;
  }
  void *v3 = v6;
  v3[1] = v7;
  return sub_2477F88E8;
}

void sub_2477F88E8(void **a1, char a2)
{
  unint64_t v3 = *a1;
  swift_getKeyPath();
  v3[2] = v3[3];
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_247801528();
    swift_bridgeObjectRelease();
    swift_release();
    notify_post("com.apple.airplay.prefsChanged");
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_247801528();
    swift_bridgeObjectRelease();
    swift_release();
    notify_post("com.apple.airplay.prefsChanged");
  }
  free(v3);
}

uint64_t AirPlayAndHandoffSettingsState.secureFieldPassword.getter()
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2477F8AFC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v4 = (void *)(v3
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a2 = *v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2477F8BC8()
{
  return swift_bridgeObjectRelease();
}

uint64_t AirPlayAndHandoffSettingsState.secureFieldPassword.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2477F8D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword);
  swift_beginAccess();
  *uint64_t v5 = a2;
  v5[1] = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*AirPlayAndHandoffSettingsState.secureFieldPassword.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[5] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_247801558();
  swift_release();
  swift_beginAccess();
  return sub_2477F8F2C;
}

void sub_2477F8F2C(void **a1)
{
}

uint64_t AirPlayAndHandoffSettingsState.showPasswordAlert.getter()
{
  return sub_2477F9D40((uint64_t)&unk_2478021A8, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert);
}

uint64_t sub_2477F8F4C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F9E0C(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert, a2);
}

uint64_t sub_2477F8F60()
{
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.showPasswordAlert.setter()
{
  return swift_release();
}

void (*AirPlayAndHandoffSettingsState.showPasswordAlert.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[5] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_247801558();
  swift_release();
  swift_beginAccess();
  return sub_2477F9230;
}

void sub_2477F9230(void **a1)
{
}

uint64_t AirPlayAndHandoffSettingsState.isTogglingRequirePassword.getter()
{
  return sub_2477F9250((uint64_t)&unk_2478021D0, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword);
}

uint64_t sub_2477F9250(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_2477F92F0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F9304(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword, a2);
}

uint64_t sub_2477F9304@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  uint64_t result = swift_release();
  *a3 = *(unsigned char *)(v5 + *a2);
  return result;
}

uint64_t sub_2477F93B8()
{
  return swift_release();
}

BOOL AirPlayAndHandoffSettingsState.requirePassword.getter()
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v0 = sub_2477FF940();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v0;
  unint64_t v3 = v1;
  swift_bridgeObjectRelease();
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = v2 & 0xFFFFFFFFFFFFLL;
  }
  return v4 != 0;
}

BOOL sub_2477F955C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = AirPlayAndHandoffSettingsState.requirePassword.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2477F958C(char *a1)
{
  return AirPlayAndHandoffSettingsState.requirePassword.setter(*a1);
}

uint64_t AirPlayAndHandoffSettingsState.requirePassword.setter(char a1)
{
  if (a1)
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
    sub_247801528();
    swift_release();
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
  }
  else
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  }
  sub_247801528();
  swift_release();
  return notify_post("com.apple.airplay.prefsChanged");
}

void sub_2477F97FC()
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801528();
  swift_release();
  uint64_t v0 = (void *)sub_2478016C8();
  APSSettingsRemoveValue();

  unint64_t v1 = (void *)sub_2478016C8();
  APSSettingsSetValue();

  uint64_t v2 = (void *)sub_2478016C8();
  APSSettingsSetValue();
}

uint64_t (*AirPlayAndHandoffSettingsState.requirePassword.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = AirPlayAndHandoffSettingsState.requirePassword.getter();
  return sub_2477F99AC;
}

uint64_t sub_2477F99AC(uint64_t a1)
{
  return AirPlayAndHandoffSettingsState.requirePassword.setter(*(unsigned char *)(a1 + 8));
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidTapCancelRequirePassword()()
{
  if (!AirPlayAndHandoffSettingsState.requirePassword.getter())
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
    sub_247801528();
    swift_release();
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801528();
  swift_release();
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidOKRequirePassword()()
{
}

uint64_t AirPlayAndHandoffSettingsState.isContinuityRestricted.getter()
{
  return sub_2477F9D40((uint64_t)&unk_247802220, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted);
}

uint64_t sub_2477F9D40(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v4 = (unsigned __int8 *)(v2 + *a2);
  swift_beginAccess();
  return *v4;
}

uint64_t sub_2477F9DF8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F9E0C(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted, a2);
}

uint64_t sub_2477F9E0C@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  uint64_t v6 = (unsigned char *)(v5 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v6;
  return result;
}

uint64_t sub_2477F9ED8()
{
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.isContinuityRestricted.setter()
{
  return swift_release();
}

void (*AirPlayAndHandoffSettingsState.isContinuityRestricted.modify(void *a1))(void **a1)
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  void *v3 = v1;
  v3[5] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_247801558();
  swift_release();
  swift_beginAccess();
  return sub_2477FA1A8;
}

void sub_2477FA1A8(void **a1)
{
}

void sub_2477FA1B4(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  void *v1 = v1[3];
  swift_getKeyPath();
  sub_247801548();
  swift_release();
  free(v1);
}

id sub_2477FA230()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AirPlayAndHandoffSettingsState()), sel_init);
  qword_269263418 = (uint64_t)result;
  return result;
}

id AirPlayAndHandoffSettingsState.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static AirPlayAndHandoffSettingsState.shared.getter()
{
  if (qword_269263410 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269263418;
  return v0;
}

void sub_2477FA2F4()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v1 = (void *)sub_2478016C8();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_269263428 = (uint64_t)v2;
}

uint64_t static AirPlayAndHandoffSettingsState.sharingUserDefaults.getter()
{
  if (qword_269263420 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269263428;
  id v1 = (id)qword_269263428;
  return v0;
}

id AirPlayAndHandoffSettingsState.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692634A8);
  MEMORY[0x270FA5388]();
  unint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff] = 0;
  v0[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert] = 0;
  *(void *)&v0[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__onenessDevices] = MEMORY[0x263F8EE78];
  sub_247801628();
  uint64_t v4 = v0;
  *(void *)&v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager] = sub_247801618();
  uint64_t v5 = (void *)*MEMORY[0x263EF98C0];
  *(void *)&v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture] = *MEMORY[0x263EF98C0];
  id v6 = v5;
  uint64_t v7 = sub_2477FF940();
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = 0xE000000000000000;
  if (v8) {
    unint64_t v10 = v8;
  }
  Boolean v11 = (uint64_t *)&v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword];
  *Boolean v11 = v9;
  v11[1] = v10;
  v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert] = 0;
  v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword] = 0;
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v13 = result;
    unsigned __int8 v14 = objc_msgSend(result, sel_isBoolSettingLockedDownByRestrictions_, *MEMORY[0x263F53718]);

    v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted] = v14;
    sub_247801568();
    v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled] = sub_2477FF77C() & 1;

    v29.receiver = v4;
    v29.super_class = ObjectType;
    id v15 = objc_msgSendSuper2(&v29, sel_init);
    uint64_t v16 = sub_2478017A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
    unint64_t v17 = (void *)swift_allocObject();
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = v15;
    id v18 = v15;
    sub_2477FBA44((uint64_t)v3, (uint64_t)&unk_2692634C0, (uint64_t)v17);
    swift_release();
    v19 = self;
    id v20 = objc_msgSend(v19, sel_defaultCenter);
    id v21 = v18;
    v22 = (void *)sub_2478016C8();
    objc_msgSend(v20, sel_addObserver_selector_name_object_, v21, sel_transferToHomePodEnabledDidChange, v22, 0);

    id v23 = objc_msgSend(v19, sel_defaultCenter);
    id v24 = v21;
    v25 = (void *)sub_2478016C8();
    objc_msgSend(v23, sel_addObserver_selector_name_object_, v24, sel_profileNotification_, v25, 0);

    id v26 = objc_msgSend(v19, sel_defaultCenter);
    id v27 = v24;
    v28 = (void *)sub_2478016C8();
    objc_msgSend(v26, sel_addObserver_selector_name_object_, v27, sel_profileNotification_, v28, 0);

    return v27;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2477FA788()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_247801004;
  return sub_2477FA818();
}

uint64_t sub_2477FA818()
{
  v1[9] = v0;
  uint64_t v2 = sub_2478015A8();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692635D0);
  v1[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692635D8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  uint64_t v3 = sub_2478015C8();
  v1[18] = v3;
  v1[19] = *(void *)(v3 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692635E0);
  v1[23] = v4;
  v1[24] = *(void *)(v4 - 8);
  v1[25] = swift_task_alloc();
  uint64_t v5 = sub_2478015F8();
  v1[26] = v5;
  v1[27] = *(void *)(v5 - 8);
  v1[28] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692635E8);
  v1[29] = v6;
  v1[30] = *(void *)(v6 - 8);
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2477FAAFC, 0, 0);
}

uint64_t sub_2477FAAFC()
{
  uint64_t v1 = v0[9];
  swift_getKeyPath();
  v0[33] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  v0[2] = v1;
  v0[34] = sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  v0[35] = *(void *)(v1
                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692635F0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_247801F60;
  swift_retain();
  sub_2478015E8();
  sub_2478015D8();
  v0[3] = v2;
  sub_2477FFF00(&qword_2692635F8, MEMORY[0x263F66FF0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269263600);
  sub_247800C04(&qword_269263608, &qword_269263600);
  sub_247801868();
  sub_247801628();
  sub_2477FFF00(&qword_269263610, MEMORY[0x263F67008]);
  uint64_t v4 = sub_247801778();
  return MEMORY[0x270FA2498](sub_2477FAD4C, v4, v3);
}

uint64_t sub_2477FAD4C()
{
  uint64_t v2 = v0[27];
  uint64_t v1 = v0[28];
  uint64_t v3 = v0[26];
  sub_247801608();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_2477FADEC, 0, 0);
}

uint64_t sub_2477FADEC()
{
  if (qword_269263438 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247801658();
  *(void *)(v0 + 288) = __swift_project_value_buffer(v1, (uint64_t)qword_269263F80);
  uint64_t v2 = sub_247801638();
  os_log_type_t v3 = sub_2478017D8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2477F2000, v2, v3, "Fetching for devices", v4, 2u);
    MEMORY[0x24C55F0B0](v4, -1, -1);
  }
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v5 = *(void *)(v0 + 256);
  uint64_t v7 = *(void *)(v0 + 232);
  uint64_t v8 = *(void *)(v0 + 240);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
  *(void *)(v0 + 296) = swift_getOpaqueTypeConformance2();
  sub_2478017B8();
  *(_DWORD *)(v0 + 320) = *MEMORY[0x263F66FB8];
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v10;
  *unint64_t v10 = v0;
  v10[1] = sub_2477FB004;
  uint64_t v11 = *(void *)(v0 + 184);
  return MEMORY[0x270FA1E88](v0 + 32, 0, 0, v0 + 40, v11, AssociatedConformanceWitness);
}

uint64_t sub_2477FB004()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2477FB7DC;
  }
  else {
    uint64_t v2 = sub_2477FB118;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2477FB118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(v6 + 32);
  if (v7)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    v55 = (uint64_t *)(v6 + 56);
    *(void *)(v6 + 56) = MEMORY[0x263F8EE78];
    uint64_t v9 = *(void *)(v7 + 16);
    if (v9)
    {
      unint64_t v10 = 0;
      uint64_t v60 = *(void *)(v7 + 16);
      uint64_t v61 = v7;
      while (1)
      {
        if (v10 >= *(void *)(v7 + 16))
        {
          __break(1u);
          return MEMORY[0x270FA1E88](a1, a2, a3, a4, a5, a6);
        }
        uint64_t v15 = *(void *)(v6 + 168);
        unint64_t v14 = *(void *)(v6 + 176);
        uint64_t v17 = *(void *)(v6 + 144);
        uint64_t v16 = *(void *)(v6 + 152);
        id v18 = *(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16);
        v16 += 16;
        uint64_t v62 = *(void *)(v16 + 56);
        unint64_t v63 = (*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64);
        v18(v14, v7 + v63 + v62 * v10, v17);
        char v19 = sub_247801598();
        v18(v15, v14, v17);
        if ((v19 & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v20 = *(unsigned int *)(v6 + 320);
        uint64_t v22 = *(void *)(v6 + 128);
        uint64_t v21 = *(void *)(v6 + 136);
        uint64_t v24 = *(void *)(v6 + 104);
        uint64_t v23 = *(void *)(v6 + 112);
        uint64_t v25 = *(void *)(v6 + 80);
        uint64_t v26 = *(void *)(v6 + 88);
        sub_247801588();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 104))(v22, v20, v25);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v22, 0, 1, v25);
        uint64_t v27 = v23 + *(int *)(v24 + 48);
        sub_247800C48(v21, v23, &qword_2692635D8);
        sub_247800C48(v22, v27, &qword_2692635D8);
        v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48);
        if (v28(v23, 1, v25) == 1) {
          break;
        }
        uint64_t v34 = *(void *)(v6 + 80);
        sub_247800C48(*(void *)(v6 + 112), *(void *)(v6 + 120), &qword_2692635D8);
        if (v28(v27, 1, v34) == 1)
        {
          (*(void (**)(void, void))(*(void *)(v6 + 88) + 8))(*(void *)(v6 + 120), *(void *)(v6 + 80));
          uint64_t v7 = v61;
LABEL_5:
          uint64_t v11 = *(void *)(v6 + 128);
          uint64_t v12 = *(void *)(v6 + 136);
          sub_247800CAC(*(void *)(v6 + 112), &qword_2692635D0);
          sub_247800CAC(v11, &qword_2692635D8);
          sub_247800CAC(v12, &qword_2692635D8);
          uint64_t v9 = v60;
LABEL_6:
          uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 + 152) + 8);
          v13(*(void *)(v6 + 168), *(void *)(v6 + 144));
          goto LABEL_7;
        }
        uint64_t v35 = *(void *)(v6 + 152);
        uint64_t v58 = *(void *)(v6 + 144);
        uint64_t v59 = *(void *)(v6 + 168);
        uint64_t v36 = *(void *)(v6 + 120);
        uint64_t v56 = *(void *)(v6 + 128);
        uint64_t v57 = *(void *)(v6 + 136);
        uint64_t v37 = *(void *)(v6 + 112);
        uint64_t v38 = *(void *)(v6 + 88);
        uint64_t v39 = *(void *)(v6 + 96);
        uint64_t v40 = *(void *)(v6 + 80);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v39, v27, v40);
        sub_2477FFF00(&qword_269263618, MEMORY[0x263F66FC0]);
        char v41 = sub_2478016B8();
        v42 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
        v42(v36, v40);
        v42(v39, v40);
        sub_247800CAC(v37, &qword_2692635D8);
        sub_247800CAC(v56, &qword_2692635D8);
        sub_247800CAC(v57, &qword_2692635D8);
        uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
        v13(v59, v58);
        uint64_t v9 = v60;
        uint64_t v7 = v61;
        if (v41) {
          goto LABEL_16;
        }
LABEL_7:
        a1 = ((uint64_t (*)(void, void))v13)(*(void *)(v6 + 176), *(void *)(v6 + 144));
LABEL_8:
        if (v9 == ++v10)
        {
          uint64_t v8 = *v55;
          goto LABEL_22;
        }
      }
      uint64_t v7 = v61;
      if (v28(v27, 1, *(void *)(v6 + 80)) == 1)
      {
        uint64_t v29 = *(void *)(v6 + 168);
        uint64_t v30 = *(void *)(v6 + 144);
        uint64_t v31 = *(void *)(v6 + 152);
        uint64_t v33 = *(void *)(v6 + 128);
        uint64_t v32 = *(void *)(v6 + 136);
        sub_247800CAC(*(void *)(v6 + 112), &qword_2692635D8);
        sub_247800CAC(v33, &qword_2692635D8);
        sub_247800CAC(v32, &qword_2692635D8);
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
        uint64_t v9 = v60;
LABEL_16:
        v43 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 + 152) + 32);
        v43(*(void *)(v6 + 160), *(void *)(v6 + 176), *(void *)(v6 + 144));
        uint64_t v44 = *(void *)(v6 + 56);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2477FF410(0, *(void *)(v44 + 16) + 1, 1);
          uint64_t v44 = *v55;
        }
        unint64_t v46 = *(void *)(v44 + 16);
        unint64_t v45 = *(void *)(v44 + 24);
        if (v46 >= v45 >> 1)
        {
          sub_2477FF410(v45 > 1, v46 + 1, 1);
          uint64_t v44 = *v55;
        }
        uint64_t v47 = *(void *)(v6 + 160);
        uint64_t v48 = *(void *)(v6 + 144);
        *(void *)(v44 + 16) = v46 + 1;
        a1 = v43(v44 + v63 + v46 * v62, v47, v48);
        *(void *)(v6 + 56) = v44;
        goto LABEL_8;
      }
      goto LABEL_5;
    }
LABEL_22:
    uint64_t v49 = *(void *)(v6 + 72);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    uint64_t v50 = swift_task_alloc();
    *(void *)(v50 + 16) = v49;
    *(void *)(v50 + 24) = v8;
    *(void *)(v6 + 64) = v49;
    sub_247801528();
    swift_release();
    swift_release();
    swift_task_dealloc();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v52 = (void *)swift_task_alloc();
    *(void *)(v6 + 304) = v52;
    void *v52 = v6;
    v52[1] = sub_2477FB004;
    a5 = *(void *)(v6 + 184);
    a1 = v6 + 32;
    a2 = 0;
    a3 = 0;
    a4 = v6 + 40;
    a6 = AssociatedConformanceWitness;
    return MEMORY[0x270FA1E88](a1, a2, a3, a4, a5, a6);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v6 + 192) + 8))(*(void *)(v6 + 200), *(void *)(v6 + 184));
    (*(void (**)(void, void))(*(void *)(v6 + 240) + 8))(*(void *)(v6 + 256), *(void *)(v6 + 232));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v53 = *(uint64_t (**)(void))(v6 + 8);
    return v53();
  }
}

uint64_t sub_2477FB7DC()
{
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  uint64_t v1 = (void *)v0[5];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_247801638();
  os_log_type_t v5 = sub_2478017C8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v9;
    sub_247801808();
    void *v7 = v9;

    _os_log_impl(&dword_2477F2000, v4, v5, "Could not fetch devices %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692634D0);
    swift_arrayDestroy();
    MEMORY[0x24C55F0B0](v7, -1, -1);
    MEMORY[0x24C55F0B0](v6, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[30] + 8))(v0[32], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_2477FBA44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2478017A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_247801798();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_247800CAC(a1, &qword_2692634A8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247801778();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2477FBC14()
{
  if (qword_269263420 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_269263428;
  if (qword_269263428)
  {
    id v2 = (void *)sub_2478016C8();
    id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

    if (v3)
    {
      sub_247801858();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v12, 0, 32);
    }
    sub_247800A14((uint64_t)v12, (uint64_t)&v13);
    if (*((void *)&v14 + 1))
    {
      sub_247800CAC((uint64_t)&v13, &qword_269263588);
      uint64_t v4 = (void *)qword_269263428;
      if (!qword_269263428) {
        goto LABEL_16;
      }
      char v5 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_247800CAC((uint64_t)&v13, &qword_269263588);
  uint64_t v4 = (void *)qword_269263428;
  if (!qword_269263428) {
    goto LABEL_16;
  }
  char v5 = 0;
LABEL_13:
  uint64_t v6 = (void *)sub_2478016C8();
  unsigned int v7 = objc_msgSend(v4, sel_BOOLForKey_, v6);

  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)(v0
                   + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled) & 1) != 0)
      return;
    goto LABEL_17;
  }
  if (v7 != *(unsigned __int8 *)(v0
                                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled))
  {
LABEL_17:
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath, v9, v10, v11);
    *(void *)&long long v13 = v0;
    sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
    sub_247801528();
    swift_release();
  }
}

uint64_t sub_2477FBEC4(uint64_t a1)
{
  uint64_t v2 = sub_247801678();
  uint64_t v30 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v3, v4, v5);
  unsigned int v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247801698();
  uint64_t v28 = *(void *)(v8 - 8);
  uint64_t v29 = v8;
  MEMORY[0x270FA5388](v8, v9, v10, v11);
  long long v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2478012C8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14, v17, v18, v19);
  sub_2478008CC(0, &qword_269263568);
  uint64_t v20 = (void *)sub_2478017E8();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v14);
  unint64_t v21 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v22 + v21, (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  uint64_t v23 = v27;
  *(void *)(v22 + ((v16 + v21 + 7) & 0xFFFFFFFFFFFFFFF8)) = v27;
  aBlock[4] = sub_247800828;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2477FC514;
  aBlock[3] = &block_descriptor;
  uint64_t v24 = _Block_copy(aBlock);
  id v25 = v23;
  swift_release();
  sub_247801688();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2477FFF00(&qword_269263570, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269263578);
  sub_247800C04(&qword_269263580, &qword_269263578);
  sub_247801868();
  MEMORY[0x24C55EA70](0, v13, v7, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v29);
}

void sub_2477FC27C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_2478012B8();
  if (v3)
  {
    uint64_t v4 = v3;
    *(void *)&long long v18 = sub_2478016F8();
    *((void *)&v18 + 1) = v5;
    sub_247801898();
    if (*(void *)(v4 + 16) && (unint64_t v6 = sub_2477FF670((uint64_t)v16), (v7 & 1) != 0))
    {
      sub_24780095C(*(void *)(v4 + 56) + 32 * v6, (uint64_t)&v18);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_247800908((uint64_t)v16);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_247800C48((uint64_t)&v18, (uint64_t)v16, &qword_269263588);
  if (v16[3])
  {
    sub_2478008CC(0, &qword_269263590);
    if (swift_dynamicCast())
    {
      id v8 = v17;
      unsigned int v9 = objc_msgSend(v17, sel_intValue);
      if (v9 == getpid())
      {
        sub_247800CAC((uint64_t)&v18, &qword_269263588);

        return;
      }
      id v10 = objc_msgSend(self, sel_sharedConnection);
      if (!v10)
      {
        __break(1u);
        return;
      }
      uint64_t v11 = v10;
      objc_msgSend(v10, sel_isBoolSettingLockedDownByRestrictions_, *MEMORY[0x263F53718]);

      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath, v13, v14, v15);
      v16[0] = a2;
      sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
      sub_247801528();
      swift_release();
    }
  }
  else
  {
    sub_247800CAC((uint64_t)v16, &qword_269263588);
  }
  sub_247800CAC((uint64_t)&v18, &qword_269263588);
}

uint64_t sub_2477FC514(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.unpair(device:)(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_2478014B8();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2477FC700, 0, 0);
}

uint64_t sub_2477FC700()
{
  if (qword_269263438 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247801658();
  v0[9] = __swift_project_value_buffer(v1, (uint64_t)qword_269263F80);
  uint64_t v2 = sub_247801638();
  os_log_type_t v3 = sub_2478017D8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2477F2000, v2, v3, "Trying to unpair device", v4, 2u);
    MEMORY[0x24C55F0B0](v4, -1, -1);
  }
  uint64_t v5 = v0[5];

  swift_getKeyPath();
  v0[2] = v5;
  sub_2477FFF00(&qword_269263450, (void (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState);
  sub_247801538();
  swift_release();
  v0[10] = *(void *)(v5
                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager);
  swift_retain();
  sub_2478015B8();
  unsigned int v9 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F66FD8] + MEMORY[0x263F66FD8]);
  unint64_t v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  *unint64_t v6 = v0;
  v6[1] = sub_2477FC914;
  uint64_t v7 = v0[8];
  return v9(v7);
}

uint64_t sub_2477FC914()
{
  uint64_t v2 = *(void *)(*v1 + 64);
  uint64_t v3 = *(void *)(*v1 + 56);
  uint64_t v4 = *(void *)(*v1 + 48);
  uint64_t v5 = *v1;
  *(void *)(v5 + 96) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2477FCAD8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2477FCAD8()
{
  uint64_t v1 = (void *)v0[12];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_247801638();
  os_log_type_t v5 = sub_2478017C8();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (void *)v0[12];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v10;
    sub_247801808();
    void *v8 = v10;

    _os_log_impl(&dword_2477F2000, v4, v5, "Error while trying to unpair device %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692634D0);
    swift_arrayDestroy();
    MEMORY[0x24C55F0B0](v8, -1, -1);
    MEMORY[0x24C55F0B0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[12];
  }
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t AirPlayAndHandoffSettingsState.durationOf(start:end:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2478014A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v4, v6, v7, v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12, v13, v14);
  uint64_t v16 = (char *)&v37 - v15;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  objc_msgSend(v17, sel_setAllowedUnits_, 112);
  objc_msgSend(v17, sel_setUnitsStyle_, 3);
  long long v18 = (void *)sub_247801478();
  long long v19 = (void *)sub_247801478();
  id v20 = objc_msgSend(v17, sel_stringFromDate_toDate_, v18, v19);

  if (v20)
  {
    uint64_t v21 = sub_2478016F8();
  }
  else
  {
    if (qword_269263438 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_247801658();
    __swift_project_value_buffer(v22, (uint64_t)qword_269263F80);
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v23(v16, a1, v4);
    v23(v11, a2, v4);
    uint64_t v24 = sub_247801638();
    os_log_type_t v25 = sub_2478017C8();
    int v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v42 = v40;
      *(_DWORD *)uint64_t v27 = 136315394;
      os_log_t v38 = (os_log_t)(v27 + 4);
      sub_2477FFF00(&qword_2692634D8, MEMORY[0x263F07490]);
      int v39 = v26;
      uint64_t v28 = sub_247801918();
      uint64_t v41 = sub_2477FEDB8(v28, v29, &v42);
      sub_247801808();
      swift_bridgeObjectRelease();
      os_log_t v38 = v24;
      uint64_t v30 = *(void (**)(char *, uint64_t))(v5 + 8);
      v30(v16, v4);
      *(_WORD *)(v27 + 12) = 2080;
      uint64_t v31 = sub_247801918();
      uint64_t v41 = sub_2477FEDB8(v31, v32, &v42);
      sub_247801808();
      swift_bridgeObjectRelease();
      v30(v11, v4);
      os_log_t v33 = v38;
      _os_log_impl(&dword_2477F2000, v38, (os_log_type_t)v39, "Dates are invalid. Start: %s End: %s", (uint8_t *)v27, 0x16u);
      uint64_t v34 = v40;
      swift_arrayDestroy();
      MEMORY[0x24C55F0B0](v34, -1, -1);
      MEMORY[0x24C55F0B0](v27, -1, -1);
    }
    else
    {
      uint64_t v35 = *(void (**)(char *, uint64_t))(v5 + 8);
      v35(v16, v4);
      v35(v11, v4);
    }
    return 0;
  }
  return v21;
}

uint64_t AirPlayAndHandoffSettingsState.formatStartDate(start:)(uint64_t a1)
{
  uint64_t v192 = a1;
  uint64_t v149 = sub_2478013B8();
  uint64_t v148 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149, v1, v2, v3);
  v147 = (char *)&v146 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = sub_2478013F8();
  uint64_t v169 = *(void *)(v170 - 8);
  MEMORY[0x270FA5388](v170, v5, v6, v7);
  v168 = (char *)&v146 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_247801388();
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164, v9, v10, v11);
  v160 = (char *)&v146 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = sub_247801398();
  uint64_t v165 = *(void *)(v166 - 8);
  MEMORY[0x270FA5388](v166, v13, v14, v15);
  v161 = (char *)&v146 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = sub_247801358();
  uint64_t v156 = *(void *)(v158 - 8);
  MEMORY[0x270FA5388](v158, v17, v18, v19);
  v155 = (char *)&v146 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_2478013D8();
  uint64_t v152 = *(void *)(v153 - 8);
  MEMORY[0x270FA5388](v153, v21, v22, v23);
  v151 = (char *)&v146 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_247801418();
  uint64_t v183 = *(void *)(v167 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v167, v25, v26, v27);
  v146 = (char *)&v146 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v28, v30, v31, v32);
  v150 = (char *)&v146 - v34;
  uint64_t v38 = MEMORY[0x270FA5388](v33, v35, v36, v37);
  v154 = (char *)&v146 - v39;
  uint64_t v43 = MEMORY[0x270FA5388](v38, v40, v41, v42);
  v157 = (char *)&v146 - v44;
  uint64_t v48 = MEMORY[0x270FA5388](v43, v45, v46, v47);
  v159 = (char *)&v146 - v49;
  MEMORY[0x270FA5388](v48, v50, v51, v52);
  v162 = (char *)&v146 - v53;
  uint64_t v54 = sub_2478014F8();
  uint64_t v55 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54, v56, v57, v58);
  v181 = (char *)&v146 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_247801438();
  uint64_t v179 = *(void *)(v60 - 8);
  uint64_t v180 = v60;
  MEMORY[0x270FA5388](v60, v61, v62, v63);
  v175 = (char *)&v146 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_247801458();
  uint64_t v174 = *(void *)(v176 - 8);
  MEMORY[0x270FA5388](v176, v65, v66, v67);
  v172 = (char *)&v146 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_247801468();
  uint64_t v177 = *(void *)(v69 - 8);
  uint64_t v178 = v69;
  MEMORY[0x270FA5388](v69, v70, v71, v72);
  v173 = (char *)&v146 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = sub_2478012E8();
  uint64_t v74 = *(void *)(v191 - 8);
  MEMORY[0x270FA5388](v191, v75, v76, v77);
  v79 = (char *)&v146 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_2478014A8();
  uint64_t v188 = *(void *)(v80 - 8);
  uint64_t v189 = v80;
  uint64_t v84 = MEMORY[0x270FA5388](v80, v81, v82, v83);
  v86 = (char *)&v146 - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = MEMORY[0x270FA5388](v84, v87, v88, v89);
  v92 = (char *)&v146 - v91;
  MEMORY[0x270FA5388](v90, v93, v94, v95);
  v97 = (char *)&v146 - v96;
  uint64_t v98 = sub_247801518();
  uint64_t v186 = *(void *)(v98 - 8);
  uint64_t v187 = v98;
  MEMORY[0x270FA5388](v98, v99, v100, v101);
  v103 = (char *)&v146 - ((v102 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2478014E8();
  sub_247801488();
  v190 = v97;
  sub_2478014C8();
  sub_2478014C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692634E0);
  uint64_t v104 = v55;
  unint64_t v105 = (*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
  uint64_t v106 = swift_allocObject();
  *(_OWORD *)(v106 + 16) = xmmword_247801F70;
  uint64_t v107 = *MEMORY[0x263F07870];
  uint64_t v182 = v104;
  v171 = *(void (**)(unint64_t, uint64_t, uint64_t))(v104 + 104);
  v171(v106 + v105, v107, v54);
  sub_2477FFF48(v106);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v184 = v86;
  v185 = v92;
  sub_2478014D8();
  swift_bridgeObjectRelease();
  uint64_t v108 = sub_2478012D8();
  LOBYTE(v104) = v109;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v79, v191);
  if (v104) {
    goto LABEL_12;
  }
  if (v108 < 0)
  {
    BOOL v111 = __OFSUB__(0, v108);
    uint64_t v108 = -v108;
    if (v111)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      return result;
    }
  }
  if (v108 <= 1)
  {
    v127 = v172;
    sub_247801448();
    v128 = v175;
    sub_247801428();
    v129 = v173;
    sub_247801268();
    (*(void (**)(char *, uint64_t))(v179 + 8))(v128, v180);
    (*(void (**)(char *, uint64_t))(v174 + 8))(v127, v176);
    sub_2477FFF00(&qword_2692634E8, MEMORY[0x263F07338]);
    uint64_t v130 = v178;
    sub_247801498();
    (*(void (**)(char *, uint64_t))(v177 + 8))(v129, v130);
    uint64_t v131 = v189;
    v132 = *(void (**)(char *, uint64_t))(v188 + 8);
    v132(v184, v189);
    v132(v185, v131);
    v132(v190, v131);
    (*(void (**)(char *, uint64_t))(v186 + 8))(v103, v187);
  }
  else
  {
    uint64_t v112 = *MEMORY[0x263F078A0];
    v113 = v181;
    v114 = (void (*)(char *, uint64_t, uint64_t))v171;
    v171((unint64_t)v181, v112, v54);
    uint64_t v115 = sub_247801508();
    v116 = *(void (**)(char *, uint64_t))(v182 + 8);
    v116(v113, v54);
    v114(v113, v112, v54);
    v117 = v190;
    uint64_t v118 = sub_247801508();
    uint64_t v119 = ((uint64_t (*)(char *, uint64_t))v116)(v113, v54);
    v120 = (void (**)(char *, uint64_t))(v183 + 8);
    v121 = v103;
    if (v115 == v118)
    {
      v122 = v150;
      MEMORY[0x24C55E4F0](v119);
      v123 = v151;
      sub_2478013C8();
      v124 = v154;
      sub_247801338();
      (*(void (**)(char *, uint64_t))(v152 + 8))(v123, v153);
      v125 = *v120;
      uint64_t v126 = v167;
      (*v120)(v122, v167);
    }
    else
    {
      v133 = v146;
      MEMORY[0x24C55E4F0](v119);
      v134 = v147;
      sub_2478013A8();
      v135 = v150;
      sub_247801328();
      (*(void (**)(char *, uint64_t))(v148 + 8))(v134, v149);
      v125 = *v120;
      uint64_t v126 = v167;
      (*v120)(v133, v167);
      v136 = v151;
      sub_2478013C8();
      v124 = v154;
      sub_247801338();
      (*(void (**)(char *, uint64_t))(v152 + 8))(v136, v153);
      v125(v135, v126);
    }
    v137 = v155;
    sub_247801348();
    v138 = v157;
    sub_247801308();
    (*(void (**)(char *, uint64_t))(v156 + 8))(v137, v158);
    v125(v124, v126);
    v139 = v160;
    sub_247801378();
    v140 = v161;
    sub_247801368();
    (*(void (**)(char *, uint64_t))(v163 + 8))(v139, v164);
    v141 = v159;
    sub_247801318();
    (*(void (**)(char *, uint64_t))(v165 + 8))(v140, v166);
    v125(v138, v126);
    v142 = v168;
    sub_2478013E8();
    v143 = v162;
    sub_247801408();
    (*(void (**)(char *, uint64_t))(v169 + 8))(v142, v170);
    v125(v141, v126);
    sub_2477FFF00(&qword_2692634F0, MEMORY[0x263F07258]);
    sub_247801498();
    v125(v143, v126);
    uint64_t v144 = v189;
    v145 = *(void (**)(char *, uint64_t))(v188 + 8);
    v145(v184, v189);
    v145(v185, v144);
    v145(v117, v144);
    (*(void (**)(char *, uint64_t))(v186 + 8))(v121, v187);
  }
  return v193;
}

id AirPlayAndHandoffSettingsState.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void AirPlayMode.id.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

BOOL static AirPlayMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AirPlayMode.hash(into:)()
{
  return sub_247801948();
}

void *static AirPlayMode.allCases.getter()
{
  return &unk_26FBC41B0;
}

uint64_t AirPlayMode.hashValue.getter()
{
  return sub_247801958();
}

BOOL sub_2477FE118(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2477FE12C()
{
  return sub_247801958();
}

uint64_t sub_2477FE174()
{
  return sub_247801948();
}

uint64_t sub_2477FE1A0()
{
  return sub_247801958();
}

void sub_2477FE1E4(void *a1@<X8>)
{
  *a1 = &unk_26FBC41D8;
}

void sub_2477FE1F4(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2477FE200(uint64_t a1, uint64_t a2)
{
  return sub_2477FE77C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2477FE21C(uint64_t a1, id *a2)
{
  uint64_t result = sub_2478016D8();
  *a2 = 0;
  return result;
}

uint64_t sub_2477FE2B0(uint64_t a1, id *a2)
{
  char v3 = sub_2478016E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2477FE350@<X0>(uint64_t *a1@<X8>)
{
  sub_2478016F8();
  objc_super v2 = (void *)sub_2478016C8();
  swift_bridgeObjectRelease();
  sub_2478016F8();
  uint64_t v3 = sub_2478016C8();

  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_2477FE3B4(uint64_t a1, uint64_t a2)
{
  return sub_2477FE910(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2477FE3CC(uint64_t a1, id *a2)
{
  uint64_t result = sub_2478016D8();
  *a2 = 0;
  return result;
}

uint64_t sub_2477FE444(uint64_t a1, id *a2)
{
  char v3 = sub_2478016E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2477FE4C4@<X0>(uint64_t *a1@<X8>)
{
  sub_2478016F8();
  uint64_t v2 = sub_2478016C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2477FE508()
{
  sub_2478016F8();
  uint64_t v0 = (void *)sub_2478016C8();
  swift_bridgeObjectRelease();
  sub_2478016F8();
  uint64_t v1 = (void *)sub_2478016C8();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_2478016F8();
  uint64_t v4 = v3;
  if (v2 == sub_2478016F8() && v4 == v5) {
    char v6 = 1;
  }
  else {
    char v6 = sub_247801928();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6 & 1;
}

uint64_t sub_2477FE5DC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_2478016F8();
  uint64_t v4 = sub_2478016C8();

  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_2477FE62C@<X0>(uint64_t *a1@<X8>)
{
  sub_2478016F8();
  uint64_t v2 = sub_2478016C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2477FE674(uint64_t a1)
{
  uint64_t v2 = sub_2477FFF00(&qword_269263550, type metadata accessor for AVGestaltBoolQuestion);
  uint64_t v3 = sub_2477FFF00(&qword_269263558, type metadata accessor for AVGestaltBoolQuestion);
  uint64_t v4 = sub_2477FFF00(&qword_269263560, type metadata accessor for AVGestaltQuestion);
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2477FE764(uint64_t a1, uint64_t a2)
{
  return sub_2477FE77C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2477FE77C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  sub_2478016F8();
  uint64_t v4 = (void *)sub_2478016C8();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_2478016F8();
  uint64_t v6 = a3(v5);

  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2477FE7E8()
{
  sub_2478016F8();
  uint64_t v0 = (void *)sub_2478016C8();
  swift_bridgeObjectRelease();
  sub_2478016F8();
  sub_247801738();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2477FE864()
{
  sub_2478016F8();
  uint64_t v0 = (void *)sub_2478016C8();
  swift_bridgeObjectRelease();
  sub_2478016F8();
  sub_247801938();
  sub_247801738();
  uint64_t v1 = sub_247801958();

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2477FE8F8(uint64_t a1, uint64_t a2)
{
  return sub_2477FE910(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2477FE910(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2478016F8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2477FE954()
{
  sub_2478016F8();
  sub_247801738();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2477FE9A8()
{
  sub_2478016F8();
  sub_247801938();
  sub_247801738();
  uint64_t v0 = sub_247801958();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2477FEA1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2478016C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2477FEA64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2478016F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2477FEA90(uint64_t a1)
{
  uint64_t v2 = sub_2477FFF00(&qword_269263560, type metadata accessor for AVGestaltQuestion);
  uint64_t v3 = sub_2477FFF00(&qword_269263650, type metadata accessor for AVGestaltQuestion);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2477FEB4C()
{
  return sub_2477FE508();
}

uint64_t sub_2477FEB58()
{
  uint64_t v0 = sub_2478016F8();
  uint64_t v2 = v1;
  if (v0 == sub_2478016F8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_247801928();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2477FEBE4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2477FECC0;
  return v6(a1);
}

uint64_t sub_2477FECC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2477FEDB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2477FEE8C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24780095C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24780095C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2477FEE8C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_247801818();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2477FF048(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_2478018C8();
  if (!v8)
  {
    sub_2478018D8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2478018F8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2477FF048(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2477FF0E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2477FF2C0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2477FF2C0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2477FF0E0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_2477FF258(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2478018B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2478018D8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247801748();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2478018F8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2478018D8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2477FF258(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692635B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2477FF2C0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692635B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2478018F8();
  __break(1u);
  return result;
}

uint64_t sub_2477FF410(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2477FF430(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2477FF430(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269263620);
  uint64_t v10 = *(void *)(sub_2478015C8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2478015C8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2478018F8();
  __break(1u);
  return result;
}

unint64_t sub_2477FF670(uint64_t a1)
{
  uint64_t v2 = sub_247801878();
  return sub_2477FF6B4(a1, v2);
}

unint64_t sub_2477FF6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2478009B8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C55EB00](v9, a1);
      sub_247800908((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2477FF77C()
{
  if (qword_269263420 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269263428;
  if (qword_269263428)
  {
    uint64_t v1 = (void *)sub_2478016C8();
    id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

    if (v2)
    {
      sub_247801858();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v8, 0, sizeof(v8));
    }
    sub_247800A14((uint64_t)v8, (uint64_t)&v9);
    if (*((void *)&v10 + 1))
    {
      sub_247800CAC((uint64_t)&v9, &qword_269263588);
      uint64_t v3 = (void *)qword_269263428;
      uint64_t v4 = 1;
      if (!qword_269263428) {
        return v4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_247800CAC((uint64_t)&v9, &qword_269263588);
  uint64_t v3 = (void *)qword_269263428;
  if (!qword_269263428) {
    return 1;
  }
  LOBYTE(v4) = 0;
LABEL_13:
  size_t v5 = (void *)sub_2478016C8();
  id v6 = objc_msgSend(v3, sel_BOOLForKey_, v5);

  if ((v4 & 1) == 0) {
    return 1;
  }
  return (uint64_t)v6;
}

uint64_t sub_2477FF8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
LABEL_9:
    __break(1u);
    return MEMORY[0x270F9D6B0](a1, a2);
  }
  uint64_t v3 = a1;
  int v4 = *(unsigned __int8 *)(a1 + 32);
  a1 += 32;
  if (v4)
  {
    a2 = 0;
    uint64_t v5 = v2 - 1;
    uint64_t v6 = v3 + 33;
    while (v5 != a2)
    {
      if (!*(unsigned __int8 *)(v6 + a2++)) {
        return MEMORY[0x270F9D6B0](a1, a2);
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  a2 = 0;
  return MEMORY[0x270F9D6B0](a1, a2);
}

uint64_t sub_2477FF940()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_247801298();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247801758();
  *(void *)(v4 + 16) = 64;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  int v22 = sub_247801668();
  uint64_t v5 = (void *)sub_2478016C8();
  APSSettingsGetCString();

  int v6 = v22;
  if (v6 != sub_247801668())
  {
    if (qword_269263440 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_247801658();
    __swift_project_value_buffer(v16, (uint64_t)qword_269263F98);
    unint64_t v17 = sub_247801638();
    os_log_type_t v18 = sub_2478017C8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_2477F2000, v17, v18, "Could not get AirPlay Receiver password", v19, 2u);
      MEMORY[0x24C55F0B0](v19, -1, -1);
    }
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_2477FF8F8(v7, v8);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  v21[0] = v9;
  v21[1] = v11;
  swift_bridgeObjectRetain();
  sub_247801288();
  sub_247800D08();
  uint64_t v12 = sub_247801838();
  unint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (!v15)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v9;
}

void sub_2477FFC10()
{
  sub_2477F85E4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2477FFC2C()
{
  return sub_2477F8D88(v0[2], v0[3], v0[4]);
}

uint64_t sub_2477FFC4C()
{
  return sub_247800DE0(&OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert);
}

void sub_2477FFC6C()
{
}

void sub_2477FFC88()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2477FFCA0()
{
  return sub_247800DE0(&OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted);
}

uint64_t sub_2477FFCC0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2477FFD00()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2477FFDD4;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_247801004;
  return sub_2477FA818();
}

uint64_t sub_2477FFDD4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2477FFF00(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2477FFF48(uint64_t a1)
{
  uint64_t v2 = sub_2478014F8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v2, v4, v5, v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10, v11, v12);
  uint64_t v43 = (char *)&v36 - v13;
  uint64_t v14 = *(void *)(a1 + 16);
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269263598);
    uint64_t v15 = sub_2478018A8();
    uint64_t v16 = 0;
    os_log_type_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v17 = v3 + 16;
    uint64_t v41 = v18;
    uint64_t v42 = v15 + 56;
    uint64_t v19 = *(unsigned __int8 *)(v17 + 64);
    uint64_t v38 = v14;
    uint64_t v39 = a1 + ((v19 + 32) & ~v19);
    uint64_t v20 = *(void *)(v17 + 56);
    uint64_t v21 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v37 = (uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 16);
    while (1)
    {
      uint64_t v40 = v16;
      v41(v43, v39 + v20 * v16, v2);
      sub_2477FFF00(&qword_2692635A0, MEMORY[0x263F07908]);
      uint64_t v22 = sub_2478016A8();
      uint64_t v23 = ~(-1 << *(unsigned char *)(v15 + 32));
      unint64_t v24 = v22 & v23;
      unint64_t v25 = (v22 & (unint64_t)v23) >> 6;
      uint64_t v26 = *(void *)(v42 + 8 * v25);
      uint64_t v27 = 1 << (v22 & v23);
      if ((v27 & v26) != 0)
      {
        while (1)
        {
          uint64_t v28 = v17;
          v41(v9, *(void *)(v15 + 48) + v24 * v20, v2);
          sub_2477FFF00(&qword_2692635A8, MEMORY[0x263F07908]);
          char v29 = sub_2478016B8();
          uint64_t v30 = *v21;
          (*v21)(v9, v2);
          if (v29) {
            break;
          }
          unint64_t v24 = (v24 + 1) & v23;
          unint64_t v25 = v24 >> 6;
          uint64_t v26 = *(void *)(v42 + 8 * (v24 >> 6));
          uint64_t v27 = 1 << v24;
          uint64_t v17 = v28;
          if ((v26 & (1 << v24)) == 0) {
            goto LABEL_8;
          }
        }
        v30(v43, v2);
        uint64_t v17 = v28;
      }
      else
      {
LABEL_8:
        uint64_t v31 = v43;
        *(void *)(v42 + 8 * v25) = v27 | v26;
        uint64_t result = (*v37)(*(void *)(v15 + 48) + v24 * v20, v31, v2);
        uint64_t v33 = *(void *)(v15 + 16);
        BOOL v34 = __OFADD__(v33, 1);
        uint64_t v35 = v33 + 1;
        if (v34)
        {
          __break(1u);
          return result;
        }
        *(void *)(v15 + 16) = v35;
      }
      uint64_t v16 = v40 + 1;
      if (v40 + 1 == v38) {
        return v15;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

unint64_t sub_247800264()
{
  unint64_t result = qword_2692634F8;
  if (!qword_2692634F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692634F8);
  }
  return result;
}

uint64_t sub_2478002B8()
{
  return sub_247800C04(&qword_269263500, &qword_269263508);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_247800340()
{
  unint64_t result = qword_269263510;
  if (!qword_269263510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269263510);
  }
  return result;
}

uint64_t sub_247800394()
{
  return type metadata accessor for AirPlayAndHandoffSettingsState();
}

uint64_t sub_24780039C()
{
  uint64_t result = sub_247801578();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AirPlayMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AirPlayMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2478005DCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_247800604(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_247800610(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AirPlayMode()
{
  return &type metadata for AirPlayMode;
}

void type metadata accessor for APRKAdvertisingAccessMode(uint64_t a1)
{
}

void type metadata accessor for AVGestaltBoolQuestion(uint64_t a1)
{
}

uint64_t sub_247800650()
{
  return sub_2477FFF00(&qword_269263538, type metadata accessor for AVGestaltBoolQuestion);
}

uint64_t sub_247800698()
{
  return sub_2477FFF00(&qword_269263540, type metadata accessor for AVGestaltBoolQuestion);
}

uint64_t sub_2478006E0()
{
  return sub_2477FFF00(&qword_269263548, type metadata accessor for AVGestaltBoolQuestion);
}

void type metadata accessor for AVGestaltQuestion(uint64_t a1)
{
}

void sub_24780073C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_247800784()
{
  uint64_t v1 = sub_2478012C8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

void sub_247800828()
{
  uint64_t v1 = *(void *)(sub_2478012C8() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_2477FC27C(v0 + v2, v3);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2478008CC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_247800908(uint64_t a1)
{
  return a1;
}

uint64_t sub_24780095C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2478009B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_247800A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269263588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_247800AD0()
{
  *(void *)(*(void *)(v0 + 16)
            + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_247800B14()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247800B4C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2477FFDD4;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692635B8 + dword_2692635B8);
  return v6(a1, v4);
}

uint64_t sub_247800C04(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247800C48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247800CAC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_247800D08()
{
  unint64_t result = qword_269263628;
  if (!qword_269263628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269263628);
  }
  return result;
}

id sub_247800D5C()
{
  return objc_msgSend(self, sel_setListeningForAlternateBonjourBrowsing_, *(unsigned __int8 *)(v0 + 16));
}

void sub_247800DA0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture);
  *(void *)(v1
            + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture) = v2;
  id v4 = v2;
}

uint64_t sub_247800DE0(void *a1)
{
  char v2 = *(unsigned char *)(v1 + 24);
  uint64_t v3 = (unsigned char *)(*(void *)(v1 + 16) + *a1);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = v2;
  return result;
}

uint64_t sub_247800E3C()
{
  return sub_2477FFF00(&qword_269263638, type metadata accessor for AVGestaltQuestion);
}

uint64_t sub_247800E84()
{
  return sub_2477FFF00(&qword_269263640, type metadata accessor for AVGestaltQuestion);
}

uint64_t sub_247800ECC()
{
  return sub_2477FFF00(&qword_269263648, type metadata accessor for AVGestaltQuestion);
}

void sub_247800F14()
{
}

void sub_247800F2C()
{
}

void sub_247800F44(unsigned char *a1@<X8>)
{
}

uint64_t sub_247800F5C()
{
  return sub_2477F72C0();
}

void sub_247800F74()
{
}

void sub_247800F8C()
{
}

uint64_t sub_247800FA4()
{
  return sub_2477F6C90();
}

void sub_247800FBC()
{
}

void sub_247800FD4()
{
}

uint64_t sub_247800FEC()
{
  return sub_2477FFC2C();
}

uint64_t sub_247801008()
{
  return swift_deallocClassInstance();
}

id sub_247801018()
{
  type metadata accessor for FindAirPlayAndHandoffSettingsSupportClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269263658 = (uint64_t)result;
  return result;
}

id static NSBundle.airPlayAndHandoffSettingsSupport.getter()
{
  if (qword_269263430 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269263658;
  return v0;
}

uint64_t type metadata accessor for FindAirPlayAndHandoffSettingsSupportClass()
{
  return self;
}

uint64_t sub_2478010F0()
{
  uint64_t v0 = sub_247801658();
  __swift_allocate_value_buffer(v0, qword_269263F80);
  __swift_project_value_buffer(v0, (uint64_t)qword_269263F80);
  swift_bridgeObjectRetain();
  return sub_247801648();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2478011DC()
{
  uint64_t v0 = sub_247801658();
  __swift_allocate_value_buffer(v0, qword_269263F98);
  __swift_project_value_buffer(v0, (uint64_t)qword_269263F98);
  swift_bridgeObjectRetain();
  return sub_247801648();
}

uint64_t sub_247801268()
{
  return MEMORY[0x270EEDD00]();
}

uint64_t sub_247801278()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_247801288()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_247801298()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2478012A8()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_2478012B8()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_2478012C8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2478012D8()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_2478012E8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2478012F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247801308()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_247801318()
{
  return MEMORY[0x270EF0430]();
}

uint64_t sub_247801328()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_247801338()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_247801348()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_247801358()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_247801368()
{
  return MEMORY[0x270EF04D8]();
}

uint64_t sub_247801378()
{
  return MEMORY[0x270EF04F0]();
}

uint64_t sub_247801388()
{
  return MEMORY[0x270EF0508]();
}

uint64_t sub_247801398()
{
  return MEMORY[0x270EF0518]();
}

uint64_t sub_2478013A8()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_2478013B8()
{
  return MEMORY[0x270EF0568]();
}

uint64_t sub_2478013C8()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_2478013D8()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_2478013E8()
{
  return MEMORY[0x270EF05A0]();
}

uint64_t sub_2478013F8()
{
  return MEMORY[0x270EF05B8]();
}

uint64_t sub_247801408()
{
  return MEMORY[0x270EF0690]();
}

uint64_t sub_247801418()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_247801428()
{
  return MEMORY[0x270EF08F0]();
}

uint64_t sub_247801438()
{
  return MEMORY[0x270EF0908]();
}

uint64_t sub_247801448()
{
  return MEMORY[0x270EF0918]();
}

uint64_t sub_247801458()
{
  return MEMORY[0x270EF0920]();
}

uint64_t sub_247801468()
{
  return MEMORY[0x270EF0938]();
}

uint64_t sub_247801478()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_247801488()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_247801498()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_2478014A8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2478014B8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2478014C8()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_2478014D8()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_2478014E8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2478014F8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_247801508()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_247801518()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_247801528()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_247801538()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_247801548()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_247801558()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_247801568()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_247801578()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_247801588()
{
  return MEMORY[0x270F5CBC0]();
}

uint64_t sub_247801598()
{
  return MEMORY[0x270F5CBC8]();
}

uint64_t sub_2478015A8()
{
  return MEMORY[0x270F5CC08]();
}

uint64_t sub_2478015B8()
{
  return MEMORY[0x270F5CC30]();
}

uint64_t sub_2478015C8()
{
  return MEMORY[0x270F5CC50]();
}

uint64_t sub_2478015D8()
{
  return MEMORY[0x270F5CC58]();
}

uint64_t sub_2478015E8()
{
  return MEMORY[0x270F5CC60]();
}

uint64_t sub_2478015F8()
{
  return MEMORY[0x270F5CC68]();
}

uint64_t sub_247801608()
{
  return MEMORY[0x270F5CC70]();
}

uint64_t sub_247801618()
{
  return MEMORY[0x270F5CC78]();
}

uint64_t sub_247801628()
{
  return MEMORY[0x270F5CC80]();
}

uint64_t sub_247801638()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247801648()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247801658()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247801668()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_247801678()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247801688()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247801698()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2478016A8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2478016B8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2478016C8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2478016D8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2478016E8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2478016F8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247801708()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_247801718()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_247801738()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247801748()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247801758()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_247801768()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_247801778()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247801798()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2478017A8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2478017B8()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_2478017C8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2478017D8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2478017E8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2478017F8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_247801808()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247801818()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247801828()
{
  return MEMORY[0x270EF2418]();
}

uint64_t sub_247801838()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_247801848()
{
  return MEMORY[0x270EF2578]();
}

uint64_t sub_247801858()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247801868()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_247801878()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_247801888()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_247801898()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2478018A8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2478018B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2478018C8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2478018D8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2478018E8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2478018F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247801918()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247801928()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247801938()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247801948()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247801958()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t APSSettingsGetCString()
{
  return MEMORY[0x270F0BF98]();
}

uint64_t APSSettingsRemoveValue()
{
  return MEMORY[0x270F0BFD0]();
}

uint64_t APSSettingsSetCString()
{
  return MEMORY[0x270F0BFD8]();
}

uint64_t APSSettingsSetValue()
{
  return MEMORY[0x270F0BFE8]();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x270EDDFA0]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t FigContinuityCaptureGetUserPreferenceDisabled()
{
  return MEMORY[0x270F12D20]();
}

uint64_t FigContinuityCaptureSetUserPreferenceDisabled()
{
  return MEMORY[0x270F12D28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}