void sub_1000C5450(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t vars8;

  v1 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView;
  v2 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView);
  if (v2)
  {
    v4 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView);
    v8 = v2;
    sub_10009BC84(v4, v8, 1);
    v5 = *(void **)(a1 + v1);
    *(void *)(a1 + v1) = 0;

    v6 = *(void *)(a1 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState);
    if (v6 && *(unsigned char *)(v6 + 19) == 1)
    {
      *(unsigned char *)(v6 + 19) = 0;
      v7 = *(void *)(v6 + 80);
      if ((v7 & 8) == 0) {
        *(void *)(v6 + 80) = v7 | 8;
      }
      swift_retain();
      sub_100059388();
      swift_release();
    }
  }
}

void sub_1000C5540(uint64_t a1)
{
}

void sub_1000C556C(void *a1)
{
  if (a1)
  {
    id v11 = a1;
    [v11 floatValue];
    float v3 = v2 / 100.0;
    uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView);
    if (v3 >= 0.0)
    {
      LOBYTE(aBlock[0]) = 0;
      sub_100048538(1, LODWORD(v3), 0, 1, 1, 0, 0);
    }
    else
    {
      sub_10006C1C8(0, 0, 1, 0, 0);
      v5 = *(void **)(v4 + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_progressIndicatorView);
      [v5 alpha];
      if (v6 == 1.0)
      {
        uint64_t v7 = swift_allocObject();
        *(void *)(v7 + 16) = v5;
        v8 = self;
        aBlock[4] = sub_100042CF0;
        aBlock[5] = v7;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000358AC;
        aBlock[3] = &unk_100152C18;
        v9 = _Block_copy(aBlock);
        id v10 = v5;
        swift_retain();
        swift_release();
        [v8 animateWithDuration:0x20000 delay:v9 options:0 animations:0.125 completion:0.0];
        _Block_release(v9);

        swift_release();
        return;
      }
    }
  }
}

void sub_1000C5764(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100048A50(1, a1, a2);
  }
  else
  {
    sub_100048A50(0, a1, 0);
    sub_1000C98CC();
  }
}

uint64_t sub_1000C57C8(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_deviceInformationView);
  unsigned __int8 v4 = [a1 displayDeviceIdentifier];
  *(unsigned char *)(v3 + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceIdentifierVisible) = v4;
  sub_10003D61C();
  id v5 = [a1 deviceIdentifier];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  return sub_10003D328(v6, v8);
}

id sub_1000C5858()
{
  return sub_1000411E4((id)1, 6);
}

id sub_1000C5898()
{
  sub_1000C98CC();
  sub_1000C673C(1);
  sub_100041348(3, 0);
  sub_100041A98();
  sub_100041D34();
  id v0 = [self standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  if ((v2 & 1) == 0)
  {
    objc_msgSend(objc_msgSend(self, "currentPlatform"), "isInBoxUpdateModeActive");
    swift_unknownObjectRelease();
  }
  sub_100041348(4, 1);
  return sub_100041940();
}

id sub_1000C5998()
{
  sub_1000C98CC();
  NSString v1 = *(char **)(v0 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView);
  id v2 = [*(id *)(v0 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView) arrangedSubviews];
  sub_10003C374(0, (unint64_t *)&qword_1001858F0);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_10009B4E4(v1, v4, 1);
  id v5 = *(void (**)(uint64_t))&v1[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_10003B0B8((uint64_t)v5);
  }
  sub_100048A50(0, 0, 0);
  sub_100041348(5, 0);
  sub_100041A98();
  id v7 = [self standardUserDefaults];
  NSString v8 = String._bridgeToObjectiveC()();
  unsigned __int8 v9 = [v7 BOOLForKey:v8];

  if (v9) {
    return (id)sub_100041348(0, 1);
  }
  unsigned int v10 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isInBoxUpdateModeActive");
  swift_unknownObjectRelease();
  if (v10) {
    return (id)sub_100041348(0, 1);
  }
  sub_100041348(2, 1);
  return sub_100041BE4();
}

id sub_1000C5BB4()
{
  sub_1000C98CC();
  NSString v1 = *(char **)(v0 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView);
  id v2 = [*(id *)(v0 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView) arrangedSubviews];
  sub_10003C374(0, (unint64_t *)&qword_1001858F0);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_10009B4E4(v1, v4, 1);
  id v5 = *(void (**)(uint64_t))&v1[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_10003B0B8((uint64_t)v5);
  }
  sub_100041348(5, 0);
  sub_100041A98();
  id v7 = [self standardUserDefaults];
  NSString v8 = String._bridgeToObjectiveC()();
  unsigned __int8 v9 = [v7 BOOLForKey:v8];

  if ((v9 & 1) != 0
    || (unsigned int v10 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isInBoxUpdateModeActive"), swift_unknownObjectRelease(), v10))
  {
    sub_100041348(0, 1);
  }
  else
  {
    sub_100041348(2, 1);
    sub_100041BE4();
  }
  sub_100048A50(4, 0, 0);
  sub_10006C1C8(0, 0, 1, 0, 0);
  id v11 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_progressIndicatorView];
  id result = [v11 alpha];
  if (v13 == 1.0)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v11;
    v15 = self;
    v18[4] = sub_100042CF0;
    v18[5] = v14;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 1107296256;
    v18[2] = sub_1000358AC;
    v18[3] = &unk_100152BC8;
    v16 = _Block_copy(v18);
    id v17 = v11;
    swift_retain();
    swift_release();
    [v15 animateWithDuration:0x20000 delay:v16 options:0 animations:0.125 completion:0.0];
    _Block_release(v16);
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_1000C5F00()
{
  NSString v1 = v0;
  id v2 = (void *)qword_100183500;
  if (qword_100183500
    && (type metadata accessor for SelfServiceDestinationPickerViewController(), !swift_dynamicCastClass()))
  {
    id v9 = v2;
  }
  else
  {
    if (qword_100182750 != -1) {
      swift_once();
    }
    id v3 = [(id)qword_10018A380 viewControllers];
    sub_10003C374(0, (unint64_t *)&qword_100183670);
    unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v5)
      {
LABEL_7:
        unint64_t v6 = v5 - 1;
        if (__OFSUB__(v5, 1))
        {
          __break(1u);
        }
        else if ((v4 & 0xC000000000000001) == 0)
        {
          if ((v6 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v6 < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v7 = *(id *)(v4 + 8 * v6 + 32);
LABEL_12:
            NSString v8 = v7;
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          __break(1u);
LABEL_38:
          swift_once();
          goto LABEL_27;
        }
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v5) {
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_100182748 != -1) {
      swift_once();
    }
    id v9 = (id)qword_10018A370;
  }
  NSString v8 = v9;
LABEL_19:
  type metadata accessor for DashboardViewController();
  uint64_t v10 = swift_dynamicCastClass();
  if (v10)
  {
    uint64_t v11 = v10;
    sub_1000C98CC();
    v12 = *(char **)&v1[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView];
    id v13 = [*(id *)&v1[OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView] arrangedSubviews];
    sub_10003C374(0, (unint64_t *)&qword_1001858F0);
    unint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    sub_10009B4E4(v12, v15, 1);
    v16 = *(void (**)(uint64_t))&v12[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler];
    if (v16)
    {
      uint64_t v17 = swift_retain();
      v16(v17);
      sub_10003B0B8((uint64_t)v16);
    }
    sub_1000411E4((id)3, 4);
    sub_100048A50(3, 0, 0);
    char v18 = v1[OBJC_IVAR____TtC11Diagnostics12CardViewCell_pauseStateAnimation];
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v1;
    *(void *)(v19 + 24) = v11;
    v20 = v1;
    id v21 = v8;
    sub_10006C1C8(1, 0, (v18 & 1) == 0, (uint64_t (*)(uint64_t))sub_1000CA980, v19);
    v22 = *(void **)&v12[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_progressIndicatorView];
    [v22 alpha];
    if (v23 == 1.0)
    {
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v22;
      v25 = self;
      v29[4] = sub_100042994;
      v29[5] = v24;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 1107296256;
      v29[2] = sub_1000358AC;
      v29[3] = &unk_100152B00;
      v26 = _Block_copy(v29);
      id v27 = v22;
      swift_retain();
      swift_release();
      [v25 animateWithDuration:0x20000 delay:v26 options:0 animations:0.125 completion:0.0];
      _Block_release(v26);

      swift_release();
      return swift_release();
    }
    else
    {

      return swift_release();
    }
  }

  if (qword_1001827C8 != -1) {
    goto LABEL_38;
  }
LABEL_27:
  static os_log_type_t.error.getter();

  return os_log(_:dso:log:type:_:)();
}

void sub_1000C6454(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int8 v5 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if ((v5 & 1) == 0
    && (byte_10018A379 & 1) == 0
    && (*(unsigned char *)(a2 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_pauseStateAnimation) & 1) == 0)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a3;
    id v7 = self;
    NSString v8 = a3;
    if ([v7 isSSRBootIntentSet])
    {
      byte_100184CF8 = 2;
      *(unsigned char *)(*(void *)&v8[OBJC_IVAR____TtC11Diagnostics23DashboardViewController_cardManager]
               + OBJC_IVAR____TtC11Diagnostics11CardManager_persistentOnly) = 1;
      sub_1000F7604();

      swift_release();
    }
    else
    {
      if (qword_1001827C8 != -1) {
        swift_once();
      }
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
      id v9 = [objc_allocWithZone((Class)DADiagnosticsSessionAvailability) init];
      if (qword_10018A3F8)
      {
        swift_bridgeObjectRetain();
        NSString v10 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v10 = 0;
      }
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = sub_1000CA9A0;
      *(void *)(v11 + 24) = v6;
      v13[4] = sub_10003C5D0;
      v13[5] = v11;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 1107296256;
      v13[2] = sub_1000B2448;
      v13[3] = &unk_100152B78;
      v12 = _Block_copy(v13);
      swift_retain();
      swift_release();
      [v9 checkAvailabilityWithTicketNumber:v10 timeout:0 exitWhenDone:v12 completion:30.0];
      _Block_release(v12);

      swift_release();
    }
  }
}

void sub_1000C673C(char a1)
{
  uint64_t v2 = v1;
  id v4 = [*(id *)(v1 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView) arrangedSubviews];
  sub_10003C374(0, (unint64_t *)&qword_1001858F0);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v6) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v6) {
      goto LABEL_14;
    }
  }
  specialized ContiguousArray.reserveCapacity(_:)();
  if (v6 < 0)
  {
    __break(1u);
    return;
  }
  uint64_t v7 = 0;
  do
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v8 = *(id *)(v5 + 8 * v7 + 32);
    }
    id v9 = v8;
    id v10 = [objc_allocWithZone((Class)UIView) init];
    type metadata accessor for CardStackSubviewContainer();
    uint64_t v11 = swift_dynamicCastClass();
    if (v11)
    {
      v12 = *(void **)(v11 + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView);
      if (v12)
      {
        v12;

        id v9 = v10;
      }
    }

    ++v7;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  while (v6 != v7);
LABEL_14:
  swift_bridgeObjectRelease();
  id v13 = *(id *)(v2 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView);
  char v14 = sub_1000C4698((uint64_t)v13, (unint64_t)_swiftEmptyArrayStorage, (uint64_t)&qword_1001858F0);
  swift_bridgeObjectRelease();

  if (v14) {
    sub_10009B6D0(v13, a1 & 1);
  }
}

uint64_t sub_1000C699C(void *a1)
{
  uint64_t v3 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v189 = (uint64_t)&v178 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v192 = (uint64_t)&v178 - v6;
  uint64_t v191 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v7 = *(void *)(v191 - 8);
  __chkstk_darwin(v191);
  uint64_t v188 = (uint64_t)&v178 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v9 = *(void *)(v187 - 8);
  __chkstk_darwin(v187);
  v186 = (char *)&v178 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v185 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v185 - 8);
  __chkstk_darwin(v185);
  v184 = (char *)&v178 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v219 = a1;
  id v13 = [a1 errors];
  sub_10003AFD0(&qword_100185690);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v15 = sub_1000B1C94(v14);
  swift_bridgeObjectRelease();
  uint64_t v211 = OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState;
  uint64_t v212 = v1;
  int64_t v16 = (int64_t)_swiftEmptyArrayStorage;
  if (*(void *)(v1 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v17 = swift_bridgeObjectRetain();
    sub_1000CA4B0(v17, (unint64_t)v15);
    int64_t v16 = v18;
    uint64_t v202 = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v202 = 0;
  }
  unint64_t v235 = v16;
  swift_bridgeObjectRetain();
  sub_1000CB930((unint64_t)v15);
  unint64_t v213 = v235;
  if (v235 >> 62) {
    goto LABEL_213;
  }
  uint64_t v19 = *(void *)((v235 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v19)
  {
    while (1)
    {
      if (v19 < 1)
      {
        __break(1u);
LABEL_216:
        __break(1u);
LABEL_217:
        __break(1u);
        JUMPOUT(0x1000C84CCLL);
      }
      uint64_t v20 = 0;
      unint64_t v216 = v213 & 0xC000000000000001;
      uint64_t v204 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView;
      uint64_t v205 = OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView;
      uint64_t v197 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView;
      uint64_t v21 = v16 & 0xFFFFFFFFFFFFFF8;
      uint64_t v209 = v16 & 0xFFFFFFFFFFFFFF8;
      unint64_t v210 = v213 + 32;
      if (v16 < 0) {
        uint64_t v21 = v16;
      }
      uint64_t v178 = v21;
      unint64_t v208 = v16 & 0xC000000000000001;
      v201 = v236;
      CFStringRef v207 = @"productClass";
      v199 = v232;
      v200 = v234;
      v198 = v230;
      v190 = v228;
      v180 = (void (**)(char *, uint64_t))(v9 + 8);
      v181 = v224;
      v179 = (void (**)(char *, uint64_t))(v11 + 8);
      v182 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
      v183 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v203 = v226;
      long long v215 = xmmword_1001240D0;
      long long v206 = xmmword_100123B50;
      unint64_t v195 = 0x8000000100130070;
      unint64_t v196 = 0x80000001001300D0;
      unint64_t v193 = 0x80000001001300B0;
      unint64_t v194 = 0x8000000100130090;
      unint64_t v217 = v16;
      uint64_t v214 = v19;
      while (2)
      {
        uint64_t v220 = v20;
        if (v216) {
          id v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v25 = *(id *)(v210 + 8 * v20);
        }
        v26 = v25;
        id v27 = [v25 code:v178];
        static os_log_type_t.error.getter();
        if (qword_1001827B8 != -1) {
          swift_once();
        }
        uint64_t v218 = sub_10003AFD0((uint64_t *)&unk_1001836E0);
        uint64_t v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = v215;
        id v29 = v26;
        id v30 = [v29 description];
        uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v33 = v32;
        id v221 = v29;

        *(void *)(v28 + 56) = &type metadata for String;
        unint64_t v34 = sub_10004D9B4();
        *(void *)(v28 + 64) = v34;
        *(void *)(v28 + 32) = v31;
        *(void *)(v28 + 40) = v33;
        uint64_t v7 = (uint64_t)[v219 serialNumber];
        uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v37 = v36;

        *(void *)(v28 + 96) = &type metadata for String;
        *(void *)(v28 + 104) = v34;
        *(void *)(v28 + 72) = v35;
        *(void *)(v28 + 80) = v37;
        os_log(_:dso:log:_:_:)();
        swift_bridgeObjectRelease();
        int64_t v16 = v217;
        switch((unint64_t)v27)
        {
          case 0uLL:
          case 1uLL:
            v225[7] = 2;
            v22 = v203;
            _OWORD *v203 = 0u;
            v22[1] = 0u;
            *((void *)v22 + 4) = 0;
            v226[40] = 2;
            goto LABEL_11;
          case 2uLL:
            if (v217 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
            }
            else
            {
              uint64_t v11 = *(void *)(v209 + 16);
              swift_bridgeObjectRetain();
            }
            id v43 = v221;
            uint64_t v9 = v212;
            if (!v11) {
              goto LABEL_166;
            }
            if (v208) {
              id v44 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v44 = *(id *)(v16 + 32);
            }
            v45 = v44;
            sub_10003C374(0, (unint64_t *)&unk_100185900);
            char v46 = static NSObject.== infix(_:_:)();

            if (v46) {
              goto LABEL_30;
            }
            if (v11 == 1) {
              goto LABEL_166;
            }
            if (v208)
            {
              uint64_t v93 = 1;
              while (1)
              {
                specialized _ArrayBuffer._getElementSlowPath(_:)();
                uint64_t v7 = v93 + 1;
                if (__OFADD__(v93, 1)) {
                  goto LABEL_207;
                }
                char v94 = static NSObject.== infix(_:_:)();
                swift_unknownObjectRelease();
                if (v94) {
                  goto LABEL_30;
                }
                ++v93;
                if (v7 == v11) {
                  goto LABEL_166;
                }
              }
            }
            uint64_t v152 = 5;
            do
            {
              uint64_t v153 = v152 - 3;
              if (__OFADD__(v152 - 4, 1)) {
                goto LABEL_211;
              }
              id v154 = *(id *)(v16 + 8 * v152);
              uint64_t v7 = static NSObject.== infix(_:_:)();

              if (v7)
              {
LABEL_30:
                swift_bridgeObjectRelease();
                v47 = *(void **)(v9 + v197);
                if (v47)
                {
                  v48 = *(void **)(v9 + v204);
                  id v49 = v47;
                  sub_10009BC84(v48, v49, 1);
                  v50 = *(void **)(v9 + v197);
                  *(void *)(v9 + v197) = 0;

                  uint64_t v51 = *(void *)(v9 + v211);
                  if (v51 && *(unsigned char *)(v51 + 19) == 1)
                  {
                    *(unsigned char *)(v51 + 19) = 0;
                    uint64_t v52 = *(void *)(v51 + 80);
                    if ((v52 & 8) == 0) {
                      *(void *)(v51 + 80) = v52 | 8;
                    }
                    swift_retain();
                    sub_100059388();
                    swift_release();
                  }
                }
                goto LABEL_90;
              }
              ++v152;
            }
            while (v153 != v11);
LABEL_166:
            swift_bridgeObjectRelease();
            id v155 = [v219 suiteName];
            if (v155)
            {
              v156 = v155;
              uint64_t v157 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v159 = v158;
            }
            else
            {
              uint64_t v157 = 0;
              uint64_t v159 = 0xE000000000000000;
            }
            sub_1000C8A44(v157, v159);
            swift_bridgeObjectRelease();
            if (*(void *)(v9 + v211)) {
              goto LABEL_161;
            }
            goto LABEL_170;
          case 3uLL:
            id v53 = [v219 attributes];
            sub_10003AFD0((uint64_t *)&unk_100182E10);
            uint64_t v54 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            if (!*(void *)(v54 + 16))
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v61 = v212;
              uint64_t v58 = v202;
              id v43 = v221;
              goto LABEL_104;
            }
            unint64_t v57 = sub_10007D7FC(v55, v56);
            uint64_t v58 = v202;
            id v43 = v221;
            if ((v59 & 1) == 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
LABEL_103:
              uint64_t v61 = v212;
              goto LABEL_104;
            }
            uint64_t v60 = *(void *)(*(void *)(v54 + 56) + 8 * v57);
            swift_unknownObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v225[0] = v60;
            if ((swift_dynamicCast() & 1) == 0) {
              goto LABEL_103;
            }
            uint64_t v61 = v212;
            if (v222 == (void **)0x646F50656D6F48 && v223 == 0xE700000000000000)
            {

              swift_bridgeObjectRelease();
              goto LABEL_14;
            }
            char v127 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v127) {
              goto LABEL_170;
            }
LABEL_104:
            if ((sub_1000C4698((uint64_t)v43, v16, (uint64_t)&unk_100185900) & 1) == 0)
            {
              uint64_t v227 = 1;
              v108 = v190;
              _OWORD *v190 = 0u;
              v108[1] = 0u;
              *((void *)v108 + 4) = 0;
              v228[40] = 2;
              sub_100070524(0);
              if (*(void *)(v61 + v211)) {
                goto LABEL_161;
              }
              goto LABEL_170;
            }
            if (!qword_10018A3C8) {
              goto LABEL_136;
            }
            uint64_t v95 = qword_100182828;
            id v96 = (id)qword_10018A3C8;
            if (v95 != -1) {
              swift_once();
            }
            uint64_t v97 = type metadata accessor for ModalPresentationCoordinator(0);
            sub_10003C3B0(v97, (uint64_t)qword_10018A440);
            swift_beginAccess();
            id v98 = sub_1000D96A4();
            if (!v98) {
              goto LABEL_128;
            }
            v99 = v98;
            sub_10003C374(0, &qword_100185910);
            if (static NSObject.== infix(_:_:)())
            {
              sub_10003C374(0, (unint64_t *)&qword_100182E40);
              v100 = (void *)static OS_dispatch_queue.main.getter();
              uint64_t v101 = swift_allocObject();
              *(void *)(v101 + 16) = 0;
              *(unsigned char *)(v101 + 24) = 1;
              *(void *)(v101 + 32) = v96;
              *(unsigned char *)(v101 + 40) = 1;
              *(void *)(v101 + 48) = 0;
              *(void *)(v101 + 56) = 0;
              v224[2] = sub_10003C5B0;
              v224[3] = v101;
              v222 = _NSConcreteStackBlock;
              uint64_t v223 = 1107296256;
              v224[0] = sub_1000358AC;
              v224[1] = &unk_100152DA8;
              v102 = _Block_copy(&v222);
              id v103 = v96;
              swift_release();
              uint64_t v218 = (uint64_t)v96;
              v104 = v184;
              static DispatchQoS.unspecified.getter();
              v222 = (void **)_swiftEmptyArrayStorage;
              sub_10003AF78();
              sub_10003AFD0((uint64_t *)&unk_100182E50);
              sub_10003B014();
              v106 = v186;
              uint64_t v105 = v187;
              dispatch thunk of SetAlgebra.init<A>(_:)();
              OS_dispatch_queue.async(group:qos:flags:execute:)();
              _Block_release(v102);

              (*v180)(v106, v105);
              v107 = v104;
              id v96 = (id)v218;
              (*v179)(v107, v185);
              uint64_t v61 = v212;
              id v43 = v221;
            }
            else
            {

LABEL_128:
              id v113 = v96;
              uint64_t v114 = swift_bridgeObjectRetain();
              uint64_t v115 = sub_1000DC28C(v114, v113);

              uint64_t v116 = sub_1000DB64C(v115);
              if (v118) {
                goto LABEL_217;
              }
              uint64_t v61 = v212;
              id v43 = v221;
              if (*(_DWORD *)(v115 + 36) != v117) {
                goto LABEL_216;
              }
              uint64_t v119 = 1;
              if (v116 != 1 << *(unsigned char *)(v115 + 32))
              {
                sub_1000DB6F0(v116, v117, v115, v192);
                uint64_t v119 = 0;
              }
              uint64_t v121 = v191;
              uint64_t v120 = v192;
              (*v183)(v192, v119, 1, v191);
              swift_release();
              if ((*v182)(v120, 1, v121) == 1)
              {
                sub_10003C44C(v120, (uint64_t *)&unk_100182FD0);
              }
              else
              {
                uint64_t v122 = v120;
                uint64_t v123 = v188;
                sub_10003C4A8(v122, v188);
                uint64_t v124 = v189;
                sub_1000B7DBC(v123, v189);
                sub_10003C44C(v124, (uint64_t *)&unk_100182FD0);
                sub_1000CACBC(v123, type metadata accessor for ModalPresentationCoordinator.QueueEntry);
              }
            }
            swift_endAccess();
            v125 = (void *)qword_10018A3C8;
            qword_10018A3C8 = 0;

LABEL_136:
            uint64_t v202 = v58;
            if (!*(void *)(v61 + v211)) {
              goto LABEL_170;
            }
            goto LABEL_137;
          case 4uLL:
            if (v217 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
            }
            else
            {
              uint64_t v11 = *(void *)(v209 + 16);
              swift_bridgeObjectRetain();
            }
            uint64_t v9 = v212;
            id v43 = v221;
            if (!v11) {
              goto LABEL_146;
            }
            if (v208) {
              id v62 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v62 = *(id *)(v16 + 32);
            }
            v63 = v62;
            sub_10003C374(0, (unint64_t *)&unk_100185900);
            char v64 = static NSObject.== infix(_:_:)();

            if (v64) {
              goto LABEL_89;
            }
            if (v11 == 1) {
              goto LABEL_146;
            }
            if (v208)
            {
              uint64_t v65 = 1;
              while (1)
              {
                specialized _ArrayBuffer._getElementSlowPath(_:)();
                uint64_t v7 = v65 + 1;
                if (__OFADD__(v65, 1)) {
                  break;
                }
                char v66 = static NSObject.== infix(_:_:)();
                swift_unknownObjectRelease();
                if (v66) {
                  goto LABEL_89;
                }
                ++v65;
                if (v7 == v11) {
                  goto LABEL_146;
                }
              }
              __break(1u);
              goto LABEL_206;
            }
            uint64_t v129 = 5;
            do
            {
              uint64_t v130 = v129 - 3;
              if (__OFADD__(v129 - 4, 1)) {
                goto LABEL_209;
              }
              id v131 = *(id *)(v16 + 8 * v129);
              uint64_t v7 = static NSObject.== infix(_:_:)();

              if (v7) {
                goto LABEL_89;
              }
              ++v129;
            }
            while (v130 != v11);
LABEL_146:
            swift_bridgeObjectRelease();
            v132 = *(char **)(v9 + v204);
            id v133 = [*(id *)(v9 + v205) arrangedSubviews];
            sub_10003C374(0, (unint64_t *)&qword_1001858F0);
            unint64_t v134 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

            if (v134 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v135 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v135 = *(void *)((v134 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            swift_bridgeObjectRelease();
            sub_10009B4E4(v132, v135, 1);
            v136 = *(void (**)(uint64_t))&v132[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler];
            if (v136)
            {
              uint64_t v137 = swift_retain();
              v136(v137);
              sub_10003B0B8((uint64_t)v136);
            }
            uint64_t v138 = 0x5F4E574F4E4B4E55;
            v139 = (void *)0xED0000524F525245;
            goto LABEL_160;
          case 5uLL:
            uint64_t v233 = 5;
            v67 = v200;
            _OWORD *v200 = 0u;
            v67[1] = 0u;
            *((void *)v67 + 4) = 0;
            v234[40] = 2;
            goto LABEL_11;
          case 6uLL:
            id v68 = [v219 attributes];
            sub_10003AFD0((uint64_t *)&unk_100182E10);
            uint64_t v69 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            if (!*(void *)(v69 + 16))
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v24 = v214;
              id v73 = v221;
              goto LABEL_115;
            }
            unint64_t v72 = sub_10007D7FC(v70, v71);
            id v73 = v221;
            if ((v74 & 1) == 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
LABEL_114:
              uint64_t v24 = v214;
LABEL_115:
              uint64_t v229 = 3;
              v109 = v198;
              _OWORD *v198 = 0u;
              v109[1] = 0u;
              *((void *)v109 + 4) = 0;
              v230[40] = 2;
              goto LABEL_119;
            }
            uint64_t v75 = *(void *)(*(void *)(v69 + 56) + 8 * v72);
            swift_unknownObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v225[0] = v75;
            if ((swift_dynamicCast() & 1) == 0) {
              goto LABEL_114;
            }
            uint64_t v24 = v214;
            if (v222 != (void **)0x646F50656D6F48 || v223 != 0xE700000000000000)
            {
              char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if (v76) {
                goto LABEL_141;
              }
              goto LABEL_115;
            }
LABEL_83:

            swift_bridgeObjectRelease();
            goto LABEL_15;
          case 7uLL:
            if (v217 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
            }
            else
            {
              uint64_t v11 = *(void *)(v209 + 16);
              swift_bridgeObjectRetain();
            }
            uint64_t v9 = v212;
            id v43 = v221;
            if (!v11) {
              goto LABEL_155;
            }
            if (v208) {
              id v77 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v77 = *(id *)(v16 + 32);
            }
            v78 = v77;
            sub_10003C374(0, (unint64_t *)&unk_100185900);
            char v79 = static NSObject.== infix(_:_:)();

            if (v79) {
              goto LABEL_89;
            }
            if (v11 == 1) {
              goto LABEL_155;
            }
            if (v208)
            {
              uint64_t v80 = 1;
              while (1)
              {
                specialized _ArrayBuffer._getElementSlowPath(_:)();
                uint64_t v7 = v80 + 1;
                if (__OFADD__(v80, 1)) {
                  break;
                }
                char v81 = static NSObject.== infix(_:_:)();
                swift_unknownObjectRelease();
                if (v81) {
                  goto LABEL_89;
                }
                ++v80;
                if (v7 == v11) {
                  goto LABEL_155;
                }
              }
LABEL_206:
              __break(1u);
LABEL_207:
              __break(1u);
LABEL_208:
              __break(1u);
LABEL_209:
              __break(1u);
LABEL_210:
              __break(1u);
LABEL_211:
              __break(1u);
              goto LABEL_212;
            }
            uint64_t v140 = 5;
            do
            {
              uint64_t v141 = v140 - 3;
              if (__OFADD__(v140 - 4, 1)) {
                goto LABEL_210;
              }
              id v142 = *(id *)(v16 + 8 * v140);
              uint64_t v7 = static NSObject.== infix(_:_:)();

              if (v7) {
                goto LABEL_89;
              }
              ++v140;
            }
            while (v141 != v11);
LABEL_155:
            swift_bridgeObjectRelease();
            v143 = *(char **)(v9 + v204);
            id v144 = [*(id *)(v9 + v205) arrangedSubviews];
            sub_10003C374(0, (unint64_t *)&qword_1001858F0);
            unint64_t v145 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

            if (v145 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v146 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v146 = *(void *)((v145 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            swift_bridgeObjectRelease();
            sub_10009B4E4(v143, v146, 1);
            v147 = *(void (**)(uint64_t))&v143[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler];
            if (v147)
            {
              uint64_t v148 = swift_retain();
              v147(v148);
              sub_10003B0B8((uint64_t)v147);
            }
            uint64_t v138 = 0xD000000000000015;
            v139 = (void *)v196;
LABEL_160:
            uint64_t v149 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, v138, v139);
            sub_100048A50(5, v149, v150);
            swift_bridgeObjectRelease();
            LOBYTE(v222) = 1;
            sub_100048538(3, 0x100000000, 0, 1, 1, 0, 0);
            if (!*(void *)(v212 + v211)) {
              goto LABEL_170;
            }
LABEL_161:
            swift_beginAccess();
            id v151 = v43;
            goto LABEL_192;
          case 8uLL:
            unint64_t v235 = 6;
            v82 = v201;
            _OWORD *v201 = 0u;
            v82[1] = 0u;
            *((void *)v82 + 4) = 0;
            v236[40] = 2;
LABEL_11:
            sub_100070524(0);
            goto LABEL_12;
          case 9uLL:
          case 0xAuLL:
            uint64_t v38 = swift_allocObject();
            *(_OWORD *)(v38 + 16) = v206;
            v39 = (void *)qword_10018A3D8;
            *(void *)(v38 + 56) = sub_10003C374(0, (unint64_t *)&qword_1001832C0);
            *(void *)(v38 + 64) = sub_1000AAD54((unint64_t *)&qword_100184FF0, (unint64_t *)&qword_1001832C0);
            *(void *)(v38 + 32) = v39;
            id v40 = v39;
            v41 = (void *)static OS_os_log.default.getter();
            static os_log_type_t.default.getter();
            os_log(_:dso:log:type:_:)();
            swift_bridgeObjectRelease();

            goto LABEL_12;
          case 0xBuLL:
            id v83 = [v219 attributes];
            sub_10003AFD0((uint64_t *)&unk_100182E10);
            uint64_t v84 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            if (!*(void *)(v84 + 16))
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v24 = v214;
              id v73 = v221;
              goto LABEL_118;
            }
            unint64_t v87 = sub_10007D7FC(v85, v86);
            id v73 = v221;
            if ((v88 & 1) == 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
LABEL_117:
              uint64_t v24 = v214;
              goto LABEL_118;
            }
            uint64_t v89 = *(void *)(*(void *)(v84 + 56) + 8 * v87);
            swift_unknownObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v225[0] = v89;
            if ((swift_dynamicCast() & 1) == 0) {
              goto LABEL_117;
            }
            uint64_t v24 = v214;
            if (v222 == (void **)0x646F50656D6F48 && v223 == 0xE700000000000000) {
              goto LABEL_83;
            }
            char v128 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v128)
            {
LABEL_141:

              goto LABEL_15;
            }
LABEL_118:
            uint64_t v231 = 4;
            v110 = v199;
            _OWORD *v199 = 0u;
            v110[1] = 0u;
            *((void *)v110 + 4) = 0;
            v232[40] = 2;
LABEL_119:
            sub_100070524(0);

            goto LABEL_15;
          case 0xCuLL:
            if (v217 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
              id v43 = v221;
              if (!v11) {
                goto LABEL_175;
              }
            }
            else
            {
              uint64_t v11 = *(void *)(v209 + 16);
              swift_bridgeObjectRetain();
              id v43 = v221;
              if (!v11) {
                goto LABEL_175;
              }
            }
            if (v208) {
              id v90 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v90 = *(id *)(v16 + 32);
            }
            v91 = v90;
            uint64_t v9 = v212;
            sub_10003C374(0, (unint64_t *)&unk_100185900);
            char v92 = static NSObject.== infix(_:_:)();

            if (v92)
            {
LABEL_89:
              swift_bridgeObjectRelease();
LABEL_90:
              if (*(void *)(v9 + v211))
              {
LABEL_137:
                swift_beginAccess();
                swift_retain();
                v126 = (void *)sub_1000B8198(v43);
                swift_endAccess();

                swift_release();
              }
              else
              {
LABEL_170:
              }
LABEL_14:
              uint64_t v24 = v214;
LABEL_15:
              uint64_t v20 = v220 + 1;
              if (v220 + 1 == v24) {
                goto LABEL_214;
              }
              continue;
            }
            if (v11 == 1)
            {
LABEL_175:
              swift_bridgeObjectRelease();
              int DeviceClass = GestaltGetDeviceClass();
              if (DeviceClass == 3) {
                unint64_t v164 = 0xD00000000000001CLL;
              }
              else {
                unint64_t v164 = 0xD00000000000001DLL;
              }
              v165 = (void *)v195;
              if (DeviceClass == 3) {
                v165 = (void *)v193;
              }
              if (DeviceClass == 2) {
                uint64_t v166 = 0xD00000000000001CLL;
              }
              else {
                uint64_t v166 = v164;
              }
              if (DeviceClass == 2) {
                v167 = (void *)v194;
              }
              else {
                v167 = v165;
              }
              v168 = *(char **)(v212 + v204);
              id v169 = [*(id *)(v212 + v205) arrangedSubviews];
              sub_10003C374(0, (unint64_t *)&qword_1001858F0);
              unint64_t v170 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

              if (v170 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v171 = _CocoaArrayWrapper.endIndex.getter();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v171 = *(void *)((v170 & 0xFFFFFFFFFFFFFF8) + 0x10);
              }
              swift_bridgeObjectRelease();
              sub_10009B4E4(v168, v171, 1);
              v172 = *(void (**)(uint64_t))&v168[OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler];
              if (v172)
              {
                uint64_t v173 = swift_retain();
                v172(v173);
                sub_10003B0B8((uint64_t)v172);
              }
              uint64_t v174 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, v166, v167);
              sub_100048A50(5, v174, v175);
              swift_bridgeObjectRelease();
              LOBYTE(v222) = 1;
              sub_100048538(3, 0x100000000, 0, 1, 1, 0, 0);
              swift_bridgeObjectRelease();
              if (*(void *)(v212 + v211))
              {
                swift_beginAccess();
                id v151 = v221;
LABEL_192:
                v176 = v151;
                swift_retain();
                sub_1000B898C(v225, v176);
                swift_endAccess();
                swift_release();

                id v23 = (id)v225[0];
              }
              else
              {
LABEL_12:
                id v23 = v221;
              }

              goto LABEL_14;
            }
            if (v208)
            {
              uint64_t v111 = 1;
              while (1)
              {
                specialized _ArrayBuffer._getElementSlowPath(_:)();
                uint64_t v7 = v111 + 1;
                if (__OFADD__(v111, 1)) {
                  goto LABEL_208;
                }
                char v112 = static NSObject.== infix(_:_:)();
                swift_unknownObjectRelease();
                if (v112) {
                  goto LABEL_89;
                }
                ++v111;
                if (v7 == v11) {
                  goto LABEL_175;
                }
              }
            }
            uint64_t v160 = 5;
            while (1)
            {
              uint64_t v161 = v160 - 3;
              if (__OFADD__(v160 - 4, 1)) {
                break;
              }
              id v162 = *(id *)(v16 + 8 * v160);
              uint64_t v7 = static NSObject.== infix(_:_:)();

              if (v7) {
                goto LABEL_89;
              }
              ++v160;
              if (v161 == v11) {
                goto LABEL_175;
              }
            }
LABEL_212:
            __break(1u);
LABEL_213:
            swift_bridgeObjectRetain();
            uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (!v19) {
              goto LABEL_214;
            }
            break;
          default:
            static os_log_type_t.fault.getter();
            uint64_t v42 = swift_allocObject();
            *(_OWORD *)(v42 + 16) = v206;
            *(void *)(v42 + 56) = &type metadata for Int;
            *(void *)(v42 + 64) = &protocol witness table for Int;
            *(void *)(v42 + 32) = v27;
            os_log(_:dso:log:_:_:)();
            swift_bridgeObjectRelease();

            goto LABEL_14;
        }
        break;
      }
    }
  }
LABEL_214:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1000C8500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (!*(void *)&v4[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView])
  {
    uint64_t v40 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView;
    uint64_t v8 = swift_allocObject();
    *(unsigned char *)(v8 + 16) = 0;
    uint64_t v9 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x5452415453, (void *)0xE500000000000000);
    uint64_t v37 = v10;
    id v38 = (id)v9;
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = v8;
    v11[3] = a3;
    v11[4] = a4;
    uint64_t v12 = self;
    swift_retain();
    swift_retain();
    id v13 = [v12 defaultMetrics];
    uint64_t v14 = self;
    id v15 = [v14 systemFontOfSize:20.0];
    id v32 = [v13 scaledFontForFont:v15];

    uint64_t v16 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 1346980691, (void *)0xE400000000000000);
    uint64_t v18 = v17;
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v8;
    v19[3] = a3;
    v19[4] = a4;
    v19[5] = v5;
    swift_retain();
    swift_retain();
    uint64_t v31 = v5;
    id v20 = [v12 defaultMetrics];
    id v21 = [v14 systemFontOfSize:20.0];
    id v22 = [v20 scaledFontForFont:v21];

    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_100123B50;
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = sub_10004D9B4();
    *(void *)(v23 + 32) = a1;
    *(void *)(v23 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_100045FCC(0, 0, v23, 0xD000000000000016, (void *)0x8000000100130000);
    uint64_t v34 = v25;
    uint64_t v36 = v24;
    swift_bridgeObjectRelease();
    sub_10003AFD0(&qword_100184780);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1001240D0;
    *(void *)(v26 + 32) = v16;
    *(void *)(v26 + 40) = v18;
    *(void *)(v26 + 48) = v22;
    *(unsigned char *)(v26 + 56) = 6;
    *(void *)(v26 + 64) = sub_1000CACB0;
    *(void *)(v26 + 72) = v19;
    *(void *)(v26 + 80) = v38;
    *(void *)(v26 + 88) = v37;
    *(void *)(v26 + 96) = v32;
    *(unsigned char *)(v26 + 104) = 4;
    *(void *)(v26 + 112) = sub_1000CAC5C;
    *(void *)(v26 + 120) = v11;
    id v27 = objc_allocWithZone((Class)type metadata accessor for PromptView());
    swift_bridgeObjectRetain();
    id v39 = v22;
    swift_retain();
    swift_bridgeObjectRetain();
    id v28 = v32;
    swift_retain();
    id v29 = sub_1000827B4(10.0, v36, v34, 0, 0, 0, 0, v26, 0, 1, 1);
    id v30 = v29;
    if (!*(void *)&v5[v40])
    {
      *(void *)&v5[v40] = v29;
      sub_10009BC84(v29, *(void **)&v31[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView], 1);
    }
    swift_bridgeObjectRelease();

    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    swift_release();
  }
}

uint64_t sub_1000C8930(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = (unsigned char *)(a2 + 16);
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    unsigned char *v5 = 1;
    return a3(1);
  }
  return result;
}

void sub_1000C89B0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = (unsigned char *)(a2 + 16);
  swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    unsigned char *v5 = 1;
    a3(0);
    sub_1000C98CC();
  }
}

id sub_1000C8A44(uint64_t a1, uint64_t a2)
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v6 = result;
    int wapiCapability = MobileGestalt_get_wapiCapability();

    unsigned int v8 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isCheckerBoardActive");
    swift_unknownObjectRelease();
    if (v8)
    {
      uint64_t v36 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000017, (void *)0x800000010012BDB0);
      uint64_t v39 = v9;
      id v10 = [self defaultMetrics];
      id v11 = [self systemFontOfSize:20.0];
      id v12 = [v10 scaledFontForFont:v11];
      uint64_t v35 = sub_1000C8FC4;
    }
    else
    {
      if (byte_10018A379 == 1)
      {
        uint64_t v36 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000017, (void *)0x800000010012BDB0);
        uint64_t v39 = v13;
        id v10 = [self defaultMetrics];
        id v11 = [self systemFontOfSize:20.0];
        id v12 = [v10 scaledFontForFont:v11];
        uint64_t v14 = sub_1000C9008;
      }
      else
      {
        id v15 = "OPEN_WIFI_SETTINGS";
        if (wapiCapability) {
          id v15 = "OPEN_WLAN_SETTINGS";
        }
        uint64_t v36 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000012, (void *)((unint64_t)(v15 - 32) | 0x8000000000000000));
        uint64_t v39 = v16;
        id v10 = [self defaultMetrics];
        id v11 = [self systemFontOfSize:20.0];
        id v12 = [v10 scaledFontForFont:v11];
        uint64_t v14 = (void (*)())sub_100098E20;
      }
      uint64_t v35 = v14;
    }
    id v38 = v12;

    uint64_t v37 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 1346980691, (void *)0xE400000000000000);
    uint64_t v18 = v17;
    id v19 = [self defaultMetrics];
    id v20 = [self systemFontOfSize:20.0];
    id v21 = [v19 scaledFontForFont:v20];

    id v22 = (void *)swift_allocObject();
    v22[2] = v2;
    v22[3] = a1;
    v22[4] = a2;
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_100123B50;
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = sub_10004D9B4();
    *(void *)(v23 + 32) = a1;
    *(void *)(v23 + 40) = a2;
    swift_bridgeObjectRetain_n();
    uint64_t v24 = v2;
    if (wapiCapability) {
      uint64_t v25 = 0x5145525F4E414C57;
    }
    else {
      uint64_t v25 = 0x5145525F49464957;
    }
    uint64_t v26 = sub_100045FCC(0, 0, v23, v25, (void *)0xED00004445524955);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    sub_10003AFD0(&qword_100184780);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_1001240D0;
    *(void *)(v29 + 32) = v36;
    *(void *)(v29 + 40) = v39;
    *(void *)(v29 + 48) = v38;
    *(unsigned char *)(v29 + 56) = 7;
    *(void *)(v29 + 64) = v35;
    *(void *)(v29 + 72) = 0;
    *(void *)(v29 + 80) = v37;
    *(void *)(v29 + 88) = v18;
    *(void *)(v29 + 96) = v21;
    *(unsigned char *)(v29 + 104) = 7;
    *(void *)(v29 + 112) = sub_1000CABEC;
    *(void *)(v29 + 120) = v22;
    id v30 = objc_allocWithZone((Class)type metadata accessor for PromptView());
    swift_bridgeObjectRetain();
    id v31 = v38;
    swift_bridgeObjectRetain();
    id v32 = v21;
    swift_retain();
    id v33 = sub_1000827B4(10.0, v26, v28, 0, 0, 0, 0, v29, 1, 0, 2);
    uint64_t v34 = v33;
    if (!*(void *)&v24[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView])
    {
      *(void *)&v24[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView] = v33;
      sub_10009BC84(v33, *(void **)&v24[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView], 1);
    }

    swift_bridgeObjectRelease();
    swift_release();

    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000C8FC4()
{
}

void sub_1000C9008()
{
}

uint64_t sub_1000C9010(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = 0;
  uint64_t v35 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 1346980691, (void *)0xE400000000000000);
  uint64_t v36 = v6;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v5;
  v7[3] = v2;
  uint64_t v33 = a1;
  v7[4] = a1;
  v7[5] = a2;
  unsigned int v8 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  id v9 = v2;
  id v10 = [v8 defaultMetrics];
  id v11 = self;
  id v12 = [v11 systemFontOfSize:20.0];
  id v32 = [v10 scaledFontForFont:v12];

  uint64_t v30 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x4C45434E4143, (void *)0xE600000000000000);
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v5;
  *(void *)(v15 + 24) = v9;
  swift_retain();
  id v31 = (char *)v9;
  id v16 = [v8 defaultMetrics];
  id v17 = [v11 systemFontOfSize:20.0];
  id v18 = [v16 scaledFontForFont:v17];

  if (a2)
  {
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100123B50;
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 64) = sub_10004D9B4();
    *(void *)(v19 + 32) = v33;
    *(void *)(v19 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_100045FCC(0, 0, v19, 0x4955535F50494B53, (void *)0xEA00000000004554);
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v34 = sub_100045FCC(v33, 0, (uint64_t)_swiftEmptyArrayStorage, 0x4955535F50494B53, (void *)0xEA00000000004554);
    uint64_t v21 = v22;
  }
  sub_10003AFD0(&qword_100184780);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1001240D0;
  *(void *)(v23 + 32) = v30;
  *(void *)(v23 + 40) = v14;
  *(void *)(v23 + 48) = v18;
  *(unsigned char *)(v23 + 56) = 5;
  *(void *)(v23 + 64) = sub_1000CABA4;
  *(void *)(v23 + 72) = v15;
  *(void *)(v23 + 80) = v35;
  *(void *)(v23 + 88) = v36;
  *(void *)(v23 + 96) = v32;
  *(unsigned char *)(v23 + 104) = 6;
  *(void *)(v23 + 112) = sub_1000CAB58;
  *(void *)(v23 + 120) = v7;
  objc_allocWithZone((Class)type metadata accessor for PromptView());
  swift_bridgeObjectRetain();
  id v24 = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  id v25 = v32;
  swift_retain();
  id v26 = sub_1000827B4(10.0, v34, v21, 0, 0, 0, 0, v23, 0, 1, 3);
  uint64_t v27 = v26;
  uint64_t v28 = v31;
  if (!*(void *)&v31[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView])
  {
    *(void *)&v31[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView] = v26;
    sub_10009BC84(v26, *(void **)&v28[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView], 1);
  }

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

void sub_1000C9458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v8 = (unsigned char *)(a2 + 16);
  swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    unsigned char *v8 = 1;
    sub_1000C9568(1, a4, a5);
  }
}

void sub_1000C94E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (unsigned char *)(a2 + 16);
  swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    *uint64_t v3 = 1;
    sub_1000C9568(0, 0, 0);
  }
}

void sub_1000C9568(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a1)
  {
    if (a3)
    {
      sub_10003AFD0((uint64_t *)&unk_1001836E0);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_100123B50;
      *(void *)(v7 + 56) = &type metadata for String;
      *(void *)(v7 + 64) = sub_10004D9B4();
      *(void *)(v7 + 32) = a2;
      *(void *)(v7 + 40) = a3;
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100045FCC(0, 0, v7, 0x474E495050494B53, (void *)0xEE0045544955535FLL);
      uint64_t v10 = v9;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = sub_100045FCC(a2, 0, (uint64_t)_swiftEmptyArrayStorage, 0x474E495050494B53, (void *)0xEE0045544955535FLL);
      uint64_t v10 = v17;
    }
    id v18 = *(void **)(v4 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView);
    if (v18)
    {
      id v19 = v18;
      sub_100083A88(v8, v10);
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)(v4 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState);
    if (v20)
    {
      id v21 = [*(id *)(v20 + 40) serialNumber];
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v24 = v23;

      uint64_t v25 = v4 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_controller;
      swift_beginAccess();
      sub_1000CA448(v25, (uint64_t)v33);
      if (!v34)
      {
        swift_bridgeObjectRelease();
        sub_10003C44C((uint64_t)v33, (uint64_t *)&unk_1001858E0);
        return;
      }
      sub_100042A64((uint64_t)v33, (uint64_t)v32);
      sub_10003C44C((uint64_t)v33, (uint64_t *)&unk_1001858E0);
      uint64_t v26 = *sub_100042AC8(v32, v32[3]);
      swift_beginAccess();
      uint64_t v27 = *(void *)(v26 + 56);
      if (*(void *)(v27 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v28 = sub_10007D7FC(v22, v24);
        if (v29)
        {
          uint64_t v30 = *(void **)(*(void *)(v27 + 56) + 8 * v28);
          swift_unknownObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          [v30 idle];
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
LABEL_25:
          sub_100042B0C((uint64_t)v32);
          return;
        }
        swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v11 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView;
    id v12 = *(void **)(v3 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView);
    if (v12)
    {
      uint64_t v13 = *(void **)(v3 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView);
      id v31 = v12;
      sub_10009BC84(v13, v31, 1);
      uint64_t v14 = *(void **)(v3 + v11);
      *(void *)(v3 + v11) = 0;

      uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState);
      if (v15 && (*(unsigned char *)(v15 + 19) & 1) != 0)
      {
        *(unsigned char *)(v15 + 19) = 0;
        uint64_t v16 = *(void *)(v15 + 80);
        if ((v16 & 8) == 0) {
          *(void *)(v15 + 80) = v16 | 8;
        }
        swift_retain();
        sub_100059388();
        swift_release();
      }
    }
  }
}

void sub_1000C98CC()
{
  uint64_t v1 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView);
  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView);
    id v7 = v2;
    sub_10009BC84(v3, v7, 1);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = 0;

    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState);
    if (v5 && *(unsigned char *)(v5 + 19) == 1)
    {
      *(unsigned char *)(v5 + 19) = 0;
      uint64_t v6 = *(void *)(v5 + 80);
      if ((v6 & 8) == 0) {
        *(void *)(v5 + 80) = v6 | 8;
      }
      swift_retain();
      sub_100059388();
      swift_release();
    }
  }
}

uint64_t sub_1000C99BC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState);
  if (v1)
  {
    uint64_t v2 = result;
    id v3 = [*(id *)(v1 + 40) serialNumber];
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;

    uint64_t v7 = v2 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_controller;
    swift_beginAccess();
    sub_1000CA448(v7, (uint64_t)v14);
    if (!v15)
    {
      swift_bridgeObjectRelease();
      return sub_10003C44C((uint64_t)v14, (uint64_t *)&unk_1001858E0);
    }
    sub_100042A64((uint64_t)v14, (uint64_t)v13);
    sub_10003C44C((uint64_t)v14, (uint64_t *)&unk_1001858E0);
    uint64_t v8 = *sub_100042AC8(v13, v13[3]);
    swift_beginAccess();
    uint64_t v9 = *(void *)(v8 + 56);
    if (*(void *)(v9 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v10 = sub_10007D7FC(v4, v6);
      if (v11)
      {
        id v12 = *(void **)(*(void *)(v9 + 56) + 8 * v10);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        [v12 end];
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return sub_100042B0C((uint64_t)v13);
      }
      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRelease();
    return sub_100042B0C((uint64_t)v13);
  }
  return result;
}

void sub_1000C9B58(uint64_t a1)
{
  if (*(void *)(a1 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState))
  {
    id v1 = objc_allocWithZone((Class)type metadata accessor for HistoryTableViewController());
    uint64_t v2 = swift_retain();
    id v3 = sub_1000EC1A4(v2);
    id v6 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v3];

    id v4 = [self currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    if (v5 == (id)1) {
      [v6 setModalPresentationStyle:2];
    }
    [v6 scheduleModalPresentationWithPriority:0 animated:1 presentationCompletion:0];
    swift_release();
  }
}

id sub_1000C9C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_deviceInformationView;
  type metadata accessor for DeviceInformationView();
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  uint64_t v9 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView;
  type metadata accessor for TestRunnerView();
  *(void *)&v8[v9] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *(void *)&v8[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView] = 0;

  if (a3)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for CardViewSessionCell();
  id v11 = [super initWithStyle:a1 reuseIdentifier:v10];

  return v11;
}

id sub_1000C9DCC(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_deviceInformationView;
  type metadata accessor for DeviceInformationView();
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView;
  type metadata accessor for TestRunnerView();
  *(void *)&v5[v6] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *(void *)&v5[OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView] = 0;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for CardViewSessionCell();
  [super initWithCoder:a1];

  return v7;
}

void sub_1000C9EC0()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView);
}

id sub_1000C9F10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CardViewSessionCell();
  return [super dealloc];
}

uint64_t type metadata accessor for CardViewSessionCell()
{
  return self;
}

void sub_1000C9FC4(uint64_t a1, void *a2, char a3)
{
}

void sub_1000C9FF0(void *a1, char a2)
{
  if (a2)
  {
    id v9 = [a1 imageView];
    if (v9)
    {
      NSString v10 = v9;
      uint64_t v11 = *(void *)&v2[OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState];
      if (v11 && *(unsigned char *)(v11 + 32) == 4)
      {
        uint64_t v12 = swift_allocObject();
        *(void *)(v12 + 16) = v2;
        uint64_t v22 = v10;
        uint64_t v23 = v11;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        uint64_t v26 = sub_1000CAD94;
        uint64_t v27 = v12;
        char v28 = 1;
        objc_super v13 = v2;
        id v20 = v10;
        swift_retain();
        sub_100070524(0);
      }
      else
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v2;
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = v2;
        uint64_t v22 = v10;
        uint64_t v23 = v11;
        uint64_t v24 = sub_1000CA438;
        uint64_t v25 = v17;
        uint64_t v26 = sub_1000CA440;
        uint64_t v27 = v18;
        char v28 = 1;
        id v19 = v2;
        id v20 = v10;
        swift_retain();
        sub_100070524(0);
        swift_release();
      }
      swift_release();
      swift_release();
    }
  }
  else
  {
    if (qword_100182730 != -1) {
      swift_once();
    }
    if (*(unsigned char *)(qword_10018A350 + OBJC_IVAR____TtC11Diagnostics19SetupViewController_termsAndConditionsAccepted) == 1)
    {
      uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState];
      if (v3)
      {
        id v4 = [*(id *)(v3 + 40) serialNumber];
        uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v7 = v6;

        uint64_t v8 = (uint64_t)&v2[OBJC_IVAR____TtC11Diagnostics12CardViewCell_controller];
        swift_beginAccess();
        sub_1000CA448(v8, (uint64_t)&v22);
        if (v25)
        {
          sub_100042A64((uint64_t)&v22, (uint64_t)v21);
          sub_10003C44C((uint64_t)&v22, (uint64_t *)&unk_1001858E0);
          sub_100042AC8(v21, v21[3]);
          sub_1000B1FFC(v5, v7);
          swift_bridgeObjectRelease();
          sub_100042B0C((uint64_t)v21);
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_10003C44C((uint64_t)&v22, (uint64_t *)&unk_1001858E0);
        }
      }
    }
    else
    {
      sub_100041348(3, 0);
      sub_100041A98();
      sub_100041D34();
      id v14 = [self standardUserDefaults];
      NSString v15 = String._bridgeToObjectiveC()();
      unsigned int v16 = [v14 BOOLForKey:v15];

      if (!v16)
      {
        objc_msgSend(objc_msgSend(self, "currentPlatform"), "isInBoxUpdateModeActive");
        swift_unknownObjectRelease();
      }
      sub_100041348(4, 1);
      sub_100041940();
      if (qword_100182748 != -1) {
        swift_once();
      }
      sub_100053E48(2, 1);
    }
  }
}

uint64_t sub_1000CA400()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000CA438()
{
  return sub_1000C99BC(*(void *)(v0 + 16));
}

void sub_1000CA440()
{
  sub_1000C9B58(*(void *)(v0 + 16));
}

uint64_t sub_1000CA448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003AFD0((uint64_t *)&unk_1001858E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1000CA4B0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    sub_10003C374(0, (unint64_t *)&unk_100185900);
    sub_1000AAD54((unint64_t *)&qword_100184DE8, (unint64_t *)&unk_100185900);
    Set.Iterator.init(_cocoa:)();
    uint64_t v3 = v36;
    uint64_t v4 = v37;
    uint64_t v5 = v38;
    uint64_t v6 = v39;
    unint64_t v7 = v40;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v4 = a1 + 56;
    uint64_t v9 = ~v8;
    uint64_t v10 = -v8;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v7 = v11 & *(void *)(a1 + 56);
    uint64_t v5 = v9;
  }
  int64_t v32 = (unint64_t)(v5 + 64) >> 6;
  unint64_t v33 = a2 & 0xC000000000000001;
  uint64_t v31 = v3;
  uint64_t v30 = v4;
  if ((v3 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_31:
  if (!__CocoaSet.Iterator.next()()) {
    goto LABEL_57;
  }
  sub_10003C374(0, (unint64_t *)&unk_100185900);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v18 = v35;
  swift_unknownObjectRelease();
  uint64_t v14 = v6;
  uint64_t v12 = v7;
  if (!v35) {
    goto LABEL_57;
  }
  while (1)
  {
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v34 = v14;
      if (!v19) {
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v19 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v34 = v14;
      if (!v19) {
        goto LABEL_39;
      }
    }
    if (v33) {
      id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v20 = *(id *)(a2 + 32);
    }
    id v21 = v20;
    sub_10003C374(0, (unint64_t *)&unk_100185900);
    char v22 = static NSObject.== infix(_:_:)();

    if (v22)
    {

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    if (v19 != 1)
    {
      if (v33)
      {
        uint64_t v23 = 1;
        while (1)
        {
          specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v24 = v23 + 1;
          if (__OFADD__(v23, 1)) {
            break;
          }
          char v25 = static NSObject.== infix(_:_:)();
          swift_unknownObjectRelease();
          if (v25) {
            goto LABEL_52;
          }
          ++v23;
          if (v24 == v19) {
            goto LABEL_51;
          }
        }
        __break(1u);
      }
      else
      {
        uint64_t v26 = 5;
        while (1)
        {
          uint64_t v27 = v26 - 3;
          if (__OFADD__(v26 - 4, 1)) {
            break;
          }
          id v28 = *(id *)(a2 + 8 * v26);
          char v29 = static NSObject.== infix(_:_:)();

          if (v29)
          {
LABEL_52:

            swift_bridgeObjectRelease();
            uint64_t v6 = v34;
            unint64_t v7 = v12;
            uint64_t v4 = v30;
            uint64_t v3 = v31;
            if ((v31 & 0x8000000000000000) == 0) {
              goto LABEL_11;
            }
            goto LABEL_31;
          }
          ++v26;
          if (v27 == v19)
          {
LABEL_51:
            swift_bridgeObjectRelease();
            uint64_t v4 = v30;
            uint64_t v3 = v31;
            goto LABEL_40;
          }
        }
      }
      __break(1u);
LABEL_60:
      __break(1u);
      return;
    }
LABEL_39:
    swift_bridgeObjectRelease();
LABEL_40:
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
LABEL_10:
    uint64_t v6 = v34;
    unint64_t v7 = v12;
    if (v3 < 0) {
      goto LABEL_31;
    }
LABEL_11:
    if (!v7) {
      break;
    }
    uint64_t v12 = (v7 - 1) & v7;
    unint64_t v13 = __clz(__rbit64(v7)) | (v6 << 6);
    uint64_t v14 = v6;
LABEL_29:
    id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
    if (!v18) {
      goto LABEL_57;
    }
  }
  int64_t v15 = v6 + 1;
  if (__OFADD__(v6, 1)) {
    goto LABEL_60;
  }
  if (v15 >= v32) {
    goto LABEL_57;
  }
  unint64_t v16 = *(void *)(v4 + 8 * v15);
  uint64_t v14 = v6 + 1;
  if (v16) {
    goto LABEL_28;
  }
  uint64_t v14 = v6 + 2;
  if (v6 + 2 >= v32) {
    goto LABEL_57;
  }
  unint64_t v16 = *(void *)(v4 + 8 * v14);
  if (v16) {
    goto LABEL_28;
  }
  uint64_t v14 = v6 + 3;
  if (v6 + 3 >= v32) {
    goto LABEL_57;
  }
  unint64_t v16 = *(void *)(v4 + 8 * v14);
  if (v16) {
    goto LABEL_28;
  }
  uint64_t v14 = v6 + 4;
  if (v6 + 4 >= v32) {
    goto LABEL_57;
  }
  unint64_t v16 = *(void *)(v4 + 8 * v14);
  if (v16) {
    goto LABEL_28;
  }
  uint64_t v14 = v6 + 5;
  if (v6 + 5 >= v32) {
    goto LABEL_57;
  }
  unint64_t v16 = *(void *)(v4 + 8 * v14);
  if (v16)
  {
LABEL_28:
    uint64_t v12 = (v16 - 1) & v16;
    unint64_t v13 = __clz(__rbit64(v16)) + (v14 << 6);
    goto LABEL_29;
  }
  uint64_t v17 = v6 + 6;
  while (v32 != v17)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v17++);
    if (v16)
    {
      uint64_t v14 = v17 - 1;
      goto LABEL_28;
    }
  }
LABEL_57:
  sub_100046948();
}

uint64_t sub_1000CA940()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000CA980(uint64_t a1)
{
  sub_1000C6454(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000CA988(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000CA998()
{
  return swift_release();
}

uint64_t sub_1000CA9A0(uint64_t result)
{
  if (result != 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC11Diagnostics23DashboardViewController_cardManager)
             + OBJC_IVAR____TtC11Diagnostics11CardManager_persistentOnly) = 1;
    return sub_1000F7604();
  }
  return result;
}

uint64_t sub_1000CA9F8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000CAA30()
{
  sub_1000C5450(*(void *)(v0 + 16));
}

uint64_t sub_1000CAA38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModalPresentationCoordinator(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CAA9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10003AFD0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000CAB00()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000CAB10()
{
  swift_release();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000CAB58(uint64_t a1)
{
  sub_1000C9458(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1000CAB64()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000CABA4(uint64_t a1)
{
  sub_1000C94E8(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000CABAC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000CABEC()
{
  sub_1000C9568(1, *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000CAC1C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000CAC5C(uint64_t a1)
{
  return sub_1000C8930(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_1000CAC68()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000CACB0(uint64_t a1)
{
  sub_1000C89B0(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_1000CACBC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000CAD1C()
{
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000CADAC(void *a1)
{
  if (!a1) {
    goto LABEL_19;
  }
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = a1;
    id v5 = [v3 visibleViewController];
    sub_1000CADAC(v5);

    return;
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    unint64_t v7 = (void *)v6;
    id v8 = a1;
    id v9 = [v7 selectedViewController];
    if (v9)
    {
      id v10 = v9;
      id v11 = v9;
      sub_1000CADAC(v10);

LABEL_10:
      return;
    }
  }
  id v12 = [a1 presentedViewController];
  if (v12)
  {
    id v13 = v12;
    id v11 = v12;
    sub_1000CADAC(v13);
    goto LABEL_10;
  }
  id v14 = [a1 childViewControllers];
  sub_10005C46C();
  unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_18:
    swift_bridgeObjectRelease();
LABEL_19:
    id v20 = a1;
    return;
  }
LABEL_13:
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_16;
  }
  if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v16 = *(id *)(v15 + 32);
LABEL_16:
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    id v18 = v17;
    sub_1000CADAC(v17);

    return;
  }
  __break(1u);
}

uint64_t sub_1000CAFC0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000CE6B0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_1000CB18C(uint64_t result)
{
  uint64_t v4 = v2;
  uint64_t v5 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t result = __CocoaSet.count.getter();
    uint64_t v6 = result;
  }
  else
  {
    uint64_t v6 = *(void *)(result + 16);
  }
  if ((unint64_t)*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = v18 + v6;
    if (!__OFADD__(v18, v6)) {
      goto LABEL_6;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v6;
  if (__OFADD__(v7, v6)) {
    goto LABEL_21;
  }
LABEL_6:
  unint64_t v9 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v4 = v12;
    uint64_t v11 = v12 & 0xFFFFFFFFFFFFFF8;
  }
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t v14 = (*(void *)(v11 + 24) >> 1) - v13;
  uint64_t result = (uint64_t)sub_1000A0910(&v42, (void *)(v11 + 8 * v13 + 32), v14, v5);
  if (result < v6) {
    goto LABEL_22;
  }
  if (result >= 1)
  {
    uint64_t v15 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v16 = __OFADD__(v15, result);
    uint64_t v17 = v15 + result;
    if (v16)
    {
      __break(1u);
LABEL_29:
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_18;
      }
      sub_10003C374(0, (unint64_t *)&unk_100185900);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      char v22 = v41;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v22) {
          goto LABEL_18;
        }
        while (1)
        {
          uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
          if (v3 + 1 > *(void *)(v24 + 0x18) >> 1)
          {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
          }
          uint64_t v25 = *(void *)(v24 + 24) >> 1;
          if (v3 < v25) {
            break;
          }
LABEL_33:
          *(void *)(v24 + 16) = v3;
        }
        uint64_t v26 = v24 + 32;
        while (1)
        {
          *(void *)(v26 + 8 * v3++) = v22;
          int64_t v27 = v45;
          if (v42 < 0)
          {
            if (!__CocoaSet.Iterator.next()()) {
              goto LABEL_70;
            }
            sub_10003C374(0, (unint64_t *)&unk_100185900);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            char v22 = v41;
            swift_unknownObjectRelease();
            goto LABEL_45;
          }
          if (!v46) {
            break;
          }
          unint64_t v28 = (v46 - 1) & v46;
          unint64_t v29 = __clz(__rbit64(v46)) | (v45 << 6);
LABEL_41:
          char v22 = *(void **)(*(void *)(v42 + 48) + 8 * v29);
          id v30 = v22;
LABEL_42:
          int64_t v45 = v27;
          unint64_t v46 = v28;
LABEL_45:
          if (!v22)
          {
LABEL_70:
            *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v3;
            goto LABEL_18;
          }
          if (v3 >= v25)
          {
            uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_33;
          }
        }
        int64_t v31 = v45 + 1;
        if (__OFADD__(v45, 1))
        {
          __break(1u);
LABEL_94:
          char v22 = 0;
          unint64_t v20 = 0;
          int64_t v19 = v1;
LABEL_27:
          int64_t v45 = v19;
          unint64_t v46 = v20;
          continue;
        }
        break;
      }
      int64_t v32 = (unint64_t)(v44 + 64) >> 6;
      if (v31 >= v32)
      {
        char v22 = 0;
        unint64_t v28 = 0;
        goto LABEL_42;
      }
      unint64_t v33 = *(void *)(v43 + 8 * v31);
      if (!v33)
      {
        int64_t v34 = v45 + 2;
        if (v45 + 2 >= v32) {
          goto LABEL_67;
        }
        unint64_t v33 = *(void *)(v43 + 8 * v34);
        if (!v33)
        {
          int64_t v1 = v45 + 3;
          if (v45 + 3 >= v32) {
            goto LABEL_68;
          }
          unint64_t v33 = *(void *)(v43 + 8 * v1);
          if (v33)
          {
            int64_t v31 = v45 + 3;
            goto LABEL_51;
          }
          int64_t v34 = v45 + 4;
          if (v45 + 4 >= v32)
          {
            char v22 = 0;
            unint64_t v28 = 0;
            int64_t v27 = v45 + 3;
            goto LABEL_42;
          }
          unint64_t v33 = *(void *)(v43 + 8 * v34);
          if (!v33)
          {
            int64_t v31 = v45 + 5;
            if (v45 + 5 >= v32)
            {
LABEL_68:
              char v22 = 0;
              unint64_t v28 = 0;
              int64_t v27 = v34;
              goto LABEL_42;
            }
            unint64_t v33 = *(void *)(v43 + 8 * v31);
            if (!v33)
            {
              int64_t v31 = v32 - 1;
              uint64_t v35 = v45 + 6;
              while (v32 != v35)
              {
                unint64_t v33 = *(void *)(v43 + 8 * v35++);
                if (v33)
                {
                  int64_t v31 = v35 - 1;
                  goto LABEL_51;
                }
              }
LABEL_67:
              char v22 = 0;
              unint64_t v28 = 0;
              int64_t v27 = v31;
              goto LABEL_42;
            }
            goto LABEL_51;
          }
        }
        int64_t v31 = v34;
      }
LABEL_51:
      unint64_t v28 = (v33 - 1) & v33;
      unint64_t v29 = __clz(__rbit64(v33)) + (v31 << 6);
      int64_t v27 = v31;
      goto LABEL_41;
    }
    *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v17;
  }
  if (result != v14)
  {
LABEL_18:
    sub_100046948();
    return specialized Array._endMutation()();
  }
LABEL_23:
  uint64_t v3 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  int64_t v19 = v45;
  if (v42 < 0) {
    goto LABEL_29;
  }
  if (v46)
  {
    unint64_t v20 = (v46 - 1) & v46;
    unint64_t v21 = __clz(__rbit64(v46)) | (v45 << 6);
LABEL_26:
    char v22 = *(void **)(*(void *)(v42 + 48) + 8 * v21);
    id v23 = v22;
    goto LABEL_27;
  }
  int64_t v36 = v45 + 1;
  if (!__OFADD__(v45, 1))
  {
    int64_t v37 = (unint64_t)(v44 + 64) >> 6;
    if (v36 >= v37)
    {
      char v22 = 0;
      unint64_t v20 = 0;
      goto LABEL_27;
    }
    unint64_t v38 = *(void *)(v43 + 8 * v36);
    if (v38) {
      goto LABEL_75;
    }
    int64_t v39 = v45 + 2;
    if (v45 + 2 >= v37)
    {
LABEL_91:
      char v22 = 0;
      unint64_t v20 = 0;
      int64_t v19 = v36;
      goto LABEL_27;
    }
    unint64_t v38 = *(void *)(v43 + 8 * v39);
    if (v38) {
      goto LABEL_79;
    }
    int64_t v1 = v45 + 3;
    if (v45 + 3 < v37)
    {
      unint64_t v38 = *(void *)(v43 + 8 * v1);
      if (v38)
      {
        int64_t v36 = v45 + 3;
        goto LABEL_75;
      }
      int64_t v39 = v45 + 4;
      if (v45 + 4 >= v37) {
        goto LABEL_94;
      }
      unint64_t v38 = *(void *)(v43 + 8 * v39);
      if (v38)
      {
LABEL_79:
        int64_t v36 = v39;
LABEL_75:
        unint64_t v20 = (v38 - 1) & v38;
        unint64_t v21 = __clz(__rbit64(v38)) + (v36 << 6);
        int64_t v19 = v36;
        goto LABEL_26;
      }
      int64_t v36 = v45 + 5;
      if (v45 + 5 < v37)
      {
        unint64_t v38 = *(void *)(v43 + 8 * v36);
        if (!v38)
        {
          int64_t v36 = v37 - 1;
          uint64_t v40 = v45 + 6;
          do
          {
            if (v37 == v40) {
              goto LABEL_91;
            }
            unint64_t v38 = *(void *)(v43 + 8 * v40++);
          }
          while (!v38);
          int64_t v36 = v40 - 1;
        }
        goto LABEL_75;
      }
    }
    char v22 = 0;
    unint64_t v20 = 0;
    int64_t v19 = v39;
    goto LABEL_27;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000CB78C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_10009FE60(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *int64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000CB930(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *int64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *int64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000CEAF0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_1000CBAFC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (!v1) {
    return (uint64_t)v2;
  }
  uint64_t v35 = _swiftEmptyArrayStorage;
  sub_10005FBA8(0, v1, 0);
  uint64_t result = sub_1000CF0A4(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  int v25 = v5;
  uint64_t v26 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v10 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_26;
    }
    uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v6);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_10003C5D8(*(void *)(a1 + 56) + 32 * v6, (uint64_t)v32);
    v31[0] = v13;
    v31[1] = v12;
    *(void *)&long long v29 = v13;
    *((void *)&v29 + 1) = v12;
    sub_10003C5D8((uint64_t)v32, (uint64_t)v30);
    long long v27 = v29;
    v28[0] = v30[0];
    v28[1] = v30[1];
    swift_bridgeObjectRetain_n();
    sub_1000CF12C((uint64_t)v31);
    NSString v14 = String._bridgeToObjectiveC()();
    sub_10003C5D8((uint64_t)v28, (uint64_t)v33 + 8);
    *(void *)&v33[0] = v14;
    sub_1000CF12C((uint64_t)&v27);
    uint64_t v2 = v35;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_10005FBA8(0, v2[2] + 1, 1);
      uint64_t v2 = v35;
    }
    unint64_t v16 = v2[2];
    unint64_t v15 = v2[3];
    if (v16 >= v15 >> 1)
    {
      uint64_t result = sub_10005FBA8(v15 > 1, v16 + 1, 1);
      uint64_t v2 = v35;
    }
    v2[2] = v16 + 1;
    unint64_t v17 = &v2[5 * v16];
    long long v18 = v33[0];
    long long v19 = v33[1];
    v17[8] = v34;
    *((_OWORD *)v17 + 2) = v18;
    *((_OWORD *)v17 + 3) = v19;
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_27;
    }
    uint64_t v8 = a1 + 64;
    uint64_t v20 = *(void *)(v26 + 8 * v10);
    if ((v20 & (1 << v6)) == 0) {
      goto LABEL_28;
    }
    int v5 = v25;
    if (*(_DWORD *)(a1 + 36) != v25) {
      goto LABEL_29;
    }
    unint64_t v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      int64_t v9 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
    }
    else
    {
      unint64_t v22 = v10 + 1;
      unint64_t v23 = (unint64_t)(v9 + 63) >> 6;
      if (v10 + 1 < v23)
      {
        unint64_t v24 = *(void *)(v26 + 8 * v22);
        if (v24)
        {
LABEL_22:
          int64_t v9 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v10)
          {
            unint64_t v24 = *(void *)(a1 + 80 + 8 * v10++);
            if (v24)
            {
              unint64_t v22 = v10 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v1) {
      return (uint64_t)v2;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

id sub_1000CBDB4()
{
  sub_10003AFD0((uint64_t *)&unk_1001864E0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for UIButton.Configuration();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  int64_t v9 = (char *)&v36 - v8;
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_fontSizeBody] = 0x4034000000000000;
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_padding] = 0x4039000000000000;
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_safeAreaPadding] = 0x4030000000000000;
  uint64_t v10 = OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_titleAndLegalText;
  id v11 = objc_allocWithZone((Class)NSMutableAttributedString);
  uint64_t v12 = v0;
  *(void *)&v0[v10] = [v11 init];
  uint64_t v13 = &v12[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_legalTextRange];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_legalTextView;
  *(void *)&v12[v14] = [objc_allocWithZone((Class)UITextView) init];
  uint64_t v15 = OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_customButtonTray;
  *(void *)&v12[v15] = [objc_allocWithZone((Class)UIView) init];
  v12[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_buttonsShouldBeStacked] = 0;
  id v16 = [self defaultMetrics];
  id v17 = [self systemFontOfSize:20.0];
  id v18 = [v16 scaledFontForFont:v17];

  *(void *)&v12[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_buttonFont] = v18;
  id v19 = v18;
  static UIButton.Configuration.plain()();
  *(void *)(swift_allocObject() + 16) = v19;
  id v20 = v19;
  UIConfigurationTextAttributesTransformer.init(_:)();
  uint64_t v21 = type metadata accessor for UIConfigurationTextAttributesTransformer();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v2, 0, 1, v21);
  UIButton.Configuration.titleTextAttributesTransformer.setter();

  sub_10003C374(0, &qword_100182E70);
  unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v22(v7, v9, v3);
  *(void *)&v12[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_disagreeButton] = UIButton.init(configuration:primaryAction:)();
  v22(v7, v9, v3);
  *(void *)&v12[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_agreeButton] = UIButton.init(configuration:primaryAction:)();

  id v23 = sub_1000CF1E8(0xD000000000000010, 0x80000001001302D0);
  if (v23)
  {
    id v24 = v23;
  }
  else
  {
    NSString v25 = String._bridgeToObjectiveC()();
    id v26 = [self systemImageNamed:v25];

    if (v26)
    {
      id v27 = [self configurationPreferringMulticolor];
      id v24 = [v26 imageWithConfiguration:v27];
    }
    else
    {
      id v24 = 0;
    }
  }
  if ([self isSSRBootIntentSet])
  {
    sub_100045FCC(0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0xD00000000000001FLL, (void *)0x8000000100130310);
  }
  else
  {
    uint64_t v28 = 0x474149445F4E5552;
    long long v29 = (void *)0xEF53434954534F4ELL;
    uint64_t v37 = 0x474149445F4E5552;
    unint64_t v38 = 0xEF53434954534F4ELL;
    unsigned int v30 = [self currentPlatform].isCheckerBoardActive;
    swift_unknownObjectRelease();
    if (v30)
    {
      v31._countAndFlagsBits = 4342623;
      v31._object = (void *)0xE300000000000000;
      String.append(_:)(v31);
      uint64_t v28 = v37;
      long long v29 = (void *)v38;
    }
    sub_100045FCC(0, 0, (uint64_t)&_swiftEmptyArrayStorage, v28, v29);
    swift_bridgeObjectRelease();
  }
  NSString v32 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v33 = (objc_class *)type metadata accessor for TermsAndConditionsViewController();
  v36.receiver = v12;
  v36.super_class = v33;
  id v34 = [super initWithTitle:v32 detailText:0 icon:v24 contentLayout:3];

  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v34;
}

void sub_1000CC454()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10003AFD0((uint64_t *)&unk_100182E60);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [v0 view];
  if (!v5) {
    goto LABEL_27;
  }
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = [v7 systemBackgroundColor];
  [v6 setBackgroundColor:v8];

  int64_t v9 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_customButtonTray];
  id v69 = v7;
  id v10 = [v7 systemBackgroundColor];
  [v9 setBackgroundColor:v10];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_legalTextView];
  [v11 setContentOffset:0, 0.0, 0.0];
  id v12 = [self currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  if (v13 == (id)6)
  {
    uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_agreeButton];
    sub_10003C374(0, &qword_100182E78);
    static UIShape.capsule.getter();
    uint64_t v15 = type metadata accessor for UIShape();
    id v16 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    v16(v4, 0, 1, v15);
    id v17 = (void *)UIHoverStyle.init(shape:)();
    [v14 setHoverStyle:v17];

    id v18 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_disagreeButton];
    static UIShape.capsule.getter();
    v16(v4, 0, 1, v15);
    id v19 = (void *)UIHoverStyle.init(shape:)();
    [v18 setHoverStyle:v19];
  }
  id v20 = [objc_allocWithZone((Class)NSMutableParagraphStyle) init];
  [v20 setAlignment:1];
  [v20 setParagraphSpacingBefore:25.0];
  id v21 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  unint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_titleAndLegalText];
  id v23 = [v22 length];
  id v68 = self;
  unsigned int v24 = objc_msgSend(objc_msgSend(v68, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if (v24)
  {
    NSString v25 = (void *)0x8000000100130240;
    uint64_t v26 = 0xD000000000000017;
  }
  else
  {
    uint64_t v26 = 0xD00000000000001ALL;
    NSString v25 = (void *)0x8000000100130200;
  }
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, v26, v25);
  sub_10003AFD0(&qword_1001859B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001240D0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v28;
  *(void *)(inited + 72) = sub_10003C374(0, &qword_1001859C0);
  *(void *)(inited + 48) = v20;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v29;
  *(void *)(inited + 120) = sub_10003C374(0, &qword_1001859A0);
  *(void *)(inited + 96) = v21;
  id v71 = v20;
  id v70 = v21;
  unint64_t v30 = sub_100078538(inited);
  if (*(void *)(sub_1000CBAFC(v30) + 16))
  {
    sub_10003AFD0((uint64_t *)&unk_100186620);
    Swift::String v31 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    Swift::String v31 = _swiftEmptyDictionarySingleton;
  }
  unint64_t v72 = v31;
  uint64_t v32 = swift_bridgeObjectRetain();
  sub_1000CE30C(v32, 1, &v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v33 = objc_allocWithZone((Class)NSMutableAttributedString);
  NSString v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1000CE2B4();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  id v36 = [v33 initWithString:v34 attributes:isa];

  [v22 appendAttributedString:v36];
  uint64_t v37 = [v22 length];
  if (__OFSUB__(v37, v23))
  {
    __break(1u);
LABEL_27:
    __break(1u);
    swift_unexpectedError();
    __break(1u);
    return;
  }
  unint64_t v38 = &v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_legalTextRange];
  *unint64_t v38 = v23;
  v38[1] = v37 - v23;
  id v39 = v69;
  id v40 = [v69 clearColor];
  [v11 setBackgroundColor:v40];

  id v41 = [v11 textContainer];
  [v41 lineFragmentPadding];
  double v43 = v42;

  [v11 setTextContainerInset:0.0, -v43, 0.0, 0.0];
  [v11 setEditable:0];
  unsigned __int8 v44 = objc_msgSend(objc_msgSend(v68, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if ((v44 | byte_10018A379)) {
    uint64_t v45 = 0;
  }
  else {
    uint64_t v45 = 2;
  }
  [v11 setDataDetectorTypes:v45];
  [v11 _setInteractiveTextSelectionDisabled:1];
  [v11 setScrollEnabled:0];
  [v11 setAttributedText:v22];
  id v46 = [v39 labelColor];
  [v11 setTextColor:v46];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v47 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x4545524741534944, (void *)0xE800000000000000);
  uint64_t v49 = v48;
  uint64_t v50 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x4545524741, (void *)0xE500000000000000);
  uint64_t v52 = v51;
  id v53 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_disagreeButton];
  NSString v54 = String._bridgeToObjectiveC()();
  [v53 setTitle:v54 forState:0];

  uint64_t v55 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_agreeButton];
  NSString v56 = String._bridgeToObjectiveC()();
  [v55 setTitle:v56 forState:0];

  LOBYTE(v50) = sub_1000CDEE8(v47, v49, v50, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v57 = 0;
  uint64_t v58 = OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_buttonsShouldBeStacked;
  v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_buttonsShouldBeStacked] = v50 & 1;
  if ((v50 & 1) == 0)
  {
    if (objc_msgSend(self, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v53, "semanticContentAttribute")))
    {
      id v59 = [self sharedApplication];
      id v60 = [v59 preferredContentSizeCategory];

      LOBYTE(v59) = UIContentSizeCategory.isAccessibilityCategory.getter();
      if (v59) {
        uint64_t v57 = 1;
      }
      else {
        uint64_t v57 = 2;
      }
    }
    else
    {
      uint64_t v57 = 1;
    }
  }
  [v53 setContentHorizontalAlignment:v57];
  sub_10003C374(0, (unint64_t *)&qword_1001831A8);
  *(void *)(swift_allocObject() + 16) = v1;
  uint64_t v61 = v1;
  id v62 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  [v53 addAction:v62 forControlEvents:64];

  [v53 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v63 = 0;
  if ((v1[v58] & 1) == 0)
  {
    if (objc_msgSend(self, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v55, "semanticContentAttribute"))|| (id v64 = objc_msgSend(self, "sharedApplication"), v65 = objc_msgSend(v64, "preferredContentSizeCategory"), v64, LOBYTE(v64) = UIContentSizeCategory.isAccessibilityCategory.getter(), v65, (v64 & 1) != 0))
    {
      uint64_t v63 = 1;
    }
    else
    {
      uint64_t v63 = 2;
    }
  }
  [v55 setContentHorizontalAlignment:v63];
  *(void *)(swift_allocObject() + 16) = v61;
  char v66 = v61;
  v67 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  [v55 addAction:v67 forControlEvents:64];

  [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
}

void sub_1000CCF88()
{
  unsigned int v0 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if (v0)
  {
    sub_100070524(1);
  }
  else
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      *(unsigned char *)(Strong + OBJC_IVAR____TtC11Diagnostics19SetupViewController_termsAndConditionsAccepted) = 0;
      sub_100035968();
      swift_unknownObjectRelease();
    }
  }
  uint64_t v2 = self;
  sub_1000783F4((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 sendAnalyticsWithEvent:12 payloadDict:isa];
}

void sub_1000CD0C8()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    *(unsigned char *)(Strong + OBJC_IVAR____TtC11Diagnostics19SetupViewController_termsAndConditionsAccepted) = 1;
    sub_100035968();
    swift_unknownObjectRelease();
  }
  uint64_t v1 = self;
  sub_1000783F4((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 sendAnalyticsWithEvent:11 payloadDict:isa];
}

void sub_1000CD19C()
{
  id v1 = [v0 contentView];
  [v1 addSubview:*(void *)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_legalTextView]];

  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_customButtonTray];
  [v2 addSubview:*(void *)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_disagreeButton]];
  [v2 addSubview:*(void *)&v0[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_agreeButton]];
  id v3 = [v0 view];
  if (v3)
  {
    id v4 = v3;
    [v3 addSubview:v2];
  }
  else
  {
    __break(1u);
  }
}

void sub_1000CD280()
{
  id v1 = v0;
  uint64_t v2 = self;
  id v3 = [v2 currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1
    || (id v5 = [v2 currentDevice],
        id v6 = [v5 userInterfaceIdiom],
        v5,
        double v7 = 25.0,
        v6 == (id)6))
  {
    id v8 = [self sharedApplication];
    sub_100046500();
    double v10 = v9;

    double v7 = v10 * 0.2;
  }
  id v11 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_agreeButton];
  [v11 intrinsicContentSize];
  double v13 = v12;
  [v11 intrinsicContentSize];
  double v15 = v14;
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100125E80;
  id v17 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_legalTextView];
  id v18 = [v17 topAnchor];
  id v19 = [v1 contentView];
  id v20 = [v19 safeAreaLayoutGuide];

  id v21 = [v20 topAnchor];
  id v22 = [v18 constraintEqualToAnchor:v21 constant:25.0];

  *(void *)(v16 + 32) = v22;
  id v23 = [v17 bottomAnchor];
  id v24 = [v1 contentView];
  id v25 = [v24 bottomAnchor];

  id v26 = [v1 view];
  if (!v26)
  {
    __break(1u);
    goto LABEL_28;
  }
  id v27 = v26;
  [v26 safeAreaInsets];
  double v29 = v28;

  id v30 = [v23 constraintEqualToAnchor:v25 constant:-(v15 + v29 + 25.0)];
  *(void *)(v16 + 40) = v30;
  id v31 = [v17 leadingAnchor];
  id v32 = [v1 contentView];
  id v33 = [v32 leadingAnchor];

  id v34 = [v31 constraintEqualToAnchor:v33 constant:v7];
  *(void *)(v16 + 48) = v34;
  id v35 = [v17 trailingAnchor];
  id v36 = [v1 contentView];
  id v37 = [v36 trailingAnchor];

  id v38 = [v35 constraintEqualToAnchor:v37 constant:-v7];
  *(void *)(v16 + 56) = v38;
  id v39 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_customButtonTray];
  id v40 = [v39 bottomAnchor];
  id v41 = [v1 view];
  if (!v41)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  double v42 = v41;
  id v43 = [v41 bottomAnchor];

  id v44 = [v40 constraintEqualToAnchor:v43];
  *(void *)(v16 + 64) = v44;
  id v45 = [v39 leadingAnchor];
  id v46 = [v1 view];
  if (!v46)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v47 = v46;
  id v48 = [v46 leadingAnchor];

  id v49 = [v45 constraintEqualToAnchor:v48];
  *(void *)(v16 + 72) = v49;
  id v50 = [v39 trailingAnchor];
  id v51 = [v1 view];
  v108 = v1;
  if (v51)
  {
    uint64_t v52 = v51;
    id v53 = [v51 trailingAnchor];

    id v54 = [v50 constraintEqualToAnchor:v53];
    *(void *)(v16 + 80) = v54;
    specialized Array._endMutation()();
    unint64_t v107 = v16;
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100124770;
    id v56 = [v11 topAnchor];
    id v57 = [v39 topAnchor];
    id v58 = [v56 constraintEqualToAnchor:v57];

    uint64_t v105 = v58;
    *(void *)(inited + 32) = v58;
    id v59 = [v11 widthAnchor];
    id v60 = [v39 widthAnchor];
    id v61 = [v59 constraintEqualToAnchor:v60 multiplier:1.0];

    v104 = v61;
    *(void *)(inited + 40) = v61;
    id v62 = *(void **)&v108[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_disagreeButton];
    id v63 = [v62 topAnchor];
    id v64 = [v39 topAnchor];
    id v65 = [v63 constraintEqualToAnchor:v64 constant:v15 + -16.0];

    id v103 = v65;
    *(void *)(inited + 48) = v65;
    uint64_t v66 = inited;
    id v67 = [v62 widthAnchor];
    id v68 = [v39 widthAnchor];
    id v69 = [v67 constraintEqualToAnchor:v68 multiplier:1.0];

    v102 = v69;
    *(void *)(v66 + 56) = v69;
    id v70 = [v39 heightAnchor];
    id v71 = [v70 constraintGreaterThanOrEqualToConstant:v15 + v15];

    v106 = v71;
    *(void *)(v66 + 64) = v71;
    unint64_t v72 = swift_initStackObject();
    *(_OWORD *)(v72 + 16) = xmmword_100125E80;
    id v73 = [v62 topAnchor];
    id v74 = [v39 topAnchor];
    id v75 = [v73 constraintEqualToAnchor:v74];

    *(void *)(v72 + 32) = v75;
    id v76 = [v62 leadingAnchor];
    id v77 = [v39 leadingAnchor];
    id v78 = [v76 constraintEqualToAnchor:v77 constant:16.0];

    *(void *)(v72 + 40) = v78;
    id v79 = [v62 widthAnchor];
    id v80 = [v79 constraintGreaterThanOrEqualToConstant:v13];

    *(void *)(v72 + 48) = v80;
    id v81 = [v11 topAnchor];
    id v82 = [v39 topAnchor];
    id v83 = [v81 constraintEqualToAnchor:v82];

    *(void *)(v72 + 56) = v83;
    id v84 = [v11 trailingAnchor];
    id v85 = [v39 trailingAnchor];
    id v86 = [v84 constraintEqualToAnchor:v85 constant:-16.0];

    *(void *)(v72 + 64) = v86;
    id v87 = [v11 widthAnchor];
    id v88 = [v87 constraintGreaterThanOrEqualToConstant:v13];

    *(void *)(v72 + 72) = v88;
    id v89 = [v39 heightAnchor];
    id v90 = [v89 constraintGreaterThanOrEqualToConstant:v15 + 32.0];

    *(void *)(v72 + 80) = v90;
    specialized Array._endMutation()();
    if (v108[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_buttonsShouldBeStacked] != 1)
    {
      swift_release();
      sub_1000CAFC0(v72);
LABEL_22:
      id v98 = self;
      sub_10003C374(0, (unint64_t *)&qword_1001831A0);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v98 activateConstraints:isa];

      return;
    }
    swift_bridgeObjectRelease();
    if (v107 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v100 = _CocoaArrayWrapper.endIndex.getter();
      BOOL v101 = __OFADD__(v100, 5);
      uint64_t v92 = v100 + 5;
      if (!v101)
      {
LABEL_11:
        sub_1000CEF34(v92);
        specialized Array._endMutation()();
        id v93 = v105;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_12:
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          id v94 = v104;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          id v95 = v103;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          id v96 = v102;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          id v97 = v106;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          swift_release();
          swift_bridgeObjectRelease();
          goto LABEL_22;
        }
LABEL_26:
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v91 = *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v92 = v91 + 5;
      if (!__OFADD__(v91, 5)) {
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_26;
  }
LABEL_30:
  __break(1u);
}

BOOL sub_1000CDEE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL result = 0;
  if (a2)
  {
    if (a4)
    {
      id v6 = *(id *)(v4 + OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_buttonFont);
      NSString v7 = String._bridgeToObjectiveC()();
      sub_10003AFD0(&qword_100183BE8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100123B50;
      *(void *)(inited + 32) = NSFontAttributeName;
      uint64_t v9 = sub_10003C374(0, &qword_1001859A0);
      *(void *)(inited + 64) = v9;
      *(void *)(inited + 40) = v6;
      id v10 = v6;
      id v11 = NSFontAttributeName;
      sub_100078670(inited);
      type metadata accessor for Key(0);
      sub_1000CE2B4();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v7 sizeWithAttributes:isa];
      double v14 = v13;

      NSString v15 = String._bridgeToObjectiveC()();
      uint64_t v16 = swift_initStackObject();
      *(_OWORD *)(v16 + 16) = xmmword_100123B50;
      *(void *)(v16 + 64) = v9;
      *(void *)(v16 + 32) = v11;
      *(void *)(v16 + 40) = v10;
      id v17 = v10;
      id v18 = v11;
      sub_100078670(v16);
      Class v19 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v15 sizeWithAttributes:v19];
      double v21 = v20;

      double v22 = v14 + v21 + 100.0;
      id v23 = [self mainScreen];
      [v23 bounds];
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;

      v33.origin.x = v25;
      v33.origin.y = v27;
      v33.size.width = v29;
      v33.size.height = v31;
      double Width = CGRectGetWidth(v33);

      return Width < v22;
    }
  }
  return result;
}

id sub_1000CE1C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TermsAndConditionsViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for TermsAndConditionsViewController()
{
  return self;
}

unint64_t sub_1000CE2B4()
{
  unint64_t result = qword_100182B68;
  if (!qword_100182B68)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100182B68);
  }
  return result;
}

uint64_t sub_1000CE30C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_1000CF03C(a1 + 32, (uint64_t)&v40);
  uint64_t v7 = v40;
  double v42 = (void *)v40;
  sub_100078AC4(v41, v39);
  id v8 = (void *)*a3;
  unint64_t v10 = sub_10007D988(v7);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12)) {
    goto LABEL_23;
  }
  char v14 = v9;
  if (v8[3] >= v13)
  {
    if (a2)
    {
      if (v9) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_1000FF4EC();
      if (v14) {
        goto LABEL_10;
      }
    }
LABEL_13:
    Class v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(void *)(v19[6] + 8 * v10) = v7;
    sub_100078AC4(v39, (_OWORD *)(v19[7] + 32 * v10));
    uint64_t v20 = v19[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v22;
    uint64_t v23 = v4 - 1;
    if (!v23) {
      return swift_bridgeObjectRelease_n();
    }
    for (uint64_t i = a1 + 72; ; i += 40)
    {
      sub_1000CF03C(i, (uint64_t)&v40);
      uint64_t v25 = v40;
      double v42 = (void *)v40;
      sub_100078AC4(v41, v39);
      double v26 = (void *)*a3;
      unint64_t v27 = sub_10007D988(v25);
      uint64_t v29 = v26[2];
      BOOL v30 = (v28 & 1) == 0;
      BOOL v21 = __OFADD__(v29, v30);
      uint64_t v31 = v29 + v30;
      if (v21) {
        break;
      }
      char v32 = v28;
      if (v26[3] < v31)
      {
        sub_1000FD724(v31, 1);
        unint64_t v27 = sub_10007D988(v25);
        if ((v32 & 1) != (v33 & 1)) {
          goto LABEL_25;
        }
      }
      if (v32) {
        goto LABEL_10;
      }
      id v34 = (void *)*a3;
      *(void *)(*a3 + 8 * (v27 >> 6) + 64) |= 1 << v27;
      *(void *)(v34[6] + 8 * v27) = v25;
      sub_100078AC4(v39, (_OWORD *)(v34[7] + 32 * v27));
      uint64_t v35 = v34[2];
      BOOL v21 = __OFADD__(v35, 1);
      uint64_t v36 = v35 + 1;
      if (v21) {
        goto LABEL_24;
      }
      v34[2] = v36;
      if (!--v23) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1000FD724(v13, a2 & 1);
  unint64_t v15 = sub_10007D988(v7);
  if ((v14 & 1) == (v16 & 1))
  {
    unint64_t v10 = v15;
    if ((v14 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_10003AFD0(&qword_100185690);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_100042B0C((uint64_t)v39);
      id v18 = v42;
      swift_bridgeObjectRelease();

      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  type metadata accessor for Key(0);
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v37._object = (void *)0x8000000100130280;
  v37._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v37);
  type metadata accessor for Key(0);
  _print_unlocked<A, B>(_:_:)();
  v38._countAndFlagsBits = 39;
  v38._object = (void *)0xE100000000000000;
  String.append(_:)(v38);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000CE6B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000CF18C(&qword_1001859B0, &qword_1001859A8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10003AFD0(&qword_1001859A8);
          BOOL v12 = sub_1000CED10(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10003C374(0, (unint64_t *)&qword_1001831A0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000CE8D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000CF18C(&qword_1001859E8, &qword_1001859E0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10003AFD0(&qword_1001859E0);
          BOOL v12 = sub_1000CED7C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10003C374(0, &qword_100186210);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000CEAF0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000CF18C(&qword_1001859D8, &qword_1001859D0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10003AFD0(&qword_1001859D0);
          BOOL v12 = sub_1000CED10(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10003C374(0, (unint64_t *)&unk_100185900);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*sub_1000CED10(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000CEE2C(v6, a2, a3);
  return sub_1000CED78;
}

uint64_t (*sub_1000CED7C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000CEEAC(v6, a2, a3);
  return sub_1000CED78;
}

void sub_1000CEDE4(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1000CEE2C(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  id v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)id v3 = v4;
    return sub_1000CF1E4;
  }
  __break(1u);
  return result;
}

void (*sub_1000CEEAC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  id v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)id v3 = v4;
    return sub_1000CEF2C;
  }
  __break(1u);
  return result;
}

void sub_1000CEF2C(id *a1)
{
}

uint64_t sub_1000CEF34(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    *id v1 = result;
  }
  return result;
}

uint64_t sub_1000CEFF4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000CF02C()
{
}

void sub_1000CF034()
{
}

uint64_t sub_1000CF03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003AFD0(&qword_100183BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CF0A4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1000CF12C(uint64_t a1)
{
  uint64_t v2 = sub_10003AFD0(&qword_1001859C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000CF18C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10003B070(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1000CF1E8(uint64_t a1, unint64_t a2)
{
  sub_10003AFD0(&qword_100185000);
  __chkstk_darwin();
  char v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self currentDevice];
  id v34 = [v6 userInterfaceIdiom];

  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v5, 1, 1, v7);
  swift_bridgeObjectRetain();
  uint64_t v32 = a1;
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    uint64_t v11 = v12;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  id v13 = [objc_allocWithZone((Class)IFSymbol) initWithSymbolName:v9 bundleURL:v11];

  id v14 = [objc_allocWithZone((Class)IFGraphicSymbolDescriptor) init];
  sub_10003AFD0(&qword_100183BE0);
  uint64_t v15 = swift_allocObject();
  long long v33 = xmmword_100123B50;
  *(_OWORD *)(v15 + 16) = xmmword_100123B50;
  id v16 = [objc_allocWithZone((Class)IFColor) initWithSystemColor:11];
  uint64_t v17 = sub_10003C374(0, &qword_1001859F0);
  *(void *)(v15 + 56) = v17;
  *(void *)(v15 + 32) = v16;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v14 setSymbolColors:isa];

  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = v33;
  id v20 = [objc_allocWithZone((Class)IFColor) initWithSystemColor:7];
  *(void *)(v19 + 56) = v17;
  *(void *)(v19 + 32) = v20;
  Class v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v14 setEnclosureColors:v21];

  [v14 setRenderingMode:3];
  double v22 = 85.0;
  if (v34 == (id)1) {
    double v22 = 60.0;
  }
  [v14 setSize:v22, v22];
  id v23 = [v13 imageForGraphicSymbolDescriptor:v14];
  if (!v23)
  {
    os_log_type_t v28 = static os_log_type_t.error.getter();
    sub_10003C374(0, (unint64_t *)&qword_1001832C0);
    swift_bridgeObjectRetain_n();
    uint64_t v29 = static OS_os_log.default.getter();
    if (os_log_type_enabled(v29, v28))
    {
      BOOL v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)BOOL v30 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_10004DAA8(v32, a2, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v28, "Unable to create image for symbol %s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v27 = [objc_allocWithZone((Class)UIImage) init];
    goto LABEL_12;
  }
  id v24 = v23;
  id result = [v23 CGImage];
  if (result)
  {
    id v26 = result;
    id v27 = [objc_allocWithZone((Class)UIImage) initWithCGImage:result];

    id v13 = v24;
    id v14 = v26;
LABEL_12:

    return v27;
  }
  __break(1u);
  return result;
}

id sub_1000CF878()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseView();
  return [super dealloc];
}

uint64_t type metadata accessor for BaseView()
{
  return self;
}

void sub_1000CF8D0()
{
  unint64_t v1 = v0;
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for DeviceSelector();
  [super viewDidLoad];
  id v2 = [v0 view];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [self systemBackgroundColor];
    [v3 setBackgroundColor:v4];

    sub_1000CFD08();
    sub_1000D07FC();
    sub_10003C374(0, (unint64_t *)&qword_1001832C0);
    char v5 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    id v6 = [self sharedInstance];
    [v6 start];
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v1;
    v10[4] = sub_1000D29C4;
    v10[5] = v7;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_1000CFC3C;
    v10[3] = &unk_100152F80;
    uint64_t v8 = _Block_copy(v10);
    id v9 = v1;
    swift_release();
    [v6 discoverDevicesWithCompletion:v8];
    _Block_release(v8);
  }
  else
  {
    __break(1u);
  }
}

id sub_1000CFABC(uint64_t a1, void *a2)
{
  sub_10003C374(0, (unint64_t *)&qword_1001832C0);
  uint64_t v3 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  id v4 = a2;
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = (unint64_t)sub_1000D29CC(v5, (uint64_t)v4);
  swift_bridgeObjectRelease();

  if (!(v6 >> 62))
  {
    if (*(uint64_t *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v9 >= 1)
  {
LABEL_3:
    uint64_t v7 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
  }
LABEL_4:
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection] = v6;
  swift_bridgeObjectRelease();
  id result = *(id *)&v4[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView];
  if (result)
  {
    return [result reloadData];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000CFC3C(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_10003C374(0, &qword_100185AE0);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_1000CFD08()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_10003AFD0((uint64_t *)&unk_1001864E0);
  __chkstk_darwin(v2 - 8);
  v104 = (char *)&v100 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for UIButton.Configuration();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v100 - v9;
  id v11 = [objc_allocWithZone((Class)UIView) init];
  uint64_t v12 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_headerView;
  id v13 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_headerView];
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_headerView] = v11;

  id v14 = *(void **)&v0[v12];
  if (!v14)
  {
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v15 = self;
  id v16 = v14;
  id v105 = v15;
  id v17 = [v15 systemBackgroundColor];
  [v16 setBackgroundColor:v17];

  id v18 = [v1 view];
  if (!v18)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (!*(void *)&v1[v12])
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v19 = v18;
  BOOL v101 = v10;
  uint64_t v102 = v5;
  uint64_t v103 = v4;
  [v18 addSubview:];

  id v20 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v21 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_titleLabel;
  double v22 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_titleLabel];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_titleLabel] = v20;

  id v23 = *(void **)&v1[v21];
  if (!v23)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  id v24 = v23;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000019, (void *)0x80000001001304E0);
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v24 setText:v25];

  id v26 = *(void **)&v1[v21];
  if (!v26)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  [v26 setTextAlignment:1];
  id v27 = *(void **)&v1[v21];
  if (!v27)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v100 = v8;
  id v28 = v27;
  id v29 = [v105 systemBackgroundColor];
  [v28 setBackgroundColor:v29];

  BOOL v30 = *(void **)&v1[v21];
  if (!v30)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v31 = self;
  id v32 = v30;
  id v33 = [v31 defaultMetrics];
  id v34 = self;
  id v35 = [v34 systemFontOfSize:32.0 weight:UIFontWeightBold];
  id v36 = [v33 scaledFontForFont:v35];

  [v32 setFont:v36];
  Swift::String v37 = *(void **)&v1[v21];
  if (!v37)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  [v37 sizeToFit];
  Swift::String v38 = *(void **)&v1[v21];
  if (!v38)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  [v38 setAdjustsFontSizeToFitWidth:1];
  id v39 = *(void **)&v1[v21];
  if (!v39)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  [v39 setNumberOfLines:2];
  uint64_t v40 = *(void **)&v1[v12];
  if (!v40)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (!*(void *)&v1[v21])
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  [v40 addSubview:];
  id v41 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v42 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_subtitleLabel;
  id v43 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_subtitleLabel];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_subtitleLabel] = v41;

  id v44 = *(void **)&v1[v42];
  if (!v44)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  id v45 = v44;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001CLL, (void *)0x8000000100130500);
  NSString v46 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v45 setText:v46];

  uint64_t v47 = *(void **)&v1[v42];
  if (!v47)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  id v48 = v47;
  id v49 = [v31 defaultMetrics];
  id v50 = [v34 systemFontOfSize:22.0 weight:UIFontWeightRegular];
  id v51 = [v49 scaledFontForFont:v50];

  [v48 setFont:v51];
  uint64_t v52 = *(void **)&v1[v42];
  if (!v52)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  [v52 setNumberOfLines:2];
  id v53 = *(void **)&v1[v42];
  if (!v53)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  [v53 sizeToFit];
  id v54 = *(void **)&v1[v42];
  if (!v54)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  [v54 setAdjustsFontSizeToFitWidth:1];
  uint64_t v55 = *(void **)&v1[v42];
  if (!v55)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  [v55 setTextAlignment:1];
  id v56 = [v1 view];
  if (!v56)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (!*(void *)&v1[v42])
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  id v57 = v56;
  [v56 addSubview:];

  id v58 = [v31 defaultMetrics];
  [v34 defaultFontSize];
  id v59 = [v34 systemFontOfSize:];
  id v60 = [v58 scaledFontForFont:v59];

  id v61 = v101;
  static UIButton.Configuration.plain()();
  *(void *)(swift_allocObject() + 16) = v60;
  id v62 = v60;
  id v63 = v104;
  UIConfigurationTextAttributesTransformer.init(_:)();
  uint64_t v64 = type metadata accessor for UIConfigurationTextAttributesTransformer();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v63, 0, 1, v64);
  UIButton.Configuration.titleTextAttributesTransformer.setter();

  sub_10003C374(0, &qword_100182E70);
  uint64_t v66 = v102;
  uint64_t v65 = v103;
  (*(void (**)(char *, char *, uint64_t))(v102 + 16))(v100, v61, v103);
  uint64_t v67 = UIButton.init(configuration:primaryAction:)();
  uint64_t v68 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cancelBtn;
  id v69 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cancelBtn];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cancelBtn] = v67;

  id v70 = *(void **)&v1[v68];
  if (!v70)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  id v71 = v70;
  id v72 = [v105 systemBackgroundColor];
  [v71 setBackgroundColor:v72];

  id v73 = *(void **)&v1[v68];
  if (!v73)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  id v74 = v73;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001ELL, (void *)0x8000000100130520);
  NSString v75 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v74 setTitle:v75 forState:0];

  id v76 = *(void **)&v1[v68];
  if (!v76)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  id v77 = objc_allocWithZone((Class)UIColor);
  id v78 = v76;
  id v79 = [v77 initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  [v78 setTitleColor:v79 forState:0];

  id v80 = *(void **)&v1[v68];
  if (!v80)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  [v80 addTarget:v1 action:"cancelConsent" forControlEvents:64];
  id v81 = [v1 view];
  if (!v81)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (!*(void *)&v1[v68])
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  id v82 = v81;
  [v81 addSubview:];

  id v83 = [objc_allocWithZone((Class)UITableView) init];
  uint64_t v84 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView;
  id v85 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView] = v83;

  id v86 = *(void **)&v1[v84];
  if (!v86)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  [v86 setDataSource:v1];
  id v87 = *(void **)&v1[v84];
  if (!v87)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  [v87 setDelegate:v1];
  id v88 = *(void **)&v1[v84];
  if (!v88)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  type metadata accessor for DeviceSelectorCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v90 = v88;
  NSString v91 = String._bridgeToObjectiveC()();
  [v90 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v91];

  uint64_t v92 = *(void **)&v1[v84];
  if (!v92)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  [v92 setSeparatorStyle:0];
  id v93 = *(void **)&v1[v84];
  if (!v93)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  [v93 setAllowsSelection:0];
  id v94 = *(void **)&v1[v84];
  if (!v94)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  [v94 setAlwaysBounceVertical:1];
  id v95 = *(void **)&v1[v84];
  if (!v95)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  [v95 setShowsVerticalScrollIndicator:0];
  id v96 = *(void **)&v1[v84];
  if (!v96)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  [v96 setRowHeight:110.0];
  id v97 = *(void **)&v1[v84];
  if (!v97)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  [v97 setEstimatedSectionFooterHeight:0.0];
  id v98 = [v1 view];
  if (!v98)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  if (*(void *)&v1[v84])
  {
    v99 = v98;
    [v98 addSubview:];

    (*(void (**)(char *, uint64_t))(v66 + 8))(v61, v65);
    return;
  }
LABEL_75:
  __break(1u);
}

void sub_1000D07FC()
{
  uint64_t v1 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_headerView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_headerView];
  if (!v2)
  {
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v3 = v0;
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_titleLabel;
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_titleLabel];
  if (!v5)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_subtitleLabel;
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_subtitleLabel];
  if (!v7)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v124 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cancelBtn;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cancelBtn];
  if (!v8)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v125 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView;
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView];
  if (!v9)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100123C30;
  id v11 = *(void **)&v3[v1];
  if (!v11)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  id v12 = [v11 leadingAnchor];
  id v13 = [v3 view];
  if (!v13)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  id v14 = v13;
  id v15 = [v13 leadingAnchor];

  id v16 = [v12 constraintEqualToAnchor:v15];
  *(void *)(v10 + 32) = v16;
  id v17 = *(void **)&v3[v1];
  if (!v17)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  id v18 = [v17 topAnchor];
  id v19 = [v3 view];
  if (!v19)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  id v20 = v19;
  id v21 = [v19 topAnchor];

  id v22 = [v18 constraintEqualToAnchor:v21 constant:10.0];
  *(void *)(v10 + 40) = v22;
  id v23 = *(void **)&v3[v1];
  if (!v23)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  id v24 = [v23 widthAnchor];
  id v25 = [v3 view];
  if (!v25)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  id v26 = v25;
  id v27 = [v25 widthAnchor];

  id v28 = [v24 constraintEqualToAnchor:v27];
  *(void *)(v10 + 48) = v28;
  id v29 = *(void **)&v3[v1];
  if (!v29)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  id v30 = [v29 heightAnchor];
  id v31 = [v3 view];
  if (!v31)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  id v32 = v31;
  id v33 = self;
  id v34 = [v32 heightAnchor];

  id v35 = [v30 constraintEqualToAnchor:v34 multiplier:0.1];
  *(void *)(v10 + 56) = v35;
  specialized Array._endMutation()();
  sub_10003C374(0, (unint64_t *)&qword_1001831A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v33 activateConstraints:isa];

  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_100123C30;
  Swift::String v38 = *(void **)&v3[v4];
  if (!v38)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  id v39 = [v38 centerXAnchor];
  uint64_t v40 = *(void **)&v3[v1];
  if (!v40)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  id v41 = [v40 centerXAnchor];
  id v42 = [v39 constraintEqualToAnchor:v41];

  *(void *)(v37 + 32) = v42;
  id v43 = *(void **)&v3[v4];
  if (!v43)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  id v44 = [v43 bottomAnchor];
  id v45 = *(void **)&v3[v1];
  if (!v45)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  id v46 = [v45 bottomAnchor];
  id v47 = [v44 constraintEqualToAnchor:v46];

  *(void *)(v37 + 40) = v47;
  id v48 = *(void **)&v3[v4];
  if (!v48)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  id v49 = [v48 heightAnchor];
  id v50 = *(void **)&v3[v1];
  if (!v50)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  id v51 = [v50 heightAnchor];
  id v52 = [v49 constraintEqualToAnchor:v51 multiplier:0.5];

  *(void *)(v37 + 48) = v52;
  id v53 = *(void **)&v3[v4];
  if (!v53)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  id v54 = [v53 widthAnchor];
  uint64_t v55 = *(void **)&v3[v1];
  if (!v55)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  id v56 = [v55 widthAnchor];
  id v57 = [v54 constraintEqualToAnchor:v56 multiplier:0.8];

  *(void *)(v37 + 56) = v57;
  specialized Array._endMutation()();
  Class v58 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v33 activateConstraints:v58];

  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_100123C30;
  id v60 = *(void **)&v3[v6];
  if (!v60)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  id v61 = [v60 centerXAnchor];
  id v62 = *(void **)&v3[v4];
  if (!v62)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  id v63 = [v62 centerXAnchor];
  id v64 = [v61 constraintEqualToAnchor:v63];

  *(void *)(v59 + 32) = v64;
  uint64_t v65 = *(void **)&v3[v6];
  if (!v65)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  id v66 = [v65 topAnchor];
  uint64_t v67 = *(void **)&v3[v1];
  if (!v67)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  id v68 = [v67 bottomAnchor];
  id v69 = [v66 constraintEqualToAnchor:v68 constant:30.0];

  *(void *)(v59 + 40) = v69;
  id v70 = *(void **)&v3[v6];
  if (!v70)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  id v71 = [v70 heightAnchor];
  id v72 = *(void **)&v3[v4];
  if (!v72)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  id v73 = [v72 heightAnchor];
  id v74 = [v71 constraintEqualToAnchor:v73];

  *(void *)(v59 + 48) = v74;
  NSString v75 = *(void **)&v3[v6];
  if (!v75)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  id v76 = [v75 widthAnchor];
  id v77 = *(void **)&v3[v4];
  if (!v77)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  id v78 = [v77 widthAnchor];
  id v79 = [v76 constraintEqualToAnchor:v78];

  *(void *)(v59 + 56) = v79;
  specialized Array._endMutation()();
  Class v80 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v33 activateConstraints:v80];

  uint64_t v81 = swift_allocObject();
  *(_OWORD *)(v81 + 16) = xmmword_100124770;
  id v82 = *(void **)&v3[v125];
  if (!v82)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  id v83 = [v82 leadingAnchor];
  uint64_t v84 = *(void **)&v3[v1];
  if (!v84)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  id v85 = [v84 leadingAnchor];
  id v86 = [v83 constraintEqualToAnchor:v85];

  *(void *)(v81 + 32) = v86;
  id v87 = *(void **)&v3[v125];
  if (!v87)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  id v88 = [v87 topAnchor];
  id v89 = *(void **)&v3[v6];
  if (!v89)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  id v90 = [v89 bottomAnchor];
  id v91 = [v88 constraintEqualToAnchor:v90 constant:20.0];

  *(void *)(v81 + 40) = v91;
  uint64_t v92 = *(void **)&v3[v125];
  if (!v92)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  id v93 = [v92 leftAnchor];
  id v94 = *(void **)&v3[v1];
  if (!v94)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  id v95 = [v94 leftAnchor];
  id v96 = [v93 constraintEqualToAnchor:v95 constant:15.0];

  *(void *)(v81 + 48) = v96;
  id v97 = *(void **)&v3[v125];
  if (!v97)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  id v98 = [v97 rightAnchor];
  id v99 = [v3 view];
  if (!v99)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  uint64_t v100 = v99;
  id v101 = [v99 rightAnchor];

  id v102 = [v98 constraintEqualToAnchor:v101 constant:-15.0];
  *(void *)(v81 + 56) = v102;
  uint64_t v103 = *(void **)&v3[v125];
  if (!v103)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  id v104 = [v103 bottomAnchor];
  id v105 = *(void **)&v3[v124];
  if (!v105)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  id v106 = [v105 topAnchor];
  id v107 = [v104 constraintEqualToAnchor:v106 constant:-30.0];

  *(void *)(v81 + 64) = v107;
  specialized Array._endMutation()();
  Class v108 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v33 activateConstraints:v108];

  uint64_t v109 = swift_allocObject();
  *(_OWORD *)(v109 + 16) = xmmword_100125510;
  v110 = *(void **)&v3[v124];
  if (!v110)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  id v111 = [v110 centerXAnchor];
  char v112 = *(void **)&v3[v125];
  if (!v112)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  id v113 = [v112 centerXAnchor];
  id v114 = [v111 constraintEqualToAnchor:v113];

  *(void *)(v109 + 32) = v114;
  uint64_t v115 = *(void **)&v3[v124];
  if (!v115)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  id v116 = [v115 bottomAnchor];
  id v117 = [v3 view];
  if (!v117)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  char v118 = v117;
  id v119 = [v117 bottomAnchor];

  id v120 = [v116 constraintEqualToAnchor:v119 constant:-30.0];
  *(void *)(v109 + 40) = v120;
  uint64_t v121 = *(void **)&v3[v124];
  if (!v121)
  {
LABEL_91:
    __break(1u);
    return;
  }
  id v122 = [v121 heightAnchor];
  id v123 = [v122 constraintEqualToConstant:42.0];

  *(void *)(v109 + 48) = v123;
  specialized Array._endMutation()();
  Class v126 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v33 activateConstraints:v126];
}

unint64_t sub_1000D1514(void *a1)
{
  uint64_t v2 = v1;
  NSString v4 = String._bridgeToObjectiveC()();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v6 = [a1 dequeueReusableCellWithIdentifier:v4 forIndexPath:isa];

  type metadata accessor for DeviceSelectorCell();
  uint64_t v7 = swift_dynamicCastClassUnconditional();
  unint64_t result = IndexPath.row.getter();
  uint64_t v9 = *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection];
  if ((v9 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v10 = *(id *)(v9 + 8 * result + 32);
LABEL_5:
    id v11 = [objc_allocWithZone((Class)DADeviceState) initWithDEDDevice:v10];
    type metadata accessor for CardState();
    swift_allocObject();
    id v12 = v6;
    *(void *)(v7 + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState) = sub_10005A898(v11);
    swift_retain();
    swift_release();
    sub_100084C80();

    swift_release();
    id v13 = *(void **)(v7 + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_deviceViewController);
    *(void *)(v7 + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_deviceViewController) = v2;
    id v14 = v2;

    id v15 = *(void **)(v7 + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_dedDevice);
    *(void *)(v7 + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_dedDevice) = v10;

    return v7;
  }
  __break(1u);
  return result;
}

void sub_1000D1808()
{
  uint64_t v1 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  NSString v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  id v6 = &v22[-v5];
  uint64_t v7 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000D2624();
  id v11 = [self sharedManager];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 6;
  *(unsigned char *)(v12 + 24) = 0;
  *(void *)(v12 + 32) = 0;
  *(unsigned char *)(v12 + 40) = 1;
  *(void *)(v12 + 48) = 0;
  aBlock[4] = sub_1000D2958;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100046950;
  aBlock[3] = &unk_100152F08;
  id v13 = _Block_copy(aBlock);
  swift_release();
  [v11 transactionWithBlock:v13];
  _Block_release(v13);

  id v14 = [v0 parentViewController];
  if (v14)
  {
    id v15 = v14;
    self;
    uint64_t v16 = swift_dynamicCastObjCClass();
    if (v16)
    {
      id v17 = (void *)v16;
      if (qword_100182828 != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for ModalPresentationCoordinator(0);
      sub_10003C3B0(v18, (uint64_t)qword_10018A440);
      swift_beginAccess();
      if ((sub_1000D986C(v17, 1, 0, 1, 0, 0) & 1) == 0)
      {
        id v19 = v15;
        uint64_t v20 = swift_bridgeObjectRetain();
        uint64_t v21 = sub_1000DC28C(v20, v17);

        sub_1000D7D60(v21, (uint64_t)v6);
        swift_release();
        if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
        {
          sub_100044E28((uint64_t)v6);
        }
        else
        {
          sub_10003C4A8((uint64_t)v6, (uint64_t)v10);
          sub_1000B7DBC((uint64_t)v10, (uint64_t)v4);
          sub_100044E28((uint64_t)v4);
          sub_10003C50C((uint64_t)v10);
        }
      }
      swift_endAccess();
    }
  }
}

void sub_1000D1BBC(void *a1)
{
  uint64_t v3 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = &v25[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v25[-v7];
  uint64_t v9 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v25[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000D2624();
  [self createLoggingEventWith:ELSEventTypeEnrollConsentApprovedWithReview];
  id v13 = [self sharedManager];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 3;
  *(unsigned char *)(v14 + 24) = 0;
  *(void *)(v14 + 32) = 1;
  *(unsigned char *)(v14 + 40) = 0;
  *(void *)(v14 + 48) = a1;
  aBlock[4] = sub_1000D2958;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100046950;
  aBlock[3] = &unk_100152E90;
  id v15 = _Block_copy(aBlock);
  id v16 = a1;
  swift_release();
  [v13 transactionWithBlock:v15];
  _Block_release(v15);

  id v17 = [v1 parentViewController];
  if (v17)
  {
    uint64_t v18 = v17;
    self;
    uint64_t v19 = swift_dynamicCastObjCClass();
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      if (qword_100182828 != -1) {
        swift_once();
      }
      uint64_t v21 = type metadata accessor for ModalPresentationCoordinator(0);
      sub_10003C3B0(v21, (uint64_t)qword_10018A440);
      swift_beginAccess();
      if ((sub_1000D986C(v20, 1, 0, 1, 0, 0) & 1) == 0)
      {
        id v22 = v18;
        uint64_t v23 = swift_bridgeObjectRetain();
        uint64_t v24 = sub_1000DC28C(v23, v20);

        sub_1000D7D60(v24, (uint64_t)v8);
        swift_release();
        if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
        {
          sub_100044E28((uint64_t)v8);
        }
        else
        {
          sub_10003C4A8((uint64_t)v8, (uint64_t)v12);
          sub_1000B7DBC((uint64_t)v12, (uint64_t)v6);
          sub_100044E28((uint64_t)v6);
          sub_10003C50C((uint64_t)v12);
        }
      }
      swift_endAccess();
    }
  }
}

void sub_1000D1F58()
{
  id v0 = [self sharedInstance];
  [v0 stopDiscovery];
}

void sub_1000D1FB8(id a1, uint64_t a2, char a3, uint64_t a4, char a5, void *a6)
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    [a1 setStatus:a2];
    if (a5)
    {
LABEL_3:
      if (!a6) {
        return;
      }
      goto LABEL_7;
    }
  }
  [a1 setConsent:a4];
  if (!a6) {
    return;
  }
LABEL_7:
  id v10 = a6;
  Class isa = (Class)[a1 targetDevices];
  if (!isa)
  {
    sub_10003C374(0, &qword_100185AE0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [a1 setTargetDevices:isa];
  }

  id v12 = [a1 targetDevices];
  if (v12)
  {
    id v13 = v12;
    sub_10003C374(0, &qword_100185AE0);
    uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v15 = v10;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    if (v14)
    {
      v16.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v16.super.Class isa = 0;
    }
    [a1 setTargetDevices:v16.super.isa];
  }
  else
  {
    [a1 setTargetDevices:0];
    swift_bridgeObjectRelease();
  }
}

id sub_1000D21B0(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_commonHeight] = 0x4045000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_componentPadding] = 0x403E000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_topPadding] = 0x4024000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_topPaddingForLabel] = 0x4034000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_commonParentViewPadding] = 0xC03E000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_bottomButtonSpacer] = 0xC034000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_fontSizeForLabels] = 0x4036000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_fontSizeForTitle] = 0x4040000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cardCellEstimatedHeight] = 0x407F400000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_tableViewPadding] = 0x402E000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_tableRowHeight] = 0x405B800000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_headerView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_titleLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_subtitleLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cancelBtn] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection] = _swiftEmptyArrayStorage;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_platformsFromQueue] = _swiftEmptyArrayStorage;
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for DeviceSelector();
  [super initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_1000D23A4(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_commonHeight] = 0x4045000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_componentPadding] = 0x403E000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_topPadding] = 0x4024000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_topPaddingForLabel] = 0x4034000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_commonParentViewPadding] = 0xC03E000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_bottomButtonSpacer] = 0xC034000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_fontSizeForLabels] = 0x4036000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_fontSizeForTitle] = 0x4040000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cardCellEstimatedHeight] = 0x407F400000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_tableViewPadding] = 0x402E000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_tableRowHeight] = 0x405B800000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_headerView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_titleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_subtitleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_cancelBtn] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_platformsFromQueue] = _swiftEmptyArrayStorage;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeviceSelector();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id sub_1000D2530()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceSelector();
  return [super dealloc];
}

uint64_t type metadata accessor for DeviceSelector()
{
  return self;
}

uint64_t sub_1000D2624()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v15 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  objc_super v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchQoS();
  uint64_t v3 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  objc_super v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchTime();
  uint64_t v6 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  objc_super v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C374(0, (unint64_t *)&qword_100182E40);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  aBlock[4] = sub_1000D1F58;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000358AC;
  aBlock[3] = &unk_100152EB8;
  id v10 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10003AF78();
  sub_10003AFD0((uint64_t *)&unk_100182E50);
  sub_10003B014();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v13);
}

uint64_t sub_1000D2920()
{
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000D295C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000D296C()
{
  return swift_release();
}

void sub_1000D2974(void *a1)
{
  sub_1000D1FB8(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_1000D298C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000D29C4(uint64_t a1)
{
  return sub_1000CFABC(a1, *(void **)(v1 + 16));
}

void *sub_1000D29CC(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      unint64_t v6 = v3 & 0xC000000000000001;
      uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8;
      v3 += 32;
      objc_super v8 = &selRef_setExportedInterface_;
      uint64_t v9 = &selRef_setPriority_;
      uint64_t v23 = v4;
      uint64_t v24 = a2;
      unint64_t v22 = v6;
      uint64_t v26 = v7;
      uint64_t v27 = OBJC_IVAR____TtC11Diagnostics14DeviceSelector_platformsFromQueue;
      id v25 = (void *)v3;
      while (1)
      {
        if (v6)
        {
          id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16))
          {
            __break(1u);
LABEL_34:
            __break(1u);
            goto LABEL_35;
          }
          id v10 = *(id *)(v3 + 8 * v5);
        }
        uint64_t v11 = v10;
        if (__OFADD__(v5++, 1)) {
          goto LABEL_34;
        }
        if ([v10 v8[134]] == (id)1
          && [v11 v9[382]] != (id)3
          && ![v11 isCurrentDevice])
        {
          break;
        }

LABEL_5:
        if (v5 == v4) {
          return _swiftEmptyArrayStorage;
        }
      }
      unint64_t v3 = *(void *)(a2 + v27);
      swift_bridgeObjectRetain();
      id v13 = [v11 platform];
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v16 = v15;

      uint64_t v17 = *(void *)(v3 + 16);
      if (!v17) {
        break;
      }
      if (*(void *)(v3 + 32) == v14 && *(void *)(v3 + 40) == v16
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
LABEL_17:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
LABEL_18:
        uint64_t v4 = v23;
        a2 = v24;
        unint64_t v6 = v22;
        goto LABEL_21;
      }
      uint64_t v4 = v23;
      a2 = v24;
      unint64_t v6 = v22;
      if (v17 == 1) {
        break;
      }
      uint64_t v18 = (void *)(v3 + 56);
      a2 = 1;
      while (1)
      {
        uint64_t v19 = a2 + 1;
        if (__OFADD__(a2, 1)) {
          break;
        }
        BOOL v20 = *(v18 - 1) == v14 && *v18 == v16;
        if (v20 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_17;
        }
        v18 += 2;
        ++a2;
        if (v19 == v17)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_18;
        }
      }
LABEL_35:
      __break(1u);
LABEL_36:
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_21:
    unint64_t v3 = (unint64_t)v25;
    uint64_t v7 = v26;
    objc_super v8 = &selRef_setExportedInterface_;
    uint64_t v9 = &selRef_setPriority_;
    goto LABEL_5;
  }
  return _swiftEmptyArrayStorage;
}

id sub_1000D2D74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseTableViewHeaderFooterView();
  return [super dealloc];
}

uint64_t type metadata accessor for BaseTableViewHeaderFooterView()
{
  return self;
}

uint64_t sub_1000D2DD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_1000D2E08(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  unint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    __chkstk_darwin(TupleTypeMetadata);
    objc_super v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      id v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *uint64_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        uint64_t v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  __chkstk_darwin(TupleTypeMetadata);
  BOOL v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return TupleView.init(_:)();
}

void sub_1000D2FCC()
{
  sub_1000D2FEC();
  qword_10018A438 = v0;
}

void sub_1000D2FEC()
{
  id v0 = [self sharedApplication];
  id v1 = [v0 connectedScenes];

  sub_10003C374(0, &qword_100183040);
  sub_1000468E0();
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1000AB17C(v2);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (v4)
  {
    self;
    unint64_t v5 = (void *)swift_dynamicCastObjCClass();
    if (!v5) {
  }
    }
  else
  {
    unint64_t v5 = 0;
  }
  id v6 = [v5 keyWindow];
  if (v6)
  {
    uint64_t v7 = v6;
    objc_super v8 = self;
    id v9 = v7;
    id v10 = [v8 currentDevice];
    id v11 = [v10 orientation];

    [v9 bounds];
    CGRectGetHeight(v12);
    [v9 bounds];
    CGRectGetWidth(v13);
    sub_1000C4820((uint64_t)v11, (uint64_t)&off_10014C970);
  }
  else
  {
  }
}

double sub_1000D31C8()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1 == (id)1 && (sub_10003AFD0(&qword_100185138), State.wrappedValue.getter(), (v3 & 1) != 0)) {
    return 48.0;
  }
  else {
    return 24.0;
  }
}

double sub_1000D326C()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1 == (id)1 && (sub_10003AFD0(&qword_100185138), State.wrappedValue.getter(), (v4 & 1) != 0)) {
    return 64.0;
  }
  else {
    return 32.0;
  }
}

uint64_t sub_1000D3310()
{
  sub_10003AFD0(&qword_100183BE0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100123B50;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  sub_10003AFD0(&qword_100185138);
  State.wrappedValue.getter();
  if (v5) {
    uint64_t v1 = 1702195828;
  }
  else {
    uint64_t v1 = 0x65736C6166;
  }
  if (v5) {
    unint64_t v2 = 0xE400000000000000;
  }
  else {
    unint64_t v2 = 0xE500000000000000;
  }
  unint64_t v3 = v2;
  String.append(_:)(*(Swift::String *)&v1);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0xD000000000000013;
  *(void *)(v0 + 40) = 0x8000000100130620;
  print(_:separator:terminator:)();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D3434()
{
  return sub_1000D3310();
}

void sub_1000D349C()
{
  sub_1000D77F4(v0 + 96, (uint64_t)v10, &qword_100185C18);
  sub_1000D77F4((uint64_t)v10, (uint64_t)&v11, &qword_100185C18);
  if (v12)
  {
    sub_10003AFD0(&qword_100185138);
    State.wrappedValue.getter();
  }
  else if (v11 <= 0x18 && ((1 << v11) & 0x1010100) != 0)
  {
    id v2 = [self sharedApplication];
    id v3 = [v2 connectedScenes];

    sub_10003C374(0, &qword_100183040);
    sub_1000468E0();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_1000AB17C(v4);
    id v6 = v5;
    swift_bridgeObjectRelease();
    if (v6)
    {
      self;
      uint64_t v7 = (void *)swift_dynamicCastObjCClass();
      if (!v7) {
    }
      }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = [v7 keyWindow];
    if (v8)
    {
      id v9 = v8;
      [v9 safeAreaInsets];
    }
  }
}

id sub_1000D3688@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v3 = [objc_allocWithZone((Class)UIImageView) initWithImage:a1];
  [v3 setContentMode:2];
  LODWORD(v4) = 1132068864;
  [v3 setContentHuggingPriority:1 forAxis:v4];
  LODWORD(v5) = 1132068864;
  [v3 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1132068864;
  [v3 setContentCompressionResistancePriority:1 forAxis:v6];
  LODWORD(v7) = 1132068864;
  id result = [v3 setContentCompressionResistancePriority:0 forAxis:v7];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = v3;
  return result;
}

uint64_t sub_1000D3754@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  double v4 = (_OWORD *)swift_allocObject();
  long long v5 = *(_OWORD *)(a1 + 16);
  long long v6 = v2[4];
  long long v7 = v2[5];
  long long v8 = v2[2];
  v4[5] = v2[3];
  v4[6] = v6;
  v4[7] = v7;
  *(_OWORD *)((char *)v4 + 121) = *(long long *)((char *)v2 + 89);
  long long v9 = *v2;
  long long v10 = v2[1];
  v4[1] = v5;
  v4[2] = v9;
  v4[3] = v10;
  v4[4] = v8;
  sub_1000D7294((uint64_t)v2);
  uint64_t v15 = type metadata accessor for NSNotificationCenter.Publisher();
  sub_10003B070(&qword_100185B90);
  sub_10003B070(&qword_1001844A8);
  sub_10003B070(&qword_100185B98);
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for HStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for VStack();
  swift_getWitnessTable();
  type metadata accessor for _OverlayModifier();
  type metadata accessor for ModifiedContent();
  sub_10003B070(&qword_100185BA0);
  type metadata accessor for ModifiedContent();
  sub_10003B070(&qword_100185BA8);
  type metadata accessor for ModifiedContent();
  type metadata accessor for ModifiedContent();
  sub_100081F20();
  id v32 = &protocol witness table for Int;
  type metadata accessor for ForEach();
  unint64_t v26 = sub_1000D7304();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = sub_10004F7B0(&qword_100185BE8, &qword_100185BA0);
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v23 = sub_10004F7B0(&qword_100185BF0, &qword_100185BA8);
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v21 = &protocol witness table for _OffsetEffect;
  uint64_t v19 = swift_getWitnessTable();
  swift_getWitnessTable();
  type metadata accessor for TabView();
  type metadata accessor for PageTabViewStyle();
  swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeMetadata2();
  sub_10004F7B0(&qword_100185BF8, &qword_100185B90);
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v15;
  uint64_t v29 = type metadata accessor for SubscriptionView();
  uint64_t v30 = sub_1000D74C0(&qword_100185C00, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  uint64_t v31 = swift_getWitnessTable();
  type metadata accessor for SubscriptionView();
  swift_getWitnessTable();
  uint64_t v17 = GeometryReader.init(content:)();
  uint64_t v18 = v11;
  uint64_t v12 = type metadata accessor for GeometryReader();
  swift_getWitnessTable();
  CGRect v13 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(&v28, &v17, v12);
  swift_release();
  uint64_t v17 = v28;
  uint64_t v18 = v29;
  v13(a2, &v17, v12);
  return swift_release();
}

uint64_t sub_1000D3D30@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v103 = a4;
  uint64_t v98 = a3;
  uint64_t v102 = a1;
  id v106 = a5;
  uint64_t v108 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v105 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  id v104 = (char *)v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PageTabViewStyle.IndexDisplayMode();
  __chkstk_darwin(v7 - 8);
  uint64_t v100 = (char *)v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for PageTabViewStyle();
  uint64_t v101 = *(void *)(v107 - 8);
  __chkstk_darwin(v107);
  id v99 = (char *)v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10003B070(&qword_1001844A8);
  sub_10003B070(&qword_100185B98);
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for HStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for VStack();
  swift_getWitnessTable();
  type metadata accessor for _OverlayModifier();
  type metadata accessor for ModifiedContent();
  sub_10003B070(&qword_100185BA0);
  type metadata accessor for ModifiedContent();
  sub_10003B070(&qword_100185BA8);
  type metadata accessor for ModifiedContent();
  uint64_t v11 = type metadata accessor for ModifiedContent();
  unint64_t v12 = sub_100081F20();
  *(void *)&long long v123 = v10;
  *((void *)&v123 + 1) = &type metadata for Int;
  uint64_t v124 = (void *)v11;
  uint64_t v125 = (void *)v12;
  Class v126 = &protocol witness table for Int;
  uint64_t v13 = type metadata accessor for ForEach();
  unint64_t v14 = sub_1000D7304();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v121 = v14;
  uint64_t v122 = WitnessTable;
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = sub_10004F7B0(&qword_100185BE8, &qword_100185BA0);
  uint64_t v119 = v16;
  uint64_t v120 = v17;
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = sub_10004F7B0(&qword_100185BF0, &qword_100185BA8);
  uint64_t v117 = v18;
  uint64_t v118 = v19;
  uint64_t v115 = swift_getWitnessTable();
  id v116 = &protocol witness table for _OffsetEffect;
  uint64_t v114 = swift_getWitnessTable();
  uint64_t v82 = v13;
  uint64_t v81 = swift_getWitnessTable();
  *(void *)&long long v123 = &type metadata for Int;
  *((void *)&v123 + 1) = v13;
  uint64_t v124 = &protocol witness table for Int;
  uint64_t v125 = (void *)v81;
  uint64_t v20 = type metadata accessor for TabView();
  uint64_t v85 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v78 = (char *)v74 - v21;
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v23 = v107;
  *(void *)&long long v123 = v20;
  *((void *)&v123 + 1) = v107;
  uint64_t v124 = (void *)v22;
  uint64_t v125 = &protocol witness table for PageTabViewStyle;
  uint64_t v24 = (void *)v22;
  v74[1] = v22;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v89 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  v74[0] = (char *)v74 - v26;
  *(void *)&long long v123 = v20;
  *((void *)&v123 + 1) = v23;
  uint64_t v124 = v24;
  uint64_t v125 = &protocol witness table for PageTabViewStyle;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v123 = OpaqueTypeMetadata2;
  *((void *)&v123 + 1) = &type metadata for Int;
  uint64_t v28 = OpaqueTypeMetadata2;
  uint64_t v75 = OpaqueTypeMetadata2;
  uint64_t v124 = (void *)OpaqueTypeConformance2;
  uint64_t v125 = &protocol witness table for Int;
  uint64_t v76 = OpaqueTypeConformance2;
  uint64_t v29 = swift_getOpaqueTypeMetadata2();
  uint64_t v83 = v29;
  uint64_t v94 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  id v79 = (char *)v74 - v30;
  uint64_t v31 = sub_10003B070(&qword_100185B90);
  uint64_t v87 = v31;
  uint64_t v32 = sub_10004F7B0(&qword_100185BF8, &qword_100185B90);
  uint64_t v86 = v32;
  *(void *)&long long v123 = v28;
  *((void *)&v123 + 1) = &type metadata for Int;
  uint64_t v124 = (void *)OpaqueTypeConformance2;
  uint64_t v125 = &protocol witness table for Int;
  uint64_t v84 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v123 = v31;
  *((void *)&v123 + 1) = v29;
  uint64_t v124 = (void *)v32;
  uint64_t v125 = (void *)v84;
  uint64_t v33 = type metadata accessor for SubscriptionView();
  uint64_t v90 = v33;
  uint64_t v97 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  Class v80 = (char *)v74 - v34;
  uint64_t v35 = sub_1000D74C0(&qword_100185C00, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  uint64_t v93 = v35;
  id v96 = &protocol conformance descriptor for SubscriptionView<A, B>;
  uint64_t v91 = swift_getWitnessTable();
  *(void *)&long long v123 = v108;
  *((void *)&v123 + 1) = v33;
  uint64_t v124 = (void *)v35;
  uint64_t v125 = (void *)v91;
  uint64_t v77 = type metadata accessor for SubscriptionView();
  uint64_t v95 = *(void *)(v77 - 8);
  uint64_t v36 = __chkstk_darwin(v77);
  id v88 = (char *)v74 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  uint64_t v92 = (char *)v74 - v38;
  long long v127 = *(_OWORD *)((char *)a2 + 40);
  long long v113 = *(_OWORD *)((char *)a2 + 40);
  sub_10003AFD0(&qword_100185C08);
  State.projectedValue.getter();
  uint64_t v39 = v98;
  uint64_t v109 = v98;
  uint64_t v40 = v103;
  uint64_t v110 = v103;
  id v111 = a2;
  uint64_t v112 = v102;
  id v41 = v78;
  TabView.init(selection:content:)();
  static PageTabViewStyle.IndexDisplayMode.automatic.getter();
  id v42 = v99;
  PageTabViewStyle.init(indexDisplayMode:)();
  uint64_t v43 = v74[0];
  uint64_t v44 = v107;
  View.tabViewStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v42, v44);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v41, v20);
  long long v123 = v127;
  State.wrappedValue.getter();
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = v39;
  *(void *)(v45 + 24) = v40;
  long long v46 = a2[5];
  *(_OWORD *)(v45 + 96) = a2[4];
  *(_OWORD *)(v45 + 112) = v46;
  *(_OWORD *)(v45 + 121) = *(_OWORD *)((char *)a2 + 89);
  long long v47 = a2[1];
  *(_OWORD *)(v45 + 32) = *a2;
  *(_OWORD *)(v45 + 48) = v47;
  long long v48 = a2[3];
  *(_OWORD *)(v45 + 64) = a2[2];
  *(_OWORD *)(v45 + 80) = v48;
  sub_1000D7294((uint64_t)a2);
  id v49 = v79;
  uint64_t v50 = v75;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v43, v50);
  long long v123 = *(_OWORD *)((char *)a2 + 24);
  sub_10003AFD0(&qword_100185C10);
  State.wrappedValue.getter();
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = v39;
  *(void *)(v51 + 24) = v40;
  uint64_t v52 = v39;
  long long v53 = a2[5];
  *(_OWORD *)(v51 + 96) = a2[4];
  *(_OWORD *)(v51 + 112) = v53;
  *(_OWORD *)(v51 + 121) = *(_OWORD *)((char *)a2 + 89);
  long long v54 = a2[1];
  *(_OWORD *)(v51 + 32) = *a2;
  *(_OWORD *)(v51 + 48) = v54;
  long long v55 = a2[3];
  *(_OWORD *)(v51 + 64) = a2[2];
  *(_OWORD *)(v51 + 80) = v55;
  sub_1000D7294((uint64_t)a2);
  id v56 = v80;
  uint64_t v57 = v83;
  View.onReceive<A>(_:perform:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v94 + 8))(v49, v57);
  id v58 = [self defaultCenter];
  uint64_t v59 = v104;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = v52;
  *(void *)(v60 + 24) = v40;
  long long v61 = a2[5];
  *(_OWORD *)(v60 + 96) = a2[4];
  *(_OWORD *)(v60 + 112) = v61;
  *(_OWORD *)(v60 + 121) = *(_OWORD *)((char *)a2 + 89);
  long long v62 = a2[1];
  *(_OWORD *)(v60 + 32) = *a2;
  *(_OWORD *)(v60 + 48) = v62;
  long long v63 = a2[3];
  *(_OWORD *)(v60 + 64) = a2[2];
  *(_OWORD *)(v60 + 80) = v63;
  sub_1000D7294((uint64_t)a2);
  id v64 = v88;
  uint64_t v65 = v59;
  uint64_t v66 = v90;
  uint64_t v67 = v108;
  View.onReceive<A>(_:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v65, v67);
  (*(void (**)(char *, uint64_t))(v97 + 8))(v56, v66);
  uint64_t v68 = v77;
  swift_getWitnessTable();
  uint64_t v69 = v95;
  id v70 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
  id v71 = v92;
  v70(v92, v64, v68);
  id v72 = *(void (**)(char *, uint64_t))(v69 + 8);
  v72(v64, v68);
  v70(v106, v71, v68);
  return ((uint64_t (*)(char *, uint64_t))v72)(v71, v68);
}

uint64_t sub_1000D4B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v43 = a4;
  uint64_t v40 = a2;
  uint64_t v45 = a5;
  uint64_t v41 = type metadata accessor for GeometryProxy();
  uint64_t v7 = *(void *)(v41 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v41);
  uint64_t v9 = sub_10003B070(&qword_1001844A8);
  sub_10003B070(&qword_100185B98);
  uint64_t v42 = a3;
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for HStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for VStack();
  swift_getWitnessTable();
  _OWORD v39[2] = type metadata accessor for _OverlayModifier();
  uint64_t v10 = type metadata accessor for ModifiedContent();
  sub_10003B070(&qword_100185BA0);
  v39[3] = v10;
  uint64_t v11 = type metadata accessor for ModifiedContent();
  sub_10003B070(&qword_100185BA8);
  v39[4] = v11;
  v39[5] = type metadata accessor for ModifiedContent();
  uint64_t v12 = type metadata accessor for ModifiedContent();
  uint64_t v44 = v9;
  uint64_t v55 = v9;
  id v56 = &type metadata for Int;
  uint64_t v57 = v12;
  unint64_t v58 = sub_100081F20();
  v39[6] = v58;
  uint64_t v59 = &protocol witness table for Int;
  uint64_t v13 = type metadata accessor for ForEach();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)v39 - v18;
  unint64_t v20 = *(void *)(a1 + 88);
  unint64_t v60 = v20;
  v39[7] = v12;
  if (!(v20 >> 62))
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
    uint64_t v55 = 0;
    id v56 = (void *)v21;
    v39[1] = swift_getKeyPath();
    uint64_t v22 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v40, v41);
    unint64_t v23 = (*(unsigned __int8 *)(v7 + 80) + 137) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = v43;
    *(void *)(v24 + 16) = v42;
    *(void *)(v24 + 24) = v25;
    long long v26 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v24 + 96) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v24 + 112) = v26;
    *(_OWORD *)(v24 + 121) = *(_OWORD *)(a1 + 89);
    long long v27 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v24 + 32) = *(_OWORD *)a1;
    *(_OWORD *)(v24 + 48) = v27;
    long long v28 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v24 + 64) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v24 + 80) = v28;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v24 + v23, (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
    sub_1000D7294(a1);
    unint64_t v29 = sub_1000D7304();
    uint64_t WitnessTable = swift_getWitnessTable();
    unint64_t v53 = v29;
    uint64_t v54 = WitnessTable;
    uint64_t v31 = swift_getWitnessTable();
    uint64_t v32 = sub_10004F7B0(&qword_100185BE8, &qword_100185BA0);
    uint64_t v51 = v31;
    uint64_t v52 = v32;
    uint64_t v33 = swift_getWitnessTable();
    uint64_t v34 = sub_10004F7B0(&qword_100185BF0, &qword_100185BA8);
    uint64_t v49 = v33;
    uint64_t v50 = v34;
    uint64_t v47 = swift_getWitnessTable();
    long long v48 = &protocol witness table for _OffsetEffect;
    uint64_t v38 = swift_getWitnessTable();
    ForEach<>.init(_:id:content:)();
    uint64_t v46 = v38;
    swift_getWitnessTable();
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    v35(v19, v17, v13);
    uint64_t v36 = *(void (**)(char *, uint64_t))(v14 + 8);
    v36(v17, v13);
    v35(v45, v19, v13);
    return ((uint64_t (*)(char *, uint64_t))v36)(v19, v13);
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = sub_1000A932C((uint64_t)&v60);
  if ((v21 & 0x8000000000000000) == 0) {
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000D5104@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v115 = a5;
  uint64_t v94 = a3;
  uint64_t v101 = sub_10003AFD0(&qword_100184AB0);
  __chkstk_darwin(v101);
  uint64_t v106 = (uint64_t)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v95);
  uint64_t v102 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_10003AFD0(&qword_100185BC0);
  __chkstk_darwin(v96);
  uint64_t v13 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10003AFD0(&qword_100185B98);
  __chkstk_darwin(v14);
  uint64_t v112 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getTupleTypeMetadata2();
  uint64_t v16 = type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for HStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  uint64_t v17 = type metadata accessor for VStack();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v98 = v17;
  uint64_t v97 = WitnessTable;
  uint64_t v99 = type metadata accessor for _OverlayModifier();
  uint64_t v19 = type metadata accessor for ModifiedContent();
  uint64_t v103 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v100 = (char *)&v83 - v20;
  sub_10003B070(&qword_100185BA0);
  uint64_t v104 = v19;
  uint64_t v21 = type metadata accessor for ModifiedContent();
  sub_10003B070(&qword_100185BA8);
  uint64_t v105 = v21;
  uint64_t v22 = type metadata accessor for ModifiedContent();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v83 - v24;
  uint64_t v26 = type metadata accessor for ModifiedContent();
  uint64_t v27 = __chkstk_darwin(v26);
  uint64_t v28 = __chkstk_darwin(v27);
  unint64_t v29 = *a1;
  uint64_t v116 = a2;
  uint64_t v30 = *(void *)(a2 + 88);
  uint64_t v114 = a6;
  uint64_t v113 = v14;
  uint64_t v111 = v28;
  uint64_t v110 = v31;
  uint64_t v109 = v22;
  uint64_t v108 = (char *)&v83 - v32;
  uint64_t v107 = v33;
  unint64_t v93 = v29;
  uint64_t v92 = v13;
  if ((v30 & 0xC000000000000001) == 0)
  {
    if ((v29 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v29 < *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v34 = *(id *)(v30 + 8 * v29 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_18;
  }
  id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_5:
  uint64_t v35 = v34;
  uint64_t v91 = a4;
  uint64_t v16 = type metadata accessor for SelfServiceInstructionsPagerView();
  sub_1000D3688((uint64_t)v35, v126);

  uint64_t v86 = (void *)v126[0];
  uint64_t v85 = v126[1];
  uint64_t v88 = v126[2];
  a2 = v116;
  long long v132 = *(_OWORD *)(v116 + 56);
  long long v127 = *(_OWORD *)(v116 + 56);
  sub_10003AFD0(&qword_100185138);
  State.wrappedValue.getter();
  int v36 = v125;
  GeometryProxy.size.getter();
  if (v36 == 1)
  {
    sub_1000D326C();
    uint64_t v13 = (char *)&unk_100182000;
    if (qword_100182820 == -1)
    {
LABEL_7:
      uint64_t v37 = v16;
      goto LABEL_9;
    }
LABEL_18:
    swift_once();
    goto LABEL_7;
  }
  uint64_t v13 = (char *)&unk_100182000;
  uint64_t v37 = v16;
  sub_1000D31C8();
LABEL_9:
  long long v127 = v132;
  State.wrappedValue.getter();
  int v38 = v125;
  GeometryProxy.size.getter();
  uint64_t v90 = v23;
  uint64_t v89 = v25;
  uint64_t v87 = v37;
  if (v38 == 1)
  {
    sub_1000D326C();
  }
  else
  {
    sub_1000D31C8();
    if (*((void *)v13 + 260) != -1) {
      swift_once();
    }
    a2 = v116;
  }
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v94 = v127;
  char v39 = BYTE8(v127);
  uint64_t v84 = v128;
  char v40 = v129;
  uint64_t v42 = v130;
  uint64_t v41 = v131;
  uint64_t v43 = *(void *)(a2 + 8);
  uint64_t v44 = v102;
  uint64_t v45 = &v102[*(int *)(v95 + 20)];
  uint64_t v46 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v47 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v45, v46, v47);
  *uint64_t v44 = v43;
  v44[1] = v43;
  uint64_t v48 = v106;
  sub_1000987B4((uint64_t)v44, v106);
  *(_WORD *)(v48 + *(int *)(v101 + 36)) = 256;
  uint64_t v49 = (uint64_t)v92;
  sub_1000D778C(v48, (uint64_t)&v92[*(int *)(v96 + 36)]);
  uint64_t v50 = v86;
  uint64_t v51 = v85;
  *(void *)uint64_t v49 = v86;
  *(void *)(v49 + 8) = v51;
  uint64_t v52 = v94;
  *(void *)(v49 + 16) = v88;
  *(void *)(v49 + 24) = v52;
  *(unsigned char *)(v49 + 32) = v39;
  *(void *)(v49 + 40) = v84;
  *(unsigned char *)(v49 + 48) = v40;
  *(void *)(v49 + 56) = v42;
  *(void *)(v49 + 64) = v41;
  id v53 = v50;
  sub_10003AF68(v51);
  sub_10003C44C(v48, &qword_100184AB0);
  sub_100098974((uint64_t)v44);

  sub_10003B0B8(v51);
  uint64_t v54 = static Alignment.center.getter();
  uint64_t v56 = v55;
  uint64_t v57 = (uint64_t)v112;
  uint64_t v58 = (uint64_t)&v112[*(int *)(v113 + 36)];
  uint64_t v59 = v116;
  uint64_t v60 = v91;
  uint64_t v61 = v115;
  sub_1000D5D0C(v116, v58);
  long long v62 = (uint64_t *)(v58 + *(int *)(sub_10003AFD0(&qword_100185BE0) + 36));
  *long long v62 = v54;
  v62[1] = v56;
  uint64_t v63 = sub_1000D77F4(v49, v57, &qword_100185BC0);
  __chkstk_darwin(v63);
  *(&v83 - 4) = v60;
  *(&v83 - 3) = v61;
  uint64_t v64 = v93;
  *(&v83 - 2) = v59;
  *(&v83 - 1) = v64;
  static Alignment.center.getter();
  unint64_t v65 = sub_1000D7304();
  uint64_t v66 = v100;
  View.overlay<A>(alignment:content:)();
  sub_10003C44C(v57, &qword_100185B98);
  v126[0] = v64;
  uint64_t v67 = swift_getWitnessTable();
  unint64_t v123 = v65;
  uint64_t v124 = v67;
  uint64_t v68 = v104;
  uint64_t v69 = swift_getWitnessTable();
  uint64_t v70 = (uint64_t)v89;
  sub_1000D652C((uint64_t)v126, 1, v68, (uint64_t)&type metadata for Int, v69, (uint64_t)&protocol witness table for Int, (uint64_t)v89);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v66, v68);
  sub_1000D349C();
  sub_1000D349C();
  uint64_t v71 = sub_10004F7B0(&qword_100185BE8, &qword_100185BA0);
  uint64_t v121 = v69;
  uint64_t v122 = v71;
  uint64_t v72 = swift_getWitnessTable();
  uint64_t v73 = sub_10004F7B0(&qword_100185BF0, &qword_100185BA8);
  uint64_t v119 = v72;
  uint64_t v120 = v73;
  uint64_t v74 = v109;
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v76 = v107;
  View.offset(x:y:)();
  (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v70, v74);
  uint64_t v117 = v75;
  uint64_t v118 = &protocol witness table for _OffsetEffect;
  uint64_t v77 = v111;
  swift_getWitnessTable();
  uint64_t v78 = v110;
  id v79 = *(void (**)(char *, uint64_t, uint64_t))(v110 + 16);
  Class v80 = v108;
  v79(v108, v76, v77);
  uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
  v81(v76, v77);
  v79(v114, (uint64_t)v80, v77);
  return ((uint64_t (*)(char *, uint64_t))v81)(v80, v77);
}

uint64_t sub_1000D5D0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (uint64_t *)((char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = (char *)v7 + *(int *)(v5 + 28);
  uint64_t v10 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v11 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v9, v10, v11);
  *uint64_t v7 = v8;
  v7[1] = v8;
  uint64_t v12 = static Color.black.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  sub_1000987B4((uint64_t)v7, a2);
  double v13 = *(double *)&v24 * 0.5;
  uint64_t v14 = a2 + *(int *)(sub_10003AFD0(&qword_100185C38) + 68);
  sub_1000987B4((uint64_t)v7, v14);
  *(double *)(v14 + *(int *)(type metadata accessor for RoundedRectangle._Inset() + 20)) = v13;
  uint64_t v15 = v14 + *(int *)(sub_10003AFD0(&qword_100185C40) + 36);
  long long v16 = v25;
  *(_OWORD *)uint64_t v15 = v24;
  *(_OWORD *)(v15 + 16) = v16;
  *(void *)(v15 + 32) = v26;
  uint64_t v17 = sub_10003AFD0(&qword_100185C48);
  *(void *)(v14 + *(int *)(v17 + 52)) = v12;
  *(_WORD *)(v14 + *(int *)(v17 + 56)) = 256;
  uint64_t v18 = static Alignment.center.getter();
  uint64_t v20 = v19;
  uint64_t v21 = (uint64_t *)(v14 + *(int *)(sub_10003AFD0(&qword_100185C50) + 36));
  *uint64_t v21 = v18;
  v21[1] = v20;
  return sub_100098974((uint64_t)v7);
}

uint64_t sub_1000D5ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v20 = a5;
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for HStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  uint64_t v9 = type metadata accessor for VStack();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  double v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v19 - v14;
  static HorizontalAlignment.trailing.getter();
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  VStack.init(alignment:spacing:content:)();
  swift_getWitnessTable();
  long long v16 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v16(v15, v13, v9);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v16(v20, v15, v9);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, v9);
}

uint64_t sub_1000D6120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v20[1] = a5;
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  uint64_t v9 = type metadata accessor for HStack();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  double v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v20 - v14;
  v20[4] = a3;
  v20[5] = a4;
  v20[6] = a1;
  v20[7] = a2;
  static VerticalAlignment.center.getter();
  HStack.init(alignment:spacing:content:)();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v17(v15, v13, v9);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  uint64_t v22 = 0;
  char v23 = 1;
  v24[0] = &v22;
  v17(v13, v15, v9);
  v24[1] = v13;
  v21[0] = &type metadata for Spacer;
  v21[1] = v9;
  v20[8] = &protocol witness table for Spacer;
  v20[9] = WitnessTable;
  sub_1000D2E08((uint64_t)v24, 2uLL, (uint64_t)v21);
  v18(v15, v9);
  return ((uint64_t (*)(char *, uint64_t))v18)(v13, v9);
}

uint64_t sub_1000D6380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v17 - v11;
  (*(void (**)(uint64_t))(v10 + 72))(v13);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v14(v12, v9, a3);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v9, a3);
  v14(v9, v12, a3);
  uint64_t v19 = 0;
  char v20 = 1;
  v21[0] = v9;
  v21[1] = &v19;
  v18[0] = a3;
  v18[1] = &type metadata for Spacer;
  v17[0] = a4;
  v17[1] = &protocol witness table for Spacer;
  sub_1000D2E08((uint64_t)v21, 2uLL, (uint64_t)v18);
  v15(v12, a3);
  return ((uint64_t (*)(char *, uint64_t))v15)(v9, a3);
}

uint64_t sub_1000D652C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v34 = a5;
  v30[1] = a3;
  int v35 = a2;
  uint64_t v43 = a7;
  uint64_t v10 = type metadata accessor for Optional();
  uint64_t v46 = a6;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v39 = v10;
  uint64_t v11 = type metadata accessor for TagValueTraitKey.Value();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  __chkstk_darwin(v11);
  char v40 = (char *)v30 - v12;
  uint64_t v31 = type metadata accessor for TagValueTraitKey.Value();
  uint64_t v13 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v15 = (char *)v30 - v14;
  type metadata accessor for TagValueTraitKey();
  swift_getWitnessTable();
  uint64_t v32 = type metadata accessor for _TraitWritingModifier();
  uint64_t v16 = type metadata accessor for ModifiedContent();
  uint64_t v36 = *(void *)(v16 - 8);
  uint64_t v37 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v30 - v17;
  uint64_t v19 = *(void *)(a4 - 8);
  char v20 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v30[0] = a1;
  v20(v15, a1, a4);
  uint64_t v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
  v21(v15, 0, 1, a4);
  uint64_t v33 = v18;
  uint64_t v22 = v34;
  View._trait<A>(_:_:)();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v31);
  if (v35)
  {
    char v23 = v40;
    v20(v40, v30[0], a4);
    v21(v23, 0, 1, a4);
    uint64_t v24 = swift_checkMetadataState();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = swift_checkMetadataState();
    char v23 = v40;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v40, 1, 1, v25);
  }
  type metadata accessor for TagValueTraitKey();
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v44 = v22;
  uint64_t v45 = v26;
  uint64_t v27 = v37;
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v28 = v33;
  View._trait<A>(_:_:)();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v28, v27);
}

uint64_t sub_1000D69CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10003AFD0(&qword_100185C20);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C374(0, &qword_100185C28);
  id v5 = [self mainRunLoop];
  uint64_t v6 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = static NSTimer.publish(every:tolerance:on:in:options:)();

  sub_10003C44C((uint64_t)v4, &qword_100185C20);
  *(void *)&long long v11 = v7;
  type metadata accessor for NSTimer.TimerPublisher();
  sub_1000D74C0(&qword_100185C30, (void (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v8 = ConnectablePublisher.autoconnect()();
  swift_release();
  long long v11 = *(_OWORD *)(v1 + 24);
  v10[1] = v8;
  sub_10003AFD0(&qword_100185C10);
  return State.wrappedValue.setter();
}

uint64_t sub_1000D6BA0()
{
  return swift_release();
}

uint64_t sub_1000D6C10()
{
  sub_10003AFD0(&qword_100185C08);
  State.wrappedValue.getter();
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  State.wrappedValue.getter();
  unint64_t v2 = *(void *)(v0 + 88);
  if (v2 >> 62)
  {
LABEL_5:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    sub_1000A932C((uint64_t)&v2);
  }
  return State.wrappedValue.setter();
}

void sub_1000D6D00(uint64_t a1, uint64_t a2)
{
  sub_1000D77F4(a2 + 96, (uint64_t)v8, &qword_100185C18);
  sub_1000D77F4((uint64_t)v8, (uint64_t)v9, &qword_100185C18);
  if (v9[8] == 1)
  {
    id v2 = [self sharedApplication];
    id v3 = [v2 connectedScenes];

    sub_10003C374(0, &qword_100183040);
    sub_1000468E0();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_1000AB17C(v4);
    uint64_t v6 = v5;
    swift_bridgeObjectRelease();
    if (v6)
    {
      self;
      uint64_t v7 = (void *)swift_dynamicCastObjCClass();
      if (v7)
      {
        sub_1000AD46C((uint64_t)[v7 interfaceOrientation]);
        type metadata accessor for SelfServiceInstructionsPagerView();
        sub_1000D3434();
      }
    }
  }
}

uint64_t sub_1000D6E58@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000D3754(a1, a2);
}

uint64_t sub_1000D6EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 56);
}

uint64_t sub_1000D6EAC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D6F08(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000D6FC0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = v5;
  return a1;
}

__n128 sub_1000D70B8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_1000D70E4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  return a1;
}

uint64_t sub_1000D7184(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 105)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000D71CC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 104) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 105) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 105) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for SelfServiceInstructionsPagerView()
{
  return sub_10004FB88();
}

uint64_t sub_1000D7240()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D7288@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1000D3D30(a1, (_OWORD *)(v2 + 32), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1000D7294(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000D7304()
{
  unint64_t result = qword_100185BB0;
  if (!qword_100185BB0)
  {
    sub_10003B070(&qword_100185B98);
    sub_1000D73A4();
    sub_10004F7B0(&qword_100185BD8, &qword_100185BE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185BB0);
  }
  return result;
}

unint64_t sub_1000D73A4()
{
  unint64_t result = qword_100185BB8;
  if (!qword_100185BB8)
  {
    sub_10003B070(&qword_100185BC0);
    sub_1000D7444();
    sub_10004F7B0(&qword_100184B08, &qword_100184AB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185BB8);
  }
  return result;
}

unint64_t sub_1000D7444()
{
  unint64_t result = qword_100185BC8;
  if (!qword_100185BC8)
  {
    sub_10003B070(&qword_100185BD0);
    sub_10004F75C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185BC8);
  }
  return result;
}

uint64_t sub_1000D74C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000D7508@<X0>(char *a1@<X8>)
{
  return sub_1000D4B20(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_1000D7518()
{
  return sub_1000D69CC();
}

uint64_t sub_1000D754C()
{
  return sub_1000D6BA0();
}

uint64_t sub_1000D755C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 137, 7);
}

void sub_1000D75BC(uint64_t a1)
{
  sub_1000D6D00(a1, v1 + 32);
}

uint64_t sub_1000D75C8()
{
  return sub_1000D6C10();
}

uint64_t sub_1000D7600()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 137) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000D76F4@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 137) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_1000D5104(a1, v2 + 32, v8, v5, v6, a2);
}

uint64_t sub_1000D778C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003AFD0(&qword_100184AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D77F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10003AFD0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000D7858@<X0>(char *a1@<X8>)
{
  return sub_1000D5ED4(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_1000D7864@<X0>(uint64_t a1@<X8>)
{
  return sub_1000D6120(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_1000D7870()
{
  return sub_1000D6380(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t sub_1000D787C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000D7D60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000DB650(a1);
  if (v6) {
    goto LABEL_10;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    uint64_t v7 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a2;
    uint64_t v11 = 1;
  }
  else
  {
    sub_1000DB6F0(result, v5, a1, a2);
    uint64_t v12 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a2;
    uint64_t v11 = 0;
  }

  return v8(v10, v11, 1, v9);
}

uint64_t sub_1000D7E44(uint64_t a1)
{
  uint64_t result = sub_1000DB650(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_1000DBFD0(result, v3, 0, a1);
  sub_100060C08(v5, v6);
  return v5;
}

uint64_t sub_1000D7EC0(uint64_t a1)
{
  return sub_1000D7EF0(a1, (uint64_t (*)(uint64_t, uint64_t, BOOL, uint64_t))sub_1000DB798);
}

uint64_t sub_1000D7ED8(uint64_t a1)
{
  return sub_1000D7EF0(a1, (uint64_t (*)(uint64_t, uint64_t, BOOL, uint64_t))sub_1000DBABC);
}

uint64_t sub_1000D7EF0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, BOOL, uint64_t))
{
  unint64_t v4 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v5 = __CocoaSet.startIndex.getter();
    uint64_t v7 = v6;
    __CocoaSet.endIndex.getter();
    char v8 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_100060E38(v5, v7, v4 != 0);
      return 0;
    }
LABEL_7:
    uint64_t v9 = a2(v5, v7, v4 != 0, a1);
    sub_100060E38(v5, v7, v4 != 0);
    return v9;
  }
  uint64_t result = sub_1000DBD34(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v7 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v5 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000D8010(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_1000D801C()
{
  uint64_t v1 = v0;
  uint64_t result = type metadata accessor for ModalPresentationCoordinator(0);
  uint64_t v3 = *(int *)(result + 20);
  if (*(unsigned char *)(v0 + v3) == 1)
  {
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100123B50;
    if (qword_1001827C8 != -1) {
      swift_once();
    }
    uint64_t v5 = (void *)qword_10018A3E8;
    *(void *)(v4 + 56) = sub_10003C374(0, (unint64_t *)&qword_1001832C0);
    *(void *)(v4 + 64) = sub_10004D94C();
    *(void *)(v4 + 32) = v5;
    id v6 = v5;
    uint64_t v7 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    *(unsigned char *)(v1 + v3) = 0;
    return sub_1000D8460();
  }
  return result;
}

uint64_t sub_1000D815C(void (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v31 = (uint64_t)&v28 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v28 - v16;
  uint64_t result = type metadata accessor for ModalPresentationCoordinator(0);
  uint64_t v19 = *(int *)(result + 20);
  if ((*(unsigned char *)(v3 + v19) & 1) == 0)
  {
    uint64_t v28 = v13;
    unint64_t v29 = a1;
    uint64_t v30 = a2;
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_100123B50;
    if (qword_1001827C8 != -1) {
      swift_once();
    }
    uint64_t v21 = (void *)qword_10018A3E8;
    *(void *)(v20 + 56) = sub_10003C374(0, (unint64_t *)&qword_1001832C0);
    *(void *)(v20 + 64) = sub_10004D94C();
    *(void *)(v20 + 32) = v21;
    id v22 = v21;
    char v23 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    *(unsigned char *)(v3 + v19) = 1;
    sub_1000D9070(v3, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      return sub_100044E28((uint64_t)v8);
    }
    else
    {
      sub_10003C4A8((uint64_t)v8, (uint64_t)v17);
      id v24 = sub_1000D96A4();
      if (v24)
      {
        uint64_t v25 = v24;
        v17[*(int *)(v9 + 32)] = 0;
        uint64_t v26 = (uint64_t)v28;
        sub_10003C3E8((uint64_t)v17, (uint64_t)v28);
        uint64_t v27 = v31;
        sub_1000B8C2C(v31, v26);
        sub_10003C50C(v27);
        sub_1000D986C(v25, 0, 0, 1, v29, v30);
      }
      return sub_10003C50C((uint64_t)v17);
    }
  }
  return result;
}

uint64_t sub_1000D8460()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v71 = *(void *)(v2 - 8);
  uint64_t v72 = v2;
  __chkstk_darwin(v2);
  uint64_t v69 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for DispatchQoS();
  uint64_t v68 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v67 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v63 = (uint64_t)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v73 = (uint64_t)&v63 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v63 - v10;
  uint64_t v12 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v66 = (uint64_t)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v63 - v17;
  uint64_t v65 = v19;
  __chkstk_darwin(v16);
  uint64_t v21 = (id *)((char *)&v63 - v20);
  uint64_t v22 = type metadata accessor for ModalPresentationCoordinator(0);
  uint64_t v23 = swift_bridgeObjectRetain();
  sub_1000D9E5C(v23, (uint64_t)v11);
  swift_bridgeObjectRelease();
  uint64_t v64 = v13;
  id v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  uint64_t v74 = v12;
  if (v24(v11, 1, v12) == 1) {
    return sub_100044E28((uint64_t)v11);
  }
  sub_10003C4A8((uint64_t)v11, (uint64_t)v21);
  id v26 = sub_1000D96A4();
  if (!v26)
  {
    uint64_t v27 = v21;
    if (*(unsigned char *)(v1 + *(int *)(v22 + 20))) {
      return sub_10003C50C((uint64_t)v27);
    }
    uint64_t v28 = v1;
    uint64_t v29 = (uint64_t)v27;
    id v30 = *v27;
    uint64_t v31 = swift_bridgeObjectRetain();
    uint64_t v32 = sub_1000DC28C(v31, v30);
    uint64_t v33 = v73;
    sub_1000D7D60(v32, v73);
    swift_release();
    if (v24((char *)v33, 1, v74) == 1)
    {
      sub_100044E28(v33);
    }
    else
    {
      sub_10003C4A8(v33, (uint64_t)v18);
      uint64_t v34 = v63;
      sub_1000B7DBC((uint64_t)v18, v63);
      sub_100044E28(v34);
      sub_10003C50C((uint64_t)v18);
    }

    if (*(unsigned char *)(v29 + 8) != 1) {
      goto LABEL_32;
    }
    uint64_t v35 = v29 + *(int *)(v74 + 44);
    if ((*(unsigned char *)(v35 + 32) & 1) == 0)
    {
      double v37 = *(double *)(v35 + 16);
      double v36 = *(double *)(v35 + 24);
      double v39 = *(double *)v35;
      double v38 = *(double *)(v35 + 8);
      id v40 = [v30 popoverPresentationController];
      [v40 setSourceRect:v39, v38, v37, v36];

      id v41 = [v30 popoverPresentationController];
      if (v41)
      {
        uint64_t v42 = v41;
        [v41 setPermittedArrowDirections:3];
      }
    }
    id v43 = [v30 popoverPresentationController];
    if (!v43)
    {
LABEL_32:
      sub_100044E28(v28);
      sub_10003C3E8(v29, v28);
      uint64_t v54 = v64 + 56;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v64 + 56))(v28, 0, 1, v74);
      sub_10003C374(0, (unint64_t *)&qword_100182E40);
      uint64_t v55 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v56 = v66;
      sub_10003C3E8(v29, v66);
      unint64_t v57 = (*(unsigned __int8 *)(v54 + 24) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 24);
      uint64_t v58 = swift_allocObject();
      sub_10003C4A8(v56, v58 + v57);
      aBlock[4] = sub_1000DC54C;
      aBlock[5] = v58;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000358AC;
      aBlock[3] = &unk_100153188;
      uint64_t v59 = _Block_copy(aBlock);
      swift_release();
      uint64_t v60 = v67;
      static DispatchQoS.unspecified.getter();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_1000DA82C((unint64_t *)&qword_100183E90, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10003AFD0((uint64_t *)&unk_100182E50);
      sub_10003B014();
      uint64_t v61 = v69;
      uint64_t v62 = v72;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v59);

      (*(void (**)(char *, uint64_t))(v71 + 8))(v61, v62);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v60, v70);
      uint64_t v27 = (id *)v29;
      return sub_10003C50C((uint64_t)v27);
    }
    uint64_t v44 = v43;
    uint64_t v45 = (void *)qword_100183500;
    if (qword_100183500)
    {
      type metadata accessor for SelfServiceDestinationPickerViewController();
      if (!swift_dynamicCastClass())
      {
        id v52 = v45;
LABEL_30:
        uint64_t v51 = v52;
        goto LABEL_31;
      }
    }
    if (qword_100182750 != -1) {
      swift_once();
    }
    id v46 = [(id)qword_10018A380 viewControllers];
    sub_10003C374(0, (unint64_t *)&qword_100183670);
    unint64_t v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v48)
      {
LABEL_20:
        unint64_t v49 = v48 - 1;
        if (__OFSUB__(v48, 1))
        {
          __break(1u);
        }
        else if ((v47 & 0xC000000000000001) == 0)
        {
          if ((v49 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v49 < *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v50 = *(id *)(v47 + 8 * v49 + 32);
LABEL_25:
            uint64_t v51 = v50;
            swift_bridgeObjectRelease();
LABEL_31:
            id v53 = [v51 view];

            [v44 setSourceView:v53];
            goto LABEL_32;
          }
          __break(1u);
          goto LABEL_38;
        }
        id v50 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v48) {
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_100182748 == -1)
    {
LABEL_29:
      id v52 = (id)qword_10018A370;
      goto LABEL_30;
    }
LABEL_38:
    swift_once();
    goto LABEL_29;
  }

  uint64_t v27 = v21;
  return sub_10003C50C((uint64_t)v27);
}

uint64_t type metadata accessor for ModalPresentationCoordinator.QueueEntry(uint64_t a1)
{
  return sub_1000D9038(a1, qword_100185CB0);
}

uint64_t type metadata accessor for ModalPresentationCoordinator(uint64_t a1)
{
  return sub_1000D9038(a1, (uint64_t *)&unk_100185D58);
}

uint64_t sub_1000D9038(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000D9070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_1000D90D8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void *sub_1000D90F4@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_1000D9114(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  char v16 = a2 & 1;
  uint64_t v17 = (int *)type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v18 = a9 + v17[9];
  *(void *)a9 = a1;
  *(unsigned char *)(a9 + 8) = v16;
  *(void *)(a9 + 16) = a3;
  id v19 = a1;
  Date.init()();
  *(unsigned char *)(a9 + v17[8]) = a4;
  *(void *)uint64_t v18 = a5;
  *(unsigned char *)(v18 + 8) = a6 & 1;
  id v20 = [v19 popoverPresentationController];
  uint64_t v21 = v20;
  if (v20)
  {
    [v20 sourceRect];
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
  }
  else
  {

    uint64_t v23 = 0;
    uint64_t v25 = 0;
    uint64_t v27 = 0;
    uint64_t v29 = 0;
  }
  id v30 = (void *)(a9 + v17[10]);
  uint64_t v31 = a9 + v17[11];
  *(void *)uint64_t v31 = v23;
  *(void *)(v31 + 8) = v25;
  *(void *)(v31 + 16) = v27;
  *(void *)(v31 + 24) = v29;
  *(unsigned char *)(v31 + 32) = v21 == 0;
  *id v30 = a7;
  v30[1] = a8;
}

Swift::Int sub_1000D9260()
{
  uint64_t v1 = v0;
  Hasher.init(_seed:)();
  id v2 = *v0;
  NSObject.hash(into:)();

  Hasher._combine(_:)(*((unsigned __int8 *)v1 + 8));
  Hasher._combine(_:)((Swift::UInt)v1[2]);
  type metadata accessor for Date();
  sub_1000DA82C((unint64_t *)&qword_1001857B8, (void (*)(uint64_t))&type metadata accessor for Date);
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

uint64_t sub_1000D9330()
{
  uint64_t v1 = v0;
  id v2 = *v0;
  NSObject.hash(into:)();

  Hasher._combine(_:)(*((unsigned __int8 *)v1 + 8));
  Hasher._combine(_:)((Swift::UInt)v1[2]);
  type metadata accessor for Date();
  sub_1000DA82C((unint64_t *)&qword_1001857B8, (void (*)(uint64_t))&type metadata accessor for Date);
  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int sub_1000D93E4()
{
  uint64_t v1 = v0;
  Hasher.init(_seed:)();
  id v2 = *v0;
  NSObject.hash(into:)();

  Hasher._combine(_:)(*((unsigned __int8 *)v1 + 8));
  Hasher._combine(_:)((Swift::UInt)v1[2]);
  type metadata accessor for Date();
  sub_1000DA82C((unint64_t *)&qword_1001857B8, (void (*)(uint64_t))&type metadata accessor for Date);
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

uint64_t sub_1000D94B0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  if (v2 != v3) {
    return v3 & (v2 ^ 1u);
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a2 + 16);
  if (v5 == v6) {
    return static Date.< infix(_:_:)();
  }
  else {
    return v5 < v6;
  }
}

BOOL sub_1000D94F4(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == v3)
  {
    uint64_t v5 = *(void *)(a2 + 16);
    uint64_t v6 = *(void *)(a1 + 16);
    if (v5 == v6) {
      char v4 = static Date.< infix(_:_:)();
    }
    else {
      char v4 = v5 < v6;
    }
  }
  else
  {
    char v4 = v3 & (v2 ^ 1);
  }
  return (v4 & 1) == 0;
}

BOOL sub_1000D9558(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  if (v2 == v3)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    uint64_t v6 = *(void *)(a2 + 16);
    if (v5 == v6) {
      char v4 = static Date.< infix(_:_:)();
    }
    else {
      char v4 = v5 < v6;
    }
  }
  else
  {
    char v4 = v3 & (v2 ^ 1);
  }
  return (v4 & 1) == 0;
}

uint64_t sub_1000D95B8(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v2 != v3) {
    return v3 & (v2 ^ 1u);
  }
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v5 == v6) {
    return static Date.< infix(_:_:)();
  }
  else {
    return v5 < v6;
  }
}

uint64_t sub_1000D9604()
{
  uint64_t v0 = type metadata accessor for ModalPresentationCoordinator(0);
  sub_1000DBF6C(v0, qword_10018A440);
  uint64_t v1 = sub_10003C3B0(v0, (uint64_t)qword_10018A440);
  uint64_t v2 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(unsigned char *)(v1 + *(int *)(v0 + 20)) = 0;
  *(void *)(v1 + *(int *)(v0 + 24)) = &_swiftEmptySetSingleton;
  return result;
}

id sub_1000D96A4()
{
  uint64_t v0 = (void *)qword_100183500;
  if (qword_100183500)
  {
    type metadata accessor for SelfServiceDestinationPickerViewController();
    if (!swift_dynamicCastClass())
    {
      id v7 = v0;
LABEL_17:
      uint64_t v6 = v7;
      goto LABEL_18;
    }
  }
  if (qword_100182750 != -1) {
    swift_once();
  }
  id v1 = [(id)qword_10018A380 viewControllers];
  sub_10003C374(0, (unint64_t *)&qword_100183670);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_7;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    if (qword_100182748 == -1)
    {
LABEL_16:
      id v7 = (id)qword_10018A370;
      goto LABEL_17;
    }
LABEL_23:
    swift_once();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_15;
  }
LABEL_7:
  unint64_t v4 = v3 - 1;
  if (__OFSUB__(v3, 1))
  {
    __break(1u);
    goto LABEL_20;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
LABEL_20:
    id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_12;
  }
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v4 >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v5 = *(id *)(v2 + 8 * v4 + 32);
LABEL_12:
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
LABEL_18:
  id v8 = [v6 presentedViewController];

  return v8;
}

uint64_t sub_1000D986C(void *a1, int a2, uint64_t a3, int a4, void (*a5)(void), uint64_t a6)
{
  int v24 = a4;
  int v25 = a2;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v27 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v26 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = sub_1000D96A4();
  if (v16)
  {
    uint64_t v17 = v16;
    sub_10003C374(0, &qword_100185910);
    if (static NSObject.== infix(_:_:)())
    {
      sub_10003C374(0, (unint64_t *)&qword_100182E40);
      uint64_t v23 = static OS_dispatch_queue.main.getter();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = a3;
      *(unsigned char *)(v18 + 24) = v24 & 1;
      *(void *)(v18 + 32) = a1;
      *(unsigned char *)(v18 + 40) = v25 & 1;
      *(void *)(v18 + 48) = a5;
      *(void *)(v18 + 56) = a6;
      aBlock[4] = sub_10003C5B0;
      aBlock[5] = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000358AC;
      aBlock[3] = &unk_100153110;
      id v19 = _Block_copy(aBlock);
      id v20 = a1;
      sub_10003AF68((uint64_t)a5);
      swift_release();
      static DispatchQoS.unspecified.getter();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_1000DA82C((unint64_t *)&qword_100183E90, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10003AFD0((uint64_t *)&unk_100182E50);
      sub_10003B014();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      uint64_t v21 = (void *)v23;
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v19);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v10);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v13);
      return 1;
    }
  }
  if (a5) {
    a5();
  }
  return 0;
}

void sub_1000D9BC8(void **a1)
{
  uint64_t v2 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  v25[0] = (uint64_t)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)v25 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (void **)((char *)v25 - v9);
  uint64_t v11 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  type metadata accessor for ModalPresentationCoordinator(0);
  id v15 = v14;
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = sub_1000DC28C(v16, v15);

  sub_1000D7D60(v17, (uint64_t)v13);
  swift_release();
  LODWORD(v2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v13, 1, v2);
  sub_100044E28((uint64_t)v13);
  sub_10003C3E8((uint64_t)a1, (uint64_t)v10);
  if (v2 != 1)
  {
    sub_10003C50C((uint64_t)v10);
    return;
  }
  id v18 = sub_1000D96A4();
  if (v18)
  {
    id v19 = v18;
    id v20 = *v10;
    sub_10003C374(0, (unint64_t *)&qword_100183670);
    id v21 = v20;
    char v22 = static NSObject.== infix(_:_:)();
    sub_10003C50C((uint64_t)v10);

    if (v22) {
      return;
    }
  }
  else
  {
    sub_10003C50C((uint64_t)v10);
  }
  uint64_t v23 = v25[0];
  sub_10003C3E8((uint64_t)a1, v25[0]);
  sub_1000B8C2C((uint64_t)v8, v23);
  sub_10003C50C((uint64_t)v8);
  id v24 = sub_1000D96A4();
  if (v24) {

  }
  else {
    sub_1000D8460();
  }
}

uint64_t sub_1000D9E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v4 = __chkstk_darwin(v47);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v44 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v44 - v11;
  __chkstk_darwin(v10);
  id v15 = (char *)&v44 - v14;
  uint64_t v16 = a1 + 56;
  char v17 = *(unsigned char *)(a1 + 32);
  uint64_t v18 = 1 << v17;
  uint64_t v19 = -1;
  if (1 << v17 < 64) {
    uint64_t v19 = ~(-1 << (1 << v17));
  }
  unint64_t v20 = v19 & *(void *)(a1 + 56);
  if (!v20)
  {
    unsigned int v26 = v17 & 0x3F;
    if (v26 > 6)
    {
      int64_t v24 = (unint64_t)(v18 + 63) >> 6;
      unint64_t v38 = *(void *)(a1 + 64);
      if (v38)
      {
        uint64_t v46 = a2;
        uint64_t v21 = 1;
        goto LABEL_38;
      }
      if (v26 >= 8)
      {
        unint64_t v38 = *(void *)(a1 + 72);
        uint64_t v46 = a2;
        if (v38)
        {
          uint64_t v21 = 2;
        }
        else
        {
          unint64_t v38 = *(void *)(a1 + 80);
          if (!v38) {
            goto LABEL_45;
          }
          uint64_t v21 = 3;
        }
        goto LABEL_38;
      }
    }
LABEL_57:
    uint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
    uint64_t v43 = v47;
    return v42(a2, 1, 1, v43);
  }
  uint64_t v46 = a2;
  uint64_t v21 = 0;
  unint64_t v22 = __clz(__rbit64(v20));
  unint64_t v23 = (v20 - 1) & v20;
  int64_t v24 = (unint64_t)(v18 + 63) >> 6;
  while (1)
  {
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v45 = v13;
    a2 = *(void *)(v13 + 72);
    sub_10003C3E8(v25 + a2 * v22, (uint64_t)v12);
    sub_10003C4A8((uint64_t)v12, (uint64_t)v15);
    swift_bridgeObjectRetain();
    uint64_t v12 = (char *)v47;
    while (v23)
    {
      while (1)
      {
        unint64_t v27 = __clz(__rbit64(v23));
        v23 &= v23 - 1;
        unint64_t v28 = v27 | (v21 << 6);
LABEL_25:
        sub_10003C3E8(*(void *)(a1 + 48) + v28 * a2, (uint64_t)v6);
        sub_10003C4A8((uint64_t)v6, (uint64_t)v9);
        int v32 = v15[8];
        int v33 = v9[8];
        if (v32 == v33) {
          break;
        }
        if (v33 & (v32 ^ 1)) {
          goto LABEL_32;
        }
LABEL_7:
        sub_10003C50C((uint64_t)v9);
        if (!v23) {
          goto LABEL_9;
        }
      }
      uint64_t v34 = *((void *)v15 + 2);
      uint64_t v35 = *((void *)v9 + 2);
      if (v34 == v35)
      {
        if (static Date.< infix(_:_:)()) {
          goto LABEL_32;
        }
        goto LABEL_7;
      }
      if (v34 >= v35) {
        goto LABEL_7;
      }
LABEL_32:
      sub_10003C50C((uint64_t)v15);
      sub_10003C4A8((uint64_t)v9, (uint64_t)v15);
    }
LABEL_9:
    int64_t v29 = v21 + 1;
    if (!__OFADD__(v21, 1)) {
      break;
    }
    __break(1u);
LABEL_45:
    if (v26 < 9) {
      goto LABEL_57;
    }
    unint64_t v38 = *(void *)(a1 + 88);
    if (v38)
    {
      uint64_t v21 = 4;
      goto LABEL_38;
    }
    unint64_t v38 = *(void *)(a1 + 96);
    if (v38)
    {
      uint64_t v21 = 5;
      goto LABEL_38;
    }
LABEL_51:
    uint64_t v39 = 0;
    uint64_t v40 = 6;
    if (v24 > 6) {
      uint64_t v40 = v24;
    }
    uint64_t v41 = v40 - 6;
    do
    {
      if (v41 == v39) {
        goto LABEL_57;
      }
      unint64_t v38 = *(void *)(a1 + 104 + 8 * v39++);
    }
    while (!v38);
    uint64_t v21 = v39 + 5;
LABEL_38:
    unint64_t v23 = (v38 - 1) & v38;
    unint64_t v22 = __clz(__rbit64(v38)) + (v21 << 6);
  }
  if (v29 >= v24) {
    goto LABEL_34;
  }
  unint64_t v30 = *(void *)(v16 + 8 * v29);
  ++v21;
  if (v30) {
    goto LABEL_24;
  }
  uint64_t v21 = v29 + 1;
  if (v29 + 1 >= v24) {
    goto LABEL_34;
  }
  unint64_t v30 = *(void *)(v16 + 8 * v21);
  if (v30) {
    goto LABEL_24;
  }
  uint64_t v21 = v29 + 2;
  if (v29 + 2 >= v24) {
    goto LABEL_34;
  }
  unint64_t v30 = *(void *)(v16 + 8 * v21);
  if (v30) {
    goto LABEL_24;
  }
  uint64_t v21 = v29 + 3;
  if (v29 + 3 >= v24) {
    goto LABEL_34;
  }
  unint64_t v30 = *(void *)(v16 + 8 * v21);
  if (v30) {
    goto LABEL_24;
  }
  int64_t v31 = v29 + 4;
  if (v31 < v24)
  {
    unint64_t v30 = *(void *)(v16 + 8 * v31);
    if (v30)
    {
      uint64_t v21 = v31;
LABEL_24:
      unint64_t v23 = (v30 - 1) & v30;
      unint64_t v28 = __clz(__rbit64(v30)) + (v21 << 6);
      goto LABEL_25;
    }
    while (1)
    {
      uint64_t v21 = v31 + 1;
      if (__OFADD__(v31, 1)) {
        break;
      }
      if (v21 >= v24) {
        goto LABEL_34;
      }
      unint64_t v30 = *(void *)(v16 + 8 * v21);
      ++v31;
      if (v30) {
        goto LABEL_24;
      }
    }
    __break(1u);
    goto LABEL_51;
  }
LABEL_34:
  swift_release();
  uint64_t v36 = v46;
  sub_10003C4A8((uint64_t)v15, v46);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(v45 + 56))(v36, 0, 1, v12);
}

void sub_1000DA2A4(id *a1)
{
  uint64_t v2 = (int *)type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v3 = (char *)a1 + v2[9];
  if ((v3[8] & 1) == 0) {
    [*a1 setModalTransitionStyle:*(void *)v3];
  }
  uint64_t v4 = (void *)qword_100183500;
  if (!qword_100183500
    || (type metadata accessor for SelfServiceDestinationPickerViewController(), swift_dynamicCastClass()))
  {
    if (qword_100182750 != -1) {
      swift_once();
    }
    id v5 = [(id)qword_10018A380 viewControllers];
    sub_10003C374(0, (unint64_t *)&qword_100183670);
    unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v7)
      {
LABEL_9:
        unint64_t v8 = v7 - 1;
        if (__OFSUB__(v7, 1))
        {
          __break(1u);
        }
        else if ((v6 & 0xC000000000000001) == 0)
        {
          if ((v8 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v8 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v9 = *(id *)(v6 + 8 * v8 + 32);
LABEL_14:
            uint64_t v10 = v9;
            swift_bridgeObjectRelease();
            goto LABEL_20;
          }
          __break(1u);
          goto LABEL_28;
        }
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v7) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_100182748 == -1)
    {
LABEL_18:
      id v11 = (id)qword_10018A370;
      goto LABEL_19;
    }
LABEL_28:
    swift_once();
    goto LABEL_18;
  }
  id v11 = v4;
LABEL_19:
  uint64_t v10 = v11;
LABEL_20:
  id v12 = *a1;
  uint64_t v13 = *((unsigned __int8 *)a1 + v2[8]);
  uint64_t v14 = (id *)((char *)a1 + v2[10]);
  if (*v14)
  {
    uint64_t v15 = v14[1];
    v17[4] = *v14;
    v17[5] = v15;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    void v17[2] = sub_1000358AC;
    v17[3] = &unk_1001531B0;
    uint64_t v16 = _Block_copy(v17);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v10 presentViewController:v12 animated:v13 completion:v16];
  _Block_release(v16);
}

void sub_1000DA54C(uint64_t a1, char a2, id a3, char a4, void *a5, uint64_t a6)
{
  if ((a2 & 1) == 0) {
    [a3 setModalTransitionStyle:a1];
  }
  id v9 = (void *)qword_100183500;
  if (qword_100183500)
  {
    type metadata accessor for SelfServiceDestinationPickerViewController();
    if (!swift_dynamicCastClass())
    {
      id v15 = v9;
      if (!a5) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  if (qword_100182750 != -1) {
    swift_once();
  }
  id v10 = [(id)qword_10018A380 viewControllers];
  sub_10003C374(0, (unint64_t *)&qword_100183670);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v11 >> 62))
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_9;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    if (qword_100182748 == -1) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_19;
  }
LABEL_9:
  unint64_t v13 = v12 - 1;
  if (__OFSUB__(v12, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  if ((v11 & 0xC000000000000001) != 0)
  {
LABEL_24:
    id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_14:
    id v15 = v14;
    swift_bridgeObjectRelease();
    if (!a5) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 < *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v14 = *(id *)(v11 + 8 * v13 + 32);
    goto LABEL_14;
  }
  __break(1u);
LABEL_27:
  swift_once();
LABEL_20:
  id v15 = (id)qword_10018A370;
  if (a5)
  {
LABEL_21:
    v16[4] = a5;
    v16[5] = a6;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_1000358AC;
    v16[3] = &unk_100153138;
    a5 = _Block_copy(v16);
    swift_retain();
    swift_release();
  }
LABEL_22:
  [v15 dismissViewControllerAnimated:a4 & 1 completion:a5];
  _Block_release(a5);
}

uint64_t sub_1000DA7CC()
{
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000DA814(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000DA824()
{
  return swift_release();
}

uint64_t sub_1000DA82C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000DA874(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v33 = a1;
  uint64_t v7 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  __chkstk_darwin(v7);
  id v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_10003AFD0(&qword_1001857C0);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v10 = result;
  uint64_t v32 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v33;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v32)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v33[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v32) {
          goto LABEL_37;
        }
        unint64_t v18 = v33[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v32) {
            goto LABEL_37;
          }
          unint64_t v18 = v33[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v32) {
              goto LABEL_37;
            }
            unint64_t v18 = v33[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v32) {
                  goto LABEL_37;
                }
                unint64_t v18 = v33[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = *(void *)(v34 + 72);
    sub_10003C3E8(*(void *)(a4 + 48) + v20 * v16, (uint64_t)v9);
    Hasher.init(_seed:)();
    id v21 = *(id *)v9;
    NSObject.hash(into:)();

    Hasher._combine(_:)(v9[8]);
    Hasher._combine(_:)(*((void *)v9 + 2));
    type metadata accessor for Date();
    sub_1000DA82C((unint64_t *)&qword_1001857B8, (void (*)(uint64_t))&type metadata accessor for Date);
    dispatch thunk of Hashable.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v14 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v14 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v14 + 8 * v24);
      }
      while (v29 == -1);
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(void *)(v14 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t result = sub_10003C4A8((uint64_t)v9, *(void *)(v10 + 48) + v25 * v20);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000DAC0C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    id v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_10003AFD0(&qword_1001857F0);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  id v9 = (void *)result;
  uint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::Int v18 = v9[5];
    id v19 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = NSObject._rawHashValue(seed:)(v18);
    uint64_t v20 = -1 << *((unsigned char *)v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(v9[6] + 8 * v23) = v19;
    ++v9[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v29[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000DAE6C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_39:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_10003AFD0(&qword_1001857F8);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_42;
    }
    if (v14 >= v30) {
      goto LABEL_39;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_39;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_39;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    Hasher.init(_seed:)();
    if (v18 >= 9)
    {
      swift_bridgeObjectRetain();
      String.hash(into:)();
    }
    else
    {
      Hasher._combine(_:)(qword_100126390[v18]);
      sub_100060C08(v19, v18);
    }
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    BOOL v28 = (uint64_t *)(*((void *)v8 + 6) + 16 * v23);
    *BOOL v28 = v19;
    v28[1] = v18;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (!v5) {
      goto LABEL_39;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_39;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_39;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_1000DB130(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_10003AFD0(&qword_1001857E0);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    BOOL v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *BOOL v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000DB3C8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_10003AFD0(&qword_1001857D8);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v6 = result;
  uint64_t v30 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= a2)
      {
LABEL_37:
        swift_release();
        return v6;
      }
      unint64_t v16 = v30[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          goto LABEL_37;
        }
        unint64_t v16 = v30[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            goto LABEL_37;
          }
          unint64_t v16 = v30[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              goto LABEL_37;
            }
            unint64_t v16 = v30[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  goto LABEL_37;
                }
                unint64_t v16 = v30[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    sub_10007F0B4(*(void *)(a4 + 48) + 40 * v14, (uint64_t)v31);
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v6 + 40));
    uint64_t v18 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v12 + 8 * v20);
      }
      while (v25 == -1);
      unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(void *)(v12 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v6 + 48) + 40 * v21;
    long long v27 = v31[0];
    long long v28 = v31[1];
    *(void *)(v26 + 32) = v32;
    *(_OWORD *)uint64_t v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(void *)(v6 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000DB650(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  unint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1000DB6F0@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (result < 0 || 1 << *(unsigned char *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a3 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a3 + 36) != a2)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v5 = *(void *)(a3 + 48);
  uint64_t v6 = v5
     + *(void *)(*(void *)(type metadata accessor for ModalPresentationCoordinator.QueueEntry(0) - 8) + 72)
     * result;

  return sub_10003C3E8(v6, a4);
}

uint64_t sub_1000DB798(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      type metadata accessor for CardState();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v6 = v23;
      swift_unknownObjectRelease();
      return v6;
    }
    goto LABEL_27;
  }
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
    {
      __break(1u);
      goto LABEL_25;
    }
    if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
    {
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    if (*(_DWORD *)(a4 + 36) == a2)
    {
LABEL_22:
      uint64_t v6 = *(void *)(*(void *)(a4 + 48) + 8 * v5);
      swift_retain();
      return v6;
    }
    __break(1u);
  }
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  __CocoaSet.Index.element.getter();
  type metadata accessor for CardState();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  Hasher.init(_seed:)();
  id v7 = [*(id *)(v23 + 40) serialNumber];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v5 = v8 & ~v9;
  if ((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v10 = ~v9;
    while (1)
    {
      uint64_t v11 = *(void **)(*(void *)(*(void *)(a4 + 48) + 8 * v5) + 40);
      swift_retain();
      id v12 = [v11 serialNumber];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      id v16 = [*(id *)(v23 + 40) serialNumber];
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;

      if (v13 == v17 && v15 == v19) {
        goto LABEL_20;
      }
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v21) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v10;
      if (((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      {
        swift_release();
        __break(1u);
LABEL_20:
        swift_release();
        swift_release();
        swift_bridgeObjectRelease_n();
        goto LABEL_22;
      }
    }
    swift_release();
    goto LABEL_22;
  }
LABEL_28:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_1000DBABC(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_10003C374(0, &qword_100185018);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_10003C374(0, &qword_100185018);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_1000DBD34(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1000DBDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  unint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  char v13 = (char *)&v22 - v12;
  __chkstk_darwin(v11);
  id v15 = (char *)&v22 - v14;
  int v16 = *(unsigned __int8 *)(a1 + 8);
  int v17 = *(unsigned __int8 *)(a2 + 8);
  sub_10003C3E8(a1, (uint64_t)&v22 - v14);
  sub_10003C3E8(a2, (uint64_t)v13);
  if (v16 != v17)
  {
    sub_10003C50C((uint64_t)v13);
    sub_10003C50C((uint64_t)v15);
    sub_10003C3E8(a1, (uint64_t)v10);
    sub_10003C3E8(a2, (uint64_t)v7);
LABEL_5:
    char v20 = 0;
    goto LABEL_6;
  }
  uint64_t v18 = *((void *)v15 + 2);
  uint64_t v19 = *((void *)v13 + 2);
  sub_10003C50C((uint64_t)v13);
  sub_10003C50C((uint64_t)v15);
  sub_10003C3E8(a1, (uint64_t)v10);
  sub_10003C3E8(a2, (uint64_t)v7);
  if (v18 != v19) {
    goto LABEL_5;
  }
  char v20 = static Date.== infix(_:_:)();
LABEL_6:
  sub_10003C50C((uint64_t)v7);
  sub_10003C50C((uint64_t)v10);
  return v20 & 1;
}

uint64_t *sub_1000DBF6C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000DBFD0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1000DC024(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v23 = a1;
  uint64_t v4 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = __chkstk_darwin(v4 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = 0;
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(a3 + 56);
  uint64_t v25 = a3 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v18 >= v14) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v25 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_24;
      }
      unint64_t v19 = *(void *)(v25 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v14) {
          goto LABEL_24;
        }
        unint64_t v19 = *(void *)(v25 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_5:
    sub_10003C3E8(*(void *)(a3 + 48) + *(void *)(v5 + 72) * v16, (uint64_t)v8);
    sub_10003C374(0, &qword_100185910);
    char v17 = static NSObject.== infix(_:_:)();
    uint64_t result = sub_10003C50C((uint64_t)v8);
    if (v17)
    {
      *(unint64_t *)((char *)v23 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_1000DA874(v23, v22, v24, a3);
      }
    }
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v14) {
    goto LABEL_24;
  }
  unint64_t v19 = *(void *)(v25 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v25 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1000DC28C(uint64_t a1, void *a2)
{
  char v4 = *(unsigned char *)(a1 + 32);
  unsigned int v5 = v4 & 0x3F;
  unint64_t v6 = (unint64_t)((1 << v4) + 63) >> 6;
  uint64_t isStackAllocationSafe = a2;
  uint64_t v8 = (void *)isStackAllocationSafe;
  if (v5 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    int64_t v9 = (char *)&v15 - ((8 * v6 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v9, 8 * v6);
    id v10 = v8;
    uint64_t v11 = sub_1000DC024((unint64_t *)v9, v6, a1);
    swift_release();

    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v12 = (void *)swift_slowAlloc();
    bzero(v12, 8 * v6);
    id v13 = v8;
    uint64_t v11 = sub_1000DC024((unint64_t *)v12, v6, a1);
    swift_release();

    swift_slowDealloc();
  }
  return v11;
}

uint64_t sub_1000DC440()
{
  unint64_t v1 = (int *)(type metadata accessor for ModalPresentationCoordinator.QueueEntry(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  uint64_t v5 = v0 + v3 + v1[9];
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  if (*(void *)(v0 + v3 + v1[12])) {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_1000DC54C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ModalPresentationCoordinator.QueueEntry(0) - 8);
  uint64_t v2 = (id *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  sub_1000DA2A4(v2);
}

uint64_t sub_1000DC5AC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000DC5E4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

char *sub_1000DC5F4(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[8] = *((unsigned char *)a2 + 8);
    *((void *)a1 + 2) = a2[2];
    uint64_t v8 = a3[7];
    int64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    id v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[9];
    v7[a3[8]] = *((unsigned char *)a2 + a3[8]);
    uint64_t v15 = &v7[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = *(unsigned char *)(v16 + 8);
    uint64_t v17 = a3[10];
    int64_t v18 = &v7[v17];
    unint64_t v19 = (char **)((char *)a2 + v17);
    if (*v19)
    {
      uint64_t v20 = v19[1];
      *(void *)int64_t v18 = *v19;
      *((void *)v18 + 1) = v20;
      swift_retain();
    }
    else
    {
      *(_OWORD *)int64_t v18 = *(_OWORD *)v19;
    }
    uint64_t v21 = a3[11];
    uint64_t v22 = &v7[v21];
    uint64_t v23 = (uint64_t)a2 + v21;
    long long v24 = *(_OWORD *)(v23 + 16);
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    *((_OWORD *)v22 + 1) = v24;
    v22[32] = *(unsigned char *)(v23 + 32);
  }
  return v7;
}

uint64_t sub_1000DC760(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  if (*(id *)((char *)a1 + *(int *)(a2 + 40)))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000DC808(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)(a1 + v16);
  int64_t v18 = (void *)(a2 + v16);
  if (*v18)
  {
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  }
  uint64_t v20 = a3[11];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  long long v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(unsigned char *)(v21 + 32) = *(unsigned char *)(v22 + 32);
  return a1;
}

uint64_t sub_1000DC928(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v9 = a3[7];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v13 = a3[9];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  char v16 = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = v16;
  uint64_t v17 = a3[10];
  int64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a1 + v17);
  uint64_t v21 = *(void *)(a2 + v17);
  if (!v20)
  {
    if (v21)
    {
      uint64_t v23 = *(void *)(v19 + 8);
      *int64_t v18 = v21;
      v18[1] = v23;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)int64_t v18 = *(_OWORD *)v19;
    goto LABEL_8;
  }
  if (!v21)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v22 = *(void *)(v19 + 8);
  *int64_t v18 = v21;
  v18[1] = v22;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v24 = a3[11];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = (long long *)(a2 + v24);
  long long v27 = *v26;
  long long v28 = v26[1];
  *(unsigned char *)(v25 + 32) = *((unsigned char *)v26 + 32);
  *(_OWORD *)uint64_t v25 = v27;
  *(_OWORD *)(v25 + 16) = v28;
  return a1;
}

uint64_t sub_1000DCA70(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = a3[10];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  if (*v15)
  {
    uint64_t v17 = v15[1];
    *uint64_t v14 = v16;
    v14[1] = v17;
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  uint64_t v18 = a3[11];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  long long v21 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v21;
  *(unsigned char *)(v19 + 32) = *(unsigned char *)(v20 + 32);
  return a1;
}

uint64_t sub_1000DCB74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)(a1 + v14);
  uint64_t v18 = *(void *)(a2 + v14);
  if (!v17)
  {
    if (v18)
    {
      uint64_t v20 = *(void *)(v16 + 8);
      void *v15 = v18;
      v15[1] = v20;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    goto LABEL_8;
  }
  if (!v18)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v19 = *(void *)(v16 + 8);
  void *v15 = v18;
  v15[1] = v19;
  swift_release();
LABEL_8:
  uint64_t v21 = a3[11];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  long long v24 = *(_OWORD *)(v23 + 16);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *(_OWORD *)(v22 + 16) = v24;
  *(unsigned char *)(v22 + 32) = *(unsigned char *)(v23 + 32);
  return a1;
}

uint64_t sub_1000DCCA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000DCCBC);
}

uint64_t sub_1000DCCBC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000DCD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000DCD80);
}

void *sub_1000DCD80(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000DCE28()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_1000DCEFC(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(char **, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v31 = v8;
      uint64_t v11 = *a2;
      *(void *)a1 = *a2;
      a1[8] = *((unsigned char *)a2 + 8);
      *((void *)a1 + 2) = a2[2];
      uint64_t v12 = v7[7];
      uint64_t v13 = &a1[v12];
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = type metadata accessor for Date();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      uint64_t v17 = v11;
      v16(v13, v14, v15);
      a1[v7[8]] = *((unsigned char *)a2 + v7[8]);
      uint64_t v18 = v7[9];
      uint64_t v19 = &a1[v18];
      uint64_t v20 = (char *)a2 + v18;
      *(void *)uint64_t v19 = *(void *)v20;
      v19[8] = v20[8];
      uint64_t v21 = v7[10];
      uint64_t v22 = &a1[v21];
      uint64_t v23 = (char **)((char *)a2 + v21);
      if (*v23)
      {
        uint64_t v24 = v23[1];
        *(void *)uint64_t v22 = *v23;
        *((void *)v22 + 1) = v24;
        swift_retain();
      }
      else
      {
        *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      }
      uint64_t v25 = v7[11];
      uint64_t v26 = &a1[v25];
      long long v27 = (char *)a2 + v25;
      long long v28 = *((_OWORD *)v27 + 1);
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
      *((_OWORD *)v26 + 1) = v28;
      v26[32] = v27[32];
      (*(void (**)(char *, void, uint64_t, int *))(v31 + 56))(a1, 0, 1, v7);
    }
    uint64_t v29 = *(int *)(a3 + 24);
    a1[*(int *)(a3 + 20)] = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *(void *)&a1[v29] = *(char **)((char *)a2 + v29);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000DD158(id *a1)
{
  uint64_t v2 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
  {

    int v3 = (char *)a1 + *(int *)(v2 + 28);
    uint64_t v4 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    if (*(id *)((char *)a1 + *(int *)(v2 + 40))) {
      swift_release();
    }
  }

  return swift_bridgeObjectRelease();
}

void **sub_1000DD240(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(void **, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v29 = v7;
    uint64_t v9 = *a2;
    *a1 = *a2;
    *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for Date();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    id v15 = v9;
    v14(v11, v12, v13);
    *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
    uint64_t v16 = v6[9];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    uint64_t v19 = v6[10];
    uint64_t v20 = (void **)((char *)a1 + v19);
    uint64_t v21 = (void **)((char *)a2 + v19);
    if (*v21)
    {
      uint64_t v22 = v21[1];
      void *v20 = *v21;
      v20[1] = v22;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    }
    uint64_t v23 = v6[11];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    long long v26 = *((_OWORD *)v25 + 1);
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    *((_OWORD *)v24 + 1) = v26;
    v24[32] = v25[32];
    (*(void (**)(void **, void, uint64_t, int *))(v29 + 56))(a1, 0, 1, v6);
  }
  uint64_t v27 = *(int *)(a3 + 24);
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  *(void **)((char *)a1 + v27) = *(void **)((char *)a2 + v27);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000DD44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_10003C50C(a1);
      goto LABEL_7;
    }
    uint64_t v27 = *(void **)a2;
    long long v28 = *(void **)a1;
    *(void *)a1 = *(void *)a2;
    id v29 = v27;

    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    uint64_t v30 = v6[7];
    uint64_t v31 = a1 + v30;
    uint64_t v32 = a2 + v30;
    uint64_t v33 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 24))(v31, v32, v33);
    *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
    uint64_t v34 = v6[9];
    uint64_t v35 = a1 + v34;
    uint64_t v36 = a2 + v34;
    char v37 = *(unsigned char *)(v36 + 8);
    *(void *)uint64_t v35 = *(void *)v36;
    *(unsigned char *)(v35 + 8) = v37;
    uint64_t v38 = v6[10];
    uint64_t v39 = (void *)(a1 + v38);
    uint64_t v40 = a2 + v38;
    uint64_t v41 = *(void *)(a1 + v38);
    uint64_t v42 = *(void *)(a2 + v38);
    if (v41)
    {
      if (v42)
      {
        uint64_t v43 = *(void *)(v40 + 8);
        void *v39 = v42;
        v39[1] = v43;
        swift_retain();
        swift_release();
LABEL_17:
        uint64_t v50 = v6[11];
        uint64_t v51 = a1 + v50;
        id v52 = (long long *)(a2 + v50);
        long long v53 = *v52;
        long long v54 = v52[1];
        *(unsigned char *)(v51 + 32) = *((unsigned char *)v52 + 32);
        *(_OWORD *)uint64_t v51 = v53;
        *(_OWORD *)(v51 + 16) = v54;
        goto LABEL_18;
      }
      swift_release();
    }
    else if (v42)
    {
      uint64_t v49 = *(void *)(v40 + 8);
      void *v39 = v42;
      v39[1] = v49;
      swift_retain();
      goto LABEL_17;
    }
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    goto LABEL_17;
  }
  if (v10)
  {
LABEL_7:
    uint64_t v26 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_18;
  }
  uint64_t v11 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v12 = v6[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  id v17 = v11;
  v16(v13, v14, v15);
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v18 = v6[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  char v21 = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = v21;
  uint64_t v22 = v6[10];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  if (*v24)
  {
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  }
  uint64_t v44 = v6[11];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = (long long *)(a2 + v44);
  long long v47 = *v46;
  long long v48 = v46[1];
  *(unsigned char *)(v45 + 32) = *((unsigned char *)v46 + 32);
  *(_OWORD *)uint64_t v45 = v47;
  *(_OWORD *)(v45 + 16) = v48;
  (*(void (**)(uint64_t, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_18:
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1000DD7A4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
    a1[2] = a2[2];
    uint64_t v9 = v6[7];
    int v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
    uint64_t v13 = v6[9];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
    uint64_t v16 = v6[10];
    id v17 = (void *)((char *)a1 + v16);
    uint64_t v18 = (void *)((char *)a2 + v16);
    uint64_t v19 = *v18;
    if (*v18)
    {
      uint64_t v20 = v18[1];
      *id v17 = v19;
      v17[1] = v20;
    }
    else
    {
      *(_OWORD *)id v17 = *(_OWORD *)v18;
    }
    uint64_t v21 = v6[11];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    long long v24 = *((_OWORD *)v23 + 1);
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    *((_OWORD *)v22 + 1) = v24;
    v22[32] = v23[32];
    (*(void (**)(void *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v25 = *(int *)(a3 + 24);
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  *(void *)((char *)a1 + v25) = *(void *)((char *)a2 + v25);
  return a1;
}

uint64_t sub_1000DD988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_10003C50C(a1);
      goto LABEL_7;
    }
    long long v24 = *(void **)a1;
    *(void *)a1 = *(void *)a2;

    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    uint64_t v25 = v6[7];
    uint64_t v26 = a1 + v25;
    uint64_t v27 = a2 + v25;
    uint64_t v28 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 40))(v26, v27, v28);
    *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
    uint64_t v29 = v6[9];
    uint64_t v30 = a1 + v29;
    uint64_t v31 = a2 + v29;
    *(void *)uint64_t v30 = *(void *)v31;
    *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
    uint64_t v32 = v6[10];
    uint64_t v33 = (void *)(a1 + v32);
    uint64_t v34 = a2 + v32;
    uint64_t v35 = *(void *)(a1 + v32);
    uint64_t v36 = *(void *)(a2 + v32);
    if (v35)
    {
      if (v36)
      {
        uint64_t v37 = *(void *)(v34 + 8);
        *uint64_t v33 = v36;
        v33[1] = v37;
        swift_release();
LABEL_17:
        uint64_t v43 = v6[11];
        uint64_t v44 = a1 + v43;
        uint64_t v45 = a2 + v43;
        long long v46 = *(_OWORD *)(v45 + 16);
        *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
        *(_OWORD *)(v44 + 16) = v46;
        *(unsigned char *)(v44 + 32) = *(unsigned char *)(v45 + 32);
        goto LABEL_18;
      }
      swift_release();
    }
    else if (v36)
    {
      uint64_t v42 = *(void *)(v34 + 8);
      *uint64_t v33 = v36;
      v33[1] = v42;
      goto LABEL_17;
    }
    *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
    goto LABEL_17;
  }
  if (v10)
  {
LABEL_7:
    uint64_t v23 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_18;
  }
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v11 = v6[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v15 = v6[9];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  uint64_t v18 = v6[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *v20;
  if (*v20)
  {
    uint64_t v22 = v20[1];
    *uint64_t v19 = v21;
    v19[1] = v22;
  }
  else
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  }
  uint64_t v38 = v6[11];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  long long v41 = *(_OWORD *)(v40 + 16);
  *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
  *(_OWORD *)(v39 + 16) = v41;
  *(unsigned char *)(v39 + 32) = *(unsigned char *)(v40 + 32);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_18:
  uint64_t v47 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v47) = *(void *)(a2 + v47);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000DDCA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000DDCB4);
}

uint64_t sub_1000DDCB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000DDD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000DDD8C);
}

uint64_t sub_1000DDD8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_1000DDE4C()
{
  sub_1000DDEF0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000DDEF0()
{
  if (!qword_100185D68)
  {
    type metadata accessor for ModalPresentationCoordinator.QueueEntry(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100185D68);
    }
  }
}

uint64_t sub_1000DDF48()
{
  return sub_1000DA82C(&qword_100185DA0, (void (*)(uint64_t))type metadata accessor for ModalPresentationCoordinator.QueueEntry);
}

ValueMetadata *type metadata accessor for ModalPresentationCoordinator.Priority()
{
  return &type metadata for ModalPresentationCoordinator.Priority;
}

unsigned char *storeEnumTagSinglePayload for ModalPresentationCoordinator.ControllerType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1000DE06CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModalPresentationCoordinator.ControllerType()
{
  return &type metadata for ModalPresentationCoordinator.ControllerType;
}

unint64_t sub_1000DE0A8()
{
  unint64_t result = qword_100185DA8;
  if (!qword_100185DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185DA8);
  }
  return result;
}

unint64_t sub_1000DE100()
{
  unint64_t result = qword_100185DB0;
  if (!qword_100185DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185DB0);
  }
  return result;
}

uint64_t destroy for SelfServiceInstructionsView(uint64_t a1)
{
  sub_1000ACA18(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SelfServiceInstructionsView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  sub_1000AC938(v4, v5, v6);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SelfServiceInstructionsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  sub_1000AC938(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  char v9 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  sub_1000ACA18(v7, v8, v9);
  uint64_t v10 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

__n128 initializeWithTake for SelfServiceInstructionsView(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SelfServiceInstructionsView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  char v7 = *(unsigned char *)(a1 + 32);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 32) = v4;
  sub_1000ACA18(v5, v6, v7);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for SelfServiceInstructionsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SelfServiceInstructionsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SelfServiceInstructionsView()
{
  return &type metadata for SelfServiceInstructionsView;
}

uint64_t sub_1000DE488()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_1000DE4A8@<D0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v15 = sub_10003AFD0(&qword_100185C20);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = 0;
  State.init(wrappedValue:)();
  uint64_t v19 = v37;
  uint64_t v18 = v38;
  int v34 = a7;
  LOBYTE(v36) = (a7 & 1) == 0 && a6 <= 0x18 && ((1 << a6) & 0x1010100) != 0;
  swift_bridgeObjectRetain();
  swift_retain();
  State.init(wrappedValue:)();
  uint64_t v33 = v38;
  char v39 = v37;
  if (a5)
  {
    unint64_t v21 = a6;
LABEL_12:
    uint64_t v22 = v18;
    goto LABEL_13;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v21 = a6;
  if (v20 <= a4) {
    goto LABEL_12;
  }
  uint64_t v36 = a4;
  State.init(wrappedValue:)();
  swift_release();
  uint64_t v19 = v37;
  uint64_t v22 = v38;
LABEL_13:
  sub_10003C374(0, &qword_100185C28);
  id v23 = [self mainRunLoop];
  uint64_t v24 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v17, 1, 1, v24);
  uint64_t v25 = static NSTimer.publish(every:tolerance:on:in:options:)();

  sub_10003C44C((uint64_t)v17, &qword_100185C20);
  uint64_t v37 = v25;
  type metadata accessor for NSTimer.TimerPublisher();
  sub_1000E0D40(&qword_100185C30, (void (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v26 = ConnectablePublisher.autoconnect()();
  swift_release();
  uint64_t v36 = v26;
  sub_10003AFD0(&qword_100185B90);
  State.init(wrappedValue:)();
  uint64_t v27 = v37;
  uint64_t v28 = v38;
  char v29 = v39;
  swift_bridgeObjectRelease();
  swift_release();
  double result = 8.0;
  *(_OWORD *)a8 = xmmword_1001263E0;
  *(void *)(a8 + 16) = 0x3FF0000000000000;
  *(void *)(a8 + 24) = v27;
  *(void *)(a8 + 32) = v28;
  *(void *)(a8 + 40) = v19;
  *(void *)(a8 + 48) = v22;
  *(unsigned char *)(a8 + 56) = v29;
  uint64_t v31 = v35;
  *(void *)(a8 + 64) = v33;
  *(void *)(a8 + 72) = v31;
  *(void *)(a8 + 80) = a3;
  *(void *)(a8 + 88) = a1;
  *(void *)(a8 + 96) = v21;
  *(unsigned char *)(a8 + 104) = v34 & 1;
  return result;
}

uint64_t sub_1000DE7EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v44 = a1;
  uint64_t v3 = type metadata accessor for ScrollBounceBehavior();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  __chkstk_darwin(v3);
  int v34 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for ScrollIndicatorVisibility();
  uint64_t v5 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  char v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10003AFD0(&qword_100185DB8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10003AFD0(&qword_100185DC0);
  uint64_t v33 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10003AFD0(&qword_100185DC8);
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v43 = v14;
  __chkstk_darwin(v14);
  uint64_t v40 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10003AFD0(&qword_100185DD0);
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v38 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v2;
  static Axis.Set.vertical.getter();
  sub_10003AFD0(&qword_100185DD8);
  sub_10004F7B0(&qword_100185DE0, &qword_100185DD8);
  ScrollView.init(_:showsIndicators:content:)();
  static ScrollIndicatorVisibility.hidden.getter();
  unsigned __int8 v17 = static Axis.Set.vertical.getter();
  unsigned __int8 v18 = static Axis.Set.horizontal.getter();
  Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v17) {
    Axis.Set.init(rawValue:)();
  }
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v18) {
    Axis.Set.init(rawValue:)();
  }
  uint64_t v19 = sub_10004F7B0(&qword_100185DE8, &qword_100185DB8);
  View.scrollIndicators(_:axes:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v32);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v20 = v34;
  static ScrollBounceBehavior.basedOnSize.getter();
  unsigned __int8 v21 = static Axis.Set.vertical.getter();
  Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v21) {
    Axis.Set.init(rawValue:)();
  }
  uint64_t v48 = v8;
  uint64_t v49 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  id v23 = v40;
  uint64_t v24 = v37;
  View.scrollBounceBehavior(_:axes:)();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v20, v36);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v24);
  long long v46 = *(_OWORD *)(v2 + 40);
  uint64_t v47 = *(void *)(v2 + 56);
  sub_10003AFD0(&qword_100185DF0);
  State.projectedValue.getter();
  uint64_t v25 = swift_allocObject();
  long long v26 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v25 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v25 + 64) = v26;
  *(_OWORD *)(v25 + 80) = *(_OWORD *)(v2 + 64);
  *(void *)(v25 + 96) = *(void *)(v2 + 80);
  long long v27 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v25 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v25 + 32) = v27;
  sub_1000E04C8(v2);
  sub_10003AFD0(&qword_100185DF8);
  *(void *)&long long v46 = v24;
  *((void *)&v46 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_1000E0524();
  sub_1000E0578();
  uint64_t v28 = v38;
  uint64_t v29 = v43;
  View.fullScreenCover<A, B>(item:onDismiss:content:)();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v29);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v44, v28, v41);
}

void *sub_1000DEEC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v3 = sub_10003AFD0(&qword_100185E28);
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_10003AFD0(&qword_100185E30);
  uint64_t v6 = __chkstk_darwin(v52);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v55 = (uint64_t)&v43 - v9;
  unint64_t v10 = *(void *)(a1 + 64);
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_3;
    }
LABEL_7:
    sub_1000E0D20(&v60);
    goto LABEL_8;
  }
  if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v11 + 64) = v12;
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(a1 + 64);
  *(void *)(v11 + 96) = *(void *)(a1 + 80);
  long long v13 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v11 + 32) = v13;
  swift_bridgeObjectRetain();
  sub_1000E04C8(a1);
  sub_1000DE4A8(v10, (uint64_t)sub_1000E0B34, v11, 0, 1, 0, 1, (uint64_t)v82);
  uint64_t v14 = v82[0];
  uint64_t v15 = v82[1];
  uint64_t v16 = v82[2];
  uint64_t v17 = v82[4];
  uint64_t v49 = v82[5];
  uint64_t v50 = v82[3];
  uint64_t v48 = v82[6];
  int v47 = v83;
  long long v51 = v85;
  uint64_t v45 = v86;
  uint64_t v46 = v84;
  uint64_t v44 = v87;
  char v18 = v88;
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v19 = *(void *)(a1 + 24);
  char v21 = *(unsigned char *)(a1 + 32);
  sub_1000AC938(v20, v19, v21);
  sub_1000E0910(v20, v19, v21);
  sub_1000ACA18(v20, v19, v21);
  sub_1000AC938(v20, v19, v21);
  sub_1000E0910(v20, v19, v21);
  sub_1000ACA18(v20, v19, v21);
  if (qword_100182820 != -1) {
    swift_once();
  }
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  LOBYTE(v58[0]) = v18;
  v57[0] = v90;
  char v59 = v92;
  *(void *)&long long v60 = v14;
  *((void *)&v60 + 1) = v15;
  uint64_t v61 = v16;
  uint64_t v62 = v50;
  uint64_t v63 = v17;
  uint64_t v64 = v49;
  uint64_t v65 = v48;
  char v66 = v47;
  long long v68 = v51;
  uint64_t v67 = v46;
  uint64_t v69 = v45;
  uint64_t v70 = v44;
  char v71 = v18;
  uint64_t v72 = v89;
  char v73 = v90;
  uint64_t v74 = v91;
  char v75 = v92;
  long long v76 = v93;
  uint64_t v77 = sub_1000DF984;
  uint64_t v78 = 0;
  uint64_t v80 = 0;
  uint64_t v79 = 0;
  Int.id.getter(&v60);
LABEL_8:
  sub_1000D77F4((uint64_t)&v60, (uint64_t)v81, &qword_100185E38);
  uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 16);
  *(void *)&long long v60 = 0;
  *((void *)&v60 + 1) = v23;
  swift_getKeyPath();
  uint64_t v24 = swift_allocObject();
  long long v25 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 64) = v25;
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(a1 + 64);
  *(void *)(v24 + 96) = *(void *)(a1 + 80);
  long long v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 32) = v26;
  sub_1000E04C8(a1);
  sub_10003AFD0(&qword_1001844A8);
  sub_10003AFD0(&qword_100185E40);
  sub_100081F20();
  sub_1000E108C(&qword_100185E48, &qword_100185E40, (void (*)(void))sub_1000D7444);
  ForEach<>.init(_:id:content:)();
  char v27 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v53;
  uint64_t v36 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v8, v5, v54);
  uint64_t v38 = &v8[*(int *)(v52 + 36)];
  *uint64_t v38 = v27;
  *((void *)v38 + 1) = v29;
  *((void *)v38 + 2) = v31;
  *((void *)v38 + 3) = v33;
  *((void *)v38 + 4) = v35;
  v38[40] = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v36);
  uint64_t v39 = v55;
  sub_1000D77F4((uint64_t)v8, v55, &qword_100185E30);
  sub_1000D77F4((uint64_t)v81, (uint64_t)v57, &qword_100185E38);
  sub_100078BD8(v39, (uint64_t)v8, &qword_100185E30);
  sub_1000D77F4((uint64_t)v57, (uint64_t)v58, &qword_100185E38);
  uint64_t v40 = v56;
  sub_1000D77F4((uint64_t)v58, v56, &qword_100185E38);
  uint64_t v41 = sub_10003AFD0(&qword_100185E50);
  sub_100078BD8((uint64_t)v8, v40 + *(int *)(v41 + 48), &qword_100185E30);
  sub_1000E0BFC(v58, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000E0B4C);
  sub_10003C44C(v39, &qword_100185E30);
  sub_10003C44C((uint64_t)v8, &qword_100185E30);
  sub_1000D77F4((uint64_t)v57, (uint64_t)&v60, &qword_100185E38);
  return sub_1000E0BFC(&v60, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000E0C70);
}

uint64_t sub_1000DF530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10003AFD0(&qword_100185E60);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v10 + 64) = v11;
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 80);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v10 + 32) = v13;
  *(void *)(v10 + 96) = v12;
  *(void *)(v10 + 104) = a1;
  uint64_t v17 = a2;
  sub_1000E04C8(a2);
  sub_10003AFD0(&qword_100185E68);
  sub_1000E0E54();
  Button.init(action:label:)();
  LOBYTE(a2) = static Edge.Set.all.getter();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 16))(a3, v9, v6);
  uint64_t v14 = a3 + *(int *)(sub_10003AFD0(&qword_100185EB8) + 36);
  *(unsigned char *)uint64_t v14 = a2;
  *(_OWORD *)(v14 + 8) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *(unsigned char *)(v14 + 40) = 1;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000DF6F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Image.ResizingMode();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  Image.init(systemName:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
  uint64_t v6 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  LOBYTE(v2) = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = static Color.white.getter();
  uint64_t KeyPath = swift_getKeyPath();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v17 = v27;
  uint64_t v18 = v29;
  uint64_t v19 = v31;
  uint64_t v20 = v32;
  char v41 = 1;
  char v38 = 0;
  char v36 = v28;
  char v34 = v30;
  uint64_t v21 = static Color.black.getter();
  uint64_t result = static Edge.Set.all.getter();
  unsigned __int8 v23 = v41;
  *(_DWORD *)(a1 + 18) = *(_DWORD *)&v39[7];
  *(_WORD *)(a1 + 22) = v40;
  *(_DWORD *)(a1 + 25) = *(_DWORD *)v39;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)&v39[3];
  char v24 = v38;
  *(_DWORD *)(a1 + 65) = *(_DWORD *)v37;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v37[3];
  char v25 = v36;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a1 + 97) = *(_DWORD *)v35;
  char v26 = v34;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)&v33[3];
  *(_DWORD *)(a1 + 113) = *(_DWORD *)v33;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = v23;
  *(unsigned char *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v12;
  *(void *)(a1 + 56) = v14;
  *(unsigned char *)(a1 + 64) = v24;
  *(void *)(a1 + 72) = KeyPath;
  *(void *)(a1 + 80) = v15;
  *(void *)(a1 + 88) = v17;
  *(unsigned char *)(a1 + 96) = v25;
  *(void *)(a1 + 104) = v18;
  *(unsigned char *)(a1 + 112) = v26;
  *(void *)(a1 + 120) = v19;
  *(void *)(a1 + 128) = v20;
  *(void *)(a1 + 136) = v21;
  *(unsigned char *)(a1 + 144) = result;
  return result;
}

void sub_1000DF984()
{
  sub_10003C374(0, &qword_100185140);
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v1 = [ObjCClassFromMetadata appearance];
  uint64_t v2 = self;
  id v3 = [v2 labelColor];
  [v1 setCurrentPageIndicatorTintColor:v3];

  id v4 = [ObjCClassFromMetadata appearance];
  id v5 = [v2 secondaryLabelColor];
  [v4 setPageIndicatorTintColor:v5];
}

void *sub_1000DFA94@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*result < *(void *)(*(void *)(a2 + 72) + 16))
  {
    swift_bridgeObjectRetain();
    sub_1000DFB78((uint64_t)&v12);
    swift_bridgeObjectRelease();
    long long v11 = v12;
    uint64_t v4 = v13;
    uint64_t v5 = v14;
    char v6 = v15;
    uint64_t v7 = v16;
    char v8 = v17;
    uint64_t v9 = v18;
    uint64_t v10 = v19;
    uint64_t result = (void *)static Edge.Set.bottom.getter();
    *(_OWORD *)a3 = v11;
    *(void *)(a3 + 16) = v4;
    *(void *)(a3 + 24) = v5;
    *(unsigned char *)(a3 + 32) = v6;
    *(void *)(a3 + 40) = v7;
    *(unsigned char *)(a3 + 48) = v8;
    *(void *)(a3 + 56) = v9;
    *(void *)(a3 + 64) = v10;
    *(unsigned char *)(a3 + 72) = (_BYTE)result;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(unsigned char *)(a3 + 112) = 1;
    return result;
  }
  __break(1u);
  return result;
}

double sub_1000DFB78@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone((Class)NSMutableAttributedString);
  swift_bridgeObjectRetain();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithString:v5];

  id v7 = objc_allocWithZone((Class)UILabel);
  id v8 = v6;
  id v9 = [v7 init];
  id v10 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  [v9 setFont:v10];

  [v9 setNumberOfLines:0];
  [v9 setAdjustsFontForContentSizeCategory:1];
  uint64_t v11 = *(void *)(v1 + 80);
  if (v11 != 1) {
    goto LABEL_4;
  }
  uint64_t v47 = dispatch thunk of CustomStringConvertible.description.getter();
  char v48 = v12;
  v13._countAndFlagsBits = 0x2E656C637269632ELL;
  v13._object = (void *)0xEC0000006C6C6966;
  String.append(_:)(v13);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v15 = [self systemImageNamed:v14];

  if (v15)
  {
    uint64_t v46 = v15;
    id v16 = [self textAttachmentWithImage:v15];
    sub_10003AFD0(&qword_100183BE8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100123B50;
    *(void *)(inited + 32) = NSForegroundColorAttributeName;
    uint64_t v18 = self;
    uint64_t v19 = NSForegroundColorAttributeName;
    id v20 = [v18 systemBlueColor];
    *(void *)(inited + 64) = sub_10003C374(0, (unint64_t *)&unk_1001864D0);
    *(void *)(inited + 40) = v20;
    sub_100078670(inited);
    type metadata accessor for Key(0);
    uint64_t v45 = sub_1000E0D40((unint64_t *)&qword_100182B68, type metadata accessor for Key);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v22 = [self attributedStringWithAttachment:v16 attributes:isa];

    id v23 = objc_allocWithZone((Class)NSAttributedString);
    NSString v24 = String._bridgeToObjectiveC()();
    id v25 = [v23 initWithString:v24];

    [v22 appendAttributedString:v25];
    [v22 size];
    double v27 = v26;
    id v28 = [objc_allocWithZone((Class)NSMutableParagraphStyle) init];
    sub_10003AFD0((uint64_t *)&unk_100182E20);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_100123F00;
    sub_100078698((uint64_t)_swiftEmptyArrayStorage);
    id v30 = objc_allocWithZone((Class)NSTextTab);
    type metadata accessor for OptionKey(0);
    sub_1000E0D40(&qword_100182BA0, type metadata accessor for OptionKey);
    Class v31 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v32 = [v30 initWithTextAlignment:0 location:v31 options:v27];

    *(void *)(v29 + 32) = v32;
    uint64_t v47 = v29;
    specialized Array._endMutation()();
    sub_10003C374(0, &qword_100185E58);
    Class v33 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v28 setTabStops:v33];

    [v28 setHeadIndent:v27];
    [v22 appendAttributedString:v8];

    uint64_t v34 = swift_initStackObject();
    *(_OWORD *)(v34 + 16) = xmmword_100123B50;
    *(void *)(v34 + 32) = NSParagraphStyleAttributeName;
    *(void *)(v34 + 64) = sub_10003C374(0, &qword_1001859C0);
    *(void *)(v34 + 40) = v28;
    id v8 = v22;
    uint64_t v35 = NSParagraphStyleAttributeName;
    id v36 = v28;
    sub_100078670(v34);
    Class v37 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v8 addAttributes:v37 range:0, [v8 length]];

    uint64_t v11 = 1;
  }
  else
  {
LABEL_4:
  }
  if (v11) {
    uint64_t v38 = 4;
  }
  else {
    uint64_t v38 = 1;
  }
  [v9 setTextAlignment:v38];
  [v9 setAttributedText:v8];
  uint64_t v39 = *(void *)(v2 + 16);
  uint64_t v40 = *(void *)(v2 + 24);
  char v41 = *(unsigned char *)(v2 + 32);
  sub_1000AC938(v39, v40, v41);
  double v42 = sub_1000E0910(v39, v40, v41);
  sub_1000ACA18(v39, v40, v41);
  [v9 setPreferredMaxLayoutWidth:v42 - (*(double *)(v2 + 8) + *(double *)(v2 + 8))];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v43 = v9;
  [v43 intrinsicContentSize];
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();

  *(void *)a1 = v43;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v47;
  *(unsigned char *)(a1 + 32) = v48;
  *(void *)(a1 + 40) = v49;
  *(unsigned char *)(a1 + 48) = v50;
  double result = *(double *)&v51;
  *(_OWORD *)(a1 + 56) = v51;
  return result;
}

uint64_t sub_1000E0284@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SelfServiceInstructionsFullScreenViewerView();
  __chkstk_darwin(v6 - 8);
  id v8 = (uint64_t *)((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_10003AFD0(&qword_100185DF8);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  char v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  unint64_t v14 = *(void *)(a2 + 64);
  id v15 = self;
  swift_bridgeObjectRetain();
  unsigned int v16 = objc_msgSend(objc_msgSend(v15, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if (v16) {
    unint64_t v17 = 16;
  }
  else {
    unint64_t v17 = 0;
  }
  sub_1000AB43C(v14, v13, v17, v16 ^ 1, v8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = *(void *)(a2 + 16);
  uint64_t v20 = *(void *)(a2 + 24);
  char v21 = *(unsigned char *)(a2 + 32);
  sub_1000AC938(v19, v20, v21);
  double v22 = sub_1000E0910(v19, v20, v21);
  uint64_t v24 = v23;
  sub_1000ACA18(v19, v20, v21);
  sub_1000AD314((uint64_t)v8, (uint64_t)v12);
  id v25 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  uint64_t *v25 = KeyPath;
  *((double *)v25 + 1) = v22;
  uint64_t v25[2] = v24;
  sub_1000AB040((uint64_t)v8);
  return sub_1000D77F4((uint64_t)v12, a3, &qword_100185DF8);
}

uint64_t sub_1000E0464@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DE7EC(a1);
}

void *sub_1000E04B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DEEC0(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000E04B8()
{
  return sub_1000E0D90(104);
}

uint64_t sub_1000E04C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000E0284(a1, v2 + 16, a2);
}

uint64_t sub_1000E04C8(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000E0524()
{
  unint64_t result = qword_100185E00;
  if (!qword_100185E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185E00);
  }
  return result;
}

unint64_t sub_1000E0578()
{
  unint64_t result = qword_100185E08;
  if (!qword_100185E08)
  {
    sub_10003B070(&qword_100185DF8);
    sub_1000E0D40(&qword_100185E10, (void (*)(uint64_t))type metadata accessor for SelfServiceInstructionsFullScreenViewerView);
    sub_10004F7B0(&qword_100185E18, &qword_100185E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185E08);
  }
  return result;
}

uint64_t sub_1000E0650@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10003AFD0(&qword_100185070);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100078BD8(v2, (uint64_t)v10, &qword_100185070);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for DismissAction();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = static os_log_type_t.fault.getter();
    unint64_t v14 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      unsigned int v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)unsigned int v16 = 136315138;
      void v18[2] = sub_10004DAA8(0x417373696D736944, 0xED00006E6F697463, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

double sub_1000E0910(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for EnvironmentValues();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v10 = static os_log_type_t.fault.getter();
  uint64_t v11 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v12 = v10;
  if (os_log_type_enabled(v11, v10))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v16[0] = a2;
    double v17 = *(double *)&v14;
    *(_DWORD *)os_log_type_t v13 = 136315138;
    v16[1] = sub_10004DAA8(0x657A69534743, 0xE600000000000000, (uint64_t *)&v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
    swift_arrayDestroy();
    a2 = v16[0];
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_1000ACA18(a1, a2, 0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v17;
}

uint64_t sub_1000E0B2C()
{
  return sub_1000E0D90(104);
}

uint64_t sub_1000E0B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000DF530(a1, v2 + 16, a2);
}

uint64_t sub_1000E0B3C()
{
  return sub_1000E0D90(104);
}

void *sub_1000E0B44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000DFA94(a1, v2 + 16, a2);
}

void sub_1000E0B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  if (a4)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_10003AF68(a21);
    sub_10003AF68(a23);
  }
}

void *sub_1000E0BFC(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23]);
  return a1;
}

void sub_1000E0C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  if (a4)
  {
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    sub_10003B0B8(a21);
    sub_10003B0B8(a23);
  }
}

double sub_1000E0D20(_OWORD *a1)
{
  double result = 0.0;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_1000E0D40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000E0D88()
{
  return sub_1000E0D90(112);
}

uint64_t sub_1000E0D90(uint64_t a1)
{
  sub_1000ACA18(*(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_1000E0DF0()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000E0E4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DF6F8(a1);
}

unint64_t sub_1000E0E54()
{
  unint64_t result = qword_100185E70;
  if (!qword_100185E70)
  {
    sub_10003B070(&qword_100185E68);
    sub_1000E0EF4();
    sub_10004F7B0(&qword_1001851B0, &qword_1001851B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185E70);
  }
  return result;
}

unint64_t sub_1000E0EF4()
{
  unint64_t result = qword_100185E78;
  if (!qword_100185E78)
  {
    sub_10003B070(&qword_100185E80);
    sub_1000E108C(&qword_100185E88, &qword_100185E90, (void (*)(void))sub_1000E0FC0);
    sub_10004F7B0(&qword_100184AF8, &qword_100184B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185E78);
  }
  return result;
}

unint64_t sub_1000E0FC0()
{
  unint64_t result = qword_100185E98;
  if (!qword_100185E98)
  {
    sub_10003B070(&qword_100185EA0);
    sub_1000E108C(&qword_100185EA8, &qword_100185EB0, (void (*)(void))sub_100091540);
    sub_10004F7B0(&qword_100184450, &qword_100184458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185E98);
  }
  return result;
}

uint64_t sub_1000E108C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10003B070(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000E1108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000E1134@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000E1160()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_1000E118C()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_1000E11B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SelfServiceSuiteResultsHeaderView()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s11Diagnostics33SelfServiceSuiteResultsHeaderViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SelfServiceSuiteResultsHeaderView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SelfServiceSuiteResultsHeaderView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SelfServiceSuiteResultsHeaderView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SelfServiceSuiteResultsHeaderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SelfServiceSuiteResultsHeaderView()
{
  return &type metadata for SelfServiceSuiteResultsHeaderView;
}

uint64_t sub_1000E14A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E14C4@<X0>(uint64_t a1@<X8>)
{
  sub_100061B00();
  swift_bridgeObjectRetain();
  uint64_t v2 = Text.init<A>(_:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  uint64_t v7 = Text.font(_:)();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_1000824C0(v2, v4, v6);
  swift_bridgeObjectRelease();
  static Font.Weight.bold.getter();
  uint64_t v12 = Text.fontWeight(_:)();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_1000824C0(v7, v9, v11);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v18;
  *(void *)(a1 + 24) = v16;
  *(void *)(a1 + 32) = KeyPath;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  sub_100082358(v12, v14, v18);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000824C0(v12, v14, v18);
  swift_release();
  return swift_bridgeObjectRelease();
}

__n128 sub_1000E1640@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = static VerticalAlignment.center.getter();
  sub_1000E14C4((uint64_t)&v9);
  char v3 = v10;
  char v4 = v12;
  uint64_t v5 = v13;
  char v6 = v14;
  __n128 result = v11;
  long long v8 = v9;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 40) = v3;
  *(__n128 *)(a1 + 48) = result;
  *(unsigned char *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = v5;
  *(unsigned char *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_1000E16D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000E1704@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000E1730()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000E1758()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

unint64_t sub_1000E1784()
{
  unint64_t result = qword_100185EC0;
  if (!qword_100185EC0)
  {
    sub_10003B070(&qword_100185EC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100185EC0);
  }
  return result;
}

void sub_1000E17E0(uint64_t a1)
{
  sub_1000647D4(a1, (uint64_t)v132);
  long long v8 = v133;
  uint64_t v7 = v134;
  uint64_t v9 = v135;
  *(_OWORD *)(v1 + 80) = xmmword_1001265B0;
  uint64_t v127 = v1;
  sub_1000647D4(a1, v1 + 24);
  sub_1000647D4(a1, (uint64_t)&v136);
  if (v138 == 1)
  {
    char v12 = v136;
    uint64_t v13 = v137;
    sub_100064968(a1, (void (*)(void, void, void, void, void, void, void))sub_100064830);
    uint64_t v121 = v13;
    swift_retain();
    uint64_t v122 = v12;
    id v14 = v12;
    char v10 = 0;
    uint64_t v15 = 0;
    char v119 = 1;
    goto LABEL_10;
  }
  if (v138)
  {
    sub_100064968(a1, (void (*)(void, void, void, void, void, void, void))sub_100064830);
    goto LABEL_7;
  }
  char v10 = v137;
  if (!v137)
  {
    uint64_t v16 = self;
    id v17 = v8;
    sub_10003AF68(v7);
    sub_10003AF68(v9);
    id v18 = [v16 currentDevice];
    id v19 = [v18 userInterfaceIdiom];

    if (v19 != (id)1) {
      goto LABEL_9;
    }
LABEL_7:
    char v119 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    char v10 = 0;
    uint64_t v15 = 1;
    goto LABEL_10;
  }
  id v11 = v8;
  sub_10003AF68(v7);
  sub_10003AF68(v9);
LABEL_9:
  id v20 = v10;
  char v119 = 0;
  uint64_t v121 = 0;
  uint64_t v122 = 0;
  uint64_t v15 = 0;
LABEL_10:
  id v22 = sub_100070B14(0);
  if (v21)
  {
    sub_100045FCC(0, 0, (uint64_t)&_swiftEmptyArrayStorage, (uint64_t)v22, v21);
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v26 = sub_100070B14(1);
  if (v25)
  {
    sub_100045FCC(0, 0, (uint64_t)&_swiftEmptyArrayStorage, (uint64_t)v26, v25);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_15;
    }
LABEL_18:
    NSString v29 = 0;
    if (v28) {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  uint64_t v28 = 0;
  if (!v24) {
    goto LABEL_18;
  }
LABEL_15:
  NSString v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v28)
  {
LABEL_16:
    NSString v30 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
LABEL_19:
  NSString v30 = 0;
LABEL_20:
  id v31 = [self alertControllerWithTitle:v29 message:v30 preferredStyle:v15];

  *(void *)(v127 + 16) = v31;
  if (!v10)
  {
    if (!v122) {
      goto LABEL_44;
    }
    uint64_t v32 = v122;
    [(id)v32 bounds];
    double v2 = v35;
    double v3 = v36;
    double v4 = v37;
    double v5 = v38;
    uint64_t v39 = (void *)qword_100183500;
    if (qword_100183500)
    {
      type metadata accessor for SelfServiceDestinationPickerViewController();
      if (!swift_dynamicCastClass())
      {
        id v46 = v39;
LABEL_40:
        uint64_t v45 = v46;
        goto LABEL_41;
      }
    }
    if (qword_100182750 != -1) {
      swift_once();
    }
    id v40 = [(id)qword_10018A380 viewControllers];
    sub_10003C374(0, (unint64_t *)&qword_100183670);
    unint64_t v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v41 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v42 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v42) {
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v42)
      {
LABEL_30:
        unint64_t v43 = v42 - 1;
        if (__OFSUB__(v42, 1)) {
          goto LABEL_77;
        }
        if ((v41 & 0xC000000000000001) != 0) {
          goto LABEL_78;
        }
        if ((v43 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v43 < *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v44 = *(id *)(v41 + 8 * v43 + 32);
          goto LABEL_35;
        }
        __break(1u);
        goto LABEL_81;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_100182748 == -1)
    {
LABEL_39:
      id v46 = (id)qword_10018A370;
      goto LABEL_40;
    }
LABEL_81:
    swift_once();
    goto LABEL_39;
  }
  uint64_t v32 = v10;
  id v33 = [v31 popoverPresentationController];
  if (!v33) {
    goto LABEL_43;
  }
  id v34 = v33;
  [v33 setBarButtonItem:v32];
  while (1)
  {

LABEL_43:
LABEL_44:
    unint64_t v128 = (unint64_t)sub_100098E8C(a1);
    uint64_t v120 = v10;
    uint64_t v126 = a1;
    if (v128 >> 62) {
      break;
    }
    uint64_t v32 = *(void *)((v128 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v32) {
      goto LABEL_64;
    }
LABEL_46:
    id v125 = self;
    if (v32 >= 1)
    {
      id v123 = self;
      uint64_t v56 = self;
      uint64_t v57 = 0;
      uint64_t v58 = &selRef_beginUpload;
      uint64_t v124 = v32;
      while (1)
      {
        uint64_t v130 = v57;
        if ((v128 & 0xC000000000000001) != 0)
        {
          uint64_t v67 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v67 = *(void **)(v128 + 8 * v57 + 32);
          swift_retain();
        }
        uint64_t v68 = v67[2];
        uint64_t v69 = (void *)v67[3];
        id v129 = *(id *)(v127 + 16);
        swift_bridgeObjectRetain();
        NSString v70 = String._bridgeToObjectiveC()();
        id v71 = [v123 localizedStringForKey:v70];

        uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v74 = v73;

        id v75 = [v56 v58[307]];
        v140._object = (void *)0xE000000000000000;
        v76._countAndFlagsBits = v72;
        v76._object = v74;
        v77._countAndFlagsBits = 0;
        v77._object = (void *)0xE000000000000000;
        v140._countAndFlagsBits = 0;
        Swift::String v78 = NSLocalizedString(_:tableName:bundle:value:comment:)(v76, (Swift::String_optional)0, (NSBundle)v75, v77, v140);
        swift_bridgeObjectRelease();

        if (v78._countAndFlagsBits == v68 && v78._object == v69) {
          goto LABEL_59;
        }
        if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
          break;
        }
LABEL_49:
        String.init(format:arguments:)();
        ++v57;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v62 = v67[4];
        uint64_t v63 = swift_allocObject();
        sub_1000647D4(v126, v63 + 16);
        *(void *)(v63 + 72) = v67;
        sub_100064968(v126, (void (*)(void, void, void, void, void, void, void))sub_100064830);
        swift_retain();
        NSString v64 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        aBlock[4] = sub_1000E29D8;
        aBlock[5] = v63;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100046950;
        aBlock[3] = &unk_1001534B8;
        uint64_t v65 = _Block_copy(aBlock);
        swift_release();
        id v66 = [v125 actionWithTitle:v64 style:v62 handler:v65];
        _Block_release(v65);

        [v129 addAction:v66];
        swift_release();

        uint64_t v58 = &selRef_beginUpload;
        if (v124 == v130 + 1) {
          goto LABEL_64;
        }
      }
      uint64_t v58 = &selRef_beginUpload;
LABEL_59:
      swift_bridgeObjectRelease();
      id v80 = [v56 v58[307]];
      v141._object = (void *)0xE000000000000000;
      v81._countAndFlagsBits = v68;
      v81._object = v69;
      v82._countAndFlagsBits = 0;
      v82._object = (void *)0xE000000000000000;
      v141._countAndFlagsBits = 0;
      Swift::String v83 = NSLocalizedString(_:tableName:bundle:value:comment:)(v81, (Swift::String_optional)0, (NSBundle)v80, v82, v141);

      if (v83._countAndFlagsBits == v68 && v83._object == v69
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        id v59 = [v56 mainBundle];
        v139._object = (void *)0xE000000000000000;
        v60._countAndFlagsBits = v68;
        v60._object = v69;
        v61._countAndFlagsBits = 0;
        v61._object = (void *)0xE000000000000000;
        v139._countAndFlagsBits = 0;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v60, (Swift::String_optional)0, (NSBundle)v59, v61, v139);
      }
      goto LABEL_49;
    }
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    id v44 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_35:
    uint64_t v45 = v44;
    swift_bridgeObjectRelease();
LABEL_41:
    id v47 = [v45 view];

    [v32 convertRect:v47 toView:v2, v3, v4, v5];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;

    double v2 = v49 + -10.0;
    double v3 = v51 + -10.0;
    double v4 = v53 + 20.0;
    double v5 = v55 + 20.0;
    id v34 = [*(id *)(v127 + 16) popoverPresentationController];
    [v34 setSourceRect:v2, v3, v4, v5];
  }
  uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
  if (v32) {
    goto LABEL_46;
  }
LABEL_64:
  swift_bridgeObjectRelease();
  if ((v119 & 1) == 0)
  {
    sub_100064968(v126, (void (*)(void, void, void, void, void, void, void))sub_1000648CC);
LABEL_74:
    uint64_t v86 = v120;
LABEL_75:
    swift_release();

    return;
  }
  id v84 = [self currentDevice];
  id v85 = [v84 userInterfaceIdiom];

  uint64_t v86 = v120;
  if (v85 == (id)1)
  {
    sub_100064968(v126, (void (*)(void, void, void, void, void, void, void))sub_1000648CC);
    goto LABEL_75;
  }
  type metadata accessor for DeviceInformationView();
  uint64_t v87 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *(void *)&v87[OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_state] = v121;
  swift_retain_n();
  swift_release();
  sub_10003CB30();
  swift_release();
  sub_100041348(7, 0);
  sub_100041A98();
  sub_100041D34();
  [v87 setTranslatesAutoresizingMaskIntoConstraints:0];
  type metadata accessor for AlertContentViewController();
  id v88 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v89 = objc_allocWithZone((Class)UIView);
  id v90 = v88;
  id v91 = [v89 init];
  [v90 setView:v91];

  id v92 = [v90 view];
  if (!v92)
  {
    swift_release();

    __break(1u);
    goto LABEL_83;
  }
  long long v93 = v92;
  [v92 addSubview:v87];

  [*(id *)(v127 + 16) setContentViewController:v90];
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v94 = swift_allocObject();
  *(_OWORD *)(v94 + 16) = xmmword_100124770;
  id v95 = [v87 heightAnchor];
  id v96 = [v95 constraintEqualToConstant:90.0];

  *(void *)(v94 + 32) = v96;
  id v97 = [v87 widthAnchor];
  id v98 = [v90 view];
  if (!v98)
  {
LABEL_83:
    swift_release();

    __break(1u);
    goto LABEL_84;
  }
  uint64_t v99 = v98;
  id v100 = [v98 widthAnchor];

  id v101 = [v97 constraintLessThanOrEqualToAnchor:v100];
  *(void *)(v94 + 40) = v101;
  id v102 = [v87 topAnchor];
  id v103 = [v90 view];
  if (!v103)
  {
LABEL_84:
    swift_release();

    __break(1u);
    goto LABEL_85;
  }
  uint64_t v104 = v103;
  id v105 = [v103 topAnchor];

  id v106 = [v102 constraintEqualToAnchor:v105];
  *(void *)(v94 + 48) = v106;
  id v107 = [v87 bottomAnchor];
  id v108 = [v90 view];
  if (!v108)
  {
LABEL_85:
    swift_release();

    __break(1u);
    goto LABEL_86;
  }
  uint64_t v109 = v108;
  id v110 = [v108 bottomAnchor];

  id v111 = [v107 constraintEqualToAnchor:v110];
  *(void *)(v94 + 56) = v111;
  id v112 = [v87 centerXAnchor];
  id v113 = [v90 view];
  if (v113)
  {
    uint64_t v114 = v113;
    uint64_t v115 = self;
    id v116 = [v114 centerXAnchor];

    id v117 = [v112 constraintEqualToAnchor:v116];
    *(void *)(v94 + 64) = v117;
    aBlock[0] = v94;
    specialized Array._endMutation()();
    sub_10003C374(0, (unint64_t *)&qword_1001831A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v115 activateConstraints:isa];
    sub_100064968(v126, (void (*)(void, void, void, void, void, void, void))sub_1000648CC);

    goto LABEL_74;
  }
LABEL_86:
  swift_release();

  __break(1u);
}

uint64_t sub_1000E26D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000647D4(a2, (uint64_t)v8);
  if (v8[48])
  {
    double v4 = *(void (**)(uint64_t))(a3 + 40);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  byte_10018A458 = 0;
  double v4 = *(void (**)(uint64_t))(a3 + 40);
  if (v4)
  {
LABEL_3:
    uint64_t v5 = swift_retain();
    v4(v5);
    sub_10003B0B8((uint64_t)v4);
  }
LABEL_4:
  if (qword_100182828 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for ModalPresentationCoordinator(0);
  sub_10003C3B0(v6, (uint64_t)qword_10018A440);
  swift_beginAccess();
  sub_1000D8460();
  return swift_endAccess();
}

id sub_1000E27C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ModalPresentationCoordinator(0);
  id result = (id)__chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 72)) {
    return [v1 preferredStyle] == 1 ? [v1 scheduleModalPresentationWithPriority:2 animated:1 presentationCompletion:0] : [v1 scheduleModalPresentationWithPriority:2 animated:1 presentationCompletion:0];
  }
  if ((byte_10018A458 & 1) == 0)
  {
    if (qword_100182828 != -1)
    {
      id v8 = result;
      swift_once();
      id result = v8;
    }
    uint64_t v6 = sub_10003C3B0((uint64_t)result, (uint64_t)qword_10018A440);
    swift_beginAccess();
    sub_1000CAA38(v6, (uint64_t)v5);
    id v7 = sub_1000D96A4();
    if (v7)
    {

      return (id)sub_1000E29FC((uint64_t)v5);
    }
    sub_1000E29FC((uint64_t)v5);
    byte_10018A458 = 1;
    return [*(id *)(v1 + 16) scheduleModalPresentationWithPriority:2 * ([*(id *)(v1 + 16) preferredStyle] == (id)1) animated:1 presentationCompletion:0];
  }
  return result;
}

uint64_t sub_1000E291C()
{
  sub_1000648CC(*(void **)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for ManagedAlertController()
{
  return self;
}

uint64_t sub_1000E298C()
{
  sub_1000648CC(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1000E29D8(uint64_t a1)
{
  return sub_1000E26D8(a1, v1 + 16, *(void *)(v1 + 72));
}

uint64_t sub_1000E29E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000E29F4()
{
  return swift_release();
}

uint64_t sub_1000E29FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModalPresentationCoordinator(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000E2A58()
{
  uint64_t v1 = v0;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for NoSessionNavigationController();
  [super viewDidLoad];
  [v0 setModalPresentationStyle:2];
  id v2 = [v0 navigationBar];
  id v3 = [objc_allocWithZone((Class)UIImage) init];
  [v2 setBackgroundImage:v3 forBarMetrics:0];

  id v4 = [v1 navigationBar];
  id v5 = [objc_allocWithZone((Class)UIImage) init];
  [v4 setShadowImage:v5];

  id v6 = [v1 navigationBar];
  [v6 setAlpha:0.0];

  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100123F00;
  id v8 = objc_allocWithZone((Class)type metadata accessor for NoSessionViewController());
  *(void *)(v7 + 32) = sub_100099B18();
  specialized Array._endMutation()();
  sub_10005C46C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 setViewControllers:isa];
}

id sub_1000E2DE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NoSessionNavigationController();
  return [super dealloc];
}

uint64_t type metadata accessor for NoSessionNavigationController()
{
  return self;
}

id sub_1000E2FB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseControl();
  [super dealloc];
}

uint64_t type metadata accessor for BaseControl()
{
  return self;
}

id sub_1000E300C()
{
  uint64_t v1 = v0;
  objc_super v2 = (void *)0x8000000100130860;
  unint64_t v15 = 0xD00000000000001ALL;
  unint64_t v16 = 0x8000000100130860;
  unsigned int v3 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if (v3)
  {
    v4._countAndFlagsBits = 4342623;
    v4._object = (void *)0xE300000000000000;
    String.append(_:)(v4);
    uint64_t v5 = v15;
    objc_super v2 = (void *)v16;
  }
  else
  {
    uint64_t v5 = 0xD00000000000001ALL;
  }
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, v5, v2);
  swift_bridgeObjectRelease();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v7 = sub_10004622C(0xD00000000000001DLL);
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, (uint64_t)v7, v8);
  swift_bridgeObjectRelease();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [self imageNamed:v10];

  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for DiagnosticsCompletedViewController();
  [super initWithTitle:v6 detailText:v9 icon:v11 contentLayout:2];

  return v12;
}

void sub_1000E31F0()
{
  uint64_t v1 = v0;
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for DiagnosticsCompletedViewController();
  [super viewDidLoad];
  [v0 setModalPresentationStyle:2];
  id v2 = [v0 headerView];
  [v2 setTitleHyphenationFactor:0.0];

  id v3 = [self boldButton];
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000017, (void *)0x800000010012BDB0);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v3 setTitle:v4 forState:0];

  sub_10003C374(0, (unint64_t *)&qword_1001831A8);
  uint64_t v5 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  [v3 addAction:v5 forControlEvents:64];

  id v6 = [v1 buttonTray];
  [v6 addButton:v3];
}

void sub_1000E33AC()
{
}

uint64_t sub_1000E33FC(char a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v32 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for DispatchTime();
  uint64_t v31 = *(void *)(v33 - 8);
  uint64_t v10 = __chkstk_darwin(v33);
  id v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  objc_super v14 = (char *)&v28 - v13;
  unint64_t v15 = (objc_class *)type metadata accessor for DiagnosticsCompletedViewController();
  v35.receiver = v1;
  v35.super_class = v15;
  [super viewDidAppear:a1 & 1];
  id v16 = [v1 navigationController];
  if (v16)
  {
    id v17 = v16;
    id v18 = [v16 navigationBar];

    [v18 _setBackgroundOpacity:0.0];
  }
  id v19 = [self standardUserDefaults];
  NSString v20 = String._bridgeToObjectiveC()();
  unsigned __int8 v21 = [v19 BOOLForKey:v20];

  if ((v21 & 1) != 0
    || (v22 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isInBoxUpdateModeActive"), uint64_t result = swift_unknownObjectRelease(), v22))
  {
    sub_10003C374(0, (unint64_t *)&qword_100182E40);
    uint64_t v29 = static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    uint64_t v24 = v14;
    + infix(_:_:)();
    uint64_t v30 = v7;
    uint64_t v31 = *(void *)(v31 + 8);
    ((void (*)(char *, uint64_t))v31)(v12, v33);
    aBlock[4] = sub_1000E3874;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000358AC;
    aBlock[3] = &unk_100153500;
    id v25 = _Block_copy(aBlock);
    id v26 = v32;
    static DispatchQoS.unspecified.getter();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_10003AF78();
    sub_10003AFD0((uint64_t *)&unk_100182E50);
    sub_10003B014();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v27 = (void *)v29;
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v26, v30);
    return ((uint64_t (*)(char *, uint64_t))v31)(v24, v33);
  }
  return result;
}

void sub_1000E3874()
{
}

id sub_1000E3934()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsCompletedViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for DiagnosticsCompletedViewController()
{
  return self;
}

uint64_t sub_1000E398C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000E399C()
{
  return swift_release();
}

id sub_1000E39A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_tableView;
  id v10 = objc_allocWithZone((Class)type metadata accessor for IntrinsicSizeAdjustingTableView());
  uint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 initWithFrame:1 style:0.0, 0.0, 0.0, 0.0];
  uint64_t v12 = OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_cancelButton;
  *(void *)&v11[v12] = [self linkButton];
  *(void *)&v11[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_tableViewHorizontalPadding] = 0x4034000000000000;
  v11[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_serverSessionStarted] = 0;
  uint64_t v13 = (uint64_t *)&v11[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinationConfirmationHandler];
  *uint64_t v13 = 0;
  v13[1] = 0;
  *(void *)&v11[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager] = a1;
  *(void *)&v11[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations] = a2;
  uint64_t v14 = *v13;
  *uint64_t v13 = a3;
  v13[1] = a4;
  id v15 = a1;
  sub_10003AF68(a3);
  sub_10003B0B8(v14);

  _StringGuts.grow(_:)(29);
  int DeviceClass = GestaltGetDeviceClass();
  uint64_t v17 = sub_1000AF310(DeviceClass);
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  uint64_t v30 = v17;
  uint64_t v31 = v19;
  v20._object = (void *)0x8000000100130950;
  v20._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v20);
  NSString v21 = String._bridgeToObjectiveC()();
  unsigned int v22 = self;
  id v23 = [v22 _systemImageNamed:v21];

  if (v23)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v23 = [v22 imageNamed:v24];
  }
  sub_100045FCC(0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0xD000000000000012, (void *)0x8000000100130970);
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  sub_100045FCC(0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0xD00000000000001BLL, (void *)0x8000000100130990);
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v29.receiver = v11;
  v29.super_class = (Class)type metadata accessor for SelfServiceDestinationPickerViewController();
  id v27 = [super initWithTitle:v25 detailText:v26 icon:v23 contentLayout:3];
  sub_10003B0B8(a3);

  return v27;
}

void sub_1000E3D60(char a1)
{
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for SelfServiceDestinationPickerViewController();
  [super viewDidAppear:a1 & 1];
  *(void *)(*(void *)&v1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager]
            + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate
            + 8) = &off_100153528;
  swift_unknownObjectWeakAssign();
  [*(id *)&v1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_tableView] invalidateIntrinsicContentSize];
  uint64_t v3 = *(void (**)(void))&v1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinationConfirmationHandler];
  if (v3)
  {
    swift_retain();
    v3(0);
    sub_10003B0B8((uint64_t)v3);
  }
  if (qword_100182740 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_10018A358;
  uint64_t v5 = *(NSObject **)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_disableSystemGesturesQueue);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1000AAD0C;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_10005B17C;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10004FD38;
  v12[3] = &unk_100153858;
  uint64_t v8 = _Block_copy(v12);
  id v9 = v4;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v5)
  {
    __break(1u);
  }
  else
  {
    id v10 = (unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled);
    *(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled) = 1;
    id v11 = sub_10004CDCC();
    [v11 setNearbySharingEnabled:(*v10 & 1) == 0];

    sub_10004CE5C();
    sub_10004D0A4();
  }
}

void sub_1000E40B8()
{
  id v1 = [v0 navigationItem];
  [v1 setHidesBackButton:1];

  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_tableView];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setDataSource:v0];
  [v2 setDelegate:v0];
  [v2 setSeparatorStyle:0];
  [v2 setScrollEnabled:0];
  [v2 setShowsVerticalScrollIndicator:0];
  id v3 = [self clearColor];
  [v2 setBackgroundColor:v3];

  [v2 setRowHeight:UITableViewAutomaticDimension];
  [v2 setEstimatedRowHeight:300.0];
  type metadata accessor for SelfServiceViewCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v5 = String._bridgeToObjectiveC()();
  [v2 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v5];

  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_cancelButton];
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001FLL, (void *)0x800000010012D150);
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 setTitle:v7 forState:0];

  sub_10003C374(0, (unint64_t *)&qword_1001831A8);
  id v8 = (id)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  [v6 addAction:v8 forControlEvents:64];
}

uint64_t sub_1000E4358()
{
  unsigned int v0 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if (v0) {
    id v1 = sub_10007CEBC;
  }
  else {
    id v1 = sub_1000E443C;
  }
  sub_10003AF68((uint64_t)v1);
  sub_100070524(1);
  sub_10003B0B8((uint64_t)v1);

  return sub_10003B0B8((uint64_t)v1);
}

id sub_1000E443C()
{
  if (qword_100182740 != -1) {
    swift_once();
  }
  unsigned int v0 = (void *)qword_10018A358;
  id v1 = *(NSObject **)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_disableSystemGesturesQueue);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_10007F110;
  *(void *)(v3 + 24) = v2;
  v11[4] = sub_100042974;
  v11[5] = v3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004FD38;
  v11[3] = &unk_1001537E0;
  uint64_t v4 = _Block_copy(v11);
  id v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  id result = (id)swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    NSString v7 = (unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled);
    *(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled) = (*(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingPreferencesState) & 1) == 0;
    id v8 = sub_10004CDCC();
    [v8 setNearbySharingEnabled:(*v7 & 1) == 0];

    uint64_t v9 = qword_10018A358;
    id v10 = sub_10004CDCC();
    [v10 setDiscoverableMode:*(void *)(v9 + OBJC_IVAR____TtC11Diagnostics10Assertions_airDropUserSetting)];

    id result = *(id *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_captureButtonAssertion);
    if (result) {
      return [result invalidate];
    }
  }
  return result;
}

id sub_1000E4668()
{
  id v1 = v0;
  uint64_t v2 = self;
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100123C30;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_tableView];
  id v5 = [v4 leadingAnchor];
  id v6 = [v1 contentView];
  id v7 = [v6 leadingAnchor];

  id v8 = [v5 constraintEqualToAnchor:v7 constant:20.0];
  *(void *)(v3 + 32) = v8;
  id v9 = [v4 trailingAnchor];
  id v10 = [v1 contentView];
  id v11 = [v10 trailingAnchor];

  id v12 = [v9 constraintEqualToAnchor:v11 constant:-20.0];
  *(void *)(v3 + 40) = v12;
  id v13 = [v4 topAnchor];
  id v14 = [v1 contentView];
  id v15 = [v14 topAnchor];

  id v16 = [v13 constraintEqualToAnchor:v15];
  *(void *)(v3 + 48) = v16;
  id v17 = [v4 bottomAnchor];
  id v18 = [v1 contentView];
  id v19 = [v18 bottomAnchor];

  id v20 = [v17 constraintEqualToAnchor:v19];
  *(void *)(v3 + 56) = v20;
  specialized Array._endMutation()();
  sub_10003C374(0, (unint64_t *)&qword_1001831A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 activateConstraints:isa];

  return [v4 invalidateIntrinsicContentSize];
}

id sub_1000E49B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SelfServiceDestinationPickerViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SelfServiceDestinationPickerViewController()
{
  return self;
}

unsigned char *sub_1000E4A90(void *a1)
{
  uint64_t v2 = v1;
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [a1 dequeueReusableCellWithIdentifier:v4];

  if (v5)
  {
    type metadata accessor for SelfServiceViewCell();
    id v6 = (unsigned char *)swift_dynamicCastClass();
    if (v6) {
      goto LABEL_5;
    }
  }
  type metadata accessor for SelfServiceViewCell();
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
LABEL_5:
  v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleTruncated] = 0;
  uint64_t v7 = OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleLabel;
  [*(id *)&v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleLabel] setNumberOfLines:0];
  uint64_t v8 = IndexPath.section.getter();
  uint64_t v9 = OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations;
  unint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations);
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v12 = IndexPath.section.getter();
  unint64_t v13 = v12;
  unint64_t v14 = *(void *)(v2 + v9);
  if (v8 >= v11)
  {
    if (!(v14 >> 62))
    {
      if (v12 != *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_18;
      }
LABEL_17:
      sub_1000E502C((uint64_t)v6);
      goto LABEL_18;
    }
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v45 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v13 != v45) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ((v14 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v12 >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  id v15 = *(id *)(v14 + 8 * v12 + 32);
LABEL_12:
  id v16 = [v15 endpoint];

  if (v16 != (id)2)
  {
    if (v16 != (id)1) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v18 = [self configurationWithScale:3];
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = [self systemImageNamed:v19 withConfiguration:v18];

  if (v20)
  {
    id v21 = [objc_allocWithZone((Class)UIColor) initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
    id v22 = [v20 imageWithTintColor:v21];
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v23 = OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage;
  NSString v24 = *(void **)&v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage];
  *(void *)&v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage] = v22;
  id v25 = v22;

  NSString v26 = *(void **)&v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImageView];
  id v27 = *(void **)&v6[v23];
  uint64_t v28 = self;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v26;
  *(void *)(v29 + 24) = v27;
  v46[4] = sub_10007F200;
  v46[5] = v29;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 1107296256;
  v46[2] = sub_1000358AC;
  v46[3] = &unk_100153718;
  uint64_t v30 = _Block_copy(v46);
  id v31 = v27;
  id v32 = v26;
  swift_release();
  [v28 transitionWithView:v32 duration:5242880 options:v30 animations:0 completion:0.1];
  _Block_release(v30);

  uint64_t v33 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x5F4E55525F525353, (void *)0xEE00524941504552);
  id v34 = (uint64_t *)&v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_titleText];
  *id v34 = v33;
  v34[1] = v35;
  swift_bridgeObjectRelease();
  if (v34[1])
  {
    double v36 = *(void **)&v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_titleLabel];
    swift_bridgeObjectRetain();
    id v37 = v36;
    NSString v38 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v37 setText:v38];
  }
  uint64_t v39 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000016, (void *)0x80000001001309D0);
  id v40 = (uint64_t *)&v6[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleText];
  *id v40 = v39;
  v40[1] = v41;
  swift_bridgeObjectRelease();
  if (v40[1])
  {
    uint64_t v42 = *(void **)&v6[v7];
    swift_bridgeObjectRetain();
    id v43 = v42;
    NSString v44 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v43 setText:v44];
  }
LABEL_18:
  [v6 setAccessoryType:1];
  return v6;
}

void sub_1000E502C(uint64_t a1)
{
  id v2 = [self configurationWithScale:3];
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self systemImageNamed:v3 withConfiguration:v2];

  if (v4)
  {
    id v5 = [objc_allocWithZone((Class)UIColor) initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
    id v6 = [v4 imageWithTintColor:v5];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage;
  uint64_t v8 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage);
  *(void *)(a1 + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage) = v6;
  id v9 = v6;

  unint64_t v10 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImageView);
  uint64_t v11 = *(void **)(a1 + v7);
  unint64_t v12 = self;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  *(void *)(v13 + 24) = v11;
  v32[4] = sub_1000E6BB4;
  void v32[5] = v13;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 1107296256;
  v32[2] = sub_1000358AC;
  v32[3] = &unk_100153768;
  unint64_t v14 = _Block_copy(v32);
  id v15 = v11;
  id v16 = v10;
  swift_release();
  [v12 transitionWithView:v16 duration:5242880 options:v14 animations:0 completion:0.1];
  _Block_release(v14);

  uint64_t v17 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000013, (void *)0x8000000100130A10);
  id v18 = (uint64_t *)(a1 + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_titleText);
  *id v18 = v17;
  v18[1] = v19;
  swift_bridgeObjectRelease();
  if (v18[1])
  {
    id v20 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_titleLabel);
    swift_bridgeObjectRetain();
    id v21 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v21 setText:v22];
  }
  id v23 = sub_10004622C(0xD00000000000001BLL);
  uint64_t v25 = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, (uint64_t)v23, v24);
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = (uint64_t *)(a1 + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleText);
  *uint64_t v28 = v25;
  v28[1] = v27;
  swift_bridgeObjectRelease();
  if (v28[1])
  {
    uint64_t v29 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleLabel);
    swift_bridgeObjectRetain();
    id v30 = v29;
    NSString v31 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v30 setText:v31];
  }
}

void sub_1000E55F8(char a1, void *a2, char *a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && (a1 & 1) != 0)
  {
    unint64_t v14 = *(char **)&a3[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager];
    id v15 = *(void **)&v14[OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState];
    if (v15)
    {
      id v16 = &v14[OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate];
      if (!swift_unknownObjectWeakLoadStrong()) {
        return;
      }
      uint64_t v17 = *((void *)v16 + 1);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v19 = (void *)swift_allocObject();
      v19[2] = v14;
      v19[3] = v15;
      v19[4] = a2;
      id v20 = *(void (**)(char *, id, void (*)(), void *, uint64_t, uint64_t))(v17 + 48);
      id v21 = a2;
      id v22 = v15;
      id v23 = v21;
      id v31 = v22;
      v20(v14, v23, sub_10003B9D4, v19, ObjectType, v17);

      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      sub_10003C374(0, (unint64_t *)&qword_1001832C0);
      id v28 = a2;
      id v31 = (id)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
    }
    uint64_t v29 = v31;
  }
  else
  {
    sub_10003C374(0, (unint64_t *)&qword_100182E40);
    NSString v24 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a3;
    aBlock[4] = sub_1000E6BE8;
    aBlock[5] = v25;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000358AC;
    aBlock[3] = &unk_100153628;
    uint64_t v26 = _Block_copy(aBlock);
    uint64_t v27 = a3;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_10003AF78();
    sub_10003AFD0((uint64_t *)&unk_100182E50);
    sub_10003B014();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

void sub_1000E5A0C(char a1, void *a2, char *a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && (a1 & 1) != 0)
  {
    unint64_t v14 = *(char **)&a3[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager];
    id v15 = *(void **)&v14[OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState];
    if (v15)
    {
      id v16 = &v14[OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate];
      if (!swift_unknownObjectWeakLoadStrong()) {
        return;
      }
      uint64_t v17 = *((void *)v16 + 1);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v19 = (void *)swift_allocObject();
      v19[2] = v14;
      v19[3] = v15;
      v19[4] = a2;
      id v20 = *(void (**)(char *, id, uint64_t (*)(), void *, uint64_t, uint64_t))(v17 + 48);
      id v21 = a2;
      id v22 = v15;
      id v23 = v21;
      id v31 = v22;
      v20(v14, v23, sub_10007F51C, v19, ObjectType, v17);

      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      sub_10003C374(0, (unint64_t *)&qword_1001832C0);
      id v28 = a2;
      id v31 = (id)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();
    }
    uint64_t v29 = v31;
  }
  else
  {
    sub_10003C374(0, (unint64_t *)&qword_100182E40);
    NSString v24 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a3;
    aBlock[4] = sub_1000E6B34;
    aBlock[5] = v25;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000358AC;
    aBlock[3] = &unk_1001536A0;
    uint64_t v26 = _Block_copy(aBlock);
    uint64_t v27 = a3;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_10003AF78();
    sub_10003AFD0((uint64_t *)&unk_100182E50);
    sub_10003B014();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

void sub_1000E5E20(char *a1)
{
  id v2 = *(void **)&a1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager];
  id v3 = objc_allocWithZone((Class)type metadata accessor for SelfServiceSuitePickerViewController());
  id v6 = sub_10008EDC0(v2);
  id v4 = [a1 navigationController];
  if (v4)
  {
    id v5 = v4;
    [v4 pushViewController:v6 animated:1];
  }
}

void sub_1000E5FBC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void **)&a1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager];
  objc_allocWithZone((Class)type metadata accessor for SelfServiceSuiteInProgressViewController());
  uint64_t v13 = sub_10009D388(v8, a2);
  id v9 = (uint64_t *)&v13[OBJC_IVAR____TtC11Diagnostics40SelfServiceSuiteInProgressViewController_onAppear];
  uint64_t v10 = *(void *)&v13[OBJC_IVAR____TtC11Diagnostics40SelfServiceSuiteInProgressViewController_onAppear];
  uint64_t *v9 = a3;
  v9[1] = a4;
  sub_10003AF68(a3);
  sub_10003B0B8(v10);
  id v11 = [a1 navigationController];
  if (v11)
  {
    uint64_t v12 = v11;
    [v11 pushViewController:v13 animated:1];
  }
}

uint64_t sub_1000E60B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000E60C8(a2, a3, a4);
}

uint64_t sub_1000E60C8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v22 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C374(0, (unint64_t *)&qword_100182E40);
  uint64_t v20 = static OS_dispatch_queue.main.getter();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v3;
  v13[3] = a1;
  v13[4] = a2;
  void v13[5] = a3;
  aBlock[4] = sub_1000E63CC;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000358AC;
  aBlock[3] = &unk_100153588;
  unint64_t v14 = _Block_copy(aBlock);
  id v15 = v3;
  id v16 = a1;
  sub_10003AF68(a2);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10003AF78();
  sub_10003AFD0((uint64_t *)&unk_100182E50);
  sub_10003B014();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v17 = (void *)v20;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v21);
}

uint64_t sub_1000E637C()
{
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000E63CC()
{
  sub_1000E5FBC(*(char **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1000E63D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000E63E8()
{
  return swift_release();
}

uint64_t sub_1000E63F0()
{
  uint64_t v1 = OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations;
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations);
  if (v2 >> 62) {
    goto LABEL_17;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(v2 + 8 * v4);
      id v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 endpoint];

      if (v8 == (id)1) {
        goto LABEL_14;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain_n();
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  unint64_t v9 = *(void *)(v0 + v1);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t result = v0 + 1;
    if (!__OFADD__(v0, 1)) {
      return result;
    }
  }
  else
  {
    uint64_t v0 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = v0 + 1;
    if (!__OFADD__(v0, 1)) {
      return result;
    }
  }
  __break(1u);
LABEL_14:
  swift_bridgeObjectRelease_n();
  unint64_t v11 = *(void *)(v0 + v1);
  if (!(v11 >> 62)) {
    return *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v12;
}

void sub_1000E6598()
{
  uint64_t v1 = v0;
  unint64_t v2 = &v0[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinationConfirmationHandler];
  uint64_t v3 = *(void (**)(unint64_t))&v0[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinationConfirmationHandler];
  if (!v3) {
    return;
  }
  swift_retain();
  uint64_t v4 = IndexPath.section.getter();
  uint64_t v5 = OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations;
  unint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations];
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v8 = IndexPath.section.getter();
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)&v1[v5];
  if (v4 < v7)
  {
    if ((v10 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v8 >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_40;
      }
      id v11 = *(id *)(v10 + 8 * v8 + 32);
LABEL_9:
      unint64_t v10 = (unint64_t)[v11 endpoint];

      if (v10 != 2)
      {
LABEL_13:
        v3(v10);
        *(void *)(swift_allocObject() + 16) = v1;
        uint64_t v20 = v1;
        sub_10007B0E0(v10, (void (*)(uint64_t, id))sub_1000E6B28);
        sub_10003B0B8((uint64_t)v3);
LABEL_18:
        swift_release();
        return;
      }
      if (qword_100182758 == -1)
      {
LABEL_11:
        type metadata accessor for DKViewControllerDelegateResponder();
        uint64_t v12 = swift_dynamicCastClass();
        if (v12)
        {
          uint64_t v13 = v12;
          swift_unknownObjectRetain();
          uint64_t v14 = sub_100045808(16, 0);
          uint64_t v15 = v13 + OBJC_IVAR____TtC11Diagnostics33DKViewControllerDelegateResponder__presentationTransitionStyle;
          *(void *)uint64_t v15 = v14;
          *(unsigned char *)(v15 + 8) = v16 & 1;
          uint64_t v17 = sub_100045808(16, 0);
          uint64_t v18 = v13 + OBJC_IVAR____TtC11Diagnostics33DKViewControllerDelegateResponder__dismissalTransitionStyle;
          *(void *)uint64_t v18 = v17;
          *(unsigned char *)(v18 + 8) = v19 & 1;
          swift_unknownObjectRelease();
        }
        goto LABEL_13;
      }
LABEL_40:
      swift_once();
      goto LABEL_11;
    }
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v9 != v37) {
      goto LABEL_36;
    }
    goto LABEL_16;
  }
  if (v10 >> 62) {
    goto LABEL_35;
  }
  if (v8 != *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_36:
    sub_10003B0B8((uint64_t)v3);
    return;
  }
LABEL_16:
  id v21 = [self sharedInstance];
  [v21 overrideSessionModeWithMode:0];

  uint64_t v22 = OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_serverSessionStarted;
  if (v1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_serverSessionStarted])
  {
    *(void *)(swift_allocObject() + 16) = v1;
    id v23 = v1;
    sub_10007B0E0(1, (void (*)(uint64_t, id))sub_1000E6B20);
    sub_10003B0B8((uint64_t)v3);
    goto LABEL_18;
  }
  NSString v24 = [objc_allocWithZone((Class)type metadata accessor for SetupViewController()) init];
  v24[OBJC_IVAR____TtC11Diagnostics19SetupViewController_entryReason] = 5;
  id v25 = [v1 navigationController];
  if (v25)
  {
    uint64_t v26 = v25;
    [v25 pushViewController:v24 animated:1];
  }
  uint64_t v27 = *(void (**)(uint64_t))v2;
  if (*(void *)v2)
  {
    swift_retain();
    v27(1);
    sub_10003B0B8((uint64_t)v27);
  }
  id v28 = *(char **)&v1[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager];
  uint64_t v29 = OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState;
  [*(id *)&v28[OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState] resetState];
  uint64_t v30 = *(void **)&v28[v29];
  if (v30) {
    [v30 setPhase:0];
  }
  objc_sync_enter(v28);
  id v31 = *(void **)&v28[v29];
  if (v31)
  {
    id v32 = [v31 serialNumber];
    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v35 = v34;

    sub_1000B1FFC(v33, v35);
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_log_type_t.error.getter();
    sub_10003C374(0, (unint64_t *)&qword_1001832C0);
    double v36 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
  }
  objc_sync_exit(v28);
  sub_10003B0B8((uint64_t)v3);

  v1[v22] = 1;
}

uint64_t sub_1000E6AE8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000E6B20(char a1, void *a2)
{
  sub_1000E5A0C(a1, a2, *(char **)(v2 + 16));
}

void sub_1000E6B28(char a1, void *a2)
{
  sub_1000E55F8(a1, a2, *(char **)(v2 + 16));
}

void sub_1000E6B34()
{
  sub_1000E5E20(*(char **)(v0 + 16));
}

uint64_t sub_1000E6B54()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000E6B94()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000E6BA4()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_1000E6C04()
{
  id v0 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v0 setDateStyle:2];
  id result = [v0 setTimeStyle:1];
  qword_100186070 = (uint64_t)v0;
  return result;
}

uint64_t sub_1000E6C68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10003AFD0(&qword_100185000);
  __chkstk_darwin(v4 - 8);
  uint64_t v45 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v40 = a1;
  uint64_t v42 = v8;
  uint64_t v43 = v7 + 16;
  v8(a2, a1, v6);
  NSURLResourceKey v50 = NSURLIsDirectoryKey;
  id v46 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  id v47 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  double v48 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  NSURLResourceKey v49 = NSURLIsRegularFileKey;
  uint64_t v41 = v7;
  NSString v44 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  unint64_t v9 = (NSURL *)&unk_100123000;
  long long v52 = xmmword_100123B50;
  while (1)
  {
    URL._bridgeToObjectiveC()(v9);
    id v11 = v10;
    sub_10003AFD0((uint64_t *)&unk_1001841F0);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = v52;
    NSURLResourceKey v13 = v50;
    *(void *)(v12 + 32) = v50;
    type metadata accessor for URLResourceKey(0);
    uint64_t v14 = v13;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v53 = 0;
    id v16 = v51;
    id v17 = [v51 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:isa options:4 error:&v53];

    id v18 = v53;
    if (!v17)
    {
      uint64_t v21 = a2;
      id v36 = v53;
LABEL_13:
      uint64_t v37 = v40;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      sub_1000999D0();
      NSString v38 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      swift_errorRelease();
      (*v48)(v21, v6);
      return v42(v21, v37, v6);
    }
    uint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v20 = v18;

    uint64_t v21 = a2;
    URL._bridgeToObjectiveC()(v22);
    NSString v24 = v23;
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = v52;
    NSURLResourceKey v26 = v49;
    *(void *)(v25 + 32) = v49;
    uint64_t v27 = v26;
    Class v28 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v53 = 0;
    id v29 = [v16 contentsOfDirectoryAtURL:v24 includingPropertiesForKeys:v28 options:4 error:&v53];

    id v30 = v53;
    if (!v29)
    {
      id v36 = v53;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    uint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v32 = v30;

    if (*(void *)(v19 + 16) != 1) {
      break;
    }
    uint64_t v33 = *(void *)(v31 + 16);
    swift_bridgeObjectRelease();
    if (v33) {
      return swift_bridgeObjectRelease();
    }
    if (*(void *)(v19 + 16))
    {
      uint64_t v34 = (uint64_t)v45;
      v42((uint64_t)v45, v19 + ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80)), v6);
      uint64_t v35 = 0;
    }
    else
    {
      uint64_t v35 = 1;
      uint64_t v34 = (uint64_t)v45;
    }
    (*v47)(v34, v35, 1, v6);
    swift_bridgeObjectRelease();
    if ((*v46)(v34, 1, v6) == 1) {
      return sub_100078A64(v34);
    }
    a2 = v21;
    (*v48)(v21, v6);
    (*v44)(v21, v34, v6);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall QLPreviewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  v1.super_class = (Class)QLPreviewController;
  [super viewWillDisappear:a1];
  sub_1000E71C8();
}

uint64_t sub_1000E71C8()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v26 - v5;
  uint64_t v7 = self;
  id v8 = [v7 defaultManager];
  id v9 = [v8 temporaryDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  URL.appendingPathComponent(_:)();
  unint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  id v11 = [v7 defaultManager];
  URL.path.getter();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  LODWORD(v4) = [v11 fileExistsAtPath:v12];

  if (v4)
  {
    id v13 = [v7 defaultManager];
    URL._bridgeToObjectiveC()(v14);
    id v16 = v15;
    id v29 = 0;
    unsigned int v17 = [v13 removeItemAtURL:v15 error:&v29];

    if (v17)
    {
      id v18 = v29;
    }
    else
    {
      id v19 = v29;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      sub_1000999D0();
      swift_errorRetain();
      swift_errorRetain();
      id v20 = static OS_os_log.default.getter();
      os_log_type_t v21 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v20, v21))
      {
        os_log_t v28 = v20;
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 138412290;
        swift_errorRetain();
        id v23 = (void *)_swift_stdlib_bridgeErrorToNSError();
        id v29 = v23;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v27 = v23;
        swift_errorRelease();
        swift_errorRelease();
        os_log_t v24 = v28;
        _os_log_impl((void *)&_mh_execute_header, v28, v21, "Removing temporary file failed: %@", v22, 0xCu);
        sub_10003AFD0((uint64_t *)&unk_100186080);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
    }
  }
  return ((uint64_t (*)(char *, uint64_t))v10)(v6, v0);
}

unsigned char *storeEnumTagSinglePayload for DashboardSection(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 2;
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
        JUMPOUT(0x1000E7668);
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
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DashboardSection()
{
  return &type metadata for DashboardSection;
}

uint64_t *sub_1000E76A0@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

unint64_t sub_1000E76BC()
{
  unint64_t result = qword_100186090;
  if (!qword_100186090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100186090);
  }
  return result;
}

uint64_t sub_1000E7710(uint64_t a1, uint64_t a2)
{
  int v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_1000E77F0(void *a1)
{
  if (!a1) {
    return;
  }
  uint64_t v2 = v1;
  int v3 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint] = 0;
  id v24 = a1;

  unsigned int v4 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint] = 0;

  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint] = 0;

  unsigned int v6 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint] = 0;

  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  *(void *)(v7 + 24) = v24;
  if (v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_animated] == 1)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v24;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_1000E847C;
    *(void *)(v9 + 24) = v7;
    unint64_t v10 = self;
    id v29 = sub_100057568;
    uint64_t v30 = v8;
    aBlock = _NSConcreteStackBlock;
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_1000358AC;
    os_log_t v28 = &unk_1001539D8;
    id v11 = _Block_copy(&aBlock);
    id v12 = v24;
    id v13 = v2;
    swift_retain();
    swift_retain();
    swift_release();
    id v29 = sub_10003C640;
    uint64_t v30 = v9;
    aBlock = _NSConcreteStackBlock;
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_1000E7710;
    os_log_t v28 = &unk_100153A00;
    uint64_t v14 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [v10 animateWithDuration:0x20000 delay:v11 options:v14 animations:0.125 completion:0.0];
    _Block_release(v14);
    _Block_release(v11);
    swift_release();
    swift_release();
    swift_release();

    return;
  }
  uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView];
  if (v15)
  {
    sub_10003C374(0, (unint64_t *)&qword_1001858F0);
    id v16 = v24;
    unsigned int v17 = v1;
    id v18 = v15;
    char v19 = static NSObject.== infix(_:_:)();

    if (v19) {
      goto LABEL_10;
    }
  }
  else
  {
    id v20 = v24;
    os_log_type_t v21 = v1;
  }
  [v24 removeFromSuperview];
LABEL_10:
  uint64_t v22 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion];
  if (v22)
  {
    uint64_t v23 = swift_retain();
    v22(v23);
    sub_10003B0B8((uint64_t)v22);
  }
  swift_release();
}

void sub_1000E7B60(uint64_t a1, id a2)
{
  unsigned int v4 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView);
  if (!v4
    || (sub_10003C374(0, (unint64_t *)&qword_1001858F0),
        id v5 = a2,
        id v6 = v4,
        char v7 = static NSObject.== infix(_:_:)(),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [a2 removeFromSuperview];
  }
  uint64_t v8 = *(void (**)(uint64_t))(a1
                                      + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion);
  if (v8)
  {
    uint64_t v9 = swift_retain();
    v8(v9);
    sub_10003B0B8((uint64_t)v8);
  }
}

void sub_1000E7C4C()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView];
  if (v1)
  {
    uint64_t v2 = v0;
    id v42 = v1;
    [v0 addSubview:v42];
    id v3 = [v0 topAnchor];
    id v4 = [v42 topAnchor];
    id v5 = [v3 constraintEqualToAnchor:v4];

    uint64_t v6 = OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint;
    char v7 = *(void **)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint];
    *(void *)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint] = v5;

    id v8 = [v2 bottomAnchor];
    id v9 = [v42 bottomAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];

    uint64_t v11 = OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint;
    id v12 = *(void **)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint];
    *(void *)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint] = v10;

    id v13 = [v2 leadingAnchor];
    id v14 = [v42 leadingAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];

    uint64_t v16 = OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint;
    unsigned int v17 = *(void **)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint];
    *(void *)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint] = v15;

    id v18 = [v2 trailingAnchor];
    id v19 = [v42 trailingAnchor];
    id v20 = [v18 constraintEqualToAnchor:v19];

    uint64_t v21 = OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint;
    uint64_t v22 = *(void **)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint];
    *(void *)&v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint] = v20;

    uint64_t v23 = *(void **)&v2[v6];
    if (v23)
    {
      id v24 = *(void **)&v2[v11];
      if (v24)
      {
        uint64_t v25 = *(void **)&v2[v16];
        if (v25)
        {
          uint64_t v26 = *(void **)&v2[v21];
          if (v26)
          {
            uint64_t v27 = self;
            sub_10003AFD0((uint64_t *)&unk_100182E20);
            uint64_t v28 = swift_allocObject();
            *(_OWORD *)(v28 + 16) = xmmword_100123C30;
            *(void *)(v28 + 32) = v23;
            *(void *)(v28 + 40) = v24;
            *(void *)(v28 + 48) = v25;
            *(void *)(v28 + 56) = v26;
            aBlock[0] = v28;
            specialized Array._endMutation()();
            sub_10003C374(0, (unint64_t *)&qword_1001831A0);
            id v29 = v23;
            id v30 = v24;
            id v31 = v25;
            id v32 = v26;
            id v33 = v29;
            id v34 = v30;
            id v35 = v31;
            id v36 = v32;
            Class isa = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            [v27 activateConstraints:isa];
          }
        }
      }
    }
    if (v2[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_animated] == 1)
    {
      [v42 setAlpha:0.0];
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = v42;
      uint64_t v39 = self;
      aBlock[4] = sub_10005739C;
      aBlock[5] = v38;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000358AC;
      aBlock[3] = &unk_100153938;
      uint64_t v40 = _Block_copy(aBlock);
      id v41 = v42;
      swift_retain();
      swift_release();
      [v39 animateWithDuration:0x10000 delay:v40 options:0 animations:0.375 completion:0.0];
      _Block_release(v40);
      swift_release();
      [v2 layoutIfNeeded];
    }
    else
    {
    }
  }
}

id sub_1000E80C8(double a1, double a2, double a3, double a4)
{
  v4[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_animated] = 1;
  id v9 = &v4[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion];
  void *v9 = 0;
  v9[1] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView] = 0;
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for CardStackSubviewContainer();
  return [super initWithFrame:a1, a2, a3, a4];
}

id sub_1000E81AC(void *a1)
{
  v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_animated] = 1;
  id v3 = &v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion];
  *id v3 = 0;
  v3[1] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_topContainerConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_bottomContainerConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_leadingContainerConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_trailingContainerConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for CardStackSubviewContainer();
  [super initWithCoder:a1];

  return v4;
}

void sub_1000E8280()
{
  sub_10003B0B8(*(void *)(v0 + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedViewRemovedCompletion));

  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics25CardStackSubviewContainer_containedView);
}

id sub_1000E8304()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CardStackSubviewContainer();
  return [super dealloc];
}

uint64_t type metadata accessor for CardStackSubviewContainer()
{
  return self;
}

uint64_t sub_1000E83EC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000E8424(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000E8434()
{
  return swift_release();
}

uint64_t sub_1000E843C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000E847C()
{
  sub_1000E7B60(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_1000E8484()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Class sub_1000E84D0()
{
  uint64_t v1 = v0;
  id v2 = [self systemFontOfSize:22.0];
  id v3 = self;
  id v4 = [v3 configurationWithFont:v2];

  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100123D80;
  objc_super v6 = self;
  *(void *)(v5 + 32) = [v6 systemBlueColor];
  *(void *)(v5 + 40) = [v6 systemGray6Color];
  specialized Array._endMutation()();
  sub_10003C374(0, (unint64_t *)&unk_1001864D0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [v3 configurationWithPaletteColors:isa];

  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = self;
  id v11 = [v10 systemImageNamed:v9 withConfiguration:v8];

  id v12 = (objc_class *)[v11 imageByApplyingSymbolConfiguration:v4];
  unint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100123D80;
  sub_10003C374(0, (unint64_t *)&qword_1001831A8);
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x5F4E4F4953534553, (void *)0xEF59524F54534948);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v10 systemImageNamed:v14];

  *(void *)(swift_allocObject() + 16) = v1;
  id v16 = v1;
  *(void *)(v13 + 32) = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001FLL, (void *)0x800000010012D150);
  *(void *)(v13 + 40) = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  specialized Array._endMutation()();
  if (v13 >> 62)
  {
    sub_10003C374(0, &qword_100186120);
    swift_bridgeObjectRetain();
    UIMenuElementSize preferredElementSize = _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
    sub_10003C374(0, &qword_100186120);
    UIMenuElementSize preferredElementSize = v13;
  }
  swift_bridgeObjectRelease();
  sub_10003C374(0, &qword_100184678);
  sub_10003C374(0, &qword_100186128);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v22.value.super.Class isa = 0;
  v22.is_nil = 0;
  v23.value.super.super.Class isa = UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(v18, (Swift::String_optional)0, v22, 0, 0xFFFFFFFFFFFFFFFFLL, preferredElementSize, (Swift::OpaquePointer)2).super.super.isa;
  v21.value.super.Class isa = v12;
  v21.is_nil = 0;
  Class v19 = UIBarButtonItem.init(title:image:primaryAction:menu:)((Swift::String_optional)0, v21, v23, v24).super.super.isa;

  return v19;
}

void sub_1000E8970(int a1, id a2)
{
  id v2 = [a2 navigationController];
  if (v2)
  {
    id v3 = v2;
    if (qword_1001827A8 != -1) {
      swift_once();
    }
    id v4 = (void *)qword_10018A3D0;
    id v5 = objc_allocWithZone((Class)type metadata accessor for SelfServiceSessionHistoryViewController());
    id v6 = sub_1000498C4(v4);
    [v3 pushViewController:v6 animated:1];
  }
}

uint64_t sub_1000E8A54()
{
  unsigned int v0 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if (v0) {
    uint64_t v1 = sub_10007CEBC;
  }
  else {
    uint64_t v1 = sub_1000E8B38;
  }
  sub_10003AF68((uint64_t)v1);
  sub_100070524(1);
  sub_10003B0B8((uint64_t)v1);

  return sub_10003B0B8((uint64_t)v1);
}

id sub_1000E8B38()
{
  if (qword_100182740 != -1) {
    swift_once();
  }
  unsigned int v0 = (void *)qword_10018A358;
  uint64_t v1 = *(NSObject **)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_disableSystemGesturesQueue);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_10007F110;
  *(void *)(v3 + 24) = v2;
  v11[4] = sub_100042974;
  v11[5] = v3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004FD38;
  v11[3] = &unk_100153AA0;
  id v4 = _Block_copy(v11);
  id v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  id result = (id)swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    char v7 = (unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled);
    *(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled) = (*(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingPreferencesState) & 1) == 0;
    id v8 = sub_10004CDCC();
    [v8 setNearbySharingEnabled:(*v7 & 1) == 0];

    uint64_t v9 = qword_10018A358;
    id v10 = sub_10004CDCC();
    [v10 setDiscoverableMode:*(void *)(v9 + OBJC_IVAR____TtC11Diagnostics10Assertions_airDropUserSetting)];

    id result = *(id *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_captureButtonAssertion);
    if (result) {
      return [result invalidate];
    }
  }
  return result;
}

id sub_1000E8E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    NSString v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v13 = 0;
    goto LABEL_6;
  }
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
LABEL_6:
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for SelfServiceBaseNavigationController();
  id v14 = [super initWithTitle:v11 detailText:v12 symbolName:v13 contentLayout:a7];

  return v14;
}

id sub_1000E90B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SelfServiceBaseNavigationController();
  [super dealloc];
}

uint64_t type metadata accessor for SelfServiceBaseNavigationController()
{
  return self;
}

uint64_t sub_1000E910C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000E9144(int a1)
{
  sub_1000E8970(a1, *(id *)(v1 + 16));
}

uint64_t sub_1000E914C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000E915C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000E916C()
{
  return swift_release();
}

double sub_1000E9178@<D0>(_OWORD *a1@<X8>)
{
  sub_1000570EC();
  EnvironmentValues.subscript.getter();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1000E91C8()
{
  return EnvironmentValues.subscript.setter();
}

id sub_1000E9214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  *(void *)&v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_defaultTransitionDuration] = 0x3FC999999999999ALL;
  NSString v12 = &v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_answer];
  *(void *)NSString v12 = 0;
  *((void *)v12 + 1) = 0;
  NSString v13 = &v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onButtonPress];
  *(void *)NSString v13 = 0;
  *((void *)v13 + 1) = 0;
  id v14 = &v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onDismiss];
  *(void *)id v14 = 0;
  *((void *)v14 + 1) = 0;
  *(void *)&v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_images] = a1;
  *(void *)&v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_instructions] = a2;
  *(void *)&v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_style] = a3;
  *(void *)&v10[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_options] = a8;
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a7)
  {
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  v19.receiver = v10;
  v19.super_class = (Class)type metadata accessor for SelfServiceInstructionsViewController();
  id v17 = [super initWithTitle:v15 detailText:v16 icon:a9 contentLayout:a10];

  return v17;
}

void sub_1000E9350()
{
  uint64_t v1 = v0;
  v100.receiver = v0;
  v100.super_class = (Class)type metadata accessor for SelfServiceInstructionsViewController();
  [super viewDidLoad];
  id v2 = [v0 navigationItem];
  [v2 setHidesBackButton:1];

  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_images];
  uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_instructions];
  uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_style];
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v98 = 0;
  char v99 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10003AFD0(&qword_100186198);
  State.init(wrappedValue:)();
  uint64_t v7 = v85;
  char v8 = BYTE8(v85);
  uint64_t v9 = v86;
  uint64_t v10 = swift_getKeyPath();
  Swift::String v83 = v1;
  id v11 = [v1 view];
  if (!v11) {
    goto LABEL_39;
  }
  NSString v12 = v11;
  [v11 bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  long long v85 = xmmword_100126880;
  uint64_t v86 = KeyPath;
  uint64_t v87 = 0;
  char v88 = 0;
  uint64_t v89 = v7;
  char v90 = v8;
  uint64_t v91 = v9;
  uint64_t v92 = v3;
  uint64_t v93 = v4;
  uint64_t v94 = v5;
  uint64_t v95 = v10;
  uint64_t v96 = v14;
  uint64_t v97 = v16;
  id v17 = objc_allocWithZone((Class)sub_10003AFD0((uint64_t *)&unk_1001861A0));
  Swift::String v18 = (void *)UIHostingController.init(rootView:)();
  id v19 = [v18 view];
  if (!v19)
  {

    return;
  }
  Swift::String v82 = v18;
  id v20 = v19;
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v21 = [v1 contentView];
  [v21 addSubview:v20];

  id v22 = [v1 scrollView];
  [v22 setShowsVerticalScrollIndicator:0];

  UIAction_optional v23 = self;
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_100123C30;
  id v25 = [v20 leadingAnchor];
  id v26 = [v1 contentView];
  id v27 = [v26 leadingAnchor];

  id v28 = [v25 constraintEqualToAnchor:v27 constant:15.0];
  *(void *)(v24 + 32) = v28;
  id v29 = [v20 trailingAnchor];
  id v30 = [v83 contentView];
  id v31 = [v30 trailingAnchor];

  id v32 = [v29 constraintEqualToAnchor:v31 constant:-15.0];
  *(void *)(v24 + 40) = v32;
  id v33 = [v20 topAnchor];
  id v34 = [v83 contentView];
  id v35 = [v34 topAnchor];

  id v36 = [v33 constraintEqualToAnchor:v35];
  *(void *)(v24 + 48) = v36;
  id v37 = [v20 bottomAnchor];
  id v38 = [v83 contentView];
  id v39 = [v38 bottomAnchor];

  id v40 = [v37 constraintEqualToAnchor:v39];
  *(void *)(v24 + 56) = v40;
  *(void *)&long long v85 = v24;
  specialized Array._endMutation()();
  sub_10003C374(0, (unint64_t *)&qword_1001831A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v23 activateConstraints:isa];

  uint64_t v42 = *(void *)&v83[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_options];
  uint64_t v43 = *(void *)(v42 + 16);
  if (!v43)
  {

    return;
  }
  Swift::String v81 = v20;
  uint64_t v84 = v42 + 32;
  swift_bridgeObjectRetain();
  uint64_t v44 = 0;
  while (1)
  {
    uint64_t v45 = *(void *)(v84 + 8 * v44);
    if (v44) {
      id v46 = &selRef_linkButton;
    }
    else {
      id v46 = &selRef_boldButton;
    }
    id v47 = self;
    swift_bridgeObjectRetain();
    id v48 = [v47 *v46];
    if (*(void *)(v45 + 16) != 1)
    {
      os_log_type_t v66 = static os_log_type_t.error.getter();
      sub_10003C374(0, (unint64_t *)&qword_1001832C0);
      swift_bridgeObjectRetain();
      uint64_t v67 = static OS_os_log.default.getter();
      os_log_type_t v68 = v66;
      if (os_log_type_enabled(v67, v66))
      {
        uint64_t v69 = swift_slowAlloc();
        *(void *)&long long v85 = swift_slowAlloc();
        *(_DWORD *)uint64_t v69 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v70 = Dictionary.description.getter();
        unint64_t v72 = v71;
        swift_bridgeObjectRelease();
        *(void *)(v69 + 4) = sub_10004DAA8(v70, v72, (uint64_t *)&v85);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "Bad options were provided to instructional prompt: %s, skipping", (uint8_t *)v69, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      goto LABEL_7;
    }
    unint64_t v49 = *(void *)(v45 + 64);
    char v50 = *(unsigned char *)(v45 + 32);
    uint64_t v51 = 1 << v50;
    if (v49)
    {
      uint64_t v52 = 0;
      goto LABEL_14;
    }
    if ((v50 & 0x3Fu) >= 7) {
      break;
    }
LABEL_32:
    os_log_type_t v76 = static os_log_type_t.error.getter();
    sub_10003C374(0, (unint64_t *)&qword_1001832C0);
    swift_bridgeObjectRetain();
    uint64_t v65 = static OS_os_log.default.getter();
    if (os_log_type_enabled(v65, v76))
    {
      uint64_t v77 = swift_slowAlloc();
      *(void *)&long long v85 = swift_slowAlloc();
      *(_DWORD *)uint64_t v77 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v78 = Dictionary.description.getter();
      unint64_t v80 = v79;
      swift_bridgeObjectRelease();
      *(void *)(v77 + 4) = sub_10004DAA8(v78, v80, (uint64_t *)&v85);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v65, v76, "Unable to obtain the key-value pair from the option %s, skipping", (uint8_t *)v77, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
LABEL_6:

LABEL_7:
    if (++v44 == v43)
    {

      swift_bridgeObjectRelease();
      return;
    }
  }
  unint64_t v49 = *(void *)(v45 + 72);
  if (!v49)
  {
    uint64_t v73 = 0;
    unint64_t v74 = (unint64_t)(v51 + 63) >> 6;
    if (v74 <= 2) {
      unint64_t v74 = 2;
    }
    unint64_t v75 = v74 - 2;
    while (v75 != v73)
    {
      unint64_t v49 = *(void *)(v45 + 80 + 8 * v73++);
      if (v49)
      {
        uint64_t v52 = v73 + 1;
        goto LABEL_14;
      }
    }
    goto LABEL_32;
  }
  uint64_t v52 = 1;
LABEL_14:
  unint64_t v53 = __clz(__rbit64(v49));
  uint64_t v54 = v53 + (v52 << 6);
  if (v54 == v51) {
    goto LABEL_32;
  }
  if ((v54 & 0x8000000000000000) == 0 && v54 < v51)
  {
    if (((*(void *)(v45 + 64 + (((unint64_t)v54 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v53) & 1) == 0) {
      goto LABEL_38;
    }
    double v55 = (uint64_t *)(*(void *)(v45 + 48) + 16 * v54);
    uint64_t v57 = *v55;
    uint64_t v56 = v55[1];
    uint64_t v58 = (uint64_t *)(*(void *)(v45 + 56) + 16 * v54);
    uint64_t v59 = *v58;
    uint64_t v60 = v58[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    NSString v61 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v48 setTitle:v61 forState:0];

    sub_10003C374(0, (unint64_t *)&qword_1001831A8);
    uint64_t v62 = (void *)swift_allocObject();
    v62[2] = v83;
    v62[3] = v57;
    v62[4] = v56;
    v62[5] = v59;
    v62[6] = v60;
    uint64_t v63 = v83;
    NSString v64 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
    [v48 addAction:v64 forControlEvents:64];

    uint64_t v65 = [v63 buttonTray];
    [v65 addButton:v48];
    goto LABEL_6;
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

void sub_1000E9DA4()
{
  uint64_t v1 = v0;
  id v2 = [v0 navigationController];
  if (!v2) {
    return;
  }
  uint64_t v3 = v2;
  id v4 = [objc_allocWithZone((Class)CATransition) init];
  [v4 setDuration:0.2];
  uint64_t v5 = self;
  id v6 = v4;
  id v7 = [v5 functionWithName:kCAMediaTimingFunctionLinear];
  [v6 setTimingFunction:v7];

  [v6 setType:kCATransitionPush];
  id v8 = [v1 view];
  if (!v8)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  uint64_t v9 = v8;
  uint64_t v10 = self;
  id v11 = [v9 semanticContentAttribute];

  id v12 = [v10 userInterfaceLayoutDirectionForSemanticContentAttribute:v11];
  uint64_t v13 = &kCATransitionFromLeft;
  if (!v12) {
    uint64_t v13 = &kCATransitionFromRight;
  }
  [v6 setSubtype:*v13];
  id v14 = [v3 view];
  if (!v14) {
    goto LABEL_11;
  }
  uint64_t v15 = v14;
  id v16 = [v14 layer];

  [v16 addAnimation:v6 forKey:kCATransition];
  id v17 = [v3 popViewControllerAnimated:0];
}

uint64_t sub_1000E9FE8(char a1)
{
  id v2 = v1;
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for SelfServiceInstructionsViewController();
  uint64_t result = (uint64_t)[super viewDidDisappear:a1 & 1];
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_answer + 8];
  if (v5)
  {
    id v6 = *(void (**)(uint64_t, uint64_t))&v2[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onButtonPress];
    if (v6)
    {
      uint64_t v7 = *(void *)&v2[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_answer];
      swift_bridgeObjectRetain();
      sub_10003AF68((uint64_t)v6);
      v6(v7, v5);
      sub_10003B0B8((uint64_t)v6);
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  id v8 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onDismiss];
  if (v8)
  {
    uint64_t v9 = swift_retain();
    v8(v9);
    return sub_10003B0B8((uint64_t)v8);
  }
  return result;
}

id sub_1000EA198()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SelfServiceInstructionsViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SelfServiceInstructionsViewController()
{
  return self;
}

double sub_1000EA288@<D0>(_OWORD *a1@<X8>)
{
  sub_1000570EC();
  EnvironmentValues.subscript.getter();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1000EA2D8()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1000EA324()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000EA36C()
{
  uint64_t v1 = v0[4];
  objc_super v2 = (void *)(v0[2] + OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_answer);
  *objc_super v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1000E9DA4();
}

id sub_1000EA3E0()
{
  uint64_t v1 = v0;
  unint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries];
  if (!(v2 >> 62))
  {
    long long v3 = &selRef_setPriority_;
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  long long v3 = &selRef_setPriority_;
  if (v43)
  {
LABEL_3:
    sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x59524F54534948, (void *)0xE700000000000000);
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v1 v3[112] v4];
  }
LABEL_4:
  id v5 = [v1 navigationItem];
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 1162760004, (void *)0xE400000000000000);
  uint64_t v6 = type metadata accessor for HistoryTableViewController();
  uint64_t v45 = (void *)v6;
  aBlock[0] = v1;
  uint64_t v7 = v1;
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v9 = sub_100042AC8(aBlock, v6);
    uint64_t v10 = *(void *)(v6 - 8);
    __chkstk_darwin(v9);
    id v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v6);
    sub_100042B0C((uint64_t)aBlock);
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = objc_allocWithZone((Class)UIBarButtonItem);
  id v15 = [v14 initWithTitle:v8 style:2 target:v13 action:@"donePressed" aBlock[0]];

  swift_unknownObjectRelease();
  [v5 setRightBarButtonItem:v15];

  id v16 = [v7 navigationController];
  if (v16)
  {
    id v17 = v16;
    id v18 = [v16 navigationBar];

    [v18 setPrefersLargeTitles:1];
  }
  id result = [v7 view];
  if (!result)
  {
    __break(1u);
    return result;
  }
  id v20 = result;
  id v21 = self;
  id v22 = [v20 semanticContentAttribute];

  id v23 = [v21 userInterfaceLayoutDirectionForSemanticContentAttribute:v22];
  id v24 = [v7 navigationController];
  id v25 = v24;
  if (v23)
  {
    if (v24)
    {
      id v26 = [v24 navigationBar];

      [v26 setLayoutMargins:0.0, 0.0, 0.0, 14.0];
LABEL_15:
    }
  }
  else if (v24)
  {
    id v26 = [v24 navigationBar];

    [v26 setLayoutMargins:0.0, 14.0, 0.0, 0.0];
    goto LABEL_15;
  }
  id v27 = *(void **)&v7[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView];
  [v27 setDelegate:v7];
  [v27 setDataSource:v7];
  [v27 setAllowsSelection:0];
  [v27 setEstimatedRowHeight:60.0];
  [v27 setSeparatorInset:0.0, 15.0, 0.0, 0.0];
  [v27 setRowHeight:UITableViewAutomaticDimension];
  type metadata accessor for HistoryTableViewCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v29 = String._bridgeToObjectiveC()();
  [v27 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v29];

  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v30 = *(void **)&v7[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView];
  [v27 bounds];
  [v30 setFrame:];
  id v31 = [v27 backgroundColor];
  [v30 setBackgroundColor:v31];

  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x4F545349485F4F4ELL, (void *)0xEA00000000005952);
  NSString v32 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v30 v3[112] v32];

  if (*(uint64_t *)&v7[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntriesRendered] >= 1) {
    [v30 setAlpha:0.0];
  }
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v33 = [self defaultCenter];
  id v34 = *(void **)(*(void *)&v7[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_state] + 40);
  id v35 = self;
  id v36 = @"com.apple.Diagnostics.deviceStateChangedNotification";
  id v37 = v34;
  id v38 = [v35 mainQueue];
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v7;
  id v46 = sub_1000EC3C8;
  uint64_t v47 = v39;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10004FC1C;
  uint64_t v45 = &unk_100153B18;
  id v40 = _Block_copy(aBlock);
  id v41 = v7;
  swift_release();
  id v42 = [v33 addObserverForName:v36 object:v37 queue:v38 usingBlock:v40];
  _Block_release(v40);

  *(void *)&v41[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_deviceStateChangedObserver] = v42;
  return (id)swift_unknownObjectRelease();
}

void sub_1000EAB10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = Notification.userInfo.getter();
  if (v3)
  {
    uint64_t v4 = v3;
    id v10 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_10007D88C((uint64_t)v11), (v6 & 1) != 0))
    {
      sub_10003C5D8(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10003C320((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      sub_10003C374(0, &qword_100183A50);
      if (swift_dynamicCast())
      {
        if (([v10 changedProperties] & 0x20) != 0)
        {
          id v7 = [v10 snapshot];
          id v8 = [v7 history];

          sub_10003C374(0, &qword_100186210);
          uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          *(void *)(a2 + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries) = v9;
          swift_bridgeObjectRelease();
          sub_1000EBA18();
        }
      }
    }
    else
    {
      sub_10005A7D8((uint64_t)&v12);
    }
  }
}

void sub_1000EACAC()
{
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v2 = v1;
  [v1 addSubview:*(void *)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView]];

  id v3 = [v0 view];
  if (!v3)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v4 = v3;
  [v3 addSubview:*(void *)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView]];
}

void sub_1000EAD60()
{
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100124BC0;
  unint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView];
  id v3 = [v2 topAnchor];
  id v4 = [v0 view];
  if (!v4)
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v5 = v4;
  id v6 = [v4 topAnchor];

  id v7 = [v3 constraintEqualToAnchor:v6];
  *(void *)(v1 + 32) = v7;
  id v8 = [v2 bottomAnchor];
  id v9 = [v0 view];
  if (!v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v10 = v9;
  id v11 = [v9 bottomAnchor];

  id v12 = [v8 constraintEqualToAnchor:v11];
  *(void *)(v1 + 40) = v12;
  id v13 = [v2 leadingAnchor];
  id v14 = [v0 view];
  if (!v14)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v15 = v14;
  id v16 = [v14 leadingAnchor];

  id v17 = [v13 constraintEqualToAnchor:v16];
  *(void *)(v1 + 48) = v17;
  id v18 = [v2 trailingAnchor];
  id v19 = [v0 view];
  if (!v19)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v20 = v19;
  id v21 = [v19 trailingAnchor];

  id v22 = [v18 constraintEqualToAnchor:v21];
  *(void *)(v1 + 56) = v22;
  id v23 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView];
  id v24 = [v23 topAnchor];
  id v25 = [v0 view];
  if (!v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v26 = v25;
  id v27 = [v25 topAnchor];

  id v28 = [v24 constraintEqualToAnchor:v27];
  *(void *)(v1 + 64) = v28;
  id v29 = [v23 bottomAnchor];
  id v30 = [v0 view];
  if (!v30)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v31 = v30;
  id v32 = [v30 bottomAnchor];

  id v33 = [v29 constraintEqualToAnchor:v32];
  *(void *)(v1 + 72) = v33;
  id v34 = [v23 leadingAnchor];
  id v35 = [v0 view];
  if (!v35)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v36 = v35;
  id v37 = [v35 leadingAnchor];

  id v38 = [v34 constraintEqualToAnchor:v37];
  *(void *)(v1 + 80) = v38;
  id v39 = [v23 trailingAnchor];
  id v40 = [v0 view];
  if (!v40)
  {
LABEL_19:
    __break(1u);
    return;
  }
  id v41 = v40;
  id v42 = self;
  id v43 = [v41 trailingAnchor];

  id v44 = [v39 constraintEqualToAnchor:v43];
  *(void *)(v1 + 88) = v44;
  specialized Array._endMutation()();
  sub_10003C374(0, (unint64_t *)&qword_1001831A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v42 activateConstraints:isa];
}

id sub_1000EB240(char a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for HistoryTableViewController();
  id result = [super viewWillDisappear:a1 & 1];
  uint64_t v4 = OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_deviceStateChangedObserver;
  uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_deviceStateChangedObserver];
  if (v5)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    id v7 = [v6 defaultCenter];
    [v7 removeObserver:v5];

    *(void *)&v1[v4] = 0;
    swift_unknownObjectRelease();
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000EB368(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [a1 dequeueReusableCellWithIdentifier:v8];

  if (v9)
  {
    type metadata accessor for HistoryTableViewCell();
    uint64_t v10 = swift_dynamicCastClass();
    if (v10)
    {
      id v11 = (char *)v10;
      uint64_t v12 = OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries;
      unint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries);
      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (IndexPath.row.getter() < v14)
      {
        uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntriesRendered);
        uint64_t v16 = v15 - 1;
        if (__OFSUB__(v15, 1))
        {
          __break(1u);
        }
        else
        {
          uint64_t v17 = IndexPath.row.getter();
          BOOL v18 = __OFSUB__(v16, v17);
          unint64_t v19 = v16 - v17;
          if (!v18)
          {
            uint64_t v20 = *(void *)(v1 + v12);
            if ((v20 & 0xC000000000000001) == 0)
            {
              if ((v19 & 0x8000000000000000) != 0)
              {
                __break(1u);
              }
              else if (v19 < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                id v21 = *(id *)(v20 + 8 * v19 + 32);
                goto LABEL_12;
              }
              __break(1u);
              goto LABEL_30;
            }
LABEL_27:
            swift_bridgeObjectRetain();
            id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            swift_bridgeObjectRelease();
LABEL_12:
            uint64_t v22 = OBJC_IVAR____TtC11Diagnostics20HistoryTableViewCell_suiteLabel;
            id v23 = *(void **)(v2 + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView);
            id v24 = *(id *)&v11[OBJC_IVAR____TtC11Diagnostics20HistoryTableViewCell_suiteLabel];
            [v23 bounds];
            double v26 = v25;
            [v11 separatorInset];
            [v24 setPreferredMaxLayoutWidth:v26 - (v27 + v27)];

            id v28 = *(id *)&v11[v22];
            unsigned int v29 = [v21 skipped];
            uint64_t v58 = v5;
            if (v29)
            {
              sub_10003AFD0((uint64_t *)&unk_1001836E0);
              uint64_t v30 = swift_allocObject();
              *(_OWORD *)(v30 + 16) = xmmword_100123B50;
              id v31 = [v21 testSuiteName];
              uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v34 = v33;

              *(void *)(v30 + 56) = &type metadata for String;
              *(void *)(v30 + 64) = sub_10004D9B4();
              *(void *)(v30 + 32) = v32;
              *(void *)(v30 + 40) = v34;
              id v35 = (void *)v30;
              uint64_t v36 = 0x5F44455050494B53;
              id v37 = (void *)0xED00004554495553;
            }
            else
            {
              id v39 = [v21 testSuiteName];
              uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              id v42 = v41;

              id v35 = _swiftEmptyArrayStorage;
              uint64_t v36 = v40;
              id v37 = v42;
            }
            sub_100045FCC(0, 0, (uint64_t)v35, v36, v37);
            swift_bridgeObjectRelease();
            NSString v43 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            [v28 setText:v43];

            id v44 = *(void **)&v11[OBJC_IVAR____TtC11Diagnostics20HistoryTableViewCell_dateLabel];
            uint64_t v45 = self;
            id v46 = v44;
            id v47 = [v45 sharedFormatter];
            if (v47)
            {
              id v48 = v47;
              id v49 = [v47 formatterWithType:6];

              if (v49)
              {
                id v50 = [v21 date];
                static Date._unconditionallyBridgeFromObjectiveC(_:)();

                Class isa = Date._bridgeToObjectiveC()().super.isa;
                (*(void (**)(char *, uint64_t))(v58 + 8))(v7, v4);
                NSString v52 = [v49 stringFromDate:isa];

                if (!v52)
                {
                  static String._unconditionallyBridgeFromObjectiveC(_:)();
                  NSString v52 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease();
                }
                [v46 setText:v52];

                unint64_t v53 = self;
                id v54 = v9;
                id v55 = [v53 clearColor];
                [v11 setBackgroundColor:v55];

                id v56 = v54;
                [v11 setSelectionStyle:0];

                return;
              }
LABEL_31:
              __break(1u);
              return;
            }
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        __break(1u);
        goto LABEL_27;
      }
    }
  }
  id v38 = objc_allocWithZone((Class)UITableViewCell);

  [v38 init];
}

void sub_1000EBA18()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for IndexPath();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1;
  uint64_t v7 = OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntriesRendered;
  uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntriesRendered];
  uint64_t v9 = OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries;
  unint64_t v10 = *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries];
  if (v10 >> 62)
  {
LABEL_32:
    id v44 = v6;
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v6 = v44;
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v12 = *(void *)&v6[v7];
  unint64_t v13 = *(void *)&v6[v9];
  unint64_t v14 = v13 >> 62;
  if (v8 >= v11)
  {
    if (!v14)
    {
      if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v12) {
        return;
      }
      goto LABEL_19;
    }
LABEL_36:
    id v46 = v6;
    swift_bridgeObjectRetain();
    uint64_t v47 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v6 = v46;
    if (v47 >= v12) {
      return;
    }
LABEL_19:
    unint64_t v21 = *(void *)&v6[v9];
    if (!(v21 >> 62))
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      *(void *)&v6[v7] = v22;
      if (!v22) {
        goto LABEL_21;
      }
      goto LABEL_23;
    }
LABEL_40:
    id v48 = v6;
    swift_bridgeObjectRetain();
    uint64_t v49 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v6 = v48;
    *(void *)&v48[v7] = v49;
    if (!v49)
    {
LABEL_21:
      id v23 = *(void **)&v6[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView];
      id v24 = v6;
      [v23 alpha:v50, v51];
      uint64_t v6 = v24;
      if (v25 == 0.0)
      {
        uint64_t v26 = swift_allocObject();
        *(void *)(v26 + 16) = v23;
        double v27 = self;
        id v56 = sub_10003C0D4;
        uint64_t v57 = v26;
        aBlock = _NSConcreteStackBlock;
        uint64_t v53 = 1107296256;
        id v54 = sub_1000358AC;
        id v55 = &unk_100153B68;
        id v28 = _Block_copy(&aBlock);
        id v29 = v23;
        swift_retain();
        swift_release();
        [v27 animateWithDuration:0x10000 delay:v28 options:0 animations:0.375 completion:0.0];
        _Block_release(v28);
        swift_release();
        uint64_t v6 = v24;
      }
    }
LABEL_23:
    [*(id *)&v6[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView] reloadData:v50, v51];
    return;
  }
  if (!v14)
  {
    uint64_t v9 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v15 = v9 - 1;
    if (!__OFSUB__(v9, 1)) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
  uint64_t v45 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v6 = v45;
  uint64_t v15 = v9 - 1;
  if (__OFSUB__(v9, 1))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
LABEL_6:
  if (v15 < v12)
  {
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  id v50 = v6;
  uint64_t v51 = v7;
  uint64_t v16 = 0;
  uint64_t v7 = v3 + 32;
  uint64_t v8 = v12 - v9 + 1;
  uint64_t v17 = _swiftEmptyArrayStorage;
  while (1)
  {
    IndexPath.init(row:section:)();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v17 = (void *)sub_1000A01B8(0, v17[2] + 1, 1, (unint64_t)v17);
    }
    unint64_t v19 = v17[2];
    unint64_t v18 = v17[3];
    if (v19 >= v18 >> 1) {
      uint64_t v17 = (void *)sub_1000A01B8(v18 > 1, v19 + 1, 1, (unint64_t)v17);
    }
    void v17[2] = v19 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))((unint64_t)v17+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v19, v5, v2);
    uint64_t v9 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    if (!(v8 + v16)) {
      break;
    }
    uint64_t v20 = v12 + v16++;
    if (__OFADD__(v20, 1)) {
      goto LABEL_31;
    }
  }
  uint64_t v30 = v50;
  uint64_t v6 = (char *)v51;
  uint64_t v31 = *(void *)&v50[v51];
  BOOL v32 = __OFADD__(v31, v9);
  uint64_t v33 = v31 + v9;
  if (v32) {
    goto LABEL_39;
  }
  *(void *)&v50[v51] = v33;
  uint64_t v34 = *(void **)&v30[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v34 insertRowsAtIndexPaths:isa withRowAnimation:4];

  if (v9 >= 1)
  {
    uint64_t v36 = *(void **)&v30[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView];
    [v36 alpha];
    if (v37 > 0.0)
    {
      sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x59524F54534948, (void *)0xE700000000000000);
      NSString v38 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v30 setTitle:v38];

      [v36 alpha];
      if (v39 == 1.0)
      {
        uint64_t v40 = swift_allocObject();
        *(void *)(v40 + 16) = v36;
        id v41 = self;
        id v56 = sub_100042994;
        uint64_t v57 = v40;
        aBlock = _NSConcreteStackBlock;
        uint64_t v53 = 1107296256;
        id v54 = sub_1000358AC;
        id v55 = &unk_100153BB8;
        id v42 = _Block_copy(&aBlock);
        id v43 = v36;
        swift_retain();
        swift_release();
        [v41 animateWithDuration:0x20000 delay:v42 options:0 animations:0.125 completion:0.0];
        _Block_release(v42);
        swift_release();
      }
    }
  }
}

void sub_1000EC060()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView);
}

id sub_1000EC0D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HistoryTableViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for HistoryTableViewController()
{
  return self;
}

id sub_1000EC1A4(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_cellRowEstimatedHeight] = 0x404E000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_deviceStateChangedObserver] = 0;
  uint64_t v3 = OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView;
  id v4 = objc_allocWithZone((Class)UITableView);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 initWithFrame:0.0 style:0.0];
  id result = [objc_allocWithZone((Class)_UIContentUnavailableView) initWithFrame:0 title:0 style:0.0];
  if (result)
  {
    *(void *)&v5[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView] = result;
    *(void *)&v5[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_state] = a1;
    uint64_t v7 = *(void **)(a1 + 40);
    swift_retain();
    id v8 = [v7 history];
    sub_10003C374(0, &qword_100186210);
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&v5[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries] = v9;
    id v10 = [v7 history];
    unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)&v5[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntriesRendered] = v12;

    v13.receiver = v5;
    v13.super_class = (Class)type metadata accessor for HistoryTableViewController();
    return [super initWithNibName:0 bundle:0];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000EC390()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000EC3C8(uint64_t a1)
{
  sub_1000EAB10(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000EC3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000EC3E0()
{
  return swift_release();
}

void sub_1000EC3E8()
{
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_cellRowEstimatedHeight] = 0x404E000000000000;
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_deviceStateChangedObserver] = 0;
  uint64_t v1 = OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UITableView) initWithFrame:0.0 style:0.0];
  id v2 = [objc_allocWithZone((Class)_UIContentUnavailableView) initWithFrame:0 title:0 style:0.0];
  if (!v2) {
    __break(1u);
  }
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView] = v2;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void destroy for SelfServiceSuiteResultsTestView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  id v2 = *(void **)(a1 + 48);
}

uint64_t initializeWithCopy for SelfServiceSuiteResultsTestView(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

void *assignWithCopy for SelfServiceSuiteResultsTestView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[6];
  uint64_t v5 = (void *)a1[6];
  a1[6] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for SelfServiceSuiteResultsTestView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for SelfServiceSuiteResultsTestView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SelfServiceSuiteResultsTestView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)id result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SelfServiceSuiteResultsTestView()
{
  return &type metadata for SelfServiceSuiteResultsTestView;
}

uint64_t sub_1000EC8CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000EC8E8@<X0>(void *a1@<X8>)
{
  BOOL v32 = a1;
  uint64_t v2 = sub_10003AFD0(&qword_100184AB0);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = &v29[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for RoundedRectangle();
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = &v29[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v31 = static VerticalAlignment.center.getter();
  sub_1000ECC34(v1, (uint64_t)v33);
  *(_OWORD *)&v35[199] = v33[12];
  *(_OWORD *)&v35[215] = v33[13];
  *(_OWORD *)&v35[231] = v33[14];
  *(_OWORD *)&v35[135] = v33[8];
  *(_OWORD *)&v35[151] = v33[9];
  *(_OWORD *)&v35[167] = v33[10];
  *(_OWORD *)&v35[183] = v33[11];
  *(_OWORD *)&v35[71] = v33[4];
  *(_OWORD *)&v35[87] = v33[5];
  *(_OWORD *)&v35[103] = v33[6];
  *(_OWORD *)&v35[119] = v33[7];
  *(_OWORD *)&unsigned char v35[7] = v33[0];
  *(_OWORD *)&v35[23] = v33[1];
  *(_OWORD *)&v35[39] = v33[2];
  char v36 = 0;
  v35[247] = v34;
  *(_OWORD *)&v35[55] = v33[3];
  int v30 = 0;
  char v10 = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v37 = 0;
  id v19 = [self secondarySystemBackgroundColor];
  uint64_t v20 = Color.init(_:)();
  char v21 = static Edge.Set.all.getter();
  *(_OWORD *)((char *)&v38[26] + 1) = *(_OWORD *)&v35[192];
  *(_OWORD *)((char *)&v38[28] + 1) = *(_OWORD *)&v35[208];
  *(_OWORD *)((char *)&v38[30] + 1) = *(_OWORD *)&v35[224];
  *(_OWORD *)((char *)&v38[18] + 1) = *(_OWORD *)&v35[128];
  *(_OWORD *)((char *)&v38[20] + 1) = *(_OWORD *)&v35[144];
  *(_OWORD *)((char *)&v38[22] + 1) = *(_OWORD *)&v35[160];
  *(_OWORD *)((char *)&v38[24] + 1) = *(_OWORD *)&v35[176];
  *(_OWORD *)((char *)&v38[10] + 1) = *(_OWORD *)&v35[64];
  *(_OWORD *)((char *)&v38[12] + 1) = *(_OWORD *)&v35[80];
  *(_OWORD *)((char *)&v38[14] + 1) = *(_OWORD *)&v35[96];
  *(_OWORD *)((char *)&v38[16] + 1) = *(_OWORD *)&v35[112];
  *(_OWORD *)((char *)&v38[2] + 1) = *(_OWORD *)v35;
  *(_OWORD *)((char *)&v38[4] + 1) = *(_OWORD *)&v35[16];
  *(_OWORD *)((char *)&v38[6] + 1) = *(_OWORD *)&v35[32];
  v38[0] = v31;
  v38[1] = 0;
  LOBYTE(v38[2]) = v30;
  *(void *)((char *)&v38[32] + 1) = *(void *)&v35[240];
  *(_OWORD *)((char *)&v38[8] + 1) = *(_OWORD *)&v35[48];
  LOBYTE(v38[34]) = v10;
  v38[35] = v12;
  v38[36] = v14;
  v38[37] = v16;
  v38[38] = v18;
  LOBYTE(v38[39]) = v37;
  v38[40] = v20;
  LOBYTE(v38[41]) = v21;
  uint64_t v22 = v1[4];
  id v23 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v24 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v25 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v23, v24, v25);
  void *v9 = v22;
  v9[1] = v22;
  sub_1000987B4((uint64_t)v9, (uint64_t)v5);
  *(_WORD *)&v5[*(int *)(v3 + 44)] = 256;
  uint64_t v26 = sub_10003AFD0(&qword_100186248);
  double v27 = v32;
  sub_1000D778C((uint64_t)v5, (uint64_t)v32 + *(int *)(v26 + 36));
  memcpy(v27, v38, 0x149uLL);
  sub_1000EE450((uint64_t)v38);
  sub_1000EE584((uint64_t)v5);
  sub_100098974((uint64_t)v9);
  return sub_1000EE5E4((uint64_t)v38);
}

uint64_t sub_1000ECC34@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    id v59 = v4;
    sub_100090CB8(v59, (uint64_t)&v162);
    uint64_t v53 = v162;
    uint64_t v66 = v163;
    uint64_t v67 = *((void *)&v162 + 1);
    uint64_t v65 = *((void *)&v163 + 1);
    char v5 = BYTE2(v164);
    char v64 = BYTE2(v164);
    unsigned int v60 = (unsigned __int16)v164;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v61 = v156;
    uint64_t v62 = v158;
    uint64_t v56 = v161;
    uint64_t v57 = v160;
    char v63 = static Edge.Set.horizontal.getter();
    EdgeInsets.init(_all:)();
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    char v73 = v5;
    uint64_t v14 = a1[7];
    *(void *)&long long v162 = a1[6];
    *((void *)&v162 + 1) = v14;
    sub_100061B00();
    swift_bridgeObjectRetain();
    uint64_t v15 = Text.init<A>(_:)();
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    char v21 = v20 & 1;
    char v58 = static Edge.Set.trailing.getter();
    EdgeInsets.init(_all:)();
    char v54 = v157;
    char v55 = v159;
    *(void *)&long long v74 = v53;
    *((void *)&v74 + 1) = v67;
    *(void *)&long long v75 = v66;
    *((void *)&v75 + 1) = v65;
    LOWORD(v76) = v60;
    BYTE2(v76) = v73;
    *((void *)&v76 + 1) = v156;
    LOBYTE(v77) = v157;
    *((void *)&v77 + 1) = v158;
    LOBYTE(v78) = v159;
    *((void *)&v78 + 1) = v160;
    *(void *)&long long v79 = v161;
    BYTE8(v79) = v63;
    *(void *)&long long v80 = v7;
    *((void *)&v80 + 1) = v9;
    *(void *)&long long v81 = v11;
    *((void *)&v81 + 1) = v13;
    char v82 = 0;
    v83[0] = v74;
    v83[4] = v78;
    v83[3] = v77;
    v83[2] = v76;
    v83[1] = v75;
    LOBYTE(v84) = 0;
    v83[7] = v81;
    v83[6] = v80;
    v83[5] = v79;
    *((void *)&v84 + 1) = v15;
    *(void *)&long long v85 = v17;
    BYTE8(v85) = v21;
    *(void *)&long long v86 = v19;
    BYTE8(v86) = v58;
    *(void *)&long long v87 = v22;
    *((void *)&v87 + 1) = v23;
    *(void *)&long long v88 = v24;
    *((void *)&v88 + 1) = v25;
    LOBYTE(v89) = 0;
    *((void *)&v89 + 1) = swift_getKeyPath();
    char v90 = 0;
    char v105 = 0;
    long long v95 = v78;
    long long v96 = v79;
    long long v97 = v80;
    long long v98 = v81;
    long long v91 = v74;
    long long v92 = v75;
    long long v93 = v76;
    long long v94 = v77;
    long long v103 = v88;
    long long v104 = v89;
    long long v99 = v84;
    long long v100 = v85;
    long long v101 = v86;
    long long v102 = v87;
    sub_100098BAC((uint64_t)&v74, (void (*)(void, void, void, void, void, void))sub_1000823C4);
    sub_100082358(v15, v17, v21);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1000823C4(v53, v67, v66, v65, v60, v64);
    sub_100082358(v15, v17, v21);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1000824C0(v15, v17, v21);
    swift_release();
    swift_bridgeObjectRelease();
    v106[0] = v53;
    v106[1] = v67;
    v106[2] = v66;
    v106[3] = v65;
    __int16 v107 = v60;
    char v108 = v73;
    int v109 = v71;
    char v110 = v72;
    uint64_t v111 = v61;
    char v112 = v54;
    *(_DWORD *)id v113 = *(_DWORD *)v70;
    *(_DWORD *)&v113[3] = *(_DWORD *)&v70[3];
    uint64_t v114 = v62;
    char v115 = v55;
    *(_DWORD *)&v116[3] = *(_DWORD *)&v69[3];
    *(_DWORD *)id v116 = *(_DWORD *)v69;
    uint64_t v117 = v57;
    uint64_t v118 = v56;
    char v119 = v63;
    *(_DWORD *)&v120[3] = *(_DWORD *)&v68[3];
    *(_DWORD *)uint64_t v120 = *(_DWORD *)v68;
    uint64_t v121 = v7;
    uint64_t v122 = v9;
    uint64_t v123 = v11;
    uint64_t v124 = v13;
    char v125 = 0;
    sub_100098BAC((uint64_t)v106, (void (*)(void, void, void, void, void, void))sub_10008242C);
    long long v153 = v103;
    long long v154 = v104;
    LOBYTE(v155) = v105;
    long long v149 = v99;
    long long v150 = v100;
    long long v151 = v101;
    long long v152 = v102;
    long long v145 = v95;
    long long v146 = v96;
    long long v147 = v97;
    long long v148 = v98;
    long long v141 = v91;
    long long v142 = v92;
    long long v143 = v93;
    long long v144 = v94;
    sub_1000EE8CC((uint64_t)&v141);
    sub_1000D77F4((uint64_t)&v141, (uint64_t)&v162, &qword_100186250);
    sub_1000EE8D4((uint64_t)&v91);
    sub_10003AFD0(&qword_100186258);
    sub_10003AFD0(&qword_100186260);
    sub_10004F7B0(&qword_100186268, &qword_100186258);
    sub_1000EE72C();
    _ConditionalContent<>.init(storage:)();

    sub_1000EE950((uint64_t)v83);
    sub_1000824C0(v15, v17, v21);
    swift_release();
    swift_bridgeObjectRelease();
    sub_10008242C(v53, v67, v66, v65, v60, v64);
    long long v174 = v138;
    long long v175 = v139;
    __int16 v176 = v140;
    long long v170 = v134;
    long long v171 = v135;
    long long v172 = v136;
    long long v173 = v137;
    long long v166 = v130;
    long long v167 = v131;
    long long v168 = v132;
    long long v169 = v133;
    long long v162 = v126;
    long long v163 = v127;
    long long v164 = v128;
    long long v165 = v129;
  }
  else
  {
    uint64_t v26 = a1[7];
    *(void *)&long long v162 = a1[6];
    *((void *)&v162 + 1) = v26;
    sub_100061B00();
    swift_bridgeObjectRetain();
    uint64_t v27 = Text.init<A>(_:)();
    uint64_t v29 = v28;
    char v31 = v30;
    uint64_t v33 = v32;
    char v34 = static Edge.Set.horizontal.getter();
    EdgeInsets.init(_all:)();
    *(void *)&long long v141 = v27;
    *((void *)&v141 + 1) = v29;
    LOBYTE(v142) = v31 & 1;
    *((void *)&v142 + 1) = v33;
    LOBYTE(v143) = v34;
    *((void *)&v143 + 1) = v35;
    *(void *)&long long v144 = v36;
    *((void *)&v144 + 1) = v37;
    *(void *)&long long v145 = v38;
    BYTE8(v145) = 0;
    *(void *)&long long v146 = swift_getKeyPath();
    BYTE8(v146) = 0;
    sub_1000EE720((uint64_t)&v141);
    sub_1000D77F4((uint64_t)&v141, (uint64_t)&v126, &qword_100186250);
    sub_10003AFD0(&qword_100186258);
    sub_10003AFD0(&qword_100186260);
    sub_10004F7B0(&qword_100186268, &qword_100186258);
    sub_1000EE72C();
    _ConditionalContent<>.init(storage:)();
  }
  long long v39 = v173;
  long long v153 = v174;
  long long v154 = v175;
  long long v40 = v169;
  long long v41 = v170;
  long long v149 = v170;
  long long v150 = v171;
  long long v42 = v171;
  long long v43 = v172;
  long long v151 = v172;
  long long v152 = v173;
  long long v44 = v165;
  long long v45 = v166;
  long long v145 = v166;
  long long v146 = v167;
  long long v46 = v167;
  long long v47 = v168;
  long long v147 = v168;
  long long v148 = v169;
  long long v141 = v162;
  long long v142 = v163;
  long long v49 = v162;
  long long v48 = v163;
  long long v143 = v164;
  long long v144 = v165;
  long long v138 = v174;
  long long v139 = v175;
  long long v134 = v170;
  long long v135 = v171;
  long long v136 = v172;
  long long v137 = v173;
  long long v50 = v164;
  long long v130 = v166;
  long long v131 = v167;
  long long v132 = v168;
  long long v133 = v169;
  long long v126 = v162;
  long long v127 = v163;
  long long v128 = v164;
  long long v129 = v165;
  long long v51 = v175;
  *(_OWORD *)(a2 + 192) = v174;
  *(_OWORD *)(a2 + 208) = v51;
  *(_OWORD *)(a2 + 128) = v41;
  *(_OWORD *)(a2 + 144) = v42;
  *(_OWORD *)(a2 + 160) = v43;
  *(_OWORD *)(a2 + 176) = v39;
  *(_OWORD *)(a2 + 64) = v45;
  *(_OWORD *)(a2 + 80) = v46;
  *(_OWORD *)(a2 + 96) = v47;
  *(_OWORD *)(a2 + 112) = v40;
  *(_OWORD *)a2 = v49;
  *(_OWORD *)(a2 + 16) = v48;
  __int16 v155 = v176;
  __int16 v140 = v176;
  *(_WORD *)(a2 + 224) = v176;
  *(_OWORD *)(a2 + 32) = v50;
  *(_OWORD *)(a2 + 48) = v44;
  LOBYTE(v91) = 1;
  *(void *)(a2 + 232) = 0;
  *(unsigned char *)(a2 + 240) = 1;
  sub_1000EE840((uint64_t)&v126, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_1000EE4F0);
  return sub_1000EE840((uint64_t)&v141, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_1000EE684);
}

uint64_t sub_1000ED428@<X0>(void *a1@<X8>)
{
  return sub_1000EC8E8(a1);
}

uint64_t sub_1000ED464@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v98 = a1[4];
  uint64_t v101 = a1[5];
  swift_bridgeObjectRetain();
  uint64_t v100 = static Font.title.getter();
  char v97 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = (void *)a1[6];
  id v12 = [v11 result];
  __asm { FMOV            V0.2D, #20.0 }
  long long v102 = _Q0;
  if (v12)
  {
    uint64_t v18 = v12;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v92 = v20;
    uint64_t v93 = v19;

    id v21 = [v11 name];
    id v95 = v11;
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    *(void *)__src = v22;
    *(void *)&__src[8] = v24;
    sub_100061B00();
    uint64_t v25 = Text.init<A>(_:)();
    uint64_t v27 = v26;
    char v29 = v28 & 1;
    static Font.title3.getter();
    uint64_t v30 = Text.font(_:)();
    uint64_t v32 = v31;
    char v34 = v33;
    swift_release();
    char v35 = v34 & 1;
    sub_1000824C0(v25, v27, v29);
    swift_bridgeObjectRelease();
    static Font.Weight.semibold.getter();
    uint64_t v36 = Text.fontWeight(_:)();
    uint64_t v38 = v37;
    uint64_t v91 = v39;
    char v41 = v40 & 1;
    sub_1000824C0(v30, v32, v35);
    swift_bridgeObjectRelease();
    id v42 = [v95 status];
    LOBYTE(v25) = static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    char v51 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    *(_DWORD *)long long v142 = *(_DWORD *)v115;
    *(_DWORD *)&v142[3] = *(_DWORD *)&v115[3];
    *(_DWORD *)long long v148 = *(_DWORD *)v114;
    *(_DWORD *)&v148[3] = *(_DWORD *)&v114[3];
    *(_DWORD *)long long v150 = *(_DWORD *)v106;
    *(_DWORD *)&v150[3] = *(_DWORD *)&v106[3];
    DWORD1(v120) = *(_DWORD *)&v115[3];
    v104[0] = 0;
    v103[0] = 0;
    long long v116 = xmmword_100126930;
    long long v117 = v102;
    *(_DWORD *)((char *)&v120 + 1) = *(_DWORD *)v115;
    HIDWORD(v122) = *(_DWORD *)&v114[3];
    *(void *)&long long v118 = 0x4028000000000000;
    *((void *)&v118 + 1) = v42;
    *(void *)&long long v119 = v93;
    *((void *)&v119 + 1) = v92;
    LOBYTE(v120) = v25;
    *((void *)&v120 + 1) = v44;
    *(void *)&long long v121 = v46;
    *((void *)&v121 + 1) = v48;
    *(void *)&long long v122 = v50;
    BYTE8(v122) = 0;
    *(_DWORD *)((char *)&v122 + 9) = *(_DWORD *)v114;
    LOBYTE(v123) = v51;
    DWORD1(v123) = *(_DWORD *)&v106[3];
    *(_DWORD *)((char *)&v123 + 1) = *(_DWORD *)v106;
    *((void *)&v123 + 1) = v52;
    *(void *)uint64_t v124 = v53;
    *(void *)&v124[8] = v54;
    *(void *)&v124[16] = v55;
    v124[24] = 0;
    v105[0] = v41;
    *(_OWORD *)&v134[9] = *(_OWORD *)&v124[9];
    long long v133 = v123;
    *(_OWORD *)long long v134 = *(_OWORD *)v124;
    long long v132 = v122;
    long long v126 = xmmword_100126930;
    long long v127 = v102;
    long long v130 = v120;
    long long v131 = v121;
    long long v128 = v118;
    long long v129 = v119;
    LODWORD(v107[0]) = *(_DWORD *)v135;
    *(_DWORD *)((char *)v107 + 3) = *(_DWORD *)&v135[3];
    v136[0] = xmmword_100126930;
    v136[1] = v102;
    uint64_t v137 = 0x4028000000000000;
    id v138 = v42;
    uint64_t v139 = v93;
    uint64_t v140 = v92;
    char v141 = v25;
    uint64_t v143 = v44;
    uint64_t v144 = v46;
    uint64_t v145 = v48;
    uint64_t v146 = v50;
    char v147 = 0;
    char v149 = v51;
    uint64_t v151 = v52;
    uint64_t v152 = v53;
    uint64_t v153 = v54;
    uint64_t v154 = v55;
    char v155 = 0;
    sub_100082358(v36, v38, v41);
    swift_bridgeObjectRetain();
    sub_1000EE114((uint64_t)&v116);
    sub_1000EE14C((uint64_t)v136);
    sub_1000824C0(v36, v38, v41);
    swift_bridgeObjectRelease();
    *(void *)__src = v36;
    *(void *)&__src[8] = v38;
    __src[16] = v41;
    *(_DWORD *)&__src[17] = v107[0];
    *(_DWORD *)&__src[20] = *(_DWORD *)((char *)v107 + 3);
    *(void *)&__src[24] = v91;
    *(_OWORD *)&__src[128] = v132;
    *(_OWORD *)&__src[144] = v133;
    *(_OWORD *)&__src[160] = *(_OWORD *)v134;
    *(_OWORD *)&__src[169] = *(_OWORD *)&v134[9];
    uint64_t v11 = v95;
    *(_OWORD *)&__src[64] = v128;
    *(_OWORD *)&__src[80] = v129;
    *(_OWORD *)&__src[96] = v130;
    *(_OWORD *)&__src[112] = v131;
    *(_OWORD *)&__src[32] = v126;
    *(_OWORD *)&__src[48] = v127;
    Int.id.getter(__src);
  }
  else
  {
    sub_1000EDF0C(__src);
  }
  sub_1000D77F4((uint64_t)__src, (uint64_t)v156, &qword_100186218);
  id v56 = [v11 testDescription];
  if (v56)
  {
    uint64_t v57 = v56;
    id v96 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v94 = v58;

    *(void *)__src = sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0x48545F54554F4241, (void *)0xEF545345545F5349);
    *(void *)&__src[8] = v59;
    sub_100061B00();
    uint64_t v60 = Text.init<A>(_:)();
    uint64_t v62 = v61;
    char v64 = v63 & 1;
    static Font.title3.getter();
    uint64_t v65 = Text.font(_:)();
    uint64_t v67 = v66;
    char v69 = v68;
    swift_release();
    char v70 = v69 & 1;
    sub_1000824C0(v60, v62, v64);
    swift_bridgeObjectRelease();
    static Font.Weight.semibold.getter();
    uint64_t v71 = Text.fontWeight(_:)();
    uint64_t v73 = v72;
    uint64_t v75 = v74;
    char v77 = v76 & 1;
    sub_1000824C0(v65, v67, v70);
    swift_bridgeObjectRelease();
    LOBYTE(v65) = static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
    uint64_t v79 = v78;
    uint64_t v81 = v80;
    uint64_t v83 = v82;
    uint64_t v85 = v84;
    LOBYTE(v60) = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    *(_DWORD *)((char *)&v130 + 1) = *(_DWORD *)v105;
    DWORD1(v130) = *(_DWORD *)&v105[3];
    *(_DWORD *)((char *)&v132 + 9) = *(_DWORD *)v104;
    HIDWORD(v132) = *(_DWORD *)&v104[3];
    *(_DWORD *)((char *)&v133 + 1) = *(_DWORD *)v103;
    DWORD1(v133) = *(_DWORD *)&v103[3];
    v107[0] = xmmword_100126930;
    v107[1] = v102;
    DWORD1(v109) = *(_DWORD *)&v105[3];
    v107[2] = 0x4028000000000000uLL;
    *(void *)&long long v108 = v96;
    *((void *)&v108 + 1) = v94;
    LOBYTE(v109) = v65;
    *(_DWORD *)((char *)&v109 + 1) = *(_DWORD *)v105;
    *((void *)&v109 + 1) = v79;
    *(void *)&long long v110 = v81;
    *((void *)&v110 + 1) = v83;
    *(void *)&long long v111 = v85;
    BYTE8(v111) = 0;
    HIDWORD(v111) = *(_DWORD *)&v104[3];
    *(_DWORD *)((char *)&v111 + 9) = *(_DWORD *)v104;
    LOBYTE(v112) = v60;
    DWORD1(v112) = *(_DWORD *)&v103[3];
    *(_DWORD *)((char *)&v112 + 1) = *(_DWORD *)v103;
    *((void *)&v112 + 1) = v86;
    *(void *)id v113 = v87;
    *(void *)&v113[8] = v88;
    *(void *)&v113[16] = v89;
    v113[24] = 0;
    *(_OWORD *)&v124[9] = *(_OWORD *)&v113[9];
    long long v123 = v112;
    *(_OWORD *)uint64_t v124 = *(_OWORD *)v113;
    long long v121 = v110;
    long long v122 = v111;
    long long v116 = xmmword_100126930;
    long long v117 = v102;
    long long v119 = v108;
    long long v120 = v109;
    long long v118 = 0x4028000000000000uLL;
    *(_DWORD *)long long v135 = *(_DWORD *)v114;
    *(_DWORD *)&v135[3] = *(_DWORD *)&v114[3];
    *(_DWORD *)char v115 = *(_DWORD *)v106;
    *(_DWORD *)&v115[3] = *(_DWORD *)&v106[3];
    long long v126 = xmmword_100126930;
    long long v127 = v102;
    long long v128 = 0x4028000000000000uLL;
    *(void *)&long long v129 = v96;
    *((void *)&v129 + 1) = v94;
    LOBYTE(v130) = v65;
    *((void *)&v130 + 1) = v79;
    *(void *)&long long v131 = v81;
    *((void *)&v131 + 1) = v83;
    *(void *)&long long v132 = v85;
    BYTE8(v132) = 0;
    LOBYTE(v133) = v60;
    *((void *)&v133 + 1) = v86;
    *(void *)long long v134 = v87;
    *(void *)&v134[8] = v88;
    *(void *)&v134[16] = v89;
    v134[24] = 0;
    sub_100082358(v71, v73, v77);
    swift_bridgeObjectRetain();
    sub_1000EE114((uint64_t)v107);
    sub_1000EE14C((uint64_t)&v126);
    sub_1000824C0(v71, v73, v77);
    swift_bridgeObjectRelease();
    *(void *)__src = v71;
    *(void *)&__src[8] = v73;
    __src[16] = v77;
    *(_DWORD *)&__src[17] = *(_DWORD *)v135;
    *(_DWORD *)&__src[20] = *(_DWORD *)&v135[3];
    *(void *)&__src[24] = v75;
    *(_OWORD *)&__src[128] = v122;
    *(_OWORD *)&__src[144] = v123;
    *(_OWORD *)&__src[160] = *(_OWORD *)v124;
    *(_OWORD *)&__src[169] = *(_OWORD *)&v124[9];
    *(_OWORD *)&__src[64] = v118;
    *(_OWORD *)&__src[80] = v119;
    *(_OWORD *)&__src[96] = v120;
    *(_OWORD *)&__src[112] = v121;
    *(_OWORD *)&__src[32] = v116;
    *(_OWORD *)&__src[48] = v117;
    *(_DWORD *)&__src[185] = *(_DWORD *)v115;
    *(_DWORD *)&__src[188] = *(_DWORD *)&v115[3];
    *(void *)&__src[192] = 0;
    __src[200] = 1;
    Int.id.getter(__src);
  }
  else
  {
    sub_1000EDF30(__src);
  }
  sub_1000D77F4((uint64_t)__src, (uint64_t)v136, &qword_100186220);
  sub_1000D77F4((uint64_t)v156, (uint64_t)v114, &qword_100186218);
  sub_1000D77F4((uint64_t)v136, (uint64_t)v107, &qword_100186220);
  sub_1000D77F4((uint64_t)v114, (uint64_t)v115, &qword_100186218);
  sub_1000D77F4((uint64_t)v107, (uint64_t)&v116, &qword_100186220);
  *(void *)__src = v98;
  *(void *)&__src[8] = v101;
  *(void *)&__src[16] = v100;
  __src[24] = v97;
  *(void *)&__src[32] = v4;
  *(void *)&__src[40] = v6;
  *(void *)&__src[48] = v8;
  *(void *)&__src[56] = v10;
  __src[64] = 0;
  sub_1000D77F4((uint64_t)v115, (uint64_t)&__src[72], &qword_100186218);
  sub_1000D77F4((uint64_t)&v116, (uint64_t)&__src[264], &qword_100186220);
  memcpy(a2, __src, 0x1D1uLL);
  sub_1000D77F4((uint64_t)v107, (uint64_t)&v126, &qword_100186220);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000EE098((uint64_t)v115, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000EDF54);
  sub_1000EDFB4((uint64_t)&v116, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000EDF54);
  sub_1000EDFB4((uint64_t)&v126, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000EE030);
  sub_1000D77F4((uint64_t)v114, (uint64_t)v135, &qword_100186218);
  sub_1000EE098((uint64_t)v135, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000EE030);
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_1000EDE24@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v15[0] = *(_OWORD *)v1;
  v15[1] = v3;
  v15[2] = *(_OWORD *)(v1 + 32);
  uint64_t v16 = *(void *)(v1 + 48);
  uint64_t v4 = static HorizontalAlignment.leading.getter();
  sub_1000ED464(v15, __src);
  v18[472] = 1;
  memcpy(&v18[7], __src, 0x1D1uLL);
  char v5 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  char v19 = 0;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  id result = memcpy((void *)(a1 + 17), v18, 0x1D8uLL);
  *(unsigned char *)(a1 + 496) = v5;
  *(void *)(a1 + 504) = v7;
  *(void *)(a1 + 512) = v9;
  *(void *)(a1 + 520) = v11;
  *(void *)(a1 + 528) = v13;
  *(unsigned char *)(a1 + 536) = v19;
  return result;
}

double sub_1000EDF0C(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 169) = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

double sub_1000EDF30(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 185) = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_1000EDF54(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a4)
  {
    sub_100082358(result, a2, a3 & 1);
    id v10 = a10;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000EDFB4(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 200);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    v4);
  return a1;
}

void sub_1000EE030(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a4)
  {
    sub_1000824C0(a1, a2, a3 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000EE098(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 184);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    v4);
  return a1;
}

uint64_t sub_1000EE114(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000EE14C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t destroy for SelfServiceSuiteResultsInfoView(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SelfServiceSuiteResultsInfoView(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  char v4 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  id v6 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SelfServiceSuiteResultsInfoView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  char v4 = (void *)a1[5];
  uint64_t v5 = (void *)a2[5];
  a1[5] = v5;
  id v6 = v5;

  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SelfServiceSuiteResultsInfoView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SelfServiceSuiteResultsInfoView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SelfServiceSuiteResultsInfoView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SelfServiceSuiteResultsInfoView()
{
  return &type metadata for SelfServiceSuiteResultsInfoView;
}

unint64_t sub_1000EE394()
{
  unint64_t result = qword_100186228;
  if (!qword_100186228)
  {
    sub_10003B070(&qword_100186230);
    sub_10004F7B0(&qword_100186238, &qword_100186240);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100186228);
  }
  return result;
}

uint64_t sub_1000EE434()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000EE450(uint64_t a1)
{
  sub_1000EE4F0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    *(void *)(a1 + 240),
    *(unsigned char *)(a1 + 248),
    *(unsigned char *)(a1 + 249));
  swift_retain();
  return a1;
}

uint64_t sub_1000EE4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,char a30)
{
  if (a30)
  {
    sub_100082358(a1, a2, a3 & 1);
  }
  else
  {
    sub_1000823C4(a1, a2, a3, a4, a5, BYTE2(a5) & 1);
    sub_100082358(a18, a19, a20 & 1);
  }
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_1000EE584(uint64_t a1)
{
  uint64_t v2 = sub_10003AFD0(&qword_100184AB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000EE5E4(uint64_t a1)
{
  sub_1000EE684(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    *(void *)(a1 + 240),
    *(unsigned char *)(a1 + 248),
    *(unsigned char *)(a1 + 249));
  swift_release();
  return a1;
}

uint64_t sub_1000EE684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,char a30)
{
  if (a30)
  {
    sub_1000824C0(a1, a2, a3 & 1);
  }
  else
  {
    sub_10008242C(a1, a2, a3, a4, a5, BYTE2(a5) & 1);
    sub_1000824C0(a18, a19, a20 & 1);
  }
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000EE720(uint64_t result)
{
  *(unsigned char *)(result + 225) = 1;
  return result;
}

unint64_t sub_1000EE72C()
{
  unint64_t result = qword_100186270;
  if (!qword_100186270)
  {
    sub_10003B070(&qword_100186260);
    sub_1000EE7CC();
    sub_10004F7B0(&qword_100186288, &qword_100186290);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100186270);
  }
  return result;
}

unint64_t sub_1000EE7CC()
{
  unint64_t result = qword_100186278;
  if (!qword_100186278)
  {
    sub_10003B070(&qword_100186280);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100186278);
  }
  return result;
}

uint64_t sub_1000EE840(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(_WORD *)(a1 + 224));
  return a1;
}

uint64_t sub_1000EE8CC(uint64_t result)
{
  *(unsigned char *)(result + 225) = 0;
  return result;
}

uint64_t sub_1000EE8D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t v3 = *(void *)(a1 + 144);
  char v4 = *(unsigned char *)(a1 + 152);
  sub_1000823C4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int16 *)(a1 + 32), *(unsigned char *)(a1 + 34));
  sub_100082358(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1000EE950(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t v3 = *(void *)(a1 + 144);
  char v4 = *(unsigned char *)(a1 + 152);
  sub_10008242C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int16 *)(a1 + 32), *(unsigned char *)(a1 + 34));
  sub_1000824C0(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1000EE9D0()
{
  unint64_t result = qword_100186298;
  if (!qword_100186298)
  {
    sub_10003B070(&qword_100186248);
    sub_1000EEA70();
    sub_10004F7B0(&qword_100184B08, &qword_100184AB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100186298);
  }
  return result;
}

unint64_t sub_1000EEA70()
{
  unint64_t result = qword_1001862A0;
  if (!qword_1001862A0)
  {
    sub_10003B070(&qword_1001862A8);
    sub_1000EEB10();
    sub_10004F7B0(&qword_100184AF8, &qword_100184B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001862A0);
  }
  return result;
}

unint64_t sub_1000EEB10()
{
  unint64_t result = qword_1001862B0;
  if (!qword_1001862B0)
  {
    sub_10003B070(&qword_1001862B8);
    sub_10004F7B0(&qword_1001862C0, &qword_1001862C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001862B0);
  }
  return result;
}

id sub_1000EEBB0(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_10003AFD0((uint64_t *)&unk_1001864E0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for UIButton.Configuration();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v30 - v17;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_textSize] = 0x4028000000000000;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonTextSize] = 0x402E000000000000;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonWidthHeight] = 0x4036000000000000;
  *(void *)&v4[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_horizontalSpacing] = 0x4020000000000000;
  v4[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_showsButton] = 0;
  char v19 = &v4[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonAction];
  *char v19 = 0;
  v19[1] = 0;
  uint64_t v20 = &v4[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_text];
  void *v20 = 0;
  v20[1] = 0;
  uint64_t v21 = OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label;
  id v22 = objc_allocWithZone((Class)UILabel);
  uint64_t v23 = v4;
  *(void *)&v4[v21] = [v22 init];
  id v24 = [self systemFontOfSize:15.0 weight:UIFontWeightMedium];
  static UIButton.Configuration.plain()();
  *(void *)(swift_allocObject() + 16) = v24;
  id v25 = v24;
  UIConfigurationTextAttributesTransformer.init(_:)();
  uint64_t v26 = type metadata accessor for UIConfigurationTextAttributesTransformer();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v11, 0, 1, v26);
  UIButton.Configuration.titleTextAttributesTransformer.setter();

  sub_10003C374(0, &qword_100182E70);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  *(void *)&v23[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button] = UIButton.init(configuration:primaryAction:)();

  uint64_t v27 = (objc_class *)type metadata accessor for DashboardSectionHeaderView();
  v30.receiver = v23;
  v30.super_class = v27;
  id v28 = [super initWithFrame:a1, a2, a3, a4];
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  return v28;
}

id sub_1000EEF28(void *a1)
{
  uint64_t v3 = sub_10003AFD0((uint64_t *)&unk_1001864E0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UIButton.Configuration();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v26 - v11;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_textSize] = 0x4028000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonTextSize] = 0x402E000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonWidthHeight] = 0x4036000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_horizontalSpacing] = 0x4020000000000000;
  v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_showsButton] = 0;
  uint64_t v13 = &v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonAction];
  *uint64_t v13 = 0;
  v13[1] = 0;
  uint64_t v14 = &v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_text];
  *uint64_t v14 = 0;
  v14[1] = 0;
  uint64_t v15 = OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label;
  id v16 = objc_allocWithZone((Class)UILabel);
  uint64_t v17 = v1;
  *(void *)&v1[v15] = [v16 init];
  id v18 = [self systemFontOfSize:15.0 weight:UIFontWeightMedium];
  static UIButton.Configuration.plain()();
  *(void *)(swift_allocObject() + 16) = v18;
  id v19 = v18;
  UIConfigurationTextAttributesTransformer.init(_:)();
  uint64_t v20 = type metadata accessor for UIConfigurationTextAttributesTransformer();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 0, 1, v20);
  UIButton.Configuration.titleTextAttributesTransformer.setter();

  sub_10003C374(0, &qword_100182E70);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  *(void *)&v17[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button] = UIButton.init(configuration:primaryAction:)();

  uint64_t v21 = (objc_class *)type metadata accessor for DashboardSectionHeaderView();
  v26.receiver = v17;
  v26.super_class = v21;
  [super initWithCoder:a1];

  uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
  id v24 = v22;
  v23(v12, v6);
  if (v24) {

  }
  return v24;
}

id sub_1000EF290()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10003AFD0(&qword_100186340);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v23 - v6;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label];
  uint64_t v9 = self;
  id v10 = [v9 grayColor];
  [v8 setTextColor:v10];

  id v11 = [self defaultMetrics];
  id v12 = [self systemFontOfSize:12.0];
  id v13 = [v11 scaledFontForFont:v12];

  [v8 setFont:v13];
  [v8 setAlpha:0.0];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button];
  NSString v15 = String._bridgeToObjectiveC()();
  [v14 setTitle:v15 forState:0];

  id v16 = [v9 clearColor];
  [v14 setBackgroundColor:v16];

  UIButton.configuration.getter();
  uint64_t v17 = type metadata accessor for UIButton.Configuration();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v7, 1, v17))
  {
    sub_1000F0174((uint64_t)v7, (uint64_t)v5);
    UIButton.configuration.setter();
    sub_1000F01DC((uint64_t)v7);
  }
  else
  {
    UIButton.Configuration.contentInsets.setter();
    UIButton.configuration.setter();
  }
  [v14 setAlpha:0.0];
  id v18 = [v14 layer];
  [v18 setBorderWidth:1.25];

  id v19 = [v14 layer];
  id result = [v1 tintColor];
  if (result)
  {
    uint64_t v21 = result;
    id v22 = [result CGColor];

    [v19 setBorderColor:v22];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 addTarget:v1 action:"buttonPressedWithSender:" forControlEvents:64];
    [v14 addTarget:v1 action:"buttonDownWithSender:" forControlEvents:1];
    [v14 addTarget:v1 action:"buttonDownWithSender:" forControlEvents:16];
    [v14 addTarget:v1 action:"buttonUpWithSender:" forControlEvents:32];
    return [v14 addTarget:v1 action:"buttonUpWithSender:" forControlEvents:256];
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000EF68C()
{
  [v0 addSubview:*(void *)&v0[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label]];
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button];

  return [v0 addSubview:v1];
}

void sub_1000EF6E8()
{
  uint64_t v1 = v0;
  uint64_t v36 = self;
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100124BC0;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label];
  id v4 = [v3 topAnchor];
  id v5 = [v1 topAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];

  *(void *)(v2 + 32) = v6;
  id v7 = [v3 bottomAnchor];
  id v8 = [v1 bottomAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8 constant:-9.0];

  *(void *)(v2 + 40) = v9;
  id v10 = [v3 leadingAnchor];
  id v11 = [v1 leadingAnchor];
  id v12 = self;
  id v13 = [v12 sharedApplication];
  sub_100046500();
  double v15 = v14;

  sub_100086DB4();
  id v17 = [v10 constraintEqualToAnchor:v11 constant:(v15 - v16) * 0.5];

  *(void *)(v2 + 48) = v17;
  id v18 = [v3 trailingAnchor];
  id v19 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button];
  id v20 = [v19 leadingAnchor];
  id v21 = [v18 constraintEqualToAnchor:v20 constant:8.0];

  *(void *)(v2 + 56) = v21;
  id v22 = [v19 trailingAnchor];
  id v23 = [v1 trailingAnchor];
  id v24 = [v12 sharedApplication];
  sub_100046500();
  double v26 = v25;

  sub_100086DB4();
  id v28 = [v22 constraintEqualToAnchor:v23 constant:(v26 - v27) * -0.5];

  *(void *)(v2 + 64) = v28;
  id v29 = [v19 centerYAnchor];
  id v30 = [v3 centerYAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  *(void *)(v2 + 72) = v31;
  id v32 = [v19 widthAnchor];
  id v33 = [v32 constraintEqualToConstant:22.0];

  *(void *)(v2 + 80) = v33;
  id v34 = [v19 heightAnchor];
  id v35 = [v34 constraintEqualToConstant:22.0];

  *(void *)(v2 + 88) = v35;
  specialized Array._endMutation()();
  sub_10003C374(0, (unint64_t *)&qword_1001831A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v36 activateConstraints:isa];
}

void sub_1000EFE10(uint64_t a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self animationWithKeyPath:v3];

  id v5 = *(void **)(v1 + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button);
  id v6 = [v5 layer];
  id v7 = [v6 borderColor];

  [v4 setFromValue:v7];
  [v4 setToValue:a1];
  [v4 setDuration:0.333];
  id v8 = [v5 layer];
  [v8 setBorderColor:a1];

  id v9 = [v5 layer];
  id v10 = String._bridgeToObjectiveC()();
  [v9 addAnimation:v4 forKey:v10];
}

id sub_1000EFFC0(uint64_t a1)
{
  id result = [*(id *)(a1 + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label) setAlpha:1.0];
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_showsButton) == 1)
  {
    NSString v3 = *(void **)(a1 + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button);
    return [v3 setAlpha:1.0];
  }
  return result;
}

void sub_1000F0040()
{
  sub_10003B0B8(*(void *)(v0 + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonAction));
  swift_bridgeObjectRelease();

  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button);
}

id sub_1000F00A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DashboardSectionHeaderView();
  return [super dealloc];
}

uint64_t type metadata accessor for DashboardSectionHeaderView()
{
  return self;
}

uint64_t sub_1000F0174(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003AFD0(&qword_100186340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000F01DC(uint64_t a1)
{
  uint64_t v2 = sub_10003AFD0(&qword_100186340);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000F023C()
{
  uint64_t v1 = *(void (**)(uint64_t))&v0[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonAction];
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_10003B0B8((uint64_t)v1);
  }
  id v3 = [v0 tintColor];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [v3 CGColor];

    sub_1000EFE10((uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000F0300()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t destroy for DeviceType(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s11Diagnostics10DeviceTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for DeviceType(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DeviceType(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF6 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483639);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 8;
  if (v4 >= 0xA) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DeviceType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF7)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483639;
    if (a3 >= 0x7FFFFFF7) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF7) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 8;
    }
  }
  return result;
}

uint64_t sub_1000F0554(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1000F056C(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceType()
{
  return &type metadata for DeviceType;
}

Swift::Int sub_1000F059C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 9) {
    String.hash(into:)();
  }
  else {
    Hasher._combine(_:)(qword_100126B20[a2]);
  }
  return Hasher._finalize()();
}

Swift::Int sub_1000F060C()
{
  return sub_1000F059C(*(void *)v0, *(void *)(v0 + 8));
}

void sub_1000F0614()
{
  unint64_t v1 = *(void *)(v0 + 8);
  if (v1 >= 9)
  {
    String.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(qword_100126B20[v1]);
  }
}

Swift::Int sub_1000F0678()
{
  unint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  if (v1 >= 9) {
    String.hash(into:)();
  }
  else {
    Hasher._combine(_:)(qword_100126B20[v1]);
  }
  return Hasher._finalize()();
}

BOOL sub_1000F06E8(uint64_t a1, uint64_t a2)
{
  return sub_1000F0754(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8));
}

unint64_t sub_1000F0700()
{
  unint64_t result = qword_100186348;
  if (!qword_100186348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100186348);
  }
  return result;
}

BOOL sub_1000F0754(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  Hasher.init(_seed:)();
  if (a2 >= 9) {
    String.hash(into:)();
  }
  else {
    Hasher._combine(_:)(qword_100126B20[a2]);
  }
  Swift::Int v6 = Hasher._finalize()();
  Hasher.init(_seed:)();
  if (a4 >= 9) {
    String.hash(into:)();
  }
  else {
    Hasher._combine(_:)(qword_100126B20[a4]);
  }
  return v6 == Hasher._finalize()();
}

uint64_t destroy for PromptAction(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for PromptAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  unsigned int v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PromptAction(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unsigned int v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PromptAction(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PromptAction(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  unsigned int v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PromptAction(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PromptAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PromptAction()
{
  return &type metadata for PromptAction;
}

uint64_t sub_1000F0A60(uint64_t a1)
{
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v3 = 0;
  int64_t v4 = 0;
  uint64_t v23 = result;
  uint64_t v21 = a1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v8 = (unint64_t)(63 - v5) >> 6;
  while (1)
  {
    if (v3)
    {
      unint64_t v12 = *(void *)(v3 + 16);
      if (v12)
      {
        unint64_t v13 = 0;
        double v14 = (Swift::Int *)(v3 + 40);
        while (v13 < v12)
        {
          ++v13;
          Swift::Int v16 = *(v14 - 1);
          Swift::Int v15 = *v14;
          swift_bridgeObjectRetain();
          sub_1000B98F0(&v22, v16, v15);
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v12 = *(void *)(v3 + 16);
          v14 += 2;
          if (v13 == v12) {
            goto LABEL_12;
          }
        }
        __break(1u);
LABEL_34:
        sub_100046948();
        swift_bridgeObjectRelease();
        return v23;
      }
    }
LABEL_12:
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_6;
    }
    int64_t v17 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v17 >= v8) {
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v21 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v10 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v4 = v17;
LABEL_6:
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v11;
  }
  int64_t v19 = v4 + 2;
  if (v4 + 2 >= v8) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v21 + 8 * v19);
  if (v18) {
    goto LABEL_18;
  }
  int64_t v20 = v4 + 3;
  if (v4 + 3 >= v8) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v21 + 8 * v20);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v4 + 4;
  if (v4 + 4 >= v8) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v21 + 8 * v19);
  if (v18) {
    goto LABEL_18;
  }
  int64_t v20 = v4 + 5;
  if (v4 + 5 >= v8) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v21 + 8 * v20);
  if (v18)
  {
LABEL_21:
    int64_t v17 = v20;
    goto LABEL_22;
  }
  int64_t v19 = v4 + 6;
  if (v4 + 6 >= v8) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v21 + 8 * v19);
  if (v18)
  {
LABEL_18:
    int64_t v17 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v8) {
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v21 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

void sub_1000F0D88()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_10003AFD0((uint64_t *)&unk_1001864E0);
  __chkstk_darwin(v2 - 8);
  int64_t v4 = (char *)&v184 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UIButton.Configuration();
  uint64_t v188 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v192 = (char *)&v184 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v193 = (char *)&v184 - v8;
  id v9 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v0 action:"handleTapOutside:"];
  id v10 = [v0 view];
  if (!v10)
  {
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v11 = v10;
  [v10 addGestureRecognizer:v9];

  id v12 = [objc_allocWithZone((Class)UIScrollView) init];
  uint64_t v13 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView;
  double v14 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView];
  *(void *)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView] = v12;

  Swift::Int v15 = *(void **)&v0[v13];
  if (!v15)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  [v15 setContentInset:10.0, 20.0, 10.0, 20.0];
  id v16 = [v0 view];
  if (!v16)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (!*(void *)&v0[v13])
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  int64_t v17 = v16;
  uint64_t v189 = v5;
  [v16 addSubview:];

  id v18 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v19 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel;
  int64_t v20 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel] = v18;

  uint64_t v21 = *(void **)&v1[v19];
  if (!v21)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  uint64_t v187 = v4;
  id v22 = v21;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001CLL, (void *)0x8000000100131110);
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v22 setText:v23];

  id v24 = *(void **)&v1[v19];
  if (!v24)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  double v25 = self;
  id v26 = v24;
  id v27 = [v25 defaultMetrics];
  id v28 = self;
  id v29 = [v28 systemFontOfSize:18.0 weight:UIFontWeightRegular];
  id v30 = [v27 scaledFontForFont:v29];

  [v26 setFont:v30];
  id v31 = *(void **)&v1[v19];
  if (!v31)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  [v31 sizeToFit];
  id v32 = *(void **)&v1[v19];
  if (!v32)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  [v32 setNumberOfLines:2];
  id v33 = *(void **)&v1[v19];
  if (!v33)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  [v33 setAdjustsFontSizeToFitWidth:1];
  id v34 = *(void **)&v1[v13];
  if (!v34)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (!*(void *)&v1[v19])
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  [v34 addSubview:];
  id v35 = [objc_allocWithZone((Class)ELSConsentSignatureView) init];
  uint64_t v36 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView;
  uint64_t v37 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView] = v35;

  uint64_t v38 = *(void **)&v1[v13];
  if (!v38)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  id v185 = v9;
  if (!*(void *)&v1[v36])
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  [v38 addSubview:];
  id v39 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v40 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel;
  char v41 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel] = v39;

  id v42 = *(void **)&v1[v40];
  if (!v42)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  id v43 = v42;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001DLL, (void *)0x8000000100131130);
  NSString v44 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v43 setText:v44];

  uint64_t v45 = *(void **)&v1[v40];
  if (!v45)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  [v45 setTextAlignment:1];
  uint64_t v46 = *(void **)&v1[v40];
  if (!v46)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  uint64_t v186 = 0xD00000000000001DLL;
  uint64_t v47 = self;
  id v48 = v46;
  id v190 = v47;
  id v49 = [v47 systemBackgroundColor];
  [v48 setBackgroundColor:v49];

  uint64_t v50 = *(void **)&v1[v40];
  if (!v50)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  id v51 = v50;
  id v52 = [v25 defaultMetrics];
  id v53 = [v28 systemFontOfSize:32.0 weight:UIFontWeightBold];
  id v54 = [v52 scaledFontForFont:v53];

  [v51 setFont:v54];
  uint64_t v55 = *(void **)&v1[v40];
  if (!v55)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  [v55 sizeToFit];
  id v56 = *(void **)&v1[v40];
  if (!v56)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  [v56 setAdjustsFontSizeToFitWidth:1];
  uint64_t v57 = *(void **)&v1[v40];
  if (!v57)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  [v57 setNumberOfLines:2];
  uint64_t v58 = *(void **)&v1[v13];
  if (!v58)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  if (!*(void *)&v1[v40])
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  [v58 addSubview:];
  id v59 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v60 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel;
  uint64_t v61 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel] = v59;

  uint64_t v62 = *(void **)&v1[v60];
  if (!v62)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  id v63 = v62;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000020, (void *)0x8000000100131150);
  NSString v64 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v63 setText:v64];

  uint64_t v65 = *(void **)&v1[v60];
  if (!v65)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  id v66 = v65;
  id v67 = [v25 defaultMetrics];
  id v68 = [v28 systemFontOfSize:18.0 weight:UIFontWeightRegular];
  id v69 = [v67 scaledFontForFont:v68];

  [v66 setFont:v69];
  char v70 = *(void **)&v1[v60];
  if (!v70)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  [v70 sizeToFit];
  uint64_t v71 = *(void **)&v1[v60];
  if (!v71)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  [v71 setAdjustsFontSizeToFitWidth:1];
  uint64_t v72 = *(void **)&v1[v60];
  if (!v72)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  [v72 setTextAlignment:1];
  uint64_t v73 = *(void **)&v1[v60];
  if (!v73)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  [v73 setNumberOfLines:2];
  uint64_t v74 = *(void **)&v1[v13];
  if (!v74)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  if (!*(void *)&v1[v60])
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  [v74 addSubview:];
  id v75 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v76 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel;
  char v77 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel] = v75;

  uint64_t v78 = *(void **)&v1[v76];
  if (!v78)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  id v79 = v78;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000022, (void *)0x8000000100131180);
  NSString v80 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v79 setText:v80];

  uint64_t v81 = *(void **)&v1[v76];
  if (!v81)
  {
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  id v82 = v81;
  id v83 = [v25 defaultMetrics];
  id v84 = [v28 systemFontOfSize:18.0 weight:UIFontWeightSemibold];
  id v85 = [v83 scaledFontForFont:v84];

  [v82 setFont:v85];
  uint64_t v86 = *(void **)&v1[v76];
  if (!v86)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  [v86 sizeToFit];
  uint64_t v87 = *(void **)&v1[v76];
  if (!v87)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  [v87 setAdjustsFontSizeToFitWidth:1];
  uint64_t v88 = *(void **)&v1[v13];
  if (!v88)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  if (!*(void *)&v1[v76])
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  [v88 addSubview:];
  id v89 = [objc_allocWithZone((Class)UITextField) init];
  uint64_t v90 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField;
  uint64_t v91 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField] = v89;

  uint64_t v92 = *(void **)&v1[v90];
  if (!v92)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  id v93 = v92;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000020, (void *)0x80000001001310E0);
  NSString v94 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v93 setPlaceholder:v94];

  id v95 = *(void **)&v1[v90];
  if (!v95)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  [v95 setKeyboardType:6];
  id v96 = *(void **)&v1[v90];
  if (!v96)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  [v96 setReturnKeyType:4];
  char v97 = *(void **)&v1[v90];
  if (!v97)
  {
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  [v97 setDelegate:v1];
  uint64_t v191 = v13;
  uint64_t v98 = *(void **)&v1[v13];
  if (!v98)
  {
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  if (!*(void *)&v1[v90])
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  [v98 addSubview:];
  id v99 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v100 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel;
  uint64_t v101 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel] = v99;

  long long v102 = *(void **)&v1[v100];
  if (!v102)
  {
LABEL_117:
    __break(1u);
    goto LABEL_118;
  }
  id v103 = v102;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000021, (void *)0x80000001001311B0);
  NSString v104 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v103 setText:v104];

  char v105 = *(void **)&v1[v100];
  if (!v105)
  {
LABEL_118:
    __break(1u);
    goto LABEL_119;
  }
  id v106 = v105;
  id v107 = [v25 defaultMetrics];
  id v108 = [v28 systemFontOfSize:18.0 weight:UIFontWeightSemibold];
  id v109 = [v107 scaledFontForFont:v108];

  [v106 setFont:v109];
  long long v110 = *(void **)&v1[v100];
  if (!v110)
  {
LABEL_119:
    __break(1u);
    goto LABEL_120;
  }
  [v110 sizeToFit];
  long long v111 = *(void **)&v1[v100];
  if (!v111)
  {
LABEL_120:
    __break(1u);
    goto LABEL_121;
  }
  [v111 setAdjustsFontSizeToFitWidth:1];
  long long v112 = *(void **)&v1[v191];
  if (!v112)
  {
LABEL_121:
    __break(1u);
    goto LABEL_122;
  }
  if (!*(void *)&v1[v100])
  {
LABEL_122:
    __break(1u);
    goto LABEL_123;
  }
  [v112 addSubview:];
  id v113 = [objc_allocWithZone((Class)UITextField) init];
  uint64_t v114 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField;
  char v115 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField] = v113;

  long long v116 = *(void **)&v1[v114];
  if (!v116)
  {
LABEL_123:
    __break(1u);
    goto LABEL_124;
  }
  id v117 = v116;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000020, (void *)0x80000001001310E0);
  NSString v118 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v117 setPlaceholder:v118];

  long long v119 = *(void **)&v1[v114];
  if (!v119)
  {
LABEL_124:
    __break(1u);
    goto LABEL_125;
  }
  [v119 setKeyboardType:6];
  long long v120 = *(void **)&v1[v114];
  uint64_t v121 = v189;
  if (!v120)
  {
LABEL_125:
    __break(1u);
    goto LABEL_126;
  }
  [v120 setReturnKeyType:9];
  long long v122 = *(void **)&v1[v114];
  if (!v122)
  {
LABEL_126:
    __break(1u);
    goto LABEL_127;
  }
  [v122 setDelegate:v1];
  long long v123 = *(void **)&v1[v191];
  if (!v123)
  {
LABEL_127:
    __break(1u);
    goto LABEL_128;
  }
  if (!*(void *)&v1[v114])
  {
LABEL_128:
    __break(1u);
    goto LABEL_129;
  }
  [v123 addSubview:];
  id v124 = [v25 defaultMetrics];
  [v28 defaultFontSize];
  id v125 = [v28 systemFontOfSize:];
  id v126 = [v124 scaledFontForFont:v125];

  long long v127 = v193;
  static UIButton.Configuration.plain()();
  *(void *)(swift_allocObject() + 16) = v126;
  id v128 = v126;
  long long v129 = v187;
  UIConfigurationTextAttributesTransformer.init(_:)();
  uint64_t v130 = type metadata accessor for UIConfigurationTextAttributesTransformer();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v130 - 8) + 56))(v129, 0, 1, v130);
  UIButton.Configuration.titleTextAttributesTransformer.setter();

  sub_10003C374(0, &qword_100182E70);
  long long v131 = *(void (**)(char *, char *, uint64_t))(v188 + 16);
  v131(v192, v127, v121);
  uint64_t v132 = UIButton.init(configuration:primaryAction:)();
  uint64_t v133 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn;
  long long v134 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn] = v132;

  long long v135 = *(void **)&v1[v133];
  if (!v135)
  {
LABEL_129:
    __break(1u);
    goto LABEL_130;
  }
  id v136 = v135;
  id v137 = [v190 systemBackgroundColor];
  [v136 setBackgroundColor:v137];

  id v138 = *(void **)&v1[v133];
  uint64_t v139 = v191;
  if (!v138)
  {
LABEL_130:
    __break(1u);
    goto LABEL_131;
  }
  id v140 = v138;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, v186, (void *)0x80000001001311E0);
  NSString v141 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v140 setTitle:v141 forState:0];

  long long v142 = *(void **)&v1[v133];
  if (!v142)
  {
LABEL_131:
    __break(1u);
    goto LABEL_132;
  }
  id v143 = objc_allocWithZone((Class)UIColor);
  id v144 = v142;
  id v145 = [v143 initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  [v144 setTitleColor:v145 forState:0];

  uint64_t v146 = *(void **)&v1[v133];
  if (!v146)
  {
LABEL_132:
    __break(1u);
    goto LABEL_133;
  }
  [v146 addTarget:v1 action:"clearSignature" forControlEvents:64];
  char v147 = *(void **)&v1[v139];
  if (!v147)
  {
LABEL_133:
    __break(1u);
    goto LABEL_134;
  }
  if (!*(void *)&v1[v133])
  {
LABEL_134:
    __break(1u);
    goto LABEL_135;
  }
  [v147 addSubview:];
  uint64_t v148 = v189;
  v131(v192, v193, v189);
  uint64_t v149 = UIButton.init(configuration:primaryAction:)();
  uint64_t v150 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn;
  uint64_t v151 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn] = v149;

  uint64_t v152 = *(void **)&v1[v150];
  if (!v152)
  {
LABEL_135:
    __break(1u);
    goto LABEL_136;
  }
  id v153 = objc_allocWithZone((Class)UIColor);
  id v154 = v152;
  id v155 = [v153 initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  [v154 setBackgroundColor:v155];

  uint64_t v156 = *(void **)&v1[v150];
  if (!v156)
  {
LABEL_136:
    __break(1u);
    goto LABEL_137;
  }
  id v157 = v156;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001FLL, (void *)0x8000000100131200);
  NSString v158 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v157 setTitle:v158 forState:0];

  char v159 = *(void **)&v1[v150];
  if (!v159)
  {
LABEL_137:
    __break(1u);
    goto LABEL_138;
  }
  id v160 = v159;
  id v161 = [v190 whiteColor];
  [v160 setTitleColor:v161 forState:0];

  long long v162 = *(void **)&v1[v150];
  if (!v162)
  {
LABEL_138:
    __break(1u);
    goto LABEL_139;
  }
  id v163 = [v162 layer];
  [v163 setCornerRadius:10.0];

  long long v164 = *(void **)&v1[v150];
  if (!v164)
  {
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  [v164 addTarget:v1 action:"generateConsentDocument" forControlEvents:64];
  id v165 = [v1 view];
  if (!v165)
  {
LABEL_140:
    __break(1u);
    goto LABEL_141;
  }
  if (!*(void *)&v1[v150])
  {
LABEL_141:
    __break(1u);
    goto LABEL_142;
  }
  long long v166 = v165;
  [v165 addSubview:];

  v131(v192, v193, v148);
  uint64_t v167 = UIButton.init(configuration:primaryAction:)();
  uint64_t v168 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn;
  long long v169 = *(void **)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn];
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn] = v167;

  long long v170 = *(void **)&v1[v168];
  if (!v170)
  {
LABEL_142:
    __break(1u);
    goto LABEL_143;
  }
  id v171 = v170;
  id v172 = [v190 systemBackgroundColor];
  [v171 setBackgroundColor:v172];

  long long v173 = *(void **)&v1[v168];
  if (!v173)
  {
LABEL_143:
    __break(1u);
    goto LABEL_144;
  }
  id v174 = v173;
  sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001ELL, (void *)0x8000000100130520);
  NSString v175 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v174 setTitle:v175 forState:0];

  __int16 v176 = *(void **)&v1[v168];
  if (!v176)
  {
LABEL_144:
    __break(1u);
    goto LABEL_145;
  }
  id v177 = objc_allocWithZone((Class)UIColor);
  id v178 = v176;
  id v179 = [v177 initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  [v178 setTitleColor:v179 forState:0];

  v180 = *(void **)&v1[v168];
  if (!v180)
  {
LABEL_145:
    __break(1u);
    goto LABEL_146;
  }
  [v180 addTarget:v1 action:"cancelConsent" forControlEvents:64];
  id v181 = [v1 view];
  if (!v181)
  {
LABEL_146:
    __break(1u);
    goto LABEL_147;
  }
  v182 = v185;
  if (*(void *)&v1[v168])
  {
    v183 = v181;
    [v181 addSubview:];

    (*(void (**)(char *, uint64_t))(v188 + 8))(v193, v148);
    return;
  }
LABEL_147:
  __break(1u);
}

void sub_1000F2218()
{
  uint64_t v1 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView];
  if (!v2)
  {
    __break(1u);
    goto LABEL_100;
  }
  uint64_t v3 = v0;
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel;
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel];
  if (!v5)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v282 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel;
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel];
  if (!v6)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel];
  if (!v8)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v279 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField;
  id v9 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField];
  if (!v9)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel;
  uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel];
  if (!v11)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v278 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField;
  id v12 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField];
  if (!v12)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v277 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel;
  uint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel];
  if (!v13)
  {
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  uint64_t v276 = v7;
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v283 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView;
  double v14 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView];
  if (!v14)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v15 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn;
  id v16 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn];
  if (!v16)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v280 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn;
  int64_t v17 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn];
  if (!v17)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v275 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn;
  id v18 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn];
  if (!v18)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  sub_10003AFD0((uint64_t *)&unk_100182E20);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_100124770;
  int64_t v20 = *(void **)&v3[v1];
  if (!v20)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  id v21 = [v20 leadingAnchor];
  id v22 = [v3 view];
  if (!v22)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  NSString v23 = v22;
  id v24 = [v22 safeAreaLayoutGuide];

  id v25 = [v24 leadingAnchor];
  id v26 = [v21 constraintEqualToAnchor:v25];

  *(void *)(v19 + 32) = v26;
  id v27 = *(void **)&v3[v1];
  if (!v27)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  id v28 = [v27 trailingAnchor];
  id v29 = [v3 view];
  if (!v29)
  {
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  id v30 = v29;
  id v31 = [v29 safeAreaLayoutGuide];

  id v32 = [v31 trailingAnchor];
  id v33 = [v28 constraintEqualToAnchor:v32];

  *(void *)(v19 + 40) = v33;
  id v34 = *(void **)&v3[v1];
  if (!v34)
  {
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  id v35 = [v34 topAnchor];
  id v36 = [v3 view];
  if (!v36)
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  uint64_t v37 = v36;
  id v38 = [v36 safeAreaLayoutGuide];

  id v39 = [v38 topAnchor];
  id v40 = [v35 constraintEqualToAnchor:v39];

  *(void *)(v19 + 48) = v40;
  char v41 = *(void **)&v3[v1];
  if (!v41)
  {
LABEL_117:
    __break(1u);
    goto LABEL_118;
  }
  id v42 = [v41 bottomAnchor];
  id v43 = *(void **)&v3[v280];
  if (!v43)
  {
LABEL_118:
    __break(1u);
    goto LABEL_119;
  }
  id v44 = [v43 topAnchor];
  id v45 = [v42 constraintEqualToAnchor:v44 constant:20.0];

  *(void *)(v19 + 56) = v45;
  uint64_t v46 = *(void **)&v3[v1];
  if (!v46)
  {
LABEL_119:
    __break(1u);
    goto LABEL_120;
  }
  uint64_t v281 = v10;
  id v47 = [v46 contentLayoutGuide];
  id v48 = [v47 widthAnchor];

  id v49 = [v3 view];
  if (!v49)
  {
LABEL_120:
    __break(1u);
    goto LABEL_121;
  }
  uint64_t v50 = v49;
  id v51 = self;
  id v52 = [v50 widthAnchor];

  id v53 = [v48 constraintEqualToAnchor:v52 constant:-40.0];
  *(void *)(v19 + 64) = v53;
  specialized Array._endMutation()();
  sub_10003C374(0, (unint64_t *)&qword_1001831A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:isa];

  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_100125510;
  id v56 = *(void **)&v3[v4];
  if (!v56)
  {
LABEL_121:
    __break(1u);
    goto LABEL_122;
  }
  id v57 = [v56 topAnchor];
  uint64_t v58 = *(void **)&v3[v1];
  if (!v58)
  {
LABEL_122:
    __break(1u);
    goto LABEL_123;
  }
  id v59 = [v58 topAnchor];
  id v60 = [v57 constraintEqualToAnchor:v59];

  *(void *)(v55 + 32) = v60;
  uint64_t v61 = *(void **)&v3[v4];
  if (!v61)
  {
LABEL_123:
    __break(1u);
    goto LABEL_124;
  }
  id v62 = [v61 leadingAnchor];
  id v63 = *(void **)&v3[v1];
  if (!v63)
  {
LABEL_124:
    __break(1u);
    goto LABEL_125;
  }
  id v64 = [v63 contentLayoutGuide];
  id v65 = [v64 leadingAnchor];

  id v66 = [v62 constraintEqualToAnchor:v65];
  *(void *)(v55 + 40) = v66;
  id v67 = *(void **)&v3[v4];
  if (!v67)
  {
LABEL_125:
    __break(1u);
    goto LABEL_126;
  }
  id v68 = [v67 trailingAnchor];
  id v69 = *(void **)&v3[v1];
  if (!v69)
  {
LABEL_126:
    __break(1u);
    goto LABEL_127;
  }
  id v70 = [v69 contentLayoutGuide];
  id v71 = [v70 trailingAnchor];

  id v72 = [v68 constraintEqualToAnchor:v71];
  *(void *)(v55 + 48) = v72;
  specialized Array._endMutation()();
  Class v73 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v73];

  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_100123C30;
  id v75 = *(void **)&v3[v282];
  if (!v75)
  {
LABEL_127:
    __break(1u);
    goto LABEL_128;
  }
  id v76 = [v75 centerXAnchor];
  char v77 = *(void **)&v3[v4];
  if (!v77)
  {
LABEL_128:
    __break(1u);
    goto LABEL_129;
  }
  id v78 = [v77 centerXAnchor];
  id v79 = [v76 constraintEqualToAnchor:v78];

  *(void *)(v74 + 32) = v79;
  NSString v80 = *(void **)&v3[v282];
  if (!v80)
  {
LABEL_129:
    __break(1u);
    goto LABEL_130;
  }
  id v81 = [v80 topAnchor];
  id v82 = *(void **)&v3[v4];
  if (!v82)
  {
LABEL_130:
    __break(1u);
    goto LABEL_131;
  }
  id v83 = [v82 bottomAnchor];
  id v84 = [v81 constraintEqualToAnchor:v83 constant:30.0];

  *(void *)(v74 + 40) = v84;
  id v85 = *(void **)&v3[v282];
  if (!v85)
  {
LABEL_131:
    __break(1u);
    goto LABEL_132;
  }
  id v86 = [v85 leadingAnchor];
  uint64_t v87 = *(void **)&v3[v1];
  if (!v87)
  {
LABEL_132:
    __break(1u);
    goto LABEL_133;
  }
  id v88 = [v87 leadingAnchor];
  id v89 = [v86 constraintEqualToAnchor:v88];

  *(void *)(v74 + 48) = v89;
  uint64_t v90 = *(void **)&v3[v282];
  if (!v90)
  {
LABEL_133:
    __break(1u);
    goto LABEL_134;
  }
  id v91 = [v90 trailingAnchor];
  uint64_t v92 = *(void **)&v3[v1];
  if (!v92)
  {
LABEL_134:
    __break(1u);
    goto LABEL_135;
  }
  id v93 = [v92 trailingAnchor];
  id v94 = [v91 constraintEqualToAnchor:v93];

  *(void *)(v74 + 56) = v94;
  specialized Array._endMutation()();
  Class v95 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v95];

  uint64_t v96 = swift_allocObject();
  *(_OWORD *)(v96 + 16) = xmmword_100123C30;
  char v97 = *(void **)&v3[v276];
  if (!v97)
  {
LABEL_135:
    __break(1u);
    goto LABEL_136;
  }
  id v98 = [v97 leadingAnchor];
  id v99 = *(void **)&v3[v1];
  if (!v99)
  {
LABEL_136:
    __break(1u);
    goto LABEL_137;
  }
  id v100 = [v99 leadingAnchor];
  id v101 = [v98 constraintEqualToAnchor:v100];

  *(void *)(v96 + 32) = v101;
  long long v102 = *(void **)&v3[v276];
  if (!v102)
  {
LABEL_137:
    __break(1u);
    goto LABEL_138;
  }
  id v103 = [v102 topAnchor];
  NSString v104 = *(void **)&v3[v282];
  if (!v104)
  {
LABEL_138:
    __break(1u);
    goto LABEL_139;
  }
  id v105 = [v104 bottomAnchor];
  id v106 = [v103 constraintEqualToAnchor:v105 constant:20.0];

  *(void *)(v96 + 40) = v106;
  id v107 = *(void **)&v3[v276];
  if (!v107)
  {
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  id v108 = [v107 widthAnchor];
  id v109 = [v108 constraintEqualToConstant:100.0];

  *(void *)(v96 + 48) = v109;
  long long v110 = *(void **)&v3[v276];
  if (!v110)
  {
LABEL_140:
    __break(1u);
    goto LABEL_141;
  }
  id v111 = [v110 heightAnchor];
  id v112 = [v111 constraintEqualToConstant:42.0];

  *(void *)(v96 + 56) = v112;
  specialized Array._endMutation()();
  Class v113 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v113];

  uint64_t v114 = swift_allocObject();
  *(_OWORD *)(v114 + 16) = xmmword_100123C30;
  char v115 = *(void **)&v3[v279];
  if (!v115)
  {
LABEL_141:
    __break(1u);
    goto LABEL_142;
  }
  id v116 = [v115 topAnchor];
  id v117 = *(void **)&v3[v276];
  if (!v117)
  {
LABEL_142:
    __break(1u);
    goto LABEL_143;
  }
  id v118 = [v117 topAnchor];
  id v119 = [v116 constraintEqualToAnchor:v118];

  *(void *)(v114 + 32) = v119;
  long long v120 = *(void **)&v3[v279];
  if (!v120)
  {
LABEL_143:
    __break(1u);
    goto LABEL_144;
  }
  id v121 = [v120 leadingAnchor];
  long long v122 = *(void **)&v3[v276];
  if (!v122)
  {
LABEL_144:
    __break(1u);
    goto LABEL_145;
  }
  id v123 = [v122 trailingAnchor];
  id v124 = [v121 constraintEqualToAnchor:v123 constant:30.0];

  *(void *)(v114 + 40) = v124;
  id v125 = *(void **)&v3[v279];
  if (!v125)
  {
LABEL_145:
    __break(1u);
    goto LABEL_146;
  }
  id v126 = [v125 trailingAnchor];
  long long v127 = *(void **)&v3[v1];
  if (!v127)
  {
LABEL_146:
    __break(1u);
    goto LABEL_147;
  }
  id v128 = [v127 trailingAnchor];
  id v129 = [v126 constraintEqualToAnchor:v128];

  *(void *)(v114 + 48) = v129;
  uint64_t v130 = *(void **)&v3[v279];
  if (!v130)
  {
LABEL_147:
    __break(1u);
    goto LABEL_148;
  }
  id v131 = [v130 heightAnchor];
  id v132 = [v131 constraintEqualToConstant:42.0];

  *(void *)(v114 + 56) = v132;
  specialized Array._endMutation()();
  Class v133 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v133];

  uint64_t v134 = swift_allocObject();
  *(_OWORD *)(v134 + 16) = xmmword_100123C30;
  long long v135 = *(void **)&v3[v281];
  if (!v135)
  {
LABEL_148:
    __break(1u);
    goto LABEL_149;
  }
  id v136 = [v135 leadingAnchor];
  id v137 = *(void **)&v3[v1];
  if (!v137)
  {
LABEL_149:
    __break(1u);
    goto LABEL_150;
  }
  id v138 = [v137 leadingAnchor];
  id v139 = [v136 constraintEqualToAnchor:v138];

  *(void *)(v134 + 32) = v139;
  id v140 = *(void **)&v3[v281];
  if (!v140)
  {
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  id v141 = [v140 topAnchor];
  long long v142 = *(void **)&v3[v276];
  if (!v142)
  {
LABEL_151:
    __break(1u);
    goto LABEL_152;
  }
  id v143 = [v142 bottomAnchor];
  id v144 = [v141 constraintEqualToAnchor:v143 constant:15.0];

  *(void *)(v134 + 40) = v144;
  id v145 = *(void **)&v3[v281];
  if (!v145)
  {
LABEL_152:
    __break(1u);
    goto LABEL_153;
  }
  id v146 = [v145 widthAnchor];
  id v147 = [v146 constraintEqualToConstant:100.0];

  *(void *)(v134 + 48) = v147;
  uint64_t v148 = *(void **)&v3[v281];
  if (!v148)
  {
LABEL_153:
    __break(1u);
    goto LABEL_154;
  }
  id v149 = [v148 heightAnchor];
  id v150 = [v149 constraintEqualToConstant:42.0];

  *(void *)(v134 + 56) = v150;
  specialized Array._endMutation()();
  Class v151 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v151];

  uint64_t v152 = swift_allocObject();
  *(_OWORD *)(v152 + 16) = xmmword_100123C30;
  id v153 = *(void **)&v3[v278];
  if (!v153)
  {
LABEL_154:
    __break(1u);
    goto LABEL_155;
  }
  id v154 = [v153 topAnchor];
  id v155 = *(void **)&v3[v281];
  if (!v155)
  {
LABEL_155:
    __break(1u);
    goto LABEL_156;
  }
  id v156 = [v155 topAnchor];
  id v157 = [v154 constraintEqualToAnchor:v156];

  *(void *)(v152 + 32) = v157;
  NSString v158 = *(void **)&v3[v278];
  if (!v158)
  {
LABEL_156:
    __break(1u);
    goto LABEL_157;
  }
  id v159 = [v158 leadingAnchor];
  id v160 = *(void **)&v3[v281];
  if (!v160)
  {
LABEL_157:
    __break(1u);
    goto LABEL_158;
  }
  id v161 = [v160 trailingAnchor];
  id v162 = [v159 constraintEqualToAnchor:v161 constant:30.0];

  *(void *)(v152 + 40) = v162;
  id v163 = *(void **)&v3[v278];
  if (!v163)
  {
LABEL_158:
    __break(1u);
    goto LABEL_159;
  }
  id v164 = [v163 trailingAnchor];
  id v165 = *(void **)&v3[v1];
  if (!v165)
  {
LABEL_159:
    __break(1u);
    goto LABEL_160;
  }
  id v166 = [v165 trailingAnchor];
  id v167 = [v164 constraintEqualToAnchor:v166];

  *(void *)(v152 + 48) = v167;
  uint64_t v168 = *(void **)&v3[v278];
  if (!v168)
  {
LABEL_160:
    __break(1u);
    goto LABEL_161;
  }
  id v169 = [v168 heightAnchor];
  id v170 = [v169 constraintEqualToConstant:42.0];

  *(void *)(v152 + 56) = v170;
  specialized Array._endMutation()();
  Class v171 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v171];

  uint64_t v172 = swift_allocObject();
  *(_OWORD *)(v172 + 16) = xmmword_100123C30;
  long long v173 = *(void **)&v3[v277];
  if (!v173)
  {
LABEL_161:
    __break(1u);
    goto LABEL_162;
  }
  id v174 = [v173 topAnchor];
  NSString v175 = *(void **)&v3[v281];
  if (!v175)
  {
LABEL_162:
    __break(1u);
    goto LABEL_163;
  }
  id v176 = [v175 bottomAnchor];
  id v177 = [v174 constraintEqualToAnchor:v176 constant:30.0];

  *(void *)(v172 + 32) = v177;
  id v178 = *(void **)&v3[v277];
  if (!v178)
  {
LABEL_163:
    __break(1u);
    goto LABEL_164;
  }
  id v179 = [v178 leftAnchor];
  v180 = *(void **)&v3[v1];
  if (!v180)
  {
LABEL_164:
    __break(1u);
    goto LABEL_165;
  }
  id v181 = [v180 leftAnchor];
  id v182 = [v179 constraintEqualToAnchor:v181];

  *(void *)(v172 + 40) = v182;
  v183 = *(void **)&v3[v277];
  if (!v183)
  {
LABEL_165:
    __break(1u);
    goto LABEL_166;
  }
  id v184 = [v183 rightAnchor];
  id v185 = *(void **)&v3[v1];
  if (!v185)
  {
LABEL_166:
    __break(1u);
    goto LABEL_167;
  }
  id v186 = [v185 rightAnchor];
  id v187 = [v184 constraintEqualToAnchor:v186];

  *(void *)(v172 + 48) = v187;
  uint64_t v188 = *(void **)&v3[v277];
  if (!v188)
  {
LABEL_167:
    __break(1u);
    goto LABEL_168;
  }
  id v189 = [v188 heightAnchor];
  id v190 = [v189 constraintEqualToConstant:42.0];

  *(void *)(v172 + 56) = v190;
  specialized Array._endMutation()();
  Class v191 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v191];

  uint64_t v192 = swift_allocObject();
  *(_OWORD *)(v192 + 16) = xmmword_100123C30;
  unint64_t v193 = *(void **)&v3[v283];
  if (!v193)
  {
LABEL_168:
    __break(1u);
    goto LABEL_169;
  }
  id v194 = [v193 topAnchor];
  unint64_t v195 = *(void **)&v3[v277];
  if (!v195)
  {
LABEL_169:
    __break(1u);
    goto LABEL_170;
  }
  id v196 = [v195 bottomAnchor];
  id v197 = [v194 constraintEqualToAnchor:v196 constant:20.0];

  *(void *)(v192 + 32) = v197;
  v198 = *(void **)&v3[v283];
  if (!v198)
  {
LABEL_170:
    __break(1u);
    goto LABEL_171;
  }
  id v199 = [v198 leftAnchor];
  v200 = *(void **)&v3[v1];
  if (!v200)
  {
LABEL_171:
    __break(1u);
    goto LABEL_172;
  }
  id v201 = [v200 leftAnchor];
  id v202 = [v199 constraintEqualToAnchor:v201];

  *(void *)(v192 + 40) = v202;
  v203 = *(void **)&v3[v283];
  if (!v203)
  {
LABEL_172:
    __break(1u);
    goto LABEL_173;
  }
  id v204 = [v203 rightAnchor];
  uint64_t v205 = *(void **)&v3[v1];
  if (!v205)
  {
LABEL_173:
    __break(1u);
    goto LABEL_174;
  }
  id v206 = [v205 rightAnchor];
  id v207 = [v204 constraintEqualToAnchor:v206];

  *(void *)(v192 + 48) = v207;
  unint64_t v208 = *(void **)&v3[v283];
  if (!v208)
  {
LABEL_174:
    __break(1u);
    goto LABEL_175;
  }
  id v209 = [v208 heightAnchor];
  id v210 = [v209 constraintEqualToConstant:200.0];

  *(void *)(v192 + 56) = v210;
  specialized Array._endMutation()();
  Class v211 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v211];

  uint64_t v212 = swift_allocObject();
  *(_OWORD *)(v212 + 16) = xmmword_100125510;
  unint64_t v213 = *(void **)&v3[v15];
  if (!v213)
  {
LABEL_175:
    __break(1u);
    goto LABEL_176;
  }
  id v214 = [v213 centerXAnchor];
  long long v215 = *(void **)&v3[v283];
  if (!v215)
  {
LABEL_176:
    __break(1u);
    goto LABEL_177;
  }
  id v216 = [v215 centerXAnchor];
  id v217 = [v214 constraintEqualToAnchor:v216];

  *(void *)(v212 + 32) = v217;
  uint64_t v218 = *(void **)&v3[v15];
  if (!v218)
  {
LABEL_177:
    __break(1u);
    goto LABEL_178;
  }
  id v219 = [v218 topAnchor];
  uint64_t v220 = *(void **)&v3[v283];
  if (!v220)
  {
LABEL_178:
    __break(1u);
    goto LABEL_179;
  }
  id v221 = [v220 bottomAnchor];
  id v222 = [v219 constraintEqualToAnchor:v221 constant:10.0];

  *(void *)(v212 + 40) = v222;
  uint64_t v223 = *(void **)&v3[v15];
  if (!v223)
  {
LABEL_179:
    __break(1u);
    goto LABEL_180;
  }
  id v224 = [v223 bottomAnchor];
  v225 = *(void **)&v3[v1];
  if (!v225)
  {
LABEL_180:
    __break(1u);
    goto LABEL_181;
  }
  id v226 = [v225 bottomAnchor];
  id v227 = [v224 constraintEqualToAnchor:v226];

  *(void *)(v212 + 48) = v227;
  specialized Array._endMutation()();
  Class v228 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v228];

  uint64_t v229 = swift_allocObject();
  *(_OWORD *)(v229 + 16) = xmmword_100123C30;
  v230 = *(void **)&v3[v280];
  if (!v230)
  {
LABEL_181:
    __break(1u);
    goto LABEL_182;
  }
  id v231 = [v230 leadingAnchor];
  id v232 = [v3 view];
  if (!v232)
  {
LABEL_182:
    __break(1u);
    goto LABEL_183;
  }
  uint64_t v233 = v232;
  id v234 = [v232 safeAreaLayoutGuide];

  id v235 = [v234 leadingAnchor];
  id v236 = [v231 constraintEqualToAnchor:v235 constant:40.0];

  *(void *)(v229 + 32) = v236;
  v237 = *(void **)&v3[v280];
  if (!v237)
  {
LABEL_183:
    __break(1u);
    goto LABEL_184;
  }
  id v238 = [v237 trailingAnchor];
  id v239 = [v3 view];
  if (!v239)
  {
LABEL_184:
    __break(1u);
    goto LABEL_185;
  }
  v240 = v239;
  id v241 = [v239 safeAreaLayoutGuide];

  id v242 = [v241 trailingAnchor];
  id v243 = [v238 constraintEqualToAnchor:v242 constant:-40.0];

  *(void *)(v229 + 40) = v243;
  v244 = *(void **)&v3[v280];
  if (!v244)
  {
LABEL_185:
    __break(1u);
    goto LABEL_186;
  }
  id v245 = [v244 bottomAnchor];
  v246 = *(void **)&v3[v275];
  if (!v246)
  {
LABEL_186:
    __break(1u);
    goto LABEL_187;
  }
  id v247 = [v246 topAnchor];
  id v248 = [v245 constraintEqualToAnchor:v247 constant:-20.0];

  *(void *)(v229 + 48) = v248;
  v249 = *(void **)&v3[v280];
  if (!v249)
  {
LABEL_187:
    __break(1u);
    goto LABEL_188;
  }
  id v250 = [v249 heightAnchor];
  id v251 = [v250 constraintEqualToConstant:42.0];

  *(void *)(v229 + 56) = v251;
  specialized Array._endMutation()();
  Class v252 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v252];

  uint64_t v253 = swift_allocObject();
  *(_OWORD *)(v253 + 16) = xmmword_100125510;
  v254 = *(void **)&v3[v275];
  if (!v254)
  {
LABEL_188:
    __break(1u);
    goto LABEL_189;
  }
  id v255 = [v254 leadingAnchor];
  id v256 = [v3 view];
  if (!v256)
  {
LABEL_189:
    __break(1u);
    goto LABEL_190;
  }
  v257 = v256;
  id v258 = [v256 safeAreaLayoutGuide];

  id v259 = [v258 leadingAnchor];
  id v260 = [v255 constraintEqualToAnchor:v259 constant:40.0];

  *(void *)(v253 + 32) = v260;
  v261 = *(void **)&v3[v275];
  if (!v261)
  {
LABEL_190:
    __break(1u);
    goto LABEL_191;
  }
  id v262 = [v261 trailingAnchor];
  id v263 = [v3 view];
  if (!v263)
  {
LABEL_191:
    __break(1u);
    goto LABEL_192;
  }
  v264 = v263;
  id v265 = [v263 safeAreaLayoutGuide];

  id v266 = [v265 trailingAnchor];
  id v267 = [v262 constraintEqualToAnchor:v266 constant:-40.0];

  *(void *)(v253 + 40) = v267;
  v268 = *(void **)&v3[v275];
  if (!v268)
  {
LABEL_192:
    __break(1u);
    goto LABEL_193;
  }
  id v269 = [v268 bottomAnchor];
  id v270 = [v3 view];
  if (!v270)
  {
LABEL_193:
    __break(1u);
    return;
  }
  v271 = v270;
  id v272 = [v270 safeAreaLayoutGuide];

  id v273 = [v272 bottomAnchor];
  id v274 = [v269 constraintEqualToAnchor:v273 constant:-20.0];

  *(void *)(v253 + 48) = v274;
  specialized Array._endMutation()();
  v284.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v51 activateConstraints:v284.super.isa];
}

void *sub_1000F3ED0()
{
  uint64_t v1 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField;
  uint64_t result = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField);
  if (!result)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v3 = [result text];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = v3;
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  uint64_t result = (void *)swift_bridgeObjectRelease();
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8)
  {
    uint64_t v10 = *(void **)(v0 + v1);
    if (!v10)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    id v11 = v10;
    sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000020, (void *)0x80000001001310E0);
    sub_10003AFD0(&qword_100183BE8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100123B50;
    *(void *)(inited + 32) = NSForegroundColorAttributeName;
    uint64_t v13 = self;
    double v14 = NSForegroundColorAttributeName;
    id v15 = [v13 redColor];
    *(void *)(inited + 64) = sub_10003C374(0, (unint64_t *)&unk_1001864D0);
    *(void *)(inited + 40) = v15;
    sub_100078670(inited);
    id v16 = objc_allocWithZone((Class)NSAttributedString);
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1000CE2B4();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v19 = [v16 initWithString:v17 attributes:isa];

    [v11 setAttributedPlaceholder:v19];
    uint64_t v9 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v9 = 1;
  }
  uint64_t v20 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField;
  uint64_t result = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField);
  if (!result) {
    goto LABEL_22;
  }
  id v21 = [result text];
  if (!v21) {
    goto LABEL_16;
  }
  id v22 = v21;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v25 = v24;

  uint64_t result = (void *)swift_bridgeObjectRelease();
  uint64_t v26 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0) {
    uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
  }
  if (v26)
  {
LABEL_16:
    uint64_t v37 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView;
    uint64_t result = *(void **)(v0 + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView);
    if (result)
    {
      if ([result signatureExists]) {
        return (void *)v9;
      }
      uint64_t result = *(void **)(v0 + v37);
      if (result)
      {
        id v38 = [result layer];
        id v39 = [self redColor];
        id v40 = [v39 CGColor];

        [v38 setBorderColor:v40];
        return 0;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v27 = *(void **)(v0 + v20);
  if (v27)
  {
    id v28 = v27;
    sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000020, (void *)0x80000001001310E0);
    sub_10003AFD0(&qword_100183BE8);
    uint64_t v29 = swift_initStackObject();
    *(_OWORD *)(v29 + 16) = xmmword_100123B50;
    *(void *)(v29 + 32) = NSForegroundColorAttributeName;
    id v30 = self;
    id v31 = NSForegroundColorAttributeName;
    id v32 = [v30 redColor];
    *(void *)(v29 + 64) = sub_10003C374(0, (unint64_t *)&unk_1001864D0);
    *(void *)(v29 + 40) = v32;
    sub_100078670(v29);
    id v33 = objc_allocWithZone((Class)NSAttributedString);
    NSString v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1000CE2B4();
    Class v35 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v36 = [v33 initWithString:v34 attributes:v35];

    [v28 setAttributedPlaceholder:v36];
    uint64_t v9 = 0;
    goto LABEL_16;
  }
LABEL_26:
  __break(1u);
  return result;
}

void sub_1000F43A8()
{
  uint64_t v1 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  unint64_t v6 = &v22[-v5];
  uint64_t v7 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v11 = [self sharedManager];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 6;
  *(unsigned char *)(v12 + 24) = 0;
  *(void *)(v12 + 32) = 0;
  *(unsigned char *)(v12 + 40) = 1;
  aBlock[4] = sub_10008D240;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100046950;
  void aBlock[3] = &unk_100153F60;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  [v11 transactionWithBlock:v13];
  _Block_release(v13);

  id v14 = [v0 parentViewController];
  if (v14)
  {
    id v15 = v14;
    self;
    uint64_t v16 = swift_dynamicCastObjCClass();
    if (v16)
    {
      NSString v17 = (void *)v16;
      if (qword_100182828 != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for ModalPresentationCoordinator(0);
      sub_10003C3B0(v18, (uint64_t)qword_10018A440);
      swift_beginAccess();
      if ((sub_1000D986C(v17, 1, 0, 1, 0, 0) & 1) == 0)
      {
        id v19 = v15;
        uint64_t v20 = swift_bridgeObjectRetain();
        uint64_t v21 = sub_1000DC28C(v20, v17);

        sub_1000D7D60(v21, (uint64_t)v6);
        swift_release();
        if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
        {
          sub_10003C44C((uint64_t)v6, (uint64_t *)&unk_100182FD0);
        }
        else
        {
          sub_10003C4A8((uint64_t)v6, (uint64_t)v10);
          sub_1000B7DBC((uint64_t)v10, (uint64_t)v4);
          sub_10003C44C((uint64_t)v4, (uint64_t *)&unk_100182FD0);
          sub_10003C50C((uint64_t)v10);
        }
      }
      swift_endAccess();
    }
  }
}

void sub_1000F4764()
{
  if (sub_1000F3ED0())
  {
    uint64_t v1 = sub_1000F4B80();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v0;
    uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField];
    if (v3)
    {
      uint64_t v4 = v2;
      uint64_t v5 = v0;
      id v6 = [v3 text];
      if (!v6)
      {
LABEL_14:
        swift_bridgeObjectRelease();
        static os_log_type_t.fault.getter();
        sub_10003C374(0, (unint64_t *)&qword_1001832C0);
        Class v35 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:_:_:)();

        sub_1000F4DE8(v5);
        swift_release();
        return;
      }
      uint64_t v7 = v6;
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      id v11 = *(void **)&v5[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField];
      if (v11)
      {
        id v12 = [v11 text];
        if (!v12)
        {
LABEL_13:
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
        uint64_t v13 = v12;
        uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v16 = v15;

        NSString v17 = *(void **)&v5[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView];
        if (v17)
        {
          id v18 = [v17 signatureImage];
          [v18 copy];

          _bridgeAnyObjectToAny(_:)();
          swift_unknownObjectRelease();
          sub_10003C374(0, &qword_100183128);
          if (swift_dynamicCast())
          {
            id v19 = v42;
            sub_1000B1ED4(v1);
            swift_bridgeObjectRelease();
            id v20 = objc_allocWithZone((Class)DADocumentHelper);
            Class isa = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            id v22 = [v20 initWithConsentHandles:isa];

            uint64_t v23 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_documentHelper;
            unint64_t v24 = *(void **)&v5[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_documentHelper];
            *(void *)&v5[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_documentHelper] = v22;

            unint64_t v25 = *(void **)&v5[v23];
            if (v25)
            {
              swift_bridgeObjectRetain();
              v26._countAndFlagsBits = 32;
              v26._object = (void *)0xE100000000000000;
              String.append(_:)(v26);
              id v27 = v25;
              swift_bridgeObjectRelease();
              aBlock = (void **)v8;
              uint64_t v37 = v10;
              swift_bridgeObjectRetain();
              v28._countAndFlagsBits = v14;
              v28._object = v16;
              String.append(_:)(v28);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              NSString v29 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
              [v27 setFullName:v29];

              id v30 = *(void **)&v5[v23];
              if (v30)
              {
                [v30 setImageSignature:v19];
                id v31 = *(void **)&v5[v23];
                if (v31)
                {
                  uint64_t v32 = swift_allocObject();
                  *(void *)(v32 + 16) = sub_1000F6AF8;
                  *(void *)(v32 + 24) = v4;
                  id v40 = sub_10003C640;
                  uint64_t v41 = v32;
                  aBlock = _NSConcreteStackBlock;
                  uint64_t v37 = 1107296256;
                  id v38 = sub_1000358AC;
                  id v39 = &unk_100153F10;
                  id v33 = _Block_copy(&aBlock);
                  id v34 = v31;
                  swift_retain();
                  swift_release();
                  [v34 saveConsentDocument:v33];
                  _Block_release(v33);
                  swift_release();

                  return;
                }
                goto LABEL_21;
              }
LABEL_20:
              __break(1u);
LABEL_21:
              __break(1u);
              return;
            }
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
          swift_bridgeObjectRelease();
          goto LABEL_13;
        }
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
}

uint64_t sub_1000F4B80()
{
  id v0 = [self sharedManager];
  id v1 = [v0 snapshot];

  id v2 = [v1 consentHandles];
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  sub_10003AFD0(&qword_100183CF0);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  id v18 = _swiftEmptyArrayStorage;
  sub_10005FB68(0, v5, 0);
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void *)(v4 + 8 * v6 + 32);
    swift_bridgeObjectRetain();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v7 + 16) && (unint64_t v8 = sub_10007D88C((uint64_t)v14), (v9 & 1) != 0))
    {
      sub_10003C5D8(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }
    sub_10003C320((uint64_t)v14);
    if (!*((void *)&v16 + 1)) {
      break;
    }
    sub_100078AC4(&v15, &v17);
    swift_dynamicCast();
    Swift::String v10 = String.uppercased()();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = v18;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10005FB68(0, v3[2] + 1, 1);
      uint64_t v3 = v18;
    }
    unint64_t v12 = v3[2];
    unint64_t v11 = v3[3];
    if (v12 >= v11 >> 1)
    {
      sub_10005FB68(v11 > 1, v12 + 1, 1);
      uint64_t v3 = v18;
    }
    ++v6;
    v3[2] = v12 + 1;
    *(Swift::String *)&v3[2 * v12 + 4] = v10;
    if (v5 == v6) {
      goto LABEL_14;
    }
  }
  uint64_t result = sub_10003C44C((uint64_t)&v15, &qword_100183E70);
  __break(1u);
  return result;
}

void sub_1000F4DE8(void *a1)
{
  id v7 = [a1 parentViewController];
  if (!v7) {
    return;
  }
  self;
  id v1 = (void *)swift_dynamicCastObjCClass();
  if (!v1) {
    goto LABEL_10;
  }
  id v2 = [v1 viewControllers];

  sub_10003C374(0, (unint64_t *)&qword_100183670);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_5;
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_5:
    if ((v3 & 0xC000000000000001) != 0)
    {
      id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v4 = *(id *)(v3 + 32);
    }
    id v7 = v4;
    swift_bridgeObjectRelease();
    type metadata accessor for EnhancedLoggingConsentViewController();
    int64_t v5 = (void *)swift_dynamicCastClass();
    if (v5) {
      sub_1000F4FCC(v5);
    }
LABEL_10:

    return;
  }

  swift_bridgeObjectRelease();
}

void sub_1000F4FCC(void *a1)
{
  id v2 = v1;
  id v42 = a1;
  uint64_t v3 = sub_10003AFD0((uint64_t *)&unk_100182FD0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v40 - v7;
  uint64_t v9 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  uint64_t v41 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = self;
  id v13 = [v12 sharedManager];
  id v14 = [v13 snapshot];

  LOBYTE(v13) = sub_1000F68DC();
  if (v13)
  {
    uint64_t v41 = v2;
    type metadata accessor for DeviceSelector();
    long long v15 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v16 = [v12 sharedManager];
    id v17 = [v16 snapshot];

    id v18 = [self currentDevice];
    if (v18)
    {
      id v19 = v18;
      id v20 = [v18 platform];

      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v23 = v22;

      uint64_t v24 = sub_1000F5DAC();
      sub_10003AFD0(&qword_100185010);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100123B50;
      *(void *)(inited + 32) = v21;
      *(void *)(inited + 40) = v23;
      uint64_t v26 = (uint64_t)sub_1000B51F0(inited, v24);
      swift_setDeallocating();
      swift_arrayDestroy();
    }
    else
    {
      uint64_t v26 = sub_1000F5DAC();
    }

    id v38 = v41;
    uint64_t v37 = v42;
    id v39 = sub_1000A0678(v26);
    swift_bridgeObjectRelease();
    *(void *)&v15[OBJC_IVAR____TtC11Diagnostics14DeviceSelector_platformsFromQueue] = v39;
    swift_bridgeObjectRelease();
    [v37 showViewController:v15 sender:v38];
  }
  else
  {
    id v27 = [v12 sharedManager];
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = 3;
    *(unsigned char *)(v28 + 24) = 0;
    *(void *)(v28 + 32) = 1;
    *(unsigned char *)(v28 + 40) = 0;
    aBlock[4] = sub_10008D240;
    aBlock[5] = v28;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100046950;
    void aBlock[3] = &unk_100153E98;
    NSString v29 = _Block_copy(aBlock);
    swift_release();
    [v27 transactionWithBlock:v29];
    _Block_release(v29);

    id v30 = (char *)[v2 parentViewController];
    if (!v30) {
      return;
    }
    long long v15 = v30;
    self;
    uint64_t v31 = swift_dynamicCastObjCClass();
    if (v31)
    {
      uint64_t v32 = (void *)v31;
      if (qword_100182828 != -1) {
        swift_once();
      }
      uint64_t v33 = type metadata accessor for ModalPresentationCoordinator(0);
      sub_10003C3B0(v33, (uint64_t)qword_10018A440);
      swift_beginAccess();
      if ((sub_1000D986C(v32, 1, 0, 1, 0, 0) & 1) == 0)
      {
        id v34 = v15;
        uint64_t v35 = swift_bridgeObjectRetain();
        uint64_t v36 = sub_1000DC28C(v35, v32);

        sub_1000D7D60(v36, (uint64_t)v8);
        swift_release();
        if (v41[6](v8, 1, v9) == 1)
        {
          sub_10003C44C((uint64_t)v8, (uint64_t *)&unk_100182FD0);
        }
        else
        {
          sub_10003C4A8((uint64_t)v8, (uint64_t)v11);
          sub_1000B7DBC((uint64_t)v11, (uint64_t)v6);
          sub_10003C44C((uint64_t)v6, (uint64_t *)&unk_100182FD0);
          sub_10003C50C((uint64_t)v11);
        }
      }
      swift_endAccess();
    }
  }
}

id sub_1000F54FC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollViewHorizontalInset] = 0x4034000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollViewVerticalInset] = 0x4024000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_commonHeight] = 0x4045000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_componentPadding] = 0x403E000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_topPadding] = 0x4024000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_topPaddingForLabel] = 0x4034000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_labelWidth] = 0x4059000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_textFieldSpacer] = 0x402E000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureViewHeight] = 0x4069000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_bottomButtonVerticalPadding] = 0x4034000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_bottomButtonHorizontalPadding] = 0x4044000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_bottomButtonSpacer] = 0x4034000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_consentButtonCornerRadius] = 0x4024000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_fontSizeForLabels] = 0x4032000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_fontSizeForTitle] = 0x4040000000000000;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_documentHelper] = 0;
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ConsentSignatureController();
  id v6 = [super initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_1000F5754(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollViewHorizontalInset] = 0x4034000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollViewVerticalInset] = 0x4024000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_commonHeight] = 0x4045000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_componentPadding] = 0x403E000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_topPadding] = 0x4024000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_topPaddingForLabel] = 0x4034000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_labelWidth] = 0x4059000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_textFieldSpacer] = 0x402E000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureViewHeight] = 0x4069000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_bottomButtonVerticalPadding] = 0x4034000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_bottomButtonHorizontalPadding] = 0x4044000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_bottomButtonSpacer] = 0x4034000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_consentButtonCornerRadius] = 0x4024000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_fontSizeForLabels] = 0x4032000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_fontSizeForTitle] = 0x4040000000000000;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_documentHelper] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConsentSignatureController();
  [super initWithCoder:a1];

  return v3;
}

id sub_1000F5944()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsentSignatureController();
  [super dealloc];
}

uint64_t type metadata accessor for ConsentSignatureController()
{
  return self;
}

uint64_t sub_1000F5A98(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField;
  objc_super v5 = *(void **)(v1 + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField);
  if (v5)
  {
    sub_10003C374(0, &qword_1001864B8);
    id v6 = a1;
    id v7 = v5;
    char v8 = static NSObject.== infix(_:_:)();

    if (v8)
    {
      [v6 resignFirstResponder];
      return 1;
    }
  }
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField);
  if (!v9) {
    return 1;
  }
  sub_10003C374(0, &qword_1001864B8);
  id v10 = a1;
  id v11 = v9;
  char v12 = static NSObject.== infix(_:_:)();

  if ((v12 & 1) == 0) {
    return 1;
  }
  uint64_t result = *(void *)(v2 + v4);
  if (result)
  {
    [(id)result becomeFirstResponder];
    return 1;
  }
  __break(1u);
  return result;
}

void sub_1000F5BF4(void *a1)
{
  id v3 = [v1 view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = v3;
  id v5 = [v1 view];
  [a1 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [v4 hitTest:0 withEvent:v7];
  if (v10)
  {
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();

    if (v11) {
      return;
    }
  }
  id v12 = [v1 view];
  if (!v12)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v13 = v12;
  [v12 endEditing:1];
}

uint64_t sub_1000F5DAC()
{
  id v1 = [self allPlatforms];
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  id v3 = [v0 queue];
  if (!v3)
  {
    double v9 = _swiftEmptyArrayStorage;
LABEL_19:
    uint64_t v16 = sub_1000F6848((uint64_t)v9);
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_1000F0A60(v16);
    uint64_t v18 = sub_1000F604C(v2, v17);
    swift_bridgeObjectRelease();
    return v18;
  }
  uint64_t v4 = v3;
  sub_10003C374(0, (unint64_t *)&qword_1001864C0);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v19 = v2;
    if (v6) {
      goto LABEL_4;
    }
LABEL_17:
    double v9 = _swiftEmptyArrayStorage;
LABEL_18:
    swift_bridgeObjectRelease_n();
    uint64_t v2 = v19;
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v6 = result;
  uint64_t v19 = v2;
  if (!result) {
    goto LABEL_17;
  }
LABEL_4:
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    double v9 = _swiftEmptyArrayStorage;
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v10 = *(id *)(v5 + 8 * v8 + 32);
      }
      uint64_t v11 = v10;
      id v12 = [v10 platform];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100061B00();
      uint64_t v13 = StringProtocol.components<A>(separatedBy:)();

      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        double v9 = sub_10009FF94(0, v9[2] + 1, 1, v9);
      }
      unint64_t v15 = v9[2];
      unint64_t v14 = v9[3];
      if (v15 >= v14 >> 1) {
        double v9 = sub_10009FF94((void *)(v14 > 1), v15 + 1, 1, v9);
      }
      ++v8;
      v9[2] = v15 + 1;
      v9[v15 + 4] = v13;
    }
    while (v6 != v8);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000F604C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_1000F61D4((uint64_t)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_1000F61D4((uint64_t)v8, v5, a2, v3);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_1000F61D4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v20 = Hasher._finalize()();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      uint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    id v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v47 = Hasher._finalize()();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    id v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_1000DB130(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        id v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_1000F6714(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1000F6B48();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (unint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      unint64_t v6 = *v4;
      sub_100060C08(v5, *v4);
      sub_1000B930C(v7, v5, v6);
      sub_100060B6C(v7[0], v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1000F67B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000B98F0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1000F6848(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_10003AFD0(&qword_100184220);
  sub_1000F6A54();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      Swift::Int v5 = *v4++;
      swift_bridgeObjectRetain();
      sub_1000B9AA0(&v6, v5);
      swift_bridgeObjectRelease();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

BOOL sub_1000F68DC()
{
  id v0 = [self sharedManager];
  id v1 = [v0 snapshot];

  id v2 = [self currentDevice];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 platform];

    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    uint64_t v8 = sub_1000F5DAC();
    sub_10003AFD0(&qword_100185010);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100123B50;
    *(void *)(inited + 32) = v5;
    *(void *)(inited + 40) = v7;
    uint64_t v10 = (uint64_t)sub_1000B51F0(inited, v8);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  else
  {
    uint64_t v10 = sub_1000F5DAC();
  }

  uint64_t v11 = *(void *)(v10 + 16);
  swift_bridgeObjectRelease();
  return v11 != 0;
}

uint64_t sub_1000F6A2C()
{
  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_1000F6A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000F6A4C()
{
  return swift_release();
}

unint64_t sub_1000F6A54()
{
  unint64_t result = qword_1001864C8;
  if (!qword_1001864C8)
  {
    sub_10003B070(&qword_100184220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001864C8);
  }
  return result;
}

uint64_t sub_1000F6AC0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000F6AF8()
{
  sub_1000F4DE8(*(void **)(v0 + 16));
}

uint64_t sub_1000F6B00()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000F6B38()
{
  return _swift_deallocObject(v0, 41, 7);
}

unint64_t sub_1000F6B48()
{
  unint64_t result = qword_1001864F0;
  if (!qword_1001864F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001864F0);
  }
  return result;
}

unint64_t sub_1000F6BB0@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t result = sub_10007D8D0(result), (v5 & 1) != 0))
  {
    uint64_t v6 = (uint64_t *)(*(void *)(a2 + 56) + 40 * result);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    unint64_t v9 = (void *)v6[2];
    uint64_t v10 = (void *)v6[3];
    uint64_t v11 = (void *)v6[4];
    id v12 = v11;
    swift_bridgeObjectRetain();
    id v13 = v9;
    unint64_t result = v10;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  *a3 = v8;
  a3[1] = v7;
  a3[2] = v9;
  a3[3] = v10;
  a3[4] = v11;
  return result;
}

void *sub_1000F6C44(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v5 = sub_10007DAAC(a1);
      if (v6)
      {
        id v4 = *(void **)(*(void *)(a2 + 56) + 8 * v5);
        id v7 = v4;
        return v4;
      }
    }
    return 0;
  }
  swift_retain();
  uint64_t v3 = __CocoaDictionary.lookup(_:)();
  swift_release();
  if (!v3) {
    return 0;
  }
  type metadata accessor for CardViewCell();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v4 = v9;
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_1000F6D1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

void sub_1000F6E04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      unint64_t v5 = v4;
      sub_10003C374(0, (unint64_t *)&qword_1001858F0);
      char v6 = static NSObject.== infix(_:_:)();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = static NSObject.== infix(_:_:)();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_1000F6FA0(unint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (uint64_t i = 0; v4; uint64_t i = 0)
  {
    id v19 = *(id *)(a1 + 40);
    a1 = a2 & 0xC000000000000001;
    while (1)
    {
      if (a1)
      {
        uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v6 = *(void *)(a2 + 8 * i + 32);
        swift_retain();
      }
      id v7 = [*(id *)(v6 + 40) serialNumber];
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      id v11 = [v19 serialNumber];
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v14 = v13;

      if (v8 == v12 && v10 == v14)
      {
        swift_release();
        swift_bridgeObjectRelease_n();
        return i;
      }
      char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v16) {
        return i;
      }
      uint64_t v17 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      ++i;
      if (v17 == v4) {
        return 0;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return i;
}

uint64_t sub_1000F714C()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardStates);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for CardState();
    sub_100100554((unint64_t *)&qword_100183A58, (void (*)(uint64_t))type metadata accessor for CardState);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v2 = v24;
    uint64_t v4 = v25;
    uint64_t v5 = v26;
    uint64_t v6 = v27;
    unint64_t v7 = v28;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v4 = v2 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v2 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v6 = 0;
  }
  int64_t v11 = (unint64_t)(v5 + 64) >> 6;
  while (v2 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      return sub_100046948();
    }
    type metadata accessor for CardState();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v15 = v23;
    swift_unknownObjectRelease();
    uint64_t v14 = v6;
    uint64_t v12 = v7;
    if (!v23) {
      return sub_100046948();
    }
LABEL_31:
    if (*(unsigned char *)(v15 + 16) == 1)
    {
      id v19 = [*(id *)(v15 + 40) serialNumber];
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      sub_1000B1FFC(v20, v22);
      swift_release();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t result = swift_release();
    }
    uint64_t v6 = v14;
    unint64_t v7 = v12;
  }
  if (v7)
  {
    uint64_t v12 = (v7 - 1) & v7;
    unint64_t v13 = __clz(__rbit64(v7)) | (v6 << 6);
    uint64_t v14 = v6;
LABEL_30:
    uint64_t v15 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
    swift_retain();
    if (!v15) {
      return sub_100046948();
    }
    goto LABEL_31;
  }
  int64_t v16 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v16 >= v11) {
      return sub_100046948();
    }
    unint64_t v17 = *(void *)(v4 + 8 * v16);
    uint64_t v14 = v6 + 1;
    if (!v17)
    {
      uint64_t v14 = v6 + 2;
      if (v6 + 2 >= v11) {
        return sub_100046948();
      }
      unint64_t v17 = *(void *)(v4 + 8 * v14);
      if (!v17)
      {
        uint64_t v14 = v6 + 3;
        if (v6 + 3 >= v11) {
          return sub_100046948();
        }
        unint64_t v17 = *(void *)(v4 + 8 * v14);
        if (!v17)
        {
          uint64_t v14 = v6 + 4;
          if (v6 + 4 >= v11) {
            return sub_100046948();
          }
          unint64_t v17 = *(void *)(v4 + 8 * v14);
          if (!v17)
          {
            uint64_t v18 = v6 + 5;
            while (v11 != v18)
            {
              unint64_t v17 = *(void *)(v4 + 8 * v18++);
              if (v17)
              {
                uint64_t v14 = v18 - 1;
                goto LABEL_29;
              }
            }
            return sub_100046948();
          }
        }
      }
    }
LABEL_29:
    uint64_t v12 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000F7458(unint64_t a1)
{
  return sub_1000F7470(a1, (uint64_t (*)(uint64_t))sub_100039FF0);
}

uint64_t sub_1000F7470(unint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v5 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v5;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v5 < 0 || (v5 & 0x4000000000000000) != 0)
  {
    uint64_t v5 = a2(v5);
    *uint64_t v2 = v5;
  }
  uint64_t v7 = v5 & 0xFFFFFFFFFFFFFF8;
  unint64_t v8 = *(void *)(v7 + 16);
  if (v8 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v9 = v8 - 1;
    uint64_t v10 = v8 - 1 - a1;
    if (v10 >= 0)
    {
      uint64_t v11 = v7 + 8 * a1;
      uint64_t v12 = *(void *)(v11 + 32);
      memmove((void *)(v11 + 32), (const void *)(v11 + 40), 8 * v10);
      *(void *)(v7 + 16) = v9;
      specialized Array._endMutation()();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

NSString sub_1000F755C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_10018A460 = (uint64_t)result;
  return result;
}

NSString sub_1000F7594()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_10018A468 = (uint64_t)result;
  return result;
}

NSString sub_1000F75CC()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_10018A470 = (uint64_t)result;
  return result;
}

uint64_t sub_1000F7604()
{
  char v1 = *(unsigned char *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_persistentOnly);
  uint64_t v2 = v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter;
  *(unsigned char *)(v2 + 16) = v1;
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v5 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardStates);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v11 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10005A284(v6, v3, v4, v1, (unint64_t *)&v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)v2;
  uint64_t v8 = *(void *)(v2 + 8);
  LOBYTE(v4) = *(unsigned char *)(v2 + 16);
  uint64_t v9 = *v5;
  uint64_t v11 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10005A284(v9, v7, v8, v4, (unint64_t *)&v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1000F7748()
{
  uint64_t v1 = v0;
  id v2 = [self defaultCenter];
  if (qword_100182838 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10018A460;
  sub_10003AFD0((uint64_t *)&unk_100183A60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100123B50;
  AnyHashable.init<A>(_:)();
  uint64_t v5 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_10007D8D0(1u), (v8 & 1) != 0))
  {
    unint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    swift_endAccess();
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    swift_endAccess();
    uint64_t v10 = 0;
  }
  *(void *)(inited + 96) = &type metadata for Int;
  *(void *)(inited + 72) = v10;
  sub_1000783F4(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 postNotificationName:v3 object:v1 userInfo:isa];
}

uint64_t sub_1000F7938()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (*(void *)(*v1 + 16) && (unint64_t v3 = sub_10007D8D0(0), (v4 & 1) != 0))
  {
    unint64_t v5 = *(void *)(*(void *)(v2 + 56) + 8 * v3);
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *v1;
  if (*(void *)(*v1 + 16))
  {
    unint64_t v8 = sub_10007D8D0(1u);
    if (v9)
    {
      unint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v8);
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        BOOL v12 = __OFADD__(v6, v19);
        v6 += v19;
        if (!v12) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
        BOOL v12 = __OFADD__(v6, v11);
        v6 += v11;
        if (!v12) {
          goto LABEL_12;
        }
      }
      __break(1u);
    }
  }
LABEL_12:
  uint64_t v13 = *v1;
  if (!*(void *)(*v1 + 16)) {
    return v6;
  }
  unint64_t v14 = sub_10007D8D0(2u);
  if ((v15 & 1) == 0) {
    return v6;
  }
  unint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
  if (!(v16 >> 62))
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = v6 + v17;
    if (!__OFADD__(v6, v17)) {
      return result;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t result = v6 + v20;
  if (__OFADD__(v6, v20))
  {
LABEL_17:
    __break(1u);
    return v6;
  }
  return result;
}

uint64_t sub_1000F7AE0(uint64_t result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue) & 1) == 0 && (result)
  {
    uint64_t v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC11Diagnostics11CardManager_changeQueue);
    uint64_t result = swift_beginAccess();
    if (*(void *)(*v2 + 16))
    {
      sub_1000FA5BC();
      id v3 = [self defaultCenter];
      if (qword_100182840 != -1) {
        swift_once();
      }
      uint64_t v4 = qword_10018A468;
      sub_10003AFD0((uint64_t *)&unk_100183A60);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100123B50;
      strcpy((char *)v8, "cardActionsKey");
      HIBYTE(v8[1]) = -18;
      AnyHashable.init<A>(_:)();
      uint64_t v6 = *v2;
      *(void *)(inited + 96) = sub_10003AFD0(&qword_100183E78);
      *(void *)(inited + 72) = v6;
      swift_bridgeObjectRetain();
      sub_1000783F4(inited);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v3 postNotificationName:v4 object:v1 userInfo:isa v8[0], v8[1]];

      *uint64_t v2 = (uint64_t)_swiftEmptyArrayStorage;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void **sub_1000F7CA8()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter];
  uint64_t v2 = qword_100182798;
  id v3 = v0;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)(qword_10018A3B0 + 24);
  char v5 = *(unsigned char *)(qword_10018A3B0 + 32);
  *(void *)uint64_t v1 = *(void *)(qword_10018A3B0 + 16);
  *((void *)v1 + 1) = v4;
  v1[16] = v5;
  v3[OBJC_IVAR____TtC11Diagnostics11CardManager_persistentOnly] = 1;
  uint64_t v6 = OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView;
  sub_10003AFD0(&qword_100186600);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100124AF0;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 40) = _swiftEmptyArrayStorage;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 56) = _swiftEmptyArrayStorage;
  *(unsigned char *)(inited + 64) = 2;
  *(void *)(inited + 72) = _swiftEmptyArrayStorage;
  unint64_t v8 = sub_100078AD4(inited);
  swift_setDeallocating();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10003AFD0(&qword_100186608);
  swift_arrayDestroy();
  *(void *)&v3[v6] = v8;
  uint64_t v9 = OBJC_IVAR____TtC11Diagnostics11CardManager_deviceManager;
  type metadata accessor for DeviceManager();
  swift_allocObject();
  sub_1000B3610();
  *(void *)&v3[v9] = v10;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics11CardManager_bySerialNumber] = _swiftEmptyDictionarySingleton;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics11CardManager_cardStates] = &_swiftEmptySetSingleton;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics11CardManager_cardCells] = _swiftEmptyDictionarySingleton;
  *(void *)&v3[OBJC_IVAR____TtC11Diagnostics11CardManager_changeQueue] = _swiftEmptyArrayStorage;
  v3[OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue] = 0;

  v49.receiver = v3;
  v49.Class super_class = (Class)type metadata accessor for CardManager();
  Class super_class = v49.super_class;
  id v11 = [super init];
  BOOL v12 = self;
  uint64_t v13 = (char *)v11;
  id v14 = [v12 defaultCenter];
  if (qword_100182808 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_10018A420;
  uint64_t v41 = OBJC_IVAR____TtC11Diagnostics11CardManager_deviceManager;
  uint64_t v16 = *(void *)&v13[OBJC_IVAR____TtC11Diagnostics11CardManager_deviceManager];
  uint64_t v17 = self;
  swift_retain();
  id v18 = [v17 mainQueue];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  Swift::Int v47 = (_UNKNOWN **)sub_10010053C;
  uint64_t v48 = v19;
  aBlock = _NSConcreteStackBlock;
  uint64_t v44 = 1107296256;
  uint64_t v45 = sub_10004FC1C;
  Class v46 = (Class)&unk_100154140;
  uint64_t v20 = _Block_copy(&aBlock);
  uint64_t v21 = v13;
  swift_release();
  id v22 = [v14 addObserverForName:v15 object:v16 queue:v18 usingBlock:v20];
  _Block_release(v20);
  swift_unknownObjectRelease();

  swift_release();
  id v23 = [v12 defaultCenter];
  if (qword_100182810 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_10018A428;
  uint64_t v25 = *(void *)&v13[v41];
  swift_retain();
  id v26 = [v17 mainQueue];
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v21;
  Swift::Int v47 = (_UNKNOWN **)sub_100100544;
  uint64_t v48 = v27;
  aBlock = _NSConcreteStackBlock;
  uint64_t v44 = 1107296256;
  uint64_t v45 = sub_10004FC1C;
  Class v46 = (Class)&unk_100154190;
  unint64_t v28 = _Block_copy(&aBlock);
  NSString v29 = v21;
  swift_release();
  id v30 = [v23 addObserverForName:v24 object:v25 queue:v26 usingBlock:v28];
  _Block_release(v28);
  swift_unknownObjectRelease();

  swift_release();
  id v31 = [v12 defaultCenter];
  if (qword_1001827A0 != -1) {
    swift_once();
  }
  uint64_t v32 = qword_10018A3B8;
  id v33 = [v17 mainQueue];
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v29;
  Swift::Int v47 = (_UNKNOWN **)sub_10010054C;
  uint64_t v48 = v34;
  aBlock = _NSConcreteStackBlock;
  uint64_t v44 = 1107296256;
  uint64_t v45 = sub_10004FC1C;
  Class v46 = (Class)&unk_1001541E0;
  uint64_t v35 = _Block_copy(&aBlock);
  uint64_t v36 = v29;
  swift_release();
  id v37 = [v31 addObserverForName:v32 object:0 queue:v33 usingBlock:v35];
  _Block_release(v35);
  swift_unknownObjectRelease();

  uint64_t v38 = *(void *)&v13[v41];
  Class v46 = super_class;
  Swift::Int v47 = &off_100153FB0;
  aBlock = v36;
  sub_10007F2E4((uint64_t)&aBlock, (uint64_t)v42);
  swift_beginAccess();
  swift_retain();
  sub_1000CAA9C((uint64_t)v42, v38 + 16, (uint64_t *)&unk_100184330);
  swift_endAccess();
  swift_release();
  return v36;
}

uint64_t sub_1000F8314()
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v1 = result;
    strcpy((char *)v6, "deviceStateKey");
    HIBYTE(v6[1]) = -18;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v1 + 16) && (unint64_t v2 = sub_10007D88C((uint64_t)v7), (v3 & 1) != 0))
    {
      sub_10003C5D8(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v8);
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10003C320((uint64_t)v7);
    if (*((void *)&v9 + 1))
    {
      sub_10003C374(0, &qword_100184340);
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        type metadata accessor for CardState();
        swift_allocObject();
        id v4 = v6[0];
        uint64_t v5 = sub_10005A898(v4);

        sub_1000F8B00(v5);
        return swift_release();
      }
    }
    else
    {
      return sub_10003C44C((uint64_t)&v8, &qword_100183E70);
    }
  }
  return result;
}

void sub_1000F8474()
{
  uint64_t v0 = Notification.userInfo.getter();
  if (v0)
  {
    uint64_t v1 = v0;
    strcpy((char *)v9, "deviceStateKey");
    HIBYTE(v9[1]) = -18;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v1 + 16) && (unint64_t v2 = sub_10007D88C((uint64_t)v10), (v3 & 1) != 0))
    {
      sub_10003C5D8(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v11);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10003C320((uint64_t)v10);
    if (*((void *)&v12 + 1))
    {
      sub_10003C374(0, &qword_100184340);
      if (swift_dynamicCast())
      {
        id v4 = [v9[0] serialNumber];
        uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v7 = v6;

        unint64_t v8 = sub_1000FAFB4(v5, v7);
        swift_bridgeObjectRelease();
        if (v8)
        {
          sub_1000F8E70(v8);
          swift_release();
        }
      }
    }
    else
    {
      sub_10003C44C((uint64_t)&v11, &qword_100183E70);
    }
  }
}

uint64_t sub_1000F85FC(uint64_t a1, uint64_t a2)
{
  if (qword_100182798 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(qword_10018A3B0 + 24);
  char v4 = *(unsigned char *)(qword_10018A3B0 + 32);
  uint64_t v5 = a2 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter;
  *(void *)uint64_t v5 = *(void *)(qword_10018A3B0 + 16);
  *(void *)(v5 + 8) = v3;
  *(unsigned char *)(v5 + 16) = v4;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v6 = *(unsigned char *)(a2 + OBJC_IVAR____TtC11Diagnostics11CardManager_persistentOnly);
  *(unsigned char *)(v5 + 16) = v6;
  uint64_t v7 = *(void *)v5;
  uint64_t v8 = *(void *)(v5 + 8);
  long long v9 = (uint64_t *)(a2 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardStates);
  swift_beginAccess();
  uint64_t v10 = *v9;
  long long v12 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10005A284(v10, v7, v8, v6, (unint64_t *)&v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000F8774(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v28 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v27 = (uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003AFD0(&qword_1001865D0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  long long v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  long long v12 = (char *)&v27 - v11;
  __chkstk_darwin(v10);
  id v14 = (char *)&v27 - v13;
  id v15 = [*(id *)(a1 + 40) serialNumber];
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  unint64_t v19 = sub_1000FAFB4(v16, v18);
  swift_bridgeObjectRelease();
  if (v19)
  {
    sub_100059728(a1);
    a1 = v19;
    if ((a2 & 0x20) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    swift_retain();
    if ((a2 & 0x20) == 0) {
      goto LABEL_9;
    }
  }
  uint64_t v20 = sub_1000FAD08(a1);
  if (v20 == 3) {
    goto LABEL_9;
  }
  int v21 = 1 << *(unsigned char *)(a1 + 32);
  if ((v21 & 0x1FE0) != 0)
  {
    if (!v20) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((v21 & 0xE) != 0)
  {
    if (v20 == 1) {
      goto LABEL_9;
    }
LABEL_8:
    sub_1000FA0B8(a1);
    goto LABEL_9;
  }
  if (v20 != 2) {
    goto LABEL_8;
  }
LABEL_9:
  if ((a2 & 4) != 0)
  {
    uint64_t v23 = v28;
    uint64_t v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
    if (*(unsigned char *)(a1 + 17) == 1)
    {
      sub_1000FB220(a1, (uint64_t)v14);
      if ((*v24)(v14, 1, v4) == 1)
      {
        swift_release();
        uint64_t v25 = (uint64_t)v14;
      }
      else
      {
        sub_10003C44C((uint64_t)v14, &qword_1001865D0);
        sub_1000F8FC8(a1, 1, 0, (uint64_t)v12);
        swift_release();
        uint64_t v25 = (uint64_t)v12;
      }
    }
    else
    {
      sub_1000FB220(a1, (uint64_t)v9);
      if ((*v24)(v9, 1, v4) == 1)
      {
        sub_10003C44C((uint64_t)v9, &qword_1001865D0);
        uint64_t v26 = v27;
        sub_1000F9664(a1, 1, v27);
        swift_release();
        return (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v26, v4);
      }
      swift_release();
      uint64_t v25 = (uint64_t)v9;
    }
    return sub_10003C44C(v25, &qword_1001865D0);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000F8B00(uint64_t a1)
{
  id v3 = [self defaultCenter];
  if (qword_100182780 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10018A3A8;
  id v5 = [self mainQueue];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v1;
  aBlock[4] = (unint64_t)sub_100100534;
  aBlock[5] = v6;
  aBlock[0] = (unint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (unint64_t)sub_10004FC1C;
  void aBlock[3] = (unint64_t)&unk_1001540F0;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = v1;
  swift_release();
  id v9 = [v3 addObserverForName:v4 object:a1 queue:v5 usingBlock:v7];
  _Block_release(v7);
  swift_unknownObjectRelease();

  uint64_t v10 = (uint64_t *)&v8[OBJC_IVAR____TtC11Diagnostics11CardManager_cardStates];
  swift_beginAccess();
  swift_retain();
  sub_1000B9570(&v15, a1);
  swift_endAccess();
  swift_release();
  uint64_t v11 = *(void *)&v8[OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter];
  uint64_t v12 = *(void *)&v8[OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter + 8];
  LOBYTE(v5) = v8[OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter + 16];
  uint64_t v13 = *v10;
  aBlock[0] = (unint64_t)_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10005A284(v13, v11, v12, (char)v5, aBlock);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000F8D54()
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v1 = result;
    strcpy((char *)v4, "changeInfoKey");
    HIWORD(v4[1]) = -4864;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v1 + 16) && (unint64_t v2 = sub_10007D88C((uint64_t)v5), (v3 & 1) != 0))
    {
      sub_10003C5D8(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
    }
    else
    {
      long long v6 = 0u;
      long long v7 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10003C320((uint64_t)v5);
    if (*((void *)&v7 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        sub_1000F8774(v4[0], v4[1]);
        return swift_release();
      }
    }
    else
    {
      return sub_10003C44C((uint64_t)&v6, &qword_100183E70);
    }
  }
  return result;
}

uint64_t sub_1000F8E70(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10003AFD0(&qword_1001865D0);
  __chkstk_darwin(v4 - 8);
  long long v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [self defaultCenter];
  if (qword_100182780 != -1) {
    swift_once();
  }
  [v7 removeObserver:v2 name:qword_10018A3A8 object:a1];

  swift_beginAccess();
  sub_1000B86EC(a1);
  swift_endAccess();
  swift_release();
  sub_1000F8FC8(a1, 1, 0, (uint64_t)v6);
  return sub_10003C44C((uint64_t)v6, &qword_1001865D0);
}

uint64_t sub_1000F8FC8@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  int v69 = a3;
  int v67 = a2;
  uint64_t v66 = type metadata accessor for Remove(0);
  __chkstk_darwin(v66);
  uint64_t v9 = (uint64_t *)&v60[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_10003AFD0(&qword_1001865D0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = &v60[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  uint64_t v15 = &v60[-v14];
  uint64_t v16 = type metadata accessor for IndexPath();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v19 = &v60[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000FB220(a1, (uint64_t)v15);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_10003C44C((uint64_t)v15, &qword_1001865D0);
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v68 = a1;
    int v21 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v17 + 32);
    uint64_t v64 = v17 + 32;
    uint64_t v65 = a4;
    int64_t v63 = v21;
    v21((uint64_t)v19, v15, v16);
    uint64_t v22 = OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue;
    uint64_t v23 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue);
    *(unsigned char *)(v4 + OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue) = 1;
    int v61 = v23;
    sub_1000F7AE0(v23);
    unint64_t v24 = IndexPath.section.getter();
    uint64_t v62 = v22;
    if (v24 > 2)
    {
      unint64_t v26 = 0;
      unsigned __int8 v25 = 2;
    }
    else
    {
      unsigned __int8 v25 = v24;
      unint64_t v26 = IndexPath.row.getter();
    }
    uint64_t v27 = (uint64_t *)(v4 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
    swift_beginAccess();
    uint64_t v28 = *v27;
    if (*(void *)(*v27 + 16))
    {
      unint64_t v29 = sub_10007D8D0(v25);
      if (v30)
      {
        uint64_t v74 = *(void *)(*(void *)(v28 + 56) + 8 * v29);
        swift_bridgeObjectRetain();
        sub_1000F7470(v26, (uint64_t (*)(uint64_t))sub_100039FF0);
        swift_release();
        uint64_t v31 = v74;
        swift_beginAccess();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v73 = *v27;
        *uint64_t v27 = 0x8000000000000000;
        sub_1000FEE6C(v31, v25, isUniquelyReferenced_nonNull_native);
        *uint64_t v27 = v73;
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_1000F7748();
        id v33 = *(void **)(v68 + 40);
        id v34 = [v33 serialNumber];
        uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v37 = v36;

        swift_beginAccess();
        sub_1000FC800(v35, v37, (uint64_t)v13);
        sub_10003C44C((uint64_t)v13, &qword_1001865D0);
        swift_endAccess();
        swift_bridgeObjectRelease();
        if (v67)
        {
          id v38 = [v33 serialNumber];
          uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v41 = v40;

          uint64_t v42 = v66;
          (*(void (**)(char *, unsigned char *, uint64_t))(v17 + 16))((char *)v9 + *(int *)(v66 + 20), v19, v16);
          uint64_t *v9 = v39;
          v9[1] = v41;
          int64_t v43 = (void **)(v5 + OBJC_IVAR____TtC11Diagnostics11CardManager_changeQueue);
          swift_beginAccess();
          uint64_t v44 = *v43;
          char v45 = swift_isUniquelyReferenced_nonNull_native();
          *int64_t v43 = v44;
          if ((v45 & 1) == 0)
          {
            uint64_t v44 = sub_1000A045C(0, v44[2] + 1, 1, v44);
            *int64_t v43 = v44;
          }
          unint64_t v47 = v44[2];
          unint64_t v46 = v44[3];
          if (v47 >= v46 >> 1)
          {
            uint64_t v44 = sub_1000A045C((void *)(v46 > 1), v47 + 1, 1, v44);
            *int64_t v43 = v44;
          }
          uint64_t v71 = v42;
          id v72 = &off_100154208;
          uint64_t v48 = sub_1000AD47C((uint64_t *)&v70);
          sub_10010044C((uint64_t)v9, (uint64_t)v48, type metadata accessor for Remove);
          v44[2] = v47 + 1;
          sub_100084AE8(&v70, (uint64_t)&v44[5 * v47 + 4]);
          sub_1001004B4((uint64_t)v9, type metadata accessor for Remove);
          swift_endAccess();
        }
      }
    }
    if (qword_1001827C8 != -1) {
      swift_once();
    }
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_100124AF0;
    id v50 = [*(id *)(v68 + 40) serialNumber];
    uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v53 = v52;

    *(void *)(v49 + 56) = &type metadata for String;
    *(void *)(v49 + 64) = sub_10004D9B4();
    *(void *)(v49 + 32) = v51;
    *(void *)(v49 + 40) = v53;
    uint64_t v54 = IndexPath.section.getter();
    *(void *)(v49 + 96) = &type metadata for Int;
    *(void *)(v49 + 104) = &protocol witness table for Int;
    *(void *)(v49 + 72) = v54;
    uint64_t v55 = IndexPath.row.getter();
    *(void *)(v49 + 136) = &type metadata for Int;
    *(void *)(v49 + 144) = &protocol witness table for Int;
    *(void *)(v49 + 112) = v55;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    uint64_t v56 = *(unsigned __int8 *)(v5 + v62);
    *(unsigned char *)(v5 + v62) = v61;
    sub_1000F7AE0(v56);
    if ((v69 & 1) == 0)
    {
      swift_beginAccess();
      unint64_t v57 = swift_retain();
      uint64_t v58 = (void *)sub_1000FC9A8(v57);
      swift_endAccess();
      swift_release();
    }
    a4 = v65;
    v63(v65, v19, v16);
    uint64_t v20 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a4, v20, 1, v16);
}

uint64_t sub_1000F9664@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v89 = a2;
  uint64_t v90 = type metadata accessor for Add(0);
  __chkstk_darwin(v90);
  id v91 = (uint64_t *)((char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(unsigned __int8 *)(v3 + OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue);
  uint64_t v93 = OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue) = 1;
  int v92 = v7;
  sub_1000F7AE0(v7);
  uint64_t v100 = a1;
  uint64_t v8 = byte_100126C56[*(char *)(a1 + 32)];
  uint64_t v95 = v3;
  uint64_t v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
  swift_beginAccess();
  id v88 = v9;
  uint64_t v10 = *v9;
  uint64_t v11 = &selRef_beginUpload;
  if (!*(void *)(v10 + 16) || (unint64_t v12 = sub_10007D8D0(v8), (v13 & 1) == 0))
  {
LABEL_74:
    IndexPath.init(row:section:)();
    if (qword_1001827C8 != -1) {
      swift_once();
    }
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v62 = swift_allocObject();
    *(_OWORD *)(v62 + 16) = xmmword_100124AF0;
    int64_t v63 = *(void **)(v100 + 40);
    id v64 = [v63 v11[449]];
    uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v67 = v66;

    *(void *)(v62 + 56) = &type metadata for String;
    *(void *)(v62 + 64) = sub_10004D9B4();
    *(void *)(v62 + 32) = v65;
    *(void *)(v62 + 40) = v67;
    uint64_t v68 = a3;
    uint64_t v69 = IndexPath.section.getter();
    *(void *)(v62 + 96) = &type metadata for Int;
    *(void *)(v62 + 104) = &protocol witness table for Int;
    *(void *)(v62 + 72) = v69;
    uint64_t v70 = IndexPath.row.getter();
    *(void *)(v62 + 136) = &type metadata for Int;
    *(void *)(v62 + 144) = &protocol witness table for Int;
    *(void *)(v62 + 112) = v70;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    if (v89)
    {
      id v71 = [v63 v11[449]];
      uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v74 = v73;

      id v75 = v91;
      id v76 = (char *)v91 + *(int *)(v90 + 20);
      uint64_t v77 = type metadata accessor for IndexPath();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v77 - 8) + 16))(v76, v68, v77);
      *id v75 = v72;
      v75[1] = v74;
      id v78 = (void **)(v95 + OBJC_IVAR____TtC11Diagnostics11CardManager_changeQueue);
      swift_beginAccess();
      id v79 = *v78;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      void *v78 = v79;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        id v79 = sub_1000A045C(0, v79[2] + 1, 1, v79);
        void *v78 = v79;
      }
      unint64_t v82 = v79[2];
      unint64_t v81 = v79[3];
      if (v82 >= v81 >> 1)
      {
        id v79 = sub_1000A045C((void *)(v81 > 1), v82 + 1, 1, v79);
        void *v78 = v79;
      }
      uint64_t v103 = v90;
      NSString v104 = &off_100154210;
      id v83 = sub_1000AD47C((uint64_t *)&v102);
      uint64_t v84 = (uint64_t)v91;
      sub_10010044C((uint64_t)v91, (uint64_t)v83, type metadata accessor for Add);
      v79[2] = v82 + 1;
      sub_100084AE8(&v102, (uint64_t)&v79[5 * v82 + 4]);
      sub_1001004B4(v84, type metadata accessor for Add);
      swift_endAccess();
    }
    uint64_t v85 = *(unsigned __int8 *)(v95 + v93);
    *(unsigned char *)(v95 + v93) = v92;
    return sub_1000F7AE0(v85);
  }
  unint64_t v14 = *(void *)(*(void *)(v10 + 56) + 8 * v12);
  unint64_t v105 = v14;
  unint64_t v99 = v14;
  uint64_t v87 = v8;
  if (v14 >> 62)
  {
LABEL_66:
    swift_bridgeObjectRetain_n();
    uint64_t v56 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    BOOL v57 = v56 < 1;
    unint64_t v14 = v99;
    if (!v57)
    {
      swift_bridgeObjectRetain();
      uint64_t v58 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v98 = v58;
      if (v58) {
        goto LABEL_5;
      }
      swift_bridgeObjectRelease();
      goto LABEL_72;
    }
LABEL_69:
    swift_bridgeObjectRelease();
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
LABEL_72:
    uint64_t v94 = 0;
LABEL_73:
    uint64_t v59 = v105;
    uint64_t v60 = v88;
    swift_beginAccess();
    char v61 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v101 = *v60;
    *uint64_t v60 = 0x8000000000000000;
    sub_1000FEE6C(v59, v87, v61);
    *uint64_t v60 = v101;
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_1000F7748();
    goto LABEL_74;
  }
  uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  uint64_t v98 = v15;
  if (!v15) {
    goto LABEL_69;
  }
LABEL_5:
  uint64_t v86 = a3;
  uint64_t v94 = 0;
  a3 = v100;
  uint64_t v96 = *(void *)(v100 + 48);
  unint64_t v97 = v14 & 0xC000000000000001;
  uint64_t v16 = 4;
  while (1)
  {
    uint64_t v17 = v16 - 4;
    if (v97)
    {
      unint64_t v18 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v19 = v16 - 3;
      if (__OFADD__(v17, 1)) {
        goto LABEL_60;
      }
    }
    else
    {
      unint64_t v18 = *(void *)(v14 + 8 * v16);
      swift_retain();
      uint64_t v19 = v16 - 3;
      if (__OFADD__(v17, 1))
      {
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
    }
    uint64_t v20 = *(void *)(v18 + 48);
    if (*(void *)(v20 + 16) < 2uLL) {
      goto LABEL_61;
    }
    unint64_t v21 = *(void *)(v20 + 56);
    if (v21 > 8) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = qword_100126C68[v21];
    }
    if (*(void *)(v96 + 16) < 2uLL) {
      goto LABEL_62;
    }
    unint64_t v23 = *(void *)(v96 + 56);
    if (v23 > 8)
    {
      uint64_t v24 = 0;
      if (v21 > 8)
      {
LABEL_20:
        unint64_t v25 = 0;
        if (v23 > 8) {
          goto LABEL_21;
        }
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v24 = qword_100126C68[v23];
      if (v21 > 8) {
        goto LABEL_20;
      }
    }
    unint64_t v25 = qword_100126CB0[v21];
    if (v23 > 8)
    {
LABEL_21:
      unint64_t v26 = 0;
      if (v22 != v24) {
        goto LABEL_22;
      }
      goto LABEL_27;
    }
LABEL_26:
    unint64_t v26 = qword_100126CB0[v23];
    if (v22 != v24)
    {
LABEL_22:
      if (v26 < v25) {
        break;
      }
      goto LABEL_31;
    }
LABEL_27:
    id v27 = [*(id *)(v18 + 40) v11[449] v86 v87];
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v30 = v29;

    id v31 = [*(id *)(a3 + 40) v11[449]];
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v34 = v33;

    if (v32 == v28 && v34 == v30)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_31;
    }
    char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v35) {
      break;
    }
LABEL_31:
    unint64_t v36 = v105;
    if (v105 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
      if (!v37)
      {
LABEL_6:
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v37 = *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v37) {
        goto LABEL_6;
      }
    }
    unint64_t v38 = v37 - 1;
    if (__OFSUB__(v37, 1)) {
      goto LABEL_63;
    }
    if ((v36 & 0xC000000000000001) != 0)
    {
      uint64_t v39 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if ((v38 & 0x8000000000000000) != 0) {
        goto LABEL_64;
      }
      if (v38 >= *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_65;
      }
      uint64_t v39 = *(void *)(v36 + 8 * v38 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v40 = *(void **)(v39 + 40);
    swift_retain();
    swift_retain();
    id v41 = [v40 v11[449]];
    uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v44 = v43;

    char v45 = v11;
    id v46 = [*(id *)(v18 + 40) v11[449]];
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v49 = v48;

    if (v42 == v47 && v44 == v49)
    {
      swift_release_n();
      swift_release();
      swift_bridgeObjectRelease_n();
LABEL_42:
      uint64_t v11 = v45;
      if (v105 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v94 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v94 = *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      a3 = v100;
      swift_retain();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_release();
      goto LABEL_7;
    }
    char v50 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_release_n();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v50) {
      goto LABEL_42;
    }
    swift_release();
    uint64_t v11 = v45;
    a3 = v100;
LABEL_7:
    unint64_t v14 = v99;
    ++v16;
    if (v19 == v98)
    {
      swift_bridgeObjectRelease();
      a3 = v86;
      goto LABEL_73;
    }
  }
  unint64_t v51 = v105;
  swift_bridgeObjectRetain();
  uint64_t v94 = sub_1000F6FA0(v18, v51);
  char v53 = v52;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v53 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    a3 = v86;
    if (v51 >> 62)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v55 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v55 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_retain();
    }
    uint64_t result = v94;
    if (v55 < v94)
    {
      __break(1u);
    }
    else if ((v94 & 0x8000000000000000) == 0)
    {
      sub_10003A5E4(v94, v94, v100);
      swift_release();
      goto LABEL_73;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000FA0B8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v54 = type metadata accessor for Move(0);
  __chkstk_darwin(v54);
  char v53 = (uint64_t *)&v47[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_10003AFD0(&qword_1001865D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = &v47[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v12 = &v47[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  unint64_t v14 = &v47[-v13];
  uint64_t v15 = OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue;
  uint64_t v16 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11Diagnostics11CardManager_freezeChangeQueue) = 1;
  sub_1000F7AE0(v16);
  sub_1000F8FC8(a1, 0, 1, (uint64_t)v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_10003C44C((uint64_t)v7, &qword_1001865D0);
  }
  int v48 = v16;
  uint64_t v49 = v15;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32))(v14, v7, v8);
  sub_1000F9664(a1, 0, (uint64_t)v12);
  uint64_t v52 = v9;
  if (qword_1001827C8 != -1) {
    swift_once();
  }
  sub_10003AFD0((uint64_t *)&unk_1001836E0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100124AE0;
  uint64_t v19 = *(void **)(a1 + 40);
  id v20 = [v19 serialNumber];
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;

  *(void *)(v18 + 56) = &type metadata for String;
  *(void *)(v18 + 64) = sub_10004D9B4();
  *(void *)(v18 + 32) = v21;
  *(void *)(v18 + 40) = v23;
  uint64_t v24 = IndexPath.section.getter();
  *(void *)(v18 + 96) = &type metadata for Int;
  *(void *)(v18 + 104) = &protocol witness table for Int;
  *(void *)(v18 + 72) = v24;
  uint64_t v25 = IndexPath.row.getter();
  *(void *)(v18 + 136) = &type metadata for Int;
  *(void *)(v18 + 144) = &protocol witness table for Int;
  *(void *)(v18 + 112) = v25;
  uint64_t v26 = IndexPath.section.getter();
  *(void *)(v18 + 176) = &type metadata for Int;
  *(void *)(v18 + 184) = &protocol witness table for Int;
  *(void *)(v18 + 152) = v26;
  uint64_t v27 = IndexPath.row.getter();
  *(void *)(v18 + 216) = &type metadata for Int;
  *(void *)(v18 + 224) = &protocol witness table for Int;
  *(void *)(v18 + 192) = v27;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
  id v28 = [v19 serialNumber];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v30;

  uint64_t v32 = v53;
  uint64_t v33 = v54;
  uint64_t v34 = (char *)v53 + *(int *)(v54 + 20);
  char v35 = *(void (**)(char *, unsigned char *, uint64_t))(v52 + 16);
  char v50 = v14;
  v35(v34, v14, v8);
  unint64_t v36 = (char *)v32 + *(int *)(v33 + 24);
  unint64_t v51 = v12;
  v35(v36, v12, v8);
  *uint64_t v32 = v29;
  v32[1] = v31;
  uint64_t v37 = (void **)(v2 + OBJC_IVAR____TtC11Diagnostics11CardManager_changeQueue);
  swift_beginAccess();
  unint64_t v38 = *v37;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v37 = v38;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v38 = sub_1000A045C(0, v38[2] + 1, 1, v38);
    *uint64_t v37 = v38;
  }
  unint64_t v41 = v38[2];
  unint64_t v40 = v38[3];
  uint64_t v42 = v49;
  if (v41 >= v40 >> 1)
  {
    unint64_t v38 = sub_1000A045C((void *)(v40 > 1), v41 + 1, 1, v38);
    *uint64_t v37 = v38;
  }
  uint64_t v56 = v54;
  BOOL v57 = &off_100154218;
  uint64_t v43 = sub_1000AD47C((uint64_t *)&v55);
  uint64_t v44 = v53;
  sub_10010044C((uint64_t)v53, (uint64_t)v43, type metadata accessor for Move);
  v38[2] = v41 + 1;
  sub_100084AE8(&v55, (uint64_t)&v38[5 * v41 + 4]);
  sub_1001004B4((uint64_t)v44, type metadata accessor for Move);
  swift_endAccess();
  uint64_t v45 = *(unsigned __int8 *)(v2 + v42);
  *(unsigned char *)(v2 + v42) = v48;
  sub_1000F7AE0(v45);
  id v46 = *(void (**)(unsigned char *, uint64_t))(v52 + 8);
  v46(v51, v8);
  return ((uint64_t (*)(unsigned char *, uint64_t))v46)(v50, v8);
}

uint64_t sub_1000FA5BC()
{
  uint64_t v1 = type metadata accessor for IndexPath();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10003AFD0(&qword_1001865D0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v75 = (char *)&v64 - v9;
  uint64_t v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
  swift_beginAccess();
  uint64_t v11 = *v10;
  uint64_t v12 = *(void *)(*v10 + 64);
  uint64_t v65 = *v10 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v69 = v14 & v12;
  uint64_t v15 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_bySerialNumber);
  int64_t v66 = (unint64_t)(v13 + 63) >> 6;
  unint64_t v81 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
  uint64_t v73 = (void (**)(char *, uint64_t, uint64_t))(v2 + 32);
  uint64_t v74 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  uint64_t v72 = v2;
  uint64_t v70 = v2 + 40;
  uint64_t v67 = v11;
  swift_bridgeObjectRetain();
  int64_t v16 = 0;
  id v71 = v8;
  NSString v80 = v15;
  while (1)
  {
    if (v69)
    {
      unint64_t v17 = __clz(__rbit64(v69));
      v69 &= v69 - 1;
      unint64_t v18 = v17 | (v16 << 6);
    }
    else
    {
      int64_t v19 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        goto LABEL_54;
      }
      if (v19 >= v66) {
        return swift_release();
      }
      unint64_t v20 = *(void *)(v65 + 8 * v19);
      ++v16;
      if (!v20)
      {
        int64_t v16 = v19 + 1;
        if (v19 + 1 >= v66) {
          return swift_release();
        }
        unint64_t v20 = *(void *)(v65 + 8 * v16);
        if (!v20)
        {
          int64_t v16 = v19 + 2;
          if (v19 + 2 >= v66) {
            return swift_release();
          }
          unint64_t v20 = *(void *)(v65 + 8 * v16);
          if (!v20)
          {
            int64_t v21 = v19 + 3;
            if (v21 >= v66) {
              return swift_release();
            }
            unint64_t v20 = *(void *)(v65 + 8 * v21);
            if (!v20)
            {
              while (1)
              {
                int64_t v16 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_55;
                }
                if (v16 >= v66) {
                  return swift_release();
                }
                unint64_t v20 = *(void *)(v65 + 8 * v16);
                ++v21;
                if (v20) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v16 = v21;
          }
        }
      }
LABEL_20:
      unint64_t v69 = (v20 - 1) & v20;
      unint64_t v18 = __clz(__rbit64(v20)) + (v16 << 6);
    }
    int64_t v68 = v16;
    uint64_t v22 = *(void *)(v67 + 56);
    uint64_t v79 = *(unsigned __int8 *)(*(void *)(v67 + 48) + v18);
    unint64_t v23 = *(void *)(v22 + 8 * v18);
    if (v23 >> 62) {
      break;
    }
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v24) {
      goto LABEL_23;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    int64_t v16 = v68;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_4;
  }
LABEL_23:
  unint64_t v77 = v23;
  unint64_t v78 = v23 & 0xC000000000000001;
  uint64_t v25 = 4;
  uint64_t v76 = v24;
  while (1)
  {
    uint64_t v28 = v25 - 4;
    if (!v78) {
      break;
    }
    uint64_t v29 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    uint64_t v30 = v25 - 3;
    if (__OFADD__(v28, 1)) {
      goto LABEL_51;
    }
LABEL_32:
    uint64_t v82 = v30;
    uint64_t v83 = v29;
    id v31 = [*(id *)(v29 + 40) serialNumber];
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v34 = v33;

    char v35 = v80;
    uint64_t v36 = (uint64_t)v75;
    IndexPath.init(row:section:)();
    uint64_t v37 = *v81;
    (*v81)((char *)v36, 0, 1, v1);
    swift_beginAccess();
    if ((*v74)(v36, 1, v1) == 1)
    {
      unint64_t v38 = v4;
      sub_10003C44C(v36, &qword_1001865D0);
      swift_bridgeObjectRetain();
      unint64_t v39 = sub_10007D7FC(v32, v34);
      char v41 = v40;
      swift_bridgeObjectRelease();
      if (v41)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v43 = *v35;
        uint64_t v84 = (void *)*v35;
        *char v35 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1000FF6B4();
          uint64_t v43 = (uint64_t)v84;
        }
        swift_bridgeObjectRelease();
        (*(void (**)(char *, unint64_t, uint64_t))(v72 + 32))(v8, *(void *)(v43 + 56) + *(void *)(v72 + 72) * v39, v1);
        sub_1000FE63C(v39, v43);
        *char v35 = v43;
        swift_bridgeObjectRelease();
        uint64_t v26 = 0;
      }
      else
      {
        uint64_t v26 = 1;
      }
      uint64_t v27 = v76;
      v37(v8, v26, 1, v1);
      swift_bridgeObjectRelease();
      sub_10003C44C((uint64_t)v8, &qword_1001865D0);
      uint64_t v4 = v38;
    }
    else
    {
      uint64_t v44 = *v73;
      uint64_t v45 = v4;
      id v46 = v4;
      uint64_t v47 = v1;
      (*v73)(v46, v36, v1);
      int v48 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v84 = (void *)*v35;
      uint64_t v49 = v84;
      *char v35 = 0x8000000000000000;
      unint64_t v51 = sub_10007D7FC(v32, v34);
      uint64_t v52 = v49[2];
      BOOL v53 = (v50 & 1) == 0;
      uint64_t v54 = v52 + v53;
      if (__OFADD__(v52, v53)) {
        goto LABEL_52;
      }
      char v55 = v50;
      if (v49[3] >= v54)
      {
        if ((v48 & 1) == 0) {
          sub_1000FF6B4();
        }
      }
      else
      {
        sub_1000FDA60(v54, v48);
        unint64_t v56 = sub_10007D7FC(v32, v34);
        if ((v55 & 1) != (v57 & 1)) {
          goto LABEL_56;
        }
        unint64_t v51 = v56;
      }
      uint64_t v1 = v47;
      uint64_t v58 = v84;
      uint64_t v4 = v45;
      if (v55)
      {
        (*(void (**)(unint64_t, char *, uint64_t))(v72 + 40))(v84[7] + *(void *)(v72 + 72) * v51, v45, v1);
      }
      else
      {
        v84[(v51 >> 6) + 8] |= 1 << v51;
        uint64_t v59 = (uint64_t *)(v58[6] + 16 * v51);
        *uint64_t v59 = v32;
        v59[1] = v34;
        v44((char *)(v58[7] + *(void *)(v72 + 72) * v51), (uint64_t)v45, v1);
        uint64_t v60 = v58[2];
        BOOL v61 = __OFADD__(v60, 1);
        uint64_t v62 = v60 + 1;
        if (v61) {
          goto LABEL_53;
        }
        v58[2] = v62;
        swift_bridgeObjectRetain();
      }
      *NSString v80 = (uint64_t)v84;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v8 = v71;
      uint64_t v27 = v76;
    }
    swift_endAccess();
    swift_release();
    ++v25;
    if (v82 == v27) {
      goto LABEL_4;
    }
  }
  uint64_t v29 = swift_retain();
  uint64_t v30 = v25 - 3;
  if (!__OFADD__(v28, 1)) {
    goto LABEL_32;
  }
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000FAD08(uint64_t a1)
{
  uint64_t v2 = sub_10003AFD0(&qword_1001865D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000FB220(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10003C44C((uint64_t)v4, &qword_1001865D0);
    return 3;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    unint64_t v10 = IndexPath.section.getter();
    if (v10 > 2)
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = v10;
      IndexPath.row.getter();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

unint64_t sub_1000FAEB8()
{
  unint64_t v1 = IndexPath.section.getter();
  if (v1 > 2)
  {
    unint64_t v3 = 0;
    unsigned __int8 v2 = 2;
  }
  else
  {
    unsigned __int8 v2 = v1;
    unint64_t v3 = IndexPath.row.getter();
  }
  uint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
  swift_beginAccess();
  uint64_t v5 = *v4;
  if (!*(void *)(v5 + 16)) {
    return 0;
  }
  unint64_t result = sub_10007D8D0(v2);
  if ((v7 & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * result);
  if ((v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    swift_bridgeObjectRelease();
    return v9;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v9 = *(void *)(v8 + 8 * v3 + 32);
    swift_retain();
    return v9;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000FAFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10003AFD0(&qword_1001865D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t *)(v3 + OBJC_IVAR____TtC11Diagnostics11CardManager_bySerialNumber);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if (*(void *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_10007D7FC(a1, a2);
    if (v16)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, *(void *)(v14 + 56) + *(void *)(v10 + 72) * v15, v9);
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v17, 1, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
      unint64_t v18 = sub_1000FAEB8();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return v18;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  sub_10003C44C((uint64_t)v8, &qword_1001865D0);
  return 0;
}

uint64_t sub_1000FB220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [*(id *)(a1 + 40) serialNumber];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC11Diagnostics11CardManager_bySerialNumber);
  swift_beginAccess();
  uint64_t v9 = *v8;
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_10007D7FC(v5, v7);
    if (v11)
    {
      unint64_t v12 = v10;
      uint64_t v13 = *(void *)(v9 + 56);
      uint64_t v14 = type metadata accessor for IndexPath();
      uint64_t v15 = *(void *)(v14 - 8);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 16))(a2, v13 + *(void *)(v15 + 72) * v12, v14);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a2, 0, 1, v14);
    }
    else
    {
      uint64_t v17 = type metadata accessor for IndexPath();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a2, 1, 1, v17);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = type metadata accessor for IndexPath();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
  return swift_bridgeObjectRelease();
}

id sub_1000FB414()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for CardManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CardManager()
{
  return self;
}

uint64_t sub_1000FB514(char *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  *(void *)&a1[OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState] = a2;
  swift_retain_n();
  swift_release();
  sub_100084C80();
  swift_release();
  uint64_t v7 = *(void *)(v4 + OBJC_IVAR____TtC11Diagnostics11CardManager_deviceManager);
  v22[3] = type metadata accessor for DeviceManager();
  v22[4] = &off_1001523C0;
  v22[0] = v7;
  uint64_t v8 = (uint64_t)&a1[OBJC_IVAR____TtC11Diagnostics12CardViewCell_controller];
  swift_beginAccess();
  swift_retain();
  sub_1000CAA9C((uint64_t)v22, v8, (uint64_t *)&unk_1001858E0);
  swift_endAccess();
  [a1 setClipsToBounds:1];
  uint64_t v9 = self;
  id v10 = [v9 clearColor];
  [a1 setBackgroundColor:v10];

  id v11 = [a1 contentView];
  id v12 = [v9 clearColor];
  [v11 setBackgroundColor:v12];

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  uint64_t v14 = (uint64_t *)&a1[OBJC_IVAR____TtC11Diagnostics12CardViewCell_layoutUpdateHandler];
  uint64_t v15 = *(void *)&a1[OBJC_IVAR____TtC11Diagnostics12CardViewCell_layoutUpdateHandler];
  *uint64_t v14 = (uint64_t)sub_1001003A4;
  v14[1] = v13;
  id v16 = a3;
  swift_retain();
  sub_10003B0B8(v15);
  uint64_t v17 = *v14;
  uint64_t v18 = v14[1];
  int64_t v19 = (uint64_t *)(*(void *)&a1[OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView]
                  + OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler);
  uint64_t v20 = *v19;
  *int64_t v19 = *v14;
  v19[1] = v18;
  sub_10003AF68(v17);
  sub_10003B0B8(v20);
  return swift_release();
}

char *sub_1000FB738(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (IndexPath.section.getter())
  {
    if (qword_1001827C8 != -1) {
      swift_once();
    }
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100123B50;
    uint64_t v7 = sub_1000598A4();
    uint64_t v9 = v8;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_10004D9B4();
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v9;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    id v10 = objc_allocWithZone((Class)type metadata accessor for CardViewSessionCell());
  }
  else
  {
    if (qword_1001827C8 != -1) {
      swift_once();
    }
    sub_10003AFD0((uint64_t *)&unk_1001836E0);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_100123B50;
    uint64_t v12 = sub_1000598A4();
    uint64_t v14 = v13;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_10004D9B4();
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v14;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    id v10 = objc_allocWithZone((Class)type metadata accessor for CardViewPersistentCell());
  }
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = (char *)[v10 initWithStyle:0 reuseIdentifier:v15];

  sub_1000FB514(v16, a1, a4);
  return v16;
}

uint64_t sub_1000FB988(void *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = self;
  v7[4] = sub_1001003AC;
  v7[5] = v2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  uint64_t v7[2] = sub_1000358AC;
  v7[3] = &unk_1001540A0;
  uint64_t v4 = _Block_copy(v7);
  id v5 = a1;
  swift_retain();
  swift_release();
  [v3 animateWithDuration:0 delay:v4 options:0 animations:0.25 completion:0.0];
  _Block_release(v4);
  return swift_release();
}

id sub_1000FBA9C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1001827C8 != -1) {
    swift_once();
  }
  sub_10003AFD0((uint64_t *)&unk_1001836E0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100123B50;
  uint64_t v11 = IndexPath.description.getter();
  uint64_t v13 = v12;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_10004D9B4();
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v13;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
  unint64_t v14 = sub_1000FAEB8();
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = (uint64_t *)(v3 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardCells);
    swift_beginAccess();
    uint64_t v17 = *v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = swift_retain();
    int64_t v19 = sub_1000F6C44(v18, v17);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    if (!v19) {
      int64_t v19 = sub_1000FB738(v15, (uint64_t)v9, v3, a1);
    }
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    swift_beginAccess();
    swift_retain();
    id v20 = v19;
    sub_1000FCB0C((uint64_t)v20, v15);
    swift_endAccess();
    swift_release_n();
    return v20;
  }
  else
  {
    id v22 = objc_allocWithZone((Class)UITableViewCell);
    return [v22 init];
  }
}

uint64_t sub_1000FC014@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC11Diagnostics11CardManager_bySerialNumber);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_10007D7FC(a1, a2);
    if (v10)
    {
      unint64_t v11 = v9;
      uint64_t v12 = *(void *)(v8 + 56);
      uint64_t v13 = type metadata accessor for IndexPath();
      uint64_t v14 = *(void *)(v13 - 8);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 16))(a3, v12 + *(void *)(v14 + 72) * v11, v13);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
    }
    else
    {
      uint64_t v17 = type metadata accessor for IndexPath();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a3, 1, 1, v17);
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = type metadata accessor for IndexPath();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a3, 1, 1, v15);
  }
}

uint64_t sub_1000FC348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v10 = sub_10003AFD0(&qword_1001865D0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for IndexPath();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (uint64_t *)(a1 + OBJC_IVAR____TtC11Diagnostics11CardManager_bySerialNumber);
  swift_beginAccess();
  uint64_t v18 = *v17;
  if (!*(void *)(v18 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_7:
    sub_10003C44C((uint64_t)v12, &qword_1001865D0);
    return a4(1);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v19 = sub_10007D7FC(a2, a3);
  if (v20)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v12, *(void *)(v18 + 56) + *(void *)(v14 + 72) * v19, v13);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v21, 1, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  unint64_t v23 = sub_1000FAEB8();
  if (v23)
  {
    unint64_t v24 = v23;
    type metadata accessor for CardState();
    swift_allocObject();
    uint64_t v25 = swift_retain();
    uint64_t v26 = sub_100058D58(v25);
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = a4;
    v27[3] = a5;
    v27[4] = v24;
    uint64_t v28 = *(void *)(v26 + 56);
    *(void *)(v26 + 56) = sub_100100124;
    *(void *)(v26 + 64) = v27;
    swift_retain();
    swift_retain();
    sub_10003B0B8(v28);
    char v29 = *(unsigned char *)(v26 + 19);
    *(unsigned char *)(v26 + 19) = 1;
    if ((v29 & 1) == 0)
    {
      uint64_t v30 = *(void *)(v26 + 80);
      if ((v30 & 8) == 0) {
        *(void *)(v26 + 80) = v30 | 8;
      }
      sub_100059388();
    }
    sub_100059728(v26);
    swift_release();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    return swift_release();
  }
  else
  {
    a4(1);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

uint64_t sub_1000FC6B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t), uint64_t a8)
{
  return sub_1000FFCC4(a4, a5, a6, a7, a8);
}

uint64_t sub_1000FC6F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

BOOL sub_1000FC700(uint64_t a1)
{
  return (a1 & 0xC000000000000001) == 0;
}

unint64_t sub_1000FC70C(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1000FC730(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10007D7FC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000FF334();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1000FE464(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000FC800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10007D7FC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000FF6B4();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for IndexPath();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_1000FE63C(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for IndexPath();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_1000FC9A8(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_10007DAAC(a1);
    char v12 = v11;
    swift_bridgeObjectRelease();
    if (v12)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v8 = *v2;
      Swift::Int v16 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1000FF978();
        Swift::Int v8 = v16;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = *v2;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v6 = __CocoaDictionary.lookup(_:)();
  swift_release();
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v7 = __CocoaDictionary.count.getter();
  Swift::Int v8 = sub_1000FCBC0(v5, v7);
  swift_retain();
  a1 = sub_10007DAAC(a1);
  char v10 = v9;
  swift_release();
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:
  swift_release();
  uint64_t v14 = *(void *)(*(void *)(v8 + 56) + 8 * a1);
  sub_1000FE84C(a1, v8);
  *uint64_t v2 = v8;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1000FCB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = __CocoaDictionary.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v3 = sub_1000FCBC0(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  Swift::Int v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1000FED08(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000FCBC0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10003AFD0((uint64_t *)&unk_1001865D8);
    uint64_t v2 = static _DictionaryStorage.convert(_:capacity:)();
    uint64_t v22 = v2;
    __CocoaDictionary.makeIterator()();
    if (__CocoaDictionary.Iterator.next()())
    {
      uint64_t v4 = v3;
      type metadata accessor for CardState();
      do
      {
        swift_dynamicCast();
        type metadata accessor for CardViewCell();
        swift_dynamicCast();
        uint64_t v2 = v22;
        unint64_t v15 = *(void *)(v22 + 16);
        if (*(void *)(v22 + 24) <= v15)
        {
          sub_1000FDE48(v15 + 1, 1);
          uint64_t v2 = v22;
        }
        Hasher.init(_seed:)();
        id v5 = [*(id *)(v21 + 40) serialNumber:v4];
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        String.hash(into:)();
        swift_bridgeObjectRelease();
        Swift::Int result = Hasher._finalize()();
        uint64_t v7 = v2 + 64;
        uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v9 = result & ~v8;
        unint64_t v10 = v9 >> 6;
        if (((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6))) != 0)
        {
          unint64_t v11 = __clz(__rbit64((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v16 = 0;
          unint64_t v17 = (unint64_t)(63 - v8) >> 6;
          do
          {
            if (++v10 == v17 && (v16 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v18 = v10 == v17;
            if (v10 == v17) {
              unint64_t v10 = 0;
            }
            v16 |= v18;
            uint64_t v19 = *(void *)(v7 + 8 * v10);
          }
          while (v19 == -1);
          unint64_t v11 = __clz(__rbit64(~v19)) + (v10 << 6);
        }
        *(void *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
        uint64_t v12 = 8 * v11;
        *(void *)(*(void *)(v2 + 48) + v12) = v21;
        *(void *)(*(void *)(v2 + 56) + v12) = v20;
        ++*(void *)(v2 + 16);
        uint64_t v13 = __CocoaDictionary.Iterator.next()();
        uint64_t v4 = v14;
      }
      while (v13);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)_swiftEmptyDictionarySingleton;
  }
  return v2;
}

uint64_t sub_1000FCE3C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10003AFD0((uint64_t *)&unk_100186630);
  char v38 = a2;
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v37 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = v37[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v21 = v37[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v36)
            {
LABEL_33:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
              if (v35 >= 64) {
                bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v37 = -1 << v35;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v37[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v21 = v37[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      Swift::UInt v27 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v19);
      uint64_t v28 = *(void *)(v5 + 56) + 40 * v19;
      uint64_t v29 = *(void *)v28;
      long long v39 = *(_OWORD *)(v28 + 8);
      uint64_t v30 = *(void **)(v28 + 24);
      uint64_t v31 = *(void **)(v28 + 32);
      if ((v38 & 1) == 0)
      {
        id v32 = v31;
        swift_bridgeObjectRetain();
        id v33 = *((id *)&v39 + 1);
        id v34 = v30;
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v27);
      uint64_t result = Hasher._finalize()();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v27;
      uint64_t v17 = *(void *)(v7 + 56) + 40 * v16;
      *(void *)uint64_t v17 = v29;
      *(_OWORD *)(v17 + 8) = v39;
      *(void *)(v17 + 24) = v30;
      *(void *)(v17 + 32) = v31;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000FD15C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10003AFD0(&qword_100186618);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v30 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
    id v32 = v3;
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v9[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v9[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v32;
                goto LABEL_40;
              }
              if (v31 >= 64) {
                bzero((void *)(v5 + 64), 8 * v33);
              }
              else {
                uint64_t *v9 = v30;
              }
              uint64_t v3 = v32;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v9[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v12 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      int v27 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * v19);
      uint64_t v28 = *(void **)(*(void *)(v5 + 56) + 8 * v19);
      if ((a2 & 1) == 0) {
        id v29 = v28;
      }
      uint64_t result = static Hasher._hash(seed:bytes:count:)();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v16 == v24;
          if (v16 == v24) {
            unint64_t v16 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v17) = v27;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000FD40C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10003AFD0(&qword_100186610);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000FD724(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10003AFD0((uint64_t *)&unk_100186620);
  char v35 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    unint64_t v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
            ++v20;
            if (v19) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v20;
      }
    }
LABEL_21:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    int64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    int64_t v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_100078AC4(v22, v36);
    }
    else
    {
      sub_10003C5D8((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v24 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_100078AC4(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000FDA60(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  int v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_10003AFD0(&qword_1001865E8);
  int v47 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  unint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    id v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    char v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *unint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  id v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_1000FDE48(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10003AFD0((uint64_t *)&unk_1001865D8);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v36) {
      break;
    }
    id v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void *)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((v38 & 1) == 0)
    {
      swift_retain();
      id v33 = v32;
    }
    Hasher.init(_seed:)();
    id v14 = [*(id *)(v31 + 40) serialNumber];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  id v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000FE190(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10003AFD0((uint64_t *)&unk_1001865F0);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v29) {
          goto LABEL_33;
        }
        unint64_t v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v29) {
            goto LABEL_33;
          }
          unint64_t v20 = v30[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v20 = v30[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      Swift::UInt v26 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v18);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v26);
      uint64_t result = Hasher._finalize()();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1000FE464(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1000FE63C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          _OWORD *v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for IndexPath() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  uint64_t *v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1000FE84C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(*(void *)(a2 + 48) + 8 * v6);
        Hasher.init(_seed:)();
        unint64_t v10 = *(void **)(v9 + 40);
        swift_retain();
        id v11 = [v10 serialNumber];
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        String.hash(into:)();
        swift_bridgeObjectRelease();
        Swift::Int v12 = Hasher._finalize()();
        uint64_t result = swift_release();
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            void *v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          unint64_t v18 = (void *)(v17 + 8 * v3);
          uint64_t v19 = (void *)(v17 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
          {
            *unint64_t v18 = *v19;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  uint64_t *v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1000FEA60(uint64_t a1, int a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10007D93C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1000FF18C();
LABEL_7:
    int64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_DWORD *)(v16[6] + 4 * v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      void v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_1000FD15C(v13, a3 & 1);
  unint64_t v18 = sub_10007D93C(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    int64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

uint64_t sub_1000FEB98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10007D7FC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1000FF334();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000FD40C(v15, a4 & 1);
  unint64_t v21 = sub_10007D7FC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v26;

  return swift_bridgeObjectRetain();
}

void sub_1000FED08(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10007DAAC(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1000FF978();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1000FDE48(v13, a3 & 1);
  unint64_t v18 = sub_10007DAAC(a2);
  if ((v14 & 1) != (v19 & 1))
  {
LABEL_17:
    type metadata accessor for CardState();
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v10 = v18;
  char v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  uint64_t v20 = 8 * v10;
  *(void *)(v16[6] + v20) = a2;
  *(void *)(v16[7] + v20) = a1;
  uint64_t v21 = v16[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v16[2] = v23;

  swift_retain();
}

uint64_t sub_1000FEE6C(uint64_t a1, unsigned __int8 a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10007D8D0(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1000FFB20();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      void v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_1000FE190(result, a3 & 1);
  uint64_t result = sub_10007D8D0(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id sub_1000FEFA4()
{
  unint64_t v1 = v0;
  sub_10003AFD0((uint64_t *)&unk_100186630);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 40 * v15;
    uint64_t v17 = *(void *)v16;
    uint64_t v19 = *(void **)(v16 + 24);
    char v18 = *(void **)(v16 + 32);
    long long v26 = *(_OWORD *)(v16 + 8);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v20 = *(void *)(v4 + 56) + 40 * v15;
    *(void *)uint64_t v20 = v17;
    *(_OWORD *)(v20 + 8) = v26;
    *(void *)(v20 + 24) = v19;
    *(void *)(v20 + 32) = v18;
    id v21 = v18;
    swift_bridgeObjectRetain();
    id v22 = *((id *)&v26 + 1);
    id result = v19;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1000FF18C()
{
  unint64_t v1 = v0;
  sub_10003AFD0(&qword_100186618);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
    uint64_t v18 = 8 * v15;
    uint64_t v19 = *(void **)(*(void *)(v2 + 56) + v18);
    *(_DWORD *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v18) = v19;
    id result = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000FF334()
{
  unint64_t v1 = v0;
  sub_10003AFD0(&qword_100186610);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_unknownObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1000FF4EC()
{
  unint64_t v1 = v0;
  sub_10003AFD0((uint64_t *)&unk_100186620);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_10003C5D8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_100078AC4(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000FF6B4()
{
  uint64_t v35 = type metadata accessor for IndexPath();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003AFD0(&qword_1001865E8);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    id result = (void *)swift_release();
    uint64_t v28 = v36;
    uint64_t v27 = v30;
LABEL_25:
    *uint64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  id result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    id result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    unint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *unint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_1000FF978()
{
  uint64_t v1 = v0;
  sub_10003AFD0((uint64_t *)&unk_1001865D8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000FFB20()
{
  uint64_t v1 = v0;
  sub_10003AFD0((uint64_t *)&unk_1001865F0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000FFCC4(char a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v29 = a3;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v31 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchQoS();
  uint64_t v30 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0) {
    return a4(1);
  }
  id v15 = [self standardUserDefaults];
  NSString v16 = String._bridgeToObjectiveC()();
  unsigned __int8 v17 = [v15 BOOLForKey:v16];

  if (v17) {
    return a4(1);
  }
  unsigned __int8 v18 = objc_msgSend(objc_msgSend(self, "currentPlatform"), "isInBoxUpdateModeActive");
  swift_unknownObjectRelease();
  if (v18) {
    return a4(1);
  }
  sub_10003C374(0, (unint64_t *)&qword_100182E40);
  uint64_t v27 = static OS_dispatch_queue.main.getter();
  int64_t v20 = (void *)swift_allocObject();
  uint64_t v22 = v28;
  uint64_t v21 = v29;
  v20[2] = v28;
  v20[3] = a2;
  v20[4] = v21;
  v20[5] = a4;
  v20[6] = a5;
  aBlock[4] = sub_1001000BC;
  aBlock[5] = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000358AC;
  void aBlock[3] = &unk_100154000;
  unint64_t v23 = _Block_copy(aBlock);
  id v24 = v22;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100100554((unint64_t *)&qword_100183E90, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10003AFD0((uint64_t *)&unk_100182E50);
  sub_10003B014();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  unint64_t v25 = (void *)v27;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v14, v12);
}

uint64_t sub_100100074()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1001000BC()
{
  return sub_1000FC348(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(uint64_t (**)(uint64_t))(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1001000CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1001000DC()
{
  return swift_release();
}

uint64_t sub_1001000E4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100100124()
{
  uint64_t v1 = *(void *)(v0 + 32);
  (*(void (**)(void))(v0 + 16))();
  int v2 = *(unsigned __int8 *)(v1 + 19);
  *(unsigned char *)(v1 + 19) = 0;
  if (v2 == 1)
  {
    uint64_t v3 = *(void *)(v1 + 80);
    if ((v3 & 8) == 0) {
      *(void *)(v1 + 80) = v3 | 8;
    }
    sub_100059388();
  }
}

uint64_t sub_10010017C(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  unsigned __int8 v2 = a1;
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (!*(void *)(v4 + 16)) {
    return 0;
  }
  unint64_t v5 = sub_10007D8D0(v2);
  if ((v6 & 1) == 0) {
    return 0;
  }
  unint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_100100234()
{
  unint64_t v1 = IndexPath.section.getter();
  if (v1 > 2)
  {
    unint64_t v3 = 0;
    unsigned __int8 v2 = 2;
  }
  else
  {
    unsigned __int8 v2 = v1;
    unint64_t v3 = IndexPath.row.getter();
  }
  uint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView);
  swift_beginAccess();
  uint64_t v5 = *v4;
  if (!*(void *)(v5 + 16)) {
    return 0;
  }
  unint64_t result = sub_10007D8D0(v2);
  if ((v7 & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * result);
  if ((v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v9 = *(void *)(v8 + 8 * v3 + 32);
    swift_retain();
LABEL_10:
    id v10 = [*(id *)(v9 + 40) serialNumber];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_release();

    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10010036C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001003A4()
{
  return sub_1000FB988(*(void **)(v0 + 16));
}

void sub_1001003AC()
{
  unint64_t v1 = *(void **)(v0 + 16);
  [v1 beginUpdates];
  [v1 endUpdates];
  UIAccessibilityNotifications v2 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v2, 0);
}

uint64_t type metadata accessor for Move(uint64_t a1)
{
  return sub_1000D9038(a1, qword_1001867B8);
}

uint64_t type metadata accessor for Add(uint64_t a1)
{
  return sub_1000D9038(a1, qword_100186728);
}

uint64_t sub_10010044C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1001004B4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for Remove(uint64_t a1)
{
  return sub_1000D9038(a1, qword_100186698);
}

uint64_t sub_100100534()
{
  return sub_1000F8D54();
}

uint64_t sub_10010053C()
{
  return sub_1000F8314();
}

void sub_100100544()
{
}

uint64_t sub_10010054C(uint64_t a1)
{
  return sub_1000F85FC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100100554(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1001005B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001005C8);
}

uint64_t sub_1001005CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001005E0);
}

uint64_t *sub_1001005E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    char v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for IndexPath();
    id v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1001006D0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_100100748(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  char v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_1001007E0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  char v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for IndexPath();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_10010087C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for IndexPath();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1001008F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for IndexPath();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100100984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100100998);
}

uint64_t sub_10010099C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001009B0);
}

uint64_t sub_1001009B4()
{
  uint64_t result = type metadata accessor for IndexPath();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_100100A4C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = type metadata accessor for IndexPath();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[*(int *)(a3 + 24)], &a2[*(int *)(a3 + 24)], v11);
  }
  return v4;
}

uint64_t sub_100100B60(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);

  return v8(v6, v5);
}

char *sub_100100C10(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = type metadata accessor for IndexPath();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[*(int *)(a3 + 24)], &a2[*(int *)(a3 + 24)], v10);
  return a1;
}

char *sub_100100CD4(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[*(int *)(a3 + 24)], &a2[*(int *)(a3 + 24)], v9);
  return a1;
}

char *sub_100100DA0(char *a1, char *a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[*(int *)(a3 + 24)], &a2[*(int *)(a3 + 24)], v9);
  return a1;
}

char *sub_100100E54(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = type metadata accessor for IndexPath();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[*(int *)(a3 + 24)], &a2[*(int *)(a3 + 24)], v10);
  return a1;
}

uint64_t sub_100100F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100100F24);
}

uint64_t sub_100100F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for IndexPath();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100100FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100100FEC);
}

uint64_t sub_100100FF0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for IndexPath();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100101098()
{
  uint64_t result = type metadata accessor for IndexPath();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100101190(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No serial numbers are present for paired airpods device %@", (uint8_t *)&v2, 0xCu);
}

void sub_100101208(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add Bluetooth device: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100101280(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decorate Airpods device with UI. Tests requiring UI will fail.", v1, 2u);
}

void sub_1001012C4(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*a2 description];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to switch to device: %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100101378()
{
  sub_10000E93C();
  sub_10000E900((void *)&_mh_execute_header, v0, v1, "ASTSession %@ ended without error, with reason: %@");
}

void sub_1001013E8(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  sub_10000E900((void *)&_mh_execute_header, a2, a3, "ASTSession %@ ended without error, with reason: %ld", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100101464()
{
  sub_10000E93C();
  sub_10000E900((void *)&_mh_execute_header, v0, v1, "ASTSession %@ ended with error: %@");
}

void sub_1001014D8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100101544(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001015B4(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 domain];
  int v5 = 138412546;
  int v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Send auth info result failed with error: (domain = %@, code = %ld)", (uint8_t *)&v5, 0x16u);
}

void sub_10010166C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001016D8()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Could not parse the shutdown unseal code for shutdown sequence", v2, v3, v4, v5, v6);
}

void sub_10010170C()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Failed to set control register for shutdown. Aborting shutdown.", v2, v3, v4, v5, v6);
}

void sub_100101740()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Failed to write unseal code. Aborting shutdown.", v2, v3, v4, v5, v6);
}

void sub_100101774()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Failed to write to registry key. Aborting shutdown.", v2, v3, v4, v5, v6);
}

void sub_1001017A8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Session does not exist for serial numbers: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100101834()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Could not parse enclosure type (failed to retrieve dmin properties).", v2, v3, v4, v5, v6);
}

void sub_100101868()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Could not parse enclosure type (failed to retrieve top enclosure from dmin).", v2, v3, v4, v5, v6);
}

void sub_10010189C()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Could not parse enclosure type (failed to retrieve housingColor).", v2, v3, v4, v5, v6);
}

void sub_1001018D0(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 unsignedIntegerValue];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognised housing color returned with value %lu", (uint8_t *)&v3, 0xCu);
}

void sub_10010195C()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Could not parse case size.", v2, v3, v4, v5, v6);
}

void sub_100101990(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unsupported watch case size %d. Falling back to default size", (uint8_t *)v2, 8u);
}

void sub_100101A08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error connecting to bug session: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100101A80(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot retry bug session, no session exists", v1, 2u);
}

void sub_100101AC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot configure bug session for cellular, no session exists", v1, 2u);
}

void sub_100101B08(uint8_t *a1, id *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [*a2 snapshot];
  id v8 = [v7 dedSessionIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Could not find bug session %@; marking as finished",
    a1,
    0xCu);
}

void sub_100101B98(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) snapshot];
  uint8_t v6 = [v5 dedSessionIdentifier];
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error connecting to %@ bug session: %@", (uint8_t *)&v7, 0x16u);
}

void sub_100101C5C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Localization] [%@] => [%@]", (uint8_t *)&v3, 0x16u);
}

void sub_100101CE4()
{
  v1[0] = 136315394;
  sub_100017E8C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)v1, 0x16u);
}

void sub_100101D64()
{
  v1[0] = 136315394;
  sub_100017E8C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)v1, 0x16u);
}

void sub_100101DE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100101E1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100101E54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100101E8C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error downloading asset: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100101F08(void *a1, NSObject *a2)
{
  int v3 = [a1 localizedDescription];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get in-box update mode status with error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100101FA0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10010200C(id *a1)
{
  uint64_t v1 = [*a1 destination];
  sub_10001FE54((void *)&_mh_execute_header, v2, v3, "Cannot communicate to destination: %@; dropping message: %@;",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void sub_1001020B4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 64) destination];
  sub_10001FE74();
  sub_10001FE54((void *)&_mh_execute_header, v2, v3, "Response block is nil. Dropping response message: %@; for destination: %@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void sub_100102148(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001021B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100102228(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100102298(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) destination];
  sub_10001FE74();
  sub_10001FE54((void *)&_mh_execute_header, v2, v3, "Response block is nil. Dropping response message: %@; for destination: %@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void sub_100102328(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) destination];
  sub_10001FE74();
  sub_10001FE54((void *)&_mh_execute_header, v2, v3, "Round trip timer expired for message: %@; destination: %@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void sub_1001023B8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ignoring device state update since it is stale. last = %@, this = %@", (uint8_t *)&v3, 0x16u);
}

void sub_100102440(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create CFUserNotificationRef!", v1, 2u);
}

void sub_100102484()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Failed to get a certificate from CoreRepair. Falling back to attestation blob", v2, v3, v4, v5, v6);
}

void sub_1001024B8()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Timed out waiting for certificate from CRCAttestationManager", v2, v3, v4, v5, v6);
}

void sub_1001024EC()
{
  sub_100025044();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unrecognized auth info certificate type %ld", v1, 0xCu);
}

void sub_100102560(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001025D4()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Cannot sign payload, as no security key exists.", v2, v3, v4, v5, v6);
}

void sub_100102608()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Could not generate SHA256 digest for payload.", v2, v3, v4, v5, v6);
}

void sub_10010263C()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Cannot sign file, as no security key exists.", v2, v3, v4, v5, v6);
}

void sub_100102670(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 path];
  sub_100025044();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create file handle from file at path = %@.", v4, 0xCu);
}

void sub_100102704()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Could not generate SHA256 digest for file.", v2, v3, v4, v5, v6);
}

void sub_100102738()
{
  sub_100025044();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "requestAttestationBlobWithOptions failed with error: %@", v1, 0xCu);
}

void sub_1001027AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10010281C()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "Cannot get attestation certificate because CoreRepairCore is not available on this device", v2, v3, v4, v5, v6);
}

void sub_100102850()
{
  sub_10000E8F4();
  sub_10000E8D8((void *)&_mh_execute_header, v0, v1, "CRCAttestationManager returned an invalid certificate", v2, v3, v4, v5, v6);
}

void sub_100102884()
{
  sub_100025044();
  sub_10000E920((void *)&_mh_execute_header, v0, v1, "CRCAttestationManager was unable to get BAA/CAA certs: %@", v2, v3, v4, v5, v6);
}

void sub_1001028EC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Connection %@ not established because the process is not appropriately entitled.", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_100102964()
{
  return sub_100102988();
}

uint64_t sub_100102988()
{
  uint64_t v0 = abort_report_np();
  return sub_1001029B0(v0);
}

uint64_t sub_1001029B0()
{
  uint64_t v0 = abort_report_np();
  return sub_1001029D8(v0);
}

uint64_t sub_1001029D8()
{
  uint64_t v0 = abort_report_np();
  return sub_100102A00(v0);
}

void sub_100102A00(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to initialize DADeviceAirpods: serialNumber is nil", v1, 2u);
}

void sub_100102A44(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DADeviceConnectionAirPods failed to get the shared BluetoothManager instance!", v1, 2u);
}

void sub_100102A88(void *a1)
{
  uint64_t v1 = [a1 airpodsDevice];
  sub_1000306F8((void *)&_mh_execute_header, v2, v3, "Timed out waiting for AirPods device %@ to connect", v4, v5, v6, v7, 2u);
}

void sub_100102B10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "allowSessionAccessoryDisconnectForDuration called with an invalid duration of %@. Ignoring request. If the accessory disconnects, the session will end. This is a bug in the calling DK.", (uint8_t *)&v2, 0xCu);
}

void sub_100102B88(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Disconnect was unexpected. Ending session with error", v1, 2u);
}

void sub_100102BCC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to sync device state", v1, 2u);
}

uint64_t static FormatStyle.measurement<A>(width:usage:numberFormatStyle:)()
{
  return static FormatStyle.measurement<A>(width:usage:numberFormatStyle:)();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t static Measurement<>.FormatStyle.UnitWidth.wide.getter()
{
  return static Measurement<>.FormatStyle.UnitWidth.wide.getter();
}

uint64_t Measurement<>.formatted<A>(_:)()
{
  return Measurement<>.formatted<A>(_:)();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t static CharacterSet.decimalDigits.getter()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t CharacterSet.inverted.getter()
{
  return CharacterSet.inverted.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.host.getter()
{
  return URLComponents.host.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t AttributeScopes.UIKitAttributes.font.getter()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t URLResourceValues.volumeAvailableCapacity.getter()
{
  return URLResourceValues.volumeAvailableCapacity.getter();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t AttributeContainer.subscript.setter()
{
  return AttributeContainer.subscript.setter();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t NSKeyValueObservedChange.newValue.getter()
{
  return NSKeyValueObservedChange.newValue.getter();
}

uint64_t static MeasurementFormatUnitUsage.general.getter()
{
  return static MeasurementFormatUnitUsage.general.getter();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t URL.pathExtension.getter()
{
  return URL.pathExtension.getter();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.pathComponents.getter()
{
  return URL.pathComponents.getter();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t URL.hasDirectoryPath.getter()
{
  return URL.hasDirectoryPath.getter();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.deletingPathExtension()()
{
  return URL.deletingPathExtension()();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.host.getter()
{
  return URL.host.getter();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t IndexPath.description.getter()
{
  return IndexPath.description.getter();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(row:section:)()
{
  return IndexPath.init(row:section:)();
}

uint64_t IndexPath.row.getter()
{
  return IndexPath.row.getter();
}

uint64_t IndexPath.section.getter()
{
  return IndexPath.section.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t static _UIKitNumericRawRepresentable.- infix(_:_:)()
{
  return static _UIKitNumericRawRepresentable.- infix(_:_:)();
}

uint64_t UIBackgroundConfiguration.cornerRadius.setter()
{
  return UIBackgroundConfiguration.cornerRadius.setter();
}

uint64_t type metadata accessor for UIConfigurationTextAttributesTransformer()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t UIConfigurationTextAttributesTransformer.init(_:)()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t UIShape.inset(by:)()
{
  return UIShape.inset(by:)();
}

uint64_t static UIShape.circle.getter()
{
  return static UIShape.circle.getter();
}

uint64_t static UIShape.capsule.getter()
{
  return static UIShape.capsule.getter();
}

uint64_t type metadata accessor for UIShape()
{
  return type metadata accessor for UIShape();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t ConnectablePublisher.autoconnect()()
{
  return ConnectablePublisher.autoconnect()();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t type metadata accessor for Prominence()
{
  return type metadata accessor for Prominence();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

Swift::Void __swiftcall DismissAction.callAsFunction()()
{
}

uint64_t type metadata accessor for DismissAction()
{
  return type metadata accessor for DismissAction();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t GeometryReader.init(content:)()
{
  return GeometryReader.init(content:)();
}

uint64_t type metadata accessor for GeometryReader()
{
  return type metadata accessor for GeometryReader();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static PageTabViewStyle.IndexDisplayMode.automatic.getter()
{
  return static PageTabViewStyle.IndexDisplayMode.automatic.getter();
}

uint64_t type metadata accessor for PageTabViewStyle.IndexDisplayMode()
{
  return type metadata accessor for PageTabViewStyle.IndexDisplayMode();
}

uint64_t PageTabViewStyle.init(indexDisplayMode:)()
{
  return PageTabViewStyle.init(indexDisplayMode:)();
}

uint64_t type metadata accessor for PageTabViewStyle()
{
  return type metadata accessor for PageTabViewStyle();
}

uint64_t type metadata accessor for RoundedRectangle._Inset()
{
  return type metadata accessor for RoundedRectangle._Inset();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t type metadata accessor for SubscriptionView()
{
  return type metadata accessor for SubscriptionView();
}

uint64_t type metadata accessor for TagValueTraitKey.Value()
{
  return type metadata accessor for TagValueTraitKey.Value();
}

uint64_t type metadata accessor for TagValueTraitKey()
{
  return type metadata accessor for TagValueTraitKey();
}

uint64_t type metadata accessor for _OverlayModifier()
{
  return type metadata accessor for _OverlayModifier();
}

uint64_t EnvironmentValues.listSectionSpacing.getter()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t EnvironmentValues.listSectionSpacing.setter()
{
  return EnvironmentValues.listSectionSpacing.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.dismiss.getter()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t static ListSectionSpacing.custom(_:)()
{
  return static ListSectionSpacing.custom(_:)();
}

uint64_t type metadata accessor for ListSectionSpacing()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static HorizontalAlignment.trailing.getter()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t static ScrollBounceBehavior.basedOnSize.getter()
{
  return static ScrollBounceBehavior.basedOnSize.getter();
}

uint64_t type metadata accessor for ScrollBounceBehavior()
{
  return type metadata accessor for ScrollBounceBehavior();
}

uint64_t InsetGroupedListStyle.init()()
{
  return InsetGroupedListStyle.init()();
}

uint64_t type metadata accessor for InsetGroupedListStyle()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t type metadata accessor for _TraitWritingModifier()
{
  return type metadata accessor for _TraitWritingModifier();
}

uint64_t static ScrollIndicatorVisibility.never.getter()
{
  return static ScrollIndicatorVisibility.never.getter();
}

uint64_t static ScrollIndicatorVisibility.hidden.getter()
{
  return static ScrollIndicatorVisibility.hidden.getter();
}

uint64_t type metadata accessor for ScrollIndicatorVisibility()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.title3.getter()
{
  return static Font.title3.getter();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.tabViewStyle<A>(_:)()
{
  return View.tabViewStyle<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.fullScreenCover<A, B>(item:onDismiss:content:)()
{
  return View.fullScreenCover<A, B>(item:onDismiss:content:)();
}

uint64_t View.headerProminence(_:)()
{
  return View.headerProminence(_:)();
}

uint64_t View.scrollIndicators(_:axes:)()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t View.scrollBounceBehavior(_:axes:)()
{
  return View.scrollBounceBehavior(_:axes:)();
}

uint64_t View.scrollContentBackground<A>(_:)()
{
  return View.scrollContentBackground<A>(_:)();
}

uint64_t View._trait<A>(_:_:)()
{
  return View._trait<A>(_:_:)();
}

uint64_t View.offset(x:y:)()
{
  return View.offset(x:y:)();
}

uint64_t View.overlay<A>(alignment:content:)()
{
  return View.overlay<A>(alignment:content:)();
}

uint64_t View.onAppear(perform:)()
{
  return View.onAppear(perform:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t View.onReceive<A>(_:perform:)()
{
  return View.onReceive<A>(_:perform:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.green.getter()
{
  return static Color.green.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t static Color.yellow.getter()
{
  return static Color.yellow.getter();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t type metadata accessor for ForEach()
{
  return type metadata accessor for ForEach();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t TabView.init(selection:content:)()
{
  return TabView.init(selection:content:)();
}

uint64_t type metadata accessor for TabView()
{
  return type metadata accessor for TabView();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
}

uint64_t TupleView.init(_:)()
{
  return TupleView.init(_:)();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:arguments:)()
{
  return String.init(format:arguments:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)Float._bridgeToObjectiveC()();
}

uint64_t static Float._forceBridgeFromObjectiveC(_:result:)()
{
  return static Float._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Float._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Float._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._forceBridgeFromObjectiveC(_:result:)()
{
  return static Set._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t UIHoverStyle.init(shape:)()
{
  return UIHoverStyle.init(shape:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

UIBarButtonItem __swiftcall UIBarButtonItem.init(systemItem:primaryAction:menu:)(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return (UIBarButtonItem)UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil, menu.value.super.super.isa, *(void *)&menu.is_nil);
}

UIBarButtonItem __swiftcall UIBarButtonItem.init(title:image:primaryAction:menu:)(Swift::String_optional title, UIImage_optional image, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return (UIBarButtonItem)UIBarButtonItem.init(title:image:primaryAction:menu:)(title.value._countAndFlagsBits, title.value._object, image.value.super.isa, *(void *)&image.is_nil, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil, menu.value.super.super.isa, *(void *)&menu.is_nil);
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return OS_dispatch_group.wait(timeout:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t UIFocusEnvironment.contains(_:)()
{
  return UIFocusEnvironment.contains(_:)();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t UIContentSizeCategory.isAccessibilityCategory.getter()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

UIMenu __swiftcall UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

UIImage __swiftcall UIImage.init(imageLiteralResourceName:)(Swift::String imageLiteralResourceName)
{
  return (UIImage)UIImage.init(imageLiteralResourceName:)(imageLiteralResourceName._countAndFlagsBits, imageLiteralResourceName._object);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t UIButton.Configuration.background.modify()
{
  return UIButton.Configuration.background.modify();
}

uint64_t type metadata accessor for UIButton.Configuration.CornerStyle()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t UIButton.Configuration.cornerStyle.setter()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t UIButton.Configuration.contentInsets.setter()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t UIButton.Configuration.titleTextAttributesTransformer.setter()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t static UIButton.Configuration.plain()()
{
  return static UIButton.Configuration.plain()();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t UIButton.configuration.getter()
{
  return UIButton.configuration.getter();
}

uint64_t UIButton.configuration.setter()
{
  return UIButton.configuration.setter();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t static OS_os_log.disabled.getter()
{
  return static OS_os_log.disabled.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return Optional._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.localizedUppercase.getter()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return _BKSDisplayBrightnessGetCurrent();
}

uint64_t BKSDisplayBrightnessSet()
{
  return _BKSDisplayBrightnessSet();
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return _BYSetupAssistantHasCompletedInitialRun();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return _CGImageCreateWithMask(image, mask);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return _CGImageGetBitsPerComponent(image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return _CGImageGetBytesPerRow(image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return _CGImageGetDataProvider(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return _CGImageMaskCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  return _CGPathGetBoundingBox(path);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CGSVGDocumentCreateFromData()
{
  return _CGSVGDocumentCreateFromData();
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  CGSize v4 = _CGSizeApplyAffineTransform(size, t);
  double height = v4.height;
  double width = v4.width;
  result.double height = height;
  result.double width = width;
  return result;
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

uint64_t DeviceIdentityCopyAttestationDictionary()
{
  return _DeviceIdentityCopyAttestationDictionary();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t GestaltGetDeviceClass()
{
  return _GestaltGetDeviceClass();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MobileGestalt_copy_deviceClass_obj()
{
  return _MobileGestalt_copy_deviceClass_obj();
}

uint64_t MobileGestalt_get_containsCellularRadioCapability()
{
  return _MobileGestalt_get_containsCellularRadioCapability();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_deviceSupportsEnhancedMultitasking()
{
  return _MobileGestalt_get_deviceSupportsEnhancedMultitasking();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
}

uint64_t NRDeviceSizeForProductType()
{
  return _NRDeviceSizeForProductType();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBSSpringBoardServerPort()
{
  return _SBSSpringBoardServerPort();
}

uint64_t SBSetVoiceControlEnabled()
{
  return _SBSetVoiceControlEnabled();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo)
{
}

void UIGraphicsBeginPDFPage(void)
{
}

void UIGraphicsEndImageContext(void)
{
}

void UIGraphicsEndPDFContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

CGRect UIGraphicsGetPDFContextBounds(void)
{
  return _UIGraphicsGetPDFContextBounds();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

long double log(long double __x)
{
  return _log(__x);
}

uint64_t lroundf(float a1)
{
  return _lroundf(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

uint64_t xpc_transaction_interrupt_clean_exit()
{
  return _xpc_transaction_interrupt_clean_exit();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_SHA256ForData_(void *a1, const char *a2, ...)
{
  return [a1 SHA256ForData];
}

id objc_msgSend_SHA256ForFileHandle_(void *a1, const char *a2, ...)
{
  return [a1 SHA256ForFileHandle:];
}

id objc_msgSend_SOCKSProxyPort(void *a1, const char *a2, ...)
{
  return _[a1 SOCKSProxyPort];
}

id objc_msgSend_SOCKSProxyServer(void *a1, const char *a2, ...)
{
  return _[a1 SOCKSProxyServer];
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__IMEI(void *a1, const char *a2, ...)
{
  return _[a1 _IMEI];
}

id objc_msgSend__accessoryIdentifiersToPromote(void *a1, const char *a2, ...)
{
  return _[a1 _accessoryIdentifiersToPromote];
}

id objc_msgSend__addAirpodsDevice_(void *a1, const char *a2, ...)
{
  return [a1 _addAirpodsDevice:];
}

id objc_msgSend__addPlatformCFUserNotificationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPlatformCFUserNotificationOptions:");
}

id objc_msgSend__airpodsDeviceFromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_airpodsDeviceFromDevice:");
}

id objc_msgSend__beginObserving(void *a1, const char *a2, ...)
{
  return _[a1 _beginObserving];
}

id objc_msgSend__caseSize(void *a1, const char *a2, ...)
{
  return _[a1 _caseSize];
}

id objc_msgSend__clearNVRamVariable_(void *a1, const char *a2, ...)
{
  return [a1 _clearNVRamVariable:];
}

id objc_msgSend__createDeviceConnection(void *a1, const char *a2, ...)
{
  return _[a1 _createDeviceConnection];
}

id objc_msgSend__createDeviceWithNanoDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDeviceWithNanoDevice:");
}

id objc_msgSend__createXPCConnection(void *a1, const char *a2, ...)
{
  return _[a1 _createXPCConnection];
}

id objc_msgSend__dequeueTest(void *a1, const char *a2, ...)
{
  return _[a1 _dequeueTest];
}

id objc_msgSend__deviceAttributes(void *a1, const char *a2, ...)
{
  return _[a1 _deviceAttributes];
}

id objc_msgSend__deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 _deviceClass];
}

id objc_msgSend__deviceColor(void *a1, const char *a2, ...)
{
  return _[a1 _deviceColor];
}

id objc_msgSend__deviceEnclosureColor(void *a1, const char *a2, ...)
{
  return _[a1 _deviceEnclosureColor];
}

id objc_msgSend__deviceImageName(void *a1, const char *a2, ...)
{
  return _[a1 _deviceImageName];
}

id objc_msgSend__deviceMaskName(void *a1, const char *a2, ...)
{
  return _[a1 _deviceMaskName];
}

id objc_msgSend__deviceType(void *a1, const char *a2, ...)
{
  return _[a1 _deviceType];
}

id objc_msgSend__devices(void *a1, const char *a2, ...)
{
  return _[a1 _devices];
}

id objc_msgSend__enclosure(void *a1, const char *a2, ...)
{
  return _[a1 _enclosure];
}

id objc_msgSend__endDeviceStatePingTimer(void *a1, const char *a2, ...)
{
  return _[a1 _endDeviceStatePingTimer];
}

id objc_msgSend__endObserving(void *a1, const char *a2, ...)
{
  return _[a1 _endObserving];
}

id objc_msgSend__enqueueTestWithQueueEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueTestWithQueueEntry:");
}

id objc_msgSend__ensureInitialDevicesFetched(void *a1, const char *a2, ...)
{
  return _[a1 _ensureInitialDevicesFetched];
}

id objc_msgSend__fetchDevices(void *a1, const char *a2, ...)
{
  return _[a1 _fetchDevices];
}

id objc_msgSend__forceDiscoverAllDevices(void *a1, const char *a2, ...)
{
  return _[a1 _forceDiscoverAllDevices];
}

id objc_msgSend__getDiagnosticAllowList(void *a1, const char *a2, ...)
{
  return _[a1 _getDiagnosticAllowList];
}

id objc_msgSend__initDevice(void *a1, const char *a2, ...)
{
  return _[a1 _initDevice];
}

id objc_msgSend__isBeatsDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isBeatsDevice:");
}

id objc_msgSend__isBluetoothDeviceServicableAirpods_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isBluetoothDeviceServicableAirpods:");
}

id objc_msgSend__isDeviceLocked(void *a1, const char *a2, ...)
{
  return _[a1 _isDeviceLocked];
}

id objc_msgSend__marketingName(void *a1, const char *a2, ...)
{
  return _[a1 _marketingName];
}

id objc_msgSend__ping(void *a1, const char *a2, ...)
{
  return _[a1 _ping];
}

id objc_msgSend__productClass(void *a1, const char *a2, ...)
{
  return _[a1 _productClass];
}

id objc_msgSend__profileWithCommand_(void *a1, const char *a2, ...)
{
  return [a1 _profileWithCommand:];
}

id objc_msgSend__purgeUnpairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 _purgeUnpairedDevices];
}

id objc_msgSend__reset(void *a1, const char *a2, ...)
{
  return _[a1 _reset];
}

id objc_msgSend__resetDeviceStatePingTimer(void *a1, const char *a2, ...)
{
  return _[a1 _resetDeviceStatePingTimer];
}

id objc_msgSend__sendChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _sendChangeNotification];
}

id objc_msgSend__sendChangeNotificationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _sendChangeNotificationIfNeeded];
}

id objc_msgSend__sendMessage_overrideCannotCommunicate_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessage:overrideCannotCommunicate:response:");
}

id objc_msgSend__serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 _serialNumber];
}

id objc_msgSend__session_didFinishSuiteWithName_skipped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_session:didFinishSuiteWithName:skipped:");
}

id objc_msgSend__sessionDidPowerOff_forReboot_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionDidPowerOff:forReboot:withParameters:");
}

id objc_msgSend__setNextBootForBootMode_(void *a1, const char *a2, ...)
{
  return [a1 _setNextBootForBootMode:];
}

id objc_msgSend__setSystemVolumeHUDEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _setSystemVolumeHUDEnabled:];
}

id objc_msgSend__shutDownDeviceForReboot_(void *a1, const char *a2, ...)
{
  return [a1 _shutDownDeviceForReboot:];
}

id objc_msgSend__shutdownForBatteryDisconnectWithUnsealCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shutdownForBatteryDisconnectWithUnsealCode:");
}

id objc_msgSend__shutdownToShelfLifeMode(void *a1, const char *a2, ...)
{
  return _[a1 _shutdownToShelfLifeMode];
}

id objc_msgSend__spawnPersistentDevice(void *a1, const char *a2, ...)
{
  return _[a1 _spawnPersistentDevice];
}

id objc_msgSend__startInterceptingButtonEvents(void *a1, const char *a2, ...)
{
  return _[a1 _startInterceptingButtonEvents];
}

id objc_msgSend__stringForPhase_(void *a1, const char *a2, ...)
{
  return [a1 _stringForPhase:];
}

id objc_msgSend__syncState_(void *a1, const char *a2, ...)
{
  return [a1 _syncState:];
}

id objc_msgSend__tickleTestQueue(void *a1, const char *a2, ...)
{
  return _[a1 _tickleTestQueue];
}

id objc_msgSend__unsealCodeFromParameters_(void *a1, const char *a2, ...)
{
  return [a1 _unsealCodeFromParameters:];
}

id objc_msgSend__updateDevices(void *a1, const char *a2, ...)
{
  return _[a1 _updateDevices];
}

id objc_msgSend__updateDevicesWithSerialNumber_(void *a1, const char *a2, ...)
{
  return [a1 _updateDevicesWithSerialNumber:];
}

id objc_msgSend__updateDevicesWithSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDevicesWithSnapshot:");
}

id objc_msgSend__updateHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _updateHandlers];
}

id objc_msgSend__updateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateState:");
}

id objc_msgSend__waitUntilFirstResponse(void *a1, const char *a2, ...)
{
  return _[a1 _waitUntilFirstResponse];
}

id objc_msgSend__writeNVRamVariable_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeNVRamVariable:value:");
}

id objc_msgSend_acceptableValueClasses(void *a1, const char *a2, ...)
{
  return _[a1 acceptableValueClasses];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return _[a1 accessory];
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return _[a1 accessoryInfo];
}

id objc_msgSend_accessoryObservationQueue(void *a1, const char *a2, ...)
{
  return _[a1 accessoryObservationQueue];
}

id objc_msgSend_accessoryRegistrationQueue(void *a1, const char *a2, ...)
{
  return _[a1 accessoryRegistrationQueue];
}

id objc_msgSend_accessoryWithIdentifier_attributes_(void *a1, const char *a2, ...)
{
  return [a1 accessoryWithIdentifier:attributes:];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateAlertForSuiteName_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 activateAlertForSuiteName:withHandler:];
}

id objc_msgSend_activateSimpleAlertWithTitle_message_defaultButtonName_cancelButtonName_handler_(void *a1, const char *a2, ...)
{
  return [a1 activateSimpleAlertWithTitle:message:defaultButtonName:cancelButtonName:handler:];
}

id objc_msgSend_activeDeviceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 activeDeviceAssertion];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return [a1 addArcWithCenter:radius:startAngle:endAngle:clockwise:];
}

id objc_msgSend_addData_withFilename_(void *a1, const char *a2, ...)
{
  return [a1 addData:withFilename:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addErrorCode_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 addErrorCode:userInfo:];
}

id objc_msgSend_addLineToPoint_(void *a1, const char *a2, ...)
{
  return [a1 addLineToPoint:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addPrintFormatter_startingAtPageAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 addPrintFormatter:startingAtPageAtIndex:];
}

id objc_msgSend_addQuadCurveToPoint_controlPoint_(void *a1, const char *a2, ...)
{
  return [a1 addQuadCurveToPoint:controlPoint:];
}

id objc_msgSend_addTarget_action_forButtonEvents_propagate_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forButtonEvents:propagate:];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_advanceForStatus_(void *a1, const char *a2, ...)
{
  return [a1 advanceForStatus:];
}

id objc_msgSend_aggregatorWithObserverClasses_(void *a1, const char *a2, ...)
{
  return [a1 aggregatorWithObserverClasses:];
}

id objc_msgSend_airpodsDevice(void *a1, const char *a2, ...)
{
  return _[a1 airpodsDevice];
}

id objc_msgSend_airpodsRegistrationQueue(void *a1, const char *a2, ...)
{
  return _[a1 airpodsRegistrationQueue];
}

id objc_msgSend_airpodsUUID(void *a1, const char *a2, ...)
{
  return _[a1 airpodsUUID];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_alertVisibleLock(void *a1, const char *a2, ...)
{
  return _[a1 alertVisibleLock];
}

id objc_msgSend_allCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 allCapabilities];
}

id objc_msgSend_allDevices(void *a1, const char *a2, ...)
{
  return _[a1 allDevices];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowCellularSizeThreshold(void *a1, const char *a2, ...)
{
  return _[a1 allowCellularSizeThreshold];
}

id objc_msgSend_allowSessionAccessoryDisconnectForDuration_(void *a1, const char *a2, ...)
{
  return [a1 allowSessionAccessoryDisconnectForDuration:];
}

id objc_msgSend_allowedDataClasses(void *a1, const char *a2, ...)
{
  return _[a1 allowedDataClasses];
}

id objc_msgSend_animationCompletion(void *a1, const char *a2, ...)
{
  return _[a1 animationCompletion];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_applyTransform_(void *a1, const char *a2, ...)
{
  return [a1 applyTransform:];
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return _[a1 archive];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayForJSON(void *a1, const char *a2, ...)
{
  return _[a1 arrayForJSON];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assetUploader(void *a1, const char *a2, ...)
{
  return _[a1 assetUploader];
}

id objc_msgSend_attachCompletionHandlerForDEDExtensionIdentifier_handler_(void *a1, const char *a2, ...)
{
  return [a1 attachCompletionHandlerForDEDExtensionIdentifier:handler:];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_attributesForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 attributesForIdentifier:];
}

id objc_msgSend_attributesWithTestId_version_(void *a1, const char *a2, ...)
{
  return [a1 attributesWithTestId:version:];
}

id objc_msgSend_authInfoResultWithAttestation_certificate_type_error_(void *a1, const char *a2, ...)
{
  return [a1 authInfoResultWithAttestation:certificate:type:error:];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return _[a1 available];
}

id objc_msgSend_availableDestinationsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 availableDestinationsWithCompletion:];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_base64String_(void *a1, const char *a2, ...)
{
  return [a1 base64String];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginDiagnosticWithIdentifier_parameters_completion_(void *a1, const char *a2, ...)
{
  return [a1 beginDiagnosticWithIdentifier:parameters:completion:];
}

id objc_msgSend_beginDiscoveringDevicesWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 beginDiscoveringDevicesWithHandler:];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return _[a1 bleDevice];
}

id objc_msgSend_bluetoothID(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_btManager(void *a1, const char *a2, ...)
{
  return _[a1 btManager];
}

id objc_msgSend_btManagerAvailableSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 btManagerAvailableSemaphore];
}

id objc_msgSend_bugSessionStarted(void *a1, const char *a2, ...)
{
  return _[a1 bugSessionStarted];
}

id objc_msgSend_bugSessions(void *a1, const char *a2, ...)
{
  return _[a1 bugSessions];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return _[a1 buttonEventMonitor];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedResponseForRequest_(void *a1, const char *a2, ...)
{
  return [a1 cachedResponseForRequest:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllDiagnostics];
}

id objc_msgSend_cancelAllReports(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllReports];
}

id objc_msgSend_cancelDiagnosticExtensionWithDEDExtensionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cancelDiagnosticExtensionWithDEDExtensionIdentifier:];
}

id objc_msgSend_cancelTestWithCommand_(void *a1, const char *a2, ...)
{
  return [a1 cancelTestWithCommand:];
}

id objc_msgSend_certifcateType(void *a1, const char *a2, ...)
{
  return _[a1 certifcateType];
}

id objc_msgSend_certificates(void *a1, const char *a2, ...)
{
  return _[a1 certificates];
}

id objc_msgSend_check(void *a1, const char *a2, ...)
{
  return _[a1 check];
}

id objc_msgSend_checkAvailabilityWithTicketNumber_timeout_exitWhenDone_completion_(void *a1, const char *a2, ...)
{
  return [a1 checkAvailabilityWithTicketNumber:timeout:exitWhenDone:completion:];
}

id objc_msgSend_checkAvailabilityWithTicketNumber_timeout_exitWhenDone_response_(void *a1, const char *a2, ...)
{
  return [a1 checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:];
}

id objc_msgSend_checkEnhancedLoggingStateWithReply_(void *a1, const char *a2, ...)
{
  return [a1 checkEnhancedLoggingStateWithReply:];
}

id objc_msgSend_clearAllowSessionAccessoryDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 clearAllowSessionAccessoryDisconnect];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearNextBootCheckerBoardPersistent(void *a1, const char *a2, ...)
{
  return _[a1 clearNextBootCheckerBoardPersistent];
}

id objc_msgSend_clearNotification(void *a1, const char *a2, ...)
{
  return _[a1 clearNotification];
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return _[a1 clock];
}

id objc_msgSend_cloudKitContainerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitContainerIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_commandType(void *a1, const char *a2, ...)
{
  return _[a1 commandType];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commitCurrentPath(void *a1, const char *a2, ...)
{
  return _[a1 commitCurrentPath];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_completionMap(void *a1, const char *a2, ...)
{
  return _[a1 completionMap];
}

id objc_msgSend_componentPredicateWithType_identifier_(void *a1, const char *a2, ...)
{
  return [a1 componentPredicateWithType:identifier:];
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _[a1 components];
}

id objc_msgSend_configurator(void *a1, const char *a2, ...)
{
  return _[a1 configurator];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return _[a1 connect];
}

id objc_msgSend_connectSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 connectSemaphore];
}

id objc_msgSend_connectToDED_(void *a1, const char *a2, ...)
{
  return [a1 connectToDED:];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return _[a1 connected];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
}

id objc_msgSend_connecting(void *a1, const char *a2, ...)
{
  return _[a1 connecting];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionCommandQueue(void *a1, const char *a2, ...)
{
  return _[a1 connectionCommandQueue];
}

id objc_msgSend_consent(void *a1, const char *a2, ...)
{
  return _[a1 consent];
}

id objc_msgSend_consentBody(void *a1, const char *a2, ...)
{
  return _[a1 consentBody];
}

id objc_msgSend_consentData(void *a1, const char *a2, ...)
{
  return _[a1 consentData];
}

id objc_msgSend_consumeSandboxExtensionsWithTokens_(void *a1, const char *a2, ...)
{
  return [a1 consumeSandboxExtensionsWithTokens:];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_contentsText(void *a1, const char *a2, ...)
{
  return _[a1 contentsText];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCertificatePEMWithError_(void *a1, const char *a2, ...)
{
  return [a1 copyCertificatePEMWithError:];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createLoggingEventWith_(void *a1, const char *a2, ...)
{
  return [a1 createLoggingEventWith:];
}

id objc_msgSend_currentDate(void *a1, const char *a2, ...)
{
  return _[a1 currentDate];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 currentEnvironment];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentPath(void *a1, const char *a2, ...)
{
  return _[a1 currentPath];
}

id objc_msgSend_currentPlatform(void *a1, const char *a2, ...)
{
  return _[a1 currentPlatform];
}

id objc_msgSend_customSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 customSerialNumber];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:length:];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithPropertyList:format:options:error:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeInterval:sinceDate:];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeDoubleForKey:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_decorateWithDevice_(void *a1, const char *a2, ...)
{
  return [a1 decorateWithDevice:];
}

id objc_msgSend_dedExtensionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dedExtensionIdentifier];
}

id objc_msgSend_dedSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dedSessionIdentifier];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultObserverClasses(void *a1, const char *a2, ...)
{
  return _[a1 defaultObserverClasses];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _[a1 destination];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_device_didFinishTestSuite_withEntry_error_(void *a1, const char *a2, ...)
{
  return [a1 device:didFinishTestSuite:withEntry:error:];
}

id objc_msgSend_device_didRequestInstructionalPrompt_withConfirmation_(void *a1, const char *a2, ...)
{
  return [a1 device:didRequestInstructionalPrompt:withConfirmation:];
}

id objc_msgSend_device_didRequestSuiteRunWithDestinations_confirmation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device:didRequestSuiteRunWithDestinations:confirmation:");
}

id objc_msgSend_device_shouldStartTestWithTestId_fullscreen_response_(void *a1, const char *a2, ...)
{
  return [a1 device:shouldStartTestWithTestId:fullscreen:response:];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_deviceConnection_didFinishTestSuite_withEntry_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceConnection:didFinishTestSuite:withEntry:error:");
}

id objc_msgSend_deviceConnection_didRecieveCommand_(void *a1, const char *a2, ...)
{
  return [a1 deviceConnection:didRecieveCommand:];
}

id objc_msgSend_deviceConnection_didRequestInstructionalPrompt_withConfirmation_(void *a1, const char *a2, ...)
{
  return [a1 deviceConnection:didRequestInstructionalPrompt:withConfirmation:];
}

id objc_msgSend_deviceConnection_didRequestSuiteRunWithDestinations_confirmation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceConnection:didRequestSuiteRunWithDestinations:confirmation:");
}

id objc_msgSend_deviceIDForNRDevice_(void *a1, const char *a2, ...)
{
  return [a1 deviceIDForNRDevice:];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifier];
}

id objc_msgSend_deviceIdentityCert(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentityCert];
}

id objc_msgSend_deviceIdentityKey(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentityKey];
}

id objc_msgSend_deviceIdentityPublicKeyDigest(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentityPublicKeyDigest];
}

id objc_msgSend_deviceMatchingAccessories_(void *a1, const char *a2, ...)
{
  return [a1 deviceMatchingAccessories:];
}

id objc_msgSend_deviceStatePingTimer(void *a1, const char *a2, ...)
{
  return _[a1 deviceStatePingTimer];
}

id objc_msgSend_deviceWithSerialNumber_(void *a1, const char *a2, ...)
{
  return [a1 deviceWithSerialNumber:];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_devicesWithDiscoveryFlags_error_(void *a1, const char *a2, ...)
{
  return [a1 devicesWithDiscoveryFlags:error:];
}

id objc_msgSend_diagnosticEventID(void *a1, const char *a2, ...)
{
  return _[a1 diagnosticEventID];
}

id objc_msgSend_diagnosticParametersWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 diagnosticParametersWithDictionary:];
}

id objc_msgSend_diagnosticsExitingForReason_(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsExitingForReason:];
}

id objc_msgSend_diagnosticsManager(void *a1, const char *a2, ...)
{
  return _[a1 diagnosticsManager];
}

id objc_msgSend_diagnosticsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsWithCompletion:];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didEdit_(void *a1, const char *a2, ...)
{
  return [a1 didEdit:];
}

id objc_msgSend_didFinishSendingResultForTest_(void *a1, const char *a2, ...)
{
  return [a1 didFinishSendingResultForTest:];
}

id objc_msgSend_dimDisplay(void *a1, const char *a2, ...)
{
  return _[a1 dimDisplay];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _[a1 disconnect];
}

id objc_msgSend_disconnectSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 disconnectSemaphore];
}

id objc_msgSend_disconnecting(void *a1, const char *a2, ...)
{
  return _[a1 disconnecting];
}

id objc_msgSend_discoverAllDevicesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverAllDevicesWithCompletionHandler:");
}

id objc_msgSend_discoverDevicesWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 discoverDevicesWithCompletion:];
}

id objc_msgSend_displayDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 displayDeviceIdentifier];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadAndSetImageForURL_fallbackUrl_withDeviceState_andCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAndSetImageForURL:fallbackUrl:withDeviceState:andCompletionHandler:");
}

id objc_msgSend_drawAtPoint_(void *a1, const char *a2, ...)
{
  return [a1 drawAtPoint:];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:];
}

id objc_msgSend_drawPageAtIndex_inRect_(void *a1, const char *a2, ...)
{
  return [a1 drawPageAtIndex:inRect:];
}

id objc_msgSend_durationRemaining(void *a1, const char *a2, ...)
{
  return _[a1 durationRemaining];
}

id objc_msgSend_enclosureColor(void *a1, const char *a2, ...)
{
  return _[a1 enclosureColor];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:forKey:];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endDiscoveringDevicesWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 endDiscoveringDevicesWithIdentifier:];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_enqueueTestWithTestAttributes_parameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueTestWithTestAttributes:parameters:completion:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return _[a1 errors];
}

id objc_msgSend_estimatedTimeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 estimatedTimeRemaining];
}

id objc_msgSend_eventDelegate(void *a1, const char *a2, ...)
{
  return _[a1 eventDelegate];
}

id objc_msgSend_executeAfterDuration(void *a1, const char *a2, ...)
{
  return _[a1 executeAfterDuration];
}

id objc_msgSend_executeTestWithTestAttributes_parameters_completion_(void *a1, const char *a2, ...)
{
  return [a1 executeTestWithTestAttributes:parameters:completion:];
}

id objc_msgSend_extra(void *a1, const char *a2, ...)
{
  return _[a1 extra];
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReadingAtPath:];
}

id objc_msgSend_fileSandboxTokens(void *a1, const char *a2, ...)
{
  return _[a1 fileSandboxTokens];
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return _[a1 files];
}

id objc_msgSend_finishWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 finishWithCompletion:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstResponseLock(void *a1, const char *a2, ...)
{
  return _[a1 firstResponseLock];
}

id objc_msgSend_firstResponseSent(void *a1, const char *a2, ...)
{
  return _[a1 firstResponseSent];
}

id objc_msgSend_flushWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 flushWithCompletion:];
}

id objc_msgSend_followUpOptions(void *a1, const char *a2, ...)
{
  return _[a1 followUpOptions];
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return _[a1 force];
}

id objc_msgSend_forceTouchCapability(void *a1, const char *a2, ...)
{
  return _[a1 forceTouchCapability];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return _[a1 fractionCompleted];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_fullscreenPromptsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fullscreenPromptsEnabled];
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return [a1 functionWithName:];
}

id objc_msgSend_generateAuthInfoWithNonce_completion_(void *a1, const char *a2, ...)
{
  return [a1 generateAuthInfoWithNonce:completion:];
}

id objc_msgSend_generatePDFData(void *a1, const char *a2, ...)
{
  return _[a1 generatePDFData];
}

id objc_msgSend_gestureTouchesBegan_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 gestureTouchesBegan:withEvent:];
}

id objc_msgSend_gestureTouchesEnded_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 gestureTouchesEnded:withEvent:];
}

id objc_msgSend_gestureTouchesMoved_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 gestureTouchesMoved:withEvent:];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(void *a1, const char *a2, ...)
{
  return [a1 getAllDevicesWithArchivedAltAccountDevicesMatching:];
}

id objc_msgSend_getBugSessionActivityWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 getBugSessionActivityWithCompletion:];
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return [a1 getCString:maxLength:encoding:];
}

id objc_msgSend_getDeviceSizeTokenForCurrentDeviceClass_(void *a1, const char *a2, ...)
{
  return [a1 getDeviceSizeTokenForCurrentDeviceClass];
}

id objc_msgSend_getFormattedDeviceColor_deviceEnclosureColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFormattedDeviceColor:deviceEnclosureColor:");
}

id objc_msgSend_getImageFromCacheWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 getImageFromCacheWithRequest:];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 getPairedDevices];
}

id objc_msgSend_getSessionID(void *a1, const char *a2, ...)
{
  return _[a1 getSessionID];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _[a1 handler];
}

id objc_msgSend_handlers(void *a1, const char *a2, ...)
{
  return _[a1 handlers];
}

id objc_msgSend_hasIgnoredDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 hasIgnoredDisconnect];
}

id objc_msgSend_hasTarget_(void *a1, const char *a2, ...)
{
  return [a1 hasTarget:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hideSceneStatusBar(void *a1, const char *a2, ...)
{
  return _[a1 hideSceneStatusBar];
}

id objc_msgSend_history(void *a1, const char *a2, ...)
{
  return _[a1 history];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifiersToRetry(void *a1, const char *a2, ...)
{
  return _[a1 identifiersToRetry];
}

id objc_msgSend_identityWithSerialNumber_(void *a1, const char *a2, ...)
{
  return [a1 identityWithSerialNumber:];
}

id objc_msgSend_idle(void *a1, const char *a2, ...)
{
  return _[a1 idle];
}

id objc_msgSend_idsDestination(void *a1, const char *a2, ...)
{
  return _[a1 idsDestination];
}

id objc_msgSend_ignoreButtonEvents(void *a1, const char *a2, ...)
{
  return _[a1 ignoreButtonEvents];
}

id objc_msgSend_ignoreDisconnectTimer(void *a1, const char *a2, ...)
{
  return _[a1 ignoreDisconnectTimer];
}

id objc_msgSend_ignoreTouch_forEvent_(void *a1, const char *a2, ...)
{
  return [a1 ignoreTouch:forEvent:];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:];
}

id objc_msgSend_imageSignature(void *a1, const char *a2, ...)
{
  return _[a1 imageSignature];
}

id objc_msgSend_imageURLForDeviceClass_deviceModel_deviceColor_deviceEnclosureColor_scale_(void *a1, const char *a2, ...)
{
  return [a1 imageURLForDeviceClass:deviceModel:deviceColor:deviceEnclosureColor:scale:];
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:];
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return [a1 imageWithData:];
}

id objc_msgSend_imageWithData_scale_(void *a1, const char *a2, ...)
{
  return [a1 imageWithData:scale:];
}

id objc_msgSend_infoWithChangedProperties_snapshot_(void *a1, const char *a2, ...)
{
  return [a1 infoWithChangedProperties:snapshot:];
}

id objc_msgSend_information(void *a1, const char *a2, ...)
{
  return _[a1 information];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initListener(void *a1, const char *a2, ...)
{
  return _[a1 initListener];
}

id objc_msgSend_initWithAccessory_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccessory:];
}

id objc_msgSend_initWithAttributes_parameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributes:parameters:completion:");
}

id objc_msgSend_initWithBluetoothDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithBluetoothDevice:];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:];
}

id objc_msgSend_initWithChangedProperties_snapshot_(void *a1, const char *a2, ...)
{
  return [a1 initWithChangedProperties:snapshot:];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDestination_andEncryptionKey_andToken_andExtraHeaders_(void *a1, const char *a2, ...)
{
  return [a1 initWithDestination:andEncryptionKey:andToken:andExtraHeaders:];
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithDevice:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:code:userInfo:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_color_scale_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:color:scale:];
}

id objc_msgSend_initWithHostAppIdentifier_localizedNotificationTitle_localizedNotificationBody_(void *a1, const char *a2, ...)
{
  return [a1 initWithHostAppIdentifier:localizedNotificationTitle:localizedNotificationBody:];
}

id objc_msgSend_initWithIdentifier_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:attributes:];
}

id objc_msgSend_initWithIdentifiers_contactMessage_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifiers:contactMessage:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:options:];
}

id objc_msgSend_initWithNanoDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithNanoDevice:];
}

id objc_msgSend_initWithObserver_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithObserver:delegate:];
}

id objc_msgSend_initWithObserverClasses_(void *a1, const char *a2, ...)
{
  return [a1 initWithObserverClasses:];
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return [a1 initWithReason:];
}

id objc_msgSend_initWithSerialNumber_(void *a1, const char *a2, ...)
{
  return [a1 initWithSerialNumber:];
}

id objc_msgSend_initWithSerialNumber_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithSerialNumber:attributes:];
}

id objc_msgSend_initWithSerialNumber_isLocal_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithSerialNumber:isLocal:attributes:];
}

id objc_msgSend_initWithState_(void *a1, const char *a2, ...)
{
  return [a1 initWithState:];
}

id objc_msgSend_initWithState_bluetoothDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithState:bluetoothDevice:];
}

id objc_msgSend_initWithState_nanoDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithState:nanoDevice:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithSuiteName_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:withHandler:];
}

id objc_msgSend_initWithTestSuiteName_date_skipped_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestSuiteName:date:skipped:];
}

id objc_msgSend_initWithTestSuiteName_date_skipped_results_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestSuiteName:date:skipped:results:");
}

id objc_msgSend_initWithTestSuiteName_skipped_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestSuiteName:skipped:];
}

id objc_msgSend_initWithTestSuiteName_skipped_results_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestSuiteName:skipped:results:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithValidatedFormat_validFormatSpecifiers_locale_arguments_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:];
}

id objc_msgSend_initialDevicesFetched(void *a1, const char *a2, ...)
{
  return _[a1 initialDevicesFetched];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return [a1 invokeWithTarget:];
}

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return _[a1 isAppleAudioDevice];
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return _[a1 isCheckerBoardActive];
}

id objc_msgSend_isCommunicationAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCommunicationAvailable];
}

id objc_msgSend_isDisconnecting(void *a1, const char *a2, ...)
{
  return _[a1 isDisconnecting];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToIDSDevice_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToIDSDevice:];
}

id objc_msgSend_isEqualToNRDevice_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNRDevice:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToSFDevice_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSFDevice:];
}

id objc_msgSend_isEqualToSessionSettings_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSessionSettings:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isEqualToTestQueueEntry_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToTestQueueEntry:];
}

id objc_msgSend_isForceTouchAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isForceTouchAvailable];
}

id objc_msgSend_isHeadless(void *a1, const char *a2, ...)
{
  return _[a1 isHeadless];
}

id objc_msgSend_isIgnoringDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 isIgnoringDisconnect];
}

id objc_msgSend_isInBoxUpdateMode_(void *a1, const char *a2, ...)
{
  return [a1 isInBoxUpdateMode:];
}

id objc_msgSend_isIndeterminate(void *a1, const char *a2, ...)
{
  return _[a1 isIndeterminate];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isInternalInstall];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return _[a1 isLocallyPaired];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isMemberOfClass:];
}

id objc_msgSend_isSSRBootIntentSet(void *a1, const char *a2, ...)
{
  return _[a1 isSSRBootIntentSet];
}

id objc_msgSend_isSessionModeOveridden(void *a1, const char *a2, ...)
{
  return _[a1 isSessionModeOveridden];
}

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return _[a1 isTemporaryPaired];
}

id objc_msgSend_isTouchTypeStylus_(void *a1, const char *a2, ...)
{
  return [a1 isTouchTypeStylus:];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_issueClientCertificateWithCompletionOnQueue_withOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 issueClientCertificateWithCompletionOnQueue:withOptions:completion:];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_lastConnectionState(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectionState];
}

id objc_msgSend_lastMessageTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastMessageTimestamp];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_lineColor(void *a1, const char *a2, ...)
{
  return _[a1 lineColor];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return _[a1 lineWidth];
}

id objc_msgSend_lineWidthVariation(void *a1, const char *a2, ...)
{
  return _[a1 lineWidthVariation];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _[a1 listener];
}

id objc_msgSend_loadHTMLString_baseURL_(void *a1, const char *a2, ...)
{
  return [a1 loadHTMLString:baseURL:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_locallyPaired(void *a1, const char *a2, ...)
{
  return _[a1 locallyPaired];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return [a1 locationInView:];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return _[a1 macAddress];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeSignatureGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 makeSignatureGestureRecognizer];
}

id objc_msgSend_mapTableWithWeakToStrongObjects(void *a1, const char *a2, ...)
{
  return _[a1 mapTableWithWeakToStrongObjects];
}

id objc_msgSend_maximumPossibleForce(void *a1, const char *a2, ...)
{
  return _[a1 maximumPossibleForce];
}

id objc_msgSend_messageReceiverQueue(void *a1, const char *a2, ...)
{
  return _[a1 messageReceiverQueue];
}

id objc_msgSend_messageReceivingQueue(void *a1, const char *a2, ...)
{
  return _[a1 messageReceivingQueue];
}

id objc_msgSend_messageSendingQueue(void *a1, const char *a2, ...)
{
  return _[a1 messageSendingQueue];
}

id objc_msgSend_messenger(void *a1, const char *a2, ...)
{
  return _[a1 messenger];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return [a1 methodSignatureForSelector:];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return _[a1 modelNumber];
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return [a1 moveToPoint:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nanoDevice(void *a1, const char *a2, ...)
{
  return _[a1 nanoDevice];
}

id objc_msgSend_nanoObservationQueue(void *a1, const char *a2, ...)
{
  return _[a1 nanoObservationQueue];
}

id objc_msgSend_nanoRegistrationQueue(void *a1, const char *a2, ...)
{
  return _[a1 nanoRegistrationQueue];
}

id objc_msgSend_notifierConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 notifierConfiguration];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return _[a1 nrDevice];
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return _[a1 nsuuid];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfPages(void *a1, const char *a2, ...)
{
  return _[a1 numberOfPages];
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTouches];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_object_isEqualToObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object:isEqualToObject:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return _[a1 observer];
}

id objc_msgSend_observerDidChangeDevices_(void *a1, const char *a2, ...)
{
  return [a1 observerDidChangeDevices:];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return _[a1 offsetInFile];
}

id objc_msgSend_oneshotWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 oneshotWithHandler:];
}

id objc_msgSend_openAppleSMC_(void *a1, const char *a2, ...)
{
  return [a1 openAppleSMC];
}

id objc_msgSend_original(void *a1, const char *a2, ...)
{
  return _[a1 original];
}

id objc_msgSend_originalScreenBrightness(void *a1, const char *a2, ...)
{
  return _[a1 originalScreenBrightness];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return _[a1 paired];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevices];
}

id objc_msgSend_pairedDevicesSelectorBlock(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevicesSelectorBlock];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathArray(void *a1, const char *a2, ...)
{
  return _[a1 pathArray];
}

id objc_msgSend_pathWithRoundedStyle(void *a1, const char *a2, ...)
{
  return _[a1 pathWithRoundedStyle];
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_persistentTaskObservationQueue(void *a1, const char *a2, ...)
{
  return _[a1 persistentTaskObservationQueue];
}

id objc_msgSend_persistentTaskRegistrationQueue(void *a1, const char *a2, ...)
{
  return _[a1 persistentTaskRegistrationQueue];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return _[a1 phase];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_prepareSession(void *a1, const char *a2, ...)
{
  return _[a1 prepareSession];
}

id objc_msgSend_previousLocationInView_(void *a1, const char *a2, ...)
{
  return [a1 previousLocationInView:];
}

id objc_msgSend_primarySerialNumberForAirpodsDevice_(void *a1, const char *a2, ...)
{
  return [a1 primarySerialNumberForAirpodsDevice:];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return _[a1 productId];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return _[a1 productName];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return _[a1 profile];
}

id objc_msgSend_profileWithCommand_(void *a1, const char *a2, ...)
{
  return [a1 profileWithCommand:];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressForTest(void *a1, const char *a2, ...)
{
  return _[a1 progressForTest];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_proxyServer(void *a1, const char *a2, ...)
{
  return _[a1 proxyServer];
}

id objc_msgSend_purgeSecurityKey(void *a1, const char *a2, ...)
{
  return _[a1 purgeSecurityKey];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueEntryWithAttributes_parameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueEntryWithAttributes:parameters:completion:");
}

id objc_msgSend_queueUploadWithSourceData_andExtra_(void *a1, const char *a2, ...)
{
  return [a1 queueUploadWithSourceData:andExtra:];
}

id objc_msgSend_quickSwitchToNRDevice_completion_(void *a1, const char *a2, ...)
{
  return [a1 quickSwitchToNRDevice:completion:];
}

id objc_msgSend_readDataFor_value_size_(void *a1, const char *a2, ...)
{
  return [a1 readDataFor:value:size:];
}

id objc_msgSend_readDataOfLength_(void *a1, const char *a2, ...)
{
  return [a1 readDataOfLength:];
}

id objc_msgSend_readValueFor_(void *a1, const char *a2, ...)
{
  return [a1 readValueFor:];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_receiveMessage_data_fromDestination_expectsResponse_response_(void *a1, const char *a2, ...)
{
  return [a1 receiveMessage:data:fromDestination:expectsResponse:response:];
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return _[a1 receiver];
}

id objc_msgSend_reconfigureWithCommit_(void *a1, const char *a2, ...)
{
  return [a1 reconfigureWithCommit:];
}

id objc_msgSend_referenceKey(void *a1, const char *a2, ...)
{
  return _[a1 referenceKey];
}

id objc_msgSend_refreshWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 refreshWithCompletion:];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForLocalNotifications];
}

id objc_msgSend_releaseSandboxExtensionsWithHandles_(void *a1, const char *a2, ...)
{
  return [a1 releaseSandboxExtensionsWithHandles:];
}

id objc_msgSend_remoteClient(void *a1, const char *a2, ...)
{
  return _[a1 remoteClient];
}

id objc_msgSend_remoteClients(void *a1, const char *a2, ...)
{
  return _[a1 remoteClients];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_remoteRunnerDeviceEnded(void *a1, const char *a2, ...)
{
  return _[a1 remoteRunnerDeviceEnded];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeErrorCode_(void *a1, const char *a2, ...)
{
  return [a1 removeErrorCode:];
}

id objc_msgSend_removeErrorCodes_(void *a1, const char *a2, ...)
{
  return [a1 removeErrorCodes:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return [a1 removeTarget:];
}

id objc_msgSend_repairToolUploadClientWithUploadRequests_andDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repairToolUploadClientWithUploadRequests:andDelegate:");
}

id objc_msgSend_reportManager(void *a1, const char *a2, ...)
{
  return _[a1 reportManager];
}

id objc_msgSend_reportWithComponentPredicateManifest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportWithComponentPredicateManifest:completion:");
}

id objc_msgSend_requestAsset_completion_(void *a1, const char *a2, ...)
{
  return [a1 requestAsset:completion:];
}

id objc_msgSend_requestAsset_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestAsset:completionHandler:];
}

id objc_msgSend_requestAttestationBlobWithOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 requestAttestationBlobWithOptions:error:];
}

id objc_msgSend_requestAttestationCertWithOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 requestAttestationCertWithOptions:completion:];
}

id objc_msgSend_requestCapabilitiesSet_(void *a1, const char *a2, ...)
{
  return [a1 requestCapabilitiesSet:];
}

id objc_msgSend_requestSuiteFinishWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestSuiteFinishWithCompletionHandler:];
}

id objc_msgSend_requestSuiteStart_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestSuiteStart:completionHandler:];
}

id objc_msgSend_requestSuiteSummary_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestSuiteSummary:completionHandler:];
}

id objc_msgSend_requestUploadAssets_completion_(void *a1, const char *a2, ...)
{
  return [a1 requestUploadAssets:completion:];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeTests(void *a1, const char *a2, ...)
{
  return _[a1 resumeTests];
}

id objc_msgSend_retry(void *a1, const char *a2, ...)
{
  return _[a1 retry];
}

id objc_msgSend_retryBugSession(void *a1, const char *a2, ...)
{
  return _[a1 retryBugSession];
}

id objc_msgSend_sandboxExtensionHandles(void *a1, const char *a2, ...)
{
  return _[a1 sandboxExtensionHandles];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledImageToHeight_(void *a1, const char *a2, ...)
{
  return [a1 scaledImageToHeight:];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_sceneStatusBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 sceneStatusBarStyle:];
}

id objc_msgSend_scheduleNotification(void *a1, const char *a2, ...)
{
  return _[a1 scheduleNotification];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:repeats:block:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_seekToFileOffset_(void *a1, const char *a2, ...)
{
  return [a1 seekToFileOffset:];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return _[a1 selector];
}

id objc_msgSend_sendAnalyticsWithEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendAnalyticsWithEvent:];
}

id objc_msgSend_sendAnalyticsWithEvent_error_(void *a1, const char *a2, ...)
{
  return [a1 sendAnalyticsWithEvent:error:];
}

id objc_msgSend_sendAnalyticsWithEvent_payloadDict_(void *a1, const char *a2, ...)
{
  return [a1 sendAnalyticsWithEvent:payloadDict:];
}

id objc_msgSend_sendAuthInfoResult_error_(void *a1, const char *a2, ...)
{
  return [a1 sendAuthInfoResult:error:];
}

id objc_msgSend_sendMessage_data_toDestination_forceLocalDelivery_expectsResponse_response_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:];
}

id objc_msgSend_sendTestResult_error_(void *a1, const char *a2, ...)
{
  return [a1 sendTestResult:error:];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serialNumberLeft(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberLeft];
}

id objc_msgSend_serialNumberRight(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberRight];
}

id objc_msgSend_serialNumbers(void *a1, const char *a2, ...)
{
  return _[a1 serialNumbers];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionEndReason(void *a1, const char *a2, ...)
{
  return _[a1 sessionEndReason];
}

id objc_msgSend_sessionExistsForIdentities_ticketNumber_timeout_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionExistsForIdentities:ticketNumber:timeout:completion:");
}

id objc_msgSend_sessionSettings(void *a1, const char *a2, ...)
{
  return _[a1 sessionSettings];
}

id objc_msgSend_sessionSettingsWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 sessionSettingsWithDictionary:];
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:];
}

id objc_msgSend_sessionWithIdentity_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithIdentity:];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessoryResponder_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryResponder:];
}

id objc_msgSend_setActiveDeviceAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setActiveDeviceAssertion:];
}

id objc_msgSend_setActivePairedDevice_withActiveDeviceAssertionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActivePairedDevice:withActiveDeviceAssertionHandler:];
}

id objc_msgSend_setAirpodsUUID_(void *a1, const char *a2, ...)
{
  return [a1 setAirpodsUUID:];
}

id objc_msgSend_setAllowCellularSizeThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setAllowCellularSizeThreshold:];
}

id objc_msgSend_setAllowList_(void *a1, const char *a2, ...)
{
  return [a1 setAllowList:];
}

id objc_msgSend_setAllowsCellularUpload_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsCellularUpload];
}

id objc_msgSend_setAnimationCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationCompletion:];
}

id objc_msgSend_setAssetResponder_(void *a1, const char *a2, ...)
{
  return [a1 setAssetResponder:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return [a1 setBeginTime:];
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return [a1 setBorderColor:];
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return [a1 setBorderWidth:];
}

id objc_msgSend_setBrightnessResponder_(void *a1, const char *a2, ...)
{
  return [a1 setBrightnessResponder];
}

id objc_msgSend_setBtManager_(void *a1, const char *a2, ...)
{
  return [a1 setBtManager:];
}

id objc_msgSend_setBugSessionStarted_(void *a1, const char *a2, ...)
{
  return [a1 setBugSessionStarted:];
}

id objc_msgSend_setButtonEventMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setButtonEventMonitor:];
}

id objc_msgSend_setCertData_(void *a1, const char *a2, ...)
{
  return [a1 setCertData:];
}

id objc_msgSend_setCheck_(void *a1, const char *a2, ...)
{
  return [a1 setCheck:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClock_(void *a1, const char *a2, ...)
{
  return [a1 setClock:];
}

id objc_msgSend_setCloudkitContainer_(void *a1, const char *a2, ...)
{
  return [a1 setCloudkitContainer:];
}

id objc_msgSend_setCloudkitData_(void *a1, const char *a2, ...)
{
  return [a1 setCloudkitData:];
}

id objc_msgSend_setCloudkitUseDevelopmentEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setCloudkitUseDevelopmentEnvironment:];
}

id objc_msgSend_setCommunicationAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setCommunicationAvailable:];
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setCompletion:];
}

id objc_msgSend_setComponents_(void *a1, const char *a2, ...)
{
  return [a1 setComponents:];
}

id objc_msgSend_setConfigurator_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurator:];
}

id objc_msgSend_setConnecting_(void *a1, const char *a2, ...)
{
  return [a1 setConnecting:];
}

id objc_msgSend_setConsentData_(void *a1, const char *a2, ...)
{
  return [a1 setConsentData:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setContentsText_(void *a1, const char *a2, ...)
{
  return [a1 setContentsText:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCurrentPath_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPath:];
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return [a1 setData:];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDateStyle:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDevice:];
}

id objc_msgSend_setDeviceIdentityKey_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceIdentityKey:];
}

id objc_msgSend_setDeviceImage_forDeviceState_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceImage:forDeviceState:withCompletion:];
}

id objc_msgSend_setDevicePairingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDevicePairingEnabled:];
}

id objc_msgSend_setDeviceStatePingTimer_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceStatePingTimer:];
}

id objc_msgSend_setDevices_(void *a1, const char *a2, ...)
{
  return [a1 setDevices:];
}

id objc_msgSend_setDiagnosticEventID_(void *a1, const char *a2, ...)
{
  return [a1 setDiagnosticEventID:];
}

id objc_msgSend_setDisconnecting_(void *a1, const char *a2, ...)
{
  return [a1 setDisconnecting:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setDurationRemaining_(void *a1, const char *a2, ...)
{
  return [a1 setDurationRemaining:];
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return [a1 setEndDate:];
}

id objc_msgSend_setErrors_(void *a1, const char *a2, ...)
{
  return [a1 setErrors:];
}

id objc_msgSend_setEventDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setEventDelegate:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setFileURL:];
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return [a1 setFiles:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return [a1 setFillColor:];
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return [a1 setFillMode:];
}

id objc_msgSend_setFinishingMove_(void *a1, const char *a2, ...)
{
  return [a1 setFinishingMove:];
}

id objc_msgSend_setFirstResponseSent_(void *a1, const char *a2, ...)
{
  return [a1 setFirstResponseSent:];
}

id objc_msgSend_setFollowupFrequency_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupFrequency:];
}

id objc_msgSend_setFollowupLocalizedInformativeText_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupLocalizedInformativeText:];
}

id objc_msgSend_setFollowupLocalizedTitle_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupLocalizedTitle:];
}

id objc_msgSend_setFollowupNotificationActionTitle_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupNotificationActionTitle:];
}

id objc_msgSend_setFollowupNotificationActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupNotificationActionURL:];
}

id objc_msgSend_setFollowupReviewActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupReviewActionURL:];
}

id objc_msgSend_setFollowupUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupUniqueIdentifier:];
}

id objc_msgSend_setFollowupUseSpringboardNotification_(void *a1, const char *a2, ...)
{
  return [a1 setFollowupUseSpringboardNotification:];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setHasIgnoredDisconnect_(void *a1, const char *a2, ...)
{
  return [a1 setHasIgnoredDisconnect:];
}

id objc_msgSend_setHistory_(void *a1, const char *a2, ...)
{
  return [a1 setHistory:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIgnoreButtonEvents_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreButtonEvents:];
}

id objc_msgSend_setIgnoreDisconnectTimer_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreDisconnectTimer:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsIgnoringDisconnect_(void *a1, const char *a2, ...)
{
  return [a1 setIsIgnoringDisconnect:];
}

id objc_msgSend_setIsSessionModeOveridden_(void *a1, const char *a2, ...)
{
  return [a1 setIsSessionModeOveridden:];
}

id objc_msgSend_setLastConnectionState_(void *a1, const char *a2, ...)
{
  return [a1 setLastConnectionState:];
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return [a1 setLineCap:];
}

id objc_msgSend_setLineCapStyle_(void *a1, const char *a2, ...)
{
  return [a1 setLineCapStyle:];
}

id objc_msgSend_setLineJoin_(void *a1, const char *a2, ...)
{
  return [a1 setLineJoin:];
}

id objc_msgSend_setLineJoinStyle_(void *a1, const char *a2, ...)
{
  return [a1 setLineJoinStyle:];
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLineWidth:];
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return [a1 setListener:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setNavigationDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationDelegate:];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsDisplayInRect_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplayInRect:];
}

id objc_msgSend_setNextBootCheckerBoard(void *a1, const char *a2, ...)
{
  return _[a1 setNextBootCheckerBoard];
}

id objc_msgSend_setNextBootCheckerBoardPersistent(void *a1, const char *a2, ...)
{
  return _[a1 setNextBootCheckerBoardPersistent];
}

id objc_msgSend_setNextBootRecovery(void *a1, const char *a2, ...)
{
  return _[a1 setNextBootRecovery];
}

id objc_msgSend_setNotifierConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setNotifierConfiguration:];
}

id objc_msgSend_setNotifyingMove_(void *a1, const char *a2, ...)
{
  return [a1 setNotifyingMove:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOriginalScreenBrightness_(void *a1, const char *a2, ...)
{
  return [a1 setOriginalScreenBrightness:];
}

id objc_msgSend_setParameters_(void *a1, const char *a2, ...)
{
  return [a1 setParameters:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPhase_(void *a1, const char *a2, ...)
{
  return [a1 setPhase:];
}

id objc_msgSend_setProfile_(void *a1, const char *a2, ...)
{
  return [a1 setProfile:];
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return [a1 setProgress:];
}

id objc_msgSend_setProgressResponder_(void *a1, const char *a2, ...)
{
  return [a1 setProgressResponder:];
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return [a1 setProperties:];
}

id objc_msgSend_setRebootType_(void *a1, const char *a2, ...)
{
  return [a1 setRebootType:];
}

id objc_msgSend_setReceiver_(void *a1, const char *a2, ...)
{
  return [a1 setReceiver:];
}

id objc_msgSend_setRemoteClient_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteClient:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRepeatCount_(void *a1, const char *a2, ...)
{
  return [a1 setRepeatCount:];
}

id objc_msgSend_setReviewActionLabel_(void *a1, const char *a2, ...)
{
  return [a1 setReviewActionLabel];
}

id objc_msgSend_setSOCKSProxyPort_(void *a1, const char *a2, ...)
{
  return [a1 setSOCKSProxyPort:];
}

id objc_msgSend_setSOCKSProxyServer_(void *a1, const char *a2, ...)
{
  return [a1 setSOCKSProxyServer:];
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return [a1 setSession:];
}

id objc_msgSend_setSessionSettings_(void *a1, const char *a2, ...)
{
  return [a1 setSessionSettings:];
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setStartDate:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return [a1 setStatus:];
}

id objc_msgSend_setStatusBarResponder_(void *a1, const char *a2, ...)
{
  return [a1 setStatusBarResponder:];
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setStatusCode:];
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return _[a1 setStroke];
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeColor:];
}

id objc_msgSend_setStrokeEnd_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeEnd:];
}

id objc_msgSend_setStrokeStart_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeStart:];
}

id objc_msgSend_setStrongDeviceIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setStrongDeviceIdentity:];
}

id objc_msgSend_setSuiteDescription_(void *a1, const char *a2, ...)
{
  return [a1 setSuiteDescription:];
}

id objc_msgSend_setSuiteID_(void *a1, const char *a2, ...)
{
  return [a1 setSuiteID:];
}

id objc_msgSend_setSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 setSuiteName:];
}

id objc_msgSend_setSuitesAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setSuitesAvailable:];
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setSuspended:];
}

id objc_msgSend_setTestDuration_(void *a1, const char *a2, ...)
{
  return [a1 setTestDuration:];
}

id objc_msgSend_setTestID_(void *a1, const char *a2, ...)
{
  return [a1 setTestID:];
}

id objc_msgSend_setTestQueue_(void *a1, const char *a2, ...)
{
  return [a1 setTestQueue:];
}

id objc_msgSend_setTestSuiteImageData_(void *a1, const char *a2, ...)
{
  return [a1 setTestSuiteImageData:];
}

id objc_msgSend_setTests_(void *a1, const char *a2, ...)
{
  return [a1 setTests:];
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setTimeStyle:];
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setTimestamp:];
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return [a1 setTimingFunction:];
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return [a1 setToValue:];
}

id objc_msgSend_setUnpairOnTestCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setUnpairOnTestCompletion:];
}

id objc_msgSend_setUploadCompletedPercentage_(void *a1, const char *a2, ...)
{
  return [a1 setUploadCompletedPercentage:];
}

id objc_msgSend_setUploadDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setUploadDelegate:];
}

id objc_msgSend_setUploadStatusFromSource_withArray_(void *a1, const char *a2, ...)
{
  return [a1 setUploadStatusFromSource:withArray:];
}

id objc_msgSend_setUserAlertResponder_(void *a1, const char *a2, ...)
{
  return [a1 setUserAlertResponder:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setViewControllerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllerDelegate:];
}

id objc_msgSend_setVisibleAlert_(void *a1, const char *a2, ...)
{
  return [a1 setVisibleAlert:];
}

id objc_msgSend_setVolumeHUDResponder_(void *a1, const char *a2, ...)
{
  return [a1 setVolumeHUDResponder:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setWithCapacity:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccessoryManager];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedURLCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedURLCache];
}

id objc_msgSend_shouldShowResults(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowResults];
}

id objc_msgSend_showOnTopWithAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showOnTopWithAnimated:completion:");
}

id objc_msgSend_showSceneStatusBar(void *a1, const char *a2, ...)
{
  return _[a1 showSceneStatusBar];
}

id objc_msgSend_shutdownWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 shutdownWithOptions:];
}

id objc_msgSend_signDigest_error_(void *a1, const char *a2, ...)
{
  return [a1 signDigest:error:];
}

id objc_msgSend_signFile_error_(void *a1, const char *a2, ...)
{
  return [a1 signFile:error:];
}

id objc_msgSend_signPayload_error_(void *a1, const char *a2, ...)
{
  return [a1 signPayload:error:];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_signatureImageSize(void *a1, const char *a2, ...)
{
  return _[a1 signatureImageSize];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_skipped(void *a1, const char *a2, ...)
{
  return _[a1 skipped];
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 sleepForTimeInterval:];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _[a1 snapshot];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startBugSession(void *a1, const char *a2, ...)
{
  return _[a1 startBugSession];
}

id objc_msgSend_startBugSessionWithIdentifier_configuration_target_completion_(void *a1, const char *a2, ...)
{
  return [a1 startBugSessionWithIdentifier:configuration:target:completion:];
}

id objc_msgSend_startDEDSessionForDevice_withConfig_withNewSession_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 startDEDSessionForDevice:withConfig:withNewSession:completionHandler:];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startDiagnosticExtensionWithIdentifier_parameters_deferRunUntil_completion_(void *a1, const char *a2, ...)
{
  return [a1 startDiagnosticExtensionWithIdentifier:parameters:deferRunUntil:completion:];
}

id objc_msgSend_startTestWithCommand_(void *a1, const char *a2, ...)
{
  return [a1 startTestWithCommand:];
}

id objc_msgSend_startWithMode_(void *a1, const char *a2, ...)
{
  return [a1 startWithMode:];
}

id objc_msgSend_startWithPriority_completion_(void *a1, const char *a2, ...)
{
  return [a1 startWithPriority:completion:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusToString_(void *a1, const char *a2, ...)
{
  return [a1 statusToString:];
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 stopDiscovery];
}

id objc_msgSend_stopWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 stopWithCompletion:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByReplacingReservedURLCharactersUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingReservedURLCharactersUsingEncoding:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:encoding:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return _[a1 stroke];
}

id objc_msgSend_strokeColor(void *a1, const char *a2, ...)
{
  return _[a1 strokeColor];
}

id objc_msgSend_strongDeviceIdentity(void *a1, const char *a2, ...)
{
  return _[a1 strongDeviceIdentity];
}

id objc_msgSend_suiteDescription(void *a1, const char *a2, ...)
{
  return _[a1 suiteDescription];
}

id objc_msgSend_suiteID(void *a1, const char *a2, ...)
{
  return _[a1 suiteID];
}

id objc_msgSend_suiteName(void *a1, const char *a2, ...)
{
  return _[a1 suiteName];
}

id objc_msgSend_suites(void *a1, const char *a2, ...)
{
  return _[a1 suites];
}

id objc_msgSend_suitesAvailable(void *a1, const char *a2, ...)
{
  return _[a1 suitesAvailable];
}

id objc_msgSend_supportedDeviceAllowList(void *a1, const char *a2, ...)
{
  return _[a1 supportedDeviceAllowList];
}

id objc_msgSend_supportedDevices(void *a1, const char *a2, ...)
{
  return _[a1 supportedDevices];
}

id objc_msgSend_suspendTests(void *a1, const char *a2, ...)
{
  return _[a1 suspendTests];
}

id objc_msgSend_suspended(void *a1, const char *a2, ...)
{
  return _[a1 suspended];
}

id objc_msgSend_synchronizeSessionStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 synchronizeSessionStatusWithCompletion:];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 synchronousRemoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_targetDevices(void *a1, const char *a2, ...)
{
  return _[a1 targetDevices];
}

id objc_msgSend_testID(void *a1, const char *a2, ...)
{
  return _[a1 testID];
}

id objc_msgSend_testId(void *a1, const char *a2, ...)
{
  return _[a1 testId];
}

id objc_msgSend_testQueue(void *a1, const char *a2, ...)
{
  return _[a1 testQueue];
}

id objc_msgSend_testQueueWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 testQueueWithDelegate:];
}

id objc_msgSend_testSuiteName(void *a1, const char *a2, ...)
{
  return _[a1 testSuiteName];
}

id objc_msgSend_tests(void *a1, const char *a2, ...)
{
  return _[a1 tests];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_totalDuration(void *a1, const char *a2, ...)
{
  return _[a1 totalDuration];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transactionWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 transactionWithBlock:];
}

id objc_msgSend_transactionWithBlock_completion_(void *a1, const char *a2, ...)
{
  return [a1 transactionWithBlock:completion:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_undimCheckerBoardDisplay(void *a1, const char *a2, ...)
{
  return _[a1 undimCheckerBoardDisplay];
}

id objc_msgSend_undimDisplay(void *a1, const char *a2, ...)
{
  return _[a1 undimDisplay];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIDOverride];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unpackQueueWithOngoingExtensions_retry_(void *a1, const char *a2, ...)
{
  return [a1 unpackQueueWithOngoingExtensions:retry:];
}

id objc_msgSend_unpair(void *a1, const char *a2, ...)
{
  return _[a1 unpair];
}

id objc_msgSend_unpairOnTestCompletion(void *a1, const char *a2, ...)
{
  return _[a1 unpairOnTestCompletion];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForLocalNotifications];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateWithDeviceState_(void *a1, const char *a2, ...)
{
  return [a1 updateWithDeviceState:];
}

id objc_msgSend_uploadAssets_wtihDeviceIdentity_completion_(void *a1, const char *a2, ...)
{
  return [a1 uploadAssets:wtihDeviceIdentity:completion:];
}

id objc_msgSend_uploadCompletedPercentage(void *a1, const char *a2, ...)
{
  return _[a1 uploadCompletedPercentage];
}

id objc_msgSend_uploadFinished(void *a1, const char *a2, ...)
{
  return _[a1 uploadFinished];
}

id objc_msgSend_uploadStatus(void *a1, const char *a2, ...)
{
  return _[a1 uploadStatus];
}

id objc_msgSend_useSupportedDeviceAllowList(void *a1, const char *a2, ...)
{
  return _[a1 useSupportedDeviceAllowList];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGRect:];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_viewPrintFormatter(void *a1, const char *a2, ...)
{
  return _[a1 viewPrintFormatter];
}

id objc_msgSend_visibleAlert(void *a1, const char *a2, ...)
{
  return _[a1 visibleAlert];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_writeDataFor_value_size_(void *a1, const char *a2, ...)
{
  return [a1 writeDataFor:value:size:];
}

id objc_msgSend_writeValueFor_andValue_(void *a1, const char *a2, ...)
{
  return [a1 writeValueFor:andValue:];
}