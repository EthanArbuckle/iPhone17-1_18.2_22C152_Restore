id SettingsHeaderView.__allocating_init(specifier:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SettingsHeaderView.init(specifier:)(a1);
}

id SettingsHeaderView.init(specifier:)(void *a1)
{
  v81.receiver = v1;
  v81.super_class = (Class)type metadata accessor for SettingsHeaderView();
  id v3 = objc_msgSendSuper2(&v81, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v3 setPreservesSuperviewLayoutMargins:1];
  id v75 = a1;
  if ([a1 propertyForKey:PSIconImageKey])
  {
    sub_DC68();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
  }
  sub_59DC((uint64_t)&v77, (uint64_t)v79);
  if (v80)
  {
    sub_5DD8(0, &qword_14978);
    if (swift_dynamicCast()) {
      v4 = v76;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    sub_5A88((uint64_t)v79);
    v4 = 0;
  }
  v72 = v4;
  id v5 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setContentMode:1];
  id v73 = v5;
  [v3 addSubview:v5];
  id v6 = [objc_allocWithZone((Class)UILabel) init];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setAdjustsFontForContentSizeCategory:1];
  v7 = self;
  sub_DAC8();
  NSString v8 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v74 = v7;
  id v9 = objc_msgSend(v7, "hk_preferredFontForTextStyle:symbolicTraits:", v8, 32770);

  [v6 setFont:v9];
  if ([v75 propertyForKey:PSTitleKey])
  {
    sub_DC68();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
  }
  sub_59DC((uint64_t)&v77, (uint64_t)v79);
  if (v80)
  {
    if (swift_dynamicCast())
    {
      NSString v10 = sub_DAA8();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  else
  {
    sub_5A88((uint64_t)v79);
  }
  NSString v10 = 0;
LABEL_17:
  [v6 setText:v10];

  v11 = self;
  id v12 = [v11 whiteColor];
  [v6 setTextColor:v12];

  [v6 setTextAlignment:1];
  [v6 setNumberOfLines:0];
  [v3 addSubview:v6];
  id v13 = [objc_allocWithZone((Class)UILabel) init];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 setAdjustsFontForContentSizeCategory:1];
  sub_DAC8();
  NSString v14 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v7, "hk_preferredFontForTextStyle:", v14);

  [v13 setFont:v15];
  if ([v75 propertyForKey:PSStaticHeaderTextKey])
  {
    sub_DC68();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
  }
  sub_59DC((uint64_t)&v77, (uint64_t)v79);
  if (!v80)
  {
    sub_5A88((uint64_t)v79);
    goto LABEL_24;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_24:
    NSString v16 = 0;
    goto LABEL_25;
  }
  NSString v16 = sub_DAA8();
  swift_bridgeObjectRelease();
LABEL_25:
  [v13 setText:v16];

  id v17 = [v11 whiteColor];
  [v13 setTextColor:v17];

  [v13 setTextAlignment:1];
  [v13 setNumberOfLines:0];
  [v3 addSubview:v13];
  id v71 = self;
  sub_5A44(&qword_14968);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_E3F0;
  id v19 = [v73 topAnchor];
  id v20 = [v3 layoutMarginsGuide];
  id v21 = [v20 topAnchor];

  sub_DAC8();
  NSString v22 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v74, "hk_preferredFontForTextStyle:symbolicTraits:", v22, 0x8000);

  [v23 _scaledValueForValue:34.0];
  double v25 = v24;

  id v26 = [v19 constraintEqualToAnchor:v21 constant:v25];
  *(void *)(v18 + 32) = v26;
  id v27 = [v73 centerXAnchor];
  id v28 = [v3 layoutMarginsGuide];
  id v29 = [v28 centerXAnchor];

  id v30 = [v27 constraintEqualToAnchor:v29];
  *(void *)(v18 + 40) = v30;
  id v31 = [v73 widthAnchor];
  id v32 = [v73 heightAnchor];
  id v33 = [v31 constraintEqualToAnchor:v32];

  *(void *)(v18 + 48) = v33;
  id v34 = [v73 widthAnchor];
  id v35 = [v34 constraintEqualToConstant:60.0];

  *(void *)(v18 + 56) = v35;
  id v36 = [v6 firstBaselineAnchor];
  id v37 = [v73 bottomAnchor];
  sub_DAC8();
  NSString v38 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v39 = objc_msgSend(v74, "hk_preferredFontForTextStyle:symbolicTraits:", v38, 0x8000);

  [v39 _scaledValueForValue:34.0];
  double v41 = v40;

  id v42 = [v36 constraintEqualToAnchor:v37 constant:v41];
  *(void *)(v18 + 64) = v42;
  id v43 = [v6 leadingAnchor];
  id v44 = [v3 layoutMarginsGuide];
  id v45 = [v44 leadingAnchor];

  id v46 = [v43 constraintEqualToAnchor:v45];
  *(void *)(v18 + 72) = v46;
  id v47 = [v6 trailingAnchor];
  id v48 = [v3 layoutMarginsGuide];
  id v49 = [v48 trailingAnchor];

  id v50 = [v47 constraintEqualToAnchor:v49];
  *(void *)(v18 + 80) = v50;
  id v51 = [v13 firstBaselineAnchor];
  id v52 = [v6 lastBaselineAnchor];
  sub_DAC8();
  NSString v53 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v54 = objc_msgSend(v74, "hk_preferredFontForTextStyle:", v53);

  [v54 _scaledValueForValue:26.0];
  double v56 = v55;

  id v57 = [v51 constraintEqualToAnchor:v52 constant:v56];
  *(void *)(v18 + 88) = v57;
  id v58 = [v13 leadingAnchor];
  id v59 = [v3 layoutMarginsGuide];
  id v60 = [v59 leadingAnchor];

  id v61 = [v58 constraintEqualToAnchor:v60];
  *(void *)(v18 + 96) = v61;
  id v62 = [v13 trailingAnchor];
  id v63 = [v3 layoutMarginsGuide];
  id v64 = [v63 trailingAnchor];

  id v65 = [v62 constraintEqualToAnchor:v64];
  *(void *)(v18 + 104) = v65;
  id v66 = [v3 bottomAnchor];
  id v67 = [v13 bottomAnchor];
  id v68 = [v66 constraintEqualToAnchor:v67];

  *(void *)(v18 + 112) = v68;
  v79[0] = v18;
  sub_DB48();
  sub_5DD8(0, &qword_14970);
  Class isa = sub_DB38().super.isa;
  swift_bridgeObjectRelease();
  [v71 activateConstraints:isa];

  return v3;
}

uint64_t type metadata accessor for SettingsHeaderView()
{
  return self;
}

uint64_t sub_59DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5A44(&qword_14960);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_5A44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5A88(uint64_t a1)
{
  uint64_t v2 = sub_5A44(&qword_14960);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id SettingsHeaderView.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id SettingsHeaderView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SettingsHeaderView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id SettingsHeaderView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, "initWithFrame:", a1, a2, a3, a4);
}

void SettingsHeaderView.init(frame:)()
{
}

id SettingsHeaderView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsHeaderView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

double SettingsHeaderView.preferredHeight(forWidth:)(double a1)
{
  [v1 directionalLayoutMargins];
  double v4 = a1 - v3;
  [v1 directionalLayoutMargins];
  double v6 = v4 - v5;
  LODWORD(v7) = 1148846080;
  LODWORD(v5) = 1112014848;
  objc_msgSend(v1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v7, v5);
  return v8;
}

uint64_t sub_5DD8(uint64_t a1, unint64_t *a2)
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

HKQuantityType sub_5E14(uint64_t a1)
{
  return sub_5E3C(a1, (id *)&HKQuantityTypeIdentifierUnderwaterDepth, (HKQuantityType *)&qword_14A08);
}

HKQuantityType sub_5E28(uint64_t a1)
{
  return sub_5E3C(a1, (id *)&HKQuantityTypeIdentifierWaterTemperature, (HKQuantityType *)&qword_14A10);
}

HKQuantityType sub_5E3C(uint64_t a1, id *a2, HKQuantityType *a3)
{
  sub_5DD8(0, &qword_14C70);
  result.super.super.super.Class isa = sub_DBA8((HKQuantityTypeIdentifier)*a2).super.super.super.isa;
  a3->super.super.super.Class isa = result.super.super.super.isa;
  return result;
}

uint64_t sub_5E98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_DA18();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  double v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_DA38();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  NSString v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5DD8(0, &qword_14C50);
  v11 = (void *)sub_DBB8();
  aBlock[4] = sub_93D0;
  aBlock[5] = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_6198;
  aBlock[3] = &unk_108D8;
  id v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_DA28();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_93F0(&qword_14C58, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5A44(&qword_14C60);
  sub_9438();
  sub_DC78();
  sub_DBC8();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_6140()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_6B6C();
    return swift_release();
  }
  return result;
}

uint64_t sub_6198(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_61DC()
{
  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 60));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HealthKitSettingsStore()
{
  return self;
}

void sub_6288()
{
  uint64_t v1 = v0;
  uint64_t v2 = (const char *)HKProtectedHealthDatabaseDidBecomeAvailableNotification;
  sub_5DD8(0, &qword_14C50);
  uint64_t v3 = sub_DBB8();
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  v6[4] = sub_9690;
  v6[5] = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_642C;
  v6[3] = &unk_10A68;
  uint64_t v5 = _Block_copy(v6);
  swift_release();
  swift_beginAccess();
  notify_register_dispatch(v2, (int *)(v1 + 56), v3, v5);
  swift_endAccess();
  _Block_release(v5);
}

uint64_t sub_63B8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    sub_6B6C();
    swift_beginAccess();
    notify_cancel(*(_DWORD *)(v1 + 56));
    return swift_release();
  }
  return result;
}

uint64_t sub_642C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_6480()
{
  if (kHKNanoLifestylePrivacyPreferencesChangedNotification)
  {
    uint64_t v1 = v0;
    sub_DAC8();
    sub_5DD8(0, &qword_14C50);
    uint64_t v2 = sub_DBB8();
    uint64_t v3 = swift_allocObject();
    swift_weakInit();
    v6[4] = sub_9688;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_642C;
    v6[3] = &unk_10A40;
    uint64_t v4 = _Block_copy(v6);
    swift_release();
    uint64_t v5 = sub_DAF8();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    notify_register_dispatch((const char *)(v5 + 32), (int *)(v1 + 60), v2, v4);
    swift_endAccess();
    swift_release();
    _Block_release(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_65F0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_DAC8();
    id v1 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v2 = sub_DAA8();
    swift_bridgeObjectRelease();
    id v3 = [v1 initWithSuiteName:v2];

    if (v3)
    {
      objc_msgSend(v3, "hk_BOOLForKey:defaultValue:", kHKPrivacyPreferencesKeyEnableFitnessTracking, 1);
      swift_retain();
      sub_D9D8();
      swift_release();

      return swift_release();
    }
    else
    {
      uint64_t result = sub_DD78();
      __break(1u);
    }
  }
  return result;
}

void sub_673C()
{
}

void sub_6750()
{
}

void sub_6764(SEL *a1, void *a2)
{
  uint64_t v4 = v2;
  v12[0] = [self *a1];
  swift_retain();
  sub_D9D8();

  swift_release();
  swift_retain();
  sub_D9E8();
  swift_release();
  id v5 = v12[0];
  if (qword_14910 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_14A08;
  id v7 = *(id *)(v4 + 64);
  NSString v8 = [v12[0] unitString];
  if (!v8)
  {
    sub_DAC8();
    NSString v8 = sub_DAA8();
    swift_bridgeObjectRelease();
  }
  NSString v9 = sub_DAA8();
  [v7 setObject:v8 forKey:v9];

  NSString v10 = *(void **)(v4 + 16);
  v12[4] = nullsub_1;
  v12[5] = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = (id)1107296256;
  v12[2] = sub_7850;
  v12[3] = a2;
  v11 = _Block_copy(v12);
  [v10 _setPreferredUnit:v5 forType:v6 completion:v11];
  _Block_release(v11);
}

void sub_6954()
{
}

void sub_6968()
{
}

void sub_697C(SEL *a1, void *a2)
{
  uint64_t v4 = v2;
  v12[0] = [self *a1];
  swift_retain();
  sub_D9D8();

  swift_release();
  swift_retain();
  sub_D9E8();
  swift_release();
  id v5 = v12[0];
  if (qword_14918 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_14A10;
  id v7 = *(id *)(v4 + 64);
  NSString v8 = [v12[0] unitString];
  if (!v8)
  {
    sub_DAC8();
    NSString v8 = sub_DAA8();
    swift_bridgeObjectRelease();
  }
  NSString v9 = sub_DAA8();
  [v7 setObject:v8 forKey:v9];

  NSString v10 = *(void **)(v4 + 16);
  v12[4] = nullsub_1;
  v12[5] = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = (id)1107296256;
  v12[2] = sub_7850;
  v12[3] = a2;
  v11 = _Block_copy(v12);
  [v10 _setPreferredUnit:v5 forType:v6 completion:v11];
  _Block_release(v11);
}

void sub_6B6C()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  id v3 = (id)v0[8];
  NSString v4 = sub_DAA8();
  id v5 = [v3 stringForKey:v4];

  if (v5)
  {
    sub_DAC8();

    swift_retain();
    NSString v6 = sub_DAA8();
    swift_bridgeObjectRelease();
    id v7 = [self unitFromString:v6];

    v23[0] = v7;
    sub_D9D8();

    swift_release();
  }
  id v8 = (id)v1[8];
  NSString v9 = sub_DAA8();
  id v10 = [v8 stringForKey:v9];

  if (v10)
  {
    sub_DAC8();

    swift_retain();
    NSString v11 = sub_DAA8();
    swift_bridgeObjectRelease();
    id v12 = [self unitFromString:v11];

    v23[0] = v12;
    sub_D9D8();

    swift_release();
  }
  id v13 = (void *)v1[2];
  sub_5A44(&qword_14968);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_E450;
  if (qword_14910 != -1) {
    swift_once();
  }
  id v15 = (void *)qword_14A08;
  *(void *)(inited + 32) = qword_14A08;
  uint64_t v16 = qword_14918;
  id v17 = v15;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v18 = (void *)qword_14A10;
  *(void *)(inited + 40) = qword_14A10;
  sub_DB48();
  id v19 = v18;
  sub_8DEC(inited);
  swift_bridgeObjectRelease();
  sub_5DD8(0, &qword_14C70);
  sub_94DC();
  Class isa = sub_DB78().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v1;
  *(void *)(v21 + 24) = v2;
  v23[4] = sub_957C;
  v23[5] = v21;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256;
  v23[2] = sub_7770;
  v23[3] = &unk_10928;
  NSString v22 = _Block_copy(v23);
  swift_retain();
  swift_release();
  [v13 preferredUnitsForQuantityTypes:isa completion:v22];
  _Block_release(v22);
}

uint64_t sub_6F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a3;
  uint64_t v5 = sub_D9A8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_DA18();
  uint64_t v39 = *(void *)(v9 - 8);
  __chkstk_darwin();
  NSString v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_DA38();
  uint64_t v37 = *(void *)(v12 - 8);
  uint64_t v38 = v12;
  __chkstk_darwin();
  NSString v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_14910 != -1) {
    swift_once();
  }
  id v15 = (id)qword_14A08;
  uint64_t v16 = sub_74D4(v15, a1);

  if (v16)
  {
    uint64_t v35 = v9;
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    if (qword_14918 != -1) {
      swift_once();
    }
    id v19 = (id)qword_14A10;
    id v20 = sub_74D4(v19, a1);

    if (v20)
    {
      sub_5DD8(0, &qword_14C50);
      uint64_t v21 = (void *)sub_DBB8();
      NSString v22 = (void *)swift_allocObject();
      v22[2] = v36;
      v22[3] = v16;
      v22[4] = v20;
      aBlock[4] = (uint64_t)sub_95CC;
      aBlock[5] = (uint64_t)v22;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_6198;
      aBlock[3] = (uint64_t)&unk_10978;
      id v23 = _Block_copy(aBlock);
      swift_retain();
      id v24 = v16;
      id v25 = v20;
      swift_release();
      sub_DA28();
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      sub_93F0(&qword_14C58, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_5A44(&qword_14C60);
      sub_9438();
      uint64_t v26 = v35;
      sub_DC78();
      sub_DBC8();
      _Block_release(v23);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v14, v38);
    }

    uint64_t v5 = v18;
    uint64_t v6 = v17;
  }
  sub_DA48();
  swift_errorRetain();
  swift_errorRetain();
  id v28 = sub_D998();
  os_log_type_t v29 = sub_DB98();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = v6;
    id v31 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v31 = 136315138;
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v32 = sub_DDD8();
      unint64_t v34 = v33;
    }
    else
    {
      unint64_t v34 = 0xE300000000000000;
      uint64_t v32 = 7104878;
    }
    aBlock[10] = sub_78C8(v32, v34, aBlock);
    sub_DC48();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v28, v29, "Failed to retrieve preferred depth units from HealthKit with error %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v8, v5);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void *sub_74D4(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_8C8C((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_DD58();

  if (!v4) {
    return 0;
  }
  sub_5DD8(0, &qword_14C80);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

void sub_75AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  swift_retain();
  sub_D9D8();

  swift_release();
  id v13 = a3;
  id v6 = a3;
  swift_retain();
  sub_D9D8();

  swift_release();
  id v7 = *(id *)(a1 + 64);
  swift_retain();
  sub_D9E8();
  swift_release();
  NSString v8 = [v13 unitString];

  if (!v8)
  {
    sub_DAC8();
    NSString v8 = sub_DAA8();
    swift_bridgeObjectRelease();
  }
  NSString v9 = sub_DAA8();
  [v7 setObject:v8 forKey:v9];

  id v10 = *(id *)(a1 + 64);
  swift_retain();
  sub_D9E8();
  swift_release();
  NSString v11 = [v13 unitString];

  if (!v11)
  {
    sub_DAC8();
    NSString v11 = sub_DAA8();
    swift_bridgeObjectRelease();
  }
  NSString v12 = sub_DAA8();
  [v10 setObject:v11 forKey:v12];
}

void sub_7770(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_5DD8(0, &qword_14C70);
  sub_5DD8(0, &qword_14C80);
  sub_94DC();
  uint64_t v5 = sub_DA58();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_7850(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_78C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_799C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_9628((uint64_t)v12, *a3);
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
      sub_9628((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_95D8((uint64_t)v12);
  return v7;
}

uint64_t sub_799C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_DC58();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_7B58(a5, a6);
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
  uint64_t v8 = sub_DD48();
  if (!v8)
  {
    sub_DD68();
    __break(1u);
LABEL_17:
    uint64_t result = sub_DD98();
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

uint64_t sub_7B58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_7BF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_7DD0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_7DD0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_7BF0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_7D68(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_DD18();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_DD68();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_DB18();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_DD98();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_DD68();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_7D68(uint64_t a1, uint64_t a2)
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
  sub_5A44(&qword_14C88);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_7DD0(char a1, int64_t a2, char a3, char *a4)
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
    sub_5A44(&qword_14C88);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_DD98();
  __break(1u);
  return result;
}

uint64_t sub_7F20(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_DCB8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_5DD8(0, &qword_14C70);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_DCA8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_81C0(v7, result + 1);
    id v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_83B8();
      id v23 = v28;
    }
    else
    {
      id v23 = (void *)v22;
      id v24 = v8;
    }
    sub_8658((uint64_t)v8, v23);
    *unint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_DC18(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_5DD8(0, &qword_14C70);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_DC28();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        id v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_DC28();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_86DC((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_81C0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_5A44(&qword_14C90);
    uint64_t v2 = sub_DCF8();
    uint64_t v14 = v2;
    sub_DC98();
    if (sub_DCC8())
    {
      sub_5DD8(0, &qword_14C70);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_83B8();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_DC18(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_DCC8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_83B8()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_5A44(&qword_14C90);
  uint64_t v3 = sub_DCE8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    id v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                id v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_DC18(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_8658(uint64_t a1, void *a2)
{
  sub_DC18(a2[5]);
  unint64_t result = sub_DC88();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_86DC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_83B8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_8864();
      goto LABEL_14;
    }
    sub_8A10();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_DC18(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_5DD8(0, &qword_14C70);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_DC28();

    if (v12)
    {
LABEL_13:
      sub_DDC8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_DC28();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_8864()
{
  id v1 = v0;
  sub_5A44(&qword_14C90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_DCD8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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

uint64_t sub_8A10()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_5A44(&qword_14C90);
  uint64_t v3 = sub_DCE8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  id v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_DC18(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_8C8C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_DC18(*(void *)(v2 + 40));

  return sub_8CD0(a1, v4);
}

unint64_t sub_8CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_5DD8(0, &qword_14C70);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_DC28();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_DC28();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_8DEC(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_DD88();
    swift_bridgeObjectRelease();
  }
  sub_5DD8(0, &qword_14C70);
  sub_94DC();
  uint64_t result = sub_DB88();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_DD88();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        id v6 = (void *)sub_DD28();
        sub_7F20(&v9, v6);
      }
    }
    else
    {
      char v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_7F20(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_8F40(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_DBD8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[3] = 0x6544646568636143;
  v2[4] = 0xEF74696E55687470;
  v2[5] = 0xD00000000000001ALL;
  v2[6] = 0x800000000000EF40;
  v2[7] = 0;
  v2[9] = 0;
  if (qword_14910 != -1) {
    swift_once();
  }
  id v10 = (id)_HKGenerateDefaultUnitForQuantityType();
  if (!v10)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v23 = v10;
  sub_5A44(&qword_14C38);
  swift_allocObject();
  v2[10] = sub_D9F8();
  if (qword_14918 != -1) {
    swift_once();
  }
  id v11 = (id)_HKGenerateDefaultUnitForQuantityType();
  if (!v11) {
    goto LABEL_10;
  }
  id v23 = v11;
  swift_allocObject();
  v2[11] = sub_D9F8();
  LOBYTE(v23) = 1;
  sub_5A44(&qword_14C40);
  swift_allocObject();
  v2[12] = sub_D9F8();
  v2[8] = a2;
  v2[2] = a1;
  int64_t v12 = self;
  id v13 = a2;
  id v14 = a1;
  id v15 = [v12 defaultCenter];
  id v16 = v14;
  sub_DBE8();

  swift_allocObject();
  swift_weakInit();
  sub_93F0(&qword_14C48, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  uint64_t v17 = sub_DA08();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v3[9] = v17;
  swift_release();
  sub_6288();
  sub_6480();
  sub_6B6C();
  sub_DAC8();
  id v18 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v19 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v20 = [v18 initWithSuiteName:v19];

  if (v20)
  {
    LOBYTE(v23) = objc_msgSend(v20, "hk_BOOLForKey:defaultValue:", kHKPrivacyPreferencesKeyEnableFitnessTracking, 1);
    swift_retain();
    sub_D9D8();

    swift_release();
    return (uint64_t)v3;
  }
LABEL_11:
  uint64_t result = sub_DD78();
  __break(1u);
  return result;
}

uint64_t sub_9390()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_93C8(uint64_t a1)
{
  return sub_5E98(a1, v1);
}

uint64_t sub_93D0()
{
  return sub_6140();
}

uint64_t sub_93D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_93E8()
{
  return swift_release();
}

uint64_t sub_93F0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_9438()
{
  unint64_t result = qword_14C68;
  if (!qword_14C68)
  {
    sub_9494(&qword_14C60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14C68);
  }
  return result;
}

uint64_t sub_9494(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_94DC()
{
  unint64_t result = qword_14C78;
  if (!qword_14C78)
  {
    sub_5DD8(255, &qword_14C70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14C78);
  }
  return result;
}

uint64_t sub_9544()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_957C(uint64_t a1, uint64_t a2)
{
  return sub_6F18(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_9584()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_95CC()
{
  sub_75AC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_95D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_9628(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_9688()
{
  return sub_65F0();
}

uint64_t sub_9690()
{
  return sub_63B8();
}

uint64_t sub_96D8()
{
  uint64_t v1 = OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController____lazy_storage___healthUnitsStore;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController____lazy_storage___healthUnitsStore))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController____lazy_storage___healthUnitsStore);
  }
  else
  {
    uint64_t v3 = v0;
    uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController_healthStore);
    uint64_t v5 = self;
    id v6 = v4;
    id v7 = [v5 standardUserDefaults];
    type metadata accessor for HealthKitSettingsStore();
    swift_allocObject();
    uint64_t v2 = sub_8F40(v6, v7);

    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_97B4(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRelease();
  uint64_t v5 = OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController_common;
  type metadata accessor for DepthSettingsCommon();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)&v3[v5] = v6;
  uint64_t v7 = OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController_healthStore;
  id v8 = objc_allocWithZone((Class)HKHealthStore);
  id v9 = v3;
  *(void *)&v3[v7] = [v8 init];
  *(void *)&v9[OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController____lazy_storage___healthUnitsStore] = 0;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_DD88()) {
    id v10 = (void *)sub_AB28((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    id v10 = &_swiftEmptySetSingleton;
  }
  *(void *)&v9[OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController_subscriptions] = v10;

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for DepthSettingsController();
  id v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", 0, 0);
  sub_96D8();
  swift_retain();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_5A44(&qword_14C38);
  sub_B3D4(&qword_14D28, &qword_14C38);
  sub_DA08();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_D9B8();
  swift_endAccess();
  swift_release();
  sub_96D8();
  swift_retain();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_DA08();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_D9B8();
  swift_endAccess();
  swift_release();

  return v11;
}

void sub_9A80()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong reloadSpecifiers];
  }
}

uint64_t sub_9BC8()
{
  unint64_t v13 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_BA20();
  sub_DB28();
  if (*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v13 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_DB58();
  sub_DB68();
  sub_DB48();
  sub_96D8();
  sub_C498();
  unint64_t v2 = v1;
  swift_release();
  sub_9DF0(v2);
  sub_96D8();
  sub_CA38();
  unint64_t v4 = v3;
  swift_release();
  sub_9DF0(v4);
  uint64_t v12[3] = type metadata accessor for DepthSettingsController();
  v12[0] = v0;
  id v5 = v0;
  uint64_t v6 = NSStringFromSelector("openUserGuide");
  sub_DAC8();

  sub_CF94(v12);
  swift_bridgeObjectRelease();
  sub_95D8((uint64_t)v12);
  sub_DB28();
  if (*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v13 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_DB58();
  sub_DB68();
  sub_DB48();
  unint64_t v7 = v13;
  unint64_t v8 = swift_bridgeObjectRetain();
  sub_9FBC(v8);
  swift_bridgeObjectRelease();
  Class isa = sub_DB38().super.isa;
  swift_bridgeObjectRelease();
  [v5 setSpecifiers:isa];

  uint64_t v10 = sub_9FBC(v7);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_9DF0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_DD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_DD88();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
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
    uint64_t v9 = sub_DD38();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_A7BC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_DD88();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_DB48();
}

uint64_t sub_9FBC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_DD88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  BOOL v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_A62C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_DD28();
        sub_5DD8(0, &qword_14CF8);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_A62C(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_A62C(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_B32C(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_5DD8(0, &qword_14CF8);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_A62C(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_A62C(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_B32C(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_A290(uint64_t a1)
{
  uint64_t v2 = v1;
  NSString v4 = sub_DAA8();
  id v5 = [v1 valueForKey:v4];

  if (v5)
  {
    sub_DC68();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_59DC((uint64_t)v13, (uint64_t)&v14);
  if (!v15)
  {
    sub_B2D0((uint64_t)&v14, &qword_14960);
    goto LABEL_11;
  }
  sub_B32C(&v14, &v16);
  sub_5A44(&qword_14CF0);
  swift_dynamicCast();
  Class isa = sub_D958().super.isa;
  unint64_t v7 = (unint64_t)[v2 indexForIndexPath:isa];

  if ((v11 & 0xC000000000000001) != 0)
  {
    id v8 = (id)sub_DD28();
    goto LABEL_9;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v7 < *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)))
  {
    id v8 = *(id *)(v11 + 8 * v7 + 32);
LABEL_9:
    id v9 = v8;
    swift_bridgeObjectRelease();
    sub_96D8();
    sub_D710(v9);

    swift_release();
LABEL_11:
    Class v10 = sub_D958().super.isa;
    v12.receiver = v2;
    v12.super_class = (Class)type metadata accessor for DepthSettingsController();
    objc_msgSendSuper2(&v12, "tableView:didSelectRowAtIndexPath:", a1, v10);

    return;
  }
  __break(1u);
}

id sub_A568()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthSettingsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DepthSettingsController()
{
  return self;
}

uint64_t sub_A62C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_A64C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_A64C(char a1, int64_t a2, char a3, char *a4)
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
    sub_5A44(&qword_14D00);
    Class v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    Class v10 = (char *)&_swiftEmptyArrayStorage;
  }
  BOOL v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_DD98();
  __break(1u);
  return result;
}

uint64_t sub_A7BC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_DD88();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_DD88();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_B3D4(&qword_14D08, &qword_14CF0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_5A44(&qword_14CF0);
          uint64_t v12 = sub_A9F0(v16, i, a3);
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
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_5DD8(0, &qword_14CF8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_DD98();
  __break(1u);
  return result;
}

void (*sub_A9F0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_AAA0(v6, a2, a3);
  return sub_AA58;
}

void sub_AA58(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_AAA0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_DD28();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_AB20;
  }
  __break(1u);
  return result;
}

void sub_AB20(id *a1)
{
}

unint64_t sub_AB28(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_DD88();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_5A44(&qword_14D10);
      uint64_t result = sub_DD08();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_DD88();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  uint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    uint64_t result = sub_DD28();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    sub_D9C8();
    sub_B33C(&qword_14D18);
    uint64_t result = sub_DA68();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_B33C(&qword_14D20);
      while (1)
      {
        uint64_t result = sub_DA78();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      uint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_ADB4()
{
  uint64_t v1 = OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController_common;
  type metadata accessor for DepthSettingsCommon();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  *(void *)&v0[v1] = v2;
  uint64_t v3 = OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController_healthStore;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)HKHealthStore) init];
  *(void *)&v0[OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController____lazy_storage___healthUnitsStore] = 0;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_DD88()) {
    uint64_t v4 = (void *)sub_AB28((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v4 = &_swiftEmptySetSingleton;
  }
  *(void *)&v0[OBJC_IVAR____TtC22DepthCompanionSettings23DepthSettingsController_subscriptions] = v4;

  sub_DD78();
  __break(1u);
}

uint64_t sub_B268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5A44(&qword_14960);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_B2D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5A44(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_B32C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_B33C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_D9C8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_B380()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_B3B8()
{
}

uint64_t sub_B3D4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_9494(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_B418()
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  sub_DA98();
  type metadata accessor for DepthSettingsCommon();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  sub_D938();
  uint64_t result = sub_DAE8();
  qword_14D30 = result;
  *(void *)algn_14D38 = v3;
  return result;
}

NSNumber sub_B54C()
{
  sub_5DD8(0, &qword_14CE8);
  result.super.super.Class isa = sub_DC08(0).super.super.isa;
  qword_14D40 = (uint64_t)result.super.super.isa;
  return result;
}

uint64_t sub_B594()
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  sub_DA98();
  type metadata accessor for DepthSettingsCommon();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  sub_D938();
  uint64_t result = sub_DAE8();
  qword_14D48 = result;
  unk_14D50 = v3;
  return result;
}

NSNumber sub_B6CC()
{
  sub_5DD8(0, &qword_14CE8);
  result.super.super.Class isa = sub_DC08(1).super.super.isa;
  qword_14D58 = (uint64_t)result.super.super.isa;
  return result;
}

uint64_t sub_B714()
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  sub_DA98();
  type metadata accessor for DepthSettingsCommon();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  sub_D938();
  uint64_t result = sub_DAE8();
  qword_14D60 = result;
  *(void *)algn_14D68 = v3;
  return result;
}

NSNumber sub_B854()
{
  sub_5DD8(0, &qword_14CE8);
  result.super.super.Class isa = sub_DC08(0).super.super.isa;
  qword_14D70 = (uint64_t)result.super.super.isa;
  return result;
}

uint64_t sub_B89C()
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  sub_DA98();
  type metadata accessor for DepthSettingsCommon();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  sub_D938();
  uint64_t result = sub_DAE8();
  qword_14D78 = result;
  unk_14D80 = v3;
  return result;
}

NSNumber sub_B9D8()
{
  sub_5DD8(0, &qword_14CE8);
  result.super.super.Class isa = sub_DC08(1).super.super.isa;
  qword_14D88 = (uint64_t)result.super.super.isa;
  return result;
}

void sub_BA20()
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  uint64_t v0 = self;
  NSString v1 = sub_DAA8();
  id v2 = [v0 groupSpecifierWithID:v1];

  if (v2)
  {
    type metadata accessor for SettingsHeaderView();
    uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v4)
    {
      sub_DAC8();
      uint64_t v4 = (NSString *)sub_DAA8();
      swift_bridgeObjectRelease();
    }
    [v2 setProperty:v4 forKey:PSHeaderCellClassGroupKey];

    uint64_t v5 = swift_getObjCClassFromMetadata();
    uint64_t v6 = self;
    id v7 = [v6 bundleForClass:v5];
    NSString v8 = sub_DAA8();
    id v9 = [self imageNamed:v8 inBundle:v7];

    [v2 setProperty:v9 forKey:PSIconImageKey];
    sub_DA98();
    type metadata accessor for DepthSettingsCommon();
    uint64_t v10 = swift_getObjCClassFromMetadata();
    id v11 = [v6 bundleForClass:v10];
    sub_D938();
    sub_DAE8();
    NSString v12 = sub_DAA8();
    swift_bridgeObjectRelease();
    [v2 setProperty:v12 forKey:PSTitleKey];

    sub_DA98();
    id v13 = [v6 bundleForClass:v10];
    sub_D938();
    sub_DAE8();
    NSString v14 = sub_DAA8();
    swift_bridgeObjectRelease();
    [v2 setProperty:v14 forKey:PSStaticHeaderTextKey];
  }
  else
  {
    __break(1u);
  }
}

void sub_BDC8()
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  NSString v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    sub_5DD8(0, &qword_14C70);
    Class isa = sub_DBA8(HKQuantityTypeIdentifierUnderwaterDepth).super.super.super.isa;
    id v2 = (id)_HKGenerateDefaultUnitForQuantityType();

    if (!v2) {
      id v2 = [self meterUnit];
    }
  }
  id v4 = v1;
  id v5 = [v2 unitString];
  uint64_t v6 = sub_DAC8();
  uint64_t v8 = v7;

  id v9 = [self meterUnit];
  id v10 = [v9 unitString];

  uint64_t v11 = sub_DAC8();
  uint64_t v13 = v12;

  if (v6 == v11 && v8 == v13)
  {
    swift_bridgeObjectRelease_n();
    unint64_t v14 = 0xE100000000000000;
    uint64_t v15 = 77;
  }
  else
  {
    char v16 = sub_DDB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v16) {
      uint64_t v15 = 77;
    }
    else {
      uint64_t v15 = 21574;
    }
    if (v16) {
      unint64_t v14 = 0xE100000000000000;
    }
    else {
      unint64_t v14 = 0xE200000000000000;
    }
  }
  id v17 = [self sharedInstance];
  if (!v17)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v18 = v17;
  id v19 = [v17 getActivePairedDevice];

  if (!v19)
  {
LABEL_28:
    __break(1u);
    return;
  }
  id v20 = [v19 valueForProperty:NRDevicePropertyAbsoluteDepthLimit];

  if (v20)
  {
    sub_DC68();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v40, 0, sizeof(v40));
  }
  sub_59DC((uint64_t)v40, (uint64_t)v41);
  if (!v42)
  {
    swift_bridgeObjectRelease();
    sub_5A88((uint64_t)v41);
LABEL_25:
    sub_DB98();
    sub_5DD8(0, &qword_14E98);
    unint64_t v34 = (void *)sub_DC38();
    sub_D988();

    return;
  }
  sub_5DD8(0, &qword_14CE8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  Class v21 = sub_DC08(6).super.super.isa;
  char v22 = sub_DC28();

  sub_5A44(&qword_14E88);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_E4F0;
  *(void *)(v23 + 56) = &type metadata for String;
  *(void *)(v23 + 64) = sub_D6BC();
  *(void *)(v23 + 32) = v15;
  *(void *)(v23 + 40) = v14;
  sub_DAD8();
  if (v22)
  {
    type metadata accessor for DepthSettingsCommon();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    unint64_t v25 = self;
    id v26 = [v25 bundleForClass:ObjCClassFromMetadata];
    NSString v27 = sub_DAA8();
    NSString v28 = sub_DAA8();
    id v29 = [v26 localizedStringForKey:v27 value:0 table:v28];

    sub_DAC8();
    swift_bridgeObjectRelease();

    id v30 = [v25 bundleForClass:ObjCClassFromMetadata];
    NSString v31 = sub_DAA8();
    NSString v32 = sub_DAA8();
    id v33 = [v30 localizedStringForKey:v31 value:0 table:v32];

    sub_DAC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_DA98();
    type metadata accessor for DepthSettingsCommon();
    uint64_t v35 = swift_getObjCClassFromMetadata();
    uint64_t v36 = self;
    id v37 = [v36 bundleForClass:v35];
    sub_D938();
    sub_DAE8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_DA98();
    id v38 = [v36 bundleForClass:v35];
    sub_D938();
    sub_DAE8();
    swift_bridgeObjectRelease();
  }
}

void sub_C498()
{
  uint64_t v1 = v0;
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  NSString v2 = sub_DAA8();
  uint64_t v3 = self;
  sub_DA98();
  type metadata accessor for DepthSettingsCommon();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = [self bundleForClass:ObjCClassFromMetadata];
  sub_D938();
  sub_DAE8();
  NSString v6 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v7 = [v3 groupSpecifierWithID:v2 name:v6];

  if (!v7)
  {
    __break(1u);
    return;
  }
  sub_5DD8(0, &qword_14CE8);
  Class isa = sub_DBF8(1).super.super.isa;
  [v7 setProperty:isa forKey:PSIsRadioGroupKey];

  if (qword_14920 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_14D30;
  uint64_t v10 = *(void *)algn_14D38;
  if (qword_14928 != -1) {
    swift_once();
  }
  sub_D510(v9, v10, 0xD000000000000010, 0x800000000000F560, qword_14D40);
  uint64_t v12 = v11;
  if (qword_14930 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_14D48;
  uint64_t v14 = unk_14D50;
  if (qword_14938 != -1) {
    swift_once();
  }
  sub_D510(v13, v14, 0xD000000000000012, 0x800000000000F580, qword_14D58);
  char v16 = v15;
  swift_retain();
  sub_D9E8();
  swift_release();
  id v17 = self;
  id v18 = v29;
  id v19 = [v17 footUnit];
  sub_5DD8(0, &qword_14C80);
  char v20 = sub_DC28();

  if (v20)
  {

    Class v21 = &qword_14D40;
    char v22 = v12;
LABEL_14:
    [v7 setProperty:v22 forKey:PSRadioGroupCheckedSpecifierKey];
    [v7 setProperty:*v21 forKey:PSValueKey];
    goto LABEL_15;
  }
  id v23 = [v17 meterUnit];
  char v24 = sub_DC28();

  if (v24)
  {
    Class v21 = &qword_14D58;
    char v22 = v16;
    goto LABEL_14;
  }
LABEL_15:
  swift_retain();
  sub_D9E8();
  swift_release();
  unint64_t v25 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v29;

  id v26 = v7;
  sub_DB28();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_DB58();
  }
  sub_DB68();
  sub_DB48();
  id v27 = v12;
  sub_DB28();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_DB58();
  }
  sub_DB68();
  sub_DB48();
  id v28 = v16;
  sub_DB28();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_DB58();
  }
  sub_DB68();
  sub_DB48();
}

void sub_CA38()
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  uint64_t v0 = self;
  NSString v1 = sub_DAA8();
  sub_DA98();
  type metadata accessor for DepthSettingsCommon();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  sub_D938();
  sub_DAE8();
  NSString v4 = sub_DAA8();
  swift_bridgeObjectRelease();
  id v5 = [v0 groupSpecifierWithID:v1 name:v4];

  if (!v5)
  {
    __break(1u);
    return;
  }
  sub_5DD8(0, &qword_14CE8);
  Class isa = sub_DBF8(1).super.super.isa;
  [v5 setProperty:isa forKey:PSIsRadioGroupKey];

  if (qword_14940 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_14D60;
  uint64_t v8 = *(void *)algn_14D68;
  if (qword_14948 != -1) {
    swift_once();
  }
  sub_D510(v7, v8, 0xD000000000000022, 0x800000000000F510, qword_14D70);
  uint64_t v10 = v9;
  if (qword_14950 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_14D78;
  uint64_t v12 = unk_14D80;
  if (qword_14958 != -1) {
    swift_once();
  }
  sub_D510(v11, v12, 0xD00000000000001FLL, 0x800000000000F540, qword_14D88);
  uint64_t v14 = v13;
  swift_retain();
  sub_D9E8();
  swift_release();
  uint64_t v15 = self;
  id v16 = v26;
  id v17 = [v15 degreeFahrenheitUnit];
  sub_5DD8(0, &qword_14C80);
  char v18 = sub_DC28();

  if (v18)
  {

    id v19 = &qword_14D70;
    char v20 = v10;
LABEL_14:
    [v5 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
    [v5 setProperty:*v19 forKey:PSValueKey];
    goto LABEL_15;
  }
  id v21 = [v15 degreeCelsiusUnit];
  char v22 = sub_DC28();

  if (v22)
  {
    id v19 = &qword_14D88;
    char v20 = v14;
    goto LABEL_14;
  }
LABEL_15:
  id v23 = v5;
  sub_DB28();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_DB58();
  }
  sub_DB68();
  sub_DB48();
  id v24 = v10;
  sub_DB28();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_DB58();
  }
  sub_DB68();
  sub_DB48();
  id v25 = v14;
  sub_DB28();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_DB58();
  }
  sub_DB68();
  sub_DB48();
}

void sub_CF94(void *a1)
{
  sub_D948();
  __chkstk_darwin();
  sub_DA88();
  __chkstk_darwin();
  sub_BDC8();
  uint64_t v3 = v2;
  uint64_t v30 = v1;
  if (v1)
  {
    uint64_t v4 = v1;
    type metadata accessor for DepthSettingsCommon();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v6 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v7 = sub_DAA8();
    NSString v8 = sub_DAA8();
    id v9 = [v6 localizedStringForKey:v7 value:0 table:v8];

    sub_DAC8();
    sub_5A44(&qword_14E88);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_E4F0;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_D6BC();
    *(void *)(v10 + 32) = v3;
    *(void *)(v10 + 40) = v4;
    swift_bridgeObjectRetain();
    sub_DAB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_DA98();
    type metadata accessor for DepthSettingsCommon();
    uint64_t v12 = swift_getObjCClassFromMetadata();
    id v13 = [self bundleForClass:v12];
    sub_D938();
    sub_DAE8();
  }
  NSString v11 = sub_DAA8();
  swift_bridgeObjectRelease();
  uint64_t v14 = self;
  NSString v15 = sub_DAA8();
  id v16 = [v14 groupSpecifierWithID:v15];

  if (v16)
  {
    sub_DA98();
    type metadata accessor for DepthSettingsCommon();
    uint64_t v17 = swift_getObjCClassFromMetadata();
    id v18 = [self bundleForClass:v17];
    sub_D938();
    sub_DAE8();
    NSString v19 = sub_DAA8();
    swift_bridgeObjectRelease();
    id v20 = [v11 rangeOfString:v19];
    NSUInteger v22 = v21;

    v32.location = (NSUInteger)v20;
    v32.length = v22;
    id v23 = NSStringFromRange(v32);
    if (!v23)
    {
      sub_DAC8();
      id v23 = (NSString *)sub_DAA8();
      swift_bridgeObjectRelease();
    }
    sub_5DD8(0, &qword_14E80);
    id v24 = (objc_class *)swift_getObjCClassFromMetadata();
    id v25 = NSStringFromClass(v24);
    if (!v25)
    {
      sub_DAC8();
      id v25 = (NSString *)sub_DAA8();
      swift_bridgeObjectRelease();
    }
    [v16 setProperty:v25 forKey:PSFooterCellClassGroupKey];

    [v16 setProperty:v11 forKey:PSFooterHyperlinkViewTitleKey];
    [v16 setProperty:v23 forKey:PSFooterHyperlinkViewLinkRangeKey];

    sub_D678(a1, a1[3]);
    uint64_t v26 = sub_DDA8();
    id v27 = [self valueWithNonretainedObject:v26];
    swift_unknownObjectRelease();
    [v16 setProperty:v27 forKey:PSFooterHyperlinkViewTargetKey];

    NSString v28 = sub_DAA8();
    id v29 = PSFooterHyperlinkViewActionKey;
    [v16 setProperty:v28 forKey:v29];

    if (v30) {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_D510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = self;
  NSString v8 = sub_DAA8();
  id v9 = [v7 preferenceSpecifierNamed:v8 target:v5 set:0 get:0 detail:0 cell:3 edit:0];

  if (v9)
  {
    NSString v10 = sub_DAA8();
    [v9 setProperty:v10 forKey:PSIDKey];

    [v9 setProperty:a5 forKey:PSValueKey];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_D61C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DepthSettingsCommon()
{
  return self;
}

void *sub_D678(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_D6BC()
{
  unint64_t result = qword_14E90;
  if (!qword_14E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14E90);
  }
  return result;
}

void sub_D710(void *a1)
{
  id v1 = [a1 identifier];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_DAC8();
    uint64_t v5 = v4;

    if (v3 == 0xD000000000000010 && v5 == 0x800000000000F560 || (sub_DDB8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_673C();
      return;
    }
    if (v3 == 0xD000000000000012 && v5 == 0x800000000000F580 || (sub_DDB8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_6750();
      return;
    }
    if (v3 == 0xD000000000000022 && v5 == 0x800000000000F510 || (sub_DDB8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_6954();
      return;
    }
    if (v3 == 0xD00000000000001FLL && v5 == 0x800000000000F540)
    {
      swift_bridgeObjectRelease();
LABEL_19:
      sub_6968();
      return;
    }
    char v6 = sub_DDB8();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_19;
    }
  }
}

uint64_t sub_D8D4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_D908(NSURL *retstr@<X8>)
{
}

uint64_t sub_D918()
{
  return URL.init(string:)();
}

uint64_t sub_D928()
{
  return type metadata accessor for URL();
}

uint64_t sub_D938()
{
  return static Locale.current.getter();
}

uint64_t sub_D948()
{
  return type metadata accessor for Locale();
}

NSIndexPath sub_D958()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_D968()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D978()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_D988()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_D998()
{
  return Logger.logObject.getter();
}

uint64_t sub_D9A8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_D9B8()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_D9C8()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_D9D8()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t sub_D9E8()
{
  return CurrentValueSubject.value.getter();
}

uint64_t sub_D9F8()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t sub_DA08()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_DA18()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_DA28()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_DA38()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_DA48()
{
  return static DepthLog.default.getter();
}

uint64_t sub_DA58()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DA68()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_DA78()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_DA88()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_DA98()
{
  return String.LocalizationValue.init(_:)();
}

NSString sub_DAA8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_DAB8()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_DAC8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DAD8()
{
  return String.init(format:_:)();
}

uint64_t sub_DAE8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_DAF8()
{
  return String.utf8CString.getter();
}

void sub_DB08(Swift::String a1)
{
}

Swift::Int sub_DB18()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_DB28()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_DB38()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_DB48()
{
  return specialized Array._endMutation()();
}

uint64_t sub_DB58()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_DB68()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSSet sub_DB78()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_DB88()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_DB98()
{
  return static os_log_type_t.error.getter();
}

HKQuantityType sub_DBA8(HKQuantityTypeIdentifier a1)
{
  return HKQuantityType.init(_:)(a1);
}

uint64_t sub_DBB8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_DBC8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_DBD8()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_DBE8()
{
  return NSNotificationCenter.publisher(for:object:)();
}

NSNumber sub_DBF8(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_DC08(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_DC18(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_DC28()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_DC38()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_DC48()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_DC58()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_DC68()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_DC78()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_DC88()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_DC98()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_DCA8()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_DCB8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_DCC8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_DCD8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_DCE8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_DCF8()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_DD08()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_DD18()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_DD28()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_DD38()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_DD48()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_DD58()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_DD68()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_DD78()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_DD88()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_DD98()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_DDA8()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_DDB8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_DDC8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_DDD8()
{
  return Error.localizedDescription.getter();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKGenerateDefaultUnitForQuantityType()
{
  return __HKGenerateDefaultUnitForQuantityType();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}