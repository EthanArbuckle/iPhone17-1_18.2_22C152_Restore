uint64_t sub_1000A2B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  Class isa;
  Class v40;
  void (*v41)(char *, uint64_t);
  void *v42;
  unsigned int v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  char *v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t, uint64_t);
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  id v76[5];
  uint64_t vars8;

  v1 = v0;
  v2 = sub_100005D74(&qword_1000FD070);
  v4 = __chkstk_darwin(v2, v3);
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  v9 = (char *)&v65 - v8;
  v10 = sub_100005D74((uint64_t *)&unk_1000FD480);
  __chkstk_darwin(v10 - 8, v11);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000BB138();
  v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  v74 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1000BB238();
  result = __chkstk_darwin(v18, v19);
  v23 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent;
  v25 = *(void *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent);
  if (v25)
  {
    v71 = v6;
    v72 = v15;
    v26 = *(void *)(v25 + 80);
    if (!v26)
    {
      __break(1u);
      goto LABEL_41;
    }
    v73 = v21;
    v70 = v2;
    v27 = (void *)(v26 & 0xFFFFFFFFFFFFFF8);
    if (v26 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_1000BC0D8())
      {
LABEL_5:
        if ((v26 & 0xC000000000000001) != 0)
        {
          v29 = sub_1000BC018();
        }
        else
        {
          if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_34;
          }
          v29 = *(void *)(v26 + 32);
          swift_retain();
        }
        swift_bridgeObjectRelease();
        v30 = (unint64_t *)(v29 + OBJC_IVAR____TtC8Business15IMBProposedDate_timeslots);
        swift_beginAccess();
        v26 = *v30;
        swift_bridgeObjectRetain();
        swift_release();
        if (!(v26 >> 62))
        {
          v31 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v31) {
            goto LABEL_10;
          }
          return swift_bridgeObjectRelease();
        }
LABEL_34:
        swift_bridgeObjectRetain();
        v31 = sub_1000BC0D8();
        swift_bridgeObjectRelease();
        if (v31)
        {
LABEL_10:
          if ((v26 & 0xC000000000000001) != 0)
          {
            v32 = sub_1000BC018();
          }
          else
          {
            if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_39;
            }
            v32 = *(void *)(v26 + 32);
            swift_retain();
          }
          swift_bridgeObjectRelease();
          v33 = *(void *)(v1 + v24);
          if (!v33) {
            return swift_release();
          }
          v67 = v14;
          v34 = *(void **)(v33 + 16);
          v35 = *(id *)(v33 + 56);
          v36 = v32;
          v37 = v34;
          v38 = [v37 defaultCalendarForNewEvents];
          [v35 setCalendar:v38];

          isa = sub_1000BB1C8().super.isa;
          [v35 setStartDate:isa];

          sub_1000BB1F8();
          v68 = v36;
          sub_1000BB1E8();
          v40 = sub_1000BB1C8().super.isa;
          v41 = *(void (**)(char *, uint64_t))(v73 + 8);
          v41(v23, v18);
          [v35 setEndDate:v40];

          v76[0] = 0;
          v69 = v37;
          v42 = v37;
          v27 = v35;
          v43 = [v42 saveEvent:v35 span:0 error:v76];
          v44 = v76[0];
          if (v43)
          {
            v45 = (void *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_urlHelper);
            sub_100041348((uint64_t)v45, (uint64_t)v76);
            sub_100007350(v76, (uint64_t)v76[3]);
            v46 = v44;
            v66 = v35;
            v47 = [v35 startDate];
            if (v47)
            {
              v48 = v47;
              sub_1000BB208();

              v49 = v73;
              (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v9, v23, v18);
              v65 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56);
              v65(v9, 0, 1, v18);
              result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48))(v9, 1, v18);
              v50 = v67;
              v51 = v72;
              if (result != 1)
              {
                sub_1000550E4();
                v41(v9, v18);
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v13, 1, v50) != 1)
                {
                  v61 = (uint64_t)v74;
                  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v74, v13, v50);
                  sub_10000FE60((uint64_t)v76);
                  sub_100007350(v45, v45[3]);
                  sub_1000548E0(v61, 1, 0, 0);

                  swift_release();
                  return (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 8))(v61, v50);
                }
                sub_10005101C((uint64_t)v13);
                sub_10000FE60((uint64_t)v76);
                if (qword_1000FBCB8 != -1) {
                  swift_once();
                }
                sub_1000BBD08();
                sub_100005D74((uint64_t *)&unk_1000FCE50);
                v52 = swift_allocObject();
                *(_OWORD *)(v52 + 16) = xmmword_1000BF150;
                v53 = [v66 startDate];
                if (v53)
                {
                  v54 = v53;
                  v55 = v71;
                  sub_1000BB208();

                  v56 = 0;
                }
                else
                {
                  v56 = 1;
                  v55 = v71;
                }
                v65(v55, v56, 1, v18);
                v62 = sub_1000BBB28();
                v64 = v63;
                *(void *)(v52 + 56) = &type metadata for String;
                *(void *)(v52 + 64) = sub_1000074A4();
                *(void *)(v52 + 32) = v62;
                *(void *)(v52 + 40) = v64;
                sub_1000BB4A8();
                swift_release();

                return swift_bridgeObjectRelease();
              }
LABEL_42:
              __break(1u);
              return result;
            }
LABEL_41:
            result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v73 + 56))(v9, 1, 1, v18);
            goto LABEL_42;
          }
          v57 = v76[0];
          v58 = (void *)sub_1000BB088();

          swift_willThrow();
          v76[0] = v58;
          sub_100005D74(&qword_1001007D0);
          v31 = sub_1000074F8(0, &qword_100100900);
          swift_dynamicCast();
          v9 = v75;
          if (qword_1000FBCB8 == -1)
          {
LABEL_24:
            sub_1000BBD08();
            sub_100005D74((uint64_t *)&unk_1000FCE50);
            v59 = swift_allocObject();
            *(_OWORD *)(v59 + 16) = xmmword_1000BF150;
            *(void *)(v59 + 56) = v31;
            *(void *)(v59 + 64) = sub_1000A47D4();
            *(void *)(v59 + 32) = v9;
            v60 = v9;
            sub_1000BB4A8();

            swift_bridgeObjectRelease();
            swift_release();

            return swift_errorRelease();
          }
LABEL_39:
          swift_once();
          goto LABEL_24;
        }
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      v28 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v28) {
        goto LABEL_5;
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000A34EC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent);
  if (v1)
  {
    id v2 = [*(id *)(v1 + 56) structuredLocation];
    if (v2)
    {
      id v24 = v2;
      id v3 = [v2 geoLocation];
      if (v3)
      {
        v4 = v3;
        uint64_t v5 = self;
        id v6 = [(id)v5 mapItemForCurrentLocation];
        [v4 coordinate];
        id v9 = [objc_allocWithZone((Class)MKPlacemark) initWithCoordinate:v7, v8];
        id v10 = [objc_allocWithZone((Class)MKMapItem) initWithPlacemark:v9];
        uint64_t v11 = sub_1000BBAC8();
        uint64_t v13 = v12;
        uint64_t v14 = sub_1000BBAC8();
        uint64_t v16 = v15;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_10003E8D4(v14, v16, v11, v13, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v18 = [v24 title];
        [v10 setName:v18];

        sub_100005D74((uint64_t *)&unk_1000FD490);
        uint64_t v19 = swift_allocObject();
        *(_OWORD *)(v19 + 16) = xmmword_1000C1CF0;
        *(void *)(v19 + 32) = v6;
        *(void *)(v19 + 40) = v10;
        sub_1000BBC08();
        sub_1000074F8(0, &qword_1001007C8);
        id v20 = v6;
        id v21 = v10;
        Class isa = sub_1000BBBD8().super.isa;
        swift_bridgeObjectRelease();
        sub_1000534CC((uint64_t)_swiftEmptyDictionarySingleton);
        swift_bridgeObjectRelease();
        Class v23 = sub_1000BBA18().super.isa;
        swift_bridgeObjectRelease();
        LOBYTE(v5) = [(id)v5 openMapsWithItems:isa launchOptions:v23];

        if ((v5 & 1) == 0)
        {
          if (qword_1000FBCB8 != -1) {
            swift_once();
          }
          sub_1000BBD08();
          sub_1000BB4A8();
        }
      }
    }
  }
}

void sub_1000A390C(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = sub_1000BB3A8();
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if ((*v5 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v7 = *(void *)(v6 + 8 * v4 + 32);
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_33;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1000BC018();
  swift_bridgeObjectRelease();
LABEL_5:
  uint64_t v9 = *(void *)(v7 + 48);
  uint64_t v8 = *(void *)(v7 + 56);
  BOOL v10 = v9 == 0x6C65436C6562614CLL && v8 == 0xE90000000000006CLL;
  if (!v10 && (sub_1000BC238() & 1) == 0)
  {
    BOOL v18 = v9 == 0x6C65436567616D49 && v8 == 0xE90000000000006CLL;
    if (!v18 && (sub_1000BC238() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      NSString v26 = sub_1000BBA88();
      swift_bridgeObjectRelease();
      id v27 = [a1 dequeueReusableCellWithIdentifier:v26];

      if (v27)
      {
        type metadata accessor for IMBActionTableViewCell();
        uint64_t v13 = (unsigned char *)swift_dynamicCastClassUnconditional();
        v28 = *(void **)&v13[OBJC_IVAR____TtC8Business22IMBActionTableViewCell_iconView];
        [v28 setImage:*(void *)(v7 + 64)];
        [v28 setHidden:*(void *)(v7 + 64) == 0];
        id v29 = *(id *)&v13[OBJC_IVAR____TtC8Business22IMBActionTableViewCell_titleLabel];
        swift_bridgeObjectRetain();
        NSString v30 = sub_1000BBA88();
        swift_bridgeObjectRelease();
        [v29 setText:v30];

        uint64_t v31 = OBJC_IVAR____TtC8Business22IMBActionTableViewCell_actionEnabled;
        v13[OBJC_IVAR____TtC8Business22IMBActionTableViewCell_actionEnabled] = *(unsigned char *)(v7 + 88);
        sub_10005B684();
        UIAccessibilityTraits v32 = UIAccessibilityTraitButton;
        if ((v13[v31] & 1) == 0)
        {
          UIAccessibilityTraits v33 = UIAccessibilityTraitNotEnabled;
          if ((UIAccessibilityTraitNotEnabled & ~UIAccessibilityTraitButton) == 0) {
            UIAccessibilityTraits v33 = 0;
          }
          UIAccessibilityTraits v32 = v33 | UIAccessibilityTraitButton;
        }
        [v13 setAccessibilityTraits:v32];
        goto LABEL_25;
      }
LABEL_35:
      __break(1u);
      return;
    }
    swift_bridgeObjectRetain();
    NSString v19 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    id v20 = [a1 dequeueReusableCellWithIdentifier:v19];

    if (v20)
    {
      type metadata accessor for IMBImageTableViewCell();
      uint64_t v13 = (unsigned char *)swift_dynamicCastClassUnconditional();
      id v21 = *(void **)&v13[OBJC_IVAR____TtC8Business21IMBImageTableViewCell_largeImageView];
      [v21 setImage:*(void *)(v7 + 64)];
      sub_100005D74(&qword_1000FD4B0);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1000BF150;
      *(void *)(v22 + 56) = sub_1000074F8(0, &qword_1000FC778);
      *(void *)(v22 + 32) = v21;
      id v23 = v20;
      id v24 = v21;
      Class isa = sub_1000BBBD8().super.isa;
      swift_bridgeObjectRelease();
      [v13 setAccessibilityElements:isa];

      goto LABEL_25;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  NSString v11 = sub_1000BBA88();
  swift_bridgeObjectRelease();
  id v12 = [a1 dequeueReusableCellWithIdentifier:v11];

  if (!v12)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  type metadata accessor for IMBInfoTableViewCell();
  uint64_t v13 = (unsigned char *)swift_dynamicCastClassUnconditional();
  id v14 = *(id *)&v13[OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_leftLabel];
  swift_bridgeObjectRetain();
  NSString v15 = sub_1000BBA88();
  swift_bridgeObjectRelease();
  [v14 setText:v15];

  id v16 = *(id *)&v13[OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_rightLabel];
  swift_bridgeObjectRetain();
  NSString v17 = sub_1000BBA88();
  swift_bridgeObjectRelease();
  [v16 setText:v17];

LABEL_25:
  if (*(unsigned char *)(v7 + 89) == 1)
  {
    if (sub_1000304C4() != 2)
    {
      [a1 layoutMargins];
      [v13 setSeparatorInset:v34, v35, v36, v37];
    }
  }
  else
  {
    [a1 bounds];
    [v13 setSeparatorInset:0.0 v38:0.0:0.0];
  }
  swift_release();
}

uint64_t sub_1000A40A8(void *a1)
{
  unint64_t v3 = sub_1000BB3A8();
  unint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *v4;
  if ((v6 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000BC018();
    swift_bridgeObjectRelease();
LABEL_5:
    Class isa = sub_1000BB378().super.isa;
    [a1 deselectRowAtIndexPath:isa animated:1];

    BOOL v9 = *(void *)(v7 + 48) == 0x65436E6F69746341 && *(void *)(v7 + 56) == 0xEA00000000006C6CLL;
    if (!v9 && (sub_1000BC238() & 1) == 0 || *(unsigned char *)(v7 + 88) != 1) {
      return swift_release();
    }
    uint64_t v11 = *(void *)(v7 + 16);
    uint64_t v10 = *(void *)(v7 + 24);
    id v12 = self;
    swift_bridgeObjectRetain();
    uint64_t v13 = (objc_class *)[v12 mainBundle];
    v28._countAndFlagsBits = 0xE000000000000000;
    v30._countAndFlagsBits = 0x435F4F545F444441;
    v30._object = (void *)0xEF5241444E454C41;
    v32.value._countAndFlagsBits = 0;
    v32.value._object = 0;
    v14.super.Class isa = v13;
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    uint64_t v15 = sub_1000BB068(v30, v32, v14, v34, v28);
    uint64_t v17 = v16;

    if (v11 == v15 && v10 == v17)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v19 = sub_1000BC238();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {
        uint64_t v21 = *(void *)(v7 + 16);
        uint64_t v20 = *(void *)(v7 + 24);
        swift_bridgeObjectRetain();
        uint64_t v22 = (objc_class *)[v12 mainBundle];
        v29._countAndFlagsBits = 0xE000000000000000;
        v31._countAndFlagsBits = 0x455249445F544547;
        v31._object = (void *)0xEE00534E4F495443;
        v33.value._countAndFlagsBits = 0;
        v33.value._object = 0;
        v23.super.Class isa = v22;
        v35._countAndFlagsBits = 0;
        v35._object = (void *)0xE000000000000000;
        uint64_t v24 = sub_1000BB068(v31, v33, v23, v35, v29);
        uint64_t v26 = v25;

        if (v21 == v24 && v20 == v26)
        {
          swift_bridgeObjectRelease_n();
LABEL_23:
          sub_1000A34EC();
          return swift_release();
        }
        char v27 = sub_1000BC238();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v27) {
          goto LABEL_23;
        }
        return swift_release();
      }
    }
    sub_1000A2B94();
    return swift_release();
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v7 = *(void *)(v6 + 8 * v3 + 32);
    swift_retain();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_1000A44A4(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dayLabel;
  id v4 = objc_allocWithZone((Class)UILabel);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dateLabel;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v7 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_timeLabel;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v8 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_warningLabel;
  *(void *)&v5[v8] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v9 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_containerView;
  *(void *)&v5[v9] = [objc_allocWithZone((Class)UIView) init];
  *(void *)&v5[OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData] = _swiftEmptyArrayStorage;
  *(void *)&v5[OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent] = 0;

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for IMBTimeSelectedViewController();
  [super initWithCoder:a1];

  return v10;
}

uint64_t sub_1000A4600()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

id sub_1000A4690()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBTimeSelectedViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for IMBTimeSelectedViewController()
{
  return self;
}

unint64_t sub_1000A47D4()
{
  unint64_t result = qword_1001007D8;
  if (!qword_1001007D8)
  {
    sub_1000074F8(255, &qword_100100900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001007D8);
  }
  return result;
}

uint64_t sub_1000A483C()
{
  uint64_t v1 = v0;
  unint64_t v2 = sub_1000BB3A8();
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *v3;
  if ((v5 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1000BC018();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v2 >= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v6 = *(void *)(v5 + 8 * v2 + 32);
  swift_retain();
LABEL_5:
  BOOL v7 = *(void *)(v6 + 48) == 0x6C65436567616D49 && *(void *)(v6 + 56) == 0xE90000000000006CLL;
  if (!v7 && (sub_1000BC238() & 1) == 0) {
    return swift_release();
  }
  [*(id *)(v1 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView) bounds];
  CGRectGetWidth(v8);
  return swift_release();
}

uint64_t initializeBufferWithCopyOfBuffer for QuickReplyModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for QuickReplyModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for QuickReplyModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  return a1;
}

__n128 initializeWithTake for QuickReplyModel(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for QuickReplyModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for QuickReplyModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QuickReplyModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuickReplyModel()
{
  return &type metadata for QuickReplyModel;
}

void *sub_1000A4B34(char a1, uint64_t a2)
{
  if (!a2)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    goto LABEL_15;
  }
  uint64_t v4 = sub_1000BBAC8();
  if (!*(void *)(a2 + 16) || (unint64_t v6 = sub_100055698(v4, v5), (v7 & 1) == 0))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  sub_100008390(*(void *)(a2 + 56) + 32 * v6, (uint64_t)&v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v28 + 1))
  {
LABEL_15:
    sub_1000083EC((uint64_t)&v27);
LABEL_16:
    if (qword_1000FBCB8 == -1) {
      goto LABEL_17;
    }
    goto LABEL_65;
  }
  sub_100005D74(&qword_1000FC470);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  if (!*(void *)(v25 + 16)
    || (unint64_t v8 = sub_100055698(0x736D657469, 0xE500000000000000), (v9 & 1) == 0)
    || (sub_100008390(*(void *)(v25 + 56) + 32 * v8, (uint64_t)&v27),
        sub_100005D74(&qword_1000FD040),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    if (qword_1000FBCB8 == -1) {
      goto LABEL_17;
    }
LABEL_65:
    swift_once();
    goto LABEL_17;
  }
  uint64_t v24 = *(void *)(v25 + 16);
  if ((unint64_t)(v24 - 6) < 0xFFFFFFFFFFFFFFFCLL)
  {
    swift_bridgeObjectRelease();
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBD08();
    sub_100005D74((uint64_t *)&unk_1000FCE50);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1000BF150;
    swift_bridgeObjectRelease();
    *(void *)(v10 + 56) = &type metadata for Int;
    *(void *)(v10 + 64) = &protocol witness table for Int;
    *(void *)(v10 + 32) = v24;
    sub_1000BB4A8();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v13 = 0;
  uint64_t v11 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v14 = *(void *)(v25 + 8 * v13 + 32);
    if (!*(void *)(v14 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_40:
      swift_bridgeObjectRelease();
      goto LABEL_42;
    }
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_100055698(0x696669746E656469, 0xEA00000000007265);
    if ((v16 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_40;
    }
    sub_100008390(*(void *)(v14 + 56) + 32 * v15, (uint64_t)&v27);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_42:
      swift_bridgeObjectRelease();
      if (qword_1000FBCB8 != -1) {
        goto LABEL_65;
      }
      goto LABEL_17;
    }
    if (*(void *)(v14 + 16) && (unint64_t v17 = sub_100055698(0x656C746974, 0xE500000000000000), (v18 & 1) != 0))
    {
      sub_100008390(*(void *)(v14 + 56) + 32 * v17, (uint64_t)&v27);
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((void *)&v28 + 1))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000083EC((uint64_t)&v27);
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_46:
      swift_bridgeObjectRelease();
      if (qword_1000FBCB8 != -1) {
        goto LABEL_65;
      }
      goto LABEL_17;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_10003C6F4(0, v11[2] + 1, 1, v11);
    }
    unint64_t v20 = v11[2];
    unint64_t v19 = v11[3];
    if (v20 >= v19 >> 1) {
      uint64_t v11 = sub_10003C6F4((void *)(v19 > 1), v20 + 1, 1, v11);
    }
    ++v13;
    v11[2] = v20 + 1;
    uint64_t v21 = &v11[4 * v20];
    v21[4] = v25;
    v21[5] = v26;
    v21[6] = v25;
    v21[7] = v26;
  }
  while (v24 != v13);
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return v11;
  }
  if (*(void *)(v25 + 16) && (unint64_t v22 = sub_100055698(0x64657463656C6573, 0xED00007865646E49), (v23 & 1) != 0))
  {
    sub_100008390(*(void *)(v25 + 56) + 32 * v22, (uint64_t)&v27);
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v28 + 1))
  {
    sub_1000083EC((uint64_t)&v27);
LABEL_63:
    swift_bridgeObjectRelease();
    if (qword_1000FBCB8 != -1) {
      goto LABEL_65;
    }
    goto LABEL_17;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_63;
  }
  if ((v25 & 0x8000000000000000) == 0 && v25 < v11[2]) {
    return v11;
  }
  swift_bridgeObjectRelease();
  if (qword_1000FBCB8 != -1) {
    goto LABEL_65;
  }
LABEL_17:
  sub_1000BBD08();
  sub_1000BB4A8();
  return 0;
}

uint64_t destroy for QuickReplyModel.Item()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for QuickReplyModel.Item(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for QuickReplyModel.Item(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for QuickReplyModel.Item(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for QuickReplyModel.Item(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for QuickReplyModel.Item(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QuickReplyModel.Item(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuickReplyModel.Item()
{
  return &type metadata for QuickReplyModel.Item;
}

unint64_t IMBJITAppBundleState.init(rawValue:)(unint64_t a1)
{
  return sub_1000A8740(a1);
}

Swift::Int sub_1000A5490()
{
  Swift::UInt v1 = *v0;
  sub_1000BC308();
  sub_1000BC318(v1);
  return sub_1000BC358();
}

void sub_1000A54D8()
{
  sub_1000BC318(*v0);
}

Swift::Int sub_1000A5504()
{
  Swift::UInt v1 = *v0;
  sub_1000BC308();
  sub_1000BC318(v1);
  return sub_1000BC358();
}

unint64_t sub_1000A5548@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000A8740(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id IMBJITAppBundleManager.containerID.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID);
  }
  else
  {
    if (_BSIsInternalInstall()) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    id v5 = objc_allocWithZone((Class)CKContainerID);
    NSString v6 = sub_1000BBA88();
    id v7 = [v5 initWithContainerIdentifier:v6 environment:v4];

    unint64_t v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v7;
    id v3 = v7;

    unint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id IMBJITAppBundleManager.container.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container);
  }
  else
  {
    id v4 = IMBJITAppBundleManager.containerID.getter();
    id v5 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v4];

    NSString v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    unint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id IMBJITAppBundleManager.database.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database);
  }
  else
  {
    id v4 = IMBJITAppBundleManager.container.getter();
    id v5 = [v4 publicCloudDatabase];

    NSString v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    unint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

uint64_t IMBJITAppBundleManager.currentLoadedBundleVersion.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t IMBJITAppBundleManager.currentLoadedBundleVersion.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*IMBJITAppBundleManager.currentLoadedBundleVersion.modify())()
{
  return j__swift_endAccess;
}

id sub_1000A5870()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for IMBJITAppBundleManager()) init];
  qword_100100850 = (uint64_t)result;
  return result;
}

uint64_t IMBJITAppBundleManager.bundleState.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t IMBJITAppBundleManager.bundleState.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState);
  swift_beginAccess();
  *id v3 = a1;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_1000757B0();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t IMBJITAppBundleManager.savedBundleVersion.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults);
  NSString v2 = sub_1000BBA88();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    sub_1000BBEF8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10002D7E8((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    sub_10000FBD8((uint64_t)v10, (uint64_t *)&unk_1000FEB60);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v4 = 3157552;
    NSString v5 = sub_1000BBA88();
    NSString v6 = sub_1000BBA88();
    [v1 setObject:v5 forKey:v6];

    return v4;
  }
  return v8;
}

uint64_t IMBJITAppBundleManager.recordChangeTag.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults);
  NSString v2 = sub_1000BBA88();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    sub_1000BBEF8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10002D7E8((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_10000FBD8((uint64_t)v7, (uint64_t *)&unk_1000FEB60);
  }
  return 0;
}

uint64_t IMBJITAppBundleManager.bundleBasePath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005D74((uint64_t *)&unk_1000FD480);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000BB138();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [self defaultManager];
  id v12 = [v11 URLsForDirectory:13 inDomains:1];
  uint64_t v13 = sub_1000BBBE8();

  if (*(void *)(v13 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v5, v13 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v14(v5, 0, 1, v6);
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v14(v5, 1, 1, v6);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {

    sub_10000FBD8((uint64_t)v5, (uint64_t *)&unk_1000FD480);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
    sub_1000BB0D8();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    uint64_t v15 = 0;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v14)(a1, v15, 1, v6);
}

uint64_t IMBJITAppBundleManager.savedBundlePath.getter@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_100005D74((uint64_t *)&unk_1000FD480);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000BB138();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  id v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v13);
  uint64_t v15 = (char *)&v26 - v14;
  char v16 = *(void **)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults);
  NSString v17 = sub_1000BBA88();
  id v18 = [v16 URLForKey:v17];

  if (!v18)
  {
    unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v20(v6, 1, 1, v7);
    goto LABEL_5;
  }
  long long v27 = a1;
  sub_1000BB0F8();

  unint64_t v19 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v19(v6, v12, v7);
  unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v20(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    a1 = v27;
LABEL_5:
    sub_10000FBD8((uint64_t)v6, (uint64_t *)&unk_1000FD480);
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v20)(a1, 1, 1, v7);
  }
  v19(v15, v6, v7);
  id v22 = [self defaultManager];
  sub_1000BB108();
  NSString v23 = sub_1000BBA88();
  swift_bridgeObjectRelease();
  unsigned int v24 = [v22 fileExistsAtPath:v23];

  if (v24)
  {
    uint64_t v25 = v27;
    v19(v27, v15, v7);
    return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v20)(v25, 0, 1, v7);
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  a1 = v27;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v20)(a1, 1, 1, v7);
}

Swift::Void __swiftcall IMBJITAppBundleManager.load(_:)(Swift::String a1)
{
  uint64_t v2 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v5 = sub_100005D74((uint64_t *)&unk_100100880);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005D74((uint64_t *)&unk_1000FD480);
  __chkstk_darwin(v9 - 8, v10);
  id v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000BB138();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  NSString v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  IMBJITAppBundleManager.savedBundlePath.getter(v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_10000FBD8((uint64_t)v12, (uint64_t *)&unk_1000FD480);
LABEL_5:
    [v2 setBundleState:4];
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
  v21[2] = IMBJITAppBundleManager.savedBundleVersion.getter();
  v21[3] = v18;
  v21[0] = countAndFlagsBits;
  v21[1] = object;
  uint64_t v19 = sub_1000BB288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 1, 1, v19);
  sub_10002F708();
  uint64_t v20 = sub_1000BBED8();
  sub_10000FBD8((uint64_t)v8, (uint64_t *)&unk_100100880);
  swift_bridgeObjectRelease();
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    goto LABEL_5;
  }
  if ([v2 bundleState] == (id)3)
  {
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBCE8();
    sub_1000BB4A8();
  }
  else
  {
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBCE8();
    sub_1000BB4A8();
    IMBJITAppBundleManager.loadBundle(_:version:)((uint64_t)v17, countAndFlagsBits, (uint64_t)object);
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
LABEL_6:
  IMBJITAppBundleManager.updateBundle(_:)(countAndFlagsBits, (uint64_t)object);
}

void IMBJITAppBundleManager.updateBundle(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005D74((uint64_t *)&unk_100100880);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate;
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate) != 1)
  {
LABEL_6:
    uint64_t v19 = (void *)(v3 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion);
    *uint64_t v19 = a1;
    v19[1] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(v3 + v10) = 1;
    sub_1000074F8(0, &qword_100100910);
    sub_100005D74((uint64_t *)&unk_1000FCE50);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_1000BF150;
    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = sub_1000074A4();
    *(void *)(v20 + 32) = a1;
    *(void *)(v20 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v21 = (void *)sub_1000BBCD8();
    sub_1000074F8(0, &qword_100100918);
    id v22 = v21;
    v34._uint64_t countAndFlagsBits = 0x6F43656C646E7542;
    v34._object = (void *)0xEC0000006769666ELL;
    Class isa = sub_1000BBDF8(v34, v22).super.isa;
    id v24 = [objc_allocWithZone((Class)CKQueryOperation) initWithQuery:isa];
    id v25 = [self defaultRecordZone];
    id v26 = [v25 zoneID];

    [v24 setZoneID:v26];
    [v24 setQualityOfService:25];
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = _swiftEmptyArrayStorage;
    swift_retain();
    sub_1000BBD58();
    uint64_t v28 = swift_allocObject();
    swift_unknownObjectWeakInit();
    Swift::String v29 = (void *)swift_allocObject();
    v29[2] = v27;
    v29[3] = v28;
    v29[4] = a1;
    v29[5] = a2;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_1000BBD48();
    swift_release();
    Swift::String v30 = *(void **)(v3 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation);
    *(void *)(v3 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation) = v24;
    id v31 = v24;

    id v32 = IMBJITAppBundleManager.database.getter();
    [v32 addOperation:v31];

    swift_release();
    return;
  }
  uint64_t v11 = (void *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion);
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion + 8);
  v33[2] = *v11;
  v33[3] = v12;
  v33[0] = a1;
  v33[1] = a2;
  uint64_t v13 = sub_1000BB288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  sub_10002F708();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1000BBED8();
  sub_10000FBD8((uint64_t)v9, (uint64_t *)&unk_100100880);
  swift_bridgeObjectRelease();
  if (v14)
  {
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBCE8();
    sub_100005D74((uint64_t *)&unk_1000FCE50);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_1000BE090;
    uint64_t v17 = *v11;
    uint64_t v16 = v11[1];
    *(void *)(v15 + 56) = &type metadata for String;
    unint64_t v18 = sub_1000074A4();
    *(void *)(v15 + 32) = v17;
    *(void *)(v15 + 40) = v16;
    *(void *)(v15 + 96) = &type metadata for String;
    *(void *)(v15 + 104) = v18;
    *(void *)(v15 + 64) = v18;
    *(void *)(v15 + 72) = a1;
    *(void *)(v15 + 80) = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000BB4A8();
    swift_bridgeObjectRelease();
    IMBJITAppBundleManager.clearUpdateFlags()();
    goto LABEL_6;
  }
  if (qword_1000FBCB8 != -1) {
    swift_once();
  }
  sub_1000BBCE8();
  sub_1000BB4A8();
}

void sub_1000A6C08(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  if (a3)
  {
    swift_errorRetain();
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBD08();
    sub_100005D74((uint64_t *)&unk_1000FCE50);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1000BF150;
    swift_getErrorValue();
    uint64_t v8 = sub_1000BC288();
    uint64_t v10 = v9;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_1000074A4();
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v10;
    sub_1000BB4A8();
    swift_bridgeObjectRelease();
    sub_1000A8914(a2, 1);
  }
  else
  {
    uint64_t v5 = (void *)(a4 + 16);
    swift_beginAccess();
    id v6 = a2;
    sub_1000BBBC8();
    if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1000BBC18();
    }
    sub_1000BBC38();
    sub_1000BBC08();
    swift_endAccess();
  }
}

void sub_1000A6D98(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBD08();
    sub_100005D74((uint64_t *)&unk_1000FCE50);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1000BF150;
    swift_getErrorValue();
    uint64_t v17 = sub_1000BC288();
    uint64_t v19 = v18;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = sub_1000074A4();
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v19;
    sub_1000BB4A8();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
      sub_1000A8914(a1, 1);
      return;
    }
    uint64_t v21 = Strong;
    if ([Strong bundleState] != (id)2 || objc_msgSend(v21, "bundleState") != (id)3) {
      [v21 setBundleState:5];
    }
    IMBJITAppBundleManager.clearUpdateFlags()();
    sub_1000A8914(a1, 1);
LABEL_25:

    return;
  }
  swift_beginAccess();
  unint64_t v9 = *(void *)(a3 + 16);
  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_4;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    if (qword_1000FBCB8 == -1)
    {
LABEL_20:
      sub_1000BBD08();
      sub_1000BB4A8();
      swift_beginAccess();
      id v22 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v22) {
        return;
      }
      uint64_t v21 = v22;
      if ([v22 bundleState] != (id)2 || objc_msgSend(v21, "bundleState") != (id)3) {
        [v21 setBundleState:5];
      }
      IMBJITAppBundleManager.clearUpdateFlags()();
      goto LABEL_25;
    }
LABEL_29:
    swift_once();
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  if (!sub_1000BC0D8()) {
    goto LABEL_19;
  }
LABEL_4:
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v11 = (id)sub_1000BC018();
    goto LABEL_7;
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_29;
  }
  id v11 = *(id *)(v9 + 32);
LABEL_7:
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v13 = swift_unknownObjectWeakLoadStrong();
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    IMBJITAppBundleManager.processFetchedRecord(_:version:)(v12, a5, a6);
  }
}

void IMBJITAppBundleManager.processFetchedRecord(_:version:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v73 = a2;
  uint64_t v74 = a3;
  uint64_t v4 = sub_1000BB138();
  uint64_t v75 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  v72 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  id v11 = (char *)&v67 - v10;
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v67 - v13;
  uint64_t v15 = sub_100005D74((uint64_t *)&unk_100100880);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100005D74((uint64_t *)&unk_1000FD480);
  uint64_t v21 = __chkstk_darwin(v19 - 8, v20);
  NSString v23 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v21, v24);
  uint64_t v27 = (char *)&v67 - v26;
  __chkstk_darwin(v25, v28);
  Swift::String v30 = (char *)&v67 - v29;
  uint64_t v31 = sub_1000BBE28();
  if (!v31) {
    return;
  }
  uint64_t v77 = v31;
  sub_100005D74(&qword_100100908);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  if (v79 == *(void *)&v76[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion]
    && v80 == *(void *)&v76[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion + 8])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v32 = sub_1000BC238();
    swift_bridgeObjectRelease();
    if ((v32 & 1) == 0) {
      return;
    }
  }
  id v33 = [a1 recordChangeTag];
  if (!v33) {
    return;
  }
  id v70 = v33;
  uint64_t v69 = sub_1000BBAC8();
  uint64_t v71 = v34;
  IMBJITAppBundleManager.savedBundlePath.getter(v30);
  v68 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48);
  unsigned int v35 = v68(v30, 1, v4);
  sub_10000FBD8((uint64_t)v30, (uint64_t *)&unk_1000FD480);
  if (v35 != 1)
  {
    if (IMBJITAppBundleManager.recordChangeTag.getter() == v69 && v36 == v71)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v37 = sub_1000BC238();
      swift_bridgeObjectRelease();
      if ((v37 & 1) == 0) {
        goto LABEL_14;
      }
    }
    uint64_t v79 = IMBJITAppBundleManager.savedBundleVersion.getter();
    uint64_t v80 = v38;
    uint64_t v77 = v73;
    uint64_t v78 = v74;
    uint64_t v39 = sub_1000BB288();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v18, 1, 1, v39);
    sub_10002F708();
    uint64_t v40 = sub_1000BBED8();
    sub_10000FBD8((uint64_t)v18, (uint64_t *)&unk_100100880);
    swift_bridgeObjectRelease();
    if (!v40)
    {

      if (qword_1000FBCB8 != -1) {
        swift_once();
      }
      sub_1000BBCE8();
      sub_100005D74((uint64_t *)&unk_1000FCE50);
      uint64_t v48 = swift_allocObject();
      *(_OWORD *)(v48 + 16) = xmmword_1000BF150;
      *(void *)(v48 + 56) = &type metadata for String;
      *(void *)(v48 + 64) = sub_1000074A4();
      uint64_t v49 = v71;
      *(void *)(v48 + 32) = v69;
      *(void *)(v48 + 40) = v49;
      sub_1000BB4A8();
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
  }
LABEL_14:
  if (!sub_1000BBE28())
  {
LABEL_21:

    swift_bridgeObjectRelease();
LABEL_28:
    v50 = v76;
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBD08();
    sub_1000BB4A8();
    if ([v50 bundleState] == (id)4) {
      [v50 setBundleState:5];
    }
LABEL_32:
    IMBJITAppBundleManager.clearUpdateFlags()();
    return;
  }
  self;
  v41 = (void *)swift_dynamicCastObjCClass();
  if (!v41)
  {
    swift_unknownObjectRelease();
    goto LABEL_21;
  }
  id v42 = [v41 fileURL];
  if (!v42)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v75 + 56))(v27, 1, 1, v4);
    goto LABEL_26;
  }
  v43 = v42;
  sub_1000BB0F8();

  uint64_t v44 = v75;
  v45 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  v45(v27, v11, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v27, 0, 1, v4);
  v46 = v68;
  if (v68(v27, 1, v4) == 1)
  {
LABEL_26:

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v47 = (uint64_t)v27;
    goto LABEL_27;
  }
  v45(v14, v27, v4);
  IMBJITAppBundleManager.copyBundle(_:)(v23);
  if (v46(v23, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v75 + 8))(v14, v4);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    uint64_t v47 = (uint64_t)v23;
LABEL_27:
    sub_10000FBD8(v47, (uint64_t *)&unk_1000FD480);
    goto LABEL_28;
  }
  v45(v72, v23, v4);
  v51 = v76;
  if (qword_1000FBCB8 != -1) {
    swift_once();
  }
  sub_1000BBCE8();
  sub_100005D74((uint64_t *)&unk_1000FCE50);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_1000BF150;
  *(void *)(v52 + 56) = &type metadata for String;
  *(void *)(v52 + 64) = sub_1000074A4();
  uint64_t v53 = v71;
  *(void *)(v52 + 32) = v69;
  *(void *)(v52 + 40) = v53;
  sub_1000BB4A8();
  swift_bridgeObjectRelease();
  v54 = *(void **)&v51[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults];
  uint64_t v55 = v73;
  uint64_t v56 = v74;
  NSString v57 = sub_1000BBA88();
  NSString v58 = sub_1000BBA88();
  [v54 setObject:v57 forKey:v58];

  NSString v59 = sub_1000BBA88();
  id v60 = v70;
  [v54 setObject:v70 forKey:v59];

  uint64_t v61 = (uint64_t)v72;
  sub_1000BB0C8(v62);
  v64 = v63;
  NSString v65 = sub_1000BBA88();
  [v54 setURL:v64 forKey:v65];

  IMBJITAppBundleManager.loadBundle(_:version:)(v61, v55, v56);
  IMBJITAppBundleManager.clearUpdateFlags()();
  swift_unknownObjectRelease();
  v66 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
  v66(v61, v4);
  v66((uint64_t)v14, v4);
}

void IMBJITAppBundleManager.clearUpdateFlags()()
{
  if (qword_1000FBCB8 != -1) {
    swift_once();
  }
  sub_1000BBCE8();
  sub_1000BB4A8();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate) = 0;
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion);
  *uint64_t v1 = 3157552;
  v1[1] = 0xE300000000000000;
  swift_bridgeObjectRelease();
  uint64_t v2 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation);
  if (v3)
  {
    [v3 cancel];
    uint64_t v3 = *(void **)(v0 + v2);
  }
  *(void *)(v0 + v2) = 0;
}

uint64_t IMBJITAppBundleManager.copyBundle(_:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_100005D74((uint64_t *)&unk_1000FD480);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000BB138();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  id v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v9, v12);
  uint64_t v15 = (char *)&v43 - v14;
  __chkstk_darwin(v13, v16);
  uint64_t v18 = (char *)&v43 - v17;
  id v19 = [self defaultManager];
  IMBJITAppBundleManager.bundleBasePath.getter((uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {

    sub_10000FBD8((uint64_t)v5, (uint64_t *)&unk_1000FD480);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
  }
  v46 = a1;
  v45 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v45(v18, v5, v6);
  sub_1000BB0C8(v20);
  uint64_t v22 = v21;
  id v48 = 0;
  unsigned int v23 = [v19 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:&v48];

  if (v23)
  {
    id v24 = v48;
    sub_1000BB0B8();
    sub_1000BB0D8();
    swift_bridgeObjectRelease();
    sub_1000BB108();
    NSString v25 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    unsigned int v26 = [v19 fileExistsAtPath:v25];

    if (!v26)
    {
      if (qword_1000FBCB8 != -1) {
        swift_once();
      }
      sub_1000BBD08();
      sub_1000BB4A8();

      uint64_t v39 = *(void (**)(char *, uint64_t))(v7 + 8);
      v39(v15, v6);
      v39(v18, v6);
      a1 = v46;
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    }
    sub_1000BB0C8(v27);
    uint64_t v29 = v28;
    sub_1000BB108();
    sub_1000BB0A8();
    swift_bridgeObjectRelease();
    sub_1000BB0C8(v30);
    char v32 = v31;
    uint64_t v44 = *(void (**)(char *, uint64_t))(v7 + 8);
    v44(v11, v6);
    id v48 = 0;
    unsigned int v33 = [v19 copyItemAtURL:v29 toURL:v32 error:&v48];

    id v34 = v48;
    if (v33)
    {
      v44(v18, v6);

      unsigned int v35 = v46;
      v45(v46, v15, v6);
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v35, 0, 1, v6);
    }
    uint64_t v40 = v34;
    v45 = (void (*)(char *, char *, uint64_t))(v7 + 8);
    v41 = v44;
    id v42 = (void *)sub_1000BB088();

    swift_willThrow();
    id v48 = v42;
    sub_100005D74(&qword_1001007D0);
    sub_1000074F8(0, &qword_100100900);
    swift_dynamicCast();

    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBD08();
    sub_1000BB4A8();

    v41(v15, v6);
    v41(v18, v6);
  }
  else
  {
    id v37 = v48;
    uint64_t v38 = (void *)sub_1000BB088();

    swift_willThrow();
    id v48 = v38;
    sub_100005D74(&qword_1001007D0);
    sub_1000074F8(0, &qword_100100900);
    swift_dynamicCast();

    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBD08();
    sub_1000BB4A8();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v46, 1, 1, v6);
  return swift_errorRelease();
}

void IMBJITAppBundleManager.loadBundle(_:version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  [v3 setBundleState:2];
  if (qword_1000FBCB8 != -1) {
    swift_once();
  }
  sub_1000BBCE8();
  sub_1000BB4A8();
  id v7 = [self shared];
  sub_1000BB0C8(v8);
  uint64_t v10 = v9;
  id v11 = (void *)swift_allocObject();
  v11[2] = v4;
  v11[3] = a2;
  v11[4] = a3;
  v14[4] = sub_1000A881C;
  v14[5] = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10003C100;
  v14[3] = &unk_1000EA0C8;
  uint64_t v12 = _Block_copy(v14);
  id v13 = v4;
  swift_bridgeObjectRetain();
  swift_release();
  [v7 loadBundle:v10 completion:v12];
  _Block_release(v12);
}

uint64_t sub_1000A8328(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBD08();
    sub_100005D74((uint64_t *)&unk_1000FCE50);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1000BF150;
    swift_getErrorValue();
    uint64_t v6 = sub_1000BC288();
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 64) = sub_1000074A4();
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    sub_1000BB4A8();
    swift_bridgeObjectRelease();
    [a2 setBundleState:5];
    return swift_errorRelease();
  }
  else
  {
    if (qword_1000FBCB8 != -1) {
      swift_once();
    }
    sub_1000BBCE8();
    sub_1000BB4A8();
    [a2 setBundleState:3];
    uint64_t v12 = &a2[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion];
    swift_beginAccess();
    *(void *)uint64_t v12 = a3;
    *((void *)v12 + 1) = a4;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRelease();
  }
}

id IMBJITAppBundleManager.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database] = 0;
  uint64_t v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults;
  uint64_t v2 = self;
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 standardUserDefaults];
  v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate] = 0;
  uint64_t v4 = &v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion];
  *(void *)uint64_t v4 = 3157552;
  *((void *)v4 + 1) = 0xE300000000000000;
  *(void *)&v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation] = 0;
  uint64_t v5 = &v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion];
  *(void *)uint64_t v5 = 3157552;
  *((void *)v5 + 1) = 0xE300000000000000;
  *(void *)&v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState] = 0;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for IMBJITAppBundleManager();
  return [super init];
}

id IMBJITAppBundleManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBJITAppBundleManager();
  return [super dealloc];
}

unint64_t sub_1000A8740(unint64_t result)
{
  if (result > 8) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for IMBJITAppBundleManager()
{
  return self;
}

unint64_t sub_1000A8778()
{
  unint64_t result = qword_1001008C8;
  if (!qword_1001008C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001008C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for IMBJITAppBundleState()
{
  return &type metadata for IMBJITAppBundleState;
}

uint64_t sub_1000A87DC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000A881C(uint64_t a1)
{
  return sub_1000A8328(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000A8828(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000A8838()
{
  return swift_release();
}

uint64_t sub_1000A8840()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000A8878(uint64_t a1, void *a2, char a3)
{
  sub_1000A6C08(a1, a2, a3 & 1, v3);
}

uint64_t sub_1000A8884()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000A88BC()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000A8904(void *a1, char a2)
{
  sub_1000A6D98(a1, a2 & 1, v2[2], v2[3], v2[4], v2[5]);
}

void sub_1000A8914(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

uint64_t sub_1000A8920(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_1000A8974(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000BC0D8();
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
  uint64_t v15 = sub_1000BC0D8();
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
    uint64_t v9 = sub_1000BC028();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000AAE38(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1000BC0D8();
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

  return sub_1000BBC08();
}

uint64_t sub_1000A8B40(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *v2;
  int64_t v5 = (*v2)[2];
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = a1;
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v2 = v4;
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    uint64_t v4 = sub_10003C5CC(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    *uint64_t v2 = v4;
    int64_t v9 = v4[3] >> 1;
  }
  uint64_t v11 = v4[2];
  uint64_t v12 = v9 - v11;
  BOOL v13 = sub_1000B49AC(v55, &v4[6 * v11 + 4], v9 - v11, v7);
  if ((uint64_t)v13 < v3) {
    goto LABEL_17;
  }
  if (v13)
  {
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = (char *)v13 + v14;
    if (v15)
    {
      __break(1u);
      goto LABEL_22;
    }
    v4[2] = v16;
  }
  if (v13 == (void *)v12)
  {
LABEL_18:
    uint64_t v12 = v4[2];
    uint64_t v4 = (void *)v55[0];
    uint64_t v46 = v55[1];
    uint64_t v7 = v57;
    if (v58)
    {
      unint64_t v18 = (v58 - 1) & v58;
      unint64_t v19 = __clz(__rbit64(v58)) | (v57 << 6);
      uint64_t v20 = v56;
LABEL_20:
      uint64_t v21 = (uint64_t *)(v4[6] + 16 * v19);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      sub_100008390(v4[7] + 32 * v19, (uint64_t)&v53);
      *(void *)&long long v52 = v23;
      *((void *)&v52 + 1) = v22;
      swift_bridgeObjectRetain();
      uint64_t v3 = v7;
LABEL_44:
      sub_10000FD48((uint64_t)&v52, (uint64_t)&v49, &qword_1001009B0);
      if (!*((void *)&v49 + 1))
      {
LABEL_82:
        sub_10000FBD8((uint64_t)&v52, &qword_1001009B0);
        sub_100055710();
        return sub_10000FBD8((uint64_t)&v49, &qword_1001009B0);
      }
      int64_t v47 = (unint64_t)(v20 + 64) >> 6;
      while (1)
      {
        sub_10000FBD8((uint64_t)&v49, &qword_1001009B0);
        uint64_t v29 = *v2;
        unint64_t v30 = (*v2)[3];
        int64_t v31 = v30 >> 1;
        if ((uint64_t)(v30 >> 1) < v12 + 1)
        {
          uint64_t v29 = sub_10003C5CC((void *)(v30 > 1), v12 + 1, 1, *v2);
          *uint64_t v2 = v29;
          int64_t v31 = v29[3] >> 1;
        }
        sub_10000FD48((uint64_t)&v52, (uint64_t)v48, &qword_1001009B0);
        if (*((void *)&v48[0] + 1)) {
          break;
        }
        int64_t v38 = v3;
LABEL_81:
        sub_10000FBD8((uint64_t)v48, &qword_1001009B0);
        uint64_t v3 = v38;
        int64_t v31 = v12;
LABEL_47:
        (*v2)[2] = v31;
        sub_10000FD48((uint64_t)&v52, (uint64_t)&v49, &qword_1001009B0);
        if (!*((void *)&v49 + 1)) {
          goto LABEL_82;
        }
      }
      char v32 = v29 + 4;
      if (v12 > v31) {
        int64_t v31 = v12;
      }
      while (1)
      {
        long long v49 = v48[0];
        long long v50 = v48[1];
        long long v51 = v48[2];
        if (v12 == v31)
        {
          sub_10000FBD8((uint64_t)&v49, &qword_1000FD5C0);
          uint64_t v12 = v31;
          goto LABEL_47;
        }
        uint64_t result = sub_10000FBD8((uint64_t)&v52, &qword_1001009B0);
        uint64_t v39 = &v32[6 * v12];
        long long v41 = v50;
        long long v40 = v51;
        *uint64_t v39 = v49;
        v39[1] = v41;
        v39[2] = v40;
        if (!v18) {
          break;
        }
        unint64_t v33 = __clz(__rbit64(v18));
        v18 &= v18 - 1;
        unint64_t v34 = v33 | (v3 << 6);
LABEL_55:
        unsigned int v35 = (uint64_t *)(v4[6] + 16 * v34);
        uint64_t v36 = *v35;
        uint64_t v37 = v35[1];
        sub_100008390(v4[7] + 32 * v34, (uint64_t)&v53);
        *(void *)&long long v52 = v36;
        *((void *)&v52 + 1) = v37;
        swift_bridgeObjectRetain();
        int64_t v38 = v3;
LABEL_56:
        ++v12;
        sub_10000FD48((uint64_t)&v52, (uint64_t)v48, &qword_1001009B0);
        if (!*((void *)&v48[0] + 1)) {
          goto LABEL_81;
        }
      }
      int64_t v42 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
        __break(1u);
        return result;
      }
      if (v42 >= v47)
      {
        int64_t v38 = v3;
LABEL_64:
        unint64_t v18 = 0;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v3 = v38;
        long long v52 = 0u;
        goto LABEL_56;
      }
      unint64_t v43 = *(void *)(v46 + 8 * v42);
      if (!v43)
      {
        int64_t v44 = v3 + 2;
        int64_t v38 = v3 + 1;
        if (v3 + 2 >= v47) {
          goto LABEL_64;
        }
        unint64_t v43 = *(void *)(v46 + 8 * v44);
        if (!v43)
        {
          int64_t v38 = v3 + 2;
          if (v3 + 3 >= v47) {
            goto LABEL_64;
          }
          unint64_t v43 = *(void *)(v46 + 8 * (v3 + 3));
          if (v43)
          {
            int64_t v42 = v3 + 3;
            goto LABEL_62;
          }
          int64_t v44 = v3 + 4;
          int64_t v38 = v3 + 3;
          if (v3 + 4 >= v47) {
            goto LABEL_64;
          }
          unint64_t v43 = *(void *)(v46 + 8 * v44);
          if (!v43)
          {
            int64_t v42 = v3 + 5;
            int64_t v38 = v3 + 4;
            if (v3 + 5 >= v47) {
              goto LABEL_64;
            }
            unint64_t v43 = *(void *)(v46 + 8 * v42);
            if (!v43)
            {
              uint64_t v45 = v3 + 6;
              while (v47 != v45)
              {
                unint64_t v43 = *(void *)(v46 + 8 * v45++);
                if (v43)
                {
                  int64_t v42 = v45 - 1;
                  goto LABEL_62;
                }
              }
              int64_t v38 = v47 - 1;
              goto LABEL_64;
            }
            goto LABEL_62;
          }
        }
        int64_t v42 = v44;
      }
LABEL_62:
      unint64_t v18 = (v43 - 1) & v43;
      unint64_t v34 = __clz(__rbit64(v43)) + (v42 << 6);
      uint64_t v3 = v42;
      goto LABEL_55;
    }
LABEL_22:
    int64_t v24 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
LABEL_42:
      uint64_t v20 = v1;
    }
    else
    {
      uint64_t v20 = v56;
      int64_t v25 = (unint64_t)(v56 + 64) >> 6;
      uint64_t v3 = v7;
      if (v24 < v25)
      {
        unint64_t v26 = *(void *)(v46 + 8 * v24);
        if (v26)
        {
LABEL_25:
          unint64_t v18 = (v26 - 1) & v26;
          unint64_t v19 = __clz(__rbit64(v26)) + (v24 << 6);
          uint64_t v7 = v24;
          goto LABEL_20;
        }
        uint64_t v27 = v7 + 2;
        uint64_t v3 = v7 + 1;
        if (v7 + 2 < v25)
        {
          uint64_t v1 = v56;
          unint64_t v26 = *(void *)(v46 + 8 * v27);
          if (v26)
          {
LABEL_28:
            int64_t v24 = v27;
LABEL_29:
            uint64_t v20 = v56;
            goto LABEL_25;
          }
          uint64_t v3 = v7 + 2;
          if (v7 + 3 < v25)
          {
            unint64_t v26 = *(void *)(v46 + 8 * (v7 + 3));
            if (v26)
            {
              int64_t v24 = v7 + 3;
              goto LABEL_29;
            }
            uint64_t v27 = v7 + 4;
            uint64_t v3 = v7 + 3;
            uint64_t v20 = v56;
            if (v7 + 4 < v25)
            {
              unint64_t v26 = *(void *)(v46 + 8 * v27);
              if (v26) {
                goto LABEL_28;
              }
              int64_t v24 = v7 + 5;
              uint64_t v3 = v7 + 4;
              uint64_t v20 = v56;
              if (v7 + 5 < v25)
              {
                unint64_t v26 = *(void *)(v46 + 8 * v24);
                if (v26) {
                  goto LABEL_25;
                }
                uint64_t v3 = v25 - 1;
                uint64_t v28 = v7 + 6;
                do
                {
                  if (v25 == v28) {
                    goto LABEL_42;
                  }
                  unint64_t v26 = *(void *)(v46 + 8 * v28++);
                }
                while (!v26);
                int64_t v24 = v28 - 1;
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
    unint64_t v18 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v52 = 0u;
    goto LABEL_44;
  }

  return sub_100055710();
}

id sub_1000A90DC()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UILabel) init];
    int64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_1000A9150()
{
  id v1 = [objc_allocWithZone((Class)UIView) init];
  [v0 setView:v1];

  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v3 = v2;
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = sub_1000A90DC();
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = sub_1000A90DC();
  if (qword_1000FBC38 != -1) {
    swift_once();
  }
  [v5 setTextColor:qword_1001089C0];

  id v6 = sub_1000A90DC();
  if (qword_1000FBC30 != -1) {
    swift_once();
  }
  [v6 setFont:qword_1001089B8];

  id v7 = sub_1000A90DC();
  [v7 setLineBreakMode:0];

  id v8 = sub_1000A90DC();
  [v8 setNumberOfLines:0];

  id v9 = sub_1000A90DC();
  LODWORD(v10) = 1148846080;
  [v9 setContentCompressionResistancePriority:1 forAxis:v10];

  id v11 = [v0 view];
  if (!v11) {
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  id v13 = sub_1000A90DC();
  [v12 addSubview:v13];

  id v14 = [objc_allocWithZone((Class)UIImageView) init];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setTintColor:qword_1001089C0];
  [v14 setContentMode:1];
  NSString v15 = sub_1000BBA88();
  id v16 = [self systemImageNamed:v15];

  [v14 setImage:v16];
  LODWORD(v17) = 1148846080;
  [v14 setContentHuggingPriority:0 forAxis:v17];
  id v18 = [v0 view];
  if (!v18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v19 = v18;
  [v18 addSubview:v14];

  id v20 = [v0 view];
  if (!v20)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v21 = v20;
  [v20 _setCornerRadius:8.0];

  id v22 = [v0 view];
  if (!v22)
  {
LABEL_17:
    __break(1u);
    return;
  }
  uint64_t v23 = v22;
  if (qword_1000FBC40 != -1) {
    swift_once();
  }
  [v23 setBackgroundColor:qword_1001089C8];

  sub_100005D74(&qword_100100968);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000BE090;
  strcpy((char *)(inited + 32), "optionsLabel");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 48) = sub_1000A90DC();
  strcpy((char *)(inited + 56), "optionsChevron");
  *(unsigned char *)(inited + 71) = -18;
  *(void *)(inited + 72) = v14;
  id v44 = v14;
  unint64_t v25 = sub_1000546A8(inited);
  unint64_t v26 = sub_1000547CC((uint64_t)&off_1000E6B00);
  uint64_t v27 = self;
  NSString v28 = sub_1000BBA88();
  sub_100053838(v26);
  Class isa = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();
  sub_100053B94(v25);
  Class v30 = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();
  id v31 = [v27 constraintsWithVisualFormat:v28 options:0 metrics:isa views:v30];

  sub_1000074F8(0, (unint64_t *)&qword_1000FEB90);
  sub_1000BBBE8();

  NSString v32 = sub_1000BBA88();
  sub_100053838(v26);
  Class v33 = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();
  sub_100053B94(v25);
  Class v34 = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();
  id v35 = [v27 constraintsWithVisualFormat:v32 options:0 metrics:v33 views:v34];

  sub_1000BBBE8();
  NSString v36 = sub_1000BBA88();
  sub_100053838(v26);
  swift_bridgeObjectRelease();
  Class v37 = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();
  sub_100053B94(v25);
  swift_bridgeObjectRelease();
  Class v38 = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();
  id v39 = [v27 constraintsWithVisualFormat:v36 options:0 metrics:v37 views:v38];

  sub_1000BBBE8();
  unint64_t v40 = swift_bridgeObjectRetain();
  sub_1000A8974(v40);
  unint64_t v41 = swift_bridgeObjectRetain();
  sub_1000A8974(v41);
  unint64_t v42 = swift_bridgeObjectRetain();
  sub_1000A8974(v42);
  sub_100005D74(&qword_100100970);
  swift_arrayDestroy();
  Class v43 = sub_1000BBBD8().super.isa;
  swift_bridgeObjectRelease();
  [v27 activateConstraints:v43];
}

uint64_t sub_1000A9938()
{
  uint64_t v1 = type metadata accessor for BIABubbleViewModelUserInteractionParadigm(0);
  __chkstk_darwin(v1, v2);
  id v4 = &v25[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100005D74(&qword_1000FD6C0);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = &v25[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for BIABubbleViewModel(0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  id v13 = &v25[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = (uint64_t)v0 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel;
  swift_beginAccess();
  sub_10000FD48(v14, (uint64_t)v8, &qword_1000FD6C0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000FBD8((uint64_t)v8, &qword_1000FD6C0);
    id v15 = sub_1000A90DC();
    NSString v16 = sub_1000BBA88();
    [v15 setText:v16];

    swift_getKeyPath();
    swift_getKeyPath();
    char v26 = 0;
    id v17 = v0;
    return sub_1000BB698();
  }
  else
  {
    sub_100065BEC((uint64_t)v8, (uint64_t)v13, type metadata accessor for BIABubbleViewModel);
    sub_1000AAD30((uint64_t)&v13[*(int *)(v9 + 32)], (uint64_t)v4, type metadata accessor for BIABubbleViewModelUserInteractionParadigm);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        swift_bridgeObjectRelease();
        id v19 = sub_1000A90DC();
        NSString v20 = sub_1000BBA88();
        swift_bridgeObjectRelease();
        [v19 setText:v20];

        swift_getKeyPath();
        swift_getKeyPath();
        char v26 = 1;
        goto LABEL_8;
      case 2u:
        uint64_t v21 = sub_100005D74(&qword_1000FC8C0);
        sub_10000FBD8((uint64_t)&v4[*(int *)(v21 + 48)], &qword_1000FC8B8);
        sub_10000FBD8((uint64_t)v4, &qword_1000FC8B8);
        goto LABEL_7;
      case 3u:
        goto LABEL_7;
      default:
        sub_1000AB8CC((uint64_t)v4, type metadata accessor for BIABubbleViewModelUserAction);
LABEL_7:
        id v22 = sub_1000A90DC();
        NSString v23 = sub_1000BBA88();
        [v22 setText:v23];

        swift_getKeyPath();
        swift_getKeyPath();
        char v26 = 0;
LABEL_8:
        id v24 = v0;
        sub_1000BB698();
        uint64_t result = sub_1000AB8CC((uint64_t)v13, type metadata accessor for BIABubbleViewModel);
        break;
    }
  }
  return result;
}

void sub_1000A9D3C(void *a1, void *a2)
{
  uint64_t v4 = OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer;
  if (a1
    && *(void *)(v2 + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer))
  {
    [a1 removeGestureRecognizer];
    uint64_t v4 = OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer;
  }
  uint64_t v5 = *(void **)(v2 + v4);
  *(void *)(v2 + v4) = 0;

  if (a2)
  {
    id v6 = objc_allocWithZone((Class)UITapGestureRecognizer);
    id v7 = a2;
    id v8 = [v6 initWithTarget:v2 action:"_handleBubbleTapped"];
    [v7 addGestureRecognizer:v8];
    id v9 = *(id *)(v2 + v4);
    *(void *)(v2 + v4) = v8;
  }
}

uint64_t sub_1000A9E34()
{
  uint64_t v98 = sub_100005D74(&qword_1000FDF20);
  uint64_t v94 = *(void *)(v98 - 8);
  uint64_t v2 = __chkstk_darwin(v98, v1);
  v97 = (uint64_t *)((char *)&v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v2, v4);
  id v6 = (uint64_t *)((char *)&v90 - v5);
  uint64_t v7 = type metadata accessor for BIABubbleViewModelUserAction(0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v96 = (uint64_t)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BIABubbleViewModelUserInteractionParadigm(0);
  __chkstk_darwin(v10, v11);
  id v13 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005D74(&qword_1000FD6C0);
  __chkstk_darwin(v14 - 8, v15);
  id v17 = (char *)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for BIABubbleViewModel(0);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  id v22 = (char *)&v90 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = v0;
  uint64_t v23 = (uint64_t)&v0[OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel];
  swift_beginAccess();
  sub_10000FD48(v23, (uint64_t)v17, &qword_1000FD6C0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1) {
    goto LABEL_28;
  }
  sub_100065BEC((uint64_t)v17, (uint64_t)v22, type metadata accessor for BIABubbleViewModel);
  sub_1000AAD30((uint64_t)&v22[*(int *)(v18 + 32)], (uint64_t)v13, type metadata accessor for BIABubbleViewModelUserInteractionParadigm);
  uint64_t v24 = (uint64_t)v22;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v28 = *((void *)v13 + 2);
      swift_bridgeObjectRelease();
      id v29 = v95;
      Class v30 = (char *)[v95 parentViewController];
      if (!v30) {
        goto LABEL_29;
      }
      id v17 = v30;
      id v31 = [v30 view];

      if (!v31) {
        goto LABEL_29;
      }
      NSString v32 = (char *)[v29 view];
      if (!v32)
      {
        __break(1u);
        goto LABEL_27;
      }
      id v17 = v32;
      id v33 = [v29 view];
      if (!v33)
      {
LABEL_27:
        __break(1u);
LABEL_28:
        sub_10000FBD8((uint64_t)v17, &qword_1000FD6C0);
LABEL_29:
        sub_1000BC0B8();
        __break(1u);
        JUMPOUT(0x1000AA848);
      }
      Class v34 = v33;
      [v33 bounds];
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;

      [v17 convertRect:v31 toCoordinateSpace:v36, v38, v40, v42];
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;

      sub_100041348((uint64_t)v29 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context, (uint64_t)v100);
      long long v51 = sub_100007350(v100, v100[3]);
      long long v52 = v51;
      int64_t v53 = *(void *)(v28 + 16);
      id v93 = v31;
      if (v53)
      {
        v90 = v51;
        v92 = v22;
        aBlock[0] = _swiftEmptyArrayStorage;
        sub_1000AAD10(0, v53, 0);
        unint64_t v54 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
        uint64_t v91 = v28;
        uint64_t v55 = v28 + v54;
        uint64_t v96 = *(void *)(v94 + 72);
        uint64_t v56 = aBlock[0];
        uint64_t v57 = v55;
        int64_t v58 = v53;
        do
        {
          sub_10000FD48(v57, (uint64_t)v6, &qword_1000FDF20);
          NSString v59 = v97;
          uint64_t v60 = *(int *)(v98 + 64);
          uint64_t v61 = (uint64_t)v97 + v60;
          uint64_t v63 = *v6;
          uint64_t v62 = v6[1];
          uint64_t *v97 = *v6;
          v59[1] = v62;
          uint64_t v64 = v6[3];
          v59[2] = v6[2];
          v59[3] = v64;
          sub_1000AAD30((uint64_t)v6 + v60, v61, type metadata accessor for BIABubbleViewModelUserAction);
          swift_bridgeObjectRetain();
          sub_1000AB8CC(v61, type metadata accessor for BIABubbleViewModelUserAction);
          sub_10000FBD8((uint64_t)v6, &qword_1000FDF20);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v66 = v56;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_1000AAD10(0, *(void *)(v56 + 16) + 1, 1);
            uint64_t v66 = aBlock[0];
          }
          unint64_t v68 = *(void *)(v66 + 16);
          unint64_t v67 = *(void *)(v66 + 24);
          if (v68 >= v67 >> 1)
          {
            sub_1000AAD10(v67 > 1, v68 + 1, 1);
            uint64_t v66 = aBlock[0];
          }
          *(void *)(v66 + 16) = v68 + 1;
          uint64_t v69 = v66 + 16 * v68;
          *(void *)(v69 + 32) = v63;
          *(void *)(v69 + 40) = v62;
          v57 += v96;
          --v58;
          uint64_t v56 = v66;
        }
        while (v58);
        uint64_t v94 = v66;
        aBlock[0] = _swiftEmptyArrayStorage;
        sub_1000AAD10(0, v53, 0);
        uint64_t v71 = aBlock[0];
        id v29 = v95;
        do
        {
          sub_10000FD48(v55, (uint64_t)v6, &qword_1000FDF20);
          v72 = v97;
          uint64_t v73 = *(int *)(v98 + 64);
          uint64_t v74 = (uint64_t)v97 + v73;
          uint64_t v75 = v6[1];
          uint64_t *v97 = *v6;
          v72[1] = v75;
          uint64_t v77 = v6[2];
          uint64_t v76 = v6[3];
          v72[2] = v77;
          v72[3] = v76;
          sub_1000AAD30((uint64_t)v6 + v73, v74, type metadata accessor for BIABubbleViewModelUserAction);
          swift_bridgeObjectRetain();
          sub_1000AB8CC(v74, type metadata accessor for BIABubbleViewModelUserAction);
          sub_10000FBD8((uint64_t)v6, &qword_1000FDF20);
          char v78 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v79 = v71;
          if ((v78 & 1) == 0)
          {
            sub_1000AAD10(0, *(void *)(v71 + 16) + 1, 1);
            uint64_t v79 = aBlock[0];
          }
          unint64_t v81 = *(void *)(v79 + 16);
          unint64_t v80 = *(void *)(v79 + 24);
          if (v81 >= v80 >> 1)
          {
            sub_1000AAD10(v80 > 1, v81 + 1, 1);
            uint64_t v79 = aBlock[0];
          }
          *(void *)(v79 + 16) = v81 + 1;
          uint64_t v82 = v79 + 16 * v81;
          *(void *)(v82 + 32) = v77;
          *(void *)(v82 + 40) = v76;
          v55 += v96;
          --v53;
          uint64_t v71 = v79;
        }
        while (v53);
        uint64_t v24 = (uint64_t)v92;
        uint64_t v28 = v91;
        long long v52 = v90;
      }
      uint64_t v83 = swift_allocObject();
      *(void *)(v83 + 16) = v28;
      *(void *)(v83 + 24) = v29;
      v84 = *(void **)(*v52 + OBJC_IVAR____TtC8Business19PluginBubbleContext_appController);
      id v85 = v29;
      Class isa = sub_1000BBBD8().super.isa;
      Class v87 = sub_1000BBBD8().super.isa;
      uint64_t v88 = swift_allocObject();
      *(void *)(v88 + 16) = sub_1000AADD8;
      *(void *)(v88 + 24) = v83;
      aBlock[4] = sub_1000AAE18;
      aBlock[5] = v88;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000A8920;
      aBlock[3] = &unk_1000EA1B8;
      v89 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v84 _presentContextMenuWithButtonTitles:isa, v87, v89, v44, v46, v48, v50];
      _Block_release(v89);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();

      sub_1000AB8CC(v24, type metadata accessor for BIABubbleViewModel);
      return sub_10000FE60((uint64_t)v100);
    case 2u:
      sub_1000AB8CC((uint64_t)v22, type metadata accessor for BIABubbleViewModel);
      uint64_t v70 = sub_100005D74(&qword_1000FC8C0);
      sub_10000FBD8((uint64_t)&v13[*(int *)(v70 + 48)], &qword_1000FC8B8);
      return sub_10000FBD8((uint64_t)v13, &qword_1000FC8B8);
    case 3u:
      return sub_1000AB8CC((uint64_t)v22, type metadata accessor for BIABubbleViewModel);
    default:
      uint64_t v25 = v96;
      sub_100065BEC((uint64_t)v13, v96, type metadata accessor for BIABubbleViewModelUserAction);
      char v26 = (void **)sub_100007350(&v95[OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context], *(void *)&v95[OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context + 24]);
      sub_1000AB58C(*v26, v25);
      sub_1000AB8CC(v25, type metadata accessor for BIABubbleViewModelUserAction);
      return sub_1000AB8CC((uint64_t)v22, type metadata accessor for BIABubbleViewModel);
  }
}

uint64_t sub_1000AA858(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005D74(&qword_1000FDF20);
  uint64_t result = __chkstk_darwin(v6, v7);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a2 + 16);
  if (v12 != a1)
  {
    if (a1 < 0 || v12 <= a1)
    {
      __break(1u);
    }
    else
    {
      sub_10000FD48(a2+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * a1, (uint64_t)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1000FDF20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = (uint64_t)&v11[*(int *)(v6 + 64)];
      uint64_t v14 = (void **)sub_100007350((void *)(a3 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context), *(void *)(a3 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context + 24));
      sub_1000AB58C(*v14, v13);
      return sub_1000AB8CC(v13, type metadata accessor for BIABubbleViewModelUserAction);
    }
  }
  return result;
}

void sub_1000AAA5C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer);
}

id sub_1000AAA9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BIABubbleOptionsiOSViewController();
  return [super dealloc];
}

uint64_t sub_1000AAB20()
{
  return type metadata accessor for BIABubbleOptionsiOSViewController();
}

uint64_t type metadata accessor for BIABubbleOptionsiOSViewController()
{
  uint64_t result = qword_100100958;
  if (!qword_100100958) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000AAB74()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_1000AABB8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000BB688();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000AAC3C(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_1000BB698();
}

uint64_t sub_1000AACB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000B0E58(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_1000AACD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000B0FE4(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_1000AACF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000B122C(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_1000AAD10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000B146C(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1000AAD30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000AAD98()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000AADD8(int a1)
{
  return sub_1000AA858(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000AADE0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000AAE18(uint64_t a1)
{
  return sub_100018424(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_1000AAE20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000AAE30()
{
  return swift_release();
}

uint64_t sub_1000AAE38(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000BC0D8();
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
    uint64_t v10 = sub_1000BC0D8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000AB92C(&qword_100100978, &qword_100100970);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100005D74(&qword_100100970);
          uint64_t v12 = sub_10006BE14(v16, i, a3);
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
    sub_1000074F8(0, (unint64_t *)&qword_1000FEB90);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

uint64_t sub_1000AB058(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000AB0D0(a1, a2, a3, (void (*)(void))type metadata accessor for IMBProposedDate, &qword_1001009C0, &qword_1001009B8, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10006BE80);
}

uint64_t sub_1000AB094(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000AB0D0(a1, a2, a3, (void (*)(void))type metadata accessor for IMBProposedTimeslot, &qword_1001009A8, &qword_1001009A0, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10006BE80);
}

uint64_t sub_1000AB0D0(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1000BC0D8();
    swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1000BC0D8();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = sub_1000AB92C(a5, a6);
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = sub_100005D74(a6);
          id v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
          uint64_t v24 = *v23;
          swift_retain();
          v22(v26, 0);
          *(void *)(a1 + 8 * i) = v24;
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
  uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

uint64_t sub_1000AB2F4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000AB0D0(a1, a2, a3, (void (*)(void))type metadata accessor for IMBListItem, &qword_100100998, &qword_100100990, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10006BEE8);
}

uint64_t sub_1000AB330(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000AB0D0(a1, a2, a3, (void (*)(void))type metadata accessor for IMBListSection, &qword_100100988, &qword_100100980, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10006BE80);
}

uint64_t sub_1000AB36C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000BC0D8();
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
    uint64_t v10 = sub_1000BC0D8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000AB92C(&qword_1001009D0, &qword_1001009C8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100005D74(&qword_1001009C8);
          uint64_t v12 = sub_10006BF50(v16, i, a3);
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
    sub_1000074F8(0, &qword_1000FE988);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

uint64_t sub_1000AB58C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URLHelper();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000BB138();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = type metadata accessor for BIABubbleViewModelUserAction(0);
  __chkstk_darwin(v13, v14);
  uint64_t v16 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = type metadata accessor for PluginBubbleContext();
  v37[3] = v17;
  v37[4] = &off_1000E7130;
  v37[0] = a1;
  sub_1000AAD30(a2, (uint64_t)v16, type metadata accessor for BIABubbleViewModelUserAction);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = *(void *)v16;
    uint64_t v19 = *((void *)v16 + 1);
    char v20 = v16[16];
    uint64_t v22 = *((void *)v16 + 3);
    uint64_t v21 = *((void *)v16 + 4);
    uint64_t v24 = *((void *)v16 + 5);
    uint64_t v23 = *((void *)v16 + 6);
    sub_100007350(v37, v17);
    uint64_t v30 = v18;
    uint64_t v31 = v19;
    char v32 = v20;
    uint64_t v33 = v22;
    uint64_t v34 = v21;
    uint64_t v35 = v24;
    uint64_t v36 = v23;
    sub_1000247EC();
    sub_100024840();
    id v25 = a1;
    swift_bridgeObjectRetain();
    sub_1000BB498();
    uint64_t v27 = (void *)BCMessageRootNotificationKey;
    sub_100005D74(&qword_1000FC470);
    swift_dynamicCast();
    sub_100018210(v27, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32))(v12, v16, v8);
    id v26 = a1;
    sub_100054EF8((uint64_t)v7);
    sub_1000548E0((uint64_t)v12, 1, sub_1000610D8, 0);
    sub_1000AB8CC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for URLHelper);
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return sub_10000FE60((uint64_t)v37);
}

uint64_t sub_1000AB8CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000AB92C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E14(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000AB97C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1000BB3C8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_1000AE7EC((unint64_t *)&qword_1000FD600),
        uint64_t v8 = sub_1000BBA58(),
        uint64_t v9 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v10 = v8 & ~v9,
        uint64_t v11 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0))
  {
    uint64_t v18 = ~v9;
    uint64_t v19 = a2;
    uint64_t v12 = v4 + 16;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v14 = *(void *)(v12 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v12 - 8);
    do
    {
      v13(v7, *(void *)(v19 + 48) + v14 * v10, v3);
      sub_1000AE7EC((unint64_t *)&qword_1000FCC88);
      char v16 = sub_1000BBA78();
      (*v15)(v7, v3);
      if (v16) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v18;
    }
    while (((*(void *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

void sub_1000ABBE8()
{
  v24.receiver = v0;
  v24.super_class = (Class)type metadata accessor for MacListPickerTableViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    return;
  }
  uint64_t v2 = v1;
  if (qword_1000FBBF8 != -1) {
    swift_once();
  }
  [v2 setBackgroundColor:qword_100108980];

  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView];
  type metadata accessor for IMBDefaultSectionHeader();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v5 = sub_1000BBA88();
  [v3 registerClass:ObjCClassFromMetadata forHeaderFooterViewReuseIdentifier:v5];

  type metadata accessor for MacListPickerTableViewCell();
  uint64_t v6 = swift_getObjCClassFromMetadata();
  NSString v7 = sub_1000BBA88();
  [v3 registerClass:v6 forCellReuseIdentifier:v7];

  [v3 setEstimatedRowHeight:140.0];
  [v3 setSectionHeaderHeight:UITableViewAutomaticDimension];
  [v3 setEstimatedSectionHeaderHeight:80.0];
  [v3 setSeparatorStyle:0];
  [v3 setBackgroundColor:qword_100108980];
  [v3 _setSectionContentInset:0.0, 8.0, 0.0, 8.0];
  [v3 _setSectionCornerRadius:0.0];
  if (!v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType])
  {
    uint64_t v8 = 0;
    uint64_t v9 = &selRef_setAllowsSelection_;
    goto LABEL_8;
  }
  if (v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType] == 2)
  {
    uint64_t v8 = 1;
    uint64_t v9 = &selRef_setAllowsMultipleSelection_;
LABEL_8:
    [v3 *v9 v8];
  }
  unint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_nothingAvailableLabel];
  uint64_t v11 = *(void *)&v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest];
  if (v11)
  {
    unint64_t v12 = *(void *)(v11 + 24);
    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_1000BC0D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v10 setHidden:v13 > 0];
  uint64_t v14 = (objc_class *)[self mainBundle];
  v23._uint64_t countAndFlagsBits = 0xE000000000000000;
  v25._object = (void *)0x80000001000C53A0;
  v25._uint64_t countAndFlagsBits = 0xD000000000000012;
  v26.value._uint64_t countAndFlagsBits = 0;
  v26.value._object = 0;
  v15.super.Class isa = v14;
  v27._uint64_t countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_1000BB068(v25, v26, v15, v27, v23);

  NSString v16 = sub_1000BBA88();
  swift_bridgeObjectRelease();
  [v10 setText:v16];

  uint64_t v17 = &v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths];
  swift_beginAccess();
  BOOL v18 = *(void *)(*(void *)v17 + 16) != 0;
  uint64_t v19 = sub_10008E844();
  uint64_t v21 = v20;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(BOOL, uint64_t, uint64_t))(v21 + 48))(v18, ObjectType, v21);
}

id sub_1000AC000()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)type metadata accessor for MacTableHeaderView()) init];
  int v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType);
  id v4 = sub_100014AA4();
  NSString v5 = *(void **)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message);
  if (v3)
  {
    id v6 = [*(id *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message) receivedMessage];
    if (v6
      && (NSString v7 = v6, v8 = (objc_class *)[v6 title],
                   v7,
                   v8))
    {
      sub_1000BBAC8();
    }
    else
    {
      uint64_t v8 = (objc_class *)[self mainBundle];
      v28._uint64_t countAndFlagsBits = 0xE000000000000000;
      v29._object = (void *)0x80000001000C5380;
      v29._uint64_t countAndFlagsBits = 0xD000000000000019;
      v31.value._uint64_t countAndFlagsBits = 0;
      v31.value._object = 0;
      v9.super.Class isa = v8;
      v33._uint64_t countAndFlagsBits = 0;
      v33._object = (void *)0xE000000000000000;
      sub_1000BB068(v29, v31, v9, v33, v28);
    }

    NSString v10 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    [v4 setText:v10];

    id v11 = sub_100014BB4();
    id v12 = [v5 receivedMessage];
    NSString v13 = v12;
    if (v12)
    {
      id v14 = [v12 subtitle];

      if (v14)
      {
        sub_1000BBAC8();

        NSString v13 = sub_1000BBA88();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v13 = 0;
      }
    }
    [v11 setText:v13];
  }
  else
  {
    id v15 = [*(id *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message) replyMessage];
    if (v15
      && (NSString v16 = v15,
          uint64_t v17 = (objc_class *)[v15 title],
          v16,
          v17))
    {
      sub_1000BBAC8();
    }
    else
    {
      uint64_t v17 = (objc_class *)[self mainBundle];
      v30._uint64_t countAndFlagsBits = 0xD000000000000022;
      v28._uint64_t countAndFlagsBits = 0xE000000000000000;
      v30._object = (void *)0x80000001000C5350;
      v32.value._uint64_t countAndFlagsBits = 0;
      v32.value._object = 0;
      v18.super.Class isa = v17;
      v34._uint64_t countAndFlagsBits = 0;
      v34._object = (void *)0xE000000000000000;
      sub_1000BB068(v30, v32, v18, v34, v28);
    }

    NSString v19 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    [v4 setText:v19];

    NSString v13 = sub_100014BB4();
    [v13 setText:0];
  }

  id v20 = [self separatorColor];
  id v21 = v2;
  id v22 = sub_100015338();

  [v22 setBackgroundColor:v20];
  id v23 = sub_100015338();
  uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (v24)
  {
    unint64_t v25 = *(void *)(v24 + 24);
    if (v25 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_1000BC0D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    uint64_t v26 = 0;
  }
  [v23 setHidden:v26 > 1];

  return v21;
}

uint64_t sub_1000AC3E0()
{
  int v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType);
  id v2 = self;
  int v3 = (objc_class *)[v2 mainBundle];
  v16._uint64_t countAndFlagsBits = 0xE000000000000000;
  if (v1)
  {
    v18._uint64_t countAndFlagsBits = 1145980243;
    v18._object = (void *)0xE400000000000000;
    v21.value._uint64_t countAndFlagsBits = 0;
    v21.value._object = 0;
    v4.super.Class isa = v3;
    v24._uint64_t countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    uint64_t v5 = sub_1000BB068(v18, v21, v4, v24, v16);
    uint64_t v7 = v6;

    uint64_t v8 = (objc_class *)[v2 mainBundle];
    v17._uint64_t countAndFlagsBits = 0xE000000000000000;
    v19._uint64_t countAndFlagsBits = 0x4C45434E4143;
    v19._object = (void *)0xE600000000000000;
    v22.value._uint64_t countAndFlagsBits = 0;
    v22.value._object = 0;
    v9.super.Class isa = v8;
    v25._uint64_t countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    uint64_t v10 = sub_1000BB068(v19, v22, v9, v25, v17);
    uint64_t v12 = v11;

    type metadata accessor for FooterToolbarModel();
    uint64_t result = swift_allocObject();
    *(void *)(result + 80) = 0;
    *(void *)(result + 88) = 0;
    *(unsigned char *)(result + 96) = 1;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0xE000000000000000;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = v5;
    *(void *)(result + 48) = v7;
  }
  else
  {
    v20._uint64_t countAndFlagsBits = 1162760004;
    v20._object = (void *)0xE400000000000000;
    v23.value._uint64_t countAndFlagsBits = 0;
    v23.value._object = 0;
    v14.super.Class isa = v3;
    v26._uint64_t countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    uint64_t v10 = sub_1000BB068(v20, v23, v14, v26, v16);
    uint64_t v12 = v15;

    type metadata accessor for FooterToolbarModel();
    uint64_t result = swift_allocObject();
    *(void *)(result + 80) = 0;
    *(void *)(result + 88) = 0;
    *(unsigned char *)(result + 96) = 1;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0xE000000000000000;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0xE000000000000000;
  }
  *(void *)(result + 56) = 2;
  *(void *)(result + 64) = v10;
  *(void *)(result + 72) = v12;
  return result;
}

void sub_1000AC580()
{
  uint64_t v1 = sub_1000BB3C8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005D74(&qword_1000FCC80);
  uint64_t v8 = __chkstk_darwin(v6 - 8, v7);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  NSString v13 = (char *)&v51 - v12;
  NSBundle v14 = &v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths];
  swift_beginAccess();
  uint64_t v15 = *(void *)v14;
  uint64_t v16 = *(void *)(*(void *)v14 + 56);
  uint64_t v56 = *(void *)v14 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(v15 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v16;
  int64_t v57 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v64 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
  uint64_t v61 = v2 + 48;
  uint64_t v62 = v2 + 16;
  uint64_t v60 = (void (**)(char *, char *, uint64_t))(v2 + 32);
  UIAccessibilityTraits v54 = UIAccessibilityTraitStaticText;
  UIAccessibilityTraits v52 = UIAccessibilityTraitNotEnabled;
  UIAccessibilityTraits v53 = UIAccessibilityTraitButton;
  UIAccessibilityTraits v51 = UIAccessibilityTraitSelected;
  NSString v59 = (void (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain_n();
  uint64_t v63 = v0;
  int64_t v20 = 0;
  uint64_t v55 = v13;
  while (1)
  {
    if (v19)
    {
      unint64_t v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v22 = v21 | (v20 << 6);
      goto LABEL_24;
    }
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v23 >= v57) {
      goto LABEL_40;
    }
    unint64_t v24 = *(void *)(v56 + 8 * v23);
    ++v20;
    if (!v24)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v57) {
        goto LABEL_40;
      }
      unint64_t v24 = *(void *)(v56 + 8 * v20);
      if (!v24)
      {
        int64_t v20 = v23 + 2;
        if (v23 + 2 >= v57) {
          goto LABEL_40;
        }
        unint64_t v24 = *(void *)(v56 + 8 * v20);
        if (!v24)
        {
          int64_t v20 = v23 + 3;
          if (v23 + 3 >= v57) {
            goto LABEL_40;
          }
          unint64_t v24 = *(void *)(v56 + 8 * v20);
          if (!v24) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v19 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v20 << 6);
LABEL_24:
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v13, *(void *)(v15 + 48) + *(void *)(v2 + 72) * v22, v1);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v13, 0, 1, v1);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v13, 1, v1) == 1) {
      goto LABEL_41;
    }
    int64_t v65 = v20;
    (*v60)(v5, v13, v1);
    swift_beginAccess();
    sub_1000B3430((uint64_t)v5, (uint64_t)v10);
    sub_100022168((uint64_t)v10);
    swift_endAccess();
    Swift::String v26 = *(void **)&v63[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView];
    Class isa = sub_1000BB378().super.isa;
    id v28 = [v26 cellForRowAtIndexPath:isa];

    if (v28)
    {
      type metadata accessor for MacListPickerTableViewCell();
      uint64_t v29 = swift_dynamicCastClass();
      if (v29)
      {
        Swift::String v30 = (unsigned char *)v29;
        uint64_t v31 = v1;
        uint64_t v32 = v15;
        Swift::String v33 = v10;
        uint64_t v34 = v2;
        uint64_t v35 = v5;
        uint64_t v36 = v14;
        uint64_t v37 = OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected;
        *(unsigned char *)(v29 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 0;
        id v58 = v28;
        sub_100070BA8();
        UIAccessibilityTraits v38 = v54;
        if (v30[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton]) {
          UIAccessibilityTraits v38 = v53;
        }
        UIAccessibilityTraits v39 = v52;
        if ((v52 & ~v38) == 0) {
          UIAccessibilityTraits v39 = 0;
        }
        if (v30[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed]) {
          UIAccessibilityTraits v40 = v39;
        }
        else {
          UIAccessibilityTraits v40 = 0;
        }
        UIAccessibilityTraits v41 = v38 | v40;
        int v42 = v30[v37];
        NSBundle v14 = v36;
        uint64_t v5 = v35;
        uint64_t v2 = v34;
        uint64_t v10 = v33;
        uint64_t v15 = v32;
        uint64_t v1 = v31;
        NSString v13 = v55;
        UIAccessibilityTraits v43 = v51;
        if ((v51 & ~v41) == 0) {
          UIAccessibilityTraits v43 = 0;
        }
        if (v42) {
          UIAccessibilityTraits v44 = v43;
        }
        else {
          UIAccessibilityTraits v44 = 0;
        }
        [v30 setAccessibilityTraits:v41 | v44];
      }
    }
    (*v59)(v5, v1);
    int64_t v20 = v65;
  }
  int64_t v25 = v23 + 4;
  if (v25 >= v57)
  {
LABEL_40:
    (*v64)(v13, 1, 1, v1);
LABEL_41:
    swift_release();
    swift_bridgeObjectRelease();
    BOOL v45 = *(void *)(*(void *)v14 + 16) != 0;
    double v46 = v63;
    double v47 = sub_10008E844();
    uint64_t v49 = v48;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(BOOL, uint64_t, uint64_t))(v49 + 48))(v45, ObjectType, v49);

    return;
  }
  unint64_t v24 = *(void *)(v56 + 8 * v25);
  if (v24)
  {
    int64_t v20 = v25;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v20 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v20 >= v57) {
      goto LABEL_40;
    }
    unint64_t v24 = *(void *)(v56 + 8 * v20);
    ++v25;
    if (v24) {
      goto LABEL_23;
    }
  }
LABEL_43:
  __break(1u);
}

void sub_1000ACB1C()
{
  uint64_t v1 = v0;
  if (qword_1000FBCC0 != -1) {
    swift_once();
  }
  sub_1000BBCF8();
  sub_1000BB4A8();
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (v2)
  {
    swift_beginAccess();
    swift_retain_n();
    uint64_t v3 = swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000B18E4(v3);
    swift_bridgeObjectRelease();
    type metadata accessor for IMBListResponse();
    uint64_t v5 = (void *)swift_allocObject();
    v5[4] = 0;
    v5[2] = v2;
    NSBundle v14 = v4;
    swift_retain();
    swift_retain();
    sub_1000B15D8(&v14);
    swift_release();
    swift_release();
    uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation);
    v5[3] = v14;
    sub_100069B14(v6, *(id *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message));
    uint64_t v7 = v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectRelease();
    if (Strong)
    {
      if (swift_unknownObjectWeakLoadStrong())
      {
        uint64_t v9 = *(void *)(v7 + 8);
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
        uint64_t v12 = type metadata accessor for MacListPickerTableViewController();
        v11(v1, v12, ObjectType, v9);
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
      swift_release();
    }
    else
    {
      __break(1u);
      swift_release();
      __break(1u);
    }
  }
  else
  {
    sub_1000074F8(0, (unint64_t *)&qword_1000FCE70);
    id v13 = (id)sub_1000BBE68();
    sub_1000BBD28();
    sub_1000BB4A8();
  }
}

unint64_t sub_1000ACFAC(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  NSString v6 = sub_1000BBA88();
  id v7 = [a1 dequeueReusableCellWithIdentifier:v6];

  if (v7)
  {
    type metadata accessor for MacListPickerTableViewCell();
    uint64_t v8 = swift_dynamicCastClass();
    if (v8)
    {
      uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
      if (!v9)
      {
        uint64_t v10 = [objc_allocWithZone((Class)UITableViewCell) init];

        return (unint64_t)v10;
      }
      uint64_t v10 = (unsigned char *)v8;
      uint64_t v11 = *(void *)(v9 + 24);
      swift_bridgeObjectRetain();
      unint64_t v12 = sub_1000BB3B8();
      if ((v11 & 0xC000000000000001) == 0)
      {
        if ((v12 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v12 < *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          uint64_t v13 = *(void *)(v11 + 8 * v12 + 32);
          swift_retain();
          goto LABEL_8;
        }
        __break(1u);
        goto LABEL_31;
      }
      uint64_t v13 = sub_1000BC018();
LABEL_8:
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void *)(v13 + 40);
      swift_bridgeObjectRetain();
      swift_release();
      unint64_t result = sub_1000BB3A8();
      if ((v14 & 0xC000000000000001) == 0)
      {
        if ((result & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (result < *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          uint64_t v16 = *(void *)(v14 + 8 * result + 32);
          swift_retain();
          goto LABEL_12;
        }
        __break(1u);
LABEL_34:
        __break(1u);
        return result;
      }
LABEL_31:
      uint64_t v16 = sub_1000BC018();
LABEL_12:
      swift_bridgeObjectRelease();
      int v17 = *(unsigned __int8 *)(v3 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType);
      v10[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_selectionType] = v17;
      sub_100070BA8();
      *(void *)&v10[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItem] = v16;
      swift_retain_n();
      swift_release();
      sub_100070BA8();
      swift_release();
      uint64_t v18 = self;
      id v19 = v7;
      id v20 = [v18 separatorColor];
      [v10 setSeparatorColor:v20];

      [v10 setSelectionStyle:0];
      unint64_t v21 = (uint64_t *)(v3 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths);
      swift_beginAccess();
      uint64_t v22 = *v21;
      swift_bridgeObjectRetain();
      char v23 = sub_1000AB97C(a2, v22);
      swift_bridgeObjectRelease();
      v10[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected] = v23 & 1;
      sub_100070BA8();
      sub_100070F94();
      if (v17)
      {
        v10[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton] = 1;
      }
      else
      {
        v10[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton] = 0;
        sub_100070F94();
        BOOL v25 = sub_1000BB3B8() != 0;
        uint64_t v26 = OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed;
        v10[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed] = v25;
        id v27 = [v10 contentView];
        id v28 = v27;
        double v29 = 0.3;
        if (!v10[v26]) {
          double v29 = 1.0;
        }
        [v27 setAlpha:v29];
      }
      sub_100070F94();
      uint64_t v30 = sub_1000BB3A8();
      unint64_t result = (unint64_t)[a1 numberOfRowsInSection:sub_1000BB3B8()];
      if (!__OFSUB__(result, 1))
      {
        uint64_t v31 = &v10[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_showsSeparator];
        *uint64_t v31 = v30 != result - 1;
        id v32 = sub_100071024();
        [v32 setHidden:!*v31];
        swift_release();

        return (unint64_t)v10;
      }
      goto LABEL_34;
    }
  }
  id v24 = objc_allocWithZone((Class)UITableViewCell);

  return (unint64_t)[v24 init];
}

uint64_t sub_1000AD578(void *a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (!v4) {
    return 0;
  }
  unint64_t v7 = *(void *)(v4 + 24);
  if ((v7 & 0xC000000000000001) == 0)
  {
    if ((a2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
    {
      uint64_t v8 = *(void *)(v7 + 8 * a2 + 32);
      swift_retain();
      swift_retain();
      goto LABEL_6;
    }
    __break(1u);
LABEL_23:
    id v20 = v3;
    sub_1000BC018();
    goto LABEL_15;
  }
  swift_retain();
  uint64_t v8 = sub_1000BC018();
LABEL_6:
  uint64_t v9 = *(void *)(v8 + 16);
  unint64_t v10 = *(void *)(v8 + 24);
  swift_release();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v11
    || (NSString v12 = sub_1000BBA88(),
        unint64_t v7 = (unint64_t)[a1 dequeueReusableHeaderFooterViewWithIdentifier:v12],
        v12,
        !v7))
  {
    swift_release();
    return 0;
  }
  type metadata accessor for IMBDefaultSectionHeader();
  uint64_t result = swift_dynamicCastClass();
  a1 = (void *)result;
  if (!result)
  {

    swift_release();
    return (uint64_t)a1;
  }
  uint64_t v3 = *(void **)(result + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel);
  uint64_t v14 = *(void *)(v4 + 24);
  if ((v14 & 0xC000000000000001) != 0) {
    goto LABEL_23;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v15 = v3;
    swift_retain();
LABEL_15:
    swift_bridgeObjectRetain();
    swift_release();
    sub_1000BBB58();
    swift_bridgeObjectRelease();
    NSString v16 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    [v3 setText:v16];

    id v17 = [*(id *)(v2 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView) separatorColor];
    id v18 = (id)v7;
    id v19 = sub_10009A7B0();

    [v19 setBackgroundColor:v17];
    swift_release();

    return (uint64_t)a1;
  }
  __break(1u);
  return result;
}

void sub_1000AD864(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_1000BB3C8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005D74(&qword_1000FCC80);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v84 = (uint64_t)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v14);
  if (!v2[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType]) {
    return;
  }
  uint64_t v83 = (char *)&v68 - v15;
  uint64_t v76 = v6;
  NSString v16 = (uint64_t *)&v2[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths];
  uint64_t v17 = swift_beginAccess();
  uint64_t v18 = *v16;
  __chkstk_darwin(v17, v19);
  *(&v68 - 2) = a2;
  id v20 = a1;
  unint64_t v21 = v2;
  swift_bridgeObjectRetain();
  uint64_t v85 = sub_1000B39EC((uint64_t)sub_1000220A4, (uint64_t)(&v68 - 4), v18);
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)&v21[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest];
  uint64_t v77 = v16;
  if (!v23) {
    goto LABEL_7;
  }
  uint64_t v24 = *(void *)(v23 + 24);
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_1000BB3B8();
  if ((v24 & 0xC000000000000001) == 0)
  {
    if ((v25 & 0x8000000000000000) != 0)
    {
LABEL_58:
      __break(1u);
    }
    else if (v25 < *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v26 = *(void *)(v24 + 8 * v25 + 32);
      swift_retain();
      swift_bridgeObjectRelease();
      char v27 = *(unsigned char *)(v26 + 48);
      swift_release();
      if (v27)
      {
LABEL_7:
        swift_release();
        uint64_t v28 = *v16;
        swift_bridgeObjectRetain();
        char v29 = sub_1000AB97C(a2, v28);
        swift_bridgeObjectRelease();
        if (v29) {
          sub_1000AE1AC(a2, v20);
        }
        else {
          sub_1000ADFE4(a2, (uint64_t)v22, v20);
        }
        NSString v16 = v77;
        goto LABEL_11;
      }
      goto LABEL_14;
    }
    __break(1u);
    goto LABEL_60;
  }
  uint64_t v35 = sub_1000BC018();
  swift_bridgeObjectRelease();
  char v36 = *(unsigned char *)(v35 + 48);
  swift_unknownObjectRelease();
  if (v36) {
    goto LABEL_7;
  }
LABEL_14:
  uint64_t v37 = *v16;
  swift_bridgeObjectRetain();
  char v38 = sub_1000AB97C(a2, v37);
  swift_bridgeObjectRelease();
  if (v38)
  {
    swift_release();
    sub_1000AE1AC(a2, v20);
LABEL_11:
    BOOL v30 = *(void *)(*v16 + 16) != 0;
    uint64_t v31 = sub_10008E844();
    uint64_t v33 = v32;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(BOOL, uint64_t, uint64_t))(v33 + 48))(v30, ObjectType, v33);

    return;
  }
  uint64_t v69 = v22;
  uint64_t v39 = *(void *)(v85 + 56);
  uint64_t v74 = v85 + 56;
  uint64_t v40 = 1 << *(unsigned char *)(v85 + 32);
  uint64_t v41 = -1;
  if (v40 < 64) {
    uint64_t v41 = ~(-1 << v40);
  }
  unint64_t v42 = v41 & v39;
  int64_t v75 = (unint64_t)(v40 + 63) >> 6;
  uint64_t v43 = v76;
  uint64_t v81 = v76 + 16;
  uint64_t v82 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56);
  uint64_t v80 = v76 + 48;
  uint64_t v79 = (void (**)(char *, char *, uint64_t))(v76 + 32);
  UIAccessibilityTraits v73 = UIAccessibilityTraitStaticText;
  UIAccessibilityTraits v72 = UIAccessibilityTraitButton;
  UIAccessibilityTraits v71 = UIAccessibilityTraitNotEnabled;
  UIAccessibilityTraits v70 = UIAccessibilityTraitSelected;
  char v78 = (void (**)(char *, uint64_t))(v76 + 8);
  swift_bridgeObjectRetain();
  int64_t v44 = 0;
  while (1)
  {
    BOOL v45 = v83;
    if (v42)
    {
      unint64_t v46 = __clz(__rbit64(v42));
      v42 &= v42 - 1;
      unint64_t v47 = v46 | (v44 << 6);
      goto LABEL_39;
    }
    int64_t v48 = v44 + 1;
    if (__OFADD__(v44, 1))
    {
      __break(1u);
      goto LABEL_58;
    }
    if (v48 >= v75) {
      goto LABEL_55;
    }
    unint64_t v49 = *(void *)(v74 + 8 * v48);
    ++v44;
    if (!v49)
    {
      int64_t v44 = v48 + 1;
      if (v48 + 1 >= v75) {
        goto LABEL_55;
      }
      unint64_t v49 = *(void *)(v74 + 8 * v44);
      if (!v49)
      {
        int64_t v44 = v48 + 2;
        if (v48 + 2 >= v75) {
          goto LABEL_55;
        }
        unint64_t v49 = *(void *)(v74 + 8 * v44);
        if (!v49)
        {
          int64_t v44 = v48 + 3;
          if (v48 + 3 >= v75) {
            goto LABEL_55;
          }
          unint64_t v49 = *(void *)(v74 + 8 * v44);
          if (!v49) {
            break;
          }
        }
      }
    }
LABEL_38:
    unint64_t v42 = (v49 - 1) & v49;
    unint64_t v47 = __clz(__rbit64(v49)) + (v44 << 6);
LABEL_39:
    (*(void (**)(char *, unint64_t, uint64_t))(v43 + 16))(v83, *(void *)(v85 + 48) + *(void *)(v43 + 72) * v47, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v45, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v45, 1, v5) == 1) {
      goto LABEL_56;
    }
    (*v79)(v9, v45, v5);
    Class isa = sub_1000BB378().super.isa;
    [v20 deselectRowAtIndexPath:isa animated:1];

    swift_beginAccess();
    uint64_t v52 = v84;
    sub_1000B3430((uint64_t)v9, v84);
    sub_100022168(v52);
    swift_endAccess();
    Class v53 = sub_1000BB378().super.isa;
    id v54 = [v20 cellForRowAtIndexPath:v53];

    if (v54)
    {
      type metadata accessor for MacListPickerTableViewCell();
      uint64_t v55 = swift_dynamicCastClass();
      if (v55)
      {
        uint64_t v56 = (unsigned char *)v55;
        id v57 = v20;
        uint64_t v58 = a2;
        uint64_t v59 = OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected;
        *(unsigned char *)(v55 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 0;
        id v60 = v54;
        sub_100070BA8();
        UIAccessibilityTraits v61 = v73;
        if (v56[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton]) {
          UIAccessibilityTraits v61 = v72;
        }
        UIAccessibilityTraits v62 = v71;
        if ((v71 & ~v61) == 0) {
          UIAccessibilityTraits v62 = 0;
        }
        if (v56[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed]) {
          UIAccessibilityTraits v63 = v62;
        }
        else {
          UIAccessibilityTraits v63 = 0;
        }
        UIAccessibilityTraits v64 = v61 | v63;
        int v65 = v56[v59];
        a2 = v58;
        id v20 = v57;
        NSString v16 = v77;
        UIAccessibilityTraits v66 = v70;
        if ((v70 & ~v64) == 0) {
          UIAccessibilityTraits v66 = 0;
        }
        if (v65) {
          UIAccessibilityTraits v67 = v66;
        }
        else {
          UIAccessibilityTraits v67 = 0;
        }
        [v56 setAccessibilityTraits:v64 | v67];

        uint64_t v43 = v76;
      }
    }
    (*v78)(v9, v5);
  }
  int64_t v50 = v48 + 4;
  if (v50 >= v75)
  {
LABEL_55:
    (*v82)(v83, 1, 1, v5);
LABEL_56:
    swift_release_n();
    uint64_t v22 = v69;
    sub_1000ADFE4(a2, (uint64_t)v69, v20);
    goto LABEL_11;
  }
  unint64_t v49 = *(void *)(v74 + 8 * v50);
  if (v49)
  {
    int64_t v44 = v50;
    goto LABEL_38;
  }
  while (1)
  {
    int64_t v44 = v50 + 1;
    if (__OFADD__(v50, 1)) {
      break;
    }
    if (v44 >= v75) {
      goto LABEL_55;
    }
    unint64_t v49 = *(void *)(v74 + 8 * v44);
    ++v50;
    if (v49) {
      goto LABEL_38;
    }
  }
LABEL_60:
  __break(1u);
}

void sub_1000ADFE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1000BB3C8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  uint64_t v13 = (char *)&v18 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, a1, v5);
  swift_beginAccess();
  sub_1000AEC0C((uint64_t)v13, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
  swift_endAccess();
  Class isa = sub_1000BB378().super.isa;
  id v15 = [a3 cellForRowAtIndexPath:isa];

  if (v15)
  {
    type metadata accessor for MacListPickerTableViewCell();
    uint64_t v16 = swift_dynamicCastClass();
    if (v16)
    {
      *(unsigned char *)(v16 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 1;
      id v17 = v15;
      sub_100070BA8();
      sub_100070F94();
    }
  }
}

void sub_1000AE1AC(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100005D74(&qword_1000FCC80);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Class isa = sub_1000BB378().super.isa;
  [a2 deselectRowAtIndexPath:isa animated:1];

  swift_beginAccess();
  sub_1000B3430(a1, (uint64_t)v7);
  sub_100022168((uint64_t)v7);
  swift_endAccess();
  Class v9 = sub_1000BB378().super.isa;
  id v10 = [a2 cellForRowAtIndexPath:v9];

  if (v10)
  {
    type metadata accessor for MacListPickerTableViewCell();
    uint64_t v11 = swift_dynamicCastClass();
    if (v11)
    {
      *(unsigned char *)(v11 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 0;
      id v12 = v10;
      sub_100070BA8();
      sub_100070F94();
    }
  }
}

uint64_t sub_1000AE5AC()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_1000AE5EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MacListPickerTableViewController();
  [super dealloc];
}

uint64_t type metadata accessor for MacListPickerTableViewController()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for MacListPickerTableViewController.SelectionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000AE75CLL);
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

ValueMetadata *type metadata accessor for MacListPickerTableViewController.SelectionType()
{
  return &type metadata for MacListPickerTableViewController.SelectionType;
}

unint64_t sub_1000AE798()
{
  unint64_t result = qword_100100A18;
  if (!qword_100100A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100A18);
  }
  return result;
}

uint64_t sub_1000AE7EC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000BB3C8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000AE830(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_1000BC308();
  swift_bridgeObjectRetain();
  sub_1000BBB78();
  Swift::Int v8 = sub_1000BC358();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1000BC238() & 1) != 0)
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
      if (v19 || (sub_1000BC238() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000AF8E4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000AE9E0(void *a1, void *a2)
{
  int v3 = v2;
  uint64_t v6 = *v2;
  sub_1000BBAC8();
  sub_1000BC308();
  swift_bridgeObjectRetain();
  sub_1000BBB78();
  Swift::Int v7 = sub_1000BC358();
  swift_bridgeObjectRelease();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    *int v3 = 0x8000000000000000;
    id v24 = a2;
    sub_1000AFA80((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *int v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  uint64_t v10 = sub_1000BBAC8();
  uint64_t v12 = v11;
  if (v10 == sub_1000BBAC8() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = sub_1000BC238();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v8;
      do
      {
        unint64_t v9 = (v9 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = sub_1000BBAC8();
        uint64_t v19 = v18;
        if (v17 == sub_1000BBAC8() && v19 == v20) {
          goto LABEL_16;
        }
        char v22 = sub_1000BC238();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  uint64_t v26 = *(void **)(*(void *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  id v27 = v26;
  return 0;
}

uint64_t sub_1000AEC0C(uint64_t a1, char *a2)
{
  int v3 = v2;
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_1000AE7EC((unint64_t *)&qword_1000FD600);
  swift_bridgeObjectRetain();
  uint64_t v35 = a2;
  uint64_t v12 = sub_1000BBA58();
  uint64_t v13 = -1 << *(unsigned char *)(v11 + 32);
  unint64_t v14 = v12 & ~v13;
  uint64_t v34 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
  {
    BOOL v30 = v2;
    uint64_t v31 = a1;
    uint64_t v32 = ~v13;
    uint64_t v29 = v7;
    uint64_t v17 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v16 = v7 + 16;
    char v15 = v17;
    uint64_t v33 = *(void *)(v16 + 56);
    uint64_t v18 = (void (**)(char *, uint64_t))(v16 - 8);
    v28[1] = v16 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v19 = v11;
      unint64_t v20 = v33 * v14;
      unint64_t v21 = *(void *)(v11 + 48) + v33 * v14;
      char v22 = v15;
      v15(v10, v21, v6);
      sub_1000AE7EC((unint64_t *)&qword_1000FCC88);
      char v23 = sub_1000BBA78();
      id v24 = *v18;
      (*v18)(v10, v6);
      if (v23) {
        break;
      }
      unint64_t v14 = (v14 + 1) & v32;
      char v15 = v22;
      uint64_t v11 = v19;
      if (((*(void *)(v34 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        int v3 = v30;
        a1 = v31;
        uint64_t v7 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v24(v35, v6);
    v22(v31, *(void *)(*v30 + 48) + v20, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v15 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = v35;
    v15(v10, v35, v6);
    uint64_t v36 = *v3;
    *int v3 = 0x8000000000000000;
    sub_1000AFCB0((uint64_t)v10, v14, isUniquelyReferenced_nonNull_native);
    *int v3 = v36;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v26, v6);
    return 1;
  }
}

uint64_t sub_1000AEF08()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005D74(&qword_100100A50);
  uint64_t v3 = sub_1000BBFD8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    BOOL v30 = (void *)(v2 + 56);
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *BOOL v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1000BC308();
      sub_1000BBB78();
      uint64_t result = sub_1000BC358();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1000AF1E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005D74(&qword_100100A58);
  uint64_t v3 = sub_1000BBFD8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    BOOL v27 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v28 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28) {
          goto LABEL_33;
        }
        unint64_t v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v28) {
            goto LABEL_33;
          }
          unint64_t v15 = v29[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v28) {
              goto LABEL_33;
            }
            unint64_t v15 = v29[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v27;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v28) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v29[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      sub_1000BBAC8();
      sub_1000BC308();
      sub_1000BBB78();
      Swift::Int v18 = sub_1000BC358();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1000AF4FC()
{
  uint64_t v1 = v0;
  uint64_t v43 = sub_1000BB3C8();
  uint64_t v2 = *(void *)(v43 - 8);
  __chkstk_darwin(v43, v3);
  unint64_t v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  sub_100005D74(&qword_100100A30);
  uint64_t v6 = sub_1000BBFD8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    char v38 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    uint64_t v36 = v0;
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v40 = v2;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    uint64_t v39 = v7;
    unint64_t v15 = v42;
    uint64_t v16 = v43;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v41 = v14;
        unint64_t v19 = v18 | (v14 << 6);
      }
      else
      {
        int64_t v20 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v20 >= v37) {
          goto LABEL_33;
        }
        unint64_t v21 = v38[v20];
        int64_t v22 = v14 + 1;
        if (!v21)
        {
          int64_t v22 = v14 + 2;
          if (v14 + 2 >= v37) {
            goto LABEL_33;
          }
          unint64_t v21 = v38[v22];
          if (!v21)
          {
            int64_t v22 = v14 + 3;
            if (v14 + 3 >= v37) {
              goto LABEL_33;
            }
            unint64_t v21 = v38[v22];
            if (!v21)
            {
              uint64_t v23 = v14 + 4;
              if (v14 + 4 >= v37)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v36;
                uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
                if (v35 > 63) {
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v38 = -1 << v35;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v21 = v38[v23];
              if (!v21)
              {
                while (1)
                {
                  int64_t v22 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    goto LABEL_39;
                  }
                  if (v22 >= v37) {
                    goto LABEL_33;
                  }
                  unint64_t v21 = v38[v22];
                  ++v23;
                  if (v21) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v22 = v14 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v21 - 1) & v21;
        int64_t v41 = v22;
        unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 48);
      uint64_t v26 = *(void *)(v40 + 72);
      BOOL v27 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
      v27(v15, v25 + v26 * v19, v16);
      uint64_t v7 = v39;
      sub_1000AE7EC((unint64_t *)&qword_1000FD600);
      uint64_t result = sub_1000BBA58();
      uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v12 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v17 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v12 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(*(void *)(v7 + 48) + v17 * v26, v42, v43);
      ++*(void *)(v7 + 16);
      uint64_t v5 = v24;
      int64_t v14 = v41;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

Swift::Int sub_1000AF8E4(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_1000AEF08();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_1000AFF28();
      goto LABEL_22;
    }
    sub_1000B052C();
  }
  uint64_t v11 = *v4;
  sub_1000BC308();
  sub_1000BBB78();
  uint64_t result = sub_1000BC358();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1000BC238(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1000BC268();
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
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1000BC238();
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

uint64_t sub_1000AFA80(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_1000AF1E8();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_1000B00DC();
LABEL_22:
      uint64_t v25 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(void *)(*(void *)(v25 + 48) + 8 * a2) = v6;
      uint64_t v26 = *(void *)(v25 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        *(void *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_1000B07DC();
  }
  uint64_t v9 = *v3;
  sub_1000BBAC8();
  sub_1000BC308();
  sub_1000BBB78();
  Swift::Int v10 = sub_1000BC358();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v12 = sub_1000BBAC8();
  uint64_t v14 = v13;
  if (v12 == sub_1000BBAC8() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v17 = sub_1000BC238();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v19 = sub_1000BBAC8();
      uint64_t v21 = v20;
      if (v19 == sub_1000BBAC8() && v21 == v22) {
        goto LABEL_25;
      }
      char v24 = sub_1000BC238();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for PKContactField(0);
  uint64_t result = sub_1000BC268();
  __break(1u);
  return result;
}

uint64_t sub_1000AFCB0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v32 = a1;
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  Swift::Int v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  unint64_t v29 = v3;
  uint64_t v30 = v7;
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1000AF4FC();
  }
  else
  {
    if (v12 > v11)
    {
      sub_1000B0288();
      goto LABEL_12;
    }
    sub_1000B0ABC();
  }
  uint64_t v13 = *v3;
  sub_1000AE7EC((unint64_t *)&qword_1000FD600);
  uint64_t v14 = sub_1000BBA58();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  a2 = v14 & ~v15;
  uint64_t v31 = v13;
  uint64_t v16 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v15;
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v19 = v7 + 16;
    uint64_t v18 = v20;
    uint64_t v21 = *(void *)(v19 + 56);
    do
    {
      v18(v10, *(void *)(v31 + 48) + v21 * a2, v6);
      sub_1000AE7EC((unint64_t *)&qword_1000FCC88);
      char v22 = sub_1000BBA78();
      (*(void (**)(char *, uint64_t))(v19 - 8))(v10, v6);
      if (v22) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }
    while (((*(void *)(v16 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v23 = v30;
  uint64_t v24 = *v29;
  *(void *)(v24 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v23 + 32))(*(void *)(v24 + 48) + *(void *)(v23 + 72) * a2, v32, v6);
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (!v27)
  {
    *(void *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1000BC268();
  __break(1u);
  return result;
}

void *sub_1000AFF28()
{
  uint64_t v1 = v0;
  sub_100005D74(&qword_100100A50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000BBFC8();
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1000B00DC()
{
  uint64_t v1 = v0;
  sub_100005D74(&qword_100100A58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000BBFC8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1000B0288()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000BB3C8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005D74(&qword_100100A30);
  uint64_t v7 = *v0;
  uint64_t v8 = sub_1000BBFC8();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v9;
    return result;
  }
  uint64_t v23 = v1;
  id result = (void *)(v8 + 56);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 56 + 8 * v11) {
    id result = memmove(result, (const void *)(v7 + 56), 8 * v11);
  }
  uint64_t v24 = v7 + 56;
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 56);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v19 >= v25) {
      goto LABEL_25;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_25;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_25;
        }
        unint64_t v20 = *(void *)(v24 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(void *)(v7 + 48) + v18, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v9 + 48) + v18, v6, v2);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_25:
    id result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v25) {
      goto LABEL_25;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1000B052C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005D74(&qword_100100A50);
  uint64_t v3 = sub_1000BBFD8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1000BC308();
    swift_bridgeObjectRetain();
    sub_1000BBB78();
    uint64_t result = sub_1000BC358();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000B07DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005D74(&qword_100100A58);
  uint64_t v3 = sub_1000BBFD8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  BOOL v27 = v0;
  uint64_t v28 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v13);
    sub_1000BBAC8();
    sub_1000BC308();
    id v18 = v17;
    sub_1000BBB78();
    Swift::Int v19 = sub_1000BC358();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000B0ABC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000BB3C8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v0;
  sub_100005D74(&qword_100100A30);
  uint64_t v8 = sub_1000BBFD8();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v9;
    return result;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 56);
  uint64_t v35 = v0;
  uint64_t v36 = v7 + 56;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  int64_t v37 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v38 = v3 + 16;
  uint64_t v14 = v8 + 56;
  uint64_t v39 = v3;
  unint64_t v15 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v21 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v21);
    ++v17;
    if (!v22)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v36 + 8 * v17);
      if (!v22)
      {
        int64_t v17 = v21 + 2;
        if (v21 + 2 >= v37) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v36 + 8 * v17);
        if (!v22) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_24:
    uint64_t v24 = v7;
    uint64_t v25 = *(void *)(v7 + 48);
    uint64_t v26 = *(void *)(v39 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v39 + 16))(v6, v25 + v26 * v20, v2);
    sub_1000AE7EC((unint64_t *)&qword_1000FD600);
    uint64_t result = sub_1000BBA58();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v14 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = (*v15)(*(void *)(v9 + 48) + v18 * v26, v6, v2);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v24;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v37)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v35;
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v36 + 8 * v23);
  if (v22)
  {
    int64_t v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v17 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v17);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000B0E58(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    sub_100005D74(&qword_100100A40);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_100005D74(&qword_100100A48);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

uint64_t sub_1000B0FE4(char a1, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005D74(&qword_100100A38);
  uint64_t v10 = *(void *)(sub_100005D74(&qword_1000FDF20) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
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
  uint64_t v16 = *(void *)(sub_100005D74(&qword_1000FDF20) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
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
  int64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

uint64_t sub_1000B122C(char a1, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005D74(&qword_1000FD5E8);
  uint64_t v10 = *(void *)(sub_1000BB3C8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
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
  uint64_t v16 = *(void *)(sub_1000BB3C8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
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
  int64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

uint64_t sub_1000B146C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100005D74(&qword_1000FD618);
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

Swift::Int sub_1000B15D8(void **a1)
{
  uint64_t v2 = *(void *)(sub_1000BB3C8() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_1000B51E4(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_1000B1C74(v6);
  *a1 = v3;
  return result;
}

void *sub_1000B1680(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005D74(&qword_1000FD618);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1000B41C4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100055710();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_1000B1768(unint64_t a1)
{
  return sub_1000B1A60(a1, (void (*)(void *, uint64_t, unint64_t))sub_1000AB058);
}

void *sub_1000B1780(uint64_t a1)
{
  return sub_1000B1B80(a1, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t))sub_1000B43C4);
}

void *sub_1000B1798(unint64_t a1)
{
  return sub_1000B1A60(a1, (void (*)(void *, uint64_t, unint64_t))sub_1000AB094);
}

void *sub_1000B17B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005D74(&qword_1000FD5E8);
  uint64_t v3 = *(void *)(sub_1000BB3C8() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  Swift::Int result = (void *)j__malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      void v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_1000B45C0(&v10, (char *)v6 + v5, v1, a1);
      sub_100055710();
      if (v9 == v1) {
        return v6;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_1000B18E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005D74(&qword_1000FD5E8);
  uint64_t v3 = *(void *)(sub_1000BB3C8() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  Swift::Int result = (void *)j__malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      void v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_1000B4BFC(&v10, (char *)v6 + v5, v1, a1);
      sub_100055710();
      if (v9 == v1) {
        return v6;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_1000B1A18(unint64_t a1)
{
  return sub_1000B1A60(a1, (void (*)(void *, uint64_t, unint64_t))sub_1000AB2F4);
}

void *sub_1000B1A30(unint64_t a1)
{
  return sub_1000B1A60(a1, (void (*)(void *, uint64_t, unint64_t))sub_1000AB330);
}

void *sub_1000B1A48(unint64_t a1)
{
  return sub_1000B1A60(a1, (void (*)(void *, uint64_t, unint64_t))sub_1000AB36C);
}

void *sub_1000B1A60(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
{
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v4 <= 0)
    {
      unint64_t v5 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100005D74((uint64_t *)&unk_1000FD490);
      unint64_t v5 = (void *)swift_allocObject();
      int64_t v6 = j__malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      v5[2] = v4;
      v5[3] = (2 * (v7 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v8;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(void *, uint64_t, unint64_t))v4) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000BC0D8();
    swift_bridgeObjectRelease();
    if (!v4) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v5;
}

void *sub_1000B1B68(uint64_t a1)
{
  return sub_1000B1B80(a1, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t))sub_1000B4FE8);
}

void *sub_1000B1B80(uint64_t a1, uint64_t (*a2)(uint64_t *, void *, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005D74((uint64_t *)&unk_1000FD490);
  unint64_t v5 = (void *)swift_allocObject();
  int64_t v6 = j__malloc_size(v5);
  uint64_t v7 = v6 - 32;
  if (v6 < 32) {
    uint64_t v7 = v6 - 25;
  }
  v5[2] = v2;
  v5[3] = (2 * (v7 >> 3)) | 1;
  uint64_t v8 = a2(&v10, v5 + 4, v2, a1);
  swift_bridgeObjectRetain();
  sub_100055710();
  if (v8 != v2)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v5;
}

Swift::Int sub_1000B1C74(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000BB3C8();
  unint64_t v5 = *(void **)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  v140 = (char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  v155 = (char *)&v135 - v11;
  uint64_t v13 = __chkstk_darwin(v10, v12);
  v150 = (char *)&v135 - v14;
  __chkstk_darwin(v13, v15);
  v151 = (char *)&v135 - v16;
  Swift::Int v17 = a1[1];
  Swift::Int result = sub_1000BC208(v17);
  if (result >= v17)
  {
    if (v17 < 0) {
      goto LABEL_140;
    }
    if (v17) {
      return sub_1000B280C(0, v17, 1, a1);
    }
    return result;
  }
  if (v17 >= 0) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v17 + 1;
  }
  if (v17 < -1) {
    goto LABEL_148;
  }
  uint64_t v153 = v4;
  v154 = a1;
  Swift::Int v137 = result;
  if (v17 < 2)
  {
    int64_t v23 = (char *)_swiftEmptyArrayStorage;
    unint64_t v142 = (unint64_t)_swiftEmptyArrayStorage
         + ((*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80));
    v136 = _swiftEmptyArrayStorage;
    if (v17 != 1)
    {
      unint64_t v25 = _swiftEmptyArrayStorage[2];
LABEL_106:
      if (v25 >= 2)
      {
        uint64_t v129 = *v154;
        do
        {
          unint64_t v130 = v25 - 2;
          if (v25 < 2) {
            goto LABEL_135;
          }
          if (!v129) {
            goto LABEL_147;
          }
          uint64_t v131 = *(void *)&v23[16 * v130 + 32];
          uint64_t v132 = *(void *)&v23[16 * v25 + 24];
          sub_1000B2B18(v129 + v5[9] * v131, v129 + v5[9] * *(void *)&v23[16 * v25 + 16], v129 + v5[9] * v132, v142);
          if (v2) {
            break;
          }
          if (v132 < v131) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v23 = sub_1000B341C((uint64_t)v23);
          }
          if (v130 >= *((void *)v23 + 2)) {
            goto LABEL_137;
          }
          v133 = &v23[16 * v130 + 32];
          *(void *)v133 = v131;
          *((void *)v133 + 1) = v132;
          unint64_t v134 = *((void *)v23 + 2);
          if (v25 > v134) {
            goto LABEL_138;
          }
          memmove(&v23[16 * v25 + 16], &v23[16 * v25 + 32], 16 * (v134 - v25));
          *((void *)v23 + 2) = v134 - 1;
          unint64_t v25 = v134 - 1;
        }
        while (v134 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      v136[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v20 = v19 >> 1;
    uint64_t v21 = sub_1000BBC28();
    *(void *)(v21 + 16) = v20;
    unint64_t v22 = (*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80);
    v136 = (void *)v21;
    unint64_t v142 = v21 + v22;
  }
  Swift::Int v24 = 0;
  v148 = (void (**)(char *, uint64_t))(v5 + 1);
  v149 = v5 + 2;
  v158 = (void (**)(char *, uint64_t, uint64_t))(v5 + 4);
  int64_t v23 = (char *)_swiftEmptyArrayStorage;
  v143 = v5;
  while (1)
  {
    Swift::Int v26 = v24;
    Swift::Int v27 = v24 + 1;
    Swift::Int v141 = v24;
    if (v24 + 1 >= v17) {
      goto LABEL_37;
    }
    uint64_t v28 = v153;
    uint64_t v29 = *v154;
    uint64_t v145 = v29;
    Swift::Int v146 = v24 + 1;
    Swift::Int v157 = v143[9];
    Swift::Int v30 = v157;
    unint64_t v31 = (void (*)(char *, uint64_t, uint64_t))v143[2];
    v31(v151, v29 + v157 * v27, v153);
    uint64_t v32 = v29 + v30 * v26;
    uint64_t v33 = v150;
    v31(v150, v32, v28);
    uint64_t v34 = sub_1000AE7EC(&qword_100100A20);
    uint64_t v35 = v151;
    Swift::Int v152 = v34;
    LODWORD(v156) = sub_1000BBA68();
    Swift::Int v36 = v17;
    int64_t v37 = (void (*)(char *, uint64_t))v143[1];
    uint64_t v38 = v33;
    Swift::Int v26 = v141;
    v37(v38, v28);
    v37(v35, v28);
    Swift::Int v39 = v157;
    Swift::Int v27 = v26 + 2;
    Swift::Int v147 = v36;
    if (v26 + 2 >= v36)
    {
      Swift::Int v17 = v147;
      if ((v156 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      v138 = v23;
      uint64_t v135 = v2;
      v146 *= v157;
      uint64_t v40 = v145;
      Swift::Int v41 = v157 * v27;
      while (1)
      {
        Swift::Int v42 = v27;
        uint64_t v43 = v151;
        uint64_t v44 = v153;
        v31(v151, v40 + v41, v153);
        BOOL v45 = v150;
        v31(v150, v40 + v146, v44);
        int v46 = sub_1000BBA68();
        v37(v45, v44);
        v37(v43, v44);
        if ((v156 ^ v46)) {
          break;
        }
        Swift::Int v27 = v42 + 1;
        Swift::Int v39 = v157;
        v40 += v157;
        if (v147 == v42 + 1)
        {
          Swift::Int v17 = v147;
          Swift::Int v27 = v147;
          uint64_t v2 = v135;
          int64_t v23 = v138;
          Swift::Int v26 = v141;
          if (v156) {
            goto LABEL_25;
          }
          goto LABEL_37;
        }
      }
      uint64_t v2 = v135;
      int64_t v23 = v138;
      Swift::Int v27 = v42;
      Swift::Int v26 = v141;
      Swift::Int v17 = v147;
      Swift::Int v39 = v157;
      if ((v156 & 1) == 0) {
        goto LABEL_37;
      }
    }
LABEL_25:
    if (v27 < v26) {
      goto LABEL_141;
    }
    if (v26 >= v27)
    {
LABEL_37:
      UIAccessibilityTraits v51 = v154;
      goto LABEL_38;
    }
    v138 = v23;
    uint64_t v47 = 0;
    uint64_t v48 = v39 * (v27 - 1);
    Swift::Int v49 = v27 * v39;
    uint64_t v50 = v26 * v39;
    UIAccessibilityTraits v51 = v154;
    Swift::Int v152 = v27;
    do
    {
      if (v26 != v27 + v47 - 1)
      {
        uint64_t v53 = v145;
        if (!v145) {
          goto LABEL_146;
        }
        uint64_t v54 = v2;
        unint64_t v55 = v145 + v50;
        uint64_t v56 = (char *)(v145 + v48);
        v156 = *v158;
        v156(v140, v145 + v50, v153);
        if (v50 < v48 || v55 >= v53 + v49)
        {
          uint64_t v52 = v153;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v52 = v153;
          if (v50 != v48) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v156(v56, (uint64_t)v140, v52);
        uint64_t v2 = v54;
        UIAccessibilityTraits v51 = v154;
        Swift::Int v27 = v152;
        Swift::Int v39 = v157;
      }
      ++v26;
      --v47;
      v48 -= v39;
      v49 -= v39;
      v50 += v39;
    }
    while (v26 < v27 + v47);
    int64_t v23 = v138;
    Swift::Int v26 = v141;
    Swift::Int v17 = v147;
LABEL_38:
    uint64_t v57 = v153;
    if (v27 >= v17) {
      goto LABEL_57;
    }
    if (__OFSUB__(v27, v26)) {
      goto LABEL_139;
    }
    if (v27 - v26 >= v137) {
      goto LABEL_57;
    }
    if (__OFADD__(v26, v137)) {
      goto LABEL_142;
    }
    Swift::Int v58 = v26 + v137 >= v17 ? v17 : v26 + v137;
    if (v58 < v26) {
      break;
    }
    if (v27 != v58)
    {
      v138 = v23;
      uint64_t v135 = v2;
      uint64_t v59 = v143[9];
      v144 = (void (*)(char *, uint64_t, uint64_t))v143[2];
      uint64_t v145 = v59;
      uint64_t v60 = v59 * (v27 - 1);
      Swift::Int v61 = v27 * v59;
      Swift::Int v139 = v58;
      do
      {
        uint64_t v63 = 0;
        Swift::Int v152 = v27;
        Swift::Int v146 = v61;
        Swift::Int v147 = v60;
        while (1)
        {
          uint64_t v64 = *v51;
          v156 = (void (*)(char *, uint64_t, uint64_t))(v61 + v63);
          Swift::Int v157 = v26;
          Swift::Int v65 = v61 + v63 + v64;
          UIAccessibilityTraits v66 = v151;
          UIAccessibilityTraits v67 = v51;
          uint64_t v68 = v144;
          v144(v151, v65, v57);
          uint64_t v69 = v60 + v63 + v64;
          UIAccessibilityTraits v70 = v150;
          v68(v150, v69, v57);
          sub_1000AE7EC(&qword_100100A20);
          LOBYTE(v64) = sub_1000BBA68();
          UIAccessibilityTraits v71 = *v148;
          (*v148)(v70, v57);
          v71(v66, v57);
          if ((v64 & 1) == 0) {
            break;
          }
          uint64_t v72 = *v67;
          if (!*v67) {
            goto LABEL_144;
          }
          Swift::Int v61 = v146;
          uint64_t v60 = v147;
          UIAccessibilityTraits v73 = (char *)(v72 + v147 + v63);
          uint64_t v74 = *v158;
          uint64_t v75 = v153;
          (*v158)(v155, v72 + v146 + v63, v153);
          uint64_t v57 = v75;
          swift_arrayInitWithTakeFrontToBack();
          v74(v73, (uint64_t)v155, v75);
          v63 -= v145;
          Swift::Int v26 = v157 + 1;
          Swift::Int v62 = v152;
          UIAccessibilityTraits v51 = v154;
          if (v152 == v157 + 1) {
            goto LABEL_49;
          }
        }
        Swift::Int v62 = v152;
        uint64_t v57 = v153;
        UIAccessibilityTraits v51 = v67;
        Swift::Int v61 = v146;
        uint64_t v60 = v147;
LABEL_49:
        Swift::Int v27 = v62 + 1;
        v60 += v145;
        v61 += v145;
        Swift::Int v26 = v141;
      }
      while (v27 != v139);
      Swift::Int v27 = v139;
      uint64_t v2 = v135;
      int64_t v23 = v138;
    }
LABEL_57:
    if (v27 < v26) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v152 = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      int64_t v23 = sub_1000B3120(0, *((void *)v23 + 2) + 1, 1, v23);
    }
    unint64_t v78 = *((void *)v23 + 2);
    unint64_t v77 = *((void *)v23 + 3);
    unint64_t v25 = v78 + 1;
    if (v78 >= v77 >> 1) {
      int64_t v23 = sub_1000B3120((char *)(v77 > 1), v78 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v25;
    uint64_t v79 = v23 + 32;
    uint64_t v80 = &v23[16 * v78 + 32];
    Swift::Int v81 = v152;
    *(void *)uint64_t v80 = v26;
    *((void *)v80 + 1) = v81;
    if (v78)
    {
      while (1)
      {
        unint64_t v82 = v25 - 1;
        if (v25 >= 4)
        {
          Class v87 = &v79[16 * v25];
          uint64_t v88 = *((void *)v87 - 8);
          uint64_t v89 = *((void *)v87 - 7);
          BOOL v93 = __OFSUB__(v89, v88);
          uint64_t v90 = v89 - v88;
          if (v93) {
            goto LABEL_123;
          }
          uint64_t v92 = *((void *)v87 - 6);
          uint64_t v91 = *((void *)v87 - 5);
          BOOL v93 = __OFSUB__(v91, v92);
          uint64_t v85 = v91 - v92;
          char v86 = v93;
          if (v93) {
            goto LABEL_124;
          }
          unint64_t v94 = v25 - 2;
          v95 = &v79[16 * v25 - 32];
          uint64_t v97 = *(void *)v95;
          uint64_t v96 = *((void *)v95 + 1);
          BOOL v93 = __OFSUB__(v96, v97);
          uint64_t v98 = v96 - v97;
          if (v93) {
            goto LABEL_126;
          }
          BOOL v93 = __OFADD__(v85, v98);
          uint64_t v99 = v85 + v98;
          if (v93) {
            goto LABEL_129;
          }
          if (v99 >= v90)
          {
            v117 = &v79[16 * v82];
            uint64_t v119 = *(void *)v117;
            uint64_t v118 = *((void *)v117 + 1);
            BOOL v93 = __OFSUB__(v118, v119);
            uint64_t v120 = v118 - v119;
            if (v93) {
              goto LABEL_133;
            }
            BOOL v110 = v85 < v120;
            goto LABEL_94;
          }
        }
        else
        {
          if (v25 != 3)
          {
            uint64_t v111 = *((void *)v23 + 4);
            uint64_t v112 = *((void *)v23 + 5);
            BOOL v93 = __OFSUB__(v112, v111);
            uint64_t v104 = v112 - v111;
            char v105 = v93;
            goto LABEL_88;
          }
          uint64_t v84 = *((void *)v23 + 4);
          uint64_t v83 = *((void *)v23 + 5);
          BOOL v93 = __OFSUB__(v83, v84);
          uint64_t v85 = v83 - v84;
          char v86 = v93;
        }
        if (v86) {
          goto LABEL_125;
        }
        unint64_t v94 = v25 - 2;
        v100 = &v79[16 * v25 - 32];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v103 = __OFSUB__(v101, v102);
        uint64_t v104 = v101 - v102;
        char v105 = v103;
        if (v103) {
          goto LABEL_128;
        }
        v106 = &v79[16 * v82];
        uint64_t v108 = *(void *)v106;
        uint64_t v107 = *((void *)v106 + 1);
        BOOL v93 = __OFSUB__(v107, v108);
        uint64_t v109 = v107 - v108;
        if (v93) {
          goto LABEL_131;
        }
        if (__OFADD__(v104, v109)) {
          goto LABEL_132;
        }
        if (v104 + v109 >= v85)
        {
          BOOL v110 = v85 < v109;
LABEL_94:
          if (v110) {
            unint64_t v82 = v94;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v105) {
          goto LABEL_127;
        }
        v113 = &v79[16 * v82];
        uint64_t v115 = *(void *)v113;
        uint64_t v114 = *((void *)v113 + 1);
        BOOL v93 = __OFSUB__(v114, v115);
        uint64_t v116 = v114 - v115;
        if (v93) {
          goto LABEL_130;
        }
        if (v116 < v104) {
          goto LABEL_14;
        }
LABEL_96:
        unint64_t v121 = v82 - 1;
        if (v82 - 1 >= v25)
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
          goto LABEL_143;
        }
        if (!*v154) {
          goto LABEL_145;
        }
        v122 = v23;
        v123 = &v79[16 * v121];
        uint64_t v124 = *(void *)v123;
        v125 = &v79[16 * v82];
        uint64_t v126 = *((void *)v125 + 1);
        sub_1000B2B18(*v154 + v143[9] * *(void *)v123, *v154 + v143[9] * *(void *)v125, *v154 + v143[9] * v126, v142);
        if (v2) {
          goto LABEL_117;
        }
        if (v126 < v124) {
          goto LABEL_120;
        }
        if (v82 > *((void *)v122 + 2)) {
          goto LABEL_121;
        }
        v127 = v122;
        *(void *)v123 = v124;
        *(void *)&v79[16 * v121 + 8] = v126;
        unint64_t v128 = *((void *)v122 + 2);
        if (v82 >= v128) {
          goto LABEL_122;
        }
        int64_t v23 = v127;
        unint64_t v25 = v128 - 1;
        memmove(&v79[16 * v82], v125 + 16, 16 * (v128 - 1 - v82));
        *((void *)v23 + 2) = v128 - 1;
        if (v128 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v25 = 1;
LABEL_14:
    Swift::Int v17 = v154[1];
    Swift::Int v24 = v152;
    unint64_t v5 = v143;
    if (v152 >= v17) {
      goto LABEL_106;
    }
  }
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  Swift::Int result = sub_1000BC0A8();
  __break(1u);
  return result;
}

uint64_t sub_1000B280C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = sub_1000BB3C8();
  uint64_t v9 = __chkstk_darwin(v7, v8);
  uint64_t v44 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  uint64_t v40 = (char *)&v32 - v13;
  uint64_t result = __chkstk_darwin(v12, v14);
  Swift::Int v39 = (char *)&v32 - v17;
  uint64_t v42 = a3;
  uint64_t v33 = a2;
  if (a3 != a2)
  {
    uint64_t v19 = *(void (**)(void, void, void))(v16 + 16);
    uint64_t v18 = v16 + 16;
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v35 = (uint64_t (**)(char *, uint64_t))(v18 - 8);
    Swift::Int v36 = (void (*)(char *, uint64_t, uint64_t))v19;
    int64_t v37 = a4;
    uint64_t v38 = v18;
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    uint64_t v47 = v20 * (v42 - 1);
    uint64_t v41 = v20;
    uint64_t v46 = v20 * v42;
LABEL_5:
    uint64_t v21 = 0;
    uint64_t v45 = v34;
    while (1)
    {
      uint64_t v22 = *a4;
      uint64_t v23 = v46 + v21 + *a4;
      Swift::Int v24 = v39;
      unint64_t v25 = v36;
      v36(v39, v23, v7);
      Swift::Int v26 = v40;
      v25(v40, v47 + v21 + v22, v7);
      sub_1000AE7EC(&qword_100100A20);
      LOBYTE(v25) = sub_1000BBA68();
      Swift::Int v27 = *v35;
      (*v35)(v26, v7);
      uint64_t v28 = v24;
      a4 = v37;
      uint64_t result = v27(v28, v7);
      if ((v25 & 1) == 0)
      {
LABEL_4:
        v47 += v41;
        v46 += v41;
        if (++v42 == v33) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v29 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v30 = v29 + v47 + v21;
      unint64_t v31 = *v43;
      (*v43)(v44, v29 + v46 + v21, v7);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v31)(v30, v44, v7);
      v21 -= v41;
      if (v42 == ++v45) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1000B2B18(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_1000BB3C8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v59 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v13);
  Swift::Int v58 = (char *)v52 - v14;
  uint64_t v60 = *(void *)(v15 + 72);
  if (!v60)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v60 == -1) {
    goto LABEL_71;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v60 == -1) {
    goto LABEL_72;
  }
  uint64_t v17 = (uint64_t)(a2 - a1) / v60;
  unint64_t v63 = a1;
  unint64_t v62 = a4;
  uint64_t v18 = v16 / v60;
  if (v17 >= v16 / v60)
  {
    if ((v18 & 0x8000000000000000) == 0)
    {
      uint64_t v20 = v18 * v60;
      if (a4 < a2 || a2 + v20 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
        uint64_t v21 = v9;
      }
      else
      {
        uint64_t v21 = v9;
        if (a4 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v36 = a4 + v20;
      unint64_t v61 = a4 + v20;
      unint64_t v63 = a2;
      unint64_t v55 = a1;
      if (v20 >= 1 && a1 < a2)
      {
        unint64_t v38 = -v60;
        uint64_t v40 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
        uint64_t v39 = v21 + 16;
        v52[1] = v39 - 8;
        uint64_t v53 = v40;
        unint64_t v56 = -v60;
        uint64_t v57 = v39;
        unint64_t v54 = a4;
        uint64_t v41 = v58;
        uint64_t v42 = (void (**)(char *, uint64_t))(v39 - 8);
        do
        {
          uint64_t v60 = a3 + v38;
          uint64_t v43 = v53;
          v53(v41, v36 + v38, v8);
          unint64_t v44 = a2 + v38;
          unint64_t v45 = a3;
          uint64_t v46 = v59;
          v43(v59, v44, v8);
          sub_1000AE7EC(&qword_100100A20);
          LOBYTE(v43) = sub_1000BBA68();
          uint64_t v47 = *v42;
          (*v42)(v46, v8);
          v47(v41, v8);
          if (v43)
          {
            a3 = v60;
            if (v45 < a2 || v60 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v48 = v54;
            }
            else
            {
              unint64_t v48 = v54;
              if (v45 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            unint64_t v38 = v56;
            v63 += v56;
          }
          else
          {
            a3 = v60;
            unint64_t v49 = v61;
            v61 += v56;
            if (v45 < v49 || v60 >= v49)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v44 = a2;
              unint64_t v38 = v56;
              unint64_t v48 = v54;
            }
            else
            {
              unint64_t v48 = v54;
              if (v45 != v49) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v44 = a2;
              unint64_t v38 = v56;
            }
          }
          unint64_t v36 = v61;
          if (v61 <= v48) {
            break;
          }
          a2 = v44;
        }
        while (v44 > v55);
      }
      goto LABEL_69;
    }
  }
  else if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v19 = v17 * v60;
    if (a4 < a1 || a1 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v56 = a4 + v19;
    unint64_t v61 = a4 + v19;
    if (v19 >= 1 && a2 < a3)
    {
      uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v57 = v9 + 16;
      Swift::Int v24 = (void (**)(char *, uint64_t))(v9 + 8);
      do
      {
        unint64_t v25 = a3;
        Swift::Int v26 = v58;
        v23(v58, a2, v8);
        unint64_t v27 = a4;
        uint64_t v28 = v59;
        v23(v59, v27, v8);
        sub_1000AE7EC(&qword_100100A20);
        char v29 = sub_1000BBA68();
        uint64_t v30 = *v24;
        (*v24)(v28, v8);
        v30(v26, v8);
        unint64_t v31 = v63;
        if (v29)
        {
          unint64_t v32 = a2 + v60;
          if (v63 < a2 || v63 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v25;
          }
          else
          {
            a3 = v25;
            if (v63 == a2) {
              unint64_t v31 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        else
        {
          unint64_t v34 = v62 + v60;
          if (v63 < v62 || v63 >= v34)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v25;
          }
          else
          {
            a3 = v25;
            if (v63 != v62) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v62 = v34;
          unint64_t v32 = a2;
        }
        unint64_t v63 = v31 + v60;
        a4 = v62;
        if (v62 >= v56) {
          break;
        }
        a2 = v32;
      }
      while (v32 < a3);
    }
LABEL_69:
    sub_1000B3220(&v63, &v62, (uint64_t *)&v61);
    return 1;
  }
LABEL_73:
  uint64_t result = sub_1000BC118();
  __break(1u);
  return result;
}

char *sub_1000B3120(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005D74(&qword_100100A28);
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

uint64_t sub_1000B3220(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_1000BB3C8();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_1000BC118();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1000B3360(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_1000BC118();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_1000B341C(uint64_t a1)
{
  return sub_1000B3120(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000B3430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000BB3C8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1000AE7EC((unint64_t *)&qword_1000FD600);
  swift_bridgeObjectRetain();
  uint64_t v30 = a1;
  uint64_t v11 = sub_1000BBA58();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v29 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v25 = v2;
    uint64_t v26 = v6;
    uint64_t v27 = a2;
    uint64_t v28 = ~v12;
    int64_t v16 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v15 = v6 + 16;
    uint64_t v14 = v16;
    uint64_t v17 = *(void *)(v15 + 56);
    while (1)
    {
      v14(v9, *(void *)(v10 + 48) + v17 * v13, v5);
      sub_1000AE7EC((unint64_t *)&qword_1000FCC88);
      char v18 = sub_1000BBA78();
      (*(void (**)(char *, uint64_t))(v15 - 8))(v9, v5);
      if (v18) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v28;
      if (((*(void *)(v29 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = 1;
        uint64_t v6 = v26;
        a2 = v27;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v19, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = v25;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v20;
    uint64_t v31 = *v20;
    *uint64_t v20 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1000B0288();
      uint64_t v22 = v31;
    }
    uint64_t v6 = v26;
    a2 = v27;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v26 + 32))(v27, *(void *)(v22 + 48) + v17 * v13, v5);
    sub_1000B36E4(v13);
    *uint64_t v20 = v31;
    swift_bridgeObjectRelease();
    uint64_t v19 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v19, 1, v5);
}

uint64_t sub_1000B36E4(int64_t a1)
{
  uint64_t v3 = sub_1000BB3C8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = *v1;
  uint64_t v9 = *v1 + 56;
  uint64_t v10 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(v9 + 8 * (v11 >> 6))) != 0)
  {
    unint64_t v32 = v1;
    uint64_t v12 = ~v10;
    uint64_t v36 = result;
    swift_retain();
    uint64_t v13 = sub_1000BBF28();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v34 = (v13 + 1) & v12;
      uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v14 = v4 + 16;
      uint64_t v33 = v15;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v35 = v14;
      uint64_t v17 = (void (**)(char *, uint64_t))(v14 - 8);
      uint64_t v18 = v36;
      do
      {
        uint64_t v19 = v9;
        uint64_t v20 = v16;
        int64_t v21 = v16 * v11;
        v33(v7, *(void *)(v18 + 48) + v16 * v11, v3);
        sub_1000AE7EC((unint64_t *)&qword_1000FD600);
        uint64_t v22 = sub_1000BBA58();
        (*v17)(v7, v3);
        unint64_t v23 = v22 & v12;
        if (a1 >= (uint64_t)v34)
        {
          if (v23 < v34 || a1 < (uint64_t)v23)
          {
LABEL_4:
            uint64_t v9 = v19;
            uint64_t v16 = v20;
            uint64_t v18 = v36;
            goto LABEL_5;
          }
        }
        else if (v23 < v34 && a1 < (uint64_t)v23)
        {
          goto LABEL_4;
        }
        uint64_t v18 = v36;
        int64_t v26 = v20 * a1;
        uint64_t v9 = v19;
        if (v20 * a1 < v21
          || (uint64_t v16 = v20, *(void *)(v36 + 48) + v20 * a1 >= (unint64_t)(*(void *)(v36 + 48) + v21 + v20)))
        {
          swift_arrayInitWithTakeFrontToBack();
          goto LABEL_21;
        }
        a1 = v11;
        if (v26 != v21)
        {
          swift_arrayInitWithTakeBackToFront();
LABEL_21:
          uint64_t v18 = v36;
          uint64_t v16 = v20;
          a1 = v11;
        }
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    *(void *)(v9 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v32;
  }
  else
  {
    *(void *)(v9 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v27 = *v1;
  uint64_t v28 = *(void *)(*v1 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v27 + 16) = v30;
    ++*(_DWORD *)(v27 + 36);
  }
  return result;
}

uint64_t sub_1000B39EC(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t (*)(char *))isStackAllocationSafe;
  char v6 = *(unsigned char *)(a3 + 32);
  unint64_t v7 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, a2);
    bzero((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    uint64_t v9 = sub_1000B3B70((unint64_t *)((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a3, v5);
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    uint64_t v9 = sub_1000B3B70((unint64_t *)v10, v7, a3, v5);
    swift_release();
    swift_slowDealloc();
  }
  return v9;
}

uint64_t sub_1000B3B70(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  int64_t v37 = a4;
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v36 = sub_1000BB3C8();
  uint64_t result = __chkstk_darwin(v36, v6);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = 0;
  uint64_t v38 = a3;
  uint64_t v12 = *(void *)(a3 + 56);
  uint64_t v31 = 0;
  uint64_t v32 = a3 + 56;
  uint64_t v13 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  int64_t v33 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v34 = v8 + 16;
  uint64_t v35 = v8;
  uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v8 + 8);
  while (v15)
  {
    unint64_t v17 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    unint64_t v18 = v17 | (v11 << 6);
LABEL_17:
    uint64_t v22 = v36;
    (*(void (**)(char *, unint64_t, uint64_t))(v35 + 16))(v10, *(void *)(v38 + 48) + *(void *)(v35 + 72) * v18, v36);
    char v23 = v37(v10);
    if (v4) {
      return (*v16)(v10, v22);
    }
    char v24 = v23;
    uint64_t result = (*v16)(v10, v22);
    if (v24)
    {
      *(unint64_t *)((char *)v30 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      BOOL v19 = __OFADD__(v31++, 1);
      if (v19) {
        goto LABEL_30;
      }
    }
  }
  BOOL v19 = __OFADD__(v11++, 1);
  if (v19)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v33) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v32 + 8 * v11);
  if (v20)
  {
LABEL_16:
    unint64_t v15 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v11 << 6);
    goto LABEL_17;
  }
  int64_t v21 = v11 + 1;
  if (v11 + 1 >= v33) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v32 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v11 + 2;
  if (v11 + 2 >= v33) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v32 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v11 + 3;
  if (v11 + 3 >= v33)
  {
LABEL_27:
    uint64_t v25 = v29;
    uint64_t v26 = v31;
    uint64_t v27 = v38;
    swift_retain();
    return sub_1000B3E4C(v30, v25, v26, v27);
  }
  unint64_t v20 = *(void *)(v32 + 8 * v21);
  if (v20)
  {
LABEL_15:
    int64_t v11 = v21;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_27;
    }
    unint64_t v20 = *(void *)(v32 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000B3E4C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a1;
  uint64_t v7 = sub_1000BB3C8();
  uint64_t v38 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_100005D74(&qword_100100A30);
  uint64_t result = sub_1000BBFE8();
  uint64_t v11 = result;
  uint64_t v34 = a2;
  if (a2 < 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *v35;
  }
  uint64_t v14 = 0;
  uint64_t v15 = result + 56;
  uint64_t v36 = (uint64_t (**)(unint64_t, char *, uint64_t))(v38 + 32);
  uint64_t v37 = v38 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v14 << 6);
    }
    else
    {
      uint64_t v18 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_40;
      }
      if (v18 >= v34)
      {
LABEL_37:
        swift_release();
        return v11;
      }
      unint64_t v19 = v35[v18];
      ++v14;
      if (!v19)
      {
        uint64_t v14 = v18 + 1;
        if (v18 + 1 >= v34) {
          goto LABEL_37;
        }
        unint64_t v19 = v35[v14];
        if (!v19)
        {
          uint64_t v14 = v18 + 2;
          if (v18 + 2 >= v34) {
            goto LABEL_37;
          }
          unint64_t v19 = v35[v14];
          if (!v19)
          {
            uint64_t v20 = v18 + 3;
            if (v20 >= v34) {
              goto LABEL_37;
            }
            unint64_t v19 = v35[v20];
            if (!v19)
            {
              while (1)
              {
                uint64_t v14 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v14 >= v34) {
                  goto LABEL_37;
                }
                unint64_t v19 = v35[v14];
                ++v20;
                if (v19) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v14 = v20;
          }
        }
      }
LABEL_24:
      unint64_t v13 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
    }
    uint64_t v21 = a4;
    uint64_t v22 = *(void *)(a4 + 48);
    uint64_t v23 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v10, v22 + v23 * v17, v7);
    sub_1000AE7EC((unint64_t *)&qword_1000FD600);
    uint64_t result = sub_1000BBA58();
    uint64_t v24 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v15 + 8 * v26);
      }
      while (v31 == -1);
      unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }
    *(void *)(v15 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t result = (*v36)(*(void *)(v11 + 48) + v27 * v23, v10, v7);
    ++*(void *)(v11 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v21;
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

uint64_t sub_1000B41C4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_1000B43C4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    *uint64_t v5 = a4;
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
    *uint64_t v11 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = swift_retain();
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

uint64_t sub_1000B45C0(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100005D74(&qword_1000FCC80);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000BB3C8();
  uint64_t v43 = *(void *)(v12 - 8);
  uint64_t result = __chkstk_darwin(v12, v13);
  uint64_t v42 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a4;
  uint64_t v17 = a4 + 64;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v34 = -1 << *(unsigned char *)(a4 + 32);
  if (-v34 < 64) {
    uint64_t v18 = ~(-1 << -(char)v34);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v30 = ~v34;
    *a1 = v44;
    a1[1] = v17;
    a1[2] = v30;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v38 = a3;
  int64_t v20 = 0;
  a3 = 0;
  uint64_t v21 = v42;
  uint64_t v40 = v43 + 16;
  uint64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
  uint64_t v39 = v43 + 48;
  uint64_t v37 = (uint64_t (**)(char *, char *, uint64_t))(v43 + 32);
  uint64_t v35 = v17;
  int64_t v36 = (unint64_t)(63 - v34) >> 6;
  int64_t v32 = v36 - 1;
  uint64_t v33 = a1;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v22 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v23 = v22 | (v20 << 6);
  while (1)
  {
    uint64_t v27 = v43;
    uint64_t v28 = *(void *)(v43 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v43 + 16))(v11, *(void *)(v44 + 48) + v28 * v23, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v11, 1, v12) == 1)
    {
      uint64_t v17 = v35;
      goto LABEL_38;
    }
    ++a3;
    unint64_t v29 = *v37;
    (*v37)(v21, v11, v12);
    uint64_t result = v29(a2, v21, v12);
    if (a3 == v38)
    {
      a3 = v38;
      a1 = v33;
      uint64_t v17 = v35;
      goto LABEL_39;
    }
    a2 += v28;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    uint64_t v17 = v35;
    if (v24 >= v36) {
      goto LABEL_37;
    }
    unint64_t v25 = *(void *)(v35 + 8 * v24);
    if (!v25)
    {
      int64_t v26 = v20 + 2;
      ++v20;
      if (v24 + 1 >= v36) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v35 + 8 * v26);
      if (v25) {
        goto LABEL_14;
      }
      int64_t v20 = v24 + 1;
      if (v24 + 2 >= v36) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v35 + 8 * (v24 + 2));
      if (v25)
      {
        v24 += 2;
      }
      else
      {
        int64_t v20 = v24 + 2;
        if (v24 + 3 >= v36) {
          goto LABEL_37;
        }
        unint64_t v25 = *(void *)(v35 + 8 * (v24 + 3));
        if (!v25)
        {
          int64_t v26 = v24 + 4;
          int64_t v20 = v24 + 3;
          if (v24 + 4 < v36)
          {
            unint64_t v25 = *(void *)(v35 + 8 * v26);
            if (!v25)
            {
              while (1)
              {
                int64_t v24 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_42;
                }
                if (v24 >= v36)
                {
                  int64_t v20 = v32;
                  goto LABEL_37;
                }
                unint64_t v25 = *(void *)(v35 + 8 * v24);
                ++v26;
                if (v25) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v24 = v26;
            goto LABEL_21;
          }
LABEL_37:
          (*v41)(v11, 1, 1, v12);
          unint64_t v19 = 0;
LABEL_38:
          sub_100022168((uint64_t)v11);
          a1 = v33;
          goto LABEL_39;
        }
        v24 += 3;
      }
    }
LABEL_21:
    unint64_t v19 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v24 << 6);
    int64_t v20 = v24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_1000B49AC(void *result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v11 = 0;
    uint64_t v12 = 0;
LABEL_37:
    *uint64_t result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v12;
  }
  if (!a3)
  {
    int64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_37;
  }
  if (a3 < 0) {
    goto LABEL_39;
  }
  uint64_t v10 = a2;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
  int64_t v24 = result;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v14 = v13 | (v11 << 6);
  while (1)
  {
    ++v12;
    uint64_t v18 = (uint64_t *)(*(void *)(a4 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_100008390(*(void *)(a4 + 56) + 32 * v14, (uint64_t)&v27);
    *(void *)&long long v26 = v20;
    *((void *)&v26 + 1) = v19;
    long long v22 = v27;
    long long v21 = v28;
    long long v30 = v27;
    long long v31 = v28;
    long long v29 = v26;
    *uint64_t v10 = v26;
    v10[1] = v22;
    v10[2] = v21;
    if (v12 == a3)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = a3;
      goto LABEL_36;
    }
    v10 += 3;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v15 >= v25) {
      goto LABEL_35;
    }
    unint64_t v16 = *(void *)(v5 + 8 * v15);
    if (!v16)
    {
      int64_t v17 = v11 + 2;
      ++v11;
      if (v15 + 1 >= v25) {
        goto LABEL_35;
      }
      unint64_t v16 = *(void *)(v5 + 8 * v17);
      if (v16) {
        goto LABEL_14;
      }
      int64_t v11 = v15 + 1;
      if (v15 + 2 >= v25) {
        goto LABEL_35;
      }
      unint64_t v16 = *(void *)(v5 + 8 * (v15 + 2));
      if (v16)
      {
        v15 += 2;
      }
      else
      {
        int64_t v11 = v15 + 2;
        if (v15 + 3 >= v25) {
          goto LABEL_35;
        }
        unint64_t v16 = *(void *)(v5 + 8 * (v15 + 3));
        if (!v16)
        {
          int64_t v17 = v15 + 4;
          int64_t v11 = v15 + 3;
          if (v15 + 4 < v25)
          {
            unint64_t v16 = *(void *)(v5 + 8 * v17);
            if (!v16)
            {
              while (1)
              {
                int64_t v15 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_40;
                }
                if (v15 >= v25)
                {
                  int64_t v11 = v25 - 1;
                  goto LABEL_35;
                }
                unint64_t v16 = *(void *)(v5 + 8 * v15);
                ++v17;
                if (v16) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v15 = v17;
            goto LABEL_21;
          }
LABEL_35:
          unint64_t v8 = 0;
LABEL_36:
          uint64_t v6 = v23;
          uint64_t result = v24;
          goto LABEL_37;
        }
        v15 += 3;
      }
    }
LABEL_21:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v15 << 6);
    int64_t v11 = v15;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000B4BFC(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100005D74(&qword_1000FCC80);
  __chkstk_darwin(v8 - 8, v9);
  int64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000BB3C8();
  uint64_t v43 = *(void *)(v12 - 8);
  uint64_t result = __chkstk_darwin(v12, v13);
  uint64_t v42 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a4;
  uint64_t v17 = a4 + 56;
  uint64_t v16 = *(void *)(a4 + 56);
  uint64_t v34 = -1 << *(unsigned char *)(a4 + 32);
  if (-v34 < 64) {
    uint64_t v18 = ~(-1 << -(char)v34);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v30 = ~v34;
    *a1 = v44;
    a1[1] = v17;
    a1[2] = v30;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v38 = a3;
  int64_t v20 = 0;
  a3 = 0;
  long long v21 = v42;
  uint64_t v40 = v43 + 16;
  uint64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
  uint64_t v39 = v43 + 48;
  uint64_t v37 = (uint64_t (**)(char *, char *, uint64_t))(v43 + 32);
  uint64_t v35 = v17;
  int64_t v36 = (unint64_t)(63 - v34) >> 6;
  int64_t v32 = v36 - 1;
  uint64_t v33 = a1;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v22 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v23 = v22 | (v20 << 6);
  while (1)
  {
    uint64_t v27 = v43;
    uint64_t v28 = *(void *)(v43 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v43 + 16))(v11, *(void *)(v44 + 48) + v28 * v23, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v11, 1, v12) == 1)
    {
      uint64_t v17 = v35;
      goto LABEL_38;
    }
    ++a3;
    long long v29 = *v37;
    (*v37)(v21, v11, v12);
    uint64_t result = v29(a2, v21, v12);
    if (a3 == v38)
    {
      a3 = v38;
      a1 = v33;
      uint64_t v17 = v35;
      goto LABEL_39;
    }
    a2 += v28;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    uint64_t v17 = v35;
    if (v24 >= v36) {
      goto LABEL_37;
    }
    unint64_t v25 = *(void *)(v35 + 8 * v24);
    if (!v25)
    {
      int64_t v26 = v20 + 2;
      ++v20;
      if (v24 + 1 >= v36) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v35 + 8 * v26);
      if (v25) {
        goto LABEL_14;
      }
      int64_t v20 = v24 + 1;
      if (v24 + 2 >= v36) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v35 + 8 * (v24 + 2));
      if (v25)
      {
        v24 += 2;
      }
      else
      {
        int64_t v20 = v24 + 2;
        if (v24 + 3 >= v36) {
          goto LABEL_37;
        }
        unint64_t v25 = *(void *)(v35 + 8 * (v24 + 3));
        if (!v25)
        {
          int64_t v26 = v24 + 4;
          int64_t v20 = v24 + 3;
          if (v24 + 4 < v36)
          {
            unint64_t v25 = *(void *)(v35 + 8 * v26);
            if (!v25)
            {
              while (1)
              {
                int64_t v24 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_42;
                }
                if (v24 >= v36)
                {
                  int64_t v20 = v32;
                  goto LABEL_37;
                }
                unint64_t v25 = *(void *)(v35 + 8 * v24);
                ++v26;
                if (v25) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v24 = v26;
            goto LABEL_21;
          }
LABEL_37:
          (*v41)(v11, 1, 1, v12);
          unint64_t v19 = 0;
LABEL_38:
          sub_100022168((uint64_t)v11);
          a1 = v33;
          goto LABEL_39;
        }
        v24 += 3;
      }
    }
LABEL_21:
    unint64_t v19 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v24 << 6);
    int64_t v20 = v24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_1000B4FE8(void *result, void *a2, uint64_t a3, uint64_t a4)
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
  int64_t v11 = a2;
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
    int64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *int64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
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

uint64_t sub_1000B51E4(void *a1)
{
  return sub_1000B122C(0, a1[2], 0, a1);
}

uint64_t sub_1000B51F8(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

id sub_1000B520C(void *a1, void *a2, uint64_t a3, char *a4)
{
  v23[3] = type metadata accessor for URLHelper();
  v23[4] = (uint64_t)&off_1000E8D50;
  uint64_t v8 = sub_100034074(v23);
  sub_100046A6C(a3, (uint64_t)v8);
  *(void *)&a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation] = a1;
  *(void *)&a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message] = a2;
  sub_100041348((uint64_t)v23, (uint64_t)&a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_urlHelper]);
  v22.receiver = a4;
  v22.super_class = (Class)type metadata accessor for IMBDetailedMessageViewController();
  id v9 = a1;
  id v10 = a2;
  id v11 = [super initWithNibName:0 bundle:0];
  uint64_t v12 = qword_1000FBCB8;
  id v13 = v11;
  if (v12 != -1) {
    swift_once();
  }
  sub_1000BBCF8();
  sub_100005D74((uint64_t *)&unk_1000FCE50);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000BE090;
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  unint64_t v16 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v17 = sub_1000BBAC8();
  uint64_t v19 = v18;

  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = sub_1000074A4();
  *(void *)(v14 + 32) = v17;
  *(void *)(v14 + 40) = v19;
  *(void *)(v14 + 96) = sub_1000074F8(0, &qword_1000FBE68);
  *(void *)(v14 + 104) = sub_1000468C0();
  *(void *)(v14 + 72) = v10;
  id v20 = v10;
  sub_1000BB4A8();
  swift_bridgeObjectRelease();

  sub_10000FE60((uint64_t)v23);
  return v13;
}

id sub_1000B5424(void *a1, void *a2, uint64_t a3, char *a4)
{
  v22[3] = type metadata accessor for URLHelper();
  v22[4] = (uint64_t)&off_1000E8D50;
  uint64_t v8 = sub_100034074(v22);
  sub_100046A6C(a3, (uint64_t)v8);
  uint64_t v9 = OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView;
  id v10 = objc_allocWithZone((Class)UITableView);
  id v11 = a4;
  *(void *)&a4[v9] = [v10 initWithFrame:1 style:0.0, 0.0, 0.0, 0.0];
  uint64_t v12 = OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_nothingAvailableLabel;
  *(void *)&v11[v12] = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v11[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___tableViewHeader] = 0;
  *(void *)&v11[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___footerToolbarModel] = 0;
  id v13 = &v11[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___footerToolbarViewController];
  *(void *)id v13 = 0;
  *((void *)v13 + 1) = 0;

  sub_100041348((uint64_t)v22, (uint64_t)v20);
  uint64_t v14 = sub_100034E04((uint64_t)v20, v21);
  __chkstk_darwin(v14, v14);
  unint64_t v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v17 + 16))(v16);
  id v18 = sub_1000B520C(a1, a2, (uint64_t)v16, v11);
  sub_10000FE60((uint64_t)v20);
  sub_10000FE60((uint64_t)v22);
  return v18;
}

id sub_1000B5600(void *a1, void *a2, char a3)
{
  uint64_t v7 = type metadata accessor for URLHelper();
  uint64_t v9 = __chkstk_darwin(v7 - 8, v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v20 - v13;
  *(void *)&v3[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths] = &_swiftEmptySetSingleton;
  uint64_t v15 = v3;
  if (![a2 rootObject]) {
    goto LABEL_8;
  }
  type metadata accessor for IMBListRequest();
  uint64_t v16 = swift_dynamicCastClass();
  if (!v16)
  {
    swift_unknownObjectRelease();
LABEL_8:
    char v17 = 0;
    *(void *)&v15[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest] = 0;
    goto LABEL_10;
  }
  *(void *)&v15[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest] = v16;
  if (a3)
  {
    if (*(unsigned char *)(v16 + 16)) {
      char v17 = 2;
    }
    else {
      char v17 = 1;
    }
  }
  else
  {
    char v17 = 0;
  }
LABEL_10:
  v15[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType] = v17;

  sub_100054EF8((uint64_t)v14);
  sub_100021F3C((uint64_t)v14, (uint64_t)v11);
  id v18 = sub_1000B5424(a1, a2, (uint64_t)v11, v15);
  sub_100021FA0((uint64_t)v14);
  return v18;
}

uint64_t sub_1000B578C()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_10007DBAC(v0 + OBJC_IVAR____TtC8Business20IMBTableViewCellData_timezone);

  return swift_deallocClassInstance();
}

uint64_t sub_1000B5800()
{
  return type metadata accessor for IMBTableViewCellData();
}

uint64_t type metadata accessor for IMBTableViewCellData()
{
  uint64_t result = qword_100100A88;
  if (!qword_100100A88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000B5854()
{
  sub_10007D92C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

id sub_1000B5A80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBDetailedMessageViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for IMBDetailedMessageViewController()
{
  return self;
}

char *sub_1000B5B44(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel] = a1;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  uint64_t v3 = (char *)[v8 initWithNibName:0 bundle:0];
  uint64_t v4 = *(void *)&v3[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = *(void *)(v4 + 80);
  *(void *)(v4 + 80) = sub_1000B7624;
  *(void *)(v4 + 88) = v5;
  sub_10002A810(v6);
  return v3;
}

void sub_1000B5C44(char a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = sub_1000B692C();

    [v4 setHidden:(a1 & 1) == 0];
  }
}

void sub_1000B5CEC()
{
  v79.receiver = v0;
  v79.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  objc_super v2 = v1;
  if (qword_1000FBBF8 != -1) {
    swift_once();
  }
  [v2 setBackgroundColor:qword_100108980];

  id v3 = [v0 view];
  if (!v3) {
    goto LABEL_37;
  }
  id v4 = v3;
  id v5 = sub_1000B692C();
  [v4 addSubview:v5];

  id v6 = [v0 view];
  if (!v6)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v7 = v6;
  id v8 = sub_1000B69A4();
  [v7 addSubview:v8];

  uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel];
  unint64_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = *(void *)(v9 + 16) & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    id v12 = sub_1000B6A7C();
    swift_bridgeObjectRetain();
    NSString v13 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    [v12 setTitle:v13 forState:0];

    id v14 = sub_1000B69A4();
    id v15 = sub_1000B6A7C();
    [v14 addArrangedSubview:v15];
  }
  id v16 = [objc_allocWithZone((Class)UIView) init];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = sub_1000B69A4();
  [v17 addArrangedSubview:v16];

  unint64_t v18 = *(void *)(v9 + 72);
  uint64_t v19 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v19 = *(void *)(v9 + 64) & 0xFFFFFFFFFFFFLL;
  }
  if (v19 && sub_1000304C4() == 2)
  {
    id v20 = sub_1000B6B48();
    swift_bridgeObjectRetain();
    NSString v21 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    [v20 setTitle:v21 forState:0];

    id v22 = sub_1000B69A4();
    id v23 = sub_1000B6B48();
    [v22 addArrangedSubview:v23];
  }
  unint64_t v24 = *(void *)(v9 + 48);
  uint64_t v25 = HIBYTE(v24) & 0xF;
  if ((v24 & 0x2000000000000000) == 0) {
    uint64_t v25 = *(void *)(v9 + 40) & 0xFFFFFFFFFFFFLL;
  }
  if (v25)
  {
    id v26 = sub_1000B6B30();
    swift_bridgeObjectRetain();
    NSString v27 = sub_1000BBA88();
    swift_bridgeObjectRelease();
    [v26 setTitle:v27 forState:0];

    id v28 = sub_1000B69A4();
    id v29 = sub_1000B6B30();
    [v28 addArrangedSubview:v29];
  }
  id v30 = [self separatorColor];
  uint64_t v31 = v0;
  id v32 = sub_1000B692C();

  [v32 setBackgroundColor:v30];
  id v33 = sub_1000B692C();
  [v33 setHidden:(*(unsigned char *)(v9 + 96) & 1) == 0];

  id v34 = [v31 view];
  if (!v34) {
    goto LABEL_39;
  }
  id v35 = v34;
  uint64_t v36 = sub_1000074F8(0, (unint64_t *)&qword_1000FEB80);
  v78[3] = v36;
  v78[4] = &off_1000E9AE0;
  v78[0] = v35;
  if (qword_1000FBCF8 != -1) {
    swift_once();
  }
  double v37 = *(double *)&qword_100100BB8;
  id v38 = [v31 view];
  if (!v38) {
    goto LABEL_40;
  }
  v77[3] = v36;
  v77[4] = &off_1000E9AE0;
  v77[0] = v38;
  double v39 = *(double *)&qword_100100BB8;
  id v40 = [v31 view];
  if (!v40)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v41 = v40;
  sub_1000B7160(0, v78, v77, v40, v31, 0.0, v37, v39);

  sub_10000FE60((uint64_t)v77);
  sub_10000FE60((uint64_t)v78);
  sub_100005D74((uint64_t *)&unk_1000FD490);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_1000BF210;
  id v43 = sub_1000B69A4();
  id v44 = [v43 leadingAnchor];

  id v45 = [v31 view];
  if (!v45)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v46 = v45;
  id v47 = [v45 leadingAnchor];

  id v48 = [v44 constraintEqualToAnchor:v47 constant:*(double *)&qword_100100BB8];
  *(void *)(v42 + 32) = v48;
  id v49 = sub_1000B69A4();
  id v50 = [v49 topAnchor];

  id v51 = sub_1000B692C();
  id v52 = [v51 bottomAnchor];

  id v53 = [v50 constraintEqualToAnchor:v52 constant:*(double *)&qword_100100BB8];
  *(void *)(v42 + 40) = v53;
  id v54 = sub_1000B69A4();
  id v55 = [v54 trailingAnchor];

  id v56 = [v31 view];
  if (!v56)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v57 = v56;
  id v58 = [v56 trailingAnchor];

  id v59 = [v55 constraintEqualToAnchor:v58 constant:-*(double *)&qword_100100BB8];
  *(void *)(v42 + 48) = v59;
  id v60 = sub_1000B69A4();
  id v61 = [v60 bottomAnchor];

  id v62 = [v31 view];
  if (!v62)
  {
LABEL_44:
    __break(1u);
    return;
  }
  unint64_t v63 = v62;
  uint64_t v64 = self;
  id v65 = [v63 bottomAnchor];

  id v66 = [v61 constraintEqualToAnchor:v65 constant:-*(double *)&qword_100100BB8];
  *(void *)(v42 + 56) = v66;
  v78[0] = v42;
  sub_1000BBC08();
  sub_1000074F8(0, (unint64_t *)&qword_1000FEB90);
  Class isa = sub_1000BBBD8().super.isa;
  swift_bridgeObjectRelease();
  [v64 activateConstraints:isa];

  unint64_t v68 = *(void *)(v9 + 72);
  uint64_t v69 = *(void *)(v9 + 64) & 0xFFFFFFFFFFFFLL;
  if ((v68 & 0x2000000000000000) != 0) {
    uint64_t v69 = HIBYTE(v68) & 0xF;
  }
  if (v69 && sub_1000304C4() == 2)
  {
    unint64_t v70 = *(void *)(v9 + 48);
    uint64_t v71 = *(void *)(v9 + 40) & 0xFFFFFFFFFFFFLL;
    if ((v70 & 0x2000000000000000) != 0) {
      uint64_t v71 = HIBYTE(v70) & 0xF;
    }
    if (v71)
    {
      id v72 = sub_1000B6B48();
      id v73 = [v72 widthAnchor];

      id v74 = sub_1000B6B30();
      id v75 = [v74 widthAnchor];

      id v76 = [v73 constraintEqualToAnchor:v75];
      [v76 setActive:1];
    }
  }
}

unint64_t sub_1000B668C()
{
  id v1 = v0;
  v21.receiver = v0;
  v21.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  [super keyCommands];
  if (v2)
  {
    id v3 = v2;
    sub_1000074F8(0, &qword_100100C48);
    id v4 = (void *)sub_1000BBBE8();
  }
  else
  {
    id v4 = _swiftEmptyArrayStorage;
  }
  unint64_t v22 = (unint64_t)v4;
  id v5 = *(void **)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel];
  unint64_t v6 = v5[9];
  uint64_t v7 = v5[8] & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0) {
    uint64_t v7 = HIBYTE(v6) & 0xF;
  }
  if (v7)
  {
    if (sub_1000304C4() == 2)
    {
      id v8 = sub_1000B6B48();
      unsigned int v9 = [v8 isEnabled];

      if (v9)
      {
        sub_1000BBAC8();
        NSString v10 = sub_1000BBA88();
        swift_bridgeObjectRelease();
        id v11 = [self keyCommandWithInput:v10 modifierFlags:0 action:"dismissButtonTapped"];

        id v12 = v11;
        sub_1000BBBC8();
        if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000BBC18();
        }
        sub_1000BBC38();
        sub_1000BBC08();
      }
    }
  }
  unint64_t v13 = v5[6];
  uint64_t v14 = v5[5] & 0xFFFFFFFFFFFFLL;
  if ((v13 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(v13) & 0xF;
  }
  if (v14)
  {
    id v15 = sub_1000B6B30();
    unsigned int v16 = [v15 isEnabled];

    if (v16)
    {
      NSString v17 = sub_1000BBA88();
      id v18 = [self keyCommandWithInput:v17 modifierFlags:0 action:"rightButtonTapped"];

      id v19 = v18;
      sub_1000BBBC8();
      if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1000BBC18();
      }
      sub_1000BBC38();
      sub_1000BBC08();
    }
  }
  return v22;
}

id sub_1000B692C()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView);
  }
  else
  {
    type metadata accessor for SeparatorView();
    id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1000B69A4()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIStackView) init];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setAxis:0];
    [v4 setDistribution:0];
    [v4 setAlignment:5];
    [v4 setSpacing:12.0];
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1000B6A7C()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton);
  }
  else
  {
    type metadata accessor for MacLeftButton();
    id v4 = [(id)swift_getObjCClassFromMetadata() buttonWithType:1];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 addTarget:v0 action:"leftButtonTapped" forControlEvents:64];
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1000B6B30()
{
  return sub_1000B6B60(&OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton, &selRef_rightButtonTapped, 1);
}

id sub_1000B6B48()
{
  return sub_1000B6B60(&OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton, &selRef_dismissButtonTapped, 2);
}

id sub_1000B6B60(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  id v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    id v6 = *(id *)(v3 + *a1);
  }
  else
  {
    id v9 = [self buttonWithType:1];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 addTarget:v3 action:*a2 forControlEvents:64];
    [v9 setRole:a3];
    NSString v10 = *(void **)(v3 + v4);
    *(void *)(v3 + v4) = v9;
    id v6 = v9;

    id v5 = 0;
  }
  id v11 = v5;
  return v6;
}

id sub_1000B6E74(uint64_t a1)
{
  return sub_1000B70F4(a1, type metadata accessor for MacFooterToolbarViewController);
}

uint64_t type metadata accessor for MacFooterToolbarViewController()
{
  return self;
}

uint64_t sub_1000B6F4C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate + 8) = a2;
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

void sub_1000B6F98(char a1)
{
  id v2 = sub_1000B6A7C();
  uint64_t v3 = a1 & 1;
  [v2 setEnabled:v3];

  id v4 = sub_1000B6B30();
  [v4 setEnabled:v3];
}

id sub_1000B70D8()
{
  return sub_1000B70F4(0, type metadata accessor for MacLeftButton);
}

id sub_1000B70F4(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t type metadata accessor for MacLeftButton()
{
  return self;
}

void sub_1000B7150()
{
  qword_100100BB8 = 0x4030000000000000;
}

void sub_1000B7160(char a1, void *a2, void *a3, void *a4, void *a5, double a6, double a7, double a8)
{
  id v15 = a4;
  id v16 = a5;
  id v17 = sub_1000B692C();

  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v18 = v16;
  id v19 = sub_1000B692C();

  id v20 = [v19 heightAnchor];
  id v21 = [v18 traitCollection];
  [v21 displayScale];
  double v23 = v22;

  if (v23 <= 0.0)
  {
    id v24 = [self mainScreen];
    [v24 scale];
    double v23 = v25;

    if (v23 <= 0.0) {
      double v23 = 1.0;
    }
  }
  id v26 = [v20 constraintEqualToConstant:1.0 / v23];

  [v26 setActive:1];
  id v27 = v18;
  id v28 = sub_1000B692C();

  if (a1)
  {
    id v29 = [v28 bottomAnchor];

    uint64_t v33 = a2[3];
    uint64_t v34 = a2[4];
    sub_100007350(a2, v33);
    uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 32))(v33, v34);
  }
  else
  {
    id v29 = [v28 topAnchor];

    uint64_t v30 = a2[3];
    uint64_t v31 = a2[4];
    sub_100007350(a2, v30);
    uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 24))(v30, v31);
  }
  id v35 = (void *)v32;
  id v36 = [v29 constraintEqualToAnchor:v32 constant:a6];

  [v36 setActive:1];
  id v37 = v27;
  id v38 = sub_1000B692C();

  id v39 = [v38 leadingAnchor];
  uint64_t v40 = a3[3];
  uint64_t v41 = a3[4];
  sub_100007350(a3, v40);
  uint64_t v42 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v40, v41);
  id v43 = [v39 constraintEqualToAnchor:v42 constant:a7];

  [v43 setActive:1];
  id v44 = v37;
  id v45 = sub_1000B692C();

  id v46 = [v45 trailingAnchor];
  id v47 = [v15 trailingAnchor];
  id v48 = [v46 constraintEqualToAnchor:v47 constant:-a8];

  [v48 setActive:1];
}

void sub_1000B7538()
{
  *(void *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton] = 0;

  sub_1000BC0B8();
  __break(1u);
}

uint64_t sub_1000B75EC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000B7624(char a1)
{
}

uint64_t sub_1000B762C()
{
  uint64_t v1 = v0;
  sub_100005D74((uint64_t *)&unk_1000FD490);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000BF610;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer);
  id v4 = [v3 leadingAnchor];
  id v5 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_informationView);
  id v6 = [v5 leadingAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:4.0];

  *(void *)(v2 + 32) = v7;
  id v8 = [v3 topAnchor];
  id v9 = [v5 topAnchor];
  id v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9 constant:10.0];

  *(void *)(v2 + 40) = v10;
  id v11 = [v3 bottomAnchor];
  id v12 = [v5 bottomAnchor];
  id v13 = [v11 constraintLessThanOrEqualToAnchor:v12 constant:-10.0];

  *(void *)(v2 + 48) = v13;
  uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageView);
  id v15 = [v14 leadingAnchor];
  id v16 = [v3 trailingAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16 constant:10.0];

  *(void *)(v2 + 56) = v17;
  id v18 = [v14 trailingAnchor];
  id v19 = [v5 trailingAnchor];
  id v20 = [v18 constraintEqualToAnchor:v19];

  *(void *)(v2 + 64) = v20;
  id v21 = [v14 centerYAnchor];
  id v22 = [v5 centerYAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22];

  *(void *)(v2 + 72) = v23;
  id v24 = [v3 centerYAnchor];
  id v25 = [v5 centerYAnchor];
  id v26 = [v24 constraintEqualToAnchor:v25];

  *(void *)(v2 + 80) = v26;
  sub_1000BBC08();
  *(void *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerFirstConstraintsIconSmall) = v2;
  swift_bridgeObjectRelease();
  id v27 = [v3 leadingAnchor];
  id v28 = [v14 trailingAnchor];
  id v29 = [v27 constraintEqualToAnchor:v28 constant:10.0];

  uint64_t v30 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint;
  uint64_t v31 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint);
  *(void *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint) = v29;

  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_1000BF610;
  id v33 = [v14 centerYAnchor];
  id v34 = [v5 centerYAnchor];
  id v35 = [v33 constraintEqualToAnchor:v34];

  *(void *)(v32 + 32) = v35;
  id v36 = [v14 leadingAnchor];
  id v37 = [v5 leadingAnchor];
  id v38 = [v36 constraintEqualToAnchor:v37];

  id v39 = *(void **)(v1 + v30);
  *(void *)(v32 + 40) = v38;
  *(void *)(v32 + 48) = v39;
  id v40 = v39;
  id v41 = [v3 topAnchor];
  id v42 = [v5 topAnchor];
  id v43 = [v41 constraintGreaterThanOrEqualToAnchor:v42 constant:10.0];

  *(void *)(v32 + 56) = v43;
  id v44 = [v3 bottomAnchor];
  id v45 = [v5 bottomAnchor];
  id v46 = [v44 constraintLessThanOrEqualToAnchor:v45 constant:-10.0];

  *(void *)(v32 + 64) = v46;
  id v47 = [v3 trailingAnchor];
  id v48 = [v5 trailingAnchor];
  id v49 = [v47 constraintEqualToAnchor:v48];

  *(void *)(v32 + 72) = v49;
  id v50 = [v3 centerYAnchor];
  id v51 = [v5 centerYAnchor];
  id v52 = [v50 constraintEqualToAnchor:v51];

  *(void *)(v32 + 80) = v52;
  sub_1000BBC08();
  *(void *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewFirstConstraintsIconSmall) = v32;
  swift_bridgeObjectRelease();
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_1000BF600;
  id v54 = [v3 leadingAnchor];
  id v55 = [v5 leadingAnchor];
  id v56 = [v54 constraintEqualToAnchor:v55 constant:4.0];

  *(void *)(v53 + 32) = v56;
  id v57 = [v3 topAnchor];
  id v58 = [v5 topAnchor];
  id v59 = [v57 constraintGreaterThanOrEqualToAnchor:v58 constant:10.0];

  *(void *)(v53 + 40) = v59;
  id v60 = [v3 bottomAnchor];
  id v61 = [v5 bottomAnchor];
  id v62 = [v60 constraintLessThanOrEqualToAnchor:v61 constant:-10.0];

  *(void *)(v53 + 48) = v62;
  id v63 = [v3 trailingAnchor];
  id v64 = [v5 trailingAnchor];
  id v65 = [v63 constraintEqualToAnchor:v64];

  *(void *)(v53 + 56) = v65;
  id v66 = [v3 centerYAnchor];
  id v67 = [v5 centerYAnchor];
  id v68 = [v66 constraintEqualToAnchor:v67];

  *(void *)(v53 + 64) = v68;
  sub_1000BBC08();
  *(void *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_largeLabelContainerConstraints) = v53;

  return swift_bridgeObjectRelease();
}

void sub_1000B7ECC()
{
  [v0 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_style];
  uint64_t v2 = sub_1000BBAC8();
  uint64_t v4 = v3;
  if (v2 == sub_1000BBAC8() && v4 == v5)
  {
    id v14 = v1;
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  char v7 = sub_1000BC238();
  id v8 = v1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_12:

    return;
  }
  uint64_t v9 = sub_1000BBAC8();
  uint64_t v11 = v10;
  if (v9 == sub_1000BBAC8() && v11 == v12)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_1000BC238();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_1000B8034()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor];
  [v0 setBackgroundColor:v1];
  [v0 setLayoutMargins:0.0, 15.0, 0.0, 15.0];
  if (!UIApp)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v2 = [UIApp preferredContentSizeCategory];
  int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel];
  if (IsAccessibilityContentSizeCategory) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 3;
  }
  [*(id *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel] setNumberOfLines:v5];
  id v6 = self;
  id v7 = [v6 preferredFontForTextStyle:UIFontTextStyleCaption1];
  id v8 = [v7 fontDescriptor];
  id v9 = [v8 fontDescriptorWithSymbolicTraits:2];

  if (!v9) {
    goto LABEL_19;
  }
  id v10 = [v6 fontWithDescriptor:v9 size:0.0];

  [v4 setFont:v10];
  [v4 setLineBreakMode:4];
  uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel];
  id v12 = [v6 preferredFontForTextStyle:UIFontTextStyleCaption1];
  id v13 = [v12 fontDescriptor];
  id v14 = [v13 fontDescriptorWithSymbolicTraits:0x8000];

  if (!v14)
  {
LABEL_20:
    __break(1u);
    return;
  }
  id v15 = [v6 fontWithDescriptor:v14 size:0.0];

  [v11 setFont:v15];
  [v11 setLineBreakMode:4];
  id v16 = [self secondaryLabelColor];
  [v11 setTextColor:v16];

  [v11 setNumberOfLines:0];
  id v17 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageView];
  [v17 setContentMode:2];
  id v18 = [v17 layer];
  [v18 setMasksToBounds:1];

  id v19 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer];
  [v19 addSubview:v4];
  [v19 addSubview:v11];
  id v20 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground];
  [v20 setBackgroundColor:v1];
  uint64_t v21 = sub_1000BBAC8();
  uint64_t v23 = v22;
  if (v21 == sub_1000BBAC8() && v23 == v24)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v25 = sub_1000BC238();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) == 0)
    {
      id v26 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationView];
      [v26 addSubview:v19];
      [v26 addSubview:v17];
      id v27 = [v17 layer];
      if (qword_1000FBBE8 != -1) {
        swift_once();
      }
      [v27 setCornerRadius:*(double *)&qword_100108970];

      goto LABEL_15;
    }
  }
  id v26 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationView];
  [v26 addSubview:v19];
  [v0 addSubview:v17];
LABEL_15:
  [v0 addSubview:v20];

  [v0 addSubview:v26];
}

void sub_1000B8500()
{
  uint64_t v1 = v0;
  sub_1000B762C();
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v2 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  Swift::Int v146 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageView];
  [v146 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v147 = *(id *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationView];
  [v147 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v145 = *(id *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground];
  [v145 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [v0 widthAnchor];
  id v6 = [v5 constraintEqualToConstant:0.0];

  uint64_t v7 = OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint;
  id v8 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint];
  *(void *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint] = v6;

  id v9 = [v1 heightAnchor];
  id v10 = [v9 constraintEqualToConstant:0.0];

  uint64_t v11 = OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint;
  id v12 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint] = v10;

  LODWORD(v13) = 1148846080;
  [*(id *)&v1[v11] setPriority:v13];
  id v14 = self;
  sub_100005D74((uint64_t *)&unk_1000FD490);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1000BF200;
  id v16 = *(void **)&v1[v7];
  *(void *)(v15 + 32) = v16;
  sub_1000BBC08();
  sub_1000074F8(0, (unint64_t *)&qword_1000FEB90);
  id v17 = v16;
  Class isa = sub_1000BBBD8().super.isa;
  swift_bridgeObjectRelease();
  id v148 = v14;
  [v14 activateConstraints:isa];

  LODWORD(v19) = 1144750080;
  [v2 setContentCompressionResistancePriority:1 forAxis:v19];
  id v20 = [v3 topAnchor];
  id v21 = [v2 topAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21];

  [v22 setActive:1];
  id v23 = [v3 leftAnchor];
  id v24 = [v2 leftAnchor];
  id v25 = [v23 constraintEqualToAnchor:v24];

  [v25 setActive:1];
  id v26 = [v3 rightAnchor];
  id v27 = [v2 rightAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27];

  [v28 setActive:1];
  LODWORD(v29) = 1148846080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v29];
  id v30 = [v4 firstBaselineAnchor];
  id v31 = [v3 lastBaselineAnchor];
  id v32 = [v30 constraintEqualToSystemSpacingBelowAnchor:v31 multiplier:1.0];

  [v32 setActive:1];
  id v33 = [v4 leftAnchor];
  id v34 = [v2 leftAnchor];
  id v35 = [v33 constraintEqualToAnchor:v34];

  [v35 setActive:1];
  id v36 = [v4 rightAnchor];
  id v37 = [v2 rightAnchor];
  id v38 = [v36 constraintEqualToAnchor:v37];

  [v38 setActive:1];
  id v39 = [v4 bottomAnchor];
  id v40 = [v2 bottomAnchor];
  id v41 = [v39 constraintEqualToAnchor:v40];

  [v41 setActive:1];
  LODWORD(v42) = 1144750080;
  [v4 setContentCompressionResistancePriority:1 forAxis:v42];
  id v43 = [v4 heightAnchor];
  id v44 = [v4 font];
  if (!v44)
  {
    __break(1u);
    return;
  }
  id v45 = v44;
  [v44 lineHeight];
  double v47 = v46;

  id v48 = [v43 constraintGreaterThanOrEqualToConstant:v47];
  id v49 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint] = v48;

  int v50 = v1[OBJC_IVAR____TtC8Business13IMBBubbleView_type];
  if (v1[OBJC_IVAR____TtC8Business13IMBBubbleView_type]) {
    double v51 = -5.0;
  }
  else {
    double v51 = 1.0;
  }
  type metadata accessor for IMBActionBubbleView();
  if (!swift_dynamicCastClass() || (v50 & 1) != 0)
  {
    if (v50) {
      double v57 = -1.0;
    }
    else {
      double v57 = 5.0;
    }
    id v52 = v147;
    id v53 = [v147 rightAnchor];
    id v58 = [v1 layoutMarginsGuide];
    id v55 = [v58 rightAnchor];

    id v56 = [v53 constraintEqualToAnchor:v55 constant:v57];
  }
  else
  {
    id v52 = v147;
    id v53 = [v147 rightAnchor];
    id v54 = [v1 layoutMarginsGuide];
    id v55 = [v54 rightAnchor];

    id v56 = [v53 constraintEqualToAnchor:v55];
  }
  id v59 = v56;

  LODWORD(v60) = 1148829696;
  [v59 setPriority:v60];
  id v61 = [v52 leftAnchor];
  id v62 = [v1 layoutMarginsGuide];
  id v63 = [v62 leftAnchor];

  id v64 = [v61 constraintEqualToAnchor:v63 constant:v51];
  [v64 setActive:1];

  id v65 = [v52 bottomAnchor];
  id v66 = [v1 bottomAnchor];
  id v67 = [v65 constraintEqualToAnchor:v66];

  [v67 setActive:1];
  uint64_t v68 = swift_allocObject();
  *(_OWORD *)(v68 + 16) = xmmword_1000BF200;
  *(void *)(v68 + 32) = v59;
  sub_1000BBC08();
  id v144 = v59;
  Class v69 = sub_1000BBBD8().super.isa;
  swift_bridgeObjectRelease();
  [v148 activateConstraints:v69];

  id v70 = [v145 heightAnchor];
  id v71 = [v52 heightAnchor];
  id v72 = [v70 constraintEqualToAnchor:v71];

  [v72 setActive:1];
  id v73 = [v145 leftAnchor];
  id v74 = [v1 leftAnchor];
  id v75 = [v73 constraintEqualToAnchor:v74];

  [v75 setActive:1];
  id v76 = [v145 rightAnchor];
  id v77 = [v1 rightAnchor];
  id v78 = [v76 constraintEqualToAnchor:v77];

  [v78 setActive:1];
  id v79 = [v145 bottomAnchor];
  id v80 = [v1 bottomAnchor];
  id v81 = [v79 constraintEqualToAnchor:v80];

  [v81 setActive:1];
  uint64_t v82 = OBJC_IVAR____TtC8Business13IMBBubbleView_style;
  uint64_t v83 = sub_1000BBAC8();
  uint64_t v85 = v84;
  if (v83 == sub_1000BBAC8() && v85 == v86)
  {
    uint64_t v88 = v146;
    Class v87 = v147;
    goto LABEL_18;
  }
  char v89 = sub_1000BC238();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v88 = v146;
  Class v87 = v147;
  if (v89)
  {
LABEL_19:
    id v94 = [v87 topAnchor];
    id v95 = [v1 topAnchor];
    id v96 = [v94 constraintEqualToAnchor:v95];

    [v96 setActive:1];
    id v97 = [v88 heightAnchor];
    id v98 = [v88 widthAnchor];
    id v99 = [v97 constraintEqualToAnchor:v98 multiplier:1.0];

    [v99 setActive:1];
    goto LABEL_20;
  }
  uint64_t v90 = sub_1000BBAC8();
  uint64_t v92 = v91;
  if (v90 == sub_1000BBAC8() && v92 == v93)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  char v124 = sub_1000BC238();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v124) {
    goto LABEL_19;
  }
  id v125 = [v146 topAnchor];
  id v126 = [v1 topAnchor];
  id v127 = [v125 constraintEqualToAnchor:v126];

  [v127 setActive:1];
  id v128 = [v146 leftAnchor];
  id v129 = [v1 leftAnchor];
  id v130 = [v128 constraintEqualToAnchor:v129];

  [v130 setActive:1];
  id v131 = [v146 rightAnchor];
  id v132 = [v1 rightAnchor];
  id v133 = [v131 constraintEqualToAnchor:v132];

  [v133 setActive:1];
  id v134 = [v146 bottomAnchor];
  id v135 = [v147 topAnchor];
  id v136 = [v134 constraintEqualToAnchor:v135];

  [v136 setActive:1];
  uint64_t v137 = *(void *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_image];
  id v138 = [v146 heightAnchor];
  Swift::Int v139 = v138;
  if (v137) {
    id v140 = [v138 constraintEqualToConstant:150.0];
  }
  else {
    id v140 = [v138 constraintEqualToConstant:0.0];
  }
  id v142 = v140;

  v143 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint];
  *(void *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint] = v142;

  [*(id *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint] setActive:1];
LABEL_20:
  uint64_t v100 = sub_1000BBAC8();
  uint64_t v102 = v101;
  if (v100 == sub_1000BBAC8() && v102 == v103)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v104 = sub_1000BC238();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v104 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      Class v106 = sub_1000BBBD8().super.isa;
      swift_bridgeObjectRelease();
      [v148 activateConstraints:v106];

      v105.super.Class isa = (Class)[v88 layer];
      [(objc_class *)v105.super.isa setCornerRadius:10.0];
      goto LABEL_26;
    }
  }
  swift_bridgeObjectRetain();
  v105.super.Class isa = sub_1000BBBD8().super.isa;
  swift_bridgeObjectRelease();
  [v148 activateConstraints:v105.super.isa];
LABEL_26:

  uint64_t v107 = *(void **)&v1[v82];
  uint64_t v108 = sub_1000BBAC8();
  uint64_t v110 = v109;
  if (v108 == sub_1000BBAC8() && v110 == v111)
  {
    id v112 = v107;
    swift_bridgeObjectRelease_n();
LABEL_30:

    id v115 = [v88 widthAnchor];
    id v116 = [v115 constraintEqualToConstant:60.0];
    goto LABEL_31;
  }
  char v113 = sub_1000BC238();
  id v114 = v107;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v113) {
    goto LABEL_30;
  }
  uint64_t v120 = sub_1000BBAC8();
  uint64_t v122 = v121;
  if (v120 == sub_1000BBAC8() && v122 == v123)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_32;
  }
  char v141 = sub_1000BC238();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v141) {
    goto LABEL_32;
  }
  id v115 = [v88 widthAnchor];
  id v116 = [v115 constraintEqualToConstant:40.0];
LABEL_31:
  id v117 = v116;

  uint64_t v118 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint];
  *(void *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint] = v117;

LABEL_32:
  id v119 = *(id *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint];
  [v119 setActive:1];
}

id sub_1000B96F4()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touch];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  v1[16] = 1;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor];
  [v0 setBackgroundColor:v2];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground];

  return [v3 setBackgroundColor:v2];
}

uint64_t sub_1000B9774(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_1000BBF38();
    uint64_t v5 = v4;
    sub_1000BBF88();
    char v6 = sub_1000BBF48();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1000BAF58(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_1000BA4D8(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_1000BAF58(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_1000BA750(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
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

uint64_t sub_1000B9884()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v3 + 8))(v0, &off_1000EA318, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000B993C()
{
  if (UIApp)
  {
    id v1 = [UIApp preferredContentSizeCategory];
    int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8);
    if (IsAccessibilityContentSizeCategory)
    {
      if (v3)
      {
        swift_bridgeObjectRetain();
        NSString v4 = sub_1000BBA88();
        swift_bridgeObjectRelease();
        NSString v5 = sub_1000BBA88();
        NSString v6 = sub_1000BBA88();
        NSString v7 = [v4 stringByReplacingOccurrencesOfString:v5 withString:v6];

        if (!v7)
        {
          sub_1000BBAC8();
          NSString v7 = sub_1000BBA88();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        NSString v7 = 0;
      }
      id v8 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel);
    }
    else
    {
      id v8 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel);
      if (v3)
      {
        swift_bridgeObjectRetain();
        NSString v7 = sub_1000BBA88();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v7 = 0;
      }
    }
    [v8 setText:v7];

    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8);
    if (!v9
      || (!*(void *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title)
        ? (BOOL v10 = v9 == 0xE000000000000000)
        : (BOOL v10 = 0),
          v10 || (sub_1000BC238() & 1) != 0))
    {
      id v11 = [v8 heightAnchor];
      id v12 = [v11 constraintEqualToConstant:0.0];

      [v12 setActive:1];
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000B9BF8()
{
  uint64_t v1 = OBJC_IVAR____TtC8Business13IMBBubbleView_image;
  [*(id *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageView) setImage:*(void *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_image)];
  if (*(void *)(v0 + v1))
  {
    uint64_t v2 = sub_1000BBAC8();
    uint64_t v4 = v3;
    if (v2 == sub_1000BBAC8() && v4 == v5)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v7 = sub_1000BC238();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0)
      {
        id v8 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint);
        if (v8)
        {
          uint64_t v9 = sub_1000BBAC8();
          uint64_t v11 = v10;
          if (v9 == sub_1000BBAC8() && v11 == v12)
          {
            double v14 = 40.0;
          }
          else if (sub_1000BC238())
          {
            double v14 = 40.0;
          }
          else
          {
            double v14 = 60.0;
          }
          id v24 = v8;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          [v24 setConstant:v14];
        }
        return;
      }
    }
    id v22 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint);
    if (!v22) {
      return;
    }
    double v23 = 150.0;
  }
  else
  {
    uint64_t v15 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint);
    if (v15) {
      [v15 setConstant:1.0];
    }
    [*(id *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint) setConstant:0.0];
    uint64_t v16 = sub_1000BBAC8();
    uint64_t v18 = v17;
    if (v16 == sub_1000BBAC8() && v18 == v19)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v21 = sub_1000BC238();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0) {
        return;
      }
    }
    id v22 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint);
    double v23 = 0.0;
  }

  [v22 setConstant:v23];
}

void sub_1000B9EFC()
{
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for IMBBubbleView();
  [super layoutSubviews];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint];
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel];
  id v3 = v1;
  id v4 = [v2 text];
  if (!v4) {
    goto LABEL_7;
  }
  NSString v6 = v4;
  uint64_t v7 = sub_1000BBAC8();
  uint64_t v9 = v8;

  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0xE000000000000000;
  }
  if (v10)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  char v11 = sub_1000BC238();
  swift_bridgeObjectRelease();
  uint64_t v5 = 0;
  if ((v11 & 1) == 0)
  {
LABEL_7:
    [v2 text:v5];
    if (v12)
    {

      uint64_t v5 = 1;
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v5 = 0;
  }
LABEL_11:
  [v3 setActive:v5];
}

uint64_t sub_1000BA090(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t))
{
  sub_1000074F8(0, &qword_1000FF7F0);
  sub_10008D2B4();
  uint64_t v8 = sub_1000BBCC8();
  id v9 = a4;
  id v10 = a1;
  a5(v8);

  return swift_bridgeObjectRelease();
}

id sub_1000BA204()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBBubbleView();
  return [super dealloc];
}

uint64_t type metadata accessor for IMBBubbleView()
{
  return self;
}

uint64_t sub_1000BA450(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate + 8) = a2;
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t sub_1000BA49C()
{
  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x3B0))();
}

void sub_1000BA4D8(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_1000BBF78();
      sub_1000074F8(0, &qword_1000FF7F0);
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
  if (sub_1000BBF58() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_1000BBF68();
  sub_1000074F8(0, &qword_1000FF7F0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_1000BBE38(*(void *)(a4 + 40));
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
  char v10 = sub_1000BBE48();

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
      char v13 = sub_1000BBE48();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  double v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_1000BA750(uint64_t a1)
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

void sub_1000BA7D8()
{
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touchDelay] = 0x4000000000000000;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  unint64_t v1 = (void *)BCBubbleViewStyleIcon;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_style] = BCBubbleViewStyleIcon;
  v0[OBJC_IVAR____TtC8Business13IMBBubbleView_type] = 0;
  uint64_t v2 = OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel;
  id v3 = objc_allocWithZone((Class)UILabel);
  id v4 = v1;
  *(void *)&v0[v2] = [v3 init];
  uint64_t v5 = OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel;
  *(void *)&v0[v5] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v6 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer;
  *(void *)&v0[v6] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v7 = OBJC_IVAR____TtC8Business13IMBBubbleView_informationView;
  *(void *)&v0[v7] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v8 = OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground;
  *(void *)&v0[v8] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v9 = OBJC_IVAR____TtC8Business13IMBBubbleView_imageView;
  *(void *)&v0[v9] = [objc_allocWithZone((Class)UIImageView) init];
  uint64_t v10 = OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor;
  if (qword_1000FBBD8 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)qword_100108960;
  *(void *)&v0[v10] = qword_100108960;
  uint64_t v12 = OBJC_IVAR____TtC8Business13IMBBubbleView_highlightColor;
  uint64_t v13 = qword_1000FBBE0;
  id v14 = v11;
  if (v13 != -1) {
    swift_once();
  }
  id v15 = (void *)qword_100108968;
  *(void *)&v0[v12] = qword_100108968;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelWidthConstraint] = 0;
  uint64_t v16 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touch];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  v16[16] = 1;
  uint64_t v17 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touchTimestamp];
  *(void *)uint64_t v17 = 0;
  v17[8] = 1;
  v0[OBJC_IVAR____TtC8Business13IMBBubbleView_useAlternateTapTarget] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerFirstConstraintsIconSmall] = _swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewFirstConstraintsIconSmall] = _swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_largeLabelContainerConstraints] = _swiftEmptyArrayStorage;
  uint64_t v18 = OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewSpacingConstraint;
  id v19 = objc_allocWithZone((Class)NSLayoutConstraint);
  id v20 = v15;
  *(void *)&v0[v18] = [v19 init];
  uint64_t v21 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerWidthConstraint;
  *(void *)&v0[v21] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  uint64_t v22 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint;
  *(void *)&v0[v22] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  uint64_t v23 = OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabelWidthConstraint;
  *(void *)&v0[v23] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  uint64_t v24 = OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelWidthConstraint;
  *(void *)&v0[v24] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  uint64_t v25 = OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint;
  *(void *)&v0[v25] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  uint64_t v26 = OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint;
  *(void *)&v0[v26] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  uint64_t v27 = OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint;
  *(void *)&v0[v27] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  id v28 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_title];
  void *v28 = 0;
  v28[1] = 0;
  double v29 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitle];
  *double v29 = 0;
  v29[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_image] = 0;

  sub_1000BC0B8();
  __break(1u);
}

id sub_1000BAB7C()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1000B9774(v1);
  swift_bridgeObjectRelease();
  if (v2)
  {
    id v3 = [v0 window];
    [v2 locationInView:v3];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touch];
  *(void *)uint64_t v8 = v5;
  *((void *)v8 + 1) = v7;
  v8[16] = v2 == 0;
  uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_highlightColor];
  [v0 setBackgroundColor:v9];
  uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground];

  return [v10 setBackgroundColor:v9];
}

void sub_1000BAC70()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  id v25 = (id)sub_1000B9774(v2);
  swift_bridgeObjectRelease();
  if (v25)
  {
    uint64_t Strong = (uint64_t)[v25 tapCount];
    if (!Strong) {
      goto LABEL_16;
    }
    uint64_t v4 = (double *)((char *)v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_touchTimestamp);
    if ((*((unsigned char *)v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_touchTimestamp + 8) & 1) == 0)
    {
      double v5 = *v4 + 2.0;
      uint64_t Strong = (uint64_t)[v25 timestamp];
      if (v6 < v5) {
        goto LABEL_16;
      }
    }
    uint64_t Strong = (uint64_t)[v25 timestamp];
    *(void *)uint64_t v4 = v7;
    *((unsigned char *)v4 + 8) = 0;
    uint64_t v8 = (double *)((char *)v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_touch);
    if (*((unsigned char *)v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_touch + 16) == 1) {
      goto LABEL_16;
    }
    double v10 = *v8;
    double v9 = v8[1];
    id v11 = [v1 window];
    [v25 locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    double v16 = sqrt((v10 - v13) * (v10 - v13) + (v9 - v15) * (v9 - v15));
    uint64_t Strong = (uint64_t)[v25 locationInView:v1];
    if (*((unsigned char *)v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_useAlternateTapTarget) == 1)
    {
      CGFloat v19 = v17;
      CGFloat v20 = v18;
      [*(id *)((char *)v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground) frame];
      v27.x = v19;
      v27.y = v20;
      uint64_t Strong = CGRectContainsPoint(v28, v27);
      if (v16 < 15.0)
      {
        if ((Strong & 1) == 0)
        {
          uint64_t v21 = (char *)v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate;
          uint64_t Strong = swift_unknownObjectWeakLoadStrong();
          if (Strong)
          {
            uint64_t v22 = *((void *)v21 + 1);
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t))(v22 + 16))(v1, &off_1000EA318, ObjectType, v22);
            uint64_t Strong = swift_unknownObjectRelease();
          }
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    else if (v16 < 15.0)
    {
LABEL_15:
      uint64_t Strong = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x3B8))();
    }
LABEL_16:
    (*(void (**)(uint64_t))((swift_isaMask & *v1) + 0x3A8))(Strong);

    return;
  }
  uint64_t v24 = *(void (**)(void))((swift_isaMask & *v0) + 0x3A8);

  v24();
}

uint64_t sub_1000BAF58(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

Class sub_1000BAF88()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_1000BAF98()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BAFA8()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t sub_1000BAFB8()
{
  return URLRequest.url.getter();
}

uint64_t sub_1000BAFC8()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_1000BAFD8()
{
  return static CharacterSet.controlCharacters.getter();
}

uint64_t sub_1000BAFE8()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_1000BAFF8()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000BB008()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_1000BB018()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_1000BB028()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_1000BB038()
{
  return URLComponents.url.getter();
}

uint64_t sub_1000BB048()
{
  return URLComponents.init()();
}

uint64_t sub_1000BB058()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_1000BB068(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000BB078()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000BB088()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000BB098()
{
  return URL.absoluteString.getter();
}

uint64_t sub_1000BB0A8()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_1000BB0B8()
{
  return URL.lastPathComponent.getter();
}

void sub_1000BB0C8(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000BB0D8()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000BB0E8()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_1000BB0F8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB108()
{
  return URL.path.getter();
}

uint64_t sub_1000BB118()
{
  return URL.scheme.getter();
}

uint64_t sub_1000BB128()
{
  return URL.init(string:)();
}

uint64_t sub_1000BB138()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000BB148()
{
  return Data.base64EncodedData(options:)();
}

uint64_t sub_1000BB158()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_1000BB168()
{
  return Data.init(base64Encoded:options:)();
}

NSData sub_1000BB178()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000BB188()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB198()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_1000BB1A8()
{
  return Date.debugDescription.getter();
}

uint64_t sub_1000BB1B8()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_1000BB1C8()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000BB1D8()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_1000BB1E8()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_1000BB1F8()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_1000BB208()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB218()
{
  return Date.compare(_:)();
}

uint64_t sub_1000BB228()
{
  return Date.init()();
}

uint64_t sub_1000BB238()
{
  return type metadata accessor for Date();
}

NSUUID sub_1000BB248()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_1000BB258()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB268()
{
  return type metadata accessor for UUID();
}

NSLocale sub_1000BB278()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_1000BB288()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000BB298()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_1000BB2A8()
{
  return Calendar.init(identifier:)();
}

NSCalendar sub_1000BB2B8()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_1000BB2C8()
{
  return Calendar.locale.getter();
}

uint64_t sub_1000BB2D8()
{
  return static Calendar.current.getter();
}

uint64_t sub_1000BB2E8()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_1000BB2F8()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_1000BB308()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_1000BB318()
{
  return TimeZone.init(abbreviation:)();
}

uint64_t sub_1000BB328()
{
  return TimeZone.init(secondsFromGMT:)();
}

NSTimeZone sub_1000BB338()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_1000BB348()
{
  return static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB358()
{
  return static TimeZone.current.getter();
}

uint64_t sub_1000BB368()
{
  return type metadata accessor for TimeZone();
}

NSIndexPath sub_1000BB378()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_1000BB388()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB398()
{
  return IndexPath.init(row:section:)();
}

uint64_t sub_1000BB3A8()
{
  return IndexPath.row.getter();
}

uint64_t sub_1000BB3B8()
{
  return IndexPath.section.getter();
}

uint64_t sub_1000BB3C8()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_1000BB3D8()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_1000BB3E8()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_1000BB3F8()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_1000BB408()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_1000BB428()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000BB438()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000BB448()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB458()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_1000BB468()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_1000BB478()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000BB488()
{
  return static DictionarySerialization.decode(_:from:)();
}

uint64_t sub_1000BB498()
{
  return static DictionarySerialization.encode(_:)();
}

uint64_t sub_1000BB4A8()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000BB4B8()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000BB4C8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000BB4D8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000BB4E8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000BB4F8()
{
  return static _UIKitNumericRawRepresentable.+ infix(_:_:)();
}

uint64_t sub_1000BB508()
{
  return static _UIKitNumericRawRepresentable.- infix(_:_:)();
}

uint64_t sub_1000BB518()
{
  return UICellConfigurationState.isSelected.getter();
}

uint64_t sub_1000BB528()
{
  return static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BB538()
{
  return UICellConfigurationState.isFocused.setter();
}

uint64_t sub_1000BB548()
{
  return type metadata accessor for UICellConfigurationState();
}

uint64_t sub_1000BB558()
{
  return UIBackgroundConfiguration.cornerRadius.setter();
}

uint64_t sub_1000BB568()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_1000BB578()
{
  return static UIBackgroundConfiguration.listSidebarCell()();
}

uint64_t sub_1000BB588()
{
  return UIBackgroundConfiguration.updated(for:)();
}

uint64_t sub_1000BB598()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t sub_1000BB5A8()
{
  return static UIListContentConfiguration.sidebarCell()();
}

UIColor sub_1000BB5B8()
{
  return UIListContentConfiguration.TextProperties.resolvedColor()();
}

uint64_t sub_1000BB5C8()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t sub_1000BB5D8()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties();
}

uint64_t sub_1000BB5E8()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t sub_1000BB5F8()
{
  return UIListContentConfiguration.textProperties.getter();
}

uint64_t sub_1000BB608()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t sub_1000BB618()
{
  return UIListContentConfiguration.secondaryTextProperties.getter();
}

uint64_t sub_1000BB628()
{
  return UIListContentConfiguration.updated(for:)();
}

uint64_t sub_1000BB638()
{
  return type metadata accessor for UIListContentConfiguration();
}

void sub_1000BB648()
{
}

uint64_t sub_1000BB658()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_1000BB668()
{
  return Published.init(initialValue:)();
}

uint64_t sub_1000BB678()
{
  return Published.projectedValue.getter();
}

uint64_t sub_1000BB688()
{
  return static Published.subscript.getter();
}

uint64_t sub_1000BB698()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000BB6A8()
{
  return type metadata accessor for Published();
}

uint64_t sub_1000BB6B8()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_1000BB6C8()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_1000BB6D8()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_1000BB6E8()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000BB6F8()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000BB708()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000BB718()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1000BB728()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000BB738()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_1000BB748()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_1000BB758()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000BB768()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1000BB778()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000BB788()
{
  return IconOnlyLabelStyle.init()();
}

uint64_t sub_1000BB798()
{
  return type metadata accessor for IconOnlyLabelStyle();
}

uint64_t sub_1000BB7A8()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000BB7B8()
{
  return TitleOnlyLabelStyle.init()();
}

uint64_t sub_1000BB7C8()
{
  return type metadata accessor for TitleOnlyLabelStyle();
}

uint64_t sub_1000BB7D8()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1000BB7E8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000BB7F8()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000BB808()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000BB818()
{
  return static Font.subheadline.getter();
}

uint64_t sub_1000BB828()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000BB838()
{
  return Font.weight(_:)();
}

uint64_t sub_1000BB848()
{
  return Font.init(_:)();
}

uint64_t sub_1000BB858()
{
  return Menu.init(content:label:)();
}

uint64_t sub_1000BB868()
{
  return Text.font(_:)();
}

uint64_t sub_1000BB878()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000BB888()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000BB898()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000BB8A8()
{
  return View.background<A>(_:ignoresSafeAreaEdges:)();
}

uint64_t sub_1000BB8B8()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_1000BB8C8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000BB8D8()
{
  return static Color.primary.getter();
}

uint64_t sub_1000BB8E8()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000BB8F8()
{
  return Color.init(_:bundle:)();
}

uint64_t sub_1000BB908()
{
  return Color.init(_:)();
}

uint64_t sub_1000BB918()
{
  return Color.init<A>(_:)();
}

uint64_t sub_1000BB928()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000BB938()
{
  return Label.init(title:icon:)();
}

uint64_t sub_1000BB948()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_1000BB958()
{
  return Button.init(action:label:)();
}

uint64_t sub_1000BB968()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_1000BB978()
{
  return type metadata accessor for HStack();
}

uint64_t sub_1000BB988()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000BB998()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t sub_1000BB9A8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000BB9B8()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_1000BB9C8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000BB9D8()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000BB9E8()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000BB9F8()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000BBA08()
{
  return + infix(_:_:)();
}

NSDictionary sub_1000BBA18()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000BBA28()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BBA38()
{
  return Dictionary.description.getter();
}

uint64_t sub_1000BBA48()
{
  return Dictionary.debugDescription.getter();
}

uint64_t sub_1000BBA58()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000BBA68()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_1000BBA78()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1000BBA88()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000BBA98()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_1000BBAA8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000BBAB8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000BBAC8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BBAD8()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_1000BBAE8()
{
  return String.init(data:encoding:)();
}

uint64_t sub_1000BBAF8()
{
  return String.init(format:_:)();
}

uint64_t sub_1000BBB08()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000BBB18()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000BBB28()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000BBB38()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_1000BBB48()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_1000BBB58()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_1000BBB68()
{
  return String.utf8CString.getter();
}

uint64_t sub_1000BBB78()
{
  return String.hash(into:)();
}

void sub_1000BBB88(Swift::String a1)
{
}

uint64_t sub_1000BBB98()
{
  return String.init<A>(_:)();
}

uint64_t sub_1000BBBA8()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1000BBBB8()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1000BBBC8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000BBBD8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000BBBE8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BBBF8()
{
  return Array.description.getter();
}

uint64_t sub_1000BBC08()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000BBC18()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000BBC28()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000BBC38()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_1000BBC48()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_1000BBC78()
{
  return static Float._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000BBC88()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000BBC98()
{
  return static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

NSSet sub_1000BBCB8()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1000BBCC8()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000BBCD8()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_1000BBCE8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000BBCF8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000BBD08()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000BBD18()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000BBD28()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000BBD38()
{
  return UITableViewCell.backgroundConfiguration.setter();
}

uint64_t sub_1000BBD48()
{
  return CKQueryOperation.queryResultBlock.setter();
}

uint64_t sub_1000BBD58()
{
  return CKQueryOperation.recordMatchedBlock.setter();
}

uint64_t sub_1000BBD68()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_1000BBD78()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_1000BBD88()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_1000BBD98()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000BBDA8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000BBDB8()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000BBDC8()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_1000BBDD8()
{
  return CGSize.debugDescription.getter();
}

UIMenu sub_1000BBDE8(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

CKQuery sub_1000BBDF8(Swift::String recordType, NSPredicate *predicate)
{
  return CKQuery.init(recordType:predicate:)(recordType, predicate);
}

UIColor sub_1000BBE08(Swift::Float _colorLiteralRed, Swift::Float green, Swift::Float blue, Swift::Float alpha)
{
  return UIColor.init(_colorLiteralRed:green:blue:alpha:)(_colorLiteralRed, green, blue, alpha);
}

UIImage sub_1000BBE18(Swift::String imageLiteralResourceName)
{
  return UIImage.init(imageLiteralResourceName:)(imageLiteralResourceName);
}

uint64_t sub_1000BBE28()
{
  return CKRecord.subscript.getter();
}

Swift::Int sub_1000BBE38(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000BBE48()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000BBE58()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_1000BBE68()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_1000BBE78()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_1000BBE88()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_1000BBE98()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000BBEA8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000BBEB8()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_1000BBEC8()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_1000BBED8()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t sub_1000BBEE8()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_1000BBEF8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000BBF18()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000BBF28()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000BBF38()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_1000BBF48()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_1000BBF58()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_1000BBF68()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_1000BBF78()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_1000BBF88()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int sub_1000BBF98(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000BBFA8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000BBFB8()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000BBFC8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000BBFD8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000BBFE8()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000BBFF8(Swift::Int a1)
{
}

uint64_t sub_1000BC008()
{
  return Identifiable<>.id.getter();
}

uint64_t sub_1000BC018()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000BC028()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000BC038()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_1000BC048()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_1000BC058()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000BC068()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000BC078()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000BC088()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000BC098()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000BC0A8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000BC0B8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000BC0C8()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_1000BC0D8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000BC0E8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000BC0F8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000BC108()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000BC118()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000BC128()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int sub_1000BC138(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000BC148()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000BC158()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_1000BC168()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1000BC178()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1000BC188()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000BC198()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000BC1A8()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_1000BC1B8()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000BC1C8()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_1000BC1D8()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000BC1E8()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_1000BC208(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000BC218()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000BC228()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000BC238()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000BC248()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1000BC258()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_1000BC268()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000BC278()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000BC288()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000BC298()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000BC2A8()
{
  return Error._code.getter();
}

uint64_t sub_1000BC2B8()
{
  return Error._domain.getter();
}

uint64_t sub_1000BC2C8()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000BC2D8()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_1000BC308()
{
  return Hasher.init(_seed:)();
}

void sub_1000BC318(Swift::UInt a1)
{
}

void sub_1000BC328(Swift::UInt8 a1)
{
}

void sub_1000BC338(Swift::UInt32 a1)
{
}

void sub_1000BC348(Swift::UInt64 a1)
{
}

Swift::Int sub_1000BC358()
{
  return Hasher._finalize()();
}

uint64_t sub_1000BC368()
{
  return type metadata accessor for Mirror.DisplayStyle();
}

uint64_t sub_1000BC378()
{
  return type metadata accessor for Mirror.AncestorRepresentation();
}

uint64_t sub_1000BC388()
{
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

uint64_t sub_1000BC398()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000BC3A8()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return _CGColorCreateCopyWithAlpha(color, alpha);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromServerSideAuthStatus()
{
  return _NSStringFromServerSideAuthStatus();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return _SCNetworkReachabilityCreateWithName(allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

void UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo)
{
}

void UIGraphicsBeginPDFPage(void)
{
}

void UIGraphicsEndPDFContext(void)
{
}

CGRect UIGraphicsGetPDFContextBounds(void)
{
  return _UIGraphicsGetPDFContextBounds();
}

uint64_t _BSIsInternalInstall()
{
  return __BSIsInternalInstall();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection()
{
  return __UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection();
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return __UIContentSizeCategoryIsAccessibilityContentSizeCategory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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
  return [super a2];
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout()
{
  return _swift_getTupleTypeLayout();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return _swift_initEnumMetadataSingleCase();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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