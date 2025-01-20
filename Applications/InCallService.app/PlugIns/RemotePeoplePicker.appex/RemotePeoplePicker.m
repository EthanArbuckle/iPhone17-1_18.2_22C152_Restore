uint64_t variable initialization expression of PeoplePickerShellViewController.activity()
{
  return 0;
}

uint64_t variable initialization expression of PeoplePickerShellViewController.$__lazy_storage_$_peoplePickerViewController()
{
  return 0;
}

uint64_t variable initialization expression of PeoplePickerShellViewController.$__lazy_storage_$_sharePlayWelcomeViewController()
{
  return 1;
}

void type metadata accessor for MessageComposeResult()
{
  if (!qword_100010CD0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010CD0);
    }
  }
}

BOOL sub_100004B54(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_100004B68@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100004B78(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004B84()
{
  type metadata accessor for Defaults();
  uint64_t result = swift_initStaticObject();
  qword_100011230 = result;
  return result;
}

uint64_t sub_100004BB0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Defaults()
{
  return self;
}

void sub_100004BE4(uint64_t a1)
{
  id v2 = [self standardUserDefaults];
  sub_100004D74(a1, (uint64_t)v10);
  uint64_t v3 = v11;
  if (v11)
  {
    v4 = sub_100004E20(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    __chkstk_darwin(v4, v4);
    v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    uint64_t v8 = sub_100009DC8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    sub_100004E64((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
  }
  NSString v9 = sub_100009D28();
  [v2 setValue:v8 forKey:v9];

  swift_unknownObjectRelease();
}

uint64_t sub_100004D74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DDC(&qword_100010DA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004DDC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100004E20(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004E64(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004EB4(void *a1, unsigned __int8 a2)
{
  NSString v4 = sub_100009D28();
  id v5 = [a1 objectForKey:v4];

  if (v5)
  {
    sub_100009DB8();
    swift_unknownObjectRelease();
    sub_100004FA0((uint64_t)v8);
    NSString v6 = sub_100009D28();
    a2 = [a1 BOOLForKey:v6];
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_100004FA0((uint64_t)v8);
  }
  return a2 & 1;
}

uint64_t sub_100004FA0(uint64_t a1)
{
  uint64_t v2 = sub_100004DDC(&qword_100010DA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100005000()
{
  uint64_t v1 = OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton);
  }
  else
  {
    id v4 = sub_100005064(v0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100005064(uint64_t a1)
{
  id v2 = [self boldButton];
  id v3 = (objc_class *)[self mainBundle];
  v7._countAndFlagsBits = 0xE000000000000000;
  v8._countAndFlagsBits = 0x45554E49544E4F43;
  v8._object = (void *)0xE800000000000000;
  v9.value._countAndFlagsBits = 0x6C6172656E6547;
  v9.value._object = (void *)0xE700000000000000;
  v4.super.isa = v3;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  sub_100009C08(v8, v9, v4, v10, v7);

  NSString v5 = sub_100009D28();
  swift_bridgeObjectRelease();
  [v2 setTitle:v5 forState:0];

  [v2 addTarget:a1 action:"didTapContinueButton" forControlEvents:64];
  return v2;
}

id sub_10000518C()
{
  uint64_t v1 = OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView);
  }
  else
  {
    sub_10000526C();
    NSString v4 = sub_100009D28();
    swift_bridgeObjectRelease();
    id v5 = [self imageNamed:v4];

    id v6 = [objc_allocWithZone((Class)UIImageView) initWithImage:v5];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    Swift::String v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    id v2 = 0;
  }
  id v8 = v2;
  return v3;
}

unint64_t sub_10000526C()
{
  uint64_t v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName);
  if (*(void *)(v0
                 + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName
                 + 8))
  {
    unint64_t v2 = *v1;
  }
  else
  {
    unint64_t v2 = sub_1000052E4();
    *uint64_t v1 = v2;
    v1[1] = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

unint64_t sub_1000052E4()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  int HasHomeButton = TUDeviceHasHomeButton();
  unint64_t v3 = 0xD000000000000019;
  if (HasHomeButton)
  {
    unint64_t v4 = 0xD000000000000018;
  }
  else
  {
    unint64_t v3 = 0xD000000000000018;
    unint64_t v4 = 0xD000000000000017;
  }
  if (v1) {
    unint64_t v4 = 0xD000000000000017;
  }
  if (v1 == (id)1) {
    return v3;
  }
  else {
    return v4;
  }
}

id sub_1000053C0()
{
  id v1 = v0;
  id v2 = [self labelColor];
  id v3 = [self configurationWithHierarchicalColor:v2];

  id v4 = v3;
  NSString v5 = sub_100009D28();
  id v6 = [self systemImageNamed:v5 withConfiguration:v4];

  id v7 = objc_allocWithZone(v1);
  id v8 = self;
  Swift::String_optional v9 = (objc_class *)[v8 mainBundle];
  v17._countAndFlagsBits = 0xE000000000000000;
  v19._object = (void *)0x800000010000AE90;
  v19._countAndFlagsBits = 0xD000000000000017;
  v21.value._countAndFlagsBits = 0x6C6172656E6547;
  v21.value._object = (void *)0xE700000000000000;
  v10.super.isa = v9;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  sub_100009C08(v19, v21, v10, v23, v17);

  NSString v11 = sub_100009D28();
  swift_bridgeObjectRelease();
  v12 = (objc_class *)[v8 mainBundle];
  v20._countAndFlagsBits = 0xD000000000000020;
  v18._countAndFlagsBits = 0xE000000000000000;
  v20._object = (void *)0x800000010000AEB0;
  v22.value._countAndFlagsBits = 0x6C6172656E6547;
  v22.value._object = (void *)0xE700000000000000;
  v13.super.isa = v12;
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_100009C08(v20, v22, v13, v24, v18);

  NSString v14 = sub_100009D28();
  swift_bridgeObjectRelease();
  id v15 = [v7 initWithTitle:v11 detailText:v14 icon:v6];

  return v15;
}

void sub_10000571C()
{
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  [super viewWillLayoutSubviews];
  [v0 availableContentViewHeight];
  double v2 = v1;
  id v3 = sub_10000518C();
  [v3 frame];
  double v5 = v4;

  if (v5 <= v2)
  {
    uint64_t v6 = OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint;
    uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint];
    if (v7)
    {
      [*(id *)&v0[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint] constant];
      double v9 = v8;
    }
    else
    {
      double v9 = 0.0;
    }
    [v0 availableContentViewHeight];
    if (v7) {
      BOOL v11 = v9 == v10;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
      v12 = *(void **)&v0[v6];
      if (v12)
      {
        id v13 = v12;
        [v0 availableContentViewHeight];
        [v13 setConstant:];
      }
    }
  }
}

void sub_10000585C()
{
  double v1 = v0;
  id v2 = [v0 buttonTray];
  id v3 = sub_100005000();
  [v2 addButton:v3];

  id v4 = [v1 contentView];
  id v5 = sub_10000518C();
  [v4 addSubview:v5];

  id v6 = [v1 contentView];
  id v7 = [v6 heightAnchor];

  id v8 = sub_10000518C();
  [v8 frame];
  double v10 = v9;

  id v11 = [v7 constraintEqualToConstant:v10];
  v12 = self;
  sub_100004DDC(&qword_100010DF8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10000A320;
  id v14 = sub_10000518C();
  id v15 = [v14 centerXAnchor];

  id v16 = [v1 contentView];
  id v17 = [v16 centerXAnchor];

  id v18 = [v15 constraintEqualToAnchor:v17];
  *(void *)(v13 + 32) = v18;
  id v19 = sub_10000518C();
  id v20 = [v19 centerYAnchor];

  id v21 = [v1 contentView];
  id v22 = [v21 centerYAnchor];

  id v23 = [v20 constraintEqualToAnchor:v22];
  *(void *)(v13 + 40) = v23;
  *(void *)(v13 + 48) = v11;
  sub_100009D68();
  sub_10000616C();
  id v24 = v11;
  Class isa = sub_100009D58().super.isa;
  swift_bridgeObjectRelease();
  [v12 activateConstraints:isa];

  v26 = *(void **)&v1[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint] = v24;
}

uint64_t sub_100005B58()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate;
  swift_beginAccess();
  sub_1000060A0(v1, (uint64_t)v4);
  if (!v5) {
    return sub_1000061AC((uint64_t)v4, (uint64_t *)&unk_100010F00);
  }
  sub_100006108((uint64_t)v4, (uint64_t)v3);
  sub_1000061AC((uint64_t)v4, (uint64_t *)&unk_100010F00);
  sub_100004E20(v3, v3[3]);
  sub_1000088D8();
  return sub_100004E64((uint64_t)v3);
}

id sub_100005C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v11 = &v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate];
  *(_OWORD *)id v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((void *)v11 + 4) = 0;
  *(void *)&v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView] = 0;
  v12 = &v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName];
  *(void *)v12 = 0;
  *((void *)v12 + 1) = 0;
  *(void *)&v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint] = 0;
  NSString v13 = sub_100009D28();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    NSString v14 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v15 = 0;
    goto LABEL_6;
  }
  NSString v14 = sub_100009D28();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v15 = sub_100009D28();
  swift_bridgeObjectRelease();
LABEL_6:
  v18.receiver = v7;
  v18.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  id v16 = [super initWithTitle:v13 detailText:v14 symbolName:v15 contentLayout:a7];

  return v16;
}

id sub_100005E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  double v10 = &v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate];
  *(_OWORD *)double v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((void *)v10 + 4) = 0;
  *(void *)&v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton] = 0;
  *(void *)&v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView] = 0;
  id v11 = &v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint] = 0;
  NSString v12 = sub_100009D28();
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v13 = sub_100009D28();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = v6;
  v16.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  id v14 = [super initWithTitle:v12 detailText:v13 icon:a5 contentLayout:a6];

  return v14;
}

id sub_100005FC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SharePlayWelcomeViewController()
{
  return self;
}

uint64_t sub_1000060A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DDC((uint64_t *)&unk_100010F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000616C()
{
  unint64_t result = qword_100010E00;
  if (!qword_100010E00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010E00);
  }
  return result;
}

uint64_t sub_1000061AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004DDC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *PeoplePickerShellViewController.connection.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void PeoplePickerShellViewController.connection.setter(void *a1)
{
  sub_100008A3C(a1);
}

void (*PeoplePickerShellViewController.connection.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1000062FC;
}

void sub_1000062FC(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = sub_100009C28();
      uint64_t v8 = v7;

      id v9 = objc_allocWithZone((Class)LSApplicationRecord);
      id v10 = sub_1000087FC(v6, v8, 1);
      id v17 = v10;
      if (v10)
      {
        objc_super v16 = sub_100006E5C();
        swift_getObjectType();
        id v18 = [v17 localizedName];
        sub_100009D38();

        sub_100009CE8();
      }
      else
      {
        sub_100009D78();
        sub_100004DDC(&qword_100010E18);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_10000A390;
        id v12 = v5;
        uint64_t v13 = sub_100009C28();
        uint64_t v15 = v14;

        *(void *)(v11 + 56) = &type metadata for String;
        *(void *)(v11 + 64) = sub_100008C38();
        *(void *)(v11 + 32) = v13;
        *(void *)(v11 + 40) = v15;
        sub_100009774(0, &qword_100010E28);
        objc_super v16 = (void *)sub_100009DA8();
        sub_100009D18();
        swift_bridgeObjectRelease();
      }
    }
  }

  free(v3);
}

uint64_t PeoplePickerShellViewController.extensionViewController.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t PeoplePickerShellViewController.extensionViewController.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess();
  *id v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*PeoplePickerShellViewController.extensionViewController.modify())()
{
  return j__swift_endAccess;
}

void *PeoplePickerShellViewController.activity.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void PeoplePickerShellViewController.activity.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;
  uint64_t v6 = v5;
  if (a1)
  {
    if (v4)
    {
      sub_100009774(0, &qword_100010E40);
      id v7 = v6;
      id v8 = v4;
      id v9 = v7;
      char v10 = sub_100009D98();

      if (v10)
      {
        uint64_t v4 = v9;
        uint64_t v6 = v9;
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      id v11 = v5;
    }
    id v12 = sub_100006E5C();
    swift_getObjectType();
    id v8 = v6;
    sub_100009CC8();

    uint64_t v4 = v8;
    uint64_t v6 = v12;
    goto LABEL_7;
  }
LABEL_8:
}

void (*PeoplePickerShellViewController.activity.modify(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = (void **)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess();
  id v5 = *v4;
  v3[3] = *v4;
  id v6 = v5;
  return sub_1000067E8;
}

void sub_1000067E8(uint64_t a1, char a2)
{
  objc_super v2 = *(void **)a1;
  uint64_t v4 = (id *)(*(void *)a1 + 24);
  id v3 = *v4;
  if (a2)
  {
    id v5 = v3;
    PeoplePickerShellViewController.activity.setter(v3);
  }
  else
  {
    PeoplePickerShellViewController.activity.setter(*(void **)(*(void *)a1 + 24));
  }

  free(v2);
}

Swift::Void __swiftcall PeoplePickerShellViewController.updateShareSheetRecipients(_:)(Swift::OpaquePointer a1)
{
  id v1 = sub_100006E5C();
  swift_getObjectType();
  swift_bridgeObjectRetain();
  sub_100009CD8();
}

void sub_1000068C4(void (*a1)(void *), uint64_t a2)
{
  id v5 = (void **)(v2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess();
  id v6 = *v5;
  if (v6)
  {
    id v7 = v6;
    sub_100009D88();
    sub_100004DDC(&qword_100010E18);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_10000A390;
    *(void *)(v8 + 56) = sub_100009774(0, &qword_100010E40);
    *(void *)(v8 + 64) = sub_100009A48();
    *(void *)(v8 + 32) = v7;
    sub_100009774(0, &qword_100010E28);
    id v9 = v7;
    char v10 = (void *)sub_100009DA8();
    sub_100009D18();
    swift_bridgeObjectRelease();

    id v11 = v9;
    a1(v6);
  }
  else
  {
    id v12 = (void **)(v2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    swift_beginAccess();
    uint64_t v13 = *v12;
    if (v13)
    {
      uint64_t v14 = self;
      uint64_t v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v27 = sub_100009A04;
      v28 = (void *)v15;
      id v23 = _NSConcreteStackBlock;
      uint64_t v24 = 1107296256;
      v25 = sub_100006CDC;
      v26 = &unk_10000C830;
      objc_super v16 = _Block_copy(&v23);
      swift_unknownObjectRetain();
      swift_release();
      id v17 = [v14 scheduledTimerWithTimeInterval:0 repeats:v16 block:1.0];
      _Block_release(v16);
      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v19 = (void *)swift_allocObject();
      v19[2] = v18;
      v19[3] = v17;
      v19[4] = a1;
      v19[5] = a2;
      v27 = (void (*)())sub_100009BB4;
      v28 = v19;
      id v23 = _NSConcreteStackBlock;
      uint64_t v24 = 1107296256;
      v25 = sub_100006DF0;
      v26 = &unk_10000C880;
      id v20 = _Block_copy(&v23);
      id v21 = v17;
      swift_retain();
      swift_release();
      [v13 requestActivity:v20];
      _Block_release(v20);
      swift_unknownObjectRelease();
    }
    else
    {
      sub_100009D78();
      sub_100009774(0, &qword_100010E28);
      id v22 = (void *)sub_100009DA8();
      sub_100009D18();

      a1(0);
    }
  }
}

void sub_100006C74()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    id v2 = sub_100007314();
    [v2 startAnimating];
  }
}

void sub_100006CDC(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100006D44(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    [a3 invalidate];
    id v9 = sub_100007314();
    [v9 stopAnimating];

    a4(a1);
  }
}

void sub_100006DF0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100006E5C()
{
  uint64_t v1 = sub_100009C48();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0
     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController;
  id v7 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController);
  if (v7)
  {
    id v8 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for PeoplePickerStyle.sharePlay(_:), v1);
    id v9 = (id *)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
    swift_beginAccess();
    id v10 = *v9;
    id v11 = (void *)sub_100009D08();
    uint64_t v13 = v12;

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    swift_getObjectType();
    id v14 = [v11 navigationItem];
    [v14 setHidesBackButton:1];

    sub_100009B60();
    swift_unknownObjectRetain();
    sub_100009CF8();
    uint64_t v15 = *(void **)v6;
    *(void *)uint64_t v6 = v11;
    *(void *)(v6 + 8) = v13;
    id v8 = v11;

    id v7 = 0;
  }
  id v16 = v7;
  return v8;
}

id sub_100007058()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController];
  id v4 = v3;
  if (v3 == (void *)1)
  {
    type metadata accessor for SharePlayWelcomeViewController();
    id v4 = sub_1000053C0();
    void v10[3] = type metadata accessor for PeoplePickerShellViewController();
    v10[4] = &off_10000C690;
    v10[0] = v1;
    uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate;
    swift_beginAccess();
    uint64_t v6 = v1;
    sub_1000096EC((uint64_t)v10, v5);
    swift_endAccess();
    id v7 = *(void **)&v1[v2];
    *(void *)&v1[v2] = v4;
    id v8 = v4;
    sub_100009754(v7);
  }
  sub_100009764(v3);
  return v4;
}

id sub_10000712C()
{
  uint64_t v1 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController);
  }
  else
  {
    id v4 = sub_100007190();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100007190()
{
  if (qword_100010CB0 != -1) {
    swift_once();
  }
  id v0 = [self standardUserDefaults];
  char v1 = sub_100004EB4(v0, 1u);

  if ((v1 & 1) == 0 || (id v2 = sub_100007058()) == 0) {
    id v2 = sub_100006E5C();
  }
  id v3 = v2;
  id v4 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v2];
  id result = [v4 view];
  if (result)
  {
    id v6 = result;
    id v7 = [self systemGreenColor];
    [v6 setTintColor:v7];

    if ((v1 & 1) == 0)
    {
      id v8 = [v4 navigationBar];
      id v9 = [v8 standardAppearance];
      [v8 setScrollEdgeAppearance:v9];
    }
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100007314()
{
  uint64_t v1 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_10000738C()
{
  uint64_t v1 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator);
  }
  else
  {
    sub_100009C98();
    uint64_t v2 = sub_100009C88();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

Swift::Void __swiftcall PeoplePickerShellViewController.viewDidLoad()()
{
  v37.receiver = v0;
  v37.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  [super viewDidLoad];
  id v1 = sub_10000712C();
  id v2 = [v1 view];

  if (!v2)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v3 = [v0 view];
  if (!v3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v4 = v3;
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v2 setFrame:v6, v8, v10, v12];
  id v13 = sub_10000712C();
  id v14 = [v13 view];

  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  [v14 setAutoresizingMask:18];

  id v15 = sub_10000712C();
  [v0 addChildViewController:v15];

  id v16 = [v0 view];
  if (!v16)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v17 = v16;
  id v18 = sub_10000712C();
  id v19 = [v18 view];

  if (!v19)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  [v17 addSubview:v19];

  id v20 = sub_10000712C();
  [v20 didMoveToParentViewController:v0];

  id v21 = sub_100007314();
  id v22 = [v0 view];
  if (!v22)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v23 = v22;
  [v22 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  [v21 setFrame:v25, v27, v29, v31];
  id v32 = sub_10000712C();
  id v33 = [v32 view];

  if (!v33)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  [v33 setAutoresizingMask:18];

  id v34 = sub_10000712C();
  id v35 = [v34 view];

  if (v35)
  {
    id v36 = sub_100007314();
    [v35 addSubview:v36];

    return;
  }
LABEL_17:
  __break(1u);
}

id PeoplePickerShellViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100009D28();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id PeoplePickerShellViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity] = 0;
  double v5 = &v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController];
  *(void *)double v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController] = 1;
  *(void *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator] = 0;
  if (a2)
  {
    NSString v6 = sub_100009D28();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  id v7 = [super initWithNibName:v6 bundle:a3];

  return v7;
}

id PeoplePickerShellViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id PeoplePickerShellViewController.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity] = 0;
  id v3 = &v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController] = 1;
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  id v4 = [super initWithCoder:a1];

  return v4;
}

id PeoplePickerShellViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  return [super dealloc];
}

void *sub_100007AC4(uint64_t a1, uint64_t a2)
{
  return sub_100007BC4(a1, a2, &OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection);
}

void sub_100007AD0(void *a1)
{
  sub_100008A3C(a1);
}

void (*sub_100007B14(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = PeoplePickerShellViewController.connection.modify(v2);
  return sub_100007B70;
}

void sub_100007B70(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void *sub_100007BB8(uint64_t a1, uint64_t a2)
{
  return sub_100007BC4(a1, a2, &OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
}

void *sub_100007BC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void **)(*v3 + *a3);
  swift_beginAccess();
  double v5 = *v4;
  id v6 = v5;
  return v5;
}

void sub_100007C14(void *a1)
{
}

void (*sub_100007C38(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = *v1;
  v3[4] = *v1;
  double v5 = (void **)(v4 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess();
  id v6 = *v5;
  v3[3] = *v5;
  id v7 = v6;
  return sub_1000067E8;
}

uint64_t sub_100007CC4()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_100007D14(uint64_t a1)
{
  id v3 = (void *)(*v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess();
  *id v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_100007D6C())()
{
  return j_j__swift_endAccess;
}

void sub_100007DCC()
{
  id v0 = sub_100006E5C();
  swift_getObjectType();
  swift_bridgeObjectRetain();
  sub_100009CD8();
}

Swift::Void __swiftcall PeoplePickerShellViewController.peoplePickerCancelled()()
{
  id v1 = (id *)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess();
  if (*v1) {
    [*v1 dismissViewControllerWithSuccess:0];
  }
}

uint64_t PeoplePickerShellViewController.peoplePickerInvited(_:withVideo:button:senderIdentity:messagesGroup:)(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10 = sub_100004DDC(&qword_100010E70);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8, v13);
  sub_100008CB0(a5, (uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v5;
  *(void *)(v15 + 24) = a1;
  *(unsigned char *)(v15 + 32) = a2;
  *(void *)(v15 + 40) = a4;
  sub_100008D1C((uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  id v16 = a4;
  id v17 = v5;
  swift_bridgeObjectRetain();
  sub_1000068C4((void (*)(void *))sub_100008D84, v15);
  return swift_release();
}

id sub_100007FD8(uint64_t a1, uint64_t a2)
{
  sub_10000738C();
  sub_100009C78();
  swift_release();
  id v3 = (id *)(a2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess();
  id result = *v3;
  if (*v3) {
    return [result dismissViewControllerWithSuccess:1];
  }
  return result;
}

Swift::Void __swiftcall PeoplePickerShellViewController.peoplePickerRequestedMessageController(with:chatGUID:)(Swift::OpaquePointer with, Swift::String_optional chatGUID)
{
  object = chatGUID.value._object;
  uint64_t countAndFlagsBits = chatGUID.value._countAndFlagsBits;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v2;
  sub_100008D88((uint64_t)v6, (uint64_t)with._rawValue, v6, countAndFlagsBits, object);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

void sub_10000810C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, NSString a5)
{
  id v9 = [objc_allocWithZone((Class)MFMessageComposeViewController) init];
  if (a1) {
    [v9 insertGroupActivity:a1];
  }
  Class isa = sub_100009D58().super.isa;
  [v9 setRecipients:isa];

  [v9 _setCanEditRecipients:0];
  [v9 setMessageComposeDelegate:a3];
  if (a5) {
    a5 = sub_100009D28();
  }
  [v9 setChatGUID:a5];

  [v9 setModalTransitionStyle:2];
  [v9 setPreferredPresentationStyle:3];
  [a3 presentViewController:v9 animated:1 completion:0];
}

id PeoplePickerShellViewController.peoplePickerRequestedDialCall(using:video:contact:handle:senderIdentity:ttyType:)()
{
  sub_10000738C();
  sub_100009C58();
  swift_release();
  id v1 = (id *)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess();
  id result = *v1;
  if (*v1) {
    return [result dismissViewControllerWithSuccess:1];
  }
  return result;
}

uint64_t PeoplePickerShellViewController.peoplePickerSentInvitation(with:facetimeUnavailablePeople:facetimeAvailablePeople:shouldAddOtherInvitedToRemoteMembers:)(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v9 = v4;
  id v10 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000091E4((uint64_t)v9, v9, v10, a2, a3, a4);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_1000083BC(uint64_t a1, uint64_t a2)
{
  sub_10000738C();
  sub_100009C68();
  swift_release();
  id v3 = (id *)(a2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess();
  id result = *v3;
  if (*v3) {
    return [result dismissViewControllerWithSuccess:1];
  }
  return result;
}

uint64_t sub_10000847C(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10 = sub_100004DDC(&qword_100010E70);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8, v13);
  sub_100008CB0(a5, (uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v5;
  *(void *)(v15 + 24) = a1;
  *(unsigned char *)(v15 + 32) = a2;
  *(void *)(v15 + 40) = a4;
  sub_100008D1C((uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  id v16 = a4;
  id v17 = v5;
  swift_bridgeObjectRetain();
  sub_1000068C4((void (*)(void *))sub_100008D84, v15);
  return swift_release();
}

id PeoplePickerShellViewController.messageComposeViewController(_:didFinishWith:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_100009D88();
  if (a2)
  {
    sub_100004DDC(&qword_100010E18);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10000A390;
    type metadata accessor for MessageComposeResult();
    uint64_t v7 = sub_100009D48();
    uint64_t v9 = v8;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_100008C38();
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v9;
    sub_100009774(0, &qword_100010E28);
    uint64_t v10 = (void *)sub_100009DA8();
    sub_100009D18();
    swift_bridgeObjectRelease();

    uint64_t v11 = (id *)(v3 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    swift_beginAccess();
    id result = *v11;
    if (*v11) {
      return [result dismissViewControllerWithSuccess:a2 == 1];
    }
  }
  else
  {
    sub_100009774(0, &qword_100010E28);
    uint64_t v13 = (void *)sub_100009DA8();
    sub_100009D18();

    return [a1 dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

id sub_1000087FC(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_100009D28();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100009C18();

    swift_willThrow();
  }
  return v6;
}

void sub_1000088D8()
{
  id v2 = sub_10000712C();
  sub_100004DDC(&qword_100010DF8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10000A3A0;
  *(void *)(v3 + 32) = sub_100006E5C();
  sub_100009D68();
  sub_100009774(0, &qword_100010F10);
  Class isa = sub_100009D58().super.isa;
  swift_bridgeObjectRelease();
  [v2 setViewControllers:isa animated:1];

  NSString v5 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController);
  *(void *)(v0
            + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController) = 0;
  sub_100009754(v5);
  id v6 = sub_10000712C();
  id v7 = [v6 navigationBar];

  id v8 = [v7 standardAppearance];
  [v7 setScrollEdgeAppearance:v8];
}

void sub_100008A3C(void *a1)
{
  uint64_t v3 = (id *)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection);
  swift_beginAccess();
  id v4 = *v3;
  *uint64_t v3 = a1;
  id v5 = a1;

  if (*v3)
  {
    id v6 = *v3;
    uint64_t v7 = sub_100009C28();
    uint64_t v9 = v8;

    id v10 = objc_allocWithZone((Class)LSApplicationRecord);
    id v11 = sub_1000087FC(v7, v9, 1);
    id v18 = v11;
    if (v11)
    {
      id v17 = sub_100006E5C();
      swift_getObjectType();
      id v19 = [v18 localizedName];
      sub_100009D38();

      sub_100009CE8();
    }
    else
    {
      sub_100009D78();
      sub_100004DDC(&qword_100010E18);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_10000A390;
      id v13 = v6;
      uint64_t v14 = sub_100009C28();
      uint64_t v16 = v15;

      *(void *)(v12 + 56) = &type metadata for String;
      *(void *)(v12 + 64) = sub_100008C38();
      *(void *)(v12 + 32) = v14;
      *(void *)(v12 + 40) = v16;
      sub_100009774(0, &qword_100010E28);
      id v17 = (void *)sub_100009DA8();
      sub_100009D18();

      swift_bridgeObjectRelease();
    }
  }
}

unint64_t sub_100008C38()
{
  unint64_t result = qword_100010E20;
  if (!qword_100010E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010E20);
  }
  return result;
}

uint64_t type metadata accessor for PeoplePickerShellViewController()
{
  return self;
}

uint64_t sub_100008CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DDC(&qword_100010E70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DDC(&qword_100010E70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100008D88(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = (void *)swift_allocObject();
  v10[2] = a2;
  void v10[3] = a3;
  v10[4] = a4;
  void v10[5] = a5;
  id v11 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess();
  uint64_t v12 = *v11;
  if (*v11)
  {
    swift_bridgeObjectRetain();
    id v13 = v12;
    swift_bridgeObjectRetain();
    id v31 = a3;
    sub_100009D88();
    sub_100004DDC(&qword_100010E18);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_10000A390;
    *(void *)(v14 + 56) = sub_100009774(0, &qword_100010E40);
    *(void *)(v14 + 64) = sub_100009A48();
    *(void *)(v14 + 32) = v13;
    sub_100009774(0, &qword_100010E28);
    id v15 = v13;
    uint64_t v16 = (void *)sub_100009DA8();
    sub_100009D18();
    swift_bridgeObjectRelease();

    id v17 = v15;
    sub_10000810C((uint64_t)v12, a2, v31, a4, a5);
    swift_release();
  }
  else
  {
    id v18 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    swift_beginAccess();
    id v19 = *v18;
    if (v19)
    {
      id v20 = self;
      uint64_t v21 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v36 = sub_100009A04;
      objc_super v37 = (void *)v21;
      aBlock = _NSConcreteStackBlock;
      uint64_t v33 = 1107296256;
      id v34 = sub_100006CDC;
      id v35 = &unk_10000C7B8;
      id v22 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      id v23 = a3;
      swift_release();
      id v24 = [v20 scheduledTimerWithTimeInterval:0 repeats:v22 block:1.0];
      _Block_release(v22);
      uint64_t v25 = swift_allocObject();
      swift_unknownObjectWeakInit();
      double v26 = (void *)swift_allocObject();
      v26[2] = v25;
      v26[3] = v24;
      v26[4] = sub_100009AC8;
      v26[5] = v10;
      id v36 = (void (*)())sub_100009BB4;
      objc_super v37 = v26;
      aBlock = _NSConcreteStackBlock;
      uint64_t v33 = 1107296256;
      id v34 = sub_100006DF0;
      id v35 = &unk_10000C808;
      double v27 = _Block_copy(&aBlock);
      id v28 = v24;
      swift_retain();
      swift_release();
      [v19 requestActivity:v27];
      _Block_release(v27);
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v29 = a3;
      sub_100009D78();
      sub_100009774(0, &qword_100010E28);
      double v30 = (void *)sub_100009DA8();
      sub_100009D18();

      sub_10000810C(0, a2, v29, a4, a5);
      swift_release();
    }
  }
}

void sub_1000091E4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  *(void *)(v12 + 32) = a4;
  *(void *)(v12 + 40) = a5;
  *(unsigned char *)(v12 + 48) = a6;
  id v13 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if (*v13)
  {
    id v15 = a2;
    a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v16 = v14;
    sub_100009D88();
    sub_100004DDC(&qword_100010E18);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10000A390;
    *(void *)(v17 + 56) = sub_100009774(0, &qword_100010E40);
    *(void *)(v17 + 64) = sub_100009A48();
    *(void *)(v17 + 32) = v16;
    sub_100009774(0, &qword_100010E28);
    id v18 = v16;
    id v19 = (void *)sub_100009DA8();
    sub_100009D18();
    swift_bridgeObjectRelease();

    id v20 = v18;
    sub_10000738C();
    sub_100009C68();
    swift_release();
    uint64_t v21 = (id *)&v15[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController];
    swift_beginAccess();
    if (*v21) {
      [*v21 dismissViewControllerWithSuccess:1];
    }
    swift_release();
  }
  else
  {
    id v22 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    swift_beginAccess();
    id v23 = *v22;
    if (v23)
    {
      id v37 = self;
      uint64_t v24 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v42 = sub_100009A04;
      v43 = (void *)v24;
      aBlock = _NSConcreteStackBlock;
      uint64_t v39 = 1107296256;
      v40 = sub_100006CDC;
      v41 = &unk_10000C718;
      uint64_t v25 = _Block_copy(&aBlock);
      id v26 = a2;
      id v27 = a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_release();
      id v28 = [v37 scheduledTimerWithTimeInterval:0 repeats:v25 block:1.0];
      _Block_release(v25);
      uint64_t v29 = swift_allocObject();
      swift_unknownObjectWeakInit();
      double v30 = (void *)swift_allocObject();
      v30[2] = v29;
      v30[3] = v28;
      v30[4] = sub_1000099BC;
      v30[5] = v12;
      v42 = sub_100009A3C;
      v43 = v30;
      aBlock = _NSConcreteStackBlock;
      uint64_t v39 = 1107296256;
      v40 = sub_100006DF0;
      v41 = &unk_10000C768;
      id v31 = _Block_copy(&aBlock);
      id v32 = v28;
      swift_retain();
      swift_release();
      [v23 requestActivity:v31];
      _Block_release(v31);
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v33 = a2;
      id v34 = a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100009D78();
      sub_100009774(0, &qword_100010E28);
      id v35 = (void *)sub_100009DA8();
      sub_100009D18();

      sub_10000738C();
      sub_100009C68();
      swift_release();
      id v36 = (id *)&v33[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController];
      swift_beginAccess();
      if (*v36) {
        [*v36 dismissViewControllerWithSuccess:1];
      }
      swift_release();
    }
  }
}

uint64_t sub_1000096EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DDC((uint64_t *)&unk_100010F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100009754(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_100009764(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_100009774(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000097B4()
{
  uint64_t v1 = *(void *)(sub_100004DDC(&qword_100010E70) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  swift_bridgeObjectRelease();
  uint64_t v5 = sub_100009C38();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

id sub_1000098EC(uint64_t a1)
{
  sub_100004DDC(&qword_100010E70);
  uint64_t v3 = *(void *)(v1 + 16);

  return sub_100007FD8(a1, v3);
}

uint64_t sub_10000996C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 49, 7);
}

id sub_1000099BC(uint64_t a1)
{
  return sub_1000083BC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000099CC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100009A04()
{
}

uint64_t sub_100009A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009A1C()
{
  return swift_release();
}

uint64_t sub_100009A24()
{
  return sub_100009B04((void (*)(void))&_swift_release);
}

void sub_100009A3C(uint64_t a1)
{
  sub_100006D44(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

unint64_t sub_100009A48()
{
  unint64_t result = qword_100010F18;
  if (!qword_100010F18)
  {
    sub_100009774(255, &qword_100010E40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010F18);
  }
  return result;
}

uint64_t sub_100009AB0()
{
  return sub_100009B04((void (*)(void))&_swift_bridgeObjectRelease);
}

void sub_100009AC8(uint64_t a1)
{
  sub_10000810C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(NSString *)(v1 + 40));
}

uint64_t sub_100009AD4()
{
  return sub_100009B04((void (*)(void))&_swift_release);
}

uint64_t sub_100009AEC()
{
  return sub_100009B04((void (*)(void))&_swift_release);
}

uint64_t sub_100009B04(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));

  a1(*(void *)(v1 + 40));

  return _swift_deallocObject(v1, 48, 7);
}

unint64_t sub_100009B60()
{
  unint64_t result = qword_100010F20;
  if (!qword_100010F20)
  {
    type metadata accessor for PeoplePickerShellViewController();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010F20);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100009C08(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100009C18()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100009C28()
{
  return XPCHostConnection.bundleIdentifier.getter();
}

uint64_t sub_100009C38()
{
  return type metadata accessor for MessagesGroup();
}

uint64_t sub_100009C48()
{
  return type metadata accessor for PeoplePickerStyle();
}

uint64_t sub_100009C58()
{
  return dispatch thunk of PeoplePickerCallCreator.dialCall(provider:video:contact:handle:senderIdentity:ttyType:originatingUIType:)();
}

uint64_t sub_100009C68()
{
  return dispatch thunk of PeoplePickerCallCreator.createCallWithLink(_:facetimeUnavailablePeople:facetimeAvailablePeople:shouldAddOtherInvitedToRemoteMembers:activity:)();
}

uint64_t sub_100009C78()
{
  return dispatch thunk of PeoplePickerCallCreator.invitePeople(_:withVideo:senderIdentity:activity:messagesGroup:)();
}

uint64_t sub_100009C88()
{
  return PeoplePickerCallCreator.__allocating_init()();
}

uint64_t sub_100009C98()
{
  return type metadata accessor for PeoplePickerCallCreator();
}

void sub_100009CA8(Swift::OpaquePointer _, Swift::Bool shouldAddOtherInvitedToRemoteMembers)
{
}

void sub_100009CB8()
{
}

uint64_t sub_100009CC8()
{
  return dispatch thunk of PeoplePickerViewControllerProtocol.stagedActivity.setter();
}

uint64_t sub_100009CD8()
{
  return dispatch thunk of PeoplePickerViewControllerProtocol.initialRecipientDestinations.setter();
}

uint64_t sub_100009CE8()
{
  return dispatch thunk of PeoplePickerViewControllerProtocol.appName.setter();
}

uint64_t sub_100009CF8()
{
  return dispatch thunk of PeoplePickerViewControllerProtocol.delegate.setter();
}

uint64_t sub_100009D08()
{
  return static PeoplePickerViewControllerProvider.makePeoplePickerViewController(style:existingAddresses:currentConversation:stagedActivity:setPreventsApplicationTerminationWhenModal:)();
}

uint64_t sub_100009D18()
{
  return os_log(_:dso:log:type:_:)();
}

NSString sub_100009D28()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009D38()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009D48()
{
  return String.init<A>(reflecting:)();
}

NSArray sub_100009D58()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100009D68()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100009D78()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009D88()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009D98()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100009DA8()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100009DB8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100009DC8()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t TUDeviceHasHomeButton()
{
  return _TUDeviceHasHomeButton();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}