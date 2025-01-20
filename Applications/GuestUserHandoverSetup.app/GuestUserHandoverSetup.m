id sub_100003C64()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

void type metadata accessor for SBUISystemAperturePresentationBehaviors(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
}

void type metadata accessor for DSSGuestUserModeAppRestrictionState(uint64_t a1)
{
}

uint64_t sub_100003D0C()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_100003D58()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_100003DB0()
{
  return Hasher._finalize()();
}

void *sub_100003E18@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100003E28(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_100003E34(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100003E3C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100003E50@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100003E64@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100003E78(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100003EA8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100003ED4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100003EF8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100003F0C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100003F20(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100003F34@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100003F48(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100003F5C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100003F70(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100003F84()
{
  return *v0 == 0;
}

uint64_t sub_100003F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100003FAC(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_100003FC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

BOOL sub_10000402C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100004040@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1000041F4(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_100004080@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10000408C()
{
  return sub_10000411C(&qword_10002FF60, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_1000040D4()
{
  return sub_10000411C(&qword_10002FF68, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_10000411C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004164()
{
  return sub_10000411C(&qword_10002FF70, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_1000041AC()
{
  return sub_10000411C(&qword_10002FF78, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_1000041F4(uint64_t a1)
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

void type metadata accessor for CFUserNotification(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_100004254(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000429C()
{
  return sub_10000411C((unint64_t *)&qword_10002FF90, type metadata accessor for CFString);
}

uint64_t sub_1000042E4()
{
  return sub_10000411C(&qword_10002FF98, type metadata accessor for CFString);
}

id sub_100004338(void *a1, void *a2)
{
  v26.receiver = v2;
  v26.super_class = (Class)type metadata accessor for LiveActivityImageAccessoryView();
  [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = v5;
  id v8 = [v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setContentMode:1];
  id v9 = [a1 imageWithTintColor:a2];
  [v8 setImage:v9];

  [v7 addSubview:v8];
  id v25 = self;
  sub_100004750(&qword_100030028);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001EDD0;
  id v11 = [v8 topAnchor];
  id v12 = [v7 topAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:4.0];

  *(void *)(v10 + 32) = v13;
  id v14 = [v8 leadingAnchor];
  id v15 = [v7 leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];

  *(void *)(v10 + 40) = v16;
  id v17 = [v8 trailingAnchor];
  id v18 = [v7 trailingAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];

  *(void *)(v10 + 48) = v19;
  id v20 = [v8 bottomAnchor];
  id v21 = [v7 bottomAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21 constant:-4.0];

  *(void *)(v10 + 56) = v22;
  specialized Array._endMutation()();
  sub_100004794();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v25 activateConstraints:isa];

  return v7;
}

id sub_1000046F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivityImageAccessoryView();
  return [super dealloc];
}

uint64_t type metadata accessor for LiveActivityImageAccessoryView()
{
  return self;
}

uint64_t sub_100004750(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004794()
{
  unint64_t result = qword_100030030;
  if (!qword_100030030)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100030030);
  }
  return result;
}

void *sub_1000047D4()
{
  uint64_t v0 = type metadata accessor for UIButton.Configuration.TitleAlignment();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for UIButton.Configuration.Size();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for UIButton.Configuration();
  uint64_t v8 = *(void *)(v20 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)&v19 - v12;
  static UIButton.Configuration.plain()();
  UIButton.Configuration.title.setter();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for UIButton.Configuration.Size.small(_:), v4);
  UIButton.Configuration.buttonSize.setter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for UIButton.Configuration.TitleAlignment.trailing(_:), v0);
  UIButton.Configuration.titleAlignment.setter();
  UIButton.Configuration.titlePadding.setter();
  UIButton.Configuration.contentInsets.setter();
  sub_100005944(0, &qword_1000300E8);
  uint64_t v14 = v20;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v20);
  id v15 = (void *)UIButton.init(configuration:primaryAction:)();
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v16 = [self systemBlueColor];
  [v15 setTintColor:v16];

  [v15 setHidden:1];
  [v15 setEnabled:0];
  LODWORD(v17) = 1144750080;
  [v15 setContentHuggingPriority:0 forAxis:v17];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v14);
  return v15;
}

id sub_100004B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_headerLabel;
  id v5 = objc_allocWithZone((Class)UILabel);
  uint64_t v6 = v2;
  id v7 = [v5 initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [self preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v7 setFont:v8];

  id v9 = [self secondaryLabelColor];
  [v7 setTextColor:v9];

  *(void *)&v2[v4] = v7;
  uint64_t v10 = OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_actionButton;
  *(void *)&v6[v10] = sub_1000047D4();
  id v11 = &v6[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;

  if (a2)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v16.receiver = v6;
  v16.super_class = (Class)type metadata accessor for AppSelectionSectionHeaderView();
  [super initWithReuseIdentifier:v12];

  id v14 = v13;
  sub_100004E34();

  return v14;
}

uint64_t sub_100004D30()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for AppSelectionSectionHeaderView();
  [super prepareForReuse];
  [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_headerLabel] setText:0];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_actionButton];
  [v1 setTitle:0 forState:0];
  [v1 setHidden:1];
  [v1 setEnabled:0];
  uint64_t v2 = &v0[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action];
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  return sub_1000057B4(v3);
}

id sub_100004E34()
{
  uint64_t v1 = v0;
  id v2 = [v0 contentView];
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_headerLabel];
  [v2 addSubview:v3];

  id v4 = [v1 contentView];
  id v41 = *(id *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_actionButton];
  [v4 addSubview:];

  id v42 = self;
  sub_100004750(&qword_100030028);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001EE10;
  id v6 = [v3 topAnchor];
  id v7 = [v1 contentView];
  id v8 = [v7 layoutMarginsGuide];

  id v9 = [v8 topAnchor];
  id v10 = [v6 constraintEqualToAnchor:v9];

  *(void *)(v5 + 32) = v10;
  id v11 = [v3 leadingAnchor];
  id v12 = [v1 contentView];
  id v13 = [v12 layoutMarginsGuide];

  id v14 = [v13 leadingAnchor];
  id v15 = [v11 constraintEqualToAnchor:v14];

  *(void *)(v5 + 40) = v15;
  id v16 = [v3 bottomAnchor];
  id v17 = [v1 contentView];
  id v18 = [v17 layoutMarginsGuide];

  id v19 = [v18 bottomAnchor];
  id v20 = [v16 constraintEqualToAnchor:v19];

  *(void *)(v5 + 48) = v20;
  id v21 = [v41 topAnchor];
  id v22 = [v1 contentView];
  id v23 = [v22 layoutMarginsGuide];

  id v24 = [v23 topAnchor];
  id v25 = [v21 constraintEqualToAnchor:v24];

  *(void *)(v5 + 56) = v25;
  id v26 = [v41 leadingAnchor];
  id v27 = [v3 trailingAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27];

  *(void *)(v5 + 64) = v28;
  id v29 = [v41 trailingAnchor];
  id v30 = [v1 contentView];
  id v31 = [v30 layoutMarginsGuide];

  id v32 = [v31 trailingAnchor];
  id v33 = [v29 constraintEqualToAnchor:v32];

  *(void *)(v5 + 72) = v33;
  id v34 = [v41 bottomAnchor];
  id v35 = [v1 contentView];
  id v36 = [v35 layoutMarginsGuide];

  id v37 = [v36 bottomAnchor];
  id v38 = [v34 constraintEqualToAnchor:v37];

  *(void *)(v5 + 80) = v38;
  specialized Array._endMutation()();
  sub_100005944(0, (unint64_t *)&qword_100030030);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v42 activateConstraints:isa];

  return [v41 addTarget:v1 action:"performAuxillaryAction" forControlEvents:64];
}

id sub_1000053A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  v23[1] = a1;
  uint64_t v6 = type metadata accessor for UIButton.Configuration.TitleAlignment();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UIButton.Configuration.Size();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004750(&qword_1000300E0);
  __chkstk_darwin(v14 - 8);
  id v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = *(void **)&v5[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_actionButton];
  static UIButton.Configuration.plain()();
  swift_bridgeObjectRetain();
  UIButton.Configuration.title.setter();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for UIButton.Configuration.Size.small(_:), v10);
  UIButton.Configuration.buttonSize.setter();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for UIButton.Configuration.TitleAlignment.trailing(_:), v6);
  UIButton.Configuration.titleAlignment.setter();
  UIButton.Configuration.titlePadding.setter();
  UIButton.Configuration.contentInsets.setter();
  uint64_t v18 = type metadata accessor for UIButton.Configuration();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 0, 1, v18);
  UIButton.configuration.setter();
  [v17 setHidden:0];
  [v17 setEnabled:1];
  id v19 = &v5[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action];
  uint64_t v20 = *(void *)&v5[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action];
  uint64_t v21 = v25;
  *(void *)id v19 = v24;
  *((void *)v19 + 1) = v21;
  swift_retain();
  sub_1000057B4(v20);
  return [v5 setNeedsLayout];
}

id sub_1000056FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSelectionSectionHeaderView();
  return [super dealloc];
}

uint64_t type metadata accessor for AppSelectionSectionHeaderView()
{
  return self;
}

uint64_t sub_1000057B4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000057C4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_1000057D4()
{
  uint64_t v1 = OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_headerLabel;
  id v2 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [self preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v2 setFont:v3];

  id v4 = [self secondaryLabelColor];
  [v2 setTextColor:v4];

  *(void *)&v0[v1] = v2;
  uint64_t v5 = OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_actionButton;
  *(void *)&v0[v5] = sub_1000047D4();
  uint64_t v6 = &v0[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;

  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100005944(uint64_t a1, unint64_t *a2)
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

void sub_100005980()
{
  qword_1000300F0 = (uint64_t)&off_100028E38;
}

uint64_t sub_100005994()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_100005A4C;
  return GuestUserHandoverService.activate()();
}

uint64_t sub_100005A4C()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100005B88, v1, v0);
}

uint64_t sub_100005B88()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005BE8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22GuestUserHandoverSetup17LiveActivityModel_guestUserHandoverService;
  uint64_t v2 = type metadata accessor for GuestUserHandoverService();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC22GuestUserHandoverSetup17LiveActivityModel_airPlayReceiverCoordinator;
  uint64_t v4 = type metadata accessor for AirPlayReceiverCoordinator();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_100005CCC()
{
  return type metadata accessor for LiveActivityModel();
}

uint64_t type metadata accessor for LiveActivityModel()
{
  uint64_t result = qword_100030130;
  if (!qword_100030130) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005D20()
{
  uint64_t result = type metadata accessor for GuestUserHandoverService();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AirPlayReceiverCoordinator();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100005DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 48) = a4;
  *(void *)(v5 + 56) = a5;
  return _swift_task_switch(sub_100005E0C, 0, 0);
}

uint64_t sub_100005E0C()
{
  uint64_t v11 = v0;
  if (qword_10002FF10 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[8] = sub_100007604(v1, (uint64_t)qword_100031758);
  unint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = _typeName(_:qualified:)();
    v0[5] = sub_10001CA98(v5, v6, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%s] Requesting to end Guest User Mode", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v0[9] = OBJC_IVAR____TtC22GuestUserHandoverSetup17LiveActivityModel_guestUserHandoverService;
  type metadata accessor for MainActor();
  v0[10] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100006014, v8, v7);
}

uint64_t sub_100006014()
{
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  void *v1 = v0;
  v1[1] = sub_1000060B4;
  return GuestUserHandoverService.endGuestUserMode()();
}

uint64_t sub_1000060B4()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_100006338;
  }
  else {
    unint64_t v2 = sub_1000061C8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000061C8()
{
  uint64_t v9 = v0;
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v4 = _typeName(_:qualified:)();
    *(void *)(v0 + 32) = sub_10001CA98(v4, v5, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "[%s] Request to end Guest User Mode succeeded", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100006338()
{
  uint64_t v11 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = _typeName(_:qualified:)();
    v0[2] = sub_10001CA98(v5, v6, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "[%s] Request to end Guest User Mode failed with error: %@", (uint8_t *)v3, 0x16u);
    sub_100004750((uint64_t *)&unk_100030CD0);
    swift_arrayDestroy();
    swift_slowDealloc();
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
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100006574()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  unint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  v6[5] = v1;
  swift_retain();
  sub_100009574((uint64_t)v4, (uint64_t)&unk_100030210, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_100006698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = a5;
  return _swift_task_switch(sub_1000066B8, 0, 0);
}

uint64_t sub_1000066B8()
{
  uint64_t v11 = v0;
  if (qword_10002FF10 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007604(v1, (uint64_t)qword_100031758);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = _typeName(_:qualified:)();
    v0[2] = sub_10001CA98(v5, v6, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%s] Launching AirPlayReceiver with options to request View Mirroring", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v0[5] = OBJC_IVAR____TtC22GuestUserHandoverSetup17LiveActivityModel_airPlayReceiverCoordinator;
  type metadata accessor for MainActor();
  v0[6] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000068BC, v8, v7);
}

uint64_t sub_1000068BC()
{
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  void *v1 = v0;
  v1[1] = sub_10000695C;
  return AirPlayReceiverCoordinator.launchAirPlayReceiver()();
}

uint64_t sub_10000695C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_100006A50()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v2 - 8);
  v43 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v5 - 8);
  if (qword_10002FF10 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  v42[2] = sub_100007604(v6, (uint64_t)qword_100031758);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  BOOL v9 = os_log_type_enabled(v7, v8);
  v42[1] = v1;
  if (v9)
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v11 = _typeName(_:qualified:)();
    v49[0] = sub_10001CA98(v11, v12, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%s] Posting confirmation alert to end Guest User Mode", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100004750(&qword_1000301D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001EE50;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v48 = v14;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v15 = String.init(localized:table:bundle:locale:comment:)();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v15;
  *(void *)(inited + 80) = v16;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v48 = v17;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v18 = String.init(localized:table:bundle:locale:comment:)();
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = v18;
  *(void *)(inited + 152) = v19;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v48 = v20;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v21 = String.init(localized:table:bundle:locale:comment:)();
  *(void *)(inited + 240) = &type metadata for String;
  *(void *)(inited + 216) = v21;
  *(void *)(inited + 224) = v22;
  if (!kCFUserNotificationAlternateButtonTitleKey) {
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v48 = v23;
  AnyHashable.init<A>(_:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v24 = String.init(localized:table:bundle:locale:comment:)();
  *(void *)(inited + 312) = &type metadata for String;
  *(void *)(inited + 288) = v24;
  *(void *)(inited + 296) = v25;
  uint64_t v47 = (uint64_t)kCFUserNotificationAlertTopMostKey;
  CFStringRef v26 = (id)kCFUserNotificationAlertTopMostKey;
  sub_100004750(&qword_1000301D8);
  sub_10000763C();
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 384) = &type metadata for Bool;
  *(unsigned char *)(inited + 360) = 1;
  uint64_t v47 = SBUserNotificationDefaultButtonPresentationStyleKey;
  id v27 = SBUserNotificationDefaultButtonPresentationStyleKey;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 456) = &type metadata for UInt32;
  *(_DWORD *)(inited + 432) = 1;
  uint64_t v47 = SBUserNotificationDisplayActionButtonOnLockScreen;
  id v28 = SBUserNotificationDisplayActionButtonOnLockScreen;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 528) = &type metadata for Bool;
  *(unsigned char *)(inited + 504) = 1;
  uint64_t v47 = SBUserNotificationForcesModalAlertAppearance;
  id v29 = SBUserNotificationForcesModalAlertAppearance;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 600) = &type metadata for Bool;
  *(unsigned char *)(inited + 576) = 1;
  sub_100007E2C(inited);
  SInt32 v46 = 0;
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  CFUserNotificationRef v31 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &v46, isa);

  if (v31)
  {
    uint64_t v32 = type metadata accessor for TaskPriority();
    uint64_t v33 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v43, 1, 1, v32);
    id v34 = (void *)swift_allocObject();
    v34[2] = 0;
    v34[3] = 0;
    v34[4] = v31;
    v34[5] = v44;
    swift_retain();
    sub_100009574(v33, (uint64_t)&unk_1000301F0, (uint64_t)v34);
    swift_release();
  }
  else
  {
    id v35 = Logger.logObject.getter();
    uint64_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, (os_log_type_t)v36))
    {
      uint64_t v37 = swift_slowAlloc();
      v49[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v38 = _typeName(_:qualified:)();
      uint64_t v47 = sub_10001CA98(v38, v39, v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      swift_beginAccess();
      LODWORD(v45) = v46;
      uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v45 = sub_10001CA98(v40, v41, v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v36, "[%s] Unable to create user notification with error %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100007310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v5[2] = a5;
  v5[3] = *a5;
  sub_100004750(&qword_1000301C8);
  v5[4] = swift_task_alloc();
  uint64_t v6 = (void *)swift_task_alloc();
  v5[5] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100007400;
  return CFUserNotificationRef.userResponse()();
}

uint64_t sub_100007400(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100007500, 0, 0);
}

uint64_t sub_100007500()
{
  if (!v0[6])
  {
    uint64_t v2 = v0[3];
    uint64_t v1 = v0[4];
    uint64_t v3 = v0[2];
    uint64_t v4 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = 0;
    v5[3] = 0;
    v5[4] = v3;
    v5[5] = v2;
    swift_retain();
    sub_100009574(v1, (uint64_t)&unk_100030200, (uint64_t)v5);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100007604(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10000763C()
{
  unint64_t result = qword_1000301E0;
  if (!qword_1000301E0)
  {
    sub_1000076B0(&qword_1000301D8);
    sub_1000076F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000301E0);
  }
  return result;
}

uint64_t sub_1000076B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000076F8()
{
  unint64_t result = qword_10002FF90;
  if (!qword_10002FF90)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002FF90);
  }
  return result;
}

uint64_t sub_100007750()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100007798(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = (void *)v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100007AEC;
  return sub_100007310(a1, v4, v5, v7, v6);
}

uint64_t sub_10000785C()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100007908;
  *(_OWORD *)(v2 + 48) = v3;
  return _swift_task_switch(sub_100005E0C, 0, 0);
}

uint64_t sub_100007908()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007A00()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100007A40()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100007AEC;
  *(_OWORD *)(v2 + 24) = v3;
  return _swift_task_switch(sub_1000066B8, 0, 0);
}

void sub_100007AF0()
{
  uint64_t v0 = sub_100004750(&qword_1000300E0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UIButton.Configuration.Size();
  uint64_t v3 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UIButton.Configuration();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  BOOL v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  [objc_allocWithZone((Class)UIButton) init setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [self sbui_systemApertureSymbolButtonConfiguration];
  static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();

  id v11 = [self sbui_systemApertureDefaultConfiguration];
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [self systemImageNamed:v12 withConfiguration:v11];

  if (v13)
  {

    UIButton.Configuration.image.setter();
    uint64_t v14 = self;
    id v15 = [v14 redColor];
    UIButton.Configuration.baseBackgroundColor.setter();
    id v16 = [v14 redColor];
    UIButton.Configuration.baseForegroundColor.setter();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for UIButton.Configuration.Size.medium(_:), v18);
    UIButton.Configuration.buttonSize.setter();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v2, v9, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v2, 0, 1, v6);
    UIButton.configuration.setter();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_100007E2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004750(&qword_1000302C0);
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
    sub_100008464(v6, (uint64_t)v15);
    unint64_t result = sub_10001D0F0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1000084CC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_100007F5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004750((uint64_t *)&unk_1000302D0);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10001D178(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    *long long v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

void sub_100008078(char a1)
{
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for ProxCardSetUpRootViewController();
  [super viewDidAppear:a1 & 1];
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_model];
  uint64_t v4 = (objc_class *)type metadata accessor for AllowGuestProximityCardViewController();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC22GuestUserHandoverSetup37AllowGuestProximityCardViewController_model] = v3;
  v12.receiver = v5;
  v12.super_class = v4;
  swift_retain();
  id v6 = [super initWithContentView:0];
  id v7 = [self defaultConfiguration];
  if (v7)
  {
    id v8 = v7;
    id v9 = [self blackColor];
    [v8 setCustomBackgroundColor:v9];

    id v10 = [v1 presentProxCardFlowWithDelegate:v1 initialViewController:v6 configuration:v8];
    long long v11 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_proxNavigationController];
    *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_proxNavigationController] = v10;
  }
  else
  {
    __break(1u);
  }
}

id sub_1000082C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProxCardSetUpRootViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ProxCardSetUpRootViewController()
{
  return self;
}

id sub_10000837C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_proxNavigationController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_configurationContext] = a1;
  if (!a1)
  {
    id v7 = v1;
    goto LABEL_5;
  }
  uint64_t v3 = v1;
  id v4 = [a1 userInfo];
  if (!v4)
  {
LABEL_5:
    uint64_t v6 = sub_100007E2C((uint64_t)&_swiftEmptyArrayStorage);
    goto LABEL_6;
  }
  uint64_t v5 = v4;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_6:
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_model] = sub_10000CBA4(v6);

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for ProxCardSetUpRootViewController();
  return [super initWithNibName:0 bundle:0];
}

uint64_t sub_100008464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004750(&qword_1000302C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000084CC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1000084DC()
{
  id v0 = [self blackColor];
  id v1 = [v0 colorWithAlphaComponent:0.9];

  qword_1000316A0 = (uint64_t)v1;
}

void sub_100008570()
{
  id v1 = v0;
  v68.receiver = v0;
  v68.super_class = (Class)type metadata accessor for LiveActivityPlatterViewController();
  [super viewDidLoad];
  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v3 = v2;
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [v1 view];
  if (!v4)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_leadingAccessoryView];
  [v4 addSubview:v6];

  id v7 = [v1 view];
  if (!v7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v8 = v7;
  objc_super v9 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_labelAccessoryView];
  [v7 addSubview:v9];

  id v10 = [v1 view];
  if (!v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  long long v11 = v10;
  objc_super v12 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_tapGestureInterceptorView];
  [v10 addSubview:v12];

  id v13 = [v1 view];
  if (!v13)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  v67 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_endGuestUserModeButton];
  [v13 addSubview:];

  sub_100004750(&qword_100030028);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10001EEE0;
  id v16 = [v6 leadingAnchor];
  id v17 = [v1 view];
  if (!v17)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v18 = v17;
  id v19 = [v17 leadingAnchor];

  id v20 = [v16 constraintEqualToAnchor:v19 constant:16.0];
  *(void *)(v15 + 32) = v20;
  id v21 = [v6 centerYAnchor];
  id v22 = [v1 view];
  if (!v22)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v23 = v22;
  id v24 = [v22 centerYAnchor];

  id v25 = [v21 constraintEqualToAnchor:v24];
  *(void *)(v15 + 40) = v25;
  id v26 = [v9 leadingAnchor];
  id v27 = [v6 trailingAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27 constant:4.0];

  *(void *)(v15 + 48) = v28;
  id v29 = [v9 centerYAnchor];
  id v30 = [v1 view];
  if (!v30)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  CFUserNotificationRef v31 = v30;
  id v32 = [v30 centerYAnchor];

  id v33 = [v29 constraintEqualToAnchor:v32];
  *(void *)(v15 + 56) = v33;
  id v34 = [v12 topAnchor];
  id v35 = [v1 view];
  if (!v35)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v36 = v35;
  id v37 = [v35 topAnchor];

  id v38 = [v34 constraintEqualToAnchor:v37];
  *(void *)(v15 + 64) = v38;
  id v39 = [v12 leadingAnchor];
  id v40 = [v1 view];
  if (!v40)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v41 = v40;
  id v42 = [v40 leadingAnchor];

  id v43 = [v39 constraintEqualToAnchor:v42];
  *(void *)(v15 + 72) = v43;
  id v44 = [v12 trailingAnchor];
  id v45 = [v1 view];
  if (!v45)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  SInt32 v46 = v45;
  id v47 = [v45 trailingAnchor];

  id v48 = [v44 constraintEqualToAnchor:v47];
  *(void *)(v15 + 80) = v48;
  id v49 = [v12 bottomAnchor];
  id v50 = [v1 view];
  if (!v50)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v51 = v50;
  id v52 = [v50 bottomAnchor];

  id v53 = [v49 constraintEqualToAnchor:v52];
  *(void *)(v15 + 88) = v53;
  id v54 = [v67 centerYAnchor];
  id v55 = [v1 view];
  if (!v55)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v56 = v55;
  id v57 = [v55 centerYAnchor];

  id v58 = [v54 constraintEqualToAnchor:v57];
  *(void *)(v15 + 96) = v58;
  id v59 = [v67 trailingAnchor];
  id v60 = [v1 view];
  if (v60)
  {
    v61 = v60;
    v62 = self;
    id v63 = [v61 trailingAnchor];

    id v64 = [v59 constraintEqualToAnchor:v63 constant:-16.0];
    *(void *)(v15 + 104) = v64;
    specialized Array._endMutation()();
    sub_100004794();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v62 activateConstraints:isa];

    id v66 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v1 action:"tapGestureDetectedWithSender:"];
    [v12 addGestureRecognizer:v66];
    [v67 addTarget:v1 action:"endGuestUserModeButtonTapped" forControlEvents:64];

    return;
  }
LABEL_29:
  __break(1u);
}

uint64_t sub_100008DA4()
{
  return sub_100009348("[%s] End Guest User Mode Button pressed.", (uint64_t (*)(uint64_t, uint64_t))sub_100006A50);
}

id sub_100008E40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivityPlatterViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for LiveActivityPlatterViewController()
{
  return self;
}

id sub_100008F14(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_leadingAccessoryView;
  uint64_t v4 = qword_10002FEE8;
  uint64_t v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_100031700;
  id v7 = self;
  id v8 = v6;
  id v9 = [v7 whiteColor];
  id v10 = objc_allocWithZone((Class)type metadata accessor for LiveActivityImageAccessoryView());
  id v11 = sub_100004338(v8, v9);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v5[v3] = v11;
  uint64_t v12 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_labelAccessoryView;
  id v13 = [objc_allocWithZone((Class)type metadata accessor for LiveActivityLabelAccessoryView()) init];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v5[v12] = v13;
  uint64_t v14 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_tapGestureInterceptorView;
  id v15 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v16 = [v7 clearColor];
  [v15 setBackgroundColor:v16];

  id v17 = [v15 layer];
  [v17 setHitTestsAsOpaque:1];

  *(void *)&v5[v14] = v15;
  uint64_t v18 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_endGuestUserModeButton;
  sub_100007AF0();
  id v20 = v19;
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v5[v18] = v20;
  *(void *)&v5[OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_liveActivityModel] = a1;
  swift_retain();

  v22.receiver = v5;
  v22.super_class = (Class)type metadata accessor for LiveActivityPlatterViewController();
  return [super initWithNibName:0 bundle:0];
}

void sub_100009134()
{
  id v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_leadingAccessoryView;
  if (qword_10002FEE8 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_100031700;
  uint64_t v4 = self;
  id v5 = v3;
  id v6 = [v4 whiteColor];
  id v7 = objc_allocWithZone((Class)type metadata accessor for LiveActivityImageAccessoryView());
  id v8 = sub_100004338(v5, v6);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v2] = v8;
  uint64_t v9 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_labelAccessoryView;
  id v10 = [objc_allocWithZone((Class)type metadata accessor for LiveActivityLabelAccessoryView()) init];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_tapGestureInterceptorView;
  id v12 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = [v4 clearColor];
  [v12 setBackgroundColor:v13];

  id v14 = [v12 layer];
  [v14 setHitTestsAsOpaque:1];

  *(void *)&v1[v11] = v12;
  uint64_t v15 = OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_endGuestUserModeButton;
  sub_100007AF0();
  id v17 = v16;
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v15] = v17;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100009348(const char *a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  swift_getObjectType();
  if (qword_10002FF10 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007604(v4, (uint64_t)qword_100031758);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    uint64_t v8 = _typeName(_:qualified:)();
    sub_10001CA98(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, a1, v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return a2(v10, v11);
}

void sub_1000094F4(uint64_t a1)
{
  id v3 = [v1 navigationController];
  if (v3)
  {
    id v4 = v3;
    [v3 pushViewController:a1 animated:1];
  }
}

uint64_t sub_100009574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000D46C(a1, &qword_1000301C8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100009720(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  char v5 = a2 & 1;
  uint64_t v6 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AudioHapticController();
  *(void *)(v2 + 16) = swift_allocObject();
  *(void *)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_appRestrictionState) = 1;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_shouldPlayAttentionAudioHaptics) = 1;
  GuestUserHandoverService.init()();
  uint64_t v9 = v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_requestConfiguration;
  uint64_t v10 = type metadata accessor for GuestUserRemoteUnlockRequestConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_playbackBehavior) = v5;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v13 = static MainActor.shared.getter();
  id v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v3;
  sub_100009574((uint64_t)v8, (uint64_t)&unk_100030500, (uint64_t)v14);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v3;
}

uint64_t sub_100009920()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  id v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_100005A4C;
  return GuestUserHandoverService.activate()();
}

void sub_1000099D8()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_shouldPlayAttentionAudioHaptics) == 1)
  {
    if (qword_10002FF08 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100007604(v1, (uint64_t)qword_100031740);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Playing attention request audio/haptics", v4, 2u);
      swift_slowDealloc();
    }

    v6[4] = sub_10000DE4C;
    v6[5] = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10000C98C;
    v6[3] = &unk_100029190;
    char v5 = _Block_copy(v6);
    swift_release();
    AudioServicesPlaySystemSoundWithCompletion(0x501u, v5);
    _Block_release(v5);
  }
}

uint64_t sub_100009B4C()
{
  v1[4] = v0;
  v1[5] = *v0;
  v1[6] = type metadata accessor for MainActor();
  v1[7] = static MainActor.shared.getter();
  uint64_t v2 = (void *)swift_task_alloc();
  v1[8] = v2;
  void *v2 = v1;
  v2[1] = sub_100009C24;
  return sub_10000A3F0();
}

uint64_t sub_100009C24(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v7 = v6;
    uint64_t v8 = sub_10000A328;
    uint64_t v9 = v5;
    uint64_t v10 = v7;
  }
  else
  {
    *(unsigned char *)(v4 + 112) = a1 & 1;
    uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v10 = v12;
    *(void *)(v4 + 80) = v11;
    *(void *)(v4 + 88) = v12;
    uint64_t v8 = sub_100009DB8;
    uint64_t v9 = v11;
  }
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_100009DB8()
{
  uint64_t v12 = v0;
  if (*(unsigned char *)(v0 + 112) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 32) + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_requestConfiguration;
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v2;
    void *v2 = v0;
    v2[1] = sub_10000A024;
    return GuestUserHandoverService.replayRequest(requestConfiguration:)(v1);
  }
  else
  {
    swift_release();
    if (qword_10002FF08 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100007604(v3, (uint64_t)qword_100031740);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      uint64_t v7 = _typeName(_:qualified:)();
      *(void *)(v0 + 16) = sub_10001CA98(v7, v8, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s unlock request failed", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_10000A024()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 88);
  uint64_t v4 = *(void *)(v2 + 80);
  if (v0) {
    os_log_type_t v5 = sub_10000A38C;
  }
  else {
    os_log_type_t v5 = sub_10000A160;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000A160()
{
  uint64_t v10 = v0;
  swift_release();
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007604(v1, (uint64_t)qword_100031740);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = _typeName(_:qualified:)();
    *(void *)(v0 + 24) = sub_10001CA98(v5, v6, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s successfully sent present prox card request to service", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_10000A328()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000A38C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000A3F0()
{
  v1[2] = *v0;
  v1[3] = type metadata accessor for MainActor();
  v1[4] = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[5] = v3;
  v1[6] = v2;
  return _swift_task_switch(sub_10000A4B0, v3, v2);
}

uint64_t sub_10000A4B0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = static MainActor.shared.getter();
  v0[7] = v2;
  uint64_t v3 = swift_task_alloc();
  v0[8] = v3;
  *(void *)(v3 + 16) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10000A5BC;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 11, v2, &protocol witness table for MainActor, 0xD000000000000019, 0x800000010001FBA0, sub_10000DCEC, v3, &type metadata for Bool);
}

uint64_t sub_10000A5BC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_10000A748;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_10000A6E0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10000A6E0()
{
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 88);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10000A748()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

void sub_10000A7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004750(&qword_100030540);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v8 + ((v6 + v7 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  aBlock[4] = sub_10000DD94;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000AB58;
  aBlock[3] = &unk_100029168;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  SBSRequestPasscodeUnlockUI();
  _Block_release(v9);
}

void sub_10000A970(char a1)
{
  if ((a1 & 1) != 0 && MKBGetDeviceLockState() - 1 >= 2)
  {
    sub_100004750(&qword_100030540);
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    if (qword_10002FF08 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100007604(v1, (uint64_t)qword_100031740);
    oslog = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 136315138;
      uint64_t v4 = _typeName(_:qualified:)();
      sub_10001CA98(v4, v5, &v7);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v2, "%s unlock request failed", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t sub_10000AB58(uint64_t a1, int a2)
{
  os_log_type_t v2 = *(void (**)(BOOL))(a1 + 32);
  BOOL v3 = a2 != 0;
  swift_retain();
  v2(v3);

  return swift_release();
}

uint64_t sub_10000ABB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for GuestUserRemoteUnlockResponse();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - v11;
  uint64_t v13 = type metadata accessor for GuestUserAccessError();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
  sub_10000D7C4((uint64_t)v12, (uint64_t)v10);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v15 = static MainActor.shared.getter();
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v15;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = v1;
  sub_10000D82C((uint64_t)v10, (uint64_t)v18 + v16);
  *(void *)((char *)v18 + v17) = v2;
  sub_100009574((uint64_t)v5, (uint64_t)&unk_100030538, (uint64_t)v18);
  swift_release();
  return sub_10000D9BC((uint64_t)v12);
}

uint64_t sub_10000AE30()
{
  uint64_t v1 = v0;
  uint64_t v19 = *v0;
  uint64_t v2 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ViewMirroringDevice();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for GuestUserRemoteUnlockResponse();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - v11;
  static ViewMirroringDevice.localDevice.getter();
  if (*(void *)((char *)v0 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_appRestrictionState) == 1)
  {
    GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter();
    uint64_t v18 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    ApplicationLibrary.selectedApplicationBundleIds.getter();
    uint64_t v10 = v18;
    swift_release();
  }
  GuestUserModeConfiguration.init(viewMirroringDevice:appRestrictionState:allowedApplicationBundleIds:)();
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  sub_10000D7C4((uint64_t)v12, (uint64_t)v10);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v14 = static MainActor.shared.getter();
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v1;
  sub_10000D82C((uint64_t)v10, (uint64_t)v16 + v15);
  *(void *)((char *)v16 + ((v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8)) = v19;
  sub_100009574((uint64_t)v4, (uint64_t)&unk_100030530, (uint64_t)v16);
  swift_release();
  return sub_10000D9BC((uint64_t)v12);
}

uint64_t sub_10000B138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a4;
  void v6[6] = a6;
  v6[7] = type metadata accessor for MainActor();
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_service;
  v6[8] = v8;
  v6[9] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v6[10] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_10000B204;
  return GuestUserHandoverService.sendGuestUserAccessResponse(_:)(a5);
}

uint64_t sub_10000B204()
{
  uint64_t v2 = (void *)*v1;
  v2[11] = v0;
  swift_task_dealloc();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[12] = v4;
  v2[13] = v3;
  if (v0) {
    uint64_t v5 = sub_10000B700;
  }
  else {
    uint64_t v5 = sub_10000B364;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000B364()
{
  uint64_t v10 = v0;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007604(v1, (uint64_t)qword_100031740);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = _typeName(_:qualified:)();
    *(void *)(v0 + 32) = sub_10001CA98(v5, v6, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s successfully sent Guest User Mode response", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10000B564;
  return GuestUserHandoverService.dismissRequest()();
}

uint64_t sub_10000B564()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 96);
  if (v0) {
    uint64_t v5 = sub_10000B988;
  }
  else {
    uint64_t v5 = sub_10000B6A0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000B6A0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000B700()
{
  uint64_t v12 = v0;
  swift_release();
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007604(v1, (uint64_t)qword_100031740);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = _typeName(_:qualified:)();
    v0[2] = sub_10001CA98(v6, v7, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s error sending Guest User Mode response: %@", (uint8_t *)v4, 0x16u);
    sub_100004750((uint64_t *)&unk_100030CD0);
    swift_arrayDestroy();
    swift_slowDealloc();
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000B988()
{
  uint64_t v12 = v0;
  swift_release();
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007604(v1, (uint64_t)qword_100031740);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = _typeName(_:qualified:)();
    v0[2] = sub_10001CA98(v6, v7, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s error sending Guest User Mode response: %@", (uint8_t *)v4, 0x16u);
    sub_100004750((uint64_t *)&unk_100030CD0);
    swift_arrayDestroy();
    swift_slowDealloc();
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000BC10(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  uint64_t v5 = type metadata accessor for GuestUserAccessError();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v13 = static MainActor.shared.getter();
  unint64_t v14 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v15 = (v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = v13;
  *((void *)v16 + 3) = &protocol witness table for MainActor;
  *((void *)v16 + 4) = v2;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v16[v14], v8, v5);
  *(void *)&v16[v15] = v4;
  sub_10000FD38((uint64_t)v11, (uint64_t)&unk_100030520, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_10000BE40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a4;
  void v6[6] = a6;
  v6[7] = type metadata accessor for MainActor();
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_service;
  v6[8] = v8;
  v6[9] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v6[10] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_10000BF0C;
  return GuestUserHandoverService.transportError(_:)(a5);
}

uint64_t sub_10000BF0C()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = sub_10000C428;
  }
  else {
    uint64_t v4 = sub_10000C068;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_10000C068()
{
  uint64_t v10 = v0;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007604(v1, (uint64_t)qword_100031740);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = _typeName(_:qualified:)();
    *(void *)(v0 + 32) = sub_10001CA98(v5, v6, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s successfully sent Guest Mode Error", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10000C268;
  return GuestUserHandoverService.dismissRequest()();
}

uint64_t sub_10000C268()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = sub_10000C6F4;
  }
  else {
    uint64_t v4 = sub_10000C3C4;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_10000C3C4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000C428()
{
  uint64_t v12 = v0;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007604(v1, (uint64_t)qword_100031740);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = _typeName(_:qualified:)();
    v0[2] = sub_10001CA98(v6, v7, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s error sending Guest Mode Error: %@", (uint8_t *)v4, 0x16u);
    sub_100004750((uint64_t *)&unk_100030CD0);
    swift_arrayDestroy();
    swift_slowDealloc();
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
  uint64_t v9 = (void *)swift_task_alloc();
  v0[12] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10000C268;
  return GuestUserHandoverService.dismissRequest()();
}

uint64_t sub_10000C6F4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000C758()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_requestConfiguration;
  uint64_t v2 = type metadata accessor for GuestUserRemoteUnlockRequestConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_service;
  uint64_t v4 = type metadata accessor for GuestUserHandoverService();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_10000C844()
{
  return type metadata accessor for ProxCardSetUpModel();
}

uint64_t type metadata accessor for ProxCardSetUpModel()
{
  uint64_t result = qword_100030360;
  if (!qword_100030360) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C898()
{
  uint64_t result = type metadata accessor for GuestUserRemoteUnlockRequestConfiguration();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for GuestUserHandoverService();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_10000C98C(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000C9D0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000CAAC;
  return v6(a1);
}

uint64_t sub_10000CAAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000CBA4(uint64_t a1)
{
  uint64_t v2 = sub_100004750(&qword_1000304D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for GuestUserRemoteUnlockRequestConfiguration();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v39 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v35 - v9;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100007604(v11, (uint64_t)qword_100031740);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  id v38 = v4;
  if (v14)
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v36 = v6;
    unint64_t v16 = (uint8_t *)v15;
    v42[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v16 = 136315138;
    uint64_t v37 = v5;
    v35[1] = v16 + 4;
    swift_bridgeObjectRetain();
    unint64_t v17 = v10;
    uint64_t v18 = Dictionary.description.getter();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = v18;
    uint64_t v10 = v17;
    *(void *)&long long v43 = sub_10001CA98(v21, v20, v42);
    uint64_t v5 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "contextUserInfo %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v36;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v40 = static GuestUserHandoverSetupCoordinator.Constants.isRetriggerKey.getter();
  unint64_t v41 = v22;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v23 = sub_10001D0F0((uint64_t)v42), (v24 & 1) != 0))
  {
    sub_10000D31C(*(void *)(a1 + 56) + 32 * v23, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  sub_10000D1AC((uint64_t)v42);
  if (!*((void *)&v44 + 1))
  {
    sub_10000D46C((uint64_t)&v43, &qword_1000304D8);
LABEL_15:
    char v25 = 0;
    goto LABEL_16;
  }
  if (!swift_dynamicCast() || (v40 & 1) == 0) {
    goto LABEL_15;
  }
  char v25 = 1;
LABEL_16:
  *(void *)&long long v43 = static GuestUserHandoverSetupCoordinator.Constants.requestConfigurationKey.getter();
  *((void *)&v43 + 1) = v26;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v27 = sub_10001D0F0((uint64_t)v42), (v28 & 1) != 0))
  {
    sub_10000D31C(*(void *)(a1 + 56) + 32 * v27, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000D1AC((uint64_t)v42);
  if (*((void *)&v44 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v29 = v40;
      unint64_t v30 = v41;
      goto LABEL_25;
    }
  }
  else
  {
    sub_10000D46C((uint64_t)&v43, &qword_1000304D8);
  }
  uint64_t v29 = 0;
  unint64_t v30 = 0xF000000000000000;
LABEL_25:
  sub_10000D200(v29, v30);
  sub_10000D26C(&qword_1000304E0);
  sub_10000D26C(&qword_1000304E8);
  sub_10000D26C(&qword_1000304F0);
  uint64_t v31 = (uint64_t)v38;
  TransportSerializable<>.init(transportData:)();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v31, 1, v5) == 1)
  {
    static GuestUserRemoteUnlockRequestConfiguration.emptyConfiguration.getter();
    sub_10000D46C(v31, &qword_1000304D0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v10, v31, v5);
  }
  uint64_t v32 = (uint64_t)v39;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v39, v10, v5);
  type metadata accessor for ProxCardSetUpModel();
  uint64_t v33 = swift_allocObject();
  sub_100009720(v32, v25);
  sub_10000D2B0(v29, v30);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  *(unsigned char *)(v33 + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_shouldPlayAttentionAudioHaptics) = v25 ^ 1;
  return v33;
}

uint64_t sub_10000D1AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000D200(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000D214(a1, a2);
  }
  return a1;
}

uint64_t sub_10000D214(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D26C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for GuestUserRemoteUnlockRequestConfiguration();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D2B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000D2C4(a1, a2);
  }
  return a1;
}

uint64_t sub_10000D2C4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D31C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D378()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D3B8()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100007AEC;
  return sub_100009920();
}

uint64_t sub_10000D46C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004750(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D4C8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D500(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007AEC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100030508 + dword_100030508);
  return v6(a1, v4);
}

uint64_t sub_10000D5B8()
{
  uint64_t v1 = type metadata accessor for GuestUserAccessError();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000D698(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for GuestUserAccessError() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100007908;
  return sub_10000BE40(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_10000D7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GuestUserRemoteUnlockResponse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D82C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GuestUserRemoteUnlockResponse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D890(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for GuestUserRemoteUnlockResponse() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100007AEC;
  return sub_10000B138(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_10000D9BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GuestUserRemoteUnlockResponse();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DA1C()
{
  uint64_t v1 = *(void *)(type metadata accessor for GuestUserRemoteUnlockResponse() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for GuestUserModeConfiguration();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    uint64_t v6 = type metadata accessor for GuestUserAccessError();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
    }
  }

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_10000DBC0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for GuestUserRemoteUnlockResponse() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100007908;
  return sub_10000B138(a1, v6, v7, v8, v9, v10);
}

void sub_10000DCEC(uint64_t a1)
{
  sub_10000A7C4(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000DCF4()
{
  uint64_t v1 = sub_100004750(&qword_100030540);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

void sub_10000DD94(char a1)
{
  sub_100004750(&qword_100030540);

  sub_10000A970(a1);
}

uint64_t sub_10000DE34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DE44()
{
  return swift_release();
}

void sub_10000DE58()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Locale();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v4 - 8);
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for ErrorProximityCardViewController();
  [super viewDidLoad];
  sub_100018FE0();
  sub_10000E300();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v5];

  type metadata accessor for GuestUserAccessError();
  sub_10000ED10();
  Error.localizedDescription.getter();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setSubtitle:v6];

  sub_100004750(&qword_100030028);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001EF90;
  id v8 = [self systemYellowColor];
  id v9 = [self configurationWithPointSize:100.0];
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [self _systemImageNamed:v10 withConfiguration:v9];

  if (v11)
  {
    id v12 = [v11 imageWithTintColor:v8 renderingMode:1];

    *(void *)(v7 + 32) = v12;
    specialized Array._endMutation()();
    sub_10000ED68();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v1 setImages:isa];

    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v1;
    *(void *)(v14 + 24) = ObjectType;
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v16 = (void *)swift_allocObject();
    v16[2] = v15;
    v16[3] = sub_10000EDE0;
    v16[4] = v14;
    id v17 = v1;
    swift_retain();
    swift_retain();
    NSString v18 = String._bridgeToObjectiveC()();
    aBlock[4] = sub_10000EE60;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100019FDC;
    aBlock[3] = &unk_100029240;
    unint64_t v19 = _Block_copy(aBlock);
    id v20 = [self actionWithTitle:v18 style:0 handler:v19];

    _Block_release(v19);
    swift_release();
    swift_release();
    id v21 = [v17 addAction:v20];
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000E300()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for GuestUserAccessError();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v11 = (char *)&v25 - v10;
  id v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v25 - v10, v0, v5);
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v11, v5) == enum case for GuestUserAccessError.remoteUnlockFailed(_:))
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    return String.init(localized:table:bundle:locale:comment:)();
  }
  else
  {
    unint64_t v30 = v3;
    if (qword_10002FF08 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100007604(v14, (uint64_t)qword_100031740);
    v12(v9, v0, v5);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.fault.getter();
    int v17 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v18 = swift_slowAlloc();
      int v28 = v17;
      uint64_t v19 = v18;
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v32 = v29;
      *(_DWORD *)uint64_t v19 = 136315394;
      os_log_t v27 = v15;
      uint64_t v31 = sub_10001CA98(0xD000000000000014, 0x800000010001FCE0, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v19 + 12) = 2112;
      uint64_t v25 = v19 + 14;
      sub_10000ED10();
      swift_allocError();
      v12(v20, (uint64_t)v9, v5);
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v31 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v26 = v21;
      unint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
      v22(v9, v5);
      os_log_t v23 = v27;
      _os_log_impl((void *)&_mh_execute_header, v27, (os_log_type_t)v28, "%s found unexpected GuestUserAccessError: (%@; falling back to .remoteUnlockFailed",
        (uint8_t *)v19,
        0x16u);
      sub_100004750((uint64_t *)&unk_100030CD0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      unint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
      v22(v9, v5);
    }
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    uint64_t v13 = String.init(localized:table:bundle:locale:comment:)();
    v22(v11, v5);
  }
  return v13;
}

id sub_10000E7E0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100007604(v6, (uint64_t)qword_100031740);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  id v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = a2;
    uint64_t v14 = v13;
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315394;
    unint64_t v22 = a1;
    uint64_t v15 = _typeName(_:qualified:)();
    uint64_t v23 = sub_10001CA98(v15, v16, &v24);
    uint64_t v21 = a3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v23 = sub_10001CA98(0x4C64694477656976, 0xED0000292864616FLL, &v24);
    a3 = v21;
    a1 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v20;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
  sub_10000BC10(a3 + OBJC_IVAR____TtC22GuestUserHandoverSetup32ErrorProximityCardViewController_error);
  swift_release();
  return [a1 dismissViewControllerAnimated:1 completion:0];
}

id sub_10000EB54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ErrorProximityCardViewController();
  return [super dealloc];
}

uint64_t sub_10000EC0C()
{
  return type metadata accessor for ErrorProximityCardViewController();
}

uint64_t type metadata accessor for ErrorProximityCardViewController()
{
  uint64_t result = qword_100030578;
  if (!qword_100030578) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000EC60()
{
  uint64_t result = type metadata accessor for GuestUserAccessError();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000ED00()
{
  return swift_retain();
}

unint64_t sub_10000ED10()
{
  unint64_t result = qword_100030588;
  if (!qword_100030588)
  {
    type metadata accessor for GuestUserAccessError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030588);
  }
  return result;
}

unint64_t sub_10000ED68()
{
  unint64_t result = qword_100030590;
  if (!qword_100030590)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100030590);
  }
  return result;
}

uint64_t sub_10000EDA8()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10000EDE0(void *a1, uint64_t a2)
{
  return sub_10000E7E0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000EDE8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EE20()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000EE60(uint64_t a1)
{
  sub_100019F40(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_10000EE6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EE7C()
{
  return swift_release();
}

uint64_t sub_10000EE84(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  id v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
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

id sub_10000F014()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_10000F0F8(void *a1)
{
  swift_getObjectType();
  id v2 = [a1 role];
  id v3 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v2];

  id v4 = [a1 role];
  if (qword_10002FED0 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_1000300F0;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  LOBYTE(v5) = sub_10000EE84(v6, v7, (void *)v5);

  swift_bridgeObjectRelease();
  if (v5) {
    type metadata accessor for LiveActivitySceneDelegate();
  }
  else {
    type metadata accessor for ProxCardSetUpSceneDelegate();
  }
  [v3 setDelegateClass:swift_getObjCClassFromMetadata()];
  if (qword_10002FEF8 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007604(v8, (uint64_t)qword_100031710);
  id v9 = a1;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v13 = _typeName(_:qualified:)();
    sub_10001CA98(v13, v14, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    id v15 = [v9 role];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;

    sub_10001CA98(v16, v18, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s application configuring for role %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return v3;
}

id sub_10000F408(double a1)
{
  uint64_t v3 = Application.bundleIdentifier.getter();
  uint64_t v5 = v4;
  uint64_t v6 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v1 + 16);
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_10001D178(v3, v5);
    if (v9)
    {
      id v10 = *(id *)(*(void *)(v7 + 56) + 8 * v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = Application.appIconImage.getter();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    id v13 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v11 scale:0 orientation:a1];
  }
  else
  {
    if (qword_10002FEE0 != -1) {
      swift_once();
    }
    id v13 = (id)qword_100030630;
  }
  id v10 = v13;
  uint64_t v14 = Application.bundleIdentifier.getter();
  uint64_t v16 = v15;
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v6;
  *uint64_t v6 = 0x8000000000000000;
  sub_10000FA14((uint64_t)v10, v14, v16, isUniquelyReferenced_nonNull_native);
  *uint64_t v6 = v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  return v10;
}

uint64_t sub_10000F5DC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AppIconImageCache()
{
  return self;
}

void sub_10000F638()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self systemImageNamed:v0];

  if (v1)
  {
    id v2 = [self systemBlueColor];
    id v3 = [v1 imageWithTintColor:v2];

    qword_100030630 = (uint64_t)v3;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000F704(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  sub_100004750((uint64_t *)&unk_1000302D0);
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
  id v35 = v2;
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
    unint64_t v22 = (void *)(v5 + 64);
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
          id v3 = v35;
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
  id v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

void sub_10000FA14(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001D178(a2, a3);
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
    sub_10000FB84();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10000F704(v15, a4 & 1);
  unint64_t v20 = sub_10001D178(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_10000FB84()
{
  id v1 = v0;
  sub_100004750((uint64_t *)&unk_1000302D0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
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

uint64_t sub_10000FD38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100011974(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_10000FEB8()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  v33.receiver = v0;
  v33.super_class = (Class)type metadata accessor for AllowGuestProximityCardViewController();
  [super viewDidLoad];
  sub_100019340();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v4];

  sub_100011284();
  p_types = (char **)(&stru_10002DFF8 + 8);
  if (MKBGetDeviceLockState() - 1 > 1)
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v0;
    *(void *)(v12 + 24) = ObjectType;
    uint64_t v13 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v14 = (void *)swift_allocObject();
    v14[2] = v13;
    v14[3] = sub_100011794;
    v14[4] = v12;
    uint64_t v25 = ObjectType;
    id v15 = v0;
    swift_retain();
    swift_retain();
    NSString v16 = String._bridgeToObjectiveC()();
    uint64_t v31 = sub_1000117D8;
    uint64_t v32 = v14;
    aBlock = _NSConcreteStackBlock;
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_100019FDC;
    uint64_t v30 = &unk_1000292F0;
    uint64_t v17 = _Block_copy(&aBlock);
    unint64_t v26 = self;
    id v18 = [v26 actionWithTitle:v16 style:0 handler:v17];

    _Block_release(v17);
    p_types = &stru_10002DFF8.types;
    swift_release();
    swift_release();
    id v19 = [v15 addAction:v18];
    swift_bridgeObjectRelease();
    swift_release();

    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v25;
    uint64_t v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    int64_t v22 = (void *)swift_allocObject();
    v22[2] = v21;
    v22[3] = sub_10001180C;
    v22[4] = v20;
    swift_retain();
    swift_retain();
    NSString v9 = String._bridgeToObjectiveC()();
    uint64_t v31 = sub_1000119D4;
    uint64_t v32 = v22;
    aBlock = _NSConcreteStackBlock;
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_100019FDC;
    uint64_t v30 = &unk_100029368;
    uint64_t v10 = _Block_copy(&aBlock);
    id v11 = [v26 actionWithTitle:v9 style:1 handler:v10];
  }
  else
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = ObjectType;
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v7;
    v8[3] = sub_100011828;
    v8[4] = v6;
    swift_retain();
    swift_retain();
    NSString v9 = String._bridgeToObjectiveC()();
    uint64_t v31 = sub_1000119D4;
    uint64_t v32 = v8;
    aBlock = _NSConcreteStackBlock;
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_100019FDC;
    uint64_t v30 = &unk_1000293E0;
    uint64_t v10 = _Block_copy(&aBlock);
    id v11 = [self actionWithTitle:v9 style:0 handler:v10];
  }
  id v23 = v11;

  _Block_release(v10);
  swift_release();
  swift_release();
  id v24 = [v0 p_types[457] v23];
  swift_bridgeObjectRelease();
  swift_release();
}

uint64_t sub_10001055C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100007604(v7, (uint64_t)qword_100031740);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v11 = _typeName(_:qualified:)();
    uint64_t v18 = sub_10001CA98(v11, v12, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s requesting passcode unlock", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  type metadata accessor for MainActor();
  id v14 = a1;
  uint64_t v15 = static MainActor.shared.getter();
  NSString v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v14;
  v16[5] = a2;
  sub_10000FD38((uint64_t)v6, (uint64_t)&unk_100030730, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_1000107D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  type metadata accessor for MainActor();
  v5[4] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[5] = v7;
  v5[6] = v6;
  return _swift_task_switch(sub_100010870, v7, v6);
}

uint64_t sub_100010870()
{
  uint64_t v1 = v0[3];
  uint64_t ObjectType = swift_getObjectType();
  v0[7] = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100010928;
  return sub_100009B4C();
}

uint64_t sub_100010928()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_100010AA8;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_100010A44;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100010A44()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100010AA8()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100010B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007604(v4, (uint64_t)qword_100031740);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v8 = _typeName(_:qualified:)();
    sub_10001CA98(v8, v9, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s continue guest user set up", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v10 = *(void *)(a3 + OBJC_IVAR____TtC22GuestUserHandoverSetup37AllowGuestProximityCardViewController_model);
  uint64_t v11 = (objc_class *)type metadata accessor for AppRestrictionProximityCardViewController();
  unint64_t v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC22GuestUserHandoverSetup41AppRestrictionProximityCardViewController_model] = v10;
  v15.receiver = v12;
  v15.super_class = v11;
  swift_retain();
  [super initWithContentView:0];
  swift_getObjectType();
  sub_1000094F4((uint64_t)v13);
}

id sub_100010D28(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100007604(v4, (uint64_t)qword_100031740);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = a2;
    uint64_t v12 = v11;
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v13 = _typeName(_:qualified:)();
    uint64_t v15 = sub_10001CA98(v13, v14, &v21);
    uint64_t v19 = a1;
    uint64_t v20 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v20 = sub_10001CA98(0x4C64694477656976, 0xED0000292864616FLL, &v21);
    a1 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v18;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
  sub_10000ABB0();
  swift_release();
  return [a1 dismissViewControllerAnimated:1 completion:0];
}

void sub_100011048(char a1)
{
  swift_getObjectType();
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for AllowGuestProximityCardViewController();
  [super viewDidAppear:a1 & 1];
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100007604(v3, (uint64_t)qword_100031740);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v7 = _typeName(_:qualified:)();
    sub_10001CA98(v7, v8, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s viewDidAppear animated:%{BOOL}d", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000099D8();
}

void sub_100011284()
{
  uint64_t v1 = v0;
  int v2 = *(unsigned __int8 *)(*(void *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup37AllowGuestProximityCardViewController_model]
                          + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_playbackBehavior);
  id v3 = objc_allocWithZone((Class)type metadata accessor for VideoPlayerView());
  id v4 = sub_100012254(v2);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [v0 contentView];
  [v5 addSubview:v4];

  uint64_t v31 = self;
  sub_100004750(&qword_100030028);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001F020;
  id v7 = [v4 topAnchor];
  id v8 = [v1 contentView];
  id v9 = [v8 mainContentGuide];

  id v10 = [v9 topAnchor];
  id v11 = [v7 constraintGreaterThanOrEqualToAnchor:v10];

  *(void *)(v6 + 32) = v11;
  id v12 = [v4 centerXAnchor];
  id v13 = [v1 contentView];
  id v14 = [v13 mainContentGuide];

  id v15 = [v14 centerXAnchor];
  id v16 = [v12 constraintEqualToAnchor:v15];

  *(void *)(v6 + 40) = v16;
  id v17 = [v4 centerYAnchor];
  id v18 = [v1 contentView];
  id v19 = [v18 mainContentGuide];

  id v20 = [v19 centerYAnchor];
  id v21 = [v17 constraintEqualToAnchor:v20];

  *(void *)(v6 + 48) = v21;
  id v22 = [v4 bottomAnchor];
  id v23 = [v1 contentView];
  id v24 = [v23 mainContentGuide];

  id v25 = [v24 bottomAnchor];
  id v26 = [v22 constraintLessThanOrEqualToAnchor:v25];

  *(void *)(v6 + 56) = v26;
  id v27 = [v4 widthAnchor];
  id v28 = [v27 constraintEqualToConstant:370.0];

  *(void *)(v6 + 64) = v28;
  id v29 = [v4 heightAnchor];
  id v30 = [v29 constraintEqualToConstant:180.0];

  *(void *)(v6 + 72) = v30;
  specialized Array._endMutation()();
  sub_100004794();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v31 activateConstraints:isa];
}

id sub_1000116E4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AllowGuestProximityCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for AllowGuestProximityCardViewController()
{
  return self;
}

uint64_t sub_10001174C()
{
  return swift_retain();
}

uint64_t sub_10001175C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100011794(uint64_t a1, uint64_t a2)
{
  sub_100010B18(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001179C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000117D8(uint64_t a1)
{
  sub_100019F4C(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_1000117E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000117F4()
{
  return swift_release();
}

uint64_t sub_1000117FC()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001180C(void *a1, uint64_t a2)
{
  return sub_100010D28(a1, a2);
}

uint64_t sub_100011818()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011828(void *a1, uint64_t a2)
{
  return sub_10001055C(a1, a2);
}

uint64_t sub_100011834()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100011874()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000118B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *id v8 = v2;
  v8[1] = sub_100007908;
  return sub_1000107D8(a1, v4, v5, v7, v6);
}

uint64_t sub_100011974(uint64_t a1)
{
  uint64_t v2 = sub_100004750(&qword_1000301C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000119E8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7473614C776F6873;
  }
  else {
    uint64_t v3 = 0x6D6F724679616C70;
  }
  if (v2) {
    unint64_t v4 = 0xED00007472617453;
  }
  else {
    unint64_t v4 = 0xED0000656D617246;
  }
  if (a2) {
    uint64_t v5 = 0x7473614C776F6873;
  }
  else {
    uint64_t v5 = 0x6D6F724679616C70;
  }
  if (a2) {
    unint64_t v6 = 0xED0000656D617246;
  }
  else {
    unint64_t v6 = 0xED00007472617453;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_100011AA4(char a1)
{
  if (a1) {
    return 0x7473614C776F6873;
  }
  else {
    return 0x6D6F724679616C70;
  }
}

void sub_100011AF4()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for VideoPlayerView();
  [super layoutSubviews];
  id v1 = [v0 layer];
  id v2 = [v1 sublayers];

  if (v2)
  {
    sub_100012214();
    unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v3 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = (unint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
    {
LABEL_3:
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v4) {
        goto LABEL_4;
      }
LABEL_12:
      swift_bridgeObjectRelease();
      return;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_12;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v6 = *(id *)(v3 + 8 * v5 + 32);
      }
      char v7 = v6;
      ++v5;
      [v0 frame];
      [v7 setFrame:0.0, 0.0];
    }
    while (v4 != v5);
    goto LABEL_12;
  }
  __break(1u);
}

id sub_100011D40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlayerView();
  return [super dealloc];
}

uint64_t type metadata accessor for VideoPlayerView()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for VideoPlayerView.PlaybackBehavior(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VideoPlayerView.PlaybackBehavior(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for VideoPlayerView.PlaybackBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x100011F04);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100011F2C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100011F38(unsigned char *result, char a2)
{
  *id result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for VideoPlayerView.PlaybackBehavior()
{
  return &type metadata for VideoPlayerView.PlaybackBehavior;
}

uint64_t sub_100011F54(char *a1, char *a2)
{
  return sub_1000119E8(*a1, *a2);
}

Swift::Int sub_100011F60()
{
  return sub_100011F68();
}

Swift::Int sub_100011F68()
{
  return Hasher._finalize()();
}

uint64_t sub_100012004()
{
  return sub_10001200C();
}

uint64_t sub_10001200C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100012090()
{
  return sub_100012098();
}

Swift::Int sub_100012098()
{
  return Hasher._finalize()();
}

uint64_t sub_100012130@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100028E88, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_100012190@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100011AA4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000121C0()
{
  unint64_t result = qword_100030760;
  if (!qword_100030760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030760);
  }
  return result;
}

unint64_t sub_100012214()
{
  unint64_t result = qword_100030768;
  if (!qword_100030768)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100030768);
  }
  return result;
}

id sub_100012254(int a1)
{
  int v2 = v1;
  int v71 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v72 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004750((uint64_t *)&unk_100030770);
  __chkstk_darwin(v6 - 8);
  int v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v74 = (char *)&v65 - v14;
  id v15 = (objc_class *)type metadata accessor for VideoPlayerView();
  v77.receiver = v2;
  v77.super_class = v15;
  [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v17 = self;
  id v75 = v16;
  id v18 = [v17 mainBundle];
  NSString v19 = String._bridgeToObjectiveC()();
  NSString v20 = String._bridgeToObjectiveC()();
  id v21 = [v18 URLForResource:v19 withExtension:v20];

  if (v21)
  {
    uint64_t v70 = v4;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v22 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v22(v8, v13, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v22(v74, v8, v9);
      id v23 = objc_allocWithZone((Class)AVPlayerItem);
      URL._bridgeToObjectiveC()(v24);
      id v26 = v25;
      id v27 = [v23 initWithURL:v25];

      id v28 = [objc_allocWithZone((Class)AVPlayer) initWithPlayerItem:v27];
      id v29 = self;
      id v69 = v28;
      id v30 = [v29 playerLayerWithPlayer:v28];
      [v30 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
      id v31 = v75;
      id v32 = [v75 layer];

      id v67 = v30;
      [v32 addSublayer:v30];

      id v33 = [self sharedInstance];
      id v78 = 0;
      unsigned int v34 = [v33 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:1 error:&v78];

      id v68 = v27;
      if (v34)
      {
        id v35 = v78;
        uint64_t v36 = v70;
        if (v71)
        {
LABEL_5:
          id v37 = [v27 asset];
          [v37 duration];
          id v38 = v78;
          uint64_t v39 = v80;
          uint64_t v40 = v79;

          id v78 = v38;
          uint64_t v79 = v40;
          uint64_t v80 = v39;
          id v41 = v69;
          [v69 seekToTime:&v78];
          id v42 = &selRef_pause;
          long long v43 = v72;
LABEL_19:
          [v41 *v42];
          if (qword_10002FF08 != -1) {
            swift_once();
          }
          uint64_t v56 = sub_100007604(v3, (uint64_t)qword_100031740);
          (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v43, v56, v3);
          id v57 = Logger.logObject.getter();
          os_log_type_t v58 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v57, v58))
          {
            uint64_t v59 = swift_slowAlloc();
            id v78 = (id)swift_slowAlloc();
            *(_DWORD *)uint64_t v59 = 136315650;
            uint64_t v60 = _typeName(_:qualified:)();
            uint64_t v76 = sub_10001CA98(v60, v61, (uint64_t *)&v78);
            uint64_t ObjectType = v3;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v59 + 12) = 2080;
            uint64_t v76 = sub_10001CA98(0x766F6D2E3130334ELL, 0xE800000000000000, (uint64_t *)&v78);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v59 + 22) = 2080;
            if (v71) {
              uint64_t v62 = 0x7473614C776F6873;
            }
            else {
              uint64_t v62 = 0x6D6F724679616C70;
            }
            if (v71) {
              unint64_t v63 = 0xED0000656D617246;
            }
            else {
              unint64_t v63 = 0xED00007472617453;
            }
            uint64_t v76 = sub_10001CA98(v62, v63, (uint64_t *)&v78);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v57, v58, "%s successfully loaded %s; playbackBehavior: %s",
              (uint8_t *)v59,
              0x20u);
            swift_arrayDestroy();
            id v31 = v75;
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v36 + 8))(v72, ObjectType);
          }
          else
          {

            (*(void (**)(char *, uint64_t))(v36 + 8))(v43, v3);
          }
          (*(void (**)(char *, uint64_t))(v10 + 8))(v74, v9);
          return v31;
        }
      }
      else
      {
        id v49 = v78;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        if (qword_10002FF08 != -1) {
          swift_once();
        }
        sub_100007604(v3, (uint64_t)qword_100031740);
        swift_errorRetain();
        swift_errorRetain();
        id v50 = Logger.logObject.getter();
        os_log_type_t v51 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = swift_slowAlloc();
          v65 = (void *)swift_slowAlloc();
          id v66 = (void *)swift_slowAlloc();
          id v78 = v66;
          *(_DWORD *)uint64_t v52 = 136315394;
          uint64_t v53 = _typeName(_:qualified:)();
          uint64_t v76 = sub_10001CA98(v53, v54, (uint64_t *)&v78);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v52 + 12) = 2114;
          swift_errorRetain();
          uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v76 = v55;
          id v31 = v75;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          void *v65 = v55;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "%s failed to configure AVAudioSession: %{public}@", (uint8_t *)v52, 0x16u);
          sub_100004750((uint64_t *)&unk_100030CD0);
          swift_arrayDestroy();
          swift_slowDealloc();
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
        uint64_t v36 = v70;
        id v27 = v68;
        if (v71) {
          goto LABEL_5;
        }
      }
      id v42 = &selRef_play;
      long long v43 = v72;
      id v41 = v69;
      goto LABEL_19;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  id v31 = v75;

  sub_100012E08((uint64_t)v8);
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  sub_100007604(v3, (uint64_t)qword_100031740);
  long long v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = swift_slowAlloc();
    id v78 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136315394;
    uint64_t v47 = _typeName(_:qualified:)();
    uint64_t v76 = sub_10001CA98(v47, v48, (uint64_t *)&v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    uint64_t v76 = sub_10001CA98(0x766F6D2E3130334ELL, 0xE800000000000000, (uint64_t *)&v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "%s failed to load %s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return v31;
}

uint64_t sub_100012E08(uint64_t a1)
{
  uint64_t v2 = sub_100004750((uint64_t *)&unk_100030770);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012E68()
{
  uint64_t v0 = type metadata accessor for Locale();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v1 - 8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100012F9C()
{
  return 1;
}

Swift::Int sub_100012FA4()
{
  return Hasher._finalize()();
}

void sub_100012FE8()
{
}

Swift::Int sub_100013010()
{
  return Hasher._finalize()();
}

uint64_t sub_100013050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100015070();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100013078()
{
  swift_retain();
  v0._countAndFlagsBits = Application.id.getter();
  String.append(_:)(v0);
  swift_release();
  swift_bridgeObjectRelease();
  return 762080353;
}

Swift::Int sub_1000130E4()
{
  return Hasher._finalize()();
}

uint64_t sub_100013184()
{
  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int sub_10001321C()
{
  return Hasher._finalize()();
}

uint64_t sub_1000132B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013078();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000132E4()
{
  type metadata accessor for Application();
  swift_retain();
  swift_retain();
  char v0 = static Application.== infix(_:_:)();
  swift_release();
  swift_release();
  return v0 & 1;
}

char *sub_100013350(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController_model] = a1;
  uint64_t v2 = v1;
  swift_retain();
  id v3 = sub_100015080();
  type metadata accessor for AppIconImageCache();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_100007F5C((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)&v2[OBJC_IVAR____TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController_tableView] = v3;
  id v5 = objc_allocWithZone((Class)sub_100004750(&qword_100030838));
  id v6 = v3;
  swift_retain();
  *(void *)&v2[OBJC_IVAR____TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController_datasource] = UITableViewDiffableDataSource.init(tableView:cellProvider:)();

  id v7 = [objc_allocWithZone((Class)PRXScrollableContentView) initWithCardStyle:0 scrollView:v6];
  v13.receiver = v2;
  v13.super_class = (Class)type metadata accessor for AppSelectionProximityCardViewController();
  int v8 = (char *)[v13 initWithContentView:v7];
  uint64_t v9 = *(void *)&v8[OBJC_IVAR____TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController_datasource];
  uint64_t v10 = v8;
  [v6 setDataSource:v9];
  uint64_t v11 = v10;
  [v6 setDelegate:v11];

  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_1000134E0()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for AppSelectionProximityCardViewController();
  [super viewDidLoad];
  sub_1000196A0();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v4];

  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setSubtitle:v5];

  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = ObjectType;
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_1000159F4;
  v8[4] = v6;
  swift_retain();
  swift_retain();
  NSString v9 = String._bridgeToObjectiveC()();
  aBlock[4] = sub_100015A3C;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100019FDC;
  aBlock[3] = &unk_1000296E0;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [self actionWithTitle:v9 style:0 handler:v10];

  _Block_release(v10);
  swift_release();
  swift_release();
  id v12 = [v0 addAction:v11];
  swift_bridgeObjectRelease();
  swift_release();

  return sub_100013CE0();
}

id sub_10001388C(void *a1, uint64_t a2)
{
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007604(v4, (uint64_t)qword_100031740);
  NSString v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v8 = _typeName(_:qualified:)();
    sub_10001CA98(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s selected start Guest Mode action", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
  sub_10000AE30();
  swift_release();
  return [a1 dismissViewControllerAnimated:1 completion:0];
}

id sub_100013AB8(void *a1)
{
  uint64_t v2 = type metadata accessor for UIListContentConfiguration();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  NSString v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v6 = String._bridgeToObjectiveC()();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v8 = [a1 dequeueReusableCellWithIdentifier:v6 forIndexPath:isa];

  UITableViewCell.defaultContentConfiguration()();
  swift_retain();
  Application.localizedTitle.getter();
  swift_release();
  UIListContentConfiguration.text.setter();
  swift_retain();
  sub_1000151DC(a1);
  sub_10000F408(v9);
  swift_release();
  UIListContentConfiguration.image.setter();
  v14[3] = v2;
  v14[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  uint64_t v10 = sub_1000153B8(v14);
  (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v10, v5, v2);
  UITableViewCell.contentConfiguration.setter();
  swift_retain();
  LOBYTE(isa) = Application.isSelectedToShare.getter();
  swift_release();
  if (isa) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v8 setAccessoryType:v11];
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v8;
}

uint64_t sub_100013CE0()
{
  uint64_t v1 = sub_100004750(&qword_100030848);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001593C();
  sub_100015990();
  NSDiffableDataSourceSnapshot.init()();
  uint64_t v5 = GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter();
  NSDiffableDataSourceSnapshot.appendSections(_:)((Swift::OpaquePointer)&off_100028ED8);
  unint64_t v6 = ApplicationLibrary.applications.getter();
  unint64_t v7 = v6;
  if (!(v6 >> 62))
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    char v12 = 0;
    NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
    swift_bridgeObjectRelease();
    dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  if (!v8) {
    goto LABEL_11;
  }
LABEL_3:
  objc_super v13 = &_swiftEmptyArrayStorage;
  uint64_t result = specialized ContiguousArray.reserveCapacity(_:)();
  if ((v8 & 0x8000000000000000) == 0)
  {
    v11[0] = v5;
    v11[1] = v0;
    uint64_t v10 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      ++v10;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v8 != v10);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100013F50(char a1)
{
  uint64_t v2 = sub_100004750(&qword_100030848);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter();
  unint64_t v6 = ApplicationLibrary.applications.getter();
  uint64_t result = swift_release();
  unint64_t v8 = v6 >> 62;
  if (a1)
  {
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v11) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v11) {
        goto LABEL_21;
      }
    }
    if (v11 >= 1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if ((v6 & 0xC000000000000001) != 0) {
          specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          swift_retain();
        }
        Application.isSelectedToShare.setter();
        swift_release();
      }
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    dispatch thunk of UITableViewDiffableDataSource.snapshot()();
    v15._rawValue = &_swiftEmptyArrayStorage;
    uint64_t v13 = NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
    sub_100014224(v13);
    NSDiffableDataSourceSnapshot.reconfigureItems(_:)(v15);
    swift_bridgeObjectRelease();
    dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
    sub_1000143C0(!(a1 & 1));
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_21;
  }
LABEL_4:
  if (v9 >= 1)
  {
    for (uint64_t j = 0; j != v9; ++j)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      Application.isSelectedToShare.setter();
      swift_release();
    }
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_100014224(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_20;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v1 = v3;
  if (isUniquelyReferenced_nonNull_native)
  {
    uint64_t v7 = *(void *)(v3 + 24) >> 1;
    if (v7 >= (uint64_t)(v4 + v2))
    {
      unint64_t v8 = *(void *)(a1 + 16);
      if (v8) {
        goto LABEL_5;
      }
LABEL_15:
      if (!v2) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
  swift_bridgeObjectRelease();
  uint64_t *v1 = v3;
  uint64_t v7 = *(void *)(v3 + 24) >> 1;
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  if (v7 - v9 < (uint64_t)v8)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v10 = v3 + 8 * v9 + 32;
  if (a1 + 32 < v10 + 8 * v8 && v10 < a1 + 32 + 8 * v8) {
    goto LABEL_23;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v12 = *(void *)(*v1 + 16);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (v13)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  *(void *)(*v1 + 16) = v14;
LABEL_16:
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

void sub_1000143C0(char a1)
{
  id v8 = [*(id *)(v1 + OBJC_IVAR____TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController_tableView) headerViewForSection:0];
  if (v8)
  {
    type metadata accessor for AppSelectionSectionHeaderView();
    if (swift_dynamicCastClass())
    {
      uint64_t v3 = sub_100012E68();
      uint64_t v5 = v4;
      uint64_t v6 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = v6;
      *(unsigned char *)(v7 + 24) = a1 & 1;
      swift_retain();
      sub_1000053A0(v3, v5, (uint64_t)sub_100015A64, v7);

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
    }
    else
    {
    }
  }
}

uint64_t sub_100014548(uint64_t a1)
{
  swift_getObjectType();
  uint64_t v2 = type metadata accessor for IndexPath();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004750(&qword_100030848);
  uint64_t v31 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of UITableViewDiffableDataSource.snapshot()();
  id v32 = v8;
  uint64_t v33 = v6;
  uint64_t v9 = NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
  uint64_t v10 = IndexPath.section.getter();
  if (v10 < 0)
  {
LABEL_6:
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  if (v11 < v12)
  {
    uint64_t v13 = NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
    uint64_t v14 = IndexPath.row.getter();
    if ((v14 & 0x8000000000000000) == 0 && v14 < *(void *)(v13 + 16))
    {
      uint64_t v15 = *(void *)(v13 + 8 * v14 + 32);
      swift_retain_n();
      swift_bridgeObjectRelease();
      id v16 = (void (*)(uint64_t *, void))Application.isSelectedToShare.modify();
      *id v17 = !*v17;
      v16(v34, 0);
      swift_release();
      sub_100004750(&qword_100030858);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_10001F150;
      *(void *)(v18 + 32) = v15;
      v34[0] = v18;
      specialized Array._endMutation()();
      v19._rawValue = (void *)v34[0];
      swift_retain();
      id v21 = v32;
      uint64_t v20 = v33;
      NSDiffableDataSourceSnapshot.reconfigureItems(_:)(v19);
      swift_bridgeObjectRelease();
      dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
      GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter();
      LOBYTE(v19._rawValue) = ApplicationLibrary.areAllApplicationsSelectedToShare.getter();
      swift_release();
      sub_1000143C0((uint64_t)v19._rawValue & 1);
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v21, v20);
    }
    goto LABEL_6;
  }
LABEL_7:
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  sub_100007604(v23, (uint64_t)qword_100031740);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  id v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    v34[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v27 = _typeName(_:qualified:)();
    uint64_t v35 = sub_10001CA98(v27, v28, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    sub_1000158BC(&qword_100030850, (void (*)(uint64_t))&type metadata accessor for IndexPath);
    uint64_t v29 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v35 = sub_10001CA98(v29, v30, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%s] unable to find selected application at index path %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v32, v33);
}

id sub_100014A98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSelectionProximityCardViewController();
  [super dealloc];
}

uint64_t type metadata accessor for AppSelectionProximityCardViewController()
{
  return self;
}

uint64_t sub_100014B4C()
{
  return swift_retain();
}

void sub_100014B5C(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    sub_100013F50(a2 & 1);
  }
}

void *initializeBufferWithCopyOfBuffer for AppItem(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for AppItem()
{
  return swift_release();
}

void *assignWithCopy for AppItem(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for AppItem(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for AppItem(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppItem(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100014E74()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppItem()
{
  return &type metadata for AppItem;
}

uint64_t getEnumTagSinglePayload for AppsSection(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AppsSection(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100014F7CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSection()
{
  return &type metadata for AppsSection;
}

void *sub_100014FB4()
{
  return &protocol witness table for String;
}

unint64_t sub_100014FC4()
{
  unint64_t result = qword_100030820;
  if (!qword_100030820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030820);
  }
  return result;
}

unint64_t sub_10001501C()
{
  unint64_t result = qword_100030828;
  if (!qword_100030828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030828);
  }
  return result;
}

uint64_t sub_100015070()
{
  return 7105633;
}

id sub_100015080()
{
  id v0 = [objc_allocWithZone((Class)UITableView) initWithFrame:2 style:0.0];
  [v0 setAllowsMultipleSelection:1];
  uint64_t v1 = self;
  id v2 = v0;
  id v3 = [v1 blackColor];
  [v2 setBackgroundColor:v3];

  sub_10001541C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v5 = String._bridgeToObjectiveC()();
  [v2 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v5];

  type metadata accessor for AppSelectionSectionHeaderView();
  uint64_t v6 = swift_getObjCClassFromMetadata();
  NSString v7 = String._bridgeToObjectiveC()();
  [v2 registerClass:v6 forHeaderFooterViewReuseIdentifier:v7];

  return v2;
}

id sub_1000151D4(void *a1)
{
  return sub_100013AB8(a1);
}

void sub_1000151DC(void *a1)
{
  id v1 = [a1 window];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 screen];

    [v3 scale];
  }
  else
  {
    if (qword_10002FF08 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100007604(v4, (uint64_t)qword_100031740);
    NSString v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      NSString v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)NSString v7 = 136315138;
      sub_10001CA98(0xD000000000000030, 0x800000010001FFC0, &v8);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s unable to determine scale for current view", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
}

uint64_t *sub_1000153B8(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_10001541C()
{
  unint64_t result = qword_100030840;
  if (!qword_100030840)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100030840);
  }
  return result;
}

char *sub_10001545C(void *a1)
{
  swift_getObjectType();
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [a1 dequeueReusableHeaderFooterViewWithIdentifier:v4];

  if (v5)
  {
    type metadata accessor for AppSelectionSectionHeaderView();
    uint64_t v6 = swift_dynamicCastClass();
    if (v6)
    {
      NSString v7 = (char *)v6;
      String.LocalizationValue.init(stringLiteral:)();
      static Locale.current.getter();
      String.init(localized:table:bundle:locale:comment:)();
      uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_headerLabel];
      String.uppercased()();
      NSString v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v8 setText:v9];

      [v7 setNeedsLayout];
      swift_bridgeObjectRelease();
      GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter();
      LOBYTE(v8) = ApplicationLibrary.areAllApplicationsSelectedToShare.getter();
      swift_release();
      char v10 = v8 & 1;
      uint64_t v11 = sub_100012E68();
      uint64_t v13 = v12;
      uint64_t v14 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = v14;
      *(unsigned char *)(v15 + 24) = v10;
      swift_retain();
      sub_1000053A0(v11, v13, (uint64_t)sub_10001589C, v15);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      return v7;
    }
  }
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  sub_100007604(v16, (uint64_t)qword_100031740);
  id v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    Swift::OpaquePointer v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)Swift::OpaquePointer v19 = 136315138;
    uint64_t v20 = _typeName(_:qualified:)();
    sub_10001CA98(v20, v21, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%s] unable to dequeue header view", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_100015864()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001589C()
{
  sub_100014B5C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1000158BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100015904()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

unint64_t sub_10001593C()
{
  unint64_t result = qword_100030860;
  if (!qword_100030860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030860);
  }
  return result;
}

unint64_t sub_100015990()
{
  unint64_t result = qword_100030868;
  if (!qword_100030868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030868);
  }
  return result;
}

uint64_t sub_1000159E4()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000159F4(void *a1, uint64_t a2)
{
  return sub_10001388C(a1, a2);
}

uint64_t sub_1000159FC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100015A3C(uint64_t a1)
{
  sub_100019F58(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_100015A48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015A58()
{
  return swift_release();
}

void sub_100015A6C()
{
  if (qword_10002FF00 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007604(v0, (uint64_t)qword_100031728);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_10001CA98(0xD000000000000016, 0x8000000100020180, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Played audio/haptic resource: %s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_100015C10()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AudioHapticController()
{
  return self;
}

id sub_100015E88()
{
  os_log_type_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v7 = (objc_class *)type metadata accessor for LiveActivityDynamicIslandViewController();
  v35.receiver = v1;
  v35.super_class = v7;
  [super viewDidLoad];
  id result = [v1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  NSString v9 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  id result = [v1 view];
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  char v10 = result;
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView];
  [result addSubview:v11];

  id result = [v1 view];
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v12 = result;
  uint64_t v13 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_labelAccessoryView];
  [result addSubview:v13];

  id result = [v1 view];
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v14 = result;
  uint64_t v30 = ObjectType;
  uint64_t v31 = v4;
  id v32 = v6;
  uint64_t v15 = v3;
  uint64_t v16 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_tapGestureInterceptorView];
  [result addSubview:v16];

  id result = [v1 view];
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  id v17 = result;
  os_log_type_t v18 = *(void **)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_endGuestUserModeButton];
  [result addSubview:v18];

  [v18 addTarget:v1 action:"endGuestUserModeButtonTapped" forControlEvents:64];
  id v19 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v1 action:"launchAppGestureDetectedWithSender:"];
  [v11 addGestureRecognizer:v19];
  [v13 addGestureRecognizer:v19];
  id v20 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v1 action:"launchAppGestureDetectedWithSender:"];
  [v16 addGestureRecognizer:v20];
  if (qword_10002FF10 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_100007604(v3, (uint64_t)qword_100031758);
  uint64_t v22 = v31;
  uint64_t v23 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v32, v21, v15);
  id v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v27 = _typeName(_:qualified:)();
    uint64_t v30 = v15;
    uint64_t v33 = sub_10001CA98(v27, v28, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v33 = sub_10001CA98(0x4C64694477656976, 0xED0000292864616FLL, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "%s %s Added gesture recognizers", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (id)(*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v32, v30);
  }
  else
  {

    return (id)(*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v23, v15);
  }
}

void sub_100016388(void *a1)
{
  swift_getObjectType();
  if (qword_10002FF10 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100007604(v3, (uint64_t)qword_100031758);
  id v4 = v1;
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315650;
    uint64_t v8 = _typeName(_:qualified:)();
    sub_10001CA98(v8, v9, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_10001CA98(0xD00000000000001DLL, 0x8000000100020500, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v7 + 22) = 2048;

    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s %s %ld", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  char v10 = sub_100016C10();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = (uint64_t)sub_1000185F8;
  aBlock[5] = v11;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100016770;
  aBlock[3] = (uint64_t)&unk_100029730;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v4;
  swift_release();
  [a1 animateAlongsideTransition:v12 completion:0];
  _Block_release(v12);
}

void sub_10001666C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100016838();
  uint64_t v5 = self;
  uint64_t v6 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_activeConstraints;
  sub_100004794();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v5 deactivateConstraints:isa];

  *(void *)(a2 + v6) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Class v8 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v5 activateConstraints:v8];
}

uint64_t sub_100016770(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_100016838()
{
  swift_getObjectType();
  switch(*(void *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_activeLayoutMode])
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0:
    case 1:
      return;
    case 2:
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView] setHidden:1];
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_trailingAccessoryView] setHidden:1];
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_minimalAccessoryView] setHidden:0];
      goto LABEL_8;
    case 3:
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView] setHidden:0];
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_trailingAccessoryView] setHidden:0];
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_minimalAccessoryView] setHidden:1];
LABEL_8:
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_labelAccessoryView] setHidden:1];
      uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_endGuestUserModeButton];
      uint64_t v8 = 1;
      goto LABEL_10;
    case 4:
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView] setHidden:0];
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_trailingAccessoryView] setHidden:1];
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_minimalAccessoryView] setHidden:1];
      [*(id *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_labelAccessoryView] setHidden:0];
      uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_endGuestUserModeButton];
      uint64_t v8 = 0;
LABEL_10:
      [v7 setHidden:v8];
      break;
    default:
      if (qword_10002FF10 != -1) {
        swift_once();
      }
      uint64_t v1 = type metadata accessor for Logger();
      sub_100007604(v1, (uint64_t)qword_100031758);
      unint64_t v9 = v0;
      uint64_t v2 = Logger.logObject.getter();
      os_log_type_t v3 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = swift_slowAlloc();
        uint64_t v10 = swift_slowAlloc();
        *(_DWORD *)uint64_t v4 = 136315394;
        uint64_t v5 = _typeName(_:qualified:)();
        sub_10001CA98(v5, v6, &v10);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v4 + 12) = 2048;

        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s found unexpected activeLayoutMode %ld", (uint8_t *)v4, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      break;
  }
}

void *sub_100016C10()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  id v2 = &_swiftEmptyArrayStorage;
  switch(*(void *)(v0
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_activeLayoutMode))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0:
    case 1:
      goto LABEL_10;
    case 2:
      id v2 = sub_100016F88();
      break;
    case 3:
      id v2 = sub_10001727C();
      break;
    case 4:
      id v2 = sub_100017694();
      break;
    default:
      if (qword_10002FF10 != -1) {
        goto LABEL_23;
      }
      goto LABEL_4;
  }
  while (1)
  {
LABEL_10:
    if ((unint64_t)v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v1)
      {
LABEL_20:
        swift_bridgeObjectRelease();
        return &_swiftEmptyArrayStorage;
      }
    }
    else
    {
      uint64_t v1 = *(void *)(((unint64_t)v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v1) {
        goto LABEL_20;
      }
    }
    uint64_t v15 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)();
    if ((v1 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_23:
    swift_once();
LABEL_4:
    uint64_t v3 = type metadata accessor for Logger();
    sub_100007604(v3, (uint64_t)qword_100031758);
    id v4 = (id)v1;
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315394;
      uint64_t v8 = _typeName(_:qualified:)();
      sub_10001CA98(v8, v9, (uint64_t *)&v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2048;

      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s found unexpected activeLayoutMode %ld", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v2 = &_swiftEmptyArrayStorage;
  }
  uint64_t v10 = 0;
  do
  {
    if (((unint64_t)v2 & 0xC000000000000001) != 0) {
      id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v11 = *((id *)v2 + v10 + 4);
    }
    ++v10;
    LODWORD(v12) = 1144750080;
    [v11 setPriority:v12];
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  while (v1 != v10);
  id v13 = v15;
  swift_bridgeObjectRelease();
  return v13;
}

id sub_100016F88()
{
  sub_100004750(&qword_100030028);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001EDD0;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_minimalAccessoryView];
  id v3 = [v2 centerXAnchor];
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = result;
  id v6 = [result SBUISA_systemApertureMinimalViewLayoutGuide];

  id v7 = [v6 centerXAnchor];
  id v8 = [v3 constraintEqualToAnchor:v7];

  *(void *)(v1 + 32) = v8;
  id v9 = [v2 centerYAnchor];
  id result = [v0 view];
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v10 = result;
  id v11 = [result SBUISA_systemApertureMinimalViewLayoutGuide];

  id v12 = [v11 centerYAnchor];
  id v13 = [v9 constraintEqualToAnchor:v12];

  *(void *)(v1 + 40) = v13;
  id v14 = [v2 widthAnchor];
  id result = [v0 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v15 = result;
  id v16 = [result SBUISA_systemApertureMinimalViewLayoutGuide];

  id v17 = [v16 widthAnchor];
  id v18 = [v14 constraintEqualToAnchor:v17];

  *(void *)(v1 + 48) = v18;
  id v19 = [v2 heightAnchor];
  id result = [v0 view];
  if (result)
  {
    id v20 = result;
    id v21 = [result SBUISA_systemApertureMinimalViewLayoutGuide];

    id v22 = [v21 heightAnchor];
    id v23 = [v19 constraintEqualToAnchor:v22];

    *(void *)(v1 + 56) = v23;
    specialized Array._endMutation()();
    return (id)v1;
  }
LABEL_9:
  __break(1u);
  return result;
}

id sub_10001727C()
{
  sub_100004750(&qword_100030028);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001EE10;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView];
  id v3 = [v2 topAnchor];
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v5 = result;
  id v6 = [result topAnchor];

  id v7 = [v3 constraintEqualToAnchor:v6];
  *(void *)(v1 + 32) = v7;
  id v8 = [v2 leadingAnchor];
  id result = [v0 view];
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v9 = result;
  id v10 = [result leadingAnchor];

  id v11 = [v8 constraintEqualToAnchor:v10];
  *(void *)(v1 + 40) = v11;
  id v12 = [v2 trailingAnchor];
  id result = [v0 view];
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v13 = result;
  id v14 = [result SBUISA_systemApertureObstructedAreaLayoutGuide];

  id v15 = [v14 leadingAnchor];
  id v16 = [v12 constraintEqualToAnchor:v15];

  *(void *)(v1 + 48) = v16;
  id v17 = [v2 bottomAnchor];
  id result = [v0 view];
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v18 = result;
  id v19 = [result bottomAnchor];

  id v20 = [v17 constraintEqualToAnchor:v19];
  *(void *)(v1 + 56) = v20;
  id v21 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_trailingAccessoryView];
  id v22 = [v21 topAnchor];
  id result = [v0 view];
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v23 = result;
  id v24 = [result topAnchor];

  id v25 = [v22 constraintEqualToAnchor:v24];
  *(void *)(v1 + 64) = v25;
  id v26 = [v21 trailingAnchor];
  id result = [v0 view];
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v27 = result;
  id v28 = [result trailingAnchor];

  id v29 = [v26 constraintEqualToAnchor:v28];
  *(void *)(v1 + 72) = v29;
  id v30 = [v21 bottomAnchor];
  id result = [v0 view];
  if (result)
  {
    uint64_t v31 = result;
    id v32 = [result bottomAnchor];

    id v33 = [v30 constraintEqualToAnchor:v32];
    *(void *)(v1 + 80) = v33;
    specialized Array._endMutation()();
    return (id)v1;
  }
LABEL_15:
  __break(1u);
  return result;
}

id sub_100017694()
{
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }
  id v2 = result;
  id v3 = [result window];

  id result = [v0 view];
  id v4 = result;
  if (v3)
  {
    if (!result)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    id v5 = [result widthAnchor];

    id v6 = [v3 widthAnchor];
    id v7 = [v5 constraintEqualToAnchor:v6];

LABEL_7:
    sub_100004750(&qword_100030028);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10001F350;
    *(void *)(v17 + 32) = v7;
    id v18 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView];
    id v66 = v7;
    id v19 = [v18 leadingAnchor];
    id result = [v0 view];
    if (result)
    {
      id v20 = result;
      id v21 = [result SBUISA_systemApertureCustomControlsContentLayoutGuide];

      id v22 = [v21 leadingAnchor];
      id v23 = [v19 constraintEqualToAnchor:v22];

      *(void *)(v17 + 40) = v23;
      id v24 = [v18 centerYAnchor];
      id result = [v0 view];
      if (result)
      {
        id v25 = result;
        id v26 = [result centerYAnchor];

        id v27 = [v24 constraintEqualToAnchor:v26];
        *(void *)(v17 + 48) = v27;
        id v28 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_labelAccessoryView];
        id v29 = [v28 leadingAnchor];
        id v30 = [v18 trailingAnchor];
        id v31 = [v29 constraintEqualToAnchor:v30 constant:4.0];

        *(void *)(v17 + 56) = v31;
        id v32 = [v28 centerYAnchor];
        id v33 = [v18 centerYAnchor];
        id v34 = [v32 constraintEqualToAnchor:v33];

        *(void *)(v17 + 64) = v34;
        objc_super v35 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_tapGestureInterceptorView];
        id v36 = [v35 topAnchor];
        id result = [v0 view];
        if (result)
        {
          id v37 = result;
          id v38 = [result topAnchor];

          id v39 = [v36 constraintEqualToAnchor:v38];
          *(void *)(v17 + 72) = v39;
          id v40 = [v35 leadingAnchor];
          id result = [v0 view];
          if (result)
          {
            id v41 = result;
            id v42 = [result leadingAnchor];

            id v43 = [v40 constraintEqualToAnchor:v42];
            *(void *)(v17 + 80) = v43;
            id v44 = [v35 trailingAnchor];
            id result = [v0 view];
            if (result)
            {
              os_log_type_t v45 = result;
              id v46 = [result trailingAnchor];

              id v47 = [v44 constraintEqualToAnchor:v46];
              *(void *)(v17 + 88) = v47;
              id v48 = [v35 bottomAnchor];
              id result = [v0 view];
              if (result)
              {
                id v49 = result;
                id v50 = [result bottomAnchor];

                id v51 = [v48 constraintEqualToAnchor:v50];
                *(void *)(v17 + 96) = v51;
                uint64_t v52 = *(void **)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_endGuestUserModeButton];
                id v53 = [v52 topAnchor];
                id result = [v0 view];
                if (result)
                {
                  unint64_t v54 = result;
                  id v55 = [result topAnchor];

                  id v56 = [v53 constraintEqualToAnchor:v55 constant:16.0];
                  *(void *)(v17 + 104) = v56;
                  id v57 = [v52 trailingAnchor];
                  id result = [v0 view];
                  if (result)
                  {
                    os_log_type_t v58 = result;
                    id v59 = [result SBUISA_systemApertureCustomControlsContentLayoutGuide];

                    id v60 = [v59 trailingAnchor];
                    id v61 = [v57 constraintEqualToAnchor:v60];

                    *(void *)(v17 + 112) = v61;
                    id v62 = [v52 bottomAnchor];
                    id result = [v0 view];
                    if (result)
                    {
                      unint64_t v63 = result;
                      id v64 = [result bottomAnchor];

                      id v65 = [v62 constraintEqualToAnchor:v64 constant:-16.0];
                      *(void *)(v17 + 120) = v65;
                      specialized Array._endMutation()();

                      return (id)v17;
                    }
                    goto LABEL_26;
                  }
LABEL_25:
                  __break(1u);
LABEL_26:
                  __break(1u);
                  goto LABEL_27;
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
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (result)
  {
    id v3 = [result widthAnchor];

    id v8 = [self mainScreen];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v67.origin.x = v10;
    v67.origin.y = v12;
    v67.size.width = v14;
    v67.size.height = v16;
    id v7 = [v3 constraintEqualToConstant:CGRectGetWidth(v67)];
    goto LABEL_7;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100017E44()
{
  return sub_1000189BC("[%s] End Guest User Mode Button pressed.", (uint64_t (*)(uint64_t, uint64_t))sub_100006A50);
}

id sub_100017F60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivityDynamicIslandViewController();
  [super dealloc];
}

uint64_t sub_100018068()
{
  return type metadata accessor for LiveActivityDynamicIslandViewController();
}

uint64_t type metadata accessor for LiveActivityDynamicIslandViewController()
{
  uint64_t result = qword_100030AA0;
  if (!qword_100030AA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000180BC()
{
  sub_10001819C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10001819C()
{
  if (!qword_100030AB0)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100030AB0);
    }
  }
}

id sub_1000181F4(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView;
  uint64_t v5 = qword_10002FEE8;
  id v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (void *)qword_100031700;
  id v8 = self;
  id v9 = v7;
  id v10 = [v8 whiteColor];
  double v11 = (objc_class *)type metadata accessor for LiveActivityImageAccessoryView();
  id v12 = objc_allocWithZone(v11);
  id v13 = sub_100004338(v9, v10);
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v2[v4] = v13;
  uint64_t v14 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_trailingAccessoryView;
  if (qword_10002FEF0 != -1) {
    swift_once();
  }
  id v15 = (id)qword_100031708;
  id v16 = [v8 blueColor];
  id v17 = objc_allocWithZone(v11);
  id v18 = sub_100004338(v15, v16);
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v6[v14] = v18;
  uint64_t v19 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_minimalAccessoryView;
  id v20 = (id)qword_100031700;
  id v21 = [v8 whiteColor];
  id v22 = objc_allocWithZone(v11);
  id v23 = sub_100004338(v20, v21);
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v6[v19] = v23;
  uint64_t v24 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_labelAccessoryView;
  id v25 = [objc_allocWithZone((Class)type metadata accessor for LiveActivityLabelAccessoryView()) init];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v6[v24] = v25;
  uint64_t v26 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_tapGestureInterceptorView;
  id v27 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v28 = [v8 clearColor];
  [v27 setBackgroundColor:v28];

  id v29 = [v27 layer];
  [v29 setHitTestsAsOpaque:1];

  *(void *)&v6[v26] = v27;
  uint64_t v30 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_endGuestUserModeButton;
  sub_100007AF0();
  id v32 = v31;
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v6[v30] = v32;
  *(void *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_activeConstraints] = &_swiftEmptyArrayStorage;
  id v33 = (uint64_t *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_associatedAppBundleIdentifier];
  *id v33 = static AirPlayReceiverCoordinator.applicationBundleIdentifier.getter();
  v33[1] = v34;
  static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter();
  URL.init(string:)();
  swift_bridgeObjectRelease();
  *(void *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_contentRole] = 2;
  *(void *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_preferredLayoutMode] = 3;
  *(void *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_maximumLayoutMode] = 4;
  *(void *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_presentationBehaviors] = 8;
  *(void *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_activeLayoutMode] = 0;
  *(void *)&v6[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_liveActivityModel] = a1;
  swift_retain();

  v36.receiver = v6;
  v36.super_class = (Class)type metadata accessor for LiveActivityDynamicIslandViewController();
  return [super initWithNibName:0 bundle:0];
}

uint64_t sub_1000185B8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000185F8(uint64_t a1)
{
  sub_10001666C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100018600(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018610()
{
  return swift_release();
}

void sub_100018618()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_leadingAccessoryView;
  if (qword_10002FEE8 != -1) {
    swift_once();
  }
  id v3 = (void *)qword_100031700;
  uint64_t v4 = self;
  id v5 = v3;
  id v6 = [v4 whiteColor];
  id v7 = (objc_class *)type metadata accessor for LiveActivityImageAccessoryView();
  id v8 = objc_allocWithZone(v7);
  id v9 = sub_100004338(v5, v6);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v2] = v9;
  uint64_t v10 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_trailingAccessoryView;
  if (qword_10002FEF0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_100031708;
  id v12 = [v4 blueColor];
  id v13 = objc_allocWithZone(v7);
  id v14 = sub_100004338(v11, v12);
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v10] = v14;
  uint64_t v15 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_minimalAccessoryView;
  id v16 = (id)qword_100031700;
  id v17 = [v4 whiteColor];
  id v18 = objc_allocWithZone(v7);
  id v19 = sub_100004338(v16, v17);
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v15] = v19;
  uint64_t v20 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_labelAccessoryView;
  id v21 = [objc_allocWithZone((Class)type metadata accessor for LiveActivityLabelAccessoryView()) init];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v20] = v21;
  uint64_t v22 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_tapGestureInterceptorView;
  id v23 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v24 = [v4 clearColor];
  [v23 setBackgroundColor:v24];

  id v25 = [v23 layer];
  [v25 setHitTestsAsOpaque:1];

  *(void *)&v1[v22] = v23;
  uint64_t v26 = OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_endGuestUserModeButton;
  sub_100007AF0();
  id v28 = v27;
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v26] = v28;
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_activeConstraints] = &_swiftEmptyArrayStorage;
  id v29 = (uint64_t *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_associatedAppBundleIdentifier];
  *id v29 = static AirPlayReceiverCoordinator.applicationBundleIdentifier.getter();
  v29[1] = v30;
  static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter();
  URL.init(string:)();
  swift_bridgeObjectRelease();
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_contentRole] = 2;
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_preferredLayoutMode] = 3;
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_maximumLayoutMode] = 4;
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_presentationBehaviors] = 8;
  *(void *)&v1[OBJC_IVAR____TtC22GuestUserHandoverSetup39LiveActivityDynamicIslandViewController_activeLayoutMode] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_1000189BC(const char *a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  swift_getObjectType();
  if (qword_10002FF10 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007604(v4, (uint64_t)qword_100031758);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    uint64_t v8 = _typeName(_:qualified:)();
    sub_10001CA98(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, a1, v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return a2(v10, v11);
}

uint64_t sub_100018B68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004750((uint64_t *)&unk_100030770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_100018BD0()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for LiveActivityLabelAccessoryView();
  [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v3 setText:v4];

  id v5 = [self whiteColor];
  [v3 setTextColor:v5];

  return v3;
}

id sub_100018E20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivityLabelAccessoryView();
  return [super dealloc];
}

uint64_t type metadata accessor for LiveActivityLabelAccessoryView()
{
  return self;
}

void sub_100018E78()
{
  id v0 = [self sbui_systemApertureDefaultConfiguration];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [self systemImageNamed:v1 withConfiguration:v0];

  if (v2)
  {

    qword_100031700 = (uint64_t)v2;
  }
  else
  {
    __break(1u);
  }
}

void sub_100018F2C()
{
  id v0 = [self sbui_systemApertureDefaultConfiguration];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [self systemImageNamed:v1 withConfiguration:v0];

  if (v2)
  {

    qword_100031708 = (uint64_t)v2;
  }
  else
  {
    __break(1u);
  }
}

void sub_100018FE0()
{
  NSString v1 = v0;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007604(v2, (uint64_t)qword_100031740);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_10001CA98(0xD000000000000020, 0x8000000100020820, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    sub_10001CA98(0xD00000000000001DLL, 0x80000001000207A0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  [v1 setOverrideUserInterfaceStyle:2];
  [v1 setDismissalType:1];
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_10001B418;
  v8[4] = v6;
  swift_retain_n();
  swift_retain();
  NSString v9 = String._bridgeToObjectiveC()();
  aBlock[4] = (uint64_t)sub_10001B458;
  aBlock[5] = (uint64_t)v8;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100019FDC;
  aBlock[3] = (uint64_t)&unk_100029A10;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [self actionWithTitle:v9 style:0 handler:v10];

  _Block_release(v10);
  swift_release_n();
  swift_release();
  swift_release();
  [v1 setDismissButtonAction:v11];
}

void sub_100019340()
{
  NSString v1 = v0;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007604(v2, (uint64_t)qword_100031740);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_10001CA98(0xD000000000000025, 0x80000001000207F0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    sub_10001CA98(0xD00000000000001DLL, 0x80000001000207A0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  [v1 setOverrideUserInterfaceStyle:2];
  [v1 setDismissalType:1];
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_10001B3B0;
  v8[4] = v6;
  swift_retain_n();
  swift_retain();
  NSString v9 = String._bridgeToObjectiveC()();
  aBlock[4] = (uint64_t)sub_10001B3F0;
  aBlock[5] = (uint64_t)v8;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100019FDC;
  aBlock[3] = (uint64_t)&unk_100029998;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [self actionWithTitle:v9 style:0 handler:v10];

  _Block_release(v10);
  swift_release_n();
  swift_release();
  swift_release();
  [v1 setDismissButtonAction:v11];
}

void sub_1000196A0()
{
  NSString v1 = v0;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007604(v2, (uint64_t)qword_100031740);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_10001CA98(0xD000000000000027, 0x80000001000207C0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    sub_10001CA98(0xD00000000000001DLL, 0x80000001000207A0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  [v1 setOverrideUserInterfaceStyle:2];
  [v1 setDismissalType:1];
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_10001B348;
  v8[4] = v6;
  swift_retain_n();
  swift_retain();
  NSString v9 = String._bridgeToObjectiveC()();
  aBlock[4] = (uint64_t)sub_10001B388;
  aBlock[5] = (uint64_t)v8;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100019FDC;
  aBlock[3] = (uint64_t)&unk_100029920;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [self actionWithTitle:v9 style:0 handler:v10];

  _Block_release(v10);
  swift_release_n();
  swift_release();
  swift_release();
  [v1 setDismissButtonAction:v11];
}

void sub_100019A00()
{
  NSString v1 = v0;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007604(v2, (uint64_t)qword_100031740);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_10001CA98(0xD000000000000029, 0x800000010001F3B0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    sub_10001CA98(0xD00000000000001DLL, 0x80000001000207A0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  [v1 setOverrideUserInterfaceStyle:2];
  [v1 setDismissalType:1];
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_10001B308;
  v8[4] = v6;
  swift_retain_n();
  swift_retain();
  NSString v9 = String._bridgeToObjectiveC()();
  aBlock[4] = (uint64_t)sub_10001B480;
  aBlock[5] = (uint64_t)v8;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100019FDC;
  aBlock[3] = (uint64_t)&unk_1000298A8;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [self actionWithTitle:v9 style:0 handler:v10];

  _Block_release(v10);
  swift_release_n();
  swift_release();
  swift_release();
  [v1 setDismissButtonAction:v11];
}

void sub_100019D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    if (qword_10002FF08 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100007604(v9, (uint64_t)qword_100031740);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)id v12 = 136315138;
      sub_10001CA98(a4, a5, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s selected dismiss action", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    swift_retain();
    sub_10000ABB0();
    swift_release();
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
}

void sub_100019F40(uint64_t a1, uint64_t a2, void (*a3)(void))
{
}

void sub_100019F4C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
}

void sub_100019F58(uint64_t a1, uint64_t a2, void (*a3)(void))
{
}

void sub_100019F64(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = Strong;
    a3();
  }
}

void sub_100019FDC(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10001A044()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  v27.receiver = v0;
  v27.super_class = (Class)type metadata accessor for AppRestrictionProximityCardViewController();
  [super viewDidLoad];
  sub_100019A00();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v3];

  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setSubtitle:v4];

  sub_10001AA54();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = ObjectType;
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = sub_10001B268;
  v7[4] = v5;
  swift_retain();
  swift_retain();
  NSString v8 = String._bridgeToObjectiveC()();
  id v25 = sub_10001B2AC;
  uint64_t v26 = v7;
  aBlock = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  id v23 = sub_100019FDC;
  id v24 = &unk_1000297E0;
  uint64_t v9 = _Block_copy(&aBlock);
  uint64_t v10 = self;
  id v11 = [v10 actionWithTitle:v8 style:0 handler:v9];

  _Block_release(v9);
  swift_release();
  swift_release();
  id v12 = [v0 addAction:v11];
  swift_bridgeObjectRelease();
  swift_release();

  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = ObjectType;
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = (void *)swift_allocObject();
  _OWORD v15[2] = v14;
  v15[3] = sub_10001B2FC;
  v15[4] = v13;
  swift_retain();
  swift_retain();
  NSString v16 = String._bridgeToObjectiveC()();
  id v25 = (void (*)(uint64_t))sub_10001B480;
  uint64_t v26 = v15;
  aBlock = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  id v23 = sub_100019FDC;
  id v24 = &unk_100029858;
  id v17 = _Block_copy(&aBlock);
  id v18 = [v10 actionWithTitle:v16 style:1 handler:v17];

  _Block_release(v17);
  swift_release();
  swift_release();
  id v19 = [v0 addAction:v18];
  swift_bridgeObjectRelease();
  swift_release();
}

void sub_10001A5D8(uint64_t a1, uint64_t a2)
{
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100007604(v3, (uint64_t)qword_100031740);
  NSString v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = _typeName(_:qualified:)();
    sub_10001CA98(v7, v8, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s selected open apps enabled", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t ObjectType = swift_getObjectType();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 8);
  *(void *)(v10(ObjectType, a2) + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_appRestrictionState) = 1;
  swift_release();
  uint64_t v11 = v10(ObjectType, a2);
  id v12 = objc_allocWithZone((Class)type metadata accessor for AppSelectionProximityCardViewController());
  uint64_t v13 = sub_100013350(v11);
  sub_1000094F4((uint64_t)v13);
}

id sub_10001A7FC(void *a1, uint64_t a2)
{
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007604(v4, (uint64_t)qword_100031740);
  os_log_type_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v8 = _typeName(_:qualified:)();
    sub_10001CA98(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s selected all apps enabled", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 8);
  *(void *)(v11(ObjectType, a2) + OBJC_IVAR____TtC22GuestUserHandoverSetup18ProxCardSetUpModel_appRestrictionState) = 0;
  swift_release();
  v11(ObjectType, a2);
  sub_10000AE30();
  swift_release();
  return [a1 dismissViewControllerAnimated:1 completion:0];
}

void sub_10001AA54()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self imageNamed:v3];

  if (v4)
  {
    id v5 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setContentMode:1];
    id v6 = [v0 contentView];
    [v6 addSubview:v5];

    id v7 = [objc_allocWithZone((Class)PRXDisclaimerContentView) initWithCardStyle:0];
    id v8 = [v7 disclaimerLabel];
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v8 setText:v9];

    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = [v0 contentView];
    [v10 addSubview:v7];

    id v48 = self;
    sub_100004750(&qword_100030028);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_10001F3C0;
    id v12 = [v5 topAnchor];
    id v13 = [v0 contentView];
    id v14 = [v13 mainContentGuide];

    id v15 = [v14 topAnchor];
    id v16 = [v12 constraintGreaterThanOrEqualToAnchor:v15];

    *(void *)(v11 + 32) = v16;
    id v17 = [v5 leadingAnchor];
    id v18 = [v0 contentView];
    id v19 = [v18 mainContentGuide];

    id v20 = [v19 leadingAnchor];
    id v21 = [v17 constraintEqualToAnchor:v20];

    *(void *)(v11 + 40) = v21;
    id v22 = [v5 trailingAnchor];
    id v23 = [v0 contentView];
    id v24 = [v23 mainContentGuide];

    id v25 = [v24 trailingAnchor];
    id v26 = [v22 constraintEqualToAnchor:v25];

    *(void *)(v11 + 48) = v26;
    id v27 = [v5 heightAnchor];
    id v28 = [v27 constraintEqualToConstant:100.0];

    *(void *)(v11 + 56) = v28;
    id v29 = [v7 topAnchor];
    id v30 = [v5 bottomAnchor];
    id v31 = [v29 constraintEqualToAnchor:v30 constant:16.0];

    *(void *)(v11 + 64) = v31;
    id v32 = [v7 leadingAnchor];
    id v33 = [v0 contentView];
    id v34 = [v33 mainContentGuide];

    id v35 = [v34 leadingAnchor];
    id v36 = [v32 constraintEqualToAnchor:v35];

    *(void *)(v11 + 72) = v36;
    id v37 = [v7 trailingAnchor];
    id v38 = [v0 contentView];
    id v39 = [v38 mainContentGuide];

    id v40 = [v39 trailingAnchor];
    id v41 = [v37 constraintEqualToAnchor:v40];

    *(void *)(v11 + 80) = v41;
    id v42 = [v7 bottomAnchor];
    id v43 = [v0 contentView];
    id v44 = [v43 mainContentGuide];

    id v45 = [v44 bottomAnchor];
    id v46 = [v42 constraintLessThanOrEqualToAnchor:v45];

    *(void *)(v11 + 88) = v46;
    specialized Array._endMutation()();
    sub_100004794();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v48 activateConstraints:isa];
  }
}

id sub_10001B1E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppRestrictionProximityCardViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for AppRestrictionProximityCardViewController()
{
  return self;
}

uint64_t sub_10001B248()
{
  return swift_retain();
}

uint64_t sub_10001B258()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001B268(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10001B270()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001B2AC(uint64_t a1)
{
  sub_100019F64(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_10001B2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001B2E4()
{
  return swift_release();
}

uint64_t sub_10001B2EC()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001B2FC(void *a1, uint64_t a2)
{
  return sub_10001A7FC(a1, a2);
}

void sub_10001B308(uint64_t a1, uint64_t a2)
{
  sub_100019D60(a1, a2, v2, 0xD000000000000029, 0x800000010001F3B0);
}

void sub_10001B348(uint64_t a1, uint64_t a2)
{
  sub_100019D60(a1, a2, v2, 0xD000000000000027, 0x80000001000207C0);
}

void sub_10001B388(uint64_t a1)
{
  sub_100019F64(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

void sub_10001B3B0(uint64_t a1, uint64_t a2)
{
  sub_100019D60(a1, a2, v2, 0xD000000000000025, 0x80000001000207F0);
}

void sub_10001B3F0(uint64_t a1)
{
  sub_100019F64(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

void sub_10001B418(uint64_t a1, uint64_t a2)
{
  sub_100019D60(a1, a2, v2, 0xD000000000000020, 0x8000000100020820);
}

void sub_10001B458(uint64_t a1)
{
  sub_100019F64(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_10001B4B8(uint64_t a1)
{
  return sub_10001B5C0(a1, qword_100031710);
}

uint64_t sub_10001B4E0(uint64_t a1)
{
  return sub_10001B5C0(a1, qword_100031728);
}

uint64_t sub_10001B508(uint64_t a1)
{
  return sub_10001B5C0(a1, qword_100031740);
}

uint64_t *sub_10001B534(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001B598(uint64_t a1)
{
  return sub_10001B5C0(a1, qword_100031758);
}

uint64_t sub_10001B5C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10001B534(v3, a2);
  sub_100007604(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

id sub_10001B690()
{
  return sub_10001B6F8(&OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate____lazy_storage___dynamicIslandViewController, (uint64_t (*)(void))type metadata accessor for LiveActivityDynamicIslandViewController, (uint64_t (*)(uint64_t))sub_1000181F4);
}

id sub_10001B6C4()
{
  return sub_10001B6F8(&OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate____lazy_storage___platterViewController, (uint64_t (*)(void))type metadata accessor for LiveActivityPlatterViewController, (uint64_t (*)(uint64_t))sub_100008F14);
}

id sub_10001B6F8(uint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = *a1;
  id v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    id v6 = *(id *)(v3 + *a1);
  }
  else
  {
    uint64_t v8 = v3;
    id v9 = objc_allocWithZone((Class)a2(0));
    uint64_t v10 = swift_retain();
    uint64_t v11 = (void *)a3(v10);
    swift_release();
    id v12 = *(void **)(v8 + v4);
    *(void *)(v8 + v4) = v11;
    id v6 = v11;

    id v5 = 0;
  }
  id v13 = v5;
  return v6;
}

id sub_10001B82C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100004750(&qword_1000301C8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window] = 0;
  uint64_t v5 = OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_liveActivityModel;
  type metadata accessor for LiveActivityModel();
  uint64_t v6 = swift_allocObject();
  id v7 = v0;
  GuestUserHandoverService.init()();
  AirPlayReceiverCoordinator.init()();
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v6;
  sub_100009574((uint64_t)v4, (uint64_t)&unk_100030BC0, (uint64_t)v10);
  swift_release();
  *(void *)&v1[v5] = v6;
  *(void *)&v7[OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate____lazy_storage___dynamicIslandViewController] = 0;
  *(void *)&v7[OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate____lazy_storage___platterViewController] = 0;

  uint64_t v11 = (objc_class *)type metadata accessor for LiveActivitySceneDelegate();
  v13.receiver = v7;
  v13.super_class = v11;
  return [super init];
}

id sub_10001BA04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivitySceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for LiveActivitySceneDelegate()
{
  return self;
}

uint64_t sub_10001BAC8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001BB08()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100007908;
  return sub_100005994();
}

void sub_10001BBBC(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  type metadata accessor for ActivityScene();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = a1;
    if (objc_msgSend(v5, "SBUI_isHostedBySystemAperture"))
    {
      if (qword_10002FF10 != -1) {
        swift_once();
      }
      uint64_t v7 = type metadata accessor for Logger();
      sub_100007604(v7, (uint64_t)qword_100031758);
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 136315138;
        uint64_t v11 = _typeName(_:qualified:)();
        sub_10001CA98(v11, v12, &v29);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s configuring for Dynamic Island", v10, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      id v13 = v6;
      id v14 = sub_10001B690();
      [v5 setSystemApertureElementViewControllerProvider:v14];
    }
    else
    {
      if (qword_10002FF10 != -1) {
        swift_once();
      }
      uint64_t v15 = type metadata accessor for Logger();
      sub_100007604(v15, (uint64_t)qword_100031758);
      id v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v16, v17))
      {
        id v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        *(_DWORD *)id v18 = 136315138;
        uint64_t v19 = _typeName(_:qualified:)();
        sub_10001CA98(v19, v20, &v29);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s configuring for Lock Screen platter", v18, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      if (qword_10002FED8 != -1) {
        swift_once();
      }
      id v21 = (id)qword_1000316A0;
      dispatch thunk of ActivityScene.backgroundTintColor.setter();
      id v22 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
      ActivitySceneMetrics.init(size:cornerRadius:)();
      dispatch thunk of ActivityScene.resolvedMetrics.setter();
      id v23 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v5];
      uint64_t v24 = OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window;
      id v25 = *(void **)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window);
      *(void *)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup25LiveActivitySceneDelegate_window) = v23;

      id v26 = *(void **)(v2 + v24);
      if (v26)
      {
        id v27 = v26;
        id v28 = sub_10001B6C4();
        [v27 setRootViewController:v28];

        id v26 = *(void **)(v2 + v24);
      }
      id v13 = v26;
      [v13 makeKeyAndVisible];
    }
  }
}

id sub_10001C130()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProxCardSetUpSceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for ProxCardSetUpSceneDelegate()
{
  return self;
}

void sub_10001C1D4(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_100004750(&qword_100030CC8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for GuestUserAccessError();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v53 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v51 - v10;
  if (qword_10002FF08 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v55 = sub_100007604(v12, (uint64_t)qword_100031740);
  id v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v54 = ObjectType;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v51 = (uint64_t)v5;
    uint64_t v60 = v17;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v52 = a1;
    uint64_t v18 = _typeName(_:qualified:)();
    *(void *)&long long v62 = sub_10001CA98(v18, v19, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    *(void *)&long long v62 = sub_10001CA98(0xD00000000000002ELL, 0x80000001000209D0, &v60);
    a1 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    uint64_t v5 = (char *)v51;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v20 = *(void **)(v56 + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_rootViewController);
  if (!v20) {
    goto LABEL_14;
  }
  id v21 = v20;
  id v22 = [a1 activationContext];
  if (!v22
    || (id v23 = v22, v24 = [v22 userInfo], v23, !v24))
  {
    long long v62 = 0u;
    long long v63 = 0u;
LABEL_12:

    uint64_t v29 = &qword_1000304D8;
    id v30 = (char *)&v62;
LABEL_13:
    sub_10000D46C((uint64_t)v30, v29);
    goto LABEL_14;
  }
  uint64_t v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v58 = static GuestUserHandoverSetupCoordinator.Constants.activationContextErrorKey.getter();
  uint64_t v59 = v26;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v25 + 16) && (unint64_t v27 = sub_10001D0F0((uint64_t)&v60), (v28 & 1) != 0))
  {
    sub_10000D31C(*(void *)(v25 + 56) + 32 * v27, (uint64_t)&v62);
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
  }
  sub_10000D1AC((uint64_t)&v60);
  swift_bridgeObjectRelease();
  if (!*((void *)&v63 + 1)) {
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

LABEL_14:
    id v31 = a1;
    id v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      id v35 = (void *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315394;
      uint64_t v36 = _typeName(_:qualified:)();
      *(void *)&long long v62 = sub_10001CA98(v36, v37, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2112;
      id v38 = [v31 activationContext];
      id v39 = v38;
      if (v38) {
        *(void *)&long long v62 = v38;
      }
      else {
        *(void *)&long long v62 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v35 = v39;

      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s failed to handle updated activation context %@", (uint8_t *)v34, 0x16u);
      sub_100004750((uint64_t *)&unk_100030CD0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
  uint64_t v40 = v60;
  unint64_t v41 = v61;
  sub_10000D214(v60, v61);
  uint64_t v51 = sub_10001D134(&qword_100030CE0);
  sub_10001D134(&qword_100030CE8);
  sub_10001D134(&qword_100030CF0);
  uint64_t v52 = (void *)v40;
  unint64_t v56 = v41;
  TransportSerializable<>.init(transportData:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {

    sub_10000D2C4((uint64_t)v52, v56);
    uint64_t v29 = &qword_100030CC8;
    id v30 = v5;
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v5, v6);
  uint64_t v42 = *(void *)&v21[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_model];
  id v43 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  id v44 = v53;
  v43(v53, v11, v6);
  id v45 = (objc_class *)type metadata accessor for ErrorProximityCardViewController();
  id v46 = (char *)objc_allocWithZone(v45);
  *(void *)&v46[OBJC_IVAR____TtC22GuestUserHandoverSetup32ErrorProximityCardViewController_model] = v42;
  v43(&v46[OBJC_IVAR____TtC22GuestUserHandoverSetup32ErrorProximityCardViewController_error], v44, v6);
  v57.receiver = v46;
  v57.super_class = v45;
  swift_retain();
  id v47 = [super initWithContentView:0];
  id v48 = *(void (**)(char *, uint64_t))(v7 + 8);
  v48(v44, v6);
  id v49 = *(void **)&v21[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_proxNavigationController];
  if (v49)
  {
    id v50 = v49;
    [v50 pushViewController:v47 animated:1];
  }
  else
  {
  }
  sub_10000D2C4((uint64_t)v52, v56);
  v48(v11, v6);
}

uint64_t sub_10001CA98(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001CB6C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D31C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000D31C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001D314((uint64_t)v12);
  return v7;
}

uint64_t sub_10001CB6C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001CD28(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10001CD28(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001CDC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001CFA0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001CFA0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001CDC0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001CF38(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001CF38(uint64_t a1, uint64_t a2)
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
  sub_100004750(&qword_100030CF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001CFA0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004750(&qword_100030CF8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10001D0F0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10001D1F0(a1, v4);
}

uint64_t sub_10001D134(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for GuestUserAccessError();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001D178(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001D368(a1, a2, v4);
}

unint64_t sub_10001D1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001D2B8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000D1AC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10001D2B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001D314(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001D368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void sub_10001D44C(void *a1)
{
  uint64_t v2 = v1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v17 = a1;
    [v5 setDelegate:v2];
    [v5 setAllowsAlertStacking:1];
    id v6 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v5];
    uint64_t v7 = OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window;
    int64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window);
    *(void *)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_window) = v6;

    id v9 = [v5 configurationContext];
    id v10 = objc_allocWithZone((Class)type metadata accessor for ProxCardSetUpRootViewController());
    id v11 = sub_10000837C(v9);

    uint64_t v12 = OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_rootViewController;
    id v13 = *(void **)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_rootViewController);
    *(void *)(v2 + OBJC_IVAR____TtC22GuestUserHandoverSetup26ProxCardSetUpSceneDelegate_rootViewController) = v11;

    BOOL v14 = *(void **)(v2 + v7);
    if (v14)
    {
      [v14 setRootViewController:*(void *)(v2 + v12)];
      BOOL v15 = *(void **)(v2 + v7);
    }
    else
    {
      BOOL v15 = 0;
    }
    id v16 = v15;
    [v16 makeKeyAndVisible];
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
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

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t ActivitySceneMetrics.init(size:cornerRadius:)()
{
  return ActivitySceneMetrics.init(size:cornerRadius:)();
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return type metadata accessor for ActivitySceneMetrics();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return dispatch thunk of ActivityScene.resolvedMetrics.setter();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.setter()
{
  return dispatch thunk of ActivityScene.backgroundTintColor.setter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t static ViewMirroringDevice.localDevice.getter()
{
  return static ViewMirroringDevice.localDevice.getter();
}

uint64_t type metadata accessor for ViewMirroringDevice()
{
  return type metadata accessor for ViewMirroringDevice();
}

uint64_t Application.appIconImage.getter()
{
  return Application.appIconImage.getter();
}

uint64_t Application.localizedTitle.getter()
{
  return Application.localizedTitle.getter();
}

uint64_t Application.bundleIdentifier.getter()
{
  return Application.bundleIdentifier.getter();
}

uint64_t Application.isSelectedToShare.modify()
{
  return Application.isSelectedToShare.modify();
}

uint64_t Application.isSelectedToShare.getter()
{
  return Application.isSelectedToShare.getter();
}

uint64_t Application.isSelectedToShare.setter()
{
  return Application.isSelectedToShare.setter();
}

uint64_t static Application.== infix(_:_:)()
{
  return static Application.== infix(_:_:)();
}

uint64_t Application.id.getter()
{
  return Application.id.getter();
}

uint64_t type metadata accessor for Application()
{
  return type metadata accessor for Application();
}

uint64_t ApplicationLibrary.selectedApplicationBundleIds.getter()
{
  return ApplicationLibrary.selectedApplicationBundleIds.getter();
}

uint64_t ApplicationLibrary.applications.getter()
{
  return ApplicationLibrary.applications.getter();
}

uint64_t ApplicationLibrary.areAllApplicationsSelectedToShare.getter()
{
  return ApplicationLibrary.areAllApplicationsSelectedToShare.getter();
}

uint64_t type metadata accessor for GuestUserAccessError()
{
  return type metadata accessor for GuestUserAccessError();
}

uint64_t GuestUserHandoverService.init()()
{
  return GuestUserHandoverService.init()();
}

uint64_t type metadata accessor for GuestUserHandoverService()
{
  return type metadata accessor for GuestUserHandoverService();
}

uint64_t static AirPlayReceiverCoordinator.applicationBundleIdentifier.getter()
{
  return static AirPlayReceiverCoordinator.applicationBundleIdentifier.getter();
}

uint64_t static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter()
{
  return static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter();
}

uint64_t AirPlayReceiverCoordinator.init()()
{
  return AirPlayReceiverCoordinator.init()();
}

uint64_t type metadata accessor for AirPlayReceiverCoordinator()
{
  return type metadata accessor for AirPlayReceiverCoordinator();
}

uint64_t GuestUserModeConfiguration.init(viewMirroringDevice:appRestrictionState:allowedApplicationBundleIds:)()
{
  return GuestUserModeConfiguration.init(viewMirroringDevice:appRestrictionState:allowedApplicationBundleIds:)();
}

uint64_t type metadata accessor for GuestUserModeConfiguration()
{
  return type metadata accessor for GuestUserModeConfiguration();
}

uint64_t type metadata accessor for GuestUserRemoteUnlockResponse()
{
  return type metadata accessor for GuestUserRemoteUnlockResponse();
}

uint64_t static GuestUserHandoverSetupCoordinator.Constants.isRetriggerKey.getter()
{
  return static GuestUserHandoverSetupCoordinator.Constants.isRetriggerKey.getter();
}

uint64_t static GuestUserHandoverSetupCoordinator.Constants.requestConfigurationKey.getter()
{
  return static GuestUserHandoverSetupCoordinator.Constants.requestConfigurationKey.getter();
}

uint64_t static GuestUserHandoverSetupCoordinator.Constants.activationContextErrorKey.getter()
{
  return static GuestUserHandoverSetupCoordinator.Constants.activationContextErrorKey.getter();
}

uint64_t static GuestUserRemoteUnlockRequestConfiguration.emptyConfiguration.getter()
{
  return static GuestUserRemoteUnlockRequestConfiguration.emptyConfiguration.getter();
}

uint64_t GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter()
{
  return GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter();
}

uint64_t type metadata accessor for GuestUserRemoteUnlockRequestConfiguration()
{
  return type metadata accessor for GuestUserRemoteUnlockRequestConfiguration();
}

uint64_t TransportSerializable<>.init(transportData:)()
{
  return TransportSerializable<>.init(transportData:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t UIListContentConfiguration.image.setter()
{
  return UIListContentConfiguration.image.setter();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
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

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.reconfigureItems(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.sectionIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t NSDiffableDataSourceSnapshot.init()()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t UITableViewDiffableDataSource.init(tableView:cellProvider:)()
{
  return UITableViewDiffableDataSource.init(tableView:cellProvider:)();
}

uint64_t dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)()
{
  return dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t dispatch thunk of UITableViewDiffableDataSource.snapshot()()
{
  return dispatch thunk of UITableViewDiffableDataSource.snapshot()();
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

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
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

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t UITableViewCell.defaultContentConfiguration()()
{
  return UITableViewCell.defaultContentConfiguration()();
}

uint64_t UIButton.Configuration.buttonSize.setter()
{
  return UIButton.Configuration.buttonSize.setter();
}

uint64_t UIButton.Configuration.titlePadding.setter()
{
  return UIButton.Configuration.titlePadding.setter();
}

uint64_t UIButton.Configuration.contentInsets.setter()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t type metadata accessor for UIButton.Configuration.TitleAlignment()
{
  return type metadata accessor for UIButton.Configuration.TitleAlignment();
}

uint64_t UIButton.Configuration.titleAlignment.setter()
{
  return UIButton.Configuration.titleAlignment.setter();
}

uint64_t UIButton.Configuration.baseBackgroundColor.setter()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UIButton.Configuration.Size()
{
  return type metadata accessor for UIButton.Configuration.Size();
}

uint64_t UIButton.Configuration.image.setter()
{
  return UIButton.Configuration.image.setter();
}

uint64_t static UIButton.Configuration.plain()()
{
  return static UIButton.Configuration.plain()();
}

uint64_t UIButton.Configuration.title.setter()
{
  return UIButton.Configuration.title.setter();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t UIButton.configuration.setter()
{
  return UIButton.configuration.setter();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return _SBSRequestPasscodeUnlockUI();
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

void exit(int a1)
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}