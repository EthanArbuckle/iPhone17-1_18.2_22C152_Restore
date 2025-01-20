id sub_2F54(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t, uint64_t);
  objc_class *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  objc_super v20;

  v3 = sub_9178(&qword_24D78);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &v1[OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper];
  v8 = sub_1C210();
  v9 = *(void *)(v8 - 8);
  v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v10(v7, 1, 1, v8);
  *(void *)&v1[OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps] = _swiftEmptyArrayStorage;
  v11 = (objc_class *)type metadata accessor for ApprovedDevelopersController();
  v20.receiver = v1;
  v20.super_class = v11;
  v12 = objc_msgSendSuper2(&v20, "initWithNibName:bundle:", 0, 0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v6, a1, v8);
  v10(v6, 0, 1, v8);
  v13 = (uint64_t)v12 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
  swift_beginAccess();
  v14 = v12;
  sub_91BC((uint64_t)v6, v13);
  swift_endAccess();
  v15 = [self defaultCenter];
  [v15 addObserver:v14 selector:"appWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
  v16 = v14;
  v17 = (void *)sub_1C190();
  [v15 addObserver:v16 selector:"distributorsOrDevelopersChanged:" name:v17 object:0];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v16;
}

void sub_32CC()
{
  sub_9178(&qword_24D78);
  ((void (*)(void))__chkstk_darwin)();
  v24 = (char *)v23 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C110();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v1 = sub_1C060();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (void *)((char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C390();
  ((void (*)(void))__chkstk_darwin)();
  sub_1C070();
  ((void (*)(void))__chkstk_darwin)();
  sub_1C4D0();
  v23[1] = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = (objc_class *)type metadata accessor for ApprovedDevelopersController();
  v6 = v25;
  v28.receiver = v25;
  v28.super_class = v5;
  objc_msgSendSuper2(&v28, "viewDidLoad");
  id v7 = [v6 navigationItem];
  [v7 setLargeTitleDisplayMode:2];

  id v8 = [v6 navigationItem];
  sub_1C330();
  uint64_t *v4 = type metadata accessor for AppInstallationSettingsController();
  (*(void (**)(uint64_t *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v1);
  sub_1C100();
  sub_1C080();
  sub_1C3C0();
  long long v26 = 0u;
  long long v27 = 0u;
  NSString v9 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v10 = *((void *)&v27 + 1);
  if (*((void *)&v27 + 1))
  {
    v11 = sub_9D54(&v26, *((uint64_t *)&v27 + 1));
    uint64_t v12 = *(void *)(v10 - 8);
    __chkstk_darwin(v11, v11);
    v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v12 + 16))(v14);
    uint64_t v15 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
    sub_9D98((uint64_t)&v26);
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = (uint64_t)v24;
  id v17 = [objc_allocWithZone((Class)UIBarButtonItem) initWithTitle:v9 style:0 target:v15 action:0];

  swift_unknownObjectRelease();
  [v8 setBackBarButtonItem:v17];

  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v18 = v25;
  uint64_t v19 = (uint64_t)v25 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
  swift_beginAccess();
  sub_940C(v19, v16);
  swift_release();
  uint64_t v20 = sub_1C210();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v16, 1, v20) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1C200();
    NSString v22 = sub_1C3A0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v16, v20);
    [v18 setTitle:v22];
    swift_release();
  }
}

void sub_39C0()
{
  uint64_t v1 = sub_9178(&qword_24D78);
  uint64_t v3 = __chkstk_darwin(v1 - 8, v2);
  uint64_t v24 = (uint64_t)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v5);
  id v7 = (char *)&v20 - v6;
  sub_1C4D0();
  uint64_t v8 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v22 = v8;
  uint64_t v9 = (uint64_t)&v0[OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper];
  swift_beginAccess();
  sub_940C(v9, (uint64_t)v7);
  swift_release();
  uint64_t v10 = sub_1C210();
  uint64_t v11 = *(void *)(v10 - 8);
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v23(v7, 1, v10) == 1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  sub_1C200();
  NSString v12 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v11 + 8);
  v13(v7, v10);
  uint64_t v21 = v0;
  [v0 setTitle:v12];

  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v14 = v24;
  sub_940C(v9, v24);
  swift_release();
  if (v23((char *)v14, 1, v10) == 1) {
    goto LABEL_16;
  }
  sub_1C170();
  sub_1C1E0();
  v13((char *)v14, v10);
  uint64_t v15 = sub_1C160();
  swift_bridgeObjectRelease();
  sub_1C4C0();
  sub_1C480();
  char isCurrentExecutor = swift_task_isCurrentExecutor();
  id v17 = v21;
  if ((isCurrentExecutor & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)&v17[OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps] = v15;
  swift_release();
  swift_bridgeObjectRelease();
  sub_4464();
  if (v18)
  {
    v19.super.isa = sub_1C410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v19.super.isa = 0;
  }
  [v17 setSpecifiers:v19.super.isa];
  swift_release();
}

void sub_3DAC()
{
  uint64_t v1 = sub_9178(&qword_24D78);
  uint64_t v3 = __chkstk_darwin(v1 - 8, v2);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v3, v6);
  uint64_t v9 = (char *)&v34 - v8;
  __chkstk_darwin(v7, v10);
  NSString v12 = (char *)&v34 - v11;
  sub_1C4D0();
  uint64_t v36 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v34 = v9;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = (uint64_t)&v0[OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper];
  swift_beginAccess();
  uint64_t v38 = v13;
  sub_940C(v13, (uint64_t)v12);
  swift_release();
  uint64_t v14 = sub_1C210();
  uint64_t v15 = *(void *)(v14 - 8);
  v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v37(v12, 1, v14) == 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  sub_1C170();
  sub_1C1E0();
  v35 = *(void (**)(char *, uint64_t))(v15 + 8);
  v35(v12, v14);
  uint64_t v16 = sub_1C160();
  swift_bridgeObjectRelease();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v17 = OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps;
  *(void *)&v0[OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps] = v16;
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v18 = *(void *)&v0[v17];
  NSArray v19 = v0;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v20 = *(void *)(v18 + 16);
  swift_bridgeObjectRelease();
  if (!v20)
  {
    unint64_t v39 = 0;
    unint64_t v40 = 0xE000000000000000;
    sub_1C590(18);
    swift_bridgeObjectRelease();
    unint64_t v39 = 0xD000000000000010;
    unint64_t v40 = 0x800000000001D1C0;
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v28 = (uint64_t)v34;
    sub_940C(v38, (uint64_t)v34);
    swift_release();
    if (v37((char *)v28, 1, v14) != 1)
    {
      uint64_t v29 = sub_1C1E0();
      v31 = v30;
      v35((char *)v28, v14);
      v42._countAndFlagsBits = v29;
      v42._object = v31;
      sub_1C3E0(v42);
      swift_bridgeObjectRelease();
      NSString v32 = sub_1C3A0();
      swift_bridgeObjectRelease();
      v27.super.isa = (Class)[v19 specifierForID:v32];

      if (!v27.super.isa)
      {
        swift_release();
        return;
      }
      [v19 removeSpecifier:v27.super.isa animated:1];
      goto LABEL_29;
    }
LABEL_34:
    __break(1u);
    return;
  }
  unint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_1C590(18);
  swift_bridgeObjectRelease();
  unint64_t v39 = 0xD000000000000010;
  unint64_t v40 = 0x800000000001D1C0;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_940C(v38, (uint64_t)v5);
  swift_release();
  if (v37(v5, 1, v14) == 1)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v21 = sub_1C1E0();
  v23 = v22;
  v35(v5, v14);
  v41._countAndFlagsBits = v21;
  v41._object = v23;
  sub_1C3E0(v41);
  swift_bridgeObjectRelease();
  NSString v24 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v25 = [v19 specifierForID:v24];

  if (v25)
  {
    [v19 removeSpecifier:v25 animated:1];
    sub_7D0C();
    if (v26)
    {
      v27.super.isa = sub_1C410().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v27.super.isa = 0;
    }
    [v19 addSpecifiersFromArray:v27.super.isa animated:1];
    swift_release();

    goto LABEL_30;
  }
  sub_7D0C();
  if (v33)
  {
    v27.super.isa = sub_1C410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v27.super.isa = 0;
  }
  [v19 addSpecifiersFromArray:v27.super.isa animated:1];
LABEL_29:
  swift_release();
LABEL_30:
}

void sub_4464()
{
  uint64_t v0 = sub_9178(&qword_24D78);
  uint64_t v2 = __chkstk_darwin(v0 - 8, v1);
  uint64_t v4 = (char *)v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2, v5);
  uint64_t v7 = (char *)v52 - v6;
  uint64_t v8 = sub_1C180();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  NSString v12 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C070();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v53 = v13;
  uint64_t v54 = v14;
  uint64_t v16 = __chkstk_darwin(v13, v15);
  uint64_t v18 = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  uint64_t v56 = (uint64_t)v52 - v20;
  sub_1C4D0();
  v52[1] = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v59 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v21 = self;
  NSString v22 = sub_1C3A0();
  id v23 = [v21 groupSpecifierWithID:v22];

  if (v23)
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, enum case for FeatureFlag.webDistribution(_:), v8);
    char v24 = sub_1C1D0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    sub_1C4C0();
    sub_1C480();
    char isCurrentExecutor = swift_task_isCurrentExecutor();
    if (v24)
    {
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v26 = v55;
      uint64_t v27 = v55 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
      swift_beginAccess();
      sub_940C(v27, (uint64_t)v7);
      swift_release();
      uint64_t v28 = sub_1C210();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v7, 1, v28) == 1) {
        goto LABEL_27;
      }
      uint64_t v30 = sub_1C200();
      NSString v32 = v31;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v28);
      uint64_t v33 = v56;
      sub_A180(v30, v32, v56);
      uint64_t v34 = v54;
    }
    else
    {
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v35 = v55 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
      swift_beginAccess();
      sub_940C(v35, (uint64_t)v4);
      swift_release();
      uint64_t v36 = sub_1C210();
      uint64_t v37 = *(void *)(v36 - 8);
      int v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v4, 1, v36);
      uint64_t v34 = v54;
      if (v38 == 1) {
        goto LABEL_28;
      }
      uint64_t v39 = sub_1C200();
      Swift::String v41 = v40;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v36);
      uint64_t v33 = v56;
      sub_A590(v39, v41, v56);
      uint64_t v26 = v55;
    }
    swift_bridgeObjectRelease();
    uint64_t v42 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v18, v33, v53);
    sub_1C3C0();
    NSString v43 = sub_1C3A0();
    swift_bridgeObjectRelease();
    [v23 setProperty:v43 forKey:PSFooterTextGroupKey];

    uint64_t v58 = sub_9484(0, &qword_24DB0);
    *(void *)&long long v57 = v23;
    v44 = v59;
    id v45 = v23;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v44 = sub_1B510(0, *((void *)v44 + 2) + 1, 1, v44);
    }
    unint64_t v47 = *((void *)v44 + 2);
    unint64_t v46 = *((void *)v44 + 3);
    if (v47 >= v46 >> 1) {
      v44 = sub_1B510((char *)(v46 > 1), v47 + 1, 1, v44);
    }
    *((void *)v44 + 2) = v47 + 1;
    sub_9474(&v57, &v44[32 * v47 + 32]);
    v59 = v44;
    sub_4B6C();
    if (v48)
    {
      sub_C06C(v48);
      sub_1C4C0();
      sub_1C480();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v49 = *(void *)(v26 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps);
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t v50 = *(void *)(v49 + 16);
      swift_bridgeObjectRelease();
      if (!v50)
      {
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v56, v42);
        swift_release();

        return;
      }
      sub_7D0C();
      if (v51)
      {
        sub_C06C(v51);

        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v56, v42);
        swift_release();
        return;
      }
      goto LABEL_26;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_4B6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C110();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_1C060();
  uint64_t v6 = *(void *)(v55 - 8);
  __chkstk_darwin(v55, v7);
  uint64_t v9 = (uint64_t *)((char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_1C390();
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v12 = sub_1C070();
  uint64_t v14 = __chkstk_darwin(v12 - 8, v13);
  uint64_t v53 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  sub_1C4D0();
  uint64_t v17 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v18 = self;
  NSString v19 = sub_1C3A0();
  id v52 = v18;
  id v20 = [v18 groupSpecifierWithID:v19];

  if (!v20)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  uint64_t v54 = sub_9484(0, &qword_24DB0);
  uint64_t v57 = v54;
  *(void *)&long long v56 = v20;
  id v44 = v20;
  uint64_t v21 = sub_1B510(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v23 = *((void *)v21 + 2);
  unint64_t v22 = *((void *)v21 + 3);
  uint64_t v45 = v17;
  if (v23 >= v22 >> 1) {
    uint64_t v21 = sub_1B510((char *)(v22 > 1), v23 + 1, 1, v21);
  }
  *((void *)v21 + 2) = v23 + 1;
  sub_9474(&v56, &v21[32 * v23 + 32]);
  sub_1C330();
  uint64_t v48 = type metadata accessor for AppInstallationSettingsController();
  *uint64_t v9 = v48;
  char v24 = *(void (**)(void))(v6 + 104);
  unsigned int v47 = enum case for LocalizedStringResource.BundleDescription.forClass(_:);
  uint64_t v50 = v6 + 104;
  unint64_t v46 = (void (*)(uint64_t *, void, uint64_t))v24;
  v24(v9);
  sub_1C100();
  uint64_t v51 = v5;
  sub_1C080();
  sub_1C3C0();
  uint64_t v57 = type metadata accessor for ApprovedDevelopersController();
  *(void *)&long long v56 = v1;
  id v49 = v1;
  NSString v25 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v26 = v57;
  if (v57)
  {
    uint64_t v27 = sub_9D54(&v56, v57);
    uint64_t v28 = *(void *)(v26 - 8);
    __chkstk_darwin(v27, v27);
    uint64_t v30 = (char *)&v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v28 + 16))(v30);
    uint64_t v31 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v26);
    sub_9D98((uint64_t)&v56);
  }
  else
  {
    uint64_t v31 = 0;
  }
  uint64_t v32 = v54;
  id v33 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v25 target:v31 set:0 get:0 detail:0 cell:13 edit:0];

  swift_unknownObjectRelease();
  if (!v33) {
    goto LABEL_17;
  }
  [v33 setButtonAction:"getSupport"];
  uint64_t v57 = v32;
  *(void *)&long long v56 = v33;
  unint64_t v35 = *((void *)v21 + 2);
  unint64_t v34 = *((void *)v21 + 3);
  id v36 = v33;
  if (v35 >= v34 >> 1) {
    uint64_t v21 = sub_1B510((char *)(v34 > 1), v35 + 1, 1, v21);
  }
  *((void *)v21 + 2) = v35 + 1;
  sub_9474(&v56, &v21[32 * v35 + 32]);
  sub_1C330();
  *uint64_t v9 = v48;
  v46(v9, v47, v55);
  sub_1C100();
  sub_1C080();
  sub_1C3C0();
  NSString v37 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v38 = [v52 deleteButtonSpecifierWithName:v37 target:v49 action:"removeDeveloper"];

  if (!v38) {
    goto LABEL_18;
  }
  Class isa = sub_1C690().super.super.isa;
  [v38 setProperty:isa forKey:PSAlignmentKey];

  uint64_t v57 = v32;
  *(void *)&long long v56 = v38;
  unint64_t v40 = *((void *)v21 + 2);
  unint64_t v41 = *((void *)v21 + 3);
  id v42 = v38;
  if (v40 >= v41 >> 1) {
    uint64_t v21 = sub_1B510((char *)(v41 > 1), v40 + 1, 1, v21);
  }
  *((void *)v21 + 2) = v40 + 1;
  sub_9474(&v56, &v21[32 * v40 + 32]);
  swift_release();
}

id sub_5260()
{
  uint64_t v1 = sub_9178(&qword_24DF0);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C0D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_9178(&qword_24D78);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v14 = v0 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
  swift_beginAccess();
  sub_940C(v14, (uint64_t)v13);
  swift_release();
  uint64_t v15 = sub_1C210();
  uint64_t v16 = *(void *)(v15 - 8);
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1C1F0();
    if (!v18)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
      return (id)swift_release();
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    sub_1C0B0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_A098((uint64_t)v4, &qword_24DF0);
      return (id)swift_release();
    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v4, v5);
    id result = [self defaultWorkspace];
    if (result)
    {
      id v20 = result;
      sub_1C0A0(v19);
      unint64_t v22 = v21;
      sub_C3A4((uint64_t)&_swiftEmptyArrayStorage);
      Class isa = sub_1C320().super.isa;
      swift_bridgeObjectRelease();
      [v20 openSensitiveURL:v22 withOptions:isa];

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      return (id)swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_5680()
{
  uint64_t v1 = sub_1C110();
  __chkstk_darwin(v1 - 8, v2);
  v128 = (char *)&v112 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_1C060();
  uint64_t v4 = *(void *)(v137 - 8);
  __chkstk_darwin(v137, v5);
  v126 = (uint64_t *)((char *)&v112 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1C390();
  __chkstk_darwin(v7 - 8, v8);
  v125 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_9178(&qword_24D78);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v14 = (char *)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v112 - v16;
  v133 = (void *)sub_1C180();
  uint64_t v18 = *(v133 - 1);
  __chkstk_darwin(v133, v19);
  v132 = (char *)&v112 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_1C070();
  uint64_t v131 = *(void *)(v136 - 8);
  uint64_t v22 = __chkstk_darwin(v136, v21);
  v115 = (char *)&v112 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v22, v24);
  v114 = (void (*)(char *, char *, uint64_t))((char *)&v112 - v26);
  uint64_t v28 = __chkstk_darwin(v25, v27);
  uint64_t v129 = (uint64_t)&v112 - v29;
  uint64_t v31 = __chkstk_darwin(v28, v30);
  v121 = (char *)&v112 - v32;
  uint64_t v34 = __chkstk_darwin(v31, v33);
  v122 = (char *)&v112 - v35;
  uint64_t v37 = __chkstk_darwin(v34, v36);
  v119 = (char *)&v112 - v38;
  uint64_t v40 = __chkstk_darwin(v37, v39);
  v130 = (char *)&v112 - v41;
  uint64_t v43 = __chkstk_darwin(v40, v42);
  uint64_t v45 = (char *)&v112 - v44;
  __chkstk_darwin(v43, v46);
  v135 = (char *)&v112 - v47;
  sub_1C4D0();
  uint64_t v127 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v123 = (void (*)(void *, void, uint64_t))v14;
  uint64_t v134 = v4;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v48 = v0;
  uint64_t v49 = *(void *)&v0[OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps];
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v50 = *(void *)(v49 + 16);
  swift_bridgeObjectRelease();
  uint64_t v51 = *(void (**)(void))(v18 + 104);
  id v52 = v132;
  unsigned int v118 = enum case for FeatureFlag.webDistribution(_:);
  uint64_t v53 = v133;
  v117 = (void (*)(char *, void, void *))v51;
  v51(v132);
  char v54 = sub_1C1D0();
  uint64_t v55 = *(void (**)(char *, void *))(v18 + 8);
  uint64_t v120 = v18 + 8;
  v116 = v55;
  v55(v52, v53);
  id v124 = v48;
  if (v50)
  {
    if (v54) {
      sub_A5B0((uint64_t)v135);
    }
    else {
      sub_A8DC((uint64_t)v135);
    }
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v56 = (uint64_t)v48 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
    swift_beginAccess();
    sub_940C(v56, (uint64_t)v17);
    swift_release();
    uint64_t v57 = sub_1C210();
    uint64_t v58 = *(void *)(v57 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 48))(v17, 1, v57);
    if (result != 1)
    {
      uint64_t v60 = sub_1C200();
      v62 = v61;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v17, v57);
      sub_AC08(v60, v62, (uint64_t)v45);
      swift_bridgeObjectRelease();
      sub_1C3C0();
      v63 = *(void (**)(char *, char *, uint64_t))(v131 + 16);
      v115 = (char *)(v131 + 16);
      v114 = v63;
      v63(v130, v135, v136);
      sub_1C3C0();
      NSString v64 = sub_1C3A0();
      swift_bridgeObjectRelease();
      NSString v65 = sub_1C3A0();
      swift_bridgeObjectRelease();
      id v66 = [self alertControllerWithTitle:v64 message:v65 preferredStyle:1];

      sub_1C330();
      uint64_t v129 = type metadata accessor for AppInstallationSettingsController();
      v67 = v126;
      void *v126 = v129;
      v68 = *(void (**)(void))(v134 + 104);
      LODWORD(v134) = enum case for LocalizedStringResource.BundleDescription.forClass(_:);
      v123 = (void (*)(void *, void, uint64_t))v68;
      v68(v67);
      sub_1C100();
      sub_1C080();
      sub_1C3C0();
      uint64_t v69 = swift_allocObject();
      id v70 = v124;
      *(void *)(v69 + 16) = v124;
      id v113 = v70;
      NSString v71 = sub_1C3A0();
      swift_bridgeObjectRelease();
      v142 = sub_94C0;
      uint64_t v143 = v69;
      aBlock = _NSConcreteStackBlock;
      uint64_t v139 = 1107296256;
      v140 = sub_6804;
      v141 = &unk_20A58;
      v72 = _Block_copy(&aBlock);
      swift_release();
      v119 = (char *)self;
      id v73 = [v119 actionWithTitle:v71 style:0 handler:v72];
      _Block_release(v72);

      id v124 = v66;
      [v66 addAction:v73];

      v75 = v132;
      v74 = v133;
      v117(v132, v118, v133);
      sub_1C1D0();
      v116(v75, v74);
      sub_1C330();
      void *v67 = v129;
      v123(v67, v134, v137);
      sub_1C100();
      v76 = v122;
      sub_1C080();
      uint64_t v77 = v136;
      v114(v130, v76, v136);
      sub_1C3C0();
      uint64_t v78 = swift_allocObject();
      v79 = v113;
      *(void *)(v78 + 16) = v113;
      v133 = v79;
      NSString v80 = sub_1C3A0();
      swift_bridgeObjectRelease();
      v142 = sub_94FC;
      uint64_t v143 = v78;
      aBlock = _NSConcreteStackBlock;
      uint64_t v139 = 1107296256;
      v140 = sub_6804;
      v141 = &unk_20AA8;
      v81 = _Block_copy(&aBlock);
      swift_release();
      id v82 = v119;
      id v83 = [v119 actionWithTitle:v80 style:0 handler:v81];
      _Block_release(v81);

      id v84 = v124;
      [v124 addAction:v83];

      sub_1C330();
      void *v67 = v129;
      v123(v67, v134, v137);
      sub_1C100();
      sub_1C080();
      sub_1C3C0();
      NSString v85 = sub_1C3A0();
      swift_bridgeObjectRelease();
      id v86 = [v82 actionWithTitle:v85 style:1 handler:0];

      [v84 addAction:v86];
      [v133 presentViewController:v84 animated:1 completion:0];

      v87 = *(void (**)(char *, uint64_t))(v131 + 8);
      v87(v76, v77);
      v87(v135, v77);
      return swift_release();
    }
    __break(1u);
  }
  else
  {
    if (v54) {
      sub_AC28(v129);
    }
    else {
      sub_AF54(v129);
    }
    uint64_t v88 = v134;
    uint64_t v89 = (uint64_t)v123;
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v90 = (uint64_t)v48 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
    swift_beginAccess();
    sub_940C(v90, v89);
    swift_release();
    uint64_t v91 = sub_1C210();
    uint64_t v92 = *(void *)(v91 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v92 + 48))(v89, 1, v91);
    if (result != 1)
    {
      uint64_t v93 = sub_1C200();
      v95 = v94;
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v89, v91);
      sub_AC08(v93, v95, (uint64_t)v114);
      swift_bridgeObjectRelease();
      sub_1C3C0();
      uint64_t v96 = v131;
      (*(void (**)(char *, uint64_t, uint64_t))(v131 + 16))(v130, v129, v136);
      sub_1C3C0();
      NSString v97 = sub_1C3A0();
      swift_bridgeObjectRelease();
      NSString v98 = sub_1C3A0();
      swift_bridgeObjectRelease();
      id v99 = [self alertControllerWithTitle:v97 message:v98 preferredStyle:1];

      sub_1C330();
      v133 = (void *)type metadata accessor for AppInstallationSettingsController();
      v100 = v126;
      void *v126 = v133;
      LODWORD(v132) = enum case for LocalizedStringResource.BundleDescription.forClass(_:);
      v101 = *(void (**)(void))(v88 + 104);
      uint64_t v134 = v88 + 104;
      v123 = (void (*)(void *, void, uint64_t))v101;
      uint64_t v102 = v137;
      v101(v100);
      sub_1C100();
      sub_1C080();
      sub_1C3C0();
      uint64_t v103 = swift_allocObject();
      id v104 = v124;
      *(void *)(v103 + 16) = v124;
      v135 = (char *)v104;
      uint64_t v105 = v96;
      NSString v106 = sub_1C3A0();
      swift_bridgeObjectRelease();
      v142 = sub_9504;
      uint64_t v143 = v103;
      aBlock = _NSConcreteStackBlock;
      uint64_t v139 = 1107296256;
      v140 = sub_6804;
      v141 = &unk_20AF8;
      v107 = _Block_copy(&aBlock);
      swift_release();
      v108 = self;
      id v109 = [v108 actionWithTitle:v106 style:0 handler:v107];
      _Block_release(v107);

      [v99 addAction:v109];
      sub_1C330();
      void *v100 = v133;
      v123(v100, v132, v102);
      sub_1C100();
      sub_1C080();
      sub_1C3C0();
      NSString v110 = sub_1C3A0();
      swift_bridgeObjectRelease();
      id v111 = [v108 actionWithTitle:v110 style:1 handler:0];

      [v99 addAction:v111];
      [v135 presentViewController:v99 animated:1 completion:0];

      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v129, v136);
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

void sub_6804(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_686C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_9178(&qword_24DC8);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v30 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_9178(&qword_24D78);
  uint64_t v8 = __chkstk_darwin(v6 - 8, v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  uint64_t v13 = (char *)&v29 - v12;
  sub_1C4D0();
  uint64_t v32 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v31 = v10;
  id v29 = a2;
  uint64_t v14 = (uint64_t)a2 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
  swift_beginAccess();
  sub_940C(v14, (uint64_t)v13);
  swift_release();
  uint64_t v15 = sub_1C210();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  uint64_t result = v17(v13, 1, v15);
  if (result == 1)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  sub_1C1E0();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v16 + 8);
  v19(v13, v15);
  sub_1C1B0();
  swift_bridgeObjectRelease();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v20 = (uint64_t)v31;
  sub_940C(v14, (uint64_t)v31);
  swift_release();
  uint64_t result = v17((char *)v20, 1, v15);
  if (result == 1) {
    goto LABEL_13;
  }
  uint64_t v21 = sub_1C1E0();
  uint64_t v23 = v22;
  v19((char *)v20, v15);
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v24 = sub_1C4F0();
  uint64_t v25 = (uint64_t)v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v30, 1, 1, v24);
  swift_bridgeObjectRetain();
  id v26 = v29;
  uint64_t v27 = sub_1C4C0();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v27;
  *(void *)(v28 + 24) = &protocol witness table for MainActor;
  *(void *)(v28 + 32) = v21;
  *(void *)(v28 + 40) = v23;
  *(unsigned char *)(v28 + 48) = 1;
  *(void *)(v28 + 56) = v26;
  sub_176C0(v25, (uint64_t)&unk_24DE0, v28);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_6CE0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v6 = sub_9178(&qword_24DC8);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v32 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_9178(&qword_24D78);
  uint64_t v11 = __chkstk_darwin(v9 - 8, v10);
  uint64_t v35 = (uint64_t)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v31 - v14;
  sub_1C4D0();
  uint64_t v36 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v31 = a2;
  uint64_t v16 = (uint64_t)a2 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
  swift_beginAccess();
  sub_940C(v16, (uint64_t)v15);
  swift_release();
  uint64_t v17 = sub_1C210();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t result = v19(v15, 1, v17);
  if (result == 1)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  sub_1C1E0();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v18 + 8);
  v21(v15, v17);
  sub_1C1B0();
  swift_bridgeObjectRelease();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v22 = v35;
  sub_940C(v16, v35);
  swift_release();
  uint64_t result = v19((char *)v22, 1, v17);
  if (result == 1) {
    goto LABEL_13;
  }
  uint64_t v23 = sub_1C1E0();
  uint64_t v25 = v24;
  v21((char *)v22, v17);
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v26 = sub_1C4F0();
  uint64_t v27 = (uint64_t)v32;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v32, 1, 1, v26);
  swift_bridgeObjectRetain();
  id v28 = v31;
  uint64_t v29 = sub_1C4C0();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v29;
  *(void *)(v30 + 24) = &protocol witness table for MainActor;
  *(void *)(v30 + 32) = v23;
  *(void *)(v30 + 40) = v25;
  *(unsigned char *)(v30 + 48) = 0;
  *(void *)(v30 + 56) = v28;
  sub_176C0(v27, v34, v30);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

void sub_715C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  a4();
  swift_release();
}

uint64_t sub_7228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(void *)(v7 + 32) = a5;
  *(void *)(v7 + 40) = a7;
  *(unsigned char *)(v7 + 160) = a6;
  *(void *)(v7 + 24) = a4;
  uint64_t v8 = sub_1C210();
  *(void *)(v7 + 48) = v8;
  *(void *)(v7 + 56) = *(void *)(v8 - 8);
  *(void *)(v7 + 64) = swift_task_alloc();
  *(void *)(v7 + 72) = sub_1C4D0();
  *(void *)(v7 + 80) = sub_1C4C0();
  uint64_t v10 = sub_1C480();
  *(void *)(v7 + 88) = v10;
  *(void *)(v7 + 96) = v9;
  return _swift_task_switch(sub_7328, v10, v9);
}

uint64_t sub_7328()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  *(void *)(v0 + 16) = sub_1C1A0();
  swift_bridgeObjectRetain();
  uint64_t v4 = (char *)sub_9630((unint64_t *)(v0 + 16), v2, v3);
  swift_bridgeObjectRelease();
  int64_t v5 = *(void *)(*(void *)(v0 + 16) + 16);
  if (v5 < (uint64_t)v4)
  {
    __break(1u);
LABEL_47:
    uint64_t v4 = sub_1B824(0, *((void *)v4 + 2) + 1, 1, v4);
    goto LABEL_14;
  }
  sub_16520((uint64_t)v4, v5);
  *(void *)(v0 + 104) = *(void *)(*(void *)(v0 + 16) + 16);
  uint64_t v1 = sub_1C1A0();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v6 = *(void *)(v0 + 56);
    sub_15B9C(0, v3, 0);
    uint64_t v8 = *(void (**)(void, uint64_t, void))(v6 + 16);
    uint64_t v7 = v6 + 16;
    v1 += (*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64);
    uint64_t v39 = *(void *)(v7 + 56);
    uint64_t v40 = v8;
    do
    {
      v40(*(void *)(v0 + 64), v1, *(void *)(v0 + 48));
      sub_1C4C0();
      sub_1C480();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v9 = *(void *)(v0 + 64);
      uint64_t v10 = *(void *)(v0 + 48);
      uint64_t v11 = sub_1C1E0();
      uint64_t v13 = v12;
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v7 - 8))(v9, v10);
      uint64_t v4 = (char *)_swiftEmptyArrayStorage;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_15B9C(0, _swiftEmptyArrayStorage[2] + 1, 1);
        uint64_t v4 = (char *)_swiftEmptyArrayStorage;
      }
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1)
      {
        sub_15B9C(v14 > 1, v15 + 1, 1);
        uint64_t v4 = (char *)_swiftEmptyArrayStorage;
      }
      _swiftEmptyArrayStorage[2] = v15 + 1;
      uint64_t v16 = (char *)&_swiftEmptyArrayStorage[2 * v15];
      *((void *)v16 + 4) = v11;
      *((void *)v16 + 5) = v13;
      v1 += v39;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_47;
  }
LABEL_14:
  unint64_t v17 = *((void *)v4 + 2);
  *(void *)(v0 + 112) = v17;
  unint64_t v18 = *((void *)v4 + 3);
  if (v17 >= v18 >> 1) {
    uint64_t v4 = sub_1B824((char *)(v18 > 1), v17 + 1, 1, v4);
  }
  *(void *)(v0 + 120) = v4;
  uint64_t v20 = *(void *)(v0 + 24);
  uint64_t v19 = *(void *)(v0 + 32);
  *((void *)v4 + 2) = v17 + 1;
  uint64_t v21 = &v4[16 * v17];
  *((void *)v21 + 4) = v20;
  *((void *)v21 + 5) = v19;
  *(unsigned char *)(v0 + 161) = 0;
  *(void *)(v0 + 128) = 0;
  uint64_t v22 = *(void *)(v0 + 120);
  if (*(void *)(v22 + 16))
  {
    unint64_t v23 = 0;
    while (1)
    {
      char v24 = *(unsigned char *)(v0 + 160);
      uint64_t v25 = v22 + 16 * v23;
      uint64_t v1 = *(void *)(v25 + 32);
      uint64_t v3 = *(void *)(v25 + 40);
      *(void *)(v0 + 136) = v3;
      swift_bridgeObjectRetain();
      if ((v24 & 1) == 0) {
        goto LABEL_31;
      }
      sub_1C4C0();
      sub_1C480();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      if (v1 == *(void *)(v0 + 24) && v3 == *(void *)(v0 + 32))
      {
        swift_release();
      }
      else
      {
        char v27 = sub_1C640();
        swift_release();
        if ((v27 & 1) == 0) {
          goto LABEL_31;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v28 = *(void *)(v0 + 128);
      if (v28 == *(void *)(v0 + 112)) {
        break;
      }
      unint64_t v23 = v28 + 1;
      *(void *)(v0 + 128) = v28 + 1;
      uint64_t v22 = *(void *)(v0 + 120);
      if (v23 >= *(void *)(v22 + 16)) {
        goto LABEL_30;
      }
    }
    uint64_t v30 = *(void *)(v0 + 104);
    swift_bridgeObjectRelease();
    swift_release();
    if (v30) {
      goto LABEL_38;
    }
    char v31 = *(unsigned char *)(v0 + 161);
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    if (v31)
    {
LABEL_38:
      id v32 = [*(id *)(v0 + 40) navigationController];
      if (!v32)
      {
LABEL_41:
        swift_task_dealloc();
        uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
        return v36();
      }
      uint64_t v33 = v32;
      uint64_t v34 = &selRef_popViewControllerAnimated_;
    }
    else
    {
      id v37 = [*(id *)(v0 + 40) navigationController];
      if (!v37) {
        goto LABEL_41;
      }
      uint64_t v33 = v37;
      uint64_t v34 = &selRef_popToRootViewControllerAnimated_;
    }
    id v35 = objc_msgSend(v33, *v34, 1);

    goto LABEL_41;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  sub_1C170();
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v29;
  *uint64_t v29 = v0;
  v29[1] = sub_78B4;
  return static AppLibrary.associatedApps(developerID:)(v1, v3);
}

uint64_t sub_78B4(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  return _swift_task_switch(sub_7A00, v4, v3);
}

uint64_t sub_7A00()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 152) + 16);
  uint64_t v2 = swift_bridgeObjectRelease();
  if (!v1) {
    goto LABEL_20;
  }
  uint64_t v4 = *(void *)(v0 + 128);
  if (v4 == *(void *)(v0 + 112))
  {
    uint64_t v5 = *(void *)(v0 + 104);
    swift_bridgeObjectRelease();
    swift_release();
    if (!v5)
    {
      char v6 = 1;
      goto LABEL_23;
    }
    goto LABEL_26;
  }
  *(unsigned char *)(v0 + 161) = 1;
  do
  {
    unint64_t v7 = v4 + 1;
    *(void *)(v0 + 128) = v7;
    uint64_t v8 = *(void *)(v0 + 120);
    if (v7 >= *(void *)(v8 + 16))
    {
      __break(1u);
      return static AppLibrary.associatedApps(developerID:)(v2, v3);
    }
    char v9 = *(unsigned char *)(v0 + 160);
    uint64_t v10 = v8 + 16 * v7;
    uint64_t v12 = *(void *)(v10 + 32);
    uint64_t v11 = *(void *)(v10 + 40);
    *(void *)(v0 + 136) = v11;
    swift_bridgeObjectRetain();
    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    if (v12 == *(void *)(v0 + 24) && v11 == *(void *)(v0 + 32))
    {
      swift_release();
    }
    else
    {
      char v14 = sub_1C640();
      swift_release();
      if ((v14 & 1) == 0)
      {
LABEL_15:
        sub_1C170();
        unint64_t v15 = (void *)swift_task_alloc();
        *(void *)(v0 + 144) = v15;
        *unint64_t v15 = v0;
        v15[1] = sub_78B4;
        uint64_t v2 = v12;
        uint64_t v3 = v11;
        return static AppLibrary.associatedApps(developerID:)(v2, v3);
      }
    }
    uint64_t v2 = swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v4 = *(void *)(v0 + 128);
  }
  while (v4 != *(void *)(v0 + 112));
  uint64_t v16 = *(void *)(v0 + 104);
  swift_bridgeObjectRelease();
  swift_release();
  if (v16) {
    goto LABEL_26;
  }
  char v6 = *(unsigned char *)(v0 + 161);
LABEL_23:
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  if (v6)
  {
LABEL_26:
    id v17 = [*(id *)(v0 + 40) navigationController];
    if (v17)
    {
      unint64_t v18 = v17;
      uint64_t v19 = &selRef_popViewControllerAnimated_;
      goto LABEL_28;
    }
  }
  else
  {
    id v23 = [*(id *)(v0 + 40) navigationController];
    if (v23)
    {
      unint64_t v18 = v23;
      uint64_t v19 = &selRef_popToRootViewControllerAnimated_;
LABEL_28:
      id v20 = objc_msgSend(v18, *v19, 1);
    }
  }
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

void sub_7D0C()
{
  uint64_t v0 = sub_9178(&qword_24D78);
  uint64_t v2 = __chkstk_darwin(v0 - 8, v1);
  uint64_t v4 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v2, v5);
  uint64_t v8 = (char *)&v74 - v7;
  __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v74 - v10;
  uint64_t v12 = sub_1C180();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1C070();
  uint64_t v77 = *(void *)(v17 - 8);
  uint64_t v78 = v17;
  uint64_t v19 = __chkstk_darwin(v17, v18);
  uint64_t v21 = (char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19, v22);
  uint64_t v79 = (uint64_t)&v74 - v23;
  uint64_t v24 = sub_1C4D0();
  uint64_t v76 = sub_1C4C0();
  uint64_t v82 = v24;
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, enum case for FeatureFlag.webDistribution(_:), v12);
  char v25 = sub_1C1D0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  sub_1C4C0();
  sub_1C480();
  char isCurrentExecutor = swift_task_isCurrentExecutor();
  if (v25)
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v27 = v81 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
    swift_beginAccess();
    sub_940C(v27, (uint64_t)v11);
    swift_release();
    uint64_t v28 = sub_1C210();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v11, 1, v28) == 1) {
      goto LABEL_52;
    }
    uint64_t v30 = sub_1C200();
    id v32 = v31;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v28);
    sub_B280(v30, v32, v79);
  }
  else
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v33 = v81 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
    swift_beginAccess();
    sub_940C(v33, (uint64_t)v8);
    swift_release();
    uint64_t v34 = sub_1C210();
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v8, 1, v34) == 1) {
      goto LABEL_53;
    }
    uint64_t v36 = sub_1C200();
    uint64_t v38 = v37;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v34);
    sub_B2A8(v36, v38, v79);
  }
  swift_bridgeObjectRelease();
  *(void *)&long long v84 = 0;
  *((void *)&v84 + 1) = 0xE000000000000000;
  sub_1C590(18);
  swift_bridgeObjectRelease();
  *(void *)&long long v84 = 0xD000000000000010;
  *((void *)&v84 + 1) = 0x800000000001D1C0;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v39 = v81 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
  swift_beginAccess();
  sub_940C(v39, (uint64_t)v4);
  swift_release();
  uint64_t v40 = sub_1C210();
  uint64_t v41 = *(void *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v4, 1, v40) == 1)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v42 = self;
  uint64_t v43 = sub_1C1E0();
  uint64_t v45 = v44;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v4, v40);
  v86._countAndFlagsBits = v43;
  v86._object = v45;
  sub_1C3E0(v86);
  swift_bridgeObjectRelease();
  NSString v46 = sub_1C3A0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v21, v79, v78);
  sub_1C3C0();
  NSString v47 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v48 = [v42 groupSpecifierWithID:v46 name:v47];

  if (!v48)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    return;
  }
  uint64_t v83 = sub_9484(0, &qword_24DB0);
  *(void *)&long long v84 = v48;
  uint64_t v85 = v83;
  id v49 = v48;
  uint64_t v50 = sub_1B510(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v52 = *((void *)v50 + 2);
  unint64_t v51 = *((void *)v50 + 3);
  int64_t v53 = v52 + 1;
  id v75 = v49;
  if (v52 >= v51 >> 1) {
LABEL_48:
  }
    uint64_t v50 = sub_1B510((char *)(v51 > 1), v53, 1, v50);
  *((void *)v50 + 2) = v53;
  sub_9474(&v84, &v50[32 * v52 + 32]);
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v54 = *(void *)(v81 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v55 = *(void *)(v54 + 16);
  uint64_t v74 = v54;
  if (v55)
  {
    uint64_t v56 = self;
    uint64_t v57 = v54 + 40;
    long long v80 = xmmword_1CF20;
    do
    {
      swift_bridgeObjectRetain();
      NSString v58 = sub_1C3A0();
      id v59 = objc_msgSend(v56, "thirdPartyApplicationForBundleID:", v58, v74, v75);

      if (v59)
      {
        sub_1C4C0();
        sub_1C480();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_9178(&qword_24DB8);
        uint64_t v60 = swift_allocObject();
        *(_OWORD *)(v60 + 16) = v80;
        *(void *)(v60 + 32) = v59;
        *(void *)&long long v84 = v60;
        sub_1C430();
        id v61 = v59;
        swift_release();
        sub_9484(0, &qword_24DC0);
        v62.super.Class isa = sub_1C410().super.isa;
        swift_bridgeObjectRelease();
      }
      else
      {
        v62.super.Class isa = 0;
      }
      id v63 = [v56 specifiersForThirdPartyApps:v62.super.isa];

      if (!v63)
      {
        __break(1u);
        goto LABEL_50;
      }
      unint64_t v52 = sub_1C420();

      if (v52 >> 62)
      {
        swift_bridgeObjectRetain();
        int64_t v53 = sub_1C600();
        swift_bridgeObjectRelease();
        if (!v53)
        {
LABEL_21:
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          goto LABEL_22;
        }
      }
      else
      {
        int64_t v53 = *(void *)((char *)&dword_10 + (v52 & 0xFFFFFFFFFFFFFF8));
        if (!v53) {
          goto LABEL_21;
        }
      }
      if ((v52 & 0xC000000000000001) != 0)
      {
        id v64 = (id)sub_1C5B0();
      }
      else
      {
        unint64_t v51 = *(void *)((char *)&dword_10 + (v52 & 0xFFFFFFFFFFFFFF8));
        if (!v51)
        {
          __break(1u);
          goto LABEL_48;
        }
        id v64 = *(id *)(v52 + 32);
      }
      NSString v65 = v64;
      swift_bridgeObjectRelease();
      [v65 setTarget:v81];
      [v65 setDetailControllerClass:0];
      NSString v66 = sub_1C3A0();
      swift_bridgeObjectRelease();
      [v65 setIdentifier:v66];

      if (v59 && (id v67 = [v59 localizedName]) != 0)
      {
        v68 = v67;
        sub_1C3B0();
      }
      else
      {
        sub_1C4C0();
        sub_1C480();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
      }
      NSString v69 = sub_1C3A0();
      swift_bridgeObjectRelease();
      NSString v70 = sub_1C3A0();
      [v65 setProperty:v69 forKey:v70];

      [v65 setControllerLoadAction:"viewApprovedAppPageWithSpecifier:"];
      uint64_t v85 = v83;
      *(void *)&long long v84 = v65;
      unint64_t v71 = *((void *)v50 + 2);
      unint64_t v72 = *((void *)v50 + 3);
      id v73 = v65;
      if (v71 >= v72 >> 1) {
        uint64_t v50 = sub_1B510((char *)(v72 > 1), v71 + 1, 1, v50);
      }
      *((void *)v50 + 2) = v71 + 1;
      sub_9474(&v84, &v50[32 * v71 + 32]);

LABEL_22:
      v57 += 16;
      --v55;
    }
    while (v55);
  }
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v79, v78);
  swift_release();
}

void sub_88C8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C2A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  uint64_t v12 = (char *)&v24 - v11;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a1)
  {
    id v25 = a1;
    id v13 = [v25 identifier];
    if (v13)
    {
      uint64_t v14 = v13;
      sub_1C3B0();

      sub_1C290();
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v12, v4);
      id v15 = objc_allocWithZone((Class)sub_9178(&qword_24DA0));
      uint64_t v16 = (void *)sub_1C2E0();
      NSString v17 = sub_1C3A0();
      id v18 = [v25 propertyForKey:v17];

      if (v18)
      {
        sub_1C570();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v26, 0, sizeof(v26));
      }
      sub_93A4((uint64_t)v26, (uint64_t)v27);
      if (v28)
      {
        if (swift_dynamicCast())
        {
          id v20 = v16;
          NSString v21 = sub_1C3A0();
          swift_bridgeObjectRelease();
          [v20 setTitle:v21];
        }
      }
      else
      {
        sub_A098((uint64_t)v27, &qword_24DA8);
      }
      id v22 = [v2 navigationController];
      if (v22)
      {
        uint64_t v23 = v22;
        [v22 pushViewController:v16 animated:1];

        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
        swift_release();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
        swift_release();
      }
    }
    else
    {
      swift_release();
      id v19 = v25;
    }
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_8D60()
{
  return sub_9DE8((uint64_t)&unk_209F0, (uint64_t)sub_925C, (uint64_t)&unk_20A08);
}

uint64_t sub_8DD0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  a3(isCurrentExecutor);

  return swift_release();
}

id sub_8FA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ApprovedDevelopersController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_9030()
{
  return type metadata accessor for ApprovedDevelopersController();
}

uint64_t type metadata accessor for ApprovedDevelopersController()
{
  uint64_t result = qword_24D60;
  if (!qword_24D60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_9084()
{
  sub_9120();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_9120()
{
  if (!qword_24D70)
  {
    sub_1C210();
    unint64_t v0 = sub_1C540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_24D70);
    }
  }
}

uint64_t sub_9178(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_91BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9178(&qword_24D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_9224()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_925C()
{
  return sub_8DD0(*(void *)(v0 + 16), 218, (void (*)(uint64_t))sub_39C0);
}

uint64_t sub_9290(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_92A0()
{
  return swift_release();
}

unint64_t sub_92A8()
{
  unint64_t result = qword_24D88;
  if (!qword_24D88)
  {
    sub_1C2F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_24D88);
  }
  return result;
}

unint64_t sub_9300()
{
  unint64_t result = qword_24D98;
  if (!qword_24D98)
  {
    sub_935C(&qword_24D90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_24D98);
  }
  return result;
}

uint64_t sub_935C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_93A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9178(&qword_24DA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_940C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9178(&qword_24D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_9474(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_9484(uint64_t a1, unint64_t *a2)
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

uint64_t sub_94C0(uint64_t a1)
{
  return sub_6CE0(a1, *(void **)(v1 + 16), 116, (uint64_t)&unk_20B80, (uint64_t)&unk_24DE8);
}

uint64_t sub_94FC(uint64_t a1)
{
  return sub_686C(a1, *(void **)(v1 + 16));
}

uint64_t sub_9504(uint64_t a1)
{
  return sub_6CE0(a1, *(void **)(v1 + 16), 139, (uint64_t)&unk_20B30, (uint64_t)&unk_24DD8);
}

uint64_t sub_9544(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_A17C;
  return sub_7228(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_961C(unint64_t a1)
{
  return sub_1B934(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_9630(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = a3;
  uint64_t v52 = a2;
  uint64_t v4 = sub_1C210();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v45 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v44 = (char *)&v39 - v11;
  uint64_t v13 = __chkstk_darwin(v10, v12);
  id v49 = a1;
  unint64_t v15 = *a1;
  uint64_t v16 = *(void *)(*a1 + 16);
  if (!v16) {
    return 0;
  }
  uint64_t v42 = (char *)&v39 - v14;
  uint64_t v48 = v13;
  unint64_t v17 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_1C4D0();
  uint64_t v41 = v5;
  uint64_t v51 = *(void *)(v5 + 72);
  swift_bridgeObjectRetain();
  unint64_t v18 = 0;
  unint64_t v43 = v17;
  while (1)
  {
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    if (sub_1C1E0() == v52 && v19 == v50) {
      break;
    }
    char v20 = sub_1C640();
    swift_release();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_12;
    }
    ++v18;
    v17 += v51;
    if (v16 == v18)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v15 + 16);
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
LABEL_12:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v22 = v48;
  if (!__OFADD__(v18, 1))
  {
    unint64_t v23 = *(void *)(v15 + 16);
    if (v18 + 1 == v23) {
      return v18;
    }
    uint64_t v24 = v51 + v17;
    unint64_t v25 = v18 + 1;
    uint64_t v26 = v42;
    uint64_t v27 = (uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 16);
    NSString v46 = (uint64_t (**)(char *, uint64_t))(v41 + 8);
    NSString v47 = (uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 16);
    uint64_t v40 = (uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 40);
    while (v25 < v23)
    {
      uint64_t v28 = v15 + v24;
      uint64_t v29 = *v27;
      (*v27)(v26, v28, v22);
      sub_1C4C0();
      sub_1C480();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      if (sub_1C1E0() == v52 && v30 == v50)
      {
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v22 = v48;
        uint64_t result = (*v46)(v26, v48);
      }
      else
      {
        char v31 = sub_1C640();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v22 = v48;
        uint64_t result = (*v46)(v26, v48);
        if ((v31 & 1) == 0)
        {
          if (v25 != v18)
          {
            if ((v18 & 0x8000000000000000) != 0) {
              goto LABEL_40;
            }
            unint64_t v32 = *v49;
            unint64_t v33 = *(void *)(*v49 + 16);
            if (v18 >= v33) {
              goto LABEL_41;
            }
            uint64_t v41 = v18 * v51;
            uint64_t result = v29(v44, v32 + v43 + v18 * v51, v22);
            if (v25 >= v33) {
              goto LABEL_42;
            }
            v29(v45, v32 + v24, v22);
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            *id v49 = v32;
            if ((result & 1) == 0)
            {
              uint64_t result = sub_961C(v32);
              unint64_t v32 = result;
              *id v49 = result;
            }
            if (v18 >= *(void *)(v32 + 16)) {
              goto LABEL_43;
            }
            unint64_t v34 = v32 + v43 + v41;
            uint64_t v35 = *v40;
            uint64_t v22 = v48;
            uint64_t result = (*v40)(v34, v45, v48);
            if (v25 >= *(void *)(*v49 + 16)) {
              goto LABEL_44;
            }
            uint64_t result = v35(*v49 + v24, v44, v22);
            uint64_t v26 = v42;
          }
          if (__OFADD__(v18++, 1)) {
            goto LABEL_39;
          }
        }
      }
      unint64_t v37 = v25 + 1;
      if (__OFADD__(v25, 1)) {
        goto LABEL_38;
      }
      unint64_t v15 = *v49;
      unint64_t v23 = *(void *)(*v49 + 16);
      ++v25;
      v24 += v51;
      BOOL v38 = v37 == v23;
      uint64_t v27 = v47;
      if (v38) {
        return v18;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_9B3C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_9C14;
  return sub_7228(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_9C14()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_9D0C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

void *sub_9D54(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_9D98(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_9DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v5 = sub_1C2F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1C310();
  uint64_t v10 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v11);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9484(0, &qword_24D80);
  uint64_t v14 = (void *)sub_1C510();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1786C;
  aBlock[3] = v20;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v3;
  sub_1C300();
  uint64_t v22 = &_swiftEmptyArrayStorage;
  sub_92A8();
  sub_9178(&qword_24D90);
  sub_9300();
  sub_1C580();
  sub_1C520();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v21);
  return swift_release();
}

uint64_t sub_A064()
{
  return sub_8DD0(*(void *)(v0 + 16), 224, (void (*)(uint64_t))sub_3DAC);
}

uint64_t sub_A098(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_9178(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_24DF8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_24DF8);
    }
  }
}

uint64_t sub_A180@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v22._countAndFlagsBits = a1;
  v22._object = a2;
  uint64_t v25 = a3;
  uint64_t v3 = sub_1C110();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v24 = sub_1C060();
  uint64_t v5 = *(void *)(v24 - 8);
  __chkstk_darwin(v24, v6);
  uint64_t v8 = (uint64_t *)((char *)&v22._countAndFlagsBits - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1C390();
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v11 = sub_1C370();
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v23 = sub_1C070();
  uint64_t v13 = *(void *)(v23 - 8);
  __chkstk_darwin(v23, v14);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v17 = [self currentDevice];
  unint64_t v18 = (char *)[v17 userInterfaceIdiom];

  uint64_t v19 = (void (**)(uint64_t *, void, uint64_t))(v5 + 104);
  sub_1C360();
  if (v18 == (unsigned char *)&dword_0 + 1)
  {
    v20._countAndFlagsBits = 0xD000000000000028;
    v20._object = (void *)0x800000000001D6C0;
  }
  else
  {
    v20._object = (void *)0x800000000001D690;
    v20._countAndFlagsBits = 0xD000000000000023;
  }
  sub_1C350(v20);
  sub_1C340(v22);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_1C350(v26);
  sub_1C380();
  *uint64_t v8 = type metadata accessor for AppInstallationSettingsController();
  (*v19)(v8, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v24);
  sub_1C100();
  sub_1C080();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v25, v16, v23);
  return swift_release();
}

uint64_t sub_A590@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_B2C8(a1, a2, 0xD00000000000001ALL, (void *)0x800000000001D6F0, a3);
}

uint64_t sub_A5B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = sub_1C110();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_1C060();
  uint64_t v18 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1C390();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_1C070();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  uint64_t v15 = (void (**)(uint64_t *, void, uint64_t))(v18 + 104);
  sub_1C330();
  uint64_t *v6 = type metadata accessor for AppInstallationSettingsController();
  (*v15)(v6, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v3);
  sub_1C100();
  sub_1C080();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v19, v13, v9);
  return swift_release();
}

uint64_t sub_A8DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = sub_1C110();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_1C060();
  uint64_t v18 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1C390();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_1C070();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  uint64_t v15 = (void (**)(uint64_t *, void, uint64_t))(v18 + 104);
  sub_1C330();
  uint64_t *v6 = type metadata accessor for AppInstallationSettingsController();
  (*v15)(v6, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v3);
  sub_1C100();
  sub_1C080();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v19, v13, v9);
  return swift_release();
}

uint64_t sub_AC08@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_B2C8(a1, a2, 0xD000000000000016, (void *)0x800000000001D630, a3);
}

uint64_t sub_AC28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = sub_1C110();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_1C060();
  uint64_t v18 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1C390();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_1C070();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  uint64_t v15 = (void (**)(uint64_t *, void, uint64_t))(v18 + 104);
  sub_1C330();
  uint64_t *v6 = type metadata accessor for AppInstallationSettingsController();
  (*v15)(v6, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v3);
  sub_1C100();
  sub_1C080();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v19, v13, v9);
  return swift_release();
}

uint64_t sub_AF54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = sub_1C110();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_1C060();
  uint64_t v18 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1C390();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_1C070();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  uint64_t v15 = (void (**)(uint64_t *, void, uint64_t))(v18 + 104);
  sub_1C330();
  uint64_t *v6 = type metadata accessor for AppInstallationSettingsController();
  (*v15)(v6, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v3);
  sub_1C100();
  sub_1C080();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v19, v13, v9);
  return swift_release();
}

uint64_t sub_B280@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_B2C8(a1, a2, 0x656C6C6174736E69, (void *)0xEE00737070612E64, a3);
}

uint64_t sub_B2A8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_B2C8(a1, a2, 0xD000000000000016, (void *)0x800000000001D4C0, a3);
}

uint64_t sub_B2C8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, void *a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v22 = a5;
  uint64_t v8 = sub_1C110();
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v10 = sub_1C060();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  id v14 = (uint64_t *)((char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_1C390();
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v17 = sub_1C370();
  __chkstk_darwin(v17 - 8, v18);
  sub_1C360();
  v23._countAndFlagsBits = a3;
  v23._object = a4;
  sub_1C350(v23);
  v24._countAndFlagsBits = a1;
  v24._object = v21;
  sub_1C340(v24);
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  sub_1C350(v25);
  sub_1C380();
  uint64_t *v14 = type metadata accessor for AppInstallationSettingsController();
  (*(void (**)(uint64_t *, void, uint64_t))(v11 + 104))(v14, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v10);
  sub_1C100();
  return sub_1C080();
}

uint64_t sub_B504@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D3C0, a1);
}

uint64_t sub_B520@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D4A0, a1);
}

uint64_t sub_B53C@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D380, a1);
}

uint64_t sub_B558@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D480, a1);
}

uint64_t sub_B574@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D450, a1);
}

uint64_t sub_B590@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D430, a1);
}

uint64_t sub_B5AC@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D400, a1);
}

uint64_t sub_B5C8@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D3E0, a1);
}

uint64_t sub_B5E4@<X0>(uint64_t a1@<X8>)
{
  return sub_BA0C(0xEC000000574F4C4CLL, a1);
}

uint64_t sub_B604@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D2E0, a1);
}

uint64_t sub_B620@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_B668(a1, a2, 13, 0x58585F5245444E55, (void *)0xED00005F424D5F58, a3);
}

uint64_t sub_B648@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_B668(a1, a2, 25, 0xD000000000000019, (void *)0x800000000001D340, a3);
}

uint64_t sub_B668@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  v29._countAndFlagsBits = a4;
  v29._object = a5;
  v28[1] = a3;
  v30._countAndFlagsBits = a1;
  v30._object = a2;
  uint64_t v31 = a6;
  uint64_t v6 = sub_1C110();
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v8 = sub_9178(&qword_24DF0);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C090();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1C060();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1C390();
  __chkstk_darwin(v22 - 8, v23);
  uint64_t v24 = sub_1C370();
  __chkstk_darwin(v24 - 8, v25);
  sub_1C360();
  sub_1C350(v29);
  sub_1C340(v30);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_1C350(v32);
  sub_1C380();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, enum case for URL.DirectoryHint.isDirectory(_:), v12);
  uint64_t v26 = sub_1C0D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v11, 1, 1, v26);
  sub_1C0C0();
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v21, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v17);
  sub_1C100();
  return sub_1C080();
}

uint64_t sub_B9F0@<X0>(uint64_t a1@<X8>)
{
  return sub_BA0C(0xE900000000000054, a1);
}

uint64_t sub_BA0C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v22[1] = a1;
  v22[2] = a2;
  uint64_t v2 = sub_1C390();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_1C110();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v6 = sub_9178(&qword_24DF0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C090();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C060();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C330();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, enum case for URL.DirectoryHint.isDirectory(_:), v10);
  uint64_t v20 = sub_1C0D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 1, 1, v20);
  sub_1C0C0();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v19, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v15);
  sub_1C100();
  return sub_1C080();
}

uint64_t sub_BD20@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D360, a1);
}

uint64_t sub_BD3C@<X0>(uint64_t a1@<X8>)
{
  return sub_BD58(0x800000000001D3A0, a1);
}

uint64_t sub_BD58@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v22[1] = a1;
  v22[2] = a2;
  uint64_t v2 = sub_1C110();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_9178(&qword_24DF0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C090();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C060();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C390();
  __chkstk_darwin(v18 - 8, v19);
  sub_1C330();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, enum case for URL.DirectoryHint.isDirectory(_:), v8);
  uint64_t v20 = sub_1C0D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
  sub_1C0C0();
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v17, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v13);
  sub_1C100();
  return sub_1C080();
}

uint64_t sub_C06C(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result || (int64_t v7 = *(void *)(v3 + 24) >> 1, v7 < v5))
  {
    if (v4 <= v5) {
      int64_t v8 = v4 + v2;
    }
    else {
      int64_t v8 = v4;
    }
    uint64_t result = (uint64_t)sub_1B510((char *)result, v8, 1, (char *)v3);
    uint64_t v3 = result;
    *uint64_t v1 = result;
    int64_t v7 = *(void *)(result + 24) >> 1;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = v7 - v9;
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_19;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v10 < v2)
  {
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v11 = v3 + 32 * v9 + 32;
  if (v6 + 32 < v11 + 32 * v2 && v11 < v6 + 32 + 32 * v2) {
    goto LABEL_26;
  }
  swift_arrayInitWithCopy();
  if (v2)
  {
    uint64_t v13 = *(void *)(v3 + 16);
    BOOL v14 = __OFADD__(v13, v2);
    uint64_t v15 = v13 + v2;
    if (!v14)
    {
      *(void *)(v3 + 16) = v15;
      goto LABEL_19;
    }
LABEL_25:
    __break(1u);
LABEL_26:
    uint64_t result = sub_1C620();
    __break(1u);
    return result;
  }
LABEL_19:
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == v10) {
LABEL_23:
  }
    *uint64_t v1 = v3;
  return result;
}

uint64_t sub_C1D8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C600();
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
  uint64_t v15 = sub_1C600();
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
    uint64_t v9 = sub_1C5C0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_162EC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1C600();
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

  return sub_1C430();
}

unint64_t sub_C3A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_9178(&qword_24FA8);
  uint64_t v2 = sub_1C610();
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
    sub_17630(v6, (uint64_t)&v15, &qword_24FB0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_15A40(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_9474(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_C4DC(uint64_t a1)
{
  uint64_t v2 = sub_9178(&qword_24F28);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (void *)((char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_9178(&qword_24F30);
  uint64_t v7 = sub_1C610();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  char v10 = (char *)v6 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v26[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_17630(v13, (uint64_t)v6, &qword_24F28);
    uint64_t v15 = *v6;
    uint64_t v16 = v6[1];
    unint64_t result = sub_15A40(*v6, v16);
    if (v18) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v20 = (uint64_t *)(v8[6] + 16 * result);
    *uint64_t v20 = v15;
    v20[1] = v16;
    uint64_t v21 = v8[7];
    uint64_t v22 = sub_1C210();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v19, v10, v22);
    uint64_t v23 = v8[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v8[2] = v25;
    v13 += v14;
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

unsigned char *sub_C6DC@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_C6E8()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v1 = result;
    NSString v2 = sub_1C3A0();
    id v3 = [v1 applicationIsInstalled:v2];
    swift_release();

    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_C7D8(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRelease();
  uint64_t v5 = &v3[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kAppStoreBundleID];
  *(void *)uint64_t v5 = 0xD000000000000012;
  *((void *)v5 + 1) = 0x800000000001DDD0;
  uint64_t v6 = &v3[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kASDUserDefaultsIdentifier];
  *(void *)uint64_t v6 = 0xD000000000000013;
  *((void *)v6 + 1) = 0x800000000001DDF0;
  uint64_t v7 = &v3[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kASDBackgroundAssetDownloadsEnabled];
  *(void *)uint64_t v7 = 0xD00000000000001FLL;
  *((void *)v7 + 1) = 0x800000000001DE10;
  uint64_t v8 = &v3[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kOffloadUnusedApps];
  *(void *)uint64_t v8 = 0xD000000000000011;
  *((void *)v8 + 1) = 0x800000000001DE30;
  uint64_t v9 = v3;
  sub_1C2C0();
  uint64_t v10 = OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_restoringAppStoreLock;
  sub_9178(&qword_24F90);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 20) = 0;
  *(unsigned char *)(v11 + 16) = 0;
  *(void *)&v9[v10] = v11;
  id v12 = [self processInfo];
  unsigned __int8 v13 = [v12 isLowPowerModeEnabled];

  v9[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_isLowPowerMode] = v13;
  sub_16708();
  v9[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_cellularNetworkingAllowed] = v14 & 1;
  *(void *)&v9[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_telephonyClient] = sub_16AAC();

  v23.receiver = v9;
  v23.super_class = (Class)type metadata accessor for AppInstallationSettingsController();
  uint64_t v15 = (char *)objc_msgSendSuper2(&v23, "initWithNibName:bundle:", 0, 0);
  uint64_t v16 = v15;
  long long v17 = *(void **)&v15[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_telephonyClient];
  if (v17) {
    [v17 setDelegate:v15];
  }
  else {
    char v18 = v15;
  }
  id v19 = [self defaultCenter];
  [v19 addObserver:v16 selector:"lowPowerModeChangedNotification:" name:NSProcessInfoPowerStateDidChangeNotification object:0];
  [v19 addObserver:v16 selector:"appWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
  id v20 = v16;
  uint64_t v21 = (void *)sub_1C190();
  [v19 addObserver:v20 selector:"distributorsOrDevelopersChanged:" name:v21 object:0];

  return v20;
}

id sub_CB6C()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AppInstallationSettingsController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_CD50()
{
  return type metadata accessor for AppInstallationSettingsController();
}

uint64_t type metadata accessor for AppInstallationSettingsController()
{
  uint64_t result = qword_24E70;
  if (!qword_24E70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_CE2C(uint64_t a1)
{
  return a1;
}

uint64_t sub_CE50()
{
  uint64_t v1 = sub_1C110();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_1C060();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (objc_class **)((char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1C390();
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v10 = sub_1C070();
  __chkstk_darwin(v10 - 8, v11);
  sub_1C4D0();
  v24[1] = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v12 = (objc_class *)type metadata accessor for AppInstallationSettingsController();
  v27.receiver = v0;
  v27.super_class = v12;
  objc_msgSendSuper2(&v27, "viewDidLoad");
  id v13 = [v0 navigationItem];
  [v13 setLargeTitleDisplayMode:2];

  id v14 = [v0 navigationItem];
  sub_1C330();
  *uint64_t v7 = v12;
  (*(void (**)(objc_class **, void, uint64_t))(v4 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v3);
  sub_1C100();
  sub_1C080();
  sub_1C3C0();
  long long v25 = 0u;
  long long v26 = 0u;
  NSString v15 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v16 = *((void *)&v26 + 1);
  if (*((void *)&v26 + 1))
  {
    long long v17 = sub_9D54(&v25, *((uint64_t *)&v26 + 1));
    uint64_t v18 = *(void *)(v16 - 8);
    __chkstk_darwin(v17, v17);
    id v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v16);
    sub_9D98((uint64_t)&v25);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [objc_allocWithZone((Class)UIBarButtonItem) initWithTitle:v15 style:0 target:v21 action:0];
  swift_unknownObjectRelease();

  [v14 setBackBarButtonItem:v22];
  return swift_release();
}

id sub_D3B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_9178(&qword_24F48);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C140();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  id v14 = (char *)v24 - v13;
  sub_1C4D0();
  v24[1] = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_16708();
  char v16 = v15;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *((unsigned char *)v0 + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_cellularNetworkingAllowed) = v16 & 1;
  swift_release();
  id v17 = [v0 specifiers];
  [v1 setSpecifiers:v17];

  sub_D75C();
  id result = [v1 table];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v19 = result;
  id v20 = [result indexPathForSelectedRow];

  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_11;
  }
  sub_1C130();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v21(v5, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_11:
    sub_A098((uint64_t)v5, &qword_24F48);
    return (id)swift_release();
  }
  v21(v14, v5, v6);
  id result = [v1 table];
  if (result)
  {
    id v22 = result;
    Class isa = sub_1C120().super.isa;
    [v22 deselectRowAtIndexPath:isa animated:0];

    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
    return (id)swift_release();
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_D75C()
{
  uint64_t v1 = v0;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(sub_1C1C0() + 16);
  swift_bridgeObjectRelease();
  NSString v3 = sub_1C3A0();
  Class isa = (Class)[v0 specifierForID:v3];

  if (v2)
  {
    if (isa)
    {
      [v1 reloadSpecifier:isa];
    }
    else
    {
      uint64_t v5 = sub_FA70();
      sub_D9E4((unint64_t)v5);
      swift_bridgeObjectRelease();
      Class isa = sub_1C410().super.isa;
      swift_bridgeObjectRelease();
      [v1 addSpecifiersFromArray:isa animated:1];
    }
  }
  else
  {
    if (!isa) {
      goto LABEL_10;
    }
    [v1 removeSpecifier:isa animated:1];
  }

LABEL_10:
  NSString v6 = sub_1C3A0();
  id v7 = [v1 specifierForID:v6];

  if (v7)
  {
    NSString v8 = sub_1C3A0();
    id v9 = [v1 specifierForID:v8];

    if (v9)
    {
      [v1 removeSpecifier:v7];
      [v1 removeSpecifier:v9];
      uint64_t v10 = sub_1047C();
      sub_D9E4((unint64_t)v10);
      swift_bridgeObjectRelease();
      Class v11 = sub_1C410().super.isa;
      swift_bridgeObjectRelease();
      [v1 addSpecifiersFromArray:v11];
    }
  }

  return swift_release();
}

uint64_t sub_D9E4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1C600();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  NSString v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v13 = _swiftEmptyArrayStorage;
  uint64_t result = sub_15BBC(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_1C5B0();
        sub_9484(0, &qword_24DB0);
        swift_dynamicCast();
        NSString v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_15BBC(0, v3[2] + 1, 1);
          NSString v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_15BBC(v6 > 1, v7 + 1, 1);
          NSString v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_9474(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      NSString v8 = (id *)(a1 + 32);
      sub_9484(0, &qword_24DB0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        NSString v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_15BBC(0, v3[2] + 1, 1);
          NSString v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_15BBC(v10 > 1, v11 + 1, 1);
          NSString v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_9474(v12, &v3[4 * v11 + 4]);
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

uint64_t sub_DC48()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = sub_DE54();
  sub_C1D8((unint64_t)v1);
  if (*(void *)(v0 + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_telephonyClient))
  {
    unint64_t v2 = sub_E9E4();
    sub_C1D8(v2);
  }
  NSString v3 = sub_F42C();
  sub_C1D8((unint64_t)v3);
  uint64_t v4 = *(void *)(sub_1C1C0() + 16);
  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v5 = sub_FA70();
    sub_C1D8((unint64_t)v5);
  }
  if ((sub_C6E8() & 1) == 0)
  {
    unint64_t v6 = sub_1047C();
    sub_C1D8((unint64_t)v6);
  }
  uint64_t v7 = sub_D9E4((unint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  swift_release();
  return v7;
}

void *sub_DE54()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C070();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v22 = (unint64_t)_swiftEmptyArrayStorage;
  id v6 = [self sharedConnection];
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = v6;
  if (![v6 isAutomaticAppUpdatesAllowed]
    || ![v7 isAppInstallationAllowed])
  {
    goto LABEL_10;
  }
  unsigned int v8 = [v7 isAutomaticAppDownloadsAllowed];

  if (!v8) {
    goto LABEL_11;
  }
  id v9 = sub_E264();
  if (!v9) {
    goto LABEL_11;
  }
  id v7 = v9;
  sub_1C400();
  if (*(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v22 & 0xFFFFFFFFFFFFFF8)) >> 1)
    goto LABEL_32;
  while (1)
  {
    sub_1C450();
    sub_1C430();
LABEL_10:

LABEL_11:
    id v10 = sub_E624();
    if (v10)
    {
      id v11 = v10;
      sub_1C400();
      if (*(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v22 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_1C440();
      sub_1C450();
      sub_1C430();
    }
    uint64_t v12 = (void *)v22;
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_1C600();
      swift_bridgeObjectRelease();
      if (v19 < 1) {
        goto LABEL_27;
      }
    }
    else if (*(uint64_t *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8)) < 1)
    {
      goto LABEL_27;
    }
    uint64_t v13 = self;
    sub_B504((uint64_t)v5);
    sub_1C3C0();
    NSString v14 = sub_1C3A0();
    swift_bridgeObjectRelease();
    id v7 = [v13 groupSpecifierWithName:v14];

    if (!v7)
    {
      swift_bridgeObjectRelease();
      uint64_t v12 = _swiftEmptyArrayStorage;
      goto LABEL_27;
    }
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    int v15 = *(unsigned __int8 *)(v1
                             + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_isLowPowerMode);
    swift_release();
    if (v15 == 1)
    {
      sub_B520((uint64_t)v5);
      sub_1C3C0();
      NSString v16 = sub_1C3A0();
      swift_bridgeObjectRelease();
      [v7 setProperty:v16 forKey:PSFooterTextGroupKey];
    }
    else
    {
      [v7 removePropertyForKey:PSFooterTextGroupKey];
    }
    if (!(v22 >> 62)) {
      break;
    }
    id v20 = v7;
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_1C600();
    swift_bridgeObjectRelease();
    if ((v1 & 0x8000000000000000) == 0) {
      goto LABEL_26;
    }
    __break(1u);
LABEL_32:
    sub_1C440();
  }
  id v17 = v7;
LABEL_26:
  sub_15EB8(0, 0, (uint64_t)v7);

  uint64_t v12 = (void *)v22;
LABEL_27:
  swift_release();
  return v12;
}

id sub_E264()
{
  uint64_t v1 = sub_1C070();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_B558((uint64_t)v4);
  sub_1C3C0();
  uint64_t v22 = type metadata accessor for AppInstallationSettingsController();
  v21[0] = v0;
  uint64_t v5 = v0;
  NSString v6 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v7 = v22;
  if (v22)
  {
    unsigned int v8 = sub_9D54(v21, v22);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8, v8);
    id v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_9D98((uint64_t)v21);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v6 target:v12 set:"setAppUpdatesSpecifierWithValue:specifier:" get:"getAppUpdatesSpecifier" detail:0 cell:6 edit:0];
  swift_unknownObjectRelease();

  if (v13)
  {
    v21[0] = type metadata accessor for ADMultilineSubtitleCell();
    id v14 = v13;
    sub_9178(&qword_24F38);
    [v14 setProperty:sub_1C650() forKey:PSCellClassKey];
    swift_unknownObjectRelease();

    id v15 = v14;
    sub_B574((uint64_t)v4);
    sub_1C3C0();
    NSString v16 = sub_1C3A0();
    swift_bridgeObjectRelease();
    [v15 setProperty:v16 forKey:PSTableCellSubtitleTextKey];
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v17 = v5[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_isLowPowerMode];
  swift_release();
  if (v13 && v17)
  {
    id v18 = v13;
    Class isa = sub_1C460().super.super.isa;
    [v18 setProperty:isa forKey:PSEnabledKey];
  }
  swift_release();
  return v13;
}

id sub_E624()
{
  uint64_t v1 = sub_1C070();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_B590((uint64_t)v4);
  sub_1C3C0();
  uint64_t v22 = type metadata accessor for AppInstallationSettingsController();
  v21[0] = v0;
  uint64_t v5 = v0;
  NSString v6 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v7 = v22;
  if (v22)
  {
    unsigned int v8 = sub_9D54(v21, v22);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8, v8);
    id v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_9D98((uint64_t)v21);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v6 target:v12 set:"setBackgroundAssetsSpecifierWithValue:specifier:" get:"getBackgroundAssetsSpecifier" detail:0 cell:6 edit:0];
  swift_unknownObjectRelease();

  if (v13)
  {
    v21[0] = type metadata accessor for ADMultilineSubtitleCell();
    id v14 = v13;
    sub_9178(&qword_24F38);
    [v14 setProperty:sub_1C650() forKey:PSCellClassKey];
    swift_unknownObjectRelease();

    id v15 = v14;
    sub_B5AC((uint64_t)v4);
    sub_1C3C0();
    NSString v16 = sub_1C3A0();
    swift_bridgeObjectRelease();
    [v15 setProperty:v16 forKey:PSTableCellSubtitleTextKey];
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v17 = v5[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_isLowPowerMode];
  swift_release();
  if (v13 && v17)
  {
    id v18 = v13;
    Class isa = sub_1C460().super.super.isa;
    [v18 setProperty:isa forKey:PSEnabledKey];
  }
  swift_release();
  return v13;
}

uint64_t sub_E9E4()
{
  uint64_t v30 = sub_1C270();
  uint64_t v0 = *(void *)(v30 - 8);
  __chkstk_darwin(v30, v1);
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C230();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v29 = sub_1C280();
  uint64_t v6 = *(void *)(v29 - 8);
  __chkstk_darwin(v29, v7);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C070();
  __chkstk_darwin(v10 - 8, v11);
  id v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  uint64_t v31 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v32 = (unint64_t)_swiftEmptyArrayStorage;
  id v14 = self;
  sub_B5C8((uint64_t)v13);
  sub_1C3C0();
  NSString v15 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v16 = [v14 groupSpecifierWithName:v15];

  if (v16)
  {
    sub_1C220();
    sub_1C260();
    sub_1C240();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v29);
    int v17 = (*(uint64_t (**)(char *, uint64_t))(v0 + 88))(v3, v30);
    if (v17 == enum case for CellularSettings.Prompt.always(_:))
    {
      sub_BD20((uint64_t)v13);
LABEL_10:
      sub_1C3C0();
      NSString v20 = sub_1C3A0();
      goto LABEL_11;
    }
    if (v17 == enum case for CellularSettings.Prompt.overLimit(_:))
    {
      sub_178B0();
      sub_B648(v18, v19, (uint64_t)v13);
      swift_bridgeObjectRelease();
      sub_1C3C0();
      NSString v20 = sub_1C3A0();
LABEL_11:
      swift_bridgeObjectRelease();
      [v16 setProperty:v20 forKey:PSFooterTextGroupKey];

      id v21 = v16;
      sub_1C400();
      if (*(void *)((char *)&dword_10 + (v32 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v32 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_1C440();
      sub_1C450();
      sub_1C430();
      id v22 = sub_EF48();
      if (v22)
      {
        id v23 = v22;
        sub_1C400();
        if (*(void *)((char *)&dword_10 + (v32 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v32 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_1C440();
        sub_1C450();
        sub_1C430();
      }
      id v24 = sub_F1AC();
      if (v24)
      {
        id v25 = v24;
        sub_1C400();
        if (*(void *)((char *)&dword_10 + (v32 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v32 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_1C440();
        sub_1C450();
        sub_1C430();
      }
      unint64_t v26 = v32;
      swift_release();
      return v26;
    }
    if (v17 == enum case for CellularSettings.Prompt.never(_:))
    {
      sub_B604((uint64_t)v13);
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_1C5F0();
  __break(1u);
  return result;
}

id sub_EF48()
{
  uint64_t v1 = sub_1C070();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_B504((uint64_t)v4);
  sub_1C3C0();
  uint64_t v16 = type metadata accessor for AppInstallationSettingsController();
  v15[0] = v0;
  id v5 = v0;
  NSString v6 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v7 = v16;
  if (v16)
  {
    uint64_t v8 = sub_9D54(v15, v16);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8, v8);
    uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_9D98((uint64_t)v15);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v6 target:v12 set:"setCellularDataAutomaticDownloadsSpecifierWithValue:specifier:" get:"getCellularDataAutomaticDownloadsSpecifier" detail:0 cell:6 edit:0];
  swift_unknownObjectRelease();

  swift_release();
  return v13;
}

id sub_F1AC()
{
  uint64_t v1 = sub_1C070();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_B53C((uint64_t)v4);
  sub_1C3C0();
  uint64_t v16 = type metadata accessor for AppInstallationSettingsController();
  v15[0] = v0;
  id v5 = v0;
  NSString v6 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v7 = v16;
  if (v16)
  {
    uint64_t v8 = sub_9D54(v15, v16);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8, v8);
    uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_9D98((uint64_t)v15);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v6 target:v12 set:0 get:"getCellularDataAppDownloadsSpecifier" detail:0 cell:2 edit:0];
  swift_unknownObjectRelease();

  if (v13)
  {
    type metadata accessor for CellularLimitsController();
    [v13 setDetailControllerClass:swift_getObjCClassFromMetadata()];
  }
  swift_release();
  return v13;
}

void *sub_F42C()
{
  uint64_t v0 = sub_1C110();
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v2 = sub_1C060();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  NSString v6 = (uint64_t *)((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1C390();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_1C070();
  __chkstk_darwin(v9 - 8, v10);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v21 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v11 = self;
  NSString v12 = sub_1C3A0();
  id v13 = [v11 groupSpecifierWithID:v12];

  if (v13)
  {
    sub_1C330();
    uint64_t *v6 = type metadata accessor for AppInstallationSettingsController();
    (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v2);
    sub_1C100();
    sub_1C080();
    sub_1C3C0();
    NSString v14 = sub_1C3A0();
    swift_bridgeObjectRelease();
    [v13 setProperty:v14 forKey:PSFooterTextGroupKey];

    id v15 = v13;
    sub_1C400();
    if (*(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v21 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_1C440();
    sub_1C450();
    sub_1C430();
    id v16 = sub_F80C();
    if (v16)
    {
      id v17 = v16;
      sub_1C400();
      if (*(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v21 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_1C440();
      sub_1C450();
      sub_1C430();
    }
    uint64_t v18 = (void *)v21;
  }
  else
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
  }
  swift_release();
  return v18;
}

id sub_F80C()
{
  uint64_t v1 = sub_1C070();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_BD3C((uint64_t)v4);
  sub_1C3C0();
  uint64_t v16 = type metadata accessor for AppInstallationSettingsController();
  v15[0] = v0;
  id v5 = v0;
  NSString v6 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v7 = v16;
  if (v16)
  {
    uint64_t v8 = sub_9D54(v15, v16);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8, v8);
    uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_9D98((uint64_t)v15);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v6 target:v12 set:"setOffloadUnusedAppsSpecifierWithValue:specifier:" get:"getOffloadUnusedAppsSpecifier" detail:0 cell:6 edit:0];
  swift_unknownObjectRelease();

  swift_release();
  return v13;
}

void *sub_FA70()
{
  uint64_t v51 = sub_1C210();
  uint64_t v44 = *(void *)(v51 - 8);
  __chkstk_darwin(v51, v0);
  uint64_t v2 = (char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1C110();
  __chkstk_darwin(v3 - 8, v4);
  NSString v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1C060();
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin(v46, v7);
  uint64_t v9 = (uint64_t *)((char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_1C390();
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v45 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C180();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  id v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C070();
  uint64_t v50 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18, v19);
  id v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20, v23);
  id v49 = (char *)&v43 - v24;
  sub_1C4D0();
  uint64_t v48 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v52 = (unint64_t)_swiftEmptyArrayStorage;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v17, enum case for FeatureFlag.webDistribution(_:), v13);
  sub_1C1D0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  sub_1C330();
  *uint64_t v9 = type metadata accessor for AppInstallationSettingsController();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v46);
  sub_1C100();
  id v25 = v49;
  sub_1C080();
  unint64_t v26 = self;
  NSString v27 = sub_1C3A0();
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v22, v25, v18);
  sub_1C3C0();
  NSString v28 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v29 = [v26 groupSpecifierWithID:v27 name:v28];

  if (v29)
  {
    id v30 = v29;
    sub_1C400();
    if (*(void *)((char *)&dword_10 + (v52 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v52 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_1C440();
    sub_1C450();
    sub_1C430();
    uint64_t v31 = sub_1C1A0();
    uint64_t v32 = *(void *)(v31 + 16);
    uint64_t v33 = v51;
    if (v32)
    {
      uint64_t v46 = (uint64_t)v30;
      NSString v47 = (char *)v18;
      unint64_t v34 = *(void (**)(char *, unint64_t, uint64_t))(v44 + 16);
      unint64_t v35 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
      uint64_t v45 = (char *)v31;
      unint64_t v36 = v31 + v35;
      uint64_t v37 = *(void *)(v44 + 72);
      BOOL v38 = (void (**)(char *, uint64_t))(v44 + 8);
      v34(v2, v31 + v35, v51);
      while (1)
      {
        id v39 = sub_100C8((uint64_t)v2);
        if (v39)
        {
          id v40 = v39;
          sub_1C400();
          if (*(void *)((char *)&dword_10 + (v52 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                         + (v52 & 0xFFFFFFFFFFFFFF8)) >> 1)
            sub_1C440();
          sub_1C450();
          sub_1C430();

          uint64_t v33 = v51;
        }
        (*v38)(v2, v33);
        v36 += v37;
        if (!--v32) {
          break;
        }
        v34(v2, v36, v33);
      }
      swift_bridgeObjectRelease();
      id v30 = (id)v46;
      uint64_t v18 = (uint64_t)v47;
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v41 = (void *)v52;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v41 = _swiftEmptyArrayStorage;
  }
  (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v18);
  swift_release();
  return v41;
}

id sub_100C8(uint64_t a1)
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C200();
  uint64_t v3 = type metadata accessor for AppInstallationSettingsController();
  v23[3] = v3;
  v23[0] = v1;
  id v4 = v1;
  NSString v5 = sub_1C3A0();
  swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v6 = sub_9D54(v23, v3);
    uint64_t v7 = *(void *)(v3 - 8);
    __chkstk_darwin(v6, v6);
    uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v3);
    sub_9D98((uint64_t)v23);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v5 target:v10 set:0 get:0 detail:0 cell:2 edit:0];
  swift_unknownObjectRelease();

  if (v11)
  {
    id v12 = v11;
    sub_1C1E0();
    NSString v13 = sub_1C3A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, "setIdentifier:", v13, v23[0]);

    sub_9178(&qword_24F20);
    uint64_t v14 = (int *)(sub_9178(&qword_24F28) - 8);
    unint64_t v15 = (*(unsigned __int8 *)(*(void *)v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v14 + 80);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1CFA0;
    id v17 = (void *)(v16 + v15);
    unint64_t v18 = v16 + v15 + v14[14];
    *id v17 = 0xD000000000000011;
    v17[1] = 0x800000000001D150;
    uint64_t v19 = sub_1C210();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v18, a1, v19);
    id v20 = v12;
    sub_C4DC(v16);
    Class isa = sub_1C320().super.isa;
    swift_bridgeObjectRelease();
    [v20 setUserInfo:isa];

    [v20 setControllerLoadAction:"viewApprovedDeveloperPageWithSpecifier:"];
  }
  swift_release();
  return v11;
}

void *sub_1047C()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v0 = self;
  NSString v1 = sub_1C3A0();
  id v2 = [v0 groupSpecifierWithID:v1];

  if (v2)
  {
    id v3 = v2;
    sub_1C400();
    if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
      sub_1C440();
    }
    sub_1C450();
    sub_1C430();
    id v4 = sub_1065C();
    if (v4)
    {
      id v5 = v4;
      sub_1C400();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_1C440();
      }
      sub_1C450();
      sub_1C430();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_release();
  return _swiftEmptyArrayStorage;
}

id sub_1065C()
{
  uint64_t v0 = sub_1C110();
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v2 = sub_1C060();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (void *)((char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1C390();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = (void *)sub_1C070();
  v40[0] = *(v9 - 1);
  uint64_t v11 = __chkstk_darwin(v9, v10);
  NSString v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)v40 - v15;
  uint64_t v17 = sub_1C4D0();
  uint64_t v42 = sub_1C4C0();
  v40[1] = v17;
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C330();
  uint64_t v18 = type metadata accessor for AppInstallationSettingsController();
  uint64_t *v6 = v18;
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v2);
  sub_1C100();
  sub_1C080();
  uint64_t v19 = v40[0];
  id v20 = v16;
  (*(void (**)(char *, char *, void *))(v40[0] + 16))(v13, v16, v9);
  sub_1C3C0();
  uint64_t v44 = v18;
  *(void *)uint64_t v43 = v41;
  uint64_t v21 = (char *)v41;
  NSString v22 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v23 = v44;
  id v41 = v9;
  if (v44)
  {
    uint64_t v24 = sub_9D54(v43, v44);
    uint64_t v25 = *(void *)(v23 - 8);
    __chkstk_darwin(v24, v24);
    NSString v27 = (char *)v40 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v25 + 16))(v27);
    uint64_t v28 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v23);
    sub_9D98((uint64_t)v43);
  }
  else
  {
    uint64_t v28 = 0;
  }
  id v29 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v22 target:v28 set:0 get:0 detail:0 cell:13 edit:0];
  swift_unknownObjectRelease();

  if (v29)
  {
    id v30 = v29;
    NSString v31 = sub_1C3A0();
    [v30 setIdentifier:v31];

    [v30 setButtonAction:"restoreAppStore"];
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v32 = *(os_unfair_lock_s **)&v21[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_restoringAppStoreLock];
  uint64_t v33 = v32 + 4;
  unint64_t v34 = v32 + 5;
  os_unfair_lock_lock(v32 + 5);
  sub_C6DC(v33, v43);
  os_unfair_lock_unlock(v34);
  int v35 = v43[0];
  swift_release();
  if (v29 && v35)
  {
    *(void *)uint64_t v43 = type metadata accessor for ADTableCellWithSpinner();
    id v36 = v29;
    sub_9178(&qword_24F18);
    [v36 setProperty:sub_1C650() forKey:PSCellClassKey];
    swift_unknownObjectRelease();

    id v37 = v36;
    Class isa = sub_1C460().super.super.isa;
    [v37 setProperty:isa forKey:PSEnabledKey];
  }
  (*(void (**)(char *, id))(v19 + 8))(v20, v41);
  swift_release();
  return v29;
}

Class sub_10C64()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v1 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_isLowPowerMode);
  swift_release();
  if (v1 == 1)
  {
    sub_9484(0, &qword_24F10);
    v2.super.super.Class isa = sub_1C530(0).super.super.isa;
LABEL_16:
    Class isa = v2.super.super.isa;
    swift_release();
    return isa;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  Class result = (Class)kSSUserDefaultsKeyAutoUpdatesEnabled;
  if (kSSUserDefaultsKeyAutoUpdatesEnabled)
  {
    if (kSSUserDefaultsIdentifier)
    {
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyAutoUpdatesEnabled, kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat) {
        BOOL v5 = AppBooleanValue == 0;
      }
      else {
        BOOL v5 = 0;
      }
      uint64_t v6 = !v5;
      v2.super.super.Class isa = (Class)[objc_allocWithZone((Class)NSNumber) initWithBool:v6];
      goto LABEL_16;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Class sub_10F1C()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v1 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_isLowPowerMode);
  swift_release();
  if (v1 == 1)
  {
    sub_9484(0, &qword_24F10);
    v2.super.super.Class isa = sub_1C530(0).super.super.isa;
    goto LABEL_20;
  }
  id v3 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v4 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithSuiteName:v4];

  if (!v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
LABEL_15:
    sub_A098((uint64_t)&v16, &qword_24DA8);
    sub_9484(0, &qword_24F10);
    v2.super.super.Class isa = sub_1C530(1).super.super.isa;
    goto LABEL_20;
  }
  NSString v6 = sub_1C3A0();
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    sub_1C570();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_93A4((uint64_t)v15, (uint64_t)&v16);
  if (!*((void *)&v17 + 1)) {
    goto LABEL_15;
  }
  sub_A098((uint64_t)&v16, &qword_24DA8);
  id v8 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v9 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithSuiteName:v9];

  if (v10)
  {
    NSString v11 = sub_1C3A0();
    id v12 = [v10 BOOLForKey:v11];
  }
  else
  {
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    id v12 = 0;
  }
  v2.super.super.Class isa = (Class)[objc_allocWithZone((Class)NSNumber) initWithBool:v12];
LABEL_20:
  Class isa = v2.super.super.isa;
  swift_release();
  return isa;
}

id sub_112C0()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_cellularNetworkingAllowed);
  swift_release();
  id v2 = [objc_allocWithZone((Class)NSNumber) initWithBool:v1];
  swift_release();
  return v2;
}

uint64_t sub_11410()
{
  uint64_t v0 = sub_1C070();
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v21 = (uint64_t)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1C270();
  uint64_t v3 = *(void *)(v20 - 8);
  __chkstk_darwin(v20, v4);
  NSString v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C230();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_1C280();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  NSString v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C220();
  sub_1C260();
  sub_1C240();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v20);
  if (v14 == enum case for CellularSettings.Prompt.always(_:))
  {
    sub_B9F0(v21);
LABEL_9:
    uint64_t v17 = sub_1C3C0();
    swift_release();
    return v17;
  }
  if (v14 == enum case for CellularSettings.Prompt.overLimit(_:))
  {
    sub_178B0();
    sub_B620(v15, v16, v21);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (v14 == enum case for CellularSettings.Prompt.never(_:))
  {
    sub_B5E4(v21);
    goto LABEL_9;
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_1C5F0();
  __break(1u);
  return result;
}

id sub_118AC()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v1 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2)
  {
    NSString v3 = sub_1C3A0();
    id v4 = [v2 BOOLForKey:v3];
  }
  else
  {
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    id v4 = 0;
  }
  id v5 = [objc_allocWithZone((Class)NSNumber) initWithBool:v4];
  swift_release();
  return v5;
}

id sub_11A7C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  uint64_t v7 = (void *)a4();
  swift_release();

  return v7;
}

void sub_11B60(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void (*a6)(id))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  a6(v10);
  swift_release();
}

void sub_11C5C(void *a1)
{
  id v2 = v1;
  uint64_t v4 = sub_1C2A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  id v12 = (char *)&v24 - v11;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a1)
  {
    id v25 = a1;
    id v13 = [v25 identifier];
    if (v13)
    {
      int v14 = v13;
      sub_1C3B0();

      sub_1C290();
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v12, v4);
      id v15 = objc_allocWithZone((Class)sub_9178(&qword_24DA0));
      long long v16 = (void *)sub_1C2E0();
      NSString v17 = sub_1C3A0();
      id v18 = [v25 propertyForKey:v17];

      if (v18)
      {
        sub_1C570();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v26, 0, sizeof(v26));
      }
      sub_93A4((uint64_t)v26, (uint64_t)v27);
      if (v28)
      {
        if (swift_dynamicCast())
        {
          id v20 = v16;
          NSString v21 = sub_1C3A0();
          swift_bridgeObjectRelease();
          [v20 setTitle:v21];
        }
      }
      else
      {
        sub_A098((uint64_t)v27, &qword_24DA8);
      }
      id v22 = [v2 navigationController];
      if (v22)
      {
        uint64_t v23 = v22;
        [v22 pushViewController:v16 animated:1];

        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
        swift_release();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
        swift_release();
      }
    }
    else
    {
      swift_release();
      id v19 = v25;
    }
  }
  else
  {
    swift_release();
  }
}

void sub_12038(void *a1)
{
  id v2 = v1;
  uint64_t v4 = sub_9178(&qword_24D78);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C210();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  id v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  long long v16 = (char *)&v28 - v15;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a1)
  {
    id v17 = a1;
    if ([v17 userInfo])
    {
      sub_1C570();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v30, 0, sizeof(v30));
    }
    sub_93A4((uint64_t)v30, (uint64_t)&v31);
    if (*((void *)&v32 + 1))
    {
      sub_9178(&qword_24F08);
      if ((swift_dynamicCast() & 1) == 0)
      {
        swift_release();
        goto LABEL_17;
      }
      uint64_t v18 = v29;
      if (*(void *)(v29 + 16) && (unint64_t v19 = sub_15A40(0xD000000000000011, 0x800000000001D150), (v20 & 1) != 0))
      {
        sub_15378(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v31);
      }
      else
      {
        long long v31 = 0u;
        long long v32 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v32 + 1))
      {
        int v23 = swift_dynamicCast();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, v23 ^ 1u, 1, v8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
        {
          (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v16, v7, v8);
          (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v16, v8);
          id v24 = objc_allocWithZone((Class)type metadata accessor for ApprovedDevelopersController());
          id v25 = sub_2F54((uint64_t)v13);
          id v26 = [v2 navigationController];
          if (v26)
          {
            NSString v27 = v26;
            [v26 pushViewController:v25 animated:1];

            (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
LABEL_26:
            swift_release();
            return;
          }
          (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
          swift_release();

LABEL_17:
          return;
        }
      }
      else
      {
        sub_A098((uint64_t)&v31, &qword_24DA8);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
      }

      NSString v21 = &qword_24D78;
      id v22 = v7;
    }
    else
    {

      NSString v21 = &qword_24DA8;
      id v22 = (char *)&v31;
    }
    sub_A098((uint64_t)v22, v21);
    goto LABEL_26;
  }

  swift_release();
}

uint64_t sub_124A4()
{
  uint64_t v1 = sub_1C2F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C310();
  uint64_t v6 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v7);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  v15[1] = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9484(0, &qword_24D80);
  uint64_t v10 = (void *)sub_1C510();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v0;
  aBlock[4] = sub_15220;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1786C;
  aBlock[3] = &unk_20C48;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v0;
  sub_1C300();
  id v17 = _swiftEmptyArrayStorage;
  sub_92A8();
  sub_9178(&qword_24D90);
  sub_175EC((unint64_t *)&qword_24D98, &qword_24D90);
  sub_1C580();
  sub_1C520();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v16);
  swift_release();
  return swift_release();
}

uint64_t sub_127B4(void *a1)
{
  uint64_t v2 = sub_9178(&qword_24DC8);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  __chkstk_darwin(isCurrentExecutor, v7);
  v16[-16] = 1;
  uint64_t v9 = v8 + 4;
  uint64_t v10 = v8 + 5;
  os_unfair_lock_lock(v8 + 5);
  sub_15240(v9);
  os_unfair_lock_unlock(v10);
  swift_release();
  sub_D3B8();
  uint64_t v11 = sub_1C4F0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  id v12 = a1;
  uint64_t v13 = sub_1C4C0();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v12;
  sub_176C0((uint64_t)v5, (uint64_t)&unk_24ED8, (uint64_t)v14);
  swift_release();
  return swift_release();
}

uint64_t sub_12A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[47] = a4;
  uint64_t v5 = sub_1C2F0();
  v4[48] = v5;
  v4[49] = *(void *)(v5 - 8);
  v4[50] = swift_task_alloc();
  uint64_t v6 = sub_1C310();
  v4[51] = v6;
  v4[52] = *(void *)(v6 - 8);
  v4[53] = swift_task_alloc();
  uint64_t v7 = sub_9178(&qword_24EE0);
  v4[54] = v7;
  v4[55] = *(void *)(v7 - 8);
  v4[56] = swift_task_alloc();
  uint64_t v8 = sub_9178(&qword_24EE8);
  v4[57] = v8;
  v4[58] = *(void *)(v8 - 8);
  v4[59] = swift_task_alloc();
  uint64_t v9 = sub_1C0F0();
  v4[60] = v9;
  v4[61] = *(void *)(v9 - 8);
  v4[62] = swift_task_alloc();
  v4[63] = sub_1C4D0();
  v4[64] = sub_1C4C0();
  uint64_t v11 = sub_1C480();
  v4[65] = v11;
  v4[66] = v10;
  return _swift_task_switch(sub_12C74, v11, v10);
}

uint64_t sub_12C74()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  uint64_t v3 = v0[62];
  uint64_t v4 = v1[59];
  uint64_t v5 = v1[57];
  uint64_t v6 = v1[58];
  id v12 = self;
  id v7 = objc_allocWithZone((Class)ASDSystemAppMetadata);
  swift_bridgeObjectRetain();
  NSString v8 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithBundleID:v8];
  v1[67] = v9;

  v1[2] = v1;
  v1[7] = v3;
  v1[3] = sub_12E78;
  swift_continuation_init();
  v1[25] = v5;
  uint64_t v10 = sub_15304(v1 + 22);
  v1[68] = sub_9178(&qword_24EF0);
  sub_1C490();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 32))(v10, v4, v5);
  v1[18] = _NSConcreteStackBlock;
  v1[19] = 1107296256;
  v1[20] = sub_13E20;
  v1[21] = &unk_20C98;
  objc_msgSend(v12, "installApp:withCompletionHandler:", v9);
  return _swift_continuation_await(v2);
}

uint64_t sub_12E78()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 552) = v2;
  uint64_t v3 = *(void *)(v1 + 528);
  uint64_t v4 = *(void *)(v1 + 520);
  if (v2) {
    uint64_t v5 = sub_135C4;
  }
  else {
    uint64_t v5 = sub_12FA8;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_12FA8()
{
  uint64_t v1 = (void *)v0[67];
  (*(void (**)(void, void))(v0[61] + 8))(v0[62], v0[60]);

  id v2 = [self serviceWithDefaultShellEndpoint];
  v0[70] = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v5 = v0[55];
    uint64_t v4 = v0[56];
    uint64_t v6 = v0[54];
    NSString v7 = sub_1C3A0();
    v0[71] = v7;
    v0[10] = v0;
    v0[15] = v0 + 46;
    v0[11] = sub_1330C;
    swift_continuation_init();
    v0[33] = v6;
    NSString v8 = sub_15304(v0 + 30);
    sub_9484(0, &qword_24EF8);
    sub_1C490();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 32))(v8, v4, v6);
    v0[26] = _NSConcreteStackBlock;
    v0[27] = 1107296256;
    v0[28] = sub_13F04;
    v0[29] = &unk_20D10;
    [v3 openApplication:v7 withOptions:0 completion:v0 + 26];
    return _swift_continuation_await(v0 + 10);
  }
  else
  {
    swift_release();
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v9 = *(os_unfair_lock_s **)(v0[47]
                              + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_restoringAppStoreLock);
    *(unsigned char *)(swift_task_alloc() + 16) = 0;
    uint64_t v10 = v9 + 4;
    v9 += 5;
    os_unfair_lock_lock(v9);
    sub_17694(v10);
    os_unfair_lock_unlock(v9);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_1330C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 576) = v2;
  uint64_t v3 = *(void *)(v1 + 528);
  uint64_t v4 = *(void *)(v1 + 520);
  if (v2) {
    uint64_t v5 = sub_139EC;
  }
  else {
    uint64_t v5 = sub_1343C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1343C()
{
  uint64_t v1 = *(void **)(v0 + 568);
  uint64_t v2 = *(void **)(v0 + 560);
  swift_release();

  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v0 + 376)
                            + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_restoringAppStoreLock);
  *(unsigned char *)(swift_task_alloc() + 16) = 0;
  uint64_t v4 = v3 + 4;
  v3 += 5;
  os_unfair_lock_lock(v3);
  sub_17694(v4);
  os_unfair_lock_unlock(v3);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_135C4()
{
  id v22 = v0;
  uint64_t v1 = (void *)v0[67];
  swift_release();
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_1C2B0();
  os_log_type_t v3 = sub_1C500();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getErrorValue();
    uint64_t v5 = sub_1C660();
    unint64_t v7 = v6;
    swift_release();
    v0[45] = sub_153E4(v5, v7, &v21);
    sub_1C550();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Failed to restore App Store: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = v0[53];
  uint64_t v9 = v0[50];
  uint64_t v19 = v0[52];
  uint64_t v20 = v0[51];
  uint64_t v11 = v0[48];
  uint64_t v10 = v0[49];
  id v12 = (void *)v0[47];
  sub_9484(0, &qword_24D80);
  uint64_t v13 = (void *)sub_1C510();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  v0[38] = sub_153DC;
  v0[39] = v14;
  v0[34] = _NSConcreteStackBlock;
  v0[35] = 1107296256;
  v0[36] = sub_1786C;
  v0[37] = &unk_20CE8;
  uint64_t v15 = _Block_copy(v0 + 34);
  id v16 = v12;
  sub_1C300();
  v0[44] = _swiftEmptyArrayStorage;
  sub_92A8();
  sub_9178(&qword_24D90);
  sub_175EC((unint64_t *)&qword_24D98, &qword_24D90);
  sub_1C580();
  sub_1C520();
  _Block_release(v15);

  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v8, v20);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_139EC()
{
  uint64_t v23 = v0;
  uint64_t v1 = (void *)v0[71];
  uint64_t v2 = (void *)v0[70];
  swift_release();
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v3 = sub_1C2B0();
  os_log_type_t v4 = sub_1C500();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getErrorValue();
    uint64_t v6 = sub_1C660();
    unint64_t v8 = v7;
    swift_release();
    v0[45] = sub_153E4(v6, v8, &v22);
    sub_1C550();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "Failed to restore App Store: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v9 = v0[53];
  uint64_t v10 = v0[50];
  uint64_t v20 = v0[52];
  uint64_t v21 = v0[51];
  uint64_t v12 = v0[48];
  uint64_t v11 = v0[49];
  uint64_t v13 = (void *)v0[47];
  sub_9484(0, &qword_24D80);
  uint64_t v14 = (void *)sub_1C510();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  v0[38] = sub_153DC;
  v0[39] = v15;
  v0[34] = _NSConcreteStackBlock;
  v0[35] = 1107296256;
  v0[36] = sub_1786C;
  v0[37] = &unk_20CE8;
  id v16 = _Block_copy(v0 + 34);
  id v17 = v13;
  sub_1C300();
  v0[44] = _swiftEmptyArrayStorage;
  sub_92A8();
  sub_9178(&qword_24D90);
  sub_175EC((unint64_t *)&qword_24D98, &qword_24D90);
  sub_1C580();
  sub_1C520();
  _Block_release(v16);

  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v9, v21);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

void sub_13E20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1C0F0();
  __chkstk_darwin(v5 - 8, v6);
  sub_9D54((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v7 = a3;
    sub_9178(&qword_24EE8);
    sub_1C4A0();
  }
  else
  {
    sub_1C0E0();
    sub_9178(&qword_24EE8);
    sub_1C4B0();
  }
}

void sub_13F04(uint64_t a1, void *a2, void *a3)
{
  sub_9D54((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    sub_9178(&qword_24EE0);
    sub_1C4A0();
  }
  else if (a2)
  {
    id v6 = a2;
    sub_9178(&qword_24EE0);
    sub_1C4B0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_13FA8()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C4C0();
  sub_1C480();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  __chkstk_darwin(isCurrentExecutor, v1);
  os_log_type_t v3 = v2 + 4;
  os_log_type_t v4 = v2 + 5;
  os_unfair_lock_lock(v2 + 5);
  sub_17694(v3);
  os_unfair_lock_unlock(v4);
  swift_release();
  sub_D3B8();
  return swift_release();
}

uint64_t sub_14128(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  a4();

  return swift_release();
}

uint64_t sub_141E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_1C4D0();
  *(void *)(v4 + 24) = sub_1C4C0();
  uint64_t v6 = sub_1C480();
  return _swift_task_switch(sub_1427C, v6, v5);
}

uint64_t sub_1427C()
{
  swift_release();
  sub_D75C();
  sub_D3B8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_14304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = sub_1C4D0();
  v4[4] = sub_1C4C0();
  uint64_t v6 = sub_1C480();
  return _swift_task_switch(sub_143A0, v6, v5);
}

uint64_t sub_143A0()
{
  swift_release();
  id v1 = [self processInfo];
  unsigned __int8 v2 = [v1 isLowPowerModeEnabled];

  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_isLowPowerMode) = v2;
  swift_release();
  sub_D3B8();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_144D4(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_9178(&qword_24DC8);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C4F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_1C4D0();
  id v13 = a1;
  id v14 = a3;
  uint64_t v15 = sub_1C4C0();
  id v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v13;
  sub_176C0((uint64_t)v11, a5, (uint64_t)v16);
  swift_release();
}

uint64_t sub_1460C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_1C4D0();
  *(void *)(v4 + 24) = sub_1C4C0();
  uint64_t v6 = sub_1C480();
  return _swift_task_switch(sub_146A4, v6, v5);
}

uint64_t sub_146A4()
{
  swift_release();
  sub_D3B8();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_148EC()
{
  uint64_t result = sub_1C2D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_14B60()
{
  return sub_1518C(type metadata accessor for ADMultilineSubtitleCell);
}

uint64_t type metadata accessor for ADMultilineSubtitleCell()
{
  return self;
}

void sub_14B9C(uint64_t a1)
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = [objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [v3 startAnimating];
  [v1 setAccessoryView:v3];
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ADTableCellWithSpinner();
  objc_msgSendSuper2(&v4, "refreshCellContentsWithSpecifier:", a1);
  swift_release();
}

void sub_14CB4(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void *))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = a3;
  id v9 = a1;
  a5(a3);
  swift_release();
}

id sub_14DA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v8 = a1;
  if (a3)
  {
    NSString v9 = sub_1C3A0();
    a1 = swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v13.receiver = v5;
  v13.super_class = (Class)a5(a1);
  id v10 = objc_msgSendSuper2(&v13, "initWithStyle:reuseIdentifier:specifier:", v8, v9, a4);

  id v11 = v10;
  if (v11) {

  }
  return v11;
}

id sub_14E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t (*a7)(uint64_t))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a4)
  {
    uint64_t v11 = sub_1C3B0();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v13 = a5;
  id v14 = sub_14DA0(a3, v11, a4, a5, a7);
  swift_release();
  return v14;
}

id sub_14F84(void *a1, uint64_t a2, uint64_t a3, NSString a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  if (a4)
  {
    sub_1C3B0();
    a4 = sub_1C3A0();
    uint64_t isCurrentExecutor = swift_bridgeObjectRelease();
  }
  v13.receiver = a1;
  v13.super_class = (Class)a6(isCurrentExecutor);
  id v11 = objc_msgSendSuper2(&v13, "initWithStyle:reuseIdentifier:", a3, a4);
  swift_release();

  return v11;
}

id sub_150A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  v11.receiver = a1;
  v11.super_class = (Class)a5(isCurrentExecutor);
  id v9 = objc_msgSendSuper2(&v11, "initWithCoder:", a3);
  swift_release();
  return v9;
}

id sub_15174()
{
  return sub_1518C(type metadata accessor for ADTableCellWithSpinner);
}

id sub_1518C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ADTableCellWithSpinner()
{
  return self;
}

uint64_t sub_151E8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_15220()
{
  return sub_127B4(*(void **)(v0 + 16));
}

uint64_t sub_15228(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_15238()
{
  return swift_release();
}

unsigned char *sub_15240(unsigned char *result)
{
  *uint64_t result = *(unsigned char *)(v1 + 16);
  return result;
}

uint64_t sub_15250(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_9C14;
  return sub_12A00(a1, v4, v5, v6);
}

uint64_t *sub_15304(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_15368(uint64_t a1, uint64_t a2)
{
  return sub_15378(a2 + 32, a1 + 32);
}

uint64_t sub_15378(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_153D4(uint64_t a1)
{
  return sub_9D98(a1 + 32);
}

uint64_t sub_153DC()
{
  return sub_13FA8();
}

uint64_t sub_153E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_154B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_15378((uint64_t)v12, *a3);
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
      sub_15378((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_9D98((uint64_t)v12);
  return v7;
}

uint64_t sub_154B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C560();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_15674(a5, a6);
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
  uint64_t v8 = sub_1C5D0();
  if (!v8)
  {
    sub_1C5E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C620();
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

uint64_t sub_15674(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1570C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_158EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_158EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1570C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_15884(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C5A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1C5E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C3F0();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_1C620();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1C5E0();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_15884(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_9178(&qword_24F00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_158EC(char a1, int64_t a2, char a3, char *a4)
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
    sub_9178(&qword_24F00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  objc_super v13 = a4 + 32;
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
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

unint64_t sub_15A40(uint64_t a1, uint64_t a2)
{
  sub_1C670();
  sub_1C3D0();
  Swift::Int v4 = sub_1C680();

  return sub_15AB8(a1, a2, v4);
}

unint64_t sub_15AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C640() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        objc_super v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1C640() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_15B9C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_15BDC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_15BBC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_15D48(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_15BDC(char a1, int64_t a2, char a3, char *a4)
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
    sub_9178(&qword_24FA0);
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
  objc_super v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

uint64_t sub_15D48(char a1, int64_t a2, char a3, char *a4)
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
    sub_9178(&qword_24F40);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  objc_super v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

uint64_t sub_15EB8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!(*v4 >> 62))
    {
      if (*(void *)((char *)&dword_10 + (*v4 & 0xFFFFFFFFFFFFFF8)) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_1C600();
  swift_bridgeObjectRelease();
  if (v22 < v5) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v8 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v7 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1C600();
    swift_bridgeObjectRelease();
    uint64_t v10 = v23 + v7;
    if (!__OFADD__(v23, v7)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (*v4 >> 62) {
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (*v4 & 0xFFFFFFFFFFFFFF8));
  uint64_t v10 = v9 + v7;
  if (__OFADD__(v9, v7)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v11 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v4 = v11;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v11 & 0x8000000000000000) != 0
    || (v11 & 0x4000000000000000) != 0
    || (uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8, v10 > *(void *)((char *)&dword_18 + (v11 & 0xFFFFFFFFFFFFFF8)) >> 1))
  {
    if (!(v11 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      unint64_t v11 = sub_1C5C0();
      swift_bridgeObjectRelease();
      unint64_t *v4 = v11;
      uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    sub_1C600();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  BOOL v14 = (void *)(v13 + 32 + 8 * v6);
  sub_9484(0, &qword_24DB0);
  swift_arrayDestroy();
  if (v7)
  {
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_1C600();
      swift_bridgeObjectRelease();
      uint64_t v16 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_17:
        if (v16 < 0)
        {
LABEL_42:
          uint64_t result = sub_1C620();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v14 + 1);
        uint64_t v18 = (char *)(v13 + 32 + 8 * v5);
        if (v14 + 1 != (void *)v18 || v17 >= &v18[8 * v16]) {
          memmove(v17, v18, 8 * v16);
        }
        if (!(v11 >> 62))
        {
          uint64_t v19 = *(void *)(v13 + 16);
          uint64_t v20 = v19 + v7;
          if (!__OFADD__(v19, v7))
          {
LABEL_23:
            *(void *)(v13 + 16) = v20;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_1C600();
        swift_bridgeObjectRelease();
        uint64_t v20 = v25 + v7;
        if (!__OFADD__(v25, v7)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v15 = *(void *)(v13 + 16);
      uint64_t v16 = v15 - v5;
      if (!__OFSUB__(v15, v5)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:
  void *v14 = v3;

  return sub_1C430();
}

void (*sub_161B4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_16264(v6, a2, a3);
  return sub_1621C;
}

void sub_1621C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_16264(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_1C5B0();
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
    return sub_162E4;
  }
  __break(1u);
  return result;
}

void sub_162E4(id *a1)
{
}

uint64_t sub_162EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C600();
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
    uint64_t v10 = sub_1C600();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_175EC(&qword_24F88, &qword_24F80);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_9178(&qword_24F80);
          uint64_t v12 = sub_161B4(v16, i, a3);
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
    sub_9484(0, &qword_24DB0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

uint64_t sub_16520(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_1B934(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(sub_1C210() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

void sub_16708()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (kSSUserDefaultsIdentifier)
  {
    sub_1C3B0();
    id v0 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v1 = sub_1C3A0();
    swift_bridgeObjectRelease();
    id v2 = [v0 initWithSuiteName:v1];

    if (v2)
    {
      NSString v3 = sub_1C3A0();
      [v2 BOOLForKey:v3];
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_16848(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_A17C;
  return sub_1460C(a1, v4, v5, v6);
}

uint64_t sub_16900(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_A17C;
  return sub_14304(a1, v4, v5, v6);
}

uint64_t sub_169B8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_169F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_A17C;
  return sub_141E4(a1, v4, v5, v6);
}

id sub_16AAC()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (!v0) {
    __break(1u);
  }
  NSString v1 = v0;
  int wifiCapability = MobileGestalt_get_wifiCapability();

  if (!wifiCapability) {
    return 0;
  }
  sub_9484(0, &qword_24D80);
  NSString v3 = (void *)sub_1C510();
  id v4 = [objc_allocWithZone((Class)CoreTelephonyClient) initWithQueue:v3];

  id v24 = 0;
  id v5 = [v4 getSubscriptionInfoWithError:&v24];
  if (!v5)
  {
    id v15 = v24;
    sub_1C050();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
  uint64_t v6 = v5;
  id v7 = v24;
  id v8 = [v6 subscriptions];

  if (!v8)
  {
LABEL_15:

    return 0;
  }
  sub_9484(0, &qword_24F98);
  unint64_t v9 = sub_1C420();

  if (v9 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C600();
    if (v10) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  uint64_t v10 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v10)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
LABEL_7:
  uint64_t v11 = 4;
  while (1)
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v12 = (id)sub_1C5B0();
    }
    else {
      id v12 = *(id *)(v9 + 8 * v11);
    }
    unint64_t v13 = v12;
    uint64_t v14 = v11 - 3;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if ([v12 slotID] == (char *)&dword_0 + 1) {
      break;
    }

    ++v11;
    if (v14 == v10) {
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRelease_n();
  NSString v17 = sub_1C3A0();
  id v18 = [objc_allocWithZone((Class)CTBundle) initWithBundleType:1];
  id v24 = 0;
  id v19 = [v4 copyCarrierBundleValue:v13 key:v17 bundleType:v18 error:&v24];

  id v20 = v24;
  if (!v19)
  {
    id v22 = v24;
    sub_1C050();

    swift_willThrow();
    swift_errorRelease();
    return v4;
  }
  self;
  if (!swift_dynamicCastObjCClass())
  {
    id v23 = v20;

    return v4;
  }
  LOBYTE(v24) = 2;
  id v21 = v20;
  sub_1C470();

  if (v24 != 2 && (v24 & 1) == 0) {
    goto LABEL_15;
  }
  return v4;
}

void sub_16E08()
{
  NSString v1 = &v0[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kAppStoreBundleID];
  *(void *)NSString v1 = 0xD000000000000012;
  *((void *)v1 + 1) = 0x800000000001DDD0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kASDUserDefaultsIdentifier];
  *(void *)uint64_t v2 = 0xD000000000000013;
  *((void *)v2 + 1) = 0x800000000001DDF0;
  NSString v3 = &v0[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kASDBackgroundAssetDownloadsEnabled];
  *(void *)NSString v3 = 0xD00000000000001FLL;
  *((void *)v3 + 1) = 0x800000000001DE10;
  id v4 = &v0[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_kOffloadUnusedApps];
  *(void *)id v4 = 0xD000000000000011;
  *((void *)v4 + 1) = 0x800000000001DE30;
  sub_1C2C0();
  uint64_t v5 = OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_restoringAppStoreLock;
  sub_9178(&qword_24F90);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 20) = 0;
  *(unsigned char *)(v6 + 16) = 0;
  *(void *)&v0[v5] = v6;

  sub_1C5F0();
  __break(1u);
}

uint64_t sub_16F54(void *a1)
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0) {
    uint64_t result = swift_task_reportUnexpectedExecutor();
  }
  CFStringRef v3 = (const __CFString *)kSSUserDefaultsKeyAutoUpdatesEnabled;
  if (!kSSUserDefaultsKeyAutoUpdatesEnabled)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (uint64_t)[a1 BOOLValue];
  CFStringRef v4 = (const __CFString *)kSSUserDefaultsIdentifier;
  if (!kSSUserDefaultsIdentifier)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!result) {
    uint64_t v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(v3, *v5, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v4);

  return swift_release();
}

void sub_17050(void *a1)
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v3 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4)
  {
    id v5 = [a1 BOOLValue];
    NSString v6 = sub_1C3A0();
    [v4 setBool:v5 forKey:v6];
    swift_release();
  }
  else
  {
    swift_release();
  }
}

void sub_171E0(char a1)
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (!kSSUserDefaultsIdentifier)
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1C3B0();
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v3 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithSuiteName:v3];

  if (!v4)
  {
LABEL_9:
    __break(1u);
    return;
  }
  NSString v5 = sub_1C3A0();
  [v4 setBool:a1 & 1 forKey:v5];
  swift_release();
}

uint64_t sub_17334(void *a1)
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v3 = [a1 BOOLValue];
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_cellularNetworkingAllowed) = v3;
  swift_release();
  sub_171E0(v3);

  return swift_release();
}

void sub_17454(void *a1)
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v3 = sub_1C3A0();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4)
  {
    [a1 BOOLValue];
    Class isa = sub_1C460().super.super.isa;
    NSString v6 = sub_1C3A0();
    [v4 setValue:isa forKey:v6];
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_175EC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_935C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_17630(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_9178(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unsigned char *sub_17694(unsigned char *a1)
{
  return sub_15240(a1);
}

uint64_t sub_176C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C4F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1C4E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_A098(a1, &qword_24DC8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C480();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1786C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_178B0()
{
  uint64_t v0 = sub_9178(&qword_24DC8);
  __chkstk_darwin(v0 - 8, v1);
  NSString v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (byte_24FC8 != 1)
  {
    uint64_t v9 = qword_24FC0;
LABEL_16:
    id v15 = [self stringFromByteCount:v9 countStyle:2];
    sub_1C3B0();
    swift_release();

    return;
  }
  id v4 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v5 = sub_1C3A0();
  id v6 = [v4 initWithSuiteName:v5];

  if (v6)
  {
    NSString v7 = sub_1C3A0();
    id v8 = [v6 objectForKey:v7];

    if (v8)
    {
      sub_1C570();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v18, 0, sizeof(v18));
    }
    sub_93A4((uint64_t)v18, (uint64_t)v19);
    if (v20)
    {
      if (swift_dynamicCast())
      {
        uint64_t v9 = v17;
        if (v17 > 0) {
          goto LABEL_15;
        }
      }
    }
    else
    {
      sub_A098((uint64_t)v19, &qword_24DA8);
    }
    uint64_t v9 = 200000000;
LABEL_15:
    qword_24FC0 = v9;
    byte_24FC8 = 0;
    uint64_t v10 = sub_1C4F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v3, 1, 1, v10);
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v12 = v6;
    swift_retain();
    uint64_t v13 = sub_1C4C0();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    v14[4] = v12;
    v14[5] = v11;
    swift_release();
    sub_176C0((uint64_t)v3, (uint64_t)&unk_25060, (uint64_t)v14);
    swift_release();

    goto LABEL_16;
  }
  __break(1u);
}

void sub_17C04()
{
  uint64_t v0 = sub_9178(&qword_24DC8);
  __chkstk_darwin(v0 - 8, v1);
  NSString v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (byte_24FC8 != 1)
  {
    uint64_t v9 = qword_24FC0;
LABEL_16:
    id v15 = [self stringFromByteCount:v9 countStyle:2];
    sub_1C3B0();

    swift_release();
    return;
  }
  id v4 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v5 = sub_1C3A0();
  id v6 = [v4 initWithSuiteName:v5];

  if (v6)
  {
    NSString v7 = sub_1C3A0();
    id v8 = [v6 objectForKey:v7];

    if (v8)
    {
      sub_1C570();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v18, 0, sizeof(v18));
    }
    sub_93A4((uint64_t)v18, (uint64_t)v19);
    if (v20)
    {
      if (swift_dynamicCast())
      {
        uint64_t v9 = v17;
        if (v17 > 0) {
          goto LABEL_15;
        }
      }
    }
    else
    {
      sub_A098((uint64_t)v19, &qword_24DA8);
    }
    uint64_t v9 = 200000000;
LABEL_15:
    qword_24FC0 = v9;
    byte_24FC8 = 0;
    uint64_t v10 = sub_1C4F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v3, 1, 1, v10);
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v12 = v6;
    swift_retain();
    uint64_t v13 = sub_1C4C0();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    v14[4] = v12;
    v14[5] = v11;
    swift_release();
    sub_176C0((uint64_t)v3, (uint64_t)&unk_25030, (uint64_t)v14);

    swift_release();
    goto LABEL_16;
  }
  __break(1u);
}

id sub_17F60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1C230();
  __chkstk_darwin(v5 - 8, v6);
  swift_bridgeObjectRelease();
  NSString v7 = &v3[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_CELLULAR_GROUP_ID];
  *(void *)NSString v7 = 0xD000000000000011;
  *((void *)v7 + 1) = 0x800000000001DF20;
  id v8 = &v3[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ALLOW_ID];
  strcpy(&v3[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ALLOW_ID], "ALWAYS_ALLOW");
  v8[13] = 0;
  *((_WORD *)v8 + 7) = -5120;
  uint64_t v9 = &v3[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ASK_IF_OVER_XXX_MB_ID];
  *(void *)uint64_t v9 = 0xD000000000000015;
  *((void *)v9 + 1) = 0x800000000001DF50;
  uint64_t v10 = &v3[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ASK_ID];
  strcpy(&v3[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ASK_ID], "ALWAYS_ASK_ID");
  *((_WORD *)v10 + 7) = -4864;
  uint64_t v11 = v3;
  sub_1C220();
  sub_1C260();

  v18.receiver = v11;
  v18.super_class = (Class)type metadata accessor for CellularLimitsController();
  id v12 = objc_msgSendSuper2(&v18, "initWithNibName:bundle:", 0, 0);
  uint64_t v13 = self;
  id v14 = v12;
  id v15 = [v13 defaultCenter];
  id v16 = v14;
  [v15 addObserver:v16 selector:"appWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

  return v16;
}

id sub_18228(void *a1)
{
  uint64_t v3 = sub_1C230();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v5 = &v1[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_CELLULAR_GROUP_ID];
  *(void *)uint64_t v5 = 0xD000000000000011;
  *((void *)v5 + 1) = 0x800000000001DF20;
  uint64_t v6 = &v1[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ALLOW_ID];
  strcpy(&v1[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ALLOW_ID], "ALWAYS_ALLOW");
  v6[13] = 0;
  *((_WORD *)v6 + 7) = -5120;
  NSString v7 = &v1[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ASK_IF_OVER_XXX_MB_ID];
  *(void *)NSString v7 = 0xD000000000000015;
  *((void *)v7 + 1) = 0x800000000001DF50;
  id v8 = &v1[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ASK_ID];
  strcpy(&v1[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ASK_ID], "ALWAYS_ASK_ID");
  *((_WORD *)v8 + 7) = -4864;
  uint64_t v9 = v1;
  sub_1C220();
  sub_1C260();

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for CellularLimitsController();
  id v10 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);

  return v10;
}

uint64_t sub_18438()
{
  uint64_t v1 = sub_1C070();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = (objc_class *)type metadata accessor for CellularLimitsController();
  v9.receiver = v0;
  v9.super_class = v5;
  objc_msgSendSuper2(&v9, "viewDidLoad");
  id v6 = [v0 navigationItem];
  [v6 setLargeTitleDisplayMode:2];

  sub_B53C((uint64_t)v4);
  sub_1C3C0();
  NSString v7 = sub_1C3A0();
  swift_bridgeObjectRelease();
  [v0 setTitle:v7];

  return swift_release();
}

uint64_t sub_18774()
{
  uint64_t v1 = sub_1C2F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C310();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9484(0, &qword_24D80);
  uint64_t v11 = (void *)sub_1C510();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v0;
  aBlock[4] = sub_1BCCC;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1786C;
  aBlock[3] = &unk_20E88;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v0;
  sub_1C300();
  v16[1] = _swiftEmptyArrayStorage;
  sub_92A8();
  sub_9178(&qword_24D90);
  sub_9300();
  sub_1C580();
  sub_1C520();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return swift_release();
}

uint64_t sub_189FC()
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_18AE4();

  return swift_release();
}

uint64_t sub_18AE4()
{
  uint64_t v1 = v0;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (sub_18BD8())
  {
    v2.super.Class isa = sub_1C410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  [v1 setSpecifiers:v2.super.isa];

  [v1 reload];

  return swift_release();
}

uint64_t sub_18BD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C270();
  uint64_t v86 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v3);
  uint64_t v85 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_1C280();
  uint64_t v82 = *(void *)(v84 - 8);
  __chkstk_darwin(v84, v5);
  uint64_t v81 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C070();
  __chkstk_darwin(v7 - 8, v8);
  id v10 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C4D0();
  uint64_t v12 = sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = self;
  NSString v14 = sub_1C3A0();
  id v15 = [v13 groupSpecifierWithID:v14];

  if (!v15)
  {
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  sub_9484(0, &qword_24F10);
  Class isa = sub_1C530(1).super.super.isa;
  [v15 setProperty:isa forKey:PSIsRadioGroupKey];

  uint64_t v17 = sub_9484(0, &qword_24DB0);
  *((void *)&v88 + 1) = v17;
  *(void *)&long long v87 = v15;
  id v18 = v15;
  id v19 = sub_1B510(0, 1, 1, (char *)_swiftEmptyArrayStorage);
  unint64_t v21 = *((void *)v19 + 2);
  unint64_t v20 = *((void *)v19 + 3);
  if (v21 >= v20 >> 1) {
    id v19 = sub_1B510((char *)(v20 > 1), v21 + 1, 1, v19);
  }
  uint64_t v83 = v11;
  uint64_t v78 = v2;
  id v79 = v18;
  uint64_t v80 = v12;
  *((void *)v19 + 2) = v21 + 1;
  sub_9474(&v87, &v19[32 * v21 + 32]);
  sub_B5E4((uint64_t)v10);
  sub_1C3C0();
  long long v87 = 0u;
  long long v88 = 0u;
  NSString v22 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v23 = *((void *)&v88 + 1);
  if (*((void *)&v88 + 1))
  {
    id v24 = sub_9D54(&v87, *((uint64_t *)&v88 + 1));
    uint64_t v25 = *(void *)(v23 - 8);
    __chkstk_darwin(v24, v24);
    NSString v27 = (char *)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v25 + 16))(v27);
    uint64_t v28 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v23);
    sub_9D98((uint64_t)&v87);
  }
  else
  {
    uint64_t v28 = 0;
  }
  id v29 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v22 target:v28 set:0 get:0 detail:0 cell:3 edit:0];
  swift_unknownObjectRelease();

  if (!v29) {
    goto LABEL_34;
  }
  NSString v30 = sub_1C3A0();
  [v29 setIdentifier:v30];

  *((void *)&v88 + 1) = v17;
  *(void *)&long long v87 = v29;
  unint64_t v31 = *((void *)v19 + 2);
  unint64_t v32 = *((void *)v19 + 3);
  id v33 = v29;
  if (v31 >= v32 >> 1) {
    id v19 = sub_1B510((char *)(v32 > 1), v31 + 1, 1, v19);
  }
  id v77 = v33;
  *((void *)v19 + 2) = v31 + 1;
  sub_9474(&v87, &v19[32 * v31 + 32]);
  sub_17C04();
  sub_B620(v34, v35, (uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_1C3C0();
  long long v87 = 0u;
  long long v88 = 0u;
  NSString v36 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v37 = *((void *)&v88 + 1);
  if (*((void *)&v88 + 1))
  {
    BOOL v38 = sub_9D54(&v87, *((uint64_t *)&v88 + 1));
    uint64_t v39 = *(void *)(v37 - 8);
    __chkstk_darwin(v38, v38);
    id v41 = (char *)&v75 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v39 + 16))(v41);
    uint64_t v42 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v37);
    sub_9D98((uint64_t)&v87);
  }
  else
  {
    uint64_t v42 = 0;
  }
  id v43 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v36 target:v42 set:0 get:0 detail:0 cell:3 edit:0];
  swift_unknownObjectRelease();

  if (!v43) {
    goto LABEL_35;
  }
  NSString v44 = sub_1C3A0();
  [v43 setIdentifier:v44];

  *((void *)&v88 + 1) = v17;
  *(void *)&long long v87 = v43;
  unint64_t v45 = *((void *)v19 + 2);
  unint64_t v46 = *((void *)v19 + 3);
  id v47 = v43;
  if (v45 >= v46 >> 1) {
    id v19 = sub_1B510((char *)(v46 > 1), v45 + 1, 1, v19);
  }
  id v76 = v47;
  *((void *)v19 + 2) = v45 + 1;
  sub_9474(&v87, &v19[32 * v45 + 32]);
  sub_B9F0((uint64_t)v10);
  sub_1C3C0();
  long long v87 = 0u;
  long long v88 = 0u;
  NSString v48 = sub_1C3A0();
  swift_bridgeObjectRelease();
  uint64_t v49 = *((void *)&v88 + 1);
  if (*((void *)&v88 + 1))
  {
    uint64_t v50 = sub_9D54(&v87, *((uint64_t *)&v88 + 1));
    uint64_t v51 = *(void *)(v49 - 8);
    __chkstk_darwin(v50, v50);
    int64_t v53 = (char *)&v75 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v51 + 16))(v53);
    uint64_t v54 = sub_1C630();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v49);
    sub_9D98((uint64_t)&v87);
  }
  else
  {
    uint64_t v54 = 0;
  }
  id v55 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v48 target:v54 set:0 get:0 detail:0 cell:3 edit:0];
  swift_unknownObjectRelease();

  if (!v55) {
    goto LABEL_36;
  }
  NSString v56 = sub_1C3A0();
  [v55 setIdentifier:v56];

  *((void *)&v88 + 1) = v17;
  *(void *)&long long v87 = v55;
  unint64_t v57 = *((void *)v19 + 2);
  unint64_t v58 = *((void *)v19 + 3);
  id v59 = v55;
  if (v57 >= v58 >> 1) {
    id v19 = sub_1B510((char *)(v58 > 1), v57 + 1, 1, v19);
  }
  uint64_t v60 = v79;
  *((void *)v19 + 2) = v57 + 1;
  sub_9474(&v87, &v19[32 * v57 + 32]);
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v61 = v1 + OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_cellularSettings;
  swift_beginAccess();
  NSArray v62 = v81;
  uint64_t v63 = v82;
  uint64_t v64 = v61;
  uint64_t v65 = v84;
  (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v81, v64, v84);
  swift_release();
  NSString v66 = v85;
  sub_1C240();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v65);
  int v67 = (*(uint64_t (**)(char *, uint64_t))(v86 + 88))(v66, v78);
  if (v67 == enum case for CellularSettings.Prompt.always(_:))
  {
    [v60 setProperty:v59 forKey:PSRadioGroupCheckedSpecifierKey];
    sub_BD20((uint64_t)v10);
    sub_1C3C0();
    NSString v68 = sub_1C3A0();
    swift_bridgeObjectRelease();
    id v69 = PSFooterTextGroupKey;
    [v60 setProperty:v68 forKey:v69];
    unint64_t v71 = v76;
    NSString v70 = v77;
LABEL_32:

    swift_release();
    return (uint64_t)v19;
  }
  if (v67 == enum case for CellularSettings.Prompt.overLimit(_:))
  {
    unint64_t v71 = v76;
    [v60 setProperty:v76 forKey:PSRadioGroupCheckedSpecifierKey];
    sub_17C04();
    sub_B648(v72, v73, (uint64_t)v10);
    swift_bridgeObjectRelease();
    sub_1C3C0();
    NSString v68 = sub_1C3A0();
    swift_bridgeObjectRelease();
    id v69 = PSFooterTextGroupKey;
    [v60 setProperty:v68 forKey:v69];
    NSString v70 = v77;
    goto LABEL_32;
  }
  if (v67 == enum case for CellularSettings.Prompt.never(_:))
  {
    NSString v70 = v77;
    [v60 setProperty:v77 forKey:PSRadioGroupCheckedSpecifierKey];
    sub_B604((uint64_t)v10);
    sub_1C3C0();
    NSString v68 = sub_1C3A0();
    swift_bridgeObjectRelease();
    id v69 = PSFooterTextGroupKey;
    [v60 setProperty:v68 forKey:v69];
    unint64_t v71 = v76;
    goto LABEL_32;
  }
LABEL_37:
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_1C5F0();
  __break(1u);
  return result;
}

uint64_t sub_19810(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C070();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C270();
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  uint64_t v10 = __chkstk_darwin(v8, v9);
  uint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  NSString v56 = (char *)&v55 - v15;
  __chkstk_darwin(v14, v16);
  id v18 = (char *)&v55 - v17;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  Class isa = sub_1C120().super.isa;
  unint64_t v20 = (objc_class *)type metadata accessor for CellularLimitsController();
  v60.receiver = v2;
  v60.super_class = v20;
  objc_msgSendSuper2(&v60, "tableView:didSelectRowAtIndexPath:", a1, isa);

  Class v21 = sub_1C120().super.isa;
  id v22 = [v2 indexForIndexPath:v21];

  id v23 = [v2 specifierAtIndex:v22];
  NSString v24 = sub_1C3A0();
  id v25 = [v2 specifierForID:v24];

  if (v25) {
    [v25 setProperty:v23 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  if (!v23) {
    goto LABEL_34;
  }
  unint64_t v57 = v7;
  uint64_t v26 = &ApprovedDevelopersController;
  id v27 = [v23 identifier];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = sub_1C3B0();
    uint64_t v31 = v30;

    if (v29 == *(void *)&v2[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ALLOW_ID]
      && v31 == *(void *)&v2[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ALLOW_ID + 8])
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    char v32 = sub_1C640();
    swift_bridgeObjectRelease();
    uint64_t v26 = &ApprovedDevelopersController;
    if (v32)
    {
LABEL_11:
      (*(void (**)(char *, void, uint64_t))(v58 + 104))(v18, enum case for CellularSettings.Prompt.never(_:), v59);
      sub_1C4C0();
      sub_1C480();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_beginAccess();
      sub_1C250();
      swift_endAccess();
      swift_release();
      uint64_t v33 = (uint64_t)v57;
      if (v25)
      {
        id v34 = v25;
        sub_B604(v33);
LABEL_33:
        sub_1C3C0();
        NSString v53 = sub_1C3A0();
        swift_bridgeObjectRelease();
        [v25 setProperty:v53 forKey:PSFooterTextGroupKey];

        goto LABEL_34;
      }
      goto LABEL_34;
    }
  }
  id v35 = objc_msgSend(v23, (SEL)v26[13].ivar_lyt);
  uint64_t v36 = (uint64_t)v57;
  if (v35)
  {
    uint64_t v37 = v35;
    id v55 = v12;
    BOOL v38 = v26;
    uint64_t v39 = sub_1C3B0();
    uint64_t v41 = v40;

    if (v39 == *(void *)&v2[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ASK_IF_OVER_XXX_MB_ID]
      && v41 == *(void *)&v2[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ASK_IF_OVER_XXX_MB_ID
                             + 8])
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v42 = sub_1C640();
    swift_bridgeObjectRelease();
    uint64_t v26 = v38;
    uint64_t v12 = v55;
    if (v42)
    {
LABEL_20:
      (*(void (**)(char *, void, uint64_t))(v58 + 104))(v56, enum case for CellularSettings.Prompt.overLimit(_:), v59);
      sub_1C4C0();
      sub_1C480();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_beginAccess();
      sub_1C250();
      swift_endAccess();
      swift_release();
      if (v25)
      {
        id v43 = v25;
        sub_17C04();
        sub_B648(v44, v45, v36);
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      goto LABEL_34;
    }
  }
  id v46 = objc_msgSend(v23, (SEL)v26[13].ivar_lyt);
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = sub_1C3B0();
    uint64_t v50 = v49;

    if (v48 == *(void *)&v2[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ASK_ID]
      && v50 == *(void *)&v2[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_ALWAYS_ASK_ID + 8])
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v51 = sub_1C640();
      swift_bridgeObjectRelease();
      if ((v51 & 1) == 0) {
        goto LABEL_34;
      }
    }
    (*(void (**)(char *, void, uint64_t))(v58 + 104))(v12, enum case for CellularSettings.Prompt.always(_:), v59);
    sub_1C4C0();
    sub_1C480();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_beginAccess();
    sub_1C250();
    swift_endAccess();
    swift_release();
    if (v25)
    {
      id v52 = v25;
      sub_BD20(v36);
      goto LABEL_33;
    }
  }
LABEL_34:
  sub_18AE4();

  return swift_release();
}

id sub_1A054()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CellularLimitsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1A14C()
{
  return type metadata accessor for CellularLimitsController();
}

uint64_t type metadata accessor for CellularLimitsController()
{
  uint64_t result = qword_25018;
  if (!qword_25018) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A1A0()
{
  uint64_t result = sub_1C280();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1A240()
{
  NSString v0 = sub_1C3A0();
  NSString v1 = sub_1C3A0();
  id v2 = [self bagForProfile:v0 profileVersion:v1];

  qword_24FB8 = (uint64_t)v2;
}

uint64_t sub_1A2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[23] = a4;
  v5[24] = a5;
  uint64_t v6 = sub_9178(&qword_25048);
  v5[25] = v6;
  v5[26] = *(void *)(v6 - 8);
  v5[27] = swift_task_alloc();
  v5[28] = sub_1C4D0();
  v5[29] = sub_1C4C0();
  uint64_t v8 = sub_1C480();
  v5[30] = v8;
  v5[31] = v7;
  return _swift_task_switch(sub_1A3CC, v8, v7);
}

uint64_t sub_1A3CC()
{
  NSString v1 = self;
  NSString v2 = sub_1C3A0();
  if (qword_24D30 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v5 = v0[25];
  id v6 = [v1 networkConstraintsForMediaType:v2 withBag:qword_24FB8];
  v0[32] = v6;

  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_1A5F8;
  swift_continuation_init();
  v0[17] = v5;
  uint64_t v7 = sub_15304(v0 + 14);
  sub_9484(0, &qword_25050);
  sub_9178(&qword_24EF0);
  sub_1C490();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 32))(v7, v3, v5);
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 1107296256;
  v0[12] = sub_1B298;
  v0[13] = &unk_20F00;
  [v6 resultWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1A5F8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 264) = v2;
  uint64_t v3 = *(void *)(v1 + 248);
  uint64_t v4 = *(void *)(v1 + 240);
  if (v2) {
    uint64_t v5 = sub_1A974;
  }
  else {
    uint64_t v5 = sub_1A728;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1A728()
{
  uint64_t v1 = (void *)v0[32];
  swift_release();
  uint64_t v2 = (void *)v0[21];

  if (!v2)
  {
    if ((byte_24FC8 & 1) == 0)
    {
      uint64_t v5 = (void *)v0[23];
      NSString v6 = sub_1C3A0();
      [v5 setObject:0 forKey:v6];
    }
    goto LABEL_11;
  }
  id v3 = [v2 sizeLimitForNetworkType:AMSNetworkTypeCellular];
  uint64_t v4 = (uint64_t)v3;
  if ((byte_24FC8 & 1) == 0 && v3 == (id)qword_24FC0)
  {
    if ((uint64_t)v3 >= 1) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = (void *)v0[23];
  swift_release();
  v0[22] = v4;
  uint64_t v8 = sub_1C630();
  NSString v9 = sub_1C3A0();
  [v7 setObject:v8 forKey:v9];

  swift_unknownObjectRelease();
  if (v4 <= 0) {
LABEL_11:
  }
    uint64_t v4 = 200000000;
LABEL_12:
  if ((byte_24FC8 & 1) != 0 || v4 != qword_24FC0)
  {
    qword_24FC0 = v4;
    byte_24FC8 = 0;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v11 = (void *)Strong;
      sub_D3B8();
    }
  }

  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_1A974()
{
  uint64_t v1 = (void *)v0[32];
  swift_release();
  swift_willThrow();
  swift_errorRelease();

  if ((byte_24FC8 & 1) != 0
    || (uint64_t v4 = (void *)v0[23],
        NSString v5 = sub_1C3A0(),
        [v4 setObject:0 forKey:v5],
        v5,
        (byte_24FC8 & 1) != 0)
    || qword_24FC0 != 200000000)
  {
    qword_24FC0 = 200000000;
    byte_24FC8 = 0;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v3 = (void *)Strong;
      sub_D3B8();
    }
  }
  swift_task_dealloc();
  NSString v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1AAB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[23] = a4;
  v5[24] = a5;
  uint64_t v6 = sub_9178(&qword_25048);
  v5[25] = v6;
  v5[26] = *(void *)(v6 - 8);
  v5[27] = swift_task_alloc();
  v5[28] = sub_1C4D0();
  v5[29] = sub_1C4C0();
  uint64_t v8 = sub_1C480();
  v5[30] = v8;
  v5[31] = v7;
  return _swift_task_switch(sub_1ABB0, v8, v7);
}

uint64_t sub_1ABB0()
{
  uint64_t v1 = self;
  NSString v2 = sub_1C3A0();
  if (qword_24D30 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v5 = v0[25];
  id v6 = [v1 networkConstraintsForMediaType:v2 withBag:qword_24FB8];
  v0[32] = v6;

  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_1ADDC;
  swift_continuation_init();
  v0[17] = v5;
  uint64_t v7 = sub_15304(v0 + 14);
  sub_9484(0, &qword_25050);
  sub_9178(&qword_24EF0);
  sub_1C490();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 32))(v7, v3, v5);
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 1107296256;
  v0[12] = sub_1B298;
  v0[13] = &unk_20E38;
  [v6 resultWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1ADDC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 264) = v2;
  uint64_t v3 = *(void *)(v1 + 248);
  uint64_t v4 = *(void *)(v1 + 240);
  if (v2) {
    uint64_t v5 = sub_1B158;
  }
  else {
    uint64_t v5 = sub_1AF0C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1AF0C()
{
  uint64_t v1 = (void *)v0[32];
  swift_release();
  uint64_t v2 = (void *)v0[21];

  if (!v2)
  {
    if ((byte_24FC8 & 1) == 0)
    {
      uint64_t v5 = (void *)v0[23];
      NSString v6 = sub_1C3A0();
      [v5 setObject:0 forKey:v6];
    }
    goto LABEL_11;
  }
  id v3 = [v2 sizeLimitForNetworkType:AMSNetworkTypeCellular];
  uint64_t v4 = (uint64_t)v3;
  if ((byte_24FC8 & 1) == 0 && v3 == (id)qword_24FC0)
  {
    if ((uint64_t)v3 >= 1) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = (void *)v0[23];
  swift_release();
  v0[22] = v4;
  uint64_t v8 = sub_1C630();
  NSString v9 = sub_1C3A0();
  [v7 setObject:v8 forKey:v9];
  swift_unknownObjectRelease();

  if (v4 <= 0) {
LABEL_11:
  }
    uint64_t v4 = 200000000;
LABEL_12:
  if ((byte_24FC8 & 1) != 0 || v4 != qword_24FC0)
  {
    qword_24FC0 = v4;
    byte_24FC8 = 0;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v11 = (void *)Strong;
      sub_18AE4();
    }
  }

  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_1B158()
{
  uint64_t v1 = (void *)v0[32];
  swift_release();
  swift_willThrow();
  swift_errorRelease();

  if ((byte_24FC8 & 1) != 0
    || (uint64_t v4 = (void *)v0[23],
        NSString v5 = sub_1C3A0(),
        [v4 setObject:0 forKey:v5],
        v5,
        (byte_24FC8 & 1) != 0)
    || qword_24FC0 != 200000000)
  {
    qword_24FC0 = 200000000;
    byte_24FC8 = 0;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v3 = (void *)Strong;
      sub_18AE4();
    }
  }
  swift_task_dealloc();
  NSString v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_1B298(uint64_t a1, void *a2, void *a3)
{
  sub_9D54((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    sub_9178(&qword_25048);
    sub_1C4A0();
  }
  else if (a2)
  {
    id v6 = a2;
    sub_9178(&qword_25048);
    sub_1C4B0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1B33C(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1B418;
  return v6(a1);
}

uint64_t sub_1B418()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_1B510(char *result, int64_t a2, char a3, char *a4)
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
      sub_9178(&qword_24F40);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1BB9C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B620()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1B65C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_9C14;
  return sub_1AAB4(a1, v4, v5, v7, v6);
}

uint64_t sub_1B71C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1B754(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_9C14;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_25038 + dword_25038);
  return v6(a1, v4);
}

uint64_t sub_1B80C(uint64_t a1, uint64_t a2)
{
  return sub_15378(a2 + 32, a1 + 32);
}

uint64_t sub_1B81C(uint64_t a1)
{
  return sub_9D98(a1 + 32);
}

char *sub_1B824(char *result, int64_t a2, char a3, char *a4)
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
      sub_9178(&qword_24FA0);
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
    sub_1BF50(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B934(char a1, int64_t a2, char a3, unint64_t a4)
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
        goto LABEL_29;
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_9178(&qword_25068);
  uint64_t v10 = *(void *)(sub_1C210() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1C5E0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1C210() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1BDF8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1BB9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

uint64_t sub_1BC94()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1BCCC()
{
  return sub_189FC();
}

uint64_t sub_1BCD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1BCE4()
{
  return swift_release();
}

uint64_t sub_1BCF0()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1BD38(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_A17C;
  return sub_1A2D0(a1, v4, v5, v7, v6);
}

uint64_t sub_1BDF8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1C210() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

uint64_t sub_1BF50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1C620();
  __break(1u);
  return result;
}

uint64_t sub_1C050()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1C060()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1C070()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1C080()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1C090()
{
  return type metadata accessor for URL.DirectoryHint();
}

void sub_1C0A0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1C0B0()
{
  return URL.init(string:)();
}

uint64_t sub_1C0C0()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_1C0D0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1C0E0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1C0F0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1C100()
{
  return static Locale.current.getter();
}

uint64_t sub_1C110()
{
  return type metadata accessor for Locale();
}

NSIndexPath sub_1C120()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_1C130()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1C140()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_1C160()
{
  return static AppLibrary.synchronousAssociatedApps(developerID:)();
}

uint64_t sub_1C170()
{
  return type metadata accessor for AppLibrary();
}

uint64_t sub_1C180()
{
  return type metadata accessor for FeatureFlag();
}

uint64_t sub_1C190()
{
  return static AppDistributor.AppDistributorsOrTrustedDevelopersChangedNotification.getter();
}

uint64_t sub_1C1A0()
{
  return static AppDistributor.allApprovedDevelopers()();
}

uint64_t sub_1C1B0()
{
  return static AppDistributor.revokeDeveloperApproval(_:removeInstalledApps:)();
}

uint64_t sub_1C1C0()
{
  return static AppDistributor.synchronousAllApprovedDevelopers.getter();
}

uint64_t sub_1C1D0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1C1E0()
{
  return ApprovedDeveloper.identifier.getter();
}

uint64_t sub_1C1F0()
{
  return ApprovedDeveloper.supportURL.getter();
}

uint64_t sub_1C200()
{
  return ApprovedDeveloper.name.getter();
}

uint64_t sub_1C210()
{
  return type metadata accessor for ApprovedDeveloper();
}

uint64_t sub_1C220()
{
  return static CellularIdentity.current()();
}

uint64_t sub_1C230()
{
  return type metadata accessor for CellularIdentity();
}

uint64_t sub_1C240()
{
  return CellularSettings.cellularData.getter();
}

uint64_t sub_1C250()
{
  return CellularSettings.cellularData.setter();
}

uint64_t sub_1C260()
{
  return CellularSettings.init(for:)();
}

uint64_t sub_1C270()
{
  return type metadata accessor for CellularSettings.Prompt();
}

uint64_t sub_1C280()
{
  return type metadata accessor for CellularSettings();
}

uint64_t sub_1C290()
{
  return ApplicationSettingsView.init(applicationBundleIdentifier:)();
}

uint64_t sub_1C2A0()
{
  return type metadata accessor for ApplicationSettingsView();
}

uint64_t sub_1C2B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1C2C0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1C2D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1C2E0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1C2F0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1C300()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1C310()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_1C320()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1C330()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_1C340(Swift::String a1)
{
}

void sub_1C350(Swift::String a1)
{
}

uint64_t sub_1C360()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1C370()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_1C380()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_1C390()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1C3A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1C3B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1C3C0()
{
  return String.init(localized:)();
}

uint64_t sub_1C3D0()
{
  return String.hash(into:)();
}

void sub_1C3E0(Swift::String a1)
{
}

Swift::Int sub_1C3F0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1C400()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1C410()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1C420()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1C430()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1C440()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1C450()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_1C460()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_1C470()
{
  return static Bool._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1C480()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1C490()
{
  return CheckedContinuation.init(continuation:function:)();
}

uint64_t sub_1C4A0()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_1C4B0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1C4C0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1C4D0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1C4E0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1C4F0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1C500()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1C510()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1C520()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

NSNumber sub_1C530(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_1C540()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1C550()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1C560()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1C570()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1C580()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_1C590(Swift::Int a1)
{
}

uint64_t sub_1C5A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1C5B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1C5C0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1C5D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1C5E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1C5F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1C600()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1C610()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1C620()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1C630()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1C640()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1C650()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_1C660()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1C670()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1C680()
{
  return Hasher._finalize()();
}

NSNumber sub_1C690()
{
  return UInt32._bridgeToObjectiveC()();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_wifiCapability()
{
  return _MobileGestalt_get_wifiCapability();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
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