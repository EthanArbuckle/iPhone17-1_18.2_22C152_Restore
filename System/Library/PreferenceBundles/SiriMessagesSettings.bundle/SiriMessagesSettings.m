uint64_t sub_2D7C(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfGroup);
}

uint64_t sub_2D88(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfSpecifier);
}

uint64_t sub_2D94(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_destinationSpecifierGroup);
}

uint64_t sub_2DA0(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_headPhonesSpecifier);
}

uint64_t sub_2DAC(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_carPlaySpecifier);
}

uint64_t sub_2DB8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_listOfSubscribedLanguages) = a1;
  return sub_E6FC();
}

uint64_t sub_2DCC(uint64_t a1)
{
  v3 = (void *)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguageSpecifiers);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2E20(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguagesGroup);
}

uint64_t sub_2E2C(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguagesGroup);
}

uint64_t sub_2E38(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguageLink);
}

uint64_t sub_2E44(uint64_t a1, uint64_t a2)
{
  v3 = (void *)(v2 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguage);
  void *v3 = a1;
  v3[1] = a2;
  return sub_E6FC();
}

uint64_t sub_2E5C(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_tableView);
}

void sub_2E68()
{
  uint64_t v1 = v0;
  uint64_t v2 = 0xD000000000000023;
  [v0 setEditingButtonHidden:1 animated:0];
  unint64_t v42 = (unint64_t)&_swiftEmptyArrayStorage;
  unsigned __int8 v3 = sub_4794();
  v4 = self;
  static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000014, (void *)0x8000000000026A10);
  sub_E7C0();
  id v7 = sub_214C0(0xD000000000000023, 0x80000000000269E0, v5, v6, v4);
  sub_2D7C((uint64_t)v7);
  uint64_t v8 = OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfGroup;
  v9 = *(void **)&v0[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfGroup];
  if (!v9)
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v3) {
    v10 = (void *)0x8000000000026960;
  }
  else {
    v10 = (void *)0x8000000000026930;
  }
  if ((v3 & 1) == 0) {
    uint64_t v2 = 0xD000000000000027;
  }
  id v11 = v9;
  static MessagesSettingsUtils.getLocalizedString(_:)(v2, v10);
  swift_bridgeObjectRelease();
  NSString v12 = sub_25390();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_253A0();
  sub_E6C8(v13, v14);

  v15 = *(void **)&v1[v8];
  if (!v15) {
    goto LABEL_23;
  }
  id v16 = v15;
  sub_25400();
  if (*(void *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v42 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E88C();
  sub_25480();
  sub_25440();
  uint64_t v17 = static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000023, (void *)0x80000000000269E0);
  id v22 = sub_E738(v17, v18, (uint64_t)v1, (uint64_t)"setMessageWithoutConfEnabled:specifier:", (uint64_t)"getMessageWithoutConfEnabledWithSpecifier:", v19, v20, v21, v4);
  sub_2D88((uint64_t)v22);
  uint64_t v23 = OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfSpecifier;
  v24 = *(void **)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfSpecifier];
  if (!v24) {
    goto LABEL_24;
  }
  id v25 = v24;
  Class isa = sub_25490().super.super.isa;
  sub_253A0();
  sub_E7C0();
  sub_E538((uint64_t)isa, v27, v28, v29);

  v30 = *(void **)&v1[v23];
  if (!v30)
  {
LABEL_25:
    __break(1u);
    return;
  }
  id v31 = v30;
  sub_25400();
  if (*(void *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v42 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E88C();
  sub_25480();
  sub_25440();
  v40 = &type metadata for MultilingualReadingFlag;
  unint64_t v41 = sub_E238();
  char v32 = sub_251F0();
  sub_E284((uint64_t)v39);
  if (v32)
  {
    sub_47EC();
    sub_31C8(v33);
  }
  unint64_t v34 = v42;
  unint64_t v35 = swift_bridgeObjectRetain();
  sub_3BEC(v35, v3 & 1, 0);
  sub_E930();
  if (v1)
  {
    uint64_t v36 = sub_216E8(v1);
    if (v36)
    {
      v37 = sub_1F08C(v36);

      swift_bridgeObjectRelease();
      if (v37)
      {
        swift_bridgeObjectRelease();
        unint64_t v34 = (unint64_t)v37;
      }
    }
    else
    {
    }
  }
  unint64_t v38 = swift_bridgeObjectRetain();
  sub_1F1A8(v38);
  sub_E930();
  sub_21678((uint64_t)v1, v1);
  sub_1F1A8(v34);
  swift_bridgeObjectRelease();
}

uint64_t sub_31C8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25760();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25760();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
  }
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v5 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v5;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
    {
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFFF8;
      if (v4 + v3 <= *(void *)((char *)&dword_18 + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_12;
      }
    }
  }
  if (v5 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_256C0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v8;
    uint64_t v7 = v8 & 0xFFFFFFFFFFFFFF8;
LABEL_12:
    uint64_t result = sub_1EA5C(v7 + 8 * *(void *)(v7 + 16) + 32, (*(void *)(v7 + 24) >> 1) - *(void *)(v7 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_25760();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v13;
  }
  swift_bridgeObjectRelease();

  return sub_25440();
}

void sub_33A8()
{
  LOBYTE(v4) = 2;
  sub_254A0();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25310();
  oslog = sub_E4E0(v0, (uint64_t)qword_31D88);
  os_log_type_t v1 = sub_25550();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)sub_E49C();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "#MessagingWithSiriController error setting auto send enable setting", v2, 2u);
    sub_E414();
  }
}

NSNumber sub_3828()
{
  unsigned __int8 v1 = sub_4794();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  uint64_t v3 = sub_E4E0(v2, (uint64_t)qword_31D88);
  os_log_type_t v4 = sub_25560();
  if (sub_E644(v4))
  {
    unint64_t v5 = (uint8_t *)sub_E660();
    *(_DWORD *)unint64_t v5 = 67109120;
    sub_255F0();
    _os_log_impl(&dword_0, v3, v0, "#MessagingWithSiriController fetching autosend setting = %{BOOL}d", v5, 8u);
    sub_E414();
  }

  sub_DC98(0, &qword_315E8);
  return sub_25590(v1 & 1);
}

id sub_39A0(char a1)
{
  sub_2DB8(0);
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for MessagingWithSiriController();
  return objc_msgSendSuper2(&v4, "viewWillDisappear:", a1 & 1);
}

id sub_3A40()
{
  sub_2DB8(0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagingWithSiriController();
  return objc_msgSendSuper2(&v2, "applicationWillSuspend");
}

void sub_3AC4(char a1)
{
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for MessagingWithSiriController();
  objc_msgSendSuper2(&v9, "viewWillAppear:", a1 & 1);
  sub_DAB0(v1);
  swift_bridgeObjectRelease();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25310();
  objc_super v4 = (void *)sub_E4E0(v3, (uint64_t)qword_31D88);
  os_log_type_t v5 = sub_25560();
  if (sub_E554(v5))
  {
    uint64_t v6 = (_WORD *)sub_E49C();
    sub_E6B0(v6);
    sub_E5BC(&dword_0, v7, v8, "#MessagingWithSiriController viewWillAppear");
    sub_E414();
  }
}

id sub_3BEC(unint64_t a1, char a2, char a3)
{
  objc_super v4 = (void *)v3;
  sub_1F1A8(a1);
  id v8 = objc_allocWithZone((Class)PSSpecifierUpdates);
  uint64_t v9 = sub_E774();
  id v10 = sub_20E40(v9);
  if (!v10)
  {
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_25310();
    v44 = (void *)sub_E4E0(v43, (uint64_t)qword_31D88);
    os_log_type_t v45 = sub_25550();
    if (sub_E644(v45))
    {
      *(_WORD *)sub_E49C() = 0;
      sub_E5F0(&dword_0, v46, v47, "#MessagingWithSiriController error updating child settings for autosend");
      sub_E414();
    }
    goto LABEL_43;
  }
  if ((a2 & 1) == 0)
  {
    v48 = *(void **)(v3 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_destinationSpecifierGroup);
    if (v48)
    {
      id v49 = v48;
      sub_1F33C((uint64_t)v49, a1);
      if (v51)
      {
      }
      else
      {
        uint64_t v52 = v50;
        if (qword_31488 != -1) {
          swift_once();
        }
        uint64_t v53 = sub_25310();
        v54 = sub_E4E0(v53, (uint64_t)qword_31D88);
        os_log_type_t v55 = sub_25560();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)sub_E49C();
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_0, v54, v55, "#MessagingWithSiriController removing child settings since autosend setting is disabled", v56, 2u);
          sub_E414();
        }

        id v57 = [v4 specifierAtIndex:v52];
        [v10 removeSpecifier:v57];
      }
    }
    goto LABEL_41;
  }
  uint64_t v11 = self;
  static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000030, (void *)0x8000000000026890);
  sub_E7C0();
  sub_E6F0();
  id v16 = sub_214C0(v12, v13, v14, v15, v11);
  id result = (id)sub_2D94((uint64_t)v16);
  uint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_destinationSpecifierGroup);
  if (!v18)
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  id v19 = v18;
  sub_25400();
  sub_E948();
  if (v20) {
    sub_E59C();
  }
  sub_25480();
  sub_25440();
  uint64_t v21 = static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000027, (void *)0x80000000000268D0);
  id v26 = sub_E738(v21, v22, v3, (uint64_t)"setMessageWithoutConfHeadphonesEnabled:specifier:", (uint64_t)"getMessageWithoutConfHeadphonesEnabledWithSpecifier:", v23, v24, v25, v11);
  id result = (id)sub_2DA0((uint64_t)v26);
  uint64_t v27 = *(void **)(v3 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_headPhonesSpecifier);
  if (!v27) {
    goto LABEL_47;
  }
  id v28 = v27;
  sub_25400();
  sub_E948();
  if (v20) {
    sub_E59C();
  }
  sub_25480();
  sub_25440();
  if (sub_EEB0())
  {
LABEL_14:
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_25310();
    sub_C2FC(v38, (uint64_t)qword_31D88);
    swift_bridgeObjectRetain_n();
    v39 = sub_25300();
    os_log_type_t v40 = sub_25560();
    unint64_t v41 = &off_26000;
    if (os_log_type_enabled(v39, v40))
    {
      unint64_t v42 = (uint8_t *)sub_E46C();
      *(_DWORD *)unint64_t v42 = 134217984;
      if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
      {
        swift_bridgeObjectRetain();
        sub_25760();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_255F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v39, v40, "#MessagingWithSiriController adding %ld child settings since autosend setting is enabled", v42, 0xCu);
      sub_E414();

      unint64_t v41 = &off_26000;
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v58 = *(void **)(v3 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfSpecifier);
    if (v58)
    {
      id v59 = v58;
      sub_1F33C((uint64_t)v59, a1);
      if ((v61 & 1) == 0)
      {
        uint64_t v62 = v60;
        v63 = sub_25300();
        os_log_type_t v64 = sub_25560();
        if (os_log_type_enabled(v63, v64))
        {
          v65 = (uint8_t *)sub_E46C();
          *(_DWORD *)v65 = *((void *)v41 + 16);
          sub_255F0();
          _os_log_impl(&dword_0, v63, v64, "#MessagingWithSiriController %ld", v65, 0xCu);
          sub_E414();
        }

        sub_E520();
        v66 = sub_1F1A8((unint64_t)&_swiftEmptyArrayStorage);
        id result = (id)swift_bridgeObjectRelease();
        if (__OFADD__(v62, 1))
        {
          __break(1u);
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
        sub_21608((uint64_t)v66, v62 + 1, v10);

LABEL_41:
        id result = [v10 context];
        if (result)
        {
          v44 = result;
          [result setAnimated:a3 & 1];
LABEL_43:

          return v10;
        }
        goto LABEL_45;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  sub_E6F0();
  uint64_t v30 = static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000024, v29);
  id v35 = sub_E738(v30, v31, v3, (uint64_t)"setMessageWithoutConfCarPlayEnabled:specifier:", (uint64_t)"getMessageWithoutConfCarPlayEnabledWithSpecifier:", v32, v33, v34, v11);
  id result = (id)sub_2DAC((uint64_t)v35);
  uint64_t v36 = *(void **)(v3 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_carPlaySpecifier);
  if (v36)
  {
    id v37 = v36;
    sub_25400();
    if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
      sub_E59C();
    }
    sub_25480();
    sub_25440();
    goto LABEL_14;
  }
LABEL_48:
  __break(1u);
  return result;
}

void sub_4240(uint64_t a1, uint64_t a2)
{
}

NSNumber sub_42CC(uint64_t a1)
{
  return sub_45F0(a1, (SEL *)&selRef_getMessageWithoutConfirmationHeadphonesEnabled, "#MessagingWithSiriController fetching headphones setting = %{BOOL}d");
}

void sub_433C(uint64_t a1, uint64_t a2)
{
}

void sub_4358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  sub_254A0();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25310();
  oslog = sub_E4E0(v6, (uint64_t)qword_31D88);
  os_log_type_t v7 = sub_25550();
  if (os_log_type_enabled(oslog, v7))
  {
    id v8 = (uint8_t *)sub_E49C();
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, oslog, v7, a5, v8, 2u);
    sub_E414();
  }
}

NSNumber sub_45DC(uint64_t a1)
{
  return sub_45F0(a1, (SEL *)&selRef_getMessageWithoutConfirmationInCarPlayEnabled, "#MessagingWithSiriController fetching carplay setting = %{BOOL}d");
}

NSNumber sub_45F0(uint64_t a1, SEL *a2, const char *a3)
{
  id v6 = [self sharedPreferences];
  unsigned __int8 v7 = [v6 *a2];

  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25310();
  uint64_t v9 = sub_E4E0(v8, (uint64_t)qword_31D88);
  os_log_type_t v10 = sub_25560();
  if (sub_E580(v10))
  {
    uint64_t v11 = (uint8_t *)sub_E660();
    *(_DWORD *)uint64_t v11 = 67109120;
    sub_255F0();
    _os_log_impl(&dword_0, v9, v3, a3, v11, 8u);
    sub_E414();
  }

  sub_DC98(0, &qword_315E8);
  return sub_25590(v7);
}

id sub_4794()
{
  id v0 = [self sharedPreferences];
  id v1 = [v0 getMessageWithoutConfirmationEnabled];

  return v1;
}

void sub_47EC()
{
  uint64_t v1 = v0;
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  os_log_type_t v3 = (void *)sub_E4E0(v2, (uint64_t)qword_31D88);
  os_log_type_t v4 = sub_25560();
  if (sub_E644(v4))
  {
    *(_WORD *)sub_E49C() = 0;
    sub_E5F0(&dword_0, v5, v6, "#MessagingWithSiriController creating VoiceDownloadSettings");
    sub_E414();
  }

  unsigned __int8 v7 = self;
  uint64_t v8 = sub_E9B0((uint64_t)"READ_MESSAGES_HEADER");
  id v10 = sub_DA4C(v8, v9, v7);
  sub_2E2C((uint64_t)v10);
  uint64_t v11 = OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguagesGroup;
  uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguagesGroup);
  if (!v12)
  {
    __break(1u);
    goto LABEL_19;
  }
  id v13 = v12;
  sub_E9B0((uint64_t)"ADD_LANGUAGES_FOOTER");
  NSString v14 = sub_25390();
  swift_bridgeObjectRelease();
  sub_253A0();
  sub_E7C0();
  sub_E538((uint64_t)v14, v15, v16, v17);

  uint64_t v18 = *(void **)(v1 + v11);
  if (!v18)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v19 = v18;
  sub_25400();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_E8AC();
  }
  sub_25480();
  sub_25440();
  if (!*(void *)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_listOfSubscribedLanguages)) {
    sub_4B20();
  }
  type metadata accessor for ListOfLanguagesController();
  id v20 = [v7 preferenceSpecifierNamed:0 target:v1 set:0 get:0 detail:swift_getObjCClassFromMetadata() cell:1 edit:0];
  sub_2E38((uint64_t)v20);
  uint64_t v21 = OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguageLink;
  uint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguageLink);
  if (!v22) {
    goto LABEL_20;
  }
  type metadata accessor for AddLanguagesCell();
  id v23 = v22;
  sub_BA78(&qword_315E0);
  uint64_t v24 = sub_257D0();
  uint64_t v25 = sub_253A0();
  sub_E538(v24, v26, v25, v26);
  swift_unknownObjectRelease();

  uint64_t v27 = *(void **)(v1 + v21);
  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v28 = v27;
  Class isa = sub_25490().super.super.isa;
  uint64_t v30 = sub_253A0();
  sub_E538((uint64_t)isa, v31, v30, v31);

  if (!*(void *)(v1 + v21))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v32 = sub_253A0();
  sub_E538(0, v33, v32, v33);
  uint64_t v34 = *(void **)(v1 + v21);
  if (!v34)
  {
LABEL_23:
    __break(1u);
    return;
  }
  id v35 = v34;
  sub_25400();
  sub_E764();
  if (v36) {
    sub_E8AC();
  }
  sub_25480();
  sub_25440();
}

void sub_4B20()
{
  uint64_t v1 = v0;
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  os_log_type_t v3 = (void *)sub_E4E0(v2, (uint64_t)qword_31D88);
  os_log_type_t v4 = sub_25560();
  if (sub_E644(v4))
  {
    *(_WORD *)sub_E49C() = 0;
    sub_E5F0(&dword_0, v5, v6, "#MessagingWithSiriController getting subscribed languages");
    sub_E414();
  }

  if (qword_31448 != -1) {
    swift_once();
  }
  sub_E520();
  unsigned __int8 v7 = (void *)static MessagesSettingsUtils.daemonSession;
  *(void *)(sub_E9F0() + 16) = v1;
  id v8 = v7;
  id v9 = v1;
  sub_E6F0();
  sub_25200();
  swift_release();
}

void sub_4C74(unint64_t a1, char *a2)
{
  v93 = a2;
  uint64_t v3 = sub_25330();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v90 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_25350();
  uint64_t v89 = *(void *)(v91 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v88 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25150();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v101 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v86 - v11;
  unint64_t v120 = (unint64_t)&_swiftEmptyArrayStorage;
  id v13 = [self sharedPreferences];
  sub_DB0C(v13, (SEL *)&selRef_languageCode);
  if (v14)
  {
    uint64_t v105 = sub_DC98(0, &qword_315A0);
    id v15 = sub_14E40();
    id v16 = [v15 languageCode];

    uint64_t v102 = sub_253A0();
    os_log_t v113 = v17;

    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_25760();
      if (v18) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v18)
      {
LABEL_4:
        uint64_t v100 = sub_DC98(0, &qword_315B0);
        if (v18 >= 1)
        {
          uint64_t v86 = v4;
          uint64_t v87 = v3;
          uint64_t v20 = 0;
          unint64_t v97 = a1 & 0xC000000000000001;
          v96 = (void (**)(char *, char *, uint64_t))(v8 + 16);
          v111 = (void (**)(char *, uint64_t))(v8 + 8);
          v107 = (char *)v119 + 8;
          uint64_t v92 = PSCellClassKey;
          *(void *)&long long v19 = 136315138;
          long long v106 = v19;
          v94 = (char *)&type metadata for Any + 8;
          unint64_t v99 = a1;
          uint64_t v108 = v7;
          v103 = v12;
          uint64_t v98 = v18;
          while (1)
          {
            if (v97) {
              id v21 = (id)sub_256B0();
            }
            else {
              id v21 = *(id *)(a1 + 8 * v20 + 32);
            }
            uint64_t v22 = v21;
            id v23 = (void *)sub_252B0();
            sub_25290();

            sub_25160();
            uint64_t v24 = v101;
            if (qword_31488 != -1) {
              swift_once();
            }
            uint64_t v25 = sub_25310();
            uint64_t v26 = sub_C2FC(v25, (uint64_t)qword_31D88);
            (*v96)(v24, v12, v7);
            uint64_t v27 = sub_25300();
            os_log_type_t v28 = sub_25560();
            BOOL v29 = os_log_type_enabled(v27, v28);
            id v110 = v22;
            if (v29)
            {
              uint64_t v30 = (uint8_t *)swift_slowAlloc();
              aBlock[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v30 = v106;
              uint64_t v31 = sub_25130();
              *(void *)&v119[0] = sub_14464(v31, v32, aBlock);
              sub_255F0();
              swift_bridgeObjectRelease();
              v109 = *v111;
              v109(v24, v108);
              _os_log_impl(&dword_0, v27, v28, "#MessagingWithSiriController Locale.LanguageCode(asset.primaryLanguage) %s", v30, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              v109 = *v111;
              v109(v24, v7);
            }

            uint64_t v33 = sub_25130();
            swift_bridgeObjectRetain();
            uint64_t v112 = v33;
            id v34 = sub_14E40();
            id v35 = [v34 languageCode];

            uint64_t v36 = sub_253A0();
            unint64_t v38 = v37;

            swift_bridgeObjectRetain_n();
            v39 = sub_25300();
            os_log_type_t v40 = sub_25560();
            BOOL v41 = os_log_type_enabled(v39, v40);
            uint64_t v104 = v36;
            if (v41)
            {
              unint64_t v42 = (uint8_t *)swift_slowAlloc();
              aBlock[0] = swift_slowAlloc();
              *(_DWORD *)unint64_t v42 = v106;
              uint64_t v95 = v26;
              swift_bridgeObjectRetain();
              *(void *)&v119[0] = sub_14464(v36, v38, aBlock);
              sub_255F0();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_0, v39, v40, "#MessagingWithSiriController baseLanguage %s", v42, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            swift_bridgeObjectRetain_n();
            uint64_t v43 = sub_25300();
            os_log_type_t v44 = sub_25560();
            if (os_log_type_enabled(v43, v44))
            {
              os_log_type_t v45 = (uint8_t *)swift_slowAlloc();
              aBlock[0] = swift_slowAlloc();
              *(_DWORD *)os_log_type_t v45 = v106;
              swift_bridgeObjectRetain();
              *(void *)&v119[0] = sub_14464(v102, (unint64_t)v113, aBlock);
              sub_255F0();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_0, v43, v44, "#MessagingWithSiriController currentLanguageCode %s", v45, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            uint64_t v7 = v108;
            uint64_t v46 = sub_11CA4(v112);
            if (v47)
            {
              uint64_t v48 = v46;
              unint64_t v49 = v47;
              swift_bridgeObjectRetain();
              id v50 = sub_14E40();
              unsigned __int8 v51 = sub_11E1C();
              swift_bridgeObjectRelease();

              if ((v51 & 1) == 0)
              {
                swift_bridgeObjectRetain_n();
                uint64_t v52 = sub_25300();
                os_log_type_t v53 = sub_25560();
                if (os_log_type_enabled(v52, v53))
                {
                  v54 = (uint8_t *)swift_slowAlloc();
                  aBlock[0] = swift_slowAlloc();
                  *(_DWORD *)v54 = v106;
                  swift_bridgeObjectRetain();
                  *(void *)&v119[0] = sub_14464(v48, v49, aBlock);
                  uint64_t v7 = v108;
                  sub_255F0();
                  swift_bridgeObjectRelease_n();
                  _os_log_impl(&dword_0, v52, v53, "#MessagingWithSiriController readableString %s", v54, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {
                  swift_bridgeObjectRelease_n();
                }

                os_log_type_t v55 = self;
                type metadata accessor for ReadingVoiceListController();
                uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
                id v57 = sub_1E6BC(v48, v49, (uint64_t)v93, 0, 0, ObjCClassFromMetadata, 1, 0, v55);
                if (v57)
                {
                  v58 = v57;
                  aBlock[0] = type metadata accessor for LanguageCell();
                  sub_BA78(&qword_315D8);
                  uint64_t v59 = sub_257D0();
                  uint64_t v60 = sub_253A0();
                  sub_21444(v59, v60, v61, v58);
                  swift_unknownObjectRelease();
                  id v62 = v58;
                  sub_25400();
                  if (*(void *)((char *)&dword_10 + (v120 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                                  + (v120 & 0xFFFFFFFFFFFFFF8)) >> 1)
                    sub_25450();
                  sub_25480();
                  sub_25440();
                  if (qword_31458 != -1) {
                    swift_once();
                  }
                  swift_beginAccess();
                  sub_1CBEC();
                  swift_endAccess();
                  swift_bridgeObjectRelease();

                  uint64_t v12 = v103;
                  v109(v103, v7);
                  goto LABEL_34;
                }
              }
              v63 = v103;
              v109(v103, v7);

              swift_bridgeObjectRelease();
              uint64_t v12 = v63;
            }
            else
            {
              uint64_t v12 = v103;
              v109(v103, v7);

              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
LABEL_34:
            ++v20;
            a1 = v99;
            if (v98 == v20)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v3 = v87;
              uint64_t v4 = v86;
              goto LABEL_44;
            }
          }
        }
        __break(1u);
        goto LABEL_57;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_44:
    NSString v68 = sub_25390();
    id v69 = [v93 valueForKey:v68];

    if (v69)
    {
      sub_25620();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v119, 0, sizeof(v119));
    }
    uint64_t v70 = swift_allocObject();
    sub_C18C((uint64_t)v119, (uint64_t)aBlock);
    if (v115)
    {
      sub_BA78(&qword_31578);
      if (swift_dynamicCast())
      {
        unint64_t v71 = v118;
        *(void *)(v70 + 16) = v118;
        v72 = *(void **)&v93[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguagesGroup];
        if (v72)
        {
          swift_bridgeObjectRetain();
          id v73 = v72;
          sub_1F33C((uint64_t)v73, v71);
          uint64_t v75 = v74;
          char v77 = v76;

          swift_bridgeObjectRelease();
          if (v77)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_DC98(0, &qword_31580);
            v78 = (void *)sub_25570();
            unint64_t v79 = v120;
            v80 = (void *)swift_allocObject();
            id v81 = v93;
            v80[2] = v75;
            v80[3] = v81;
            v80[4] = v79;
            v80[5] = v70;
            v80[6] = a1;
            v116 = sub_DC88;
            v117 = v80;
            aBlock[0] = (uint64_t)_NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = (uint64_t)sub_7228;
            v115 = &unk_2CBA8;
            v82 = _Block_copy(aBlock);
            swift_bridgeObjectRetain();
            id v83 = v81;
            swift_retain();
            swift_release();
            v84 = v88;
            sub_25340();
            aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
            sub_E368((unint64_t *)&qword_31588, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
            sub_BA78(&qword_31590);
            sub_C260();
            v85 = v90;
            sub_25630();
            sub_25580();
            _Block_release(v82);

            (*(void (**)(char *, uint64_t))(v4 + 8))(v85, v3);
            (*(void (**)(char *, uint64_t))(v89 + 8))(v84, v91);
          }
          swift_release();
        }
        else
        {
          __break(1u);
        }
        return;
      }
    }
    else
    {
      sub_E09C((uint64_t)aBlock, &qword_31570);
    }
    swift_bridgeObjectRelease();
    swift_deallocUninitializedObject();
    return;
  }
  swift_bridgeObjectRelease();
  if (qword_31488 != -1) {
LABEL_57:
  }
    swift_once();
  uint64_t v64 = sub_25310();
  sub_C2FC(v64, (uint64_t)qword_31D88);
  os_log_t v113 = (os_log_t)sub_25300();
  os_log_type_t v65 = sub_25550();
  if (os_log_type_enabled(v113, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v66 = 0;
    _os_log_impl(&dword_0, v113, v65, "#MessagingWithSiriController currentLanguage is nil", v66, 2u);
    swift_slowDealloc();
  }
  os_log_t v67 = v113;
}

void sub_5CE4(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)(a4 + 16);
  uint64_t v9 = sub_25310();
  sub_C2FC(v9, (uint64_t)qword_31D88);
  uint64_t v10 = sub_25300();
  os_log_type_t v11 = sub_25560();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    v39[4] = a1;
    sub_255F0();
    _os_log_impl(&dword_0, v10, v11, "#MessagingWithSiriController adding voice group %ld", v12, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v13 = swift_bridgeObjectRetain();
  sub_2DB8(v13);
  swift_beginAccess();
  unint64_t v14 = swift_bridgeObjectRetain();
  id v15 = sub_1F1A8(v14);
  swift_bridgeObjectRelease();
  id v16 = objc_allocWithZone((Class)PSSpecifierUpdates);
  id v17 = sub_20E40((uint64_t)v15);
  if (v17)
  {
    uint64_t v18 = v17;
    [v17 removeSpecifiersInGroup:*(void *)&a2[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguagesGroup]];
    long long v19 = sub_1F1A8(a3);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else
    {
      sub_21608((uint64_t)v19, a1 + 1, v18);
      id v16 = *(id *)&a2[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguageLink];
      if (!(a3 >> 62))
      {
        uint64_t v20 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
        id v21 = v16;
        goto LABEL_9;
      }
    }
    id v38 = v16;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_25760();
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v22 = v20 + a1;
    if (__OFADD__(v20, a1))
    {
      __break(1u);
    }
    else if (!__OFADD__(v22, 1))
    {
      [v18 insertSpecifier:v16 atIndex:v22 + 1];

      id v23 = [v18 context];
      if (v23)
      {
        uint64_t v24 = v23;
        [v23 setAnimated:1];

        uint64_t v25 = sub_216E8(v18);
        if (v25)
        {
          uint64_t v26 = sub_1F08C(v25);
          swift_bridgeObjectRelease();
          if (v26)
          {
            swift_beginAccess();
            *uint64_t v8 = v26;
            swift_bridgeObjectRelease();
          }
        }
        swift_beginAccess();
        unint64_t v27 = swift_bridgeObjectRetain();
        os_log_type_t v28 = sub_1F1A8(v27);
        swift_bridgeObjectRelease();
        sub_21678((uint64_t)v28, a2);
        swift_bridgeObjectRetain_n();
        BOOL v29 = sub_25300();
        os_log_type_t v30 = sub_25560();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = (uint8_t *)swift_slowAlloc();
          v39[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = 136315138;
          sub_252C0();
          swift_bridgeObjectRetain();
          uint64_t v32 = sub_25430();
          unint64_t v34 = v33;
          swift_bridgeObjectRelease();
          sub_14464(v32, v34, v39);
          sub_255F0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v29, v30, "#MessagingWithSiriController subscribed voices %s", v31, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        return;
      }
LABEL_25:
      __break(1u);
      return;
    }
    __break(1u);
    goto LABEL_25;
  }
  id v35 = sub_25300();
  os_log_type_t v36 = sub_25550();
  if (os_log_type_enabled(v35, v36))
  {
    unint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v37 = 0;
    _os_log_impl(&dword_0, v35, v36, "#MessagingWithSiriController handleURL failed to get updates", v37, 2u);
    swift_slowDealloc();
  }
}

void sub_61B4(void *a1)
{
  id v2 = a1;
  sub_2E5C((uint64_t)a1);
  Class isa = sub_251C0().super.isa;
  id v4 = sub_E8EC((uint64_t)isa, "specifierAtIndexPath:");

  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25310();
  sub_C2FC(v5, (uint64_t)qword_31D88);
  id v12 = v4;
  uint64_t v6 = sub_25300();
  os_log_type_t v7 = sub_25560();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)sub_E46C();
    uint64_t v13 = sub_E484();
    *(_DWORD *)uint64_t v8 = 136315138;
    if (v12 && (uint64_t v9 = sub_1E75C(v12), v10))
    {
      unint64_t v11 = v10;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = 0;
      unint64_t v11 = 0xE000000000000000;
    }
    sub_14464(v9, v11, &v13);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v6, v7, "#MessagingWithSiriController endDisplaying %s", v8, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
}

uint64_t sub_64DC()
{
  sub_E9D0();
  v1[25] = v2;
  v1[26] = v0;
  uint64_t v3 = sub_25330();
  v1[27] = v3;
  sub_E508(v3);
  v1[28] = v4;
  v1[29] = swift_task_alloc();
  uint64_t v5 = sub_25350();
  v1[30] = v5;
  sub_E508(v5);
  v1[31] = v6;
  v1[32] = swift_task_alloc();
  sub_254D0();
  v1[33] = sub_254C0();
  sub_E774();
  sub_254B0();
  sub_E7C0();
  return _swift_task_switch(sub_65D8, v7, v8);
}

void sub_65D8()
{
  uint64_t v31 = v0;
  swift_release();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v1 = v0 + 25;
  uint64_t v2 = sub_25310();
  sub_C2FC(v2, (uint64_t)qword_31D88);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_25300();
  os_log_type_t v4 = sub_25560();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v27 = *v1;
    uint64_t v5 = (uint8_t *)sub_E46C();
    uint64_t v30 = sub_E484();
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[23] = v27;
    swift_bridgeObjectRetain();
    sub_BA78(&qword_31670);
    uint64_t v6 = sub_253C0();
    v0[24] = sub_14464(v6, v7, &v30);
    sub_255F0();
    sub_E7CC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v3, v4, "#MessagingWithSiriController handleURL resourceDictionary = %s", v5, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {

    sub_E7CC();
  }
  if (*v1)
  {
    v0[19] = 0x65676175676E616CLL;
    v0[20] = 0xE800000000000000;
    sub_25660();
    uint64_t v8 = sub_E720();
    sub_219A8(v8, v9, v10);
    sub_E1DC((uint64_t)(v0 + 8));
    if (v0[16])
    {
      if (swift_dynamicCast())
      {
        unint64_t v11 = v0 + 2;
        uint64_t v12 = v0[17];
        unint64_t v13 = v0[18];
        swift_bridgeObjectRetain_n();
        unint64_t v14 = sub_25300();
        os_log_type_t v15 = sub_25560();
        if (os_log_type_enabled(v14, v15))
        {
          id v16 = (uint8_t *)sub_E46C();
          uint64_t v30 = sub_E484();
          *(_DWORD *)id v16 = 136315138;
          swift_bridgeObjectRetain();
          v0[22] = sub_14464(v12, v13, &v30);
          unint64_t v11 = v0 + 2;
          sub_255F0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_0, v14, v15, "#MessagingWithSiriController handleURL language = %s", v16, 0xCu);
          swift_arrayDestroy();
          sub_E414();
          sub_E414();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v17 = v0[32];
        uint64_t v28 = v0[31];
        uint64_t v18 = v0[29];
        uint64_t v29 = v0[30];
        uint64_t v20 = v0[27];
        uint64_t v19 = v0[28];
        id v21 = (void *)v0[26];
        sub_2E44(v12, v13);
        sub_DC98(0, &qword_31580);
        uint64_t v22 = (void *)sub_25570();
        uint64_t v23 = sub_E9F0();
        *(void *)(v23 + 16) = v21;
        v0[6] = sub_E230;
        v0[7] = v23;
        v0[2] = _NSConcreteStackBlock;
        v0[3] = 1107296256;
        v0[4] = sub_7228;
        v0[5] = &unk_2CC98;
        uint64_t v24 = _Block_copy(v11);
        id v25 = v21;
        sub_25340();
        v0[21] = &_swiftEmptyArrayStorage;
        sub_E368((unint64_t *)&qword_31588, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_BA78(&qword_31590);
        sub_C260();
        sub_25630();
        sub_25580();
        _Block_release(v24);

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v17, v29);
        swift_release();
      }
    }
    else
    {
      sub_E09C((uint64_t)(v0 + 13), &qword_31570);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    sub_E72C();
    v26();
  }
  else
  {
    __break(1u);
  }
}

void sub_6B40(char *a1)
{
  NSString v2 = sub_25390();
  id v3 = [a1 valueForKey:v2];

  if (v3)
  {
    sub_25620();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v48, 0, sizeof(v48));
  }
  sub_C18C((uint64_t)v48, (uint64_t)v49);
  if (!v49[3])
  {
    sub_E09C((uint64_t)v49, &qword_31570);
    return;
  }
  sub_BA78(&qword_31578);
  if (swift_dynamicCast())
  {
    os_log_type_t v4 = (void *)v50;
    unint64_t v5 = *(void *)&a1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguage + 8];
    if (!v5) {
      goto LABEL_22;
    }
    uint64_t v6 = *(void *)&a1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguage];
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_9058(v6, v5);
    swift_bridgeObjectRelease();
    sub_2DCC(v7);
    uint64_t v8 = self;
    uint64_t v9 = static MessagesSettingsUtils.getLocalizedString(_:)(0xD00000000000001ALL, (void *)0x80000000000269C0);
    id v11 = sub_DA4C(v9, v10, v8);
    sub_2E20((uint64_t)v11);
    uint64_t v12 = *(void **)&a1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguagesGroup];
    if (v12)
    {
      unint64_t v13 = &a1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguageSpecifiers];
      swift_beginAccess();
      if (*(void *)v13)
      {
        if (*(void *)v13 >> 62)
        {
          id v46 = v12;
          swift_bridgeObjectRetain();
          uint64_t v47 = sub_25760();
          swift_bridgeObjectRelease();
          if (v47 < 0)
          {
            __break(1u);
LABEL_41:
            swift_once();
LABEL_13:
            uint64_t v19 = sub_25310();
            sub_C2FC(v19, (uint64_t)qword_31D88);
            uint64_t v20 = a1;
            id v21 = sub_25300();
            os_log_type_t v22 = sub_25560();
            if (os_log_type_enabled(v21, v22))
            {
              uint64_t v23 = swift_slowAlloc();
              v49[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v23 = 136315394;
              swift_beginAccess();
              sub_DC98(0, &qword_315D0);
              swift_bridgeObjectRetain();
              uint64_t v24 = sub_25430();
              unint64_t v26 = v25;
              swift_bridgeObjectRelease();
              sub_14464(v24, v26, v49);
              sub_255F0();
              swift_bridgeObjectRelease();
              *(_WORD *)(v23 + 12) = 2080;
              swift_bridgeObjectRetain();
              sub_BA78(&qword_31678);
              uint64_t v27 = sub_253C0();
              sub_14464(v27, v28, v49);
              sub_255F0();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_0, v21, v22, "#MessagingWithSiriController updating specifiers %s with %s", (uint8_t *)v23, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
            }
            if (*(void *)v13)
            {
              unint64_t v33 = swift_bridgeObjectRetain();
              sub_1F1A8(v33);
              swift_bridgeObjectRelease();
              v34.super.Class isa = sub_25410().super.isa;
              swift_bridgeObjectRelease();
            }
            else
            {
              v34.super.Class isa = 0;
            }
            swift_beginAccess();
            unint64_t v35 = v50;
            if (v50 >> 62)
            {
              swift_bridgeObjectRetain();
              os_log_type_t v36 = (char *)sub_25760();
              if (!v36)
              {
LABEL_33:
                swift_bridgeObjectRelease();
                [v4 insertContiguousSpecifiers:v34.super.isa afterSpecifier:v36];

                id v40 = [v4 context];
                if (v40)
                {
                  BOOL v41 = v40;
                  [v40 setAnimated:1];

                  uint64_t v42 = sub_216E8(v4);
                  if (v42)
                  {
                    uint64_t v43 = sub_1F08C(v42);
                    swift_bridgeObjectRelease();
                    if (v43) {
                      swift_bridgeObjectRelease();
                    }
                  }
                  unint64_t v44 = swift_bridgeObjectRetain();
                  os_log_type_t v45 = sub_1F1A8(v44);
                  swift_bridgeObjectRelease();
                  sub_21678((uint64_t)v45, v20);
                  swift_bridgeObjectRelease();

                  return;
                }
LABEL_48:
                __break(1u);
                return;
              }
            }
            else
            {
              os_log_type_t v36 = *(char **)((char *)&dword_10 + (v50 & 0xFFFFFFFFFFFFFF8));
              swift_bridgeObjectRetain();
              if (!v36) {
                goto LABEL_33;
              }
            }
            BOOL v37 = __OFSUB__(v36, 1);
            id v38 = v36 - 1;
            if (v37)
            {
              __break(1u);
            }
            else
            {
              sub_21214(v38, (v35 & 0xC000000000000001) == 0, v35);
              if ((v35 & 0xC000000000000001) == 0)
              {
                v39 = (char *)*(id *)(v35 + 8 * (void)v38 + 32);
LABEL_32:
                os_log_type_t v36 = v39;
                goto LABEL_33;
              }
            }
            v39 = (char *)sub_256B0();
            goto LABEL_32;
          }
        }
        else
        {
          id v14 = v12;
        }
        sub_1D208();
        swift_endAccess();
        unint64_t v15 = swift_bridgeObjectRetain();
        id v16 = sub_1F1A8(v15);
        swift_bridgeObjectRelease();
        id v17 = objc_allocWithZone((Class)PSSpecifierUpdates);
        id v18 = sub_20E40((uint64_t)v16);
        if (v18)
        {
          os_log_type_t v4 = v18;
          if (qword_31488 == -1) {
            goto LABEL_13;
          }
          goto LABEL_41;
        }
        if (qword_31488 != -1) {
          swift_once();
        }
        uint64_t v29 = sub_25310();
        sub_C2FC(v29, (uint64_t)qword_31D88);
        uint64_t v30 = sub_25300();
        os_log_type_t v31 = sub_25550();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v32 = 0;
          _os_log_impl(&dword_0, v30, v31, "#MessagingWithSiriController handleURL failed to get updates", v32, 2u);
          swift_slowDealloc();
        }

LABEL_22:
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_48;
  }
}

uint64_t sub_7228(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_72F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_254D0();
  v3[5] = sub_254C0();
  uint64_t v5 = sub_254B0();
  return _swift_task_switch(sub_7390, v5, v4);
}

uint64_t sub_7390()
{
  sub_E86C();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = _Block_copy(v2);
  if (v1) {
    uint64_t v3 = sub_25360();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 56) = v3;
  id v4 = *(id *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_7484;
  return sub_64DC();
}

uint64_t sub_7484()
{
  sub_E86C();
  sub_E454();
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v5 = *(void **)(v3 + 32);
  uint64_t v6 = *v0;
  sub_E570();
  *uint64_t v7 = v6;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v8 = *(void (***)(void))(v2 + 48);
    v8[2](v8);
    _Block_release(v8);
  }
  sub_E72C();
  return v9();
}

uint64_t sub_75B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BA78(&qword_31630);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_254F0();
  sub_DCD4((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_31640;
  v9[5] = v8;
  sub_BDEC((uint64_t)v6, (uint64_t)&unk_31650, (uint64_t)v9);
  return swift_release();
}

void sub_76B8(uint64_t a1)
{
  uint64_t v2 = v1;
  Class isa = sub_251C0().super.isa;
  v51.receiver = v1;
  v51.super_class = (Class)type metadata accessor for MessagingWithSiriController();
  objc_msgSendSuper2(&v51, "tableView:didSelectRowAtIndexPath:", a1, isa);

  Class v5 = sub_251C0().super.isa;
  id v6 = sub_E8EC((uint64_t)v5, "specifierAtIndexPath:");

  if (v6)
  {
    uint64_t v7 = sub_1E75C(v6);
    if (v8)
    {
      uint64_t v9 = v7;
      uint64_t v10 = v8;
      uint64_t v11 = &v2[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguageSpecifiers];
      sub_E520();
      if (*(void *)v11)
      {
        uint64_t v12 = qword_31458;
        swift_bridgeObjectRetain();
        if (v12 != -1) {
          swift_once();
        }
        swift_beginAccess();
        uint64_t v13 = static MessagesSettingsUtils.readableLanguageToLocaleMap;
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_21A0C(v9, v10, v13);
        uint64_t v16 = v15;
        swift_bridgeObjectRelease();
        if (v16)
        {
          swift_endAccess();
          swift_bridgeObjectRelease();
          sub_14EB4();
          char v18 = v17;
          swift_bridgeObjectRelease();
          if (v18)
          {
            if (qword_31488 != -1) {
              swift_once();
            }
            uint64_t v19 = sub_25310();
            sub_C2FC(v19, (uint64_t)qword_31D88);
            id v20 = v6;
            id v21 = sub_25300();
            os_log_type_t v22 = sub_25560();
            if (os_log_type_enabled(v21, v22))
            {
              uint64_t v23 = (_DWORD *)sub_E46C();
              id v46 = (void *)sub_E660();
              *uint64_t v23 = 138412290;
              v50[0] = v20;
              id v47 = v20;
              id v24 = v20;
              sub_255F0();
              *id v46 = v6;

              id v20 = v47;
              sub_E7A8(&dword_0, v21, v22, "#MessagingWithSiriController %@");
              sub_BA78(&qword_315C0);
              swift_arrayDestroy();
              sub_E414();
              sub_E414();
            }
            else
            {
            }
            if (qword_31440 != -1) {
              swift_once();
            }
            sub_E520();
            swift_retain();
            sub_F8CC(v14, v16, 0, 0);
            swift_bridgeObjectRelease();
            swift_release();
            NSString v25 = sub_E4B4();
            id v26 = [v2 valueForKey:v25];

            if (v26)
            {
              sub_25620();
              swift_unknownObjectRelease();
            }
            else
            {
              memset(v49, 0, sizeof(v49));
            }
            sub_C18C((uint64_t)v49, (uint64_t)v50);
            if (!v50[3])
            {

              sub_E09C((uint64_t)v50, &qword_31570);
              return;
            }
            sub_BA78(&qword_31578);
            if (swift_dynamicCast())
            {
              unint64_t v27 = v48;
              unint64_t v28 = sub_1F1A8(v48);
              id v29 = objc_allocWithZone((Class)PSSpecifierUpdates);
              id v30 = sub_20E40((uint64_t)v28);
              if (v30)
              {
                id v6 = v30;
                os_log_type_t v31 = (void *)sub_25300();
                os_log_type_t v32 = sub_25560();
                if (sub_E580(v32))
                {
                  unint64_t v33 = (_WORD *)sub_E49C();
                  sub_E6B0(v33);
                  sub_E970(&dword_0, v34, v35, "#MessagingWithSiriController removing suggested languages group");
                  sub_E414();
                }

                uint64_t v36 = OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguagesGroup;
                [v6 removeSpecifiersInGroup:*(void *)&v2[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguagesGroup]];
                [v6 removeSpecifier:*(void *)&v2[v36]];
                id v37 = [v6 context];
                if (!v37)
                {
                  __break(1u);
                  return;
                }
                id v38 = v37;
                [v37 setAnimated:1];

                uint64_t v39 = sub_216E8(v6);
                if (v39)
                {
                  sub_1F08C(v39);
                  sub_E930();
                  swift_bridgeObjectRelease();
                  unint64_t v27 = (unint64_t)v38;
                }
                id v40 = sub_1F1A8(v27);
                swift_bridgeObjectRelease();
                sub_21678((uint64_t)v40, v2);
                sub_4B20();

                goto LABEL_14;
              }
              swift_bridgeObjectRelease();
              BOOL v41 = (void *)sub_25300();
              os_log_type_t v42 = sub_25550();
              if (!sub_E554(v42))
              {

                return;
              }
              uint64_t v43 = (_WORD *)sub_E49C();
              sub_E6B0(v43);
              sub_E5BC(&dword_0, v44, v45, "#MessagingWithSiriController handleURL failed to get updates");
              sub_E414();
            }
            return;
          }
        }
        else
        {
          swift_endAccess();
          swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
    }
LABEL_14:
  }
}

void sub_7D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_BA78(&qword_31600);
  __chkstk_darwin(v8 - 8);
  sub_E610();
  uint64_t v120 = v9;
  uint64_t v10 = sub_BA78(&qword_31608);
  __chkstk_darwin(v10 - 8);
  sub_E610();
  uint64_t v119 = v11;
  uint64_t v12 = sub_BA78(&qword_31610);
  __chkstk_darwin(v12 - 8);
  sub_E610();
  uint64_t v118 = v13;
  sub_251B0();
  sub_E438();
  uint64_t v125 = v15;
  uint64_t v126 = v14;
  __chkstk_darwin(v14);
  sub_E9DC();
  v121 = v16;
  __chkstk_darwin(v17);
  v124 = (char *)&v113 - v18;
  uint64_t v19 = sub_25150();
  sub_E438();
  uint64_t v127 = v20;
  __chkstk_darwin(v21);
  sub_E9DC();
  v117 = v22;
  uint64_t v24 = __chkstk_darwin(v23);
  __chkstk_darwin(v24);
  id v26 = (char *)&v113 - v25;
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_25310();
  uint64_t v129 = sub_C2FC(v27, (uint64_t)qword_31D88);
  os_log_type_t v28 = v129;
  id v29 = sub_25300();
  os_log_type_t v30 = sub_25560();
  BOOL v31 = sub_E554(v30);
  uint64_t v128 = v19;
  if (v31)
  {
    *(_DWORD *)sub_E46C() = 134217984;
    uint64_t v19 = v128;
    v130[0] = a2;
    sub_255F0();
    sub_E7A8(&dword_0, v29, v28, "#MessagingWithSiriController editingStyle %ld");
    sub_E414();
  }

  if (a2 == 1)
  {
    uint64_t v113 = a1;
    uint64_t v114 = 1;
    Class isa = sub_251C0().super.isa;
    id v33 = [v4 specifierAtIndexPath:isa];

    id v34 = v33;
    uint64_t v35 = sub_25300();
    os_log_type_t v36 = sub_25560();
    BOOL v37 = os_log_type_enabled(v35, v36);
    id v122 = v34;
    v123 = v26;
    if (v37)
    {
      id v38 = (_DWORD *)sub_E46C();
      v130[0] = sub_E484();
      *id v38 = 136315138;
      if (v34 && (uint64_t v39 = sub_1E75C(v34), v40))
      {
        unint64_t v41 = v40;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v39 = 0;
        unint64_t v41 = 0xE000000000000000;
      }
      uint64_t v43 = sub_14464(v39, v41, v130);
      sub_E780(v43);
      sub_255F0();
      swift_bridgeObjectRelease();
      id v44 = v122;

      sub_E7A8(&dword_0, v35, v36, "#MessagingWithSiriController delete %s");
      swift_arrayDestroy();
      sub_E414();
      id v34 = v44;
      sub_E414();

      uint64_t v42 = v127;
    }
    else
    {

      uint64_t v42 = v127;
    }
    v116 = v4;
    uint64_t v115 = a3;
    if (!v34 || (sub_DB0C(v34, (SEL *)&selRef_identifier), !v45)) {
      swift_bridgeObjectRelease();
    }
    sub_25160();
    uint64_t v4 = *(void **)(v42 + 16);
    sub_E5DC();
    ((void (*)(void))v4)();
    id v46 = sub_25300();
    os_log_type_t v47 = sub_25560();
    if (os_log_type_enabled(v46, v47))
    {
      unint64_t v48 = (uint8_t *)sub_E46C();
      v130[0] = sub_E484();
      *(_DWORD *)unint64_t v48 = 136315138;
      uint64_t v49 = sub_25140();
      uint64_t v51 = sub_14464(v49, v50, v130);
      sub_E95C(v51);
      uint64_t v19 = v128;
      sub_255F0();
      swift_bridgeObjectRelease();
      uint64_t v52 = sub_E694();
      v53(v52);
      _os_log_impl(&dword_0, v46, v47, "#MessagingWithSiriController languageCode.debugDescription %s", v48, 0xCu);
      sub_E918();
      sub_E414();
      sub_E414();
    }
    else
    {
      uint64_t v54 = sub_E694();
      v55(v54);
    }

    sub_E5DC();
    ((void (*)(void))v4)();
    v56 = sub_25300();
    os_log_type_t v57 = sub_25560();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = sub_E46C();
      v117 = v4;
      uint64_t v59 = (uint8_t *)v58;
      v130[0] = sub_E484();
      *(_DWORD *)uint64_t v59 = 136315138;
      uint64_t v60 = sub_25130();
      uint64_t v62 = sub_14464(v60, v61, v130);
      sub_E780(v62);
      uint64_t v19 = v128;
      sub_255F0();
      swift_bridgeObjectRelease();
      uint64_t v4 = v117;
      sub_E754();
      v63();
      _os_log_impl(&dword_0, v56, v57, "#MessagingWithSiriController languageCode.identifier %s", v59, 0xCu);
      sub_E918();
      sub_E414();
      sub_E414();
    }
    else
    {
      sub_E754();
      v64();
    }

    uint64_t v65 = v125;
    v66 = v121;
    uint64_t v67 = v118;
    sub_E5DC();
    ((void (*)(void))v4)();
    sub_DCD4(v67, 0, 1, v19);
    uint64_t v68 = sub_251A0();
    sub_DCD4(v119, 1, 1, v68);
    uint64_t v69 = sub_25190();
    sub_DCD4(v120, 1, 1, v69);
    uint64_t v70 = v124;
    sub_E6BC();
    sub_25170();
    (*(void (**)(void (*)(void, void), char *, uint64_t))(v65 + 16))(v66, v70, v126);
    unint64_t v71 = sub_25300();
    os_log_type_t v72 = sub_25560();
    if (os_log_type_enabled(v71, v72))
    {
      id v73 = (uint8_t *)sub_E46C();
      uint64_t v4 = (void *)sub_E484();
      v130[0] = (uint64_t)v4;
      *(_DWORD *)id v73 = 136315138;
      sub_E368(&qword_31618, (void (*)(uint64_t))&type metadata accessor for Locale);
      uint64_t v74 = sub_257A0();
      uint64_t v76 = sub_14464(v74, v75, v130);
      sub_E95C(v76);
      LOBYTE(v19) = v128;
      sub_255F0();
      swift_bridgeObjectRelease();
      uint64_t v77 = sub_E678();
      v78(v77);
      _os_log_impl(&dword_0, v71, v72, "#MessagingWithSiriController locale %s", v73, 0xCu);
      sub_E808();
      sub_E414();
      sub_E414();
    }
    else
    {
      uint64_t v79 = sub_E678();
      v80(v79);
    }

    sub_E904();
    id v81 = sub_25300();
    os_log_type_t v82 = sub_25560();
    if (os_log_type_enabled(v81, v82))
    {
      id v83 = (uint8_t *)sub_E46C();
      uint64_t v4 = (void *)sub_E484();
      v130[0] = (uint64_t)v4;
      *(_DWORD *)id v83 = 136315138;
      if (qword_31458 != -1) {
        swift_once();
      }
      sub_E520();
      swift_bridgeObjectRetain();
      uint64_t v84 = sub_25370();
      unint64_t v86 = v85;
      swift_bridgeObjectRelease();
      uint64_t v87 = sub_14464(v84, v86, v130);
      sub_E878(v87);
      sub_255F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v81, v82, "#MessagingWithSiriController readableLanguageToLocaleMap %s", v83, 0xCu);
      sub_E808();
      sub_E414();
      sub_E414();

      sub_E904();
      LOBYTE(v19) = v128;
    }
    else
    {
    }
    id v88 = v122;
    if (qword_31458 != -1) {
      swift_once();
    }
    a2 = v114;
    a1 = v113;
    if (v88 && (uint64_t v89 = sub_DB0C(v88, (SEL *)&selRef_identifier), v90))
    {
      uint64_t v91 = v89;
      uint64_t v92 = v90;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v91 = 0;
      uint64_t v92 = 0xE000000000000000;
    }
    swift_beginAccess();
    sub_21A0C(v91, v92, static MessagesSettingsUtils.readableLanguageToLocaleMap);
    uint64_t v94 = v93;
    swift_bridgeObjectRelease();
    if (v94)
    {
      swift_endAccess();
      swift_bridgeObjectRetain_n();
      uint64_t v95 = sub_25300();
      os_log_type_t v96 = sub_25560();
      if (sub_E704(v96))
      {
        unint64_t v97 = (_DWORD *)sub_E46C();
        v130[0] = sub_E484();
        *unint64_t v97 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v98 = sub_E720();
        uint64_t v101 = sub_14464(v98, v99, v100);
        sub_E878(v101);
        sub_255F0();
        swift_bridgeObjectRelease_n();
        sub_E7A8(&dword_0, v95, (os_log_type_t)v19, "#MessagingWithSiriController localeFromMap %s");
        sub_E808();
        uint64_t v4 = v116;
        sub_E414();
        sub_E414();
      }
      else
      {
        sub_E7CC();
      }

      swift_bridgeObjectRetain();
      uint64_t v102 = sub_E720();
      sub_11F9C(v102, v103);
      swift_bridgeObjectRelease();
      sub_DC98(0, &qword_315A0);
      sub_E720();
      id v104 = sub_14E40();
      id v105 = [v104 languageCode];

      sub_253A0();
      long long v106 = (void *)sub_F288();
      sub_E6BC();
      sub_F3A0(v107, v108, v109);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      id v88 = v122;
    }
    else
    {
      swift_endAccess();
    }

    v121(v124, v126);
    sub_E754();
    v110();
  }
  Class v111 = sub_251C0().super.isa;
  uint64_t v112 = (objc_class *)type metadata accessor for MessagingWithSiriController();
  v131.receiver = v4;
  v131.super_class = v112;
  objc_msgSendSuper2(&v131, "tableView:commitEditingStyle:forRowAtIndexPath:", a1, a2, v111);
}

uint64_t sub_8AB8()
{
  Class isa = sub_251C0().super.isa;
  id v1 = sub_E8EC((uint64_t)isa, "specifierAtIndexPath:");

  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  sub_C2FC(v2, (uint64_t)qword_31D88);
  id v3 = v1;
  uint64_t v4 = sub_25300();
  os_log_type_t v5 = sub_25560();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)sub_E46C();
    *(void *)&long long v30 = sub_E484();
    *(_DWORD *)id v6 = 136315138;
    id v7 = v3;
    sub_BA78(&qword_315F8);
    uint64_t v8 = sub_253C0();
    *(void *)&v29[0] = sub_14464(v8, v9, (uint64_t *)&v30);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v4, v5, "#MessagingWithSiriController canEditRowAt %s", v6, 0xCu);
    sub_E918();
    sub_E414();
    sub_E414();

    if (v3) {
      goto LABEL_5;
    }
LABEL_8:
    long long v30 = 0u;
    long long v31 = 0u;
LABEL_15:
    sub_E09C((uint64_t)&v30, &qword_31570);
    goto LABEL_16;
  }

  if (!v3) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v10 = sub_253A0();
  if (sub_1E768(v10, v11, v3))
  {
    sub_25620();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v29, 0, sizeof(v29));
  }
  sub_C18C((uint64_t)v29, (uint64_t)&v30);
  if (!*((void *)&v31 + 1)) {
    goto LABEL_15;
  }
  sub_BA78(&qword_315F0);
  if (swift_dynamicCast())
  {
    uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v13 = NSStringFromClass(ObjCClassFromMetadata);
    uint64_t v14 = sub_253A0();
    uint64_t v16 = v15;

    if (v14 == 0xD000000000000025 && v16 == 0x8000000000026990)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_257C0();
      swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
      {
        uint64_t v24 = 1;
        goto LABEL_20;
      }
    }
    uint64_t v17 = (void *)sub_25300();
    os_log_type_t v27 = sub_25560();
    if (sub_E580(v27))
    {
      os_log_type_t v28 = (_WORD *)sub_E49C();
      sub_E6B0(v28);
      os_log_type_t v22 = "#MessagingWithSiriController trying to edit add language button, return false";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v17 = (void *)sub_25300();
  os_log_type_t v18 = sub_25560();
  if (sub_E580(v18))
  {
    uint64_t v19 = (_WORD *)sub_E49C();
    sub_E6B0(v19);
    os_log_type_t v22 = "#MessagingWithSiriController no cell class key, do not allow edit";
LABEL_18:
    sub_E970(&dword_0, v20, v21, v22);
    uint64_t v23 = v17;
    sub_E414();
    uint64_t v17 = v3;
    id v3 = v23;
  }
LABEL_19:

  uint64_t v24 = 0;
LABEL_20:

  return v24;
}

void sub_8F34()
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25310();
  oslog = sub_E4E0(v0, (uint64_t)qword_31D88);
  os_log_type_t v1 = sub_25560();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)sub_E49C();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "#MessagingWithSiriController long press", v2, 2u);
    sub_E414();
  }
}

uint64_t sub_9058(uint64_t a1, unint64_t a2)
{
  if (qword_31488 != -1) {
LABEL_48:
  }
    swift_once();
  uint64_t v4 = sub_25310();
  sub_C2FC(v4, (uint64_t)qword_31D88);
  swift_bridgeObjectRetain_n();
  os_log_type_t v5 = sub_25300();
  os_log_type_t v6 = sub_25560();
  uint64_t v68 = a1;
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)sub_E46C();
    v74[0] = sub_E484();
    *(_DWORD *)id v7 = 136315138;
    swift_bridgeObjectRetain();
    unint64_t v75 = (void *)sub_14464(a1, a2, v74);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v5, v6, "#MessagingWithSiriController getting suggested languages for language %s", v7, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v75 = &_swiftEmptyArrayStorage;
  sub_252F0();
  uint64_t v8 = sub_252D0();
  int64_t v9 = 0;
  uint64_t v70 = v8 + 56;
  sub_E624();
  unint64_t v12 = v11 & v10;
  int64_t v71 = (unint64_t)(v13 + 63) >> 6;
  unint64_t v66 = a2;
  uint64_t v69 = v14;
  while (v12)
  {
    unint64_t v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    int64_t v72 = v9;
    unint64_t v16 = v15 | (v9 << 6);
LABEL_22:
    uint64_t v21 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v16);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    sub_DC98(0, &qword_315A0);
    sub_E774();
    swift_bridgeObjectRetain_n();
    id v24 = sub_14E40();
    id v25 = [v24 languageCode];

    sub_253A0();
    id v26 = sub_14E40();
    LOBYTE(v24) = sub_11E1C();

    if (v24)
    {
      sub_DC98(0, &qword_315B0);
      uint64_t v27 = sub_11CA4(v23);
      if (v28)
      {
        uint64_t v29 = v27;
        uint64_t v30 = v28;
        if (qword_31458 != -1) {
          swift_once();
        }
        swift_beginAccess();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v32 = static MessagesSettingsUtils.readableLanguageToLocaleMap;
        id v73 = (void *)static MessagesSettingsUtils.readableLanguageToLocaleMap;
        static MessagesSettingsUtils.readableLanguageToLocaleMap = 0x8000000000000000;
        unint64_t v33 = sub_2471C(v29, v30);
        uint64_t v35 = *(void *)(v32 + 16);
        BOOL v36 = (v34 & 1) == 0;
        a1 = v35 + v36;
        if (__OFADD__(v35, v36)) {
          goto LABEL_45;
        }
        a2 = v33;
        char v37 = v34;
        sub_BA78(&qword_315C8);
        BOOL v38 = sub_25730(isUniquelyReferenced_nonNull_native, a1);
        a1 = v68;
        if (v38)
        {
          unint64_t v39 = sub_2471C(v29, v30);
          if ((v37 & 1) != (v40 & 1))
          {
            uint64_t result = sub_257F0();
            __break(1u);
            return result;
          }
          a2 = v39;
        }
        if (v37)
        {
          unint64_t v41 = (uint64_t *)(v73[7] + 16 * a2);
          swift_bridgeObjectRelease();
          *unint64_t v41 = v23;
          v41[1] = v22;
        }
        else
        {
          v73[(a2 >> 6) + 8] |= 1 << a2;
          uint64_t v42 = (uint64_t *)(v73[6] + 16 * a2);
          *uint64_t v42 = v29;
          v42[1] = v30;
          uint64_t v43 = (uint64_t *)(v73[7] + 16 * a2);
          *uint64_t v43 = v23;
          v43[1] = v22;
          uint64_t v44 = v73[2];
          BOOL v45 = __OFADD__(v44, 1);
          uint64_t v46 = v44 + 1;
          if (v45) {
            goto LABEL_46;
          }
          v73[2] = v46;
          swift_bridgeObjectRetain();
        }
        static MessagesSettingsUtils.readableLanguageToLocaleMap = (uint64_t)v73;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        os_log_type_t v47 = self;
        id v53 = sub_E7E4(v29, v30, v67, v48, v49, v50, v51, v52, v47);
        a2 = v66;
        uint64_t v8 = v69;
        int64_t v9 = v72;
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = sub_253A0();
          sub_21444(0, v55, v56, v54);
          id v57 = v54;
          sub_25400();
          sub_E764();
          if (v58) {
            sub_E840();
          }
          sub_25480();
          sub_25440();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v8 = v69;
        int64_t v9 = v72;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      int64_t v9 = v72;
    }
  }
  int64_t v17 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v17 >= v71) {
    goto LABEL_40;
  }
  unint64_t v18 = *(void *)(v70 + 8 * v17);
  int64_t v19 = v9 + 1;
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v9 + 2;
  if (v9 + 2 >= v71) {
    goto LABEL_40;
  }
  unint64_t v18 = *(void *)(v70 + 8 * v19);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v9 + 3;
  if (v9 + 3 >= v71) {
    goto LABEL_40;
  }
  unint64_t v18 = *(void *)(v70 + 8 * v19);
  if (v18)
  {
LABEL_21:
    unint64_t v12 = (v18 - 1) & v18;
    int64_t v72 = v19;
    unint64_t v16 = __clz(__rbit64(v18)) + (v19 << 6);
    goto LABEL_22;
  }
  uint64_t v20 = v9 + 4;
  if (v9 + 4 < v71)
  {
    unint64_t v18 = *(void *)(v70 + 8 * v20);
    if (!v18)
    {
      while (1)
      {
        int64_t v19 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_47;
        }
        if (v19 >= v71) {
          goto LABEL_40;
        }
        unint64_t v18 = *(void *)(v70 + 8 * v19);
        ++v20;
        if (v18) {
          goto LABEL_21;
        }
      }
    }
    int64_t v19 = v9 + 4;
    goto LABEL_21;
  }
LABEL_40:
  swift_release();
  swift_bridgeObjectRetain_n();
  uint64_t v59 = sub_25300();
  os_log_type_t v60 = sub_25560();
  if (os_log_type_enabled(v59, v60))
  {
    unint64_t v61 = (uint8_t *)sub_E46C();
    v74[0] = sub_E484();
    *(_DWORD *)unint64_t v61 = 136315138;
    sub_DC98(0, &qword_315D0);
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_25430();
    unint64_t v64 = v63;
    swift_bridgeObjectRelease();
    sub_14464(v62, v64, v74);
    sub_255F0();
    sub_E7CC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v59, v60, "#MessagingWithSiriController returning suggested languages : %s", v61, 0xCu);
    sub_E824();
    sub_E414();
    sub_E414();
  }
  else
  {

    sub_E7CC();
  }
  sub_E520();
  return (uint64_t)v75;
}

id sub_9788(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfGroup] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfSpecifier] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_destinationSpecifierGroup] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_headPhonesSpecifier] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_carPlaySpecifier] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_listOfSubscribedLanguages] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguageSpecifiers] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguagesGroup] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguagesGroup] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguageLink] = 0;
  os_log_type_t v5 = &v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguage];
  *(void *)os_log_type_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_tableView] = 0;
  if (a2)
  {
    NSString v6 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for MessagingWithSiriController();
  id v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_98B4(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfGroup] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_messageWithoutConfSpecifier] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_destinationSpecifierGroup] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_headPhonesSpecifier] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_carPlaySpecifier] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_listOfSubscribedLanguages] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguageSpecifiers] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguagesGroup] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguagesGroup] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_addTTSLanguageLink] = 0;
  id v3 = &v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_suggestedLanguage];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_tableView] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for MessagingWithSiriController();
  id v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

id sub_99C0()
{
  return sub_B970(type metadata accessor for MessagingWithSiriController);
}

uint64_t sub_9AC8(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguagesGroup);
}

uint64_t sub_9AD4()
{
  os_log_type_t v1 = v0;
  sub_E6F0();
  uint64_t v3 = static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000013, v2);
  sub_1E7C4(v3, v4, v0);
  sub_A730();
  os_log_type_t v5 = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0) {
    os_log_type_t v5 = sub_1CAD8((uint64_t)_swiftEmptyArrayStorage);
  }
  int64_t v19 = v5;
  sub_C350((uint64_t *)&v19);
  uint64_t v6 = (uint64_t)v19;
  self;
  sub_E6F0();
  id v10 = sub_21744(v7, v8, v9);
  sub_9AC8((uint64_t)v10);
  uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguagesGroup];
  if (v11)
  {
    id v12 = v11;
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0
      || (swift_retain(), uint64_t v18 = sub_25760(), swift_release(), (v18 & 0x8000000000000000) == 0))
    {
      sub_1D208();
      unint64_t v13 = (unint64_t)v19;
      unint64_t v14 = swift_bridgeObjectRetain();
      unint64_t v15 = sub_1F1A8(v14);
      swift_bridgeObjectRelease();
      sub_21678((uint64_t)v15, v1);
      unint64_t v16 = sub_1F1A8(v13);
      swift_bridgeObjectRelease();
      return (uint64_t)v16;
    }
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_9C54(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = a1;
  uint64_t v5 = a3();

  if (v5)
  {
    sub_25410();
    sub_E774();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_9CC8(uint64_t a1)
{
  v79[3] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_252F0();
  int64_t v2 = 0;
  uint64_t v70 = sub_252D0() + 56;
  sub_E624();
  unint64_t v5 = v4 & v3;
  uint64_t v72 = OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_preferences;
  uint64_t v73 = v6;
  int64_t v71 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v74 = v1;
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      uint64_t v9 = (v5 - 1) & v5;
      unint64_t v10 = v8 | (v2 << 6);
    }
    else
    {
      int64_t v11 = v2 + 1;
      if (__OFADD__(v2, 1))
      {
        __break(1u);
LABEL_51:
        __break(1u);
        return;
      }
      if (v11 >= v71) {
        goto LABEL_49;
      }
      unint64_t v12 = *(void *)(v70 + 8 * v11);
      ++v2;
      if (!v12)
      {
        int64_t v2 = v11 + 1;
        if (v11 + 1 >= v71) {
          goto LABEL_49;
        }
        unint64_t v12 = *(void *)(v70 + 8 * v2);
        if (!v12)
        {
          int64_t v2 = v11 + 2;
          if (v11 + 2 >= v71) {
            goto LABEL_49;
          }
          unint64_t v12 = *(void *)(v70 + 8 * v2);
          if (!v12)
          {
            int64_t v13 = v11 + 3;
            if (v13 >= v71)
            {
LABEL_49:
              swift_release();
              return;
            }
            unint64_t v12 = *(void *)(v70 + 8 * v13);
            if (!v12)
            {
              while (1)
              {
                int64_t v2 = v13 + 1;
                if (__OFADD__(v13, 1)) {
                  goto LABEL_51;
                }
                if (v2 >= v71) {
                  goto LABEL_49;
                }
                unint64_t v12 = *(void *)(v70 + 8 * v2);
                ++v13;
                if (v12) {
                  goto LABEL_17;
                }
              }
            }
            int64_t v2 = v13;
          }
        }
      }
LABEL_17:
      uint64_t v9 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v2 << 6);
    }
    unint64_t v14 = (uint64_t *)(*(void *)(v73 + 48) + 16 * v10);
    uint64_t v15 = *v14;
    unint64_t v16 = v14[1];
    uint64_t v17 = qword_31488;
    swift_bridgeObjectRetain();
    if (v17 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25310();
    os_log_type_t v19 = sub_C2FC(v18, (uint64_t)qword_31D88);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_25300();
    os_log_type_t v21 = sub_25560();
    unint64_t v76 = v9;
    int64_t v77 = v2;
    if (sub_E554(v21))
    {
      uint64_t v22 = (uint8_t *)sub_E46C();
      v79[0] = sub_E484();
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_14464(v15, v16, v79);
      sub_E798(v23);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v20, v19, "#MessagingWithSiriController trying to add  %s", v22, 0xCu);
      swift_arrayDestroy();
      sub_E414();
      sub_E414();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_DC98(0, &qword_315A0);
    swift_bridgeObjectRetain();
    uint64_t v75 = v15;
    id v24 = sub_14E40();
    id v25 = [v24 languageCode];

    uint64_t v26 = sub_253A0();
    unint64_t v28 = v27;

    id v29 = [*(id *)(v74 + v72) languageCode];
    if (!v29) {
      break;
    }
    uint64_t v30 = v29;
    sub_253A0();

    swift_bridgeObjectRetain_n();
    long long v31 = sub_25300();
    os_log_type_t v32 = sub_25560();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v78 = v26;
      unint64_t v33 = (uint8_t *)sub_E46C();
      v79[0] = sub_E484();
      *(_DWORD *)unint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_14464(v78, v28, v79);
      sub_E798(v34);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v31, v32, "#MessagingWithSiriController primary language %s", v33, 0xCu);
      sub_E824();
      sub_E414();
      uint64_t v26 = v78;
      sub_E414();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v35 = sub_14E40();
    id v36 = [v35 languageCode];

    sub_253A0();
    swift_bridgeObjectRetain();
    id v37 = sub_14E40();
    unsigned __int8 v38 = sub_11E1C();

    swift_bridgeObjectRelease();
    if ((v38 & 1) != 0 || (sub_DC98(0, &qword_315B0), uint64_t v39 = sub_11CA4(v75), !v40))
    {
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    uint64_t v41 = v39;
    unint64_t v42 = v40;
    swift_bridgeObjectRetain_n();
    uint64_t v43 = sub_25300();
    os_log_type_t v44 = sub_25560();
    if (os_log_type_enabled(v43, v44))
    {
      BOOL v45 = (_DWORD *)sub_E46C();
      v79[0] = sub_E484();
      *BOOL v45 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_14464(v41, v42, v79);
      sub_E798(v46);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      sub_E7A8(&dword_0, v43, v44, "#MessagingWithSiriController localizedName %s");
      sub_E824();
      sub_E414();
      sub_E414();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1CBEC();
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    os_log_type_t v47 = sub_25300();
    os_log_type_t v48 = sub_25560();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      v79[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_14464(v26, v28, v79);
      sub_E990(v50);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v49 + 12) = 2080;
      if (a1) {
        sub_A5F8(v26, v28, a1);
      }
      sub_BA78(&qword_315B8);
      uint64_t v52 = sub_253C0();
      uint64_t v54 = sub_14464(v52, v53, v79);
      sub_E990(v54);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v47, v48, "#MessagingWithSiriController subscribedLanguagesSet contains %s :  %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      sub_E414();
      sub_E414();

      if (!a1)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        goto LABEL_42;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      if (!a1) {
        goto LABEL_41;
      }
    }
    char v51 = sub_A5F8(v26, v28, a1);
    swift_bridgeObjectRelease();
    if (v51)
    {
LABEL_32:
      swift_bridgeObjectRelease();
      unint64_t v5 = v76;
      int64_t v2 = v77;
    }
    else
    {
LABEL_42:
      uint64_t v55 = self;
      id v61 = sub_E7E4(v41, v42, v74, v56, v57, v58, v59, v60, v55);
      unint64_t v5 = v76;
      int64_t v2 = v77;
      if (v61)
      {
        id v62 = v61;
        sub_25400();
        sub_E764();
        if (v63) {
          sub_E840();
        }
        sub_25480();
        sub_25440();
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v64 = (void *)sub_25300();
  os_log_type_t v65 = sub_25550();
  if (sub_E554(v65))
  {
    unint64_t v66 = (_WORD *)sub_E49C();
    sub_E6B0(v66);
    sub_E5BC(&dword_0, v67, v68, "#MessagingWithSiriController currentLanguage is nil");
    sub_E414();
  }
  swift_release();
}

uint64_t sub_A5F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25810();
    sub_253D0();
    Swift::Int v6 = sub_25830();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      int64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_257C0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_257C0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_A730()
{
  if (qword_31448 != -1) {
    swift_once();
  }
  sub_E520();
  uint64_t v1 = (void *)static MessagesSettingsUtils.daemonSession;
  *(void *)(sub_E9F0() + 16) = v0;
  id v2 = v1;
  id v3 = v0;
  sub_E6F0();
  sub_25200();

  return swift_release();
}

uint64_t sub_A804(unint64_t a1)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  sub_C2FC(v2, (uint64_t)qword_31D88);
  id v3 = sub_25300();
  os_log_type_t v4 = sub_25560();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "#MessagingWithSiriController removeAlreadySubscribedLanguages analyzing voiceSubscriptions", v5, 2u);
    swift_slowDealloc();
  }

  id v25 = &_swiftEmptySetSingleton;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25760();
    if (v6) {
      goto LABEL_7;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v22 = &_swiftEmptySetSingleton;
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_18;
  }
LABEL_7:
  uint64_t result = sub_DC98(0, &qword_315A0);
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v8 = 0;
  unint64_t v9 = a1 & 0xC000000000000001;
  uint64_t v23 = v6;
  do
  {
    if (v9) {
      id v10 = (id)sub_256B0();
    }
    else {
      id v10 = *(id *)(a1 + 8 * v8 + 32);
    }
    int64_t v11 = v10;
    BOOL v12 = (void *)sub_252B0();
    sub_25290();

    id v13 = sub_14E40();
    id v14 = [v13 languageCode];

    uint64_t v15 = sub_253A0();
    unint64_t v17 = v16;

    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_25300();
    os_log_type_t v19 = sub_25560();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = a1;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v21 + 4) = sub_14464(v15, v17, &v24);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v18, v19, "#MessagingWithSiriController Locale.LanguageCode(asset.primaryLanguage) %s", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a1 = v20;
      uint64_t v6 = v23;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ++v8;
    sub_CFC4(&v24, v15, v17);

    swift_bridgeObjectRelease();
  }
  while (v6 != v8);
  swift_bridgeObjectRelease();
  uint64_t v22 = v25;
LABEL_19:
  sub_ABA0((uint64_t)v22);

  return swift_bridgeObjectRelease();
}

uint64_t sub_ABA0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25330();
  sub_E438();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25350();
  sub_E438();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v16 = sub_E4B4();
  id v17 = [v1 valueForKey:v16];

  if (v17)
  {
    sub_25620();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v40, 0, sizeof(v40));
  }
  uint64_t v18 = sub_E9F0();
  sub_C18C((uint64_t)v40, (uint64_t)aBlock);
  if (!v36)
  {
    sub_E09C((uint64_t)aBlock, &qword_31570);
    return swift_deallocUninitializedObject();
  }
  sub_BA78(&qword_31578);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return swift_deallocUninitializedObject();
  }
  uint64_t v32 = a1;
  uint64_t v33 = v12;
  uint64_t v34 = v6;
  unint64_t v20 = v39;
  *(void *)(v18 + 16) = v39;
  uint64_t v21 = *(void **)&v2[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguagesGroup];
  if (v21)
  {
    swift_bridgeObjectRetain();
    id v22 = v21;
    sub_1F33C((uint64_t)v22, v20);
    uint64_t v24 = v23;
    char v26 = v25;
    swift_bridgeObjectRelease();

    if ((v26 & 1) == 0)
    {
      sub_DC98(0, &qword_31580);
      unint64_t v27 = (void *)sub_25570();
      unint64_t v28 = (void *)swift_allocObject();
      v28[2] = v24;
      v28[3] = v18;
      uint64_t v29 = v32;
      v28[4] = v2;
      v28[5] = v29;
      id v37 = sub_C23C;
      unsigned __int8 v38 = v28;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_7228;
      id v36 = &unk_2CB08;
      uint64_t v30 = _Block_copy(aBlock);
      swift_retain();
      long long v31 = v2;
      swift_bridgeObjectRetain();
      swift_release();
      sub_25340();
      aBlock[0] = _swiftEmptyArrayStorage;
      sub_E368((unint64_t *)&qword_31588, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_BA78(&qword_31590);
      sub_C260();
      sub_25630();
      sub_25580();
      _Block_release(v30);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v4);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v10);
    }
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_AF54(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v8 = (uint64_t *)(a2 + 16);
  uint64_t v9 = sub_25310();
  sub_C2FC(v9, (uint64_t)qword_31D88);
  uint64_t v10 = sub_25300();
  os_log_type_t v11 = sub_25560();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    v31[3] = a1;
    sub_255F0();
    _os_log_impl(&dword_0, v10, v11, "#MessagingWithSiriController adding voice group %ld", v12, 0xCu);
    swift_slowDealloc();
  }

  swift_beginAccess();
  unint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_1F1A8(v13);
  swift_bridgeObjectRelease();
  id v15 = objc_allocWithZone((Class)PSSpecifierUpdates);
  NSString v16 = sub_20E40((uint64_t)v14);
  if (!v16)
  {
    id v17 = sub_25300();
    os_log_type_t v28 = sub_25550();
    if (os_log_type_enabled(v17, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_0, v17, v28, "#MessagingWithSiriController handleURL failed to get updates", v29, 2u);
      swift_slowDealloc();
    }
    goto LABEL_16;
  }
  id v17 = v16;
  [v16 removeSpecifiersInGroup:*(void *)&a3[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguagesGroup]];
  sub_9CC8(a4);
  os_log_type_t v19 = sub_1F1A8(v18);
  swift_bridgeObjectRelease();
  if (__OFADD__(a1, 1))
  {
    __break(1u);
    goto LABEL_18;
  }
  sub_21608((uint64_t)v19, a1 + 1, v17);
  id v20 = [v17 context];
  if (v20)
  {
    uint64_t v21 = v20;
    [v20 setAnimated:1];

    uint64_t v22 = sub_216E8(v17);
    if (!v22) {
      goto LABEL_13;
    }
    unint64_t v23 = (unint64_t)sub_1F08C(v22);
    swift_bridgeObjectRelease();
    if (!v23) {
      goto LABEL_13;
    }
    if (!(v23 >> 62))
    {
      uint64_t v24 = v23 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
LABEL_12:
      v31[0] = v24;
      sub_C350(v31);
      swift_bridgeObjectRelease();
      uint64_t v25 = v31[0];
      swift_beginAccess();
      *uint64_t v8 = v25;
      swift_bridgeObjectRelease();
LABEL_13:
      swift_beginAccess();
      unint64_t v26 = swift_bridgeObjectRetain();
      unint64_t v27 = sub_1F1A8(v26);
      swift_bridgeObjectRelease();
      sub_21678((uint64_t)v27, a3);
LABEL_16:

      return;
    }
LABEL_18:
    uint64_t v30 = swift_bridgeObjectRetain();
    uint64_t v24 = (uint64_t)sub_1CAD8(v30);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
  swift_release();
  __break(1u);
}

void sub_B2B4(uint64_t a1)
{
  uint64_t v2 = v1;
  Class isa = sub_251C0().super.isa;
  v27.receiver = v1;
  v27.super_class = (Class)type metadata accessor for ListOfLanguagesController();
  objc_msgSendSuper2(&v27, "tableView:didSelectRowAtIndexPath:", a1, isa);

  Class v5 = sub_251C0().super.isa;
  id v6 = sub_E8EC((uint64_t)v5, "specifierAtIndexPath:");

  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_DB0C(v7, (SEL *)&selRef_identifier);
    if (v9)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v9;
      uint64_t v12 = (uint64_t *)&v2[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_readableLanguageNameToLocaleCode];
      sub_E520();
      uint64_t v13 = *v12;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_21A0C(v10, v11, v13);
      uint64_t v16 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v16)
      {
        if (qword_31488 != -1) {
          swift_once();
        }
        uint64_t v17 = sub_25310();
        sub_C2FC(v17, (uint64_t)qword_31D88);
        unint64_t v18 = v7;
        os_log_type_t v19 = sub_25300();
        os_log_type_t v20 = sub_25560();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v26 = v14;
          uint64_t v21 = (uint8_t *)sub_E46C();
          uint64_t v25 = (void *)sub_E660();
          *(_DWORD *)uint64_t v21 = 138412290;
          uint64_t v22 = v18;
          sub_255F0();
          *uint64_t v25 = v6;

          _os_log_impl(&dword_0, v19, v20, "#ListOfLanguagesController %@", v21, 0xCu);
          sub_BA78(&qword_315C0);
          sub_E918();
          sub_E414();
          uint64_t v14 = v26;
          sub_E414();
        }
        else
        {

          os_log_type_t v19 = v18;
        }

        if (qword_31440 != -1) {
          swift_once();
        }
        sub_E520();
        swift_retain();
        sub_F8CC(v14, v16, 0, 0);
        swift_release();
        swift_bridgeObjectRelease();
        id v23 = [v2 navigationController];
        if (v23)
        {
          uint64_t v24 = v23;
        }
      }
    }
  }
}

id sub_B6C0(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguagesGroup] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguageLink] = 0;
  uint64_t v6 = OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_readableLanguageNameToLocaleCode;
  id v7 = v3;
  *(void *)&v3[v6] = sub_25380();
  uint64_t v8 = OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_preferences;
  *(void *)&v7[v8] = [self sharedPreferences];

  if (a2)
  {
    NSString v9 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for ListOfLanguagesController();
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

uint64_t sub_B7E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    uint64_t v7 = sub_253A0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a4;
  return a5(v7, v9, a4);
}

id sub_B85C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguagesGroup] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_addTTSLanguageLink] = 0;
  uint64_t v3 = OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_readableLanguageNameToLocaleCode;
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_25380();
  uint64_t v5 = OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_preferences;
  *(void *)&v4[v5] = [self sharedPreferences];

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ListOfLanguagesController();
  id v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

id sub_B958()
{
  return sub_B970(type metadata accessor for ListOfLanguagesController);
}

id sub_B970(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

const char *MultilingualReadingFlag.domain.getter()
{
  return "SiriMessages";
}

const char *MultilingualReadingFlag.feature.getter()
{
  return "multilingual_message_reading";
}

uint64_t variable initialization expression of TTSDownloader.localeToPercentageMap()
{
  return sub_BB68();
}

uint64_t sub_BA78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *variable initialization expression of TTSDownloader.onChangeActions()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of ThreadSafeDictionary.dictionary()
{
  sub_E6BC();
  swift_getTupleTypeMetadata2();
  sub_25460();
  sub_E6BC();

  return sub_25380();
}

id variable initialization expression of ThreadSafeDictionary.lock()
{
  id v0 = objc_allocWithZone((Class)NSLock);

  return [v0 init];
}

uint64_t sub_BB68()
{
  *(void *)(v0 + 16) = sub_25380();
  *(void *)(v0 + 24) = [objc_allocWithZone((Class)NSLock) init];
  return v0;
}

Swift::Int sub_BBC4()
{
  return sub_E3B0(*v0);
}

void sub_BBCC(uint64_t a1)
{
  sub_DB84(a1, *v1);
}

Swift::Int sub_BBD4(uint64_t a1)
{
  return sub_DBAC(a1, *v1);
}

BOOL sub_BBDC(uint64_t *a1, uint64_t *a2)
{
  return sub_DB78(*a1, *a2);
}

void sub_BBE8(uint64_t a1@<X8>)
{
  sub_BC1C();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_BC24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_BC54(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_E410;
  return v6();
}

uint64_t sub_BD20(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_E410;
  return v7();
}

uint64_t sub_BDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254F0();
  if (sub_E074(a1, 1, v6) == 1)
  {
    sub_E09C(a1, &qword_31630);
  }
  else
  {
    sub_254E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_254B0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_BF5C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_C038;
  return v6(a1);
}

uint64_t sub_C038()
{
  sub_E9D0();
  sub_E454();
  uint64_t v1 = *v0;
  sub_E570();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_E72C();
  return v3();
}

uint64_t type metadata accessor for MessagingWithSiriController()
{
  return self;
}

uint64_t type metadata accessor for ListOfLanguagesController()
{
  return self;
}

ValueMetadata *type metadata accessor for MultilingualReadingFlag()
{
  return &type metadata for MultilingualReadingFlag;
}

uint64_t sub_C154()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_C18C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BA78(&qword_31570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_C1F4()
{
  swift_release();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_C23C()
{
  sub_AF54(*(void *)(v0 + 16), *(void *)(v0 + 24), *(char **)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_C248(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_C258()
{
  return swift_release();
}

unint64_t sub_C260()
{
  unint64_t result = qword_31598;
  if (!qword_31598)
  {
    sub_C2B4(&qword_31590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31598);
  }
  return result;
}

uint64_t sub_C2B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_C2FC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_C334(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_C350(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_1ED88(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_C3CC(v6);
  return sub_256F0();
}

uint64_t sub_C3CC(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_25790(v3);
  if (result < v3)
  {
    uint64_t v5 = result;
    uint64_t result = sub_20EB0(v3 / 2);
    uint64_t v114 = v3;
    uint64_t v115 = v6;
    uint64_t v117 = result;
    id v110 = a1;
    if (v3 <= 0) {
      goto LABEL_115;
    }
    uint64_t v111 = v5;
    Swift::Int v7 = 0;
    uint64_t v8 = *a1;
    uint64_t v109 = *a1 - 8;
    uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v116 = *a1;
    while (1)
    {
      Swift::Int v10 = v7++;
      Swift::Int v113 = v10;
      if (v7 < v3)
      {
        Swift::Int v11 = v10;
        objc_super v12 = v9;
        uint64_t v13 = *(void **)(v8 + 8 * v11);
        id v14 = *(id *)(v8 + 8 * v7);
        id v15 = v13;
        uint64_t result = sub_1E75C(v14);
        if (!v16) {
          goto LABEL_164;
        }
        uint64_t v17 = result;
        uint64_t v18 = v16;
        uint64_t result = sub_1E75C(v15);
        if (!v19)
        {
LABEL_165:
          __break(1u);
          return result;
        }
        if (v17 == result && v18 == v19) {
          int v21 = 0;
        }
        else {
          int v21 = sub_257C0();
        }

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        Swift::Int v22 = v113;
        Swift::Int v3 = v114;
        Swift::Int v7 = v113 + 2;
        uint64_t v8 = v116;
        if (v113 + 2 < v114)
        {
          while (1)
          {
            uint64_t v23 = v8 + 8 * v22;
            uint64_t v24 = *(void **)(v23 + 8);
            id v25 = *(id *)(v23 + 16);
            id v26 = v24;
            uint64_t result = sub_1E75C(v25);
            if (!v27) {
              goto LABEL_160;
            }
            uint64_t v28 = result;
            uint64_t v29 = v27;
            uint64_t result = sub_1E75C(v26);
            if (!v30) {
              break;
            }
            if (v28 == result && v29 == v30)
            {

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              if (v21)
              {
                Swift::Int v7 = v22 + 2;
                uint64_t v9 = v12;
                uint64_t v8 = v116;
                Swift::Int v10 = v113;
                Swift::Int v3 = v114;
                goto LABEL_28;
              }
            }
            else
            {
              int v32 = sub_257C0();

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              if ((v21 ^ v32))
              {
                Swift::Int v7 = v22 + 2;
                Swift::Int v3 = v114;
                uint64_t v8 = v116;
                goto LABEL_25;
              }
            }
            uint64_t v33 = v22 + 3;
            ++v22;
            Swift::Int v3 = v114;
            uint64_t v8 = v116;
            if (v33 >= v114)
            {
              Swift::Int v7 = v114;
              goto LABEL_25;
            }
          }
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
          goto LABEL_165;
        }
LABEL_25:
        uint64_t v9 = v12;
        Swift::Int v10 = v113;
        if (v21)
        {
LABEL_28:
          if (v7 < v10) {
            goto LABEL_152;
          }
          if (v10 < v7)
          {
            uint64_t v34 = (uint64_t *)(v109 + 8 * v7);
            Swift::Int v35 = v7;
            Swift::Int v36 = v10;
            id v37 = (uint64_t *)(v8 + 8 * v10);
            do
            {
              if (v36 != --v35)
              {
                if (!v8) {
                  goto LABEL_162;
                }
                uint64_t v38 = *v37;
                uint64_t *v37 = *v34;
                *uint64_t v34 = v38;
              }
              ++v36;
              --v34;
              ++v37;
            }
            while (v36 < v35);
          }
        }
      }
      if (v7 < v3)
      {
        if (__OFSUB__(v7, v10)) {
          goto LABEL_150;
        }
        if (v7 - v10 < v111)
        {
          if (__OFADD__(v10, v111)) {
            goto LABEL_153;
          }
          if (v10 + v111 >= v3) {
            Swift::Int v39 = v3;
          }
          else {
            Swift::Int v39 = v10 + v111;
          }
          if (v39 < v10)
          {
LABEL_154:
            __break(1u);
            goto LABEL_155;
          }
          if (v7 != v39)
          {
            uint64_t v108 = v9;
            uint64_t v40 = v109 + 8 * v7;
            Swift::Int v112 = v39;
            while (1)
            {
              uint64_t v41 = *(void **)(v8 + 8 * v7);
              uint64_t v42 = v40;
              while (1)
              {
                uint64_t v43 = *(void **)v42;
                id v44 = v41;
                id v45 = v43;
                uint64_t result = sub_1E75C(v44);
                if (!v46) {
                  goto LABEL_156;
                }
                uint64_t v47 = result;
                uint64_t v48 = v46;
                uint64_t result = sub_1E75C(v45);
                if (!v49)
                {
LABEL_157:
                  __break(1u);
LABEL_158:
                  __break(1u);
LABEL_159:
                  __break(1u);
LABEL_160:
                  __break(1u);
                  goto LABEL_161;
                }
                if (v47 == result && v48 == v49) {
                  break;
                }
                char v51 = sub_257C0();

                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease();
                if ((v51 & 1) == 0) {
                  goto LABEL_57;
                }
                uint64_t v8 = v116;
                if (!v116) {
                  goto LABEL_158;
                }
                uint64_t v52 = *(void **)v42;
                uint64_t v41 = *(void **)(v42 + 8);
                *(void *)uint64_t v42 = v41;
                *(void *)(v42 + 8) = v52;
                v42 -= 8;
                if (v7 == ++v10) {
                  goto LABEL_58;
                }
              }

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
LABEL_57:
              uint64_t v8 = v116;
LABEL_58:
              ++v7;
              v40 += 8;
              Swift::Int v10 = v113;
              if (v7 == v112)
              {
                Swift::Int v7 = v112;
                uint64_t v9 = v108;
                break;
              }
            }
          }
        }
      }
      if (v7 < v10) {
        goto LABEL_149;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1E5B0(0, *((void *)v9 + 2) + 1, 1, v9);
        uint64_t v9 = (char *)result;
      }
      unint64_t v54 = *((void *)v9 + 2);
      unint64_t v53 = *((void *)v9 + 3);
      unint64_t v55 = v54 + 1;
      uint64_t v8 = v116;
      if (v54 >= v53 >> 1)
      {
        uint64_t result = (uint64_t)sub_1E5B0((char *)(v53 > 1), v54 + 1, 1, v9);
        uint64_t v8 = v116;
        uint64_t v9 = (char *)result;
      }
      *((void *)v9 + 2) = v55;
      uint64_t v56 = v9 + 32;
      uint64_t v57 = (Swift::Int *)&v9[16 * v54 + 32];
      *uint64_t v57 = v10;
      v57[1] = v7;
      if (v54) {
        break;
      }
      unint64_t v55 = 1;
LABEL_108:
      Swift::Int v3 = v114;
      if (v7 >= v114) {
        goto LABEL_116;
      }
    }
    while (1)
    {
      unint64_t v58 = v55 - 1;
      if (v55 >= 4)
      {
        char v63 = &v56[16 * v55];
        uint64_t v64 = *((void *)v63 - 8);
        uint64_t v65 = *((void *)v63 - 7);
        BOOL v69 = __OFSUB__(v65, v64);
        uint64_t v66 = v65 - v64;
        if (v69) {
          goto LABEL_134;
        }
        uint64_t v68 = *((void *)v63 - 6);
        uint64_t v67 = *((void *)v63 - 5);
        BOOL v69 = __OFSUB__(v67, v68);
        uint64_t v61 = v67 - v68;
        char v62 = v69;
        if (v69) {
          goto LABEL_135;
        }
        unint64_t v70 = v55 - 2;
        int64_t v71 = &v56[16 * v55 - 32];
        uint64_t v73 = *(void *)v71;
        uint64_t v72 = *((void *)v71 + 1);
        BOOL v69 = __OFSUB__(v72, v73);
        uint64_t v74 = v72 - v73;
        if (v69) {
          goto LABEL_136;
        }
        BOOL v69 = __OFADD__(v61, v74);
        uint64_t v75 = v61 + v74;
        if (v69) {
          goto LABEL_138;
        }
        if (v75 >= v66)
        {
          uint64_t v93 = &v56[16 * v58];
          uint64_t v95 = *(void *)v93;
          uint64_t v94 = *((void *)v93 + 1);
          BOOL v69 = __OFSUB__(v94, v95);
          uint64_t v96 = v94 - v95;
          if (v69) {
            goto LABEL_144;
          }
          BOOL v86 = v61 < v96;
          goto LABEL_97;
        }
      }
      else
      {
        if (v55 != 3)
        {
          uint64_t v87 = *((void *)v9 + 4);
          uint64_t v88 = *((void *)v9 + 5);
          BOOL v69 = __OFSUB__(v88, v87);
          uint64_t v80 = v88 - v87;
          char v81 = v69;
          goto LABEL_91;
        }
        uint64_t v60 = *((void *)v9 + 4);
        uint64_t v59 = *((void *)v9 + 5);
        BOOL v69 = __OFSUB__(v59, v60);
        uint64_t v61 = v59 - v60;
        char v62 = v69;
      }
      if (v62) {
        goto LABEL_137;
      }
      unint64_t v70 = v55 - 2;
      unint64_t v76 = &v56[16 * v55 - 32];
      uint64_t v78 = *(void *)v76;
      uint64_t v77 = *((void *)v76 + 1);
      BOOL v79 = __OFSUB__(v77, v78);
      uint64_t v80 = v77 - v78;
      char v81 = v79;
      if (v79) {
        goto LABEL_139;
      }
      os_log_type_t v82 = &v56[16 * v58];
      uint64_t v84 = *(void *)v82;
      uint64_t v83 = *((void *)v82 + 1);
      BOOL v69 = __OFSUB__(v83, v84);
      uint64_t v85 = v83 - v84;
      if (v69) {
        goto LABEL_141;
      }
      if (__OFADD__(v80, v85)) {
        goto LABEL_143;
      }
      if (v80 + v85 >= v61)
      {
        BOOL v86 = v61 < v85;
LABEL_97:
        if (v86) {
          unint64_t v58 = v70;
        }
        goto LABEL_99;
      }
LABEL_91:
      if (v81) {
        goto LABEL_140;
      }
      uint64_t v89 = &v56[16 * v58];
      uint64_t v91 = *(void *)v89;
      uint64_t v90 = *((void *)v89 + 1);
      BOOL v69 = __OFSUB__(v90, v91);
      uint64_t v92 = v90 - v91;
      if (v69) {
        goto LABEL_142;
      }
      if (v92 < v80) {
        goto LABEL_108;
      }
LABEL_99:
      unint64_t v97 = v58 - 1;
      if (v58 - 1 >= v55)
      {
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
        goto LABEL_145;
      }
      if (!v8) {
        goto LABEL_159;
      }
      Swift::Int v3 = (Swift::Int)&v56[16 * v97];
      uint64_t v98 = *(void *)v3;
      unint64_t v99 = &v56[16 * v58];
      uint64_t v100 = *((void *)v99 + 1);
      uint64_t result = sub_CCD0((char *)(v8 + 8 * *(void *)v3), (char *)(v8 + 8 * *(void *)v99), v8 + 8 * v100, v115);
      if (v1)
      {
LABEL_113:
        uint64_t result = swift_bridgeObjectRelease();
        if (v114 >= -1) {
          goto LABEL_128;
        }
        __break(1u);
LABEL_115:
        uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
        unint64_t v55 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_116:
        if (v55 >= 2)
        {
          uint64_t v102 = *v110;
          while (1)
          {
            unint64_t v103 = v55 - 2;
            if (v55 < 2) {
              break;
            }
            if (!v102) {
              goto LABEL_163;
            }
            Swift::Int v3 = v55 - 1;
            uint64_t v104 = *(void *)&v9[16 * v103 + 32];
            uint64_t v105 = *(void *)&v9[16 * v55 + 24];
            uint64_t result = sub_CCD0((char *)(v102 + 8 * v104), (char *)(v102 + 8 * *(void *)&v9[16 * v55 + 16]), v102 + 8 * v105, v115);
            if (v1) {
              goto LABEL_113;
            }
            if (v105 < v104) {
              goto LABEL_146;
            }
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)sub_1E6A8((uint64_t)v9);
              uint64_t v9 = (char *)result;
            }
            if (v103 >= *((void *)v9 + 2)) {
              goto LABEL_147;
            }
            long long v106 = &v9[16 * v103 + 32];
            *(void *)long long v106 = v104;
            *((void *)v106 + 1) = v105;
            unint64_t v107 = *((void *)v9 + 2);
            if (v55 > v107) {
              goto LABEL_148;
            }
            uint64_t result = (uint64_t)memmove(&v9[16 * v3 + 32], &v9[16 * v55 + 32], 16 * (v107 - v55));
            *((void *)v9 + 2) = v107 - 1;
            unint64_t v55 = v107 - 1;
            Swift::Int v3 = v114;
            if (v107 <= 2) {
              goto LABEL_127;
            }
          }
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
LABEL_127:
        uint64_t result = swift_bridgeObjectRelease();
        if (v3 >= -1)
        {
LABEL_128:
          *(void *)((char *)&dword_10 + (v117 & 0xFFFFFFFFFFFFFF8)) = 0;
          sub_25440();
          return swift_bridgeObjectRelease();
        }
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
        goto LABEL_157;
      }
      if (v100 < v98) {
        goto LABEL_131;
      }
      if (v58 > *((void *)v9 + 2)) {
        goto LABEL_132;
      }
      *(void *)Swift::Int v3 = v98;
      *(void *)&v56[16 * v97 + 8] = v100;
      unint64_t v101 = *((void *)v9 + 2);
      if (v58 >= v101) {
        goto LABEL_133;
      }
      unint64_t v55 = v101 - 1;
      uint64_t result = (uint64_t)memmove(&v56[16 * v58], v99 + 16, 16 * (v101 - 1 - v58));
      *((void *)v9 + 2) = v101 - 1;
      uint64_t v8 = v116;
      if (v101 <= 2) {
        goto LABEL_108;
      }
    }
  }
  if (v3 < 0) {
    goto LABEL_151;
  }
  if (v3) {
    return sub_CB9C(0, v3, 1, a1);
  }
  return result;
}

uint64_t sub_CB9C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v20 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
    while (2)
    {
      Swift::Int v7 = *(void **)(v5 + 8 * v4);
      uint64_t v8 = v20;
      uint64_t v21 = v6;
      while (1)
      {
        uint64_t v9 = *(void **)v6;
        id v10 = v7;
        id v11 = v9;
        uint64_t result = sub_1E75C(v10);
        if (!v12)
        {
          __break(1u);
LABEL_18:
          __break(1u);
LABEL_19:
          __break(1u);
          return result;
        }
        uint64_t v13 = result;
        uint64_t v14 = v12;
        uint64_t result = sub_1E75C(v11);
        if (!v15) {
          goto LABEL_18;
        }
        if (v13 == result && v14 == v15) {
          break;
        }
        char v17 = sub_E8CC();

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v17 & 1) == 0) {
          goto LABEL_15;
        }
        if (!v5) {
          goto LABEL_19;
        }
        uint64_t v18 = *(void **)v6;
        Swift::Int v7 = *(void **)(v6 + 8);
        *(void *)uint64_t v6 = v7;
        *(void *)(v6 + 8) = v18;
        v6 -= 8;
        if (v4 == ++v8) {
          goto LABEL_15;
        }
      }

      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
LABEL_15:
      ++v4;
      uint64_t v6 = v21 + 8;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_CCD0(char *a1, char *a2, unint64_t a3, char *a4)
{
  Swift::Int v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 < v11)
  {
    sub_2454C(a1, (a2 - a1) / 8, a4);
    uint64_t v12 = &a4[8 * v9];
    BOOL v13 = (unint64_t)a2 >= a3 || v8 < 8;
    uint64_t v14 = a4;
    if (!v13)
    {
      uint64_t v15 = (id *)a2;
      unint64_t v50 = a3;
      do
      {
        uint64_t v16 = v15;
        char v17 = v14;
        uint64_t v18 = *(void **)v14;
        id v19 = *v15;
        id v20 = v18;
        uint64_t result = sub_1E75C(v19);
        if (!v22)
        {
          __break(1u);
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
          goto LABEL_59;
        }
        uint64_t v23 = result;
        uint64_t v24 = v22;
        uint64_t result = sub_1E75C(v20);
        if (!v25) {
          goto LABEL_57;
        }
        if (v23 == result && v24 == v25)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v27 = sub_257C0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v27)
          {
            uint64_t v28 = v16;
            uint64_t v15 = v16 + 1;
            unint64_t v29 = v50;
            uint64_t v14 = v17;
            if (v7 == (char *)v16) {
              goto LABEL_19;
            }
LABEL_18:
            *(void *)Swift::Int v7 = *v28;
            goto LABEL_19;
          }
        }
        uint64_t v28 = v17;
        uint64_t v14 = v17 + 8;
        unint64_t v29 = v50;
        uint64_t v15 = v16;
        if (v7 != v17) {
          goto LABEL_18;
        }
LABEL_19:
        v7 += 8;
      }
      while (v14 < v12 && (unint64_t)v15 < v29);
    }
    long long v31 = v7;
LABEL_55:
    sub_2454C(v14, (v12 - v14) / 8, v31);
    return 1;
  }
  sub_2454C(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
  uint64_t v12 = &a4[8 * v11];
  if (v7 >= a2 || v10 < 8)
  {
    uint64_t v14 = a4;
    long long v31 = a2;
    goto LABEL_55;
  }
  uint64_t v33 = (char *)(a3 - 8);
  long long v31 = a2;
  uint64_t v48 = v7;
  while (1)
  {
    unint64_t v51 = (unint64_t)v12;
    uint64_t v34 = v12 - 8;
    Swift::Int v35 = v31;
    Swift::Int v36 = (void *)*((void *)v31 - 1);
    v31 -= 8;
    id v37 = *((id *)v12 - 1);
    id v38 = v36;
    uint64_t result = sub_1E75C(v37);
    if (!v39) {
      goto LABEL_58;
    }
    uint64_t v40 = result;
    uint64_t v41 = v39;
    uint64_t result = sub_1E75C(v38);
    if (!v42) {
      break;
    }
    uint64_t v49 = v33 + 8;
    if (v40 == result && v41 == v42)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v44 = sub_E8CC();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v44)
      {
        BOOL v45 = v49 != v35 || v33 >= v35;
        uint64_t v34 = v31;
        uint64_t v12 = (char *)v51;
        if (!v45) {
          goto LABEL_50;
        }
        goto LABEL_49;
      }
    }
    BOOL v46 = v49 != (char *)v51 || (unint64_t)v33 >= v51;
    uint64_t v12 = v34;
    long long v31 = v35;
    if (!v46) {
      goto LABEL_50;
    }
LABEL_49:
    *(void *)uint64_t v33 = *(void *)v34;
LABEL_50:
    v33 -= 8;
    if (v31 <= v48 || v12 <= a4)
    {
      uint64_t v14 = a4;
      goto LABEL_55;
    }
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_CFC4(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_25810();
  swift_bridgeObjectRetain();
  sub_253D0();
  Swift::Int v8 = sub_25830();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_257C0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_257C0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_D450(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_D174()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_BA78(&qword_315A8);
  uint64_t v3 = sub_25680();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25810();
      sub_253D0();
      uint64_t result = sub_25830();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_C334(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                void *v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_D450(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_D174();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_D5EC();
      goto LABEL_22;
    }
    sub_D7A0();
  }
  uint64_t v11 = *v4;
  sub_25810();
  sub_253D0();
  uint64_t result = sub_25830();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_257C0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_257E0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_257C0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_D5EC()
{
  uint64_t v1 = v0;
  sub_BA78(&qword_315A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25670();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_D7A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_BA78(&qword_315A8);
  uint64_t v3 = sub_25680();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25810();
    swift_bridgeObjectRetain();
    sub_253D0();
    uint64_t result = sub_25830();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_DA4C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_25390();
  swift_bridgeObjectRelease();
  id v5 = [a3 groupSpecifierWithName:v4];

  return v5;
}

uint64_t sub_DAB0(void *a1)
{
  id v1 = [a1 specifiers];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25420();

  return v3;
}

uint64_t sub_DB0C(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_253A0();

  return v4;
}

BOOL sub_DB78(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_DB84(uint64_t a1, Swift::UInt a2)
{
}

Swift::Int sub_DBAC(uint64_t a1, Swift::UInt a2)
{
  return sub_25830();
}

uint64_t sub_DBF0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_DC28(unint64_t a1)
{
  return sub_A804(a1);
}

void sub_DC30(unint64_t a1)
{
  sub_4C74(a1, *(char **)(v1 + 16));
}

uint64_t sub_DC38()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_DC88()
{
  sub_5CE4(*(void *)(v0 + 16), *(char **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_DC98(uint64_t a1, unint64_t *a2)
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

uint64_t sub_DCD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_DCFC()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_DD44()
{
  sub_E86C();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_E860(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_DDEC;
  sub_E6BC();
  return v3();
}

uint64_t sub_DDEC()
{
  sub_E9D0();
  sub_E454();
  uint64_t v1 = *v0;
  sub_E570();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_E72C();
  return v3();
}

uint64_t sub_DEB0()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_E860(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_E410;
  uint64_t v3 = sub_E720();
  return v4(v3);
}

uint64_t sub_DF6C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_DFAC(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_E860(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_E410;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_31648 + dword_31648);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_E074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_E09C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_BA78(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_E0F8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_E130()
{
  sub_E86C();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_E860(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_DDEC;
  sub_E6BC();
  return v3();
}

uint64_t sub_E1DC(uint64_t a1)
{
  return a1;
}

void sub_E230()
{
  sub_6B40(*(char **)(v0 + 16));
}

unint64_t sub_E238()
{
  unint64_t result = qword_31680;
  if (!qword_31680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31680);
  }
  return result;
}

uint64_t sub_E284(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for TTSAssetProperty()
{
  if (!qword_31688)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_31688);
    }
  }
}

uint64_t sub_E320()
{
  return sub_E368(&qword_31690, (void (*)(uint64_t))type metadata accessor for TTSAssetProperty);
}

uint64_t sub_E368(unint64_t *a1, void (*a2)(uint64_t))
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

Swift::Int sub_E3B0(Swift::UInt a1)
{
  return sub_25830();
}

uint64_t sub_E414()
{
  return swift_slowDealloc();
}

uint64_t sub_E42C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

uint64_t sub_E46C()
{
  return swift_slowAlloc();
}

uint64_t sub_E484()
{
  return swift_slowAlloc();
}

uint64_t sub_E49C()
{
  return swift_slowAlloc();
}

NSString sub_E4B4()
{
  return sub_25390();
}

uint64_t sub_E4E0(uint64_t a1, uint64_t a2)
{
  sub_C2FC(a1, a2);
  return sub_25300();
}

uint64_t sub_E508(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_E520()
{
  return swift_beginAccess();
}

void sub_E538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21444(a1, a3, a4, v4);
}

BOOL sub_E554(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL sub_E580(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_E59C()
{
  return sub_25450();
}

void sub_E5BC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_E5F0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL sub_E644(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_E660()
{
  return swift_slowAlloc();
}

uint64_t sub_E678()
{
  uint64_t result = v1;
  *(void *)(v2 - 240) = *(void *)(v0 + 8);
  return result;
}

uint64_t sub_E694()
{
  uint64_t result = v0;
  *(void *)(v2 - 232) = *(void *)(v1 + 8);
  return result;
}

_WORD *sub_E6B0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

void sub_E6C8(uint64_t a1, uint64_t a2)
{
  sub_21444(v2, a1, a2, v3);
}

uint64_t sub_E6FC()
{
  return swift_bridgeObjectRelease();
}

BOOL sub_E704(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_E720()
{
  return v0;
}

uint64_t sub_E72C()
{
  return v0 + 8;
}

id sub_E738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  return sub_21554(a1, a2, a3, a4, a5, 0, 6, 0, a9);
}

uint64_t sub_E774()
{
  return v0;
}

uint64_t sub_E780(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t sub_E798(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

void sub_E7A8(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t sub_E7CC()
{
  return swift_bridgeObjectRelease_n();
}

id sub_E7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  return sub_21554(a1, a2, a3, 0, 0, 0, 3, 0, a9);
}

uint64_t sub_E808()
{
  return swift_arrayDestroy();
}

uint64_t sub_E824()
{
  return swift_arrayDestroy();
}

uint64_t sub_E840()
{
  return sub_25450();
}

uint64_t sub_E860(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_E878(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t sub_E88C()
{
  return sub_25450();
}

uint64_t sub_E8AC()
{
  return sub_25450();
}

uint64_t sub_E8CC()
{
  return sub_257C0();
}

id sub_E8EC(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_E918()
{
  return swift_arrayDestroy();
}

uint64_t sub_E930()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_E95C(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

void sub_E970(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 2u);
}

uint64_t sub_E990(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return sub_255F0();
}

uint64_t sub_E9B0@<X0>(uint64_t a1@<X8>)
{
  return static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000014, (void *)((a1 - 32) | 0x8000000000000000));
}

uint64_t sub_E9F0()
{
  return swift_allocObject();
}

void sub_EA08()
{
  id v1 = [v0 textLabel];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [self systemBlueColor];
    [v2 setTextColor:v3];

    uint64_t v4 = static MessagesSettingsUtils.getLocalizedString(_:)(0x474E414C5F444441, (void *)0xED00005345474155);
    sub_249DC(v4, v5, v2);
    v10.receiver = v0;
    v10.super_class = (Class)type metadata accessor for AddLanguagesCell();
    objc_msgSendSuper2(&v10, "layoutSubviews");
  }
  else
  {
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25310();
    sub_C2FC(v6, (uint64_t)qword_31D88);
    oslog = sub_25300();
    os_log_type_t v7 = sub_25560();
    if (os_log_type_enabled(oslog, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, oslog, v7, "#LanguageCell layoutSubviews textLabel nil", v8, 2u);
      swift_slowDealloc();
    }
  }
}

id sub_EBF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    NSString v7 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for AddLanguagesCell();
  id v8 = objc_msgSendSuper2(&v11, "initWithStyle:reuseIdentifier:specifier:", a1, v7, a4);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_ED10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    NSString v5 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AddLanguagesCell();
  id v6 = objc_msgSendSuper2(&v8, "initWithStyle:reuseIdentifier:", a1, v5);

  return v6;
}

id sub_EDE0(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AddLanguagesCell();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_EE58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddLanguagesCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AddLanguagesCell()
{
  return self;
}

uint64_t sub_EEB0()
{
  if (qword_31438 != -1) {
    swift_once();
  }
  NSString v0 = sub_25390();
  int v1 = MGGetSInt32Answer();

  swift_beginAccess();
  uint64_t v2 = sub_21968(v1, qword_316C0);
  swift_endAccess();
  return v2;
}

BOOL sub_EF6C(char a1, char a2)
{
  return a1 == a2;
}

void sub_EF7C(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_EFA4(unsigned __int8 a1)
{
  return sub_25830();
}

BOOL sub_EFEC(char *a1, char *a2)
{
  return sub_EF6C(*a1, *a2);
}

Swift::Int sub_EFF8()
{
  return sub_EFA4(*v0);
}

void sub_F000(uint64_t a1)
{
  sub_EF7C(a1, *v1);
}

Swift::Int sub_F008()
{
  Swift::UInt v1 = *v0;
  sub_25810();
  sub_25820(v1);
  return sub_25830();
}

uint64_t sub_F04C()
{
  uint64_t result = sub_25380();
  qword_316C0 = result;
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for MobileGestalt.DeviceType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MobileGestalt.DeviceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MobileGestalt.DeviceType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0xF1F0);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_F218(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_F220(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MobileGestalt.DeviceType()
{
  return &type metadata for MobileGestalt.DeviceType;
}

unint64_t sub_F23C()
{
  unint64_t result = qword_316C8;
  if (!qword_316C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_316C8);
  }
  return result;
}

uint64_t sub_F288()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  uint64_t result = (uint64_t)sub_F6D8(0xD00000000000001BLL, 0x8000000000026AB0);
  if (!result)
  {
    sub_25690(79);
    v2._countAndFlagsBits = 0xD00000000000004DLL;
    v2._object = (void *)0x8000000000026B10;
    sub_253E0(v2);
    v3._countAndFlagsBits = 0xD00000000000001BLL;
    v3._object = (void *)0x8000000000026AB0;
    sub_253E0(v3);
    sub_24DC0(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    uint64_t result = sub_25750();
    __break(1u);
  }
  return result;
}

void sub_F3A0(uint64_t a1, void *a2, void *a3)
{
  id v18 = a3;
  uint64_t v6 = sub_25310();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31488 != -1) {
    swift_once();
  }
  sub_F73C();
  uint64_t v10 = sub_C2FC(v6, (uint64_t)qword_31D88);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  objc_super v11 = sub_25300();
  os_log_type_t v12 = sub_25560();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v17 = a1;
    int64_t v14 = (uint8_t *)v13;
    uint64_t v3 = swift_slowAlloc();
    uint64_t v19 = v3;
    uint64_t v20 = 0x6269726373627553;
    *(_DWORD *)int64_t v14 = 136315138;
    int64_t v16 = v14 + 4;
    unint64_t v21 = 0xEA00000000002E65;
    v22._countAndFlagsBits = v17;
    v22._object = a2;
    sub_253E0(v22);
    uint64_t v20 = sub_14464(v20, v21, &v19);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, v12, "Disabling event '%s'", v14, 0xCu);
    swift_arrayDestroy();
    sub_F73C();
    swift_slowDealloc();
    a1 = v17;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v20 = v3;
  unint64_t v21 = 0xEA00000000002E65;
  v23._countAndFlagsBits = a1;
  v23._object = a2;
  sub_253E0(v23);
  swift_bridgeObjectRetain();
  v24._countAndFlagsBits = 0x626173694473492ELL;
  v24._object = (void *)0xEB0000000064656CLL;
  sub_253E0(v24);
  swift_bridgeObjectRelease();
  NSString v15 = sub_25390();
  swift_bridgeObjectRelease();
  [v18 setBool:1 forKey:v15];
}

id sub_F6D8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithSuiteName:v3];

  return v4;
}

uint64_t TTSDownloader.localeToPercentageMap.getter()
{
  return swift_retain();
}

uint64_t TTSDownloader.localeToPercentageMap.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*TTSDownloader.localeToPercentageMap.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t TTSDownloader.onChangeActions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTSDownloader.onChangeActions.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*TTSDownloader.onChangeActions.modify())()
{
  return j__swift_endAccess;
}

void sub_F8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v51 = a3;
  uint64_t v9 = sub_25310();
  sub_E438();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  int64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_C2FC(v9, (uint64_t)qword_31D88);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v15, v9);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  int64_t v16 = sub_25300();
  os_log_type_t v17 = sub_25560();
  int v18 = v17;
  BOOL v19 = os_log_type_enabled(v16, v17);
  uint64_t v50 = a1;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v49 = v5;
    uint64_t v21 = v20;
    BOOL v46 = (void **)swift_slowAlloc();
    aBlock = v46;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v47 = v9;
    uint64_t v48 = v15;
    if (a2) {
      uint64_t v22 = a1;
    }
    else {
      uint64_t v22 = 7104878;
    }
    if (a2) {
      unint64_t v23 = a2;
    }
    else {
      unint64_t v23 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_14464(v22, v23, (uint64_t *)&aBlock);
    HIDWORD(v45) = v18;
    sub_255F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    if (a4) {
      uint64_t v24 = v51;
    }
    else {
      uint64_t v24 = 7104878;
    }
    if (a4) {
      unint64_t v25 = a4;
    }
    else {
      unint64_t v25 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_14464(v24, v25, (uint64_t *)&aBlock);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v16, BYTE4(v45), "#TTSDownloadUtil triggerVoiceDownload locale %s, voiceName %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    sub_E414();
    uint64_t v5 = v49;
    sub_E414();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v47);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  }
  if (a2)
  {
    BOOL v26 = sub_10DA0(v50, a2);
    if (!v26)
    {
      sub_252F0();
      uint64_t v27 = sub_252E0();
      BOOL v26 = sub_10DA0(v27, v28);
      swift_bridgeObjectRelease();
      if (!v26) {
        goto LABEL_25;
      }
    }
LABEL_24:
    id v29 = v26;
    id v30 = [v29 primaryLanguage];
    sub_253A0();

    id v31 = [v29 name];
    sub_253A0();

    id v32 = objc_allocWithZone((Class)sub_252A0());
    uint64_t v33 = (void *)sub_25280();
    id v34 = [objc_allocWithZone((Class)sub_25230()) init];
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v33;
    *(void *)(v35 + 24) = v34;
    id v36 = v33;
    id v37 = v34;
    sub_25200();
    swift_release();
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = v29;
    *(void *)(v38 + 24) = v5;
    uint64_t v57 = sub_11AEC;
    uint64_t v58 = v38;
    aBlock = _NSConcreteStackBlock;
    uint64_t v54 = 1107296256;
    unint64_t v55 = sub_10B4C;
    uint64_t v56 = &unk_2CED0;
    uint64_t v39 = _Block_copy(&aBlock);
    id v40 = v29;
    swift_retain();
    swift_release();
    uint64_t v57 = (void (*)(uint64_t, uint64_t))nullsub_1;
    uint64_t v58 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v54 = 1107296256;
    unint64_t v55 = sub_10BBC;
    uint64_t v56 = &unk_2CEF8;
    uint64_t v41 = _Block_copy(&aBlock);
    swift_release();
    [v40 downloadWithReservation:0 useBattery:1 progress:v39 then:v41];

    _Block_release(v41);
    _Block_release(v39);
    return;
  }
  if (a4)
  {
    BOOL v26 = sub_111BC(v51, a4);
    if (v26) {
      goto LABEL_24;
    }
  }
LABEL_25:
  uint64_t v42 = sub_25300();
  os_log_type_t v43 = sub_25550();
  if (os_log_type_enabled(v42, v43))
  {
    char v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v44 = 0;
    _os_log_impl(&dword_0, v42, v43, "#TTSDownloadUtil ttsVoice is nil", v44, 2u);
    sub_E414();
  }
}

uint64_t sub_FEE8(unint64_t a1, void *a2)
{
  if (qword_31488 != -1) {
    goto LABEL_27;
  }
  while (1)
  {
    uint64_t v4 = sub_25310();
    sub_C2FC(v4, (uint64_t)qword_31D88);
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_25300();
    os_log_type_t v6 = sub_25560();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_252C0();
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_25430();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      uint64_t v33 = sub_14464(v8, v10, &v34);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v5, v6, "#TTSDownloadUtil existingSubscriptions %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_25760();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    }
    uint64_t v12 = &_swiftEmptyArrayStorage;
    if (!v11) {
      break;
    }
    uint64_t v34 = (uint64_t)&_swiftEmptyArrayStorage;
    sub_25700();
    if (v11 < 0)
    {
      __break(1u);
LABEL_30:
      sub_25450();
      goto LABEL_24;
    }
    uint64_t v13 = 0;
    while (v11 != v13)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v14 = (id)sub_256B0();
      }
      else {
        id v14 = *(id *)(a1 + 8 * v13 + 32);
      }
      uint64_t v15 = v14;
      id v32 = v14;
      sub_10510(&v32, &v33);

      ++v13;
      sub_256E0();
      sub_25710();
      sub_25720();
      sub_256F0();
      if (v11 == v13)
      {
        uint64_t v12 = (void *)v34;
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_27:
    swift_once();
  }
LABEL_16:
  sub_14FF0();
  if (v16) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain_n();
  os_log_type_t v17 = sub_25300();
  os_log_type_t v18 = sub_25560();
  if (os_log_type_enabled(v17, v18))
  {
    BOOL v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)BOOL v19 = 136315138;
    sub_252A0();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_25430();
    uint64_t v21 = a2;
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_14464(v20, v23, &v34);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    a2 = v21;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v17, v18, "#TTSDownloadUtil current subscriptions %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = a2;
  unint64_t v25 = sub_25300();
  os_log_type_t v26 = sub_25560();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 138412290;
    uint64_t v34 = (uint64_t)v24;
    id v29 = v24;
    sub_255F0();
    *uint64_t v28 = v24;

    _os_log_impl(&dword_0, v25, v26, "#TTSDownloadUtil adding subscribe %@", v27, 0xCu);
    sub_BA78(&qword_315C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    unint64_t v25 = v24;
  }

  uint64_t v34 = (uint64_t)v12;
  id v30 = v24;
  sub_25400();
  if (*(void *)((char *)&dword_10 + (v34 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v34 & 0xFFFFFFFFFFFFFF8)) >> 1)
    goto LABEL_30;
LABEL_24:
  sub_25480();
  sub_25440();
  sub_25220();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10510@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  NSString v3 = *a1;
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25310();
  sub_C2FC(v4, (uint64_t)qword_31D88);
  id v5 = v3;
  os_log_type_t v6 = sub_25300();
  os_log_type_t v7 = sub_25560();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_255F0();
    void *v9 = v5;

    _os_log_impl(&dword_0, v6, v7, "#TTSDownloadUtil subscribedVoices %@", v8, 0xCu);
    sub_BA78(&qword_315C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = (void *)sub_252B0();
  sub_25290();

  uint64_t v12 = (void *)sub_252B0();
  sub_25270();

  id v13 = objc_allocWithZone((Class)sub_252A0());
  uint64_t result = sub_25280();
  *a2 = result;
  return result;
}

void sub_10728(uint64_t a1, uint64_t a2, void *a3)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25310();
  sub_C2FC(v6, (uint64_t)qword_31D88);
  os_log_type_t v7 = sub_25300();
  os_log_type_t v8 = sub_25560();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134218496;
    sub_255F0();
    *(_WORD *)(v9 + 12) = 2048;
    sub_255F0();
    *(_WORD *)(v9 + 22) = 2048;
    double v31 = *(double *)&a2;
    sub_255F0();
    _os_log_impl(&dword_0, v7, v8, "#TTSDownloadUtil time %f, done %ld, expected %ld", (uint8_t *)v9, 0x20u);
    swift_slowDealloc();
  }

  id v10 = sub_25300();
  os_log_type_t v11 = sub_25560();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    double v31 = (float)((float)((float)a1 / (float)a2) * 100.0);
    sub_255F0();
    _os_log_impl(&dword_0, v10, v11, "#TTSDownloadUtil (done / expected * 100) %f", v12, 0xCu);
    swift_slowDealloc();
  }

  id v13 = a3;
  id v14 = sub_25300();
  os_log_type_t v15 = sub_25560();
  char v16 = &MessagingWithSiriController;
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
    double v31 = COERCE_DOUBLE(swift_slowAlloc());
    *(_DWORD *)os_log_type_t v17 = 136315138;
    id v18 = [v13 primaryLanguage];
    uint64_t v19 = a2;
    uint64_t v20 = sub_253A0();
    uint64_t v30 = a1;
    unint64_t v22 = v21;

    uint64_t v23 = v20;
    a2 = v19;
    sub_14464(v23, v22, (uint64_t *)&v31);
    sub_255F0();

    a1 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v14, v15, "#TTSDownloadUtil ttsVoice.primaryLangue %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    char v16 = &MessagingWithSiriController;
    swift_slowDealloc();
  }
  else
  {
  }
  float v24 = (float)((float)a1 / (float)a2) * 100.0;
  if ((~LODWORD(v24) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v24 <= -9.2234e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v24 < 9.2234e18)
  {
    uint64_t v25 = (uint64_t)v24;
    id v26 = objc_msgSend(v13, (SEL)v16[32].ivar_lyt);
    uint64_t v27 = sub_253A0();
    uint64_t v29 = v28;

    sub_10C28(v27, v29, v25);
    swift_bridgeObjectRelease();
    return;
  }
LABEL_16:
  __break(1u);
}

uint64_t sub_10B4C(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  os_log_type_t v7 = *(void (**)(uint64_t, uint64_t, double))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);

  return swift_release();
}

void sub_10BBC(uint64_t a1, void *a2)
{
  NSString v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_E520();
  swift_retain();
  sub_11898(a1, a2, a3);
  swift_release();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25310();
  sub_C2FC(v8, (uint64_t)qword_31D88);
  uint64_t v9 = sub_25300();
  os_log_type_t v10 = sub_25560();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "#TTSDownloadUtil calling on change", v11, 2u);
    sub_E414();
  }

  uint64_t result = sub_E520();
  uint64_t v13 = *(void *)(v4 + 24);
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = v13 + 40;
    do
    {
      char v16 = *(void (**)(uint64_t))(v15 - 8);
      uint64_t v17 = swift_retain();
      v16(v17);
      swift_release();
      v15 += 16;
      --v14;
    }
    while (v14);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_10DA0(uint64_t a1, uint64_t a2)
{
  sub_DC98(0, &qword_31850);
  sub_BA78(&qword_31858);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_26300;
  sub_DC98(0, &qword_31860);
  *(void *)(v4 + 32) = sub_25520();
  uint64_t v25 = v4;
  sub_25440();
  sub_BA78(&qword_31868);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26310;
  *(void *)(inited + 64) = &type metadata for String;
  *(void *)(inited + 32) = 1;
  *(void *)(inited + 40) = a1;
  uint64_t v23 = a1;
  *(void *)(inited + 48) = a2;
  type metadata accessor for TTSAssetProperty();
  sub_11A24();
  uint64_t v24 = a2;
  swift_bridgeObjectRetain();
  sub_25380();
  uint64_t v6 = (void *)sub_255D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25310();
  sub_C2FC(v7, (uint64_t)qword_31D88);
  id v8 = v6;
  uint64_t v9 = sub_25300();
  os_log_type_t v10 = sub_25560();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)sub_E46C();
    uint64_t v25 = sub_E484();
    *(_DWORD *)os_log_type_t v11 = 136315138;
    id v12 = v8;
    sub_BA78(&qword_31878);
    uint64_t v13 = sub_253C0();
    sub_14464(v13, v14, &v25);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, v10, "#TTSDownloadUtil voice: %s", v11, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
  id v15 = v8;
  char v16 = sub_25300();
  os_log_type_t v17 = sub_25560();
  if (!os_log_type_enabled(v16, v17))
  {

    uint64_t v19 = v6;
    if (!v6) {
      return v19;
    }
    goto LABEL_12;
  }
  id v18 = (uint8_t *)sub_E46C();
  uint64_t v25 = sub_E484();
  *(_DWORD *)id v18 = 136315138;
  uint64_t v19 = v6;
  if (v6) {
    [v15 locallyAvailable];
  }
  sub_BA78(&qword_315B8);
  uint64_t v20 = sub_253C0();
  sub_14464(v20, v21, &v25);
  sub_255F0();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_0, v16, v17, "#TTSDownloadUtil is locally available: %s", v18, 0xCu);
  swift_arrayDestroy();
  sub_E414();
  sub_E414();

  if (v6)
  {
LABEL_12:
    if (([v15 locallyAvailable] & 1) == 0) {
      sub_10C28(v23, v24, 0);
    }
  }
  return v19;
}

void *sub_111BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25310();
  sub_E438();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v48 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DC98(0, &qword_31850);
  sub_BA78(&qword_31858);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_26300;
  sub_DC98(0, &qword_31860);
  *(void *)(v9 + 32) = sub_25520();
  uint64_t v52 = v9;
  sub_25440();
  sub_BA78(&qword_31868);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26310;
  *(void *)(inited + 64) = &type metadata for String;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 48) = a2;
  type metadata accessor for TTSAssetProperty();
  sub_11A24();
  swift_bridgeObjectRetain();
  sub_25380();
  os_log_type_t v11 = (void *)sub_255D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_C2FC(v4, (uint64_t)qword_31D88);
  id v13 = v11;
  unint64_t v14 = sub_25300();
  os_log_type_t v15 = sub_25560();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v49 = v6;
  uint64_t v50 = v11;
  if (v16)
  {
    uint64_t v47 = v4;
    os_log_type_t v17 = (uint8_t *)sub_E46C();
    uint64_t v52 = sub_E484();
    *(_DWORD *)os_log_type_t v17 = 136315138;
    uint64_t v51 = (uint64_t)v11;
    id v18 = v13;
    sub_BA78(&qword_31878);
    uint64_t v19 = sub_253C0();
    uint64_t v21 = sub_14464(v19, v20, &v52);
    sub_11B58(v21);
    uint64_t v4 = v47;
    sub_255F0();

    uint64_t v6 = v49;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v14, v15, "#TTSDownloadUtil voice: %s", v17, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
  id v22 = v13;
  uint64_t v23 = sub_25300();
  os_log_type_t v24 = sub_25560();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v47 = v12;
    uint64_t v25 = (uint8_t *)sub_E46C();
    uint64_t v52 = sub_E484();
    *(_DWORD *)uint64_t v25 = 136315138;
    if (v50) {
      unsigned __int8 v26 = [v22 locallyAvailable];
    }
    else {
      unsigned __int8 v26 = 2;
    }
    LOBYTE(v51) = v26;
    sub_BA78(&qword_315B8);
    uint64_t v27 = sub_253C0();
    uint64_t v51 = sub_14464(v27, v28, &v52);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v23, v24, "#TTSDownloadUtil is locally available: %s", v25, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    uint64_t v6 = v49;
    uint64_t v12 = v47;
  }
  else
  {
  }
  uint64_t v29 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v48, v12, v4);
  id v30 = v22;
  double v31 = sub_25300();
  os_log_type_t v32 = sub_25560();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = v4;
    uint64_t v34 = (uint8_t *)sub_E46C();
    uint64_t v52 = sub_E484();
    *(_DWORD *)uint64_t v34 = 136315138;
    if (v50)
    {
      id v35 = [v30 primaryLanguage];
      uint64_t v36 = sub_253A0();
      unint64_t v38 = v37;
    }
    else
    {
      unint64_t v38 = 0xE300000000000000;
      uint64_t v36 = 7104878;
    }
    uint64_t v39 = sub_14464(v36, v38, &v52);
    sub_11B58(v39);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v31, v32, "#TTSDownloadUtil primaryLanguage: %s", v34, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v33);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v29, v4);
  }
  id v40 = v50;
  if (v50)
  {
    unsigned __int8 v41 = [v30 locallyAvailable];
    id v42 = [v30 primaryLanguage];
    uint64_t v43 = sub_253A0();
    uint64_t v45 = v44;

    if ((v41 & 1) == 0) {
      sub_10C28(v43, v45, 0);
    }
    swift_bridgeObjectRelease();
  }
  return v40;
}

uint64_t TTSDownloader.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TTSDownloader.__deallocating_deinit()
{
  TTSDownloader.deinit();
  uint64_t v0 = sub_11B48();

  return _swift_deallocClassInstance(v0);
}

uint64_t sub_11848()
{
  sub_BA78(&qword_31498);
  swift_allocObject();
  *(void *)(v0 + 16) = sub_BB68();
  *(void *)(v0 + 24) = &_swiftEmptyArrayStorage;
  return v0;
}

id sub_11898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)(v3 + 24);
  [v7 lock];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1CC58(a3, a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return [v7 unlock];
}

uint64_t ThreadSafeDictionary.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ThreadSafeDictionary.__deallocating_deinit()
{
  ThreadSafeDictionary.deinit();
  uint64_t v0 = sub_11B48();

  return _swift_deallocClassInstance(v0);
}

uint64_t type metadata accessor for TTSDownloader()
{
  return self;
}

uint64_t sub_119B8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ThreadSafeDictionary()
{
  return sub_11B0C();
}

unint64_t sub_11A24()
{
  unint64_t result = qword_31870;
  if (!qword_31870)
  {
    type metadata accessor for TTSAssetProperty();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31870);
  }
  return result;
}

uint64_t sub_11A74()
{
  uint64_t v1 = sub_11B48();

  return _swift_deallocObject(v1, v2, v3);
}

uint64_t sub_11AAC(unint64_t a1)
{
  return sub_FEE8(a1, *(void **)(v1 + 16));
}

uint64_t sub_11AB4()
{
  swift_release();
  uint64_t v1 = sub_11B48();

  return _swift_deallocObject(v1, v2, v3);
}

void sub_11AEC(uint64_t a1, uint64_t a2)
{
  sub_10728(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_11AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_11B04()
{
  return swift_release();
}

uint64_t sub_11B0C()
{
  return swift_getGenericMetadata();
}

uint64_t sub_11B48()
{
  return v0;
}

uint64_t sub_11B58(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t sub_11B70()
{
  return swift_beginAccess();
}

uint64_t static MessagesSettingsUtils.getLocalizedString(_:)(uint64_t a1, void *a2)
{
  type metadata accessor for MessagingWithSiriController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v5 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v9._countAndFlagsBits = 0xE000000000000000;
  v11.value._object = (void *)0x8000000000026390;
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  v11.value._countAndFlagsBits = 0xD000000000000014;
  v6.super.Class isa = v5;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  uint64_t v7 = sub_25110(v10, v11, v6, v12, v9);

  return v7;
}

uint64_t *MessagesSettingsUtils.daemonSession.unsafeMutableAddressor()
{
  if (qword_31448 != -1) {
    swift_once();
  }
  return &static MessagesSettingsUtils.daemonSession;
}

void *MessagesSettingsUtils.sharedReadingId.unsafeMutableAddressor()
{
  return &static MessagesSettingsUtils.sharedReadingId;
}

uint64_t sub_11CA4(uint64_t a1)
{
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v3 = sub_14C2C(ObjCClassFromMetadata);
  if (!v3)
  {
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25310();
    sub_C2FC(v6, (uint64_t)qword_31D88);
    uint64_t v7 = (void *)sub_25300();
    os_log_type_t v8 = sub_25560();
    if (sub_E554(v8))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_E5BC(&dword_0, v9, v10, "#SUICAssistantVoiceSettingsConnection assistantLanguageTitlesDictionary nil");
      sub_E414();
    }

    return 0;
  }
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  sub_25660();
  sub_219A8((uint64_t)v11, v4, &v12);
  swift_bridgeObjectRelease();
  sub_E1DC((uint64_t)v11);
  if (!v13)
  {
    sub_14C98((uint64_t)&v12);
    return 0;
  }
  if (swift_dynamicCast()) {
    return a1;
  }
  else {
    return 0;
  }
}

id sub_11E1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_251B0();
  sub_E438();
  uint64_t v4 = v3;
  __chkstk_darwin();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25120();
  Class isa = sub_25180().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  id v8 = [v1 isEquivalentTo:isa];

  return v8;
}

uint64_t *MessagesSettingsUtils.readableLanguageToLocaleMap.unsafeMutableAddressor()
{
  if (qword_31458 != -1) {
    swift_once();
  }
  return &static MessagesSettingsUtils.readableLanguageToLocaleMap;
}

uint64_t *MessagesSettingsUtils.ttsDownloader.unsafeMutableAddressor()
{
  if (qword_31440 != -1) {
    swift_once();
  }
  return &static MessagesSettingsUtils.ttsDownloader;
}

void sub_11F9C(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_25310();
  sub_E438();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_14DDC();
  if (qword_31488 != -1) {
    swift_once();
  }
  sub_C2FC(v5, (uint64_t)qword_31D88);
  uint64_t v9 = sub_14D98();
  v10(v9);
  swift_bridgeObjectRetain_n();
  Swift::String_optional v11 = sub_25300();
  os_log_type_t v12 = sub_25530();
  uint64_t v25 = a1;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v24 = v5;
    swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    sub_14DF4(4.8149e-34);
    uint64_t v15 = v14 | 0x6C0000u;
    if (v13) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = a1;
    }
    if (v13) {
      unint64_t v17 = 0xE300000000000000;
    }
    else {
      unint64_t v17 = a2;
    }
    swift_bridgeObjectRetain();
    sub_14464(v16, v17, &v26);
    sub_255F0();
    sub_14E28();
    swift_bridgeObjectRelease();
    sub_14E08(&dword_0, v18, v19, "#MessagingWithSiriController unsubscribing from %s");
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v24);
  }
  else
  {

    sub_14E28();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  }
  if (a2)
  {
    sub_129A4(v25, a2);
  }
  else
  {
    unint64_t v20 = (void *)sub_25300();
    os_log_type_t v21 = sub_25550();
    if (sub_E554(v21))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_E5BC(&dword_0, v22, v23, "#MessagingWithSiriController locale for unsubscribeVoice was nil");
      sub_E414();
    }
  }
}

unint64_t static MessagesSettingsUtils.sharedReadingId.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_12224()
{
  type metadata accessor for TTSDownloader();
  swift_allocObject();
  uint64_t result = sub_11848();
  static MessagesSettingsUtils.ttsDownloader = result;
  return result;
}

uint64_t static MessagesSettingsUtils.ttsDownloader.getter()
{
  if (qword_31440 != -1) {
    swift_once();
  }
  sub_14DBC();
  return swift_retain();
}

uint64_t static MessagesSettingsUtils.ttsDownloader.setter(uint64_t a1)
{
  return sub_128B4(a1, &qword_31440, &static MessagesSettingsUtils.ttsDownloader, (uint64_t (*)(uint64_t))&_swift_release);
}

uint64_t (*static MessagesSettingsUtils.ttsDownloader.modify())()
{
  if (qword_31440 != -1) {
    swift_once();
  }
  sub_11B70();
  return j_j__swift_endAccess;
}

id sub_1237C()
{
  id result = [objc_allocWithZone((Class)sub_25230()) init];
  static MessagesSettingsUtils.daemonSession = (uint64_t)result;
  return result;
}

id static MessagesSettingsUtils.daemonSession.getter()
{
  return sub_12514(&qword_31448, (void **)&static MessagesSettingsUtils.daemonSession);
}

void static MessagesSettingsUtils.daemonSession.setter(void *a1)
{
}

uint64_t (*static MessagesSettingsUtils.daemonSession.modify())()
{
  if (qword_31448 != -1) {
    swift_once();
  }
  sub_11B70();
  return j__swift_endAccess;
}

id sub_12470()
{
  id result = [objc_allocWithZone((Class)SUICAssistantVoiceSettingsConnection) init];
  static MessagesSettingsUtils.siriUISettingsConnection = (uint64_t)result;
  return result;
}

uint64_t *MessagesSettingsUtils.siriUISettingsConnection.unsafeMutableAddressor()
{
  if (qword_31450 != -1) {
    swift_once();
  }
  return &static MessagesSettingsUtils.siriUISettingsConnection;
}

id static MessagesSettingsUtils.siriUISettingsConnection.getter()
{
  return sub_12514(&qword_31450, (void **)&static MessagesSettingsUtils.siriUISettingsConnection);
}

id sub_12514(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  sub_14DBC();
  uint64_t v3 = *a2;

  return v3;
}

void static MessagesSettingsUtils.siriUISettingsConnection.setter(void *a1)
{
}

void sub_12590(void *a1, void *a2, void **a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = *a3;
  *a3 = a1;
}

uint64_t (*static MessagesSettingsUtils.siriUISettingsConnection.modify())()
{
  if (qword_31450 != -1) {
    swift_once();
  }
  sub_11B70();
  return j_j__swift_endAccess;
}

uint64_t sub_12670()
{
  uint64_t result = sub_25380();
  static MessagesSettingsUtils.readableLanguageToLocaleMap = result;
  return result;
}

uint64_t static MessagesSettingsUtils.readableLanguageToLocaleMap.getter()
{
  return sub_12830(&qword_31458);
}

uint64_t static MessagesSettingsUtils.readableLanguageToLocaleMap.setter(uint64_t a1)
{
  return sub_128B4(a1, &qword_31458, &static MessagesSettingsUtils.readableLanguageToLocaleMap, (uint64_t (*)(uint64_t))&_swift_bridgeObjectRelease);
}

uint64_t (*static MessagesSettingsUtils.readableLanguageToLocaleMap.modify())()
{
  if (qword_31458 != -1) {
    swift_once();
  }
  sub_11B70();
  return j_j__swift_endAccess;
}

uint64_t sub_12780()
{
  uint64_t result = sub_25380();
  static MessagesSettingsUtils.localeToPercentage = result;
  return result;
}

uint64_t *MessagesSettingsUtils.localeToPercentage.unsafeMutableAddressor()
{
  if (qword_31460 != -1) {
    swift_once();
  }
  return &static MessagesSettingsUtils.localeToPercentage;
}

uint64_t static MessagesSettingsUtils.localeToPercentage.getter()
{
  return sub_12830(&qword_31460);
}

uint64_t sub_12830(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  sub_14DBC();
  return swift_bridgeObjectRetain();
}

uint64_t static MessagesSettingsUtils.localeToPercentage.setter(uint64_t a1)
{
  return sub_128B4(a1, &qword_31460, &static MessagesSettingsUtils.localeToPercentage, (uint64_t (*)(uint64_t))&_swift_bridgeObjectRelease);
}

uint64_t sub_128B4(uint64_t a1, void *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v7 = *a3;
  *a3 = a1;
  return a4(v7);
}

uint64_t (*static MessagesSettingsUtils.localeToPercentage.modify())()
{
  if (qword_31460 != -1) {
    swift_once();
  }
  sub_11B70();
  return j_j__swift_endAccess;
}

void sub_129A4(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_25310();
  sub_E438();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_14DDC();
  if (qword_31488 != -1) {
    swift_once();
  }
  sub_C2FC(v5, (uint64_t)qword_31D88);
  uint64_t v9 = sub_14D98();
  v10(v9);
  swift_bridgeObjectRetain_n();
  Swift::String_optional v11 = sub_25300();
  os_log_type_t v12 = sub_25530();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v28 = v5;
    swift_slowAlloc();
    v30[0] = swift_slowAlloc();
    sub_14DF4(4.8149e-34);
    uint64_t v15 = v14 | 0x6C0000u;
    if (v13) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = a1;
    }
    uint64_t v29 = a1;
    if (v13) {
      unint64_t v17 = 0xE300000000000000;
    }
    else {
      unint64_t v17 = a2;
    }
    swift_bridgeObjectRetain();
    sub_14464(v16, v17, v30);
    sub_255F0();
    sub_14E28();
    a1 = v29;
    swift_bridgeObjectRelease();
    sub_14E08(&dword_0, v18, v19, "#MessagingWithSiriController unsubscribing TTS subscription from %s");
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v28);
  }
  else
  {

    sub_14E28();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  }
  if (a2)
  {
    uint64_t v20 = qword_31448;
    swift_bridgeObjectRetain();
    if (v20 != -1) {
      swift_once();
    }
    swift_beginAccess();
    os_log_type_t v21 = (void *)static MessagesSettingsUtils.daemonSession;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = a1;
    *(void *)(v22 + 24) = a2;
    id v23 = v21;
    sub_25200();

    swift_release();
  }
  else
  {
    uint64_t v24 = (void *)sub_25300();
    os_log_type_t v25 = sub_25550();
    if (sub_E554(v25))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_E5BC(&dword_0, v26, v27, "#MessagingWithSiriController locale for unsubscribeTTSVoice was nil");
      sub_E414();
    }
  }
}

void sub_12CC4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25310();
  sub_C2FC(v6, (uint64_t)qword_31D88);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25300();
  os_log_type_t v8 = sub_25560();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v22 = a3;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v23[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_252C0();
    uint64_t v10 = a2;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25430();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    uint64_t v14 = v11;
    a2 = v10;
    sub_14464(v14, v13, v23);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    a3 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v7, v8, "#MessagesSettingsUtils existingSubscriptions %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  sub_130BC(a1, a2, a3);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_25300();
  os_log_type_t v16 = sub_25560();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    v23[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v17 = 136315138;
    sub_252A0();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25430();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    sub_14464(v18, v20, v23);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v15, v16, "#MessagesSettingsUtils after unsubscribing %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (qword_31448 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v21 = (id)static MessagesSettingsUtils.daemonSession;
  sub_25220();
  swift_bridgeObjectRelease();
}

void *sub_130BC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_25760())
  {
    uint64_t v5 = 4;
    uint64_t v6 = a2;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)sub_256B0() : *(id *)(a1 + 8 * v5);
      os_log_type_t v8 = v7;
      uint64_t v9 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      uint64_t v10 = (void *)sub_252B0();
      uint64_t v11 = sub_25290();
      uint64_t v13 = v12;

      if (v11 == v6 && v13 == a3)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        char v15 = sub_257C0();
        swift_bridgeObjectRelease();
        if (v15)
        {
        }
        else
        {
          os_log_type_t v16 = (void *)sub_252B0();
          sub_25290();

          unint64_t v17 = (void *)sub_252B0();
          sub_25270();

          id v18 = objc_allocWithZone((Class)sub_252A0());
          uint64_t v6 = a2;
          uint64_t v19 = sub_25280();

          if (v19)
          {
            sub_25400();
            if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
              sub_25450();
            }
            sub_25480();
            sub_25440();
          }
        }
      }
      ++v5;
      if (v9 == v4) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
  }
LABEL_23:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t static MessagesSettingsUtils.chosenTTSAssetFor(language:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25310();
  sub_C2FC(v8, (uint64_t)qword_31D88);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_25300();
  os_log_type_t v10 = sub_25560();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v16[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_14464(a1, a2, v16);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v9, v10, "#MessagesSettingsUtils chosenTTSAssetFor: %s)", v11, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (qword_31448 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v12 = (void *)static MessagesSettingsUtils.daemonSession;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a1;
  v13[3] = a2;
  v13[4] = a3;
  v13[5] = a4;
  swift_bridgeObjectRetain();
  id v14 = v12;
  swift_retain();
  sub_25200();

  return swift_release();
}

void sub_1358C(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void *))
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25310();
  sub_C2FC(v8, (uint64_t)qword_31D88);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_25300();
  os_log_type_t v10 = sub_25560();
  uint64_t v11 = &off_26000;
  BOOL v46 = a4;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_252C0();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25430();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_14464(v13, v15, &v47);
    uint64_t v11 = &off_26000;
    sub_255F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, v10, "#MessagesSettingsUtils subscribedVoices: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v16 = sub_13D34(a1, a2, a3);
  if (v16)
  {
    id v17 = v16;
    id v18 = sub_25300();
    os_log_type_t v19 = sub_25560();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)unint64_t v20 = *((void *)v11 + 17);
      id v21 = v17;
      id v22 = v17;
      id v23 = [v21 description];
      uint64_t v24 = sub_253A0();
      unint64_t v26 = v25;

      id v17 = v22;
      sub_14464(v24, v26, &v47);
      sub_255F0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v18, v19, "#MessagesSettingsUtils preferredVoice: %s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_DC98(0, &qword_31850);
    sub_BA78(&qword_31858);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_26300;
    sub_DC98(0, &qword_31860);
    *(void *)(v30 + 32) = sub_25520();
    uint64_t v47 = v30;
    sub_25440();
    sub_BA78(&qword_31868);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_26310;
    *(void *)(inited + 32) = 0;
    os_log_type_t v32 = (void *)sub_252B0();
    uint64_t v33 = sub_25270();
    uint64_t v35 = v34;

    *(void *)(inited + 64) = sub_BA78(&qword_31888);
    *(void *)(inited + 40) = v33;
    *(void *)(inited + 48) = v35;
    type metadata accessor for TTSAssetProperty();
    sub_11A24();
    sub_25380();
    uint64_t v36 = (void *)sub_255D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v37 = v36;
    unint64_t v38 = sub_25300();
    os_log_type_t v39 = sub_25560();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 136315394;
      id v41 = v37;
      sub_BA78(&qword_31878);
      uint64_t v42 = sub_253C0();
      sub_14464(v42, v43, &v47);
      sub_255F0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      if (v36) {
        [v41 locallyAvailable];
      }
      sub_BA78(&qword_315B8);
      uint64_t v44 = sub_253C0();
      sub_14464(v44, v45, &v47);
      sub_255F0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v38, v39, "#MessagesSettingsUtils voice: %s, is locally available: %s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v46(v36);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_25300();
    os_log_type_t v28 = sub_25560();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = *((void *)v11 + 17);
      swift_bridgeObjectRetain();
      sub_14464(a2, a3, &v47);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v27, v28, "#MessagesSettingsUtils no subscribed voice for %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v46(0);
  }
}

void *sub_13D34(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a1;
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_25310();
    sub_C2FC(v32, (uint64_t)qword_31D88);
    swift_bridgeObjectRetain_n();
    uint64_t v33 = sub_25300();
    os_log_type_t v34 = sub_25560();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136315138;
      swift_bridgeObjectRetain();
      sub_14464(a2, a3, &v43);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v33, v34, "#MessagesSettingsUtils did not find subscribed voice for %s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
LABEL_29:
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25760();
  if (!v5) {
    goto LABEL_30;
  }
LABEL_3:
  sub_DC98(0, &qword_315A0);
  unint64_t v39 = v4 & 0xC000000000000001;
  uint64_t v6 = 4;
  uint64_t v36 = v5;
  unint64_t v37 = v4;
  unint64_t v38 = a3;
  while (1)
  {
    if (v39) {
      id v7 = (id)sub_256B0();
    }
    else {
      id v7 = *(id *)(v4 + 8 * v6);
    }
    if (__OFADD__(v6 - 4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    uint64_t v41 = v6 - 3;
    uint64_t v42 = v7;
    uint64_t v8 = (void *)sub_252B0();
    sub_25290();

    id v9 = sub_14E40();
    id v10 = [v9 languageCode];

    uint64_t v11 = sub_253A0();
    unint64_t v13 = v12;

    swift_bridgeObjectRetain();
    id v14 = sub_14E40();
    id v15 = [v14 languageCode];

    uint64_t v16 = sub_253A0();
    unint64_t v18 = v17;

    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25310();
    sub_C2FC(v19, (uint64_t)qword_31D88);
    swift_bridgeObjectRetain_n();
    unint64_t v20 = sub_25300();
    os_log_type_t v21 = sub_25560();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v22 + 4) = sub_14464(v11, v13, &v43);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v20, v21, "#MessagesSettingsUtils voiceLanguage: %s", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain_n();
    id v23 = sub_25300();
    os_log_type_t v24 = sub_25560();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v25 + 4) = sub_14464(v16, v18, &v43);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v23, v24, "#MessagesSettingsUtils languageOfText: %s", (uint8_t *)v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a3 = v38;
    if (v11 == v16 && v13 == v18) {
      break;
    }
    char v27 = sub_257C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_24;
    }

    ++v6;
    unint64_t v4 = v37;
    if (v41 == v36) {
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_24:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  os_log_type_t v28 = sub_25300();
  os_log_type_t v29 = sub_25560();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315138;
    swift_bridgeObjectRetain();
    sub_14464(a2, v38, &v43);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v28, v29, "#MessagesSettingsUtils found subscribed voice for %s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v42;
}

uint64_t sub_14418()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_14458(unint64_t a1)
{
  sub_1358C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void *))(v1 + 32));
}

uint64_t sub_14464(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_14548(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_14D38((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_14D38((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_E284((uint64_t)v12);
  return v7;
}

ValueMetadata *type metadata accessor for MessagesSettingsUtils()
{
  return &type metadata for MessagesSettingsUtils;
}

uint64_t sub_14548(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_146A0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25600();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_14778(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_256D0();
    if (!v8)
    {
      uint64_t result = sub_25740();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_146A0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25770();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_14778(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_14810(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_149EC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_149EC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_14810(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_253F0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_14984(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_256A0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_25770();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_25740();
  __break(1u);
  return result;
}

void *sub_14984(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_BA78(&qword_31880);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_149EC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_BA78(&qword_31880);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_14B9C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_14AC4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_14AC4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25770();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_14B9C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25770();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_14C2C(void *a1)
{
  id v1 = [a1 assistantLanguageTitlesDictionary];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25360();

  return v3;
}

uint64_t sub_14C98(uint64_t a1)
{
  uint64_t v2 = sub_BA78(&qword_31570);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_14CF8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_14D30(unint64_t a1)
{
  sub_12CC4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_14D38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_14D98()
{
  return v0;
}

uint64_t sub_14DBC()
{
  return swift_beginAccess();
}

void sub_14DF4(float a1)
{
  *uint64_t v1 = a1;
}

void sub_14E08(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_14E28()
{
  return swift_bridgeObjectRelease_n();
}

id sub_14E40()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_25390();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithLocaleIdentifier:v1];

  return v2;
}

void sub_14EB4()
{
  sub_1EE24();
  unint64_t v1 = v0;
  if (v0 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_25760())
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v3 = (id)sub_256B0();
    }
    else {
      id v3 = *(id *)(v1 + 32);
    }
    unint64_t v4 = v3;
    sub_DC98(0, &qword_315D0);
    char v5 = sub_255A0();

    if ((v5 & 1) != 0 || v2 == 1) {
      break;
    }
    uint64_t v6 = 5;
    while (1)
    {
      id v7 = (v1 & 0xC000000000000001) != 0 ? (id)sub_256B0() : *(id *)(v1 + 8 * v6);
      int64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      char v10 = sub_255A0();

      if ((v10 & 1) == 0)
      {
        ++v6;
        if (v9 != v2) {
          continue;
        }
      }
      goto LABEL_7;
    }
    __break(1u);
LABEL_17:
    sub_1EE04();
  }
LABEL_7:
  swift_bridgeObjectRelease();
  sub_1EDEC();
}

void sub_14FF0()
{
  sub_1EE24();
  unint64_t v1 = v0;
  if (v0 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_25760())
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v3 = (id)sub_256B0();
    }
    else {
      id v3 = *(id *)(v1 + 32);
    }
    unint64_t v4 = v3;
    sub_252A0();
    char v5 = sub_255A0();

    if ((v5 & 1) != 0 || v2 == 1) {
      break;
    }
    uint64_t v6 = 5;
    while (1)
    {
      id v7 = (v1 & 0xC000000000000001) != 0 ? (id)sub_256B0() : *(id *)(v1 + 8 * v6);
      int64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      char v10 = sub_255A0();

      if ((v10 & 1) == 0)
      {
        ++v6;
        if (v9 != v2) {
          continue;
        }
      }
      goto LABEL_7;
    }
    __break(1u);
LABEL_17:
    sub_1EE04();
  }
LABEL_7:
  swift_bridgeObjectRelease();
  sub_1EDEC();
}

uint64_t sub_1511C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_257C0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_257C0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_151E4(uint64_t a1, void *a2)
{
  unint64_t v21 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v5 = a1 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 56);
  int64_t v19 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v10++, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v10 >= v19) {
      goto LABEL_29;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    if (!v14) {
      break;
    }
LABEL_18:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_19:
    uint64_t v16 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v17 = v16[1];
    v20[1] = *v16;
    v20[2] = v17;
    swift_bridgeObjectRetain();
    sub_16CBC((uint64_t)a2, v20);
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v18 = v21;

      swift_bridgeObjectRelease();
      return v18;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v20[0])
    {
      sub_25400();
      if (*(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v21 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_25450();
      sub_25480();
      uint64_t result = sub_25440();
    }
  }
  int64_t v15 = v10 + 1;
  if (v10 + 1 >= v19) {
    goto LABEL_29;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  int64_t v15 = v10 + 2;
  if (v10 + 2 >= v19) {
    goto LABEL_29;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  int64_t v15 = v10 + 3;
  if (v10 + 3 >= v19) {
    goto LABEL_29;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  int64_t v15 = v10 + 4;
  if (v10 + 4 >= v19)
  {
LABEL_29:
    swift_release();
    unint64_t v18 = v21;

    return v18;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v10 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v19) {
      goto LABEL_29;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_1542C(unint64_t a1, void *a2)
{
  unint64_t v14 = (unint64_t)_swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_25760())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)sub_256B0() : *(id *)(a1 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v13 = v6;
      sub_1C3C8(&v13, a2, &v12);
      if (v2)
      {
        swift_bridgeObjectRelease();

        uint64_t v9 = (void *)v14;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v9;
      }

      if (v12)
      {
        sub_25400();
        if (*(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v14 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_25450();
        sub_25480();
        sub_25440();
      }
      ++v5;
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = (void *)v14;
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = _swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_155E0(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale);
}

uint64_t sub_155EC(uint64_t a1)
{
  return sub_1EE60(a1);
}

uint64_t sub_155F8(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription);
}

uint64_t sub_15604(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup);
}

uint64_t sub_15610(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup);
}

uint64_t sub_1561C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietySpecifiers);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_15670(uint64_t a1)
{
  return sub_1EE60(a1);
}

void *sub_1567C()
{
  uint64_t v1 = v0;
  NSString v2 = sub_E4B4();
  id v3 = [v0 valueForKey:v2];

  if (v3)
  {
    sub_25620();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
  }
  sub_C18C((uint64_t)&v47, (uint64_t)v49);
  if (!v50)
  {
    sub_14C98((uint64_t)v49);
LABEL_12:
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25310();
    int64_t v10 = sub_E4E0(v9, (uint64_t)qword_31D88);
    os_log_type_t v11 = sub_25560();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)sub_E49C();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, v11, "#ReadingVoiceListController setting specifiers", v12, 2u);
      sub_E414();
    }

    id v13 = sub_25300();
    os_log_type_t v14 = sub_25560();
    int64_t v15 = &unk_31000;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = (_DWORD *)sub_E46C();
      v49[0] = sub_E484();
      *uint64_t v16 = 136315138;
      if (qword_31458 != -1) {
        swift_once();
      }
      sub_E520();
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_25370();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      sub_14464(v17, v19, v49);
      sub_1EF08();
      sub_255F0();
      swift_bridgeObjectRelease();
      sub_E7A8(&dword_0, v13, v14, "#ReadingVoiceListController %s");
      sub_E808();
      sub_E414();
      sub_E414();

      int64_t v15 = (void *)&unk_31000;
    }
    else
    {
    }
    uint64_t v20 = sub_1E8B4(v1, (SEL *)&selRef_title);
    if (v21)
    {
      uint64_t v28 = v20;
      uint64_t v29 = v21;
      if (v15[139] != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t v30 = static MessagesSettingsUtils.readableLanguageToLocaleMap;
      swift_bridgeObjectRetain();
      sub_21A0C(v28, v29, v30);
      uint64_t v32 = v31;
      swift_bridgeObjectRelease();
      if (v32)
      {
        swift_endAccess();
        swift_bridgeObjectRelease();
        if (!*(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale])
        {
          sub_DC98(0, &qword_315A0);
          id v33 = sub_14E40();
          id v34 = [v33 languageCode];

          uint64_t v35 = sub_253A0();
          uint64_t v37 = v36;

          unint64_t v38 = (void *)swift_allocObject();
          v38[2] = v1;
          v38[3] = v35;
          v38[4] = v37;
          unint64_t v39 = v1;
          swift_bridgeObjectRetain();
          uint64_t v40 = sub_1F068();
          static MessagesSettingsUtils.chosenTTSAssetFor(language:_:)(v40, v41, v42, (uint64_t)v38);
          swift_release();
          swift_bridgeObjectRelease();
          return _swiftEmptyArrayStorage;
        }
      }
      else
      {
        swift_endAccess();
      }
      uint64_t v20 = swift_bridgeObjectRelease();
    }
    sub_15E94(v20, v21, v22, v23, v24, v25, v26, v27, v45, v46, v47, *((uint64_t *)&v47 + 1), v48, *((uint64_t *)&v48 + 1), v49[0], v49[1], v49[2], v50, v51,
      v52);
    return (void *)v43;
  }
  sub_BA78(&qword_31578);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25310();
  uint64_t v5 = (void *)sub_E4E0(v4, (uint64_t)qword_31D88);
  os_log_type_t v6 = sub_25560();
  if (sub_E644(v6))
  {
    *(_WORD *)sub_E49C() = 0;
    sub_E5F0(&dword_0, v7, v8, "#MessagesAutoConfirmSettingsController returning already initialized specifiers");
    sub_E414();
  }

  sub_1F1A8(v46);
  sub_1EEE4();
  return v5;
}

uint64_t sub_15B4C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (result)
  {
    os_log_type_t v6 = (void *)result;
    sub_DC98(0, &qword_315A0);
    id v7 = v6;
    id v8 = [v7 primaryLanguage];
    sub_253A0();

    id v9 = sub_14E40();
    sub_155E0((uint64_t)v9);
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25310();
    sub_C2FC(v10, (uint64_t)qword_31D88);
    id v11 = v7;
    swift_bridgeObjectRetain_n();
    id v12 = v11;
    id v13 = sub_25300();
    os_log_type_t v14 = sub_25560();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v32[0] = v30;
      *(_DWORD *)uint64_t v15 = 136315394;
      swift_bridgeObjectRetain();
      sub_14464(a3, a4, v32);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2080;
      uint64_t v29 = v15 + 14;
      id v16 = v12;
      id v17 = [v16 description];
      uint64_t v18 = sub_253A0();
      unint64_t v20 = v19;

      uint64_t v31 = sub_14464(v18, v20, v32);
      sub_255F0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v13, v14, "#ReadingVoiceListController found asset for %s  %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v21 = swift_bridgeObjectRelease_n();
    }
    sub_15E94(v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32[0], v32[1], v32[2], v32[3], v32[4], v32[5], v32[6], v32[7],
      v32[8]);

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_15E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_1EE24();
  a19 = v21;
  a20 = v22;
  uint64_t v23 = v20;
  uint64_t v134 = sub_25310();
  sub_E438();
  uint64_t v25 = v24;
  __chkstk_darwin(v26);
  sub_E9DC();
  uint64_t v132 = v27;
  __chkstk_darwin(v28);
  uint64_t v30 = (char *)&v129 - v29;
  uint64_t v31 = static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000010, (void *)0x80000000000270C0);
  sub_1E7C4(v31, v32, v23);
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_C2FC(v134, (uint64_t)qword_31D88);
  id v34 = (void (*)(char *))v25[2];
  uint64_t v133 = v33;
  v34(v30);
  uint64_t v35 = v23;
  uint64_t v36 = sub_25300();
  os_log_type_t v37 = sub_25560();
  BOOL v38 = os_log_type_enabled(v36, v37);
  objc_super v131 = v25;
  if (v38)
  {
    v130 = v34;
    unint64_t v39 = (uint8_t *)sub_E46C();
    v135[0] = sub_E484();
    *(_DWORD *)unint64_t v39 = 136315138;
    uint64_t v40 = *(void **)&v35[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale];
    if (v40)
    {
      id v41 = [v40 localeIdentifier];
      uint64_t v42 = sub_253A0();
      unint64_t v44 = v43;
    }
    else
    {
      unint64_t v44 = 0xE300000000000000;
      uint64_t v42 = 7104878;
    }
    uint64_t v46 = sub_14464(v42, v44, v135);
    sub_1F034(v46);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v36, v37, "ReadingVoiceListController current locale : %s", v39, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    uint64_t v25 = v131;
    uint64_t v45 = (void (*)(void))v131[1];
    sub_1EED8();
    v45();
    id v34 = v130;
  }
  else
  {

    uint64_t v45 = (void (*)(void))v25[1];
    sub_1EED8();
    v45();
  }
  uint64_t v137 = (uint64_t)_swiftEmptyArrayStorage;
  long long v47 = self;
  uint64_t v48 = static MessagesSettingsUtils.getLocalizedString(_:)(0x5F59544549524156, (void *)0xED0000454C544954);
  id v50 = sub_214C0(0x4779746569726176, 0xEC00000070756F72, v48, v49, v47);
  sub_15604((uint64_t)v50);
  uint64_t v51 = static MessagesSettingsUtils.getLocalizedString(_:)(0x49545F4543494F56, (void *)0xEB00000000454C54);
  id v53 = sub_214C0(0x6F72476563696F76, 0xEA00000000007075, v51, v52, v47);
  sub_15610((uint64_t)v53);
  ((void (*)(uint64_t, uint64_t, uint64_t))v34)(v132, v133, v134);
  uint64_t v54 = v35;
  unint64_t v55 = sub_25300();
  os_log_type_t v56 = sub_25560();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)sub_E46C();
    v136[0] = sub_E484();
    *(_DWORD *)uint64_t v57 = 136315138;
    uint64_t v25 = v54;
    uint64_t v58 = *(void **)&v54[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup];
    if (!v58)
    {
LABEL_84:

      __break(1u);
      goto LABEL_85;
    }
    uint64_t v59 = sub_253A0();
    if (sub_1E768(v59, v60, v58))
    {
      sub_25620();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v135, 0, 32);
    }
    sub_BA78(&qword_31570);
    uint64_t v61 = sub_253C0();
    v135[0] = sub_14464(v61, v62, v136);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v55, v56, "#ReadingVoiceListController varietyGroup: %s", v57, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
  sub_1EED8();
  v45();
  uint64_t v63 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup;
  uint64_t v64 = *(void **)&v54[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup];
  if (!v64) {
    goto LABEL_80;
  }
  id v65 = v64;
  Class isa = sub_25490().super.super.isa;
  uint64_t v67 = sub_253A0();
  sub_1EE98(v67, v68);

  uint64_t v69 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup;
  unint64_t v70 = *(void **)&v54[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup];
  if (!v70)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  id v71 = v70;
  v72.super.super.Class isa = sub_25490().super.super.isa;
  uint64_t v73 = sub_253A0();
  sub_1EE98(v73, v74);

  uint64_t v75 = *(void **)&v54[v69];
  if (!v75)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  id v76 = v75;
  static MessagesSettingsUtils.getLocalizedString(_:)(0xD000000000000019, (void *)0x80000000000270E0);
  sub_25390();
  sub_1EF38();
  uint64_t v77 = sub_253A0();
  sub_1EE70(v77, v78);

  BOOL v79 = *(void **)&v54[v69];
  if (!v79)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  id v80 = v79;
  sub_25400();
  if (*(void *)((char *)&dword_10 + (v137 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                  + (v137 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E840();
  sub_25480();
  sub_25440();
  uint64_t v81 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_localeVarietiesWithinLanguage;
  unint64_t v82 = *(void *)&v54[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_localeVarietiesWithinLanguage];
  if (!(v82 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v82 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  sub_1EE04();
  sub_25760();
  sub_1EEE4();
  if (&a19 == (uint64_t *)&stru_20.maxprot) {
LABEL_24:
  }
    sub_16AA4();
LABEL_25:
  sub_18DF4();
  uint64_t v83 = v54;
  uint64_t v84 = sub_25300();
  os_log_type_t v85 = sub_25560();
  BOOL v86 = os_log_type_enabled(v84, v85);
  uint64_t v132 = v69;
  if (v86)
  {
    uint64_t v87 = (_DWORD *)sub_E46C();
    uint64_t v88 = sub_E484();
    objc_super v131 = (void *)v88;
    *uint64_t v87 = 136315138;
    v130 = (void (*)(char *))(v87 + 1);
    uint64_t v134 = v63;
    v135[0] = v88;
    sub_DC98(0, &qword_315A0);
    swift_bridgeObjectRetain();
    uint64_t v25 = (void *)sub_25430();
    unint64_t v90 = v89;
    uint64_t v63 = v134;
    swift_bridgeObjectRelease();
    uint64_t v91 = sub_14464((uint64_t)v25, v90, v135);
    sub_1F034(v91);
    sub_255F0();

    swift_bridgeObjectRelease();
    sub_1EEC0(&dword_0, v84, v85, "#ReadingVoiceListController locales for language %s");
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
  uint64_t v92 = (uint64_t *)&v83[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietySpecifiers];
  sub_E520();
  if ((unint64_t)*v92 >> 62)
  {
    sub_1EE04();
    sub_25760();
    sub_1EEE4();
    if (v84) {
      goto LABEL_30;
    }
  }
  else if (*(void *)((char *)&dword_10 + (*v92 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_30:
    sub_17F7C();
    goto LABEL_49;
  }
  unint64_t v93 = *(void *)&v54[v81];
  if (v93 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v94 = sub_25760();
    if (v94) {
      goto LABEL_36;
    }
LABEL_48:
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
  uint64_t v94 = *(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v94) {
    goto LABEL_48;
  }
LABEL_36:
  uint64_t v134 = v63;
  objc_super v131 = v54;
  if (v94 < 1) {
    goto LABEL_78;
  }
  for (uint64_t i = 0; i != v94; ++i)
  {
    if ((v93 & 0xC000000000000001) != 0) {
      id v96 = (id)sub_256B0();
    }
    else {
      id v96 = *(id *)(v93 + 8 * i + 32);
    }
    unint64_t v97 = v96;
    sub_16FC4();
    if (v98)
    {
      unint64_t v99 = v98;
      sub_1EF50();
      id v100 = v99;
      sub_25400();
      uint64_t v25 = *(void **)((char *)&dword_10 + (*v92 & 0xFFFFFFFFFFFFFF8));
      if ((unint64_t)v25 >= *(void *)((char *)&dword_18 + (*v92 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_25450();
      }
      sub_25480();
      sub_25440();
      swift_endAccess();

      unint64_t v97 = v100;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v54 = (char *)v131;
  uint64_t v63 = v134;
LABEL_49:
  uint64_t v101 = *v92;
  if (*v92 < 0 || (v101 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v102 = (uint64_t)sub_1CAF0(v101, (void (*)(void *, uint64_t, uint64_t))sub_1EA5C);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v102 = v101 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  v136[0] = v102;
  sub_1D860(v136);
  swift_bridgeObjectRelease();
  uint64_t v103 = (uint64_t)v83;
  sub_1561C(v136[0]);
  if ((unint64_t)*v92 >> 62)
  {
    sub_1EE04();
    sub_25760();
    sub_1EEE4();
  }
  else
  {
    uint64_t v103 = *(void *)((char *)&dword_10 + (*v92 & 0xFFFFFFFFFFFFFF8));
  }
  if (v103 >= 2)
  {
    uint64_t v104 = *(void **)&v54[v63];
    if (!v104)
    {
LABEL_85:
      __break(1u);
      goto LABEL_86;
    }
    if (!((unint64_t)v137 >> 62))
    {
      id v105 = v104;
LABEL_58:
      sub_1D208();
      unint64_t v106 = *v92;
      swift_bridgeObjectRetain();
      sub_1D474(1, 1, v106);
      goto LABEL_59;
    }
    if (v137 < 0) {
      uint64_t v127 = v137;
    }
    else {
      uint64_t v127 = v137 & 0xFFFFFFFFFFFFFF8;
    }
    id v128 = v104;
    swift_bridgeObjectRetain();
    sub_25760();
    sub_1EF38();
    if ((v127 & 0x8000000000000000) == 0) {
      goto LABEL_58;
    }
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
LABEL_59:
  unint64_t v107 = *(void **)&v83[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale];
  if (!v107)
  {
LABEL_66:
    unint64_t v120 = v137;
    unint64_t v121 = swift_bridgeObjectRetain();
    id v122 = sub_1F1A8(v121);
    swift_bridgeObjectRelease();
    sub_21678((uint64_t)v122, v83);
    sub_1F1A8(v120);
    swift_bridgeObjectRelease();
LABEL_67:
    sub_1EDEC();
    return;
  }
  id v108 = v107;
  id v109 = [v108 localeIdentifier];
  sub_253A0();

  sub_E520();
  swift_bridgeObjectRetain();
  uint64_t v110 = sub_1F068();
  uint64_t v111 = sub_21A64(v110);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v111)
  {
LABEL_65:

    goto LABEL_66;
  }
  sub_18234();
  sub_1EEE4();
  sub_15670((uint64_t)v83);
  Swift::Int v112 = *(void **)&v54[v132];
  if (v112)
  {
    unint64_t v113 = v137;
    swift_bridgeObjectRetain();
    id v114 = v112;
    sub_1F33C((uint64_t)v114, v113);
    uint64_t v116 = v115;
    char v118 = v117;
    swift_bridgeObjectRelease();

    if (v118)
    {
      swift_bridgeObjectRelease();
      os_log_type_t v123 = v133;
      v124 = sub_25300();
      os_log_type_t v125 = sub_25560();
      if (sub_E554(v125))
      {
        uint64_t v126 = (uint8_t *)sub_E49C();
        *(_WORD *)uint64_t v126 = 0;
        _os_log_impl(&dword_0, v124, v123, "#ReadingVoiceListController no voiceGroupIndex", v126, 2u);
        sub_E414();
      }

      goto LABEL_67;
    }
    if (!__OFADD__(v116, 1))
    {
      unint64_t v119 = *(void *)&v83[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceSpecifiers];
      swift_bridgeObjectRetain();
      sub_1D474(v116 + 1, v116 + 1, v119);
      goto LABEL_65;
    }
    goto LABEL_79;
  }
LABEL_86:
  __break(1u);
  swift_release();
  __break(1u);
}

uint64_t sub_16AA4()
{
  uint64_t v1 = v0;
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  id v3 = sub_E4E0(v2, (uint64_t)qword_31D88);
  os_log_type_t v4 = sub_25560();
  if (os_log_type_enabled(v3, v4))
  {
    id v13 = v1;
    uint64_t v5 = (_DWORD *)sub_E46C();
    uint64_t v14 = sub_E484();
    *uint64_t v5 = 136315138;
    id v6 = [self availableLanguages];
    sub_25500();

    uint64_t v7 = sub_25510();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    sub_14464(v7, v9, &v14);
    sub_1EF08();
    sub_255F0();
    swift_bridgeObjectRelease();
    sub_1EEC0(&dword_0, v3, v4, "#ReadingVoiceListController initializeLocales %s");
    swift_arrayDestroy();
    sub_E414();
    uint64_t v1 = v13;
    sub_E414();
  }

  id v10 = [self availableLanguages];
  uint64_t v11 = sub_25500();

  sub_151E4(v11, v1);
  sub_1EF38();
  return sub_155EC(0);
}

void sub_16CBC(uint64_t a1@<X1>, void *a2@<X8>)
{
  sub_DC98(0, &qword_315A0);
  swift_bridgeObjectRetain();
  id v4 = sub_14E40();
  id v5 = [v4 languageCode];
  uint64_t v6 = sub_253A0();
  uint64_t v8 = v7;

  unint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale);
  if (!v9)
  {

    swift_bridgeObjectRelease();
LABEL_16:
    id v19 = 0;
    goto LABEL_17;
  }
  id v10 = [v9 languageCode];
  uint64_t v11 = sub_253A0();
  uint64_t v13 = v12;

  if (v6 == v11 && v8 == v13)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = sub_257C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      goto LABEL_15;
    }
  }
  NSString v16 = sub_25390();
  int v17 = AFGryphonAssetsExistForLanguage();

  if (!v17)
  {
LABEL_15:

    goto LABEL_16;
  }
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25310();
  sub_C2FC(v18, (uint64_t)qword_31D88);
  id v19 = v4;
  unint64_t v20 = sub_25300();
  os_log_type_t v21 = sub_25560();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315138;
    id v23 = [v19 localeIdentifier];
    uint64_t v24 = sub_253A0();
    unint64_t v26 = v25;

    sub_14464(v24, v26, &v27);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v20, v21, "#ReadingVoiceListController ttsCurrentlySubscribedLocale %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
LABEL_17:
  *a2 = v19;
}

void sub_16FC4()
{
  sub_1EE24();
  unint64_t v1 = v0;
  id v3 = v2;
  uint64_t v4 = sub_25310();
  sub_E438();
  uint64_t v141 = v5;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v139 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251B0();
  sub_E438();
  uint64_t v143 = v10;
  uint64_t v144 = v9;
  __chkstk_darwin(v9);
  v142 = (char *)&v139 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1BE0C(v3);
  if (qword_31488 != -1) {
    goto LABEL_67;
  }
  while (1)
  {
    uint64_t v13 = sub_C2FC(v4, (uint64_t)qword_31D88);
    uint64_t v14 = v3;
    swift_bridgeObjectRetain_n();
    char v15 = v14;
    NSString v16 = sub_25300();
    os_log_type_t v17 = sub_25560();
    BOOL v18 = os_log_type_enabled(v16, v17);
    v140 = v8;
    uint64_t v150 = v13;
    v148 = v15;
    uint64_t v139 = v4;
    v149 = v1;
    if (v18)
    {
      uint64_t v19 = swift_slowAlloc();
      unint64_t v20 = (void *)sub_E660();
      v154[0] = sub_E484();
      *(_DWORD *)uint64_t v19 = 138412546;
      v153[0] = (uint64_t)v148;
      os_log_type_t v21 = v148;
      sub_255F0();
      *unint64_t v20 = v148;

      *(_WORD *)(v19 + 12) = 2080;
      sub_DC98(0, &qword_31850);
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_25430();
      unint64_t v24 = v23;
      swift_bridgeObjectRelease();
      uint64_t v25 = v22;
      uint64_t v13 = v150;
      v153[0] = sub_14464(v25, v24, v154);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v16, v17, "#ReadingVoiceListController all voices from locale : %@ : %s", (uint8_t *)v19, 0x16u);
      sub_BA78(&qword_315C0);
      swift_arrayDestroy();
      sub_E414();
      swift_arrayDestroy();
      char v15 = v148;
      sub_E414();
      sub_E414();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v26 = [v15 localeIdentifier];
    uint64_t v27 = sub_253A0();
    uint64_t v29 = v28;

    sub_1EF50();
    sub_1CC70((uint64_t)v12, v27, v29, (void (*)(uint64_t))sub_1CF24);
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_1E8B4(v15, (SEL *)&selRef_regionCode);
    if (!v31) {
      goto LABEL_65;
    }
    uint64_t v32 = v30;
    unint64_t v33 = v31;
    swift_bridgeObjectRetain();
    id v34 = sub_25300();
    os_log_type_t v35 = sub_25560();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (_DWORD *)sub_E46C();
      v154[0] = sub_E484();
      *uint64_t v36 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_14464(v32, v33, v154);
      sub_E878(v37);
      uint64_t v13 = v150;
      sub_255F0();
      swift_bridgeObjectRelease_n();
      sub_1EFC8(&dword_0, v34, v35, "#ReadingVoiceListController regionCode %s");
      swift_arrayDestroy();
      sub_E414();
      sub_E414();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    BOOL v38 = v148;
    id v39 = [v148 localeIdentifier];
    sub_253A0();
    uint64_t v8 = v40;

    swift_bridgeObjectRetain();
    uint64_t v41 = sub_1F068();
    unint64_t v1 = sub_21A64(v41);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v1) {
      goto LABEL_31;
    }
    swift_bridgeObjectRetain_n();
    id v3 = v13;
    uint64_t v42 = sub_25300();
    os_log_type_t v43 = sub_25560();
    if (os_log_type_enabled(v42, v43))
    {
      id v3 = sub_E46C();
      v154[0] = sub_E484();
      LODWORD(v3->isa) = 136315138;
      uint64_t v8 = (char *)&v3[1].isa + 4;
      sub_DC98(0, &qword_31850);
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_25430();
      unint64_t v46 = v45;
      swift_bridgeObjectRelease();
      uint64_t v47 = sub_14464(v44, v46, v154);
      sub_E878(v47);
      sub_255F0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      sub_1EFC8(&dword_0, v42, v43, "#ReadingVoiceListController voicesInRegion %s");
      swift_arrayDestroy();
      sub_E414();
      sub_E414();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (v1 >> 62) {
      break;
    }
    uint64_t v49 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    if (!v49) {
      goto LABEL_30;
    }
LABEL_15:
    uint64_t v147 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale;
    unint64_t v151 = v1 & 0xC000000000000001;
    uint64_t v50 = 4;
    *(void *)&long long v48 = 138412290;
    long long v146 = v48;
    *(void *)&long long v48 = 67109120;
    long long v145 = v48;
    while (1)
    {
      uint64_t v12 = (char *)(v50 - 4);
      id v51 = v151 ? (id)sub_256B0() : *(id *)(v1 + 8 * v50);
      uint64_t v4 = v50 - 3;
      if (__OFADD__(v12, 1)) {
        break;
      }
      uint64_t v52 = v51;
      id v53 = sub_25300();
      os_log_type_t v54 = sub_25560();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v8 = (char *)sub_E46C();
        unint64_t v55 = (void *)sub_E660();
        *(_DWORD *)uint64_t v8 = v146;
        *(void *)(v8 + 4) = v52;
        *unint64_t v55 = v52;

        sub_E7A8(&dword_0, v53, v54, "#ReadingVoiceListController voiceInRegion %@");
        sub_BA78(&qword_315C0);
        swift_arrayDestroy();
        sub_E414();
        sub_E414();
      }
      else
      {

        id v53 = v52;
      }

      os_log_type_t v56 = v52;
      id v3 = sub_25300();
      os_log_type_t v57 = sub_25560();
      if (os_log_type_enabled(v3, v57))
      {
        uint64_t v8 = (char *)sub_E660();
        *(_DWORD *)uint64_t v8 = v145;
        *((_DWORD *)v8 + 1) = [v56 locallyAvailable];

        _os_log_impl(&dword_0, v3, v57, "#ReadingVoiceListController voiceInRegion.locallyAvailable %{BOOL}d", (uint8_t *)v8, 8u);
        sub_E414();
      }
      else
      {

        id v3 = v56;
      }

      if ([v56 locallyAvailable] && !*(Class *)((char *)&v149->isa + v147))
      {
        sub_DC98(0, &qword_315A0);
        id v58 = [v148 localeIdentifier];
        uint64_t v8 = (char *)sub_253A0();

        sub_1EFBC();
        id v59 = sub_14E40();
        id v3 = v149;
        sub_155E0((uint64_t)v59);
      }

      ++v50;
      if (v4 == v49) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_67:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_25760();
  swift_bridgeObjectRelease();
  if (v49) {
    goto LABEL_15;
  }
LABEL_30:
  swift_bridgeObjectRelease();
  BOOL v38 = v148;
LABEL_31:
  sub_DC98(0, &qword_315A0);
  id v60 = [v38 languageCode];
  sub_253A0();
  sub_1F074();
  sub_1F05C();
  id v61 = sub_14E40();
  unint64_t v62 = v142;
  sub_25120();
  Class isa = sub_25180().super.isa;
  (*(void (**)(char *, uint64_t))(v143 + 8))(v62, v144);
  LODWORD(v62) = [v61 isEquivalentTo:isa];

  if (v62)
  {
    sub_DC98(0, &qword_315B0);
    id v64 = [v38 localeIdentifier];
    sub_253A0();
    sub_1F074();
    uint64_t v65 = sub_1F05C();
    sub_11CA4(v65);
    uint64_t v67 = v66;
    swift_bridgeObjectRelease();
    uint64_t v68 = v149;
    if (v67) {
      goto LABEL_33;
    }
LABEL_40:
    uint64_t v102 = (void *)sub_25300();
    os_log_type_t v103 = sub_25560();
    if (sub_E554(v103))
    {
      uint64_t v104 = (_WORD *)sub_E49C();
      sub_E6B0(v104);
      sub_E5BC(&dword_0, v105, v106, "#ReadingVoiceListController varietyName nil");
      sub_E414();
    }

LABEL_65:
    sub_1EDEC();
    return;
  }
  uint64_t v68 = v149;
  if (qword_31450 != -1) {
    swift_once();
  }
  sub_E520();
  id v96 = (id)static MessagesSettingsUtils.siriUISettingsConnection;
  id v97 = [v38 localeIdentifier];
  sub_253A0();
  sub_1F074();
  uint64_t v98 = sub_1F05C();
  sub_1E828(v98, v99, v96);
  uint64_t v101 = v100;

  if (!v101) {
    goto LABEL_40;
  }
LABEL_33:
  swift_bridgeObjectRetain();
  id v69 = [v38 localeIdentifier];
  int v70 = sub_253A0();

  sub_1EF50();
  sub_1CBEC();
  swift_endAccess();
  swift_bridgeObjectRelease();
  v138 = self;
  sub_1EF20();
  id v79 = sub_21554(v71, v72, v73, v74, v75, v76, v77, v78, v138);
  id v80 = v38;
  uint64_t v81 = v79;
  if (!v79)
  {
LABEL_56:

    goto LABEL_65;
  }
  unint64_t v82 = v80;
  uint64_t v83 = v68;
  uint64_t v84 = v82;
  os_log_type_t v85 = v83;
  BOOL v86 = sub_25300();
  sub_25560();
  sub_1EEFC();
  BOOL v88 = os_log_type_enabled(v86, v87);
  unint64_t v151 = (unint64_t)v61;
  if (v88)
  {
    uint64_t v89 = swift_slowAlloc();
    unint64_t v90 = swift_slowAlloc();
    v153[0] = (uint64_t)v90;
    *(_DWORD *)uint64_t v89 = 136315394;
    uint64_t v91 = *(Class *)((char *)&v85->isa
                   + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription);
    LODWORD(v149) = v70;
    v148 = v90;
    if (v91)
    {
      id v92 = v91;
      unint64_t v93 = sub_25290();
      unint64_t v95 = v94;
    }
    else
    {
      unint64_t v95 = 0x80000000000270A0;
      unint64_t v93 = 0xD000000000000010;
    }
    uint64_t v152 = sub_14464(v93, v95, v153);
    sub_255F0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 12) = 2080;
    id v107 = [v84 localeIdentifier];
    uint64_t v108 = sub_253A0();
    unint64_t v110 = v109;

    uint64_t v152 = sub_14464(v108, v110, v153);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v86, (os_log_type_t)v149, "#ReadingVoiceListController currentVoiceSubscription?.voice.language == locale.localeIdentifier %s %s", (uint8_t *)v89, 0x16u);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    id v61 = (id)v151;
  }
  else
  {
  }
  uint64_t v111 = *(Class *)((char *)&v85->isa
                  + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription);
  if (v111)
  {
    id v112 = v111;
    uint64_t v113 = sub_25290();
    uint64_t v115 = v114;
  }
  else
  {
    uint64_t v113 = 0;
    uint64_t v115 = 0;
  }
  id v116 = [v84 localeIdentifier];
  uint64_t v117 = sub_253A0();
  uint64_t v119 = v118;

  if (!v115)
  {

    swift_bridgeObjectRelease();
    goto LABEL_65;
  }
  if (v113 == v117 && v115 == v119)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v121 = sub_257C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v121 & 1) == 0) {
      goto LABEL_56;
    }
  }
  v149 = v85;
  uint64_t v122 = v141;
  os_log_type_t v123 = v140;
  uint64_t v124 = v139;
  (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v140, v150, v139);
  id v125 = v81;
  uint64_t v126 = sub_25300();
  sub_25560();
  sub_1EEFC();
  if (os_log_type_enabled(v126, v127))
  {
    id v128 = (_DWORD *)sub_E46C();
    v153[0] = sub_E484();
    *id v128 = 136315138;
    uint64_t v129 = sub_24B74(v125);
    if (v130)
    {
      uint64_t v152 = sub_14464(v129, v130, v153);
      sub_255F0();

      swift_bridgeObjectRelease();
      sub_1EEC0(&dword_0, v126, (os_log_type_t)v116, "#ReadingVoiceListController setting checked specifier on variety group for %s");
      swift_arrayDestroy();
      sub_E414();
      sub_E414();

      (*(void (**)(char *, uint64_t))(v141 + 8))(v140, v124);
      goto LABEL_63;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v122 + 8))(v123, v124);
LABEL_63:
    objc_super v131 = *(Class *)((char *)&v149->isa
                    + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup);
    uint64_t v132 = (void *)v151;
    if (v131)
    {
      uint64_t v133 = sub_253A0();
      uint64_t v135 = v134;
      id v136 = v125;
      id v137 = v131;
      sub_21444((uint64_t)v81, v133, v135, v137);

      goto LABEL_65;
    }
    __break(1u);
  }

  __break(1u);
}

uint64_t sub_17F7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietySpecifiers);
  sub_E520();
  uint64_t v3 = *v2;
  if ((unint64_t)*v2 >> 62)
  {
LABEL_36:
    sub_1EF68();
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_25760();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  uint64_t v31 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup;
  uint64_t v35 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription;
  unint64_t v36 = v3 & 0xC000000000000001;
  id v34 = (uint64_t *)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyNameToLocale);
  sub_E520();
  uint64_t v5 = 4;
  uint64_t v32 = v4;
  uint64_t v33 = v3;
  while (1)
  {
    if (v36) {
      id v6 = (id)sub_256B0();
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5);
    }
    uint64_t v7 = v6;
    uint64_t v3 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v8 = *(void **)(v1 + v35);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = sub_25290();
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v12 = 0;
    }
    uint64_t v13 = sub_24B74(v7);
    if (!v14) {
      break;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *v34;
    if (*(void *)(*v34 + 16))
    {
      uint64_t v17 = v13;
      swift_bridgeObjectRetain();
      unint64_t v18 = sub_2471C(v17, v15);
      if (v19)
      {
        unint64_t v20 = (uint64_t *)(*(void *)(v16 + 56) + 16 * v18);
        uint64_t v22 = *v20;
        uint64_t v21 = v20[1];
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v22 = 0;
        uint64_t v21 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v21 = 0;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v12)
    {
      if (v21)
      {
        BOOL v24 = v10 == v22 && v12 == v21;
        if (v24)
        {
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
        }
        else
        {
          char v25 = sub_257C0();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if ((v25 & 1) == 0)
          {
LABEL_31:

            goto LABEL_32;
          }
        }
LABEL_29:
        id v26 = *(void **)(v1 + v31);
        if (!v26) {
          goto LABEL_39;
        }
        uint64_t v27 = sub_253A0();
        uint64_t v29 = v28;
        id v30 = v26;
        sub_21444((uint64_t)v7, v27, v29, v30);

        goto LABEL_31;
      }
    }
    else if (!v21)
    {
      goto LABEL_29;
    }

    swift_bridgeObjectRelease();
LABEL_32:
    ++v5;
    BOOL v24 = v3 == v32;
    uint64_t v3 = v33;
    if (v24) {
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

void sub_18234()
{
  sub_1EE24();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v4 = sub_25310();
  sub_E438();
  id v6 = v5;
  __chkstk_darwin(v7);
  sub_E9DC();
  uint64_t v111 = v8;
  __chkstk_darwin(v9);
  uint64_t v122 = (char *)v105 - v10;
  unint64_t v138 = (unint64_t)_swiftEmptyArrayStorage;
  if (v3 >> 62)
  {
LABEL_58:
    sub_1EF68();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25760();
    if (v11) {
      goto LABEL_3;
    }
LABEL_59:
    swift_bridgeObjectRelease();
    sub_1EDEC();
    return;
  }
  uint64_t v11 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v11) {
    goto LABEL_59;
  }
LABEL_3:
  uint64_t v117 = self;
  uint64_t v127 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription;
  unint64_t v109 = &v1[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceDisplayStringToVoice];
  unint64_t v118 = v3 & 0xC000000000000001;
  uint64_t v106 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup;
  id v125 = (void (**)(void))(v6 + 8);
  uint64_t v126 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  unint64_t v110 = &v136;
  id v107 = &v137;
  v105[1] = PSRadioGroupCheckedSpecifierKey;
  uint64_t v124 = 1;
  uint64_t v12 = 4;
  *(void *)&long long v13 = 136315138;
  long long v129 = v13;
  uint64_t v108 = (char *)&type metadata for Any + 8;
  id v116 = (void *)0x8000000000027080;
  uint64_t v115 = (void *)0x80000000000263D0;
  long long v114 = xmmword_26310;
  id v128 = v1;
  uint64_t v130 = v4;
  uint64_t v112 = v11;
  unint64_t v113 = v3;
  while (1)
  {
    if (v118) {
      uint64_t v14 = (char *)sub_256B0();
    }
    else {
      uint64_t v14 = (char *)*(id *)(v3 + 8 * v12);
    }
    id v6 = v14;
    if (__OFADD__(v12 - 4, 1))
    {
      __break(1u);
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    uint64_t v131 = v12 - 3;
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_C2FC(v4, (uint64_t)qword_31D88);
    uint64_t v16 = v6;
    uint64_t v17 = sub_25300();
    os_log_type_t v18 = sub_25560();
    unint64_t v3 = v18;
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v133 = v16;
    if (v19)
    {
      uint64_t v20 = sub_E46C();
      uint64_t v136 = sub_E484();
      *(_DWORD *)uint64_t v20 = v129;
      id v21 = [v16 name];
      sub_253A0();

      uint64_t v22 = sub_1F014();
      *(void *)(v20 + 4) = sub_14464(v22, v23, v24);

      uint64_t v4 = v130;
      swift_bridgeObjectRelease();
      sub_1EFC8(&dword_0, v17, (os_log_type_t)v3, "#ReadingVoiceListController adding variety voice %s");
      swift_arrayDestroy();
      uint64_t v1 = v128;
      sub_E414();
      sub_E414();
    }
    else
    {
    }
    os_log_type_t v123 = *v126;
    v123(v122, v15, v4);
    char v25 = v1;
    id v26 = sub_25300();
    sub_25560();
    sub_1EEFC();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v132 = v12;
    uint64_t v134 = v15;
    if (v28)
    {
      unint64_t v3 = sub_E46C();
      uint64_t v136 = sub_E484();
      sub_1EFE0();
      if (!v29 || (v30 = v29, v31 = sub_25270(), v33 = v32, v30, uint64_t v1 = v128, !v33))
      {
        swift_bridgeObjectRelease();
        unint64_t v33 = 0xE400000000000000;
        uint64_t v31 = 1818848800;
      }
      id v34 = v1;
      *(void *)(v3 + 4) = sub_14464(v31, v33, &v136);

      swift_bridgeObjectRelease();
      sub_1EEC0(&dword_0, v26, (os_log_type_t)v16, "#ReadingVoiceListController current subscription %s");
      sub_E808();
      sub_E414();
      sub_E414();

      uint64_t v35 = *v125;
      uint64_t v4 = v130;
    }
    else
    {
      id v34 = v1;

      uint64_t v35 = *v125;
    }
    sub_1EED8();
    v35();
    type metadata accessor for MessagingWithSiriController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v37 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
    v139._countAndFlagsBits = 0xD000000000000018;
    v104._countAndFlagsBits = 0xE000000000000000;
    v139._object = v116;
    v140.value._countAndFlagsBits = 0xD000000000000014;
    v140.value._object = v115;
    v38.super.Class isa = v37;
    v141._countAndFlagsBits = 0;
    v141._object = (void *)0xE000000000000000;
    sub_25110(v139, v140, v38, v141, v104);
    sub_1F074();
    sub_BA78(&qword_31910);
    uint64_t v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = v114;
    uint64_t v40 = v124;
    uint64_t v136 = v124;
    sub_1ECAC();
    uint64_t v41 = sub_25610();
    uint64_t v43 = v42;
    *(void *)(v39 + 56) = &type metadata for String;
    *(void *)(v39 + 64) = sub_1ECF8();
    *(void *)(v39 + 32) = v41;
    *(void *)(v39 + 40) = v43;
    sub_1F05C();
    uint64_t v44 = sub_253B0();
    id v6 = v45;
    swift_bridgeObjectRelease();
    v104._countAndFlagsBits = v117;
    sub_1EF20();
    os_log_type_t v54 = sub_1E6BC(v46, v47, v48, v49, v50, v51, v52, v53, (void *)v104._countAndFlagsBits);
    if (v54) {
      break;
    }
    swift_bridgeObjectRelease();

    unint64_t v3 = v113;
    uint64_t v67 = v131;
    uint64_t v1 = v34;
LABEL_54:
    uint64_t v12 = v132 + 1;
    if (v67 == v112) {
      goto LABEL_59;
    }
  }
  BOOL v55 = __OFADD__(v40, 1);
  uint64_t v1 = (char *)(v40 + 1);
  if (v55) {
    goto LABEL_57;
  }
  os_log_type_t v56 = v54;
  uint64_t v119 = v44;
  uint64_t v120 = (uint64_t)v6;
  uint64_t v124 = (uint64_t)v1;
  v123(v111, v134, v4);
  os_log_type_t v57 = v25;
  id v58 = sub_25300();
  sub_25560();
  sub_1EEFC();
  BOOL v60 = os_log_type_enabled(v58, v59);
  char v121 = v56;
  if (v60)
  {
    os_log_type_t v56 = (_DWORD *)sub_E46C();
    uint64_t v136 = sub_E484();
    _DWORD *v56 = v129;
    id v61 = *(void **)&v34[v127];
    if (!v61 || (id v62 = v61, v63 = sub_25270(), v65 = v64, v62, !v65))
    {
      swift_bridgeObjectRelease();
      unint64_t v65 = 0xE300000000000000;
      uint64_t v63 = 7104878;
    }
    uint64_t v66 = sub_14464(v63, v65, &v136);
    sub_1EF7C(v66);
    sub_255F0();

    swift_bridgeObjectRelease();
    sub_1EEC0(&dword_0, v58, (os_log_type_t)v16, "#ReadingVoiceListController marking as currently subscribed voice %s");
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    uint64_t v4 = v130;
    sub_1EED8();
    v35();
    uint64_t v1 = v128;
  }
  else
  {

    sub_1EED8();
    v35();
    uint64_t v1 = v34;
  }
  uint64_t v68 = v57;
  id v69 = sub_25300();
  sub_25560();
  sub_1EEFC();
  if (os_log_type_enabled(v69, v70))
  {
    LOBYTE(v56) = sub_E46C();
    uint64_t v135 = sub_E484();
    sub_1EFE0();
    if (v71)
    {
      id v72 = v71;
      uint64_t v73 = sub_25270();
      uint64_t v75 = v74;
    }
    else
    {
      uint64_t v73 = 0;
      uint64_t v75 = 0;
    }
    uint64_t v136 = v73;
    uint64_t v137 = v75;
    sub_BA78(&qword_31888);
    uint64_t v76 = sub_253C0();
    uint64_t v136 = sub_14464(v76, v77, &v135);
    sub_255F0();

    swift_bridgeObjectRelease();
    sub_1EEC0(&dword_0, v69, (os_log_type_t)v16, "#ReadingVoiceListController currentVoiceSubscription name %s ");
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    uint64_t v1 = v128;
    uint64_t v4 = v130;
  }
  else
  {
  }
  uint64_t v78 = v133;
  id v79 = sub_25300();
  os_log_type_t v80 = sub_25560();
  if (sub_E644(v80))
  {
    uint64_t v81 = (uint8_t *)sub_E46C();
    uint64_t v136 = sub_E484();
    *(_DWORD *)uint64_t v81 = v129;
    id v82 = [v78 name];
    uint64_t v83 = sub_253A0();
    unint64_t v85 = v84;

    uint64_t v4 = v130;
    uint64_t v86 = v83;
    uint64_t v1 = v128;
    uint64_t v87 = sub_14464(v86, v85, &v136);
    sub_1EF7C(v87);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v79, (os_log_type_t)v56, "#ReadingVoiceListController voice name %s ", v81, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
  BOOL v88 = *(void **)&v1[v127];
  if (v88)
  {
    id v89 = v88;
    uint64_t v90 = sub_25270();
    uint64_t v92 = v91;
  }
  else
  {
    uint64_t v90 = 0;
    uint64_t v92 = 0;
  }
  id v93 = [v78 name];
  uint64_t v94 = sub_253A0();
  uint64_t v96 = v95;

  if (!v92)
  {
    swift_bridgeObjectRelease();
    uint64_t v99 = v121;
LABEL_51:
    id v102 = v99;
    sub_25400();
    if (*(void *)((char *)&dword_10 + (v138 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                    + (v138 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_E840();
    sub_25480();
    sub_25440();
    sub_1EF50();
    os_log_type_t v103 = v78;
    sub_1CC70((uint64_t)v103, v119, v120, (void (*)(uint64_t))sub_1D04C);
    swift_endAccess();

    swift_bridgeObjectRelease();
    unint64_t v3 = v113;
    uint64_t v67 = v131;
    goto LABEL_54;
  }
  if (v90 == v94 && v92 == v96)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v99 = v121;
  }
  else
  {
    char v98 = sub_257C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v99 = v121;
    if ((v98 & 1) == 0) {
      goto LABEL_51;
    }
  }
  if (*(void *)&v1[v106])
  {
    uint64_t v100 = sub_253A0();
    sub_1EE70(v100, v101);
    goto LABEL_51;
  }
  __break(1u);
}

uint64_t sub_18DF4()
{
  uint64_t v1 = v0;
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  unint64_t v3 = (void *)sub_E4E0(v2, (uint64_t)qword_31D88);
  os_log_type_t v4 = sub_25560();
  if (sub_E644(v4))
  {
    *(_WORD *)sub_E49C() = 0;
    sub_E5F0(&dword_0, v5, v6, "#ReadingVoiceListController setting currentVoiceSubscription");
    sub_E414();
  }

  if (qword_31448 != -1) {
    swift_once();
  }
  sub_E520();
  uint64_t v7 = (void *)static MessagesSettingsUtils.daemonSession;
  *(void *)(swift_allocObject() + 16) = v1;
  id v8 = v7;
  id v9 = v1;
  sub_25200();

  return swift_release();
}

uint64_t sub_18F54(unint64_t a1, char *a2)
{
  uint64_t v91 = a2;
  unint64_t v92 = a1;
  uint64_t v80 = sub_25330();
  uint64_t v2 = *(uint8_t **)(v80 - 8);
  __chkstk_darwin(v80);
  id v79 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_25350();
  os_log_type_t v4 = *(uint8_t **)(v78 - 8);
  __chkstk_darwin(v78);
  unint64_t v77 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25310();
  uint64_t v7 = *(uint8_t **)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_25150();
  uint64_t v10 = *(uint8_t **)(v89 - 8);
  __chkstk_darwin(v89);
  id v97 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v90 = v6;
  uint64_t v12 = sub_C2FC(v6, (uint64_t)qword_31D88);
  unint64_t v13 = v92;
  swift_bridgeObjectRetain_n();
  uint64_t v96 = v12;
  uint64_t v14 = sub_25300();
  os_log_type_t v15 = sub_25560();
  unint64_t v16 = v13 >> 62;
  if (!os_log_type_enabled(v14, v15))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  uint64_t v95 = v7;
  uint64_t v7 = v10;
  uint64_t v10 = v2;
  uint64_t v2 = v4;
  os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)os_log_type_t v4 = 134217984;
  if (v16) {
    goto LABEL_50;
  }
  uint64_t v17 = *(void *)((char *)&dword_10 + (v92 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    swift_bridgeObjectRelease();
    aBlock[0] = v17;
    sub_255F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v14, v15, "#ReadingVoiceListController voiceSubscriptions.count %ld", v4, 0xCu);
    swift_slowDealloc();

    os_log_type_t v4 = v2;
    uint64_t v2 = v10;
    uint64_t v10 = v7;
    uint64_t v7 = v95;
LABEL_8:
    if (v16)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_25760();
    }
    else
    {
      uint64_t v14 = *(NSObject **)((char *)&dword_10 + (v92 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
    }
    BOOL v19 = v91;
    if (!v14) {
      return swift_bridgeObjectRelease();
    }
    if ((uint64_t)v14 >= 1)
    {
      uint64_t v20 = 0;
      uint64_t v93 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale;
      unint64_t v87 = v92 & 0xC000000000000001;
      uint64_t v81 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription;
      unint64_t v85 = (void (**)(char *, uint64_t))(v7 + 8);
      uint64_t v86 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
      uint64_t v83 = (void (**)(char *, uint64_t))(v10 + 8);
      uint64_t v76 = v99;
      uint64_t v75 = (void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v74 = (void (**)(char *, uint64_t))(v4 + 8);
      *(void *)&long long v18 = 136315138;
      long long v84 = v18;
      id v82 = (char *)&type metadata for Any + 8;
      unint64_t v73 = (unint64_t)"s";
      uint64_t v94 = v9;
      BOOL v88 = v14;
      while (1)
      {
        uint64_t v95 = v20;
        id v21 = v19;
        if (v87) {
          id v22 = (id)sub_256B0();
        }
        else {
          id v22 = *(id *)(v92 + 8 * (void)v20 + 32);
        }
        unint64_t v23 = v22;
        uint64_t v24 = v90;
        char v25 = (void *)sub_252B0();
        sub_25290();

        sub_25160();
        (*v86)(v9, v96, v24);
        id v26 = v23;
        os_log_type_t v27 = sub_25300();
        os_log_type_t v28 = sub_25560();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v29 = v84;
          id v30 = (void *)sub_252B0();
          uint64_t v31 = sub_25270();
          unint64_t v33 = v32;

          if (v33) {
            uint64_t v34 = v31;
          }
          else {
            uint64_t v34 = 7104878;
          }
          id v21 = v91;
          if (v33) {
            unint64_t v35 = v33;
          }
          else {
            unint64_t v35 = 0xE300000000000000;
          }
          *(void *)(v29 + 4) = sub_14464(v34, v35, aBlock);

          id v36 = v26;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v27, v28, "#ReadingVoiceListController voiceSubscription.voice.name %s", (uint8_t *)v29, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*v85)(v94, v24);
        }
        else
        {

          id v36 = v26;
          (*v85)(v9, v24);
        }
        uint64_t v37 = v21;
        NSBundle v38 = sub_25300();
        os_log_type_t v39 = sub_25560();
        BOOL v19 = v21;
        if (os_log_type_enabled(v38, v39))
        {
          uint64_t v40 = swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v40 = v84;
          uint64_t v41 = *(void **)&v21[v93];
          uint64_t v42 = v36;
          if (v41)
          {
            id v43 = [v41 languageCode];
            unint64_t v44 = sub_253A0();
            unint64_t v46 = v45;
          }
          else
          {
            unint64_t v46 = v73 | 0x8000000000000000;
            unint64_t v44 = 0xD00000000000001ALL;
          }
          *(void *)(v40 + 4) = sub_14464(v44, v46, aBlock);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v38, v39, "#ReadingVoiceListController self.currentlySubscribedLocale?.languageCode %s", (uint8_t *)v40, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          BOOL v19 = v91;
        }
        else
        {

          uint64_t v42 = v36;
        }
        id v9 = v94;
        uint64_t v47 = *(void **)&v19[v93];
        if (!v47)
        {

          goto LABEL_45;
        }
        id v48 = [v47 localeIdentifier];
        uint64_t v49 = sub_253A0();
        uint64_t v51 = v50;

        if (v49 == sub_25130() && v51 == v52)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v54 = sub_257C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v54 & 1) == 0) {
            goto LABEL_42;
          }
        }
        BOOL v55 = *(void **)&v19[v81];
        id v56 = v55;
        os_log_type_t v57 = (void *)sub_252B0();
        id v58 = v57;
        if (!v55)
        {

LABEL_44:
          uint64_t v61 = sub_252B0();
          sub_155F8(v61);
          sub_DC98(0, &qword_31580);
          id v62 = (void *)sub_25570();
          uint64_t v63 = swift_allocObject();
          *(void *)(v63 + 16) = v37;
          v99[2] = sub_1EC44;
          v99[3] = v63;
          aBlock[0] = (uint64_t)_NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          v99[0] = sub_7228;
          v99[1] = &unk_2CFF0;
          unint64_t v64 = _Block_copy(aBlock);
          unint64_t v65 = v37;
          swift_release();
          uint64_t v66 = v42;
          uint64_t v67 = v77;
          sub_25340();
          aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
          sub_1EC64((unint64_t *)&qword_31588, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
          sub_BA78(&qword_31590);
          sub_1ED44((unint64_t *)&qword_31598, &qword_31590);
          uint64_t v68 = v79;
          uint64_t v69 = v80;
          sub_25630();
          sub_25580();
          _Block_release(v64);

          os_log_type_t v70 = v68;
          id v9 = v94;
          (*v75)(v70, v69);
          (*v74)(v67, v78);
LABEL_45:
          (*v83)(v97, v89);
          goto LABEL_46;
        }
        sub_252A0();
        id v59 = v56;
        char v60 = sub_255A0();

        if ((v60 & 1) == 0) {
          goto LABEL_44;
        }
LABEL_42:
        (*v83)(v97, v89);

LABEL_46:
        uint64_t v20 = v95 + 1;
        if (v88 == (v95 + 1)) {
          return swift_bridgeObjectRelease();
        }
      }
    }
    __break(1u);
LABEL_50:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25760();
    swift_bridgeObjectRelease();
  }
}

void sub_19A78(char *a1)
{
  NSString v3 = sub_25390();
  id v4 = [a1 valueForKey:v3];

  if (v4)
  {
    sub_25620();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v99, 0, sizeof(v99));
  }
  sub_C18C((uint64_t)v99, (uint64_t)v100);
  if (!v101)
  {
    sub_14C98((uint64_t)v100);
    return;
  }
  sub_BA78(&qword_31578);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  unint64_t v88 = v98[1];
  uint64_t v5 = (uint64_t *)&a1[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietySpecifiers];
  swift_beginAccess();
  uint64_t v6 = *v5;
  if ((unint64_t)*v5 >> 62) {
    goto LABEL_86;
  }
  id v7 = *(id *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v7)
  {
LABEL_87:
    swift_bridgeObjectRelease();
LABEL_88:
    swift_bridgeObjectRelease();
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v63 = sub_25310();
    sub_C2FC(v63, (uint64_t)qword_31D88);
    unint64_t v64 = sub_25300();
    os_log_type_t v65 = sub_25550();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl(&dword_0, v64, v65, "#ReadingVoiceListController unable to find variety specifier", v66, 2u);
      swift_slowDealloc();
    }

    return;
  }
LABEL_8:
  uint64_t v96 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription;
  id v97 = a1;
  uint64_t v93 = &a1[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyNameToLocale];
  swift_beginAccess();
  uint64_t v91 = 0;
  uint64_t v8 = 4;
  do
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_256B0();
    }
    else {
      id v9 = *(id *)(v6 + 8 * v8);
    }
    uint64_t v10 = v9;
    uint64_t v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
    {
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      swift_bridgeObjectRetain_n();
      id v7 = (id)sub_25760();
      swift_bridgeObjectRelease();
      if (!v7) {
        goto LABEL_87;
      }
      goto LABEL_8;
    }
    uint64_t v12 = sub_1E8B4(v9, (SEL *)&selRef_identifier);
    if (!v13)
    {

      __break(1u);
      goto LABEL_116;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v93;
    if (*(void *)(*(void *)v93 + 16))
    {
      uint64_t v16 = v12;
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_2471C(v16, v14);
      if (v18)
      {
        uint64_t v19 = *(void *)(v15 + 56) + 16 * v17;
        uint64_t v1 = *(char **)v19;
        uint64_t v20 = *(void *)(v19 + 8);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v1 = 0;
        uint64_t v20 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v1 = 0;
      uint64_t v20 = 0;
    }
    swift_bridgeObjectRelease();
    id v21 = *(void **)&v97[v96];
    if (!v21)
    {
      if (v20)
      {
LABEL_30:

        swift_bridgeObjectRelease();
        goto LABEL_37;
      }
      id v27 = v7;
LABEL_34:

      uint64_t v91 = v10;
      goto LABEL_38;
    }
    id v22 = v21;
    a1 = (char *)sub_25290();
    uint64_t v24 = v23;

    if (!v20)
    {
      id v27 = v7;
      if (v24)
      {

        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
      goto LABEL_34;
    }
    if (!v24) {
      goto LABEL_30;
    }
    if (v1 == a1 && v20 == v24)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_36:

      uint64_t v91 = v10;
      goto LABEL_37;
    }
    char v26 = sub_257C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_36;
    }

LABEL_37:
    id v27 = v7;
LABEL_38:
    ++v8;
  }
  while ((id)v11 != v27);
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t)v91;
  if (!v91) {
    goto LABEL_88;
  }
  uint64_t v28 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup;
  uint64_t v29 = v97;
  id v30 = *(void **)&v97[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup];
  if (!v30)
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  uint64_t v31 = PSRadioGroupCheckedSpecifierKey;
  uint64_t v32 = sub_253A0();
  uint64_t v34 = v33;
  id v7 = v91;
  sub_21444((uint64_t)v91, v32, v34, v30);
  unint64_t v35 = *(void **)&v97[v96];
  if (!v35)
  {
    uint64_t v1 = 0;
    goto LABEL_96;
  }
  id v36 = v35;
  uint64_t v37 = sub_25290();
  a1 = v38;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v95 = sub_21A64(v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v39 = *(void *)&v97[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceSpecifiers];
  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_25760();
    if (!v40) {
      goto LABEL_94;
    }
LABEL_44:
    uint64_t v85 = v31;
    uint64_t v86 = v28;
    id v87 = v7;
    if (v40 < 1)
    {
      __break(1u);
      goto LABEL_114;
    }
    uint64_t v1 = 0;
    unint64_t v41 = 0;
    unint64_t v94 = v39 & 0xC000000000000001;
    uint64_t v90 = v40;
    unint64_t v92 = v39;
    while (1)
    {
      if (v94) {
        uint64_t v42 = (char *)sub_256B0();
      }
      else {
        uint64_t v42 = (char *)*(id *)(v39 + 8 * v41 + 32);
      }
      id v43 = v42;
      if (v95)
      {
        if ((v95 & 0xC000000000000001) != 0)
        {
          swift_bridgeObjectRetain();
          a1 = (char *)sub_256B0();
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v41 >= *(void *)((char *)&dword_10 + (v95 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_85;
          }
          a1 = (char *)*(id *)(v95 + 8 * v41 + 32);
        }
        id v44 = objc_msgSend(a1, "name", v85, v86, v87);
        uint64_t v45 = sub_253A0();
        uint64_t v6 = v46;

        uint64_t v47 = *(void **)&v97[v96];
        if (!v47)
        {
          if (!v6) {
            goto LABEL_70;
          }
LABEL_67:

          swift_bridgeObjectRelease();
          goto LABEL_68;
        }
      }
      else
      {
        a1 = 0;
        uint64_t v6 = 0;
        uint64_t v45 = 0;
        uint64_t v47 = *(void **)&v29[v96];
        if (!v47) {
          goto LABEL_70;
        }
      }
      id v48 = v47;
      uint64_t v49 = sub_25270();
      uint64_t v51 = v50;

      if (!v6)
      {
        if (!v51) {
          goto LABEL_70;
        }
        goto LABEL_67;
      }
      if (!v51) {
        goto LABEL_67;
      }
      if (v45 == v49 && v6 == v51)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_70:
        uint64_t v89 = v1;
        if (qword_31488 != -1) {
          swift_once();
        }
        uint64_t v55 = sub_25310();
        sub_C2FC(v55, (uint64_t)qword_31D88);
        id v56 = a1;
        os_log_type_t v57 = sub_25300();
        os_log_type_t v58 = sub_25560();
        if (os_log_type_enabled(v57, v58))
        {
          uint64_t v6 = swift_slowAlloc();
          v98[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v6 = 136315138;
          if (a1)
          {
            id v59 = [v56 name];
            sub_253A0();
            a1 = v60;
          }
          sub_BA78(&qword_31888);
          uint64_t v61 = sub_253C0();
          *(void *)(v6 + 4) = sub_14464(v61, v62, v98);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v57, v58, "#ReadingVoiceListController found match for %s", (uint8_t *)v6, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        uint64_t v29 = v97;
        uint64_t v54 = v90;
        unint64_t v39 = v92;
        uint64_t v1 = v43;
        goto LABEL_78;
      }
      char v53 = sub_257C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v53) {
        goto LABEL_70;
      }

LABEL_68:
      uint64_t v29 = v97;
      uint64_t v54 = v90;
      unint64_t v39 = v92;
LABEL_78:
      if (v54 == ++v41)
      {
        swift_bridgeObjectRelease();
        uint64_t v28 = v86;
        id v7 = v87;
        goto LABEL_95;
      }
    }
  }
  uint64_t v40 = *(void *)((char *)&dword_10 + (v39 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (v40) {
    goto LABEL_44;
  }
LABEL_94:
  swift_bridgeObjectRelease();
  uint64_t v1 = 0;
LABEL_95:
  swift_bridgeObjectRelease();
LABEL_96:
  uint64_t v67 = sub_1A60C();
  if (!v67)
  {
    swift_bridgeObjectRelease();
    if (qword_31488 == -1)
    {
LABEL_101:
      uint64_t v78 = sub_25310();
      sub_C2FC(v78, (uint64_t)qword_31D88);
      id v79 = sub_25300();
      os_log_type_t v80 = sub_25550();
      if (os_log_type_enabled(v79, v80))
      {
        uint64_t v81 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v81 = 0;
        _os_log_impl(&dword_0, v79, v80, "#ReadingVoiceListController unable to find variety specifier", v81, 2u);
        swift_slowDealloc();

        goto LABEL_107;
      }

      goto LABEL_110;
    }
LABEL_114:
    swift_once();
    goto LABEL_101;
  }
  uint64_t v68 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup;
  uint64_t v69 = *(void **)&v29[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup];
  if (!v69)
  {
LABEL_117:

    __break(1u);
    return;
  }
  os_log_type_t v70 = v67;
  uint64_t v71 = sub_253A0();
  sub_21444((uint64_t)v70, v71, v72, v69);
  unint64_t v73 = sub_1F1A8(v88);
  swift_bridgeObjectRelease();
  id v74 = objc_allocWithZone((Class)PSSpecifierUpdates);
  id v75 = sub_20E40((uint64_t)v73);
  if (v75)
  {
    uint64_t v76 = v75;
    [v29 reloadSpecifier:v7];
    [v29 reloadSpecifier:*(void *)&v29[v28]];
    [v29 reloadSpecifier:v70];
    id v77 = *(id *)&v29[v68];
    [v29 reloadSpecifier:v77];

    return;
  }
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v82 = sub_25310();
  sub_C2FC(v82, (uint64_t)qword_31D88);
  id v79 = sub_25300();
  os_log_type_t v83 = sub_25550();
  if (!os_log_type_enabled(v79, v83))
  {

LABEL_110:
    goto LABEL_111;
  }
  long long v84 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)long long v84 = 0;
  _os_log_impl(&dword_0, v79, v83, "#MessagingWithSiriController handleURL failed to get updates", v84, 2u);
  swift_slowDealloc();

LABEL_107:
LABEL_111:
}

void *sub_1A60C()
{
  uint64_t v41 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription;
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v0;
  id v3 = v1;
  uint64_t v4 = sub_25290();

  sub_E520();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21A64(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceSpecifiers);
  if (v6 >> 62)
  {
LABEL_47:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25760();
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_48;
  }
  uint64_t v7 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v7)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_4:
  uint64_t v40 = v7;
  uint64_t v38 = v5 & 0xFFFFFFFFFFFFFF8;
  unint64_t v39 = v5 & 0xC000000000000001;
  uint64_t v8 = 4;
  while (1)
  {
    unint64_t v9 = v8 - 4;
    if ((v6 & 0xC000000000000001) != 0)
    {
      sub_1F068();
      id v10 = (id)sub_256B0();
    }
    else
    {
      id v10 = *(id *)(v6 + 8 * v8);
    }
    uint64_t v11 = v10;
    uint64_t v12 = v8 - 3;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    if (v5)
    {
      if (v39)
      {
        swift_bridgeObjectRetain();
        id v13 = (id)sub_256B0();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v9 >= *(void *)(v38 + 16)) {
          goto LABEL_46;
        }
        id v13 = *(id *)(v5 + 8 * v8);
      }
      id v14 = [v13 name];
      uint64_t v15 = sub_253A0();
      uint64_t v17 = v16;

      char v18 = *(void **)(v2 + v41);
      if (!v18)
      {
        id v19 = v13;
        if (!v17) {
          goto LABEL_37;
        }
        goto LABEL_29;
      }
    }
    else
    {
      id v13 = 0;
      uint64_t v17 = 0;
      uint64_t v15 = 0;
      id v19 = 0;
      char v18 = *(void **)(v2 + v41);
      if (!v18) {
        goto LABEL_37;
      }
    }
    id v42 = v13;
    id v43 = v11;
    uint64_t v20 = v5;
    uint64_t v21 = v2;
    id v22 = v18;
    uint64_t v23 = sub_25270();
    uint64_t v25 = v24;

    if (!v17) {
      break;
    }
    if (!v25)
    {
      uint64_t v2 = v21;
      uint64_t v5 = v20;
      id v13 = v42;
      uint64_t v11 = v43;
LABEL_29:

      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    if (v15 == v23 && v17 == v25)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_35:
      swift_bridgeObjectRelease();
      uint64_t v28 = v42;
      uint64_t v11 = v43;
      goto LABEL_38;
    }
    char v27 = sub_257C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }

LABEL_27:
    uint64_t v2 = v21;
    uint64_t v5 = v20;
    id v13 = v42;
LABEL_30:

    ++v8;
    if (v12 == v40) {
      goto LABEL_48;
    }
  }
  if (v25)
  {

    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  id v19 = v42;
  uint64_t v11 = v43;
LABEL_37:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v19;
LABEL_38:
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_25310();
  sub_C2FC(v29, (uint64_t)qword_31D88);
  id v30 = v28;
  uint64_t v31 = sub_25300();
  os_log_type_t v32 = sub_25560();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (_DWORD *)sub_E46C();
    uint64_t v44 = sub_E484();
    *uint64_t v33 = 136315138;
    if (v28)
    {
      id v34 = [v30 name];
      sub_253A0();
    }
    sub_BA78(&qword_31888);
    uint64_t v35 = sub_253C0();
    sub_14464(v35, v36, &v44);
    sub_255F0();

    swift_bridgeObjectRelease();
    sub_E7A8(&dword_0, v31, v32, "#ReadingVoiceListController found match for %s");
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
  return v11;
}

void sub_1AADC(uint64_t a1)
{
  uint64_t v2 = v1;
  Class isa = sub_251C0().super.isa;
  v150.receiver = v1;
  v150.super_class = (Class)type metadata accessor for ReadingVoiceListController();
  objc_msgSendSuper2(&v150, "tableView:didSelectRowAtIndexPath:", a1, isa);

  Class v5 = sub_251C0().super.isa;
  id v6 = [v2 specifierAtIndexPath:v5];

  if (!v6) {
    goto LABEL_91;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_1E914(v7);
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = v8;
  uint64_t v11 = v9;
  uint64_t v12 = (uint64_t *)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyNameToLocale];
  sub_E520();
  uint64_t v147 = v12;
  uint64_t v13 = *v12;
  swift_bridgeObjectRetain();
  sub_21A0C(v10, v11, v13);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_6:
    uint64_t v22 = sub_1E914(v7);
    if (!v23) {
      goto LABEL_91;
    }
    uint64_t v24 = v22;
    uint64_t v25 = v23;
    char v26 = (uint64_t *)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceDisplayStringToVoice];
    sub_E520();
    uint64_t v27 = *v26;
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_21AAC(v24, v25, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v28) {
      goto LABEL_91;
    }
    uint64_t v29 = *(void **)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale];
    if (v29)
    {
      id v30 = v29;
      id v31 = [v30 localeIdentifier];
      sub_253A0();

      uint64_t v32 = sub_1F014();
      sub_129A4(v32, v33);
      swift_bridgeObjectRelease();
      if (qword_31440 != -1) {
        swift_once();
      }
      sub_E520();
      swift_retain();
      id v34 = [v28 name];
      uint64_t v35 = sub_253A0();
      uint64_t v37 = v36;

      sub_F8CC(0, 0, v35, v37);
      swift_release();
      swift_bridgeObjectRelease();
      id v38 = [v30 localeIdentifier];
      sub_253A0();

      id v39 = [v28 name];
      sub_253A0();

      id v40 = objc_allocWithZone((Class)sub_252A0());
      sub_1F020();
      uint64_t v41 = sub_25280();
      sub_155F8(v41);
      id v42 = [v30 localeIdentifier];
      sub_253A0();

      id v43 = [v28 name];
      sub_253A0();

      sub_1F020();
      sub_1BC04();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      NSString v44 = sub_E4B4();
      id v45 = [v2 valueForKey:v44];

      if (v45)
      {
        sub_25620();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v151 = 0u;
        long long v152 = 0u;
      }
      sub_C18C((uint64_t)&v151, (uint64_t)v153);
      if (!v154)
      {

        sub_14C98((uint64_t)v153);
        goto LABEL_91;
      }
      sub_BA78(&qword_31578);
      if (sub_1EF90())
      {
        swift_bridgeObjectRelease();
        id v52 = [v30 localeIdentifier];
        sub_253A0();

        sub_E520();
        swift_bridgeObjectRetain();
        uint64_t v53 = sub_1F014();
        uint64_t v54 = sub_21A64(v53);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v54)
        {
          sub_18234();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          [v2 reloadSpecifiers];
        }
      }
    }
LABEL_91:
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v120 = sub_25310();
    sub_C2FC(v120, (uint64_t)qword_31D88);
    uint64_t v71 = v6;
    uint64_t v7 = sub_25300();
    os_log_type_t v121 = sub_25560();
    if (os_log_type_enabled(v7, v121))
    {
      uint64_t v122 = (_DWORD *)sub_E46C();
      os_log_type_t v123 = (void *)sub_E660();
      *uint64_t v122 = 138412290;
      if (v6)
      {
        *(void *)&long long v151 = v71;
        id v124 = v6;
        id v125 = v71;
        sub_255F0();
      }
      else
      {
        *(void *)&long long v151 = 0;
        sub_255F0();
        id v124 = 0;
      }
      void *v123 = v124;

      sub_1EFC8(&dword_0, v7, v121, "#ListOfLanguagesController selected %@");
      sub_BA78(&qword_315C0);
      swift_arrayDestroy();
      sub_E414();
      sub_E414();
    }
    else
    {

      uint64_t v7 = v71;
    }
    goto LABEL_99;
  }
  uint64_t v16 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale;
  uint64_t v17 = *(void **)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale];
  id v148 = v6;
  if (v17)
  {
    id v18 = [v17 localeIdentifier];
    uint64_t v19 = sub_253A0();
    unint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v21 = 0;
  }
  sub_129A4(v19, v21);
  swift_bridgeObjectRelease();
  sub_DC98(0, &qword_315A0);
  swift_bridgeObjectRetain();
  sub_1EFB0();
  id v46 = sub_14E40();
  sub_155E0((uint64_t)v46);
  sub_E520();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_1EFB0();
  unint64_t v48 = sub_21A64(v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v48)
  {
    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v55 = sub_25760();
      swift_bridgeObjectRelease();
      if (v55) {
        goto LABEL_17;
      }
    }
    else if (*(void *)((char *)&dword_10 + (v48 & 0xFFFFFFFFFFFFFF8)))
    {
LABEL_17:
      sub_21214(0, (v48 & 0xC000000000000001) == 0, v48);
      if ((v48 & 0xC000000000000001) != 0) {
        id v49 = (id)sub_256B0();
      }
      else {
        id v49 = *(id *)(v48 + 32);
      }
      uint64_t v50 = v49;
      swift_bridgeObjectRelease();
      id v51 = [v50 name];

      sub_253A0();
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
  }
LABEL_31:
  objc_allocWithZone((Class)sub_252A0());
  swift_bridgeObjectRetain();
  sub_1EFB0();
  uint64_t v56 = sub_25280();
  sub_155F8(v56);
  uint64_t v146 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription;
  os_log_type_t v57 = *(void **)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription];
  if (!v57)
  {
LABEL_38:
    swift_bridgeObjectRelease();
    if (qword_31488 != -1) {
LABEL_110:
    }
      swift_once();
    uint64_t v65 = sub_25310();
    uint64_t v66 = sub_E4E0(v65, (uint64_t)qword_31D88);
    os_log_type_t v67 = sub_25550();
    if (sub_E554(v67))
    {
      uint64_t v68 = (_WORD *)sub_E49C();
      sub_E6B0(v68);
      sub_E5BC(&dword_0, v69, v70, "#ListOfLanguagesController could not get a name from the current voice subscription");
      sub_E414();
      uint64_t v71 = v7;
      uint64_t v7 = v66;
    }
    else
    {
      uint64_t v71 = v66;
    }
    goto LABEL_99;
  }
  os_log_type_t v58 = v57;
  uint64_t v59 = sub_25270();
  if (!v60)
  {

    goto LABEL_38;
  }
  uint64_t v61 = v59;
  uint64_t v62 = v60;
  if (qword_31440 != -1) {
    swift_once();
  }
  sub_E520();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_F8CC(0, 0, v61, v62);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1EFB0();
  sub_1BC04();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v63 = sub_E4B4();
  id v64 = [v2 valueForKey:v63];

  if (v64)
  {
    sub_25620();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v151 = 0u;
    long long v152 = 0u;
  }
  sub_C18C((uint64_t)&v151, (uint64_t)v153);
  if (!v154)
  {

    sub_14C98((uint64_t)v153);
    goto LABEL_91;
  }
  sub_BA78(&qword_31578);
  if ((sub_1EF90() & 1) == 0)
  {

    goto LABEL_91;
  }
  uint64_t v72 = *(void **)&v2[v16];
  if (!v72)
  {

LABEL_90:
    swift_bridgeObjectRelease();
    goto LABEL_91;
  }
  uint64_t v71 = v72;
  id v73 = [v71 localeIdentifier];
  uint64_t v74 = sub_253A0();

  swift_bridgeObjectRetain();
  uint64_t v75 = sub_21A64(v74);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v75)
  {

    goto LABEL_90;
  }
  uint64_t v76 = (id *)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietySpecifiers];
  sub_E520();
  unint64_t v77 = (unint64_t)*v76;
  if ((unint64_t)*v76 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v78 = sub_25760();
    swift_bridgeObjectRelease();
    if (v78) {
      goto LABEL_49;
    }
LABEL_113:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_114:
    uint64_t v133 = v58;
    swift_bridgeObjectRelease();
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v134 = sub_25310();
    uint64_t v135 = (void *)sub_E4E0(v134, (uint64_t)qword_31D88);
    os_log_type_t v136 = sub_25550();
    if (sub_E554(v136))
    {
      uint64_t v137 = (_WORD *)sub_E49C();
      sub_E6B0(v137);
      sub_E5BC(&dword_0, v138, v139, "#ReadingVoiceListController unable to find variety specifier");
      sub_E414();

      uint64_t v7 = v133;
    }
    else
    {

      uint64_t v71 = v133;
    }
    goto LABEL_99;
  }
  uint64_t v78 = *(void *)((char *)&dword_10 + (v77 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v78) {
    goto LABEL_113;
  }
LABEL_49:
  Swift::String_optional v140 = v58;
  Swift::String v141 = 0;
  unint64_t v142 = v77;
  unint64_t v143 = v77 & 0xC000000000000001;
  uint64_t v79 = 4;
  do
  {
    if (v143) {
      id v80 = (id)sub_256B0();
    }
    else {
      id v80 = *(id *)(v77 + 8 * v79);
    }
    unint64_t v77 = (unint64_t)v80;
    uint64_t v81 = v79 - 3;
    if (__OFADD__(v79 - 4, 1))
    {
      __break(1u);
      goto LABEL_110;
    }
    uint64_t v82 = sub_1E8B4(v80, (SEL *)&selRef_identifier);
    if (!v83)
    {

      __break(1u);
LABEL_120:
      __break(1u);
      goto LABEL_121;
    }
    uint64_t v84 = v83;
    uint64_t v85 = *v147;
    long long v145 = (void *)v77;
    if (*(void *)(*v147 + 16))
    {
      uint64_t v86 = v82;
      swift_bridgeObjectRetain();
      unint64_t v87 = sub_2471C(v86, v84);
      if (v88)
      {
        uint64_t v89 = (uint64_t *)(*(void *)(v85 + 56) + 16 * v87);
        uint64_t v90 = v89[1];
        uint64_t v144 = *v89;
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v144 = 0;
        uint64_t v90 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v144 = 0;
      uint64_t v90 = 0;
    }
    swift_bridgeObjectRelease();
    uint64_t v91 = *(void **)&v2[v146];
    if (v91)
    {
      id v92 = v91;
      uint64_t v93 = sub_25290();
      uint64_t v95 = v94;

      if (v90)
      {
        if (!v95) {
          goto LABEL_73;
        }
        BOOL v96 = v144 == v93 && v90 == v95;
        if (v96)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v97 = sub_257C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v97 & 1) == 0)
          {

            goto LABEL_76;
          }
        }
      }
      else if (v95)
      {
LABEL_73:

        swift_bridgeObjectRelease();
        goto LABEL_76;
      }
    }
    else if (v90)
    {
      goto LABEL_73;
    }

    Swift::String v141 = v145;
LABEL_76:
    unint64_t v77 = v142;
    ++v79;
    BOOL v96 = v81 == v78;
    id v6 = v148;
  }
  while (!v96);
  swift_bridgeObjectRelease();
  if (!v141)
  {
    swift_bridgeObjectRelease();
    os_log_type_t v58 = v140;
    goto LABEL_114;
  }
  char v98 = *(void **)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup];
  if (!v98) {
    goto LABEL_120;
  }
  uint64_t v99 = sub_253A0();
  uint64_t v101 = v100;
  unint64_t v77 = v141;
  sub_21444((uint64_t)v141, v99, v101, v98);
  id v102 = sub_1F1A8(v149);
  id v103 = objc_allocWithZone((Class)PSSpecifierUpdates);
  id v104 = sub_20E40((uint64_t)v102);

  if (v104)
  {
    sub_18234();
    unint64_t v106 = v105;
    swift_bridgeObjectRelease();
    id v107 = sub_1F1A8(v149);
    id v108 = objc_allocWithZone((Class)PSSpecifierUpdates);
    id v109 = sub_20E40((uint64_t)v107);
    if (v109)
    {
      unint64_t v110 = v109;
      unint64_t v111 = swift_bridgeObjectRetain();
      uint64_t v112 = sub_1F1A8(v111);
      swift_bridgeObjectRelease();
      sub_1E984((uint64_t)v112, v110);
      uint64_t v113 = swift_bridgeObjectRetain();
      sub_15670(v113);
      long long v114 = sub_1F1A8(v106);
      swift_bridgeObjectRelease();
      sub_1E9EC((uint64_t)v114, *(void *)&v2[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup], v110);
      id v115 = [v110 context];
      if (v115)
      {
        id v116 = v115;
        [v115 setAnimated:1];

        uint64_t v117 = sub_216E8(v110);
        if (v117 && (unint64_t v118 = sub_1F08C(v117), swift_bridgeObjectRelease(), v118))
        {
          swift_bridgeObjectRelease();
          unint64_t v119 = (unint64_t)v118;
        }
        else
        {
          unint64_t v119 = v149;
        }
        uint64_t v126 = sub_1F1A8(v119);
        swift_bridgeObjectRelease();
        sub_21678((uint64_t)v126, v2);
        [v2 reloadSpecifiers];

        goto LABEL_91;
      }
LABEL_121:

      __break(1u);
      return;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v127 = sub_25310();
  id v128 = (void *)sub_E4E0(v127, (uint64_t)qword_31D88);
  os_log_type_t v129 = sub_25550();
  if (sub_E554(v129))
  {
    uint64_t v130 = (_WORD *)sub_E49C();
    sub_E6B0(v130);
    sub_E5BC(&dword_0, v131, v132, "#MessagingWithSiriController handleURL failed to get updates");
    sub_E414();

    uint64_t v7 = v140;
  }
  else
  {

    uint64_t v71 = v140;
  }
LABEL_99:
}

void sub_1BC04()
{
  objc_allocWithZone((Class)sub_252A0());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_25280();
  id v1 = objc_allocWithZone((Class)sub_25260());
  id v2 = v0;
  id v3 = (void *)sub_25250();
  if (qword_31448 != -1) {
    swift_once();
  }
  sub_E520();
  id v4 = (id)static MessagesSettingsUtils.daemonSession;
  sub_25210();
}

void sub_1BD24()
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25310();
  sub_C2FC(v0, (uint64_t)qword_31D88);
  oslog = sub_25300();
  os_log_type_t v1 = sub_25560();
  if (os_log_type_enabled(oslog, v1))
  {
    id v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "#ListOfLanguagesController preview voice finished", v2, 2u);
    swift_slowDealloc();
  }
}

char *sub_1BE0C(void *a1)
{
  sub_DC98(0, &qword_31850);
  sub_BA78(&qword_31858);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_26300;
  sub_DC98(0, &qword_31860);
  *(void *)(v2 + 32) = sub_25520();
  v38[0] = v2;
  sub_25440();
  sub_BA78(&qword_31868);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26310;
  *(void *)(inited + 32) = 1;
  id v4 = [a1 localeIdentifier];
  uint64_t v5 = sub_253A0();
  uint64_t v7 = v6;

  *(void *)(inited + 64) = &type metadata for String;
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 48) = v7;
  type metadata accessor for TTSAssetProperty();
  sub_1EC64((unint64_t *)&qword_31870, (void (*)(uint64_t))type metadata accessor for TTSAssetProperty);
  sub_25380();
  sub_1F014();
  unint64_t v8 = sub_255B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v9 = [self assistantVoiceMaps];
  sub_255C0();

  id v10 = [a1 localeIdentifier];
  sub_253A0();

  uint64_t v11 = sub_1EFBC();
  uint64_t v12 = sub_21A64(v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v39 = v12;
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25310();
  uint64_t v14 = sub_E4E0(v13, (uint64_t)qword_31D88);
  os_log_type_t v15 = sub_25540();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)sub_E46C();
    v38[0] = sub_E484();
    *(_DWORD *)uint64_t v16 = 136315138;
    sub_E520();
    swift_bridgeObjectRetain();
    sub_BA78(&qword_31908);
    uint64_t v17 = sub_253C0();
    sub_14464(v17, v18, v38);
    sub_1F048();
    sub_255F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v14, v15, "#ReadingVoiceListController workingAssistantVoices %s", v16, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }

  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_25300();
  os_log_type_t v20 = sub_25540();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v21 = (_DWORD *)sub_E46C();
    v38[0] = sub_E484();
    *unint64_t v21 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_25430();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    sub_14464(v22, v24, v38);
    sub_1F048();
    sub_255F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    sub_E7A8(&dword_0, v19, v20, "#ReadingVoiceListController allVoicesFromLocale %s");
    sub_E808();
    sub_E414();
    sub_E414();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_E520();
  unint64_t v25 = v39;
  if (!v39) {
    goto LABEL_22;
  }
  if (!(v39 >> 62))
  {
    uint64_t v26 = *(void *)((char *)&dword_10 + (v39 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v26) {
      goto LABEL_11;
    }
LABEL_21:
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_1542C(v8, _swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (char *)v37;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_25760();
  if (!v26) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t result = sub_2125C(0, v26 & ~(v26 >> 63), 0);
  if ((v26 & 0x8000000000000000) == 0)
  {
    uint64_t v28 = 0;
    do
    {
      if ((v25 & 0xC000000000000001) != 0) {
        id v29 = (id)sub_256B0();
      }
      else {
        id v29 = *(id *)(v25 + 8 * v28 + 32);
      }
      id v30 = v29;
      uint64_t v31 = sub_25240();
      uint64_t v33 = v32;

      unint64_t v35 = _swiftEmptyArrayStorage[2];
      unint64_t v34 = _swiftEmptyArrayStorage[3];
      if (v35 >= v34 >> 1) {
        sub_2125C((char *)(v34 > 1), v35 + 1, 1);
      }
      ++v28;
      _swiftEmptyArrayStorage[2] = v35 + 1;
      uint64_t v36 = &_swiftEmptyArrayStorage[2 * v35];
      v36[4] = v31;
      v36[5] = v33;
    }
    while (v26 != v28);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

id sub_1C3C8@<X0>(id *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id v5 = *a1;
  id v6 = [*a1 name];
  uint64_t v7 = sub_253A0();
  uint64_t v9 = v8;

  LOBYTE(a2) = sub_1511C(v7, v9, a2);
  id result = (id)swift_bridgeObjectRelease();
  if (a2)
  {
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25310();
    sub_C2FC(v11, (uint64_t)qword_31D88);
    id v12 = v5;
    uint64_t v13 = sub_25300();
    os_log_type_t v14 = sub_25540();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v15 = 136315138;
      buf = v15;
      id v16 = v12;
      id v17 = [v16 description];
      unint64_t v18 = a3;
      uint64_t v19 = sub_253A0();
      unint64_t v21 = v20;

      uint64_t v22 = v19;
      a3 = v18;
      sub_14464(v22, v21, &v24);
      sub_255F0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v13, v14, "#ReadingVoiceListController supported voice %s", buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    *a3 = v12;
    return v12;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

id sub_1C62C(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_localeVarietiesWithinLanguage] = _swiftEmptyArrayStorage;
  uint64_t v6 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_localeToVoiceMap;
  uint64_t v7 = v3;
  sub_BA78(&qword_31948);
  *(void *)&v3[v6] = sub_25380();
  uint64_t v8 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyNameToLocale;
  *(void *)&v7[v8] = sub_25380();
  *(void *)&v7[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription] = 0;
  uint64_t v9 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceDisplayStringToVoice;
  sub_DC98(0, &qword_31850);
  *(void *)&v7[v9] = sub_25380();
  *(void *)&v7[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup] = 0;
  *(void *)&v7[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup] = 0;
  *(void *)&v7[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietySpecifiers] = _swiftEmptyArrayStorage;
  *(void *)&v7[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceSpecifiers] = _swiftEmptyArrayStorage;

  if (a2)
  {
    sub_1EFBC();
    NSString v10 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for ReadingVoiceListController();
  id v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_1C828(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentlySubscribedLocale] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_localeVarietiesWithinLanguage] = _swiftEmptyArrayStorage;
  uint64_t v3 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_localeToVoiceMap;
  id v4 = v1;
  sub_BA78(&qword_31948);
  *(void *)&v1[v3] = sub_25380();
  uint64_t v5 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyNameToLocale;
  *(void *)&v4[v5] = sub_25380();
  *(void *)&v4[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_currentVoiceSubscription] = 0;
  uint64_t v6 = OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceDisplayStringToVoice;
  sub_DC98(0, &qword_31850);
  *(void *)&v4[v6] = sub_25380();
  *(void *)&v4[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietyGroup] = 0;
  *(void *)&v4[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceGroup] = 0;
  *(void *)&v4[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_varietySpecifiers] = _swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC20SiriMessagesSettings26ReadingVoiceListController_voiceSpecifiers] = _swiftEmptyArrayStorage;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for ReadingVoiceListController();
  id v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_1C9B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReadingVoiceListController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ReadingVoiceListController()
{
  return self;
}

void *sub_1CAD8(uint64_t a1)
{
  return sub_1CAF0(a1, (void (*)(void *, uint64_t, uint64_t))sub_1EA5C);
}

void *sub_1CAF0(uint64_t a1, void (*a2)(void *, uint64_t, uint64_t))
{
  if ((unint64_t)a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v4 <= 0)
    {
      uint64_t v5 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_BA78(&qword_31858);
      uint64_t v5 = (void *)swift_allocObject();
      size_t v6 = j__malloc_size(v5);
      v5[2] = v4;
      v5[3] = (2 * ((uint64_t)(v6 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v7;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(void *, uint64_t, uint64_t))v4) {
      break;
    }
    __break(1u);
LABEL_8:
    if (a1 < 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    sub_25760();
    sub_1EF38();
    if (!v4) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v5;
}

uint64_t sub_1CBEC()
{
  sub_1EFF4();
  sub_1EE3C();
  sub_1CCDC();
  void *v0 = v2;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1CC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CC70(a1, a2, a3, (void (*)(uint64_t))sub_1CE04);
}

uint64_t sub_1CC70(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  sub_1EFF4();
  uint64_t v6 = sub_1EE3C();
  a4(v6);
  void *v4 = v8;

  return swift_bridgeObjectRelease();
}

void sub_1CCDC()
{
  sub_1EE24();
  os_log_type_t v1 = (void **)v0;
  char v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  id v12 = (void *)*v0;
  unint64_t v13 = sub_2471C(v6, v4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_BA78(&qword_315C8);
  if (!sub_25730(v3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_2471C(v7, v5);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    sub_257F0();
    __break(1u);
    return;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v1;
  if (v19)
  {
    unint64_t v23 = (uint64_t *)(v22[7] + 16 * v18);
    swift_bridgeObjectRelease();
    *unint64_t v23 = v11;
    v23[1] = v9;
    sub_1EDEC();
  }
  else
  {
    sub_1D174(v18, v7, v5, v11, v9, v22);
    sub_1EDEC();
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_1CE04(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_2471C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_BA78(&qword_31950);
  uint64_t result = sub_25730(a4 & 1, v15);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_2471C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = sub_257F0();
    __break(1u);
    return result;
  }
  unint64_t v16 = result;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    *(void *)(v20[7] + 8 * v16) = a1;
  }
  else
  {
    sub_1D1C0(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1CF24(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_2471C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_BA78(&qword_31930);
  if (!sub_25730(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_2471C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = sub_257F0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_1D1C0(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_1D04C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_2471C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_BA78(&qword_31928);
  if (!sub_25730(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_2471C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    sub_257F0();
    __break(1u);
    return;
  }
  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];

    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_1D1C0(v16, a2, a3, a1, v20);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_1D174(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t sub_1D1C0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_1D208()
{
  sub_1EE24();
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v0 = v7;
    uint64_t v2 = v6;
    uint64_t v3 = v5;
    if (!(*v1 >> 62))
    {
      uint64_t v8 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25760();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v8 < v2)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v9 = v2 - v3;
  if (__OFSUB__(v2, v3))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v4 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (!(*v1 >> 62))
  {
    uint64_t v10 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    goto LABEL_9;
  }
LABEL_32:
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25760();
  swift_bridgeObjectRelease();
LABEL_9:
  uint64_t v11 = v10 + v4;
  if (__OFADD__(v10, v4))
  {
    __break(1u);
    goto LABEL_34;
  }
  unint64_t v12 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *os_log_type_t v1 = v12;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v12 & 0x8000000000000000) != 0
    || (v12 & 0x4000000000000000) != 0
    || (uint64_t v14 = v12 & 0xFFFFFFFFFFFFFF8, v11 > *(void *)((char *)&dword_18 + (v12 & 0xFFFFFFFFFFFFFF8)) >> 1))
  {
    if (!(v12 >> 62))
    {
LABEL_15:
      swift_bridgeObjectRetain();
      unint64_t v12 = sub_256C0();
      swift_bridgeObjectRelease();
      *os_log_type_t v1 = v12;
      uint64_t v14 = v12 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_16;
    }
LABEL_34:
    swift_bridgeObjectRetain();
    sub_25760();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v15 = v14 + 32 + 8 * v3;
  sub_DC98(0, &qword_315D0);
  sub_1EFBC();
  swift_arrayDestroy();
  if (!v4) {
    goto LABEL_24;
  }
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25760();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)(v14 + 16);
  }
  if (__OFSUB__(v16, v2))
  {
    __break(1u);
    goto LABEL_37;
  }
  uint64_t result = (uint64_t)sub_2454C((char *)(v14 + 32 + 8 * v2), v16 - v2, (char *)(v15 + 8));
  if (v12 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25760();
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v18 = *(void *)(v14 + 16);
LABEL_22:
  if (__OFADD__(v18, v4))
  {
    __break(1u);
    return result;
  }
  *(void *)(v14 + 16) = v18 + v4;
LABEL_24:
  *(void *)uint64_t v15 = v0;
  sub_1EDEC();
  return sub_25440();
}

uint64_t sub_1D474(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = a3;
    uint64_t v4 = a2;
    uint64_t v5 = a1;
    if (!(*v3 >> 62))
    {
      uint64_t v8 = *(void *)((char *)&dword_10 + (*v3 & 0xFFFFFFFFFFFFFF8));
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25760();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v8 < v4)
  {
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v8 = v4 - v5;
  if (__OFSUB__(v4, v5))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  unint64_t v6 = v7 >> 62;
  if (!(v7 >> 62))
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
    goto LABEL_8;
  }
LABEL_38:
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_25760();
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v10 = v9 - v8;
  if (__OFSUB__(v9, v8))
  {
    __break(1u);
  }
  else
  {
    uint64_t v23 = v9 - v8;
    if (!(*v3 >> 62))
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (*v3 & 0xFFFFFFFFFFFFFF8));
      goto LABEL_11;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25760();
  swift_bridgeObjectRelease();
  uint64_t v10 = v23;
LABEL_11:
  uint64_t v12 = v11 + v10;
  if (__OFADD__(v11, v10))
  {
    __break(1u);
    goto LABEL_42;
  }
  unint64_t v13 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v3 = v13;
  unint64_t v22 = v6;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v13 & 0x8000000000000000) != 0
    || (v13 & 0x4000000000000000) != 0
    || (uint64_t v15 = v13 & 0xFFFFFFFFFFFFFF8, v12 > *(void *)((char *)&dword_18 + (v13 & 0xFFFFFFFFFFFFFF8)) >> 1))
  {
    if (!(v13 >> 62))
    {
LABEL_17:
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_256C0();
      swift_bridgeObjectRelease();
      unint64_t *v3 = v13;
      uint64_t v15 = v13 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_18;
    }
LABEL_42:
    swift_bridgeObjectRetain();
    sub_25760();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v16 = v15 + 32 + 8 * v5;
  sub_DC98(0, &qword_315D0);
  uint64_t result = swift_arrayDestroy();
  if (!v23) {
    goto LABEL_26;
  }
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25760();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)(v15 + 16);
  }
  if (__OFSUB__(v18, v4))
  {
    __break(1u);
    goto LABEL_45;
  }
  uint64_t result = (uint64_t)sub_2454C((char *)(v15 + 32 + 8 * v4), v18 - v4, (char *)(v16 + 8 * v9));
  if (v13 >> 62)
  {
LABEL_45:
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_25760();
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  uint64_t v19 = *(void *)(v15 + 16);
LABEL_24:
  if (__OFADD__(v19, v23))
  {
    __break(1u);
    goto LABEL_47;
  }
  *(void *)(v15 + 16) = v19 + v23;
LABEL_26:
  if (v9 >= 1)
  {
    if (v22)
    {
      uint64_t v20 = swift_bridgeObjectRetain();
      uint64_t v21 = sub_1CAF0(v20, (void (*)(void *, uint64_t, uint64_t))&specialized _ArrayBuffer._copyContents(initializing:));
      swift_bridgeObjectRelease();
      sub_1D7E8((uint64_t)(v21 + 4), v21[2], v9);
      swift_release();
      goto LABEL_31;
    }
    if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)) == v9)
    {
      swift_arrayInitWithCopy();
      goto LABEL_31;
    }
LABEL_47:
    __break(1u);
    return result;
  }
LABEL_31:
  swift_bridgeObjectRelease();

  return sub_25440();
}

uint64_t sub_1D7E8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 == a3)
  {
    if (result)
    {
      sub_DC98(0, &qword_315D0);
      return swift_arrayInitWithCopy();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D860(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_1ED88(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1D8DC(v6);
  return sub_256F0();
}

uint64_t sub_1D8DC(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_25790(v3);
  if (result < v3)
  {
    uint64_t v5 = result;
    uint64_t result = sub_20EB0(v3 / 2);
    uint64_t v113 = v3;
    long long v114 = v6;
    uint64_t v116 = result;
    id v109 = a1;
    if (v3 <= 0) {
      goto LABEL_115;
    }
    uint64_t v110 = v5;
    Swift::Int v7 = 0;
    uint64_t v8 = *a1;
    uint64_t v108 = *a1 - 8;
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v115 = *a1;
    while (1)
    {
      Swift::Int v10 = v7++;
      Swift::Int v112 = v10;
      if (v7 < v3)
      {
        uint64_t v11 = *(void **)(v8 + 8 * v10);
        id v12 = *(id *)(v8 + 8 * v7);
        id v13 = v11;
        uint64_t result = sub_1E8B4(v12, (SEL *)&selRef_identifier);
        if (!v14) {
          goto LABEL_164;
        }
        uint64_t v15 = result;
        uint64_t v16 = v14;
        uint64_t result = sub_1E8B4(v13, (SEL *)&selRef_identifier);
        if (!v17)
        {
LABEL_165:
          __break(1u);
          return result;
        }
        if (v15 == result && v16 == v17) {
          int v19 = 0;
        }
        else {
          int v19 = sub_257C0();
        }

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        Swift::Int v7 = v10 + 2;
        Swift::Int v3 = v113;
        uint64_t v8 = v115;
        if (v10 + 2 < v113)
        {
          while (1)
          {
            uint64_t v20 = v8 + 8 * v10;
            uint64_t v21 = *(void **)(v20 + 8);
            id v22 = *(id *)(v20 + 16);
            id v23 = v21;
            uint64_t result = sub_1E8B4(v22, (SEL *)&selRef_identifier);
            if (!v24) {
              goto LABEL_160;
            }
            uint64_t v25 = result;
            uint64_t v26 = v24;
            uint64_t result = sub_1E8B4(v23, (SEL *)&selRef_identifier);
            if (!v27) {
              break;
            }
            if (v25 == result && v26 == v27)
            {

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              if (v19)
              {
                Swift::Int v7 = v10 + 2;
                Swift::Int v10 = v112;
                Swift::Int v3 = v113;
                uint64_t v8 = v115;
                goto LABEL_28;
              }
            }
            else
            {
              int v29 = sub_257C0();

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              if ((v19 ^ v29))
              {
                Swift::Int v7 = v10 + 2;
                Swift::Int v3 = v113;
                uint64_t v8 = v115;
                goto LABEL_25;
              }
            }
            uint64_t v30 = v10 + 3;
            ++v10;
            Swift::Int v3 = v113;
            uint64_t v8 = v115;
            if (v30 >= v113)
            {
              Swift::Int v7 = v113;
              goto LABEL_25;
            }
          }
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
          goto LABEL_165;
        }
LABEL_25:
        Swift::Int v10 = v112;
        if (v19)
        {
LABEL_28:
          if (v7 < v10) {
            goto LABEL_152;
          }
          if (v10 < v7)
          {
            uint64_t v31 = (uint64_t *)(v108 + 8 * v7);
            Swift::Int v32 = v7;
            Swift::Int v33 = v10;
            unint64_t v34 = (uint64_t *)(v8 + 8 * v10);
            do
            {
              if (v33 != --v32)
              {
                if (!v8) {
                  goto LABEL_162;
                }
                uint64_t v35 = *v34;
                *unint64_t v34 = *v31;
                *uint64_t v31 = v35;
              }
              ++v33;
              --v31;
              ++v34;
            }
            while (v33 < v32);
          }
        }
      }
      if (v7 < v3)
      {
        if (__OFSUB__(v7, v10)) {
          goto LABEL_150;
        }
        if (v7 - v10 < v110)
        {
          if (__OFADD__(v10, v110)) {
            goto LABEL_153;
          }
          if (v10 + v110 >= v3) {
            Swift::Int v36 = v3;
          }
          else {
            Swift::Int v36 = v10 + v110;
          }
          if (v36 < v10)
          {
LABEL_154:
            __break(1u);
            goto LABEL_155;
          }
          if (v7 != v36)
          {
            id v107 = v9;
            uint64_t v37 = v108 + 8 * v7;
            Swift::Int v111 = v36;
            while (1)
            {
              id v38 = *(void **)(v8 + 8 * v7);
              Swift::Int v39 = v10;
              uint64_t v40 = v37;
              while (1)
              {
                uint64_t v41 = *(void **)v40;
                id v42 = v38;
                id v43 = v41;
                uint64_t result = sub_1E8B4(v42, (SEL *)&selRef_identifier);
                if (!v44) {
                  goto LABEL_156;
                }
                uint64_t v45 = result;
                uint64_t v46 = v44;
                uint64_t result = sub_1E8B4(v43, (SEL *)&selRef_identifier);
                if (!v47)
                {
LABEL_157:
                  __break(1u);
LABEL_158:
                  __break(1u);
LABEL_159:
                  __break(1u);
LABEL_160:
                  __break(1u);
                  goto LABEL_161;
                }
                if (v45 == result && v46 == v47) {
                  break;
                }
                char v49 = sub_257C0();

                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease();
                if ((v49 & 1) == 0) {
                  goto LABEL_57;
                }
                uint64_t v8 = v115;
                if (!v115) {
                  goto LABEL_158;
                }
                uint64_t v50 = *(void **)v40;
                id v38 = *(void **)(v40 + 8);
                *(void *)uint64_t v40 = v38;
                *(void *)(v40 + 8) = v50;
                v40 -= 8;
                if (v7 == ++v39) {
                  goto LABEL_58;
                }
              }

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
LABEL_57:
              uint64_t v8 = v115;
LABEL_58:
              ++v7;
              v37 += 8;
              Swift::Int v10 = v112;
              if (v7 == v111)
              {
                Swift::Int v7 = v111;
                uint64_t v9 = v107;
                break;
              }
            }
          }
        }
      }
      if (v7 < v10) {
        goto LABEL_149;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1E5B0(0, *((void *)v9 + 2) + 1, 1, v9);
        uint64_t v9 = (char *)result;
      }
      unint64_t v52 = *((void *)v9 + 2);
      unint64_t v51 = *((void *)v9 + 3);
      unint64_t v53 = v52 + 1;
      uint64_t v8 = v115;
      if (v52 >= v51 >> 1)
      {
        uint64_t result = (uint64_t)sub_1E5B0((char *)(v51 > 1), v52 + 1, 1, v9);
        uint64_t v8 = v115;
        uint64_t v9 = (char *)result;
      }
      *((void *)v9 + 2) = v53;
      Swift::Int v3 = (Swift::Int)(v9 + 32);
      uint64_t v54 = &v9[16 * v52 + 32];
      *(void *)uint64_t v54 = v10;
      *((void *)v54 + 1) = v7;
      if (v52) {
        break;
      }
      unint64_t v53 = 1;
LABEL_108:
      Swift::Int v3 = v113;
      if (v7 >= v113) {
        goto LABEL_116;
      }
    }
    while (1)
    {
      unint64_t v55 = v53 - 1;
      if (v53 >= 4)
      {
        unint64_t v60 = v3 + 16 * v53;
        uint64_t v61 = *(void *)(v60 - 64);
        uint64_t v62 = *(void *)(v60 - 56);
        BOOL v66 = __OFSUB__(v62, v61);
        uint64_t v63 = v62 - v61;
        if (v66) {
          goto LABEL_134;
        }
        uint64_t v65 = *(void *)(v60 - 48);
        uint64_t v64 = *(void *)(v60 - 40);
        BOOL v66 = __OFSUB__(v64, v65);
        uint64_t v58 = v64 - v65;
        char v59 = v66;
        if (v66) {
          goto LABEL_135;
        }
        unint64_t v67 = v53 - 2;
        uint64_t v68 = (uint64_t *)(v3 + 16 * (v53 - 2));
        uint64_t v70 = *v68;
        uint64_t v69 = v68[1];
        BOOL v66 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v66) {
          goto LABEL_136;
        }
        BOOL v66 = __OFADD__(v58, v71);
        uint64_t v72 = v58 + v71;
        if (v66) {
          goto LABEL_138;
        }
        if (v72 >= v63)
        {
          uint64_t v90 = (uint64_t *)(v3 + 16 * v55);
          uint64_t v92 = *v90;
          uint64_t v91 = v90[1];
          BOOL v66 = __OFSUB__(v91, v92);
          uint64_t v93 = v91 - v92;
          if (v66) {
            goto LABEL_144;
          }
          BOOL v83 = v58 < v93;
          goto LABEL_97;
        }
      }
      else
      {
        if (v53 != 3)
        {
          uint64_t v84 = *((void *)v9 + 4);
          uint64_t v85 = *((void *)v9 + 5);
          BOOL v66 = __OFSUB__(v85, v84);
          uint64_t v77 = v85 - v84;
          char v78 = v66;
          goto LABEL_91;
        }
        uint64_t v57 = *((void *)v9 + 4);
        uint64_t v56 = *((void *)v9 + 5);
        BOOL v66 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        char v59 = v66;
      }
      if (v59) {
        goto LABEL_137;
      }
      unint64_t v67 = v53 - 2;
      id v73 = (uint64_t *)(v3 + 16 * (v53 - 2));
      uint64_t v75 = *v73;
      uint64_t v74 = v73[1];
      BOOL v76 = __OFSUB__(v74, v75);
      uint64_t v77 = v74 - v75;
      char v78 = v76;
      if (v76) {
        goto LABEL_139;
      }
      uint64_t v79 = (uint64_t *)(v3 + 16 * v55);
      uint64_t v81 = *v79;
      uint64_t v80 = v79[1];
      BOOL v66 = __OFSUB__(v80, v81);
      uint64_t v82 = v80 - v81;
      if (v66) {
        goto LABEL_141;
      }
      if (__OFADD__(v77, v82)) {
        goto LABEL_143;
      }
      if (v77 + v82 >= v58)
      {
        BOOL v83 = v58 < v82;
LABEL_97:
        if (v83) {
          unint64_t v55 = v67;
        }
        goto LABEL_99;
      }
LABEL_91:
      if (v78) {
        goto LABEL_140;
      }
      uint64_t v86 = (uint64_t *)(v3 + 16 * v55);
      uint64_t v88 = *v86;
      uint64_t v87 = v86[1];
      BOOL v66 = __OFSUB__(v87, v88);
      uint64_t v89 = v87 - v88;
      if (v66) {
        goto LABEL_142;
      }
      if (v89 < v77) {
        goto LABEL_108;
      }
LABEL_99:
      unint64_t v94 = v55 - 1;
      if (v55 - 1 >= v53)
      {
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
        goto LABEL_145;
      }
      if (!v8) {
        goto LABEL_159;
      }
      uint64_t v95 = v9;
      BOOL v96 = (uint64_t *)(v3 + 16 * v94);
      uint64_t v97 = *v96;
      char v98 = (void *)(v3 + 16 * v55);
      uint64_t v99 = v98[1];
      uint64_t result = sub_1E274((char *)(v8 + 8 * *v96), (char *)(v8 + 8 * *v98), v8 + 8 * v99, v114);
      if (v1)
      {
LABEL_113:
        uint64_t result = swift_bridgeObjectRelease();
        if (v113 >= -1) {
          goto LABEL_128;
        }
        __break(1u);
LABEL_115:
        uint64_t v9 = (char *)_swiftEmptyArrayStorage;
        unint64_t v53 = _swiftEmptyArrayStorage[2];
LABEL_116:
        if (v53 >= 2)
        {
          uint64_t v101 = *v109;
          while (1)
          {
            unint64_t v102 = v53 - 2;
            if (v53 < 2) {
              break;
            }
            if (!v101) {
              goto LABEL_163;
            }
            Swift::Int v3 = v53 - 1;
            uint64_t v103 = *(void *)&v9[16 * v102 + 32];
            uint64_t v104 = *(void *)&v9[16 * v53 + 24];
            uint64_t result = sub_1E274((char *)(v101 + 8 * v103), (char *)(v101 + 8 * *(void *)&v9[16 * v53 + 16]), v101 + 8 * v104, v114);
            if (v1) {
              goto LABEL_113;
            }
            if (v104 < v103) {
              goto LABEL_146;
            }
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)sub_1E6A8((uint64_t)v9);
              uint64_t v9 = (char *)result;
            }
            if (v102 >= *((void *)v9 + 2)) {
              goto LABEL_147;
            }
            unint64_t v105 = &v9[16 * v102 + 32];
            *(void *)unint64_t v105 = v103;
            *((void *)v105 + 1) = v104;
            unint64_t v106 = *((void *)v9 + 2);
            if (v53 > v106) {
              goto LABEL_148;
            }
            uint64_t result = (uint64_t)memmove(&v9[16 * v3 + 32], &v9[16 * v53 + 32], 16 * (v106 - v53));
            *((void *)v9 + 2) = v106 - 1;
            unint64_t v53 = v106 - 1;
            Swift::Int v3 = v113;
            if (v106 <= 2) {
              goto LABEL_127;
            }
          }
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
LABEL_127:
        uint64_t result = swift_bridgeObjectRelease();
        if (v3 >= -1)
        {
LABEL_128:
          *(void *)((char *)&dword_10 + (v116 & 0xFFFFFFFFFFFFFF8)) = 0;
          sub_25440();
          return swift_bridgeObjectRelease();
        }
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
        goto LABEL_157;
      }
      if (v99 < v97) {
        goto LABEL_131;
      }
      if (v55 > *((void *)v95 + 2)) {
        goto LABEL_132;
      }
      *BOOL v96 = v97;
      *(void *)(v3 + 16 * v94 + 8) = v99;
      unint64_t v100 = *((void *)v95 + 2);
      if (v55 >= v100) {
        goto LABEL_133;
      }
      uint64_t v9 = v95;
      unint64_t v53 = v100 - 1;
      uint64_t result = (uint64_t)memmove((void *)(v3 + 16 * v55), v98 + 2, 16 * (v100 - 1 - v55));
      *((void *)v9 + 2) = v100 - 1;
      uint64_t v8 = v115;
      if (v100 <= 2) {
        goto LABEL_108;
      }
    }
  }
  if (v3 < 0) {
    goto LABEL_151;
  }
  if (v3) {
    return sub_1E104(0, v3, 1, a1);
  }
  return result;
}

uint64_t sub_1E104(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v19 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v21 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      unint64_t v6 = *(void **)(v21 + 8 * v4);
      uint64_t v7 = v19;
      uint64_t v20 = v5;
      while (1)
      {
        uint64_t v8 = *(void **)v5;
        id v9 = v6;
        id v10 = v8;
        uint64_t result = sub_1E8B4(v9, (SEL *)&selRef_identifier);
        if (!v11)
        {
          __break(1u);
LABEL_18:
          __break(1u);
LABEL_19:
          __break(1u);
          return result;
        }
        uint64_t v12 = result;
        uint64_t v13 = v11;
        uint64_t result = sub_1E8B4(v10, (SEL *)&selRef_identifier);
        if (!v14) {
          goto LABEL_18;
        }
        if (v12 == result && v13 == v14) {
          break;
        }
        char v16 = sub_257C0();

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v16 & 1) == 0) {
          goto LABEL_15;
        }
        if (!v21) {
          goto LABEL_19;
        }
        uint64_t v17 = *(void **)v5;
        unint64_t v6 = *(void **)(v5 + 8);
        *(void *)uint64_t v5 = v6;
        *(void *)(v5 + 8) = v17;
        v5 -= 8;
        if (v4 == ++v7) {
          goto LABEL_15;
        }
      }

      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
LABEL_15:
      ++v4;
      uint64_t v5 = v20 + 8;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_1E274(char *a1, char *a2, unint64_t a3, char *a4)
{
  unint64_t v5 = a3;
  unint64_t v6 = (id *)a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 < v11)
  {
    sub_2454C(a1, (a2 - a1) / 8, a4);
    uint64_t v12 = &a4[8 * v9];
    BOOL v13 = (unint64_t)v6 >= v5 || v8 < 8;
    uint64_t v14 = a4;
    if (!v13)
    {
      uint64_t v47 = &a4[8 * v9];
      while (1)
      {
        unint64_t v17 = v5;
        uint64_t v18 = v6;
        uint64_t v19 = *(void **)v14;
        id v20 = *v6;
        id v21 = v19;
        uint64_t result = sub_1E8B4(v20, (SEL *)&selRef_identifier);
        if (!v23)
        {
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        uint64_t v24 = result;
        uint64_t v25 = v23;
        uint64_t result = sub_1E8B4(v21, (SEL *)&selRef_identifier);
        if (!v26) {
          goto LABEL_58;
        }
        BOOL v27 = v24 == result && v25 == v26;
        if (v27)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v28 = sub_257C0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v28)
          {
            int v29 = (char *)v18;
            unint64_t v6 = v18 + 1;
            unint64_t v5 = v17;
            if (v7 == (char *)v18) {
              goto LABEL_26;
            }
LABEL_25:
            *(void *)uint64_t v7 = *(void *)v29;
            goto LABEL_26;
          }
        }
        int v29 = v14;
        BOOL v27 = v7 == v14;
        v14 += 8;
        unint64_t v5 = v17;
        unint64_t v6 = v18;
        if (!v27) {
          goto LABEL_25;
        }
LABEL_26:
        v7 += 8;
        uint64_t v12 = v47;
        if (v14 >= v47 || (unint64_t)v6 >= v5)
        {
          uint64_t v15 = v7;
          goto LABEL_56;
        }
      }
    }
    uint64_t v15 = v7;
LABEL_56:
    sub_2454C(v14, (v12 - v14) / 8, v15);
    return 1;
  }
  sub_2454C(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
  uint64_t v44 = a4;
  uint64_t v12 = &a4[8 * v11];
  if (v7 >= (char *)v6 || v10 < 8)
  {
    uint64_t v14 = a4;
    uint64_t v15 = (char *)v6;
    goto LABEL_56;
  }
  uint64_t v31 = (char *)(v5 - 8);
  uint64_t v15 = (char *)v6;
  while (1)
  {
    unint64_t v48 = (unint64_t)v12;
    Swift::Int v32 = v12 - 8;
    uint64_t v46 = v15;
    Swift::Int v33 = (void *)*((void *)v15 - 1);
    v15 -= 8;
    id v34 = *((id *)v12 - 1);
    id v35 = v33;
    uint64_t result = sub_1E8B4(v34, (SEL *)&selRef_identifier);
    if (!v36) {
      goto LABEL_59;
    }
    uint64_t v37 = result;
    uint64_t v38 = v36;
    uint64_t result = sub_1E8B4(v35, (SEL *)&selRef_identifier);
    if (!v39) {
      break;
    }
    uint64_t v45 = v31 + 8;
    if (v37 == result && v38 == v39)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_44:
      uint64_t v15 = v46;
      BOOL v42 = v45 != (char *)v48 || (unint64_t)v31 >= v48;
      uint64_t v12 = v32;
      goto LABEL_48;
    }
    char v41 = sub_257C0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0) {
      goto LABEL_44;
    }
    BOOL v42 = v45 != v46 || v31 >= v46;
    Swift::Int v32 = v15;
    uint64_t v12 = (char *)v48;
LABEL_48:
    if (v42) {
      *(void *)uint64_t v31 = *(void *)v32;
    }
    v31 -= 8;
    if (v15 <= v7 || v12 <= v44)
    {
      uint64_t v14 = v44;
      goto LABEL_56;
    }
  }
LABEL_60:
  __break(1u);
  return result;
}

char *sub_1E5B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BA78(&qword_31940);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1E6A8(uint64_t a1)
{
  return sub_1E5B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

id sub_1E6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  NSString v15 = sub_25390();
  id v16 = [a9 preferenceSpecifierNamed:v15 target:a3 set:a4 get:a5 detail:a6 cell:a7 edit:a8];

  return v16;
}

uint64_t sub_1E75C(void *a1)
{
  return sub_1E8B4(a1, (SEL *)&selRef_identifier);
}

id sub_1E768(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25390();
  sub_1EF38();
  id v5 = [a3 propertyForKey:v3];

  return v5;
}

void sub_1E7C4(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_25390();
  swift_bridgeObjectRelease();
  [a3 setTitle:v4];
}

uint64_t sub_1E828(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_25390();
  swift_bridgeObjectRelease();
  id v5 = [a3 dialectForLanguageIdentifier:v4];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = sub_253A0();

  return v6;
}

uint64_t sub_1E8B4(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  Swift::Int v3 = v2;
  uint64_t v4 = sub_253A0();

  return v4;
}

uint64_t sub_1E914(void *a1)
{
  id v2 = [a1 name];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_253A0();

  return v3;
}

id sub_1E984(uint64_t a1, void *a2)
{
  Class isa = sub_25410().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [a2 removeSpecifiers:isa];

  return v4;
}

id sub_1E9EC(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = sub_25410().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [a3 insertContiguousSpecifiers:isa afterSpecifier:a2];

  return v6;
}

uint64_t sub_1EA5C(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = a3 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    sub_25760();
    uint64_t result = sub_1EEE4();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_25760();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1ED44(&qword_31938, &qword_31578);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_BA78(&qword_31578);
            uint64_t v10 = sub_217A8(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_19;
      }
    }
    else
    {
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) <= a2)
      {
        sub_21040((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1EC04()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1EC3C(unint64_t a1)
{
  return sub_18F54(a1, *(char **)(v1 + 16));
}

void sub_1EC44()
{
  sub_19A78(*(char **)(v0 + 16));
}

uint64_t sub_1EC4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1EC5C()
{
  return swift_release();
}

uint64_t sub_1EC64(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1ECAC()
{
  unint64_t result = qword_31918;
  if (!qword_31918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31918);
  }
  return result;
}

unint64_t sub_1ECF8()
{
  unint64_t result = qword_31920;
  if (!qword_31920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31920);
  }
  return result;
}

uint64_t sub_1ED44(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_C2B4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1ED88(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_1ED9C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1EDDC(uint64_t a1)
{
  return sub_15B4C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1EE04()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1EE3C()
{
  void *v0 = 0x8000000000000000;
  return v1;
}

uint64_t sub_1EE60(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease();
}

void sub_1EE70(uint64_t a1, uint64_t a2)
{
  sub_21444(v3, a1, a2, v2);
}

void sub_1EE98(uint64_t a1, uint64_t a2)
{
  sub_21444(v3, a1, a2, v2);
}

void sub_1EEC0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t sub_1EEE4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1EF38()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1EF50()
{
  return swift_beginAccess();
}

uint64_t sub_1EF68()
{
  return v0;
}

uint64_t sub_1EF7C(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t sub_1EF90()
{
  return swift_dynamicCast();
}

uint64_t sub_1EFB0()
{
  return v0;
}

uint64_t sub_1EFBC()
{
  return v0;
}

void sub_1EFC8(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

__n128 sub_1EFE0()
{
  __n128 result = *(__n128 *)(v1 - 192);
  _DWORD *v0 = result.n128_u32[0];
  return result;
}

uint64_t sub_1EFF4()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_1F014()
{
  return v0;
}

uint64_t sub_1F020()
{
  return v0;
}

uint64_t sub_1F034(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t sub_1F05C()
{
  return v0;
}

uint64_t sub_1F068()
{
  return v0;
}

void sub_1F074()
{
}

void *sub_1F08C(uint64_t a1)
{
  unint64_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25700();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_14D38(i, (uint64_t)v5);
    sub_DC98(0, &qword_315D0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_256E0();
    sub_25710();
    sub_25720();
    sub_256F0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

char *sub_1F1A8(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1EE04();
    uint64_t v2 = sub_25760();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v10 = &_swiftEmptyArrayStorage;
  __n128 result = sub_2123C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        sub_256B0();
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      sub_DC98(0, &qword_315D0);
      swift_dynamicCast();
      uint64_t v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2123C(0, v3[2] + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_2123C((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v10;
      }
      v3[2] = v8 + 1;
      sub_218E0(&v9, &v3[4 * v8 + 4]);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

void sub_1F33C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_21;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_256B0();
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      uint64_t v5 = v4;
      sub_DC98(0, &qword_315D0);
      char v6 = sub_255A0();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v8 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v8 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v9 = (id)sub_256B0();
          }
          else
          {
            if ((v8 & 0x8000000000000000) != 0) {
              goto LABEL_19;
            }
            if (v8 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
              goto LABEL_20;
            }
            id v9 = *(id *)(a2 + 32 + 8 * v8);
          }
          uint64_t v10 = v9;
          char v11 = sub_255A0();

          if (v11) {
            return;
          }
        }
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        sub_1EE04();
        uint64_t v3 = sub_25760();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_1F4C8(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfGroup);
}

uint64_t sub_1F4D4(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfSpecifier);
}

uint64_t sub_1F4E0(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_destinationSpecifierGroup);
}

uint64_t sub_1F4EC(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_headPhonesSpecifier);
}

uint64_t sub_1F4F8(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_carPlaySpecifier);
}

void sub_1F504()
{
  uint64_t v1 = v0;
  NSString v2 = sub_E4B4();
  id v3 = [v0 valueForKey:v2];

  if (v3)
  {
    sub_25620();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v39, 0, sizeof(v39));
  }
  sub_C18C((uint64_t)v39, (uint64_t)v40);
  if (v40[3])
  {
    sub_BA78(&qword_31578);
    if (sub_21928())
    {
      if (qword_31488 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_25310();
      uint64_t v5 = (void *)sub_E4E0(v4, (uint64_t)qword_31D88);
      os_log_type_t v6 = sub_25560();
      if (sub_E644(v6))
      {
        *(_WORD *)sub_E49C() = 0;
        sub_E5F0(&dword_0, v7, v8, "#MessagesAutoConfirmSettingsController returning already initialized specifiers");
        sub_E414();
      }

      sub_1F1A8(v38);
LABEL_31:
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    sub_14C98((uint64_t)v40);
  }
  uint64_t v9 = 0xD000000000000023;
  v40[0] = _swiftEmptyArrayStorage;
  unsigned __int8 v10 = sub_4794();
  char v11 = self;
  id v12 = sub_21744(0xD000000000000023, 0x80000000000269E0, v11);
  sub_1F4C8((uint64_t)v12);
  uint64_t v13 = OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfGroup;
  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfGroup];
  if (!v14)
  {
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v10) {
    NSString v15 = (void *)0x8000000000026960;
  }
  else {
    NSString v15 = (void *)0x8000000000026930;
  }
  if ((v10 & 1) == 0) {
    uint64_t v9 = 0xD000000000000027;
  }
  id v16 = v14;
  sub_20AE4(v9, v15);
  swift_bridgeObjectRelease();
  NSString v17 = sub_25390();
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_253A0();
  sub_E6C8(v18, v19);

  id v20 = *(void **)&v1[v13];
  if (!v20) {
    goto LABEL_33;
  }
  id v21 = v20;
  sub_25400();
  if (*(void *)((char *)&dword_10 + (v40[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                    + (v40[0] & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_21948();
  sub_25480();
  sub_25440();
  uint64_t v22 = sub_20AE4(0xD000000000000023, (void *)0x80000000000269E0);
  id v24 = sub_21554(v22, v23, (uint64_t)v1, (uint64_t)"setMessageWithoutConfEnabled:specifier:", (uint64_t)"getMessageWithoutConfEnabledWithSpecifier:", 0, 6, 0, v11);
  sub_1F4D4((uint64_t)v24);
  uint64_t v25 = OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfSpecifier;
  uint64_t v26 = *(void **)&v1[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfSpecifier];
  if (!v26) {
    goto LABEL_34;
  }
  id v27 = v26;
  Class isa = sub_25490().super.super.isa;
  uint64_t v29 = sub_253A0();
  sub_21444((uint64_t)isa, v29, v30, v27);

  uint64_t v31 = *(void **)&v1[v25];
  if (v31)
  {
    id v32 = v31;
    sub_25400();
    if (*(void *)((char *)&dword_10 + (v40[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                      + (v40[0] & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_21948();
    sub_25480();
    sub_25440();
    unint64_t v33 = v40[0];
    unint64_t v34 = swift_bridgeObjectRetain();
    sub_1FF94(v34, v10 & 1, 0);
    sub_E930();
    if (v1)
    {
      uint64_t v35 = sub_216E8(v1);
      if (v35)
      {
        uint64_t v36 = sub_1F08C(v35);
        swift_bridgeObjectRelease();

        if (v36)
        {
          swift_bridgeObjectRelease();
          unint64_t v33 = (unint64_t)v36;
        }
      }
      else
      {
      }
    }
    unint64_t v37 = swift_bridgeObjectRetain();
    sub_1F1A8(v37);
    sub_E930();
    sub_21678((uint64_t)v1, v1);
    sub_1F1A8(v33);
    goto LABEL_31;
  }
LABEL_35:
  __break(1u);
}

void sub_1F9A8()
{
  LOBYTE(v4) = 2;
  sub_254A0();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25310();
  oslog = sub_E4E0(v0, (uint64_t)qword_31D88);
  os_log_type_t v1 = sub_25550();
  if (os_log_type_enabled(oslog, v1))
  {
    NSString v2 = (uint8_t *)sub_E49C();
    *(_WORD *)NSString v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "#MessagesAutoConfirmSettingsController error setting auto send enable setting", v2, 2u);
    sub_E414();
  }
}

NSNumber sub_1FE1C()
{
  unsigned __int8 v1 = sub_4794();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  id v3 = sub_E4E0(v2, (uint64_t)qword_31D88);
  os_log_type_t v4 = sub_25560();
  if (sub_E644(v4))
  {
    uint64_t v5 = (uint8_t *)sub_E660();
    *(_DWORD *)uint64_t v5 = 67109120;
    sub_255F0();
    _os_log_impl(&dword_0, v3, v0, "#MessagesAutoConfirmSettingsController fetching autosend setting = %{BOOL}d", v5, 8u);
    sub_E414();
  }

  sub_DC98(0, &qword_315E8);
  return sub_25590(v1 & 1);
}

void sub_1FF94(unint64_t a1, char a2, char a3)
{
  uint64_t v7 = sub_1F1A8(a1);
  id v8 = objc_allocWithZone((Class)PSSpecifierUpdates);
  id v9 = sub_20E40((uint64_t)v7);
  if (!v9)
  {
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_25310();
    unint64_t v34 = (void *)sub_E4E0(v33, (uint64_t)qword_31D88);
    os_log_type_t v35 = sub_25550();
    if (sub_E644(v35))
    {
      *(_WORD *)sub_E49C() = 0;
      sub_E5F0(&dword_0, v36, v37, "#MessagesAutoConfirmSettingsController error updating child settings for autosend");
      sub_E414();
    }
    goto LABEL_39;
  }
  if ((a2 & 1) == 0)
  {
    unint64_t v38 = *(void **)(v3
                   + OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_destinationSpecifierGroup);
    if (v38)
    {
      id v39 = v38;
      sub_1F33C((uint64_t)v39, a1);
      if ((v41 & 1) == 0)
      {
        uint64_t v42 = v40;
        if (qword_31488 != -1) {
          swift_once();
        }
        uint64_t v43 = sub_25310();
        uint64_t v44 = sub_E4E0(v43, (uint64_t)qword_31D88);
        os_log_type_t v45 = sub_25560();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)sub_E49C();
          *(_WORD *)uint64_t v46 = 0;
          _os_log_impl(&dword_0, v44, v45, "#MessagesAutoConfirmSettingsController removing child settings since autosend setting is disabled", v46, 2u);
          sub_E414();
        }

        if (a1 >> 62)
        {
          if ((a1 & 0x8000000000000000) != 0) {
            uint64_t v47 = a1;
          }
          else {
            uint64_t v47 = a1 & 0xFFFFFFFFFFFFFF8;
          }
          swift_bridgeObjectRetain();
          sub_25760();
          sub_E930();
        }
        else
        {
          uint64_t v47 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
        }
        if (__OFSUB__(v47, v42))
        {
          __break(1u);
LABEL_46:
          __break(1u);
          goto LABEL_47;
        }
        objc_msgSend(v9, "removeSpecifiersInRange:", v42, v47 - v42);
      }
    }
LABEL_37:
    id v50 = [v9 context];
    if (v50)
    {
      unint64_t v34 = v50;
      [v50 setAnimated:a3 & 1];
LABEL_39:

      return;
    }
    goto LABEL_46;
  }
  unsigned __int8 v10 = self;
  uint64_t v11 = sub_20AE4(0xD000000000000030, (void *)0x8000000000026890);
  id v13 = sub_214C0(0xD000000000000033, 0x8000000000026850, v11, v12, v10);
  sub_1F4E0((uint64_t)v13);
  uint64_t v14 = *(void **)(v3
                 + OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_destinationSpecifierGroup);
  if (v14)
  {
    id v15 = v14;
    sub_25400();
    sub_E948();
    if (v16) {
      sub_E59C();
    }
    sub_25480();
    sub_25440();
    uint64_t v17 = sub_20AE4(0xD000000000000027, (void *)0x80000000000268D0);
    id v20 = sub_21904(v17, v18, v19, (uint64_t)"setMessageWithoutConfHeadphonesEnabled:specifier:", (uint64_t)"getMessageWithoutConfHeadphonesEnabledWithSpecifier:");
    sub_1F4EC((uint64_t)v20);
    id v21 = *(void **)(v3
                   + OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_headPhonesSpecifier);
    if (!v21) {
      goto LABEL_48;
    }
    id v22 = v21;
    sub_25400();
    sub_E948();
    if (v16) {
      sub_E59C();
    }
    sub_25480();
    sub_25440();
    uint64_t v23 = sub_20AE4(0xD000000000000024, (void *)0x8000000000026900);
    id v26 = sub_21904(v23, v24, v25, (uint64_t)"setMessageWithoutConfCarPlayEnabled:specifier:", (uint64_t)"getMessageWithoutConfCarPlayEnabledWithSpecifier:");
    sub_1F4F8((uint64_t)v26);
    id v27 = *(void **)(v3 + OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_carPlaySpecifier);
    if (!v27) {
      goto LABEL_49;
    }
    id v28 = v27;
    sub_25400();
    if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
      sub_E59C();
    }
    sub_25480();
    sub_25440();
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_25310();
    sub_C2FC(v29, (uint64_t)qword_31D88);
    swift_bridgeObjectRetain_n();
    uint64_t v30 = sub_25300();
    os_log_type_t v31 = sub_25560();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v32 = 134217984;
      if ((unint64_t)_swiftEmptyArrayStorage >> 62)
      {
        swift_bridgeObjectRetain();
        sub_25760();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_255F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v30, v31, "#MessagesAutoConfirmSettingsController adding %ld child settings since autosend setting is enabled", v32, 0xCu);
      sub_E414();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    unint64_t v48 = sub_1F1A8((unint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_25760();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v49 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    }
    sub_21608((uint64_t)v48, v49, v9);
    goto LABEL_37;
  }
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
}

void sub_20578(uint64_t a1, uint64_t a2)
{
}

NSNumber sub_20604(uint64_t a1)
{
  return sub_20934(a1, (SEL *)&selRef_getMessageWithoutConfirmationHeadphonesEnabled, "#MessagesAutoConfirmSettingsController fetching headphones setting = %{BOOL}d");
}

void sub_20674(uint64_t a1, uint64_t a2)
{
}

void sub_20690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  sub_254A0();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25310();
  oslog = sub_E4E0(v6, (uint64_t)qword_31D88);
  os_log_type_t v7 = sub_25550();
  if (os_log_type_enabled(oslog, v7))
  {
    id v8 = (uint8_t *)sub_E49C();
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, oslog, v7, a5, v8, 2u);
    sub_E414();
  }
}

NSNumber sub_20920(uint64_t a1)
{
  return sub_20934(a1, (SEL *)&selRef_getMessageWithoutConfirmationInCarPlayEnabled, "#MessagesAutoConfirmSettingsController fetching carplay setting = %{BOOL}d");
}

NSNumber sub_20934(uint64_t a1, SEL *a2, const char *a3)
{
  id v5 = [self sharedPreferences];
  unsigned __int8 v6 = [v5 *a2];

  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25310();
  id v8 = sub_E4E0(v7, (uint64_t)qword_31D88);
  os_log_type_t v9 = sub_25560();
  if (os_log_type_enabled(v8, v9))
  {
    unsigned __int8 v10 = (uint8_t *)sub_E660();
    *(_DWORD *)unsigned __int8 v10 = 67109120;
    sub_255F0();
    _os_log_impl(&dword_0, v8, v9, a3, v10, 8u);
    sub_E414();
  }

  sub_DC98(0, &qword_315E8);
  return sub_25590(v6);
}

uint64_t sub_20AE4(uint64_t a1, void *a2)
{
  type metadata accessor for MessagesAutoConfirmSettingsController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v9._countAndFlagsBits = 0xE000000000000000;
  v11.value._object = (void *)0x8000000000026410;
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  v11.value._countAndFlagsBits = 0xD000000000000014;
  v6.super.Class isa = v5;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  uint64_t v7 = sub_25110(v10, v11, v6, v12, v9);

  return v7;
}

id sub_20B9C(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfGroup] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfSpecifier] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_destinationSpecifierGroup] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_headPhonesSpecifier] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_carPlaySpecifier] = 0;
  if (a2)
  {
    NSString v5 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for MessagesAutoConfirmSettingsController();
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

id sub_20CB8(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfGroup] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_messageWithoutConfSpecifier] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_destinationSpecifierGroup] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_headPhonesSpecifier] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_carPlaySpecifier] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MessagesAutoConfirmSettingsController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_20D6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesAutoConfirmSettingsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MessagesAutoConfirmSettingsController()
{
  return self;
}

id sub_20E40(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_25410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [v1 initWithSpecifiers:v2.super.isa];

  return v3;
}

uint64_t sub_20EB0(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_218F0();
    uint64_t result = sub_25740();
    __break(1u);
  }
  else if (a1)
  {
    sub_DC98(0, &qword_315D0);
    uint64_t result = sub_25470();
    *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)) = a1;
  }
  else
  {
    return (uint64_t)&_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_20F5C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (BOOL v3 = a1 + 32 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25770();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21040(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    sub_218F0();
    uint64_t result = sub_25770();
    __break(1u);
  }
  else
  {
    sub_DC98(0, &qword_315D0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21134(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25770();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

unint64_t sub_21218(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

char *sub_2123C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2127C(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_2125C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_21360(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_2127C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BA78(&qword_319A8);
    Swift::String v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    Swift::String v10 = (char *)&_swiftEmptyArrayStorage;
  }
  Swift::String v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_244F4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_20F5C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_21360(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BA78(&qword_319B0);
    Swift::String v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    Swift::String v10 = (char *)_swiftEmptyArrayStorage;
  }
  Swift::String v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_245A4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21134((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_21444(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = sub_25390();
  swift_bridgeObjectRelease();
  [a4 setProperty:a1 forKey:v6];
}

id sub_214C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSString v6 = sub_25390();
  swift_bridgeObjectRelease();
  NSString v7 = sub_25390();
  swift_bridgeObjectRelease();
  id v8 = [a5 groupSpecifierWithID:v6 name:v7];

  return v8;
}

id sub_21554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  NSString v15 = sub_25390();
  swift_bridgeObjectRelease();
  id v16 = [a9 preferenceSpecifierNamed:v15 target:a3 set:a4 get:a5 detail:a6 cell:a7 edit:a8];

  return v16;
}

id sub_21608(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = sub_25410().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [a3 insertContiguousSpecifiers:isa atIndex:a2];

  return v6;
}

void sub_21678(uint64_t a1, void *a2)
{
  Class isa = sub_25410().super.isa;
  swift_bridgeObjectRelease();
  [a2 setSpecifiers:isa];
}

uint64_t sub_216E8(void *a1)
{
  id v1 = [a1 currentSpecifiers];
  if (!v1) {
    return 0;
  }
  NSArray v2 = v1;
  uint64_t v3 = sub_25420();

  return v3;
}

id sub_21744(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_25390();
  swift_bridgeObjectRelease();
  id v5 = [a3 groupSpecifierWithID:v4];

  return v5;
}

void (*sub_217A8(void *a1, unint64_t a2, uint64_t a3))(void *a1)
{
  id v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_21858(v6, a2, a3);
  return sub_21810;
}

void sub_21810(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_21858(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_21218(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)sub_256B0();
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_218D8;
}

void sub_218D8(id *a1)
{
}

_OWORD *sub_218E0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_21904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21554(a1, a2, v5, a4, a5, 0, 6, 0, v6);
}

uint64_t sub_21928()
{
  return swift_dynamicCast();
}

uint64_t sub_21948()
{
  return sub_25450();
}

uint64_t sub_21968(int a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_24690(a1), (v4 & 1) != 0)) {
    return *(unsigned __int8 *)(*(void *)(a2 + 56) + v3);
  }
  else {
    return 8;
  }
}

double sub_219A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_246D8(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_14D38(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_21A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_2471C(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_21A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_2471C(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_21AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_2471C(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

uint64_t sub_21AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_2471C(a1, a2), (v5 & 1) != 0)) {
    return *(void *)(*(void *)(a3 + 56) + 8 * v4);
  }
  else {
    return 0;
  }
}

uint64_t sub_21B3C(uint64_t a1, uint64_t a2)
{
  char v5 = *(void **)(v2 + 24);
  [v5 lock];
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21AF4(a1, a2, v6);
  swift_bridgeObjectRelease();
  [v5 unlock];
  return v7;
}

uint64_t sub_21BE0(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_spinner);
}

uint64_t sub_21BEC(uint64_t a1)
{
  return sub_E42C(a1, OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress);
}

uint64_t sub_21BF8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_textConstraints) = a1;
  return swift_bridgeObjectRelease();
}

void sub_21C10()
{
  qword_319B8 = 0x4044000000000000;
}

void sub_21C20()
{
  qword_319C0 = 0x4044000000000000;
}

void sub_21C30()
{
  qword_319C8 = 0x402E000000000000;
}

void sub_21C40()
{
  qword_319D0 = 0x4039000000000000;
}

char *sub_21C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_25330();
  sub_E438();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_24D3C();
  sub_E438();
  uint64_t v32 = v13;
  uint64_t v33 = v12;
  __chkstk_darwin(v12);
  sub_24D94();
  *(void *)&v4[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_spinner] = 0;
  sub_24D7C(OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress);
  *(void *)&v4[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_textConstraints] = 0;
  if (a3)
  {
    NSString v14 = sub_25390();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  v35.receiver = v4;
  v35.super_class = (Class)type metadata accessor for LanguageCell();
  id v15 = objc_msgSendSuper2(&v35, "initWithStyle:reuseIdentifier:", 0, v14);

  uint64_t v16 = qword_31488;
  id v17 = v15;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25310();
  sub_C2FC(v18, (uint64_t)qword_31D88);
  uint64_t v19 = (char *)v17;
  id v20 = sub_25300();
  os_log_type_t v21 = sub_25560();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v31 = v10;
    id v22 = (uint8_t *)sub_E46C();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v22 = 136315138;
    uint64_t v23 = (uint64_t *)&v19[*(void *)(v3 + 2536)];
    if (v23[1])
    {
      uint64_t v24 = *v23;
      unint64_t v25 = v23[1];
    }
    else
    {
      uint64_t v24 = 0;
      unint64_t v25 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_14464(v24, v25, aBlock);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v20, v21, "#LanguageCell initializer no specificer %s", v22, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();

    uint64_t v10 = v31;
  }
  else
  {
  }
  if ([self isMainThread])
  {
    sub_2289C(0, 1);
  }
  else
  {
    sub_DC98(0, &qword_31580);
    id v26 = (void *)sub_25570();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v19;
    aBlock[4] = (uint64_t)sub_24C54;
    aBlock[5] = v27;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_7228;
    void aBlock[3] = (uint64_t)&unk_2D130;
    id v28 = _Block_copy(aBlock);
    uint64_t v29 = v19;
    swift_release();
    sub_25340();
    aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_24ADC();
    sub_BA78(&qword_31590);
    sub_C260();
    sub_25630();
    sub_25580();

    _Block_release(v28);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v5, v8);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v6, v33);
  }
  return v19;
}

uint64_t sub_2208C()
{
  return sub_2289C(0, 1);
}

void sub_220FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_25330();
  sub_E438();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_E610();
  uint64_t v54 = v12;
  uint64_t v55 = sub_25350();
  sub_E438();
  uint64_t v53 = v13;
  __chkstk_darwin(v14);
  sub_E610();
  uint64_t v52 = v15;
  *(void *)&v5[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_spinner] = 0;
  sub_24D7C(OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress);
  *(void *)&v5[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_textConstraints] = 0;
  NSString v16 = sub_25390();
  swift_bridgeObjectRelease();
  v57.receiver = v5;
  v57.super_class = (Class)type metadata accessor for LanguageCell();
  id v17 = objc_msgSendSuper2(&v57, "initWithStyle:reuseIdentifier:specifier:", a1, v16, a4);

  if (!v17)
  {
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
  uint64_t v18 = qword_31458;
  uint64_t v19 = (char *)v17;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v51 = v10;
  uint64_t v20 = sub_24B74(a4);
  if (!v21) {
    goto LABEL_25;
  }
  uint64_t v22 = v20;
  uint64_t v23 = v21;
  swift_beginAccess();
  uint64_t v24 = sub_21A0C(v22, v23, static MessagesSettingsUtils.readableLanguageToLocaleMap);
  uint64_t v26 = v25;
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v27 = (uint64_t *)&v19[*(void *)(v4 + 2536)];
  *uint64_t v27 = v24;
  v27[1] = v26;
  swift_bridgeObjectRelease();
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v50 = v8;
  uint64_t v28 = sub_25310();
  uint64_t v29 = sub_C2FC(v28, (uint64_t)qword_31D88);
  uint64_t v30 = v19;
  uint64_t v31 = sub_25300();
  os_log_type_t v32 = sub_25560();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v49 = v29;
    uint64_t v33 = (uint8_t *)sub_E46C();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315138;
    if (v27[1])
    {
      uint64_t v34 = *v27;
      unint64_t v35 = v27[1];
    }
    else
    {
      uint64_t v34 = 0;
      unint64_t v35 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    aBlock[9] = sub_14464(v34, v35, aBlock);
    sub_255F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v31, v32, "#LanguageCell initializer with specificer %s", v33, 0xCu);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {
  }
  objc_msgSend(v30, "setCellEnabled:", 1, v49);
  uint64_t v36 = v27[1];
  if (!v36) {
    goto LABEL_19;
  }
  uint64_t v37 = *v27;
  uint64_t v38 = qword_31440;
  swift_bridgeObjectRetain();
  if (v38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_beginAccess();
  swift_retain();
  uint64_t v39 = sub_21B3C(v37, v36);
  char v41 = v40;
  swift_bridgeObjectRelease();
  swift_release();
  if (v41)
  {
    uint64_t v42 = sub_25300();
    os_log_type_t v43 = sub_25560();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)sub_E49C();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_0, v42, v43, "LanguageCell download percentage nil", v44, 2u);
      sub_E414();
    }
  }
  else
  {
    if ([self isMainThread])
    {
      sub_2289C(v39, 0);
LABEL_19:

      return;
    }
    sub_DC98(0, &qword_31580);
    os_log_type_t v45 = (void *)sub_25570();
    uint64_t v46 = swift_allocObject();
    *(void *)(v46 + 16) = v30;
    *(void *)(v46 + 24) = v39;
    *(unsigned char *)(v46 + 32) = 0;
    aBlock[4] = (uint64_t)sub_24C10;
    aBlock[5] = v46;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_7228;
    void aBlock[3] = (uint64_t)&unk_2D0E0;
    uint64_t v47 = _Block_copy(aBlock);
    unint64_t v48 = v30;
    swift_release();
    sub_25340();
    aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_24ADC();
    sub_BA78(&qword_31590);
    sub_C260();
    sub_25630();
    sub_25580();

    _Block_release(v47);
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v54, v50);
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v55);
  }
}

uint64_t sub_22758(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2289C(a2, a3 & 1);
}

void sub_227EC()
{
  *(void *)&v0[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_spinner] = 0;
  *(void *)&v0[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_localeCode];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_textConstraints] = 0;

  sub_25750();
  __break(1u);
}

uint64_t sub_2289C(uint64_t a1, char a2)
{
  if (qword_31440 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = static MessagesSettingsUtils.ttsDownloader;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(void *)(v6 + 24) = v5;
  swift_beginAccess();
  swift_retain_n();
  v2;
  sub_24260();
  uint64_t v7 = *(char **)(*(void *)(v5 + 24) + 16);
  sub_242AC(v7);
  uint64_t v8 = *(void *)(v5 + 24);
  *(void *)(v8 + 16) = v7 + 1;
  uint64_t v9 = v8 + 16 * (void)v7;
  *(void *)(v9 + 32) = sub_24B6C;
  *(void *)(v9 + 40) = v6;
  swift_endAccess();
  sub_23954(a1, a2 & 1);
  return swift_release();
}

void sub_229D8(void *a1)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25310();
  sub_C2FC(v2, (uint64_t)qword_31D88);
  uint64_t v3 = a1;
  uint64_t v4 = sub_25300();
  os_log_type_t v5 = sub_25560();
  uint64_t v6 = &unk_31000;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v8 = *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_localeCode + 8];
    uint64_t v17 = *(void *)&v3[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_localeCode];
    uint64_t v18 = v8;
    swift_bridgeObjectRetain();
    sub_BA78(&qword_31888);
    uint64_t v9 = sub_253C0();
    uint64_t v17 = sub_14464(v9, v10, &v16);
    sub_255F0();

    uint64_t v6 = (void *)&unk_31000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v4, v5, "#LanguageCell onChangeActions %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = (uint64_t *)&v3[v6[317]];
  uint64_t v12 = v11[1];
  if (v12)
  {
    uint64_t v13 = *v11;
    swift_beginAccess();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_21B3C(v13, v12);
    LOBYTE(v13) = v15;
    swift_bridgeObjectRelease();
    swift_release();
    if ((v13 & 1) == 0) {
      sub_22C28(v14);
    }
  }
}

uint64_t sub_22C28(uint64_t a1)
{
  uint64_t v5 = sub_25330();
  sub_E438();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v9 = sub_24D3C();
  sub_E438();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_24D94();
  sub_DC98(0, &qword_31580);
  uint64_t v13 = (void *)sub_25570();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = v1;
  aBlock[4] = sub_24ABC;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_7228;
  void aBlock[3] = &unk_2D068;
  char v15 = _Block_copy(aBlock);
  id v16 = v1;
  swift_release();
  sub_25340();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_24ADC();
  sub_BA78(&qword_31590);
  sub_C260();
  sub_25630();
  sub_25580();
  _Block_release(v15);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v3, v9);
}

id sub_22E40(unint64_t a1, char *a2)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25310();
  sub_C2FC(v4, (uint64_t)qword_31D88);
  uint64_t v5 = sub_25300();
  os_log_type_t v6 = sub_25560();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    sub_255F0();
    _os_log_impl(&dword_0, v5, v6, "#LanguageCell onChangeActions downloadPercentage %ld", v7, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v8 = OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress;
  uint64_t v9 = *(void **)&a2[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress];
  if (v9)
  {
    id v10 = v9;
    uint64_t v16 = sub_257A0();
    uint64_t v17 = v11;
    v18._countAndFlagsBits = 37;
    v18._object = (void *)0xE100000000000000;
    sub_253E0(v18);
    sub_249DC(v16, v17, v10);
  }
  [a2 setForceHideDisclosureIndicator:0];
  if (!a1)
  {
    uint64_t v13 = 0;
    uint64_t v12 = *(void **)&a2[v8];
    if (!v12) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  uint64_t v12 = *(void **)&a2[v8];
  if (a1 > 0x63)
  {
    if (v12) {
      [v12 setHidden:1];
    }
    uint64_t v12 = *(void **)&a2[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_spinner];
    uint64_t v13 = 1;
    if (!v12) {
      goto LABEL_18;
    }
LABEL_16:
    uint64_t v14 = 1;
    goto LABEL_17;
  }
  uint64_t v13 = 0;
  if (v12)
  {
    uint64_t v14 = 0;
LABEL_17:
    [v12 setHidden:v14];
  }
LABEL_18:
  [a2 setAccessoryType:v13];
  return [a2 layoutSubviews];
}

void sub_2304C()
{
  uint64_t v1 = v0;
  v42.receiver = v0;
  v42.super_class = (Class)type metadata accessor for LanguageCell();
  objc_msgSendSuper2(&v42, "layoutSubviews");
  id v2 = [v0 textLabel];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress];
    if (v4)
    {
      id v41 = v4;
      double v5 = 0.0;
      if (([v41 isHidden] & 1) == 0)
      {
        if (qword_31468 != -1) {
          swift_once();
        }
        double v6 = *(double *)&qword_319B8;
        if (qword_31480 != -1) {
          swift_once();
        }
        double v5 = v6 + *(double *)&qword_319D0;
      }
      [v1 frame];
      double Width = CGRectGetWidth(v45);
      if (qword_31470 != -1) {
        swift_once();
      }
      double v8 = Width - *(double *)&qword_319C0 - v5;
      if (qword_31478 != -1) {
        swift_once();
      }
      double v9 = v8 - (*(double *)&qword_319C8 + *(double *)&qword_319C8);
      [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
      sub_DC98(0, &qword_31A20);
      v44[3] = sub_DC98(0, &qword_31A38);
      v44[0] = v3;
      memset(v43, 0, sizeof(v43));
      id v10 = v3;
      id v11 = sub_23738(v44, 7, 0, v43, 0, 1.0, v9);
      id v40 = self;
      swift_bridgeObjectRetain();
      Class isa = sub_25410().super.isa;
      swift_bridgeObjectRelease();
      [v40 deactivateConstraints:isa];

      sub_BA78(&qword_31858);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_26480;
      id v14 = [v10 leadingAnchor];
      id v15 = [v1 contentView];
      id v16 = [v15 layoutMarginsGuide];

      id v17 = [v16 leadingAnchor];
      id v18 = [v14 constraintEqualToAnchor:v17];

      *(void *)(v13 + 32) = v18;
      id v19 = [v10 centerYAnchor];
      id v20 = [v1 contentView];
      id v21 = [v20 centerYAnchor];

      id v22 = [v19 constraintEqualToAnchor:v21];
      *(void *)(v13 + 40) = v22;
      *(void *)(v13 + 48) = v11;
      v44[0] = v13;
      sub_25440();
      uint64_t v23 = v44[0];
      id v24 = v11;
      sub_21BF8(v23);
      swift_bridgeObjectRetain();
      v25.super.Class isa = sub_25410().super.isa;
      swift_bridgeObjectRelease();
      [v40 activateConstraints:v25.super.isa];

      goto LABEL_29;
    }
  }
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_25310();
  sub_C2FC(v26, (uint64_t)qword_31D88);
  uint64_t v27 = v1;
  uint64_t v28 = sub_25300();
  os_log_type_t v29 = sub_25560();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)sub_E46C();
    uint64_t v31 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 138412290;
    id v32 = [v27 textLabel];
    id v33 = v32;
    if (v32) {
      v44[0] = v32;
    }
    else {
      v44[0] = 0;
    }
    sub_255F0();
    *uint64_t v31 = v33;

    _os_log_impl(&dword_0, v28, v29, "#LanguageCell layoutSubviews textLabel %@", v30, 0xCu);
    sub_BA78(&qword_315C0);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {

    uint64_t v28 = v27;
  }

  uint64_t v34 = v27;
  v25.super.Class isa = (Class)sub_25300();
  os_log_type_t v35 = sub_25560();
  if (os_log_type_enabled((os_log_t)v25.super.isa, v35))
  {
    uint64_t v36 = (uint8_t *)sub_E46C();
    uint64_t v37 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 138412290;
    uint64_t v38 = *(Class *)((char *)&v34->isa + OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress);
    if (v38)
    {
      v44[0] = *((char *)v34 + OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress);
      id v39 = v38;
    }
    else
    {
      v44[0] = 0;
    }
    sub_255F0();
    void *v37 = v38;

    _os_log_impl(&dword_0, (os_log_t)v25.super.isa, v35, "#LanguageCell layoutSubviews downloadProgress %@", v36, 0xCu);
    sub_BA78(&qword_315C0);
    swift_arrayDestroy();
    sub_E414();
    sub_E414();
  }
  else
  {

    v25.super.Class isa = (Class)v34;
  }
LABEL_29:
}

id sub_23738(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  sub_24A40(a1, a1[3]);
  uint64_t v14 = sub_257B0();
  uint64_t v15 = a4[3];
  if (v15)
  {
    id v16 = sub_24A40(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    __chkstk_darwin(v16);
    id v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_257B0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    sub_E284((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [(id)swift_getObjCClassFromMetadata() constraintWithItem:v14 attribute:a2 relatedBy:a3 toItem:v21 attribute:a5 multiplier:a6 constant:a7];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_E284((uint64_t)a1);
  return v22;
}

void sub_23954(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0 || a1 > 99)
  {
    if (qword_31488 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_25310();
    sub_C2FC(v65, (uint64_t)qword_31D88);
    oslog = sub_25300();
    os_log_type_t v66 = sub_25560();
    if (!os_log_type_enabled(oslog, v66)) {
      goto LABEL_26;
    }
    unint64_t v67 = (uint8_t *)sub_E49C();
    *(_WORD *)unint64_t v67 = 0;
    uint64_t v68 = "#LanguageCell not adding spinners and text, downloadPercentage undefined or complete";
    goto LABEL_25;
  }
  uint64_t v4 = v2;
  sub_21BE0((uint64_t)[objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100]);
  sub_21BEC((uint64_t)[objc_allocWithZone((Class)UILabel) init]);
  double v5 = *(void **)&v2[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_spinner];
  if (v5)
  {
    double v6 = *(void **)&v2[OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_downloadProgress];
    if (v6)
    {
      id v7 = v5;
      id v8 = v6;
      id v9 = sub_24D64();
      [v9 addSubview:v7];

      id v10 = sub_24D64();
      [v10 addSubview:v8];

      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v11 = [self grayColor];
      [v8 setTextColor:v11];

      v72[0] = (id)a1;
      uint64_t v74 = sub_257A0();
      uint64_t v75 = v12;
      v78._countAndFlagsBits = 37;
      v78._object = (void *)0xE100000000000000;
      sub_253E0(v78);
      sub_249DC(v74, v75, v8);
      uint64_t v13 = qword_31468;
      id v14 = v8;
      if (v13 != -1) {
        swift_once();
      }
      double v15 = sub_24DAC();
      objc_msgSend(v14, v16, v15);

      [v14 setHidden:1];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v7 startAnimating];
      [v4 setForceHideDisclosureIndicator:1];
      uint64_t v17 = qword_31470;
      id v18 = v7;
      if (v17 != -1) {
        swift_once();
      }
      double v19 = sub_24DAC();
      objc_msgSend(v18, v20, v19);

      id v70 = self;
      sub_BA78(&qword_31858);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_26490;
      id v22 = [v18 trailingAnchor];
      id v23 = sub_24D64();
      id v24 = [v23 trailingAnchor];

      id v25 = [v22 constraintEqualToAnchor:v24];
      *(void *)(v21 + 32) = v25;
      id v26 = [v18 centerYAnchor];
      id v27 = sub_24D64();
      id v28 = [v27 centerYAnchor];

      id v29 = [v26 constraintEqualToAnchor:v28];
      *(void *)(v21 + 40) = v29;
      sub_25440();
      sub_DC98(0, &qword_31A20);
      Class isa = sub_25410().super.isa;
      swift_bridgeObjectRelease();
      [v70 activateConstraints:isa];

      uint64_t v31 = sub_DC98(0, &qword_31A28);
      uint64_t v76 = v31;
      uint64_t v74 = (uint64_t)v18;
      id v32 = v18;
      id v33 = sub_24D64();
      uint64_t v34 = sub_DC98(0, &qword_31A30);
      uint64_t v73 = v34;
      v72[0] = v33;
      if (qword_31478 != -1) {
        swift_once();
      }
      double v35 = sub_24D20();
      id v41 = sub_23738(v36, v37, v38, v39, 6, v35, v40);
      uint64_t v42 = sub_DC98(0, &qword_31A38);
      uint64_t v76 = v42;
      uint64_t v73 = v31;
      uint64_t v74 = (uint64_t)v14;
      v72[0] = v32;
      uint64_t v43 = qword_31480;
      id v44 = v32;
      id v45 = v14;
      if (v43 != -1) {
        swift_once();
      }
      double v46 = sub_24D20();
      id v52 = sub_23738(v47, v48, v49, v50, 5, v46, v51);
      uint64_t v76 = v42;
      uint64_t v74 = (uint64_t)v45;
      id v53 = v45;
      uint64_t v73 = v34;
      v72[0] = [v4 contentView];
      id v54 = sub_23738(&v74, 10, 0, v72, 10, 1.0, 0.0);
      id v55 = [v4 contentView];
      uint64_t v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = xmmword_26480;
      *(void *)(v56 + 32) = v41;
      *(void *)(v56 + 40) = v52;
      *(void *)(v56 + 48) = v54;
      uint64_t v74 = v56;
      sub_25440();
      id v57 = v41;
      id v58 = v52;
      id v59 = v54;
      Class v60 = sub_25410().super.isa;
      swift_bridgeObjectRelease();
      [v55 addConstraints:v60];

      if (qword_31488 != -1) {
        swift_once();
      }
      uint64_t v61 = sub_25310();
      sub_C2FC(v61, (uint64_t)qword_31D88);
      uint64_t v62 = sub_25300();
      os_log_type_t v63 = sub_25560();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = (uint8_t *)sub_E49C();
        *(_WORD *)uint64_t v64 = 0;
        _os_log_impl(&dword_0, v62, v63, "#LanguageCell added all subviews", v64, 2u);
        sub_E414();
      }
      else
      {
      }
      return;
    }
  }
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v69 = sub_25310();
  sub_C2FC(v69, (uint64_t)qword_31D88);
  oslog = sub_25300();
  os_log_type_t v66 = sub_25550();
  if (os_log_type_enabled(oslog, v66))
  {
    unint64_t v67 = (uint8_t *)sub_E49C();
    *(_WORD *)unint64_t v67 = 0;
    uint64_t v68 = "#LanguageCell failed to create spinner and progress label";
LABEL_25:
    _os_log_impl(&dword_0, oslog, v66, v68, v67, 2u);
    sub_E414();
  }
LABEL_26:
}

id sub_24198()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LanguageCell()
{
  return self;
}

char *sub_24260()
{
  uint64_t v1 = *v0;
  double result = (char *)swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v1;
  if (!result)
  {
    double result = sub_242EC(result, *(void *)(v1 + 16) + 1, 1, v1);
    uint64_t *v0 = (uint64_t)result;
  }
  return result;
}

char *sub_242AC(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    double result = sub_242EC((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = (uint64_t)result;
  }
  return result;
}

char *sub_242EC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BA78(&qword_31A40);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    id v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_245FC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_243DC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_243DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_BA78(&qword_31A48);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25770();
  __break(1u);
  return result;
}

char *sub_244F4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_24D08();
    uint64_t result = (char *)sub_24CE4();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)sub_24CC8(a3, result);
  }
  return result;
}

char *sub_2454C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_24D08();
    uint64_t result = (char *)sub_24CE4();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_24CC8(a3, result);
  }
  return result;
}

char *sub_245A4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_24D08();
    uint64_t result = (char *)sub_24CE4();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_24CC8(a3, result);
  }
  return result;
}

char *sub_245FC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25770();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

unint64_t sub_24690(int a1)
{
  uint64_t v2 = sub_25800();

  return sub_24794(a1, v2);
}

unint64_t sub_246D8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_25640(*(void *)(v2 + 40));

  return sub_24830(a1, v4);
}

unint64_t sub_2471C(uint64_t a1, uint64_t a2)
{
  sub_25810();
  sub_253D0();
  Swift::Int v4 = sub_25830();

  return sub_248F8(a1, a2, v4);
}

unint64_t sub_24794(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_24830(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_24C5C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_25650();
      sub_E1DC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_248F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_257C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_257C0() & 1) == 0);
    }
  }
  return v6;
}

void sub_249DC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_25390();
  swift_bridgeObjectRelease();
  [a3 setText:v4];
}

void *sub_24A40(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24A84()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_24ABC()
{
  return sub_22E40(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_24AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24AD4()
{
  return swift_release();
}

unint64_t sub_24ADC()
{
  unint64_t result = qword_31588;
  if (!qword_31588)
  {
    sub_25330();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31588);
  }
  return result;
}

uint64_t sub_24B2C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_24B6C()
{
  sub_229D8(*(void **)(v0 + 16));
}

uint64_t sub_24B74(void *a1)
{
  id v1 = [a1 name];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_253A0();

  return v3;
}

uint64_t sub_24BD8()
{
  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_24C10()
{
  return sub_22758(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_24C1C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_24C54()
{
  return sub_2208C();
}

uint64_t sub_24C5C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_24CC8@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t sub_24CE4()
{
  return sub_25770();
}

double sub_24D20()
{
  return 1.0;
}

uint64_t sub_24D3C()
{
  return sub_25350();
}

id sub_24D64()
{
  uint64_t v3 = *(const char **)(v1 + 2552);
  return [v0 v3];
}

void sub_24D7C(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1) = 0;
  uint64_t v2 = (void *)(v1 + OBJC_IVAR____TtC20SiriMessagesSettings12LanguageCell_localeCode);
  *uint64_t v2 = 0;
  v2[1] = 0;
}

double sub_24DAC()
{
  return 0.0;
}

uint64_t sub_24DC0(uint64_t a1, unint64_t a2)
{
  if (qword_31488 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25310();
  sub_C2FC(v4, (uint64_t)qword_31D88);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_25300();
  os_log_type_t v6 = sub_25550();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_14464(a1, a2, &v9);
    sub_255F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v5, v6, "Fatal error: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24F78()
{
  uint64_t v0 = sub_25310();
  sub_2506C(v0, qword_31D88);
  sub_C2FC(v0, (uint64_t)qword_31D88);
  if (qword_31490 != -1) {
    swift_once();
  }
  id v1 = (id)qword_31DA0;
  return sub_25320();
}

uint64_t sub_25004()
{
  sub_250D0();
  uint64_t result = sub_255E0();
  qword_31DA0 = result;
  return result;
}

uint64_t *sub_2506C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_250D0()
{
  unint64_t result = qword_31A50;
  if (!qword_31A50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_31A50);
  }
  return result;
}

uint64_t sub_25110(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_25120()
{
  return Locale.init(identifier:)();
}

uint64_t sub_25130()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t sub_25140()
{
  return Locale.LanguageCode.debugDescription.getter();
}

uint64_t sub_25150()
{
  return type metadata accessor for Locale.LanguageCode();
}

uint64_t sub_25160()
{
  return Locale.LanguageCode.init(_:)();
}

uint64_t sub_25170()
{
  return Locale.init(languageCode:script:languageRegion:)();
}

NSLocale sub_25180()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_25190()
{
  return type metadata accessor for Locale.Region();
}

uint64_t sub_251A0()
{
  return type metadata accessor for Locale.Script();
}

uint64_t sub_251B0()
{
  return type metadata accessor for Locale();
}

NSIndexPath sub_251C0()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_251D0()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_251E0()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_251F0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_25200()
{
  return dispatch thunk of DaemonSession.subscribedVoices(clientId:reply:)();
}

uint64_t sub_25210()
{
  return dispatch thunk of DaemonSession.speak(previewRequest:didFinish:)();
}

uint64_t sub_25220()
{
  return dispatch thunk of DaemonSession.subscribe(client:voices:reply:)();
}

uint64_t sub_25230()
{
  return type metadata accessor for DaemonSession();
}

uint64_t sub_25240()
{
  return AssistantAsset.name.getter();
}

uint64_t sub_25250()
{
  return PreviewRequest.init(voice:previewType:)();
}

uint64_t sub_25260()
{
  return type metadata accessor for PreviewRequest();
}

uint64_t sub_25270()
{
  return dispatch thunk of SynthesisVoice.name.getter();
}

uint64_t sub_25280()
{
  return SynthesisVoice.init(language:name:)();
}

uint64_t sub_25290()
{
  return dispatch thunk of SynthesisVoice.language.getter();
}

uint64_t sub_252A0()
{
  return type metadata accessor for SynthesisVoice();
}

uint64_t sub_252B0()
{
  return dispatch thunk of SynthesisVoiceSubscription.voice.getter();
}

uint64_t sub_252C0()
{
  return type metadata accessor for SynthesisVoiceSubscription();
}

uint64_t sub_252D0()
{
  return static Languages.availableLanguages.getter();
}

uint64_t sub_252E0()
{
  return static Languages.fallbackLanguage(for:)();
}

uint64_t sub_252F0()
{
  return type metadata accessor for Languages();
}

uint64_t sub_25300()
{
  return Logger.logObject.getter();
}

uint64_t sub_25310()
{
  return type metadata accessor for Logger();
}

uint64_t sub_25320()
{
  return Logger.init(_:)();
}

uint64_t sub_25330()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_25340()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_25350()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_25360()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_25370()
{
  return Dictionary.description.getter();
}

uint64_t sub_25380()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_25390()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_253A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_253B0()
{
  return String.init(format:_:)();
}

uint64_t sub_253C0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_253D0()
{
  return String.hash(into:)();
}

void sub_253E0(Swift::String a1)
{
}

Swift::Int sub_253F0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_25400()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_25410()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_25420()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_25430()
{
  return Array.description.getter();
}

uint64_t sub_25440()
{
  return specialized Array._endMutation()();
}

uint64_t sub_25450()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_25460()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_25470()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_25480()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_25490()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_254A0()
{
  return static Bool._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_254B0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_254C0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_254D0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_254E0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_254F0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_25500()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_25510()
{
  return Set.description.getter();
}

uint64_t sub_25520()
{
  return static TTSAssetType.gryphonVoice.getter();
}

uint64_t sub_25530()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_25540()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_25550()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_25560()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_25570()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_25580()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

NSNumber sub_25590(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_255A0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_255B0()
{
  return static TTSAsset.listAssets(ofTypes:matching:)();
}

uint64_t sub_255C0()
{
  return TTSAsset.AssistantVoiceMaps.voicesForLanguageMap.getter();
}

uint64_t sub_255D0()
{
  return static TTSAsset.bestAsset(ofTypes:matching:)();
}

uint64_t sub_255E0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_255F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_25600()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_25610()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_25620()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_25630()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_25640(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_25650()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_25660()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_25670()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_25680()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_25690(Swift::Int a1)
{
}

uint64_t sub_256A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_256B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_256C0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_256D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_256E0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_256F0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_25700()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_25710()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_25720()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

BOOL sub_25730(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_25740()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_25750()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_25760()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_25770()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_25790(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_257A0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_257B0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_257C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_257D0()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_257E0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_257F0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_25800()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t sub_25810()
{
  return Hasher.init(_seed:)();
}

void sub_25820(Swift::UInt a1)
{
}

Swift::Int sub_25830()
{
  return Hasher._finalize()();
}

uint64_t AFGryphonAssetsExistForLanguage()
{
  return _AFGryphonAssetsExistForLanguage();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocUninitializedObject()
{
  return _swift_deallocUninitializedObject();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}