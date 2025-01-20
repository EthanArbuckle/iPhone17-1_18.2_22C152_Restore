void sub_21BD0A604(double a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t vars8;

  sub_21BD0AAAC();
  v3 = v1 + OBJC_IVAR____MPCSleepTimerController_mode;
  *(double *)v3 = a1;
  *(unsigned char *)(v3 + 8) = 0;

  sub_21BD0AAF8();
}

void sub_21BD0A6A4()
{
  sub_21BD0AAAC();
  uint64_t v1 = v0 + OBJC_IVAR____MPCSleepTimerController_mode;
  *(void *)uint64_t v1 = 2;
  *(unsigned char *)(v1 + 8) = 1;
  v2 = sub_21BD0AEC8();

  sub_21BD0A3AC((uint64_t)v2);
}

void sub_21BD0A734()
{
  OUTLINED_FUNCTION_1_34(OBJC_IVAR____MPCSleepTimerController_mode);
  sub_21BD0AAAC();

  sub_21BD0A3AC(0);
}

uint64_t sub_21BD0A7D8()
{
  OUTLINED_FUNCTION_2_34();
  if (v1) {
    return qword_21BEF03C8[*v0];
  }
  else {
    return 1;
  }
}

double sub_21BD0A830()
{
  double result = *(double *)(v0 + OBJC_IVAR____MPCSleepTimerController_mode);
  if (*(unsigned char *)(v0 + OBJC_IVAR____MPCSleepTimerController_mode + 8)) {
    return 0.0;
  }
  return result;
}

double sub_21BD0A890()
{
  sub_21BC65664();
  MEMORY[0x270FA5388](v1 - 8, v2, v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21BEA8D18();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v6, v8, v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13, v14);
  v16 = (char *)&v25 - v15;
  OUTLINED_FUNCTION_2_34();
  if (!v18 || (double v19 = 0.0, !*v17))
  {
    v20 = *(void **)(v0 + OBJC_IVAR____MPCSleepTimerController_timer);
    if (v20)
    {
      id v21 = objc_msgSend(v20, sel_fireDate);
      sub_21BEA8CF8();

      v22 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v22(v5, v12, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
      if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) != 1)
      {
        v22(v16, v5, v6);
        sub_21BEA8CA8();
        double v19 = v23;
        (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
        return v19;
      }
    }
    else
    {
      __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
    }
    sub_21BD0B120((uint64_t)v5);
    return 0.0;
  }
  return v19;
}

void sub_21BD0AAAC()
{
  OUTLINED_FUNCTION_1_34(OBJC_IVAR____MPCSleepTimerController_mode);
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____MPCSleepTimerController_timer), sel_invalidate);

  sub_21BD0A3A0(0);
}

void sub_21BD0AAF8()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____MPCSleepTimerController_mode + 8) & 1) == 0)
  {
    double v1 = *(double *)(v0 + OBJC_IVAR____MPCSleepTimerController_mode);
    uint64_t v2 = self;
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____MPCSleepTimerController_identifier);
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR____MPCSleepTimerController_identifier + 8);
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = v3;
    v6[3] = 0x4000000000000000;
    v6[4] = v5;
    v6[5] = v4;
    v9[4] = sub_21BD0BD38;
    v9[5] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_21BD0AE60;
    v9[3] = &block_descriptor_27_0;
    uint64_t v7 = _Block_copy(v9);
    swift_bridgeObjectRetain();
    swift_release();
    id v8 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v7, v1);
    _Block_release(v7);
    sub_21BD0A3A0((uint64_t)v8);
  }
}

void sub_21BD0AC60(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x21D49EBF0](v4);
  if (v5)
  {
    uint64_t v6 = (char *)v5;
    sub_21BD0AAAC();
    uint64_t v7 = &v6[OBJC_IVAR____MPCSleepTimerController_playbackEngine];
    id v8 = (void *)MEMORY[0x21D49EBF0](&v6[OBJC_IVAR____MPCSleepTimerController_playbackEngine]);
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_eventObserver);
      if (objc_msgSend(v10, sel_respondsToSelector_, sel_engineDidEndSleepTimer_)) {
        objc_msgSend(v10, sel_engineDidEndSleepTimer_, v9);
      }
    }
    uint64_t v11 = (void *)MEMORY[0x21D49EBF0](v7);
    if (v11)
    {
      v12 = v11;
      id v13 = objc_msgSend(v11, sel_player);

      objc_msgSend(v13, sel_currentRate);
      float v15 = v14;

      if (v15 > 0.0)
      {
        v16 = (void *)MEMORY[0x21D49EBF0](v7);
        if (v16)
        {
          v17 = v16;
          id v18 = objc_msgSend(v16, sel_player);

          uint64_t v19 = sub_21BEAA138();
          aBlock[4] = sub_21BD0AE5C;
          aBlock[5] = 0;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_21BD0A334;
          aBlock[3] = &block_descriptor_30;
          v20 = _Block_copy(aBlock);
          objc_msgSend(v18, sel_pauseForSleepTimerWithFadeout_identifier_completion_, v19, v20, a1);

          _Block_release(v20);
          uint64_t v6 = (char *)v19;
        }
      }
    }
  }
}

void sub_21BD0AE60(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void *sub_21BD0AEC8()
{
  uint64_t v1 = v0 + OBJC_IVAR____MPCSleepTimerController_playbackEngine;
  uint64_t v2 = (void *)MEMORY[0x21D49EBF0](v1);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_queueController);

  if (!v4) {
    return 0;
  }
  id v5 = objc_msgSend(v4, sel_currentItem);

  if (!v5) {
    return 0;
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (!v6 || (uint64_t v7 = (void *)v6, (v8 = (void *)MEMORY[0x21D49EBF0](v1)) == 0))
  {

    return 0;
  }
  uint64_t v9 = v8;
  id v10 = objc_msgSend(v8, sel_player);

  objc_msgSend(v10, sel_currentTime);
  double v12 = v11;

  id v13 = objc_msgSend(v7, sel_chapters);
  sub_21BC0BE78(0, (unint64_t *)&qword_26AAEFA88);
  unint64_t v14 = sub_21BEAA308();

  if (v14 >> 62) {
    goto LABEL_23;
  }
  uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v15; uint64_t v15 = sub_21BEAAD88())
  {
    uint64_t v16 = 4;
    while (1)
    {
      id v17 = (v14 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x21D49C490](v16 - 4, v14)
          : *(id *)(v14 + 8 * v16);
      id v18 = v17;
      uint64_t v19 = v16 - 3;
      if (__OFADD__(v16 - 4, 1)) {
        break;
      }
      objc_msgSend(v17, sel_startTime);
      if (v20 <= v12)
      {
        objc_msgSend(v18, sel_startTime);
        double v22 = v21;
        objc_msgSend(v18, sel_duration);
        if (v12 < v22 + v23)
        {

          swift_bridgeObjectRelease();
          goto LABEL_21;
        }
      }

      ++v16;
      if (v19 == v15) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
  }
LABEL_16:

  swift_bridgeObjectRelease();
  id v18 = 0;
LABEL_21:
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_21BD0B120(uint64_t a1)
{
  sub_21BC65664();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id SleepTimerController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void SleepTimerController.init()()
{
}

id SleepTimerController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepTimerController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall SleepTimerController.didEndPlaybackForCurrentItem()()
{
  OUTLINED_FUNCTION_2_34();
  if (v2)
  {
    if (*v1 == 1)
    {
      sub_21BD0A734();
      uint64_t v3 = v0 + OBJC_IVAR____MPCSleepTimerController_playbackEngine;
      id v4 = (void *)MEMORY[0x21D49EBF0](v0 + OBJC_IVAR____MPCSleepTimerController_playbackEngine);
      if (v4)
      {
        id v5 = v4;
        id v6 = objc_msgSend(v4, sel_queueController);

        if (v6)
        {
          id v7 = objc_msgSend(v6, sel_currentItem);

          if (v7)
          {
            sub_21BD0BA70(v7);
            if (v8)
            {
              uint64_t v9 = (void *)MEMORY[0x21D49EBF0](v3);
              if (v9
                && (id v10 = v9,
                    id v11 = objc_msgSend(v9, sel_queueController),
                    v10,
                    v11))
              {
                double v12 = (void *)sub_21BEAA138();
                swift_bridgeObjectRelease();
                unsigned __int8 v13 = objc_msgSend(v11, sel_canNextTrackForContentItemID_reason_, v12, 0);

                if (v13)
                {
                  unint64_t v14 = (void *)MEMORY[0x21D49EBF0](v3);
                  if (v14)
                  {
                    uint64_t v15 = v14;
                    id v16 = objc_msgSend(v14, sel_player);

                    id v17 = (void *)sub_21BEAA138();
                    v19[4] = sub_21BD0AE5C;
                    v19[5] = 0;
                    v19[0] = MEMORY[0x263EF8330];
                    v19[1] = 1107296256;
                    v19[2] = sub_21BD0A334;
                    v19[3] = &block_descriptor_25;
                    id v18 = _Block_copy(v19);
                    objc_msgSend(v16, sel_pauseForSleepTimerWithFadeout_identifier_completion_, v17, v18, 0.0);
                    _Block_release(v18);
                  }
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }
            }
          }
        }
      }
    }
  }
}

void sub_21BD0B4D8(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (qword_267C62778 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_21BEA9B18();
    __swift_project_value_buffer(v3, (uint64_t)qword_267C72D90);
    id v4 = a1;
    id v5 = a1;
    oslog = sub_21BEA9B08();
    os_log_type_t v6 = sub_21BEAA6B8();
    if (os_log_type_enabled(oslog, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)id v7 = 138412290;
      id v9 = a1;
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_21BEAAA78();
      *uint64_t v8 = v11;

      _os_log_impl(&dword_21BB87000, oslog, v6, "Error pausing player - %@", v7, 0xCu);
      sub_21BC51DC8();
      swift_arrayDestroy();
      MEMORY[0x21D49EAD0](v8, -1, -1);
      MEMORY[0x21D49EAD0](v7, -1, -1);
    }
    else
    {
    }
  }
}

Swift::Void __swiftcall SleepTimerController.didChangeItemElapsedTime(_:)(Swift::Double a1)
{
  OUTLINED_FUNCTION_2_34();
  if (v15 && *v2 >= 2uLL)
  {
    uint64_t v3 = v1;
    id v4 = sub_21BD0AEC8();
    if (v4)
    {
      id v5 = v4;
      os_log_type_t v6 = *(void **)(v1 + OBJC_IVAR____MPCSleepTimerController_observedChapter);
      if (v6)
      {
        id v26 = v5;
        id v7 = objc_msgSend(v6, sel_identifier);
        uint64_t v8 = sub_21BEAA178();
        uint64_t v10 = v9;

        id v11 = objc_msgSend(v26, sel_identifier);
        uint64_t v12 = sub_21BEAA178();
        uint64_t v14 = v13;

        BOOL v15 = v12 == v8 && v14 == v10;
        if (v15)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v16 = sub_21BEAAE78();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v16)
          {
          }
          else
          {
            sub_21BD0A3AC(0);
            if (qword_267C62778 != -1) {
              swift_once();
            }
            uint64_t v17 = sub_21BEA9B18();
            __swift_project_value_buffer(v17, (uint64_t)qword_267C72D90);
            id v18 = sub_21BEA9B08();
            os_log_type_t v19 = sub_21BEAA6C8();
            if (os_log_type_enabled(v18, v19))
            {
              double v20 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)double v20 = 0;
              _os_log_impl(&dword_21BB87000, v18, v19, "Sleep timer pausing because chapter ended", v20, 2u);
              MEMORY[0x21D49EAD0](v20, -1, -1);
            }

            double v21 = (void *)MEMORY[0x21D49EBF0](v3 + OBJC_IVAR____MPCSleepTimerController_playbackEngine);
            if (v21)
            {
              double v22 = v21;
              id v23 = objc_msgSend(v21, sel_player);

              v24 = (void *)sub_21BEAA138();
              aBlock[4] = sub_21BD0AE5C;
              aBlock[5] = 0;
              aBlock[0] = MEMORY[0x263EF8330];
              aBlock[1] = 1107296256;
              aBlock[2] = sub_21BD0A334;
              aBlock[3] = &block_descriptor_3_0;
              uint64_t v25 = _Block_copy(aBlock);
              objc_msgSend(v23, sel_pauseForSleepTimerWithFadeout_identifier_completion_, v24, v25, 0.0);
              _Block_release(v25);
            }
            sub_21BD0A734();
          }
        }
      }
      else
      {
      }
    }
  }
}

uint64_t sub_21BD0BA70(void *a1)
{
  id v2 = objc_msgSend(a1, sel_contentItemID);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_21BEAA178();

  return v3;
}

uint64_t method lookup function for SleepTimerController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SleepTimerController);
}

uint64_t dispatch thunk of SleepTimerController.__allocating_init(playbackEngine:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of SleepTimerController.startSleepTimerForItemEnd()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SleepTimerController.startSleepTimer(withTimeRemaining:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SleepTimerController.startSleepTimerForChapterEnd()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SleepTimerController.reset()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SleepTimerController.stopMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SleepTimerController.time.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SleepTimerController.fireDate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

ValueMetadata *type metadata accessor for SleepTimerController.StopMode()
{
  return &type metadata for SleepTimerController.StopMode;
}

uint64_t sub_21BD0BCC0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21BD0BCF8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_21BD0BD38(uint64_t a1)
{
  sub_21BD0AC60(*(double *)(v1 + 24), a1, *(void *)(v1 + 16));
}

uint64_t sub_21BD0BD58()
{
  id v1 = objc_msgSend(v0, sel_avPlayerItem);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v1, sel_asset);
    objc_msgSend(v3, sel_loggingIdentifier);

    sub_21BC9BA34();
    OUTLINED_FUNCTION_48();
    swift_unknownObjectRelease();
    sub_21BEAA238();
    OUTLINED_FUNCTION_48();

    return 0;
  }
  else
  {
    id v5 = objc_msgSend(v0, sel_contentItemID);
    uint64_t v4 = sub_21BEAA178();
  }
  return v4;
}

uint64_t sub_21BD0BE74()
{
  id v1 = objc_msgSend(v0, sel_contentItemID);
  uint64_t v2 = sub_21BEAA178();

  return v2;
}

uint64_t sub_21BD0BECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_21BEAAE78();
  }
}

uint64_t sub_21BD0BEE8(uint64_t *a1, uint64_t *a2)
{
  return sub_21BD0BECC(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_21BD0BEFC()
{
  swift_bridgeObjectRetain();
  sub_21BEAA228();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD0BF58()
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD0BFB8()
{
  return sub_21BD0BF58();
}

uint64_t sub_21BD0BFC0()
{
  return sub_21BD0BEFC();
}

uint64_t sub_21BD0BFC8()
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD0C020()
{
  return sub_21BCEFE68(*v0);
}

unint64_t QueuePlayerItemType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_21BD0C040()
{
  unint64_t result = qword_267C651B0;
  if (!qword_267C651B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C651B0);
  }
  return result;
}

unint64_t sub_21BD0C08C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = QueuePlayerItemType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

ValueMetadata *type metadata accessor for QueuePlayerItemType()
{
  return &type metadata for QueuePlayerItemType;
}

void *initializeBufferWithCopyOfBuffer for ItemID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ItemID(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ItemID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ItemID()
{
  return &type metadata for ItemID;
}

unint64_t sub_21BD0C18C()
{
  unint64_t result = qword_267C651B8;
  if (!qword_267C651B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C651B8);
  }
  return result;
}

uint64_t sub_21BD0C1DC()
{
  id v1 = objc_msgSend(v0, sel_outputs);
  sub_21BD0C3A8();
  unint64_t v2 = sub_21BEAA308();

  if (v2 >> 62) {
    goto LABEL_18;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_21BEAAD88())
  {
    unint64_t v17 = v2 & 0xC000000000000001;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = v17 ? (id)MEMORY[0x21D49C490](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      os_log_type_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      unint64_t v8 = v2;
      id v9 = objc_msgSend(v5, sel_portType);
      uint64_t v10 = sub_21BEAA178();
      uint64_t v12 = v11;
      if (v10 == sub_21BEAA178() && v12 == v13)
      {

        swift_bridgeObjectRelease_n();
        char v15 = 1;
        goto LABEL_20;
      }
      char v15 = sub_21BEAAE78();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
        ++v4;
        unint64_t v2 = v8;
        if (v7 != v3) {
          continue;
        }
      }
      goto LABEL_20;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  char v15 = 0;
LABEL_20:
  swift_bridgeObjectRelease_n();
  return v15 & 1;
}

unint64_t sub_21BD0C3A8()
{
  unint64_t result = qword_26AAEEBC8;
  if (!qword_26AAEEBC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AAEEBC8);
  }
  return result;
}

uint64_t sub_21BD0C3E8()
{
  uint64_t v1 = sub_21BEAA178();
  uint64_t v3 = v2;
  *(void *)&v52[0] = v0;
  sub_21BCB6938();
  sub_21BD0CA90();
  id v4 = v0;
  uint64_t v5 = sub_21BEAAE48();
  if (v5)
  {
    os_log_type_t v6 = (void *)v5;
  }
  else
  {
    os_log_type_t v6 = (void *)swift_allocError();
    *uint64_t v7 = *(void *)&v52[0];
  }
  unint64_t v8 = (void *)sub_21BEA8B08();

  id v9 = &selRef_updateActiveFormat_justification_;
  id v10 = objc_msgSend(v8, sel_userInfo);
  uint64_t v11 = sub_21BEAA0A8();

  swift_bridgeObjectRetain();
  sub_21BD0CAE0(v1, v3, v11, v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = &selRef_setWillBecomeActivePlayerItemHandler_;
  if (*((void *)&v51 + 1))
  {

    sub_21BC1DDD0(v50, v52);
    sub_21BC1DDD0(v52, &v53);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21BC04BE0((uint64_t)v50);
    id v13 = objc_msgSend(v8, sel_underlyingErrors);
    sub_21BC02A18();
    uint64_t v14 = sub_21BEAA308();

    uint64_t v48 = v14;
    if (*(void *)(v14 + 16))
    {
      while (1)
      {
        *(void *)&v52[0] = *(void *)(v14 + 32);
        id v15 = *(id *)&v52[0];
        if (!swift_dynamicCast())
        {
LABEL_19:

          id v9 = &selRef_updateActiveFormat_justification_;
          goto LABEL_20;
        }
        id v16 = v50[0];
        id v17 = objc_msgSend(v50[0], sel_userInfo);
        uint64_t v18 = sub_21BEAA0A8();

        if (*(void *)(v18 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v19 = sub_21BD0CBA4(v1, v3);
          if (v20)
          {
            sub_21BC1E7C4(*(void *)(v18 + 56) + 32 * v19, (uint64_t)v50);
          }
          else
          {
            *(_OWORD *)v50 = 0u;
            long long v51 = 0u;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          *(_OWORD *)v50 = 0u;
          long long v51 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v51 + 1))
        {

          swift_bridgeObjectRelease();
          sub_21BC1DDD0(v50, v52);
          sub_21BC1DDD0(v52, &v53);
          swift_bridgeObjectRelease();
          id v9 = &selRef_updateActiveFormat_justification_;
          uint64_t v12 = &selRef_setWillBecomeActivePlayerItemHandler_;
          goto LABEL_21;
        }
        uint64_t result = sub_21BC04BE0((uint64_t)v50);
        if (!*(void *)(v48 + 16)) {
          break;
        }
        sub_21BD0CC1C(0, 1);
        id v22 = objc_msgSend(v16, sel_underlyingErrors);
        id v23 = (void *)sub_21BEAA308();

        sub_21BD0CD34(v23);
        uint64_t v14 = v48;
        if (!*(void *)(v48 + 16)) {
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_51:
      __break(1u);
      return result;
    }

LABEL_20:
    uint64_t v12 = &selRef_setWillBecomeActivePlayerItemHandler_;
    swift_bridgeObjectRelease();
    long long v53 = 0u;
    long long v54 = 0u;
    swift_bridgeObjectRelease();
  }
LABEL_21:
  if (*((void *)&v54 + 1))
  {
    sub_21BD0CB44();
    if (swift_dynamicCast()) {
      return *(void *)&v52[0];
    }
  }
  else
  {
    sub_21BC04BE0((uint64_t)&v53);
  }
  *(void *)&v52[0] = v4;
  id v24 = v4;
  uint64_t v25 = sub_21BEAAE48();
  if (v25)
  {
    id v26 = (void *)v25;
  }
  else
  {
    id v26 = (void *)swift_allocError();
    void *v27 = *(void *)&v52[0];
  }
  v28 = (void *)sub_21BEA8B08();

  id v29 = [v28 v9[33]];
  uint64_t v30 = sub_21BEAA0A8();

  uint64_t v31 = OUTLINED_FUNCTION_0_44();
  sub_21BD0CAE0(v31, v32, v30, v33);
  swift_bridgeObjectRelease();
  if (*((void *)&v51 + 1))
  {

LABEL_30:
    sub_21BC1DDD0(v50, v52);
    sub_21BC1DDD0(v52, &v53);
  }
  else
  {
    sub_21BC04BE0((uint64_t)v50);
    id v34 = [v28 v12[492]];
    sub_21BC02A18();
    uint64_t v35 = sub_21BEAA308();

    uint64_t v49 = v35;
    if (*(void *)(v35 + 16))
    {
      v36 = v12;
      do
      {
        *(void *)&v52[0] = *(void *)(v35 + 32);
        id v37 = *(id *)&v52[0];
        if (!swift_dynamicCast()) {
          break;
        }
        id v38 = v50[0];
        v39 = v9;
        id v40 = [v50[0] v9[33]];
        uint64_t v41 = sub_21BEAA0A8();

        if (*(void *)(v41 + 16) && (uint64_t v42 = OUTLINED_FUNCTION_0_44(), v44 = sub_21BD0CBA4(v42, v43), (v45 & 1) != 0))
        {
          sub_21BC1E7C4(*(void *)(v41 + 56) + 32 * v44, (uint64_t)v50);
        }
        else
        {
          *(_OWORD *)v50 = 0u;
          long long v51 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v51 + 1))
        {

          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
        uint64_t result = sub_21BC04BE0((uint64_t)v50);
        if (!*(void *)(v49 + 16)) {
          goto LABEL_51;
        }
        sub_21BD0CC1C(0, 1);
        id v46 = [v38 (SEL)v36 + 54];
        v47 = (void *)sub_21BEAA308();

        sub_21BD0CD34(v47);
        uint64_t v35 = v49;
        id v9 = v39;
      }
      while (*(void *)(v49 + 16));
    }

    swift_bridgeObjectRelease();
    long long v53 = 0u;
    long long v54 = 0u;
  }
  if (*((void *)&v54 + 1))
  {
    sub_21BD0CB44();
    if (swift_dynamicCast()) {
      return *(void *)&v52[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_21BC04BE0((uint64_t)&v53);
    return 0;
  }
}

unint64_t sub_21BD0CA90()
{
  unint64_t result = qword_26AAF3640;
  if (!qword_26AAF3640)
  {
    sub_21BCB6938();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAF3640);
  }
  return result;
}

double sub_21BD0CAE0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_21BD0CBA4(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_21BC1E7C4(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void sub_21BD0CB44()
{
  if (!qword_267C640D8)
  {
    unint64_t v0 = sub_21BEAA0E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C640D8);
    }
  }
}

unint64_t sub_21BD0CBA4(uint64_t a1, uint64_t a2)
{
  sub_21BEAAFB8();
  sub_21BEAA228();
  uint64_t v4 = sub_21BEAAFE8();

  return sub_21BD0CE24(a1, a2, v4);
}

uint64_t sub_21BD0CC1C(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_21BD0CF6C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  sub_21BC02A18();
  double result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_21;
  }
  uint64_t v12 = v4[2];
  uint64_t v13 = v12 - a2;
  if (__OFSUB__(v12, a2)) {
    goto LABEL_27;
  }
  uint64_t v14 = (char *)&v4[a2 + 4];
  if (v6 != a2 || &v14[8 * v13] <= (char *)&v4[v6 + 4])
  {
    double result = (uint64_t)memmove(&v4[v6 + 4], v14, 8 * v13);
    uint64_t v12 = v4[2];
  }
  BOOL v16 = __OFADD__(v12, v8);
  uint64_t v17 = v12 - v7;
  if (!v16)
  {
    v4[2] = v17;
LABEL_21:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21BD0CD34(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  double result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > v3[3] >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    double result = sub_21BD0CF6C(result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!v6[2])
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_21BC02A18();
  double result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    double result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

unint64_t sub_21BD0CE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_21BEAAE78() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        uint64_t v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_21BEAAE78() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            id v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_21BEAAE78()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

void *sub_21BD0CF6C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_21BD0D084();
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_21BC02A18();
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_21BD0D084()
{
  if (!qword_267C651C0)
  {
    sub_21BC02A18();
    unint64_t v0 = sub_21BEAAE28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C651C0);
    }
  }
}

uint64_t sub_21BD0D0DC(uint64_t a1)
{
  sub_21BC331A0(a1, (uint64_t)&v8);
  if (((v12 >> 59) & 0x1E | (v12 >> 2) & 1) == 0x11)
  {
    uint64_t v3 = v9;
    uint64_t v4 = v10;
    char v5 = *(void **)(v1 + 16);
    v12 &= 0xFFFFFFFFFFFFFFBuLL;
    v13[0] = v8;
    v13[1] = v9;
    v13[2] = v10;
    v13[3] = v5;
    v13[4] = v11;
    memset(&v13[5], 0, 24);
    v13[8] = 0x8000000000000004;
    swift_unknownObjectRetain();
    swift_retain();
    sub_21BC018C0(v3, v4);
    sub_21BC01670(v5);
    char v6 = sub_21BC93D68((uint64_t)v13);
    sub_21BC0233C(v3, v4);
    sub_21BC020C8(v5);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    char v6 = sub_21BC93D68(a1);
  }
  return v6 & 1;
}

unint64_t sub_21BD0D1E4()
{
  return 0xD000000000000015;
}

uint64_t sub_21BD0D200()
{
  uint64_t v0 = sub_21BC94334();

  return MEMORY[0x270FA0228](v0, 217, 7);
}

uint64_t type metadata accessor for PausedAtQueueEndState()
{
  return self;
}

uint64_t sub_21BD0D254(uint64_t a1, float a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  float v4 = *(float *)(a1 + 32);
  uint64_t result = 0;
  if (v4 != a2)
  {
    uint64_t v6 = v2 - 1;
    uint64_t v7 = a1 + 36;
    while (v6 != result)
    {
      float v8 = *(float *)(v7 + 4 * result++);
      if (v8 == a2) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

void sub_21BD0D2B4()
{
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_48_9();
  if (v1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    sub_21BCD9EFC(0, (v0 & 0xC000000000000001) == 0, v0);
    if ((v0 & 0xC000000000000001) != 0) {
      id v3 = (id)MEMORY[0x21D49C490](0, v0);
    }
    else {
      id v3 = *(id *)(v0 + 32);
    }
    float v4 = v3;
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2DF0);
    char v5 = sub_21BEAA9F8();

    if (v5) {
      break;
    }
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      if (v7 == v2) {
        goto LABEL_21;
      }
      if ((v0 & 0xC000000000000001) != 0)
      {
        id v8 = (id)MEMORY[0x21D49C490](v6 + 1, v0);
      }
      else
      {
        if ((v7 & 0x8000000000000000) != 0) {
          goto LABEL_18;
        }
        if (v7 >= *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_19;
        }
        id v8 = *(id *)(v0 + 32 + 8 * v7);
      }
      uint64_t v9 = v8;
      char v10 = sub_21BEAA9F8();

      ++v6;
      if (v10) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }
LABEL_21:
  OUTLINED_FUNCTION_16_11();
}

uint64_t sub_21BD0D434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  if (!v5) {
    return 0;
  }
  OUTLINED_FUNCTION_110();
  BOOL v8 = *(void *)(v7 + 32) == v4 && *(void *)(v7 + 40) == v3;
  if (v8 || (sub_21BEAAE78() & 1) != 0) {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = (void *)(a3 + 56);
  uint64_t v12 = 1;
  while (1)
  {
    if (v5 == v12) {
      return 0;
    }
    ++v10;
    if (*(v11 - 1) == v4 && *v11 == v3) {
      break;
    }
    char v14 = sub_21BEAAE78();
    uint64_t result = v12++;
    v11 += 2;
    if (v14) {
      return result;
    }
  }
  return v10;
}

void sub_21BD0D51C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_70_3();
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v18 = v16;
    OUTLINED_FUNCTION_68_3();
    sub_21BCB3C1C();
    sub_21BD24FA8();
    OUTLINED_FUNCTION_109();
    sub_21BC38934();
    uint64_t v19 = v18 + 48;
    do
    {
      swift_bridgeObjectRetain_n();
      OUTLINED_FUNCTION_80_1();
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = a16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_65_4();
        sub_21BCB3C1C();
        uint64_t v20 = a16;
      }
      unint64_t v21 = *(void *)(v20 + 16);
      if (v21 >= *(void *)(v20 + 24) >> 1)
      {
        sub_21BCB3C1C();
        uint64_t v20 = a16;
      }
      *(void *)(v20 + 16) = v21 + 1;
      id v22 = (void *)(v20 + 24 * v21);
      v22[4] = a13;
      v22[5] = a14;
      v22[6] = a15;
      v19 += 24;
      --v17;
    }
    while (v17);
  }
  OUTLINED_FUNCTION_63_3();
}

uint64_t sub_21BD0D640(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    OUTLINED_FUNCTION_68_3();
    sub_21BCB3C5C();
    uint64_t v2 = v8;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_89_1();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_65_4();
        sub_21BCB3C5C();
        uint64_t v2 = v8;
      }
      unint64_t v5 = *(void *)(v2 + 16);
      if (v5 >= *(void *)(v2 + 24) >> 1)
      {
        sub_21BCB3C5C();
        uint64_t v2 = v8;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v5 + 1;
      sub_21BC1DDD0(&v7, (_OWORD *)(v2 + 32 * v5 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_21BD0D744(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_21BCB3CBC();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v4 = v19;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v5 = (id)MEMORY[0x21D49C490](v3, a1);
        }
        else {
          id v5 = *(id *)(a1 + 8 * v3 + 32);
        }
        id v6 = v5;
        uint64_t v7 = type metadata accessor for PodcastAVItem();
        uint64_t v17 = v7;
        uint64_t v18 = &off_26CBC80E0;
        v16[0] = v6;
        uint64_t v19 = v4;
        unint64_t v8 = *(void *)(v4 + 16);
        if (v8 >= *(void *)(v4 + 24) >> 1)
        {
          sub_21BCB3CBC();
          uint64_t v9 = v17;
          uint64_t v10 = v18;
        }
        else
        {
          uint64_t v9 = v7;
          uint64_t v10 = &off_26CBC80E0;
        }
        ++v3;
        uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v9);
        MEMORY[0x270FA5388](v11, v11, v12);
        char v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v15 + 16))(v14);
        sub_21BD24E3C(v8, (uint64_t)v14, &v19, v9, (uint64_t)v10);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v16);
        uint64_t v4 = v19;
      }
      while (v2 != v3);
    }
  }
}

uint64_t sub_21BD0D948(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_21BEAACD8();
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_21BEAA138();
      swift_bridgeObjectRelease();
      sub_21BEAACB8();
      sub_21BEAACE8();
      sub_21BEAACF8();
      sub_21BEAACC8();
      v4 += 16;
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

uint64_t sub_21BD0DA0C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_21BD0DAA4(a1, a2, a3, a4, (uint64_t (*)(void))sub_21BD23508);
}

uint64_t sub_21BD0DA24(uint64_t a1)
{
  uint64_t v1 = sub_21BD236F4(a1);
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_21BD0DA58(uint64_t a1)
{
  uint64_t v1 = sub_21BD235F0(a1);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_21BD0DA8C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_21BD0DAA4(a1, a2, a3, a4, (uint64_t (*)(void))sub_21BD237FC);
}

uint64_t sub_21BD0DAA4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(void))
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_21BEAAE98();
  swift_unknownObjectRetain_n();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v10 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    OUTLINED_FUNCTION_89_1();
    uint64_t v8 = a5();
    goto LABEL_9;
  }
  uint64_t v8 = swift_dynamicCastClass();
  if (!v8)
  {
    swift_unknownObjectRelease();
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v8;
}

uint64_t sub_21BD0DB9C(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

unint64_t sub_21BD0DBFC(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v4 = *(void *)(a3 + 16);
  if (v4 < result || (uint64_t)v4 < v3) {
    goto LABEL_11;
  }
  if ((v3 & 0x8000000000000000) == 0) {
    return swift_bridgeObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_21BD0DC78(uint64_t a1)
{
  OUTLINED_FUNCTION_5_1();
  *uint64_t v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t static QueueControllerBehaviorPodcasts.supportsSecureCoding.getter()
{
  return byte_267C651D0;
}

uint64_t static QueueControllerBehaviorPodcasts.supportsSecureCoding.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_27_14();
  byte_267C651D0 = a1;
  return result;
}

uint64_t (*static QueueControllerBehaviorPodcasts.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21BD0DDDC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations);
  OUTLINED_FUNCTION_2();
  return *v1;
}

uint64_t sub_21BD0DE44(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_5_1();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_21BD0DE7C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21BD0DEF0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_allowsQueueModifications);
  OUTLINED_FUNCTION_2();
  return *v1;
}

uint64_t sub_21BD0DF58(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_5_1();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_21BD0DF90())()
{
  return j__swift_endAccess;
}

uint64_t sub_21BD0E028()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_sessionID);
  OUTLINED_FUNCTION_2();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21BD0E0E8()
{
  OUTLINED_FUNCTION_48_9();
  OUTLINED_FUNCTION_5_1();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD0E130()
{
  return sub_21BD0E0E8();
}

uint64_t (*sub_21BD0E170())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21BD0E1F0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_21BD0E294(uint64_t a1)
{
  OUTLINED_FUNCTION_5_1();
  *uint64_t v1 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_21BD0E2D4()
{
  uint64_t v0 = swift_unknownObjectRetain();
  return sub_21BD0E294(v0);
}

uint64_t (*sub_21BD0E300())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21BD0E34C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21BEA9488();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_activePlaybackContext;
  swift_beginAccess();
  if (__swift_getEnumTagSinglePayload(v8, 1, v2))
  {
    uint64_t v9 = sub_21BEAA0C8();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v8, v2);
    uint64_t v9 = sub_21BEA93D8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  }
  return sub_21BD0DC78(v9);
}

uint64_t sub_21BD0E4A4(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = OUTLINED_FUNCTION_90();
  sub_21BD24ED4(v2, v3);
  swift_endAccess();
  sub_21BD0E34C();
  return sub_21BD23B5C(a1, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
}

void QueueControllerBehaviorPodcasts.__allocating_init(coder:)()
{
  id v1 = objc_allocWithZone(v0);
  QueueControllerBehaviorPodcasts.init(coder:)();
}

void QueueControllerBehaviorPodcasts.init(coder:)()
{
  OUTLINED_FUNCTION_34();
  uint64_t v2 = v1;
  sub_21BD20A0C(0, &qword_267C651D8, MEMORY[0x263F5E768], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_21_0(v3);
  OUTLINED_FUNCTION_30_7();
  MEMORY[0x270FA5388](v4, v5, v6);
  uint64_t v8 = (char *)&v91 - v7;
  uint64_t v9 = sub_21BEA9128();
  OUTLINED_FUNCTION_0_3();
  uint64_t v102 = v10;
  MEMORY[0x270FA5388](v11, v12, v13);
  OUTLINED_FUNCTION_46_5();
  uint64_t v104 = v14;
  MEMORY[0x270FA5388](v15, v16, v17);
  v101 = (char *)&v91 - v18;
  uint64_t v99 = sub_21BEA9B18();
  OUTLINED_FUNCTION_0_3();
  v103 = v19;
  MEMORY[0x270FA5388](v20, v21, v22);
  OUTLINED_FUNCTION_11();
  uint64_t v100 = v23;
  uint64_t v24 = sub_21BEA9378();
  uint64_t v25 = OUTLINED_FUNCTION_21_0(v24);
  MEMORY[0x270FA5388](v25, v26, v27);
  OUTLINED_FUNCTION_76();
  uint64_t v28 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_managedQueue;
  type metadata accessor for PodcastsManagedQueue();
  uint64_t v29 = swift_allocObject();
  uint64_t v30 = MEMORY[0x263F8EE78];
  *(void *)(v29 + 16) = MEMORY[0x263F8EE78];
  *(_OWORD *)(v29 + 24) = 0u;
  *(void *)&v0[v28] = v29;
  uint64_t v31 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_podcastsMediaLibrary;
  uint64_t v32 = v0;
  sub_21BEA9368();
  sub_21BEA9508();
  swift_allocObject();
  *(void *)&v0[v31] = sub_21BEA94A8();
  uint64_t v33 = (uint64_t)&v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest];
  uint64_t v34 = sub_21BEA94B8();
  __swift_storeEnumTagSinglePayload(v33, 1, 1, v34);
  uint64_t v35 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_contentItemIDsMap;
  *(void *)&v32[v35] = sub_21BEAA0C8();
  v36 = &v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations];
  v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations] = 0;
  v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_allowsQueueModifications] = 1;
  *(void *)&v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host] = 0;
  uint64_t v96 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_queueRestorationSnapshot;
  *(void *)&v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_queueRestorationSnapshot] = v30;
  uint64_t v37 = sub_21BEA9488();
  OUTLINED_FUNCTION_77_2(v37, v38, v39, v37);
  uint64_t v97 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTrackIdentifiers;
  *(void *)&v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTrackIdentifiers] = v30;
  id v40 = &v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTailInsertionContentIdentifier];
  *(_OWORD *)&v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTailInsertionContentIdentifier] = 0u;
  id v41 = (id)MSVNanoIDCreate();
  uint64_t v42 = sub_21BEAA178();
  uint64_t v44 = v43;

  char v45 = (uint64_t *)&v32[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_sessionID];
  *char v45 = v42;
  v45[1] = v44;
  id v46 = (void *)OUTLINED_FUNCTION_114();
  LOBYTE(v44) = objc_msgSend(v2, sel_decodeBoolForKey_, v46);

  OUTLINED_FUNCTION_27_14();
  char *v36 = v44;
  uint64_t v47 = sub_21BC0BE78(0, &qword_267C64A10);
  uint64_t v48 = sub_21BEAA998();
  long long v49 = 0uLL;
  if (v48)
  {
    v50 = (void *)v48;
    long long v107 = 0uLL;
    sub_21BEAA168();

    long long v49 = v107;
  }
  *(_OWORD *)id v40 = v49;
  swift_bridgeObjectRelease();
  sub_21BD20A0C(0, &qword_267C651F8, (uint64_t (*)(uint64_t))sub_21BD20A70, MEMORY[0x263F8E0F8]);
  uint64_t v52 = v51;
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_21BEEC1D0;
  *(void *)(v53 + 32) = sub_21BC0BE78(0, &qword_26AAF2F80);
  *(void *)(v53 + 40) = v47;
  *(void *)(v53 + 48) = sub_21BC0BE78(0, &qword_267C65210);
  uint64_t v98 = sub_21BC0BE78(0, &qword_267C65218);
  *(void *)(v53 + 56) = v98;
  sub_21BEAA9A8();
  swift_bridgeObjectRelease();
  uint64_t v54 = MEMORY[0x263F8EE58];
  if (!v108)
  {
    sub_21BD23B5C((uint64_t)&v107, (uint64_t)&qword_26AAF3A00, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD25644);
    goto LABEL_19;
  }
  sub_21BD20A0C(0, (unint64_t *)&unk_267C642E0, (uint64_t (*)(uint64_t))sub_21BC0BB14, MEMORY[0x263F8D488]);
  if ((OUTLINED_FUNCTION_69_3() & 1) == 0)
  {
LABEL_19:
    v68 = &OBJC_IVAR____MPCProtoContainer__items;
    goto LABEL_27;
  }
  uint64_t v93 = v52;
  uint64_t v94 = v47;
  uint64_t v55 = v105;
  sub_21BEA9AE8();
  v56 = sub_21BEA9B08();
  os_log_type_t v57 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_28_14(v57))
  {
    v58 = (_WORD *)OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_33_12(v58);
    _os_log_impl(&dword_21BB87000, v56, (os_log_type_t)v52, "􀋦 Restoring queue snapshot", (uint8_t *)0xD000000000000010, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_21_1();
  v59();
  uint64_t v60 = *(void *)(v55 + 16);
  if (v60)
  {
    v95 = v32;
    v92 = v2;
    v103 = (void (**)(char *, char *, uint64_t))(v102 + 32);
    swift_bridgeObjectRetain();
    uint64_t v61 = 0;
    uint64_t v62 = MEMORY[0x263F8EE78];
    uint64_t v100 = v60;
    do
    {
      OUTLINED_FUNCTION_80_1();
      sub_21BEA9108();
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
      {
        sub_21BD23B5C((uint64_t)v8, (uint64_t)&qword_267C651D8, MEMORY[0x263F5E768], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
      }
      else
      {
        v63 = (void (*)(void))*v103;
        v64 = v101;
        (*v103)(v101, v8, v9);
        ((void (*)(uint64_t, char *, uint64_t))v63)(v104, v64, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v62 = sub_21BD21730(0, *(void *)(v62 + 16) + 1, 1, v62);
        }
        unint64_t v66 = *(void *)(v62 + 16);
        unint64_t v65 = *(void *)(v62 + 24);
        if (v66 >= v65 >> 1)
        {
          char v67 = OUTLINED_FUNCTION_108(v65);
          uint64_t v62 = sub_21BD21730(v67, v66 + 1, 1, v62);
        }
        *(void *)(v62 + 16) = v66 + 1;
        OUTLINED_FUNCTION_35();
        v63();
        uint64_t v60 = v100;
      }
      ++v61;
    }
    while (v60 != v61);
    swift_bridgeObjectRelease();
    uint64_t v2 = v92;
    uint64_t v32 = v95;
  }
  else
  {
    uint64_t v62 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v69 = v96;
  *(void *)&v32[v96] = v62;
  swift_bridgeObjectRelease();
  v68 = &OBJC_IVAR____MPCProtoContainer__items;
  uint64_t v54 = MEMORY[0x263F8EE58];
  if (qword_267C62778 != -1) {
    swift_once();
  }
  os_log_type_t v70 = __swift_project_value_buffer(v99, (uint64_t)qword_267C72D90);
  v71 = v32;
  v72 = sub_21BEA9B08();
  os_log_type_t v73 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_11_25(v73))
  {
    *(_DWORD *)OUTLINED_FUNCTION_47() = 134217984;
    *(void *)&long long v107 = *(void *)(*(void *)&v32[v69] + 16);
    sub_21BEAAA78();

    OUTLINED_FUNCTION_101(&dword_21BB87000, v72, v70, "􀋴 Decoded %ld items for restoration.");
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
  }
  uint64_t v47 = v94;
  LOBYTE(v52) = v93;
LABEL_27:
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_21BEEB3A0;
  uint64_t v75 = v98;
  *(void *)(v74 + 32) = v47;
  *(void *)(v74 + 40) = v75;
  sub_21BEAA9A8();
  swift_bridgeObjectRelease();
  if (v108)
  {
    sub_21BD25644(0, (unint64_t *)&qword_26AAF2D70, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    if (OUTLINED_FUNCTION_69_3())
    {
      *(void *)&v32[v97] = v105;
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
      if (*((void *)v68 + 239) != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v99, (uint64_t)qword_267C72D90);
      swift_bridgeObjectRetain();
      v76 = sub_21BEA9B08();
      os_log_type_t v77 = sub_21BEAA6C8();
      if (OUTLINED_FUNCTION_28_14(v77))
      {
        v78 = (_DWORD *)OUTLINED_FUNCTION_47();
        *(void *)&long long v107 = OUTLINED_FUNCTION_25_10();
        _DWORD *v78 = 136315138;
        uint64_t v79 = swift_bridgeObjectRetain();
        v80 = v2;
        uint64_t v81 = MEMORY[0x21D49BB30](v79, MEMORY[0x263F8D310]);
        v95 = v32;
        unint64_t v83 = v82;
        swift_bridgeObjectRelease();
        uint64_t v84 = v81;
        uint64_t v2 = v80;
        uint64_t v105 = sub_21BCC7B5C(v84, v83, (uint64_t *)&v107);
        sub_21BEAAA78();
        OUTLINED_FUNCTION_8_6();
        uint64_t v32 = v95;
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_53_8(&dword_21BB87000, v76, (os_log_type_t)v52, "􀋦 Init with coder is done, with identifiers: %s");
        OUTLINED_FUNCTION_72_2();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_2_0();
      }
      else
      {

        OUTLINED_FUNCTION_8_6();
      }
      goto LABEL_40;
    }
  }
  else
  {

    sub_21BD23B5C((uint64_t)&v107, (uint64_t)&qword_26AAF3A00, v54 + 8, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD25644);
  }
  if (*((void *)v68 + 239) != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v99, (uint64_t)qword_267C72D90);
  v85 = (void *)sub_21BEA9B08();
  os_log_type_t v86 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_11_25(v86))
  {
    v87 = (_WORD *)OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_33_12(v87);
    OUTLINED_FUNCTION_8_25(&dword_21BB87000, v88, v89, "􀋦 Unable to decode track identifiers");
    OUTLINED_FUNCTION_2_0();
  }

LABEL_40:
  v90 = (objc_class *)type metadata accessor for QueueControllerBehaviorPodcasts();
  v106.receiver = v32;
  v106.super_class = v90;
  objc_msgSendSuper2(&v106, sel_init);

  OUTLINED_FUNCTION_33();
}

void QueueControllerBehaviorPodcasts.__allocating_init(sessionID:)()
{
  OUTLINED_FUNCTION_48_9();
  id v1 = objc_allocWithZone(v0);
  OUTLINED_FUNCTION_32();
  QueueControllerBehaviorPodcasts.init(sessionID:)();
}

void QueueControllerBehaviorPodcasts.init(sessionID:)()
{
  OUTLINED_FUNCTION_34();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_109();
  uint64_t v4 = sub_21BEA9378();
  uint64_t v5 = OUTLINED_FUNCTION_21_0(v4);
  MEMORY[0x270FA5388](v5, v6, v7);
  OUTLINED_FUNCTION_76();
  uint64_t v8 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_managedQueue;
  type metadata accessor for PodcastsManagedQueue();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8EE78];
  v9[3] = 0;
  v9[4] = 0;
  v9[2] = v10;
  *(void *)&v0[v8] = v9;
  uint64_t v11 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_podcastsMediaLibrary;
  uint64_t v12 = v0;
  sub_21BEA9368();
  sub_21BEA9508();
  swift_allocObject();
  *(void *)&v0[v11] = sub_21BEA94A8();
  uint64_t v13 = sub_21BEA94B8();
  OUTLINED_FUNCTION_77_2(v13, v14, v15, v13);
  uint64_t v16 = OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_contentItemIDsMap;
  *(void *)&v12[v16] = sub_21BEAA0C8();
  v12[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations] = 0;
  v12[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_allowsQueueModifications] = 1;
  *(void *)&v12[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host] = 0;
  *(void *)&v12[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_queueRestorationSnapshot] = v10;
  uint64_t v17 = sub_21BEA9488();
  OUTLINED_FUNCTION_77_2(v17, v18, v19, v17);
  *(void *)&v12[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTrackIdentifiers] = v10;
  uint64_t v20 = &v12[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTailInsertionContentIdentifier];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  if (!v3)
  {
    id v21 = (id)MSVNanoIDCreate();
    uint64_t v1 = sub_21BEAA178();
    uint64_t v3 = v22;
  }
  uint64_t v23 = (uint64_t *)&v12[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_sessionID];
  *uint64_t v23 = v1;
  v23[1] = v3;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_21BEA9B18();
  __swift_project_value_buffer(v24, (uint64_t)qword_267C72D90);
  uint64_t v25 = v12;
  uint64_t v26 = sub_21BEA9B08();
  os_log_type_t v27 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_67_5(v27))
  {
    uint64_t v28 = (_DWORD *)OUTLINED_FUNCTION_47();
    uint64_t v32 = OUTLINED_FUNCTION_25_10();
    _DWORD *v28 = 136446210;
    OUTLINED_FUNCTION_2();
    uint64_t v30 = *v23;
    unint64_t v29 = v23[1];
    swift_bridgeObjectRetain();
    sub_21BCC7B5C(v30, v29, &v32);
    sub_21BEAAA78();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_53_8(&dword_21BB87000, v26, (os_log_type_t)v12, "􀋦 Did init with sessionID: '%{public}s'");
    OUTLINED_FUNCTION_72_2();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
  }
  uint64_t v31 = (objc_class *)type metadata accessor for QueueControllerBehaviorPodcasts();
  v33.receiver = v25;
  v33.super_class = v31;
  objc_msgSendSuper2(&v33, sel_init);
  OUTLINED_FUNCTION_33();
}

uint64_t sub_21BD0F4C0(void *a1)
{
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_21BEA9B18();
  __swift_project_value_buffer(v3, (uint64_t)qword_267C72D90);
  swift_unknownObjectRetain_n();
  id v4 = v1;
  uint64_t v5 = (void *)sub_21BEA9B08();
  os_log_type_t v6 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_28_14(v6))
  {
    uint64_t v7 = OUTLINED_FUNCTION_50();
    uint64_t v20 = OUTLINED_FUNCTION_15_0();
    *(_DWORD *)uint64_t v7 = 136315394;
    id v8 = objc_msgSend(a1, sel_description);
    uint64_t v9 = sub_21BEAA178();
    unint64_t v11 = v10;

    sub_21BCC7B5C(v9, v11, &v20);
    sub_21BEAAA78();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    id v12 = objc_msgSend(v4, sel_description);
    uint64_t v13 = sub_21BEAA178();
    unint64_t v15 = v14;

    sub_21BCC7B5C(v13, v15, &v20);
    sub_21BEAAA78();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_104(&dword_21BB87000, v16, v17, "􀋦 Did connect to host: %s - %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v18 = swift_unknownObjectRetain();
  return sub_21BD0E294(v18);
}

void sub_21BD0F708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_18_0();
  a21 = v23;
  a22 = v24;
  uint64_t v26 = v25;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_21BEA9B18();
  __swift_project_value_buffer(v27, (uint64_t)qword_267C72D90);
  swift_unknownObjectRetain_n();
  id v28 = v22;
  unint64_t v29 = (void *)sub_21BEA9B08();
  os_log_type_t v30 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_28_14(v30))
  {
    uint64_t v31 = OUTLINED_FUNCTION_50();
    a10 = OUTLINED_FUNCTION_15_0();
    *(_DWORD *)uint64_t v31 = 136315394;
    id v32 = objc_msgSend(v26, sel_description);
    uint64_t v33 = sub_21BEAA178();
    unint64_t v35 = v34;

    sub_21BCC7B5C(v33, v35, &a10);
    sub_21BEAAA78();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    id v36 = objc_msgSend(v28, sel_description);
    uint64_t v37 = sub_21BEAA178();
    unint64_t v39 = v38;

    sub_21BCC7B5C(v37, v39, &a10);
    sub_21BEAAA78();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_104(&dword_21BB87000, v40, v41, "􀋪 Did disconnect from host: %s - %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_21BD0E294(0);
  OUTLINED_FUNCTION_16_11();
}

void sub_21BD0F934(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

void sub_21BD0FA14()
{
  OUTLINED_FUNCTION_34();
  sub_21BD20A0C(0, &qword_267C65220, MEMORY[0x263F5E908], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_21_0(v0);
  OUTLINED_FUNCTION_30_7();
  MEMORY[0x270FA5388](v1, v2, v3);
  uint64_t v5 = (char *)&v32 - v4;
  unint64_t v6 = sub_21BD32920();
  unint64_t v7 = v6;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_21BEAAD88();
    if (!v8) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v8) {
      goto LABEL_19;
    }
  }
  if (v8 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v9 = 0;
  uint64_t v10 = MEMORY[0x263F8EE78];
  do
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v11 = (id)MEMORY[0x21D49C490](v9, v7);
    }
    else {
      id v11 = *(id *)(v7 + 8 * v9 + 32);
    }
    id v12 = v11;
    sub_21BCACBDC();
    uint64_t v13 = sub_21BEA97D8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v13) == 1)
    {
      sub_21BD23B5C((uint64_t)v5, (uint64_t)&qword_267C65220, MEMORY[0x263F5E908], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    }
    else
    {
      uint64_t v14 = sub_21BEA97A8();
      uint64_t v16 = v15;
      OUTLINED_FUNCTION_21_1();
      v17();

      if (v16)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21BD21160();
          uint64_t v10 = v21;
        }
        unint64_t v19 = *(void *)(v10 + 16);
        unint64_t v18 = *(void *)(v10 + 24);
        if (v19 >= v18 >> 1)
        {
          OUTLINED_FUNCTION_108(v18);
          sub_21BD21160();
          uint64_t v10 = v22;
        }
        *(void *)(v10 + 16) = v19 + 1;
        uint64_t v20 = v10 + 16 * v19;
        *(void *)(v20 + 32) = v14;
        *(void *)(v20 + 40) = v16;
      }
    }
    ++v9;
  }
  while (v8 != v9);
LABEL_19:
  swift_bridgeObjectRelease_n();
  if (qword_267C62780 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_21BEA9B18();
  __swift_project_value_buffer(v23, (uint64_t)qword_267C72DA8);
  swift_bridgeObjectRetain_n();
  uint64_t v24 = sub_21BEA9B08();
  os_log_type_t v25 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_67_5(v25))
  {
    uint64_t v26 = (_DWORD *)OUTLINED_FUNCTION_47();
    uint64_t v33 = OUTLINED_FUNCTION_25_10();
    *uint64_t v26 = 136446210;
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v28 = MEMORY[0x21D49BB30](v27, MEMORY[0x263F8D310]);
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v31 = sub_21BCC7B5C(v28, v30, &v33);
    OUTLINED_FUNCTION_50_8(v31);
    sub_21BEAAA78();
    OUTLINED_FUNCTION_8_6();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_53_8(&dword_21BB87000, v24, (os_log_type_t)v7, "Encoded queue identifiers for handoff: %{public}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    OUTLINED_FUNCTION_8_6();
  }
  OUTLINED_FUNCTION_33();
}

id sub_21BD0FE40()
{
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_playbackQueue);
  }
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_playbackQueue);
  }
  return result;
}

uint64_t sub_21BD0FEAC()
{
  sub_21BEA93B8();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v0, v1, v2);
  OUTLINED_FUNCTION_49();
  uint64_t v5 = v4 - v3;
  id v6 = sub_21BD0FE40();
  sub_21BD0FF68(v5);
  sub_21BD10000();

  uint64_t v7 = OUTLINED_FUNCTION_67_2();
  return v8(v7);
}

uint64_t sub_21BD0FF68@<X0>(uint64_t a1@<X8>)
{
  self;
  if (OUTLINED_FUNCTION_59_1())
  {
    uint64_t v2 = (unsigned int *)MEMORY[0x263F5E7E8];
  }
  else
  {
    self;
    uint64_t v2 = (unsigned int *)MEMORY[0x263F5E7F0];
  }
  uint64_t v3 = *v2;
  sub_21BEA93B8();
  OUTLINED_FUNCTION_24();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 104);

  return v6(a1, v3, v4);
}

void sub_21BD10000()
{
  OUTLINED_FUNCTION_34();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_21BEA93B8();
  OUTLINED_FUNCTION_0_3();
  v119 = (void (**)(unint64_t, void, id))v7;
  id v120 = v6;
  MEMORY[0x270FA5388](v6, v8, v9);
  OUTLINED_FUNCTION_11();
  unint64_t v118 = v10;
  id v11 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_21BD20A0C(0, &qword_267C65418, MEMORY[0x263F5E7D8], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_30_7();
  MEMORY[0x270FA5388](v12, v13, v14);
  sub_21BD20A0C(0, &qword_267C65420, MEMORY[0x263F5E878], v11);
  OUTLINED_FUNCTION_21_0(v15);
  OUTLINED_FUNCTION_30_7();
  MEMORY[0x270FA5388](v16, v17, v18);
  uint64_t v20 = (char *)v113 - v19;
  uint64_t v21 = sub_21BEA9648();
  OUTLINED_FUNCTION_0_3();
  uint64_t v23 = v22;
  uint64_t v27 = MEMORY[0x270FA5388](v24, v25, v26);
  uint64_t v30 = MEMORY[0x270FA5388](v27, v28, v29);
  uint64_t v32 = (char *)v113 - v31;
  MEMORY[0x270FA5388](v30, v33, v34);
  uint64_t v37 = (char *)v113 - v36;
  if (!v3) {
    goto LABEL_49;
  }
  v117 = v35;
  uint64_t v121 = v5;
  self;
  uint64_t v38 = OUTLINED_FUNCTION_59_1();
  if (v38)
  {
    unint64_t v39 = (void *)v38;
    id v120 = v3;
    id v40 = objc_msgSend(v39, sel_data);
    uint64_t v41 = sub_21BEA8C88();
    unint64_t v43 = v42;

    sub_21BC0BE78(0, &qword_267C65428);
    v119 = (void (**)(unint64_t, void, id))v41;
    sub_21BD10A78((uint64_t)v20);
    if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) == 1)
    {
      unint64_t v44 = v43;
      sub_21BD23B5C((uint64_t)v20, (uint64_t)&qword_267C65420, MEMORY[0x263F5E878], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
      uint64_t v45 = v121;
      if (qword_267C62778 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_21BEA9B18();
      __swift_project_value_buffer(v46, (uint64_t)qword_267C72D90);
      uint64_t v47 = (void *)sub_21BEA9B08();
      os_log_type_t v48 = sub_21BEAA6C8();
      if (OUTLINED_FUNCTION_11_25(v48))
      {
        long long v49 = (_WORD *)OUTLINED_FUNCTION_3_2();
        OUTLINED_FUNCTION_33_12(v49);
        OUTLINED_FUNCTION_8_25(&dword_21BB87000, v50, v51, "Error getting podcast intent from MPCPlaybackIntent");
        OUTLINED_FUNCTION_2_0();
      }
      sub_21BC65404((uint64_t)v119, v44);

      uint64_t v52 = sub_21BEA9488();
      uint64_t v53 = v45;
      uint64_t v54 = 1;
      goto LABEL_42;
    }
    OUTLINED_FUNCTION_35();
    v67();
    if (qword_267C62778 != -1) {
      swift_once();
    }
    unint64_t v118 = v43;
    uint64_t v68 = sub_21BEA9B18();
    __swift_project_value_buffer(v68, (uint64_t)qword_267C72D90);
    v116 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
    v116(v32, v37, v21);
    uint64_t v69 = sub_21BEA9B08();
    os_log_type_t v70 = sub_21BEAA6C8();
    int v71 = v70;
    v72 = v69;
    if (os_log_type_enabled(v69, v70))
    {
      uint64_t v73 = OUTLINED_FUNCTION_47();
      int v114 = v71;
      uint64_t v74 = (_DWORD *)v73;
      uint64_t v115 = OUTLINED_FUNCTION_25_10();
      uint64_t v122 = v115;
      v113[1] = v74;
      *uint64_t v74 = 136315138;
      v113[0] = v74 + 1;
      sub_21BEA9638();
      uint64_t v75 = sub_21BEAA1E8();
      uint64_t v69 = v76;
      uint64_t v77 = sub_21BCC7B5C(v75, v76, &v122);
      OUTLINED_FUNCTION_50_8(v77);
      sub_21BEAAA78();
      swift_bridgeObjectRelease();
      uint64_t v78 = OUTLINED_FUNCTION_45_9();
      ((void (*)(uint64_t))v69)(v78);
      OUTLINED_FUNCTION_101(&dword_21BB87000, v72, (os_log_type_t)v114, "Received initial item from intent: %s");
      OUTLINED_FUNCTION_95_0();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {
      uint64_t v79 = OUTLINED_FUNCTION_45_9();
      ((void (*)(uint64_t))v69)(v79);
    }
    v116(v117, v37, v21);
    uint64_t v80 = v121;
    sub_21BEA9468();
    sub_21BC65404((uint64_t)v119, v118);

    ((void (*)(char *, uint64_t))v69)(v37, v21);
    uint64_t v52 = sub_21BEA9488();
    uint64_t v53 = v80;
LABEL_41:
    uint64_t v54 = 0;
LABEL_42:
    __swift_storeEnumTagSinglePayload(v53, v54, 1, v52);
    OUTLINED_FUNCTION_33();
    return;
  }
  self;
  uint64_t v55 = OUTLINED_FUNCTION_59_1();
  if (v55)
  {
    v56 = (void *)v55;
    id v57 = v3;
    if (sub_21BD239EC(v56))
    {
      v117 = v1;
      if (qword_267C62780 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_21BEA9B18();
      __swift_project_value_buffer(v58, (uint64_t)qword_267C72DA8);
      swift_bridgeObjectRetain();
      v59 = sub_21BEA9B08();
      os_log_type_t v60 = sub_21BEAA6C8();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = (uint8_t *)OUTLINED_FUNCTION_47();
        uint64_t v122 = OUTLINED_FUNCTION_25_10();
        *(_DWORD *)uint64_t v61 = 136446210;
        uint64_t v62 = swift_bridgeObjectRetain();
        uint64_t v63 = MEMORY[0x21D49BB30](v62, MEMORY[0x263F8D310]);
        unint64_t v65 = v64;
        swift_bridgeObjectRelease();
        uint64_t v66 = sub_21BCC7B5C(v63, v65, &v122);
        OUTLINED_FUNCTION_50_8(v66);
        sub_21BEAAA78();
        OUTLINED_FUNCTION_59_5();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21BB87000, v59, v60, "Received queue identifier: %{public}s", v61, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_2_0();
      }
      else
      {

        OUTLINED_FUNCTION_59_5();
      }
      uint64_t v96 = v121;
      ((void (**)(unint64_t, char *, id))v119)[2](v118, v117, v120);
      uint64_t v97 = (void *)OUTLINED_FUNCTION_90();
      sub_21BD10E34(v97, v98, v99);
      uint64_t v52 = sub_21BEA9488();
      uint64_t v53 = v96;
      goto LABEL_41;
    }
  }
  self;
  uint64_t v81 = OUTLINED_FUNCTION_59_1();
  if (!v81) {
    goto LABEL_49;
  }
  unint64_t v82 = (void *)v81;
  unint64_t v83 = v3;
  id v120 = objc_msgSend(v82, sel_mediaQuery);
  if (!v120)
  {
LABEL_44:
    if (qword_267C62778 != -1) {
      swift_once();
    }
    uint64_t v100 = sub_21BEA9B18();
    os_log_type_t v101 = __swift_project_value_buffer(v100, (uint64_t)qword_267C72D90);
    uint64_t v102 = sub_21BEA9B08();
    os_log_type_t v103 = sub_21BEAA6B8();
    if (OUTLINED_FUNCTION_11_25(v103))
    {
      uint64_t v104 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)uint64_t v104 = 0;
      _os_log_impl(&dword_21BB87000, v102, v101, "Receied media query queue with no items in it.", v104, 2u);
      OUTLINED_FUNCTION_2_0();
    }

LABEL_49:
    sub_21BEA9488();
    goto LABEL_50;
  }
  unint64_t v84 = sub_21BD249CC(v120);
  if (!v84)
  {

    goto LABEL_44;
  }
  unint64_t v85 = v84;
  if (v84 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_21BEAAD88();
  }
  else
  {
    uint64_t v86 = *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v119 = v83;
  if (v86)
  {
    if (v86 < 1)
    {
      __break(1u);
      return;
    }
    uint64_t v87 = 0;
    uint64_t v88 = MEMORY[0x263F8EE78];
    do
    {
      if ((v85 & 0xC000000000000001) != 0) {
        id v89 = (id)MEMORY[0x21D49C490](v87, v85);
      }
      else {
        id v89 = *(id *)(v85 + 8 * v87 + 32);
      }
      v90 = v89;
      id v91 = objc_msgSend(v89, sel_persistentID);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21BD219B0();
        uint64_t v88 = v94;
      }
      unint64_t v93 = *(void *)(v88 + 16);
      unint64_t v92 = *(void *)(v88 + 24);
      if (v93 >= v92 >> 1)
      {
        OUTLINED_FUNCTION_108(v92);
        sub_21BD219B0();
        uint64_t v88 = v95;
      }
      ++v87;
      *(void *)(v88 + 16) = v93 + 1;
      *(void *)(v88 + 8 * v93 + 32) = v91;
    }
    while (v86 != v87);
  }
  swift_bridgeObjectRelease_n();
  id v110 = objc_msgSend(v82, sel_firstItem);
  v111 = v110;
  if (v110)
  {
    objc_msgSend(v110, sel_persistentID);
  }
  v112 = v119;
  sub_21BEA9428();

  sub_21BEA9488();
LABEL_50:
  OUTLINED_FUNCTION_33();
  __swift_storeEnumTagSinglePayload(v105, v106, v107, v108);
}

uint64_t sub_21BD10A78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21BEA9648();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4, v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BEA8A78();
  swift_allocObject();
  sub_21BEA8A68();
  sub_21BD25464(&qword_267C65430, MEMORY[0x263F5E878]);
  sub_21BEA8A58();
  swift_release();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v7, v2);
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v2);
}

uint64_t sub_21BD10E34@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_21BEA93B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9);
  uint64_t v38 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD239EC(a1);
  id v11 = objc_msgSend(self, sel_standardUserDefaults);
  id v12 = objc_msgSend(v11, sel_isPrivateListeningEnabled);

  unsigned int v37 = objc_msgSend(v12, sel_BOOLValue);
  id v13 = a1;
  uint64_t v14 = sub_21BD23A44(v13);
  uint64_t v15 = MEMORY[0x263F8EE58];
  uint64_t v39 = a3;
  if (!v14)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    goto LABEL_7;
  }
  uint64_t v16 = v14;
  strcpy((char *)&v41, "enqueuerDSID");
  BYTE13(v41) = 0;
  HIWORD(v41) = -5120;
  sub_21BEAABD8();
  sub_21BCDFB4C(v16, &v41);
  sub_21BC04D84((uint64_t)v40);
  swift_bridgeObjectRelease();
  if (!*((void *)&v42 + 1))
  {
LABEL_7:
    sub_21BD23B5C((uint64_t)&v41, (uint64_t)&qword_26AAF3A00, v15 + 8, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD25644);
    uint64_t v36 = 0;
    goto LABEL_8;
  }
  sub_21BC0BE78(0, &qword_26AAF2F80);
  int v17 = swift_dynamicCast();
  uint64_t v18 = v40[0];
  if (!v17) {
    uint64_t v18 = 0;
  }
  uint64_t v36 = v18;
LABEL_8:
  id v19 = v13;
  uint64_t v20 = sub_21BD23A44(v19);
  if (!v20)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    goto LABEL_18;
  }
  uint64_t v21 = v20;
  strcpy((char *)&v41, "sharedUserId");
  BYTE13(v41) = 0;
  HIWORD(v41) = -5120;
  sub_21BEAABD8();
  sub_21BCDFB4C(v21, &v41);
  sub_21BC04D84((uint64_t)v40);
  swift_bridgeObjectRelease();
  if (!*((void *)&v42 + 1))
  {
LABEL_18:
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    uint64_t v24 = a2;
    sub_21BD23B5C((uint64_t)&v41, (uint64_t)&qword_26AAF3A00, v15 + 8, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD25644);
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    goto LABEL_19;
  }
  uint64_t v22 = v7;
  uint64_t v23 = v6;
  uint64_t v24 = a2;
  int v25 = swift_dynamicCast();
  if (v25) {
    uint64_t v26 = v40[0];
  }
  else {
    uint64_t v26 = 0;
  }
  if (v25) {
    uint64_t v27 = v40[1];
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v34 = v27;
  uint64_t v35 = v26;
LABEL_19:
  id v28 = v19;
  uint64_t v29 = sub_21BD23A44(v28);
  if (!v29)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    goto LABEL_23;
  }
  uint64_t v30 = v29;
  *(void *)&long long v41 = 0x6574736575716572;
  *((void *)&v41 + 1) = 0xEF64497265735572;
  sub_21BEAABD8();
  sub_21BCDFB4C(v30, &v41);
  sub_21BC04D84((uint64_t)v40);
  swift_bridgeObjectRelease();
  if (!*((void *)&v42 + 1))
  {
LABEL_23:
    sub_21BD23B5C((uint64_t)&v41, (uint64_t)&qword_26AAF3A00, v15 + 8, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD25644);
    goto LABEL_24;
  }
  swift_dynamicCast();
LABEL_24:
  id v31 = v28;
  sub_21BC1F38C(v31, (SEL *)&selRef_siriAssetInfo);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v38, v24, v23);
  sub_21BEA9408();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
}

void sub_21BD11310(void *a1, uint64_t a2, void *a3, void *a4, void (**a5)(void, void, void, void, void))
{
  uint64_t v9 = sub_21BEA93B8();
  uint64_t v53 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10, v11);
  uint64_t v50 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v13 - 8, v14, v15);
  uint64_t v51 = (char *)&v44 - v16;
  uint64_t v52 = sub_21BEA9488();
  uint64_t v49 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52, v17, v18);
  os_log_type_t v48 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a5;
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = a3;
  v21[3] = sub_21BD24F84;
  v21[4] = v20;
  v21[5] = a4;
  _Block_copy(a5);
  uint64_t v22 = qword_267C62778;
  id v54 = a3;
  uint64_t v55 = v20;
  swift_retain();
  id v56 = a4;
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_21BEA9B18();
  __swift_project_value_buffer(v23, (uint64_t)qword_267C72D90);
  id v24 = a1;
  int v25 = sub_21BEA9B08();
  os_log_type_t v26 = sub_21BEAA6C8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = (void *)swift_slowAlloc();
    uint64_t v46 = v27;
    *(_DWORD *)uint64_t v27 = 138412290;
    unint64_t v57 = (unint64_t)v24;
    id v28 = v24;
    uint64_t v47 = v21;
    id v29 = v28;
    sub_21BEAAA78();
    uint64_t v30 = v45;
    *uint64_t v45 = v24;

    id v31 = v46;
    _os_log_impl(&dword_21BB87000, v25, v26, "Calling perform load for event: %@", v46, 0xCu);
    sub_21BD247DC(0, &qword_26AAF38F0);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v30, -1, -1);
    MEMORY[0x21D49EAD0](v31, -1, -1);
  }
  else
  {
  }
  uint64_t v32 = v53;
  uint64_t v33 = v50;
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v50, *MEMORY[0x263F5E7F0], v9);
  uint64_t v34 = (uint64_t)v51;
  sub_21BD10000();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v9);
  uint64_t v35 = v52;
  if (__swift_getEnumTagSinglePayload(v34, 1, v52) == 1)
  {
    sub_21BD23B5C(v34, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v59 = 2;
    unint64_t v57 = 0;
    unint64_t v58 = 0xE000000000000000;
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    unint64_t v57 = 0xD000000000000023;
    unint64_t v58 = 0x800000021BECC5C0;
    id v36 = v24;
    id v37 = objc_msgSend(v36, sel_description);
    sub_21BEAA178();

    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v38 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v39 = v38;
    _Block_copy(a5);
    id v40 = v39;
    long long v41 = (void *)sub_21BEA8B08();
    ((void (**)(void, void, void, void, void *))a5)[2](a5, 0, 0, 0, v41);

    objc_msgSend(v56, sel_rollback);
    _Block_release(a5);
    swift_release();

    swift_release();
  }
  else
  {
    unint64_t v43 = v48;
    uint64_t v42 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v48, v34, v35);
    sub_21BD139B8();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v35);
    swift_release();

    swift_release();
  }
  _Block_release(a5);
}

uint64_t sub_21BD11A34(void *a1, uint64_t a2, void *a3, void (*a4)(void, void, void, void, void, void), uint64_t a5, void *a6)
{
  uint64_t v12 = sub_21BEA93B8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14, v15);
  uint64_t v55 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v17 - 8, v18, v19);
  id v56 = (char *)&v48 - v20;
  uint64_t v57 = sub_21BEA9488();
  uint64_t v54 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57, v21, v22);
  uint64_t v53 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v24 = (void *)swift_allocObject();
  v24[2] = a3;
  v24[3] = a4;
  v24[4] = a5;
  v24[5] = a6;
  uint64_t v59 = v24;
  uint64_t v25 = qword_267C62778;
  id v58 = a3;
  swift_retain();
  id v26 = a6;
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_21BEA9B18();
  __swift_project_value_buffer(v27, (uint64_t)qword_267C72D90);
  id v60 = a1;
  id v28 = sub_21BEA9B08();
  os_log_type_t v29 = sub_21BEAA6C8();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v52 = a2;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v50 = v13;
    id v31 = (uint8_t *)v30;
    os_log_type_t v48 = (void *)swift_slowAlloc();
    id v51 = v26;
    uint64_t v49 = v31;
    *(_DWORD *)id v31 = 138412290;
    id v32 = v60;
    unint64_t v61 = (unint64_t)v60;
    uint64_t v33 = a4;
    id v34 = v60;
    id v26 = v51;
    sub_21BEAAA78();
    uint64_t v35 = v48;
    *os_log_type_t v48 = v32;

    a4 = v33;
    id v36 = v49;
    _os_log_impl(&dword_21BB87000, v28, v29, "Calling perform load for event: %@", v49, 0xCu);
    sub_21BD247DC(0, &qword_26AAF38F0);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v35, -1, -1);
    uint64_t v13 = v50;
    MEMORY[0x21D49EAD0](v36, -1, -1);
  }
  else
  {

    id v37 = v60;
  }
  uint64_t v38 = (uint64_t)v56;
  uint64_t v39 = v57;
  id v40 = v55;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v55, *MEMORY[0x263F5E7F0], v12);
  sub_21BD10000();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v40, v12);
  if (__swift_getEnumTagSinglePayload(v38, 1, v39) == 1)
  {
    sub_21BD23B5C(v38, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v63 = 2;
    unint64_t v61 = 0;
    unint64_t v62 = 0xE000000000000000;
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    unint64_t v61 = 0xD000000000000023;
    unint64_t v62 = 0x800000021BECC5C0;
    id v41 = v60;
    id v42 = objc_msgSend(v41, sel_description);
    sub_21BEAA178();

    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    unint64_t v43 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v44 = v43;
    a4(0, 0, 0, 0, 0, v43);
    objc_msgSend(v26, sel_rollback);

    swift_release();
  }
  else
  {
    uint64_t v46 = v53;
    uint64_t v45 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v53, v38, v39);
    sub_21BD139B8();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v39);

    swift_release();
  }

  return swift_release();
}

void sub_21BD1210C(void *a1, uint64_t a2, void *a3, void *a4, void (**a5)(void, void))
{
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8, v11, v12);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t v15 = sub_21BEA9488();
  uint64_t v44 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v16, v17);
  unint64_t v43 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a5;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = sub_21BD25694;
  v20[4] = v19;
  v20[5] = a4;
  uint64_t v47 = v20;
  _Block_copy(a5);
  uint64_t v21 = qword_267C62778;
  id v45 = a3;
  uint64_t v46 = v19;
  swift_retain();
  id v22 = a4;
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_21BEA9B18();
  __swift_project_value_buffer(v23, (uint64_t)qword_267C72D90);
  id v24 = a1;
  uint64_t v25 = sub_21BEA9B08();
  os_log_type_t v26 = sub_21BEAA6C8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    id v48 = v24;
    id v28 = (uint8_t *)v27;
    id v40 = (void *)swift_slowAlloc();
    id v41 = v22;
    uint64_t v42 = a2;
    *(_DWORD *)id v28 = 138412290;
    unint64_t v49 = (unint64_t)v48;
    id v29 = v48;
    id v22 = v41;
    sub_21BEAAA78();
    uint64_t v30 = v40;
    *id v40 = v48;

    _os_log_impl(&dword_21BB87000, v25, v26, "Calling perform load for event: %@", v28, 0xCu);
    sub_21BD247DC(0, &qword_26AAF38F0);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v30, -1, -1);
    id v31 = v28;
    id v24 = v48;
    MEMORY[0x21D49EAD0](v31, -1, -1);
  }
  else
  {
  }
  sub_21BD0FEAC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_21BD23B5C((uint64_t)v14, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v51 = 2;
    unint64_t v49 = 0;
    unint64_t v50 = 0xE000000000000000;
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    unint64_t v49 = 0xD000000000000023;
    unint64_t v50 = 0x800000021BECC510;
    id v32 = v24;
    id v33 = objc_msgSend(v32, sel_description);
    sub_21BEAA178();

    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    id v34 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v35 = v34;
    _Block_copy(a5);
    id v36 = v35;
    id v37 = (void *)sub_21BEA8B08();
    ((void (**)(void, void *))a5)[2](a5, v37);

    objc_msgSend(v22, sel_rollback);
    _Block_release(a5);
    swift_release();

    swift_release();
  }
  else
  {
    uint64_t v39 = v43;
    uint64_t v38 = v44;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v14, v15);
    sub_21BD139B8();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v15);
    swift_release();

    swift_release();
  }
  _Block_release(a5);
}

uint64_t sub_21BD12764(void *a1, uint64_t a2, void *a3, void (*a4)(void *), uint64_t a5, void *a6)
{
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v12 - 8, v13, v14);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = sub_21BEA9488();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17, v19, v20);
  uint64_t v47 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = (void *)swift_allocObject();
  v22[2] = a3;
  v22[3] = a4;
  id v48 = a4;
  v22[4] = a5;
  v22[5] = a6;
  unint64_t v50 = v22;
  uint64_t v23 = qword_267C62778;
  id v49 = a3;
  swift_retain();
  id v24 = a6;
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_21BEA9B18();
  __swift_project_value_buffer(v25, (uint64_t)qword_267C72D90);
  id v26 = a1;
  uint64_t v27 = sub_21BEA9B08();
  os_log_type_t v28 = sub_21BEAA6C8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v45 = a2;
    id v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    id v46 = v24;
    uint64_t v42 = (void *)v30;
    os_log_t v43 = v27;
    uint64_t v44 = v29;
    *(_DWORD *)id v29 = 138412290;
    unint64_t v51 = (unint64_t)v26;
    id v31 = v26;
    sub_21BEAAA78();
    id v32 = v42;
    *uint64_t v42 = v26;

    os_log_t v33 = v43;
    os_log_type_t v34 = v28;
    id v35 = v44;
    _os_log_impl(&dword_21BB87000, v43, v34, "Calling perform load for event: %@", v44, 0xCu);
    sub_21BD247DC(0, &qword_26AAF38F0);
    swift_arrayDestroy();
    id v24 = v46;
    MEMORY[0x21D49EAD0](v32, -1, -1);
    MEMORY[0x21D49EAD0](v35, -1, -1);
  }
  else
  {
  }
  sub_21BD0FEAC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_21BD23B5C((uint64_t)v16, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v53 = 2;
    unint64_t v51 = 0;
    unint64_t v52 = 0xE000000000000000;
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    unint64_t v51 = 0xD000000000000023;
    unint64_t v52 = 0x800000021BECC510;
    id v36 = v26;
    id v37 = objc_msgSend(v36, sel_description);
    sub_21BEAA178();

    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v38 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v39 = v38;
    v48(v38);
    objc_msgSend(v24, sel_rollback);

    swift_release();
  }
  else
  {
    id v40 = v47;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v47, v16, v17);
    sub_21BD139B8();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v40, v17);

    swift_release();
  }

  return swift_release();
}

uint64_t sub_21BD12D5C(void *a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, uint64_t a6, uint64_t a7, void (**a8)(void, void))
{
  uint64_t v52 = a2;
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v15 - 8, v16, v17);
  unint64_t v50 = (char *)&v44 - v18;
  uint64_t v51 = sub_21BEA9488();
  uint64_t v46 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51, v19, v20);
  uint64_t v45 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a8;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = a3;
  v23[3] = a4;
  v23[4] = sub_21BD25694;
  v23[5] = v22;
  unint64_t v48 = a5;
  uint64_t v49 = a6;
  v23[6] = a5;
  v23[7] = a6;
  v23[8] = a7;
  id v56 = a8;
  _Block_copy(a8);
  uint64_t v24 = qword_267C62778;
  uint64_t v55 = a3;
  swift_retain();
  uint64_t v47 = a4;
  id v53 = a4;
  uint64_t v54 = v22;
  swift_retain();
  swift_bridgeObjectRetain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_21BEA9B18();
  __swift_project_value_buffer(v25, (uint64_t)qword_267C72D90);
  id v26 = a1;
  uint64_t v27 = sub_21BEA9B08();
  os_log_type_t v28 = sub_21BEAA6C8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v44 = a7;
    uint64_t v30 = (uint8_t *)v29;
    id v31 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 138412290;
    unint64_t v57 = (unint64_t)v26;
    id v32 = v26;
    sub_21BEAAA78();
    *id v31 = v26;

    _os_log_impl(&dword_21BB87000, v27, v28, "Calling perform load for event: %@", v30, 0xCu);
    sub_21BD247DC(0, &qword_26AAF38F0);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v31, -1, -1);
    os_log_t v33 = v30;
    a7 = v44;
    MEMORY[0x21D49EAD0](v33, -1, -1);
  }
  else
  {
  }
  uint64_t v34 = v51;
  uint64_t v35 = (uint64_t)v50;
  sub_21BD0FEAC();
  if (__swift_getEnumTagSinglePayload(v35, 1, v34) == 1)
  {
    sub_21BD23B5C(v35, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v59 = 2;
    unint64_t v57 = 0;
    unint64_t v58 = 0xE000000000000000;
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    unint64_t v57 = 0xD000000000000023;
    unint64_t v58 = 0x800000021BECC510;
    id v36 = v26;
    id v37 = objc_msgSend(v36, sel_description);
    sub_21BEAA178();

    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v38 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v39 = v56;
    _Block_copy(v56);
    id v40 = v38;
    sub_21BD1988C((unint64_t)v38, 1, v55, v47, v48, v49, a7, v39);

    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v42 = v45;
    uint64_t v41 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v45, v35, v34);
    sub_21BD139B8();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v34);

    swift_release();
    swift_release();
    id v39 = v56;
  }
  swift_release();
  _Block_release(v39);
  return swift_bridgeObjectRelease();
}

void sub_21BD133A4(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void *), uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = a9;
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v17 - 8, v18, v19);
  unint64_t v50 = (char *)&v41 - v20;
  uint64_t v21 = sub_21BEA9488();
  uint64_t v45 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21, v22, v23);
  uint64_t v44 = (char *)&v41 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = a3;
  v25[3] = a4;
  uint64_t v47 = a5;
  unint64_t v48 = a7;
  v25[4] = a5;
  v25[5] = a6;
  v25[6] = a7;
  v25[7] = a8;
  uint64_t v49 = a8;
  uint64_t v51 = v25;
  v25[8] = a9;
  uint64_t v26 = qword_267C62778;
  swift_retain();
  uint64_t v46 = a4;
  id v52 = a4;
  uint64_t v53 = a6;
  swift_retain();
  swift_bridgeObjectRetain();
  if (v26 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_21BEA9B18();
  __swift_project_value_buffer(v27, (uint64_t)qword_267C72D90);
  id v28 = a1;
  uint64_t v29 = sub_21BEA9B08();
  os_log_type_t v30 = sub_21BEAA6C8();
  if (os_log_type_enabled(v29, v30))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = (void *)swift_slowAlloc();
    uint64_t v42 = a9;
    uint64_t v43 = a3;
    *(_DWORD *)id v31 = 138412290;
    unint64_t v54 = (unint64_t)v28;
    id v32 = v28;
    uint64_t v16 = v42;
    a3 = v43;
    sub_21BEAAA78();
    os_log_t v33 = v41;
    *uint64_t v41 = v28;

    _os_log_impl(&dword_21BB87000, v29, v30, "Calling perform load for event: %@", v31, 0xCu);
    sub_21BD247DC(0, &qword_26AAF38F0);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v33, -1, -1);
    MEMORY[0x21D49EAD0](v31, -1, -1);
  }
  else
  {
  }
  uint64_t v34 = (uint64_t)v50;
  sub_21BD0FEAC();
  if (__swift_getEnumTagSinglePayload(v34, 1, v21) == 1)
  {
    sub_21BD23B5C(v34, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v56 = 2;
    unint64_t v54 = 0;
    unint64_t v55 = 0xE000000000000000;
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    unint64_t v54 = 0xD000000000000023;
    unint64_t v55 = 0x800000021BECC510;
    id v35 = v28;
    id v36 = objc_msgSend(v35, sel_description);
    sub_21BEAA178();

    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    id v37 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v38 = v37;
    sub_21BD1A530((unint64_t)v37, 1, a3, v46, v47, v53, v48, v49, v16);
    swift_release();
    swift_release();
  }
  else
  {
    id v40 = v44;
    uint64_t v39 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v44, v34, v21);
    sub_21BD139B8();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v21);
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
}

void sub_21BD139B8()
{
  OUTLINED_FUNCTION_34();
  uint64_t v3 = v2;
  uint64_t v20 = v4;
  OUTLINED_FUNCTION_109();
  uint64_t v5 = sub_21BEA9488();
  OUTLINED_FUNCTION_0_3();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v10, v11, v12);
  uint64_t v13 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v1, v5);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v15 = (v9 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v14, v13, v5);
  *(void *)(v16 + v15) = v0;
  uint64_t v17 = (void *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8));
  void *v17 = v20;
  v17[1] = v3;
  id v18 = v0;
  swift_retain();
  sub_21BEA93A8();
  swift_release();
  OUTLINED_FUNCTION_33();
}

void sub_21BD13AFC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t), char *a5)
{
  uint64_t v111 = a3;
  v112 = a5;
  uint64_t v109 = a4;
  uint64_t v110 = a1;
  uint64_t v107 = a2;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8, v7, v8);
  uint64_t v104 = (char *)v95 - v9;
  uint64_t v108 = sub_21BEA94B8();
  uint64_t v106 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108, v10, v11);
  uint64_t v105 = (char *)v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], v5);
  MEMORY[0x270FA5388](v13 - 8, v14, v15);
  uint64_t v17 = (char *)v95 - v16;
  uint64_t v18 = sub_21BEA93B8();
  uint64_t v103 = *(void *)(v18 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v18, v19, v20);
  uint64_t v102 = (char *)v95 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21, v23, v24);
  os_log_type_t v101 = (char *)v95 - v25;
  uint64_t v26 = sub_21BEA9E68();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26, v28, v29);
  id v31 = (void *)((char *)v95 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = sub_21BEA9488();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v32, v34, v35);
  uint64_t v100 = (char *)v95 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x270FA5388](v36, v38, v39);
  uint64_t v99 = (char *)v95 - v41;
  uint64_t v98 = v42;
  MEMORY[0x270FA5388](v40, v43, v44);
  uint64_t v46 = (char *)v95 - v45;
  sub_21BD251A8();
  MEMORY[0x270FA5388](v47, v48, v49);
  uint64_t v51 = (void **)((char *)v95 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21BD25414();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v52 = *v51;
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v32);
    sub_21BD0E4A4((uint64_t)v17);
    id v53 = v52;
    v109(v52, 1);
  }
  else
  {
    uint64_t v97 = v17;
    unint64_t v54 = v112;
    uint64_t v110 = v33;
    uint64_t v56 = v33 + 32;
    unint64_t v55 = *(void (**)(void, void, void))(v33 + 32);
    unint64_t v57 = v46;
    unint64_t v58 = v51;
    uint64_t v59 = v32;
    uint64_t v96 = (void (*)(char *, char *, uint64_t))v55;
    v55(v46, v58, v32);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2E50);
    *id v31 = sub_21BEAA748();
    (*(void (**)(uint64_t *, void, uint64_t))(v27 + 104))(v31, *MEMORY[0x263F8F0E0], v26);
    char v60 = sub_21BEA9E98();
    (*(void (**)(uint64_t *, uint64_t))(v27 + 8))(v31, v26);
    if (v60)
    {
      v95[1] = v56;
      unint64_t v61 = v101;
      sub_21BEA93C8();
      uint64_t v63 = v102;
      uint64_t v62 = v103;
      (*(void (**)(char *, void, uint64_t))(v103 + 104))(v102, *MEMORY[0x263F5E7E8], v18);
      sub_21BD25464(&qword_267C65498, MEMORY[0x263F5E800]);
      char v64 = sub_21BEAA128();
      unint64_t v65 = *(void (**)(char *, uint64_t))(v62 + 8);
      v65(v63, v18);
      v65(v61, v18);
      uint64_t v66 = v54;
      uint64_t v67 = v59;
      uint64_t v68 = v110;
      uint64_t v69 = v57;
      if ((v64 & 1) == 0)
      {
        os_log_type_t v70 = (id *)(v111 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
        swift_beginAccess();
        uint64_t v71 = (uint64_t)v97;
        if (*v70)
        {
          id v72 = objc_msgSend(*v70, sel_eventStream);
          sub_21BD20A0C(0, (unint64_t *)&qword_26AAF3080, (uint64_t (*)(uint64_t))sub_21BC0BD80, MEMORY[0x263F8E0F8]);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_21BEEB430;
          *(void *)(inited + 32) = @"account-id";
          uint64_t v74 = @"account-id";
          sub_21BD1460C();
          if (v75)
          {
            id v76 = (id)sub_21BEAA138();
            swift_bridgeObjectRelease();
          }
          else
          {
            id v76 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
          }
          *(void *)(inited + 40) = v76;
          type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
          sub_21BC330F8(0, (unint64_t *)&qword_26AAF2F10);
          sub_21BD25464((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
          uint64_t v77 = sub_21BEAA0C8();
          sub_21BCC8474(@"session-will-begin", v77, v72);

          uint64_t v69 = v57;
          uint64_t v66 = v112;
        }
        (*(void (**)(uint64_t, char *, uint64_t))(v68 + 16))(v71, v69, v67);
        __swift_storeEnumTagSinglePayload(v71, 0, 1, v67);
        sub_21BD0E4A4(v71);
      }
      uint64_t v78 = (uint64_t)v104;
      sub_21BEA9478();
      uint64_t v79 = v108;
      if (__swift_getEnumTagSinglePayload(v78, 1, v108) == 1)
      {
        sub_21BD23B5C(v78, (uint64_t)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
        sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
        sub_21BEAA178();
        uint64_t v113 = 3;
        sub_21BEAA0C8();
        type metadata accessor for Code(0);
        sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
        uint64_t v80 = (void *)sub_21BEAA9B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v81 = v80;
        v109(v80, 1);

        (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v67);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v106 + 32))(v105, v78, v79);
        uint64_t v82 = swift_allocObject();
        swift_unknownObjectWeakInit();
        unint64_t v83 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
        unint64_t v84 = v99;
        v83(v99, v107, v67);
        unint64_t v85 = v66;
        uint64_t v86 = v100;
        v83(v100, (uint64_t)v69, v67);
        uint64_t v87 = *(unsigned __int8 *)(v68 + 80);
        uint64_t v88 = (v87 + 40) & ~v87;
        v112 = v69;
        uint64_t v89 = (v98 + v87 + v88) & ~v87;
        v90 = (char *)swift_allocObject();
        id v91 = v109;
        *((void *)v90 + 2) = v82;
        *((void *)v90 + 3) = v91;
        *((void *)v90 + 4) = v85;
        unint64_t v92 = v84;
        unint64_t v93 = v96;
        v96(&v90[v88], v92, v67);
        v93(&v90[v89], v86, v67);
        swift_retain();
        swift_retain();
        uint64_t v94 = v105;
        sub_21BEA9388();
        swift_release();
        (*(void (**)(char *, uint64_t))(v106 + 8))(v94, v108);
        (*(void (**)(char *, uint64_t))(v68 + 8))(v112, v67);
        swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void *sub_21BD1460C()
{
  id v0 = sub_21BD1F4F0();
  uint64_t v1 = v0;
  if (v0)
  {
    id v2 = objc_msgSend(v0, sel_hashedDSID);

    uint64_t v1 = (void *)sub_21BEAA178();
  }
  return v1;
}

void sub_21BD14680(void *a1, void (**a2)(void, void), void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v208 = a6;
  uint64_t v213 = a5;
  uint64_t v221 = a4;
  v222 = a3;
  v226 = a2;
  id v215 = a1;
  uint64_t v6 = sub_21BEA9358();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v232 = v6;
  uint64_t v233 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v6, v8, v9);
  v231 = ((char *)v205 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = MEMORY[0x270FA5388](v10, v12, v13);
  v230 = (char *)v205 - v15;
  uint64_t v18 = MEMORY[0x270FA5388](v14, v16, v17);
  v228 = (char *)v205 - v19;
  uint64_t v22 = MEMORY[0x270FA5388](v18, v20, v21);
  uint64_t v227 = (uint64_t)v205 - v23;
  uint64_t v26 = MEMORY[0x270FA5388](v22, v24, v25);
  v220 = (char *)v205 - v27;
  uint64_t v30 = MEMORY[0x270FA5388](v26, v28, v29);
  os_log_t v218 = (os_log_t)((char *)v205 - v31);
  uint64_t v34 = MEMORY[0x270FA5388](v30, v32, v33);
  v229 = (char *)v205 - v35;
  MEMORY[0x270FA5388](v34, v36, v37);
  v225 = (char *)v205 - v38;
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v39 - 8, v40, v41);
  v209 = (char *)v205 - v42;
  uint64_t v212 = sub_21BEA93B8();
  uint64_t v211 = *(void *)(v212 - 8);
  MEMORY[0x270FA5388](v212, v43, v44);
  v210 = (char *)v205 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v223 = sub_21BEA94F8();
  unint64_t v219 = *(void *)(v223 - 8);
  uint64_t v48 = MEMORY[0x270FA5388](v223, v46, v47);
  v214 = (char *)v205 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = MEMORY[0x270FA5388](v48, v50, v51);
  unint64_t v54 = (unint64_t)v205 - v53;
  uint64_t v57 = MEMORY[0x270FA5388](v52, v55, v56);
  uint64_t v59 = (char *)v205 - v58;
  MEMORY[0x270FA5388](v57, v60, v61);
  v224 = (char *)v205 - v62;
  v217 = (uint8_t *)sub_21BEA9498();
  unint64_t v63 = *((void *)v217 - 1);
  uint64_t v66 = MEMORY[0x270FA5388](v217, v64, v65);
  uint64_t v68 = (char *)v205 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v66, v69, v70);
  v216 = (char *)v205 - v71;
  sub_21BD25368();
  MEMORY[0x270FA5388](v72, v73, v74);
  id v76 = (char *)v205 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_21BEA9E68();
  uint64_t v78 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77, v79, v80);
  uint64_t v82 = (void *)((char *)v205 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2E50);
  *uint64_t v82 = sub_21BEAA748();
  (*(void (**)(uint64_t *, void, uint64_t))(v78 + 104))(v82, *MEMORY[0x263F8F0E0], v77);
  char v83 = sub_21BEA9E98();
  unint64_t v85 = *(void (**)(uint64_t *, uint64_t))(v78 + 8);
  unint64_t v84 = v78 + 8;
  v85(v82, v77);
  if ((v83 & 1) == 0) {
    goto LABEL_104;
  }
  uint64_t v86 = v226 + 2;
  swift_beginAccess();
  uint64_t v87 = MEMORY[0x21D49EBF0](v86);
  if (!v87)
  {
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    v234[0] = 0;
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v99 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v100 = v99;
    v222(v99, 1);

    return;
  }
  id v88 = (id)v87;
  sub_21BD25414();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  id v215 = v88;
  if (EnumCaseMultiPayload == 1)
  {
    unint64_t v84 = v63;
    uint64_t v59 = v216;
    unint64_t v54 = (unint64_t)v217;
    (*(void (**)(char *, char *, uint8_t *))(v63 + 32))(v216, v76, v217);
    if (qword_267C62778 == -1)
    {
LABEL_5:
      uint64_t v90 = sub_21BEA9B18();
      __swift_project_value_buffer(v90, (uint64_t)qword_267C72D90);
      id v91 = *(void (**)(char *, char *, unint64_t))(v84 + 16);
      v91(v68, v59, v54);
      unint64_t v92 = sub_21BEA9B08();
      os_log_type_t v93 = sub_21BEAA6B8();
      if (os_log_type_enabled(v92, v93))
      {
        uint64_t v94 = (uint8_t *)swift_slowAlloc();
        uint64_t v233 = swift_slowAlloc();
        *(_DWORD *)uint64_t v94 = 138543362;
        sub_21BD25464(&qword_267C64BC0, MEMORY[0x263F5E848]);
        swift_allocError();
        v91(v95, v68, (unint64_t)v217);
        uint64_t v96 = _swift_stdlib_bridgeErrorToNSError();
        v234[0] = v96;
        sub_21BEAAA78();
        uint64_t v97 = v233;
        *(void *)uint64_t v233 = v96;
        unint64_t v54 = (unint64_t)v217;
        uint64_t v98 = *(void (**)(char *, uint8_t *))(v84 + 8);
        v98(v68, v217);
        _os_log_impl(&dword_21BB87000, v92, v93, "􀃂 Got error from MediaRepository, %{public}@", v94, 0xCu);
        sub_21BD247DC(0, &qword_26AAF38F0);
        swift_arrayDestroy();
        MEMORY[0x21D49EAD0](v97, -1, -1);
        MEMORY[0x21D49EAD0](v94, -1, -1);
      }
      else
      {
        uint64_t v98 = *(void (**)(char *, uint8_t *))(v84 + 8);
        v98(v68, (uint8_t *)v54);
      }

      uint64_t v111 = v216;
      id v112 = sub_21BCDF064();
      v222(v112, 1);

      v98(v111, (uint8_t *)v54);
      return;
    }
LABEL_105:
    swift_once();
    goto LABEL_5;
  }
  v226 = (void (**)(void, void))v54;
  unint64_t v54 = v219;
  uint64_t v102 = v223;
  os_log_type_t v101 = v224;
  (*(void (**)(char *, char *, uint64_t))(v219 + 32))(v224, v76, v223);
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v103 = sub_21BEA9B18();
  uint64_t v104 = __swift_project_value_buffer(v103, (uint64_t)qword_267C72D90);
  uint64_t v105 = *(void (**)(void (**)(void, void), char *, uint64_t))(v54 + 16);
  unint64_t v207 = v54 + 16;
  v206 = v105;
  v105((void (**)(void, void))v59, v101, v102);
  v205[1] = v104;
  uint64_t v106 = sub_21BEA9B08();
  os_log_type_t v107 = sub_21BEAA6C8();
  if (os_log_type_enabled(v106, v107))
  {
    uint64_t v108 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v108 = 134349056;
    uint64_t v109 = *(void *)(sub_21BEA94E8() + 16);
    swift_bridgeObjectRelease();
    v216 = *(char **)(v54 + 8);
    ((void (*)(char *, uint64_t))v216)(v59, v102);
    v234[0] = v109;
    sub_21BEAAA78();
    _os_log_impl(&dword_21BB87000, v106, v107, "􀡓 Got %{public}ld items from PML", v108, 0xCu);
    uint64_t v110 = v108;
    id v88 = v215;
    MEMORY[0x21D49EAD0](v110, -1, -1);
  }
  else
  {
    v216 = *(char **)(v54 + 8);
    ((void (*)(char *, uint64_t))v216)(v59, v102);
  }
  uint64_t v113 = v230;
  uint64_t v68 = v225;

  int v114 = v210;
  sub_21BEA93C8();
  uint64_t v115 = v211;
  uint64_t v116 = v212;
  int v117 = (*(uint64_t (**)(char *, uint64_t))(v211 + 88))(v114, v212);
  uint64_t v118 = v232;
  v119 = v214;
  if (v117 == *MEMORY[0x263F5E7F0]) {
    goto LABEL_18;
  }
  if (v117 == *MEMORY[0x263F5E7E8]) {
    goto LABEL_19;
  }
  if (v117 == *MEMORY[0x263F5E7F8])
  {
LABEL_18:
    uint64_t v120 = (uint64_t)v209;
    sub_21BEA94C8();
    uint64_t v121 = (uint64_t)v88 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest;
    swift_beginAccess();
    sub_21BD23BB0(v120, v121);
    swift_endAccess();
  }
  else if (v117 != *MEMORY[0x263F5E7E0])
  {
    (*(void (**)(char *, uint64_t))(v115 + 8))(v114, v116);
  }
LABEL_19:
  uint64_t v122 = v224;
  uint64_t v123 = *(void *)(sub_21BEA94E8() + 16);
  swift_bridgeObjectRelease();
  v124 = v226;
  v125 = v122;
  uint64_t v126 = v223;
  v206(v226, v125, v223);
  if (v123)
  {
    ((void (*)(void, uint64_t))v216)(v124, v126);
    goto LABEL_22;
  }
  uint64_t v127 = sub_21BEA94D8();
  uint64_t v118 = v232;
  ((void (*)(void, uint64_t))v216)(v124, v126);
  if (v127)
  {
LABEL_22:
    v128 = v224;
    if (sub_21BEA94D8())
    {
      v129 = sub_21BEA9B08();
      os_log_type_t v130 = sub_21BEAA6C8();
      if (os_log_type_enabled(v129, v130))
      {
        v131 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v131 = 0;
        _os_log_impl(&dword_21BB87000, v129, v130, "􀢕 Collection has subscription only content", v131, 2u);
        v132 = v131;
        uint64_t v118 = v232;
        MEMORY[0x21D49EAD0](v132, -1, -1);
      }

      uint64_t v59 = (char *)sub_21BEA94E8();
      v234[0] = MEMORY[0x263F8EE78];
      uint64_t v133 = *((void *)v59 + 2);
      if (v133)
      {
        unint64_t v134 = 0;
        v226 = (void (**)(void, void))(v233 + 16);
        v217 = (uint8_t *)(v233 + 8);
        unint64_t v84 = v233 + 32;
        while (v134 < *((void *)v59 + 2))
        {
          unint64_t v135 = (*(unsigned __int8 *)(v233 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v233 + 80);
          unint64_t v54 = *(void *)(v233 + 72);
          (*(void (**)(char *, char *, uint64_t))(v233 + 16))(v68, &v59[v135 + v54 * v134], v118);
          if (sub_21BEA9228())
          {
            v136 = v68;
            v137 = *(void (**)(unint64_t, char *, uint64_t))v84;
            (*(void (**)(char *, char *, uint64_t))v84)(v229, v136, v118);
            uint64_t v138 = v234[0];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_21BCB3C9C();
              uint64_t v138 = v234[0];
            }
            unint64_t v139 = *(void *)(v138 + 16);
            if (v139 >= *(void *)(v138 + 24) >> 1)
            {
              sub_21BCB3C9C();
              uint64_t v138 = v234[0];
            }
            *(void *)(v138 + 16) = v139 + 1;
            uint64_t v118 = v232;
            v137(v138 + v135 + v139 * v54, v229, v232);
            v234[0] = v138;
            uint64_t v113 = v230;
            uint64_t v68 = v225;
          }
          else
          {
            (*(void (**)(char *, uint64_t))v217)(v68, v118);
          }
          if (v133 == ++v134)
          {
            unint64_t v54 = v234[0];
            v128 = v224;
            v119 = v214;
            goto LABEL_43;
          }
        }
        goto LABEL_102;
      }
      unint64_t v54 = MEMORY[0x263F8EE78];
LABEL_43:
      swift_bridgeObjectRelease();
      uint64_t v143 = *(void *)(v54 + 16);
      uint64_t v144 = *(void *)(sub_21BEA94E8() + 16);
      swift_bridgeObjectRelease();
      if (v143 == v144)
      {
        swift_retain();
        v145 = sub_21BEA9B08();
        int v146 = sub_21BEAA6C8();
        if (os_log_type_enabled(v145, (os_log_type_t)v146))
        {
          v147 = (uint8_t *)swift_slowAlloc();
          uint64_t v148 = swift_slowAlloc();
          v149 = (char *)v148;
          v234[0] = v148;
          *(_DWORD *)v147 = 136446210;
          uint64_t v150 = *(void *)(v54 + 16);
          if (v150)
          {
            uint64_t v227 = v148;
            LODWORD(v228) = v146;
            v229 = (char *)v147;
            v230 = (char *)v54;
            v231 = v145;
            uint64_t v151 = v233 + 16;
            uint64_t v233 = *(void *)(v233 + 16);
            unint64_t v152 = v54 + ((*(unsigned __int8 *)(v151 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v151 + 64));
            uint64_t v153 = *(void *)(v151 + 56);
            v154 = (void (**)(os_log_t, uint64_t))(v151 - 8);
            swift_retain();
            uint64_t v155 = MEMORY[0x263F8EE78];
            do
            {
              os_log_t v156 = v218;
              uint64_t v157 = v232;
              ((void (*)(os_log_t, unint64_t, uint64_t))v233)(v218, v152, v232);
              uint64_t v158 = sub_21BEA92B8();
              uint64_t v160 = v159;
              (*v154)(v156, v157);
              if (v160)
              {
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  sub_21BD21160();
                  uint64_t v155 = v163;
                }
                unint64_t v161 = *(void *)(v155 + 16);
                if (v161 >= *(void *)(v155 + 24) >> 1)
                {
                  sub_21BD21160();
                  uint64_t v155 = v164;
                }
                *(void *)(v155 + 16) = v161 + 1;
                uint64_t v162 = v155 + 16 * v161;
                *(void *)(v162 + 32) = v158;
                *(void *)(v162 + 40) = v160;
              }
              v152 += v153;
              --v150;
            }
            while (v150);
            swift_release();
            v145 = v231;
            v147 = (uint8_t *)v229;
            LOBYTE(v146) = (_BYTE)v228;
            v149 = (char *)v227;
          }
          else
          {
            uint64_t v155 = MEMORY[0x263F8EE78];
          }
          uint64_t v200 = MEMORY[0x21D49BB30](v155, MEMORY[0x263F8D310]);
          unint64_t v202 = v201;
          swift_bridgeObjectRelease();
          uint64_t v235 = sub_21BCC7B5C(v200, v202, v234);
          sub_21BEAAA78();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21BB87000, v145, (os_log_type_t)v146, "􀢕 Found items that require subscription, %{public}s", v147, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x21D49EAD0](v149, -1, -1);
          MEMORY[0x21D49EAD0](v147, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
        sub_21BEAA178();
        v234[0] = 27;
        sub_21BEAA0C8();
        _s3__C4CodeOMa_3(0);
        sub_21BD25464((unint64_t *)&qword_267C629E0, _s3__C4CodeOMa_3);
        v203 = (void *)sub_21BEAA9B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v204 = v203;
        v222(v203, 1);

        v199 = v224;
        goto LABEL_100;
      }
      swift_release();
    }
    uint64_t v165 = v223;
    v206((void (**)(void, void))v119, v128, v223);
    v166 = sub_21BEA9B08();
    LODWORD(v225) = sub_21BEAA6C8();
    if (os_log_type_enabled(v166, (os_log_type_t)v225))
    {
      os_log_t v218 = v166;
      v167 = (uint8_t *)swift_slowAlloc();
      uint64_t v213 = swift_slowAlloc();
      v234[0] = v213;
      v217 = v167;
      *(_DWORD *)v167 = 136315138;
      uint64_t v59 = (char *)sub_21BEA94E8();
      uint64_t v235 = MEMORY[0x263F8EE78];
      uint64_t v168 = *((void *)v59 + 2);
      if (v168)
      {
        unint64_t v84 = 0;
        v169 = (char **)(v233 + 32);
        v226 = (void (**)(void, void))(v233 + 8);
        v170 = v220;
        v229 = (char *)(v233 + 16);
        while (v84 < *((void *)v59 + 2))
        {
          unint64_t v54 = (*(unsigned __int8 *)(v233 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v233 + 80);
          uint64_t v171 = *(void *)(v233 + 72);
          (*(void (**)(char *, char *, uint64_t))(v233 + 16))(v170, &v59[v54 + v171 * v84], v118);
          if (sub_21BEA9228())
          {
            (*v226)(v170, v118);
          }
          else
          {
            uint64_t v68 = *v169;
            ((void (*)(uint64_t, char *, uint64_t))*v169)(v227, v170, v118);
            uint64_t v172 = v235;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_21BCB3C9C();
              uint64_t v172 = v235;
            }
            unint64_t v173 = *(void *)(v172 + 16);
            if (v173 >= *(void *)(v172 + 24) >> 1)
            {
              sub_21BCB3C9C();
              uint64_t v172 = v235;
            }
            *(void *)(v172 + 16) = v173 + 1;
            unint64_t v174 = v172 + v54 + v173 * v171;
            uint64_t v118 = v232;
            ((void (*)(unint64_t, uint64_t, uint64_t))v68)(v174, v227, v232);
            uint64_t v235 = v172;
            v170 = v220;
          }
          if (v168 == ++v84)
          {
            uint64_t v175 = v235;
            uint64_t v113 = v230;
            v119 = v214;
            goto LABEL_73;
          }
        }
        goto LABEL_103;
      }
      uint64_t v175 = MEMORY[0x263F8EE78];
LABEL_73:
      swift_bridgeObjectRelease();
      uint64_t v176 = *(void *)(v175 + 16);
      if (v176)
      {
        uint64_t v235 = MEMORY[0x263F8EE78];
        sub_21BCB3BDC();
        v229 = *(char **)(v233 + 16);
        unint64_t v177 = v175 + ((*(unsigned __int8 *)(v233 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v233 + 80));
        uint64_t v227 = *(void *)(v233 + 72);
        v178 = (void (**)(char *, uint64_t))(v233 + 8);
        do
        {
          v179 = v228;
          uint64_t v180 = v232;
          ((void (*)(char *, unint64_t, uint64_t))v229)(v228, v177, v232);
          uint64_t v181 = sub_21BEA92B8();
          uint64_t v183 = v182;
          (*v178)(v179, v180);
          uint64_t v184 = v235;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_21BCB3BDC();
            uint64_t v184 = v235;
          }
          unint64_t v54 = *(void *)(v184 + 16);
          if (v54 >= *(void *)(v184 + 24) >> 1)
          {
            sub_21BCB3BDC();
            uint64_t v184 = v235;
          }
          *(void *)(v184 + 16) = v54 + 1;
          unint64_t v185 = v184 + 16 * v54;
          *(void *)(v185 + 32) = v181;
          *(void *)(v185 + 40) = v183;
          v177 += v227;
          --v176;
        }
        while (v176);
        swift_release();
        uint64_t v118 = v232;
        uint64_t v113 = v230;
        v119 = v214;
      }
      else
      {
        swift_release();
        uint64_t v184 = MEMORY[0x263F8EE78];
      }
      v186 = v217;
      sub_21BD25644(0, (unint64_t *)&unk_26AAEF8C0, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
      uint64_t v188 = MEMORY[0x21D49BB30](v184, v187);
      unint64_t v190 = v189;
      swift_bridgeObjectRelease();
      uint64_t v235 = sub_21BCC7B5C(v188, v190, v234);
      sub_21BEAAA78();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v216)(v119, v223);
      os_log_t v191 = v218;
      _os_log_impl(&dword_21BB87000, v218, (os_log_type_t)v225, "􀢕 Filtered items: %s", v186, 0xCu);
      uint64_t v192 = v213;
      swift_arrayDestroy();
      MEMORY[0x21D49EAD0](v192, -1, -1);
      MEMORY[0x21D49EAD0](v186, -1, -1);

      v128 = v224;
    }
    else
    {
      ((void (*)(char *, uint64_t))v216)(v119, v165);
    }
    uint64_t v59 = (char *)sub_21BEA94E8();
    unint64_t v84 = MEMORY[0x263F8EE78];
    v234[0] = MEMORY[0x263F8EE78];
    v229 = (char *)*((void *)v59 + 2);
    if (v229)
    {
      unint64_t v193 = 0;
      uint64_t v68 = (char *)(v233 + 32);
      v228 = (char *)(v233 + 8);
      while (v193 < *((void *)v59 + 2))
      {
        unint64_t v54 = (*(unsigned __int8 *)(v233 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v233 + 80);
        uint64_t v194 = *(void *)(v233 + 72);
        (*(void (**)(char *, char *, uint64_t))(v233 + 16))(v113, &v59[v54 + v194 * v193], v118);
        if (sub_21BEA9228())
        {
          (*(void (**)(char *, uint64_t))v228)(v113, v118);
        }
        else
        {
          unint64_t v84 = *(void *)v68;
          (*(void (**)(NSObject *, char *, uint64_t))v68)(v231, v113, v118);
          uint64_t v195 = v234[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_21BCB3C9C();
            uint64_t v195 = v234[0];
          }
          unint64_t v196 = *(void *)(v195 + 16);
          if (v196 >= *(void *)(v195 + 24) >> 1)
          {
            sub_21BCB3C9C();
            uint64_t v195 = v234[0];
          }
          *(void *)(v195 + 16) = v196 + 1;
          uint64_t v118 = v232;
          ((void (*)(unint64_t, NSObject *, uint64_t))v84)(v195 + v54 + v196 * v194, v231, v232);
          v234[0] = v195;
          uint64_t v113 = v230;
        }
        if (v229 == (char *)++v193)
        {
          unint64_t v84 = v234[0];
          v128 = v224;
          goto LABEL_95;
        }
      }
      __break(1u);
LABEL_102:
      __break(1u);
LABEL_103:
      __break(1u);
LABEL_104:
      __break(1u);
      goto LABEL_105;
    }
LABEL_95:
    swift_bridgeObjectRelease();
    id v197 = v215;
    unint64_t v198 = sub_21BD16184(v84, v208);
    swift_release();
    v222((void *)v198, 0);
    swift_bridgeObjectRelease();

    v199 = v128;
LABEL_100:
    ((void (*)(char *, uint64_t))v216)(v199, v223);
    return;
  }
  v140 = sub_21BEA9B08();
  os_log_type_t v141 = sub_21BEAA6C8();
  if (os_log_type_enabled(v140, v141))
  {
    v142 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v142 = 0;
    _os_log_impl(&dword_21BB87000, v140, v141, "􀡓 No playable items found", v142, 2u);
    MEMORY[0x21D49EAD0](v142, -1, -1);
  }

  if (qword_267C62740 != -1) {
    swift_once();
  }
  v222((void *)qword_267C72D50, 1);

  ((void (*)(char *, uint64_t))v216)(v224, v223);
}

unint64_t sub_21BD16184(uint64_t a1, uint64_t a2)
{
  uint64_t v76 = a2;
  uint64_t v75 = sub_21BEA9488();
  uint64_t v4 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75, v5, v6);
  uint64_t v74 = (char *)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21BEA9358();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8, v10, v11);
  uint64_t v73 = (char *)v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v12, v14, v15);
  uint64_t v18 = (char *)v66 - v17;
  MEMORY[0x270FA5388](v16, v19, v20);
  uint64_t v22 = (char *)v66 - v21;
  unint64_t v23 = MEMORY[0x263F8EE78];
  unint64_t v82 = MEMORY[0x263F8EE78];
  uint64_t v24 = *(void *)(a1 + 16);
  if (v24)
  {
    uint64_t v25 = (uint64_t *)(v2 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_contentItemIDsMap);
    uint64_t v26 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v66[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v67 = v25;
    swift_beginAccess();
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v28 = v9 + 16;
    uint64_t v27 = v29;
    uint64_t v30 = *(void *)(v28 + 56);
    uint64_t v71 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v79 = (void (**)(char *, uint64_t))(v28 - 8);
    uint64_t v80 = v30;
    *(void *)&long long v31 = 136315138;
    long long v69 = v31;
    uint64_t v68 = MEMORY[0x263F8EE58] + 8;
    uint64_t v77 = v28;
    uint64_t v78 = v29;
    uint64_t v72 = v18;
    uint64_t v70 = v22;
    do
    {
      v27(v22, v26, v8);
      if (sub_21BEA91B8())
      {
        if (qword_267C62778 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_21BEA9B18();
        __swift_project_value_buffer(v32, (uint64_t)qword_267C72D90);
        v27(v18, (uint64_t)v22, v8);
        uint64_t v33 = sub_21BEA9B08();
        os_log_type_t v34 = sub_21BEAA6C8();
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v35 = swift_slowAlloc();
          uint64_t v36 = swift_slowAlloc();
          v81[0] = v36;
          *(_DWORD *)uint64_t v35 = v69;
          uint64_t v37 = sub_21BEA92B8();
          if (v38)
          {
            unint64_t v39 = v38;
          }
          else
          {
            uint64_t v37 = 0;
            unint64_t v39 = 0xE000000000000000;
          }
          *(void *)(v35 + 4) = sub_21BCC7B5C(v37, v39, v81);
          swift_bridgeObjectRelease();
          uint64_t v40 = *v79;
          (*v79)(v18, v8);
          _os_log_impl(&dword_21BB87000, v33, v34, "􀉼 Removing explicit media: '%s'", (uint8_t *)v35, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x21D49EAD0](v36, -1, -1);
          uint64_t v41 = v35;
          uint64_t v27 = v78;
          MEMORY[0x21D49EAD0](v41, -1, -1);

          v40(v70, v8);
          uint64_t v22 = v70;
        }
        else
        {

          uint64_t v47 = *v79;
          (*v79)(v18, v8);
          v47(v22, v8);
        }
      }
      else
      {
        sub_21BEA9138();
        uint64_t v43 = v42;
        swift_bridgeObjectRelease();
        if (v43)
        {
          uint64_t v44 = sub_21BEA9138();
          uint64_t v46 = v45;
        }
        else
        {
          uint64_t v48 = sub_21BEA91C8();
          if (v49)
          {
            uint64_t v44 = 0;
            uint64_t v46 = 0;
          }
          else
          {
            v81[0] = v48;
            sub_21BCB1E54();
            sub_21BEAAAA8();
            uint64_t v50 = *v67;
            if (*(void *)(*v67 + 16))
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v51 = sub_21BC3F03C();
              if (v52)
              {
                uint64_t v53 = (uint64_t *)(*(void *)(v50 + 56) + 16 * v51);
                uint64_t v44 = *v53;
                uint64_t v46 = v53[1];
                swift_bridgeObjectRetain();
              }
              else
              {
                uint64_t v44 = 0;
                uint64_t v46 = 0;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v44 = 0;
              uint64_t v46 = 0;
            }
            swift_beginAccess();
            sub_21BC25E68();
            swift_endAccess();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v27 = v78;
          }
        }
        uint64_t v54 = (uint64_t)v73;
        v27(v73, (uint64_t)v22, v8);
        uint64_t v55 = (uint64_t)v74;
        (*v71)(v74, v76, v75);
        LOBYTE(v81[0]) = 1;
        id v56 = objc_allocWithZone((Class)type metadata accessor for PodcastAVItem());
        uint64_t v57 = sub_21BCA45AC(v54, v55, (unsigned __int8 *)v81, v44, v46, 0);
        uint64_t v18 = v72;
        if (v57)
        {
          id v58 = v57;
          MEMORY[0x21D49BB00]();
          if (*(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_21BEAA338();
          }
          sub_21BEAA358();
          sub_21BEAA328();
        }
        (*v79)(v22, v8);
        uint64_t v27 = v78;
      }
      v26 += v80;
      --v24;
    }
    while (v24);
    swift_bridgeObjectRelease();
    unint64_t v23 = v82;
  }
  sub_21BEA9448();
  if ((v59 & 1) == 0)
  {
    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_21BEAAD88()) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v60 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v60)
      {
LABEL_33:
        sub_21BCD9EFC(0, (v23 & 0xC000000000000001) == 0, v23);
        if ((v23 & 0xC000000000000001) != 0) {
          id v61 = (id)MEMORY[0x21D49C490](0, v23);
        }
        else {
          id v61 = *(id *)(v23 + 32);
        }
        uint64_t v62 = v61;
        swift_bridgeObjectRelease();
        sub_21BEA9448();
        if (v63) {
          uint64_t v64 = 0;
        }
        else {
          uint64_t v64 = (void *)sub_21BEAA508();
        }
        objc_msgSend(v62, sel_setInitialPlaybackStartTimeOverride_, v64);

        return v23;
      }
    }
    swift_bridgeObjectRelease();
  }
  return v23;
}

void sub_21BD1687C(void *a1, char *a2, void *aBlock)
{
  _Block_copy(aBlock);
  if (sub_21BD32DA4())
  {
    uint64_t v6 = (void **)&a2[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host];
    swift_beginAccess();
    uint64_t v7 = *v6;
    if (v7)
    {
      swift_unknownObjectRetain();
      uint64_t v8 = (void *)sub_21BEAA138();
      id v9 = objc_msgSend(v7, sel_beginEditWithReason_, v8);
      swift_unknownObjectRelease();
    }
    else
    {
      id v9 = 0;
    }
    _Block_copy(aBlock);
    id v10 = v9;
    uint64_t v11 = a2;
    sub_21BD11310(a1, (uint64_t)v11, v11, v9, (void (**)(void, void, void, void, void))aBlock);

    _Block_release(aBlock);
    _Block_release(aBlock);
  }
  else
  {
    (*((void (**)(void *, void, void, void, void))aBlock + 2))(aBlock, 0, 0, 0, 0);
    _Block_release(aBlock);
    _Block_release(aBlock);
  }
}

void sub_21BD169F0()
{
  OUTLINED_FUNCTION_34_14();
  OUTLINED_FUNCTION_90_1();
  if (sub_21BD32DA4())
  {
    uint64_t v2 = (void **)&v1[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host];
    OUTLINED_FUNCTION_2();
    uint64_t v3 = *v2;
    if (*v2)
    {
      swift_unknownObjectRetain();
      uint64_t v4 = (void *)OUTLINED_FUNCTION_113();
      id v5 = objc_msgSend(v3, sel_beginEditWithReason_, v4);
      swift_unknownObjectRelease();
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;
    v1;
    swift_retain();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_55_5();
    sub_21BD11A34(v7, v8, v9, v10, v11, v12);
  }
  else
  {
    OUTLINED_FUNCTION_107();
    v0();
  }
  OUTLINED_FUNCTION_32_13();
}

void sub_21BD16AE0(id a1, char a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, id), uint64_t a5, void *a6)
{
  if (a2)
  {
    id v12 = a1;
    a4(0, 0, 0, 0, 0, a1);
    objc_msgSend(a6, sel_rollback);
    sub_21BD249C0(a1, 1);
  }
  else
  {
    sub_21BD0D744((unint64_t)a1);
    sub_21BD33404(v9);
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_21BD3301C();
    a4(1, v10, v11, 0xD00000000000002BLL, 0x800000021BECC5F0, 0);
    swift_bridgeObjectRelease();
    objc_msgSend(a6, sel_commit);
  }
}

void sub_21BD16C94(char a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = a5;
  if (a3)
  {
    uint64_t v11 = (void *)sub_21BEAA138();
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v11 = 0;
  if (a5) {
LABEL_3:
  }
    uint64_t v9 = (void *)sub_21BEAA138();
LABEL_4:
  if (a6) {
    uint64_t v12 = sub_21BEA8B08();
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = (id)v12;
  (*(void (**)(uint64_t, void, void *, void *))(a7 + 16))(a7, a1 & 1, v11, v9);
}

uint64_t sub_21BD16D64(void *a1, char *a2, void *aBlock)
{
  _Block_copy(aBlock);
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_21BEA9B18();
  __swift_project_value_buffer(v6, (uint64_t)qword_267C72D90);
  uint64_t v7 = sub_21BEA9B08();
  os_log_type_t v8 = sub_21BEAA6C8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_21BB87000, v7, v8, "Calling perform load", v9, 2u);
    MEMORY[0x21D49EAD0](v9, -1, -1);
  }

  uint64_t v10 = (void **)&a2[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host];
  swift_beginAccess();
  uint64_t v11 = *v10;
  if (v11)
  {
    swift_unknownObjectRetain();
    uint64_t v12 = (void *)sub_21BEAA138();
    id v13 = objc_msgSend(v11, sel_beginEditWithReason_, v12);
    swift_unknownObjectRelease();
  }
  else
  {
    id v13 = 0;
  }
  _Block_copy(aBlock);
  id v14 = v13;
  uint64_t v15 = a2;
  sub_21BD1210C(a1, (uint64_t)v15, v15, v13, (void (**)(void, void))aBlock);
  uint64_t v16 = sub_21BD3301C();

  _Block_release(aBlock);
  _Block_release(aBlock);
  return v16;
}

void sub_21BD16F48()
{
  OUTLINED_FUNCTION_34_14();
  OUTLINED_FUNCTION_90_1();
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21BEA9B18();
  __swift_project_value_buffer(v2, (uint64_t)qword_267C72D90);
  uint64_t v3 = sub_21BEA9B08();
  os_log_type_t v4 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_21_3(v4))
  {
    id v5 = (uint8_t *)OUTLINED_FUNCTION_3_2();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21BB87000, v3, v1, "Calling perform load", v5, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  uint64_t v6 = (void **)&v0[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host];
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *v6;
  if (*v6)
  {
    swift_unknownObjectRetain();
    os_log_type_t v8 = (void *)sub_21BEAA138();
    id v9 = objc_msgSend(v7, sel_beginEditWithReason_, v8);
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;
  v0;
  swift_retain();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_55_5();
  sub_21BD12764(v11, v12, v13, v14, v15, v16);
  sub_21BD3301C();

  OUTLINED_FUNCTION_32_13();
}

void sub_21BD170D0(unint64_t a1, char a2, uint64_t a3, void (*a4)(void), uint64_t a5, void *a6)
{
  uint64_t v12 = sub_21BEA9488();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14, v15);
  uint64_t v17 = (char *)v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v18 - 8, v19, v20);
  uint64_t v22 = (char *)v48 - v21;
  if ((a2 & 1) == 0)
  {
    swift_beginAccess();
    sub_21BD23AF4();
    if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v12))
    {
      sub_21BD23B5C((uint64_t)v22, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v22, v12);
      sub_21BD23B5C((uint64_t)v22, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
      sub_21BD1460C();
      uint64_t v26 = v25;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
      if (v26)
      {
        id v23 = (id)sub_21BEAA138();
        swift_bridgeObjectRelease();
LABEL_10:
        if (a1 >> 62)
        {
          swift_bridgeObjectRetain();
          if (sub_21BEAAD88())
          {
LABEL_12:
            sub_21BCD9EFC(0, (a1 & 0xC000000000000001) == 0, a1);
            if ((a1 & 0xC000000000000001) != 0) {
              id v28 = (id)MEMORY[0x21D49C490](0, a1);
            }
            else {
              id v28 = *(id *)(a1 + 32);
            }
            uint64_t v29 = v28;
            sub_21BD249C0((id)a1, 0);
            sub_21BC1F38C(v29, (SEL *)&selRef_queueSectionID);
            if (v30) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v27 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v27) {
            goto LABEL_12;
          }
        }
        sub_21BD249C0((id)a1, 0);
LABEL_18:
        swift_bridgeObjectRelease();
LABEL_19:
        uint64_t v51 = a5;
        long long v31 = (void *)sub_21BEAA138();
        swift_bridgeObjectRelease();
        uint64_t v32 = (void **)(a3 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
        swift_beginAccess();
        uint64_t v33 = *v32;
        if (*v32)
        {
          v48[1] = a3;
          char v49 = a4;
          id v34 = objc_msgSend(v33, sel_eventStream);
          v48[0] = @"queue-add";
          sub_21BD20A0C(0, (unint64_t *)&qword_26AAF3080, (uint64_t (*)(uint64_t))sub_21BC0BD80, MEMORY[0x263F8E0F8]);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_21BEEB3A0;
          *(void *)(inited + 32) = @"account-id";
          uint64_t v50 = a6;
          if (v23)
          {
            uint64_t v36 = @"account-id";
            uint64_t v37 = v23;
            id v38 = v23;
          }
          else
          {
            id v38 = 0;
            id v39 = objc_allocWithZone(MEMORY[0x263EFF9D0]);
            uint64_t v40 = @"account-id";
            id v23 = objc_msgSend(v39, sel_init);
            uint64_t v37 = 0;
          }
          *(void *)(inited + 40) = v23;
          *(void *)(inited + 48) = @"queue-section-id";
          *(void *)(inited + 56) = v31;
          type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
          sub_21BC330F8(0, (unint64_t *)&qword_26AAF2F10);
          sub_21BD25464((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
          id v41 = v37;
          uint64_t v42 = @"queue-section-id";
          id v43 = v31;
          uint64_t v44 = sub_21BEAA0C8();
          sub_21BCC8474(v48[0], v44, v34);

          a4 = v49;
          a6 = v50;
          id v23 = v38;
        }
        sub_21BD0D744(a1);
        sub_21BD33404(v45);
        swift_bridgeObjectRelease();
        a4(0);
        sub_21BD3301C();
        if (v46)
        {
          if (a6)
          {
            uint64_t v47 = (void *)sub_21BEAA138();
            swift_bridgeObjectRelease();
            objc_msgSend(a6, sel_setSuggestedContentItemIDForStart_, v47);
          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
        objc_msgSend(a6, sel_commit);

        return;
      }
    }
    id v23 = 0;
    goto LABEL_10;
  }
  uint64_t v24 = (id *)(id)a1;
  a4(a1);
  objc_msgSend(a6, sel_rollback);

  sub_21BD249C0((id)a1, 1);
}

void sub_21BD177B0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_21BEA8B08();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_21BD17818(uint64_t a1, void *a2)
{
  sub_21BD330BC(a1, a2, 1, (uint64_t)&v20);
  if (!v21)
  {
    sub_21BCDADD4((uint64_t)&v20);
    return 0;
  }
  sub_21BC32CE8(&v20, (uint64_t)v22);
  __swift_project_boxed_opaque_existential_0Tm(v22, v23);
  uint64_t v2 = OUTLINED_FUNCTION_90();
  uint64_t result = v3(v2);
  if (v5)
  {
    uint64_t v6 = v23;
    uint64_t v7 = v24;
    __swift_project_boxed_opaque_existential_0Tm(v22, v23);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
    if (v8)
    {
      uint64_t v9 = v23;
      uint64_t v10 = v24;
      __swift_project_boxed_opaque_existential_0Tm(v22, v23);
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
      uint64_t v13 = v12;
      id v14 = objc_allocWithZone((Class)type metadata accessor for QueueControllerBehaviorPodcastsIdentifierComponents());
      uint64_t v15 = OUTLINED_FUNCTION_100();
      uint64_t v19 = sub_21BCFE3F8(v15, v16, v17, v18, v11, v13);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
      return (uint64_t)v19;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL sub_21BD17990(uint64_t a1, void *a2)
{
  sub_21BD330BC(a1, a2, 1, (uint64_t)v4);
  BOOL v2 = v5 != 0;
  sub_21BCDADD4((uint64_t)v4);
  return v2;
}

BOOL sub_21BD17AB4()
{
  return sub_21BD32D6C();
}

uint64_t sub_21BD17AE4()
{
  if (MTPlaybackContinuousPlaybackEnabled()) {
    return 0;
  }
  sub_21BD25590();
  return sub_21BEA8F98() & 1;
}

uint64_t sub_21BD17B24(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a3 == 3 && (sub_21BD17AE4() & 1) != 0 || (a4 & 1) != 0)
  {
    sub_21BC0BE78(0, &qword_267C65218);
    uint64_t v19 = (void *)MEMORY[0x21D49C1A0](MEMORY[0x263F8EE78]);
LABEL_11:
    id v20 = objc_msgSend(v19, sel_objectEnumerator);

    return (uint64_t)v20;
  }
  if (!a2
    || (uint64_t v6 = sub_21BD327D4(),
        uint64_t v7 = OUTLINED_FUNCTION_67_2(),
        uint64_t v9 = sub_21BD0D434(v7, v8, v6),
        char v11 = v10,
        swift_bridgeObjectRelease(),
        (v11 & 1) != 0))
  {
    sub_21BD327D4();
    goto LABEL_10;
  }
  sub_21BD327D4();
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v9, 1))
  {
    uint64_t v13 = sub_21BD327D4();
    sub_21BD0DB9C(v9 + 1, v13);
    swift_bridgeObjectRelease();
    uint64_t v14 = OUTLINED_FUNCTION_100();
    sub_21BD0DAA4(v14, v15, v16, v17, v18);
LABEL_10:
    uint64_t v19 = (void *)sub_21BEAA2F8();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_21BD17D24()
{
  os_log_type_t v1 = v0;
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF0068, (uint64_t (*)(uint64_t))sub_21BD234A8, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21BEEB3B0;
  uint64_t v3 = MEMORY[0x263F8D310];
  sub_21BEAABD8();
  swift_getObjectType();
  uint64_t v12 = sub_21BEAB018();
  uint64_t v13 = v4;
  sub_21BEAA238();
  id v5 = objc_msgSend(v0, sel_description);
  sub_21BEAA178();

  sub_21BEAA238();
  swift_bridgeObjectRelease();
  *(void *)(inited + 96) = v3;
  *(void *)(inited + 72) = v12;
  *(void *)(inited + 80) = v13;
  sub_21BEAABD8();
  uint64_t v6 = &v1[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_allowsQueueModifications];
  OUTLINED_FUNCTION_2();
  char v7 = *v6;
  uint64_t v8 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 168) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = v7;
  sub_21BEAABD8();
  uint64_t v9 = &v1[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations];
  OUTLINED_FUNCTION_2();
  char v10 = *v9;
  *(void *)(inited + 240) = v8;
  *(unsigned char *)(inited + 216) = v10;
  return sub_21BEAA0C8();
}

void sub_21BD17FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void **)(v4 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  OUTLINED_FUNCTION_2();
  char v7 = *v6;
  if (*v6)
  {
    swift_unknownObjectRetain();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_51_8();
    id v9 = objc_msgSend(v7, sel_beginEditWithReason_, v8);
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = OUTLINED_FUNCTION_32();
  sub_21BD330BC(v10, v11, 1, v12);
  if (v22)
  {
    sub_21BC1FB08(0, (unint64_t *)&qword_267C64A20);
    type metadata accessor for PodcastAVItem();
    if (swift_dynamicCast())
    {
      id v13 = *v6;
      id v14 = v20;
      if (v13) {
        id v13 = objc_msgSend(v13, sel_eventStream);
      }
      objc_msgSend(v20, sel_setEventStream_, v13);
    }
  }
  else
  {
    sub_21BCDADD4((uint64_t)v21);
  }
  OUTLINED_FUNCTION_85_1();
  char v18 = sub_21BD33590(v15, v16, v17, a4);
  uint64_t v19 = &selRef_commit;
  if ((v18 & 1) == 0) {
    uint64_t v19 = &selRef_rollback;
  }
  [v9 *v19];
}

void sub_21BD181F0()
{
  OUTLINED_FUNCTION_34();
  os_log_type_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_21BEA9B18();
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8, v9);
  OUTLINED_FUNCTION_49();
  uint64_t v12 = v11 - v10;
  sub_21BD330BC(v3, v1, 0, (uint64_t)v24);
  if (!v24[3])
  {
    sub_21BCDADD4((uint64_t)v24);
    goto LABEL_12;
  }
  sub_21BC1FB08(0, (unint64_t *)&qword_267C64A20);
  sub_21BC0BE78(0, (unint64_t *)&unk_267C64A28);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    OUTLINED_FUNCTION_33();
    return;
  }
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_267C72D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v12, v13, v4);
  id v14 = v23;
  uint64_t v15 = sub_21BEA9B08();
  os_log_type_t v16 = sub_21BEAA6C8();
  if (!os_log_type_enabled(v15, v16))
  {

    goto LABEL_11;
  }
  uint64_t v17 = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_25_10();
  OUTLINED_FUNCTION_71_2(7.2225e-34);
  v24[0] = v18;
  sub_21BEAAA78();
  *(_WORD *)(v17 + 12) = 2081;
  uint64_t v19 = sub_21BCBB040(v14, (SEL *)&selRef_mainTitle);
  if (v20)
  {
    sub_21BCC7B5C(v19, v20, v24);
    sub_21BEAAA78();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21BB87000, v15, v16, "Returning av item '%{private,mask.hash}s'", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();

LABEL_11:
    uint64_t v21 = OUTLINED_FUNCTION_32();
    v22(v21);
    goto LABEL_12;
  }

  __break(1u);
}

id sub_21BD184B4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  sub_21BEAA178();
  id v6 = a1;
  uint64_t v7 = OUTLINED_FUNCTION_23_12();
  uint64_t v8 = (void *)a4(v7);

  swift_bridgeObjectRelease();

  return v8;
}

void static QueueControllerBehaviorPodcasts.canLoad(_:reason:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_70_3();
  a27 = v29;
  a28 = v30;
  uint64_t v32 = v31;
  id v34 = v33;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_21BEA9B18();
  __swift_project_value_buffer(v35, (uint64_t)qword_267C72D90);
  uint64_t v36 = sub_21BEA9B08();
  os_log_type_t v37 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_67_5(v37))
  {
    id v38 = (uint8_t *)OUTLINED_FUNCTION_3_2();
    *(_WORD *)id v38 = 0;
    _os_log_impl(&dword_21BB87000, v36, v28, "􀩳 Asking if we can load queue", v38, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  self;
  uint64_t v39 = swift_dynamicCastObjCClass();
  if (v39)
  {
    uint64_t v40 = (void *)v39;
    id v41 = v34;
    id v42 = objc_msgSend(v40, sel_identifier);
    uint64_t v43 = sub_21BEAA178();
    uint64_t v45 = v44;

    if (v43 == 0xD00000000000001BLL && v45 == 0x800000021BEC9610)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    char v46 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v46)
    {
LABEL_10:
      uint64_t v47 = (void *)sub_21BEA9B08();
      os_log_type_t v48 = sub_21BEAA6C8();
      if (OUTLINED_FUNCTION_11_25(v48))
      {
        char v49 = (_WORD *)OUTLINED_FUNCTION_3_2();
        OUTLINED_FUNCTION_33_12(v49);
        OUTLINED_FUNCTION_8_25(&dword_21BB87000, v50, v51, "􀩳 We support this custom queue");
        OUTLINED_FUNCTION_2_0();
      }
      goto LABEL_12;
    }
  }
  self;
  if (swift_dynamicCastObjCClass() && objc_msgSend(self, sel_isSystemPodcasts))
  {
    uint64_t v47 = (void *)sub_21BEA9B08();
    os_log_type_t v52 = sub_21BEAA6C8();
    if (OUTLINED_FUNCTION_11_25(v52))
    {
      uint64_t v53 = (_WORD *)OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_33_12(v53);
      OUTLINED_FUNCTION_8_25(&dword_21BB87000, v54, v55, "􀩳 Received MPMediaQuery queue that we support");
      OUTLINED_FUNCTION_2_0();
    }
    goto LABEL_18;
  }
  self;
  id v56 = (void *)swift_dynamicCastObjCClass();
  id v41 = v34;
  if (!v56)
  {
    char v63 = sub_21BEA9B08();
    os_log_type_t v64 = sub_21BEAA6C8();
    if (OUTLINED_FUNCTION_21_3(v64))
    {
      uint64_t v65 = (_DWORD *)OUTLINED_FUNCTION_47();
      uint64_t v66 = (void *)swift_slowAlloc();
      *uint64_t v65 = 138412290;
      a14 = (uint64_t)v41;
      id v67 = v41;
      sub_21BEAAA78();
      *uint64_t v66 = v41;

      OUTLINED_FUNCTION_53_8(&dword_21BB87000, v63, OS_LOG_TYPE_DEFAULT, "􀩳 Unsupported queue type. %@");
      sub_21BD247DC(0, &qword_26AAF38F0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();

      if (!v32) {
        goto LABEL_40;
      }
    }
    else
    {

      if (!v32) {
        goto LABEL_40;
      }
    }
    sub_21BC0BE78(0, &qword_267C64A10);
    long long v69 = (void *)sub_21BEAAA18();
    id v70 = v69;
    *uint64_t v32 = v69;
    goto LABEL_40;
  }
  sub_21BC1F38C(v56, (SEL *)&selRef_siriAssetInfo);
  if (v57)
  {
    swift_bridgeObjectRetain();
    id v58 = sub_21BEA9B08();
    os_log_type_t v59 = sub_21BEAA6C8();
    if (os_log_type_enabled(v58, v59))
    {
      id v82 = v41;
      uint64_t v60 = (uint8_t *)OUTLINED_FUNCTION_47();
      a14 = OUTLINED_FUNCTION_25_10();
      *(_DWORD *)uint64_t v60 = 136380675;
      uint64_t v61 = sub_21BEAA208();
      sub_21BCC7B5C(v61, v62, &a14);
      sub_21BEAAA78();
      OUTLINED_FUNCTION_59_5();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21BB87000, v58, v59, "Found Siri Asset Info: %{private}s", v60, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      id v41 = v82;
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      OUTLINED_FUNCTION_59_5();
    }
  }
  uint64_t v68 = sub_21BD239EC(v56);
  if (!v68)
  {
LABEL_33:
    if (v32)
    {
      sub_21BC0BE78(0, &qword_267C64A10);
      uint64_t v71 = (void *)sub_21BEAAA18();
      id v72 = v71;
      *uint64_t v32 = v71;
    }
    uint64_t v47 = (void *)sub_21BEA9B08();
    os_log_type_t v73 = sub_21BEAA6C8();
    if (OUTLINED_FUNCTION_11_25(v73))
    {
      uint64_t v74 = (_WORD *)OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_33_12(v74);
      OUTLINED_FUNCTION_8_25(&dword_21BB87000, v75, v76, "􀩳 Didn't find track identifiers in queue. Aborting.");
      OUTLINED_FUNCTION_2_0();

      goto LABEL_40;
    }
    goto LABEL_12;
  }
  if (!*(void *)(v68 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21BEA9438();
  swift_bridgeObjectRelease();
  uint64_t v47 = (void *)sub_21BEA9B08();
  os_log_type_t v77 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_11_25(v77))
  {
    uint64_t v79 = (_WORD *)OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_33_12(v79);
    OUTLINED_FUNCTION_8_25(&dword_21BB87000, v80, v81, "􀩳 We support this queue");
    OUTLINED_FUNCTION_2_0();

LABEL_18:
    goto LABEL_40;
  }
LABEL_12:

LABEL_40:
  OUTLINED_FUNCTION_63_3();
}

id sub_21BD18DC0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  os_log_type_t v1 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

#error "21BD18E54: call analysis failed (funcsize=15)"

id QueueControllerBehaviorPodcasts.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void QueueControllerBehaviorPodcasts.init()()
{
}

id QueueControllerBehaviorPodcasts.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QueueControllerBehaviorPodcasts();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::String_optional __swiftcall QueueControllerBehaviorPodcasts.tailInsertionContentItemID(forTargetContentItemID:)(Swift::String_optional forTargetContentItemID)
{
  uint64_t v1 = sub_21BD325F0();
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t QueueControllerBehaviorPodcasts.isSupportedInsertionPosition(_:fromContentItemID:reason:)(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  if (a1 == 1)
  {
    sub_21BD325F0();
    if (v1)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return 0;
}

void sub_21BD191DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *aBlock)
{
  _Block_copy(aBlock);
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_21BEA9B18();
  __swift_project_value_buffer(v9, (uint64_t)qword_267C72D90);
  swift_bridgeObjectRetain_n();
  id v10 = a1;
  uint64_t v11 = sub_21BEA9B08();
  os_log_type_t v12 = sub_21BEAA6C8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v30[0] = v27;
    *(_DWORD *)uint64_t v13 = 136446466;
    id v14 = objc_msgSend(v10, sel_debugDescription);
    uint64_t v15 = sub_21BEAA178();
    uint64_t v28 = a4;
    unint64_t v17 = v16;

    sub_21BCC7B5C(v15, v17, v30);
    sub_21BEAAA78();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    if (a3) {
      uint64_t v18 = a2;
    }
    else {
      uint64_t v18 = 0;
    }
    if (a3) {
      unint64_t v19 = a3;
    }
    else {
      unint64_t v19 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_21BCC7B5C(v18, v19, v30);
    sub_21BEAAA78();
    swift_bridgeObjectRelease_n();
    a4 = v28;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21BB87000, v11, v12, "􀐇 Inserting: %{public}s - target: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v27, -1, -1);
    MEMORY[0x21D49EAD0](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v20 = (void **)(a4 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  swift_beginAccess();
  uint64_t v21 = *v20;
  if (*v20)
  {
    swift_unknownObjectRetain();
    uint64_t v22 = (void *)sub_21BEAA138();
    id v23 = objc_msgSend(v21, sel_beginEditWithReason_, v22);
    swift_unknownObjectRelease();
  }
  else
  {
    id v23 = 0;
  }
  id v24 = objc_msgSend(v10, sel_insertionPosition);
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  _Block_copy(aBlock);
  id v26 = v23;
  swift_bridgeObjectRetain();
  sub_21BD12D5C(v10, a4, v25, v23, (unint64_t)v24, a2, a3, (void (**)(void, void))aBlock);

  _Block_release(aBlock);
  _Block_release(aBlock);
}

void QueueControllerBehaviorPodcasts.performInsertCommand(_:targetContentItemID:completion:)(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *), uint64_t a5)
{
  uint64_t v6 = v5;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_21BEA9B18();
  __swift_project_value_buffer(v11, (uint64_t)qword_267C72D90);
  swift_bridgeObjectRetain_n();
  id v12 = a1;
  uint64_t v13 = (void *)sub_21BEA9B08();
  os_log_type_t v14 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_83_1(v14))
  {
    uint64_t v15 = OUTLINED_FUNCTION_50();
    v35[0] = OUTLINED_FUNCTION_15_0();
    *(_DWORD *)uint64_t v15 = 136446466;
    id v16 = objc_msgSend(v12, sel_debugDescription);
    uint64_t v17 = sub_21BEAA178();
    uint64_t v33 = a5;
    unint64_t v19 = v18;

    sub_21BCC7B5C(v17, v19, v35);
    sub_21BEAAA78();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v20 = OUTLINED_FUNCTION_23_12();
    sub_21BCC7B5C(v20, v21, v22);
    a5 = v33;
    sub_21BEAAA78();
    OUTLINED_FUNCTION_34_2();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_105(&dword_21BB87000, v23, v24, "􀐇 Inserting: %{public}s - target: %{public}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    OUTLINED_FUNCTION_34_2();
  }
  uint64_t v25 = (void **)(v6 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  OUTLINED_FUNCTION_2();
  id v26 = *v25;
  if (*v25)
  {
    swift_unknownObjectRetain();
    uint64_t v27 = (void *)sub_21BEAA138();
    id v28 = objc_msgSend(v26, sel_beginEditWithReason_, v27);
    swift_unknownObjectRelease();
  }
  else
  {
    id v28 = 0;
  }
  id v29 = objc_msgSend(v12, sel_insertionPosition);
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v31 = v6;
  id v32 = v28;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21BD133A4(v12, v31, v30, v28, a4, a5, (unint64_t)v29, a2, a3);
}

void sub_21BD1988C(unint64_t a1, char a2, uint64_t a3, void *a4, unint64_t a5, uint64_t a6, uint64_t a7, void (**a8)(void, void))
{
  uint64_t v84 = a7;
  uint64_t v83 = a6;
  uint64_t v93 = sub_21BEA9488();
  uint64_t v14 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93, v15, v16);
  uint64_t v87 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v18 - 8, v19, v20);
  uint64_t v22 = (char *)&v76 - v21;
  uint64_t v23 = a3 + 16;
  swift_beginAccess();
  uint64_t v24 = (char *)MEMORY[0x21D49EBF0](a3 + 16);
  if (!v24)
  {
    objc_msgSend(a4, sel_rollback);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v95 = 4;
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    os_log_type_t v59 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v60 = v59;
    uint64_t v61 = (void *)sub_21BEA8B08();
    ((void (**)(void, void *))a8)[2](a8, v61);
LABEL_38:

    goto LABEL_39;
  }
  if (a2)
  {
    unint64_t v62 = v24;
    id v63 = (id)a1;
    objc_msgSend(a4, sel_rollback);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v95 = 4;
    os_log_type_t v64 = (void *)sub_21BEA8B08();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v65 = (void *)sub_21BEAA9B8();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v66 = v65;
    id v67 = (void *)sub_21BEA8B08();
    ((void (**)(void, void *))a8)[2](a8, v67);

    sub_21BD249C0((id)a1, 1);
LABEL_39:
    _Block_release(a8);
    return;
  }
  uint64_t v78 = v24;
  unint64_t v76 = a5;
  uint64_t v79 = a8;
  id v77 = a4;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_21BEAAD88();
    if (v25) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
  uint64_t v25 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v25)
  {
LABEL_33:
    sub_21BD249C0((id)a1, 0);
    uint64_t v68 = v76;
    if (v76 <= 1)
    {
      swift_beginAccess();
      uint64_t v69 = MEMORY[0x21D49EBF0](v23);
      a8 = v79;
      id v70 = v77;
      if (v69)
      {
        uint64_t v71 = (void *)v69;
        swift_retain();

        sub_21BD0D744(a1);
        sub_21BD33768(v83, v84, v72, v68);
        swift_release();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v70, sel_commit, v76);
      id v73 = v78;
      uint64_t v74 = &v78[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations];
      swift_beginAccess();
      *uint64_t v74 = 1;
      a8[2](a8, 0);

      goto LABEL_39;
    }
    objc_msgSend(v77, sel_rollback);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v94 = 4;
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v75 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v60 = v75;
    uint64_t v61 = (void *)sub_21BEA8B08();
    a8 = v79;
    ((void (**)(void, void *))v79)[2](v79, v61);

    goto LABEL_38;
  }
LABEL_5:
  if (v25 >= 1)
  {
    unint64_t v26 = a1 & 0xC000000000000001;
    swift_beginAccess();
    swift_beginAccess();
    uint64_t v27 = 0;
    id v82 = (void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    uint64_t v80 = (void (**)(char *, uint64_t))(v14 + 8);
    id v91 = @"queue-item-add";
    uint64_t v90 = @"account-id";
    unint64_t v28 = 0x263EFF000uLL;
    uint64_t v89 = @"queue-item-id";
    long long v88 = xmmword_21BEEB3A0;
    uint64_t v86 = v22;
    unint64_t v81 = a1;
    unint64_t v92 = a1 & 0xC000000000000001;
    uint64_t v85 = v25;
    while (1)
    {
      if (v26) {
        id v29 = (id)MEMORY[0x21D49C490](v27, a1);
      }
      else {
        id v29 = *(id *)(a1 + 8 * v27 + 32);
      }
      uint64_t v30 = v29;
      uint64_t v31 = MEMORY[0x21D49EBF0](v23);
      if (!v31) {
        goto LABEL_21;
      }
      id v32 = (void *)v31;
      uint64_t v33 = (void **)(v31 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
      swift_beginAccess();
      id v34 = *v33;
      swift_unknownObjectRetain();

      if (!v34) {
        goto LABEL_21;
      }
      id v35 = objc_msgSend(v34, sel_eventStream);
      swift_unknownObjectRelease();
      sub_21BD20A0C(0, (unint64_t *)&qword_26AAF3080, (uint64_t (*)(uint64_t))sub_21BC0BD80, MEMORY[0x263F8E0F8]);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v88;
      os_log_type_t v37 = v90;
      *(void *)(inited + 32) = v90;
      uint64_t v38 = MEMORY[0x21D49EBF0](v23);
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        uint64_t v40 = v37;
        swift_beginAccess();
        uint64_t v41 = (uint64_t)v86;
        sub_21BD23AF4();
        id v42 = v40;

        uint64_t v43 = v93;
        if (__swift_getEnumTagSinglePayload(v41, 1, v93))
        {
          sub_21BD23B5C(v41, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
          unint64_t v28 = 0x263EFF000;
          uint64_t v25 = v85;
        }
        else
        {
          (*v82)(v87, v41, v43);
          sub_21BD23B5C(v41, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
          id v51 = objc_msgSend(self, sel_sharedManager);
          os_log_type_t v52 = (void *)sub_21BEA9398();
          if (v52
            && (uint64_t v53 = v52,
                id v54 = objc_msgSend(v52, sel_ams_DSID),
                v53,
                v54))
          {
            id v55 = objc_msgSend(v54, sel_stringValue);

            sub_21BEAA178();
            uint64_t v56 = sub_21BEAA138();
            swift_bridgeObjectRelease();
            id v57 = objc_msgSend(v51, sel_accountForDSID_, v56);

            id v51 = (id)v56;
          }
          else
          {
            id v57 = objc_msgSend(v51, sel_activeAccount, v76);
          }
          uint64_t v25 = v85;

          if (v57)
          {
            id v58 = objc_msgSend(v57, sel_hashedDSID);

            sub_21BEAA178();
            (*v80)(v87, v93);
            id v45 = (id)sub_21BEAA138();
            swift_bridgeObjectRelease();
            a1 = v81;
            unint64_t v28 = 0x263EFF000;
            goto LABEL_17;
          }
          (*v80)(v87, v93);
          a1 = v81;
          unint64_t v28 = 0x263EFF000;
        }
      }
      else
      {
        uint64_t v44 = v37;
      }
      id v45 = objc_msgSend(objc_allocWithZone(*(Class *)(v28 + 2512)), sel_init);
LABEL_17:
      char v46 = v89;
      *(void *)(inited + 40) = v45;
      *(void *)(inited + 48) = v46;
      uint64_t v47 = v46;
      sub_21BD0BA70(v30);
      if (v48)
      {
        id v49 = (id)sub_21BEAA138();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v49 = objc_msgSend(objc_allocWithZone(*(Class *)(v28 + 2512)), sel_init);
      }
      *(void *)(inited + 56) = v49;
      type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
      sub_21BC330F8(0, (unint64_t *)&qword_26AAF2F10);
      sub_21BD25464((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
      uint64_t v50 = sub_21BEAA0C8();
      sub_21BCC8474((uint64_t)v91, v50, v35);

      unint64_t v26 = v92;
LABEL_21:
      ++v27;

      if (v25 == v27) {
        goto LABEL_33;
      }
    }
  }
  __break(1u);
}

void sub_21BD1A530(unint64_t a1, char a2, uint64_t a3, void *a4, void (*a5)(void *), uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v76 = a8;
  unint64_t v78 = a7;
  uint64_t v84 = sub_21BEA9488();
  uint64_t v15 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84, v16, v17);
  uint64_t v79 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v19 - 8, v20, v21);
  uint64_t v85 = (char *)&v70 - v22;
  uint64_t v23 = a3 + 16;
  swift_beginAccess();
  uint64_t v24 = (char *)MEMORY[0x21D49EBF0](a3 + 16);
  if (!v24)
  {
    objc_msgSend(a4, sel_rollback);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v89 = 4;
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v56 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v57 = v56;
    a5(v56);
    goto LABEL_38;
  }
  id v77 = a4;
  if (a2)
  {
    id v58 = v24;
    id v59 = (id)a1;
    objc_msgSend(v77, sel_rollback);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v89 = 4;
    id v60 = (void *)sub_21BEA8B08();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v61 = (void *)sub_21BEAA9B8();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v62 = v61;
    a5(v61);

    sub_21BD249C0((id)a1, 1);
    return;
  }
  uint64_t v71 = v24;
  uint64_t v72 = a6;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_21BEAAD88();
  }
  else
  {
    uint64_t v25 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v26 = (uint64_t)v85;
  if (!v25)
  {
LABEL_33:
    sub_21BD249C0((id)a1, 0);
    if (v78 < 2)
    {
      swift_beginAccess();
      uint64_t v63 = MEMORY[0x21D49EBF0](v23);
      id v64 = v77;
      if (v63)
      {
        uint64_t v65 = (void *)v63;
        swift_retain();

        sub_21BD0D744(a1);
        sub_21BD33768(v76, a9, v66, v78);
        swift_release();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v64, sel_commit);
      id v67 = v71;
      uint64_t v68 = &v71[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations];
      swift_beginAccess();
      char *v68 = 1;
      a5(0);

      return;
    }
    objc_msgSend(v77, sel_rollback);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t v88 = 4;
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    uint64_t v69 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v57 = v69;
    a5(v69);

LABEL_38:
    return;
  }
  if (v25 >= 1)
  {
    unint64_t v87 = a1 & 0xC000000000000001;
    swift_beginAccess();
    swift_beginAccess();
    uint64_t v27 = 0;
    uint64_t v75 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    id v73 = (void (**)(char *, uint64_t))(v15 + 8);
    id v82 = @"queue-item-add";
    unint64_t v28 = @"account-id";
    unint64_t v81 = @"queue-item-id";
    long long v80 = xmmword_21BEEB3A0;
    uint64_t v86 = @"account-id";
    uint64_t v74 = a5;
    unint64_t v83 = a1;
    while (1)
    {
      if (v87) {
        id v29 = (id)MEMORY[0x21D49C490](v27, a1);
      }
      else {
        id v29 = *(id *)(a1 + 8 * v27 + 32);
      }
      uint64_t v30 = v29;
      uint64_t v31 = MEMORY[0x21D49EBF0](v23);
      if (!v31) {
        goto LABEL_22;
      }
      id v32 = (void *)v31;
      uint64_t v33 = (void **)(v31 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
      swift_beginAccess();
      id v34 = *v33;
      swift_unknownObjectRetain();

      if (!v34) {
        goto LABEL_22;
      }
      id v35 = objc_msgSend(v34, sel_eventStream);
      swift_unknownObjectRelease();
      sub_21BD20A0C(0, (unint64_t *)&qword_26AAF3080, (uint64_t (*)(uint64_t))sub_21BC0BD80, MEMORY[0x263F8E0F8]);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v80;
      *(void *)(inited + 32) = v28;
      uint64_t v37 = MEMORY[0x21D49EBF0](v23);
      if (v37)
      {
        uint64_t v38 = (void *)v37;
        swift_beginAccess();
        sub_21BD23AF4();
        uint64_t v39 = v86;

        uint64_t v40 = v84;
        if (__swift_getEnumTagSinglePayload(v26, 1, v84))
        {
          sub_21BD23B5C(v26, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
        }
        else
        {
          (*v75)(v79, v26, v40);
          sub_21BD23B5C(v26, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
          id v48 = objc_msgSend(self, sel_sharedManager);
          id v49 = (void *)sub_21BEA9398();
          if (v49
            && (uint64_t v50 = v49,
                id v51 = objc_msgSend(v49, sel_ams_DSID),
                v50,
                v51))
          {
            id v52 = objc_msgSend(v51, sel_stringValue);

            sub_21BEAA178();
            uint64_t v53 = sub_21BEAA138();
            swift_bridgeObjectRelease();
            id v54 = objc_msgSend(v48, sel_accountForDSID_, v53);

            id v48 = (id)v53;
          }
          else
          {
            id v54 = objc_msgSend(v48, sel_activeAccount);
          }

          if (v54)
          {
            id v55 = objc_msgSend(v54, sel_hashedDSID);

            sub_21BEAA178();
            (*v73)(v79, v84);
            id v42 = (id)sub_21BEAA138();
            swift_bridgeObjectRelease();
            a5 = v74;
            goto LABEL_18;
          }
          (*v73)(v79, v84);
          a5 = v74;
        }
      }
      else
      {
        uint64_t v41 = v28;
      }
      id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
LABEL_18:
      uint64_t v43 = v81;
      *(void *)(inited + 40) = v42;
      *(void *)(inited + 48) = v43;
      uint64_t v44 = v43;
      sub_21BD0BA70(v30);
      if (v45)
      {
        id v46 = (id)sub_21BEAA138();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      }
      *(void *)(inited + 56) = v46;
      type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
      sub_21BC330F8(0, (unint64_t *)&qword_26AAF2F10);
      sub_21BD25464((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
      uint64_t v47 = sub_21BEAA0C8();
      sub_21BCC8474((uint64_t)v82, v47, v35);

      a1 = v83;
      uint64_t v26 = (uint64_t)v85;
      unint64_t v28 = v86;
LABEL_22:
      ++v27;

      if (v25 == v27) {
        goto LABEL_33;
      }
    }
  }
  __break(1u);
}

void QueueControllerBehaviorPodcasts.moveContentItemID(_:beforeContentItemID:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void *), uint64_t a6)
{
}

void sub_21BD1B300(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, void (**a6)(void, void), char *a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t, unint64_t, uint64_t, unint64_t))
{
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v34 = a1;
  uint64_t v15 = sub_21BEA9B18();
  __swift_project_value_buffer(v15, (uint64_t)qword_267C72D90);
  OUTLINED_FUNCTION_80_1();
  uint64_t v16 = sub_21BEA9B08();
  os_log_type_t v17 = sub_21BEAA6C8();
  if (os_log_type_enabled(v16, v17))
  {
    format = a7;
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_47();
    v38[0] = OUTLINED_FUNCTION_25_10();
    *(_DWORD *)uint64_t v18 = 136446210;
    swift_bridgeObjectRetain();
    sub_21BCC7B5C(v34, a2, v38);
    OUTLINED_FUNCTION_96();
    sub_21BEAAA78();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21BB87000, v16, v17, format, v18, 0xCu);
    OUTLINED_FUNCTION_72_2();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    OUTLINED_FUNCTION_106();
  }
  uint64_t v19 = (void **)(a5 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  OUTLINED_FUNCTION_2();
  uint64_t v20 = *v19;
  if (v20)
  {
    swift_unknownObjectRetain();
    uint64_t v21 = (void *)sub_21BEAA138();
    id v22 = objc_msgSend(v20, sel_beginEditWithReason_, v21);
    swift_unknownObjectRelease();
  }
  else
  {
    id v22 = 0;
  }
  if (a10(v34, a2, a3, a4))
  {
    objc_msgSend(v22, sel_commit);
    uint64_t v23 = (unsigned char *)(a5 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations);
    OUTLINED_FUNCTION_27_14();
    *uint64_t v23 = 1;
    a6[2](a6, 0);
  }
  else
  {
    objc_msgSend(v22, sel_rollback);
    OUTLINED_FUNCTION_80_1();
    swift_bridgeObjectRetain_n();
    uint64_t v24 = (void *)sub_21BEA9B08();
    os_log_type_t v25 = sub_21BEAA6B8();
    if (OUTLINED_FUNCTION_83_1(v25))
    {
      uint64_t v26 = OUTLINED_FUNCTION_50();
      uint64_t v36 = OUTLINED_FUNCTION_15_0();
      *(_DWORD *)uint64_t v26 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_21BCC7B5C(v34, a2, &v36);
      sub_21BEAAA78();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_21BCC7B5C(a3, a4, &v36);
      sub_21BEAAA78();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_105(&dword_21BB87000, v27, v28, "􀄬 Unable to move item. Didn't find %{public}s or %{public}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_106();
    }
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    OUTLINED_FUNCTION_57_5();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_102();
    sub_21BEAA238();
    OUTLINED_FUNCTION_94_0();
    sub_21BEAA238();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    id v29 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v30 = v29;
    uint64_t v31 = sub_21BEA8B08();
    a6[2](a6, v31);

    id v22 = (id)v31;
  }

  _Block_release(a6);
}

void QueueControllerBehaviorPodcasts.moveContentItemID(_:afterContentItemID:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void *), uint64_t a6)
{
}

void sub_21BD1B890(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void *), uint64_t a6, char *a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void))
{
  uint64_t v13 = v10;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v34 = a1;
  uint64_t v18 = sub_21BEA9B18();
  __swift_project_value_buffer(v18, (uint64_t)qword_267C72D90);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_21BEA9B08();
  os_log_type_t v20 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_28_14(v20))
  {
    format = a7;
    uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_47();
    v37[0] = OUTLINED_FUNCTION_25_10();
    *(_DWORD *)uint64_t v21 = 136446210;
    swift_bridgeObjectRetain();
    sub_21BCC7B5C(a1, a2, v37);
    OUTLINED_FUNCTION_96();
    sub_21BEAAA78();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21BB87000, v19, v11, format, v21, 0xCu);
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    OUTLINED_FUNCTION_34_2();
  }
  id v22 = (void **)(v13 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  OUTLINED_FUNCTION_2();
  uint64_t v23 = *v22;
  if (v23)
  {
    swift_unknownObjectRetain();
    uint64_t v24 = (void *)sub_21BEAA138();
    id v25 = objc_msgSend(v23, sel_beginEditWithReason_, v24);
    swift_unknownObjectRelease();
  }
  else
  {
    id v25 = 0;
  }
  OUTLINED_FUNCTION_89_1();
  if (a10())
  {
    objc_msgSend(v25, sel_commit);
    uint64_t v26 = (unsigned char *)(v13 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations);
    OUTLINED_FUNCTION_27_14();
    *uint64_t v26 = 1;
    a5(0);
  }
  else
  {
    objc_msgSend(v25, sel_rollback);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_21BEA9B08();
    os_log_type_t v28 = sub_21BEAA6B8();
    if (OUTLINED_FUNCTION_83_1(v28))
    {
      uint64_t v29 = OUTLINED_FUNCTION_50();
      uint64_t v35 = OUTLINED_FUNCTION_15_0();
      *(_DWORD *)uint64_t v29 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_21BCC7B5C(v34, a2, &v35);
      OUTLINED_FUNCTION_85_1();
      sub_21BEAAA78();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v29 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_21BCC7B5C(a3, a4, &v35);
      sub_21BEAAA78();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21BB87000, v27, (os_log_type_t)v13, "􀄬 Unable to move item. Didn't find %{public}s or %{public}s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      OUTLINED_FUNCTION_59_5();
      OUTLINED_FUNCTION_34_2();
    }
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    OUTLINED_FUNCTION_57_5();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_102();
    sub_21BEAA238();
    OUTLINED_FUNCTION_94_0();
    OUTLINED_FUNCTION_67_2();
    sub_21BEAA238();
    sub_21BEAA0C8();
    type metadata accessor for Code(0);
    sub_21BD25464((unint64_t *)&unk_267C64240, type metadata accessor for Code);
    id v30 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v31 = v30;
    a5(v30);
  }
}

#error "21BD1BEC0: call analysis failed (funcsize=53)"

void QueueControllerBehaviorPodcasts.canRemoveContentItemID(_:reason:)()
{
  OUTLINED_FUNCTION_18_0();
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21BEA9B18();
  __swift_project_value_buffer(v1, (uint64_t)qword_267C72D90);
  swift_bridgeObjectRetain_n();
  objc_super v2 = sub_21BEA9B08();
  os_log_type_t v3 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_21_3(v3))
  {
    uint64_t v4 = (_DWORD *)OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_25_10();
    *uint64_t v4 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v5 = OUTLINED_FUNCTION_67_2();
    sub_21BCC7B5C(v5, v6, v7);
    OUTLINED_FUNCTION_54_6();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_101(&dword_21BB87000, v2, v0, "Can remove item: %{public}s");
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    OUTLINED_FUNCTION_59_5();
  }
  uint64_t v8 = OUTLINED_FUNCTION_67_2();
  sub_21BD17990(v8, v9);
  OUTLINED_FUNCTION_16_11();
}

uint64_t sub_21BD1C064(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  sub_21BEAA178();
  id v7 = a1;
  uint64_t v8 = OUTLINED_FUNCTION_23_12();
  LOBYTE(a5) = a5(v8);

  swift_bridgeObjectRelease();
  return a5 & 1;
}

void sub_21BD1C0C8(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21BEA9B18();
  __swift_project_value_buffer(v8, (uint64_t)qword_267C72D90);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_21BEA9B08();
  os_log_type_t v10 = sub_21BEAA6C8();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v18[0] = v12;
    *(_DWORD *)os_log_type_t v11 = 136446210;
    swift_bridgeObjectRetain();
    sub_21BCC7B5C(a1, a2, v18);
    sub_21BEAAA78();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21BB87000, v9, v10, "􀢁 Remove item: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v12, -1, -1);
    MEMORY[0x21D49EAD0](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v13 = (void **)(a3 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if (v14)
  {
    swift_unknownObjectRetain();
    uint64_t v15 = (void *)sub_21BEAA138();
    id v16 = objc_msgSend(v14, sel_beginEditWithReason_, v15);
    swift_unknownObjectRelease();
  }
  else
  {
    id v16 = 0;
  }
  sub_21BD34170();
  objc_msgSend(v16, sel_commit);
  os_log_type_t v17 = (unsigned char *)(a3 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations);
  swift_beginAccess();
  unsigned char *v17 = 1;
  a4[2](a4, 0);

  _Block_release(a4);
}

void QueueControllerBehaviorPodcasts.removeContentItemID(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_70_3();
  a27 = v29;
  a28 = v30;
  uint64_t v31 = v28;
  uint64_t v33 = v32;
  unint64_t v35 = v34;
  uint64_t v46 = v36;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_21BEA9B18();
  __swift_project_value_buffer(v37, (uint64_t)qword_267C72D90);
  OUTLINED_FUNCTION_80_1();
  uint64_t v38 = sub_21BEA9B08();
  os_log_type_t v39 = sub_21BEAA6C8();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)OUTLINED_FUNCTION_47();
    a14 = OUTLINED_FUNCTION_25_10();
    *(_DWORD *)uint64_t v40 = 136446210;
    swift_bridgeObjectRetain();
    sub_21BCC7B5C(v46, v35, &a14);
    sub_21BEAAA78();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21BB87000, v38, v39, "􀢁 Remove item: %{public}s", v40, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    OUTLINED_FUNCTION_106();
  }
  uint64_t v41 = (void **)(v31 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  OUTLINED_FUNCTION_2();
  id v42 = *v41;
  if (*v41)
  {
    swift_unknownObjectRetain();
    uint64_t v43 = (void *)OUTLINED_FUNCTION_113();
    id v44 = objc_msgSend(v42, sel_beginEditWithReason_, v43);
    swift_unknownObjectRelease();
  }
  else
  {
    id v44 = 0;
  }
  sub_21BD34170();
  objc_msgSend(v44, sel_commit);
  uint64_t v45 = (unsigned char *)(v31 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations);
  OUTLINED_FUNCTION_27_14();
  *uint64_t v45 = 1;
  v33(0);

  OUTLINED_FUNCTION_63_3();
}

Swift::Void __swiftcall QueueControllerBehaviorPodcasts.clearAllItems(afterContentItemID:)(Swift::String afterContentItemID)
{
  uint64_t v3 = v1;
  OUTLINED_FUNCTION_48_9();
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21BEA9B18();
  __swift_project_value_buffer(v4, (uint64_t)qword_267C72D90);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_21BEA9B08();
  os_log_type_t v6 = sub_21BEAA6C8();
  if (OUTLINED_FUNCTION_21_3(v6))
  {
    id v7 = (_DWORD *)OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_25_10();
    *id v7 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v8 = OUTLINED_FUNCTION_32();
    sub_21BCC7B5C(v8, v9, v10);
    OUTLINED_FUNCTION_54_6();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_101(&dword_21BB87000, v5, v2, "Clear all items after: %{public}s");
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    OUTLINED_FUNCTION_8_6();
  }
  os_log_type_t v11 = (void **)(v3 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  OUTLINED_FUNCTION_2();
  uint64_t v12 = *v11;
  if (v12)
  {
    swift_unknownObjectRetain();
    uint64_t v13 = (void *)sub_21BEAA138();
    id v14 = objc_msgSend(v12, sel_beginEditWithReason_, v13);
    swift_unknownObjectRelease();
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = OUTLINED_FUNCTION_32();
  char v17 = sub_21BD341E8(v15, v16);
  uint64_t v18 = &selRef_commit;
  if ((v17 & 1) == 0) {
    uint64_t v18 = &selRef_rollback;
  }
  [v14 *v18];
}

Swift::Int __swiftcall QueueControllerBehaviorPodcasts.displayItemCount()()
{
  Swift::Int v0 = *(void *)(sub_21BD327D4() + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t QueueControllerBehaviorPodcasts.preferredUpcomingItemCount.getter()
{
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_21_0(v0);
  OUTLINED_FUNCTION_30_7();
  MEMORY[0x270FA5388](v1, v2, v3);
  uint64_t v5 = (char *)&v14 - v4;
  OUTLINED_FUNCTION_2();
  sub_21BD23AF4();
  uint64_t v6 = sub_21BEA94B8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 5;
  }
  OUTLINED_FUNCTION_89_1();
  sub_21BD23B5C(v8, v9, v10, v11, v12);
  return v7;
}

void sub_21BD1CA74(uint64_t a1, char *a2, void (**a3)(void, void))
{
  uint64_t v68 = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8, v7, v8);
  uint64_t v69 = (char *)v63 - v9;
  uint64_t v10 = sub_21BEA9488();
  uint64_t v70 = *(void *)(v10 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v10, v11, v12);
  uint64_t v66 = v14;
  id v67 = (char *)v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v15, v16);
  uint64_t v18 = (char *)v63 - v17;
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], v5);
  uint64_t v22 = MEMORY[0x270FA5388](v19 - 8, v20, v21);
  uint64_t v65 = (void (*)(char *, uint64_t, uint64_t))((char *)v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v22, v24, v25);
  uint64_t v27 = (char *)v63 - v26;
  uint64_t v28 = sub_21BEA94B8();
  uint64_t v72 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28, v29, v30);
  uint64_t v71 = (char *)v63 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = swift_allocObject();
  *(void *)(v73 + 16) = a3;
  _Block_copy(a3);
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_21BEA9B18();
  __swift_project_value_buffer(v32, (uint64_t)qword_267C72D90);
  uint64_t v33 = sub_21BEA9B08();
  os_log_type_t v34 = sub_21BEAA6C8();
  if (os_log_type_enabled(v33, v34))
  {
    unint64_t v35 = a2;
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 134217984;
    uint64_t v74 = v68;
    sub_21BEAAA78();
    _os_log_impl(&dword_21BB87000, v33, v34, "􀣬 Load additional items: Count: %ld", v36, 0xCu);
    uint64_t v37 = v36;
    a2 = v35;
    MEMORY[0x21D49EAD0](v37, -1, -1);
  }

  uint64_t v38 = (uint64_t)&a2[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest];
  swift_beginAccess();
  sub_21BD23AF4();
  if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28) == 1)
  {
    sub_21BD23B5C((uint64_t)v27, (uint64_t)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    os_log_type_t v39 = sub_21BEA9B08();
    os_log_type_t v40 = sub_21BEAA6C8();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_21BB87000, v39, v40, "􀡓 Next request is empty", v41, 2u);
      MEMORY[0x21D49EAD0](v41, -1, -1);
    }

    a3[2](a3, 0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v71, v27, v28);
    swift_beginAccess();
    uint64_t v42 = (uint64_t)v69;
    sub_21BD23AF4();
    if (__swift_getEnumTagSinglePayload(v42, 1, v10) == 1)
    {
      sub_21BD23B5C(v42, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
      uint64_t v43 = sub_21BEA9B08();
      os_log_type_t v44 = sub_21BEAA6C8();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl(&dword_21BB87000, v43, v44, "􀡓 No playback context found for next request. Skipping.", v45, 2u);
        MEMORY[0x21D49EAD0](v45, -1, -1);
      }

      uint64_t v46 = v65;
      __swift_storeEnumTagSinglePayload((uint64_t)v65, 1, 1, v28);
      swift_beginAccess();
      sub_21BD23BB0((uint64_t)v46, v38);
      swift_endAccess();
      a3[2](a3, 0);
      (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v28);
    }
    else
    {
      uint64_t v47 = v70 + 32;
      id v48 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 32);
      id v49 = v18;
      v48(v18, v42, v10);
      uint64_t v69 = a2;
      uint64_t v50 = (void **)&a2[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host];
      swift_beginAccess();
      id v51 = *v50;
      uint64_t v68 = v47;
      uint64_t v65 = v48;
      uint64_t v52 = v10;
      if (v51)
      {
        swift_unknownObjectRetain();
        uint64_t v53 = (void *)sub_21BEAA138();
        id v54 = objc_msgSend(v51, sel_beginEditWithReason_, v53);
        swift_unknownObjectRelease();
      }
      else
      {
        id v54 = 0;
      }
      id v55 = v69;
      uint64_t v56 = v70;
      v63[1] = *(void *)&v69[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_podcastsMediaLibrary];
      id v64 = v49;
      id v57 = v67;
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v67, v49, v52);
      unint64_t v58 = (*(unsigned __int8 *)(v56 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
      id v59 = (char *)swift_allocObject();
      *((void *)v59 + 2) = v55;
      *((void *)v59 + 3) = sub_21BD25694;
      *((void *)v59 + 4) = v73;
      *((void *)v59 + 5) = v54;
      v65(&v59[v58], (uint64_t)v57, v52);
      id v60 = v54;
      id v61 = v55;
      swift_retain();
      id v62 = v71;
      sub_21BEA9388();

      swift_release();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v64, v52);
      (*(void (**)(char *, uint64_t))(v72 + 8))(v62, v28);
    }
  }
  swift_release();
  _Block_release(a3);
}

void QueueControllerBehaviorPodcasts.loadAdditionalUpcomingItems(_:completion:)()
{
  OUTLINED_FUNCTION_34();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v80 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_21_0(v8);
  OUTLINED_FUNCTION_30_7();
  MEMORY[0x270FA5388](v9, v10, v11);
  id v77 = (char *)v74 - v12;
  uint64_t v13 = sub_21BEA9488();
  OUTLINED_FUNCTION_0_3();
  uint64_t v76 = v14;
  uint64_t v18 = MEMORY[0x270FA5388](v15, v16, v17);
  v74[1] = v19;
  uint64_t v75 = (char *)v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18, v20, v21);
  uint64_t v79 = (char *)v74 - v22;
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], v7);
  uint64_t v24 = OUTLINED_FUNCTION_21_0(v23);
  MEMORY[0x270FA5388](v24, v25, v26);
  OUTLINED_FUNCTION_46_5();
  v74[0] = v27;
  MEMORY[0x270FA5388](v28, v29, v30);
  uint64_t v32 = (char *)v74 - v31;
  uint64_t v33 = sub_21BEA94B8();
  OUTLINED_FUNCTION_0_3();
  uint64_t v82 = v34;
  MEMORY[0x270FA5388](v35, v36, v37);
  OUTLINED_FUNCTION_11();
  uint64_t v81 = v38;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_21BEA9B18();
  uint64_t v78 = __swift_project_value_buffer(v39, (uint64_t)qword_267C72D90);
  os_log_type_t v40 = sub_21BEA9B08();
  os_log_type_t v41 = sub_21BEAA6C8();
  if (os_log_type_enabled(v40, v41))
  {
    *(_DWORD *)OUTLINED_FUNCTION_47() = 134217984;
    uint64_t v83 = v6;
    sub_21BEAAA78();
    OUTLINED_FUNCTION_53_8(&dword_21BB87000, v40, v41, "􀣬 Load additional items: Count: %ld");
    OUTLINED_FUNCTION_2_0();
  }

  uint64_t v42 = (uint64_t)&v1[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest];
  OUTLINED_FUNCTION_2();
  sub_21BD23AF4();
  if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33) == 1)
  {
    sub_21BD23B5C((uint64_t)v32, (uint64_t)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    uint64_t v43 = (void *)sub_21BEA9B08();
    os_log_type_t v44 = sub_21BEAA6C8();
    if (OUTLINED_FUNCTION_11_25(v44))
    {
      uint64_t v45 = (_WORD *)OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_33_12(v45);
      OUTLINED_FUNCTION_8_25(&dword_21BB87000, v46, v47, "􀡓 Next request is empty");
      OUTLINED_FUNCTION_2_0();
    }

    uint64_t v48 = OUTLINED_FUNCTION_116();
    v49(v48);
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v50();
    OUTLINED_FUNCTION_2();
    uint64_t v51 = (uint64_t)v77;
    sub_21BD23AF4();
    if (__swift_getEnumTagSinglePayload(v51, 1, v13) == 1)
    {
      sub_21BD23B5C(v51, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
      uint64_t v52 = (void *)sub_21BEA9B08();
      os_log_type_t v53 = sub_21BEAA6C8();
      if (OUTLINED_FUNCTION_11_25(v53))
      {
        id v54 = (_WORD *)OUTLINED_FUNCTION_3_2();
        OUTLINED_FUNCTION_33_12(v54);
        OUTLINED_FUNCTION_8_25(&dword_21BB87000, v55, v56, "􀡓 No playback context found for next request. Skipping.");
        OUTLINED_FUNCTION_2_0();
      }

      uint64_t v57 = v74[0];
      __swift_storeEnumTagSinglePayload(v74[0], 1, 1, v33);
      swift_beginAccess();
      sub_21BD23BB0(v57, v42);
      swift_endAccess();
      uint64_t v58 = OUTLINED_FUNCTION_116();
      v59(v58);
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v81, v33);
    }
    else
    {
      uint64_t v60 = v76 + 32;
      id v61 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 32);
      uint64_t v62 = v13;
      v61(v79, v51, v13);
      uint64_t v63 = (void **)&v1[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host];
      OUTLINED_FUNCTION_2();
      id v64 = *v63;
      uint64_t v78 = v60;
      v74[0] = (uint64_t)v61;
      if (v64)
      {
        swift_unknownObjectRetain();
        uint64_t v65 = (void *)sub_21BEAA138();
        id v66 = objc_msgSend(v64, sel_beginEditWithReason_, v65, v74[0]);
        swift_unknownObjectRelease();
      }
      else
      {
        id v66 = 0;
      }
      uint64_t v67 = v76;
      (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v75, v79, v62);
      uint64_t v68 = (void *)swift_allocObject();
      uint64_t v69 = v80;
      v68[2] = v1;
      v68[3] = v69;
      v68[4] = v3;
      v68[5] = v66;
      OUTLINED_FUNCTION_35();
      v70();
      id v71 = v66;
      uint64_t v72 = v1;
      swift_retain();
      uint64_t v73 = v81;
      sub_21BEA9388();

      swift_release();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v79, v62);
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v73, v33);
    }
  }
  OUTLINED_FUNCTION_33();
}

uint64_t sub_21BD1D948(id *a1, uint64_t a2, void (*a3)(void *), uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v111 = a6;
  id v114 = a5;
  uint64_t v112 = a4;
  uint64_t v113 = a3;
  uint64_t v119 = a2;
  uint64_t v127 = a1;
  uint64_t v115 = sub_21BEA9488();
  uint64_t v125 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115, v6, v7);
  uint64_t v120 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8, v11, v12);
  uint64_t v14 = (char *)&v105 - v13;
  uint64_t v110 = sub_21BEA93B8();
  uint64_t v109 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110, v15, v16);
  uint64_t v108 = (char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_21BEA94F8();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18, v20, v21);
  uint64_t v23 = (char *)&v105 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], v9);
  MEMORY[0x270FA5388](v24 - 8, v25, v26);
  uint64_t v28 = (char *)&v105 - v27;
  uint64_t v29 = sub_21BEA9498();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v29, v31, v32);
  uint64_t v126 = (char *)&v105 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33, v35, v36);
  uint64_t v38 = (char *)&v105 - v37;
  sub_21BD25368();
  MEMORY[0x270FA5388](v39, v40, v41);
  uint64_t v43 = (char *)&v105 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD25414();
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v106 = v19;
    uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    uint64_t v107 = v18;
    v57(v23, v43, v18);
    sub_21BEA94C8();
    uint64_t v58 = v119 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest;
    swift_beginAccess();
    sub_21BD23BB0((uint64_t)v28, v58);
    swift_endAccess();
    uint64_t v59 = sub_21BEA94E8();
    unint64_t v60 = sub_21BD16184(v59, v111);
    swift_bridgeObjectRelease();
    uint64_t v105 = v23;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_21BEAAD88();
      uint64_t v61 = result;
    }
    else
    {
      uint64_t v61 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
    }
    uint64_t v63 = v115;
    if (!v61)
    {
LABEL_31:
      swift_bridgeObjectRelease();
      uint64_t v86 = v108;
      sub_21BEA93C8();
      uint64_t v87 = v109;
      unint64_t v88 = v60;
      uint64_t v89 = v110;
      int v90 = (*(uint64_t (**)(char *, uint64_t))(v109 + 88))(v86, v110);
      int v91 = *MEMORY[0x263F5E7F8];
      uint64_t v92 = v119;
      sub_21BD0D744(v88);
      uint64_t v94 = v93;
      swift_bridgeObjectRelease();
      if (v90 == v91)
      {
        uint64_t v95 = *(void *)(v92 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTailInsertionContentIdentifier);
        uint64_t v96 = *(void *)(v92
                        + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTailInsertionContentIdentifier
                        + 8);
        swift_bridgeObjectRetain();
        sub_21BD33C04(v94, v95, v96);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_21BD33B3C();
        swift_endAccess();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v87 + 8))(v86, v89);
      }
      id v102 = v114;
      uint64_t v103 = v107;
      uint64_t v104 = v106;
      v113(0);
      objc_msgSend(v102, sel_commit);
      return (*(uint64_t (**)(char *, uint64_t))(v104 + 8))(v105, v103);
    }
    if (v61 < 1)
    {
      __break(1u);
      return result;
    }
    id v64 = (uint8_t *)(v119 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_activePlaybackContext);
    uint64_t v126 = (char *)(v60 & 0xC000000000000001);
    uint64_t v127 = (id *)(v119 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
    swift_beginAccess();
    v124 = v64;
    swift_beginAccess();
    uint64_t v65 = 0;
    uint64_t v116 = (void (**)(char *, char *, uint64_t))(v125 + 16);
    int v117 = (void (**)(char *, uint64_t))(v125 + 8);
    uint64_t v123 = @"queue-item-add";
    uint64_t v122 = @"account-id";
    long long v121 = xmmword_21BEEB3A0;
    uint64_t v125 = v61;
    unint64_t v118 = v60;
    while (1)
    {
      if (v126) {
        id v66 = (id)MEMORY[0x21D49C490](v65, v60);
      }
      else {
        id v66 = *(id *)(v60 + 8 * v65 + 32);
      }
      uint64_t v67 = v66;
      if (!*v127) {
        goto LABEL_28;
      }
      id v68 = objc_msgSend(*v127, sel_eventStream);
      sub_21BD20A0C(0, (unint64_t *)&qword_26AAF3080, (uint64_t (*)(uint64_t))sub_21BC0BD80, MEMORY[0x263F8E0F8]);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v121;
      uint64_t v70 = v122;
      *(void *)(inited + 32) = v122;
      sub_21BD23AF4();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v63))
      {
        id v71 = v70;
        sub_21BD23B5C((uint64_t)v14, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
      }
      else
      {
        (*v116)(v120, v14, v63);
        uint64_t v73 = v70;
        sub_21BD23B5C((uint64_t)v14, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
        id v74 = objc_msgSend(self, sel_sharedManager);
        uint64_t v75 = (void *)sub_21BEA9398();
        if (v75
          && (uint64_t v76 = v75,
              id v77 = objc_msgSend(v75, sel_ams_DSID),
              v76,
              v77))
        {
          id v78 = objc_msgSend(v77, sel_stringValue);

          sub_21BEAA178();
          uint64_t v79 = sub_21BEAA138();
          uint64_t v63 = v115;
          swift_bridgeObjectRelease();
          id v80 = objc_msgSend(v74, sel_accountForDSID_, v79);

          id v74 = (id)v79;
        }
        else
        {
          id v80 = objc_msgSend(v74, sel_activeAccount, v105);
        }

        if (v80)
        {
          id v81 = objc_msgSend(v80, sel_hashedDSID);

          sub_21BEAA178();
          (*v117)(v120, v63);
          id v72 = (id)sub_21BEAA138();
          swift_bridgeObjectRelease();
          unint64_t v60 = v118;
          goto LABEL_24;
        }
        (*v117)(v120, v63);
        unint64_t v60 = v118;
      }
      id v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
LABEL_24:
      *(void *)(inited + 40) = v72;
      *(void *)(inited + 48) = @"queue-item-id";
      uint64_t v82 = @"queue-item-id";
      sub_21BD0BA70(v67);
      if (v83)
      {
        id v84 = (id)sub_21BEAA138();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v84 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      }
      *(void *)(inited + 56) = v84;
      type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
      sub_21BC330F8(0, (unint64_t *)&qword_26AAF2F10);
      sub_21BD25464((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
      uint64_t v85 = sub_21BEAA0C8();
      sub_21BCC8474((uint64_t)v123, v85, v68);

      uint64_t v61 = v125;
LABEL_28:
      ++v65;

      if (v61 == v65) {
        goto LABEL_31;
      }
    }
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v38, v43, v29);
  os_log_type_t v44 = v38;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_21BEA9B18();
  __swift_project_value_buffer(v45, (uint64_t)qword_267C72D90);
  uint64_t v46 = *(id **)(v30 + 16);
  uint64_t v47 = v126;
  uint64_t v125 = (uint64_t)v44;
  uint64_t v127 = v46;
  ((void (*)(char *, char *, uint64_t))v46)(v126, v44, v29);
  uint64_t v48 = sub_21BEA9B08();
  os_log_type_t v49 = sub_21BEAA6B8();
  uint64_t v50 = (uint64_t)v28;
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = (void *)swift_slowAlloc();
    v124 = v51;
    *(_DWORD *)uint64_t v51 = 138543362;
    uint64_t v123 = (__CFString *)(v51 + 4);
    sub_21BD25464(&qword_267C64BC0, MEMORY[0x263F5E848]);
    swift_allocError();
    ((void (*)(uint64_t, char *, uint64_t))v127)(v53, v47, v29);
    uint64_t v54 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v128 = v54;
    sub_21BEAAA78();
    *uint64_t v52 = v54;
    uint64_t v55 = *(void (**)(char *, uint64_t))(v30 + 8);
    v55(v47, v29);
    uint64_t v56 = v124;
    _os_log_impl(&dword_21BB87000, v48, v49, "􀡓 Got error from PML when loading upcoming items: , %{public}@", v124, 0xCu);
    sub_21BD247DC(0, &qword_26AAF38F0);
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v52, -1, -1);
    MEMORY[0x21D49EAD0](v56, -1, -1);
  }
  else
  {
    uint64_t v55 = *(void (**)(char *, uint64_t))(v30 + 8);
    v55(v47, v29);
  }

  uint64_t v97 = sub_21BEA94B8();
  __swift_storeEnumTagSinglePayload(v50, 1, 1, v97);
  uint64_t v98 = v119 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest;
  swift_beginAccess();
  sub_21BD23BB0(v50, v98);
  swift_endAccess();
  sub_21BD25464(&qword_267C64BC0, MEMORY[0x263F5E848]);
  uint64_t v99 = (void *)swift_allocError();
  uint64_t v100 = v125;
  ((void (*)(uint64_t, uint64_t, uint64_t))v127)(v101, v125, v29);
  v113(v99);

  objc_msgSend(v114, sel_rollback);
  return ((uint64_t (*)(uint64_t, uint64_t))v55)(v100, v29);
}

id sub_21BD1E8A8(uint64_t a1, void *a2)
{
  id v50 = a2;
  uint64_t v46 = a1;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_21BD20A0C(0, (unint64_t *)&unk_267C654B0, MEMORY[0x263F5E8A8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8, v5, v6);
  uint64_t v8 = (char *)&v44 - v7;
  uint64_t v9 = sub_21BEA93B8();
  uint64_t v45 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10, v11);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21BEA9488();
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v48 = v14;
  MEMORY[0x270FA5388](v14, v15, v16);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD20A0C(0, &qword_267C65420, MEMORY[0x263F5E878], v3);
  MEMORY[0x270FA5388](v19 - 8, v20, v21);
  uint64_t v23 = (char *)&v44 - v22;
  uint64_t v24 = sub_21BEA9648();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v24, v26, v27);
  uint64_t v30 = (char *)&v44 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28, v31, v32);
  uint64_t v34 = (char *)&v44 - v33;
  uint64_t v49 = v2;
  uint64_t v35 = (id *)(v2 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
  swift_beginAccess();
  if (!*v35 || (id v36 = objc_msgSend(*v35, sel_fallbackPlaybackIntent)) == 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 1, 1, v24);
    goto LABEL_7;
  }
  uint64_t v37 = v36;
  sub_21BD1ED8C((uint64_t)v23);

  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24) == 1)
  {
LABEL_7:
    sub_21BD23B5C((uint64_t)v23, (uint64_t)&qword_267C65420, MEMORY[0x263F5E878], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    return objc_msgSend(v50, sel_commit);
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v34, v23, v24);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v30, v34, v24);
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v13, *MEMORY[0x263F5E7E0], v9);
  if (v46)
  {
    sub_21BCB0B84();
  }
  else
  {
    uint64_t v39 = sub_21BEA96A8();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v39);
  }
  sub_21BEA9458();
  uint64_t v40 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v41 = swift_allocObject();
  id v42 = v50;
  *(void *)(v41 + 16) = v40;
  *(void *)(v41 + 24) = v42;
  id v43 = v42;
  swift_retain();
  sub_21BD139B8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v48);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v34, v24);
  return (id)swift_release();
}

uint64_t sub_21BD1ED8C@<X0>(uint64_t a1@<X8>)
{
  swift_getObjectType();
  if (objc_msgSend(v1, sel_tracklistToken)
    && (sub_21BC330F8(0, (unint64_t *)&qword_267C64900), (swift_dynamicCast() & 1) != 0))
  {
    sub_21BD10A78(a1);
    return sub_21BC65404(v9, v10);
  }
  else
  {
    if (qword_267C62778 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_21BEA9B18();
    __swift_project_value_buffer(v4, (uint64_t)qword_267C72D90);
    uint64_t v5 = sub_21BEA9B08();
    os_log_type_t v6 = sub_21BEAA6C8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_21BB87000, v5, v6, "No tracklist token set on MPC intent", v7, 2u);
      MEMORY[0x21D49EAD0](v7, -1, -1);
    }

    uint64_t v8 = sub_21BEA9648();
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v8);
  }
}

id sub_21BD1EF18(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = a3 + 16;
    swift_beginAccess();
    uint64_t v7 = MEMORY[0x21D49EBF0](v6);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      sub_21BD254F8((id)a1, 0);
      swift_retain();

      sub_21BD0D744(a1);
      sub_21BD33404(v9);
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    if (qword_267C62778 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_21BEA9B18();
    __swift_project_value_buffer(v19, (uint64_t)qword_267C72D90);
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_21BEA9B08();
    os_log_type_t v20 = sub_21BEAA6C8();
    if (os_log_type_enabled(v14, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 134217984;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_21BEAAD88();
        sub_21BD249C0((id)a1, 0);
      }
      else
      {
        uint64_t v22 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      sub_21BD249C0((id)a1, 0);
      uint64_t v24 = v22;
      sub_21BEAAA78();
      sub_21BD249C0((id)a1, 0);
      _os_log_impl(&dword_21BB87000, v14, v20, "End of queue reached. Loaded %ld new item(s) into the player.", v21, 0xCu);
      MEMORY[0x21D49EAD0](v21, -1, -1);
    }
    else
    {
      sub_21BD249C0((id)a1, 0);
      sub_21BD249C0((id)a1, 0);
    }
    goto LABEL_17;
  }
  id v10 = (id)a1;
  if (qword_267C62778 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_21BEA9B18();
  __swift_project_value_buffer(v11, (uint64_t)qword_267C72D90);
  id v12 = (id)a1;
  id v13 = (id)a1;
  uint64_t v14 = sub_21BEA9B08();
  os_log_type_t v15 = sub_21BEAA6B8();
  if (!os_log_type_enabled(v14, v15))
  {
    sub_21BD249C0((id)a1, 1);
    sub_21BD249C0((id)a1, 1);

LABEL_17:
    return objc_msgSend(a4, sel_commit, v24, v25);
  }
  uint64_t v16 = (uint8_t *)swift_slowAlloc();
  uint64_t v17 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v16 = 138412290;
  id v18 = (id)a1;
  uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
  sub_21BEAAA78();
  void *v17 = v25;
  sub_21BD249C0((id)a1, 1);
  sub_21BD249C0((id)a1, 1);
  _os_log_impl(&dword_21BB87000, v14, v15, "Unable to load fallback intent. %@", v16, 0xCu);
  sub_21BD247DC(0, &qword_26AAF38F0);
  swift_arrayDestroy();
  MEMORY[0x21D49EAD0](v17, -1, -1);
  MEMORY[0x21D49EAD0](v16, -1, -1);

  sub_21BD249C0((id)a1, 1);
  return objc_msgSend(a4, sel_commit, v24, v25);
}

Swift::Void __swiftcall QueueControllerBehaviorPodcasts.didReachEndOfQueue(withReason:)(Swift::String withReason)
{
  if ((sub_21BD17AE4() & 1) != 0 && !sub_21BD32D6C())
  {
    uint64_t v2 = (void *)sub_21BD32E28();
    uint64_t v7 = (void **)(v1 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
    OUTLINED_FUNCTION_2();
    uint64_t v8 = *v7;
    if (*v7)
    {
      swift_unknownObjectRetain();
      uint64_t v9 = (void *)OUTLINED_FUNCTION_51_8();
      id v6 = objc_msgSend(v8, sel_beginEditWithReason_, v9);
      swift_unknownObjectRelease();
    }
    else
    {
      id v6 = 0;
    }
    sub_21BD338AC();
    if (!sub_21BD32D6C())
    {
      objc_msgSend(v6, sel_commit);
      goto LABEL_13;
    }
  }
  else
  {
    if (sub_21BD32D6C()) {
      return;
    }
    uint64_t v2 = (void *)sub_21BD32E28();
    uint64_t v3 = (void **)(v1 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
    OUTLINED_FUNCTION_2();
    uint64_t v4 = *v3;
    if (*v3)
    {
      swift_unknownObjectRetain();
      uint64_t v5 = (void *)OUTLINED_FUNCTION_51_8();
      id v6 = objc_msgSend(v4, sel_beginEditWithReason_, v5);
      swift_unknownObjectRelease();
    }
    else
    {
      id v6 = 0;
    }
    sub_21BD32590(MEMORY[0x263F8EE78]);
  }
  uint64_t v10 = OUTLINED_FUNCTION_23_12();
  sub_21BD1E8A8(v10, v11);
LABEL_13:
}

id sub_21BD1F4F0()
{
  id v0 = objc_msgSend(self, sel_sharedManager);
  uint64_t v1 = (void *)sub_21BEA9398();
  if (v1 && (uint64_t v2 = v1, v3 = objc_msgSend(v1, sel_ams_DSID), v2, v3))
  {
    id v4 = objc_msgSend(v3, sel_stringValue);

    sub_21BEAA178();
    uint64_t v5 = sub_21BEAA138();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v0, sel_accountForDSID_, v5);

    id v0 = (id)v5;
  }
  else
  {
    id v6 = objc_msgSend(v0, sel_activeAccount);
  }

  return v6;
}

uint64_t QueueControllerBehaviorPodcasts.containsRestorableContent.getter()
{
  return 1;
}

void QueueControllerBehaviorPodcasts.finalizeStateRestoration(withTargetContentItemID:completion:)()
{
  OUTLINED_FUNCTION_34();
  uint64_t v51 = v2;
  uint64_t v52 = v3;
  uint64_t v4 = sub_21BEA93B8();
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8, v9);
  OUTLINED_FUNCTION_74_3();
  uint64_t v49 = sub_21BEA9488();
  OUTLINED_FUNCTION_0_3();
  uint64_t v11 = v10;
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v14, v15, v16);
  id v50 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17, v18, v19);
  uint64_t v22 = (char *)&v46 - v21;
  MEMORY[0x270FA5388](v20, v23, v24);
  uint64_t v26 = (char *)&v46 - v25;
  if (*(void *)(*(void *)&v0[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_queueRestorationSnapshot] + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = v26;
    sub_21BEA9418();
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v1, *MEMORY[0x263F5E7F8], v4);
    swift_bridgeObjectRetain();
    uint64_t v27 = v26;
    OUTLINED_FUNCTION_107();
    sub_21BEA9408();
  }
  uint64_t v48 = v0;
  uint64_t v28 = (void **)&v0[OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host];
  OUTLINED_FUNCTION_2();
  uint64_t v29 = *v28;
  if (*v28)
  {
    swift_unknownObjectRetain();
    uint64_t v30 = (void *)sub_21BEAA138();
    id v47 = objc_msgSend(v29, sel_beginEditWithReason_, v30);
    swift_unknownObjectRelease();
  }
  else
  {
    id v47 = 0;
  }
  uint64_t v31 = v11;
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v33 = v49;
  v32(v22, v27, v49);
  v32(v50, v27, v33);
  unint64_t v34 = (v13 + ((*(unsigned __int8 *)(v31 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = v48;
  *(void *)(v36 + 16) = v48;
  OUTLINED_FUNCTION_35();
  v38();
  uint64_t v39 = (void *)(v36 + v34);
  uint64_t v40 = v52;
  *uint64_t v39 = v51;
  v39[1] = v40;
  uint64_t v41 = v47;
  *(void *)(v36 + v35) = v47;
  id v42 = v41;
  id v43 = v37;
  swift_retain();
  sub_21BD139B8();

  swift_release();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v31 + 8);
  v44(v22, v33);
  uint64_t v45 = OUTLINED_FUNCTION_90();
  ((void (*)(uint64_t))v44)(v45);
  OUTLINED_FUNCTION_33();
}

void sub_21BD1F958(unint64_t a1, char a2, uint64_t a3, void *a4, void (*a5)(void), uint64_t a6, void *a7)
{
  id v90 = a7;
  id v89 = a4;
  uint64_t v95 = *MEMORY[0x263EF8340];
  uint64_t v12 = sub_21BEA9488();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12, v14, v15);
  uint64_t v18 = (char *)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16, v19, v20);
  uint64_t v22 = (char *)&v78 - v21;
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v23 - 8, v24, v25);
  uint64_t v27 = (char *)&v78 - v26;
  if ((a2 & 1) == 0)
  {
    swift_beginAccess();
    sub_21BD23AF4();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v12);
    uint64_t v82 = v22;
    if (EnumTagSinglePayload)
    {
      sub_21BD23B5C((uint64_t)v27, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v22, v27, v12);
      sub_21BD23B5C((uint64_t)v27, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
      sub_21BD1460C();
      uint64_t v32 = v31;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v12);
      if (v32)
      {
        uint64_t v29 = (void *)sub_21BEAA138();
        swift_bridgeObjectRelease();
LABEL_10:
        if (a1 >> 62)
        {
          swift_bridgeObjectRetain();
          if (sub_21BEAAD88())
          {
LABEL_12:
            sub_21BCD9EFC(0, (a1 & 0xC000000000000001) == 0, a1);
            if ((a1 & 0xC000000000000001) != 0) {
              id v34 = (id)MEMORY[0x21D49C490](0, a1);
            }
            else {
              id v34 = *(id *)(a1 + 32);
            }
            unint64_t v35 = v34;
            sub_21BD249C0((id)a1, 0);
            sub_21BC1F38C(v35, (SEL *)&selRef_queueSectionID);
            if (v36) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v33 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v33) {
            goto LABEL_12;
          }
        }
        sub_21BD249C0((id)a1, 0);
LABEL_18:
        swift_bridgeObjectRelease();
LABEL_19:
        uint64_t v83 = (id *)a1;
        uint64_t v84 = a6;
        uint64_t v85 = a5;
        id v88 = (id)sub_21BEAA138();
        swift_bridgeObjectRelease();
        if (qword_267C62778 != -1) {
          swift_once();
        }
        uint64_t v37 = sub_21BEA9B18();
        __swift_project_value_buffer(v37, (uint64_t)qword_267C72D90);
        uint64_t v38 = *(void (**)(char *, id, uint64_t))(v13 + 16);
        v38(v18, v89, v12);
        id v89 = v29;
        uint64_t v39 = sub_21BEA9B08();
        uint64_t v40 = v13;
        os_log_type_t v41 = sub_21BEAA6C8();
        BOOL v42 = os_log_type_enabled(v39, v41);
        uint64_t v87 = a3;
        uint64_t v86 = v29;
        if (v42)
        {
          os_log_t v79 = v39;
          id v43 = v18;
          uint64_t v81 = v40;
          uint64_t v44 = swift_slowAlloc();
          uint64_t v45 = (void *)swift_slowAlloc();
          uint64_t v80 = swift_slowAlloc();
          v91[0] = v80;
          *(_DWORD *)uint64_t v44 = 138412546;
          if (v29)
          {
            uint64_t v94 = (uint64_t)v89;
            id v46 = v89;
          }
          else
          {
            uint64_t v94 = 0;
          }
          sub_21BEAAA78();
          *uint64_t v45 = v86;
          id v48 = v89;

          *(_WORD *)(v44 + 12) = 2080;
          v38(v82, v43, v12);
          uint64_t v49 = sub_21BEAA1E8();
          uint64_t v94 = sub_21BCC7B5C(v49, v50, v91);
          sub_21BEAAA78();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v81 + 8))(v43, v12);
          os_log_t v51 = v79;
          _os_log_impl(&dword_21BB87000, v79, v41, "Restoring queue for %@ - context: %s", (uint8_t *)v44, 0x16u);
          sub_21BD247DC(0, &qword_26AAF38F0);
          swift_arrayDestroy();
          MEMORY[0x21D49EAD0](v45, -1, -1);
          uint64_t v52 = v80;
          swift_arrayDestroy();
          MEMORY[0x21D49EAD0](v52, -1, -1);
          MEMORY[0x21D49EAD0](v44, -1, -1);

          a3 = v87;
        }
        else
        {
          id v47 = v89;

          (*(void (**)(char *, uint64_t))(v40 + 8))(v18, v12);
        }
        uint64_t v53 = (id *)(a3 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_host);
        swift_beginAccess();
        unint64_t v54 = (unint64_t)v83;
        if (*v53)
        {
          id v55 = objc_msgSend(*v53, sel_eventStream);
          sub_21BD20A0C(0, (unint64_t *)&qword_26AAF3080, (uint64_t (*)(uint64_t))sub_21BC0BD80, MEMORY[0x263F8E0F8]);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_21BEEB3A0;
          *(void *)(inited + 32) = @"account-id";
          if (v86)
          {
            uint64_t v57 = @"account-id";
            id v58 = v89;
            id v59 = v89;
          }
          else
          {
            id v60 = objc_allocWithZone(MEMORY[0x263EFF9D0]);
            uint64_t v61 = @"account-id";
            id v59 = objc_msgSend(v60, sel_init);
            id v58 = v89;
          }
          *(void *)(inited + 40) = v59;
          *(void *)(inited + 48) = @"queue-section-id";
          id v62 = v88;
          *(void *)(inited + 56) = v88;
          type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
          sub_21BC330F8(0, (unint64_t *)&qword_26AAF2F10);
          sub_21BD25464((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
          id v63 = v58;
          id v64 = @"queue-section-id";
          id v65 = v62;
          uint64_t v66 = sub_21BEAA0C8();
          sub_21BCC8474(@"queue-add", v66, v55);

          a3 = v87;
        }
        sub_21BD0D744(v54);
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)(a3 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTailInsertionContentIdentifier);
        uint64_t v70 = *(void *)(a3
                        + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_restorationTailInsertionContentIdentifier
                        + 8);
        swift_bridgeObjectRetain();
        sub_21BD33C04(v68, v69, v70);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v85(0);
        uint64_t v71 = sub_21BD3301C();
        if (v72)
        {
          uint64_t v73 = v71;
          id v74 = v72;
          if (v90)
          {
            uint64_t v75 = (void *)sub_21BEAA138();
            objc_msgSend(v90, sel_setSuggestedContentItemIDForStart_, v75);
          }
          sub_21BD330BC(v73, v74, 1, (uint64_t)v91);
          swift_bridgeObjectRelease();
          uint64_t v76 = v92;
          if (v92)
          {
            uint64_t v77 = v93;
            __swift_project_boxed_opaque_existential_0Tm(v91, v92);
            (*(void (**)(uint64_t, uint64_t))(v77 + 56))(v76, v77);
            __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v91);
          }
          else
          {
            sub_21BCDADD4((uint64_t)v91);
          }
        }
        objc_msgSend(v90, sel_commit);

        return;
      }
    }
    uint64_t v29 = 0;
    goto LABEL_10;
  }
  uint64_t v30 = (id *)(id)a1;
  a5(a1);
  objc_msgSend(v90, sel_rollback);

  sub_21BD249C0((id)a1, 1);
}

Swift::Void __swiftcall QueueControllerBehaviorPodcasts.encode(with:)(NSCoder with)
{
  OUTLINED_FUNCTION_34();
  uint64_t v3 = v2;
  uint64_t v51 = sub_21BEA9358();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7, v8);
  OUTLINED_FUNCTION_49();
  unint64_t v11 = v10 - v9;
  sub_21BEA9128();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v12, v13, v14);
  OUTLINED_FUNCTION_74_3();
  sub_21BD0FA14();
  sub_21BD0D948(v15);
  swift_bridgeObjectRelease();
  sub_21BC0BE78(0, &qword_267C64A10);
  uint64_t v16 = (void *)sub_21BEAA2F8();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_21BEAA138();
  objc_msgSend(v3, sel_encodeObject_forKey_, v16, v17);

  uint64_t v47 = v1;
  id v46 = *(void **)(v1 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_managedQueue);
  unint64_t v18 = sub_21BD32920();
  unint64_t v19 = v18;
  if (!(v18 >> 62))
  {
    uint64_t v20 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v20) {
      goto LABEL_3;
    }
LABEL_18:
    OUTLINED_FUNCTION_106();
    if (qword_267C62778 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_21BEA9B18();
    unint64_t v35 = (void *)__swift_project_value_buffer(v34, (uint64_t)qword_267C72D90);
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_21BEA9B08();
    os_log_type_t v37 = sub_21BEAA6C8();
    if (OUTLINED_FUNCTION_11_25(v37))
    {
      *(_DWORD *)OUTLINED_FUNCTION_47() = 134217984;
      sub_21BEAAA78();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_53_8(&dword_21BB87000, v36, (os_log_type_t)v35, "􀋴 Encoding playback queue for restoration. Items archived: %ld");
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    sub_21BC0BB14();
    uint64_t v38 = (void *)sub_21BEAA2F8();
    swift_bridgeObjectRelease();
    uint64_t v39 = sub_21BEAA138();
    OUTLINED_FUNCTION_81_0(v39);

    uint64_t v40 = (unsigned __int8 *)(v47 + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_hasUserMutations);
    OUTLINED_FUNCTION_2();
    uint64_t v41 = *v40;
    BOOL v42 = (void *)OUTLINED_FUNCTION_114();
    objc_msgSend(v3, sel_encodeBool_forKey_, v41, v42);

    id v43 = v46;
    sub_21BD325F0();
    if (v44)
    {
      id v43 = v44;
      sub_21BEAA138();
      swift_bridgeObjectRelease();
    }
    uint64_t v45 = sub_21BEAA138();
    OUTLINED_FUNCTION_81_0(v45);
    swift_unknownObjectRelease();

    OUTLINED_FUNCTION_33();
    return;
  }
LABEL_17:
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_21BEAAD88();
  if (!v20) {
    goto LABEL_18;
  }
LABEL_3:
  unint64_t v49 = v11;
  unint64_t v50 = v19 & 0xC000000000000001;
  uint64_t v21 = (void (**)(unint64_t, char *, uint64_t))(v5 + 16);
  uint64_t v52 = (char *)MEMORY[0x263F8EE78];
  uint64_t v22 = 4;
  unint64_t v48 = v19;
  while (1)
  {
    uint64_t v5 = v20;
    if (v50) {
      uint64_t v23 = (char *)MEMORY[0x21D49C490](v22 - 4, v19);
    }
    else {
      uint64_t v23 = (char *)*(id *)(v19 + 8 * v22);
    }
    uint64_t v24 = v23;
    unint64_t v19 = v22 - 3;
    if (__OFADD__(v22 - 4, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    uint64_t v25 = &v23[OBJC_IVAR____MPCPodcastAVItem_internalItem];
    OUTLINED_FUNCTION_2();
    (*v21)(v49, v25, v51);
    sub_21BCBB040(v24, (SEL *)&selRef_contentItemID);
    if (!v26) {
      break;
    }
    sub_21BEA90F8();
    uint64_t v27 = sub_21BEA9118();
    uint64_t v28 = OUTLINED_FUNCTION_66_5();
    v29(v28);

    uint64_t v30 = v52;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v30 = sub_21BD21AA0(0, *((void *)v52 + 2) + 1, 1, (uint64_t)v52);
    }
    unint64_t v11 = *((void *)v30 + 2);
    unint64_t v31 = *((void *)v30 + 3);
    uint64_t v52 = v30;
    if (v11 >= v31 >> 1)
    {
      BOOL v33 = OUTLINED_FUNCTION_108(v31);
      uint64_t v52 = sub_21BD21AA0((char *)v33, v11 + 1, 1, (uint64_t)v30);
    }
    *((void *)v52 + 2) = v11 + 1;
    *(void *)&v52[8 * v11 + 32] = v27;
    ++v22;
    uint64_t v20 = v5;
    BOOL v32 = v19 == v5;
    unint64_t v19 = v48;
    if (v32) {
      goto LABEL_18;
    }
  }
  __break(1u);
}

void sub_21BD20A0C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_21BD20A70()
{
  unint64_t result = qword_267C65200;
  if (!qword_267C65200)
  {
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_267C65200);
  }
  return result;
}

uint64_t type metadata accessor for QueueControllerBehaviorPodcasts()
{
  uint64_t result = qword_26AAF3898;
  if (!qword_26AAF3898) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21BD20AF8()
{
}

void sub_21BD20B34()
{
  OUTLINED_FUNCTION_29_0();
  if (v2)
  {
    OUTLINED_FUNCTION_10_23();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_25_16();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v1)
  {
    sub_21BD25644(0, &qword_26AAEF9D0, (uint64_t)&type metadata for PlayerEvent, MEMORY[0x263F8E0F8]);
    uint64_t v5 = (const void *)OUTLINED_FUNCTION_61();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    OUTLINED_FUNCTION_30_14((uint64_t)(v6 - 32) / 72);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_60_4();
    sub_21BD2267C(v7, v8, v9);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_35_10();
    sub_21BD21CB4(v10, v11, v12, v13);
  }
}

void sub_21BD20C08()
{
}

void sub_21BD20C44()
{
  OUTLINED_FUNCTION_29_0();
  if (v2)
  {
    OUTLINED_FUNCTION_10_23();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_25_16();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v1)
  {
    sub_21BD20A0C(0, &qword_26AAF30A8, (uint64_t (*)(uint64_t))sub_21BD24718, MEMORY[0x263F8E0F8]);
    uint64_t v5 = (const void *)OUTLINED_FUNCTION_88_1();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    OUTLINED_FUNCTION_30_14((uint64_t)(v6 - 32) / 16);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_60_4();
    sub_21BD227D8(v7, v8, v9);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_35_10();
    sub_21BD21EA8(v10, v11, v12, v13);
  }
}

void sub_21BD20D20()
{
  OUTLINED_FUNCTION_29_0();
  if (v2)
  {
    OUTLINED_FUNCTION_10_23();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_25_16();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v1)
  {
    sub_21BD25644(0, (unint64_t *)&unk_26AAF3050, (uint64_t)&unk_26CBC8740, MEMORY[0x263F8E0F8]);
    uint64_t v5 = (const void *)OUTLINED_FUNCTION_61();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    OUTLINED_FUNCTION_30_14((uint64_t)(v6 - 32) / 40);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_60_4();
    sub_21BD22888(v7, v8, v9);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_35_10();
    sub_21BD21FBC(v10, v11, v12, v13);
  }
}

void sub_21BD20DF4()
{
  OUTLINED_FUNCTION_34_14();
  OUTLINED_FUNCTION_29_0();
  if (v4)
  {
    OUTLINED_FUNCTION_10_23();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_16();
      if (v5)
      {
        __break(1u);
        goto LABEL_18;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_44();
  if (v3)
  {
    sub_21BD20A0C(0, (unint64_t *)&unk_267C65458, (uint64_t (*)(uint64_t))sub_21BC73D78, MEMORY[0x263F8E0F8]);
    OUTLINED_FUNCTION_76_3();
    sub_21BC73D78();
    OUTLINED_FUNCTION_1_0(v7);
    uint64_t v9 = *(void *)(v8 + 72);
    uint64_t v10 = (const void *)OUTLINED_FUNCTION_17();
    _swift_stdlib_malloc_size(v10);
    if (v9)
    {
      OUTLINED_FUNCTION_42_8();
      BOOL v12 = v12 && v9 == -1;
      if (!v12)
      {
        OUTLINED_FUNCTION_30_14(v11 / v9);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_1_35();
      OUTLINED_FUNCTION_40_10();
LABEL_20:
      OUTLINED_FUNCTION_87();
      __break(1u);
      return;
    }
LABEL_18:
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_41_9();
    goto LABEL_20;
  }
LABEL_13:
  sub_21BC73D78();
  OUTLINED_FUNCTION_15(v13);
  OUTLINED_FUNCTION_49_6();
  if (v1)
  {
    sub_21BD22920(v0 + v17, v2, v16, (void (*)(void))sub_21BC73D78);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    OUTLINED_FUNCTION_52_7(v14, v15, v16);
  }
  OUTLINED_FUNCTION_32_13();
}

void sub_21BD20F8C()
{
  OUTLINED_FUNCTION_34_14();
  OUTLINED_FUNCTION_29_0();
  if (v4)
  {
    OUTLINED_FUNCTION_10_23();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_16();
      if (v5)
      {
        __break(1u);
        goto LABEL_18;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_44();
  if (v3)
  {
    sub_21BD20A0C(0, &qword_267C63E80, MEMORY[0x263F884F8], MEMORY[0x263F8E0F8]);
    OUTLINED_FUNCTION_76_3();
    uint64_t v7 = sub_21BEA8818();
    OUTLINED_FUNCTION_1_0(v7);
    uint64_t v9 = *(void *)(v8 + 72);
    uint64_t v10 = (const void *)OUTLINED_FUNCTION_17();
    _swift_stdlib_malloc_size(v10);
    if (v9)
    {
      OUTLINED_FUNCTION_42_8();
      BOOL v12 = v12 && v9 == -1;
      if (!v12)
      {
        OUTLINED_FUNCTION_30_14(v11 / v9);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_1_35();
      OUTLINED_FUNCTION_40_10();
LABEL_20:
      OUTLINED_FUNCTION_87();
      __break(1u);
      return;
    }
LABEL_18:
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_41_9();
    goto LABEL_20;
  }
LABEL_13:
  uint64_t v13 = sub_21BEA8818();
  OUTLINED_FUNCTION_15(v13);
  OUTLINED_FUNCTION_49_6();
  if (v1)
  {
    sub_21BD22920(v0 + v17, v2, v16, MEMORY[0x263F884F8]);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    OUTLINED_FUNCTION_52_7(v14, v15, v16);
  }
  OUTLINED_FUNCTION_32_13();
}

void sub_21BD21124()
{
}

void sub_21BD21160()
{
  OUTLINED_FUNCTION_115();
  if (v7)
  {
    OUTLINED_FUNCTION_10_23();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_25_16();
      if (v9)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  else
  {
    uint64_t v8 = v4;
  }
  uint64_t v11 = *(void *)(v0 + 16);
  if (v8 <= v11) {
    uint64_t v12 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v12 = v8;
  }
  if (v12)
  {
    sub_21BD25644(0, v5, v6, MEMORY[0x263F8E0F8]);
    uint64_t v13 = (void *)OUTLINED_FUNCTION_88_1();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 16);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = v13 + 4;
  if (v3)
  {
    v2(v0 + 32, v11, v15);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    v1(0, v11, v15, v0);
  }
}

void sub_21BD21250()
{
  OUTLINED_FUNCTION_34_14();
  OUTLINED_FUNCTION_29_0();
  if (v4)
  {
    OUTLINED_FUNCTION_10_23();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_16();
      if (v5)
      {
        __break(1u);
        goto LABEL_18;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_44();
  if (v3)
  {
    sub_21BD20A0C(0, (unint64_t *)&unk_267C65408, (uint64_t (*)(uint64_t))type metadata accessor for PodcastChapter, MEMORY[0x263F8E0F8]);
    OUTLINED_FUNCTION_76_3();
    uint64_t v7 = type metadata accessor for PodcastChapter();
    OUTLINED_FUNCTION_1_0(v7);
    uint64_t v9 = *(void *)(v8 + 72);
    char v10 = (const void *)OUTLINED_FUNCTION_17();
    _swift_stdlib_malloc_size(v10);
    if (v9)
    {
      OUTLINED_FUNCTION_42_8();
      BOOL v12 = v12 && v9 == -1;
      if (!v12)
      {
        OUTLINED_FUNCTION_30_14(v11 / v9);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_1_35();
      OUTLINED_FUNCTION_40_10();
LABEL_20:
      OUTLINED_FUNCTION_87();
      __break(1u);
      return;
    }
LABEL_18:
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_41_9();
    goto LABEL_20;
  }
LABEL_13:
  uint64_t v13 = type metadata accessor for PodcastChapter();
  OUTLINED_FUNCTION_15(v13);
  OUTLINED_FUNCTION_49_6();
  if (v1)
  {
    sub_21BD22920(v0 + v17, v2, v16, (void (*)(void))type metadata accessor for PodcastChapter);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    OUTLINED_FUNCTION_52_7(v14, v15, v16);
  }
  OUTLINED_FUNCTION_32_13();
}

void sub_21BD213E8()
{
  OUTLINED_FUNCTION_29_0();
  if (v2)
  {
    OUTLINED_FUNCTION_10_23();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_25_16();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v1)
  {
    sub_21BD25644(0, (unint64_t *)&qword_26AAF3910, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
    char v5 = (const void *)OUTLINED_FUNCTION_88_1();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    OUTLINED_FUNCTION_30_14((uint64_t)(v6 - 32) / 32);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_60_4();
    sub_21BD22A94(v7, v8, v9);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_35_10();
    sub_21BD222E4(v10, v11, v12, v13);
  }
}

void sub_21BD214BC()
{
  OUTLINED_FUNCTION_29_0();
  if (v2)
  {
    OUTLINED_FUNCTION_10_23();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_25_16();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v1)
  {
    sub_21BD2344C(0, &qword_267C65478, (uint64_t)&qword_267C64A20, (uint64_t)&protocol descriptor for PodcastsQueueItem, MEMORY[0x263F8E0F8]);
    char v5 = (const void *)OUTLINED_FUNCTION_61();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    OUTLINED_FUNCTION_30_14((uint64_t)(v6 - 32) / 40);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_60_4();
    sub_21BD22AF0(v7, v8, v9);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_35_10();
    sub_21BD223E0(v10, v11, v12, v13);
  }
}

void sub_21BD21598()
{
  OUTLINED_FUNCTION_34_14();
  OUTLINED_FUNCTION_29_0();
  if (v4)
  {
    OUTLINED_FUNCTION_10_23();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_16();
      if (v5)
      {
        __break(1u);
        goto LABEL_18;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_44();
  if (v3)
  {
    sub_21BD20A0C(0, &qword_26AAF3068, (uint64_t (*)(uint64_t))sub_21BCE7000, MEMORY[0x263F8E0F8]);
    OUTLINED_FUNCTION_76_3();
    sub_21BCE7000();
    OUTLINED_FUNCTION_1_0(v7);
    uint64_t v9 = *(void *)(v8 + 72);
    uint64_t v10 = (const void *)OUTLINED_FUNCTION_17();
    _swift_stdlib_malloc_size(v10);
    if (v9)
    {
      OUTLINED_FUNCTION_42_8();
      BOOL v12 = v12 && v9 == -1;
      if (!v12)
      {
        OUTLINED_FUNCTION_30_14(v11 / v9);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_1_35();
      OUTLINED_FUNCTION_40_10();
LABEL_20:
      OUTLINED_FUNCTION_87();
      __break(1u);
      return;
    }
LABEL_18:
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_41_9();
    goto LABEL_20;
  }
LABEL_13:
  sub_21BCE7000();
  OUTLINED_FUNCTION_15(v13);
  OUTLINED_FUNCTION_49_6();
  if (v1)
  {
    sub_21BD22920(v0 + v17, v2, v16, (void (*)(void))sub_21BCE7000);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    OUTLINED_FUNCTION_52_7(v14, v15, v16);
  }
  OUTLINED_FUNCTION_32_13();
}

uint64_t sub_21BD21730(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_21BD20A0C(0, &qword_267C654C8, MEMORY[0x263F5E768], MEMORY[0x263F8E0F8]);
  uint64_t v10 = *(void *)(sub_21BEA9128() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_21BEAAD58();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_21BEA9128() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_21BD22920(a4 + v17, v8, v18, MEMORY[0x263F5E768]);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21BD220BC(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

void sub_21BD219B0()
{
  OUTLINED_FUNCTION_115();
  if (v7)
  {
    OUTLINED_FUNCTION_10_23();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_25_16();
      if (v9)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  else
  {
    uint64_t v8 = v4;
  }
  uint64_t v11 = *(void *)(v0 + 16);
  if (v8 <= v11) {
    uint64_t v12 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v12 = v8;
  }
  if (v12)
  {
    sub_21BD25644(0, v5, v6, MEMORY[0x263F8E0F8]);
    uint64_t v13 = (void *)OUTLINED_FUNCTION_88_1();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 8);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  BOOL v15 = v13 + 4;
  if (v3)
  {
    v2(v0 + 32, v11, v15);
    OUTLINED_FUNCTION_24_17();
  }
  else
  {
    v1(0, v11, v15, v0);
  }
}

char *sub_21BD21AA0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_21BD20A0C(0, &qword_267C65480, (uint64_t (*)(uint64_t))sub_21BC0BB14, MEMORY[0x263F8E0F8]);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_21BD22B54((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21BD2250C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_21BD21BBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

uint64_t sub_21BD21CB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 72 * a1 + 32;
    unint64_t v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

char *sub_21BD21DB4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    unint64_t v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_21BEAADD8();
  __break(1u);
  return result;
}

uint64_t sub_21BD21EA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_21BD2482C();
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

uint64_t sub_21BD21FBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

uint64_t sub_21BD220BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
    goto LABEL_11;
  }
  uint64_t v8 = OUTLINED_FUNCTION_76_3();
  uint64_t v10 = *(void *)(v9(v8) - 8);
  uint64_t v11 = a4 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  uint64_t v12 = *(void *)(v10 + 72);
  unint64_t v13 = v11 + v12 * v4;
  unint64_t v14 = a3 + v12 * v5;
  if (v13 >= v14 || v13 + v12 * v5 <= a3)
  {
    swift_arrayInitWithCopy();
    swift_bridgeObjectRelease();
    return v14;
  }
  OUTLINED_FUNCTION_1_35();
  OUTLINED_FUNCTION_13_22();
LABEL_11:
  uint64_t result = OUTLINED_FUNCTION_12_25();
  __break(1u);
  return result;
}

uint64_t sub_21BD221EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

uint64_t sub_21BD222E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

uint64_t sub_21BD223E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_21BC1FB08(0, (unint64_t *)&qword_267C64A20);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

uint64_t sub_21BD2250C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_21BC0BB14();
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21BEAADD8();
  __break(1u);
  return result;
}

char *sub_21BD22620(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    uint64_t result = (char *)OUTLINED_FUNCTION_5_25();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_4_31(a3, result);
  }
  return result;
}

char *sub_21BD2267C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21BEAADD8();
    __break(1u);
  }
  else if (__dst != __src || &__src[72 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 72 * a2);
  }
  return __src;
}

char *sub_21BD22718(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    uint64_t result = (char *)OUTLINED_FUNCTION_5_25();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_4_31(a3, result);
  }
  return result;
}

char *sub_21BD22774(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    uint64_t result = (char *)OUTLINED_FUNCTION_5_25();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_4_31(a3, result);
  }
  return result;
}

char *sub_21BD227D8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21BEAADD8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_21BD22870(uint64_t a1, uint64_t a2, unint64_t a3)
{
}

char *sub_21BD22888(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21BEAADD8();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

void sub_21BD22920(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_5_25();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_110();
    if (v9 < v8 || (a4(0), OUTLINED_FUNCTION_24(), v5 + *(void *)(v10 + 72) * v4 <= a3))
    {
      a4(0);
      OUTLINED_FUNCTION_92_0();
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a3 != v5)
    {
      OUTLINED_FUNCTION_92_0();
      swift_arrayInitWithTakeBackToFront();
    }
  }
}

char *sub_21BD22A18(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    uint64_t result = (char *)OUTLINED_FUNCTION_5_25();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_4_31(a3, result);
  }
  return result;
}

void sub_21BD22A7C(uint64_t a1, uint64_t a2, unint64_t a3)
{
}

char *sub_21BD22A94(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    uint64_t result = (char *)OUTLINED_FUNCTION_5_25();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_4_31(a3, result);
  }
  return result;
}

char *sub_21BD22AF0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    uint64_t result = (char *)OUTLINED_FUNCTION_5_25();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_4_31(a3, result);
  }
  return result;
}

char *sub_21BD22B54(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21BEAADD8();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

void sub_21BD22BE8(uint64_t a1, uint64_t a2, unint64_t a3)
{
}

uint64_t sub_21BD22C00(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

void *sub_21BD22CB0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = (void *)OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  if (&__dst[8 * a2] > __src && &__src[8 * a2] > __dst)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }

  return memcpy(__dst, __src, 8 * a2);
}

void *sub_21BD22D5C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = (void *)OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  if (&__dst[48 * a2] > __src && &__src[48 * a2] > __dst)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }

  return memcpy(__dst, __src, 48 * a2);
}

uint64_t sub_21BD22E0C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_48_9();
  if (v4 + 16 * v3 > v2 && v2 + 16 * v3 > v4)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }
  sub_21BD25644(0, (unint64_t *)&unk_26AAEF8C0, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_26_13();

  return swift_arrayInitWithCopy();
}

uint64_t sub_21BD22EEC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_21BD23284(a1, a2, a3);
}

uint64_t sub_21BD22F04(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_21BEAADD8();
    __break(1u);
  }
  else
  {
    sub_21BC330F8(0, (unint64_t *)&qword_26AAF1430);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21BD23010(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_48_9();
  if (v4 + 24 * v3 > v2 && v2 + 24 * v3 > v4)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }
  sub_21BC38934();
  OUTLINED_FUNCTION_26_13();

  return swift_arrayInitWithCopy();
}

uint64_t sub_21BD230D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_21BD23284(a1, a2, a3);
}

uint64_t sub_21BD230E8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  if (a3 + 32 * a2 > a1 && a1 + 32 * a2 > a3)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

uint64_t sub_21BD2319C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_48_9();
  if (v4 + 40 * v3 > v2 && v2 + 40 * v3 > v4)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }
  sub_21BC1FB08(0, (unint64_t *)&qword_267C64A20);
  OUTLINED_FUNCTION_26_13();

  return swift_arrayInitWithCopy();
}

uint64_t sub_21BD2326C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_21BD23284(a1, a2, a3);
}

uint64_t sub_21BD23284(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_14_22();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_12_25();
    __break(1u);
    return result;
  }
  uint64_t v6 = OUTLINED_FUNCTION_109();
  v7(v6);
  OUTLINED_FUNCTION_24();
  uint64_t v9 = *(void *)(v8 + 72) * a2;
  unint64_t v10 = a3 + v9;
  unint64_t v11 = v3 + v9;
  if (v10 > v3 && v11 > a3)
  {
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_13_22();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_26_13();

  return swift_arrayInitWithCopy();
}

uint64_t sub_21BD2335C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a1 + 4;
  uint64_t result = sub_21BEAAA78();
  *a1 = v5;
  return result;
}

uint64_t sub_21BD233BC(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_21BEAAA78();
  *a1 = v5;
  return result;
}

uint64_t sub_21BD2341C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void sub_21BD2344C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = OUTLINED_FUNCTION_48_1();
    uint64_t v10 = sub_21BC1FB08(v8, v9);
    unint64_t v11 = a5(a1, v10);
    if (!v12) {
      atomic_store(v11, v5);
    }
  }
}

void sub_21BD234A8()
{
  if (!qword_26AAF0060)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26AAF0060);
    }
  }
}

void sub_21BD23508(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      sub_21BD25644(0, (unint64_t *)&unk_26AAF30B0, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = (2 * ((uint64_t)(v9 - 32) / 8)) | 1;
    }
    if (v4 != a3)
    {
      sub_21BD22F04(a2 + 8 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

void *sub_21BD235F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_21BD25644(0, &qword_26AAF3060, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  unint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_21BD24A3C((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21BC1FC74();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_21BD236F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  sub_21BD25644(0, (unint64_t *)&qword_26AAF3910, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 32);
  uint64_t v5 = sub_21BD24C3C(&v7, (_OWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_21BC1FC74();
  if (v5 != (_OWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_21BD237FC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 > 0)
    {
      sub_21BD2344C(0, &qword_267C65478, (uint64_t)&qword_267C64A20, (uint64_t)&protocol descriptor for PodcastsQueueItem, MEMORY[0x263F8E0F8]);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 40);
    }
    if (v4 != a3)
    {
      sub_21BD2319C(a2 + 40 * a3, v5);
      return;
    }
    goto LABEL_9;
  }
}

void sub_21BD238E8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      sub_21BD25644(0, &qword_26AAF3060, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_21BD22C00(a2 + 16 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_21BD239C8(void *a1)
{
  return sub_21BCBB040(a1, (SEL *)&selRef_mainTitle);
}

uint64_t sub_21BD239D4(void *a1)
{
  return sub_21BCBB040(a1, (SEL *)&selRef_contentItemID);
}

uint64_t sub_21BD239E0(void *a1)
{
  return sub_21BC1F38C(a1, (SEL *)&selRef_queueSectionID);
}

uint64_t sub_21BD239EC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_trackIdentifiers);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_21BEAA308();

  return v3;
}

uint64_t sub_21BD23A44(void *a1)
{
  id v2 = objc_msgSend(a1, sel_userInfo);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_21BEAA0A8();

  return v3;
}

uint64_t sub_21BD23ABC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21BD23AF4()
{
  OUTLINED_FUNCTION_110();
  sub_21BD20A0C(0, v1, v2, MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_98();
  v4(v3);
  return v0;
}

uint64_t sub_21BD23B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5(0);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21_1();
  v6();
  return a1;
}

uint64_t sub_21BD23BB0(uint64_t a1, uint64_t a2)
{
  sub_21BD20A0C(0, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD23C4C()
{
  sub_21BEA9488();
  OUTLINED_FUNCTION_0_3();
  unint64_t v3 = (((*(void *)(v2 + 64)
        + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;

  OUTLINED_FUNCTION_47_8();
  v4();
  swift_release();

  OUTLINED_FUNCTION_85_1();

  return MEMORY[0x270FA0238](v5, v6, v7);
}

void sub_21BD23D14(unint64_t a1, char a2)
{
  char v4 = a2 & 1;
  uint64_t v5 = sub_21BEA9488();
  OUTLINED_FUNCTION_1_0(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v11 = (*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = *(void *)(v2 + 16);
  unint64_t v13 = *(void (**)(void))(v2 + v11);
  uint64_t v14 = *(void *)(v2 + v11 + 8);
  BOOL v15 = *(void **)(v2 + ((v11 + 23) & 0xFFFFFFFFFFFFFFF8));

  sub_21BD1F958(a1, v4, v12, (void *)(v2 + v10), v13, v14, v15);
}

uint64_t sub_21BD23DB0()
{
  OUTLINED_FUNCTION_112();
  uint64_t result = sub_21BD0DDDC();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_21BD23DDC(char *a1)
{
  return sub_21BD0DE44(*a1);
}

uint64_t sub_21BD23E04()
{
  OUTLINED_FUNCTION_112();
  uint64_t result = sub_21BD0DEF0();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_21BD23E30(char *a1)
{
  return sub_21BD0DF58(*a1);
}

uint64_t sub_21BD23E58()
{
  OUTLINED_FUNCTION_112();
  uint64_t result = sub_21BD0E028();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_21BD23E84()
{
  OUTLINED_FUNCTION_112();
  uint64_t result = sub_21BD0E1F0();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_21BD23EB0()
{
  return type metadata accessor for QueueControllerBehaviorPodcasts();
}

void sub_21BD23EB8()
{
  sub_21BD20A0C(319, (unint64_t *)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F)
  {
    sub_21BD20A0C(319, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for QueueControllerBehaviorPodcasts(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QueueControllerBehaviorPodcasts);
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.hasUserMutations.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.hasUserMutations.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.hasUserMutations.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.allowsQueueModifications.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.allowsQueueModifications.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.allowsQueueModifications.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.sessionID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.sessionID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.sessionID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.host.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.host.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.host.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 416))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.__allocating_init(sessionID:)()
{
  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.connect(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.disconnect(from:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.playbackPositionRestorationPolicy.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.queueTrackIdentifiers.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.canReuse(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.performLoadCommand(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.activeItemFlagsDidChange(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.components(forContentItemID:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.itemExists(forContentItemID:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.canJump(toContentItemID:reason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.canPreviousItem(fromContentItemID:reason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.canNextItem(fromContentItemID:reason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.isEmpty.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.contentItemIDEnumeratorStarting(afterContentItemID:mode:options:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts._stateDictionary(includingQueue:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts.currentItemDidChange(fromContentItemID:toContentItemID:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of QueueControllerBehaviorPodcasts._item(forContentItemID:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

unint64_t sub_21BD24718()
{
  unint64_t result = qword_26AAF30E0;
  if (!qword_26AAF30E0)
  {
    sub_21BD247DC(255, &qword_26AAF1438);
    sub_21BD2344C(255, &qword_26AAF30C8, (uint64_t)&qword_26AAF30C0, MEMORY[0x263F8E4D8], MEMORY[0x263F8D8F0]);
    unint64_t result = swift_getFunctionTypeMetadata2();
    atomic_store(result, (unint64_t *)&qword_26AAF30E0);
  }
  return result;
}

void sub_21BD247DC(uint64_t a1, void *a2)
{
  if (!*a2)
  {
    uint64_t v3 = OUTLINED_FUNCTION_48_1();
    v4(v3);
    unint64_t v5 = sub_21BEAAA68();
    if (!v6) {
      atomic_store(v5, v2);
    }
  }
}

unint64_t sub_21BD2482C()
{
  unint64_t result = qword_26AAF30E8;
  if (!qword_26AAF30E8)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_26AAF30E8);
  }
  return result;
}

uint64_t sub_21BD24870()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21BD248A8(uint64_t a1)
{
  sub_21BD177B0(a1, *(void *)(v1 + 16));
}

uint64_t objectdestroy_3Tm()
{
  sub_21BEA9488();
  OUTLINED_FUNCTION_0_3();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 48) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  swift_release();
  OUTLINED_FUNCTION_47_8();
  v8();

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_21BD24960(id *a1)
{
  uint64_t v3 = sub_21BEA9488();
  OUTLINED_FUNCTION_15(v3);
  uint64_t v5 = v1[2];
  uint64_t v6 = (void (*)(void *))v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (void *)v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_21BD1D948(a1, v5, v6, v7, v8, v9);
}

void sub_21BD249C0(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21BD249CC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_items);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_21BC0BE78(0, (unint64_t *)&unk_26AAEF930);
  uint64_t v3 = sub_21BEAA308();

  return v3;
}

uint64_t sub_21BD24A3C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *unint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    unint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

_OWORD *sub_21BD24C3C(_OWORD *result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
LABEL_36:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_OWORD *)v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
LABEL_33:
    uint64_t v13 = a3;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_23:
    ++v13;
    sub_21BC1E7C4(*(void *)(a4 + 56) + 32 * v16, (uint64_t)v20);
    sub_21BC1DDD0(v20, v21);
    unint64_t result = sub_21BC1DDD0(v21, v11);
    v11 += 2;
    if (v13 == a3) {
      goto LABEL_33;
    }
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v14) {
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v17);
  if (v18)
  {
LABEL_22:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
    goto LABEL_23;
  }
  int64_t v19 = v12 + 2;
  ++v12;
  if (v17 + 1 >= v14) {
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_15;
  }
  int64_t v12 = v17 + 1;
  if (v17 + 2 >= v14) {
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 2));
  if (v18)
  {
    v17 += 2;
    goto LABEL_22;
  }
  int64_t v12 = v17 + 2;
  if (v17 + 3 >= v14) {
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 3));
  if (v18)
  {
    v17 += 3;
    goto LABEL_22;
  }
  int64_t v19 = v17 + 4;
  int64_t v12 = v17 + 3;
  if (v17 + 4 >= v14)
  {
LABEL_35:
    unint64_t v9 = 0;
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_15:
    int64_t v17 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_35;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_21BD24E3C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_21BC32CE8(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_21BD24ED4(uint64_t a1, uint64_t a2)
{
  sub_21BD20A0C(0, &qword_26AAF3678, MEMORY[0x263F5E810], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD24F6C(uint64_t a1, char a2)
{
  return sub_21BD2562C(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_21BD170D0);
}

void sub_21BD24F84(char a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  sub_21BD16C94(a1, a2, a3, a4, a5, a6, *(void *)(v6 + 16));
}

uint64_t sub_21BD24F90(uint64_t a1, char a2)
{
  return sub_21BD2562C(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_21BD16AE0);
}

void sub_21BD24FA8()
{
  if (!qword_267C65448)
  {
    uint64_t v0 = MEMORY[0x263F78680];
    sub_21BD25644(255, (unint64_t *)&unk_267C63570, MEMORY[0x263F78680], MEMORY[0x263F8D8F0]);
    sub_21BD25644(255, &qword_267C63D70, v0, MEMORY[0x263F8D488]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v2) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267C65448);
    }
  }
}

uint64_t sub_21BD2506C()
{
  sub_21BEA9488();
  OUTLINED_FUNCTION_24();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_21_1();
  v5();

  swift_release();

  return MEMORY[0x270FA0238](v0, ((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v3);
}

void sub_21BD25120(uint64_t a1)
{
  uint64_t v3 = sub_21BEA9488();
  OUTLINED_FUNCTION_1_0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = v1 + v8;
  uint64_t v11 = *(void *)(v1 + v9);
  uint64_t v12 = v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = *(void (**)(void *, uint64_t))v12;
  uint64_t v14 = *(char **)(v12 + 8);

  sub_21BD13AFC(a1, v10, v11, v13, v14);
}

void sub_21BD251A8()
{
  if (!qword_267C65488)
  {
    sub_21BEA9488();
    sub_21BC1FB08(255, (unint64_t *)&qword_26AAF30C0);
    unint64_t v0 = sub_21BEAB008();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C65488);
    }
  }
}

uint64_t sub_21BD25228()
{
  sub_21BEA9488();
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = v0;
  swift_release();
  swift_release();
  uint64_t v2 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_47_8();
  v2();
  OUTLINED_FUNCTION_47_8();
  v2();
  OUTLINED_FUNCTION_85_1();

  return MEMORY[0x270FA0238](v3, v4, v5);
}

void sub_21BD252E8(void *a1)
{
  uint64_t v3 = sub_21BEA9488();
  OUTLINED_FUNCTION_1_0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = (v8 + 40) & ~v8;
  uint64_t v10 = (void (**)(void, void))v1[2];
  uint64_t v11 = (void (*)(void *, uint64_t))v1[3];
  uint64_t v12 = v1[4];
  uint64_t v13 = (uint64_t)v1 + ((*(void *)(v7 + 64) + v8 + v9) & ~v8);

  sub_21BD14680(a1, v10, v11, v12, (uint64_t)v1 + v9, v13);
}

void sub_21BD25368()
{
  if (!qword_267C654A0)
  {
    sub_21BEA94F8();
    sub_21BEA9498();
    sub_21BD25464(&qword_267C64BC0, MEMORY[0x263F5E848]);
    unint64_t v0 = sub_21BEAB008();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C654A0);
    }
  }
}

uint64_t sub_21BD25414()
{
  OUTLINED_FUNCTION_110();
  v1(0);
  OUTLINED_FUNCTION_24();
  uint64_t v2 = OUTLINED_FUNCTION_98();
  v3(v2);
  return v0;
}

uint64_t sub_21BD25464(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21BD254AC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_21BD254EC(unint64_t a1, char a2)
{
  return sub_21BD1EF18(a1, a2 & 1, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

id sub_21BD254F8(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t objectdestroy_53Tm()
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_21BD25558(unint64_t a1, char a2)
{
  sub_21BD1A530(a1, a2 & 1, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void (**)(void *))(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64));
}

unint64_t sub_21BD25590()
{
  unint64_t result = qword_267C654C0;
  if (!qword_267C654C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C654C0);
  }
  return result;
}

uint64_t objectdestroy_60Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21BD2562C(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, void, void, void, void, void))
{
  return a3(a1, a2 & 1, v3[2], v3[3], v3[4], v3[5]);
}

void sub_21BD25644(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_69_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_76_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_77_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_80_1()
{
  return swift_bridgeObjectRetain_n();
}

id OUTLINED_FUNCTION_81_0(uint64_t a1)
{
  return objc_msgSend(v2, (SEL)(v3 + 2501), v1, a1);
}

BOOL OUTLINED_FUNCTION_83_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_21BEAAD58();
}

uint64_t OUTLINED_FUNCTION_92_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_95_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_98()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_100()
{
  return v0;
}

void OUTLINED_FUNCTION_101(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_104(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_105(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_106()
{
  return swift_bridgeObjectRelease_n();
}

BOOL OUTLINED_FUNCTION_108@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_109()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_113()
{
  return sub_21BEAA138();
}

uint64_t OUTLINED_FUNCTION_114()
{
  return sub_21BEAA138();
}

uint64_t getEnumTagSinglePayload for PauseReason(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF4 && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483637);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 10;
  if (v4 >= 0xC) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PauseReason(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF5)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483637;
    if (a3 >= 0x7FFFFFF5) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF5) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 10;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PauseReason()
{
  return &type metadata for PauseReason;
}

unint64_t sub_21BD25A2C(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      unint64_t result = 1919251317;
      break;
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 4:
      unint64_t result = 0x6863206574756F72;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
      unint64_t result = 0xD000000000000016;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 10:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 0x726F727265;
      break;
  }
  return result;
}

BOOL sub_21BD25BB0(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0:
      return !a2;
    case 1:
      return a2 == 1;
    case 2:
      return a2 == 2;
    case 3:
      return a2 == 3;
    case 4:
      return a2 == 4;
    case 5:
      return a2 == 5;
    case 6:
      return a2 == 6;
    case 7:
      return a2 == 7;
    case 8:
      return a2 == 8;
    case 9:
      return a2 == 9;
    case 10:
      return a2 == 10;
    default:
      return a2 >= 0xB;
  }
}

unint64_t sub_21BD25C9C()
{
  return sub_21BD25A2C(*v0);
}

BOOL sub_21BD25CA4(uint64_t *a1, unint64_t *a2)
{
  return sub_21BD25BB0(*a1, *a2);
}

uint64_t sub_21BD25CB0(char a1, char a2)
{
  __dst[1] = 0xE000000000000000;
  sub_21BEAAC48();
  v5[23] = 0;
  v5[24] = 0xE000000000000000;
  OUTLINED_FUNCTION_30_8();
  sub_21BEAA238();
  swift_bridgeObjectRelease();
  sub_21BEAA238();
  __dst[0] = (unsigned __int16)sub_21BC53274();
  sub_21BEAAD08();
  sub_21BEAA238();
  v5[0] = 0;
  v5[1] = 0xE000000000000000;
  sub_21BC9EB70((uint64_t)v5);
  sub_21BC02A04(v5, __dst);
  sub_21BD022A8(__dst);
  swift_bridgeObjectRelease();
  return sub_21BC83D90(a1, a2);
}

uint64_t sub_21BD25E0C()
{
  __src[0] = 0xD00000000000001DLL;
  __src[1] = 0x800000021BECCDE0;
  sub_21BC9EB70((uint64_t)__src);
  sub_21BC02A04(__src, v1);
  sub_21BD022A8(v1);
  return sub_21BC83D90(0, 0);
}

uint64_t sub_21BD25E88(unint64_t a1)
{
  if (a1 <= 1) {
    return sub_21BC84118();
  }
  uint64_t result = sub_21BEAAEB8();
  __break(1u);
  return result;
}

void sub_21BD25EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  if (sub_21BC80C9C())
  {
    OUTLINED_FUNCTION_1_36();
    sub_21BEAAC48();
    OUTLINED_FUNCTION_18_24();
    OUTLINED_FUNCTION_5();
    sub_21BC6719C();
    sub_21BEAAD08();
    sub_21BEAA238();
    OUTLINED_FUNCTION_2_35();
    *(void *)__src = v48;
    uint64_t v26 = v49;
    int v7 = sub_21BC9EB70((uint64_t)__src);
    OUTLINED_FUNCTION_9_27(v7, v8, v9, v10, v11, v12, v13, v14, v24, __src[0], v26, v27, v28, v29, v30, v31, v32, v33, v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41,
      v42,
      v43,
      v44,
      v45,
      v46,
      v47,
      v48);
    sub_21BD022A8(&v48);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_24();
  }
  else
  {
    OUTLINED_FUNCTION_1_36();
    sub_21BEAAC48();
    OUTLINED_FUNCTION_18_24();
    OUTLINED_FUNCTION_5();
    sub_21BC6719C();
    sub_21BEAAD08();
    sub_21BEAA238();
    OUTLINED_FUNCTION_2_35();
    *(void *)__src = v48;
    uint64_t v26 = v49;
    int v15 = sub_21BC9EB70((uint64_t)__src);
    OUTLINED_FUNCTION_9_27(v15, v16, v17, v18, v19, v20, v21, v22, a1, __src[0], v26, v27, v28, v29, v30, v31, v32, v33, v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41,
      v42,
      v43,
      v44,
      v45,
      v46,
      v47,
      v48);
    sub_21BD022A8(&v48);
    swift_bridgeObjectRelease();
    if (a5)
    {
      if (qword_26AAEFBE0 != -1) {
        swift_once();
      }
      uint64_t v23 = OUTLINED_FUNCTION_15_24();
      a5(v23);
    }
  }
}

void sub_21BD260F4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, float a5)
{
  uint64_t v11 = *(void *)(v5 + 40);
  if (sub_21BC80C9C())
  {
    if ((sub_21BC82088() & 1) == 0)
    {
      uint64_t v33 = *(void **)(v11 + 32);
      if (v33)
      {
        if (objc_msgSend((id)swift_unknownObjectRetain(), sel_isAlwaysLive)
          && objc_msgSend(v33, sel_isAssetLoaded)
          && (id v34 = objc_msgSend(v33, sel_avPlayerItem)) != 0)
        {
          uint64_t v35 = v34;
          if (sub_21BCD71F0())
          {
            OUTLINED_FUNCTION_1_36();
            sub_21BEAAC48();
            OUTLINED_FUNCTION_17_24();
            OUTLINED_FUNCTION_5();
            OUTLINED_FUNCTION_2_35();
            *(void *)__src = *(void *)__dst;
            uint64_t v65 = v88;
            int v36 = sub_21BC9EB70((uint64_t)__src);
            OUTLINED_FUNCTION_9_27(v36, v37, v38, v39, v40, v41, v42, v43, v63, __src[0], v65, v66, v67, v68, v69, v70, v71, v72, v73,
              v74,
              v75,
              v76,
              v77,
              v78,
              v79,
              v80,
              v81,
              v82,
              v83,
              v84,
              v85,
              v86,
              __dst[0]);
            sub_21BD022A8(__dst);
            swift_bridgeObjectRelease();
            sub_21BCD7228();
            double v45 = v44;
            uint64_t v46 = swift_allocObject();
            *(void *)(v46 + 16) = v5;
            *(float *)(v46 + 24) = a5;
            *(void *)(v46 + 32) = a1;
            *(void *)(v46 + 40) = a2;
            *(void *)(v46 + 48) = a3;
            *(void *)(v46 + 56) = a4;
            swift_retain();
            swift_bridgeObjectRetain();
            sub_21BC01660((uint64_t)a3);
            sub_21BC56C5C(0xD000000000000018, 0x800000021BECCC30, (uint64_t)sub_21BD29818, v46, v45);
            swift_unknownObjectRelease();

            swift_release();
            goto LABEL_30;
          }
          swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
      OUTLINED_FUNCTION_7_28();
      sub_21BC568A4();
      goto LABEL_30;
    }
    if (sub_21BC82158())
    {
      OUTLINED_FUNCTION_1_36();
      sub_21BEAAC48();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_2_35();
      *(void *)__src = *(void *)__dst;
      uint64_t v65 = v88;
      int v12 = sub_21BC9EB70((uint64_t)__src);
      OUTLINED_FUNCTION_9_27(v12, v13, v14, v15, v16, v17, v18, v19, v63, __src[0], v65, v66, v67, v68, v69, v70, v71, v72, v73,
        v74,
        v75,
        v76,
        v77,
        v78,
        v79,
        v80,
        v81,
        v82,
        v83,
        v84,
        v85,
        v86,
        __dst[0]);
      sub_21BD022A8(__dst);
      swift_bridgeObjectRelease();
      *(float *)(v11 + 220) = a5;
      *(unsigned char *)(v11 + 224) = 0;
      OUTLINED_FUNCTION_13_23();
      sub_21BC56998();
      sub_21BC83D90(1, 1);
      int v20 = *(void **)(v11 + 32);
      if (!v20)
      {
LABEL_29:
        OUTLINED_FUNCTION_10_24();
        goto LABEL_30;
      }
      if (objc_msgSend((id)swift_unknownObjectRetain(), sel_isAssetLoaded))
      {
        id v21 = objc_msgSend(v20, sel_avPlayerItem);
        uint64_t v22 = sub_21BC531E4();
        id v23 = (id)v22;
        if (v21)
        {
          if (!v22)
          {
            swift_unknownObjectRelease();

            goto LABEL_29;
          }

          swift_unknownObjectRelease();
          if (v21 != v23) {
            goto LABEL_28;
          }
          goto LABEL_26;
        }
        if (!v22)
        {
LABEL_26:
          objc_msgSend(v20, sel_time);
          double v56 = v55;
          objc_msgSend(v20, sel_effectivePlaybackStartTime);
          if (vabdd_f64(v56, v57) > 0.01)
          {
            objc_msgSend(v20, sel_effectivePlaybackStartTime);
            uint64_t v58 = OUTLINED_FUNCTION_13_23();
            sub_21BC56C5C(v58, v59, v60, v61, v62);
          }
          goto LABEL_28;
        }
        swift_unknownObjectRelease();
      }
LABEL_28:
      swift_unknownObjectRelease();
      goto LABEL_29;
    }
    OUTLINED_FUNCTION_1_36();
    sub_21BEAAC48();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_2_35();
    *(void *)__src = *(void *)__dst;
    uint64_t v65 = v88;
    int v47 = sub_21BC9EB70((uint64_t)__src);
    OUTLINED_FUNCTION_9_27(v47, v48, v49, v50, v51, v52, v53, v54, v63, __src[0], v65, v66, v67, v68, v69, v70, v71, v72, v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      v79,
      v80,
      v81,
      v82,
      v83,
      v84,
      v85,
      v86,
      __dst[0]);
    sub_21BD022A8(__dst);
    swift_bridgeObjectRelease();
    *(float *)(v11 + 220) = a5;
    *(unsigned char *)(v11 + 224) = 0;
    OUTLINED_FUNCTION_7_28();
    sub_21BC56998();
  }
  else
  {
    OUTLINED_FUNCTION_1_36();
    sub_21BEAAC48();
    OUTLINED_FUNCTION_17_24();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_2_35();
    *(void *)__src = *(void *)__dst;
    uint64_t v65 = v88;
    int v24 = sub_21BC9EB70((uint64_t)__src);
    OUTLINED_FUNCTION_9_27(v24, v25, v26, v27, v28, v29, v30, v31, v63, __src[0], v65, v66, v67, v68, v69, v70, v71, v72, v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      v79,
      v80,
      v81,
      v82,
      v83,
      v84,
      v85,
      v86,
      __dst[0]);
    sub_21BD022A8(__dst);
    swift_bridgeObjectRelease();
    if (a3)
    {
      if (qword_26AAEFBE0 != -1) {
        swift_once();
      }
      uint64_t v32 = OUTLINED_FUNCTION_15_24();
      a3(v32);
    }
  }
LABEL_30:
  OUTLINED_FUNCTION_4_32();
}

uint64_t sub_21BD2655C()
{
  OUTLINED_FUNCTION_14_23();
  uint64_t v4 = v3;
  os_log_type_t v6 = v5;
  double v8 = v7;
  if (v5 == (void *)1) {
    sub_21BC81FB0();
  }
  return sub_21BC568B4(v6, v4, v2, v1, v0, v8);
}

void sub_21BD265DC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, float a5)
{
  if ((sub_21BC80C9C() & 1) == 0)
  {
    OUTLINED_FUNCTION_43();
    sub_21BEAAC48();
    OUTLINED_FUNCTION_5_26();
    OUTLINED_FUNCTION_30_8();
    OUTLINED_FUNCTION_11_26();
    uint64_t v44 = *(void *)__dst;
    uint64_t v45 = v68;
    int v15 = sub_21BC9EB70((uint64_t)&v44);
    OUTLINED_FUNCTION_16_26(v15, v16, v17, v18, v19, v20, v21, v22, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      __dst[0]);
    sub_21BD022A8(__dst);
    swift_bridgeObjectRelease();
    if (!a3) {
      return;
    }
    if (qword_26AAEFBE0 != -1) {
      swift_once();
    }
    uint64_t v12 = OUTLINED_FUNCTION_8_26();
    goto LABEL_9;
  }
  sub_21BC530C0();
  if (v11 == a5)
  {
    if (!a3) {
      return;
    }
    uint64_t v12 = a1;
    uint64_t v13 = a2;
    uint64_t v14 = 0;
LABEL_9:
    ((void (*)(uint64_t, uint64_t, uint64_t))a3)(v12, v13, v14);
    return;
  }
  if ((sub_21BC82088() & 1) != 0 || a5 > 0.0 && (unsigned __int16)sub_21BC53274() != 32769)
  {
    OUTLINED_FUNCTION_43();
    sub_21BEAAC48();
    OUTLINED_FUNCTION_5_26();
    OUTLINED_FUNCTION_30_8();
    OUTLINED_FUNCTION_11_26();
    uint64_t v44 = *(void *)__dst;
    uint64_t v45 = v68;
    int v23 = sub_21BC9EB70((uint64_t)&v44);
    OUTLINED_FUNCTION_16_26(v23, v24, v25, v26, v27, v28, v29, v30, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      __dst[0]);
    sub_21BD022A8(__dst);
    swift_bridgeObjectRelease();
    uint64_t v31 = OUTLINED_FUNCTION_8_26();
    sub_21BD260F4(v31, v32, a3, a4, v33);
  }
  else if (a5 == 0.0 && (sub_21BC530C0(), v34 != 0.0))
  {
    OUTLINED_FUNCTION_43();
    sub_21BEAAC48();
    sub_21BEAA238();
    OUTLINED_FUNCTION_11_26();
    uint64_t v44 = *(void *)__dst;
    uint64_t v45 = v68;
    int v36 = sub_21BC9EB70((uint64_t)&v44);
    OUTLINED_FUNCTION_16_26(v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      __dst[0]);
    sub_21BD022A8(__dst);
    swift_bridgeObjectRelease();
    sub_21BC568B4(0, a1, a2, (uint64_t)a3, a4, 0.0);
  }
  else
  {
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = a3;
    *(void *)(v35 + 24) = a4;
    *(void *)(v35 + 32) = v5;
    *(float *)(v35 + 40) = a5;
    sub_21BC01660((uint64_t)a3);
    swift_retain();
    OUTLINED_FUNCTION_8_26();
    sub_21BC56998();
    swift_release();
  }
}

uint64_t sub_21BD26904()
{
  OUTLINED_FUNCTION_14_23();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  if (*(void *)(*(void *)(v1 + 40) + 32))
  {
    swift_unknownObjectRetain();
    sub_21BC80EAC();
    swift_unknownObjectRelease();
  }
  return sub_21BC56A3C(v7, v5, v3, v2, v0);
}

uint64_t sub_21BD2698C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21BD26A88(a1, a2, a3, a4, (uint64_t)&unk_26CBC7B78, (uint64_t)sub_21BD29F60, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_21BC56AE0);
}

uint64_t sub_21BD269C0(double a1)
{
  if (*(void *)(*(void *)(v1 + 40) + 32))
  {
    uint64_t v3 = swift_unknownObjectRetain();
    sub_21BC80D14(v3, a1);
    swift_unknownObjectRelease();
  }
  return sub_21BC56AF8();
}

uint64_t sub_21BD26A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21BD26A88(a1, a2, a3, a4, (uint64_t)&unk_26CBC7B50, (uint64_t)sub_21BD29738, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_21BC56B84);
}

uint64_t sub_21BD26A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, void *))
{
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  sub_21BC01660(a3);
  swift_retain();
  a7(a1, a2, a6, v14);
  swift_release();

  return swift_release();
}

void sub_21BD26B70(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, double a5)
{
  uint64_t v11 = *(void *)(v5 + 40);
  if ((sub_21BC80C9C() & 1) == 0)
  {
    uint64_t __dst = 0;
    unint64_t v28 = 0xE000000000000000;
    sub_21BEAAC48();
    sub_21BEAA238();
    sub_21BEAA238();
    __src[0] = 0;
    __src[1] = 0xE000000000000000;
    sub_21BC9EB70((uint64_t)__src);
    sub_21BC02A04(__src, &__dst);
    sub_21BD022A8(&__dst);
    swift_bridgeObjectRelease();
    if (a3)
    {
      if (qword_26AAEFBE0 != -1) {
        swift_once();
      }
      uint64_t v15 = OUTLINED_FUNCTION_8_26();
      a3(v15);
    }
    goto LABEL_22;
  }
  uint64_t v12 = *(void **)(v11 + 32);
  if (!v12)
  {
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    uint64_t __dst = 4;
    sub_21BEAA0C8();
    _s3__C4CodeOMa_5(0);
    sub_21BD29F18((unint64_t *)&qword_26AAF2EA0, _s3__C4CodeOMa_5);
    int v16 = (void *)sub_21BEAA9B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a3)
    {
      id v17 = v16;
      uint64_t v18 = OUTLINED_FUNCTION_8_26();
      a3(v18);
    }
    else
    {
    }
LABEL_22:
    OUTLINED_FUNCTION_4_32();
    return;
  }
  swift_unknownObjectRetain();
  if ((sub_21BC82088() & 1) != 0 || (objc_msgSend(v12, sel_isAssetLoaded) & 1) == 0)
  {
    objc_msgSend(v12, sel_setPlaybackStartTimeOverride_, a5);
    swift_unknownObjectRetain();
    sub_21BEA8CB8();
    double v14 = v13;
    type metadata accessor for EventTime();
    swift_allocObject();
    uint64_t __dst = *(void *)&a5;
    unint64_t v28 = (unint64_t)v12;
    long long v29 = xmmword_21BEF0680;
    uint64_t v30 = sub_21BD40744(0, 0, 0, 1, v14, v14);
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    unint64_t v34 = 0x9000000000000005;
    if (MEMORY[0x21D49EBF0](v11 + 16))
    {
      sub_21BC47B6C((uint64_t)&__dst);
      swift_unknownObjectRelease();
    }
    if (sub_21BC82088())
    {
      if (a3) {
        ((void (*)(uint64_t, uint64_t, void))a3)(a1, a2, 0);
      }
      swift_release();
      swift_unknownObjectRelease_n();
      goto LABEL_22;
    }
    swift_release();
    swift_unknownObjectRelease();
  }
  sub_21BC80D14((uint64_t)v12, a5);
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  int v20 = (void *)swift_allocObject();
  _OWORD v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  sub_21BC01660((uint64_t)a3);
  swift_retain();
  uint64_t v21 = OUTLINED_FUNCTION_8_26();
  sub_21BC56C5C(v21, v22, v23, (uint64_t)v20, v24);
  swift_unknownObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_4_32();
  swift_release();
}

void sub_21BD26FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_21BEA8B08();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void *sub_21BD27028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  uint64_t v12 = v11;
  v11[9] = 0;
  v11[10] = 0;
  v11[2] = a3;
  v11[4] = a8;
  swift_unknownObjectRetain();
  swift_retain();
  id v16 = (id)MPSharedBackgroundTaskProvider();
  v27[3] = type metadata accessor for EventReporter();
  v27[4] = &off_26CBC70D8;
  v27[0] = a8;
  type metadata accessor for BackgroundTaskController();
  swift_allocObject();
  swift_retain();
  uint64_t v17 = sub_21BC60DBC((uint64_t)v16, (uint64_t)v27);
  v12[8] = v17;
  swift_unknownObjectRetain();
  swift_retain();
  id v24 = a11;
  swift_unknownObjectRetain();
  uint64_t v18 = sub_21BD2927C(a1, a2, a11, a8, a7, a10, a9);
  v12[3] = v18;
  type metadata accessor for ErrorControllerImplementation();
  swift_allocObject();
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v19 = sub_21BCD4BCC();
  v12[7] = v19;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v20 = sub_21BD2984C(v18, a4, a3, v19, a6, a8, v17, a10, a9);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  v12[5] = v20;
  v12[6] = &off_26CBC1578;
  *(void *)(v12[3] + 24) = off_26CBC1580;
  swift_unknownObjectWeakAssign();
  return v12;
}

void sub_21BD27228()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void **)(v1 + 32);
  if (!v2) {
    return;
  }
  if (!objc_msgSend((id)swift_unknownObjectRetain(), sel_isAssetLoaded)) {
    goto LABEL_8;
  }
  uint64_t v3 = sub_21BC531E4();
  if (!v3) {
    goto LABEL_8;
  }
  uint64_t v4 = (void *)v3;
  id v5 = objc_msgSend(v2, sel_avPlayerItem);
  id v6 = objc_msgSend(v4, sel_avPlayerItem);
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {

      if (v5 != v7)
      {
        swift_unknownObjectRelease();
LABEL_8:
        swift_unknownObjectRelease();
        goto LABEL_9;
      }
LABEL_16:
      sub_21BC53078();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    if (!v6) {
      goto LABEL_16;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
LABEL_9:
  double v8 = *(void **)(v1 + 32);
  if (v8)
  {
    objc_msgSend(v8, sel_effectivePlaybackStartTime);
  }
}

uint64_t sub_21BD27384()
{
  return *(void *)(*(void *)(v0 + 24) + 48);
}

id sub_21BD27390()
{
  id result = *(id *)(*(void *)(v0 + 24) + 128);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

BOOL sub_21BD273A4(uint64_t a1)
{
  uint64_t v3 = *(void **)(*(void *)(v1 + 40) + 32);
  if (v3) {
    objc_msgSend(v3, sel_playbackStartTime);
  }
  else {
    double v4 = 0.0;
  }
  return sub_21BC54FE4(a1, v4);
}

uint64_t sub_21BD273F8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21BD27448()
{
  sub_21BD273F8();

  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for PlaybackStackController()
{
  return self;
}

uint64_t sub_21BD27518()
{
  uint64_t v1 = v0;
  sub_21BD29DC8(0, (unint64_t *)&qword_26AAEF9E0, (uint64_t (*)(uint64_t))sub_21BC1FB58, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  uint64_t v3 = inited;
  *(_OWORD *)(inited + 16) = xmmword_21BEEBD30;
  *(void *)(inited + 32) = 0xD00000000000001ALL;
  *(void *)(inited + 40) = 0x800000021BEC7080;
  double v4 = (void *)v0[5];
  uint64_t v5 = MEMORY[0x263F8D310];
  if (v4[4])
  {
    id v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_description);
    uint64_t v7 = sub_21BEAA178();
    unint64_t v9 = v8;
    swift_unknownObjectRelease();

    int v10 = (uint64_t *)(v3 + 48);
    *(void *)(v3 + 72) = v5;
    if (v9)
    {
      *int v10 = v7;
      goto LABEL_6;
    }
  }
  else
  {
    int v10 = (uint64_t *)(inited + 48);
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
  }
  *int v10 = 7104846;
  unint64_t v9 = 0xE300000000000000;
LABEL_6:
  *(void *)(v3 + 56) = v9;
  *(void *)(v3 + 80) = 0xD000000000000010;
  *(void *)(v3 + 88) = 0x800000021BEC70E0;
  uint64_t v11 = sub_21BC56590();
  sub_21BC0BB14();
  uint64_t v13 = v12;
  *(void *)(v3 + 96) = v11;
  *(void *)(v3 + 120) = v12;
  *(void *)(v3 + 128) = 0xD00000000000001FLL;
  *(void *)(v3 + 136) = 0x800000021BECC930;
  id v14 = objc_msgSend(v4, sel_stateDictionary);
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v16 = sub_21BEAA0A8();

  *(void *)(v3 + 144) = v16;
  *(void *)(v3 + 168) = v13;
  *(void *)(v3 + 176) = 0xD000000000000018;
  *(void *)(v3 + 184) = 0x800000021BECC950;
  if (!v1[8])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    goto LABEL_10;
  }
  id v17 = objc_msgSend((id)swift_retain(), sel_stateDictionary);
  uint64_t v18 = sub_21BEAA0A8();

  *((void *)&v25 + 1) = v13;
  *(void *)&long long v24 = v18;
  swift_release();
  if (!v13)
  {
LABEL_10:
    *(void *)(v3 + 216) = v15;
    *(void *)(v3 + 192) = 7104846;
    *(void *)(v3 + 200) = 0xE300000000000000;
    sub_21BC04BE0((uint64_t)&v24);
    goto LABEL_11;
  }
  sub_21BC1DDD0(&v24, (_OWORD *)(v3 + 192));
LABEL_11:
  *(void *)(v3 + 224) = 1701080909;
  *(void *)(v3 + 232) = 0xE400000000000000;
  id v19 = objc_msgSend(v1, sel_modeDescription, v24, (void)v25, *((void *)&v25 + 1));
  uint64_t v20 = sub_21BEAA178();
  uint64_t v22 = v21;

  *(void *)(v3 + 264) = v15;
  *(void *)(v3 + 240) = v20;
  *(void *)(v3 + 248) = v22;
  return sub_21BEAA0C8();
}

void sub_21BD27810(void *a1)
{
  __src[0] = 0xD000000000000029;
  __src[1] = 0x800000021BECC900;
  sub_21BC9EB70((uint64_t)__src);
  sub_21BC02A04(__src, v5);
  sub_21BD022A8(v5);
  sub_21BC587A8(a1);
  uint64_t v3 = *(void **)(v1 + 40);
  double v4 = (void *)sub_21BEA8B08();
  objc_msgSend(v3, sel_resetWithReason_, v4);
}

uint64_t sub_21BD27910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (a3)
  {
    if (a4) {
      return a4();
    }
  }
  else if ((unsigned __int16)sub_21BC53274() != 32770 && (uint64_t result = sub_21BC53274(), (result & 0xC000) != 0))
  {
    if (a4) {
      return a4();
    }
  }
  else
  {
    return sub_21BC568A4();
  }
  return result;
}

uint64_t sub_21BD279C4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  if (a4) {
    a4();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_unknownObjectRetain();
    swift_release();
    sub_21BC81034();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21BD27A78()
{
  swift_retain();
  uint64_t v0 = sub_21BCDB074();
  swift_release();
  return v0;
}

void sub_21BD27AB8(void *a1)
{
  swift_retain();
  id v2 = sub_21BC8C334();
  swift_retain();
  id v3 = a1;
  id v4 = v2;
  sub_21BCDDCAC();
  swift_release();
}

uint64_t sub_21BD27B64(uint64_t (*a1)(uint64_t a1, void *a2), uint64_t a2)
{
  swift_retain();
  sub_21BCDC498(a1, a2);

  return swift_release();
}

uint64_t sub_21BD27C50()
{
  uint64_t result = sub_21BC53274();
  if ((unsigned __int16)result == 0x8000)
  {
    swift_retain();
    sub_21BCDE584();
    swift_retain();
    sub_21BCDD6AC();
    return swift_release();
  }
  return result;
}

uint64_t sub_21BD27D04()
{
  swift_retain_n();
  sub_21BCDE2D8();

  return swift_release();
}

uint64_t sub_21BD27E08()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 24) + 32);
  if (!v1) {
    return 1869377363;
  }
  if (v1 == (void *)1) {
    return 0x646572616853;
  }
  sub_21BC5F22C(v1);
  id v3 = v1;
  sub_21BEAAC48();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v3, sel_description);
  sub_21BEAA178();

  sub_21BEAA238();
  swift_bridgeObjectRelease();
  sub_21BEAA238();
  sub_21BC5F23C(v1);
  sub_21BC5F23C(v1);
  return 0x53646567616E614DLL;
}

BOOL sub_21BD27F4C()
{
  return *(void *)(*(void *)(v0 + 24) + 32) == 0;
}

BOOL sub_21BD27F88()
{
  return *(void *)(*(void *)(v0 + 24) + 32) == 1;
}

BOOL sub_21BD27FC4()
{
  return *(void *)(*(void *)(v0 + 24) + 32) > 1uLL;
}

void sub_21BD27FF8(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(*(void *)(v3 + 24) + 32) >= 2uLL)
  {
    uint64_t v12 = a1;
    uint64_t v13 = a2;
    int v4 = sub_21BC331FC((uint64_t)&v12);
    OUTLINED_FUNCTION_16_26(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35[0]);
    sub_21BD022A8(v35);
    __break(1u);
  }
  else
  {
    sub_21BC53024(a3);
  }
}

uint64_t sub_21BD28078()
{
  OUTLINED_FUNCTION_14_23();
  swift_retain();
  sub_21BD27FF8(v2, v1, v0);

  return swift_release();
}

void sub_21BD280CC(void *a1)
{
  id v2 = a1;
  sub_21BC53024(a1);
}

uint64_t sub_21BD28114(uint64_t a1, uint64_t a2, void *a3, void (*a4)(id))
{
  id v5 = a3;
  swift_retain();
  a4(v5);

  return swift_release();
}

void sub_21BD28174(uint64_t a1)
{
}

void sub_21BD2821C()
{
}

void sub_21BD2828C(float a1)
{
}

uint64_t sub_21BD282B0(uint64_t a1, double a2)
{
  return sub_21BC5B694(a1, a2);
}

unint64_t sub_21BD282FC(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21BEAAD88();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  if (!*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_21BD29E84();
  uint64_t result = sub_21BEAAC28();
  unint64_t v3 = result;
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21BEAAD88();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_25;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = v3 + 56;
  while (1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t result = MEMORY[0x21D49C490](v6, v1);
      unint64_t v8 = result;
    }
    else
    {
      if (v6 >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_28;
      }
      unint64_t v8 = *(void *)(v1 + 32 + 8 * v6);
      uint64_t result = swift_retain();
    }
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      break;
    }
    sub_21BEAAFB8();
    sub_21BC7D118();
    sub_21BEAA228();
    swift_bridgeObjectRelease();
    uint64_t result = sub_21BEAAFE8();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    uint64_t v15 = *(void *)(v3 + 48);
    if (((1 << v11) & v13) != 0)
    {
      if (*(void *)(v15 + 8 * v11) == v8)
      {
LABEL_21:
        uint64_t result = swift_release();
        goto LABEL_24;
      }
      uint64_t v16 = ~v10;
      while (1)
      {
        unint64_t v11 = (v11 + 1) & v16;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0) {
          break;
        }
        if (*(void *)(v15 + 8 * v11) == v8) {
          goto LABEL_21;
        }
      }
    }
    *(void *)(v7 + 8 * v12) = v14 | v13;
    *(void *)(v15 + 8 * v11) = v8;
    uint64_t v17 = *(void *)(v3 + 16);
    BOOL v9 = __OFADD__(v17, 1);
    uint64_t v18 = v17 + 1;
    if (v9) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v18;
LABEL_24:
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21BD28524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = type metadata accessor for EventReporter();
  unint64_t v11 = &off_26CBC70D8;
  *(void *)&long long v9 = a2;
  *(void *)(a4 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_DWORD *)(a4 + 32) = 1065353216;
  *(void *)(a4 + 40) = 0;
  *(unsigned char *)(a4 + 48) = 1;
  *(void *)(a4 + 56) = 0;
  *(unsigned char *)(a4 + 64) = 1;
  *(void *)(a4 + 72) = 0;
  *(void *)(a4 + 80) = 0;
  *(void *)(a4 + 136) = MEMORY[0x263F8EE88];
  swift_unknownObjectWeakInit();
  *(void *)(a4 + 152) = 0;
  *(unsigned char *)(a4 + 160) = 1;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_DWORD *)(a4 + 200) = 1065353216;
  *(unsigned char *)(a4 + 204) = 0;
  *(void *)(a4 + 216) = 0;
  *(void *)(a4 + 224) = 0;
  *(void *)(a4 + 128) = a3;
  sub_21BC32CE8(&v9, a4 + 88);
  *(void *)(a4 + 208) = a1;
  return a4;
}

uint64_t sub_21BD28600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21BC9130C(a1, *(void *)(a2 + 40), a3, a4);
}

uint64_t sub_21BD28608(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v9 = type metadata accessor for EventReporter();
  uint64_t v10 = &off_26CBC70D8;
  *(void *)&long long v8 = a1;
  *(void *)(a2 + 32) = 0;
  swift_unknownObjectWeakInit();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_21BEAAD88()) {
    unint64_t v6 = sub_21BD282FC(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v6 = MEMORY[0x263F8EE88];
  }
  *(void *)(a2 + 40) = v6;
  *(double *)(a2 + 16) = a3;
  sub_21BC32CE8(&v8, a2 + 48);
  return a2;
}

uint64_t sub_21BD286B8(uint64_t *a1, double a2)
{
  uint64_t v13 = *a1;
  uint64_t v14 = &off_26CBC70D8;
  v12[0] = a1;
  type metadata accessor for UserEventsMonitor();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  MEMORY[0x270FA5388](v4, v4, v5);
  unint64_t v7 = (void *)((char *)&v12[-1] - v6);
  (*(void (**)(char *))(v8 + 16))((char *)&v12[-1] - v6);
  uint64_t v9 = sub_21BD28608(*v7, v3, a2);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v9;
}

uint64_t sub_21BD287F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  v17[3] = v3;
  v17[4] = &off_26CBC70D8;
  v17[0] = a2;
  type metadata accessor for AudioSessionController();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v3);
  MEMORY[0x270FA5388](v5, v5, v6);
  uint64_t v8 = (void *)((char *)v13 - v7);
  (*(void (**)(char *))(v9 + 16))((char *)v13 - v7);
  uint64_t v10 = *v8;
  uint64_t v15 = v3;
  uint64_t v16 = &off_26CBC70D8;
  v13[1] = 0;
  *(void *)&long long v14 = v10;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 80) = 0;
  sub_21BEA9028();
  unint64_t v11 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = a1;

  sub_21BC32CE8(&v14, v4 + 40);
  *(unsigned char *)(v4 + 24) = 0;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v17);
  return v4;
}

uint64_t sub_21BD28964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = type metadata accessor for EventReporter();
  uint64_t v17 = &off_26CBC70D8;
  v15[0] = a2;
  type metadata accessor for InternalPlayerController();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
  MEMORY[0x270FA5388](v7, v7, v8);
  uint64_t v10 = (void *)((char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  uint64_t v12 = sub_21BD28524(a1, *v10, a3, v6);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  return v12;
}

uint64_t sub_21BD28A90(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v24 = type metadata accessor for EventReporter();
  uint64_t v25 = &off_26CBC70D8;
  v23[0] = a4;
  type metadata accessor for PlayerController();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
  MEMORY[0x270FA5388](v15, v15, v16);
  uint64_t v18 = (void *)((char *)&v23[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  uint64_t v20 = sub_21BD28BEC(a1, a2, a3, *v18, a5, a6, a7, v14);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
  return v20;
}

uint64_t sub_21BD28BEC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37[3] = type metadata accessor for EventReporter();
  v37[4] = &off_26CBC70D8;
  v37[0] = a4;
  *(void *)(a8 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a8 + 40) = 0x4072C00000000000;
  *(void *)(a8 + 104) = 0;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(unsigned char *)(a8 + 112) = 1;
  *(void *)(a8 + 128) = 0;
  *(void *)(a8 + 136) = 0;
  *(void *)(a8 + 120) = 0;
  *(_OWORD *)(a8 + 208) = 0u;
  *(_OWORD *)(a8 + 224) = 0u;
  *(_OWORD *)(a8 + 240) = 0u;
  *(_OWORD *)(a8 + 256) = 0u;
  *(_OWORD *)(a8 + 272) = 0u;
  *(_OWORD *)(a8 + 288) = 0u;
  *(_OWORD *)(a8 + 304) = 0u;
  *(_OWORD *)(a8 + 320) = 0u;
  *(void *)(a8 + 384) = 0;
  *(void *)(a8 + 392) = 0;
  *(void *)(a8 + 80) = a1;
  *(void *)(a8 + 88) = a2;
  *(void *)(a8 + 152) = a3;
  sub_21BC32D00((uint64_t)v37, a8 + 336);
  *(void *)(a8 + 160) = a6;
  *(void *)(a8 + 168) = &off_26CBC1EA0;
  *(void *)(a8 + 176) = &off_26CBC1D88;
  *(void *)(a8 + 184) = &off_26CBC1DE8;
  *(void *)(a8 + 376) = a5;
  *(void *)(a8 + 192) = &off_26CBC1EB0;
  *(void *)(a8 + 200) = &off_26CBC1E90;
  *(void *)(a8 + 32) = 0;
  *(void *)(a8 + 144) = a7;
  double v16 = *(double *)(a8 + 40);
  sub_21BC32D00((uint64_t)v37, (uint64_t)v35);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v36);
  MEMORY[0x270FA5388](v17, v17, v18);
  uint64_t v20 = (uint64_t **)&v35[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t **))(v21 + 16))(v20);
  uint64_t v22 = *v20;
  swift_unknownObjectRetain();
  id v23 = a3;
  swift_retain();
  uint64_t v24 = sub_21BD286B8(v22, v16);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v35);
  *(void *)(a8 + 328) = v24;
  swift_release();
  sub_21BC54378();
  uint64_t v26 = v25;
  sub_21BC32D00((uint64_t)v37, (uint64_t)v35);
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v36);
  MEMORY[0x270FA5388](v27, v27, v28);
  uint64_t v30 = (uint64_t **)&v35[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t **))(v31 + 16))(v30);
  uint64_t v32 = sub_21BD287F0(v26, *v30);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v35);
  *(void *)(a8 + 96) = v32;
  uint64_t v33 = *(void *)(a8 + 328);
  if (v33)
  {
    *(void *)(v33 + 32) = &off_26CBC0418;
    swift_unknownObjectWeakAssign();
  }
  sub_21BC54690();

  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v37);
  return a8;
}

void *sub_21BD28F00(uint64_t a1, uint64_t a2, void *a3)
{
  a3[4] = 0;
  swift_unknownObjectWeakInit();
  a3[7] = &off_26CBBF438;
  a3[2] = a2;
  a3[5] = MEMORY[0x263F8EE78];
  a3[6] = a1;
  type metadata accessor for IdleState();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  sub_21BC94C4C();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return a3;
}

uint64_t sub_21BD28FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  v14[3] = type metadata accessor for EventReporter();
  v14[4] = &off_26CBC70D8;
  v14[0] = a6;
  *(void *)(a7 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a7 + 40) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a7 + 88) = 0;
  *(void *)(a7 + 96) = 0;
  uint64_t v12 = MEMORY[0x263F8EE78];
  *(void *)(a7 + 104) = 0;
  *(void *)(a7 + 112) = v12;
  *(void *)(a7 + 120) = 0;
  *(void *)(a7 + 128) = 0;
  *(void *)(a7 + 136) = v12;
  *(void *)(a7 + 144) = 0;
  *(_WORD *)(a7 + 152) = 257;
  type metadata accessor for AssetSlidingQueue.Position();
  *(void *)(a7 + 168) = 0;
  *(void *)(a7 + 176) = 0;
  *(void *)(a7 + 160) = 0;
  *(void *)(a7 + 184) = sub_21BEAA0C8();
  *(void *)(a7 + 192) = 3;
  *(_DWORD *)(a7 + 200) = 0x1000000;
  *(_WORD *)(a7 + 204) = 2;
  *(void *)(a7 + 208) = 0;
  *(void *)(a7 + 216) = v12;
  *(unsigned char *)(a7 + 224) = 0;
  sub_21BC32D00((uint64_t)v14, a7 + 48);
  *(void *)(a7 + 24) = a2;
  swift_unknownObjectWeakAssign();
  *(void *)(a7 + 40) = a4;
  swift_unknownObjectWeakAssign();
  *(unsigned char *)(a7 + 154) = a5;
  sub_21BCE0CA4(0xD000000000000015, 0x800000021BECA740);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
  return a7;
}

uint64_t sub_21BD2911C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t *a6)
{
  uint64_t v21 = *a6;
  uint64_t v22 = &off_26CBC70D8;
  v20[0] = a6;
  type metadata accessor for AssetSlidingQueue();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x270FA5388](v12, v12, v13);
  uint64_t v15 = (void *)((char *)&v20[-1] - v14);
  (*(void (**)(char *))(v16 + 16))((char *)&v20[-1] - v14);
  uint64_t v17 = sub_21BD28FA8(a1, a2, a3, a4, a5, *v15, v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v20);
  return v17;
}

uint64_t sub_21BD2927C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)&long long v39 = a6;
  v43[3] = type metadata accessor for EventReporter();
  v43[4] = &off_26CBC70D8;
  v43[0] = a4;
  if (a3)
  {
    uint64_t v13 = a3;
  }
  else
  {
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2E50);
    uint64_t v13 = (void *)sub_21BEAA748();
  }
  sub_21BC32D00((uint64_t)v43, (uint64_t)v41);
  uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v41, v42);
  MEMORY[0x270FA5388](v14, v14, v15);
  uint64_t v17 = (uint64_t *)((char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = *v17;
  id v38 = a3;
  id v20 = v13;
  uint64_t v21 = sub_21BD28964(0, v19, (uint64_t)v20);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
  type metadata accessor for PlayerFSM();
  uint64_t v22 = (void *)swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v23 = swift_retain();
  uint64_t v24 = sub_21BD28F00(v23, a7, v22);
  sub_21BC32D00((uint64_t)v43, (uint64_t)v41);
  uint64_t v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v41, v42);
  MEMORY[0x270FA5388](v25, v25, v26);
  uint64_t v28 = (uint64_t *)((char *)&v37 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  uint64_t v30 = *v28;
  swift_unknownObjectRetain();
  swift_retain();
  id v31 = v20;
  uint64_t v32 = sub_21BD28A90(a1, a2, v31, v30, a5, (uint64_t)v24, v39);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
  *(void *)(v21 + 24) = &off_26CBC0388;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  uint64_t v33 = *(void *)(v32 + 160);
  uint64_t v34 = *(void *)(v32 + 184);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v40 = v33;
  swift_retain_n();
  long long v39 = *(_OWORD *)(v32 + 168);
  long long v37 = *(_OWORD *)(v32 + 192);
  (*(void (**)(uint64_t, _UNKNOWN **, uint64_t))(v37 + 16))(v32, &off_26CBC0378, ObjectType);
  *(void *)(v32 + 160) = v40;
  *(_OWORD *)(v32 + 168) = v39;
  *(void *)(v32 + 184) = v34;
  *(_OWORD *)(v32 + 192) = v37;
  swift_endAccess();

  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
  return v32;
}

id sub_21BD2961C(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_contentItemID);
  uint64_t v5 = sub_21BEAA178();
  uint64_t v7 = v6;

  uint64_t v8 = sub_21BC83E38(v5, v7);
  swift_bridgeObjectRelease();
  if (!v8) {
    return objc_msgSend(*(id *)(a2 + 16), sel_queueItemForPlayerItem_allowReuse_, a1, 1);
  }
  return (id)v8;
}

uint64_t sub_21BD296C0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21BD296F8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21BD29738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21BD279C4(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_21BD2975C()
{
  return objectdestroy_47Tm(44);
}

uint64_t objectdestroy_47Tm(uint64_t a1)
{
  if (*(void *)(v1 + 16)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_21BD297B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21BD27910(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_21BD297C8()
{
  swift_release();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21BD29818()
{
  return sub_21BC568A4();
}

uint64_t sub_21BD2984C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v24 = a8;
  uint64_t v26 = type metadata accessor for EventReporter();
  uint64_t v27 = &off_26CBC70D8;
  v25[0] = a6;
  type metadata accessor for AssetSlidingQueueController();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
  MEMORY[0x270FA5388](v17, v17, v18);
  id v20 = (void *)((char *)&v25[-1] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  uint64_t v22 = sub_21BD299B8(a1, a2, a3, a4, a5, *v20, a7, v24, a9, v16);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
  return v22;
}

uint64_t sub_21BD299B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v34 = a8;
  v40[3] = type metadata accessor for EventReporter();
  v40[4] = &off_26CBC70D8;
  v40[0] = a6;
  *(void *)(a10 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_DWORD *)(a10 + 220) = 0;
  *(_OWORD *)(a10 + 160) = 0u;
  *(void *)(a10 + 176) = 0;
  *(_OWORD *)(a10 + 144) = 0u;
  *(void *)(a10 + 200) = 0;
  *(void *)(a10 + 208) = 0;
  *(void *)(a10 + 192) = 0;
  *(unsigned char *)(a10 + 216) = 0;
  *(unsigned char *)(a10 + 224) = 1;
  *(void *)(a10 + 232) = 0;
  *(void *)(a10 + 240) = 0;
  *(unsigned char *)(a10 + 248) = 0;
  *(void *)(a10 + 256) = 0;
  *(void *)(a10 + 264) = 0;
  *(unsigned char *)(a10 + 272) = 3;
  *(void *)(a10 + 280) = 0;
  *(void *)(a10 + 288) = 0;
  *(void *)(a10 + 32) = 0;
  *(void *)(a10 + 40) = a1;
  *(void *)(a10 + 56) = a3;
  *(void *)(a10 + 64) = a4;
  *(void *)(a10 + 72) = a5;
  sub_21BC32D00((uint64_t)v40, a10 + 80);
  *(void *)(a10 + 120) = a7;
  *(void *)(a10 + 128) = a9;
  sub_21BC32D00((uint64_t)v40, (uint64_t)v37);
  type metadata accessor for TransitionController();
  swift_allocObject();
  uint64_t v36 = a9;
  swift_unknownObjectRetain();
  swift_retain_n();
  uint64_t v17 = a3;
  swift_unknownObjectRetain();
  v33[2] = a4;
  swift_retain();
  v33[3] = a5;
  swift_unknownObjectRetain();
  uint64_t v35 = a7;
  swift_retain();
  v33[4] = a1;
  *(void *)(a10 + 136) = sub_21BCF69A0((uint64_t)v37, a1, (uint64_t)&off_26CBC03C8);
  uint64_t v18 = v34;
  *(void *)(a10 + 184) = v34;
  *(void *)(a10 + 48) = a2;
  LOBYTE(a6) = v18 != 1;
  sub_21BC32D00((uint64_t)v40, (uint64_t)v37);
  uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v38);
  MEMORY[0x270FA5388](v19, v19, v20);
  uint64_t v22 = (uint64_t **)((char *)v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t **))(v23 + 16))(v22);
  uint64_t v24 = *v22;
  swift_retain_n();
  uint64_t v34 = a2;
  swift_unknownObjectRetain();
  uint64_t v25 = sub_21BD2911C(a10, (uint64_t)&off_26CBC14C8, a10, (uint64_t)&off_26CBC14B8, a6, v24);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v37);
  uint64_t v38 = type metadata accessor for AssetSlidingQueue();
  long long v39 = &off_26CBC38C8;
  v37[0] = v25;
  swift_beginAccess();
  sub_21BD29D34((uint64_t)v37, a10 + 144);
  swift_endAccess();
  uint64_t v26 = *(void **)(a10 + 56);
  uint64_t v27 = *(void *)(a10 + 40);
  if (*(void *)(v27 + 64))
  {
    uint64_t v28 = *(void *)(v27 + 72);
    uint64_t ObjectType = swift_getObjectType();
    v33[1] = v17;
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t))(v28 + 176);
    swift_unknownObjectRetain();
    id v31 = (void *)v30(ObjectType, v28);
    swift_unknownObjectRelease();
  }
  else
  {
    id v31 = 0;
  }
  objc_msgSend(v26, sel_updatePlayerPlaybackCoordinator_, v31);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v40);
  return a10;
}

uint64_t sub_21BD29D34(uint64_t a1, uint64_t a2)
{
  sub_21BD29DC8(0, (unint64_t *)&qword_26AAF08F0, (uint64_t (*)(uint64_t))sub_21BD29E2C, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_21BD29DC8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_21BD29E2C()
{
  unint64_t result = qword_26AAF08E8;
  if (!qword_26AAF08E8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AAF08E8);
  }
  return result;
}

void sub_21BD29E84()
{
  if (!qword_26AAEF9B8)
  {
    type metadata accessor for UserEventCompletionMonitor();
    sub_21BD29F18(&qword_26AAEF730, (void (*)(uint64_t))type metadata accessor for UserEventCompletionMonitor);
    unint64_t v0 = sub_21BEAAC38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AAEF9B8);
    }
  }
}

uint64_t sub_21BD29F18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21BD29F64(uint64_t a1, char a2, char a3, uint64_t a4)
{
  uint64_t result = sub_21BC331A0(a1, (uint64_t)v11);
  if (v12 >> 60 == 2)
  {
    v12 &= 0xFFFFFFFFFFFFFFBuLL;
    uint64_t v10 = v11[0];
    sub_21BC331A0(a1, v4 + 16);
    *(void *)(v4 + 88) = v10;
    *(unsigned char *)(v4 + 96) = a2 & 1;
    *(unsigned char *)(v4 + 97) = a3 & 1;
    *(void *)(v4 + 104) = a4;
    swift_unknownObjectRetain();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21BD2A004()
{
  __src[0] = v0;
  sub_21BC43670((uint64_t)__src);
  sub_21BC02A04(__src, __dst);
  sub_21BC95184();
  sub_21BC331A0(v0 + 16, (uint64_t)v1);
  sub_21BC96BC4();
}

uint64_t sub_21BD2A070(uint64_t a1)
{
  sub_21BC43614(a1, (uint64_t)v9);
  int v2 = v12 | (v13 << 16);
  if ((v2 & 0xF00000) == 0x300000)
  {
    unsigned __int8 v13 = BYTE2(v2) & 0xF;
    double v3 = *(double *)v9;
    uint64_t v4 = (void *)v9[1];
    uint64_t v5 = v10;
    if (BYTE1(v2)) {
      __int16 v6 = 256;
    }
    else {
      __int16 v6 = 0;
    }
    v14[0] = v9[2];
    v14[1] = v9[3];
    v14[2] = v10;
    v14[3] = v11;
    __int16 v15 = v6 & 0xFFFE | v2 & 1;
    BOOL v16 = (v2 & 0xF0000) != 0;
    type metadata accessor for PausedState();
    swift_allocObject();
    sub_21BC01670(v4);
    swift_bridgeObjectRetain();
    sub_21BC01660(v5);
    sub_21BC01670(v4);
    swift_bridgeObjectRetain();
    sub_21BC01660(v5);
    sub_21BC932E8(0, (uint64_t)v4, (uint64_t)v14, v3);
    sub_21BC94C4C();
    swift_release();
    sub_21BD46D94();
    sub_21BC020C8(v4);
    swift_bridgeObjectRelease();
    sub_21BC020B8(v5);
    char v7 = 1;
  }
  else
  {
    char v7 = sub_21BD468E8(a1);
  }
  return v7 & 1;
}

uint64_t sub_21BD2A1FC(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_21BEA8D58();
  MEMORY[0x270FA5388](v5, v6, v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BC331A0(v3 + 16, (uint64_t)v24);
  if (sub_21BCFA8A4((uint64_t)v24, a1))
  {
    sub_21BC953D0();
    uint64_t v10 = *(void *)(v3 + 88);
    if (*(unsigned char *)(v3 + 96) == 1)
    {
      char v11 = *(unsigned char *)(v3 + 97);
      uint64_t v12 = *(void *)(v3 + 104);
      swift_unknownObjectRetain();
      sub_21BEA8D48();
      sub_21BEA8D28();
      uint64_t v13 = OUTLINED_FUNCTION_0_45();
      v14(v13);
      uint64_t v20 = v9;
      uint64_t v21 = v2;
      type metadata accessor for FailedInitialLoadingTransitionState();
      uint64_t v22 = 0;
      v23[0] = 0;
      *(_DWORD *)((char *)v23 + 7) = 0;
      uint64_t v15 = swift_allocObject();
      *(unsigned char *)(v15 + 67) = v11;
    }
    else
    {
      uint64_t v12 = *(void *)(v3 + 104);
      swift_unknownObjectRetain();
      sub_21BEA8D48();
      sub_21BEA8D28();
      uint64_t v17 = OUTLINED_FUNCTION_0_45();
      v18(v17);
      uint64_t v20 = v9;
      uint64_t v21 = v2;
      type metadata accessor for FailedTransitionState();
      uint64_t v22 = 0;
      v23[0] = 0;
      *(_DWORD *)((char *)v23 + 7) = 0;
      uint64_t v15 = swift_allocObject();
    }
    swift_getObjectType();
    sub_21BD05FF4(v10, v12, (uint64_t)&v20, v15);
    sub_21BC94A2C();
    swift_release();
    char v16 = 1;
  }
  else
  {
    char v16 = sub_21BD46B0C(a1);
  }
  return v16 & 1;
}

uint64_t sub_21BD2A3E8(unint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  if (a3 == 1)
  {
    sub_21BC96E24();
    return 1;
  }
  if (!a3)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_21BEAAD88();
      sub_21BC02354(a1, a2, 0);
      if (v8) {
        goto LABEL_5;
      }
    }
    else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_5:
      swift_bridgeObjectRetain();
      sub_21BC953D0();
      type metadata accessor for ChangingCurrentItemState();
      memset(v9, 0, sizeof(v9));
      uint64_t v10 = 0;
      long long v11 = xmmword_21BEEB420;
      sub_21BD2D380(a1, a2 & 1, (uint64_t)v9, *(unsigned char *)(v4 + 96), *(unsigned char *)(v4 + 97));
      sub_21BC94A2C();
      swift_release();
      return 1;
    }
    sub_21BC96CF8();
    return 1;
  }

  return sub_21BD46EC4(a1, a2, a3);
}

unint64_t sub_21BD2A554()
{
  return 0xD000000000000014;
}

uint64_t sub_21BD2A570()
{
  OUTLINED_FUNCTION_1_37();

  return swift_unknownObjectRelease();
}

uint64_t sub_21BD2A5A4()
{
  OUTLINED_FUNCTION_1_37();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_21BD2A5D0()
{
  sub_21BD2A5A4();

  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t type metadata accessor for ErrorResolutionState()
{
  return self;
}

unint64_t sub_21BD2A628(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t result = 0xD00000000000002CLL;
  switch(a3)
  {
    case 1:
      OUTLINED_FUNCTION_14();
      sub_21BEAAC48();
      swift_bridgeObjectRelease();
      unint64_t v6 = 0xD00000000000002ELL;
      goto LABEL_4;
    case 2:
      OUTLINED_FUNCTION_14();
      sub_21BEAAC48();
      swift_bridgeObjectRelease();
      unint64_t v6 = 0xD000000000000023;
      sub_21BEAA238();
      return v6;
    case 3:
      return result;
    default:
      OUTLINED_FUNCTION_14();
      sub_21BEAAC48();
      sub_21BEAA238();
      unint64_t v5 = sub_21BC6719C();
      MEMORY[0x21D49BB30](a1, v5);
      sub_21BEAA238();
      swift_bridgeObjectRelease();
      sub_21BEAA238();
LABEL_4:
      sub_21BEAA238();
      swift_bridgeObjectRelease();
      return v6;
  }
}

unint64_t sub_21BD2A7D8()
{
  return sub_21BD2A628(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t destroy for CoordinatorEvent(uint64_t a1)
{
  return sub_21BC02354(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s17MediaPlaybackCore16CoordinatorEventOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_21BC018D8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CoordinatorEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_21BC018D8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_21BC02354(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CoordinatorEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_21BC02354(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for CoordinatorEvent()
{
  return &type metadata for CoordinatorEvent;
}

uint64_t sub_21BD2A8F4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21BEA9B18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9);
  long long v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BEA9AD8();
  sub_21BC42220(a1, a2);
  swift_retain();
  sub_21BC42220(a1, a2);
  swift_retain();
  uint64_t v12 = sub_21BEA9B08();
  os_log_type_t v13 = sub_21BEAA6C8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    unint64_t v26 = a2;
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v25 = a1;
    sub_21BC42220(a1, a2);
    uint64_t v15 = sub_21BEAA1E8();
    uint64_t v24 = v6;
    uint64_t v25 = sub_21BCC7B5C(v15, v16, &v27);
    sub_21BEAAA78();
    swift_bridgeObjectRelease();
    sub_21BC42234(a1, a2);
    sub_21BC42234(a1, a2);
    *(_WORD *)(v14 + 12) = 2080;
    unint64_t v17 = *(void *)(v3 + 232);
    uint64_t v25 = *(void *)(v3 + 224);
    unint64_t v26 = v17;
    sub_21BC42220(v25, v17);
    uint64_t v18 = sub_21BEAA1E8();
    uint64_t v25 = sub_21BCC7B5C(v18, v19, &v27);
    sub_21BEAAA78();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21BB87000, v12, v13, "[FullAlignmentTask]: State changed from %s to %s.", (uint8_t *)v14, 0x16u);
    uint64_t v20 = v23;
    swift_arrayDestroy();
    MEMORY[0x21D49EAD0](v20, -1, -1);
    MEMORY[0x21D49EAD0](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v24);
  }
  else
  {
    sub_21BC42234(a1, a2);
    sub_21BC42234(a1, a2);

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
}

uint64_t sub_21BD2ABC4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 224) = a1;
  *(void *)(v2 + 232) = a2;
  uint64_t v3 = OUTLINED_FUNCTION_90();
  sub_21BC42220(v3, v4);
  uint64_t v5 = OUTLINED_FUNCTION_90();
  sub_21BC42234(v5, v6);
  uint64_t v7 = OUTLINED_FUNCTION_90();
  sub_21BD2A8F4(v7, v8);
  uint64_t v9 = OUTLINED_FUNCTION_90();

  return sub_21BC42234(v9, v10);
}

uint64_t sub_21BD2AC1C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21BEA9B18();
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  uint64_t v10 = MEMORY[0x270FA5388](v7, v8, v9);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13, v14);
  unint64_t v16 = (char *)&v46 - v15;
  sub_21BD2D1B4(0, (unint64_t *)&qword_26AAF2DD0, MEMORY[0x263F8F520]);
  uint64_t v18 = OUTLINED_FUNCTION_21_0(v17);
  MEMORY[0x270FA5388](v18, v19, v20);
  uint64_t v22 = (char *)&v46 - v21;
  if (v2[29])
  {
    sub_21BEA9AD8();
    id v23 = a1;
    swift_retain_n();
    id v24 = v23;
    uint64_t v25 = sub_21BEA9B08();
    os_log_type_t v26 = sub_21BEAA6C8();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v48 = v6;
      uint64_t v28 = v27;
      uint64_t v46 = swift_slowAlloc();
      uint64_t v51 = v46;
      *(_DWORD *)uint64_t v28 = 136315651;
      unint64_t v29 = v2[29];
      uint64_t v49 = v2[28];
      unint64_t v50 = v29;
      sub_21BC42220(v49, v29);
      uint64_t v30 = sub_21BEAA1E8();
      uint64_t v47 = v4;
      uint64_t v49 = sub_21BCC7B5C(v30, v31, &v51);
      sub_21BEAAA78();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v28 + 12) = 2160;
      OUTLINED_FUNCTION_11_27();
      uint64_t v49 = v32;
      sub_21BEAAA78();
      *(_WORD *)(v28 + 22) = 2081;
      uint64_t v49 = (uint64_t)a1;
      sub_21BD2D1B4(0, &qword_267C65540, (void (*)(uint64_t))type metadata accessor for PodcastAVItem);
      uint64_t v33 = sub_21BEAAA58();
      uint64_t v49 = sub_21BCC7B5C(v33, v34, &v51);
      sub_21BEAAA78();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21BB87000, v25, v26, "[FullAlignmentTask]: Ignoring start processing request. State: %s, Episode: %{private,mask.hash}s", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();

      return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v12, v47);
    }
    else
    {
      swift_release_n();

      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v12, v4);
    }
  }
  else if (a1 && (uint64_t v36 = sub_21BD239D4(a1), v37))
  {
    sub_21BD2ABC4(v36, v37);
    uint64_t v38 = sub_21BEAA418();
    __swift_storeEnumTagSinglePayload((uint64_t)v22, 1, 1, v38);
    uint64_t v40 = sub_21BD2CE6C(&qword_267C65530, v39, (void (*)(uint64_t))type metadata accessor for FullAlignmentTask);
    int v41 = (void *)swift_allocObject();
    v41[2] = v2;
    v41[3] = v40;
    v41[4] = a1;
    v41[5] = v2;
    swift_retain_n();
    id v42 = a1;
    v2[27] = sub_21BC35030((uint64_t)v22, (uint64_t)&unk_267C65550, (uint64_t)v41);
    return swift_release();
  }
  else
  {
    sub_21BEA9AD8();
    int v43 = sub_21BEA9B08();
    os_log_type_t v44 = sub_21BEAA6C8();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_21BB87000, v43, v44, "[FullAlignmentTask]: Ignoring start processing request. Content item ID is not valid.", v45, 2u);
      OUTLINED_FUNCTION_2_0();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v16, v4);
  }
}

uint64_t sub_21BD2B098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  uint64_t v7 = sub_21BEA9B18();
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21BD2B16C, a5, 0);
}

uint64_t sub_21BD2B16C()
{
  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[7];
  sub_21BEA9AD8();
  id v2 = v1;
  uint64_t v3 = sub_21BEA9B08();
  os_log_type_t v4 = sub_21BEAA6C8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v16 = v0[10];
    uint64_t v17 = v0[9];
    uint64_t v18 = v0[12];
    uint64_t v5 = v0[7];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 141558275;
    OUTLINED_FUNCTION_11_27();
    v0[4] = v7;
    sub_21BEAAA78();
    *(_WORD *)(v6 + 12) = 2081;
    v0[5] = v5;
    sub_21BD2D1B4(0, &qword_267C65540, (void (*)(uint64_t))type metadata accessor for PodcastAVItem);
    uint64_t v8 = sub_21BEAAA58();
    v0[6] = sub_21BCC7B5C(v8, v9, &v20);
    sub_21BEAAA78();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21BB87000, v3, v4, "[FullAlignmentTask]: Begin processing full alignment for episode: %{private,mask.hash}s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v10(v18, v17);
  }
  else
  {
    uint64_t v11 = v0[12];
    uint64_t v12 = v0[9];
    uint64_t v13 = v0[10];

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v10(v11, v12);
  }
  v0[13] = v10;
  uint64_t v19 = (uint64_t (__cdecl *)())((char *)&dword_267C637E8 + dword_267C637E8);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[14] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_21BD2B3E4;
  return v19();
}

uint64_t sub_21BD2B3E4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 64);
  if (v0) {
    os_log_type_t v4 = sub_21BD2B570;
  }
  else {
    os_log_type_t v4 = sub_21BD2B510;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_21BD2B510()
{
  OUTLINED_FUNCTION_13();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v0();
}

uint64_t sub_21BD2B570()
{
  uint64_t v1 = *(void **)(v0 + 120);
  sub_21BEA9AD8();
  id v2 = v1;
  id v3 = v1;
  os_log_type_t v4 = sub_21BEA9B08();
  os_log_type_t v5 = sub_21BEAA6B8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 120);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    OUTLINED_FUNCTION_11_27();
    *(void *)(v0 + 16) = v9;
    *(_DWORD *)uint64_t v7 = 141558275;
    sub_21BEAAA78();
    *(_WORD *)(v7 + 12) = 2113;
    id v10 = v6;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v11;
    sub_21BEAAA78();
    *uint64_t v8 = v11;

    _os_log_impl(&dword_21BB87000, v4, v5, "[FullAlignmentTask]: Error processing full alignment: %{private,mask.hash}@", (uint8_t *)v7, 0x16u);
    sub_21BD2CF44(0, (unint64_t *)&qword_26AAF38F0, (uint64_t)&qword_26AAF38E0, 0x263F8C6D0, (void (*)(uint64_t, uint64_t, uint64_t))sub_21BC0BE78);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 120);
  }
  (*(void (**)(void, void))(v0 + 104))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v13();
}

uint64_t sub_21BD2B79C()
{
  swift_beginAccess();
  sub_21BD2D09C(v0 + 176, (uint64_t)v3);
  if (!v4) {
    return sub_21BD2D12C((uint64_t)v3);
  }
  sub_21BC32D00((uint64_t)v3, (uint64_t)v2);
  sub_21BD2D12C((uint64_t)v3);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  OUTLINED_FUNCTION_90();
  sub_21BEA96C8();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
}

uint64_t sub_21BD2B838()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21BEA9B18();
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5, v6, v7);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BEA9AD8();
  id v10 = sub_21BEA9B08();
  os_log_type_t v11 = sub_21BEAA6C8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21BB87000, v10, v11, "[FullAlignmentTask]: Reset request. Cleaning up.", v12, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v2);
  swift_beginAccess();
  sub_21BD2D09C(v1 + 176, (uint64_t)&v15);
  if (*((void *)&v16 + 1))
  {
    sub_21BC32D00((uint64_t)&v15, (uint64_t)v14);
    sub_21BD2D12C((uint64_t)&v15);
    __swift_project_boxed_opaque_existential_0Tm(v14, v14[3]);
    sub_21BEA96B8();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
  }
  else
  {
    sub_21BD2D12C((uint64_t)&v15);
  }
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  swift_beginAccess();
  sub_21BD2CFA0((uint64_t)&v15, v1 + 176);
  swift_endAccess();
  if (*(void *)(v1 + 216))
  {
    sub_21BC1FB08(0, (unint64_t *)&qword_26AAF30C0);
    swift_retain();
    sub_21BEAA4B8();
    swift_release();
  }
  *(void *)(v1 + 216) = 0;
  swift_release();
  return sub_21BD2ABC4(0, 0);
}

uint64_t sub_21BD2BA68()
{
  OUTLINED_FUNCTION_13();
  v1[32] = v2;
  v1[33] = v0;
  v1[30] = v3;
  v1[31] = v4;
  sub_21BD2CD64(0, &qword_267C654F0, MEMORY[0x263EFDDC8]);
  v1[34] = v5;
  OUTLINED_FUNCTION_1_0(v5);
  v1[35] = v6;
  v1[36] = OUTLINED_FUNCTION_9_10();
  sub_21BD2CD64(0, &qword_267C65508, MEMORY[0x263EFDDB8]);
  v1[37] = v7;
  OUTLINED_FUNCTION_1_0(v7);
  v1[38] = v8;
  v1[39] = OUTLINED_FUNCTION_9_10();
  uint64_t v9 = sub_21BEA9AC8();
  OUTLINED_FUNCTION_21_0(v9);
  v1[40] = OUTLINED_FUNCTION_9_10();
  uint64_t v10 = sub_21BEA9B18();
  v1[41] = v10;
  OUTLINED_FUNCTION_1_0(v10);
  v1[42] = v11;
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  sub_21BD2CE04();
  OUTLINED_FUNCTION_21_0(v12);
  v1[45] = OUTLINED_FUNCTION_9_10();
  return MEMORY[0x270FA2498](sub_21BD2BBEC, v0, 0);
}

uint64_t sub_21BD2BBEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (sub_21BD2C630(*(void **)(v10 + 240)))
  {
    uint64_t v33 = *(void *)(v10 + 280);
    uint64_t v11 = *(void *)(v10 + 264);
    uint64_t v32 = *(void *)(v10 + 272);
    uint64_t v12 = *(void **)(v10 + 248);
    uint64_t v31 = *(void *)(v10 + 288);
    uint64_t v13 = *(void **)(v10 + 240);
    *(void *)(v10 + 232) = *(void *)(v11 + 168);
    sub_21BC42464();
    sub_21BD2CE6C(&qword_267C65518, 255, (void (*)(uint64_t))sub_21BC42464);
    v12;
    sub_21BEA9518();
    objc_msgSend(v13, sel_storeItemInt64ID);
    sub_21BEA9A78();
    swift_unknownObjectRetain();
    sub_21BEA9AF8();
    sub_21BEA9AB8();
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2E50);
    sub_21BEAA6F8();
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F5EA30]), sel_init);
    uint64_t v14 = sub_21BEA9958();
    swift_allocObject();
    uint64_t v15 = sub_21BEA9948();
    uint64_t v16 = MEMORY[0x263F5E948];
    *(void *)(v10 + 368) = v15;
    *(void *)(v10 + 80) = v14;
    *(void *)(v10 + 88) = v16;
    *(void *)(v10 + 56) = v15;
    sub_21BD2CEB4(v10 + 56, v10 + 96);
    swift_beginAccess();
    swift_retain();
    sub_21BD2CFA0(v10 + 96, v11 + 176);
    swift_endAccess();
    *(void *)(v10 + 200) = sub_21BEA9938();
    sub_21BD2CCD4();
    uint64_t v18 = v17;
    uint64_t v19 = sub_21BD2CE6C(&qword_267C65500, 255, (void (*)(uint64_t))sub_21BD2CCD4);
    MEMORY[0x21D49B580](v18, v19);
    swift_release();
    sub_21BEA9CC8();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
    *(void *)(v10 + 376) = sub_21BD2CE6C(&qword_267C65530, v20, (void (*)(uint64_t))type metadata accessor for FullAlignmentTask);
    unint64_t v21 = sub_21BD2D030();
    uint64_t v27 = (void *)swift_task_alloc();
    *(void *)(v10 + 384) = v27;
    void *v27 = v10;
    v27[1] = sub_21BD2BFD4;
    uint64_t v28 = *(void *)(v10 + 296);
    return MEMORY[0x270FA1E80](v10 + 16, v28, v21, v22, v23, v24, v25, v26, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_13_24();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_7_0();
    return v29();
  }
}

uint64_t sub_21BD2BFD4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  OUTLINED_FUNCTION_1_1();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 392) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v2 + 264);
  if (v0)
  {
    if (v5)
    {
      swift_getObjectType();
      uint64_t v6 = sub_21BEAA388();
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v8 = 0;
    }
    uint64_t v9 = sub_21BD2C4CC;
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v9 = sub_21BD2C138;
    uint64_t v10 = v5;
    uint64_t v8 = 0;
  }
  return MEMORY[0x270FA2498](v9, v10, v8);
}

uint64_t sub_21BD2C138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v46 = v10;
  if (*(void *)(v10 + 40))
  {
    sub_21BC32CE8((long long *)(v10 + 16), v10 + 136);
    uint64_t v11 = OUTLINED_FUNCTION_90();
    sub_21BD2C6EC(v11, v12);
    __swift_destroy_boxed_opaque_existential_0Tm(v10 + 136);
    unint64_t v13 = sub_21BD2D030();
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v10 + 384) = v19;
    *uint64_t v19 = v10;
    v19[1] = sub_21BD2BFD4;
    uint64_t v20 = *(void *)(v10 + 296);
    return MEMORY[0x270FA1E80](v10 + 16, v20, v13, v14, v15, v16, v17, v18, a9, a10);
  }
  unint64_t v21 = *(void **)(v10 + 240);
  (*(void (**)(void, void))(*(void *)(v10 + 304) + 8))(*(void *)(v10 + 312), *(void *)(v10 + 296));
  if (!sub_21BD2C630(v21)) {
    goto LABEL_12;
  }
  uint64_t v22 = *(void *)(v10 + 392);
  sub_21BEAA4F8();
  if (!v22)
  {
    uint64_t v24 = *(void **)(v10 + 240);
    sub_21BEA9AD8();
    id v25 = v24;
    uint64_t v26 = sub_21BEA9B08();
    os_log_type_t v27 = sub_21BEAA6C8();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v30 = *(void *)(v10 + 336);
    uint64_t v29 = *(void *)(v10 + 344);
    uint64_t v31 = *(void *)(v10 + 328);
    uint64_t v32 = *(void **)(v10 + 240);
    if (v28)
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 141558275;
      OUTLINED_FUNCTION_11_27();
      *(void *)(v10 + 216) = v34;
      sub_21BEAAA78();
      *(_WORD *)(v33 + 12) = 2081;
      uint64_t v44 = v29;
      id v35 = objc_msgSend(v32, sel_debugDescription);
      uint64_t v43 = v31;
      uint64_t v36 = sub_21BEAA178();
      unint64_t v38 = v37;

      *(void *)(v10 + 224) = sub_21BCC7B5C(v36, v38, &v45);
      sub_21BEAAA78();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21BB87000, v26, v27, "[FullAlignmentTask]: Completed transcripts processing for episode: %{private,mask.hash}s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();

      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v44, v43);
    }
    else
    {

      uint64_t v39 = OUTLINED_FUNCTION_90();
      v41(v39, v40);
    }
    sub_21BD2ABC4(0, 1);
LABEL_12:
    swift_release();
    OUTLINED_FUNCTION_13_24();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_7_0();
    goto LABEL_13;
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
LABEL_13:
  return v23();
}

uint64_t sub_21BD2C4CC()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = v0[33];
  v0[26] = v0[49];
  sub_21BC1FB08(0, (unint64_t *)&qword_26AAF30C0);
  swift_willThrowTypedImpl();
  return MEMORY[0x270FA2498](sub_21BD2C564, v1, 0);
}

uint64_t sub_21BD2C564()
{
  uint64_t v2 = v0[38];
  uint64_t v1 = v0[39];
  uint64_t v3 = v0[37];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v4();
}

BOOL sub_21BD2C630(void *a1)
{
  unint64_t v2 = *(void *)(v1 + 232);
  if (v2 < 2) {
    return 0;
  }
  uint64_t v4 = *(void *)(v1 + 224);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21BD239D4(a1);
  if (!v6)
  {
    sub_21BC42234(v4, v2);
    return 0;
  }
  if (v5 != v4 || v6 != v2)
  {
    char v8 = sub_21BEAAE78();
    sub_21BC42234(v4, v2);
    swift_bridgeObjectRelease();
    return (v8 & 1) != 0;
  }
  sub_21BC42234(v4, v2);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_21BD2C6EC(uint64_t a1, void *a2)
{
  sub_21BD2D1B4(0, (unint64_t *)&qword_26AAF2DD0, MEMORY[0x263F8F520]);
  uint64_t v5 = OUTLINED_FUNCTION_21_0(v4);
  MEMORY[0x270FA5388](v5, v6, v7);
  uint64_t v9 = &v18[-v8 - 8];
  sub_21BC32D00(a1, (uint64_t)v18);
  sub_21BC1FB08(0, &qword_267C654D8);
  sub_21BEA9A48();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v11 = v17;
    uint64_t v12 = sub_21BEAA418();
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v12);
    sub_21BEAA3F8();
    id v13 = a2;
    swift_retain();
    uint64_t v14 = sub_21BEAA3E8();
    uint64_t v15 = (void *)swift_allocObject();
    uint64_t v16 = MEMORY[0x263F8F500];
    v15[2] = v14;
    void v15[3] = v16;
    v15[4] = v13;
    v15[5] = v11;
    sub_21BC397EC((uint64_t)v9, (uint64_t)&unk_267C654E8, (uint64_t)v15);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_21BD2C864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_21BEAA3F8();
  v5[4] = sub_21BEAA3E8();
  uint64_t v7 = sub_21BEAA388();
  return MEMORY[0x270FA2498](sub_21BD2C8FC, v7, v6);
}

uint64_t sub_21BD2C8FC()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  uint64_t v0 = sub_21BD2C964();
  sub_21BCA4558(v0);
  OUTLINED_FUNCTION_6_0();
  return v1();
}

uint64_t sub_21BD2C964()
{
  uint64_t v0 = sub_21BEA9A08();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2, v3);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = sub_21BEA9A38();
  char v7 = sub_21BEA9A28();
  uint64_t v8 = sub_21BEA9A18();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_21BEAACD8();
    uint64_t v10 = v1 + 16;
    os_log_type_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    uint64_t v28 = v1 + 16;
    uint64_t v11 = *(unsigned __int8 *)(v1 + 80);
    v25[1] = v8;
    uint64_t v12 = v8 + ((v11 + 32) & ~v11);
    id v13 = (void (**)(char *, uint64_t))(v1 + 8);
    uint64_t v26 = *(void *)(v10 + 56);
    uint64_t v14 = v6 & 1;
    uint64_t v15 = v7 & 1;
    do
    {
      v27(v5, v12, v0);
      sub_21BEA99E8();
      double v17 = v16;
      sub_21BEA99E8();
      double v19 = v18;
      sub_21BEA99F8();
      double v21 = v20;
      sub_21BEA99F8();
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F12138]), sel_initWithPlayerStartTime_playerEndTime_referenceStartTime_referenceEndTime_matchedBeginning_matchedEnd_, v14, v15, v17, v19, v21, v22);
      (*v13)(v5, v0);
      sub_21BEAACB8();
      sub_21BEAACE8();
      sub_21BEAACF8();
      sub_21BEAACC8();
      v12 += v26;
      --v9;
    }
    while (v9);
    uint64_t v23 = v29;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v23;
}

uint64_t sub_21BD2CB84()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 112);
  swift_unknownObjectRelease();
  swift_release();
  sub_21BD2D12C(v0 + 176);
  swift_release();
  sub_21BC42234(*(void *)(v0 + 224), *(void *)(v0 + 232));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_21BD2CBD4()
{
  sub_21BD2CB84();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for FullAlignmentTask()
{
  return self;
}

uint64_t sub_21BD2CC28()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21BC41AB8;
  uint64_t v2 = OUTLINED_FUNCTION_9_7();
  return sub_21BD2C864(v2, v3, v4, v5, v6);
}

void sub_21BD2CCD4()
{
  if (!qword_267C654F8)
  {
    sub_21BC1FB08(255, &qword_267C654D8);
    sub_21BC1FB08(255, (unint64_t *)&qword_26AAF30C0);
    unint64_t v0 = sub_21BEA9C58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C654F8);
    }
  }
}

void sub_21BD2CD64(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_21BD2CCD4();
    uint64_t v7 = v6;
    uint64_t v8 = sub_21BD2CE6C(&qword_267C65500, 255, (void (*)(uint64_t))sub_21BD2CCD4);
    unint64_t v9 = a3(a1, v7, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_21BD2CE04()
{
  if (!qword_267C65510)
  {
    sub_21BEA96D8();
    sub_21BEA9A48();
    unint64_t v0 = sub_21BEA95B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C65510);
    }
  }
}

uint64_t sub_21BD2CE6C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21BD2CEB4(uint64_t a1, uint64_t a2)
{
  sub_21BD2CF44(0, &qword_267C65520, (uint64_t)&unk_267C65528, MEMORY[0x263F5E8B0], (void (*)(uint64_t, uint64_t, uint64_t))sub_21BC1FB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21BD2CF44(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    a5(255, a3, a4);
    unint64_t v6 = sub_21BEAAA68();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_21BD2CFA0(uint64_t a1, uint64_t a2)
{
  sub_21BD2CF44(0, &qword_267C65520, (uint64_t)&unk_267C65528, MEMORY[0x263F5E8B0], (void (*)(uint64_t, uint64_t, uint64_t))sub_21BC1FB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_21BD2D030()
{
  unint64_t result = qword_267C65538;
  if (!qword_267C65538)
  {
    sub_21BD2CD64(255, &qword_267C65508, MEMORY[0x263EFDDB8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C65538);
  }
  return result;
}

uint64_t sub_21BD2D09C(uint64_t a1, uint64_t a2)
{
  sub_21BD2CF44(0, &qword_267C65520, (uint64_t)&unk_267C65528, MEMORY[0x263F5E8B0], (void (*)(uint64_t, uint64_t, uint64_t))sub_21BC1FB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD2D12C(uint64_t a1)
{
  sub_21BD2CF44(0, &qword_267C65520, (uint64_t)&unk_267C65528, MEMORY[0x263F5E8B0], (void (*)(uint64_t, uint64_t, uint64_t))sub_21BC1FB08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_21BD2D1B4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_21BEAAA68();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t objectdestroyTm_3()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21BD2D254()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21BC41AB8;
  uint64_t v2 = OUTLINED_FUNCTION_9_7();
  return sub_21BD2B098(v2, v3, v4, v5, v6);
}

uint64_t sub_21BD2D300(double a1)
{
  if (a1 == INFINITY)
  {
    uint64_t v1 = MEMORY[0x263F010B8];
  }
  else if (a1 == -INFINITY)
  {
    uint64_t v1 = MEMORY[0x263F010A0];
  }
  else
  {
    if (a1 != 0.0) {
      return sub_21BEAA938();
    }
    uint64_t v1 = MEMORY[0x263F010E0];
  }
  return *(void *)v1;
}

uint64_t sub_21BD2D380(uint64_t a1, char a2, uint64_t a3, char a4, char a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 96) = a1;
  *(unsigned char *)(v10 + 104) = a2;
  sub_21BD2D3F0(a3, a4, a5);
  return v10;
}

uint64_t sub_21BD2D3F0(uint64_t a1, char a2, char a3)
{
  *(void *)(v3 + 64) = 0;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 72) = xmmword_21BEEB420;
  sub_21BD2E904(a1, v3 + 16);
  swift_retain();
  sub_21BC0246C(0, 0, 0, 0, 0, 0, 0, 0x1FFFFFFFEuLL, 0);
  *(unsigned char *)(v3 + 88) = a2;
  *(unsigned char *)(v3 + 89) = a3;
  swift_release();
  return v3;
}

uint64_t sub_21BD2D48C(uint64_t a1)
{
  sub_21BC43614(a1, (uint64_t)v8);
  int v2 = v9;
  int v3 = v8[24];
  sub_21BC43614(a1, (uint64_t)v10);
  int v4 = v11 | (v12 << 16);
  LOBYTE(v5) = 1;
  switch(v12 >> 4)
  {
    case 2:
      unsigned __int8 v12 = BYTE2(v4) & 0xF;
      LOBYTE(v5) = sub_21BD2D5A4();
      break;
    case 3:
      unsigned __int8 v12 = BYTE2(v4) & 0xF;
      LOBYTE(v5) = sub_21BD2E520((void (*)(void))type metadata accessor for PausedState);
      break;
    case 4:
    case 10:
      return v5 & 1;
    default:
      unsigned int v6 = ((v3 | (v2 << 16)) >> 20) & 0xF;
      if (v6 > 0xC) {
        LOBYTE(v5) = 0;
      }
      else {
        unsigned int v5 = (0x1A81u >> v6) & 1;
      }
      break;
  }
  return v5 & 1;
}

uint64_t sub_21BD2D5A4()
{
  sub_21BC9531C();
  type metadata accessor for PlayingState();
  uint64_t v0 = swift_dynamicCastClass();
  swift_release();
  if (v0) {
    return 1;
  }
  sub_21BC9531C();
  type metadata accessor for InitiatingPlaybackState();
  uint64_t v1 = swift_dynamicCastClass();
  swift_release();
  if (v1) {
    return 1;
  }
  sub_21BC9531C();
  type metadata accessor for InitialLoadingState();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4) {
    uint64_t v2 = *(unsigned __int8 *)(v4 + 64);
  }
  else {
    uint64_t v2 = 0;
  }
  swift_release();
  return v2;
}

uint64_t sub_21BD2D660(uint64_t *a1)
{
  uint64_t v2 = v1 + 16;
  unint64_t v3 = *(void *)(v1 + 72);
  uint64_t v4 = *(void *)(v1 + 80);
  sub_21BD2E904((uint64_t)a1, v2);
  uint64_t v6 = OUTLINED_FUNCTION_3_33();
  sub_21BC019F0(v6, v7, v8, v9, v10, v11, v12, v13, v4);
  sub_21BD2E9B4(a1);
  uint64_t result = OUTLINED_FUNCTION_0_46();
  if (v3 >> 1 != 0xFFFFFFFF || (v4 & 3) != 0)
  {
    if ((v4 & 3) == 0)
    {
      uint64_t v16 = OUTLINED_FUNCTION_3_33();
      sub_21BD2E9FC(v16, v17, v18, v19, v20, v21, v22, v23, v4, (uint64_t (*)(void))sub_21BC01564, (uint64_t (*)(uint64_t))sub_21BC01680, (uint64_t (*)(void))sub_21BC018D8, (uint64_t (*)(void))sub_21BC018F4);
      sub_21BD46D94();
      OUTLINED_FUNCTION_0_46();
    }
    return OUTLINED_FUNCTION_0_46();
  }
  return result;
}

uint64_t sub_21BD2D77C(uint64_t a1)
{
  sub_21BC43614(a1, (uint64_t)v16);
  uint64_t v2 = (void *)v16[1];
  uint64_t v3 = v16[3];
  uint64_t v4 = v16[4];
  sub_21BC43614(a1, (uint64_t)&v17);
  int v5 = v23 | (v24 << 16);
  switch(v24 >> 4)
  {
    case 2:
      OUTLINED_FUNCTION_9_28();
      if (sub_21BD2E520((void (*)(void))type metadata accessor for PausedState))
      {
        OUTLINED_FUNCTION_7_29();
        swift_bridgeObjectRetain();
        sub_21BC01660(v3);
        sub_21BD2D660(v25);
        sub_21BD2EA64(a1);
      }
      else if (sub_21BD2D5A4())
      {
        OUTLINED_FUNCTION_11_28();
        long long v28 = xmmword_21BEEB420;
        sub_21BD2D660(v25);
      }
      sub_21BD46D94();
      goto LABEL_20;
    case 3:
      unsigned __int8 v24 = BYTE2(v5) & 0xF;
      uint64_t v7 = v21;
      if ((unint64_t)v18 >= 0xB)
      {
        double v12 = v17;
        if (HIBYTE(v23)) {
          __int16 v13 = 256;
        }
        else {
          __int16 v13 = 0;
        }
        v25[0] = v19;
        v25[1] = v20;
        void v25[2] = v21;
        void v25[3] = v22;
        BOOL v27 = v24 != 0;
        __int16 v26 = v13 & 0xFFFE | v5 & 1;
        uint64_t v8 = v21;
        id v9 = v18;
        type metadata accessor for PausedState();
        swift_allocObject();
        sub_21BC01670(v9);
        swift_bridgeObjectRetain();
        sub_21BC01660(v8);
        sub_21BC01670(v9);
        swift_bridgeObjectRetain();
        sub_21BC01660(v8);
        sub_21BC932E8(0, (uint64_t)v9, (uint64_t)v25, v12);
        sub_21BC94C4C();
        swift_release();
      }
      else
      {
        id v15 = v18;
        sub_21BC01670(v18);
        swift_bridgeObjectRetain();
        sub_21BC01660(v7);
        if (sub_21BD2D5A4())
        {
          OUTLINED_FUNCTION_7_29();
          sub_21BC01670(v2);
          swift_bridgeObjectRetain();
          sub_21BC01660(v4);
          sub_21BD2D660(v25);
          sub_21BD2EA64(a1);
          uint64_t v8 = v7;
          id v9 = v15;
        }
        else
        {
          uint64_t v8 = v7;
          id v9 = v15;
          if (sub_21BD2E520((void (*)(void))type metadata accessor for PausedState))
          {
            OUTLINED_FUNCTION_11_28();
            long long v28 = xmmword_21BEEB420;
            sub_21BD2D660(v25);
          }
        }
      }
      sub_21BD46D94();
      sub_21BC020C8(v9);
      swift_bridgeObjectRelease();
      uint64_t v11 = v8;
      goto LABEL_19;
    case 4:
      OUTLINED_FUNCTION_9_28();
      uint64_t v6 = v20;
      OUTLINED_FUNCTION_2_36();
      sub_21BC01660(v6);
      sub_21BC9498C();
      goto LABEL_10;
    case 10:
      OUTLINED_FUNCTION_9_28();
      uint64_t v6 = v20;
      OUTLINED_FUNCTION_2_36();
      sub_21BC01660(v6);
      sub_21BC96588();
LABEL_10:
      sub_21BD46D94();
      swift_bridgeObjectRelease();
      uint64_t v11 = v6;
LABEL_19:
      sub_21BC020B8(v11);
LABEL_20:
      char v10 = 1;
      break;
    default:
      char v10 = sub_21BD468E8(a1);
      break;
  }
  return v10 & 1;
}

uint64_t sub_21BD2DB94(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_21BC331A0(a1, (uint64_t)v131);
  uint64_t v4 = (void *)v131[1];
  sub_21BC331A0(a1, (uint64_t)&v132);
  int v5 = (v133 >> 59) & 0x1E | (v133 >> 2) & 1;
  if (v5 == 3)
  {
    OUTLINED_FUNCTION_10_25();
    swift_unknownObjectRetain();
    sub_21BC94F44();
    unint64_t v10 = *(void *)(v1 + 16);
    uint64_t v11 = *(void **)(v1 + 24);
    uint64_t v13 = *(void *)(v1 + 32);
    unint64_t v12 = *(void *)(v1 + 40);
    uint64_t v15 = *(void *)(v1 + 48);
    uint64_t v14 = *(void *)(v1 + 56);
    uint64_t v16 = *(void *)(v1 + 64);
    unint64_t v17 = *(void *)(v1 + 72);
    uint64_t v18 = *(void *)(v1 + 80);
    if (v17 >> 1 != 0xFFFFFFFF || (v18 & 3) != 0)
    {
      if ((v18 & 3) == 3)
      {
        if (v12 >> 61 == 1)
        {
          uint64_t v103 = *(void *)(v1 + 80);
          uint64_t v56 = OUTLINED_FUNCTION_4_33();
          sub_21BC019F0(v56, v57, v58, v59, v60, v62, v61, v17, v103);
          OUTLINED_FUNCTION_5_27();
          sub_21BD2E9FC(v63, v64, v65, v66, v123, v124, v127, v17, v18, (uint64_t (*)(void))sub_21BC01564, (uint64_t (*)(uint64_t))sub_21BC01680, (uint64_t (*)(void))sub_21BC018D8, (uint64_t (*)(void))sub_21BC018F4);
          sub_21BD2E9FC(v129, (uint64_t)v11, v13, v12, v123, v124, v127, v17, v18, (uint64_t (*)(void))sub_21BC01564, (uint64_t (*)(uint64_t))sub_21BC01680, (uint64_t (*)(void))sub_21BC018D8, (uint64_t (*)(void))sub_21BC018F4);
          swift_release();
          swift_bridgeObjectRelease();
          sub_21BC94FAC();
          type metadata accessor for InitiatingPlaybackState();
          memset(v137, 0, 35);
          swift_allocObject();
          char v6 = 1;
          sub_21BCBF4EC(1, (uint64_t)v137);
          sub_21BC94C4C();
          sub_21BC0246C(v129, (uint64_t)v11, v13, v12, v123, v124, v127, v17, v18);
          swift_unknownObjectRelease();
          sub_21BC0246C(v129, (uint64_t)v11, v13, v12, v123, v124, v127, v17, v18);
          goto LABEL_5;
        }
      }
      else if ((v18 & 3) == 0)
      {
        unsigned int v19 = (v16 >> 20) & 0xF;
        if (v19 == 2)
        {
          uint64_t v120 = HIDWORD(v10) & 1;
          v137[0] = *(void *)(v1 + 24);
          v137[1] = v13;
          v137[2] = v12;
          v137[3] = v15;
          LOWORD(v137[4]) = v14 & 0x101;
          LODWORD(v118) = WORD1(v14) & 1;
          BYTE2(v137[4]) = BYTE2(v14) & 1;
          uint64_t v75 = OUTLINED_FUNCTION_4_33();
          uint64_t v77 = v76;
          sub_21BD2E9FC(v75, v78, v79, v80, v81, v76, v82, v17, v18, (uint64_t (*)(void))sub_21BC01564, (uint64_t (*)(uint64_t))sub_21BC01680, (uint64_t (*)(void))sub_21BC018D8, (uint64_t (*)(void))sub_21BC018F4);
          OUTLINED_FUNCTION_5_27();
          sub_21BD2E9FC(v83, v84, v85, v86, v123, v77, v127, v17, v18, (uint64_t (*)(void))sub_21BC01564, (uint64_t (*)(uint64_t))sub_21BC01680, (uint64_t (*)(void))sub_21BC018D8, (uint64_t (*)(void))sub_21BC018F4);
          sub_21BC9498C();
          v134[0] = v11;
          v134[1] = v13;
          v134[2] = v12;
          v134[3] = v123;
          char v136 = v118;
          __int16 v135 = v77 & 0x101;
          type metadata accessor for InitiatingPlaybackState();
          swift_allocObject();
          swift_bridgeObjectRetain();
          sub_21BC01660(v12);
          sub_21BCBF4EC(v120, (uint64_t)v134);
          sub_21BC94C4C();
          swift_bridgeObjectRelease();
          sub_21BC020B8(v12);
          uint64_t v87 = swift_unknownObjectRelease();
          uint64_t v95 = OUTLINED_FUNCTION_6_32(v87, v88, v89, v90, v91, v92, v93, v94, v104, v107, v109, v111, v113, v114, (uint64_t)sub_21BC01680, (uint64_t)sub_21BC018D8, (uint64_t)sub_21BC018F4, v118, v120,
                  v121,
                  v122,
                  v123,
                  v124,
                  v127,
                  v129);
          sub_21BC0246C(v95, v96, v97, v98, v99, v126, v100, v17, v105);
          goto LABEL_42;
        }
        if (v19 == 3)
        {
          double v20 = *(double *)(v1 + 16);
          v137[0] = *(void *)(v1 + 32);
          v137[1] = v12;
          v137[2] = v15;
          v137[3] = v14;
          BYTE2(v137[4]) = BYTE2(v16) & 1;
          LOWORD(v137[4]) = v16 & 0x101;
          uint64_t v128 = v16;
          uint64_t v130 = v10;
          uint64_t v21 = v16;
          uint64_t v125 = v14;
          uint64_t v22 = v15;
          type metadata accessor for PausedState();
          swift_allocObject();
          OUTLINED_FUNCTION_5_27();
          uint64_t v23 = v22;
          uint64_t v24 = v22;
          uint64_t v25 = v125;
          sub_21BC019F0(v26, v27, v28, v29, v23, v125, v21, v17, v18);
          OUTLINED_FUNCTION_5_27();
          sub_21BC019F0(v30, v31, v32, v33, v24, v125, v21, v17, v18);
          sub_21BC01670(v11);
          swift_bridgeObjectRetain();
          sub_21BC01660(v24);
          uint64_t v119 = sub_21BC932E8(0, (uint64_t)v11, (uint64_t)v137, v20);
          sub_21BC94C4C();
          sub_21BC020C8(v11);
          swift_bridgeObjectRelease();
          sub_21BC020B8(v24);
          uint64_t v34 = swift_unknownObjectRelease();
          uint64_t v42 = OUTLINED_FUNCTION_6_32(v34, v35, v36, v37, v38, v39, v40, v41, v101, v106, v108, v110, v112, v114, v115, v116, v117, v118, v119,
                  v121,
                  v122,
                  v123,
                  v125,
                  v128,
                  v130);
          sub_21BC0246C(v42, v43, v44, v45, v46, v25, v47, v17, v102);
LABEL_42:
          swift_release();
          goto LABEL_39;
        }
      }
    }
    sub_21BC9531C();
    type metadata accessor for PlayingState();
    uint64_t v67 = swift_dynamicCastClass();
    if (v67 && (uint64_t v68 = v67, (sub_21BC969A4() & 1) != 0))
    {
      uint64_t v70 = *(void *)(v68 + 24);
      uint64_t v69 = *(void *)(v68 + 32);
      swift_getObjectType();
      swift_bridgeObjectRetain();
      uint64_t v71 = sub_21BD0BE74();
      if (v69)
      {
        if (v70 != v71 || v69 != v72) {
          sub_21BEAAE78();
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_21BC953D0();
      type metadata accessor for StallingState();
      swift_allocObject();
      sub_21BC94A2C();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      sub_21BC953D0();
    }
LABEL_38:
    swift_unknownObjectRelease();
LABEL_39:
    char v6 = 1;
    return v6 & 1;
  }
  if (v5 == 19)
  {
    OUTLINED_FUNCTION_10_25();
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v48 = sub_21BD0BE74();
    uint64_t v50 = v49;
    if (!sub_21BC95148())
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    swift_getObjectType();
    uint64_t v51 = sub_21BD0BE74();
    uint64_t v53 = v52;
    swift_unknownObjectRelease();
    if (v48 == v51 && v50 == v53)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v55 = sub_21BEAAE78();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v55 & 1) == 0)
      {
        swift_unknownObjectRelease();
        goto LABEL_21;
      }
    }
    sub_21BC94F44();
    goto LABEL_38;
  }
  if (v5 != 5)
  {
LABEL_21:
    char v6 = sub_21BD46B0C(a1);
    return v6 & 1;
  }
  OUTLINED_FUNCTION_10_25();
  sub_21BC94F44();
  char v6 = 1;
  sub_21BC953D0();
  char v7 = *(unsigned char *)(v1 + 88);
  char v8 = *(unsigned char *)(v2 + 89);
  type metadata accessor for ErrorResolutionState();
  swift_allocObject();
  sub_21BD29F64(a1, v7, v8, 1);
  swift_unknownObjectRetain();
  id v9 = v4;
  swift_retain();
  sub_21BC94A2C();
LABEL_5:
  swift_release();
  return v6 & 1;
}

uint64_t sub_21BD2E388(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v5 = v4;
  if (a4 >> 61 == 1)
  {
    if (sub_21BD2E520((void (*)(void))type metadata accessor for InterruptedState))
    {
      OUTLINED_FUNCTION_8_27();
      uint64_t v10 = v4[3];
      uint64_t v11 = v5[4];
      uint64_t v12 = v5[5];
      uint64_t v13 = v5[6];
      uint64_t v18 = v5[7];
      uint64_t v19 = v5[2];
      uint64_t v14 = v5[10];
      unint64_t v16 = v5[9];
      uint64_t v17 = v5[8];
      v5[2] = a1;
      v5[3] = a2;
      v5[4] = a3;
      v5[5] = a4;
      *((_OWORD *)v5 + 3) = 0u;
      *((_OWORD *)v5 + 4) = 0u;
      v5[10] = 3;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_21BC0246C(v19, v10, v11, v12, v13, v18, v17, v16, v14);
      return 1;
    }
  }
  else if (a4 >> 61 == 3)
  {
    OUTLINED_FUNCTION_8_27();
    if (a1)
    {
      type metadata accessor for PausedState();
      memset(v20, 0, 35);
      swift_allocObject();
      sub_21BC932E8(0, 4, (uint64_t)v20, 0.0);
      sub_21BC94C4C();
      swift_release();
    }
    return 1;
  }

  return sub_21BD46BBC(a1, a2, a3, a4);
}

BOOL sub_21BD2E520(void (*a1)(void))
{
  sub_21BC9531C();
  a1(0);
  BOOL v2 = swift_dynamicCastClass() != 0;
  swift_release();
  return v2;
}

unint64_t sub_21BD2E574()
{
  return OUTLINED_FUNCTION_5_23(18);
}

uint64_t sub_21BD2E58C()
{
  return OUTLINED_FUNCTION_1_38();
}

uint64_t sub_21BD2E5AC()
{
  OUTLINED_FUNCTION_1_38();

  return MEMORY[0x270FA0228](v0, 90, 7);
}

uint64_t type metadata accessor for ChangingQueueState()
{
  return self;
}

uint64_t sub_21BD2E60C()
{
  __src[0] = v0;
  sub_21BC43670((uint64_t)__src);
  sub_21BC02A04(__src, &v2);
  sub_21BC95184();
  return sub_21BC96DC8(*(unsigned __int8 *)(v0 + 90));
}

uint64_t sub_21BD2E668(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    sub_21BC953D0();
    sub_21BD2E904(v3 + 16, (uint64_t)v7);
    type metadata accessor for ResettingQueueState();
    *(unsigned char *)(swift_allocObject() + 90) = a1 & 1;
    sub_21BD2E9B4(v7);
    sub_21BD2D3F0((uint64_t)v7, 0, 0);
    sub_21BC94A2C();
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    type metadata accessor for EndOfQueueState();
    swift_bridgeObjectRetain();
    sub_21BCA20DC(a1, a2);
    sub_21BC94C4C();
LABEL_5:
    swift_release();
    return 1;
  }

  return sub_21BD46EC4(a1, a2, a3);
}

unint64_t sub_21BD2E788()
{
  return OUTLINED_FUNCTION_5_23(19);
}

uint64_t sub_21BD2E7A0()
{
  OUTLINED_FUNCTION_1_38();

  return MEMORY[0x270FA0228](v0, 91, 7);
}

uint64_t type metadata accessor for ResettingQueueState()
{
  return self;
}

void sub_21BD2E800()
{
  __src[0] = v0;
  sub_21BC43670((uint64_t)__src);
  sub_21BC02A04(__src, &v1);
  sub_21BC95184();
  sub_21BC96CF8();
}

unint64_t sub_21BD2E860()
{
  return OUTLINED_FUNCTION_5_23(24);
}

uint64_t sub_21BD2E878()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD2E880()
{
  OUTLINED_FUNCTION_1_38();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21BD2E8AC()
{
  sub_21BD2E880();

  return MEMORY[0x270FA0228](v0, 105, 7);
}

uint64_t type metadata accessor for ChangingCurrentItemState()
{
  return self;
}

uint64_t sub_21BD2E904(uint64_t a1, uint64_t a2)
{
  sub_21BD2E968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21BD2E968()
{
  if (!qword_26AAEF818)
  {
    unint64_t v0 = sub_21BEAAA68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AAEF818);
    }
  }
}

uint64_t *sub_21BD2E9B4(uint64_t *a1)
{
  return a1;
}

uint64_t sub_21BD2E9FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t (*a10)(void), uint64_t (*a11)(uint64_t), uint64_t (*a12)(void), uint64_t (*a13)(void))
{
  switch(a9 & 3)
  {
    case 1:
      uint64_t result = a11(a1);
      break;
    case 2:
      uint64_t result = a12();
      break;
    case 3:
      uint64_t result = a13();
      break;
    default:
      uint64_t result = a10();
      break;
  }
  return result;
}

uint64_t sub_21BD2EA64(uint64_t a1)
{
  return a1;
}

uint64_t sub_21BD2EAA8()
{
  if (qword_26AAF3680 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21BEA9B18();

  return __swift_project_value_buffer(v0, (uint64_t)qword_26AAF65B0);
}

uint64_t sub_21BD2EB0C()
{
  sub_21BD2EF88();
  uint64_t result = sub_21BEAAA38();
  qword_267C72D78 = result;
  return result;
}

uint64_t sub_21BD2EB74()
{
  sub_21BD2EF88();
  uint64_t result = sub_21BEAAA38();
  qword_267C72D80 = result;
  return result;
}

uint64_t sub_21BD2EBDC()
{
  sub_21BD2EF88();
  uint64_t result = sub_21BEAAA38();
  qword_26AAF6580 = result;
  return result;
}

uint64_t sub_21BD2EC34()
{
  sub_21BD2EF88();
  uint64_t result = sub_21BEAAA38();
  qword_26AAF6590 = result;
  return result;
}

uint64_t sub_21BD2EC94()
{
  sub_21BD2EF88();
  uint64_t result = sub_21BEAAA38();
  qword_26AAF6510 = result;
  return result;
}

uint64_t sub_21BD2ECF4()
{
  sub_21BD2EF88();
  uint64_t result = sub_21BEAAA38();
  qword_26AAF64E0 = result;
  return result;
}

uint64_t sub_21BD2ED5C()
{
  sub_21BD2EF88();
  uint64_t result = sub_21BEAAA38();
  qword_267C72D88 = result;
  return result;
}

uint64_t sub_21BD2EDC8(uint64_t a1)
{
  return sub_21BD2EEFC(a1, qword_267C72D90, &qword_267C62760, (id *)&qword_267C72D78);
}

uint64_t sub_21BD2EDF4(uint64_t a1)
{
  return sub_21BD2EEFC(a1, qword_267C72DA8, &qword_267C62768, (id *)&qword_267C72D80);
}

uint64_t sub_21BD2EE20(uint64_t a1)
{
  return sub_21BD2EEFC(a1, qword_26AAF6568, qword_26AAF3600, (id *)&qword_26AAF6580);
}

uint64_t sub_21BD2EE4C(uint64_t a1)
{
  return sub_21BD2EEFC(a1, qword_26AAF65B0, &qword_26AAF38F8, (id *)&qword_26AAF6590);
}

uint64_t sub_21BD2EE78(uint64_t a1)
{
  return sub_21BD2EEFC(a1, qword_26AAF6520, qword_26AAF3020, (id *)&qword_26AAF6510);
}

uint64_t sub_21BD2EEA4(uint64_t a1)
{
  return sub_21BD2EEFC(a1, qword_26AAF64E8, &qword_26AAF0058, (id *)&qword_26AAF64E0);
}

uint64_t sub_21BD2EED0(uint64_t a1)
{
  return sub_21BD2EEFC(a1, qword_267C72DC0, &qword_267C62770, (id *)&qword_267C72D88);
}

uint64_t sub_21BD2EEFC(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_21BEA9B18();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_21BEA9B28();
}

unint64_t sub_21BD2EF88()
{
  unint64_t result = qword_26AAF3900;
  if (!qword_26AAF3900)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AAF3900);
  }
  return result;
}

uint64_t sub_21BD2EFC8(uint64_t a1, uint64_t a2)
{
  sub_21BC51AB4();
  MEMORY[0x270FA5388](v4 - 8, v5, v6);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21BEAA418();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a2;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267C65640;
  v11[5] = v10;
  sub_21BD3028C((uint64_t)v8, (uint64_t)&unk_267C65650, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_21BD2F0FC()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_21BD2F17C()
{
  uint64_t v1 = OUTLINED_FUNCTION_3_34();
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v0);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____MPCPodcastAVItem_transcriptAlignments);
  swift_bridgeObjectRetain();

  return v4;
}

uint64_t sub_21BD2F220()
{
  uint64_t v1 = OUTLINED_FUNCTION_3_34();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16))(v1, v0) & 1;
}

id TranscriptAlignmentController.__allocating_init(playbackEngine:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TranscriptAlignmentController.init(playbackEngine:)(a1);
}

id TranscriptAlignmentController.init(playbackEngine:)(void *a1)
{
  objc_allocWithZone((Class)type metadata accessor for AssetReaderImplementation());
  id v3 = v1;
  id v4 = a1;
  sub_21BC3910C();
  uint64_t v5 = &v3[OBJC_IVAR____MPCTranscriptAlignmentController_platformImplementation];
  *(void *)uint64_t v5 = v6;
  *((void *)v5 + 1) = &off_26CBBF8C8;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for TranscriptAlignmentController();
  id v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

uint64_t type metadata accessor for TranscriptAlignmentController()
{
  return self;
}

uint64_t sub_21BD2F37C()
{
  uint64_t v1 = OUTLINED_FUNCTION_3_34();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 24))(v1, v0);
}

uint64_t sub_21BD2F404(double a1, double a2)
{
  *(void *)(v3 + 32) = v2;
  *(double *)(v3 + 16) = a1;
  *(double *)(v3 + 24) = a2;
  return MEMORY[0x270FA2498](sub_21BD2F428, 0, 0);
}

uint64_t sub_21BD2F428()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = *(void *)(v0[4] + OBJC_IVAR____MPCTranscriptAlignmentController_platformImplementation + 8);
  uint64_t ObjectType = swift_getObjectType();
  id v7 = (uint64_t (*)(uint64_t, uint64_t, __n128, __n128))(*(void *)(v1 + 32) + **(int **)(v1 + 32));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_21BD2F534;
  v4.n128_u64[0] = v0[2];
  v5.n128_u64[0] = v0[3];
  return v7(ObjectType, v1, v4, v5);
}

uint64_t sub_21BD2F534()
{
  OUTLINED_FUNCTION_13();
  unint64_t v2 = v1;
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_1();
  *__n128 v4 = v3;
  swift_task_dealloc();
  __n128 v5 = *(uint64_t (**)(__n128))(v3 + 8);
  v6.n128_u64[0] = v2;
  return v5(v6);
}

uint64_t sub_21BD2F690(const void *a1, void *a2, double a3, double a4)
{
  v4[2] = a2;
  v4[3] = _Block_copy(a1);
  a2;
  uint64_t v8 = (void *)swift_task_alloc();
  v4[4] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_21BD2F750;
  return sub_21BD2F404(a3, a4);
}

uint64_t sub_21BD2F750(double a1)
{
  OUTLINED_FUNCTION_0_4();
  __n128 v4 = *(void (***)(void, double))(v3 + 24);
  __n128 v5 = *(void **)(v3 + 16);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_1_1();
  *id v7 = v6;
  swift_task_dealloc();

  v4[2](v4, a1);
  _Block_release(v4);
  OUTLINED_FUNCTION_6_0();
  return v8();
}

id TranscriptAlignmentController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void TranscriptAlignmentController.init()()
{
}

id TranscriptAlignmentController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TranscriptAlignmentController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TranscriptAlignmentController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TranscriptAlignmentController);
}

uint64_t dispatch thunk of TranscriptAlignmentController.eventConsumer.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.transcriptAlignments.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.isEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.__allocating_init(playbackEngine:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.startProcessing()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.resolve(with:referenceTime:)()
{
  OUTLINED_FUNCTION_8();
  unint64_t v2 = v1;
  unint64_t v4 = v3;
  __n128 v5 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x80);
  uint64_t v12 = (uint64_t (*)(__n128, __n128))((char *)v5 + *v5);
  uint64_t v6 = swift_task_alloc();
  id v7 = (void *)OUTLINED_FUNCTION_12_0(v6);
  *id v7 = v8;
  v7[1] = sub_21BD306C0;
  v9.n128_u64[0] = v4;
  v10.n128_u64[0] = v2;
  return v12(v9, v10);
}

void *sub_21BD2FB30()
{
  unint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_currentItem);
  id v2 = v1;
  return v1;
}

uint64_t sub_21BD2FB60()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_isEnabled);
}

uint64_t sub_21BD2FB70()
{
  return sub_21BD2FE70(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21BD2FBA8()
{
  uint64_t v0 = qword_267C65560;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_21BD2FC28(uint64_t a1, char *a2)
{
  qword_267C65560 = a1;
  off_267C65568 = a2;
  return swift_bridgeObjectRelease();
}

id sub_21BD2FC68()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_currentItem] = 0;
  v0[OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_isEnabled] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for TranscriptAlignmentController.Unimplemented()
{
  return self;
}

uint64_t sub_21BD2FD18()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_21BD2FDA4;
  return sub_21BD2FB70();
}

uint64_t sub_21BD2FDA4()
{
  OUTLINED_FUNCTION_13();
  unint64_t v2 = v1;
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_1();
  *unint64_t v4 = v3;
  swift_task_dealloc();
  __n128 v5 = *(uint64_t (**)(__n128))(v3 + 8);
  v6.n128_u64[0] = v2;
  return v5(v6);
}

uint64_t sub_21BD2FE70(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21BD2FE78()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21BD2FEB8()
{
  OUTLINED_FUNCTION_8();
  double v1 = v0[2];
  double v2 = v0[3];
  uint64_t v3 = (const void *)*((void *)v0 + 4);
  unint64_t v4 = (void *)*((void *)v0 + 5);
  uint64_t v5 = swift_task_alloc();
  __n128 v6 = (void *)OUTLINED_FUNCTION_12_0(v5);
  *__n128 v6 = v7;
  v6[1] = sub_21BC41AB8;
  uint64_t v8 = (uint64_t (*)(const void *, void *, double, double))((char *)&dword_267C65620 + dword_267C65620);
  return v8(v3, v4, v1, v2);
}

uint64_t sub_21BD2FF70(uint64_t a1, uint64_t a2, int *a3)
{
  __n128 v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *unint64_t v4 = v3;
  v4[1] = sub_21BC42654;
  return v6();
}

uint64_t sub_21BD30040()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_12_0(v4);
  void *v5 = v6;
  v5[1] = sub_21BC42654;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267C65638 + dword_267C65638);
  return v7(v1, v2, v3);
}

uint64_t sub_21BD300F8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_21BC42654;
  return v7();
}

uint64_t sub_21BD301C8()
{
  OUTLINED_FUNCTION_8();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_12_0(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_21BC42654;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267C65648 + dword_267C65648);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_21BD3028C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21BEAA418();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_21BC387DC(a1);
  }
  else
  {
    sub_21BEAA408();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21BEAA388();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21BD303F4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21BD304D0;
  return v6(a1);
}

uint64_t sub_21BD304D0()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v3();
}

uint64_t sub_21BD30594()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21BD305CC(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_12_0(v4);
  void *v5 = v6;
  v5[1] = sub_21BC41AB8;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267C65658 + dword_267C65658);
  return v7(a1, v3);
}

unint64_t sub_21BD30680()
{
  unint64_t result = qword_267C64300;
  if (!qword_267C64300)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267C64300);
  }
  return result;
}

void sub_21BD306C4()
{
  sub_21BEAAA68();
  if (v0 <= 0x3F)
  {
    sub_21BD3223C(319, (unint64_t *)&qword_267C656F0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t sub_21BD307F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = BYTE4(a3);
  uint64_t v5 = a3 & 0x7FFFFFFF;
  uint64_t v6 = &unk_26CBBDEE8;
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  if ((a3 & 0x7FFFFFFF) == 0) {
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  if ((a3 & 0x100000000) != 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = &unk_26CBBDEB0;
  }
  uint64_t v9 = v8[2];
  swift_bridgeObjectRelease();
  if (!v9) {
    return 0;
  }
  uint64_t v10 = &unk_26CBBDE68;
  if (!v5) {
    uint64_t v10 = v7;
  }
  if (v3) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = &unk_26CBBDE30;
  }
  uint64_t v12 = v11[2];
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v14 = v12 - 1;
  if (v12 - 1 >= a1) {
    unint64_t v14 = a1;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 < v11[2])
  {
    uint64_t v15 = v11[v14 + 4];
    swift_bridgeObjectRelease();
    return v15;
  }
  __break(1u);
  return result;
}

void sub_21BD308E0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v3 = a3;
  uint64_t v6 = HIDWORD(a3) & 1;
  uint64_t v7 = &unk_26CBBDF88;
  if ((a3 & 0x7FFFFFFF) == 0) {
    uint64_t v7 = &unk_26CBBDF60;
  }
  if ((a3 & 0x100000000) != 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &unk_26CBBDF30;
  }
  uint64_t v9 = v8[2];
  swift_bridgeObjectRelease();
  unint64_t v10 = v9 - 1;
  if (v9 - 1 >= a1) {
    unint64_t v10 = a1;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v10 < v8[2])
  {
    swift_bridgeObjectRelease();
    sub_21BD309A8(a2, v3 | (unint64_t)(v6 << 32));
    return;
  }
  __break(1u);
}

float sub_21BD309A8(uint64_t a1, uint64_t a2)
{
  float v2 = -1.0;
  if (a1 == 1) {
    float v3 = 1.0;
  }
  else {
    float v3 = -1.0;
  }
  if (a1 == 1) {
    float v4 = *(float *)&a2;
  }
  else {
    float v4 = -*(float *)&a2;
  }
  if (*(float *)&a2 != 0.0) {
    float v3 = v4;
  }
  if (a1 == 1)
  {
    float v2 = 1.0;
    float v5 = *(float *)&a2;
  }
  else
  {
    float v5 = -*(float *)&a2;
  }
  if (*(float *)&a2 == 0.0) {
    float result = v2;
  }
  else {
    float result = v5;
  }
  if ((a2 & 0x100000000) != 0) {
    return v3;
  }
  return result;
}

uint64_t sub_21BD309EC(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, int a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1, a2, a3);
  unint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for RateScanningSubscription();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a6);
  unint64_t v16 = sub_21BD30B58((uint64_t)v14, a2, a3 | ((HIDWORD(a3) & 1) << 32), (uint64_t)a4, a5);
  uint64_t v18[3] = v15;
  v18[4] = swift_getWitnessTable();
  v18[0] = v16;
  sub_21BEA9C08();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v18);
}

uint64_t *sub_21BD30B58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  return sub_21BD30C08(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32), a4, a5);
}

uint64_t sub_21BD30BD4(uint64_t a1, uint64_t a2)
{
  return sub_21BD309EC(a1, *(void *)v2, *(unsigned int *)(v2 + 8) | ((unint64_t)*(unsigned __int8 *)(v2 + 12) << 32), *(void **)(v2 + 16), *(unsigned __int8 *)(v2 + 24), a2);
}

uint64_t *sub_21BD30C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v25 = a5;
  uint64_t v26 = a1;
  uint64_t v9 = *v5;
  uint64_t v10 = *(void *)(*v5 + 80);
  uint64_t v11 = sub_21BEAAA68();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13, v14);
  unint64_t v16 = (char *)&v24 - v15;
  __swift_storeEnumTagSinglePayload((uint64_t)v5 + *(void *)(v9 + 104), 1, 1, v10);
  uint64_t v17 = (_OWORD *)((char *)v5 + *(void *)(*v5 + 112));
  _OWORD *v17 = 0u;
  v17[1] = 0u;
  *(uint64_t *)((char *)v5 + *(void *)(*v5 + 120)) = 0;
  *(uint64_t *)((char *)v5 + *(void *)(*v5 + 128)) = 0;
  uint64_t v18 = (uint64_t)v5 + *(void *)(*v5 + 136);
  uint64_t v19 = sub_21BEA8D18();
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v19);
  uint64_t v20 = *(void *)(*v5 + 144);
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  sub_21BD3239C(0, 0xE000000000000000, v21);
  objc_msgSend(v21, sel_setMinimumFractionDigits_, 3);
  objc_msgSend(v21, sel_setMaximumFractionDigits_, 3);
  *(uint64_t *)((char *)v5 + v20) = (uint64_t)v21;
  v5[2] = a2;
  *((_DWORD *)v5 + 6) = a3;
  *((unsigned char *)v5 + 28) = BYTE4(a3) & 1;
  v5[4] = a4;
  *((unsigned char *)v5 + 40) = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v16, v26, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v10);
  uint64_t v22 = (uint64_t)v5 + *(void *)(*v5 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 40))(v22, v16, v11);
  swift_endAccess();
  return v5;
}

uint64_t sub_21BD30EC0(uint64_t a1)
{
  sub_21BD3223C(0, (unint64_t *)&qword_267C656F0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8, v4, v5);
  uint64_t v7 = (char *)&v11 - v6;
  sub_21BEA9C48();
  if (sub_21BEA9C38() & 1) != 0 && (sub_21BEA9C48(), uint64_t result = sub_21BEA9C38(), (result))
  {
    __break(1u);
  }
  else
  {
    sub_21BEA9C48();
    if ((sub_21BEA9C38() & 1) != 0 || (sub_21BEA9C48(), uint64_t result = sub_21BEA9C38(), a1) && (result & 1) == 0)
    {
      sub_21BEA8D08();
      uint64_t v9 = sub_21BEA8D18();
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      uint64_t v10 = v1 + *(void *)(*(void *)v1 + 136);
      swift_beginAccess();
      sub_21BD32118((uint64_t)v7, v10);
      swift_endAccess();
      return sub_21BD31014();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21BD31014()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)*v0;
  uint64_t v100 = sub_21BEA9DE8();
  uint64_t v99 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100, v3, v4);
  uint64_t v97 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_21BEA9E28();
  uint64_t v96 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98, v6, v7);
  uint64_t v95 = (char *)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_21BEA9DD8();
  uint64_t v108 = *(void *)(v109 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v109, v9, v10);
  uint64_t v107 = (uint64_t *)((char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11, v13, v14);
  uint64_t v106 = (uint64_t)&v94 - v15;
  uint64_t v105 = sub_21BEA9E58();
  uint64_t v104 = *(void *)(v105 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v105, v16, v17);
  char v102 = (char *)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18, v20, v21);
  uint64_t v103 = (char *)&v94 - v22;
  uint64_t v23 = sub_21BEAA798();
  uint64_t v111 = *(void *)(v23 - 8);
  uint64_t v112 = v23;
  MEMORY[0x270FA5388](v23, v24, v25);
  uint64_t v110 = (char *)&v94 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v2[11];
  uint64_t v28 = v2[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v116 = v27;
  swift_getAssociatedConformanceWitness();
  uint64_t v30 = sub_21BEA9C28();
  uint64_t v114 = *(void *)(v30 - 8);
  uint64_t v115 = v30;
  uint64_t v33 = MEMORY[0x270FA5388](v30, v31, v32);
  uint64_t v113 = (uint64_t)&v94 - v34;
  uint64_t v35 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v33, v36, v37);
  uint64_t v39 = (char *)&v94 - v38;
  uint64_t v40 = v1[2];
  uint64_t v41 = *((unsigned int *)v1 + 6);
  uint64_t v43 = v2[15];
  uint64_t v44 = *(void *)((char *)v1 + v43);
  LOBYTE(aBlock[0]) = *((unsigned char *)v1 + 28);
  unsigned __int8 v42 = aBlock[0];
  sub_21BD308E0(v44, v40, v41 | ((unint64_t)LOBYTE(aBlock[0]) << 32));
  int v46 = v45;
  uint64_t v47 = (uint64_t)v1 + *(void *)(*v1 + 104);
  swift_beginAccess();
  uint64_t v117 = v28;
  if (!__swift_getEnumTagSinglePayload(v47, 1, v28))
  {
    uint64_t v48 = v117;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v39, v47, v117);
    LODWORD(aBlock[0]) = v46;
    sub_21BEA9C18();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v39, v48);
  }
  uint64_t v49 = v35;
  uint64_t v50 = *(void *)((char *)v1 + v43);
  uint64_t v101 = v41 & 0x7FFFFFFF;
  uint64_t v51 = &unk_26CBBDF88;
  if ((v41 & 0x7FFFFFFF) == 0) {
    uint64_t v51 = &unk_26CBBDF60;
  }
  if (v42) {
    uint64_t v52 = v51;
  }
  else {
    uint64_t v52 = &unk_26CBBDF30;
  }
  uint64_t v53 = v52[2];
  swift_bridgeObjectRelease();
  if (v50 == v53 - 1 && !__swift_getEnumTagSinglePayload(v47, 1, v117))
  {
    uint64_t v55 = v49;
    uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
    uint64_t v57 = v117;
    v56(v39, v47, v117);
    uint64_t v58 = v113;
    __swift_storeEnumTagSinglePayload(v113, 1, 1, AssociatedTypeWitness);
    sub_21BEA9BF8();
    (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v58, v115);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v39, v57);
  }
  uint64_t v59 = *(void *)((char *)v1 + v43);
  LOBYTE(aBlock[0]) = v42;
  uint64_t result = sub_21BD307F8(v59, v54, v41 | ((unint64_t)v42 << 32));
  if ((v61 & 1) == 0)
  {
    uint64_t v62 = *(void *)(*v1 + 128);
    if (!*(void *)((char *)v1 + v62))
    {
      double v63 = *(double *)&result;
      uint64_t v64 = MEMORY[0x263F8EE78];
      if (*((unsigned char *)v1 + 40) == 1)
      {
        uint64_t v65 = &unk_26CBBDE68;
        if (!v101) {
          uint64_t v65 = (void *)MEMORY[0x263F8EE78];
        }
        if (v42) {
          uint64_t v66 = v65;
        }
        else {
          uint64_t v66 = &unk_26CBBDE30;
        }
        double v67 = COERCE_DOUBLE(sub_21BD31D20((uint64_t)v66));
        char v69 = v68;
        uint64_t result = swift_bridgeObjectRelease();
        double v70 = v67 * 4.0;
        if (v69) {
          double v70 = 4.0;
        }
        double v63 = v63 / v70;
      }
      uint64_t v71 = *(void *)((char *)v1 + v43);
      BOOL v72 = __OFADD__(v71, 1);
      uint64_t v73 = v71 + 1;
      if (v72)
      {
        __break(1u);
      }
      else
      {
        *(void *)((char *)v1 + v43) = v73;
        sub_21BD321AC();
        aBlock[0] = v64;
        sub_21BD321EC();
        sub_21BD3223C(0, &qword_26AAEF908, MEMORY[0x263F8F148], MEMORY[0x263F8D488]);
        sub_21BD322A0();
        uint64_t v74 = v110;
        uint64_t v75 = v112;
        sub_21BEAAAD8();
        uint64_t v76 = sub_21BEAA7A8();
        (*(void (**)(char *, uint64_t))(v111 + 8))(v74, v75);
        *(void *)((char *)v1 + v62) = v76;
        uint64_t result = swift_unknownObjectRelease();
        if (*(void *)((char *)v1 + v62))
        {
          uint64_t ObjectType = swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v78 = v102;
          sub_21BEA9E48();
          uint64_t v115 = v62;
          uint64_t v79 = v103;
          MEMORY[0x21D49B6A0](v78, v63);
          uint64_t v80 = *(void (**)(char *, uint64_t))(v104 + 8);
          uint64_t v81 = v105;
          v80(v78, v105);
          uint64_t v82 = v106;
          sub_21BC7CC30(v106);
          uint64_t v83 = v107;
          sub_21BC7CCA4(v107);
          MEMORY[0x21D49C080](v79, v82, v83, ObjectType);
          swift_unknownObjectRelease();
          uint64_t v84 = *(void (**)(void *, uint64_t))(v108 + 8);
          uint64_t v85 = v109;
          v84(v83, v109);
          v84((void *)v82, v85);
          uint64_t v86 = v79;
          uint64_t v87 = v115;
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v80)(v86, v81);
          if (*(void *)((char *)v1 + v87))
          {
            swift_getObjectType();
            uint64_t v88 = swift_allocObject();
            swift_weakInit();
            uint64_t v89 = (void *)swift_allocObject();
            uint64_t v90 = v116;
            v89[2] = v117;
            v89[3] = v90;
            v89[4] = v88;
            aBlock[4] = sub_21BD32390;
            aBlock[5] = v89;
            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_21BC27BFC;
            aBlock[3] = &block_descriptor_26;
            uint64_t v91 = _Block_copy(aBlock);
            swift_unknownObjectRetain();
            swift_retain();
            uint64_t v92 = v95;
            sub_21BC7CF34();
            uint64_t v93 = v97;
            sub_21BC7CF38();
            sub_21BEAA7B8();
            _Block_release(v91);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v99 + 8))(v93, v100);
            (*(void (**)(char *, uint64_t))(v96 + 8))(v92, v98);
            swift_release();
            uint64_t result = swift_release();
            if (*(void *)((char *)v1 + v87))
            {
              swift_getObjectType();
              swift_unknownObjectRetain();
              sub_21BEAA7D8();
              return swift_unknownObjectRelease();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_21BD31A78()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_21BEA9C28();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v5, v7, v8);
  uint64_t v11 = (char *)&v20 - v10;
  uint64_t v12 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v9, v13, v14);
  uint64_t v16 = (char *)&v20 - v15;
  uint64_t v17 = (uint64_t)v1 + *(void *)(v2 + 104);
  swift_beginAccess();
  if (!__swift_getEnumTagSinglePayload(v17, 1, v3))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v17, v3);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, AssociatedTypeWitness);
    sub_21BEA9BF8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v3);
  }
  uint64_t v18 = *(void *)(*v1 + 128);
  if (*(uint64_t *)((char *)v1 + v18))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21BEAA7C8();
    swift_unknownObjectRelease();
  }
  *(uint64_t *)((char *)v1 + v18) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_21BD31D20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  double v2 = *(double *)(a1 + 32);
  uint64_t v3 = v1 - 1;
  if (v1 != 1)
  {
    uint64_t v4 = (double *)(a1 + 40);
    do
    {
      double v5 = *v4++;
      double v6 = v5;
      if (v2 < v5) {
        double v2 = v6;
      }
      --v3;
    }
    while (v3);
  }
  return *(void *)&v2;
}

uint64_t sub_21BD31D64()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(*(void *)result + 128);
    if (*(void *)(result + v2))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_21BEAA7C8();
      swift_unknownObjectRelease();
    }
    *(void *)(v1 + v2) = 0;
    uint64_t v3 = swift_unknownObjectRelease();
    sub_21BD31014(v3);
    return swift_release();
  }
  return result;
}

id *sub_21BD31E1C()
{
  uint64_t v1 = (char *)v0 + *((void *)*v0 + 13);
  uint64_t v2 = sub_21BEAAA68();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_21BC04BE0((uint64_t)v0 + *((void *)*v0 + 14));
  swift_unknownObjectRelease();
  sub_21BD0B120((uint64_t)v0 + *((void *)*v0 + 17));

  return v0;
}

uint64_t sub_21BD31F1C()
{
  unint64_t v0 = sub_21BD31E1C();
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for RateScanningSubscription()
{
  return __swift_instantiateGenericMetadata();
}

void sub_21BD31F88(uint64_t a1)
{
}

uint64_t sub_21BD31F90(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 5) = *(void *)(a2 + 5);
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  id v4 = v3;
  return a1;
}

uint64_t sub_21BD31FD8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)(a1 + 5) = *(uint64_t *)((char *)a2 + 5);
  *(void *)a1 = v4;
  double v5 = (void *)a2[2];
  double v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  id v7 = v5;

  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  return a1;
}

uint64_t sub_21BD32034(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 5) = *(void *)(a2 + 5);
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

void type metadata accessor for RateScannerConfiguration()
{
}

uint64_t sub_21BD32098(uint64_t a1)
{
  return sub_21BD30EC0(a1);
}

uint64_t sub_21BD320BC()
{
  return sub_21BD31A78();
}

uint64_t sub_21BD320E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_21BD320FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_21BD32118(uint64_t a1, uint64_t a2)
{
  sub_21BD3223C(0, (unint64_t *)&qword_267C656F0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_21BD321AC()
{
  unint64_t result = qword_26AAEF968;
  if (!qword_26AAEF968)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AAEF968);
  }
  return result;
}

unint64_t sub_21BD321EC()
{
  unint64_t result = qword_26AAEF960;
  if (!qword_26AAEF960)
  {
    sub_21BEAA798();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAEF960);
  }
  return result;
}

void sub_21BD3223C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_21BD322A0()
{
  unint64_t result = qword_26AAEF910;
  if (!qword_26AAEF910)
  {
    sub_21BD3223C(255, &qword_26AAEF908, MEMORY[0x263F8F148], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAEF910);
  }
  return result;
}

uint64_t sub_21BD32320()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21BD32358()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21BD32390()
{
  return sub_21BD31D64();
}

void sub_21BD3239C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_21BEAA138();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setNegativePrefix_, v4);
}

uint64_t sub_21BD32400(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21BD32440(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void _s11RateScannerVMa()
{
}

void *__swift_memcpy13_8(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *unint64_t result = v2;
  return result;
}

uint64_t sub_21BD324A4(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 13))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 12);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21BD324E4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 13) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 13) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 12) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21BD3252C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12);
}

uint64_t sub_21BD32534(uint64_t result, char a2)
{
  *(unsigned char *)(result + 12) = a2 & 1;
  return result;
}

void type metadata accessor for RateScannerType()
{
}

void *PodcastsManagedQueue.__allocating_init()()
{
  unint64_t result = (void *)swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  result[3] = 0;
  result[4] = 0;
  result[2] = v1;
  return result;
}

uint64_t sub_21BD32590(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

void *PodcastsManagedQueue.init()()
{
  unint64_t result = v0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = v2;
  return result;
}

uint64_t sub_21BD325F0()
{
  OUTLINED_FUNCTION_2();
  v9[0] = *(void *)(v0 + 16);
  swift_retain();
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_21BD35128(v1);
  sub_21BD352B8((void (*)(uint64_t *))sub_21BD356FC, v2, v3 & 1, (uint64_t)&v7);
  swift_bridgeObjectRelease();
  if (v8)
  {
    sub_21BC32CE8(&v7, (uint64_t)v9);
    __swift_project_boxed_opaque_existential_0Tm(v9, v9[3]);
    OUTLINED_FUNCTION_3_35();
    uint64_t v5 = v4();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v9);
  }
  else
  {
    sub_21BD35D00((uint64_t)&v7, &qword_267C64A18, MEMORY[0x263F8D8F0]);
    return 0;
  }
  return v5;
}

BOOL static PodcastQueueType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21BD32728(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

BOOL sub_21BD32738(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 32);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = *(void *)(v2 + 24);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21BD33300(a1, a2);
  if (v8)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = sub_21BD33300(v6, v3);
  char v12 = v11;
  swift_bridgeObjectRelease();
  return (v12 & 1) == 0 && v10 < v9;
}

uint64_t sub_21BD327D4()
{
  OUTLINED_FUNCTION_2();
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_21BCB3AEC();
  for (uint64_t i = v3 + 32; ; i += 40)
  {
    sub_21BC32D00(i, (uint64_t)v14);
    __swift_project_boxed_opaque_existential_0Tm(v14, v14[3]);
    OUTLINED_FUNCTION_3_35();
    uint64_t result = v7();
    if (!v9) {
      break;
    }
    uint64_t v10 = result;
    uint64_t v11 = v9;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
    uint64_t v5 = v15;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21BCB3AEC();
      uint64_t v5 = v15;
    }
    OUTLINED_FUNCTION_6_33();
    if (v12)
    {
      sub_21BCB3AEC();
      uint64_t v5 = v15;
    }
    *(void *)(v5 + 16) = v1;
    uint64_t v13 = v5 + 16 * v2;
    *(void *)(v13 + 32) = v10;
    *(void *)(v13 + 40) = v11;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21BD32920()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = v0[2];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return sub_21BD32C48();
  }
  uint64_t v3 = v1 + 32;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = OUTLINED_FUNCTION_2_37();
    uint64_t v7 = v6(v5);
    uint64_t v9 = v0[4];
    if (v8) {
      break;
    }
    if (!v9)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_19;
    }
LABEL_14:
    ++v4;
    v3 += 40;
    if (v2 == v4)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return sub_21BD32C48();
    }
  }
  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  if (v7 != v0[3] || v8 != v9)
  {
    char v11 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
LABEL_19:
  uint64_t result = sub_21BD0DB98(v4);
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v23 = MEMORY[0x263F8EE78];
  unint64_t v17 = (v16 >> 1) - v15;
  if (v16 >> 1 == v15)
  {
LABEL_30:
    swift_unknownObjectRelease();
    return v12;
  }
  if ((uint64_t)(v16 >> 1) > v15)
  {
    uint64_t v18 = v14 + 40 * v15;
    do
    {
      sub_21BC32D00(v18, (uint64_t)v22);
      sub_21BC32D00((uint64_t)v22, (uint64_t)v20);
      sub_21BCDAEC4();
      type metadata accessor for PodcastAVItem();
      if ((OUTLINED_FUNCTION_5_28() & 1) == 0) {
        uint64_t v21 = 0;
      }
      uint64_t v19 = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
      if (v21)
      {
        MEMORY[0x21D49BB00](v19);
        if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21BEAA338();
        }
        sub_21BEAA358();
        sub_21BEAA328();
      }
      v18 += 40;
      --v17;
    }
    while (v17);
    uint64_t v12 = v23;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_21BD32B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = (void *)(a1 + 32);
  while (1)
  {
    uint64_t v8 = v7[3];
    uint64_t v9 = v7[4];
    __swift_project_boxed_opaque_existential_0Tm(v7, v8);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
    if (!v11) {
      goto LABEL_9;
    }
    if (v10 == a2 && v11 == a3) {
      break;
    }
    char v13 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_12;
    }
LABEL_9:
    ++v6;
    v7 += 5;
    if (v4 == v6) {
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_21BD32C48()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_21BC32D00(v3, (uint64_t)v9);
      sub_21BC32D00((uint64_t)v9, (uint64_t)v7);
      sub_21BCDAEC4();
      type metadata accessor for PodcastAVItem();
      if ((OUTLINED_FUNCTION_5_28() & 1) == 0) {
        uint64_t v8 = 0;
      }
      uint64_t v4 = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v9);
      if (v8)
      {
        MEMORY[0x21D49BB00](v4);
        if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21BEAA338();
        }
        sub_21BEAA358();
        sub_21BEAA328();
      }
      v3 += 40;
      --v2;
    }
    while (v2);
    uint64_t v5 = v10;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v5;
}

BOOL sub_21BD32D6C()
{
  OUTLINED_FUNCTION_2();
  return *(void *)(*(void *)(v0 + 16) + 16) == 0;
}

uint64_t sub_21BD32DA4()
{
  sub_21BD334B0();
  sub_21BD35D5C(0, &qword_267C656F8, MEMORY[0x263F8D488]);
  sub_21BD3571C();
  char v0 = sub_21BEAA5D8();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_21BD32E28()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = v0[2];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    swift_bridgeObjectRetain();
LABEL_17:
    uint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    goto LABEL_20;
  }
  uint64_t v3 = v1 + 32;
  swift_bridgeObjectRetain_n();
  while (1)
  {
    sub_21BC32D00(v3, (uint64_t)&v15);
    __swift_project_boxed_opaque_existential_0Tm(&v15, v16);
    OUTLINED_FUNCTION_3_35();
    uint64_t v5 = v4();
    uint64_t v7 = v0[4];
    if (v6) {
      break;
    }
    if (!v7) {
      goto LABEL_19;
    }
LABEL_14:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v15);
    v3 += 40;
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  if (!v7)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  if (v5 != v0[3] || v6 != v7)
  {
    char v9 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  swift_bridgeObjectRelease();
  sub_21BC32CE8(&v15, (uint64_t)v17);
LABEL_20:
  swift_bridgeObjectRelease();
  sub_21BD35DBC((uint64_t)v17, (uint64_t)&v15);
  if (v16)
  {
    sub_21BC32CE8(&v15, (uint64_t)v13);
    sub_21BC32D00((uint64_t)v13, (uint64_t)v12);
    sub_21BCDAEC4();
    type metadata accessor for PodcastAVItem();
    if ((swift_dynamicCast() & 1) == 0) {
      uint64_t v14 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
    uint64_t v10 = v14;
  }
  else
  {
    uint64_t v10 = 0;
  }
  sub_21BD35D00((uint64_t)v17, &qword_267C64A18, MEMORY[0x263F8D8F0]);
  return v10;
}

uint64_t sub_21BD3301C()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void *)(v0 + 16);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  sub_21BC32D00(v1 + 32, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  OUTLINED_FUNCTION_3_35();
  uint64_t v3 = v2();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
  return v3;
}

void sub_21BD330BC(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  OUTLINED_FUNCTION_2();
  uint64_t v9 = *(void *)(v4 + 16);
  uint64_t v10 = *(char **)(v9 + 16);
  if (!v10)
  {
LABEL_11:
    *(void *)(a4 + 32) = 0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    return;
  }
  char v25 = a3;
  uint64_t v26 = (uint64_t *)(v4 + 16);
  swift_bridgeObjectRetain();
  uint64_t v11 = 0;
  uint64_t v12 = 32;
  while (1)
  {
    __swift_project_boxed_opaque_existential_0Tm((void *)(v9 + v12), *(void *)(v9 + v12 + 24));
    OUTLINED_FUNCTION_3_35();
    uint64_t v14 = v13();
    if (!v15) {
      goto LABEL_9;
    }
    id v16 = v15;
    if (v14 == a1 && v15 == a2) {
      break;
    }
    char v18 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_13;
    }
LABEL_9:
    ++v11;
    v12 += 40;
    if (v10 == v11)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_21;
  }
  if ((unint64_t)v11 >= *(void *)(*v26 + 16)) {
    goto LABEL_25;
  }
  sub_21BC32D00(*v26 + v12, (uint64_t)&v28);
  uint64_t v10 = (char *)sub_21BCDAEC4();
  id v16 = (id)type metadata accessor for PodcastAVItem();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v10 = v27;
  uint64_t v19 = sub_21BCA50C8();
  if (!v19) {
    goto LABEL_20;
  }
  uint64_t v20 = v19;
  id v29 = v16;
  uint64_t v30 = &off_26CBC80E0;
  *(void *)&long long v28 = v19;
  OUTLINED_FUNCTION_1_39();
  uint64_t v21 = *v26;
  id v16 = v20;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v26 = v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_26;
  }
  while ((unint64_t)v11 < *(void *)(v21 + 16))
  {
    uint64_t v23 = v21 + v12;
    __swift_destroy_boxed_opaque_existential_0Tm(v23);
    sub_21BC32CE8(&v28, v23);
    swift_endAccess();

LABEL_20:
LABEL_21:
    if ((unint64_t)v11 < *(void *)(*v26 + 16))
    {
      sub_21BC32D00(*v26 + v12, a4);
      return;
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    sub_21BD3539C();
    uint64_t v21 = v24;
    *uint64_t v26 = v24;
  }
  __break(1u);
}

uint64_t sub_21BD33300(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2();
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v5 + 32;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = OUTLINED_FUNCTION_2_37();
    uint64_t v11 = v10(v9);
    if (v12) {
      break;
    }
LABEL_9:
    ++v8;
    v7 += 40;
    if (v6 == v8)
    {
      uint64_t v8 = 0;
      goto LABEL_13;
    }
  }
  if (v11 != a1 || v12 != a2)
  {
    char v14 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21BD33404(uint64_t a1)
{
  sub_21BD35D5C(0, &qword_267C656F8, MEMORY[0x263F8D488]);
  sub_21BD3571C();
  swift_bridgeObjectRetain();
  if (sub_21BEAA5D8())
  {
    uint64_t v1 = sub_21BD334B0();
    sub_21BD34BD8(1, 1, v1);
  }
  return sub_21BD32590(a1);
}

uint64_t sub_21BD334B0()
{
  uint64_t v1 = v0[4];
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = v0[3];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_21BD33300(v2, v1);
  char v5 = v4;
  swift_bridgeObjectRelease();
  if (v5) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v6 = sub_21BD325F0();
  if (!v7) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v8 = sub_21BD33300(v6, v7);
  char v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  if (v10) {
    return MEMORY[0x263F8EE78];
  }
  BOOL v12 = __OFADD__(v3, 1);
  int64_t v13 = v3 + 1;
  if (v12)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_2();
    uint64_t result = MEMORY[0x263F8EE78];
    if ((v13 & 0x8000000000000000) == 0)
    {
      uint64_t v14 = v0[2];
      if (v13 < *(void *)(v14 + 16) && v8 >= v13)
      {
        unint64_t v16 = sub_21BD0DBFC(v13, v8, v14);
        return sub_21BD0DA8C(v16, v17, v18, v19);
      }
    }
  }
  return result;
}

uint64_t sub_21BD33590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_21BD325F0();
  if (!v11 || (v12 = sub_21BD33300(v10, v11), char v14 = v13, swift_bridgeObjectRelease(), (v14 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    sub_21BD32728(a3, a4);
    return 0;
  }
  swift_bridgeObjectRetain();
  sub_21BD32728(a3, a4);
  uint64_t v15 = sub_21BD33300(a1, a2);
  if (v16) {
    return 0;
  }
  uint64_t v17 = v15;
  uint64_t result = sub_21BD33300(a3, a4);
  if (v19) {
    return 0;
  }
  uint64_t v20 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
    __break(1u);
    goto LABEL_20;
  }
  if (__OFSUB__(result, 1))
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result - 1 >= v12) {
    uint64_t v21 = v12;
  }
  else {
    uint64_t v21 = result - 1;
  }
  if (v21 >= v20)
  {
    OUTLINED_FUNCTION_2();
    unint64_t v25 = sub_21BD0DBFC(v17 + 1, v21, *(void *)(v5 + 16));
    if (v23 != v24 >> 1)
    {
      uint64_t v26 = v22;
      uint64_t v27 = v23;
      unint64_t v28 = v24;
      OUTLINED_FUNCTION_1_39();
      sub_21BD34EA4(v20, v21 + 1);
      swift_endAccess();
      uint64_t result = sub_21BD33300(a3, a4);
      if ((v29 & 1) == 0)
      {
        uint64_t v30 = result + 1;
        if (!__OFADD__(result, 1))
        {
          OUTLINED_FUNCTION_1_39();
          swift_unknownObjectRetain();
          sub_21BD34D38(v30, v30, v25, v26, v27, v28);
          swift_endAccess();
          swift_unknownObjectRelease();
          return 1;
        }
        goto LABEL_21;
      }
    }
    swift_unknownObjectRelease();
  }
  return 0;
}

void sub_21BD33768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void *)(a3 + 16);
  swift_bridgeObjectRetain();
  if (!v7)
  {
LABEL_7:
    if (a4 == 1)
    {
      uint64_t v13 = sub_21BD325F0();
      if (v14)
      {
        sub_21BD33978(v13, v14, v5);
        swift_bridgeObjectRelease();
LABEL_13:
        swift_bridgeObjectRelease();
        return;
      }
    }
    else if (a4)
    {
      goto LABEL_13;
    }
    sub_21BD33978(a1, a2, v5);
    goto LABEL_13;
  }
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  while (1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21BD3539C();
      uint64_t v5 = v12;
    }
    if (v9 >= *(void *)(v5 + 16)) {
      break;
    }
    ++v9;
    __swift_mutable_project_boxed_opaque_existential_1(v5 + v8 + 32, *(void *)(v5 + v8 + 56));
    OUTLINED_FUNCTION_11_29();
    v11(v10);
    v8 += 40;
    if (v7 == v9) {
      goto LABEL_7;
    }
  }
  __break(1u);
}

void sub_21BD338AC()
{
  uint64_t v1 = v0[4];
  if (v1)
  {
    uint64_t v2 = v0[3];
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21BD33300(v2, v1);
    char v5 = v4;
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
    {
      OUTLINED_FUNCTION_2();
      if (v3 <= *(void *)(v0[2] + 16))
      {
        sub_21BD0DB98(v3 + 1);
        uint64_t v7 = v6;
        uint64_t v9 = v8;
        unint64_t v11 = v10;
        uint64_t v12 = swift_unknownObjectRetain();
        uint64_t v13 = sub_21BD0DA8C(v12, v7, v9, v11);
        sub_21BD32590(v13);
        swift_unknownObjectRelease();
      }
      else
      {
        sub_21BD32590(MEMORY[0x263F8EE78]);
      }
    }
  }
}

uint64_t sub_21BD33978(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_21BD327D4();
    uint64_t v7 = sub_21BD0D434(v5, a2, v6);
    LOBYTE(v5) = v8;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
    {
      sub_21BD327D4();
      uint64_t result = swift_bridgeObjectRelease();
      BOOL v9 = __OFADD__(v7, 1);
      uint64_t v10 = v7 + 1;
      if (v9)
      {
        __break(1u);
      }
      else
      {
        OUTLINED_FUNCTION_1_39();
        swift_bridgeObjectRetain();
        sub_21BD34BD8(v10, v10, a3);
        return swift_endAccess();
      }
    }
  }
  return result;
}

uint64_t sub_21BD33A2C()
{
  return swift_endAccess();
}

void sub_21BD33A78()
{
  OUTLINED_FUNCTION_9_29();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = v4;
  if (!swift_isUniquelyReferenced_nonNull_native() || v3 > *(void *)(v1 + 24) >> 1)
  {
    sub_21BD20AF8();
    uint64_t v1 = v7;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_8_28();
  if (v9 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_21BD22C00(v6 + 32, v2, v1 + 16 * v8 + 32);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  uint64_t v10 = *(void *)(v1 + 16);
  BOOL v5 = __OFADD__(v10, v2);
  uint64_t v11 = v10 + v2;
  if (!v5)
  {
    *(void *)(v1 + 16) = v11;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_21BD33B3C()
{
  OUTLINED_FUNCTION_9_29();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = v4;
  if (!swift_isUniquelyReferenced_nonNull_native() || v3 > *(void *)(v1 + 24) >> 1)
  {
    sub_21BD214BC();
    uint64_t v1 = v7;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_8_28();
  if (v8 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_21BD2319C(v6 + 32, v2);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  uint64_t v9 = *(void *)(v1 + 16);
  BOOL v5 = __OFADD__(v9, v2);
  uint64_t v10 = v9 + v2;
  if (!v5)
  {
    *(void *)(v1 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_21BD33C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3
    || (swift_bridgeObjectRetain(), v7 = OUTLINED_FUNCTION_10_26(), uint64_t result = sub_21BD32B40(v7, v8, v9), (v11 & 1) != 0))
  {
    OUTLINED_FUNCTION_1_39();
    swift_bridgeObjectRetain();
    sub_21BD33B3C();
    return swift_endAccess();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 16);
    if (v12)
    {
      uint64_t v13 = result;
      uint64_t v14 = (uint64_t *)(v3 + 16);
      uint64_t v15 = a1 + 32;
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v33 = i;
        sub_21BC32D00(v15, (uint64_t)v34);
        sub_21BC32CE8(v34, (uint64_t)v32);
        if (v13 >= i)
        {
          sub_21BC32D00((uint64_t)v32, (uint64_t)&v29);
          uint64_t v4 = v30;
          uint64_t v5 = v31;
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v29, v30);
          LOBYTE(v28[0]) = 0;
          OUTLINED_FUNCTION_11_29();
          v21();
          sub_21BC32D00((uint64_t)&v29, (uint64_t)v28);
          OUTLINED_FUNCTION_1_39();
          uint64_t v22 = *v14;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v14 = v22;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            OUTLINED_FUNCTION_7_30();
            OUTLINED_FUNCTION_13_25(v26);
          }
          OUTLINED_FUNCTION_6_33();
          if (v19)
          {
            OUTLINED_FUNCTION_4_34();
            OUTLINED_FUNCTION_13_25(v27);
          }
          *(void *)(v22 + 16) = v4;
          sub_21BC32CE8(v28, v22 + 40 * v5 + 32);
          swift_endAccess();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v32);
          uint64_t v20 = &v29;
        }
        else
        {
          sub_21BC32D00((uint64_t)v32, (uint64_t)&v29);
          OUTLINED_FUNCTION_1_39();
          uint64_t v17 = *v14;
          char v18 = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v14 = v17;
          if ((v18 & 1) == 0)
          {
            OUTLINED_FUNCTION_7_30();
            OUTLINED_FUNCTION_13_25(v24);
          }
          OUTLINED_FUNCTION_6_33();
          if (v19)
          {
            OUTLINED_FUNCTION_4_34();
            OUTLINED_FUNCTION_13_25(v25);
          }
          *(void *)(v17 + 16) = v4;
          sub_21BC32CE8(&v29, v17 + 40 * v5 + 32);
          swift_endAccess();
          uint64_t v20 = (long long *)v32;
        }
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v20);
        v15 += 40;
      }
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_21BD33E1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_21BD327D4();
  unint64_t v10 = sub_21BD0D434(a1, a2, v9);
  LOBYTE(a1) = v11;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
    uint64_t v12 = sub_21BD327D4();
    uint64_t v13 = sub_21BD0D434(a3, a4, v12);
    char v15 = v14;
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      OUTLINED_FUNCTION_1_39();
      sub_21BD33FC4(v10, (uint64_t)v17);
      if (*(void *)(*(void *)(v4 + 16) + 16) < v13)
      {
        __break(1u);
      }
      else if ((v13 & 0x8000000000000000) == 0)
      {
        sub_21BC32D00((uint64_t)v17, (uint64_t)v16);
        sub_21BD34FB0(v13, v13, (uint64_t)v16);
        swift_endAccess();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v17);
        return;
      }
      __break(1u);
    }
  }
}

void sub_21BD33F30(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_21BD3530C(v3);
    unint64_t v3 = v5;
    *uint64_t v1 = v5;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v7 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    sub_21BD2286C((char *)(v6 + 8 * a1 + 40), v7 - 1 - a1, (char *)(v6 + 8 * a1 + 32));
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    sub_21BEAA328();
  }
}

void sub_21BD33FC4(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_21BD3539C();
    uint64_t v5 = v8;
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = v5 + 40 * a1;
    sub_21BC32CE8((long long *)(v7 + 32), a2);
    sub_21BD22AF0((char *)(v7 + 72), v6 - 1 - a1, (char *)(v7 + 32));
    *(void *)(v5 + 16) = v6 - 1;
    uint64_t *v2 = v5;
  }
}

void sub_21BD34064(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_21BD327D4();
  int64_t v6 = sub_21BD0D434(a1, a2, v5);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
    uint64_t v8 = sub_21BD327D4();
    uint64_t v9 = OUTLINED_FUNCTION_12_26(v8);
    char v11 = v10;
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      OUTLINED_FUNCTION_1_39();
      sub_21BD33FC4(v6, (uint64_t)v14);
      if (v9 >= v6) {
        uint64_t v12 = v9;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      if (*(void *)(*(void *)(v2 + 16) + 16) < v12)
      {
        __break(1u);
      }
      else if ((v12 & 0x8000000000000000) == 0)
      {
        sub_21BC32D00((uint64_t)v14, (uint64_t)v13);
        sub_21BD34FB0(v12, v12, (uint64_t)v13);
        swift_endAccess();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
        return;
      }
      __break(1u);
    }
  }
}

void sub_21BD34170()
{
  OUTLINED_FUNCTION_1_39();
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_26();
  sub_21BD353B0(v1, v2, v3);
  uint64_t v5 = *(void *)(*(void *)(v0 + 16) + 16);
  if (v5 < v4)
  {
    __break(1u);
  }
  else
  {
    sub_21BD34EA4(v4, v5);
    swift_endAccess();
  }
}

uint64_t sub_21BD341E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v2 + 16;
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8) {
    return 0;
  }
  uint64_t v30 = v6;
  uint64_t v9 = (void *)(v7 + 32);
  swift_bridgeObjectRetain();
  uint64_t v10 = 0;
  while (1)
  {
    __swift_project_boxed_opaque_existential_0Tm(v9, v9[3]);
    OUTLINED_FUNCTION_3_35();
    uint64_t v12 = v11();
    if (!v13) {
      goto LABEL_9;
    }
    uint64_t v14 = v13;
    if (v12 == a1 && v13 == a2) {
      break;
    }
    char v16 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_13;
    }
LABEL_9:
    ++v10;
    v9 += 5;
    if (v8 == v10)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = v14;
LABEL_13:
  swift_bridgeObjectRelease();
  sub_21BD325F0();
  if (!v18
    || (uint64_t v7 = v18,
        uint64_t v19 = sub_21BD327D4(),
        uint64_t v20 = OUTLINED_FUNCTION_12_26(v19),
        char v22 = v21,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v22 & 1) != 0))
  {
    uint64_t v20 = *(void *)(*(void *)v30 + 16) - 1;
  }
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v20 >= v10 + 1) {
    uint64_t v7 = v10 + 1;
  }
  else {
    uint64_t v7 = v20;
  }
  if (qword_267C62778 != -1) {
    goto LABEL_27;
  }
  while (1)
  {
    uint64_t v23 = sub_21BEA9B18();
    __swift_project_value_buffer(v23, (uint64_t)qword_267C72D90);
    uint64_t v24 = sub_21BEA9B08();
    os_log_type_t v25 = sub_21BEAA6C8();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v31[0] = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v28 = sub_21BD35788();
      sub_21BCC7B5C(v28, v29, v31);
      sub_21BEAAA78();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21BB87000, v24, v25, "Removing items at range: %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D49EAD0](v27, -1, -1);
      MEMORY[0x21D49EAD0](v26, -1, -1);
    }

    OUTLINED_FUNCTION_1_39();
    if (!__OFADD__(v20, 1)) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_once();
  }
  sub_21BD34EA4(v7, v20 + 1);
  swift_endAccess();
  return 1;
}

uint64_t sub_21BD344D4()
{
  return sub_21BD32590(MEMORY[0x263F8EE78]);
}

uint64_t PodcastsManagedQueue.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PodcastsManagedQueue.__deallocating_deinit()
{
  PodcastsManagedQueue.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t PodcastQueueType.hash(into:)()
{
  return sub_21BEAAFC8();
}

uint64_t PodcastQueueType.hashValue.getter()
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD345BC()
{
  return sub_21BD345E0();
}

uint64_t sub_21BD345E0()
{
  return sub_21BD239D4(v0);
}

uint64_t sub_21BD345E8()
{
  return sub_21BD3460C();
}

uint64_t sub_21BD3460C()
{
  return sub_21BCBB040(v0, (SEL *)&selRef_queueSectionID);
}

uint64_t sub_21BD34630()
{
  return sub_21BD34654();
}

uint64_t sub_21BD34654()
{
  return sub_21BCBB040(v0, (SEL *)&selRef_queueItemID);
}

uint64_t sub_21BD34678(uint64_t a1, uint64_t a2)
{
  return sub_21BD34948(a1, a2, (unint64_t *)&qword_26AAF2DF0, 0x263EFA800, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21BD2286C);
}

uint64_t sub_21BD346A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    unint64_t v7 = *v4;
    if (!(*v4 >> 62))
    {
      uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21BEAAD88();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v9 < v5)
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v10 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v8 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  unint64_t v7 = *v4;
  if (!(*v4 >> 62))
  {
    uint64_t v11 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_36:
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_21BEAAD88();
  swift_bridgeObjectRelease();
LABEL_9:
  uint64_t v12 = v11 + v8;
  if (__OFADD__(v11, v8))
  {
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  unint64_t v7 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v7;
  uint64_t v11 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    uint64_t v14 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v12 <= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_20;
    }
    uint64_t v11 = 1;
  }
  if (v7 >> 62) {
    goto LABEL_38;
  }
  uint64_t v15 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v15 <= v12) {
    uint64_t v15 = v12;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = MEMORY[0x21D49C4A0](v11, v15, 1, v7);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v7;
  uint64_t v14 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  uint64_t v16 = v14 + 32 + 8 * v6;
  sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2DF0);
  swift_arrayDestroy();
  if (!v8) {
    goto LABEL_28;
  }
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)(v14 + 16);
  }
  if (__OFSUB__(v17, v5))
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t result = (uint64_t)sub_21BD2286C((char *)(v14 + 32 + 8 * v5), v17 - v5, (char *)(v16 + 8));
  if (v7 >> 62)
  {
LABEL_41:
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_21BEAAD88();
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t v19 = *(void *)(v14 + 16);
LABEL_26:
  if (__OFADD__(v19, v8))
  {
    __break(1u);
    return result;
  }
  *(void *)(v14 + 16) = v19 + v8;
LABEL_28:
  *(void *)uint64_t v16 = v3;

  return sub_21BEAA328();
}

uint64_t sub_21BD34920(uint64_t a1, uint64_t a2)
{
  return sub_21BD34948(a1, a2, (unint64_t *)&qword_26AAF2F60, 0x263F087E8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21BD2286C);
}

uint64_t sub_21BD34948(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = a5;
    unint64_t v7 = a3;
    uint64_t v6 = a2;
    uint64_t v9 = a1;
    unint64_t v10 = *v5;
    if (!(*v5 >> 62))
    {
      uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_21BEAAD88();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v12 < v6)
  {
    __break(1u);
    goto LABEL_34;
  }
  if (__OFSUB__(v6, v9))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v8 = v9 - v6;
  if (__OFSUB__(0, v6 - v9))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  unint64_t v10 = *v5;
  uint64_t v23 = v7;
  if (!(*v5 >> 62))
  {
    uint64_t v13 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_36:
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_21BEAAD88();
  swift_bridgeObjectRelease();
LABEL_9:
  uint64_t v14 = v13 + v8;
  if (__OFADD__(v13, v8))
  {
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  unint64_t v10 = *v5;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v5 = v10;
  char v22 = v11;
  uint64_t v13 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v10 & 0x8000000000000000) == 0
    && (v10 & 0x4000000000000000) == 0)
  {
    uint64_t v16 = v10 & 0xFFFFFFFFFFFFFF8;
    if (v14 <= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_20;
    }
    uint64_t v13 = 1;
  }
  if (v10 >> 62) {
    goto LABEL_38;
  }
  uint64_t v17 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v17 <= v14) {
    uint64_t v17 = v14;
  }
  swift_bridgeObjectRetain();
  unint64_t v10 = MEMORY[0x21D49C4A0](v13, v17, 1, v10);
  swift_bridgeObjectRelease();
  unint64_t *v5 = v10;
  uint64_t v16 = v10 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  uint64_t v18 = v16 + 32 + 8 * v9;
  sub_21BC0BE78(0, v23);
  swift_arrayDestroy();
  if (!v8) {
    goto LABEL_28;
  }
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)(v16 + 16);
  }
  if (__OFSUB__(v19, v6))
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t result = v22(v16 + 32 + 8 * v6, v19 - v6, v18);
  if (v10 >> 62)
  {
LABEL_41:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_21BEAAD88();
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t v21 = *(void *)(v16 + 16);
LABEL_26:
  if (__OFADD__(v21, v8))
  {
    __break(1u);
    return result;
  }
  *(void *)(v16 + 16) = v21 + v8;
LABEL_28:

  return sub_21BEAA328();
}

uint64_t sub_21BD34BD8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = result;
  uint64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = v10 - v8;
  if (__OFSUB__(v10, v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (__OFADD__(v6, v11))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v6 + v11 > *(void *)(v5 + 24) >> 1)
  {
    sub_21BD214BC();
    uint64_t v5 = v12;
  }
  uint64_t v13 = v5 + 32 + 40 * v7;
  sub_21BCDAEC4();
  uint64_t result = swift_arrayDestroy();
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v14 = *(void *)(v5 + 16);
  if (__OFSUB__(v14, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)sub_21BD22AF0((char *)(v5 + 32 + 40 * a2), v14 - a2, (char *)(v13 + 40 * v10));
  uint64_t v15 = *(void *)(v5 + 16);
  BOOL v16 = __OFADD__(v15, v11);
  uint64_t v17 = v15 + v11;
  if (v16)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  *(void *)(v5 + 16) = v17;
LABEL_13:
  if (!v10)
  {
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v5;
    return result;
  }
  if (*(void *)(a3 + 16) == v10)
  {
    swift_arrayInitWithCopy();
    goto LABEL_16;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_21BD34D38(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = *v6;
  uint64_t v9 = *(void *)(*v6 + 16);
  if (v9 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v10 = result;
  uint64_t v11 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v12 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (__OFADD__(v9, v13))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v9 + v13 > *(void *)(v8 + 24) >> 1)
  {
    sub_21BD214BC();
    uint64_t v8 = v14;
  }
  uint64_t v15 = v8 + 32 + 40 * v10;
  sub_21BCDAEC4();
  uint64_t result = swift_arrayDestroy();
  if (!v13) {
    goto LABEL_14;
  }
  uint64_t v16 = *(void *)(v8 + 16);
  if (__OFSUB__(v16, a2)) {
    goto LABEL_23;
  }
  uint64_t result = (uint64_t)sub_21BD22AF0((char *)(v8 + 32 + 40 * a2), v16 - a2, (char *)(v15 + 40 * v12));
  uint64_t v17 = *(void *)(v8 + 16);
  BOOL v18 = __OFADD__(v17, v13);
  uint64_t v19 = v17 + v13;
  if (v18)
  {
LABEL_24:
    __break(1u);
    return result;
  }
  *(void *)(v8 + 16) = v19;
LABEL_14:
  if (v12 >= 1) {
    swift_arrayInitWithCopy();
  }
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v6 = v8;
  return result;
}

uint64_t sub_21BD34EA4(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v6 = result;
  uint64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v5, v8))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v5 - v7 > *(void *)(v4 + 24) >> 1)
  {
    sub_21BD214BC();
    uint64_t v4 = v9;
  }
  uint64_t v10 = (char *)(v4 + 32 + 40 * v6);
  sub_21BCDAEC4();
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v11 = *(void *)(v4 + 16);
  if (__OFSUB__(v11, a2)) {
    goto LABEL_19;
  }
  uint64_t result = (uint64_t)sub_21BD22AF0((char *)(v4 + 32 + 40 * a2), v11 - a2, v10);
  uint64_t v12 = *(void *)(v4 + 16);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 - v7;
  if (!v13)
  {
    *(void *)(v4 + 16) = v14;
LABEL_13:
    uint64_t *v2 = v4;
    return result;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_21BD34FB0(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v7 = result;
  uint64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (__OFADD__(v6, v9))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v6 + v9 > *(void *)(v5 + 24) >> 1)
  {
    sub_21BD214BC();
    uint64_t v5 = v12;
    *uint64_t v3 = v12;
  }
  unint64_t v13 = v5 + 32 + 40 * v7;
  sub_21BCDAEC4();
  uint64_t result = swift_arrayDestroy();
  if (!v9)
  {
LABEL_13:
    char v18 = 0;
    unint64_t v19 = v5 + 40 * v7 - 8;
    while ((v18 & 1) == 0)
    {
      v19 += 40;
      uint64_t result = sub_21BC32D00(a3, v19);
      char v18 = 1;
      if (v19 >= v13) {
        return sub_21BD35D00(a3, &qword_267C65710, MEMORY[0x263F8DD68]);
      }
    }
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v14 = *(void *)(v5 + 16);
  if (__OFSUB__(v14, a2))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t result = (uint64_t)sub_21BD22AF0((char *)(v5 + 32 + 40 * a2), v14 - a2, (char *)(v13 + 40));
  uint64_t v15 = *(void *)(v5 + 16);
  BOOL v16 = __OFADD__(v15, v9);
  uint64_t v17 = v15 + v9;
  if (!v16)
  {
    *(void *)(v5 + 16) = v17;
    goto LABEL_13;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_21BD35128(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1)
  {
LABEL_7:
    swift_release();
    return 0;
  }
  uint64_t v2 = 1 - v1;
  uint64_t v3 = (void *)(a1 + 40 * v1 - 8);
  while (1)
  {
    uint64_t v4 = v3[3];
    uint64_t v5 = v3[4];
    __swift_project_boxed_opaque_existential_0Tm(v3, v4);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 32))(v13, v4, v5);
    char v6 = v13[0];
    sub_21BC32D00((uint64_t)v3, (uint64_t)v13);
    if ((v6 & 1) == 0) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
LABEL_6:
    ++v2;
    v3 -= 5;
    if (v2 == 1) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = v14;
  uint64_t v8 = v15;
  __swift_project_boxed_opaque_existential_0Tm(v13, v14);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  BOOL v11 = sub_21BD32738(v9, v10);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  if (!v11) {
    goto LABEL_6;
  }
  swift_release();
  return -v2;
}

unint64_t sub_21BD35268@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a2 + 16) > result)
  {
    return sub_21BC32D00(a2 + 40 * result + 32, a3);
  }
  __break(1u);
  return result;
}

double sub_21BD352B8@<D0>(void (*a1)(uint64_t *)@<X0>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  if (a3)
  {
    *(void *)(a4 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  else
  {
    uint64_t v5 = a2;
    a1(&v5);
  }
  return result;
}

void sub_21BD3530C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x21D49C4A0);
}

void sub_21BD35388()
{
}

void sub_21BD3539C()
{
}

void sub_21BD353B0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = a1;
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(*a1 + 16);
  if (!v5) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = *(void *)(v4 + v7 + 56);
    uint64_t v10 = *(void *)(v4 + v7 + 64);
    __swift_project_boxed_opaque_existential_0Tm((void *)(v4 + v7 + 32), v9);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    if (v12) {
      break;
    }
LABEL_9:
    ++v8;
    v7 += 40;
    if (v5 == v8)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (v11 != a2 || v12 != a3)
  {
    char v14 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  uint64_t v15 = v38;
  if (__OFADD__(v8, 1)) {
    goto LABEL_50;
  }
  unint64_t v16 = *(void *)(v4 + 16);
  if (v8 + 1 == v16)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v17 = v7 + 72;
  unint64_t v18 = v8 + 1;
  while (2)
  {
    if (v18 < v16)
    {
      sub_21BC32D00(v4 + v17, (uint64_t)&v35);
      uint64_t v19 = v36;
      uint64_t v20 = v37;
      __swift_project_boxed_opaque_existential_0Tm(&v35, v36);
      uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
      if (v22)
      {
        if (v21 == a2 && v22 == a3)
        {
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v35);
LABEL_39:
          unint64_t v32 = v18 + 1;
          if (__OFADD__(v18, 1)) {
            goto LABEL_43;
          }
          uint64_t v4 = *v15;
          unint64_t v16 = *(void *)(*v15 + 16);
          ++v18;
          v17 += 40;
          if (v32 == v16) {
            goto LABEL_15;
          }
          continue;
        }
        char v24 = sub_21BEAAE78();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v35);
        if (v24) {
          goto LABEL_39;
        }
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v35);
      }
      if (v18 != v8)
      {
        if ((v8 & 0x8000000000000000) != 0) {
          goto LABEL_45;
        }
        uint64_t v25 = *v15;
        unint64_t v26 = *(void *)(*v15 + 16);
        if (v8 >= v26) {
          goto LABEL_46;
        }
        sub_21BC32D00(v25 + 40 * v8 + 32, (uint64_t)&v35);
        if (v18 >= v26) {
          goto LABEL_47;
        }
        sub_21BC32D00(v25 + v17, (uint64_t)v34);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v15 = v38;
        *uint64_t v38 = v25;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_21BD3539C();
          uint64_t v25 = v33;
          *uint64_t v15 = v33;
        }
        if (v8 >= *(void *)(v25 + 16)) {
          goto LABEL_48;
        }
        uint64_t v28 = v25 + 40 * v8 + 32;
        __swift_destroy_boxed_opaque_existential_0Tm(v28);
        sub_21BC32CE8(v34, v28);
        uint64_t v29 = *v15;
        if (v18 >= *(void *)(*v15 + 16)) {
          goto LABEL_49;
        }
        uint64_t v30 = v29 + v17;
        __swift_destroy_boxed_opaque_existential_0Tm(v29 + v17);
        sub_21BC32CE8(&v35, v30);
      }
      if (__OFADD__(v8++, 1)) {
        goto LABEL_44;
      }
      goto LABEL_39;
    }
    break;
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
}

unint64_t sub_21BD356C4@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_21BD35268(*a1, *a2, a3);
}

unint64_t sub_21BD356FC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21BD356C4(a1, *(uint64_t **)(v2 + 16), a2);
}

unint64_t sub_21BD3571C()
{
  unint64_t result = qword_267C65700;
  if (!qword_267C65700)
  {
    sub_21BD35D5C(255, &qword_267C656F8, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C65700);
  }
  return result;
}

uint64_t sub_21BD35788()
{
  return 0;
}

unint64_t sub_21BD35824()
{
  unint64_t result = qword_267C65708;
  if (!qword_267C65708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C65708);
  }
  return result;
}

uint64_t type metadata accessor for PodcastsManagedQueue()
{
  return self;
}

uint64_t method lookup function for PodcastsManagedQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PodcastsManagedQueue);
}

uint64_t dispatch thunk of PodcastsManagedQueue.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.tailInsertionContentItemID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.queueIDs.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.firstContentItemID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.itemForContentID(id:allowReuse:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.indexForContentID(id:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.replaceSoftQueueItems(newItems:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.shiftHardQueueOnCurrentItemDidChange(fromContentItemID:toContentItemID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.insertHardQueueItems(targetContentItemID:newItems:insertionPosition:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.trimThroughCurrentContentItemID()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.appendToSoftQueue(newItems:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.restoreItems(newItems:restorationTailInsertionContentItemID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.moveContentItemID(_:beforeContentItemID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.moveContentItemID(_:afterContentItemID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.removeContentItemID(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.clearHardQueue(afterContentItemID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

unsigned char *storeEnumTagSinglePayload for PodcastQueueType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x21BD35C3CLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PodcastQueueType()
{
  return &type metadata for PodcastQueueType;
}

uint64_t dispatch thunk of PodcastsQueueItem.contentItemID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueSectionID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueItemID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueType.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueType.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of PodcastsQueueItem.prewarm()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_21BD35D00(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  sub_21BD35D5C(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_21BD35D5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_21BCDAEC4();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_21BD35DBC(uint64_t a1, uint64_t a2)
{
  sub_21BD35D5C(0, &qword_267C64A18, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD35E3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_21BD35E64(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_21BD35EC4(uint64_t a1, uint64_t a2)
{
  sub_21BC1FB08(0, (unint64_t *)&qword_26AAF30C0);
  uint64_t v4 = swift_allocError();
  void *v5 = a2;

  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_21BD35F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a2;
  v4[1] = a3;
  sub_21BD3E750((uint64_t)v4, *(void *)(*(void *)(a1 + 64) + 40), (unint64_t *)&unk_26AAEF8C0, MEMORY[0x263F8D310]);
  return swift_continuation_throwingResume();
}

uint64_t sub_21BD35FA0(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_21BD35FC0(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_21BD35FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 40);
  *(unsigned char *)uint64_t v2 = *(unsigned char *)a2;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a2 + 24);
  return swift_continuation_throwingResume();
}

uint64_t sub_21BD36014(uint64_t a1, char a2, void *a3)
{
  if (a3) {
    return sub_21BD35EC4(*(void *)(a1 + 32), (uint64_t)a3);
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return sub_21BD35FA0(v4, a2);
}

uint64_t sub_21BD36068(void *a1)
{
  uint64_t v2 = v1;
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v1 + 24) = 0u;
  uint64_t v4 = v1 + 24;
  *(void *)(v1 + 56) = 0;
  *(_OWORD *)(v1 + 40) = 0u;
  uint64_t v5 = swift_unknownObjectWeakAssign();
  unint64_t v6 = (void *)MEMORY[0x21D49EBF0](v5);
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = objc_msgSend(v6, sel_playbackEngine);

    if (v8)
    {
      if ((objc_msgSend(v8, sel_isSystemPodcastsApplication) & 1) == 0)
      {
        id v9 = objc_allocWithZone((Class)sub_21BEA8EF8());
        OUTLINED_FUNCTION_8_0();
        uint64_t v10 = (void *)sub_21BEA8EE8();
        sub_21BEA8EA8();
        sub_21BEA8E98();
        OUTLINED_FUNCTION_26_14();
        sub_21BEA8E78();
        sub_21BEA8E88();
        swift_release();
        swift_release();

        swift_beginAccess();
        sub_21BD3EBF4((uint64_t)v12, v4);
        swift_endAccess();
        return v2;
      }
    }
  }

  return v2;
}

uint64_t sub_21BD361E0()
{
  id v0 = objc_allocWithZone((Class)sub_21BEA8E68());
  return sub_21BEA8E48();
}

id sub_21BD36220(void *a1, void *a2)
{
  uint64_t v3 = sub_21BEA8DB8();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7, v8);
  OUTLINED_FUNCTION_49();
  uint64_t v11 = v10 - v9;
  if (objc_msgSend(a1, sel_type) == (id)3)
  {
    id v12 = objc_msgSend(a2, sel_mpc_clientPreferredLanguages);
    unint64_t v13 = (void *)sub_21BEAA308();

    if (v13[2])
    {
      uint64_t v15 = v13[4];
      uint64_t v14 = v13[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_21BEA8DA8();
      uint64_t v15 = sub_21BEA8D78();
      uint64_t v14 = v16;
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v3);
    }
    uint64_t v17 = (void *)OUTLINED_FUNCTION_5_29();
    id v18 = sub_21BD3C078(v17);
    if (v18) {
      goto LABEL_10;
    }
    sub_21BD3C520(a1);
    uint64_t v19 = (void *)OUTLINED_FUNCTION_5_29();
    id v18 = sub_21BD393B4(v19);
    if (v18
      || (id v18 = sub_21BD3ABCC(a1)) != 0
      || (OUTLINED_FUNCTION_5_29(), sub_21BD3B3F0(), v18)
      || (v20 = (void *)OUTLINED_FUNCTION_5_29(), (id v18 = sub_21BD3C5B8(v20)) != 0))
    {
LABEL_10:
      id v21 = v18;
      swift_bridgeObjectRelease();
      return v21;
    }
    id v21 = sub_21BD3C924(a1, a2, v15, v14);
    swift_bridgeObjectRelease();
    if (v21) {
      return v21;
    }
  }

  return a1;
}

uint64_t sub_21BD363FC()
{
  OUTLINED_FUNCTION_13();
  v0[28] = v1;
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  v0[29] = v3;
  OUTLINED_FUNCTION_21_0(v3);
  v0[30] = swift_task_alloc();
  v0[31] = swift_task_alloc();
  v0[32] = swift_task_alloc();
  uint64_t v4 = sub_21BEA8C58();
  v0[33] = v4;
  v0[34] = *(void *)(v4 - 8);
  v0[35] = swift_task_alloc();
  v0[36] = swift_task_alloc();
  sub_21BD3E374(0, &qword_267C65768, type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions, v2);
  OUTLINED_FUNCTION_21_0(v5);
  v0[37] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions(0);
  v0[38] = v6;
  OUTLINED_FUNCTION_21_0(v6);
  v0[39] = swift_task_alloc();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_21BD365B4()
{
  uint64_t v1 = sub_21BD3E3D8(*(void **)(v0 + 224));
  uint64_t v2 = MEMORY[0x263F8EE58];
  if (!v1) {
    goto LABEL_10;
  }
  unint64_t v3 = sub_21BD37A5C(v1);
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_10;
  }
  sub_21BEAA178();
  sub_21BCDFBA8(v3, (_OWORD *)(v0 + 120));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 304);
  if (!*(void *)(v0 + 144))
  {
    sub_21BD3E84C(v0 + 120, (uint64_t)&qword_26AAF3A00, v2 + 8, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
    __swift_storeEnumTagSinglePayload(v5, 1, 1, v4);
    goto LABEL_9;
  }
  int v6 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload(v5, v6 ^ 1u, 1, v4);
  if (__swift_getEnumTagSinglePayload(v5, 1, v4) == 1)
  {
LABEL_9:
    sub_21BD3E84C(*(void *)(v0 + 296), (uint64_t)&unk_267C65768, (uint64_t)type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E374);
LABEL_10:
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    sub_21BEAA178();
    *(void *)(v0 + 216) = 6001;
    OUTLINED_FUNCTION_9_30();
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_47_9();
    id v12 = (void *)OUTLINED_FUNCTION_46_10();
    *(void *)(v0 + 200) = sub_21BD3E3D8(v12);
    sub_21BD3E7C8();
    sub_21BEAA1E8();
    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA0C8();
    _s3__C4CodeOMa_2(0);
    sub_21BD3E9B8((unint64_t *)&unk_26AAF3660, _s3__C4CodeOMa_2);
    sub_21BEAA9B8();
    OUTLINED_FUNCTION_51_9();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
LABEL_11:
    OUTLINED_FUNCTION_28_15();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
    goto LABEL_12;
  }
  uint64_t v7 = *(unsigned char **)(v0 + 312);
  sub_21BD3E8A0(*(void *)(v0 + 296), (uint64_t)v7);
  switch(*v7)
  {
    case 1:
      uint64_t v15 = *(void *)(v0 + 312);
      uint64_t v16 = v15 + *(int *)(*(void *)(v0 + 304) + 20);
      if (!*(void *)(v16
                      + *(int *)(type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0)
                               + 20)))
      {
        uint64_t v33 = v15;
LABEL_32:
        sub_21BD3EA5C(v33, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
        goto LABEL_33;
      }
      sub_21BC0BE78(0, &qword_267C65778);
      uint64_t v17 = swift_bridgeObjectRetain();
      id v18 = sub_21BD3B368(v17, (SEL *)&selRef_initWithResponseButtonActionDictionary_);
      *(void *)(v0 + 328) = v18;
      if (objc_msgSend(v18, sel_type) == (id)2)
      {
        sub_21BCBB040(v18, (SEL *)&selRef_URLString);
        if (!v19)
        {
LABEL_20:
          uint64_t v47 = *(void *)(v0 + 312);
          sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
          sub_21BEAA178();
          *(void *)(v0 + 208) = 6002;
          OUTLINED_FUNCTION_9_30();
          sub_21BEAAC48();
          OUTLINED_FUNCTION_4_4();
          sub_21BEAA238();
          *(void *)(v0 + 152) = sub_21BCBB040(v18, (SEL *)&selRef_URLString);
          *(void *)(v0 + 160) = v22;
          sub_21BD3E96C(0, (unint64_t *)&unk_26AAEF8C0, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
          sub_21BEAA1E8();
          sub_21BEAA238();
          swift_bridgeObjectRelease();
          sub_21BEAA238();
          sub_21BEAA0C8();
          _s3__C4CodeOMa_2(0);
          sub_21BD3E9B8((unint64_t *)&unk_26AAF3660, _s3__C4CodeOMa_2);
          sub_21BEAA9B8();
          OUTLINED_FUNCTION_49_7();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_willThrow();

          goto LABEL_21;
        }
        uint64_t v20 = *(void *)(v0 + 264);
        uint64_t v21 = *(void *)(v0 + 240);
        sub_21BEA8C38();
        swift_bridgeObjectRelease();
        if (__swift_getEnumTagSinglePayload(v21, 1, v20) == 1)
        {
          sub_21BD3E84C(*(void *)(v0 + 240), (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E374);
          goto LABEL_20;
        }
        (*(void (**)(void, void, void))(*(void *)(v0 + 272) + 32))(*(void *)(v0 + 280), *(void *)(v0 + 240), *(void *)(v0 + 264));
        int v46 = (void *)swift_task_alloc();
        *(void *)(v0 + 336) = v46;
        *int v46 = v0;
        v46[1] = sub_21BD37624;
LABEL_28:
        OUTLINED_FUNCTION_18();
        return sub_21BD37E5C(v35);
      }
      else
      {
        id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F89330]), sel_init);
        *(void *)(v0 + 344) = v38;
        id v39 = objc_msgSend(self, sel_activeAccount);
        id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F89360]), sel_initWithIdentity_, v39);
        *(void *)(v0 + 352) = v40;

        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 368;
        *(void *)(v0 + 24) = sub_21BD377D0;
        uint64_t v41 = swift_continuation_init();
        *(void *)(v0 + 80) = MEMORY[0x263EF8330];
        *(void *)(v0 + 88) = 0x40000000;
        *(void *)(v0 + 96) = sub_21BD36014;
        *(void *)(v0 + 104) = &block_descriptor_28_0;
        *(void *)(v0 + 112) = v41;
        objc_msgSend(v38, sel_handleButtonAction_usingRequestContext_withCompletionHandler_, v18, v40, v0 + 80);
        OUTLINED_FUNCTION_18();
        return MEMORY[0x270FA23F0](v42);
      }
    case 2:
      uint64_t v24 = *(void *)(v0 + 312);
      uint64_t v25 = v24 + *(int *)(*(void *)(v0 + 304) + 20);
      unint64_t v26 = *(void **)(v25
                     + *(int *)(type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0)
                              + 24));
      if (v26)
      {
        id v27 = v26;
        id v28 = objc_msgSend(v27, sel_mediaLibrary);
        if (!v28)
        {
          __break(1u);
          JUMPOUT(0x21BD37478);
        }
        uint64_t v29 = v28;
        sub_21BD3E96C(0, (unint64_t *)&qword_26AAF3910, v2 + 8, MEMORY[0x263F8E0F8]);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_21BEEB430;
        *(void *)(v30 + 56) = sub_21BC0BE78(0, (unint64_t *)&unk_26AAEF930);
        *(void *)(v30 + 32) = v27;
        id v31 = v27;
        unint64_t v32 = (void *)sub_21BEAA2F8();
        swift_bridgeObjectRelease();
        LOBYTE(v30) = objc_msgSend(v29, sel_deleteItems_, v32);

        uint64_t v24 = *(void *)(v0 + 312);
        if (v30)
        {
          sub_21BD3EA5C(*(void *)(v0 + 312), (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);

LABEL_33:
          OUTLINED_FUNCTION_3_36();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          OUTLINED_FUNCTION_7_0();
LABEL_12:
          OUTLINED_FUNCTION_18();
          __asm { BRAA            X1, X16 }
        }
        sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
        sub_21BEAA178();
        OUTLINED_FUNCTION_43_9();
        *(void *)(v0 + 176) = 6003;
        OUTLINED_FUNCTION_9_30();
        sub_21BEAAC48();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_47_9();
        id v44 = v31;
        id v45 = objc_msgSend(v44, sel_description);
        sub_21BEAA178();

        sub_21BEAA238();
        swift_bridgeObjectRelease();
        sub_21BEAA238();
        sub_21BEAA0C8();
        _s3__C4CodeOMa_2(0);
        sub_21BD3E9B8((unint64_t *)&unk_26AAF3660, _s3__C4CodeOMa_2);
        sub_21BEAA9B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_willThrow();
      }
      else
      {
        sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
        sub_21BEAA178();
        *(void *)(v0 + 192) = 6002;
        OUTLINED_FUNCTION_9_30();
        sub_21BEAAC48();
        OUTLINED_FUNCTION_47_9();
        sub_21BEAA238();
        *(void *)(v0 + 168) = 0;
        sub_21BD3E904();
        sub_21BEAA1E8();
        sub_21BEAA238();
        swift_bridgeObjectRelease();
        sub_21BEAA0C8();
        _s3__C4CodeOMa_2(0);
        sub_21BD3E9B8((unint64_t *)&unk_26AAF3660, _s3__C4CodeOMa_2);
        OUTLINED_FUNCTION_23_21();
        sub_21BEAA9B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_willThrow();
      }
      uint64_t v23 = v24;
      goto LABEL_40;
    case 3:
      uint64_t v33 = *(void *)(v0 + 312);
      goto LABEL_32;
    default:
      uint64_t v8 = *(void *)(v0 + 256);
      uint64_t v9 = *(void *)(v0 + 264);
      sub_21BD3E6BC(*(void *)(v0 + 312) + *(int *)(*(void *)(v0 + 304) + 20), v8);
      if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
      {
        uint64_t v47 = *(void *)(v0 + 312);
        uint64_t v10 = *(void *)(v0 + 248);
        sub_21BD3E84C(*(void *)(v0 + 256), (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E374);
        sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
        sub_21BEAA178();
        *(void *)(v0 + 184) = 6002;
        OUTLINED_FUNCTION_9_30();
        sub_21BEAAC48();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_47_9();
        uint64_t v11 = OUTLINED_FUNCTION_46_10();
        sub_21BD3E6BC(v11, v10);
        sub_21BEAA1E8();
        sub_21BEAA238();
        swift_bridgeObjectRelease();
        sub_21BEAA0C8();
        _s3__C4CodeOMa_2(0);
        sub_21BD3E9B8((unint64_t *)&unk_26AAF3660, _s3__C4CodeOMa_2);
        OUTLINED_FUNCTION_23_21();
        sub_21BEAA9B8();
        OUTLINED_FUNCTION_51_9();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_willThrow();
LABEL_21:
        uint64_t v23 = v47;
LABEL_40:
        sub_21BD3EA5C(v23, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
        goto LABEL_11;
      }
      (*(void (**)(void, void, void))(*(void *)(v0 + 272) + 32))(*(void *)(v0 + 288), *(void *)(v0 + 256), *(void *)(v0 + 264));
      uint64_t v34 = (void *)swift_task_alloc();
      *(void *)(v0 + 320) = v34;
      *uint64_t v34 = v0;
      v34[1] = sub_21BD37488;
      goto LABEL_28;
  }
}

uint64_t sub_21BD37488()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_21BD37554()
{
  uint64_t v1 = v0[39];
  (*(void (**)(void, void))(v0[34] + 8))(v0[36], v0[33]);
  sub_21BD3EA5C(v1, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
  OUTLINED_FUNCTION_3_36();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v2();
}

uint64_t sub_21BD37624()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_21BD376F0()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 264);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_21BD3EA5C(v1, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
  OUTLINED_FUNCTION_3_36();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v5();
}

uint64_t sub_21BD377D0()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_4();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 360) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_21BD378B0()
{
  uint64_t v2 = *(void **)(v0 + 344);
  uint64_t v1 = *(void **)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 312);

  sub_21BD3EA5C(v3, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
  OUTLINED_FUNCTION_3_36();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v4();
}

uint64_t sub_21BD3797C()
{
  uint64_t v1 = (void *)v0[44];
  uint64_t v2 = (void *)v0[43];
  uint64_t v3 = (void *)v0[41];
  uint64_t v4 = v0[39];
  swift_willThrow();

  sub_21BD3EA5C(v4, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
  OUTLINED_FUNCTION_28_15();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v5();
}

unint64_t sub_21BD37A5C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_21BD3EA00(0, &qword_267C63288, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DFB0]);
    uint64_t v1 = (void *)sub_21BEAADB8();
  }
  else
  {
    uint64_t v1 = (void *)MEMORY[0x263F8EE80];
  }
  sub_21BC272DC(v40);
  uint64_t v2 = v40[0];
  uint64_t v3 = v40[3];
  int64_t v28 = (unint64_t)(v40[2] + 64) >> 6;
  uint64_t v29 = v40[1];
  unint64_t v4 = v40[4];
  uint64_t v5 = &__src[40];
  uint64_t v6 = &__dst[40];
  uint64_t v7 = &v34;
  uint64_t v8 = &v36;
  unint64_t result = swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v30 = (v4 - 1) & v4;
  int64_t v31 = v3;
  for (unint64_t i = __clz(__rbit64(v4)) | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    sub_21BC27898(*(void *)(v2 + 48) + 40 * i, (uint64_t)__src);
    sub_21BC1E7C4(*(void *)(v2 + 56) + 32 * i, (uint64_t)v5);
    memcpy(__dst, __src, sizeof(__dst));
    sub_21BC27898((uint64_t)__dst, (uint64_t)v33);
    if (!swift_dynamicCast())
    {
      sub_21BD3EA5C((uint64_t)__dst, (void (*)(void))sub_21BD3EAB0);
      swift_bridgeObjectRelease();
      sub_21BC1FC74();
      swift_release();
      return 0;
    }
    sub_21BC1E7C4((uint64_t)v6, (uint64_t)v33);
    sub_21BD3EA5C((uint64_t)__dst, (void (*)(void))sub_21BD3EAB0);
    sub_21BC1DDD0(v33, v7);
    long long v35 = v32;
    sub_21BC1DDD0(v7, v8);
    long long v15 = v35;
    sub_21BC1DDD0(v8, v37);
    sub_21BC1DDD0(v37, &v35);
    unint64_t result = sub_21BC3F03C();
    unint64_t v16 = result;
    if (v17)
    {
      id v18 = v8;
      uint64_t v19 = v7;
      uint64_t v20 = v6;
      uint64_t v21 = v2;
      uint64_t v22 = v5;
      uint64_t v23 = (_OWORD *)(v1[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v23 = v15;
      uint64_t v5 = v22;
      uint64_t v2 = v21;
      uint64_t v6 = v20;
      uint64_t v7 = v19;
      uint64_t v8 = v18;
      uint64_t v24 = (_OWORD *)(v1[7] + 32 * v16);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v24);
      unint64_t result = (unint64_t)sub_21BC1DDD0(&v35, v24);
      goto LABEL_28;
    }
    if (v1[2] >= v1[3]) {
      break;
    }
    *(void *)((char *)v1 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v1[6] + 16 * result) = v15;
    unint64_t result = (unint64_t)sub_21BC1DDD0(&v35, (_OWORD *)(v1[7] + 32 * result));
    uint64_t v25 = v1[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_34;
    }
    v1[2] = v27;
LABEL_28:
    unint64_t v4 = v30;
    uint64_t v3 = v31;
    if (v30) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_35;
    }
    if (v11 >= v28) {
      goto LABEL_31;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v11);
    int64_t v13 = v3 + 1;
    if (!v12)
    {
      int64_t v13 = v3 + 2;
      if (v3 + 2 >= v28) {
        goto LABEL_31;
      }
      unint64_t v12 = *(void *)(v29 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v3 + 3;
        if (v3 + 3 >= v28) {
          goto LABEL_31;
        }
        unint64_t v12 = *(void *)(v29 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v3 + 4;
          if (v3 + 4 >= v28) {
            goto LABEL_31;
          }
          unint64_t v12 = *(void *)(v29 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v3 + 5;
            if (v3 + 5 >= v28) {
              goto LABEL_31;
            }
            unint64_t v12 = *(void *)(v29 + 8 * v13);
            if (!v12)
            {
              int64_t v14 = v3 + 6;
              while (v14 < v28)
              {
                unint64_t v12 = *(void *)(v29 + 8 * v14++);
                if (v12)
                {
                  int64_t v13 = v14 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_21BC1FC74();
              return (unint64_t)v1;
            }
          }
        }
      }
    }
LABEL_21:
    uint64_t v30 = (v12 - 1) & v12;
    int64_t v31 = v13;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_21BD37E5C(uint64_t a1)
{
  v1[15] = a1;
  sub_21BEAA3F8();
  v1[16] = sub_21BEAA3E8();
  uint64_t v3 = sub_21BEAA388();
  v1[17] = v3;
  v1[18] = v2;
  return MEMORY[0x270FA2498](sub_21BD37EF4, v3, v2);
}

uint64_t sub_21BD37EF4()
{
  id v1 = (id)MPUIApplication();
  v0[19] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_21BEA8BF8();
    v0[20] = v3;
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_21BD3E9B8(&qword_267C63018, type metadata accessor for OpenExternalURLOptionsKey);
    sub_21BEAA0C8();
    uint64_t v4 = sub_21BEAA088();
    v0[21] = v4;
    swift_bridgeObjectRelease();
    v0[2] = v0;
    v0[7] = v0 + 22;
    v0[3] = sub_21BD38104;
    uint64_t v5 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_21BC51174;
    v0[13] = &block_descriptor_31;
    v0[14] = v5;
    objc_msgSend(v2, sel_openURL_options_completionHandler_, v3, v4, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_6_0();
    return v6();
  }
}

uint64_t sub_21BD38104()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_4();
  *id v1 = v0;
  uint64_t v3 = *(void *)(v2 + 144);
  uint64_t v4 = *(void *)(v2 + 136);
  return MEMORY[0x270FA2498](sub_21BD381E0, v4, v3);
}

uint64_t sub_21BD381E0()
{
  id v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[21];
  uint64_t v3 = (void *)v0[19];
  swift_release();

  OUTLINED_FUNCTION_6_0();
  return v4();
}

void sub_21BD38258()
{
  OUTLINED_FUNCTION_34();
  uint64_t v2 = v1;
  uint64_t v3 = sub_21BEA8DB8();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7, v8);
  OUTLINED_FUNCTION_49();
  uint64_t v11 = v10 - v9;
  OUTLINED_FUNCTION_2();
  sub_21BD3DF08(v0 + 24, (uint64_t)v40);
  if (!*((void *)&v40[1] + 1))
  {
    sub_21BD3DF98((uint64_t)v40);
    goto LABEL_8;
  }
  sub_21BC32CE8(v40, (uint64_t)v39);
  unint64_t v12 = (void *)MEMORY[0x21D49EBF0](v0 + 16);
  if (!v12
    || (int64_t v13 = v12,
        id v14 = objc_msgSend(v12, sel_playbackEngine),
        v13,
        !v14))
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v39);
LABEL_8:
    sub_21BEAA0C8();
    goto LABEL_13;
  }
  sub_21BEA8DA8();
  uint64_t v15 = sub_21BEA8D78();
  uint64_t v17 = v16;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v3);
  uint64_t v18 = swift_allocObject();
  *(unsigned char *)(v18 + 16) = 0;
  uint64_t v19 = (void *)OUTLINED_FUNCTION_13_26(v18, MEMORY[0x263F8EE78]);
  v19[13] = v20;
  v19[14] = v15;
  v19[15] = v17;
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = 0;
  swift_bridgeObjectRetain();
  id v38 = v14;
  id v22 = objc_msgSend(v14, sel_eventStream);
  uint64_t v23 = (void *)swift_allocObject();
  void v23[2] = v21;
  void v23[3] = v18;
  v23[4] = v2;
  *(void *)&v40[2] = sub_21BD3EB5C;
  *((void *)&v40[2] + 1) = v23;
  *(void *)&v40[0] = MEMORY[0x263EF8330];
  *((void *)&v40[0] + 1) = 1107296256;
  *(void *)&v40[1] = sub_21BD39354;
  *((void *)&v40[1] + 1) = &block_descriptor_39;
  uint64_t v24 = _Block_copy(v40);
  swift_retain();
  swift_retain();
  id v25 = v2;
  swift_release();
  objc_msgSend(v22, sel_performQuery_, v24);
  _Block_release(v24);

  OUTLINED_FUNCTION_2();
  memcpy(v40, (const void *)(v18 + 16), sizeof(v40));
  sub_21BD3E1B4((uint64_t)v40);
  sub_21BD4110C();
  sub_21BD3E274((uint64_t)v40);
  __swift_project_boxed_opaque_existential_0Tm(v39, v39[3]);
  BOOL v26 = (void *)sub_21BEA8EB8();
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_21BEA8E58();
  if (v28)
  {
    uint64_t v29 = v27;
  }
  else
  {
    OUTLINED_FUNCTION_39_12();
    uint64_t v29 = (uint64_t)sub_21BD3DCF0();
  }
  uint64_t v30 = v28;
  uint64_t v31 = sub_21BEA8E38();
  if (!v32) {
    uint64_t v31 = (uint64_t)sub_21BD3DCF0();
  }
  uint64_t v33 = v31;
  uint64_t v34 = v32;
  swift_bridgeObjectRelease();
  sub_21BD3E374(0, (unint64_t *)&qword_26AAF3658, (uint64_t (*)(uint64_t))sub_21BD3EB68, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21BEEB3A0;
  *(void *)(inited + 32) = sub_21BEAA178();
  *(void *)(inited + 40) = v36;
  *(void *)(inited + 48) = v29;
  *(void *)(inited + 56) = v30;
  *(void *)(inited + 64) = sub_21BEAA178();
  *(void *)(inited + 72) = v37;
  *(void *)(inited + 80) = v33;
  *(void *)(inited + 88) = v34;
  sub_21BEAA0C8();

  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v39);
LABEL_13:
  OUTLINED_FUNCTION_33();
}

void sub_21BD38698(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = objc_msgSend(a1, sel_findPreviousEventWithType_matchingPayload_, @"remote-control-begin", 0);
  if (v8)
  {
    id v9 = v8;
    id v71 = a4;
    uint64_t v10 = (unsigned char *)(a2 + 16);
    uint64_t v11 = (char *)objc_msgSend(a1, sel_cursorUntilEvent_, v8);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2 + 16;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_21BD3EBCC;
    *(void *)(v13 + 24) = v12;
    uint64_t v81 = sub_21BD401A4;
    uint64_t v82 = v13;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v79 = sub_21BD35E64;
    uint64_t v80 = &block_descriptor_49_0;
    id v14 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_enumeratePreviousEventsWithType_usingBlock_, @"queue-add", v14);
    _Block_release(v14);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
      goto LABEL_58;
    }
    uint64_t v74 = v9;
    id v16 = objc_msgSend(v11, sel_findPreviousEventWithType_matchingPayload_, @"session-reuse", 0);
    if (v16)
    {

      swift_beginAccess();
      *uint64_t v10 = 1;
    }
    uint64_t v72 = a3;
    uint64_t v73 = (unsigned char *)(a3 + 16);
    sub_21BD3E374(0, (unint64_t *)&unk_26AAF3070, (uint64_t (*)(uint64_t))type metadata accessor for MPCPlaybackEngineEventType, MEMORY[0x263F8E0F8]);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_21BEEB3A0;
    *(void *)(v17 + 32) = @"container-begin";
    *(void *)(v17 + 40) = @"container-end";
    type metadata accessor for MPCPlaybackEngineEventType(0);
    uint64_t v18 = @"container-begin";
    uint64_t v19 = @"container-end";
    uint64_t v20 = (void *)sub_21BEAA2F8();
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(a1, sel_findPreviousEventWithTypes_matchingPayload_, v20, 0);

    if (!v21)
    {
LABEL_22:
      swift_beginAccess();
      if (*v10 == 1)
      {
        swift_beginAccess();
        *uint64_t v73 = 0;
      }
      id v39 = objc_msgSend(a1, sel_findPreviousEventWithType_matchingPayload_, @"session-begin", 0, v70);
      if (!v39)
      {
        swift_release();

        swift_unknownObjectRelease();
        return;
      }
      uint64_t v10 = v39;
      id v40 = objc_msgSend(a1, sel_cursorUntilEvent_, v39);
      uint64_t v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_21BEEB3A0;
      *(void *)(v41 + 32) = @"item-begin";
      *(void *)(v41 + 40) = @"item-end";
      uint64_t v42 = @"item-begin";
      uint64_t v43 = @"item-end";
      id v44 = (void *)sub_21BEAA2F8();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(v40, sel_findPreviousEventWithTypes_matchingPayload_, v44, 0);

      if (v9)
      {
        id v45 = objc_msgSend(v9, sel_type);
        uint64_t v46 = sub_21BEAA178();
        uint64_t v48 = v47;
        if (v46 == sub_21BEAA178() && v48 == v49)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          uint64_t v11 = (char *)&selRef_setWillBecomeActivePlayerItemHandler_;
          char v51 = sub_21BEAAE78();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v51 & 1) == 0)
          {
            if (qword_26AAF3680 == -1)
            {
LABEL_32:
              uint64_t v52 = sub_21BEA9B18();
              __swift_project_value_buffer(v52, (uint64_t)qword_26AAF65B0);
              uint64_t v53 = sub_21BEA9B08();
              os_log_type_t v54 = sub_21BEAA6B8();
              if (os_log_type_enabled(v53, v54))
              {
                uint64_t v55 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v55 = 0;
                _os_log_impl(&dword_21BB87000, v53, v54, "[MPCDialogHandler] - ❗️Current item is outside of an item event", v55, 2u);
                MEMORY[0x21D49EAD0](v55, -1, -1);
              }

              id v56 = [v71 v11 + 2200];
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();

              if (v56 == (id)2)
              {
                swift_beginAccess();
                *(unsigned char *)(v72 + 16) = 4;
                *(unsigned char *)(v72 + 48) = 0;
              }
              goto LABEL_55;
            }
LABEL_58:
            swift_once();
            goto LABEL_32;
          }
        }
        id v57 = objc_msgSend(v9, sel_payload);
        type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
        sub_21BD3E9B8((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
        uint64_t v58 = MEMORY[0x263F8EE58] + 8;
        uint64_t v59 = sub_21BEAA0A8();

        uint64_t v60 = @"item-ids";
        sub_21BCDFC04(v59, &aBlock);

        swift_bridgeObjectRelease();
        if (v80)
        {
          sub_21BC0BE78(0, &qword_26AAF2E30);
          if (swift_dynamicCast())
          {
            id v61 = objc_msgSend(v75, sel_prioritizedStoreStringIdentifiersForPersonID_, 0);
            uint64_t v62 = sub_21BEAA308();

            swift_beginAccess();
            *(void *)(v72 + 24) = v62;
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          sub_21BD3E84C((uint64_t)&aBlock, (uint64_t)&qword_26AAF3A00, v58, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
        }
        id v63 = objc_msgSend(v9, sel_payload);
        uint64_t v64 = MEMORY[0x263F8EE58] + 8;
        uint64_t v65 = sub_21BEAA0A8();

        uint64_t v66 = @"item-metadata";
        sub_21BCDFC04(v65, &aBlock);

        swift_bridgeObjectRelease();
        if (!v80)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();

          uint64_t v68 = MEMORY[0x263F8D8F0];
          uint64_t v69 = v64;
LABEL_54:
          sub_21BD3E84C((uint64_t)&aBlock, (uint64_t)&qword_26AAF3A00, v69, v68, (void (*)(void))sub_21BD3E96C);
LABEL_55:
          swift_release();
          return;
        }
        sub_21BC0BC50();
        if (swift_dynamicCast())
        {
          double v67 = @"item-has-video";
          sub_21BCDFC04(v76, &aBlock);

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          if (v80)
          {
            if ((swift_dynamicCast() & 1) != 0 && v76 == 1)
            {
              swift_beginAccess();
              *(unsigned char *)(v72 + 16) = 4;
              *(unsigned char *)(v72 + 48) = 0;
            }
            goto LABEL_55;
          }
          uint64_t v69 = MEMORY[0x263F8EE58] + 8;
          uint64_t v68 = MEMORY[0x263F8D8F0];
          goto LABEL_54;
        }
        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }

      return;
    }
    id v22 = objc_msgSend(v21, sel_type);
    uint64_t v23 = sub_21BEAA178();
    uint64_t v25 = v24;
    if (v23 == sub_21BEAA178() && v25 == v26)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v28 = sub_21BEAAE78();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0) {
        goto LABEL_21;
      }
    }
    id v29 = objc_msgSend(v21, sel_payload);
    type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
    sub_21BD3E9B8((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
    uint64_t v30 = MEMORY[0x263F8EE58] + 8;
    uint64_t v31 = sub_21BEAA0A8();

    uint64_t v32 = @"container-kind";
    sub_21BCDFC04(v31, &aBlock);

    swift_bridgeObjectRelease();
    if (v80)
    {
      sub_21BC0BE78(0, &qword_267C64E70);
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_21:

        goto LABEL_22;
      }
      id v33 = objc_msgSend(v21, sel_payload);
      uint64_t v30 = MEMORY[0x263F8EE58] + 8;
      uint64_t v34 = sub_21BEAA0A8();

      long long v35 = @"container-ids";
      sub_21BCDFC04(v34, &aBlock);

      swift_bridgeObjectRelease();
      if (v80)
      {
        sub_21BC0BE78(0, &qword_26AAF2E30);
        if (swift_dynamicCast())
        {
          id v36 = v77;
          char v37 = sub_21BD40E24(v36);
          swift_beginAccess();
          *(unsigned char *)(v72 + 16) = v37;
          id v38 = objc_msgSend(v77, sel_prioritizedStoreStringIdentifiersForPersonID_, 0);
          uint64_t v70 = sub_21BEAA308();

          swift_beginAccess();
          *(void *)(v72 + 32) = v70;
          swift_bridgeObjectRelease();
          goto LABEL_22;
        }

        goto LABEL_21;
      }
    }
    sub_21BD3E84C((uint64_t)&aBlock, (uint64_t)&qword_26AAF3A00, v30, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
    goto LABEL_22;
  }
}

uint64_t sub_21BD39354(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_21BD393B4(void *a1)
{
  uint64_t v3 = (void *)MEMORY[0x21D49EBF0](v1 + 16);
  id v4 = v3;
  if (!v3) {
    return v4;
  }
  id v5 = objc_msgSend(v3, sel_playbackEngine);

  if (!v5) {
    return 0;
  }
  id v6 = objc_msgSend(a1, sel_error);
  if (!v6)
  {
LABEL_18:

    return 0;
  }
  uint64_t v7 = v6;
  swift_getErrorValue();
  sub_21BEAA178();
  id v8 = (void *)sub_21BEAAF28();
  if (!v8) {
    goto LABEL_12;
  }

  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_21BEAA178();
  id v9 = (void *)sub_21BEAAF18();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    swift_getErrorValue();
    sub_21BEAA178();
    id v9 = (void *)sub_21BEAAF18();
    if (!v9)
    {
      swift_bridgeObjectRelease();
      swift_getErrorValue();
      sub_21BEAA178();
      id v9 = (void *)sub_21BEAAF18();
      if (!v9)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        return 0;
      }
    }
  }

  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v5, sel_queueController);
  if (!v10
    || (uint64_t v11 = v10, v12 = objc_msgSend(v10, sel_currentItem), v11, !v12))
  {
    if (qword_26AAF3680 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_21BEA9B18();
    __swift_project_value_buffer(v16, (uint64_t)qword_26AAF65B0);
    uint64_t v17 = sub_21BEA9B08();
    os_log_type_t v18 = sub_21BEAA6C8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21BB87000, v17, v18, "[MPCDialogHandler] - ❗️No currentItem in QueueController", v19, 2u);
      MEMORY[0x21D49EAD0](v19, -1, -1);
    }
    else
    {
    }
    goto LABEL_18;
  }
  sub_21BD397B8();
  id v4 = v13;
  if (v13)
  {
    sub_21BC0BE78(0, &qword_267C65740);
    id v14 = objc_msgSend(a1, sel_statusCode);
    id v15 = v7;
    id v4 = sub_21BD39724((uint64_t)v14, v4, v7);
  }
  else
  {
  }
  return v4;
}

id sub_21BD39724(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v6 = (void *)sub_21BEA8B08();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_statusWithCode_dialog_error_, a1, a2, v6);

  return v7;
}

void sub_21BD397B8()
{
  OUTLINED_FUNCTION_34();
  uint64_t v166 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  id v6 = v5;
  uint64_t v7 = sub_21BEA8C58();
  OUTLINED_FUNCTION_0_3();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10, v11, v12);
  OUTLINED_FUNCTION_77();
  uint64_t v15 = v13 - v14;
  MEMORY[0x270FA5388](v16, v17, v18);
  uint64_t v20 = (char *)v150 - v19;
  sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  uint64_t v22 = OUTLINED_FUNCTION_21_0(v21);
  MEMORY[0x270FA5388](v22, v23, v24);
  OUTLINED_FUNCTION_77();
  uint64_t v167 = v25 - v26;
  uint64_t v30 = MEMORY[0x270FA5388](v27, v28, v29);
  uint64_t v164 = (uint64_t)v150 - v31;
  uint64_t v34 = MEMORY[0x270FA5388](v30, v32, v33);
  id v36 = (char *)v150 - v35;
  MEMORY[0x270FA5388](v34, v37, v38);
  uint64_t v170 = (uint64_t)v150 - v39;
  uint64_t v168 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions(0);
  OUTLINED_FUNCTION_24();
  MEMORY[0x270FA5388](v40, v41, v42);
  OUTLINED_FUNCTION_77();
  id v45 = (unsigned char *)(v43 - v44);
  MEMORY[0x270FA5388](v46, v47, v48);
  v169 = (char *)v150 - v49;
  id v165 = v6;
  id v50 = objc_msgSend(v6, sel_mediaItem);
  char v51 = v50;
  uint64_t v162 = v15;
  if (v50) {
    id v52 = objc_msgSend(v50, sel_mediaLibrary);
  }
  else {
    id v52 = 0;
  }
  id v53 = objc_msgSend(self, sel_deviceMediaLibrary);
  os_log_type_t v54 = v53;
  if (v52)
  {
    if (!v53)
    {

      goto LABEL_42;
    }
    uint64_t v163 = v36;
    sub_21BC0BE78(0, (unint64_t *)&unk_26AAEF940);
    id v55 = v52;
    char v56 = sub_21BEAA9F8();

    if ((v56 & 1) == 0)
    {

      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v163 = v36;
    if (v53)
    {

      goto LABEL_42;
    }
  }
  uint64_t v57 = MEMORY[0x263F8EE58];
  if (!v51)
  {
    if (objc_msgSend(v165, sel_type) == (id)2) {
      uint64_t v58 = 65280;
    }
    else {
      uint64_t v58 = 255;
    }
    long long v172 = 0u;
    long long v173 = 0u;
    goto LABEL_22;
  }
  uint64_t v58 = (uint64_t)objc_msgSend(v51, sel_mediaType);
  if (objc_msgSend(v51, sel_valueForProperty_, *MEMORY[0x263F113D8]))
  {
    sub_21BEAAAB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v171, 0, sizeof(v171));
  }
  sub_21BD3E750((uint64_t)v171, (uint64_t)&v172, (unint64_t *)&qword_26AAF3A00, v57 + 8);
  if (!*((void *)&v173 + 1))
  {
LABEL_22:
    sub_21BD3E84C((uint64_t)&v172, (uint64_t)&qword_26AAF3A00, v57 + 8, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
    goto LABEL_23;
  }
  sub_21BC0BE78(0, &qword_267C64A10);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    BOOL v61 = 0;
    goto LABEL_24;
  }
  id v59 = v171[0];
  id v60 = objc_msgSend(v171[0], sel_longLongValue);

  BOOL v61 = v60 == 0;
LABEL_24:
  id v160 = v51;
  uint64_t v161 = v7;
  uint64_t v156 = v9;
  uint64_t v155 = v20;
  uint64_t v151 = v45;
  v150[1] = v58;
  BOOL v157 = v61;
  *(void *)&long long v172 = 0;
  *((void *)&v172 + 1) = 0xE000000000000000;
  sub_21BEAAC48();
  swift_bridgeObjectRelease();
  *(void *)&long long v172 = 0xD000000000000013;
  *((void *)&v172 + 1) = 0x800000021BECD760;
  sub_21BEAA238();
  sub_21BEAA238();
  swift_bridgeObjectRetain();
  sub_21BEAA238();
  swift_bridgeObjectRelease();
  id v62 = OUTLINED_FUNCTION_45_10();
  uint64_t v64 = v63;
  swift_bridgeObjectRelease();
  *(void *)&long long v172 = 0;
  *((void *)&v172 + 1) = 0xE000000000000000;
  sub_21BEAAC48();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_44_8();
  *(void *)&long long v172 = v65;
  *((void *)&v172 + 1) = 0x800000021BECD760;
  sub_21BEAA238();
  swift_bridgeObjectRelease();
  sub_21BEAA238();
  swift_bridgeObjectRetain();
  sub_21BEAA238();
  swift_bridgeObjectRelease();
  id v66 = OUTLINED_FUNCTION_45_10();
  uint64_t v68 = v67;
  swift_bridgeObjectRelease();
  *(void *)&long long v172 = 0;
  *((void *)&v172 + 1) = 0xE000000000000000;
  sub_21BEAAC48();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_44_8();
  *(void *)&long long v172 = v69 + 14;
  *((void *)&v172 + 1) = 0x800000021BECD780;
  sub_21BEAA238();
  swift_bridgeObjectRelease();
  uint64_t v158 = v4;
  uint64_t v159 = v2;
  sub_21BD3DCF0();
  OUTLINED_FUNCTION_43_9();
  swift_bridgeObjectRelease();
  sub_21BC0BE78(0, &qword_267C65730);
  id v70 = sub_21BD3A850((uint64_t)v62, v64, (uint64_t)v66, v68);
  id v71 = v70;
  id v72 = v160;
  if (v160)
  {
    uint64_t v153 = v2;
    uint64_t v154 = v4;
    v150[0] = v70;
    uint64_t v73 = v169;
    uint64_t v74 = &v169[*(int *)(v168 + 20)];
    uint64_t v75 = OUTLINED_FUNCTION_31_14();
    uint64_t v76 = v161;
    __swift_storeEnumTagSinglePayload(v75, v77, v78, v161);
    uint64_t v79 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
    uint64_t v80 = *(int *)(v79 + 20);
    *(void *)&v74[v80] = 0;
    uint64_t v81 = (uint64_t *)*(int *)(v79 + 24);
    *(uint64_t *)((char *)v81 + (void)v74) = 0;
    *uint64_t v73 = 2;
    uint64_t v82 = v170;
    __swift_storeEnumTagSinglePayload(v170, 1, 1, v76);
    id v152 = v72;
    sub_21BD3EA5C((uint64_t)v74, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload);
    sub_21BD3E55C(v82, (uint64_t)v74);
    *(void *)&v74[v80] = 0;
    *(uint64_t *)((char *)v81 + (void)v74) = (uint64_t)v72;
    sub_21BD3E374(0, &qword_267C65758, (uint64_t (*)(uint64_t))sub_21BD3E5F0, MEMORY[0x263F8E0F8]);
    sub_21BD3E5F0();
    OUTLINED_FUNCTION_4_35();
    uint64_t v83 = (__n128 *)OUTLINED_FUNCTION_16_27();
    OUTLINED_FUNCTION_37_11(v83, (__n128)xmmword_21BEEB430);
    *uint64_t v81 = sub_21BEAA178();
    v81[1] = v84;
    sub_21BD3E658((uint64_t)v73, v80);
    sub_21BEAA0C8();
    uint64_t v85 = (void *)MEMORY[0x21D49EBF0](v166 + 16);
    id v86 = v85;
    if (v85)
    {
      id v87 = objc_msgSend(v85, sel_commandCenter);

      id v86 = objc_msgSend(v87, sel_performDialogActionCommand);
    }
    uint64_t v88 = v167;
    id v71 = (void *)v150[0];
    sub_21BC0C894();
    uint64_t v90 = v89;
    swift_bridgeObjectRelease();
    id v91 = objc_allocWithZone(MEMORY[0x263F121B8]);
    id v92 = sub_21BD3E110(v86, 145, v90);
    sub_21BC0BE78(0, &qword_267C65738);
    id v93 = v92;
    id v94 = sub_21BD3A8FC(v153, v154, 0, v92);
    OUTLINED_FUNCTION_14_24((uint64_t)v94);

    sub_21BD3EA5C((uint64_t)v169, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
    uint64_t v95 = v161;
    unint64_t v96 = v157;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v95 = v161;
    uint64_t v88 = v167;
    unint64_t v96 = v157;
  }
  uint64_t v97 = sub_21BC0BE78(0, &qword_267C65738);
  if (v96)
  {
    id v98 = sub_21BD3DCF0();
    id v100 = sub_21BD3A8FC((uint64_t)v98, v99, 1, 0);
    OUTLINED_FUNCTION_14_24((uint64_t)v100);
  }
  else
  {
    id v101 = sub_21BD3DCF0();
    id v103 = sub_21BD3A8FC((uint64_t)v101, v102, 1, 0);
    OUTLINED_FUNCTION_14_24((uint64_t)v103);

    uint64_t v104 = (uint64_t)v163;
    __swift_storeEnumTagSinglePayload((uint64_t)v163, 1, 1, v95);
    uint64_t v105 = (char *)objc_msgSend(v165, sel_storeItemID);
    v169 = v105;
    if (v105)
    {
      *(void *)&long long v172 = 0;
      *((void *)&v172 + 1) = 0xE000000000000000;
      uint64_t v106 = v105;
      uint64_t v107 = v104;
      sub_21BEAAC48();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_44_8();
      *(void *)&long long v172 = v108 + 7;
      *((void *)&v172 + 1) = 0x800000021BECD7E0;
      id v109 = objc_msgSend(v106, sel_description);
      sub_21BEAA178();

      sub_21BEAA238();
      uint64_t v95 = v161;
      swift_bridgeObjectRelease();
      uint64_t v110 = v170;
      sub_21BEA8C38();

      uint64_t v104 = v107;
      swift_bridgeObjectRelease();
      sub_21BD3E84C(v107, (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E374);
      sub_21BD3E55C(v110, v107);
    }
    uint64_t v111 = v164;
    sub_21BD3E6BC(v104, v164);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v111, 1, v95);
    sub_21BD3E84C(v111, (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E374);
    if (EnumTagSinglePayload == 1)
    {
      uint64_t v113 = v170;
      sub_21BD3A97C();
      sub_21BD3E84C(v104, (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E374);
      sub_21BD3E55C(v113, v104);
    }
    sub_21BD3E6BC(v104, v88);
    BOOL v114 = __swift_getEnumTagSinglePayload(v88, 1, v95) == 1;
    uint64_t v115 = v104;
    if (v114)
    {
      uint64_t v116 = MEMORY[0x263F06EA8];
      uint64_t v117 = MEMORY[0x263F8D8F0];
      sub_21BD3E84C(v115, (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E374);

      uint64_t v118 = v88;
      uint64_t v119 = v116;
      uint64_t v120 = v117;
    }
    else
    {
      uint64_t v167 = v97;
      uint64_t v163 = (char *)v104;
      uint64_t v121 = v156;
      uint64_t v122 = v156 + 32;
      uint64_t v123 = *(void *)(v156 + 32);
      uint64_t v124 = v155;
      ((void (*)(char *, uint64_t, uint64_t))v123)(v155, v88, v95);
      uint64_t v125 = v162;
      (*(void (**)(uint64_t, char *, uint64_t))(v121 + 16))(v162, v124, v95);
      uint64_t v126 = v151;
      uint64_t v127 = (uint64_t)&v151[*(int *)(v168 + 20)];
      uint64_t v128 = OUTLINED_FUNCTION_31_14();
      __swift_storeEnumTagSinglePayload(v128, v129, v130, v95);
      uint64_t v131 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
      uint64_t v132 = *(int *)(v131 + 20);
      *(void *)(v127 + v132) = 0;
      uint64_t v133 = *(int *)(v131 + 24);
      *(void *)(v127 + v133) = 0;
      *uint64_t v126 = 0;
      uint64_t v134 = v170;
      ((void (*)(uint64_t, uint64_t, uint64_t))v123)(v170, v125, v95);
      __swift_storeEnumTagSinglePayload(v134, 0, 1, v95);
      sub_21BD3EA5C(v127, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload);
      sub_21BD3E55C(v134, v127);
      *(void *)(v127 + v132) = 0;
      *(void *)(v127 + v133) = 0;
      sub_21BD3E374(0, &qword_267C65758, (uint64_t (*)(uint64_t))sub_21BD3E5F0, MEMORY[0x263F8E0F8]);
      sub_21BD3E5F0();
      OUTLINED_FUNCTION_4_35();
      __int16 v135 = (__n128 *)OUTLINED_FUNCTION_16_27();
      OUTLINED_FUNCTION_37_11(v135, (__n128)xmmword_21BEEB430);
      *(void *)uint64_t v123 = sub_21BEAA178();
      *(void *)(v123 + 8) = v136;
      sub_21BD3E658((uint64_t)v126, v122);
      sub_21BEAA0C8();
      v137 = (void *)MEMORY[0x21D49EBF0](v166 + 16);
      id v138 = v137;
      if (v137)
      {
        id v139 = objc_msgSend(v137, sel_commandCenter);

        id v138 = objc_msgSend(v139, sel_performDialogActionCommand);
      }
      sub_21BC0C894();
      uint64_t v141 = v140;
      swift_bridgeObjectRelease();
      id v142 = objc_allocWithZone(MEMORY[0x263F121B8]);
      id v143 = sub_21BD3E110(v138, 145, v141);
      OUTLINED_FUNCTION_44_8();
      OUTLINED_FUNCTION_4_4();
      id v144 = sub_21BD3DCF0();
      uint64_t v146 = v145;
      id v147 = v143;
      id v148 = sub_21BD3A8FC((uint64_t)v144, v146, 0, v143);
      objc_msgSend(v71, sel_addAction_, v148);

      sub_21BD3EA5C((uint64_t)v126, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
      OUTLINED_FUNCTION_21_1();
      v149();
      uint64_t v119 = MEMORY[0x263F06EA8];
      uint64_t v120 = MEMORY[0x263F8D8F0];
      uint64_t v118 = (uint64_t)v163;
    }
    sub_21BD3E84C(v118, (uint64_t)&qword_26AAF36F0, v119, v120, (void (*)(void))sub_21BD3E374);
  }
LABEL_42:
  OUTLINED_FUNCTION_33();
}

id sub_21BD3A850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    id v5 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  id v5 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();
LABEL_6:
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_dialogWithTitle_message_, v5, v6);

  return v7;
}

id sub_21BD3A8FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_actionWithTitle_type_commandEvent_, v6, a3, a4);

  return v7;
}

uint64_t sub_21BD3A97C()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  sub_21BD3E444(v0);
  if (v1)
  {
    sub_21BEAAC48();
    swift_bridgeObjectRelease();
    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEAA238();
    sub_21BEAA238();
    swift_bridgeObjectRelease();
    sub_21BEA8C38();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_21BEA8C58();
    uint64_t v3 = OUTLINED_FUNCTION_31_14();
    return __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
  }
}

id sub_21BD3ABCC(void *a1)
{
  id result = objc_msgSend(a1, sel_error);
  if (result)
  {
    sub_21BC1FB08(0, (unint64_t *)&qword_26AAF30C0);
    sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
    if (swift_dynamicCast())
    {
      if (sub_21BD0C3E8())
      {
        sub_21BD3ACE0();
        OUTLINED_FUNCTION_51_9();
        if (v1)
        {
          sub_21BC0BE78(0, &qword_267C65740);
          return sub_21BD39724((uint64_t)objc_msgSend(a1, sel_statusCode), v1, v4);
        }
      }
    }
    return 0;
  }
  return result;
}

void sub_21BD3ACE0()
{
  OUTLINED_FUNCTION_34();
  uint64_t v1 = v0;
  sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  uint64_t v3 = OUTLINED_FUNCTION_21_0(v2);
  MEMORY[0x270FA5388](v3, v4, v5);
  uint64_t v69 = (uint64_t)&v61 - v6;
  uint64_t v68 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions(0);
  OUTLINED_FUNCTION_24();
  MEMORY[0x270FA5388](v7, v8, v9);
  OUTLINED_FUNCTION_49();
  uint64_t v73 = (unsigned char *)(v11 - v10);
  sub_21BC0BE78(0, &qword_267C65748);
  uint64_t v12 = swift_bridgeObjectRetain();
  id v13 = sub_21BD3B368(v12, (SEL *)&selRef_initWithResponseDictionary_);
  sub_21BCBB040(v13, (SEL *)&selRef_message);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  if (!v15)
  {
    sub_21BCBB040(v13, (SEL *)&selRef_explanation);
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    if (!v17)
    {

      id v71 = 0;
      goto LABEL_21;
    }
  }
  sub_21BC0BE78(0, &qword_267C65730);
  uint64_t v18 = sub_21BCBB040(v13, (SEL *)&selRef_message);
  uint64_t v20 = v19;
  uint64_t v21 = sub_21BCBB040(v13, (SEL *)&selRef_explanation);
  id v71 = sub_21BD3A850(v18, v20, v21, v22);
  id v23 = objc_msgSend(v13, sel_buttons);
  sub_21BC0BE78(0, &qword_267C65750);
  unint64_t v24 = sub_21BEAA308();

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v74 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v74 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v74)
  {

LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    OUTLINED_FUNCTION_33();
    return;
  }
  if (v74 >= 1)
  {
    id v62 = v13;
    uint64_t v25 = 0;
    uint64_t v65 = v1 + 16;
    unint64_t v26 = v24 & 0xC000000000000001;
    uint64_t v64 = *MEMORY[0x263F54CB8];
    uint64_t v27 = &selRef_accumulationError;
    uint64_t v70 = MEMORY[0x263F8EE58] + 8;
    long long v63 = xmmword_21BEEB430;
    unint64_t v66 = v24;
    unint64_t v67 = v24 & 0xC000000000000001;
    do
    {
      if (v26) {
        id v28 = (id)MEMORY[0x21D49C490](v25, v24);
      }
      else {
        id v28 = *(id *)(v24 + 8 * v25 + 32);
      }
      uint64_t v29 = v28;
      uint64_t v30 = sub_21BCBB040(v28, (SEL *)&selRef_title);
      if (v31)
      {
        uint64_t v76 = v31;
        uint64_t v77 = v30;
        BOOL v75 = objc_msgSend(v29, sel_type) == (id)2;
        id v32 = objc_msgSend(v29, sel_action);
        id v33 = [v32 v27[5]];
        uint64_t v34 = sub_21BEAA0A8();

        id v35 = *(id *)(v34 + 16);
        swift_bridgeObjectRelease();
        if (v35)
        {
          id v36 = v27[5];
          id v72 = v32;
          id v37 = [v32 v36];
          uint64_t v38 = sub_21BEAA0A8();

          uint64_t v39 = v73;
          uint64_t v40 = (uint64_t)&v73[*(int *)(v68 + 20)];
          uint64_t v41 = sub_21BEA8C58();
          __swift_storeEnumTagSinglePayload(v40, 1, 1, v41);
          uint64_t v42 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
          uint64_t v43 = *(int *)(v42 + 20);
          *(void *)(v40 + v43) = 0;
          uint64_t v44 = *(int *)(v42 + 24);
          *(void *)(v40 + v44) = 0;
          *uint64_t v39 = 1;
          uint64_t v45 = v69;
          __swift_storeEnumTagSinglePayload(v69, 1, 1, v41);
          sub_21BD3EA5C(v40, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload);
          sub_21BD3E55C(v45, v40);
          *(void *)(v40 + v43) = v38;
          *(void *)(v40 + v44) = 0;
          sub_21BD3E374(0, &qword_267C65758, (uint64_t (*)(uint64_t))sub_21BD3E5F0, MEMORY[0x263F8E0F8]);
          sub_21BD3E5F0();
          uint64_t v47 = v46 - 8;
          unint64_t v48 = (*(unsigned __int8 *)(*(void *)(v46 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v46 - 8) + 80);
          uint64_t v49 = swift_allocObject();
          *(_OWORD *)(v49 + 16) = v63;
          id v50 = (uint64_t *)(v49 + v48);
          uint64_t v51 = (uint64_t)v50 + *(int *)(v47 + 56);
          uint64_t *v50 = sub_21BEAA178();
          v50[1] = v52;
          sub_21BD3E658((uint64_t)v39, v51);
          sub_21BEAA0C8();
          id v53 = (void *)MEMORY[0x21D49EBF0](v65);
          id v54 = v53;
          if (v53)
          {
            id v55 = objc_msgSend(v53, sel_commandCenter);

            id v54 = objc_msgSend(v55, sel_performDialogActionCommand);
          }
          unint64_t v26 = v67;
          sub_21BC0C894();
          uint64_t v57 = v56;
          swift_bridgeObjectRelease();
          id v58 = objc_allocWithZone(MEMORY[0x263F121B8]);
          id v35 = sub_21BD3E110(v54, 145, v57);
          sub_21BD3EA5C((uint64_t)v73, (void (*)(void))type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions);
          unint64_t v24 = v66;
          id v32 = v72;
        }
        sub_21BC0BE78(0, &qword_267C65738);
        id v59 = v35;
        id v60 = sub_21BD3A8FC(v77, v76, v75, v35);
        objc_msgSend(v71, sel_addAction_, v60);

        uint64_t v29 = v59;
        uint64_t v27 = &selRef_accumulationError;
      }
      ++v25;
    }
    while (v74 != v25);

    goto LABEL_20;
  }
  __break(1u);
}

id sub_21BD3B368(uint64_t a1, SEL *a2)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v4 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, *a2, v4);

  return v5;
}

void sub_21BD3B3F0()
{
  OUTLINED_FUNCTION_34();
  uint64_t v2 = v1;
  uint64_t v3 = sub_21BEA9068();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7, v8);
  OUTLINED_FUNCTION_49();
  sub_21BEA8C58();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v9, v10, v11);
  OUTLINED_FUNCTION_49();
  uint64_t v12 = (void *)MEMORY[0x21D49EBF0](v0 + 16);
  id v13 = v12;
  if (!v12) {
    goto LABEL_25;
  }
  id v14 = objc_msgSend(v12, sel_playbackEngine);

  if (!v14) {
    goto LABEL_25;
  }
  uint64_t v71 = v5;
  id v15 = objc_msgSend(v2, sel_error);
  if (!v15)
  {

    goto LABEL_25;
  }
  uint64_t v16 = v15;
  uint64_t v70 = v2;
  id v72 = v14;
  swift_getErrorValue();
  sub_21BEAA178();
  uint64_t v17 = (void *)OUTLINED_FUNCTION_36_12();
  if (v17)
  {

LABEL_6:
    swift_bridgeObjectRelease();
LABEL_25:
    OUTLINED_FUNCTION_33();
    return;
  }
  uint64_t v69 = v16;
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v14, sel_queueController);
  if (!v18
    || (uint64_t v19 = v18, v20 = objc_msgSend(v18, sel_currentItem), v19, !v20))
  {
    if (qword_26AAF3680 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_21BEA9B18();
    __swift_project_value_buffer(v39, (uint64_t)qword_26AAF65B0);
    uint64_t v40 = sub_21BEA9B08();
    os_log_type_t v41 = sub_21BEAA6C8();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_21BB87000, v40, v41, "[MPCDialogHandler] - ❗️No currentItem in QueueController", v42, 2u);
      MEMORY[0x21D49EAD0](v42, -1, -1);
    }
    else
    {
    }
    goto LABEL_25;
  }
  uint64_t v68 = v20;
  swift_getErrorValue();
  sub_21BEAA178();
  uint64_t v21 = (void *)sub_21BEAAF28();
  if (!v21)
  {

    goto LABEL_6;
  }

  swift_bridgeObjectRelease();
  swift_getErrorValue();
  uint64_t v22 = (void *)sub_21BEAAF38();
  if (!v22) {
    goto LABEL_24;
  }

  if ((objc_msgSend(v20, sel_usesSubscriptionLease) & 1) == 0) {
    goto LABEL_24;
  }
  swift_getErrorValue();
  sub_21BEAA178();
  id v23 = (void *)OUTLINED_FUNCTION_36_12();
  if (!v23)
  {
    swift_bridgeObjectRelease();
    id v43 = objc_msgSend(self, sel_sharedMonitor);
    id v44 = objc_msgSend(v43, sel_networkType);

    if (!v44)
    {
      if (objc_msgSend(v68, sel_isAssetLoaded))
      {
        id v51 = objc_msgSend(v68, sel_asset);
        if (v51)
        {
          self;
          uint64_t v52 = swift_dynamicCastObjCClass();
          if (!v52)
          {

            goto LABEL_25;
          }
          id v53 = (void *)v52;
          id v54 = v51;
          id v55 = objc_msgSend(v53, sel_URL);
          sub_21BEA8C18();

          LOBYTE(v55) = sub_21BEA8B98();
          OUTLINED_FUNCTION_21_1();
          v56();
          if ((v55 & 1) == 0)
          {

            goto LABEL_25;
          }
          uint64_t v57 = v54;
          uint64_t v29 = (void *)0xD000000000000021;
          sub_21BEA9058();
          sub_21BEA9038();
          id v27 = v68;
          id v58 = *(void (**)(uint64_t))(v71 + 8);
          uint64_t v59 = OUTLINED_FUNCTION_41_10();
          v58(v59);
          sub_21BEA9058();
          sub_21BEA9048();
          uint64_t v60 = OUTLINED_FUNCTION_41_10();
          v58(v60);
          sub_21BEAA238();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_21BEAA238();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_21BEAA238();
          swift_bridgeObjectRelease();
          objc_msgSend(v68, sel_type);
          swift_bridgeObjectRetain();
          sub_21BEAA238();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40_11();
          OUTLINED_FUNCTION_26_14();
          swift_bridgeObjectRelease();
          swift_getErrorValue();
          sub_21BEAA178();
          uint64_t v61 = (void *)OUTLINED_FUNCTION_36_12();
          if (v61)
          {

            swift_bridgeObjectRelease();
            id v24 = OUTLINED_FUNCTION_11_30();
            uint64_t v26 = v62;
          }
          else
          {
            swift_bridgeObjectRelease();
            objc_msgSend(v68, sel_type);
            id v24 = OUTLINED_FUNCTION_40_11();
            uint64_t v26 = v63;
            id v64 = objc_msgSend(self, sel_sharedController);
            unsigned int v65 = objc_msgSend(v64, sel_isCloudLibraryEnabled);

            if (!v65)
            {

              OUTLINED_FUNCTION_42_9();
              goto LABEL_30;
            }
            id v27 = OUTLINED_FUNCTION_11_30();
            uint64_t v67 = v66;

            swift_bridgeObjectRelease();
            uint64_t v3 = v67;
          }
          goto LABEL_29;
        }
      }
    }
LABEL_24:

    goto LABEL_25;
  }

  swift_bridgeObjectRelease();
  id v24 = sub_21BD3DCF0();
  uint64_t v26 = v25;
  id v27 = sub_21BD3DCF0();
  sub_21BCD3AA4(0, (unint64_t *)&qword_26AAF3098, (unint64_t *)&qword_26AAF30D0, MEMORY[0x263F8E9C8], MEMORY[0x263F8E0F8]);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_21BEEB430;
  uint64_t v29 = v20;
  uint64_t v30 = sub_21BD239C8(v20);
  if (!v31)
  {
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v32 = v30;
  uint64_t v3 = v31;
  *(void *)(v28 + 56) = MEMORY[0x263F8D310];
  *(void *)(v28 + 64) = sub_21BD02B80();
  *(void *)(v28 + 32) = v32;
  *(void *)(v28 + 40) = v3;
  sub_21BEAA148();
  OUTLINED_FUNCTION_26_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v20, sel_mediaItem);
  if (!v33)
  {
LABEL_29:
    OUTLINED_FUNCTION_42_9();
    goto LABEL_30;
  }
  id v34 = v33;
  id v35 = objc_msgSend(v34, sel_mediaLibrary);
  OUTLINED_FUNCTION_42_9();
  if (v36)
  {
    id v37 = v36;
    sub_21BD3E96C(0, (unint64_t *)&qword_26AAF3910, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_21BEEB430;
    *(void *)(v38 + 56) = sub_21BC0BE78(0, (unint64_t *)&unk_26AAEF930);
    *(void *)(v38 + 32) = v34;
    sub_21BD3E4B4(v38, v37);

LABEL_30:
    sub_21BC0BE78(0, &qword_267C65730);
    swift_bridgeObjectRetain();
    id v45 = sub_21BD3A850((uint64_t)v24, v26, (uint64_t)v27, v3);
    sub_21BC0BE78(0, &qword_267C65738);
    OUTLINED_FUNCTION_50_9();
    id v46 = sub_21BD3DCF0();
    id v48 = OUTLINED_FUNCTION_18_25((uint64_t)v46, v47);
    objc_msgSend(v45, sel_addAction_, v48);

    sub_21BC0BE78(0, &qword_267C65740);
    id v49 = objc_msgSend(v70, sel_statusCode);
    id v50 = v69;
    sub_21BD39724((uint64_t)v49, v45, v69);

    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_44:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
}

BOOL sub_21BD3BF88(void *a1)
{
  id v2 = objc_msgSend(a1, sel_domain);
  uint64_t v3 = sub_21BEAA178();
  uint64_t v5 = v4;

  if (v3 == sub_21BEAA178() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v8 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v8 & 1) == 0) {
      return result;
    }
  }
  return (uint64_t)objc_msgSend(a1, sel_code) <= -42584 && (uint64_t)objc_msgSend(a1, sel_code) > -42591;
}

id sub_21BD3C078(void *a1)
{
  id v2 = objc_msgSend(a1, sel_error);
  if (v2)
  {
    swift_getErrorValue();
    sub_21BEAA178();
    sub_21BEAAF28();
    OUTLINED_FUNCTION_49_7();
    if (!v27
      || (*(void *)&long long v24 = v27,
          uint64_t v3 = sub_21BC1FB08(0, (unint64_t *)&qword_26AAF30C0),
          uint64_t v4 = sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60),
          (OUTLINED_FUNCTION_32_14() & 1) == 0))
    {

      return 0;
    }
    id v5 = v26;
    id v6 = objc_msgSend(v26, sel_code);
    if (v6 == (id)141)
    {
      id v10 = OUTLINED_FUNCTION_6_34();
      uint64_t v12 = v11;
      uint64_t v4 = 0;
      uint64_t v3 = 0;
    }
    else
    {
      if (v6 != (id)125)
      {
        if (v6 == (id)120)
        {
          id v23 = v26;
          swift_getErrorValue();
          sub_21BEAA178();
          uint64_t v7 = sub_21BEAAF18();
          swift_bridgeObjectRelease();
          if (!v7)
          {

            return 0;
          }
          *(void *)&long long v24 = v7;
          if (OUTLINED_FUNCTION_32_14())
          {
            id v8 = v26;
            id v9 = objc_msgSend(v26, sel_userInfo);
            uint64_t v3 = MEMORY[0x263F8EE58] + 8;
            uint64_t v4 = sub_21BEAA0A8();

            OUTLINED_FUNCTION_4_4();
            sub_21BCDFBA8(v4, &v24);
            swift_bridgeObjectRelease();
            if (!v25)
            {

              sub_21BD3E84C((uint64_t)&v24, (uint64_t)&qword_26AAF3A00, v3, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
              return 0;
            }
            if (swift_dynamicCast())
            {
              switch((unint64_t)v26)
              {
                case 0uLL:
                case 1uLL:
                case 2uLL:
                case 3uLL:
                  OUTLINED_FUNCTION_6_34();
                  OUTLINED_FUNCTION_43_9();

                  id v10 = 0;
                  uint64_t v12 = 0;
                  goto LABEL_20;
                default:
                  break;
              }
            }

            goto LABEL_16;
          }
        }
LABEL_15:

LABEL_16:
        return 0;
      }
      id v13 = objc_msgSend(self, sel_sharedRestrictionsMonitor);
      unsigned __int8 v14 = objc_msgSend(v13, sel_allowsExplicitContent);

      if (v14) {
        goto LABEL_15;
      }
      id v10 = OUTLINED_FUNCTION_6_34();
      uint64_t v12 = v16;
      OUTLINED_FUNCTION_6_34();
      OUTLINED_FUNCTION_43_9();
    }
LABEL_20:
    sub_21BC0BE78(0, &qword_267C65730);
    swift_bridgeObjectRetain();
    id v17 = sub_21BD3A850((uint64_t)v10, v12, v4, v3);
    sub_21BC0BE78(0, &qword_267C65738);
    OUTLINED_FUNCTION_50_9();
    id v18 = sub_21BD3DCF0();
    id v20 = OUTLINED_FUNCTION_18_25((uint64_t)v18, v19);
    objc_msgSend(v17, sel_addAction_, v20);
    sub_21BC0BE78(0, &qword_267C65740);
    id v21 = objc_msgSend(a1, sel_statusCode);
    id v22 = v2;
    id v2 = sub_21BD39724((uint64_t)v21, v17, v2);

    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_21BD3C520(void *a1)
{
  id v1 = objc_msgSend(a1, sel_error);
  if (v1)
  {
    id v2 = v1;
    swift_getErrorValue();
    sub_21BEAA178();
    OUTLINED_FUNCTION_36_12();
    OUTLINED_FUNCTION_51_9();

    if (v4) {
  }
    }
  return 0;
}

id sub_21BD3C5B8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_error);
  if (v2)
  {
    swift_getErrorValue();
    sub_21BEAA178();
    sub_21BEAAF28();
    OUTLINED_FUNCTION_49_7();
    if (v20
      && (sub_21BC1FB08(0, (unint64_t *)&qword_26AAF30C0),
          sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60),
          (OUTLINED_FUNCTION_25_17() & 1) != 0))
    {
      id v17 = v18;
      sub_21BC0BE78(0, &qword_267C65730);
      OUTLINED_FUNCTION_17_25();
      OUTLINED_FUNCTION_26_14();
      id v3 = objc_msgSend(v18, sel_localizedDescription);
      sub_21BEAA178();

      id v4 = OUTLINED_FUNCTION_35_11();
      sub_21BC0BE78(0, &qword_267C65738);
      id v5 = OUTLINED_FUNCTION_38_12();
      id v7 = OUTLINED_FUNCTION_18_25((uint64_t)v5, v6);
      objc_msgSend(v4, sel_addAction_, v7);
    }
    else
    {
      swift_getErrorValue();
      sub_21BEAA178();
      sub_21BEAAF28();
      OUTLINED_FUNCTION_49_7();
      if (!v19
        || (sub_21BC1FB08(0, (unint64_t *)&qword_26AAF30C0),
            sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60),
            (OUTLINED_FUNCTION_25_17() & 1) == 0))
      {

        return 0;
      }
      id v17 = v18;
      sub_21BC0BE78(0, &qword_267C65730);
      OUTLINED_FUNCTION_17_25();
      OUTLINED_FUNCTION_26_14();
      id v8 = objc_msgSend(v18, sel_localizedDescription);
      sub_21BEAA178();

      id v4 = OUTLINED_FUNCTION_35_11();
      sub_21BC0BE78(0, &qword_267C65738);
      uint64_t v9 = sub_21BEAA178();
      id v11 = OUTLINED_FUNCTION_18_25(v9, v10);
      objc_msgSend(v4, sel_addAction_, v11);

      id v12 = OUTLINED_FUNCTION_38_12();
      id v7 = OUTLINED_FUNCTION_18_25((uint64_t)v12, v13);
      objc_msgSend(v4, sel_addAction_, v7);
    }

    sub_21BC0BE78(0, &qword_267C65740);
    id v14 = objc_msgSend(a1, sel_statusCode);
    id v15 = v2;
    id v2 = sub_21BD39724((uint64_t)v14, v4, v2);
  }
  return v2;
}

id sub_21BD3C924(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_2();
  sub_21BD3DF08(v4 + 24, (uint64_t)aBlock);
  if (!*((void *)&aBlock[1] + 1))
  {
    sub_21BD3DF98((uint64_t)aBlock);
    return 0;
  }
  sub_21BC32CE8(aBlock, (uint64_t)v52);
  uint64_t v9 = (void *)MEMORY[0x21D49EBF0](v4 + 16);
  if (!v9
    || (uint64_t v10 = v9, v11 = objc_msgSend(v9, sel_playbackEngine),
                  v10,
                  !v11))
  {
LABEL_21:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v52);
    return 0;
  }
  id v12 = objc_msgSend(a1, sel_error);
  if (!v12)
  {

    goto LABEL_21;
  }
  uint64_t v13 = v12;
  sub_21BD3E96C(0, &qword_267C65728, MEMORY[0x263F8E8F8], MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21BEEBD30;
  *(_OWORD *)(inited + 32) = xmmword_21BEF0C80;
  *(_DWORD *)(inited + 48) = 131;
  char v15 = sub_21BCD61D0((uint64_t)objc_msgSend(a2, sel_mediaRemoteCommandType), inited);
  swift_setDeallocating();
  if ((v15 & 1) == 0)
  {

    goto LABEL_21;
  }
  id v51 = v13;
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = 0;
  id v17 = (void *)OUTLINED_FUNCTION_13_26(v16, MEMORY[0x263F8EE78]);
  v17[13] = v18;
  v17[14] = a3;
  v17[15] = a4;
  uint64_t v19 = swift_allocObject();
  *(unsigned char *)(v19 + 16) = 0;
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = 1;
  swift_bridgeObjectRetain();
  id v50 = v11;
  id v48 = objc_msgSend(v11, sel_eventStream);
  id v21 = (void *)swift_allocObject();
  _OWORD v21[2] = v19;
  v21[3] = a2;
  v21[4] = v16;
  v21[5] = v20;
  *(void *)&aBlock[2] = sub_21BD3E104;
  *((void *)&aBlock[2] + 1) = v21;
  *(void *)&aBlock[0] = MEMORY[0x263EF8330];
  *((void *)&aBlock[0] + 1) = 1107296256;
  *(void *)&aBlock[1] = sub_21BD39354;
  *((void *)&aBlock[1] + 1) = &block_descriptor_27;
  id v22 = _Block_copy(aBlock);
  swift_retain();
  id v23 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v48, sel_performQuery_, v22);
  _Block_release(v22);

  OUTLINED_FUNCTION_2();
  if ((*(unsigned char *)(v20 + 16) & 1) == 0)
  {
    if (qword_26AAF3680 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_21BEA9B18();
    __swift_project_value_buffer(v41, (uint64_t)qword_26AAF65B0);
    uint64_t v42 = sub_21BEA9B08();
    os_log_type_t v43 = sub_21BEAA6C8();
    if (os_log_type_enabled(v42, v43))
    {
      id v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v44 = 0;
      _os_log_impl(&dword_21BB87000, v42, v43, "[MPCDialogHandler] - ❗️No current item in player, no QOS dialog will be shown", v44, 2u);
      MEMORY[0x21D49EAD0](v44, -1, -1);
      id v45 = v13;
    }
    else
    {
      id v45 = v42;
      uint64_t v42 = v13;
    }
    swift_release();
    swift_release();

    swift_release();
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_2();
  memcpy(aBlock, (const void *)(v16 + 16), sizeof(aBlock));
  sub_21BD3E1B4((uint64_t)aBlock);
  sub_21BD4110C();
  sub_21BD3E274((uint64_t)aBlock);
  __swift_project_boxed_opaque_existential_0Tm(v52, v52[3]);
  long long v24 = (void *)sub_21BEA8B08();
  uint64_t v25 = (void *)sub_21BEA8EB8();

  swift_bridgeObjectRelease();
  id v26 = sub_21BD3DCF0();
  uint64_t v47 = v27;
  id v49 = v26;
  uint64_t v28 = sub_21BEA8E58();
  uint64_t v30 = v29;
  uint64_t v31 = sub_21BEA8E38();
  uint64_t v33 = v32;
  if (!v30)
  {
    OUTLINED_FUNCTION_39_12();
    uint64_t v28 = (uint64_t)sub_21BD3DCF0();
    uint64_t v30 = v34;
  }
  if (!v33)
  {
    OUTLINED_FUNCTION_4_4();
    uint64_t v31 = (uint64_t)sub_21BD3DCF0();
    uint64_t v33 = v35;
  }
  sub_21BC0BE78(0, &qword_267C65730);
  id v36 = sub_21BD3A850(v28, v30, v31, v33);
  sub_21BC0BE78(0, &qword_267C65738);
  id v37 = OUTLINED_FUNCTION_18_25((uint64_t)v49, v47);
  objc_msgSend(v36, sel_addAction_, v37);
  sub_21BC0BE78(0, &qword_267C65740);
  id v38 = objc_msgSend(a1, sel_statusCode);
  uint64_t v39 = v51;
  id v40 = sub_21BD39724((uint64_t)v38, v36, v51);
  swift_release();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v52);
  return v40;
}

void sub_21BD3CF20(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v10 = objc_msgSend(a1, sel_findPreviousEventWithType_matchingPayload_, @"remote-control-begin", 0);
  if (v10)
  {
    id v11 = v10;
    uint64_t v70 = a5;
    id v12 = objc_msgSend(a1, sel_cursorUntilEvent_, v10);
    uint64_t v13 = swift_allocObject();
    uint64_t v73 = (unsigned char *)(a2 + 16);
    *(void *)(v13 + 16) = a2 + 16;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_21BD40188;
    *(void *)(v14 + 24) = v13;
    uint64_t v79 = sub_21BD3E34C;
    uint64_t v80 = v14;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v77 = sub_21BD35E64;
    uint64_t v78 = &block_descriptor_26_1;
    char v15 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_enumeratePreviousEventsWithType_usingBlock_, @"queue-add", v15);
    _Block_release(v15);
    LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v15)
    {
      __break(1u);
      return;
    }
    sub_21BD3E96C(0, &qword_267C65728, MEMORY[0x263F8E8F8], MEMORY[0x263F8E0F8]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21BEEB3B0;
    *(void *)(inited + 32) = 0x400000000;
    *(_DWORD *)(inited + 40) = 131;
    char v17 = sub_21BCD61D0((uint64_t)objc_msgSend(a3, sel_mediaRemoteCommandType), inited);
    swift_setDeallocating();
    if ((v17 & 1) != 0
      || (id v18 = objc_msgSend(v12, sel_findPreviousEventWithType_matchingPayload_, @"session-reuse", 0),
          v18,
          v18))
    {
      swift_beginAccess();
      *uint64_t v73 = 1;
    }
    uint64_t v71 = a4;
    id v72 = (unsigned char *)(a4 + 16);
    sub_21BD3E374(0, (unint64_t *)&unk_26AAF3070, (uint64_t (*)(uint64_t))type metadata accessor for MPCPlaybackEngineEventType, MEMORY[0x263F8E0F8]);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_21BEEB3A0;
    *(void *)(v19 + 32) = @"container-begin";
    *(void *)(v19 + 40) = @"container-end";
    type metadata accessor for MPCPlaybackEngineEventType(0);
    uint64_t v20 = @"container-begin";
    id v21 = @"container-end";
    id v22 = (void *)sub_21BEAA2F8();
    swift_bridgeObjectRelease();
    id v23 = objc_msgSend(a1, sel_findPreviousEventWithTypes_matchingPayload_, v22, 0);

    if (!v23)
    {
LABEL_23:
      id v41 = objc_msgSend(a1, sel_findPreviousEventWithType_matchingPayload_, @"session-begin", 0);
      if (!v41)
      {
        swift_release();

        swift_unknownObjectRelease();
        return;
      }
      uint64_t v42 = v41;
      id v43 = objc_msgSend(a1, sel_cursorUntilEvent_, v41);
      uint64_t v44 = swift_allocObject();
      *(_OWORD *)(v44 + 16) = xmmword_21BEEB3A0;
      *(void *)(v44 + 32) = @"item-begin";
      *(void *)(v44 + 40) = @"item-end";
      id v45 = @"item-begin";
      id v46 = @"item-end";
      uint64_t v47 = (void *)sub_21BEAA2F8();
      swift_bridgeObjectRelease();
      id v48 = objc_msgSend(v43, sel_findPreviousEventWithTypes_matchingPayload_, v47, 0);

      if (v48)
      {
        id v49 = objc_msgSend(v48, sel_type);
        uint64_t v50 = sub_21BEAA178();
        uint64_t v52 = v51;
        if (v50 == sub_21BEAA178() && v52 == v53)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v55 = sub_21BEAAE78();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v55 & 1) == 0)
          {
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();

            swift_beginAccess();
            *(unsigned char *)(v70 + 16) = 0;
LABEL_51:
            swift_release();
            return;
          }
        }
        id v56 = objc_msgSend(v48, sel_payload);
        type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
        sub_21BD3E9B8((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
        uint64_t v57 = MEMORY[0x263F8EE58] + 8;
        uint64_t v58 = sub_21BEAA0A8();

        uint64_t v59 = @"item-ids";
        sub_21BCDFC04(v58, &aBlock);

        swift_bridgeObjectRelease();
        if (v78)
        {
          sub_21BC0BE78(0, &qword_26AAF2E30);
          if (swift_dynamicCast())
          {
            id v60 = objc_msgSend(v75, sel_prioritizedStoreStringIdentifiersForPersonID_, 0);
            uint64_t v61 = sub_21BEAA308();

            swift_beginAccess();
            *(void *)(v71 + 24) = v61;
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          sub_21BD3E84C((uint64_t)&aBlock, (uint64_t)&qword_26AAF3A00, v57, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
        }
        swift_beginAccess();
        if (*v73 == 1)
        {
          swift_beginAccess();
          unsigned char *v72 = 0;
        }
        id v62 = objc_msgSend(v48, sel_payload);
        uint64_t v63 = MEMORY[0x263F8EE58] + 8;
        uint64_t v64 = sub_21BEAA0A8();

        unsigned int v65 = @"item-metadata";
        sub_21BCDFC04(v64, &aBlock);

        swift_bridgeObjectRelease();
        if (!v78)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();

          uint64_t v67 = MEMORY[0x263F8D8F0];
          uint64_t v68 = v63;
LABEL_50:
          sub_21BD3E84C((uint64_t)&aBlock, (uint64_t)&qword_26AAF3A00, v68, v67, (void (*)(void))sub_21BD3E96C);
          goto LABEL_51;
        }
        sub_21BC0BC50();
        if (swift_dynamicCast())
        {
          uint64_t v66 = @"item-has-video";
          sub_21BCDFC04(v74, &aBlock);

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          if (v78)
          {
            if ((swift_dynamicCast() & 1) != 0 && v74 == 1)
            {
              swift_beginAccess();
              *(unsigned char *)(v71 + 16) = 4;
              *(unsigned char *)(v71 + 48) = 0;
            }
            goto LABEL_51;
          }
          uint64_t v68 = MEMORY[0x263F8EE58] + 8;
          uint64_t v67 = MEMORY[0x263F8D8F0];
          goto LABEL_50;
        }
        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }

      return;
    }
    id v24 = objc_msgSend(v23, sel_type);
    uint64_t v25 = sub_21BEAA178();
    uint64_t v27 = v26;
    if (v25 == sub_21BEAA178() && v27 == v28)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v30 = sub_21BEAAE78();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0) {
        goto LABEL_22;
      }
    }
    id v31 = objc_msgSend(v23, sel_payload);
    type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
    sub_21BD3E9B8((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
    uint64_t v32 = MEMORY[0x263F8EE58] + 8;
    uint64_t v33 = sub_21BEAA0A8();

    uint64_t v34 = @"container-kind";
    sub_21BCDFC04(v33, &aBlock);

    swift_bridgeObjectRelease();
    if (v78)
    {
      sub_21BC0BE78(0, &qword_267C64E70);
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_22:

        goto LABEL_23;
      }
      id v35 = objc_msgSend(v23, sel_payload);
      uint64_t v32 = MEMORY[0x263F8EE58] + 8;
      uint64_t v36 = sub_21BEAA0A8();

      id v37 = @"container-ids";
      sub_21BCDFC04(v36, &aBlock);

      swift_bridgeObjectRelease();
      if (v78)
      {
        sub_21BC0BE78(0, &qword_26AAF2E30);
        if (swift_dynamicCast())
        {
          id v38 = v75;
          char v39 = sub_21BD40E24(v38);
          swift_beginAccess();
          *(unsigned char *)(v71 + 16) = v39;
          id v40 = objc_msgSend(v75, sel_prioritizedStoreStringIdentifiersForPersonID_, 0);
          uint64_t v69 = sub_21BEAA308();

          swift_beginAccess();
          *(void *)(v71 + 32) = v69;
          swift_bridgeObjectRelease();
          goto LABEL_23;
        }

        goto LABEL_22;
      }
    }
    sub_21BD3E84C((uint64_t)&aBlock, (uint64_t)&qword_26AAF3A00, v32, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
    goto LABEL_23;
  }
}

uint64_t sub_21BD3DB74(void *a1, uint64_t a2, unsigned char *a3)
{
  id v4 = objc_msgSend(a1, sel_payload);
  type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
  sub_21BD3E9B8((unint64_t *)&unk_26AAF2EE0, type metadata accessor for MPCPlaybackEngineEventPayloadKey);
  uint64_t v5 = MEMORY[0x263F8EE58] + 8;
  uint64_t v6 = sub_21BEAA0A8();

  id v7 = @"queue-start-item-ids";
  sub_21BCDFC04(v6, &v10);

  swift_bridgeObjectRelease();
  if (!v11) {
    return sub_21BD3E84C((uint64_t)&v10, (uint64_t)&qword_26AAF3A00, v5, MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD3E96C);
  }
  sub_21BC0BE78(0, &qword_26AAF2E30);
  uint64_t result = swift_dynamicCast();
  if (result)
  {

    uint64_t result = swift_beginAccess();
    *a3 = 1;
  }
  return result;
}

id sub_21BD3DCF0()
{
  id result = objc_msgSend(self, sel_mediaPlaybackCoreBundle);
  if (result)
  {
    id v1 = result;
    id v2 = (void *)sub_21BEAA138();
    OUTLINED_FUNCTION_4_4();
    id v3 = (void *)sub_21BEAA138();
    id v4 = (void *)sub_21BEAA138();
    id v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_localization_, v2, 0, v3, v4);

    uint64_t v6 = sub_21BEAA178();
    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21BD3DDEC()
{
  swift_unknownObjectWeakDestroy();
  sub_21BD3DF98(v0 + 24);

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for MPCMusicDialogHandler()
{
  return self;
}

id sub_21BD3DE50(void *a1, void *a2)
{
  return sub_21BD36220(a1, a2);
}

uint64_t sub_21BD3DE74()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *id v1 = v0;
  v1[1] = sub_21BC382A8;
  return sub_21BD363FC();
}

uint64_t sub_21BD3DF08(uint64_t a1, uint64_t a2)
{
  sub_21BCD3AA4(0, &qword_26AAF31C8, &qword_26AAF3198, MEMORY[0x263F62768], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD3DF98(uint64_t a1)
{
  sub_21BCD3AA4(0, &qword_26AAF31C8, &qword_26AAF3198, MEMORY[0x263F62768], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21BD3E020()
{
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

  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_21BD3E0A8()
{
  return OUTLINED_FUNCTION_0_2(v0, 17);
}

uint64_t sub_21BD3E0B4()
{
  swift_release();

  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_21BD3E104(void *a1)
{
  sub_21BD3CF20(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

id sub_21BD3E110(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    id v7 = (void *)sub_21BEAA088();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  id v8 = objc_msgSend(v4, sel_initWithCommand_mediaRemoteType_options_, a1, a2, v7);

  return v8;
}

uint64_t sub_21BD3E1B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_21BD3E274(uint64_t a1)
{
  return a1;
}

uint64_t sub_21BD3E334()
{
  return OUTLINED_FUNCTION_0_2(v0, 24);
}

uint64_t sub_21BD3E340()
{
  return OUTLINED_FUNCTION_0_2(v0, 32);
}

uint64_t sub_21BD3E34C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_21BD3E374(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_21BD3E3D8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_mediaRemoteOptions);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_21BEAA0A8();

  return v3;
}

uint64_t sub_21BD3E444(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_21BEAA178();

  return v3;
}

id sub_21BD3E4B4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)sub_21BEAA2F8();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(a2, sel_removeItems_, v3);

  return v4;
}

uint64_t type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions(uint64_t a1)
{
  return sub_21BD088C0(a1, (uint64_t *)&unk_267C657A0);
}

uint64_t type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(uint64_t a1)
{
  return sub_21BD088C0(a1, (uint64_t *)&unk_267C65790);
}

uint64_t sub_21BD3E55C(uint64_t a1, uint64_t a2)
{
  sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21BD3E5F0()
{
  if (!qword_267C65760)
  {
    type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267C65760);
    }
  }
}

uint64_t sub_21BD3E658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD3E6BC(uint64_t a1, uint64_t a2)
{
  sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD3E750(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4)
{
  sub_21BD3E96C(0, a3, a4, MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_24();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a2, a1);
  return a2;
}

void sub_21BD3E7C8()
{
  if (!qword_267C65770)
  {
    sub_21BD3EA00(255, (unint64_t *)&qword_267C640D8, MEMORY[0x263F8DB68], MEMORY[0x263F8DB70], MEMORY[0x263F8D060]);
    unint64_t v0 = sub_21BEAAA68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C65770);
    }
  }
}

uint64_t sub_21BD3E84C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5(0);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21_1();
  v6();
  return a1;
}

uint64_t sub_21BD3E8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21BD3E904()
{
  if (!qword_26AAEEB90)
  {
    sub_21BC0BE78(255, (unint64_t *)&unk_26AAEF930);
    unint64_t v0 = sub_21BEAAA68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AAEEB90);
    }
  }
}

void sub_21BD3E96C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_21BD3E9B8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_21BD3EA00(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, MEMORY[0x263F8EE58] + 8);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_21BD3EA5C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21_1();
  v3();
  return a1;
}

void sub_21BD3EAB0()
{
  if (!qword_267C65788)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267C65788);
    }
  }
}

uint64_t sub_21BD3EB14()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21BD3EB5C(void *a1)
{
  sub_21BD38698(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

void sub_21BD3EB68()
{
  if (!qword_26AAF3638)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26AAF3638);
    }
  }
}

uint64_t sub_21BD3EBC0()
{
  return OUTLINED_FUNCTION_0_2(v0, 24);
}

uint64_t sub_21BD3EBCC(void *a1, uint64_t a2)
{
  return sub_21BD3DB74(a1, a2, *(unsigned char **)(v2 + 16));
}

uint64_t sub_21BD3EBE8()
{
  return OUTLINED_FUNCTION_0_2(v0, 32);
}

uint64_t sub_21BD3EBF4(uint64_t a1, uint64_t a2)
{
  sub_21BCD3AA4(0, &qword_26AAF31C8, &qword_26AAF3198, MEMORY[0x263F62768], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *sub_21BD3EC84(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_21BEA8C58();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v11 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + v10) = (uint64_t)v11;
    swift_bridgeObjectRetain();
    id v12 = v11;
  }
  return a1;
}

void sub_21BD3EDE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21BEA8C58();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  swift_bridgeObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

char *sub_21BD3EE88(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_21BEA8C58();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  uint64_t v9 = *(void **)&a2[v8];
  *(void *)&a1[v8] = v9;
  swift_bridgeObjectRetain();
  id v10 = v9;
  return a1;
}

char *sub_21BD3EF9C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_21BEA8C58();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 24);
  id v12 = *(void **)&a1[v11];
  uint64_t v13 = *(void **)&a2[v11];
  *(void *)&a1[v11] = v13;
  id v14 = v13;

  return a1;
}

char *sub_21BD3F150(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_21BEA8C58();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  return a1;
}

char *sub_21BD3F25C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_21BEA8C58();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 24);
  id v12 = *(void **)&a1[v11];
  *(void *)&a1[v11] = *(void *)&a2[v11];

  return a1;
}

uint64_t sub_21BD3F404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21BD3F418);
}

uint64_t sub_21BD3F418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_7_31();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_21BD3F4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21BD3F4F4);
}

void sub_21BD3F4F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_7_31();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
}

void sub_21BD3F5AC()
{
  sub_21BD3E374(319, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_21BD3F674(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_21BEA8C58();
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
    {
      sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
      __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
    }
    uint64_t v11 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
    *(void *)&v6[*(int *)(v11 + 20)] = *(void *)&v7[*(int *)(v11 + 20)];
    uint64_t v12 = *(int *)(v11 + 24);
    uint64_t v13 = *(void **)&v7[v12];
    *(void *)&v6[v12] = v13;
    swift_bridgeObjectRetain();
    id v14 = v13;
  }
  return v3;
}

void sub_21BD3F7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_21BEA8C58();
  if (!__swift_getEnumTagSinglePayload(v2, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  }
  uint64_t v4 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(v2 + *(int *)(v4 + 24));
}

unsigned char *sub_21BD3F898(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_21BEA8C58();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  uint64_t v9 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
  *(void *)&v5[*(int *)(v9 + 20)] = *(void *)&v6[*(int *)(v9 + 20)];
  uint64_t v10 = *(int *)(v9 + 24);
  uint64_t v11 = *(void **)&v6[v10];
  *(void *)&v5[v10] = v11;
  swift_bridgeObjectRetain();
  id v12 = v11;
  return a1;
}

unsigned char *sub_21BD3F9C8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_21BEA8C58();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7);
  int v9 = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if (!EnumTagSinglePayload)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v5, v6, v7);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
LABEL_7:
  uint64_t v12 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
  *(void *)&v5[*(int *)(v12 + 20)] = *(void *)&v6[*(int *)(v12 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(v12 + 24);
  id v14 = *(void **)&v5[v13];
  char v15 = *(void **)&v6[v13];
  *(void *)&v5[v13] = v15;
  id v16 = v15;

  return a1;
}

unsigned char *sub_21BD3FB94(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_21BEA8C58();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  uint64_t v9 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
  *(void *)&v5[*(int *)(v9 + 20)] = *(void *)&v6[*(int *)(v9 + 20)];
  *(void *)&v5[*(int *)(v9 + 24)] = *(void *)&v6[*(int *)(v9 + 24)];
  return a1;
}

unsigned char *sub_21BD3FCB8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_21BEA8C58();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7);
  int v9 = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if (!EnumTagSinglePayload)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v5, v6, v7);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    sub_21BD3E374(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
LABEL_7:
  uint64_t v12 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
  *(void *)&v5[*(int *)(v12 + 20)] = *(void *)&v6[*(int *)(v12 + 20)];
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(v12 + 24);
  id v14 = *(void **)&v5[v13];
  *(void *)&v5[v13] = *(void *)&v6[v13];

  return a1;
}

uint64_t sub_21BD3FE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21BD3FE8C);
}

uint64_t sub_21BD3FE8C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 252)
  {
    unsigned int v4 = *a1;
    if (v4 >= 4) {
      return v4 - 3;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
    uint64_t v9 = (uint64_t)&a1[*(int *)(a3 + 20)];
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_21BD3FF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21BD3FF20);
}

unsigned char *sub_21BD3FF20(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 252)
  {
    *uint64_t result = a2 + 3;
  }
  else
  {
    uint64_t v7 = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(0);
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 20)];
    return (unsigned char *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_21BD3FF9C()
{
  uint64_t result = type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.ActionPayload(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MPCMusicDialogHandler.MPCDialogActionOptions.DialogAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x21BD40100);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MPCMusicDialogHandler.MPCDialogActionOptions.DialogAction()
{
  return &type metadata for MPCMusicDialogHandler.MPCDialogActionOptions.DialogAction;
}

unint64_t sub_21BD4013C()
{
  unint64_t result = qword_267C657B0;
  if (!qword_267C657B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C657B0);
  }
  return result;
}

uint64_t sub_21BD401A8(uint64_t a1)
{
  return sub_21BD40230(a1, (void (*)(uint64_t))sub_21BC33488);
}

uint64_t sub_21BD401C4(char a1)
{
  return sub_21BD40578(0, a1);
}

uint64_t sub_21BD401D0()
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD40218(uint64_t a1)
{
  return sub_21BD40230(a1, (void (*)(uint64_t))sub_21BD41888);
}

uint64_t sub_21BD40230(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD40288()
{
  return sub_21BD404A0();
}

uint64_t sub_21BD40294()
{
  return OUTLINED_FUNCTION_0_47();
}

uint64_t sub_21BD402B4(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_1_40();
  }
  else {
    OUTLINED_FUNCTION_2_38();
  }
  sub_21BEAA228();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD4030C(uint64_t a1, char a2)
{
  sub_21BC33488(a2);
  sub_21BEAA228();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD40360()
{
  sub_21BEAA228();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD403B0()
{
  sub_21BEAA228();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD40488(uint64_t a1, uint64_t a2)
{
  return sub_21BD40524(a1, a2, (void (*)(uint64_t))sub_21BD41888);
}

uint64_t sub_21BD404A0()
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD4050C(uint64_t a1, uint64_t a2)
{
  return sub_21BD40524(a1, a2, (void (*)(uint64_t))sub_21BC33488);
}

uint64_t sub_21BD40524(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD40578(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_1_40();
  }
  else {
    OUTLINED_FUNCTION_2_38();
  }
  sub_21BEAA228();
  swift_bridgeObjectRelease();
  return sub_21BEAAFE8();
}

uint64_t sub_21BD405E4()
{
  return sub_21BEAAFE8();
}

uint64_t sub_21BD40628()
{
  return sub_21BEAAFE8();
}

BOOL sub_21BD4066C(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  if (v2 == 2) {
    return 1;
  }
  if (!*(unsigned char *)(a2 + 64))
  {
    double v7 = *(double *)(a1 + 16);
    double v8 = *(double *)(a2 + 16);
    if (*(unsigned char *)(a1 + 64))
    {
      if (v7 == v8) {
        return 1;
      }
    }
    else if (v7 == v8 {
           || (~*(void *)&v7 & 0x7FF0000000000000) == 0
    }
           && (*(void *)(a1 + 16) & 0xFFFFFFFFFFFFFLL) != 0
           && (~*(void *)&v8 & 0x7FF0000000000000) == 0
           && (*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFLL) != 0)
    {
      return 1;
    }
    return 0;
  }
  if (*(unsigned char *)(a2 + 64) != 1) {
    return 1;
  }
  double v3 = *(double *)(a1 + 16);
  double v4 = *(double *)(a2 + 16);
  BOOL result = v3 == v4 || v2 == 0;
  if (!v2 && v3 != v4) {
    return 0;
  }
  return result;
}

uint64_t sub_21BD40744(uint64_t a1, uint64_t a2, uint64_t a3, char a4, double a5, double a6)
{
  uint64_t v7 = v6;
  *(double *)(v6 + 16) = a5;
  *(double *)(v6 + 24) = a6;
  sub_21BEA8CB8();
  *(void *)(v6 + 32) = v12;
  type metadata accessor for CMClock(0);
  uint64_t v13 = (void *)sub_21BEAA5F8();
  uint64_t v14 = sub_21BEAA608();
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  if (a4)
  {
    char v19 = 0;
  }
  else if (sub_21BEAA908())
  {
    uint64_t v14 = a1;
    uint64_t v16 = a2;
    uint64_t v18 = a3;
    char v19 = 1;
  }
  else
  {
    char v19 = 0;
  }
  *(void *)(v7 + 40) = v14;
  *(void *)(v7 + 48) = v16;
  *(void *)(v7 + 56) = v18;
  *(unsigned char *)(v7 + 64) = v19;
  return v7;
}

uint64_t sub_21BD40824(void *a1)
{
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v2 = sub_21BEAA938();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  type metadata accessor for CMClock(0);
  uint64_t v8 = v7;
  uint64_t v9 = (void *)sub_21BEAA5F8();
  uint64_t v18 = v9;
  MEMORY[0x21D49BE60](v2, v4, v6, &v18, v8, MEMORY[0x263F8EFC0]);

  OUTLINED_FUNCTION_5_30();
  if (sub_21BEAA928())
  {
    OUTLINED_FUNCTION_5_30();
    char v10 = (sub_21BEAA958() & 1) == 0;
  }
  else
  {
LABEL_4:
    char v10 = 1;
  }
  type metadata accessor for EventTime();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = OUTLINED_FUNCTION_5_30();
  sub_21BD40744(v12, v13, v14, v10, v15, v16);

  return v11;
}

unint64_t sub_21BD4094C(unint64_t result)
{
  if (result >= 3) {
    return 3;
  }
  return result;
}

uint64_t sub_21BD4095C(uint64_t result)
{
  return result;
}

uint64_t sub_21BD40964()
{
  return sub_21BD40628();
}

unint64_t sub_21BD4096C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_21BD4094C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_21BD40998@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21BD4095C(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_21BD409C4()
{
  return MEMORY[0x270FA0228](v0, 65, 7);
}

uint64_t type metadata accessor for EventTime()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for EventTime.TimeType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21BD40AC4);
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

ValueMetadata *type metadata accessor for EventTime.TimeType()
{
  return &type metadata for EventTime.TimeType;
}

unint64_t sub_21BD40B00()
{
  unint64_t result = qword_267C657B8;
  if (!qword_267C657B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C657B8);
  }
  return result;
}

BOOL sub_21BD40B4C(uint64_t *a1, uint64_t *a2)
{
  return sub_21BD4066C(*a1, *a2);
}

uint64_t sub_21BD40B70()
{
  if (*(unsigned char *)(v0 + 64))
  {
    if (*(unsigned char *)(v0 + 64) != 1) {
      return 0x6173726576696E75;
    }
    uint64_t v3 = 0;
    sub_21BEAAC48();
    OUTLINED_FUNCTION_3_37();
    sub_21BEAA518();
    goto LABEL_9;
  }
  uint64_t v1 = *(void *)(v0 + 16);
  if ((~v1 & 0x7FF0000000000000) != 0 || (v1 & 0xFFFFFFFFFFFFFLL) == 0)
  {
    OUTLINED_FUNCTION_6_35();
    OUTLINED_FUNCTION_3_37();
    sub_21BEAA518();
LABEL_9:
    sub_21BEAA238();
    sub_21BEAA948();
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_6_35();
  sub_21BEAA238();
  sub_21BEAA948();
LABEL_10:
  sub_21BEAA518();
  sub_21BEAA238();
  return v3;
}

uint64_t sub_21BD40D18()
{
  return sub_21BD40B70();
}

uint64_t *sub_21BD40D3C()
{
  if (qword_26AAF0840 != -1) {
    swift_once();
  }
  return &qword_26AAF6500;
}

uint64_t sub_21BD40D88()
{
  type metadata accessor for AssetActor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_26AAF6500 = v0;
  return result;
}

uint64_t type metadata accessor for AssetActor()
{
  return self;
}

uint64_t sub_21BD40DEC()
{
  sub_21BD40D3C();

  return swift_retain();
}

uint64_t sub_21BD40E1C()
{
  return MEMORY[0x270FA2150](v0);
}

uint64_t sub_21BD40E24(void *a1)
{
  id v3 = objc_msgSend(a1, sel_identityKind);
  sub_21BC0BE78(0, &qword_267C63520);
  swift_getObjCClassFromMetadata();
  id v4 = v3;
  id v5 = OUTLINED_FUNCTION_5_31();
  sub_21BC0BE78(0, &qword_267C64E70);
  char v6 = sub_21BEAA9F8();

  if (v6)
  {

    return 0;
  }
  else
  {
    sub_21BC0BE78(0, &qword_267C646C0);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v9 = v1;
    id v10 = OUTLINED_FUNCTION_5_31();
    char v11 = OUTLINED_FUNCTION_8_29();

    if (v11)
    {

      return 2;
    }
    else
    {
      sub_21BC0BE78(0, (unint64_t *)&unk_267C646B0);
      uint64_t v12 = (void *)swift_getObjCClassFromMetadata();
      id v13 = v1;
      id v14 = OUTLINED_FUNCTION_5_31();
      char v15 = OUTLINED_FUNCTION_8_29();

      if (v15)
      {

        return 1;
      }
      else
      {
        sub_21BC0BE78(0, &qword_267C646A8);
        double v16 = (void *)swift_getObjCClassFromMetadata();
        id v17 = v1;
        id v18 = OUTLINED_FUNCTION_5_31();
        char v19 = OUTLINED_FUNCTION_8_29();

        if (v19)
        {

          return 3;
        }
        else
        {
          sub_21BC0BE78(0, &qword_267C657D0);
          uint64_t v20 = (void *)swift_getObjCClassFromMetadata();
          id v21 = v1;
          id v22 = OUTLINED_FUNCTION_5_31();
          char v23 = OUTLINED_FUNCTION_8_29();

          if (v23) {
            goto LABEL_12;
          }
          sub_21BC0BE78(0, &qword_267C657D8);
          id v24 = (void *)swift_getObjCClassFromMetadata();
          id v25 = v1;
          id v26 = OUTLINED_FUNCTION_5_31();
          char v27 = OUTLINED_FUNCTION_8_29();

          if ((v27 & 1) != 0
            || (sub_21BC0BE78(0, &qword_267C657E0),
                uint64_t v28 = (void *)swift_getObjCClassFromMetadata(),
                id v29 = v1,
                id v30 = OUTLINED_FUNCTION_5_31(),
                char v31 = OUTLINED_FUNCTION_8_29(),
                v1,
                v28,
                (v31 & 1) != 0))
          {
LABEL_12:

            return 4;
          }
          else
          {
            sub_21BC0BE78(0, &qword_267C657E8);
            id v32 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
            char v33 = OUTLINED_FUNCTION_8_29();

            if (v33) {
              return 4;
            }
            else {
              return 0;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21BD4110C()
{
  uint64_t v0 = sub_21BEA8ED8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2, v3);
  uint64_t v83 = (char *)v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD419A4();
  sub_21BD419FC();
  uint64_t v6 = v5 - 8;
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v90 = *(void (**)(void))(v7 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21BEEB3B0;
  unint64_t v10 = v9 + v8;
  uint64_t v11 = *(int *)(v6 + 56);
  v81[1] = v9;
  uint64_t v82 = v11;
  uint64_t v12 = *MEMORY[0x263F627C0];
  uint64_t v13 = sub_21BEA8EC8();
  uint64_t v14 = *(void *)(v13 - 8);
  char v15 = *(void (**)(uint64_t, void, uint64_t))(v14 + 104);
  uint64_t v86 = v14 + 104;
  id v87 = v15;
  uint64_t v91 = v13;
  v15(v10, v12, v13);
  int v16 = *MEMORY[0x263F627D0];
  uint64_t v89 = v1;
  char v19 = *(void (**)(void))(v1 + 104);
  uint64_t v18 = v1 + 104;
  id v17 = v19;
  OUTLINED_FUNCTION_6_36();
  v19();
  sub_21BD41A88(0, &qword_26AAF3060, MEMORY[0x263F8E0F8]);
  uint64_t v88 = v20;
  uint64_t v21 = swift_allocObject();
  long long v84 = xmmword_21BEEB430;
  *(_OWORD *)(v21 + 16) = xmmword_21BEEB430;
  uint64_t v22 = v85;
  *(void *)(v21 + 32) = sub_21BD41888(*(unsigned char *)v85);
  *(void *)(v21 + 40) = v23;
  unint64_t v24 = v10;
  v81[0] = v10;
  *(void *)(v10 + v82) = v21;
  id v25 = v90;
  id v26 = (char *)v90 + v24;
  char v27 = v87;
  v87((uint64_t)v90 + v24, *MEMORY[0x263F62770], v13);
  OUTLINED_FUNCTION_6_36();
  v19();
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v84;
  uint64_t v29 = 0x6F65646956;
  if (*(unsigned char *)(v22 + 32)) {
    uint64_t v29 = 0x6F69647541;
  }
  *(void *)&v26[*(int *)(v6 + 56)] = v28;
  uint64_t v30 = v0;
  int v31 = v16;
  *(void *)(v28 + 32) = v29;
  *(void *)(v28 + 40) = 0xE500000000000000;
  uint64_t v32 = v81[0] + 2 * (void)v25;
  uint64_t v33 = *(int *)(v6 + 56);
  v27(v32, *MEMORY[0x263F627B0], v91);
  LODWORD(v81[0]) = v31;
  uint64_t v82 = v18;
  uint64_t v90 = v17;
  OUTLINED_FUNCTION_6_36();
  v17();
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = v84;
  id v35 = (void *)v85;
  uint64_t v36 = *(void *)(v85 + 104);
  *(void *)(v34 + 32) = *(void *)(v85 + 96);
  *(void *)(v34 + 40) = v36;
  *(void *)(v32 + v33) = v34;
  sub_21BD41A88(0, (unint64_t *)&qword_26AAF2D70, MEMORY[0x263F8D488]);
  sub_21BC41D40();
  swift_bridgeObjectRetain();
  uint64_t v88 = v30;
  uint64_t v37 = sub_21BEAA0C8();
  uint64_t v92 = v35[1];
  uint64_t v93 = v92;
  sub_21BD41AD8((uint64_t)&v93);
  swift_bridgeObjectRetain();
  sub_21BD33A78();
  if (*(void *)(v92 + 16))
  {
    id v38 = v83;
    char v39 = (void (*)(uint64_t))v87;
    v87((uint64_t)v83, *MEMORY[0x263F627B8], v91);
    uint64_t v40 = v88;
    OUTLINED_FUNCTION_3_38();
    v41();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v38, v40);
    uint64_t v42 = v39;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v42 = (void (*)(uint64_t))v87;
    id v38 = v83;
  }
  id v43 = v42;
  if (*(void *)(v35[3] + 16))
  {
    OUTLINED_FUNCTION_6_36();
    v44();
    uint64_t v45 = OUTLINED_FUNCTION_0_48();
    v46(v45);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    uint64_t v47 = OUTLINED_FUNCTION_2_39();
    v48(v47);
  }
  if (*(void *)(v35[5] + 16))
  {
    uint64_t v49 = OUTLINED_FUNCTION_4_37();
    v43(v49);
    uint64_t v50 = OUTLINED_FUNCTION_0_48();
    v51(v50);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    uint64_t v52 = OUTLINED_FUNCTION_2_39();
    v53(v52);
  }
  if (*(void *)(v35[6] + 16))
  {
    uint64_t v54 = OUTLINED_FUNCTION_4_37();
    v43(v54);
    uint64_t v55 = OUTLINED_FUNCTION_0_48();
    v56(v55);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    uint64_t v57 = OUTLINED_FUNCTION_2_39();
    v58(v57);
  }
  if (*(void *)(v35[7] + 16))
  {
    uint64_t v59 = OUTLINED_FUNCTION_4_37();
    v43(v59);
    uint64_t v60 = OUTLINED_FUNCTION_0_48();
    v61(v60);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    uint64_t v62 = OUTLINED_FUNCTION_2_39();
    v63(v62);
  }
  if (*(void *)(v35[8] + 16))
  {
    uint64_t v64 = OUTLINED_FUNCTION_4_37();
    v43(v64);
    uint64_t v65 = OUTLINED_FUNCTION_0_48();
    v66(v65);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    uint64_t v67 = OUTLINED_FUNCTION_2_39();
    v68(v67);
  }
  if (*(void *)(v35[9] + 16))
  {
    uint64_t v69 = OUTLINED_FUNCTION_4_37();
    v43(v69);
    uint64_t v70 = OUTLINED_FUNCTION_0_48();
    v71(v70);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    uint64_t v72 = OUTLINED_FUNCTION_2_39();
    v73(v72);
  }
  if (*(void *)(v35[10] + 16))
  {
    uint64_t v74 = OUTLINED_FUNCTION_4_37();
    v43(v74);
    uint64_t v75 = v88;
    OUTLINED_FUNCTION_3_38();
    v76();
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_1_41();
    OUTLINED_FUNCTION_7_32();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v38, v75);
  }
  if (*(void *)(v35[11] + 16))
  {
    OUTLINED_FUNCTION_6_36();
    v77();
    uint64_t v78 = v88;
    OUTLINED_FUNCTION_3_38();
    v79();
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v92 = v37;
    sub_21BC401A0();
    OUTLINED_FUNCTION_7_32();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v38, v78);
  }
  return v37;
}

uint64_t sub_21BD4183C()
{
  unint64_t v0 = sub_21BEAADF8();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_21BD41888(char a1)
{
  uint64_t result = 1735290707;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6D75626C41;
      break;
    case 2:
      uint64_t result = 0x6E6F6974617453;
      break;
    case 3:
      uint64_t result = 0x7473696C79616C50;
      break;
    case 4:
      uint64_t result = 0x6F65646956;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21BD41928()
{
  uint64_t v0 = sub_21BEAADF8();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_21BD4197C(char a1)
{
  if (a1) {
    return 0x6F69647541;
  }
  else {
    return 0x6F65646956;
  }
}

void sub_21BD419A4()
{
  if (!qword_267C657C0)
  {
    sub_21BD419FC();
    unint64_t v0 = sub_21BEAAE28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C657C0);
    }
  }
}

void sub_21BD419FC()
{
  if (!qword_267C657C8)
  {
    sub_21BEA8ED8();
    sub_21BD41A88(255, (unint64_t *)&qword_26AAF2D70, MEMORY[0x263F8D488]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267C657C8);
    }
  }
}

void sub_21BD41A88(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8D310]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_21BD41AD8(uint64_t a1)
{
  return a1;
}

uint64_t sub_21BD41B04(unsigned __int8 *a1, char *a2)
{
  return sub_21BC03014(*a1, *a2);
}

uint64_t sub_21BD41B10()
{
  return sub_21BD40218(*v0);
}

uint64_t sub_21BD41B18()
{
  return sub_21BD403B0();
}

uint64_t sub_21BD41B20(uint64_t a1)
{
  return sub_21BD40488(a1, *v1);
}

uint64_t sub_21BD41B28@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21BD4183C();
  *a1 = result;
  return result;
}

uint64_t sub_21BD41B58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21BD41888(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21BD41B84(char *a1, char *a2)
{
  return sub_21BC02F9C(*a1, *a2);
}

uint64_t sub_21BD41B90()
{
  return sub_21BD40288();
}

uint64_t sub_21BD41B98()
{
  return sub_21BD40360();
}

uint64_t sub_21BD41BA0()
{
  return sub_21BD404A0();
}

uint64_t sub_21BD41BA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21BD41928();
  *a1 = result;
  return result;
}

uint64_t sub_21BD41BD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21BD4197C(*v1);
  *a1 = result;
  a1[1] = 0xE500000000000000;
  return result;
}

unsigned char *sub_21BD41C08(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21BD41CD4);
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

void type metadata accessor for QOSMusicItems.QOSMediaType()
{
}

uint64_t sub_21BD41D08()
{
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

  return swift_bridgeObjectRelease();
}

uint64_t sub_21BD41D8C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21BD41E78(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t sub_21BD41FD0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21BD42098(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21BD420D8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for QOSMusicItems()
{
}

unsigned char *sub_21BD42140(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x21BD4220CLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for QOSMusicItems.QOSItemType()
{
}

unint64_t sub_21BD42244()
{
  unint64_t result = qword_267C657F0;
  if (!qword_267C657F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C657F0);
  }
  return result;
}

unint64_t sub_21BD42294()
{
  unint64_t result = qword_267C657F8;
  if (!qword_267C657F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267C657F8);
  }
  return result;
}

uint64_t type metadata accessor for MPCPodcastsDialogHandler()
{
  return self;
}

id sub_21BD42308(void *a1)
{
  return a1;
}

uint64_t sub_21BD42320()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21BC4D3D4;
  return sub_21BD0A0DC();
}

uint64_t sub_21BD423AC(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_resume();
}

BOOL sub_21BD423D0(id a1)
{
  sub_21BC0BE78(0, (unint64_t *)&qword_26AAF2F60);
  sub_21BD0CA90();
  id v3 = v1;
  uint64_t v4 = sub_21BEAAE48();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
  }
  else
  {
    uint64_t v5 = (void *)swift_allocError();
    *unsigned int v6 = v17;
  }
  uint64_t v7 = (void *)sub_21BEA8B08();

  id v8 = objc_msgSend(v7, sel_domain);
  uint64_t v9 = sub_21BEAA178();
  uint64_t v11 = v10;

  if (v9 == sub_21BEAA178() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {

      return 0;
    }
  }
  id v16 = objc_msgSend(v7, sel_code);

  return v16 == a1;
}

uint64_t sub_21BD42540@<X0>(uint64_t a1@<X8>)
{
  id v3 = *(void **)(v1 + 112);
  if (v3)
  {
    uint64_t v5 = *(void *)(v1 + 16);
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v6 = *(void *)(v1 + 32);
    if (v3 == (void *)1)
    {
      id v3 = 0;
      char v7 = 2;
    }
    else
    {
      char v7 = *(unsigned char *)(v1 + 120) & 1;
      id v8 = v3;
    }
    swift_unknownObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    char v7 = 0;
  }
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = v7;
  return result;
}

uint64_t sub_21BD425D4()
{
  uint64_t v1 = *(void *)(v0 + 112);
  if (!v1) {
    return 1;
  }
  if (v1 != 1) {
    return 0;
  }
  uint64_t result = *(void *)(v0 + 32);
  if (result)
  {
    uint64_t result = (uint64_t)objc_msgSend((id)result, sel_avPlayerItem);
    if (result)
    {

      return 1;
    }
  }
  return result;
}

void sub_21BD42660()
{
  if (*(void *)(v0 + 128))
  {
    swift_retain();
    swift_task_isCancelled();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_21BD426A4()
{
  return 0xD000000000000019;
}

uint64_t sub_21BD42744()
{
  OUTLINED_FUNCTION_13();
  if (qword_26AAF0840 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = qword_26AAF6500;
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21BD42818;
  return sub_21BD443EC();
}

uint64_t sub_21BD42818()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_21BD428F8()
{
  OUTLINED_FUNCTION_27();
  if (qword_26AAF0840 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = qword_26AAF6500;
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21BD429DC;
  return sub_21BD443EC();
}

uint64_t sub_21BD429DC()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_21BD42ABC()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  OUTLINED_FUNCTION_7_0();
  return v0();
}

uint64_t sub_21BD42B14()
{
  if (*(void *)(v0 + 128))
  {
    sub_21BC02A18();
    swift_retain();
    sub_21BEAA4B8();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21BD42B80()
{
  OUTLINED_FUNCTION_13();
  *(void *)(v1 + 16) = v0;
  *(unsigned char *)(v1 + 64) = v2;
  if (qword_26AAF0840 != -1) {
    swift_once();
  }
  *(void *)(v1 + 24) = qword_26AAF6500;
  swift_retain();
  OUTLINED_FUNCTION_24_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_21BD42C28()
{
  OUTLINED_FUNCTION_27();
  uint64_t v1 = v0[2];
  uint64_t v2 = MEMORY[0x21D49EBF0](v1 + 40);
  v0[4] = v2;
  v0[5] = *(void *)(v1 + 48);
  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[6] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_21BD42D5C;
    return sub_21BCE52E8();
  }
  else
  {
    swift_release();
    sub_21BEAA3C8();
    sub_21BD464A0();
    swift_allocError();
    sub_21BEAA078();
    swift_willThrow();
    OUTLINED_FUNCTION_6_0();
    return v5();
  }
}

uint64_t sub_21BD42D5C()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_4();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_39_13();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_21BD42E54()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  return v1(v2, v3);
}

uint64_t sub_21BD42EB8()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

uint64_t sub_21BD42F1C()
{
  OUTLINED_FUNCTION_13();
  *(void *)(v1 + 384) = v0;
  *(unsigned char *)(v1 + 576) = v2;
  sub_21BC51AB4();
  *(void *)(v1 + 392) = swift_task_alloc();
  if (qword_26AAF0840 != -1) {
    swift_once();
  }
  *(void *)(v1 + 400) = qword_26AAF6500;
  swift_retain();
  OUTLINED_FUNCTION_24_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_21BD42FF0()
{
  uint64_t v1 = *(void *)(v0[48] + 32);
  if (v1)
  {
    v0[59] = v1;
    if (!objc_msgSend((id)swift_unknownObjectRetain(), sel_hasLoadableAsset))
    {
      uint64_t v6 = v0[48];
      swift_release();
      __swift_project_boxed_opaque_existential_0Tm((void *)(v6 + 56), *(void *)(v6 + 80));
      OUTLINED_FUNCTION_54_7();
      unint64_t v7 = sub_21BD426A4();
      uint64_t v9 = v8;
      swift_bridgeObjectRelease();
      uint64_t v10 = OUTLINED_FUNCTION_57_6();
      OUTLINED_FUNCTION_45_11(v10, v11, v12, v13, v14, v15, v16, v17, v7, v9);
      sub_21BD022A8(v0 + 2);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_55_6();
      __asm { BRAA            X1, X16 }
    }
    char v2 = (void *)swift_task_alloc();
    v0[60] = v2;
    void *v2 = v0;
    v2[1] = sub_21BD43604;
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[51] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_21BD431B0;
  }
  OUTLINED_FUNCTION_55_6();
  return sub_21BD42B80();
}

uint64_t sub_21BD431B0()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_4();
  void *v5 = v4;
  *(void *)(v7 + 416) = v6;
  *(void *)(v7 + 424) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_39_13();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_21BD432AC()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = v0[48];
  v0[54] = *(void *)(v1 + 16);
  v0[55] = *(void *)(v1 + 24);
  sub_21BEAA3F8();
  v0[56] = sub_21BEAA3E8();
  uint64_t v3 = sub_21BEAA388();
  return MEMORY[0x270FA2498](sub_21BD43350, v3, v2);
}

uint64_t sub_21BD43350()
{
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 432);
  char v4 = *(unsigned char *)(v0 + 576);
  swift_release();
  *(void *)(v0 + 456) = sub_21BCE1C28(v2, v1, v4);
  *(void *)(v0 + 464) = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(v0 + 400);
    uint64_t v6 = sub_21BD43410;
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 400);
    swift_unknownObjectRelease();
    uint64_t v6 = sub_21BD43480;
    uint64_t v5 = v7;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_21BD43410()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

uint64_t sub_21BD43480()
{
  uint64_t v1 = v0[48];
  *(void *)(v1 + 32) = v0[57];
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v3 = *(void *)(v1 + 32);
  if (v3)
  {
    v0[59] = v3;
    if (!objc_msgSend((id)swift_unknownObjectRetain(), sel_hasLoadableAsset))
    {
      uint64_t v6 = v0[48];
      swift_release();
      __swift_project_boxed_opaque_existential_0Tm((void *)(v6 + 56), *(void *)(v6 + 80));
      OUTLINED_FUNCTION_54_7();
      unint64_t v7 = sub_21BD426A4();
      uint64_t v9 = v8;
      swift_bridgeObjectRelease();
      uint64_t v10 = OUTLINED_FUNCTION_57_6();
      OUTLINED_FUNCTION_45_11(v10, v11, v12, v13, v14, v15, v16, v17, v7, v9);
      sub_21BD022A8(v0 + 2);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_55_6();
      __asm { BRAA            X1, X16 }
    }
    char v4 = (void *)swift_task_alloc();
    v0[60] = v4;
    *char v4 = v0;
    v4[1] = sub_21BD43604;
    OUTLINED_FUNCTION_55_6();
    return sub_21BD42B80();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21BD43604()
{
  OUTLINED_FUNCTION_27();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v8 = v7;
  v5[61] = v3;
  v5[62] = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_39_13();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    uint64_t v12 = (void *)swift_task_alloc();
    v5[63] = v12;
    void *v12 = v7;
    v12[1] = sub_21BD4375C;
    return sub_21BCE4BC0();
  }
}

uint64_t sub_21BD4375C()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *char v4 = v3;
  *char v4 = *v1;
  v3[64] = v5;
  v3[65] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = v3[50];
    uint64_t v7 = sub_21BD43A54;
  }
  else
  {
    uint64_t v8 = v3[50];
    swift_unknownObjectRelease();
    uint64_t v7 = sub_21BD4385C;
    uint64_t v6 = v8;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_21BD4385C()
{
  uint64_t v1 = v0[65];
  sub_21BEAA4F8();
  uint64_t v2 = (void *)v0[64];
  if (v1)
  {
    swift_release();
LABEL_8:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
    return v10();
  }
  v0[66] = swift_getObjectType();
  if ((objc_msgSend(v2, sel_isAssetLoaded) & 1) == 0)
  {
    uint64_t v5 = (void *)v0[64];
    uint64_t v6 = v0[49];
    swift_release();
    uint64_t v7 = sub_21BEAA418();
    __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = 0;
    *(void *)(v8 + 24) = 0;
    sub_21BC24F24(v6, (uint64_t)&unk_267C65830, v8);
    swift_release();
    sub_21BC387DC(v6);
    sub_21BEAA3C8();
    sub_21BD464A0();
    uint64_t v9 = (void *)swift_allocError();
    sub_21BEAA078();
    sub_21BCF98B4(v5);

    swift_willThrow();
    goto LABEL_8;
  }
  uint64_t v3 = (void *)swift_task_alloc();
  v0[67] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_21BD43AD0;
  return sub_21BD42B80();
}

uint64_t sub_21BD43A54()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

uint64_t sub_21BD43AD0()
{
  OUTLINED_FUNCTION_27();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v8 = v7;
  v5[68] = v3;
  v5[69] = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_39_13();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    uint64_t v12 = (void *)swift_task_alloc();
    v5[70] = v12;
    void *v12 = v7;
    v12[1] = sub_21BD43C28;
    return sub_21BCE4F50();
  }
}

uint64_t sub_21BD43C28()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_4();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 568) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_39_13();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_21BD43D20()
{
  uint64_t v1 = *(void *)(v0 + 568);
  swift_release();
  swift_unknownObjectRelease();
  sub_21BEAA4F8();
  if (v1)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    id v3 = objc_msgSend(*(id *)(v0 + 512), sel_avPlayerItem);
    if (v3)
    {
      uint64_t v4 = *(void **)(v0 + 512);
      id v5 = v3;
      sub_21BD0BE74();
      uint64_t v6 = (void *)sub_21BEAA138();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_setContentItemID_, v6);

      id v7 = v5;
      id v8 = objc_msgSend(v4, sel_title);
      objc_msgSend(v7, sel_setTitle_, v8);

      id v9 = v7;
      objc_msgSend(v9, sel_setIsVideoContent_, objc_msgSend(v4, sel_isVideoContent));

      id v10 = v9;
      objc_msgSend(v10, sel_setPrefersSeekOverSkip_, objc_msgSend(v4, sel_prefersSeekOverSkip));
    }
    swift_unknownObjectRelease();
    uint64_t v11 = *(void *)(v0 + 384);
    *(void *)(v11 + 32) = *(void *)(v0 + 512);
    swift_unknownObjectRelease();
    uint64_t v12 = *(void **)(v11 + 112);
    *(void *)(v11 + 112) = 1;
    *(unsigned char *)(v11 + 120) = 0;
    sub_21BD463A0(v12);
    swift_task_dealloc();
    OUTLINED_FUNCTION_7_0();
  }
  return v2();
}

uint64_t sub_21BD43F18()
{
  OUTLINED_FUNCTION_27();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

uint64_t sub_21BD43FA8()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

uint64_t sub_21BD4400C()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

uint64_t sub_21BD4407C()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

uint64_t sub_21BD440F8()
{
  return MEMORY[0x270FA2498](sub_21BD44114, 0, 0);
}

uint64_t sub_21BD44114()
{
  uint64_t v1 = self;
  uint64_t v2 = *MEMORY[0x263F54E80];
  uint64_t v3 = sub_21BEAA138();
  v0[15] = v3;
  uint64_t v4 = sub_21BEAA138();
  v0[16] = v4;
  uint64_t v5 = sub_21BEAA138();
  v0[17] = v5;
  v0[2] = v0;
  v0[3] = sub_21BD442A8;
  uint64_t v6 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21BD443E4;
  v0[13] = &block_descriptor_3;
  v0[14] = v6;
  objc_msgSend(v1, sel_snapshotWithDomain_type_subType_context_triggerThresholdValues_events_completion_, v2, v3, v4, v5, 0, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21BD442A8()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  void *v2 = v1;
  return MEMORY[0x270FA2498](sub_21BD44380, 0, 0);
}

uint64_t sub_21BD44380()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = *(void **)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 120);

  OUTLINED_FUNCTION_6_0();
  return v3();
}

uint64_t sub_21BD443E4(uint64_t a1)
{
  return j__swift_continuation_resume(*(void *)(a1 + 32));
}

uint64_t sub_21BD443EC()
{
  OUTLINED_FUNCTION_27();
  v1[246] = v0;
  uint64_t v2 = sub_21BEAA3C8();
  v1[247] = v2;
  v1[248] = *(void *)(v2 - 8);
  v1[249] = swift_task_alloc();
  v1[250] = swift_task_alloc();
  if (qword_26AAF0840 != -1) {
    swift_once();
  }
  v1[251] = qword_26AAF6500;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v1[252] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21BD4453C;
  return sub_21BD42F1C();
}

uint64_t sub_21BD4453C()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_4();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 2008);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2_4();
  *id v7 = v6;
  *(void *)(v8 + 2024) = v0;
  swift_task_dealloc();
  if (v0) {
    id v9 = sub_21BD44898;
  }
  else {
    id v9 = sub_21BD44634;
  }
  return MEMORY[0x270FA2498](v9, v5, 0);
}

#error "21BD44734: call analysis failed (funcsize=147)"

#error "21BD44C40: call analysis failed (funcsize=314)"

uint64_t sub_21BD44DA0()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_4();
  void *v5 = v4;
  *(void *)(v7 + 2048) = v6;
  *(void *)(v7 + 2056) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_39_13();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_21BD44EA0()
{
  OUTLINED_FUNCTION_27();
  uint64_t v1 = (void *)v0[254];
  v0[258] = *(void *)(v0[246] + 32);
  id v2 = v1;
  swift_unknownObjectRetain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[259] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_21BD44F60;
  return sub_21BCE654C();
}

uint64_t sub_21BD44F60()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  v3[260] = v5;
  v3[261] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = (void *)v3[254];
    uint64_t v7 = v3[251];

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v8 = sub_21BD4559C;
  }
  else
  {
    uint64_t v9 = (void *)v3[254];
    uint64_t v7 = v3[251];
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    uint64_t v8 = sub_21BD45098;
  }
  return MEMORY[0x270FA2498](v8, v7, 0);
}

#error "21BD454C4: call analysis failed (funcsize=303)"

#error "21BD456B4: call analysis failed (funcsize=153)"

uint64_t sub_21BD45818()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_4();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 2104) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_39_13();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

#error "21BD45A28: call analysis failed (funcsize=153)"

#error "21BD45CA4: call analysis failed (funcsize=153)"

#error "21BD45F20: call analysis failed (funcsize=153)"

uint64_t sub_21BD46084()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_21BC332AC(v0 + 40);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  swift_release();
  sub_21BD463A0(*(id *)(v0 + 112));
  swift_release();
  return v0;
}

uint64_t sub_21BD460D8()
{
  sub_21BD46084();

  return MEMORY[0x270FA0228](v0, 136, 7);
}

uint64_t type metadata accessor for AssetTask()
{
  return self;
}

uint64_t sub_21BD46134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(void *)a1 = *(void *)a2;
  }
  else
  {
    id v5 = v4;
    *(void *)a1 = v4;
  }
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t sub_21BD46194(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {
    if ((unint64_t)v5 >= 0xFFFFFFFF)
    {
      id v8 = v5;
      *(void *)a1 = v5;
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v9 = *(void **)a2;
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)a1 = v9;
    return a1;
  }
  if ((unint64_t)v5 < 0xFFFFFFFF)
  {

    goto LABEL_8;
  }
  id v6 = v5;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = v5;

LABEL_6:
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t sub_21BD46234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  if ((unint64_t)v4 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {

LABEL_5:
    *(void *)a1 = *(void *)a2;
    goto LABEL_6;
  }
  *(void *)a1 = *(void *)a2;

LABEL_6:
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t sub_21BD4629C(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 9)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_21BD462F0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_21BD46350(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    *(unsigned char *)(result + 8) = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *(void *)uint64_t result = v2;
  return result;
}

void type metadata accessor for AssetTask.State()
{
}

unint64_t sub_21BD4637C()
{
  return sub_21BD426A4();
}

void sub_21BD463A0(id a1)
{
  if ((unint64_t)a1 >= 2) {
}
  }

id sub_21BD463B0(id result)
{
  if ((unint64_t)result >= 2) {
    return result;
  }
  return result;
}

uint64_t sub_21BD463C0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21BD463F8()
{
  OUTLINED_FUNCTION_27();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21BC382A8;
  return sub_21BD440F8();
}

unint64_t sub_21BD464A0()
{
  unint64_t result = qword_26AAF2D58;
  if (!qword_26AAF2D58)
  {
    sub_21BEAA3C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAF2D58);
  }
  return result;
}

void sub_21BD464F0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t sub_21BD46534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  unsigned int v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  id v6 = v5;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t sub_21BD46594(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v4 = *(void **)(a1 + 24);
  unsigned int v5 = *(void **)(a2 + 24);
  id v6 = v5;
  *(void *)(a1 + 24) = v5;

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_21BD46634(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t sub_21BD46694(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21BD466D4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AssetTask.Result()
{
}

unsigned char *sub_21BD46724(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x21BD467F0);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for AssetTask.Step()
{
}

unint64_t sub_21BD46828()
{
  unint64_t result = qword_267C65848;
  if (!qword_267C65848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267C65848);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_48_10()
{
  return sub_21BEAA238();
}

uint64_t sub_21BD46890(uint64_t a1)
{
  sub_21BC43614(a1, (uint64_t)v2);
  return ((unsigned __int16)(v3 >> 4) < 0xDu) & (0x1A81u >> (v3 >> 4));
}

void sub_21BD468D0(uint64_t a1)
{
}

uint64_t sub_21BD468E8(uint64_t a1)
{
  sub_21BC43614(a1, (uint64_t)&v9);
  int v1 = v15 | (v16 << 16);
  if (v16 >> 4 == 1)
  {
    unsigned __int8 v16 = BYTE2(v1) & 0xF;
    uint64_t v5 = v9;
    char v6 = LOBYTE(v10);
    uint64_t v7 = v13;
    uint64_t v17 = v11;
    uint64_t v18 = v12;
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    OUTLINED_FUNCTION_0_49();
    type metadata accessor for InitialLoadingState();
    swift_allocObject();
    sub_21BC42728(v5, v6, 0, (uint64_t)&v17);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_21BC01660(v7);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_21BC01660(v7);
    sub_21BC94C4C();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    sub_21BC020B8(v7);
    swift_release();
    return 1;
  }
  if (!(v16 >> 4))
  {
    unsigned __int8 v16 = BYTE2(v1) & 0xF;
    uint64_t v2 = v9;
    float v3 = v10;
    uint64_t v4 = v13;
    uint64_t v17 = v11;
    uint64_t v18 = v12;
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    OUTLINED_FUNCTION_0_49();
    type metadata accessor for InitialPreLoadingState();
    swift_allocObject();
    sub_21BC42F48(v2, (uint64_t)&v17, v3);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_21BC01660(v4);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_21BC01660(v4);
    sub_21BC94C4C();
    swift_release();
    sub_21BD46D94();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    sub_21BC020B8(v4);
    return 1;
  }
  return 0;
}

uint64_t sub_21BD46B0C(uint64_t a1)
{
  sub_21BC331A0(a1, (uint64_t)v3);
  uint64_t result = 0;
  unsigned int v2 = (v4 >> 59) & 0x1E | (v4 >> 2) & 1;
  if (v2 <= 0x1F)
  {
    if (((1 << v2) & 0xFEE00707) != 0) {
      goto LABEL_3;
    }
    if (v2 == 7)
    {
      v4 &= 0xFFFFFFFFFFFFFFBuLL;
      sub_21BC96C1C(0, 1);
      goto LABEL_4;
    }
    if (v2 == 13)
    {
LABEL_3:
      v4 &= 0xFFFFFFFFFFFFFFBuLL;
LABEL_4:
      sub_21BC94F44();
      return 1;
    }
  }
  return result;
}

uint64_t sub_21BD46BBC(char a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a4 >> 61)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
      OUTLINED_FUNCTION_2_41();
      goto LABEL_10;
    case 3uLL:
      OUTLINED_FUNCTION_2_41();
      sub_21BC94FAC();
      if ((a1 & 1) == 0) {
        return 1;
      }
      type metadata accessor for PausedState();
      memset(v21, 0, 35);
      swift_allocObject();
      sub_21BC932E8(0, 4, (uint64_t)v21, 0.0);
LABEL_8:
      sub_21BC94C4C();
      swift_release();
      return 1;
    case 5uLL:
      OUTLINED_FUNCTION_3_40();
      swift_retain();
      uint64_t v13 = sub_21BC95148();
      type metadata accessor for MediaServicesInterruptedState();
      swift_allocObject();
      uint64_t v14 = OUTLINED_FUNCTION_1_43();
      sub_21BCB3F10(v14, v15, v16, v17, v18, v13);
      goto LABEL_8;
    case 6uLL:
      type metadata accessor for MediaServicesResumingState();
      uint64_t v19 = swift_retain();
      sub_21BCB4430(v19, a2, a3, a4);
      goto LABEL_8;
    case 7uLL:
      type metadata accessor for IdleState();
      swift_allocObject();
      sub_21BC94C4C();
      swift_release();
LABEL_10:
      sub_21BC94FAC();
      return 1;
    default:
      type metadata accessor for InterruptedState();
      swift_allocObject();
      OUTLINED_FUNCTION_3_40();
      swift_retain();
      uint64_t v8 = OUTLINED_FUNCTION_1_43();
      sub_21BCF42E0(v8, v9, v10, v11, v12);
      goto LABEL_8;
  }
}

uint64_t sub_21BD46D94()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 80))();
  if (result)
  {
    sub_21BCA2F78((uint64_t)&v5);
    unsigned int v2 = v6;
    long long v8 = v5;
    uint64_t result = sub_21BC0B92C((uint64_t)&v8);
    if (v2)
    {
      sub_21BCA2F78((uint64_t)v7);
      uint64_t v3 = v7[0];
      uint64_t v4 = v7[1];
      sub_21BC020B8(v7[2]);
      v2(v3, v4, 0);
      sub_21BC020B8((uint64_t)v2);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_21BD46E54(uint64_t a1)
{
}

void sub_21BD46E6C(uint64_t a1, void (*a2)(void *))
{
  a2(__src);
  sub_21BC02A04(__src, &v2);
  sub_21BC95184();
}

uint64_t sub_21BD46EC4(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3)
  {
    sub_21BC96E24();
    return 1;
  }
  if (a3 == 2)
  {
    type metadata accessor for EndOfQueueState();
    swift_bridgeObjectRetain();
    sub_21BCA20DC(a1, a2);
    sub_21BC94C4C();
    swift_release();
    return 1;
  }
  return 0;
}

uint64_t sub_21BD46F60()
{
  return 0x6574617453;
}

uint64_t type metadata accessor for State()
{
  return self;
}

uint64_t sub_21BD46F98()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

uint64_t sub_21BD46FDC()
{
  return sub_21BD47090();
}

uint64_t sub_21BD46FF4()
{
  OUTLINED_FUNCTION_44_10();
  uint64_t v3 = type metadata accessor for PodcastChapter();
  uint64_t v4 = v3;
  if (v2)
  {
    sub_21BCB1860(v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v0);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return __swift_storeEnumTagSinglePayload(v0, v5, 1, v4);
}

uint64_t sub_21BD47090()
{
  uint64_t v3 = OUTLINED_FUNCTION_44_10();
  uint64_t v5 = v4(v3);
  uint64_t v6 = v5;
  if (v2)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v0, v1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return __swift_storeEnumTagSinglePayload(v0, v7, 1, v6);
}

BOOL sub_21BD47130(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a1;
  uint64_t v4 = sub_21BEA8DB8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21BD4D7B0(0, &qword_267C658C8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8, v11, v12);
  uint64_t v14 = (char *)v27 - v13;
  uint64_t v15 = *(void *)(a3 + 16);
  v27[1] = a3;
  if (v15)
  {
    unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v16 = v5 + 16;
    int v31 = v9;
    uint64_t v32 = v17;
    uint64_t v18 = a3 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
    uint64_t v19 = *(void *)(v16 + 56);
    uint64_t v30 = (void (**)(char *, char *, uint64_t))(v16 + 16);
    uint64_t v28 = v19;
    uint64_t v29 = (void (**)(char *, uint64_t))(v16 - 8);
    swift_bridgeObjectRetain();
    uint64_t v20 = v31;
    while (1)
    {
      v32(v14, v18, v4);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v4);
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v4);
      BOOL v22 = EnumTagSinglePayload != 1;
      if (EnumTagSinglePayload == 1) {
        break;
      }
      (*v30)(v20, v14, v4);
      uint64_t v23 = v34;
      char v24 = v33(v20);
      if (v23)
      {
        (*v29)(v20, v4);
        swift_bridgeObjectRelease();
        return v22;
      }
      char v25 = v24;
      uint64_t v34 = 0;
      (*v29)(v20, v4);
      if (v25) {
        break;
      }
      v18 += v28;
      if (!--v15) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_9:
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v4);
    BOOL v22 = 0;
  }
  swift_bridgeObjectRelease();
  return v22;
}

void *sub_21BD473D0(uint64_t a1)
{
  v1[4] = 0x3FA999999999999ALL;
  v1[5] = 2;
  v1[6] = MEMORY[0x263F8EE78];
  v1[2] = a1;
  v1[3] = &unk_26CBBDD38;
  return v1;
}

uint64_t sub_21BD47404()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_45((uint64_t)sub_21BD4741C);
}

uint64_t sub_21BD4741C()
{
  OUTLINED_FUNCTION_13();
  if (sub_21BEAA4E8())
  {
LABEL_4:
    OUTLINED_FUNCTION_73();
    return v1();
  }
  if (*(void *)(*(void *)(*(void *)(v0 + 16) + 48) + 16))
  {
    swift_bridgeObjectRetain();
    goto LABEL_4;
  }
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_21BD47500;
  return sub_21BD475D0();
}

uint64_t sub_21BD47500()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_4();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_4();
  void *v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_73();
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_21BD475D0()
{
  OUTLINED_FUNCTION_13();
  v1[15] = v0;
  uint64_t v2 = sub_21BEA8D58();
  v1[16] = v2;
  OUTLINED_FUNCTION_1_0(v2);
  v1[17] = v3;
  v1[18] = OUTLINED_FUNCTION_9_10();
  uint64_t v4 = type metadata accessor for PodcastChapter();
  v1[19] = v4;
  OUTLINED_FUNCTION_1_0(v4);
  v1[20] = v5;
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_21_0(v6);
  v1[23] = OUTLINED_FUNCTION_9_10();
  uint64_t v7 = sub_21BEA8DB8();
  v1[24] = v7;
  OUTLINED_FUNCTION_1_0(v7);
  v1[25] = v8;
  v1[26] = OUTLINED_FUNCTION_9_10();
  uint64_t v9 = sub_21BEA8C58();
  v1[27] = v9;
  OUTLINED_FUNCTION_1_0(v9);
  v1[28] = v10;
  v1[29] = OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_21BD47754()
{
  OUTLINED_FUNCTION_35_0();
  uint64_t v2 = v0[28];
  uint64_t v1 = v0[29];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[15];
  uint64_t v5 = *(void **)(v4 + 16);
  v0[30] = v5;
  id v6 = objc_msgSend(v5, sel_URL);
  sub_21BEA8C18();

  sub_21BEA8BD8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = sub_21BEAA1F8();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  LOBYTE(v7) = sub_21BCD6108(v7, v9, *(void **)(v4 + 24));
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    sub_21BD4DB5C();
    swift_allocError();
    swift_willThrow();
    OUTLINED_FUNCTION_3_41();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_12();
    __asm { BRAA            X1, X16 }
  }
  sub_21BD4DBA8();
  v0[31] = sub_21BEA8F68();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[32] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_21BD47930;
  OUTLINED_FUNCTION_26_16();
  OUTLINED_FUNCTION_12();
  return MEMORY[0x270F9C8E8](v11, v12);
}

uint64_t sub_21BD47930()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_4();
  *id v6 = v5;
  *(void *)(v3 + 264) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_21BD47A18()
{
  sub_21BD497E4(v0[14], v0[26]);
  swift_bridgeObjectRelease();
  sub_21BD4D7B0(0, &qword_267C658F8, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataKey, MEMORY[0x263F8E0F8]);
  uint64_t v1 = swift_allocObject();
  v0[34] = v1;
  *(_OWORD *)(v1 + 16) = xmmword_21BEEB3A0;
  uint64_t v2 = (void *)*MEMORY[0x263EF9DC8];
  uint64_t v3 = (void *)*MEMORY[0x263EF9D90];
  *(void *)(v1 + 32) = *MEMORY[0x263EF9DC8];
  *(void *)(v1 + 40) = v3;
  id v4 = v2;
  id v5 = v3;
  id v6 = (void *)swift_task_alloc();
  v0[35] = (uint64_t)v6;
  *id v6 = v0;
  v6[1] = sub_21BD47B58;
  uint64_t v7 = v0[26];
  return MEMORY[0x270F9C908](v7, v1);
}

uint64_t sub_21BD47B58()
{
  OUTLINED_FUNCTION_2_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_4();
  void *v5 = v4;
  *(void *)(v7 + 288) = v6;
  *(void *)(v7 + 296) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_21BD47C88()
{
  uint64_t v21 = v0;
  unint64_t v1 = v0[36];
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_24_6();
    uint64_t v2 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v0[38] = v2;
  if (v2)
  {
    unint64_t v3 = v1 & 0xC000000000000001;
    sub_21BCD9EFC(0, v3 == 0, v0[36]);
    uint64_t v4 = v0[36];
    if (v3) {
      id v5 = (id)MEMORY[0x21D49C490](0, v4);
    }
    else {
      id v5 = *(id *)(v4 + 32);
    }
    uint64_t v6 = v5;
    if (sub_21BEAA4E8())
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_41_12();
      OUTLINED_FUNCTION_48_0();
      v7();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_32_16();
      __asm { BRAA            X2, X16 }
    }
    uint64_t v13 = MEMORY[0x263F8EE78];
    v0[40] = 1;
    v0[41] = v13;
    v0[39] = v6;
    uint64_t v14 = (void *)swift_task_alloc();
    v0[42] = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_21BD47F30;
    OUTLINED_FUNCTION_32_16();
    return sub_21BD4A194(v15, v16);
  }
  else
  {
    uint64_t v10 = v0[37];
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain_n();
    sub_21BD4C584(&v20);
    if (v10)
    {
      OUTLINED_FUNCTION_32_16();
      return swift_release();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      v0[52] = v20;
      uint64_t v18 = (void *)swift_task_alloc();
      v0[53] = v18;
      *uint64_t v18 = v0;
      v18[1] = sub_21BD4886C;
      OUTLINED_FUNCTION_32_16();
      return sub_21BD48DEC();
    }
  }
}

uint64_t sub_21BD47F30()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  unint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v6 = v5;
  v3[43] = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_0();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    uint64_t v10 = (void *)swift_task_alloc();
    v3[44] = v10;
    *uint64_t v10 = v5;
    v10[1] = sub_21BD48080;
    uint64_t v11 = v3[39];
    return sub_21BD4A908(v11);
  }
}

uint64_t sub_21BD48080()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  unint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  *uint64_t v4 = v5;
  v3[45] = v6;
  v3[46] = v7;
  v3[47] = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_0();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
  else
  {
    uint64_t v11 = (void *)swift_task_alloc();
    v3[48] = v11;
    *uint64_t v11 = v5;
    v11[1] = sub_21BD481D8;
    uint64_t v12 = v3[39];
    return sub_21BD49D60(v12);
  }
}

uint64_t sub_21BD481D8()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  unint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  v3[49] = v5;
  v3[50] = v6;
  v3[51] = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

void sub_21BD482D4()
{
  uint64_t v56 = v0;
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void **)(v0 + 312);
  if (!v1)
  {
    uint64_t v29 = *(void *)(v0 + 360);
    unint64_t v28 = *(void *)(v0 + 368);
    sub_21BD4DAFC(*(void *)(v0 + 184), (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
    sub_21BC6545C(v29, v28);

LABEL_9:
    uint64_t v19 = *(void *)(v0 + 328);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(v0 + 312), sel_timeRange);
  uint64_t v3 = *(void *)(v0 + 480);
  uint64_t v4 = *(void *)(v0 + 472);
  *(void *)(v0 + 64) = *(void *)(v0 + 464);
  *(void *)(v0 + 72) = v4;
  *(void *)(v0 + 80) = v3;
  double Seconds = CMTimeGetSeconds((CMTime *)(v0 + 64));
  objc_msgSend(v2, sel_timeRange);
  *(void *)(v0 + 88) = *(void *)(v0 + 16);
  uint64_t v6 = *(void *)(v0 + 32);
  *(void *)(v0 + 96) = *(void *)(v0 + 24);
  *(void *)(v0 + 104) = v6;
  Float64 v7 = CMTimeGetSeconds((CMTime *)(v0 + 88));
  if (Seconds <= 0.05)
  {
    uint64_t v31 = *(void *)(v0 + 360);
    unint64_t v30 = *(void *)(v0 + 368);
    uint64_t v32 = *(void **)(v0 + 312);
    sub_21BD4DAFC(*(void *)(v0 + 184), (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
    sub_21BC6545C(v31, v30);
    swift_bridgeObjectRelease();

    goto LABEL_9;
  }
  uint64_t v8 = *(void *)(v0 + 360);
  uint64_t v52 = *(void *)(v0 + 392);
  unint64_t v53 = *(void *)(v0 + 368);
  uint64_t v9 = *(uint64_t **)(v0 + 176);
  uint64_t v51 = *(void *)(v0 + 184);
  uint64_t v54 = *(void *)(v0 + 168);
  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v11 = *(int **)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 128);
  uint64_t v12 = *(void *)(v0 + 136);
  sub_21BEA8D48();
  uint64_t v14 = sub_21BEA8D28();
  uint64_t v16 = v15;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v13);
  sub_21BD3E6BC(v51, (uint64_t)v9 + v11[6]);
  *uint64_t v9 = v14;
  v9[1] = v16;
  v9[2] = v52;
  _OWORD v9[3] = v1;
  uint64_t v17 = (uint64_t *)((char *)v9 + v11[7]);
  uint64_t *v17 = v8;
  v17[1] = v53;
  *(double *)((char *)v9 + v11[8]) = Seconds;
  *(Float64 *)((char *)v9 + v11[9]) = v7;
  sub_21BCB1860((uint64_t)v9, v54);
  sub_21BD4DA28(v8, v53);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *(void *)(v0 + 328);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_31;
  }
  while (1)
  {
    unint64_t v20 = *(void *)(v19 + 16);
    if (v20 >= *(void *)(v19 + 24) >> 1)
    {
      sub_21BD21250();
      uint64_t v19 = v50;
    }
    uint64_t v22 = *(void *)(v0 + 360);
    unint64_t v21 = *(void *)(v0 + 368);
    uint64_t v23 = *(void **)(v0 + 312);
    uint64_t v25 = *(void *)(v0 + 176);
    uint64_t v24 = *(void *)(v0 + 184);
    uint64_t v27 = *(void *)(v0 + 160);
    uint64_t v26 = *(void *)(v0 + 168);
    *(void *)(v19 + 16) = v20 + 1;
    sub_21BCB1540(v26, v19+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(void *)(v27 + 72) * v20);

    sub_21BC6545C(v22, v21);
    sub_21BD4DAA0(v25);
    sub_21BD4DAFC(v24, (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
LABEL_10:
    unint64_t v33 = *(void *)(v0 + 320);
    if (v33 == *(void *)(v0 + 304))
    {
      uint64_t v34 = *(void *)(v0 + 408);
      swift_bridgeObjectRelease();
      uint64_t v55 = v19;
      swift_bridgeObjectRetain_n();
      sub_21BD4C584(&v55);
      if (v34)
      {
        OUTLINED_FUNCTION_2_33();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        *(void *)(v0 + 416) = v55;
        id v38 = (void *)swift_task_alloc();
        *(void *)(v0 + 424) = v38;
        *id v38 = v0;
        v38[1] = sub_21BD4886C;
        OUTLINED_FUNCTION_2_33();
        sub_21BD48DEC();
      }
      return;
    }
    uint64_t v36 = *(void *)(v0 + 288);
    if ((v36 & 0xC000000000000001) != 0)
    {
      id v37 = (id)MEMORY[0x21D49C490](*(void *)(v0 + 320));
      unint64_t v33 = *(void *)(v0 + 320);
    }
    else
    {
      if (v33 >= *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v37 = *(id *)(v36 + 8 * v33 + 32);
    }
    BOOL v40 = __OFADD__(v33, 1);
    unint64_t v41 = v33 + 1;
    if (!v40) {
      break;
    }
    __break(1u);
LABEL_31:
    sub_21BD21250();
    uint64_t v19 = v49;
  }
  if (sub_21BEAA4E8())
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_48_0();
    v42();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_2_33();
    __asm { BRAA            X2, X16 }
  }
  *(void *)(v0 + 320) = v41;
  *(void *)(v0 + 328) = v19;
  *(void *)(v0 + 312) = v37;
  uint64_t v45 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v45;
  *uint64_t v45 = v0;
  v45[1] = sub_21BD47F30;
  OUTLINED_FUNCTION_2_33();
  sub_21BD4A194(v46, v47);
}

uint64_t sub_21BD4886C()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_4();
  void *v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  *(void *)(v6 + 432) = v5;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

void sub_21BD48958()
{
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_41_12();
  OUTLINED_FUNCTION_48_0();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_12();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_21BD48A08()
{
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_8();
  swift_release();
  OUTLINED_FUNCTION_3_41();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_28();
  return v1(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t sub_21BD48A98()
{
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_48_0();
  v0();
  OUTLINED_FUNCTION_3_41();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_28();
  return v2(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_21BD48B34()
{
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_8();
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_3_41();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_28();
  return v5(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_21BD48BE4()
{
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_8();
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);

  sub_21BD4DAFC(v4, (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_3_41();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_28();
  return v6(v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_21BD48CE0()
{
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_8();
  uint64_t v1 = *(void *)(v0 + 360);
  unint64_t v2 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 192);

  sub_21BC6545C(v1, v2);
  sub_21BD4DAFC(v6, (uint64_t)&qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  OUTLINED_FUNCTION_3_41();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_28();
  return v8(v7, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_21BD48DEC()
{
  OUTLINED_FUNCTION_13();
  v1[8] = v2;
  v1[9] = v0;
  sub_21BD4D7B0(0, &qword_267C642C0, (uint64_t (*)(uint64_t))type metadata accessor for PodcastChapter, MEMORY[0x263F8D8F0]);
  OUTLINED_FUNCTION_21_0(v3);
  v1[10] = OUTLINED_FUNCTION_9_10();
  uint64_t v4 = type metadata accessor for PodcastChapter();
  v1[11] = v4;
  OUTLINED_FUNCTION_1_0(v4);
  v1[12] = v5;
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  sub_21BD4D9C0();
  v1[19] = v6;
  OUTLINED_FUNCTION_21_0(v6);
  v1[20] = OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_21BD48F34()
{
  uint64_t v1 = v0[8];
  uint64_t v58 = *(void *)(v1 + 16);
  if (v58)
  {
    uint64_t v47 = (void *)v0[17];
    uint64_t v48 = (void *)v0[18];
    uint64_t v51 = (void *)v0[15];
    uint64_t v52 = (void *)v0[16];
    uint64_t v2 = v0[12];
    uint64_t v56 = (int *)v0[11];
    uint64_t v57 = v0[19];
    unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 72);
    swift_bridgeObjectRetain_n();
    uint64_t v5 = 0;
    uint64_t v49 = -v4;
    uint64_t v54 = v0;
    uint64_t v55 = v4;
    uint64_t v50 = v1 - v4;
    uint64_t v6 = v1;
    uint64_t v53 = v1;
    while (1)
    {
      uint64_t v7 = (void *)v0[20];
      uint64_t v8 = v0[18];
      uint64_t v9 = (uint64_t)v7 + *(int *)(v57 + 48);
      *uint64_t v7 = v5;
      sub_21BCB1860(v1 + v3, v9);
      sub_21BCB1540(v9, v8);
      if (sub_21BEAA4E8())
      {
        uint64_t v39 = v0[18];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_21BD4DAA0(v39);
        goto LABEL_21;
      }
      uint64_t v10 = (uint64_t *)v0[18];
      if (v5)
      {
        uint64_t v12 = (void *)v0[15];
        uint64_t v11 = (uint64_t *)v0[16];
        sub_21BCB1860(v50 + v3, (uint64_t)v11);
        uint64_t v13 = v56[9];
        double v14 = *(double *)((char *)v11 + v13);
        double v15 = *(double *)((char *)v10 + v13) - v14;
        uint64_t v59 = v6;
        uint64_t v16 = *v11;
        uint64_t v17 = v52[1];
        uint64_t v18 = v52[2];
        uint64_t v19 = v52[3];
        sub_21BD3E6BC((uint64_t)v11 + v56[6], (uint64_t)v12 + v56[6]);
        unint64_t v20 = (uint64_t *)((char *)v11 + v56[7]);
        uint64_t v21 = *v20;
        unint64_t v22 = v20[1];
        void *v12 = v16;
        uint64_t v6 = v59;
        v51[1] = v17;
        v51[2] = v18;
        v51[3] = v19;
        uint64_t v23 = (void *)((char *)v12 + v56[7]);
        *uint64_t v23 = v21;
        v23[1] = v22;
        *(double *)((char *)v12 + v56[8]) = v15;
        *(double *)((char *)v12 + v56[9]) = v14;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_21BD4DA28(v21, v22);
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_21BD35388();
          uint64_t v6 = isUniquelyReferenced_nonNull_native;
        }
        uint64_t v1 = v53;
        uint64_t v0 = v54;
        if ((unint64_t)(v5 - 1) >= *(void *)(v6 + 16))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return MEMORY[0x270F9C8E8](isUniquelyReferenced_nonNull_native, v25);
        }
        uint64_t v26 = v54[16];
        sub_21BD4DA3C(v54[15], v6 + v49 + v3);
        sub_21BD4DAA0(v26);
      }
      else
      {
        double v27 = *(double *)((char *)v10 + v56[9]);
        if (v27 != 0.0)
        {
          unint64_t v28 = (void *)v0[17];
          double v29 = v27 + *(double *)((char *)v10 + v56[8]);
          uint64_t v30 = *v10;
          uint64_t v32 = v48[1];
          uint64_t v31 = v48[2];
          uint64_t v33 = v48[3];
          uint64_t v34 = (uint64_t)v10 + v56[6];
          uint64_t v35 = (uint64_t *)((char *)v10 + v56[7]);
          uint64_t v36 = *v35;
          unint64_t v37 = v35[1];
          void *v28 = v30;
          v47[1] = v32;
          v47[2] = v31;
          v47[3] = v33;
          sub_21BD3E6BC(v34, (uint64_t)v28 + v56[6]);
          id v38 = (void *)((char *)v28 + v56[7]);
          *id v38 = v36;
          v38[1] = v37;
          *(double *)((char *)v28 + v56[8]) = v29;
          *(void *)((char *)v28 + v56[9]) = 0;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_21BD4DA28(v36, v37);
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_21BD35388();
            uint64_t v6 = isUniquelyReferenced_nonNull_native;
          }
          if (!*(void *)(v6 + 16)) {
            goto LABEL_28;
          }
          sub_21BD4DA3C(v0[17], v6 + v3);
        }
      }
      ++v5;
      sub_21BD4DAA0(v0[18]);
      v3 += v55;
      if (v58 == v5)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v0[8];
        goto LABEL_18;
      }
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = v1;
LABEL_18:
  v0[21] = v6;
  uint64_t v41 = v0[10];
  uint64_t v40 = v0[11];
  sub_21BC0C1F4(v1, v41);
  if (__swift_getEnumTagSinglePayload(v41, 1, v40) != 1)
  {
    sub_21BCB1540(v0[10], v0[14]);
    sub_21BCFE0A8();
    uint64_t v45 = sub_21BEA8F88();
    v0[22] = v45;
    uint64_t v46 = (void *)swift_task_alloc();
    v0[23] = v46;
    *uint64_t v46 = v0;
    v46[1] = sub_21BD49410;
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)(v0 + 2);
    uint64_t v25 = v45;
    return MEMORY[0x270F9C8E8](isUniquelyReferenced_nonNull_native, v25);
  }
  sub_21BD4DAFC(v0[10], (uint64_t)&qword_267C642C0, (uint64_t)type metadata accessor for PodcastChapter, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
  if (*(void *)(v6 + 16) < 2uLL) {
    swift_bridgeObjectRelease();
  }
LABEL_21:
  OUTLINED_FUNCTION_20_20();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = OUTLINED_FUNCTION_19_1();
  return v43(v42);
}

uint64_t sub_21BD49410()
{
  OUTLINED_FUNCTION_17_27();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_2_4();
  *unint64_t v3 = v2;
  swift_task_dealloc();
  if (v0) {

  }
  swift_release();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_21BD4952C()
{
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 168);
  unint64_t v3 = *(void **)(v0 + 104);
  uint64_t v2 = *(uint64_t **)(v0 + 112);
  uint64_t v4 = *(int **)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 32);
  *(void *)(v0 + 48) = *(void *)(v0 + 24);
  *(void *)(v0 + 56) = v5;
  Float64 Seconds = CMTimeGetSeconds((CMTime *)(v0 + 40));
  unint64_t v23 = *(void *)(v1 + 16);
  double v7 = *(double *)((char *)v2 + v4[9]);
  Float64 v8 = Seconds - v7;
  uint64_t v9 = *v2;
  uint64_t v10 = v2[1];
  uint64_t v12 = v2[2];
  uint64_t v11 = v2[3];
  sub_21BD3E6BC((uint64_t)v2 + v4[6], (uint64_t)v3 + v4[6]);
  uint64_t v13 = (uint64_t *)((char *)v2 + v4[7]);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  *unint64_t v3 = v9;
  v3[1] = v10;
  v3[2] = v12;
  v3[3] = v11;
  uint64_t v16 = (void *)((char *)v3 + v4[7]);
  uint64_t *v16 = v14;
  v16[1] = v15;
  *(Float64 *)((char *)v3 + v4[8]) = v8;
  *(double *)((char *)v3 + v4[9]) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21BD4DA28(v14, v15);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *(void *)(v0 + 168);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_21BD35388();
    uint64_t v18 = v22;
  }
  if (!v23)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v23 > *(void *)(v18 + 16))
  {
LABEL_11:
    __break(1u);
    return;
  }
  uint64_t v19 = *(void *)(v0 + 112);
  sub_21BD4DA3C(*(void *)(v0 + 104), v18+ ((*(unsigned __int8 *)(*(void *)(v0 + 96) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 96) + 80))+ *(void *)(*(void *)(v0 + 96) + 72) * (v23 - 1));
  sub_21BD4DAA0(v19);
  if (*(void *)(v18 + 16) <= 1uLL) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20_20();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = OUTLINED_FUNCTION_19_1();
  v21(v20);
}

uint64_t sub_21BD49718()
{
  OUTLINED_FUNCTION_35_0();
  sub_21BD4DAA0(*(void *)(v0 + 112));
  if (*(void *)(*(void *)(v0 + 168) + 16) <= 1uLL) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20_20();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_19_1();
  return v2(v1);
}

uint64_t sub_21BD497E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  sub_21BD4D7B0(0, &qword_267C658C8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  uint64_t v4 = OUTLINED_FUNCTION_21_0(v3);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v5, v6);
  uint64_t v51 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v7, v9, v10);
  uint64_t v13 = (char *)&v50 - v12;
  MEMORY[0x270FA5388](v11, v14, v15);
  uint64_t v17 = (char *)&v50 - v16;
  uint64_t v18 = sub_21BEA8DB8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v18, v20, v21);
  uint64_t v24 = (char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22, v25, v26);
  unint64_t v28 = (char *)&v50 - v27;
  sub_21BEA8DA8();
  uint64_t v71 = v28;
  uint64_t v29 = a1;
  LOBYTE(a1) = sub_21BD47130((uint64_t (*)(char *))sub_21BD4D958, (uint64_t)v70, a1);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v19 + 8);
  v30(v28, v18);
  if (a1) {
    return sub_21BEA8DA8();
  }
  uint64_t v64 = v28;
  uint64_t v53 = v24;
  uint64_t v63 = v30;
  uint64_t v59 = v17;
  uint64_t v60 = v29;
  uint64_t v54 = v19;
  uint64_t result = sub_21BEA8D88();
  uint64_t v32 = result;
  uint64_t v58 = *(void *)(result + 16);
  if (v58)
  {
    unint64_t v33 = 0;
    uint64_t v34 = v60;
    uint64_t v35 = *(void *)(v60 + 16);
    uint64_t v56 = result + 32;
    uint64_t v57 = v35;
    uint64_t v65 = v54 + 16;
    uint64_t v66 = (void (**)(char *, char *, uint64_t))(v54 + 32);
    uint64_t v62 = v19 + 8;
    uint64_t v36 = v64;
    uint64_t v55 = result;
    while (v33 < *(void *)(v32 + 16))
    {
      unint64_t v61 = v33;
      uint64_t v37 = v57;
      if (v57)
      {
        uint64_t v38 = *(void *)(v56 + 16 * v33);
        unint64_t v39 = v34 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
        uint64_t v67 = *(void *)(v54 + 72);
        uint64_t v68 = v38;
        uint64_t v69 = *(void (**)(char *, unint64_t, uint64_t))(v54 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v40 = v37;
        uint64_t v41 = v53;
        while (1)
        {
          v69(v13, v39, v18);
          __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v18);
          OUTLINED_FUNCTION_43_11((uint64_t)v13);
          if (v42) {
            break;
          }
          id v43 = *v66;
          (*v66)(v41, v13, v18);
          swift_bridgeObjectRetain();
          sub_21BEA8D68();
          char v44 = MEMORY[0x21D49A5B0](v41, v36);
          uint64_t v45 = v36;
          uint64_t v46 = v63;
          v63(v45, v18);
          if (v44)
          {
            uint64_t v34 = v60;
            swift_bridgeObjectRelease();
            uint64_t v48 = (uint64_t)v59;
            v43(v59, v41, v18);
            uint64_t v47 = 0;
            uint64_t v36 = v64;
            goto LABEL_16;
          }
          v46(v41, v18);
          v39 += v67;
          --v40;
          uint64_t v36 = v64;
          if (!v40) {
            goto LABEL_13;
          }
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_13:
        __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v18);
      }
      uint64_t v34 = v60;
      swift_bridgeObjectRelease();
      uint64_t v47 = 1;
      uint64_t v48 = (uint64_t)v59;
LABEL_16:
      uint64_t v32 = v55;
      __swift_storeEnumTagSinglePayload(v48, v47, 1, v18);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_43_11(v48);
      if (!v42)
      {
        swift_bridgeObjectRelease();
        return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))*v66)(v52, v48, v18);
      }
      unint64_t v33 = v61 + 1;
      uint64_t result = sub_21BD4DAFC(v48, (uint64_t)&qword_267C658C8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
      if (v33 == v58) {
        goto LABEL_19;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v49 = (uint64_t)v51;
    sub_21BD47090();
    OUTLINED_FUNCTION_43_11(v49);
    if (v42)
    {
      sub_21BEA8DA8();
      return sub_21BD4DAFC(v49, (uint64_t)&qword_267C658C8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4D7B0);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 32))(v52, v49, v18);
    }
  }
  return result;
}

uint64_t sub_21BD49D60(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return OUTLINED_FUNCTION_45((uint64_t)sub_21BD49D78);
}

uint64_t sub_21BD49D78()
{
  id v2 = objc_msgSend(*(id *)(v0 + 32), sel_items);
  sub_21BC0BE78(0, &qword_267C65890);
  unint64_t v3 = sub_21BEAA308();

  if (v3 >> 62) {
    goto LABEL_23;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42_10();
    OUTLINED_FUNCTION_11_0();
    __asm { BRAA            X3, X16 }
  }
LABEL_3:
  uint64_t v5 = 0;
  uint64_t v31 = *MEMORY[0x263EF9DC8];
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x21D49C490](v5, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5 + 32);
    }
    OUTLINED_FUNCTION_34_16((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, v30, v31, v32);
    if (v14)
    {
      __break(1u);
LABEL_23:
      OUTLINED_FUNCTION_24_6();
      uint64_t v4 = sub_21BEAAD88();
      swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_15;
      }
      goto LABEL_3;
    }
    id v15 = objc_msgSend(v2, sel_commonKey);
    if (v15) {
      break;
    }
LABEL_14:

    ++v5;
    if (v1 == v4) {
      goto LABEL_15;
    }
  }
  uint64_t v16 = v15;
  uint64_t v17 = sub_21BEAA178();
  uint64_t v19 = v18;
  if (v17 != sub_21BEAA178() || v19 != v20)
  {
    char v22 = OUTLINED_FUNCTION_28_17();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v22) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRelease_n();

LABEL_19:
  swift_bridgeObjectRelease();
  sub_21BD4D8B4(0, &qword_267C658C0, (unint64_t *)&unk_26AAEF8C0, MEMORY[0x263F8D310]);
  *(void *)(v32 + 48) = sub_21BEA8F38();
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v32 + 56) = v25;
  *uint64_t v25 = v32;
  v25[1] = sub_21BD49FE4;
  OUTLINED_FUNCTION_26_16();
  OUTLINED_FUNCTION_11_0();
  return MEMORY[0x270F9C8E8](v26, v27);
}

uint64_t sub_21BD49FE4()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_4();
  *id v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_21BD4A0CC()
{
  OUTLINED_FUNCTION_13();

  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v1, v2);
}

uint64_t sub_21BD4A130()
{
  OUTLINED_FUNCTION_13();

  swift_release();
  OUTLINED_FUNCTION_6_0();
  return v1();
}

uint64_t sub_21BD4A194(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return OUTLINED_FUNCTION_45((uint64_t)sub_21BD4A1AC);
}

uint64_t sub_21BD4A1AC()
{
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_8();
  id v1 = objc_msgSend(*(id *)(v0 + 96), sel_items);
  sub_21BC0BE78(0, &qword_267C65890);
  unint64_t v2 = sub_21BEAA308();
  *(void *)(v0 + 104) = v2;

  if (v2 >> 62)
  {
    OUTLINED_FUNCTION_24_6();
    uint64_t v3 = sub_21BEAAD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v0 + 112) = v3;
  if (v3)
  {
    sub_21BD4D708();
    *(void *)(v0 + 120) = v4;
    sub_21BD4D8B4(0, &qword_267C658C0, (unint64_t *)&unk_26AAEF8C0, MEMORY[0x263F8D310]);
    uint64_t v5 = *MEMORY[0x263EF9DD0];
    *(void *)(v0 + 128) = v6;
    *(void *)(v0 + 136) = v5;
    uint64_t v7 = *(void *)(v0 + 104);
    if ((v7 & 0xC000000000000001) != 0) {
      id v8 = (id)MEMORY[0x21D49C490](0);
    }
    else {
      id v8 = *(id *)(v7 + 32);
    }
    *(void *)(v0 + 144) = v8;
    *(void *)(v0 + 152) = 1;
    *(void *)(v0 + 160) = sub_21BEA8F48();
    *(void *)(v0 + 168) = sub_21BEA8F38();
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_21BD4A3C4;
    OUTLINED_FUNCTION_28();
    return MEMORY[0x270F9C8F8](v20, v21, v22, v23, v24, v25, v26, v27);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_21BEA8C58();
    OUTLINED_FUNCTION_38_14(v9);
    OUTLINED_FUNCTION_28();
    return v11(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t sub_21BD4A3C4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_17_27();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 184) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_21BD4A508()
{
  OUTLINED_FUNCTION_35_0();
  id v1 = (_OWORD *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 56);
  if (!v2)
  {
    *id v1 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
LABEL_18:

    swift_bridgeObjectRelease();
    sub_21BD4DAFC(v0 + 16, (uint64_t)&qword_26AAF3A00, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_21BD4DD34);
    goto LABEL_20;
  }
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = sub_21BC3F0B0(*(id *)(v0 + 136));
    uint64_t v5 = *(void **)(v0 + 136);
    if (v6)
    {
      sub_21BC1E7C4(*(void *)(v2 + 56) + 32 * v4, v0 + 16);
    }
    else
    {
      *id v1 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
  }
  else
  {
    *id v1 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 40)) {
    goto LABEL_18;
  }
  if (swift_dynamicCast() && (uint64_t v7 = *(void *)(v0 + 72), v3))
  {
    uint64_t v8 = *(void *)(v0 + 64);
    BOOL v9 = v8 == 0x2072657470616863 && v7 == 0xEB000000006C7275;
    if (v9 || (sub_21BEAAE78() & 1) != 0 || (v8 == 1178948168 ? (BOOL v16 = v7 == 0xE400000000000000) : (BOOL v16 = 0), v16))
    {
      swift_bridgeObjectRelease();
LABEL_37:
      swift_bridgeObjectRelease();
      uint64_t v18 = *(void **)(v0 + 144);
      sub_21BEA8C38();
      swift_bridgeObjectRelease();

LABEL_38:
      OUTLINED_FUNCTION_12();
      __asm { BRAA            X1, X16 }
    }
    char v17 = sub_21BEAAE78();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_37;
    }
    uint64_t v21 = *(void **)(v0 + 144);
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
LABEL_20:
  uint64_t v10 = *(void *)(v0 + 152);
  uint64_t v11 = *(void *)(v0 + 104);
  if (v10 == *(void *)(v0 + 112))
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_21BEA8C58();
    OUTLINED_FUNCTION_38_14(v12);
    goto LABEL_38;
  }
  if ((v11 & 0xC000000000000001) != 0) {
    id v13 = (id)MEMORY[0x21D49C490](*(void *)(v0 + 152));
  }
  else {
    id v13 = *(id *)(v11 + 8 * v10 + 32);
  }
  *(void *)(v0 + 144) = v13;
  *(void *)(v0 + 152) = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0 + 160) = sub_21BEA8F48();
    *(void *)(v0 + 168) = sub_21BEA8F38();
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_21BD4A3C4;
    OUTLINED_FUNCTION_12();
  }
  return MEMORY[0x270F9C8F8]();
}

uint64_t sub_21BD4A8AC()
{
  OUTLINED_FUNCTION_13();

  OUTLINED_FUNCTION_6_0();
  return v1();
}

uint64_t sub_21BD4A908(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return OUTLINED_FUNCTION_45((uint64_t)sub_21BD4A920);
}

uint64_t sub_21BD4A920()
{
  id v2 = objc_msgSend(*(id *)(v0 + 32), sel_items);
  sub_21BC0BE78(0, &qword_267C65890);
  unint64_t v3 = sub_21BEAA308();

  if (v3 >> 62) {
    goto LABEL_23;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42_10();
    OUTLINED_FUNCTION_11_0();
    __asm { BRAA            X3, X16 }
  }
LABEL_3:
  uint64_t v5 = 0;
  uint64_t v31 = *MEMORY[0x263EF9D90];
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x21D49C490](v5, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5 + 32);
    }
    OUTLINED_FUNCTION_34_16((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, v30, v31, v32);
    if (v14)
    {
      __break(1u);
LABEL_23:
      OUTLINED_FUNCTION_24_6();
      uint64_t v4 = sub_21BEAAD88();
      swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_15;
      }
      goto LABEL_3;
    }
    id v15 = objc_msgSend(v2, sel_commonKey);
    if (v15) {
      break;
    }
LABEL_14:

    ++v5;
    if (v1 == v4) {
      goto LABEL_15;
    }
  }
  BOOL v16 = v15;
  uint64_t v17 = sub_21BEAA178();
  uint64_t v19 = v18;
  if (v17 != sub_21BEAA178() || v19 != v20)
  {
    char v22 = OUTLINED_FUNCTION_28_17();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v22) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRelease_n();

LABEL_19:
  swift_bridgeObjectRelease();
  sub_21BD4D8B4(0, &qword_267C65898, &qword_267C658A0, MEMORY[0x263F06F78]);
  *(void *)(v32 + 48) = sub_21BEA8F58();
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v32 + 56) = v25;
  *uint64_t v25 = v32;
  v25[1] = sub_21BD4AB8C;
  OUTLINED_FUNCTION_26_16();
  OUTLINED_FUNCTION_11_0();
  return MEMORY[0x270F9C8E8](v26, v27);
}

uint64_t sub_21BD4AB8C()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_4();
  *id v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_21BD4AC74()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21BD4ACA4()
{
  sub_21BD4AC74();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for PodcastsChapterController()
{
  return self;
}

uint64_t *sub_21BD4ACFC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_21BEA8C58();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    uint64_t v15 = a3[7];
    BOOL v16 = (char *)v4 + v15;
    uint64_t v17 = (char *)a2 + v15;
    unint64_t v18 = *((void *)v17 + 1);
    if (v18 >> 60 == 15)
    {
      *(_OWORD *)BOOL v16 = *(_OWORD *)v17;
    }
    else
    {
      uint64_t v19 = *(void *)v17;
      sub_21BCB1FFC(*(void *)v17, *((void *)v17 + 1));
      *(void *)BOOL v16 = v19;
      *((void *)v16 + 1) = v18;
    }
    uint64_t v20 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(uint64_t *)((char *)v4 + v20) = *(uint64_t *)((char *)a2 + v20);
  }
  return v4;
}

uint64_t sub_21BD4AED0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_21BEA8C58();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15)
  {
    uint64_t v9 = *v7;
    return sub_21BC65404(v9, v8);
  }
  return result;
}

void *sub_21BD4AFA0(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_21BEA8C58();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  unint64_t v16 = *((void *)v15 + 1);
  if (v16 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  else
  {
    uint64_t v17 = *(void *)v15;
    sub_21BCB1FFC(*(void *)v15, *((void *)v15 + 1));
    *(void *)uint64_t v14 = v17;
    *((void *)v14 + 1) = v16;
  }
  uint64_t v18 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  return a1;
}

void *sub_21BD4B124(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21BEA8C58();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)((char *)a1 + v14);
  unint64_t v16 = (void *)((char *)a2 + v14);
  unint64_t v17 = *(void *)((char *)a2 + v14 + 8);
  if (*(void *)((char *)a1 + v14 + 8) >> 60 != 15)
  {
    if (v17 >> 60 != 15)
    {
      uint64_t v19 = *v16;
      sub_21BCB1FFC(v19, v17);
      uint64_t v20 = *v15;
      unint64_t v21 = v15[1];
      *uint64_t v15 = v19;
      v15[1] = v17;
      sub_21BC65404(v20, v21);
      goto LABEL_14;
    }
    sub_21BD4B390((uint64_t)v15);
    goto LABEL_12;
  }
  if (v17 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    goto LABEL_14;
  }
  uint64_t v18 = *v16;
  sub_21BCB1FFC(v18, v17);
  *uint64_t v15 = v18;
  v15[1] = v17;
LABEL_14:
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t sub_21BD4B390(uint64_t a1)
{
  return a1;
}

_OWORD *sub_21BD4B3E4(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_21BEA8C58();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  return a1;
}

void *sub_21BD4B518(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_21BEA8C58();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v16 = a3[7];
  unint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  unint64_t v19 = *(void *)((char *)a1 + v16 + 8);
  if (v19 >> 60 != 15)
  {
    unint64_t v20 = v18[1];
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = *v17;
      uint64_t *v17 = *v18;
      v17[1] = v20;
      sub_21BC65404(v21, v19);
      goto LABEL_12;
    }
    sub_21BD4B390((uint64_t)v17);
  }
  *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
LABEL_12:
  uint64_t v22 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
  return a1;
}

uint64_t sub_21BD4B730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21BD4B744);
}

uint64_t sub_21BD4B744(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    uint64_t v9 = v8;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_21BD4B7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21BD4B810);
}

uint64_t sub_21BD4B810(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_21BD4D7B0(0, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    uint64_t v8 = v7;
    uint64_t v9 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
  }
  return result;
}

uint64_t type metadata accessor for PodcastChapter()
{
  uint64_t result = qword_267C65880;
  if (!qword_267C65880) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21BD4B908()
{
  sub_21BD4D7B0(319, &qword_26AAF36F0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_21BD4B9E8()
{
  return 0;
}

uint64_t sub_21BD4BAE4(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_21BEAAD58();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      type metadata accessor for PodcastChapter();
      uint64_t v2 = sub_21BEAA348();
      *(void *)(v2 + 16) = a1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
    }
    uint64_t v3 = type metadata accessor for PodcastChapter();
    OUTLINED_FUNCTION_15(v3);
    return v2;
  }
  return result;
}

void sub_21BD4BBA4()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v2)
  {
    sub_21BD4DD34(0, &qword_26AAF3060, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
    uint64_t v6 = (const void *)OUTLINED_FUNCTION_88_1();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_30_14((uint64_t)(v7 - 32) / 16);
  }
  uint64_t v8 = (char *)OUTLINED_FUNCTION_9_32();
  if (v1)
  {
    sub_21BD22620(v8, v9, v10);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD22C00((unint64_t)v8, v9, (unint64_t)v10);
  }
  swift_release();
}

void sub_21BD4BC74()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v2)
  {
    sub_21BD4D7B0(0, (unint64_t *)&unk_26AAEF9F0, (uint64_t (*)(uint64_t))type metadata accessor for CMTimeRange, MEMORY[0x263F8E0F8]);
    uint64_t v6 = (const void *)OUTLINED_FUNCTION_61();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_30_14((uint64_t)(v7 - 32) / 48);
  }
  uint64_t v8 = (char *)OUTLINED_FUNCTION_9_32();
  if (v1)
  {
    sub_21BD22774(v8, v9, v10);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD22D5C(v8, v9, v10);
  }
  swift_release();
}

void sub_21BD4BD54()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v2)
  {
    sub_21BD4DCB8();
    uint64_t v6 = (const void *)OUTLINED_FUNCTION_88_1();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_30_14((uint64_t)(v7 - 32) / 16);
  }
  uint64_t v8 = (char *)OUTLINED_FUNCTION_9_32();
  if (v1)
  {
    sub_21BD22620(v8, v9, v10);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD22E0C((uint64_t)v8, v9);
  }
  swift_release();
}

void sub_21BD4BE00()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4) {
        goto LABEL_19;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_44();
  if (v2)
  {
    sub_21BD4D7B0(0, &qword_267C65910, MEMORY[0x263F5E920], MEMORY[0x263F8E0F8]);
    uint64_t v6 = sub_21BEA9888();
    OUTLINED_FUNCTION_1_0(v6);
    uint64_t v8 = *(void *)(v7 + 72);
    uint64_t v9 = (const void *)OUTLINED_FUNCTION_17();
    _swift_stdlib_malloc_size(v9);
    if (v8)
    {
      OUTLINED_FUNCTION_42_8();
      BOOL v11 = v11 && v8 == -1;
      if (!v11)
      {
        OUTLINED_FUNCTION_30_14(v10 / v8);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
LABEL_13:
  uint64_t v12 = sub_21BEA9888();
  OUTLINED_FUNCTION_15(v12);
  uint64_t v14 = OUTLINED_FUNCTION_19_21(*(unsigned __int8 *)(v13 + 80));
  if (v1)
  {
    sub_21BD22870(v14, v15, v16);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD22EEC(v14, v15, v16);
  }
  swift_release();
}

void sub_21BD4BF30()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v2)
  {
    sub_21BD4D7B0(0, &qword_267C65918, (uint64_t (*)(uint64_t))sub_21BC38934, MEMORY[0x263F8E0F8]);
    uint64_t v6 = (const void *)OUTLINED_FUNCTION_61();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_30_14((uint64_t)(v7 - 32) / 24);
  }
  uint64_t v8 = (char *)OUTLINED_FUNCTION_9_32();
  if (v1)
  {
    sub_21BD22A18(v8, v9, v10);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD23010((uint64_t)v8, v9);
  }
  swift_release();
}

void sub_21BD4C010()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4) {
        goto LABEL_19;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_44();
  if (v2)
  {
    sub_21BD4D7B0(0, (unint64_t *)&unk_267C65408, (uint64_t (*)(uint64_t))type metadata accessor for PodcastChapter, MEMORY[0x263F8E0F8]);
    uint64_t v6 = type metadata accessor for PodcastChapter();
    OUTLINED_FUNCTION_1_0(v6);
    uint64_t v8 = *(void *)(v7 + 72);
    uint64_t v9 = (const void *)OUTLINED_FUNCTION_17();
    _swift_stdlib_malloc_size(v9);
    if (v8)
    {
      OUTLINED_FUNCTION_42_8();
      BOOL v11 = v11 && v8 == -1;
      if (!v11)
      {
        OUTLINED_FUNCTION_30_14(v10 / v8);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
LABEL_13:
  uint64_t v12 = type metadata accessor for PodcastChapter();
  OUTLINED_FUNCTION_15(v12);
  uint64_t v14 = OUTLINED_FUNCTION_19_21(*(unsigned __int8 *)(v13 + 80));
  if (v1)
  {
    sub_21BD22A7C(v14, v15, v16);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD230D0(v14, v15, v16);
  }
  swift_release();
}

void sub_21BD4C140()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v2)
  {
    sub_21BD4DD34(0, (unint64_t *)&qword_26AAF3910, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
    uint64_t v6 = (const void *)OUTLINED_FUNCTION_88_1();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_30_14((uint64_t)(v7 - 32) / 32);
  }
  uint64_t v8 = (char *)OUTLINED_FUNCTION_9_32();
  if (v1)
  {
    sub_21BD22A94(v8, v9, v10);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD230E8((unint64_t)v8, v9, (unint64_t)v10);
  }
  swift_release();
}

void sub_21BD4C214()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v2)
  {
    sub_21BD4DD34(0, &qword_26AAEF9E8, MEMORY[0x263F8D538], MEMORY[0x263F8E0F8]);
    uint64_t v6 = (const void *)OUTLINED_FUNCTION_88_1();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_30_14((uint64_t)(v7 - 32) / 8);
  }
  uint64_t v8 = (char *)OUTLINED_FUNCTION_9_32();
  if (v1)
  {
    sub_21BD22718(v8, v9, v10);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD22CB0(v8, v9, v10);
  }
  swift_release();
}

void sub_21BD4C2E4()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4) {
        goto LABEL_19;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_44();
  if (v2)
  {
    sub_21BD4D7B0(0, &qword_267C65920, MEMORY[0x263F5E7D8], MEMORY[0x263F8E0F8]);
    uint64_t v6 = sub_21BEA9358();
    OUTLINED_FUNCTION_1_0(v6);
    uint64_t v8 = *(void *)(v7 + 72);
    uint64_t v9 = (const void *)OUTLINED_FUNCTION_17();
    _swift_stdlib_malloc_size(v9);
    if (v8)
    {
      OUTLINED_FUNCTION_42_8();
      BOOL v11 = v11 && v8 == -1;
      if (!v11)
      {
        OUTLINED_FUNCTION_30_14(v10 / v8);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
LABEL_13:
  uint64_t v12 = sub_21BEA9358();
  OUTLINED_FUNCTION_15(v12);
  uint64_t v14 = OUTLINED_FUNCTION_19_21(*(unsigned __int8 *)(v13 + 80));
  if (v1)
  {
    sub_21BD22BE8(v14, v15, v16);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD2326C(v14, v15, v16);
  }
  swift_release();
}

void sub_21BD4C414()
{
  OUTLINED_FUNCTION_29_0();
  if (v3)
  {
    OUTLINED_FUNCTION_10_23();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_25_16();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_26();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v2)
  {
    sub_21BD4D7B0(0, &qword_267C65478, (uint64_t (*)(uint64_t))sub_21BCDAEC4, MEMORY[0x263F8E0F8]);
    uint64_t v6 = (const void *)OUTLINED_FUNCTION_61();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_30_14((uint64_t)(v7 - 32) / 40);
  }
  uint64_t v8 = (char *)OUTLINED_FUNCTION_9_32();
  if (v1)
  {
    sub_21BD22AF0(v8, v9, v10);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_21BD2319C((uint64_t)v8, v9);
  }
  swift_release();
}

uint64_t sub_21BD4C4F4()
{
  return sub_21BEAA128() & 1;
}

void sub_21BD4C584(uint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for PodcastChapter() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_21BD4DC50();
    uint64_t v3 = v4;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v5;
  sub_21BD4C62C(v6);
  *a1 = v3;
}

void sub_21BD4C62C(uint64_t *a1)
{
  uint64_t v144 = type metadata accessor for PodcastChapter();
  uint64_t v138 = *(void *)(v144 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v144, v3, v4);
  uint64_t v135 = (uint64_t)&v130 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v5, v7, v8);
  uint64_t v145 = (uint64_t)&v130 - v10;
  uint64_t v13 = MEMORY[0x270FA5388](v9, v11, v12);
  uint64_t v142 = (uint64_t)&v130 - v14;
  MEMORY[0x270FA5388](v13, v15, v16);
  uint64_t v141 = (uint64_t)&v130 - v17;
  uint64_t v18 = a1[1];
  uint64_t v19 = sub_21BEAAE08();
  if (v19 >= v18)
  {
    if ((v18 & 0x8000000000000000) == 0)
    {
      if (v18) {
        sub_21BD4CF64(0, v18, 1, a1);
      }
      return;
    }
LABEL_140:
    __break(1u);
    goto LABEL_141;
  }
  uint64_t v20 = v19;
  uint64_t v139 = v1;
  id v143 = a1;
  uint64_t v131 = sub_21BD4BAE4(v18 / 2);
  unint64_t v137 = v21;
  if (v18 > 0)
  {
    uint64_t v130 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = (char *)MEMORY[0x263F8EE78];
    uint64_t v24 = v18;
    uint64_t v133 = v18;
    while (1)
    {
      uint64_t v25 = v22;
      uint64_t v26 = v22 + 1;
      if (v22 + 1 >= v24)
      {
        ++v22;
        uint64_t v27 = v143;
      }
      else
      {
        uint64_t v27 = v143;
        uint64_t v28 = *v143;
        uint64_t v29 = *(void *)(v138 + 72);
        uint64_t v30 = v141;
        sub_21BCB1860(*v143 + v29 * v26, v141);
        uint64_t v31 = v28 + v29 * v22;
        uint64_t v32 = v142;
        sub_21BCB1860(v31, v142);
        uint64_t v33 = *(int *)(v144 + 36);
        double v34 = *(double *)(v30 + v33);
        double v35 = *(double *)(v32 + v33);
        sub_21BD4DAA0(v32);
        sub_21BD4DAA0(v30);
        uint64_t v22 = v25 + 2;
        uint64_t v140 = v28;
        uint64_t v146 = v29;
        if (v25 + 2 < v24)
        {
          uint64_t v136 = v25;
          uint64_t v132 = v23;
          uint64_t v36 = v29 * v26;
          uint64_t v37 = v28;
          uint64_t v38 = v25 + 2;
          uint64_t v39 = v29 * (v25 + 2);
          while (1)
          {
            uint64_t v40 = v141;
            sub_21BCB1860(v37 + v39, v141);
            uint64_t v41 = v142;
            sub_21BCB1860(v37 + v36, v142);
            BOOL v42 = *(double *)(v40 + *(int *)(v144 + 36)) >= *(double *)(v41 + *(int *)(v144 + 36));
            sub_21BD4DAA0(v41);
            sub_21BD4DAA0(v40);
            if (v34 < v35 == v42) {
              break;
            }
            v37 += v146;
            if (++v38 >= v24)
            {
              uint64_t v22 = v24;
              uint64_t v23 = v132;
              uint64_t v27 = v143;
              goto LABEL_12;
            }
          }
          uint64_t v23 = v132;
          uint64_t v27 = v143;
          uint64_t v22 = v38;
LABEL_12:
          uint64_t v25 = v136;
        }
        if (v34 < v35)
        {
          if (v22 < v25) {
            goto LABEL_142;
          }
          if (v25 < v22)
          {
            uint64_t v134 = v24;
            uint64_t v132 = v23;
            uint64_t v43 = 0;
            uint64_t v44 = v146;
            uint64_t v45 = v146 * (v22 - 1);
            uint64_t v46 = v22 * v146;
            uint64_t v47 = v25;
            uint64_t v136 = v25;
            uint64_t v48 = v25 * v146;
            do
            {
              if (v47 != v22 + v43 - 1)
              {
                uint64_t v49 = v140;
                if (!v140) {
                  goto LABEL_148;
                }
                uint64_t v50 = v22;
                unint64_t v51 = v140 + v48;
                uint64_t v52 = v140 + v45;
                sub_21BCB1540(v140 + v48, v135);
                if (v48 < v45 || v51 >= v49 + v46)
                {
                  swift_arrayInitWithTakeFrontToBack();
                  uint64_t v44 = v146;
                }
                else
                {
                  uint64_t v44 = v146;
                  if (v48 != v45) {
                    swift_arrayInitWithTakeBackToFront();
                  }
                }
                sub_21BCB1540(v135, v52);
                uint64_t v27 = v143;
                uint64_t v22 = v50;
              }
              ++v47;
              --v43;
              v45 -= v44;
              v46 -= v44;
              v48 += v44;
            }
            while (v47 < v22 + v43);
            uint64_t v23 = v132;
            uint64_t v25 = v136;
            uint64_t v24 = v134;
          }
        }
      }
      if (v22 < v24)
      {
        if (__OFSUB__(v22, v25)) {
          goto LABEL_139;
        }
        if (v22 - v25 < v130)
        {
          if (__OFADD__(v25, v130)) {
            goto LABEL_143;
          }
          if (v25 + v130 >= v24) {
            uint64_t v54 = v24;
          }
          else {
            uint64_t v54 = v25 + v130;
          }
          if (v54 < v25)
          {
LABEL_144:
            __break(1u);
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
            return;
          }
          if (v22 != v54)
          {
            uint64_t v136 = v25;
            uint64_t v132 = v23;
            uint64_t v55 = *(void *)(v138 + 72);
            uint64_t v146 = v55 * (v22 - 1);
            uint64_t v140 = v55;
            uint64_t v56 = v22 * v55;
            uint64_t v134 = v54;
            do
            {
              uint64_t v57 = 0;
              uint64_t v58 = v136;
              while (1)
              {
                uint64_t v59 = v22;
                uint64_t v60 = *v27;
                uint64_t v61 = v141;
                sub_21BCB1860(v56 + v57 + *v27, v141);
                uint64_t v62 = v146 + v57 + v60;
                uint64_t v63 = v142;
                sub_21BCB1860(v62, v142);
                uint64_t v64 = *(int *)(v144 + 36);
                double v65 = *(double *)(v61 + v64);
                double v66 = *(double *)(v63 + v64);
                sub_21BD4DAA0(v63);
                sub_21BD4DAA0(v61);
                if (v65 >= v66) {
                  break;
                }
                uint64_t v67 = *v27;
                if (!*v27) {
                  goto LABEL_146;
                }
                uint64_t v68 = v67 + v146 + v57;
                sub_21BCB1540(v67 + v56 + v57, v145);
                swift_arrayInitWithTakeFrontToBack();
                sub_21BCB1540(v145, v68);
                v57 -= v140;
                ++v58;
                uint64_t v22 = v59;
                uint64_t v27 = v143;
                if (v59 == v58) {
                  goto LABEL_46;
                }
              }
              uint64_t v22 = v59;
LABEL_46:
              ++v22;
              v146 += v140;
              v56 += v140;
            }
            while (v22 != v134);
            uint64_t v22 = v134;
            uint64_t v23 = v132;
            uint64_t v25 = v136;
          }
        }
      }
      if (v22 < v25) {
        goto LABEL_138;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v23 = sub_21BD4D5D0(0, *((void *)v23 + 2) + 1, 1, v23);
      }
      unint64_t v70 = *((void *)v23 + 2);
      unint64_t v69 = *((void *)v23 + 3);
      unint64_t v71 = v70 + 1;
      if (v70 >= v69 >> 1) {
        uint64_t v23 = sub_21BD4D5D0((char *)(v69 > 1), v70 + 1, 1, v23);
      }
      *((void *)v23 + 2) = v71;
      uint64_t v72 = v23 + 32;
      uint64_t v73 = &v23[16 * v70 + 32];
      *(void *)uint64_t v73 = v25;
      *((void *)v73 + 1) = v22;
      if (v70)
      {
        while (1)
        {
          unint64_t v74 = v71 - 1;
          if (v71 >= 4)
          {
            uint64_t v79 = &v72[16 * v71];
            uint64_t v80 = *((void *)v79 - 8);
            uint64_t v81 = *((void *)v79 - 7);
            BOOL v85 = __OFSUB__(v81, v80);
            uint64_t v82 = v81 - v80;
            if (v85) {
              goto LABEL_123;
            }
            uint64_t v84 = *((void *)v79 - 6);
            uint64_t v83 = *((void *)v79 - 5);
            BOOL v85 = __OFSUB__(v83, v84);
            uint64_t v77 = v83 - v84;
            char v78 = v85;
            if (v85) {
              goto LABEL_124;
            }
            unint64_t v86 = v71 - 2;
            id v87 = &v72[16 * v71 - 32];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v85 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v85) {
              goto LABEL_125;
            }
            BOOL v85 = __OFADD__(v77, v90);
            uint64_t v91 = v77 + v90;
            if (v85) {
              goto LABEL_127;
            }
            if (v91 >= v82)
            {
              id v109 = &v72[16 * v74];
              uint64_t v111 = *(void *)v109;
              uint64_t v110 = *((void *)v109 + 1);
              BOOL v85 = __OFSUB__(v110, v111);
              uint64_t v112 = v110 - v111;
              if (v85) {
                goto LABEL_133;
              }
              BOOL v102 = v77 < v112;
              goto LABEL_85;
            }
          }
          else
          {
            if (v71 != 3)
            {
              uint64_t v103 = *((void *)v23 + 4);
              uint64_t v104 = *((void *)v23 + 5);
              BOOL v85 = __OFSUB__(v104, v103);
              uint64_t v96 = v104 - v103;
              char v97 = v85;
              goto LABEL_79;
            }
            uint64_t v76 = *((void *)v23 + 4);
            uint64_t v75 = *((void *)v23 + 5);
            BOOL v85 = __OFSUB__(v75, v76);
            uint64_t v77 = v75 - v76;
            char v78 = v85;
          }
          if (v78) {
            goto LABEL_126;
          }
          unint64_t v86 = v71 - 2;
          uint64_t v92 = &v72[16 * v71 - 32];
          uint64_t v94 = *(void *)v92;
          uint64_t v93 = *((void *)v92 + 1);
          BOOL v95 = __OFSUB__(v93, v94);
          uint64_t v96 = v93 - v94;
          char v97 = v95;
          if (v95) {
            goto LABEL_128;
          }
          id v98 = &v72[16 * v74];
          uint64_t v100 = *(void *)v98;
          uint64_t v99 = *((void *)v98 + 1);
          BOOL v85 = __OFSUB__(v99, v100);
          uint64_t v101 = v99 - v100;
          if (v85) {
            goto LABEL_130;
          }
          if (__OFADD__(v96, v101)) {
            goto LABEL_132;
          }
          if (v96 + v101 >= v77)
          {
            BOOL v102 = v77 < v101;
LABEL_85:
            if (v102) {
              unint64_t v74 = v86;
            }
            goto LABEL_87;
          }
LABEL_79:
          if (v97) {
            goto LABEL_129;
          }
          uint64_t v105 = &v72[16 * v74];
          uint64_t v107 = *(void *)v105;
          uint64_t v106 = *((void *)v105 + 1);
          BOOL v85 = __OFSUB__(v106, v107);
          uint64_t v108 = v106 - v107;
          if (v85) {
            goto LABEL_131;
          }
          if (v108 < v96) {
            goto LABEL_96;
          }
LABEL_87:
          unint64_t v113 = v74 - 1;
          if (v74 - 1 >= v71)
          {
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
            goto LABEL_134;
          }
          if (!*v143) {
            goto LABEL_147;
          }
          uint64_t v114 = v22;
          uint64_t v115 = v23;
          uint64_t v116 = &v72[16 * v113];
          uint64_t v117 = *(void *)v116;
          uint64_t v118 = &v72[16 * v74];
          uint64_t v119 = *((void *)v118 + 1);
          uint64_t v120 = v139;
          sub_21BD4D1B0(*v143 + *(void *)(v138 + 72) * *(void *)v116, *v143 + *(void *)(v138 + 72) * *(void *)v118, *v143 + *(void *)(v138 + 72) * v119, v137);
          uint64_t v139 = v120;
          if (v120)
          {
            uint64_t v18 = v133;
LABEL_102:
            swift_bridgeObjectRelease();
            if (v18 >= -1)
            {
              *(void *)(v131 + 16) = 0;
              swift_bridgeObjectRelease();
              return;
            }
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
            goto LABEL_144;
          }
          if (v119 < v117) {
            goto LABEL_120;
          }
          if (v74 > *((void *)v115 + 2)) {
            goto LABEL_121;
          }
          *(void *)uint64_t v116 = v117;
          *(void *)&v72[16 * v113 + 8] = v119;
          unint64_t v121 = *((void *)v115 + 2);
          if (v74 >= v121) {
            goto LABEL_122;
          }
          uint64_t v23 = v115;
          unint64_t v71 = v121 - 1;
          memmove(&v72[16 * v74], v118 + 16, 16 * (v121 - 1 - v74));
          *((void *)v115 + 2) = v121 - 1;
          uint64_t v22 = v114;
          if (v121 <= 2) {
            goto LABEL_96;
          }
        }
      }
      unint64_t v71 = 1;
LABEL_96:
      uint64_t v24 = v143[1];
      uint64_t v18 = v133;
      if (v22 >= v24) {
        goto LABEL_105;
      }
    }
  }
  uint64_t v23 = (char *)MEMORY[0x263F8EE78];
  unint64_t v71 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_105:
  if (v71 >= 2)
  {
    uint64_t v122 = *v143;
    while (1)
    {
      unint64_t v123 = v71 - 2;
      if (v71 < 2) {
        break;
      }
      if (!v122) {
        goto LABEL_149;
      }
      uint64_t v124 = v23;
      uint64_t v125 = *(void *)&v23[16 * v123 + 32];
      uint64_t v126 = *(void *)&v23[16 * v71 + 24];
      uint64_t v127 = v139;
      sub_21BD4D1B0(v122 + *(void *)(v138 + 72) * v125, v122 + *(void *)(v138 + 72) * *(void *)&v23[16 * v71 + 16], v122 + *(void *)(v138 + 72) * v126, v137);
      uint64_t v139 = v127;
      if (v127) {
        goto LABEL_102;
      }
      if (v126 < v125) {
        goto LABEL_135;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v124 = sub_21BD4D6F4((uint64_t)v23);
      }
      if (v123 >= *((void *)v124 + 2)) {
        goto LABEL_136;
      }
      uint64_t v128 = &v124[16 * v123 + 32];
      *(void *)uint64_t v128 = v125;
      *((void *)v128 + 1) = v126;
      unint64_t v129 = *((void *)v124 + 2);
      if (v71 > v129) {
        goto LABEL_137;
      }
      memmove(&v124[16 * v71 + 16], &v124[16 * v71 + 32], 16 * (v129 - v71));
      *((void *)v124 + 2) = v129 - 1;
      unint64_t v71 = v129 - 1;
      uint64_t v23 = v124;
      if (v129 <= 2) {
        goto LABEL_116;
      }
    }
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
    goto LABEL_140;
  }
LABEL_116:
  swift_bridgeObjectRelease();
  if (v18 < -1) {
    goto LABEL_145;
  }
  *(void *)(v131 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_21BD4CF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v33 = a1;
  uint64_t v36 = type metadata accessor for PodcastChapter();
  uint64_t v9 = MEMORY[0x270FA5388](v36, v7, v8);
  uint64_t v37 = (uint64_t)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v9, v11, v12);
  uint64_t v15 = (char *)&v31 - v14;
  uint64_t result = MEMORY[0x270FA5388](v13, v16, v17);
  unint64_t v21 = (char *)&v31 - v20;
  uint64_t v35 = a3;
  uint64_t v32 = a2;
  if (a3 != a2)
  {
    uint64_t v22 = *(void *)(v19 + 72);
    uint64_t v39 = v22 * (v35 - 1);
    uint64_t v34 = v22;
    uint64_t v38 = v22 * v35;
    while (2)
    {
      uint64_t v23 = 0;
      uint64_t v24 = v33;
      do
      {
        uint64_t v25 = *a4;
        sub_21BCB1860(v38 + v23 + *a4, (uint64_t)v21);
        sub_21BCB1860(v39 + v23 + v25, (uint64_t)v15);
        uint64_t v26 = *(int *)(v36 + 36);
        double v27 = *(double *)&v21[v26];
        double v28 = *(double *)&v15[v26];
        sub_21BD4DAA0((uint64_t)v15);
        uint64_t result = sub_21BD4DAA0((uint64_t)v21);
        if (v27 >= v28) {
          break;
        }
        uint64_t v29 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        uint64_t v30 = v29 + v39 + v23;
        sub_21BCB1540(v29 + v38 + v23, v37);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = sub_21BCB1540(v37, v30);
        v23 -= v34;
        ++v24;
      }
      while (v35 != v24);
      v39 += v34;
      v38 += v34;
      if (++v35 != v32) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_21BD4D1B0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v60 = a3;
  uint64_t v65 = type metadata accessor for PodcastChapter();
  uint64_t v9 = MEMORY[0x270FA5388](v65, v7, v8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12, v13);
  uint64_t v15 = (char *)&v59 - v14;
  uint64_t v17 = *(void *)(v16 + 72);
  if (!v17)
  {
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  int64_t v18 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_76;
  }
  int64_t v20 = v60 - a2;
  if (v60 - a2 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_77;
  }
  unint64_t v64 = a4;
  uint64_t v22 = v18 / v17;
  uint64_t v23 = v17;
  uint64_t v24 = v20 / v17;
  if (v18 / v17 >= v20 / v17)
  {
    unint64_t v27 = v64;
    sub_21BD22A7C(a2, v20 / v17, v64);
    unint64_t v28 = v27 + v24 * v23;
    BOOL v40 = v24 * v23 < 1 || a1 >= a2;
    uint64_t v31 = v23;
    if (v40) {
      goto LABEL_70;
    }
    uint64_t v62 = -v23;
    uint64_t v63 = v11;
    unint64_t v41 = v60;
    uint64_t v61 = v23;
    while (1)
    {
      uint64_t v42 = v62;
      unint64_t v43 = v41 + v62;
      unint64_t v44 = v28 + v62;
      unint64_t v45 = v28;
      sub_21BCB1860(v28 + v62, (uint64_t)v15);
      unint64_t v46 = a2 + v42;
      uint64_t v47 = a2 + v42;
      uint64_t v48 = (uint64_t)v15;
      uint64_t v49 = (uint64_t)v63;
      sub_21BCB1860(v47, (uint64_t)v63);
      uint64_t v50 = *(int *)(v65 + 36);
      double v51 = *(double *)(v48 + v50);
      double v52 = *(double *)(v49 + v50);
      uint64_t v53 = v49;
      uint64_t v15 = (char *)v48;
      sub_21BD4DAA0(v53);
      sub_21BD4DAA0(v48);
      if (v51 < v52) {
        break;
      }
      if (v41 < v45 || v43 >= v45)
      {
        swift_arrayInitWithTakeFrontToBack();
        unint64_t v28 = v44;
        unint64_t v27 = v64;
LABEL_65:
        uint64_t v31 = v61;
        unint64_t v41 = v43;
        goto LABEL_66;
      }
      unint64_t v27 = v64;
      if (v41 == v45)
      {
        unint64_t v28 = v44;
        goto LABEL_65;
      }
      unint64_t v41 = v43;
      swift_arrayInitWithTakeBackToFront();
      unint64_t v28 = v44;
      uint64_t v31 = v61;
LABEL_66:
      if (v28 <= v27 || a2 <= a1) {
        goto LABEL_70;
      }
    }
    unint64_t v60 = v45;
    if (v41 < a2 || v43 >= a2)
    {
      swift_arrayInitWithTakeFrontToBack();
      a2 = v46;
      unint64_t v27 = v64;
      uint64_t v31 = v61;
    }
    else
    {
      uint64_t v31 = v61;
      if (v41 != a2)
      {
        unint64_t v41 = v43;
        swift_arrayInitWithTakeBackToFront();
        a2 = v46;
        unint64_t v27 = v64;
LABEL_63:
        unint64_t v28 = v60;
        goto LABEL_66;
      }
      a2 = v46;
      unint64_t v27 = v64;
    }
    unint64_t v41 = v43;
    goto LABEL_63;
  }
  unint64_t v25 = v64;
  sub_21BD22A7C(a1, v18 / v17, v64);
  uint64_t v26 = v22 * v23;
  unint64_t v27 = v25;
  unint64_t v28 = v25 + v26;
  unint64_t v29 = v60;
  BOOL v30 = v26 < 1 || a2 >= v60;
  uint64_t v31 = v23;
  if (!v30)
  {
    do
    {
      unint64_t v32 = v28;
      sub_21BCB1860(a2, (uint64_t)v15);
      sub_21BCB1860(v27, (uint64_t)v11);
      uint64_t v33 = *(int *)(v65 + 36);
      double v34 = *(double *)&v15[v33];
      double v35 = *(double *)&v11[v33];
      sub_21BD4DAA0((uint64_t)v11);
      sub_21BD4DAA0((uint64_t)v15);
      if (v34 >= v35)
      {
        if (a1 < v27 || a1 >= v27 + v31)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != v27)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        unint64_t v36 = a2;
        v27 += v31;
        unint64_t v29 = v60;
      }
      else
      {
        unint64_t v36 = a2 + v31;
        if (a1 < a2 || a1 >= v36)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a2)
        {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v28 = v32;
      a1 += v31;
      BOOL v39 = v27 >= v32 || v36 >= v29;
      a2 = v36;
    }
    while (!v39);
  }
  a2 = a1;
LABEL_70:
  int64_t v57 = v28 - v27;
  if (v31 != -1 || v57 != 0x8000000000000000)
  {
    sub_21BD22A7C(v27, v57 / v31, a2);
    return;
  }
LABEL_78:
  __break(1u);
}

char *sub_21BD4D5D0(char *result, int64_t a2, char a3, char *a4)
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
    sub_21BD4D7B0(0, &qword_267C65900, (uint64_t (*)(uint64_t))sub_21BD4DC64, MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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

char *sub_21BD4D6F4(uint64_t a1)
{
  return sub_21BD4D5D0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_21BD4D708()
{
  if (!qword_267C658A8)
  {
    sub_21BC0BE78(255, &qword_267C65890);
    sub_21BD4D7B0(255, &qword_267C658B0, (uint64_t (*)(uint64_t))sub_21BD4D814, MEMORY[0x263F8D8F0]);
    unint64_t v0 = sub_21BEA8F08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C658A8);
    }
  }
}

void sub_21BD4D7B0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_21BD4D814()
{
  if (!qword_267C658B8)
  {
    type metadata accessor for AVMetadataExtraAttributeKey(255);
    sub_21BD4D978(&qword_267C63058, type metadata accessor for AVMetadataExtraAttributeKey);
    unint64_t v0 = sub_21BEAA0E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C658B8);
    }
  }
}

void sub_21BD4D8B4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_21BC0BE78(255, &qword_267C65890);
    sub_21BD4DD34(255, a3, a4, MEMORY[0x263F8D8F0]);
    unint64_t v7 = sub_21BEA8F08();
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_21BD4D958()
{
  return sub_21BD4C4F4() & 1;
}

uint64_t sub_21BD4D978(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_21BD4D9C0()
{
  if (!qword_267C658D8)
  {
    type metadata accessor for PodcastChapter();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267C658D8);
    }
  }
}

uint64_t sub_21BD4DA28(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21BCB1FFC(a1, a2);
  }
  return a1;
}

uint64_t sub_21BD4DA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PodcastChapter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21BD4DAA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PodcastChapter();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21BD4DAFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

unint64_t sub_21BD4DB5C()
{
  unint64_t result = qword_267C658E0;
  if (!qword_267C658E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C658E0);
  }
  return result;
}

void sub_21BD4DBA8()
{
  if (!qword_267C658E8)
  {
    sub_21BC0BE78(255, (unint64_t *)&qword_267C64DD8);
    sub_21BD4D7B0(255, &qword_267C658F0, MEMORY[0x263F07690], MEMORY[0x263F8D488]);
    unint64_t v0 = sub_21BEA8F08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C658E8);
    }
  }
}

void sub_21BD4DC50()
{
}

void sub_21BD4DC64()
{
  if (!qword_267C65908)
  {
    unint64_t v0 = sub_21BEAA5E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267C65908);
    }
  }
}

void sub_21BD4DCB8()
{
  if (!qword_26AAEF9D8)
  {
    sub_21BD4DD34(255, (unint64_t *)&unk_26AAEF8C0, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
    unint64_t v0 = sub_21BEAAE28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AAEF9D8);
    }
  }
}

void sub_21BD4DD34(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for PodcastsChapterController.Error(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x21BD4DE1CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PodcastsChapterController.Error()
{
  return &type metadata for PodcastsChapterController.Error;
}

unint64_t sub_21BD4DE58()
{
  unint64_t result = qword_267C65928;
  if (!qword_267C65928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C65928);
  }
  return result;
}

void sub_21BD4E094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21BD4E758(_Unwind_Exception *exception_object)
{
}

void sub_21BD4E8CC(_Unwind_Exception *exception_object)
{
}

void _MPCAudioTapProcess(const opaqueMTAudioProcessingTap *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  MTAudioProcessingTapGetStorage(a1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 _analyzeSamples:a5 numberFrames:a3];
}

void _MPCAudioTapPrepareCallback(const opaqueMTAudioProcessingTap *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MTAudioProcessingTapGetStorage(a1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 _prepareTap:a1 maxFrames:a3 processingFormat:a4];
}

void _MPCAudioTapFinalize(const opaqueMTAudioProcessingTap *a1)
{
  MTAudioProcessingTapGetStorage(a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setSelfRef:0];
}

void _MPCAudioTapInit(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = a2;
}

void sub_21BD4ED24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21BD4EDE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21BD51690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoItemReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_45;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_47:
        *(unsigned char *)(a1 + 20) = v26 != 0;
      }
      else if (v17 == 2)
      {
        BOOL v30 = objc_alloc_init(_MPCProtoItemIdentifierSet);
        objc_storeStrong((id *)(a1 + 8), v30);
        if (!PBReaderPlaceMark() || (_MPCProtoItemIdentifierSetReadFrom((uint64_t)v30, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_41;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_43:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BD5D4C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21BD5EDE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21BD5F0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BD5FF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MPCMediaLibraryForUniqueID(uint64_t a1)
{
  return [MEMORY[0x263F11E40] mediaLibraryWithUniqueIdentifier:a1];
}

void sub_21BD62F58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21BD63694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BD640A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__603(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__604(uint64_t a1)
{
}

void sub_21BD64C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__767(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__768(uint64_t a1)
{
}

void sub_21BD65268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21BD652F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21BD665C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21BD670F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21BD6A024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21BD6A32C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21BD6CE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BD6E3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BD6FE28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void sub_21BD704E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 168));
  _Unwind_Resume(a1);
}

void sub_21BD711FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BD788A0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x820], 8);
  _Block_object_dispose(&STACK[0x860], 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose(&STACK[0x530], 8);
  _Block_object_dispose(&STACK[0x560], 8);
  _Block_object_dispose(&STACK[0x580], 8);
  _Block_object_dispose(&STACK[0x5B0], 8);
  _Block_object_dispose(&STACK[0x620], 8);
  _Block_object_dispose(&STACK[0x6D8], 8);
  _Unwind_Resume(a1);
}

void sub_21BD79484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21BD7C580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

BOOL _MPCProtoTracklistIndexPathReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            char v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__containerIndex;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            uint64_t v19 = 0;
            char v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__containerIndex;
            goto LABEL_41;
          }
        }
        char v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__containerIndex;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_41:
        *(void *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 24) |= 2u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        char v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__itemIndex;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        uint64_t v19 = 0;
        char v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__itemIndex;
        goto LABEL_41;
      }
    }
    char v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__itemIndex;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BD7E090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 176), 8);
  _Block_object_dispose((const void *)(v16 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1215(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1216(uint64_t a1)
{
}

void sub_21BD85BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1433(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1434(uint64_t a1)
{
}

id _MPCDescribePS(uint64_t a1)
{
  return +[_MPCPlaybackEnginePlayer describePlayer:a1];
}

id _MPCSPIRCopyFailedStoreIDs()
{
  os_unfair_lock_lock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);
  unint64_t v0 = (void *)[(id)__failedStoreIDs copy];
  uint64_t v1 = v0;
  if (v0)
  {
    id v2 = v0;
  }
  else
  {
    id v2 = [MEMORY[0x263EFFA08] set];
  }
  int v3 = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);

  return v3;
}

void sub_21BD97754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1855(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1856(uint64_t a1)
{
}

void _MPCSPIRAddFailedStoreIDs(void *a1)
{
  id v4 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);
  uint64_t v1 = (void *)__failedStoreIDs;
  if (!__failedStoreIDs)
  {
    uint64_t v2 = [MEMORY[0x263EFF9C0] set];
    int v3 = (void *)__failedStoreIDs;
    __failedStoreIDs = v2;

    uint64_t v1 = (void *)__failedStoreIDs;
  }
  [v1 addObjectsFromArray:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);
}

void sub_21BD98ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BD994D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

BOOL _MPCProtoRadioContentReferenceReadFrom(id *a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryAlbumContentReference);
        objc_storeStrong(a1 + 1, v17);
        if (PBReaderPlaceMark()
          && (_MPCProtoRadioContentReferenceLibraryAlbumContentReferenceReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_32;
        }
        goto LABEL_35;
      case 2u:
        uint64_t v17 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryArtistContentReference);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark()
          || (_MPCProtoRadioContentReferenceLibraryArtistContentReferenceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_35;
        }
        goto LABEL_32;
      case 3u:
        uint64_t v17 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryItemContentReference);
        objc_storeStrong(a1 + 3, v17);
        if (!PBReaderPlaceMark()
          || (_MPCProtoRadioContentReferenceLibraryItemContentReferenceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_35;
        }
        goto LABEL_32;
      case 4u:
        uint64_t v17 = objc_alloc_init(_MPCProtoRadioContentReferenceStoreContentReference);
        objc_storeStrong(a1 + 4, v17);
        if (PBReaderPlaceMark()
          && (_MPCProtoRadioContentReferenceStoreContentReferenceReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_32:
          PBReaderRecallMark();

LABEL_33:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_35:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_33;
    }
  }
}

void sub_21BD9C548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__2076(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2077(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__2298(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2299(uint64_t a1)
{
}

void sub_21BD9D404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BD9FD40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoItemIdentifierSetReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_60;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_62;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_62:
          uint64_t v47 = 16;
          goto LABEL_79;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_58;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 8u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_66:
          uint64_t v47 = 32;
          goto LABEL_79;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 0x10u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_70:
          uint64_t v47 = 40;
          goto LABEL_79;
        case 5u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 1u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_74:
          uint64_t v47 = 8;
          goto LABEL_79;
        case 6u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 4u;
          break;
        case 7u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 48;
LABEL_58:
          unint64_t v46 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v43 = *v3;
        unint64_t v44 = *(void *)(a2 + v43);
        if (v44 == -1 || v44 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
        *(void *)(a2 + v43) = v44 + 1;
        v19 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0) {
          goto LABEL_76;
        }
        v41 += 7;
        BOOL v14 = v42++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_78;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_76:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_78:
      uint64_t v47 = 24;
LABEL_79:
      *(void *)(a1 + v47) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BDA295C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_21BDA8F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2851(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2852(uint64_t a1)
{
}

void sub_21BDB2514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location)
{
}

id _MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = *MEMORY[0x263F54E88];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = ___MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext_block_invoke;
  aBlock[3] = &unk_2643BFB70;
  BOOL v14 = &v16;
  uint64_t v15 = a1;
  id v4 = v3;
  id v13 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = MPSharedBackgroundTaskProvider();
  uint64_t v7 = [v6 beginTaskWithExpirationHandler:v5];
  v17[3] = v7;

  char v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v17[3];
    *(_DWORD *)buf = 136315650;
    uint64_t v21 = a1;
    __int16 v22 = 2114;
    id v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = v9;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "%s: BackgroundTask: Took assertion for %{public}@ (%lli)", buf, 0x20u);
  }

  unint64_t v10 = _Block_copy(v5);
  _Block_object_dispose(&v16, 8);

  return v10;
}

void sub_21BDB2984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3441(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3442(uint64_t a1)
{
}

void sub_21BDB3524(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21BDB713C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21BDB848C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

os_log_t _MPCLogCategoryAnalytics()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");

  return v0;
}

os_log_t _MPCLogCategoryDelegation()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "Delegation");

  return v0;
}

os_log_t _MPCLogCategoryMediaRemote()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");

  return v0;
}

os_log_t _MPCLogCategoryMusicBehavior()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");

  return v0;
}

os_log_t _MPCLogCategoryPodcastsBehavior()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");

  return v0;
}

os_log_t _MPCLogCategoryPlayback()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");

  return v0;
}

os_log_t _MPCLogCategoryPlayback_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");

  return v0;
}

os_log_t _MPCLogCategoryPlaybackEvents()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");

  return v0;
}

os_log_t _MPCLogCategoryQueueController()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");

  return v0;
}

void sub_21BDBE83C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4408(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4409(uint64_t a1)
{
}

void sub_21BDBF5E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_21BDC0124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _MPCDescribeQC(uint64_t a1)
{
  return +[MPCQueueController describePlayer:a1];
}

void sub_21BDC1B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BDC42F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21BDC4400(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21BDCF9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5191(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5192(uint64_t a1)
{
}

void sub_21BDD115C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BDD1514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _MPCRemotePlayerArtworkDataSourceValidSupportedSizes(void *a1, CGFloat a2, CGFloat a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "CGSizeValue", (void)v16);
        v24.size.width = v13;
        v24.size.height = v14;
        v23.origin.x = 0.0;
        v23.origin.y = 0.0;
        v24.origin.x = 0.0;
        v24.origin.y = 0.0;
        v23.size.width = a2;
        v23.size.height = a3;
        if (CGRectContainsRect(v23, v24)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

void sub_21BDD99D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MPCAssistantWatchIsConnectedToCompanion()
{
  return 0;
}

void sub_21BDDBC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6859(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6860(uint64_t a1)
{
}

void sub_21BDDC5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BDDD640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21BDE48B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8025(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8026(uint64_t a1)
{
}

void sub_21BDE6A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_21BDE7F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21BDE9378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BDEA71C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21BDEAFC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21BDEB2E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21BDEB4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BDEC0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BDECCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8339(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8340(uint64_t a1)
{
}

void sub_21BDEEF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoDelegateInfoTokenAReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3))
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
      else
      {
        uint64_t v18 = PBReaderReadData();
        long long v19 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x9C0], 8) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *NSStringFromAVFoundationErrorDomainCode(uint64_t a1)
{
  uint64_t v3 = a1 + 11885;
  id v4 = @"Unknown";
  switch(v3)
  {
    case 0:
      id v4 = @"ToneMappingFailed";
      break;
    case 1:
      id v4 = @"SandboxExtensionDenied";
      break;
    case 2:
      id v4 = @"EncodeFailed";
      break;
    case 3:
      id v4 = @"AirPlayReceiverTemporarilyUnavailable";
      break;
    case 4:
      id v4 = @"FailedToLoadSampleData";
      break;
    case 5:
      id v4 = @"InvalidSampleCursor";
      break;
    case 6:
      id v4 = @"ContentKeyRequestCancelled";
      break;
    case 7:
      id v4 = @"OperationCancelled";
      break;
    case 8:
      id v4 = @"RosettaNotInstalled";
      break;
    case 9:
      id v4 = @"SegmentStartedWithNonSyncSample";
      break;
    case 10:
      id v4 = @"IncorrectlyConfigured";
      break;
    case 12:
      id v4 = @"UnsupportedDeviceActiveFormat";
      break;
    case 13:
      id v4 = @"SessionHardwareCostOverage";
      break;
    case 14:
      id v4 = @"OperationNotSupportedForPreset";
      break;
    case 15:
      id v4 = @"ExternalPlaybackNotSupportedForAsset";
      break;
    case 16:
      id v4 = @"NoSourceTrack";
      break;
    case 17:
      id v4 = @"NoCompatibleAlternatesForExternalDisplay";
      break;
    case 18:
      id v4 = @"NoLongerPlayable";
      break;
    case 19:
      id v4 = @"ContentNotUpdated";
      break;
    case 20:
      id v4 = @"MalformedDepth";
      break;
    case 21:
      id v4 = @"FormatUnsupported";
      break;
    case 22:
      id v4 = @"ContentIsUnavailable";
      break;
    case 23:
      id v4 = @"OperationNotAllowed";
      break;
    case 24:
      id v4 = @"UnsupportedOutputSettings";
      break;
    case 25:
      id v4 = @"CreateContentKeyRequestFailed";
      break;
    case 26:
      id v4 = @"RecordingAlreadyInProgress";
      break;
    case 27:
      id v4 = @"VideoCompositorFailed";
      break;
    case 28:
      id v4 = @"AirPlayReceiverRequiresInternet";
      break;
    case 29:
      id v4 = @"AirPlayControllerRequiresInternet";
      break;
    case 30:
      id v4 = @"UndecodableMediaData";
      break;
    case 31:
      id v4 = @"FileTypeDoesNotSupportSampleReferences";
      break;
    case 32:
      id v4 = @"FailedToParse";
      break;
    case 33:
      id v4 = @"ApplicationIsNotAuthorizedToUseDevice";
      break;
    case 35:
      id v4 = @"ServerIncorrectlyConfigured";
      break;
    case 36:
      id v4 = @"FailedToLoadMediaData";
      break;
    case 37:
      id v4 = @"IncompatibleAsset";
      break;
    case 38:
      id v4 = @"OperationInterrupted";
      break;
    case 39:
      id v4 = @"TorchLevelUnavailable";
      break;
    case 40:
      id v4 = @"DisplayWasDisabled";
      break;
    case 41:
      id v4 = @"ScreenCaptureFailed";
      break;
    case 42:
      id v4 = @"InvalidOutputURLPathExtension";
      break;
    case 43:
      id v4 = @"ReferenceForbiddenByReferencePolicy";
      break;
    case 44:
      id v4 = @"InvalidVideoComposition";
      break;
    case 45:
      id v4 = @"EncoderTemporarilyUnavailable";
      break;
    case 46:
      id v4 = @"DecoderTemporarilyUnavailable";
      break;
    case 47:
      id v4 = @"OperationNotSupportedForAsset";
      break;
    case 48:
      id v4 = @"DeviceIsNotAvailableInBackground";
      break;
    case 49:
      id v4 = @"ApplicationIsNotAuthorized";
      break;
    case 50:
      id v4 = @"ContentIsNotAuthorized";
      break;
    case 51:
      id v4 = @"EncoderNotFound";
      break;
    case 52:
      id v4 = @"DecoderNotFound";
      break;
    case 53:
      id v4 = @"NoImageAtTime";
      break;
    case 54:
      id v4 = @"ContentIsProtected";
      break;
    case 55:
      id v4 = @"MaximumStillImageCaptureRequestsExceeded";
      break;
    case 56:
      id v4 = @"FileFailedToParse";
      break;
    case 57:
      id v4 = @"FileFormatNotRecognized";
      break;
    case 58:
      id v4 = @"InvalidCompositionTrackSegmentSourceDuration";
      break;
    case 59:
      id v4 = @"InvalidCompositionTrackSegmentSourceStartTime";
      break;
    case 60:
      id v4 = @"InvalidCompositionTrackSegmentDuration";
      break;
    case 61:
      id v4 = @"CompositionTrackSegmentsNotContiguous";
      break;
    case 62:
      id v4 = @"FileAlreadyExists";
      break;
    case 63:
      id v4 = @"InvalidSourceMedia";
      break;
    case 64:
      id v4 = @"DecodeFailed";
      break;
    case 65:
      id v4 = @"ExportFailed";
      break;
    case 66:
      id v4 = @"MediaServicesWereReset";
      break;
    case 67:
      id v4 = @"SessionWasInterrupted";
      break;
    case 68:
      id v4 = @"DeviceLockedForConfigurationByAnotherProcess";
      break;
    case 70:
      id v4 = @"DeviceInUseByAnotherApplication";
      break;
    case 71:
      id v4 = @"DeviceNotConnected";
      break;
    case 72:
      id v4 = @"MaximumNumberOfSamplesForFileFormatReached";
      break;
    case 73:
      id v4 = @"MediaDiscontinuity";
      break;
    case 74:
      id v4 = @"MaximumFileSizeReached";
      break;
    case 75:
      id v4 = @"MaximumDurationReached";
      break;
    case 76:
      id v4 = @"MediaChanged";
      break;
    case 77:
      id v4 = @"DeviceWasDisconnected";
      break;
    case 78:
      id v4 = @"DiskFull";
      break;
    case 79:
      id v4 = @"SessionConfigurationChanged";
      break;
    case 80:
      id v4 = @"NoDataCaptured";
      break;
    case 81:
      id v4 = @"DeviceAlreadyUsedByAnotherSession";
      break;
    case 82:
      id v4 = @"SessionNotRunning";
      break;
    case 84:
      id v4 = @"OutOfMemory";
      break;
    case 85:
      goto LABEL_246;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"UnknownAVError/code=%lld", a1);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_246:
      break;
  }
  return v4;
}

uint64_t __Block_byref_object_copy__10132(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10133(uint64_t a1)
{
}

id MPCAssistantCreateError(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 - 1) > 0xC) {
    uint64_t v2 = @"An unknown error occurred.";
  }
  else {
    uint64_t v2 = off_2643C0D10[a1 - 1];
  }
  uint64_t v3 = v2;
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MPAssistantErrorDomain" code:a1 userInfo:v4];

  return v5;
}

id MPCAssistantWrapError(void *a1)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 domain];
    int v4 = [v3 isEqual:*MEMORY[0x263F54AE0]];

    if (v4)
    {
      uint64_t v5 = [v2 code];
      uint64_t v6 = 0;
      uint64_t v7 = @"An unknown error occurred.";
      if (v5 > 99)
      {
        switch(v5)
        {
          case 't':
          case 'y':
            goto LABEL_16;
          case 'u':
          case 'w':
          case 'x':
          case 'z':
          case '{':
          case '|':
            goto LABEL_20;
          case 'v':
LABEL_9:
            uint64_t v8 = 4;
            break;
          case '}':
            uint64_t v8 = 13;
            break;
          default:
            if (v5 == 100)
            {
LABEL_16:
              uint64_t v8 = 3;
            }
            else
            {
              if (v5 != 202) {
                goto LABEL_20;
              }
              uint64_t v8 = 11;
            }
            break;
        }
      }
      else
      {
        uint64_t v8 = 1;
        switch(v5)
        {
          case '\'':
          case '/':
            break;
          case '(':
            goto LABEL_9;
          case ')':
          case '*':
          case '+':
          case ',':
          case '-':
          case '.':
            goto LABEL_20;
          case '0':
            uint64_t v8 = 12;
            break;
          default:
            if (v5 == 5)
            {
              uint64_t v8 = 2;
            }
            else
            {
              if (v5 != 26) {
                goto LABEL_20;
              }
              uint64_t v8 = 9;
            }
            break;
        }
      }
      uint64_t v7 = off_2643C0D10[v8 - 1];
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = @"An unknown error occurred.";
    }
LABEL_20:
    unint64_t v10 = v7;
    uint64_t v11 = *MEMORY[0x263F07F80];
    v17[0] = v10;
    uint64_t v12 = *MEMORY[0x263F08608];
    v16[0] = v11;
    v16[1] = v12;
    char v13 = (void *)[v2 copy];
    v17[1] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

    unsigned int v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MPAssistantErrorDomain" code:v6 userInfo:v14];
  }
  else
  {
    unsigned int v9 = MPCAssistantCreateError(0);
  }

  return v9;
}

id MPCAssistantCreateSendCommandError(unsigned int a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
  uint64_t v6 = *MEMORY[0x263F07F80];
  v7[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  int v4 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MPCAssistantMediaRemoteSendCommandErrorDomain" code:a1 userInfo:v3];

  return v4;
}

uint64_t MPCAssistantErrorIsInformational(void *a1)
{
  id v1 = a1;
  if ((MRMediaRemoteErrorIsInformational() & 1) != 0
    || ([v1 underlyingErrors],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_10238),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    uint64_t v4 = 1;
  }
  else if ([v1 code] == 6 || objc_msgSend(v1, "code") == 7 || objc_msgSend(v1, "code") == 11)
  {
    uint64_t v6 = [v1 domain];
    uint64_t v4 = [v6 isEqualToString:@"MPAssistantErrorDomain"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __MPCAssistantErrorIsInformational_block_invoke()
{
  return MRMediaRemoteErrorIsInformational();
}

void MPCPlaybackEngineEventMonotonicTimeConvertNSDate(void *a1@<X0>, uint64_t a2@<X8>)
{
  mach_timebase_info info = 0;
  id v3 = a1;
  mach_timebase_info(&info);
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(void *)(a2 + 32) = 0;
  MPCPlaybackEngineEventGetMonotonicTime((void *)a2);
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = (uint64_t)((v4 - *(double *)(a2 + 32)) * 1000000000.0);
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;

  *(void *)(a2 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 16) + v5;
  *(void *)(a2 + 8) += info.denom * v5 / info.numer;
  *(void *)(a2 + 16) = v8;
}

void MPCPlaybackEngineEventMonotonicTimeConvertCMTimebase(const void *a1@<X0>, uint64_t a2@<X8>, Float64 a3@<D0>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v12);
  memset(&v11, 0, sizeof(v11));
  CMTimeMakeWithSeconds(&v11, a3, 1000000000);
  memset(&v10, 0, sizeof(v10));
  CMClockRef HostTimeClock = CMClockGetHostTimeClock();
  CMTime time = v11;
  CMSyncConvertTime(&v10, &time, a1, HostTimeClock);
  if (v10.flags)
  {
    CMTime time = v10;
    MPCPlaybackEngineEventMonotonicTimeWithHostTime(&time, a2);
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      CMTime time = v10;
      uint64_t v8 = (__CFString *)CMTimeCopyDescription(0, &time);
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)a1;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = v8;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "Unable to convert timebase to host time - timebase=%{public}@ - hostTimeFromTimeBase=%{public}@", (uint8_t *)&time, 0x16u);
    }
    long long v9 = v13;
    *(_OWORD *)a2 = v12;
    *(_OWORD *)(a2 + 16) = v9;
    *(void *)(a2 + 32) = v14;
  }
}

double MPCPlaybackEngineEventMonotonicTimeWithHostTime@<D0>(CMTime *a1@<X0>, uint64_t a2@<X8>)
{
  double v16 = 0.0;
  long long v14 = 0u;
  long long v15 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v14);
  CMTime v13 = *a1;
  uint64_t v4 = CMClockConvertHostTimeToSystemUnits(&v13);
  uint64_t v5 = *((void *)&v14 + 1) - v4;
  if (*((void *)&v14 + 1) <= v4) {
    __assert_rtn("MPCPlaybackEngineEventMonotonicTimeWithHostTime", "MPCPlaybackEngineEvent.m", 78, "time.machAbsoluteTime > machAbsoluteTime");
  }
  uint64_t v6 = v4;
  v13.value = 0;
  mach_timebase_info((mach_timebase_info_t)&v13);
  unint64_t v7 = v5 * LODWORD(v13.value) / HIDWORD(v13.value);
  double v8 = (double)v7;
  uint64_t v9 = v15 - v7;
  double v10 = v16;
  *(void *)a2 = v14;
  *(void *)(a2 + _Block_object_dispose(&STACK[0x9C0], 8) = v6;
  uint64_t v11 = *((void *)&v15 + 1);
  double result = v10 + v8 / -1000000000.0;
  *(void *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v11;
  *(double *)(a2 + 32) = result;
  return result;
}

uint64_t MPCPlaybackEngineEventMonotonicTimeGetAbsoluteTimeWithOffset(uint64_t a1, double a2)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return info.denom * (uint64_t)(a2 * 1000000000.0) / info.numer + *(void *)(a1 + 8);
}

id _EVSEventToABCEvent(void *a1)
{
  id v1 = [a1 payload];
  uint64_t v2 = MPCPlaybackEngineEventPayloadJSONFromPayload(v1);

  return v2;
}

void sub_21BDF7CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12029(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12030(uint64_t a1)
{
}

__CFString *NSStringFromMPCErrorCode(uint64_t a1)
{
  uint64_t v4 = @"Unknown";
  switch(a1)
  {
    case 0:
      goto LABEL_93;
    case 1:
      uint64_t v4 = @"UnableToPerformRequest";
      break;
    case 2:
      uint64_t v4 = @"UnsupportedCommand";
      break;
    case 3:
      uint64_t v4 = @"MissingBag";
      break;
    case 4:
      uint64_t v4 = @"UnknownCustomQueueIdentifier";
      break;
    case 5:
      uint64_t v4 = @"MissingTracklistData";
      break;
    case 6:
      uint64_t v4 = @"MissingModelRequest";
      break;
    case 7:
      uint64_t v4 = @"DelegatedAccountCreationFailure";
      break;
    case 8:
      uint64_t v4 = @"MissingCreationPropertiesData";
      break;
    case 9:
      uint64_t v4 = @"InvalidSuzeLeaseSessionToken";
      break;
    case 10:
      uint64_t v4 = @"CellularRestricted";
      break;
    case 11:
      uint64_t v4 = @"NetworkUnavailable";
      break;
    case 12:
      uint64_t v4 = @"ExceededBagFileSizeLimit";
      break;
    case 13:
      uint64_t v4 = @"FailedToDecodePlaylistManagerArchive";
      break;
    case 14:
      uint64_t v4 = @"RequestTimeout";
      break;
    case 15:
      uint64_t v4 = @"InvalidResponse";
      break;
    case 16:
      uint64_t v4 = @"InvalidDelegatedIdentity";
      break;
    case 17:
      uint64_t v4 = @"SubscriptionRequired";
      break;
    case 18:
      uint64_t v4 = @"MissingSubscriptionAdamID";
      break;
    case 19:
      uint64_t v4 = @"MissingLeaseSession";
      break;
    case 20:
      uint64_t v4 = @"MissingLocalFilePath";
      break;
    case 21:
      uint64_t v4 = @"AssetQualityTooLow";
      break;
    case 22:
      uint64_t v4 = @"InvalidCachedAsset";
      break;
    case 23:
      uint64_t v4 = @"InvalidAssetURL";
      break;
    case 24:
      uint64_t v4 = @"AssetUnavailable";
      break;
    case 25:
      uint64_t v4 = @"MissingRedownloadParameters";
      break;
    case 26:
      uint64_t v4 = @"MissingStoreRequestContext";
      break;
    case 27:
      uint64_t v4 = @"SubscriptionRequiredForSharedQueue";
      break;
    case 28:
      uint64_t v4 = @"Cancelled";
      break;
    case 29:
      uint64_t v4 = @"MissingArtwork";
      break;
    case 30:
      uint64_t v4 = @"SubscriptionLeaseTaken";
      break;
    case 40:
      uint64_t v4 = @"ExplicitContentRequiresAgeVerification";
      break;
    case 41:
      uint64_t v4 = @"ExplicitContentIsNotAllowed";
      break;
    case 42:
      uint64_t v4 = @"ExplicitContentAgeVerificationFailed";
      break;
    case 43:
      uint64_t v4 = @"ExplicitContentAgeGatingFailed";
      break;
    case 53:
      uint64_t v4 = @"DroppedCompletion";
      break;
    case 54:
      uint64_t v4 = @"SubscriptionAssetResponseMissingItem";
      break;
    case 55:
      uint64_t v4 = @"FailedToResolveStartItem";
      break;
    case 56:
      uint64_t v4 = @"NoNetworkConnection";
      break;
    case 57:
      uint64_t v4 = @"UserIdentityNotSupported";
      break;
    case 58:
      uint64_t v4 = @"UnsupportedPlaybackContext";
      break;
    case 59:
      uint64_t v4 = @"UnrestorableArchive";
      break;
    case 60:
      uint64_t v4 = @"UninitializedPlaybackStack";
      break;
    case 61:
      uint64_t v4 = @"EmptyModelResponse";
      break;
    case 62:
      uint64_t v4 = @"FailedToQueueItems";
      break;
    case 64:
      uint64_t v4 = @"RadioServiceNotAllowed";
      break;
    case 65:
      uint64_t v4 = @"HLSAssetMissingKeyURLs";
      break;
    case 66:
      uint64_t v4 = @"UnsupportedPlaybackQueue";
      break;
    case 67:
      uint64_t v4 = @"MissingUserIdentity";
      break;
    case 68:
      uint64_t v4 = @"UserIdentityMismatch";
      break;
    case 69:
      uint64_t v4 = @"NonPlayableEntity";
      break;
    case 70:
      uint64_t v4 = @"PersonalizationTimeout";
      break;
    case 71:
      uint64_t v4 = @"HLSAssetKeyDeliveryFailed";
      break;
    case 72:
      uint64_t v4 = @"MissingTransportableLibraryIDs";
      break;
    case 73:
      uint64_t v4 = @"MissingDelegationHostAccount";
      break;
    case 74:
      uint64_t v4 = @"MissingDelegationToken";
      break;
    case 75:
      uint64_t v4 = @"EmptyModelResponseWithCloudLibraryDisabled";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_93:
      break;
  }
  return v4;
}

__CFString *NSStringFromMPCPlaybackSessionManagerErrorCode(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C11F0[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCPlayerRequestErrorCode(uint64_t a1)
{
  if (a1 > 2999)
  {
    if (a1 <= 4999)
    {
      if (a1 == 3000)
      {
        uint64_t v2 = @"FailedToLoadArtwork";
        return v2;
      }
      if (a1 == 4000)
      {
        uint64_t v2 = @"FailedToLoadSupportedCommands";
        return v2;
      }
    }
    else
    {
      switch(a1)
      {
        case 5000:
          uint64_t v2 = @"FailedToResolve";
          return v2;
        case 6000:
          uint64_t v2 = @"FailedToPlaybackState";
          return v2;
        case 7000:
          uint64_t v2 = @"FailedToLoadParticipants";
          return v2;
      }
    }
LABEL_44:
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 <= 1000)
  {
    if (!a1)
    {
      uint64_t v2 = @"Unknown";
      return v2;
    }
    if (a1 == 1000)
    {
      uint64_t v2 = @"UnableToSendCommand";
      return v2;
    }
    goto LABEL_44;
  }
  switch(a1)
  {
    case 1001:
      uint64_t v2 = @"CommandFailed";
      break;
    case 1002:
      uint64_t v2 = @"NoCommandsProvided";
      break;
    case 2000:
      uint64_t v2 = @"FailedToLoadMetadata";
      return v2;
    default:
      goto LABEL_44;
  }
  return v2;
}

__CFString *NSStringFromMPCModelRadioQueueFeederErrorCode(uint64_t a1)
{
  switch(a1)
  {
    case -1006:
      uint64_t v2 = @"AccountSignOut";
      break;
    case -1005:
      uint64_t v2 = @"GetTracksFailed";
      break;
    case -1004:
      uint64_t v2 = @"NetworkUnavailable";
      break;
    case -1003:
      uint64_t v2 = @"CellularRestricted";
      break;
    default:
      if (a1)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v2 = @"Unknown";
      }
      break;
  }
  return v2;
}

__CFString *NSStringFromMPCPlayerEnqueueErrorCode(unint64_t a1)
{
  if (a1 < 6 && ((0x2Fu >> a1) & 1) != 0)
  {
    uint64_t v1 = off_2643C1228[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

__CFString *NSStringFromMPCPlaybackEngineInternalErrorCode(uint64_t a1)
{
  if (a1 > 2200)
  {
    if (a1 > 4999)
    {
      if (a1 > 5049)
      {
        switch(a1)
        {
          case 6000:
            id v3 = @"FailedToPerformDialogAction";
            break;
          case 6001:
            id v3 = @"FailedToDecodeDialogActionOptions";
            break;
          case 6002:
            id v3 = @"FailedToDecodeDialogActionPayload";
            break;
          case 6003:
            id v3 = @"FailedToDeleteItemFromLibrary";
            break;
          default:
            if (a1 == 5050)
            {
              id v3 = @"TimeoutTimeControlStatus";
            }
            else
            {
              if (a1 != 5060) {
                goto LABEL_185;
              }
              id v3 = @"TimeoutFirstAudioFrame";
            }
            break;
        }
      }
      else if (a1 > 5019)
      {
        switch(a1)
        {
          case 5020:
            id v3 = @"TimeoutQueueLoad";
            break;
          case 5030:
            id v3 = @"TimeoutAssetLoad";
            break;
          case 5040:
            id v3 = @"TimeoutReadyToPlay";
            break;
          default:
            goto LABEL_185;
        }
      }
      else
      {
        switch(a1)
        {
          case 5000:
            id v3 = @"TimeoutUnknown";
            break;
          case 5001:
            id v3 = @"TimeoutUnknownCommandID";
            break;
          case 5010:
            id v3 = @"TimeoutSessionActivation";
            break;
          default:
            goto LABEL_185;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 3000:
          id v3 = @"FailedToBuildPlaybackContext";
          break;
        case 3001:
          id v3 = @"FailedToLoadPlaybackContext";
          break;
        case 3002:
          id v3 = @"FailedToMoveItem";
          break;
        case 3003:
          id v3 = @"FailedToRemoveItem";
          break;
        case 3004:
          id v3 = @"FailedToRepeatItem";
          break;
        case 3005:
          id v3 = @"FailedToShuffleItem";
          break;
        case 3006:
          id v3 = @"FailedToChangeAutoPlayMode";
          break;
        case 3007:
          id v3 = @"FailedToProduceItem";
          break;
        default:
          switch(a1)
          {
            case 3100:
              id v3 = @"FailedToLoadSession";
              break;
            case 3101:
              id v3 = @"FailedToDecodeSession";
              break;
            case 3102:
              id v3 = @"FailedToFinalizeSession";
              break;
            case 3103:
              id v3 = @"SessionRestoredUnexpectedCurrentItem";
              break;
            case 3104:
              id v3 = @"SessionMigrationIdentifierMissing";
              break;
            default:
              if (a1 != 2201) {
                goto LABEL_185;
              }
              id v3 = @"SharedListeningSessionDisconnected";
              break;
          }
          break;
      }
    }
  }
  else if (a1 > 1000)
  {
    if (a1 > 2099)
    {
      switch(a1)
      {
        case 2100:
          id v3 = @"CannotStopScanningIfNotScanning";
          break;
        case 2101:
          id v3 = @"CannotSkipUnskippableItem";
          break;
        case 2200:
          id v3 = @"FailedToPlaySharedListeningItem";
          break;
        default:
          goto LABEL_185;
      }
    }
    else
    {
      switch(a1)
      {
        case 2000:
          id v3 = @"FailedToPlayRate";
          break;
        case 2001:
          id v3 = @"FailedToPauseRate";
          break;
        case 2002:
          id v3 = @"FailedToToggleRate";
          break;
        case 2003:
          id v3 = @"FailedToChangeRate";
          break;
        case 2004:
          id v3 = @"FailedToJumpToTime";
          break;
        case 2005:
          id v3 = @"FailedToBeginScanning";
          break;
        case 2006:
          id v3 = @"FailedToStopScanning";
          break;
        case 2007:
          id v3 = @"FailedToEndPlayback";
          break;
        default:
          if (a1 == 1001)
          {
            id v3 = @"AudioSessionActivationFailed";
          }
          else
          {
            if (a1 != 1002) {
              goto LABEL_185;
            }
            id v3 = @"AudioSessionActivationCancelled";
          }
          break;
      }
    }
  }
  else
  {
    if (a1 <= 99)
    {
      id v3 = @"Unknown";
      switch(a1)
      {
        case 0:
          goto LABEL_186;
        case 1:
          id v3 = @"NoContentToPlay";
          break;
        case 2:
          id v3 = @"NoCurrentItem";
          break;
        case 3:
          id v3 = @"CannotFindReferencedItem";
          break;
        case 4:
          id v3 = @"FeatureDisabled";
          break;
        case 5:
          id v3 = @"CommandInvalid";
          break;
        case 6:
          id v3 = @"CommandRequiresOverride";
          break;
        case 7:
          id v3 = @"FeatureNotImplemented";
          break;
        default:
          goto LABEL_185;
      }
      return v3;
    }
    if (a1 <= 101)
    {
      if (a1 == 100)
      {
        id v3 = @"AccountMissing";
      }
      else
      {
        id v3 = @"AccountMissingSubscription";
      }
    }
    else
    {
      switch(a1)
      {
        case 102:
          id v3 = @"AccountMissingAuthentication";
          break;
        case 199:
          id v3 = @"AccountNotPrepared";
          break;
        case 1000:
          id v3 = @"MediaServicesUnavailable";
          return v3;
        default:
LABEL_185:
          objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
          id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_186:
          return v3;
      }
    }
  }
  return v3;
}

__CFString *NSStringFromMPCSuntoryErrorCode(uint64_t a1)
{
  if (a1 <= 199)
  {
    if (a1)
    {
      if (a1 == 101)
      {
        uint64_t v2 = @"ModelNotFound";
      }
      else if (a1 == 102)
      {
        uint64_t v2 = @"InvalidModel";
      }
      else
      {
LABEL_42:
        objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v2 = @"Unknown";
    }
  }
  else
  {
    switch(a1)
    {
      case 200:
        uint64_t v2 = @"FailedToLoadProcessor";
        break;
      case 201:
        uint64_t v2 = @"FailedToCreateAudioUnit";
        break;
      case 202:
        uint64_t v2 = @"FailedToSetupAudioUnit";
        break;
      case 203:
        uint64_t v2 = @"FailedToInitializeAudioUnit";
        break;
      case 210:
        uint64_t v2 = @"FailedToProcessData";
        break;
      case 211:
        uint64_t v2 = @"ProcessorNotAvailable";
        break;
      case 212:
        uint64_t v2 = @"ProcessorOverflow";
        break;
      case 213:
        uint64_t v2 = @"FailedToResetAudioUnit";
        break;
      case 220:
        uint64_t v2 = @"FailedToConfigureAsset";
        break;
      default:
        goto LABEL_42;
    }
  }
  return v2;
}

__CFString *NSStringFromMPCMusicSharePlayBehaviorErrorCode(unint64_t a1)
{
  if (a1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C1258[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCMusicPlaybackContextSharePlayErrorCode(unint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C12D8[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCMusicBehaviorErrorCode(unint64_t a1)
{
  if (a1 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C1328[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCPodcastsBehaviorErrorCode(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C1380[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCEnginePlayerErrorCode(unint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C13C8[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCExternalContentErrorCode(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C1458[a1];
  }

  return v1;
}

void sub_21BDFBFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__13488(uint64_t a1, uint64_t a2)
{
  double result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__13489(uint64_t a1)
{
}

void sub_21BDFFF6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13973(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13974(uint64_t a1)
{
}

void sub_21BE084BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE0C938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE0D364(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21BE0DC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_21BE0F8E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21BE0FE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE10A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14795(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14796(uint64_t a1)
{
}

void sub_21BE114C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_21BE12EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

void sub_21BE13DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_21BE14AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t _MPCProtoContainerIdentifierSetReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_49;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_51;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_51:
          uint64_t v37 = 16;
          goto LABEL_60;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 4u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_55:
          uint64_t v37 = 24;
          goto LABEL_60;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 56;
          goto LABEL_47;
        case 4u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 64;
          goto LABEL_47;
        case 5u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 72) |= 1u;
          break;
        case 6u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 32;
          goto LABEL_47;
        case 7u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 48;
          goto LABEL_47;
        case 8u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 40;
LABEL_47:
          char v36 = *(void **)(a1 + v30);
          *(void *)(a1 + v30) = v29;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 == -1 || v34 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
        *(void *)(a2 + v33) = v34 + 1;
        v19 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0) {
          goto LABEL_57;
        }
        v31 += 7;
        BOOL v14 = v32++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_59;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_57:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_59:
      uint64_t v37 = 8;
LABEL_60:
      *(void *)(a1 + v37) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BE16DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15147(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15148(uint64_t a1)
{
}

void sub_21BE1AEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE1B5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE1B828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE1CD40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21BE1E530(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoDelegateInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v16 = v10 & 7;
    if (v15 || v16 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 116) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_75;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_77;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_75:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_77:
        uint64_t v52 = 40;
        goto LABEL_82;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 116) |= 1u;
        while (2)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v20 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_81:
        uint64_t v52 = 32;
LABEL_82:
        *(void *)(a1 + v52) = v20;
        goto LABEL_101;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 104;
        goto LABEL_47;
      case 4u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 48;
        goto LABEL_47;
      case 5u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 56;
        goto LABEL_47;
      case 6u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        *(unsigned char *)(a1 + 116) |= 4u;
        while (2)
        {
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                LODWORD(v33) = 0;
                goto LABEL_86;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v33) = 0;
        }
LABEL_86:
        *(_DWORD *)(a1 + 72) = v33;
        goto LABEL_101;
      case 7u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 64;
        goto LABEL_47;
      case 8u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 80;
LABEL_47:
        uint64_t v37 = *(void **)(a1 + v30);
        *(void *)(a1 + v30) = v29;

        goto LABEL_101;
      case 9u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(unsigned char *)(a1 + 116) |= 8u;
        while (2)
        {
          uint64_t v41 = *v3;
          unint64_t v42 = *(void *)(a2 + v41);
          if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (v14)
              {
                uint64_t v40 = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_90:
        *(unsigned char *)(a1 + 112) = v40 != 0;
        goto LABEL_101;
      case 0xAu:
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v45 = 0;
            unsigned int v46 = 0;
            uint64_t v47 = 0;
            while (1)
            {
              uint64_t v48 = *v3;
              unint64_t v49 = *(void *)(a2 + v48);
              if (v49 == -1 || v49 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v4_Block_object_dispose(&STACK[0x9C0], 8) = v49 + 1;
              v47 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_67;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          while (1)
          {
            uint64_t v56 = *v3;
            unint64_t v57 = *(void *)(a2 + v56);
            if (v57 == -1 || v57 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v57 + 1;
            v55 |= (unint64_t)(v58 & 0x7F) << v53;
            if (v58 < 0)
            {
              v53 += 7;
              BOOL v14 = v54++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_100;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_100:
          PBRepeatedInt32Add();
        }
        goto LABEL_101;
      case 0xBu:
        double v51 = objc_alloc_init(_MPCProtoDelegateInfoTokenA);
        objc_storeStrong((id *)(a1 + 88), v51);
        if (!PBReaderPlaceMark() || (_MPCProtoDelegateInfoTokenAReadFrom((uint64_t)v51, a2) & 1) == 0) {
          goto LABEL_104;
        }
        goto LABEL_73;
      case 0xCu:
        double v51 = objc_alloc_init(_MPCProtoDelegateInfoTokenE);
        objc_storeStrong((id *)(a1 + 96), v51);
        if PBReaderPlaceMark() && (_MPCProtoDelegateInfoTokenEReadFrom((uint64_t)v51, a2))
        {
LABEL_73:
          PBReaderRecallMark();

LABEL_101:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_104:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_101;
    }
  }
}

uint64_t _MPCProtoRadioContentReferenceLibraryArtistContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_39;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_41:
        uint64_t v32 = 16;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            uint64_t v18 = PBReaderReadString();
            unsigned int v19 = *(void **)(a1 + 24);
            *(void *)(a1 + 24) = v18;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v2_Block_object_dispose(&STACK[0x9C0], 8) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0) {
            goto LABEL_43;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_45:
        uint64_t v32 = 8;
      }
      *(void *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BE22BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17472(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17473(uint64_t a1)
{
}

uint64_t inputRenderCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v6 = *a6;
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 16 * v6;
    do
    {
      *(_OWORD *)&a6[v7 / 4 + 2] = *(_OWORD *)(*(void *)(a1 + 88) + v7 + 8);
      v7 += 16;
    }
    while (v8 != v7);
  }
  return 0;
}

void sub_21BE285FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18213(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18214(uint64_t a1)
{
}

void sub_21BE2ABEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21BE2CA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE2D034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BE2D6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BE302E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BE322C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21BE37274(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21BE37808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18861(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18862(uint64_t a1)
{
}

void sub_21BE3C264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19687(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19688(uint64_t a1)
{
}

uint64_t _MPCProtoRadioContentReferenceStoreContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x9C0], 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MPCProtoRadioContentReferenceLibraryItemContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 40;
          goto LABEL_60;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 56;
          goto LABEL_60;
        case 3u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 72;
          goto LABEL_60;
        case 4u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 80;
          goto LABEL_60;
        case 5u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x40u;
          while (2)
          {
            uint64_t v23 = *v3;
            uint64_t v24 = *(void *)(a2 + v23);
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_101:
          uint64_t v84 = 88;
          goto LABEL_135;
        case 6u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 96;
          goto LABEL_60;
        case 7u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x10u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v15 = v28++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_105:
          uint64_t v84 = 48;
          goto LABEL_135;
        case 8u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x80u;
          while (2)
          {
            uint64_t v35 = *v3;
            uint64_t v36 = *(void *)(a2 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v15 = v34++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_109:
          uint64_t v84 = 104;
          goto LABEL_135;
        case 9u:
          *(_WORD *)(a1 + 140) |= 4u;
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v41 = *(void *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v41 = 0;
          }
          uint64_t v86 = 24;
          goto LABEL_140;
        case 0xAu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 112;
          goto LABEL_60;
        case 0xBu:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          *(_WORD *)(a1 + 140) |= 0x400u;
          while (2)
          {
            uint64_t v45 = *v3;
            uint64_t v46 = *(void *)(a2 + v45);
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
              *(void *)(a2 + v45) = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                BOOL v15 = v43++ >= 9;
                if (v15)
                {
                  uint64_t v44 = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v44 = 0;
          }
LABEL_113:
          *(unsigned char *)(a1 + 136) = v44 != 0;
          continue;
        case 0xCu:
          *(_WORD *)(a1 + 140) |= 2u;
          uint64_t v49 = *v3;
          unint64_t v50 = *(void *)(a2 + v49);
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v41 = *(void *)(*(void *)(a2 + *v7) + v50);
            *(void *)(a2 + v49) = v50 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v41 = 0;
          }
          uint64_t v86 = 16;
LABEL_140:
          *(void *)(a1 + v86) = v41;
          continue;
        case 0xDu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 120;
LABEL_60:
          double v51 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 0xEu:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v54 = 0;
          *(_WORD *)(a1 + 140) |= 8u;
          while (2)
          {
            uint64_t v55 = *v3;
            uint64_t v56 = *(void *)(a2 + v55);
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
              *(void *)(a2 + v55) = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                BOOL v15 = v53++ >= 9;
                if (v15)
                {
                  uint64_t v54 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v54 = 0;
          }
LABEL_117:
          uint64_t v85 = 32;
          goto LABEL_122;
        case 0x10u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v54 = 0;
          *(_WORD *)(a1 + 140) |= 1u;
          while (2)
          {
            uint64_t v62 = *v3;
            uint64_t v63 = *(void *)(a2 + v62);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
              *(void *)(a2 + v62) = v64;
              v54 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v15 = v61++ >= 9;
                if (v15)
                {
                  uint64_t v54 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v54 = 0;
          }
LABEL_121:
          uint64_t v85 = 8;
LABEL_122:
          *(void *)(a1 + v85) = v54;
          continue;
        case 0x11u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x20u;
          while (2)
          {
            uint64_t v68 = *v3;
            uint64_t v69 = *(void *)(a2 + v68);
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v69);
              *(void *)(a2 + v6_Block_object_dispose(&STACK[0x9C0], 8) = v70;
              v22 |= (unint64_t)(v71 & 0x7F) << v66;
              if (v71 < 0)
              {
                v66 += 7;
                BOOL v15 = v67++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_126:
          uint64_t v84 = 64;
          goto LABEL_135;
        case 0x12u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x100u;
          while (2)
          {
            uint64_t v74 = *v3;
            uint64_t v75 = *(void *)(a2 + v74);
            unint64_t v76 = v75 + 1;
            if (v75 == -1 || v76 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)(a2 + *v7) + v75);
              *(void *)(a2 + v74) = v76;
              v22 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                BOOL v15 = v73++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_130:
          uint64_t v84 = 128;
          goto LABEL_135;
        case 0x13u:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x200u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v80 = *v3;
        uint64_t v81 = *(void *)(a2 + v80);
        unint64_t v82 = v81 + 1;
        if (v81 == -1 || v82 > *(void *)(a2 + *v4)) {
          break;
        }
        char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
        *(void *)(a2 + v80) = v82;
        v22 |= (unint64_t)(v83 & 0x7F) << v78;
        if ((v83 & 0x80) == 0) {
          goto LABEL_132;
        }
        v78 += 7;
        BOOL v15 = v79++ >= 9;
        if (v15)
        {
          LODWORD(v22) = 0;
          goto LABEL_134;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_132:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_134:
      uint64_t v84 = 132;
LABEL_135:
      *(_DWORD *)(a1 + v84) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BE4BA90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_21BE4C2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21362(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21363(uint64_t a1)
{
}

uint64_t _MPCProtoContainerReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_38;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_40;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_38:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_40:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x9C0], 8) = v19;
        goto LABEL_41;
      case 2u:
        uint64_t v24 = objc_alloc_init(_MPCProtoContainerIdentifierSet);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (_MPCProtoContainerIdentifierSetReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_33;
      case 3u:
        uint64_t v24 = objc_alloc_init(_MPCProtoItem);
        -[_MPCProtoContainer addItem:](a1, v24);
        if PBReaderPlaceMark() && (_MPCProtoItemReadFrom((uint64_t)v24, a2))
        {
LABEL_33:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_43:

        return 0;
      case 4u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 32;
        goto LABEL_36;
      case 5u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 40;
LABEL_36:
        char v27 = *(void **)(a1 + v26);
        *(void *)(a1 + v26) = v25;

        goto LABEL_41;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_41;
    }
  }
}

void sub_21BE50D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22023(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22024(uint64_t a1)
{
}

void sub_21BE51360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE544DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22508(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22509(uint64_t a1)
{
}

void sub_21BE54930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMFDebugOverlayControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = MediaDebugUILibraryCore_frameworkLibrary;
  if (!MediaDebugUILibraryCore_frameworkLibrary)
  {
    long long v7 = xmmword_2643C37E0;
    v4[3] = _sl_dlopen();
    MediaDebugUILibraryCore_frameworkLibrary = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  Class result = objc_getClass("MFDebugOverlayController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMFDebugOverlayControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21BE54A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MediaDebugUILibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  MediaDebugUILibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21BE56F70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__125(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__126(uint64_t a1)
{
}

void _MPCMediaRemoteControllerAddCommandInfo(void *a1, uint64_t a2)
{
  id v3 = a1;
  MPCRemoteCommandDescriptionCopy(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:a2];
  [v4 setObject:v5 forKeyedSubscript:@"command"];

  [v4 setObject:v8 forKeyedSubscript:@"commandName"];
  if (!MRMediaRemoteCommandInfoGetEnabled()) {
    [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"enabled"];
  }
  uint64_t v6 = (void *)MRMediaRemoteCommandInfoCopyOptions();
  if ([v6 count]) {
    [v4 setObject:v6 forKeyedSubscript:@"options"];
  }
  long long v7 = [NSString stringWithFormat:@"%@ (%d)", v8, a2];
  [v3 setObject:v4 forKeyedSubscript:v7];
}

void sub_21BE59D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

uint64_t __Block_byref_object_copy__22874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22875(uint64_t a1)
{
}

void _MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v8 = a1;
  id v39 = a2;
  id v40 = a3;
  id v36 = (id)[v8 mutableCopy];
  uint64_t v56 = 0;
  unint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__22874;
  char v60 = __Block_byref_object_dispose__22875;
  id v61 = 0;
  uint64_t v50 = 0;
  double v51 = &v50;
  uint64_t v52 = 0x3032000000;
  unsigned int v53 = __Block_byref_object_copy__22874;
  uint64_t v54 = __Block_byref_object_dispose__22875;
  id v55 = 0;
  char v38 = v8;
  uint64_t v35 = [v8 objectForKey:@"kind"];
  if (v35)
  {
    char v49 = 0;
    MPStoreItemMetadataItemKindGetPlayabilityInformation();
  }
  unint64_t v37 = [v8 objectForKey:@"childrenIds"];
  if (_NSIsNSArray() && [v37 count])
  {
    unsigned int v9 = [v8 objectForKey:@"children"];
    if (_NSIsNSDictionary())
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v37;
      uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v62 count:16];
      if (v10)
      {
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v46 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            if (_NSIsNSString())
            {
              id v15 = [v9 objectForKey:v14];
              if (_NSIsNSDictionary())
              {
                id v43 = 0;
                id v44 = 0;
                id v42 = 0;
                _MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary(v15, v39, v40, &v44, &v43, &v42);
                id v16 = v44;
                id v17 = v43;
                id v18 = v42;
                if ([v16 count])
                {
                  uint64_t v19 = (void *)v57[5];
                  if (!v19)
                  {
                    uint64_t v20 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
                    unint64_t v21 = (void *)v57[5];
                    v57[5] = v20;

                    uint64_t v19 = (void *)v57[5];
                  }
                  [v19 addEntriesFromDictionary:v16];
                }
                if (v17 != v15)
                {
                  if (!v11)
                  {
                    id v22 = objc_alloc(MEMORY[0x263EFF9A0]);
                    unint64_t v23 = [v9 count];
                    if (v23 >= 2) {
                      uint64_t v24 = 2;
                    }
                    else {
                      uint64_t v24 = v23;
                    }
                    uint64_t v11 = (void *)[v22 initWithCapacity:v24];
                  }
                  [v11 setObject:v17 forKey:v14];
                }
                if ([v18 count])
                {
                  uint64_t v25 = (void *)v51[5];
                  if (!v25)
                  {
                    id v26 = objc_alloc(MEMORY[0x263EFF980]);
                    unint64_t v27 = [v9 count];
                    if (v27 >= 2) {
                      uint64_t v28 = 2;
                    }
                    else {
                      uint64_t v28 = v27;
                    }
                    uint64_t v29 = [v26 initWithCapacity:v28];
                    uint64_t v30 = (void *)v51[5];
                    v51[5] = v29;

                    uint64_t v25 = (void *)v51[5];
                  }
                  [v25 addObjectsFromArray:v18];
                }
              }
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v62 count:16];
        }
        while (v10);

        if (v11) {
          [v36 setObject:v11 forKey:@"children"];
        }
      }
      else
      {

        uint64_t v11 = 0;
      }
    }
  }
  if (a4)
  {
    unint64_t v31 = (void *)[(id)v57[5] count];
    if (v31) {
      unint64_t v31 = (void *)v57[5];
    }
    *a4 = v31;
  }
  if (a5) {
    *a5 = v36;
  }
  if (a6) {
    *a6 = (id) v51[5];
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);
}

void sub_21BE5A914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_21BE5B9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23079(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23080(uint64_t a1)
{
}

void sub_21BE601F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23590(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23591(uint64_t a1)
{
}

void sub_21BE61950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose((const void *)(v39 - 224), 8);
  objc_destroyWeak(v38);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__23808(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__23809(uint64_t a1)
{
}

void __Block_byref_object_copy__86(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__87(uint64_t a1)
{
}

void sub_21BE64AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24017(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24018(uint64_t a1)
{
}

void sub_21BE65964(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21BE6609C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE6A898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24262(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24263(uint64_t a1)
{
}

void sub_21BE6D384(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21BE6DA60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void _MPCHandleProcessTapBuffer(void *a1, OpaqueAudioQueue *a2, AudioQueueBuffer *a3, uint64_t a4, uint64_t a5, const AudioStreamPacketDescription *a6)
{
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
  os_unfair_lock_lock((os_unfair_lock_t)&_activeTapsLock);
  int v12 = [(id)_activeTaps containsObject:v11];
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeTapsLock);

  if (v12)
  {
    id v14 = a1;
    if ([v14 isEnabled])
    {
      char v13 = [v14 delegate];
      [v13 processAudioTapDidReceiveAudioSamples:a3->mAudioData numberOfSamples:a5];

      AudioQueueEnqueueBuffer(a2, a3, 0, a6);
    }
  }
}

void sub_21BE742EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSASelfLoggerClass_block_invoke(uint64_t a1)
{
  SiriAudioSupportLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SASelfLogger");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSASelfLoggerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSASelfLoggerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPCSiriSelfLogger.m", 38, @"Unable to find class %s", "SASelfLogger");

    __break(1u);
  }
}

void __getSASelfLoggerMWTMusicMetadataClass_block_invoke(uint64_t a1)
{
  SiriAudioSupportLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SASelfLoggerMWTMusicMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSASelfLoggerMWTMusicMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getSASelfLoggerMWTMusicMetadataClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPCSiriSelfLogger.m", 39, @"Unable to find class %s", "SASelfLoggerMWTMusicMetadata");

    __break(1u);
  }
}

void SiriAudioSupportLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SiriAudioSupportLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2643C4628;
    uint64_t v5 = 0;
    SiriAudioSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *SiriAudioSupportLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"MPCSiriSelfLogger.m", 37, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  os_log_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SiriAudioSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriAudioSupportLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__25989(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25990(uint64_t a1)
{
}

__CFString *NSStringFromMPCPlayerAudioFormatTier(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown-%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C47B0[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCPlayerAudioRouteType(unint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown-%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643C47D8[a1];
  }

  return v1;
}

__CFString *NSStringFromMPCPlayerAudioFormatRenderingMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_2643C4788[a1 - 1];
  }
}

__CFString *NSStringFromMPCPlayerAudioFormatJustification(uint64_t a1)
{
  if (a1 <= 100)
  {
    switch(a1)
    {
      case 0:
        uint64_t v2 = @"Unknown";
        return v2;
      case 1:
        uint64_t v2 = @"Unavailable";
        return v2;
      case 100:
        uint64_t v2 = @"UserPreference";
        return v2;
    }
LABEL_28:
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown-%ld", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 > 500)
  {
    if (a1 == 501)
    {
      uint64_t v2 = @"RouteUnknownCompatibility";
      return v2;
    }
    if (a1 == 1000)
    {
      uint64_t v2 = @"BandwidthInsufficient";
      return v2;
    }
    goto LABEL_28;
  }
  if (a1 != 101)
  {
    if (a1 == 500)
    {
      uint64_t v2 = @"RouteIncompatible";
      return v2;
    }
    goto LABEL_28;
  }
  uint64_t v2 = @"UserDownload";
  return v2;
}

uint64_t MPCPlayerAudioFormatRenderingModeFrom(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

id NSStringComponentsFromMPCPlayerAudioFormatTierPreference(unint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  for (unint64_t i = 0; i != 64; ++i)
  {
    if ((a1 >> i))
    {
      long long v4 = NSStringFromMPCPlayerAudioFormatTier(i);
      [v2 addObject:v4];
    }
  }
  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

id _MPCJSONSanitizedValue(void *a1)
{
  id v1 = a1;
  if (_NSIsNSArray())
  {
    uint64_t v2 = objc_msgSend(v1, "msv_compactMap:", &__block_literal_global_401);
  }
  else
  {
    if (!_NSIsNSDictionary())
    {
      if ((_NSIsNSNumber() & 1) != 0 || _NSIsNSString()) {
        id v5 = v1;
      }
      else {
        id v5 = 0;
      }
      goto LABEL_13;
    }
    uint64_t v2 = objc_msgSend(v1, "msv_compactMapValues:", &__block_literal_global_403);
  }
  id v3 = v2;
  if ([v2 count]) {
    long long v4 = v3;
  }
  else {
    long long v4 = 0;
  }
  id v5 = v4;

LABEL_13:

  return v5;
}

uint64_t _MPCProtoRadioContentReferenceLibraryAlbumContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  long long v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    long long v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_39;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_41:
        uint64_t v32 = 16;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = *(void **)(a1 + 24);
            *(void *)(a1 + 24) = v18;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v2_Block_object_dispose(&a9, 8) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0) {
            goto LABEL_43;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_45:
        uint64_t v32 = 8;
      }
      *(void *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BE7D288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BE7E704(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28165(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28166(uint64_t a1)
{
}

_MPCProtoRadioContentReference *_MPCProtoRadioContentReferenceFromICRadioContentReference(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    id v3 = v1;
    long long v4 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryAlbumContentReference);
    id v5 = [v3 albumName];
    if ([v5 length] && v4) {
      objc_storeStrong((id *)&v4->_albumName, v5);
    }
    uint64_t v6 = [v3 representativeCloudIdentifier];
    long long v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 longLongValue];
      if (v4)
      {
        *(unsigned char *)&v4->_has |= 1u;
        v4->_representativeItemCloudID = v8;
      }
    }
    unsigned int v9 = [v3 storeIdentifier];
    unint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 longLongValue];
      if (v4)
      {
        *(unsigned char *)&v4->_has |= 2u;
        v4->_storeAdamID = v11;
      }
    }
    if (!v2) {
      goto LABEL_26;
    }
    uint64_t v12 = 8;
LABEL_25:
    objc_storeStrong((id *)((char *)&v2->super.super.isa + v12), v4);
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    id v13 = v1;
    long long v4 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryArtistContentReference);
    id v5 = [v13 artistName];
    if ([v5 length] && v4) {
      objc_storeStrong((id *)&v4->_albumName, v5);
    }
    BOOL v14 = [v13 representativeCloudIdentifier];
    long long v7 = v14;
    if (v14)
    {
      uint64_t v15 = [v14 longLongValue];
      if (v4)
      {
        *(unsigned char *)&v4->_has |= 1u;
        v4->_representativeItemCloudID = v15;
      }
    }
    id v16 = [v13 storeIdentifier];
    unint64_t v10 = v16;
    if (v16)
    {
      uint64_t v17 = [v16 longLongValue];
      if (v4)
      {
        *(unsigned char *)&v4->_has |= 2u;
        v4->_storeAdamID = v17;
      }
    }
    if (!v2) {
      goto LABEL_26;
    }
    uint64_t v12 = 16;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    id v19 = v1;
    long long v4 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryItemContentReference);
    id v5 = [v19 albumArtistName];
    if ([v5 length] && v4) {
      objc_storeStrong((id *)&v4[1].super.super.isa, v5);
    }
    char v20 = [v19 albumName];
    if ([v20 length] && v4) {
      objc_storeStrong((id *)&v4[1]._storeAdamID, v20);
    }
    unsigned int v21 = [v19 artistName];
    if ([v21 length] && v4) {
      objc_storeStrong((id *)&v4[1]._has, v21);
    }
    uint64_t v22 = [v19 composerName];
    if ([v22 length] && v4) {
      objc_storeStrong((id *)&v4[2].super.super.isa, v22);
    }
    uint64_t v23 = [v19 copyright];
    if ([v23 length] && v4) {
      objc_storeStrong((id *)&v4[2]._storeAdamID, v23);
    }
    uint64_t v62 = [v19 discCount];
    if (v62)
    {
      int v24 = [v62 integerValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x10u;
        LODWORD(v4[1]._representativeItemCloudID) = v24;
      }
    }
    char v25 = [v19 discNumber];
    char v26 = v25;
    if (v25)
    {
      int v27 = [v25 integerValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x80u;
        LODWORD(v4[2]._albumName) = v27;
      }
    }
    id v61 = [v19 fileSize];
    if (v61)
    {
      [v61 doubleValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 4u;
        v4->_albumName = v28;
      }
    }
    id obj = [v19 genreName];
    if ([obj length] && v4) {
      objc_storeStrong((id *)&v4[2]._has, obj);
    }
    uint64_t v56 = v21;
    char v60 = [v19 isCompilation];
    if (v60)
    {
      char v29 = [v60 BOOLValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x400u;
        LOBYTE(v4[3]._storeAdamID) = v29;
      }
    }
    char v30 = v20;
    uint64_t v59 = [v19 duration];
    if (v59)
    {
      [v59 doubleValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 2u;
        v4->_storeAdamID = v31;
      }
    }
    uint64_t v32 = [v19 kind];
    uint64_t v52 = v32;
    if ([v32 isEqualToString:*MEMORY[0x263F88F80]])
    {
      int v33 = 2;
    }
    else if ([v32 isEqualToString:*MEMORY[0x263F88F88]])
    {
      int v33 = 1;
    }
    else if ([v32 isEqualToString:*MEMORY[0x263F88F90]])
    {
      int v33 = 3;
    }
    else if ([v32 isEqualToString:*MEMORY[0x263F88F98]])
    {
      int v33 = 4;
    }
    else
    {
      int v33 = 0;
    }
    unsigned int v53 = v26;
    if (v4)
    {
      WORD2(v4[3]._storeAdamID) |= 0x40u;
      LODWORD(v4[2]._representativeItemCloudID) = v33;
    }
    id v55 = v22;
    unint64_t v37 = [v19 name];
    if ([v37 length] && v4) {
      objc_storeStrong((id *)&v4[3].super.super.isa, v37);
    }
    uint64_t v54 = v23;
    char v38 = [v19 storeAdamIdentifier];
    uint64_t v39 = v38;
    if (v38)
    {
      uint64_t v40 = [v38 longLongValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 8u;
        *(void *)&v4->_has = v40;
      }
    }
    unint64_t v57 = v30;
    uint64_t v41 = [v19 storeCloudIdentifier];
    id v42 = v41;
    if (v41)
    {
      uint64_t v43 = [v41 longLongValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 1u;
        v4->_representativeItemCloudID = v43;
      }
    }
    id v44 = [v19 trackCount];
    if (v44)
    {
      int v45 = [v62 integerValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x20u;
        LODWORD(v4[1]._albumName) = v45;
      }
    }
    long long v46 = [v19 trackNumber];
    long long v47 = v46;
    if (v46)
    {
      int v48 = [v46 integerValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x100u;
        LODWORD(v4[3]._representativeItemCloudID) = v48;
      }
    }
    char v49 = [v19 year];
    uint64_t v50 = v49;
    if (v49)
    {
      int v51 = [v49 integerValue];
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x200u;
        HIDWORD(v4[3]._representativeItemCloudID) = v51;
      }
    }
    if (v2) {
      objc_storeStrong((id *)&v2->_libraryItemContentReference, v4);
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    id v34 = v1;
    long long v4 = objc_alloc_init(_MPCProtoRadioContentReferenceStoreContentReference);
    uint64_t v35 = [v34 storeIdentifier];
    id v5 = v35;
    if (v35)
    {
      uint64_t v36 = [v35 longLongValue];
      if (v4)
      {
        LOBYTE(v4->_storeAdamID) |= 1u;
        v4->_representativeItemCloudID = v36;
      }
    }
    goto LABEL_27;
  }
  uint64_t v2 = 0;
LABEL_28:

  return v2;
}

id _MPCProtoRadioContentReferenceToICRadioContentReference(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = (void *)v1[4];
    if (v3)
    {
      long long v4 = v3;
      if (v4[1])
      {
        id v5 = (void *)MEMORY[0x263F89280];
        uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:");
        id v7 = [v5 storeItemWithIdentifier:v6];
LABEL_19:

        goto LABEL_20;
      }
      id v7 = 0;
      goto LABEL_20;
    }
    uint64_t v8 = (void *)v1[1];
    if (v8)
    {
      long long v4 = v8;
      id v7 = objc_alloc_init(MEMORY[0x263F892A0]);
      unsigned int v9 = (void *)v4[3];
      if (v9)
      {
        id v10 = v9;
        [v7 setAlbumName:v10];
      }
      if (v4[2])
      {
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:");
        [v7 setStoreIdentifier:v11];
      }
      goto LABEL_17;
    }
    uint64_t v12 = (void *)v1[2];
    if (v12)
    {
      long long v4 = v12;
      id v7 = objc_alloc_init(MEMORY[0x263F892A8]);
      id v13 = (void *)v4[3];
      if (v13)
      {
        id v14 = v13;
        [v7 setArtistName:v14];
      }
      if (v4[2])
      {
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:");
        [v7 setStoreIdentifier:v15];
      }
LABEL_17:
      if (v4[1])
      {
        uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
        [v7 setRepresentativeCloudIdentifier:v6];
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_40;
    }
    id v16 = (void *)v1[3];
    if (v16)
    {
      long long v4 = v16;
      id v7 = objc_alloc_init(MEMORY[0x263F892B0]);
      uint64_t v17 = (void *)v4[5];
      if (v17)
      {
        id v18 = v17;
        [v7 setAlbumArtistName:v18];
      }
      id v19 = (void *)v4[7];
      if (v19)
      {
        id v20 = v19;
        [v7 setAlbumName:v20];
      }
      unsigned int v21 = (void *)v4[9];
      if (v21)
      {
        id v22 = v21;
        [v7 setArtistName:v22];
      }
      uint64_t v23 = (void *)v4[10];
      if (v23)
      {
        id v24 = v23;
        [v7 setComposerName:v24];
      }
      char v25 = (void *)v4[12];
      if (v25)
      {
        id v26 = v25;
        [v7 setCopyright:v26];
      }
      __int16 v27 = *((_WORD *)v4 + 70);
      if ((v27 & 0x10) != 0)
      {
        char v29 = [NSNumber numberWithInt:*((unsigned int *)v4 + 12)];
        [v7 setDiscCount:v29];

        __int16 v27 = *((_WORD *)v4 + 70);
        if ((v27 & 0x80) == 0)
        {
LABEL_34:
          if ((v27 & 4) == 0) {
            goto LABEL_35;
          }
          goto LABEL_45;
        }
      }
      else if ((v27 & 0x80) == 0)
      {
        goto LABEL_34;
      }
      char v30 = [NSNumber numberWithInt:*((unsigned int *)v4 + 26)];
      [v7 setDiscNumber:v30];

      __int16 v27 = *((_WORD *)v4 + 70);
      if ((v27 & 4) == 0)
      {
LABEL_35:
        if ((v27 & 0x400) == 0) {
          goto LABEL_36;
        }
        goto LABEL_46;
      }
LABEL_45:
      int64_t v31 = [NSNumber numberWithDouble:*((double *)v4 + 3)];
      [v7 setFileSize:v31];

      __int16 v27 = *((_WORD *)v4 + 70);
      if ((v27 & 0x400) == 0)
      {
LABEL_36:
        if ((v27 & 2) == 0) {
          goto LABEL_37;
        }
        goto LABEL_47;
      }
LABEL_46:
      uint64_t v32 = [NSNumber numberWithBool:*((unsigned __int8 *)v4 + 136)];
      [v7 setCompilation:v32];

      __int16 v27 = *((_WORD *)v4 + 70);
      if ((v27 & 2) == 0)
      {
LABEL_37:
        if ((v27 & 0x40) == 0) {
          goto LABEL_55;
        }
        goto LABEL_48;
      }
LABEL_47:
      int v33 = [NSNumber numberWithDouble:*((double *)v4 + 2)];
      [v7 setDuration:v33];

      if ((*((_WORD *)v4 + 70) & 0x40) == 0) {
        goto LABEL_55;
      }
LABEL_48:
      unsigned int v34 = *((_DWORD *)v4 + 22) - 1;
      if (v34 > 3) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = (__CFString *)**((id **)&unk_2643C5170 + v34);
      }
      if (v35) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = &stru_26CBCA930;
      }
      [v7 setKind:v36];

LABEL_55:
      unint64_t v37 = (void *)v4[15];
      if (v37)
      {
        id v38 = v37;
        [v7 setName:v38];
      }
      uint64_t v39 = v4[4];
      if (v39)
      {
        uint64_t v40 = [NSNumber numberWithLongLong:v4[4]];
        [v7 setStoreAdamIdentifier:v40];
      }
      if (v4[1])
      {
        uint64_t v41 = [NSNumber numberWithLongLong:v39];
        [v7 setStoreCloudIdentifier:v41];
      }
      __int16 v42 = *((_WORD *)v4 + 70);
      if ((v42 & 0x20) != 0)
      {
        uint64_t v43 = [NSNumber numberWithInt:*((unsigned int *)v4 + 16)];
        [v7 setTrackCount:v43];

        __int16 v42 = *((_WORD *)v4 + 70);
        if ((v42 & 0x100) == 0)
        {
LABEL_63:
          if ((v42 & 0x200) == 0) {
            goto LABEL_20;
          }
          goto LABEL_67;
        }
      }
      else if ((*((_WORD *)v4 + 70) & 0x100) == 0)
      {
        goto LABEL_63;
      }
      id v44 = [NSNumber numberWithInt:*((unsigned int *)v4 + 32)];
      [v7 setTrackNumber:v44];

      if ((*((_WORD *)v4 + 70) & 0x200) == 0) {
        goto LABEL_20;
      }
LABEL_67:
      uint64_t v6 = [NSNumber numberWithInt:*((unsigned int *)v4 + 33)];
      [v7 setYear:v6];
      goto LABEL_19;
    }
  }
  id v7 = 0;
LABEL_40:

  return v7;
}

void sub_21BE85C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29888(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29889(uint64_t a1)
{
}

void sub_21BE86580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MPCModelRadioGetTracksDialogIsRetryDialog_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 action];
  id v7 = [v6 kind];
  int v8 = [v7 isEqualToString:@"getTracks"];

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void _MPCAudioTapUnprepareCallback_30214(const opaqueMTAudioProcessingTap *a1)
{
  MTAudioProcessingTapGetStorage(a1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 unprepareTap:a1];
}

void _MPCAudioTapProcess_30215(const opaqueMTAudioProcessingTap *a1, CMItemCount a2, uint64_t a3, AudioBufferList *a4, CMItemCount *a5, MTAudioProcessingTapFlags *a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v12 = MTAudioProcessingTapGetStorage(a1);
  memset(&timeRangeOut, 0, sizeof(timeRangeOut));
  MTAudioProcessingTapGetSourceAudio(a1, a2, a4, a6, &timeRangeOut, a5);
  if (timeRangeOut.start.flags)
  {
    CMTimeValue value = -1;
    if ((timeRangeOut.duration.flags & 1) != 0
      && !timeRangeOut.duration.epoch
      && (timeRangeOut.duration.value & 0x8000000000000000) == 0)
    {
      CMTimeValue value = timeRangeOut.start.value;
      if (timeRangeOut.start.value <= -2)
      {
        id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          CMTimeValue v24 = value;
          __int16 v25 = 2048;
          uint64_t v26 = _MPCAudioTapProcess_lastIndex + a2;
          _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[AP] - correcting time range start for tap: %lld -> %lld", buf, 0x16u);
        }

        CMTimeValue value = _MPCAudioTapProcess_lastIndex + a2;
      }
    }
  }
  else
  {
    CMTimeValue value = -1;
  }
  uint64_t v15 = [MEMORY[0x263F12178] standardUserDefaults];
  int v16 = [v15 vocalAttenuationLogInputAndOuputRMSValues];

  if (v16)
  {
    MTAudioProcessingTapFlags v17 = *a6;
    id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] ======================================================================================================", buf, 2u);
    }

    id v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (timeRangeOut.start.flags)
      {
        BOOL v20 = 0;
        if ((timeRangeOut.duration.flags & 1) != 0 && !timeRangeOut.duration.epoch) {
          BOOL v20 = timeRangeOut.duration.value >= 0;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
      CMItemCount v21 = *a5;
      *(_DWORD *)buf = 134219776;
      CMTimeValue v24 = value;
      __int16 v25 = 2048;
      uint64_t v26 = value - _MPCAudioTapProcess_lastIndex;
      __int16 v27 = 1024;
      BOOL v28 = v20;
      __int16 v29 = 1024;
      int v30 = timeRangeOut.start.flags & 1;
      __int16 v31 = 2048;
      CMItemCount v32 = a2;
      __int16 v33 = 2048;
      CMItemCount v34 = v21;
      __int16 v35 = 1024;
      int v36 = (v17 >> 8) & 1;
      __int16 v37 = 1024;
      int v38 = (v17 >> 9) & 1;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - start: %lld - delta: %lld - valid range: %{BOOL}u - valid time: %{BOOL}u - numberFrames: %ld - numberFramesOut: %ld - startOfStream: %{BOOL}u - endOfStream: %{BOOL}u", buf, 0x42u);
    }
  }
  _MPCAudioTapProcess_lastIndex = value;
  [v12 processTap:a1 sampleIndex:value numberFrames:a2 flags:a3 audioBufferList:a4 numberFramesOut:a5 flagsOut:a6];
}

void _MPCAudioTapPrepareCallback_30220(const opaqueMTAudioProcessingTap *a1, uint64_t a2, uint64_t a3)
{
  MTAudioProcessingTapGetStorage(a1);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 prepareTap:a1 maxFrames:a2 processingFormat:a3];
}

void _MPCAudioTapFinalize_30221(const opaqueMTAudioProcessingTap *a1)
{
  MTAudioProcessingTapGetStorage(a1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finalizeTap:a1];
}

void _MPCAudioTapInit_30222(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = a2;
}

void sub_21BE889D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__30223(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30224(uint64_t a1)
{
}

uint64_t _MPCProtoDelegateInfoTokenEReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  long long v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 0u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 24;
          goto LABEL_23;
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 32;
LABEL_23:
          CMItemCount v21 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 2u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v24 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v24 = 0;
          }
          *(void *)(a1 + _Block_object_dispose(&a9, 8) = v24;
          continue;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        uint64_t v29 = *(void *)(a2 + v28);
        unint64_t v30 = v29 + 1;
        if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v2_Block_object_dispose(&a9, 8) = v30;
        v27 |= (unint64_t)(v31 & 0x7F) << v25;
        if ((v31 & 0x80) == 0) {
          goto LABEL_35;
        }
        v25 += 7;
        BOOL v15 = v26++ >= 9;
        if (v15)
        {
          uint64_t v27 = 0;
          goto LABEL_37;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v27 = 0;
      }
LABEL_37:
      *(void *)(a1 + 16) = v27;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21BE8A1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

id getAFSecurityConnectionClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getAFSecurityConnectionClass_softClass;
  uint64_t v7 = getAFSecurityConnectionClass_softClass;
  if (!getAFSecurityConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFSecurityConnectionClass_block_invoke;
    v3[3] = &unk_2643C57E0;
    v3[4] = &v4;
    __getAFSecurityConnectionClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_21BE8A2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFSecurityConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    uint64_t v6[2] = (void *)3221225472;
    v6[3] = __AssistantServicesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_2643C5640;
    uint64_t v8 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MPCAssistantEncodings.m", 16, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("AFSecurityConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getAFSecurityConnectionClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPCAssistantEncodings.m", 17, @"Unable to find class %s", "AFSecurityConnection");

LABEL_10:
    __break(1u);
  }
  getAFSecurityConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21BE8BB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE8BEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21BE8C454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30707(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30708(uint64_t a1)
{
}

uint64_t MPCRadioPlaybackErrorGetCategory(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"MPCRadioPlaybackErrorCategoryKey"];
  if (_NSIsNSNumber()) {
    uint64_t v3 = [v2 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __Block_byref_object_copy__30816(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30817(uint64_t a1)
{
}

void sub_21BE93EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BE95304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BE96CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_21BE9AD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31606(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31607(uint64_t a1)
{
}

void sub_21BE9C43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32062(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32063(uint64_t a1)
{
}

void sub_21BE9C75C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_21BEA269C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_21BEA4758(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x430], 8);
  _Block_object_dispose(&STACK[0x368], 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32625(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32626(uint64_t a1)
{
}

void sub_21BEA8328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21BEA85E8()
{
  return MEMORY[0x270F87860]();
}

uint64_t sub_21BEA85F8()
{
  return MEMORY[0x270F87868]();
}

uint64_t sub_21BEA8608()
{
  return MEMORY[0x270F87870]();
}

uint64_t sub_21BEA8628()
{
  return MEMORY[0x270F87880]();
}

uint64_t sub_21BEA8638()
{
  return MEMORY[0x270F87888]();
}

uint64_t sub_21BEA8648()
{
  return MEMORY[0x270F87890]();
}

uint64_t sub_21BEA8658()
{
  return MEMORY[0x270F87898]();
}

uint64_t sub_21BEA8668()
{
  return MEMORY[0x270F878A0]();
}

uint64_t sub_21BEA8678()
{
  return MEMORY[0x270F878A8]();
}

uint64_t sub_21BEA8688()
{
  return MEMORY[0x270F878B0]();
}

uint64_t sub_21BEA8698()
{
  return MEMORY[0x270F878B8]();
}

uint64_t sub_21BEA86A8()
{
  return MEMORY[0x270F878C0]();
}

uint64_t sub_21BEA86B8()
{
  return MEMORY[0x270F878C8]();
}

uint64_t sub_21BEA86C8()
{
  return MEMORY[0x270F878D0]();
}

uint64_t sub_21BEA86D8()
{
  return MEMORY[0x270F878D8]();
}

uint64_t sub_21BEA86E8()
{
  return MEMORY[0x270F878E0]();
}

uint64_t sub_21BEA8708()
{
  return MEMORY[0x270F878F0]();
}

uint64_t sub_21BEA8718()
{
  return MEMORY[0x270F878F8]();
}

uint64_t sub_21BEA8728()
{
  return MEMORY[0x270F87900]();
}

uint64_t sub_21BEA8738()
{
  return MEMORY[0x270F87908]();
}

uint64_t sub_21BEA8748()
{
  return MEMORY[0x270F87910]();
}

uint64_t sub_21BEA8758()
{
  return MEMORY[0x270F87918]();
}

uint64_t sub_21BEA8768()
{
  return MEMORY[0x270F87920]();
}

uint64_t sub_21BEA8778()
{
  return MEMORY[0x270F87928]();
}

uint64_t sub_21BEA8788()
{
  return MEMORY[0x270F87930]();
}

uint64_t sub_21BEA8798()
{
  return MEMORY[0x270F87938]();
}

uint64_t sub_21BEA87A8()
{
  return MEMORY[0x270F87940]();
}

uint64_t sub_21BEA87B8()
{
  return MEMORY[0x270F87948]();
}

uint64_t sub_21BEA87C8()
{
  return MEMORY[0x270F87950]();
}

uint64_t sub_21BEA87D8()
{
  return MEMORY[0x270F87958]();
}

uint64_t sub_21BEA87E8()
{
  return MEMORY[0x270F87960]();
}

uint64_t sub_21BEA87F8()
{
  return MEMORY[0x270F87968]();
}

uint64_t sub_21BEA8808()
{
  return MEMORY[0x270F87970]();
}

uint64_t sub_21BEA8818()
{
  return MEMORY[0x270F87978]();
}

uint64_t sub_21BEA8828()
{
  return MEMORY[0x270F87980]();
}

uint64_t sub_21BEA8838()
{
  return MEMORY[0x270F87988]();
}

uint64_t sub_21BEA8848()
{
  return MEMORY[0x270F87990]();
}

uint64_t sub_21BEA8858()
{
  return MEMORY[0x270F87998]();
}

uint64_t sub_21BEA8868()
{
  return MEMORY[0x270F879A0]();
}

uint64_t sub_21BEA8878()
{
  return MEMORY[0x270F879A8]();
}

uint64_t sub_21BEA8888()
{
  return MEMORY[0x270F879B0]();
}

uint64_t sub_21BEA8898()
{
  return MEMORY[0x270F879B8]();
}

uint64_t sub_21BEA88A8()
{
  return MEMORY[0x270F879C0]();
}

uint64_t sub_21BEA88B8()
{
  return MEMORY[0x270F879C8]();
}

uint64_t sub_21BEA88C8()
{
  return MEMORY[0x270F879D0]();
}

uint64_t sub_21BEA88D8()
{
  return MEMORY[0x270F879D8]();
}

uint64_t sub_21BEA88E8()
{
  return MEMORY[0x270F879E0]();
}

uint64_t sub_21BEA88F8()
{
  return MEMORY[0x270F879E8]();
}

uint64_t sub_21BEA8908()
{
  return MEMORY[0x270F879F0]();
}

uint64_t sub_21BEA8918()
{
  return MEMORY[0x270F879F8]();
}

uint64_t sub_21BEA8928()
{
  return MEMORY[0x270F87A00]();
}

uint64_t sub_21BEA8938()
{
  return MEMORY[0x270F87A08]();
}

uint64_t sub_21BEA8948()
{
  return MEMORY[0x270F87A10]();
}

uint64_t sub_21BEA8958()
{
  return MEMORY[0x270F87A18]();
}

uint64_t sub_21BEA8968()
{
  return MEMORY[0x270F87A20]();
}

uint64_t sub_21BEA8978()
{
  return MEMORY[0x270F87A28]();
}

uint64_t sub_21BEA8988()
{
  return MEMORY[0x270F87A30]();
}

uint64_t sub_21BEA8998()
{
  return MEMORY[0x270F87A38]();
}

uint64_t sub_21BEA89A8()
{
  return MEMORY[0x270F87A40]();
}

uint64_t sub_21BEA89B8()
{
  return MEMORY[0x270F87A48]();
}

uint64_t sub_21BEA89C8()
{
  return MEMORY[0x270F87A50]();
}

uint64_t sub_21BEA89D8()
{
  return MEMORY[0x270F87A58]();
}

uint64_t sub_21BEA89E8()
{
  return MEMORY[0x270F87A60]();
}

uint64_t sub_21BEA89F8()
{
  return MEMORY[0x270F87A68]();
}

uint64_t sub_21BEA8A08()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_21BEA8A18()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_21BEA8A28()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_21BEA8A38()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_21BEA8A48()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_21BEA8A58()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_21BEA8A68()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_21BEA8A78()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_21BEA8A88()
{
  return MEMORY[0x270EEF760]();
}

uint64_t sub_21BEA8AD8()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_21BEA8B08()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21BEA8B18()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21BEA8B28()
{
  return MEMORY[0x270EEF9D8]();
}

uint64_t sub_21BEA8B38()
{
  return MEMORY[0x270EEF9E0]();
}

uint64_t sub_21BEA8B48()
{
  return MEMORY[0x270EEF9E8]();
}

uint64_t sub_21BEA8B58()
{
  return MEMORY[0x270EEFA68]();
}

uint64_t sub_21BEA8B68()
{
  return MEMORY[0x270EEFA70]();
}

uint64_t sub_21BEA8B78()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_21BEA8B88()
{
  return MEMORY[0x270EEFBA8]();
}

uint64_t sub_21BEA8B98()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_21BEA8BA8()
{
  return MEMORY[0x270F541B0]();
}

uint64_t sub_21BEA8BB8()
{
  return MEMORY[0x270F541B8]();
}

uint64_t sub_21BEA8BC8()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_21BEA8BD8()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_21BEA8BE8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_21BEA8BF8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21BEA8C08()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_21BEA8C18()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21BEA8C28()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_21BEA8C38()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_21BEA8C48()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_21BEA8C58()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21BEA8C68()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_21BEA8C78()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21BEA8C88()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21BEA8C98()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_21BEA8CA8()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_21BEA8CB8()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_21BEA8CC8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21BEA8CD8()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_21BEA8CE8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_21BEA8CF8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21BEA8D08()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21BEA8D18()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21BEA8D28()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21BEA8D38()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_21BEA8D48()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21BEA8D58()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21BEA8D68()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_21BEA8D78()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_21BEA8D88()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_21BEA8D98()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_21BEA8DA8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_21BEA8DB8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21BEA8DC8()
{
  return MEMORY[0x270EF1460]();
}

uint64_t sub_21BEA8DD8()
{
  return MEMORY[0x270EF1490]();
}

uint64_t sub_21BEA8DE8()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_21BEA8DF8()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_21BEA8E08()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_21BEA8E18()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_21BEA8E28()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_21BEA8E38()
{
  return MEMORY[0x270F58BD0]();
}

uint64_t sub_21BEA8E48()
{
  return MEMORY[0x270F58BD8]();
}

uint64_t sub_21BEA8E58()
{
  return MEMORY[0x270F58BE0]();
}

uint64_t sub_21BEA8E68()
{
  return MEMORY[0x270F58BE8]();
}

uint64_t sub_21BEA8E78()
{
  return MEMORY[0x270F58BF0]();
}

uint64_t sub_21BEA8E88()
{
  return MEMORY[0x270F58BF8]();
}

uint64_t sub_21BEA8E98()
{
  return MEMORY[0x270F58C00]();
}

uint64_t sub_21BEA8EA8()
{
  return MEMORY[0x270F58C08]();
}

uint64_t sub_21BEA8EB8()
{
  return MEMORY[0x270F58C10]();
}

uint64_t sub_21BEA8EC8()
{
  return MEMORY[0x270F58C18]();
}

uint64_t sub_21BEA8ED8()
{
  return MEMORY[0x270F58C20]();
}

uint64_t sub_21BEA8EE8()
{
  return MEMORY[0x270F58C28]();
}

uint64_t sub_21BEA8EF8()
{
  return MEMORY[0x270F58C30]();
}

uint64_t sub_21BEA8F08()
{
  return MEMORY[0x270F9C7E0]();
}

uint64_t sub_21BEA8F18()
{
  return MEMORY[0x270F9C818]();
}

uint64_t sub_21BEA8F28()
{
  return MEMORY[0x270F9C830]();
}

uint64_t sub_21BEA8F38()
{
  return MEMORY[0x270F9C840]();
}

uint64_t sub_21BEA8F48()
{
  return MEMORY[0x270F9C848]();
}

uint64_t sub_21BEA8F58()
{
  return MEMORY[0x270F9C858]();
}

uint64_t sub_21BEA8F68()
{
  return MEMORY[0x270F9C878]();
}

uint64_t sub_21BEA8F78()
{
  return MEMORY[0x270F9C880]();
}

uint64_t sub_21BEA8F88()
{
  return MEMORY[0x270F9C890]();
}

uint64_t sub_21BEA8F98()
{
  return MEMORY[0x270F763B0]();
}

uint64_t sub_21BEA8FA8()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_21BEA8FB8()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_21BEA8FC8()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_21BEA8FD8()
{
  return MEMORY[0x270F763B8]();
}

uint64_t sub_21BEA8FE8()
{
  return MEMORY[0x270F763C0]();
}

uint64_t sub_21BEA9008()
{
  return MEMORY[0x270F763D0]();
}

uint64_t sub_21BEA9018()
{
  return MEMORY[0x270F76590]();
}

uint64_t sub_21BEA9028()
{
  return MEMORY[0x270F76598]();
}

uint64_t sub_21BEA9038()
{
  return MEMORY[0x270F76608]();
}

uint64_t sub_21BEA9048()
{
  return MEMORY[0x270F76618]();
}

uint64_t sub_21BEA9058()
{
  return MEMORY[0x270F76638]();
}

uint64_t sub_21BEA9068()
{
  return MEMORY[0x270F76648]();
}

uint64_t sub_21BEA9078()
{
  return MEMORY[0x270F76650]();
}

uint64_t sub_21BEA9088()
{
  return MEMORY[0x270F76658]();
}

uint64_t sub_21BEA90A8()
{
  return MEMORY[0x270F76670]();
}

uint64_t sub_21BEA90B8()
{
  return MEMORY[0x270F76680]();
}

uint64_t sub_21BEA90C8()
{
  return MEMORY[0x270F76688]();
}

uint64_t sub_21BEA90D8()
{
  return MEMORY[0x270F766B8]();
}

uint64_t sub_21BEA90E8()
{
  return MEMORY[0x270F766C0]();
}

uint64_t sub_21BEA90F8()
{
  return MEMORY[0x270F541D0]();
}

uint64_t sub_21BEA9108()
{
  return MEMORY[0x270F541D8]();
}

uint64_t sub_21BEA9118()
{
  return MEMORY[0x270F541E0]();
}

uint64_t sub_21BEA9128()
{
  return MEMORY[0x270F541E8]();
}

uint64_t sub_21BEA9138()
{
  return MEMORY[0x270F541F0]();
}

uint64_t sub_21BEA9148()
{
  return MEMORY[0x270F541F8]();
}

uint64_t sub_21BEA9158()
{
  return MEMORY[0x270F54200]();
}

uint64_t sub_21BEA9168()
{
  return MEMORY[0x270F54208]();
}

uint64_t sub_21BEA9178()
{
  return MEMORY[0x270F54210]();
}

uint64_t sub_21BEA9188()
{
  return MEMORY[0x270F54218]();
}

uint64_t sub_21BEA9198()
{
  return MEMORY[0x270F54220]();
}

uint64_t sub_21BEA91A8()
{
  return MEMORY[0x270F54228]();
}

uint64_t sub_21BEA91B8()
{
  return MEMORY[0x270F54230]();
}

uint64_t sub_21BEA91C8()
{
  return MEMORY[0x270F54238]();
}

uint64_t sub_21BEA91D8()
{
  return MEMORY[0x270F54240]();
}

uint64_t sub_21BEA91E8()
{
  return MEMORY[0x270F54248]();
}

uint64_t sub_21BEA91F8()
{
  return MEMORY[0x270F54250]();
}

uint64_t sub_21BEA9208()
{
  return MEMORY[0x270F54258]();
}

uint64_t sub_21BEA9218()
{
  return MEMORY[0x270F54260]();
}

uint64_t sub_21BEA9228()
{
  return MEMORY[0x270F54268]();
}

uint64_t sub_21BEA9238()
{
  return MEMORY[0x270F54270]();
}

uint64_t sub_21BEA9248()
{
  return MEMORY[0x270F54278]();
}

uint64_t sub_21BEA9258()
{
  return MEMORY[0x270F54280]();
}

uint64_t sub_21BEA9268()
{
  return MEMORY[0x270F54288]();
}

uint64_t sub_21BEA9278()
{
  return MEMORY[0x270F54290]();
}

uint64_t sub_21BEA9288()
{
  return MEMORY[0x270F54298]();
}

uint64_t sub_21BEA9298()
{
  return MEMORY[0x270F542A0]();
}

uint64_t sub_21BEA92A8()
{
  return MEMORY[0x270F542A8]();
}

uint64_t sub_21BEA92B8()
{
  return MEMORY[0x270F542B0]();
}

uint64_t sub_21BEA92C8()
{
  return MEMORY[0x270F542B8]();
}

uint64_t sub_21BEA92D8()
{
  return MEMORY[0x270F542C0]();
}

uint64_t sub_21BEA92E8()
{
  return MEMORY[0x270F542C8]();
}

uint64_t sub_21BEA92F8()
{
  return MEMORY[0x270F542D0]();
}

uint64_t sub_21BEA9308()
{
  return MEMORY[0x270F542D8]();
}

uint64_t sub_21BEA9318()
{
  return MEMORY[0x270F542E0]();
}

uint64_t sub_21BEA9328()
{
  return MEMORY[0x270F542E8]();
}

uint64_t sub_21BEA9338()
{
  return MEMORY[0x270F542F0]();
}

uint64_t sub_21BEA9348()
{
  return MEMORY[0x270F542F8]();
}

uint64_t sub_21BEA9358()
{
  return MEMORY[0x270F54300]();
}

uint64_t sub_21BEA9368()
{
  return MEMORY[0x270F54308]();
}

uint64_t sub_21BEA9378()
{
  return MEMORY[0x270F54310]();
}

uint64_t sub_21BEA9388()
{
  return MEMORY[0x270F54318]();
}

uint64_t sub_21BEA9398()
{
  return MEMORY[0x270F54320]();
}

uint64_t sub_21BEA93A8()
{
  return MEMORY[0x270F54328]();
}

uint64_t sub_21BEA93B8()
{
  return MEMORY[0x270F54330]();
}

uint64_t sub_21BEA93C8()
{
  return MEMORY[0x270F54338]();
}

uint64_t sub_21BEA93D8()
{
  return MEMORY[0x270F54340]();
}

uint64_t sub_21BEA93E8()
{
  return MEMORY[0x270F54348]();
}

uint64_t sub_21BEA93F8()
{
  return MEMORY[0x270F54350]();
}

uint64_t sub_21BEA9408()
{
  return MEMORY[0x270F54358]();
}

uint64_t sub_21BEA9418()
{
  return MEMORY[0x270F54360]();
}

uint64_t sub_21BEA9428()
{
  return MEMORY[0x270F54368]();
}

uint64_t sub_21BEA9438()
{
  return MEMORY[0x270F54370]();
}

uint64_t sub_21BEA9448()
{
  return MEMORY[0x270F54378]();
}

uint64_t sub_21BEA9458()
{
  return MEMORY[0x270F54380]();
}

uint64_t sub_21BEA9468()
{
  return MEMORY[0x270F54388]();
}

uint64_t sub_21BEA9478()
{
  return MEMORY[0x270F54390]();
}

uint64_t sub_21BEA9488()
{
  return MEMORY[0x270F54398]();
}

uint64_t sub_21BEA9498()
{
  return MEMORY[0x270F543A0]();
}

uint64_t sub_21BEA94A8()
{
  return MEMORY[0x270F543A8]();
}

uint64_t sub_21BEA94B8()
{
  return MEMORY[0x270F543B0]();
}

uint64_t sub_21BEA94C8()
{
  return MEMORY[0x270F543B8]();
}

uint64_t sub_21BEA94D8()
{
  return MEMORY[0x270F543C0]();
}

uint64_t sub_21BEA94E8()
{
  return MEMORY[0x270F543C8]();
}

uint64_t sub_21BEA94F8()
{
  return MEMORY[0x270F543D0]();
}

uint64_t sub_21BEA9508()
{
  return MEMORY[0x270F543D8]();
}

uint64_t sub_21BEA9518()
{
  return MEMORY[0x270F543E0]();
}

uint64_t sub_21BEA9528()
{
  return MEMORY[0x270F543E8]();
}

uint64_t sub_21BEA9538()
{
  return MEMORY[0x270F543F0]();
}

uint64_t sub_21BEA9548()
{
  return MEMORY[0x270F543F8]();
}

uint64_t sub_21BEA9558()
{
  return MEMORY[0x270F54400]();
}

uint64_t sub_21BEA9568()
{
  return MEMORY[0x270F54408]();
}

uint64_t sub_21BEA9578()
{
  return MEMORY[0x270F54410]();
}

uint64_t sub_21BEA9588()
{
  return MEMORY[0x270F54418]();
}

uint64_t sub_21BEA9598()
{
  return MEMORY[0x270F54420]();
}

uint64_t sub_21BEA95A8()
{
  return MEMORY[0x270F54428]();
}

uint64_t sub_21BEA95B8()
{
  return MEMORY[0x270F54430]();
}

uint64_t sub_21BEA95C8()
{
  return MEMORY[0x270F54438]();
}

uint64_t sub_21BEA95D8()
{
  return MEMORY[0x270F54440]();
}

uint64_t sub_21BEA95E8()
{
  return MEMORY[0x270F54448]();
}

uint64_t sub_21BEA95F8()
{
  return MEMORY[0x270F54450]();
}

uint64_t sub_21BEA9608()
{
  return MEMORY[0x270F54458]();
}

uint64_t sub_21BEA9618()
{
  return MEMORY[0x270F54460]();
}

uint64_t sub_21BEA9628()
{
  return MEMORY[0x270F54468]();
}

uint64_t sub_21BEA9638()
{
  return MEMORY[0x270F54470]();
}

uint64_t sub_21BEA9648()
{
  return MEMORY[0x270F54478]();
}

uint64_t sub_21BEA9658()
{
  return MEMORY[0x270F54480]();
}

uint64_t sub_21BEA9668()
{
  return MEMORY[0x270F54488]();
}

uint64_t sub_21BEA9678()
{
  return MEMORY[0x270F544C0]();
}

uint64_t sub_21BEA9698()
{
  return MEMORY[0x270F544D0]();
}

uint64_t sub_21BEA96A8()
{
  return MEMORY[0x270F544D8]();
}

uint64_t sub_21BEA96B8()
{
  return MEMORY[0x270F544E0]();
}

uint64_t sub_21BEA96C8()
{
  return MEMORY[0x270F544E8]();
}

uint64_t sub_21BEA96D8()
{
  return MEMORY[0x270F544F0]();
}

uint64_t sub_21BEA96E8()
{
  return MEMORY[0x270F544F8]();
}

uint64_t sub_21BEA96F8()
{
  return MEMORY[0x270F54500]();
}

uint64_t sub_21BEA9708()
{
  return MEMORY[0x270F54508]();
}

uint64_t sub_21BEA9718()
{
  return MEMORY[0x270F54510]();
}

uint64_t sub_21BEA9728()
{
  return MEMORY[0x270F54518]();
}

uint64_t sub_21BEA9738()
{
  return MEMORY[0x270F54520]();
}

uint64_t sub_21BEA9758()
{
  return MEMORY[0x270F54530]();
}

uint64_t sub_21BEA9768()
{
  return MEMORY[0x270F54538]();
}

uint64_t sub_21BEA9778()
{
  return MEMORY[0x270F54540]();
}

uint64_t sub_21BEA9798()
{
  return MEMORY[0x270F54550]();
}

uint64_t sub_21BEA97A8()
{
  return MEMORY[0x270F54558]();
}

uint64_t sub_21BEA97B8()
{
  return MEMORY[0x270F54560]();
}

uint64_t sub_21BEA97C8()
{
  return MEMORY[0x270F54568]();
}

uint64_t sub_21BEA97D8()
{
  return MEMORY[0x270F54570]();
}

uint64_t sub_21BEA97E8()
{
  return MEMORY[0x270F54578]();
}

uint64_t sub_21BEA97F8()
{
  return MEMORY[0x270F545B0]();
}

uint64_t sub_21BEA9808()
{
  return MEMORY[0x270F545B8]();
}

uint64_t sub_21BEA9818()
{
  return MEMORY[0x270F545C0]();
}

uint64_t sub_21BEA9828()
{
  return MEMORY[0x270F545C8]();
}

uint64_t sub_21BEA9838()
{
  return MEMORY[0x270F545D0]();
}

uint64_t sub_21BEA9848()
{
  return MEMORY[0x270F545D8]();
}

uint64_t sub_21BEA9858()
{
  return MEMORY[0x270F545E0]();
}

uint64_t sub_21BEA9868()
{
  return MEMORY[0x270F545E8]();
}

uint64_t sub_21BEA9878()
{
  return MEMORY[0x270F545F0]();
}

uint64_t sub_21BEA9888()
{
  return MEMORY[0x270F545F8]();
}

uint64_t sub_21BEA9898()
{
  return MEMORY[0x270F54600]();
}

uint64_t sub_21BEA98A8()
{
  return MEMORY[0x270F54608]();
}

uint64_t sub_21BEA98B8()
{
  return MEMORY[0x270F54610]();
}

uint64_t sub_21BEA98C8()
{
  return MEMORY[0x270F54618]();
}

uint64_t sub_21BEA98D8()
{
  return MEMORY[0x270F54620]();
}

uint64_t sub_21BEA98E8()
{
  return MEMORY[0x270F54628]();
}

uint64_t sub_21BEA98F8()
{
  return MEMORY[0x270F54630]();
}

uint64_t sub_21BEA9908()
{
  return MEMORY[0x270F54638]();
}

uint64_t sub_21BEA9918()
{
  return MEMORY[0x270F54640]();
}

uint64_t sub_21BEA9928()
{
  return MEMORY[0x270F54648]();
}

uint64_t sub_21BEA9938()
{
  return MEMORY[0x270F54650]();
}

uint64_t sub_21BEA9948()
{
  return MEMORY[0x270F54658]();
}

uint64_t sub_21BEA9958()
{
  return MEMORY[0x270F54660]();
}

uint64_t sub_21BEA9968()
{
  return MEMORY[0x270F54668]();
}

uint64_t sub_21BEA9978()
{
  return MEMORY[0x270F54670]();
}

uint64_t sub_21BEA9988()
{
  return MEMORY[0x270F54678]();
}

uint64_t sub_21BEA9998()
{
  return MEMORY[0x270F54680]();
}

uint64_t sub_21BEA99B8()
{
  return MEMORY[0x270F54690]();
}

uint64_t sub_21BEA99C8()
{
  return MEMORY[0x270F54698]();
}

uint64_t sub_21BEA99D8()
{
  return MEMORY[0x270F546A0]();
}

uint64_t sub_21BEA99E8()
{
  return MEMORY[0x270F546A8]();
}

uint64_t sub_21BEA99F8()
{
  return MEMORY[0x270F546B0]();
}

uint64_t sub_21BEA9A08()
{
  return MEMORY[0x270F546B8]();
}

uint64_t sub_21BEA9A18()
{
  return MEMORY[0x270F546C0]();
}

uint64_t sub_21BEA9A28()
{
  return MEMORY[0x270F546C8]();
}

uint64_t sub_21BEA9A38()
{
  return MEMORY[0x270F546D0]();
}

uint64_t sub_21BEA9A48()
{
  return MEMORY[0x270F546D8]();
}

uint64_t sub_21BEA9A58()
{
  return MEMORY[0x270F546E0]();
}

uint64_t sub_21BEA9A68()
{
  return MEMORY[0x270F546E8]();
}

uint64_t sub_21BEA9A78()
{
  return MEMORY[0x270F546F0]();
}

uint64_t sub_21BEA9A88()
{
  return MEMORY[0x270F546F8]();
}

uint64_t sub_21BEA9A98()
{
  return MEMORY[0x270F54700]();
}

uint64_t sub_21BEA9AA8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_21BEA9AB8()
{
  return MEMORY[0x270F54708]();
}

uint64_t sub_21BEA9AC8()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_21BEA9AD8()
{
  return MEMORY[0x270F54710]();
}

uint64_t sub_21BEA9AE8()
{
  return MEMORY[0x270F54718]();
}

uint64_t sub_21BEA9AF8()
{
  return MEMORY[0x270F54720]();
}

uint64_t sub_21BEA9B08()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21BEA9B18()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21BEA9B28()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_21BEA9B38()
{
  return MEMORY[0x270EE3828]();
}

uint64_t sub_21BEA9B48()
{
  return MEMORY[0x270EE3880]();
}

uint64_t sub_21BEA9B58()
{
  return MEMORY[0x270EE38F8]();
}

uint64_t sub_21BEA9B68()
{
  return MEMORY[0x270EE3930]();
}

uint64_t sub_21BEA9B78()
{
  return MEMORY[0x270EE39C8]();
}

uint64_t sub_21BEA9B88()
{
  return MEMORY[0x270EE39D8]();
}

uint64_t sub_21BEA9B98()
{
  return MEMORY[0x270EE3A08]();
}

uint64_t sub_21BEA9BA8()
{
  return MEMORY[0x270EE3A10]();
}

uint64_t sub_21BEA9BB8()
{
  return MEMORY[0x270EE3A18]();
}

uint64_t sub_21BEA9BC8()
{
  return MEMORY[0x270EE3A48]();
}

uint64_t sub_21BEA9BD8()
{
  return MEMORY[0x270EE3AB8]();
}

uint64_t sub_21BEA9BE8()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t sub_21BEA9BF8()
{
  return MEMORY[0x270EE3AE0]();
}

uint64_t sub_21BEA9C08()
{
  return MEMORY[0x270EE3AE8]();
}

uint64_t sub_21BEA9C18()
{
  return MEMORY[0x270EE3AF0]();
}

uint64_t sub_21BEA9C28()
{
  return MEMORY[0x270EE3B10]();
}

uint64_t sub_21BEA9C38()
{
  return MEMORY[0x270EE3B40]();
}

uint64_t sub_21BEA9C48()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_21BEA9C58()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_21BEA9C68()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_21BEA9C78()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_21BEA9C88()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_21BEA9C98()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_21BEA9CA8()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_21BEA9CB8()
{
  return MEMORY[0x270EE3C78]();
}

uint64_t sub_21BEA9CC8()
{
  return MEMORY[0x270EE3CC8]();
}

uint64_t sub_21BEA9CD8()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_21BEA9CE8()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_21BEA9CF8()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_21BEA9D08()
{
  return MEMORY[0x270EE3EC8]();
}

uint64_t sub_21BEA9D18()
{
  return MEMORY[0x270EE3ED0]();
}

uint64_t sub_21BEA9D28()
{
  return MEMORY[0x270EE3ED8]();
}

uint64_t sub_21BEA9D38()
{
  return MEMORY[0x270EE3EE0]();
}

uint64_t sub_21BEA9D48()
{
  return MEMORY[0x270EE3EE8]();
}

uint64_t sub_21BEA9D58()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_21BEA9D68()
{
  return MEMORY[0x270EE3F38]();
}

uint64_t sub_21BEA9D78()
{
  return MEMORY[0x270EE3F50]();
}

uint64_t sub_21BEA9D88()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_21BEA9D98()
{
  return MEMORY[0x270EE3FC0]();
}

uint64_t sub_21BEA9DA8()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_21BEA9DB8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_21BEA9DC8()
{
  return MEMORY[0x270EE4030]();
}

uint64_t sub_21BEA9DD8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_21BEA9DE8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21BEA9DF8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_21BEA9E08()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21BEA9E18()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_21BEA9E28()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21BEA9E38()
{
  return MEMORY[0x270FA0A80]();
}

uint64_t sub_21BEA9E48()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21BEA9E58()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21BEA9E68()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_21BEA9E78()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_21BEA9E88()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_21BEA9E98()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_21BEA9EB8()
{
  return MEMORY[0x270F76820]();
}

uint64_t sub_21BEA9EC8()
{
  return MEMORY[0x270F76828]();
}

uint64_t sub_21BEA9ED8()
{
  return MEMORY[0x270F87A70]();
}

uint64_t sub_21BEA9EE8()
{
  return MEMORY[0x270F87A78]();
}

uint64_t sub_21BEA9EF8()
{
  return MEMORY[0x270F87A80]();
}

uint64_t sub_21BEA9F08()
{
  return MEMORY[0x270F768A0]();
}

uint64_t sub_21BEA9F18()
{
  return MEMORY[0x270F768A8]();
}

uint64_t sub_21BEA9F28()
{
  return MEMORY[0x270F768B0]();
}

uint64_t sub_21BEA9F38()
{
  return MEMORY[0x270F768C0]();
}

uint64_t sub_21BEA9F78()
{
  return MEMORY[0x270F76A28]();
}

uint64_t sub_21BEA9F88()
{
  return MEMORY[0x270F76A30]();
}

uint64_t sub_21BEA9F98()
{
  return MEMORY[0x270F76A38]();
}

uint64_t sub_21BEA9FA8()
{
  return MEMORY[0x270F76A40]();
}

uint64_t sub_21BEA9FB8()
{
  return MEMORY[0x270F76A48]();
}

uint64_t sub_21BEA9FC8()
{
  return MEMORY[0x270F76A50]();
}

uint64_t sub_21BEA9FD8()
{
  return MEMORY[0x270F76A58]();
}

uint64_t sub_21BEA9FE8()
{
  return MEMORY[0x270F76A60]();
}

uint64_t sub_21BEA9FF8()
{
  return MEMORY[0x270F76A68]();
}

uint64_t sub_21BEAA008()
{
  return MEMORY[0x270F76A70]();
}

uint64_t sub_21BEAA018()
{
  return MEMORY[0x270F76A78]();
}

uint64_t sub_21BEAA028()
{
  return MEMORY[0x270F76A80]();
}

uint64_t sub_21BEAA038()
{
  return MEMORY[0x270F76A88]();
}

uint64_t sub_21BEAA048()
{
  return MEMORY[0x270F76A90]();
}

uint64_t sub_21BEAA058()
{
  return MEMORY[0x270FA06A0]();
}

uint64_t sub_21BEAA068()
{
  return MEMORY[0x270FA06A8]();
}

uint64_t sub_21BEAA078()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_21BEAA088()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21BEAA098()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_21BEAA0A8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21BEAA0B8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_21BEAA0C8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_21BEAA0D8()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_21BEAA0E8()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_21BEAA0F8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21BEAA108()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_21BEAA118()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_21BEAA128()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21BEAA138()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21BEAA148()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_21BEAA158()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21BEAA168()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21BEAA178()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21BEAA188()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_21BEAA198()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_21BEAA1A8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_21BEAA1B8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_21BEAA1C8()
{
  return MEMORY[0x270EF1AC0]();
}

uint64_t sub_21BEAA1D8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_21BEAA1E8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21BEAA1F8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_21BEAA208()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_21BEAA218()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_21BEAA228()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21BEAA238()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21BEAA248()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21BEAA258()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_21BEAA268()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_21BEAA288()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_21BEAA298()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_21BEAA2A8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_21BEAA2D8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_21BEAA2E8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21BEAA2F8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21BEAA308()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21BEAA318()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21BEAA328()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21BEAA338()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21BEAA348()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21BEAA358()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21BEAA368()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_21BEAA378()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_21BEAA388()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21BEAA398()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_21BEAA3A8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21BEAA3B8()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_21BEAA3C8()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_21BEAA3E8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21BEAA3F8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21BEAA408()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21BEAA418()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21BEAA428()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_21BEAA438()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_21BEAA448()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_21BEAA468()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_21BEAA478()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_21BEAA488()
{
  return MEMORY[0x270F76768]();
}

uint64_t sub_21BEAA498()
{
  return MEMORY[0x270F76770]();
}

uint64_t sub_21BEAA4B8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_21BEAA4C8()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t sub_21BEAA4E8()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_21BEAA4F8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_21BEAA508()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_21BEAA518()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_21BEAA528()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_21BEAA538()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_21BEAA548()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21BEAA558()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_21BEAA568()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_21BEAA578()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_21BEAA588()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_21BEAA598()
{
  return MEMORY[0x270EF1CF0]();
}

uint64_t sub_21BEAA5A8()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_21BEAA5B8()
{
  return MEMORY[0x270EF1D08]();
}

uint64_t sub_21BEAA5C8()
{
  return MEMORY[0x270F9E010]();
}

uint64_t sub_21BEAA5D8()
{
  return MEMORY[0x270F54728]();
}

uint64_t sub_21BEAA5E8()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_21BEAA5F8()
{
  return MEMORY[0x270FA0768]();
}

uint64_t sub_21BEAA608()
{
  return MEMORY[0x270FA0770]();
}

uint64_t sub_21BEAA618()
{
  return MEMORY[0x270FA0780]();
}

uint64_t sub_21BEAA628()
{
  return MEMORY[0x270FA0790]();
}

uint64_t sub_21BEAA638()
{
  return MEMORY[0x270FA07A8]();
}

uint64_t sub_21BEAA648()
{
  return MEMORY[0x270FA07B0]();
}

uint64_t sub_21BEAA658()
{
  return MEMORY[0x270FA07B8]();
}

uint64_t sub_21BEAA668()
{
  return MEMORY[0x270FA07C0]();
}

uint64_t sub_21BEAA678()
{
  return MEMORY[0x270FA07C8]();
}

uint64_t sub_21BEAA688()
{
  return MEMORY[0x270FA07D0]();
}

uint64_t sub_21BEAA698()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21BEAA6A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21BEAA6B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21BEAA6C8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21BEAA6D8()
{
  return MEMORY[0x270EF1FA8]();
}

uint64_t sub_21BEAA6E8()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_21BEAA6F8()
{
  return MEMORY[0x270F54730]();
}

uint64_t sub_21BEAA708()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21BEAA718()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_21BEAA728()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_21BEAA738()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21BEAA748()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21BEAA758()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21BEAA768()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21BEAA778()
{
  return MEMORY[0x270FA0DC8]();
}

uint64_t sub_21BEAA788()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_21BEAA798()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_21BEAA7A8()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_21BEAA7B8()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_21BEAA7C8()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_21BEAA7D8()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_21BEAA7E8()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_21BEAA7F8()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_21BEAA808()
{
  return MEMORY[0x270FA07E0]();
}

uint64_t sub_21BEAA818()
{
  return MEMORY[0x270FA07E8]();
}

uint64_t sub_21BEAA828()
{
  return MEMORY[0x270FA07F0]();
}

uint64_t sub_21BEAA838()
{
  return MEMORY[0x270FA0808]();
}

uint64_t sub_21BEAA848()
{
  return MEMORY[0x270FA0810]();
}

uint64_t sub_21BEAA858()
{
  return MEMORY[0x270FA0818]();
}

uint64_t sub_21BEAA868()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_21BEAA898()
{
  return MEMORY[0x270FA0820]();
}

uint64_t sub_21BEAA8A8()
{
  return MEMORY[0x270FA0828]();
}

uint64_t sub_21BEAA8B8()
{
  return MEMORY[0x270FA0830]();
}

uint64_t sub_21BEAA8C8()
{
  return MEMORY[0x270FA0838]();
}

uint64_t sub_21BEAA8D8()
{
  return MEMORY[0x270FA0840]();
}

uint64_t sub_21BEAA8E8()
{
  return MEMORY[0x270FA0850]();
}

uint64_t sub_21BEAA8F8()
{
  return MEMORY[0x270FA0858]();
}

uint64_t sub_21BEAA908()
{
  return MEMORY[0x270FA0860]();
}

uint64_t sub_21BEAA918()
{
  return MEMORY[0x270FA0868]();
}

uint64_t sub_21BEAA928()
{
  return MEMORY[0x270FA0880]();
}

uint64_t sub_21BEAA938()
{
  return MEMORY[0x270FA0888]();
}

uint64_t sub_21BEAA948()
{
  return MEMORY[0x270FA0890]();
}

uint64_t sub_21BEAA958()
{
  return MEMORY[0x270FA0898]();
}

uint64_t sub_21BEAA988()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_21BEAA998()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_21BEAA9A8()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_21BEAA9B8()
{
  return MEMORY[0x270F49AF8]();
}

uint64_t sub_21BEAA9C8()
{
  return MEMORY[0x270F49B00]();
}

uint64_t sub_21BEAA9D8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_21BEAA9E8()
{
  return MEMORY[0x270EF21A0]();
}

uint64_t sub_21BEAA9F8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21BEAAA08()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_21BEAAA18()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_21BEAAA28()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_21BEAAA38()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_21BEAAA48()
{
  return MEMORY[0x270F9E3A0]();
}

uint64_t sub_21BEAAA58()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_21BEAAA68()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21BEAAA78()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21BEAAA88()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21BEAAA98()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_21BEAAAA8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_21BEAAAB8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21BEAAAD8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21BEAAAE8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21BEAAAF8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_21BEAAB08()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_21BEAAB18()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_21BEAAB28()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_21BEAAB38()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_21BEAAB48()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_21BEAAB58()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_21BEAAB68()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_21BEAAB78()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_21BEAAB88()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_21BEAAB98()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_21BEAABA8()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_21BEAABB8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_21BEAABC8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_21BEAABD8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21BEAABF8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21BEAAC08()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21BEAAC18()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_21BEAAC28()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21BEAAC38()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_21BEAAC48()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21BEAAC58()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21BEAAC68()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_21BEAAC78()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21BEAAC88()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21BEAAC98()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_21BEAACA8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21BEAACB8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21BEAACC8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21BEAACD8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21BEAACE8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21BEAACF8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21BEAAD08()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21BEAAD18()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_21BEAAD28()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_21BEAAD38()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_21BEAAD48()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_21BEAAD58()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21BEAAD68()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21BEAAD78()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_21BEAAD88()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21BEAAD98()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_21BEAADA8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21BEAADB8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21BEAADC8()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_21BEAADD8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21BEAADE8()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_21BEAADF8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21BEAAE08()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21BEAAE18()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21BEAAE28()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_21BEAAE48()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_21BEAAE58()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21BEAAE68()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_21BEAAE78()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21BEAAE88()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_21BEAAE98()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_21BEAAEB8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_21BEAAEC8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21BEAAED8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21BEAAF08()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21BEAAF18()
{
  return MEMORY[0x270F76780]();
}

uint64_t sub_21BEAAF28()
{
  return MEMORY[0x270F76788]();
}

uint64_t sub_21BEAAF38()
{
  return MEMORY[0x270F76790]();
}

uint64_t sub_21BEAAF48()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21BEAAF58()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21BEAAF68()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21BEAAF78()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21BEAAF88()
{
  return MEMORY[0x270EF26F8]();
}

uint64_t sub_21BEAAF98()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_21BEAAFA8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_21BEAAFB8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21BEAAFC8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21BEAAFD8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_21BEAAFE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21BEAAFF8()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_21BEAB008()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_21BEAB018()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x270F0EC10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x270F0FC80](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x270F0FCA0](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x270F0FCB0](inComponent, outInstance);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x270EE2170](inAQ, *(void *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x270EE2178](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x270EE2180](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x270EE2198](inAQ, inBuffer);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x270EE21B0](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(void *)&inFlags, outAQ);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270EE21E0](inAQ, *(void *)&inID, inData, *(void *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x270EE21E8](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x270EE21F0](inAQ, inImmediate);
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270EE2238](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x270F0FD68](inUnit);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x270F0FD90](inUnit, ioActionFlags, inTimeStamp, *(void *)&inOutputBusNumber, *(void *)&inNumberFrames, ioData);
}

OSStatus AudioUnitReset(AudioUnit inUnit, AudioUnitScope inScope, AudioUnitElement inElement)
{
  return MEMORY[0x270F0FD98](inUnit, *(void *)&inScope, *(void *)&inElement);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x270F0FDA8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270F0FDB0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

OSStatus AudioUnitUninitialize(AudioUnit inUnit)
{
  return MEMORY[0x270F0FDB8](inUnit);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x270EE7A98](hostTime);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x270EE7AA8](retstr, clock);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x270EE7D40](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x270EE7DF0](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

Float64 CMTimebaseGetEffectiveRate(CMTimebaseRef timebase)
{
  MEMORY[0x270EE7F40](timebase);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x270EE7F50](retstr, timebase);
}

uint64_t FigOutputMonitorIsScreenProbablyBeingRecorded()
{
  return MEMORY[0x270EF5D38]();
}

uint64_t ICBundleIdentifierForSystemApplicationType()
{
  return MEMORY[0x270F88A38]();
}

uint64_t ICCreateLoggableValueForDSID()
{
  return MEMORY[0x270F88A48]();
}

uint64_t ICCurrentApplicationIsSystemApp()
{
  return MEMORY[0x270F88A50]();
}

uint64_t ICEnvironmentNetworkTypeIsBluetooth()
{
  return MEMORY[0x270F88A70]();
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x270F88A78]();
}

uint64_t ICEnvironmentNetworkTypeIsWiFi()
{
  return MEMORY[0x270F88A80]();
}

uint64_t ICEnvironmentNetworkTypeIsWired()
{
  return MEMORY[0x270F88A88]();
}

uint64_t ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest()
{
  return MEMORY[0x270F88A98]();
}

uint64_t ICUserNotificationGetResponseButton()
{
  return MEMORY[0x270F88AB0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MPAVRouteSubtypeDescription()
{
  return MEMORY[0x270EF5B80]();
}

uint64_t MPArtworkImageJPEGRepresentation()
{
  return MEMORY[0x270EF5B88]();
}

uint64_t MPArtworkImagePNGRepresentation()
{
  return MEMORY[0x270EF5B90]();
}

uint64_t MPContainerUniqueID()
{
  return MEMORY[0x270EF5B98]();
}

uint64_t MPContainerUniqueIDPrefix()
{
  return MEMORY[0x270EF5BA0]();
}

uint64_t MPMediaContentTasteTasteTypeToMPMediaEntityLikedState()
{
  return MEMORY[0x270EF5BA8]();
}

uint64_t MPModelMovieIsRestricted()
{
  return MEMORY[0x270EF5BB0]();
}

uint64_t MPModelTVEpisodeIsRestricted()
{
  return MEMORY[0x270EF5BB8]();
}

uint64_t MPMusicRepeatModeForMPRepeatType()
{
  return MEMORY[0x270EF5BC0]();
}

uint64_t MPMusicShuffleModeForMPShuffleType()
{
  return MEMORY[0x270EF5BC8]();
}

uint64_t MPNSStringFromRepeatType()
{
  return MEMORY[0x270EF5BD0]();
}

uint64_t MPNSStringFromShuffleType()
{
  return MEMORY[0x270EF5BD8]();
}

uint64_t MPProcessInfoSystemWallClockUptime()
{
  return MEMORY[0x270EF5BE0]();
}

uint64_t MPRemoteCommandStatusFromMRSendCommandResultStatus()
{
  return MEMORY[0x270EF5BE8]();
}

uint64_t MPRepeatTypeDescription()
{
  return MEMORY[0x270EF5BF0]();
}

uint64_t MPRepeatTypeFromMediaRemoteRepeatMode()
{
  return MEMORY[0x270EF5BF8]();
}

uint64_t MPRepeatTypeToMediaRemoteRepeatMode()
{
  return MEMORY[0x270EF5C00]();
}

uint64_t MPSharedBackgroundTaskProvider()
{
  return MEMORY[0x270EF5C08]();
}

uint64_t MPShouldIncrementPlayCountForElapsedTime()
{
  return MEMORY[0x270EF5C10]();
}

uint64_t MPShuffleTypeDescription()
{
  return MEMORY[0x270EF5C18]();
}

uint64_t MPShuffleTypeFromMediaRemoteShuffleMode()
{
  return MEMORY[0x270EF5C20]();
}

uint64_t MPShuffleTypeToMediaRemoteShuffleMode()
{
  return MEMORY[0x270EF5C28]();
}

uint64_t MPSleepTimerStopModeFromMediaRemoteSleepTimerStopMode()
{
  return MEMORY[0x270EF5C30]();
}

uint64_t MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode()
{
  return MEMORY[0x270EF5C38]();
}

uint64_t MPStoreItemMetadataInt64NormalizeStoreIDValue()
{
  return MEMORY[0x270EF5C40]();
}

uint64_t MPStoreItemMetadataItemKindGetPlayabilityInformation()
{
  return MEMORY[0x270EF5C48]();
}

uint64_t MPStoreItemMetadataStringNormalizeStoreIDValue()
{
  return MEMORY[0x270EF5C50]();
}

uint64_t MPUIApplication()
{
  return MEMORY[0x270EF5C58]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x270F49BB8]();
}

uint64_t MRAVEndpointGetDesignatedGroupLeader()
{
  return MEMORY[0x270F49BD0]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x270F49BD8]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x270F49BE0]();
}

uint64_t MRAVEndpointGetMyGroupLeaderWithTimeout()
{
  return MEMORY[0x270F49BE8]();
}

uint64_t MRAVEndpointGetOutputDeviceUIDVolume()
{
  return MEMORY[0x270F49BF0]();
}

uint64_t MRAVEndpointGetOutputDeviceVolume()
{
  return MEMORY[0x270F49C00]();
}

uint64_t MRAVEndpointGroupDevicesAndSendCommandWithResult()
{
  return MEMORY[0x270F49C08]();
}

uint64_t MRAVEndpointIsLocalEndpoint()
{
  return MEMORY[0x270F49C10]();
}

uint64_t MRAVEndpointObserverAddEndpointChangedCallback()
{
  return MEMORY[0x270F49C20]();
}

uint64_t MRAVEndpointObserverBegin()
{
  return MEMORY[0x270F49C28]();
}

uint64_t MRAVEndpointObserverCreateWithOutputDeviceUID()
{
  return MEMORY[0x270F49C30]();
}

uint64_t MRAVEndpointObserverEnd()
{
  return MEMORY[0x270F49C38]();
}

uint64_t MRAVEndpointPredictGroupLeader()
{
  return MEMORY[0x270F49C40]();
}

uint64_t MRAVEndpointSetOutputDeviceUIDVolume()
{
  return MEMORY[0x270F49C48]();
}

uint64_t MRAVOutputContextCopyOutputDevices()
{
  return MEMORY[0x270F49C58]();
}

uint64_t MRAVOutputContextGetSharedAudioPresentationContext()
{
  return MEMORY[0x270F49C60]();
}

uint64_t MRAVOutputContextSetOutputDevices()
{
  return MEMORY[0x270F49C68]();
}

uint64_t MRAVOutputDeviceCanAccessAppleMusic()
{
  return MEMORY[0x270F49C70]();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x270F49C98]();
}

uint64_t MRAVOutputDeviceIsRemoteControllable()
{
  return MEMORY[0x270F49CB8]();
}

uint64_t MRAVReconnaissanceSessionBeginEndpointsSearch()
{
  return MEMORY[0x270F49CD8]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x270F49CE0]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x270F49CF0]();
}

uint64_t MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs()
{
  return MEMORY[0x270F49CF8]();
}

uint64_t MRAVReconnaissanceSessionCreateWithMatchingOutputGroupIDFeatures()
{
  return MEMORY[0x270F49D00]();
}

uint64_t MRAVReconnaissanceSessionSetExpectedLogicalDevices()
{
  return MEMORY[0x270F49D08]();
}

uint64_t MRAVReconnaissanceSessionSetReturnPartialResults()
{
  return MEMORY[0x270F49D10]();
}

uint64_t MRAVReconnaissanceSessionSetTargetAudioSessionID()
{
  return MEMORY[0x270F49D18]();
}

uint64_t MRAVReconnaissanceSessionSetWaitForCompleteClusters()
{
  return MEMORY[0x270F49D20]();
}

uint64_t MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints()
{
  return MEMORY[0x270F49D28]();
}

uint64_t MRContentItemGetArtworkData()
{
  return MEMORY[0x270F49D80]();
}

uint64_t MRContentItemGetHasArtworkData()
{
  return MEMORY[0x270F49D88]();
}

uint64_t MRContentItemGetIdentifier()
{
  return MEMORY[0x270F49D90]();
}

uint64_t MRContentItemHasPlaybackRate()
{
  return MEMORY[0x270F49DD0]();
}

uint64_t MRContentItemIsEmpty()
{
  return MEMORY[0x270F49DD8]();
}

uint64_t MRContentItemMerge()
{
  return MEMORY[0x270F49DE0]();
}

uint64_t MRExternalDeviceCopyCustomOrigin()
{
  return MEMORY[0x270F49DF0]();
}

uint64_t MRGroupSessionRouteTypeDescription()
{
  return MEMORY[0x270F49E18]();
}

uint64_t MRMediaRemoteAddPlayerPathInvalidationHandler()
{
  return MEMORY[0x270F49E38]();
}

uint64_t MRMediaRemoteApplicationIsSystemApplication()
{
  return MEMORY[0x270F49E40]();
}

uint64_t MRMediaRemoteApplicationIsSystemMediaApplication()
{
  return MEMORY[0x270F49E50]();
}

uint64_t MRMediaRemoteApplicationIsSystemPodcastApplication()
{
  return MEMORY[0x270F49E58]();
}

uint64_t MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus()
{
  return MEMORY[0x270EF5C60]();
}

uint64_t MRMediaRemoteCommandInfoCopyOptions()
{
  return MEMORY[0x270F49E90]();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return MEMORY[0x270F49E98]();
}

uint64_t MRMediaRemoteCommandInfoCreate()
{
  return MEMORY[0x270F49EA0]();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return MEMORY[0x270F49EB0]();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return MEMORY[0x270F49EB8]();
}

uint64_t MRMediaRemoteCommandInfoGetIntegerValueForKey()
{
  return MEMORY[0x270F49EC0]();
}

uint64_t MRMediaRemoteCommandInfoSetCommand()
{
  return MEMORY[0x270F49EC8]();
}

uint64_t MRMediaRemoteCommandInfoSetEnabled()
{
  return MEMORY[0x270F49ED0]();
}

uint64_t MRMediaRemoteCopyCommandDescription()
{
  return MEMORY[0x270F49ED8]();
}

uint64_t MRMediaRemoteCopyCommandHandlerStatusDescription()
{
  return MEMORY[0x270F49EE0]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID()
{
  return MEMORY[0x270F49EF0]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return MEMORY[0x270F49EF8]();
}

uint64_t MRMediaRemoteCopyPlaybackStateDescription()
{
  return MEMORY[0x270F49F08]();
}

uint64_t MRMediaRemoteCopySendCommandErrorDescription()
{
  return MEMORY[0x270F49F10]();
}

uint64_t MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands()
{
  return MEMORY[0x270F49F18]();
}

uint64_t MRMediaRemoteCreateError()
{
  return MEMORY[0x270F49F20]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x270F49F28]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x270F49F30]();
}

uint64_t MRMediaRemoteGetDeviceInfo()
{
  return MEMORY[0x270F49F50]();
}

uint64_t MRMediaRemoteGetElectedPlayerPath()
{
  return MEMORY[0x270F49F58]();
}

uint64_t MRMediaRemoteGetIsGroupLeader()
{
  return MEMORY[0x270F49F60]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x270F49F68]();
}

uint64_t MRMediaRemoteGetPlaybackStateForPlayer()
{
  return MEMORY[0x270F49FC0]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForApp()
{
  return MEMORY[0x270F49FD8]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForPlayer()
{
  return MEMORY[0x270F49FE8]();
}

uint64_t MRMediaRemoteNowPlayingBless()
{
  return MEMORY[0x270F4A000]();
}

uint64_t MRMediaRemoteNowPlayingResolvePlayerPath()
{
  return MEMORY[0x270F4A008]();
}

uint64_t MRMediaRemoteRemovePlayerPathInvalidationHandler()
{
  return MEMORY[0x270F4A020]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync()
{
  return MEMORY[0x270F4A028]();
}

uint64_t MRMediaRemoteSendCommandForOriginWithReply()
{
  return MEMORY[0x270F4A048]();
}

uint64_t MRMediaRemoteSendCommandToPlayerWithResult()
{
  return MEMORY[0x270F4A060]();
}

uint64_t MRMediaRemoteSendCommandWithReply()
{
  return MEMORY[0x270F4A068]();
}

uint64_t MRMediaRemoteSetParentApplication()
{
  return MEMORY[0x270F4A088]();
}

uint64_t MRMediaRemoteSetWantsSupportedCommandsChangedNotifications()
{
  return MEMORY[0x270F4A0A0]();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return MEMORY[0x270F4A0A8]();
}

uint64_t MRNowPlayingClientCopyBundleIdentifierHierarchy()
{
  return MEMORY[0x270F4A0B8]();
}

uint64_t MRNowPlayingClientCreate()
{
  return MEMORY[0x270F4A0C0]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x270F4A0C8]();
}

uint64_t MRNowPlayingClientGetDisplayName()
{
  return MEMORY[0x270F4A0D0]();
}

uint64_t MRNowPlayingClientGetParentAppBundleIdentifier()
{
  return MEMORY[0x270F4A0D8]();
}

uint64_t MRNowPlayingClientGetProcessIdentifier()
{
  return MEMORY[0x270F4A0E0]();
}

uint64_t MRNowPlayingPlayerCreate()
{
  return MEMORY[0x270F4A0E8]();
}

uint64_t MRNowPlayingPlayerGetIdentifier()
{
  return MEMORY[0x270F4A0F0]();
}

uint64_t MRNowPlayingPlayerPathCopy()
{
  return MEMORY[0x270F4A0F8]();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return MEMORY[0x270F4A100]();
}

uint64_t MRNowPlayingPlayerPathEqualToPlayerPath()
{
  return MEMORY[0x270F4A108]();
}

uint64_t MRNowPlayingPlayerPathGetClient()
{
  return MEMORY[0x270F4A110]();
}

uint64_t MRNowPlayingPlayerPathGetIsResolved()
{
  return MEMORY[0x270F4A118]();
}

uint64_t MRNowPlayingPlayerPathGetOrigin()
{
  return MEMORY[0x270F4A120]();
}

uint64_t MRNowPlayingPlayerPathGetPlayer()
{
  return MEMORY[0x270F4A128]();
}

uint64_t MRNowPlayingPlayerPathIsLocal()
{
  return MEMORY[0x270F4A130]();
}

uint64_t MRNowPlayingPlayerSetIdentifier()
{
  return MEMORY[0x270F4A138]();
}

uint64_t MROriginEqualToOrigin()
{
  return MEMORY[0x270F4A148]();
}

uint64_t MROriginGetDisplayName()
{
  return MEMORY[0x270F4A150]();
}

uint64_t MROriginGetUniqueIdentifier()
{
  return MEMORY[0x270F4A158]();
}

uint64_t MROriginIsLocalOrigin()
{
  return MEMORY[0x270F4A160]();
}

uint64_t MROutputDeviceSubtypeFromGroupSessionRoute()
{
  return MEMORY[0x270F4A168]();
}

uint64_t MROutputDeviceTypeFromGroupSessionRoute()
{
  return MEMORY[0x270F4A170]();
}

uint64_t MRPlaybackQueueCopyContentItems()
{
  return MEMORY[0x270F4A180]();
}

uint64_t MRPlaybackQueueGetQueueID()
{
  return MEMORY[0x270F4A190]();
}

uint64_t MRPlaybackQueueGetRange()
{
  return MEMORY[0x270F4A198]();
}

uint64_t MRPlaybackQueueRequestCreate()
{
  return MEMORY[0x270F4A1A0]();
}

uint64_t MRPlaybackQueueRequestCreateWithIdentifiers()
{
  return MEMORY[0x270F4A1B0]();
}

uint64_t MRPlaybackQueueRequestGetRange()
{
  return MEMORY[0x270F4A1B8]();
}

uint64_t MRPlaybackQueueRequestSetIdentifiers()
{
  return MEMORY[0x270F4A1C0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeAlignments()
{
  return MEMORY[0x270F4A1C8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeArtwork()
{
  return MEMORY[0x270F4A1D0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeInfo()
{
  return MEMORY[0x270F4A1D8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeLanguageOptions()
{
  return MEMORY[0x270F4A1E0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return MEMORY[0x270F4A1E8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeSections()
{
  return MEMORY[0x270F4A1F0]();
}

uint64_t MRPlaybackQueueRequestSetLabel()
{
  return MEMORY[0x270F4A1F8]();
}

uint64_t MRPlaybackSessionCreate()
{
  return MEMORY[0x270F4A200]();
}

uint64_t MRPlaybackSessionCreateExternalRepresentation()
{
  return MEMORY[0x270F4A208]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x270F4A210]();
}

uint64_t MRSystemAppPlaybackQueueCreateExternalRepresentation()
{
  return MEMORY[0x270F4A218]();
}

uint64_t MRSystemAppPlaybackQueueCreateFromExternalRepresentation()
{
  return MEMORY[0x270F4A220]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x270F4A228]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomData()
{
  return MEMORY[0x270F4A238]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomDataIdentifier()
{
  return MEMORY[0x270F4A240]();
}

uint64_t MRSystemAppPlaybackQueueSetFeatureName()
{
  return MEMORY[0x270F4A248]();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return MEMORY[0x270F4A250]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x270F4A258]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationIDType()
{
  return MEMORY[0x270F4A270]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationStringIdentifier()
{
  return MEMORY[0x270F4A278]();
}

uint64_t MRSystemAppPlaybackQueueSetReplaceIntent()
{
  return MEMORY[0x270F4A280]();
}

uint64_t MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue()
{
  return MEMORY[0x270F4A288]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriAssetInfo()
{
  return MEMORY[0x270F4A290]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier()
{
  return MEMORY[0x270F4A298]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo()
{
  return MEMORY[0x270F4A2A0]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData()
{
  return MEMORY[0x270F4A2A8]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistRepeatMode()
{
  return MEMORY[0x270F4A2B0]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistShuffleMode()
{
  return MEMORY[0x270F4A2B8]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistStoreIDs()
{
  return MEMORY[0x270F4A2C0]();
}

uint64_t MSVBundleIDForAuditToken()
{
  return MEMORY[0x270F4A2F0]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x270F4A308]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x270F4A310]();
}

uint64_t MSVDeviceIsHomePod()
{
  return MEMORY[0x270F4A318]();
}

uint64_t MSVDeviceIsInternalCarry()
{
  return MEMORY[0x270F4A320]();
}

uint64_t MSVDeviceIsROSDevice()
{
  return MEMORY[0x270F4A328]();
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x270F4A330]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x270F4A338]();
}

uint64_t MSVDeviceSupportsDelegatedIdentities()
{
  return MEMORY[0x270F4A340]();
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  return MEMORY[0x270F4A348]();
}

uint64_t MSVDeviceSupportsLosslessMusic()
{
  return MEMORY[0x270F4A350]();
}

uint64_t MSVDeviceSupportsMultiChannelMusic()
{
  return MEMORY[0x270F4A358]();
}

uint64_t MSVDeviceSupportsVocalAttenuation()
{
  return MEMORY[0x270F4A360]();
}

uint64_t MSVGetCurrentThreadPriority()
{
  return MEMORY[0x270F4A368]();
}

uint64_t MSVGetDeviceProductType()
{
  return MEMORY[0x270F4A370]();
}

uint64_t MSVGetDiskUsageForPath()
{
  return MEMORY[0x270F4A378]();
}

uint64_t MSVGetKernelBootTime()
{
  return MEMORY[0x270F4A380]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x270F4A388]();
}

uint64_t MSVGetProcessLaunchTime()
{
  return MEMORY[0x270F4A390]();
}

uint64_t MSVGzipCompressData()
{
  return MEMORY[0x270F4A398]();
}

uint64_t MSVGzipDecompressData()
{
  return MEMORY[0x270F4A3A0]();
}

uint64_t MSVHasherSharedSeed()
{
  return MEMORY[0x270F4A3A8]();
}

uint64_t MSVLogAddStateHandler()
{
  return MEMORY[0x270F4A3B8]();
}

uint64_t MSVLogDateFormatter()
{
  return MEMORY[0x270F4A3C0]();
}

uint64_t MSVLogRemoveStateHandler()
{
  return MEMORY[0x270F4A3C8]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x270F4A3D0]();
}

uint64_t MSVNanoIDCreate()
{
  return MEMORY[0x270F4A3D8]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x270F4A3E0]();
}

uint64_t MSVOfflineHLSFileExtensions()
{
  return MEMORY[0x270F4A3E8]();
}

uint64_t MSVProcessCopyMediaFrameworksDescriptions()
{
  return MEMORY[0x270F4A3F0]();
}

uint64_t MSVProcessCopyUUID()
{
  return MEMORY[0x270F4A3F8]();
}

uint64_t MSVReplacementRangeForRanges()
{
  return MEMORY[0x270F4A400]();
}

uint64_t MSVSignedUnionRange()
{
  return MEMORY[0x270F4A408]();
}

uint64_t MSVTimelineChartPrefix()
{
  return MEMORY[0x270F4A410]();
}

uint64_t MSVUnarchivedObjectOfClass()
{
  return MEMORY[0x270F4A418]();
}

OSStatus MTAudioProcessingTapCreate(CFAllocatorRef allocator, const MTAudioProcessingTapCallbacks *callbacks, MTAudioProcessingTapCreationFlags flags, MTAudioProcessingTapRef *tapOut)
{
  return MEMORY[0x270EF5DD8](allocator, callbacks, *(void *)&flags, tapOut);
}

OSStatus MTAudioProcessingTapGetSourceAudio(MTAudioProcessingTapRef tap, CMItemCount numberFrames, AudioBufferList *bufferListInOut, MTAudioProcessingTapFlags *flagsOut, CMTimeRange *timeRangeOut, CMItemCount *numberFramesOut)
{
  return MEMORY[0x270EF5DE0](tap, numberFrames, bufferListInOut, flagsOut, timeRangeOut, numberFramesOut);
}

void *__cdecl MTAudioProcessingTapGetStorage(MTAudioProcessingTapRef tap)
{
  return (void *)MEMORY[0x270EF5DE8](tap);
}

uint64_t MTMultitrackAudioProcessingTapCreate()
{
  return MEMORY[0x270EF5DF0]();
}

uint64_t MTPlaybackContinuousPlaybackEnabled()
{
  return MEMORY[0x270F54750]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A28](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x270EF2A80](retstr, table);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x270EF2B30](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x270EF2B60](enumerator, key, value);
}

uint64_t NSPersistentStringFromMTStopReason()
{
  return MEMORY[0x270F54778]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromICLiveLinkEventType()
{
  return MEMORY[0x270F88AB8]();
}

uint64_t NSStringFromMPModelGenericObjectType()
{
  return MEMORY[0x270EF5C68]();
}

uint64_t NSStringFromMPModelRadioStationSubtype()
{
  return MEMORY[0x270EF5C70]();
}

uint64_t NSStringFromMPModelRadioStationType()
{
  return MEMORY[0x270EF5C78]();
}

uint64_t NSStringFromMPPlaybackContextSupplementalReason()
{
  return MEMORY[0x270EF5C80]();
}

uint64_t NSStringFromMPRemoteCommandHandlerDialogActionType()
{
  return MEMORY[0x270EF5C88]();
}

uint64_t NSStringFromMSVSignedRange()
{
  return MEMORY[0x270F4A428]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x270F58680]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x270F58688]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x270F58690]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x270F58698]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x270F586A0]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x270F586A8]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x270F55168]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x270F55170]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFNetworkCopyDefaultUserAgentString()
{
  return MEMORY[0x270EE2A60]();
}

uint64_t _MRLogForCategory()
{
  return MEMORY[0x270F4A2D0]();
}

uint64_t _MRMediaRemoteRegisterForNowPlayingNotificationsEx()
{
  return MEMORY[0x270F4A2D8]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x270EE57B0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x270EE57C8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x270EE57D0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x270EE57D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

float __exp10f(float a1)
{
  MEMORY[0x270ED7DD0](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

lldiv_t div(uint64_t __x, uint64_t __y)
{
  uint64_t v2 = MEMORY[0x270ED9608](__x, __y);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x270EDA038](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x270EDA088](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t msv_dispatch_on_main_queue()
{
  return MEMORY[0x270F4A438]();
}

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x270F4A440]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x270F9AAC8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x270FA0380]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x270FA0388]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x270FA0398]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x270FA05B0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x270EDE9D0](__Log2n, *(void *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_vasm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zaspec(const DSPSplitComplex *__A, float *__C, vDSP_Length __N)
{
}