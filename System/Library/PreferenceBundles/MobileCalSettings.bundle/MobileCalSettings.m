void sub_544C(uint64_t a1)
{
  void block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_54C4;
  block[3] = &unk_1C8D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_54C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 216);
  *(void *)(v1 + 216) = 0;
}

void sub_57C0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 240) setPermission:0];
  [*(id *)(*(void *)(a1 + 32) + 192) updateGrantedDelegate:*(void *)(*(void *)(a1 + 32) + 240) action:1 source:*(void *)(*(void *)(a1 + 32) + 232) completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
  [WeakRetained didModifyDelegate:*(void *)(*(void *)(a1 + 32) + 240)];

  id v4 = [*(id *)(a1 + 32) navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

id sub_6B54(uint64_t a1)
{
  id result = +[CalLocationAuthorization ttlLocationStatus];
  uint64_t v3 = *(void *)(a1 + 32);
  if (result != *(id *)(v3 + 240))
  {
    *(void *)(v3 + 240) = result;
    id v4 = *(void **)(a1 + 32);
    return _[v4 _travelAdvisoriesEnabledChanged];
  }
  return result;
}

void sub_8320(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 isEqualToString:&stru_1CE38])
  {
    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = *(void **)(a1 + 40);
    v5 = [v3 localizedStringForKey:@"Alternate Calendar Off" value:@"Off" table:@"MobileCalSettings"];
    [v4 addObject:v5];
  }
  else
  {
    uint64_t v3 = +[CUIKDateStrings overlayCalendarPickerDisplayNameForCalendarWithIdentifier:v6];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

BOOL sub_90B0(id a1, EKSource *a2, NSDictionary *a3)
{
  return ![(EKSource *)a2 isDelegate];
}

BOOL sub_9A20(id a1, EKSource *a2, NSDictionary *a3)
{
  uint64_t v3 = a2;
  id v4 = [(EKSource *)v3 constraints];
  if ([v4 supportsDelegation]) {
    unsigned int v5 = ![(EKSource *)v3 isDelegate];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

BOOL sub_9B0C(id a1, EKSource *a2, NSDictionary *a3)
{
  uint64_t v3 = a2;
  if ([(EKSource *)v3 isEnabled]) {
    unsigned __int8 v4 = [(EKSource *)v3 isWritable];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

int64_t sub_ADE4(id a1, CalGrantedDelegate *a2, CalGrantedDelegate *a3)
{
  unsigned __int8 v4 = a3;
  unsigned int v5 = [(CalGrantedDelegate *)a2 displayName];
  id v6 = [(CalGrantedDelegate *)v4 displayName];

  id v7 = [v5 caseInsensitiveCompare:v6];
  return (int64_t)v7;
}

void sub_B38C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_B428;
  v5[3] = &unk_1CAB8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

id sub_B428(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
  uint64_t v2 = [*(id *)(a1 + 40) sortedArrayUsingComparator:&stru_1CA90];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = v2;

  unsigned int v5 = *(void **)(a1 + 32);
  if (!v5[24])
  {
    v5[24] = &__NSArray0__struct;

    unsigned int v5 = *(void **)(a1 + 32);
  }

  return [v5 reloadSpecifiers];
}

int64_t sub_B534(id a1, EKSource *a2, EKSource *a3)
{
  uint64_t v3 = a3;
  id v4 = CUIKDisplayedTitleForSource();
  unsigned int v5 = CUIKDisplayedTitleForSource();

  id v6 = [v4 caseInsensitiveCompare:v5];
  return (int64_t)v6;
}

void sub_C100(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C178;
  block[3] = &unk_1C8D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_C178(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadGrantedDelegates];
}

id sub_C3D8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uri];
  id v4 = [*(id *)(a1 + 32) uri];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

BOOL sub_CE6C(id a1, CNAutocompleteResult *a2, NSDictionary *a3)
{
  uint64_t v3 = a2;
  BOOL v4 = ([(CNAutocompleteResult *)v3 sourceType] & 0x40) != 0
    && [(CNAutocompleteResult *)v3 resultType] == 0;

  return v4;
}

id sub_CEB8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) addObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_D090(id a1)
{
  id v1 = +[UIApplication sharedApplication];
  [v1 setNetworkActivityIndicatorVisible:0];
}

void sub_D158(id a1)
{
  id v1 = +[UIApplication sharedApplication];
  [v1 setNetworkActivityIndicatorVisible:1];
}

BOOL sub_E1A8(id a1, EKSource *a2, NSDictionary *a3)
{
  uint64_t v3 = a2;
  if ([(EKSource *)v3 isDelegate])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [(EKSource *)v3 constraints];
    unsigned __int8 v4 = [v5 supportsDelegation];
  }
  return v4;
}

int64_t sub_E41C(id a1, EKSource *a2, EKSource *a3)
{
  uint64_t v3 = a3;
  unsigned __int8 v4 = CUIKDisplayedTitleForSource();
  id v5 = CUIKDisplayedTitleForSource();

  id v6 = [v4 compare:v5];
  return (int64_t)v6;
}

void CSLogInitialize()
{
  if (qword_23F30[0] != -1) {
    dispatch_once(qword_23F30, &stru_1CC48);
  }
}

void sub_FC50(id a1)
{
  kCSLogHandle = (uint64_t)os_log_create(settingsSubsystem, "CalendarSettings");

  _objc_release_x1();
}

void sub_FC94(void *a1)
{
  v28 = a1;
  uint64_t v2 = sub_10D3C(&qword_23E48);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  uint64_t v31 = v3;
  __chkstk_darwin();
  v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_11A90();
  __chkstk_darwin();
  sub_11B30();
  __chkstk_darwin();
  [v1 setSelectionStyle:0];
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = [self bundleForClass:ObjCClassFromMetadata];
  sub_11B20();
  id v7 = v6;
  sub_11A80();
  uint64_t v27 = sub_11BA0();
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_11C10(23);
  swift_bridgeObjectRelease();
  uint64_t v38 = 0xD000000000000015;
  unint64_t v39 = 0x800000000001B5C0;
  id v8 = [self currentDevice];
  id v9 = [v8 userInterfaceIdiom];

  if (v9) {
    v10._countAndFlagsBits = 0x6231383564617069;
  }
  else {
    v10._countAndFlagsBits = 0x6562373363687069;
  }
  if (v9) {
    v11 = (void *)0xEC00000063623065;
  }
  else {
    v11 = (void *)0xEC00000036313032;
  }
  v10._object = v11;
  sub_11BC0(v10);
  swift_bridgeObjectRelease();
  uint64_t v12 = v38;
  unint64_t v13 = v39;
  sub_11B20();
  id v14 = v7;
  sub_11A80();
  uint64_t v15 = sub_11B90();
  uint64_t v17 = v16;
  sub_10D3C(&qword_23E50);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_19CE0;
  *(void *)(v18 + 56) = &type metadata for String;
  *(void *)(v18 + 64) = sub_1100C();
  *(void *)(v18 + 32) = v12;
  *(void *)(v18 + 40) = v13;
  uint64_t v19 = sub_11B80();
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  v22 = (void *)swift_allocObject();
  v23 = v28;
  v22[2] = v28;
  v22[3] = v15;
  v22[4] = v17;
  uint64_t v32 = v15;
  uint64_t v33 = v17;
  uint64_t v34 = v19;
  uint64_t v35 = v21;
  v36 = sub_110A0;
  v37 = v22;
  id v24 = v23;
  swift_bridgeObjectRetain();
  sub_10D3C(&qword_23E60);
  sub_11810(&qword_23E68, &qword_23E60);
  v25 = v29;
  sub_11AB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_11AC0();
  uint64_t v26 = v30;
  uint64_t v40 = v30;
  uint64_t v41 = sub_11810(&qword_23E70, &qword_23E48);
  sub_111B4(&v38);
  sub_11AA0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v26);
  sub_11BD0();
  swift_release();
}

void sub_101B0(void *a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_11AD0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v9 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_11AF0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  unint64_t v13 = (char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v44 = a1;
    if ([v44 target])
    {
      self;
      id v14 = (void *)swift_dynamicCastObjCClass();
      if (v14)
      {
        id v39 = [v14 navigationItem];
        id v15 = [objc_allocWithZone((Class)UILabel) init];
        v38[1] = a2;
        uint64_t v16 = v15;
        uint64_t v17 = self;
        NSString v18 = sub_11B40();
        uint64_t v42 = v10;
        uint64_t v19 = v18;
        id v20 = [v17 preferredFontForTextStyle:v18];

        [v16 setFont:v20];
        sub_10D3C(&qword_23E90);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_19CE0;
        uint64_t v41 = v7;
        *(void *)(inited + 32) = NSForegroundColorAttributeName;
        uint64_t v22 = self;
        uint64_t v40 = v11;
        v23 = (void *)v22;
        id v43 = v16;
        swift_bridgeObjectRetain();
        id v24 = NSForegroundColorAttributeName;
        id v25 = [v23 labelColor];
        id v26 = [v25 colorWithAlphaComponent:a3];

        *(void *)(inited + 64) = sub_1176C(0, &qword_23E98);
        *(void *)(inited + 40) = v26;
        sub_107D0(inited, &qword_23EC8, &qword_23ED0, (uint64_t (*)(uint64_t))sub_114AC);
        id v27 = objc_allocWithZone((Class)NSAttributedString);
        NSString v28 = sub_11B40();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_11724(&qword_23EA0, type metadata accessor for Key);
        Class isa = sub_11B10().super.isa;
        swift_bridgeObjectRelease();
        id v30 = [v27 initWithString:v28 attributes:isa];

        id v31 = v43;
        [v43 setAttributedText:v30];

        sub_1176C(0, &qword_23EA8);
        uint64_t v32 = (void *)sub_11BE0();
        uint64_t v33 = swift_allocObject();
        uint64_t v34 = v39;
        *(void *)(v33 + 16) = v39;
        *(void *)(v33 + 24) = v31;
        aBlock[4] = sub_117E8;
        aBlock[5] = v33;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_10900;
        aBlock[3] = &unk_1CDC0;
        uint64_t v35 = _Block_copy(aBlock);
        id v36 = v34;
        swift_release();
        sub_11AE0();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_11724(&qword_23EB0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_10D3C(&qword_23EB8);
        sub_11810(&qword_23EC0, &qword_23EB8);
        sub_11C00();
        sub_11BF0();

        _Block_release(v35);
        swift_unknownObjectRelease();

        (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v6);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v42);
        return;
      }
      swift_unknownObjectRelease();
    }
    id v37 = v44;
  }
}

unint64_t sub_107D0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10D3C(a2);
  uint64_t v7 = sub_11C20();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_11854(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_11540(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10900(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10944()
{
  id v0 = [self sharedApplication];
  sub_11A70(v1);
  uint64_t v3 = v2;
  sub_107D0((uint64_t)&_swiftEmptyArrayStorage, &qword_23E80, &qword_23E88, (uint64_t (*)(uint64_t))sub_114AC);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_11724(&qword_23E78, type metadata accessor for OpenExternalURLOptionsKey);
  Class isa = sub_11B10().super.isa;
  swift_bridgeObjectRelease();
  [v0 openURL:v3 options:isa completionHandler:0];
}

id sub_10AE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    NSString v10 = sub_11B40();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, "initWithStyle:reuseIdentifier:specifier:", a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_10CE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CSCalendarSettingsPlacardCell()
{
  return self;
}

uint64_t sub_10D3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10D80(uint64_t a1, uint64_t a2)
{
  return sub_10F00(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10DA4(uint64_t a1, uint64_t a2)
{
  return sub_10F00(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10DC4(uint64_t a1, id *a2)
{
  uint64_t result = sub_11B50();
  *a2 = 0;
  return result;
}

uint64_t sub_10E3C(uint64_t a1, id *a2)
{
  char v3 = sub_11B60();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10EBC@<X0>(void *a1@<X8>)
{
  sub_11B70();
  NSString v2 = sub_11B40();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10F00(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_11B70();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10F44()
{
  sub_11B70();
  sub_11BB0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10F98()
{
  sub_11B70();
  sub_11C50();
  sub_11BB0();
  Swift::Int v0 = sub_11C60();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1100C()
{
  unint64_t result = qword_23E58;
  if (!qword_23E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23E58);
  }
  return result;
}

uint64_t sub_11060()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_110A0(double a1)
{
  sub_101B0(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_110AC()
{
  return sub_11B00();
}

uint64_t sub_1116C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_111B4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

uint64_t sub_11230()
{
  uint64_t v0 = sub_11B70();
  uint64_t v2 = v1;
  if (v0 == sub_11B70() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_11C40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_112C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_11B70();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_112EC(uint64_t a1)
{
  uint64_t v2 = sub_11724(&qword_23EA0, type metadata accessor for Key);
  uint64_t v3 = sub_11724(&qword_23F18, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_113A8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_11B40();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_113F0(uint64_t a1)
{
  uint64_t v2 = sub_11724(&qword_23E78, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_11724((unint64_t *)&unk_23F20, type metadata accessor for OpenExternalURLOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_114AC(uint64_t a1)
{
  sub_11B70();
  sub_11C50();
  sub_11BB0();
  Swift::Int v2 = sub_11C60();
  swift_bridgeObjectRelease();

  return sub_11550(a1, v2);
}

_OWORD *sub_11540(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_11550(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_11B70();
    uint64_t v8 = v7;
    if (v6 == sub_11B70() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_11C40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_11B70();
          uint64_t v15 = v14;
          if (v13 == sub_11B70() && v15 == v16) {
            break;
          }
          char v18 = sub_11C40();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_116DC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_11724(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1176C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_117A8()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_117E8()
{
  return [*(id *)(v0 + 16) setTitleView:*(void *)(v0 + 24)];
}

uint64_t sub_117F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_11808()
{
  return swift_release();
}

uint64_t sub_11810(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1116C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_11854(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10D3C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_118B8()
{
  return sub_11724(&qword_23EE8, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_11900()
{
  return sub_11724(&qword_23EF0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_11948()
{
  return sub_11724(&qword_23EF8, type metadata accessor for Key);
}

uint64_t sub_11990()
{
  return sub_11724(&qword_23F00, type metadata accessor for Key);
}

uint64_t sub_119D8()
{
  return sub_11724(&qword_23F08, type metadata accessor for Key);
}

uint64_t sub_11A20()
{
  return sub_11724(&qword_23F10, type metadata accessor for OpenExternalURLOptionsKey);
}

void sub_11A70(NSURL *retstr@<X8>)
{
}

uint64_t sub_11A80()
{
  return static Locale.current.getter();
}

uint64_t sub_11A90()
{
  return type metadata accessor for Locale();
}

uint64_t sub_11AA0()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_11AB0()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_11AC0()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_11AD0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_11AE0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_11AF0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_11B00()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:applicationBundleIdentifier:updateNavigationTitleAlpha:linkAction:)();
}

NSDictionary sub_11B10()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_11B20()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_11B30()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_11B40()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_11B50()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_11B60()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_11B70()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_11B80()
{
  return String.init(format:_:)();
}

uint64_t sub_11B90()
{
  return String.init(localized:defaultValue:table:bundle:locale:comment:)();
}

uint64_t sub_11BA0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_11BB0()
{
  return String.hash(into:)();
}

void sub_11BC0(Swift::String a1)
{
}

uint64_t sub_11BD0()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_11BE0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_11BF0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_11C00()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_11C10(Swift::Int a1)
{
}

uint64_t sub_11C20()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_11C40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_11C50()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_11C60()
{
  return Hasher._finalize()();
}

void CFRelease(CFTypeRef cf)
{
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return _CFTimeZoneCreateWithName(allocator, name, tryAbbrev);
}

CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz)
{
  return _CFTimeZoneGetName(tz);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CUIKDisplayedTitleForCalendar()
{
  return _CUIKDisplayedTitleForCalendar();
}

uint64_t CUIKDisplayedTitleForSource()
{
  return _CUIKDisplayedTitleForSource();
}

uint64_t CUIKDurationStringForTimeInterval()
{
  return _CUIKDurationStringForTimeInterval();
}

uint64_t CUIKStringForDayOfWeek()
{
  return _CUIKStringForDayOfWeek();
}

uint64_t CalAlertInviteeDeclines()
{
  return _CalAlertInviteeDeclines();
}

uint64_t CalCopyDefaultTimeZoneSetting()
{
  return _CalCopyDefaultTimeZoneSetting();
}

uint64_t CalSetDefaultTimeZone()
{
  return _CalSetDefaultTimeZone();
}

uint64_t CalStringForRelativeOffset()
{
  return _CalStringForRelativeOffset();
}

uint64_t EKUIHasFallbackSizingContext()
{
  return _EKUIHasFallbackSizingContext();
}

uint64_t EKUIPopFallbackSizingContextWithViewHierarchy()
{
  return _EKUIPopFallbackSizingContextWithViewHierarchy();
}

uint64_t EKUIPushFallbackSizingContextWithViewHierarchy()
{
  return _EKUIPushFallbackSizingContextWithViewHierarchy();
}

uint64_t EKUIUseLargeFormatPhoneUI()
{
  return _EKUIUseLargeFormatPhoneUI();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

uint64_t PSCityForSpecifier()
{
  return _PSCityForSpecifier();
}

uint64_t PSCityForTimeZone()
{
  return _PSCityForTimeZone();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return _[a1 _accountStore];
}

id objc_msgSend__alarmTitlesForAllDay_shortened_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alarmTitlesForAllDay:shortened:");
}

id objc_msgSend__alarmValuesForAllDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alarmValuesForAllDay:");
}

id objc_msgSend__canChangeDefaultCalendar(void *a1, const char *a2, ...)
{
  return _[a1 _canChangeDefaultCalendar];
}

id objc_msgSend__canChangeNotificationSetting(void *a1, const char *a2, ...)
{
  return _[a1 _canChangeNotificationSetting];
}

id objc_msgSend__countOfAccountsSyncingCalendars(void *a1, const char *a2, ...)
{
  return _[a1 _countOfAccountsSyncingCalendars];
}

id objc_msgSend__createAllCommonSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _createAllCommonSpecifiers];
}

id objc_msgSend__defaultAlarmChanged(void *a1, const char *a2, ...)
{
  return _[a1 _defaultAlarmChanged];
}

id objc_msgSend__defaultBirthdaysAlarmChanged(void *a1, const char *a2, ...)
{
  return _[a1 _defaultBirthdaysAlarmChanged];
}

id objc_msgSend__defaultEventDurationForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultEventDurationForIdentifier:");
}

id objc_msgSend__defaultEventDurationIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _defaultEventDurationIdentifiers];
}

id objc_msgSend__defaultEventDurationLocalizedStrings(void *a1, const char *a2, ...)
{
  return _[a1 _defaultEventDurationLocalizedStrings];
}

id objc_msgSend__eventStore(void *a1, const char *a2, ...)
{
  return _[a1 _eventStore];
}

id objc_msgSend__freeSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _freeSpecifiers];
}

id objc_msgSend__grantedDelegateFromAutocompleteResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_grantedDelegateFromAutocompleteResult:");
}

id objc_msgSend__localeSpecificLocalizedOneMonthSyncTitleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localeSpecificLocalizedOneMonthSyncTitleWithBundle:");
}

id objc_msgSend__localeSpecificLocalizedSixMonthsSyncTitleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localeSpecificLocalizedSixMonthsSyncTitleWithBundle:");
}

id objc_msgSend__localeSpecificLocalizedThreeMonthsSyncTitleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localeSpecificLocalizedThreeMonthsSyncTitleWithBundle:");
}

id objc_msgSend__localeSpecificLocalizedTwoWeeksSyncTitleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localeSpecificLocalizedTwoWeeksSyncTitleWithBundle:");
}

id objc_msgSend__localizedNoLimitSyncTitleInBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedNoLimitSyncTitleInBundle:");
}

id objc_msgSend__localizedOneMonthSyncTitleOverrideInBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedOneMonthSyncTitleOverrideInBundle:");
}

id objc_msgSend__numbersForWeekdays(void *a1, const char *a2, ...)
{
  return _[a1 _numbersForWeekdays];
}

id objc_msgSend__refreshAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _refreshAccounts];
}

id objc_msgSend__setMarginWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setMarginWidth:");
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__shouldShowDefaultCalendarSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowDefaultCalendarSpecifier];
}

id objc_msgSend__shouldShowNotificationSetting(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowNotificationSetting];
}

id objc_msgSend__shouldShowSpinner(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowSpinner];
}

id objc_msgSend__timeZoneSupportEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _timeZoneSupportEnabled];
}

id objc_msgSend__titlesForCalendarIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titlesForCalendarIdentifiers:");
}

id objc_msgSend__titlesForDaysToSync(void *a1, const char *a2, ...)
{
  return _[a1 _titlesForDaysToSync];
}

id objc_msgSend__titlesForWeekDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titlesForWeekDays:");
}

id objc_msgSend__updateCheckedCalendarForSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCheckedCalendarForSource:");
}

id objc_msgSend__updateSpecifierSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSpecifierSubtitle:");
}

id objc_msgSend__valueLabelForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueLabelForSpecifier:");
}

id objc_msgSend_accountIdentifiersEnabledToSyncDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountIdentifiersEnabledToSyncDataclass:");
}

id objc_msgSend_accountsSupportingDelegation(void *a1, const char *a2, ...)
{
  return _[a1 accountsSupportingDelegation];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allCalendars(void *a1, const char *a2, ...)
{
  return _[a1 allCalendars];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_calendarWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithID:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_cleanupAccountRefresher(void *a1, const char *a2, ...)
{
  return _[a1 cleanupAccountRefresher];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_configureTTL(void *a1, const char *a2, ...)
{
  return _[a1 configureTTL];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _[a1 constraints];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentRectForCell_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentRectForCell:forState:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfPresets(void *a1, const char *a2, ...)
{
  return _[a1 countOfPresets];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultAlarmOffsetForAlarmType_eventStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAlarmOffsetForAlarmType:eventStore:");
}

id objc_msgSend_defaultCalendarForNewEvents(void *a1, const char *a2, ...)
{
  return _[a1 defaultCalendarForNewEvents];
}

id objc_msgSend_defaultCalendarForNewEventsInDelegateSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCalendarForNewEventsInDelegateSource:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultEventDuration(void *a1, const char *a2, ...)
{
  return _[a1 defaultEventDuration];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegateSources(void *a1, const char *a2, ...)
{
  return _[a1 delegateSources];
}

id objc_msgSend_delegateSourcesForSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateSourcesForSource:");
}

id objc_msgSend_deleteButtonSpecifierWithName_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteButtonSpecifierWithName:target:action:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_didDismissViewControllerSavingNewDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDismissViewControllerSavingNewDelegate:");
}

id objc_msgSend_didModifyDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didModifyDelegate:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enabledWriteAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledWriteAccess:");
}

id objc_msgSend_entityType(void *a1, const char *a2, ...)
{
  return _[a1 entityType];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_eventStore(void *a1, const char *a2, ...)
{
  return _[a1 eventStore];
}

id objc_msgSend_explanatoryTextForTTLStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "explanatoryTextForTTLStatus:");
}

id objc_msgSend_fetchGrantedDelegatesForSource_results_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchGrantedDelegatesForSource:results:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstWeekday(void *a1, const char *a2, ...)
{
  return _[a1 firstWeekday];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_get_enableTravelAdvisoriesForAutomaticBehavior(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "get_enableTravelAdvisoriesForAutomaticBehavior");
}

id objc_msgSend_get_kCalPreferredDaysToSyncKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "get_kCalPreferredDaysToSyncKey");
}

id objc_msgSend_get_suggestEventLocations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "get_suggestEventLocations");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_immediateAlarmCreation(void *a1, const char *a2, ...)
{
  return _[a1 immediateAlarmCreation];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPathForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForSpecifier:");
}

id objc_msgSend_initInAddDelegateMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initInAddDelegateMode:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithEKOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEKOptions:");
}

id objc_msgSend_initWithEKOptions_path_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:");
}

id objc_msgSend_initWithEventStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventStore:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSearchResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSearchResultsController:");
}

id objc_msgSend_initWithSelectionStyle_displayStyle_entityType_forEvent_eventStore_limitedToSource_showIdentityChooser_showDelegateSetupCell_showAccountStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intervalForPresetIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intervalForPresetIdentifier:");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isDelegate(void *a1, const char *a2, ...)
{
  return _[a1 isDelegate];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMovingToParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 isMovingToParentViewController];
}

id objc_msgSend_isTravelAdvisorySupported(void *a1, const char *a2, ...)
{
  return _[a1 isTravelAdvisorySupported];
}

id objc_msgSend_isWritable(void *a1, const char *a2, ...)
{
  return _[a1 isWritable];
}

id objc_msgSend_layoutManager(void *a1, const char *a2, ...)
{
  return _[a1 layoutManager];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return _[a1 layoutSubviews];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lineBreakMode(void *a1, const char *a2, ...)
{
  return _[a1 lineBreakMode];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_lunarCalendarsForLocaleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lunarCalendarsForLocaleID:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 numberOfLines];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _[a1 objectID];
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_overlayCalendarID(void *a1, const char *a2, ...)
{
  return _[a1 overlayCalendarID];
}

id objc_msgSend_overlayCalendarPickerDisplayNameForCalendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayCalendarPickerDisplayNameForCalendarWithIdentifier:");
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_permission(void *a1, const char *a2, ...)
{
  return _[a1 permission];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_ps_insertObject_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObject:afterObject:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readWriteCalendarCountForEntityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readWriteCalendarCountForEntityType:");
}

id objc_msgSend_readWriteCalendarsForEntityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readWriteCalendarsForEntityType:");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _[a1 refresh];
}

id objc_msgSend_reloadDelegateSources(void *a1, const char *a2, ...)
{
  return _[a1 reloadDelegateSources];
}

id objc_msgSend_reloadDelegates(void *a1, const char *a2, ...)
{
  return _[a1 reloadDelegates];
}

id objc_msgSend_reloadGrantedDelegates(void *a1, const char *a2, ...)
{
  return _[a1 reloadGrantedDelegates];
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_reloadSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifiers:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return _[a1 resultType];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_saveSource_commit_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSource:commit:error:");
}

id objc_msgSend_scheduleFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleFetchRequest:");
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _[a1 searchBar];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_selectedCalendars(void *a1, const char *a2, ...)
{
  return _[a1 selectedCalendars];
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setCalendarTimeZone_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendarTimeZone:specifier:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setDefaultAlarmOffset_forAlarmType_eventStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultAlarmOffset:forAlarmType:eventStore:");
}

id objc_msgSend_setDefaultCalendar_forNewEventsInDelegateSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultCalendar:forNewEventsInDelegateSource:");
}

id objc_msgSend_setDefaultCalendarForNewEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultCalendarForNewEvents:");
}

id objc_msgSend_setDefaultEventDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultEventDuration:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableCalendarEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableCalendarEditing:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExplanatoryTextMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExplanatoryTextMode:");
}

id objc_msgSend_setFetchContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchContext:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidesNavigationBarDuringPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesNavigationBarDuringPresentation:");
}

id objc_msgSend_setHidesSearchBarWhenScrolling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesSearchBarWhenScrolling:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImmediateAlarmCreation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImmediateAlarmCreation:");
}

id objc_msgSend_setIncludeCalendarServers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeCalendarServers:");
}

id objc_msgSend_setIncludeContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeContacts:");
}

id objc_msgSend_setIncludeDirectoryServers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeDirectoryServers:");
}

id objc_msgSend_setIncludePredictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludePredictions:");
}

id objc_msgSend_setIncludeRecents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeRecents:");
}

id objc_msgSend_setIncludeSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeSuggestions:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNetworkActivityIndicatorVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkActivityIndicatorVisible:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObscuresBackgroundDuringPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObscuresBackgroundDuringPresentation:");
}

id objc_msgSend_setOverlayCalendarID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayCalendarID:");
}

id objc_msgSend_setParentController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentController:");
}

id objc_msgSend_setPermission_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermission:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSearchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchController:");
}

id objc_msgSend_setSearchResultsUpdater_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResultsUpdater:");
}

id objc_msgSend_setSearchString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchString:");
}

id objc_msgSend_setSearchType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchType:");
}

id objc_msgSend_setSectionHeaderTopPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionHeaderTopPadding:");
}

id objc_msgSend_setSelectedCalendars_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedCalendars:");
}

id objc_msgSend_setSendingAddressAccountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingAddressAccountIdentifier:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setShowWeekNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowWeekNumbers:");
}

id objc_msgSend_setShowsNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsNotifications:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUri:");
}

id objc_msgSend_setUseAllDayAlarms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseAllDayAlarms:");
}

id objc_msgSend_setValues_titles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:titles:");
}

id objc_msgSend_setValues_titles_shortTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:titles:shortTitles:");
}

id objc_msgSend_setWeekStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeekStart:");
}

id objc_msgSend_setWeekStartSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeekStartSpecifier:");
}

id objc_msgSend_setWeekViewStartsOnToday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeekViewStartsOnToday:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_set_enableTravelAdvisoriesForAutomaticBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_enableTravelAdvisoriesForAutomaticBehavior:");
}

id objc_msgSend_set_kCalPreferredDaysToSyncKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_kCalPreferredDaysToSyncKey:");
}

id objc_msgSend_set_suggestEventLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_suggestEventLocations:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_showWeekNumbers(void *a1, const char *a2, ...)
{
  return _[a1 showWeekNumbers];
}

id objc_msgSend_showsNotifications(void *a1, const char *a2, ...)
{
  return _[a1 showsNotifications];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sourceIdentifier];
}

id objc_msgSend_sourceInListHasMoreThanOneWritableCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceInListHasMoreThanOneWritableCalendar:");
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return _[a1 sourceType];
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return _[a1 sources];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_specifiersForAccountsICanAccess(void *a1, const char *a2, ...)
{
  return _[a1 specifiersForAccountsICanAccess];
}

id objc_msgSend_specifiersForAccountsSupportingDelegation(void *a1, const char *a2, ...)
{
  return _[a1 specifiersForAccountsSupportingDelegation];
}

id objc_msgSend_specifiersForAccountsWithGrantedAccess(void *a1, const char *a2, ...)
{
  return _[a1 specifiersForAccountsWithGrantedAccess];
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_stringRemovingMailto(void *a1, const char *a2, ...)
{
  return _[a1 stringRemovingMailto];
}

id objc_msgSend_supportsDelegation(void *a1, const char *a2, ...)
{
  return _[a1 supportsDelegation];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _[a1 timeZone];
}

id objc_msgSend_timeZoneSupportEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneSupportEnabled:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_ttlAlertsEffectivelyDisabledDueToLocationAuthorization(void *a1, const char *a2, ...)
{
  return _[a1 ttlAlertsEffectivelyDisabledDueToLocationAuthorization];
}

id objc_msgSend_ttlLocationStatus(void *a1, const char *a2, ...)
{
  return _[a1 ttlLocationStatus];
}

id objc_msgSend_updateGrantedDelegate_action_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGrantedDelegate:action:source:completion:");
}

id objc_msgSend_updateSpecifiers_withSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSpecifiers:withSpecifiers:");
}

id objc_msgSend_uri(void *a1, const char *a2, ...)
{
  return _[a1 uri];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_weekStart(void *a1, const char *a2, ...)
{
  return _[a1 weekStart];
}

id objc_msgSend_weekStartSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 weekStartSpecifier];
}

id objc_msgSend_weekViewStartsOnToday(void *a1, const char *a2, ...)
{
  return _[a1 weekViewStartsOnToday];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}