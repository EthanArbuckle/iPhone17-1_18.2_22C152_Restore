uint64_t sub_10000570C()
{
  uint64_t v0;

  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_10000571C()
{
  _s51HealthMedicationsNotificationContentExtensionBundleCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100010B20 = (uint64_t)result;
  return result;
}

uint64_t LocalizationSource.table.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_1000057AC()
{
  if (qword_100010B10 != -1) {
    swift_once();
  }
  v0 = (void *)qword_100010B20;
  static LocalizationSource.healthMedicationsNotification = qword_100010B20;
  unk_100010B30 = 0x617A696C61636F4CLL;
  qword_100010B38 = 0xEB00000000656C62;

  return v0;
}

uint64_t *LocalizationSource.healthMedicationsNotification.unsafeMutableAddressor()
{
  if (qword_100010B18 != -1) {
    swift_once();
  }
  return &static LocalizationSource.healthMedicationsNotification;
}

uint64_t static LocalizationSource.healthMedicationsNotification.getter()
{
  if (qword_100010B18 != -1) {
    swift_once();
  }
  uint64_t v0 = static LocalizationSource.healthMedicationsNotification;
  id v1 = (id)static LocalizationSource.healthMedicationsNotification;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t localized(_:locale:source:value:comment:_:)(Swift::String a1, uint64_t a2, objc_class *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v14._countAndFlagsBits = a9;
  v15.value._countAndFlagsBits = a4;
  v15.value._object = a5;
  v11.super.isa = a3;
  v16._countAndFlagsBits = a6;
  v16._object = a7;
  uint64_t result = sub_10000A258(a1, v15, v11, v16, v14);
  if (*(void *)(a10 + 16))
  {
    uint64_t v13 = sub_10000A3B8();
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t _s51HealthMedicationsNotificationContentExtensionBundleCMa()
{
  return self;
}

uint64_t destroy for LocalizationSource(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s45HealthMedicationsNotificationContentExtension18LocalizationSourceVwCP_0(void *a1, uint64_t a2)
{
  v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LocalizationSource(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LocalizationSource(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LocalizationSource(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalizationSource(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalizationSource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizationSource()
{
  return &type metadata for LocalizationSource;
}

id sub_100005B90()
{
  uint64_t v1 = OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___dateFormatter;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___dateFormatter);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___dateFormatter);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
    [v4 setTimeStyle:1];
    [v4 setDateStyle:0];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100005C2C(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___dateFormatter] = 0;
  id v6 = self;
  v7 = v3;
  unsigned int v8 = objc_msgSend(v6, "hk_currentDeviceHas4InchScreen");
  double v9 = 16.0;
  if (v8) {
    double v9 = 8.0;
  }
  *(double *)&v7[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController_margin] = v9;
  *(void *)&v7[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabel] = 0;
  *(void *)&v7[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabelStackView] = 0;
  id v10 = [objc_allocWithZone((Class)HKHealthStore) init];
  sub_10000A358();
  swift_allocObject();
  id v11 = v10;
  *(void *)&v7[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController_scheduleItemDataSource] = sub_10000A348();
  sub_10000A328();
  id v12 = v11;
  *(void *)&v7[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController_medicationDataSource] = sub_10000A318();

  if (a2)
  {
    NSString v13 = sub_10000A398();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for NotificationViewController();
  id v14 = objc_msgSendSuper2(&v16, "initWithNibName:bundle:", v13, a3);

  return v14;
}

id sub_100005E34()
{
  uint64_t v1 = OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabel;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabel);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabel);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    sub_100009DFC(0, &qword_100010AA8);
    id v6 = (void *)sub_10000A498();
    [v5 setFont:v6];

    [v5 setAdjustsFontForContentSizeCategory:1];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_100005F50()
{
  uint64_t v1 = OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabelStackView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabelStackView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabelStackView);
  }
  else
  {
    uint64_t v4 = v0;
    sub_100009DB0(0, &qword_100010A38, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_10000A960;
    *(void *)(v5 + 32) = sub_100005E34();
    sub_10000A3F8();
    id v6 = objc_allocWithZone((Class)UIStackView);
    sub_100009DFC(0, &qword_100010A98);
    Class isa = sub_10000A3E8().super.isa;
    swift_bridgeObjectRelease();
    id v8 = [v6 initWithArrangedSubviews:isa];

    [v8 setAxis:0];
    [v8 setAlignment:3];
    [v8 setDistribution:0];
    [v8 setSpacing:0.0];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v9 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v8;
    id v3 = v8;

    uint64_t v2 = 0;
  }
  id v10 = v2;
  return v3;
}

void sub_1000060E4(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v55 = a2;
  sub_100009954(0, &qword_100010A80, (void (*)(uint64_t))&type metadata accessor for MedicationVisualizationConfig);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v54 - v4;
  sub_100009954(0, &qword_100010A88, (void (*)(uint64_t))&type metadata accessor for Locale);
  __chkstk_darwin();
  v7 = (char *)&v54 - v6;
  id v8 = sub_100005B90();
  Class isa = sub_10000A268().super.isa;
  id v10 = [v8 stringFromDate:isa];

  uint64_t v11 = sub_10000A3A8();
  uint64_t v13 = v12;

  id v14 = sub_100005E34();
  uint64_t v15 = sub_10000A298();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
  if (qword_100010B18 != -1) {
    swift_once();
  }
  objc_super v16 = (objc_class *)static LocalizationSource.healthMedicationsNotification;
  Swift::String_optional v17 = (Swift::String_optional)xmmword_100010B30;
  sub_10000938C();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10000A970;
  *(void *)(v18 + 56) = &type metadata for String;
  *(void *)(v18 + 64) = sub_10000942C();
  *(void *)(v18 + 32) = v11;
  *(void *)(v18 + 40) = v13;
  v53._countAndFlagsBits = 0xE000000000000000;
  v65._object = (void *)0x800000010000AE90;
  v65._countAndFlagsBits = 0xD00000000000002CLL;
  v19.super.Class isa = v16;
  v66._countAndFlagsBits = 0;
  v66._object = (void *)0xE000000000000000;
  sub_10000A258(v65, v17, v19, v66, v53);
  sub_10000A3B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000099A8((uint64_t)v7, &qword_100010A88, (void (*)(uint64_t))&type metadata accessor for Locale);
  NSString v20 = sub_10000A398();
  swift_bridgeObjectRelease();
  [v14 setText:v20];

  sub_100009DB0(0, &qword_100010A38, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_10000A960;
  *(void *)(v21 + 32) = sub_100005F50();
  *(void *)&v63[0] = v21;
  sub_10000A3F8();
  unint64_t v62 = *(void *)&v63[0];
  int64_t v22 = *(void *)(v55 + 16);
  v23 = v3;
  if (v22)
  {
    uint64_t v24 = v55;
    v54 = v23;
    v56 = (void **)_swiftEmptyArrayStorage;
    sub_100008FF4(0, v22, 0);
    v25 = v56;
    sub_100009DFC(0, &qword_100010A90);
    v26 = (id *)(v24 + 40);
    do
    {
      char v27 = *((unsigned char *)v26 - 8);
      id v61 = *v26;
      id v28 = v61;
      sub_10000A368();
      sub_10000A488();
      sub_100009ABC((uint64_t)v5, v27, (uint64_t)v63);

      v56 = v25;
      unint64_t v30 = (unint64_t)v25[2];
      unint64_t v29 = (unint64_t)v25[3];
      v31 = (char *)(v30 + 1);
      if (v30 >= v29 >> 1)
      {
        sub_100008FF4((char *)(v29 > 1), v30 + 1, 1);
        v25 = v56;
      }
      v25[2] = v31;
      v32 = &v25[5 * v30];
      long long v33 = v63[0];
      long long v34 = v63[1];
      v32[8] = v64;
      *((_OWORD *)v32 + 2) = v33;
      *((_OWORD *)v32 + 3) = v34;
      v26 += 2;
      --v22;
    }
    while (v22);
    v23 = v54;
  }
  else
  {
    v25 = (void **)_swiftEmptyArrayStorage;
    v31 = (char *)_swiftEmptyArrayStorage[2];
    if (!v31) {
      goto LABEL_14;
    }
  }
  v35 = v25 + 8;
  do
  {
    v37 = *(v35 - 3);
    v38 = *(v35 - 2);
    v39 = *(v35 - 1);
    v40 = *v35;
    v56 = (void **)*(v35 - 4);
    v36 = v56;
    id v57 = v37;
    id v58 = v38;
    id v59 = v39;
    id v60 = v40;
    id v41 = v40;
    v42 = v36;
    id v43 = v37;
    id v44 = v38;
    id v45 = v39;
    sub_100006808();
    sub_10000A3D8();
    if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10000A408();
    }
    v35 += 5;
    sub_10000A418();
    sub_10000A3F8();

    --v31;
  }
  while (v31);
LABEL_14:
  swift_bridgeObjectRelease();
  if (v62 >> 62)
  {
    sub_100009DFC(0, &qword_100010A98);
    swift_bridgeObjectRetain();
    sub_10000A518();
  }
  else
  {
    swift_bridgeObjectRetain_n();
    sub_10000A548();
    sub_100009DFC(0, &qword_100010A98);
  }
  swift_bridgeObjectRelease();
  id v46 = objc_allocWithZone((Class)UIStackView);
  sub_100009DFC(0, &qword_100010A98);
  Class v47 = sub_10000A3E8().super.isa;
  swift_bridgeObjectRelease();
  id v48 = [v46 initWithArrangedSubviews:v47];

  [v48 setAxis:1];
  [v48 setAlignment:1];
  [v48 setDistribution:0];
  [v48 setSpacing:8.0];
  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v49 = [v23 view];
  if (v49)
  {
    v50 = v49;
    swift_bridgeObjectRelease();
    [v50 addSubview:v48];

    double v51 = *(double *)&v23[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController_margin];
    id v52 = [v23 view];
    objc_msgSend(v48, "hk_alignConstraintsWithView:insets:", v52, v51, v51, v51, v51);
  }
  else
  {
    __break(1u);
  }
}

id sub_100006808()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = *(id *)(v0 + 24);
  }
  else
  {
    uint64_t v3 = v0;
    sub_100009DB0(0, &qword_100010A38, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_10000A980;
    *(void *)(v4 + 32) = sub_1000087D4();
    *(void *)(v4 + 40) = sub_100008CA4();
    sub_10000A3F8();
    id v5 = objc_allocWithZone((Class)UIStackView);
    sub_100009DFC(0, &qword_100010A98);
    Class isa = sub_10000A3E8().super.isa;
    swift_bridgeObjectRelease();
    id v7 = [v5 initWithArrangedSubviews:isa];

    [v7 setAxis:0];
    [v7 setAlignment:3];
    [v7 setDistribution:0];
    [v7 setSpacing:8.0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = *(void **)(v3 + 24);
    id v2 = v7;

    uint64_t v1 = 0;
    *(void *)(v3 + 24) = v7;
  }
  id v9 = v1;
  return v2;
}

uint64_t sub_100006994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a8;
  v8[11] = v15;
  v8[9] = a7;
  uint64_t v11 = sub_10000A288();
  v8[12] = v11;
  v8[13] = *(void *)(v11 - 8);
  v8[14] = swift_task_alloc();
  v8[15] = sub_10000A448();
  v8[16] = sub_10000A438();
  uint64_t v12 = (void *)swift_task_alloc();
  v8[17] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_100006AC8;
  return ((uint64_t (*)(uint64_t, uint64_t))MedicationScheduleItemDataSource.unloggedScheduleItems(for:))(a5, a6);
}

uint64_t sub_100006AC8(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[18] = a1;
  v3[19] = v1;
  swift_task_dealloc();
  uint64_t v5 = sub_10000A428();
  v3[20] = v5;
  v3[21] = v4;
  if (v1) {
    uint64_t v6 = sub_100007480;
  }
  else {
    uint64_t v6 = sub_100006C2C;
  }
  return _swift_task_switch(v6, v5, v4);
}

uint64_t sub_100006C2C()
{
  unint64_t v1 = v0[18];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10000A528();
    v0[22] = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v10 = v0[9];
    swift_release();
    swift_bridgeObjectRelease_n();
    sub_10000A478();
    sub_10000938C();
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_10000A970;
    v0[8] = v10;
    sub_1000093F4();
    uint64_t v12 = sub_10000A3C8();
    uint64_t v14 = v13;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_10000942C();
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v14;
    sub_100009DFC(0, &qword_100010A30);
    uint64_t v15 = (void *)sub_10000A4A8();
    sub_10000A378();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    objc_super v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  v0[22] = v2;
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_10000A4F8();
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = swift_retain();
  }
  v0[23] = v4;
  swift_bridgeObjectRelease();
  v0[24] = _swiftEmptyArrayStorage;
  if ((v0[18] & 0xC000000000000001) != 0) {
    uint64_t v5 = sub_10000A4F8();
  }
  else {
    uint64_t v5 = swift_retain();
  }
  v0[25] = v5;
  v0[26] = 1;
  uint64_t v6 = sub_10000A2D8();
  uint64_t v8 = v7;
  v0[27] = v7;
  Swift::String_optional v17 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MedicationDataSource.fetchMedication(identifier:)
                                                 + async function pointer to dispatch thunk of MedicationDataSource.fetchMedication(identifier:));
  id v9 = (void *)swift_task_alloc();
  v0[28] = v9;
  *id v9 = v0;
  v9[1] = sub_100006ED8;
  return v17(v6, v8);
}

uint64_t sub_100006ED8(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[29] = a1;
  v3[30] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v3[20];
    uint64_t v5 = v3[21];
    uint64_t v6 = sub_100007610;
  }
  else
  {
    uint64_t v4 = v3[20];
    uint64_t v5 = v3[21];
    uint64_t v6 = sub_100007240;
  }
  return _swift_task_switch(v6, v4, v5);
}

uint64_t sub_100007034()
{
  *(void *)(v0 + 248) = sub_10000A438();
  uint64_t v2 = sub_10000A428();
  return _swift_task_switch(sub_1000070C0, v2, v1);
}

uint64_t sub_1000070C0()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    uint64_t v3 = v0[32];
    uint64_t v5 = v0[13];
    uint64_t v4 = v0[14];
    uint64_t v6 = v0[12];
    sub_10000A2E8();
    sub_1000060E4(v4, v3);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  swift_bridgeObjectRelease_n();
  swift_release();
  swift_unknownObjectWeakDestroy();
  uint64_t v7 = v0[20];
  uint64_t v8 = v0[21];
  return _swift_task_switch(sub_1000071CC, v7, v8);
}

uint64_t sub_1000071CC()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100007240()
{
  uint64_t v1 = *(void **)(v0 + 232);
  if (v1)
  {
    char v2 = sub_10000A2C8();
    id v3 = v1;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v5 = *(char **)(v0 + 192);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v5 = sub_10000914C(0, *((void *)v5 + 2) + 1, 1, *(char **)(v0 + 192));
    }
    unint64_t v7 = *((void *)v5 + 2);
    unint64_t v6 = *((void *)v5 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v5 = sub_10000914C((char *)(v6 > 1), v7 + 1, 1, v5);
    }
    *((void *)v5 + 2) = v7 + 1;
    uint64_t v8 = &v5[16 * v7];
    v8[32] = v2 & 1;
    *((void *)v8 + 5) = v3;
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v5 = *(char **)(v0 + 192);
  }
  *(void *)(v0 + 256) = v5;
  uint64_t v9 = *(void *)(v0 + 208);
  if (v9 == *(void *)(v0 + 176))
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectWeakInit();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t)sub_100007034;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    return _swift_task_switch(v10, v11, v12);
  }
  *(void *)(v0 + 192) = v5;
  if ((*(void *)(v0 + 144) & 0xC000000000000001) != 0) {
    uint64_t v10 = sub_10000A4F8();
  }
  else {
    uint64_t v10 = swift_retain();
  }
  *(void *)(v0 + 200) = v10;
  *(void *)(v0 + 208) = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    return _swift_task_switch(v10, v11, v12);
  }
  uint64_t v13 = sub_10000A2D8();
  uint64_t v15 = v14;
  *(void *)(v0 + 216) = v14;
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MedicationDataSource.fetchMedication(identifier:)
                                                 + async function pointer to dispatch thunk of MedicationDataSource.fetchMedication(identifier:));
  objc_super v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v16;
  *objc_super v16 = v0;
  v16[1] = sub_100006ED8;
  return v18(v13, v15);
}

uint64_t sub_100007480()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[9];
  swift_release();
  sub_10000A478();
  sub_10000938C();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10000A990;
  v0[5] = v2;
  sub_1000093F4();
  uint64_t v4 = sub_10000A3C8();
  uint64_t v6 = v5;
  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v7 = sub_10000942C();
  *(void *)(v3 + 64) = v7;
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v6;
  v0[6] = v1;
  swift_errorRetain();
  sub_1000097DC(0, &qword_100010A70);
  uint64_t v8 = sub_10000A3C8();
  *(void *)(v3 + 96) = &type metadata for String;
  *(void *)(v3 + 104) = v7;
  *(void *)(v3 + 72) = v8;
  *(void *)(v3 + 80) = v9;
  sub_100009DFC(0, &qword_100010A30);
  uint64_t v10 = (void *)sub_10000A4A8();
  sub_10000A378();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100007610()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[9];
  swift_release();
  sub_10000A478();
  sub_10000938C();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10000A990;
  v0[5] = v2;
  sub_1000093F4();
  uint64_t v4 = sub_10000A3C8();
  uint64_t v6 = v5;
  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v7 = sub_10000942C();
  *(void *)(v3 + 64) = v7;
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v6;
  v0[6] = v1;
  swift_errorRetain();
  sub_1000097DC(0, &qword_100010A70);
  uint64_t v8 = sub_10000A3C8();
  *(void *)(v3 + 96) = &type metadata for String;
  *(void *)(v3 + 104) = v7;
  *(void *)(v3 + 72) = v8;
  *(void *)(v3 + 80) = v9;
  sub_100009DFC(0, &qword_100010A30);
  uint64_t v10 = (void *)sub_10000A4A8();
  sub_10000A378();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_1000077B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A468();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000A458();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000099A8(a1, &qword_100010A00, (void (*)(uint64_t))&type metadata accessor for TaskPriority);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000A428();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_100007974(void *a1)
{
  uint64_t v2 = v1;
  sub_100009954(0, &qword_100010A00, (void (*)(uint64_t))&type metadata accessor for TaskPriority);
  __chkstk_darwin();
  v109 = (char *)&v93 - v4;
  uint64_t v5 = sub_10000A2B8();
  uint64_t v107 = *(void *)(v5 - 8);
  uint64_t v108 = v5;
  __chkstk_darwin();
  v106 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000A288();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [a1 request];
  id v12 = [v11 content];

  NSString v13 = [v12 categoryIdentifier];
  if (!v13)
  {
    sub_10000A3A8();
    NSString v13 = sub_10000A398();
    swift_bridgeObjectRelease();
  }
  sub_10000A3A8();
  id v14 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v15 = sub_10000A398();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithSuiteName:v15];

  if (v16)
  {
    id v17 = v16;
    sub_10000A278();
    Class isa = sub_10000A268().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    [v17 setObject:isa forKey:HKMedicationsReminderNotificationLastShownDateKey];
  }
  unsigned int v19 = [self isNotMissedCategory:v13];

  if (!v19) {
    goto LABEL_17;
  }
  id v20 = [a1 request];
  id v21 = [v20 content];

  id v22 = [v21 userInfo];
  uint64_t v23 = sub_10000A388();

  id v110 = (id)sub_10000A3A8();
  uint64_t v111 = v24;
  sub_10000A4E8();
  if (*(void *)(v23 + 16) && (unint64_t v25 = sub_100009270((uint64_t)v112), (v26 & 1) != 0))
  {
    sub_100009690(*(void *)(v23 + 56) + 32 * v25, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1000092B4((uint64_t)v112);
  if (!*((void *)&v114 + 1))
  {
    sub_100009308((uint64_t)&v113);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    sub_10000A478();
    sub_10000938C();
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_10000A970;
    v112[0] = swift_getObjectType();
    sub_1000093F4();
    uint64_t v35 = sub_10000A3C8();
    uint64_t v37 = v36;
    *(void *)(v34 + 56) = &type metadata for String;
    *(void *)(v34 + 64) = sub_10000942C();
    *(void *)(v34 + 32) = v35;
    *(void *)(v34 + 40) = v37;
    sub_100009DFC(0, &qword_100010A30);
    v38 = (void *)sub_10000A4A8();
    sub_10000A378();

    swift_bridgeObjectRelease();
LABEL_17:

    return;
  }
  id v99 = v110;
  uint64_t v100 = v111;
  id v27 = [a1 request];
  id v28 = [v27 content];

  id v29 = [v28 userInfo];
  uint64_t v30 = sub_10000A388();

  id v110 = (id)sub_10000A3A8();
  uint64_t v111 = v31;
  sub_10000A4E8();
  if (*(void *)(v30 + 16) && (unint64_t v32 = sub_100009270((uint64_t)v112), (v33 & 1) != 0))
  {
    sub_100009690(*(void *)(v30 + 56) + 32 * v32, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1000092B4((uint64_t)v112);
  if (!*((void *)&v114 + 1))
  {
    sub_100009308((uint64_t)&v113);
LABEL_24:
    int v43 = 0;
    uint64_t v41 = 0xD00000000000002FLL;
    v42 = (void *)0x800000010000ACD0;
    goto LABEL_25;
  }
  sub_100009DFC(0, &qword_100010A58);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_24;
  }
  id v39 = v110;
  unsigned __int8 v40 = [v110 BOOLValue];

  if ((v40 & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v41 = 0xD000000000000033;
  v42 = (void *)0x800000010000ADB0;
  int v43 = 1;
LABEL_25:
  v101 = v2;
  id v102 = v16;
  if (qword_100010B18 != -1) {
    swift_once();
  }
  v44.super.Class isa = (Class)static LocalizationSource.healthMedicationsNotification;
  v90._countAndFlagsBits = 0xE000000000000000;
  v115._countAndFlagsBits = v41;
  v115._object = v42;
  v117._countAndFlagsBits = 0;
  v117._object = (void *)0xE000000000000000;
  uint64_t v95 = sub_10000A258(v115, (Swift::String_optional)xmmword_100010B30, v44, v117, v90);
  swift_bridgeObjectRelease();
  if (v43) {
    v45._countAndFlagsBits = 0xD000000000000031;
  }
  else {
    v45._countAndFlagsBits = 0xD00000000000002DLL;
  }
  if (v43) {
    id v46 = (void *)0x800000010000AD70;
  }
  else {
    id v46 = (void *)0x800000010000AD00;
  }
  v48.super.Class isa = (Class)static LocalizationSource.healthMedicationsNotification;
  Swift::String_optional v47 = (Swift::String_optional)xmmword_100010B30;
  v91._countAndFlagsBits = 0xE000000000000000;
  id v49 = &HKMedicationsNotificationActionIdentifierSkipRawValue;
  if (v43) {
    id v49 = &HKMedicationsNotificationActionIdentifierSkipAllRawValue;
  }
  v96 = v49;
  v45._object = v46;
  v118._countAndFlagsBits = 0;
  v118._object = (void *)0xE000000000000000;
  uint64_t v98 = sub_10000A258(v45, v47, v48, v118, v91);
  uint64_t v97 = v50;
  swift_bridgeObjectRelease();
  sub_100009DB0(0, &qword_100010A38, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_10000A9A0;
  sub_10000A3A8();
  double v51 = v106;
  uint64_t v52 = v107;
  Swift::String v53 = *(void (**)(char *, void, uint64_t))(v107 + 104);
  uint64_t v104 = v107 + 104;
  v105 = v53;
  uint64_t v54 = v108;
  v53(v106, enum case for Symbol.checkmark(_:), v108);
  sub_10000A2A8();
  uint64_t v107 = *(void *)(v52 + 8);
  ((void (*)(char *, uint64_t))v107)(v51, v54);
  NSString v55 = sub_10000A398();
  swift_bridgeObjectRelease();
  v56 = self;
  id v94 = v56;
  id v57 = [v56 iconWithSystemImageName:v55];

  NSString v58 = sub_10000A398();
  swift_bridgeObjectRelease();
  NSString v59 = sub_10000A398();
  swift_bridgeObjectRelease();
  id v60 = self;
  id v61 = [v60 actionWithIdentifier:v58 title:v59 options:1 icon:v57];

  uint64_t v62 = v103;
  *(void *)(v103 + 32) = v61;
  sub_10000A3A8();
  v105(v51, enum case for Symbol.xmark(_:), v54);
  sub_10000A2A8();
  ((void (*)(char *, uint64_t))v107)(v51, v54);
  NSString v63 = sub_10000A398();
  swift_bridgeObjectRelease();
  id v64 = [v56 iconWithSystemImageName:v63];

  NSString v65 = sub_10000A398();
  swift_bridgeObjectRelease();
  NSString v66 = sub_10000A398();
  swift_bridgeObjectRelease();
  id v67 = [v60 actionWithIdentifier:v65 title:v66 options:1 icon:v64];

  *(void *)(v62 + 40) = v67;
  sub_10000A3A8();
  v68.super.Class isa = (Class)static LocalizationSource.healthMedicationsNotification;
  v116._countAndFlagsBits = 0xD000000000000032;
  v92._countAndFlagsBits = 0xE000000000000000;
  v116._object = (void *)0x800000010000AD30;
  v119._countAndFlagsBits = 0;
  v119._object = (void *)0xE000000000000000;
  sub_10000A258(v116, (Swift::String_optional)xmmword_100010B30, v68, v119, v92);
  v105(v51, enum case for Symbol.clock(_:), v54);
  sub_10000A2A8();
  ((void (*)(char *, uint64_t))v107)(v51, v54);
  NSString v69 = sub_10000A398();
  swift_bridgeObjectRelease();
  id v70 = [v94 iconWithSystemImageName:v69];

  NSString v71 = sub_10000A398();
  swift_bridgeObjectRelease();
  NSString v72 = sub_10000A398();
  swift_bridgeObjectRelease();
  id v73 = [v60 actionWithIdentifier:v71 title:v72 options:1 icon:v70];

  uint64_t v74 = v103;
  *(void *)(v103 + 48) = v73;
  v112[0] = v74;
  sub_10000A3F8();
  v75 = v101;
  id v76 = [v101 extensionContext];
  if (v76)
  {
    v77 = v76;
    sub_100009DFC(0, &qword_100010A50);
    Class v78 = sub_10000A3E8().super.isa;
    swift_bridgeObjectRelease();
    [v77 setNotificationActions:v78];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v79 = v102;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v81 = sub_10000A468();
  uint64_t v82 = (uint64_t)v109;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v109, 1, 1, v81);
  uint64_t v83 = *(void *)&v75[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController_scheduleItemDataSource];
  uint64_t v84 = *(void *)&v75[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController_medicationDataSource];
  sub_10000A448();
  swift_retain();
  swift_retain();
  uint64_t v85 = v100;
  swift_bridgeObjectRetain();
  v86 = v75;
  uint64_t v87 = sub_10000A438();
  v88 = (void *)swift_allocObject();
  v88[2] = v87;
  v88[3] = &protocol witness table for MainActor;
  id v89 = v99;
  v88[4] = v83;
  v88[5] = v89;
  v88[6] = v85;
  v88[7] = ObjectType;
  v88[8] = v84;
  v88[9] = v86;
  sub_1000077B4(v82, (uint64_t)&unk_100010A48, (uint64_t)v88);
  swift_release();

  swift_bridgeObjectRelease();
}

id sub_100008700()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationViewController()
{
  return self;
}

id sub_1000087D4()
{
  uint64_t v1 = *v0;
  if (*v0)
  {
    id v2 = *v0;
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone((Class)sub_10000A308()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    void *v0 = v3;
    id v2 = v3;
    uint64_t v1 = 0;
  }
  id v4 = v1;
  return v2;
}

id sub_100008854()
{
  uint64_t v1 = *(void **)(v0 + 8);
  if (v1)
  {
    id v2 = *(id *)(v0 + 8);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    [v3 setNumberOfLines:0];
    id v4 = self;
    id v5 = [v4 labelColor];
    [v3 setTextColor:v5];

    id v6 = [self preferredFontForTextStyle:UIFontTextStyleTitle3];
    [v3 setFont:v6];

    [v3 setNumberOfLines:0];
    [v3 setLineBreakMode:4];
    id v7 = [v4 labelColor];
    [v3 setTextColor:v7];

    id v8 = v3;
    id v9 = [v4 systemBackgroundColor];
    [v8 setBackgroundColor:v9];

    [v8 setAdjustsFontForContentSizeCategory:1];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    *(void *)(v0 + 8) = v8;
    id v2 = v8;
    uint64_t v1 = 0;
  }
  id v10 = v1;
  return v2;
}

id sub_100008A2C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    [v3 setNumberOfLines:0];
    id v4 = self;
    id v5 = [v4 labelColor];
    [v3 setTextColor:v5];

    id v6 = [self preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [v3 setFont:v6];

    [v3 setNumberOfLines:0];
    [v3 setLineBreakMode:4];
    id v7 = [v4 secondaryLabelColor];
    [v3 setTextColor:v7];

    id v8 = v3;
    id v9 = [v4 systemBackgroundColor];
    [v8 setBackgroundColor:v9];

    [v8 setAdjustsFontForContentSizeCategory:1];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (qword_100010B18 != -1) {
      swift_once();
    }
    v10.super.Class isa = (Class)static LocalizationSource.healthMedicationsNotification;
    v14._countAndFlagsBits = 0xE000000000000000;
    v15._object = (void *)0x800000010000AEC0;
    v15._countAndFlagsBits = 0xD000000000000035;
    v16._countAndFlagsBits = 0;
    v16._object = (void *)0xE000000000000000;
    sub_10000A258(v15, (Swift::String_optional)xmmword_100010B30, v10, v16, v14);
    NSString v11 = sub_10000A398();
    swift_bridgeObjectRelease();
    [v8 setText:v11];

    *(void *)(v0 + 16) = v8;
    id v2 = v8;
    uint64_t v1 = 0;
  }
  id v12 = v1;
  return v2;
}

id sub_100008CA4()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
  }
  else
  {
    uint64_t v3 = v0;
    sub_100009DB0(0, &qword_100010A38, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_10000A960;
    *(void *)(v4 + 32) = sub_100008854();
    sub_10000A3F8();
    id v5 = objc_allocWithZone((Class)UIStackView);
    sub_100009DFC(0, &qword_100010A98);
    Class isa = sub_10000A3E8().super.isa;
    swift_bridgeObjectRelease();
    id v7 = [v5 initWithArrangedSubviews:isa];

    [v7 setAxis:1];
    [v7 setAlignment:1];
    [v7 setDistribution:0];
    [v7 setSpacing:8.0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    *(void *)(v3 + 32) = v7;
    id v2 = v7;
    uint64_t v1 = 0;
  }
  id v8 = v1;
  return v2;
}

uint64_t sub_100008E20(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100008EFC;
  return v6(a1);
}

uint64_t sub_100008EFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_100008FF4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009014(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_100009014(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009DB0(0, &qword_100010AA0, (uint64_t)&type metadata for MedicationStackViewItem, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    NSBundle v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    NSBundle v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v12 = v10 + 32;
  NSString v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_10000914C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009DB0(0, &qword_100010A78, (uint64_t)&type metadata for MedicationAndLastDose, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    NSBundle v10 = (char *)swift_allocObject();
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
    NSBundle v10 = (char *)_swiftEmptyArrayStorage;
  }
  NSString v13 = v10 + 32;
  Swift::String v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_100009270(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10000A4C8(*(void *)(v2 + 40));

  return sub_100009830(a1, v4);
}

uint64_t sub_1000092B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009308(uint64_t a1)
{
  sub_100009DB0(0, &qword_100010A08, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000938C()
{
  if (!qword_100010A10)
  {
    sub_1000097DC(255, &qword_100010A18);
    unint64_t v0 = sub_10000A538();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010A10);
    }
  }
}

unint64_t sub_1000093F4()
{
  unint64_t result = qword_100010A20;
  if (!qword_100010A20)
  {
    type metadata accessor for NotificationViewController();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100010A20);
  }
  return result;
}

unint64_t sub_10000942C()
{
  unint64_t result = qword_100010A28;
  if (!qword_100010A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A28);
  }
  return result;
}

uint64_t sub_100009480()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1000094D8()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_10000959C;
  return sub_100006994((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_10000959C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100009690(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000096EC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009724(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000959C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100010A60 + dword_100010A60);
  return v6(a1, v4);
}

uint64_t sub_1000097DC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_100009830(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000098F8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10000A4D8();
      sub_1000092B4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000098F8(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_100009954(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10000A4B8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000099A8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_100009954(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_100009A04()
{
  *(void *)&v0[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___dateFormatter] = 0;
  unsigned int v1 = objc_msgSend(self, "hk_currentDeviceHas4InchScreen");
  double v2 = 16.0;
  if (v1) {
    double v2 = 8.0;
  }
  *(double *)&v0[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController_margin] = v2;
  *(void *)&v0[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabelStackView] = 0;

  sub_10000A508();
  __break(1u);
}

double sub_100009ABC@<D0>(uint64_t a1@<X2>, char a2@<W3>, uint64_t a3@<X8>)
{
  sub_100009954(0, &qword_100010A80, (void (*)(uint64_t))&type metadata accessor for MedicationVisualizationConfig);
  __chkstk_darwin();
  int64_t v7 = (char *)&v24 - v6;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = sub_100008854();
  NSString v9 = sub_10000A398();
  swift_bridgeObjectRelease();
  [v8 setText:v9];

  id v10 = sub_1000087D4();
  id v11 = [v10 widthAnchor];

  id v12 = [v11 constraintEqualToConstant:40.0];
  [v12 setActive:1];

  id v13 = sub_1000087D4();
  id v14 = [v13 heightAnchor];

  id v15 = sub_1000087D4();
  id v16 = [v15 widthAnchor];

  id v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  if (a2)
  {
    id v18 = sub_100008CA4();
    id v19 = sub_100008A2C();
    [v18 addArrangedSubview:v19];
  }
  id v20 = sub_1000087D4();
  sub_100009D30(a1, (uint64_t)v7);
  sub_10000A2F8();

  sub_1000099A8(a1, &qword_100010A80, (void (*)(uint64_t))&type metadata accessor for MedicationVisualizationConfig);
  uint64_t v21 = v26;
  double result = *(double *)&v24;
  long long v23 = v25;
  *(_OWORD *)a3 = v24;
  *(_OWORD *)(a3 + 16) = v23;
  *(void *)(a3 + 32) = v21;
  return result;
}

uint64_t sub_100009D30(uint64_t a1, uint64_t a2)
{
  sub_100009954(0, &qword_100010A80, (void (*)(uint64_t))&type metadata accessor for MedicationVisualizationConfig);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_100009DB0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_100009DFC(uint64_t a1, unint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for MedicationStackViewItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for MedicationStackViewItem(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for MedicationStackViewItem(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  unint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  int64_t v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for MedicationStackViewItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  unint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  int64_t v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  id v10 = *(void **)(a1 + 16);
  id v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  id v13 = *(void **)(a1 + 24);
  id v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  id v16 = *(void **)(a1 + 32);
  id v17 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v17;
  id v18 = v17;

  return a1;
}

__n128 initializeWithTake for MedicationStackViewItem(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MedicationStackViewItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  unint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for MedicationStackViewItem(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MedicationStackViewItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MedicationStackViewItem()
{
  return &type metadata for MedicationStackViewItem;
}

uint64_t initializeBufferWithCopyOfBuffer for MedicationAndLastDose(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

void destroy for MedicationAndLastDose(uint64_t a1)
{
}

uint64_t assignWithCopy for MedicationAndLastDose(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  id v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  id v5 = v3;

  return a1;
}

__n128 initializeWithTake for MedicationAndLastDose(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for MedicationAndLastDose(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for MedicationAndLastDose(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MedicationAndLastDose(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MedicationAndLastDose()
{
  return &type metadata for MedicationAndLastDose;
}

uint64_t sub_10000A258(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

NSDate sub_10000A268()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10000A278()
{
  return Date.init()();
}

uint64_t sub_10000A288()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000A298()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000A2A8()
{
  return Symbol.systemName.getter();
}

uint64_t sub_10000A2B8()
{
  return type metadata accessor for Symbol();
}

uint64_t sub_10000A2C8()
{
  return ScheduleItem.isLastScheduledDose.getter();
}

uint64_t sub_10000A2D8()
{
  return ScheduleItem.medicationIdentifier.getter();
}

uint64_t sub_10000A2E8()
{
  return ScheduleItem.date.getter();
}

uint64_t sub_10000A2F8()
{
  return dispatch thunk of MedicationView.config.setter();
}

uint64_t sub_10000A308()
{
  return type metadata accessor for MedicationView();
}

uint64_t sub_10000A318()
{
  return MedicationDataSource.__allocating_init(healthStore:)();
}

uint64_t sub_10000A328()
{
  return type metadata accessor for MedicationDataSource();
}

uint64_t sub_10000A348()
{
  return MedicationScheduleItemDataSource.init(healthStore:)();
}

uint64_t sub_10000A358()
{
  return type metadata accessor for MedicationScheduleItemDataSource();
}

uint64_t sub_10000A368()
{
  return MedicationUserFacingTitleProviding.userFacingTitle.getter();
}

uint64_t sub_10000A378()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10000A388()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10000A398()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A3A8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A3B8()
{
  return String.init(format:locale:arguments:)();
}

uint64_t sub_10000A3C8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000A3D8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10000A3E8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000A3F8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000A408()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10000A418()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000A428()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A438()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000A448()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000A458()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000A468()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000A478()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A488()
{
  return HKMedicationUserDomainConcept.medmojiConfig.getter();
}

uint64_t sub_10000A498()
{
  return static UIFont.createFont(with:weight:traits:rounded:maximumContentSizeCategory:respectsDynamicType:)();
}

uint64_t sub_10000A4A8()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_10000A4B8()
{
  return type metadata accessor for Optional();
}

Swift::Int sub_10000A4C8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10000A4D8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10000A4E8()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10000A4F8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000A508()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A518()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_10000A528()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000A538()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_10000A548()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_retain()
{
  return _swift_retain();
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