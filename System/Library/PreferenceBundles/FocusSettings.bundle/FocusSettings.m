BOOL sub_4D70(id a1, DNDMode *a2)
{
  DNDMode *v2;
  char *v3;
  unsigned __int8 v4;
  char *v5;
  BOOL v6;

  v2 = a2;
  v3 = (char *)[(DNDMode *)v2 visibility];
  v4 = +[FSUIPlatformEligibility isIntelligenceAvailable];
  v5 = (char *)[(DNDMode *)v2 semanticType];

  if (v3 == (unsigned char *)&dword_0 + 1) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  if (v5 == (unsigned char *)&dword_8 + 1) {
    return v6;
  }
  else {
    return v3 == (unsigned char *)&dword_0 + 1;
  }
}

BOOL sub_4E64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPlaceholder]) {
    BOOL v4 = [v3 semanticType] == *(id *)(a1 + 32);
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL sub_58EC(id a1, DNDMode *a2)
{
  return [(DNDMode *)a2 visibility] != (char *)&dword_0 + 1;
}

NSNumber *__cdecl sub_5910(id a1, NSNumber *a2, DNDMode *a3)
{
  BOOL v4 = a2;
  if ([(DNDMode *)a3 visibility])
  {
    v5 = v4;
  }
  else
  {
    v5 = +[NSNumber numberWithUnsignedInteger:(char *)[(NSNumber *)v4 unsignedIntegerValue] + 1];
  }
  v6 = v5;

  return v6;
}

int64_t sub_5988(id a1, DNDMode *a2, DNDMode *a3)
{
  BOOL v4 = a2;
  v5 = a3;
  if ([(DNDMode *)v4 semanticType])
  {
    if ([(DNDMode *)v5 semanticType])
    {
      unsigned int v6 = [(DNDMode *)v4 isPlaceholder];
      if (v6 == [(DNDMode *)v5 isPlaceholder])
      {
        v8 = [(DNDMode *)v4 name];
        v9 = [(DNDMode *)v5 name];
        int64_t v7 = (int64_t)[v8 localizedStandardCompare:v9];
      }
      else if ([(DNDMode *)v4 isPlaceholder])
      {
        int64_t v7 = 1;
      }
      else
      {
        int64_t v7 = -1;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

id sub_5B00(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _handleUpdatedAvailableModes:*(void *)(a1 + 40)];
}

void sub_5BB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadSpecifiers];
    id WeakRetained = v2;
  }
}

id sub_5C6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_63C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_750C(id a1)
{
  qword_23D50 = +[NSBundle bundleWithIdentifier:@"com.apple.FocusSettings"];

  _objc_release_x1();
}

void sub_7DC8(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) objectForKey:@"path"];
  if ([v10 isEqual:@"setup"])
  {
    id v2 = [*(id *)(a1 + 32) objectForKey:@"type"];
    id v3 = [v2 integerValue];

    BOOL v4 = *(void **)(a1 + 40);
    if (v3)
    {
      v5 = [v4 _configuredModeForSemanticType:v3];
      unsigned int v6 = v5;
      int64_t v7 = *(void **)(a1 + 40);
      if (v5)
      {
        v8 = [v5 modeIdentifier];
        [v7 showConfigurationForModeIdentifier:v8 animate:0];
      }
      else
      {
        [*(id *)(a1 + 40) _handleSetupRequestForSemanticType:v3];
      }
    }
    else
    {
      [v4 _presentSetupControllerForUnknownMode];
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

BOOL sub_81B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 semanticType] == *(id *)(a1 + 32) && objc_msgSend(v3, "visibility") == 0;

  return v4;
}

int64_t sub_8FFC(id a1, DNDMode *a2, DNDMode *a3)
{
  BOOL v4 = a3;
  v5 = [(DNDMode *)a2 name];
  unsigned int v6 = [(DNDMode *)v4 name];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_9234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9254(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained navigationController];
  id v3 = +[FCUICustomModeWelcomeSwiftController welcomeControllerWithAllReservedModes:*(void *)(a1 + 32)];
  [v2 pushViewController:v3 animated:1];
}

void sub_9418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9438(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_alloc((Class)DNDMode);
  id v3 = [*(id *)(a1 + 32) name];
  BOOL v4 = [*(id *)(a1 + 32) modeIdentifier];
  v5 = [*(id *)(a1 + 32) symbolImageName];
  unsigned int v6 = [*(id *)(a1 + 32) tintColorName];
  id v7 = objc_msgSend(v2, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:", v3, v4, v5, v6, objc_msgSend(*(id *)(a1 + 32), "semanticType"));

  v8 = [WeakRetained navigationController];
  uint64_t v9 = +[FCUIFocusCustomizationInvitationSwiftController welcomeControllerWithMode:v7];
  [v8 pushViewController:v9 animated:1];
}

void FCUISettingsRegisterLogging()
{
  if (qword_23D60 != -1) {
    dispatch_once(&qword_23D60, &stru_1CDD0);
  }
}

void sub_95EC(id a1)
{
  FCUILogSettings = (uint64_t)os_log_create("com.apple.focus.settings", "FocusSettings");

  _objc_release_x1();
}

uint64_t sub_9B14()
{
  return 0;
}

uint64_t sub_9B20(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v11 = (objc_class *)objc_msgSend(self, "fcui_focusSettingsLocalizationBundle");
  v15._countAndFlagsBits = a4;
  v16._countAndFlagsBits = a1;
  v16._object = a2;
  v17.value._countAndFlagsBits = a5;
  v17.value._object = a6;
  v12.super.isa = v11;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  uint64_t v13 = sub_14230(v16, v17, v12, v18, v15);

  return v13;
}

id sub_9BD4()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_9C08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FocusStatusConfigurationViewController();
  return objc_msgSendSuper2(&v2, "initWithNibName:bundle:", 0, 0);
}

uint64_t type metadata accessor for FocusStatusConfigurationViewController()
{
  return self;
}

id sub_9CB0(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void sub_9CF4()
{
}

id sub_9DAC()
{
  id v1 = v0;
  sub_142B0();
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  BOOL v4 = (char *)v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unsigned int v6 = (char *)v53 - v5;
  id v7 = (objc_class *)type metadata accessor for FocusStatusConfigurationViewController();
  v54.receiver = v1;
  v54.super_class = v7;
  objc_msgSendSuper2(&v54, "viewDidLoad");
  id v8 = [v1 navigationItem];
  uint64_t v9 = sub_9B14();
  sub_9B20(0x54535F5355434F46, (void *)0xEC00000053555441, v9, v10, 0, 0);
  swift_bridgeObjectRelease();
  NSString v11 = sub_14500();
  swift_bridgeObjectRelease();
  [v8 setTitle:v11];

  sub_142A0();
  sub_A40C((uint64_t)v6, (uint64_t)v4);
  id v12 = objc_allocWithZone((Class)sub_A470(&qword_23960));
  uint64_t v13 = (void *)sub_143E0();
  [v1 addChildViewController:v13];
  id result = [v13 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_17;
  }
  Swift::String v15 = result;
  id v16 = [self clearColor];
  [v15 setBackgroundColor:v16];

  id result = [v13 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  Swift::String_optional v17 = result;
  id result = [v1 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  Swift::String v18 = result;
  [result bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  objc_msgSend(v17, "setFrame:", v20, v22, v24, v26);
  id result = [v1 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v27 = result;
  id result = [v13 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v28 = result;
  [v27 addSubview:result];

  id result = [v13 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v29 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_A470((uint64_t *)&unk_23BD0);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_17190;
  id result = [v13 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v31 = result;
  id v32 = [result topAnchor];

  id result = [v1 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v33 = result;
  id v34 = [result topAnchor];

  id v35 = [v32 constraintEqualToAnchor:v34];
  *(void *)(v30 + 32) = v35;
  id result = [v13 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v36 = result;
  id v37 = [result leadingAnchor];

  id result = [v1 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v38 = result;
  id v39 = [result leadingAnchor];

  id v40 = [v37 constraintEqualToAnchor:v39];
  *(void *)(v30 + 40) = v40;
  id result = [v1 view];
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v41 = result;
  id v42 = [result trailingAnchor];

  id result = [v13 view];
  if (!result)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v43 = result;
  id v44 = [result trailingAnchor];

  id v45 = [v42 constraintEqualToAnchor:v44];
  *(void *)(v30 + 48) = v45;
  id result = [v1 view];
  if (!result)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v46 = result;
  id v47 = [result bottomAnchor];

  id result = [v13 view];
  if (result)
  {
    v48 = result;
    v49 = self;
    id v50 = [v48 bottomAnchor];

    id v51 = [v47 constraintEqualToAnchor:v50];
    *(void *)(v30 + 56) = v51;
    v53[1] = v30;
    sub_14590();
    sub_A4B4();
    Class isa = sub_14580().super.isa;
    swift_bridgeObjectRelease();
    [v49 activateConstraints:isa];

    [v13 didMoveToParentViewController:v1];
    return (id)sub_A4F4((uint64_t)v6);
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_A40C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_142B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_A470(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_A4B4()
{
  unint64_t result = qword_23968;
  if (!qword_23968)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_23968);
  }
  return result;
}

uint64_t sub_A4F4(uint64_t a1)
{
  uint64_t v2 = sub_142B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_A598(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_14500();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void sub_A610()
{
}

id sub_A674()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FocusStatusConfigurationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_A6AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_143C0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_A470(&qword_23998);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_CB40(v2, (uint64_t)v10, &qword_23998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_143D0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_14620();
    v14 = sub_14400();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_CBA4(0xD000000000000013, 0x800000000001A8B0, &v17);
      _os_log_impl(&dword_0, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_143B0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_A938@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_A470(&qword_23998);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_A990()
{
  return sub_14390();
}

uint64_t sub_A9B4(uint64_t a1)
{
  uint64_t v2 = sub_143D0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_143A0();
}

uint64_t sub_AA7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = swift_getKeyPath();
  sub_A470(&qword_23998);
  swift_storeEnumTagMultiPayload();
  uint64_t result = type metadata accessor for FocusCustomizationInvitationView();
  *(uint64_t *)((char *)a4 + *(int *)(result + 20)) = a1;
  uint64_t v9 = (uint64_t *)((char *)a4 + *(int *)(result + 24));
  void *v9 = a2;
  v9[1] = a3;
  return result;
}

uint64_t type metadata accessor for FocusCustomizationInvitationView()
{
  uint64_t result = qword_23E00;
  if (!qword_23E00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_AB44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_14270();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_A470(&qword_239A0);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v37 - v10;
  uint64_t v43 = sub_A470(&qword_239A8);
  __chkstk_darwin(v43);
  uint64_t v41 = (uint64_t)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_14290();
  uint64_t v13 = __chkstk_darwin(v44);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v37 - v16;
  uint64_t v18 = *(int *)(type metadata accessor for FocusCustomizationInvitationView() + 20);
  uint64_t v42 = v1;
  double v19 = *(void **)(v1 + v18);
  double v20 = (char *)[v19 semanticType];
  BOOL v21 = v20 == (unsigned char *)&dword_8 + 1 || v20 + 1 == 0;
  uint64_t v45 = v6;
  uint64_t v46 = a1;
  if (v21)
  {
    id v22 = [v19 name];
    uint64_t v23 = sub_14530();
    uint64_t v39 = v24;
    uint64_t v40 = v23;

    id v25 = [v19 symbolImageName];
    if (v25)
    {
      double v26 = v25;
      sub_14530();
    }
    id v32 = [v19 tintColorName];
    if (v32)
    {
      v33 = v32;
      sub_14530();
    }
    [v19 semanticType];
    swift_retain();
    sub_14280();
    sub_C0B0((uint64_t)v15, (uint64_t)v17, (uint64_t (*)(void))&type metadata accessor for FocusInformationView);
    sub_CAD8((uint64_t)v17, v41, (uint64_t (*)(void))&type metadata accessor for FocusInformationView);
    swift_storeEnumTagMultiPayload();
    sub_BF4C(&qword_239B0, (void (*)(uint64_t))&type metadata accessor for FocusInformationView);
    sub_BE58();
    sub_143F0();
    return sub_BF94((uint64_t)v17, (uint64_t (*)(void))&type metadata accessor for FocusInformationView);
  }
  else
  {
    id v27 = [v19 name];
    uint64_t v28 = sub_14530();
    uint64_t v39 = v29;
    uint64_t v40 = v28;

    id v30 = [v19 symbolImageName];
    if (v30)
    {
      v31 = v30;
      uint64_t v38 = sub_14530();
    }
    else
    {
      uint64_t v38 = 0;
    }
    id v35 = [v19 tintColorName];
    if (v35)
    {
      v36 = v35;
      sub_14530();
    }
    [v19 semanticType];
    swift_retain();
    sub_14260();
    sub_144A0();
    sub_B0F8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v9, 0.0, 1, 0.0, 1);
    sub_BF94((uint64_t)v5, (uint64_t (*)(void))&type metadata accessor for SemanticFocusInformationView);
    sub_BDF0((uint64_t)v9, (uint64_t)v11);
    sub_CB40((uint64_t)v11, v41, &qword_239A0);
    swift_storeEnumTagMultiPayload();
    sub_BF4C(&qword_239B0, (void (*)(uint64_t))&type metadata accessor for FocusInformationView);
    sub_BE58();
    sub_143F0();
    return sub_C514((uint64_t)v11, &qword_239A0);
  }
}

BOOL sub_B0E8(uint64_t a1)
{
  return a1 == -1 || a1 == 9;
}

__n128 sub_B0F8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_14620();
    uint64_t v23 = (void *)sub_14400();
    sub_14300();
  }
  sub_14380();
  sub_CAD8(v13, a9, (uint64_t (*)(void))&type metadata accessor for SemanticFocusInformationView);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_A470(&qword_239A0) + 36));
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

uint64_t sub_B2CC()
{
  return sub_14450();
}

id sub_B2EC(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_B398(a1);
}

id sub_B320(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_B398(a1);
}

id sub_B398(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController_mode] = a1;
  id v4 = a1;
  uint64_t v5 = (char *)[v4 semanticType];
  if (v5 == (unsigned char *)&dword_8 + 1 || v5 == (char *)-1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  NSString v8 = sub_14500();
  NSString v9 = sub_14500();
  v12.receiver = v1;
  v12.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v12, "initWithTitle:detailText:icon:contentLayout:", v8, v9, 0, v7);

  return v10;
}

void sub_B468()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = type metadata accessor for FocusCustomizationInvitationView();
  uint64_t v3 = v2 - 8;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (void *)((char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  NSString v8 = (char *)v46 - v7;
  v47.receiver = v0;
  v47.super_class = ObjectType;
  objc_msgSendSuper2(&v47, "viewDidLoad");
  NSString v9 = self;
  id v10 = *(void **)&v0[OBJC_IVAR____TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController_mode];
  id v11 = [v10 tintColorName];
  id v12 = [v9 colorForColorName:v11];

  id v13 = [v0 addBoldTrayButtonWithColor:v12];
  uint64_t v14 = sub_9B14();
  sub_9B20(0xD000000000000023, (void *)0x800000000001A710, v14, v15, 0, 0);
  swift_bridgeObjectRelease();
  NSString v16 = sub_14500();
  swift_bridgeObjectRelease();
  [v13 setTitle:v16 forState:0];

  [v13 addTarget:v0 action:"_nextButtonPressed:" forControlEvents:64];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v0;
  uint64_t *v6 = swift_getKeyPath();
  sub_A470(&qword_23998);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v6 + *(int *)(v3 + 28)) = (uint64_t)v10;
  uint64_t v18 = (void (**)())((char *)v6 + *(int *)(v3 + 32));
  *uint64_t v18 = sub_C02C;
  v18[1] = (void (*)())v17;
  sub_C0B0((uint64_t)v6, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for FocusCustomizationInvitationView);
  id v19 = objc_allocWithZone((Class)sub_A470(&qword_239D0));
  id v20 = v10;
  BOOL v21 = v0;
  id v22 = (void *)sub_14370();
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v23 = [v21 contentView];
  [v23 addSubview:v22];

  sub_A470((uint64_t *)&unk_23BD0);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_17190;
  id v25 = [v22 leadingAnchor];
  id v26 = [v21 contentView];
  id v27 = [v26 leadingAnchor];

  id v28 = [v25 constraintEqualToAnchor:v27];
  *(void *)(v24 + 32) = v28;
  id v29 = [v22 trailingAnchor];
  id v30 = [v21 contentView];
  id v31 = [v30 trailingAnchor];

  id v32 = [v29 constraintEqualToAnchor:v31];
  *(void *)(v24 + 40) = v32;
  id v33 = [v22 topAnchor];
  id v34 = [v21 contentView];
  id v35 = [v34 topAnchor];

  id v36 = [self currentDevice];
  uint64_t v37 = (char *)[v36 userInterfaceIdiom];

  double v38 = -36.0;
  if (v37 == (unsigned char *)&dword_0 + 1) {
    double v38 = -60.0;
  }
  id v39 = [v33 constraintEqualToAnchor:v35 constant:v38];

  *(void *)(v24 + 48) = v39;
  id v40 = [v22 bottomAnchor];
  id v41 = [v21 contentView];
  id v42 = [v41 bottomAnchor];

  id v43 = [v40 constraintEqualToAnchor:v42];
  *(void *)(v24 + 56) = v43;
  v46[1] = v24;
  sub_14590();
  uint64_t v44 = self;
  sub_A4B4();
  Class isa = sub_14580().super.isa;
  swift_bridgeObjectRelease();
  [v44 activateConstraints:isa];
}

void sub_BA40()
{
  id v1 = [v0 setupNavigationController];
  if (v1)
  {
    id v2 = v1;
    [v1 createDefaultModeConfigurationForMode:*(void *)&v0[OBJC_IVAR____TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController_mode]];
  }
}

id sub_BB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  NSString v8 = v7;
  NSString v12 = sub_14500();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    NSString v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v14 = 0;
    goto LABEL_6;
  }
  NSString v13 = sub_14500();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v14 = sub_14500();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = [objc_allocWithZone(v8) initWithTitle:v12 detailText:v13 symbolName:v14 contentLayout:a7];

  return v15;
}

void sub_BC2C()
{
}

id sub_BC8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  NSString v11 = sub_14500();
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v12 = sub_14500();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  id v13 = [objc_allocWithZone(v7) initWithTitle:v11 detailText:v12 icon:a5 contentLayout:a6];

  return v13;
}

void sub_BD44()
{
}

id sub_BDA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_BDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A470(&qword_239A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_BE58()
{
  unint64_t result = qword_239B8;
  if (!qword_239B8)
  {
    sub_BF04(&qword_239A0);
    sub_BF4C(&qword_239C0, (void (*)(uint64_t))&type metadata accessor for SemanticFocusInformationView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_239B8);
  }
  return result;
}

uint64_t sub_BF04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_BF4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_BF94(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_BFF4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_C02C()
{
  id v1 = *(char **)(v0 + 16);
  id v2 = [v1 setupNavigationController];
  if (v2)
  {
    id v3 = v2;
    [v2 createDefaultModeConfigurationForMode:*(void *)&v1[OBJC_IVAR____TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController_mode]];
  }
}

uint64_t sub_C0B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_C118(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1B454, 1);
}

uint64_t *sub_C134(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_A470(&qword_23998);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_143D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    NSString v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)v4 + v9) = (uint64_t)v11;
    NSString v12 = (uint64_t *)((char *)v4 + v10);
    id v13 = (uint64_t *)((char *)a2 + v10);
    uint64_t v14 = v13[1];
    *NSString v12 = *v13;
    v12[1] = v14;
    id v15 = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_C268(uint64_t a1, uint64_t a2)
{
  sub_A470(&qword_23998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_143D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_C318(void *a1, void *a2, uint64_t a3)
{
  sub_A470(&qword_23998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_143D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v9;
  uint64_t v10 = (void *)((char *)a1 + v8);
  NSString v11 = (void *)((char *)a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  id v13 = v9;
  swift_retain();
  return a1;
}

void *sub_C400(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_C514((uint64_t)a1, &qword_23998);
    sub_A470(&qword_23998);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_143D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)((char *)a2 + v7);
  uint64_t v9 = *(void **)((char *)a1 + v7);
  *(void *)((char *)a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  id v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_C514(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_A470(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_C570(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_A470(&qword_23998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_143D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  return a1;
}

char *sub_C64C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_C514((uint64_t)a1, &qword_23998);
    uint64_t v6 = sub_A470(&qword_23998);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_143D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_C758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C76C);
}

uint64_t sub_C76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A470(&qword_239D8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_C830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C844);
}

uint64_t sub_C844(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_A470(&qword_239D8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_C904()
{
  sub_C9AC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_C9AC()
{
  if (!qword_23A38)
  {
    sub_143D0();
    unint64_t v0 = sub_14360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_23A38);
    }
  }
}

uint64_t type metadata accessor for FCUIFocusCustomizationInvitationSwiftController()
{
  return self;
}

unint64_t sub_CA2C()
{
  unint64_t result = qword_23A98;
  if (!qword_23A98)
  {
    sub_BF04(&qword_23AA0);
    sub_BF4C(&qword_239B0, (void (*)(uint64_t))&type metadata accessor for FocusInformationView);
    sub_BE58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23A98);
  }
  return result;
}

uint64_t sub_CAD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_CB40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A470(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_CBA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_CC78(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_CDC8((uint64_t)v12, *a3);
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
      sub_CDC8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_CD78((uint64_t)v12);
  return v7;
}

unint64_t sub_CC78(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = (unint64_t)sub_CE24(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_14770();
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

uint64_t sub_CD78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_CDC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_CE24(uint64_t a1, unint64_t a2)
{
  id v2 = (char *)sub_CEBC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v2 = sub_CFC0(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    id v2 = sub_CFC0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_CEBC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_CF58(v2, 0);
      unint64_t result = (void *)sub_14760();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_14570();
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

void *sub_CF58(uint64_t a1, uint64_t a2)
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
  sub_A470(&qword_23AA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_CFC0(char *result, int64_t a2, char a3, char *a4)
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
    sub_A470(&qword_23AA8);
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

const char *sub_D0B0()
{
  return "DND_MODE_KEY";
}

uint64_t sub_D0BC()
{
  return 0x45444F4D5F444E44;
}

uint64_t sub_D120()
{
  return sub_14240();
}

void *sub_D158()
{
  return &_swiftEmptySetSingleton;
}

id sub_D164()
{
  uint64_t v1 = OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_hostViewModel;
  sub_14250();
  swift_allocObject();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_14240();
  *(void *)&v2[OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_cancellableBag] = &_swiftEmptySetSingleton;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for SettingsActivityViewController();
  return objc_msgSendSuper2(&v4, "initWithNibName:bundle:", 0, 0);
}

uint64_t type metadata accessor for SettingsActivityViewController()
{
  return self;
}

void sub_D2B8()
{
  uint64_t v1 = OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_hostViewModel;
  sub_14250();
  swift_allocObject();
  *(void *)&v0[v1] = sub_14240();
  *(void *)&v0[OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_cancellableBag] = &_swiftEmptySetSingleton;

  sub_14780();
  __break(1u);
}

void sub_D410()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_A470(&qword_23AC0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = (objc_class *)type metadata accessor for SettingsActivityViewController();
  v110.receiver = v0;
  v110.super_class = v6;
  id v7 = objc_msgSendSuper2(&v110, "viewDidLoad");
  (*(void (**)(id))(**(void **)&v0[OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_hostViewModel]
                             + 112))(v7);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_F234(&qword_23AC8, &qword_23AC0);
  sub_14350();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  sub_14340();
  swift_endAccess();
  swift_release();
  id v8 = sub_E280();
  if (v8)
  {
    id v85 = v8;
    id v9 = [v8 modeIdentifier];
    sub_14530();

    swift_retain();
    sub_142F0();
    long long v117 = *(_OWORD *)&v113[8];
    long long v114 = v111;
    long long v115 = v112;
    char v116 = v113[0];
    long long v102 = v111;
    long long v103 = v112;
    long long v104 = *(_OWORD *)v113;
    uint64_t v105 = *(void *)&v113[16];
    sub_E3A4();
    sub_14420();
    sub_E3F8((uint64_t)&v114);
    sub_E424((uint64_t)&v115);
    sub_E460((uint64_t)&v117);
    uint64_t v88 = v95;
    uint64_t v89 = v96;
    long long v90 = v97;
    char v91 = v98;
    uint64_t v92 = v99;
    long long v93 = v100;
    char v94 = v101;
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_A470(&qword_23AD8);
    sub_E51C();
    sub_14410();
    swift_release();
    swift_bridgeObjectRelease();
    sub_E458();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v10 = *((void *)&v102 + 1);
    long long v11 = v103;
    int v12 = v104;
    uint64_t v13 = v105;
    uint64_t v14 = v106;
    v87 = v1;
    uint64_t v16 = v107;
    uint64_t v15 = v108;
    uint64_t v17 = v109;
    id v86 = objc_allocWithZone((Class)sub_A470(&qword_23AF8));
    uint64_t v79 = v10;
    uint64_t v18 = v13;
    swift_bridgeObjectRetain();
    uint64_t v82 = *((void *)&v11 + 1);
    uint64_t v83 = v11;
    int v81 = v12;
    sub_E5BC();
    swift_retain();
    uint64_t v84 = v14;
    swift_retain();
    uint64_t v80 = v16;
    uint64_t v19 = v15;
    id v20 = v87;
    swift_retain();
    sub_E5C4(v19);
    BOOL v21 = (void *)sub_143E0();
    [v20 addChildViewController:v21];
    id v22 = [v21 view];
    if (v22)
    {
      id v23 = v22;
      id v24 = [self clearColor];
      [v23 setBackgroundColor:v24];

      id v25 = [v21 view];
      if (v25)
      {
        id v26 = v25;
        id v27 = [v20 view];
        if (v27)
        {
          id v28 = v27;
          [v27 bounds];
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          double v36 = v35;

          objc_msgSend(v26, "setFrame:", v30, v32, v34, v36);
          id v37 = [v20 view];
          if (v37)
          {
            double v38 = v37;
            id v39 = [v21 view];
            if (v39)
            {
              id v40 = v39;
              id v86 = v17;
              [v38 addSubview:v39];

              id v41 = [v21 view];
              if (v41)
              {
                id v42 = v41;
                [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

                sub_A470((uint64_t *)&unk_23BD0);
                uint64_t v43 = swift_allocObject();
                *(_OWORD *)(v43 + 16) = xmmword_17190;
                id v44 = [v21 view];
                if (v44)
                {
                  uint64_t v45 = v44;
                  uint64_t v77 = v19;
                  uint64_t v78 = v18;
                  id v46 = [v44 topAnchor];

                  id v47 = [v20 view];
                  if (v47)
                  {
                    v48 = v47;
                    id v49 = [v47 topAnchor];

                    id v50 = [v46 constraintEqualToAnchor:v49];
                    *(void *)(v43 + 32) = v50;
                    id v51 = [v21 view];
                    if (v51)
                    {
                      v52 = v51;
                      id v53 = [v51 leadingAnchor];

                      id v54 = [v20 view];
                      if (v54)
                      {
                        v55 = v54;
                        id v56 = [v54 leadingAnchor];

                        id v57 = [v53 constraintEqualToAnchor:v56];
                        *(void *)(v43 + 40) = v57;
                        id v58 = [v20 view];
                        if (v58)
                        {
                          v59 = v58;
                          id v60 = [v58 trailingAnchor];

                          id v61 = [v21 view];
                          if (v61)
                          {
                            v62 = v61;
                            id v63 = [v61 trailingAnchor];

                            id v64 = [v60 constraintEqualToAnchor:v63];
                            *(void *)(v43 + 48) = v64;
                            id v65 = [v20 view];
                            if (v65)
                            {
                              v66 = v65;
                              id v67 = [v65 bottomAnchor];

                              id v68 = [v21 view];
                              if (v68)
                              {
                                v69 = v68;
                                v70 = self;
                                id v71 = [v69 bottomAnchor];

                                id v72 = [v67 constraintEqualToAnchor:v71];
                                *(void *)(v43 + 56) = v72;
                                *(void *)&long long v102 = v43;
                                sub_14590();
                                sub_F0B8(0, (unint64_t *)&qword_23968);
                                Class isa = sub_14580().super.isa;
                                swift_bridgeObjectRelease();
                                [v70 activateConstraints:isa];

                                [v21 didMoveToParentViewController:v20];
                                id v74 = [v20 navigationItem];
                                id v75 = sub_ECF8();
                                [v74 setScrollEdgeAppearance:v75];
                                swift_bridgeObjectRelease();

                                sub_E458();
                                swift_release();
                                swift_release();
                                swift_release();
                                sub_EF10(v77);

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
LABEL_29:
                          __break(1u);
                          goto LABEL_30;
                        }
LABEL_28:
                        __break(1u);
                        goto LABEL_29;
                      }
LABEL_27:
                      __break(1u);
                      goto LABEL_28;
                    }
LABEL_26:
                    __break(1u);
                    goto LABEL_27;
                  }
LABEL_25:
                  __break(1u);
                  goto LABEL_26;
                }
LABEL_24:
                __break(1u);
                goto LABEL_25;
              }
LABEL_23:
              __break(1u);
              goto LABEL_24;
            }
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_20;
  }
}

uint64_t sub_DDA0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_DDD8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_144B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_144D0();
  uint64_t v8 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  sub_F0B8(0, &qword_23B60);
  uint64_t v13 = (void *)sub_14630();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a2;
  v14[3] = v11;
  v14[4] = v12;
  aBlock[4] = sub_F134;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_E0D8;
  aBlock[3] = &unk_1CFC0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_144C0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_F350(&qword_23B68, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_A470(&qword_23B70);
  sub_F234(&qword_23B78, &qword_23B70);
  sub_146A0();
  sub_14640();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v18);
}

uint64_t sub_E0D0(uint64_t *a1)
{
  return sub_DDD8(a1, v1);
}

uint64_t sub_E0D8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

unint64_t sub_E164(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_A470(&qword_23B40);
  uint64_t v2 = sub_14790();
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
    sub_EF78(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_EAEC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_EFE0(&v14, (_OWORD *)(v3[7] + 32 * result));
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

id sub_E280()
{
  id result = [v0 specifier];
  if (result)
  {
    uint64_t v2 = result;
    NSString v3 = sub_14500();
    id v4 = [v2 propertyForKey:v3];

    if (v4)
    {
      sub_14690();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v6, 0, sizeof(v6));
    }
    sub_EFF0((uint64_t)v6, (uint64_t)v7);
    if (v8)
    {
      sub_F0B8(0, &qword_23B58);
      if (swift_dynamicCast()) {
        return (id)v5;
      }
    }
    else
    {
      sub_F058((uint64_t)v7);
    }
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_E3A4()
{
  unint64_t result = qword_23AD0;
  if (!qword_23AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23AD0);
  }
  return result;
}

uint64_t sub_E3F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_E424(uint64_t a1)
{
  return a1;
}

uint64_t sub_E458()
{
  return swift_release();
}

uint64_t sub_E460(uint64_t a1)
{
  return a1;
}

void sub_E48C()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong navigationController];

    if (v2)
    {
    }
  }
}

unint64_t sub_E51C()
{
  unint64_t result = qword_23AE0;
  if (!qword_23AE0)
  {
    sub_BF04(&qword_23AD8);
    sub_E3A4();
    sub_F234(&qword_23AE8, &qword_23AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23AE0);
  }
  return result;
}

uint64_t sub_E5BC()
{
  return swift_retain();
}

uint64_t sub_E5C4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_E5D4()
{
}

id sub_E638()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsActivityViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_E6B8(uint64_t a1, uint64_t a2)
{
  return sub_E824(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_E6D0(uint64_t a1, id *a2)
{
  uint64_t result = sub_14510();
  *a2 = 0;
  return result;
}

uint64_t sub_E748(uint64_t a1, id *a2)
{
  char v3 = sub_14520();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_E7C8@<X0>(void *a1@<X8>)
{
  sub_14530();
  NSString v2 = sub_14500();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_E80C(uint64_t a1, uint64_t a2)
{
  return sub_E824(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_E824(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_14530();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_E868()
{
  sub_14530();
  sub_14550();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_E8BC()
{
  sub_14530();
  sub_147F0();
  sub_14550();
  Swift::Int v0 = sub_14800();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_E930()
{
  uint64_t v0 = sub_14530();
  uint64_t v2 = v1;
  if (v0 == sub_14530() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_147D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_E9BC@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_14500();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_EA04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_14530();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_EA30(uint64_t a1)
{
  uint64_t v2 = sub_F350(&qword_23B38, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v3 = sub_F350((unint64_t *)&unk_23BA0, (void (*)(uint64_t))type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_EAEC(uint64_t a1)
{
  sub_14530();
  sub_147F0();
  sub_14550();
  Swift::Int v2 = sub_14800();
  swift_bridgeObjectRelease();

  return sub_EB80(a1, v2);
}

unint64_t sub_EB80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_14530();
    uint64_t v8 = v7;
    if (v6 == sub_14530() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_147D0();
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
          uint64_t v13 = sub_14530();
          uint64_t v15 = v14;
          if (v13 == sub_14530() && v15 == v16) {
            break;
          }
          char v18 = sub_147D0();
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

id sub_ECF8()
{
  id v0 = [objc_allocWithZone((Class)UINavigationBarAppearance) init];
  [v0 configureWithTransparentBackground];
  sub_A470(&qword_23B28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_172E0;
  *(void *)(inited + 32) = NSForegroundColorAttributeName;
  uint64_t v2 = self;
  uint64_t v3 = NSForegroundColorAttributeName;
  id v4 = [v2 clearColor];
  uint64_t v5 = sub_F0B8(0, &qword_23B30);
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 40) = v4;
  sub_E164(inited);
  type metadata accessor for Key();
  sub_F350(&qword_23B38, (void (*)(uint64_t))type metadata accessor for Key);
  Class isa = sub_144E0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setTitleTextAttributes:isa];

  uint64_t v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_172E0;
  *(void *)(v7 + 32) = v3;
  uint64_t v8 = v3;
  id v9 = [v2 clearColor];
  *(void *)(v7 + 64) = v5;
  *(void *)(v7 + 40) = v9;
  sub_E164(v7);
  Class v10 = sub_144E0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setLargeTitleTextAttributes:v10];

  return v0;
}

uint64_t sub_EF10(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void type metadata accessor for Key()
{
  if (!qword_23B80)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_23B80);
    }
  }
}

uint64_t sub_EF78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A470(&qword_23B48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_EFE0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_EFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A470(&qword_23B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_F058(uint64_t a1)
{
  uint64_t v2 = sub_A470(&qword_23B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_F0B8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_F0F4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_F134()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong navigationItem];
    NSString v3 = sub_14500();
    [v2 setTitle:v3];

    id v4 = [v1 navigationItem];
    id v5 = sub_ECF8();
    [v4 setScrollEdgeAppearance:v5];
  }
}

uint64_t sub_F21C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_F22C()
{
  return swift_release();
}

uint64_t sub_F234(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_BF04(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_F278()
{
  return sub_F350(&qword_23B88, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_F2C0()
{
  return sub_F350(&qword_23B90, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_F308()
{
  return sub_F350(&qword_23B98, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_F350(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_F398()
{
}

uint64_t sub_F3AC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_F3B4(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_F3E0())()
{
  return nullsub_2;
}

uint64_t sub_F404()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_F40C(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*sub_F438())()
{
  return nullsub_2;
}

uint64_t sub_F458()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t sub_F488(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_F4C0())()
{
  return nullsub_2;
}

uint64_t sub_F4E0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t sub_F510(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*sub_F548())()
{
  return nullsub_2;
}

uint64_t sub_F56C()
{
  sub_A470(&qword_23BB0);
  sub_14460();
  return v1;
}

uint64_t sub_F5B0()
{
  return 0;
}

uint64_t sub_F5BC()
{
  sub_14460();
  return v1;
}

unint64_t sub_F5F8()
{
  return 0xD000000000000011;
}

uint64_t sub_F614()
{
  uint64_t v1 = v0;
  sub_145B0();
  sub_F9D0(v0);
  uint64_t v2 = sub_145A0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = &protocol witness table for MainActor;
  long long v4 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v3 + 96) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v3 + 112) = v4;
  *(_OWORD *)(v3 + 128) = *(_OWORD *)(v0 + 96);
  *(void *)(v3 + 144) = *(void *)(v0 + 112);
  long long v5 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)v0;
  *(_OWORD *)(v3 + 48) = v5;
  long long v6 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v3 + 80) = v6;
  sub_F9D0(v0);
  uint64_t v7 = sub_145A0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = &protocol witness table for MainActor;
  long long v9 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v8 + 96) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v8 + 112) = v9;
  *(_OWORD *)(v8 + 128) = *(_OWORD *)(v0 + 96);
  *(void *)(v8 + 144) = *(void *)(v0 + 112);
  long long v10 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)v0;
  *(_OWORD *)(v8 + 48) = v10;
  long long v11 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v8 + 80) = v11;
  sub_14490();
  sub_F9D0(v0);
  uint64_t v12 = sub_145A0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  long long v14 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v13 + 96) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v13 + 112) = v14;
  *(_OWORD *)(v13 + 128) = *(_OWORD *)(v0 + 96);
  *(void *)(v13 + 144) = *(void *)(v0 + 112);
  long long v15 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v13 + 32) = *(_OWORD *)v0;
  *(_OWORD *)(v13 + 48) = v15;
  long long v16 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v13 + 64) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v13 + 80) = v16;
  sub_F9D0(v0);
  uint64_t v17 = sub_145A0();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = &protocol witness table for MainActor;
  long long v19 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v18 + 96) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v18 + 112) = v19;
  *(_OWORD *)(v18 + 128) = *(_OWORD *)(v0 + 96);
  *(void *)(v18 + 144) = *(void *)(v0 + 112);
  long long v20 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v18 + 32) = *(_OWORD *)v0;
  *(_OWORD *)(v18 + 48) = v20;
  long long v21 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v18 + 64) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v18 + 80) = v21;
  sub_A470(&qword_23BB0);
  sub_14490();
  sub_F9D0(v0);
  uint64_t v22 = sub_145A0();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v22;
  *(void *)(v23 + 24) = &protocol witness table for MainActor;
  long long v24 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v23 + 96) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v23 + 112) = v24;
  *(_OWORD *)(v23 + 128) = *(_OWORD *)(v0 + 96);
  *(void *)(v23 + 144) = *(void *)(v0 + 112);
  long long v25 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v23 + 32) = *(_OWORD *)v0;
  *(_OWORD *)(v23 + 48) = v25;
  long long v26 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v23 + 64) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v23 + 80) = v26;
  sub_F9D0(v0);
  uint64_t v27 = sub_145A0();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v27;
  *(void *)(v28 + 24) = &protocol witness table for MainActor;
  long long v29 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v28 + 96) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v28 + 112) = v29;
  *(_OWORD *)(v28 + 128) = *(_OWORD *)(v1 + 96);
  *(void *)(v28 + 144) = *(void *)(v1 + 112);
  long long v30 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v28 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(v28 + 48) = v30;
  long long v31 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v28 + 64) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v28 + 80) = v31;
  sub_14490();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_142D0();
}

uint64_t sub_F9D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_FA7C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, void))(v1 + 64);
  sub_A470(&qword_23CD8);
  sub_14470();
  v3(v5, v6, 0);
  swift_bridgeObjectRelease();
  uint64_t result = sub_14470();
  *a1 = v5;
  a1[1] = v6;
  return result;
}

uint64_t sub_FB3C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  swift_bridgeObjectRetain();
  sub_A470(&qword_23CD8);
  sub_14480();
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 64))(v2, v3, 0);
}

uint64_t sub_FBC4@<X0>(uint64_t *a1@<X8>)
{
  sub_A470((uint64_t *)&unk_23CE0);
  sub_14470();
  uint64_t v3 = v9;
  if (v9)
  {
    uint64_t v4 = v8;
  }
  else
  {
    uint64_t v4 = sub_142C0();
    uint64_t v3 = v6;
  }
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 64);
  swift_bridgeObjectRetain();
  v5(v4, v3, 1);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v3;
  return result;
}

uint64_t *sub_FC80(uint64_t *result)
{
  uint64_t v2 = result[1];
  if (v2)
  {
    uint64_t v3 = *result;
    swift_bridgeObjectRetain();
    sub_A470((uint64_t *)&unk_23CE0);
    sub_14480();
    return (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 64))(v3, v2, 1);
  }
  return result;
}

uint64_t sub_FD10@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 64);
  sub_A470(&qword_23CD8);
  sub_14470();
  v3(v5, v6, 2);
  swift_bridgeObjectRelease();
  uint64_t result = sub_14470();
  *a1 = v5;
  a1[1] = v6;
  return result;
}

uint64_t sub_FDD0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 152, 7);
}

uint64_t *sub_FE58(uint64_t *result)
{
  uint64_t v2 = result[1];
  if (v2)
  {
    uint64_t v3 = *result;
    swift_bridgeObjectRetain();
    sub_A470(&qword_23CD8);
    sub_14480();
    return (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 64))(v3, v2, 2);
  }
  return result;
}

double sub_FEE4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  sub_12904(a1, a2, a3, a4, a5, a6, (uint64_t)v12);
  long long v8 = v16;
  *(_OWORD *)(a7 + 64) = v15;
  *(_OWORD *)(a7 + 80) = v8;
  *(_OWORD *)(a7 + 96) = v17;
  *(void *)(a7 + 112) = v18;
  long long v9 = v12[1];
  *(_OWORD *)a7 = v12[0];
  *(_OWORD *)(a7 + 16) = v9;
  double result = *(double *)&v13;
  long long v11 = v14;
  *(_OWORD *)(a7 + 32) = v13;
  *(_OWORD *)(a7 + 48) = v11;
  return result;
}

uint64_t sub_FF48()
{
  return sub_F614();
}

void *sub_FF9C()
{
  return &unk_1D010;
}

unint64_t sub_FFA8()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_FFC4()
{
  return 0;
}

uint64_t sub_FFCC()
{
  return 0;
}

id sub_FFD4(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_textName];
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_symbolImageName];
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_tintColorName];
  void *v6 = 0;
  v6[1] = 0;
  v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_isContentScrolling] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_keyboardDismissalTapRecognizer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_currentModes] = a1;
  NSString v7 = sub_14500();
  NSString v8 = sub_14500();
  v11.receiver = v1;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, "initWithTitle:detailText:icon:contentLayout:", v7, v8, 0, 3);

  return v9;
}

uint64_t sub_100B8(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_isContentScrolling) = result;
  return result;
}

id sub_100D8()
{
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = swift_bridgeObjectRetain();
  return sub_FFD4(v2);
}

void sub_10198()
{
  v47.receiver = v0;
  v47.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v47, "viewDidLoad");
  uint64_t v1 = sub_9B14();
  sub_9B20(0xD00000000000001CLL, (void *)0x800000000001AA20, v1, v2, 0, 0);
  swift_bridgeObjectRelease();
  NSString v3 = sub_14500();
  swift_bridgeObjectRelease();
  [v0 setHeaderViewTitle:v3];

  id v4 = [v0 addBoldTrayButton];
  uint64_t v5 = sub_9B14();
  sub_9B20(0xD000000000000016, (void *)0x800000000001AA40, v5, v6, 0, 0);
  swift_bridgeObjectRelease();
  NSString v7 = sub_14500();
  swift_bridgeObjectRelease();
  [v4 setTitle:v7 forState:0];

  [v4 addTarget:v0 action:"_saveButtonPressed:" forControlEvents:64];
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_10788(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_12B10(v10);
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_10AF8(v12);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_12B10(v13);
  swift_bridgeObjectRelease();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v0;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v0;
  *(void *)(v16 + 24) = v4;
  long long v17 = v0;
  id v18 = v4;
  sub_12904(v11, v14, (uint64_t)sub_12BE0, v15, (uint64_t)sub_12C34, v16, (uint64_t)v46);
  id v19 = objc_allocWithZone((Class)sub_A470(&qword_23BC8));
  long long v20 = (void *)sub_14370();
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v21 = [v17 contentView];
  [v21 addSubview:v20];

  sub_A470((uint64_t *)&unk_23BD0);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_17190;
  id v23 = [v20 leadingAnchor];
  id v24 = [v17 contentView];
  id v25 = [v24 leadingAnchor];

  id v26 = [v23 constraintEqualToAnchor:v25];
  *(void *)(v22 + 32) = v26;
  id v27 = [v20 trailingAnchor];
  id v28 = [v17 contentView];
  id v29 = [v28 trailingAnchor];

  id v30 = [v27 constraintEqualToAnchor:v29];
  *(void *)(v22 + 40) = v30;
  id v31 = [v20 topAnchor];
  id v32 = [v17 contentView];
  id v33 = [v32 topAnchor];

  id v34 = [v31 constraintEqualToAnchor:v33];
  *(void *)(v22 + 48) = v34;
  id v35 = [v20 bottomAnchor];
  id v36 = [v17 contentView];
  id v37 = [v36 bottomAnchor];

  id v38 = [v35 constraintEqualToAnchor:v37];
  *(void *)(v22 + 56) = v38;
  v46[0] = v22;
  sub_14590();
  id v39 = self;
  sub_F0B8(0, (unint64_t *)&qword_23968);
  Class isa = sub_14580().super.isa;
  swift_bridgeObjectRelease();
  [v39 activateConstraints:isa];

  sub_10FB4(v18);
  id v41 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v17 action:"_tapped"];
  [v41 setDelegate:v17];
  id v42 = *(void **)&v17[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_keyboardDismissalTapRecognizer];
  *(void *)&v17[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_keyboardDismissalTapRecognizer] = v41;
  id v43 = v41;

  id v44 = [v17 view];
  if (v44)
  {
    uint64_t v45 = v44;
    [v44 addGestureRecognizer:v43];
  }
  else
  {
    __break(1u);
  }
}

void sub_10788(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_146C0();
    sub_F0B8(0, &qword_23B58);
    sub_13EDC();
    sub_145F0();
    uint64_t v1 = v27;
    uint64_t v26 = v28;
    uint64_t v3 = v29;
    uint64_t v2 = v30;
    unint64_t v4 = v31;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v26 = a1 + 56;
    uint64_t v3 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
  }
  uint64_t v23 = v3;
  int64_t v25 = (unint64_t)(v3 + 64) >> 6;
  id v24 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v8 = v2;
    if ((v1 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_14720()) {
      goto LABEL_38;
    }
    sub_F0B8(0, &qword_23B58);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v11 = v32;
    swift_unknownObjectRelease();
    if (!v32) {
      goto LABEL_38;
    }
LABEL_31:
    id v15 = objc_msgSend(v11, "symbolImageName", v23);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = sub_14530();
      uint64_t v19 = v18;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v24 = sub_117F4(0, *((void *)v24 + 2) + 1, 1, v24);
      }
      unint64_t v21 = *((void *)v24 + 2);
      unint64_t v20 = *((void *)v24 + 3);
      if (v21 >= v20 >> 1) {
        id v24 = sub_117F4((char *)(v20 > 1), v21 + 1, 1, v24);
      }
      *((void *)v24 + 2) = v21 + 1;
      uint64_t v22 = &v24[16 * v21];
      *((void *)v22 + 4) = v17;
      *((void *)v22 + 5) = v19;
    }
    else
    {
    }
  }
  if (v4)
  {
    unint64_t v9 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v10 = v9 | (v2 << 6);
LABEL_30:
    id v11 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v11) {
      goto LABEL_38;
    }
    goto LABEL_31;
  }
  int64_t v12 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    if (v12 >= v25) {
      goto LABEL_38;
    }
    unint64_t v13 = *(void *)(v26 + 8 * v12);
    ++v2;
    if (!v13)
    {
      uint64_t v2 = v8 + 2;
      if (v8 + 2 >= v25) {
        goto LABEL_38;
      }
      unint64_t v13 = *(void *)(v26 + 8 * v2);
      if (!v13)
      {
        uint64_t v2 = v8 + 3;
        if (v8 + 3 >= v25) {
          goto LABEL_38;
        }
        unint64_t v13 = *(void *)(v26 + 8 * v2);
        if (!v13)
        {
          uint64_t v2 = v8 + 4;
          if (v8 + 4 >= v25) {
            goto LABEL_38;
          }
          unint64_t v13 = *(void *)(v26 + 8 * v2);
          if (!v13)
          {
            uint64_t v2 = v8 + 5;
            if (v8 + 5 >= v25) {
              goto LABEL_38;
            }
            unint64_t v13 = *(void *)(v26 + 8 * v2);
            if (!v13)
            {
              uint64_t v14 = v8 + 6;
              while (v25 != v14)
              {
                unint64_t v13 = *(void *)(v26 + 8 * v14++);
                if (v13)
                {
                  uint64_t v2 = v14 - 1;
                  goto LABEL_29;
                }
              }
LABEL_38:
              sub_14058();
              return;
            }
          }
        }
      }
    }
LABEL_29:
    unint64_t v4 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v2 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

uint64_t sub_10AF8(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_146C0();
    sub_F0B8(0, &qword_23B58);
    sub_13EDC();
    uint64_t result = sub_145F0();
    uint64_t v1 = v26;
    uint64_t v25 = v27;
    uint64_t v4 = v28;
    uint64_t v3 = v29;
    unint64_t v5 = v30;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v25 = a1 + 56;
    uint64_t v4 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v24 = (unint64_t)(v4 + 64) >> 6;
  unint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v3 << 6);
      uint64_t v12 = v3;
      goto LABEL_29;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v14 >= v24) {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v14);
    uint64_t v12 = v3 + 1;
    if (!v15)
    {
      uint64_t v12 = v3 + 2;
      if (v3 + 2 >= v24) {
        goto LABEL_36;
      }
      unint64_t v15 = *(void *)(v25 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v3 + 3;
        if (v3 + 3 >= v24) {
          goto LABEL_36;
        }
        unint64_t v15 = *(void *)(v25 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v3 + 4;
          if (v3 + 4 >= v24) {
            goto LABEL_36;
          }
          unint64_t v15 = *(void *)(v25 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v3 + 5;
            if (v3 + 5 >= v24) {
              goto LABEL_36;
            }
            unint64_t v15 = *(void *)(v25 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v3 + 6;
              while (v24 != v16)
              {
                unint64_t v15 = *(void *)(v25 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_36:
              sub_14058();
              return (uint64_t)v9;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v1 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_36;
    }
    while (1)
    {
      id v17 = [v13 name];
      uint64_t v18 = sub_14530();
      uint64_t v20 = v19;

      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_117F4(0, *((void *)v9 + 2) + 1, 1, v9);
        unint64_t v9 = (char *)result;
      }
      unint64_t v22 = *((void *)v9 + 2);
      unint64_t v21 = *((void *)v9 + 3);
      if (v22 >= v21 >> 1)
      {
        uint64_t result = (uint64_t)sub_117F4((char *)(v21 > 1), v22 + 1, 1, v9);
        unint64_t v9 = (char *)result;
      }
      *((void *)v9 + 2) = v22 + 1;
      uint64_t v23 = &v9[16 * v22];
      *((void *)v23 + 4) = v18;
      *((void *)v23 + 5) = v20;
      uint64_t v3 = v12;
      unint64_t v5 = v10;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_14720())
      {
        sub_F0B8(0, &qword_23B58);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v31;
        swift_unknownObjectRelease();
        uint64_t v12 = v3;
        uint64_t v10 = v5;
        if (v31) {
          continue;
        }
      }
      goto LABEL_36;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10EA4()
{
  id v0 = [self sharedApplication];
  [v0 sendAction:"resignFirstResponder" to:0 from:0 forEvent:0];

  return 0;
}

id sub_10FB4(void *a1)
{
  unint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_textName + 8);
  if (v2
    && (unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_symbolImageName + 8)) != 0
    && ((v2 & 0x2000000000000000) != 0
      ? (uint64_t v4 = HIBYTE(v2) & 0xF)
      : (uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_textName) & 0xFFFFFFFFFFFFLL),
        v4))
  {
    if ((v3 & 0x2000000000000000) != 0) {
      uint64_t v5 = HIBYTE(v3) & 0xF;
    }
    else {
      uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_symbolImageName) & 0xFFFFFFFFFFFFLL;
    }
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  return [a1 setEnabled:v6];
}

uint64_t sub_11024()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_currentModes);
  unint64_t v28 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_14700();
    if (v2) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    BOOL v6 = &_swiftEmptyArrayStorage;
LABEL_21:
    uint64_t v27 = sub_12B10((uint64_t)v6);
    swift_bridgeObjectRelease();
    return v27;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  id v33 = &_swiftEmptyArrayStorage;
  sub_12394(0, v2 & ~(v2 >> 63), 0);
  if (v28)
  {
    uint64_t result = sub_146B0();
    char v5 = 1;
  }
  else
  {
    uint64_t result = sub_1287C(v1);
    char v5 = v7 & 1;
  }
  uint64_t v30 = result;
  uint64_t v31 = v4;
  char v32 = v5;
  if ((v2 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        int64_t v14 = v30;
        uint64_t v13 = v31;
        char v15 = v32;
        sub_12604(v30, v31, v32, v1);
        id v17 = v16;
        id v18 = [v16 modeIdentifier];
        uint64_t v19 = sub_14530();
        uint64_t v21 = v20;

        unint64_t v22 = v33;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_12394(0, v22[2] + 1, 1);
          unint64_t v22 = v33;
        }
        unint64_t v24 = v22[2];
        unint64_t v23 = v22[3];
        if (v24 >= v23 >> 1)
        {
          uint64_t result = sub_12394(v23 > 1, v24 + 1, 1);
          unint64_t v22 = v33;
        }
        v22[2] = v24 + 1;
        uint64_t v25 = (char *)&v22[2 * v24];
        *((void *)v25 + 4) = v19;
        *((void *)v25 + 5) = v21;
        if (v28) {
          break;
        }
        int64_t v8 = sub_12520(v14, v13, v15, v1);
        uint64_t v10 = v9;
        char v12 = v11;
        sub_12C98(v14, v13, v15);
        uint64_t v30 = v8;
        uint64_t v31 = v10;
        char v32 = v12 & 1;
        if (!--v2) {
          goto LABEL_20;
        }
      }
      if ((v15 & 1) == 0) {
        goto LABEL_23;
      }
      if (sub_146D0()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_A470(&qword_23BF8);
      uint64_t v26 = (void (*)(char *, void))sub_145E0();
      sub_14730();
      v26(v29, 0);
      --v2;
    }
    while (v2);
LABEL_20:
    sub_12C98(v30, v31, v32);
    swift_bridgeObjectRelease();
    BOOL v6 = v33;
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_112F4()
{
  if (qword_24110 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_14330();

  return sub_137B0(v0, (uint64_t)qword_241A8);
}

uint64_t sub_11358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_147F0();
    sub_14550();
    Swift::Int v6 = sub_14800();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      char v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_147D0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_147D0() & 1) != 0) {
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

void sub_11584()
{
}

void sub_115E4()
{
}

uint64_t sub_116D0()
{
  uint64_t v0 = sub_14330();
  sub_13F44(v0, qword_241A8);
  sub_137B0(v0, (uint64_t)qword_241A8);
  return sub_14320();
}

uint64_t sub_1174C@<X0>(uint64_t a1@<X8>)
{
  if (qword_24110 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_14330();
  uint64_t v3 = sub_137B0(v2, (uint64_t)qword_241A8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

char *sub_117F4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_A470(&qword_23CC8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_12A1C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_11904(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_147F0();
  swift_bridgeObjectRetain();
  sub_14550();
  Swift::Int v8 = sub_14800();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_147D0() & 1) != 0)
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_147D0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_11D94(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_11AB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_A470(&qword_23CD0);
  uint64_t v3 = sub_14750();
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
                  *uint64_t v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_147F0();
      sub_14550();
      uint64_t result = sub_14800();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_11D94(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_11AB4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_11F30();
      goto LABEL_22;
    }
    sub_120E4();
  }
  uint64_t v11 = *v4;
  sub_147F0();
  sub_14550();
  uint64_t result = sub_14800();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_147D0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_147E0();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_147D0();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_11F30()
{
  uint64_t v1 = v0;
  sub_A470(&qword_23CD0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_14740();
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
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

uint64_t sub_120E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_A470(&qword_23CD0);
  uint64_t v3 = sub_14750();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_147F0();
    swift_bridgeObjectRetain();
    sub_14550();
    uint64_t result = sub_14800();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
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

uint64_t sub_12394(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_123B4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_123B4(char a1, int64_t a2, char a3, char *a4)
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
    sub_A470(&qword_23CC8);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_147A0();
  __break(1u);
  return result;
}

int64_t sub_12520(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_12604(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_14710();
      sub_F0B8(0, &qword_23B58);
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
  if (sub_146E0() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_146F0();
  sub_F0B8(0, &qword_23B58);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_14650(*(void *)(a4 + 40));
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
  char v10 = sub_14660();

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
      char v13 = sub_14660();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  unint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_1287C(uint64_t a1)
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

__n128 sub_12904@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  sub_14460();
  sub_A470(&qword_23BB0);
  sub_14460();
  sub_14460();
  __n128 result = v15;
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  *(void *)(a7 + 40) = a6;
  *(__n128 *)(a7 + 48) = v15;
  *(void *)(a7 + 64) = v16;
  *(__n128 *)(a7 + 72) = v15;
  *(void *)(a7 + 88) = v16;
  *(__n128 *)(a7 + 96) = v15;
  *(void *)(a7 + 112) = v16;
  return result;
}

uint64_t sub_12A1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_147A0();
  __break(1u);
  return result;
}

uint64_t sub_12B10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_145D0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_11904(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_12BA8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_12BE0()
{
  return *(unsigned __int8 *)(*(void *)(v0 + 16)
                            + OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_isContentScrolling);
}

uint64_t sub_12BF4()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_12C34(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(void *)(v3 + 16);
  Swift::Int v5 = *(void **)(v3 + 24);
  Swift::Int v6 = (void *)(v4 + *(&off_1D288)[a3]);
  void *v6 = a1;
  v6[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_10FB4(v5);
}

uint64_t sub_12C98(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_12CA4()
{
  uint64_t v0 = sub_14220();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  Swift::Int v6 = (char *)&v18 - v5;
  uint64_t v7 = sub_14540();
  unint64_t v9 = v8;
  sub_14200();
  sub_14210();
  unint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  unint64_t v18 = v7;
  unint64_t v19 = v9;
  sub_13FA8();
  uint64_t v11 = sub_14680();
  swift_bridgeObjectRelease();
  unint64_t v18 = v11;
  sub_A470(&qword_23CB8);
  sub_13FFC();
  uint64_t v12 = sub_144F0();
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (!v15)
  {
    swift_bridgeObjectRelease();
    unint64_t v14 = 0xE100000000000000;
    uint64_t v12 = 49;
  }
  unint64_t v18 = 0xD00000000000001CLL;
  unint64_t v19 = 0x800000000001ADD0;
  v20._countAndFlagsBits = v12;
  v20._object = (void *)v14;
  sub_14560(v20);
  swift_bridgeObjectRelease();
  unint64_t v16 = v18;
  v10(v6, v0);
  return v16;
}

void sub_12EA4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_14330();
  unint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::Int v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_24110 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    uint64_t v7 = sub_137B0(v3, (uint64_t)qword_241A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
    uint64_t v1 = v1;
    unint64_t v8 = sub_14310();
    int v9 = sub_14600();
    unint64_t v10 = &OBJC_METACLASS___FCUISettingsDataSource;
    if (os_log_type_enabled(v8, (os_log_type_t)v9))
    {
      id v54 = v8;
      LODWORD(v56) = v9;
      uint64_t v57 = v7;
      uint64_t v11 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v59 = v55;
      *(_DWORD *)uint64_t v11 = 136446978;
      uint64_t v12 = sub_14810();
      unint64_t v61 = sub_CBA4(v12, v13, &v59);
      sub_14670();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      unint64_t v14 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_textName + 8];
      uint64_t v58 = ObjectType;
      if (v14)
      {
        uint64_t v15 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_textName];
        unint64_t v16 = v14;
      }
      else
      {
        unint64_t v16 = 0xE300000000000000;
        uint64_t v15 = 7104878;
      }
      swift_bridgeObjectRetain();
      unint64_t v61 = sub_CBA4(v15, v16, &v59);
      sub_14670();

      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 22) = 2080;
      if (*(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_symbolImageName + 8])
      {
        uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_symbolImageName];
        unint64_t v18 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_symbolImageName + 8];
      }
      else
      {
        unint64_t v18 = 0xE300000000000000;
        uint64_t v17 = 7104878;
      }
      unint64_t v19 = v54;
      swift_bridgeObjectRetain();
      unint64_t v61 = sub_CBA4(v17, v18, &v59);
      sub_14670();

      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 32) = 2080;
      if (*(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_tintColorName + 8])
      {
        uint64_t v20 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_tintColorName];
        unint64_t v21 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_tintColorName + 8];
      }
      else
      {
        unint64_t v21 = 0xE300000000000000;
        uint64_t v20 = 7104878;
      }
      swift_bridgeObjectRetain();
      unint64_t v61 = sub_CBA4(v20, v21, &v59);
      sub_14670();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v19, (os_log_type_t)v56, "[%{public}s] _nextButtonPressed name=%s symbolImageName: %s, tintColorName: %s", (uint8_t *)v11, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      unint64_t v10 = &OBJC_METACLASS___FCUISettingsDataSource;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    uint64_t v22 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_textName + 8];
    if (!v22)
    {
      id v35 = sub_14310();
      os_log_type_t v36 = sub_14610();
      if (!os_log_type_enabled(v35, v36)) {
        goto LABEL_29;
      }
      id v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)id v37 = 136446210;
      uint64_t v38 = sub_14810();
      unint64_t v61 = sub_CBA4(v38, v39, &v59);
      sub_14670();
      swift_bridgeObjectRelease();
      id v40 = "[%{public}s] textName is nil";
LABEL_28:
      _os_log_impl(&dword_0, v35, v36, v40, v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      goto LABEL_29;
    }
    unint64_t v23 = (uint64_t *)&v1[(unint64_t)v10[76].cache];
    unint64_t v24 = (char *)v23[1];
    if (!v24)
    {
      id v35 = sub_14310();
      os_log_type_t v36 = sub_14610();
      if (!os_log_type_enabled(v35, v36)) {
        goto LABEL_29;
      }
      id v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)id v37 = 136446210;
      uint64_t v41 = sub_14810();
      unint64_t v61 = sub_CBA4(v41, v42, &v59);
      sub_14670();
      swift_bridgeObjectRelease();
      id v40 = "[%{public}s] symbolImageName is nil";
      goto LABEL_28;
    }
    uint64_t v25 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_tintColorName + 8];
    if (!v25)
    {
      id v35 = sub_14310();
      os_log_type_t v36 = sub_14610();
      if (os_log_type_enabled(v35, v36))
      {
        id v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        *(_DWORD *)id v37 = 136446210;
        uint64_t v43 = sub_14810();
        unint64_t v61 = sub_CBA4(v43, v44, &v59);
        sub_14670();
        swift_bridgeObjectRelease();
        id v40 = "[%{public}s] tintColorName is nil";
        goto LABEL_28;
      }
LABEL_29:

      return;
    }
    uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_textName];
    uint64_t v26 = *v23;
    uint64_t v58 = *(void *)&v1[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_tintColorName];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v27 = sub_12CA4();
    uint64_t v29 = v28;
    uint64_t v30 = sub_11024();
    swift_bridgeObjectRetain();
    char v31 = sub_11358(v27, v29, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0) {
      break;
    }
    uint64_t v55 = v3;
    uint64_t v56 = v22;
    uint64_t v57 = v25;
    swift_bridgeObjectRelease();
    for (uint64_t i = 1; ; ++i)
    {
      uint64_t v59 = v26;
      id v60 = v24;
      unint64_t v61 = i;
      swift_bridgeObjectRetain();
      v62._countAndFlagsBits = sub_147C0();
      sub_14560(v62);
      swift_bridgeObjectRelease();
      Swift::Int v6 = v60;
      unint64_t v4 = sub_12CA4();
      uint64_t ObjectType = v33;
      swift_bridgeObjectRelease();
      if (__OFADD__(i, 1)) {
        break;
      }
      uint64_t v34 = sub_11024();
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_11358(v4, ObjectType, v34);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v3 & 1) == 0) {
        goto LABEL_30;
      }
      swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_34:
    swift_once();
  }
LABEL_30:
  NSString v45 = sub_14500();
  swift_bridgeObjectRelease();
  id v46 = objc_allocWithZone((Class)DNDMode);
  NSString v47 = sub_14500();
  swift_bridgeObjectRelease();
  NSString v48 = sub_14500();
  swift_bridgeObjectRelease();
  NSString v49 = sub_14500();
  swift_bridgeObjectRelease();
  id v50 = [v46 initWithName:v47 modeIdentifier:v45 symbolImageName:v48 tintColorName:v49 semanticType:-1];

  id v51 = [v1 navigationController];
  if (v51)
  {
    v52 = v51;
    type metadata accessor for FCUIFocusCustomizationInvitationSwiftController();
    id v50 = v50;
    id v53 = sub_B320(v50);
    [v52 pushViewController:v53 animated:1];
  }
}

uint64_t sub_137B0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_137E8(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1B584, 1);
}

uint64_t initializeBufferWithCopyOfBuffer for CustomModeWelcomeView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CustomModeWelcomeView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for CustomModeWelcomeView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v3;
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CustomModeWelcomeView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_retain();
  swift_release();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_retain();
  swift_release();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CustomModeWelcomeView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for CustomModeWelcomeView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomModeWelcomeView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomModeWelcomeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomModeWelcomeView()
{
  return &type metadata for CustomModeWelcomeView;
}

uint64_t sub_13C70(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for CustomModeWelcomeView.ModeChange(uint64_t a1)
{
  return sub_13C98(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_13C98(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s13FocusSettings21CustomModeWelcomeViewV10ModeChangeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_13C70(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CustomModeWelcomeView.ModeChange(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_13C70(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_13C98(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for CustomModeWelcomeView.ModeChange(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CustomModeWelcomeView.ModeChange(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_13C98(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomModeWelcomeView.ModeChange(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomModeWelcomeView.ModeChange(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_13E3C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_13E44(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CustomModeWelcomeView.ModeChange()
{
  return &type metadata for CustomModeWelcomeView.ModeChange;
}

uint64_t type metadata accessor for FCUICustomModeWelcomeSwiftController()
{
  return self;
}

unint64_t sub_13E84()
{
  unint64_t result = qword_23C90;
  if (!qword_23C90)
  {
    sub_142E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23C90);
  }
  return result;
}

unint64_t sub_13EDC()
{
  unint64_t result = qword_23CA0;
  if (!qword_23CA0)
  {
    sub_F0B8(255, &qword_23B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23CA0);
  }
  return result;
}

uint64_t *sub_13F44(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_13FA8()
{
  unint64_t result = qword_23CB0;
  if (!qword_23CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23CB0);
  }
  return result;
}

unint64_t sub_13FFC()
{
  unint64_t result = qword_23CC0;
  if (!qword_23CC0)
  {
    sub_BF04(&qword_23CB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_23CC0);
  }
  return result;
}

uint64_t sub_14058()
{
  return swift_release();
}

void sub_14060()
{
  sub_63E4();
  sub_63C8(&dword_0, v0, v1, "Unable to create mode: error=%@", v2, v3, v4, v5, v6);
}

void sub_140C8()
{
  sub_63E4();
  sub_63C8(&dword_0, v0, v1, "Unable to fetch available modes: %@", v2, v3, v4, v5, v6);
}

void sub_14130()
{
  sub_63E4();
  sub_63C8(&dword_0, v0, v1, "Unable to get sync availability: %@", v2, v3, v4, v5, v6);
}

void sub_14198()
{
  sub_63E4();
  sub_63C8(&dword_0, v0, v1, "Unable to set sync enabled state: %@", v2, v3, v4, v5, v6);
}

uint64_t sub_14200()
{
  return static CharacterSet.alphanumerics.getter();
}

uint64_t sub_14210()
{
  return CharacterSet.inverted.getter();
}

uint64_t sub_14220()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_14230(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_14240()
{
  return ActivityDetailViewHostViewModel.init()();
}

uint64_t sub_14250()
{
  return type metadata accessor for ActivityDetailViewHostViewModel();
}

uint64_t sub_14260()
{
  return SemanticFocusInformationView.init(name:symbolImageName:tintColorName:semanticType:style:nextButtonAction:)();
}

uint64_t sub_14270()
{
  return type metadata accessor for SemanticFocusInformationView();
}

uint64_t sub_14280()
{
  return FocusInformationView.init(name:symbolImageName:tintColorName:semanticType:nextButtonAction:)();
}

uint64_t sub_14290()
{
  return type metadata accessor for FocusInformationView();
}

uint64_t sub_142A0()
{
  return FocusStatusConfigurationView.init(with:)();
}

uint64_t sub_142B0()
{
  return type metadata accessor for FocusStatusConfigurationView();
}

uint64_t sub_142C0()
{
  return static ActivitySource.firstAvailableSymbol(excluding:)();
}

uint64_t sub_142D0()
{
  return ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)();
}

uint64_t sub_142E0()
{
  return type metadata accessor for ActivityEditView();
}

uint64_t sub_142F0()
{
  return ActivityDetailView.init(modeIdentifier:hostViewModel:)();
}

uint64_t sub_14300()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_14310()
{
  return Logger.logObject.getter();
}

uint64_t sub_14320()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_14330()
{
  return type metadata accessor for Logger();
}

uint64_t sub_14340()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_14350()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_14360()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_14370()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t sub_14380()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_14390()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_143A0()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_143B0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_143C0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_143D0()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_143E0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_143F0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_14400()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_14410()
{
  return View.onDeleteActivity(_:)();
}

uint64_t sub_14420()
{
  return View.activityConfigurationContext(_:)();
}

uint64_t sub_14430()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_14440()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_14450()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_14460()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_14470()
{
  return State.wrappedValue.getter();
}

uint64_t sub_14480()
{
  return State.wrappedValue.setter();
}

uint64_t sub_14490()
{
  return Binding.init(get:set:)();
}

uint64_t sub_144A0()
{
  return static Alignment.center.getter();
}

uint64_t sub_144B0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_144C0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_144D0()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_144E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_144F0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_14500()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_14510()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_14520()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_14530()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14540()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_14550()
{
  return String.hash(into:)();
}

void sub_14560(Swift::String a1)
{
}

Swift::Int sub_14570()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_14580()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_14590()
{
  return specialized Array._endMutation()();
}

uint64_t sub_145A0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_145B0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_145C0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_145D0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_145E0()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_145F0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_14600()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_14610()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_14620()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_14630()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_14640()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Int sub_14650(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_14660()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_14670()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_14680()
{
  return StringProtocol.components(separatedBy:)();
}

uint64_t sub_14690()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_146A0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_146B0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_146C0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_146D0()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_146E0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_146F0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_14700()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_14710()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_14720()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_14730()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

uint64_t sub_14740()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_14750()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_14760()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_14770()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_14780()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_14790()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_147A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_147C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_147D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_147E0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_147F0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_14800()
{
  return Hasher._finalize()();
}

uint64_t sub_14810()
{
  return _typeName(_:qualified:)();
}

uint64_t BSEqualObjects()
{
  return _BSEqualObjects();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return _TCCAccessCopyBundleIdentifiersForService();
}

uint64_t TCCAccessCopyInformation()
{
  return _TCCAccessCopyInformation();
}

uint64_t TCCAccessSetForBundleId()
{
  return _TCCAccessSetForBundleId();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__activityControlForCustomMode(void *a1, const char *a2, ...)
{
  return _[a1 _activityControlForCustomMode];
}

id objc_msgSend__activityControlForPlaceholderMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityControlForPlaceholderMode:");
}

id objc_msgSend__cloudSyncState(void *a1, const char *a2, ...)
{
  return _[a1 _cloudSyncState];
}

id objc_msgSend__configureActivityListView(void *a1, const char *a2, ...)
{
  return _[a1 _configureActivityListView];
}

id objc_msgSend__configuredModeForSemanticType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configuredModeForSemanticType:");
}

id objc_msgSend__focusStatusDetailLabel(void *a1, const char *a2, ...)
{
  return _[a1 _focusStatusDetailLabel];
}

id objc_msgSend__handleSetupRequestForSemanticType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetupRequestForSemanticType:");
}

id objc_msgSend__listController(void *a1, const char *a2, ...)
{
  return _[a1 _listController];
}

id objc_msgSend__modeLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modeLabel:");
}

id objc_msgSend__presentSetupControllerForUnknownMode(void *a1, const char *a2, ...)
{
  return _[a1 _presentSetupControllerForUnknownMode];
}

id objc_msgSend__setCloudSyncPreferenceEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCloudSyncPreferenceEnabled:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__shouldShowWelcomeController(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowWelcomeController];
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activityColorName(void *a1, const char *a2, ...)
{
  return _[a1 activityColorName];
}

id objc_msgSend_activityDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 activityDisplayName];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityIdentifier];
}

id objc_msgSend_activitySemanticType(void *a1, const char *a2, ...)
{
  return _[a1 activitySemanticType];
}

id objc_msgSend_activitySymbolImageName(void *a1, const char *a2, ...)
{
  return _[a1 activitySymbolImageName];
}

id objc_msgSend_activityUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityUniqueIdentifier];
}

id objc_msgSend_addAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:forControlEvents:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addListener_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListener:withCompletionHandler:");
}

id objc_msgSend_addListenerForFocusActivationChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerForFocusActivationChanges:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSettingsUpdateListener_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSettingsUpdateListener:withCompletionHandler:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_allModesReturningError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allModesReturningError:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allReservedModes(void *a1, const char *a2, ...)
{
  return _[a1 allReservedModes];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return _[a1 boldButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bs_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_filter:");
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_bs_reduce_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_reduce:block:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return _[a1 buttonTray];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_configurationWithPointSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:weight:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDefaultModeConfigurationForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDefaultModeConfigurationForMode:");
}

id objc_msgSend_createEmptyModeConfigurationForMode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEmptyModeConfigurationForMode:error:");
}

id objc_msgSend_createModeConfigurationUsingTemplateForModeIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createModeConfigurationUsingTemplateForModeIdentifier:error:");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultTintColorName(void *a1, const char *a2, ...)
{
  return _[a1 defaultTintColorName];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_didChangeFocusStatusSharingSettingForApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeFocusStatusSharingSettingForApplicationIdentifier:");
}

id objc_msgSend_dismissKeyboardIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 dismissKeyboardIfNeeded];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dndModeKey(void *a1, const char *a2, ...)
{
  return _[a1 dndModeKey];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEvent];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_fcui_focusSettingsLocalizationBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fcui_focusSettingsLocalizationBundle");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_getCloudSyncStateReturningError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCloudSyncStateReturningError:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_imageSymbolWeight(void *a1, const char *a2, ...)
{
  return _[a1 imageSymbolWeight];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithTintColor_renderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithTintColor:renderingMode:");
}

id objc_msgSend_initWithActivityDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityDescription:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMode:");
}

id objc_msgSend_initWithName_modeIdentifier_symbolImageName_tintColorName_semanticType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:");
}

id objc_msgSend_initWithPlaceholderModes_allReservedModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaceholderModes:allReservedModes:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTitle_detailText_icon_contentLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:detailText:icon:contentLayout:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isActiveMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActiveMode:");
}

id objc_msgSend_isCloudSyncActive(void *a1, const char *a2, ...)
{
  return _[a1 isCloudSyncActive];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isIntelligenceAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isIntelligenceAvailable];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
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

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_maxUIAddableModes(void *a1, const char *a2, ...)
{
  return _[a1 maxUIAddableModes];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_modeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 modeIdentifier];
}

id objc_msgSend_modesCanImpactAvailability(void *a1, const char *a2, ...)
{
  return _[a1 modesCanImpactAvailability];
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

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_observersOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observersOfClass:");
}

id objc_msgSend_pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_placeholderModeForSemanticType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderModeForSemanticType:");
}

id objc_msgSend_placeholderModes(void *a1, const char *a2, ...)
{
  return _[a1 placeholderModes];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentSetupControllerForPlaceholderMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentSetupControllerForPlaceholderMode:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeListener:");
}

id objc_msgSend_removeListenerForFocusActivationChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeListenerForFocusActivationChanges:");
}

id objc_msgSend_requestAccessForEntityType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAccessForEntityType:completionHandler:");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_selectSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectSpecifier:");
}

id objc_msgSend_semanticType(void *a1, const char *a2, ...)
{
  return _[a1 semanticType];
}

id objc_msgSend_serviceForClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceForClientIdentifier:");
}

id objc_msgSend_setActivityViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityViews:");
}

id objc_msgSend_setAddButtonHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddButtonHidden:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCloudSyncPreferenceEnabled_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncPreferenceEnabled:error:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetailControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailControllerClass:");
}

id objc_msgSend_setDetailText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailText:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSetupDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupDelegate:");
}

id objc_msgSend_setShowCloseButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowCloseButton:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleHyphenationFactor:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupNavigationController_createDefaultModeConfigurationForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNavigationController:createDefaultModeConfigurationForMode:");
}

id objc_msgSend_setupNavigationControllerForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNavigationControllerForMode:");
}

id objc_msgSend_setupNavigationControllerForUnknownModeWithPlaceholderModes_allReservedModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNavigationControllerForUnknownModeWithPlaceholderModes:allReservedModes:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_showConfigurationForModeIdentifier_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showConfigurationForModeIdentifier:animate:");
}

id objc_msgSend_showController_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showController:animate:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_specifierDataSource(void *a1, const char *a2, ...)
{
  return _[a1 specifierDataSource];
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_symbolImageName(void *a1, const char *a2, ...)
{
  return _[a1 symbolImageName];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemDarkGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkGrayColor];
}

id objc_msgSend_systemGray5Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray5Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayTintColor];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_tintColorName(void *a1, const char *a2, ...)
{
  return _[a1 tintColorName];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_visibility(void *a1, const char *a2, ...)
{
  return _[a1 visibility];
}

id objc_msgSend_welcomeControllerWithAllReservedModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeControllerWithAllReservedModes:");
}

id objc_msgSend_welcomeControllerWithMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeControllerWithMode:");
}

id objc_msgSend_welcomeControllerWithPlaceholderModes_allReservedModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeControllerWithPlaceholderModes:allReservedModes:");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}