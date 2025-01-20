void sub_100002984(id *a1@<X0>, void *a2@<X8>)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSString v8;
  NSString v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSString v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v3 = *a1;
  v4 = [*a1 calendarIdentifier];
  sub_1000098E0();

  v5 = (id)CUIKDisplayedTitleForCalendar();
  if (!v5)
  {
    __break(1u);
    goto LABEL_19;
  }
  v6 = v5;
  type metadata accessor for EKUICalendar();
  sub_1000098E0();

  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v8 = sub_1000098D0();
  swift_bridgeObjectRelease();
  v9 = sub_1000098D0();
  swift_bridgeObjectRelease();
  v10 = [v7 initWithIdentifier:v8 displayString:v9];

  v11 = [v3 source];
  if (!v11)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v12 = v11;
  v13 = [v11 externalID];

  [v10 setAcAccountIdentifier:v13];
  v14 = [v3 image];
  if (v14)
  {
    v15 = v14;
    if ([v14 type] == (id)1)
    {
      v16 = [v15 name];
      if (v16)
      {
        v17 = v16;
        v18 = self;
        v19 = v10;
        v20 = [v18 systemImageNamed:v17];

        [v19 setDisplayImage:v20];
      }
    }
  }
  v21 = [v10 displayImage];

  if (v21) {
    goto LABEL_13;
  }
  v22 = [v3 source];
  if (!v22)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v23 = v22;
  v24 = [v22 sourceType];

  if (v24 == (id)5 && ([v3 isSuggestedEventCalendar] & 1) == 0)
  {
    v25 = self;
    v26 = v10;
    v27 = sub_1000098D0();
    v28 = [v25 systemImageNamed:v27];

    [v26 setDisplayImage:v28];
  }
LABEL_13:
  v29 = [v10 displayImage];

  if (v29) {
    goto LABEL_17;
  }
  v30 = [v3 displayColor];
  if (!v30) {
    goto LABEL_17;
  }
  v31 = v30;
  v32 = self;
  v33 = v10;
  v34 = v31;
  v35 = [v32 preferredFontForTextStyle:UIFontTextStyleBody];
  v36 = (id)ScaledCalendarColorDotImageForColor();

  if (v36)
  {
    v37 = [self imageWithUIImage:v36];

    [v33 setDisplayImage:v37];
LABEL_17:
    *a2 = v10;
    return;
  }
LABEL_21:
  __break(1u);
}

uint64_t sub_100002D88()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC16IntentsExtension19WidgetIntentHandler_eventStore) calendarsForEntityType:0];
  sub_100006488(0, &qword_100011548);
  unint64_t v2 = sub_100009920();

  uint64_t v90 = (uint64_t)_swiftEmptyArrayStorage;
  if (v2 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v4 = (unint64_t)&WidgetIntentHandler;
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v12 = (uint64_t)_swiftEmptyArrayStorage;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_18;
  }
LABEL_3:
  uint64_t v5 = 4;
  do
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_1000099A0();
    }
    else {
      id v6 = *(id *)(v2 + 8 * v5);
    }
    v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
LABEL_16:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_100009A20();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0x100010000;
      if (!v3) {
        goto LABEL_17;
      }
      goto LABEL_3;
    }
    id v9 = [v6 *(SEL *)(v4 + 2616)];
    if (!v9) {
      goto LABEL_100;
    }
    v10 = v9;
    unsigned __int8 v11 = [v9 isDelegate];

    if (v11)
    {
    }
    else
    {
      sub_1000099B0();
      sub_1000099E0();
      sub_1000099F0();
      sub_1000099C0();
    }
    ++v5;
  }
  while (v8 != v3);
  swift_bridgeObjectRelease();
  uint64_t v12 = v90;
  if ((v90 & 0x8000000000000000) == 0)
  {
LABEL_18:
    if ((v12 & 0x4000000000000000) != 0) {
      goto LABEL_56;
    }
    uint64_t v13 = *(void *)(v12 + 16);
    if (v13) {
      goto LABEL_20;
    }
LABEL_57:
    swift_release();
    uint64_t v53 = swift_bridgeObjectRetain();
    unint64_t v54 = (unint64_t)sub_100003D44(v53);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((v54 & 0x8000000000000000) != 0 || (v55 = (void *)v54, (v54 & 0x4000000000000000) != 0))
    {
LABEL_96:
      v55 = sub_100003C4C(v54);
      swift_release();
    }
    uint64_t v90 = (uint64_t)v55;
    sub_100003EA8(&v90);
    swift_release();
    uint64_t v56 = v90;
    uint64_t v90 = (uint64_t)_swiftEmptyArrayStorage;
    if (v56 < 0 || (v56 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      unint64_t v54 = sub_100009A20();
      swift_release();
      if (v54) {
        goto LABEL_62;
      }
    }
    else
    {
      unint64_t v54 = *(void *)(v56 + 16);
      if (v54)
      {
LABEL_62:
        unint64_t v57 = 0;
        unint64_t v85 = v54;
        unint64_t v87 = v56 & 0xC000000000000001;
        uint64_t v81 = v56 + 32;
        uint64_t v83 = v56;
        while (1)
        {
          if (v87)
          {
            id v58 = (id)sub_1000099A0();
          }
          else
          {
            if (v57 >= *(void *)(v56 + 16)) {
              goto LABEL_95;
            }
            id v58 = *(id *)(v81 + 8 * v57);
          }
          v59 = v58;
          BOOL v51 = __OFADD__(v57++, 1);
          if (v51) {
            break;
          }
          id v60 = [v58 title];
          if (v60)
          {
            v61 = v60;
            sub_1000098E0();
            uint64_t v63 = v62;
          }
          else
          {
            uint64_t v63 = 0;
          }
          id v64 = [v59 calendarInfos];
          if (!v64) {
            goto LABEL_102;
          }
          v65 = v64;
          sub_100006488(0, &qword_100011550);
          unint64_t v66 = sub_100009920();

          if (v66 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v67 = sub_100009A20();
            swift_bridgeObjectRelease();
            if (v67)
            {
LABEL_74:
              v89[0] = _swiftEmptyArrayStorage;
              unint64_t v54 = (unint64_t)v89;
              sub_1000099D0();
              if ((v67 & 0x8000000000000000) == 0)
              {
                uint64_t v68 = 0;
                while (1)
                {
                  if (v67 == v68)
                  {
                    __break(1u);
                    goto LABEL_93;
                  }
                  id v69 = (v66 & 0xC000000000000001) != 0
                      ? (id)sub_1000099A0()
                      : *(id *)(v66 + 8 * v68 + 32);
                  v70 = v69;
                  if (![v69 calendar]) {
                    break;
                  }
                  ++v68;

                  sub_1000099B0();
                  sub_1000099E0();
                  sub_1000099F0();
                  unint64_t v54 = (unint64_t)v89;
                  sub_1000099C0();
                  if (v67 == v68)
                  {
                    v71 = (void *)v89[0];
                    swift_bridgeObjectRelease();
                    uint64_t v56 = v83;
                    goto LABEL_85;
                  }
                }
                __break(1u);
LABEL_100:
                __break(1u);
LABEL_101:
                __break(1u);
LABEL_102:
                __break(1u);
LABEL_103:
                __break(1u);
                goto LABEL_104;
              }
LABEL_94:
              __break(1u);
LABEL_95:
              __break(1u);
              goto LABEL_96;
            }
          }
          else
          {
            uint64_t v67 = *(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v67) {
              goto LABEL_74;
            }
          }
          swift_bridgeObjectRelease();
          v71 = _swiftEmptyArrayStorage;
LABEL_85:
          sub_100005E60((unint64_t)v71);
          swift_bridgeObjectRelease();
          if (v63)
          {
            NSString v72 = sub_1000098D0();
            swift_bridgeObjectRelease();
          }
          else
          {
            NSString v72 = 0;
          }
          id v73 = objc_allocWithZone((Class)INObjectSection);
          type metadata accessor for EKUICalendar();
          Class isa = sub_100009910().super.isa;
          swift_bridgeObjectRelease();
          id v75 = [v73 initWithTitle:v72 items:isa];

          id v76 = v75;
          sub_100009900();
          if (*(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100009940();
          }
          sub_100009960();
          unint64_t v54 = (unint64_t)&v90;
          sub_100009930();

          if (v57 == v85) {
            goto LABEL_98;
          }
        }
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
    }
LABEL_98:
    swift_release();
    id v77 = objc_allocWithZone((Class)INObjectCollection);
    sub_100006428(&qword_100011540);
    Class v78 = sub_100009910().super.isa;
    swift_bridgeObjectRelease();
    id v79 = [v77 initWithSections:v78];

    swift_bridgeObjectRelease();
    return (uint64_t)v79;
  }
LABEL_56:
  while (2)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100009A20();
    swift_release();
    if (!v13) {
      goto LABEL_57;
    }
LABEL_20:
    unint64_t v86 = v12 & 0xC000000000000001;
    v14 = &_swiftEmptyDictionarySingleton;
    uint64_t v15 = 4;
    uint64_t v82 = v13;
    uint64_t v84 = v12;
LABEL_24:
    if (v86) {
      id v19 = (id)sub_1000099A0();
    }
    else {
      id v19 = *(id *)(v12 + 8 * v15);
    }
    id v20 = v19;
    uint64_t v12 = v15 - 3;
    if (__OFADD__(v15 - 4, 1))
    {
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
      continue;
    }
    break;
  }
  id v21 = [objc_allocWithZone((Class)CUIKCalendarInfo) initWithCalendar:v19];
  if (!v21) {
    goto LABEL_101;
  }
  v22 = v21;
  id v23 = [v21 customGroupType];
  v88 = v20;
  if (v23 == (id)1)
  {
    uint64_t v24 = 0xE500000000000000;
    uint64_t v25 = 0x726568744FLL;
    if (!v14[2]) {
      goto LABEL_31;
    }
LABEL_37:
    swift_bridgeObjectRetain();
    unint64_t v33 = sub_100003E30(v25, v24);
    if (v34)
    {
      id v35 = *(id *)(v14[7] + 8 * v33);
      swift_bridgeObjectRelease_n();
LABEL_23:
      id v17 = v22;
      [v35 insertCalendarInfo:v17];

      ++v15;
      BOOL v18 = v12 == v82;
      uint64_t v12 = v84;
      if (v18) {
        goto LABEL_57;
      }
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
    if (v23 != (id)1)
    {
LABEL_40:
      v36 = v14;
      id v37 = [v22 calendar];
      if (!v37) {
        goto LABEL_107;
      }
      v38 = v37;
      id v39 = [v37 *(SEL *)(v4 + 2616)];

      id v26 = [objc_allocWithZone((Class)CUIKGroupInfo) initWithSource:v39];
      v14 = v36;
      if (!v26) {
        goto LABEL_106;
      }
LABEL_42:
      id v35 = v26;
      uint64_t v40 = (uint64_t)v14;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v90 = v40;
      unint64_t v4 = sub_100003E30(v25, v24);
      uint64_t v43 = *(void *)(v40 + 16);
      BOOL v44 = (v42 & 1) == 0;
      uint64_t v45 = v43 + v44;
      if (__OFADD__(v43, v44)) {
        goto LABEL_54;
      }
      char v46 = v42;
      if (*(void *)(v40 + 24) >= v45)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          v14 = (void *)v90;
          if ((v42 & 1) == 0) {
            goto LABEL_49;
          }
        }
        else
        {
          sub_1000057B4();
          v14 = (void *)v90;
          if ((v46 & 1) == 0) {
            goto LABEL_49;
          }
        }
      }
      else
      {
        sub_1000053C0(v45, isUniquelyReferenced_nonNull_native);
        unint64_t v47 = sub_100003E30(v25, v24);
        if ((v46 & 1) != (v48 & 1)) {
          goto LABEL_108;
        }
        unint64_t v4 = v47;
        v14 = (void *)v90;
        if ((v46 & 1) == 0)
        {
LABEL_49:
          v14[(v4 >> 6) + 8] |= 1 << v4;
          v49 = (uint64_t *)(v14[6] + 16 * v4);
          uint64_t *v49 = v25;
          v49[1] = v24;
          *(void *)(v14[7] + 8 * v4) = v35;
          uint64_t v50 = v14[2];
          BOOL v51 = __OFADD__(v50, 1);
          uint64_t v52 = v50 + 1;
          if (v51) {
            goto LABEL_55;
          }
          v14[2] = v52;
          swift_bridgeObjectRetain();
          goto LABEL_22;
        }
      }
      uint64_t v16 = v14[7];

      *(void *)(v16 + 8 * v4) = v35;
LABEL_22:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v4 = (unint64_t)&WidgetIntentHandler;
      goto LABEL_23;
    }
LABEL_32:
    id v26 = [objc_allocWithZone((Class)CUIKGroupInfo) initWithCustomGroupType:1];
    if (!v26) {
      goto LABEL_105;
    }
    goto LABEL_42;
  }
  v27 = v14;
  id v28 = [v22 calendar];
  if (!v28) {
    goto LABEL_103;
  }
  v29 = v28;
  id v30 = [v28 *(SEL *)(v4 + 2616)];

  if (v30)
  {
    id v31 = [v30 sourceIdentifier];

    uint64_t v25 = sub_1000098E0();
    uint64_t v24 = v32;

    v14 = v27;
    if (v27[2]) {
      goto LABEL_37;
    }
LABEL_31:
    if (v23 != (id)1) {
      goto LABEL_40;
    }
    goto LABEL_32;
  }
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  sub_100009AA0();
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void *sub_100003768()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC16IntentsExtension19WidgetIntentHandler_eventStore);
  id v2 = objc_allocWithZone((Class)EKCalendarVisibilityManager);
  v10[4] = NextEventComplicationConfigurationIntentResponseCode.rawValue.getter;
  v10[5] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100003C08;
  v10[3] = &unk_10000C508;
  uint64_t v3 = _Block_copy(v10);
  id v4 = v1;
  swift_release();
  id v5 = [v2 initWithEventStore:v4 visibilityChangedCallback:v3 queue:0];

  _Block_release(v3);
  id v6 = [v5 visibleCalendars];
  sub_100006488(0, &qword_100011548);
  unint64_t v7 = sub_100009920();

  uint64_t v8 = sub_100005E60(v7);
  swift_bridgeObjectRelease();
  return v8;
}

id sub_1000038BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WidgetIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100003B38(void *a1, int a2, void *a3, void *aBlock, uint64_t (*a5)(void), void *a6)
{
  v10 = _Block_copy(aBlock);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a1;
  sub_1000062AC(v11, (uint64_t)v12, (uint64_t)v10, a5, a6);
  _Block_release(v10);
  _Block_release(v10);
}

uint64_t variable initialization expression of NextEventComplicationConfigurationIntentResponse.code()
{
  return 0;
}

uint64_t type metadata accessor for WidgetIntentHandler()
{
  return self;
}

uint64_t sub_100003C08(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void *sub_100003C4C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_100006428(&qword_100011560);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100005AA0((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100009A20();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_100003D44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006428(&qword_100011560);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  unint64_t v6 = sub_100005C64(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10000661C();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

unint64_t sub_100003E30(uint64_t a1, uint64_t a2)
{
  sub_100009AB0();
  sub_1000098F0();
  Swift::Int v4 = sub_100009AD0();
  return sub_1000056D0(a1, a2, v4);
}

uint64_t sub_100003EA8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100005C50(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100003F24(v6);
  return sub_1000099C0();
}

void sub_100003F24(uint64_t *a1)
{
  sub_100006428(&qword_100011580);
  __chkstk_darwin();
  v178 = (char *)&v167 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::Int v4 = a1[1];
  Swift::Int v5 = sub_100009A60(v4);
  v173 = (void **)v4;
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_172;
    }
    if ((unint64_t)v4 >= 2)
    {
      uint64_t v176 = v1;
      uint64_t v10 = *a1;
      uint64_t v11 = -1;
      uint64_t v12 = 1;
      uint64_t v13 = &WidgetIntentHandler;
      uint64_t v14 = v10;
LABEL_13:
      uint64_t v174 = v14;
      v175 = (void **)v12;
      uint64_t v15 = *(void **)(v10 + 8 * v12);
      uint64_t v177 = v11;
      while (1)
      {
        uint64_t v16 = *(void **)v14;
        id v17 = v15;
        id v18 = v16;
        LODWORD(v16) = [v17 (SEL)v13[354].count];
        if ((int)v16 >= (int)[v18 (SEL)v13[354].count])
        {
          int v19 = [v17 (SEL)v13[354].count];
          if ((int)[v18 (SEL)v13[354].count] < v19)
          {

LABEL_12:
            uint64_t v12 = (uint64_t)v175 + 1;
            uint64_t v14 = v174 + 8;
            uint64_t v11 = v177 - 1;
            if ((void **)((char *)v175 + 1) == v173) {
              return;
            }
            goto LABEL_13;
          }
          id v20 = [v17 title];
          if (!v20) {
            goto LABEL_178;
          }
          id v21 = v20;
          uint64_t v22 = sub_1000098E0();
          uint64_t v24 = v23;

          uint64_t v181 = v22;
          uint64_t v182 = v24;
          id v25 = [v18 title];
          if (!v25) {
            goto LABEL_179;
          }
          id v26 = v25;
          uint64_t v27 = sub_1000098E0();
          uint64_t v29 = v28;

          uint64_t v179 = v27;
          uint64_t v180 = v29;
          uint64_t v30 = sub_100009890();
          uint64_t v31 = (uint64_t)v178;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v178, 1, 1, v30);
          sub_100006568();
          uint64_t v32 = sub_100009990();
          sub_1000065BC(v31);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          uint64_t v13 = &WidgetIntentHandler;
          if (v32 != -1) {
            goto LABEL_12;
          }
        }
        else
        {
        }
        if (!v10) {
          break;
        }
        unint64_t v33 = *(void **)v14;
        uint64_t v15 = *(void **)(v14 + 8);
        *(void *)uint64_t v14 = v15;
        *(void *)(v14 + 8) = v33;
        v14 -= 8;
        if (__CFADD__(v11++, 1)) {
          goto LABEL_12;
        }
      }
LABEL_176:
      __break(1u);
LABEL_177:
      __break(1u);
LABEL_178:
      __break(1u);
LABEL_179:
      __break(1u);
LABEL_180:
      __break(1u);
LABEL_181:
      __break(1u);
LABEL_182:
      __break(1u);
LABEL_183:
      __break(1u);
LABEL_184:
      __break(1u);
LABEL_185:
      __break(1u);
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
LABEL_188:
      __break(1u);
    }
  }
  else
  {
    if (v4 >= 0) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = v4 + 1;
    }
    if (v4 < -1) {
      goto LABEL_171;
    }
    Swift::Int v7 = v5;
    uint64_t v176 = v1;
    v167 = a1;
    if (v4 > 1)
    {
      uint64_t v8 = v6 >> 1;
      sub_100006488(0, &qword_100011568);
      uint64_t v9 = sub_100009950();
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
      v175 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
      uint64_t v183 = v9;
LABEL_25:
      Swift::Int v36 = 0;
      uint64_t v37 = *a1;
      uint64_t v168 = *a1 - 8;
      Swift::Int v169 = v7;
      id v35 = (char *)&_swiftEmptyArrayStorage;
      v38 = &WidgetIntentHandler;
      uint64_t v177 = v37;
      while (1)
      {
        Swift::Int v40 = v36++;
        if (v36 >= v4) {
          goto LABEL_61;
        }
        v170 = v35;
        v41 = *(void **)(v37 + 8 * v40);
        id v42 = *(id *)(v37 + 8 * v36);
        id v43 = v41;
        int v44 = [v42 (SEL)v38[354].count];
        if (v44 < (int)[v43 (SEL)v38[354].count])
        {

          Swift::Int v45 = v40 + 2;
          Swift::Int v4 = (Swift::Int)v173;
          if (v40 + 2 >= (uint64_t)v173)
          {
            id v35 = v170;
            goto LABEL_54;
          }
          LODWORD(v174) = 1;
LABEL_39:
          Swift::Int v60 = v45;
          while (1)
          {
            Swift::Int v45 = v60;
            v61 = *(void **)(v37 + 8 * v36);
            id v62 = *(id *)(v37 + 8 * v60);
            id v63 = v61;
            int v64 = [v62 (SEL)v38[354].count];
            if (v64 < (int)[v63 (SEL)v38[354].count])
            {

              if ((v174 & 1) == 0)
              {
                Swift::Int v36 = v45;
                id v35 = v170;
                Swift::Int v4 = (Swift::Int)v173;
                goto LABEL_61;
              }
            }
            else
            {
              int v65 = [v62 (SEL)v38[354].count];
              if ((int)[v63 (SEL)v38[354].count] >= v65)
              {
                id v66 = [v62 title];
                if (!v66) {
                  goto LABEL_184;
                }
                uint64_t v67 = v66;
                uint64_t v68 = sub_1000098E0();
                uint64_t v70 = v69;

                uint64_t v181 = v68;
                uint64_t v182 = v70;
                id v71 = [v63 title];
                if (!v71) {
                  goto LABEL_185;
                }
                NSString v72 = v71;
                uint64_t v73 = sub_1000098E0();
                uint64_t v75 = v74;

                uint64_t v179 = v73;
                uint64_t v180 = v75;
                uint64_t v76 = sub_100009890();
                uint64_t v77 = (uint64_t)v178;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v178, 1, 1, v76);
                sub_100006568();
                uint64_t v78 = sub_100009990();
                sub_1000065BC(v77);
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease();
                uint64_t v37 = v177;
                v38 = &WidgetIntentHandler;
                if (v174 == (v78 != -1))
                {
                  id v35 = v170;
                  Swift::Int v4 = (Swift::Int)v173;
                  goto LABEL_52;
                }
              }
              else
              {

                if (v174)
                {
                  id v35 = v170;
                  Swift::Int v4 = (Swift::Int)v173;
                  if (v45 < v40) {
                    goto LABEL_173;
                  }
LABEL_54:
                  if (v40 < v45)
                  {
                    id v79 = (uint64_t *)(v168 + 8 * v45);
                    Swift::Int v80 = v45;
                    Swift::Int v81 = v40;
                    uint64_t v82 = (uint64_t *)(v37 + 8 * v40);
                    do
                    {
                      if (v81 != --v80)
                      {
                        if (!v37) {
                          goto LABEL_183;
                        }
                        uint64_t v83 = *v82;
                        *uint64_t v82 = *v79;
                        *id v79 = v83;
                      }
                      ++v81;
                      --v79;
                      ++v82;
                    }
                    while (v81 < v80);
                  }
                  Swift::Int v36 = v45;
                  goto LABEL_61;
                }
              }
            }
            Swift::Int v60 = v45 + 1;
            Swift::Int v36 = v45;
            Swift::Int v4 = (Swift::Int)v173;
            if (v45 + 1 >= (uint64_t)v173)
            {
              ++v45;
              goto LABEL_51;
            }
          }
        }
        int v46 = [v42 (SEL)v38[354].count];
        if ((int)[v43 (SEL)v38[354].count] < v46)
        {

          Swift::Int v45 = v40 + 2;
          Swift::Int v4 = (Swift::Int)v173;
          if (v40 + 2 >= (uint64_t)v173)
          {
            Swift::Int v36 = v40 + 2;
            id v35 = v170;
            goto LABEL_61;
          }
          LODWORD(v174) = 0;
          goto LABEL_39;
        }
        id v47 = [v42 title];
        if (!v47) {
          goto LABEL_187;
        }
        char v48 = v47;
        uint64_t v49 = sub_1000098E0();
        uint64_t v51 = v50;

        uint64_t v181 = v49;
        uint64_t v182 = v51;
        id v52 = [v43 title];
        if (!v52) {
          goto LABEL_188;
        }
        uint64_t v53 = v52;
        uint64_t v54 = sub_1000098E0();
        uint64_t v56 = v55;

        uint64_t v179 = v54;
        uint64_t v180 = v56;
        uint64_t v57 = sub_100009890();
        uint64_t v58 = (uint64_t)v178;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v178, 1, 1, v57);
        sub_100006568();
        uint64_t v59 = sub_100009990();
        sub_1000065BC(v58);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        LODWORD(v174) = v59 == -1;
        Swift::Int v45 = v40 + 2;
        Swift::Int v4 = (Swift::Int)v173;
        uint64_t v37 = v177;
        if (v40 + 2 < (uint64_t)v173) {
          goto LABEL_39;
        }
LABEL_51:
        id v35 = v170;
LABEL_52:
        Swift::Int v36 = v45;
        if (v174)
        {
          if (v45 < v40) {
            goto LABEL_173;
          }
          goto LABEL_54;
        }
LABEL_61:
        if (v36 >= v4) {
          goto LABEL_84;
        }
        if (__OFSUB__(v36, v40)) {
          goto LABEL_170;
        }
        if (v36 - v40 >= v169) {
          goto LABEL_84;
        }
        if (__OFADD__(v40, v169)) {
          goto LABEL_174;
        }
        if (v40 + v169 >= v4) {
          Swift::Int v84 = v4;
        }
        else {
          Swift::Int v84 = v40 + v169;
        }
        if (v84 < v40)
        {
LABEL_175:
          __break(1u);
          goto LABEL_176;
        }
        if (v36 == v84) {
          goto LABEL_84;
        }
        v170 = v35;
        Swift::Int v171 = v84;
        uint64_t v85 = v168 + 8 * v36;
        Swift::Int v172 = v40;
LABEL_73:
        uint64_t v86 = v85;
        unint64_t v87 = *(void **)(v37 + 8 * v36);
        Swift::Int v88 = v40;
        uint64_t v174 = v86;
        uint64_t v89 = v86;
        while (1)
        {
          uint64_t v90 = *(void **)v89;
          id v91 = v87;
          id v92 = v90;
          LODWORD(v90) = [v91 (SEL)v38[354].count];
          if ((int)v90 >= (int)[v92 (SEL)v38[354].count]) {
            break;
          }

LABEL_80:
          if (!v37) {
            goto LABEL_177;
          }
          v107 = *(void **)v89;
          unint64_t v87 = *(void **)(v89 + 8);
          *(void *)uint64_t v89 = v87;
          *(void *)(v89 + 8) = v107;
          v89 -= 8;
          if (v36 == ++v88) {
            goto LABEL_72;
          }
        }
        int v93 = [v91 (SEL)v38[354].count];
        if ((int)[v92 (SEL)v38[354].count] >= v93) {
          break;
        }

LABEL_72:
        ++v36;
        uint64_t v85 = v174 + 8;
        Swift::Int v40 = v172;
        if (v36 != v171) {
          goto LABEL_73;
        }
        Swift::Int v36 = v171;
        id v35 = v170;
LABEL_84:
        if (v36 < v40) {
          goto LABEL_165;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v35 = sub_1000052B0(0, *((void *)v35 + 2) + 1, 1, v35);
        }
        unint64_t v109 = *((void *)v35 + 2);
        unint64_t v108 = *((void *)v35 + 3);
        unint64_t v39 = v109 + 1;
        if (v109 >= v108 >> 1) {
          id v35 = sub_1000052B0((char *)(v108 > 1), v109 + 1, 1, v35);
        }
        *((void *)v35 + 2) = v39;
        v110 = v35 + 32;
        v111 = &v35[16 * v109 + 32];
        *(void *)v111 = v40;
        *((void *)v111 + 1) = v36;
        if (v109)
        {
          while (2)
          {
            unint64_t v112 = v39 - 1;
            if (v39 >= 4)
            {
              v117 = &v110[16 * v39];
              uint64_t v118 = *((void *)v117 - 8);
              uint64_t v119 = *((void *)v117 - 7);
              BOOL v123 = __OFSUB__(v119, v118);
              uint64_t v120 = v119 - v118;
              if (v123) {
                goto LABEL_154;
              }
              uint64_t v122 = *((void *)v117 - 6);
              uint64_t v121 = *((void *)v117 - 5);
              BOOL v123 = __OFSUB__(v121, v122);
              uint64_t v115 = v121 - v122;
              char v116 = v123;
              if (v123) {
                goto LABEL_155;
              }
              unint64_t v124 = v39 - 2;
              v125 = &v110[16 * v39 - 32];
              uint64_t v127 = *(void *)v125;
              uint64_t v126 = *((void *)v125 + 1);
              BOOL v123 = __OFSUB__(v126, v127);
              uint64_t v128 = v126 - v127;
              if (v123) {
                goto LABEL_156;
              }
              BOOL v123 = __OFADD__(v115, v128);
              uint64_t v129 = v115 + v128;
              if (v123) {
                goto LABEL_158;
              }
              if (v129 >= v120)
              {
                v147 = &v110[16 * v112];
                uint64_t v149 = *(void *)v147;
                uint64_t v148 = *((void *)v147 + 1);
                BOOL v123 = __OFSUB__(v148, v149);
                uint64_t v150 = v148 - v149;
                if (v123) {
                  goto LABEL_164;
                }
                BOOL v140 = v115 < v150;
              }
              else
              {
LABEL_103:
                if (v116) {
                  goto LABEL_157;
                }
                unint64_t v124 = v39 - 2;
                v130 = &v110[16 * v39 - 32];
                uint64_t v132 = *(void *)v130;
                uint64_t v131 = *((void *)v130 + 1);
                BOOL v133 = __OFSUB__(v131, v132);
                uint64_t v134 = v131 - v132;
                char v135 = v133;
                if (v133) {
                  goto LABEL_159;
                }
                v136 = &v110[16 * v112];
                uint64_t v138 = *(void *)v136;
                uint64_t v137 = *((void *)v136 + 1);
                BOOL v123 = __OFSUB__(v137, v138);
                uint64_t v139 = v137 - v138;
                if (v123) {
                  goto LABEL_161;
                }
                if (__OFADD__(v134, v139)) {
                  goto LABEL_163;
                }
                if (v134 + v139 < v115) {
                  goto LABEL_115;
                }
                BOOL v140 = v115 < v139;
              }
              if (v140) {
                unint64_t v112 = v124;
              }
            }
            else
            {
              if (v39 == 3)
              {
                uint64_t v114 = *((void *)v35 + 4);
                uint64_t v113 = *((void *)v35 + 5);
                BOOL v123 = __OFSUB__(v113, v114);
                uint64_t v115 = v113 - v114;
                char v116 = v123;
                goto LABEL_103;
              }
              uint64_t v141 = *((void *)v35 + 4);
              uint64_t v142 = *((void *)v35 + 5);
              BOOL v123 = __OFSUB__(v142, v141);
              uint64_t v134 = v142 - v141;
              char v135 = v123;
LABEL_115:
              if (v135) {
                goto LABEL_160;
              }
              v143 = &v110[16 * v112];
              uint64_t v145 = *(void *)v143;
              uint64_t v144 = *((void *)v143 + 1);
              BOOL v123 = __OFSUB__(v144, v145);
              uint64_t v146 = v144 - v145;
              if (v123) {
                goto LABEL_162;
              }
              if (v146 < v134) {
                goto LABEL_27;
              }
            }
            unint64_t v151 = v112 - 1;
            if (v112 - 1 >= v39)
            {
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
LABEL_154:
              __break(1u);
LABEL_155:
              __break(1u);
LABEL_156:
              __break(1u);
LABEL_157:
              __break(1u);
LABEL_158:
              __break(1u);
LABEL_159:
              __break(1u);
LABEL_160:
              __break(1u);
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
LABEL_171:
              __break(1u);
LABEL_172:
              __break(1u);
LABEL_173:
              __break(1u);
LABEL_174:
              __break(1u);
              goto LABEL_175;
            }
            if (!v37) {
              goto LABEL_182;
            }
            v152 = v35;
            uint64_t v153 = v37;
            v154 = &v110[16 * v151];
            uint64_t v155 = *(void *)v154;
            v156 = &v110[16 * v112];
            uint64_t v157 = *((void *)v156 + 1);
            uint64_t v158 = v176;
            sub_100004CB4((void **)(v153 + 8 * *(void *)v154), (void **)(v153 + 8 * *(void *)v156), (void **)(v153 + 8 * v157), v175);
            uint64_t v176 = v158;
            if (v158) {
              goto LABEL_148;
            }
            if (v157 < v155) {
              goto LABEL_151;
            }
            if (v112 > *((void *)v152 + 2)) {
              goto LABEL_152;
            }
            *(void *)v154 = v155;
            *(void *)&v110[16 * v151 + 8] = v157;
            unint64_t v159 = *((void *)v152 + 2);
            if (v112 >= v159) {
              goto LABEL_153;
            }
            id v35 = v152;
            unint64_t v39 = v159 - 1;
            memmove(&v110[16 * v112], v156 + 16, 16 * (v159 - 1 - v112));
            *((void *)v152 + 2) = v159 - 1;
            BOOL v140 = v159 > 2;
            uint64_t v37 = v177;
            v38 = &WidgetIntentHandler;
            if (!v140) {
              goto LABEL_27;
            }
            continue;
          }
        }
        unint64_t v39 = 1;
LABEL_27:
        Swift::Int v4 = (Swift::Int)v173;
        if (v36 >= (uint64_t)v173) {
          goto LABEL_137;
        }
      }
      id v94 = [v91 title];
      if (!v94) {
        goto LABEL_180;
      }
      v95 = v94;
      uint64_t v96 = sub_1000098E0();
      uint64_t v98 = v97;

      uint64_t v181 = v96;
      uint64_t v182 = v98;
      id v99 = [v92 title];
      if (!v99) {
        goto LABEL_181;
      }
      v100 = v99;
      uint64_t v101 = sub_1000098E0();
      uint64_t v103 = v102;

      uint64_t v179 = v101;
      uint64_t v180 = v103;
      uint64_t v104 = sub_100009890();
      uint64_t v105 = (uint64_t)v178;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56))(v178, 1, 1, v104);
      sub_100006568();
      uint64_t v106 = sub_100009990();
      sub_1000065BC(v105);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      uint64_t v37 = v177;
      v38 = &WidgetIntentHandler;
      if (v106 != -1) {
        goto LABEL_72;
      }
      goto LABEL_80;
    }
    id v35 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v183 = (uint64_t)&_swiftEmptyArrayStorage;
    v175 = (void **)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 == 1) {
      goto LABEL_25;
    }
    unint64_t v39 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_137:
    if (v39 >= 2)
    {
      uint64_t v160 = *v167;
      do
      {
        unint64_t v161 = v39 - 2;
        if (v39 < 2) {
          goto LABEL_166;
        }
        if (!v160) {
          goto LABEL_186;
        }
        uint64_t v162 = *(void *)&v35[16 * v161 + 32];
        uint64_t v163 = *(void *)&v35[16 * v39 + 24];
        uint64_t v164 = v176;
        sub_100004CB4((void **)(v160 + 8 * v162), (void **)(v160 + 8 * *(void *)&v35[16 * v39 + 16]), (void **)(v160 + 8 * v163), v175);
        uint64_t v176 = v164;
        if (v164) {
          break;
        }
        if (v163 < v162) {
          goto LABEL_167;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v35 = sub_1000053AC((uint64_t)v35);
        }
        if (v161 >= *((void *)v35 + 2)) {
          goto LABEL_168;
        }
        v165 = &v35[16 * v161 + 32];
        *(void *)v165 = v162;
        *((void *)v165 + 1) = v163;
        unint64_t v166 = *((void *)v35 + 2);
        if (v39 > v166) {
          goto LABEL_169;
        }
        memmove(&v35[16 * v39 + 16], &v35[16 * v39 + 32], 16 * (v166 - v39));
        *((void *)v35 + 2) = v166 - 1;
        unint64_t v39 = v166 - 1;
      }
      while (v166 > 2);
    }
LABEL_148:
    swift_bridgeObjectRelease();
    *(void *)((v183 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
    sub_100009930();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100004CB4(void **a1, void **a2, void **a3, void **a4)
{
  sub_100006428(&qword_100011580);
  __chkstk_darwin();
  Swift::Int v60 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v10 = (char *)a2 - (char *)a1;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v70 = a3;
  uint64_t v12 = (char *)a3 - (char *)a2;
  uint64_t v13 = v12 / 8;
  if (v10 >> 3 >= v12 / 8)
  {
    if (a4 != a2 || &a2[v13] <= a4) {
      memmove(a4, a2, 8 * v13);
    }
    Swift::Int v36 = a2;
    uint64_t v15 = &a4[v13];
    if (v12 < 8 || a1 >= a2) {
      goto LABEL_54;
    }
    uint64_t v59 = v4;
    uint64_t v37 = v70 - 1;
    v38 = v36;
    id v62 = a4;
    id v63 = a1;
    while (1)
    {
      uint64_t v70 = v37 + 1;
      unint64_t v39 = *(v15 - 1);
      int v64 = v15 - 1;
      v41 = v38 - 1;
      Swift::Int v40 = *(v38 - 1);
      id v42 = v39;
      id v43 = v40;
      LODWORD(v40) = [v42 sortOrder];
      if ((int)v40 < (int)[v43 sortOrder]) {
        break;
      }
      int v46 = [v42 sortOrder];
      if ((int)[v43 sortOrder] >= v46)
      {
        int v65 = v15;
        v61 = v38;
        uint64_t result = (uint64_t)[v42 title];
        int v44 = v63;
        if (!result) {
          goto LABEL_60;
        }
        id v47 = (void *)result;
        uint64_t v48 = sub_1000098E0();
        uint64_t v50 = v49;

        uint64_t v68 = v48;
        uint64_t v69 = v50;
        uint64_t result = (uint64_t)[v43 title];
        if (!result)
        {
LABEL_61:
          __break(1u);
          return result;
        }
        uint64_t v51 = (void *)result;
        uint64_t v52 = sub_1000098E0();
        uint64_t v54 = v53;

        uint64_t v66 = v52;
        uint64_t v67 = v54;
        uint64_t v55 = sub_100009890();
        uint64_t v56 = (uint64_t)v60;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v60, 1, 1, v55);
        sub_100006568();
        uint64_t v57 = sub_100009990();
        sub_1000065BC(v56);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v38 = v61;
        uint64_t v15 = v65;
        if (v57 == -1) {
          goto LABEL_33;
        }
      }
      else
      {

        int v44 = v63;
      }
      a4 = v62;
      if (v70 != v15)
      {
        uint64_t v15 = v64;
        v41 = v64;
        goto LABEL_48;
      }
      v41 = v64;
      BOOL v45 = v37 >= v15;
      uint64_t v15 = v64;
      if (v45) {
        goto LABEL_48;
      }
LABEL_49:
      if (v15 > a4)
      {
        --v37;
        if (v38 > v44) {
          continue;
        }
      }
      Swift::Int v36 = v38;
      goto LABEL_54;
    }

    int v44 = v63;
LABEL_33:
    a4 = v62;
    if (v70 != v38)
    {
      v38 = v41;
LABEL_48:
      *uint64_t v37 = *v41;
      goto LABEL_49;
    }
    BOOL v45 = v37 >= v38;
    v38 = v41;
    if (v45) {
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  uint64_t v14 = a2;
  if (a4 != a1 || &a1[v11] <= a4) {
    memmove(a4, a1, 8 * v11);
  }
  uint64_t v15 = &a4[v11];
  if ((char *)a2 - (char *)a1 >= 8 && a2 < v70)
  {
    uint64_t v59 = v4;
    uint64_t v16 = &WidgetIntentHandler;
    int v65 = &a4[v11];
    while (1)
    {
      id v17 = *a4;
      id v18 = *v14;
      id v19 = v17;
      LODWORD(v17) = [v18 (SEL)v16[354].count];
      if ((int)v17 < (int)[v19 (SEL)v16[354].count]) {
        break;
      }
      int v22 = [v18 (SEL)v16[354].count];
      if ((int)[v19 (SEL)v16[354].count] >= v22)
      {
        v61 = v14;
        uint64_t v23 = a4;
        uint64_t result = (uint64_t)[v18 title];
        if (!result)
        {
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
        id v25 = (void *)result;
        uint64_t v26 = sub_1000098E0();
        uint64_t v28 = v27;

        uint64_t v68 = v26;
        uint64_t v69 = v28;
        uint64_t result = (uint64_t)[v19 title];
        if (!result) {
          goto LABEL_59;
        }
        uint64_t v29 = (void *)result;
        uint64_t v30 = sub_1000098E0();
        uint64_t v32 = v31;

        uint64_t v66 = v30;
        uint64_t v67 = v32;
        uint64_t v33 = sub_100009890();
        uint64_t v34 = (uint64_t)v60;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v60, 1, 1, v33);
        sub_100006568();
        uint64_t v35 = sub_100009990();
        sub_1000065BC(v34);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        a4 = v23;
        uint64_t v14 = v61;
        uint64_t v16 = &WidgetIntentHandler;
        if (v35 == -1) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      id v20 = a4;
      BOOL v21 = a1 == a4++;
      uint64_t v15 = v65;
      if (!v21) {
        goto LABEL_13;
      }
LABEL_14:
      ++a1;
      if (a4 >= v15 || v14 >= v70)
      {
        Swift::Int v36 = a1;
        goto LABEL_54;
      }
    }

LABEL_12:
    id v20 = v14;
    BOOL v21 = a1 == v14++;
    uint64_t v15 = v65;
    if (v21) {
      goto LABEL_14;
    }
LABEL_13:
    *a1 = *v20;
    goto LABEL_14;
  }
  Swift::Int v36 = a1;
LABEL_54:
  if (v36 != a4
    || v36 >= (void **)((char *)a4
                      + (((char *)v15 - (char *)a4 + ((char *)v15 - (char *)a4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(v36, a4, 8 * (v15 - a4));
  }
  return 1;
}

char *sub_1000052B0(char *result, int64_t a2, char a3, char *a4)
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
    sub_100006428(&qword_100011590);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1000053AC(uint64_t a1)
{
  return sub_1000052B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000053C0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006428(&qword_100011558);
  char v38 = a2;
  uint64_t v6 = sub_100009A40();
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
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    int v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_100009AB0();
    sub_1000098F0();
    uint64_t result = sub_100009AD0();
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
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1000056D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100009A80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100009A80() & 1) == 0);
    }
  }
  return v6;
}

id sub_1000057B4()
{
  uint64_t v1 = v0;
  sub_100006428(&qword_100011558);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100009A30();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void (*sub_100005968(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100005A18(v6, a2, a3);
  return sub_1000059D0;
}

void sub_1000059D0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100005A18(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_1000099A0();
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
    *(void *)uint64_t v3 = v4;
    return sub_100005A98;
  }
  __break(1u);
  return result;
}

void sub_100005A98(id *a1)
{
}

uint64_t sub_100005AA0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100009A20();
    id result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100009A20();
      id result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1000064C4();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100006428(&qword_100011570);
            uint64_t v10 = sub_100005968(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_100006488(0, &qword_100011568);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100005C50(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_100005C64(void *result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
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
  uint64_t v11 = a2;
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
    unint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    id result = v20;
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

void *sub_100005E60(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    id result = &_swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    unint64_t v9 = &_swiftEmptyArrayStorage;
    sub_1000099D0();
    if (v2 < 0)
    {
      __break(1u);
      id result = (void *)swift_release();
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_1000099A0();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = v5;
      sub_100002984(&v7, &v8);

      ++v4;
      sub_1000099B0();
      sub_1000099E0();
      sub_1000099F0();
      sub_1000099C0();
      if (v2 == v4) {
        return v9;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100009A20();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_100005FA8(uint64_t a1, unint64_t a2)
{
  id v19 = (id)sub_100002D88();
  sub_100009970();
  sub_100006428(&qword_100011530);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10000A180;
  id v4 = [v19 sections];
  sub_100006428(&qword_100011540);
  unint64_t v5 = sub_100009920();

  if (v5 >> 62) {
    goto LABEL_22;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    *(void *)(v3 + 56) = &type metadata for Int;
    *(void *)(v3 + 64) = &protocol witness table for Int;
    *(void *)(v3 + 32) = v6;
    id v7 = [v19 sections];
    unint64_t v8 = sub_100009920();

    *(void *)(v3 + 96) = &type metadata for Int;
    *(void *)(v3 + 104) = &protocol witness table for Int;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_100009A20();
    }
    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    unint64_t v18 = a2;
    if (!v9) {
      break;
    }
    if (v9 < 1)
    {
      __break(1u);
      return;
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = (v8 & 0xC000000000000001) != 0 ? (id)sub_1000099A0() : *(id *)(v8 + 8 * v10 + 32);
      uint64_t v13 = v12;
      id v14 = [v12 items];
      type metadata accessor for EKUICalendar();
      a2 = sub_100009920();

      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_100009A20();

        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v15 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      BOOL v16 = __OFADD__(v11, v15);
      v11 += v15;
      if (v16) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100009A20();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = 0;
LABEL_18:
  swift_bridgeObjectRelease();
  *(void *)(v3 + 72) = v11;
  swift_bridgeObjectRelease();
  sub_100006488(0, &qword_100011538);
  int64_t v17 = (void *)sub_100009980();
  sub_1000098A0();
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, id, void))(v18 + 16))(v18, v19, 0);
}

void sub_1000062AC(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void *a5)
{
  id v9 = [a1 mirrorCalendarApp];
  if (v9)
  {
    uint64_t v10 = v9;
    if ([v9 BOOLValue])
    {
      uint64_t v11 = (uint64_t)sub_100003768();
LABEL_7:
      uint64_t v13 = v11;

      goto LABEL_9;
    }
  }
  id v12 = [a1 calendars];
  if (v12)
  {
    uint64_t v10 = v12;
    type metadata accessor for EKUICalendar();
    uint64_t v11 = sub_100009920();
    goto LABEL_7;
  }
  uint64_t v13 = 0;
LABEL_9:
  id v14 = (char *)[objc_allocWithZone((Class)a4(0)) init];
  uint64_t v15 = &v14[*a5];
  swift_beginAccess();
  *(void *)uint64_t v15 = 4;
  [v14 setUserActivity:0];
  if (v13)
  {
    type metadata accessor for EKUICalendar();
    v16.super.Class isa = sub_100009910().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v16.super.Class isa = 0;
  }
  [v14 setCalendars:v16.super.isa];

  (*(void (**)(uint64_t, char *))(a3 + 16))(a3, v14);
}

uint64_t sub_100006428(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000646C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000647C()
{
  return swift_release();
}

uint64_t sub_100006488(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1000064C4()
{
  unint64_t result = qword_100011578;
  if (!qword_100011578)
  {
    sub_100006520(&qword_100011570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011578);
  }
  return result;
}

uint64_t sub_100006520(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006568()
{
  unint64_t result = qword_100011588;
  if (!qword_100011588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011588);
  }
  return result;
}

uint64_t sub_1000065BC(uint64_t a1)
{
  uint64_t v2 = sub_100006428(&qword_100011580);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000661C()
{
  return swift_release();
}

id sub_100006758()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *sub_1000067B0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000067F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

char *EKUICalendarsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  unint64_t v5 = (char *)[objc_allocWithZone(v2) init];
  uint64_t v6 = &v5[OBJC_IVAR___EKUICalendarsIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  id v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id NextEventComplicationConfigurationIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id EKUICalendarsIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  return objc_msgSendSuper2(&v2, "init");
}

id NextEventComplicationConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id EKUICalendarsIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id NextEventComplicationConfigurationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id EKUICalendarsIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  id v6 = objc_msgSendSuper2(&v8, "initWithIdentifier:backingStore:", v5, a3);

  return v6;
}

id NextEventComplicationConfigurationIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000098D0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000098D0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id EKUICalendarsIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000098D0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000098D0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  id v10 = objc_msgSendSuper2(&v12, "initWithDomain:verb:parametersByName:", v7, v8, v9.super.isa);

  return v10;
}

id EKUICalendarsIntent.__deallocating_deinit()
{
  return sub_1000075E0(type metadata accessor for EKUICalendarsIntent);
}

unint64_t NextEventComplicationConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_100007618(a1);
}

BOOL sub_100006F10(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006F24()
{
  Swift::UInt v1 = *v0;
  sub_100009AB0();
  sub_100009AC0(v1);
  return sub_100009AD0();
}

void sub_100006F6C()
{
  sub_100009AC0(*v0);
}

Swift::Int sub_100006F98()
{
  Swift::UInt v1 = *v0;
  sub_100009AB0();
  sub_100009AC0(v1);
  return sub_100009AD0();
}

unint64_t sub_100006FDC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_100007618(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100007010(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t EKUICalendarsIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___EKUICalendarsIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *EKUICalendarsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___EKUICalendarsIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

uint64_t type metadata accessor for EKUICalendarsIntent()
{
  return self;
}

id EKUICalendarsIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id EKUICalendarsIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id NextEventComplicationConfigurationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id EKUICalendarsIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_1000073E8(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id NextEventComplicationConfigurationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id EKUICalendarsIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithPropertiesByName:", v2.super.isa);

  if (v3) {
  return v3;
  }
}

id EKUICalendarsIntentResponse.__deallocating_deinit()
{
  return sub_1000075E0(type metadata accessor for EKUICalendarsIntentResponse);
}

id sub_1000075E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_100007618(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for EKUICalendarsIntentResponse()
{
  return self;
}

unint64_t sub_100007650()
{
  unint64_t result = qword_100011628;
  if (!qword_100011628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011628);
  }
  return result;
}

uint64_t sub_1000076A4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___EKUICalendarsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000076F8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___EKUICalendarsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for EKUICalendarsIntentResponseCode()
{
  return &type metadata for EKUICalendarsIntentResponseCode;
}

char *NextEventComplicationConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id NextEventComplicationConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  return objc_msgSendSuper2(&v2, "init");
}

id NextEventComplicationConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id NextEventComplicationConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  id v6 = objc_msgSendSuper2(&v8, "initWithIdentifier:backingStore:", v5, a3);

  return v6;
}

id NextEventComplicationConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000098D0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000098D0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  id v10 = objc_msgSendSuper2(&v12, "initWithDomain:verb:parametersByName:", v7, v8, v9.super.isa);

  return v10;
}

id NextEventComplicationConfigurationIntent.__deallocating_deinit()
{
  return sub_100008148(type metadata accessor for NextEventComplicationConfigurationIntent);
}

uint64_t NextEventComplicationConfigurationIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *NextEventComplicationConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

uint64_t type metadata accessor for NextEventComplicationConfigurationIntent()
{
  return self;
}

id NextEventComplicationConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id NextEventComplicationConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id NextEventComplicationConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_100007FD4(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id NextEventComplicationConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithPropertiesByName:", v2.super.isa);

  if (v3) {
  return v3;
  }
}

id NextEventComplicationConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_100008148(type metadata accessor for NextEventComplicationConfigurationIntentResponse);
}

id sub_100008148(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for NextEventComplicationConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_1000081A8()
{
  unint64_t result = qword_100011688;
  if (!qword_100011688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011688);
  }
  return result;
}

uint64_t sub_1000081FC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_100008250(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for NextEventComplicationConfigurationIntentResponseCode()
{
  return &type metadata for NextEventComplicationConfigurationIntentResponseCode;
}

id LunarDateComplicationConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for LunarDateComplicationConfigurationIntent()
{
  return self;
}

id LunarDateComplicationConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id LunarDateComplicationConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  id v6 = objc_msgSendSuper2(&v8, "initWithIdentifier:backingStore:", v5, a3);

  return v6;
}

id LunarDateComplicationConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000098D0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000098D0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  id v10 = objc_msgSendSuper2(&v12, "initWithDomain:verb:parametersByName:", v7, v8, v9.super.isa);

  return v10;
}

id LunarDateComplicationConfigurationIntent.__deallocating_deinit()
{
  return sub_100008C98(type metadata accessor for LunarDateComplicationConfigurationIntent);
}

uint64_t LunarDateComplicationConfigurationIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *LunarDateComplicationConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *LunarDateComplicationConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id LunarDateComplicationConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id LunarDateComplicationConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id LunarDateComplicationConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_100008B24(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id LunarDateComplicationConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithPropertiesByName:", v2.super.isa);

  if (v3) {
  return v3;
  }
}

id LunarDateComplicationConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_100008C98(type metadata accessor for LunarDateComplicationConfigurationIntentResponse);
}

id sub_100008C98(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for LunarDateComplicationConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_100008CF8()
{
  unint64_t result = qword_1000116E8;
  if (!qword_1000116E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000116E8);
  }
  return result;
}

uint64_t sub_100008D4C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_100008DA0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for LunarDateComplicationConfigurationIntentResponseCode()
{
  return &type metadata for LunarDateComplicationConfigurationIntentResponseCode;
}

uint64_t static EKUICalendar.supportsSecureCoding.getter()
{
  return 1;
}

id EKUICalendar.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_1000098D0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id EKUICalendar.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_1000098D0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for EKUICalendar();
  id v11 = objc_msgSendSuper2(&v13, "initWithIdentifier:displayString:pronunciationHint:", v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for EKUICalendar()
{
  return self;
}

id EKUICalendar.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendar();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id EKUICalendar.__deallocating_deinit()
{
  return sub_100009858(type metadata accessor for EKUICalendar);
}

id static EKUICalendarResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___EKUICalendarResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
  return v2;
}

id static EKUICalendarResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1000092E0();
    swift_bridgeObjectRetain();
    sub_100009A10();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100009A90();
    sub_1000092E0();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_1000092E0();
  Class isa = sub_100009910().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___EKUICalendarResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, "disambiguationWithObjectsToDisambiguate:", isa);

  return v3;
}

unint64_t sub_1000092E0()
{
  unint64_t result = qword_100011768;
  if (!qword_100011768)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100011768);
  }
  return result;
}

id static EKUICalendarResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___EKUICalendarResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
  return v2;
}

void static EKUICalendarResolutionResult.success(with:)()
{
}

void static EKUICalendarResolutionResult.disambiguation(with:)()
{
}

void static EKUICalendarResolutionResult.confirmationRequired(with:)()
{
}

id EKUICalendarResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_1000098B0().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id EKUICalendarResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_1000098B0().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for EKUICalendarResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, "initWithJSONDictionary:forIntent:", isa, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for EKUICalendarResolutionResult()
{
  return self;
}

id EKUICalendarResolutionResult.__deallocating_deinit()
{
  return sub_100009858(type metadata accessor for EKUICalendarResolutionResult);
}

id sub_100009858(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_100009890()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000098A0()
{
  return os_log(_:dso:log:_:_:)();
}

NSDictionary sub_1000098B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000098C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000098D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000098E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000098F0()
{
  return String.hash(into:)();
}

uint64_t sub_100009900()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100009910()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100009920()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009930()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100009940()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100009950()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100009960()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100009970()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009980()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100009990()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t sub_1000099A0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000099B0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000099C0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000099D0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000099E0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000099F0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100009A00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009A10()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100009A20()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100009A30()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100009A40()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

Swift::Int sub_100009A60(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100009A70()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100009A80()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009A90()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100009AA0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100009AB0()
{
  return Hasher.init(_seed:)();
}

void sub_100009AC0(Swift::UInt a1)
{
}

Swift::Int sub_100009AD0()
{
  return Hasher._finalize()();
}

uint64_t CUIKDisplayedTitleForCalendar()
{
  return _CUIKDisplayedTitleForCalendar();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t ScaledCalendarColorDotImageForColor()
{
  return _ScaledCalendarColorDotImageForColor();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}