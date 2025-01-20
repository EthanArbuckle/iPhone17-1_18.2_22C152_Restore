uint64_t sub_1000052DC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Binding();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_1000053A0(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_allocWithZone((Class)type metadata accessor for _CPUITextField()) initWithFrame:0.0, 0.0, 0.0, 0.0];
  swift_getWitnessTable();
  type metadata accessor for UIViewRepresentableContext();
  UIViewRepresentableContext.coordinator.getter();
  [v4 setDelegate:v20];

  UIViewRepresentableContext.coordinator.getter();
  [v4 addTarget:v20 action:"textFieldValueChanged:" forControlEvents:0x20000];

  [v4 setAutocapitalizationType:3];
  [v4 setAutocorrectionType:1];
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 40));
  [v4 setKeyboardType:v5];
  [v4 setTextAlignment:1];
  [v4 setAdjustsFontForContentSizeCategory:1];
  [v4 setReturnKeyType:9];
  id v6 = sub_100007BF4();
  v7 = self;
  id v8 = v4;
  id v9 = [v7 fontWithDescriptor:v6 size:0.0];
  [v8 setFont:v9];

  if (v5 == 8)
  {
    id v10 = [self currentDevice];
    id v11 = [v10 userInterfaceIdiom];

    if (!v11)
    {
      id v12 = [objc_allocWithZone((Class)UIToolbar) init];
      sub_10000816C(&qword_100071360);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_10004EEE0;
      *(void *)(v13 + 32) = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
      *(void *)(v13 + 40) = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v8 action:"resignFirstResponder"];
      v20 = (void *)v13;
      specialized Array._endMutation()();
      sub_100009AD0(0, &qword_100071368);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v12 setItems:isa];

      [v12 sizeToFit];
      [v8 setInputAccessoryView:v12];
    }
  }
  sub_100009AD0(0, &qword_100071358);
  UIViewRepresentableContext.coordinator.getter();
  id v15 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithDelegate:v20];

  [v8 addInteraction:v15];
  id v16 = [self currentDevice];
  id v17 = [v16 userInterfaceIdiom];

  if (v17 == (id)6)
  {
    id v18 = v8;
    [v18 setBorderStyle:3];
  }
  return v8;
}

void sub_1000057B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(a1);
  id v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v9);
  id v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = (char *)(v3 + *(int *)(v16 + 56));
  char v18 = *v17;
  uint64_t v19 = *((void *)v17 + 1);
  LOBYTE(v38) = v18;
  uint64_t v39 = v19;
  sub_10000816C(&qword_100071348);
  State.wrappedValue.getter();
  char v20 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v4, a3);
  if (v20)
  {
    int v21 = v15[*(int *)(a3 + 32)];
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a3);
    if (v21 != 1) {
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a3);
  }
  v22 = *(uint64_t (**)(char *))(v4 + *(int *)(a3 + 44));
  type metadata accessor for Binding();
  Binding.wrappedValue.getter();
  uint64_t v23 = v22(v11);
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  id v26 = [a1 text];
  if (!v26) {
    goto LABEL_12;
  }
  v27 = v26;
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v30 = v29;

  if (v23 == v28 && v25 == v30)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v32)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_12:
    NSString v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [a1 setText:v33];

    swift_getWitnessTable();
    type metadata accessor for UIViewRepresentableContext();
    UIViewRepresentableContext.coordinator.getter();
    v34 = v38;
    sub_10000638C(a1);
  }
LABEL_14:
  sub_100007B78();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  int v35 = v40;
  swift_release();
  id v36 = sub_1000081B4(v35 != 2);
  [a1 setTextColor:v36];
}

id sub_100005B5C(int *a1)
{
  uint64_t v3 = type metadata accessor for Binding();
  uint64_t v26 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - v4;
  uint64_t v25 = type metadata accessor for CPTextField.Coordinator();
  uint64_t v6 = sub_100007B78();
  int v24 = *(unsigned __int8 *)(v1 + a1[9]);
  uint64_t v7 = (char *)(v1 + a1[14]);
  char v8 = *v7;
  uint64_t v9 = *((void *)v7 + 1);
  char v27 = v8;
  uint64_t v28 = v9;
  swift_retain();
  sub_10000816C(&qword_100071348);
  State.projectedValue.getter();
  uint64_t v10 = v30;
  int v23 = v31;
  id v11 = (uint64_t *)(v1 + a1[11]);
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (uint64_t *)(v1 + a1[12]);
  uint64_t v15 = v14[1];
  uint64_t v21 = *v14;
  uint64_t v22 = v29;
  uint64_t v16 = (uint64_t *)(v1 + a1[13]);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  swift_retain();
  swift_retain();
  swift_retain();
  Binding.projectedValue.getter();
  id v19 = sub_10000851C(v6, v24, v22, v10, v23, v12, v13, v21, v15, v18, v17, (uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v19;
}

uint64_t sub_100005D68()
{
  return Binding.wrappedValue.setter();
}

id sub_100005DE4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)((swift_isaMask & *v2) + 0x50);
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void *)(v4 - 8);
  __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v18 - v11;
  id result = [a1 text];
  if (result)
  {
    uint64_t v14 = result;
    uint64_t v19 = v6;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    (*(void (**)(uint64_t, uint64_t))((char *)v2 + *(void *)((swift_isaMask & *v2) + 0x70)))(v15, v17);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v4) == 1)
    {
      return (id)(*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v9, v5);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v9, v4);
      sub_1000085D0((uint64_t)v12);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v4);
    }
  }
  return result;
}

void sub_100006034(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_100005DE4(v4);
}

uint64_t sub_10000609C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = [a1 text];
  if (!v10)
  {
    char v17 = 0;
    return v17 & 1;
  }
  uint64_t v11 = v10;
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!__OFADD__(a2, a3))
  {
    uint64_t v14 = result;
    uint64_t v15 = v13;
    id v16 = [v11 length];

    if ((uint64_t)v16 >= a2 + a3) {
      char v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v5
    }
                                                                                            + *(void *)((swift_isaMask & *v5) + 0x78)))(v14, v15, a2, a3, a4, a5);
    else {
      char v17 = 0;
    }
    swift_bridgeObjectRelease();
    return v17 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000061A8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a1;
  LOBYTE(a5) = sub_10000609C(v12, a4, a5, v9, v11);

  swift_bridgeObjectRelease();
  return a5 & 1;
}

void sub_100006238(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_100008794();
}

void sub_100006298(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10000879C();
}

uint64_t sub_1000062F8(int a1, int a2, id a3)
{
  return 1;
}

void sub_100006324(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_100006320(v4);
}

void sub_10000638C(void *a1)
{
  if (*((unsigned char *)v1 + *(void *)((swift_isaMask & *v1) + 0x60)) != 1) {
    return;
  }
  id v3 = [a1 selectedTextRange];
  if (!v3) {
    return;
  }
  id v26 = v3;
  sub_100009AD0(0, &qword_100071280);
  id v4 = [v26 start];
  id v5 = [v26 end];
  char v6 = static NSObject.== infix(_:_:)();

  if (v6)
  {
    id v7 = [a1 text];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v11 = v10;

      uint64_t v12 = sub_100007E64(v9, v11);
      uint64_t v14 = v13;
      char v16 = v15;
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        id v17 = [a1 beginningOfDocument];
        id v18 = [v26 start];
        id v19 = [a1 offsetFromPosition:v17 toPosition:v18];

        if ((uint64_t)v19 < v12)
        {
          id v20 = [a1 beginningOfDocument];
          id v21 = [a1 positionFromPosition:v20 offset:v12];

          if (!v21)
          {
            __break(1u);
            return;
          }
          goto LABEL_13;
        }
        BOOL v22 = __OFADD__(v12, v14);
        uint64_t v23 = v12 + v14;
        if (v22)
        {
          __break(1u);
          goto LABEL_18;
        }
        if (v23 < (uint64_t)v19)
        {
          id v24 = [a1 beginningOfDocument];
          id v21 = [a1 positionFromPosition:v24 offset:v23];

          if (v21)
          {
LABEL_13:
            id v25 = [a1 textRangeFromPosition:v21 toPosition:v21];
            [a1 setSelectedTextRange:v25];

            goto LABEL_14;
          }
LABEL_18:
          __break(1u);
          return;
        }
      }
    }
  }
LABEL_14:
}

uint64_t sub_10000664C()
{
  uint64_t v0 = type metadata accessor for CharacterSet();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  CharacterSet.init(charactersIn:)();
  swift_bridgeObjectRelease();
  char v4 = CharacterSet.isSuperset(of:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_100006750(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t v6 = 0;
  for (i = (uint64_t *)(a3 + 40); ; i += 2)
  {
    uint64_t v8 = *i;
    v11[0] = *(i - 1);
    v11[1] = v8;
    swift_bridgeObjectRetain();
    char v9 = a1(v11);
    swift_bridgeObjectRelease();
    if (v3 || (v9 & 1) != 0) {
      break;
    }
    if (v4 == ++v6) {
      return 0;
    }
  }
  return v6;
}

void sub_100006824()
{
}

id sub_10000684C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CPTextField.Coordinator();
  return [super dealloc];
}

uint64_t sub_1000068A8(void *a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_super v2 = (char *)a1 + *(void *)((swift_isaMask & *a1) + 0x88);
  uint64_t v3 = type metadata accessor for Binding();
  uint64_t v4 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

uint64_t type metadata accessor for CPTextField.Coordinator()
{
  return sub_1000089CC();
}

id sub_100006A4C@<X0>(int *a1@<X0>, void *a2@<X8>)
{
  id result = sub_100005B5C(a1);
  *a2 = result;
  return result;
}

uint64_t sub_100006A78()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100006ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_100006B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_100006BB4()
{
  return static View._viewListCount(inputs:)();
}

void sub_100006BD0()
{
}

void sub_100006CD0(void *a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for _CPUITextField();
  [super buildMenuWithBuilder:a1];
  sub_100009AD0(0, &qword_100071280);
  id v3 = [a1 system];
  id v4 = [self contextSystem];
  char v5 = static NSObject.== infix(_:_:)();

  if (v5)
  {
    [a1 removeMenuForIdentifier:UIMenuLookup];
    [a1 removeMenuForIdentifier:UIMenuLearn];
    [a1 removeMenuForIdentifier:UIMenuAutoFill];
    [a1 removeMenuForIdentifier:UIMenuShare];
  }
}

id sub_100006F28()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _CPUITextField();
  return [super dealloc];
}

uint64_t type metadata accessor for _CPUITextField()
{
  return self;
}

__n128 initializeWithTake for EyeDropperView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

uint64_t sub_100006FA8(uint64_t a1, uint64_t a2)
{
  return sub_100007204(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100006FCC(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100007044(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000070C4@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

NSNumber sub_100007108()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_100007110(uint64_t a1, uint64_t a2)
{
  uint64_t result = static CGFloat._forceBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_100007164(uint64_t a1, uint64_t a2)
{
  char v3 = static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_1000071BC@<X0>(void *a1@<X8>)
{
  uint64_t result = static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = v3;
  return result;
}

uint64_t sub_1000071E4(uint64_t a1, uint64_t a2)
{
  return sub_100007204(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007204(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100007248()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000729C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void *sub_100007310@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10000731C()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

void sub_100007388(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100007390@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1000073A4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1000073B8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1000073CC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1000073FC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100007428@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_10000744C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100007460(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100007474(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100007488@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10000749C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1000074B0(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1000074C4(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1000074D8()
{
  return *v0 == 0;
}

uint64_t sub_1000074E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100007500(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_100007518()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_1000075A4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1000075B0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000075C4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100009FFC(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_100007608()
{
  sub_100008AB4(&qword_100071388, type metadata accessor for AttributeName);
  sub_100008AB4(&qword_100071448, type metadata accessor for AttributeName);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_1000076C4@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000770C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007738()
{
  sub_100008AB4(&qword_100071438, type metadata accessor for TraitKey);
  sub_100008AB4(&qword_100071440, type metadata accessor for TraitKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

void *sub_1000077F4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

double sub_100007804@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

uint64_t sub_100007810()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_1000078D8()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_100007924()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_10000797C()
{
  return Hasher._finalize()();
}

uint64_t sub_1000079E4()
{
  return Double.hashValue.getter(*v0);
}

void sub_1000079EC()
{
  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *v0;
  }
  else {
    Swift::UInt64 v1 = 0;
  }
  Hasher._combine(_:)(v1);
}

uint64_t sub_100007A20()
{
  return static Hasher._hash(seed:_:)();
}

BOOL sub_100007A30(double *a1, double *a2)
{
  return *a1 == *a2;
}

void *sub_100007A44(void *result, Swift::String_optional *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  char v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v11 = a4;
  unint64_t v12 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v13 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *char v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      Swift::String_optional v10 = String.Iterator.next()();
      if (!v10.value._object) {
        break;
      }
      ++v9;
      *v8++ = v10;
      if (v7 == v9)
      {
        a4 = v11;
        a5 = v12;
        goto LABEL_13;
      }
    }
    a4 = v11;
    a5 = v12;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v13;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_100007B00(uint64_t a1, uint64_t a2)
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
  sub_10000816C(&qword_100071288);
  uint64_t v4 = (void *)swift_allocObject();
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_100007B78()
{
  uint64_t result = *v0;
  if (!*v0)
  {
    type metadata accessor for ColorPickerState();
    sub_100008AB4((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

id sub_100007BF4()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  uint64_t v2 = self;
  if (v1 == (id)6)
  {
    id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
    sub_10000816C(&qword_100071370);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004EEF0;
    UIFontDescriptorAttributeName v5 = UIFontDescriptorTraitsAttribute;
    *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    sub_10000816C(&qword_100071378);
    uint64_t v6 = swift_initStackObject();
    uint64_t v7 = v6;
    *(_OWORD *)(v6 + 16) = xmmword_10004EEF0;
    UIFontDescriptorTraitKey v8 = UIFontWeightTrait;
    *(void *)(v6 + 32) = UIFontWeightTrait;
    uint64_t v9 = &UIFontWeightSemibold;
  }
  else
  {
    id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    sub_10000816C(&qword_100071370);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004EEF0;
    UIFontDescriptorAttributeName v5 = UIFontDescriptorTraitsAttribute;
    *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    sub_10000816C(&qword_100071378);
    uint64_t v6 = swift_initStackObject();
    uint64_t v7 = v6;
    *(_OWORD *)(v6 + 16) = xmmword_10004EEF0;
    UIFontDescriptorTraitKey v8 = UIFontWeightTrait;
    *(void *)(v6 + 32) = UIFontWeightTrait;
    uint64_t v9 = &UIFontWeightMedium;
  }
  *(UIFontWeight *)(v6 + 40) = *v9;
  Swift::String_optional v10 = v5;
  uint64_t v11 = v8;
  unint64_t v12 = sub_100029C94(v7);
  *(void *)(inited + 64) = sub_10000816C(&qword_100071380);
  *(void *)(inited + 40) = v12;
  sub_100029DA0(inited);
  type metadata accessor for AttributeName(0);
  sub_100008AB4(&qword_100071388, type metadata accessor for AttributeName);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v14 = [v3 fontDescriptorByAddingAttributes:isa];

  return v14;
}

uint64_t sub_100007E64(uint64_t a1, unint64_t a2)
{
  uint64_t v28 = type metadata accessor for CharacterSet();
  uint64_t v4 = *(void *)(v28 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - v8;
  static CharacterSet.decimalDigits.getter();
  swift_bridgeObjectRetain();
  uint64_t v10 = String.count.getter();
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = (Swift::String_optional *)sub_100007B00(v10, 0);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100007A44(&v29, v12 + 2, v11, a1, a2);
    uint64_t result = swift_bridgeObjectRelease();
    if (v13 != (void *)v11)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    uint64_t v15 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = swift_bridgeObjectRelease();
    unint64_t v12 = (Swift::String_optional *)&_swiftEmptyArrayStorage;
  }
  __chkstk_darwin(v15);
  *(&v24 - 2) = (uint64_t)v9;
  uint64_t result = sub_100006750((uint64_t (*)(void *))sub_10000814C, (uint64_t)(&v24 - 4), (uint64_t)v12);
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v28);
    swift_release();
    return 0;
  }
  uint64_t v17 = result;
  uint64_t v18 = result + 1;
  if (__OFADD__(result, 1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t countAndFlagsBits = v12[1].value._countAndFlagsBits;
  if (v18 < countAndFlagsBits)
  {
    int v26 = v16;
    uint64_t v27 = v4;
    id v20 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
    uint64_t v25 = result;
    uint64_t p_object = (uint64_t)&v12[result + 3].value._object;
    unint64_t v22 = result + 1;
    while ((v18 & 0x8000000000000000) == 0)
    {
      if (v22 >= v12[1].value._countAndFlagsBits) {
        goto LABEL_21;
      }
      swift_bridgeObjectRetain();
      CharacterSet.init(charactersIn:)();
      swift_bridgeObjectRelease();
      char v23 = CharacterSet.isSuperset(of:)();
      uint64_t result = (*v20)(v7, v28);
      if ((v23 & 1) == 0)
      {
        uint64_t v18 = v22;
        goto LABEL_16;
      }
      ++v22;
      p_object += 16;
      if (countAndFlagsBits == v22)
      {
        uint64_t v18 = countAndFlagsBits;
LABEL_16:
        uint64_t v4 = v27;
        uint64_t v17 = v25;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_17:
  uint64_t result = swift_release();
  if (!__OFSUB__(v18, v17))
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v28);
    return v17;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_10000814C()
{
  return sub_10000664C() & 1;
}

uint64_t sub_10000816C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_1000081B4(char a1)
{
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = self;
  uint64_t v5 = (SEL *)&selRef_whiteColor;
  uint64_t v6 = &selRef_labelColor;
  if ((a1 & 1) == 0) {
    uint64_t v6 = &selRef_tertiaryLabelColor;
  }
  if (v3 != (id)6) {
    uint64_t v5 = (SEL *)v6;
  }
  id v7 = [v4 *v5];

  return v7;
}

id sub_100008264(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15 = (void *)((char *)v12 + *(void *)((swift_isaMask & *v12) + 0x58));
  swift_beginAccess();
  type metadata accessor for ColorPickerState();
  sub_100008AB4((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  int v16 = v12;
  swift_retain();
  *uint64_t v15 = ObservedObject.init(wrappedValue:)();
  v15[1] = v17;
  swift_endAccess();
  *((unsigned char *)v16 + *(void *)((swift_isaMask & *v16) + 0x60)) = a2;
  uint64_t v18 = (char *)v16 + *(void *)((swift_isaMask & *v16) + 0x80);
  *(void *)uint64_t v18 = a3;
  *((void *)v18 + 1) = a4;
  v18[16] = a5;
  id v19 = (void *)((char *)v16 + *(void *)((swift_isaMask & *v16) + 0x68));
  *id v19 = a6;
  v19[1] = a7;
  id v20 = (void *)((char *)v16 + *(void *)((swift_isaMask & *v16) + 0x70));
  void *v20 = a8;
  v20[1] = a9;
  id v21 = (void *)((char *)v16 + *(void *)((swift_isaMask & *v16) + 0x78));
  *id v21 = a10;
  v21[1] = a11;
  unint64_t v22 = (char *)v16 + *(void *)((swift_isaMask & *v16) + 0x88);
  uint64_t v23 = type metadata accessor for Binding();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v22, a12, v23);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  v30.receiver = v16;
  v30.super_class = (Class)type metadata accessor for CPTextField.Coordinator();
  return [super init];
}

id sub_10000851C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v19 = objc_allocWithZone((Class)type metadata accessor for CPTextField.Coordinator());
  return sub_100008264(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_1000085D0(uint64_t a1)
{
  uint64_t v3 = swift_isaMask & *(void *)v1;
  uint64_t v4 = *(void *)(v3 + 0x50);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1);
  id v7 = (char *)&v13 - v6;
  uint64_t v8 = type metadata accessor for Binding();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - v10;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v13 - v10, &v1[*(void *)(v3 + 136)], v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  Binding.wrappedValue.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100008794()
{
  return sub_100005D68();
}

uint64_t sub_10000879C()
{
  sub_100005D68();
  swift_beginAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v1 == 2)
  {
    swift_beginAccess();
    swift_beginAccess();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    return static Published.subscript.setter();
  }
  return result;
}

void sub_10000898C()
{
}

uint64_t sub_1000089CC()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for UIKeyboardType(uint64_t a1)
{
}

uint64_t sub_100008A24()
{
  return sub_100008AB4(&qword_1000712A8, type metadata accessor for CFString);
}

uint64_t sub_100008A6C()
{
  return sub_100008AB4(&qword_1000712B0, type metadata accessor for CFString);
}

uint64_t sub_100008AB4(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for SomeColor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100008B44(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100008B50(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100008B70(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_100008BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_100008BB8()
{
  uint64_t result = type metadata accessor for Binding();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100008C80(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = v5;
  unint64_t v7 = v5 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v7 & (v5 + 16);
  uint64_t v9 = *(void *)(v4 + 64);
  int v10 = v5 & 0x100000;
  uint64_t v11 = *a2;
  *a1 = *a2;
  BOOL v12 = v6 <= 7 && v10 == 0;
  if (v12
    && (uint64_t v13 = ((v6 + 16) & ~v6) + v9,
        ((((((((((v13 + v8 + 9) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16 <= 0x18))
  {
    id v14 = a1;
    uint64_t v15 = ~v6;
    a1[1] = a2[1];
    int v16 = (void *)(v7 & ((unint64_t)a1 + 23));
    uint64_t v17 = (void *)(v7 & ((unint64_t)a2 + 23));
    *int v16 = *v17;
    uint64_t v18 = (void *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
    id v19 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v18 = *v19;
    uint64_t v20 = v6 + 8;
    unint64_t v39 = ((unint64_t)v18 + v20) & v15;
    unint64_t v21 = ((unint64_t)v19 + v20) & v15;
    unint64_t v22 = *(void (**)(unint64_t, unint64_t, uint64_t))(v4 + 16);
    uint64_t v23 = v3;
    swift_retain();
    swift_retain();
    swift_retain();
    v22(v39, v21, v23);
    uint64_t v24 = (char *)v16 + v13;
    *uint64_t v24 = *((unsigned char *)v17 + v13);
    v24[1] = *((unsigned char *)v17 + v13 + 1);
    uint64_t v25 = (void *)(((unint64_t)v16 + v13 + 9) & 0xFFFFFFFFFFFFFFF8);
    int v26 = (void *)(((unint64_t)v17 + v13 + 9) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v25 = *v26;
    uint64_t v27 = (void *)(((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v28 = (void *)(((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v29 = v28[1];
    void *v27 = *v28;
    v27[1] = v29;
    objc_super v30 = (void *)(((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8);
    unsigned __int8 v31 = (void *)(((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v32 = v31[1];
    *objc_super v30 = *v31;
    v30[1] = v32;
    NSString v33 = (void *)(((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFFFF8);
    v34 = (void *)(((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v35 = v34[1];
    *NSString v33 = *v34;
    v33[1] = v35;
    unint64_t v36 = ((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v37 = ((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v36 = *(unsigned char *)v37;
    *(void *)(v36 + 8) = *(void *)(v37 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  else
  {
    id v14 = (uint64_t *)(v11 + v8);
  }
  swift_retain();
  return v14;
}

uint64_t sub_100008EC4(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))((v6 + ((((a1 + (v6 | 7) + 16) & ~(v6 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v6, v4);
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_100008FE4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v6 = *(void *)(v5 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = (v7 | 7) + 16;
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  int v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  uint64_t v13 = ((unint64_t)v11 + v7 + 8) & ~v7;
  uint64_t v14 = ((unint64_t)v12 + v7 + 8) & ~v7;
  swift_retain();
  swift_retain();
  swift_retain();
  v32(v13, v14, v5);
  uint64_t v15 = *(void *)(v6 + 48) + ((v7 + 16) & ~v7);
  int v16 = (char *)v9 + v15;
  uint64_t v17 = (char *)v10 + v15;
  *int v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = (void *)((unint64_t)(v16 + 9) & 0xFFFFFFFFFFFFFFF8);
  id v19 = (void *)((unint64_t)(v17 + 9) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  uint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = (void *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  int v26 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = (void *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v28 = v27[1];
  *int v26 = *v27;
  v26[1] = v28;
  unint64_t v29 = ((unint64_t)v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = ((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v29 = *(unsigned char *)v30;
  *(void *)(v29 + 8) = *(void *)(v30 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_100009198(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 16;
  int v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  uint64_t v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  *int v10 = *v11;
  swift_retain();
  swift_release();
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *BOOL v12 = *v13;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 24))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  uint64_t v14 = *(void *)(v7 + 64) + ((v8 + 16) & ~v8);
  uint64_t v15 = (char *)v10 + v14;
  int v16 = (char *)v11 + v14;
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = (void *)((unint64_t)(v15 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v18 = (void *)((unint64_t)(v16 + 9) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  id v19 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = v20[1];
  *id v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_retain();
  swift_release();
  uint64_t v25 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  int v26 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  unint64_t v28 = ((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = ((unint64_t)v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v28 = *(unsigned char *)v29;
  *(void *)(v28 + 8) = *(void *)(v29 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_100009398(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void (**)(unint64_t, unint64_t))(v4 + 32);
  uint64_t v6 = v4 + 32;
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v7 | 7) + 16;
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  int v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  v5(((unint64_t)v11 + v7 + 8) & ~v7, ((unint64_t)v12 + v7 + 8) & ~v7);
  uint64_t v13 = *(void *)(v6 + 32) + ((v7 + 16) & ~v7);
  uint64_t v14 = (char *)v9 + v13;
  uint64_t v15 = (char *)v10 + v13;
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  int v16 = (void *)((unint64_t)(v14 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)((unint64_t)(v15 + 9) & 0xFFFFFFFFFFFFFFF8);
  *int v16 = *v17;
  uint64_t v18 = (_OWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
  id v19 = (_OWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  uint64_t v20 = (_OWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (_OWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v20 = *v21;
  uint64_t v22 = (_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (_OWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v22 = *v23;
  *(_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1000094D0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 16;
  int v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  uint64_t v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  *int v10 = *v11;
  swift_release();
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *BOOL v12 = *v13;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 40))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  uint64_t v14 = *(void *)(v7 + 64) + ((v8 + 16) & ~v8);
  uint64_t v15 = (char *)v10 + v14;
  int v16 = (char *)v11 + v14;
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = (void *)((unint64_t)(v15 + 9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (unint64_t)(v16 + 9) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  v18 += 15;
  *uint64_t v17 = v19;
  uint64_t v20 = (_OWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 23;
  _OWORD *v20 = *(_OWORD *)(v18 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  uint64_t v22 = (_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  v21 &= 0xFFFFFFFFFFFFFFF8;
  *uint64_t v22 = *(_OWORD *)v21;
  swift_release();
  uint64_t v23 = (_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v24 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v25 = *(_OWORD *)v24;
  v24 += 23;
  *uint64_t v23 = v25;
  swift_release();
  unint64_t v26 = ((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v26 = *(unsigned char *)(v24 & 0xFFFFFFFFFFFFFFF8);
  *(void *)(v26 + 8) = *(void *)((v24 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  return a1;
}

uint64_t sub_100009684(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = v6 | 7;
  if (v7 < a2)
  {
    unint64_t v9 = ((((((((((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
                 + ((v6 + 16) & ~v6)
                 + ((v6 + 16) & ~v8)
                 + 9) & 0xFFFFFFFFFFFFFFF8)
               + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 23) & 0xFFFFFFFFFFFFFFF8)
       + 16;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x100009820);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  unint64_t v18 = (unint64_t *)(((((unint64_t)a1 + v8 + 16) & ~v8) + 15) & 0xFFFFFFFFFFFFFFF8);
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v18 + v6 + 8) & ~v6);
  }
  unint64_t v19 = *v18;
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

void sub_100009834(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((((((((((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
                + ((v9 + 16) & ~v9)
                + ((v9 + 16) & ~(v9 | 7))
                + 9) & 0xFFFFFFFFFFFFFFF8)
              + 15) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v18 = (void *)((((unint64_t)&a1[(v9 | 7) + 16] & ~(v9 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8);
            if ((v7 & 0x80000000) != 0)
            {
              uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(((unint64_t)v18 + v9 + 8) & ~v9);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v19 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v19 = a2 - 1;
              }
              *unint64_t v18 = v19;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
                 + ((v9 + 16) & ~v9)
                 + ((v9 + 16) & ~(v9 | 7))
                 + 9) & 0xFFFFFFF8)
               + 15) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
               + ((v9 + 16) & ~v9)
               + ((v9 + 16) & ~(v9 | 7))
               + 9) & 0xFFFFFFF8)
             + 15) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
    int v16 = v15;
  else {
    int v16 = 1;
  }
  if (((((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
               + ((v9 + 16) & ~v9)
               + ((v9 + 16) & ~(v9 | 7))
               + 9) & 0xFFFFFFF8)
             + 15) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x100009A68);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for CPTextField()
{
  return sub_1000089CC();
}

void *sub_100009AA8()
{
  return &protocol witness table for Never;
}

uint64_t sub_100009AB4()
{
  return swift_getWitnessTable();
}

uint64_t sub_100009AD0(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for AttributeName(uint64_t a1)
{
}

void type metadata accessor for Weight(uint64_t a1)
{
}

void type metadata accessor for TraitKey(uint64_t a1)
{
}

void type metadata accessor for UIRectCorner(uint64_t a1)
{
}

uint64_t sub_100009B5C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100009B7C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_100009BB8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100009C00()
{
  return sub_100008AB4(&qword_1000713B8, type metadata accessor for UIRectCorner);
}

uint64_t sub_100009C48()
{
  return sub_100008AB4(&qword_1000713C0, type metadata accessor for UIRectCorner);
}

uint64_t sub_100009C90()
{
  return sub_100008AB4(&qword_1000713C8, type metadata accessor for UIRectCorner);
}

uint64_t sub_100009CD8()
{
  return sub_100008AB4(&qword_1000713D0, type metadata accessor for UIRectCorner);
}

uint64_t sub_100009D20()
{
  return sub_100008AB4(&qword_1000713D8, type metadata accessor for AttributeName);
}

uint64_t sub_100009D68()
{
  return sub_100008AB4(&qword_1000713E0, type metadata accessor for AttributeName);
}

uint64_t sub_100009DB0()
{
  return sub_100008AB4(&qword_1000713E8, type metadata accessor for TraitKey);
}

uint64_t sub_100009DF8()
{
  return sub_100008AB4(&qword_1000713F0, type metadata accessor for TraitKey);
}

uint64_t sub_100009E40()
{
  return sub_100008AB4(&qword_1000713F8, type metadata accessor for TraitKey);
}

uint64_t sub_100009E88()
{
  return sub_100008AB4(&qword_100071400, type metadata accessor for Weight);
}

uint64_t sub_100009ED0()
{
  return sub_100008AB4(&qword_100071408, type metadata accessor for Weight);
}

uint64_t sub_100009F18()
{
  return sub_100008AB4(&qword_100071410, type metadata accessor for Weight);
}

uint64_t sub_100009F60()
{
  return sub_100008AB4(&qword_100071418, type metadata accessor for AttributeName);
}

unint64_t sub_100009FA8()
{
  unint64_t result = qword_100071430;
  if (!qword_100071430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071430);
  }
  return result;
}

uint64_t sub_100009FFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_10000A034()
{
  return type metadata accessor for _UIColorPickerContentViewController();
}

uint64_t *sub_10000A06C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    unsigned int v7 = (uint64_t *)((char *)a1 + v6);
    unsigned int v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10000A18C(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for DynamicTypeSize();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_10000A244(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  unsigned int v7 = (void *)((char *)a2 + v5);
  swift_retain();
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_10000A30C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    unsigned int v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_10000C8F8((uint64_t)a1 + v6, &qword_100071570);
    sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_10000A408(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_10000A4DC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_10000C8F8((uint64_t)a1 + v6, &qword_100071570);
    uint64_t v9 = sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000A5E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A5F4);
}

uint64_t sub_10000A5F4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_10000816C(&qword_100071578);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    unsigned int v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10000A6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A6C8);
}

void *sub_10000A6C8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_10000816C(&qword_100071578);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for RGBAView()
{
  uint64_t result = qword_1000715D8;
  if (!qword_1000715D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000A7C0()
{
  sub_10000A858();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000A858()
{
  if (!qword_1000715E8)
  {
    type metadata accessor for DynamicTypeSize();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000715E8);
    }
  }
}

uint64_t sub_10000A8B0()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_10000A8CC(char a1)
{
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = self;
  int v5 = (SEL *)&selRef_clearColor;
  uint64_t v6 = &selRef_systemBackgroundColor;
  if ((a1 & 1) == 0) {
    uint64_t v6 = &selRef_systemGray5Color;
  }
  if (v3 != (id)6) {
    int v5 = (SEL *)v6;
  }
  id v7 = [v4 *v5];

  return v7;
}

uint64_t sub_10000A97C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000816C(&qword_100071618);
  __chkstk_darwin(v3 - 8);
  int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)6) {
    uint64_t v8 = 0x4030000000000000;
  }
  else {
    uint64_t v8 = 0x4039000000000000;
  }
  *(void *)int v5 = static HorizontalAlignment.center.getter();
  *((void *)v5 + 1) = v8;
  v5[16] = 0;
  uint64_t v9 = sub_10000816C(&qword_100071620);
  sub_10000AA80(v1, (uint64_t)&v5[*(int *)(v9 + 44)]);
  return sub_10000C590((uint64_t)v5, a1, &qword_100071618);
}

uint64_t sub_10000AA80@<X0>(void (*a1)(uint64_t a1@<X8>)@<X0>, uint64_t a2@<X8>)
{
  unint64_t v26 = a1;
  uint64_t v3 = sub_10000816C(&qword_100071628);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_10000816C(&qword_100071630);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  unsigned int v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  int v15 = (char *)&v25 - v14;
  __chkstk_darwin(v13);
  int v17 = (char *)&v25 - v16;
  id v18 = [self currentDevice];
  id v19 = [v18 userInterfaceIdiom];

  if (v19 == (id)6) {
    uint64_t v20 = 0x4030000000000000;
  }
  else {
    uint64_t v20 = 0x4032000000000000;
  }
  *(void *)int v15 = static HorizontalAlignment.center.getter();
  *((void *)v15 + 1) = v20;
  v15[16] = 0;
  uint64_t v21 = sub_10000816C(&qword_100071638);
  sub_10000ACE8((uint64_t)&v15[*(int *)(v21 + 44)]);
  sub_10000C590((uint64_t)v15, (uint64_t)v17, &qword_100071630);
  *(void *)uint64_t v8 = static HorizontalAlignment.center.getter();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v22 = sub_10000816C(&qword_100071640);
  sub_10000B038(v26, (uint64_t)&v8[*(int *)(v22 + 44)]);
  sub_10000C800((uint64_t)v17, (uint64_t)v12, &qword_100071630);
  sub_10000C800((uint64_t)v8, (uint64_t)v6, &qword_100071628);
  sub_10000C800((uint64_t)v12, a2, &qword_100071630);
  uint64_t v23 = sub_10000816C(&qword_100071648);
  sub_10000C800((uint64_t)v6, a2 + *(int *)(v23 + 48), &qword_100071628);
  sub_10000C8F8((uint64_t)v8, &qword_100071628);
  sub_10000C8F8((uint64_t)v17, &qword_100071630);
  sub_10000C8F8((uint64_t)v6, &qword_100071628);
  return sub_10000C8F8((uint64_t)v12, &qword_100071630);
}

uint64_t sub_10000ACE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v1 = type metadata accessor for ColorSlider(0);
  uint64_t v2 = v1 - 8;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v40 = (uint64_t)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v39 = (uint64_t)&v38 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v38 = (uint64_t)&v38 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v38 - v15;
  type metadata accessor for ColorPickerState();
  sub_10000C3C8();
  uint64_t v17 = EnvironmentObject.init()();
  uint64_t v19 = v18;
  *(void *)&v16[*(int *)(v2 + 32)] = swift_getKeyPath();
  sub_10000816C(&qword_100071570);
  swift_storeEnumTagMultiPayload();
  *uint64_t v16 = 0;
  *((void *)v16 + 1) = v17;
  *((void *)v16 + 2) = v19;
  uint64_t v20 = *(int *)(v2 + 36);
  static Font.Weight.semibold.getter();
  *(void *)&v16[v20] = v21;
  uint64_t v22 = EnvironmentObject.init()();
  uint64_t v24 = v23;
  *(void *)&v14[*(int *)(v2 + 32)] = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *uint64_t v14 = 1;
  *((void *)v14 + 1) = v22;
  *((void *)v14 + 2) = v24;
  uint64_t v25 = *(int *)(v2 + 36);
  static Font.Weight.semibold.getter();
  *(void *)&v14[v25] = v26;
  uint64_t v27 = EnvironmentObject.init()();
  uint64_t v29 = v28;
  *(void *)&v11[*(int *)(v2 + 32)] = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *uint64_t v11 = 2;
  *((void *)v11 + 1) = v27;
  *((void *)v11 + 2) = v29;
  uint64_t v30 = *(int *)(v2 + 36);
  static Font.Weight.semibold.getter();
  *(void *)&v11[v30] = v31;
  uint64_t v32 = v38;
  sub_10000CAE0((uint64_t)v16, v38, type metadata accessor for ColorSlider);
  uint64_t v33 = v39;
  sub_10000CAE0((uint64_t)v14, v39, type metadata accessor for ColorSlider);
  uint64_t v34 = v40;
  sub_10000CAE0((uint64_t)v11, v40, type metadata accessor for ColorSlider);
  uint64_t v35 = v41;
  sub_10000CAE0(v32, v41, type metadata accessor for ColorSlider);
  uint64_t v36 = sub_10000816C(&qword_100071690);
  sub_10000CAE0(v33, v35 + *(int *)(v36 + 48), type metadata accessor for ColorSlider);
  sub_10000CAE0(v34, v35 + *(int *)(v36 + 64), type metadata accessor for ColorSlider);
  sub_10000CB48((uint64_t)v11, type metadata accessor for ColorSlider);
  sub_10000CB48((uint64_t)v14, type metadata accessor for ColorSlider);
  sub_10000CB48((uint64_t)v16, type metadata accessor for ColorSlider);
  sub_10000CB48(v34, type metadata accessor for ColorSlider);
  sub_10000CB48(v33, type metadata accessor for ColorSlider);
  return sub_10000CB48(v32, type metadata accessor for ColorSlider);
}

uint64_t sub_10000B038@<X0>(void (*a1)(uint64_t a1@<X8>)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000816C(&qword_100071650);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (uint64_t *)((char *)&v19 - v8);
  uint64_t v10 = type metadata accessor for DynamicTypeSize();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RGBAView();
  sub_100018280((uint64_t)v13);
  char v14 = DynamicTypeSize.isAccessibilitySize.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    uint64_t v20 = static HorizontalAlignment.center.getter();
    uint64_t v21 = 0;
    char v22 = 1;
    sub_10000C374();
  }
  else
  {
    uint64_t v20 = static VerticalAlignment.center.getter();
    uint64_t v21 = 0x4030000000000000;
    char v22 = 0;
    sub_10000C320();
  }
  *uint64_t v9 = AnyLayout.init<A>(_:)();
  uint64_t v15 = (uint64_t (*)())((char *)v9 + *(int *)(v4 + 44));
  swift_retain();
  sub_10000B27C(a1, v15);
  sub_10000C800((uint64_t)v9, (uint64_t)v7, &qword_100071650);
  sub_10000C800((uint64_t)v7, a2, &qword_100071650);
  uint64_t v16 = *(int *)(sub_10000816C(&qword_100071660) + 48);
  swift_release();
  uint64_t v17 = a2 + v16;
  *(void *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 8) = 0;
  sub_10000C8F8((uint64_t)v9, &qword_100071650);
  return sub_10000C8F8((uint64_t)v7, &qword_100071650);
}

uint64_t sub_10000B27C@<X0>(void (*a1)(uint64_t a1@<X8>)@<X0>, uint64_t (*a2)()@<X8>)
{
  v86 = a2;
  uint64_t v3 = type metadata accessor for RGBAView();
  uint64_t v84 = *(void *)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v87 = v4;
  uint64_t v88 = (uint64_t)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ColorSpaceButton();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000816C(&qword_100071670);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v92 = (uint64_t)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v75 - v12;
  __chkstk_darwin(v11);
  uint64_t v93 = (uint64_t)&v75 - v14;
  v85 = a1;
  uint64_t v15 = *(void *)a1;
  if (*(void *)a1)
  {
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v15;
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = v15;
    swift_retain_n();
    Binding.init(get:set:)();
    uint64_t v18 = v111;
    uint64_t v19 = v112;
    unsigned long long v91 = v113;
    unsigned long long v22 = v114;
    unint64_t v21 = v22 >> 64;
    unint64_t v20 = v22;
    char v23 = v115;
    *(void *)&v7[*(int *)(v5 + 24)] = swift_getKeyPath();
    sub_10000816C(&qword_100071570);
    swift_storeEnumTagMultiPayload();
    *(void *)uint64_t v7 = v18;
    *((void *)v7 + 1) = v19;
    *((_OWORD *)v7 + 1) = v91;
    *((_OWORD *)v7 + 2) = __PAIR128__(v21, v20);
    v7[48] = v23;
    uint64_t v111 = 0x4049000000000000;
    sub_10000C448();
    ScaledMetric.init(wrappedValue:)();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    int v24 = v114;
    swift_release();
    LOBYTE(v18) = v24 == 2;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = v18;
    sub_10000CAE0((uint64_t)v7, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ColorSpaceButton);
    uint64_t v27 = (uint64_t *)&v13[*(int *)(v8 + 36)];
    uint64_t *v27 = KeyPath;
    v27[1] = (uint64_t)sub_10000C578;
    v27[2] = v26;
    sub_10000CB48((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ColorSpaceButton);
    sub_10000C590((uint64_t)v13, v93, &qword_100071670);
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = 0;
    v28[3] = 0;
    v28[4] = v15;
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v15;
    swift_retain_n();
    Binding.init(get:set:)();
    uint64_t v90 = v112;
    *(void *)&unsigned long long v91 = v111;
    unsigned long long v30 = v113;
    unsigned long long v33 = v114;
    uint64_t v32 = v33 >> 64;
    uint64_t v31 = v33;
    int v89 = v115;
    uint64_t v34 = v85;
    uint64_t v35 = v88;
    sub_10000CAE0((uint64_t)v85, v88, (uint64_t (*)(void))type metadata accessor for RGBAView);
    unint64_t v36 = (*(unsigned __int8 *)(v84 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    uint64_t v84 = swift_allocObject();
    sub_10000C714(v35, v84 + v36);
    uint64_t v37 = type metadata accessor for ColorPickerState();
    *(void *)&long long v81 = sub_10000C3C8();
    *((void *)&v81 + 1) = v37;
    uint64_t v38 = EnvironmentObject.init()();
    uint64_t v87 = v39;
    uint64_t v88 = v38;
    LOBYTE(v96) = 0;
    State.init(wrappedValue:)();
    int v83 = v111;
    uint64_t v82 = v112;
    uint64_t v40 = self;
    id v41 = [v40 defaultMetrics];
    v42 = self;
    id v43 = [v42 currentDevice];
    id v44 = [v43 userInterfaceIdiom];

    double v45 = 100.0;
    if (v44 == (id)6) {
      double v45 = 88.0;
    }
    [v41 scaledValueForValue:v45];

    id v46 = [v40 defaultMetrics];
    id v47 = [v42 currentDevice];
    id v48 = [v47 userInterfaceIdiom];

    double v49 = 36.0;
    if (v48 == (id)6) {
      double v49 = 44.0;
    }
    [v46 scaledValueForValue:v49];

    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    if (*(void *)v34)
    {
      long long v81 = v140;
      uint64_t v50 = v138;
      uint64_t v79 = v138;
      uint64_t v51 = v136;
      unsigned __int8 v95 = v137;
      unsigned __int8 v94 = v139;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      int v52 = v114;
      swift_release();
      sub_10000A8CC(v52 != 2);
      uint64_t v53 = Color.init(uiColor:)();
      uint64_t v78 = v53;
      int v54 = static Edge.Set.all.getter();
      unsigned __int8 v55 = v95;
      int v76 = v54;
      int v77 = v95;
      unsigned __int8 v56 = v94;
      int v80 = v94;
      uint64_t v57 = v92;
      sub_10000C800(v93, v92, &qword_100071670);
      v58 = v86;
      *(void *)v86 = 0;
      *((unsigned char *)v58 + 8) = 0;
      uint64_t v59 = sub_10000816C(&qword_100071680);
      sub_10000C800(v57, (uint64_t)v58 + *(int *)(v59 + 48), &qword_100071670);
      v60 = (char *)v58 + *(int *)(v59 + 64);
      *(void *)&long long v96 = v88;
      *((void *)&v96 + 1) = v87;
      *(void *)&long long v97 = v91;
      *((void *)&v97 + 1) = v90;
      unsigned long long v98 = v30;
      *(void *)&long long v99 = v31;
      *((void *)&v99 + 1) = v32;
      LOBYTE(v100) = v89;
      *(_WORD *)((char *)&v100 + 1) = 0;
      v86 = sub_10000BC0C;
      *((void *)&v100 + 1) = 1;
      *(void *)&long long v101 = sub_10000BC0C;
      v85 = sub_10000C778;
      *((void *)&v101 + 1) = 0;
      *(void *)&long long v102 = sub_10000C778;
      uint64_t v61 = v84;
      *((void *)&v102 + 1) = v84;
      v103 = sub_10000BEF0;
      uint64_t v104 = 0;
      LOBYTE(v57) = v83;
      LOBYTE(v105) = v83;
      uint64_t v62 = v82;
      *((void *)&v105 + 1) = v82;
      *(void *)&long long v106 = v51;
      BYTE8(v106) = v55;
      *(void *)&long long v107 = v50;
      BYTE8(v107) = v56;
      long long v63 = v81;
      long long v108 = v81;
      *(void *)&long long v109 = v53;
      char v64 = v76;
      BYTE8(v109) = v76;
      uint64_t v110 = 0x4020000000000000;
      long long v65 = v102;
      long long v66 = v106;
      *((_OWORD *)v60 + 8) = v105;
      *((_OWORD *)v60 + 9) = v66;
      *((_OWORD *)v60 + 6) = v65;
      *((_OWORD *)v60 + 7) = (unint64_t)sub_10000BEF0;
      long long v67 = v107;
      long long v68 = v108;
      long long v69 = v109;
      *((void *)v60 + 26) = 0x4020000000000000;
      *((_OWORD *)v60 + 11) = v68;
      *((_OWORD *)v60 + 12) = v69;
      *((_OWORD *)v60 + 10) = v67;
      long long v70 = v97;
      *(_OWORD *)v60 = v96;
      *((_OWORD *)v60 + 1) = v70;
      unsigned long long v71 = v98;
      long long v72 = v99;
      long long v73 = v101;
      *((_OWORD *)v60 + 4) = v100;
      *((_OWORD *)v60 + 5) = v73;
      *((_OWORD *)v60 + 2) = v71;
      *((_OWORD *)v60 + 3) = v72;
      sub_10000C864((uint64_t)&v96);
      sub_10000C8F8(v93, &qword_100071670);
      uint64_t v111 = v88;
      uint64_t v112 = v87;
      *(void *)&unsigned long long v113 = v91;
      *((void *)&v113 + 1) = v90;
      unsigned long long v114 = v30;
      uint64_t v115 = v31;
      uint64_t v116 = v32;
      char v117 = v89;
      __int16 v118 = 0;
      uint64_t v119 = 1;
      v120 = v86;
      uint64_t v121 = 0;
      v122 = v85;
      uint64_t v123 = v61;
      v124 = sub_10000BEF0;
      uint64_t v125 = 0;
      char v126 = v57;
      uint64_t v127 = v62;
      uint64_t v128 = v51;
      char v129 = v77;
      uint64_t v130 = v79;
      char v131 = v80;
      long long v132 = v63;
      uint64_t v133 = v78;
      char v134 = v64;
      uint64_t v135 = 0x4020000000000000;
      sub_10000C954((uint64_t)&v111);
      return sub_10000C8F8(v92, &qword_100071670);
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10000C3C8();
    EnvironmentObject.error()();
    __break(1u);
  }
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_10000BC0C()
{
  return sub_10001C2B0();
}

void sub_10000BC48(uint64_t *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = (void *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = 0;
    v5[3] = 0;
    v5[4] = v3;
    swift_retain_n();
    Binding.init(get:set:)();
    swift_getKeyPath();
    sub_10000816C(&qword_100072D40);
    Binding.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    long long v18 = v16;
    LOBYTE(v19) = v17;
    sub_10000816C(&qword_100071688);
    Binding.wrappedValue.getter();
    swift_release();
    swift_release();
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t v7 = &kCGColorSpaceDisplayP3;
    if (!v15) {
      uint64_t v7 = &kCGColorSpaceSRGB;
    }
    CFStringRef v8 = *v7;
    *(void *)&long long v18 = 0;
    id v9 = [self hexValuedColor:v6 colorSpace:v8 error:&v18];

    id v10 = (id)v18;
    if (v9)
    {
      sub_10001D21C(v9, v15, (uint64_t)&v18);
      long long v11 = v18;
      long long v12 = v19;
      char v13 = v20;
    }
    else
    {
      uint64_t v14 = v10;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRelease();
      long long v11 = 0uLL;
      char v13 = 2;
      long long v12 = 0uLL;
    }
    *(_OWORD *)a2 = v11;
    *(_OWORD *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 32) = v13;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10000C3C8();
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t sub_10000BEF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = String.count.getter();
  if (v6)
  {
    uint64_t v7 = v6;
    CFStringRef v8 = (Swift::String_optional *)sub_100007B00(v6, 0);
    id v9 = sub_100007A44(v28, v8 + 2, v7, 0xD000000000000016, 0x8000000100053B70);
    swift_bridgeObjectRelease();
    if (v9 == (void *)v7) {
      goto LABEL_5;
    }
    __break(1u);
  }
  CFStringRef v8 = (Swift::String_optional *)&_swiftEmptyArrayStorage;
LABEL_5:
  NSString v10 = String._bridgeToObjectiveC()();
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 stringByReplacingCharactersInRange:a3 withString:a4];

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  if (String.count.getter() >= 7)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v16 = HIBYTE(v15) & 0xF;
    v28[0] = v13;
    v28[1] = v15;
    if ((v15 & 0x2000000000000000) == 0) {
      uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
    }
    v28[2] = 0;
    v28[3] = v16;
    Swift::String_optional v17 = String.Iterator.next()();
    if (v17.value._object)
    {
      uint64_t countAndFlagsBits = v17.value._countAndFlagsBits;
      object = v17.value._object;
      while (1)
      {
        uint64_t v21 = v8[1].value._countAndFlagsBits;
        if (!v21) {
          goto LABEL_30;
        }
        BOOL v22 = v8[2].value._countAndFlagsBits == countAndFlagsBits && object == v8[2].value._object;
        if (!v22 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          if (v21 == 1) {
            goto LABEL_30;
          }
          if (v8[3].value._countAndFlagsBits != countAndFlagsBits || object != v8[3].value._object)
          {
            uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              break;
            }
          }
        }
LABEL_10:
        swift_bridgeObjectRelease();
        Swift::String_optional v20 = String.Iterator.next()();
        uint64_t countAndFlagsBits = v20.value._countAndFlagsBits;
        object = v20.value._object;
        if (!v20.value._object) {
          goto LABEL_32;
        }
      }
      if (v21 == 2)
      {
LABEL_30:
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
      uint64_t p_object = &v8[4].value._object;
      uint64_t v25 = 2;
      while (1)
      {
        uint64_t v26 = v25 + 1;
        if (__OFADD__(v25, 1)) {
          break;
        }
        if (*(p_object - 1) == (void *)countAndFlagsBits && object == *p_object) {
          goto LABEL_10;
        }
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
        if (result) {
          goto LABEL_10;
        }
        p_object += 2;
        ++v25;
        if (v26 == v21) {
          goto LABEL_30;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_32:
      swift_release();
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return result;
}

uint64_t sub_10000C174()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_10000C190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for RoundedRectangle();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  CFStringRef v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *v2;
  NSString v10 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v11 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v12 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  *CFStringRef v8 = v9;
  v8[1] = v9;
  uint64_t v13 = a2 + *(int *)(sub_10000816C(&qword_1000716A0) + 36);
  sub_10000CAE0((uint64_t)v8, v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v13 + *(int *)(sub_10000816C(&qword_1000716A8) + 36)) = 256;
  uint64_t v14 = sub_10000816C(&qword_1000716B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a2, a1, v14);
  return sub_10000CB48((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
}

unint64_t sub_10000C320()
{
  unint64_t result = qword_100071658;
  if (!qword_100071658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071658);
  }
  return result;
}

unint64_t sub_10000C374()
{
  unint64_t result = qword_100071668;
  if (!qword_100071668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071668);
  }
  return result;
}

unint64_t sub_10000C3C8()
{
  unint64_t result = qword_100071350;
  if (!qword_100071350)
  {
    type metadata accessor for ColorPickerState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071350);
  }
  return result;
}

uint64_t sub_10000C424@<X0>(uint64_t a1@<X8>)
{
  return sub_1000298B8(a1);
}

uint64_t sub_10000C434()
{
  return sub_1000299A8();
}

unint64_t sub_10000C448()
{
  unint64_t result = qword_100071678;
  if (!qword_100071678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071678);
  }
  return result;
}

uint64_t sub_10000C4A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000C4D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000C504()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_10000C52C()
{
  return EnvironmentValues.isEnabled.setter();
}

unsigned char *sub_10000C554(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_10000C568()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_10000C578(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_10000C590(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000816C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C5FC()
{
  uint64_t v1 = (int *)(type metadata accessor for RGBAView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000C714(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGBAView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000C778(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for RGBAView() - 8);
  uint64_t v4 = (uint64_t *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  sub_10000BC48(v4, a1);
}

uint64_t sub_10000C800(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000816C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C864(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000C8F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000816C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C954(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000C9F0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

ValueMetadata *type metadata accessor for RGBAView.PlatformBasedShapeModifier()
{
  return &type metadata for RGBAView.PlatformBasedShapeModifier;
}

uint64_t sub_10000CA40()
{
  return sub_10000CC70(&qword_100071698, &qword_100071618);
}

uint64_t sub_10000CA7C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000CAC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CAE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000CB48(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000CBAC()
{
  unint64_t result = qword_1000716B8;
  if (!qword_1000716B8)
  {
    sub_10000CA7C(&qword_1000716A0);
    sub_10000CC70(&qword_1000716C0, &qword_1000716B0);
    sub_10000CC70(&qword_1000716C8, &qword_1000716A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000716B8);
  }
  return result;
}

uint64_t sub_10000CC70(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CA7C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CCBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10000816C(&qword_100071730);
  __chkstk_darwin(v6 - 8);
  CFStringRef v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000816C(&qword_100071738);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)CFStringRef v8 = static VerticalAlignment.center.getter();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v13 = sub_10000816C(&qword_100071740);
  sub_10000CE78(a1, a2, (uint64_t)&v8[*(int *)(v13 + 44)]);
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10000C800((uint64_t)v8, (uint64_t)v12, &qword_100071730);
  unint64_t v15 = &v12[*(int *)(v10 + 44)];
  long long v16 = v18[1];
  *(_OWORD *)unint64_t v15 = v18[0];
  *((_OWORD *)v15 + 1) = v16;
  *((_OWORD *)v15 + 2) = v18[2];
  sub_10000C8F8((uint64_t)v8, &qword_100071730);
  return sub_10000FC14((uint64_t)v12, a3);
}

uint64_t sub_10000CE78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v66 = a3;
  uint64_t v5 = sub_10000816C(&qword_100071748);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v65 = (uint64_t)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = sub_10000816C(&qword_100071750);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v35 - v14;
  uint64_t v16 = sub_10000816C(&qword_100071758);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  long long v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v35 - v20;
  uint64_t v56 = (uint64_t)&v35 - v20;
  sub_10000D3E8(a1, a2, (uint64_t)&v35 - v20);
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v63 = v83;
  uint64_t v64 = v81;
  uint64_t v62 = v85;
  uint64_t v61 = v87;
  uint64_t v59 = v91;
  uint64_t v60 = v89;
  uint64_t v57 = v94;
  uint64_t v58 = v93;
  char v80 = 1;
  char v79 = v82;
  char v78 = v84;
  char v77 = v86;
  unsigned __int8 v76 = v88;
  unsigned __int8 v75 = v90;
  unsigned __int8 v74 = v92;
  id v47 = v15;
  sub_10000D6E4(a1, (uint64_t)v15);
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v54 = v97;
  uint64_t v55 = v95;
  uint64_t v53 = v99;
  uint64_t v52 = v101;
  uint64_t v50 = v105;
  uint64_t v51 = v103;
  uint64_t v48 = v108;
  uint64_t v49 = v107;
  unsigned __int8 v73 = 1;
  unsigned __int8 v72 = v96;
  unsigned __int8 v71 = v98;
  unsigned __int8 v70 = v100;
  unsigned __int8 v69 = v102;
  unsigned __int8 v68 = v104;
  unsigned __int8 v67 = v106;
  BOOL v22 = v9;
  id v46 = v9;
  sub_10000DB28(a1, a2, (uint64_t)v9);
  sub_10000C800((uint64_t)v21, (uint64_t)v19, &qword_100071758);
  LOBYTE(a1) = v80;
  LOBYTE(v21) = v79;
  char v23 = v78;
  LOBYTE(v9) = v77;
  int v36 = v76;
  int v37 = v75;
  int v38 = v74;
  sub_10000C800((uint64_t)v15, (uint64_t)v13, &qword_100071750);
  int v39 = v73;
  int v40 = v72;
  int v41 = v71;
  int v42 = v70;
  int v43 = v69;
  int v44 = v68;
  int v45 = v67;
  uint64_t v24 = (uint64_t)v22;
  uint64_t v25 = v65;
  sub_10000C800(v24, v65, &qword_100071748);
  uint64_t v26 = (uint64_t)v19;
  uint64_t v27 = (uint64_t)v19;
  uint64_t v28 = v66;
  sub_10000C800(v26, v66, &qword_100071758);
  uint64_t v29 = (int *)sub_10000816C(&qword_100071760);
  uint64_t v30 = v28 + v29[12];
  *(void *)uint64_t v30 = 0;
  *(unsigned char *)(v30 + 8) = a1;
  *(void *)(v30 + 16) = v64;
  *(unsigned char *)(v30 + 24) = (_BYTE)v21;
  *(void *)(v30 + 32) = v63;
  *(unsigned char *)(v30 + 40) = v23;
  *(void *)(v30 + 48) = v62;
  *(unsigned char *)(v30 + 56) = (_BYTE)v9;
  *(void *)(v30 + 64) = v61;
  *(unsigned char *)(v30 + 72) = v36;
  *(void *)(v30 + 80) = v60;
  *(unsigned char *)(v30 + 88) = v37;
  *(void *)(v30 + 96) = v59;
  *(unsigned char *)(v30 + 104) = v38;
  uint64_t v31 = v57;
  *(void *)(v30 + 112) = v58;
  *(void *)(v30 + 120) = v31;
  sub_10000C800((uint64_t)v13, v28 + v29[16], &qword_100071750);
  uint64_t v32 = v28 + v29[20];
  *(void *)uint64_t v32 = 0;
  *(unsigned char *)(v32 + 8) = v39;
  *(void *)(v32 + 16) = v55;
  *(unsigned char *)(v32 + 24) = v40;
  *(void *)(v32 + 32) = v54;
  *(unsigned char *)(v32 + 40) = v41;
  *(void *)(v32 + 48) = v53;
  *(unsigned char *)(v32 + 56) = v42;
  *(void *)(v32 + 64) = v52;
  *(unsigned char *)(v32 + 72) = v43;
  *(void *)(v32 + 80) = v51;
  *(unsigned char *)(v32 + 88) = v44;
  *(void *)(v32 + 96) = v50;
  *(unsigned char *)(v32 + 104) = v45;
  uint64_t v33 = v48;
  *(void *)(v32 + 112) = v49;
  *(void *)(v32 + 120) = v33;
  sub_10000C800(v25, v28 + v29[24], &qword_100071748);
  sub_10000C8F8((uint64_t)v46, &qword_100071748);
  sub_10000C8F8((uint64_t)v47, &qword_100071750);
  sub_10000C8F8(v56, &qword_100071758);
  sub_10000C8F8(v25, &qword_100071748);
  sub_10000C8F8((uint64_t)v13, &qword_100071750);
  return sub_10000C8F8(v27, &qword_100071758);
}

uint64_t sub_10000D3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v19[1] = a3;
  uint64_t v5 = sub_10000816C(&qword_100071778);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000816C(&qword_100071868);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000816C(&qword_100071768);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (v15 == (id)6)
  {
    sub_10000ECF4(a1, a2, (uint64_t)v13);
    uint64_t v16 = &qword_100071768;
    sub_10000C800((uint64_t)v13, (uint64_t)v10, &qword_100071768);
    swift_storeEnumTagMultiPayload();
    sub_10000FE34(&qword_1000717E0, &qword_100071768, &qword_1000717E8, (void (*)(void))sub_10000FF30);
    sub_10000FE34(&qword_100071780, &qword_100071778, &qword_100071788, (void (*)(void))sub_10000FC7C);
    _ConditionalContent<>.init(storage:)();
    uint64_t v17 = (uint64_t)v13;
  }
  else
  {
    sub_10000E158(a1, a2, (uint64_t)v7);
    uint64_t v16 = &qword_100071778;
    sub_10000C800((uint64_t)v7, (uint64_t)v10, &qword_100071778);
    swift_storeEnumTagMultiPayload();
    sub_10000FE34(&qword_1000717E0, &qword_100071768, &qword_1000717E8, (void (*)(void))sub_10000FF30);
    sub_10000FE34(&qword_100071780, &qword_100071778, &qword_100071788, (void (*)(void))sub_10000FC7C);
    _ConditionalContent<>.init(storage:)();
    uint64_t v17 = (uint64_t)v7;
  }
  return sub_10000C8F8(v17, v16);
}

uint64_t sub_10000D6E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = sub_10000816C(&qword_100071790);
  __chkstk_darwin(v33);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000816C(&qword_100071840);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v34 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    sub_100010084();
    uint64_t v9 = Text.init<A>(_:)();
    uint64_t v11 = v10;
    char v13 = v12;
    id v14 = [self currentDevice];
    id v15 = [v14 userInterfaceIdiom];

    uint64_t v36 = v6;
    uint64_t v37 = a2;
    uint64_t v35 = v7;
    if (v15 == (id)6) {
      static Font.title2.getter();
    }
    else {
      static Font.headline.getter();
    }
    char v16 = v13 & 1;
    uint64_t v17 = Text.font(_:)();
    uint64_t v19 = v18;
    char v21 = v20;
    uint64_t v23 = v22;
    swift_release();
    sub_1000100D8(v9, v11, v16);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v38 = v17;
    uint64_t v39 = v19;
    char v40 = v21 & 1;
    uint64_t v41 = v23;
    uint64_t v42 = KeyPath;
    uint64_t v43 = 1;
    char v44 = 0;
    uint64_t v25 = enum case for DynamicTypeSize.xxxLarge(_:);
    uint64_t v26 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v5, v25, v26);
    sub_1000100E8(&qword_100071830, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    if (dispatch thunk of static Equatable.== infix(_:_:)())
    {
      sub_10000816C(&qword_100071848);
      sub_100010204();
      sub_10000CC70(&qword_1000717D8, &qword_100071790);
      uint64_t v27 = v34;
      View.dynamicTypeSize<A>(_:)();
      sub_10000C8F8((uint64_t)v5, &qword_100071790);
      sub_1000100D8(v38, v39, v40);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v29 = v35;
      uint64_t v28 = v36;
      uint64_t v30 = v37;
      (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v37, v27, v36);
      *(void *)(v30 + *(int *)(sub_10000816C(&qword_100071750) + 36)) = 0x3FF0000000000000;
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v27, v28);
    }
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_1000100E8((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_10000DB28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v19[1] = a3;
  uint64_t v5 = sub_10000816C(&qword_100071768);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000816C(&qword_100071770);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000816C(&qword_100071778);
  __chkstk_darwin(v11);
  char v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (v15 == (id)6)
  {
    sub_10000E158(a1, a2, (uint64_t)v13);
    char v16 = &qword_100071778;
    sub_10000C800((uint64_t)v13, (uint64_t)v10, &qword_100071778);
    swift_storeEnumTagMultiPayload();
    sub_10000FE34(&qword_100071780, &qword_100071778, &qword_100071788, (void (*)(void))sub_10000FC7C);
    sub_10000FE34(&qword_1000717E0, &qword_100071768, &qword_1000717E8, (void (*)(void))sub_10000FF30);
    _ConditionalContent<>.init(storage:)();
    uint64_t v17 = (uint64_t)v13;
  }
  else
  {
    sub_10000ECF4(a1, a2, (uint64_t)v7);
    char v16 = &qword_100071768;
    sub_10000C800((uint64_t)v7, (uint64_t)v10, &qword_100071768);
    swift_storeEnumTagMultiPayload();
    sub_10000FE34(&qword_100071780, &qword_100071778, &qword_100071788, (void (*)(void))sub_10000FC7C);
    sub_10000FE34(&qword_1000717E0, &qword_100071768, &qword_1000717E8, (void (*)(void))sub_10000FF30);
    _ConditionalContent<>.init(storage:)();
    uint64_t v17 = (uint64_t)v7;
  }
  return sub_10000C8F8(v17, v16);
}

uint64_t sub_10000DE24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v19[1] = a2;
  uint64_t v3 = sub_10000816C(&qword_100071880);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000816C(&qword_100071888);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000816C(&qword_100071890);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [self currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  if (v14 == (id)6)
  {
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, a1, v3);
    id v15 = &v12[*(int *)(v10 + 36)];
    long long v16 = v21;
    *(_OWORD *)id v15 = v20;
    *((_OWORD *)v15 + 1) = v16;
    *((_OWORD *)v15 + 2) = v22;
    sub_10000C800((uint64_t)v12, (uint64_t)v9, &qword_100071890);
    swift_storeEnumTagMultiPayload();
    sub_100010374();
    sub_10000CC70(&qword_1000718A0, &qword_100071880);
    _ConditionalContent<>.init(storage:)();
    return sub_10000C8F8((uint64_t)v12, &qword_100071890);
  }
  else
  {
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v18(v6, a1, v3);
    v18(v9, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload();
    sub_100010374();
    sub_10000CC70(&qword_1000718A0, &qword_100071880);
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_10000E158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v80[3] = a2;
  uint64_t v85 = a1;
  uint64_t v86 = a3;
  uint64_t v84 = sub_10000816C(&qword_100071790);
  __chkstk_darwin(v84);
  unsigned __int8 v100 = (char *)v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for UIButton.Configuration();
  uint64_t v98 = *(void *)(v4 - 8);
  uint64_t v99 = v4;
  __chkstk_darwin(v4);
  unsigned __int8 v88 = (char *)v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_10000816C(&qword_1000717C8);
  uint64_t v6 = __chkstk_darwin(v95);
  uint64_t v89 = (char *)v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v93 = (char *)v80 - v8;
  uint64_t v94 = sub_10000816C(&qword_1000717B8) - 8;
  __chkstk_darwin(v94);
  uint64_t v92 = (uint64_t)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_10000816C(&qword_1000717A8) - 8;
  __chkstk_darwin(v97);
  uint64_t v96 = (uint64_t)v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_10000816C(&qword_100071788);
  __chkstk_darwin(v90);
  uint64_t v91 = (char *)v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_10000816C(&qword_100071818);
  uint64_t v82 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v81 = (char *)v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ColorPickerState();
  uint64_t v14 = sub_1000100E8((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  v80[2] = v13;
  v80[1] = v14;
  uint64_t v103 = EnvironmentObject.init()();
  uint64_t v104 = v15;
  sub_100009AD0(0, (unint64_t *)&qword_100072F70);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v17 = self;
  id v18 = [v17 bundleForClass:ObjCClassFromMetadata];
  NSString v19 = String._bridgeToObjectiveC()();
  NSString v20 = String._bridgeToObjectiveC()();
  id v21 = [v18 localizedStringForKey:v19 value:0 table:v20];

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;

  uint64_t v101 = v22;
  uint64_t v102 = v24;
  unint64_t v87 = sub_100010084();
  uint64_t v25 = Text.init<A>(_:)();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  sub_10000F6E4();
  uint64_t v30 = (uint64_t)v89;
  View.accessibility(label:)();
  sub_1000100D8(v25, v27, v29);
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000816C(&qword_100071828);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_10004FA80;
  id v32 = [v17 bundleForClass:ObjCClassFromMetadata];
  NSString v33 = String._bridgeToObjectiveC()();
  NSString v34 = String._bridgeToObjectiveC()();
  id v35 = [v32 localizedStringForKey:v33 value:0 table:v34];

  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v38 = v37;

  *(void *)(v31 + 32) = v36;
  *(void *)(v31 + 40) = v38;
  id v39 = [v17 bundleForClass:ObjCClassFromMetadata];
  NSString v40 = String._bridgeToObjectiveC()();
  NSString v41 = String._bridgeToObjectiveC()();
  id v42 = [v39 localizedStringForKey:v40 value:0 table:v41];

  uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v45 = v44;

  uint64_t v46 = (uint64_t)v91;
  *(void *)(v31 + 48) = v43;
  *(void *)(v31 + 56) = v45;
  uint64_t v47 = (uint64_t)v93;
  ModifiedContent<>.accessibilityInputLabels<A>(_:)();
  swift_bridgeObjectRelease();
  sub_10000C8F8(v30, &qword_1000717C8);
  uint64_t v48 = v92;
  sub_10000C800(v47, v92, &qword_1000717C8);
  *(_WORD *)(v48 + *(int *)(v94 + 44)) = 257;
  sub_10000C8F8(v47, &qword_1000717C8);
  LOBYTE(v30) = static Edge.Set.leading.getter();
  uint64_t v49 = v88;
  sub_10000EB90();
  UIButton.Configuration.contentInsets.getter();
  uint64_t v50 = v99;
  uint64_t v51 = *(void (**)(char *, uint64_t))(v98 + 8);
  v51(v49, v99);
  EdgeInsets.init(_all:)();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v96;
  sub_10000C800(v48, v96, &qword_1000717B8);
  uint64_t v61 = v60 + *(int *)(v97 + 44);
  *(unsigned char *)uint64_t v61 = v30;
  *(void *)(v61 + 8) = v53;
  *(void *)(v61 + 16) = v55;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = v59;
  *(unsigned char *)(v61 + 40) = 0;
  sub_10000C8F8(v48, &qword_1000717B8);
  LOBYTE(v30) = static Edge.Set.trailing.getter();
  sub_10000EB90();
  UIButton.Configuration.contentInsets.getter();
  v51(v49, v50);
  uint64_t v62 = (uint64_t)v100;
  EdgeInsets.init(_all:)();
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v68 = v67;
  uint64_t v70 = v69;
  sub_10000C800(v60, v46, &qword_1000717A8);
  uint64_t v71 = v46 + *(int *)(v90 + 36);
  *(unsigned char *)uint64_t v71 = v30;
  *(void *)(v71 + 8) = v64;
  *(void *)(v71 + 16) = v66;
  *(void *)(v71 + 24) = v68;
  *(void *)(v71 + 32) = v70;
  *(unsigned char *)(v71 + 40) = 0;
  sub_10000C8F8(v60, &qword_1000717A8);
  uint64_t v72 = enum case for DynamicTypeSize.xLarge(_:);
  uint64_t v73 = type metadata accessor for DynamicTypeSize();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 104))(v62, v72, v73);
  sub_1000100E8(&qword_100071830, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_10000FC7C();
  sub_10000CC70(&qword_1000717D8, &qword_100071790);
  unsigned __int8 v74 = v81;
  View.dynamicTypeSize<A>(_:)();
  sub_10000C8F8(v62, &qword_100071790);
  sub_10000C8F8(v46, &qword_100071788);
  if (!v85)
  {
LABEL_8:
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if ((_BYTE)v103) {
    double v75 = 1.0;
  }
  else {
    double v75 = 0.0;
  }
  uint64_t v76 = v82;
  uint64_t v77 = v86;
  uint64_t v78 = v83;
  (*(void (**)(uint64_t, char *, uint64_t))(v82 + 16))(v86, v74, v83);
  *(double *)(v77 + *(int *)(sub_10000816C(&qword_100071778) + 36)) = v75;
  return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v74, v78);
}

uint64_t sub_10000EB90()
{
  static UIButton.Configuration.plain()();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self systemImageNamed:v0];

  UIButton.Configuration.image.setter();
  uint64_t v2 = self;
  id v3 = [v2 configurationWithTextStyle:UIFontTextStyleBody];
  id v4 = [v2 configurationWithWeight:6];
  id v5 = [v3 configurationByApplyingConfiguration:v4];

  UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
  id v6 = [self clearColor];
  uint64_t v7 = (uint64_t (*)(uint64_t *, void))UIButton.Configuration.background.modify();
  UIBackgroundConfiguration.backgroundColor.setter();
  return v7(&v9, 0);
}

uint64_t sub_10000ECF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10000816C(&qword_100071790);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000816C(&qword_100071838);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  v19[1] = a2;
  id v21 = sub_100010170;
  uint64_t v22 = v13;
  __int16 v23 = 257;
  uint64_t v14 = enum case for DynamicTypeSize.xLarge(_:);
  uint64_t v15 = type metadata accessor for DynamicTypeSize();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v8, v14, v15);
  sub_1000100E8(&qword_100071830, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  swift_retain();
  if (dispatch thunk of static Equatable.== infix(_:_:)())
  {
    uint64_t v20 = a3;
    sub_10000816C(&qword_1000717E8);
    sub_10000FF30();
    sub_10000CC70(&qword_1000717D8, &qword_100071790);
    View.dynamicTypeSize<A>(_:)();
    sub_10000C8F8((uint64_t)v8, &qword_100071790);
    swift_release();
    if (a1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      if (v21)
      {
        swift_release();
        uint64_t v16 = v20;
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        swift_release();
        double v17 = 1.0;
        uint64_t v16 = v20;
        if (v21 != 1)
        {
LABEL_7:
          (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v16, v12, v9);
          *(double *)(v16 + *(int *)(sub_10000816C(&qword_100071768) + 36)) = v17;
          return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        }
      }
      double v17 = 0.0;
      goto LABEL_7;
    }
  }
  else
  {
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_1000100E8((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_10000F0E4(uint64_t result)
{
  if (result)
  {
    id v1 = *(void (**)(uint64_t))(result + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
    if (v1)
    {
      uint64_t v2 = swift_retain();
      v1(v2);
      return sub_100010188((uint64_t)v1);
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_1000100E8((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F1AC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CCBC(*v1, v1[1], a1);
}

uint64_t sub_10000F1B4(uint64_t a1)
{
  uint64_t v2 = sub_10000816C(&qword_100071718);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UIPointerEffect();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v9 = [objc_allocWithZone((Class)UITargetedPreview) initWithView:a1];
  sub_100009AD0(0, &qword_100071720);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for UIPointerEffect.highlight(_:), v5);
  uint64_t v10 = type metadata accessor for UIPointerShape();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  return UIPointerStyle.init(effect:shape:)();
}

id sub_10000F4E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EyeDropperView.Coordinator();
  return [super dealloc];
}

uint64_t type metadata accessor for EyeDropperView.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for EyeDropperView()
{
  return &type metadata for EyeDropperView;
}

id sub_10000F578@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = (objc_class *)type metadata accessor for EyeDropperView.Coordinator();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  uint64_t v7 = &v6[OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent];
  *(void *)uint64_t v7 = v3;
  *((void *)v7 + 1) = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  id result = [super init];
  *a1 = result;
  return result;
}

uint64_t sub_10000F5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000F8D0();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000F654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000F8D0();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10000F6B8()
{
}

unint64_t sub_10000F6E4()
{
  unint64_t result = qword_100071700;
  if (!qword_100071700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071700);
  }
  return result;
}

void *sub_10000F738()
{
  uint64_t v0 = type metadata accessor for UIButton.Configuration();
  __chkstk_darwin(v0 - 8);
  sub_100009AD0(0, &qword_100071708);
  sub_10000EB90();
  id v1 = (void *)UIButton.init(configuration:primaryAction:)();
  sub_10000816C(&qword_100071710);
  UIViewRepresentableContext.coordinator.getter();
  [v1 addTarget:v3 action:"buttonPressed:" forControlEvents:1];

  UIViewRepresentableContext.coordinator.getter();
  [v1 addTarget:v3 action:"buttonUp:" forControlEvents:64];

  UIViewRepresentableContext.coordinator.getter();
  [v1 addTarget:v3 action:"buttonUp:" forControlEvents:128];

  [v1 setContentHorizontalAlignment:4];
  UIButton.pointerStyleProvider.setter();
  return v1;
}

unint64_t sub_10000F8D0()
{
  unint64_t result = qword_100071728;
  if (!qword_100071728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071728);
  }
  return result;
}

uint64_t sub_10000F924()
{
  id v1 = (void *)(v0
                + OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent);
  if (!*(void *)(v0
                  + OBJC_IVAR____TtCV20ColorPickerUIServiceP33_DBD1622CFBB2996DAF9D1081F3537E2A14EyeDropperView11Coordinator_parent))
    goto LABEL_6;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if ((v3 & 1) == 0) {
    return result;
  }
  if (!*v1)
  {
LABEL_6:
    type metadata accessor for ColorPickerState();
    sub_1000100E8((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

void *initializeBufferWithCopyOfBuffer for ColorPickerNavigationBar(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ColorPickerNavigationBar()
{
  return swift_release();
}

void *assignWithCopy for ColorPickerTabPicker(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for ColorPickerNavigationBar(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerTabPicker(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for ColorPickerTabPicker(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerNavigationBar()
{
  return &type metadata for ColorPickerNavigationBar;
}

uint64_t sub_10000FBF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000FC14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000816C(&qword_100071738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FC7C()
{
  return sub_10000FCDC(&qword_100071798, &qword_100071788, (void (*)(void))sub_10000FCAC);
}

uint64_t sub_10000FCAC()
{
  return sub_10000FCDC(&qword_1000717A0, &qword_1000717A8, (void (*)(void))sub_10000FD58);
}

uint64_t sub_10000FCDC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CA7C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000FD58()
{
  return sub_10000FCDC(&qword_1000717B0, &qword_1000717B8, (void (*)(void))sub_10000FD88);
}

unint64_t sub_10000FD88()
{
  unint64_t result = qword_1000717C0;
  if (!qword_1000717C0)
  {
    sub_10000CA7C(&qword_1000717C8);
    sub_10000F6E4();
    sub_1000100E8((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000717C0);
  }
  return result;
}

uint64_t sub_10000FE34(unint64_t *a1, uint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CA7C(a2);
    sub_10000CA7C(a3);
    sub_10000CA7C(&qword_100071790);
    a4();
    sub_10000CC70(&qword_1000717D8, &qword_100071790);
    swift_getOpaqueTypeConformance2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000FF30()
{
  return sub_10000FCDC(&qword_1000717F0, &qword_1000717E8, (void (*)(void))sub_10000FF60);
}

unint64_t sub_10000FF60()
{
  unint64_t result = qword_1000717F8;
  if (!qword_1000717F8)
  {
    sub_10000CA7C(&qword_100071800);
    sub_10000FFDC();
    sub_100010030();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000717F8);
  }
  return result;
}

unint64_t sub_10000FFDC()
{
  unint64_t result = qword_100071808;
  if (!qword_100071808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071808);
  }
  return result;
}

unint64_t sub_100010030()
{
  unint64_t result = qword_100071810;
  if (!qword_100071810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071810);
  }
  return result;
}

unint64_t sub_100010084()
{
  unint64_t result = qword_100071820;
  if (!qword_100071820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071820);
  }
  return result;
}

uint64_t sub_1000100D8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000100E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100010138()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010170()
{
  return sub_10000F0E4(*(void *)(v0 + 16));
}

uint64_t sub_100010188(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000101A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000101D4()
{
  return EnvironmentValues.lineLimit.setter();
}

unint64_t sub_100010204()
{
  unint64_t result = qword_100071850;
  if (!qword_100071850)
  {
    sub_10000CA7C(&qword_100071848);
    sub_10000CC70(&qword_100071858, &qword_100071860);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071850);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerNavigationBar.PlatformBasedFrameModifier()
{
  return &type metadata for ColorPickerNavigationBar.PlatformBasedFrameModifier;
}

unint64_t sub_1000102B8()
{
  unint64_t result = qword_100071870;
  if (!qword_100071870)
  {
    sub_10000CA7C(&qword_100071738);
    sub_10000CC70(&qword_100071878, &qword_100071730);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071870);
  }
  return result;
}

uint64_t sub_100010358()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100010374()
{
  unint64_t result = qword_100071898;
  if (!qword_100071898)
  {
    sub_10000CA7C(&qword_100071890);
    sub_10000CC70(&qword_1000718A0, &qword_100071880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071898);
  }
  return result;
}

unint64_t sub_100010418()
{
  unint64_t result = qword_1000718A8;
  if (!qword_1000718A8)
  {
    sub_10000CA7C(&qword_1000718B0);
    sub_100010374();
    sub_10000CC70(&qword_1000718A0, &qword_100071880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000718A8);
  }
  return result;
}

id sub_1000104C8()
{
  id v1 = &v0[OBJC_IVAR____TtC20ColorPickerUIService14FavoritesStore__favoriteColorsUserDefaultsKey];
  strcpy(&v0[OBJC_IVAR____TtC20ColorPickerUIService14FavoritesStore__favoriteColorsUserDefaultsKey], "FavoriteColors");
  v1[15] = -18;
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for FavoritesStore();
  [super init];
  char v3 = self;
  id v4 = v2;
  id v5 = [v3 standardUserDefaults];
  swift_bridgeObjectRetain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v7 = [v5 dataForKey:v6];

  if (v7)
  {
    uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    sub_100011ADC(v8, v10);
  }
  else
  {
    id v12 = [v3 standardUserDefaults];
    NSString v13 = String._bridgeToObjectiveC()();
    id v11 = [v12 arrayForKey:v13];

    if (v11)
    {

      goto LABEL_6;
    }
    sub_10001170C();
  }
  id v11 = v4;
LABEL_6:

  return v4;
}

void *sub_10001068C(char a1)
{
  CGColorSpaceRef v2 = sub_100010F24();
  CGColorSpaceRef v3 = v2;
  if ((a1 & 1) == 0)
  {
    uint64_t v4 = *((void *)v2 + 2);
    if (v4)
    {
      id v5 = (char *)v2 + 64;
      do
      {
        if (*((double *)v5 - 1) == 1.0)
        {
          long long v12 = *((_OWORD *)v5 - 2);
          uint64_t v9 = *((void *)v5 - 2);
          char v10 = *v5;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_100031534(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          unint64_t v7 = _swiftEmptyArrayStorage[2];
          unint64_t v6 = _swiftEmptyArrayStorage[3];
          if (v7 >= v6 >> 1) {
            sub_100031534((char *)(v6 > 1), v7 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v7 + 1;
          uint64_t v8 = &_swiftEmptyArrayStorage[5 * v7];
          *((_OWORD *)v8 + 2) = v12;
          v8[6] = v9;
          v8[7] = 0x3FF0000000000000;
          *((unsigned char *)v8 + 64) = v10;
        }
        v5 += 40;
        --v4;
      }
      while (v4);
    }
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_1000107C8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000816C(&qword_100071928);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    type metadata accessor for JSONEncoder();
    swift_allocObject();
    JSONEncoder.init()();
    char v80 = (char *)a1;
    sub_10000816C(&qword_1000718F0);
    sub_100011BE4(&qword_1000718F8, (void (*)(void))sub_100011A88);
    uint64_t v10 = dispatch thunk of JSONEncoder.encode<A>(_:)();
    unint64_t v12 = v11;
    swift_release();
    id v13 = [self standardUserDefaults];
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    NSString v15 = String._bridgeToObjectiveC()();
    [v13 setValue:isa forKey:v15];

    return sub_100011ADC(v10, v12);
  }
  uint64_t v67 = v7;
  double v17 = (char *)sub_100010F24();
  uint64_t v68 = v3;
  char v79 = sub_10001068C(0);
  char v80 = (char *)a1;
  uint64_t v18 = sub_10000816C(&qword_1000718F0);
  sub_100011D18();
  sub_100011D74();
  v66[1] = v18;
  BidirectionalCollection<>.difference<A>(from:)();
  swift_bridgeObjectRelease();
  uint64_t v69 = v9;
  uint64_t v19 = CollectionDifference.removals.getter();
  uint64_t v20 = *(void *)(v19 + 16);
  if (!v20)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  v66[0] = v6;
  unint64_t v21 = 0;
  uint64_t v22 = v19 + 32;
  uint64_t v70 = (float64x2_t *)(a1 + 64);
  uint64_t v71 = v19 + 32;
  uint64_t v23 = a1;
  uint64_t v73 = v19;
  uint64_t v74 = a1;
  uint64_t v72 = v20;
  while (1)
  {
    if (v21 >= *(void *)(v19 + 16))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    uint64_t v24 = v22 + (v21 << 6);
    if (*(unsigned char *)(v24 + 57) != 1) {
      goto LABEL_7;
    }
    unint64_t v25 = *(void *)v24;
    if ((*(void *)v24 & 0x8000000000000000) != 0) {
      goto LABEL_49;
    }
    float64x2_t v26 = *(float64x2_t *)(v24 + 24);
    float64x2_t v75 = *(float64x2_t *)(v24 + 8);
    float64x2_t v76 = v26;
    uint64_t v27 = *(void *)(v24 + 40);
    if (v25 && ((v28 = *(void *)(v23 + 16), v28 >= v25) || (unint64_t v25 = *(void *)(v23 + 16), v28)))
    {
      swift_bridgeObjectRetain();
      char v29 = v70;
      uint64_t v30 = (char *)_swiftEmptyArrayStorage;
      float64x2_t v32 = v75;
      float64x2_t v31 = v76;
      do
      {
        float64x2_t v38 = v29[-2];
        if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v38, v32), (int32x4_t)vceqq_f64(v29[-1], v31))), 0xFuLL))))
        {
          int v39 = LOBYTE(v29->f64[0]);
          if (((v27 & 1) == 0) != v39)
          {
            float64x2_t v77 = v29[-1];
            float64x2_t v78 = v38;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            char v80 = v30;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_100031534(0, *((void *)v30 + 2) + 1, 1);
              uint64_t v30 = v80;
            }
            float64x2_t v34 = v77;
            float64x2_t v33 = v78;
            unint64_t v36 = *((void *)v30 + 2);
            unint64_t v35 = *((void *)v30 + 3);
            float64x2_t v32 = v75;
            float64x2_t v31 = v76;
            if (v36 >= v35 >> 1)
            {
              sub_100031534((char *)(v35 > 1), v36 + 1, 1);
              float64x2_t v34 = v77;
              float64x2_t v33 = v78;
              float64x2_t v32 = v75;
              float64x2_t v31 = v76;
              uint64_t v30 = v80;
            }
            *((void *)v30 + 2) = v36 + 1;
            uint64_t v37 = (float64x2_t *)&v30[40 * v36];
            v37[2] = v33;
            v37[3] = v34;
            LOBYTE(v37[4].f64[0]) = v39;
          }
        }
        char v29 = (float64x2_t *)((char *)v29 + 40);
        --v25;
      }
      while (v25);
      uint64_t v23 = v74;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v30 = (char *)_swiftEmptyArrayStorage;
    }
    uint64_t v41 = *((void *)v30 + 2);
    swift_release();
    uint64_t v42 = *((void *)v17 + 2);
    if (v42) {
      break;
    }
LABEL_6:
    uint64_t v20 = v72;
    uint64_t v19 = v73;
    uint64_t v22 = v71;
LABEL_7:
    if (++v21 == v20)
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = v66[0];
LABEL_38:
      uint64_t v48 = v6;
      uint64_t v49 = CollectionDifference.insertions.getter();
      uint64_t v50 = *(void *)(v49 + 16);
      if (v50)
      {
        uint64_t v51 = v49 + 48;
        do
        {
          if ((*(unsigned char *)(v51 + 41) & 1) == 0)
          {
            uint64_t v53 = *(void *)(v51 + 24);
            uint64_t v55 = *(void *)(v51 + 8);
            uint64_t v54 = *(void *)(v51 + 16);
            uint64_t v57 = *(void *)(v51 - 8);
            uint64_t v56 = *(void *)v51;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              double v17 = sub_1000310EC(0, *((void *)v17 + 2) + 1, 1, v17);
            }
            unint64_t v59 = *((void *)v17 + 2);
            unint64_t v58 = *((void *)v17 + 3);
            if (v59 >= v58 >> 1) {
              double v17 = sub_1000310EC((char *)(v58 > 1), v59 + 1, 1, v17);
            }
            *((void *)v17 + 2) = v59 + 1;
            uint64_t v52 = &v17[40 * v59];
            *((void *)v52 + 4) = v57;
            *((void *)v52 + 5) = v56;
            *((void *)v52 + 6) = v55;
            *((void *)v52 + 7) = v54;
            v52[64] = v53 & 1;
          }
          v51 += 64;
          --v50;
        }
        while (v50);
      }
      swift_bridgeObjectRelease();
      type metadata accessor for JSONEncoder();
      swift_allocObject();
      JSONEncoder.init()();
      char v80 = v17;
      sub_100011BE4(&qword_1000718F8, (void (*)(void))sub_100011A88);
      swift_bridgeObjectRetain();
      uint64_t v60 = dispatch thunk of JSONEncoder.encode<A>(_:)();
      unint64_t v62 = v61;
      swift_bridgeObjectRelease_n();
      swift_release();
      id v63 = [self standardUserDefaults];
      Class v64 = Data._bridgeToObjectiveC()().super.isa;
      NSString v65 = String._bridgeToObjectiveC()();
      [v63 setValue:v64 forKey:v65];
      sub_100011ADC(v60, v62);

      return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v69, v48);
    }
  }
  unint64_t v43 = 0;
  uint64_t v44 = 72;
  while (1)
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v17[v44 - 40], v75), (int32x4_t)vceqq_f64(*(float64x2_t *)&v17[v44 - 24], v76))), 0xFuLL))) & 1) == 0|| ((((v27 & 1) == 0) ^ v17[v44 - 8]) & 1) == 0)
    {
      goto LABEL_27;
    }
    if (!v41) {
      break;
    }
    --v41;
LABEL_27:
    ++v43;
    v44 += 40;
    if (v42 == v43) {
      goto LABEL_5;
    }
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    double v17 = sub_100031BF8((uint64_t)v17);
  }
  unint64_t v45 = *((void *)v17 + 2);
  unint64_t v46 = v45 - v43;
  if (v45 > v43)
  {
    unint64_t v47 = v45 - 1;
    memmove(&v17[v44 - 40], &v17[v44], 40 * v46 - 40);
    *((void *)v17 + 2) = v47;
LABEL_5:
    uint64_t v23 = v74;
    goto LABEL_6;
  }
LABEL_50:
  __break(1u);
  swift_unexpectedError();
  __break(1u);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

CGColorSpaceRef sub_100010F24()
{
  uint64_t v0 = self;
  id v1 = [v0 standardUserDefaults];
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 dataForKey:v2];

  if (v3)
  {
    uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;

    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    sub_10000816C(&qword_1000718F0);
    sub_100011BE4(&qword_100071918, (void (*)(void))sub_100011C54);
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    swift_release();
    sub_100011ADC(v4, v6);
    return (CGColorSpaceRef)v48[0];
  }
  id v7 = [v0 standardUserDefaults];
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 arrayForKey:v8];

  if (!v9) {
    return (CGColorSpaceRef)_swiftEmptyArrayStorage;
  }
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v11 = sub_1000115BC(v10);
  swift_bridgeObjectRelease();
  double v17 = _swiftEmptyArrayStorage;
  if (!v11) {
    return (CGColorSpaceRef)v17;
  }
  v48[0] = _swiftEmptyArrayStorage;
  uint64_t v12 = v11[2];
  if (v12)
  {
    sub_100009AD0(0, &qword_100071908);
    sub_100009AD0(0, &qword_100071910);
    swift_bridgeObjectRetain();
    id v13 = v11 + 5;
    do
    {
      uint64_t v14 = *(v13 - 1);
      unint64_t v15 = *v13;
      sub_100011B34(v14, *v13);
      uint64_t v16 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
      sub_100011ADC(v14, v15);
      if (v16)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v48[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v48[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v13 += 2;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    unint64_t v18 = v48[0];
  }
  else
  {
    unint64_t v18 = (unint64_t)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
  uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v19)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    return (CGColorSpaceRef)_swiftEmptyArrayStorage;
  }
LABEL_16:
  CGColorSpaceRef result = (CGColorSpaceRef)sub_100031534(0, v19 & ~(v19 >> 63), 0);
  if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = 0;
    double v17 = _swiftEmptyArrayStorage;
    unint64_t v46 = v18 & 0xC000000000000001;
    unint64_t v45 = (__CFString *)kCGColorSpaceDisplayP3;
    while (1)
    {
      if (v46) {
        id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v22 = *(id *)(v18 + 8 * v21 + 32);
      }
      uint64_t v23 = v22;
      uint64_t v24 = (CGColor *)[v22 CGColor:v45];
      unint64_t v25 = CGColorGetColorSpace(v24);

      if (!v25) {
        goto LABEL_28;
      }
      unint64_t v47 = v17;
      uint64_t v26 = v19;
      uint64_t v27 = (void *)v18;
      CFStringRef v28 = CGColorSpaceCopyName(v25);
      if (!v28) {
        goto LABEL_27;
      }
      char v29 = (__CFString *)v28;
      type metadata accessor for CFString(0);
      sub_100011B8C();
      uint64_t v30 = (id)kCGColorSpaceSRGB;
      char v31 = static _CFObject.== infix(_:_:)();

      if (v31)
      {
      }
      else
      {
        float64x2_t v32 = v45;
        char v33 = static _CFObject.== infix(_:_:)();

        if ((v33 & 1) == 0)
        {
LABEL_27:

          unint64_t v18 = (unint64_t)v27;
          uint64_t v19 = v26;
          double v17 = v47;
LABEL_28:
          if (qword_100071088 != -1) {
            swift_once();
          }
          char v38 = byte_1000776A0;
          int v39 = (CGColor *)[v23 CGColor];
          CGColorSpaceRef result = (CGColorSpaceRef)UISCreateCachedColorTransform();
          if (!result) {
            goto LABEL_43;
          }
          NSString v40 = result;
          CGColorSpaceRef result = CGColorGetColorSpace(v39);
          if (!result) {
            goto LABEL_44;
          }
          CGColorSpaceRef v41 = result;
          CGColorSpaceRef result = (CGColorSpaceRef)CGColorRef.components.getter();
          if (!result) {
            goto LABEL_45;
          }
          CGColorTransformConvertColorComponents();

          swift_bridgeObjectRelease();
          uint64_t v34 = 0;
          uint64_t v35 = 0;
          uint64_t v37 = 0;
          CGFloat Alpha = CGColorGetAlpha(v39);

          goto LABEL_34;
        }
      }
      sub_10001D21C(v23, (v31 & 1) == 0, (uint64_t)v48);
      uint64_t v34 = v48[0];
      uint64_t v35 = v48[1];
      uint64_t v37 = v48[2];
      CGFloat Alpha = *(double *)&v48[3];
      char v38 = v49;

      unint64_t v18 = (unint64_t)v27;
      uint64_t v19 = v26;
      double v17 = v47;
LABEL_34:
      unint64_t v43 = v17[2];
      unint64_t v42 = v17[3];
      if (v43 >= v42 >> 1) {
        sub_100031534((char *)(v42 > 1), v43 + 1, 1);
      }
      ++v21;
      v17[2] = v43 + 1;
      uint64_t v44 = (CGFloat *)&v17[5 * v43];
      *((void *)v44 + 4) = v34;
      *((void *)v44 + 5) = v35;
      *((void *)v44 + 6) = v37;
      v44[7] = Alpha;
      *((unsigned char *)v44 + 64) = v38;
      if (v19 == v21)
      {
        swift_bridgeObjectRelease();
        return (CGColorSpaceRef)v17;
      }
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

void *sub_1000115BC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v10 = _swiftEmptyArrayStorage;
  sub_100031554(0, v2, 0);
  id v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_100011CA8(i, (uint64_t)v9);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100031554(0, v3[2] + 1, 1);
        id v3 = v10;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_100031554((char *)(v5 > 1), v6 + 1, 1);
        id v3 = v10;
      }
      v3[2] = v6 + 1;
      *(_OWORD *)&v3[2 * v6 + 4] = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    sub_100011D04(0, 0xF000000000000000);
    return 0;
  }
  return v3;
}

uint64_t sub_10001170C()
{
  if (qword_100071088 != -1) {
    swift_once();
  }
  int v0 = byte_1000776A0;
  sub_10000816C(&qword_1000718E8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10004FE70;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = 0x3FF0000000000000;
  double v2 = 0.156862745;
  if (!v0) {
    double v2 = 0.0;
  }
  double v3 = 0.380392157;
  if (v0) {
    double v3 = 0.37254902;
  }
  double v4 = 0.992156863;
  if (v0) {
    double v4 = 0.956862745;
  }
  double v5 = 0.2;
  if (v0) {
    double v5 = 0.392156863;
  }
  double v6 = 0.780392157;
  if (v0) {
    double v6 = 0.768627451;
  }
  double v7 = 0.349019608;
  if (v0) {
    double v7 = 0.4;
  }
  double v8 = 0.968627451;
  double v9 = 1.0;
  if (!v0) {
    double v8 = 1.0;
  }
  double v10 = 0.8;
  if (v0) {
    double v10 = 0.807843137;
  }
  double v11 = 0.00392156863;
  if (v0)
  {
    double v11 = 0.274509804;
    double v9 = 0.921568627;
  }
  double v12 = 0.22745098;
  if (v0) {
    double v12 = 0.301960784;
  }
  double v13 = 0.184313725;
  if (v0) {
    double v13 = 0.239215686;
  }
  *(unsigned char *)(v1 + 64) = v0;
  *(double *)(v1 + 72) = v2;
  *(double *)(v1 + 80) = v3;
  *(double *)(v1 + 88) = v4;
  *(void *)(v1 + 96) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 104) = v0;
  *(double *)(v1 + 112) = v5;
  *(double *)(v1 + 120) = v6;
  *(double *)(v1 + 128) = v7;
  *(void *)(v1 + 136) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 144) = v0;
  *(double *)(v1 + 152) = v8;
  *(double *)(v1 + 160) = v10;
  *(double *)(v1 + 168) = v11;
  *(void *)(v1 + 176) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 184) = v0;
  *(double *)(v1 + 192) = v9;
  *(double *)(v1 + 200) = v12;
  *(double *)(v1 + 208) = v13;
  *(void *)(v1 + 216) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 224) = v0;
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  sub_10000816C(&qword_1000718F0);
  sub_100011BE4(&qword_1000718F8, (void (*)(void))sub_100011A88);
  uint64_t v14 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  swift_release();
  id v17 = [self standardUserDefaults];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  NSString v19 = String._bridgeToObjectiveC()();
  [v17 setValue:isa forKey:v19];

  return sub_100011ADC(v14, v16);
}

id sub_100011A1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoritesStore();
  return [super dealloc];
}

uint64_t type metadata accessor for FavoritesStore()
{
  return self;
}

unint64_t sub_100011A88()
{
  unint64_t result = qword_100071900;
  if (!qword_100071900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071900);
  }
  return result;
}

uint64_t sub_100011ADC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100011B34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

unint64_t sub_100011B8C()
{
  unint64_t result = qword_100072F80;
  if (!qword_100072F80)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072F80);
  }
  return result;
}

uint64_t sub_100011BE4(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CA7C(&qword_1000718F0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100011C54()
{
  unint64_t result = qword_100071920;
  if (!qword_100071920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071920);
  }
  return result;
}

uint64_t sub_100011CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100011D04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100011ADC(a1, a2);
  }
  return a1;
}

unint64_t sub_100011D18()
{
  unint64_t result = qword_100071930;
  if (!qword_100071930)
  {
    sub_10000CA7C(&qword_1000718F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071930);
  }
  return result;
}

unint64_t sub_100011D74()
{
  unint64_t result = qword_100071938;
  if (!qword_100071938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071938);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchCrosshairView()
{
  return &type metadata for ColorSwatchCrosshairView;
}

uint64_t sub_100011DD8()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_100011DF4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  id v4 = [self systemBackgroundColor];
  uint64_t v5 = Color.init(uiColor:)();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v6 = static Alignment.center.getter();
  uint64_t v8 = v7;
  static Color.black.getter();
  uint64_t v9 = Color.opacity(_:)();
  swift_release();
  *(_OWORD *)a1 = xmmword_10004FF40;
  *(void *)(a1 + 16) = v3;
  double result = v12;
  *(void *)(a1 + 24) = v11;
  *(double *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v13;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v15;
  *(void *)(a1 + 64) = v5;
  *(_WORD *)(a1 + 72) = 256;
  *(void *)(a1 + 80) = v6;
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 104) = 0x4010000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for RoundedRectShape(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for RoundedRectShape(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RoundedRectShape(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RoundedRectShape()
{
  return &type metadata for RoundedRectShape;
}

unint64_t sub_100011F84()
{
  unint64_t result = qword_100071940;
  if (!qword_100071940)
  {
    sub_10000CA7C(&qword_100071948);
    sub_10000CC70(&qword_100071950, &qword_100071958);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071940);
  }
  return result;
}

uint64_t sub_100012024()
{
  return sub_10000CC70(&qword_100071960, &qword_100071968);
}

double sub_100012060@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  Path.init()();
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  CGRectGetMinX(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetMinY(v15);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGRectGetMaxX(v16);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetMinY(v17);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetMaxX(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetMaxY(v19);
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  CGRectGetMinX(v20);
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  CGRectGetMaxY(v21);
  Path.move(to:)();
  Path.addLine(to:)();
  Path.addArc(tangent1End:tangent2End:radius:transform:)();
  Path.addLine(to:)();
  Path.addArc(tangent1End:tangent2End:radius:transform:)();
  Path.addLine(to:)();
  Path.addArc(tangent1End:tangent2End:radius:transform:)();
  Path.addLine(to:)();
  Path.addArc(tangent1End:tangent2End:radius:transform:)();
  Path.closeSubpath()();
  double result = *(double *)&v11;
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 32) = v13;
  return result;
}

double sub_1000122D0@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_100012060((uint64_t)v8, a2, a3, a4, a5);
  double result = *(double *)v8;
  long long v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 32) = v9;
  return result;
}

uint64_t sub_100012324()
{
  return Shape.sizeThatFits(_:)();
}

void (*sub_10001233C(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_1000123AC;
}

void sub_1000123AC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_1000123F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100012614();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001245C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100012614();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000124C0(uint64_t a1)
{
  unint64_t v2 = sub_100012614();

  return Shape.body.getter(a1, v2);
}

unint64_t sub_100012510()
{
  unint64_t result = qword_100071970;
  if (!qword_100071970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071970);
  }
  return result;
}

unint64_t sub_100012568()
{
  unint64_t result = qword_100071978;
  if (!qword_100071978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071978);
  }
  return result;
}

unint64_t sub_1000125C0()
{
  unint64_t result = qword_100071980;
  if (!qword_100071980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071980);
  }
  return result;
}

unint64_t sub_100012614()
{
  unint64_t result = qword_100071988;
  if (!qword_100071988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071988);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ColorPickerView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ColorPickerView()
{
  return swift_release();
}

void *assignWithCopy for ColorPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for ColorPickerView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ColorPickerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ColorPickerView()
{
  return &type metadata for ColorPickerView;
}

unsigned char *initializeBufferWithCopyOfBuffer for SomeColor.ColorSpace(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Tab(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Tab(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x100012914);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10001293C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100012944(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Tab()
{
  return &type metadata for Tab;
}

uint64_t sub_10001295C()
{
  return sub_10000CC70(&qword_100071990, &qword_100071998);
}

uint64_t sub_100012998(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6D75727463657053;
    }
    else {
      uint64_t v3 = 0x73726564696C53;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000;
    }
    else {
      unint64_t v4 = 0xE700000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6D75727463657053;
      }
      else {
        uint64_t v6 = 0x73726564696C53;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000;
      }
      else {
        unint64_t v7 = 0xE700000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1684632135;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1684632135)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

__n128 sub_100012AA4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_10000C800(v13, a9, &qword_1000719B8);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_10000816C(&qword_1000719C0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_100012C64@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  long long v24 = v13[5];
  a9[4] = v13[4];
  a9[5] = v24;
  long long v25 = v13[6];
  long long v26 = v13[1];
  *a9 = *v13;
  a9[1] = v26;
  long long v27 = v13[3];
  a9[2] = v13[2];
  a9[3] = v27;
  a9[6] = v25;
  a9[7] = v29;
  a9[8] = v30;
  a9[9] = v31;
  a9[12] = v34;
  a9[13] = v35;
  a9[10] = v32;
  a9[11] = v33;

  return sub_10001A218((uint64_t)v13);
}

uint64_t sub_100012E28()
{
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_100012F64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100012998(*a1, *a2);
}

Swift::Int sub_100012F70()
{
  return Hasher._finalize()();
}

uint64_t sub_10001300C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100013094()
{
  return Hasher._finalize()();
}

unint64_t sub_10001312C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100018F40(*a1);
  *a2 = result;
  return result;
}

void sub_10001315C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x6D75727463657053;
  if (v2 != 1)
  {
    uint64_t v5 = 0x73726564696C53;
    unint64_t v4 = 0xE700000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1684632135;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_1000131B4(void *a1@<X8>)
{
  *a1 = &off_100066448;
}

unint64_t sub_1000131C8()
{
  unint64_t result = qword_1000719A0;
  if (!qword_1000719A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000719A0);
  }
  return result;
}

uint64_t sub_10001321C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100013238@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000816C(&qword_1000719A8);
  __chkstk_darwin(v4 - 8);
  BOOL v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_10000816C(&qword_1000719B0);
  __chkstk_darwin(v40);
  char v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10000816C(&qword_1000719B8);
  __chkstk_darwin(v41);
  double v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000816C(&qword_1000719C0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000816C(&qword_1000719C8);
  __chkstk_darwin(v14);
  CGRect v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)BOOL v6 = static HorizontalAlignment.center.getter();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v17 = sub_10000816C(&qword_1000719D0);
  sub_10001379C((uint64_t *)&v6[*(int *)(v17 + 44)]);
  swift_retain();
  char v18 = sub_1000280F4();
  swift_release();
  uint64_t v42 = v14;
  if ((v18 & 1) == 0)
  {
    char v23 = static Edge.Set.all.getter();
    goto LABEL_9;
  }
  uint64_t v39 = a2;
  unsigned __int8 v19 = static Edge.Set.leading.getter();
  unsigned __int8 v20 = static Edge.Set.bottom.getter();
  unsigned __int8 v21 = static Edge.Set.trailing.getter();
  char v22 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v19) {
    char v22 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v20) {
    char v22 = Edge.Set.init(rawValue:)();
  }
  a2 = v39;
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v21)
  {
    char v23 = Edge.Set.init(rawValue:)();
LABEL_9:
    char v22 = v23;
  }
  id v24 = [self currentDevice];
  id v25 = [v24 userInterfaceIdiom];

  if (v25 != (id)6)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
  }
  EdgeInsets.init(_all:)();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_10000C800((uint64_t)v6, (uint64_t)v8, &qword_1000719A8);
  long long v34 = &v8[*(int *)(v40 + 36)];
  char *v34 = v22;
  *((void *)v34 + 1) = v27;
  *((void *)v34 + 2) = v29;
  *((void *)v34 + 3) = v31;
  *((void *)v34 + 4) = v33;
  v34[40] = 0;
  sub_10000C8F8((uint64_t)v6, &qword_1000719A8);
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  swift_retain();
  uint64_t v35 = static ObservableObject.environmentStore.getter();
  sub_10000C800((uint64_t)v8, (uint64_t)v10, &qword_1000719B0);
  unint64_t v36 = (uint64_t *)&v10[*(int *)(v41 + 36)];
  *unint64_t v36 = v35;
  v36[1] = a1;
  sub_10000C8F8((uint64_t)v8, &qword_1000719B0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  double v37 = v43;
  static Alignment.center.getter();
  sub_100012AA4(0.0, 1, v37, 0, 0.0, 1, 0.0, 1, (uint64_t)v13, 0.0, 1, 0.0, 1);
  sub_10000C8F8((uint64_t)v10, &qword_1000719B8);
  LOBYTE(v37) = static Edge.Set.all.getter();
  sub_10000C800((uint64_t)v13, (uint64_t)v16, &qword_1000719C0);
  v16[*(int *)(v42 + 36)] = LOBYTE(v37);
  sub_10000C8F8((uint64_t)v13, &qword_1000719C0);
  return sub_10000C590((uint64_t)v16, a2, &qword_1000719C8);
}

uint64_t sub_10001379C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = type metadata accessor for ColorPickerContent();
  uint64_t v2 = __chkstk_darwin(v1);
  long long v34 = (uint64_t *)((char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - v4;
  swift_retain();
  char v6 = sub_1000280F4();
  swift_release();
  if (v6)
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t v35 = EnvironmentObject.init()();
    uint64_t v39 = v7;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v35 = 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v40)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v36 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 1;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t v32 = EnvironmentObject.init()();
    uint64_t v8 = v12;
    unsigned __int8 v13 = static Edge.Set.bottom.getter();
    id v14 = [self currentDevice];
    id v15 = [v14 userInterfaceIdiom];

    if (v15 != (id)6)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
    }
    EdgeInsets.init(_all:)();
    uint64_t v37 = v16;
    uint64_t v38 = v17;
    uint64_t v36 = v18;
    uint64_t v10 = v19;
    uint64_t v9 = v13;
    uint64_t v11 = v32;
  }
  uint64_t v32 = v9;
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v20 = EnvironmentObject.init()();
  uint64_t v21 = (uint64_t)v34;
  uint64_t *v34 = v20;
  *(void *)(v21 + 8) = v22;
  char v23 = (uint64_t *)(v21 + *(int *)(v1 + 20));
  *char v23 = swift_getKeyPath();
  sub_10000816C(&qword_100071570);
  swift_storeEnumTagMultiPayload();
  uint64_t v31 = v5;
  sub_100019A0C(v21, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  sub_10001A2F4((uint64_t)v5, v21, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  uint64_t v24 = v35;
  id v25 = v33;
  *uint64_t v33 = v35;
  uint64_t v26 = v24;
  v25[1] = v39;
  v25[2] = v11;
  v25[3] = v8;
  v25[4] = v9;
  uint64_t v27 = v38;
  v25[5] = v37;
  v25[6] = v27;
  v25[7] = v36;
  v25[8] = v10;
  *((unsigned char *)v25 + 72) = 0;
  uint64_t v28 = sub_10000816C(&qword_1000719D8);
  sub_10001A2F4(v21, (uint64_t)v25 + *(int *)(v28 + 64), (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  uint64_t v29 = (char *)v25 + *(int *)(v28 + 80);
  *(void *)uint64_t v29 = 0;
  v29[8] = 0;
  sub_100018AC4(v26);
  sub_100018AC4(v11);
  sub_10001A35C((uint64_t)v31, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  sub_10001A35C(v21, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  sub_100018AD4(v11);
  return sub_100018AD4(v26);
}

uint64_t sub_100013C34@<X0>(uint64_t a1@<X8>)
{
  return sub_100013238(*(void *)(v1 + 8), a1);
}

uint64_t sub_100013C3C@<X0>(uint64_t a1@<X8>)
{
  v21[1] = a1;
  uint64_t v1 = type metadata accessor for SegmentedPickerStyle();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000816C(&qword_100071BF8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  EnvironmentObject.projectedValue.getter();
  swift_getKeyPath();
  EnvironmentObject.Wrapper.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v26 = v29;
  uint64_t v27 = v30;
  char v28 = v31;
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v11 = String._bridgeToObjectiveC()();
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [v10 localizedStringForKey:v11 value:0 table:v12];

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  uint64_t v22 = v14;
  uint64_t v23 = v16;
  sub_100010084();
  uint64_t v22 = Text.init<A>(_:)();
  uint64_t v23 = v17;
  char v24 = v18 & 1;
  uint64_t v25 = v19;
  sub_10000816C(&qword_100071C00);
  sub_100019BDC();
  sub_100019C30();
  Picker.init(selection:label:content:)();
  SegmentedPickerStyle.init()();
  sub_10000CC70(&qword_100071C18, &qword_100071BF8);
  View.pickerStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100013FFC()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000140D0@<X0>(uint64_t a1@<X8>)
{
  sub_100012E28();
  sub_100010084();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10001412C@<X0>(uint64_t a1@<X8>)
{
  return sub_100013C3C(a1);
}

uint64_t sub_100014134@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v2 = sub_10000816C(&qword_100071AA8);
  __chkstk_darwin(v2);
  char v4 = (uint64_t *)((char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_10000816C(&qword_100071AB0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000816C(&qword_100071AB8);
  __chkstk_darwin(v8);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v15)
    {
      sub_1000143FC((uint64_t)v10);
      NSString v11 = &qword_100071AB8;
      sub_10000C800((uint64_t)v10, (uint64_t)v7, &qword_100071AB8);
      swift_storeEnumTagMultiPayload();
      sub_100019430();
      sub_1000195D0();
      _ConditionalContent<>.init(storage:)();
      uint64_t v12 = (uint64_t)v10;
    }
    else
    {
      *char v4 = sub_1000147B4();
      sub_100014974(v1, (uint64_t)v4 + *(int *)(v2 + 44));
      NSString v11 = &qword_100071AA8;
      sub_10000C800((uint64_t)v4, (uint64_t)v7, &qword_100071AA8);
      swift_storeEnumTagMultiPayload();
      sub_100019430();
      sub_1000195D0();
      _ConditionalContent<>.init(storage:)();
      uint64_t v12 = (uint64_t)v4;
    }
    return sub_10000C8F8(v12, v11);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000143FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v1 = type metadata accessor for LayoutDirection();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for ColorSwatchPickerView();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  id v10 = (char *)&v26 - v9;
  uint64_t v26 = sub_10000816C(&qword_100071AD0);
  __chkstk_darwin(v26);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v8 = swift_getKeyPath();
  sub_10000816C(&qword_100071B20);
  swift_storeEnumTagMultiPayload();
  id v13 = (uint64_t *)((char *)v8 + v5[5]);
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  *id v13 = EnvironmentObject.init()();
  v13[1] = v14;
  uint64_t v15 = v5[6];
  if (qword_100071068 != -1) {
    swift_once();
  }
  *(uint64_t *)((char *)v8 + v15) = qword_100077698;
  uint64_t v16 = v5[7];
  uint64_t v17 = qword_100071070;
  swift_bridgeObjectRetain();
  if (v17 != -1) {
    swift_once();
  }
  *(uint64_t *)((char *)v8 + v16) = qword_100071FF0;
  sub_100019A0C((uint64_t)v8, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  swift_bridgeObjectRetain();
  sub_100015F28();
  uint64_t v19 = v18;
  sub_10001A2F4((uint64_t)v10, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  *(void *)&v12[*(int *)(v26 + 36)] = v19;
  sub_10001A35C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LayoutDirection.leftToRight(_:), v1);
  uint64_t v21 = sub_10000816C(&qword_100071AB8);
  uint64_t v22 = v27;
  uint64_t v23 = (uint64_t *)(v27 + *(int *)(v21 + 36));
  uint64_t v24 = sub_10000816C(&qword_100071AF0);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v23 + *(int *)(v24 + 28), v4, v1);
  *uint64_t v23 = KeyPath;
  sub_10000C800((uint64_t)v12, v22, &qword_100071AD0);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_10000C8F8((uint64_t)v12, &qword_100071AD0);
}

uint64_t sub_1000147B4()
{
  if (*v0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v4)
    {
      static VerticalAlignment.top.getter();
      id v1 = [self currentDevice];
      [v1 userInterfaceIdiom];

      sub_10000C320();
    }
    else
    {
      id v2 = [self currentDevice];
      [v2 userInterfaceIdiom];

      static HorizontalAlignment.center.getter();
      sub_10000C374();
    }
    return AnyLayout.init<A>(_:)();
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100014974@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000816C(&qword_100071B28);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000816C(&qword_100071B30);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)&v19 - v12;
  sub_100014BA4(a1, (uint64_t)v6);
  sub_10000C800((uint64_t)v6, (uint64_t)v11, &qword_100071B28);
  *(_WORD *)&v11[*(int *)(v8 + 44)] = 256;
  sub_10000C8F8((uint64_t)v6, &qword_100071B28);
  sub_10000C590((uint64_t)v11, (uint64_t)v13, &qword_100071B30);
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v14 = EnvironmentObject.init()();
  uint64_t v16 = v15;
  sub_10000C800((uint64_t)v13, (uint64_t)v11, &qword_100071B30);
  sub_10000C800((uint64_t)v11, a2, &qword_100071B30);
  uint64_t v17 = a2 + *(int *)(sub_10000816C(&qword_100071B38) + 48);
  *(void *)uint64_t v17 = v14;
  *(void *)(v17 + 8) = v16;
  *(void *)(v17 + 16) = sub_100016920;
  *(void *)(v17 + 24) = 0;
  *(unsigned char *)(v17 + 32) = 0;
  swift_retain();
  sub_10001975C();
  sub_10000C8F8((uint64_t)v13, &qword_100071B30);
  swift_release();
  sub_100019764();
  return sub_10000C8F8((uint64_t)v11, &qword_100071B30);
}

uint64_t sub_100014BA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v55 = sub_10000816C(&qword_100071B40);
  __chkstk_darwin(v55);
  uint64_t v4 = (void *)((char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_10000816C(&qword_100071B48);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for RGBAView();
  uint64_t v8 = __chkstk_darwin(v54);
  double v43 = (void *)((char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  uint64_t v45 = (uint64_t)v41 - v10;
  uint64_t v48 = sub_10000816C(&qword_100071B50);
  __chkstk_darwin(v48);
  uint64_t v44 = (_OWORD *)((char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = sub_10000816C(&qword_100071B58);
  __chkstk_darwin(v50);
  uint64_t v52 = (uint64_t)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_10000816C(&qword_100071B60);
  __chkstk_darwin(v47);
  uint64_t v14 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10000816C(&qword_100071B68);
  __chkstk_darwin(v51);
  char v49 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_10000816C(&qword_100071AB8);
  __chkstk_darwin(v46);
  uint64_t v42 = (uint64_t)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000816C(&qword_100071B70);
  __chkstk_darwin(v17);
  uint64_t v53 = (char *)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DynamicTypeSize();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ColorPickerContent();
  sub_1000182FC(&qword_100071570, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, (uint64_t)v22);
  char v23 = DynamicTypeSize.isAccessibilitySize.getter();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  if ((v23 & 1) == 0)
  {
    *uint64_t v4 = static Alignment.top.getter();
    v4[1] = v29;
    uint64_t v30 = sub_10000816C(&qword_100071B78);
    sub_10001599C((uint64_t)v4 + *(int *)(v30 + 44));
    sub_10000C800((uint64_t)v4, (uint64_t)v7, &qword_100071B40);
    swift_storeEnumTagMultiPayload();
    sub_10001976C();
    sub_10000CC70(&qword_100071BB8, &qword_100071B40);
    _ConditionalContent<>.init(storage:)();
    uint64_t v31 = (uint64_t)v4;
    uint64_t v32 = &qword_100071B40;
    return sub_10000C8F8(v31, v32);
  }
  v41[1] = v5;
  if (*a1)
  {
    uint64_t v24 = v7;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v57)
    {
      uint64_t v25 = (uint64_t)v7;
      if (v57 == 1)
      {
        uint64_t v26 = v44;
        sub_100015544(v44);
        sub_10000C800((uint64_t)v26, (uint64_t)v14, &qword_100071B50);
        swift_storeEnumTagMultiPayload();
        sub_100019430();
        sub_100019894();
        uint64_t v27 = (uint64_t)v49;
        _ConditionalContent<>.init(storage:)();
        sub_10000C800(v27, v52, &qword_100071B68);
        swift_storeEnumTagMultiPayload();
        sub_100019818();
        sub_10001A874(&qword_100071BB0, (void (*)(uint64_t))type metadata accessor for RGBAView);
        uint64_t v28 = (uint64_t)v53;
        _ConditionalContent<>.init(storage:)();
        sub_10000C8F8(v27, &qword_100071B68);
        sub_10000C8F8((uint64_t)v26, &qword_100071B50);
      }
      else
      {
        type metadata accessor for ColorPickerState();
        sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
        uint64_t v35 = EnvironmentObject.init()();
        uint64_t v36 = (uint64_t)v43;
        *double v43 = v35;
        *(void *)(v36 + 8) = v37;
        uint64_t v38 = (uint64_t *)(v36 + *(int *)(v54 + 20));
        uint64_t *v38 = swift_getKeyPath();
        sub_10000816C(&qword_100071570);
        swift_storeEnumTagMultiPayload();
        uint64_t v39 = v45;
        sub_100019A0C(v36, v45, (uint64_t (*)(void))type metadata accessor for RGBAView);
        sub_10001A2F4(v39, v52, (uint64_t (*)(void))type metadata accessor for RGBAView);
        swift_storeEnumTagMultiPayload();
        sub_100019818();
        sub_10001A874(&qword_100071BB0, (void (*)(uint64_t))type metadata accessor for RGBAView);
        uint64_t v28 = (uint64_t)v53;
        _ConditionalContent<>.init(storage:)();
        sub_10001A35C(v39, (uint64_t (*)(void))type metadata accessor for RGBAView);
      }
    }
    else
    {
      uint64_t v33 = v42;
      sub_1000143FC(v42);
      sub_10000C800(v33, (uint64_t)v14, &qword_100071AB8);
      swift_storeEnumTagMultiPayload();
      sub_100019430();
      sub_100019894();
      uint64_t v34 = (uint64_t)v49;
      _ConditionalContent<>.init(storage:)();
      sub_10000C800(v34, v52, &qword_100071B68);
      swift_storeEnumTagMultiPayload();
      sub_100019818();
      sub_10001A874(&qword_100071BB0, (void (*)(uint64_t))type metadata accessor for RGBAView);
      uint64_t v28 = (uint64_t)v53;
      _ConditionalContent<>.init(storage:)();
      sub_10000C8F8(v34, &qword_100071B68);
      sub_10000C8F8(v33, &qword_100071AB8);
      uint64_t v25 = (uint64_t)v24;
    }
    sub_10000C800(v28, v25, &qword_100071B70);
    swift_storeEnumTagMultiPayload();
    sub_10001976C();
    sub_10000CC70(&qword_100071BB8, &qword_100071B40);
    _ConditionalContent<>.init(storage:)();
    uint64_t v31 = v28;
    uint64_t v32 = &qword_100071B70;
    return sub_10000C8F8(v31, v32);
  }
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_100015544@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v34 = sub_10000816C(&qword_100071AF0);
  __chkstk_darwin(v34);
  uint64_t v4 = (uint64_t *)&v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v36 = type metadata accessor for LayoutDirection();
  uint64_t v5 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v35 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v33 = v1;
  uint64_t v7 = *v1;
  if (*v1)
  {
    uint64_t v8 = (void *)swift_allocObject();
    _OWORD v8[2] = 0;
    v8[3] = 0;
    v8[4] = v7;
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v7;
    swift_retain_n();
    Binding.init(get:set:)();
    uint64_t v31 = *((void *)&v47 + 1);
    uint64_t v32 = v47;
    long long v30 = v48;
    long long v10 = v49;
    int v29 = v50;
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t v11 = EnvironmentObject.init()();
    uint64_t v13 = v12;
    long long v37 = 0uLL;
    LOBYTE(v38) = 1;
    sub_10000816C(&qword_100071BC0);
    State.init(wrappedValue:)();
    long long v14 = v47;
    char v15 = v48;
    uint64_t v16 = *((void *)&v48 + 1);
    long long v37 = 0u;
    long long v38 = 0u;
    LOBYTE(v39) = 2;
    sub_10000816C(&qword_100071BC8);
    State.init(wrappedValue:)();
    long long v37 = v14;
    LOBYTE(v38) = v15;
    *((void *)&v38 + 1) = v16;
    long long v39 = v47;
    long long v40 = v48;
    LOBYTE(v41) = v49;
    *((void *)&v41 + 1) = *((void *)&v49 + 1);
    *(void *)&long long v42 = v32;
    *((void *)&v42 + 1) = v31;
    long long v43 = v30;
    long long v44 = v10;
    LOBYTE(v45) = v29;
    *((void *)&v45 + 1) = v11;
    uint64_t v46 = v13;
    sub_100015F28();
    long long v53 = v43;
    long long v54 = v44;
    long long v55 = v45;
    *(void *)&long long v56 = v46;
    long long v49 = v39;
    long long v50 = v40;
    long long v51 = v41;
    long long v52 = v42;
    long long v47 = v37;
    long long v48 = v38;
    *((void *)&v56 + 1) = v17;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v20 = v35;
    uint64_t v19 = v36;
    (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v35, enum case for LayoutDirection.leftToRight(_:), v36);
    (*(void (**)(char *, unsigned char *, uint64_t))(v5 + 16))((char *)v4 + *(int *)(v34 + 28), v20, v19);
    *uint64_t v4 = KeyPath;
    uint64_t v21 = sub_10000816C(&qword_100071B50);
    sub_10000C800((uint64_t)v4, (uint64_t)a1 + *(int *)(v21 + 36), &qword_100071AF0);
    long long v22 = v54;
    a1[6] = v53;
    a1[7] = v22;
    long long v23 = v56;
    a1[8] = v55;
    a1[9] = v23;
    long long v24 = v50;
    a1[2] = v49;
    a1[3] = v24;
    long long v25 = v52;
    a1[4] = v51;
    a1[5] = v25;
    long long v26 = v48;
    *a1 = v47;
    a1[1] = v26;
    sub_100019A7C((uint64_t)&v47);
    sub_10000C8F8((uint64_t)v4, &qword_100071AF0);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v20, v19);
    return sub_100019AE4((uint64_t)&v37);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001599C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v55 = type metadata accessor for RGBAView() - 8;
  uint64_t v1 = __chkstk_darwin(v55);
  long long v54 = (uint64_t *)((char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v1);
  uint64_t v57 = (uint64_t)&v49 - v3;
  uint64_t v59 = sub_10000816C(&qword_100071BD0) - 8;
  uint64_t v4 = __chkstk_darwin(v59);
  uint64_t v56 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v58 = (uint64_t)&v49 - v6;
  uint64_t v7 = sub_10000816C(&qword_100071B50);
  __chkstk_darwin(v7 - 8);
  long long v52 = (_OWORD *)((char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = sub_10000816C(&qword_100071BD8) - 8;
  uint64_t v9 = __chkstk_darwin(v50);
  uint64_t v51 = (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v53 = (uint64_t)&v49 - v11;
  uint64_t v12 = sub_10000816C(&qword_100071AB8);
  __chkstk_darwin(v12 - 8);
  long long v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000816C(&qword_100071BE0);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v49 - v20;
  sub_1000143FC((uint64_t)v14);
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v22 = EnvironmentObject.init()();
  uint64_t v24 = v23;
  sub_10000C800((uint64_t)v14, (uint64_t)v19, &qword_100071AB8);
  long long v25 = &v19[*(int *)(v16 + 44)];
  *(void *)long long v25 = v22;
  *((void *)v25 + 1) = v24;
  v25[16] = 0;
  sub_10000C8F8((uint64_t)v14, &qword_100071AB8);
  uint64_t v26 = (uint64_t)v21;
  sub_10000C590((uint64_t)v19, (uint64_t)v21, &qword_100071BE0);
  uint64_t v27 = v52;
  sub_100015544(v52);
  uint64_t v28 = EnvironmentObject.init()();
  uint64_t v30 = v29;
  uint64_t v31 = v51;
  sub_10000C800((uint64_t)v27, v51, &qword_100071B50);
  uint64_t v32 = v31 + *(int *)(v50 + 44);
  *(void *)uint64_t v32 = v28;
  *(void *)(v32 + 8) = v30;
  *(unsigned char *)(v32 + 16) = 1;
  sub_10000C8F8((uint64_t)v27, &qword_100071B50);
  uint64_t v33 = v53;
  sub_10000C590(v31, v53, &qword_100071BD8);
  uint64_t v34 = EnvironmentObject.init()();
  uint64_t v36 = (uint64_t)v54;
  uint64_t v35 = v55;
  *long long v54 = v34;
  *(void *)(v36 + 8) = v37;
  long long v38 = (uint64_t *)(v36 + *(int *)(v35 + 28));
  uint64_t *v38 = swift_getKeyPath();
  sub_10000816C(&qword_100071570);
  swift_storeEnumTagMultiPayload();
  uint64_t v39 = v57;
  sub_100019A0C(v36, v57, (uint64_t (*)(void))type metadata accessor for RGBAView);
  uint64_t v40 = EnvironmentObject.init()();
  uint64_t v42 = v41;
  uint64_t v43 = v56;
  sub_10001A2F4(v39, v56, (uint64_t (*)(void))type metadata accessor for RGBAView);
  uint64_t v44 = v43 + *(int *)(v59 + 44);
  *(void *)uint64_t v44 = v40;
  *(void *)(v44 + 8) = v42;
  *(unsigned char *)(v44 + 16) = 2;
  sub_10001A35C(v39, (uint64_t (*)(void))type metadata accessor for RGBAView);
  uint64_t v45 = v58;
  sub_10000C590(v43, v58, &qword_100071BD0);
  sub_10000C800(v26, (uint64_t)v19, &qword_100071BE0);
  sub_10000C800(v33, v31, &qword_100071BD8);
  sub_10000C800(v45, v43, &qword_100071BD0);
  uint64_t v46 = v60;
  sub_10000C800((uint64_t)v19, v60, &qword_100071BE0);
  uint64_t v47 = sub_10000816C(&qword_100071BE8);
  sub_10000C800(v31, v46 + *(int *)(v47 + 48), &qword_100071BD8);
  sub_10000C800(v43, v46 + *(int *)(v47 + 64), &qword_100071BD0);
  sub_10000C8F8(v45, &qword_100071BD0);
  sub_10000C8F8(v33, &qword_100071BD8);
  sub_10000C8F8(v26, &qword_100071BE0);
  sub_10000C8F8(v43, &qword_100071BD0);
  sub_10000C8F8(v31, &qword_100071BD8);
  return sub_10000C8F8((uint64_t)v19, &qword_100071BE0);
}

uint64_t sub_100015F28()
{
  uint64_t v1 = type metadata accessor for ColorPickerContent();
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*v0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    char v4 = v6[15];
    sub_10001A2F4((uint64_t)v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
    if ((v4 & 1) == 0) {
      return sub_10001A35C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
    }
    if (*v3)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      return sub_10001A35C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
    }
  }
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_100016130()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100016154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100018664(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

uint64_t sub_100016180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W3>, uint64_t a4@<X8>)
{
  int v32 = a3;
  uint64_t v34 = a1;
  uint64_t v35 = a4;
  uint64_t v33 = sub_10000816C(&qword_100071D38);
  __chkstk_darwin(v33);
  uint64_t v6 = &v31[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10000816C(&qword_100071D40);
  __chkstk_darwin(v7);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_10000816C(&qword_100071D48);
  __chkstk_darwin(v10);
  uint64_t v12 = &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10000816C(&qword_100071D50);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = &v31[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    unint64_t v16 = 0xE800000000000000;
    uint64_t v17 = 0x6D75727463657053;
    if (v36 != 1)
    {
      uint64_t v17 = 0x73726564696C53;
      unint64_t v16 = 0xE700000000000000;
    }
    if (v36) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 1684632135;
    }
    if (v36) {
      unint64_t v19 = v16;
    }
    else {
      unint64_t v19 = 0xE400000000000000;
    }
    if ((_BYTE)v32)
    {
      if (v32 == 1)
      {
        unint64_t v20 = 0xE800000000000000;
        if (v18 != 0x6D75727463657053) {
          goto LABEL_19;
        }
      }
      else
      {
        unint64_t v20 = 0xE700000000000000;
        if (v18 != 0x73726564696C53) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      unint64_t v20 = 0xE400000000000000;
      if (v18 != 1684632135) {
        goto LABEL_19;
      }
    }
    if (v19 == v20)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v21 = v35;
      goto LABEL_20;
    }
LABEL_19:
    char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v35;
    if ((v22 & 1) == 0)
    {
      char v24 = 0;
      double v23 = 0.0;
      goto LABEL_22;
    }
LABEL_20:
    double v23 = 1.0;
    char v24 = 1;
LABEL_22:
    uint64_t v25 = v34;
    uint64_t v26 = sub_10000816C(&qword_100071D58);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v6, v25, v26);
    *(double *)&v6[*(int *)(v33 + 36)] = v23;
    sub_10000C800((uint64_t)v6, (uint64_t)v9, &qword_100071D38);
    v9[*(int *)(v7 + 36)] = v24;
    sub_10000C8F8((uint64_t)v6, &qword_100071D38);
    LOBYTE(v25) = v24 ^ 1;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = swift_allocObject();
    *(unsigned char *)(v28 + 16) = v25;
    sub_10000C800((uint64_t)v9, (uint64_t)v12, &qword_100071D40);
    uint64_t v29 = (uint64_t *)&v12[*(int *)(v10 + 36)];
    *uint64_t v29 = KeyPath;
    v29[1] = (uint64_t)sub_10001AE14;
    v29[2] = v28;
    sub_10000C8F8((uint64_t)v9, &qword_100071D40);
    sub_10001AE1C();
    View.accessibilityHidden(_:)();
    sub_10000C8F8((uint64_t)v12, &qword_100071D48);
    return sub_10000C590((uint64_t)v15, v21, &qword_100071D50);
  }
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_100016600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100016180(a1, *(void *)v2, *(unsigned __int8 *)(v2 + 16), a2);
}

uint64_t sub_10001660C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  v19[0] = a1;
  v19[1] = a2;
  uint64_t v4 = sub_10000816C(&qword_100071C38);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000816C(&qword_100071C40);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000816C(&qword_100071C48);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  if (v15 == (id)6)
  {
    v16(v13, (char *)v19[0], v10);
    v16(v9, v13, v10);
    swift_storeEnumTagMultiPayload();
    sub_10000CC70(&qword_100071C50, &qword_100071C48);
    sub_10001A244();
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    v16(v6, (char *)v19[0], v10);
    uint64_t v18 = &v6[*(int *)(v4 + 36)];
    *(double *)uint64_t v18 = a3;
    *((_WORD *)v18 + 4) = 0;
    sub_10000C800((uint64_t)v6, (uint64_t)v9, &qword_100071C38);
    swift_storeEnumTagMultiPayload();
    sub_10000CC70(&qword_100071C50, &qword_100071C48);
    sub_10001A244();
    _ConditionalContent<>.init(storage:)();
    return sub_10000C8F8((uint64_t)v6, &qword_100071C38);
  }
}

uint64_t sub_100016914@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001660C(a1, a2, *v2);
}

uint64_t sub_100016920()
{
  return sub_10002FE08();
}

uint64_t sub_100016958@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = sub_10000816C(&qword_100071C68);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v43 - v6;
  uint64_t v8 = sub_10000816C(&qword_100071C70);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = type metadata accessor for ColorSlider(0);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)&v43 - v18;
  uint64_t v20 = sub_10000816C(&qword_100071C78);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  double v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v44 = (uint64_t)&v43 - v24;
  uint64_t v45 = a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v48)
    {
      type metadata accessor for ColorPickerState();
      sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
      uint64_t v25 = EnvironmentObject.init()();
      uint64_t v27 = v26;
      *(void *)&v19[*(int *)(v14 + 24)] = swift_getKeyPath();
      sub_10000816C(&qword_100071570);
      swift_storeEnumTagMultiPayload();
      *unint64_t v19 = 3;
      *((void *)v19 + 1) = v25;
      *((void *)v19 + 2) = v27;
      uint64_t v28 = *(int *)(v14 + 28);
      static Font.Weight.semibold.getter();
      *(void *)&v19[v28] = v29;
      id v30 = [self currentDevice];
      id v31 = [v30 userInterfaceIdiom];

      if (v31 == (id)6)
      {
        uint64_t v32 = type metadata accessor for Divider();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v13, 1, 1, v32);
      }
      else
      {
        Divider.init()();
        uint64_t v37 = type metadata accessor for Divider();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v13, 0, 1, v37);
      }
      uint64_t v36 = v46;
      uint64_t v35 = (uint64_t)v47;
      sub_10001A2F4((uint64_t)v19, (uint64_t)v17, type metadata accessor for ColorSlider);
      sub_10000C800((uint64_t)v13, (uint64_t)v11, &qword_100071C70);
      sub_10001A2F4((uint64_t)v17, (uint64_t)v23, type metadata accessor for ColorSlider);
      uint64_t v38 = sub_10000816C(&qword_100071C98);
      sub_10000C800((uint64_t)v11, (uint64_t)&v23[*(int *)(v38 + 48)], &qword_100071C70);
      sub_10000C8F8((uint64_t)v13, &qword_100071C70);
      sub_10001A35C((uint64_t)v19, type metadata accessor for ColorSlider);
      sub_10000C8F8((uint64_t)v11, &qword_100071C70);
      sub_10001A35C((uint64_t)v17, type metadata accessor for ColorSlider);
      uint64_t v39 = sub_10000816C(&qword_100071C80);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v23, 0, 1, v39);
      uint64_t v34 = v44;
      sub_10000C590((uint64_t)v23, v44, &qword_100071C78);
    }
    else
    {
      uint64_t v33 = sub_10000816C(&qword_100071C80);
      uint64_t v34 = v44;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v44, 1, 1, v33);
      uint64_t v36 = v46;
      uint64_t v35 = (uint64_t)v47;
    }
    *(void *)uint64_t v7 = static VerticalAlignment.top.getter();
    *((void *)v7 + 1) = 0x4030000000000000;
    v7[16] = 0;
    uint64_t v40 = sub_10000816C(&qword_100071C88);
    sub_100016F80(v45, &v7[*(int *)(v40 + 44)]);
    sub_10000C800(v34, (uint64_t)v23, &qword_100071C78);
    sub_10000C800((uint64_t)v7, v35, &qword_100071C68);
    sub_10000C800((uint64_t)v23, v36, &qword_100071C78);
    uint64_t v41 = sub_10000816C(&qword_100071C90);
    sub_10000C800(v35, v36 + *(int *)(v41 + 48), &qword_100071C68);
    sub_10000C8F8((uint64_t)v7, &qword_100071C68);
    sub_10000C8F8(v34, &qword_100071C78);
    sub_10000C8F8(v35, &qword_100071C68);
    return sub_10000C8F8((uint64_t)v23, &qword_100071C78);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100016F80@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v111 = a2;
  uint64_t v108 = type metadata accessor for ContentShapeKinds();
  uint64_t v102 = *(void *)(v108 - 8);
  uint64_t v103 = v108 - 8;
  *(void *)&long long v104 = v102;
  __chkstk_darwin(v108 - 8);
  uint64_t v107 = &v82[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v88 = sub_10000816C(&qword_1000716A8) - 8;
  __chkstk_darwin(v88);
  unint64_t v87 = &v82[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v113 = type metadata accessor for RoundedRectangle() - 8;
  uint64_t v5 = __chkstk_darwin(v113);
  unsigned __int8 v106 = (double *)&v82[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v8 = (double *)&v82[-v7];
  uint64_t v9 = sub_10000816C(&qword_100071CA0);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v82[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v90 = sub_10000816C(&qword_100071CA8);
  __chkstk_darwin(v90);
  uint64_t v89 = &v82[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_10000816C(&qword_100071CB0);
  __chkstk_darwin(v14 - 8);
  uint64_t v98 = &v82[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v101 = sub_10000816C(&qword_100071CB8);
  __chkstk_darwin(v101);
  uint64_t v99 = &v82[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v110 = sub_10000816C(&qword_100071CC0);
  uint64_t v109 = *(void *)(v110 - 8);
  uint64_t v17 = __chkstk_darwin(v110);
  unsigned long long v114 = &v82[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v105 = &v82[-v20];
  __chkstk_darwin(v19);
  uint64_t v112 = &v82[-v21];
  unsigned __int8 v100 = a1;
  uint64_t v22 = *a1;
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  EnvironmentObject.projectedValue.getter();
  swift_getKeyPath();
  EnvironmentObject.Wrapper.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v23 = v115;
  uint64_t v24 = v116;
  long long v86 = v117;
  uint64_t v85 = v118;
  uint64_t v84 = v119;
  int v83 = v120;
  id v97 = self;
  id v25 = [v97 currentDevice];
  id v26 = [v25 userInterfaceIdiom];

  double v27 = 10.0;
  if (v26 == (id)6) {
    double v28 = 22.0;
  }
  else {
    double v28 = 10.0;
  }
  uint64_t v29 = (char *)v8 + *(int *)(v113 + 28);
  uint64_t v30 = enum case for RoundedCornerStyle.continuous(_:);
  unsigned int v94 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v93 = type metadata accessor for RoundedCornerStyle();
  uint64_t v31 = *(void *)(v93 - 8);
  uint64_t v92 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 104);
  uint64_t v95 = v31 + 104;
  v92(v29, v30, v93);
  *uint64_t v8 = v28;
  v8[1] = v28;
  uint64_t v32 = v87;
  uint64_t v91 = &type metadata accessor for RoundedRectangle;
  sub_10001A2F4((uint64_t)v8, (uint64_t)v87, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)&v32[*(int *)(v88 + 44)] = 256;
  sub_10000C800((uint64_t)v32, (uint64_t)&v12[*(int *)(v10 + 44)], &qword_1000716A8);
  *(void *)uint64_t v12 = v23;
  *((void *)v12 + 1) = v24;
  *((_OWORD *)v12 + 1) = v86;
  uint64_t v33 = v84;
  *((void *)v12 + 4) = v85;
  *((void *)v12 + 5) = v33;
  v12[48] = v83;
  swift_retain();
  swift_retain();
  sub_10000C8F8((uint64_t)v32, &qword_1000716A8);
  sub_10001A35C((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release();
  swift_release();
  uint64_t v96 = v22;
  sub_10001A3BC(v22);
  sub_10001A3BC(v22);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v34 = v89;
  sub_10000C800((uint64_t)v12, (uint64_t)v89, &qword_100071CA0);
  uint64_t v35 = &v34[*(int *)(v90 + 36)];
  long long v36 = v124;
  *uint64_t v35 = v123;
  v35[1] = v36;
  v35[2] = v125;
  sub_10000C8F8((uint64_t)v12, &qword_100071CA0);
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v38 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v39 = String._bridgeToObjectiveC()();
  NSString v40 = String._bridgeToObjectiveC()();
  id v41 = [v38 localizedStringForKey:v39 value:0 table:v40];

  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v44 = v43;

  uint64_t v115 = v42;
  uint64_t v116 = v44;
  sub_100010084();
  uint64_t v45 = Text.init<A>(_:)();
  uint64_t v47 = v46;
  char v49 = v48 & 1;
  sub_10001923C(&qword_100071CC8, &qword_100071CA8, (void (*)(void))sub_10001A54C);
  uint64_t v50 = (uint64_t)v98;
  View.accessibility(label:)();
  sub_1000100D8(v45, v47, v49);
  swift_bridgeObjectRelease();
  sub_10000C8F8((uint64_t)v34, &qword_100071CA8);
  sub_10000816C(&qword_100071CE0);
  uint64_t v51 = v104;
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_10004EEF0;
  static ContentShapeKinds.dragPreview.getter();
  uint64_t v115 = v52;
  sub_10001A874(&qword_100071CE8, (void (*)(uint64_t))&type metadata accessor for ContentShapeKinds);
  sub_10000816C(&qword_100071CF0);
  sub_10000CC70(&qword_100071CF8, &qword_100071CF0);
  uint64_t v53 = v107;
  uint64_t v54 = v108;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  id v55 = [v97 currentDevice];
  id v56 = [v55 userInterfaceIdiom];

  if (v56 == (id)6) {
    double v27 = 22.0;
  }
  uint64_t v57 = v106;
  v92((char *)v106 + *(int *)(v113 + 28), v94, v93);
  *uint64_t v57 = v27;
  v57[1] = v27;
  uint64_t v58 = (uint64_t)v99;
  uint64_t v59 = (uint64_t)&v99[*(int *)(v101 + 36)];
  uint64_t v60 = v91;
  sub_10001A2F4((uint64_t)v57, v59, (uint64_t (*)(void))v91);
  uint64_t v61 = sub_10000816C(&qword_100071D00);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v51 + 16))(v59 + *(int *)(v61 + 40), v53, v54);
  *(unsigned char *)(v59 + *(int *)(v61 + 36)) = 0;
  sub_10000C800(v50, v58, &qword_100071CB0);
  sub_10001A35C((uint64_t)v57, (uint64_t (*)(void))v60);
  (*(void (**)(unsigned char *, uint64_t))(v51 + 8))(v53, v54);
  sub_10000C8F8(v50, &qword_100071CB0);
  unint64_t v62 = v100;
  long long v126 = *((_OWORD *)v100 + 1);
  char v127 = *((unsigned char *)v100 + 32);
  uint64_t v63 = swift_allocObject();
  long long v64 = *((_OWORD *)v62 + 1);
  *(_OWORD *)(v63 + 16) = *(_OWORD *)v62;
  *(_OWORD *)(v63 + 32) = v64;
  *(unsigned char *)(v63 + 48) = *((unsigned char *)v62 + 32);
  swift_retain();
  sub_10001A64C((uint64_t)&v126);
  sub_10001A680();
  NSString v65 = v105;
  View.onDrag(_:)();
  swift_release();
  sub_10000C8F8(v58, &qword_100071CB8);
  uint64_t v66 = v109;
  uint64_t v67 = v112;
  uint64_t v68 = v65;
  uint64_t v69 = v110;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v109 + 32))(v112, v68, v110);
  uint64_t v113 = static HorizontalAlignment.center.getter();
  sub_100017DF8((long long *)v62, (uint64_t)&v115);
  uint64_t v108 = v115;
  uint64_t v70 = v116;
  uint64_t v107 = (unsigned char *)v117;
  LODWORD(v106) = BYTE8(v117);
  uint64_t v105 = v118;
  char v71 = v119;
  long long v104 = v120;
  uint64_t v73 = v121;
  uint64_t v72 = v122;
  uint64_t v74 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v66 + 16);
  float64x2_t v75 = v114;
  float64x2_t v76 = v67;
  uint64_t v77 = v69;
  v74(v114, v76, v69);
  float64x2_t v78 = v111;
  v74(v111, v75, v77);
  char v79 = &v78[*(int *)(sub_10000816C(&qword_100071D20) + 48)];
  *(void *)char v79 = v113;
  *((void *)v79 + 1) = 0;
  v79[16] = 1;
  *((void *)v79 + 3) = v108;
  *((void *)v79 + 4) = v70;
  *((void *)v79 + 5) = v107;
  v79[48] = (_BYTE)v106;
  *((void *)v79 + 7) = v105;
  v79[64] = v71;
  *(_OWORD *)(v79 + 72) = v104;
  *((void *)v79 + 11) = v73;
  *((void *)v79 + 12) = v72;
  char v80 = *(void (**)(unsigned char *, uint64_t))(v66 + 8);
  swift_retain();
  swift_retain();
  v80(v112, v77);
  swift_release();
  swift_release();
  return ((uint64_t (*)(unsigned char *, uint64_t))v80)(v114, v77);
}

uint64_t sub_100017CA4(void *a1)
{
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v5 == 2) {
      id v1 = [self clearColor];
    }
    else {
      sub_10001C400();
    }
    uint64_t v2 = v1;
    id v3 = [objc_allocWithZone((Class)NSItemProvider) initWithObject:v1];

    return (uint64_t)v3;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100017DF8@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v16 = *a1;
  uint64_t v4 = swift_allocObject();
  long long v5 = a1[1];
  *(_OWORD *)(v4 + 16) = *a1;
  *(_OWORD *)(v4 + 32) = v5;
  *(unsigned char *)(v4 + 48) = *((unsigned char *)a1 + 32);
  uint64_t v6 = v16;
  sub_10001A848((uint64_t)&v16);
  sub_10001975C();
  sub_10001A3BC(v6);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  type metadata accessor for FavoriteColorPickerView.Model();
  sub_10001A874(&qword_100071D28, (void (*)(uint64_t))type metadata accessor for FavoriteColorPickerView.Model);
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = 0;
  uint64_t v8 = 0;
  if (v9 >= 2)
  {
    StateObject.wrappedValue.getter();
    uint64_t result = ObservedObject.init(wrappedValue:)();
  }
  *(void *)a2 = sub_10001A840;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v10;
  *(unsigned char *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v15;
  *(void *)(a2 + 64) = result;
  *(void *)(a2 + 72) = v8;
  return result;
}

uint64_t sub_100018020@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for FavoriteColorPickerView.Model();
  sub_10001A874(&qword_100071D28, (void (*)(uint64_t))type metadata accessor for FavoriteColorPickerView.Model);
  StateObject.wrappedValue.getter();
  GeometryProxy.size.getter();
  uint64_t v4 = *a1;
  uint64_t v19 = sub_10001A8C4(*a1, v5);
  type metadata accessor for ColorPickerState();
  sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v18 = EnvironmentObject.init()();
  uint64_t v7 = v6;
  uint64_t v8 = ObservedObject.init(wrappedValue:)();
  uint64_t v10 = v9;
  sub_100033138((uint64_t)&_swiftEmptyArrayStorage);
  sub_10000816C(&qword_100071D30);
  State.init(wrappedValue:)();
  char v11 = static Edge.Set.horizontal.getter();
  GeometryProxy.size.getter();
  sub_10001AB74(v4, v12);
  uint64_t result = EdgeInsets.init(_all:)();
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v21;
  *(unsigned char *)(a2 + 56) = v11;
  *(void *)(a2 + 64) = v14;
  *(void *)(a2 + 72) = v15;
  *(void *)(a2 + 80) = v16;
  *(void *)(a2 + 88) = v17;
  *(unsigned char *)(a2 + 96) = 0;
  return result;
}

uint64_t sub_1000181D0@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v9[0] = *(_OWORD *)v1;
  v9[1] = v3;
  LOBYTE(v10) = *(unsigned char *)(v1 + 32);
  id v4 = [self currentDevice:v9[0] deviceType:v3 deviceSubtype:v10];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)6) {
    uint64_t v6 = 0x4038000000000000;
  }
  else {
    uint64_t v6 = 0x4036000000000000;
  }
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v7 = sub_10000816C(&qword_100071C60);
  return sub_100016958((uint64_t *)v9, a1 + *(int *)(v7 + 44));
}

uint64_t sub_100018280@<X0>(uint64_t a1@<X8>)
{
  return sub_1000182FC(&qword_100071570, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_1000182C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000182FC(&qword_100071B20, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_1000182FC@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v23 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = type metadata accessor for EnvironmentValues();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000816C(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C800(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = static os_log_type_t.fault.getter();
    uint64_t v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_100018AE4(a3, v23, &v24);
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_100018584@<X0>(uint64_t a1@<X8>)
{
  return sub_1000182FC(&qword_100071DC0, (uint64_t (*)(void))&type metadata accessor for LayoutDirection, 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_1000185C4()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_1000185E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100018664(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_100018614()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100018638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100018664(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100018664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_100018734@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100018748()
{
  return sub_1000188FC();
}

double sub_10001875C@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1000187DC()
{
  return static Published.subscript.setter();
}

uint64_t sub_100018858@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_10001886C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000188E8()
{
  return sub_1000188FC();
}

uint64_t sub_1000188FC()
{
  return static Published.subscript.setter();
}

uint64_t sub_10001896C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100018994()
{
  return sub_1000188FC();
}

uint64_t type metadata accessor for ColorPickerContent()
{
  uint64_t result = qword_100071A38;
  if (!qword_100071A38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100018A10@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100018A38()
{
  return sub_1000188FC();
}

uint64_t sub_100018A60()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_100018A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100018664(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_100018AC4(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100018AD4(uint64_t result)
{
  if (result != 1) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100018AE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_100018BB8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100011CA8((uint64_t)v12, *a3);
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
      sub_100011CA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100019B4C((uint64_t)v12);
  return v7;
}

unint64_t sub_100018BB8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_100018CB8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = _StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_100018CB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_100018D50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100018E54(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100018E54((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_100018D50(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_100018DEC(v2, 0);
      unint64_t result = (void *)_StringGuts.copyUTF8(into:)();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100018DEC(uint64_t a1, uint64_t a2)
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
  sub_10000816C(&qword_100071BF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100018E54(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000816C(&qword_100071BF0);
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
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_100018F40(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000663E0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

uint64_t sub_100018F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018FA0);
}

uint64_t sub_100018FA0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_10000816C(&qword_100071578);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_100019060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019074);
}

void *sub_100019074(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_10000816C(&qword_100071578);
    int64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100019120()
{
  sub_10000A858();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for ColorPickerTabPicker()
{
  return &type metadata for ColorPickerTabPicker;
}

uint64_t sub_1000191C8()
{
  return sub_10001923C(&qword_100071A70, &qword_1000719C8, (void (*)(void))sub_10001920C);
}

uint64_t sub_10001920C()
{
  return sub_10001923C(&qword_100071A78, &qword_1000719C0, (void (*)(void))sub_1000192B8);
}

uint64_t sub_10001923C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CA7C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000192B8()
{
  unint64_t result = qword_100071A80;
  if (!qword_100071A80)
  {
    sub_10000CA7C(&qword_1000719B8);
    sub_100019358();
    sub_10000CC70(&qword_100071A98, &qword_100071AA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071A80);
  }
  return result;
}

unint64_t sub_100019358()
{
  unint64_t result = qword_100071A88;
  if (!qword_100071A88)
  {
    sub_10000CA7C(&qword_1000719B0);
    sub_10000CC70(&qword_100071A90, &qword_1000719A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071A88);
  }
  return result;
}

uint64_t sub_1000193F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100019414()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100019430()
{
  unint64_t result = qword_100071AC0;
  if (!qword_100071AC0)
  {
    sub_10000CA7C(&qword_100071AB8);
    sub_1000194D0();
    sub_10000CC70(&qword_100071AE8, &qword_100071AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071AC0);
  }
  return result;
}

unint64_t sub_1000194D0()
{
  unint64_t result = qword_100071AC8;
  if (!qword_100071AC8)
  {
    sub_10000CA7C(&qword_100071AD0);
    sub_10001A874(&qword_100071AD8, (void (*)(uint64_t))type metadata accessor for ColorSwatchPickerView);
    sub_10001957C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071AC8);
  }
  return result;
}

unint64_t sub_10001957C()
{
  unint64_t result = qword_100071AE0;
  if (!qword_100071AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071AE0);
  }
  return result;
}

unint64_t sub_1000195D0()
{
  unint64_t result = qword_100071AF8;
  if (!qword_100071AF8)
  {
    sub_10000CA7C(&qword_100071AA8);
    sub_10000CC70(&qword_100071B00, &qword_100071B08);
    sub_10000CC70(&qword_100071B10, &qword_100071B18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071AF8);
  }
  return result;
}

uint64_t sub_100019694()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000196B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100018664(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_1000196F8()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_10001971C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100018664(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

uint64_t sub_10001975C()
{
  return swift_retain();
}

uint64_t sub_100019764()
{
  return swift_release();
}

unint64_t sub_10001976C()
{
  unint64_t result = qword_100071B80;
  if (!qword_100071B80)
  {
    sub_10000CA7C(&qword_100071B70);
    sub_100019818();
    sub_10001A874(&qword_100071BB0, (void (*)(uint64_t))type metadata accessor for RGBAView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071B80);
  }
  return result;
}

unint64_t sub_100019818()
{
  unint64_t result = qword_100071B88;
  if (!qword_100071B88)
  {
    sub_10000CA7C(&qword_100071B68);
    sub_100019430();
    sub_100019894();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071B88);
  }
  return result;
}

unint64_t sub_100019894()
{
  unint64_t result = qword_100071B90;
  if (!qword_100071B90)
  {
    sub_10000CA7C(&qword_100071B50);
    sub_100019934();
    sub_10000CC70(&qword_100071AE8, &qword_100071AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071B90);
  }
  return result;
}

unint64_t sub_100019934()
{
  unint64_t result = qword_100071B98;
  if (!qword_100071B98)
  {
    sub_10000CA7C(&qword_100071BA0);
    sub_1000199B0();
    sub_10001957C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071B98);
  }
  return result;
}

unint64_t sub_1000199B0()
{
  unint64_t result = qword_100071BA8;
  if (!qword_100071BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071BA8);
  }
  return result;
}

uint64_t sub_100019A0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100019A7C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100019AE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100019B4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100019B9C()
{
  unint64_t result = qword_100072F70;
  if (!qword_100072F70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100072F70);
  }
  return result;
}

unint64_t sub_100019BDC()
{
  unint64_t result = qword_100071C08;
  if (!qword_100071C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071C08);
  }
  return result;
}

unint64_t sub_100019C30()
{
  unint64_t result = qword_100071C10;
  if (!qword_100071C10)
  {
    sub_10000CA7C(&qword_100071C00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071C10);
  }
  return result;
}

uint64_t destroy for FooterView()
{
  swift_release();

  return sub_100019764();
}

uint64_t initializeWithCopy for FooterView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_10001975C();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for FooterView(uint64_t a1, void *a2)
{
  Swift::String v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v2[1];
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_10001975C();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_100019764();
  return a1;
}

__n128 initializeWithCopy for SomeColor(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FooterView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  sub_100019764();
  return a1;
}

uint64_t getEnumTagSinglePayload for FooterView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 33)) {
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

uint64_t storeEnumTagSinglePayload for FooterView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FooterView()
{
  return &type metadata for FooterView;
}

uint64_t sub_100019EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorPickerContent.Visibility(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for ColorPickerContent.Visibility(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ColorPickerContent.Visibility(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerContent.Visibility(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for ColorPickerContent.Visibility(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerContent.Visibility()
{
  return &type metadata for ColorPickerContent.Visibility;
}

ValueMetadata *type metadata accessor for ColorPickerContent.PlatformBasedAspectRatio()
{
  return &type metadata for ColorPickerContent.PlatformBasedAspectRatio;
}

unint64_t sub_10001A0A8()
{
  unint64_t result = qword_100071C28;
  if (!qword_100071C28)
  {
    sub_10000CA7C(&qword_100071C30);
    sub_100019430();
    sub_1000195D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071C28);
  }
  return result;
}

uint64_t sub_10001A124()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A1C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A1E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A1FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A218(uint64_t a1)
{
  return a1;
}

unint64_t sub_10001A244()
{
  unint64_t result = qword_100071C58;
  if (!qword_100071C58)
  {
    sub_10000CA7C(&qword_100071C38);
    sub_10000CC70(&qword_100071C50, &qword_100071C48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071C58);
  }
  return result;
}

uint64_t sub_10001A2F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001A35C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_10001A3BC(uint64_t a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v1 = self;
    id v2 = [v1 currentDevice];
    [v2 userInterfaceIdiom];

    id v3 = [v1 currentDevice];
    [v3 userInterfaceIdiom];
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    EnvironmentObject.error()();
    __break(1u);
  }
}

unint64_t sub_10001A54C()
{
  unint64_t result = qword_100071CD0;
  if (!qword_100071CD0)
  {
    sub_10000CA7C(&qword_100071CA0);
    sub_10001A5EC();
    sub_10000CC70(&qword_1000716C8, &qword_1000716A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071CD0);
  }
  return result;
}

unint64_t sub_10001A5EC()
{
  unint64_t result = qword_100071CD8;
  if (!qword_100071CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071CD8);
  }
  return result;
}

uint64_t sub_10001A644()
{
  return sub_100017CA4((void *)(v0 + 16));
}

uint64_t sub_10001A64C(uint64_t a1)
{
  return a1;
}

unint64_t sub_10001A680()
{
  unint64_t result = qword_100071D08;
  if (!qword_100071D08)
  {
    sub_10000CA7C(&qword_100071CB8);
    sub_10001A720();
    sub_10000CC70(&qword_100071D18, &qword_100071D00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071D08);
  }
  return result;
}

unint64_t sub_10001A720()
{
  unint64_t result = qword_100071D10;
  if (!qword_100071D10)
  {
    sub_10000CA7C(&qword_100071CB0);
    sub_10001923C(&qword_100071CC8, &qword_100071CA8, (void (*)(void))sub_10001A54C);
    sub_10001A874((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071D10);
  }
  return result;
}

uint64_t sub_10001A7FC()
{
  swift_release();
  sub_100019764();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_10001A840@<X0>(uint64_t a1@<X8>)
{
  return sub_100018020((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_10001A848(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001A874(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001A8C4(uint64_t a1, double a2)
{
  if (!a1) {
    goto LABEL_27;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  id v3 = self;
  id v4 = [v3 currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  double v6 = 30.0;
  if (v16) {
    double v6 = 28.0;
  }
  if (v5 == (id)6) {
    double v7 = 42.0;
  }
  else {
    double v7 = v6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  id v8 = [v3 currentDevice];
  id v9 = [v8 userInterfaceIdiom];

  double v10 = 18.0;
  if (v15) {
    double v10 = 16.0;
  }
  if (v9 == (id)6) {
    double v11 = 20.0;
  }
  else {
    double v11 = v10;
  }
  if (qword_100071090 != -1) {
    swift_once();
  }
  double v12 = *(double *)&qword_1000776B0;
  if (*(double *)&qword_1000776B0 < a2) {
    double v12 = a2;
  }
  double v13 = (v11 + v12) / (v7 + v11);
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v13 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((uint64_t)v13 + 0x4000000000000000 < 0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  if (2 * (uint64_t)v13 >= 16) {
    return 16;
  }
  else {
    return 2 * (uint64_t)v13;
  }
}

uint64_t sub_10001AB74(uint64_t a1, double a2)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    id v4 = self;
    id v5 = [v4 currentDevice];
    [v5 userInterfaceIdiom];

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    id v6 = [v4 currentDevice];
    [v6 userInterfaceIdiom];

    uint64_t result = sub_10001A8C4(a1, a2);
    if (qword_100071090 != -1) {
      return swift_once();
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10001A874((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001AE04()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_10001AE14(unsigned char *a1)
{
  return sub_10000C554(a1, *(unsigned char *)(v1 + 16));
}

unint64_t sub_10001AE1C()
{
  unint64_t result = qword_100071D60;
  if (!qword_100071D60)
  {
    sub_10000CA7C(&qword_100071D48);
    sub_10001AEBC();
    sub_10000CC70(&qword_100071D88, &qword_100071D90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071D60);
  }
  return result;
}

unint64_t sub_10001AEBC()
{
  unint64_t result = qword_100071D68;
  if (!qword_100071D68)
  {
    sub_10000CA7C(&qword_100071D40);
    sub_10001AF38();
    sub_10001AFD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071D68);
  }
  return result;
}

unint64_t sub_10001AF38()
{
  unint64_t result = qword_100071D70;
  if (!qword_100071D70)
  {
    sub_10000CA7C(&qword_100071D38);
    sub_10000CC70(&qword_100071D78, &qword_100071D58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071D70);
  }
  return result;
}

unint64_t sub_10001AFD8()
{
  unint64_t result = qword_100071D80;
  if (!qword_100071D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071D80);
  }
  return result;
}

unint64_t sub_10001B030()
{
  unint64_t result = qword_100071D98;
  if (!qword_100071D98)
  {
    sub_10000CA7C(&qword_100071DA0);
    sub_10000CC70(&qword_100071C50, &qword_100071C48);
    sub_10001A244();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071D98);
  }
  return result;
}

uint64_t sub_10001B0D0()
{
  return sub_10000CC70(&qword_100071DA8, &qword_100071DB0);
}

unint64_t sub_10001B110()
{
  unint64_t result = qword_100071DB8;
  if (!qword_100071DB8)
  {
    sub_10000CA7C(&qword_100071D50);
    sub_10001AE1C();
    sub_10001A874((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071DB8);
  }
  return result;
}

id sub_10001B1C4(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  id result = (id)swift_release();
  if (v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    [a1 setNumberOfPages:v3];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    return [a1 setCurrentPage:v3];
  }
  return result;
}

id sub_10001B400()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PageControl.Coordinator();
  return [super dealloc];
}

uint64_t type metadata accessor for PageControl.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for PageControl()
{
  return &type metadata for PageControl;
}

id sub_10001B480(void *a1)
{
  return sub_10001B1C4(a1);
}

id sub_10001B488@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  id v5 = (objc_class *)type metadata accessor for PageControl.Coordinator();
  id v6 = (char *)objc_allocWithZone(v5);
  double v7 = &v6[OBJC_IVAR____TtCV20ColorPickerUIService11PageControl11Coordinator_parent];
  *(void *)double v7 = v4;
  *((void *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  id result = [super init];
  *a1 = result;
  return result;
}

uint64_t sub_10001B4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001B770();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001B560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001B770();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001B5C4()
{
}

unint64_t sub_10001B5F0()
{
  unint64_t result = qword_100071DF8;
  if (!qword_100071DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071DF8);
  }
  return result;
}

id sub_10001B65C()
{
  id v0 = [objc_allocWithZone((Class)UIPageControl) init];
  uint64_t v1 = self;
  id v2 = [v1 secondaryLabelColor];
  [v0 setPageIndicatorTintColor:v2];

  id v3 = [v1 labelColor];
  [v0 setCurrentPageIndicatorTintColor:v3];

  [v0 setHidesForSinglePage:1];
  sub_10000816C(&qword_100071E00);
  UIViewRepresentableContext.coordinator.getter();
  [v0 addTarget:v5 action:"valueChanged:" forControlEvents:4096];

  return v0;
}

unint64_t sub_10001B770()
{
  unint64_t result = qword_100071E08;
  if (!qword_100071E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E08);
  }
  return result;
}

id sub_10001B7C4(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView;
  id v10 = objc_allocWithZone((Class)UIImageView);
  double v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  uint64_t v12 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v11[v12] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for AddColorCell();
  [super initWithFrame:a1, a2, a3, a4];
  sub_10001B9CC();

  return v13;
}

id sub_10001B8D4(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView;
  id v4 = objc_allocWithZone((Class)UIImageView);
  id v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v5[v6] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for AddColorCell();
  [super initWithCoder:a1];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    sub_10001B9CC();
  }
  return v8;
}

void sub_10001B9CC()
{
  uint64_t v1 = self;
  id v2 = [v1 currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  id v4 = [v0 contentView];
  id v5 = objc_allocWithZone((Class)UIColor);
  if (v3 == (id)6) {
    double v6 = 0.58;
  }
  else {
    double v6 = 0.85;
  }
  id v7 = [v5 initWithRed:v6 green:v6 blue:v6 alpha:1.0];
  [v4 setBackgroundColor:v7];

  id v8 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [v0 contentView];
  [v9 addSubview:v8];

  id v10 = [v0 contentView];
  objc_super v11 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView];
  [v10 setMaskView:v11];

  id v12 = [self configurationWithPointSize:7 weight:2 scale:17.0];
  id v33 = [objc_allocWithZone((Class)UIColor) initWithRed:0.29 green:0.29 blue:0.29 alpha:1.0];
  id v13 = [v1 currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  if (v14 == (id)6)
  {
    id v15 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];

    id v33 = v15;
  }
  id v16 = v12;
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [self systemImageNamed:v17 withConfiguration:v16];

  if (v18)
  {
    id v19 = [v18 imageWithTintColor:v33 renderingMode:1];

    [v8 setImage:v19];
    id v20 = [self blackColor];
    id v21 = [v11 layer];
    self;
    uint64_t v22 = (void *)swift_dynamicCastObjCClassUnconditional();
    if (v20) {
      id v23 = [v20 CGColor];
    }
    else {
      id v23 = 0;
    }
    [v22 setFillColor:v23, v33];

    uint64_t v24 = self;
    sub_10000816C(&qword_100071360);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_10004EEE0;
    id v26 = [v0 centerXAnchor];
    id v27 = [v8 centerXAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];

    *(void *)(v25 + 32) = v28;
    id v29 = [v0 centerYAnchor];
    id v30 = [v8 centerYAnchor];
    id v31 = [v29 constraintEqualToAnchor:v30];

    *(void *)(v25 + 40) = v31;
    specialized Array._endMutation()();
    sub_100009AD0(0, &qword_100071E48);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v24 activateConstraints:isa];
  }
  else
  {
    __break(1u);
  }
}

void sub_10001BEB0()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for AddColorCell();
  [super layoutSubviews];
  [v0 bounds];
  double Width = CGRectGetWidth(v8);
  [v0 bounds];
  double Height = CGRectGetHeight(v9);
  if (Height < Width) {
    double Width = Height;
  }
  id v3 = *(char **)&v0[OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView];
  [v3 setFrame:CGRectMake(0.0, 0.0, Width, Width)];
  id v4 = [self bezierPathWithOvalInRect:0.0, 0.0, Width, Width];
  id v5 = *(void **)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(void *)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v4;
  id v6 = v4;

  sub_100038398();
}

id sub_10001C070()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddColorCell();
  [super dealloc];
}

uint64_t type metadata accessor for AddColorCell()
{
  return self;
}

uint64_t sub_10001C114()
{
  sub_100009AD0(0, (unint64_t *)&qword_100072F70);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v5;
}

uint64_t getEnumTagSinglePayload for SomeColor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SomeColor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor()
{
  return &type metadata for SomeColor;
}

uint64_t sub_10001C2B0()
{
  sub_10000816C(&qword_100071EF8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100050930;
  float v2 = *v0 * 255.0;
  uint64_t v3 = lroundf(v2);
  *(void *)(v1 + 56) = &type metadata for Int;
  *(void *)(v1 + 64) = &protocol witness table for Int;
  *(void *)(v1 + 32) = v3;
  float v4 = v0[1] * 255.0;
  uint64_t v5 = lroundf(v4);
  *(void *)(v1 + 96) = &type metadata for Int;
  *(void *)(v1 + 104) = &protocol witness table for Int;
  *(void *)(v1 + 72) = v5;
  float v6 = v0[2] * 255.0;
  uint64_t v7 = lroundf(v6);
  *(void *)(v1 + 136) = &type metadata for Int;
  *(void *)(v1 + 144) = &protocol witness table for Int;
  *(void *)(v1 + 112) = v7;
  uint64_t v8 = String.init(format:_:)();
  uint64_t v10 = v9;
  sub_10000816C(&qword_100071F00);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10004EEF0;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = v8;
  *(void *)(v11 + 40) = v10;
  swift_bridgeObjectRetain();
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  return v8;
}

void sub_10001C400()
{
  uint64_t v1 = (CFStringRef *)&kCGColorSpaceDisplayP3;
  if (!*(unsigned char *)(v0 + 32)) {
    uint64_t v1 = (CFStringRef *)&kCGColorSpaceSRGB;
  }
  float v2 = CGColorSpaceCreateWithName(*v1);
  if (v2)
  {
    uint64_t v3 = v2;
    long long v4 = *(_OWORD *)(v0 + 16);
    v6[0] = *(_OWORD *)v0;
    v6[1] = v4;
    CGColorRef v5 = CGColorCreate(v2, (const CGFloat *)v6);

    if (v5)
    {
      [objc_allocWithZone((Class)UIColor) initWithCGColor:v5];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10001C4A8()
{
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v5;
}

uint64_t sub_10001C5AC()
{
  return 1;
}

void sub_10001C5B8()
{
}

uint64_t sub_10001C5E4()
{
  return 0x65756C6156776172;
}

uint64_t sub_10001C5FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x65756C6156776172 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10001C694()
{
  return 0;
}

void sub_10001C6A0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10001C6AC(uint64_t a1)
{
  unint64_t v2 = sub_10001E1A0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C6E8(uint64_t a1)
{
  unint64_t v2 = sub_10001E1A0();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_10001C724()
{
  return Hasher._finalize()();
}

Swift::Int sub_10001C768()
{
  return Hasher._finalize()();
}

uint64_t sub_10001C7B8(void *a1)
{
  uint64_t v2 = sub_10000816C(&qword_100071ED0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DAC4(a1, a1[3]);
  sub_10001E1A0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

BOOL sub_10001C90C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10001C924()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10001C96C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001C998()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10001C9DC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10001D414(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_10001CA0C(void *a1)
{
  return sub_10001C7B8(a1);
}

void sub_10001CA28(void *a1@<X8>)
{
  *a1 = &off_100066498;
}

void sub_10001CA38(uint64_t a1@<X8>)
{
  if ((*(unsigned char *)(v1 + 32) & 1) == 0)
  {
    double v3 = *(double *)v1;
    double v4 = *(double *)(v1 + 8);
    double v5 = *(double *)(v1 + 16);
    CGFloat Alpha = *(double *)(v1 + 24);
LABEL_7:
    *(double *)a1 = v3;
    *(double *)(a1 + 8) = v4;
    *(double *)(a1 + 16) = v5;
    *(CGFloat *)(a1 + 24) = Alpha;
    *(unsigned char *)(a1 + 32) = 0;
    return;
  }
  sub_10001C400();
  uint64_t v8 = v7;
  uint64_t v9 = (CGColor *)[v7 CGColor];

  uint64_t v10 = (void *)UISCreateCachedColorTransform();
  if (!v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v11 = v10;
  id v12 = CGColorGetColorSpace(v9);
  if (!v12)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v13 = v12;
  if (CGColorRef.components.getter())
  {
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v9);

    double v3 = sub_10001E4F0(0.0);
    double v4 = sub_10001E4F0(0.0);
    double v5 = sub_10001E4F0(0.0);
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
}

void sub_10001CB80(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 32))
  {
    double v11 = *(double *)v1;
    double v12 = *(double *)(v1 + 8);
    double v13 = *(double *)(v1 + 16);
    CGFloat Alpha = *(double *)(v1 + 24);
    goto LABEL_7;
  }
  sub_10001C400();
  double v4 = v3;
  double v5 = (CGColor *)[v3 CGColor];

  float v6 = (void *)UISCreateCachedColorTransform();
  if (!v6)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v7 = v6;
  uint64_t v8 = CGColorGetColorSpace(v5);
  if (!v8)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  if (CGColorRef.components.getter())
  {
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v5);

    double v11 = sub_10001E4F0(0.0);
    double v12 = sub_10001E4F0(0.0);
    double v13 = sub_10001E4F0(0.0);
LABEL_7:
    *(double *)a1 = v11;
    *(double *)(a1 + 8) = v12;
    *(double *)(a1 + 16) = v13;
    *(CGFloat *)(a1 + 24) = Alpha;
    *(unsigned char *)(a1 + 32) = 1;
    return;
  }
LABEL_10:
  __break(1u);
}

void sub_10001CCCC()
{
  if ((*(void *)v0 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *(void *)v0;
  }
  else {
    Swift::UInt64 v1 = 0;
  }
  Hasher._combine(_:)(v1);
  if ((*(void *)(v0 + 8) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v2 = *(void *)(v0 + 8);
  }
  else {
    Swift::UInt64 v2 = 0;
  }
  Hasher._combine(_:)(v2);
  if ((*(void *)(v0 + 16) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v3 = *(void *)(v0 + 16);
  }
  else {
    Swift::UInt64 v3 = 0;
  }
  Hasher._combine(_:)(v3);
  if ((*(void *)(v0 + 24) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = *(void *)(v0 + 24);
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(*(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_10001CD38(void *a1)
{
  Swift::UInt64 v3 = v1;
  uint64_t v5 = sub_10000816C(&qword_100071E70);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DAC4(a1, a1[3]);
  sub_10001DB08();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v11 = *v3;
  HIBYTE(v10) = 0;
  sub_10001DC04();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v11 = v3[1];
    HIBYTE(v10) = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v11 = v3[2];
    HIBYTE(v10) = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v11 = v3[3];
    HIBYTE(v10) = 3;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v11) = *((unsigned char *)v3 + 32);
    HIBYTE(v10) = 4;
    sub_10001DC58();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

BOOL sub_10001CF80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001CF94()
{
  uint64_t result = 114;
  switch(*v0)
  {
    case 1:
      uint64_t result = 103;
      break;
    case 2:
      uint64_t result = 98;
      break;
    case 3:
      uint64_t result = 97;
      break;
    case 4:
      uint64_t result = 0x617053726F6C6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001D008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001D65C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001D030(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10001D03C(uint64_t a1)
{
  unint64_t v2 = sub_10001DB08();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001D078(uint64_t a1)
{
  unint64_t v2 = sub_10001DB08();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_10001D0B4()
{
  return Hasher._finalize()();
}

Swift::Int sub_10001D0F8()
{
  return Hasher._finalize()();
}

uint64_t sub_10001D134(uint64_t a1, uint64_t a2)
{
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)a1, *(float64x2_t *)a2), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)(a2 + 16)))), 0xFuLL))))return (*(unsigned __int8 *)(a2 + 32) ^ *(unsigned __int8 *)(a1 + 32) ^ 1) & 1; {
  else
  }
    return 0;
}

double sub_10001D180@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10001D81C(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_10001D1C8(void *a1)
{
  return sub_10001CD38(a1);
}

unint64_t sub_10001D1E4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001E6F0(*a1);
  *a2 = result;
  return result;
}

void sub_10001D210(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_10001D21C(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = (CGColor *)[a1 CGColor];
  char v7 = a2 & 1;
  uint64_t v8 = (void *)UISCreateCachedColorTransform();
  if (!v8)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v9 = v8;
  uint64_t v10 = CGColorGetColorSpace(v6);
  if (!v10)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v11 = v10;
  if (CGColorRef.components.getter())
  {
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v6);

    *(_OWORD *)a3 = 0uLL;
    *(void *)(a3 + 16) = 0;
    *(CGFloat *)(a3 + 24) = Alpha;
    *(unsigned char *)(a3 + 32) = v7;
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_10001D348(CGColorSpace *a1)
{
  CFStringRef v1 = CGColorSpaceCopyName(a1);
  if (!v1) {
    return 2;
  }
  uint64_t v2 = (__CFString *)v1;
  type metadata accessor for CFString(0);
  sub_100011B8C();
  Swift::UInt64 v3 = (id)kCGColorSpaceSRGB;
  char v4 = static _CFObject.== infix(_:_:)();

  if (v4)
  {

    return 0;
  }
  else
  {
    uint64_t v6 = (id)kCGColorSpaceDisplayP3;
    char v7 = static _CFObject.== infix(_:_:)();

    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10001D414(void *a1)
{
  uint64_t v3 = sub_10000816C(&qword_100071EB8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DAC4(a1, a1[3]);
  sub_10001E1A0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1) {
    return sub_100019B4C((uint64_t)a1);
  }
  KeyedDecodingContainer.decode(_:forKey:)();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  type metadata accessor for CFString(0);
  sub_100011B8C();
  id v9 = (id)kCGColorSpaceSRGB;
  id v16 = v8;
  int v10 = static _CFObject.== infix(_:_:)();

  int v15 = v10;
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (id)kCGColorSpaceDisplayP3;
    id v12 = v16;
    char v13 = static _CFObject.== infix(_:_:)();

    if (v13) {
      goto LABEL_7;
    }
    sub_10001E1F4();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_100019B4C((uint64_t)a1);
  }

LABEL_7:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100019B4C((uint64_t)a1);
  return (v15 & 1) == 0;
}

uint64_t sub_10001D65C(uint64_t a1, uint64_t a2)
{
  if (a1 == 114 && a2 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 103 && a2 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 98 && a2 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 97 && a2 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x617053726F6C6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_10001D81C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000816C(&qword_100071E50);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSString v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DAC4(a1, a1[3]);
  sub_10001DB08();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100019B4C((uint64_t)a1);
  }
  char v16 = 0;
  sub_10001DB5C();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v9 = v17;
  char v16 = 1;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v10 = v17;
  char v16 = 2;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v11 = v17;
  char v16 = 3;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v12 = v17;
  char v16 = 4;
  sub_10001DBB0();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v13 = v17;
  uint64_t result = sub_100019B4C((uint64_t)a1);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 32) = v13;
  return result;
}

void *sub_10001DAC4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001DB08()
{
  unint64_t result = qword_100071E58;
  if (!qword_100071E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E58);
  }
  return result;
}

unint64_t sub_10001DB5C()
{
  unint64_t result = qword_100071E60;
  if (!qword_100071E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E60);
  }
  return result;
}

unint64_t sub_10001DBB0()
{
  unint64_t result = qword_100071E68;
  if (!qword_100071E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E68);
  }
  return result;
}

unint64_t sub_10001DC04()
{
  unint64_t result = qword_100071E78;
  if (!qword_100071E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E78);
  }
  return result;
}

unint64_t sub_10001DC58()
{
  unint64_t result = qword_100071E80;
  if (!qword_100071E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E80);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SomeColor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SomeColor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x10001DE08);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.CodingKeys()
{
  return &type metadata for SomeColor.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SomeColor.ColorSpace(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SomeColor.ColorSpace(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001DF9CLL);
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

unsigned char *sub_10001DFC4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace()
{
  return &type metadata for SomeColor.ColorSpace;
}

unint64_t sub_10001DFE4()
{
  unint64_t result = qword_100071E88;
  if (!qword_100071E88)
  {
    sub_10000CA7C(&qword_100071E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E88);
  }
  return result;
}

unint64_t sub_10001E044()
{
  unint64_t result = qword_100071E98;
  if (!qword_100071E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071E98);
  }
  return result;
}

unint64_t sub_10001E09C()
{
  unint64_t result = qword_100071EA0;
  if (!qword_100071EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EA0);
  }
  return result;
}

unint64_t sub_10001E0F4()
{
  unint64_t result = qword_100071EA8;
  if (!qword_100071EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EA8);
  }
  return result;
}

unint64_t sub_10001E14C()
{
  unint64_t result = qword_100071EB0;
  if (!qword_100071EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EB0);
  }
  return result;
}

unint64_t sub_10001E1A0()
{
  unint64_t result = qword_100071EC0;
  if (!qword_100071EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EC0);
  }
  return result;
}

unint64_t sub_10001E1F4()
{
  unint64_t result = qword_100071EC8;
  if (!qword_100071EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EC8);
  }
  return result;
}

uint64_t sub_10001E254()
{
  return 0;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace.CodingError()
{
  return &type metadata for SomeColor.ColorSpace.CodingError;
}

uint64_t _s20ColorPickerUIService9SomeColorV10ColorSpaceO11CodingErrorOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s20ColorPickerUIService9SomeColorV10ColorSpaceO11CodingErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001E358);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace.CodingKeys()
{
  return &type metadata for SomeColor.ColorSpace.CodingKeys;
}

unint64_t sub_10001E394()
{
  unint64_t result = qword_100071ED8;
  if (!qword_100071ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071ED8);
  }
  return result;
}

unint64_t sub_10001E3EC()
{
  unint64_t result = qword_100071EE0;
  if (!qword_100071EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EE0);
  }
  return result;
}

unint64_t sub_10001E444()
{
  unint64_t result = qword_100071EE8;
  if (!qword_100071EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EE8);
  }
  return result;
}

unint64_t sub_10001E49C()
{
  unint64_t result = qword_100071EF0;
  if (!qword_100071EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071EF0);
  }
  return result;
}

double sub_10001E4F0(double a1)
{
  return fmax(fmin(a1, 1.0), 0.0);
}

uint64_t getEnumTagSinglePayload for SomeColor.Component(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SomeColor.Component(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x10001E660);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.Component()
{
  return &type metadata for SomeColor.Component;
}

unint64_t sub_10001E69C()
{
  unint64_t result = qword_100071F08;
  if (!qword_100071F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071F08);
  }
  return result;
}

unint64_t sub_10001E6F0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_10001E768()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for SystemCloseButton.Coordinator()
{
  return self;
}

void *assignWithCopy for SystemCloseButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SystemCloseButton(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemCloseButton(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemCloseButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemCloseButton()
{
  return &type metadata for SystemCloseButton;
}

uint64_t sub_10001E8D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  type metadata accessor for SystemCloseButton.Coordinator();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a1 = v5;

  return swift_retain();
}

uint64_t sub_10001E928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001EA18();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001E98C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001EA18();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001E9F0()
{
}

unint64_t sub_10001EA18()
{
  unint64_t result = qword_100071FD0;
  if (!qword_100071FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071FD0);
  }
  return result;
}

id sub_10001EA6C()
{
  uint64_t v0 = sub_10000816C(&qword_100071FD8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = [self buttonWithType:7];
  sub_10000816C(&qword_100071FE0);
  UIViewRepresentableContext.coordinator.getter();
  [v3 addTarget:v10[1] action:"primaryAction" forControlEvents:0x2000];
  swift_release();
  id v4 = [self currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)6)
  {
    sub_10001EC14();
    id v6 = v3;
    static UIShape.circle.getter();
    uint64_t v7 = type metadata accessor for UIShape();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 0, 1, v7);
    int v8 = (void *)UIHoverStyle.init(shape:)();
    [v6 setHoverStyle:v8];
  }
  return v3;
}

unint64_t sub_10001EC14()
{
  unint64_t result = qword_100071FE8;
  if (!qword_100071FE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100071FE8);
  }
  return result;
}

uint64_t sub_10001EC54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v90 = a3;
  uint64_t v80 = type metadata accessor for GeometryProxy();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v76 = v4;
  uint64_t v77 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for LocalCoordinateSpace();
  __chkstk_darwin(v75);
  uint64_t v72 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for DragGesture();
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  float64x2_t v78 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_10000816C(&qword_1000720A0);
  uint64_t v84 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  int v83 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000816C(&qword_1000720A8);
  uint64_t v87 = *(void *)(v8 - 8);
  uint64_t v88 = v8;
  __chkstk_darwin(v8);
  uint64_t v85 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = (uint64_t (*)(void))type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v69);
  uint64_t v11 = (double *)((char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for ColorSwatchPickerView();
  uint64_t v13 = v12 - 8;
  uint64_t v14 = *(void *)(v12 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v12);
  uint64_t v16 = sub_10000816C(&qword_1000720B0);
  __chkstk_darwin(v16 - 8);
  id v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_10000816C(&qword_1000720B8);
  __chkstk_darwin(v66);
  uint64_t v68 = (uint64_t)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_10000816C(&qword_1000720C0);
  __chkstk_darwin(v67);
  uint64_t v70 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_10000816C(&qword_1000720C8);
  __chkstk_darwin(v94);
  uint64_t v95 = (uint64_t)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_10000816C(&qword_1000720D0);
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  char v71 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v18 = static HorizontalAlignment.center.getter();
  *((void *)v18 + 1) = 0;
  v18[16] = 0;
  sub_10000816C(&qword_1000720D8);
  uint64_t v23 = *(void *)(*(void *)(a2 + *(int *)(v13 + 32)) + 16);
  *(void *)&long long v97 = 0;
  *((void *)&v97 + 1) = v23;
  swift_getKeyPath();
  uint64_t v89 = a2;
  sub_1000236D8(a2, (uint64_t)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  uint64_t v24 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v25 = (v24 + 16) & ~v24;
  uint64_t v91 = v24 | 7;
  uint64_t v92 = v25 + v15;
  uint64_t v26 = swift_allocObject();
  uint64_t v93 = v25;
  uint64_t v27 = v26 + v25;
  id v28 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000234A0((uint64_t)v28, v27);
  sub_10000816C(&qword_1000720E0);
  sub_10000816C(&qword_1000720E8);
  sub_100023608();
  sub_10000CC70(&qword_100072100, &qword_1000720E8);
  ForEach<>.init(_:id:content:)();
  uint64_t result = GeometryProxy.size.getter();
  long double v31 = v30;
  if (qword_100071068 != -1) {
    uint64_t result = swift_once();
  }
  if (*(void *)(qword_100077698 + 16))
  {
    fmod(v31, (double)(*(void *)(*(void *)(qword_100077698 + 32) + 16) >> 1));
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v32 = v68;
    sub_10000C800((uint64_t)v18, v68, &qword_1000720B0);
    id v33 = (_OWORD *)(v32 + *(int *)(v66 + 36));
    long long v34 = v98;
    *id v33 = v97;
    v33[1] = v34;
    v33[2] = v99;
    sub_10000C8F8((uint64_t)v18, &qword_1000720B0);
    id v35 = [self currentDevice];
    id v36 = [v35 userInterfaceIdiom];

    if (v36 == (id)6) {
      double v37 = 16.0;
    }
    else {
      double v37 = 8.0;
    }
    id v38 = (char *)v11 + *((int *)v69 + 5);
    uint64_t v39 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v40 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104))(v38, v39, v40);
    *uint64_t v11 = v37;
    v11[1] = v37;
    uint64_t v41 = (uint64_t)v70;
    uint64_t v42 = (uint64_t)&v70[*(int *)(v67 + 36)];
    sub_1000236D8((uint64_t)v11, v42, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v42 + *(int *)(sub_10000816C(&qword_1000716A8) + 36)) = 256;
    sub_10000C800(v32, v41, &qword_1000720B8);
    sub_100023740((uint64_t)v11);
    sub_10000C8F8(v32, &qword_1000720B8);
    uint64_t v43 = v89;
    uint64_t v44 = (uint64_t)v28;
    uint64_t v69 = (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView;
    sub_1000236D8(v89, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
    uint64_t v45 = swift_allocObject();
    sub_1000234A0((uint64_t)v28, v45 + v93);
    uint64_t v46 = static Alignment.center.getter();
    uint64_t v48 = v47;
    uint64_t v49 = v95;
    sub_10000C800(v41, v95, &qword_1000720C0);
    uint64_t v50 = (void *)(v49 + *(int *)(v94 + 36));
    *uint64_t v50 = sub_1000237A0;
    v50[1] = v45;
    v50[2] = v46;
    v50[3] = v48;
    sub_10000C8F8(v41, &qword_1000720C0);
    static CoordinateSpaceProtocol<>.local.getter();
    uint64_t v51 = v78;
    DragGesture.init<A>(minimumDistance:coordinateSpace:)();
    sub_1000236D8(v43, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
    uint64_t v52 = v79;
    uint64_t v53 = v77;
    uint64_t v54 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v77, v96, v80);
    unint64_t v55 = (v92 + *(unsigned __int8 *)(v52 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    uint64_t v56 = swift_allocObject();
    uint64_t v57 = v93;
    sub_1000234A0(v44, v56 + v93);
    (*(void (**)(unint64_t, char *, uint64_t))(v52 + 32))(v56 + v55, v53, v54);
    sub_100024B6C(&qword_100072108, (void (*)(uint64_t))&type metadata accessor for DragGesture);
    sub_100024B6C(&qword_100072110, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
    uint64_t v58 = v83;
    uint64_t v59 = v82;
    Gesture<>.onChanged(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v51, v59);
    sub_1000236D8(v43, v44, v69);
    uint64_t v60 = swift_allocObject();
    sub_1000234A0(v44, v60 + v57);
    sub_10000CC70(&qword_100072118, &qword_1000720A0);
    unint64_t v62 = v85;
    uint64_t v61 = v86;
    Gesture.onEnded(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v58, v61);
    static GestureMask.all.getter();
    sub_100023C64();
    sub_10000CC70(&qword_100072150, &qword_1000720A8);
    uint64_t v63 = v71;
    uint64_t v64 = v88;
    uint64_t v65 = v95;
    View.gesture<A>(_:including:)();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v62, v64);
    sub_10000C8F8(v65, &qword_1000720C8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v73 + 32))(v90, v63, v74);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001F8E4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5 = *a1;
  *(void *)a3 = static VerticalAlignment.center.getter();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  sub_10000816C(&qword_100072160);
  return sub_10001F940(a2, v5);
}

uint64_t sub_10001F940(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSwatchPickerView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t result = __chkstk_darwin(v4 - 8);
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + *(int *)(result + 32));
    if (*(void *)(v8 + 16) > a2)
    {
      uint64_t v9 = *(void *)(*(void *)(v8 + 8 * a2 + 32) + 16);
      v12[0] = 0;
      v12[1] = v9;
      swift_getKeyPath();
      sub_1000236D8(a1, (uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
      unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v11 = swift_allocObject();
      sub_1000234A0((uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
      *(void *)(v11 + ((v6 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
      sub_10000816C(&qword_1000720E0);
      sub_100023608();
      sub_1000242D0();
      return ForEach<>.init(_:id:content:)();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001FAFC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v7 = *a1;
  char v8 = sub_1000206F8();
  uint64_t result = type metadata accessor for ColorSwatchPickerView();
  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a2 + *(int *)(result + 28));
  if (*(void *)(v10 + 16) <= a3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v11 = *(void *)(v10 + 8 * a3 + 32);
  if (v7 < *(void *)(v11 + 16))
  {
LABEL_11:
    uint64_t v13 = v11 + 40 * v7;
    char v14 = *(unsigned char *)(v13 + 64);
    long long v15 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)a4 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)(a4 + 16) = v15;
    *(unsigned char *)(a4 + 32) = v14;
    *(void *)(a4 + 40) = a3;
    *(void *)(a4 + 48) = v7;
    return result;
  }
  __break(1u);
LABEL_7:
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(a2 + *(int *)(result + 24));
  if (*(void *)(v12 + 16) <= a3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v11 = *(void *)(v12 + 8 * a3 + 32);
  if (v7 < *(void *)(v11 + 16)) {
    goto LABEL_11;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10001FBE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ColorSwatchPickerView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = *a1;
  sub_1000236D8(a2, (uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  sub_1000234A0((uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  *(void *)(v11 + ((v8 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *a3 = sub_100023FB8;
  a3[1] = v11;
  return swift_bridgeObjectRetain();
}

double sub_10001FD14@<D0>(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  static Alignment.center.getter();
  sub_10001FE54(a1, (uint64_t)v12);
  static Alignment.topLeading.getter();
  sub_100012C64(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v12, 0.0, 1, INFINITY, 0);
  swift_release();
  long long v4 = v12[11];
  a2[10] = v12[10];
  a2[11] = v4;
  long long v5 = v12[13];
  a2[12] = v12[12];
  a2[13] = v5;
  long long v6 = v12[7];
  a2[6] = v12[6];
  a2[7] = v6;
  long long v7 = v12[9];
  a2[8] = v12[8];
  a2[9] = v7;
  long long v8 = v12[3];
  a2[2] = v12[2];
  a2[3] = v8;
  long long v9 = v12[5];
  a2[4] = v12[4];
  a2[5] = v9;
  double result = *(double *)v12;
  long long v11 = v12[1];
  *a2 = v12[0];
  a2[1] = v11;
  return result;
}

uint64_t sub_10001FE54@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ColorSwatchPickerView();
  if (*(void *)(v2 + *(int *)(v5 + 20)))
  {
    uint64_t v6 = v5;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    double v7 = 0.0;
    if (v36 == 2
      || (v38 = v34, v39 = v35, v40 = v36 & 1, sub_10001CA38((uint64_t)v32), (uint64_t v8 = *(void *)(a1 + 16)) == 0))
    {
LABEL_13:
      uint64_t v14 = 0;
      CGFloat v15 = 0.0;
      CGFloat v16 = 0.0;
      CGFloat v17 = 0.0;
      CGFloat v18 = 0.0;
LABEL_14:
      v41.origin.x = v17;
      v41.origin.y = v18;
      v41.size.width = v15;
      v41.size.height = v16;
      CGRectGetWidth(v41);
      v42.origin.x = v17;
      v42.origin.y = v18;
      v42.size.width = v15;
      v42.size.height = v16;
      CGRectGetHeight(v42);
      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      uint64_t v19 = v34;
      char v20 = BYTE8(v34);
      uint64_t v21 = v35;
      char v22 = BYTE8(v35);
      uint64_t v23 = v36;
      uint64_t v24 = v37;
      v43.origin.x = v17;
      v43.origin.y = v18;
      v43.size.width = v15;
      v43.size.height = v16;
      CGFloat MinX = CGRectGetMinX(v43);
      v44.origin.x = v17;
      v44.origin.y = v18;
      v44.size.width = v15;
      v44.size.height = v16;
      CGFloat MinY = CGRectGetMinY(v44);
      uint64_t result = swift_allocObject();
      *(void *)(result + 16) = 0;
      *(void *)a2 = v14;
      *(void *)(a2 + 8) = v19;
      *(unsigned char *)(a2 + 16) = v20;
      *(void *)(a2 + 24) = v21;
      *(unsigned char *)(a2 + 32) = v22;
      *(void *)(a2 + 40) = v23;
      *(void *)(a2 + 48) = v24;
      *(CGFloat *)(a2 + 56) = MinX;
      *(CGFloat *)(a2 + 64) = MinY;
      *(double *)(a2 + 72) = v7;
      *(void *)(a2 + 80) = sub_1000240D8;
      *(void *)(a2 + 88) = result;
      return result;
    }
    uint64_t v9 = a1 + 48;
    while (v33 != *(unsigned char *)(v9 + 16)
         || vabdd_f64(*(double *)(v9 - 16), v32[0]) >= 0.001
         || vabdd_f64(*(double *)(v9 - 8), v32[1]) >= 0.001
         || vabdd_f64(*(double *)v9, v32[2]) >= 0.001)
    {
      v9 += 64;
      if (!--v8) {
        goto LABEL_13;
      }
    }
    uint64_t v10 = *(void *)(v2 + *(int *)(v6 + 24));
    uint64_t v11 = *(void *)(v10 + 16);
    if (v11)
    {
      uint64_t v12 = *(void *)(v9 + 32);
      uint64_t v13 = *(void *)(v9 + 40);
      if (v12 | v13)
      {
        uint64_t v28 = v11 - 1;
        if (v28 == v12 && v13 == 0)
        {
          uint64_t v14 = 4;
        }
        else
        {
          uint64_t v30 = *(void *)(*(void *)(v10 + 32) + 16) - 1;
          if (v12 || v30 != v13)
          {
            if (v30 == v13 && v28 == v12) {
              uint64_t v14 = 8;
            }
            else {
              uint64_t v14 = 0;
            }
          }
          else
          {
            uint64_t v14 = 2;
          }
        }
      }
      else
      {
        uint64_t v14 = 1;
      }
      type metadata accessor for CGRect(0);
      swift_retain();
      GeometryProxy.subscript.getter();
      swift_release();
      CGFloat v18 = *((double *)&v34 + 1);
      CGFloat v17 = *(double *)&v34;
      double v7 = 1.0;
      CGFloat v16 = *((double *)&v35 + 1);
      CGFloat v15 = *(double *)&v35;
      goto LABEL_14;
    }
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_100024B6C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_1000201C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ColorSwatchPickerView() + 20));
  uint64_t v3 = *v2;
  if (!*v2) {
    goto LABEL_8;
  }
  long long v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v3;
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v3;
  swift_retain_n();
  Binding.init(get:set:)();
  sub_10000816C(&qword_100072D40);
  Binding.wrappedValue.getter();
  swift_release();
  swift_release();
  char v6 = v15[32];
  DragGesture.Value.location.getter();
  double v8 = v7;
  double v10 = v9;
  GeometryProxy.size.getter();
  sub_100020454((uint64_t)v15, v8, v10, v11, v12);
  if (!*v2) {
    goto LABEL_8;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v14) = 1;
  swift_retain();
  static Published.subscript.setter();
  if (*v2)
  {
    swift_retain();
    if (v6) {
      sub_10001CB80((uint64_t)&v14);
    }
    else {
      sub_10001CA38((uint64_t)&v14);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return static Published.subscript.setter();
  }
  else
  {
LABEL_8:
    type metadata accessor for ColorPickerState();
    sub_100024B6C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100020454@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t result = type metadata accessor for ColorSwatchPickerView();
  uint64_t v12 = *(void *)(v5 + *(int *)(result + 24));
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    __break(1u);
    goto LABEL_20;
  }
  double v14 = floor(a3 / (a5 / (double)v13));
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v15 = *(void *)(*(void *)(v12 + 32) + 16);
  uint64_t v16 = v13 - 1;
  if (v16 >= (uint64_t)v14) {
    uint64_t v16 = (uint64_t)v14;
  }
  double v17 = floor(a2 / (a4 / (double)v15));
  if ((~*(void *)&v17 & 0x7FF0000000000000) == 0) {
    goto LABEL_23;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v17 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v18 = result;
  unint64_t v19 = v16 & ~(v16 >> 63);
  uint64_t v20 = v15 - 1;
  if (v15 - 1 >= (uint64_t)v17) {
    uint64_t v20 = (uint64_t)v17;
  }
  unint64_t v21 = v20 & ~(v20 >> 63);
  uint64_t result = sub_1000206F8();
  if ((result & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v22 = *(void *)(v5 + *(int *)(v18 + 28));
  if (v19 >= *(void *)(v22 + 16))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v23 = *(void *)(v22 + 8 * v19 + 32);
  if (v21 < *(void *)(v23 + 16))
  {
LABEL_18:
    uint64_t v24 = v23 + 40 * v21;
    char v25 = *(unsigned char *)(v24 + 64);
    long long v26 = *(_OWORD *)(v24 + 48);
    *(_OWORD *)a1 = *(_OWORD *)(v24 + 32);
    *(_OWORD *)(a1 + 16) = v26;
    *(unsigned char *)(a1 + 32) = v25;
    return result;
  }
  __break(1u);
LABEL_16:
  if (v19 >= *(void *)(v12 + 16))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v23 = *(void *)(v12 + 32 + 8 * v19);
  if (v21 < *(void *)(v23 + 16)) {
    goto LABEL_18;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100020614(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + *(int *)(type metadata accessor for ColorSwatchPickerView() + 20)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return static Published.subscript.setter();
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100024B6C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000206F8()
{
  uint64_t v1 = sub_10000816C(&qword_100072158);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for ColorScheme();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  double v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v6);
  double v11 = &v18[-v10];
  __chkstk_darwin(v9);
  uint64_t v13 = &v18[-v12];
  if (*(void *)(v0 + *(int *)(type metadata accessor for ColorSwatchPickerView() + 20)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v18[15])
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
      {
        sub_10000C8F8((uint64_t)v3, &qword_100072158);
        sub_1000182C0((uint64_t)v11);
        (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.dark(_:), v4);
        char v14 = static ColorScheme.== infix(_:_:)();
        uint64_t v15 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
        v15(v8, v4);
        v15(v11, v4);
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v13, v3, v4);
        (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v11, enum case for ColorScheme.dark(_:), v4);
        char v14 = static ColorScheme.== infix(_:_:)();
        uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
        v16(v11, v4);
        v16(v13, v4);
      }
    }
    else
    {
      char v14 = 0;
    }
    return v14 & 1;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100024B6C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100020A90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v2 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000816C(&qword_100072180);
  __chkstk_darwin(v6 - 8);
  double v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000816C(&qword_100072188);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v38 = (uint64_t)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v40 = *((unsigned __int8 *)v1 + 32);
  char v50 = v40;
  long long v12 = v1[1];
  long long v39 = *v1;
  long long v48 = v39;
  long long v49 = v12;
  uint64_t v13 = *((void *)v1 + 2);
  uint64_t v14 = *((void *)v1 + 3);
  uint64_t v15 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
  if (!(_BYTE)v40) {
    uint64_t v15 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v15, v2);
  uint64_t v16 = Color.init(_:red:green:blue:opacity:)();
  uint64_t v37 = v16;
  uint64_t v17 = static Anchor.Source<A>.bounds.getter();
  uint64_t v18 = swift_allocObject();
  long long v19 = v1[1];
  *(_OWORD *)(v18 + 16) = *v1;
  *(_OWORD *)(v18 + 32) = v19;
  *(_OWORD *)(v18 + 48) = v1[2];
  *(void *)(v18 + 64) = *((void *)v1 + 6);
  uint64_t v44 = v16;
  uint64_t v45 = v17;
  uint64_t v46 = sub_10002445C;
  uint64_t v47 = v18;
  sub_10001C400();
  unint64_t v21 = v20;
  id v22 = [v20 _accessibilityNameWithLuma];

  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;

  uint64_t v42 = v23;
  uint64_t v43 = v25;
  sub_100010084();
  uint64_t v26 = Text.init<A>(_:)();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  sub_10000816C(&qword_100072190);
  sub_100024464();
  View.accessibility(label:)();
  sub_1000100D8(v26, v28, v30);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for ColorPickerState();
  sub_100024B6C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v31 = EnvironmentObject.init()();
  uint64_t v33 = v32;
  uint64_t v34 = v38;
  sub_10000C800((uint64_t)v8, v38, &qword_100072180);
  uint64_t v35 = v34 + *(int *)(v10 + 44);
  *(void *)uint64_t v35 = v31;
  *(void *)(v35 + 8) = v33;
  *(_OWORD *)(v35 + 16) = v39;
  *(void *)(v35 + 32) = v13;
  *(void *)(v35 + 40) = v14;
  *(unsigned char *)(v35 + 48) = v40;
  sub_10000C8F8((uint64_t)v8, &qword_100072180);
  return sub_10000C590(v34, v41, &qword_100072188);
}

uint64_t sub_100020E30@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t *a3@<X8>)
{
  sub_10000816C(&qword_100072D60);
  uint64_t v6 = swift_allocObject();
  long long v7 = *a2;
  long long v8 = a2[1];
  *(_OWORD *)(v6 + 16) = xmmword_10004EEF0;
  *(_OWORD *)(v6 + 32) = v7;
  char v9 = *((unsigned char *)a2 + 32);
  *(_OWORD *)(v6 + 48) = v8;
  *(unsigned char *)(v6 + 64) = v9;
  *(void *)(v6 + 72) = a1;
  *(_OWORD *)(v6 + 80) = *(long long *)((char *)a2 + 40);
  *a3 = v6;

  return swift_retain();
}

uint64_t sub_100020EBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v29 = a3;
  uint64_t v4 = type metadata accessor for AccessibilityTraits();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10000816C(&qword_1000721C8);
  uint64_t v7 = __chkstk_darwin(v28);
  uint64_t v23 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v26 = sub_10000816C(&qword_1000721D0);
  __chkstk_darwin(v26);
  long long v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000816C(&qword_1000721D8);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_10001A848(a1);
    static Published.subscript.getter();
    swift_release();
    swift_release();
    sub_100024A70(a1);
    if (v33 == 2)
    {
      uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
      v17(v16, v27, v13);
      v17(v12, (uint64_t)v16, v13);
      swift_storeEnumTagMultiPayload();
      sub_100024A9C();
      sub_10000CC70(&qword_1000721E8, &qword_1000721D8);
      _ConditionalContent<>.init(storage:)();
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
    else
    {
      v33 &= 1u;
      sub_10001CA38((uint64_t)v31);
      if (((v32 ^ *(unsigned __int8 *)(a1 + 48)) & 1) != 0
        || vabdd_f64(v31[0], *(double *)(a1 + 16)) >= 0.001
        || vabdd_f64(v31[1], *(double *)(a1 + 24)) >= 0.001
        || vabdd_f64(v31[2], *(double *)(a1 + 32)) >= 0.001
        || vabdd_f64(v31[3], *(double *)(a1 + 40)) >= 0.001)
      {
        char v30 = &_swiftEmptyArrayStorage;
        sub_100024B6C(&qword_1000721F0, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
        sub_10000816C(&qword_1000721F8);
        sub_10000CC70(&qword_100072200, &qword_1000721F8);
        uint64_t v19 = v25;
        dispatch thunk of SetAlgebra.init<A>(_:)();
      }
      else
      {
        static AccessibilityTraits.isSelected.getter();
        uint64_t v19 = v25;
      }
      uint64_t v20 = v24;
      sub_10000CC70(&qword_1000721E8, &qword_1000721D8);
      uint64_t v21 = (uint64_t)v23;
      View.accessibility(addTraits:)();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
      sub_10000C590(v21, (uint64_t)v10, &qword_1000721C8);
      sub_10000C800((uint64_t)v10, (uint64_t)v12, &qword_1000721C8);
      swift_storeEnumTagMultiPayload();
      sub_100024A9C();
      _ConditionalContent<>.init(storage:)();
      return sub_10000C8F8((uint64_t)v10, &qword_1000721C8);
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100024B6C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100021438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(v2 + 16);
  v5[0] = *(_OWORD *)v2;
  v5[1] = v3;
  v5[2] = *(_OWORD *)(v2 + 32);
  char v6 = *(unsigned char *)(v2 + 48);
  return sub_100020EBC((uint64_t)v5, a1, a2);
}

void sub_100021478()
{
  qword_100077690 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10002148C(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_100031318((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100021578@<X0>(void *a1@<X8>)
{
  if (qword_100071060 != -1) {
    swift_once();
  }
  *a1 = qword_100077690;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000215E4(uint64_t a1, void (*a2)(uint64_t *__return_ptr))
{
  a2(&v3);
  return sub_10002148C(v3);
}

double sub_100021630()
{
  sub_10000816C((uint64_t *)&unk_100072D50);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100050FA0;
  sub_10000816C(&qword_1000718E8);
  uint64_t v1 = swift_allocObject();
  __asm { FMOV            V0.2D, #1.0 }
  long long v17 = _Q0;
  *(_OWORD *)(v1 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v1 + 32) = _Q0;
  *(_OWORD *)(v1 + 48) = _Q0;
  *(unsigned char *)(v1 + 64) = 0;
  *(int64x2_t *)(v1 + 72) = vdupq_n_s64(0x3FED7D7D7D7D7D7DuLL);
  *(_OWORD *)(v1 + 88) = xmmword_100050FC0;
  *(unsigned char *)(v1 + 104) = 0;
  *(int64x2_t *)(v1 + 112) = vdupq_n_s64(0x3FEADADADADADADBuLL);
  *(_OWORD *)(v1 + 128) = xmmword_100050FD0;
  *(unsigned char *)(v1 + 144) = 0;
  *(int64x2_t *)(v1 + 152) = vdupq_n_s64(0x3FE8585858585858uLL);
  *(_OWORD *)(v1 + 168) = xmmword_100050FE0;
  *(unsigned char *)(v1 + 184) = 0;
  *(int64x2_t *)(v1 + 192) = vdupq_n_s64(0x3FE5B5B5B5B5B5B6uLL);
  *(_OWORD *)(v1 + 208) = xmmword_100050FF0;
  *(unsigned char *)(v1 + 224) = 0;
  *(int64x2_t *)(v1 + 232) = vdupq_n_s64(0x3FE3333333333333uLL);
  *(_OWORD *)(v1 + 248) = xmmword_100051000;
  *(unsigned char *)(v1 + 264) = 0;
  *(int64x2_t *)(v1 + 272) = vdupq_n_s64(0x3FE0B0B0B0B0B0B1uLL);
  *(_OWORD *)(v1 + 288) = xmmword_100051010;
  *(unsigned char *)(v1 + 304) = 0;
  *(void *)(v1 + 312) = 0x3FDC1C1C1C1C1C1CLL;
  *(int64x2_t *)(v1 + 320) = vdupq_n_s64(0x3FDC1C1C1C1C1C1CuLL);
  *(void *)(v1 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 344) = 0;
  *(int64x2_t *)(v1 + 352) = vdupq_n_s64(0x3FD7171717171717uLL);
  *(_OWORD *)(v1 + 368) = xmmword_100051020;
  *(unsigned char *)(v1 + 384) = 0;
  *(void *)(v1 + 392) = 0x3FD1D1D1D1D1D1D2;
  *(int64x2_t *)(v1 + 400) = vdupq_n_s64(0x3FD1D1D1D1D1D1D2uLL);
  *(void *)(v1 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 424) = 0;
  *(int64x2_t *)(v1 + 432) = vdupq_n_s64(0x3FC999999999999AuLL);
  *(_OWORD *)(v1 + 448) = xmmword_100051030;
  *(unsigned char *)(v1 + 464) = 0;
  *(void *)(v1 + 472) = 0;
  *(void *)(v1 + 480) = 0;
  *(void *)(v1 + 488) = 0;
  *(void *)(v1 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 504) = 0;
  *(void *)(v0 + 32) = v1;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v7 + 32) = xmmword_100051040;
  *(_OWORD *)(v7 + 48) = xmmword_100051050;
  *(unsigned char *)(v7 + 64) = 0;
  *(_OWORD *)(v7 + 72) = xmmword_100051060;
  *(_OWORD *)(v7 + 88) = xmmword_100051070;
  *(unsigned char *)(v7 + 104) = 0;
  *(_OWORD *)(v7 + 112) = xmmword_100051080;
  *(_OWORD *)(v7 + 128) = xmmword_100051090;
  *(unsigned char *)(v7 + 144) = 0;
  *(_OWORD *)(v7 + 152) = xmmword_1000510A0;
  *(_OWORD *)(v7 + 168) = xmmword_1000510B0;
  *(unsigned char *)(v7 + 184) = 0;
  *(_OWORD *)(v7 + 192) = xmmword_1000510C0;
  *(_OWORD *)(v7 + 208) = xmmword_1000510D0;
  *(unsigned char *)(v7 + 224) = 0;
  *(_OWORD *)(v7 + 232) = xmmword_1000510E0;
  *(_OWORD *)(v7 + 248) = xmmword_1000510F0;
  *(unsigned char *)(v7 + 264) = 0;
  *(_OWORD *)(v7 + 272) = xmmword_100051100;
  *(_OWORD *)(v7 + 288) = xmmword_100051110;
  *(unsigned char *)(v7 + 304) = 0;
  *(void *)(v7 + 312) = 0x3FD6161616161616;
  *(_OWORD *)(v7 + 320) = xmmword_100051120;
  *(void *)(v7 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v7 + 344) = 0;
  *(_OWORD *)(v7 + 352) = xmmword_100051130;
  *(_OWORD *)(v7 + 368) = xmmword_100051110;
  *(unsigned char *)(v7 + 384) = 0;
  *(void *)(v7 + 392) = 0x3FD999999999999ALL;
  *(_OWORD *)(v7 + 400) = xmmword_100051140;
  *(void *)(v7 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v7 + 424) = 0;
  *(_OWORD *)(v7 + 432) = xmmword_100051150;
  *(_OWORD *)(v7 + 448) = xmmword_100051160;
  *(unsigned char *)(v7 + 464) = 0;
  *(void *)(v7 + 472) = 0x3FC3131313131313;
  *(_OWORD *)(v7 + 480) = xmmword_100051170;
  *(void *)(v7 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v7 + 504) = 0;
  *(void *)(v0 + 40) = v7;
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v8 + 32) = xmmword_100051180;
  *(_OWORD *)(v8 + 48) = xmmword_100051190;
  *(unsigned char *)(v8 + 64) = 0;
  *(_OWORD *)(v8 + 72) = xmmword_1000511A0;
  *(_OWORD *)(v8 + 88) = xmmword_1000511B0;
  *(unsigned char *)(v8 + 104) = 0;
  *(_OWORD *)(v8 + 112) = xmmword_1000511C0;
  *(_OWORD *)(v8 + 128) = xmmword_1000511D0;
  *(unsigned char *)(v8 + 144) = 0;
  *(_OWORD *)(v8 + 152) = xmmword_1000511E0;
  *(_OWORD *)(v8 + 168) = xmmword_1000511F0;
  *(unsigned char *)(v8 + 184) = 0;
  *(_OWORD *)(v8 + 192) = xmmword_100051200;
  *(_OWORD *)(v8 + 208) = xmmword_100051210;
  *(unsigned char *)(v8 + 224) = 0;
  *(_OWORD *)(v8 + 232) = xmmword_100051220;
  *(_OWORD *)(v8 + 248) = xmmword_100051110;
  *(unsigned char *)(v8 + 264) = 0;
  *(_OWORD *)(v8 + 272) = xmmword_100051230;
  *(_OWORD *)(v8 + 288) = xmmword_100051110;
  *(unsigned char *)(v8 + 304) = 0;
  *(void *)(v8 + 312) = 0x3FDE9E9E9E9E9E9FLL;
  *(_OWORD *)(v8 + 320) = xmmword_100051240;
  *(void *)(v8 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v8 + 344) = 0;
  *(_OWORD *)(v8 + 352) = xmmword_100051250;
  *(_OWORD *)(v8 + 368) = xmmword_100051110;
  *(unsigned char *)(v8 + 384) = 0;
  *(void *)(v8 + 392) = 0x3FE1B1B1B1B1B1B2;
  *(_OWORD *)(v8 + 400) = xmmword_100051260;
  *(void *)(v8 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v8 + 424) = 0;
  *(_OWORD *)(v8 + 432) = xmmword_100051270;
  *(_OWORD *)(v8 + 448) = xmmword_100051280;
  *(unsigned char *)(v8 + 464) = 0;
  *(void *)(v8 + 472) = 0x3FCC1C1C1C1C1C1CLL;
  *(_OWORD *)(v8 + 480) = xmmword_100051290;
  *(void *)(v8 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v8 + 504) = 0;
  *(void *)(v0 + 48) = v8;
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v9 + 32) = xmmword_1000512A0;
  *(_OWORD *)(v9 + 48) = xmmword_1000512B0;
  *(unsigned char *)(v9 + 64) = 0;
  *(_OWORD *)(v9 + 72) = xmmword_1000512C0;
  *(_OWORD *)(v9 + 88) = xmmword_1000512D0;
  *(unsigned char *)(v9 + 104) = 0;
  *(_OWORD *)(v9 + 112) = xmmword_1000512E0;
  *(_OWORD *)(v9 + 128) = xmmword_1000512F0;
  *(unsigned char *)(v9 + 144) = 0;
  *(_OWORD *)(v9 + 152) = xmmword_100051300;
  *(_OWORD *)(v9 + 168) = xmmword_100051310;
  *(unsigned char *)(v9 + 184) = 0;
  *(_OWORD *)(v9 + 192) = xmmword_100051320;
  *(_OWORD *)(v9 + 208) = xmmword_1000510B0;
  *(unsigned char *)(v9 + 224) = 0;
  *(_OWORD *)(v9 + 232) = xmmword_100051330;
  *(_OWORD *)(v9 + 248) = xmmword_100051110;
  *(unsigned char *)(v9 + 264) = 0;
  *(_OWORD *)(v9 + 272) = xmmword_100051340;
  *(_OWORD *)(v9 + 288) = xmmword_100051110;
  *(unsigned char *)(v9 + 304) = 0;
  *(void *)(v9 + 312) = 0x3FE5353535353535;
  *(_OWORD *)(v9 + 320) = xmmword_100051350;
  *(void *)(v9 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v9 + 344) = 0;
  *(_OWORD *)(v9 + 352) = xmmword_100051360;
  *(_OWORD *)(v9 + 368) = xmmword_1000510F0;
  *(unsigned char *)(v9 + 384) = 0;
  *(void *)(v9 + 392) = 0x3FE8989898989899;
  *(_OWORD *)(v9 + 400) = xmmword_100051370;
  *(void *)(v9 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v9 + 424) = 0;
  *(_OWORD *)(v9 + 432) = xmmword_100051380;
  *(_OWORD *)(v9 + 448) = xmmword_100051390;
  *(unsigned char *)(v9 + 464) = 0;
  *(void *)(v9 + 472) = 0x3FD3939393939394;
  *(_OWORD *)(v9 + 480) = xmmword_1000513A0;
  *(void *)(v9 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v9 + 504) = 0;
  *(void *)(v0 + 56) = v9;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v10 + 32) = xmmword_1000513B0;
  *(_OWORD *)(v10 + 48) = xmmword_1000513C0;
  *(unsigned char *)(v10 + 64) = 0;
  *(_OWORD *)(v10 + 72) = xmmword_1000513D0;
  *(_OWORD *)(v10 + 88) = xmmword_100050FD0;
  *(unsigned char *)(v10 + 104) = 0;
  *(_OWORD *)(v10 + 112) = xmmword_1000513E0;
  *(_OWORD *)(v10 + 128) = xmmword_1000513F0;
  *(unsigned char *)(v10 + 144) = 0;
  *(_OWORD *)(v10 + 152) = xmmword_100051400;
  *(_OWORD *)(v10 + 168) = xmmword_100051410;
  *(unsigned char *)(v10 + 184) = 0;
  *(_OWORD *)(v10 + 192) = xmmword_100051420;
  *(_OWORD *)(v10 + 208) = xmmword_100051430;
  *(unsigned char *)(v10 + 224) = 0;
  *(_OWORD *)(v10 + 232) = xmmword_100051440;
  *(_OWORD *)(v10 + 248) = xmmword_100051110;
  *(unsigned char *)(v10 + 264) = 0;
  *(_OWORD *)(v10 + 272) = xmmword_100051450;
  *(_OWORD *)(v10 + 288) = xmmword_100051110;
  *(unsigned char *)(v10 + 304) = 0;
  *(void *)(v10 + 312) = 0x3FEA7A7A7A7A7A7ALL;
  *(_OWORD *)(v10 + 320) = xmmword_100051460;
  *(void *)(v10 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v10 + 344) = 0;
  *(_OWORD *)(v10 + 352) = xmmword_100051470;
  *(_OWORD *)(v10 + 368) = xmmword_1000510F0;
  *(unsigned char *)(v10 + 384) = 0;
  *(void *)(v10 + 392) = 0x3FEEBEBEBEBEBEBFLL;
  *(_OWORD *)(v10 + 400) = xmmword_100051480;
  *(void *)(v10 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v10 + 424) = 0;
  *(_OWORD *)(v10 + 432) = xmmword_100051490;
  *(_OWORD *)(v10 + 448) = xmmword_1000514A0;
  *(unsigned char *)(v10 + 464) = 0;
  *(void *)(v10 + 472) = 0x3FD999999999999ALL;
  *(_OWORD *)(v10 + 480) = xmmword_1000514B0;
  *(void *)(v10 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v10 + 504) = 0;
  *(void *)(v0 + 64) = v10;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v11 + 32) = xmmword_1000514C0;
  *(_OWORD *)(v11 + 48) = xmmword_1000514D0;
  *(unsigned char *)(v11 + 64) = 0;
  *(_OWORD *)(v11 + 72) = xmmword_1000514E0;
  *(_OWORD *)(v11 + 88) = xmmword_1000514F0;
  *(unsigned char *)(v11 + 104) = 0;
  *(_OWORD *)(v11 + 112) = xmmword_100051500;
  *(_OWORD *)(v11 + 128) = xmmword_100051510;
  *(unsigned char *)(v11 + 144) = 0;
  *(_OWORD *)(v11 + 152) = xmmword_100051520;
  *(_OWORD *)(v11 + 168) = xmmword_100051530;
  *(unsigned char *)(v11 + 184) = 0;
  *(_OWORD *)(v11 + 192) = xmmword_100051540;
  *(_OWORD *)(v11 + 208) = xmmword_100051550;
  *(unsigned char *)(v11 + 224) = 0;
  *(_OWORD *)(v11 + 232) = xmmword_100051560;
  *(_OWORD *)(v11 + 248) = xmmword_100051570;
  *(unsigned char *)(v11 + 264) = 0;
  *(_OWORD *)(v11 + 272) = xmmword_100051580;
  *(_OWORD *)(v11 + 288) = xmmword_100051110;
  *(unsigned char *)(v11 + 304) = 0;
  *(void *)(v11 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v11 + 320) = xmmword_100051590;
  *(void *)(v11 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v11 + 344) = 0;
  *(_OWORD *)(v11 + 352) = xmmword_1000515A0;
  *(_OWORD *)(v11 + 368) = xmmword_100051110;
  *(unsigned char *)(v11 + 384) = 0;
  *(void *)(v11 + 392) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v11 + 400) = xmmword_1000515B0;
  *(void *)(v11 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v11 + 424) = 0;
  *(_OWORD *)(v11 + 432) = xmmword_1000515C0;
  *(_OWORD *)(v11 + 448) = xmmword_1000515D0;
  *(unsigned char *)(v11 + 464) = 0;
  *(void *)(v11 + 472) = 0x3FDD9D9D9D9D9D9ELL;
  *(_OWORD *)(v11 + 480) = xmmword_1000515E0;
  *(void *)(v11 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v11 + 504) = 0;
  *(void *)(v0 + 72) = v11;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v12 + 32) = xmmword_1000515F0;
  *(_OWORD *)(v12 + 48) = xmmword_100051600;
  *(unsigned char *)(v12 + 64) = 0;
  *(_OWORD *)(v12 + 72) = xmmword_100051610;
  *(_OWORD *)(v12 + 88) = xmmword_1000514F0;
  *(unsigned char *)(v12 + 104) = 0;
  *(_OWORD *)(v12 + 112) = xmmword_100051620;
  *(_OWORD *)(v12 + 128) = xmmword_100050FC0;
  *(unsigned char *)(v12 + 144) = 0;
  *(_OWORD *)(v12 + 152) = xmmword_100051630;
  *(_OWORD *)(v12 + 168) = xmmword_100051640;
  *(unsigned char *)(v12 + 184) = 0;
  *(_OWORD *)(v12 + 192) = xmmword_100051650;
  *(_OWORD *)(v12 + 208) = xmmword_100051660;
  *(unsigned char *)(v12 + 224) = 0;
  *(_OWORD *)(v12 + 232) = xmmword_100051670;
  *(_OWORD *)(v12 + 248) = xmmword_100051680;
  *(unsigned char *)(v12 + 264) = 0;
  *(_OWORD *)(v12 + 272) = xmmword_100051690;
  *(_OWORD *)(v12 + 288) = xmmword_1000516A0;
  *(unsigned char *)(v12 + 304) = 0;
  *(void *)(v12 + 312) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v12 + 320) = xmmword_1000516B0;
  *(void *)(v12 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v12 + 344) = 0;
  *(_OWORD *)(v12 + 352) = xmmword_1000516C0;
  *(_OWORD *)(v12 + 368) = xmmword_1000516D0;
  *(unsigned char *)(v12 + 384) = 0;
  *(void *)(v12 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v12 + 400) = xmmword_1000516E0;
  *(void *)(v12 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v12 + 424) = 0;
  *(_OWORD *)(v12 + 432) = xmmword_1000516F0;
  *(_OWORD *)(v12 + 448) = xmmword_100051190;
  *(unsigned char *)(v12 + 464) = 0;
  *(void *)(v12 + 472) = 0x3FE2D2D2D2D2D2D3;
  *(_OWORD *)(v12 + 480) = xmmword_100051700;
  *(void *)(v12 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v12 + 504) = 0;
  *(void *)(v0 + 80) = v12;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v13 + 32) = xmmword_100051710;
  *(_OWORD *)(v13 + 48) = xmmword_100051600;
  *(unsigned char *)(v13 + 64) = 0;
  *(_OWORD *)(v13 + 72) = xmmword_100051720;
  *(_OWORD *)(v13 + 88) = v17;
  *(unsigned char *)(v13 + 104) = 0;
  *(_OWORD *)(v13 + 112) = xmmword_100051730;
  *(_OWORD *)(v13 + 128) = xmmword_1000514F0;
  *(unsigned char *)(v13 + 144) = 0;
  *(_OWORD *)(v13 + 152) = xmmword_100051740;
  *(_OWORD *)(v13 + 168) = xmmword_1000514F0;
  *(unsigned char *)(v13 + 184) = 0;
  *(_OWORD *)(v13 + 192) = xmmword_100051750;
  *(_OWORD *)(v13 + 208) = xmmword_100051410;
  *(unsigned char *)(v13 + 224) = 0;
  *(_OWORD *)(v13 + 232) = xmmword_100051760;
  *(_OWORD *)(v13 + 248) = xmmword_100051770;
  *(unsigned char *)(v13 + 264) = 0;
  *(_OWORD *)(v13 + 272) = xmmword_100051780;
  *(_OWORD *)(v13 + 288) = xmmword_100051790;
  *(unsigned char *)(v13 + 304) = 0;
  *(void *)(v13 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v13 + 320) = xmmword_1000517A0;
  *(void *)(v13 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v13 + 344) = 0;
  *(_OWORD *)(v13 + 352) = xmmword_1000517B0;
  *(_OWORD *)(v13 + 368) = xmmword_1000512F0;
  *(unsigned char *)(v13 + 384) = 0;
  *(void *)(v13 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v13 + 400) = xmmword_1000517C0;
  *(void *)(v13 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v13 + 424) = 0;
  *(_OWORD *)(v13 + 432) = xmmword_1000517D0;
  *(_OWORD *)(v13 + 448) = xmmword_1000512B0;
  *(unsigned char *)(v13 + 464) = 0;
  *(void *)(v13 + 472) = 0x3FE6363636363636;
  *(_OWORD *)(v13 + 480) = xmmword_1000517E0;
  *(void *)(v13 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v13 + 504) = 0;
  *(void *)(v0 + 88) = v13;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v14 + 32) = xmmword_1000517F0;
  *(_OWORD *)(v14 + 48) = xmmword_100051800;
  *(unsigned char *)(v14 + 64) = 0;
  *(_OWORD *)(v14 + 72) = xmmword_100051810;
  *(_OWORD *)(v14 + 88) = v17;
  *(unsigned char *)(v14 + 104) = 0;
  *(_OWORD *)(v14 + 112) = xmmword_100051820;
  *(_OWORD *)(v14 + 128) = xmmword_1000514F0;
  *(unsigned char *)(v14 + 144) = 0;
  *(_OWORD *)(v14 + 152) = xmmword_100051830;
  *(_OWORD *)(v14 + 168) = xmmword_1000514F0;
  *(unsigned char *)(v14 + 184) = 0;
  *(_OWORD *)(v14 + 192) = xmmword_100051840;
  *(_OWORD *)(v14 + 208) = xmmword_100051850;
  *(unsigned char *)(v14 + 224) = 0;
  *(_OWORD *)(v14 + 232) = xmmword_100051860;
  *(_OWORD *)(v14 + 248) = xmmword_100051870;
  *(unsigned char *)(v14 + 264) = 0;
  *(_OWORD *)(v14 + 272) = xmmword_100051880;
  *(_OWORD *)(v14 + 288) = xmmword_100051890;
  *(unsigned char *)(v14 + 304) = 0;
  *(void *)(v14 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v14 + 320) = xmmword_1000518A0;
  *(void *)(v14 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v14 + 344) = 0;
  *(_OWORD *)(v14 + 352) = xmmword_1000518B0;
  *(_OWORD *)(v14 + 368) = xmmword_1000518C0;
  *(unsigned char *)(v14 + 384) = 0;
  *(void *)(v14 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v14 + 400) = xmmword_1000518D0;
  *(void *)(v14 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v14 + 424) = 0;
  *(_OWORD *)(v14 + 432) = xmmword_1000518E0;
  *(_OWORD *)(v14 + 448) = xmmword_1000518F0;
  *(unsigned char *)(v14 + 464) = 0;
  *(void *)(v14 + 472) = 0x3FE9B9B9B9B9B9BALL;
  *(_OWORD *)(v14 + 480) = xmmword_100051900;
  *(void *)(v14 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v14 + 504) = 0;
  *(void *)(v0 + 96) = v14;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100050FB0;
  *(_OWORD *)(v15 + 32) = xmmword_100051910;
  *(_OWORD *)(v15 + 48) = v17;
  *(unsigned char *)(v15 + 64) = 0;
  *(_OWORD *)(v15 + 72) = xmmword_100051920;
  *(_OWORD *)(v15 + 88) = v17;
  *(unsigned char *)(v15 + 104) = 0;
  *(_OWORD *)(v15 + 112) = xmmword_100051930;
  *(_OWORD *)(v15 + 128) = xmmword_1000514F0;
  *(unsigned char *)(v15 + 144) = 0;
  *(_OWORD *)(v15 + 152) = xmmword_100051940;
  *(_OWORD *)(v15 + 168) = v17;
  *(unsigned char *)(v15 + 184) = 0;
  *(_OWORD *)(v15 + 192) = xmmword_100051950;
  *(_OWORD *)(v15 + 208) = xmmword_100051960;
  *(unsigned char *)(v15 + 224) = 0;
  *(_OWORD *)(v15 + 232) = xmmword_100051970;
  *(_OWORD *)(v15 + 248) = xmmword_1000514D0;
  *(unsigned char *)(v15 + 264) = 0;
  *(_OWORD *)(v15 + 272) = xmmword_100051980;
  *(_OWORD *)(v15 + 288) = xmmword_100050FD0;
  *(unsigned char *)(v15 + 304) = 0;
  *(void *)(v15 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v15 + 320) = xmmword_100051990;
  *(void *)(v15 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v15 + 344) = 0;
  *(_OWORD *)(v15 + 352) = xmmword_1000519A0;
  *(_OWORD *)(v15 + 368) = xmmword_1000519B0;
  *(unsigned char *)(v15 + 384) = 0;
  *(void *)(v15 + 392) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v15 + 400) = xmmword_1000519C0;
  *(void *)(v15 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v15 + 424) = 0;
  *(_OWORD *)(v15 + 432) = xmmword_1000519D0;
  *(_OWORD *)(v15 + 448) = xmmword_1000519E0;
  *(unsigned char *)(v15 + 464) = 0;
  *(void *)(v15 + 472) = 0x3FEBFBFBFBFBFBFCLL;
  double result = 0.933333333;
  *(_OWORD *)(v15 + 480) = xmmword_1000519F0;
  *(void *)(v15 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v15 + 504) = 0;
  *(void *)(v0 + 104) = v15;
  qword_100077698 = v0;
  return result;
}

void sub_100022440()
{
  sub_100022460();
  qword_100071FF0 = v0;
}

void sub_100022460()
{
  if (qword_100071068 != -1) {
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v1 = (void *)qword_100077698;
    uint64_t v2 = *(void *)(qword_100077698 + 16);
    if (v2)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = swift_bridgeObjectRetain();
      uint64_t v0 = sub_10002290C(v3);
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        if (!v1[2]) {
          goto LABEL_43;
        }
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    uint64_t v1 = sub_100031C0C(v1);
    if (!v1[2])
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
LABEL_5:
    v1[4] = v0;
    swift_bridgeObjectRelease();
    if (v2 == 1) {
      break;
    }
    uint64_t v0 = v2 + 3;
    uint64_t v4 = 5;
    while (v0 != 3)
    {
      if ((unint64_t)(v0 - 4) >= *(void *)(qword_100077698 + 16)) {
        goto LABEL_38;
      }
      unint64_t v5 = v1[2];
      uint64_t v6 = swift_bridgeObjectRetain();
      if (v4 - 4 >= v5) {
        goto LABEL_39;
      }
      v1[v4] = v6;
      swift_bridgeObjectRelease();
      --v0;
      ++v4;
      if (v0 == 4) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once();
  }
LABEL_11:
  int64_t v7 = v1[2];
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return;
  }
  int v40 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_100031574(0, v7, 0);
  uint64_t v8 = 0;
  int64_t v36 = v7;
  while (1)
  {
    uint64_t v37 = v8;
    uint64_t v9 = v1[v8 + 4];
    int64_t v10 = *(void *)(v9 + 16);
    if (v10) {
      break;
    }
    uint64_t v29 = &_swiftEmptyArrayStorage;
LABEL_30:
    char v33 = v40;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100031574(0, v33[2] + 1, 1);
      char v33 = v40;
    }
    unint64_t v35 = v33[2];
    unint64_t v34 = v33[3];
    if (v35 >= v34 >> 1)
    {
      sub_100031574((void *)(v34 > 1), v35 + 1, 1);
      char v33 = v40;
    }
    ++v8;
    v33[2] = v35 + 1;
    v33[v35 + 4] = v29;
    if (v37 + 1 == v7)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  long long v39 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_100031534(0, v10, 0);
  uint64_t v11 = self;
  uint64_t v12 = (double *)(v9 + 64);
  while (1)
  {
    CGFloat v13 = *(v12 - 4);
    CGFloat v14 = *(v12 - 3);
    CGFloat v15 = *(v12 - 2);
    CGFloat v16 = *(v12 - 1);
    CFStringRef v17 = *(unsigned char *)v12 ? kCGColorSpaceDisplayP3 : kCGColorSpaceSRGB;
    uint64_t v18 = CGColorSpaceCreateWithName(v17);
    if (!v18) {
      break;
    }
    uint64_t v19 = v18;
    v38[0] = v13;
    v38[1] = v14;
    v38[2] = v15;
    v38[3] = v16;
    CGColorRef v20 = CGColorCreate(v18, v38);

    if (!v20) {
      goto LABEL_45;
    }
    id v21 = [objc_allocWithZone((Class)UIColor) initWithCGColor:v20];

    id v22 = [v11 _convertColorPickerColor:v21 fromUserInterfaceStyle:1 to:2];
    uint64_t v23 = (CGColor *)[v22 CGColor];
    uint64_t v24 = (void *)UISCreateCachedColorTransform();
    if (!v24) {
      goto LABEL_46;
    }
    id v25 = v24;
    uint64_t v26 = CGColorGetColorSpace(v23);
    if (!v26) {
      goto LABEL_47;
    }
    uint64_t v27 = v26;
    if (!CGColorRef.components.getter()) {
      goto LABEL_48;
    }
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v23);

    uint64_t v29 = v39;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100031534(0, v29[2] + 1, 1);
      uint64_t v29 = v39;
    }
    unint64_t v31 = v29[2];
    unint64_t v30 = v29[3];
    if (v31 >= v30 >> 1)
    {
      sub_100031534((char *)(v30 > 1), v31 + 1, 1);
      uint64_t v29 = v39;
    }
    v29[2] = v31 + 1;
    unsigned __int8 v32 = (char *)&v29[5 * v31];
    *((void *)v32 + 4) = 0;
    *((void *)v32 + 5) = 0;
    *((void *)v32 + 6) = 0;
    *((CGFloat *)v32 + 7) = Alpha;
    v32[64] = 0;
    v12 += 5;
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      int64_t v7 = v36;
      goto LABEL_30;
    }
  }
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
}

uint64_t sub_10002290C(uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 < 2) {
    return v1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = v2 >> 1;
  unint64_t v5 = v2 - 1;
  uint64_t v6 = 40 * v2 - 8;
  for (uint64_t i = 32; ; i += 40)
  {
    if (v3 == v5) {
      goto LABEL_5;
    }
    unint64_t v10 = *(void *)(v1 + 16);
    if (v3 >= v10) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_12;
    }
    long long v17 = *(_OWORD *)(v1 + i + 16);
    long long v18 = *(_OWORD *)(v1 + i);
    char v11 = *(unsigned char *)(v1 + i + 32);
    uint64_t v12 = *(void *)(v1 + v6);
    uint64_t v13 = *(void *)(v1 + v6 + 8);
    uint64_t v14 = *(void *)(v1 + v6 + 16);
    uint64_t v15 = *(void *)(v1 + v6 + 24);
    char v16 = *(unsigned char *)(v1 + v6 + 32);
    double result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      double result = (uint64_t)sub_100031BF8(v1);
      uint64_t v1 = result;
    }
    uint64_t v8 = v1 + i;
    *(void *)uint64_t v8 = v12;
    *(void *)(v8 + 8) = v13;
    *(void *)(v8 + 16) = v14;
    *(void *)(v8 + 24) = v15;
    *(unsigned char *)(v8 + 32) = v16;
    uint64_t v9 = v1 + v6;
    *(_OWORD *)uint64_t v9 = v18;
    *(_OWORD *)(v9 + 16) = v17;
    *(unsigned char *)(v9 + 32) = v11;
LABEL_5:
    ++v3;
    --v5;
    v6 -= 40;
    if (v4 == v3) {
      return v1;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100022A2C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1000236D8(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1000234A0((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_100023504;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t *sub_100022B2C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_10000816C(&qword_100071B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    char v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    *char v11 = v13;
    v11[1] = v14;
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100022C78(uint64_t a1)
{
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_100022D30(void *a1, void *a2, int *a3)
{
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  *uint64_t v9 = v11;
  v9[1] = v12;
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100022E2C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000C8F8((uint64_t)a1, &qword_100071B20);
    sub_10000816C(&qword_100071B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_100022F70(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

char *sub_100023058(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000C8F8((uint64_t)a1, &qword_100071B20);
    uint64_t v6 = sub_10000816C(&qword_100071B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002318C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000231A0);
}

uint64_t sub_1000231A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000816C(&qword_100071FF8);
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

uint64_t sub_100023264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100023278);
}

uint64_t sub_100023278(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000816C(&qword_100071FF8);
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

uint64_t type metadata accessor for ColorSwatchPickerView()
{
  uint64_t result = qword_100072058;
  if (!qword_100072058) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100023384()
{
  sub_100023428();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100023428()
{
  if (!qword_100072068)
  {
    type metadata accessor for ColorScheme();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100072068);
    }
  }
}

uint64_t sub_100023480()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000234A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSwatchPickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10001EC54(a1, v6, a2);
}

uint64_t sub_100023588@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10001F8E4(a1, v6, a2);
}

unint64_t sub_100023608()
{
  unint64_t result = qword_1000720F0;
  if (!qword_1000720F0)
  {
    sub_10000CA7C(&qword_1000720E0);
    sub_100023684();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000720F0);
  }
  return result;
}

unint64_t sub_100023684()
{
  unint64_t result = qword_1000720F8;
  if (!qword_1000720F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000720F8);
  }
  return result;
}

uint64_t sub_1000236D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100023740(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000237A0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10001FBE8(a1, v6, a2);
}

uint64_t sub_100023820()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = type metadata accessor for GeometryProxy();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v0 + v3, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = (v3 + v4 + v7) & ~v7;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v10, v5);

  return _swift_deallocObject(v0, v10 + v8, v2 | v7 | 7);
}

uint64_t sub_1000239E4(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  type metadata accessor for GeometryProxy();

  return sub_1000201C4(a1, v1 + v4);
}

uint64_t sub_100023ABC()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100023BF4(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100020614(a1, v4);
}

unint64_t sub_100023C64()
{
  unint64_t result = qword_100072120;
  if (!qword_100072120)
  {
    sub_10000CA7C(&qword_1000720C8);
    sub_100023D04();
    sub_10000CC70(&qword_100072140, &qword_100072148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072120);
  }
  return result;
}

unint64_t sub_100023D04()
{
  unint64_t result = qword_100072128;
  if (!qword_100072128)
  {
    sub_10000CA7C(&qword_1000720C0);
    sub_100023DA4();
    sub_10000CC70(&qword_1000716C8, &qword_1000716A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072128);
  }
  return result;
}

unint64_t sub_100023DA4()
{
  unint64_t result = qword_100072130;
  if (!qword_100072130)
  {
    sub_10000CA7C(&qword_1000720B8);
    sub_10000CC70(&qword_100072138, &qword_1000720B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072130);
  }
  return result;
}

uint64_t sub_100023E6C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

double sub_100023FB8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v4 = *(void *)(v1
                 + ((*(void *)(v3 + 64)
                   + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                   + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10001FD14(v4, a1);
}

uint64_t sub_100024064()
{
  uint64_t result = Transaction.disablesAnimations.getter();
  if ((result & 1) == 0)
  {
    swift_retain();
    return Transaction.animation.setter();
  }
  return result;
}

uint64_t sub_1000240A0()
{
  swift_release();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000240D8()
{
  return sub_100024064();
}

uint64_t sub_1000240E0()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_100024224@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10001FAFC(a1, v2 + v6, v7, a2);
}

unint64_t sub_1000242D0()
{
  unint64_t result = qword_100072168;
  if (!qword_100072168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072168);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorPreferenceKey()
{
  return &type metadata for ColorSwatchPickerView.ColorPreferenceKey;
}

__n128 initializeWithTake for FavoriteColorPickerView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.ColorCell(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.ColorCell(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorCell()
{
  return &type metadata for ColorSwatchPickerView.ColorCell;
}

uint64_t sub_1000243F4()
{
  return sub_10000CC70(&qword_100072170, &qword_100072178);
}

uint64_t sub_100024430()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002444C()
{
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10002445C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100020E30(a1, (long long *)(v2 + 16), a2);
}

unint64_t sub_100024464()
{
  unint64_t result = qword_100072198;
  if (!qword_100072198)
  {
    sub_10000CA7C(&qword_100072190);
    sub_10000CC70(&qword_1000721A0, &qword_1000721A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072198);
  }
  return result;
}

uint64_t initializeWithCopy for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 49)) {
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

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.AccessibilitySelectionState()
{
  return &type metadata for ColorSwatchPickerView.AccessibilitySelectionState;
}

uint64_t destroy for ColorSwatchPickerView.ColorPreferenceData()
{
  return swift_release();
}

uint64_t initializeWithCopy for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.ColorPreferenceData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorPreferenceData()
{
  return &type metadata for ColorSwatchPickerView.ColorPreferenceData;
}

unint64_t sub_1000248D8()
{
  unint64_t result = qword_1000721B0;
  if (!qword_1000721B0)
  {
    sub_10000CA7C(&qword_100072188);
    sub_100024954();
    sub_100024A00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000721B0);
  }
  return result;
}

unint64_t sub_100024954()
{
  unint64_t result = qword_1000721B8;
  if (!qword_1000721B8)
  {
    sub_10000CA7C(&qword_100072180);
    sub_100024464();
    sub_100024B6C((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000721B8);
  }
  return result;
}

unint64_t sub_100024A00()
{
  unint64_t result = qword_1000721C0;
  if (!qword_1000721C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000721C0);
  }
  return result;
}

uint64_t sub_100024A54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100024A70(uint64_t a1)
{
  return a1;
}

unint64_t sub_100024A9C()
{
  unint64_t result = qword_1000721E0;
  if (!qword_1000721E0)
  {
    sub_10000CA7C(&qword_1000721C8);
    sub_10000CC70(&qword_1000721E8, &qword_1000721D8);
    sub_100024B6C((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000721E0);
  }
  return result;
}

uint64_t sub_100024B6C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100024BB8()
{
  unint64_t result = qword_100072208;
  if (!qword_100072208)
  {
    sub_10000CA7C(&qword_100072210);
    sub_100024C2C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072208);
  }
  return result;
}

unint64_t sub_100024C2C()
{
  unint64_t result = qword_100072218;
  if (!qword_100072218)
  {
    sub_10000CA7C(&qword_100072220);
    sub_100024A9C();
    sub_10000CC70(&qword_1000721E8, &qword_1000721D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072218);
  }
  return result;
}

uint64_t destroy for Spectrum()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for Spectrum(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  uint64_t v6 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Spectrum(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_retain();
  swift_release();
  long long v5 = a2[2];
  long long v6 = a2[3];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(void *)(a1 + 72) = *((void *)a2 + 9);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(void *)(a1 + 104) = *((void *)a2 + 13);
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(void *)(a1 + 120) = *((void *)a2 + 15);
  *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
  *(void *)(a1 + 136) = *((void *)a2 + 17);
  swift_retain();
  swift_release();
  *(void *)(a1 + 144) = *((void *)a2 + 18);
  return a1;
}

__n128 initializeWithTake for Spectrum(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for Spectrum(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for Spectrum(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 152)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Spectrum(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 152) = 1;
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Spectrum()
{
  return &type metadata for Spectrum;
}

uint64_t sub_10002505C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100025078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = type metadata accessor for AccessibilityTraits();
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  long long v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v6 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  long long v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_10000816C(&qword_100072278);
  uint64_t v9 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10000816C(&qword_100072280);
  uint64_t v12 = __chkstk_darwin(v56);
  char v50 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v55 = (char *)&v49 - v14;
  uint64_t v15 = swift_allocObject();
  long long v16 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v15 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v15 + 128) = v16;
  *(_OWORD *)(v15 + 144) = *(_OWORD *)(v1 + 128);
  *(void *)(v15 + 160) = *(void *)(v1 + 144);
  long long v17 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v15 + 64) = v17;
  long long v18 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v15 + 96) = v18;
  long long v19 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v15 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v15 + 32) = v19;
  *(void *)&long long v58 = sub_100026FB8;
  *((void *)&v58 + 1) = v15;
  sub_100019A7C(v1);
  static AccessibilityChildBehavior.ignore.getter();
  uint64_t v20 = sub_10000816C(&qword_100072288);
  uint64_t v21 = sub_10000CC70(&qword_100072290, &qword_100072288);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v51);
  swift_release();
  static AccessibilityTraits.allowsDirectInteraction.getter();
  *(void *)&long long v58 = v20;
  *((void *)&v58 + 1) = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v52;
  View.accessibility(addTraits:)();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v5, v54);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v24 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v25 = String._bridgeToObjectiveC()();
  NSString v26 = String._bridgeToObjectiveC()();
  id v27 = [v24 localizedStringForKey:v25 value:0 table:v26];

  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v30 = v29;

  *(void *)&long long v58 = v28;
  *((void *)&v58 + 1) = v30;
  sub_100010084();
  uint64_t v31 = Text.init<A>(_:)();
  uint64_t v33 = v32;
  LOBYTE(v5) = v34 & 1;
  uint64_t v35 = (uint64_t)v55;
  uint64_t v36 = (uint64_t)v50;
  ModifiedContent<>.accessibility(label:)();
  sub_1000100D8(v31, v33, (char)v5);
  swift_bridgeObjectRelease();
  sub_10000C8F8(v36, &qword_100072280);
  long long v37 = *(_OWORD *)(v2 + 96);
  long long v58 = *(_OWORD *)(v2 + 80);
  long long v59 = v37;
  long long v60 = *(_OWORD *)(v2 + 112);
  char v61 = *(unsigned char *)(v2 + 128);
  sub_10000816C(&qword_100072D40);
  Binding.wrappedValue.getter();
  sub_10001C400();
  long long v39 = v38;
  id v40 = [v38 _accessibilityNameWithLuma];

  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v43 = v42;

  *(void *)&long long v58 = v41;
  *((void *)&v58 + 1) = v43;
  uint64_t v44 = Text.init<A>(_:)();
  uint64_t v46 = v45;
  LOBYTE(v43) = v47 & 1;
  sub_100026FC0();
  View.accessibility(value:)();
  sub_1000100D8(v44, v46, v43);
  swift_bridgeObjectRelease();
  return sub_10000C8F8(v35, &qword_100072280);
}

uint64_t sub_100025620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = static Alignment.topLeading.getter();
  a3[1] = v6;
  uint64_t v7 = sub_10000816C(&qword_1000722A0);
  return sub_100025678(a2, a1, (unsigned char *)a3 + *(int *)(v7 + 44));
}

uint64_t sub_100025678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v102 = a1;
  uint64_t v101 = a3;
  uint64_t v99 = sub_10000816C(&qword_1000722A8);
  uint64_t v98 = *(void *)(v99 - 8);
  uint64_t v3 = __chkstk_darwin(v99);
  uint64_t v93 = &v88[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v92 = &v88[-v5];
  uint64_t v6 = sub_10000816C(&qword_1000722B0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  unsigned __int8 v100 = &v88[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  long long v104 = &v88[-v9];
  uint64_t v103 = sub_10000816C(&qword_1000720A8);
  uint64_t v106 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v11 = &v88[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_10000816C(&qword_1000716A8);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = &v88[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = type metadata accessor for RoundedRectangle();
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  long long v19 = (double *)&v88[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v96 = (unsigned char *)sub_10000816C(&qword_1000722B8);
  __chkstk_darwin(v96);
  uint64_t v21 = &v88[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v22 = sub_10000816C(&qword_1000722C0);
  uint64_t v94 = *(void *)(v22 - 8);
  uint64_t v23 = __chkstk_darwin(v22);
  long long v97 = &v88[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = __chkstk_darwin(v23);
  *(void *)&long long v95 = &v88[-v26];
  __chkstk_darwin(v25);
  uint64_t v28 = &v88[-v27];
  id v90 = self;
  id v29 = [v90 currentDevice];
  id v30 = [v29 userInterfaceIdiom];

  BOOL v31 = v30 == (id)6;
  uint64_t v32 = v22;
  if (v31) {
    double v33 = 16.0;
  }
  else {
    double v33 = 8.0;
  }
  char v34 = (char *)v19 + *(int *)(v17 + 28);
  uint64_t v35 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v36 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v34, v35, v36);
  *long long v19 = v33;
  v19[1] = v33;
  sub_100027234((uint64_t)v19, (uint64_t)v15);
  uint64_t v37 = *(int *)(v13 + 44);
  uint64_t v38 = v102;
  *(_WORD *)&v15[v37] = 256;
  sub_10000C800((uint64_t)v15, (uint64_t)v21, &qword_1000716A8);
  sub_10000C8F8((uint64_t)v15, &qword_1000716A8);
  uint64_t v39 = (uint64_t)v19;
  uint64_t v40 = v94;
  sub_100023740(v39);
  sub_100026118(v105, (uint64_t)v11);
  static GestureMask.all.getter();
  sub_100027298();
  uint64_t v41 = sub_10000CC70(&qword_100072150, &qword_1000720A8);
  uint64_t v42 = v95;
  uint64_t v43 = v103;
  uint64_t v91 = v41;
  View.gesture<A>(_:including:)();
  uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v106 + 8);
  uint64_t v96 = v11;
  v106 += 8;
  v44(v11, v43);
  sub_10000C8F8((uint64_t)v21, &qword_1000722B8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v40 + 32))(v28, v42, v32);
  if (*(void *)(v38 + 136))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if ((_BYTE)v107 && v107 == 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v45 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v45 & 1) == 0) {
        goto LABEL_11;
      }
    }
    GeometryProxy.size.getter();
    *(double *)&uint64_t v48 = COERCE_DOUBLE(sub_100026564(v46, v47));
    if ((v50 & 1) == 0)
    {
      double v51 = *(double *)&v48;
      double v52 = v49;
      long long v53 = *(_OWORD *)(v38 + 96);
      long long v107 = *(_OWORD *)(v38 + 80);
      long long v54 = *(_OWORD *)(v38 + 112);
      long long v108 = v53;
      long long v109 = v54;
      char v110 = *(unsigned char *)(v38 + 128);
      sub_10000816C(&qword_100072D40);
      Binding.wrappedValue.getter();
      long long v95 = v117;
      uint64_t v55 = v118;
      uint64_t v56 = v119;
      int v89 = v120;
      id v57 = v90;
      id v58 = [v90 currentDevice];
      [v58 userInterfaceIdiom];

      id v59 = [v57 currentDevice];
      [v59 userInterfaceIdiom];

      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      uint64_t v60 = v117;
      LOBYTE(v57) = BYTE8(v117);
      uint64_t v61 = v105;
      uint64_t v62 = v118;
      id v90 = v44;
      uint64_t v63 = v28;
      uint64_t v64 = v32;
      char v65 = v119;
      uint64_t v66 = v40;
      uint64_t v67 = v120;
      uint64_t v68 = v121;
      GeometryProxy.size.getter();
      double v70 = sub_100027394(v51, v52, v69);
      long long v107 = v95;
      *(void *)&long long v108 = v55;
      *((void *)&v108 + 1) = v56;
      LOBYTE(v109) = v89;
      *((void *)&v109 + 1) = v60;
      char v110 = (char)v57;
      uint64_t v111 = v62;
      char v112 = v65;
      uint64_t v32 = v64;
      uint64_t v28 = v63;
      uint64_t v113 = v67;
      uint64_t v114 = v68;
      uint64_t v40 = v66;
      double v115 = v70;
      uint64_t v116 = v71;
      uint64_t v72 = (uint64_t)v96;
      sub_100026118(v61, (uint64_t)v96);
      static GestureMask.all.getter();
      sub_10000816C(&qword_1000722E0);
      sub_1000274C4(&qword_1000722E8, &qword_1000722E0, (void (*)(void))sub_100027494);
      uint64_t v73 = v93;
      uint64_t v74 = v103;
      View.gesture<A>(_:including:)();
      ((void (*)(uint64_t, uint64_t))v90)(v72, v74);
      uint64_t v75 = v98;
      uint64_t v76 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v98 + 32);
      uint64_t v77 = v92;
      uint64_t v78 = v99;
      v76(v92, v73, v99);
      v76(v104, v77, v78);
      uint64_t v79 = 0;
LABEL_12:
      uint64_t v80 = (uint64_t)v104;
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v75 + 56))(v104, v79, 1, v78);
      uint64_t v81 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v40 + 16);
      uint64_t v82 = v97;
      v81(v97, v28, v32);
      int v83 = v100;
      sub_10000C800(v80, (uint64_t)v100, &qword_1000722B0);
      uint64_t v84 = v101;
      v81(v101, v82, v32);
      uint64_t v85 = sub_10000816C(&qword_1000722D8);
      sub_10000C800((uint64_t)v83, (uint64_t)&v84[*(int *)(v85 + 48)], &qword_1000722B0);
      sub_10000C8F8(v80, &qword_1000722B0);
      uint64_t v86 = *(void (**)(unsigned char *, uint64_t))(v40 + 8);
      v86(v28, v32);
      sub_10000C8F8((uint64_t)v83, &qword_1000722B0);
      return ((uint64_t (*)(unsigned char *, uint64_t))v86)(v82, v32);
    }
LABEL_11:
    uint64_t v79 = 1;
    uint64_t v78 = v99;
    uint64_t v75 = v98;
    goto LABEL_12;
  }
  type metadata accessor for ColorPickerState();
  sub_1000276FC((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_100026118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v30 = a1;
  uint64_t v34 = a2;
  uint64_t v4 = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = type metadata accessor for LocalCoordinateSpace();
  __chkstk_darwin(v7);
  uint64_t v31 = type metadata accessor for DragGesture();
  uint64_t v8 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000816C(&qword_1000720A0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  uint64_t v33 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CoordinateSpaceProtocol<>.local.getter();
  DragGesture.init<A>(minimumDistance:coordinateSpace:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v4);
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 168) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = swift_allocObject();
  long long v17 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(v16 + 112) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(v16 + 128) = v17;
  *(_OWORD *)(v16 + 144) = *(_OWORD *)(v3 + 128);
  *(void *)(v16 + 160) = *(void *)(v3 + 144);
  long long v18 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v16 + 64) = v18;
  long long v19 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(v16 + 96) = v19;
  long long v20 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v16 + 32) = v20;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v16 + v15, (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_100019A7C(v3);
  sub_1000276FC(&qword_100072108, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_1000276FC(&qword_100072110, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  uint64_t v21 = v31;
  Gesture<>.onChanged(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v21);
  uint64_t v22 = swift_allocObject();
  long long v23 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(v22 + 112) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(v22 + 128) = v23;
  *(_OWORD *)(v22 + 144) = *(_OWORD *)(v3 + 128);
  *(void *)(v22 + 160) = *(void *)(v3 + 144);
  long long v24 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v22 + 64) = v24;
  long long v25 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v22 + 80) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(v22 + 96) = v25;
  long long v26 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v22 + 32) = v26;
  sub_100019A7C(v3);
  sub_10000CC70(&qword_100072118, &qword_1000720A0);
  uint64_t v27 = v32;
  Gesture.onEnded(_:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v14, v27);
}

uint64_t sub_100026564(double a1, double a2)
{
  if (*((void *)v2 + 17))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v26 == 2) {
      goto LABEL_3;
    }
    long long v6 = v2[1];
    long long v30 = *v2;
    long long v31 = v6;
    sub_10000816C(&qword_100072308);
    State.wrappedValue.getter();
    if ((LOBYTE(v34) & 1) == 0)
    {
      double v5 = v32;
      sub_10000816C(&qword_100072310);
      State.wrappedValue.getter();
      if (v35 != 2)
      {
        sub_10000816C(&qword_100072D40);
        Binding.wrappedValue.getter();
        if (((v35 & 1) == 0) != v35
          && vabdd_f64(v32, v32) < 0.001
          && vabdd_f64(v33, v33) < 0.001
          && vabdd_f64(v34, v34) < 0.001)
        {
          return *(void *)&v5;
        }
      }
    }
    sub_10000816C(&qword_100072D40);
    Binding.wrappedValue.getter();
    sub_10001CA38((uint64_t)v27);
    uint64_t v7 = self;
    [v7 positionForColor:[*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v27[0]), v27[1]).i64]];
    double v9 = (v8 + 1.0) * 0.5 * a1;
    id v11 = [v7 colorAtLocation:fmax(fmin(v9 / a1 + v9 / a1 + -1.0, 1.0), -1.0) fmax(fmin(-((a2 - (v10 + 1.0) * 0.5 * a2) / a2 + (a2 - (v10 + 1.0) * 0.5 * a2) / a2 + -1.0), 1.0), -1.0)];
    uint64_t v12 = (CGColor *)[v11 CGColor];
    uint64_t v13 = CGColorGetColorSpace(v12);

    if (v13)
    {
      char v14 = sub_10001D348(v13);
      if (v14 != 2)
      {
        sub_10001D21C(v11, v14 & 1, (uint64_t)&v28);
        float64x2_t v22 = v28;
        double v15 = v29;

LABEL_17:
        Binding.wrappedValue.getter();
        float64x2_t v16 = vsubq_f64(v23, v22);
        if (sqrt(vaddvq_f64(vmulq_f64(v16, v16)) + (v24 - v15) * (v24 - v15)) < 0.55)
        {

          double v5 = v9;
          return *(void *)&v5;
        }
        State.wrappedValue.getter();
        Binding.wrappedValue.getter();
        if (qword_100071078 != -1) {
          swift_once();
        }
        if (v25 == byte_100072248
          && vabdd_f64(v23.f64[0], *(double *)&qword_100072228) < 0.001
          && vabdd_f64(v23.f64[1], *(double *)&qword_100072230) < 0.001
          && vabdd_f64(v24, *(double *)&qword_100072238) < 0.001)
        {

          double v5 = 0.0;
          return *(void *)&v5;
        }
        Binding.wrappedValue.getter();
        if (qword_100071080 != -1) {
          swift_once();
        }
        double v19 = *(double *)&qword_100072250;
        double v18 = *(double *)algn_100072258;
        double v20 = *(double *)&qword_100072260;
        int v21 = byte_100072270;

        if (v25 == v21
          && vabdd_f64(v23.f64[0], v19) < 0.001
          && vabdd_f64(v23.f64[1], v18) < 0.001
          && vabdd_f64(v24, v20) < 0.001)
        {
          double v5 = 1.79769313e308;
          return *(void *)&v5;
        }
LABEL_3:
        double v5 = 0.0;
        return *(void *)&v5;
      }
    }
    if (qword_100071088 != -1) {
      swift_once();
    }
    sub_10001D21C(v11, byte_1000776A0, (uint64_t)&v28);
    float64x2_t v22 = v28;
    double v15 = v29;
    goto LABEL_17;
  }
  type metadata accessor for ColorPickerState();
  sub_1000276FC((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

void sub_100026B48(uint64_t a1, long long *a2)
{
  if (*((void *)a2 + 17))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v25) = 1;
    swift_retain();
    static Published.subscript.setter();
    DragGesture.Value.location.getter();
    long long v3 = a2[1];
    long long v25 = *a2;
    long long v26 = v3;
    sub_10000816C(&qword_100072308);
    State.wrappedValue.setter();
    long long v4 = a2[6];
    long long v25 = a2[5];
    long long v26 = v4;
    long long v27 = a2[7];
    char v28 = *((unsigned char *)a2 + 128);
    sub_10000816C(&qword_100072D40);
    Binding.wrappedValue.getter();
    double v6 = v29;
    double v5 = v30;
    double v8 = v31;
    uint64_t v7 = v32;
    int v9 = v33;
    DragGesture.Value.location.getter();
    double v11 = v10;
    double v13 = v12;
    GeometryProxy.size.getter();
    id v16 = [self colorAtLocation:fmax(fmin(v11 / v14 + v11 / v14 + -1.0, 1.0), -1.0) fmax(fmin(-(v13 / v15 + v13 / v15 + -1.0), 1.0), -1.0)];
    sub_10001D21C(v16, v33, (uint64_t)&v21);
    double v29 = v21;
    double v30 = v22;
    double v31 = v23;
    uint64_t v32 = v7;
    unsigned __int8 v33 = v24;
    if (v9 != v24 || vabdd_f64(v21, v6) >= 0.001 || vabdd_f64(v22, v5) >= 0.001 || vabdd_f64(v23, v8) >= 0.001)
    {
      UIAccessibilityNotifications v17 = UIAccessibilityAnnouncementNotification;
      sub_10001C400();
      double v19 = v18;
      NSString v20 = [v18 _accessibilityNameWithLuma];

      if (!v20)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v20 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      UIAccessibilityPostNotification(v17, v20);

      sub_10000816C(&qword_100072310);
      State.wrappedValue.setter();
      Binding.wrappedValue.setter();
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_1000276FC((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t sub_100026E88(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 136))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return static Published.subscript.setter();
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_1000276FC((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100026F58@<X0>(uint64_t a1@<X8>)
{
  return sub_100025078(a1);
}

uint64_t sub_100026FB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100025620(a1, v2 + 16, a2);
}

unint64_t sub_100026FC0()
{
  unint64_t result = qword_100072298;
  if (!qword_100072298)
  {
    sub_10000CA7C(&qword_100072280);
    sub_10000CA7C(&qword_100072288);
    sub_10000CC70(&qword_100072290, &qword_100072288);
    swift_getOpaqueTypeConformance2();
    sub_1000276FC((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072298);
  }
  return result;
}

void sub_1000270CC(uint64_t a1)
{
}

void sub_1000270E8(uint64_t a1)
{
}

void sub_100027104(uint64_t a1, SEL *a2, _OWORD *a3, _OWORD *a4, unsigned char *a5)
{
  id v8 = [self *a2];
  int v9 = (CGColor *)[v8 CGColor];
  double v10 = CGColorGetColorSpace(v9);

  if (v10)
  {
    char v11 = sub_10001D348(v10);
    if (v11 != 2)
    {
      sub_10001D21C(v8, v11 & 1, (uint64_t)&v17);
      long long v15 = v18;
      long long v16 = v17;
      char v14 = v19;

      long long v13 = v15;
      long long v12 = v16;
      goto LABEL_8;
    }
  }
  if (qword_100071088 != -1) {
    swift_once();
  }
  sub_10001D21C(v8, byte_1000776A0, (uint64_t)&v17);
  long long v12 = v17;
  long long v13 = v18;
  char v14 = v19;
LABEL_8:
  *a3 = v12;
  *a4 = v13;
  *a5 = v14;
}

uint64_t sub_100027234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100027298()
{
  unint64_t result = qword_1000722C8;
  if (!qword_1000722C8)
  {
    sub_10000CA7C(&qword_1000722B8);
    sub_100027338();
    sub_10000CC70(&qword_1000716C8, &qword_1000716A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000722C8);
  }
  return result;
}

unint64_t sub_100027338()
{
  unint64_t result = qword_1000722D0;
  if (!qword_1000722D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000722D0);
  }
  return result;
}

double sub_100027394(double a1, double a2, double a3)
{
  if (a1 < 0.0) {
    a1 = 0.0;
  }
  if (a1 <= a3) {
    double v3 = a1;
  }
  else {
    double v3 = a3;
  }
  uint64_t v4 = self;
  id v5 = [v4 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)6) {
    double v7 = 22.0;
  }
  else {
    double v7 = 16.5;
  }
  double v8 = v3 - v7;
  id v9 = [v4 currentDevice];
  [v9 userInterfaceIdiom];

  return v8;
}

uint64_t sub_100027494()
{
  return sub_1000274C4(&qword_1000722F0, &qword_1000722F8, (void (*)(void))sub_100027540);
}

uint64_t sub_1000274C4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CA7C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100027540()
{
  unint64_t result = qword_100072300;
  if (!qword_100072300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072300);
  }
  return result;
}

uint64_t sub_10002759C()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 168) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100027688(uint64_t a1)
{
  type metadata accessor for GeometryProxy();

  sub_100026B48(a1, (long long *)(v1 + 16));
}

uint64_t sub_1000276FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100027748()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 168, 7);
}

uint64_t sub_1000277A0(uint64_t a1)
{
  return sub_100026E88(a1, v1 + 16);
}

unint64_t sub_1000277B4()
{
  unint64_t result = qword_100072318;
  if (!qword_100072318)
  {
    sub_10000CA7C(&qword_100072320);
    sub_100026FC0();
    sub_1000276FC((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072318);
  }
  return result;
}

double sub_100027860@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

double sub_1000278E4@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_100027968()
{
  return sub_100027CC4();
}

uint64_t sub_10002797C()
{
  return sub_100027CC4();
}

uint64_t sub_100027990()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100027A04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100027A78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100027AEC()
{
  return sub_100027CC4();
}

uint64_t sub_100027B00()
{
  return sub_100027CC4();
}

uint64_t sub_100027B14()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100027B88()
{
  return sub_100027CC4();
}

uint64_t sub_100027B9C()
{
  return sub_100027CC4();
}

uint64_t sub_100027BB0()
{
  return sub_100027CC4();
}

uint64_t sub_100027BC4()
{
  return sub_100027CC4();
}

uint64_t sub_100027BD8()
{
  return sub_100027CC4();
}

uint64_t sub_100027BEC()
{
  return sub_100027CC4();
}

double sub_100027C00()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100027C74()
{
  return sub_100027CC4();
}

uint64_t sub_100027C88()
{
  uint64_t result = CUIGetDeviceArtworkDisplayGamut();
  byte_1000776A0 = result != 0;
  return result;
}

uint64_t sub_100027CB0()
{
  return sub_100027CC4();
}

uint64_t sub_100027CC4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100027D30()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_100027DA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000816C(&qword_1000729C8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10000816C(&qword_1000729D0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  double v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  long long v12 = &v17[-v11];
  uint64_t v13 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState____lazy_storage___finalColor;
  swift_beginAccess();
  sub_10000C800(v13, (uint64_t)v12, &qword_1000729D0);
  uint64_t v14 = sub_10000816C((uint64_t *)&unk_100072460);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v15 + 32))(a1, v12, v14);
  }
  sub_10000C8F8((uint64_t)v12, &qword_1000729D0);
  swift_beginAccess();
  sub_10000816C(&qword_1000729C0);
  Published.projectedValue.getter();
  swift_endAccess();
  sub_10000816C(&qword_1000729D8);
  sub_100029B60();
  Publisher.map<A>(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16))(v10, a1, v14);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  swift_beginAccess();
  sub_100029BBC((uint64_t)v10, v13);
  return swift_endAccess();
}

void sub_10002809C(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(unsigned char *)(a1 + 32) == 2) {
    uint64_t v3 = 0;
  }
  else {
    sub_10001C400();
  }
  *a2 = v3;
}

uint64_t sub_1000280F4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if ((v7 & 1) != 0
    || (swift_getKeyPath(),
        swift_getKeyPath(),
        static Published.subscript.getter(),
        swift_release(),
        swift_release(),
        v6 == 1))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    int v0 = v4;
  }
  else
  {
    int v0 = 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v5) {
    return v0 != 0;
  }
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v0) {
    return 1;
  }
  return v3 != (id)6;
}

uint64_t sub_1000282B0(uint64_t a1)
{
  uint64_t v90 = a1;
  uint64_t v2 = sub_10000816C(&qword_100072990);
  uint64_t v88 = *(void *)(v2 - 8);
  uint64_t v89 = v2;
  __chkstk_darwin(v2);
  uint64_t v87 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_10000816C(&qword_100072158);
  uint64_t v4 = __chkstk_darwin(v86);
  uint64_t v85 = (uint64_t)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v84 = (char *)&v69 - v6;
  uint64_t v7 = sub_10000816C(&qword_100072998);
  uint64_t v82 = *(void *)(v7 - 8);
  uint64_t v83 = v7;
  __chkstk_darwin(v7);
  uint64_t v81 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_10000816C(&qword_1000729A0);
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v78 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_10000816C(&qword_1000729A8);
  uint64_t v76 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v75 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_10000816C(&qword_1000729B0);
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v72 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000816C(&qword_100072F20);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_10000816C(&qword_1000729B8);
  uint64_t v16 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  long long v18 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000816C(&qword_1000729C0);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  double v22 = (char *)&v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedColor;
  long long v95 = 0u;
  long long v96 = 0u;
  char v97 = 2;
  sub_10000816C(&qword_100071BC8);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23, v22, v19);
  id v24 = [self blackColor];
  long long v25 = (CGColor *)[v24 CGColor];
  long long v26 = CGColorGetColorSpace(v25);

  if (v26)
  {
    char v27 = sub_10001D348(v26);
    if (v27 != 2)
    {
      sub_10001D21C(v24, v27 & 1, (uint64_t)&v95);
      long long v70 = v95;
      long long v69 = v96;
      char v30 = v97;

      long long v29 = v69;
      long long v28 = v70;
      goto LABEL_8;
    }
  }
  if (qword_100071088 != -1) {
    swift_once();
  }
  sub_10001D21C(v24, byte_1000776A0, (uint64_t)&v95);
  long long v28 = v95;
  long long v29 = v96;
  char v30 = v97;
LABEL_8:
  uint64_t v31 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__fallbackColor;
  long long v92 = v28;
  long long v93 = v29;
  char v94 = v30;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v31, v18, v71);
  uint64_t v32 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__allowsNoColor;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  unsigned __int8 v33 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v33(v32, v15, v12);
  uint64_t v34 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isVolatile;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v34, v15, v12);
  uint64_t v35 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedTab;
  LOBYTE(v92) = 0;
  uint64_t v36 = v72;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 32))(v35, v36, v74);
  uint64_t v37 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__title;
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v39 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v40 = String._bridgeToObjectiveC()();
  NSString v41 = String._bridgeToObjectiveC()();
  id v42 = [v39 localizedStringForKey:v40 value:0 table:v41];

  uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v45 = v44;

  *(void *)&long long v92 = v43;
  *((void *)&v92 + 1) = v45;
  double v46 = v75;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v37, v46, v77);
  uint64_t v47 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsAlpha;
  LOBYTE(v92) = 1;
  Published.init(initialValue:)();
  v33(v47, v15, v12);
  uint64_t v48 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsEyedropper;
  LOBYTE(v92) = 1;
  Published.init(initialValue:)();
  v33(v48, v15, v12);
  uint64_t v49 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__suggestedColors;
  *(void *)&long long v92 = 0;
  sub_10000816C(&qword_100072440);
  char v50 = v78;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 32))(v49, v50, v80);
  uint64_t v51 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperShowing;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v51, v15, v12);
  uint64_t v52 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperIsFloating;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v52, v15, v12);
  uint64_t v53 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__useLandscapeLayout;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v53, v15, v12);
  uint64_t v54 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isEmbedded;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v54, v15, v12);
  uint64_t v55 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isPopover;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v55, v15, v12);
  uint64_t v56 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isSheet;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v56, v15, v12);
  uint64_t v57 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__width;
  *(void *)&long long v92 = 0;
  id v58 = v81;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v82 + 32))(v57, v58, v83);
  uint64_t v59 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsGridOnly;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v59, v15, v12);
  uint64_t v60 = (void *)(v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
  void *v60 = 0;
  v60[1] = 0;
  uint64_t v61 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__enableDarkGrid;
  LOBYTE(v92) = 0;
  Published.init(initialValue:)();
  v33(v61, v15, v12);
  uint64_t v62 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__overrideColorScheme;
  uint64_t v63 = type metadata accessor for ColorScheme();
  uint64_t v64 = (uint64_t)v84;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v84, 1, 1, v63);
  sub_10000C800(v64, v85, &qword_100072158);
  char v65 = v87;
  Published.init(initialValue:)();
  sub_10000C8F8(v64, &qword_100072158);
  (*(void (**)(uint64_t, char *, uint64_t))(v88 + 32))(v62, v65, v89);
  uint64_t v66 = v1 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState____lazy_storage___finalColor;
  uint64_t v67 = sub_10000816C((uint64_t *)&unk_100072460);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v66, 1, 1, v67);
  swift_beginAccess();
  uint64_t v91 = v90;
  sub_10000816C(&qword_1000718F0);
  Published.init(initialValue:)();
  swift_endAccess();
  return v1;
}

uint64_t sub_100028F34()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedColor;
  uint64_t v2 = sub_10000816C(&qword_1000729C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__fallbackColor;
  uint64_t v4 = sub_10000816C(&qword_1000729B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__allowsNoColor;
  uint64_t v6 = sub_10000816C(&qword_100072F20);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isVolatile, v6);
  uint64_t v8 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__selectedTab;
  uint64_t v9 = sub_10000816C(&qword_1000729B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__favoriteColors;
  uint64_t v11 = sub_10000816C(&qword_1000729E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__title;
  uint64_t v13 = sub_10000816C(&qword_1000729A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsAlpha, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsEyedropper, v6);
  uint64_t v14 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__suggestedColors;
  uint64_t v15 = sub_10000816C(&qword_1000729A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperShowing, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__eyedropperIsFloating, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__useLandscapeLayout, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isEmbedded, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isPopover, v6);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__isSheet, v6);
  uint64_t v16 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__width;
  uint64_t v17 = sub_10000816C(&qword_100072998);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__showsGridOnly, v6);
  sub_100010188(*(void *)(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close));
  v7(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__enableDarkGrid, v6);
  uint64_t v18 = v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState__overrideColorScheme;
  uint64_t v19 = sub_10000816C(&qword_100072990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  sub_10000C8F8(v0 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState____lazy_storage___finalColor, &qword_1000729D0);
  return v0;
}

uint64_t sub_100029350()
{
  sub_100028F34();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000293A8()
{
  return type metadata accessor for ColorPickerState();
}

uint64_t type metadata accessor for ColorPickerState()
{
  uint64_t result = qword_1000723F8;
  if (!qword_1000723F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000293FC()
{
  sub_10002980C(319, &qword_100072408, &qword_100071BC8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F)
  {
    sub_1000297C4(319, &qword_100072410);
    if (v1 <= 0x3F)
    {
      sub_1000297C4(319, &qword_100072418);
      if (v2 <= 0x3F)
      {
        sub_1000297C4(319, &qword_100072420);
        if (v3 <= 0x3F)
        {
          sub_10002980C(319, &qword_100072428, &qword_1000718F0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
          if (v4 <= 0x3F)
          {
            sub_1000297C4(319, &qword_100072430);
            if (v5 <= 0x3F)
            {
              sub_10002980C(319, &qword_100072438, &qword_100072440, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
              if (v6 <= 0x3F)
              {
                sub_1000297C4(319, &qword_100072448);
                if (v7 <= 0x3F)
                {
                  sub_10002980C(319, &qword_100072450, &qword_100072158, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
                  if (v8 <= 0x3F)
                  {
                    sub_10002980C(319, &qword_100072458, (uint64_t *)&unk_100072460, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
                    if (v9 <= 0x3F) {
                      swift_updateClassMetadata2();
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_1000297C4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Published();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_10002980C(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = sub_10000CA7C(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void *sub_10002986C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100029878@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ColorPickerState();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000298B8@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (v12 == 2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    uint64_t result = swift_release();
    uint64_t v3 = v8;
    uint64_t v4 = v9;
    uint64_t v5 = v10;
    uint64_t v6 = v11;
    char v7 = v12;
  }
  else
  {
    uint64_t v3 = v8;
    uint64_t v4 = v9;
    char v7 = v12 & 1;
    uint64_t v5 = v10;
    uint64_t v6 = v11;
  }
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return result;
}

uint64_t sub_1000299A8()
{
  return static Published.subscript.setter();
}

uint64_t sub_100029A3C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100029ABC()
{
  return static Published.subscript.setter();
}

unint64_t sub_100029B60()
{
  unint64_t result = qword_1000729E0;
  if (!qword_1000729E0)
  {
    sub_10000CA7C(&qword_1000729C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000729E0);
  }
  return result;
}

uint64_t sub_100029BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000816C(&qword_1000729D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100029C94(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000816C(&qword_100072D78);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_100030DBC((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_100029DA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000816C(&qword_100072D68);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10000C800(v6, (uint64_t)&v13, &qword_100072D70);
    uint64_t v7 = v13;
    unint64_t result = sub_100030DBC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100034200(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

uint64_t sub_100029ED0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100031BF8(v5);
    uint64_t v5 = result;
  }
  unint64_t v7 = *(void *)(v5 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    char v9 = (_OWORD *)(v5 + 40 * a1);
    long long v10 = v9[2];
    v9 += 2;
    char v11 = *((unsigned char *)v9 + 32);
    long long v12 = v9[1];
    uint64_t result = (uint64_t)memmove(v9, (char *)v9 + 40, 40 * (v7 - 1 - a1));
    *(void *)(v5 + 16) = v8;
    *uint64_t v2 = v5;
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 32) = v11;
  }
  return result;
}

void *sub_100029F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v17[0] = a1;
  v17[1] = a2;
  uint64_t v6 = sub_10000816C(&qword_100072C98);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  char v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  char v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    uint64_t v19 = _swiftEmptyArrayStorage;
    sub_1000315B4(0, v10, 0);
    char v11 = v19;
    for (uint64_t i = (_OWORD *)(a3 + 64); ; i += 3)
    {
      long long v13 = *(i - 1);
      v18[0] = *(i - 2);
      v18[1] = v13;
      v18[2] = *i;
      ((void (*)(_OWORD *))v17[0])(v18);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v19 = v11;
      unint64_t v15 = v11[2];
      unint64_t v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_1000315B4(v14 > 1, v15 + 1, 1);
        char v11 = v19;
      }
      void v11[2] = v15 + 1;
      sub_10000C590((uint64_t)v9, (uint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v15, &qword_100072C98);
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

double sub_10002A12C@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_10002A1B4()
{
  return static Published.subscript.setter();
}

uint64_t sub_10002A40C(long long *a1)
{
  uint64_t v3 = sub_10000816C(&qword_100072C68);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)sub_100030374(a1, &v30);
  if (v31 >> 62 == 2)
  {
    v31 &= 0x3FFFFFFFFFFFFFFFuLL;
    long long v8 = *(_OWORD *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent + 16);
    v32[0] = *(_OWORD *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent);
    v32[1] = v8;
    v32[2] = *(_OWORD *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent + 32);
    uint64_t v33 = *(void *)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent + 48);
    sub_100033588((uint64_t)v32);
    sub_10002A750(a1);
    uint64_t result = sub_100033770((uint64_t)v32);
    char v9 = *(void **)(v1 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
    if (v9)
    {
      id v10 = v9;
      dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();

      long long v29 = 0;
      uint64_t v11 = NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v12 = *(void *)(v11 + 16);
      if (v12)
      {
        long long v13 = (long long *)(v11 + 64);
        unint64_t v14 = _swiftEmptyArrayStorage;
        do
        {
          if (*(void *)v13 >> 62 == 2)
          {
            long long v27 = *v13;
            long long v26 = *(v13 - 2);
            long long v25 = *(v13 - 1);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            long long v29 = v14;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_100031594(0, v14[2] + 1, 1);
              unint64_t v14 = v29;
            }
            unint64_t v16 = v14[2];
            unint64_t v15 = v14[3];
            long long v17 = v27;
            if (v16 >= v15 >> 1)
            {
              sub_100031594((char *)(v15 > 1), v16 + 1, 1);
              long long v17 = v27;
              unint64_t v14 = v29;
            }
            v14[2] = v16 + 1;
            uint64_t v18 = &v14[6 * v16];
            long long v19 = v25;
            v18[2] = v26;
            _OWORD v18[3] = v19;
            v18[4] = v17;
          }
          v13 += 3;
          --v12;
        }
        while (v12);
      }
      else
      {
        unint64_t v14 = _swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease();
      unint64_t v21 = sub_10002A8E0(a1, (uint64_t)v14);
      char v23 = v22;
      uint64_t result = swift_release();
      if ((v23 & 1) == 0)
      {
        swift_beginAccess();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        id v24 = (void (*)(unsigned char *, void))static Published.subscript.modify();
        sub_100029ED0(v21, (uint64_t)&v29);
        v24(v28, 0);
        swift_release();
        swift_release();
        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

_OWORD *sub_10002A750(long long *a1)
{
  uint64_t result = sub_100030374(a1, v14);
  char v3 = v15;
  if (v15 >> 62 == 2)
  {
    v15 &= 0x3FFFFFFFFFFFFFFFuLL;
    uint64_t v4 = v16;
    v20[0] = v14[0];
    v20[1] = v14[1];
    char v21 = v3 & 1;
    long long v17 = *(_OWORD *)(v1 + 40);
    long long v12 = *(_OWORD *)(v1 + 40);
    sub_10000816C(&qword_100072CE0);
    State.wrappedValue.getter();
    uint64_t v5 = v19;
    if (*(void *)(v19 + 16) && (unint64_t v6 = sub_100030E4C((uint64_t)v20), (v7 & 1) != 0))
    {
      long long v8 = *(void **)(*(void *)(v5 + 56) + 8 * v6);
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v8 = &_swiftEmptySetSingleton;
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = (uint64_t)v8;
    uint64_t v19 = v17;
    sub_10000C590((uint64_t)&v17 + 8, (uint64_t)v18, &qword_100072D28);
    sub_100031C20((uint64_t *)&v12, v4);
    uint64_t v9 = v13;
    long long v12 = v17;
    sub_100033CD0((uint64_t)&v19);
    sub_10001A848((uint64_t)v18);
    State.wrappedValue.getter();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v12 = v11;
    sub_1000323A4(v9, (uint64_t)v20, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    long long v12 = v17;
    State.wrappedValue.setter();
    sub_100033CFC((uint64_t)&v19);
    return (_OWORD *)sub_100024A70((uint64_t)v18);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002A8E0(long long *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a2 + 72);
    while (1)
    {
      unint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      switch(v7 >> 62)
      {
        case 1uLL:
          long long v15 = *(_OWORD *)(v5 - 5);
          sub_100030374(a1, &v20);
          if (v21 >> 62 != 1) {
            goto LABEL_4;
          }
          v21 &= 0x3FFFFFFFFFFFFFFFuLL;
          if ((void)v15 != (void)v20) {
            goto LABEL_4;
          }
          return v4;
        case 2uLL:
          float64x2_t v13 = *(float64x2_t *)(v5 - 3);
          float64x2_t v16 = *(float64x2_t *)(v5 - 5);
          sub_100030374(a1, v22);
          int v8 = v23;
          if (v23 >> 62 == 2)
          {
            v23 &= 0x3FFFFFFFFFFFFFFFuLL;
            BOOL v9 = (v7 & 1) == 0;
            if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v22[0], v16), (int32x4_t)vceqq_f64(v22[1], v13))), 0xFuLL))) & 1) != 0&& v6 == v24)
            {
              goto LABEL_3;
            }
          }
          goto LABEL_4;
        case 3uLL:
          if (v7 != 0xC000000000000000
            || vorrq_s8((int8x16_t)vdupq_lane_s64(*(v5 - 24), 0), *(int8x16_t *)(v5 - 40)).i64[1] | *(v5 - 5) | *(v5 - 2) | v6)
          {
            sub_100030374(a1, &v28);
            if (v31 >> 62 == 3
              && !v32
              && v31 == 0xC000000000000000
              && (void)v28 == 1
              && !(v29 | v30 | *((void *)&v28 + 1)))
            {
              return v4;
            }
          }
          else
          {
            sub_100030374(a1, v25);
            if (v26 >> 62 == 3 && v26 == 0xC000000000000000)
            {
              int8x16_t v10 = vorrq_s8(v25[0], v25[1]);
              if (!(*(void *)&vorr_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)) | v27)) {
                return v4;
              }
            }
          }
LABEL_4:
          ++v4;
          v5 += 6;
          if (v2 == v4) {
            return 0;
          }
          break;
        default:
          float64x2_t v12 = *(float64x2_t *)(v5 - 3);
          float64x2_t v14 = *(float64x2_t *)(v5 - 5);
          sub_100030374(a1, v17);
          int v8 = v18;
          if (v18 >> 62) {
            goto LABEL_4;
          }
          BOOL v9 = (v7 & 1) == 0;
          if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v17[0], v14), (int32x4_t)vceqq_f64(v17[1], v12))), 0xFuLL))) & 1) == 0|| v6 != v19)
          {
            goto LABEL_4;
          }
LABEL_3:
          if (((v9 ^ v8) & 1) == 0) {
            goto LABEL_4;
          }
          return v4;
      }
    }
  }
  return 0;
}

void sub_10002AB78(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000816C(&qword_100072C98);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  float64x2_t v13 = (char *)&v29 - v12;
  if ([a1 state] == (id)1)
  {
    uint64_t v14 = OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView;
    [a1 locationInView:*(void *)(v2 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView)];
    long long v15 = *(void **)(v2 + v14);
    if (v15)
    {
      id v16 = [v15 indexPathForItemAtPoint:];
      if (v16)
      {
        long long v17 = v16;
        static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v18(v6, v11, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
        {
          v18(v13, v6, v7);
          uint64_t v19 = *(void **)(v2 + v14);
          if (v19)
          {
            id v20 = v19;
            Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
            id v22 = [v20 cellForItemAtIndexPath:isa];

            if (v22)
            {
              type metadata accessor for FavoriteColorWellCell();
              uint64_t v23 = swift_dynamicCastClass();
              if (v23)
              {
                uint64_t v24 = *(void **)(v2
                               + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
                if (v24)
                {
                  long long v25 = (void *)v23;
                  id v26 = v24;
                  dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();

                  if (v30 >> 1 == 0xFFFFFFFF || v30 >> 62 != 2)
                  {
                    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);

                    return;
                  }
                  sub_100009AD0(0, &qword_100072D20);
                  [v25 center];
                  uint64_t v27 = (void *)UIEditMenuConfiguration.init(identifier:sourcePoint:)();
                  id v28 = sub_10003B2C0();
                  [v28 presentEditMenuWithConfiguration:v27];

                  goto LABEL_16;
                }
LABEL_20:
                __break(1u);
                return;
              }
            }
LABEL_16:
            (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
            return;
          }
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
      }
      sub_10000C8F8((uint64_t)v6, &qword_100072C98);
      return;
    }
    __break(1u);
    goto LABEL_19;
  }
}

id sub_10002AFB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoriteColorPickerView.Coordinator();
  return [super dealloc];
}

uint64_t type metadata accessor for FavoriteColorPickerView.Coordinator()
{
  return self;
}

uint64_t sub_10002B0CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000816C(&qword_100072C68);
  uint64_t v53 = *(void *)(v2 - 8);
  uint64_t v54 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (void *)sub_10002B91C();
  id v6 = [objc_allocWithZone((Class)UICollectionView) initWithFrame:v5 collectionViewLayout:0.0, 0.0, 0.0, 0.0];

  sub_10000816C(&qword_100072C70);
  UIViewRepresentableContext.coordinator.getter();
  uint64_t v7 = (void *)v55;
  [v6 setDelegate:(void)v55];

  uint64_t v8 = self;
  id v9 = v6;
  id v10 = [v8 clearColor];
  [v9 setBackgroundColor:v10];

  [v9 setAllowsMultipleSelection:1];
  [v9 setAllowsSelection:1];
  [v9 setAlwaysBounceVertical:0];
  [v9 setPrefetchingEnabled:0];
  type metadata accessor for AddColorCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v12 = String._bridgeToObjectiveC()();
  [v9 registerClass:ObjCClassFromMetadata forCellWithReuseIdentifier:v12];

  type metadata accessor for FavoriteColorWellCell();
  uint64_t v13 = swift_getObjCClassFromMetadata();
  NSString v14 = String._bridgeToObjectiveC()();
  [v9 registerClass:v13 forCellWithReuseIdentifier:v14];

  sub_100009AD0(0, (unint64_t *)&unk_100072CF0);
  uint64_t v15 = swift_getObjCClassFromMetadata();
  NSString v16 = String._bridgeToObjectiveC()();
  [v9 registerClass:v15 forCellWithReuseIdentifier:v16];

  type metadata accessor for RemoveColorCell();
  uint64_t v17 = swift_getObjCClassFromMetadata();
  NSString v18 = String._bridgeToObjectiveC()();
  [v9 registerClass:v17 forCellWithReuseIdentifier:v18];

  sub_100009AD0(0, (unint64_t *)&qword_100072F70);
  uint64_t v19 = swift_getObjCClassFromMetadata();
  id v20 = self;
  id v21 = v9;
  id v22 = [v20 bundleForClass:v19];
  NSString v23 = String._bridgeToObjectiveC()();
  NSString v24 = String._bridgeToObjectiveC()();
  id v25 = [v22 localizedStringForKey:v23 value:0 table:v24];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v21 setAccessibilityLabel:v26];

  UIViewRepresentableContext.coordinator.getter();
  id v27 = objc_allocWithZone((Class)UILongPressGestureRecognizer);
  id v28 = (void *)v55;
  id v29 = [v27 initWithTarget:(void)v55 action:"showDeleteCallout:"];

  [v21 addGestureRecognizer:v29];
  swift_allocObject();
  id v30 = v21;
  UIViewRepresentableContext.coordinator.getter();
  unint64_t v31 = (void *)v55;
  swift_unknownObjectWeakInit();

  id v32 = objc_allocWithZone((Class)sub_10000816C(&qword_100072D00));
  uint64_t v33 = UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
  if (*v1)
  {
    uint64_t v34 = (void *)v33;
    uint64_t v35 = swift_retain();
    sub_10002C544(v35, (uint64_t)v4);
    swift_release();
    dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
    UIViewRepresentableContext.coordinator.getter();
    uint64_t v52 = v4;
    uint64_t v36 = v58;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    char v37 = v57;
    long long v38 = v56;
    id v39 = &v36[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor];
    *(_OWORD *)id v39 = v55;
    *((_OWORD *)v39 + 1) = v38;
    v39[32] = v37;

    UIViewRepresentableContext.coordinator.getter();
    NSString v40 = (char *)v55;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    *(void *)&v40[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors] = v58;

    swift_bridgeObjectRelease();
    UIViewRepresentableContext.coordinator.getter();
    NSString v41 = (void *)v55;
    *(void *)(v55
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage) = v1[4];

    UIViewRepresentableContext.coordinator.getter();
    id v42 = (char *)v55;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    *(void *)&v42[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors] = v58;

    swift_bridgeObjectRelease();
    UIViewRepresentableContext.coordinator.getter();
    uint64_t v43 = (void *)v55;
    uint64_t v44 = *(void **)(v55 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
    *(void *)(v55 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource) = v34;
    id v45 = v34;

    UIViewRepresentableContext.coordinator.getter();
    double v46 = (void *)v55;
    uint64_t v47 = *(void **)(v55 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView);
    *(void *)(v55 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView) = v30;
    id v48 = v30;

    UIViewRepresentableContext.coordinator.getter();
    uint64_t v49 = (unsigned char *)v55;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();

    swift_release();
    swift_release();
    swift_release();
    LOBYTE(v46) = (_BYTE)v58;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
    v49[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout] = (_BYTE)v46;

    return (uint64_t)v48;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033A5C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10002B91C()
{
  if (*v0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v1 = self;
    id v2 = [v1 currentDevice];
    id v3 = [v2 userInterfaceIdiom];

    double v4 = 30.0;
    if (LOBYTE(aBlock[0])) {
      double v4 = 28.0;
    }
    if (v3 == (id)6) {
      double v5 = 42.0;
    }
    else {
      double v5 = v4;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    id v6 = [v1 currentDevice];
    id v7 = [v6 userInterfaceIdiom];

    double v8 = 18.0;
    if (LOBYTE(aBlock[0])) {
      double v9 = 16.0;
    }
    else {
      double v9 = 18.0;
    }
    if (v7 == (id)6) {
      double v10 = 20.0;
    }
    else {
      double v10 = v9;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (LOBYTE(aBlock[0])) {
      double v8 = 16.0;
    }
    uint64_t v11 = self;
    id v12 = [v11 absoluteDimension:v5];
    id v13 = [v11 absoluteDimension:v5];
    NSString v14 = self;
    id v15 = [v14 sizeWithWidthDimension:v12 heightDimension:v13];

    id v16 = [self itemWithLayoutSize:v15];
    uint64_t v17 = self;
    id v18 = [v11 fractionalWidthDimension:1.0];
    id v19 = [v11 absoluteDimension:v5];
    id v20 = [v14 sizeWithWidthDimension:v18 heightDimension:v19];

    sub_10000816C(&qword_100071360);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100052460;
    *(void *)(v21 + 32) = v16;
    specialized Array._endMutation()();
    sub_100009AD0(0, &qword_100072CC8);
    id v47 = v16;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v23 = [v17 horizontalGroupWithLayoutSize:v20 subitems:isa];

    NSString v24 = self;
    id v25 = [v24 fixedSpacing:v10];
    [v23 setInterItemSpacing:v25];

    id v26 = [v11 fractionalWidthDimension:1.0];
    id v27 = [v11 fractionalHeightDimension:1.0];
    id v28 = [v14 sizeWithWidthDimension:v26 heightDimension:v27];

    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_100052460;
    *(void *)(v29 + 32) = v23;
    specialized Array._endMutation()();
    id v46 = v23;
    Class v30 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v31 = [v17 verticalGroupWithLayoutSize:v28 subitems:v30];

    id v32 = [v24 fixedSpacing:v8];
    [v31 setInterItemSpacing:v32];

    id v33 = [v11 fractionalWidthDimension:1.0];
    id v34 = [v11 fractionalHeightDimension:1.0];
    id v35 = [v14 sizeWithWidthDimension:v33 heightDimension:v34];

    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_100052460;
    *(void *)(v36 + 32) = v31;
    aBlock[0] = v36;
    specialized Array._endMutation()();
    id v37 = v31;
    Class v38 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v39 = [v17 horizontalGroupWithLayoutSize:v35 subitems:v38];

    id v40 = [self sectionWithGroup:v39];
    [v40 setInterGroupSpacing:v10];
    [v40 setOrthogonalScrollingBehavior:4];
    uint64_t v41 = swift_allocObject();
    long long v42 = *(_OWORD *)(v48 + 16);
    *(_OWORD *)(v41 + 16) = *(_OWORD *)v48;
    *(_OWORD *)(v41 + 32) = v42;
    *(_OWORD *)(v41 + 48) = *(_OWORD *)(v48 + 32);
    *(void *)(v41 + 64) = *(void *)(v48 + 48);
    aBlock[4] = sub_100033AAC;
    aBlock[5] = v41;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002F034;
    aBlock[3] = &unk_100067B38;
    uint64_t v43 = _Block_copy(aBlock);
    sub_100033588(v48);
    swift_release();
    [v40 setVisibleItemsInvalidationHandler:v43];
    _Block_release(v43);
    id v44 = [objc_allocWithZone((Class)UICollectionViewCompositionalLayout) initWithSection:v40];

    return (uint64_t)v44;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033A5C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

char *sub_10002C0D8(void *a1, uint64_t a2, long long *a3)
{
  sub_100030374(a3, v32);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0;
  }
  double v5 = (void *)Strong;
  sub_100030374(v32, &v37);
  char v6 = v40;
  switch(v40 >> 62)
  {
    case 1uLL:
      v40 &= 0x3FFFFFFFFFFFFFFFuLL;
      NSString v25 = String._bridgeToObjectiveC()();
      Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
      id v27 = [a1 dequeueReusableCellWithReuseIdentifier:v25 forIndexPath:isa];

      id v28 = self;
      double v10 = (char *)v27;
      id v14 = [v28 clearColor];
      [v10 setBackgroundColor:v14];

      goto LABEL_8;
    case 2uLL:
      v40 &= 0x3FFFFFFFFFFFFFFFuLL;
      uint64_t v33 = v37;
      long long v34 = v38;
      uint64_t v35 = v39;
      char v36 = v6 & 1;
      NSString v15 = String._bridgeToObjectiveC()();
      Class v16 = IndexPath._bridgeToObjectiveC()().super.isa;
      id v17 = [a1 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v16];

      type metadata accessor for FavoriteColorWellCell();
      double v10 = (char *)swift_dynamicCastClassUnconditional();
      sub_10001C400();
      uint64_t v18 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color;
      id v19 = *(void **)&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color];
      *(void *)&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color] = v20;
      id v21 = v20;

      [*(id *)&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView] setBackgroundColor:*(void *)&v10[v18]];
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = v5;
      sub_100030374(v32, (_OWORD *)(v22 + 24));
      id v23 = (uint64_t (**)())&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
      uint64_t v24 = *(void *)&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
      *id v23 = sub_100033C40;
      v23[1] = (uint64_t (*)())v22;
      sub_100010188(v24);
      break;
    case 3uLL:
      NSString v29 = String._bridgeToObjectiveC()();
      Class v30 = IndexPath._bridgeToObjectiveC()().super.isa;
      double v10 = (char *)[a1 dequeueReusableCellWithReuseIdentifier:v29 forIndexPath:v30];

      break;
    default:
      v40 &= 0x3FFFFFFFFFFFFFFFuLL;
      uint64_t v33 = v37;
      long long v34 = v38;
      uint64_t v35 = v39;
      char v36 = v6 & 1;
      NSString v7 = String._bridgeToObjectiveC()();
      Class v8 = IndexPath._bridgeToObjectiveC()().super.isa;
      id v9 = [a1 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v8];

      type metadata accessor for FavoriteColorWellCell();
      double v10 = (char *)swift_dynamicCastClassUnconditional();
      sub_10001C400();
      uint64_t v11 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color;
      id v12 = *(void **)&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color];
      *(void *)&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color] = v13;
      id v14 = v13;

      [*(id *)&v10[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView] setBackgroundColor:*(void *)&v10[v11]];
LABEL_8:

      break;
  }
  return v10;
}

uint64_t sub_10002C544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = v2;
  uint64_t v6 = sub_10000816C(&qword_100072C68);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = sub_100033270((uint64_t)_swiftEmptyArrayStorage);
  sub_100033B74();
  NSDiffableDataSourceSnapshot.init()();
  NSDiffableDataSourceSnapshot.appendSections(_:)((Swift::OpaquePointer)&off_1000664C0);
  uint64_t v11 = *v3;
  if (!*v3) {
    goto LABEL_54;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v67[0])
  {
    *(void *)&v67[0] = 0;
    BYTE8(v67[0]) = 1;
    NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v57 = v7;
  id v58 = v9;
  uint64_t v56 = v11;
  if (!*(void *)&v67[0]) {
    goto LABEL_16;
  }
  if (!*(void *)(*(void *)&v67[0] + 16))
  {
    swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v53 = 0;
    goto LABEL_18;
  }
  *(void *)&long long v62 = a1;
  id v12 = sub_10002F0E8(*(uint64_t *)&v67[0]);
  uint64_t v53 = 0;
  swift_bridgeObjectRelease();
  *(void *)&v67[0] = 0;
  BYTE8(v67[0]) = 1;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
  uint64_t v13 = v12[2];
  swift_bridgeObjectRelease();
  uint64_t v14 = v3[4];
  if (!v14)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v15 = v14 - v13 % v14;
  if (__OFSUB__(v14, v13 % v14))
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v15 < 0)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    type metadata accessor for ColorPickerState();
    sub_100033A5C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  uint64_t v16 = v6;
  if (v15)
  {
    id v17 = sub_10003141C(0, 1, 1, (char *)_swiftEmptyArrayStorage);
    uint64_t v18 = 0;
    uint64_t v19 = *((void *)v17 + 2);
    uint64_t v20 = 48 * v19;
    long long v21 = xmmword_100052470;
    do
    {
      unint64_t v22 = *((void *)v17 + 3);
      if (v19 + v18 >= v22 >> 1)
      {
        long long v61 = v21;
        uint64_t v24 = sub_10003141C((char *)(v22 > 1), v19 + v18 + 1, 1, v17);
        long long v21 = v61;
        id v17 = v24;
      }
      *((void *)v17 + 2) = v19 + v18 + 1;
      id v23 = &v17[v20];
      *((void *)v23 + 4) = v18;
      *((void *)v23 + 5) = 0;
      *((void *)v23 + 6) = 0;
      *((void *)v23 + 7) = 0;
      *((_OWORD *)v23 + 4) = v21;
      v20 += 48;
      ++v18;
    }
    while (v15 != v18);
  }
  *(void *)&v67[0] = 0;
  BYTE8(v67[0]) = 1;
  uint64_t v6 = v16;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
  swift_bridgeObjectRelease();
LABEL_18:
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v25 = *(void *)&v67[0];
  uint64_t v60 = *(void *)(*(void *)&v67[0] + 16);
  if (v60)
  {
    uint64_t v54 = v6;
    uint64_t v55 = a2;
    unint64_t v26 = 0;
    long long v66 = *(_OWORD *)(v3 + 5);
    id v27 = (char *)_swiftEmptyArrayStorage;
    uint64_t v59 = *(void *)&v67[0] + 32;
    while (v26 < *(void *)(v25 + 16))
    {
      uint64_t v28 = v59 + 40 * v26;
      v67[0] = *(_OWORD *)v28;
      v67[1] = *(_OWORD *)(v28 + 16);
      uint64_t v29 = *(unsigned __int8 *)(v28 + 32);
      char v68 = *(unsigned char *)(v28 + 32);
      long long v30 = *(_OWORD *)v28;
      long long v61 = *(_OWORD *)(v28 + 16);
      long long v62 = v30;
      if (*(void *)(v10 + 16) && (unint64_t v31 = sub_100030E4C((uint64_t)v67), (v32 & 1) != 0))
      {
        uint64_t v33 = *(void *)(*(void *)(v10 + 56) + 8 * v31);
        uint64_t v34 = v33 + 1;
        if (__OFADD__(v33, 1)) {
          goto LABEL_50;
        }
      }
      else
      {
        uint64_t v34 = 0;
        if (__OFADD__(-1, 1)) {
          goto LABEL_50;
        }
      }
      ++v26;
      while (1)
      {
        long long v63 = v66;
        sub_10000816C(&qword_100072CE0);
        State.wrappedValue.getter();
        uint64_t v36 = v65;
        if (!*(void *)(v65 + 16)) {
          break;
        }
        unint64_t v37 = sub_100030E4C((uint64_t)v67);
        if ((v38 & 1) == 0) {
          break;
        }
        uint64_t v39 = *(void *)(*(void *)(v36 + 56) + 8 * v37);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (!*(void *)(v39 + 16)) {
          break;
        }
        uint64_t v40 = static Hasher._hash(seed:_:)();
        uint64_t v41 = -1 << *(unsigned char *)(v39 + 32);
        unint64_t v42 = v40 & ~v41;
        if (((*(void *)(v39 + 56 + ((v42 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v42) & 1) == 0) {
          break;
        }
        uint64_t v43 = *(void *)(v39 + 48);
        if (*(void *)(v43 + 8 * v42) != v34)
        {
          uint64_t v44 = ~v41;
          do
          {
            unint64_t v42 = (v42 + 1) & v44;
            if (((*(void *)(v39 + 56 + ((v42 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v42) & 1) == 0) {
              goto LABEL_38;
            }
          }
          while (*(void *)(v43 + 8 * v42) != v34);
        }
        swift_bridgeObjectRelease();
        if (__OFADD__(v34++, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
      }
LABEL_38:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v27 = sub_10003141C(0, *((void *)v27 + 2) + 1, 1, v27);
      }
      unint64_t v46 = *((void *)v27 + 2);
      unint64_t v45 = *((void *)v27 + 3);
      if (v46 >= v45 >> 1) {
        id v27 = sub_10003141C((char *)(v45 > 1), v46 + 1, 1, v27);
      }
      *((void *)v27 + 2) = v46 + 1;
      id v47 = &v27[48 * v46];
      long long v48 = v61;
      *((_OWORD *)v47 + 2) = v62;
      *((_OWORD *)v47 + 3) = v48;
      *((void *)v47 + 8) = v29 | 0x8000000000000000;
      *((void *)v47 + 9) = v34;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v63 = v10;
      sub_1000324F0(v34, (uint64_t)v67, isUniquelyReferenced_nonNull_native);
      unint64_t v10 = v63;
      swift_bridgeObjectRelease();
      if (v26 == v60)
      {
        swift_bridgeObjectRelease();
        a2 = v55;
        uint64_t v6 = v54;
        goto LABEL_45;
      }
    }
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  swift_bridgeObjectRelease();
LABEL_45:
  *(void *)&long long v63 = 0;
  BYTE8(v63) = 1;
  char v50 = v58;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v51 = v57;
  if (v64 != 2)
  {
    *(void *)&long long v63 = 0;
    BYTE8(v63) = 1;
    NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(a2, v50, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002CCC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v95 = *(void *)(v5 - 8);
  uint64_t v96 = v5;
  __chkstk_darwin(v5);
  long long v93 = &v80[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v94 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v91 = &v80[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v85 = type metadata accessor for IndexPath();
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v83 = &v80[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_10000816C(&qword_100072C68);
  uint64_t v86 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v88 = &v80[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_10000816C(&qword_100072C70);
  uint64_t v103 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v90 = &v80[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v101 = &v80[-v16];
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v98 = &v80[-v18];
  uint64_t v19 = __chkstk_darwin(v17);
  char v97 = &v80[-v20];
  uint64_t v89 = v21;
  __chkstk_darwin(v19);
  id v23 = &v80[-v22];
  UIViewRepresentableContext.coordinator.getter();
  float64x2_t v102 = *(float64x2_t *)(v108
                        + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor
                        + 16);
  float64x2_t v99 = *(float64x2_t *)(v108
                       + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor);
  int v24 = *(unsigned __int8 *)(v108
                           + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor
                           + 32);

  unsigned __int8 v100 = v2;
  if (!*v2) {
    goto LABEL_38;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  BOOL v25 = v106 == 2 && v24 == 2;
  if (v24 != 2 && v106 != 2) {
    BOOL v25 = (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v99, aBlock), (int32x4_t)vceqq_f64(v102, v105))), 0xFuLL))) & 1) != 0&& ((v106 ^ v24) & 1) == 0;
  }
  uint64_t v87 = v10;
  *(void *)&v99.f64[0] = a1;
  uint64_t v92 = v7;
  uint64_t v26 = v103;
  *(void *)&float64_t v27 = v103 + 16;
  uint64_t v28 = *(void (**)(void))(v103 + 16);
  ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v23, a2, v12);
  v102.f64[0] = v27;
  if (!v25)
  {
    long long v30 = *(void (**)(unsigned char *, uint64_t))(v26 + 8);
    v30(v23, v12);
    uint64_t v34 = v97;
    ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v97, a2, v12);
    uint64_t v33 = v98;
    goto LABEL_14;
  }
  UIViewRepresentableContext.coordinator.getter();
  int v81 = *(unsigned __int8 *)(*(void *)&aBlock.f64[0]
                           + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_allowsNoColor);

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v29 = v108;
  long long v30 = *(void (**)(unsigned char *, uint64_t))(v26 + 8);
  v30(v23, v12);
  uint64_t v31 = a2;
  char v32 = v97;
  uint64_t v82 = v31;
  v28(v97);
  if (v81 != v29)
  {
    uint64_t v33 = v98;
    uint64_t v34 = v32;
    a2 = v82;
LABEL_14:
    v30(v34, v12);
    ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v33, a2, v12);
LABEL_15:
    uint64_t v35 = (uint64_t)v88;
    uint64_t v36 = v101;
    v30(v33, v12);
    ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v36, a2, v12);
    uint64_t v37 = (uint64_t)v100;
LABEL_16:
    v30(v36, v12);
    float64_t v38 = v99.f64[0];
    goto LABEL_17;
  }
  UIViewRepresentableContext.coordinator.getter();
  float64_t v70 = aBlock.f64[0];
  uint64_t v71 = *(void *)(*(void *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors);
  swift_bridgeObjectRetain();

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v81 = sub_100030CD4(v71, v108);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v30(v32, v12);
  uint64_t v33 = v98;
  a2 = v82;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v98, v82, v12);
  if ((v81 & 1) == 0) {
    goto LABEL_15;
  }
  UIViewRepresentableContext.coordinator.getter();
  v30(v33, v12);
  uint64_t v72 = *(void *)(*(void *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage);

  uint64_t v37 = (uint64_t)v100;
  uint64_t v73 = v100[4];
  ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v101, a2, v12);
  if (v72 != v73)
  {
    uint64_t v35 = (uint64_t)v88;
    uint64_t v36 = v101;
    goto LABEL_16;
  }
  uint64_t v98 = v28;
  uint64_t v74 = v101;
  UIViewRepresentableContext.coordinator.getter();
  float64_t v75 = aBlock.f64[0];
  uint64_t v76 = *(void *)(*(void *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors);
  swift_bridgeObjectRetain();

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v77 = v108;
  if (!v76)
  {
    v30(v74, v12);
    float64_t v38 = v99.f64[0];
    if (!v77)
    {
      uint64_t v28 = (void (*)(void))v98;
      goto LABEL_19;
    }
    goto LABEL_35;
  }
  uint64_t v78 = v76;
  float64_t v38 = v99.f64[0];
  if (!(void)v108)
  {
    v30(v101, v12);
LABEL_35:
    swift_bridgeObjectRelease();
    uint64_t v28 = (void (*)(void))v98;
    uint64_t v35 = (uint64_t)v88;
    goto LABEL_17;
  }
  char v79 = sub_100030CD4(v78, v108);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v101, v12);
  swift_bridgeObjectRelease_n();
  uint64_t v28 = (void (*)(void))v98;
  uint64_t v35 = (uint64_t)v88;
  if (v79) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v39 = swift_retain();
  sub_10002C544(v39, v35);
  swift_release();
  UIViewRepresentableContext.coordinator.getter();
  float64_t v40 = aBlock.f64[0];
  uint64_t v41 = *(void **)(*(void *)&aBlock.f64[0]
                 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
  id v42 = v41;

  if (v41)
  {
    UIViewRepresentableContext.coordinator.getter();

    dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
    UIViewRepresentableContext.coordinator.getter();
    uint64_t v43 = (char *)v108;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    char v44 = (char)v106;
    float64x2_t v45 = v105;
    unint64_t v46 = (float64x2_t *)&v43[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor];
    *unint64_t v46 = aBlock;
    v46[1] = v45;
    LOBYTE(v46[2].f64[0]) = v44;

    UIViewRepresentableContext.coordinator.getter();
    float64_t v47 = aBlock.f64[0];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    *(unsigned char *)(*(void *)&v47
             + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_allowsNoColor) = v108;

    UIViewRepresentableContext.coordinator.getter();
    float64_t v48 = aBlock.f64[0];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    *(void *)(*(void *)&v48
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors) = v108;

    swift_bridgeObjectRelease();
    UIViewRepresentableContext.coordinator.getter();
    float64_t v49 = aBlock.f64[0];
    *(void *)(*(void *)&aBlock.f64[0]
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage) = *(void *)(v37 + 32);

    UIViewRepresentableContext.coordinator.getter();
    float64_t v50 = aBlock.f64[0];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    *(void *)(*(void *)&v50
              + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors) = v108;

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v35, v87);
LABEL_19:
    UIViewRepresentableContext.coordinator.getter();
    int v51 = *(unsigned __int8 *)(*(void *)&aBlock.f64[0]
                             + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout);

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v51 != v108)
    {
      uint64_t v52 = (void *)sub_10002B91C();
      [*(id *)&v38 setCollectionViewLayout:v52];

      UIViewRepresentableContext.coordinator.getter();
      float64_t v53 = aBlock.f64[0];
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      *(unsigned char *)(*(void *)&v53
               + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout) = v108;
    }
    sub_10002DD3C(*(void **)&v38, a2);
    UIViewRepresentableContext.coordinator.getter();
    float64_t v54 = aBlock.f64[0];
    *(unsigned char *)(*(void *)&aBlock.f64[0]
             + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_isEditing) = 0;

    long long v108 = *(_OWORD *)(v37 + 16);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    sub_1000337F8((uint64_t)&v108);
    if (LOBYTE(aBlock.f64[1])) {
      goto LABEL_24;
    }
    if ((unsigned __int128)(*(uint64_t *)&aBlock.f64[0] * (__int128)*(uint64_t *)(v37 + 32)) >> 64 == (uint64_t)(*(void *)&aBlock.f64[0] * *(void *)(v37 + 32)) >> 63)
    {
      uint64_t v55 = v83;
      IndexPath.init(item:section:)();
      Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
      (*(void (**)(unsigned char *, uint64_t))(v84 + 8))(v55, v85);
      [*(id *)&v38 scrollToItemAtIndexPath:isa atScrollPosition:16 animated:0];

LABEL_24:
      sub_100009AD0(0, &qword_100072C78);
      uint64_t v57 = (void *)static OS_dispatch_queue.main.getter();
      id v58 = v90;
      ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v90, a2, v12);
      uint64_t v59 = v103;
      unint64_t v60 = (*(unsigned __int8 *)(v103 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
      unint64_t v61 = (v89 + v60 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v62 = swift_allocObject();
      (*(void (**)(unint64_t, unsigned char *, uint64_t))(v59 + 32))(v62 + v60, v58, v12);
      unint64_t v63 = v62 + v61;
      long long v64 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)unint64_t v63 = *(_OWORD *)v37;
      *(_OWORD *)(v63 + 16) = v64;
      *(_OWORD *)(v63 + 32) = *(_OWORD *)(v37 + 32);
      *(void *)(v63 + 48) = *(void *)(v37 + 48);
      uint64_t v106 = sub_1000338E8;
      uint64_t v107 = v62;
      *(void *)&aBlock.f64[0] = _NSConcreteStackBlock;
      *(void *)&aBlock.f64[1] = 1107296256;
      *(void *)&v105.f64[0] = sub_10002E8A0;
      *(void *)&v105.f64[1] = &unk_100067AE8;
      uint64_t v65 = _Block_copy(&aBlock);
      sub_100033588(v37);
      swift_release();
      long long v66 = v91;
      static DispatchQoS.unspecified.getter();
      *(void *)&aBlock.f64[0] = _swiftEmptyArrayStorage;
      sub_100033A5C(&qword_100072C80, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000816C(&qword_100072C88);
      sub_100033990();
      uint64_t v67 = v93;
      uint64_t v68 = v96;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v65);

      (*(void (**)(unsigned char *, uint64_t))(v95 + 8))(v67, v68);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v92 + 8))(v66, v94);
    }
    __break(1u);
  }
  __break(1u);
LABEL_38:
  type metadata accessor for ColorPickerState();
  sub_100033A5C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_10002DD3C(void *a1, uint64_t a2)
{
  id v81 = a1;
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v79 = (char *)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000816C(&qword_100072C98);
  uint64_t v73 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v80 = (char *)v71 - v11;
  uint64_t v12 = sub_10000816C(&qword_100072C68);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    char v16 = v87;
    uint64_t v82 = v10;
    if (v87 == 2)
    {
      uint64_t v17 = (char *)&off_100066588;
      id v18 = v81;
      goto LABEL_23;
    }
    uint64_t v19 = v13;
    double v20 = *(double *)&v83;
    double v21 = v84;
    double v22 = v85;
    double v23 = v86;
    sub_10000816C(&qword_100072C70);
    UIViewRepresentableContext.coordinator.getter();
    int v24 = v83;
    BOOL v25 = *(void **)&v83[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource];
    id v26 = v25;

    if (v25)
    {
      dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();

      uint64_t v27 = NSDiffableDataSourceSnapshot.itemIdentifiers.getter();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v12);
      uint64_t v78 = v27;
      uint64_t v28 = *(void *)(v27 + 16);
      if (v28)
      {
        int v29 = (double *)(v78 + 64);
        float64_t v75 = (char *)_swiftEmptyArrayStorage;
        id v18 = v81;
        uint64_t v74 = v5;
        do
        {
          if (((*(void *)v29 >> 62) | 2) == 2 && ((v16 & 1) == 0) != (*(void *)v29 & 1))
          {
            double v32 = *(v29 - 4);
            if (vabdd_f64(v20, v32) < 0.001)
            {
              double v33 = *(v29 - 3);
              if (vabdd_f64(v21, v33) < 0.001)
              {
                uint64_t v34 = a2;
                double v35 = *(v29 - 2);
                if (vabdd_f64(v22, v35) < 0.001)
                {
                  double v36 = *(v29 - 1);
                  if (vabdd_f64(v23, v36) < 0.001)
                  {
                    long long v77 = *(_OWORD *)v29;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      float64_t v75 = sub_10003141C(0, *((void *)v75 + 2) + 1, 1, v75);
                    }
                    unint64_t v38 = *((void *)v75 + 2);
                    unint64_t v37 = *((void *)v75 + 3);
                    unint64_t v39 = v38 + 1;
                    long long v40 = v77;
                    if (v38 >= v37 >> 1)
                    {
                      unint64_t v76 = v38 + 1;
                      uint64_t v41 = sub_10003141C((char *)(v37 > 1), v38 + 1, 1, v75);
                      unint64_t v39 = v76;
                      long long v40 = v77;
                      float64_t v75 = v41;
                    }
                    long long v30 = v75;
                    *((void *)v75 + 2) = v39;
                    uint64_t v31 = &v30[48 * v38];
                    *((double *)v31 + 4) = v32;
                    *((double *)v31 + 5) = v33;
                    *((double *)v31 + 6) = v35;
                    *((double *)v31 + 7) = v36;
                    *((_OWORD *)v31 + 4) = v40;
                    id v18 = v81;
                  }
                  uint64_t v5 = v74;
                }
                a2 = v34;
              }
            }
          }
          v29 += 6;
          --v28;
        }
        while (v28);
      }
      else
      {
        float64_t v75 = (char *)_swiftEmptyArrayStorage;
        id v18 = v81;
      }
      swift_bridgeObjectRelease();
      uint64_t v17 = v75;
LABEL_23:
      id v42 = [v18 indexPathsForSelectedItems];
      if (v42)
      {
        uint64_t v43 = v42;
        char v44 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
      }
      else
      {
        char v44 = _swiftEmptyArrayStorage;
      }
      __chkstk_darwin(v42);
      v71[-2] = a2;
      swift_bridgeObjectRetain();
      float64x2_t v45 = sub_100029F84((uint64_t)sub_100033A3C, (uint64_t)&v71[-4], (uint64_t)v17);
      swift_bridgeObjectRelease();
      unint64_t v46 = sub_10002E994((uint64_t)v44);
      char v47 = sub_1000308C0((uint64_t)v46, (uint64_t)v45);
      swift_bridgeObjectRelease();
      if ((v47 & 1) == 0)
      {
        uint64_t v72 = v45;
        float64_t v75 = v17;
        uint64_t v48 = v44[2];
        uint64_t v74 = v5;
        v71[2] = v44;
        if (v48)
        {
          uint64_t v50 = *(void *)(v5 + 16);
          uint64_t v49 = v5 + 16;
          *(void *)&long long v77 = v50;
          int v51 = (char *)v44
              + ((*(unsigned __int8 *)(v49 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 64));
          unint64_t v76 = *(void *)(v49 + 56);
          uint64_t v52 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 40);
          float64_t v53 = (unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 32);
          float64_t v54 = (void (**)(char *, char *, uint64_t))(v49 + 16);
          uint64_t v78 = v49;
          uint64_t v55 = (void (**)(char *, uint64_t))(v49 - 8);
          swift_bridgeObjectRetain();
          v71[1] = (v49 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
          uint64_t v56 = v80;
          while (1)
          {
            ((void (*)(char *, char *, uint64_t))v77)(v56, v51, v4);
            uint64_t v57 = *v52;
            (*v52)(v56, 0, 1, v4);
            if ((*v53)(v56, 1, v4) == 1) {
              break;
            }
            uint64_t v58 = v4;
            uint64_t v59 = v79;
            (*v54)(v79, v56, v58);
            Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
            [v81 deselectItemAtIndexPath:isa animated:0];

            uint64_t v56 = v80;
            unint64_t v61 = v59;
            uint64_t v4 = v58;
            (*v55)(v61, v58);
            v51 += v76;
            if (!--v48) {
              goto LABEL_33;
            }
          }
        }
        else
        {
          uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
          swift_bridgeObjectRetain();
          uint64_t v56 = v80;
LABEL_33:
          v57(v56, 1, 1, v4);
        }
        swift_bridgeObjectRelease_n();
        uint64_t v62 = v72[2];
        if (!v62) {
          goto LABEL_41;
        }
        uint64_t v63 = (uint64_t)v72
            + ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80));
        uint64_t v64 = *(void *)(v73 + 72);
        uint64_t v65 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48);
        long long v66 = (void (**)(uint64_t, uint64_t))(v74 + 8);
        swift_bridgeObjectRetain();
        id v68 = v81;
        uint64_t v67 = (uint64_t)v82;
        do
        {
          sub_10000C800(v63, v67, &qword_100072C98);
          if ((*v65)(v67, 1, v4) == 1)
          {
            v69.super.Class isa = 0;
          }
          else
          {
            v69.super.Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
            (*v66)(v67, v4);
          }
          [v68 selectItemAtIndexPath:v69.super.isa animated:0 scrollPosition:0];

          v63 += v64;
          --v62;
        }
        while (v62);
      }
      swift_bridgeObjectRelease();
LABEL_41:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_100033A5C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

void sub_10002E5C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10000816C(&qword_100072C68);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000816C(&qword_100072C70);
  UIViewRepresentableContext.coordinator.getter();
  uint64_t v7 = (void *)v16;
  uint64_t v8 = *(void **)(v16 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
  id v9 = v8;

  if (!v8) {
    goto LABEL_13;
  }
  dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();

  uint64_t v10 = NSDiffableDataSourceSnapshot.itemIdentifiers.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v11 = *(void *)(v10 + 16);
  swift_bridgeObjectRelease();
  double v12 = ceil((double)v11 / (double)*(uint64_t *)(a2 + 32));
  if ((~*(void *)&v12 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v13 = (uint64_t)v12;
  long long v16 = *(_OWORD *)(a2 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000337F8((uint64_t)&v16);
  if (v14 != v13)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v14 = v13;
    swift_retain();
    static Published.subscript.setter();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000337F8((uint64_t)&v16);
  if ((v15 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v14 = 0;
    char v15 = 1;
    swift_retain();
    static Published.subscript.setter();
  }
}

uint64_t sub_10002E8A0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10002E8E4()
{
  sub_10000816C(&qword_100072C70);
  UIViewRepresentableContext.coordinator.getter();
  unint64_t v0 = *(void **)&v2[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource];
  id v1 = v0;

  if (v0)
  {
    dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
  }
  else
  {
    __break(1u);
  }
}

void *sub_10002E994(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IndexPath();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000816C(&qword_100072C98);
  uint64_t v6 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = _swiftEmptyArrayStorage;
  if (v9)
  {
    double v20 = _swiftEmptyArrayStorage;
    sub_1000315B4(0, v9, 0);
    double v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v17 = *(void *)(v11 + 56);
    id v18 = v12;
    do
    {
      v18(v5, v13, v2);
      swift_dynamicCast();
      uint64_t v10 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000315B4(0, v10[2] + 1, 1);
        uint64_t v10 = v20;
      }
      unint64_t v15 = v10[2];
      unint64_t v14 = v10[3];
      if (v15 >= v14 >> 1)
      {
        sub_1000315B4(v14 > 1, v15 + 1, 1);
        uint64_t v10 = v20;
      }
      void v10[2] = v15 + 1;
      sub_10000C590((uint64_t)v8, (uint64_t)v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v15, &qword_100072C98);
      v13 += v17;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_10002EBF0(double a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(objc_msgSend(a3, "container"), "contentSize");
  double v16 = v15;
  uint64_t result = swift_unknownObjectRelease();
  double v18 = a1 / v16;
  if ((~COERCE__INT64(a1 / v16) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v18 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v18 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v24 = v11;
  uint64_t v25 = v8;
  uint64_t v19 = (uint64_t)v18;
  long long v27 = *(_OWORD *)(a4 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t result = sub_1000337F8((uint64_t)&v27);
  if (aBlock[0] != v19)
  {
    sub_100009AD0(0, &qword_100072C78);
    double v20 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v21 = swift_allocObject();
    long long v22 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)(v21 + 16) = *(_OWORD *)a4;
    *(_OWORD *)(v21 + 32) = v22;
    *(_OWORD *)(v21 + 48) = *(_OWORD *)(a4 + 32);
    *(void *)(v21 + 64) = *(void *)(a4 + 48);
    *(void *)(v21 + 72) = v19;
    aBlock[4] = sub_100033B68;
    aBlock[5] = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002E8A0;
    aBlock[3] = &unk_100067B88;
    double v23 = _Block_copy(aBlock);
    sub_100033588(a4);
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100033A5C(&qword_100072C80, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000816C(&qword_100072C88);
    sub_100033990();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v24);
  }
  return result;
}

uint64_t sub_10002EFC0()
{
  return static Published.subscript.setter();
}

uint64_t sub_10002F034(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, double, double))(a1 + 32);
  sub_10000816C(&qword_100072CD0);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  swift_unknownObjectRetain();
  v8(v9, a5, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void *sub_10002F0E8(uint64_t a1)
{
  sub_100031594(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = _swiftEmptyArrayStorage[2];
    uint64_t v5 = 48 * v4 + 72;
    uint64_t v6 = (unsigned __int8 *)(a1 + 64);
    do
    {
      long long v7 = *((_OWORD *)v6 - 2);
      long long v8 = *((_OWORD *)v6 - 1);
      uint64_t v9 = *v6;
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      if (v4 + v3 >= v10 >> 1)
      {
        long long v13 = *((_OWORD *)v6 - 1);
        long long v14 = *((_OWORD *)v6 - 2);
        sub_100031594((char *)(v10 > 1), v4 + v3 + 1, 1);
        long long v8 = v13;
        long long v7 = v14;
      }
      _swiftEmptyArrayStorage[2] = v4 + v3 + 1;
      uint64_t v11 = (void *)((char *)_swiftEmptyArrayStorage + v5);
      *(v11 - 1) = v9;
      *uint64_t v11 = v3;
      *(_OWORD *)(v11 - 5) = v7;
      *(_OWORD *)(v11 - 3) = v8;
      v5 += 48;
      v6 += 40;
      ++v3;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10002F200()
{
  sub_100030374(v0, v4);
  uint64_t result = 0x692072656C6C6946;
  switch(v5 >> 62)
  {
    case 1uLL:
      return result;
    case 2uLL:
      v5 &= 0x3FFFFFFFFFFFFFFFuLL;
      goto LABEL_4;
    case 3uLL:
      int8x16_t v3 = vorrq_s8(v4[0], v4[1]);
      if (((v5 == 0xC000000000000000) & ((*(void *)&vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) | v6) == 0)) != 0)uint64_t result = 0x6F74747542646441; {
      else
      }
        uint64_t result = 0x754265766F6D6552;
      break;
    default:
      v5 &= 0x3FFFFFFFFFFFFFFFuLL;
      _StringGuts.grow(_:)(17);
      v2._uint64_t countAndFlagsBits = 0x6574736567677553;
      v2._object = (void *)0xEF20726F6C6F4364;
      String.append(_:)(v2);
LABEL_4:
      _print_unlocked<A, B>(_:_:)();
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_10002F3B0()
{
  sub_100030374(v0, &v14);
  Swift::UInt64 v1 = v14;
  char v2 = v17;
  Swift::UInt v3 = v18;
  switch(v17 >> 62)
  {
    case 1uLL:
      v17 &= 0x3FFFFFFFFFFFFFFFuLL;
      Swift::UInt v7 = 1;
      Swift::UInt v3 = v14;
      goto LABEL_24;
    case 2uLL:
      v17 &= 0x3FFFFFFFFFFFFFFFuLL;
      Swift::UInt64 v4 = *((void *)&v14 + 1);
      Swift::UInt64 v5 = v15;
      Swift::UInt64 v6 = v16;
      Swift::UInt v7 = v2 & 1;
      Swift::UInt v8 = 2;
      goto LABEL_4;
    case 3uLL:
      if (v16 | v15 | *((void *)&v14 + 1) | (unint64_t)v14 | v18) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = v17 == 0xC000000000000000;
      }
      if (v13) {
        Swift::UInt v3 = 3;
      }
      else {
        Swift::UInt v3 = 4;
      }
      goto LABEL_25;
    default:
      v17 &= 0x3FFFFFFFFFFFFFFFuLL;
      Swift::UInt64 v4 = *((void *)&v14 + 1);
      Swift::UInt64 v5 = v15;
      Swift::UInt64 v6 = v16;
      Swift::UInt v7 = v2 & 1;
      Swift::UInt v8 = 0;
LABEL_4:
      Hasher._combine(_:)(v8);
      if ((v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v9 = v1;
      }
      else {
        Swift::UInt64 v9 = 0;
      }
      Hasher._combine(_:)(v9);
      if ((v4 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v10 = v4;
      }
      else {
        Swift::UInt64 v10 = 0;
      }
      Hasher._combine(_:)(v10);
      if ((v5 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v11 = v5;
      }
      else {
        Swift::UInt64 v11 = 0;
      }
      Hasher._combine(_:)(v11);
      if ((v6 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v12 = v6;
      }
      else {
        Swift::UInt64 v12 = 0;
      }
      Hasher._combine(_:)(v12);
LABEL_24:
      Hasher._combine(_:)(v7);
LABEL_25:
      Hasher._combine(_:)(v3);
      return;
  }
}

uint64_t sub_10002F4F8()
{
  return sub_10002F698();
}

Swift::Int sub_10002F50C()
{
  sub_100030374(v0, v2);
  Hasher.init(_seed:)();
  sub_10002F3B0();
  return Hasher._finalize()();
}

void sub_10002F55C()
{
  sub_100030374(v0, v1);
  sub_10002F3B0();
}

Swift::Int sub_10002F59C()
{
  sub_100030374(v0, v2);
  Hasher.init(_seed:)();
  sub_10002F3B0();
  return Hasher._finalize()();
}

uint64_t sub_10002F5F0()
{
  sub_100030374(v0, v2);
  return sub_10002F200();
}

BOOL sub_10002F628(long long *a1, long long *a2)
{
  sub_100030374(a1, v4);
  sub_100030374(a2, v5);
  return sub_100033374(v4, v5);
}

void sub_10002F674()
{
  qword_1000776B0 = 0x4049000000000000;
}

uint64_t sub_10002F684()
{
  return sub_10002F698();
}

uint64_t sub_10002F698()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10002F704()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10002F77C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__numberOfPages;
  uint64_t v2 = sub_10000816C(&qword_100072D10);
  Swift::UInt v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__currentPage, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__pageControlPendingPage;
  uint64_t v5 = sub_10000816C(&qword_100072D18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v6, v7);
}

uint64_t sub_10002F898()
{
  return type metadata accessor for FavoriteColorPickerView.Model();
}

uint64_t type metadata accessor for FavoriteColorPickerView.Model()
{
  uint64_t result = qword_100072B10;
  if (!qword_100072B10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002F8EC()
{
  sub_10002F9B8();
  if (v0 <= 0x3F)
  {
    sub_10002FA10();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10002F9B8()
{
  if (!qword_100072B20)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100072B20);
    }
  }
}

void sub_10002FA10()
{
  if (!qword_100072B28)
  {
    sub_10000CA7C((uint64_t *)&unk_100072B30);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100072B28);
    }
  }
}

__n128 initializeWithCopy for FavoriteColorPickerView.ColorItem(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for FavoriteColorPickerView.ColorItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 32) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for FavoriteColorPickerView.ColorItem(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 40) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 48) = 1;
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
      double result = 0.0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 32) = 2 * -a2;
      *(void *)(a1 + 40) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_10002FB28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) >> 62;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_10002FB44(uint64_t result)
{
  *(void *)(result + 32) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_10002FB54(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[4] = result[4] & 1 | (a2 << 62);
  }
  else
  {
    *double result = (a2 - 3);
    result[1] = 0;
    result[2] = 0;
    result[3] = 0;
    *((_OWORD *)result + 2) = xmmword_100052480;
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoriteColorPickerView.ColorItem()
{
  return &type metadata for FavoriteColorPickerView.ColorItem;
}

uint64_t destroy for FavoriteColorPickerView()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for FavoriteColorPickerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for FavoriteColorPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FavoriteColorPickerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FavoriteColorPickerView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FavoriteColorPickerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoriteColorPickerView()
{
  return &type metadata for FavoriteColorPickerView;
}

uint64_t sub_10002FE08()
{
  uint64_t v1 = sub_10000816C(&qword_100072D18);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000816C(&qword_100072D10);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::UInt v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__numberOfPages;
  uint64_t v14 = 2;
  Published.init(initialValue:)();
  Swift::UInt64 v10 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v10(v9, v8, v5);
  uint64_t v11 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__currentPage;
  uint64_t v14 = 0;
  Published.init(initialValue:)();
  v10(v11, v8, v5);
  uint64_t v12 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView5Model__pageControlPendingPage;
  uint64_t v14 = 0;
  char v15 = 1;
  sub_10000816C((uint64_t *)&unk_100072B30);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v12, v4, v1);
  return v0;
}

uint64_t sub_100030018@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FavoriteColorPickerView.Model();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100030058()
{
  return sub_10002B0CC();
}

uint64_t sub_10003009C(uint64_t a1, uint64_t a2)
{
  return sub_10002CCC8(a1, a2);
}

uint64_t sub_1000300E0@<X0>(void *a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v7[0] = *(_OWORD *)v1;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 48);
  if (*(void *)&v7[0])
  {
    id v4 = objc_allocWithZone((Class)type metadata accessor for FavoriteColorPickerView.Coordinator());
    sub_100033588((uint64_t)v7);
    swift_retain();
    id v5 = sub_1000335DC((uint64_t)v7);
    swift_release();
    uint64_t result = sub_100033770((uint64_t)v7);
    *a1 = v5;
  }
  else
  {
    sub_100033588((uint64_t)v7);
    type metadata accessor for ColorPickerState();
    sub_100033A5C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000301D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100033C7C();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100030238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100033C7C();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10003029C()
{
}

unint64_t sub_1000302C8()
{
  unint64_t result = qword_100072C50;
  if (!qword_100072C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072C50);
  }
  return result;
}

unint64_t sub_100030320()
{
  unint64_t result = qword_100072C58;
  if (!qword_100072C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072C58);
  }
  return result;
}

_OWORD *sub_100030374(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_10003038C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10003040C()
{
  return static Published.subscript.setter();
}

uint64_t sub_100030488@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100030508()
{
  return static Published.subscript.setter();
}

uint64_t sub_10003057C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000305FC()
{
  return static Published.subscript.setter();
}

uint64_t sub_100030678@<X0>(void *a1@<X8>)
{
  return sub_1000306B4(a1);
}

uint64_t sub_10003068C()
{
  return sub_100030744();
}

uint64_t sub_1000306A0@<X0>(void *a1@<X8>)
{
  return sub_1000306B4(a1);
}

uint64_t sub_1000306B4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100030730()
{
  return sub_100030744();
}

uint64_t sub_100030744()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000307B4@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_10003083C()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000308C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v32 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10000816C(&qword_100072CA8);
  __chkstk_darwin(v35);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000816C(&qword_100072C98) - 8;
  uint64_t v10 = __chkstk_darwin(v9);
  double v36 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v15 || v37 == v38) {
    return 1;
  }
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v34 = *(void *)(v12 + 72);
  unint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  Swift::UInt v18 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v19 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  long long v30 = v17;
  uint64_t v31 = v18;
  uint64_t v20 = (uint64_t)v36;
  while (1)
  {
    uint64_t v21 = v37 + v16;
    sub_10000C800(v38 + v16, (uint64_t)v14, &qword_100072C98);
    uint64_t v22 = (uint64_t)&v8[*(int *)(v35 + 48)];
    sub_10000C800(v21, (uint64_t)v8, &qword_100072C98);
    sub_10000C800((uint64_t)v14, v22, &qword_100072C98);
    double v23 = *v19;
    if ((*v19)(v8, 1, v4) != 1) {
      break;
    }
    if (v23((char *)v22, 1, v4) != 1) {
      goto LABEL_15;
    }
    sub_10000C8F8((uint64_t)v8, &qword_100072C98);
    sub_10000C8F8((uint64_t)v14, &qword_100072C98);
LABEL_7:
    v16 += v34;
    if (!--v15) {
      return 1;
    }
  }
  sub_10000C800((uint64_t)v8, v20, &qword_100072C98);
  if (v23((char *)v22, 1, v4) != 1)
  {
    uint64_t v24 = v32;
    (*v30)(v32, v22, v4);
    sub_100033A5C(&qword_100072CB0, (void (*)(uint64_t))&type metadata accessor for IndexPath);
    int v33 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v25 = v19;
    id v26 = *v31;
    long long v27 = v24;
    uint64_t v20 = (uint64_t)v36;
    (*v31)(v27, v4);
    v26((char *)v20, v4);
    uint64_t v19 = v25;
    sub_10000C8F8((uint64_t)v8, &qword_100072C98);
    sub_10000C8F8((uint64_t)v14, &qword_100072C98);
    if ((v33 & 1) == 0) {
      return 0;
    }
    goto LABEL_7;
  }
  (*v31)((char *)v20, v4);
LABEL_15:
  sub_10000C8F8((uint64_t)v8, &qword_100072CA8);
  sub_10000C8F8((uint64_t)v14, &qword_100072C98);
  return 0;
}

uint64_t sub_100030CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  char v3 = 0;
  if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a2 + 32)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 48), *(float64x2_t *)(a2 + 48))))), 0xFuLL))) & 1) == 0&& ((*(unsigned __int8 *)(a1 + 64) ^ *(unsigned __int8 *)(a2 + 64)) & 1) == 0)
  {
    if (v2 == 1) {
      return 1;
    }
    uint64_t v5 = v2 - 2;
    uint64_t v6 = (float64x2_t *)(a2 + 104);
    uint64_t v7 = (float64x2_t *)(a1 + 104);
    do
    {
      uint64_t v8 = v5;
      char v9 = vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v7[-2], v6[-2]), (int32x4_t)vceqq_f64(v7[-1], v6[-1])))), 0xFuLL))) | LOBYTE(v7->f64[0]) ^ LOBYTE(v6->f64[0]);
      if (v9) {
        break;
      }
      --v5;
      uint64_t v6 = (float64x2_t *)((char *)v6 + 40);
      uint64_t v7 = (float64x2_t *)((char *)v7 + 40);
    }
    while (v8);
    char v3 = v9 ^ 1;
  }
  return v3 & 1;
}

unint64_t sub_100030DBC(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return sub_100030EB8(a1, v2);
}

unint64_t sub_100030E4C(uint64_t a1)
{
  Hasher.init(_seed:)();
  sub_10001CCCC();
  Swift::Int v2 = Hasher._finalize()();

  return sub_100031030(a1, v2);
}

unint64_t sub_100030EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

unint64_t sub_100031030(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      uint64_t v7 = *(void *)(v2 + 48) + 40 * result;
      if (*(double *)v7 == *(double *)a1
        && *(double *)(v7 + 8) == *(double *)(a1 + 8)
        && *(double *)(v7 + 16) == *(double *)(a1 + 16)
        && *(double *)(v7 + 24) == *(double *)(a1 + 24)
        && *(unsigned __int8 *)(v7 + 32) == *(unsigned __int8 *)(a1 + 32))
      {
        break;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

char *sub_1000310EC(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000816C(&qword_1000718E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 40 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1000311F4(void *result, int64_t a2, char a3, void *a4)
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
    sub_10000816C((uint64_t *)&unk_100072D50);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_10000816C(&qword_1000718F0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100031318(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000816C(&qword_100072D60);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
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

char *sub_10003141C(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000816C(&qword_100072CA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 48 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100031534(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1000315D4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100031554(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1000316DC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_100031574(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1000317E0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100031594(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100031904(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_1000315B4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100031A1C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1000315D4(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000816C(&qword_1000718E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 40 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_release();
  return v10;
}

char *sub_1000316DC(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000816C(&qword_100072D48);
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
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  swift_release();
  return v10;
}

void *sub_1000317E0(void *result, int64_t a2, char a3, void *a4)
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
    sub_10000816C((uint64_t *)&unk_100072D50);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_10000816C(&qword_1000718F0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_100031904(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000816C(&qword_100072CA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 48 * v8);
  }
  swift_release();
  return v10;
}

size_t sub_100031A1C(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000816C((uint64_t *)&unk_100072CB8);
  uint64_t v10 = *(void *)(sub_10000816C(&qword_100072C98) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_10000816C(&qword_100072C98) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_100031BF8(uint64_t a1)
{
  return sub_1000310EC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_100031C0C(void *a1)
{
  return sub_1000311F4(0, a1[2], 0, a1);
}

uint64_t sub_100031C20(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = static Hasher._hash(seed:_:)();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100032C18(a2, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_100031D1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000816C(&qword_100072D30);
  char v44 = a2;
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    id v42 = (void *)(v5 + 64);
    uint64_t v43 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v41 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v45 = v8;
        unint64_t v23 = v22 | (v8 << 6);
      }
      else
      {
        int64_t v24 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v42;
        if (v24 >= v41) {
          goto LABEL_45;
        }
        unint64_t v25 = v42[v24];
        int64_t v26 = v8 + 1;
        if (!v25)
        {
          int64_t v26 = v24 + 1;
          if (v24 + 1 >= v41) {
            goto LABEL_45;
          }
          unint64_t v25 = v42[v26];
          if (!v25)
          {
            int64_t v27 = v24 + 2;
            if (v27 >= v41)
            {
LABEL_45:
              if ((v44 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_52;
              }
              uint64_t v40 = 1 << *(unsigned char *)(v5 + 32);
              if (v40 >= 64) {
                bzero(v42, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v42 = -1 << v40;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v25 = v42[v27];
            if (!v25)
            {
              while (1)
              {
                int64_t v26 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  goto LABEL_54;
                }
                if (v26 >= v41) {
                  goto LABEL_45;
                }
                unint64_t v25 = v42[v26];
                ++v27;
                if (v25) {
                  goto LABEL_42;
                }
              }
            }
            int64_t v26 = v27;
          }
        }
LABEL_42:
        unint64_t v11 = (v25 - 1) & v25;
        int64_t v45 = v26;
        unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
      }
      uint64_t v32 = *(void *)(v5 + 56);
      uint64_t v33 = *(void *)(v5 + 48) + 40 * v23;
      Swift::UInt64 v34 = *(void *)v33;
      Swift::UInt64 v35 = *(void *)(v33 + 8);
      Swift::UInt64 v36 = *(void *)(v33 + 16);
      Swift::UInt64 v37 = *(void *)(v33 + 24);
      Swift::UInt v38 = *(unsigned __int8 *)(v33 + 32);
      uint64_t v39 = *(void *)(v32 + 8 * v23);
      if ((v44 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      if ((v34 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v13 = v34;
      }
      else {
        Swift::UInt64 v13 = 0;
      }
      Hasher._combine(_:)(v13);
      if ((v35 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v14 = v35;
      }
      else {
        Swift::UInt64 v14 = 0;
      }
      Hasher._combine(_:)(v14);
      if ((v36 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v15 = v36;
      }
      else {
        Swift::UInt64 v15 = 0;
      }
      Hasher._combine(_:)(v15);
      if ((v37 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v16 = v37;
      }
      else {
        Swift::UInt64 v16 = 0;
      }
      Hasher._combine(_:)(v16);
      Hasher._combine(_:)(v38);
      uint64_t result = Hasher._finalize()();
      uint64_t v17 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v18 = result & ~v17;
      unint64_t v19 = v18 >> 6;
      if (((-1 << v18) & ~*(void *)(v12 + 8 * (v18 >> 6))) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v12 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v17) >> 6;
        do
        {
          if (++v19 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_53;
          }
          BOOL v30 = v19 == v29;
          if (v19 == v29) {
            unint64_t v19 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v12 + 8 * v19);
        }
        while (v31 == -1);
        unint64_t v20 = __clz(__rbit64(~v31)) + (v19 << 6);
      }
      *(void *)(v12 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      uint64_t v21 = *(void *)(v7 + 48) + 40 * v20;
      *(void *)uint64_t v21 = v34;
      *(void *)(v21 + 8) = v35;
      *(void *)(v21 + 16) = v36;
      *(void *)(v21 + 24) = v37;
      *(unsigned char *)(v21 + 32) = v38;
      *(void *)(*(void *)(v7 + 56) + 8 * v20) = v39;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v43;
      int64_t v8 = v45;
    }
  }
  uint64_t result = swift_release();
LABEL_52:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10003206C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000816C(&qword_100072CE8);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v39 = a2;
    int64_t v8 = 0;
    int64_t v41 = (void *)(v5 + 64);
    uint64_t v42 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v40 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v41;
        if (v17 >= v40) {
          goto LABEL_43;
        }
        unint64_t v18 = v41[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v40) {
            goto LABEL_43;
          }
          unint64_t v18 = v41[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v40)
            {
LABEL_43:
              if ((v39 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_50;
              }
              uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
              if (v38 >= 64) {
                bzero(v41, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *int64_t v41 = -1 << v38;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v41[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_52;
                }
                if (v8 >= v40) {
                  goto LABEL_43;
                }
                unint64_t v18 = v41[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(v5 + 56);
      uint64_t v21 = *(void *)(v5 + 48) + 40 * v16;
      Swift::UInt v22 = *(unsigned __int8 *)(v21 + 32);
      Swift::UInt64 v23 = *(void *)(v21 + 16);
      Swift::UInt64 v24 = *(void *)(v21 + 24);
      Swift::UInt64 v26 = *(void *)v21;
      Swift::UInt64 v25 = *(void *)(v21 + 8);
      uint64_t v43 = *(void *)(v20 + 8 * v16);
      Hasher.init(_seed:)();
      if ((v26 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v27 = v26;
      }
      else {
        Swift::UInt64 v27 = 0;
      }
      Hasher._combine(_:)(v27);
      if ((v25 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v28 = v25;
      }
      else {
        Swift::UInt64 v28 = 0;
      }
      Hasher._combine(_:)(v28);
      if ((v23 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v29 = v23;
      }
      else {
        Swift::UInt64 v29 = 0;
      }
      Hasher._combine(_:)(v29);
      if ((v24 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v30 = v24;
      }
      else {
        Swift::UInt64 v30 = 0;
      }
      Hasher._combine(_:)(v30);
      Hasher._combine(_:)(v22);
      uint64_t result = Hasher._finalize()();
      uint64_t v31 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v12 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v32) & ~*(void *)(v12 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v34 = 0;
        unint64_t v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_51;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v12 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v13 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v7 + 48) + 40 * v13;
      *(void *)uint64_t v14 = v26;
      *(void *)(v14 + 8) = v25;
      *(void *)(v14 + 16) = v23;
      *(void *)(v14 + 24) = v24;
      *(unsigned char *)(v14 + 32) = v22;
      uint64_t v5 = v42;
      *(void *)(*(void *)(v7 + 56) + 8 * v13) = v43;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_50:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000323A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100030E4C(a2);
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
    uint64_t result = (uint64_t)sub_100032630();
LABEL_7:
    unint64_t v16 = (void *)*v4;
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
    uint64_t v19 = v16[6] + 40 * v10;
    long long v20 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)a2;
    *(_OWORD *)(v19 + 16) = v20;
    *(unsigned char *)(v19 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return result;
    }
    goto LABEL_14;
  }
  sub_100031D1C(result, a3 & 1);
  uint64_t result = sub_100030E4C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
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

uint64_t sub_1000324F0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100030E4C(a2);
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
    uint64_t result = (uint64_t)sub_1000327EC();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v18 = v16[6] + 40 * v10;
    long long v19 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)a2;
    *(_OWORD *)(v18 + 16) = v19;
    *(unsigned char *)(v18 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_10003206C(result, a3 & 1);
  uint64_t result = sub_100030E4C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
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

void *sub_100032630()
{
  uint64_t v1 = v0;
  sub_10000816C(&qword_100072D30);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 40 * v15;
    char v18 = *(unsigned char *)(v17 + 32);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    long long v22 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v17;
    *(_OWORD *)(v21 + 16) = v22;
    *(unsigned char *)(v21 + 32) = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_1000327EC()
{
  uint64_t v1 = v0;
  sub_10000816C(&qword_100072CE8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v26 = __clz(__rbit64(v24));
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = v26 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 40 * v15;
    char v18 = *(unsigned char *)(v17 + 32);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    long long v22 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v17;
    *(_OWORD *)(v21 + 16) = v22;
    *(unsigned char *)(v21 + 32) = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
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

uint64_t sub_100032994()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000816C(&qword_100072D38);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    Swift::UInt64 v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100032C18(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100032994();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_100032D3C();
      goto LABEL_14;
    }
    sub_100032ED4();
  }
  uint64_t v8 = *v3;
  uint64_t result = static Hasher._hash(seed:_:)();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_100032D3C()
{
  uint64_t v1 = v0;
  sub_10000816C(&qword_100072D38);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100032ED4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000816C(&qword_100072D38);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = static Hasher._hash(seed:_:)();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_100033138(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_10000816C(&qword_100072D30);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v18 = *(_OWORD *)(a1 + 32);
  long long v19 = v4;
  char v20 = *(unsigned char *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  unint64_t result = sub_100030E4C((uint64_t)&v18);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v8 = (long long *)(a1 + 80);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v19;
    *(_OWORD *)uint64_t v9 = v18;
    *(_OWORD *)(v9 + 16) = v10;
    *(unsigned char *)(v9 + 32) = v20;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v14 = v8 + 3;
    long long v15 = v8[1];
    long long v18 = *v8;
    long long v19 = v15;
    char v20 = *((unsigned char *)v8 + 32);
    uint64_t v16 = *((void *)v8 + 5);
    swift_bridgeObjectRetain();
    unint64_t result = sub_100030E4C((uint64_t)&v18);
    uint64_t v8 = v14;
    uint64_t v5 = v16;
    if (v17) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_100033270(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000816C(&qword_100072CE8);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (uint64_t i = (void *)(a1 + 72); ; i += 6)
    {
      long long v5 = *(_OWORD *)(i - 3);
      long long v14 = *(_OWORD *)(i - 5);
      long long v15 = v5;
      char v16 = *((unsigned char *)i - 8);
      uint64_t v6 = *i;
      unint64_t result = sub_100030E4C((uint64_t)&v14);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = v3[6] + 40 * result;
      long long v10 = v15;
      *(_OWORD *)uint64_t v9 = v14;
      *(_OWORD *)(v9 + 16) = v10;
      *(unsigned char *)(v9 + 32) = v16;
      *(void *)(v3[7] + 8 * result) = v6;
      uint64_t v11 = v3[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_10;
      }
      v3[2] = v13;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

BOOL sub_100033374(long long *a1, long long *a2)
{
  sub_100030374(a1, &v21);
  uint64_t v3 = v21;
  int v5 = v24;
  uint64_t v4 = v25;
  double v6 = *(double *)&v21;
  switch(v24 >> 62)
  {
    case 1uLL:
      v24 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_100030374(a2, &v17);
      if (v19 >> 62 != 1) {
        return 0;
      }
      return v3 == v17.i64[0];
    case 2uLL:
      v24 &= 0x3FFFFFFFFFFFFFFFuLL;
      double v7 = *((double *)&v21 + 1);
      double v8 = v22;
      double v9 = v23;
      sub_100030374(a2, &v17);
      int v10 = v19;
      if (v19 >> 62 != 2) {
        return 0;
      }
      goto LABEL_7;
    case 3uLL:
      if (v24 == 0xC000000000000000
        && (v25 | (unint64_t)v21 | *(void *)&v23 | *(void *)&v22 | *((void *)&v21 + 1)) == 0)
      {
        sub_100030374(a2, &v17);
        if (v19 >> 62 != 3) {
          return 0;
        }
        if (v19 != 0xC000000000000000) {
          return 0;
        }
        int8x16_t v16 = vorrq_s8(v17, v18);
        return !(*(void *)&vorr_s8(*(int8x8_t *)v16.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)) | v20);
      }
      sub_100030374(a2, &v17);
      return v19 >> 62 == 3
          && !v20
          && v19 == 0xC000000000000000
          && v17.i64[0] == 1
          && !(v18.i64[0] | v18.i64[1] | v17.i64[1]);
    default:
      v24 &= 0x3FFFFFFFFFFFFFFFuLL;
      double v7 = *((double *)&v21 + 1);
      double v8 = v22;
      double v9 = v23;
      sub_100030374(a2, &v17);
      int v10 = v19;
      if (v19 >> 62) {
        return 0;
      }
LABEL_7:
      BOOL result = 0;
      if (*(double *)v17.i64 == v6
        && v7 == *(double *)&v17.i64[1]
        && v8 == *(double *)v18.i64
        && v9 == *(double *)&v18.i64[1]
        && ((v5 ^ v10) & 1) == 0)
      {
        return v4 == v20;
      }
      return result;
  }
}

uint64_t sub_100033588(uint64_t a1)
{
  return a1;
}

id sub_1000335DC(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource] = 0;
  *(void *)&v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_selectedColor];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v3[32] = 2;
  v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_allowsNoColor] = 0;
  *(void *)&v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage] = 0;
  *(void *)&v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors] = 0;
  v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_useLandscapeLayout] = 0;
  v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_isEditing] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent];
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a1;
  *((_OWORD *)v4 + 1) = v5;
  *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 32);
  *((void *)v4 + 6) = *(void *)(a1 + 48);
  double v6 = (uint64_t *)&v1[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator__colorPickerState];
  swift_beginAccess();
  double v7 = v1;
  sub_100033588(a1);
  type metadata accessor for ColorPickerState();
  sub_100033A5C((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  swift_retain();
  *double v6 = ObservedObject.init(wrappedValue:)();
  v6[1] = v8;
  swift_endAccess();

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for FavoriteColorPickerView.Coordinator();
  return [super init];
}

uint64_t sub_100033770(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000337F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100033824()
{
  uint64_t v1 = sub_10000816C(&qword_100072C70);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 56;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

void sub_1000338E8()
{
  uint64_t v1 = *(void *)(sub_10000816C(&qword_100072C70) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);

  sub_10002E5C0(v0 + v2, v3);
}

uint64_t sub_100033978(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100033988()
{
  return swift_release();
}

unint64_t sub_100033990()
{
  unint64_t result = qword_100072C90;
  if (!qword_100072C90)
  {
    sub_10000CA7C(&qword_100072C88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072C90);
  }
  return result;
}

uint64_t sub_1000339EC@<X0>(void *a1@<X8>)
{
  return sub_1000306B4(a1);
}

uint64_t sub_100033A14()
{
  return sub_100030744();
}

void sub_100033A3C()
{
}

uint64_t sub_100033A5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100033AA4()
{
  return sub_100033B0C(72);
}

uint64_t sub_100033AAC(uint64_t a1, void *a2, double a3)
{
  return sub_10002EBF0(a3, a1, a2, v3 + 16);
}

uint64_t sub_100033AB4@<X0>(void *a1@<X8>)
{
  return sub_1000306B4(a1);
}

uint64_t sub_100033ADC()
{
  return sub_100030744();
}

uint64_t sub_100033B04()
{
  return sub_100033B0C(80);
}

uint64_t sub_100033B0C(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_100033B68()
{
  return sub_10002EFC0();
}

unint64_t sub_100033B74()
{
  unint64_t result = qword_100072CD8;
  if (!qword_100072CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072CD8);
  }
  return result;
}

uint64_t sub_100033BC8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

char *sub_100033C00(void *a1, uint64_t a2, long long *a3)
{
  return sub_10002C0D8(a1, a2, a3);
}

uint64_t sub_100033C08()
{
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100033C40()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_isEditing) = 1;
  return sub_10002A40C((long long *)(v0 + 24));
}

unint64_t sub_100033C7C()
{
  unint64_t result = qword_100072D08;
  if (!qword_100072D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100072D08);
  }
  return result;
}

uint64_t sub_100033CD0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100033CFC(uint64_t a1)
{
  return a1;
}

void sub_100033D28()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource);
  if (!v1)
  {
    __break(1u);
    goto LABEL_17;
  }
  id v2 = v1;
  dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();

  if (v27 >> 1 == 0xFFFFFFFF)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x1000341E0);
  }
  switch(v27 >> 62)
  {
    case 1uLL:
      return;
    case 3uLL:
      if (v27 != 0xC000000000000000
        || (unint64_t)v26 | *((void *)&v25 + 1) | (unint64_t)v25 | *((void *)&v26 + 1) | v28)
      {
        uint64_t v13 = v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator__colorPickerState;
        swift_beginAccess();
        uint64_t v14 = *(void *)(v13 + 8);
        long long v15 = (void *)swift_allocObject();
        v15[2] = 0;
        v15[3] = 0;
        v15[4] = v14;
        int8x16_t v16 = (void *)swift_allocObject();
        v16[2] = 0;
        v16[3] = 0;
        v16[4] = v14;
        swift_retain_n();
        Binding.init(get:set:)();
        sub_10000816C(&qword_100072D40);
        Binding.wrappedValue.getter();
        swift_release();
        swift_release();
        id v17 = [self blackColor];
        sub_10001D21C(v17, v24, (uint64_t)&v25);
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.setter();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        goto LABEL_14;
      }
      *(unsigned char *)(v0 + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_isEditing) = 1;
      swift_beginAccess();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if (v27 != 2)
      {
        long long v22 = v26;
        long long v23 = v25;
        char v3 = v27 & 1;
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        uint64_t v4 = (void (*)(long long *, void))static Published.subscript.modify();
        unint64_t v6 = v5;
        double v7 = *v5;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *unint64_t v6 = v7;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          double v7 = sub_1000310EC(0, *((void *)v7 + 2) + 1, 1, v7);
          *unint64_t v6 = v7;
        }
        unint64_t v9 = *((void *)v7 + 2);
        unint64_t v10 = *((void *)v7 + 3);
        unint64_t v11 = v9 + 1;
        if (v9 >= v10 >> 1)
        {
          unint64_t v21 = v9 + 1;
          int8x16_t v18 = v7;
          unint64_t v19 = *((void *)v7 + 2);
          uint64_t v20 = sub_1000310EC((char *)(v10 > 1), v9 + 1, 1, v18);
          unint64_t v9 = v19;
          unint64_t v11 = v21;
          double v7 = v20;
          *unint64_t v6 = v20;
        }
        *((void *)v7 + 2) = v11;
        BOOL v12 = &v7[40 * v9];
        *((_OWORD *)v12 + 2) = v23;
        *((_OWORD *)v12 + 3) = v22;
        v12[64] = v3;
        v4(&v25, 0);
        swift_release();
        swift_release();
        swift_release();
      }
      break;
    default:
      swift_beginAccess();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v27) = v27 & 1;
      swift_retain();
LABEL_14:
      static Published.subscript.setter();
      break;
  }
}

_OWORD *sub_100034200(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for _UIColorPickerContentViewController()
{
  uint64_t result = qword_100072E38;
  if (!qword_100072E38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003426C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000342F4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100034374()
{
  return static Published.subscript.setter();
}

char *sub_1000343E8()
{
  uint64_t v1 = sub_10000816C(&qword_100072EE8);
  uint64_t v82 = *(void *)(v1 - 8);
  uint64_t v83 = v1;
  __chkstk_darwin(v1);
  id v81 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000816C(&qword_100072EF0);
  uint64_t v79 = *(void *)(v3 - 8);
  uint64_t v80 = v3;
  __chkstk_darwin(v3);
  uint64_t v78 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000816C(&qword_100072EF8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v84 = v5;
  uint64_t v85 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000816C((uint64_t *)&unk_100072F00);
  uint64_t v73 = *(void *)(v9 - 8);
  uint64_t v74 = v9;
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000816C((uint64_t *)&unk_100072460);
  uint64_t v71 = *(void *)(v12 - 8);
  uint64_t v72 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000816C((uint64_t *)&unk_100072F10);
  uint64_t v75 = *(void *)(v15 - 8);
  unint64_t v76 = (void *)v15;
  __chkstk_darwin(v15);
  id v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UIHostingControllerSizingOptions();
  __chkstk_darwin(v18 - 8);
  unint64_t v19 = &v0[qword_100072DE0];
  *(void *)unint64_t v19 = 0x64657463656C6573;
  *((void *)v19 + 1) = 0xEB00000000626154;
  uint64_t v20 = qword_100072DE8;
  id v21 = objc_allocWithZone((Class)type metadata accessor for FavoritesStore());
  long long v22 = v0;
  *(void *)&v0[v20] = [v21 init];
  uint64_t v23 = qword_100072DF0;
  type metadata accessor for ColorPickerState();
  swift_allocObject();
  *(void *)&v22[v23] = sub_1000282B0((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v22[qword_100072DF8] = 0;
  *(void *)&v22[qword_100072E00] = 0;
  *(void *)&v22[qword_100072E08] = 0;
  *(void *)&v22[qword_100072E10] = 0;
  *(void *)&v22[qword_100072E18] = 0;
  *(void *)&v22[qword_100072E20] = 0;
  *(void *)&v22[qword_100072E28] = 0;
  v22[qword_100072E30] = 0;
  sub_1000382F4((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  swift_retain();
  uint64_t v24 = ObservedObject.init(wrappedValue:)();
  uint64_t v26 = v25;

  double v86 = (void *)v24;
  uint64_t v87 = v26;
  uint64_t v77 = v26;
  swift_retain();
  id v27 = (id)UIHostingController.init(rootView:)();
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  dispatch thunk of UIHostingController.sizingOptions.setter();
  uint64_t result = (char *)[v27 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  Swift::UInt64 v29 = result;
  id v30 = [result layer];

  [v30 setHitTestsAsOpaque:1];
  uint64_t v31 = (char *)v27;
  UIHostingController.safeAreaRegions.setter();

  uint64_t result = (char *)[v31 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  unint64_t v32 = result;
  [result _setSafeAreaInsetsFrozen:1];

  uint64_t v33 = qword_100072DF0;
  char v34 = *(void **)&v31[qword_100072DE8];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  id v35 = v34;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  BOOL v36 = sub_10001068C((char)v86);

  swift_getKeyPath();
  swift_getKeyPath();
  double v86 = v36;
  static Published.subscript.setter();
  sub_100027DA8((uint64_t)v14);
  swift_beginAccess();
  sub_10000816C(&qword_100072F20);
  Published.projectedValue.getter();
  swift_endAccess();
  uint64_t v37 = sub_10000CC70(&qword_100072F28, &qword_100072EF8);
  uint64_t v38 = v84;
  uint64_t v70 = v37;
  Publisher<>.removeDuplicates()();
  char v39 = *(void (**)(char *, uint64_t))(v85 + 8);
  v85 += 8;
  NSIndexPath v69 = v39;
  v39(v8, v38);
  sub_10000CC70(&qword_100072F30, (uint64_t *)&unk_100072460);
  sub_10000CC70(&qword_100072F38, (uint64_t *)&unk_100072F00);
  uint64_t v40 = v72;
  uint64_t v41 = v74;
  Publisher.combineLatest<A>(_:)();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v11, v41);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v40);
  uint64_t v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = sub_100037E94;
  *(void *)(v43 + 24) = v42;
  sub_10000CC70((unint64_t *)&unk_100072F40, (uint64_t *)&unk_100072F10);
  char v44 = v76;
  uint64_t v45 = Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, void *))(v75 + 8))(v17, v44);
  *(void *)&v31[qword_100072DF8] = v45;
  swift_release();
  id v46 = [self standardUserDefaults];
  swift_bridgeObjectRetain();
  NSString v47 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v48 = [v46 stringForKey:v47];

  if (v48)
  {
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    int v51 = v50;

    v52._uint64_t countAndFlagsBits = v49;
    v52._object = v51;
    unint64_t v53 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000663E0, v52);
    swift_bridgeObjectRelease();
    if (v53 <= 2)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v86) = v53;
      swift_retain();
      static Published.subscript.setter();
    }
  }
  swift_beginAccess();
  sub_10000816C(&qword_1000729B0);
  float64_t v54 = v78;
  Published.projectedValue.getter();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v76 = &protocol conformance descriptor for Published<A>.Publisher;
  sub_10000CC70((unint64_t *)&unk_100072F50, &qword_100072EF0);
  uint64_t v55 = v80;
  uint64_t v56 = Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v54, v55);
  *(void *)&v31[qword_100072E20] = v56;
  swift_release();
  swift_beginAccess();
  Published.projectedValue.getter();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v57 = v84;
  uint64_t v58 = Publisher<>.sink(receiveValue:)();
  swift_release();
  uint64_t v59 = v69;
  v69(v8, v57);
  *(void *)&v31[qword_100072E10] = v58;
  swift_release();
  swift_beginAccess();
  Published.projectedValue.getter();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v60 = Publisher<>.sink(receiveValue:)();
  swift_release();
  v59(v8, v57);
  *(void *)&v31[qword_100072E18] = v60;
  swift_release();
  swift_beginAccess();
  sub_10000816C(&qword_1000729E8);
  unint64_t v61 = v81;
  Published.projectedValue.getter();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10000CC70((unint64_t *)&unk_100072F60, &qword_100072EE8);
  uint64_t v62 = v83;
  uint64_t v63 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v82 + 8))(v61, v62);
  *(void *)&v31[qword_100072E08] = v63;
  swift_release();
  uint64_t v64 = *(void *)&v31[v33];
  uint64_t v65 = swift_allocObject();
  swift_unknownObjectWeakInit();
  long long v66 = (void (**)())(v64 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
  uint64_t v67 = *(void *)(v64 + OBJC_IVAR____TtC20ColorPickerUIService16ColorPickerState_close);
  *long long v66 = sub_100037F28;
  v66[1] = (void (*)())v65;
  sub_100010188(v67);
  return v31;
}

void sub_10003512C(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    if ((*((unsigned char *)Strong + qword_100072E30) & 1) == 0)
    {
      id v6 = [Strong parentViewController];
      if (v6)
      {
        uint64_t v7 = v6;
        self;
        uint64_t v8 = (void *)swift_dynamicCastObjCClass();
        if (!v8) {
      }
        }
      else
      {
        uint64_t v8 = 0;
      }
      [v8 _pickerDidSelectColor:a1 isVolatile:a2 & 1];
    }
  }
}

void sub_10003520C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = [self standardUserDefaults];
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v2 setValue:v3 forKey:v4];
  }
}

void sub_100035348(unsigned __int8 *a1)
{
  int v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v3 = Strong;
    if (v1 && (id v4 = [Strong parentViewController]) != 0)
    {
      uint64_t v5 = v4;
      self;
      uint64_t v6 = swift_dynamicCastObjCClass();
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        uint64_t v8 = swift_allocObject();
        *(void *)(v8 + 16) = v3;
        uint64_t v18 = sub_100037F70;
        uint64_t v19 = v8;
        float64x2_t aBlock = _NSConcreteStackBlock;
        uint64_t v15 = 1107296256;
        uint64_t v16 = sub_100035A04;
        id v17 = &unk_100067CC8;
        uint64_t v9 = _Block_copy(&aBlock);
        id v10 = v3;
        swift_release();
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = v10;
        uint64_t v18 = sub_100037F90;
        uint64_t v19 = v11;
        float64x2_t aBlock = _NSConcreteStackBlock;
        uint64_t v15 = 1107296256;
        uint64_t v16 = sub_10002E8A0;
        id v17 = &unk_100067D18;
        uint64_t v12 = _Block_copy(&aBlock);
        id v13 = v10;
        swift_release();
        [v7 _pickerDidShowEyedropperWithSelectionBlock:v9 dismissBlock:v12];

        _Block_release(v12);
        _Block_release(v9);
      }
      else
      {
      }
    }
    else
    {
      uint64_t v5 = v3;
    }
  }
}

uint64_t sub_10003554C(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009AD0(0, &qword_100072C78);
  uint64_t v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_100038030;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002E8A0;
  aBlock[3] = &unk_100067DB8;
  id v13 = _Block_copy(aBlock);
  id v14 = a2;
  id v15 = a1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_1000382F4(&qword_100072C80, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000816C(&qword_100072C88);
  sub_10000CC70((unint64_t *)&qword_100072C90, &qword_100072C88);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v18);
}

uint64_t sub_100035834()
{
  return swift_release();
}

uint64_t sub_1000358A0(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSString v3 = (CGColor *)[v2 CGColor];
  uint64_t v4 = CGColorGetColorSpace(v3);

  if (v4)
  {
    char v5 = sub_10001D348(v4);
    if (v5 != 2)
    {
      sub_10001D21C(v2, v5 & 1, (uint64_t)&v7);

      goto LABEL_8;
    }
  }
  if (qword_100071088 != -1) {
    swift_once();
  }
  sub_10001D21C(v2, byte_1000776A0, (uint64_t)&v7);
LABEL_8:
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

void sub_100035A04(uint64_t a1, void *a2)
{
  NSString v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100035A6C(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009AD0(0, &qword_100072C78);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  aBlock[4] = sub_100037F98;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002E8A0;
  aBlock[3] = &unk_100067D68;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_1000382F4(&qword_100072C80, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000816C(&qword_100072C88);
  sub_10000CC70((unint64_t *)&qword_100072C90, &qword_100072C88);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v15);
}

uint64_t sub_100035D4C()
{
  return static Published.subscript.setter();
}

void sub_100035DC4(unsigned __int8 *a1)
{
  int v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    if (v1)
    {
      id v4 = [Strong parentViewController];
      if (v4)
      {
        char v5 = v4;
        self;
        uint64_t v6 = (void *)swift_dynamicCastObjCClass();
        if (!v6) {
      }
        }
      else
      {
        uint64_t v6 = 0;
      }
      [v6 _pickerDidFloatEyeDropper];
    }
  }
}

void sub_100035E84(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = *(void **)(Strong + qword_100072DE8);
    swift_getKeyPath();
    swift_getKeyPath();
    id v5 = v4;
    static Published.subscript.getter();
    swift_release();
    swift_release();
    sub_1000107C8(v1, v6);
  }
}

void sub_100035F60()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong parentViewController];
    if (v2)
    {
      uint64_t v3 = v2;
      self;
      id v4 = (void *)swift_dynamicCastObjCClass();
      if (!v4) {
    }
      }
    else
    {
      id v4 = 0;
    }
    [v4 _pickerDidFinish];
  }
}

char *sub_100036014()
{
  return sub_1000343E8();
}

void sub_100036038(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_100037CB8();
}

void sub_100036060(void *a1, uint64_t a2, uint64_t a3)
{
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController();
  id v4 = v7.receiver;
  [super viewWillAppear:a3];
  id v5 = [v4 view];
  if (v5)
  {
    char v6 = v5;
    [v5 setBackgroundColor:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_1000360FC(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController();
  id v4 = v5.receiver;
  [super viewDidDisappear:a3];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.setter();
}

uint64_t sub_1000361AC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = qword_100072E30;
  *(unsigned char *)(v1 + qword_100072E30) = 1;
  if (a1)
  {
    id v4 = a1;
    NSString v5 = String._bridgeToObjectiveC()();
    type metadata accessor for CFString(0);
    sub_1000382F4((unint64_t *)&qword_100072F80, type metadata accessor for CFString);
    char v6 = (id)kCGColorSpaceSRGB;
    char v7 = static _CFObject.== infix(_:_:)();

    if (v7)
    {

      char v8 = 0;
    }
    else
    {
      uint64_t v9 = (id)kCGColorSpaceDisplayP3;
      char v10 = static _CFObject.== infix(_:_:)();

      if (v10)
      {
        char v8 = 1;
      }
      else
      {
        if (qword_100071088 != -1) {
          swift_once();
        }
        char v8 = byte_1000776A0;
      }
    }
    id v11 = v4;
    sub_10001D21C(v11, v8, (uint64_t)&v13);
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();

    swift_release();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t result = static Published.subscript.setter();
  *(unsigned char *)(v2 + v3) = 0;
  return result;
}

uint64_t sub_10003641C(void *a1, uint64_t a2, void *a3)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = a3;
  id v6 = a1;
  sub_1000361AC(a3);

  return swift_bridgeObjectRelease();
}

CGColorSpaceRef sub_10003649C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000816C(&qword_100072158);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  char v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v75 - v8;
  char v10 = *(void **)(v1 + qword_100072E28);
  *(void *)(v2 + qword_100072E28) = a1;
  id v11 = a1;

  uint64_t v12 = *(void *)(v2 + qword_100072DF0);
  LOBYTE(a1) = [v11 _shouldUseDarkGridInDarkMode];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v86) = (_BYTE)a1;
  swift_retain();
  static Published.subscript.setter();
  id v13 = [v11 title];
  if (!v13)
  {
    sub_100009AD0(0, (unint64_t *)&qword_100072F70);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v15 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v16 = String._bridgeToObjectiveC()();
    NSString v17 = String._bridgeToObjectiveC()();
    id v13 = [v15 localizedStringForKey:v16 value:0 table:v17];
  }
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v19;

  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v86 = v18;
  *((void *)&v86 + 1) = v20;
  swift_retain();
  static Published.subscript.setter();
  unsigned __int8 v21 = [v11 _allowsNoColor];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v86) = v21;
  swift_retain();
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v86) {
    goto LABEL_13;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v88 != 2) {
    goto LABEL_13;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v86 = v84[0];
  long long v87 = v84[1];
  char v88 = v85;
  sub_10001C400();
  uint64_t v23 = v22;
  uint64_t v24 = (CGColor *)[v22 CGColor];
  uint64_t v25 = CGColorGetColorSpace(v24);

  if (v25)
  {
    uint64_t v26 = (__CFString *)CGColorSpaceCopyName(v25);

    if (v26) {
      goto LABEL_12;
    }
  }
  if (qword_100071088 != -1) {
    goto LABEL_65;
  }
  while (1)
  {
    if (byte_1000776A0) {
      id v27 = (id *)&kCGColorSpaceDisplayP3;
    }
    else {
      id v27 = (id *)&kCGColorSpaceSRGB;
    }
    uint64_t v26 = (__CFString *)*v27;
LABEL_12:
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v28 = v23;
    sub_1000361AC(v23);

    swift_bridgeObjectRelease();
LABEL_13:
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    int v29 = LOBYTE(v84[0]);
    if (v29 != [v11 showsAlpha])
    {
      unsigned __int8 v30 = [v11 showsAlpha];
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v84[0]) = v30;
      swift_retain();
      static Published.subscript.setter();
      uint64_t v31 = sub_10001068C((char)[v11 showsAlpha]);
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)&v84[0] = v31;
      swift_retain();
      static Published.subscript.setter();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    int v32 = LOBYTE(v84[0]);
    if (v32 != [v11 _showsEyedropper])
    {
      unsigned __int8 v33 = [v11 _showsEyedropper];
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v84[0]) = v33;
      swift_retain();
      static Published.subscript.setter();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    int v34 = LOBYTE(v84[0]);
    if (v34 != [v11 _showsGridOnly])
    {
      unsigned __int8 v35 = [v11 _showsGridOnly];
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v84[0]) = v35;
      swift_retain();
      static Published.subscript.setter();
    }
    id v36 = [v11 _suggestedColors];
    if (!v36)
    {
      uint64_t v41 = 0;
      goto LABEL_37;
    }
    uint64_t v37 = v36;
    sub_100009AD0(0, &qword_100071910);
    unint64_t v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v38 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v39)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        uint64_t v41 = _swiftEmptyArrayStorage;
LABEL_37:
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        if (*(void *)&v84[0])
        {
          if (v41)
          {
            char v57 = sub_100030CD4(*(uint64_t *)&v84[0], (uint64_t)v41);
            swift_bridgeObjectRelease();
            if (v57)
            {
              swift_bridgeObjectRelease();
              goto LABEL_45;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
LABEL_44:
          swift_getKeyPath();
          swift_getKeyPath();
          *(void *)&v84[0] = v41;
          swift_retain();
          static Published.subscript.setter();
        }
        else if (v41)
        {
          goto LABEL_44;
        }
LABEL_45:
        if ([v11 _userInterfaceStyleForGrid])
        {
          if ([v11 _userInterfaceStyleForGrid] == (id)2)
          {
            uint64_t v58 = (unsigned int *)&enum case for ColorScheme.dark(_:);
            goto LABEL_51;
          }
          if ([v11 _userInterfaceStyleForGrid] == (id)1)
          {
            uint64_t v58 = (unsigned int *)&enum case for ColorScheme.light(_:);
LABEL_51:
            uint64_t v60 = *v58;
            uint64_t v61 = type metadata accessor for ColorScheme();
            uint64_t v62 = *(void *)(v61 - 8);
            (*(void (**)(char *, uint64_t, uint64_t))(v62 + 104))(v9, v60, v61);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v9, 0, 1, v61);
LABEL_52:
            swift_getKeyPath();
            swift_getKeyPath();
            sub_10003822C((uint64_t)v9, (uint64_t)v7);
            swift_retain();
            static Published.subscript.setter();
            sub_100038294((uint64_t)v9);
          }
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          int v63 = LOBYTE(v84[0]);
          if (v63 != [v11 _isEmbedded])
          {
            unsigned __int8 v64 = [v11 _isEmbedded];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v64;
            swift_retain();
            static Published.subscript.setter();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          int v65 = LOBYTE(v84[0]);
          if (v65 != [v11 _isInPopoverPresentation])
          {
            unsigned __int8 v66 = [v11 _isInPopoverPresentation];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v66;
            swift_retain();
            static Published.subscript.setter();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          int v67 = LOBYTE(v84[0]);
          if (v67 != [v11 _useLandscapeLayout])
          {
            unsigned __int8 v68 = [v11 _useLandscapeLayout];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v68;
            swift_retain();
            static Published.subscript.setter();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          double v69 = *(double *)v84;
          [v11 _preferredWidth];
          if (v69 != v70)
          {
            [v11 _preferredWidth];
            uint64_t v72 = v71;
            swift_getKeyPath();
            swift_getKeyPath();
            *(void *)&v84[0] = v72;
            swift_retain();
            static Published.subscript.setter();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          int v73 = LOBYTE(v84[0]);
          CGColorSpaceRef result = (CGColorSpaceRef)[v11 _isInSheetPresentation];
          if (v73 != result)
          {
            unsigned __int8 v74 = [v11 _isInSheetPresentation];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v74;
            swift_retain();
            return (CGColorSpaceRef)static Published.subscript.setter();
          }
          return result;
        }
        uint64_t v59 = type metadata accessor for ColorScheme();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v9, 1, 1, v59);
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v39 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v39) {
        goto LABEL_36;
      }
    }
    *(void *)&v84[0] = _swiftEmptyArrayStorage;
    uint64_t v23 = v84;
    sub_100031534(0, v39 & ~(v39 >> 63), 0);
    if ((v39 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_65:
    swift_once();
  }
  uint64_t v75 = v9;
  unint64_t v76 = v7;
  id v77 = v11;
  uint64_t v78 = v12;
  uint64_t v40 = 0;
  uint64_t v41 = *(void **)&v84[0];
  unint64_t v80 = v38 & 0xC000000000000001;
  CFStringRef v79 = kCGColorSpaceSRGB;
  while (1)
  {
    id v42 = v80 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v38 + 8 * v40 + 32);
    uint64_t v43 = v42;
    uint64_t v44 = v39;
    unint64_t v45 = v38;
    id v46 = [v42 CGColor:v75, v76, v77, v78, v79];
    CGColorSpaceRef result = (CGColorSpaceRef)UISCreateCachedColorTransform();
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    uint64_t v81 = 0;
    if (!result) {
      break;
    }
    id v48 = result;
    CGColorSpaceRef result = CGColorGetColorSpace(v46);
    if (!result) {
      goto LABEL_68;
    }
    CGColorSpaceRef v49 = result;
    CGColorSpaceRef result = (CGColorSpaceRef)CGColorRef.components.getter();
    if (!result)
    {
      __break(1u);
      break;
    }
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    uint64_t v50 = v81;
    uint64_t v51 = v82;
    uint64_t v52 = v83;
    CGFloat Alpha = CGColorGetAlpha(v46);

    *(void *)&v84[0] = v41;
    unint64_t v55 = v41[2];
    unint64_t v54 = v41[3];
    if (v55 >= v54 >> 1)
    {
      sub_100031534((char *)(v54 > 1), v55 + 1, 1);
      uint64_t v41 = *(void **)&v84[0];
    }
    ++v40;
    void v41[2] = v55 + 1;
    uint64_t v56 = (CGFloat *)&v41[5 * v55];
    *((void *)v56 + 4) = v50;
    *((void *)v56 + 5) = v51;
    *((void *)v56 + 6) = v52;
    v56[7] = Alpha;
    *((unsigned char *)v56 + 64) = 0;
    uint64_t v39 = v44;
    unint64_t v38 = v45;
    if (v44 == v40)
    {
      swift_bridgeObjectRelease();
      id v11 = v77;
      char v7 = v76;
      uint64_t v9 = v75;
      goto LABEL_37;
    }
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

void sub_1000373E0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10003649C(v4);
}

void sub_10003744C(void *a1, int a2, void *aBlock)
{
  id v4 = _Block_copy(aBlock);
  id v5 = (void (*)(void *))v4[2];
  id v6 = a1;
  v5(v4);
  _Block_release(v4);
}

void sub_1000374BC(void *a1)
{
  id v1 = a1;
  id v2 = [v1 parentViewController];
  if (v2)
  {
    uint64_t v3 = v2;
    self;
    id v2 = (id)swift_dynamicCastObjCClass();
    if (!v2)
    {

      id v2 = 0;
    }
  }
  id v4 = v2;
  [v2 _pickerDidFinish];
}

uint64_t sub_100037550()
{
  return 1;
}

void sub_100037558()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v1 = *(void **)(v0 + qword_100072E28);
}

id sub_10003761C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController();
  return [super dealloc];
}

void sub_100037654(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_super v2 = *(void **)(a1 + qword_100072E28);
}

void sub_100037724()
{
}

void sub_100037754()
{
}

uint64_t sub_100037784()
{
  return type metadata accessor for _UIColorPickerContentViewController();
}

uint64_t sub_10003778C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_1000377A0@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_1000377C8()
{
  return sub_1000188FC();
}

uint64_t sub_1000377DC()
{
  return sub_1000188FC();
}

double sub_100037804@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_10003788C()
{
  return static Published.subscript.setter();
}

uint64_t sub_100037920@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000379A0()
{
  return static Published.subscript.setter();
}

uint64_t sub_100037A24@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037A38()
{
  return sub_1000188FC();
}

uint64_t sub_100037A4C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037A60()
{
  return sub_1000188FC();
}

uint64_t sub_100037A74@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037A88()
{
  return sub_1000188FC();
}

uint64_t sub_100037A9C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037AB0()
{
  return sub_1000188FC();
}

uint64_t sub_100037AC4@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037AD8()
{
  return sub_1000188FC();
}

uint64_t sub_100037AEC@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037B00()
{
  return sub_1000188FC();
}

uint64_t sub_100037B14@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037B28()
{
  return sub_1000188FC();
}

uint64_t sub_100037B3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_100037BB8(uint64_t a1)
{
  uint64_t v2 = sub_10000816C(&qword_100072158);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  char v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v7 = (char *)&v9 - v6;
  sub_10003822C(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10003822C((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  static Published.subscript.setter();
  return sub_100038294((uint64_t)v7);
}

void sub_100037CB8()
{
  id v1 = v0;
  uint64_t v2 = &v0[qword_100072DE0];
  *uint64_t v2 = 0x64657463656C6573;
  v2[1] = 0xEB00000000626154;
  uint64_t v3 = qword_100072DE8;
  *(void *)&v1[v3] = [objc_allocWithZone((Class)type metadata accessor for FavoritesStore()) init];
  uint64_t v4 = qword_100072DF0;
  type metadata accessor for ColorPickerState();
  swift_allocObject();
  *(void *)&v1[v4] = sub_1000282B0((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v1[qword_100072DF8] = 0;
  *(void *)&v1[qword_100072E00] = 0;
  *(void *)&v1[qword_100072E08] = 0;
  *(void *)&v1[qword_100072E10] = 0;
  *(void *)&v1[qword_100072E18] = 0;
  *(void *)&v1[qword_100072E20] = 0;
  *(void *)&v1[qword_100072E28] = 0;
  v1[qword_100072E30] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100037E04@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037E2C()
{
  return sub_1000188FC();
}

uint64_t sub_100037E5C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100037E94(uint64_t a1, char a2)
{
}

uint64_t sub_100037E9C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100037ED4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

void sub_100037F08()
{
}

void sub_100037F10(unsigned __int8 *a1)
{
}

void sub_100037F18(unsigned __int8 *a1)
{
}

void sub_100037F20(uint64_t *a1)
{
}

void sub_100037F28()
{
}

uint64_t sub_100037F38()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100037F70(void *a1)
{
  return sub_10003554C(a1, *(void **)(v1 + 16));
}

uint64_t sub_100037F78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100037F88()
{
  return swift_release();
}

uint64_t sub_100037F90()
{
  return sub_100035A6C(*(void **)(v0 + 16));
}

uint64_t sub_100037F98()
{
  return sub_100035D4C();
}

uint64_t sub_100037FA0@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100037FC8()
{
  return sub_1000188FC();
}

uint64_t sub_100037FF0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100038030()
{
  return sub_100035834();
}

uint64_t sub_100038038()
{
  return sub_1000358A0(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10003805C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_100038084()
{
  return sub_1000188FC();
}

uint64_t sub_1000380C4@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_1000380EC()
{
  return sub_1000188FC();
}

uint64_t sub_100038124@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_10003814C()
{
  return sub_1000188FC();
}

uint64_t sub_100038174@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_10003819C()
{
  return sub_1000188FC();
}

uint64_t sub_1000381D4@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001886C(a1);
}

uint64_t sub_1000381FC()
{
  return sub_1000188FC();
}

uint64_t sub_10003822C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000816C(&qword_100072158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100038294(uint64_t a1)
{
  uint64_t v2 = sub_10000816C(&qword_100072158);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000382F4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100038398()
{
  uint64_t v1 = v0;
  uint64_t v2 = &off_10006F000;
  id v3 = [v0 layer];
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v5 = OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath;
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  if (v6) {
    id v7 = [v6 CGPath];
  }
  else {
    id v7 = 0;
  }
  [v4 setPath:v7];

  id v8 = [v1 layer];
  self;
  uint64_t v9 = (void *)swift_dynamicCastObjCClassUnconditional();
  char v10 = *(void **)&v1[v5];
  if (v10) {
    [v10 lineWidth];
  }
  else {
    double v11 = 1.0;
  }
  [v9 setLineWidth:v11];

  id v12 = [v1 layer];
  self;
  id v13 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v14 = *(void **)&v1[v5];
  if (v14) {
    [v14 miterLimit];
  }
  else {
    double v15 = 10.0;
  }
  [v13 setMiterLimit:v15];

  id v16 = [v1 layer];
  self;
  NSString v17 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v18 = *(void **)&v1[v5];
  if (v18)
  {
    unsigned int v19 = [v18 lineCapStyle];
    uint64_t v20 = (id *)&kCALineCapSquare;
    unsigned __int8 v21 = &kCALineCapRound;
    if (v19 != 1) {
      unsigned __int8 v21 = &kCALineCapButt;
    }
    if (v19 != 2) {
      uint64_t v20 = (id *)v21;
    }
  }
  else
  {
    uint64_t v20 = (id *)&kCALineCapButt;
  }
  id v22 = *v20;
  [v17 setLineCap:v22];

  id v23 = [v1 layer];
  self;
  uint64_t v24 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v25 = *(void **)&v1[v5];
  if (v25)
  {
    unsigned int v26 = [v25 lineJoinStyle];
    id v27 = (id *)&kCALineJoinBevel;
    uint64_t v28 = &kCALineJoinRound;
    if (v26 != 1) {
      uint64_t v28 = &kCALineJoinMiter;
    }
    if (v26 != 2) {
      id v27 = (id *)v28;
    }
  }
  else
  {
    id v27 = (id *)&kCALineJoinMiter;
  }
  id v29 = *v27;
  [v24 setLineJoin:v29];

  id v30 = [v1 layer];
  self;
  uint64_t v31 = (void *)swift_dynamicCastObjCClassUnconditional();
  int v32 = *(void **)&v1[v5];
  if (v32 && ([v32 usesEvenOddFillRule] & 1) != 0) {
    unsigned __int8 v33 = (id *)&kCAFillRuleEvenOdd;
  }
  else {
    unsigned __int8 v33 = (id *)&kCAFillRuleNonZero;
  }
  id v34 = *v33;
  [v31 setFillRule:v34];

  unsigned __int8 v35 = *(void **)&v1[v5];
  if (v35)
  {
    uint64_t v52 = 0;
    id v36 = v35;
    [v36 getLineDash:0 count:&v52 phase:0];
    uint64_t v37 = v52;
    if (v52 >= 1)
    {
      double v51 = 0.0;
      uint64_t v38 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v38 + 16) = v37;
      bzero((void *)(v38 + 32), 8 * v37);
      [v36 getLineDash:v38 + 32 count:&v52 phase:&v51];
      id v39 = [v1 layer];
      self;
      uint64_t v40 = swift_dynamicCastObjCClassUnconditional();
      uint64_t v41 = (void *)v40;
      uint64_t v42 = *(void *)(v38 + 16);
      if (v42)
      {
        id v48 = (void *)v40;
        id v49 = v39;
        swift_bridgeObjectRetain();
        specialized ContiguousArray.reserveCapacity(_:)();
        uint64_t v43 = 0;
        do
        {
          uint64_t v44 = v43 + 1;
          [objc_allocWithZone((Class)NSNumber) initWithDouble:*(double *)(v38 + 8 * v43 + 32)];
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          uint64_t v43 = v44;
        }
        while (v42 != v44);
        swift_bridgeObjectRelease_n();
        uint64_t v2 = &off_10006F000;
        uint64_t v41 = v48;
        id v39 = v49;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      sub_100009AD0(0, &qword_100072FC0);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v41 setLineDashPattern:isa];

      id v47 = [v1 v2[275]];
      self;
      [(id)swift_dynamicCastObjCClassUnconditional() setLineDashPhase:v51];
    }
  }
  else
  {
    id v45 = [v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLineDashPattern:0];

    id v50 = [v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLineDashPhase:0.0];
  }
}

id sub_100038B38()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShapeView();
  return [super dealloc];
}

uint64_t type metadata accessor for ShapeView()
{
  return self;
}

id sub_100038BA0(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView;
  id v10 = objc_allocWithZone((Class)UIView);
  double v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  uint64_t v12 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v11[v12] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v13 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView;
  *(void *)&v11[v13] = [objc_allocWithZone((Class)UIView) init];

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for RemoveColorCell();
  id v14 = [super initWithFrame:a1, a2, a3, a4];
  sub_100038DE8();

  return v14;
}

id sub_100038CCC(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView;
  id v4 = objc_allocWithZone((Class)UIView);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v5[v6] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v7 = OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UIView) init];

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for RemoveColorCell();
  [super initWithCoder:a1];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    sub_100038DE8();
  }
  return v9;
}

void sub_100038DE8()
{
  id v1 = [v0 contentView];
  objc_super v2 = self;
  id v3 = [v2 whiteColor];
  [v1 setBackgroundColor:v3];

  id v4 = [v0 contentView];
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView];
  [v4 addSubview:v5];

  id v6 = [v0 contentView];
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView];
  [v6 setMaskView:v7];

  id v8 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView];
  id v9 = [v2 systemRedColor];
  [v8 setBackgroundColor:v9];

  id v10 = [v8 layer];
  [v10 setCornerRadius:1.5];

  id v11 = [v8 layer];
  [v11 setCornerCurve:kCACornerCurveContinuous];

  [v8 setClipsToBounds:1];
  id v12 = [v0 contentView];
  [v12 addSubview:v8];

  id v13 = [v2 systemGray5Color];
  [v5 setBackgroundColor:v13];

  id v14 = [v2 blackColor];
  id v15 = [v7 layer];
  self;
  objc_super v16 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v14) {
    id v17 = [v14 CGColor];
  }
  else {
    id v17 = 0;
  }
  [v16 setFillColor:v17];

  [v0 setIsAccessibilityElement:1];
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v19 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v20 = String._bridgeToObjectiveC()();
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [v19 localizedStringForKey:v20 value:0 table:v21];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setAccessibilityLabel:v23];
}

void sub_100039278()
{
  id v1 = v0;
  v33.receiver = v0;
  v33.super_class = (Class)type metadata accessor for RemoveColorCell();
  [super layoutSubviews];
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView];
  [v1 bounds];
  [v2 setFrame:];
  id v3 = *(char **)&v1[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView];
  [v1 bounds];
  [v3 setFrame:];
  [v1 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = self;
  id v13 = [v12 bezierPathWithOvalInRect:v5, v7, v9, v11];
  if ([v1 isSelected])
  {
    [v1 bounds];
    CGRect v35 = CGRectInset(v34, 3.0, 3.0);
    double x = v35.origin.x;
    double y = v35.origin.y;
    double width = v35.size.width;
    double height = v35.size.height;
    [v1 bounds];
    CGRect v37 = CGRectInset(v36, 6.0, 6.0);
    double v18 = v37.origin.x;
    double v19 = v37.origin.y;
    double v20 = v37.size.width;
    double v21 = v37.size.height;
    id v22 = [v12 bezierPathWithOvalInRect:x, y, width, height];
    id v23 = [v22 bezierPathByReversingPath];

    [v13 appendPath:v23];
    id v24 = [v12 bezierPathWithOvalInRect:v18, v19, v20, v21];
    [v13 appendPath:v24];
  }
  uint64_t v25 = *(void **)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(void *)&v3[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v13;
  id v26 = v13;

  sub_100038398();
  unsigned int v27 = [v1 isSelected];
  [v1 bounds];
  double v28 = CGRectGetHeight(v38);
  double v29 = -8.0;
  if (v27) {
    double v29 = -18.0;
  }
  id v30 = *(void **)&v1[OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView];
  *(_OWORD *)&v32.a = 0x3FF0000000000000uLL;
  double v31 = v28 + v29;
  v32.c = 0.0;
  v32.d = 1.0;
  *(_OWORD *)&v32.tdouble x = 0uLL;
  [v30 setTransform:&v32];
  [v30 setBounds:0.0, 0.0, 3.0, v31];
  [v1 center];
  [v30 setCenter:];
  CGAffineTransformMakeRotation(&v32, 0.785398163);
  [v30 setTransform:&v32];
}

UIAccessibilityTraits sub_100039618()
{
  if (![v0 isSelected]) {
    return UIAccessibilityTraitButton;
  }
  UIAccessibilityTraits result = UIAccessibilityTraitSelected;
  if (!UIAccessibilityTraitSelected)
  {
    if (!UIAccessibilityTraitButton) {
      return 0;
    }
    return UIAccessibilityTraitButton | UIAccessibilityTraitSelected;
  }
  if ((UIAccessibilityTraitButton & ~UIAccessibilityTraitSelected) != 0) {
    return UIAccessibilityTraitButton | UIAccessibilityTraitSelected;
  }
  return result;
}

id sub_100039698()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoveColorCell();
  [super dealloc];
}

uint64_t type metadata accessor for RemoveColorCell()
{
  return self;
}

ValueMetadata *type metadata accessor for ColorLens()
{
  return &type metadata for ColorLens;
}

uint64_t sub_10003975C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100039778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  double v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static Alignment.center.getter();
  uint64_t v28 = v8;
  uint64_t v29 = v7;
  sub_100039960(v1, (uint64_t)&v31);
  uint64_t v9 = v32;
  uint64_t v10 = v33;
  char v11 = v34;
  long long v26 = v35;
  long long v27 = v31;
  uint64_t v12 = v36;
  uint64_t v25 = v37;
  char v13 = v38;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Color.RGBColorSpace.sRGBLinear(_:), v3);
  uint64_t v14 = Color.init(_:white:opacity:)();
  id v15 = [self currentDevice];
  [v15 userInterfaceIdiom];

  char v30 = v13;
  LOBYTE(v15) = static Edge.Set.all.getter();
  uint64_t result = EdgeInsets.init(_all:)();
  char v17 = v30;
  uint64_t v18 = v28;
  *(void *)a1 = v29;
  *(void *)(a1 + 8) = v18;
  *(_OWORD *)(a1 + 16) = v27;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 56) = v26;
  uint64_t v19 = v25;
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v19;
  *(unsigned char *)(a1 + 88) = v17;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = 0x4000000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = (_BYTE)v15;
  *(void *)(a1 + 136) = v20;
  *(void *)(a1 + 144) = v21;
  *(void *)(a1 + 152) = v22;
  *(void *)(a1 + 160) = v23;
  *(_WORD *)(a1 + 168) = 0;
  return result;
}

uint64_t sub_100039960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [self systemBackgroundColor];
  uint64_t v9 = Color.init(uiColor:)();
  uint64_t KeyPath = swift_getKeyPath();
  char v11 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
  if (*(unsigned char *)(a1 + 32)) {
    char v11 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v11, v4);
  uint64_t v12 = Color.init(_:red:green:blue:opacity:)();
  uint64_t v13 = swift_getKeyPath();
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  LOBYTE(v14) = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  *(void *)a2 = KeyPath;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 32) = (_BYTE)v14;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v17;
  *(void *)(a2 + 64) = v18;
  *(unsigned char *)(a2 + 72) = 0;
  swift_retain();
  return swift_release();
}

uint64_t sub_100039B48@<X0>(uint64_t a1@<X8>)
{
  return sub_100039778(a1);
}

uint64_t sub_100039B84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100039BB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100039BDC()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100039C08()
{
  return EnvironmentValues.foregroundColor.setter();
}

unint64_t sub_100039C38()
{
  unint64_t result = qword_100073010;
  if (!qword_100073010)
  {
    sub_10000CA7C(&qword_100073018);
    sub_100039D10(&qword_100073020, &qword_100073028, (void (*)(void))sub_100039CE0);
    sub_10001AFD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073010);
  }
  return result;
}

uint64_t sub_100039CE0()
{
  return sub_100039D10(&qword_100073030, &qword_100073038, (void (*)(void))sub_100039D8C);
}

uint64_t sub_100039D10(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CA7C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100039D8C()
{
  unint64_t result = qword_100073040;
  if (!qword_100073040)
  {
    sub_10000CA7C(&qword_100073048);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073040);
  }
  return result;
}

uint64_t destroy for ColorWell()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ColorWell(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorWell(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithTake for ColorWell(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorWell(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorWell(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorWell()
{
  return &type metadata for ColorWell;
}

uint64_t sub_100039FD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100039FF0(uint64_t a1)
{
  sub_10000C590(a1, (uint64_t)v18, &qword_100071BC8);
  if (v19 == 2)
  {
    sub_100019B9C();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v2 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v3 = String._bridgeToObjectiveC()();
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [v2 localizedStringForKey:v3 value:0 table:v4];

    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    *(void *)&long long v20 = v6;
    *((void *)&v20 + 1) = v8;
  }
  else
  {
    long long v20 = v18[0];
    long long v21 = v18[1];
    char v22 = v19;
    sub_10001C400();
    uint64_t v10 = v9;
    id v11 = [v9 _accessibilityNameWithLuma];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_100010084();
  uint64_t v12 = Text.init<A>(_:)();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_10000816C(&qword_100073058);
  sub_10003AAAC();
  View.accessibility(value:)();
  sub_1000100D8(v12, v14, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003A1FC()
{
  uint64_t v1 = sub_10000816C(&qword_100073050);
  __chkstk_darwin(v1 - 8);
  NSString v3 = (uint64_t *)((char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_10000816C(&qword_100073058);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *NSString v3 = static Alignment.center.getter();
  v3[1] = v7;
  uint64_t v8 = sub_10000816C(&qword_100073060);
  sub_10003A36C((long long *)v0, (uint64_t)v3 + *(int *)(v8 + 44));
  sub_10000C800((uint64_t)v3, (uint64_t)v6, &qword_100073050);
  sub_10000C8F8((uint64_t)v3, &qword_100073050);
  long long v9 = *(_OWORD *)(v0 + 16);
  v11[0] = *(_OWORD *)v0;
  v11[1] = v9;
  void v11[2] = *(_OWORD *)(v0 + 32);
  char v12 = *(unsigned char *)(v0 + 48);
  sub_10000816C(&qword_100073068);
  Binding.wrappedValue.getter();
  sub_10000C590((uint64_t)v13, (uint64_t)v11, &qword_100071BC8);
  sub_100039FF0((uint64_t)v11);
  return sub_10000C8F8((uint64_t)v6, &qword_100073058);
}

uint64_t sub_10003A36C@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v53 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v52 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10000816C(&qword_100073080);
  __chkstk_darwin(v56);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10000816C(&qword_100073088);
  __chkstk_darwin(v57);
  unint64_t v55 = (uint64_t *)((char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v8);
  uint64_t v10 = (_OWORD *)((char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_10000816C(&qword_100073090);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000816C(&qword_100073098);
  __chkstk_darwin(v14);
  char v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10000816C(&qword_1000730A0);
  uint64_t v17 = __chkstk_darwin(v51);
  char v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v54 = (uint64_t)&v51 - v20;
  long long v21 = a1[1];
  long long v59 = *a1;
  long long v60 = v21;
  long long v61 = a1[2];
  char v62 = *((unsigned char *)a1 + 48);
  sub_10000816C(&qword_100073068);
  Binding.wrappedValue.getter();
  char v22 = v63;
  if (v63 == 2)
  {
    id v23 = [self systemGray5Color];
    uint64_t v24 = Color.init(uiColor:)();
    uint64_t v25 = (char *)v10 + *(int *)(v8 + 20);
    uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v27 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
    __asm { FMOV            V0.2D, #1.5 }
    *uint64_t v10 = _Q0;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    sub_100027234((uint64_t)v10, (uint64_t)v13);
    uint64_t v33 = &v13[*(int *)(v11 + 36)];
    long long v34 = v60;
    *(_OWORD *)uint64_t v33 = v59;
    *((_OWORD *)v33 + 1) = v34;
    *((_OWORD *)v33 + 2) = v61;
    sub_100023740((uint64_t)v10);
    uint64_t v35 = static Color.red.getter();
    uint64_t KeyPath = swift_getKeyPath();
    sub_10000C800((uint64_t)v13, (uint64_t)v16, &qword_100073090);
    uint64_t v37 = (uint64_t *)&v16[*(int *)(v14 + 36)];
    *uint64_t v37 = KeyPath;
    v37[1] = v35;
    sub_10000C8F8((uint64_t)v13, &qword_100073090);
    static UnitPoint.center.getter();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    sub_10000C800((uint64_t)v16, (uint64_t)v19, &qword_100073098);
    uint64_t v42 = &v19[*(int *)(v51 + 36)];
    *(void *)uint64_t v42 = 0x3FE921FB54442D18;
    *((void *)v42 + 1) = v39;
    *((void *)v42 + 2) = v41;
    sub_10000C8F8((uint64_t)v16, &qword_100073098);
    uint64_t v43 = v54;
    sub_10000C590((uint64_t)v19, v54, &qword_1000730A0);
    sub_10000C800(v43, (uint64_t)v19, &qword_1000730A0);
    uint64_t v44 = (uint64_t)v55;
    *unint64_t v55 = v24;
    uint64_t v45 = sub_10000816C(&qword_1000730A8);
    sub_10000C800((uint64_t)v19, v44 + *(int *)(v45 + 48), &qword_1000730A0);
    swift_retain_n();
    sub_10000C8F8((uint64_t)v19, &qword_1000730A0);
    swift_release();
    sub_10000C800(v44, (uint64_t)v6, &qword_100073088);
    swift_storeEnumTagMultiPayload();
    sub_10000816C(&qword_1000730B0);
    sub_10000CC70(&qword_1000730B8, &qword_1000730B0);
    sub_10000CC70(&qword_1000730C0, &qword_100073088);
    _ConditionalContent<>.init(storage:)();
    sub_10000C8F8(v44, &qword_100073088);
    sub_10000C8F8(v43, &qword_1000730A0);
  }
  else
  {
    uint64_t v46 = static Color.white.getter();
    uint64_t v47 = static Color.black.getter();
    id v48 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
    if (v22) {
      id v48 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
    }
    (*(void (**)(char *, void, uint64_t))(v52 + 104))(v4, *v48, v53);
    uint64_t v49 = Color.init(_:red:green:blue:opacity:)();
    swift_retain_n();
    swift_retain();
    swift_retain();
    swift_release();
    *(void *)uint64_t v6 = v46;
    *((void *)v6 + 1) = v47;
    *((_WORD *)v6 + 8) = 256;
    *((void *)v6 + 3) = v49;
    swift_storeEnumTagMultiPayload();
    sub_10000816C(&qword_1000730B0);
    sub_10000CC70(&qword_1000730B8, &qword_1000730B0);
    sub_10000CC70(&qword_1000730C0, &qword_100073088);
    _ConditionalContent<>.init(storage:)();
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_10003AA68()
{
  return sub_10003A1FC();
}

unint64_t sub_10003AAAC()
{
  unint64_t result = qword_100073070;
  if (!qword_100073070)
  {
    sub_10000CA7C(&qword_100073058);
    sub_10000CC70(&qword_100073078, &qword_100073050);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073070);
  }
  return result;
}

double sub_10003AB4C@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  Path.init()();
  v14.origin.double x = a2;
  v14.origin.double y = a3;
  v14.size.double width = a4;
  v14.size.double height = a5;
  CGRectGetMinX(v14);
  v15.origin.double x = a2;
  v15.origin.double y = a3;
  v15.size.double width = a4;
  v15.size.double height = a5;
  CGRectGetMaxY(v15);
  Path.move(to:)();
  v16.origin.double x = a2;
  v16.origin.double y = a3;
  v16.size.double width = a4;
  v16.size.double height = a5;
  CGRectGetMaxX(v16);
  v17.origin.double x = a2;
  v17.origin.double y = a3;
  v17.size.double width = a4;
  v17.size.double height = a5;
  CGRectGetMinY(v17);
  Path.addLine(to:)();
  v18.origin.double x = a2;
  v18.origin.double y = a3;
  v18.size.double width = a4;
  v18.size.double height = a5;
  CGRectGetMinX(v18);
  v19.origin.double x = a2;
  v19.origin.double y = a3;
  v19.size.double width = a4;
  v19.size.double height = a5;
  CGRectGetMinY(v19);
  Path.addLine(to:)();
  v20.origin.double x = a2;
  v20.origin.double y = a3;
  v20.size.double width = a4;
  v20.size.double height = a5;
  CGRectGetMinX(v20);
  v21.origin.double x = a2;
  v21.origin.double y = a3;
  v21.size.double width = a4;
  v21.size.double height = a5;
  CGRectGetMaxY(v21);
  Path.addLine(to:)();
  Path.closeSubpath()();
  double result = *(double *)&v11;
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 32) = v13;
  return result;
}

uint64_t sub_10003ACAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10003AF9C();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10003AD10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10003AF9C();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10003AD74(uint64_t a1)
{
  unint64_t v2 = sub_10003AF9C();

  return Shape.body.getter(a1, v2);
}

ValueMetadata *type metadata accessor for Triangle()
{
  return &type metadata for Triangle;
}

unint64_t sub_10003ADDC()
{
  unint64_t result = qword_1000730C8;
  if (!qword_1000730C8)
  {
    sub_10000CA7C(&qword_1000730D0);
    sub_10003AAAC();
    sub_10003AE58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000730C8);
  }
  return result;
}

unint64_t sub_10003AE58()
{
  unint64_t result = qword_1000717D0;
  if (!qword_1000717D0)
  {
    type metadata accessor for AccessibilityAttachmentModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000717D0);
  }
  return result;
}

uint64_t sub_10003AEB0()
{
  return sub_10000CC70(&qword_1000730D8, &qword_1000730E0);
}

unint64_t sub_10003AEF0()
{
  unint64_t result = qword_1000730E8;
  if (!qword_1000730E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000730E8);
  }
  return result;
}

unint64_t sub_10003AF48()
{
  unint64_t result = qword_1000730F0;
  if (!qword_1000730F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000730F0);
  }
  return result;
}

unint64_t sub_10003AF9C()
{
  unint64_t result = qword_1000730F8;
  if (!qword_1000730F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000730F8);
  }
  return result;
}

id sub_10003AFF0(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color;
  uint64_t v10 = self;
  long long v11 = v4;
  *(void *)&v4[v9] = [v10 blackColor];
  long long v12 = &v11[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
  *(void *)long long v12 = 0;
  *((void *)v12 + 1) = 0;
  *(void *)&v11[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction] = 0;
  uint64_t v13 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView;
  *(void *)&v11[v13] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v14 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView;
  type metadata accessor for ShapeView();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  *(void *)&v11[v14] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v16 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView;
  *(void *)&v11[v16] = [objc_allocWithZone(ObjCClassFromMetadata) init];

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  [super initWithFrame:a1, a2, a3, a4];
  sub_10003B338();

  return v17;
}

id sub_10003B160(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color;
  uint64_t v4 = self;
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 blackColor];
  unint64_t v6 = &v5[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
  *(void *)unint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction] = 0;
  uint64_t v7 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v8 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView;
  type metadata accessor for ShapeView();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  *(void *)&v5[v8] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v10 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView;
  *(void *)&v5[v10] = [objc_allocWithZone(ObjCClassFromMetadata) init];

  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  id v11 = [super initWithCoder:a1];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    sub_10003B338();
  }
  return v12;
}

id sub_10003B2C0()
{
  uint64_t v1 = OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIEditMenuInteraction) initWithDelegate:v0];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    unint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_10003B338()
{
  id v1 = [v0 contentView];
  unint64_t v2 = self;
  id v3 = [v2 whiteColor];
  [v1 setBackgroundColor:v3];

  id v4 = [v0 contentView];
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView];
  [v4 addSubview:v5];

  id v6 = [v0 contentView];
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView];
  [v6 addSubview:v7];

  id v8 = [v0 contentView];
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView];
  [v8 setMaskView:v9];

  [v7 setBackgroundColor:*(void *)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color]];
  id v10 = [v2 blackColor];
  id v11 = [v5 layer];
  self;
  id v12 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v10) {
    id v13 = [v10 CGColor];
  }
  else {
    id v13 = 0;
  }
  [v12 setFillColor:v13];

  id v14 = [v2 blackColor];
  id v15 = [v9 layer];
  self;
  uint64_t v16 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v14) {
    id v17 = [v14 CGColor];
  }
  else {
    id v17 = 0;
  }
  [v16 setFillColor:v17];

  id v18 = sub_10003B2C0();
  [v0 addInteraction:v18];
}

void sub_10003B6C4()
{
  id v1 = v0;
  v35.receiver = v0;
  v35.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  [super layoutSubviews];
  [v0 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView] setFrame:];
  id v10 = *(char **)&v0[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView];
  [v10 setFrame:v3, v5, v7, v9];
  id v11 = *(char **)&v1[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView];
  [v11 setFrame:v3, v5, v7, v9];
  id v12 = [objc_allocWithZone((Class)UIBezierPath) init];
  v36.origin.double x = v3;
  v36.origin.double y = v5;
  v36.size.double width = v7;
  v36.size.double height = v9;
  double MinX = CGRectGetMinX(v36);
  v37.origin.double x = v3;
  v37.origin.double y = v5;
  v37.size.double width = v7;
  v37.size.double height = v9;
  [v12 moveToPoint:MinX, CGRectGetMinY(v37)];
  v38.origin.double x = v3;
  v38.origin.double y = v5;
  v38.size.double width = v7;
  v38.size.double height = v9;
  double v14 = CGRectGetMinX(v38);
  v39.origin.double x = v3;
  v39.origin.double y = v5;
  v39.size.double width = v7;
  v39.size.double height = v9;
  [v12 addLineToPoint:v14, CGRectGetMinY(v39)];
  v40.origin.double x = v3;
  v40.origin.double y = v5;
  v40.size.double width = v7;
  v40.size.double height = v9;
  double v15 = CGRectGetMinX(v40);
  v41.origin.double x = v3;
  v41.origin.double y = v5;
  v41.size.double width = v7;
  v41.size.double height = v9;
  [v12 addLineToPoint:v15, CGRectGetMaxY(v41)];
  v42.origin.double x = v3;
  v42.origin.double y = v5;
  v42.size.double width = v7;
  v42.size.double height = v9;
  double MaxX = CGRectGetMaxX(v42);
  v43.origin.double x = v3;
  v43.origin.double y = v5;
  v43.size.double width = v7;
  v43.size.double height = v9;
  [v12 addLineToPoint:MaxX, CGRectGetMinY(v43)];
  v44.origin.double x = v3;
  v44.origin.double y = v5;
  v44.size.double width = v7;
  v44.size.double height = v9;
  double v17 = CGRectGetMinX(v44);
  v45.origin.double x = v3;
  v45.origin.double y = v5;
  v45.size.double width = v7;
  v45.size.double height = v9;
  [v12 addLineToPoint:v17, CGRectGetMinY(v45)];
  [v12 closePath];
  id v18 = *(void **)&v10[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(void *)&v10[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v12;
  id v19 = v12;

  sub_100038398();
  CGRect v20 = self;
  id v21 = [v20 bezierPathWithOvalInRect:v3, v5, v7, v9];
  if ([v1 isSelected])
  {
    v46.origin.double x = v3;
    v46.origin.double y = v5;
    v46.size.double width = v7;
    v46.size.double height = v9;
    CGRect v47 = CGRectInset(v46, 3.0, 3.0);
    double x = v47.origin.x;
    double y = v47.origin.y;
    double width = v47.size.width;
    double height = v47.size.height;
    v47.origin.double x = v3;
    v47.origin.double y = v5;
    v47.size.double width = v7;
    v47.size.double height = v9;
    CGRect v48 = CGRectInset(v47, 6.0, 6.0);
    double v26 = v48.origin.x;
    double v27 = v48.origin.y;
    double v28 = v48.size.width;
    double v29 = v48.size.height;
    id v30 = [v20 bezierPathWithOvalInRect:x, y, width, height];
    id v31 = [v30 bezierPathByReversingPath];

    [v21 appendPath:v31];
    id v32 = [v20 bezierPathWithOvalInRect:v26, v27, v28, v29];
    [v21 appendPath:v32];
  }
  uint64_t v33 = *(void **)&v11[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath];
  *(void *)&v11[OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath] = v21;
  id v34 = v21;

  sub_100038398();
}

id sub_10003BDB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  return [super dealloc];
}

uint64_t type metadata accessor for FavoriteColorWellCell()
{
  return self;
}

uint64_t sub_10003BE9C(uint64_t a1)
{
  uint64_t v2 = sub_10000816C(&qword_1000731B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003BEFC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10003BF0C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003BF44()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10003BF6C()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SpectrumView.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for SpectrumView()
{
  return &type metadata for SpectrumView;
}

uint64_t sub_10003BFE0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SpectrumView.Coordinator();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *a1 = result;
  return result;
}

uint64_t sub_10003C018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10003C108();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10003C07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10003C108();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10003C0E0()
{
}

unint64_t sub_10003C108()
{
  unint64_t result = qword_100073278;
  if (!qword_100073278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073278);
  }
  return result;
}

id sub_10003C15C()
{
  id v0 = [objc_allocWithZone((Class)MTKView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v0 setOpaque:1];
  [v0 setPaused:1];
  [v0 setEnableSetNeedsDisplay:1];
  sub_10000816C(&qword_100073280);
  UIViewRepresentableContext.coordinator.getter();
  id v1 = [objc_allocWithZone((Class)SpectrumRenderer) initWithMetal:v0];
  uint64_t v2 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v1;
  swift_release();

  return v0;
}

uint64_t sub_10003C23C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    long long v8 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(_OWORD *)(a1 + 32) = v8;
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    swift_retain();
    swift_retain();
    uint64_t v12 = sub_10000816C(&qword_100073288);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = *(int *)(a3 + 24);
    double v14 = (void *)(a1 + v13);
    double v15 = (uint64_t *)((char *)a2 + v13);
    sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *double v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003C3D0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_10000816C(&qword_100073288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for DynamicTypeSize();
    long long v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10003C4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  swift_retain();
  swift_retain();
  uint64_t v11 = sub_10000816C(&qword_100073288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  double v14 = (void *)(a2 + v12);
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10003C61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10000816C(&qword_100073288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_10000C8F8(a1 + v10, &qword_100071570);
    sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003C7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000816C(&qword_100073288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10003C8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000816C(&qword_100073288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_10000C8F8(a1 + v11, &qword_100071570);
    uint64_t v14 = sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003CA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003CA68);
}

uint64_t sub_10003CA68(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10000816C(&qword_100073288);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_10000816C(&qword_100071578);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_10003CB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003CBB0);
}

uint64_t sub_10003CBB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_10000816C(&qword_100073288);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_10000816C(&qword_100071578);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for ColorSpaceButton()
{
  uint64_t result = qword_1000732E8;
  if (!qword_1000732E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10003CD30()
{
  sub_10003CE04();
  if (v0 <= 0x3F)
  {
    sub_10000A858();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10003CE04()
{
  if (!qword_1000732F8)
  {
    sub_10000C448();
    unint64_t v0 = type metadata accessor for ScaledMetric();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000732F8);
    }
  }
}

uint64_t sub_10003CE60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003CE7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v24 = sub_10000816C(&qword_100073330);
  uint64_t v2 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  unint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10000816C(&qword_100073338);
  __chkstk_darwin(v21);
  long long v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10000816C(&qword_100073340);
  __chkstk_darwin(v23);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10000816C(&qword_100073348);
  __chkstk_darwin(v22);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v1;
  uint64_t v26 = v1;
  sub_10000816C(&qword_100073350);
  sub_10000816C(&qword_100073358);
  sub_10003DED8();
  sub_10000CC70(&qword_100073388, &qword_100073358);
  Menu.init(content:label:)();
  type metadata accessor for ColorSpaceButton();
  sub_10000816C(&qword_100073288);
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v11 = v24;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v6, v4, v24);
  uint64_t v12 = &v6[*(int *)(v21 + 36)];
  long long v13 = v33;
  *((_OWORD *)v12 + 4) = v32;
  *((_OWORD *)v12 + 5) = v13;
  *((_OWORD *)v12 + 6) = v34;
  long long v14 = v29;
  *(_OWORD *)uint64_t v12 = v28;
  *((_OWORD *)v12 + 1) = v14;
  long long v15 = v31;
  *((_OWORD *)v12 + 2) = v30;
  *((_OWORD *)v12 + 3) = v15;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v11);
  uint64_t KeyPath = swift_getKeyPath();
  sub_10000C800((uint64_t)v6, (uint64_t)v8, &qword_100073338);
  double v17 = &v8[*(int *)(v23 + 36)];
  *(void *)double v17 = KeyPath;
  v17[8] = 1;
  sub_10000C8F8((uint64_t)v6, &qword_100073338);
  sub_10000C800((uint64_t)v8, (uint64_t)v10, &qword_100073340);
  id v18 = (uint64_t (**)())&v10[*(int *)(v22 + 36)];
  *id v18 = sub_10003E028;
  v18[1] = 0;
  sub_10000C8F8((uint64_t)v8, &qword_100073340);
  return sub_10000C590((uint64_t)v10, v25, &qword_100073348);
}

uint64_t sub_10003D2DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorSpaceButton();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003E14C(a1, (uint64_t)v5);
  type metadata accessor for MainActor();
  uint64_t v6 = static MainActor.shared.getter();
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  *(void *)(v8 + 24) = &protocol witness table for MainActor;
  sub_10003E1B4((uint64_t)v5, v8 + v7);
  sub_10003E14C(a1, (uint64_t)v5);
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = &protocol witness table for MainActor;
  sub_10003E1B4((uint64_t)v5, v10 + v7);
  Binding.init(get:set:)();
  uint64_t v28 = v24;
  uint64_t v29 = v25;
  char v30 = v26;
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v13 = String._bridgeToObjectiveC()();
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v12 localizedStringForKey:v13 value:0 table:v14];

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  uint64_t v24 = v16;
  uint64_t v25 = v18;
  sub_100010084();
  uint64_t v24 = Text.init<A>(_:)();
  uint64_t v25 = v19;
  char v26 = v20 & 1;
  uint64_t v27 = v21;
  sub_10000816C(&qword_1000733A0);
  sub_10003E478();
  sub_10003E4CC();
  return Picker.init(selection:label:content:)();
}

uint64_t sub_10003D5E8()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_10003D6BC@<X0>(uint64_t a1@<X8>)
{
  sub_10001C4A8();
  sub_100010084();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10003D718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v53 = type metadata accessor for DynamicTypeSize();
  uint64_t v3 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v5 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000816C(&qword_100073390);
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  __chkstk_darwin(v6);
  uint64_t v54 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10000816C(&qword_100073350) - 8;
  __chkstk_darwin(v56);
  unint64_t v55 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v52 = ObjCClassFromMetadata;
  uint64_t v10 = self;
  id v11 = [v10 bundleForClass:ObjCClassFromMetadata];
  NSString v12 = String._bridgeToObjectiveC()();
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v11 localizedStringForKey:v12 value:0 table:v13];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000816C(&qword_100071EF8);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004EEF0;
  uint64_t v16 = *(void *)(a1 + 8);
  char v17 = *(unsigned char *)(a1 + 48);
  uint64_t v60 = *(void *)a1;
  uint64_t v61 = v16;
  long long v18 = *(_OWORD *)(a1 + 32);
  long long v62 = *(_OWORD *)(a1 + 16);
  long long v63 = v18;
  char v64 = v17;
  sub_10000816C(&qword_100072D40);
  Binding.wrappedValue.getter();
  uint64_t v19 = sub_10001C4A8();
  uint64_t v21 = v20;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 64) = sub_10003E0A4();
  *(void *)(v15 + 32) = v19;
  *(void *)(v15 + 40) = v21;
  uint64_t v22 = static String.localizedStringWithFormat(_:_:)();
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v60 = v22;
  uint64_t v61 = v24;
  sub_100010084();
  uint64_t v25 = Text.init<A>(_:)();
  uint64_t v27 = v26;
  v51[0] = v26;
  uint64_t v29 = v28;
  v51[1] = v28;
  char v31 = v30 & 1;
  type metadata accessor for ColorSpaceButton();
  sub_100018280((uint64_t)v5);
  LOBYTE(v22) = DynamicTypeSize.isAccessibilitySize.getter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v53);
  if (v22) {
    char v32 = 1;
  }
  else {
    char v32 = 2;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v60 = v25;
  uint64_t v61 = v27;
  LOBYTE(v62) = v31;
  *((void *)&v62 + 1) = v29;
  *(void *)&long long v63 = KeyPath;
  BYTE8(v63) = v32;
  id v34 = [v10 bundleForClass:v52];
  NSString v35 = String._bridgeToObjectiveC()();
  NSString v36 = String._bridgeToObjectiveC()();
  id v37 = [v34 localizedStringForKey:v35 value:0 table:v36];

  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v40 = v39;

  uint64_t v65 = v38;
  uint64_t v66 = v40;
  uint64_t v41 = Text.init<A>(_:)();
  uint64_t v43 = v42;
  LOBYTE(v36) = v44 & 1;
  sub_10000816C(&qword_100073368);
  sub_10003DF88();
  CGRect v45 = v54;
  View.overrideMenuTitle(_:)();
  sub_1000100D8(v41, v43, (char)v36);
  swift_bridgeObjectRelease();
  sub_1000100D8(v25, v51[0], v31);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v47 = v57;
  uint64_t v46 = v58;
  uint64_t v48 = (uint64_t)v55;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v55, v45, v58);
  uint64_t v49 = (uint64_t (**)())(v48 + *(int *)(v56 + 44));
  *uint64_t v49 = sub_10003E028;
  v49[1] = 0;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v46);
  return sub_10000C590(v48, v59, &qword_100073350);
}

uint64_t sub_10003DC9C@<X0>(unsigned char *a1@<X8>)
{
  sub_10000816C(&qword_100072D40);
  uint64_t result = Binding.wrappedValue.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10003DCFC(unsigned __int8 *a1)
{
  int v1 = *a1;
  sub_10000816C(&qword_100072D40);
  uint64_t result = Binding.wrappedValue.getter();
  if (v1 != v3)
  {
    __chkstk_darwin(result);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    return swift_release();
  }
  return result;
}

uint64_t sub_10003DDD8(uint64_t a1, char a2)
{
  sub_10000816C(&qword_100072D40);
  Binding.wrappedValue.getter();
  if (a2) {
    sub_10001CB80((uint64_t)v4);
  }
  else {
    sub_10001CA38((uint64_t)v4);
  }
  return Binding.wrappedValue.setter();
}

uint64_t sub_10003DEC8()
{
  return sub_10003D2DC(*(void *)(v0 + 16));
}

uint64_t sub_10003DED0@<X0>(uint64_t a1@<X8>)
{
  return sub_10003D718(*(void *)(v1 + 16), a1);
}

unint64_t sub_10003DED8()
{
  unint64_t result = qword_100073360;
  if (!qword_100073360)
  {
    sub_10000CA7C(&qword_100073350);
    sub_10000CA7C(&qword_100073368);
    sub_10003DF88();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073360);
  }
  return result;
}

unint64_t sub_10003DF88()
{
  unint64_t result = qword_100073370;
  if (!qword_100073370)
  {
    sub_10000CA7C(&qword_100073368);
    sub_10000CC70(&qword_100073378, &qword_100073380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073370);
  }
  return result;
}

uint64_t sub_10003E028()
{
  return Transaction.animation.setter();
}

uint64_t sub_10003E050@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.menuTitleVisibility.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10003E07C()
{
  return EnvironmentValues.menuTitleVisibility.setter();
}

unint64_t sub_10003E0A4()
{
  unint64_t result = qword_100073398;
  if (!qword_100073398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073398);
  }
  return result;
}

uint64_t sub_10003E0F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10003E124()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10003E14C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSpaceButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003E1B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSpaceButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003E218@<X0>(unsigned char *a1@<X8>)
{
  type metadata accessor for ColorSpaceButton();

  return sub_10003DC9C(a1);
}

uint64_t sub_10003E290()
{
  uint64_t v1 = (int *)(type metadata accessor for ColorSpaceButton() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  uint64_t v6 = sub_10000816C(&qword_100073288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + v3 + v1[8];
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003E404(unsigned __int8 *a1)
{
  type metadata accessor for ColorSpaceButton();

  return sub_10003DCFC(a1);
}

unint64_t sub_10003E478()
{
  unint64_t result = qword_1000733A8;
  if (!qword_1000733A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000733A8);
  }
  return result;
}

unint64_t sub_10003E4CC()
{
  unint64_t result = qword_1000733B0;
  if (!qword_1000733B0)
  {
    sub_10000CA7C(&qword_1000733A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000733B0);
  }
  return result;
}

uint64_t sub_10003E538()
{
  return sub_10003DDD8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_10003E55C()
{
  unint64_t result = qword_1000733C0;
  if (!qword_1000733C0)
  {
    sub_10000CA7C(&qword_100073348);
    sub_10003E5D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000733C0);
  }
  return result;
}

unint64_t sub_10003E5D8()
{
  unint64_t result = qword_1000733C8;
  if (!qword_1000733C8)
  {
    sub_10000CA7C(&qword_100073340);
    sub_10003E678();
    sub_10000CC70(&qword_1000733E0, &qword_1000733E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000733C8);
  }
  return result;
}

unint64_t sub_10003E678()
{
  unint64_t result = qword_1000733D0;
  if (!qword_1000733D0)
  {
    sub_10000CA7C(&qword_100073338);
    sub_10000CC70(&qword_1000733D8, &qword_100073330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000733D0);
  }
  return result;
}

uint64_t *sub_10003E718(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
  }
  return v4;
}

uint64_t sub_10003E854(uint64_t a1, uint64_t a2)
{
  return sub_100047C44(a1, a2, &qword_100071570, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10003E874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  swift_retain();
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10003E960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_10000C8F8(a1 + v6, &qword_100071570);
    sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10003EA78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10003EB70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_10000C8F8(a1 + v6, &qword_100071570);
    uint64_t v9 = sub_10000816C(&qword_100071570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10003EC90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003ECA4);
}

uint64_t sub_10003ECA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_10000816C(&qword_100071578);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10003ED64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003ED78);
}

uint64_t sub_10003ED78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_10000816C(&qword_100071578);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ColorSlider(uint64_t a1)
{
  return sub_1000473C0(a1, qword_100073460);
}

void sub_10003EE44()
{
  sub_10004830C(319, (unint64_t *)&qword_1000715E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10003EF0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003EF28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v50 = a1;
  uint64_t v49 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  char v44 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CPSlider(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_10000816C(&qword_1000735D0);
  __chkstk_darwin(v45);
  uint64_t v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_10000816C(&qword_1000735D8);
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000816C(&qword_1000735E0);
  __chkstk_darwin(v12 - 8);
  uint64_t v43 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045B84((uint64_t)v2, (uint64_t)v7, type metadata accessor for CPSlider);
  uint64_t v14 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  v41[1] = v15 + v6;
  v41[0] = v14 | 7;
  uint64_t v16 = swift_allocObject();
  uint64_t v42 = v15;
  sub_1000456AC((uint64_t)v7, v16 + v15, type metadata accessor for CPSlider);
  id v17 = [self currentDevice];
  [v17 userInterfaceIdiom];

  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v58 = sub_100046AC8;
  unint64_t v59 = v16;
  uint64_t v60 = v65;
  char v61 = v66;
  uint64_t v62 = v67;
  char v63 = v68;
  long long v64 = v69;
  if (*(unsigned __int8 *)v2 >= 3u)
  {
    long long v18 = &type metadata for PercentageSliderControlStyle;
    uint64_t v19 = &off_100068258;
    uint64_t v56 = &type metadata for PercentageSliderControlStyle;
    uint64_t v57 = &off_100068258;
    uint64_t v20 = (void *)swift_allocObject();
    _OWORD v20[2] = sub_100041890;
    v20[3] = 0;
    v20[4] = sub_100041964;
    v20[5] = 0;
    uint64_t v21 = sub_100041CE8;
  }
  else
  {
    long long v18 = &type metadata for IntegerSliderControlStyle;
    uint64_t v19 = &off_100068238;
    uint64_t v56 = &type metadata for IntegerSliderControlStyle;
    uint64_t v57 = &off_100068238;
    uint64_t v20 = (void *)swift_allocObject();
    _OWORD v20[2] = sub_100042168;
    v20[3] = 0;
    v20[4] = sub_100042250;
    v20[5] = 0;
    uint64_t v21 = sub_100042340;
  }
  v20[6] = v21;
  v20[7] = 0;
  v55[0] = v20;
  sub_10001DAC4(v55, (uint64_t)v18);
  uint64_t v22 = (uint64_t (*)(uint64_t, double))((uint64_t (__cdecl *)())v19[1])();
  uint64_t v23 = v2[2];
  uint64_t v24 = v2[3];
  uint64_t v51 = v2[1];
  uint64_t v52 = v23;
  uint64_t v53 = v24;
  sub_10000816C(&qword_1000735E8);
  uint64_t v25 = Binding.wrappedValue.getter();
  uint64_t v26 = v22(v25, v54);
  uint64_t v28 = v27;
  swift_release();
  uint64_t v51 = v26;
  uint64_t v52 = v28;
  sub_100010084();
  uint64_t v29 = Text.init<A>(_:)();
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  sub_100019B4C((uint64_t)v55);
  sub_10000816C(&qword_1000735F0);
  sub_100046AF4();
  View.accessibility(value:)();
  sub_1000100D8(v29, v31, v33);
  swift_bridgeObjectRelease();
  swift_release();
  id v34 = v44;
  static AccessibilityChildBehavior.combine.getter();
  unint64_t v35 = sub_100046B94();
  NSString v36 = (uint64_t (*)(uint64_t))v45;
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v49);
  sub_10000C8F8((uint64_t)v9, &qword_1000735D0);
  sub_100045B84((uint64_t)v2, (uint64_t)v7, type metadata accessor for CPSlider);
  uint64_t v37 = swift_allocObject();
  sub_1000456AC((uint64_t)v7, v37 + v42, type metadata accessor for CPSlider);
  uint64_t v58 = v36;
  unint64_t v59 = v35;
  swift_getOpaqueTypeConformance2();
  uint64_t v38 = (uint64_t)v43;
  uint64_t v39 = v48;
  View.accessibilityAdjustableAction(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v39);
  return sub_10000C590(v38, v50, &qword_1000735E0);
}

uint64_t sub_10003F628@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v5 = type metadata accessor for CPSlider(0);
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = *(void *)(v44 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v43 = (uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for GeometryProxy();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = type metadata accessor for LocalCoordinateSpace();
  __chkstk_darwin(v10);
  uint64_t v11 = type metadata accessor for DragGesture();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  uint64_t v48 = v12;
  __chkstk_darwin(v11);
  uint64_t v41 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_10000816C(&qword_1000720A0);
  uint64_t v51 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v42 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000816C(&qword_1000720A8);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v52 = v15;
  uint64_t v53 = v16;
  __chkstk_darwin(v15);
  uint64_t v46 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_10000816C(&qword_100073618);
  __chkstk_darwin(v50);
  uint64_t v19 = (uint64_t *)((char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v19 = static Alignment.center.getter();
  v19[1] = v20;
  uint64_t v21 = (uint64_t)v19 + *(int *)(sub_10000816C(&qword_100073620) + 44);
  uint64_t v40 = a2;
  sub_10003FCCC(a2, a1, v21);
  static CoordinateSpaceProtocol<>.local.getter();
  DragGesture.init<A>(minimumDistance:coordinateSpace:)();
  uint64_t v22 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1;
  uint64_t v24 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v22, v23, v7);
  uint64_t v39 = type metadata accessor for CPSlider;
  uint64_t v25 = v43;
  sub_100045B84((uint64_t)a2, v43, type metadata accessor for CPSlider);
  unint64_t v26 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v27 = *(unsigned __int8 *)(v44 + 80);
  unint64_t v28 = (v9 + v27 + v26) & ~v27;
  uint64_t v44 = v27 | 7;
  uint64_t v29 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v29 + v26, v22, v24);
  uint64_t v30 = v25;
  sub_1000456AC(v25, v29 + v28, type metadata accessor for CPSlider);
  sub_100045D68(&qword_100072108, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_100045D68(&qword_100072110, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  uint64_t v31 = v41;
  char v32 = v42;
  uint64_t v33 = v47;
  Gesture<>.onChanged(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v31, v33);
  sub_100045B84((uint64_t)v40, v30, v39);
  uint64_t v34 = swift_allocObject();
  sub_1000456AC(v30, v34 + ((v27 + 16) & ~v27), type metadata accessor for CPSlider);
  sub_10000CC70(&qword_100072118, &qword_1000720A0);
  unint64_t v35 = v46;
  uint64_t v36 = v49;
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v36);
  static GestureMask.all.getter();
  sub_10000CC70(&qword_100073628, &qword_100073618);
  sub_10000CC70(&qword_100072150, &qword_1000720A8);
  uint64_t v37 = v52;
  View.gesture<A>(_:including:)();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v37);
  return sub_10000C8F8((uint64_t)v19, &qword_100073618);
}

uint64_t sub_10003FCCC@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v92[1] = a2;
  uint64_t v98 = a1;
  uint64_t v110 = a3;
  uint64_t v93 = type metadata accessor for PositionModifier(0);
  __chkstk_darwin(v93);
  uint64_t v95 = (void *)((char *)v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v97 = sub_10000816C(&qword_100073630);
  __chkstk_darwin(v97);
  uint64_t v96 = (char *)v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_10000816C(&qword_100073638);
  uint64_t v106 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v94 = (char *)v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000816C(&qword_100073640);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v109 = (uint64_t)v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v107 = (uint64_t)v92 - v10;
  uint64_t v11 = sub_10000816C(&qword_100073648);
  __chkstk_darwin(v11 - 8);
  uint64_t v104 = (uint64_t)v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Capsule();
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  unsigned __int8 v100 = (char *)v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v92 - v16;
  uint64_t v18 = sub_10000816C(&qword_100073650);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (void *)((char *)v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_10000816C(&qword_100073658);
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)v92 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10000816C(&qword_100073660);
  uint64_t v25 = v24 - 8;
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)v92 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_10000816C(&qword_100073668);
  __chkstk_darwin(v102);
  uint64_t v101 = (char *)v92 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10000816C(&qword_100073670);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v105 = (uint64_t)v92 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v103 = (char *)v92 - v33;
  __chkstk_darwin(v32);
  unint64_t v35 = (char *)v92 - v34;
  uint64_t *v20 = static Alignment.center.getter();
  v20[1] = v36;
  uint64_t v37 = sub_10000816C(&qword_100073678);
  sub_1000407E8(a1, (uint64_t)v20 + *(int *)(v37 + 44));
  sub_10000C800((uint64_t)v20, (uint64_t)v23, &qword_100073650);
  sub_10000C8F8((uint64_t)v20, &qword_100073650);
  uint64_t v38 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v39 = type metadata accessor for RoundedCornerStyle();
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104);
  v40(v17, v38, v39);
  uint64_t v41 = *(int *)(v25 + 44);
  uint64_t v42 = (uint64_t)v27;
  float64x2_t v99 = v27;
  uint64_t v43 = (uint64_t)&v27[v41];
  sub_100045B84((uint64_t)v17, v43, (uint64_t (*)(void))&type metadata accessor for Capsule);
  *(_WORD *)(v43 + *(int *)(sub_10000816C(&qword_100073680) + 36)) = 256;
  sub_10000C800((uint64_t)v23, v42, &qword_100073658);
  sub_100045DB8((uint64_t)v17, (uint64_t (*)(void))&type metadata accessor for Capsule);
  sub_10000C8F8((uint64_t)v23, &qword_100073658);
  uint64_t v44 = v100;
  v40(v100, v38, v39);
  uint64_t v45 = v98;
  LODWORD(v38) = *v98;
  uint64_t v46 = self;
  uint64_t v47 = &selRef_systemGrayColor;
  if (v38 != 3) {
    uint64_t v47 = &selRef_clearColor;
  }
  id v48 = [v46 *v47];
  Color.init(uiColor:)();
  uint64_t v49 = Color.opacity(_:)();
  swift_release();
  id v50 = [self currentTraitCollection];
  [v50 displayScale];

  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v51 = (uint64_t)v44;
  uint64_t v52 = (uint64_t)v44;
  uint64_t v53 = v104;
  sub_100045B84(v52, v104, (uint64_t (*)(void))&type metadata accessor for Capsule);
  uint64_t v54 = v53 + *(int *)(sub_10000816C(&qword_100073688) + 36);
  long long v55 = v120;
  *(_OWORD *)uint64_t v54 = v119;
  *(_OWORD *)(v54 + 16) = v55;
  *(void *)(v54 + 32) = v121;
  uint64_t v56 = sub_10000816C(&qword_100073690);
  *(void *)(v53 + *(int *)(v56 + 52)) = v49;
  *(_WORD *)(v53 + *(int *)(v56 + 56)) = 256;
  uint64_t v57 = static Alignment.center.getter();
  uint64_t v59 = v58;
  uint64_t v60 = (uint64_t *)(v53 + *(int *)(sub_10000816C(&qword_100073698) + 36));
  uint64_t *v60 = v57;
  v60[1] = v59;
  sub_100045DB8(v51, (uint64_t (*)(void))&type metadata accessor for Capsule);
  uint64_t v61 = static Alignment.center.getter();
  uint64_t v63 = v62;
  uint64_t v64 = (uint64_t)v101;
  uint64_t v65 = (uint64_t)&v101[*(int *)(v102 + 36)];
  sub_10000C800(v53, v65, &qword_100073648);
  char v66 = (uint64_t *)(v65 + *(int *)(sub_10000816C(&qword_1000736A0) + 36));
  *char v66 = v61;
  v66[1] = v63;
  uint64_t v67 = (uint64_t)v99;
  sub_10000C800((uint64_t)v99, v64, &qword_100073660);
  sub_10000C8F8(v53, &qword_100073648);
  sub_10000C8F8(v67, &qword_100073660);
  sub_100047114();
  uint64_t v68 = (uint64_t)v103;
  View.accessibility(hidden:)();
  sub_10000C8F8(v64, &qword_100073668);
  sub_10000C590(v68, (uint64_t)v35, &qword_100073670);
  if (*(void *)((char *)v45 + *(int *)(type metadata accessor for CPSlider(0) + 32)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v118 == 2)
    {
      uint64_t v69 = 1;
      uint64_t v70 = v107;
    }
    else
    {
      uint64_t v71 = v114;
      uint64_t v72 = v115;
      uint64_t v73 = v116;
      uint64_t v74 = v117;
      char v75 = v118 & 1;
      uint64_t v76 = v45[2];
      uint64_t v77 = v45[3];
      uint64_t v111 = v45[1];
      uint64_t v112 = v76;
      uint64_t v113 = v77;
      sub_10000816C(&qword_1000735E8);
      Binding.projectedValue.getter();
      uint64_t v78 = v114;
      uint64_t v79 = v115;
      uint64_t v80 = v116;
      GeometryProxy.size.getter();
      uint64_t v81 = v95;
      *uint64_t v95 = v78;
      v81[1] = v79;
      v81[2] = v80;
      v81[3] = v82;
      v81[4] = v83;
      uint64_t v84 = (void *)((char *)v81 + *(int *)(v93 + 24));
      *uint64_t v84 = swift_getKeyPath();
      sub_10000816C(&qword_100071DC0);
      swift_storeEnumTagMultiPayload();
      uint64_t v85 = (uint64_t)v96;
      sub_100045B84((uint64_t)v81, (uint64_t)&v96[*(int *)(v97 + 36)], type metadata accessor for PositionModifier);
      *(void *)uint64_t v85 = v71;
      *(void *)(v85 + 8) = v72;
      *(void *)(v85 + 16) = v73;
      *(void *)(v85 + 24) = v74;
      *(unsigned char *)(v85 + 32) = v75;
      sub_100045DB8((uint64_t)v81, type metadata accessor for PositionModifier);
      static UnitPoint.center.getter();
      sub_1000472F4();
      uint64_t v86 = (uint64_t)v94;
      View.accessibility(activationPoint:)();
      sub_10000C8F8(v85, &qword_100073630);
      uint64_t v70 = v107;
      sub_10000C590(v86, v107, &qword_100073638);
      uint64_t v69 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56))(v70, v69, 1, v108);
    uint64_t v87 = v105;
    sub_10000C800((uint64_t)v35, v105, &qword_100073670);
    uint64_t v88 = v109;
    sub_10000C800(v70, v109, &qword_100073640);
    uint64_t v89 = v110;
    sub_10000C800(v87, v110, &qword_100073670);
    uint64_t v90 = sub_10000816C(&qword_1000736D8);
    sub_10000C800(v88, v89 + *(int *)(v90 + 48), &qword_100073640);
    sub_10000C8F8(v70, &qword_100073640);
    sub_10000C8F8((uint64_t)v35, &qword_100073670);
    sub_10000C8F8(v88, &qword_100073640);
    return sub_10000C8F8(v87, &qword_100073670);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100045D68((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000407E8@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  *(void *)&long long v35 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v35 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = type metadata accessor for OpacityBackground(0);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (void *)((char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_10000816C(&qword_1000736F0);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v35 - v20;
  if (*a1 == 3)
  {
    *uint64_t v15 = 0x4028000000000000;
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v11, enum case for Color.RGBColorSpace.displayP3(_:), v3);
    v15[1] = Color.init(_:red:green:blue:opacity:)();
    uint64_t v22 = (void *)((char *)v15 + *(int *)(v12 + 24));
    *uint64_t v22 = swift_getKeyPath();
    sub_10000816C(&qword_100071B20);
    swift_storeEnumTagMultiPayload();
    sub_1000456AC((uint64_t)v15, (uint64_t)v21, type metadata accessor for OpacityBackground);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))((char *)&v35 - v20, 1, 1, v12);
  }
  sub_10000816C(&qword_1000736F8);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_10004FA80;
  sub_100040C58((uint64_t)&v37);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v25 = enum case for Color.RGBColorSpace.displayP3(_:);
  unsigned int v26 = enum case for Color.RGBColorSpace.sRGB(_:);
  if (v38) {
    uint64_t v27 = enum case for Color.RGBColorSpace.displayP3(_:);
  }
  else {
    uint64_t v27 = enum case for Color.RGBColorSpace.sRGB(_:);
  }
  v24(v9, v27, v3);
  *(void *)(v23 + 32) = Color.init(_:red:green:blue:opacity:)();
  sub_100040EC0((uint64_t)&v39);
  if (v40) {
    uint64_t v28 = v25;
  }
  else {
    uint64_t v28 = v26;
  }
  v24((char *)v35, v28, v3);
  *(void *)(v23 + 40) = Color.init(_:red:green:blue:opacity:)();
  uint64_t v41 = v23;
  specialized Array._endMutation()();
  Gradient.init(colors:)();
  static UnitPoint.leading.getter();
  static UnitPoint.trailing.getter();
  LinearGradient.init(gradient:startPoint:endPoint:)();
  sub_10000C800((uint64_t)v21, (uint64_t)v19, &qword_1000736F0);
  uint64_t v29 = v41;
  long long v35 = v42;
  uint64_t v30 = v43;
  uint64_t v31 = v44;
  uint64_t v32 = v36;
  sub_10000C800((uint64_t)v19, v36, &qword_1000736F0);
  uint64_t v33 = v32 + *(int *)(sub_10000816C(&qword_100073700) + 48);
  *(void *)uint64_t v33 = v29;
  *(_OWORD *)(v33 + 8) = v35;
  *(void *)(v33 + 24) = v30;
  *(void *)(v33 + 32) = v31;
  swift_bridgeObjectRetain();
  sub_10000C8F8((uint64_t)v21, &qword_1000736F0);
  swift_bridgeObjectRelease();
  return sub_10000C8F8((uint64_t)v19, &qword_1000736F0);
}

void sub_100040C58(uint64_t a1@<X8>)
{
  if (!*(void *)&v1[*(int *)(type metadata accessor for CPSlider(0) + 32)])
  {
    type metadata accessor for ColorPickerState();
    sub_100045D68((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    EnvironmentObject.error()();
    __break(1u);
    JUMPOUT(0x100040EB0);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v17 != 2)
  {
    uint64_t v8 = v13;
    uint64_t v7 = v14;
    char v11 = v17 & 1;
    double v10 = 1.0;
    uint64_t v9 = v15;
    goto LABEL_11;
  }
  id v3 = [self blackColor];
  uint64_t v4 = (CGColor *)[v3 CGColor];
  uint64_t v5 = CGColorGetColorSpace(v4);

  if (v5)
  {
    char v6 = sub_10001D348(v5);
    if (v6 != 2)
    {
      sub_10001D21C(v3, v6 & 1, (uint64_t)&v13);
      uint64_t v8 = v13;
      uint64_t v7 = v14;
      uint64_t v9 = v15;
      double v10 = v16;
      char v11 = v17;

      goto LABEL_11;
    }
  }
  if (qword_100071088 != -1) {
    swift_once();
  }
  sub_10001D21C(v3, byte_1000776A0, (uint64_t)&v13);
  uint64_t v8 = v13;
  uint64_t v7 = v14;
  uint64_t v9 = v15;
  double v10 = v16;
  char v11 = v17;
LABEL_11:
  uint64_t v12 = 0;
  switch(*v1)
  {
    case 1:
      uint64_t v7 = 0;
      goto LABEL_15;
    case 2:
      uint64_t v9 = 0;
      goto LABEL_15;
    case 3:
      double v10 = 0.0;
LABEL_15:
      uint64_t v12 = v8;
      break;
    default:
      break;
  }
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v9;
  *(double *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = v11;
}

void sub_100040EC0(uint64_t a1@<X8>)
{
  if (!*(void *)&v1[*(int *)(type metadata accessor for CPSlider(0) + 32)])
  {
    type metadata accessor for ColorPickerState();
    sub_100045D68((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    EnvironmentObject.error()();
    __break(1u);
    JUMPOUT(0x100041118);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v17 != 2)
  {
    double v8 = v13;
    double v7 = v14;
    char v11 = v17 & 1;
    double v10 = 1.0;
    double v9 = v15;
    goto LABEL_11;
  }
  id v3 = [self blackColor];
  uint64_t v4 = (CGColor *)[v3 CGColor];
  uint64_t v5 = CGColorGetColorSpace(v4);

  if (v5)
  {
    char v6 = sub_10001D348(v5);
    if (v6 != 2)
    {
      sub_10001D21C(v3, v6 & 1, (uint64_t)&v13);
      double v8 = v13;
      double v7 = v14;
      double v9 = v15;
      double v10 = v16;
      char v11 = v17;

      goto LABEL_11;
    }
  }
  if (qword_100071088 != -1) {
    swift_once();
  }
  sub_10001D21C(v3, byte_1000776A0, (uint64_t)&v13);
  double v8 = v13;
  double v7 = v14;
  double v9 = v15;
  double v10 = v16;
  char v11 = v17;
LABEL_11:
  double v12 = 1.0;
  switch(*v1)
  {
    case 1:
      double v7 = 1.0;
      goto LABEL_15;
    case 2:
      double v9 = 1.0;
      goto LABEL_15;
    case 3:
      double v10 = 1.0;
LABEL_15:
      double v12 = v8;
      break;
    default:
      break;
  }
  *(double *)a1 = v12;
  *(double *)(a1 + 8) = v7;
  *(double *)(a1 + 16) = v9;
  *(double *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = v11;
}

uint64_t sub_100041128()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_10004124C()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_1000412A0(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for AccessibilityAdjustmentDirection();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for AccessibilityAdjustmentDirection.increment(_:))
  {
    uint64_t v9 = a2[1];
    uint64_t v10 = a2[2];
    uint64_t v11 = a2[3];
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v11;
    sub_10000816C(&qword_1000735E8);
    Binding.wrappedValue.getter();
    double v12 = fmin(v17 + 0.1, 1.0);
LABEL_6:
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v11;
    double v17 = v12;
    return Binding.wrappedValue.setter();
  }
  if (v8 == enum case for AccessibilityAdjustmentDirection.decrement(_:))
  {
    uint64_t v9 = a2[1];
    uint64_t v10 = a2[2];
    uint64_t v11 = a2[3];
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v11;
    sub_10000816C(&qword_1000735E8);
    Binding.wrappedValue.getter();
    double v12 = v17 + -0.1;
    if (v17 + -0.1 < 0.0) {
      double v12 = 0.0;
    }
    goto LABEL_6;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

double sub_100041484()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LayoutDirection();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int v8 = (char *)v14 - v7;
  type metadata accessor for PositionModifier(0);
  sub_100018584((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for LayoutDirection.rightToLeft(_:), v2);
  char v9 = static LayoutDirection.== infix(_:_:)();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  uint64_t v11 = v1[1];
  uint64_t v12 = v1[2];
  v14[0] = *v1;
  v14[1] = v11;
  _OWORD v14[2] = v12;
  sub_10000816C(&qword_1000735E8);
  Binding.wrappedValue.getter();
  if (v9) {
    return 1.0 - v15;
  }
  else {
    return v15;
  }
}

uint64_t sub_100041638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = *(double *)(v2 + 32);
  double v6 = v5 * 0.5;
  double v7 = v5 * 0.5 + sub_100041484() * (*(double *)(v2 + 24) - v5);
  uint64_t v8 = sub_10000816C(&qword_100073850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  uint64_t result = sub_10000816C(&qword_100073858);
  uint64_t v10 = (double *)(a2 + *(int *)(result + 36));
  *uint64_t v10 = v7;
  v10[1] = v6;
  return result;
}

id sub_1000416E4()
{
  id result = sub_100041704();
  qword_1000733F0 = (uint64_t)result;
  return result;
}

id sub_100041704()
{
  uint64_t v0 = type metadata accessor for Locale();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  static Locale.current.getter();
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  [v4 setLocale:isa];

  [v4 setAllowsFloats:0];
  [v4 setNumberStyle:3];
  [v4 setMinimumFractionDigits:0];
  [v4 setMaximumFractionDigits:0];
  return v4;
}

id sub_10004185C()
{
  id result = [objc_allocWithZone((Class)NSNumberFormatter) init];
  qword_1000733F8 = (uint64_t)result;
  return result;
}

uint64_t sub_100041890(double a1)
{
  id v1 = [objc_allocWithZone((Class)NSNumber) initWithDouble:a1];
  if (qword_100071098 != -1) {
    swift_once();
  }
  id v2 = [(id)qword_1000733F0 stringFromNumber:v1];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {

    return 0;
  }
  return v4;
}

uint64_t sub_100041964(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v33 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  double v13 = (char *)&v32 - v12;
  __chkstk_darwin(v11);
  double v15 = (char *)&v32 - v14;
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  uint64_t v16 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v34 = a1;
  unint64_t v35 = a2;
  uint64_t v36 = 0;
  uint64_t v37 = v16;
  swift_bridgeObjectRetain();
  Swift::String_optional v17 = String.Iterator.next()();
  if (v17.value._object)
  {
    uint64_t countAndFlagsBits = v17.value._countAndFlagsBits;
    object = v17.value._object;
    uint64_t v20 = (void (**)(char *, char *, uint64_t))(v5 + 16);
    uint64_t v21 = (void (**)(char *, uint64_t))(v5 + 8);
    do
    {
      CharacterSet.init(charactersIn:)();
      static CharacterSet.decimalDigits.getter();
      (*v20)(v33, v15, v4);
      sub_100045D68(&qword_1000734F8, (void (*)(uint64_t))&type metadata accessor for CharacterSet);
      dispatch thunk of SetAlgebra.intersection(_:)();
      sub_100045D68(&qword_100073500, (void (*)(uint64_t))&type metadata accessor for CharacterSet);
      char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v24 = *v21;
      (*v21)(v10, v4);
      v24(v13, v4);
      v24(v15, v4);
      if (v23)
      {
        v25._uint64_t countAndFlagsBits = countAndFlagsBits;
        v25._object = object;
        String.append(_:)(v25);
      }
      swift_bridgeObjectRelease();
      Swift::String_optional v22 = String.Iterator.next()();
      uint64_t countAndFlagsBits = v22.value._countAndFlagsBits;
      object = v22.value._object;
    }
    while (v22.value._object);
  }
  swift_bridgeObjectRelease();
  if (qword_1000710A0 != -1) {
    swift_once();
  }
  unsigned int v26 = (void *)qword_1000733F8;
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v28 = [v26 numberFromString:v27];

  if (!v28) {
    return 0;
  }
  id v29 = [v28 integerValue];

  double v30 = (double)(uint64_t)v29 / 100.0;
  if (v30 < 0.0) {
    double v30 = 0.0;
  }
  return fmin(v30, 1.0);
}

uint64_t sub_100041CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((sub_100041DBC(a1, a2) & 1) == 0) {
    return 1;
  }
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 stringByReplacingCharactersInRange:a3 withString:a4];

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  LOBYTE(v8) = sub_100041DBC(v9, v11);
  swift_bridgeObjectRelease();
  return v8 & 1;
}

id sub_100041DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v2 = type metadata accessor for CharacterSet();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  NSString v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v21 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  double v15 = (char *)&v21 - v14;
  __chkstk_darwin(v13);
  Swift::String_optional v17 = (char *)&v21 - v16;
  static CharacterSet.decimalDigits.getter();
  static CharacterSet.whitespaces.getter();
  if (qword_100071098 != -1) {
    swift_once();
  }
  id result = [qword_1000733F0 percentSymbol:v21, v22];
  if (result)
  {
    uint64_t v19 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    CharacterSet.init(charactersIn:)();
    swift_bridgeObjectRelease();
    CharacterSet.union(_:)();
    CharacterSet.union(_:)();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
    v20(v6, v2);
    CharacterSet.init(charactersIn:)();
    LOBYTE(v19) = CharacterSet.isSuperset(of:)();
    v20(v6, v2);
    v20(v9, v2);
    v20(v12, v2);
    v20(v15, v2);
    v20(v17, v2);
    return (id)(v19 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100042048()
{
  uint64_t v0 = type metadata accessor for Locale();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  static Locale.current.getter();
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  [v4 setLocale:isa];

  id result = [v4 setAllowsFloats:0];
  qword_100073400 = (uint64_t)v4;
  return result;
}

uint64_t sub_100042168(double a1)
{
  double v1 = round(a1 * 255.0);
  if (qword_1000710A8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100073400;
  id v3 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v1];
  id v4 = [v2 stringFromNumber:v3];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t sub_100042250()
{
  if (qword_1000710A8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100073400;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 numberFromString:v1];

  if (!v2) {
    return 0;
  }
  id v3 = [v2 integerValue];

  double v4 = fmin((double)(uint64_t)v3 / 255.0, 1.0);
  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  return *(void *)&v4;
}

BOOL sub_100042340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for CharacterSet();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v20 - v11;
  NSString v13 = String._bridgeToObjectiveC()();
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 stringByReplacingCharactersInRange:a3 withString:a4];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  CharacterSet.init(charactersIn:)();
  static CharacterSet.decimalDigits.getter();
  if (CharacterSet.isSuperset(of:)())
  {
    uint64_t v16 = String.count.getter();
    swift_bridgeObjectRelease();

    Swift::String_optional v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v12, v6);
    return v16 < 4;
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
    v19(v10, v6);
    v19(v12, v6);
    return 0;
  }
}

uint64_t sub_100042544()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t sub_100042574()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t sub_1000425A4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t sub_1000425D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000816C(&qword_1000734A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = static HorizontalAlignment.leading.getter();
  id v7 = [self currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  uint64_t v9 = 0x4014000000000000;
  if (v8 == (id)6) {
    uint64_t v9 = 0x4020000000000000;
  }
  *(void *)uint64_t v5 = v6;
  *((void *)v5 + 1) = v9;
  v5[16] = 0;
  uint64_t v10 = sub_10000816C(&qword_1000734A8);
  sub_1000426E4(v1, (uint64_t)&v5[*(int *)(v10 + 44)]);
  return sub_10000C590((uint64_t)v5, a1, &qword_1000734A0);
}

uint64_t sub_1000426E4@<X0>(uint64_t (*a1)(double *a1)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v76 = sub_10000816C(&qword_1000734B0);
  __chkstk_darwin(v76);
  uint64_t v78 = (void *)((char *)v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_10000816C(&qword_1000734B8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v80 = (char *)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v79 = (uint64_t)v71 - v7;
  uint64_t v8 = type metadata accessor for DynamicTypeSize();
  uint64_t v73 = *(void *)(v8 - 8);
  uint64_t v74 = v8;
  __chkstk_darwin(v8);
  uint64_t v72 = (uint64_t)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000816C(&qword_1000734C0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v77 = (uint64_t)v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v71[0] = (char *)v71 - v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v71 - v15;
  Swift::String_optional v17 = self;
  id v18 = [v17 currentDevice];
  id v19 = [v18 userInterfaceIdiom];

  uint64_t v82 = a1;
  uint64_t v20 = sub_100043EAC();
  uint64_t v22 = v20;
  uint64_t v23 = v21;
  if (v19 != (id)6)
  {
    uint64_t v83 = v20;
    uint64_t v84 = v21;
    sub_100010084();
    uint64_t v22 = StringProtocol.localizedUppercase.getter();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v23 = v25;
  }
  uint64_t v83 = v22;
  uint64_t v84 = v23;
  v71[1] = sub_100010084();
  uint64_t v26 = Text.init<A>(_:)();
  uint64_t v28 = v27;
  char v30 = v29;
  id v31 = [v17 currentDevice];
  id v32 = [v31 userInterfaceIdiom];

  char v75 = v16;
  if (v32 == (id)6) {
    static Font.headline.getter();
  }
  else {
    static Font.footnote.getter();
  }
  uint64_t v33 = Text.font(_:)();
  uint64_t v35 = v34;
  char v37 = v36;
  swift_release();
  sub_1000100D8(v26, v28, v30 & 1);
  swift_bridgeObjectRelease();
  type metadata accessor for ColorSlider(0);
  uint64_t v38 = Text.fontWeight(_:)();
  uint64_t v40 = v39;
  char v42 = v41;
  sub_1000100D8(v33, v35, v37 & 1);
  swift_bridgeObjectRelease();
  id v43 = [v17 currentDevice];
  id v44 = [v43 userInterfaceIdiom];

  if (v44 == (id)6) {
    static Color.white.getter();
  }
  else {
    static Color.secondary.getter();
  }
  char v45 = v42 & 1;
  uint64_t v46 = Text.foregroundColor(_:)();
  uint64_t v48 = v47;
  char v50 = v49;
  uint64_t v52 = v51;
  swift_release();
  sub_1000100D8(v38, v40, v45);
  swift_bridgeObjectRelease();
  uint64_t v83 = v46;
  uint64_t v84 = v48;
  char v85 = v50 & 1;
  uint64_t v86 = v52;
  uint64_t v53 = v71[0];
  View.accessibility(hidden:)();
  sub_1000100D8(v46, v48, v50 & 1);
  swift_bridgeObjectRelease();
  uint64_t v54 = (uint64_t)v75;
  sub_10000C590(v53, (uint64_t)v75, &qword_1000734C0);
  uint64_t v55 = v72;
  sub_100018280(v72);
  LOBYTE(v53) = DynamicTypeSize.isAccessibilitySize.getter();
  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v55, v74);
  if (v53)
  {
    uint64_t v83 = static HorizontalAlignment.center.getter();
    uint64_t v84 = 0;
    char v85 = 1;
    sub_10000C374();
  }
  else
  {
    uint64_t v83 = static VerticalAlignment.center.getter();
    uint64_t v84 = 0x4030000000000000;
    char v85 = 0;
    sub_10000C320();
  }
  uint64_t v56 = AnyLayout.init<A>(_:)();
  uint64_t v57 = (uint64_t)v78;
  *uint64_t v78 = v56;
  uint64_t v58 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>))(v57 + *(int *)(v76 + 44));
  swift_retain();
  sub_100042D80(v82, v58);
  uint64_t v83 = sub_100043EAC();
  uint64_t v84 = v59;
  uint64_t v60 = Text.init<A>(_:)();
  uint64_t v62 = v61;
  char v64 = v63 & 1;
  sub_100045488();
  uint64_t v65 = (uint64_t)v80;
  View.accessibility(label:)();
  sub_1000100D8(v60, v62, v64);
  swift_bridgeObjectRelease();
  sub_10000C8F8(v57, &qword_1000734B0);
  uint64_t v66 = v79;
  sub_10000C590(v65, v79, &qword_1000734B8);
  uint64_t v67 = v77;
  sub_10000C800(v54, v77, &qword_1000734C0);
  sub_10000C800(v66, v65, &qword_1000734B8);
  uint64_t v68 = v81;
  sub_10000C800(v67, v81, &qword_1000734C0);
  uint64_t v69 = sub_10000816C(&qword_1000734E0);
  sub_10000C800(v65, v68 + *(int *)(v69 + 48), &qword_1000734B8);
  swift_release();
  sub_10000C8F8(v66, &qword_1000734B8);
  sub_10000C8F8(v54, &qword_1000734C0);
  sub_10000C8F8(v65, &qword_1000734B8);
  return sub_10000C8F8(v67, &qword_1000734C0);
}

uint64_t sub_100042D80@<X0>(uint64_t (*a1)(double *a1)@<X0>, uint64_t (*a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v3 = type metadata accessor for ColorSlider(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for CPSlider(0) - 8;
  uint64_t v7 = __chkstk_darwin(v88);
  uint64_t v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v93 = (uint64_t)&v74 - v10;
  uint64_t v94 = a1;
  LODWORD(v87) = *(unsigned __int8 *)a1;
  *((void *)&v91 + 1) = type metadata accessor for ColorSlider;
  sub_100045B84((uint64_t)a1, (uint64_t)v6, type metadata accessor for ColorSlider);
  *(void *)&long long v91 = type metadata accessor for MainActor();
  uint64_t v11 = static MainActor.shared.getter();
  uint64_t v89 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v90 = v5;
  uint64_t v12 = (v89 + 32) & ~v89;
  uint64_t v86 = v12 + v5;
  uint64_t v83 = v89 | 7;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  uint64_t v81 = type metadata accessor for ColorSlider;
  uint64_t v82 = v12;
  sub_1000456AC((uint64_t)v6, v13 + v12, type metadata accessor for ColorSlider);
  sub_100045B84((uint64_t)v94, (uint64_t)v6, *((uint64_t (**)(void))&v91 + 1));
  uint64_t v14 = static MainActor.shared.getter();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = &protocol witness table for MainActor;
  uint64_t v16 = (uint64_t)v6;
  sub_1000456AC((uint64_t)v6, v15 + v12, type metadata accessor for ColorSlider);
  Binding.init(get:set:)();
  uint64_t v17 = *((void *)&v109 + 1);
  uint64_t v85 = v109;
  uint64_t v18 = v110;
  id v19 = v94;
  uint64_t v20 = type metadata accessor for ColorPickerState();
  uint64_t v21 = sub_100045D68((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  EnvironmentObject.projectedValue.getter();
  swift_getKeyPath();
  EnvironmentObject.Wrapper.subscript.getter();
  swift_release();
  swift_release();
  long long v22 = v109;
  char v23 = v110;
  *uint64_t v9 = v87;
  *((void *)v9 + 1) = v85;
  *((void *)v9 + 2) = v17;
  *((void *)v9 + 3) = v18;
  *((_OWORD *)v9 + 2) = v22;
  v9[48] = v23;
  uint64_t v24 = v88;
  uint64_t v25 = (uint64_t *)&v9[*(int *)(v88 + 36)];
  *uint64_t v25 = swift_getKeyPath();
  sub_10000816C(&qword_100071DC0);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = (uint64_t *)&v9[*(int *)(v24 + 40)];
  uint64_t v85 = v20;
  uint64_t v87 = v21;
  *uint64_t v26 = EnvironmentObject.init()();
  v26[1] = v27;
  uint64_t v92 = v9;
  sub_1000456AC((uint64_t)v9, v93, type metadata accessor for CPSlider);
  uint64_t v28 = v16;
  char v29 = (uint64_t (*)(void))*((void *)&v91 + 1);
  sub_100045B84((uint64_t)v19, v16, *((uint64_t (**)(void))&v91 + 1));
  uint64_t v30 = static MainActor.shared.getter();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  *(void *)(v31 + 24) = &protocol witness table for MainActor;
  uint64_t v33 = v81;
  uint64_t v32 = v82;
  sub_1000456AC(v28, v31 + v82, v81);
  sub_100045B84((uint64_t)v94, v28, v29);
  uint64_t v34 = static MainActor.shared.getter();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v34;
  *(void *)(v35 + 24) = &protocol witness table for MainActor;
  uint64_t v36 = v35 + v32;
  uint64_t v37 = v28;
  sub_1000456AC(v28, v36, v33);
  Binding.init(get:set:)();
  long long v91 = v109;
  uint64_t v38 = v110;
  if (*(unsigned __int8 *)v94 >= 3u)
  {
    *((void *)&v98 + 1) = &type metadata for PercentageSliderControlStyle;
    *(void *)&long long v99 = &off_100068258;
    uint64_t v39 = (void *)swift_allocObject();
    v39[2] = sub_100041890;
    v39[3] = 0;
    v39[4] = sub_100041964;
    v39[5] = 0;
    uint64_t v40 = sub_100041CE8;
  }
  else
  {
    *((void *)&v98 + 1) = &type metadata for IntegerSliderControlStyle;
    *(void *)&long long v99 = &off_100068238;
    uint64_t v39 = (void *)swift_allocObject();
    v39[2] = sub_100042168;
    v39[3] = 0;
    v39[4] = sub_100042250;
    v39[5] = 0;
    uint64_t v40 = sub_100042340;
  }
  v39[6] = v40;
  v39[7] = 0;
  uint64_t v41 = v89;
  *(void *)&long long v97 = v39;
  sub_10000816C(&qword_1000734E8);
  LODWORD(v88) = swift_dynamicCast();
  if (v88)
  {
    swift_release();
    swift_release();
    swift_release();
  }
  char v42 = v94;
  sub_100045B84((uint64_t)v94, v37, type metadata accessor for ColorSlider);
  uint64_t v43 = (v41 + 16) & ~v41;
  uint64_t v90 = swift_allocObject();
  sub_1000456AC(v37, v90 + v43, type metadata accessor for ColorSlider);
  sub_100045B84((uint64_t)v42, v37, type metadata accessor for ColorSlider);
  uint64_t v89 = swift_allocObject();
  sub_1000456AC(v37, v89 + v43, type metadata accessor for ColorSlider);
  sub_100045B84((uint64_t)v42, v37, type metadata accessor for ColorSlider);
  uint64_t v83 = swift_allocObject();
  sub_1000456AC(v37, v83 + v43, type metadata accessor for ColorSlider);
  uint64_t v44 = EnvironmentObject.init()();
  uint64_t v86 = v45;
  LOBYTE(v97) = 0;
  State.init(wrappedValue:)();
  LODWORD(v82) = v109;
  uint64_t v81 = (uint64_t (*)(uint64_t))*((void *)&v109 + 1);
  sub_100043D10();
  id v46 = [self defaultMetrics];
  id v47 = [self currentDevice];
  id v48 = [v47 userInterfaceIdiom];

  double v49 = 36.0;
  if (v48 == (id)6) {
    double v49 = 44.0;
  }
  [v46 scaledValueForValue:v49];

  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  if (*((void *)v42 + 1))
  {
    uint64_t v87 = v136;
    uint64_t v79 = v134;
    uint64_t v80 = v137;
    uint64_t v85 = v132;
    unsigned __int8 v96 = v133;
    unsigned __int8 v95 = v135;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    int v50 = v111;
    swift_release();
    sub_10000A8CC(v50 != 2);
    uint64_t v51 = Color.init(uiColor:)();
    int v52 = static Edge.Set.all.getter();
    unsigned __int8 v53 = v96;
    int v76 = v52;
    int v77 = v96;
    unsigned __int8 v54 = v95;
    int v78 = v95;
    uint64_t v55 = (uint64_t)v92;
    sub_100045B84(v93, (uint64_t)v92, type metadata accessor for CPSlider);
    uint64_t v56 = v84;
    sub_100045B84(v55, (uint64_t)v84, type metadata accessor for CPSlider);
    uint64_t v57 = (_OWORD *)((char *)v56 + *(int *)(sub_10000816C(&qword_1000734F0) + 48));
    *(void *)&long long v97 = v44;
    *((void *)&v97 + 1) = v86;
    long long v98 = v91;
    *(void *)&long long v99 = v38;
    BYTE8(v99) = 1;
    BYTE9(v99) = v88;
    uint64_t v94 = sub_10004583C;
    *(void *)&long long v100 = 8;
    *((void *)&v100 + 1) = sub_10004583C;
    uint64_t v75 = v44;
    uint64_t v84 = sub_100045A10;
    *(void *)&long long v101 = v90;
    *((void *)&v101 + 1) = sub_100045A10;
    *(void *)&long long v102 = v89;
    *((void *)&v102 + 1) = sub_100045ACC;
    uint64_t v58 = v83;
    *(void *)&long long v103 = v83;
    char v59 = v82;
    BYTE8(v103) = v82;
    uint64_t v60 = v81;
    *(void *)&long long v104 = v81;
    *((void *)&v104 + 1) = v85;
    LOBYTE(v105) = v53;
    uint64_t v61 = v79;
    uint64_t v62 = v80;
    *((void *)&v105 + 1) = v79;
    LOBYTE(v106) = v54;
    *((void *)&v106 + 1) = v87;
    *(void *)&long long v107 = v80;
    *((void *)&v107 + 1) = v51;
    char v63 = v76;
    LOBYTE(v108) = v76;
    *((void *)&v108 + 1) = 0x4020000000000000;
    long long v64 = v101;
    long long v65 = v102;
    long long v66 = v104;
    v57[6] = v103;
    v57[7] = v66;
    v57[4] = v64;
    v57[5] = v65;
    long long v67 = v97;
    long long v68 = v98;
    long long v69 = v100;
    v57[2] = v99;
    v57[3] = v69;
    *uint64_t v57 = v67;
    v57[1] = v68;
    long long v70 = v105;
    long long v71 = v106;
    long long v72 = v108;
    v57[10] = v107;
    v57[11] = v72;
    v57[8] = v70;
    v57[9] = v71;
    sub_100045BEC((uint64_t)&v97);
    sub_100045DB8(v93, type metadata accessor for CPSlider);
    *(void *)&long long v109 = v75;
    *((void *)&v109 + 1) = v86;
    long long v110 = v91;
    uint64_t v111 = v38;
    char v112 = 1;
    char v113 = v88;
    uint64_t v114 = 8;
    uint64_t v115 = v94;
    uint64_t v116 = v90;
    uint64_t v117 = v84;
    uint64_t v118 = v89;
    long long v119 = sub_100045ACC;
    uint64_t v120 = v58;
    char v121 = v59;
    uint64_t v122 = v60;
    uint64_t v123 = v85;
    char v124 = v77;
    uint64_t v125 = v61;
    char v126 = v78;
    uint64_t v127 = v87;
    uint64_t v128 = v62;
    uint64_t v129 = v51;
    char v130 = v63;
    uint64_t v131 = 0x4020000000000000;
    sub_100045C80((uint64_t)&v109);
    return sub_100045DB8((uint64_t)v92, type metadata accessor for CPSlider);
  }
  else
  {
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100043884(double *a1, unsigned __int8 *a2)
{
  double v2 = *a1;
  if (*a2 >= 3u)
  {
    uint64_t v3 = &type metadata for PercentageSliderControlStyle;
    uint64_t v4 = &off_100068258;
    uint64_t v11 = &type metadata for PercentageSliderControlStyle;
    uint64_t v12 = &off_100068258;
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = sub_100041890;
    long long v5[3] = 0;
    v5[4] = sub_100041964;
    v5[5] = 0;
    uint64_t v6 = sub_100041CE8;
  }
  else
  {
    uint64_t v3 = &type metadata for IntegerSliderControlStyle;
    uint64_t v4 = &off_100068238;
    uint64_t v11 = &type metadata for IntegerSliderControlStyle;
    uint64_t v12 = &off_100068238;
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = sub_100042168;
    long long v5[3] = 0;
    v5[4] = sub_100042250;
    v5[5] = 0;
    uint64_t v6 = sub_100042340;
  }
  v5[6] = v6;
  v5[7] = 0;
  v10[0] = v5;
  sub_10001DAC4(v10, (uint64_t)v3);
  uint64_t v7 = (uint64_t (*)(double))((uint64_t (__cdecl *)())v4[1])();
  uint64_t v8 = v7(v2);
  swift_release();
  sub_100019B4C((uint64_t)v10);
  return v8;
}

uint64_t sub_1000439F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a3 >= 3u)
  {
    uint64_t v7 = &type metadata for PercentageSliderControlStyle;
    uint64_t v8 = &off_100068258;
    uint64_t v17 = &type metadata for PercentageSliderControlStyle;
    uint64_t v18 = &off_100068258;
    uint64_t v9 = (void *)swift_allocObject();
    _OWORD v9[2] = sub_100041890;
    v9[3] = 0;
    v9[4] = sub_100041964;
    v9[5] = 0;
    uint64_t v10 = sub_100041CE8;
  }
  else
  {
    uint64_t v7 = &type metadata for IntegerSliderControlStyle;
    uint64_t v8 = &off_100068238;
    uint64_t v17 = &type metadata for IntegerSliderControlStyle;
    uint64_t v18 = &off_100068238;
    uint64_t v9 = (void *)swift_allocObject();
    _OWORD v9[2] = sub_100042168;
    v9[3] = 0;
    v9[4] = sub_100042250;
    v9[5] = 0;
    uint64_t v10 = sub_100042340;
  }
  v9[6] = v10;
  v9[7] = 0;
  v16[0] = v9;
  sub_10001DAC4(v16, (uint64_t)v7);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((uint64_t (__cdecl *)())v8[2])();
  uint64_t v12 = v11(a1, a2);
  char v14 = v13;
  swift_release();
  *(void *)a4 = v12;
  *(unsigned char *)(a4 + 8) = v14 & 1;
  return sub_100019B4C((uint64_t)v16);
}

uint64_t sub_100043B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7)
{
  if (*a7 >= 3u)
  {
    char v13 = &type metadata for PercentageSliderControlStyle;
    char v14 = &off_100068258;
    uint64_t v21 = &type metadata for PercentageSliderControlStyle;
    long long v22 = &off_100068258;
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = sub_100041890;
    v15[3] = 0;
    v15[4] = sub_100041964;
    v15[5] = 0;
    uint64_t v16 = sub_100041CE8;
  }
  else
  {
    char v13 = &type metadata for IntegerSliderControlStyle;
    char v14 = &off_100068238;
    uint64_t v21 = &type metadata for IntegerSliderControlStyle;
    long long v22 = &off_100068238;
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = sub_100042168;
    v15[3] = 0;
    v15[4] = sub_100042250;
    v15[5] = 0;
    uint64_t v16 = sub_100042340;
  }
  v15[6] = v16;
  v15[7] = 0;
  v20[0] = v15;
  sub_10001DAC4(v20, (uint64_t)v13);
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((uint64_t (__cdecl *)())v14[3])();
  char v18 = v17(a1, a2, a3, a4, a5, a6);
  swift_release();
  sub_100019B4C((uint64_t)v20);
  return v18 & 1;
}

void sub_100043D10()
{
  id v1 = [self currentDevice];
  id v2 = [v1 userInterfaceIdiom];

  id v3 = [self defaultMetrics];
  if (v2 == (id)6)
  {
    [v3 scaledValueForValue:88.0];
LABEL_7:

    return;
  }
  if (*(void *)(v0 + 8))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    double v4 = 76.0;
    if (v5) {
      double v4 = 70.0;
    }
    [v3 scaledValueForValue:v4];
    goto LABEL_7;
  }
  type metadata accessor for ColorPickerState();
  sub_100045D68((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  EnvironmentObject.error()();
  __break(1u);
}

uint64_t sub_100043EAC()
{
  sub_100019B9C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v5;
}

uint64_t sub_1000440A4@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ColorSlider(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 8)) {
    goto LABEL_10;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v14;
  uint64_t v8 = v15;
  uint64_t v9 = v16;
  uint64_t v10 = v17;
  int v11 = v18;
  sub_100045B84(a1, (uint64_t)v6, type metadata accessor for ColorSlider);
  if (v11 != 2) {
    goto LABEL_5;
  }
  if (!*((void *)v6 + 1))
  {
LABEL_10:
    type metadata accessor for ColorPickerState();
    sub_100045D68((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    EnvironmentObject.error()();
    __break(1u);
    JUMPOUT(0x1000442DCLL);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v14;
  uint64_t v8 = v15;
  uint64_t v9 = v16;
  uint64_t v10 = v17;
LABEL_5:
  uint64_t result = sub_100045DB8((uint64_t)v6, type metadata accessor for ColorSlider);
  switch(*(unsigned char *)a1)
  {
    case 1:
      uint64_t v7 = v8;
      break;
    case 2:
      uint64_t v7 = v9;
      break;
    case 3:
      uint64_t v7 = v10;
      break;
    default:
      break;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_1000442EC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for ColorSlider(0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a4 + 8)) {
    goto LABEL_13;
  }
  uint64_t v9 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = v18;
  uint64_t v10 = v19;
  uint64_t v13 = v20;
  uint64_t v12 = v21;
  int v14 = v22;
  sub_100045B84(a4, (uint64_t)v8, type metadata accessor for ColorSlider);
  if (v14 == 2)
  {
    if (*((void *)v8 + 1))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v11 = v18;
      uint64_t v10 = v19;
      uint64_t v13 = v20;
      uint64_t v12 = v21;
      unsigned __int8 v15 = v22;
      goto LABEL_6;
    }
LABEL_13:
    type metadata accessor for ColorPickerState();
    sub_100045D68((unint64_t *)&qword_100071350, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    EnvironmentObject.error()();
    __break(1u);
    JUMPOUT(0x10004458CLL);
  }
  unsigned __int8 v15 = v14 & 1;
LABEL_6:
  sub_100045DB8((uint64_t)v8, type metadata accessor for ColorSlider);
  if (!*(void *)(a4 + 8)) {
    goto LABEL_13;
  }
  switch(*(unsigned char *)a4)
  {
    case 1:
      uint64_t v10 = v9;
      goto LABEL_11;
    case 2:
      uint64_t v13 = v9;
      goto LABEL_11;
    case 3:
      uint64_t v12 = v9;
LABEL_11:
      uint64_t v9 = v11;
      break;
    default:
      break;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = v13;
  uint64_t v21 = v12;
  unsigned __int8 v22 = v15;
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t sub_10004459C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for RoundedRectangle();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *v2;
  uint64_t v10 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v11 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v12 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  *uint64_t v8 = v9;
  v8[1] = v9;
  uint64_t v13 = a2 + *(int *)(sub_10000816C(&qword_1000735C0) + 36);
  sub_100045B84((uint64_t)v8, v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v13 + *(int *)(sub_10000816C(&qword_1000716A8) + 36)) = 256;
  uint64_t v14 = sub_10000816C(&qword_1000735C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a2, a1, v14);
  return sub_100045DB8((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
}

uint64_t sub_100044724@<X0>(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = static HorizontalAlignment.center.getter();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v6 = sub_10000816C(&qword_100073860);
  return sub_100044780(a2, a1, a3 + *(int *)(v6 + 44));
}

uint64_t sub_100044780@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v5 = type metadata accessor for GeometryProxy();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = type metadata accessor for OpacityBackground(0);
  uint64_t v24 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v24 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10000816C(&qword_100073868);
  uint64_t v11 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v13 = (char *)&KeyPath - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = GeometryProxy.size.getter();
  double v16 = v15 / *a1;
  if ((~*(void *)&v16 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v16 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v16 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v17 = (uint64_t)v16;
  if ((uint64_t)v16 <= 2) {
    uint64_t v17 = 2;
  }
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    goto LABEL_12;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v27 = 0;
    uint64_t v28 = v19;
    uint64_t KeyPath = swift_getKeyPath();
    sub_100045B84((uint64_t)a1, (uint64_t)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&KeyPath - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v5);
    unint64_t v20 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    unint64_t v21 = (v9 + *(unsigned __int8 *)(v6 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v22 = swift_allocObject();
    sub_1000456AC((uint64_t)v10, v22 + v20, type metadata accessor for OpacityBackground);
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v22 + v21, (char *)&KeyPath - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    sub_10000816C(&qword_1000720E0);
    sub_10000816C(&qword_100073870);
    sub_100023608();
    sub_10000CC70(&qword_100073878, &qword_100073870);
    ForEach<>.init(_:id:content:)();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(v26, v13, v25);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_100044B1C@<X0>(uint64_t *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  *(void *)a3 = static VerticalAlignment.center.getter();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v6 = sub_10000816C(&qword_100073880);
  return sub_100044B80(a2, v5, a3 + *(int *)(v6 + 44));
}

uint64_t sub_100044B80@<X0>(double *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OpacityBackground(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = sub_10000816C(&qword_100073888);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = GeometryProxy.size.getter();
  double v15 = v14 / *a1;
  if ((~*(void *)&v15 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v15 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v16 = (uint64_t)v15;
  if ((uint64_t)v15 <= 2) {
    uint64_t v16 = 2;
  }
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    goto LABEL_12;
  }
  if ((v18 & 0x8000000000000000) == 0)
  {
    v21[0] = 0;
    v21[1] = v18;
    swift_getKeyPath();
    sub_100045B84((uint64_t)a1, (uint64_t)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
    unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v20 = swift_allocObject();
    sub_1000456AC((uint64_t)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, type metadata accessor for OpacityBackground);
    *(void *)(v20 + ((v8 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
    sub_10000816C(&qword_1000720E0);
    sub_10000816C(&qword_100073890);
    sub_100023608();
    sub_100048A9C();
    ForEach<>.init(_:id:content:)();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v12, v9);
  }
LABEL_13:
  __break(1u);
  return result;
}

double sub_100044E44@<D0>(void *a1@<X0>, char a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v4 = sub_100044EE4(a2, *a1);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  *(void *)a3 = v4;
  *(_WORD *)(a3 + 8) = 256;
  *(void *)(a3 + 16) = v6;
  *(unsigned char *)(a3 + 24) = v7;
  *(void *)(a3 + 32) = v8;
  *(unsigned char *)(a3 + 40) = v9;
  double result = *(double *)&v10;
  *(_OWORD *)(a3 + 48) = v10;
  return result;
}

uint64_t sub_100044EE4(char a1, char a2)
{
  uint64_t v4 = type metadata accessor for ColorScheme();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  long long v10 = (char *)&v14 - v9;
  type metadata accessor for OpacityBackground(0);
  sub_1000182C0((uint64_t)v10);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.dark(_:), v4);
  char v11 = static ColorScheme.== infix(_:_:)();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  if (v11)
  {
    uint64_t result = static Color.black.getter();
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t result = static Color.white.getter();
    if (a2)
    {
LABEL_3:
      if ((a1 & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  if (a1) {
    return result;
  }
LABEL_4:
  swift_release();
  return swift_retain();
}

uint64_t sub_100045070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v16[0] = a1;
  v16[1] = a2;
  uint64_t v2 = sub_10000816C(&qword_1000738F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000816C(&qword_1000738F8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000816C(&qword_100073900);
  __chkstk_darwin(v9);
  char v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [self currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  if (v13 == (id)6)
  {
    v14(v11, (char *)v16[0], v2);
    *(void *)&v11[*(int *)(v9 + 36)] = 0x3FC999999999999ALL;
    sub_10000C800((uint64_t)v11, (uint64_t)v8, &qword_100073900);
    swift_storeEnumTagMultiPayload();
    sub_100048D58();
    sub_10000CC70(&qword_100073910, &qword_1000738F0);
    _ConditionalContent<>.init(storage:)();
    return sub_10000C8F8((uint64_t)v11, &qword_100073900);
  }
  else
  {
    v14(v5, (char *)v16[0], v2);
    v14(v8, v5, v2);
    swift_storeEnumTagMultiPayload();
    sub_100048D58();
    sub_10000CC70(&qword_100073910, &qword_1000738F0);
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_100045374@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_100045B84(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1000456AC((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for OpacityBackground);
  *a2 = sub_100048578;
  a2[1] = (uint64_t (*)(uint64_t))v7;
  return result;
}

unint64_t sub_100045488()
{
  unint64_t result = qword_1000734C8;
  if (!qword_1000734C8)
  {
    sub_10000CA7C(&qword_1000734B0);
    sub_10000CC70(&qword_100071B00, &qword_100071B08);
    sub_10000CC70(&qword_1000734D0, &qword_1000734D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000734C8);
  }
  return result;
}

uint64_t type metadata accessor for CPSlider(uint64_t a1)
{
  return sub_1000473C0(a1, (uint64_t *)&unk_100073568);
}

uint64_t sub_100045578()
{
  id v1 = (int *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[8];
  sub_10000816C(&qword_100071570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000456AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100045718@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000440A4(v4, a1);
}

uint64_t sub_100045790(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000442EC(a1, v4, v5, v6);
}

uint64_t sub_100045808()
{
  return sub_1000458E0(type metadata accessor for ColorSlider, &qword_100071570, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10004583C(double *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v4 = (unsigned __int8 *)(v1
                         + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_100043884(a1, v4);
}

uint64_t sub_1000458AC()
{
  return sub_1000458E0(type metadata accessor for ColorSlider, &qword_100071570, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_1000458E0(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (int *)(a1(0) - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v7 + 16) & ~v7;
  uint64_t v9 = *(void *)(*(void *)v6 + 64);
  swift_release();
  uint64_t v10 = v3 + v8 + v6[8];
  sub_10000816C(a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = a3(0);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v3, v8 + v9, v7 | 7);
}

uint64_t sub_100045A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v8 = (unsigned __int8 *)(v3
                         + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));

  return sub_1000439F0(a1, a2, v8, a3);
}

uint64_t sub_100045A98()
{
  return sub_1000458E0(type metadata accessor for ColorSlider, &qword_100071570, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_100045ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v14 = (unsigned __int8 *)(v6
                          + ((*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)));

  return sub_100043B70(a1, a2, a3, a4, a5, a6, v14);
}

uint64_t sub_100045B84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100045BEC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100045C80(uint64_t a1)
{
  return a1;
}

uint64_t sub_100045D18()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100045D68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100045DB8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for IntegerSliderControlStyle()
{
  return &type metadata for IntegerSliderControlStyle;
}

uint64_t _s20ColorPickerUIService25IntegerSliderControlStyleVwxx_0()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t _s20ColorPickerUIService25IntegerSliderControlStyleVwcp_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *_s20ColorPickerUIService25IntegerSliderControlStyleVwca_0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s20ColorPickerUIService25IntegerSliderControlStyleVwta_0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t _s20ColorPickerUIService25IntegerSliderControlStyleVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100046008(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PercentageSliderControlStyle()
{
  return &type metadata for PercentageSliderControlStyle;
}

ValueMetadata *type metadata accessor for ColorSlider.PlatformBasedShapeModifier()
{
  return &type metadata for ColorSlider.PlatformBasedShapeModifier;
}

void *sub_100046074(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v7;
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    uint64_t v9 = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (void *)(a1 + v10);
    id v12 = (uint64_t *)((char *)a2 + v10);
    *(void *)(a1 + 40) = v9;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_10000816C(&qword_100071DC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 32);
    uint64_t v16 = (void *)((char *)v4 + v15);
    BOOL v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    *uint64_t v16 = v18;
    v16[1] = v19;
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000461F0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1000462C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *(void *)(a1 + 40) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = type metadata accessor for LayoutDirection();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    *uint64_t v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 32);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  *uint64_t v14 = v16;
  v14[1] = v17;
  swift_retain();
  return a1;
}

uint64_t sub_1000463F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_10000C8F8(a1 + v6, &qword_100071DC0);
    sub_10000816C(&qword_100071DC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  swift_retain();
  swift_release();
  *(void *)(v11 + 8) = *(void *)(v12 + 8);
  return a1;
}

uint64_t sub_100046578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for LayoutDirection();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_100046688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_10000C8F8(a1 + v6, &qword_100071DC0);
    uint64_t v9 = sub_10000816C(&qword_100071DC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (void *)(a2 + v11);
  *(void *)(a1 + v11) = *v13;
  swift_release();
  *(void *)(v12 + 8) = v13[1];
  return a1;
}

uint64_t sub_1000467F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004680C);
}

uint64_t sub_10004680C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10000816C(&qword_100073508);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000468C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000468D4);
}

uint64_t sub_1000468D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10000816C(&qword_100073508);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100046980()
{
  sub_10004830C(319, (unint64_t *)&unk_100073578, (void (*)(uint64_t))&type metadata accessor for LayoutDirection);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100046A50()
{
  return sub_10000CC70(&qword_1000735B8, &qword_1000734A0);
}

uint64_t sub_100046A8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100046AA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100046AC8(uint64_t a1)
{
  return sub_1000485A4(a1, type metadata accessor for CPSlider, (uint64_t (*)(uint64_t, uint64_t))sub_10003F628);
}

unint64_t sub_100046AF4()
{
  unint64_t result = qword_1000735F8;
  if (!qword_1000735F8)
  {
    sub_10000CA7C(&qword_1000735F0);
    sub_10000CC70(&qword_100073600, &qword_100073608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000735F8);
  }
  return result;
}

unint64_t sub_100046B94()
{
  unint64_t result = qword_100073610;
  if (!qword_100073610)
  {
    sub_10000CA7C(&qword_1000735D0);
    sub_100046AF4();
    sub_100045D68((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073610);
  }
  return result;
}

uint64_t sub_100046C44()
{
  uint64_t v1 = type metadata accessor for CPSlider(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100046D94(uint64_t a1)
{
  return sub_100047070(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000412A0);
}

uint64_t sub_100046DAC()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for CPSlider(0);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v10 = v0 + v8 + *(int *)(v6 + 28);
  sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v8 + v9, v3 | v7 | 7);
}

uint64_t sub_100046F80()
{
  type metadata accessor for GeometryProxy();
  type metadata accessor for CPSlider(0);

  return sub_100041128();
}

uint64_t sub_100047058(uint64_t a1)
{
  return sub_100047070(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10004124C);
}

uint64_t sub_100047070(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for CPSlider(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t type metadata accessor for PositionModifier(uint64_t a1)
{
  return sub_1000473C0(a1, qword_100073760);
}

unint64_t sub_100047114()
{
  unint64_t result = qword_1000736A8;
  if (!qword_1000736A8)
  {
    sub_10000CA7C(&qword_100073668);
    sub_1000471B4();
    sub_10000CC70(&qword_1000736D0, &qword_1000736A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000736A8);
  }
  return result;
}

unint64_t sub_1000471B4()
{
  unint64_t result = qword_1000736B0;
  if (!qword_1000736B0)
  {
    sub_10000CA7C(&qword_100073660);
    sub_100047254();
    sub_10000CC70(&qword_1000736C8, &qword_100073680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000736B0);
  }
  return result;
}

unint64_t sub_100047254()
{
  unint64_t result = qword_1000736B8;
  if (!qword_1000736B8)
  {
    sub_10000CA7C(&qword_100073658);
    sub_10000CC70(&qword_1000736C0, &qword_100073650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000736B8);
  }
  return result;
}

unint64_t sub_1000472F4()
{
  unint64_t result = qword_1000736E0;
  if (!qword_1000736E0)
  {
    sub_10000CA7C(&qword_100073630);
    sub_100027540();
    sub_100045D68(&qword_1000736E8, (void (*)(uint64_t))type metadata accessor for PositionModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000736E0);
  }
  return result;
}

uint64_t type metadata accessor for OpacityBackground(uint64_t a1)
{
  return sub_1000473C0(a1, qword_1000737F8);
}

uint64_t sub_1000473C0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100047400(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    swift_retain();
    swift_retain();
    sub_10000816C(&qword_100071DC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100047530(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for LayoutDirection();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000475F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  swift_retain();
  swift_retain();
  sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for LayoutDirection();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1000476D0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_10000C8F8((uint64_t)a1 + v6, &qword_100071DC0);
    sub_10000816C(&qword_100071DC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000477F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_10000816C(&qword_100071DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for LayoutDirection();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1000478D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_10000C8F8(a1 + v6, &qword_100071DC0);
    uint64_t v9 = sub_10000816C(&qword_100071DC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1000479F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100047A08);
}

uint64_t sub_100047A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000480CC(a1, a2, a3, &qword_100073508);
}

uint64_t sub_100047A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100047A28);
}

uint64_t sub_100047A28(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10000816C(&qword_100073508);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100047AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *sub_100047B04(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    sub_10000816C(&qword_100071B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100047C24(uint64_t a1, uint64_t a2)
{
  return sub_100047C44(a1, a2, &qword_100071B20, (uint64_t (*)(void))&type metadata accessor for ColorScheme);
}

uint64_t sub_100047C44(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  swift_release();
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  sub_10000816C(a3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = a4(0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

void *sub_100047D10(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_100047DD8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_10000C8F8((uint64_t)a1 + v6, &qword_100071B20);
    sub_10000816C(&qword_100071B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_100047ED4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_100047FA8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_10000C8F8((uint64_t)a1 + v6, &qword_100071B20);
    uint64_t v9 = sub_10000816C(&qword_100071B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1000480AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000480C0);
}

uint64_t sub_1000480C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000480CC(a1, a2, a3, &qword_100071FF8);
}

uint64_t sub_1000480CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v5 = *(void *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF) {
      LODWORD(v5) = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_10000816C(a4);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10004817C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100048190);
}

uint64_t sub_100048190(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10000816C(&qword_100071FF8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10004823C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100048274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, void (*a7)(uint64_t))
{
  sub_10004830C(319, a6, a7);
  if (v7 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10004830C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Environment.Content();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_100048364()
{
  unint64_t result = qword_100073838;
  if (!qword_100073838)
  {
    sub_10000CA7C(&qword_1000735C0);
    sub_10000CC70(&qword_100073840, &qword_1000735C8);
    sub_10000CC70(&qword_1000716C8, &qword_1000716A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073838);
  }
  return result;
}

unint64_t sub_10004842C()
{
  unint64_t result = qword_100073848;
  if (!qword_100073848)
  {
    sub_10000CA7C(&qword_1000735E0);
    sub_10000CA7C(&qword_1000735D0);
    sub_100046B94();
    swift_getOpaqueTypeConformance2();
    sub_100045D68((unint64_t *)&qword_1000717D0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073848);
  }
  return result;
}

uint64_t sub_10004850C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100048528()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100048544()
{
  return sub_1000458E0(type metadata accessor for OpacityBackground, &qword_100071B20, (uint64_t (*)(void))&type metadata accessor for ColorScheme);
}

uint64_t sub_100048578(uint64_t a1)
{
  return sub_1000485A4(a1, type metadata accessor for OpacityBackground, (uint64_t (*)(uint64_t, uint64_t))sub_100044724);
}

uint64_t sub_1000485A4(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t sub_10004863C()
{
  uint64_t v1 = (int *)(type metadata accessor for OpacityBackground(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = type metadata accessor for GeometryProxy();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  swift_release();
  uint64_t v9 = v0 + v3 + v1[8];
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v2 | v7 | 7;
  uint64_t v12 = (v3 + v4 + v7) & ~v7;
  uint64_t v13 = v12 + v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v12, v5);

  return _swift_deallocObject(v0, v13, v11);
}

uint64_t sub_1000487E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for OpacityBackground(0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  type metadata accessor for GeometryProxy();

  return sub_100044B1C(a1, (double *)(v2 + v6), a2);
}

uint64_t sub_1000488CC()
{
  uint64_t v1 = (int *)(type metadata accessor for OpacityBackground(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + v1[8];
  sub_10000816C(&qword_100071B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

double sub_1000489F0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for OpacityBackground(0) - 8);
  uint64_t v6 = *(void *)(v2
                 + ((*(void *)(v5 + 64)
                   + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
                   + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100044E44(a1, v6, a2);
}

unint64_t sub_100048A9C()
{
  unint64_t result = qword_100073898;
  if (!qword_100073898)
  {
    sub_10000CA7C(&qword_100073890);
    sub_10000CC70(&qword_1000738A0, &qword_1000738A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073898);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpacityBackground.PlatformBasedOpacityModifier()
{
  return &type metadata for OpacityBackground.PlatformBasedOpacityModifier;
}

unint64_t sub_100048B50()
{
  unint64_t result = qword_1000738B0;
  if (!qword_1000738B0)
  {
    sub_10000CA7C(&qword_100073858);
    sub_10000CC70(&qword_1000738B8, &qword_100073850);
    sub_100048BF0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000738B0);
  }
  return result;
}

unint64_t sub_100048BF0()
{
  unint64_t result = qword_1000738C0;
  if (!qword_1000738C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000738C0);
  }
  return result;
}

unint64_t sub_100048C48()
{
  unint64_t result = qword_1000738C8;
  if (!qword_1000738C8)
  {
    sub_10000CA7C(&qword_1000738D0);
    sub_10000CC70(&qword_1000738D8, &qword_1000738E0);
    sub_100048CE8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000738C8);
  }
  return result;
}

unint64_t sub_100048CE8()
{
  unint64_t result = qword_1000738E8;
  if (!qword_1000738E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000738E8);
  }
  return result;
}

uint64_t sub_100048D3C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100048D58()
{
  unint64_t result = qword_100073908;
  if (!qword_100073908)
  {
    sub_10000CA7C(&qword_100073900);
    sub_10000CC70(&qword_100073910, &qword_1000738F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073908);
  }
  return result;
}

unint64_t sub_100048DFC()
{
  unint64_t result = qword_100073918;
  if (!qword_100073918)
  {
    sub_10000CA7C(&qword_100073920);
    sub_100048D58();
    sub_10000CC70(&qword_100073910, &qword_1000738F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100073918);
  }
  return result;
}

uint64_t sub_100048EA8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_100049F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 eyedropperDidSelectColor:a2];
    uint64_t v3 = *(void **)(a1 + 32);
  }

  return _[v3 eyedropperDidDismiss];
}

float sub_10004A1F0(float *a1, float a2)
{
  float v2 = a1[1];
  float v3 = *a1 * 3.0;
  float v4 = (float)((float)(a1[2] - *a1) * 3.0) - v3;
  float v5 = (float)(1.0 - v3) - v4;
  int v6 = 8;
  float v7 = a2;
  while (1)
  {
    float v8 = v7 * (float)(v3 + (float)(v7 * (float)(v4 + (float)(v5 * v7))));
    if (vabds_f32(v8, a2) < 0.00001) {
      break;
    }
    float v9 = v3 + (float)(v7 * (float)((float)(v4 + v4) + (float)((float)(v5 * 3.0) * v7)));
    if (fabsf(v9) >= 0.000001)
    {
      float v7 = v7 - (float)((float)(v8 - a2) / v9);
      if (--v6) {
        continue;
      }
    }
    float v7 = 0.0;
    if (a2 >= 0.0)
    {
      float v7 = 1.0;
      if (a2 <= 1.0)
      {
        float v10 = 0.0;
        float v11 = 1.0;
        int v12 = -1025;
        float v7 = a2;
        do
        {
          if (__CFADD__(v12++, 1)) {
            break;
          }
          float v14 = v7 * (float)(v3 + (float)(v7 * (float)(v4 + (float)(v5 * v7))));
          if (vabds_f32(v14, a2) < 0.00001) {
            break;
          }
          if ((float)(v14 - a2) >= 0.0) {
            float v11 = v7;
          }
          else {
            float v10 = v7;
          }
          float v7 = (float)(v11 - v10) * 0.5 + v10;
        }
        while (v10 < v11);
      }
    }
    break;
  }
  float v15 = (float)((float)(a1[3] - v2) * 3.0) - (float)(v2 * 3.0);
  return v7
       * (float)((float)(v2 * 3.0)
               + (float)(v7 * (float)(v15 + (float)((float)((float)(1.0 - (float)(v2 * 3.0)) - v15) * v7))));
}

float sub_10004A348(float *a1, float a2)
{
  float v2 = *a1;
  float v3 = a1[1];
  float v4 = v3 * 3.0;
  float v5 = (float)((float)(a1[3] - v3) * 3.0) - (float)(v3 * 3.0);
  float v6 = (float)(1.0 - v4) - v5;
  int v7 = 8;
  float v8 = a2;
  while (1)
  {
    float v9 = v8 * (float)(v4 + (float)(v8 * (float)(v5 + (float)(v6 * v8))));
    if (vabds_f32(v9, a2) < 0.00001) {
      break;
    }
    float v10 = v4 + (float)(v8 * (float)((float)(v5 + v5) + (float)((float)(v6 * 3.0) * v8)));
    if (fabsf(v10) >= 0.000001)
    {
      float v8 = v8 - (float)((float)(v9 - a2) / v10);
      if (--v7) {
        continue;
      }
    }
    float v8 = 0.0;
    if (a2 >= 0.0)
    {
      float v8 = 1.0;
      if (a2 <= 1.0)
      {
        float v11 = 0.0;
        float v12 = 1.0;
        int v13 = -1025;
        float v8 = a2;
        do
        {
          if (__CFADD__(v13++, 1)) {
            break;
          }
          float v15 = v8 * (float)(v4 + (float)(v8 * (float)(v5 + (float)(v6 * v8))));
          if (vabds_f32(v15, a2) < 0.00001) {
            break;
          }
          if ((float)(v15 - a2) >= 0.0) {
            float v12 = v8;
          }
          else {
            float v11 = v8;
          }
          float v8 = (float)(v12 - v11) * 0.5 + v11;
        }
        while (v11 < v12);
      }
    }
    break;
  }
  float v16 = (float)((float)(a1[2] - v2) * 3.0) - (float)(v2 * 3.0);
  return v8
       * (float)((float)(v2 * 3.0)
               + (float)(v8 * (float)(v16 + (float)((float)((float)(1.0 - (float)(v2 * 3.0)) - v16) * v8))));
}

__n64 sub_10004A4A0(double a1)
{
  float v1 = 0.5 - *((float *)&a1 + 1) * 0.5;
  if (v1 >= 0.16667)
  {
    double v3 = v1;
    if (v1 >= 0.33333)
    {
      if (v3 >= 0.500000015)
      {
        if (v1 >= 0.66667)
        {
          double v8 = v3 * 6.0;
          if (v3 >= 0.833333358)
          {
            float v10 = 1.0 - (v8 + -5.0);
            sub_10004A1F0(flt_100053950, v10);
            return (__n64)COERCE_UNSIGNED_INT(1.0);
          }
          else
          {
            float v9 = v8 + -4.0;
            result.n64_f32[0] = sub_10004A1F0(flt_100053950, v9);
            result.n64_u32[1] = 0;
          }
        }
        else
        {
          float v6 = 1.0 - (v3 * 6.0 + -3.0);
          float v7 = sub_10004A1F0(flt_100053950, v6);
          result.n64_u32[0] = 0;
          result.n64_f32[1] = v7;
        }
      }
      else
      {
        float v5 = v3 * 6.0 + -2.0;
        sub_10004A1F0(flt_100053950, v5);
        result.n64_u32[0] = 0;
        result.n64_u32[1] = 1.0;
      }
    }
    else
    {
      float v4 = 1.0 - (v3 * 6.0 + -1.0);
      result.n64_f32[0] = sub_10004A1F0(flt_100053950, v4);
      result.n64_u32[1] = 1.0;
    }
  }
  else
  {
    return (__n64)__PAIR64__(COERCE_UNSIGNED_INT(sub_10004A1F0(flt_100053950, v1 * 6.0)), 1.0);
  }
  return result;
}

float sub_10004A670(__n128 a1)
{
  if (a1.n128_f32[0] >= a1.n128_f32[1] && a1.n128_f32[0] >= a1.n128_f32[2])
  {
    float v4 = (float)(a1.n128_f32[1] - a1.n128_f32[2]) / (float)(a1.n128_f32[0] - fminf(a1.n128_f32[1], a1.n128_f32[2]));
    goto LABEL_17;
  }
  if (a1.n128_f32[1] >= a1.n128_f32[0] && a1.n128_f32[1] >= a1.n128_f32[2])
  {
    float v5 = (float)(a1.n128_f32[2] - a1.n128_f32[0]) / (float)(a1.n128_f32[1] - fminf(a1.n128_f32[0], a1.n128_f32[2]));
    float v6 = 2.0;
LABEL_16:
    float v4 = v5 + v6;
LABEL_17:
    while (v4 < 0.0)
      float v4 = v4 + 6.0;
    return v4 * 60.0;
  }
  float v4 = 0.0;
  if (a1.n128_f32[2] >= a1.n128_f32[0] && a1.n128_f32[2] >= a1.n128_f32[1])
  {
    float v5 = (float)(a1.n128_f32[0] - a1.n128_f32[1]) / (float)(a1.n128_f32[2] - fminf(a1.n128_f32[0], a1.n128_f32[1]));
    float v6 = 4.0;
    goto LABEL_16;
  }
  return v4 * 60.0;
}

float sub_10004A70C(__n128 a1)
{
  float v1 = sub_10004A670(a1);
  *(void *)&long long v2 = 0;
  int v3 = 100;
  float v4 = 0.5;
  while (1)
  {
    long long v10 = v2;
    v5.n128_u64[0] = sub_10004A4A0(*(double *)&v2).n64_u64[0];
    float v6 = sub_10004A670(v5);
    if (vabds_f32(v1, v6) < 0.001) {
      break;
    }
    long long v7 = v10;
    if (v1 >= v6) {
      float v8 = -v4;
    }
    else {
      float v8 = v4;
    }
    *((float *)&v7 + 1) = *((float *)&v10 + 1) + v8;
    float v4 = v4 * 0.5;
    --v3;
    long long v2 = v7;
    if (!v3) {
      return *((float *)&v2 + 1);
    }
  }
  DWORD1(v2) = DWORD1(v10);
  return *((float *)&v2 + 1);
}

void sub_10004AAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004ABC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004ADAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004AE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004AEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t start(int a1, char **a2)
{
  __n128 v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  float v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t CharacterSet.isSuperset(of:)()
{
  return CharacterSet.isSuperset(of:)();
}

uint64_t static CharacterSet.whitespaces.getter()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t static CharacterSet.decimalDigits.getter()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t CharacterSet.union(_:)()
{
  return CharacterSet.union(_:)();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(item:section:)()
{
  return IndexPath.init(item:section:)();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t static Selector.== infix(_:_:)()
{
  return static Selector.== infix(_:_:)();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)CGFloat._bridgeToObjectiveC()();
}

uint64_t static CGFloat._forceBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t type metadata accessor for UIPointerShape()
{
  return type metadata accessor for UIPointerShape();
}

uint64_t type metadata accessor for UIPointerEffect()
{
  return type metadata accessor for UIPointerEffect();
}

uint64_t UIBackgroundConfiguration.backgroundColor.setter()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t NSDiffableDataSourceSnapshot.appendItems(_:toSection:)()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.appendSections(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
}

uint64_t NSDiffableDataSourceSnapshot.itemIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers.getter();
}

uint64_t NSDiffableDataSourceSnapshot.init()()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.snapshot()()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
}

uint64_t static UIShape.circle.getter()
{
  return static UIShape.circle.getter();
}

uint64_t type metadata accessor for UIShape()
{
  return type metadata accessor for UIShape();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
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

uint64_t Publisher.combineLatest<A>(_:)()
{
  return Publisher.combineLatest<A>(_:)();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t DragGesture.Value.location.getter()
{
  return DragGesture.Value.location.getter();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t Transaction.disablesAnimations.getter()
{
  return Transaction.disablesAnimations.getter();
}

uint64_t Transaction.animation.setter()
{
  return Transaction.animation.setter();
}

uint64_t ScaledMetric.init(wrappedValue:)()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t ScaledMetric.wrappedValue.getter()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledMetric()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t GeometryProxy.subscript.getter()
{
  return GeometryProxy.subscript.getter();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t DynamicTypeSize.isAccessibilitySize.getter()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t ModifiedContent<>.accessibility(label:)()
{
  return ModifiedContent<>.accessibility(label:)();
}

uint64_t ModifiedContent<>.accessibilityInputLabels<A>(_:)()
{
  return ModifiedContent<>.accessibilityInputLabels<A>(_:)();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t static ContentShapeKinds.dragPreview.getter()
{
  return static ContentShapeKinds.dragPreview.getter();
}

uint64_t type metadata accessor for ContentShapeKinds()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t EnvironmentObject.projectedValue.getter()
{
  return EnvironmentObject.projectedValue.getter();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.Wrapper.subscript.getter()
{
  return EnvironmentObject.Wrapper.subscript.getter();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.menuTitleVisibility.getter()
{
  return EnvironmentValues.menuTitleVisibility.getter();
}

uint64_t EnvironmentValues.menuTitleVisibility.setter()
{
  return EnvironmentValues.menuTitleVisibility.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.isSelected.getter()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t static AccessibilityTraits.allowsDirectInteraction.getter()
{
  return static AccessibilityTraits.allowsDirectInteraction.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t dispatch thunk of UIHostingController.sizingOptions.setter()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t UIHostingController.safeAreaRegions.setter()
{
  return UIHostingController.safeAreaRegions.setter();
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

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for LocalCoordinateSpace()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t SegmentedPickerStyle.init()()
{
  return SegmentedPickerStyle.init()();
}

uint64_t type metadata accessor for SegmentedPickerStyle()
{
  return type metadata accessor for SegmentedPickerStyle();
}

uint64_t static CoordinateSpaceProtocol<>.local.getter()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t type metadata accessor for UIViewRepresentableContext()
{
  return type metadata accessor for UIViewRepresentableContext();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t type metadata accessor for AccessibilityAdjustmentDirection()
{
  return type metadata accessor for AccessibilityAdjustmentDirection();
}

uint64_t static UIHostingControllerSizingOptions.preferredContentSize.getter()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t type metadata accessor for UIHostingControllerSizingOptions()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t Menu.init(content:label:)()
{
  return Menu.init(content:label:)();
}

Swift::Void __swiftcall Path.closeSubpath()()
{
}

uint64_t Path.move(to:)()
{
  return Path.move(to:)();
}

uint64_t Path.addArc(tangent1End:tangent2End:radius:transform:)()
{
  return Path.addArc(tangent1End:tangent2End:radius:transform:)();
}

uint64_t Path.addLine(to:)()
{
  return Path.addLine(to:)();
}

uint64_t Path.init()()
{
  return Path.init()();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.pickerStyle<A>(_:)()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t View.accessibility(activationPoint:)()
{
  return View.accessibility(activationPoint:)();
}

uint64_t View.accessibility(label:)()
{
  return View.accessibility(label:)();
}

uint64_t View.accessibility(value:)()
{
  return View.accessibility(value:)();
}

uint64_t View.accessibility(hidden:)()
{
  return View.accessibility(hidden:)();
}

uint64_t View.accessibility(addTraits:)()
{
  return View.accessibility(addTraits:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.overrideMenuTitle(_:)()
{
  return View.overrideMenuTitle(_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.accessibilityAdjustableAction(_:)()
{
  return View.accessibilityAdjustableAction(_:)();
}

uint64_t View.onDrag(_:)()
{
  return View.onDrag(_:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Shape.layoutDirectionBehavior.getter()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t static Shape.role.getter()
{
  return static Shape.role.getter();
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

uint64_t static Anchor.Source<A>.bounds.getter()
{
  return static Anchor.Source<A>.bounds.getter();
}

uint64_t Picker.init(selection:label:content:)()
{
  return Picker.init(selection:label:content:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.subscript.getter()
{
  return Binding.subscript.getter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t Binding.init(get:set:)()
{
  return Binding.init(get:set:)();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t type metadata accessor for Capsule()
{
  return type metadata accessor for Capsule();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t static Alignment.topLeading.getter()
{
  return static Alignment.topLeading.getter();
}

uint64_t static Alignment.top.getter()
{
  return static Alignment.top.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t AnyLayout.init<A>(_:)()
{
  return AnyLayout.init<A>(_:)();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t static UnitPoint.trailing.getter()
{
  return static UnitPoint.trailing.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t BidirectionalCollection<>.difference<A>(from:)()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
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

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
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

{
  String.append(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t CGColorRef.components.getter()
{
  return CGColorRef.components.getter();
}

uint64_t UIHoverStyle.init(shape:)()
{
  return UIHoverStyle.init(shape:)();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t UIPointerStyle.init(effect:shape:)()
{
  return UIPointerStyle.init(effect:shape:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t UIEditMenuConfiguration.init(identifier:sourcePoint:)()
{
  return UIEditMenuConfiguration.init(identifier:sourcePoint:)();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UIButton.Configuration.preferredSymbolConfigurationForImage.setter()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t UIButton.Configuration.background.modify()
{
  return UIButton.Configuration.background.modify();
}

uint64_t UIButton.Configuration.contentInsets.getter()
{
  return UIButton.Configuration.contentInsets.getter();
}

uint64_t UIButton.Configuration.image.setter()
{
  return UIButton.Configuration.image.setter();
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

uint64_t UIButton.pointerStyleProvider.setter()
{
  return UIButton.pointerStyleProvider.setter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t StringProtocol.localizedUppercase.getter()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.intersection(_:)()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t CollectionDifference.insertions.getter()
{
  return CollectionDifference.insertions.getter();
}

uint64_t CollectionDifference.removals.getter()
{
  return CollectionDifference.removals.getter();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  return _CGColorGetAlpha(color);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return _CGColorSpaceCopyName(space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return _CGColorSpaceGetName(space);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return _CGColorTransformConvertColorComponents();
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

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CUIGetDeviceArtworkDisplayGamut()
{
  return _CUIGetDeviceArtworkDisplayGamut();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UISCreateCachedColorTransform()
{
  return _UISCreateCachedColorTransform();
}

uint64_t UISizeRoundToViewScale()
{
  return _UISizeRoundToViewScale();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t lroundf(float a1)
{
  return _lroundf(a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutorelease(id a1)
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return _[a1 _commonInit];
}

id objc_msgSend__delegate(void *a1, const char *a2, ...)
{
  return _[a1 _delegate];
}

id objc_msgSend__hostedWindowScene(void *a1, const char *a2, ...)
{
  return _[a1 _hostedWindowScene];
}

id objc_msgSend__isEmbedded(void *a1, const char *a2, ...)
{
  return _[a1 _isEmbedded];
}

id objc_msgSend__isInPopoverPresentation(void *a1, const char *a2, ...)
{
  return _[a1 _isInPopoverPresentation];
}

id objc_msgSend__pickerDidDismissEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidDismissEyedropper];
}

id objc_msgSend__pickerDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidFinish];
}

id objc_msgSend__pickerDidFloatEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidFloatEyedropper];
}

id objc_msgSend__pickerDidSelectColor_colorSpace_isVolatile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pickerDidSelectColor:colorSpace:isVolatile:");
}

id objc_msgSend__pickerDidShowEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidShowEyedropper];
}

id objc_msgSend__preferredWidth(void *a1, const char *a2, ...)
{
  return _[a1 _preferredWidth];
}

id objc_msgSend__setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 _setConfiguration:];
}

id objc_msgSend__setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 _setDelegate:];
}

id objc_msgSend__setInitialBuildingResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInitialBuildingResponder:");
}

id objc_msgSend__setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 _setPreferredContentSize:];
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTouchInsets:");
}

id objc_msgSend__updateContentViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _updateContentViewConfiguration];
}

id objc_msgSend_actionForColorPickerDidDismissEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 actionForColorPickerDidDismissEyedropper];
}

id objc_msgSend_actionForColorPickerDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 actionForColorPickerDidFinish];
}

id objc_msgSend_actionForColorPickerDidFloatEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 actionForColorPickerDidFloatEyedropper];
}

id objc_msgSend_actionForColorPickerDidSelectColor_colorSpace_isVolatile_(void *a1, const char *a2, ...)
{
  return [a1 actionForColorPickerDidSelectColor:colorSpace:isVolatile:];
}

id objc_msgSend_actionForColorPickerDidShowEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 actionForColorPickerDidShowEyedropper];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return _[a1 colorAttachments];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return _[a1 colorPixelFormat];
}

id objc_msgSend_colorWithDisplayP3Red_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithDisplayP3Red:green:blue:alpha:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return _[a1 commandBuffer];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_currentDrawable(void *a1, const char *a2, ...)
{
  return _[a1 currentDrawable];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentRenderPassDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 currentRenderPassDescriptor];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_drawPrimitives_vertexStart_vertexCount_(void *a1, const char *a2, ...)
{
  return [a1 drawPrimitives:];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 effectWithStyle:];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return _[a1 endEncoding];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_eyedropperDidSelectColor_(void *a1, const char *a2, ...)
{
  return [a1 eyedropperDidSelectColor:];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffect:];
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:sessionRole:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_initializeVertexBuffer(void *a1, const char *a2, ...)
{
  return _[a1 initializeVertexBuffer];
}

id objc_msgSend_invokeEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 invokeEyedropper];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_keyboardLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 keyboardLayoutGuide];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_mainSystem(void *a1, const char *a2, ...)
{
  return _[a1 mainSystem];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return [a1 menuWithTitle:image:identifier:options:children:];
}

id objc_msgSend_newBufferWithBytes_length_options_(void *a1, const char *a2, ...)
{
  return [a1 newBufferWithBytes:length:options:];
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return _[a1 newCommandQueue];
}

id objc_msgSend_newDefaultLibrary(void *a1, const char *a2, ...)
{
  return _[a1 newDefaultLibrary];
}

id objc_msgSend_newFunctionWithName_(void *a1, const char *a2, ...)
{
  return [a1 newFunctionWithName:];
}

id objc_msgSend_newRenderPipelineStateWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return [a1 newRenderPipelineStateWithDescriptor:error:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_presentDrawable_(void *a1, const char *a2, ...)
{
  return [a1 presentDrawable:];
}

id objc_msgSend_renderCommandEncoderWithDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 renderCommandEncoderWithDescriptor:];
}

id objc_msgSend_replaceMenuForIdentifier_withMenu_(void *a1, const char *a2, ...)
{
  return [a1 replaceMenuForIdentifier:withMenu:];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_sendAction_(void *a1, const char *a2, ...)
{
  return [a1 sendAction:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setCaptureObject_(void *a1, const char *a2, ...)
{
  return [a1 setCaptureObject:];
}

id objc_msgSend_setClearColor_(void *a1, const char *a2, ...)
{
  return [a1 setClearColor:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setContentSize:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return [a1 setDelegateClass:];
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDevice:];
}

id objc_msgSend_setFloatEyedropperOnStart_(void *a1, const char *a2, ...)
{
  return [a1 setFloatEyedropperOnStart:];
}

id objc_msgSend_setFragmentFunction_(void *a1, const char *a2, ...)
{
  return [a1 setFragmentFunction];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestsAsOpaque:];
}

id objc_msgSend_setPixelFormat_(void *a1, const char *a2, ...)
{
  return [a1 setPixelFormat:];
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredContentSize:];
}

id objc_msgSend_setRenderPipelineState_(void *a1, const char *a2, ...)
{
  return [a1 setRenderPipelineState:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsHorizontalScrollIndicator:];
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsVerticalScrollIndicator:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setVertexBuffer_offset_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 setVertexBuffer:offset:atIndex:];
}

id objc_msgSend_setVertexFunction_(void *a1, const char *a2, ...)
{
  return [a1 setVertexFunction:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_set_preferredWidth_(void *a1, const char *a2, ...)
{
  return [a1 set_preferredWidth:];
}

id objc_msgSend_setupRenderPipeline(void *a1, const char *a2, ...)
{
  return _[a1 setupRenderPipeline];
}

id objc_msgSend_sharedCaptureManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedCaptureManager];
}

id objc_msgSend_showSamplerWithSelectionHandler_(void *a1, const char *a2, ...)
{
  return [a1 showSamplerWithSelectionHandler:];
}

id objc_msgSend_startCaptureWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return [a1 startCaptureWithDescriptor:error:];
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return _[a1 stopCapture];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _[a1 system];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}