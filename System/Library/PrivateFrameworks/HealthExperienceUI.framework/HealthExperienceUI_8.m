uint64_t sub_1AD702750()
{
  uint64_t v0;
  uint64_t vars8;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_1AD702788(uint64_t a1, uint64_t a2)
{
  return sub_1AD7023F4(a1, a2, v2[2], v2[3], (uint64_t)(v2 + 4), v2[9]);
}

void FavoritableFeedItemDataSource.init(dataSource:transformation:)()
{
}

uint64_t FavoritableFeedItemDataSource.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_snapshot;
  sub_1AD20E2C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD2C92FC(*(void *)(v0 + qword_1EB7388A8), *(void *)(v0 + qword_1EB7388A8 + 8), *(unsigned char *)(v0 + qword_1EB7388A8 + 16));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FavoritableFeedItemDataSource()
{
  uint64_t result = qword_1EB73FD38;
  if (!qword_1EB73FD38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for FavoritableFeedItemDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FavoritableFeedItemDataSource);
}

uint64_t dispatch thunk of FavoritableFeedItemDataSource.__allocating_init(managedObjectContext:pinnedContentManager:predicate:cellClass:)()
{
  return (*(uint64_t (**)(void))(v0 + 608))();
}

uint64_t sub_1AD702954()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD7029A4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  v3 = (void *)(*a2 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext);
  swift_beginAccess();
  void *v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1AD702A10()
{
  return swift_retain();
}

uint64_t sub_1AD702A5C(uint64_t a1)
{
  v3 = (void *)(v1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1AD702AB0())()
{
  return j__swift_endAccess;
}

uint64_t sub_1AD702B0C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_parentViewController;
  swift_beginAccess();
  return MEMORY[0x1B3E68580](v1);
}

void sub_1AD702B58(void *a1)
{
}

void (*sub_1AD702BB0(void *a1))(id **, char)
{
  v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_parentViewController;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1B3E68580](v5);
  return sub_1AD351928;
}

uint64_t (*sub_1AD702C34())()
{
  return j_j__swift_endAccess;
}

id sub_1AD702CC8()
{
  sub_1AD705BF0(0, &qword_1E9A31268, (void (*)(uint64_t))type metadata accessor for SidebarConfigurationModel);
  MEMORY[0x1F4188790](v1 - 8);
  v3 = (char *)&v11 - v2;
  uint64_t v4 = (uint64_t)v0 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_currentViewModel;
  swift_beginAccess();
  sub_1AD207D20(v4, (uint64_t)v12, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
  if (v13)
  {
    sub_1AD2196B8(0, (unint64_t *)&qword_1EB739AC8);
    uint64_t v5 = type metadata accessor for SidebarConfigurationModel();
    int v6 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, v6 ^ 1u, 1, v5);
  }
  else
  {
    sub_1AD206D18((uint64_t)v12, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
    uint64_t v5 = type metadata accessor for SidebarConfigurationModel();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  }
  type metadata accessor for SidebarConfigurationModel();
  uint64_t v7 = 1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5);
  sub_1AD702ED8((uint64_t)v3);
  if (v8)
  {
    v9 = (objc_class *)type metadata accessor for ListContentConfigurationHostCell();
    v11.receiver = v0;
    v11.super_class = v9;
    return objc_msgSendSuper2(&v11, sel_tintAdjustmentMode);
  }
  return (id)v7;
}

uint64_t sub_1AD702ED8(uint64_t a1)
{
  sub_1AD705BF0(0, &qword_1E9A31268, (void (*)(uint64_t))type metadata accessor for SidebarConfigurationModel);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1AD702FA4(uint64_t a1)
{
  sub_1AD705BF0(0, &qword_1E9A31268, (void (*)(uint64_t))type metadata accessor for SidebarConfigurationModel);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v12 - v4;
  uint64_t v6 = (uint64_t)v1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_currentViewModel;
  swift_beginAccess();
  sub_1AD207D20(v6, (uint64_t)v13, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
  if (v14)
  {
    sub_1AD2196B8(0, (unint64_t *)&qword_1EB739AC8);
    uint64_t v7 = type metadata accessor for SidebarConfigurationModel();
    int v8 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, v8 ^ 1u, 1, v7);
  }
  else
  {
    sub_1AD206D18((uint64_t)v13, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
    uint64_t v7 = type metadata accessor for SidebarConfigurationModel();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  }
  type metadata accessor for SidebarConfigurationModel();
  int v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7);
  id result = (id)sub_1AD702ED8((uint64_t)v5);
  if (v9)
  {
    objc_super v11 = (objc_class *)type metadata accessor for ListContentConfigurationHostCell();
    v12.receiver = v1;
    v12.super_class = v11;
    return objc_msgSendSuper2(&v12, sel_setTintAdjustmentMode_, a1);
  }
  return result;
}

uint64_t sub_1AD7031B8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AD703210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = &v3[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)v6;
  uint64_t v7 = *((void *)v6 + 1);
  if (v7)
  {
    swift_bridgeObjectRetain();
    int v9 = (void *)sub_1AD73F180();
  }
  else
  {
    int v9 = 0;
  }
  objc_msgSend(v3, sel_setAccessibilityIdentifier_, v9);

  v10 = &v3[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext];
  swift_beginAccess();
  if (*(void *)v10)
  {
    objc_super v11 = (void *)(*(void *)v10 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
    swift_beginAccess();
    *objc_super v11 = v8;
    v11[1] = v7;
  }
  return swift_bridgeObjectRelease();
}

void (*sub_1AD703314(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier;
  v3[6] = v1;
  v3[7] = v4;
  swift_beginAccess();
  return sub_1AD703380;
}

void sub_1AD703380(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (char *)v3[6];
    uint64_t v5 = &v4[v3[7]];
    uint64_t v7 = *(void *)v5;
    uint64_t v6 = *((void *)v5 + 1);
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = (void *)sub_1AD73F180();
      uint64_t v4 = (char *)v3[6];
    }
    else
    {
      uint64_t v8 = 0;
    }
    objc_msgSend(v4, sel_setAccessibilityIdentifier_, v8);

    int v9 = &v4[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext];
    swift_beginAccess();
    if (*(void *)v9)
    {
      v10 = (void *)(*(void *)v9 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
      swift_beginAccess();
      void *v10 = v7;
      v10[1] = v6;
    }
    swift_bridgeObjectRelease();
  }
  free(v3);
}

uint64_t sub_1AD703480(uint64_t a1, void *a2)
{
  sub_1AD207D20(a1, (uint64_t)v5, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item;
  swift_beginAccess();
  sub_1AD205C2C((uint64_t)v5, v3);
  swift_endAccess();
  sub_1AD70399C();
  return sub_1AD206D18((uint64_t)v5, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

uint64_t sub_1AD703534@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item;
  swift_beginAccess();
  return sub_1AD207D20(v3, a1, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

uint64_t sub_1AD7035A0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item;
  swift_beginAccess();
  sub_1AD205C2C(a1, v3);
  swift_endAccess();
  sub_1AD70399C();
  return sub_1AD206D18(a1, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

void (*sub_1AD703628(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1AD703688;
}

void sub_1AD703688(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1AD70399C();
  }
}

id ListContentConfigurationHostCell.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ListContentConfigurationHostCell.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext] = 0;
  swift_unknownObjectWeakInit();
  id v3 = &v1[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_currentViewModel];
  *(_OWORD *)id v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_configurationProvider];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item];
  uint64_t v7 = (objc_class *)type metadata accessor for ListContentConfigurationHostCell();
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v12.receiver = v1;
  v12.super_class = v7;
  id v8 = objc_msgSendSuper2(&v12, sel_initWithCoder_, a1);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    objc_msgSend(v10, sel_setAutomaticallyUpdatesContentConfiguration_, 0);
  }
  return v9;
}

id ListContentConfigurationHostCell.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id ListContentConfigurationHostCell.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext] = 0;
  swift_unknownObjectWeakInit();
  id v9 = &v4[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_currentViewModel];
  *(_OWORD *)id v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  id v10 = &v4[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_configurationProvider];
  *(_OWORD *)id v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((void *)v10 + 4) = 0;
  objc_super v11 = &v4[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier];
  *(void *)objc_super v11 = 0;
  *((void *)v11 + 1) = 0;
  objc_super v12 = &v4[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item];
  uint64_t v13 = (objc_class *)type metadata accessor for ListContentConfigurationHostCell();
  *(_OWORD *)objc_super v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;
  v16.receiver = v4;
  v16.super_class = v13;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v14, sel_setAutomaticallyUpdatesContentConfiguration_, 0);
  return v14;
}

void sub_1AD70399C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1AD73CBA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = &v47[-v5];
  uint64_t v7 = (uint64_t)v0 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item;
  swift_beginAccess();
  sub_1AD207D20(v7, (uint64_t)&v58, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  if (!*((void *)&v59 + 1))
  {
    sub_1AD206D18((uint64_t)&v58, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
    goto LABEL_8;
  }
  sub_1AD2196B8(0, (unint64_t *)&qword_1EB73E870);
  sub_1AD73B520();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_8;
  }
  id v8 = v57[0];
  id v9 = objc_msgSend(v57[0], sel_userData);
  if (!v9)
  {

LABEL_8:
    sub_1AD73CB20();
    id v17 = v0;
    v18 = sub_1AD73CB80();
    os_log_type_t v19 = sub_1AD73F930();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v53 = v3;
      v20 = (uint8_t *)swift_slowAlloc();
      v51 = (void *)swift_slowAlloc();
      v57[0] = v51;
      *(_DWORD *)v20 = 136315138;
      sub_1AD207D20(v7, (uint64_t)&v58, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
      uint64_t v21 = *((void *)&v59 + 1);
      if (*((void *)&v59 + 1))
      {
        v22 = __swift_project_boxed_opaque_existential_1(&v58, *((uint64_t *)&v59 + 1));
        v50 = v47;
        uint64_t v23 = *(void *)(v21 - 8);
        uint64_t v52 = v2;
        uint64_t v24 = v23;
        __n128 v25 = MEMORY[0x1F4188790](v22);
        v27 = &v47[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
        (*(void (**)(unsigned char *, __n128))(v24 + 16))(v27, v25);
        sub_1AD206D18((uint64_t)&v58, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
        uint64_t v28 = sub_1AD73BBD0();
        unint64_t v30 = v29;
        (*(void (**)(unsigned char *, uint64_t))(v24 + 8))(v27, v21);
        uint64_t v2 = v52;
      }
      else
      {
        uint64_t v28 = 0x6E776F6E6B6E55;
        sub_1AD206D18((uint64_t)&v58, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
        unint64_t v30 = 0xE700000000000000;
      }
      *(void *)&long long v58 = sub_1AD1F62D4(v28, v30, (uint64_t *)v57);
      sub_1AD7403B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v18, v19, "Failed to update hosting content for feed item: %s", v20, 0xCu);
      v31 = v51;
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v31, -1, -1);
      MEMORY[0x1B3E68450](v20, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v6, v2);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
    }
    return;
  }
  id v10 = v9;
  v51 = (void *)sub_1AD73A4E0();
  v50 = (unsigned char *)v11;

  id v12 = objc_msgSend(v8, sel_baseAutomationIdentifier);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  sub_1AD703210(v14, v16);
  id v32 = objc_msgSend(v8, sel_actionHandlerClassName);
  id v33 = v32;
  if (v32) {

  }
  objc_msgSend(v1, sel_setUserInteractionEnabled_, v33 != 0);
  sub_1AD208E5C(v8, (uint64_t *)&v58);
  uint64_t v52 = v2;
  uint64_t v53 = v3;
  uint64_t v34 = (uint64_t)v1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_configurationProvider;
  swift_beginAccess();
  sub_1AD208BA0((uint64_t)&v58, v34, &qword_1EB73A4D8, &qword_1EB73A4D0);
  swift_endAccess();
  v36 = sub_1AD702C34();
  uint64_t v37 = *(void *)(v35 + 24);
  if (v37)
  {
    uint64_t v38 = *(void *)(v35 + 32);
    uint64_t v39 = v35;
    uint64_t v40 = *(void *)(v35 + 24);
    v48 = v36;
    __swift_mutable_project_boxed_opaque_existential_1(v39, v40);
    id v49 = v8;
    v41 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v38 + 64);
    uint64_t v42 = swift_unknownObjectRetain();
    v41(v42, &protocol witness table for ListContentConfigurationHostCell, v37, v38);
    id v8 = v49;
    ((void (*)(long long *, void))v48)(&v58, 0);
  }
  else
  {
    ((void (*)(long long *, void))v36)(&v58, 0);
  }
  sub_1AD207D20(v34, (uint64_t)v57, &qword_1EB73A4D8, &qword_1EB73A4D0);
  if (v57[3])
  {
    id v43 = v8;
    sub_1AD1FFE38((uint64_t)v57, (uint64_t)v54);
    sub_1AD206D18((uint64_t)v57, &qword_1EB73A4D8, &qword_1EB73A4D0);
    uint64_t v44 = v55;
    uint64_t v45 = v56;
    __swift_project_boxed_opaque_existential_1(v54, v55);
    (*(void (**)(long long *__return_ptr, void *, unsigned char *, uint64_t, uint64_t))(v45 + 24))(&v58, v51, v50, v44, v45);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    id v8 = v43;
  }
  else
  {
    sub_1AD206D18((uint64_t)v57, &qword_1EB73A4D8, &qword_1EB73A4D0);
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v60 = 0;
  }
  uint64_t v46 = (uint64_t)v1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_currentViewModel;
  swift_beginAccess();
  sub_1AD208BA0((uint64_t)&v58, v46, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
  swift_endAccess();
  objc_msgSend(v1, sel_setNeedsUpdateConfiguration);
  sub_1AD208DFC((uint64_t)v51, (unint64_t)v50);
}

uint64_t sub_1AD7044FC(uint64_t a1)
{
  void (*v78)(void *__return_ptr, uint64_t, uint64_t, long long *, unsigned char *, uint64_t, uint64_t, long long *, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint8_t *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  long long v104;
  uint64_t v105;
  uint64_t v106;
  unsigned char v107[32];
  uint64_t v108;
  void v109[17];
  long long v110[2];
  void v111[3];
  uint64_t v112;
  uint64_t v113;
  unsigned char v114[40];
  uint64_t v115[5];
  CGRect v116;

  uint64_t v2 = v1;
  sub_1AD1DD92C(0, (unint64_t *)&unk_1EB734A80);
  v97 = *(void *)(v4 - 8);
  v98 = v4;
  MEMORY[0x1F4188790](v4);
  v96 = (char *)&v90 - v5;
  sub_1AD705BF0(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
  MEMORY[0x1F4188790](v6 - 8);
  v95 = (char *)&v90 - v7;
  uint64_t v8 = sub_1AD73CBA0();
  v100 = *(void *)(v8 - 8);
  v101 = v8;
  MEMORY[0x1F4188790](v8);
  v99 = (char *)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  v102 = (char *)&v90 - v11;
  uint64_t v12 = sub_1AD73CDB0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  v18 = (char *)&v90 - v17;
  __n128 v20 = MEMORY[0x1F4188790](v19);
  v22 = (char *)&v90 - v21;
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v13 + 16);
  v23((char *)&v90 - v21, a1, v12, v20);
  objc_msgSend(v2, sel_bounds);
  CGFloat Width = CGRectGetWidth(v116);
  type metadata accessor for ObservableCellState(0);
  uint64_t v25 = swift_allocObject();
  ((void (*)(char *, char *, uint64_t))v23)(v18, v22, v12);
  swift_beginAccess();
  ((void (*)(char *, char *, uint64_t))v23)(v15, v18, v12);
  sub_1AD73DBC0();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  v26(v18, v12);
  swift_endAccess();
  swift_beginAccess();
  *(CGFloat *)v115 = Width;
  sub_1AD73DBC0();
  swift_endAccess();
  v26(v22, v12);
  v27 = v103;
  uint64_t v28 = (uint64_t *)&v103[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext];
  swift_beginAccess();
  if (!*v28)
  {
    unint64_t v29 = v102;
    sub_1AD73CAD0();
    unint64_t v30 = v27;
    v31 = sub_1AD73CB80();
    int v32 = sub_1AD73F920();
    if (os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      v92 = swift_slowAlloc();
      v115[0] = v92;
      *(_DWORD *)id v33 = 136446210;
      uint64_t v34 = (uint64_t)&v30[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item];
      swift_beginAccess();
      sub_1AD207D20(v34, (uint64_t)&v104, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
      uint64_t v35 = v105;
      v94 = v33;
      v93 = v32;
      if (v105)
      {
        v36 = __swift_project_boxed_opaque_existential_1(&v104, v105);
        v90 = (uint64_t)&v90;
        uint64_t v37 = v25;
        uint64_t v38 = *(void *)(v35 - 8);
        __n128 v39 = MEMORY[0x1F4188790](v36);
        v41 = (char *)&v90 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, __n128))(v38 + 16))(v41, v39);
        sub_1AD206D18((uint64_t)&v104, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
        unint64_t v42 = sub_1AD73BBD0();
        unint64_t v44 = v43;
        (*(void (**)(char *, uint64_t))(v38 + 8))(v41, v35);
        uint64_t v25 = v37;
        unint64_t v29 = v102;
      }
      else
      {
        sub_1AD206D18((uint64_t)&v104, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
        unint64_t v42 = 0xD00000000000002FLL;
        unint64_t v44 = 0x80000001AD78A580;
      }
      uint64_t v45 = v94;
      *(void *)&v104 = sub_1AD1F62D4(v42, v44, v115);
      sub_1AD7403B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v31, (os_log_type_t)v93, "observableViewEnvironment was unexpectedly nil on %{public}s. Initializing with default HKHealthStore and Presentation", v45, 0xCu);
      uint64_t v46 = v92;
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v46, -1, -1);
      MEMORY[0x1B3E68450](v45, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v100 + 8))(v29, v101);
    v27 = v103;
  }
  v47 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B0B8]), sel_init);
  v48 = &v27[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_parentViewController];
  swift_beginAccess();
  uint64_t v49 = MEMORY[0x1B3E68580](v48);
  if (v49)
  {
    v50 = (void *)v49;
    UIViewController.resolvedPinnedContentManager.getter((uint64_t)&v104);

    sub_1AD20FE90(&v104, (uint64_t)v115);
  }
  else
  {
    uint64_t v51 = sub_1AD73B0F0();
    uint64_t v52 = v47;
    uint64_t v53 = sub_1AD73B0E0();
    v115[3] = v51;
    v115[4] = MEMORY[0x1E4F672C0];
    v115[0] = v53;
  }
  uint64_t v54 = *v28;
  sub_1AD1FFE38((uint64_t)v115, (uint64_t)v114);
  if (v54)
  {
    swift_retain();
  }
  else
  {
    sub_1AD1FFE38((uint64_t)v114, (uint64_t)&v104);
    LOBYTE(v109[0]) = 0;
    uint64_t v55 = MEMORY[0x1B3E68580](v48);
    if (v55)
    {
      uint64_t v56 = (void *)v55;
      v57 = v47;
      UIViewController.resolvedHealthExperienceStore.getter((uint64_t *)v110);

      sub_1AD20FE90(v110, (uint64_t)v111);
    }
    else
    {
      uint64_t v58 = sub_1AD73A930();
      long long v59 = v47;
      uint64_t v60 = sub_1AD73A920();
      v112 = v58;
      v113 = MEMORY[0x1E4F66F20];
      v111[0] = v60;
    }
    uint64_t v61 = type metadata accessor for ProvidedViewContext(0);
    v62 = (uint64_t *)&v27[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier];
    swift_beginAccess();
    uint64_t v64 = *v62;
    uint64_t v63 = v62[1];
    uint64_t v65 = v105;
    uint64_t v66 = v106;
    uint64_t v67 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v104, v105);
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_1AD2508E8(v47, v67, (char *)v109, (uint64_t)v111, v64, v63, v61, v65, v66);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v104);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v114);
  uint64_t v68 = (uint64_t)&v27[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_configurationProvider];
  swift_beginAccess();
  sub_1AD207D20(v68, (uint64_t)&v104, &qword_1EB73A4D8, &qword_1EB73A4D0);
  if (v105)
  {
    sub_1AD20FE90(&v104, (uint64_t)v111);
    uint64_t v69 = (uint64_t)&v27[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_currentViewModel];
    swift_beginAccess();
    sub_1AD207D20(v69, (uint64_t)&v104, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
    if (v105)
    {
      sub_1AD20FE90(&v104, (uint64_t)v110);
      uint64_t v70 = (uint64_t)&v27[OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item];
      swift_beginAccess();
      sub_1AD207D20(v70, (uint64_t)&v104, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
      if (v105)
      {
        sub_1AD2196B8(0, (unint64_t *)&qword_1EB73E870);
        sub_1AD73B520();
        if (swift_dynamicCast())
        {
          v102 = v47;
          v71 = (void *)v109[0];
          v91 = v25;
          uint64_t v72 = v112;
          uint64_t v73 = v113;
          __swift_project_boxed_opaque_existential_1(v111, v112);
          id v74 = objc_msgSend(v71, sel_uniqueIdentifier);
          uint64_t v75 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v77 = v76;

          v108 = 0;
          memset(v107, 0, sizeof(v107));
          sub_1AD55254C((uint64_t)&v104);
          v78 = *(void (**)(void *__return_ptr, uint64_t, uint64_t, long long *, unsigned char *, uint64_t, uint64_t, long long *, uint64_t, uint64_t))(v73 + 16);
          v89 = v73;
          v79 = v91;
          v78(v109, v75, v77, v110, v107, v54, v91, &v104, v72, v89);
          v94 = (uint8_t *)v71;
          swift_bridgeObjectRelease();
          sub_1AD1E602C((uint64_t)&v104);
          sub_1AD206D18((uint64_t)v107, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
          MEMORY[0x1B3E66120](v109);
          v82 = v112;
          v81 = v113;
          __swift_project_boxed_opaque_existential_1(v111, v112);
          (*(void (**)(uint64_t, uint64_t))(v81 + 40))(v82, v81);
          sub_1AD73FF00();
          v84 = v112;
          v83 = v113;
          __swift_project_boxed_opaque_existential_1(v111, v112);
          v85 = v95;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v79, v84, v83);
          MEMORY[0x1B3E66140](v85);
          v86 = v112;
          v87 = v113;
          __swift_project_boxed_opaque_existential_1(v111, v112);
          v88 = (*(uint64_t (**)(long long *, uint64_t, uint64_t))(v87 + 48))(v110, v86, v87);
          objc_msgSend(v103, sel_setIndentationLevel_, v88);
        }
        else
        {
        }
        swift_release();
        swift_release();
      }
      else
      {

        swift_release();
        swift_release();
        sub_1AD206D18((uint64_t)&v104, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
    }
    else
    {
      swift_release();
      swift_release();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
      sub_1AD206D18((uint64_t)&v104, (unint64_t *)&qword_1EB739AD0, (unint64_t *)&qword_1EB739AC8);
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v111);
  }
  else
  {
    swift_release();
    swift_release();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
    return sub_1AD206D18((uint64_t)&v104, &qword_1EB73A4D8, &qword_1EB73A4D0);
  }
}

id sub_1AD70570C()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_1AD73CBA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CAD0();
  uint64_t v6 = sub_1AD73CB80();
  os_log_type_t v7 = sub_1AD73F940();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v16 = v1;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v11 = sub_1AD740E30();
    uint64_t v17 = sub_1AD1F62D4(v11, v12, &v18);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD1A4000, v6, v7, "[%s]: providerInvalidatedContentConfiguration, updating configuration", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v10, -1, -1);
    uint64_t v13 = v9;
    uint64_t v1 = v16;
    MEMORY[0x1B3E68450](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return objc_msgSend(v1, sel_setNeedsUpdateConfiguration);
}

id ListContentConfigurationHostCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ListContentConfigurationHostCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AD705A0C()
{
  return swift_retain();
}

uint64_t sub_1AD705A5C(uint64_t a1)
{
  uint64_t v3 = (void *)(*v1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1AD705AB4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1AD705B14()
{
  uint64_t v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AD705B70(uint64_t a1, uint64_t a2)
{
  return sub_1AD703210(a1, a2);
}

void (*sub_1AD705B94(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1AD703314(v2);
  return sub_1AD24BDC4;
}

void sub_1AD705BF0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1AD740340();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1AD705C44@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_providedViewContext);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t sub_1AD705CA0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_parentViewController;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1B3E68580](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1AD705CF8()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1AD705D50@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_baseIdentifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AD705DA8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1AD703210(v1, v2);
}

uint64_t sub_1AD705DE8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item;
  swift_beginAccess();
  return sub_1AD207D20(v3, a2, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

uint64_t method lookup function for ListContentConfigurationHostCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ListContentConfigurationHostCell);
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.providedViewContext.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.providedViewContext.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.providedViewContext.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.parentViewController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.parentViewController.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.parentViewController.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.actionHandler.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.baseIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.baseIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.baseIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ListContentConfigurationHostCell.providerInvalidatedContentConfiguration()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

id OnboardingAddToFavoritesViewController.__allocating_init(title:detailText:icon:healthExperienceStore:pinnedContentManager:objectType:useSystemMargins:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, char a9)
{
  uint64_t v17 = objc_allocWithZone(v9);
  sub_1AD1FFE38(a6, (uint64_t)v24);
  sub_1AD1FFE38(a7, (uint64_t)v23);
  type metadata accessor for OnboardingAddToFavoritesDataSource();
  swift_allocObject();
  id v18 = a8;
  uint64_t v19 = OnboardingAddToFavoritesDataSource.init(objectType:healthExperienceStore:pinnedContentManager:)(v18, v24, (uint64_t)v23);
  swift_retain();
  id v20 = sub_1AD28174C(a1, a2, a3, a4, v19, a5, 2, 0, a9, v17);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(a7);
  __swift_destroy_boxed_opaque_existential_1(a6);
  return v20;
}

id OnboardingAddToFavoritesViewController.init(title:detailText:icon:healthExperienceStore:pinnedContentManager:objectType:useSystemMargins:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, char a9)
{
  uint64_t v10 = v9;
  sub_1AD1FFE38(a6, (uint64_t)v24);
  sub_1AD1FFE38(a7, (uint64_t)v23);
  type metadata accessor for OnboardingAddToFavoritesDataSource();
  swift_allocObject();
  id v17 = a8;
  uint64_t v18 = OnboardingAddToFavoritesDataSource.init(objectType:healthExperienceStore:pinnedContentManager:)(v17, v24, (uint64_t)v23);
  swift_retain();
  id v19 = sub_1AD28174C(a1, a2, a3, a4, v18, a5, 2, 0, a9, v10);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(a7);
  __swift_destroy_boxed_opaque_existential_1(a6);
  return v19;
}

void OnboardingAddToFavoritesViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

void OnboardingAddToFavoritesViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
}

id OnboardingAddToFavoritesViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnboardingAddToFavoritesViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OnboardingAddToFavoritesViewController()
{
  return self;
}

uint64_t method lookup function for OnboardingAddToFavoritesViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for OnboardingAddToFavoritesViewController);
}

uint64_t dispatch thunk of OnboardingAddToFavoritesViewController.__allocating_init(title:detailText:icon:healthExperienceStore:pinnedContentManager:objectType:useSystemMargins:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

BOOL static SectionedDataSourceContainerViewType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SectionedDataSourceContainerViewType.hash(into:)()
{
  return sub_1AD740D00();
}

uint64_t SectionedDataSourceContainerViewType.hashValue.getter()
{
  return sub_1AD740D40();
}

unint64_t sub_1AD7064FC()
{
  unint64_t result = qword_1E9A34328;
  if (!qword_1E9A34328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34328);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SectionedDataSourceContainerViewType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AD70661CLL);
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

uint64_t sub_1AD706644(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a1;
  uint64_t v3 = sub_1AD73A670();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unsigned int v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for SummarySharingVersionMismatchCell();
  sub_1AD707BE8();
  uint64_t v7 = sub_1AD73F220();
  uint64_t v29 = v8;
  uint64_t v31 = 0xD000000000000049;
  unint64_t v32 = 0x80000001AD799B80;
  sub_1AD73A660();
  sub_1AD73A620();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v4 + 8);
  v9(v6, v3);
  sub_1AD73F300();
  swift_bridgeObjectRelease();
  uint64_t v10 = v31;
  unint64_t v11 = v32;
  sub_1AD275004();
  uint64_t v12 = swift_allocObject();
  long long v28 = xmmword_1AD74C370;
  *(_OWORD *)(v12 + 16) = xmmword_1AD74C370;
  sub_1AD208B40(0, (unint64_t *)&qword_1EB73F8D0, MEMORY[0x1E4FBBE00]);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v28;
  *(void *)(v13 + 56) = &type metadata for SummarySharingVersionMismatchItem;
  *(void *)(v13 + 64) = sub_1AD707CC8();
  uint64_t v14 = (void *)swift_allocObject();
  *(void *)(v13 + 32) = v14;
  uint64_t v15 = v29;
  v14[2] = v7;
  v14[3] = v15;
  v14[4] = v10;
  v14[5] = v11;
  v14[6] = v30;
  v14[7] = a2;
  swift_bridgeObjectRetain();
  sub_1AD73A660();
  uint64_t v16 = sub_1AD73A620();
  uint64_t v18 = v17;
  v9(v6, v3);
  sub_1AD1FBD54(MEMORY[0x1E4FBC860]);
  uint64_t v19 = swift_bridgeObjectRetain();
  uint64_t v20 = Array<A>.identifierToIndexDict()(v19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  *(void *)(v12 + 32) = 0;
  *(void *)(v12 + 40) = 0;
  *(void *)(v12 + 48) = v13;
  *(void *)(v12 + 56) = v20;
  *(void *)(v12 + 64) = v16;
  *(void *)(v12 + 72) = v18;
  uint64_t v31 = 0x3C53447961727241;
  unint64_t v32 = 0xE800000000000000;
  sub_1AD73A660();
  sub_1AD73A620();
  v9(v6, v3);
  sub_1AD73F300();
  swift_bridgeObjectRelease();
  sub_1AD73F300();
  uint64_t v21 = v31;
  uint64_t v22 = v32;
  type metadata accessor for ArrayDataSource();
  swift_allocObject();
  uint64_t v23 = sub_1AD1B0C5C(v12, v21, v22);
  swift_bridgeObjectRelease();
  sub_1AD4E3388(0);
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v23;
  v24[3] = sub_1AD707568;
  v24[4] = 0;
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = sub_1AD70758C;
  v25[3] = 0;
  v25[4] = v24;
  sub_1AD707DD0(0, &qword_1E9A34390, (uint64_t (*)(uint64_t))sub_1AD4E3388, (uint64_t)&protocol witness table for CellRegistering<A>, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for DataSourceWithLayout);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v24;
  *(unsigned char *)(v26 + 24) = 1;
  *(void *)(v26 + 32) = sub_1AD707DA4;
  *(void *)(v26 + 40) = v25;
  swift_retain();
  return v26;
}

uint64_t sub_1AD706A4C(uint64_t a1)
{
  uint64_t v3 = v1
     + OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_item;
  swift_beginAccess();
  sub_1AD205C2C(a1, v3);
  swift_endAccess();
  sub_1AD1EF2DC(v3, (uint64_t)v11);
  if (v12)
  {
    sub_1AD2282B4();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    if (swift_dynamicCast())
    {
      uint64_t v4 = v13;
      uint64_t v5 = v14;
      uint64_t v6 = v15;
      uint64_t v7 = v16;
      uint64_t v8 = v17;
      uint64_t v9 = v18;
    }
  }
  else
  {
    sub_1AD1E1AA8((uint64_t)v11);
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v13 = v4;
  uint64_t v14 = v5;
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  uint64_t v18 = v9;
  sub_1AD547790(&v13);
  sub_1AD35FD9C(v4, v5);
  return sub_1AD1E1AA8(a1);
}

void (*sub_1AD706B7C(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_item;
  v3[17] = v1;
  v3[18] = v4;
  swift_beginAccess();
  return sub_1AD706BE8;
}

void sub_1AD706BE8(uint64_t **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    sub_1AD1EF2DC(v3[17] + v3[18], (uint64_t)(v3 + 12));
    if (v3[15])
    {
      sub_1AD2282B4();
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      if (swift_dynamicCast())
      {
        uint64_t v4 = v3[6];
        uint64_t v5 = v3[7];
        uint64_t v6 = v3[8];
        uint64_t v7 = v3[9];
        uint64_t v8 = v3[10];
        uint64_t v9 = v3[11];
      }
    }
    else
    {
      sub_1AD1E1AA8((uint64_t)(v3 + 12));
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
    uint64_t *v3 = v4;
    v3[1] = v5;
    v3[2] = v6;
    v3[3] = v7;
    v3[4] = v8;
    v3[5] = v9;
    sub_1AD547790(v3);
    sub_1AD35FD9C(v4, v5);
  }
  free(v3);
}

char *sub_1AD706D08(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = &v4[OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_item];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  uint64_t v10 = OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_messageView;
  id v11 = objc_allocWithZone((Class)type metadata accessor for MessageWithActionTileView());
  uint64_t v12 = v4;
  id v13 = objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(void *)&v4[v10] = v13;

  v24.receiver = v12;
  v24.super_class = (Class)type metadata accessor for SummarySharingVersionMismatchCell();
  uint64_t v14 = (char *)objc_msgSendSuper2(&v24, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v15 = OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_messageView;
  uint64_t v16 = *(void *)&v14[OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_messageView];
  uint64_t v17 = v14;
  objc_msgSend(v17, sel_addSubview_, v16);
  uint64_t v18 = *(void *)&v14[v15];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v17;
  uint64_t v20 = (uint64_t *)(v18 + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_didTapActionButton);
  swift_beginAccess();
  uint64_t v21 = *v20;
  uint64_t *v20 = (uint64_t)sub_1AD707CC0;
  v20[1] = v19;
  uint64_t v22 = v17;
  sub_1AD1E4514(v21);
  objc_msgSend(*(id *)&v14[v15], sel_hk_alignConstraintsWithView_, v22);

  return v22;
}

id sub_1AD706FB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SummarySharingVersionMismatchCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SummarySharingVersionMismatchCell()
{
  return self;
}

uint64_t sub_1AD707058@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1
     + OBJC_IVAR____TtC18HealthExperienceUIP33_1DFA22859B1ADF5237349B513C5FCFAB33SummarySharingVersionMismatchCell_item;
  swift_beginAccess();
  return sub_1AD1EF2DC(v3, a1);
}

void (*sub_1AD7070B0(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1AD706B7C(v2);
  return sub_1AD24BDC4;
}

unint64_t sub_1AD70710C()
{
  unint64_t result = qword_1E9A34348;
  if (!qword_1E9A34348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34348);
  }
  return result;
}

unint64_t sub_1AD707160(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1AD707190();
  unint64_t result = sub_1AD7071E4();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1AD707190()
{
  unint64_t result = qword_1E9A34350;
  if (!qword_1E9A34350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34350);
  }
  return result;
}

unint64_t sub_1AD7071E4()
{
  unint64_t result = qword_1E9A34358;
  if (!qword_1E9A34358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34358);
  }
  return result;
}

uint64_t sub_1AD707238(void *a1)
{
  sub_1AD707C24(0, &qword_1E9A34378, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = &v9[-v6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AD707B94();
  sub_1AD740D90();
  v9[15] = 0;
  sub_1AD740AC0();
  if (!v1)
  {
    v9[14] = 1;
    sub_1AD740AC0();
    v9[13] = 2;
    sub_1AD740A80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1AD7073D4()
{
  unint64_t v1 = 0xD000000000000010;
  if (*v0 != 1) {
    unint64_t v1 = 0x4E676E6972616873;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6564496573756572;
  }
}

uint64_t sub_1AD707448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1AD7076A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1AD707470(uint64_t a1)
{
  unint64_t v2 = sub_1AD707B94();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1AD7074AC(uint64_t a1)
{
  unint64_t v2 = sub_1AD707B94();
  return MEMORY[0x1F41862B0](a1, v2);
}

double sub_1AD7074E8@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1AD70782C(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_1AD70752C(void *a1)
{
  return sub_1AD707238(a1);
}

void sub_1AD707568()
{
}

void *sub_1AD70758C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for ListLayoutConfiguration();
  MEMORY[0x1F4188790](v3);
  long long v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB73FD20 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v3, (uint64_t)qword_1EB73EE48);
  sub_1AD213FFC(v6, (uint64_t)v5);
  *((void *)v5 + 7) = 0x4024000000000000;
  *((void *)v5 + 9) = 0x4024000000000000;
  long long v7 = ListLayoutConfiguration.layout(for:)(a2);
  sub_1AD225778((uint64_t)v5);
  return v7;
}

uint64_t sub_1AD707670(uint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  return sub_1AD2E5A10(*a1, a1[1], a1[2], a2, a3, a4);
}

uint64_t sub_1AD7076A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6564496573756572 && a2 == 0xEF7265696669746ELL;
  if (v2 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001AD771D10 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E676E6972616873 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1AD740BC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1AD70782C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v26 = a2;
  sub_1AD707C24(0, &qword_1E9A34360, MEMORY[0x1E4FBBDC0]);
  uint64_t v30 = v4;
  uint64_t v27 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v6 = (char *)&v24 - v5;
  uint64_t v7 = sub_1AD73A670();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for SummarySharingVersionMismatchCell();
  sub_1AD707BE8();
  sub_1AD73F220();
  uint64_t v28 = 0xD000000000000049;
  unint64_t v29 = 0x80000001AD799B80;
  sub_1AD73A660();
  sub_1AD73A620();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_1AD73F300();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AD707B94();
  sub_1AD740D80();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = v27;
    LOBYTE(v28) = 0;
    uint64_t v12 = v30;
    uint64_t v13 = sub_1AD740A00();
    uint64_t v15 = v14;
    uint64_t v25 = v13;
    swift_bridgeObjectRelease();
    LOBYTE(v28) = 1;
    uint64_t v16 = sub_1AD740A00();
    uint64_t v18 = v17;
    uint64_t v24 = v16;
    swift_bridgeObjectRelease();
    LOBYTE(v28) = 2;
    uint64_t v19 = sub_1AD7409C0();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v12);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    uint64_t v23 = v26;
    *uint64_t v26 = v25;
    v23[1] = v15;
    v23[2] = v24;
    v23[3] = v18;
    v23[4] = v19;
    v23[5] = v21;
  }
  return result;
}

unint64_t sub_1AD707B94()
{
  unint64_t result = qword_1E9A34368;
  if (!qword_1E9A34368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34368);
  }
  return result;
}

unint64_t sub_1AD707BE8()
{
  unint64_t result = qword_1E9A34370;
  if (!qword_1E9A34370)
  {
    type metadata accessor for SummarySharingVersionMismatchCell();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A34370);
  }
  return result;
}

void sub_1AD707C24(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1AD707B94();
    unint64_t v7 = a3(a1, &type metadata for SummarySharingVersionMismatchItem.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1AD707C88()
{
  return swift_deallocObject();
}

uint64_t sub_1AD707CC0()
{
  return sub_1AD547944(*(void *)(v0 + 16));
}

unint64_t sub_1AD707CC8()
{
  unint64_t result = qword_1E9A34380;
  if (!qword_1E9A34380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34380);
  }
  return result;
}

uint64_t sub_1AD707D1C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD707D64()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD707DA4(uint64_t *a1)
{
  return sub_1AD2E5A10(*a1, a1[1], a1[2], *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

void sub_1AD707DD0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    unint64_t v10 = a5(a1, v9, a4);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for SummarySharingVersionMismatchItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AD707F08);
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

ValueMetadata *type metadata accessor for SummarySharingVersionMismatchItem.CodingKeys()
{
  return &type metadata for SummarySharingVersionMismatchItem.CodingKeys;
}

ValueMetadata *type metadata accessor for SummarySharingVersionMismatchItem()
{
  return &type metadata for SummarySharingVersionMismatchItem;
}

unint64_t sub_1AD707F54()
{
  unint64_t result = qword_1E9A34398;
  if (!qword_1E9A34398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34398);
  }
  return result;
}

unint64_t sub_1AD707FAC()
{
  unint64_t result = qword_1E9A343A0;
  if (!qword_1E9A343A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A343A0);
  }
  return result;
}

unint64_t sub_1AD708004()
{
  unint64_t result = qword_1E9A343A8;
  if (!qword_1E9A343A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A343A8);
  }
  return result;
}

char *sub_1AD708058(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, int a6)
{
  uint64_t v41 = a5;
  int v43 = a6;
  unint64_t v44 = a1;
  sub_1AD1D2608(0, &qword_1EB73E780, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v40 - v10;
  sub_1AD1D2608(0, (unint64_t *)&unk_1EB73F8B0, MEMORY[0x1E4F67030], MEMORY[0x1E4FBBE00]);
  uint64_t v12 = sub_1AD73AA80();
  uint64_t v13 = *(void *)(v12 - 8);
  unint64_t v14 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1AD74C370;
  (*(void (**)(unint64_t, void, uint64_t))(v13 + 104))(v15 + v14, *MEMORY[0x1E4F67028], v12);
  if (a2)
  {
    sub_1AD1EFDA4();
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1AD74C360;
    *(void *)(v16 + 32) = a2;
    uint64_t v45 = v16;
    sub_1AD73F4D0();
    uint64_t v17 = v45;
  }
  else
  {
    uint64_t v17 = 0;
  }
  sub_1AD73B520();
  uint64_t v18 = sub_1AD739E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 1, 1, v18);
  id v19 = a2;
  uint64_t v20 = (void *)MEMORY[0x1B3E616A0](v15, v17, v11, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD260AE4((uint64_t)v11);
  if (a4)
  {
    sub_1AD1EFDA4();
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_1AD74DE20;
    *(void *)(v21 + 32) = v20;
    *(void *)(v21 + 40) = a4;
    uint64_t v45 = v21;
    sub_1AD73F4D0();
    sub_1AD2147D4(0, (unint64_t *)&qword_1EB73F790);
    id v22 = a4;
    id v23 = v20;
    id v24 = v22;
    uint64_t v25 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v25);
  }
  else
  {
    id v26 = v20;
  }
  id v27 = objc_allocWithZone(MEMORY[0x1E4F29008]);
  uint64_t v28 = (void *)sub_1AD73F180();
  id v29 = objc_msgSend(v27, sel_initWithKey_ascending_, v28, 0);

  uint64_t v30 = (void *)MEMORY[0x1B3E61780]();
  objc_msgSend(v30, sel_setPredicate_, v26);
  sub_1AD1EFDA4();
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_1AD74C360;
  *(void *)(v31 + 32) = v29;
  uint64_t v45 = v31;
  sub_1AD73F4D0();
  sub_1AD2147D4(0, (unint64_t *)&qword_1EB7413D0);
  id v32 = v29;
  id v33 = (void *)sub_1AD73F490();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setSortDescriptors_, v33);

  if ((v43 & 1) == 0) {
    objc_msgSend(v30, sel_setFetchLimit_, v41);
  }
  id v34 = objc_allocWithZone(MEMORY[0x1E4F1C0F0]);
  uint64_t v35 = v44;
  id v36 = objc_msgSend(v34, sel_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_, v30, v44, 0, 0);
  uint64_t v37 = (id (**)(uint64_t *))(v42 + qword_1EB738AA0);
  *uint64_t v37 = sub_1AD4D55C4;
  v37[1] = 0;
  uint64_t v38 = _s18HealthExperienceUI33FeedItemSuggestedActionDataSourceCyACSo26NSFetchedResultsControllerCy0A8Platform0dE0CGcfc_0(v36);

  return v38;
}

void sub_1AD708520()
{
}

void sub_1AD708550()
{
}

void sub_1AD70856C()
{
}

void sub_1AD708588()
{
}

id sub_1AD7085B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetMoreFromHealthResultsController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GetMoreFromHealthResultsController()
{
  uint64_t result = qword_1EB73E888;
  if (!qword_1EB73E888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AD708638()
{
  return type metadata accessor for GetMoreFromHealthResultsController();
}

unint64_t sub_1AD708640@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_1AD73D120();
  MEMORY[0x1F4188790](v2 - 8);
  unsigned int v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1AD73ADD0();
  uint64_t v7 = v6;
  _s18HealthExperienceUI29CollectionViewHeaderProvidingPAAE24makeDefaultConfiguration5UIKit013UIListContentJ0VyFZ_0();
  uint64_t v8 = type metadata accessor for HeaderItem(0);
  swift_allocObject();
  HeaderItem.init(title:buttonText:buttonWasTapped:configuration:automationIdentifier:)(v5, v7, 0, 0, 0, 0, (uint64_t)v4, 0, 0);
  uint64_t v10 = v9;
  a1[3] = v8;
  unint64_t result = sub_1AD291714();
  a1[4] = result;
  *a1 = v10;
  return result;
}

uint64_t sub_1AD708730(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_1AD6E1ADC(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_1AD70C334(v5);
  *a1 = v2;
  return result;
}

char *AllHighlightsByCategoryViewController.__allocating_init(healthExperienceStore:healthStore:provenance:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return AllHighlightsByCategoryViewController.init(healthExperienceStore:healthStore:provenance:)(a1, a2, a3, a4);
}

char *AllHighlightsByCategoryViewController.init(healthExperienceStore:healthStore:provenance:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = &v5[OBJC_IVAR____TtC18HealthExperienceUI37AllHighlightsByCategoryViewController_provenance];
  *uint64_t v8 = a3;
  v8[1] = a4;
  id v9 = objc_msgSend(self, sel_allCategories);
  sub_1AD2147D4(0, (unint64_t *)&qword_1EB7412F0);
  unint64_t v10 = sub_1AD73F4B0();

  sub_1AD1FFE38(a1, (uint64_t)v20);
  type metadata accessor for AllHighlightsByCategoryDataSource(0);
  swift_allocObject();
  id v11 = a2;
  AllHighlightsByCategoryDataSource.init(displayCategories:healthExperienceStore:healthStore:)(v10, (uint64_t)v20, v11);
  uint64_t v13 = v12;
  unint64_t v14 = &v5[OBJC_IVAR____TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController_dataSourceProvider];
  *((void *)v14 + 4) = 0;
  *(_OWORD *)unint64_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v5[OBJC_IVAR____TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController_usesAdaptiveMargins] = 1;
  *(void *)&v5[OBJC_IVAR____TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController____lazy_storage___dataSource] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController_dataSourceAdaptor] = 0;
  id v15 = objc_allocWithZone(MEMORY[0x1E4FB15C0]);
  swift_retain();
  id v16 = objc_msgSend(v15, sel_init);
  v19.receiver = v5;
  v19.super_class = (Class)type metadata accessor for CompoundDataSourceCollectionViewController();
  uint64_t v17 = (char *)objc_msgSendSuper2(&v19, sel_initWithCollectionViewLayout_, v16);

  *(void *)&v17[OBJC_IVAR____TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController____lazy_storage___dataSource] = v13;
  swift_release();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v17;
}

void AllHighlightsByCategoryDataSource.__allocating_init(displayCategories:healthExperienceStore:healthStore:)(unint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t type metadata accessor for AllHighlightsByCategoryDataSource(uint64_t a1)
{
  return sub_1AD20CA30(a1, (uint64_t *)&unk_1E9A343B8);
}

id AllHighlightsByCategoryViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void AllHighlightsByCategoryViewController.init(coder:)()
{
}

id sub_1AD708B18()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for AllHighlightsByCategoryViewController();
  objc_msgSendSuper2(&v12, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v1, sel_setLargeTitleDisplayMode_, 2);

  if (qword_1EB732818 != -1) {
    swift_once();
  }
  sub_1AD73A1D0();
  uint64_t v2 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTitle_, v2, 0x80000001AD799CE0);

  id result = objc_msgSend(v0, sel_collectionView);
  if (result)
  {
    unsigned int v4 = result;
    uint64_t v5 = (void *)sub_1AD73F490();
    id v6 = (id)HKUIJoinStringsForAutomationIdentifier();

    objc_msgSend(v4, sel_setAccessibilityIdentifier_, v6);
    char v11 = 8;
    if (*(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI37AllHighlightsByCategoryViewController_provenance + 8])
    {
      uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI37AllHighlightsByCategoryViewController_provenance];
      uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI37AllHighlightsByCategoryViewController_provenance + 8];
    }
    else
    {
      uint64_t v8 = 0xE300000000000000;
      uint64_t v7 = 7104878;
    }
    type metadata accessor for HealthAppAnalyticsManager();
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    swift_bridgeObjectRetain();
    static HealthAppAnalyticsManager.submitInteraction(action:viewController:analyticProvenance:pinnedContentManager:)(&v11, v0, v7, v8, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return (id)sub_1AD3B6CA0((uint64_t)v9);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void AllHighlightsByCategoryViewController.__allocating_init(dataSource:)()
{
}

void AllHighlightsByCategoryViewController.init(dataSource:)()
{
}

id AllHighlightsByCategoryViewController.__allocating_init(collectionViewLayout:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCollectionViewLayout_, a1);

  return v3;
}

void AllHighlightsByCategoryViewController.init(collectionViewLayout:)()
{
}

uint64_t sub_1AD708E84()
{
  return swift_bridgeObjectRelease();
}

id AllHighlightsByCategoryViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AllHighlightsByCategoryViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AD708EE0(uint64_t a1, void *a2)
{
  sub_1AD1FFE38(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_1AD20FE90(v5, v3);
  return swift_endAccess();
}

uint64_t sub_1AD708F50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore;
  swift_beginAccess();
  return sub_1AD1FFE38(v3, a1);
}

uint64_t sub_1AD708FA4(long long *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_1AD20FE90(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AD709008())()
{
  return j__swift_endAccess;
}

uint64_t AllHighlightsByCategoryDataSource.displayCategories.getter()
{
  return swift_bridgeObjectRetain();
}

void AllHighlightsByCategoryDataSource.init(displayCategories:healthExperienceStore:healthStore:)(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v42 = sub_1AD73A670();
  uint64_t v8 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD1FFE38(a2, v4 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore);
  *(void *)(v4 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_displayCategories) = a1;
  *(void *)(v4 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthStore) = a3;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  objc_super v12 = self;
  swift_bridgeObjectRetain();
  id v13 = a3;
  id v14 = objc_msgSend(v12, sel_bundleForClass_, ObjCClassFromMetadata);
  id v15 = (void *)sub_1AD73F180();
  id v16 = objc_msgSend(self, sel_imageNamed_inBundle_, v15, v14);

  if (v16)
  {
    unint64_t v39 = a1;
    uint64_t v40 = v13;
    uint64_t v41 = a2;
    if (qword_1EB732818 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1AD73A1D0();
    uint64_t v19 = v18;
    uint64_t v44 = type metadata accessor for CenteredIconDescriptionCollectionViewCell();
    sub_1AD7095AC();
    uint64_t v20 = sub_1AD73F220();
    uint64_t v22 = v21;
    sub_1AD1C88C0(0, (unint64_t *)&qword_1EB739250);
    uint64_t inited = swift_initStackObject();
    long long v43 = xmmword_1AD74C370;
    *(_OWORD *)(inited + 16) = xmmword_1AD74C370;
    sub_1AD21CFCC(0, (unint64_t *)&qword_1EB73F8D0, (unint64_t *)&qword_1EB73E870, MEMORY[0x1E4F66028], MEMORY[0x1E4FBBE00]);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v43;
    *(void *)(v24 + 56) = &type metadata for CenteredIconDescriptionItem;
    *(void *)(v24 + 64) = sub_1AD536150();
    uint64_t v25 = swift_allocObject();
    *(void *)(v24 + 32) = v25;
    *(void *)(v25 + 16) = v20;
    *(void *)(v25 + 24) = v22;
    *(void *)(v25 + 32) = v16;
    *(void *)(v25 + 40) = v17;
    *(void *)(v25 + 48) = v19;
    *(_OWORD *)(v25 + 56) = 0u;
    *(_OWORD *)(v25 + 72) = 0u;
    swift_bridgeObjectRetain();
    id v38 = v16;
    swift_bridgeObjectRetain();
    sub_1AD73A660();
    uint64_t v26 = sub_1AD73A620();
    uint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v42);
    sub_1AD1FBD54(MEMORY[0x1E4FBC860]);
    uint64_t v29 = swift_bridgeObjectRetain();
    uint64_t v30 = Array<A>.identifierToIndexDict()(v29);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(void *)(inited + 32) = 0;
    *(void *)(inited + 40) = 0;
    *(void *)(inited + 48) = v24;
    *(void *)(inited + 56) = v30;
    *(void *)(inited + 64) = v26;
    *(void *)(inited + 72) = v28;
    type metadata accessor for MutableArrayDataSourceWithLayout();
    swift_allocObject();
    uint64_t v31 = MutableArrayDataSourceWithLayout.init(arrangedSections:collapseEmptySections:layoutConstructor:)(inited, 1, (uint64_t)sub_1AD216C9C, 0);
    sub_1AD3DF080();
    id v32 = (void *)swift_allocObject();
    v32[2] = v31;
    v32[3] = sub_1AD534604;
    v32[4] = 0;
    id v33 = v40;
    uint64_t v34 = v41;
    uint64_t v35 = sub_1AD70D810(v39, v41, v40);
    swift_bridgeObjectRelease();
    sub_1AD2C8E0C();
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = v43;
    *(void *)(v36 + 32) = v32;
    *(void *)(v36 + 40) = &protocol witness table for CellRegistering<A>;
    uint64_t v44 = v36;
    swift_retain();
    sub_1AD25FAF8(v35);
    CompoundSectionedDataSource.init(_:)(v44);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_release();

    __swift_destroy_boxed_opaque_existential_1(v34);
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for AllHighlightsByCategoryViewController()
{
  return self;
}

unint64_t sub_1AD7095AC()
{
  unint64_t result = qword_1E9A2AF88;
  if (!qword_1E9A2AF88)
  {
    type metadata accessor for CenteredIconDescriptionCollectionViewCell();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A2AF88);
  }
  return result;
}

uint64_t sub_1AD7095E8()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void AllHighlightsByCategoryDataSource.__allocating_init(_:)()
{
}

void AllHighlightsByCategoryDataSource.init(_:)()
{
}

void sub_1AD7096A0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthStore);
}

uint64_t AllHighlightsByCategoryDataSource.deinit()
{
  uint64_t v0 = CompoundSectionedDataSource.deinit();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t AllHighlightsByCategoryDataSource.__deallocating_deinit()
{
  uint64_t v0 = CompoundSectionedDataSource.deinit();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void *sub_1AD7097DC@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, void *a3@<X8>)
{
  uint64_t v6 = sub_1AD73A670();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1AD73CBA0();
  uint64_t v49 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  objc_super v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (SnapshotDataSource.numberOfSections.getter(a1, *(void *)(a2 + 8)) < 1)
  {
    a3[3] = &type metadata for EmptyHeaderItem;
    a3[4] = sub_1AD2D1244();
    uint64_t v22 = (void *)swift_allocObject();
    *a3 = v22;
    swift_beginAccess();
    uint64_t v23 = qword_1E9A2E210;
    uint64_t v24 = off_1E9A2E218;
    uint64_t v50 = 0xD000000000000010;
    unint64_t v51 = 0x80000001AD772080;
    swift_bridgeObjectRetain();
    sub_1AD73A660();
    sub_1AD70E0D4((unint64_t *)&qword_1EB7392C0, MEMORY[0x1E4F27990]);
    sub_1AD740B50();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
    unint64_t result = (void *)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    uint64_t v47 = v10;
    uint64_t v48 = v7;
    uint64_t v46 = v6;
    id v13 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 24);
    id v14 = (void *)v13(a1, a2);
    id v15 = objc_msgSend(v14, sel_listIcon);

    if (v15)
    {
      id v16 = (void *)v13(a1, a2);
      id v17 = objc_msgSend(v16, sel_displayName);

      uint64_t v18 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      uint64_t v20 = v19;

      a3[3] = &type metadata for HeaderWithIconItem;
      a3[4] = sub_1AD36FB00();
      unint64_t result = (void *)swift_allocObject();
      *a3 = result;
      result[2] = 0xD000000000000024;
      result[3] = 0x80000001AD77A210;
      result[4] = v18;
      result[5] = v20;
      result[6] = v15;
      result[7] = 0;
      return result;
    }
    sub_1AD73CAD0();
    swift_unknownObjectRetain_n();
    uint64_t v25 = sub_1AD73CB80();
    os_log_type_t v26 = sub_1AD73F930();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      os_log_t v45 = v25;
      uint64_t v28 = swift_slowAlloc();
      int v43 = v27;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v44 = swift_slowAlloc();
      v52[0] = v44;
      uint64_t v42 = v29;
      *(_DWORD *)uint64_t v29 = 136380675;
      uint64_t v41 = v29 + 4;
      uint64_t v30 = (void *)v13(a1, a2);
      id v31 = objc_msgSend(v30, sel_displayName);

      uint64_t v32 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      unint64_t v34 = v33;

      uint64_t v50 = sub_1AD1F62D4(v32, v34, v52);
      sub_1AD7403B0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v35 = v45;
      uint64_t v36 = v42;
      _os_log_impl(&dword_1AD1A4000, v45, (os_log_type_t)v43, "listIcon is missing from display category: %{private}s", v42, 0xCu);
      uint64_t v37 = v44;
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v37, -1, -1);
      MEMORY[0x1B3E68450](v36, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v47);
    uint64_t v38 = v48;
    a3[3] = &type metadata for EmptyHeaderItem;
    a3[4] = sub_1AD2D1244();
    uint64_t v22 = (void *)swift_allocObject();
    *a3 = v22;
    swift_beginAccess();
    uint64_t v23 = qword_1E9A2E210;
    uint64_t v24 = off_1E9A2E218;
    uint64_t v50 = 0xD000000000000010;
    unint64_t v51 = 0x80000001AD772080;
    swift_bridgeObjectRetain();
    sub_1AD73A660();
    sub_1AD70E0D4((unint64_t *)&qword_1EB7392C0, MEMORY[0x1E4F27990]);
    uint64_t v39 = v46;
    sub_1AD740B50();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
    unint64_t result = (void *)(*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v9, v39);
  }
  unint64_t v40 = v51;
  v22[2] = v50;
  v22[3] = v40;
  v22[4] = v23;
  v22[5] = v24;
  return result;
}

uint64_t sub_1AD709DC0(void *a1, void *a2, void *a3)
{
  uint64_t v52 = a2;
  uint64_t v6 = sub_1AD73AA80();
  uint64_t v47 = *(void *)(v6 - 8);
  uint64_t v48 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v46 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + qword_1E9A343C8) = a1;
  uint64_t v51 = v3;
  *(void *)(v3 + qword_1E9A343D0) = a3;
  uint64_t v8 = sub_1AD73B310();
  id v54 = a1;
  id v50 = a3;
  v45[2] = v8;
  id v49 = (id)sub_1AD73B2D0();
  if (qword_1EB741A00 != -1) {
    swift_once();
  }
  uint64_t v9 = (char *)off_1EB741750;
  uint64_t v10 = *((void *)off_1EB741750 + 2);
  if (v10)
  {
    sub_1AD2147D4(0, (unint64_t *)&qword_1EB741540);
    id v53 = self;
    swift_bridgeObjectRetain_n();
    v45[1] = v9;
    uint64_t v11 = v9 + 72;
    while (1)
    {
      uint64_t v12 = *((void *)v11 - 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v13 = objc_msgSend(v53, sel_categoryWithID_, v12);
      if (!v13) {
        break;
      }
      id v14 = v13;
      char v15 = sub_1AD740050();

      if (v15)
      {
        swift_bridgeObjectRelease_n();
        id v17 = v46;
        uint64_t v16 = v47;
        uint64_t v18 = v48;
        (*(void (**)(char *, void, uint64_t))(v47 + 104))(v46, *MEMORY[0x1E4F67020], v48);
        uint64_t v19 = (void *)sub_1AD73B2F0();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v18);
        uint64_t v20 = (void *)sub_1AD73B300();
        uint64_t v21 = (void *)sub_1AD73B2E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1AD1C88C0(0, (unint64_t *)&qword_1EB741320);
        uint64_t v22 = swift_allocObject();
        *(_OWORD *)(v22 + 16) = xmmword_1AD7501A0;
        *(void *)(v22 + 32) = v19;
        *(void *)(v22 + 40) = v20;
        *(void *)(v22 + 48) = v21;
        *(void *)&v55[0] = v22;
        sub_1AD73F4D0();
        sub_1AD2147D4(0, (unint64_t *)&qword_1EB73F790);
        id v23 = v19;
        id v24 = v20;
        id v25 = v21;
        os_log_type_t v26 = (void *)sub_1AD73F490();
        swift_bridgeObjectRelease();
        id v27 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v26);

        id v28 = v49;
        objc_msgSend(v49, sel_setPredicate_, v27);

        uint64_t v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = xmmword_1AD74C360;
        id v30 = objc_allocWithZone(MEMORY[0x1E4F29008]);
        id v31 = (void *)sub_1AD73F180();
        id v32 = objc_msgSend(v30, sel_initWithKey_ascending_, v31, 1);

        *(void *)(v29 + 32) = v32;
        *(void *)&v55[0] = v29;
        sub_1AD73F4D0();
        sub_1AD2147D4(0, (unint64_t *)&qword_1EB7413D0);
        unint64_t v33 = (void *)sub_1AD73F490();
        swift_bridgeObjectRelease();
        objc_msgSend(v28, sel_setSortDescriptors_, v33);

        unint64_t v34 = v52;
        __swift_project_boxed_opaque_existential_1(v52, v52[3]);
        id v35 = v28;
        uint64_t v36 = (void *)sub_1AD73A990();
        id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C0F0]), sel_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_, v35, v36, 0, 0);

        sub_1AD67151C();
        id v39 = objc_allocWithZone(v38);
        id v40 = v37;
        uint64_t v41 = sub_1AD671004(v40);
        sub_1AD1FFE38((uint64_t)v34, (uint64_t)v55);
        uint64_t v42 = swift_allocObject();
        *(void *)(v42 + 16) = v50;
        sub_1AD20FE90(v55, v42 + 24);
        uint64_t v43 = sub_1AD2C974C(v41, 0, (uint64_t)sub_1AD70E15C, v42, 0);

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        return v43;
      }
      v11 += 48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v10)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_12;
      }
    }
    *(void *)&v55[0] = 0;
    *((void *)&v55[0] + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AD740680();
    sub_1AD73F300();
    uint64_t v56 = v12;
    type metadata accessor for HKDisplayCategoryIdentifier(0);
    sub_1AD740840();
    sub_1AD73F300();
    swift_bridgeObjectRetain();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  uint64_t result = sub_1AD7408B0();
  __break(1u);
  return result;
}

uint64_t sub_1AD70A448(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v57 = a4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD70DEA8(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v44 - v8;
  sub_1AD70DEA8(0, &qword_1EB73FD50, MEMORY[0x1E4FB0E38], v6);
  MEMORY[0x1F4188790](v10 - 8);
  id v53 = (char *)&v44 - v11;
  uint64_t v12 = sub_1AD73CCB0();
  uint64_t v54 = *(void *)(v12 - 8);
  uint64_t v55 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v51 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1AD73CC10();
  uint64_t v14 = *(void *)(v52 - 8);
  MEMORY[0x1F4188790](v52);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_1AD73D120();
  uint64_t v17 = *(void *)(v58 - 8);
  MEMORY[0x1F4188790](v58);
  uint64_t v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD1FFE38(a1, (uint64_t)&v62);
  sub_1AD20EE0C(0, (unint64_t *)&qword_1EB73E870);
  sub_1AD73B310();
  if (swift_dynamicCast())
  {
    id v56 = *(id *)&v60[0];
    uint64_t v20 = sub_1AD73B2C0();
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      sub_1AD73D110();
      id v22 = objc_msgSend(a3, sel_displayTypeController);
      if (v22)
      {
        id v23 = v22;
        id v49 = a3;
        id v50 = v9;
        id v24 = objc_msgSend(v22, sel_displayTypeForObjectType_, v21);

        if (v24)
        {
          id v25 = objc_msgSend(v24, sel_localization);

          id v26 = objc_msgSend(v25, sel_displayName);
          _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

          os_log_t v45 = v19;
          sub_1AD73D0C0();
          sub_1AD21CFCC(0, (unint64_t *)&qword_1EB73F8D0, (unint64_t *)&qword_1EB73E870, MEMORY[0x1E4F66028], MEMORY[0x1E4FBBE00]);
          uint64_t v27 = swift_allocObject();
          long long v44 = xmmword_1AD74C370;
          *(_OWORD *)(v27 + 16) = xmmword_1AD74C370;
          uint64_t v48 = (uint64_t *)(v27 + 32);
          uint64_t v62 = 0;
          unint64_t v63 = 0xE000000000000000;
          sub_1AD740680();
          swift_bridgeObjectRelease();
          uint64_t v62 = 0xD00000000000001BLL;
          unint64_t v63 = 0x80000001AD79A060;
          id v28 = objc_msgSend(v21, sel_description);
          _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

          sub_1AD73F300();
          swift_bridgeObjectRelease();
          uint64_t v47 = v62;
          unint64_t v46 = v63;
          uint64_t v29 = v58;
          uint64_t v64 = v58;
          uint64_t v65 = MEMORY[0x1E4FB0F88];
          id v30 = __swift_allocate_boxed_opaque_existential_1(&v62);
          (*(void (**)(uint64_t *, char *, uint64_t))(v17 + 16))(v30, v19, v29);
          sub_1AD70DEA8(0, &qword_1EB7401F0, MEMORY[0x1E4FB0E68], MEMORY[0x1E4FBBE00]);
          sub_1AD73CCE0();
          uint64_t v31 = swift_allocObject();
          *(_OWORD *)(v31 + 16) = v44;
          id v32 = v16;
          uint64_t v33 = v52;
          (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E4FB0E18], v52);
          uint64_t v34 = sub_1AD73CC40();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v53, 1, 1, v34);
          id v35 = v51;
          sub_1AD73CCA0();
          sub_1AD73CC70();
          (*(void (**)(char *, uint64_t))(v54 + 8))(v35, v55);
          (*(void (**)(char *, uint64_t))(v14 + 8))(v32, v33);
          sub_1AD1FFE38(v57, (uint64_t)v60);
          uint64_t v36 = swift_allocObject();
          id v37 = v49;
          *(void *)(v36 + 16) = v21;
          *(void *)(v36 + 24) = v37;
          sub_1AD20FE90(v60, v36 + 32);
          id v38 = v21;
          id v39 = v37;
          uint64_t v40 = (uint64_t)v50;
          sub_1AD73CE10();
          uint64_t v41 = sub_1AD73CE60();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 0, 1, v41);
          LOBYTE(v61) = 2;
          char v59 = 0;
          *(void *)(v27 + 56) = type metadata accessor for ContentConfigurationItem();
          *(void *)(v27 + 64) = sub_1AD70E0D4(qword_1EB7322D0, (void (*)(uint64_t))type metadata accessor for ContentConfigurationItem);
          boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v48);
          ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)(v47, v46, (uint64_t)&v62, v31, (uint64_t)sub_1AD70E1B0, v36, (char *)&v61, v40, (uint64_t)boxed_opaque_existential_1, 0, 0, &v59, 0, 0);

          (*(void (**)(char *, uint64_t))(v17 + 8))(v45, v58);
          return v27;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
  }
  sub_1AD1FFE38(a1, (uint64_t)&v62);
  *(void *)&v60[0] = 0;
  *((void *)&v60[0] + 1) = 0xE000000000000000;
  sub_1AD740680();
  long long v61 = v60[0];
  sub_1AD73F300();
  sub_1AD1FFE38((uint64_t)&v62, (uint64_t)v60);
  sub_1AD73F220();
  sub_1AD73F300();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1AD7408B0();
  __break(1u);
  return result;
}

void sub_1AD70ACF4(void *a1, void *a2, void *a3, uint64_t a4)
{
  sub_1AD1FFE38(a4, (uint64_t)v8);
  objc_allocWithZone((Class)type metadata accessor for AllHighlightsForDataTypeViewController());
  uint64_t v7 = (void *)AllHighlightsForDataTypeViewController.init(hkType:healthStore:healthExperienceStore:hideShowAllButton:provenance:)(a2, a3, v8, 1, 0x6867696C68676948, 0xEA00000000007374);
  objc_msgSend(a1, sel_showViewController_sender_, v7, a1);
}

void sub_1AD70ADA4()
{
}

void sub_1AD70ADD4()
{
  uint64_t v1 = *(void **)(v0 + qword_1E9A343D0);
}

uint64_t sub_1AD70AE14()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_snapshot;
  sub_1AD20E2C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD2C92FC(*(void *)(v0 + qword_1EB7388A8), *(void *)(v0 + qword_1EB7388A8 + 8), *(unsigned char *)(v0 + qword_1EB7388A8 + 16));

  return v0;
}

uint64_t sub_1AD70AF0C()
{
  return sub_1AD70C1B0(sub_1AD70AE14);
}

id sub_1AD70AF24()
{
  return *(id *)(v0 + qword_1E9A343C8);
}

void *sub_1AD70AF38(uint64_t a1)
{
  return sub_1AD70C268(a1);
}

void *sub_1AD70AF50@<X0>(uint64_t a1@<X3>, void *a2@<X8>)
{
  return sub_1AD7097DC(a1, (uint64_t)&off_1F043EA10, a2);
}

void sub_1AD70AF7C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v6 = v5;
  sub_1AD70DEA8(0, &qword_1EB73E780, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v52 - v13;
  uint64_t v15 = (void *)(v6 + qword_1E9A343E8);
  *uint64_t v15 = a1;
  v15[1] = a2;
  *(void *)(v6 + qword_1E9A343F0) = a5;
  sub_1AD1FFE38((uint64_t)a4, v6 + qword_1E9A343F8);
  *(void *)(v6 + qword_1E9A34400) = a3;
  uint64_t v16 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  id v17 = a5;
  id v18 = a3;
  id v19 = objc_msgSend(v16, sel_sharedInstanceForHealthStore_, v17);
  if (v19)
  {
    uint64_t v20 = v19;
    id v55 = v17;
    uint64_t v56 = a1;
    uint64_t v57 = a2;
    uint64_t v58 = a4;
    id v21 = objc_msgSend(v19, sel_displayTypeForObjectType_, v18);

    if (v21)
    {
      id v22 = objc_msgSend(v21, sel_displayCategory);

      *(void *)(v6 + qword_1E9A34408) = v22;
      id v54 = v22;
      swift_release();
      sub_1AD73B520();
      id v23 = (void *)MEMORY[0x1B3E61780]();
      sub_1AD70DEA8(0, (unint64_t *)&unk_1EB73F8B0, MEMORY[0x1E4F67030], MEMORY[0x1E4FBBE00]);
      uint64_t v24 = sub_1AD73AA80();
      uint64_t v25 = *(void *)(v24 - 8);
      unint64_t v26 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_1AD74C370;
      (*(void (**)(unint64_t, void, uint64_t))(v25 + 104))(v27 + v26, *MEMORY[0x1E4F66F98], v24);
      sub_1AD1C88C0(0, (unint64_t *)&qword_1EB741320);
      uint64_t v28 = swift_allocObject();
      long long v52 = xmmword_1AD74C360;
      *(_OWORD *)(v28 + 16) = xmmword_1AD74C360;
      *(void *)(v28 + 32) = v18;
      *(void *)&v59[0] = v28;
      sub_1AD73F4D0();
      uint64_t v29 = *(void *)&v59[0];
      uint64_t v30 = sub_1AD739E10();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v14, 1, 1, v30);
      sub_1AD1C88C0(0, (unint64_t *)&qword_1EB73F8C0);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_1AD74C350;
      id v32 = v18;
      *(void *)(v31 + 32) = sub_1AD73AB90();
      *(void *)(v31 + 40) = 0;
      uint64_t v33 = (void *)MEMORY[0x1B3E616A0](v27, v29, v14, v31);
      id v53 = v33;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1AD70DF0C((uint64_t)v14, &qword_1EB73E780, MEMORY[0x1E4F26E60]);
      objc_msgSend(v23, sel_setPredicate_, v33);
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = v52;
      id v35 = objc_allocWithZone(MEMORY[0x1E4F29008]);
      uint64_t v36 = (void *)sub_1AD73F180();
      id v37 = objc_msgSend(v35, sel_initWithKey_ascending_, v36, 1);

      *(void *)(v34 + 32) = v37;
      *(void *)&v59[0] = v34;
      sub_1AD73F4D0();
      sub_1AD2147D4(0, (unint64_t *)&qword_1EB7413D0);
      id v38 = (void *)sub_1AD73F490();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setSortDescriptors_, v38);

      id v39 = v58;
      __swift_project_boxed_opaque_existential_1(v58, v58[3]);
      id v40 = v23;
      uint64_t v41 = (void *)sub_1AD73A990();
      id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C0F0]), sel_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_, v40, v41, 0, 0);

      sub_1AD1FB488();
      id v44 = objc_allocWithZone(v43);
      id v45 = v42;
      unint64_t v46 = _s18HealthExperienceUI33FeedItemSuggestedActionDataSourceCyACSo26NSFetchedResultsControllerCy0A8Platform0dE0CGcfc_0(v45);
      sub_1AD1FFE38((uint64_t)v39, (uint64_t)v59);
      uint64_t v47 = (void *)swift_allocObject();
      uint64_t v48 = v54;
      uint64_t v49 = v56;
      v47[2] = v54;
      v47[3] = v49;
      v47[4] = v57;
      v47[5] = v32;
      sub_1AD20FE90(v59, (uint64_t)(v47 + 6));
      id v50 = v32;
      id v51 = v48;
      sub_1AD2C78A0(v46, 0, (uint64_t)sub_1AD70DFCC, (uint64_t)v47, 0);

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1AD70B584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v56 = a7;
  id v48 = a6;
  uint64_t v57 = a5;
  uint64_t v61 = a4;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD70DEA8(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v58 = (char *)&v45 - v9;
  sub_1AD70DEA8(0, &qword_1EB73FD50, MEMORY[0x1E4FB0E38], v7);
  MEMORY[0x1F4188790](v10 - 8);
  long long v52 = (char *)&v45 - v11;
  uint64_t v54 = sub_1AD73CCB0();
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  id v50 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1AD73CC10();
  uint64_t v49 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_1AD73D120();
  uint64_t v55 = *(void *)(v60 - 8);
  MEMORY[0x1F4188790](v60);
  char v59 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB741A00 != -1) {
    swift_once();
  }
  uint64_t v16 = (char *)off_1EB741750;
  uint64_t v17 = *((void *)off_1EB741750 + 2);
  if (v17)
  {
    sub_1AD2147D4(0, (unint64_t *)&qword_1EB741540);
    id v18 = self;
    swift_bridgeObjectRetain_n();
    uint64_t v19 = 32;
    while (1)
    {
      long long v20 = *(_OWORD *)&v16[v19 + 32];
      long long v21 = *(_OWORD *)&v16[v19];
      long long v70 = *(_OWORD *)&v16[v19 + 16];
      long long v71 = v20;
      long long v69 = v21;
      uint64_t v22 = v70;
      sub_1AD70DFDC((uint64_t)&v69);
      id v23 = objc_msgSend(v18, sel_categoryWithID_, v22);
      if (!v23) {
        break;
      }
      uint64_t v24 = v23;
      char v25 = sub_1AD740050();

      if (v25)
      {
        swift_bridgeObjectRelease_n();
        unint64_t v26 = v59;
        sub_1AD73D110();
        uint64_t v27 = v57;
        swift_bridgeObjectRetain();
        sub_1AD73D0C0();
        sub_1AD21CFCC(0, (unint64_t *)&qword_1EB73F8D0, (unint64_t *)&qword_1EB73E870, MEMORY[0x1E4F66028], MEMORY[0x1E4FBBE00]);
        uint64_t v28 = swift_allocObject();
        long long v45 = xmmword_1AD74C370;
        *(_OWORD *)(v28 + 16) = xmmword_1AD74C370;
        uint64_t v47 = (uint64_t *)(v28 + 32);
        uint64_t v65 = 0;
        unint64_t v66 = 0xE000000000000000;
        sub_1AD740680();
        swift_bridgeObjectRelease();
        uint64_t v65 = (void *)0xD000000000000019;
        unint64_t v66 = 0x80000001AD79A000;
        id v29 = objc_msgSend(v48, sel_description);
        _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

        sub_1AD73F300();
        swift_bridgeObjectRelease();
        id v48 = v65;
        unint64_t v46 = v66;
        uint64_t v30 = v60;
        uint64_t v67 = v60;
        uint64_t v68 = MEMORY[0x1E4FB0F88];
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
        uint64_t v32 = v55;
        (*(void (**)(uint64_t *, char *, uint64_t))(v55 + 16))(boxed_opaque_existential_1, v26, v30);
        sub_1AD70DEA8(0, &qword_1EB7401F0, MEMORY[0x1E4FB0E68], MEMORY[0x1E4FBBE00]);
        sub_1AD73CCE0();
        uint64_t v33 = swift_allocObject();
        *(_OWORD *)(v33 + 16) = v45;
        uint64_t v34 = v49;
        id v35 = v14;
        uint64_t v36 = v51;
        (*(void (**)(char *, void, uint64_t))(v49 + 104))(v14, *MEMORY[0x1E4FB0E18], v51);
        uint64_t v37 = sub_1AD73CC40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v52, 1, 1, v37);
        id v38 = v50;
        sub_1AD73CCA0();
        sub_1AD73CC70();
        (*(void (**)(char *, uint64_t))(v53 + 8))(v38, v54);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
        sub_1AD1FFE38(v56, (uint64_t)v64);
        uint64_t v39 = swift_allocObject();
        long long v40 = v70;
        *(_OWORD *)(v39 + 16) = v69;
        *(_OWORD *)(v39 + 32) = v40;
        *(_OWORD *)(v39 + 48) = v71;
        sub_1AD20FE90(v64, v39 + 64);
        *(void *)(v39 + 104) = v61;
        *(void *)(v39 + 112) = v27;
        swift_bridgeObjectRetain();
        uint64_t v41 = (uint64_t)v58;
        sub_1AD73CE10();
        uint64_t v42 = sub_1AD73CE60();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 0, 1, v42);
        char v63 = 2;
        char v62 = 0;
        *(void *)(v28 + 56) = type metadata accessor for ContentConfigurationItem();
        *(void *)(v28 + 64) = sub_1AD70E0D4(qword_1EB7322D0, (void (*)(uint64_t))type metadata accessor for ContentConfigurationItem);
        Class v43 = __swift_allocate_boxed_opaque_existential_1(v47);
        ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)((uint64_t)v48, v46, (uint64_t)&v65, v33, (uint64_t)sub_1AD70E0C4, v39, &v63, v41, (uint64_t)v43, 0, 0, &v62, 0, 0);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v59, v60);
        return v28;
      }
      sub_1AD70E024((uint64_t)&v69);
      v19 += 48;
      if (!--v17)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_12;
      }
    }
    uint64_t v65 = 0;
    unint64_t v66 = 0xE000000000000000;
    sub_1AD70DFDC((uint64_t)&v69);
    sub_1AD740680();
    sub_1AD73F300();
    *(void *)&v64[0] = v22;
    type metadata accessor for HKDisplayCategoryIdentifier(0);
    sub_1AD740840();
    sub_1AD73F300();
    swift_bridgeObjectRetain();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  uint64_t result = sub_1AD7408B0();
  __break(1u);
  return result;
}

void sub_1AD70BED8(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  sub_1AD1FFE38(a3, (uint64_t)v11);
  sub_1AD1C88C0(0, (unint64_t *)&qword_1EB741480);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AD74C350;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)(inited + 32) = sub_1AD73AEB0();
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 48) = sub_1AD73AEA0();
  *(void *)(inited + 56) = v8;
  id v9 = objc_allocWithZone((Class)type metadata accessor for AllHighlightsForExperienceViewController());
  uint64_t v10 = AllHighlightsForExperienceViewController.init(baseKeyword:sectionKeywords:healthExperienceStore:title:)(v4, v5, inited, (uint64_t)v11);
  objc_msgSend(a1, sel_showViewController_sender_, v10, a1);
}

void sub_1AD70BFC8()
{
}

void sub_1AD70BFF8()
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + qword_1E9A343F8);
  uint64_t v1 = *(void **)(v0 + qword_1E9A34408);
}

uint64_t sub_1AD70C06C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_snapshot;
  sub_1AD20E2C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD2C92FC(*(void *)(v0 + qword_1EB7388A8), *(void *)(v0 + qword_1EB7388A8 + 8), *(unsigned char *)(v0 + qword_1EB7388A8 + 16));

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_1E9A343F8);

  return v0;
}

uint64_t sub_1AD70C198()
{
  return sub_1AD70C1B0(sub_1AD70C06C);
}

uint64_t sub_1AD70C1B0(uint64_t (*a1)(void))
{
  a1();
  return swift_deallocClassInstance();
}

id sub_1AD70C208()
{
  return *(id *)(v0 + qword_1E9A34408);
}

uint64_t sub_1AD70C218()
{
  sub_1AD21F3FC();
  _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  sub_1AD1AF214();
  return swift_bridgeObjectRelease();
}

void *sub_1AD70C268(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ListLayoutConfiguration();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 8);
  sub_1AD1BB170((uint64_t)v4);
  uint64_t v6 = ListLayoutConfiguration.layout(for:)(v5);
  sub_1AD225778((uint64_t)v4);
  return v6;
}

void *sub_1AD70C308@<X0>(uint64_t a1@<X3>, void *a2@<X8>)
{
  return sub_1AD7097DC(a1, (uint64_t)&off_1F043E9B8, a2);
}

uint64_t sub_1AD70C334(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_1AD70DEA8(0, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  v187 = (char *)&v166 - v5;
  uint64_t v6 = a1[1];
  uint64_t result = sub_1AD740B30();
  v177 = (char *)v6;
  if (result >= v6)
  {
    if (v6 < 0) {
      goto LABEL_141;
    }
    if ((unint64_t)v6 >= 2)
    {
      uint64_t v172 = v1;
      uint64_t v11 = *a1;
      uint64_t v12 = -1;
      uint64_t v13 = 1;
      uint64_t v181 = *a1;
      do
      {
        v179 = (char *)v13;
        uint64_t v180 = v12;
        long long v14 = *(_OWORD *)(v181 + 16 * v13);
        uint64_t v178 = v11;
        do
        {
          long long v182 = v14;
          uint64_t v15 = *(void *)(v11 + 8);
          uint64_t ObjectType = swift_getObjectType();
          uint64_t v17 = *((void *)&v182 + 1);
          id v18 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v182 + 1) + 24);
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          uint64_t v19 = (void *)v18(ObjectType, v17);
          id v20 = objc_msgSend(v19, sel_displayName);

          uint64_t v21 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v23 = v22;

          uint64_t v185 = v21;
          uint64_t v186 = v23;
          uint64_t v24 = swift_getObjectType();
          char v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v24, v15);
          id v26 = objc_msgSend(v25, sel_displayName);

          uint64_t v27 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v29 = v28;

          uint64_t v183 = v27;
          uint64_t v184 = v29;
          uint64_t v30 = sub_1AD73A6A0();
          uint64_t v31 = (uint64_t)v187;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v187, 1, 1, v30);
          sub_1AD20F9FC();
          uint64_t v32 = sub_1AD740460();
          sub_1AD70DF0C(v31, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78]);
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v32 != -1) {
            break;
          }
          if (!v181) {
            goto LABEL_144;
          }
          long long v14 = *(_OWORD *)(v11 + 16);
          *(_OWORD *)(v11 + 16) = *(_OWORD *)v11;
          *(_OWORD *)uint64_t v11 = v14;
          v11 -= 16;
        }
        while (!__CFADD__(v12++, 1));
        uint64_t v13 = (uint64_t)(v179 + 1);
        uint64_t v11 = v178 + 16;
        uint64_t v12 = v180 - 1;
      }
      while (v179 + 1 != v177);
    }
    return result;
  }
  if (v6 >= 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v6 + 1;
  }
  if (v6 < -1) {
    goto LABEL_150;
  }
  uint64_t v171 = result;
  v166 = a1;
  if (v6 < 2)
  {
    uint64_t v34 = (char *)MEMORY[0x1E4FBC860];
    v179 = (char *)(MEMORY[0x1E4FBC860] + 32);
    uint64_t v170 = MEMORY[0x1E4FBC860];
    if (v6 != 1)
    {
      unint64_t v37 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_107:
      if (v37 >= 2)
      {
        uint64_t v159 = *v166;
        do
        {
          unint64_t v160 = v37 - 2;
          if (v37 < 2) {
            goto LABEL_136;
          }
          if (!v159) {
            goto LABEL_149;
          }
          uint64_t v161 = v2;
          uint64_t v162 = *(void *)&v34[16 * v160 + 32];
          uint64_t v163 = *(void *)&v34[16 * v37 + 24];
          sub_1AD70D184((char *)(v159 + 16 * v162), (char *)(v159 + 16 * *(void *)&v34[16 * v37 + 16]), (char *)(v159 + 16 * v163), v179);
          if (v161) {
            break;
          }
          if (v163 < v162) {
            goto LABEL_137;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v34 = sub_1AD6E1A78((uint64_t)v34);
          }
          if (v160 >= *((void *)v34 + 2)) {
            goto LABEL_138;
          }
          v164 = &v34[16 * v160 + 32];
          *(void *)v164 = v162;
          *((void *)v164 + 1) = v163;
          unint64_t v165 = *((void *)v34 + 2);
          if (v37 > v165) {
            goto LABEL_139;
          }
          memmove(&v34[16 * v37 + 16], &v34[16 * v37 + 32], 16 * (v165 - v37));
          *((void *)v34 + 2) = v165 - 1;
          unint64_t v37 = v165 - 1;
          uint64_t v2 = 0;
        }
        while (v165 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(void *)(v170 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v9 = v8 >> 1;
    sub_1AD20EE0C(0, &qword_1E9A2AC70);
    uint64_t v10 = sub_1AD73F540();
    *(void *)(v10 + 16) = v9;
    uint64_t v170 = v10;
    v179 = (char *)(v10 + 32);
  }
  uint64_t v35 = 0;
  uint64_t v36 = *a1;
  uint64_t v168 = *a1 + 40;
  uint64_t v34 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v167 = v36 - 16;
  uint64_t v181 = v36;
  while (1)
  {
    uint64_t v38 = v35;
    uint64_t v39 = v35 + 1;
    uint64_t v176 = v35;
    if (v35 + 1 < v6)
    {
      uint64_t v172 = v2;
      long long v40 = (void *)(v36 + 16 * v39);
      uint64_t v41 = v40[1];
      *(void *)&long long v182 = *v40;
      uint64_t v42 = *(void *)(v36 + 16 * v35 + 8);
      uint64_t v43 = swift_getObjectType();
      id v44 = *(uint64_t (**)(uint64_t, uint64_t))(v41 + 24);
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      long long v45 = (void *)v44(v43, v41);
      uint64_t v6 = (uint64_t)v177;
      unint64_t v46 = v45;
      id v47 = objc_msgSend(v45, sel_displayName);

      uint64_t v48 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      uint64_t v50 = v49;

      uint64_t v185 = v48;
      uint64_t v186 = v50;
      uint64_t v51 = swift_getObjectType();
      long long v52 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v42 + 24))(v51, v42);
      id v53 = objc_msgSend(v52, sel_displayName);

      uint64_t v54 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      uint64_t v56 = v55;

      uint64_t v183 = v54;
      uint64_t v184 = v56;
      uint64_t v57 = sub_1AD73A6A0();
      uint64_t v58 = *(void *)(v57 - 8);
      char v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56);
      uint64_t v60 = (uint64_t)v187;
      uint64_t v178 = v57;
      uint64_t v174 = v58 + 56;
      v175 = v59;
      ((void (*)(char *, uint64_t, uint64_t))v59)(v187, 1, 1);
      unint64_t v173 = sub_1AD20F9FC();
      uint64_t v180 = sub_1AD740460();
      sub_1AD70DF0C(v60, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78]);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v39 = v38 + 2;
      if (v38 + 2 >= v6)
      {
        uint64_t v2 = v172;
      }
      else
      {
        v169 = v34;
        uint64_t v61 = (uint64_t *)(v168 + 16 * v38);
        while (1)
        {
          uint64_t v62 = v39;
          LODWORD(v182) = v180 == -1;
          uint64_t v63 = *v61;
          uint64_t v64 = *(v61 - 2);
          uint64_t v65 = swift_getObjectType();
          unint64_t v66 = *(uint64_t (**)(uint64_t, uint64_t))(v63 + 24);
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          uint64_t v67 = (void *)v66(v65, v63);
          id v68 = objc_msgSend(v67, sel_displayName);

          uint64_t v69 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v71 = v70;

          uint64_t v185 = v69;
          uint64_t v186 = v71;
          uint64_t v72 = swift_getObjectType();
          uint64_t v73 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v64 + 24))(v72, v64);
          id v74 = objc_msgSend(v73, sel_displayName);

          uint64_t v75 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v77 = v76;

          uint64_t v183 = v75;
          uint64_t v184 = v77;
          uint64_t v78 = (uint64_t)v187;
          v175(v187, 1, 1, v178);
          uint64_t v79 = sub_1AD740460();
          sub_1AD70DF0C(v78, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78]);
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          if (v182 == (v79 != -1)) {
            break;
          }
          ++v39;
          v61 += 2;
          if (v177 == (char *)(v62 + 1))
          {
            uint64_t v6 = (uint64_t)v177;
            uint64_t v39 = (uint64_t)v177;
            uint64_t v34 = v169;
            goto LABEL_30;
          }
        }
        uint64_t v6 = (uint64_t)v177;
        uint64_t v34 = v169;
LABEL_30:
        uint64_t v2 = v172;
        uint64_t v38 = v176;
      }
      uint64_t v36 = v181;
      if (v180 == -1)
      {
        if (v39 < v38) {
          goto LABEL_145;
        }
        if (v38 < v39)
        {
          v80 = (long long *)(v167 + 16 * v39);
          uint64_t v81 = v39;
          uint64_t v82 = v38;
          v83 = (long long *)(v181 + 16 * v38);
          do
          {
            if (v82 != --v81)
            {
              if (!v36) {
                goto LABEL_148;
              }
              long long v84 = *v83;
              long long *v83 = *v80;
              long long *v80 = v84;
            }
            ++v82;
            --v80;
            ++v83;
          }
          while (v82 < v81);
        }
      }
    }
    if (v39 < v6)
    {
      if (__OFSUB__(v39, v38)) {
        goto LABEL_140;
      }
      if (v39 - v38 < v171) {
        break;
      }
    }
LABEL_57:
    if (v39 < v38) {
      goto LABEL_135;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v34 = sub_1AD6E135C(0, *((void *)v34 + 2) + 1, 1, v34);
    }
    unint64_t v109 = *((void *)v34 + 2);
    unint64_t v108 = *((void *)v34 + 3);
    unint64_t v37 = v109 + 1;
    uint64_t v36 = v181;
    if (v109 >= v108 >> 1)
    {
      v158 = sub_1AD6E135C((char *)(v108 > 1), v109 + 1, 1, v34);
      uint64_t v36 = v181;
      uint64_t v34 = v158;
    }
    *((void *)v34 + 2) = v37;
    v110 = v34 + 32;
    v111 = &v34[16 * v109 + 32];
    *(void *)v111 = v38;
    *((void *)v111 + 1) = v39;
    uint64_t v180 = v39;
    if (v109)
    {
      while (1)
      {
        unint64_t v112 = v37 - 1;
        if (v37 >= 4)
        {
          v117 = &v110[16 * v37];
          uint64_t v118 = *((void *)v117 - 8);
          uint64_t v119 = *((void *)v117 - 7);
          BOOL v123 = __OFSUB__(v119, v118);
          uint64_t v120 = v119 - v118;
          if (v123) {
            goto LABEL_124;
          }
          uint64_t v122 = *((void *)v117 - 6);
          uint64_t v121 = *((void *)v117 - 5);
          BOOL v123 = __OFSUB__(v121, v122);
          uint64_t v115 = v121 - v122;
          char v116 = v123;
          if (v123) {
            goto LABEL_125;
          }
          unint64_t v124 = v37 - 2;
          v125 = &v110[16 * v37 - 32];
          uint64_t v127 = *(void *)v125;
          uint64_t v126 = *((void *)v125 + 1);
          BOOL v123 = __OFSUB__(v126, v127);
          uint64_t v128 = v126 - v127;
          if (v123) {
            goto LABEL_127;
          }
          BOOL v123 = __OFADD__(v115, v128);
          uint64_t v129 = v115 + v128;
          if (v123) {
            goto LABEL_130;
          }
          if (v129 >= v120)
          {
            v147 = &v110[16 * v112];
            uint64_t v149 = *(void *)v147;
            uint64_t v148 = *((void *)v147 + 1);
            BOOL v123 = __OFSUB__(v148, v149);
            uint64_t v150 = v148 - v149;
            if (v123) {
              goto LABEL_134;
            }
            BOOL v140 = v115 < v150;
            goto LABEL_94;
          }
        }
        else
        {
          if (v37 != 3)
          {
            uint64_t v141 = *((void *)v34 + 4);
            uint64_t v142 = *((void *)v34 + 5);
            BOOL v123 = __OFSUB__(v142, v141);
            uint64_t v134 = v142 - v141;
            char v135 = v123;
            goto LABEL_88;
          }
          uint64_t v114 = *((void *)v34 + 4);
          uint64_t v113 = *((void *)v34 + 5);
          BOOL v123 = __OFSUB__(v113, v114);
          uint64_t v115 = v113 - v114;
          char v116 = v123;
        }
        if (v116) {
          goto LABEL_126;
        }
        unint64_t v124 = v37 - 2;
        v130 = &v110[16 * v37 - 32];
        uint64_t v132 = *(void *)v130;
        uint64_t v131 = *((void *)v130 + 1);
        BOOL v133 = __OFSUB__(v131, v132);
        uint64_t v134 = v131 - v132;
        char v135 = v133;
        if (v133) {
          goto LABEL_129;
        }
        v136 = &v110[16 * v112];
        uint64_t v138 = *(void *)v136;
        uint64_t v137 = *((void *)v136 + 1);
        BOOL v123 = __OFSUB__(v137, v138);
        uint64_t v139 = v137 - v138;
        if (v123) {
          goto LABEL_132;
        }
        if (__OFADD__(v134, v139)) {
          goto LABEL_133;
        }
        if (v134 + v139 >= v115)
        {
          BOOL v140 = v115 < v139;
LABEL_94:
          if (v140) {
            unint64_t v112 = v124;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v135) {
          goto LABEL_128;
        }
        v143 = &v110[16 * v112];
        uint64_t v145 = *(void *)v143;
        uint64_t v144 = *((void *)v143 + 1);
        BOOL v123 = __OFSUB__(v144, v145);
        uint64_t v146 = v144 - v145;
        if (v123) {
          goto LABEL_131;
        }
        if (v146 < v134) {
          goto LABEL_21;
        }
LABEL_96:
        unint64_t v151 = v112 - 1;
        if (v112 - 1 >= v37)
        {
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
        if (!v36) {
          goto LABEL_147;
        }
        v152 = v34;
        v153 = &v110[16 * v151];
        uint64_t v154 = *(void *)v153;
        v155 = &v110[16 * v112];
        uint64_t v156 = *((void *)v155 + 1);
        sub_1AD70D184((char *)(v36 + 16 * *(void *)v153), (char *)(v36 + 16 * *(void *)v155), (char *)(v36 + 16 * v156), v179);
        if (v2) {
          goto LABEL_118;
        }
        if (v156 < v154) {
          goto LABEL_121;
        }
        if (v112 > *((void *)v152 + 2)) {
          goto LABEL_122;
        }
        *(void *)v153 = v154;
        *(void *)&v110[16 * v151 + 8] = v156;
        unint64_t v157 = *((void *)v152 + 2);
        if (v112 >= v157) {
          goto LABEL_123;
        }
        uint64_t v34 = v152;
        unint64_t v37 = v157 - 1;
        memmove(&v110[16 * v112], v155 + 16, 16 * (v157 - 1 - v112));
        *((void *)v152 + 2) = v157 - 1;
        uint64_t v36 = v181;
        if (v157 <= 2) {
          goto LABEL_21;
        }
      }
    }
    unint64_t v37 = 1;
LABEL_21:
    uint64_t v6 = (uint64_t)v177;
    uint64_t v35 = v180;
    if (v180 >= (uint64_t)v177) {
      goto LABEL_107;
    }
  }
  if (__OFADD__(v38, v171)) {
    goto LABEL_142;
  }
  if (v38 + v171 >= v6) {
    v85 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v6;
  }
  else {
    v85 = (void (*)(char *, uint64_t, uint64_t, uint64_t))(v38 + v171);
  }
  if ((uint64_t)v85 >= v38)
  {
    if ((void (*)(char *, uint64_t, uint64_t, uint64_t))v39 != v85)
    {
      v169 = v34;
      uint64_t v172 = v2;
      uint64_t v86 = v167 + 16 * v39;
      v175 = v85;
      do
      {
        long long v88 = *(_OWORD *)(v36 + 16 * v39);
        uint64_t v89 = v38;
        uint64_t v178 = v86;
        uint64_t v180 = v39;
        while (1)
        {
          long long v182 = v88;
          uint64_t v90 = *(void *)(v86 + 8);
          uint64_t v91 = swift_getObjectType();
          uint64_t v92 = *((void *)&v182 + 1);
          v93 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v182 + 1) + 24);
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          v94 = (void *)v93(v91, v92);
          id v95 = objc_msgSend(v94, sel_displayName);

          uint64_t v96 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v98 = v97;

          uint64_t v185 = v96;
          uint64_t v186 = v98;
          uint64_t v99 = swift_getObjectType();
          v100 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v90 + 24))(v99, v90);
          id v101 = objc_msgSend(v100, sel_displayName);

          uint64_t v102 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v104 = v103;

          uint64_t v183 = v102;
          uint64_t v184 = v104;
          uint64_t v105 = sub_1AD73A6A0();
          uint64_t v106 = (uint64_t)v187;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v187, 1, 1, v105);
          sub_1AD20F9FC();
          uint64_t v107 = sub_1AD740460();
          sub_1AD70DF0C(v106, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78]);
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          if (v107 != -1) {
            break;
          }
          uint64_t v87 = v180;
          uint64_t v36 = v181;
          if (!v181) {
            goto LABEL_146;
          }
          long long v88 = *(_OWORD *)(v86 + 16);
          *(_OWORD *)(v86 + 16) = *(_OWORD *)v86;
          *(_OWORD *)uint64_t v86 = v88;
          v86 -= 16;
          if (v87 == ++v89) {
            goto LABEL_50;
          }
        }
        uint64_t v87 = v180;
        uint64_t v36 = v181;
LABEL_50:
        uint64_t v39 = v87 + 1;
        uint64_t v86 = v178 + 16;
        uint64_t v38 = v176;
      }
      while ((void (*)(char *, uint64_t, uint64_t, uint64_t))v39 != v175);
      uint64_t v39 = (uint64_t)v175;
      uint64_t v2 = v172;
      uint64_t v34 = v169;
    }
    goto LABEL_57;
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
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  uint64_t result = sub_1AD7408A0();
  __break(1u);
  return result;
}

uint64_t sub_1AD70D184(char *a1, char *a2, char *a3, char *a4)
{
  sub_1AD70DEA8(0, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  unint64_t v66 = a3;
  uint64_t v67 = (char *)&v61 - v9;
  uint64_t v10 = a2 - a1;
  uint64_t v11 = a2 - a1 + 15;
  if (a2 - a1 >= 0) {
    uint64_t v11 = a2 - a1;
  }
  uint64_t v12 = v11 >> 4;
  uint64_t v13 = a3 - a2;
  uint64_t v14 = v13 / 16;
  uint64_t v75 = a1;
  id v74 = a4;
  if (v11 >> 4 >= v13 / 16)
  {
    if (v13 < -15) {
      goto LABEL_43;
    }
    if (a4 != a2 || &a2[16 * v14] <= a4) {
      memmove(a4, a2, 16 * v14);
    }
    uint64_t v36 = &a4[16 * v14];
    uint64_t v73 = v36;
    uint64_t v75 = a2;
    if (v13 < 16 || a1 >= a2) {
      goto LABEL_42;
    }
    unint64_t v37 = v66 - 16;
    uint64_t v38 = a2;
    uint64_t v62 = a4;
    id v68 = a1;
    while (1)
    {
      unint64_t v66 = a2;
      uint64_t v64 = v36;
      uint64_t v65 = v37 + 16;
      uint64_t v40 = *((void *)v36 - 1);
      v36 -= 16;
      uint64_t v63 = v38 - 16;
      uint64_t v41 = *((void *)v38 - 1);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t))(v40 + 24);
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      id v44 = (void *)v43(ObjectType, v40);
      id v45 = objc_msgSend(v44, sel_displayName);

      uint64_t v46 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      uint64_t v48 = v47;

      uint64_t v71 = v46;
      uint64_t v72 = v48;
      uint64_t v49 = swift_getObjectType();
      uint64_t v50 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 24))(v49, v41);
      id v51 = objc_msgSend(v50, sel_displayName);

      uint64_t v52 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      uint64_t v54 = v53;

      uint64_t v69 = v52;
      uint64_t v70 = v54;
      uint64_t v55 = sub_1AD73A6A0();
      uint64_t v56 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v67, 1, 1, v55);
      sub_1AD20F9FC();
      uint64_t v57 = sub_1AD740460();
      sub_1AD70DF0C(v56, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78]);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      if (v57 == -1) {
        break;
      }
      uint64_t v73 = v36;
      uint64_t v58 = v66;
      if (v65 < v64 || v37 >= v64)
      {
        *(_OWORD *)unint64_t v37 = *(_OWORD *)v36;
        uint64_t v38 = v58;
        goto LABEL_29;
      }
      unint64_t v59 = (unint64_t)v62;
      uint64_t v39 = v68;
      if (v65 != v64) {
        *(_OWORD *)unint64_t v37 = *(_OWORD *)v36;
      }
      uint64_t v38 = v58;
      if ((unint64_t)v36 <= v59) {
        goto LABEL_42;
      }
LABEL_30:
      v37 -= 16;
      a2 = v38;
      if (v38 <= v39) {
        goto LABEL_42;
      }
    }
    uint64_t v36 = v64;
    uint64_t v38 = v63;
    if (v65 != v66 || v37 >= v66) {
      *(_OWORD *)unint64_t v37 = *(_OWORD *)v63;
    }
    uint64_t v75 = v38;
LABEL_29:
    uint64_t v39 = v68;
    if (v36 <= v62) {
      goto LABEL_42;
    }
    goto LABEL_30;
  }
  if (v10 >= -15)
  {
    if (a4 != a1 || &a1[16 * v12] <= a4) {
      memmove(a4, a1, 16 * v12);
    }
    uint64_t v65 = &a4[16 * v12];
    uint64_t v73 = v65;
    if (v10 >= 16 && a2 < v66)
    {
      do
      {
        id v68 = a1;
        uint64_t v15 = *((void *)a2 + 1);
        uint64_t v16 = a2;
        uint64_t v17 = *((void *)a4 + 1);
        uint64_t v18 = swift_getObjectType();
        uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 24);
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        id v20 = (void *)v19(v18, v15);
        id v21 = objc_msgSend(v20, sel_displayName);

        uint64_t v22 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
        uint64_t v24 = v23;

        uint64_t v71 = v22;
        uint64_t v72 = v24;
        uint64_t v25 = swift_getObjectType();
        id v26 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v25, v17);
        id v27 = objc_msgSend(v26, sel_displayName);

        uint64_t v28 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
        uint64_t v30 = v29;

        uint64_t v69 = v28;
        uint64_t v70 = v30;
        uint64_t v31 = sub_1AD73A6A0();
        uint64_t v32 = (uint64_t)v67;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v67, 1, 1, v31);
        sub_1AD20F9FC();
        uint64_t v33 = sub_1AD740460();
        sub_1AD70DF0C(v32, (unint64_t *)&qword_1EB7392C8, MEMORY[0x1E4F27A78]);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        if (v33 == -1)
        {
          uint64_t v35 = v16 + 16;
          uint64_t v34 = v68;
          if (v68 < v16 || v68 >= v35 || v68 != v16) {
            *(_OWORD *)id v68 = *(_OWORD *)v16;
          }
        }
        else
        {
          uint64_t v34 = v68;
          if (v68 != a4) {
            *(_OWORD *)id v68 = *(_OWORD *)a4;
          }
          a4 += 16;
          id v74 = a4;
          uint64_t v35 = v16;
        }
        a1 = v34 + 16;
        uint64_t v75 = a1;
        if (a4 >= v65) {
          break;
        }
        a2 = v35;
      }
      while (v35 < v66);
    }
LABEL_42:
    sub_1AD6E149C((void **)&v75, (const void **)&v74, &v73);
    return 1;
  }
LABEL_43:
  uint64_t result = sub_1AD740940();
  __break(1u);
  return result;
}

uint64_t sub_1AD70D810(unint64_t a1, uint64_t a2, void *a3)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1AD7408D0();
    if (v5) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_15;
  }
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
LABEL_25:
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  uint64_t v7 = (void *)MEMORY[0x1E4FBC860];
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v8 = (id)MEMORY[0x1B3E669F0](v6, a1);
    }
    else {
      id v8 = *(id *)(a1 + 8 * v6 + 32);
    }
    uint64_t v9 = v8;
    sub_1AD1FFE38(a2, (uint64_t)v28);
    type metadata accessor for DataTypesWithHighlightsDataSource(0);
    swift_allocObject();
    id v10 = v9;
    uint64_t v11 = sub_1AD709DC0(v10, v28, a3);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_1AD51D650(0, v7[2] + 1, 1, v7);
    }
    unint64_t v13 = v7[2];
    unint64_t v12 = v7[3];
    if (v13 >= v12 >> 1) {
      uint64_t v7 = sub_1AD51D650((void *)(v12 > 1), v13 + 1, 1, v7);
    }
    ++v6;
    v7[2] = v13 + 1;
    uint64_t v14 = &v7[2 * v13];
    v14[4] = v11;
    v14[5] = &off_1F043EA10;
  }
  while (v5 != v6);
  swift_bridgeObjectRelease();
LABEL_16:
  if (qword_1EB732818 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1AD73A1D0();
  uint64_t v17 = v16;
  id v18 = objc_msgSend(self, sel_menstrualFlowType, 0xEB00000000736E6FLL);
  if (!v18) {
    goto LABEL_25;
  }
  uint64_t v19 = v18;
  sub_1AD1FFE38(a2, (uint64_t)v28);
  type metadata accessor for HighlightSearchItemDataSource(0);
  swift_allocObject();
  sub_1AD70AF7C(v15, v17, v19, v28, a3);
  uint64_t v21 = v20;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v7 = sub_1AD51D650(0, v7[2] + 1, 1, v7);
  }
  unint64_t v23 = v7[2];
  unint64_t v22 = v7[3];
  if (v23 >= v22 >> 1) {
    uint64_t v7 = sub_1AD51D650((void *)(v22 > 1), v23 + 1, 1, v7);
  }
  v7[2] = v23 + 1;
  uint64_t v24 = &v7[2 * v23];
  v24[4] = v21;
  void v24[5] = &off_1F043E9B8;
  v28[0] = v7;
  swift_bridgeObjectRetain();
  sub_1AD708730(v28);
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_1AD26519C((uint64_t)v28[0]);
  swift_release();
  return v25;
}

uint64_t sub_1AD70DB90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18HealthExperienceUI33AllHighlightsByCategoryDataSource_healthExperienceStore;
  swift_beginAccess();
  return sub_1AD1FFE38(v3, a2);
}

uint64_t method lookup function for AllHighlightsByCategoryViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AllHighlightsByCategoryViewController);
}

uint64_t dispatch thunk of AllHighlightsByCategoryViewController.__allocating_init(healthExperienceStore:healthStore:provenance:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t sub_1AD70DC18()
{
  return type metadata accessor for AllHighlightsByCategoryDataSource(0);
}

uint64_t sub_1AD70DC20()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for AllHighlightsByCategoryDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AllHighlightsByCategoryDataSource);
}

uint64_t dispatch thunk of AllHighlightsByCategoryDataSource.healthExperienceStore.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of AllHighlightsByCategoryDataSource.healthExperienceStore.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of AllHighlightsByCategoryDataSource.healthExperienceStore.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of AllHighlightsByCategoryDataSource.__allocating_init(displayCategories:healthExperienceStore:healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t type metadata accessor for DataTypesWithHighlightsDataSource(uint64_t a1)
{
  return sub_1AD20CA30(a1, (uint64_t *)&unk_1E9A343D8);
}

uint64_t sub_1AD70DD50()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for HighlightSearchItemDataSource(uint64_t a1)
{
  return sub_1AD20CA30(a1, (uint64_t *)&unk_1E9A34410);
}

uint64_t sub_1AD70DDB8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1AD70DE18()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD70DE58()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1AD70DEA8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1AD70DF0C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1AD70DEA8(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1AD70DF7C()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

uint64_t sub_1AD70DFCC(uint64_t a1, uint64_t a2)
{
  return sub_1AD70B584(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), v2 + 48);
}

uint64_t sub_1AD70DFDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1AD70E024(uint64_t a1)
{
  return a1;
}

uint64_t sub_1AD70E06C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1AD70E0C4(void *a1)
{
  sub_1AD70BED8(a1, (uint64_t *)(v1 + 16), v1 + 64);
}

uint64_t sub_1AD70E0D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AD70E11C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

uint64_t sub_1AD70E15C(uint64_t a1, uint64_t a2)
{
  return sub_1AD70A448(a1, a2, *(void **)(v2 + 16), v2 + 24);
}

uint64_t sub_1AD70E168()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

void sub_1AD70E1B0(void *a1)
{
  sub_1AD70ACF4(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), v1 + 32);
}

uint64_t HeaderDescriptionDataSource.__allocating_init()()
{
  return HeaderDescriptionDataSource.init()();
}

uint64_t HeaderDescriptionDataSource.init()()
{
  *(void *)(v0 + OBJC_IVAR____TtC18HealthExperienceUI27HeaderDescriptionDataSource_notificationCancellable) = 0;
  sub_1AD70E2D0(v11);
  uint64_t v1 = v11[0];
  uint64_t v2 = v11[1];
  uint64_t v3 = v13;
  uint64_t v4 = v14;
  sub_1AD1FDCAC(0, (unint64_t *)&qword_1EB739250, (uint64_t)&type metadata for ArrayDataSourceSection, MEMORY[0x1E4FBBE00]);
  long long v10 = v12;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AD74C370;
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  *(_OWORD *)(inited + 48) = v10;
  *(void *)(inited + 64) = v3;
  *(void *)(inited + 72) = v4;
  uint64_t v6 = sub_1AD1FBF24();
  uint64_t v8 = MutableArrayDataSource.init(arrangedSections:identifier:)(inited, v6, v7);
  swift_retain();
  sub_1AD70EBBC();
  swift_release();
  return v8;
}

void sub_1AD70E2D0(void *a1@<X8>)
{
  uint64_t v2 = sub_1AD73A670();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  if (objc_msgSend(v6, sel_hasPairedWatch))
  {
    if (qword_1EB732818 != -1) {
      swift_once();
    }
  }
  else if (qword_1EB732818 != -1)
  {
    swift_once();
  }
  uint64_t v58 = sub_1AD73A1D0();
  uint64_t v8 = v7;
  id v9 = objc_msgSend(self, sel_sharedInstance);
  id v65 = objc_msgSend(v9, sel_getActivePairedDevice);
  if (qword_1EB732818 != -1) {
    swift_once();
  }
  sub_1AD73A1D0();
  id v10 = objc_msgSend(v6, sel_currentDeviceDisplayName);
  uint64_t v63 = v3;
  uint64_t v64 = v2;
  uint64_t v61 = a1;
  uint64_t v62 = v5;
  uint64_t v59 = v8;
  id v60 = v9;
  if (!v10)
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    goto LABEL_23;
  }
  uint64_t v11 = v10;
  uint64_t v57 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  uint64_t v13 = v12;

  if (!v65)
  {
    long long v67 = 0u;
    long long v68 = 0u;
LABEL_19:
    uint64_t v25 = v13;
    sub_1AD1F65C4((uint64_t)&v67);
LABEL_21:
    uint64_t v26 = MEMORY[0x1E4FBB1A0];
    sub_1AD73A1D0();
    sub_1AD21E15C(0, (unint64_t *)&qword_1EB73F8F0, (unint64_t *)&qword_1EB73F910);
    uint64_t v27 = swift_allocObject();
    long long v56 = xmmword_1AD74C370;
    *(_OWORD *)(v27 + 16) = xmmword_1AD74C370;
    *(void *)(v27 + 56) = v26;
    unint64_t v28 = sub_1AD21FDC0();
    *(void *)(v27 + 64) = v28;
    *(void *)(v27 + 32) = v57;
    *(void *)(v27 + 40) = v25;
    uint64_t v29 = sub_1AD73F190();
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = v56;
    *(void *)(v32 + 56) = v26;
    *(void *)(v32 + 64) = v28;
    *(void *)(v32 + 32) = v29;
    *(void *)(v32 + 40) = v31;
    goto LABEL_22;
  }
  if (objc_msgSend(v65, sel_valueForProperty_, *MEMORY[0x1E4F79E08]))
  {
    sub_1AD7404B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v66, 0, sizeof(v66));
  }
  sub_1AD1EB55C((uint64_t)v66, (uint64_t)&v67);
  if (!*((void *)&v68 + 1)) {
    goto LABEL_19;
  }
  uint64_t v16 = MEMORY[0x1E4FBB1A0];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v25 = v13;
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  long long v17 = v66[0];
  sub_1AD73A1D0();
  sub_1AD21E15C(0, (unint64_t *)&qword_1EB73F8F0, (unint64_t *)&qword_1EB73F910);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1AD74C350;
  *(void *)(v18 + 56) = v16;
  uint64_t v19 = v16;
  unint64_t v20 = sub_1AD21FDC0();
  *(void *)(v18 + 32) = v57;
  *(void *)(v18 + 40) = v13;
  *(void *)(v18 + 96) = v19;
  *(void *)(v18 + 104) = v20;
  *(void *)(v18 + 64) = v20;
  *(_OWORD *)(v18 + 72) = v17;
  uint64_t v21 = sub_1AD73F190();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD73A1D0();
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1AD74C370;
  *(void *)(v24 + 56) = v19;
  *(void *)(v24 + 64) = v20;
  *(void *)(v24 + 32) = v21;
  *(void *)(v24 + 40) = v23;
LABEL_22:
  uint64_t v14 = sub_1AD73F190();
  unint64_t v15 = v33;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_23:
  type metadata accessor for HeaderDescriptionDataSource();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v35 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v36 = (void *)sub_1AD73F180();
  id v37 = objc_msgSend(self, sel_imageNamed_inBundle_, v36, v35);

  if (v37)
  {
    uint64_t v38 = sub_1AD73A1D0();
    uint64_t v40 = v39;
    *(void *)&long long v67 = type metadata accessor for CenteredIconDescriptionCollectionViewCell();
    sub_1AD7095AC();
    uint64_t v41 = sub_1AD73F220();
    uint64_t v43 = v42;
    sub_1AD21E15C(0, (unint64_t *)&qword_1EB73F8D0, (unint64_t *)&qword_1EB73E870);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_1AD74C370;
    *(void *)(v44 + 56) = &type metadata for CenteredIconDescriptionItem;
    *(void *)(v44 + 64) = sub_1AD536150();
    id v45 = (void *)swift_allocObject();
    *(void *)(v44 + 32) = v45;
    v45[2] = v41;
    void v45[3] = v43;
    v45[4] = v37;
    v45[5] = v38;
    uint64_t v46 = v58;
    uint64_t v47 = v59;
    v45[6] = v40;
    v45[7] = v46;
    v45[8] = v47;
    v45[9] = v14;
    v45[10] = v15;
    swift_bridgeObjectRetain();
    id v48 = v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v49 = v62;
    sub_1AD73A660();
    uint64_t v50 = sub_1AD73A620();
    uint64_t v52 = v51;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v49, v64);
    sub_1AD1FBD54(MEMORY[0x1E4FBC860]);
    uint64_t v53 = swift_bridgeObjectRetain();
    uint64_t v54 = Array<A>.identifierToIndexDict()(v53);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v55 = v61;
    *uint64_t v61 = 0;
    v55[1] = 0;
    long long v55[2] = v44;
    v55[3] = v54;
    v55[4] = v50;
    v55[5] = v52;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1AD70EB18()
{
  sub_1AD1FDCAC(0, (unint64_t *)&qword_1EB739250, (uint64_t)&type metadata for ArrayDataSourceSection, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AD74C370;
  sub_1AD70E2D0((void *)(inited + 32));
  sub_1AD387158(inited, 1);
  swift_setDeallocating();
  return swift_arrayDestroy();
}

uint64_t sub_1AD70EBBC()
{
  uint64_t v1 = v0;
  sub_1AD70F324();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v19 = v2;
  uint64_t v20 = v3;
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1AD73FDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v18 - v11;
  sub_1AD70F4B8(&qword_1E9A34450, (void (*)(uint64_t))type metadata accessor for HeaderDescriptionDataSource);
  uint64_t v13 = sub_1AD73BE50();
  id v14 = objc_msgSend(self, sel_defaultCenter);
  sub_1AD73FDD0();

  uint64_t v21 = v13;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  sub_1AD70F410();
  sub_1AD70F4B8(&qword_1E9A34448, (void (*)(uint64_t))sub_1AD70F410);
  sub_1AD70F4B8(&qword_1EB7402A0, MEMORY[0x1E4F27FC8]);
  swift_retain();
  sub_1AD73D8C0();
  swift_allocObject();
  swift_weakInit();
  sub_1AD70F4B8(&qword_1E9A34458, (void (*)(uint64_t))sub_1AD70F324);
  uint64_t v15 = v19;
  uint64_t v16 = sub_1AD73DE20();
  swift_release();
  *(void *)(v1 + OBJC_IVAR____TtC18HealthExperienceUI27HeaderDescriptionDataSource_notificationCancellable) = v16;
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_1AD70EF68()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1AD70EB18();
    return swift_release();
  }
  return result;
}

void HeaderDescriptionDataSource.__allocating_init(arrangedSections:identifier:)()
{
}

void HeaderDescriptionDataSource.init(arrangedSections:identifier:)()
{
}

uint64_t sub_1AD70F020()
{
  return swift_release();
}

uint64_t HeaderDescriptionDataSource.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_snapshot;
  sub_1AD20E2C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t HeaderDescriptionDataSource.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_snapshot;
  sub_1AD20E2C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

void *HeaderDescriptionDataSource.layout(for:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (qword_1EB73FD20 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for ListLayoutConfiguration();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB73EE48);
  return ListLayoutConfiguration.layout(for:)(v1);
}

uint64_t sub_1AD70F260()
{
  return type metadata accessor for HeaderDescriptionDataSource();
}

uint64_t type metadata accessor for HeaderDescriptionDataSource()
{
  uint64_t result = qword_1E9A34428;
  if (!qword_1E9A34428) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AD70F2B4()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for HeaderDescriptionDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HeaderDescriptionDataSource);
}

uint64_t dispatch thunk of HeaderDescriptionDataSource.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 512))();
}

void sub_1AD70F324()
{
  if (!qword_1E9A34438)
  {
    sub_1AD70F410();
    sub_1AD73FDC0();
    sub_1AD70F4B8(&qword_1E9A34448, (void (*)(uint64_t))sub_1AD70F410);
    sub_1AD70F4B8(&qword_1EB7402A0, MEMORY[0x1E4F27FC8]);
    unint64_t v0 = sub_1AD73D8B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34438);
    }
  }
}

void sub_1AD70F410()
{
  if (!qword_1E9A34440)
  {
    sub_1AD739E80();
    unint64_t v0 = sub_1AD73D9F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34440);
    }
  }
}

uint64_t sub_1AD70F478()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1AD70F4B0()
{
  return sub_1AD70EF68();
}

uint64_t sub_1AD70F4B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AD70F500()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD70F558(uint64_t a1, void *a2)
{
  sub_1AD1EF2DC(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1AD205C2C((uint64_t)v5, v3);
  swift_endAccess();
  sub_1AD70F5E4();
  return sub_1AD206D18((uint64_t)v5, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

uint64_t sub_1AD70F5E4()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_1AD73CBA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1AD73A600();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t)v1 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1AD1EF2DC(v10, (uint64_t)v30);
  if (v31)
  {
    sub_1AD2196B8(0, (unint64_t *)&qword_1EB73E870);
    sub_1AD2196B8(0, &qword_1E9A34478);
    if (swift_dynamicCast())
    {
      if (*((void *)&v33 + 1))
      {
        sub_1AD20FE90(&v32, (uint64_t)v35);
        uint64_t v11 = v36;
        uint64_t v12 = v37;
        __swift_project_boxed_opaque_existential_1(v35, v36);
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
        id v13 = sub_1AD70FC44();
        id v14 = (void *)sub_1AD73A590();
        objc_msgSend(v13, sel_setDate_animated_, v14, 0);

        uint64_t v15 = v36;
        uint64_t v16 = v37;
        __swift_project_boxed_opaque_existential_1(v35, v36);
        (*(void (**)(void *, char *, uint64_t, uint64_t))(v16 + 16))(v1, v9, v15, v16);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
      }
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
    }
  }
  else
  {
    sub_1AD206D18((uint64_t)v30, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 0;
  }
  sub_1AD206D18((uint64_t)&v32, &qword_1E9A34470, &qword_1E9A34478);
  sub_1AD73CAE0();
  id v18 = v1;
  uint64_t v19 = sub_1AD73CB80();
  os_log_type_t v20 = sub_1AD73F920();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v35[0] = v22;
    *(_DWORD *)uint64_t v21 = 136446722;
    uint64_t v29 = v2;
    uint64_t v23 = sub_1AD740E30();
    *(void *)&long long v32 = sub_1AD1F62D4(v23, v24, v35);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2082;
    *(void *)&long long v32 = sub_1AD1F62D4(1835365481, 0xE400000000000000, v35);
    sub_1AD7403B0();
    *(_WORD *)(v21 + 22) = 2082;
    sub_1AD1DE498(0, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
    *(void *)&long long v32 = v25;
    sub_1AD324E84();
    uint64_t v26 = sub_1AD73F220();
    *(void *)&long long v32 = sub_1AD1F62D4(v26, v27, v35);
    sub_1AD7403B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD1A4000, v19, v20, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that did not conform to CalendarPickerTableViewCellDataSource", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v22, -1, -1);
    MEMORY[0x1B3E68450](v21, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v29);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_1AD70FAD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  return sub_1AD1EF2DC(v3, a1);
}

uint64_t sub_1AD70FB28(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1AD205C2C(a1, v3);
  swift_endAccess();
  sub_1AD70F5E4();
  return sub_1AD206D18(a1, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

uint64_t (*sub_1AD70FBB0(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1AD70FC10;
}

uint64_t sub_1AD70FC10(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_1AD70F5E4();
  }
  return result;
}

id sub_1AD70FC44()
{
  uint64_t v1 = OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell____lazy_storage___picker;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell____lazy_storage___picker);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell____lazy_storage___picker);
  }
  else
  {
    id v4 = sub_1AD70FCA8(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1AD70FCA8(uint64_t a1)
{
  uint64_t v18 = a1;
  uint64_t v1 = sub_1AD73A770();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  id v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1AD73A600();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB16B0]), sel_init);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v9, sel_setPreferredDatePickerStyle_, 3);
  objc_msgSend(v9, sel_setDatePickerMode_, 1);
  sub_1AD73A5F0();
  uint64_t v10 = (void *)sub_1AD73A590();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v6 + 8);
  v11(v8, v5);
  objc_msgSend(v9, sel_setMaximumDate_, v10);

  uint64_t v12 = self;
  sub_1AD73A740();
  id v13 = (void *)sub_1AD73A6F0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v14 = objc_msgSend(v12, sel_hk_minimumDateForBirthDateWithCalendar_, v13);

  sub_1AD73A5D0();
  uint64_t v15 = (void *)sub_1AD73A590();
  v11(v8, v5);
  objc_msgSend(v9, sel_setMinimumDate_, v15);

  objc_msgSend(v9, sel_addTarget_action_forControlEvents_, v18, sel_pickerDateChanged_, 4096);
  return v9;
}

id CalendarPickerTableViewCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  if (a3)
  {
    uint64_t v6 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id CalendarPickerTableViewCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = &v3[OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)&v3[OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell____lazy_storage___picker] = 0;
  if (a3)
  {
    uint64_t v6 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for CalendarPickerTableViewCell();
  id v7 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_, a1, v6);

  id v8 = v7;
  id v9 = objc_msgSend(v8, sel_contentView);
  id v10 = sub_1AD70FC44();
  objc_msgSend(v9, sel_addSubview_, v10);

  id v11 = sub_1AD70FC44();
  id v12 = objc_msgSend(v8, sel_contentView);
  objc_msgSend(v11, sel_hk_alignConstraintsWithView_, v12);

  return v8;
}

uint64_t type metadata accessor for CalendarPickerTableViewCell()
{
  return self;
}

uint64_t sub_1AD7101EC(void *a1)
{
  uint64_t v3 = sub_1AD73A600();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  uint64_t v7 = v1 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1AD1EF2DC(v7, (uint64_t)v13);
  if (v14)
  {
    sub_1AD2196B8(0, (unint64_t *)&qword_1EB73E870);
    sub_1AD2196B8(0, &qword_1E9A34478);
    if (swift_dynamicCast())
    {
      uint64_t v8 = *((void *)&v16 + 1);
      if (*((void *)&v16 + 1))
      {
        uint64_t v9 = v17;
        __swift_project_boxed_opaque_existential_1(&v15, *((uint64_t *)&v16 + 1));
        id v10 = objc_msgSend(a1, sel_date);
        sub_1AD73A5D0();

        (*(void (**)(uint64_t, unsigned char *, uint64_t, uint64_t))(v9 + 16))(v1, v6, v8, v9);
        (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
      }
    }
    else
    {
      uint64_t v17 = 0;
      long long v15 = 0u;
      long long v16 = 0u;
    }
  }
  else
  {
    sub_1AD206D18((uint64_t)v13, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v17 = 0;
  }
  return sub_1AD206D18((uint64_t)&v15, &qword_1E9A34470, &qword_1E9A34478);
}

id CalendarPickerTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalendarPickerTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AD710514@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  return sub_1AD1EF2DC(v3, a2);
}

uint64_t dispatch thunk of CalendarPickerTableViewCellDataSource.initialDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCellDataSource.calendarPicker(_:didSelectNewDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for CalendarPickerTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CalendarPickerTableViewCell);
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t sub_1AD71064C@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v24 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  uint64_t v25 = v6;
  sub_1AD73F300();
  id v7 = objc_msgSend(a1, sel_objectType);
  id v8 = objc_msgSend(v7, sel_identifier);

  _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  sub_1AD73F300();
  swift_bridgeObjectRelease();
  uint64_t v10 = v24;
  uint64_t v9 = v25;
  swift_bridgeObjectRetain();
  id v11 = objc_msgSend(a1, sel_localization);
  id v12 = objc_msgSend(v11, sel_titleEmbeddedDisplayName);

  uint64_t v13 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  uint64_t v15 = v14;

  swift_bridgeObjectRetain();
  id v16 = objc_msgSend(a1, sel_localization);
  id v17 = objc_msgSend(v16, sel_summary);

  if (v17)
  {
    uint64_t v18 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    unint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v20 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  DataTypeDescriptionAttribution.init(displayType:mode:)(a1, a2, (uint64_t)&v24);
  uint64_t v21 = v24;
  char v22 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v13;
  *(void *)(a3 + 8) = v15;
  *(void *)(a3 + 16) = v18;
  *(void *)(a3 + 24) = v20;
  *(void *)(a3 + 32) = v21;
  *(unsigned char *)(a3 + 40) = v22;
  *(void *)(a3 + 48) = v10;
  *(void *)(a3 + 56) = v9;
  return result;
}

uint64_t destroy for StandardDataTypeDescriptionProvider(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StandardDataTypeDescriptionProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StandardDataTypeDescriptionProvider(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 32);
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for StandardDataTypeDescriptionProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for StandardDataTypeDescriptionProvider()
{
  return &type metadata for StandardDataTypeDescriptionProvider;
}

id sub_1AD710A0C@<X0>(uint64_t a1@<X8>)
{
  objc_super v2 = *(void **)(v1 + 32);
  char v3 = *(unsigned char *)(v1 + 40);
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  return v2;
}

unint64_t DataTypeDetailFactoryFailure.localizedDescription.getter()
{
  unint64_t result = 0xD00000000000004FLL;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      sub_1AD740680();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0x20656C646E7542;
      sub_1AD73F300();
      goto LABEL_5;
    case 2:
      sub_1AD740680();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD000000000000010;
      goto LABEL_5;
    case 3:
      return result;
    default:
      sub_1AD740680();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD00000000000001DLL;
LABEL_5:
      sub_1AD73F300();
      return v2;
  }
}

uint64_t dispatch thunk of DataTypeDetailFactory.makeViewController(hkType:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1AD710BA8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for DataTypeDetailFactoryFailure(uint64_t a1)
{
  return sub_1AD710BD0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1AD710BD0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18HealthExperienceUI28DataTypeDetailFactoryFailureOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1AD710BA8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DataTypeDetailFactoryFailure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1AD710BA8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1AD710BD0(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DataTypeDetailFactoryFailure(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1AD710BD0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataTypeDetailFactoryFailure(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DataTypeDetailFactoryFailure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1AD710D60(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1AD710D78(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataTypeDetailFactoryFailure()
{
  return &type metadata for DataTypeDetailFactoryFailure;
}

uint64_t HKElectrocardiogramType.prefersMostRecentSampleSummaryDetailView.getter()
{
  return 1;
}

void *PlatformConfigurationProvider.init()()
{
  v0[2] = (*(uint64_t (**)(void))(*(void *)(*v0 + 88) + 24))();
  return v0;
}

uint64_t sub_1AD710E14()
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)v0 + 88) + 64))(*(void *)(*(void *)v0 + 80));
}

uint64_t (*sub_1AD710E78(void *a1))(void *a1, char a2)
{
  a1[2] = v1;
  *a1 = (*(uint64_t (**)(void))(*(void *)(*(void *)v1 + 88) + 64))(*(void *)(*(void *)v1 + 80));
  a1[1] = v3;
  return sub_1AD710F04;
}

uint64_t sub_1AD710F04(void *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(*(void *)v3 + 88) + 72))(*a1, v2, *(void *)(*(void *)v3 + 80));
  }
  uint64_t v4 = *(void *)(*(void *)v3 + 88);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 72);
  uint64_t v6 = *(void *)(*(void *)v3 + 80);
  uint64_t v7 = swift_unknownObjectRetain();
  v5(v7, v2, v6, v4);
  return swift_unknownObjectRelease();
}

uint64_t sub_1AD711014(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(*(void *)v1 + 88) + 40))(a1, *(void *)(*(void *)v1 + 80));
}

uint64_t sub_1AD711078()
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)v0 + 88) + 48))(*(void *)(*(void *)v0 + 80));
}

uint8_t *sub_1AD7110DC(uint64_t a1)
{
  uint64_t v32 = a1;
  uint64_t v27 = *v1;
  uint64_t v28 = v2;
  uint64_t v3 = sub_1AD73CBA0();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v29 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v27 + 88);
  uint64_t v6 = *(void *)(v27 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unsigned __int8 v8 = (uint8_t *)sub_1AD740340();
  uint64_t v9 = *((void *)v8 - 1);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v26 - v10;
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v26 - v14;
  sub_1AD1FFE38(v32, (uint64_t)v33);
  sub_1AD1DE5A4();
  char v16 = swift_dynamicCast();
  id v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  if (v16)
  {
    v17(v11, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v11, AssociatedTypeWitness);
    unsigned __int8 v8 = (uint8_t *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 56))(v15, v6, v5);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, AssociatedTypeWitness);
  }
  else
  {
    v17(v11, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint8_t *))(v9 + 8))(v11, v8);
    uint64_t v18 = v29;
    sub_1AD73CB20();
    unint64_t v19 = sub_1AD73CB80();
    os_log_type_t v20 = sub_1AD73F920();
    if (os_log_type_enabled(v19, v20))
    {
      unsigned __int8 v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v33[0] = v21;
      *(_DWORD *)unsigned __int8 v8 = 136315138;
      uint64_t v22 = sub_1AD740E30();
      v33[6] = sub_1AD1F62D4(v22, v23, v33);
      sub_1AD7403B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v19, v20, "Model for %s is unable to cast to required type", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v21, -1, -1);
      MEMORY[0x1B3E68450](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v31);
    sub_1AD28C918();
    swift_allocError();
    *uint64_t v24 = 0x8000000000000000;
    swift_willThrow();
  }
  return v8;
}

uint64_t PlatformConfigurationProvider.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t PlatformConfigurationProvider.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1AD711594(uint64_t a1)
{
  return sub_1AD711014(a1);
}

uint64_t sub_1AD7115B8()
{
  return sub_1AD711078();
}

uint8_t *sub_1AD7115DC(uint64_t a1)
{
  return sub_1AD7110DC(a1);
}

uint64_t sub_1AD711600@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AD710E14();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1AD71162C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = swift_unknownObjectRetain();
  return sub_1AD209AD0(v2, v1);
}

uint64_t sub_1AD711668()
{
  return 16;
}

__n128 sub_1AD711674(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t method lookup function for PlatformConfigurationProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PlatformConfigurationProvider);
}

uint64_t dispatch thunk of PlatformConfigurationProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PlatformConfigurationProvider.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of PlatformConfigurationProvider.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of PlatformConfigurationProvider.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x1B3E68450);
  }
  return result;
}

uint64_t sub_1AD71176C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1AD71178C, 0, 0);
}

uint64_t sub_1AD71178C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD74C370;
  *(void *)(v2 + 56) = v1;
  *(void *)(v2 + 64) = &protocol witness table for PDFSpacer;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t PDFRenderableProvider<>.renderables.getter(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_1AD71186C, 0, 0);
}

uint64_t sub_1AD71186C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD74C370;
  long long v6 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 56) = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v2 + 32));
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, v1);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v2);
}

uint64_t sub_1AD711974(uint64_t a1)
{
  *(unsigned char *)(v2 + 48) = *(unsigned char *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(v1 + 16);
  return MEMORY[0x1F4188298](sub_1AD7119A8, 0, 0);
}

uint64_t sub_1AD7119A8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  char v3 = *(unsigned char *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1AD74C370;
  *(void *)(v6 + 56) = v5;
  *(void *)(v6 + 64) = &protocol witness table for PDFFloatingImage;
  uint64_t v7 = swift_allocObject();
  *(void *)(v6 + 32) = v7;
  *(unsigned char *)(v7 + 16) = v3;
  *(void *)(v7 + 24) = v4;
  *(void *)(v7 + 32) = v2;
  *(void *)(v7 + 40) = v1;
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v8 = v4;
  return v10(v6);
}

uint64_t sub_1AD711ABC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(v1 + 1);
  return MEMORY[0x1F4188298](sub_1AD711AE8, 0, 0);
}

uint64_t sub_1AD711AE8()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFVStackWithFixedWidth;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
  *(void *)(v5 + 48) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  swift_bridgeObjectRetain();
  return v7(v5);
}

uint64_t sub_1AD711BD8(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)v1;
  *(void *)(v2 + 40) = *(void *)(v1 + 16);
  return MEMORY[0x1F4188298](sub_1AD711C08, 0, 0);
}

uint64_t sub_1AD711C08()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v4 = v0[2];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFVerticalSeparator;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
  *(void *)(v5 + 48) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  id v6 = v1;
  return v8(v5);
}

uint64_t sub_1AD711CF8(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x1F4188298](sub_1AD711D1C, 0, 0);
}

uint64_t sub_1AD711D1C()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD74C370;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = &protocol witness table for PDFTable;
  *(void *)(v3 + 32) = v1;
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  swift_retain();
  return v5(v3);
}

uint64_t sub_1AD711DFC(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = a1;
  return MEMORY[0x1F4188298](sub_1AD711E1C, 0, 0);
}

uint64_t sub_1AD711E1C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD74C370;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = &protocol witness table for PDFThreeStringSingleLineHStack;
  uint64_t v4 = swift_allocObject();
  *(void *)(v3 + 32) = v4;
  sub_1AD715138(v1, v4 + 16);
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v3);
}

uint64_t sub_1AD711F0C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1AD711F2C, 0, 0);
}

uint64_t sub_1AD711F2C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD74C370;
  *(void *)(v2 + 56) = v1;
  *(void *)(v2 + 64) = &protocol witness table for PDFColumnBreak;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1AD711FE8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1AD712008, 0, 0);
}

uint64_t sub_1AD712008()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD74C370;
  *(void *)(v2 + 56) = v1;
  *(void *)(v2 + 64) = &protocol witness table for PDFPageBreak;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1AD7120C4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)v1;
  *(unsigned char *)(v2 + 56) = *(unsigned char *)(v1 + 16);
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(v1 + 24);
  return MEMORY[0x1F4188298](sub_1AD7120FC, 0, 0);
}

uint64_t sub_1AD7120FC()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  char v3 = *(unsigned char *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 16);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1AD74C370;
  *(void *)(v7 + 56) = v6;
  *(void *)(v7 + 64) = &protocol witness table for PDFEmptySpace;
  uint64_t v8 = swift_allocObject();
  *(void *)(v7 + 32) = v8;
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v4;
  *(unsigned char *)(v8 + 32) = v3;
  *(void *)(v8 + 40) = v2;
  *(void *)(v8 + 48) = v1;
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v7);
}

uint64_t sub_1AD712208(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = v1[1];
  *(unsigned char *)(v2 + 40) = *((unsigned char *)v1 + 16);
  return MEMORY[0x1F4188298](sub_1AD71223C, 0, 0);
}

uint64_t sub_1AD71223C()
{
  char v1 = *(unsigned char *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFVStack;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 48) = v1;
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
  swift_bridgeObjectRetain();
  return v7(v5);
}

uint64_t sub_1AD712340(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x1F4188298](sub_1AD712364, 0, 0);
}

uint64_t sub_1AD712364()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD74C370;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = &protocol witness table for PDFGrid;
  *(void *)(v3 + 32) = v1;
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  swift_retain();
  return v5(v3);
}

uint64_t Array<A>.collectRenderables.getter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1AD712464, 0, 0);
}

uint64_t sub_1AD712464()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[2];
  v0[3] = v2;
  if (v2)
  {
    uint64_t v3 = MEMORY[0x1E4FBC860];
    v0[4] = 0;
    v0[5] = v3;
    uint64_t v4 = v1 + 4;
    uint64_t v5 = v1[7];
    uint64_t v6 = v1[8];
    swift_bridgeObjectRetain();
    __swift_project_boxed_opaque_existential_1(v4, v5);
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v6 + 8) + **(int **)(v6 + 8));
    uint64_t v7 = (void *)swift_task_alloc();
    v0[6] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1AD71264C;
    return v14(v5, v6);
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    uint64_t v10 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    if (v10)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v11 = (uint64_t *)(v9 + 32);
      do
      {
        uint64_t v12 = *v11++;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1AD260834(v12);
        swift_bridgeObjectRelease();
        --v10;
      }
      while (v10);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = 0;
    }
    uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
    return v13(v9);
  }
}

uint64_t sub_1AD71264C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 56) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1AD7127A0, 0, 0);
  }
}

uint64_t sub_1AD7127A0()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[5];
  if (v1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v2 = (void *)v0[5];
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v2 = sub_1AD51C76C(0, v2[2] + 1, 1, (void *)v0[5]);
    }
    unint64_t v5 = v2[2];
    unint64_t v4 = v2[3];
    if (v5 >= v4 >> 1) {
      uint64_t v2 = sub_1AD51C76C((void *)(v4 > 1), v5 + 1, 1, v2);
    }
    v2[2] = v5 + 1;
    v2[v5 + 4] = v1;
  }
  uint64_t v6 = v0[4] + 1;
  if (v6 == v0[3])
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v2[2];
    if (v7)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v8 = 0;
      uint64_t v9 = MEMORY[0x1E4FBC860];
      do
      {
        uint64_t v10 = v2[v8++ + 4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1AD260834(v10);
        swift_bridgeObjectRelease();
      }
      while (v7 != v8);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = 0;
    }
    char v16 = (uint64_t (*)(uint64_t))v0[1];
    return v16(v9);
  }
  else
  {
    v0[4] = v6;
    v0[5] = v2;
    uint64_t v11 = (void *)(v0[2] + 40 * v6);
    uint64_t v12 = v11[7];
    uint64_t v13 = v11[8];
    __swift_project_boxed_opaque_existential_1(v11 + 4, v12);
    id v17 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v13 + 8) + **(int **)(v13 + 8));
    uint64_t v14 = (void *)swift_task_alloc();
    v0[6] = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_1AD71264C;
    return v17(v12, v13);
  }
}

uint64_t sub_1AD712A10(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = *v1;
  return MEMORY[0x1F4188298](sub_1AD712A38, 0, 0);
}

uint64_t sub_1AD712A38()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[2];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD74C370;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = &protocol witness table for PDFVerticalSpacer;
  *(void *)(v3 + 32) = v1;
  unint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1AD712AFC(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = a1;
  return MEMORY[0x1F4188298](sub_1AD712B1C, 0, 0);
}

uint64_t sub_1AD712B1C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD74C370;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = &protocol witness table for PDFDebugContainer;
  uint64_t v4 = swift_allocObject();
  *(void *)(v3 + 32) = v4;
  sub_1AD59063C(v1, v4 + 16);
  unint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v3);
}

uint64_t sub_1AD712C0C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)v1;
  *(void *)(v2 + 40) = *(void *)(v1 + 16);
  *(void *)(v2 + 48) = *(void *)(v1 + 24);
  return MEMORY[0x1F4188298](sub_1AD712C44, 0, 0);
}

uint64_t sub_1AD712C44()
{
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 40);
  long long v8 = *(_OWORD *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 16);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD74C370;
  *(void *)(v4 + 56) = v3;
  *(void *)(v4 + 64) = &protocol witness table for PDFHorizontalSeparator;
  uint64_t v5 = swift_allocObject();
  *(void *)(v4 + 32) = v5;
  *(_OWORD *)(v5 + 16) = v8;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v1;
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v1;
  return v9(v4);
}

uint64_t sub_1AD712D5C(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = v1[1];
  *(_OWORD *)(v2 + 40) = *((_OWORD *)v1 + 1);
  *(void *)(v2 + 56) = v1[4];
  return MEMORY[0x1F4188298](sub_1AD712D98, 0, 0);
}

uint64_t sub_1AD712D98()
{
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v2 = (void *)v0[6];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v5 = (void *)v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1AD74C370;
  *(void *)(v7 + 56) = v6;
  *(void *)(v7 + 64) = &protocol witness table for PDFBox;
  long long v8 = (void *)swift_allocObject();
  *(void *)(v7 + 32) = v8;
  v8[2] = v5;
  v8[3] = v4;
  v8[4] = v3;
  v8[5] = v2;
  v8[6] = v1;
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  id v9 = v5;
  id v10 = v2;
  return v12(v7);
}

uint64_t sub_1AD712EB8(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(_WORD *)(v2 + 96) = *((_WORD *)v1 + 4);
  uint64_t v4 = v1[3];
  *(void *)(v2 + 32) = v1[2];
  *(void *)(v2 + 40) = v4;
  *(unsigned char *)(v2 + 98) = *((unsigned char *)v1 + 32);
  *(unsigned char *)(v2 + 99) = *((unsigned char *)v1 + 33);
  long long v5 = *(_OWORD *)(v1 + 7);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v1 + 5);
  *(_OWORD *)(v2 + 64) = v5;
  *(void *)(v2 + 80) = v1[9];
  *(void *)(v2 + 88) = v1[10];
  return MEMORY[0x1F4188298](sub_1AD712F18, 0, 0);
}

uint64_t sub_1AD712F18()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 80);
  long long v16 = *(_OWORD *)(v0 + 48);
  long long v17 = *(_OWORD *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 99);
  char v4 = *(unsigned char *)(v0 + 98);
  long long v5 = *(void **)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  __int16 v7 = *(_WORD *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 16);
  long long v8 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1AD74C370;
  *(void *)(v10 + 56) = v9;
  *(void *)(v10 + 64) = &protocol witness table for PDFImage;
  uint64_t v11 = swift_allocObject();
  *(void *)(v10 + 32) = v11;
  *(void *)(v11 + 16) = v8;
  *(_WORD *)(v11 + 24) = v7;
  *(void *)(v11 + 32) = v5;
  *(void *)(v11 + 40) = v6;
  *(unsigned char *)(v11 + 48) = v4;
  *(unsigned char *)(v11 + 49) = v3;
  *(_OWORD *)(v11 + 56) = v16;
  *(_OWORD *)(v11 + 72) = v17;
  *(void *)(v11 + 88) = v2;
  *(void *)(v11 + 96) = v1;
  uint64_t v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v12 = v8;
  id v13 = v5;
  id v14 = v1;
  return v18(v10);
}

uint64_t sub_1AD713088(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  v2[4] = v1[1];
  return MEMORY[0x1F4188298](sub_1AD7130B4, 0, 0);
}

uint64_t sub_1AD7130B4()
{
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD74C370;
  *(void *)(v4 + 56) = v3;
  *(void *)(v4 + 64) = &protocol witness table for PDFHStack;
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v1;
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  swift_bridgeObjectRetain();
  return v6(v4);
}

uint64_t sub_1AD7131A4(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  return MEMORY[0x1F4188298](sub_1AD7131D0, 0, 0);
}

uint64_t sub_1AD7131D0()
{
  char v1 = *(unsigned char *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD74C370;
  *(void *)(v4 + 56) = v3;
  *(void *)(v4 + 64) = &protocol witness table for PDFSeparatedContent;
  *(void *)(v4 + 32) = v2;
  *(unsigned char *)(v4 + 40) = v1;
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  swift_bridgeObjectRetain();
  return v6(v4);
}

uint64_t sub_1AD7132C0(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = a1;
  return MEMORY[0x1F4188298](sub_1AD7132E0, 0, 0);
}

uint64_t sub_1AD7132E0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD74C370;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = &protocol witness table for PDFArticle;
  uint64_t v4 = swift_allocObject();
  *(void *)(v3 + 32) = v4;
  sub_1AD714F6C(v1, v4 + 16);
  long long v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v3);
}

uint64_t Array<A>.render(context:document:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1AD713730(a3);
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(result + 16);
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v19 = result + 32;
    while (1)
    {
      if (v7 == v6)
      {
        long long v23 = 0u;
        long long v24 = 0u;
        unint64_t v7 = v6;
        long long v22 = 0u;
      }
      else
      {
        if (v7 >= *(void *)(v5 + 16))
        {
          __break(1u);
          return result;
        }
        sub_1AD1FFE38(v19 + 40 * v7, (uint64_t)v21);
        *(void *)&long long v22 = v7;
        sub_1AD20FE90(v21, (uint64_t)&v22 + 8);
        ++v7;
      }
      sub_1AD2F1D40((uint64_t)&v22, (uint64_t)&v25);
      if (!v27) {
        return swift_bridgeObjectRelease();
      }
      uint64_t v8 = v25;
      sub_1AD20FE90(&v26, (uint64_t)&v22);
      uint64_t v9 = *((void *)&v23 + 1);
      uint64_t v10 = v24;
      __swift_project_boxed_opaque_existential_1(&v22, *((uint64_t *)&v23 + 1));
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(a1, a2, v9, v10);
      if (v8 < *(void *)(v5 + 16) - 1)
      {
        v29.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
        CGFloat x = v29.origin.x;
        CGFloat y = v29.origin.y;
        CGFloat width = v29.size.width;
        CGFloat height = v29.size.height;
        CGFloat v15 = CGRectGetMinX(v29) + 0.0;
        v30.origin.CGFloat x = x;
        v30.origin.CGFloat y = y;
        v30.size.CGFloat width = width;
        v30.size.CGFloat height = height;
        CGFloat v16 = CGRectGetMinY(v30) + 0.0;
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        CGFloat v17 = CGRectGetWidth(v31);
        v32.origin.CGFloat x = x;
        v32.origin.CGFloat y = y;
        v32.size.CGFloat width = width;
        v32.size.CGFloat height = height;
        CGFloat v18 = CGRectGetHeight(v32);
        *(CGFloat *)(a2 + 168) = v15;
        *(CGFloat *)(a2 + 176) = v16;
        *(CGFloat *)(a2 + 184) = v17;
        *(CGFloat *)(a2 + 192) = v18;
        *(unsigned char *)(a2 + 200) = 0;
      }
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
  }
  return swift_bridgeObjectRelease();
}

double Array<A>.boundingRectForContent(in:)(uint64_t a1, uint64_t a2)
{
  sub_1AD713730(a2);
  PDFVStack.boundingRectForContent(in:)(a1);
  double v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

double Array<A>.minimumBoundingRectForContent(in:)(uint64_t a1, uint64_t a2)
{
  sub_1AD713730(a2);
  PDFVStack.boundingRectForContent(in:)(a1);
  double v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1AD713730(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v1 = sub_1AD73F5A0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = sub_1AD676890((uint64_t)&v5, v1, WitnessTable);
  uint64_t v5 = MEMORY[0x1E4FBC860];
  sub_1AD260834(v3);
  return v5;
}

uint64_t sub_1AD7137B4(uint64_t a1, uint64_t a2)
{
  return Array<A>.render(context:document:)(a1, a2, *v2);
}

uint64_t sub_1AD7137C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1AD7137F8(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void))Array<A>.boundingRectForContent(in:));
}

uint64_t sub_1AD7137E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1AD7137F8(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void))Array<A>.minimumBoundingRectForContent(in:));
}

uint64_t sub_1AD7137F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void))
{
  return a4(a1, *v4, *(void *)(a2 + 16), *(void *)(a3 - 8));
}

uint64_t Array<A>.renderables.getter(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x1F4188298](sub_1AD713834, 0, 0);
}

uint64_t sub_1AD713834()
{
  sub_1AD2F1E68();
  uint64_t v1 = sub_1AD740830();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1AD7138AC(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = *(void *)(a1 + 16);
  *uint64_t v5 = v2;
  long long v5[2] = v4;
  v5[3] = v6;
  v5[1] = sub_1AD544320;
  return MEMORY[0x1F4188298](sub_1AD713834, 0, 0);
}

uint64_t PDFRenderableProvider.shared()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](a1);
  sub_1AD714A04(0, &qword_1E9A34498, (uint64_t (*)(uint64_t))sub_1AD714A68, MEMORY[0x1E4F65E70]);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1AD73B670();
}

uint64_t sub_1AD713ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v7;
  *unint64_t v7 = v4;
  v7[1] = sub_1AD713BC8;
  return v9(a3, a4);
}

uint64_t sub_1AD713BC8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x1F4188298](sub_1AD713D14, 0, 0);
  }
}

uint64_t sub_1AD713D14()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CachedAsync<>.renderables.getter()
{
  *(void *)(v1 + 24) = v0;
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x1E4F65E68] + MEMORY[0x1E4F65E68]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v2;
  void *v2 = v1;
  v2[1] = sub_1AD713DEC;
  return v4(v1 + 16);
}

uint64_t sub_1AD713DEC()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_1AD714A04(0, &qword_1E9A34498, (uint64_t (*)(uint64_t))sub_1AD714A68, MEMORY[0x1E4F65E70]);
  sub_1AD714C0C();
  uint64_t v3 = sub_1AD73F5D0();
  if (v0) {
    uint64_t v4 = sub_1AD713F8C;
  }
  else {
    uint64_t v4 = sub_1AD713F70;
  }
  return MEMORY[0x1F4188298](v4, v3, v2);
}

uint64_t sub_1AD713F70()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_1AD713F8C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AD713FA4()
{
  *(void *)(v1 + 24) = *v0;
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x1E4F65E68] + MEMORY[0x1E4F65E68]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v2;
  void *v2 = v1;
  v2[1] = sub_1AD713DEC;
  return v4(v1 + 16);
}

uint64_t sub_1AD71405C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1AD71407C, 0, 0);
}

uint64_t sub_1AD71407C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD74C370;
  *(void *)(v2 + 56) = v1;
  *(void *)(v2 + 64) = &protocol witness table for PDFEmptyTableCell;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1AD714138(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[3] = &protocol witness table for NSAttributedString;
  v4[4] = v1;
  v4[1] = sub_1AD7151CC;
  v4[2] = a1;
  return MEMORY[0x1F4188298](sub_1AD71186C, 0, 0);
}

uint64_t sub_1AD7141EC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  *(unsigned char *)(v2 + 33) = *((unsigned char *)v1 + 9);
  return MEMORY[0x1F4188298](sub_1AD714220, 0, 0);
}

uint64_t sub_1AD714220()
{
  char v1 = *(unsigned char *)(v0 + 33);
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFAttributedStrings;
  *(void *)(v5 + 32) = v3;
  *(unsigned char *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 41) = v1;
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v3;
  return v8(v5);
}

uint64_t sub_1AD714314(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  *(unsigned char *)(v2 + 33) = *((unsigned char *)v1 + 9);
  return MEMORY[0x1F4188298](sub_1AD714348, 0, 0);
}

uint64_t sub_1AD714348()
{
  char v1 = *(unsigned char *)(v0 + 33);
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFText;
  *(void *)(v5 + 32) = v3;
  *(unsigned char *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 41) = v1;
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v3;
  return v8(v5);
}

uint64_t sub_1AD71443C(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  *(unsigned char *)(v2 + 33) = *((unsigned char *)v1 + 9);
  return MEMORY[0x1F4188298](sub_1AD714470, 0, 0);
}

uint64_t sub_1AD714470()
{
  char v1 = *(unsigned char *)(v0 + 33);
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFTitle;
  *(void *)(v5 + 32) = v3;
  *(unsigned char *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 41) = v1;
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v3;
  return v8(v5);
}

uint64_t sub_1AD714564(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  *(unsigned char *)(v2 + 33) = *((unsigned char *)v1 + 9);
  return MEMORY[0x1F4188298](sub_1AD714598, 0, 0);
}

uint64_t sub_1AD714598()
{
  char v1 = *(unsigned char *)(v0 + 33);
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFCaption;
  *(void *)(v5 + 32) = v3;
  *(unsigned char *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 41) = v1;
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v3;
  return v8(v5);
}

uint64_t sub_1AD71468C(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  *(unsigned char *)(v2 + 33) = *((unsigned char *)v1 + 9);
  return MEMORY[0x1F4188298](sub_1AD7146C0, 0, 0);
}

uint64_t sub_1AD7146C0()
{
  char v1 = *(unsigned char *)(v0 + 33);
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFArticleTitle;
  *(void *)(v5 + 32) = v3;
  *(unsigned char *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 41) = v1;
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v3;
  return v8(v5);
}

uint64_t sub_1AD7147B4(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  *(unsigned char *)(v2 + 33) = *((unsigned char *)v1 + 9);
  return MEMORY[0x1F4188298](sub_1AD7147E8, 0, 0);
}

uint64_t sub_1AD7147E8()
{
  char v1 = *(unsigned char *)(v0 + 33);
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFBody;
  *(void *)(v5 + 32) = v3;
  *(unsigned char *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 41) = v1;
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v3;
  return v8(v5);
}

uint64_t sub_1AD7148DC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = *((unsigned char *)v1 + 8);
  *(unsigned char *)(v2 + 33) = *((unsigned char *)v1 + 9);
  return MEMORY[0x1F4188298](sub_1AD714910, 0, 0);
}

uint64_t sub_1AD714910()
{
  char v1 = *(unsigned char *)(v0 + 33);
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_1AD714A04(0, (unint64_t *)&qword_1EB732858, (uint64_t (*)(uint64_t))sub_1AD2F1E68, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD74C370;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = &protocol witness table for PDFBodyList;
  *(void *)(v5 + 32) = v3;
  *(unsigned char *)(v5 + 40) = v2;
  *(unsigned char *)(v5 + 41) = v1;
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  id v6 = v3;
  return v8(v5);
}

void sub_1AD714A04(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_1AD714A68(uint64_t a1)
{
}

uint64_t sub_1AD714A9C()
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1AD714B24(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1
     + ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1AD3732AC;
  return sub_1AD713ACC(a1, v6, v4, v5);
}

unint64_t sub_1AD714C0C()
{
  unint64_t result = qword_1E9A344C0;
  if (!qword_1E9A344C0)
  {
    sub_1AD714A04(255, &qword_1E9A34498, (uint64_t (*)(uint64_t))sub_1AD714A68, MEMORY[0x1E4F65E70]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A344C0);
  }
  return result;
}

uint64_t sub_1AD714C94(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of PDFRenderable.render(context:document:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PDFRenderable.boundingRectForContent(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PDFRenderable.minimumBoundingRectForContent(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PDFRenderableProvider.renderables.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1AD714E10;
  return v7(a1, a2);
}

uint64_t sub_1AD714E10(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1AD714F0C()
{
  if (v0[6])
  {
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 15));
  return swift_deallocObject();
}

uint64_t sub_1AD714F6C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1AD714FC8()
{
  return swift_deallocObject();
}

uint64_t sub_1AD715010()
{
  return swift_deallocObject();
}

uint64_t sub_1AD715050()
{
  return swift_deallocObject();
}

uint64_t sub_1AD715088()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return swift_deallocObject();
}

uint64_t sub_1AD7150C8()
{
  return swift_deallocObject();
}

uint64_t sub_1AD7150D8()
{
  if (v0[5]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  }
  if (v0[10]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  }
  if (v0[15]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  }
  return swift_deallocObject();
}

uint64_t sub_1AD715138(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1AD715194()
{
  return swift_deallocObject();
}

BOOL static ManualDataEntryType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ManualDataEntryType.hash(into:)()
{
  return sub_1AD740D00();
}

uint64_t ManualDataEntryType.hashValue.getter()
{
  return sub_1AD740D40();
}

unint64_t sub_1AD71525C()
{
  unint64_t result = qword_1E9A345C0;
  if (!qword_1E9A345C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A345C0);
  }
  return result;
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.placeholderText.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.isEditEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.dataProvider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.dataProvider.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.dataProvider.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.updateHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.updateHandler.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of ManualDataEntrySectionedDataSourceItem.updateHandler.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

unsigned char *storeEnumTagSinglePayload for ManualDataEntryType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AD715430);
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

ValueMetadata *type metadata accessor for ManualDataEntryType()
{
  return &type metadata for ManualDataEntryType;
}

uint64_t dispatch thunk of ManualTextEntrySectionedDataSourceItem.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ManualTextEntrySectionedDataSourceItem.keyboardType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ManualTextEntrySectionedDataSourceItem.isEditEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ManualTextEntrySectionedDataSourceItem.placeholderText.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ManualTextEntrySectionedDataSourceItem.text.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ManualTextEntrySectionedDataSourceItem.placeholderColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ManualTextEntrySectionedDataSourceItem.commitUpdate(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t static UIButton.Configuration.cameraCloseButton()()
{
  uint64_t v0 = sub_1AD7400F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1AD7401E0();
  unsigned int v4 = (void *)sub_1AD73F180();
  id v5 = objc_msgSend(self, sel_systemImageNamed_, v4);

  sub_1AD7401F0();
  unsigned int v6 = self;
  id v7 = objc_msgSend(v6, sel_whiteColor);
  id v8 = objc_msgSend(v7, sel_colorWithAlphaComponent_, 0.5);

  sub_1AD740190();
  id v9 = objc_msgSend(v6, sel_blackColor);
  sub_1AD7401A0();
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FB11F8], v0);
  sub_1AD740100();
  id v10 = objc_msgSend(self, sel_effectWithStyle_, 1);
  uint64_t v11 = (uint64_t (*)(unsigned char *, void))sub_1AD7400C0();
  sub_1AD73CDF0();
  return v11(v13, 0);
}

uint64_t DatePickerItem.reuseIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DatePickerItem.reuseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DatePickerItem.reuseIdentifier.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.uniqueIdentifier.getter()
{
  return 0x6B63695065746144;
}

uint64_t type metadata accessor for DatePickerItem()
{
  uint64_t result = qword_1E9A34608;
  if (!qword_1E9A34608) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DatePickerItem.title.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DatePickerItem.title.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + *(int *)(type metadata accessor for DatePickerItem() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *id v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*DatePickerItem.title.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.placeholderText.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DatePickerItem.placeholderText.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + *(int *)(type metadata accessor for DatePickerItem() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *id v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*DatePickerItem.placeholderText.modify())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1AD7159D8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1) {
    uint64_t v3 = a1[1];
  }
  else {
    uint64_t v3 = 0;
  }
  unsigned int v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for DatePickerItem() + 32));
  uint64_t v5 = *v4;
  sub_1AD21485C(v2);
  uint64_t result = sub_1AD1E4514(v5);
  *unsigned int v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t DatePickerItem.dataProvider.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 32));
  sub_1AD21485C(v1);
  return v1;
}

uint64_t DatePickerItem.dataProvider.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for DatePickerItem() + 32));
  uint64_t result = sub_1AD1E4514(*v5);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*DatePickerItem.dataProvider.modify())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1AD715B18@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for DatePickerItem() + 36));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (*v3)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    id v7 = sub_1AD304FE0;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_1AD21485C(v4);
}

uint64_t sub_1AD715BAC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1AD304FB8;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for DatePickerItem() + 36));
  uint64_t v8 = *v7;
  sub_1AD21485C(v3);
  uint64_t result = sub_1AD1E4514(v8);
  *id v7 = (uint64_t)v6;
  v7[1] = v5;
  return result;
}

uint64_t DatePickerItem.updateHandler.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 36));
  sub_1AD21485C(v1);
  return v1;
}

uint64_t DatePickerItem.updateHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for DatePickerItem() + 36));
  uint64_t result = sub_1AD1E4514(*v5);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*DatePickerItem.updateHandler.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.isEditEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 40));
}

uint64_t DatePickerItem.isEditEnabled.setter(char a1)
{
  uint64_t result = type metadata accessor for DatePickerItem();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*DatePickerItem.isEditEnabled.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.datePickerMode.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 44));
}

uint64_t DatePickerItem.datePickerMode.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for DatePickerItem();
  *(void *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*DatePickerItem.datePickerMode.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.datePickerStyle.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 48));
}

uint64_t DatePickerItem.datePickerStyle.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for DatePickerItem();
  *(void *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

uint64_t (*DatePickerItem.datePickerStyle.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.maximumDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DatePickerItem();
  return sub_1AD716114(v1 + *(int *)(v3 + 52), a1, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
}

uint64_t DatePickerItem.maximumDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DatePickerItem();
  return sub_1AD7161D4(a1, v1 + *(int *)(v3 + 52), (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
}

uint64_t (*DatePickerItem.maximumDate.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.baseIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DatePickerItem() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DatePickerItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for DatePickerItem() + 56));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*DatePickerItem.baseIdentifier.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.backgroundConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DatePickerItem();
  return sub_1AD716114(v1 + *(int *)(v3 + 60), a1, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
}

uint64_t sub_1AD716114(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1AD1D7580(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t DatePickerItem.backgroundConfiguration.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DatePickerItem();
  return sub_1AD7161D4(a1, v1 + *(int *)(v3 + 60), (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
}

uint64_t sub_1AD7161D4(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1AD1D7580(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a2, a1, v6);
  return a2;
}

uint64_t (*DatePickerItem.backgroundConfiguration.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DatePickerItem.init(title:placeholderText:isEditEnabled:datePickerMode:datePickerStyle:dataProvider:updateHandler:maximumDate:accessibilityIdentifierPrefix:backgroundConfiguration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  type metadata accessor for DatePickerCollectionViewCell();
  sub_1AD716660();
  *a9 = sub_1AD73F220();
  a9[1] = v17;
  CGFloat v18 = (int *)type metadata accessor for DatePickerItem();
  sub_1AD73A660();
  uint64_t v19 = (uint64_t *)((char *)a9 + v18[7]);
  os_log_type_t v20 = (uint64_t *)((char *)a9 + v18[8]);
  uint64_t v21 = (uint64_t *)((char *)a9 + v18[9]);
  uint64_t v22 = (uint64_t)a9 + v18[13];
  uint64_t v23 = sub_1AD73A600();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  long long v24 = (uint64_t *)((char *)a9 + v18[14]);
  *long long v24 = 0;
  v24[1] = 0;
  uint64_t v25 = (uint64_t)a9 + v18[15];
  uint64_t v26 = sub_1AD73CE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
  uint64_t v27 = (uint64_t *)((char *)a9 + v18[6]);
  void *v27 = a1;
  v27[1] = a2;
  *uint64_t v19 = a3;
  v19[1] = a4;
  *((unsigned char *)a9 + v18[10]) = a5;
  *(uint64_t *)((char *)a9 + v18[11]) = a6;
  *(uint64_t *)((char *)a9 + v18[12]) = a7;
  uint64_t *v20 = a8;
  v20[1] = a10;
  *uint64_t v21 = a11;
  v21[1] = a12;
  sub_1AD21485C(a11);
  sub_1AD21485C(a8);
  sub_1AD716698(a13, v22, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  sub_1AD716698(a16, v25, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
  if (a15)
  {
    uint64_t v38 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v39 = v28;
    swift_bridgeObjectRetain();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
    sub_1AD1E4514(a11);
    sub_1AD1E4514(a8);
    sub_1AD1E3968(a16, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
    sub_1AD1E3968(a13, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
    uint64_t result = swift_bridgeObjectRelease();
    *long long v24 = v38;
    v24[1] = v39;
  }
  else
  {
    sub_1AD1E4514(a11);
    sub_1AD1E4514(a8);
    sub_1AD1E3968(a16, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
    return sub_1AD1E3968(a13, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  }
  return result;
}

uint64_t type metadata accessor for DatePickerCollectionViewCell()
{
  return self;
}

unint64_t sub_1AD716660()
{
  unint64_t result = qword_1E9A345C8;
  if (!qword_1E9A345C8)
  {
    type metadata accessor for DatePickerCollectionViewCell();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A345C8);
  }
  return result;
}

uint64_t sub_1AD716698(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1AD1D7580(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a2, a1, v6);
  return a2;
}

uint64_t sub_1AD716704()
{
  return 0x6B63695065746144;
}

uint64_t sub_1AD716770(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AD7167DC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AD716834(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AD716894())()
{
  return j__swift_endAccess;
}

uint64_t sub_1AD7168F0(uint64_t a1, void **a2)
{
  sub_1AD716114(a1, (uint64_t)v7, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  uint64_t v3 = *a2;
  uint64_t v4 = (uint64_t)*a2 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item;
  swift_beginAccess();
  sub_1AD716698((uint64_t)v7, v4, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  uint64_t v5 = swift_endAccess();
  (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0xE8))(v5);
  return sub_1AD1E3968((uint64_t)v7, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
}

uint64_t sub_1AD7169D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item;
  swift_beginAccess();
  return sub_1AD716114(v3, a1, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
}

uint64_t sub_1AD716A40(uint64_t a1)
{
  uint64_t v3 = (uint64_t)v1 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item;
  swift_beginAccess();
  sub_1AD716698(a1, v3, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  uint64_t v4 = swift_endAccess();
  (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0xE8))(v4);
  return sub_1AD1E3968(a1, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
}

uint64_t (*sub_1AD716B14(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1AD716B74;
}

uint64_t sub_1AD716B74(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **(void **)(a1 + 24)) + 0xE8))(result);
  }
  return result;
}

id sub_1AD716BD8(double a1, double a2, double a3, double a4)
{
  id v9 = &v4[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  id v10 = &v4[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item];
  *(_OWORD *)id v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((void *)v10 + 4) = 0;
  uint64_t v11 = OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_titleLabel;
  id v12 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v13 = v4;
  id v14 = objc_msgSend(v12, sel_init);
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  CGFloat v15 = (void *)*MEMORY[0x1E4FB28C8];
  id v16 = sub_1AD1F454C((void *)*MEMORY[0x1E4FB28C8], 0, 1, 0, 0, 0, 1);
  objc_msgSend(v14, sel_setFont_, v16);

  objc_msgSend(v14, sel_setTextAlignment_, 4);
  objc_msgSend(v14, sel_setAdjustsFontForContentSizeCategory_, 1);
  uint64_t v17 = self;
  id v18 = objc_msgSend(v17, sel_labelColor);
  objc_msgSend(v14, sel_setTextColor_, v18);

  objc_msgSend(v14, sel_setUserInteractionEnabled_, 0);
  *(void *)&v4[v11] = v14;
  uint64_t v19 = OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel;
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v21 = sub_1AD1F454C(v15, 0, 1, 0, 0, 0, 1);
  objc_msgSend(v20, sel_setFont_, v21);

  objc_msgSend(v20, sel_setTextAlignment_, 4);
  objc_msgSend(v20, sel_setAdjustsFontForContentSizeCategory_, 1);
  id v22 = objc_msgSend(v17, sel_systemBlueColor);
  objc_msgSend(v20, sel_setTextColor_, v22);

  objc_msgSend(v20, sel_setUserInteractionEnabled_, 0);
  *(void *)&v13[v19] = v20;
  uint64_t v23 = OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker;
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB16B0]), sel_init);
  objc_msgSend(v24, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v24, sel_setPreferredDatePickerStyle_, 1);
  objc_msgSend(v24, sel_setDatePickerMode_, 1);
  *(void *)&v13[v23] = v24;
  *(void *)&v13[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_allConstraints] = MEMORY[0x1E4FBC860];

  v27.receiver = v13;
  v27.super_class = (Class)type metadata accessor for DatePickerCollectionViewCell();
  id v25 = objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  sub_1AD716F84();

  return v25;
}

id DatePickerCollectionViewCell.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_1AD716F84()
{
  id v1 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v1, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_titleLabel]);

  id v2 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v2, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel]);

  id v3 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v3, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker]);

  sub_1AD717558();
}

uint64_t sub_1AD717050()
{
  sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v28 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v26 - v4;
  uint64_t v6 = sub_1AD73CE60();
  uint64_t v27 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v26 - v10;
  sub_1AD1D7580(0, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  MEMORY[0x1F4188790](v12 - 8);
  id v14 = (char *)&v26 - v13;
  uint64_t v15 = type metadata accessor for DatePickerItem();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  id v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v0;
  uint64_t v19 = v0 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item;
  swift_beginAccess();
  sub_1AD716114(v19, (uint64_t)v30, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  if (!v31)
  {
    sub_1AD1E3968((uint64_t)v30, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
    return sub_1AD1E3968((uint64_t)v14, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  }
  sub_1AD2282B4();
  int v20 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, v20 ^ 1u, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    return sub_1AD1E3968((uint64_t)v14, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  }
  sub_1AD719300((uint64_t)v14, (uint64_t)v18);
  sub_1AD716114((uint64_t)&v18[*(int *)(v15 + 60)], (uint64_t)v5, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
  uint64_t v21 = v27;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v5, 1, v6) == 1)
  {
    sub_1AD1E3968((uint64_t)v5, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
    sub_1AD73CE10();
    id v22 = objc_msgSend(self, sel_tertiarySystemGroupedBackgroundColor);
    sub_1AD73CE00();
    uint64_t v23 = v28;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v28, v8, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v6);
    MEMORY[0x1B3E66140](v23);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v11, v5, v6);
    id v25 = v28;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v28, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v25, 0, 1, v6);
    MEMORY[0x1B3E66140](v25);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v6);
  }
  return sub_1AD719364((uint64_t)v18);
}

void sub_1AD717558()
{
  uint64_t v1 = v0;
  id v58 = self;
  uint64_t v57 = OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_allConstraints;
  sub_1AD1EED2C();
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1AD73F490();
  swift_bridgeObjectRelease();
  objc_msgSend(v58, sel_deactivateConstraints_, v2);

  sub_1AD1EFDA4();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD758A30;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_titleLabel];
  id v5 = objc_msgSend(v4, sel_leadingAnchor);
  id v6 = objc_msgSend(v1, sel_contentView);
  id v7 = objc_msgSend(v6, sel_leadingAnchor);

  id v8 = objc_msgSend(v5, sel_constraintEqualToAnchor_constant_, v7, 16.0);
  *(void *)(v3 + 32) = v8;
  uint64_t v9 = *(void **)&v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel];
  id v10 = objc_msgSend(v9, sel_topAnchor);
  id v11 = objc_msgSend(v1, (SEL)&selRef_buddyFlowUserInfoWithDemographicsInformation_);
  id v12 = objc_msgSend(v11, sel_topAnchor);

  id v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_constant_, v12, 12.0);
  *(void *)(v3 + 40) = v13;
  id v14 = objc_msgSend(v9, sel_leadingAnchor);
  id v15 = objc_msgSend(v4, sel_trailingAnchor);
  id v16 = objc_msgSend(v14, sel_constraintGreaterThanOrEqualToAnchor_constant_, v15, 16.0);

  *(void *)(v3 + 48) = v16;
  id v17 = objc_msgSend(v1, (SEL)&selRef_buddyFlowUserInfoWithDemographicsInformation_);
  id v18 = objc_msgSend(v17, sel_trailingAnchor);

  id v19 = objc_msgSend(v9, sel_trailingAnchor);
  id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v19, 16.0);

  *(void *)(v3 + 56) = v20;
  uint64_t v21 = *(void **)&v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker];
  id v22 = objc_msgSend(v21, sel_leadingAnchor);
  id v23 = objc_msgSend(v1, (SEL)&selRef_buddyFlowUserInfoWithDemographicsInformation_);
  id v24 = objc_msgSend(v23, sel_leadingAnchor);

  id v25 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v24, 16.0);
  *(void *)(v3 + 64) = v25;
  id v26 = objc_msgSend(v1, (SEL)&selRef_buddyFlowUserInfoWithDemographicsInformation_);
  id v27 = objc_msgSend(v26, sel_trailingAnchor);

  id v28 = objc_msgSend(v21, sel_trailingAnchor);
  id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_constant_, v28, 16.0);

  *(void *)(v3 + 72) = v29;
  id v30 = objc_msgSend(v1, (SEL)&selRef_buddyFlowUserInfoWithDemographicsInformation_);
  id v31 = objc_msgSend(v30, sel_bottomAnchor);

  id v32 = objc_msgSend(v21, sel_bottomAnchor);
  id v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_constant_, v32, 12.0);

  *(void *)(v3 + 80) = v33;
  sub_1AD73F4D0();
  uint64_t v56 = v3;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AD74DE20;
  id v35 = objc_msgSend(v4, sel_centerYAnchor);
  id v36 = objc_msgSend(v21, sel_centerYAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(inited + 32) = v37;
  id v38 = objc_msgSend(v21, sel_topAnchor);
  id v39 = objc_msgSend(v1, (SEL)&selRef_buddyFlowUserInfoWithDemographicsInformation_);
  id v40 = objc_msgSend(v39, sel_topAnchor);

  id v41 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v40, 12.0);
  *(void *)(inited + 40) = v41;
  sub_1AD73F4D0();
  unint64_t v42 = inited;
  uint64_t v43 = swift_initStackObject();
  *(_OWORD *)(v43 + 16) = xmmword_1AD7501A0;
  id v44 = objc_msgSend(v4, sel_topAnchor);
  id v45 = objc_msgSend(v1, sel_contentView);
  id v46 = objc_msgSend(v45, sel_topAnchor);

  id v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_constant_, v46, 12.0);
  *(void *)(v43 + 32) = v47;
  id v48 = objc_msgSend(v21, sel_topAnchor);
  id v49 = objc_msgSend(v4, sel_bottomAnchor);
  id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v49);

  *(void *)(v43 + 40) = v50;
  id v51 = objc_msgSend(v21, sel_topAnchor);
  id v52 = objc_msgSend(v9, sel_bottomAnchor);
  id v53 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v52);

  *(void *)(v43 + 48) = v53;
  sub_1AD73F4D0();
  unint64_t v54 = v43;
  if (objc_msgSend(v9, sel_isHidden)) {
    unint64_t v54 = v42;
  }
  swift_bridgeObjectRelease();
  sub_1AD21FC9C(v54);
  *(void *)&v1[v57] = v56;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v55 = (void *)sub_1AD73F490();
  swift_bridgeObjectRelease();
  objc_msgSend(v58, sel_activateConstraints_, v55);
}

uint64_t sub_1AD717CA4()
{
  uint64_t v1 = v0;
  sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  id v7 = (char *)&v44 - v6;
  uint64_t v8 = sub_1AD73A600();
  uint64_t v47 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v46 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  id v12 = (char *)&v44 - v11;
  sub_1AD1D7580(0, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)&v44 - v14;
  id v16 = (int *)type metadata accessor for DatePickerItem();
  uint64_t v17 = *((void *)v16 - 1);
  MEMORY[0x1F4188790](v16);
  id v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (uint64_t)&v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item];
  swift_beginAccess();
  sub_1AD716114(v20, (uint64_t)v48, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  if (!v49)
  {
    sub_1AD1E3968((uint64_t)v48, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
    (*(void (**)(char *, uint64_t, uint64_t, int *))(v17 + 56))(v15, 1, 1, v16);
    return sub_1AD1E3968((uint64_t)v15, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  }
  sub_1AD2282B4();
  int v21 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, int *))(v17 + 56))(v15, v21 ^ 1u, 1, v16);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v17 + 48))(v15, 1, v16) == 1) {
    return sub_1AD1E3968((uint64_t)v15, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  }
  sub_1AD719300((uint64_t)v15, (uint64_t)v19);
  sub_1AD717050();
  id v22 = *(void **)&v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_titleLabel];
  swift_bridgeObjectRetain();
  id v23 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setText_, v23);

  id v24 = *(void **)&v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker];
  objc_msgSend(v24, sel_setDatePickerMode_, *(void *)&v19[v16[11]]);
  uint64_t v45 = v16[12];
  id v25 = v24;
  objc_msgSend(v24, sel_setPreferredDatePickerStyle_, *(void *)&v19[v45]);
  id v26 = *(void (**)(char *))&v19[v16[8]];
  if (!v26)
  {
    uint64_t v27 = v47;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v7, 1, 1, v8);
    goto LABEL_9;
  }
  swift_retain();
  v26(v19);
  sub_1AD1E4514((uint64_t)v26);
  uint64_t v27 = v47;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v7, 1, v8) == 1)
  {
LABEL_9:
    sub_1AD1E3968((uint64_t)v7, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
    id v29 = v24;
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v12, v7, v8);
  id v28 = (void *)sub_1AD73A590();
  id v29 = v25;
  objc_msgSend(v25, sel_setDate_animated_, v28, 1);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v8);
LABEL_10:
  sub_1AD716114((uint64_t)&v19[v16[13]], (uint64_t)v4, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v4, 1, v8) == 1)
  {
    sub_1AD1E3968((uint64_t)v4, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  }
  else
  {
    id v31 = v46;
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v46, v4, v8);
    id v32 = (void *)sub_1AD73A590();
    objc_msgSend(v29, sel_setMaximumDate_, v32);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v31, v8);
  }
  id v33 = *(void **)&v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel];
  objc_msgSend(v33, sel_setHidden_, *(void *)&v19[v45] == 2);
  if (*(void *)&v19[v16[7] + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v34 = 0;
  }
  objc_msgSend(v33, sel_setText_, v34);

  uint64_t v35 = v19[v16[10]];
  id v36 = self;
  id v37 = &selRef_systemBlueColor;
  if (!v35) {
    id v37 = &selRef_systemGrayColor;
  }
  id v38 = [v36 *v37];
  objc_msgSend(v33, sel_setTextColor_, v38);

  objc_msgSend(v1, sel_setUserInteractionEnabled_, v35);
  sub_1AD717558();
  objc_msgSend(v29, sel_addTarget_action_forControlEvents_, v1, sel_pickerDateChanged_, 0xFFFFFFFFLL);
  sub_1AD718610(v29);
  id v39 = &v19[v16[14]];
  uint64_t v41 = *(void *)v39;
  uint64_t v40 = *((void *)v39 + 1);
  unint64_t v42 = &v1[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier];
  swift_beginAccess();
  *(void *)unint64_t v42 = v41;
  *((void *)v42 + 1) = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (*((void *)v42 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v43 = (void *)sub_1AD73F180();
    objc_msgSend(v29, sel_setAccessibilityIdentifier_, v43);
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_msgSend(v29, sel_setAccessibilityIdentifier_, 0);
  }
  return sub_1AD719364((uint64_t)v19);
}

Swift::Void __swiftcall DatePickerCollectionViewCell.updateAutomationIdentifiers(with:)(Swift::String_optional with)
{
  if (with.value._object)
  {
    uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker);
    id v4 = (id)sub_1AD73F180();
    objc_msgSend(v2, sel_setAccessibilityIdentifier_, v4);
  }
  else
  {
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker);
    objc_msgSend(v3, sel_setAccessibilityIdentifier_, 0);
  }
}

void sub_1AD718500()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  uint64_t v2 = (void *)sub_1AD73F180();
  objc_msgSend(v1, sel_setDateFormat_, v2);

  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel);
  id v4 = (void *)sub_1AD73A590();
  id v5 = objc_msgSend(v1, sel_stringFromDate_, v4);

  if (!v5)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    id v5 = (id)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v3, sel_setText_, v5);
}

uint64_t sub_1AD718610(void *a1)
{
  uint64_t v2 = v1;
  id v32 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_1AD73CBA0();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  MEMORY[0x1F4188790](v3);
  id v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1AD73A600();
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v32 - v10;
  sub_1AD1D7580(0, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v32 - v13;
  uint64_t v15 = type metadata accessor for DatePickerItem();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v2 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item;
  swift_beginAccess();
  sub_1AD716114(v19, (uint64_t)v38, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  if (v38[3])
  {
    sub_1AD2282B4();
    int v20 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, v20 ^ 1u, 1, v15);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
    {
      sub_1AD719300((uint64_t)v14, (uint64_t)v18);
      int v21 = *(void (**)(char *, char *))&v18[*(int *)(v15 + 36)];
      uint64_t v22 = v33;
      if (v21)
      {
        swift_retain();
        id v23 = objc_msgSend(v32, sel_date);
        sub_1AD73A5D0();

        (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v11, 0, 1, v6);
        v21(v18, v11);
        sub_1AD1E4514((uint64_t)v21);
        sub_1AD1E3968((uint64_t)v11, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
      }
      id v24 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker), sel_date, v32);
      sub_1AD73A5D0();

      sub_1AD718500();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
      return sub_1AD719364((uint64_t)v18);
    }
  }
  else
  {
    sub_1AD1E3968((uint64_t)v38, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  }
  sub_1AD1E3968((uint64_t)v14, &qword_1E9A345E0, (void (*)(uint64_t))type metadata accessor for DatePickerItem);
  sub_1AD73CAD0();
  id v26 = sub_1AD73CB80();
  os_log_type_t v27 = sub_1AD73F940();
  if (os_log_type_enabled(v26, v27))
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v38[0] = v29;
    *(_DWORD *)id v28 = 136315138;
    uint64_t v30 = sub_1AD740E30();
    uint64_t v37 = sub_1AD1F62D4(v30, v31, v38);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD1A4000, v26, v27, "[%s] item is not a DatePickerItem", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v29, -1, -1);
    MEMORY[0x1B3E68450](v28, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v5, v36);
}

id DatePickerCollectionViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DatePickerCollectionViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void DatePickerCollectionViewCell.deselectionBehavior.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

Swift::Void __swiftcall DatePickerCollectionViewCell.didSelectCell(_:in:)(UIView *_, UIViewController *in)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker);
  id v4 = objc_msgSend(v3, sel_heightAnchor);
  id v5 = objc_msgSend(v4, sel_constraintEqualToConstant_, 0.0);

  objc_msgSend(v5, sel_setActive_, 0);
  objc_msgSend(v3, sel_setHidden_, 0);
}

id sub_1AD718DC8()
{
  uint64_t v1 = *(void **)(*v0 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker);
  id v2 = objc_msgSend(v1, sel_heightAnchor);
  id v3 = objc_msgSend(v2, sel_constraintEqualToConstant_, 0.0);

  objc_msgSend(v3, sel_setActive_, 0);
  return objc_msgSend(v1, sel_setHidden_, 0);
}

void sub_1AD718E70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a2)
  {
    id v4 = *(void **)(v3 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker);
    id v6 = (id)sub_1AD73F180();
    objc_msgSend(v4, sel_setAccessibilityIdentifier_, v6);
  }
  else
  {
    id v5 = *(void **)(v3 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker);
    objc_msgSend(v5, sel_setAccessibilityIdentifier_, 0);
  }
}

uint64_t sub_1AD718F0C()
{
  uint64_t v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AD718F68(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(*v2 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AD718FCC())()
{
  return j_j__swift_endAccess;
}

void _s18HealthExperienceUI28DatePickerCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item];
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  uint64_t v3 = OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_titleLabel;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v5 = (void *)*MEMORY[0x1E4FB28C8];
  id v6 = sub_1AD1F454C((void *)*MEMORY[0x1E4FB28C8], 0, 1, 0, 0, 0, 1);
  objc_msgSend(v4, sel_setFont_, v6);

  objc_msgSend(v4, sel_setTextAlignment_, 4);
  objc_msgSend(v4, sel_setAdjustsFontForContentSizeCategory_, 1);
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_labelColor);
  objc_msgSend(v4, sel_setTextColor_, v8);

  objc_msgSend(v4, sel_setUserInteractionEnabled_, 0);
  *(void *)&v0[v3] = v4;
  uint64_t v9 = OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel;
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v11 = sub_1AD1F454C(v5, 0, 1, 0, 0, 0, 1);
  objc_msgSend(v10, sel_setFont_, v11);

  objc_msgSend(v10, sel_setTextAlignment_, 4);
  objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);
  id v12 = objc_msgSend(v7, sel_systemBlueColor);
  objc_msgSend(v10, sel_setTextColor_, v12);

  objc_msgSend(v10, sel_setUserInteractionEnabled_, 0);
  *(void *)&v0[v9] = v10;
  uint64_t v13 = OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB16B0]), sel_init);
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v14, sel_setPreferredDatePickerStyle_, 1);
  objc_msgSend(v14, sel_setDatePickerMode_, 1);
  *(void *)&v0[v13] = v14;
  *(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_allConstraints] = MEMORY[0x1E4FBC860];

  sub_1AD7408B0();
  __break(1u);
}

uint64_t sub_1AD719300(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DatePickerItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD719364(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DatePickerItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AD7193C0(uint64_t a1)
{
  unint64_t result = sub_1AD7193E8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1AD7193E8()
{
  unint64_t result = qword_1E9A34600;
  if (!qword_1E9A34600)
  {
    type metadata accessor for DatePickerItem();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34600);
  }
  return result;
}

uint64_t sub_1AD719440@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for DatePickerItem() + 32));
  uint64_t v4 = *v3;
  if (*v3) {
    uint64_t v5 = v3[1];
  }
  else {
    uint64_t v5 = 0;
  }
  *a2 = v4;
  a2[1] = v5;
  return sub_1AD21485C(v4);
}

uint64_t sub_1AD7194A0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_baseIdentifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AD7194FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item;
  swift_beginAccess();
  return sub_1AD716114(v3, a2, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
}

void *initializeBufferWithCopyOfBuffer for DatePickerItem(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1AD73A670();
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (void *)((char *)v4 + v14);
    uint64_t v19 = (void *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[8];
    uint64_t v22 = (void *)((char *)v4 + v21);
    id v23 = (char *)a2 + v21;
    uint64_t v24 = *(void *)((char *)a2 + v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v24)
    {
      uint64_t v25 = *((void *)v23 + 1);
      void *v22 = v24;
      v22[1] = v25;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    }
    uint64_t v27 = a3[9];
    id v28 = (void *)((char *)v4 + v27);
    uint64_t v29 = (void *)((char *)a2 + v27);
    if (*v29)
    {
      uint64_t v30 = v29[1];
      *id v28 = *v29;
      v28[1] = v30;
      swift_retain();
    }
    else
    {
      *(_OWORD *)id v28 = *(_OWORD *)v29;
    }
    uint64_t v31 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    *(void *)((char *)v4 + v31) = *(void *)((char *)a2 + v31);
    uint64_t v32 = a3[13];
    *(void *)((char *)v4 + a3[12]) = *(void *)((char *)a2 + a3[12]);
    uint64_t v33 = (char *)v4 + v32;
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = sub_1AD73A600();
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
      memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    uint64_t v38 = a3[14];
    uint64_t v39 = a3[15];
    uint64_t v40 = (void *)((char *)v4 + v38);
    uint64_t v41 = (void *)((char *)a2 + v38);
    uint64_t v42 = v41[1];
    *uint64_t v40 = *v41;
    v40[1] = v42;
    uint64_t v43 = (char *)v4 + v39;
    uint64_t v44 = (char *)a2 + v39;
    uint64_t v45 = sub_1AD73CE60();
    uint64_t v46 = *(void *)(v45 - 8);
    uint64_t v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48);
    swift_bridgeObjectRetain();
    if (v47(v44, 1, v45))
    {
      sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
      memcpy(v43, v44, *(void *)(*(void *)(v48 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v43, v44, v45);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
    }
  }
  return v4;
}

uint64_t destroy for DatePickerItem(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_1AD73A670();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + a2[8])) {
    swift_release();
  }
  if (*(void *)(a1 + a2[9])) {
    swift_release();
  }
  uint64_t v6 = a1 + a2[13];
  uint64_t v7 = sub_1AD73A600();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + a2[15];
  uint64_t v10 = sub_1AD73CE60();
  uint64_t v13 = *(void *)(v10 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v9, 1, v10);
  if (!result)
  {
    id v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v9, v10);
  }
  return result;
}

void *initializeWithCopy for DatePickerItem(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1AD73A670();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)((char *)a1 + v13);
  uint64_t v18 = (void *)((char *)a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = *(void *)((char *)a2 + v20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v23)
  {
    uint64_t v24 = *((void *)v22 + 1);
    *uint64_t v21 = v23;
    v21[1] = v24;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  }
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  if (*v27)
  {
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  }
  uint64_t v29 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
  uint64_t v30 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_1AD73A600();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  uint64_t v36 = a3[14];
  uint64_t v37 = a3[15];
  uint64_t v38 = (void *)((char *)a1 + v36);
  uint64_t v39 = (void *)((char *)a2 + v36);
  uint64_t v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  uint64_t v41 = (char *)a1 + v37;
  uint64_t v42 = (char *)a2 + v37;
  uint64_t v43 = sub_1AD73CE60();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
  swift_bridgeObjectRetain();
  if (v45(v42, 1, v43))
  {
    sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
    memcpy(v41, v42, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v41, v42, v43);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
  }
  return a1;
}

void *assignWithCopy for DatePickerItem(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AD73A670();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void *)((char *)a1 + v16);
  uint64_t v20 = *(void *)((char *)a2 + v16);
  if (v19)
  {
    if (v20)
    {
      uint64_t v21 = *((void *)v18 + 1);
      *uint64_t v17 = v20;
      v17[1] = v21;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v20)
  {
    uint64_t v22 = *((void *)v18 + 1);
    *uint64_t v17 = v20;
    v17[1] = v22;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
LABEL_8:
  uint64_t v23 = a3[9];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = *(void *)((char *)a1 + v23);
  uint64_t v27 = *(void *)((char *)a2 + v23);
  if (v26)
  {
    if (v27)
    {
      uint64_t v28 = *((void *)v25 + 1);
      *uint64_t v24 = v27;
      v24[1] = v28;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v27)
  {
    uint64_t v29 = *((void *)v25 + 1);
    *uint64_t v24 = v27;
    v24[1] = v29;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
LABEL_15:
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  uint64_t v30 = a3[13];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_1AD73A600();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35(v32, 1, v33);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v37)
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v33);
LABEL_20:
    sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
    memcpy(v31, v32, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_21;
  }
  (*(void (**)(char *, char *, uint64_t))(v34 + 24))(v31, v32, v33);
LABEL_21:
  uint64_t v39 = a3[14];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = a3[15];
  uint64_t v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  uint64_t v45 = sub_1AD73CE60();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  int v48 = v47(v43, 1, v45);
  int v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 24))(v43, v44, v45);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_26;
  }
  if (v49)
  {
LABEL_26:
    sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
    memcpy(v43, v44, *(void *)(*(void *)(v50 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v43, v44, v45);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  return a1;
}

_OWORD *initializeWithTake for DatePickerItem(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AD73A670();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  uint64_t v14 = *v13;
  if (*v13)
  {
    uint64_t v15 = v13[1];
    *uint64_t v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = *v18;
  if (*v18)
  {
    uint64_t v20 = v18[1];
    *uint64_t v17 = v19;
    v17[1] = v20;
  }
  else
  {
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  }
  uint64_t v21 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *(void *)((char *)a1 + v21) = *(void *)((char *)a2 + v21);
  uint64_t v22 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = sub_1AD73A600();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  uint64_t v28 = a3[15];
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)((char *)a2 + a3[14]);
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = sub_1AD73CE60();
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v30, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  return a1;
}

void *assignWithTake for DatePickerItem(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1AD73A670();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = *(void *)((char *)a1 + v21);
  uint64_t v25 = *(void *)((char *)a2 + v21);
  if (v24)
  {
    if (v25)
    {
      uint64_t v26 = *((void *)v23 + 1);
      void *v22 = v25;
      v22[1] = v26;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v25)
  {
    uint64_t v27 = *((void *)v23 + 1);
    void *v22 = v25;
    v22[1] = v27;
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
LABEL_8:
  uint64_t v28 = a3[9];
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = *(void *)((char *)a1 + v28);
  uint64_t v32 = *(void *)((char *)a2 + v28);
  if (v31)
  {
    if (v32)
    {
      uint64_t v33 = *((void *)v30 + 1);
      *uint64_t v29 = v32;
      v29[1] = v33;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v32)
  {
    uint64_t v34 = *((void *)v30 + 1);
    *uint64_t v29 = v32;
    v29[1] = v34;
    goto LABEL_15;
  }
  *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
LABEL_15:
  uint64_t v35 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *(void *)((char *)a1 + v35) = *(void *)((char *)a2 + v35);
  uint64_t v36 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  int v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = sub_1AD73A600();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  int v43 = v41(v38, 1, v39);
  if (v42)
  {
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v37, v38, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v43)
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
LABEL_20:
    sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
    memcpy(v37, v38, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_21;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v37, v38, v39);
LABEL_21:
  uint64_t v45 = a3[14];
  uint64_t v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  *uint64_t v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[15];
  id v51 = (char *)a1 + v50;
  id v52 = (char *)a2 + v50;
  uint64_t v53 = sub_1AD73CE60();
  uint64_t v54 = *(void *)(v53 - 8);
  uint64_t v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
  int v56 = v55(v51, 1, v53);
  int v57 = v55(v52, 1, v53);
  if (!v56)
  {
    if (!v57)
    {
      (*(void (**)(char *, char *, uint64_t))(v54 + 40))(v51, v52, v53);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v51, v53);
    goto LABEL_26;
  }
  if (v57)
  {
LABEL_26:
    sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
    memcpy(v51, v52, *(void *)(*(void *)(v58 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v51, v52, v53);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
  return a1;
}

uint64_t getEnumTagSinglePayload for DatePickerItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AD71AA6C);
}

uint64_t sub_1AD71AA6C(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_1AD73A670();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[13];
    goto LABEL_9;
  }
  sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[15];
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for DatePickerItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AD71AC30);
}

uint64_t sub_1AD71AC30(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_1AD73A670();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  sub_1AD1D7580(0, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[13];
    goto LABEL_7;
  }
  sub_1AD1D7580(0, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[15];
  return v15(v17, a2, a2, v16);
}

void sub_1AD71ADE0()
{
  sub_1AD73A670();
  if (v0 <= 0x3F)
  {
    sub_1AD1D7580(319, (unint64_t *)&unk_1EB741390, MEMORY[0x1E4F27928]);
    if (v1 <= 0x3F)
    {
      sub_1AD1D7580(319, (unint64_t *)&qword_1EB7401D0, MEMORY[0x1E4FB0F28]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t method lookup function for DatePickerCollectionViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DatePickerCollectionViewCell);
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.baseIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.baseIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.baseIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.itemUpdated()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of DatePickerCollectionViewCell.update(date:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t sub_1AD71B110()
{
  swift_release();
  return swift_deallocObject();
}

id InternalSettingsFeatureStateListViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

uint64_t InternalSettingsFeatureStateListViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v15 = sub_1AD71B90C;
  uint64_t v16 = 0;
  char v17 = 0;
  sub_1AD71B944();
  uint64_t v8 = v4;
  sub_1AD73ECF0();
  uint64_t v9 = (void *)sub_1AD73E5D0();
  swift_release();
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();
  if (v10)
  {
    *(void *)&v8[OBJC_IVAR____TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController_host] = v10;

    if (a2)
    {
      uint64_t v11 = (void *)sub_1AD73F180();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = 0;
    }
    v14.receiver = v8;
    v14.super_class = ObjectType;
    id v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, v11, a3);

    return (uint64_t)v12;
  }
  else
  {

    uint64_t result = sub_1AD7408B0();
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall InternalSettingsFeatureStateListViewController.viewDidLoad()()
{
  unint64_t v1 = v0;
  v41.receiver = v0;
  v41.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v41, sel_viewDidLoad);
  unint64_t v2 = (void *)sub_1AD73F180();
  objc_msgSend(v1, sel_setTitle_, v2);

  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController_host];
  objc_msgSend(v1, sel_addChildViewController_, v3);
  id v4 = objc_msgSend(v1, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v3, sel_view);
  if (!v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v7 = v6;
  objc_msgSend(v5, sel_addSubview_, v6);

  id v8 = objc_msgSend(v3, sel_view);
  if (!v8)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  sub_1AD71D5C4(0, (unint64_t *)&qword_1EB741320, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1AD74C720;
  id v11 = objc_msgSend(v3, sel_view);
  if (!v11)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v12 = v11;
  id v13 = objc_msgSend(v11, sel_topAnchor);

  id v14 = objc_msgSend(v1, sel_view);
  if (!v14)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v15 = v14;
  id v16 = objc_msgSend(v14, sel_topAnchor);

  id v17 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v16);
  *(void *)(v10 + 32) = v17;
  id v18 = objc_msgSend(v3, sel_view);
  if (!v18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v19 = v18;
  id v20 = objc_msgSend(v18, sel_leadingAnchor);

  id v21 = objc_msgSend(v1, sel_view);
  if (!v21)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v22 = v21;
  id v23 = objc_msgSend(v21, sel_leadingAnchor);

  id v24 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v23);
  *(void *)(v10 + 40) = v24;
  id v25 = objc_msgSend(v3, sel_view);
  if (!v25)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v26 = v25;
  id v27 = objc_msgSend(v25, sel_bottomAnchor);

  id v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v29 = v28;
  id v30 = objc_msgSend(v28, sel_bottomAnchor);

  id v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
  *(void *)(v10 + 48) = v31;
  id v32 = objc_msgSend(v3, sel_view);
  if (!v32)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v33 = v32;
  id v34 = objc_msgSend(v32, sel_trailingAnchor);

  id v35 = objc_msgSend(v1, sel_view);
  if (v35)
  {
    uint64_t v36 = v35;
    int v37 = self;
    id v38 = objc_msgSend(v36, sel_trailingAnchor);

    id v39 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v38);
    *(void *)(v10 + 56) = v39;
    sub_1AD73F4D0();
    sub_1AD1EED2C();
    uint64_t v40 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_activateConstraints_, v40);

    objc_msgSend(v3, sel_didMoveToParentViewController_, v1);
    return;
  }
LABEL_23:
  __break(1u);
}

id InternalSettingsFeatureStateListViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AD71B90C()
{
  return sub_1AD61C7C8();
}

unint64_t sub_1AD71B944()
{
  unint64_t result = qword_1E9A34620;
  if (!qword_1E9A34620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34620);
  }
  return result;
}

uint64_t type metadata accessor for InternalSettingsFeatureStateListViewController()
{
  return self;
}

uint64_t sub_1AD71B9C0()
{
  return swift_retain();
}

uint64_t destroy for InternalSettingsFeatureList()
{
  return sub_1AD71B9D8();
}

uint64_t sub_1AD71B9D8()
{
  return swift_release();
}

uint64_t _s18HealthExperienceUI27InternalSettingsFeatureListVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1AD71B9C0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for InternalSettingsFeatureList(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1AD71B9C0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1AD71B9D8();
  return a1;
}

uint64_t assignWithTake for InternalSettingsFeatureList(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1AD71B9D8();
  return a1;
}

ValueMetadata *type metadata accessor for InternalSettingsFeatureList()
{
  return &type metadata for InternalSettingsFeatureList;
}

uint64_t sub_1AD71BADC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD71BAF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char *a4@<X8>)
{
  id v51 = a4;
  int v6 = a3 & 1;
  sub_1AD71C988();
  uint64_t v52 = *(void *)(v7 - 8);
  uint64_t v53 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v50 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v49 = (char *)&v47 - v10;
  sub_1AD71C71C();
  uint64_t v55 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  int v56 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  id v16 = (char *)&v47 - v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v54 = (char *)&v47 - v18;
  type metadata accessor for InternalSettingsFeatureListModel();
  sub_1AD71CB74((unint64_t *)&unk_1E9A326D0, (void (*)(uint64_t))type metadata accessor for InternalSettingsFeatureListModel);
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  sub_1AD73DEA0();
  uint64_t v21 = sub_1AD61CF30();
  uint64_t v23 = v22;
  swift_release();
  if (v23)
  {
    uint64_t v57 = v21;
    uint64_t v58 = v23;
    sub_1AD20F9FC();
    uint64_t v24 = sub_1AD73E9B0();
    uint64_t v28 = v27 & 1;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v28 = 0;
    uint64_t v26 = 0;
  }
  BOOL v29 = v6 != 0;
  uint64_t v57 = v24;
  uint64_t v58 = v25;
  uint64_t v59 = v28;
  uint64_t v60 = v26;
  MEMORY[0x1F4188790](v24);
  *(&v47 - 4) = v19;
  *(&v47 - 3) = v20;
  *((unsigned char *)&v47 - 16) = v6 != 0;
  sub_1AD71C7B0();
  sub_1AD71D5C4(0, &qword_1E9A2A850, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4FBB718]);
  sub_1AD71D46C(&qword_1E9A34690, (void (*)(uint64_t))sub_1AD71C7B0, (void (*)(void))sub_1AD71CBC8);
  sub_1AD64B304();
  sub_1AD73EDD0();
  uint64_t v48 = v12;
  id v30 = v54;
  uint64_t v31 = v55;
  uint64_t v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 32))(v54, v16, v55);
  MEMORY[0x1F4188790](v32);
  *(&v47 - 4) = v19;
  *(&v47 - 3) = v20;
  *((unsigned char *)&v47 - 16) = v29;
  sub_1AD71CA10(0, &qword_1E9A34670, (void (*)(void))sub_1AD71CA8C);
  sub_1AD71CC50();
  uint64_t v33 = v49;
  sub_1AD73EDC0();
  id v34 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  id v35 = v56;
  v34(v56, v30, v31);
  uint64_t v37 = v52;
  uint64_t v36 = v53;
  id v38 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  id v39 = v50;
  v38(v50, v33, v53);
  uint64_t v40 = v51;
  objc_super v41 = v35;
  uint64_t v42 = v55;
  v34(v51, v41, v55);
  sub_1AD71C6AC();
  v38(&v40[*(int *)(v43 + 48)], v39, v36);
  uint64_t v44 = *(void (**)(char *, uint64_t))(v37 + 8);
  v44(v33, v36);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v48 + 8);
  v45(v54, v42);
  v44(v39, v36);
  return ((uint64_t (*)(char *, uint64_t))v45)(v56, v42);
}

uint64_t sub_1AD71BFE8()
{
  return sub_1AD73ED70();
}

uint64_t sub_1AD71C190(void **a1)
{
  unint64_t v1 = *a1;
  id v2 = objc_msgSend(*(id *)((char *)*a1+ OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel_featureAvailabilityStore), sel_featureIdentifier);
  id v3 = (id)NSStringFromHKFeatureIdentifier();
  _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

  type metadata accessor for InternalSettingsFeatureStateModel(0);
  sub_1AD71CB74(&qword_1E9A32648, (void (*)(uint64_t))type metadata accessor for InternalSettingsFeatureStateModel);
  id v4 = v1;
  sub_1AD73DFD0();
  sub_1AD647570();
  sub_1AD20F9FC();
  return sub_1AD73DFB0();
}

uint64_t sub_1AD71C2A8()
{
  return sub_1AD73DFA0();
}

uint64_t sub_1AD71C3C4()
{
  uint64_t v1 = sub_1AD73E500();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  id v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1AD71C5FC();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  LOBYTE(v8) = *((unsigned char *)v0 + 16);
  long long v12 = *v0;
  char v13 = v8;
  sub_1AD71C89C(0, &qword_1E9A34638, (uint64_t (*)(uint64_t))sub_1AD71C6AC, MEMORY[0x1E4F3F108]);
  sub_1AD71CAE0();
  sub_1AD73E920();
  sub_1AD73E4F0();
  sub_1AD71CB74(&qword_1E9A34688, (void (*)(uint64_t))sub_1AD71C5FC);
  sub_1AD73EB60();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_1AD71C5FC()
{
  if (!qword_1E9A34630)
  {
    sub_1AD71C89C(255, &qword_1E9A34638, (uint64_t (*)(uint64_t))sub_1AD71C6AC, MEMORY[0x1E4F3F108]);
    sub_1AD71CAE0();
    unint64_t v0 = sub_1AD73E930();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34630);
    }
  }
}

void sub_1AD71C6AC()
{
  if (!qword_1E9A34640)
  {
    sub_1AD71C71C();
    sub_1AD71C988();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A34640);
    }
  }
}

void sub_1AD71C71C()
{
  if (!qword_1E9A34648)
  {
    sub_1AD71C7B0();
    sub_1AD71D5C4(255, &qword_1E9A2A850, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4FBB718]);
    unint64_t v0 = sub_1AD73EDE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34648);
    }
  }
}

void sub_1AD71C7B0()
{
  if (!qword_1E9A34650)
  {
    sub_1AD71C89C(255, &qword_1E9A2AB00, type metadata accessor for InternalSettingsFeatureStateModel, MEMORY[0x1E4FBB320]);
    sub_1AD71CA10(255, &qword_1E9A34658, (void (*)(void))sub_1AD647570);
    sub_1AD71C900();
    unint64_t v0 = sub_1AD73ED80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34650);
    }
  }
}

void sub_1AD71C89C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1AD71C900()
{
  unint64_t result = qword_1E9A34660;
  if (!qword_1E9A34660)
  {
    sub_1AD71C89C(255, &qword_1E9A2AB00, type metadata accessor for InternalSettingsFeatureStateModel, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34660);
  }
  return result;
}

void sub_1AD71C988()
{
  if (!qword_1E9A34668)
  {
    sub_1AD71CA10(255, &qword_1E9A34670, (void (*)(void))sub_1AD71CA8C);
    unint64_t v0 = sub_1AD73EDE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34668);
    }
  }
}

void sub_1AD71CA10(uint64_t a1, unint64_t *a2, void (*a3)(void))
{
  if (!*a2)
  {
    a3();
    unint64_t v4 = sub_1AD73DFC0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1AD71CA8C()
{
  unint64_t result = qword_1E9A34678;
  if (!qword_1E9A34678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34678);
  }
  return result;
}

unint64_t sub_1AD71CAE0()
{
  unint64_t result = qword_1E9A34680;
  if (!qword_1E9A34680)
  {
    sub_1AD71C89C(255, &qword_1E9A34638, (uint64_t (*)(uint64_t))sub_1AD71C6AC, MEMORY[0x1E4F3F108]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34680);
  }
  return result;
}

uint64_t sub_1AD71CB68@<X0>(char *a1@<X8>)
{
  return sub_1AD71BAF8(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), a1);
}

uint64_t sub_1AD71CB74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AD71CBBC()
{
  return sub_1AD71BFE8();
}

unint64_t sub_1AD71CBC8()
{
  unint64_t result = qword_1E9A34698;
  if (!qword_1E9A34698)
  {
    sub_1AD71CA10(255, &qword_1E9A34658, (void (*)(void))sub_1AD647570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34698);
  }
  return result;
}

uint64_t sub_1AD71CC44()
{
  return sub_1AD71C2A8();
}

unint64_t sub_1AD71CC50()
{
  unint64_t result = qword_1E9A346A0;
  if (!qword_1E9A346A0)
  {
    sub_1AD71CA10(255, &qword_1E9A34670, (void (*)(void))sub_1AD71CA8C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A346A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalSettingsFeatureStateList()
{
  return &type metadata for InternalSettingsFeatureStateList;
}

uint64_t sub_1AD71CCDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD71CD7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD71CD98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v20[0] = a2;
  v20[1] = a3;
  uint64_t v4 = sub_1AD73E500();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD71D300();
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  long long v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD71D4E8();
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[4] = a1;
  v20[5] = v20[0];
  sub_1AD71D3B0();
  sub_1AD71D46C(&qword_1E9A346C0, (void (*)(uint64_t))sub_1AD71D3B0, (void (*)(void))sub_1AD6480AC);
  sub_1AD73E920();
  sub_1AD73E4F0();
  uint64_t v18 = sub_1AD71CB74((unint64_t *)&unk_1E9A346D0, (void (*)(uint64_t))sub_1AD71D300);
  sub_1AD73EB60();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_1AD73E3E0();
  v20[6] = v9;
  v20[7] = v4;
  v20[8] = v18;
  v20[9] = MEMORY[0x1E4F3D8F0];
  swift_getOpaqueTypeConformance2();
  sub_1AD73EAC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_1AD71D0FC()
{
  return sub_1AD73ED70();
}

__n128 sub_1AD71D20C@<Q0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  type metadata accessor for InternalSettingsFeatureStateModel(0);
  sub_1AD71CB74(&qword_1E9A32648, (void (*)(uint64_t))type metadata accessor for InternalSettingsFeatureStateModel);
  id v4 = v3;
  uint64_t v5 = sub_1AD73DFD0();
  uint64_t v7 = v6;
  sub_1AD71D5C4(0, (unint64_t *)&qword_1EB7413B8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
  sub_1AD73EC40();
  __n128 result = v9;
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = v9;
  *(void *)(a2 + 40) = v10;
  return result;
}

uint64_t sub_1AD71D2F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD71CD98(*v1, v1[1], a1);
}

void sub_1AD71D300()
{
  if (!qword_1E9A346B0)
  {
    sub_1AD71D3B0();
    sub_1AD71D46C(&qword_1E9A346C0, (void (*)(uint64_t))sub_1AD71D3B0, (void (*)(void))sub_1AD6480AC);
    unint64_t v0 = sub_1AD73E930();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A346B0);
    }
  }
}

void sub_1AD71D3B0()
{
  if (!qword_1E9A346B8)
  {
    sub_1AD71C89C(255, &qword_1E9A2AB00, type metadata accessor for InternalSettingsFeatureStateModel, MEMORY[0x1E4FBB320]);
    sub_1AD71C900();
    unint64_t v0 = sub_1AD73ED80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A346B8);
    }
  }
}

uint64_t sub_1AD71D46C(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1AD71D4E8()
{
  if (!qword_1E9A346C8)
  {
    sub_1AD71D300();
    sub_1AD73E500();
    sub_1AD71CB74((unint64_t *)&unk_1E9A346D0, (void (*)(uint64_t))sub_1AD71D300);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A346C8);
    }
  }
}

uint64_t sub_1AD71D5BC()
{
  return sub_1AD71D0FC();
}

void sub_1AD71D5C4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1AD71D610()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 PluginDeepLinkRouter.__allocating_init(viewControllerRouter:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = swift_allocObject();
  __n128 result = *(__n128 *)a1;
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v5;
  *(void *)(v3 + 48) = v2;
  return result;
}

Swift::Void __swiftcall PluginDeepLinkRouter.launchPluginForSharingActivity(activity:)(NSUserActivity activity)
{
  uint64_t v2 = sub_1AD73CBA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  long long v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v53 - v7;
  uint64_t v9 = sub_1AD73C2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)&double v11 = MEMORY[0x1F4188790](v9).n128_u64[0];
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [(objc_class *)activity.super.isa userInfo];
  if (!v14)
  {
    long long v65 = 0u;
    long long v66 = 0u;
LABEL_18:
    sub_1AD1CC4BC((uint64_t)&v65, (uint64_t (*)(void))sub_1AD21DC2C);
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  uint64_t v62 = v8;
  uint64_t v63 = v2;
  uint64_t v16 = sub_1AD73F030();

  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v13, *MEMORY[0x1E4F65670], v9);
  uint64_t v17 = sub_1AD73C2E0();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v68[26] = v17;
  v68[27] = v19;
  sub_1AD740600();
  if (*(void *)(v16 + 16) && (unint64_t v20 = sub_1AD259504((uint64_t)v68), (v21 & 1) != 0))
  {
    sub_1AD1F63A8(*(void *)(v16 + 56) + 32 * v20, (uint64_t)&v65);
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_1AD25A4D0((uint64_t)v68);
  swift_bridgeObjectRelease();
  uint64_t v2 = v63;
  if (!*((void *)&v66 + 1)) {
    goto LABEL_18;
  }
  if (swift_dynamicCast())
  {
    uint64_t v23 = v68[0];
    uint64_t v22 = v68[1];
    uint64_t v24 = sub_1AD71FC7C();
    unint64_t v60 = v22;
    uint64_t v57 = v23;
    if (v24)
    {
      swift_getObjectType();
      uint64_t v25 = swift_conformsToProtocol2();
      if (v25) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
      if (v25) {
        uint64_t v27 = v24;
      }
      else {
        uint64_t v27 = 0;
      }
      if (v27) {
        swift_unknownObjectRetain();
      }
      else {
        uint64_t v26 = 0;
      }
      swift_getObjectType();
      uint64_t v31 = swift_conformsToProtocol2();
      if (v31) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = 0;
      }
      if (v31) {
        uint64_t v33 = v24;
      }
      else {
        uint64_t v33 = 0;
      }
      if (v33)
      {
        uint64_t v59 = v32;
        uint64_t v61 = v27;
        if (!v27) {
          goto LABEL_37;
        }
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v26 = 0;
    }
    swift_unknownObjectRelease();
    uint64_t v33 = 0;
    uint64_t v59 = 0;
    uint64_t v61 = v27;
    if (!v27) {
      goto LABEL_37;
    }
LABEL_34:
    uint64_t ObjectType = swift_getObjectType();
    id v34 = (void *)v64[2];
    uint64_t v54 = v64[3];
    uint64_t v35 = v64[6];
    uint64_t v36 = swift_getObjectType();
    v68[0] = (uint64_t)v34;
    uint64_t v55 = *(uint64_t (**)(uint64_t, uint64_t))(v35 + 32);
    uint64_t v56 = v36;
    uint64_t v37 = (void *)v55(v36, v35);
    (*(void (**)(uint64_t *__return_ptr, Class, void *, uint64_t, uint64_t))(v26 + 24))(v68, activity.super.isa, v37, ObjectType, v26);

    if (v68[0])
    {
      v68[0] = (uint64_t)v34;
      id v38 = (void *)v55(v56, v35);
      if (v33)
      {
        uint64_t v39 = v54;
LABEL_38:
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v42 = swift_getObjectType();
        sub_1AD71FA1C(v38, (uint64_t)v68);
        *((void *)&v66 + 1) = swift_getObjectType();
        uint64_t v67 = v39;
        *(void *)&long long v65 = v34;
        uint64_t v43 = v59;
        uint64_t v44 = *(void (**)(Class, uint64_t *, long long *, uint64_t, uint64_t))(v59 + 16);
        id v45 = v34;
        v44(activity.super.isa, v68, &v65, v42, v43);

        swift_unknownObjectRelease();
        swift_unknownObjectRelease_n();
        sub_1AD71FFA8((uint64_t)v68);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v65);
        return;
      }
      goto LABEL_39;
    }
LABEL_37:
    id v34 = (void *)v64[2];
    uint64_t v39 = v64[3];
    uint64_t v40 = v64[6];
    uint64_t v41 = swift_getObjectType();
    objc_msgSend(v34, sel_restoreUserActivityState_, activity.super.isa);
    v68[0] = (uint64_t)v34;
    id v38 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v40 + 32))(v41, v40);
    if (v33) {
      goto LABEL_38;
    }
LABEL_39:
    uint64_t v46 = v62;
    sub_1AD73CB00();
    unint64_t v47 = v60;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_1AD73CB80();
    os_log_type_t v49 = sub_1AD73F900();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v64 = v38;
      uint64_t v52 = v51;
      v68[0] = v51;
      *(_DWORD *)uint64_t v50 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)&long long v65 = sub_1AD1F62D4(v57, v47, v68);
      sub_1AD7403B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1AD1A4000, v48, v49, "%{public}s does not conform to PluginNSUADelegate", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v52, -1, -1);
      MEMORY[0x1B3E68450](v50, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v46, v63);
    return;
  }
LABEL_19:
  sub_1AD73CB00();
  uint64_t v28 = sub_1AD73CB80();
  os_log_type_t v29 = sub_1AD73F920();
  if (os_log_type_enabled(v28, v29))
  {
    id v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v30 = 0;
    _os_log_impl(&dword_1AD1A4000, v28, v29, "UserActivity is missing plugin bundle name", v30, 2u);
    MEMORY[0x1B3E68450](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PluginDeepLinkRouter.launchPluginFromSharingURL(_:pluginType:profileIdentifier:)(NSObject *a1, uint64_t a2, uint64_t a3)
{
  void (*v37)(uint64_t *__return_ptr, os_log_t, uint64_t *, void *, uint64_t, uint64_t);
  id v38;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  os_log_t v67;
  void *v68;
  void v69[5];
  uint64_t v70[26];
  uint64_t v71[3];

  uint64_t v67 = a1;
  uint64_t v5 = sub_1AD73C2C0();
  uint64_t v58 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1AD73CBA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  long long v65 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1AD73C390();
  uint64_t v62 = *(void *)(v11 - 8);
  uint64_t v63 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v61 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73C2A0();
  uint64_t v13 = sub_1AD71FC7C();
  uint64_t v54 = v9;
  uint64_t v55 = v8;
  uint64_t v59 = v5;
  uint64_t v56 = a2;
  uint64_t v57 = v7;
  uint64_t v64 = a3;
  if (!v13)
  {
    uint64_t v16 = 0;
    uint64_t v15 = 0;
    goto LABEL_21;
  }
  swift_getObjectType();
  uint64_t v14 = swift_conformsToProtocol2();
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v14) {
    uint64_t v16 = (void *)v13;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v16) {
    swift_unknownObjectRetain();
  }
  else {
    uint64_t v15 = 0;
  }
  swift_getObjectType();
  uint64_t v17 = swift_conformsToProtocol2();
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v17) {
    uint64_t v19 = v13;
  }
  else {
    uint64_t v19 = 0;
  }
  long long v66 = v19;
  if (!v19)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    long long v66 = 0;
    unint64_t v60 = 0;
    if (!v16) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  unint64_t v60 = v18;
  swift_bridgeObjectRelease();
  if (!v16)
  {
LABEL_25:
    id v30 = v61;
    uint64_t v29 = v62;
    uint64_t v31 = v63;
    (*(void (**)(char *, void, uint64_t))(v62 + 104))(v61, *MEMORY[0x1E4F65730], v63);
    uint64_t v32 = (void *)MEMORY[0x1B3E62600](0, 0xE000000000000000, v30, v64, 0, 2, 0);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    char v21 = (void *)v68[2];
    uint64_t v28 = v68[3];
    uint64_t v33 = v68[6];
    uint64_t ObjectType = swift_getObjectType();
    objc_msgSend(v21, sel_restoreUserActivityState_, v32);
    v70[0] = (uint64_t)v21;
    uint64_t v27 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 32))(ObjectType, v33);

    if (v66) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
LABEL_22:
  uint64_t v20 = swift_getObjectType();
  char v21 = (void *)v68[2];
  uint64_t v52 = v68[3];
  uint64_t v22 = v15;
  uint64_t v23 = v68[6];
  uint64_t v24 = swift_getObjectType();
  v70[0] = (uint64_t)v21;
  uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 32);
  swift_unknownObjectRetain();
  uint64_t v53 = v24;
  uint64_t v26 = (void *)v25(v24, v23);
  (*(void (**)(uint64_t *__return_ptr, os_log_t, void *, uint64_t, uint64_t))(v22 + 16))(v70, v67, v26, v20, v22);

  swift_unknownObjectRelease();
  if ((v70[0] & 1) == 0) {
    goto LABEL_25;
  }
  v70[0] = (uint64_t)v21;
  uint64_t v27 = (void *)v25(v53, v23);
  if (v66)
  {
    uint64_t v28 = v52;
LABEL_26:
    uint64_t v35 = swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AD71FA1C(v27, (uint64_t)v70);
    v69[3] = swift_getObjectType();
    v69[4] = v28;
    v69[0] = v21;
    uint64_t v36 = v60;
    uint64_t v37 = *(void (**)(uint64_t *__return_ptr, os_log_t, uint64_t *, void *, uint64_t, uint64_t))(v60 + 16);
    id v38 = v21;
    v37(v71, v67, v70, v69, v35, v36);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease_n();
    sub_1AD71FFA8((uint64_t)v70);
    sub_1AD694CBC(v71[0], v71[1]);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
  }
LABEL_27:
  sub_1AD73CB00();
  uint64_t v40 = v57;
  uint64_t v41 = v58;
  uint64_t v42 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v56, v59);
  uint64_t v43 = sub_1AD73CB80();
  uint64_t v44 = sub_1AD73F900();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v67 = v43;
    id v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    long long v68 = v16;
    unint64_t v47 = v46;
    v70[0] = v46;
    *(_DWORD *)id v45 = 136446210;
    uint64_t v48 = sub_1AD73C2A0();
    v69[0] = sub_1AD1F62D4(v48, v49, v70);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v59);
    uint64_t v50 = v67;
    _os_log_impl(&dword_1AD1A4000, v67, v44, "launchPluginFromURL - %{public}s does not conform to PluginURLDelegate", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v47, -1, -1);
    MEMORY[0x1B3E68450](v45, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v65, v55);
}

double PluginDeepLinkRouter.launchPluginFromURL(_:pluginType:)@<D0>(char *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v70 = a1;
  long long v68 = a3;
  uint64_t v6 = sub_1AD73C2C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1AD73CBA0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_1AD73C390();
  uint64_t v69 = *(void *)(v66 - 8);
  MEMORY[0x1F4188790](v66);
  long long v65 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73C2A0();
  uint64_t v15 = sub_1AD71FC7C();
  uint64_t v62 = v11;
  uint64_t v61 = v9;
  uint64_t v60 = a2;
  if (v15)
  {
    swift_getObjectType();
    uint64_t v16 = swift_conformsToProtocol2();
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    if (v16) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = 0;
    }
    if (v18)
    {
      uint64_t v63 = v17;
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v63 = 0;
    }
    swift_getObjectType();
    uint64_t v19 = swift_conformsToProtocol2();
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    if (v19) {
      uint64_t v21 = v15;
    }
    else {
      uint64_t v21 = 0;
    }
    if (v21)
    {
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v63 = 0;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v21 = 0;
  uint64_t v20 = 0;
LABEL_21:
  uint64_t v67 = v3;
  uint64_t v64 = v20;
  if (v18)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v22 = v3[2];
    uint64_t v23 = v13;
    uint64_t v24 = v4[6];
    uint64_t v25 = v7;
    uint64_t v26 = swift_getObjectType();
    v72[0] = v22;
    uint64_t v59 = v10;
    uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(v24 + 32);
    swift_unknownObjectRetain();
    uint64_t v28 = v26;
    uint64_t v7 = v25;
    uint64_t v29 = v24;
    uint64_t v13 = v23;
    id v30 = (void *)v27(v28, v29);
    (*(void (**)(uint64_t *__return_ptr, char *, void *, uint64_t))(v63 + 16))(v72, v70, v30, ObjectType);

    uint64_t v10 = v59;
    swift_unknownObjectRelease();
    char v31 = v72[0];
    if (v21)
    {
LABEL_23:
      uint64_t v32 = v65;
      uint64_t v33 = v66;
      (*(void (**)(char *, void, uint64_t))(v69 + 104))(v65, *MEMORY[0x1E4F65748], v66);
      if (v31)
      {
        swift_unknownObjectRetain();
        id v34 = v67;
      }
      else
      {
        id v34 = v67;
        uint64_t v42 = v67[2];
        uint64_t v43 = v67[6];
        uint64_t v44 = swift_getObjectType();
        v72[0] = v42;
        id v45 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 8);
        swift_unknownObjectRetain();
        v45(v32, v44, v43);
      }
      uint64_t v46 = v32;
      unint64_t v47 = (void *)v34[2];
      uint64_t v48 = v34[3];
      uint64_t v49 = v34[6];
      uint64_t v50 = swift_getObjectType();
      v72[0] = (uint64_t)v47;
      uint64_t v51 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v49 + 32))(v50, v49);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v46, v33);
      uint64_t v52 = swift_getObjectType();
      sub_1AD71FA1C(v51, (uint64_t)v72);
      v71[4] = v48;
      v71[3] = v50;
      v71[0] = v47;
      uint64_t v53 = v64;
      uint64_t v54 = *(void (**)(char *, uint64_t *, void *, uint64_t, uint64_t))(v64 + 16);
      id v55 = v47;
      v54(v70, v72, v71, v52, v53);
      swift_unknownObjectRelease_n();

      swift_unknownObjectRelease();
      sub_1AD71FFA8((uint64_t)v72);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
      return result;
    }
  }
  else
  {
    char v31 = 0;
    if (v21) {
      goto LABEL_23;
    }
  }
  sub_1AD73CB00();
  uint64_t v35 = v61;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v61, v60, v6);
  uint64_t v36 = sub_1AD73CB80();
  os_log_type_t v37 = sub_1AD73F900();
  if (os_log_type_enabled(v36, v37))
  {
    id v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    v72[0] = v69;
    uint64_t v70 = v13;
    *(_DWORD *)id v38 = 136446210;
    uint64_t v67 = (void *)v6;
    uint64_t v39 = sub_1AD73C2A0();
    v71[0] = sub_1AD1F62D4(v39, v40, v72);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void *))(v7 + 8))(v35, v67);
    _os_log_impl(&dword_1AD1A4000, v36, v37, "launchPluginFromURL - %{public}s does not conform to PluginURLDelegate", v38, 0xCu);
    uint64_t v41 = v69;
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v41, -1, -1);
    MEMORY[0x1B3E68450](v38, -1, -1);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v70, v10);
  }
  else
  {
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v35, v6);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v13, v10);
  }
  double result = 0.0;
  *long long v68 = xmmword_1AD76DC90;
  return result;
}

uint64_t PluginDeepLinkRouter.launchPluginFromNSUA(activity:type:)(void *a1, uint64_t a2)
{
  uint64_t v67 = a2;
  uint64_t v3 = sub_1AD73CBA0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v64 - v8;
  uint64_t v10 = sub_1AD73C2F0();
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)&double v12 = MEMORY[0x1F4188790](v10).n128_u64[0];
  uint64_t v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(a1, sel_userInfo, v12);
  if (!v15)
  {
    long long v70 = 0u;
    long long v71 = 0u;
LABEL_18:
    sub_1AD1CC4BC((uint64_t)&v70, (uint64_t (*)(void))sub_1AD21DC2C);
    goto LABEL_19;
  }
  uint64_t v16 = v15;
  uint64_t v66 = a1;
  uint64_t v69 = v3;
  uint64_t v17 = sub_1AD73F030();

  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x1E4F65670], v10);
  uint64_t v18 = sub_1AD73C2E0();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  v73[26] = v18;
  v73[27] = v20;
  sub_1AD740600();
  if (*(void *)(v17 + 16) && (unint64_t v21 = sub_1AD259504((uint64_t)v73), (v22 & 1) != 0))
  {
    sub_1AD1F63A8(*(void *)(v17 + 56) + 32 * v21, (uint64_t)&v70);
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
  }
  uint64_t v3 = v69;
  sub_1AD25A4D0((uint64_t)v73);
  swift_bridgeObjectRelease();
  if (!*((void *)&v71 + 1)) {
    goto LABEL_18;
  }
  if (swift_dynamicCast())
  {
    uint64_t v23 = v73[0];
    uint64_t v24 = v73[1];
    uint64_t v25 = sub_1AD71FC7C();
    if (v25)
    {
      uint64_t v26 = v25;
      swift_getObjectType();
      uint64_t v27 = swift_conformsToProtocol2();
      if (v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
      if (v27) {
        uint64_t v29 = v26;
      }
      else {
        uint64_t v29 = 0;
      }
      if (v29) {
        swift_unknownObjectRetain();
      }
      else {
        uint64_t v28 = 0;
      }
      swift_getObjectType();
      uint64_t v35 = swift_conformsToProtocol2();
      if (v35) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = 0;
      }
      if (v35) {
        uint64_t v37 = v26;
      }
      else {
        uint64_t v37 = 0;
      }
      if (v37)
      {
        uint64_t v64 = v36;
        if (!v29) {
          goto LABEL_37;
        }
        goto LABEL_34;
      }
      swift_unknownObjectRelease();
      uint64_t v64 = 0;
      id v34 = 0;
      if (v29)
      {
LABEL_34:
        uint64_t v65 = v23;
        uint64_t v38 = v24;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v40 = v68[2];
        uint64_t v41 = v68[6];
        uint64_t v42 = swift_getObjectType();
        v73[0] = v40;
        uint64_t v43 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 32))(v42, v41);
        (*(void (**)(uint64_t *__return_ptr, void *, void *, uint64_t, uint64_t))(v28 + 24))(v73, v66, v43, ObjectType, v28);

        if (v37)
        {
          if (v73[0])
          {
            swift_unknownObjectRetain();
            uint64_t v44 = v68;
LABEL_38:
            uint64_t v49 = (void *)v44[2];
            uint64_t v50 = v44[3];
            uint64_t v51 = v44[6];
            uint64_t v52 = swift_getObjectType();
            v73[0] = (uint64_t)v49;
            uint64_t v53 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v51 + 32))(v52, v51);
            swift_bridgeObjectRelease();
            uint64_t v54 = swift_getObjectType();
            sub_1AD71FA1C(v53, (uint64_t)v73);
            *((void *)&v71 + 1) = v52;
            uint64_t v72 = v50;
            *(void *)&long long v70 = v49;
            uint64_t v55 = v64;
            uint64_t v56 = *(void (**)(void *, uint64_t *, long long *, uint64_t, uint64_t))(v64 + 16);
            id v57 = v49;
            v56(v66, v73, &v70, v54, v55);
            swift_unknownObjectRelease();
            swift_unknownObjectRelease_n();

            sub_1AD71FFA8((uint64_t)v73);
            return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
          }
LABEL_37:
          uint64_t v44 = v68;
          uint64_t v45 = v68[2];
          uint64_t v46 = v68[6];
          uint64_t v47 = swift_getObjectType();
          v73[0] = v45;
          uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 8);
          swift_unknownObjectRetain();
          v48(v67, v47, v46);
          goto LABEL_38;
        }
        id v34 = (void *)v29;
        uint64_t v24 = v38;
        uint64_t v23 = v65;
      }
    }
    else
    {
      id v34 = 0;
    }
    long long v68 = v34;
    sub_1AD73CB00();
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_1AD73CB80();
    os_log_type_t v59 = sub_1AD73F900();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = swift_slowAlloc();
      uint64_t v65 = v23;
      uint64_t v61 = (uint8_t *)v60;
      unint64_t v62 = v24;
      uint64_t v63 = swift_slowAlloc();
      v73[0] = v63;
      *(_DWORD *)uint64_t v61 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)&long long v70 = sub_1AD1F62D4(v65, v62, v73);
      sub_1AD7403B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1AD1A4000, v58, v59, "%{public}s does not conform to PluginNSUADelegate", v61, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v63, -1, -1);
      MEMORY[0x1B3E68450](v61, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v69);
  }
LABEL_19:
  sub_1AD73CB00();
  id v30 = sub_1AD73CB80();
  os_log_type_t v31 = sub_1AD73F920();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_1AD1A4000, v30, v31, "UserActivity is missing plugin bundle name", v32, 2u);
    MEMORY[0x1B3E68450](v32, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PluginDeepLinkRouter.launchPluginFromWebBrowsingActivity(activity:pluginType:)(char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v61 = a1;
  uint64_t v5 = sub_1AD73C2C0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1AD73CBA0();
  uint64_t v55 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1AD73C390();
  uint64_t v58 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v52 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = a2;
  sub_1AD73C2A0();
  uint64_t v12 = sub_1AD71FC7C();
  if (v12)
  {
    swift_getObjectType();
    uint64_t v13 = swift_conformsToProtocol2();
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    if (v13) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v15) {
      swift_unknownObjectRetain();
    }
    else {
      uint64_t v14 = 0;
    }
    swift_getObjectType();
    if (swift_conformsToProtocol2()) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = 0;
    }
    if (v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v16 = 0;
LABEL_18:
  uint64_t v60 = v16;
  uint64_t v57 = v6;
  uint64_t v56 = v3;
  if (v15)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v17 = v3[2];
    uint64_t v18 = v3[6];
    uint64_t v19 = swift_getObjectType();
    v63[0] = v17;
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 32);
    swift_unknownObjectRetain();
    unint64_t v21 = (void *)v20(v19, v18);
    (*(void (**)(uint64_t *__return_ptr, char *, void *, uint64_t, uint64_t))(v14 + 24))(v63, v61, v21, ObjectType, v14);

    swift_unknownObjectRelease();
    char v22 = v63[0];
  }
  else
  {
    char v22 = 0;
  }
  uint64_t v23 = v59;
  sub_1AD73C2A0();
  uint64_t v24 = sub_1AD71FC7C();
  swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_33;
  }
  swift_getObjectType();
  uint64_t v25 = swift_conformsToProtocol2();
  if (v25) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = 0;
  }
  if (v25) {
    uint64_t v27 = v24;
  }
  else {
    uint64_t v27 = 0;
  }
  if (!v27)
  {
    swift_unknownObjectRelease();
LABEL_33:
    sub_1AD73CB00();
    uint64_t v42 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v8, v23, v5);
    uint64_t v43 = sub_1AD73CB80();
    os_log_type_t v44 = sub_1AD73F900();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t v59 = v5;
      uint64_t v61 = v10;
      uint64_t v47 = v46;
      v63[0] = v46;
      *(_DWORD *)uint64_t v45 = 136446210;
      uint64_t v48 = sub_1AD73C2A0();
      v62[0] = sub_1AD1F62D4(v48, v49, v63);
      sub_1AD7403B0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v59);
      _os_log_impl(&dword_1AD1A4000, v43, v44, "%{public}s does not conform to PluginNSUADelegate", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v47, -1, -1);
      MEMORY[0x1B3E68450](v45, -1, -1);
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v61, v54);
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v5);

      return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v10, v54);
    }
  }
  uint64_t v59 = v26;
  uint64_t v28 = v52;
  uint64_t v29 = v53;
  (*(void (**)(char *, void, uint64_t))(v58 + 104))(v52, *MEMORY[0x1E4F65748], v53);
  if ((v22 & 1) == 0)
  {
    uint64_t v30 = v56[2];
    uint64_t v31 = v56[6];
    uint64_t v32 = swift_getObjectType();
    v63[0] = v30;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 8))(v28, v32, v31);
  }
  uint64_t v33 = (void *)v56[2];
  uint64_t v57 = v56[3];
  uint64_t v34 = v56[6];
  uint64_t v35 = swift_getObjectType();
  v63[0] = (uint64_t)v33;
  uint64_t v36 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 32))(v35, v34);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v28, v29);
  uint64_t v37 = swift_getObjectType();
  sub_1AD71FA1C(v36, (uint64_t)v63);
  v62[4] = v57;
  v62[3] = v35;
  v62[0] = v33;
  uint64_t v38 = v59;
  uint64_t v39 = *(void (**)(char *, uint64_t *, void *, uint64_t, uint64_t))(v59 + 16);
  id v40 = v33;
  v39(v61, v63, v62, v37, v38);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  sub_1AD71FFA8((uint64_t)v63);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
}

uint64_t PluginDeepLinkRouter.init(viewControllerRouter:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 32) = v3;
  *(void *)(v1 + 48) = v2;
  return v1;
}

id sub_1AD71FA1C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = v2;
  UIViewController.availableHealthExperienceStore.getter((uint64_t)&v24);
  if (*((void *)&v25 + 1))
  {
    sub_1AD20FE90(&v24, (uint64_t)v34);
  }
  else
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v3[4];
    uint64_t ObjectType = swift_getObjectType();
    v33[0] = v5;
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v6 + 8))(v34, ObjectType, v6);
    sub_1AD1CC4BC((uint64_t)&v24, (uint64_t (*)(void))sub_1AD72007C);
  }
  id v8 = sub_1AD2045A0();
  if (!v8)
  {
    uint64_t v9 = v3[2];
    uint64_t v10 = v3[5];
    uint64_t v11 = swift_getObjectType();
    *(void *)&long long v24 = v9;
    id v8 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v11, v10);
  }
  uint64_t v12 = v8;
  UIViewController.resolvedPinnedContentManager.getter((uint64_t)v33);
  sub_1AD1FFE38((uint64_t)v34, (uint64_t)v32);
  UIViewController.resolvedPinnedContentManager.getter((uint64_t)v31);
  sub_1AD1FFE38((uint64_t)v34, (uint64_t)v23);
  id v13 = v12;
  id v14 = objc_msgSend(v13, sel_profileIdentifier);
  id v15 = objc_msgSend(v14, sel_type);

  if (v15 == (id)2) {
    char v16 = 3;
  }
  else {
    char v16 = v15 != (id)3;
  }
  sub_1AD1FFE38((uint64_t)v33, (uint64_t)v22);
  DataTypeDetailConfiguration.Context.init(healthExperienceStore:healthStore:mode:pinnedContentManager:chartContext:restorationUserActivity:)((uint64_t)v23, v13, v16, (uint64_t)v22, 0, 0, (uint64_t)&v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  sub_1AD20FE90(v32, a2);
  *(void *)(a2 + 40) = v13;
  sub_1AD20FE90(v31, a2 + 48);
  long long v17 = v26;
  *(_OWORD *)(a2 + 136) = v27;
  long long v18 = v29;
  *(_OWORD *)(a2 + 152) = v28;
  *(_OWORD *)(a2 + 168) = v18;
  *(_OWORD *)(a2 + 184) = v30;
  long long v19 = v25;
  *(_OWORD *)(a2 + 88) = v24;
  *(_OWORD *)(a2 + 104) = v19;
  *(_OWORD *)(a2 + 120) = v17;
  *(void *)(a2 + 200) = a1;
  return a1;
}

uint64_t PluginDeepLinkRouter.deinit()
{
  return v0;
}

uint64_t PluginDeepLinkRouter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1AD71FC7C()
{
  uint64_t v0 = sub_1AD73CBA0();
  MEMORY[0x1F4188790](v0);
  sub_1AD73C950();
  sub_1AD73C940();
  uint64_t v1 = (void *)sub_1AD73C860();
  swift_release();
  uint64_t v3 = NSBundle.getPluginAppDelegateClass()();

  return v3;
}

uint64_t sub_1AD71FFA8(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for PluginDeepLinkRouter()
{
  return self;
}

uint64_t method lookup function for PluginDeepLinkRouter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PluginDeepLinkRouter);
}

uint64_t dispatch thunk of PluginDeepLinkRouter.__allocating_init(viewControllerRouter:)(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(_OWORD *))(v1 + 88);
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 16);
  v6[0] = *(_OWORD *)a1;
  v6[1] = v4;
  uint64_t v7 = v3;
  return v2(v6);
}

void sub_1AD72007C()
{
  if (!qword_1EB738408)
  {
    sub_1AD2196B8(255, (unint64_t *)&qword_1EB738400);
    unint64_t v0 = sub_1AD740340();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738408);
    }
  }
}

uint64_t ContactQuickActionType.rawValue.getter()
{
  return *v0;
}

uint64_t sub_1AD7200F0(unsigned char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (*a1 == 1)
  {
    unint64_t v4 = sub_1AD722094(a3, a4);
  }
  else
  {
    if (*a1) {
      return 0;
    }
    unint64_t v4 = sub_1AD721028(a2, a3, a4);
  }
  if (v4 >> 62)
  {
    sub_1AD2147D4(0, &qword_1E9A346F0);
    swift_bridgeObjectRetain();
    sub_1AD7408C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1AD740BE0();
    sub_1AD2147D4(0, &qword_1E9A346F0);
  }
  swift_bridgeObjectRelease();
  sub_1AD2147D4(0, (unint64_t *)&unk_1E9A2C440);
  return sub_1AD73FFB0();
}

uint64_t sub_1AD72022C(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 1;
  switch(*a1)
  {
    case 1:
      uint64_t v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
      uint64_t v7 = &selRef_isPhoneAppAvailable;
      goto LABEL_6;
    case 2:
      id v8 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 32);
      uint64_t v9 = (void *)v8(a2, a3);
      unsigned int v10 = objc_msgSend(v9, sel_isFaceTimeAppAvailable);

      if (!v10) {
        return 0;
      }
      uint64_t v6 = (void *)v8(a2, a3);
      uint64_t v7 = &selRef_isConferencingAvailable;
LABEL_6:
      uint64_t v3 = (uint64_t)[v6 *v7];

      return v3;
    case 3:
      return v3;
    default:
      uint64_t v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
      uint64_t v7 = &selRef_isMessagesAppAvailable;
      goto LABEL_6;
  }
}

void sub_1AD720374(unsigned char *a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  switch(*a1)
  {
    case 1:
      sub_1AD720690(a2, a3, a5, a6);
      break;
    case 2:
      sub_1AD720838(a5, a6);
      break;
    case 3:
      sub_1AD720A80(a4, a5, a6);
      break;
    default:
      sub_1AD720568(a2, a3, a4);
      break;
  }
}

HealthExperienceUI::ContactQuickActionType_optional __swiftcall ContactQuickActionType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (HealthExperienceUI::ContactQuickActionType_optional)rawValue;
}

unint64_t sub_1AD720408()
{
  unint64_t result = qword_1E9A346E0;
  if (!qword_1E9A346E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A346E0);
  }
  return result;
}

HealthExperienceUI::ContactQuickActionType_optional sub_1AD72045C(Swift::Int *a1)
{
  return ContactQuickActionType.init(rawValue:)(*a1);
}

unsigned char *storeEnumTagSinglePayload for ContactQuickActionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AD720530);
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

ValueMetadata *type metadata accessor for ContactQuickActionType()
{
  return &type metadata for ContactQuickActionType;
}

void sub_1AD720568(uint64_t a1, unint64_t a2, void *a3)
{
  if (a2) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = 0xE000000000000000;
  }
  id v7 = objc_allocWithZone(MEMORY[0x1E4F350F8]);
  swift_bridgeObjectRetain();
  id v10 = objc_msgSend(v7, sel_init);
  objc_msgSend(v10, sel_setMessageComposeDelegate_, v3);
  objc_msgSend(v10, sel_setModalPresentationStyle_, 2);
  sub_1AD1E4524();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1AD74C370;
  *(void *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v6;
  uint64_t v9 = (void *)sub_1AD73F490();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setRecipients_, v9);

  if (a3) {
    objc_msgSend(a3, sel_presentViewController_animated_completion_, v10, 1, 0);
  }
}

void sub_1AD720690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 32);
    swift_bridgeObjectRetain();
    id v7 = (void *)v6(a3, a4);
    unsigned int v8 = objc_msgSend(v7, sel_hasCellularTelephonyCapability);

    if (v8)
    {
      id v9 = objc_allocWithZone(MEMORY[0x1E4F1BA70]);
      id v10 = (void *)sub_1AD73F180();
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v9, sel_initWithStringValue_, v10);

      (*(void (**)(id, uint64_t))(*(void *)(a4 + 8) + 8))(v11, a3);
      return;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = (void *)v6(a3, a4);
  }
  else
  {
    uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  }
  id v13 = v12;
  unsigned int v14 = objc_msgSend(v12, sel_isFaceTimeAudioAvailable);

  if (v14)
  {
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
    if (v16)
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + 8))(0, v15, v16, a3);
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_1AD720838(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AD73CBA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = MEMORY[0x1F4188790](v4);
  unsigned int v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(a2 + 40))(a1, a2, v6);
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 16) + 8))(1, v9, v10, a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1AD73CAD0();
    uint64_t v12 = sub_1AD73CB80();
    os_log_type_t v13 = sub_1AD73F920();
    if (os_log_type_enabled(v12, v13))
    {
      unsigned int v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v18 = a1;
      uint64_t v19 = v15;
      *(_DWORD *)unsigned int v14 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v16 = sub_1AD73F220();
      uint64_t v18 = sub_1AD1F62D4(v16, v17, &v19);
      sub_1AD7403B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v12, v13, "[%s] Cannot FaceTime because there is no known email or phone number", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v15, -1, -1);
      MEMORY[0x1B3E68450](v14, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

void sub_1AD720A80(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD73CBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 24);
    id v11 = a1;
    uint64_t v20 = (void *)v10(a2, a3);
    sub_1AD720CD0(v20);

    uint64_t v12 = v20;
  }
  else
  {
    sub_1AD73CB20();
    os_log_type_t v13 = sub_1AD73CB80();
    os_log_type_t v14 = sub_1AD73F920();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v22 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v17 = sub_1AD740E30();
      uint64_t v21 = sub_1AD1F62D4(v17, v18, &v22);
      sub_1AD7403B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v13, v14, "[%s] Presenting view controller not found", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v16, -1, -1);
      MEMORY[0x1B3E68450](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_1AD720CD0(void *a1)
{
  char v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_1AD73CBA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (char *)objc_msgSend(self, sel_authorizationStatusForEntityType_, 0);
  if ((unint64_t)(v8 - 1) < 2)
  {
    sub_1AD722DA4();
  }
  else if (v8)
  {
    if (v8 == (char *)3)
    {
      sub_1AD722BDC(a1);
    }
    else
    {
      sub_1AD73CAD0();
      os_log_type_t v14 = sub_1AD73CB80();
      os_log_type_t v15 = sub_1AD73F920();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136446210;
        uint64_t v20 = v16 + 4;
        aBlock[0] = v17;
        uint64_t v18 = sub_1AD740E30();
        aBlock[6] = sub_1AD1F62D4(v18, v19, aBlock);
        sub_1AD7403B0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1AD1A4000, v14, v15, "[%{public}s]: Unknown authorization status, showing access required alert.", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B3E68450](v17, -1, -1);
        MEMORY[0x1B3E68450](v16, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      sub_1AD722DA4();
    }
  }
  else
  {
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B980]), sel_init);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v2;
    *(void *)(v10 + 24) = a1;
    aBlock[4] = (uint64_t)sub_1AD723584;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1AD6F3484;
    aBlock[3] = (uint64_t)&block_descriptor_103;
    id v11 = _Block_copy(aBlock);
    id v12 = v2;
    id v13 = a1;
    swift_release();
    objc_msgSend(v9, sel_requestAccessForEntityType_completionHandler_, 0, v11);
    _Block_release(v11);
  }
}

uint64_t sub_1AD721028(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v159 = a3;
  uint64_t v160 = a2;
  uint64_t v161 = sub_1AD73CBA0();
  uint64_t v6 = *(void *)(v161 - 8);
  MEMORY[0x1F4188790](v161);
  uint64_t v8 = (char *)&v152 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v11 = (char *)&v152 - v10;
  MEMORY[0x1F4188790](v12);
  os_log_type_t v14 = (char *)&v152 - v13;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v152 - v16;
  if (!objc_msgSend(self, sel_canSendText))
  {
    uint64_t v158 = v6;
    sub_1AD73CAD0();
    swift_unknownObjectRetain_n();
    uint64_t v61 = sub_1AD73CB80();
    os_log_type_t v62 = sub_1AD73F920();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v166 = v4;
      uint64_t v167 = (void *)v64;
      *(_DWORD *)uint64_t v63 = 136315138;
      swift_unknownObjectRetain();
      uint64_t v65 = sub_1AD73F240();
      uint64_t v166 = sub_1AD1F62D4(v65, v66, (uint64_t *)&v167);
      sub_1AD7403B0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v61, v62, "%s: MFMessageComposeViewController is not in the state to send text", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v64, -1, -1);
      MEMORY[0x1B3E68450](v63, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v158 + 8))(v8, v161);
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v157 = (void *)v4;
  if (!a1)
  {
    sub_1AD73CAD0();
    uint64_t v67 = (uint64_t)v157;
    swift_unknownObjectRetain_n();
    long long v68 = sub_1AD73CB80();
    os_log_type_t v69 = sub_1AD73F920();
    if (os_log_type_enabled(v68, v69))
    {
      long long v70 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      uint64_t v166 = v67;
      uint64_t v167 = (void *)v71;
      *(_DWORD *)long long v70 = 136315138;
      swift_unknownObjectRetain();
      uint64_t v72 = sub_1AD73F240();
      uint64_t v166 = sub_1AD1F62D4(v72, v73, (uint64_t *)&v167);
      sub_1AD7403B0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v68, v69, "%s: presentingViewController is nil so cannot send text", v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v71, -1, -1);
      MEMORY[0x1B3E68450](v70, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v161);
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v158 = v6;
  uint64_t v18 = v159;
  uint64_t v19 = v159 + 32;
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(v159 + 32);
  id v154 = a1;
  v155 = v20;
  uint64_t v21 = v157;
  uint64_t v22 = v160;
  uint64_t v156 = v19;
  uint64_t v23 = (void *)v20(v160, v18);
  unsigned int v24 = objc_msgSend(v23, sel_hasSMSCapability);

  v153 = v14;
  if (!v24)
  {
    sub_1AD73CB20();
    id v74 = sub_1AD73CB80();
    os_log_type_t v75 = sub_1AD73F940();
    if (!os_log_type_enabled(v74, v75))
    {

      (*(void (**)(char *, uint64_t))(v158 + 8))(v17, v161);
      uint64_t v30 = MEMORY[0x1E4FBC868];
      goto LABEL_40;
    }
    uint64_t v76 = (uint8_t *)swift_slowAlloc();
    uint64_t v77 = swift_slowAlloc();
    uint64_t v167 = (void *)v77;
    *(_DWORD *)uint64_t v76 = 136315138;
    uint64_t v78 = v160;
    uint64_t v79 = sub_1AD740E30();
    uint64_t v166 = sub_1AD1F62D4(v79, v80, (uint64_t *)&v167);
    uint64_t v21 = v157;
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD1A4000, v74, v75, "[%s] SMS is not available", v76, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v77, -1, -1);
    MEMORY[0x1B3E68450](v76, -1, -1);

    uint64_t v81 = v17;
    uint64_t v28 = v78;
    (*(void (**)(char *, uint64_t))(v158 + 8))(v81, v161);
LABEL_46:
    uint64_t v30 = MEMORY[0x1E4FBC868];
LABEL_47:
    uint64_t v83 = v159;
    long long v84 = v155;
    v85 = (void *)v155(v28, v159);
    unsigned int v86 = objc_msgSend(v85, sel_isMessagesAppAvailable);

    if (v86
      && (uint64_t v87 = (void *)v84(v28, v83),
          unsigned int v88 = objc_msgSend(v87, sel_isMadridConfigured),
          v87,
          v88))
    {
      uint64_t v89 = (void *)v84(v28, v83);
      unsigned __int8 v90 = objc_msgSend(v89, sel_hasSMSCapability);

      uint64_t v91 = *(uint64_t (**)(uint64_t, uint64_t))(v83 + 24);
      if (v90)
      {
        unint64_t v92 = 0;
      }
      else
      {
        uint64_t v105 = (void *)v91(v28, v83);
        id v106 = objc_msgSend(v105, sel_phoneNumbers);

        sub_1AD2147D4(0, &qword_1E9A2F6B0);
        unint64_t v107 = sub_1AD73F4B0();

        MEMORY[0x1F4188790](v108);
        *(&v152 - 4) = v28;
        *(&v152 - 3) = v83;
        *(&v152 - 2) = (uint64_t)v21;
        unint64_t v92 = 0;
        unint64_t v109 = sub_1AD2F3C0C(sub_1AD723608, (uint64_t)(&v152 - 6), v107);
        swift_bridgeObjectRelease();
        if (v109)
        {
          id v110 = objc_msgSend(v109, sel_label);
          uint64_t v165 = 0;
          if (v110)
          {
            v111 = v110;
            uint64_t v112 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
            uint64_t v114 = v113;
          }
          else
          {
            uint64_t v112 = 0;
            uint64_t v114 = 0xE000000000000000;
          }
          id v115 = objc_msgSend(v109, sel_value);
          id v116 = objc_msgSend(v115, sel_stringValue);

          uint64_t v117 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v119 = v118;

          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v167 = (void *)v30;
          sub_1AD200B14(v117, v119, v112, v114, isUniquelyReferenced_nonNull_native);
          uint64_t v30 = (uint64_t)v167;

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v21 = v157;
          uint64_t v83 = v159;
          unint64_t v92 = v165;
        }
        else
        {
          uint64_t v83 = v159;
        }
      }
      uint64_t v121 = (void *)v91(v160, v83);
      id v122 = objc_msgSend(v121, sel_emailAddresses);

      sub_1AD2147D4(0, &qword_1E9A2F6B0);
      unint64_t v123 = sub_1AD73F4B0();

      if (v123 >> 62) {
        goto LABEL_89;
      }
      uint64_t v124 = *(void *)((v123 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      while (v124)
      {
        unint64_t v162 = v123;
        unint64_t v163 = v123 & 0xC000000000000001;
        uint64_t v125 = 4;
        uint64_t v161 = v124;
        while (1)
        {
          id v127 = v163 ? (id)MEMORY[0x1B3E669F0](v125 - 4, v123) : *(id *)(v123 + 8 * v125);
          uint64_t v21 = v127;
          if (__OFADD__(v125 - 4, 1)) {
            break;
          }
          unint64_t v164 = v125 - 3;
          uint64_t v165 = v92;
          id v128 = objc_msgSend(v127, sel_label);
          if (v128)
          {
            uint64_t v129 = v128;
            _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

            v130 = self;
            uint64_t v131 = (void *)sub_1AD73F180();
            id v132 = objc_msgSend(v130, sel_localizedStringForLabel_, v131);

            uint64_t v133 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
            unint64_t v123 = v134;
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v133 = 0;
            unint64_t v123 = 0xE000000000000000;
          }
          id v135 = objc_msgSend(v21, sel_value);
          uint64_t v136 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
          uint64_t v138 = v137;

          uint64_t v139 = v30;
          char v140 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v167 = (void *)v30;
          unint64_t v92 = sub_1AD20F694(v133, v123);
          uint64_t v142 = *(void *)(v30 + 16);
          BOOL v143 = (v141 & 1) == 0;
          uint64_t v144 = v142 + v143;
          if (__OFADD__(v142, v143)) {
            goto LABEL_87;
          }
          uint64_t v30 = v141;
          if (*(void *)(v139 + 24) >= v144)
          {
            if (v140)
            {
              v147 = v167;
              if (v141) {
                goto LABEL_65;
              }
            }
            else
            {
              sub_1AD390298();
              v147 = v167;
              if (v30) {
                goto LABEL_65;
              }
            }
          }
          else
          {
            sub_1AD200CB8(v144, v140);
            unint64_t v145 = sub_1AD20F694(v133, v123);
            if ((v30 & 1) != (v146 & 1)) {
              goto LABEL_91;
            }
            unint64_t v92 = v145;
            v147 = v167;
            if (v30)
            {
LABEL_65:
              uint64_t v30 = (uint64_t)v147;
              uint64_t v126 = (uint64_t *)(v147[7] + 16 * v92);
              swift_bridgeObjectRelease();
              *uint64_t v126 = v136;
              v126[1] = v138;
              goto LABEL_66;
            }
          }
          v147[(v92 >> 6) + 8] |= 1 << v92;
          uint64_t v148 = (uint64_t *)(v147[6] + 16 * v92);
          *uint64_t v148 = v133;
          v148[1] = v123;
          uint64_t v149 = (uint64_t *)(v147[7] + 16 * v92);
          *uint64_t v149 = v136;
          v149[1] = v138;
          uint64_t v150 = v147[2];
          BOOL v59 = __OFADD__(v150, 1);
          uint64_t v151 = v150 + 1;
          if (v59) {
            goto LABEL_88;
          }
          uint64_t v30 = (uint64_t)v147;
          v147[2] = v151;
          swift_bridgeObjectRetain();
LABEL_66:

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          ++v125;
          unint64_t v123 = v162;
          unint64_t v92 = v165;
          if (v164 == v161)
          {
            uint64_t v100 = swift_bridgeObjectRelease_n();
            uint64_t v21 = v157;
            uint64_t v28 = v160;
            goto LABEL_54;
          }
        }
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        swift_bridgeObjectRetain_n();
        uint64_t v124 = sub_1AD7408D0();
        swift_bridgeObjectRelease();
      }
      uint64_t v100 = swift_bridgeObjectRelease_n();
      uint64_t v28 = v160;
    }
    else
    {
      v93 = v153;
      sub_1AD73CB20();
      v94 = sub_1AD73CB80();
      os_log_type_t v95 = sub_1AD73F940();
      if (os_log_type_enabled(v94, v95))
      {
        uint64_t v96 = (uint8_t *)swift_slowAlloc();
        uint64_t v97 = swift_slowAlloc();
        uint64_t v167 = (void *)v97;
        *(_DWORD *)uint64_t v96 = 136315138;
        uint64_t v98 = sub_1AD740E30();
        uint64_t v166 = sub_1AD1F62D4(v98, v99, (uint64_t *)&v167);
        uint64_t v21 = v157;
        sub_1AD7403B0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1AD1A4000, v94, v95, "[%s] iMessage is not available", v96, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B3E68450](v97, -1, -1);
        MEMORY[0x1B3E68450](v96, -1, -1);
      }

      uint64_t v100 = (*(uint64_t (**)(char *, uint64_t))(v158 + 8))(v93, v161);
    }
LABEL_54:
    MEMORY[0x1F4188790](v100);
    uint64_t v101 = v159;
    *(&v152 - 4) = v28;
    *(&v152 - 3) = v101;
    uint64_t v102 = v154;
    *(&v152 - 2) = (uint64_t)v21;
    *(&v152 - 1) = (uint64_t)v102;
    uint64_t v103 = swift_bridgeObjectRetain();
    uint64_t v82 = sub_1AD516C64(v103, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1AD7235FC);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v82;
  }
  long long v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 24))(v22, v18);
  id v26 = objc_msgSend(v25, sel_phoneNumbers);

  sub_1AD2147D4(0, &qword_1E9A2F6B0);
  unint64_t v27 = sub_1AD73F4B0();

  uint64_t v28 = v22;
  if (v27 >> 62) {
    goto LABEL_44;
  }
  uint64_t v29 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v29)
  {
LABEL_45:
    swift_bridgeObjectRelease_n();
    goto LABEL_46;
  }
LABEL_6:
  unint64_t v164 = v27 & 0xC000000000000001;
  uint64_t v30 = MEMORY[0x1E4FBC868];
  uint64_t v28 = 4;
  unint64_t v162 = v29;
  unint64_t v163 = v27;
  while (1)
  {
    if (v164) {
      id v32 = (id)MEMORY[0x1B3E669F0](v28 - 4, v27);
    }
    else {
      id v32 = *(id *)(v27 + 8 * v28);
    }
    uint64_t v21 = v32;
    if (__OFADD__(v28 - 4, 1))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      swift_bridgeObjectRetain_n();
      uint64_t v29 = sub_1AD7408D0();
      swift_bridgeObjectRelease();
      if (!v29) {
        goto LABEL_45;
      }
      goto LABEL_6;
    }
    id v33 = objc_msgSend(v32, sel_label);
    uint64_t v165 = v28 - 3;
    if (v33)
    {
      uint64_t v34 = v33;
      _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

      uint64_t v35 = self;
      uint64_t v36 = (void *)sub_1AD73F180();
      id v37 = objc_msgSend(v35, sel_localizedStringForLabel_, v36);

      uint64_t v38 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      unint64_t v27 = v39;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v38 = 0;
      unint64_t v27 = 0xE000000000000000;
    }
    id v40 = objc_msgSend(v21, sel_value);
    id v41 = objc_msgSend(v40, sel_stringValue);

    uint64_t v42 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v44 = v43;

    uint64_t v45 = v30;
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v167 = (void *)v45;
    unint64_t v48 = sub_1AD20F694(v38, v27);
    uint64_t v49 = *(void *)(v45 + 16);
    BOOL v50 = (v47 & 1) == 0;
    uint64_t v51 = v49 + v50;
    if (__OFADD__(v49, v50)) {
      goto LABEL_42;
    }
    char v52 = v47;
    if (*(void *)(v45 + 24) < v51) {
      break;
    }
    if (v46)
    {
      uint64_t v55 = v167;
      if ((v47 & 1) == 0) {
        goto LABEL_23;
      }
    }
    else
    {
      sub_1AD390298();
      uint64_t v55 = v167;
      if ((v52 & 1) == 0)
      {
LABEL_23:
        v55[(v48 >> 6) + 8] |= 1 << v48;
        uint64_t v56 = (uint64_t *)(v55[6] + 16 * v48);
        *uint64_t v56 = v38;
        v56[1] = v27;
        uint64_t v57 = (uint64_t *)(v55[7] + 16 * v48);
        uint64_t *v57 = v42;
        v57[1] = v44;
        uint64_t v58 = v55[2];
        BOOL v59 = __OFADD__(v58, 1);
        uint64_t v60 = v58 + 1;
        if (v59) {
          goto LABEL_43;
        }
        uint64_t v30 = (uint64_t)v55;
        long long v55[2] = v60;
        swift_bridgeObjectRetain();
        goto LABEL_8;
      }
    }
LABEL_7:
    uint64_t v30 = (uint64_t)v55;
    uint64_t v31 = (uint64_t *)(v55[7] + 16 * v48);
    swift_bridgeObjectRelease();
    uint64_t *v31 = v42;
    v31[1] = v44;
LABEL_8:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v28;
    unint64_t v27 = v163;
    if (v165 == v162)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v21 = v157;
LABEL_40:
      uint64_t v28 = v160;
      goto LABEL_47;
    }
  }
  sub_1AD200CB8(v51, v46);
  unint64_t v53 = sub_1AD20F694(v38, v27);
  if ((v52 & 1) == (v54 & 1))
  {
    unint64_t v48 = v53;
    uint64_t v55 = v167;
    if ((v52 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_7;
  }
LABEL_91:
  uint64_t result = sub_1AD740C30();
  __break(1u);
  return result;
}

uint64_t sub_1AD722094(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1AD73CBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v55 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v11 = (char *)&v50 - v10;
  LOBYTE(v59) = 1;
  id v12 = sub_1AD660778();
  uint64_t v59 = MEMORY[0x1E4FBC860];
  char v54 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 32);
  uint64_t v13 = (void *)v54(a1, a2);
  unsigned int v14 = objc_msgSend(v13, sel_hasCellularTelephonyCapability);

  uint64_t v56 = a1;
  if (v14)
  {
    uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
    id v16 = objc_msgSend(v15, sel_phoneNumbers);

    sub_1AD2147D4(0, &qword_1E9A2F6B0);
    unint64_t v17 = sub_1AD73F4B0();

    MEMORY[0x1F4188790](v18);
    uint64_t v46 = v56;
    char v47 = (uint64_t (*)())a2;
    unint64_t v48 = (unint64_t)v12;
    uint64_t v49 = v3;
    uint64_t v19 = sub_1AD2F2574((void (*)(uint64_t *__return_ptr, id *))sub_1AD723750, (uint64_t)v45, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v56;
    uint64_t v59 = v19;
  }
  else
  {
    id v53 = v12;
    sub_1AD73CB20();
    uint64_t v20 = sub_1AD73CB80();
    os_log_type_t v21 = sub_1AD73F940();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v52 = v6;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v51 = v7;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v58 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      BOOL v50 = v23 + 4;
      uint64_t v25 = sub_1AD740E30();
      uint64_t v57 = sub_1AD1F62D4(v25, v26, &v58);
      a1 = v56;
      sub_1AD7403B0();
      uint64_t v6 = v52;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v20, v21, "[%s] cellular is not available", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v24, -1, -1);
      unint64_t v27 = v23;
      uint64_t v7 = v51;
      MEMORY[0x1B3E68450](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    id v12 = v53;
  }
  uint64_t v28 = (void *)v54(a1, a2);
  unsigned int v29 = objc_msgSend(v28, sel_isFaceTimeAudioAvailable);

  if (v29 && (uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 40))(v56, a2), v31))
  {
    uint64_t v32 = v30;
    uint64_t v33 = v31;
    sub_1AD2147D4(0, (unint64_t *)&unk_1E9A2D9F0);
    if (qword_1EB732818 != -1) {
      swift_once();
    }
    unint64_t v48 = 0xE000000000000000;
    sub_1AD73A1D0();
    uint64_t v34 = (void *)swift_allocObject();
    v34[2] = v56;
    v34[3] = a2;
    v34[4] = v3;
    void v34[5] = v32;
    v34[6] = v33;
    id v35 = v12;
    swift_unknownObjectRetain();
    v45[0] = 0;
    v45[1] = 0;
    char v47 = sub_1AD723704;
    unint64_t v48 = (unint64_t)v34;
    uint64_t v46 = 0;
    id v36 = (id)sub_1AD7400A0();
    MEMORY[0x1B3E657B0]();
    if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1AD73F510();
    }
    sub_1AD73F560();
    sub_1AD73F4D0();
  }
  else
  {
    id v37 = v55;
    sub_1AD73CB20();
    uint64_t v38 = sub_1AD73CB80();
    os_log_type_t v39 = sub_1AD73F940();
    if (os_log_type_enabled(v38, v39))
    {
      id v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v58 = v41;
      *(_DWORD *)id v40 = 136315138;
      uint64_t v42 = sub_1AD740E30();
      uint64_t v57 = sub_1AD1F62D4(v42, v43, &v58);
      sub_1AD7403B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD1A4000, v38, v39, "[%s] FaceTime audio is not available", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E68450](v41, -1, -1);
      MEMORY[0x1B3E68450](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v55, v6);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v37, v6);
    }
  }
  return v59;
}

uint64_t sub_1AD722758@<X0>(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  id v8 = *a1;
  id v9 = objc_msgSend(*a1, sel_label);
  if (v9)
  {
    uint64_t v10 = v9;
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

    id v11 = self;
    id v12 = (void *)sub_1AD73F180();
    id v13 = objc_msgSend(v11, sel_localizedStringForLabel_, v12);

    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    swift_bridgeObjectRelease();
  }
  sub_1AD2147D4(0, (unint64_t *)&unk_1E9A2D9F0);
  id v14 = a2;
  id v15 = objc_msgSend(v8, sel_value);
  id v16 = objc_msgSend(v15, sel_stringValue);

  _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  unint64_t v17 = (void *)swift_allocObject();
  v17[2] = a4;
  v17[3] = a5;
  v17[4] = a3;
  v17[5] = v8;
  swift_unknownObjectRetain();
  id v18 = v8;
  uint64_t result = sub_1AD7400A0();
  *a6 = result;
  return result;
}

void sub_1AD722934(int a1, int a2, id a3, uint64_t a4, uint64_t a5)
{
  id v6 = objc_msgSend(a3, sel_value);
  (*(void (**)(void))(*(void *)(a5 + 8) + 8))();
}

uint64_t sub_1AD7229A8(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = objc_msgSend(*a1, sel_value);
  id v7 = objc_msgSend(v6, sel_stringValue);

  uint64_t v8 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  uint64_t v10 = v9;

  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  if (v12)
  {
    if (v8 == v11 && v12 == v10)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      char v14 = sub_1AD740BC0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v14 & 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t sub_1AD722AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  sub_1AD2147D4(0, (unint64_t *)&unk_1E9A2D9F0);
  swift_bridgeObjectRetain();
  sub_1AD660778();
  char v14 = (void *)swift_allocObject();
  v14[2] = a7;
  v14[3] = a8;
  v14[4] = a5;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a6;
  swift_bridgeObjectRetain_n();
  swift_unknownObjectRetain();
  id v15 = a6;
  return sub_1AD7400A0();
}

void sub_1AD722BDC(void *a1)
{
  uint64_t v2 = v1;
  unsigned int v4 = objc_msgSend(a1, sel_hasBeenPersisted);
  uint64_t v5 = self;
  if (v4)
  {
    id v6 = objc_msgSend(v5, sel_viewControllerForContact_, a1);
  }
  else
  {
    id v7 = objc_msgSend(v5, sel_viewControllerForUnknownContact_, a1);
    uint64_t v8 = swift_dynamicCastObjCProtocolConditional();
    id v6 = v7;
    objc_msgSend(v6, sel_setDelegate_, v8);
    sub_1AD2147D4(0, (unint64_t *)&qword_1EB73C100);
    uint64_t v9 = (void *)sub_1AD73F9E0();
    objc_msgSend(v6, sel_setContactStore_, v9);
  }
  objc_msgSend(v6, sel_setAllowsEditing_, 0);
  id v10 = objc_msgSend(v6, sel_navigationItem);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v2, sel_dismissContactViewController);
  objc_msgSend(v10, sel_setRightBarButtonItem_, v11);

  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB19E8]), sel_initWithRootViewController_, v6);
  objc_msgSend(v2, sel_presentViewController_animated_completion_, v12, 1, 0);
}

void sub_1AD722DA4()
{
  if (qword_1EB732818 != -1) {
    swift_once();
  }
  sub_1AD73A1D0();
  sub_1AD73A1D0();
  sub_1AD73A1D0();
  sub_1AD73A1D0();
  uint64_t v1 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v1, v2, 1, 0xE000000000000000);

  unsigned int v4 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1AD7230D8;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD35CE78;
  aBlock[3] = &block_descriptor_13_0;
  uint64_t v5 = _Block_copy(aBlock);
  swift_release();
  id v6 = self;
  id v7 = objc_msgSend(v6, sel_actionWithTitle_style_handler_, v4, 0, v5);
  _Block_release(v5);

  uint64_t v8 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_actionWithTitle_style_handler_, v8, 0, 0);

  objc_msgSend(v3, sel_addAction_, v7);
  objc_msgSend(v3, sel_addAction_, v9);
  objc_msgSend(v0, sel_presentViewController_animated_completion_, v3, 1, 0);
}

void sub_1AD7230D8()
{
  sub_1AD1E0084(0, (unint64_t *)&qword_1EB731C20, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v8 - v1;
  id v3 = objc_msgSend(self, sel_defaultWorkspace);
  if (v3)
  {
    unsigned int v4 = v3;
    sub_1AD73A4A0();
    uint64_t v5 = sub_1AD73A4B0();
    uint64_t v6 = *(void *)(v5 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) != 1)
    {
      id v7 = (void *)sub_1AD73A420();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
      objc_msgSend(v4, sel_openSensitiveURL_withOptions_, v7, 0);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1AD723268(char a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = sub_1AD73EEA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1AD73EEF0();
  uint64_t v11 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD2147D4(0, (unint64_t *)&qword_1EB73F7F0);
  char v14 = (void *)sub_1AD73FC50();
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a3;
  *(void *)(v15 + 32) = a4;
  aBlock[4] = sub_1AD7235CC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD1CAB10;
  aBlock[3] = &block_descriptor_10_1;
  id v16 = _Block_copy(aBlock);
  id v17 = a3;
  id v18 = a4;
  swift_release();
  sub_1AD73EED0();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1AD1D600C();
  sub_1AD1E0084(0, (unint64_t *)&qword_1EB731CE0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1AD1D5F84();
  sub_1AD7404F0();
  MEMORY[0x1B3E65F90](0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v21);
}

id sub_1AD723530(void *a1)
{
  return objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

uint64_t sub_1AD723544()
{
  return swift_deallocObject();
}

uint64_t sub_1AD723584(char a1, uint64_t a2)
{
  return sub_1AD723268(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1AD72358C()
{
  return swift_deallocObject();
}

void sub_1AD7235CC()
{
  if (*(unsigned char *)(v0 + 16) == 1) {
    sub_1AD722BDC(*(void **)(v0 + 32));
  }
}

uint64_t sub_1AD7235FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AD722AC4(a1, a2, a3, a4, *(void *)(v4 + 32), *(void **)(v4 + 40), *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_1AD723608(id *a1)
{
  return sub_1AD7229A8(a1, v1[4], v1[2], v1[3]) & 1;
}

uint64_t sub_1AD72362C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1AD723674()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  char v7 = 0;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 48))(&v7, v3, v4, v5, v1);
}

uint64_t sub_1AD7236C4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD723704()
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(v0[3] + 16) + 8))(0, v0[5], v0[6], v0[2]);
}

uint64_t sub_1AD723750@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1AD722758(a1, *(void **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1AD723774()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

void sub_1AD7237B4(int a1)
{
  sub_1AD722934(a1, *(void *)(v1 + 32), *(id *)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_1AD7237D0(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = v2;
  id v5 = v2;
}

id sub_1AD723834()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_1AD72388C(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1AD7238E0())()
{
  return j__swift_endAccess;
}

id sub_1AD72393C(unsigned __int8 *a1, uint64_t *a2)
{
  int v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_showsBackground);
  swift_beginAccess();
  *uint64_t v4 = v2;
  id v5 = (id *)(v3 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView);
  swift_beginAccess();
  return objc_msgSend(*v5, sel_setHidden_, v2 ^ 1u);
}

uint64_t sub_1AD7239C8()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_showsBackground);
  swift_beginAccess();
  return *v1;
}

id sub_1AD723A10(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_showsBackground);
  swift_beginAccess();
  unsigned char *v3 = a1;
  uint64_t v4 = (id *)(v1 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView);
  swift_beginAccess();
  return objc_msgSend(*v4, sel_setHidden_, (a1 & 1) == 0);
}

void (*sub_1AD723A9C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_showsBackground;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1AD723B08;
}

void sub_1AD723B08(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    id v5 = (unsigned char *)(v4 + v3[4]);
    uint64_t v6 = (id *)(v4 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView);
    swift_beginAccess();
    objc_msgSend(*v6, sel_setHidden_, (*v5 & 1) == 0);
  }
  free(v3);
}

id CameraScannerTextOverlayViewController.__allocating_init(titleText:automationIdentifierPrefix:overlayMode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  id v11 = objc_allocWithZone(v5);
  return CameraScannerTextOverlayViewController.init(titleText:automationIdentifierPrefix:overlayMode:)(a1, a2, a3, a4, a5);
}

id CameraScannerTextOverlayViewController.init(titleText:automationIdentifierPrefix:overlayMode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  char v9 = *((unsigned char *)a5 + 8);
  v5[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_showsBackground] = 1;
  id v10 = &v5[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_titleText];
  void *v10 = a1;
  v10[1] = a2;
  uint64_t v20 = v8;
  char v21 = v9;
  id v11 = v5;
  CameraScannerOverlayMode.createView()(v12);
  *(void *)&v11[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView] = v13;
  char v14 = &v11[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_automationIdentifierPrefix];
  *(void *)char v14 = a3;
  *((void *)v14 + 1) = a4;

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for CameraScannerTextOverlayViewController();
  id v15 = objc_msgSendSuper2(&v19, sel_initWithNibName_bundle_, 0, 0);
  id result = objc_msgSend(v15, sel_view);
  if (result)
  {
    id v17 = result;
    id v18 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v17, sel_setBackgroundColor_, v18);

    objc_msgSend(v15, sel_setOverrideUserInterfaceStyle_, 2);
    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for CameraScannerTextOverlayViewController()
{
  return self;
}

id sub_1AD723DD4()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for CameraScannerTextOverlayViewController();
  objc_msgSendSuper2(&v16, sel_viewDidLoad);
  sub_1AD723FC4();
  uint64_t v1 = (id *)&v0[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView];
  swift_beginAccess();
  objc_msgSend(*v1, sel_removeFromSuperview);
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v3 = result;
  objc_msgSend(result, sel_insertSubview_atIndex_, *v1, 0);

  id v4 = *v1;
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v5 = result;
  objc_msgSend(result, sel_bounds);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v4, sel_setFrame_, v7, v9, v11, v13);
  id result = objc_msgSend(v0, sel_view);
  if (result)
  {
    char v14 = result;
    id v15 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v14, sel_setBackgroundColor_, v15);

    return objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_1AD723FC4()
{
  uint64_t v1 = v0;
  int v2 = &v0[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_titleText];
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_titleText];
  uint64_t v4 = *((void *)v2 + 1);
  uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_automationIdentifierPrefix];
  uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_automationIdentifierPrefix
                    + 8];
  objc_allocWithZone((Class)type metadata accessor for CameraScannerOverlayContentView());
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  double v7 = CameraScannerOverlayContentView.init(title:detail:detailMaxNumberOfLines:headerView:headerHeight:automationIdentifierPrefix:)(v3, v4, v3, v4, 0, 0, v5, v6, 0.0);
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v8 = objc_msgSend(v1, sel_view);
  if (!v8)
  {
    __break(1u);
    goto LABEL_7;
  }
  double v9 = v8;
  objc_msgSend(v8, sel_addSubview_, v7);

  id v10 = objc_msgSend(v1, sel_view);
  if (!v10)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v11 = v10;
  objc_msgSend(v10, sel_hk_alignConstraintsWithView_, v7);
}

id CameraScannerTextOverlayViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void CameraScannerTextOverlayViewController.init(nibName:bundle:)()
{
}

id CameraScannerTextOverlayViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraScannerTextOverlayViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_1AD724274())()
{
  return j_j__swift_endAccess;
}

id sub_1AD7242D0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_overlayView);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_1AD724338@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18HealthExperienceUI38CameraScannerTextOverlayViewController_showsBackground);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t method lookup function for CameraScannerTextOverlayViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CameraScannerTextOverlayViewController);
}

uint64_t dispatch thunk of CameraScannerTextOverlayViewController.overlayView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CameraScannerTextOverlayViewController.overlayView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CameraScannerTextOverlayViewController.overlayView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CameraScannerTextOverlayViewController.showsBackground.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CameraScannerTextOverlayViewController.showsBackground.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CameraScannerTextOverlayViewController.showsBackground.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CameraScannerTextOverlayViewController.__allocating_init(titleText:automationIdentifierPrefix:overlayMode:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

Swift::Void __swiftcall FavoritableDisplayingConsuming.updateCellAndFavoritesStateFromUserInteraction()()
{
  uint64_t v3 = v1;
  uint64_t v4 = v0;
  uint64_t v5 = sub_1AD73CBA0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  FavoritableDisplayingConsuming.favoritesItem.getter(v4, v3, (uint64_t)v51);
  uint64_t v9 = v52;
  uint64_t v10 = v53;
  __swift_project_boxed_opaque_existential_1(v51, v52);
  char v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 40))(v9, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  sub_1AD73CAD0();
  id v12 = v2;
  double v13 = sub_1AD73CB80();
  os_log_type_t v14 = sub_1AD73F940();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v44 = v4;
  uint64_t v45 = v3;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v42 = v6;
    uint64_t v43 = v5;
    char v17 = v11;
    uint64_t v18 = v4;
    uint64_t v19 = v16;
    uint64_t v41 = swift_slowAlloc();
    v49[0] = v41;
    *(_DWORD *)uint64_t v19 = 136446723;
    uint64_t v20 = sub_1AD740E30();
    v51[0] = sub_1AD1F62D4(v20, v21, v49);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    FavoritableDisplayingConsuming.favoritesItem.getter(v18, v3, (uint64_t)v51);
    __swift_project_boxed_opaque_existential_1(v51, v52);
    uint64_t v22 = sub_1AD73BBD0();
    unint64_t v24 = v23;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    v51[0] = sub_1AD1F62D4(v22, v24, v49);
    sub_1AD7403B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2081;
    if (v17) {
      uint64_t v25 = 0x65736C6166;
    }
    else {
      uint64_t v25 = 1702195828;
    }
    if (v17) {
      unint64_t v26 = 0xE500000000000000;
    }
    else {
      unint64_t v26 = 0xE400000000000000;
    }
    v51[0] = sub_1AD1F62D4(v25, v26, v49);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD1A4000, v13, v14, "[%{public}s] User tapped on %s, changing isFavorite to: %{private}s", (uint8_t *)v19, 0x20u);
    uint64_t v27 = v41;
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v27, -1, -1);
    MEMORY[0x1B3E68450](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v43);
    if ((v17 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v35 = v44;
    uint64_t v34 = v45;
    FavoritableDisplayingConsuming.favoritesItem.getter(v44, v45, (uint64_t)v51);
    uint64_t v36 = v52;
    uint64_t v37 = v53;
    __swift_project_boxed_opaque_existential_1(v51, v52);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v37 + 24))(v49, v36, v37);
    __swift_project_boxed_opaque_existential_1(v49, v50);
    FavoritableDisplayingConsuming.favoritesItem.getter(v35, v34, (uint64_t)v46);
    uint64_t v38 = v47;
    uint64_t v39 = v48;
    __swift_project_boxed_opaque_existential_1(v46, v47);
    (*(void (**)(uint64_t, uint64_t))(v39 + 16))(v38, v39);
    sub_1AD73B1C0();
    goto LABEL_12;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v11) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v29 = v44;
  uint64_t v28 = v45;
  FavoritableDisplayingConsuming.favoritesItem.getter(v44, v45, (uint64_t)v51);
  uint64_t v30 = v52;
  uint64_t v31 = v53;
  __swift_project_boxed_opaque_existential_1(v51, v52);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v31 + 24))(v49, v30, v31);
  __swift_project_boxed_opaque_existential_1(v49, v50);
  FavoritableDisplayingConsuming.favoritesItem.getter(v29, v28, (uint64_t)v46);
  uint64_t v32 = v47;
  uint64_t v33 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  (*(void (**)(uint64_t, uint64_t))(v33 + 16))(v32, v33);
  sub_1AD73B190();
LABEL_12:
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
}

uint64_t FavoritableDisplayingConsuming.favoritesItem.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void (*v6)(long long *__return_ptr, uint64_t, uint64_t);
  uint64_t result;
  void v8[5];
  long long v9;
  long long v10;
  uint64_t v11;

  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v5 + 8);
  v6((long long *)v8, a1, v5);
  if (v8[3])
  {
    sub_1AD2196B8(0, (unint64_t *)&qword_1EB73E870);
    sub_1AD2196B8(0, &qword_1EB7400B0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v10 + 1)) {
        return sub_1AD20FE90(&v9, a3);
      }
    }
    else
    {
      char v11 = 0;
      uint64_t v9 = 0u;
      uint64_t v10 = 0u;
    }
  }
  else
  {
    sub_1AD206D18((uint64_t)v8, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
    uint64_t v9 = 0u;
    uint64_t v10 = 0u;
    char v11 = 0;
  }
  sub_1AD206D18((uint64_t)&v9, &qword_1E9A312C0, &qword_1EB7400B0);
  *(void *)&uint64_t v9 = 0;
  *((void *)&v9 + 1) = 0xE000000000000000;
  sub_1AD740680();
  swift_bridgeObjectRelease();
  v8[0] = 0xD00000000000001BLL;
  v8[1] = 0x80000001AD7745A0;
  v6(&v9, a1, v5);
  sub_1AD1DE498(0, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  sub_1AD73F220();
  sub_1AD73F300();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1AD7408B0();
  __break(1u);
  return result;
}

BOOL FavoritableDisplaying.favoriteStatus.getter(uint64_t a1, uint64_t a2)
{
  return ((*(uint64_t (**)(void))(a2 + 40))() & 1) == 0;
}

uint64_t FavoritableDisplaying.showReorderingHandle.getter()
{
  return 0;
}

uint64_t dispatch thunk of FavoritableDisplaying.pinnedContentIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FavoritableDisplaying.pinnedContentManager.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of FavoritableDisplaying.favoritesCategoryImage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FavoritableDisplaying.isFavorite.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FavoritableDisplaying.isFavorite.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of FavoritableDisplaying.isFavorite.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of FavoritableDisplaying.showReorderingHandle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of FavoritableDisplaying.localizedFavoritesName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of FavoritableDisplaying.localizedFavoritesCategoryName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_1AD724CDC@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  uint64_t v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](a1);
  id v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v10);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t PromotionFeatureStatusFeedItemProvider.makeDismissalStateManager(context:)@<X0>(void *a1@<X8>)
{
  sub_1AD73AD90();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  sub_1AD73AD80();
  uint64_t v2 = sub_1AD73B250();
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for BasicPromotionDismissalStateManager();
  uint64_t v6 = (void *)swift_allocObject();
  sub_1AD73B240();
  swift_allocObject();
  _OWORD v6[2] = sub_1AD73B210();
  v6[3] = v2;
  v6[4] = v4;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  a1[3] = v5;
  a1[4] = &protocol witness table for BasicPromotionDismissalStateManager;
  *a1 = v6;
  return result;
}

uint64_t sub_1AD725094@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PromotionFeatureStatusFeedItemProvider.customizedFeedItem(for:featureStatus:)(a1, a2);
}

uint64_t PromotionFeatureStatusFeedItemProvider.customizedFeedItem(for:featureStatus:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1AD73AD70();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t PromotionFeatureStatusFeedItemProvider.makeFeedItemPublisher(context:featureStatus:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v51 = a1;
  sub_1AD7257CC(0);
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v44 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD725864();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v47 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD52E330(0);
  uint64_t v54 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v41 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v40 - v14;
  uint64_t v16 = sub_1AD73AD70();
  uint64_t v50 = *(void *)(v16 - 8);
  uint64_t v17 = *(void *)(v50 + 64);
  MEMORY[0x1F4188790](v16);
  uint64_t v40 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v43 = (char *)&v40 - v19;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v20 = sub_1AD740340();
  uint64_t v53 = *(void *)(v20 - 8);
  __n128 v21 = MEMORY[0x1F4188790](v20);
  unint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = v55;
  (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(a4 + 56))(a2, a3, a4, v21);
  uint64_t v42 = a3;
  uint64_t v57 = a3;
  uint64_t v58 = a4;
  uint64_t v25 = v16;
  uint64_t v26 = v51;
  uint64_t v59 = v24;
  uint64_t v60 = v51;
  uint64_t v61 = a2;
  uint64_t v27 = v50;
  uint64_t v52 = v23;
  sub_1AD724CDC((void (*)(char *, char *))sub_1AD725910, (uint64_t)v56, MEMORY[0x1E4FBC248], v16, v28, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v15, 1, v16) == 1)
  {
    sub_1AD72594C((uint64_t)v15);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v41, 1, 1, v16);
    uint64_t v29 = v44;
    sub_1AD73DB50();
    sub_1AD7259A8((unint64_t *)&qword_1EB73D158, sub_1AD7257CC);
    uint64_t v30 = v46;
    uint64_t v31 = sub_1AD73DC70();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v30);
  }
  else
  {
    uint64_t v46 = v20;
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    uint64_t v33 = v43;
    v32(v43, v15, v25);
    uint64_t v62 = sub_1AD726188(v26, v42, a4);
    uint64_t v34 = v40;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v40, v33, v25);
    unint64_t v35 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    uint64_t v36 = swift_allocObject();
    v32((char *)(v36 + v35), v34, v25);
    uint64_t v20 = v46;
    sub_1AD429C30();
    sub_1AD7259A8((unint64_t *)&unk_1EB732DE0, (void (*)(uint64_t))sub_1AD429C30);
    uint64_t v37 = v47;
    sub_1AD73DCC0();
    swift_release();
    swift_release();
    sub_1AD7259A8(&qword_1EB73D128, (void (*)(uint64_t))sub_1AD725864);
    uint64_t v38 = v49;
    uint64_t v31 = sub_1AD73DC70();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v37, v38);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v33, v25);
  }
  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v20);
  return v31;
}

void sub_1AD7257CC(uint64_t a1)
{
}

void sub_1AD725800(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_1AD725864()
{
  if (!qword_1EB73D130)
  {
    sub_1AD429C30();
    sub_1AD52E330(255);
    sub_1AD7259A8((unint64_t *)&unk_1EB732DE0, (void (*)(uint64_t))sub_1AD429C30);
    unint64_t v0 = sub_1AD73D850();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB73D130);
    }
  }
}

void sub_1AD725910(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1AD7259F0(v2[5], a1, v2[6], v2[2], v2[3], a2);
}

uint64_t sub_1AD72594C(uint64_t a1)
{
  sub_1AD52E330(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AD7259A8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1AD7259F0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v53 = a6;
  uint64_t v54 = a3;
  uint64_t v57 = a2;
  uint64_t v9 = sub_1AD73AA80();
  uint64_t v67 = *(void *)(v9 - 8);
  uint64_t v68 = v9;
  MEMORY[0x1F4188790](v9);
  unint64_t v66 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v63 = AssociatedConformanceWitness;
  uint64_t v56 = AssociatedTypeWitness;
  swift_getAssociatedConformanceWitness();
  uint64_t v55 = v13;
  uint64_t v58 = swift_getAssociatedTypeWitness();
  uint64_t v14 = sub_1AD740340();
  uint64_t v61 = *(void *)(v14 - 8);
  uint64_t v62 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v60 = (char *)&v50 - v15;
  uint64_t v52 = sub_1AD73AD70();
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x1F4188790](v52);
  uint64_t v65 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v18 = sub_1AD740340();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  __n128 v21 = (char *)&v50 - v20;
  uint64_t v22 = *(void *)(v17 - 8);
  __n128 v24 = MEMORY[0x1F4188790](v23);
  uint64_t v26 = (char *)&v50 - v25;
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(a5 + 72);
  uint64_t v64 = a1;
  v27(a1, a4, a5, v24);
  int v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v21, 1, v17);
  uint64_t v59 = a4;
  if (v28 == 1)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    unint64_t v69 = 0xF000000000000000;
    uint64_t v70 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v26, v21, v17);
    sub_1AD739D50();
    swift_allocObject();
    sub_1AD739D40();
    swift_getAssociatedConformanceWitness();
    uint64_t v29 = sub_1AD739D30();
    uint64_t v48 = *(void (**)(char *, uint64_t))(v22 + 8);
    unint64_t v69 = v49;
    uint64_t v70 = v29;
    v48(v26, v17);
    swift_release();
  }
  uint64_t v30 = v57;
  uint64_t v50 = a5;
  uint64_t v31 = swift_checkMetadataState();
  uint64_t v32 = swift_checkMetadataState();
  uint64_t v33 = v59;
  uint64_t v71 = sub_1AD73B250();
  uint64_t v35 = v34;
  uint64_t v36 = v58;
  uint64_t v37 = *(void *)(v58 - 8);
  uint64_t v38 = (uint64_t)v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v60, v30, v58);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v38, 0, 1, v36);
  uint64_t v39 = (uint64_t)v66;
  sub_1AD73B260();
  uint64_t v40 = (void *)sub_1AD73ADA0();
  uint64_t v41 = v65;
  static PluginFeedItem.platformFeedItem<A, B>(viewType:actionHandlerType:actionHandlerUserData:uniqueIdentifier:userDataObject:contentKind:sourceProfile:)(v31, v32, v70, v69, v71, v35, v38, v39, v40);
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v39, v68);
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v38, v62);
  uint64_t v42 = sub_1AD73B280();
  uint64_t v44 = v43;
  sub_1AD726A58(0, (unint64_t *)&qword_1EB741480, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1AD74C350;
  *(void *)(v45 + 32) = 0x6574736567677553;
  *(void *)(v45 + 40) = 0xEF6E6F6974634164;
  *(void *)(v45 + 48) = v42;
  *(void *)(v45 + 56) = v44;
  swift_bridgeObjectRetain();
  uint64_t v46 = (void *)sub_1AD73F490();
  swift_bridgeObjectRelease();
  id v47 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v47)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    swift_bridgeObjectRelease();

    sub_1AD73AD20();
    sub_1AD73B270();
    sub_1AD73AC70();
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 80))(v41, v54, v33);
    sub_1AD228620(v70, v69);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v41, v52);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1AD726188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1AD72666C();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  __n128 v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v18[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t, uint64_t, __n128))(a3 + 64))(v18, a1, a2, a3, v9);
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  sub_1AD72674C();
  sub_1AD726A58(0, &qword_1EB732E08, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC08]);
  sub_1AD7259A8((unint64_t *)&qword_1EB73D148, (void (*)(uint64_t))sub_1AD72674C);
  sub_1AD320AD0();
  sub_1AD73DCF0();
  swift_release();
  swift_release();
  sub_1AD7259A8(&qword_1EB73D138, (void (*)(uint64_t))sub_1AD72666C);
  uint64_t v15 = sub_1AD73DC70();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v15;
}

uint64_t sub_1AD7263E4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1AD73AD70();
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16))(v8, a1, v4, v6);
  if ((sub_1AD73AC10() & 1) == 0) {
    sub_1AD73AC20();
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v8, v4);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t sub_1AD72650C()
{
  uint64_t v1 = sub_1AD73AD70();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1AD72659C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_1AD73AD70() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_1AD7263E4(v4, a1);
}

uint64_t dispatch thunk of PromotionFeatureStatusFeedItemProvider.makeConfiguration(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of PromotionFeatureStatusFeedItemProvider.makeDismissalStateManager(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of PromotionFeatureStatusFeedItemProvider.makeActionHandlerUserDataObject(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of PromotionFeatureStatusFeedItemProvider.customizedFeedItem(for:featureStatus:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

void sub_1AD72666C()
{
  if (!qword_1EB73D140)
  {
    sub_1AD72674C();
    sub_1AD726A58(255, &qword_1EB732E08, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC08]);
    sub_1AD7259A8((unint64_t *)&qword_1EB73D148, (void (*)(uint64_t))sub_1AD72674C);
    sub_1AD320AD0();
    unint64_t v0 = sub_1AD73D890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB73D140);
    }
  }
}

void sub_1AD72674C()
{
  if (!qword_1EB73D150)
  {
    sub_1AD26B6B8();
    unint64_t v0 = sub_1AD73D9F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB73D150);
    }
  }
}

uint64_t sub_1AD7267B4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1AD73CBA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  _s18HealthExperienceUI0A44ChecklistStagedFeatureStatusFeedItemProviderPAAE6logger2os6LoggerVvg_0();
  id v9 = v8;
  id v10 = v8;
  uint64_t v11 = sub_1AD73CB80();
  os_log_type_t v12 = sub_1AD73F920();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    v22[1] = a2;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v15;
    *(_DWORD *)uint64_t v14 = 136446466;
    uint64_t v16 = sub_1AD740E30();
    uint64_t v23 = sub_1AD1F62D4(v16, v17, &v24);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v23 = (uint64_t)v8;
    id v18 = v8;
    sub_1AD26B6B8();
    uint64_t v19 = sub_1AD73F220();
    uint64_t v23 = sub_1AD1F62D4(v19, v20, &v24);
    sub_1AD7403B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1AD1A4000, v11, v12, "[%{public}s] Failed to fetch dismissal state: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E68450](v15, -1, -1);
    MEMORY[0x1B3E68450](v14, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  LOBYTE(v24) = 0;
  return sub_1AD73DB50();
}

uint64_t sub_1AD726A40()
{
  return swift_deallocObject();
}

uint64_t sub_1AD726A50@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1AD7267B4(a1, a2);
}

void sub_1AD726A58(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

double PDFEmptyTableCell.boundingRectForContent(in:)()
{
  return PDFBuilder.Document.drawingContext.getter();
}

double PDFEmptyTableCell.minimumBoundingRectForContent(in:)()
{
  return PDFBuilder.Document.drawingContext.getter();
}

double PDFTableEmptyRow.row.getter()
{
  sub_1AD21E15C(0, (unint64_t *)&qword_1EB732858, qword_1EB732090);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_1AD74C370;
  *(void *)(v0 + 56) = &type metadata for PDFEmptyTableCell;
  *(void *)(v0 + 64) = &protocol witness table for PDFEmptyTableCell;
  return result;
}

double sub_1AD726B64()
{
  sub_1AD21E15C(0, (unint64_t *)&qword_1EB732858, qword_1EB732090);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_1AD74C370;
  *(void *)(v0 + 56) = &type metadata for PDFEmptyTableCell;
  *(void *)(v0 + 64) = &protocol witness table for PDFEmptyTableCell;
  return result;
}

uint64_t PDFTableRow.row.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PDFTableRow.row.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*PDFTableRow.row.modify())(void, void)
{
  return nullsub_1;
}

HealthExperienceUI::PDFTableRow __swiftcall PDFTableRow.init(_:attributes:)(Swift::OpaquePointer _, Swift::OpaquePointer attributes)
{
  uint64_t v4 = v2;
  int64_t v5 = *((void *)_._rawValue + 2);
  if (v5)
  {
    uint64_t v15 = v2;
    uint64_t v19 = MEMORY[0x1E4FBC860];
    sub_1AD2F5934(0, v5, 0);
    uint64_t v6 = v19;
    uint64_t v7 = (char *)_._rawValue + 40;
    do
    {
      id v8 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v9 = (void *)sub_1AD73F180();
      type metadata accessor for Key(0);
      sub_1AD2AB12C();
      id v10 = (void *)sub_1AD73F020();
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v8, sel_initWithString_attributes_, v9, v10);
      swift_bridgeObjectRelease();

      uint64_t v19 = v6;
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1AD2F5934(v12 > 1, v13 + 1, 1);
        uint64_t v6 = v19;
      }
      v7 += 16;
      unint64_t v17 = sub_1AD468A34();
      id v18 = &protocol witness table for NSAttributedString;
      *(void *)&long long v16 = v11;
      *(void *)(v6 + 16) = v13 + 1;
      sub_1AD20FE90(&v16, v6 + 40 * v13 + 32);
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    uint64_t v4 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x1E4FBC860];
  }
  result.row._rawValue = (void *)swift_bridgeObjectRelease();
  *uint64_t v4 = v6;
  return result;
}

uint64_t Array<A>.row.getter()
{
  sub_1AD2196B8(0, qword_1EB732090);
  return sub_1AD740830();
}

uint64_t sub_1AD726E34()
{
  return Array<A>.row.getter();
}

uint64_t static PDFTableRowProvidingBuilder.buildExpression(_:)(uint64_t a1)
{
  sub_1AD21E15C(0, (unint64_t *)&qword_1E9A306C0, &qword_1E9A2AAF8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD74C370;
  sub_1AD1FFE38(a1, v2 + 32);
  return v2;
}

uint64_t _s18HealthExperienceUI27PDFTableRowProvidingBuilderV10buildBlockySayAA0deF0_pGAFd_tFZ_0(uint64_t a1)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v6 = MEMORY[0x1E4FBC860];
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = swift_bridgeObjectRetain();
      sub_1AD260ABC(v5);
    }
    swift_bridgeObjectRelease();
    return v6;
  }
  return result;
}

uint64_t static PDFTableRowProvidingBuilder.buildOptional(_:)(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t dispatch thunk of PDFTableRowProviding.row.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for PDFEmptyTableCell()
{
  return &type metadata for PDFEmptyTableCell;
}

ValueMetadata *type metadata accessor for PDFTableEmptyRow()
{
  return &type metadata for PDFTableEmptyRow;
}

ValueMetadata *type metadata accessor for PDFTableRow()
{
  return &type metadata for PDFTableRow;
}

ValueMetadata *type metadata accessor for PDFTableRowProvidingBuilder()
{
  return &type metadata for PDFTableRowProvidingBuilder;
}

uint64_t PromptTileView.init(_:didTapAction:didTapDismiss:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  *a6 = sub_1AD73E150();
  a6[1] = v12;
  unint64_t v13 = (int *)type metadata accessor for PromptTileView(0);
  uint64_t v14 = (uint64_t *)((char *)a6 + v13[5]);
  *uint64_t v14 = swift_getKeyPath();
  sub_1AD7272B4(0, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  swift_storeEnumTagMultiPayload();
  uint64_t result = sub_1AD7341B8(a1, (uint64_t)a6 + v13[6], type metadata accessor for PromptTileViewModel);
  long long v16 = (uint64_t *)((char *)a6 + v13[7]);
  *long long v16 = a2;
  v16[1] = a3;
  unint64_t v17 = (uint64_t *)((char *)a6 + v13[8]);
  *unint64_t v17 = a4;
  v17[1] = a5;
  return result;
}

uint64_t type metadata accessor for PromptTileView(uint64_t a1)
{
  return sub_1AD20CA30(a1, (uint64_t *)&unk_1EB738510);
}

uint64_t type metadata accessor for PromptTileViewModel(uint64_t a1)
{
  return sub_1AD20CA30(a1, (uint64_t *)&unk_1EB7404D8);
}

void sub_1AD727148()
{
  qword_1EB7382A0 = 0x4030000000000000;
}

void sub_1AD727158()
{
  qword_1EB738270 = 0x4028000000000000;
}

void sub_1AD727168()
{
  qword_1EB7383B8 = 0x4010000000000000;
}

void sub_1AD727178()
{
  qword_1EB7383A0 = 0x4018000000000000;
}

void static PromptTileViewModel.Padding.defaultConfiguration.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
}

uint64_t PromptTileViewModel.init(headerViewModel:contentPrimaryText:contentSecondaryText:contentActionText:imageRepresentation:presentationsToHideHeader:presentationsToHideAccessory:padding:shouldShowSeparator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t *a12, char a13)
{
  uint64_t v15 = *a12;
  uint64_t v16 = a12[1];
  char v17 = *((unsigned char *)a12 + 16);
  uint64_t v18 = a12[3];
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  uint64_t v19 = (int *)type metadata accessor for PromptTileViewModel(0);
  uint64_t result = sub_1AD732F44(a8, (uint64_t)a9 + v19[8], (uint64_t)qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1AD7272B4);
  *(void *)((char *)a9 + v19[11]) = a11;
  *(void *)((char *)a9 + v19[10]) = a10;
  __n128 v21 = (char *)a9 + v19[9];
  *(void *)__n128 v21 = v15;
  *((void *)v21 + 1) = v16;
  v21[16] = v17;
  *((void *)v21 + 3) = v18;
  *((unsigned char *)a9 + v19[12]) = a13;
  return result;
}

uint64_t PromptTileViewModel.Padding.init(imageTopPadding:imageWidth:contentTrailingPadding:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  *(double *)a3 = a4;
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = a2 & 1;
  *(double *)(a3 + 24) = a5;
  return result;
}

void sub_1AD7272B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1AD727318()
{
  unint64_t v1 = 0x6469576567616D69;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000016;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x706F546567616D69;
  }
}

uint64_t sub_1AD727388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1AD732230(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1AD7273B0(uint64_t a1)
{
  unint64_t v2 = sub_1AD727648();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1AD7273EC(uint64_t a1)
{
  unint64_t v2 = sub_1AD727648();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PromptTileViewModel.Padding.encode(to:)(void *a1)
{
  sub_1AD7287DC(0, &qword_1EB73CA68, (uint64_t (*)(void))sub_1AD727648, (uint64_t)&type metadata for PromptTileViewModel.Padding.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)&v12 - v7;
  uint64_t v9 = *v1;
  uint64_t v13 = v1[1];
  int v16 = *((unsigned __int8 *)v1 + 16);
  uint64_t v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AD727648();
  sub_1AD740D90();
  uint64_t v14 = v9;
  char v17 = 0;
  sub_1AD294234();
  sub_1AD740B00();
  if (!v2)
  {
    uint64_t v14 = v13;
    char v15 = v16;
    char v17 = 1;
    sub_1AD740AB0();
    uint64_t v14 = v10;
    char v17 = 2;
    sub_1AD740B00();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1AD727648()
{
  unint64_t result = qword_1EB740768;
  if (!qword_1EB740768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB740768);
  }
  return result;
}

uint64_t PromptTileViewModel.Padding.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  sub_1AD7287DC(0, &qword_1EB739218, (uint64_t (*)(void))sub_1AD727648, (uint64_t)&type metadata for PromptTileViewModel.Padding.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)&v15 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AD727648();
  sub_1AD740D80();
  if (!v2)
  {
    uint64_t v9 = v6;
    uint64_t v10 = v16;
    char v19 = 0;
    sub_1AD294498();
    sub_1AD740A40();
    uint64_t v11 = v17;
    char v19 = 1;
    sub_1AD7409F0();
    uint64_t v15 = v17;
    char v12 = v18;
    char v19 = 2;
    sub_1AD740A40();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, v5);
    uint64_t v14 = v17;
    *(void *)uint64_t v10 = v11;
    *(void *)(v10 + 8) = v15;
    *(unsigned char *)(v10 + 16) = v12;
    *(void *)(v10 + 24) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1AD727904(char a1)
{
  unint64_t result = 0x6956726564616568;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x676E6964646170;
      break;
    case 6:
      unint64_t result = 0xD000000000000019;
      break;
    case 7:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AD727A30@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PromptTileViewModel.Padding.init(from:)(a1, a2);
}

uint64_t sub_1AD727A48(void *a1)
{
  return PromptTileViewModel.Padding.encode(to:)(a1);
}

unint64_t sub_1AD727A60()
{
  return sub_1AD727904(*v0);
}

uint64_t sub_1AD727A68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1AD7323B4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1AD727A90(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_1AD727A9C(uint64_t a1)
{
  unint64_t v2 = sub_1AD727F3C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1AD727AD8(uint64_t a1)
{
  unint64_t v2 = sub_1AD727F3C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PromptTileViewModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_1AD7287DC(0, &qword_1EB73CA60, (uint64_t (*)(void))sub_1AD727F3C, (uint64_t)&type metadata for PromptTileViewModel.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v16 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AD727F3C();
  sub_1AD740D90();
  v16[0] = *v3;
  char v19 = 0;
  type metadata accessor for DismissibleCellHeaderView.ViewModel(0);
  sub_1AD1F8C64(&qword_1EB73CC08, (void (*)(uint64_t))type metadata accessor for DismissibleCellHeaderView.ViewModel);
  sub_1AD740B00();
  if (!v2)
  {
    LOBYTE(v16[0]) = 1;
    sub_1AD740AC0();
    LOBYTE(v16[0]) = 2;
    sub_1AD740A80();
    LOBYTE(v16[0]) = 3;
    sub_1AD740A80();
    uint64_t v10 = (int *)type metadata accessor for PromptTileViewModel(0);
    LOBYTE(v16[0]) = 4;
    sub_1AD73B970();
    sub_1AD1F8C64(&qword_1EB73CAF0, MEMORY[0x1E4F65F88]);
    sub_1AD740AB0();
    uint64_t v11 = (char *)v3 + v10[9];
    uint64_t v12 = *((void *)v11 + 1);
    char v13 = v11[16];
    uint64_t v14 = *((void *)v11 + 3);
    v16[0] = *(void *)v11;
    v16[1] = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    char v19 = 5;
    sub_1AD727F90();
    sub_1AD740B00();
    v16[0] = *(void *)((char *)v3 + v10[10]);
    char v19 = 6;
    sub_1AD733118(0, &qword_1EB7412E8, (uint64_t)&type metadata for Presentation, MEMORY[0x1E4FBB320]);
    sub_1AD728898(&qword_1EB73D170, (void (*)(void))sub_1AD727FE4);
    sub_1AD740B00();
    v16[0] = *(void *)((char *)v3 + v10[11]);
    char v19 = 7;
    sub_1AD740B00();
    LOBYTE(v16[0]) = 8;
    sub_1AD740AD0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_1AD727F3C()
{
  unint64_t result = qword_1EB740758;
  if (!qword_1EB740758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB740758);
  }
  return result;
}

unint64_t sub_1AD727F90()
{
  unint64_t result = qword_1EB73C9B8;
  if (!qword_1EB73C9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB73C9B8);
  }
  return result;
}

unint64_t sub_1AD727FE4()
{
  unint64_t result = qword_1EB73CB30;
  if (!qword_1EB73CB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB73CB30);
  }
  return result;
}

uint64_t PromptTileViewModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v28 - v4;
  sub_1AD7287DC(0, &qword_1EB739210, (uint64_t (*)(void))sub_1AD727F3C, (uint64_t)&type metadata for PromptTileViewModel.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v30 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = (int *)type metadata accessor for PromptTileViewModel(0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = a1[3];
  uint64_t v32 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1AD727F3C();
  uint64_t v31 = v9;
  uint64_t v14 = v33;
  sub_1AD740D80();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  type metadata accessor for DismissibleCellHeaderView.ViewModel(0);
  char v38 = 0;
  sub_1AD1F8C64(&qword_1EB738848, (void (*)(uint64_t))type metadata accessor for DismissibleCellHeaderView.ViewModel);
  uint64_t v15 = v30;
  sub_1AD740A40();
  *uint64_t v12 = v34;
  LOBYTE(v34) = 1;
  uint64_t v16 = sub_1AD740A00();
  uint64_t v17 = v7;
  uint64_t v18 = (uint64_t)v32;
  v12[1] = v16;
  v12[2] = v19;
  LOBYTE(v34) = 2;
  v12[3] = sub_1AD7409C0();
  v12[4] = v20;
  LOBYTE(v34) = 3;
  v12[5] = sub_1AD7409C0();
  v12[6] = v21;
  sub_1AD73B970();
  LOBYTE(v34) = 4;
  sub_1AD1F8C64(&qword_1EB738440, MEMORY[0x1E4F65F88]);
  sub_1AD7409F0();
  sub_1AD732F44((uint64_t)v5, (uint64_t)v12 + v10[8], (uint64_t)qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1AD7272B4);
  char v38 = 5;
  sub_1AD728844();
  sub_1AD740A40();
  uint64_t v22 = v35;
  char v23 = v36;
  uint64_t v24 = v37;
  uint64_t v25 = (char *)v12 + v10[9];
  *(void *)uint64_t v25 = v34;
  *((void *)v25 + 1) = v22;
  v25[16] = v23;
  *((void *)v25 + 3) = v24;
  sub_1AD733118(0, &qword_1EB7412E8, (uint64_t)&type metadata for Presentation, MEMORY[0x1E4FBB320]);
  char v38 = 6;
  sub_1AD728898(&qword_1EB7390C0, (void (*)(void))sub_1AD728928);
  sub_1AD740A40();
  *(void *)((char *)v12 + v10[10]) = v34;
  char v38 = 7;
  sub_1AD740A40();
  *(void *)((char *)v12 + v10[11]) = v34;
  LOBYTE(v34) = 8;
  char v26 = sub_1AD740A10();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v31, v15);
  *((unsigned char *)v12 + v10[12]) = v26 & 1;
  sub_1AD732E40((uint64_t)v12, v29, type metadata accessor for PromptTileViewModel);
  __swift_destroy_boxed_opaque_existential_1(v18);
  return sub_1AD732EE4((uint64_t)v12, type metadata accessor for PromptTileViewModel);
}

void sub_1AD7287DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

unint64_t sub_1AD728844()
{
  unint64_t result = qword_1EB7387B8;
  if (!qword_1EB7387B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7387B8);
  }
  return result;
}

uint64_t sub_1AD728898(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1AD733118(255, &qword_1EB7412E8, (uint64_t)&type metadata for Presentation, MEMORY[0x1E4FBB320]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1AD728928()
{
  unint64_t result = qword_1EB7384A0;
  if (!qword_1EB7384A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7384A0);
  }
  return result;
}

uint64_t sub_1AD72897C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PromptTileViewModel.init(from:)(a1, a2);
}

uint64_t sub_1AD728994(void *a1)
{
  return PromptTileViewModel.encode(to:)(a1);
}

uint64_t PromptTileView.viewModel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PromptTileView(0);
  return sub_1AD732E40(v1 + *(int *)(v3 + 24), a1, type metadata accessor for PromptTileViewModel);
}

uint64_t PromptTileView.didTapAction.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PromptTileView(0) + 28));
  swift_retain();
  return v1;
}

uint64_t PromptTileView.didTapDismiss.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PromptTileView(0) + 32));
  swift_retain();
  return v1;
}

uint64_t PromptTileView.body.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EB738280 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EB738270;
  *(void *)a1 = sub_1AD73E430();
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = 0;
  sub_1AD733478(0, &qword_1E9A34718, &qword_1E9A34720, (uint64_t (*)(uint64_t))sub_1AD7290B8);
  return sub_1AD728B20(v1, a1 + *(int *)(v4 + 44));
}

uint64_t sub_1AD728B20@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  sub_1AD7297B4(0);
  uint64_t v37 = v3;
  MEMORY[0x1F4188790](v3);
  v34[0] = (uint64_t)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD7331AC(0, &qword_1E9A34868, MEMORY[0x1E4F3D748]);
  v34[1] = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v34 - v6;
  sub_1AD729BF8(0, &qword_1E9A34738, &qword_1E9A34740, (uint64_t (*)(uint64_t))sub_1AD729208, &qword_1E9A347C0);
  uint64_t v36 = v8;
  MEMORY[0x1F4188790](v8);
  unint64_t v10 = (char *)v34 - v9;
  uint64_t v11 = sub_1AD73E030();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD7331AC(0, &qword_1E9A34730, MEMORY[0x1E4F3D750]);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v35 = (uint64_t)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)v34 - v18;
  sub_1AD7272B4(0, &qword_1EB738F70, (uint64_t (*)(uint64_t))sub_1AD729174, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v20 - 8);
  uint64_t v22 = (char *)v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (char *)v34 - v24;
  sub_1AD729DA0((uint64_t)v34 - v24);
  type metadata accessor for PromptTileView(0);
  char v26 = a1;
  sub_1AD1E8DA0((uint64_t)v14);
  LOBYTE(a1) = sub_1AD73E020();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (a1)
  {
    *(void *)unint64_t v10 = sub_1AD73E440();
    *((void *)v10 + 1) = 0;
    v10[16] = 0;
    sub_1AD733478(0, &qword_1E9A34888, &qword_1E9A34740, (uint64_t (*)(uint64_t))sub_1AD729208);
    sub_1AD72C174(v26, (uint64_t)&v10[*(int *)(v27 + 44)]);
    sub_1AD7334F4((uint64_t)v10, (uint64_t)v7);
    swift_storeEnumTagMultiPayload();
    sub_1AD733248();
    sub_1AD7332CC(&qword_1E9A34878, sub_1AD7297B4, (void (*)(void))sub_1AD73334C);
    sub_1AD73E4B0();
    sub_1AD733584((uint64_t)v10);
  }
  else
  {
    uint64_t v28 = v34[0];
    sub_1AD72A20C(v34[0]);
    sub_1AD732E40(v28, (uint64_t)v7, (uint64_t (*)(void))sub_1AD7297B4);
    swift_storeEnumTagMultiPayload();
    sub_1AD733248();
    sub_1AD7332CC(&qword_1E9A34878, sub_1AD7297B4, (void (*)(void))sub_1AD73334C);
    sub_1AD73E4B0();
    sub_1AD732EE4(v28, (uint64_t (*)(void))sub_1AD7297B4);
  }
  uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD733D44((uint64_t)v25, (uint64_t)v22, &qword_1EB738F70, (uint64_t (*)(uint64_t))sub_1AD729174, MEMORY[0x1E4FBB718]);
  uint64_t v30 = v35;
  sub_1AD733380((uint64_t)v19, v35);
  uint64_t v31 = v38;
  sub_1AD733D44((uint64_t)v22, v38, &qword_1EB738F70, (uint64_t (*)(uint64_t))sub_1AD729174, v29);
  sub_1AD7290B8();
  sub_1AD733380(v30, v31 + *(int *)(v32 + 48));
  sub_1AD733400((uint64_t)v19);
  sub_1AD733E6C((uint64_t)v25, &qword_1EB738F70, (uint64_t (*)(uint64_t))sub_1AD729174, v29);
  sub_1AD733400(v30);
  return sub_1AD733E6C((uint64_t)v22, &qword_1EB738F70, (uint64_t (*)(uint64_t))sub_1AD729174, v29);
}

void sub_1AD7290B8()
{
  if (!qword_1E9A34728)
  {
    sub_1AD7272B4(255, &qword_1EB738F70, (uint64_t (*)(uint64_t))sub_1AD729174, MEMORY[0x1E4FBB718]);
    sub_1AD7331AC(255, &qword_1E9A34730, MEMORY[0x1E4F3D750]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A34728);
    }
  }
}

void sub_1AD729174()
{
  if (!qword_1EB738F68)
  {
    type metadata accessor for DismissibleCellHeaderView(255);
    sub_1AD1F8C64(&qword_1EB738850, (void (*)(uint64_t))type metadata accessor for DismissibleCellHeaderView);
    unint64_t v0 = sub_1AD73ECE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738F68);
    }
  }
}

void sub_1AD729208(uint64_t a1)
{
}

void sub_1AD729238(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), unint64_t *a4)
{
  if (!*a2)
  {
    a3(255);
    sub_1AD7328B4(255, a4);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v7) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

void sub_1AD7292CC(uint64_t a1)
{
}

void sub_1AD7292EC(uint64_t a1)
{
}

void sub_1AD72931C(uint64_t a1)
{
}

void sub_1AD729358()
{
  if (!qword_1E9A34770)
  {
    sub_1AD7272B4(255, &qword_1E9A34778, (uint64_t (*)(uint64_t))sub_1AD72940C, MEMORY[0x1E4F3F108]);
    sub_1AD7336AC(&qword_1E9A347A0, &qword_1E9A34778, (uint64_t (*)(uint64_t))sub_1AD72940C);
    unint64_t v0 = sub_1AD73ECA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34770);
    }
  }
}

void sub_1AD72940C()
{
  if (!qword_1E9A34780)
  {
    sub_1AD7294A8(255);
    sub_1AD733118(255, &qword_1EB7384B8, (uint64_t)&_s18HealthExperienceUI13AccessoryViewVN_0, MEMORY[0x1E4FBB718]);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1E9A34780);
    }
  }
}

void sub_1AD7294A8(uint64_t a1)
{
}

void sub_1AD7294F0()
{
  if (!qword_1E9A34790)
  {
    sub_1AD729588(255, &qword_1E9A34798, MEMORY[0x1E4F3CA60], MEMORY[0x1E4F3CA58], MEMORY[0x1E4F3DC28]);
    unint64_t v0 = sub_1AD73E080();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34790);
    }
  }
}

void sub_1AD729588(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    unint64_t v10 = a5(a1, v9, a4);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

void sub_1AD7295F4(uint64_t a1)
{
}

void sub_1AD729630(uint64_t a1)
{
}

void sub_1AD72966C()
{
  if (!qword_1EB738F10)
  {
    sub_1AD7272B4(255, &qword_1EB738FE0, (uint64_t (*)(uint64_t))sub_1AD729720, MEMORY[0x1E4F3F108]);
    sub_1AD7336AC(&qword_1EB738FD8, &qword_1EB738FE0, (uint64_t (*)(uint64_t))sub_1AD729720);
    unint64_t v0 = sub_1AD73ECA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738F10);
    }
  }
}

void sub_1AD729720()
{
  if (!qword_1EB738808)
  {
    sub_1AD733118(255, &qword_1EB7384B8, (uint64_t)&_s18HealthExperienceUI13AccessoryViewVN_0, MEMORY[0x1E4FBB718]);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EB738808);
    }
  }
}

void sub_1AD7297B4(uint64_t a1)
{
}

void sub_1AD7297F0()
{
  if (!qword_1E9A347D0)
  {
    sub_1AD7272B4(255, &qword_1E9A347D8, (uint64_t (*)(uint64_t))sub_1AD7298A4, MEMORY[0x1E4F3F108]);
    sub_1AD7336AC(&qword_1E9A34830, &qword_1E9A347D8, (uint64_t (*)(uint64_t))sub_1AD7298A4);
    unint64_t v0 = sub_1AD73ECA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A347D0);
    }
  }
}

void sub_1AD7298A4()
{
  if (!qword_1E9A347E0)
  {
    sub_1AD7272B4(255, &qword_1E9A347E8, (uint64_t (*)(uint64_t))sub_1AD72997C, MEMORY[0x1E4FBB718]);
    sub_1AD729588(255, &qword_1E9A34828, (uint64_t (*)(uint64_t))sub_1AD729BC8, MEMORY[0x1E4F3CAB0], MEMORY[0x1E4F3CC10]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A347E0);
    }
  }
}

void sub_1AD72997C(uint64_t a1)
{
}

void sub_1AD7299C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4(255);
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_1AD729A48(uint64_t a1)
{
}

void sub_1AD729A90(uint64_t a1)
{
}

void sub_1AD729ACC(uint64_t a1)
{
}

void sub_1AD729B08(uint64_t a1)
{
}

void sub_1AD729B44(uint64_t a1)
{
}

void sub_1AD729B8C(uint64_t a1)
{
}

void sub_1AD729BC8(uint64_t a1)
{
}

void sub_1AD729BF8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  if (!*a2)
  {
    sub_1AD7272B4(255, a3, a4, MEMORY[0x1E4F3F108]);
    sub_1AD7336AC(a5, a3, a4);
    unint64_t v9 = sub_1AD73ECE0();
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1AD729C98()
{
  if (!qword_1EB738F18)
  {
    sub_1AD72966C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EB738F18);
    }
  }
}

uint64_t sub_1AD729D00(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1AD1F8C64(&qword_1EB7387C0, (void (*)(uint64_t))type metadata accessor for PromptTileViewModel);
  uint64_t result = sub_1AD1F8C64(&qword_1EB734B50, (void (*)(uint64_t))type metadata accessor for PromptTileViewModel);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1AD729D84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD729DA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = type metadata accessor for DismissibleCellHeaderView(0);
  MEMORY[0x1F4188790](v24);
  uint64_t v4 = (uint64_t *)((char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for PromptTileView(0);
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v23 + 64);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v8 = (void *)((char *)v1 + *(int *)(v7 + 32));
  uint64_t v9 = *(uint64_t *)((char *)v8 + *(int *)(type metadata accessor for PromptTileViewModel(0) + 40));
  if (*v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1AD73DC00();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v10 = *(void *)(v9 + 16);
    if (v10)
    {
      uint64_t v11 = 0;
      while (*(unsigned __int8 *)(v9 + v11 + 32) != v25)
      {
        if (v10 == ++v11) {
          goto LABEL_6;
        }
      }
      swift_bridgeObjectRelease();
      sub_1AD729174();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a1, 1, 1, v21);
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      *(void *)a1 = sub_1AD73E430();
      *(void *)(a1 + 8) = 0x4020000000000000;
      *(unsigned char *)(a1 + 16) = 0;
      sub_1AD7340E0();
      uint64_t v13 = (void *)(a1 + *(int *)(v12 + 44));
      uint64_t v14 = *v8;
      sub_1AD732E40((uint64_t)v1, (uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PromptTileView);
      unint64_t v15 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
      uint64_t v16 = swift_allocObject();
      sub_1AD7341B8((uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for PromptTileView);
      swift_beginAccess();
      type metadata accessor for ProvidedViewContext(0);
      sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
      swift_retain_n();
      swift_bridgeObjectRetain();
      v4[3] = sub_1AD73E150();
      v4[4] = v17;
      uint64_t v18 = (void *)((char *)v4 + *(int *)(v24 + 28));
      uint64_t *v18 = swift_getKeyPath();
      sub_1AD7272B4(0, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRelease();
      v4[1] = 0;
      v4[2] = v14;
      *uint64_t v4 = nullsub_1;
      sub_1AD7341B8((uint64_t)v4, (uint64_t)v13, type metadata accessor for DismissibleCellHeaderView);
      swift_release();
      swift_release();
      *uint64_t v13 = sub_1AD733D38;
      v13[1] = v16;
      sub_1AD729174();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 0, 1, v19);
    }
  }
  else
  {
    type metadata accessor for ProvidedViewContext(0);
    sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
    swift_bridgeObjectRetain();
    uint64_t result = sub_1AD73E140();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AD72A20C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_1AD7297F0();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1AD73E370();
  if (qword_1EB7382A8 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1EB7382A0;
  *(void *)uint64_t v6 = v7;
  *((void *)v6 + 1) = v8;
  v6[16] = 0;
  sub_1AD733788(0, &qword_1E9A348D0, &qword_1E9A347D8, (uint64_t (*)(uint64_t))sub_1AD7298A4);
  sub_1AD72A494(v2, (uint64_t)&v6[*(int *)(v9 + 44)]);
  char v10 = sub_1AD73E750();
  if (*v2)
  {
    char v11 = v10;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1AD73DC00();
    swift_release();
    swift_release();
    swift_release();
    if (v23[15] == 4 && qword_1EB7383C8 != -1) {
      swift_once();
    }
    sub_1AD73DE60();
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    sub_1AD732E40((uint64_t)v6, a1, (uint64_t (*)(void))sub_1AD7297F0);
    sub_1AD7297B4(0);
    uint64_t v21 = a1 + *(int *)(v20 + 36);
    *(unsigned char *)uint64_t v21 = v11;
    *(void *)(v21 + 8) = v13;
    *(void *)(v21 + 16) = v15;
    *(void *)(v21 + 24) = v17;
    *(void *)(v21 + 32) = v19;
    *(unsigned char *)(v21 + 40) = 0;
    return sub_1AD732EE4((uint64_t)v6, (uint64_t (*)(void))sub_1AD7297F0);
  }
  else
  {
    type metadata accessor for ProvidedViewContext(0);
    sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
    uint64_t result = sub_1AD73E140();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AD72A494@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v178 = a2;
  sub_1AD7299C4(0, &qword_1E9A348D8, (uint64_t (*)(uint64_t))sub_1AD729A48, (uint64_t (*)(uint64_t))sub_1AD729B44, MEMORY[0x1E4F3D748]);
  uint64_t v164 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v165 = (uint64_t)v144 - v4;
  uint64_t v5 = sub_1AD73EC00();
  uint64_t v152 = *(void *)(v5 - 8);
  uint64_t v153 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v151 = (char *)v144 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD729B08(0);
  uint64_t v154 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v156 = (uint64_t)v144 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD729ACC(0);
  uint64_t v155 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v157 = (uint64_t)v144 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD729A90(0);
  uint64_t v158 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v159 = (uint64_t)v144 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD729A48(0);
  uint64_t v163 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v149 = (char *)v144 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v148 = (char *)v144 - v16;
  MEMORY[0x1F4188790](v17);
  uint64_t v150 = (uint64_t)v144 - v18;
  sub_1AD729588(0, &qword_1E9A34798, MEMORY[0x1E4F3CA60], MEMORY[0x1E4F3CA58], MEMORY[0x1E4F3DC28]);
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v170 = (char *)v144 - v20;
  uint64_t v21 = sub_1AD73E010();
  uint64_t v171 = *(void *)(v21 - 8);
  uint64_t v172 = v21;
  MEMORY[0x1F4188790](v21);
  v169 = (char *)v144 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD7294F0();
  uint64_t v168 = v23;
  MEMORY[0x1F4188790](v23);
  unint64_t v173 = (void *)((char *)v144 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1AD729B8C(0);
  uint64_t v166 = v25;
  MEMORY[0x1F4188790](v25);
  uint64_t v167 = (uint64_t)v144 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD729B44(0);
  uint64_t v162 = v27;
  MEMORY[0x1F4188790](v27);
  char v146 = (char *)v144 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29);
  unint64_t v145 = (char *)v144 - v30;
  MEMORY[0x1F4188790](v31);
  uint64_t v147 = (uint64_t)v144 - v32;
  sub_1AD72997C(0);
  uint64_t v176 = *(void *)(v33 - 8);
  uint64_t v177 = v33;
  MEMORY[0x1F4188790](v33);
  uint64_t v161 = (char *)v144 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F65F88];
  uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v37 - 8);
  uint64_t v39 = (char *)v144 - v38;
  uint64_t v40 = sub_1AD73B970();
  uint64_t v41 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  uint64_t v43 = (char *)v144 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD7272B4(0, &qword_1E9A347E8, (uint64_t (*)(uint64_t))sub_1AD72997C, v36);
  MEMORY[0x1F4188790](v44 - 8);
  uint64_t v180 = (uint64_t)v144 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v46);
  uint64_t v181 = (uint64_t)v144 - v47;
  uint64_t v48 = *(int *)(type metadata accessor for PromptTileView(0) + 24);
  v179 = a1;
  unint64_t v49 = (char *)a1 + v48;
  uint64_t v50 = type metadata accessor for PromptTileViewModel(0);
  sub_1AD733D44((uint64_t)&v49[*(int *)(v50 + 32)], (uint64_t)v39, qword_1EB740380, v35, v36);
  uint64_t v174 = v41;
  int v51 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40);
  v175 = v49;
  if (v51 == 1)
  {
    sub_1AD733E6C((uint64_t)v39, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    uint64_t v52 = 1;
    uint64_t v53 = (uint64_t)v179;
    uint64_t v54 = v181;
LABEL_17:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v54, v52, 1, v177);
    v179 = (void *)sub_1AD73E440();
    sub_1AD72B960(v53, (uint64_t)v182);
    *(_OWORD *)((char *)&v184[8] + 7) = v182[8];
    *(_OWORD *)((char *)&v184[9] + 7) = v182[9];
    *(_OWORD *)((char *)&v184[10] + 7) = v182[10];
    *(_OWORD *)((char *)&v184[4] + 7) = v182[4];
    *(_OWORD *)((char *)&v184[5] + 7) = v182[5];
    *(_OWORD *)((char *)&v184[6] + 7) = v182[6];
    *(_OWORD *)((char *)&v184[7] + 7) = v182[7];
    *(_OWORD *)((char *)v184 + 7) = v182[0];
    *(_OWORD *)((char *)&v184[1] + 7) = v182[1];
    *(_OWORD *)((char *)&v184[2] + 7) = v182[2];
    char v185 = 0;
    *(void *)((char *)&v184[11] + 7) = v183;
    *(_OWORD *)((char *)&v184[3] + 7) = v182[3];
    char v118 = sub_1AD73E790();
    sub_1AD73DE60();
    uint64_t v120 = v119;
    uint64_t v122 = v121;
    uint64_t v124 = v123;
    uint64_t v126 = v125;
    char v186 = 0;
    id v127 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
    uint64_t v128 = v180;
    sub_1AD733D44(v54, v180, &qword_1E9A347E8, (uint64_t (*)(uint64_t))sub_1AD72997C, MEMORY[0x1E4FBB718]);
    char v129 = v186;
    uint64_t v130 = v128;
    uint64_t v131 = v178;
    sub_1AD733D44(v130, v178, &qword_1E9A347E8, (uint64_t (*)(uint64_t))sub_1AD72997C, v127);
    sub_1AD7298A4();
    uint64_t v133 = *(int *)(v132 + 48);
    *(_OWORD *)((char *)&v188[8] + 1) = v184[8];
    *(_OWORD *)((char *)&v188[9] + 1) = v184[9];
    *(_OWORD *)((char *)&v188[10] + 1) = v184[10];
    v188[11] = *(_OWORD *)((char *)&v184[10] + 15);
    *(_OWORD *)((char *)&v188[4] + 1) = v184[4];
    *(_OWORD *)((char *)&v188[5] + 1) = v184[5];
    *(_OWORD *)((char *)&v188[6] + 1) = v184[6];
    *(_OWORD *)((char *)&v188[7] + 1) = v184[7];
    *(_OWORD *)((char *)&v188[1] + 1) = v184[1];
    *(_OWORD *)((char *)&v188[2] + 1) = v184[2];
    unint64_t v134 = (_OWORD *)(v131 + v133);
    id v135 = v179;
    long long v187 = (unint64_t)v179;
    LOBYTE(v188[0]) = 0;
    *(_OWORD *)((char *)&v188[3] + 1) = v184[3];
    *(_OWORD *)((char *)v188 + 1) = v184[0];
    LOBYTE(v189) = v118;
    *((void *)&v189 + 1) = v120;
    *(void *)&v190[0] = v122;
    *((void *)&v190[0] + 1) = v124;
    *(void *)&v190[1] = v126;
    BYTE8(v190[1]) = v129;
    long long v136 = v188[8];
    v134[8] = v188[7];
    v134[9] = v136;
    long long v137 = v188[10];
    v134[10] = v188[9];
    v134[11] = v137;
    long long v138 = v188[4];
    v134[4] = v188[3];
    v134[5] = v138;
    long long v139 = v188[6];
    v134[6] = v188[5];
    v134[7] = v139;
    long long v140 = v188[0];
    *unint64_t v134 = v187;
    v134[1] = v140;
    long long v141 = v188[2];
    v134[2] = v188[1];
    v134[3] = v141;
    long long v142 = v189;
    v134[12] = v188[11];
    v134[13] = v142;
    v134[14] = v190[0];
    *(_OWORD *)((char *)v134 + 233) = *(_OWORD *)((char *)v190 + 9);
    sub_1AD733DB4(&v187);
    sub_1AD733E6C(v181, &qword_1E9A347E8, (uint64_t (*)(uint64_t))sub_1AD72997C, v127);
    long long v201 = v184[8];
    long long v202 = v184[9];
    *(_OWORD *)v203 = v184[10];
    *(_OWORD *)&v203[15] = *(_OWORD *)((char *)&v184[10] + 15);
    long long v197 = v184[4];
    long long v198 = v184[5];
    long long v199 = v184[6];
    long long v200 = v184[7];
    long long v193 = v184[0];
    long long v194 = v184[1];
    long long v195 = v184[2];
    v191[0] = v135;
    v191[1] = 0;
    char v192 = 0;
    long long v196 = v184[3];
    char v204 = v118;
    uint64_t v205 = v120;
    uint64_t v206 = v122;
    uint64_t v207 = v124;
    uint64_t v208 = v126;
    char v209 = v129;
    sub_1AD733EC8(v191);
    return sub_1AD733E6C(v180, &qword_1E9A347E8, (uint64_t (*)(uint64_t))sub_1AD72997C, v127);
  }
  (*(void (**)(char *, char *, uint64_t))(v174 + 32))(v43, v39, v40);
  char v55 = v49[*(int *)(v50 + 36) + 16];
  uint64_t v160 = v43;
  v144[0] = v40;
  v144[1] = v50;
  if (v55)
  {
    uint64_t v56 = sub_1AD73B960();
    uint64_t v57 = v169;
    sub_1AD73E000();
    uint64_t v59 = (uint64_t)v170;
    uint64_t v58 = v171;
    uint64_t v60 = v172;
    (*(void (**)(char *, char *, uint64_t))(v171 + 16))(v170, v57, v172);
    uint64_t v61 = v173;
    sub_1AD733804(v59, (uint64_t)v173 + *(int *)(v168 + 36));
    *uint64_t v61 = v56;
    swift_retain();
    sub_1AD7338A0(v59);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v60);
    swift_release();
    LOBYTE(v56) = sub_1AD73E750();
    sub_1AD73DE60();
    uint64_t v63 = v62;
    uint64_t v65 = v64;
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    uint64_t v70 = v167;
    sub_1AD732E40((uint64_t)v61, v167, (uint64_t (*)(void))sub_1AD7294F0);
    uint64_t v71 = v70 + *(int *)(v166 + 36);
    *(unsigned char *)uint64_t v71 = v56;
    *(void *)(v71 + 8) = v63;
    *(void *)(v71 + 16) = v65;
    *(void *)(v71 + 24) = v67;
    *(void *)(v71 + 32) = v69;
    *(unsigned char *)(v71 + 40) = 0;
    sub_1AD732EE4((uint64_t)v61, (uint64_t (*)(void))sub_1AD7294F0);
    sub_1AD733118(0, (unint64_t *)&qword_1EB741480, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_1AD74C350;
    uint64_t v53 = (uint64_t)v179;
    if (*v179)
    {
      unint64_t v73 = (void *)v72;
      id v74 = (uint64_t *)(*v179 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
      swift_beginAccess();
      uint64_t v54 = v181;
      if (v74[1])
      {
        uint64_t v75 = *v74;
        uint64_t v76 = v74[1];
      }
      else
      {
        uint64_t v75 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      }
      v73[4] = v75;
      v73[5] = v76;
      v73[6] = 1852793673;
      v73[7] = 0xE400000000000000;
      swift_bridgeObjectRetain();
      id v106 = (void *)sub_1AD73F490();
      swift_bridgeObjectRelease();
      id v107 = (id)HKUIJoinStringsForAutomationIdentifier();

      if (v107)
      {
        _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

        sub_1AD733F80();
        uint64_t v108 = (uint64_t)v146;
        uint64_t v109 = v167;
        sub_1AD73EAA0();
        swift_bridgeObjectRelease();
        sub_1AD732EE4(v109, (uint64_t (*)(void))sub_1AD729B8C);
        uint64_t v110 = (uint64_t)v145;
        sub_1AD73E070();
        sub_1AD732EE4(v108, (uint64_t (*)(void))sub_1AD729B44);
        uint64_t v111 = v147;
        sub_1AD7341B8(v110, v147, (uint64_t (*)(void))sub_1AD729B44);
        sub_1AD732E40(v111, v165, (uint64_t (*)(void))sub_1AD729B44);
        swift_storeEnumTagMultiPayload();
        sub_1AD732C48(&qword_1E9A348E8, sub_1AD729A48, (void (*)(void))sub_1AD733FBC, (void (*)(void))sub_1AD36F81C);
        sub_1AD732C48(&qword_1E9A34908, sub_1AD729B44, (void (*)(void))sub_1AD733F80, (void (*)(void))sub_1AD36F81C);
        uint64_t v112 = (uint64_t)v161;
        sub_1AD73E4B0();
        sub_1AD732EE4(v111, (uint64_t (*)(void))sub_1AD729B44);
LABEL_16:
        (*(void (**)(char *, void))(v174 + 8))(v160, v144[0]);
        sub_1AD7341B8(v112, v54, (uint64_t (*)(void))sub_1AD72997C);
        uint64_t v52 = 0;
        goto LABEL_17;
      }
      __break(1u);
LABEL_19:
      __break(1u);
    }
  }
  else
  {
    sub_1AD73B960();
    uint64_t v78 = v151;
    uint64_t v77 = v152;
    uint64_t v79 = v153;
    (*(void (**)(char *, void, uint64_t))(v152 + 104))(v151, *MEMORY[0x1E4F3EBF8], v153);
    uint64_t v80 = sub_1AD73EC30();
    swift_release();
    (*(void (**)(char *, uint64_t))(v77 + 8))(v78, v79);
    uint64_t v81 = v169;
    sub_1AD73E000();
    uint64_t v83 = (uint64_t)v170;
    uint64_t v82 = v171;
    uint64_t v84 = v172;
    (*(void (**)(char *, char *, uint64_t))(v171 + 16))(v170, v81, v172);
    v85 = v173;
    sub_1AD733804(v83, (uint64_t)v173 + *(int *)(v168 + 36));
    uint64_t *v85 = v80;
    swift_retain();
    sub_1AD7338A0(v83);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v84);
    swift_release();
    uint64_t v86 = v156;
    sub_1AD732E40((uint64_t)v85, v156, (uint64_t (*)(void))sub_1AD7294F0);
    uint64_t v87 = v86 + *(int *)(v154 + 36);
    *(void *)uint64_t v87 = 0;
    *(_WORD *)(v87 + 8) = 1;
    sub_1AD732EE4((uint64_t)v85, (uint64_t (*)(void))sub_1AD7294F0);
    sub_1AD73EE10();
    sub_1AD73DF30();
    uint64_t v88 = v157;
    sub_1AD732E40(v86, v157, (uint64_t (*)(void))sub_1AD729B08);
    uint64_t v89 = (_OWORD *)(v88 + *(int *)(v155 + 36));
    long long v90 = v211;
    *uint64_t v89 = v210;
    v89[1] = v90;
    v89[2] = v212;
    sub_1AD732EE4(v86, (uint64_t (*)(void))sub_1AD729B08);
    LOBYTE(v86) = sub_1AD73E750();
    sub_1AD73DE60();
    uint64_t v92 = v91;
    uint64_t v94 = v93;
    uint64_t v96 = v95;
    uint64_t v98 = v97;
    uint64_t v99 = v159;
    sub_1AD732E40(v88, v159, (uint64_t (*)(void))sub_1AD729ACC);
    uint64_t v100 = v99 + *(int *)(v158 + 36);
    *(unsigned char *)uint64_t v100 = v86;
    *(void *)(v100 + 8) = v92;
    *(void *)(v100 + 16) = v94;
    *(void *)(v100 + 24) = v96;
    *(void *)(v100 + 32) = v98;
    *(unsigned char *)(v100 + 40) = 0;
    sub_1AD732EE4(v88, (uint64_t (*)(void))sub_1AD729ACC);
    sub_1AD733118(0, (unint64_t *)&qword_1EB741480, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v101 = swift_allocObject();
    *(_OWORD *)(v101 + 16) = xmmword_1AD74C350;
    uint64_t v53 = (uint64_t)v179;
    if (*v179)
    {
      uint64_t v102 = (void *)v101;
      uint64_t v103 = (uint64_t *)(*v179 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
      swift_beginAccess();
      if (v103[1])
      {
        uint64_t v104 = *v103;
        uint64_t v105 = v103[1];
      }
      else
      {
        uint64_t v104 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      }
      v102[4] = v104;
      v102[5] = v105;
      v102[6] = 1852793673;
      v102[7] = 0xE400000000000000;
      swift_bridgeObjectRetain();
      uint64_t v113 = (void *)sub_1AD73F490();
      swift_bridgeObjectRelease();
      id v114 = (id)HKUIJoinStringsForAutomationIdentifier();

      if (v114)
      {
        _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

        sub_1AD733FBC();
        uint64_t v115 = (uint64_t)v149;
        sub_1AD73EAA0();
        swift_bridgeObjectRelease();
        sub_1AD732EE4(v99, (uint64_t (*)(void))sub_1AD729A90);
        uint64_t v116 = (uint64_t)v148;
        sub_1AD73E070();
        sub_1AD732EE4(v115, (uint64_t (*)(void))sub_1AD729A48);
        uint64_t v117 = v150;
        sub_1AD7341B8(v116, v150, (uint64_t (*)(void))sub_1AD729A48);
        sub_1AD732E40(v117, v165, (uint64_t (*)(void))sub_1AD729A48);
        swift_storeEnumTagMultiPayload();
        sub_1AD732C48(&qword_1E9A348E8, sub_1AD729A48, (void (*)(void))sub_1AD733FBC, (void (*)(void))sub_1AD36F81C);
        sub_1AD732C48(&qword_1E9A34908, sub_1AD729B44, (void (*)(void))sub_1AD733F80, (void (*)(void))sub_1AD36F81C);
        uint64_t v112 = (uint64_t)v161;
        sub_1AD73E4B0();
        sub_1AD732EE4(v117, (uint64_t (*)(void))sub_1AD729A48);
        uint64_t v54 = v181;
        goto LABEL_16;
      }
      goto LABEL_19;
    }
  }
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  uint64_t result = sub_1AD73E140();
  __break(1u);
  return result;
}

uint64_t sub_1AD72B960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PromptTileView(0);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v38 = sub_1AD73E370();
  sub_1AD72BD2C(a1, (uint64_t)v42);
  uint64_t v41 = v42[0];
  uint64_t v8 = v42[3];
  uint64_t v36 = v42[2];
  uint64_t v37 = v42[1];
  uint64_t v35 = v42[4];
  char v9 = v43;
  uint64_t v40 = v44;
  uint64_t v32 = v45;
  uint64_t v31 = v46;
  uint64_t v39 = v47;
  uint64_t v30 = v48;
  uint64_t v10 = (void *)(a1 + *(int *)(v5 + 32));
  uint64_t v11 = v10[4];
  uint64_t v34 = v10[3];
  uint64_t v12 = v10[6];
  uint64_t v33 = v10[5];
  uint64_t v27 = v12;
  int v29 = *((unsigned __int8 *)v10 + *(int *)(type metadata accessor for PromptTileViewModel(0) + 48));
  sub_1AD732E40(a1, (uint64_t)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PromptTileView);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v28 = swift_allocObject();
  sub_1AD7341B8((uint64_t)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v13, type metadata accessor for PromptTileView);
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  uint64_t v14 = v11;
  v26[2] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1AD73E150();
  v26[1] = v15;
  char v52 = 0;
  char v51 = v9;
  *(_DWORD *)(a2 + 17) = v42[0];
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)v42 + 3);
  *(_DWORD *)(a2 + 65) = *(_DWORD *)v50;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v50[3];
  *(_DWORD *)(a2 + 164) = *(_DWORD *)&v49[3];
  *(_DWORD *)(a2 + 161) = *(_DWORD *)v49;
  *(void *)a2 = v38;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v16 = v40;
  uint64_t v17 = v37;
  *(void *)(a2 + 24) = v41;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v36;
  *(void *)(a2 + 48) = v8;
  *(void *)(a2 + 56) = v35;
  *(unsigned char *)(a2 + 64) = v9;
  uint64_t v18 = v32;
  *(void *)(a2 + 72) = v16;
  *(void *)(a2 + 80) = v18;
  uint64_t v19 = v31;
  uint64_t v20 = v39;
  *(void *)(a2 + 88) = v31;
  *(void *)(a2 + 96) = v20;
  *(void *)(a2 + 104) = v30;
  *(void *)(a2 + 112) = v15;
  uint64_t v21 = v34;
  *(void *)(a2 + 120) = v22;
  *(void *)(a2 + 128) = v21;
  uint64_t v23 = v33;
  *(void *)(a2 + 136) = v14;
  *(void *)(a2 + 144) = v23;
  *(void *)(a2 + 152) = v27;
  *(unsigned char *)(a2 + 160) = v29;
  uint64_t v24 = v28;
  *(void *)(a2 + 168) = sub_1AD733784;
  *(void *)(a2 + 176) = v24;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD733A3C(v16, v18, v19, v20);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD21485C((uint64_t)sub_1AD733784);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1AD1E4514((uint64_t)sub_1AD733784);
  swift_bridgeObjectRelease();
  swift_release();
  return sub_1AD733A88(v40, v18, v19, v39);
}

uint64_t sub_1AD72BD2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(int *)(type metadata accessor for PromptTileView(0) + 24);
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v4 = *(void *)(v3 + 16);
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1AD73E150();
  uint64_t v8 = v7;
  sub_1AD72BEB0(v16);
  sub_1AD732F44((uint64_t)v16, (uint64_t)v15, (uint64_t)&qword_1EB7384B8, (uint64_t)&_s18HealthExperienceUI13AccessoryViewVN_0, MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1AD733118);
  uint64_t v9 = v15[0];
  uint64_t v10 = v15[1];
  uint64_t v11 = v15[2];
  uint64_t v12 = v15[3];
  uint64_t v13 = v15[4];
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = v9;
  *(void *)(a2 + 56) = v10;
  *(void *)(a2 + 64) = v11;
  *(void *)(a2 + 72) = v12;
  *(void *)(a2 + 80) = v13;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD733A3C(v9, v10, v11, v12);
  sub_1AD733A88(v9, v10, v11, v12);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1AD72BEB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PromptTileView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v7 = (char *)v1 + *(int *)(v6 + 32);
  uint64_t v8 = *(void *)&v7[*(int *)(type metadata accessor for PromptTileViewModel(0) + 40)];
  if (*v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1AD73DC00();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v9 = *(void *)(v8 + 16);
    if (v9)
    {
      uint64_t v10 = 0;
      while (*(unsigned __int8 *)(v8 + v10 + 32) != v18[15])
      {
        if (v9 == ++v10) {
          goto LABEL_6;
        }
      }
      swift_bridgeObjectRelease();
      char v16 = sub_1AD72D4D4();
      sub_1AD732E40((uint64_t)v1, (uint64_t)&v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for PromptTileView);
      unint64_t v17 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      uint64_t v14 = swift_allocObject();
      sub_1AD7341B8((uint64_t)&v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v14 + v17, type metadata accessor for PromptTileView);
      type metadata accessor for ProvidedViewContext(0);
      sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
      uint64_t result = sub_1AD73E150();
      uint64_t v12 = v16 & 1;
      uint64_t v13 = sub_1AD733D38;
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t result = 1;
    }
    *a1 = result;
    a1[1] = v11;
    a1[2] = v12;
    a1[3] = (uint64_t)v13;
    a1[4] = v14;
  }
  else
  {
    type metadata accessor for ProvidedViewContext(0);
    sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
    swift_bridgeObjectRetain();
    uint64_t result = sub_1AD73E140();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AD72C174@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v129 = a2;
  uint64_t v3 = type metadata accessor for PromptTileView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v124 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v125 = v5;
  uint64_t v128 = (uint64_t)&v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD7272B4(0, &qword_1E9A34758, (uint64_t (*)(uint64_t))sub_1AD7292EC, MEMORY[0x1E4F3F108]);
  uint64_t v122 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v119 = (uint64_t)&v116 - v7;
  sub_1AD729358();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD72931C(0);
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v120 = (uint64_t)&v116 - v16;
  sub_1AD73360C(0, &qword_1E9A34890, MEMORY[0x1E4F3D748]);
  uint64_t v121 = v17;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v116 - v18;
  uint64_t v20 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F65F88];
  uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)&v116 - v23;
  sub_1AD7292CC(0);
  MEMORY[0x1F4188790](v25 - 8);
  uint64_t v126 = (uint64_t)&v116 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v27);
  uint64_t v123 = (char *)&v116 - v28;
  uint64_t v29 = *(int *)(v4 + 32);
  uint64_t v30 = a1;
  uint64_t v31 = (void *)((char *)a1 + v29);
  uint64_t v130 = type metadata accessor for PromptTileViewModel(0);
  sub_1AD733D44((uint64_t)v31 + *(int *)(v130 + 32), (uint64_t)v24, qword_1EB740380, v20, v21);
  uint64_t v32 = sub_1AD73B970();
  uint64_t v33 = *(void *)(v32 - 8);
  int v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48))(v24, 1, v32);
  id v127 = v30;
  if (v34 == 1)
  {
    sub_1AD733E6C((uint64_t)v24, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    uint64_t v120 = sub_1AD73E370();
    sub_1AD72D34C((uint64_t)v30, (uint64_t)v131);
    uint64_t v35 = v131[0];
    uint64_t v36 = v131[1];
    uint64_t v37 = v131[2];
    uint64_t v38 = v131[3];
    uint64_t v39 = v131[4];
    char v40 = v132;
    uint64_t v41 = v133;
    uint64_t v119 = v134;
    uint64_t v118 = v135;
    uint64_t v117 = v136;
    uint64_t v116 = v137;
    char v42 = sub_1AD73E750();
    if (qword_1EB738280 != -1) {
      swift_once();
    }
    sub_1AD73DE60();
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    char v140 = 1;
    char v139 = v40;
    char v138 = 0;
    char v51 = sub_1AD73E790();
    sub_1AD73DE60();
    char v52 = v140;
    char v53 = v139;
    char v54 = v138;
    LOBYTE(v131[0]) = 0;
    *(void *)uint64_t v19 = v120;
    *((void *)v19 + 1) = 0;
    v19[16] = v52;
    *((void *)v19 + 3) = v35;
    *((void *)v19 + 4) = v36;
    *((void *)v19 + 5) = v37;
    *((void *)v19 + 6) = v38;
    *((void *)v19 + 7) = v39;
    v19[64] = v53;
    uint64_t v55 = v119;
    *((void *)v19 + 9) = v41;
    *((void *)v19 + 10) = v55;
    uint64_t v56 = v117;
    *((void *)v19 + 11) = v118;
    *((void *)v19 + 12) = v56;
    *((void *)v19 + 13) = v116;
    v19[112] = v42;
    *((void *)v19 + 15) = v44;
    *((void *)v19 + 16) = v46;
    *((void *)v19 + 17) = v48;
    *((void *)v19 + 18) = v50;
    v19[152] = v54;
    v19[160] = v51;
    *((void *)v19 + 21) = v57;
    *((void *)v19 + 22) = v58;
    *((void *)v19 + 23) = v59;
    *((void *)v19 + 24) = v60;
    v19[200] = v131[0];
    swift_storeEnumTagMultiPayload();
    sub_1AD7295F4(0);
    sub_1AD7336AC(&qword_1E9A34898, &qword_1E9A34758, (uint64_t (*)(uint64_t))sub_1AD7292EC);
    sub_1AD7332CC(&qword_1E9A348A0, sub_1AD7295F4, (void (*)(void))sub_1AD733710);
    uint64_t v61 = (uint64_t)v123;
    sub_1AD73E4B0();
  }
  else
  {
    uint64_t v117 = v12;
    uint64_t v62 = sub_1AD73B960();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v24, v32);
    *(void *)uint64_t v10 = sub_1AD73E370();
    *((void *)v10 + 1) = 0;
    v10[16] = 1;
    sub_1AD733788(0, &qword_1E9A348B8, &qword_1E9A34778, (uint64_t (*)(uint64_t))sub_1AD72940C);
    uint64_t v64 = (uint64_t)&v10[*(int *)(v63 + 44)];
    uint64_t v118 = v62;
    sub_1AD72CDC0(v62, v30, v64);
    char v65 = sub_1AD73E760();
    if (qword_1EB738280 != -1) {
      swift_once();
    }
    sub_1AD73DE60();
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72;
    sub_1AD732E40((uint64_t)v10, (uint64_t)v14, (uint64_t (*)(void))sub_1AD729358);
    id v74 = &v14[*(int *)(v117 + 36)];
    *id v74 = v65;
    *((void *)v74 + 1) = v67;
    *((void *)v74 + 2) = v69;
    *((void *)v74 + 3) = v71;
    *((void *)v74 + 4) = v73;
    v74[40] = 0;
    sub_1AD732EE4((uint64_t)v10, (uint64_t (*)(void))sub_1AD729358);
    uint64_t v75 = v120;
    sub_1AD7341B8((uint64_t)v14, v120, (uint64_t (*)(void))sub_1AD72931C);
    uint64_t v77 = v31[1];
    uint64_t v76 = v31[2];
    type metadata accessor for ProvidedViewContext(0);
    sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
    swift_bridgeObjectRetain();
    uint64_t v78 = sub_1AD73E150();
    uint64_t v80 = v79;
    char v81 = sub_1AD73E790();
    sub_1AD73DE60();
    uint64_t v83 = v82;
    uint64_t v85 = v84;
    uint64_t v87 = v86;
    uint64_t v89 = v88;
    sub_1AD732E40(v75, (uint64_t)v14, (uint64_t (*)(void))sub_1AD72931C);
    uint64_t v90 = v119;
    sub_1AD732E40((uint64_t)v14, v119, (uint64_t (*)(void))sub_1AD72931C);
    sub_1AD7292EC(0);
    uint64_t v92 = v90 + *(int *)(v91 + 48);
    uint64_t v117 = v78;
    *(void *)uint64_t v92 = v78;
    *(void *)(v92 + 8) = v80;
    *(void *)(v92 + 16) = v77;
    *(void *)(v92 + 24) = v76;
    *(unsigned char *)(v92 + 32) = v81;
    *(void *)(v92 + 40) = v83;
    *(void *)(v92 + 48) = v85;
    *(void *)(v92 + 56) = v87;
    *(void *)(v92 + 64) = v89;
    *(unsigned char *)(v92 + 72) = 0;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1AD732EE4((uint64_t)v14, (uint64_t (*)(void))sub_1AD72931C);
    uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3F108];
    sub_1AD733D44(v90, (uint64_t)v19, &qword_1E9A34758, (uint64_t (*)(uint64_t))sub_1AD7292EC, MEMORY[0x1E4F3F108]);
    swift_storeEnumTagMultiPayload();
    sub_1AD7295F4(0);
    sub_1AD7336AC(&qword_1E9A34898, &qword_1E9A34758, (uint64_t (*)(uint64_t))sub_1AD7292EC);
    sub_1AD7332CC(&qword_1E9A348A0, sub_1AD7295F4, (void (*)(void))sub_1AD733710);
    uint64_t v61 = (uint64_t)v123;
    sub_1AD73E4B0();
    swift_release();
    sub_1AD733E6C(v90, &qword_1E9A34758, (uint64_t (*)(uint64_t))sub_1AD7292EC, v93);
    swift_bridgeObjectRelease();
    swift_release();
    sub_1AD732EE4(v120, (uint64_t (*)(void))sub_1AD72931C);
  }
  uint64_t v94 = v31[4];
  uint64_t v123 = (char *)v31[3];
  uint64_t v95 = v31[6];
  uint64_t v122 = v31[5];
  LODWORD(v121) = *((unsigned __int8 *)v31 + *(int *)(v130 + 48));
  uint64_t v96 = v128;
  sub_1AD732E40((uint64_t)v127, v128, type metadata accessor for PromptTileView);
  unint64_t v97 = (*(unsigned __int8 *)(v124 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80);
  uint64_t v98 = swift_allocObject();
  sub_1AD7341B8(v96, v98 + v97, type metadata accessor for PromptTileView);
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v99 = sub_1AD73E150();
  uint64_t v101 = v100;
  char v102 = sub_1AD73E790();
  sub_1AD73DE60();
  uint64_t v104 = v103;
  uint64_t v106 = v105;
  uint64_t v108 = v107;
  uint64_t v110 = v109;
  uint64_t v111 = v126;
  sub_1AD732E40(v61, v126, (uint64_t (*)(void))sub_1AD7292CC);
  uint64_t v112 = v129;
  sub_1AD732E40(v111, v129, (uint64_t (*)(void))sub_1AD7292CC);
  sub_1AD729208(0);
  uint64_t v114 = v112 + *(int *)(v113 + 48);
  *(void *)uint64_t v114 = v99;
  *(void *)(v114 + 8) = v101;
  *(void *)(v114 + 16) = v123;
  *(void *)(v114 + 24) = v94;
  *(void *)(v114 + 32) = v122;
  *(void *)(v114 + 40) = v95;
  *(unsigned char *)(v114 + 48) = v121;
  *(void *)(v114 + 56) = sub_1AD733784;
  *(void *)(v114 + 64) = v98;
  *(unsigned char *)(v114 + 72) = v102;
  *(void *)(v114 + 80) = v104;
  *(void *)(v114 + 88) = v106;
  *(void *)(v114 + 96) = v108;
  *(void *)(v114 + 104) = v110;
  *(unsigned char *)(v114 + 112) = 0;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD21485C((uint64_t)sub_1AD733784);
  sub_1AD732EE4(v61, (uint64_t (*)(void))sub_1AD7292CC);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1AD1E4514((uint64_t)sub_1AD733784);
  return sub_1AD732EE4(v111, (uint64_t (*)(void))sub_1AD7292CC);
}

uint64_t sub_1AD72CDC0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v48 = a2;
  sub_1AD729588(0, &qword_1E9A34798, MEMORY[0x1E4F3CA60], MEMORY[0x1E4F3CA58], MEMORY[0x1E4F3DC28]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v45 - v5;
  uint64_t v7 = sub_1AD73E010();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD7294F0();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (void *)((char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1AD7294A8(0);
  v45[1] = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v46 = (uint64_t)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)v45 - v18;
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)v45 - v21;
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (char *)v45 - v24;
  sub_1AD73E000();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  sub_1AD733804((uint64_t)v6, (uint64_t)v14 + *(int *)(v12 + 36));
  *uint64_t v14 = a1;
  swift_retain();
  sub_1AD7338A0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v26 = v48;
  sub_1AD733118(0, (unint64_t *)&qword_1EB741480, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1AD74C350;
  if (*v26)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = (uint64_t *)(*v26 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
    swift_beginAccess();
    if (v29[1])
    {
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
    }
    else
    {
      uint64_t v30 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    }
    v28[4] = v30;
    v28[5] = v31;
    v28[6] = 1852793673;
    v28[7] = 0xE400000000000000;
    swift_bridgeObjectRetain();
    uint64_t v32 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
    id v33 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v33)
    {
      _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

      sub_1AD733934();
      sub_1AD73EAA0();
      swift_bridgeObjectRelease();
      sub_1AD732EE4((uint64_t)v14, (uint64_t (*)(void))sub_1AD7294F0);
      sub_1AD73E070();
      sub_1AD732EE4((uint64_t)v19, (uint64_t (*)(void))sub_1AD7294A8);
      sub_1AD7341B8((uint64_t)v22, (uint64_t)v25, (uint64_t (*)(void))sub_1AD7294A8);
      sub_1AD72BEB0(v54);
      uint64_t v34 = v46;
      sub_1AD732E40((uint64_t)v25, v46, (uint64_t (*)(void))sub_1AD7294A8);
      sub_1AD732F44((uint64_t)v54, (uint64_t)&v49, (uint64_t)&qword_1EB7384B8, (uint64_t)&_s18HealthExperienceUI13AccessoryViewVN_0, MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1AD733118);
      uint64_t v35 = v47;
      sub_1AD732E40(v34, v47, (uint64_t (*)(void))sub_1AD7294A8);
      sub_1AD72940C();
      uint64_t v37 = v35 + *(int *)(v36 + 48);
      *(void *)uint64_t v37 = 0;
      *(unsigned char *)(v37 + 8) = 1;
      uint64_t v38 = (void *)(v35 + *(int *)(v36 + 64));
      uint64_t v39 = v49;
      uint64_t v40 = v50;
      uint64_t v41 = v51;
      uint64_t v42 = v52;
      uint64_t v43 = v53;
      *uint64_t v38 = v49;
      v38[1] = v40;
      v38[2] = v41;
      v38[3] = v42;
      v38[4] = v43;
      sub_1AD733A3C(v39, v40, v41, v42);
      sub_1AD732EE4((uint64_t)v25, (uint64_t (*)(void))sub_1AD7294A8);
      sub_1AD733A88(v49, v50, v51, v52);
      return sub_1AD732EE4(v34, (uint64_t (*)(void))sub_1AD7294A8);
    }
    __break(1u);
  }
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  uint64_t result = sub_1AD73E140();
  __break(1u);
  return result;
}

uint64_t sub_1AD72D34C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(int *)(type metadata accessor for PromptTileView(0) + 24);
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v4 = *(void *)(v3 + 16);
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1AD73E150();
  uint64_t v8 = v7;
  sub_1AD72BEB0(v16);
  sub_1AD732F44((uint64_t)v16, (uint64_t)v15, (uint64_t)&qword_1EB7384B8, (uint64_t)&_s18HealthExperienceUI13AccessoryViewVN_0, MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1AD733118);
  uint64_t v9 = v15[0];
  uint64_t v10 = v15[1];
  uint64_t v11 = v15[2];
  uint64_t v12 = v15[3];
  uint64_t v13 = v15[4];
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v9;
  *(void *)(a2 + 56) = v10;
  *(void *)(a2 + 64) = v11;
  *(void *)(a2 + 72) = v12;
  *(void *)(a2 + 80) = v13;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD733A3C(v9, v10, v11, v12);
  sub_1AD733A88(v9, v10, v11, v12);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1AD72D4D4()
{
  uint64_t v1 = type metadata accessor for PromptTileView(0);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)v0 + *(int *)(v4 + 24);
  uint64_t v6 = *(void *)&v5[*(int *)(type metadata accessor for PromptTileViewModel(0) + 44)];
  if (*v0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1AD73DC00();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      uint64_t v8 = 0;
      while (*(unsigned __int8 *)(v6 + v8 + 32) != v12)
      {
        if (v7 == ++v8) {
          goto LABEL_6;
        }
      }
      swift_bridgeObjectRelease();
      sub_1AD732E40((uint64_t)v0, (uint64_t)v3, type metadata accessor for PromptTileView);
      BOOL v9 = 0;
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      sub_1AD732E40((uint64_t)v0, (uint64_t)v3, type metadata accessor for PromptTileView);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_1AD73DC00();
      swift_release();
      swift_release();
      BOOL v9 = (v11 & 2) == 0;
    }
    sub_1AD732EE4((uint64_t)v3, type metadata accessor for PromptTileView);
    return v9;
  }
  else
  {
    type metadata accessor for ProvidedViewContext(0);
    sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
    swift_bridgeObjectRetain();
    uint64_t result = sub_1AD73E140();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AD72D738@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EB738280 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EB738270;
  *(void *)a1 = sub_1AD73E430();
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = 0;
  sub_1AD733478(0, &qword_1E9A34718, &qword_1E9A34720, (uint64_t (*)(uint64_t))sub_1AD7290B8);
  return sub_1AD728B20(v1, a1 + *(int *)(v4 + 44));
}

void *initializeBufferWithCopyOfBuffer for PromptTileViewModel(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    uint64_t v9 = a2[4];
    a1[3] = a2[3];
    a1[4] = v9;
    uint64_t v10 = a2[6];
    uint64_t v11 = a3[8];
    __dst = (char *)a1 + v11;
    unsigned __int8 v12 = (char *)a2 + v11;
    a1[5] = a2[5];
    a1[6] = v10;
    uint64_t v13 = sub_1AD73B970();
    uint64_t v22 = *(void *)(v13 - 8);
    uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v23(v12, 1, v13))
    {
      sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
      memcpy(__dst, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(__dst, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v13);
    }
    uint64_t v15 = a3[9];
    uint64_t v16 = a3[10];
    uint64_t v17 = (_OWORD *)((char *)v7 + v15);
    uint64_t v18 = (_OWORD *)((char *)a2 + v15);
    long long v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    *(void *)((char *)v7 + v16) = *(void *)((char *)a2 + v16);
    uint64_t v20 = a3[12];
    *(void *)((char *)v7 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *((unsigned char *)v7 + v20) = *((unsigned char *)a2 + v20);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for PromptTileViewModel(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1AD73B970();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PromptTileViewModel(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a3[8];
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  a1[6] = a2[6];
  uint64_t v10 = sub_1AD73B970();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v9, 1, v10))
  {
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    memcpy(__dst, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v13 = a3[9];
  uint64_t v14 = a3[10];
  uint64_t v15 = (_OWORD *)((char *)a1 + v13);
  uint64_t v16 = (_OWORD *)((char *)a2 + v13);
  long long v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v18 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PromptTileViewModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AD73B970();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[9];
  uint64_t v16 = (char *)a1 + v15;
  long long v17 = (char *)a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  uint64_t v18 = *((void *)v17 + 1);
  v16[16] = v17[16];
  *((void *)v16 + 1) = v18;
  *((void *)v16 + 3) = *((void *)v17 + 3);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  return a1;
}

uint64_t initializeWithTake for PromptTileViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1AD73B970();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  long long v14 = *(_OWORD *)(a2 + v12);
  long long v15 = *(_OWORD *)(a2 + v12 + 16);
  uint64_t v16 = (_OWORD *)(a1 + v12);
  *uint64_t v16 = v14;
  v16[1] = v15;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v17 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  return a1;
}

void *assignWithTake for PromptTileViewModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[4];
  a1[3] = a2[3];
  a1[4] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[6];
  a1[5] = a2[5];
  a1[6] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1AD73B970();
  uint64_t v13 = *(void *)(v12 - 8);
  long long v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = a3[9];
  uint64_t v19 = a3[10];
  uint64_t v20 = (char *)a1 + v18;
  uint64_t v21 = (char *)a2 + v18;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  v20[16] = v21[16];
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 3) = *((void *)v21 + 3);
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PromptTileViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AD72E378);
}

uint64_t sub_1AD72E378(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PromptTileViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AD72E46C);
}

void *sub_1AD72E46C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 32);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1AD72E544()
{
  sub_1AD7272B4(319, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for PromptTileViewModel.Padding()
{
  return &type metadata for PromptTileViewModel.Padding;
}

void *initializeBufferWithCopyOfBuffer for PromptTileView(void *a1, void *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v12 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    sub_1AD7272B4(0, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_1AD73E030();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v41 = a3;
    uint64_t v42 = a2;
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v43 = a1;
    long long v14 = (void *)((char *)a1 + v13);
    int v15 = (void *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *long long v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v15[3];
    v14[2] = v15[2];
    v14[3] = v17;
    uint64_t v18 = v15[5];
    v14[4] = v15[4];
    v14[5] = v18;
    v14[6] = v15[6];
    uint64_t v19 = type metadata accessor for PromptTileViewModel(0);
    uint64_t v20 = *(int *)(v19 + 32);
    uint64_t v39 = (int *)v19;
    __dst = (char *)v14 + v20;
    uint64_t v21 = (char *)v15 + v20;
    uint64_t v22 = sub_1AD73B970();
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v38(v21, 1, v22))
    {
      sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
      memcpy(__dst, v21, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(__dst, v21, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
    }
    uint64_t v25 = v39[9];
    uint64_t v26 = (_OWORD *)((char *)v14 + v25);
    uint64_t v27 = (_OWORD *)((char *)v15 + v25);
    long long v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    *(void *)((char *)v14 + v39[10]) = *(void *)((char *)v15 + v39[10]);
    *(void *)((char *)v14 + v39[11]) = *(void *)((char *)v15 + v39[11]);
    *((unsigned char *)v14 + v39[12]) = *((unsigned char *)v15 + v39[12]);
    uint64_t v29 = *(int *)(v41 + 28);
    uint64_t v30 = *(int *)(v41 + 32);
    uint64_t v12 = v43;
    uint64_t v31 = (void *)((char *)v43 + v29);
    uint64_t v32 = (void *)((char *)v42 + v29);
    uint64_t v33 = v32[1];
    void *v31 = *v32;
    v31[1] = v33;
    uint64_t v34 = (void *)((char *)v43 + v30);
    uint64_t v35 = (void *)((char *)v42 + v30);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return v12;
}

uint64_t destroy for PromptTileView(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_1AD7272B4(0, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1AD73E030();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + *(int *)(type metadata accessor for PromptTileViewModel(0) + 32);
  uint64_t v8 = sub_1AD73B970();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for PromptTileView(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_1AD7272B4(0, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  swift_retain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1AD73E030();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v38 = a2;
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = v13[3];
  v12[2] = v13[2];
  v12[3] = v15;
  uint64_t v16 = v13[5];
  v12[4] = v13[4];
  v12[5] = v16;
  v12[6] = v13[6];
  uint64_t v17 = (int *)type metadata accessor for PromptTileViewModel(0);
  uint64_t v18 = v17[8];
  uint64_t v36 = (char *)v13 + v18;
  __dst = (char *)v12 + v18;
  uint64_t v19 = sub_1AD73B970();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v35(v36, 1, v19))
  {
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    memcpy(__dst, v36, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(__dst, v36, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
  }
  uint64_t v22 = v17[9];
  uint64_t v23 = (_OWORD *)((char *)v12 + v22);
  uint64_t v24 = (_OWORD *)((char *)v13 + v22);
  long long v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  *(void *)((char *)v12 + v17[10]) = *(void *)((char *)v13 + v17[10]);
  *(void *)((char *)v12 + v17[11]) = *(void *)((char *)v13 + v17[11]);
  *((unsigned char *)v12 + v17[12]) = *((unsigned char *)v13 + v17[12]);
  uint64_t v26 = a3[7];
  uint64_t v27 = a3[8];
  long long v28 = (void *)((char *)a1 + v26);
  uint64_t v29 = (void *)((char *)v38 + v26);
  uint64_t v30 = v29[1];
  *long long v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = (void *)((char *)a1 + v27);
  uint64_t v32 = (void *)((char *)v38 + v27);
  uint64_t v33 = v32[1];
  void *v31 = *v32;
  v31[1] = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PromptTileView(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F3CB98];
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
    sub_1AD733E6C((uint64_t)a1 + v6, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
    sub_1AD7272B4(0, qword_1EB740408, v9, v10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_1AD73E030();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v7, v8, v11);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v39 = a2;
  uint64_t v12 = a3[6];
  uint64_t v38 = a1;
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  swift_retain();
  swift_release();
  v13[1] = v14[1];
  v13[2] = v14[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[3] = v14[3];
  v13[4] = v14[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[5] = v14[5];
  v13[6] = v14[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = (int *)type metadata accessor for PromptTileViewModel(0);
  uint64_t v16 = v15[8];
  uint64_t v17 = (char *)v13 + v16;
  uint64_t v18 = (char *)v14 + v16;
  uint64_t v19 = sub_1AD73B970();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v17, v18, v19);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_11;
  }
  if (v23)
  {
LABEL_11:
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_12:
  uint64_t v25 = v15[9];
  uint64_t v26 = (char *)v13 + v25;
  uint64_t v27 = (char *)v14 + v25;
  *(void *)uint64_t v26 = *(void *)v27;
  uint64_t v28 = *((void *)v27 + 1);
  v26[16] = v27[16];
  *((void *)v26 + 1) = v28;
  *((void *)v26 + 3) = *((void *)v27 + 3);
  *(void *)((char *)v13 + v15[10]) = *(void *)((char *)v14 + v15[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)v13 + v15[11]) = *(void *)((char *)v14 + v15[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)v13 + v15[12]) = *((unsigned char *)v14 + v15[12]);
  uint64_t v29 = a3[7];
  uint64_t v30 = (void *)((char *)v38 + v29);
  uint64_t v31 = (void *)((char *)v39 + v29);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  swift_retain();
  swift_release();
  uint64_t v33 = a3[8];
  uint64_t v34 = (void *)((char *)v38 + v33);
  uint64_t v35 = (void *)((char *)v39 + v33);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  swift_retain();
  swift_release();
  return v38;
}

_OWORD *initializeWithTake for PromptTileView(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  sub_1AD7272B4(0, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  uint64_t v10 = v9;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1AD73E030();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v7, v8, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(void *)uint64_t v13 = *(void *)((char *)a2 + v12);
  *(_OWORD *)(v13 + 8) = *(_OWORD *)((char *)a2 + v12 + 8);
  *(_OWORD *)(v13 + 24) = *(_OWORD *)((char *)a2 + v12 + 24);
  *(_OWORD *)(v13 + 40) = *(_OWORD *)((char *)a2 + v12 + 40);
  uint64_t v15 = (int *)type metadata accessor for PromptTileViewModel(0);
  uint64_t v16 = v15[8];
  uint64_t v17 = &v13[v16];
  uint64_t v18 = &v14[v16];
  uint64_t v19 = sub_1AD73B970();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = v15[9];
  int v23 = &v13[v22];
  uint64_t v24 = &v14[v22];
  long long v25 = *((_OWORD *)v24 + 1);
  *(_OWORD *)int v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v25;
  *(void *)&v13[v15[10]] = *(void *)&v14[v15[10]];
  *(void *)&v13[v15[11]] = *(void *)&v14[v15[11]];
  v13[v15[12]] = v14[v15[12]];
  uint64_t v26 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v26) = *(_OWORD *)((char *)a2 + v26);
  return a1;
}

void *assignWithTake for PromptTileView(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F3CB98];
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F3C648];
    sub_1AD733E6C((uint64_t)a1 + v6, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
    sub_1AD7272B4(0, qword_1EB740408, v9, v10);
    uint64_t v12 = v11;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_1AD73E030();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v7, v8, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  uint64_t v37 = a2;
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_release();
  uint64_t v17 = v16[2];
  v15[1] = v16[1];
  v15[2] = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = v16[4];
  v15[3] = v16[3];
  v15[4] = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = v16[6];
  void v15[5] = v16[5];
  v15[6] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = (int *)type metadata accessor for PromptTileViewModel(0);
  uint64_t v21 = v20[8];
  uint64_t v22 = (char *)v15 + v21;
  int v23 = (char *)v16 + v21;
  uint64_t v24 = sub_1AD73B970();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  uint64_t v36 = v22;
  LODWORD(v22) = v26(v22, 1, v24);
  int v27 = v26(v23, 1, v24);
  if (v22)
  {
    if (!v27)
    {
      (*(void (**)(void *, char *, uint64_t))(v25 + 32))(v36, v23, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v36, 0, 1, v24);
      goto LABEL_13;
    }
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    size_t v29 = *(void *)(*(void *)(v28 - 8) + 64);
    uint64_t v30 = v36;
  }
  else
  {
    if (!v27)
    {
      (*(void (**)(void *, char *, uint64_t))(v25 + 40))(v36, v23, v24);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v36, v24);
    sub_1AD7272B4(0, qword_1EB740380, MEMORY[0x1E4F65F88], MEMORY[0x1E4FBB718]);
    size_t v29 = *(void *)(*(void *)(v31 - 8) + 64);
    uint64_t v30 = v36;
  }
  memcpy(v30, v23, v29);
LABEL_13:
  uint64_t v32 = v20[9];
  uint64_t v33 = (char *)v15 + v32;
  uint64_t v34 = (char *)v16 + v32;
  *(void *)uint64_t v33 = *(void *)v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  v33[16] = v34[16];
  *((void *)v33 + 3) = *((void *)v34 + 3);
  *(void *)((char *)v15 + v20[10]) = *(void *)((char *)v16 + v20[10]);
  swift_bridgeObjectRelease();
  *(void *)((char *)v15 + v20[11]) = *(void *)((char *)v16 + v20[11]);
  swift_bridgeObjectRelease();
  *((unsigned char *)v15 + v20[12]) = *((unsigned char *)v16 + v20[12]);
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)v37 + a3[7]);
  swift_release();
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)v37 + a3[8]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PromptTileView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AD72F984);
}

uint64_t sub_1AD72F984(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1AD7272B4(0, qword_1E9A2B450, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C658]);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = type metadata accessor for PromptTileViewModel(0);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[6];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[7]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for PromptTileView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AD72FAD8);
}

uint64_t sub_1AD72FAD8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1AD7272B4(0, qword_1E9A2B450, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C658]);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
  }
  else
  {
    uint64_t result = type metadata accessor for PromptTileViewModel(0);
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[7]) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[6];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  return v13(a1 + v11, a2, a2, v9);
}

void sub_1AD72FC14()
{
  sub_1AD7272B4(319, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for PromptTileViewModel(319);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t sub_1AD72FD2C()
{
  unint64_t result = qword_1E9A34838;
  if (!qword_1E9A34838)
  {
    sub_1AD729BF8(255, &qword_1E9A34840, &qword_1E9A34720, (uint64_t (*)(uint64_t))sub_1AD7290B8, &qword_1E9A34848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34838);
  }
  return result;
}

uint64_t _s18HealthExperienceUI33ContentSecondaryTextAndActionViewVwxx_0(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56))
  {
    return swift_release();
  }
  return result;
}

uint64_t _s18HealthExperienceUI33ContentSecondaryTextAndActionViewVwcp_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = (_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 56);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v5;
    *(void *)(a1 + 64) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *v6;
  }
  return a1;
}

uint64_t _s18HealthExperienceUI33ContentSecondaryTextAndActionViewVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a1 + 56);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 56);
  if (!v4)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v5;
      *(void *)(a1 + 64) = v7;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = v6;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s18HealthExperienceUI33ContentSecondaryTextAndActionViewVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  uint64_t v6 = *(void *)(a1 + 56);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (!v6)
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v5;
      *(void *)(a1 + 64) = v8;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = v7;
  swift_release();
  return a1;
}

uint64_t _s18HealthExperienceUI33ContentSecondaryTextAndActionViewVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 72)) {
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

uint64_t _s18HealthExperienceUI33ContentSecondaryTextAndActionViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *_s18HealthExperienceUI33ContentSecondaryTextAndActionViewVMa_0()
{
  return &_s18HealthExperienceUI33ContentSecondaryTextAndActionViewVN_0;
}

ValueMetadata *_s18HealthExperienceUI22ContentPrimaryTextViewVMa_0()
{
  return &_s18HealthExperienceUI22ContentPrimaryTextViewVN_0;
}

uint64_t _s18HealthExperienceUI13AccessoryViewVwxx_0(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 24))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for AccessoryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = (_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  swift_retain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *v6;
  }
  return a1;
}

uint64_t _s18HealthExperienceUI13AccessoryViewVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 24);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  if (!v4)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = v7;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s18HealthExperienceUI13AccessoryViewVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (!v5)
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v6;
  swift_release();
  return a1;
}

ValueMetadata *_s18HealthExperienceUI13AccessoryViewVMa_1()
{
  return &_s18HealthExperienceUI13AccessoryViewVN_0;
}

uint64_t getEnumTagSinglePayload for PromptTileViewModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PromptTileViewModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x1AD7304ACLL);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PromptTileViewModel.CodingKeys()
{
  return &type metadata for PromptTileViewModel.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PromptTileViewModel.Padding.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AD7305B0);
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

ValueMetadata *type metadata accessor for PromptTileViewModel.Padding.CodingKeys()
{
  return &type metadata for PromptTileViewModel.Padding.CodingKeys;
}

unint64_t sub_1AD7305EC()
{
  unint64_t result = qword_1E9A34850;
  if (!qword_1E9A34850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34850);
  }
  return result;
}

unint64_t sub_1AD730644()
{
  unint64_t result = qword_1E9A34858;
  if (!qword_1E9A34858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34858);
  }
  return result;
}

uint64_t sub_1AD730698()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD7306B4@<X0>(uint64_t a1@<X8>)
{
  sub_1AD733164(0);
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v3);
  unsigned int v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v26 - v10;
  if (*(unsigned char *)(v1 + 16))
  {
    uint64_t v27 = v8;
    uint64_t v14 = *(void *)(v1 + 24);
    uint64_t v15 = *(void *)(v1 + 32);
    sub_1AD21485C(v14);
    if (qword_1EB73BF28 != -1) {
      swift_once();
    }
    uint64_t v16 = qword_1EB73BF18;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v29 = v14;
    uint64_t v30 = v15;
    uint64_t v26 = KeyPath;
    uint64_t v31 = KeyPath;
    uint64_t v32 = v16;
    sub_1AD733118(0, (unint64_t *)&qword_1EB741480, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1AD7511A0;
    if (*(void *)v1)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v20 = (uint64_t *)(*(void *)v1
                      + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
      swift_beginAccess();
      if (v20[1])
      {
        uint64_t v21 = *v20;
        uint64_t v22 = v20[1];
      }
      else
      {
        uint64_t v21 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
      }
      uint64_t v28 = a1;
      v19[4] = v21;
      v19[5] = v22;
      v19[6] = 0x726564616548;
      v19[7] = 0xE600000000000000;
      v19[8] = 0x6E6F7474754258;
      v19[9] = 0xE700000000000000;
      swift_retain();
      swift_bridgeObjectRetain();
      int v23 = (void *)sub_1AD73F490();
      swift_bridgeObjectRelease();
      id v24 = (id)HKUIJoinStringsForAutomationIdentifier();

      if (v24)
      {
        _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

        sub_1AD5681F0();
        sub_1AD5682E8();
        sub_1AD73EAA0();
        swift_bridgeObjectRelease();
        sub_1AD1E4514(v14);
        swift_release();
        swift_release();
        sub_1AD7341B8((uint64_t)v6, (uint64_t)v11, (uint64_t (*)(void))sub_1AD733164);
        uint64_t v25 = v28;
        sub_1AD7341B8((uint64_t)v11, v28, (uint64_t (*)(void))sub_1AD733164);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v25, 0, 1, v4);
      }
      __break(1u);
    }
    type metadata accessor for ProvidedViewContext(0);
    sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
    swift_retain();
    uint64_t result = sub_1AD73E140();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v8 + 56);
    return v12(a1, 1, 1, v4, v9);
  }
  return result;
}

uint64_t sub_1AD730A8C@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD7306B4(a1);
}

uint64_t sub_1AD730AC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD730AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v53 = a1;
  uint64_t v50 = a5;
  uint64_t v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F3E0A0];
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD7272B4(0, &qword_1EB73BF08, MEMORY[0x1E4F3E0A0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)v47 - v10;
  uint64_t v12 = sub_1AD73E900();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD36EB64(0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v49 = (char *)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = a3;
  uint64_t v55 = a4;
  sub_1AD20F9FC();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_1AD73E9B0();
  uint64_t v52 = v19;
  int v51 = v20;
  uint64_t v22 = v21;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4F3E140], v12);
  uint64_t v24 = sub_1AD73E7F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
  sub_1AD73E880();
  uint64_t v25 = sub_1AD73E8A0();
  sub_1AD733E6C((uint64_t)v11, &qword_1EB73BF08, v7, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v26 = swift_getKeyPath();
  uint64_t v27 = sub_1AD73EBB0();
  uint64_t v28 = swift_getKeyPath();
  char v29 = sub_1AD73E760();
  if (qword_1EB7383C8 != -1) {
    swift_once();
  }
  sub_1AD73DE60();
  char v30 = v51;
  char v81 = v51 & 1;
  char v76 = 0;
  uint64_t v54 = v18;
  uint64_t v31 = v52;
  uint64_t v55 = v52;
  char v56 = v51 & 1;
  *(_DWORD *)uint64_t v57 = *(_DWORD *)v80;
  *(_DWORD *)&v57[3] = *(_DWORD *)&v80[3];
  uint64_t v58 = v22;
  __int16 v59 = 256;
  int v60 = *(_DWORD *)&v78[7];
  __int16 v61 = v79;
  uint64_t v62 = KeyPath;
  char v63 = 0;
  *(_DWORD *)&v64[3] = *(_DWORD *)&v78[3];
  *(_DWORD *)uint64_t v64 = *(_DWORD *)v78;
  uint64_t v65 = v26;
  uint64_t v66 = v25;
  v47[0] = v28;
  uint64_t v67 = v28;
  uint64_t v68 = v27;
  char v69 = v29;
  *(_DWORD *)&v70[3] = *(_DWORD *)&v77[3];
  *(_DWORD *)uint64_t v70 = *(_DWORD *)v77;
  uint64_t v71 = v32;
  uint64_t v72 = v33;
  uint64_t v73 = v34;
  uint64_t v74 = v35;
  char v75 = 0;
  sub_1AD733118(0, (unint64_t *)&qword_1EB741480, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1AD74C350;
  if (v53)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = v31;
    char v39 = v30;
    uint64_t v40 = (uint64_t *)(v53 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
    swift_beginAccess();
    if (v40[1])
    {
      uint64_t v41 = *v40;
      uint64_t v42 = v40[1];
    }
    else
    {
      uint64_t v41 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    }
    v47[1] = v27;
    uint64_t v48 = v26;
    uint64_t v53 = v25;
    v37[4] = v41;
    v37[5] = v42;
    v37[6] = 0x656C746954;
    v37[7] = 0xE500000000000000;
    swift_bridgeObjectRetain();
    uint64_t v43 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
    id v44 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v44)
    {
      _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

      sub_1AD36EC0C(0);
      sub_1AD36EE58();
      uint64_t v45 = (uint64_t)v49;
      sub_1AD73EAA0();
      swift_bridgeObjectRelease();
      sub_1AD1CB6E0(v18, v38, v39 & 1);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return sub_1AD7341B8(v45, v50, (uint64_t (*)(void))sub_1AD36EB64);
    }
    __break(1u);
  }
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  uint64_t result = sub_1AD73E140();
  __break(1u);
  return result;
}

uint64_t sub_1AD7310E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD730AE4(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t sub_1AD7310EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD731108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD7272B4(0, &qword_1EB738F08, (uint64_t (*)(uint64_t))sub_1AD73296C, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v49 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v49 - v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v51 = (uint64_t)&v49 - v10;
  sub_1AD7272B4(0, &qword_1EB738FA0, MEMORY[0x1E4F3EE70], v3);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v49 - v15;
  sub_1AD7272B4(0, &qword_1EB738E38, (uint64_t (*)(uint64_t))sub_1AD73286C, v3);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v53 = (uint64_t)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v49 - v20;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v49 - v23;
  uint64_t v25 = *(void *)(a1 + 24);
  if (v25)
  {
    v54[0] = *(void *)(a1 + 16);
    v54[1] = v25;
    swift_bridgeObjectRetain();
    sub_1AD73184C((uint64_t)v54, (void *)a1);
    sub_1AD73286C(0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v21, 0, 1, v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1AD73286C(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v21, 1, 1, v27);
  }
  sub_1AD732F44((uint64_t)v21, (uint64_t)v24, (uint64_t)&qword_1EB738E38, (uint64_t)sub_1AD73286C, MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1AD7272B4);
  char v28 = *(unsigned char *)(a1 + 48);
  uint64_t v52 = v24;
  if (v28)
  {
    sub_1AD73ED30();
    uint64_t v30 = sub_1AD73ED40();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v16, 0, 1, v30);
  }
  else
  {
    uint64_t v29 = sub_1AD73ED40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v16, 1, 1, v29);
  }
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31)
  {
    uint64_t v32 = *(void *)(a1 + 32);
    uint64_t v33 = swift_allocObject();
    long long v34 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v33 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v33 + 64) = v34;
    *(void *)(v33 + 80) = *(void *)(a1 + 64);
    long long v35 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v33 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v33 + 32) = v35;
    MEMORY[0x1F4188790](v33);
    *(&v49 - 4) = v32;
    *(&v49 - 3) = v31;
    *(&v49 - 2) = a1;
    swift_bridgeObjectRetain();
    sub_1AD73304C(a1);
    sub_1AD732A14(0);
    sub_1AD732C48(&qword_1EB738E58, sub_1AD732A14, (void (*)(void))sub_1AD732C00, (void (*)(void))sub_1AD36F81C);
    sub_1AD73EC50();
    sub_1AD73296C();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v8, 0, 1, v36);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1AD73296C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v8, 1, 1, v37);
  }
  uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  uint64_t v39 = v51;
  sub_1AD732F44((uint64_t)v8, v51, (uint64_t)&qword_1EB738F08, (uint64_t)sub_1AD73296C, MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1AD7272B4);
  uint64_t v40 = v53;
  sub_1AD733D44((uint64_t)v52, v53, &qword_1EB738E38, (uint64_t (*)(uint64_t))sub_1AD73286C, v38);
  uint64_t v41 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F3EE70];
  uint64_t v42 = (uint64_t)v16;
  sub_1AD733D44((uint64_t)v16, (uint64_t)v13, &qword_1EB738FA0, MEMORY[0x1E4F3EE70], v38);
  uint64_t v43 = v49;
  sub_1AD733D44(v39, v49, &qword_1EB738F08, (uint64_t (*)(uint64_t))sub_1AD73296C, v38);
  uint64_t v44 = v50;
  sub_1AD733D44(v40, v50, &qword_1EB738E38, (uint64_t (*)(uint64_t))sub_1AD73286C, v38);
  sub_1AD732770();
  uint64_t v45 = (uint64_t)v13;
  uint64_t v47 = v46;
  sub_1AD733D44(v45, v44 + *(int *)(v46 + 48), &qword_1EB738FA0, v41, v38);
  sub_1AD733D44(v43, v44 + *(int *)(v47 + 64), &qword_1EB738F08, (uint64_t (*)(uint64_t))sub_1AD73296C, v38);
  sub_1AD733E6C(v39, &qword_1EB738F08, (uint64_t (*)(uint64_t))sub_1AD73296C, v38);
  sub_1AD733E6C(v42, &qword_1EB738FA0, v41, v38);
  sub_1AD733E6C((uint64_t)v52, &qword_1EB738E38, (uint64_t (*)(uint64_t))sub_1AD73286C, v38);
  sub_1AD733E6C(v43, &qword_1EB738F08, (uint64_t (*)(uint64_t))sub_1AD73296C, v38);
  sub_1AD733E6C(v45, &qword_1EB738FA0, v41, v38);
  return sub_1AD733E6C(v53, &qword_1EB738E38, (uint64_t (*)(uint64_t))sub_1AD73286C, v38);
}

uint64_t sub_1AD73184C(uint64_t a1, void *a2)
{
  sub_1AD20F9FC();
  swift_bridgeObjectRetain();
  uint64_t v2 = MEMORY[0x1E4FBB1A0];
  uint64_t v3 = sub_1AD73E9B0();
  uint64_t v5 = v4;
  char v7 = v6;
  swift_getKeyPath();
  sub_1AD73E7E0();
  char v8 = v7;
  swift_getKeyPath();
  sub_1AD73EBC0();
  swift_getKeyPath();
  sub_1AD733118(0, (unint64_t *)&qword_1EB741480, v2, MEMORY[0x1E4FBBE00]);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1AD74C350;
  if (*a2)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = (uint64_t *)(*a2 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
    swift_beginAccess();
    if (v11[1])
    {
      uint64_t v12 = *v11;
      uint64_t v13 = v11[1];
    }
    else
    {
      uint64_t v12 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    }
    v10[4] = v12;
    v10[5] = v13;
    v10[6] = 0x7470697263736544;
    v10[7] = 0xEB000000006E6F69;
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
    id v15 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v15)
    {
      _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

      sub_1AD36EC98();
      sub_1AD36EF10();
      sub_1AD73EAA0();
      swift_bridgeObjectRelease();
      sub_1AD1CB6E0(v3, v5, v8 & 1);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  uint64_t result = sub_1AD73E140();
  __break(1u);
  return result;
}

uint64_t sub_1AD731B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v33 = a4;
  long long v34 = a3;
  sub_1AD732A14(0);
  MEMORY[0x1F4188790](v6 - 8);
  char v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  sub_1AD20F9FC();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1AD73E9B0();
  uint64_t v11 = v10;
  int v13 = v12;
  uint64_t v15 = v14;
  id v16 = objc_msgSend(self, sel_hk_appTintColor);
  uint64_t v17 = MEMORY[0x1B3E64EC0](v16);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = sub_1AD73E7E0();
  uint64_t v20 = swift_getKeyPath();
  uint64_t v21 = swift_getKeyPath();
  uint64_t v35 = v9;
  uint64_t v36 = v11;
  char v37 = v13 & 1;
  uint64_t v38 = v15;
  __int16 v39 = 256;
  v32[3] = KeyPath;
  v32[4] = v17;
  uint64_t v40 = KeyPath;
  uint64_t v41 = v17;
  v32[1] = v20;
  long long v32[2] = v19;
  uint64_t v42 = v20;
  uint64_t v43 = v19;
  uint64_t v44 = v21;
  char v45 = 0;
  sub_1AD733118(0, (unint64_t *)&qword_1EB741480, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v34;
  *(_OWORD *)(v22 + 16) = xmmword_1AD74C350;
  uint64_t v24 = *v23;
  if (*v23)
  {
    uint64_t v25 = (void *)v22;
    LODWORD(v34) = v13;
    uint64_t v26 = (uint64_t *)(v24 + OBJC_IVAR____TtC18HealthExperienceUI19ProvidedViewContext_baseAutomationIdentifier);
    swift_beginAccess();
    if (v26[1])
    {
      uint64_t v27 = *v26;
      uint64_t v28 = v26[1];
    }
    else
    {
      uint64_t v27 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    }
    v25[4] = v27;
    v25[5] = v28;
    v25[6] = 1802398028;
    v25[7] = 0xE400000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
    id v30 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v30)
    {
      _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();

      sub_1AD732A5C();
      sub_1AD732C00();
      sub_1AD73EAA0();
      swift_bridgeObjectRelease();
      sub_1AD1CB6E0(v9, v11, v34 & 1);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return sub_1AD7341B8((uint64_t)v8, v33, (uint64_t (*)(void))sub_1AD732A14);
    }
    __break(1u);
  }
  type metadata accessor for ProvidedViewContext(0);
  sub_1AD1F8C64(&qword_1EB739D80, (void (*)(uint64_t))type metadata accessor for ProvidedViewContext);
  uint64_t result = sub_1AD73E140();
  __break(1u);
  return result;
}

uint64_t sub_1AD731EA8@<X0>(uint64_t a1@<X8>)
{
  sub_1AD732740(0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)(v1 + 48);
  v23[2] = *(_OWORD *)(v1 + 32);
  v23[3] = v6;
  uint64_t v24 = *(void *)(v1 + 64);
  long long v7 = *(_OWORD *)(v1 + 16);
  v23[0] = *(_OWORD *)v1;
  v23[1] = v7;
  uint64_t v8 = sub_1AD73E440();
  if (qword_1EB7383B0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1EB7383A0;
  *(void *)uint64_t v5 = v8;
  *((void *)v5 + 1) = v9;
  v5[16] = 0;
  sub_1AD733478(0, &qword_1EB738C80, &qword_1EB739030, (uint64_t (*)(uint64_t))sub_1AD732770);
  sub_1AD731108((uint64_t)v23, (uint64_t)&v5[*(int *)(v10 + 44)]);
  char v11 = sub_1AD73E760();
  if (qword_1EB7383C8 != -1) {
    swift_once();
  }
  sub_1AD73DE60();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  sub_1AD732E40((uint64_t)v5, a1, (uint64_t (*)(void))sub_1AD732740);
  sub_1AD732EA8(0);
  uint64_t v21 = a1 + *(int *)(v20 + 36);
  *(unsigned char *)uint64_t v21 = v11;
  *(void *)(v21 + 8) = v13;
  *(void *)(v21 + 16) = v15;
  *(void *)(v21 + 24) = v17;
  *(void *)(v21 + 32) = v19;
  *(unsigned char *)(v21 + 40) = 0;
  return sub_1AD732EE4((uint64_t)v5, (uint64_t (*)(void))sub_1AD732740);
}

unint64_t sub_1AD73207C()
{
  unint64_t result = qword_1EB7404D0;
  if (!qword_1EB7404D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7404D0);
  }
  return result;
}

unint64_t sub_1AD7320D4()
{
  unint64_t result = qword_1EB740760;
  if (!qword_1EB740760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB740760);
  }
  return result;
}

unint64_t sub_1AD73212C()
{
  unint64_t result = qword_1EB740778;
  if (!qword_1EB740778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB740778);
  }
  return result;
}

unint64_t sub_1AD732184()
{
  unint64_t result = qword_1EB740770;
  if (!qword_1EB740770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB740770);
  }
  return result;
}

uint64_t sub_1AD7321D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AD73E1F0();
  *a1 = result;
  return result;
}

uint64_t sub_1AD732204()
{
  return sub_1AD73E200();
}

uint64_t sub_1AD732230(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x706F546567616D69 && a2 == 0xEF676E6964646150;
  if (v2 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6469576567616D69 && a2 == 0xEA00000000006874 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001AD79A700)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1AD740BC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1AD7323B4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6956726564616568 && a2 == 0xEF6C65646F4D7765;
  if (v2 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001AD77A1B0 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001AD77A1D0 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001AD77A1F0 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001AD777A40 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x676E6964646170 && a2 == 0xE700000000000000 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000001AD79A720 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x80000001AD79A740 || (sub_1AD740BC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001AD79A760)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_1AD740BC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

void sub_1AD732740(uint64_t a1)
{
}

void sub_1AD732770()
{
  if (!qword_1EB738E40)
  {
    unint64_t v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
    sub_1AD7272B4(255, &qword_1EB738E38, (uint64_t (*)(uint64_t))sub_1AD73286C, MEMORY[0x1E4FBB718]);
    sub_1AD7272B4(255, &qword_1EB738FA0, MEMORY[0x1E4F3EE70], v0);
    sub_1AD7272B4(255, &qword_1EB738F08, (uint64_t (*)(uint64_t))sub_1AD73296C, v0);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v2) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EB738E40);
    }
  }
}

void sub_1AD73286C(uint64_t a1)
{
}

void sub_1AD7328B4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1AD73E080();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_1AD732900(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_1AD733118(255, a3, a4, MEMORY[0x1E4FBB718]);
    unint64_t v5 = sub_1AD73E6D0();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1AD73296C()
{
  if (!qword_1EB738F00)
  {
    sub_1AD732A14(255);
    sub_1AD732C48(&qword_1EB738E58, sub_1AD732A14, (void (*)(void))sub_1AD732C00, (void (*)(void))sub_1AD36F81C);
    unint64_t v0 = sub_1AD73EC80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738F00);
    }
  }
}

void sub_1AD732A14(uint64_t a1)
{
}

void sub_1AD732A5C()
{
  if (!qword_1EB738E10)
  {
    sub_1AD732AE8();
    sub_1AD733118(255, &qword_1EB73BEA0, MEMORY[0x1E4F3C870], MEMORY[0x1E4F3DF18]);
    unint64_t v0 = sub_1AD73E080();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738E10);
    }
  }
}

void sub_1AD732AE8()
{
  if (!qword_1EB738DE8)
  {
    sub_1AD732B68();
    sub_1AD732900(255, (unint64_t *)&qword_1EB73BED0, &qword_1EB73BF10, MEMORY[0x1E4F3E1B0]);
    unint64_t v0 = sub_1AD73E080();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738DE8);
    }
  }
}

void sub_1AD732B68()
{
  if (!qword_1EB738D88)
  {
    sub_1AD7328B4(255, &qword_1EB738CB8);
    sub_1AD732900(255, &qword_1EB73BEE0, &qword_1EB73BF30, MEMORY[0x1E4F3EB98]);
    unint64_t v0 = sub_1AD73E080();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738D88);
    }
  }
}

uint64_t sub_1AD732C00()
{
  return sub_1AD732C48(&qword_1EB738E08, (void (*)(uint64_t))sub_1AD732A5C, (void (*)(void))sub_1AD732CD4, (void (*)(void))sub_1AD220800);
}

uint64_t sub_1AD732C48(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1AD732CD4()
{
  unint64_t result = qword_1EB738DE0;
  if (!qword_1EB738DE0)
  {
    sub_1AD732AE8();
    sub_1AD732D9C(&qword_1EB738D80, (void (*)(uint64_t))sub_1AD732B68, (void (*)(void))sub_1AD36E82C);
    sub_1AD1B28D8((unint64_t *)&qword_1EB73BEC8, (unint64_t *)&qword_1EB73BED0, &qword_1EB73BF10, MEMORY[0x1E4F3E1B0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB738DE0);
  }
  return result;
}

uint64_t sub_1AD732D9C(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    sub_1AD1B28D8(&qword_1EB73BED8, &qword_1EB73BEE0, &qword_1EB73BF30, MEMORY[0x1E4F3EB98]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AD732E40(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1AD732EA8(uint64_t a1)
{
}

uint64_t sub_1AD732EE4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1AD732F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a2, a1, v8);
  return a2;
}

uint64_t sub_1AD732FB8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 72)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_1AD733010()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 72);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_1AD733040@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD731B3C(*(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t **)(v1 + 32), a1);
}

uint64_t sub_1AD73304C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD21485C(v2);
  return a1;
}

uint64_t sub_1AD7330C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AD73E1F0();
  *a1 = result;
  return result;
}

uint64_t sub_1AD7330EC()
{
  return sub_1AD73E200();
}

void sub_1AD733118(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1AD733164(uint64_t a1)
{
}

void sub_1AD7331AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_1AD729BF8(255, &qword_1E9A34738, &qword_1E9A34740, (uint64_t (*)(uint64_t))sub_1AD729208, &qword_1E9A347C0);
    uint64_t v7 = v6;
    sub_1AD7297B4(255);
    unint64_t v9 = a3(a1, v7, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

unint64_t sub_1AD733248()
{
  unint64_t result = qword_1E9A34870;
  if (!qword_1E9A34870)
  {
    sub_1AD729BF8(255, &qword_1E9A34738, &qword_1E9A34740, (uint64_t (*)(uint64_t))sub_1AD729208, &qword_1E9A347C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34870);
  }
  return result;
}

uint64_t sub_1AD7332CC(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AD73334C()
{
  return sub_1AD1F8C64(&qword_1E9A34880, (void (*)(uint64_t))sub_1AD7297F0);
}

uint64_t sub_1AD733380(uint64_t a1, uint64_t a2)
{
  sub_1AD7331AC(0, &qword_1E9A34730, MEMORY[0x1E4F3D750]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD733400(uint64_t a1)
{
  sub_1AD7331AC(0, &qword_1E9A34730, MEMORY[0x1E4F3D750]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1AD733478(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*a2)
  {
    sub_1AD7272B4(255, a3, a4, MEMORY[0x1E4F3F108]);
    unint64_t v5 = sub_1AD73DF70();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1AD7334F4(uint64_t a1, uint64_t a2)
{
  sub_1AD729BF8(0, &qword_1E9A34738, &qword_1E9A34740, (uint64_t (*)(uint64_t))sub_1AD729208, &qword_1E9A347C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD733584(uint64_t a1)
{
  sub_1AD729BF8(0, &qword_1E9A34738, &qword_1E9A34740, (uint64_t (*)(uint64_t))sub_1AD729208, &qword_1E9A347C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1AD73360C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_1AD7272B4(255, &qword_1E9A34758, (uint64_t (*)(uint64_t))sub_1AD7292EC, MEMORY[0x1E4F3F108]);
    uint64_t v7 = v6;
    sub_1AD7295F4(255);
    unint64_t v9 = a3(a1, v7, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1AD7336AC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1AD7272B4(255, a2, a3, MEMORY[0x1E4F3F108]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AD733710()
{
  return sub_1AD7332CC(&qword_1E9A348A8, sub_1AD729630, (void (*)(void))sub_1AD73374C);
}

uint64_t sub_1AD73374C()
{
  return sub_1AD1F8C64(&qword_1E9A348B0, (void (*)(uint64_t))sub_1AD72966C);
}

void sub_1AD733788(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*a2)
  {
    sub_1AD7272B4(255, a3, a4, MEMORY[0x1E4F3F108]);
    unint64_t v5 = sub_1AD73DF70();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1AD733804(uint64_t a1, uint64_t a2)
{
  sub_1AD729588(0, &qword_1E9A34798, MEMORY[0x1E4F3CA60], MEMORY[0x1E4F3CA58], MEMORY[0x1E4F3DC28]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD7338A0(uint64_t a1)
{
  sub_1AD729588(0, &qword_1E9A34798, MEMORY[0x1E4F3CA60], MEMORY[0x1E4F3CA58], MEMORY[0x1E4F3DC28]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AD733934()
{
  unint64_t result = qword_1E9A348C0;
  if (!qword_1E9A348C0)
  {
    sub_1AD7294F0();
    sub_1AD7339AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A348C0);
  }
  return result;
}

unint64_t sub_1AD7339AC()
{
  unint64_t result = qword_1E9A348C8;
  if (!qword_1E9A348C8)
  {
    sub_1AD729588(255, &qword_1E9A34798, MEMORY[0x1E4F3CA60], MEMORY[0x1E4F3CA58], MEMORY[0x1E4F3DC28]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A348C8);
  }
  return result;
}

uint64_t sub_1AD733A3C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result != 1)
  {
    swift_retain();
    return sub_1AD21485C(a4);
  }
  return result;
}

uint64_t sub_1AD733A88(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result != 1)
  {
    swift_release();
    return sub_1AD1E4514(a4);
  }
  return result;
}

uint64_t objectdestroy_34Tm()
{
  uint64_t v1 = type metadata accessor for PromptTileView(0);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  swift_release();
  uint64_t v3 = v2 + *(int *)(v1 + 20);
  sub_1AD7272B4(0, qword_1EB740408, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1AD73E030();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = v2 + *(int *)(v1 + 24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(type metadata accessor for PromptTileViewModel(0) + 32);
  uint64_t v7 = sub_1AD73B970();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD733D44(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  sub_1AD7272B4(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

void *sub_1AD733DB4(void *a1)
{
  uint64_t v2 = a1[12];
  uint64_t v3 = a1[13];
  uint64_t v4 = a1[14];
  uint64_t v5 = a1[15];
  uint64_t v7 = a1[24];
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD733A3C(v2, v3, v4, v5);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD21485C(v7);
  return a1;
}

uint64_t sub_1AD733E6C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_1AD7272B4(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void *sub_1AD733EC8(void *a1)
{
  uint64_t v2 = a1[12];
  uint64_t v3 = a1[13];
  uint64_t v4 = a1[14];
  uint64_t v5 = a1[15];
  uint64_t v7 = a1[24];
  swift_bridgeObjectRelease();
  swift_release();
  sub_1AD733A88(v2, v3, v4, v5);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD1E4514(v7);
  return a1;
}

uint64_t sub_1AD733F80()
{
  return sub_1AD7332CC(&qword_1E9A348E0, sub_1AD729B8C, (void (*)(void))sub_1AD733934);
}

uint64_t sub_1AD733FBC()
{
  return sub_1AD7332CC(&qword_1E9A348F0, sub_1AD729A90, (void (*)(void))sub_1AD733FF8);
}

uint64_t sub_1AD733FF8()
{
  return sub_1AD7332CC(&qword_1E9A348F8, sub_1AD729ACC, (void (*)(void))sub_1AD734034);
}

uint64_t sub_1AD734034()
{
  return sub_1AD7332CC(&qword_1E9A34900, sub_1AD729B08, (void (*)(void))sub_1AD733934);
}

uint64_t sub_1AD734074()
{
  uint64_t v1 = type metadata accessor for PromptTileView(0);
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 28)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

void sub_1AD7340E0()
{
  if (!qword_1EB738C78)
  {
    type metadata accessor for DismissibleCellHeaderView(255);
    unint64_t v0 = sub_1AD73DF70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB738C78);
    }
  }
}

uint64_t sub_1AD73414C()
{
  uint64_t v1 = type metadata accessor for PromptTileView(0);
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 32)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

uint64_t sub_1AD7341B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AD734220()
{
  return sub_1AD7332CC(&qword_1EB738D30, sub_1AD732EA8, (void (*)(void))sub_1AD734270);
}

uint64_t sub_1AD734270()
{
  return sub_1AD1F8C64(&qword_1EB738F78, sub_1AD732740);
}

uint64_t sub_1AD7342A4()
{
  return sub_1AD732C48(&qword_1EB738E68, sub_1AD36EB64, (void (*)(void))sub_1AD36EE58, (void (*)(void))sub_1AD36F81C);
}

unint64_t sub_1AD734304()
{
  unint64_t result = qword_1E9A34910;
  if (!qword_1E9A34910)
  {
    sub_1AD7272B4(255, &qword_1E9A34918, (uint64_t (*)(uint64_t))sub_1AD733164, MEMORY[0x1E4FBB718]);
    sub_1AD732C48(&qword_1E9A34920, sub_1AD733164, (void (*)(void))sub_1AD5682E8, (void (*)(void))sub_1AD36F81C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34910);
  }
  return result;
}

uint64_t PDFBody.init(attributedString:renderMethod:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *a2;
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 9) = v3;
  return result;
}

uint64_t sub_1AD7343FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t sub_1AD734424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9 = *(void (**)(long long *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((void *)&v12 + 1) = swift_getObjectType();
    *(void *)&long long v11 = a2;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return sub_1AD1F65C4((uint64_t)&v11);
}

void PDFBody.init(alignment:_:attributes:)(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  uint64_t v5 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1AD2AB12C();
  uint64_t v6 = (void *)sub_1AD73F020();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithString_attributes_, v5, v6);

  *(void *)a2 = v7;
  *(unsigned char *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
}

void PDFRenderable<>.render(context:document:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(char *__return_ptr, uint64_t, uint64_t))(a4 + 16))((char *)&v40 + 1, a3, a4);
  char v8 = BYTE1(v40);
  if (*(unsigned char *)(a2 + 96) == 1)
  {
    BYTE1(v40) ^= 1u;
    if ((v8 & 1) == 0)
    {
LABEL_3:
      type metadata accessor for PDFBuilder.Document();
      swift_initStackObject();
      uint64_t v9 = sub_1AD4B4AFC(a2);
      double v10 = PDFBuilder.Document.drawingContext.getter();
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      swift_retain();
      v41.origin.CGFloat x = v10;
      v41.origin.CGFloat y = v12;
      v41.size.CGFloat width = v14;
      v41.size.CGFloat height = v16;
      double Width = CGRectGetWidth(v41);
      uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 8);
      uint64_t v19 = (void *)v18(a3, a4);
      objc_msgSend(v19, sel_boundingRectWithSize_options_context_, 1, 0, CGRectGetWidth(*(CGRect *)(v9 + 168)), INFINITY);
      CGFloat x = v42.origin.x;
      CGFloat y = v42.origin.y;
      CGFloat v22 = v42.size.width;
      CGFloat height = v42.size.height;
      CGFloat v24 = CGRectGetWidth(v42);
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = v22;
      v43.size.CGFloat height = height;
      CGFloat v25 = ceil(CGRectGetHeight(v43));
      CGFloat v26 = *(double *)(v9 + 168);
      CGFloat v27 = *(double *)(v9 + 176);

      v44.origin.CGFloat x = v26;
      v44.origin.CGFloat y = v27;
      v44.size.CGFloat width = v24;
      v44.size.CGFloat height = v25;
      double v28 = Width - CGRectGetWidth(v44) + -1.0;
      CGFloat v29 = *(double *)(v9 + 168);
      CGFloat v30 = *(double *)(v9 + 176);
      CGFloat v31 = *(double *)(v9 + 184);
      CGFloat v32 = *(double *)(v9 + 192);
      v45.origin.CGFloat x = v29;
      v45.origin.CGFloat y = v30;
      v45.size.CGFloat width = v31;
      v45.size.CGFloat height = v32;
      double v33 = v28 + CGRectGetMinX(v45);
      v46.origin.CGFloat x = v29;
      v46.origin.CGFloat y = v30;
      v46.size.CGFloat width = v31;
      v46.size.CGFloat height = v32;
      CGFloat v34 = CGRectGetMinY(v46) + 0.0;
      v47.origin.CGFloat x = v29;
      v47.origin.CGFloat y = v30;
      v47.size.CGFloat width = v31;
      v47.size.CGFloat height = v32;
      CGFloat v35 = CGRectGetWidth(v47) - v28;
      v48.origin.CGFloat x = v29;
      v48.origin.CGFloat y = v30;
      v48.size.CGFloat width = v31;
      v48.size.CGFloat height = v32;
      CGFloat v36 = CGRectGetHeight(v48);
      *(double *)(v9 + 168) = v33;
      *(CGFloat *)(v9 + 176) = v34;
      *(CGFloat *)(v9 + 184) = v35;
      *(CGFloat *)(v9 + 192) = v36;
      *(unsigned char *)(v9 + 200) = 0;
      char v37 = (void *)v18(a3, a4);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a4 + 24))(&v40, a3, a4);
      char v39 = v40;
      sub_1AD7350C0(a1, v9, a2, &v39);

      swift_release_n();
      return;
    }
  }
  else if (BYTE1(v40))
  {
    goto LABEL_3;
  }
  uint64_t v38 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a4 + 24))(&v40, a3, a4);
  char v39 = v40;
  sub_1AD7350C0(a1, a2, 0, &v39);
}

double PDFRenderable<>.boundingRectForContent(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  v11.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
  objc_msgSend(v4, sel_boundingRectWithSize_options_context_, 1, 0, CGRectGetWidth(v11), INFINITY);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetHeight(v13);
  double v9 = *(double *)(a1 + 168);

  return v9;
}

char *PDFAttributedStrings.init(alignment:lineSplit:items:)@<X0>(char *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char v5 = *a1;
  char v42 = 0;
  char v43 = v5;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_init);
  unint64_t v7 = *(void *)(a3 + 16);
  uint64_t v32 = a3 + 32;
  unint64_t result = (char *)swift_bridgeObjectRetain();
  unint64_t v9 = 0;
  uint64_t v31 = a3;
  CGFloat v30 = v6;
  while (1)
  {
    if (v9 == v7)
    {
      uint64_t v38 = 0;
      long long v36 = 0u;
      long long v37 = 0u;
      unint64_t v9 = v7;
      long long v35 = 0u;
      goto LABEL_7;
    }
    if (v9 >= *(void *)(a3 + 16)) {
      break;
    }
    sub_1AD6EFC00(v32 + 48 * v9, (uint64_t)v34);
    *(void *)&long long v35 = v9;
    sub_1AD326FBC(v34, (long long *)((char *)&v35 + 8));
    ++v9;
LABEL_7:
    sub_1AD735FA4((uint64_t)&v35, (uint64_t)&v39);
    if (!v41)
    {
      unint64_t result = (char *)swift_bridgeObjectRelease_n();
      char v27 = v43;
      char v28 = v42;
      *(void *)a4 = v6;
      *(unsigned char *)(a4 + 8) = v27;
      *(unsigned char *)(a4 + 9) = v28;
      return result;
    }
    uint64_t v10 = v39;
    sub_1AD326FBC(&v40, &v35);
    uint64_t v11 = *((void *)&v36 + 1);
    uint64_t v12 = v37;
    __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
    CGRect v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
    objc_msgSend(v6, sel_appendAttributedString_, v13);

    if (v10 != *(void *)(a3 + 16) - 1 && (a2 & 1) != 0)
    {
      uint64_t v14 = *((void *)&v36 + 1);
      uint64_t v15 = v37;
      __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
      CGFloat v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
      unint64_t result = (char *)objc_msgSend(v16, sel_length);
      uint64_t v17 = result - 1;
      if (__OFSUB__(result, 1)) {
        goto LABEL_14;
      }
      uint64_t v19 = *((void *)&v36 + 1);
      uint64_t v18 = v37;
      __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
      uint64_t v20 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v19, v18);
      id v21 = objc_msgSend(v20, sel_attributesAtIndex_effectiveRange_, v17, 0);

      type metadata accessor for Key(0);
      sub_1AD2AB12C();
      sub_1AD73F030();

      id v22 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
      unint64_t v23 = v7;
      CGFloat v24 = (void *)sub_1AD73F180();
      CGFloat v25 = (void *)sub_1AD73F020();
      id v6 = v30;
      a3 = v31;
      swift_bridgeObjectRelease();
      id v26 = objc_msgSend(v22, sel_initWithString_attributes_, v24, v25);

      unint64_t v7 = v23;
      objc_msgSend(v30, sel_appendAttributedString_, v26);
    }
    unint64_t result = (char *)__swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t NSAttributedString.font.getter()
{
  uint64_t v10 = 0;
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_length);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = result;
    uint64_t v3 = *MEMORY[0x1E4FB06F8];
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = &v10;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_1AD73613C;
    *(void *)(v5 + 24) = v4;
    aBlock[4] = sub_1AD736154;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AD734424;
    aBlock[3] = &block_descriptor_104;
    id v6 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v0, sel_enumerateAttribute_inRange_options_usingBlock_, v3, 0, v2, 0x100000, v6);
    _Block_release(v6);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      uint64_t v8 = v10;
      swift_release();
      return v8;
    }
  }
  __break(1u);
  return result;
}

HealthExperienceUI::PDFTextAlignment __swiftcall PDFTextAlignment.flip()()
{
  *uint64_t v0 = (*v1 & 1) == 0;
  return result;
}

BOOL static PDFTextAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PDFTextAlignment.hash(into:)()
{
  return sub_1AD740D00();
}

void sub_1AD734EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  sub_1AD26F920(a1, (uint64_t)v8);
  if (v9)
  {
    sub_1AD2147D4(0, (unint64_t *)&qword_1EB732800);
    if (swift_dynamicCast())
    {
      id v6 = *a5;
      *a5 = v7;
    }
  }
  else
  {
    sub_1AD1F65C4((uint64_t)v8);
  }
}

double NSAttributedString.boundingRectForContent(in:)(uint64_t a1)
{
  uint64_t v2 = v1;
  v9.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
  objc_msgSend(v2, sel_boundingRectWithSize_options_context_, 1, 0, CGRectGetWidth(v9), INFINITY);
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetHeight(v11);
  return *(double *)(a1 + 168);
}

double NSAttributedString.minimumBoundingRectForContent(in:)(uint64_t a1)
{
  uint64_t v2 = NSAttributedString.font.getter();
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_lineHeight);
  }
  else
  {
    if (qword_1E9A29310 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_1E9A2E540, sel_lineHeight);
  }
  sub_1AD73FD00();
  v5.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
  CGRectGetWidth(v5);
  return *(double *)(a1 + 168);
}

void NSAttributedString.render(context:document:)(void *a1, uint64_t a2)
{
  char v2 = 0;
  sub_1AD7350C0(a1, a2, 0, &v2);
}

void sub_1AD7350C0(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  CFAttributedStringRef v5 = v4;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  LOBYTE(v8) = *a4;
  CFIndex Length = CFAttributedStringGetLength(v4);
  CGRect v10 = NSAttributedString.font.getter();
  if (!v10)
  {
    if (qword_1E9A29310 != -1) {
      goto LABEL_35;
    }
    goto LABEL_4;
  }
  CGRect v11 = v10;
  objc_msgSend(v10, sel_lineHeight);
  double v13 = v12;

LABEL_5:
  sub_1AD73FD00();
  double v16 = v15;
  v86.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
  double Width = CGRectGetWidth(v86);
  if (v16 >= Width) {
    double v18 = Width;
  }
  else {
    double v18 = v16;
  }
  double v19 = ceil(v13);
  CGRect v87 = *(CGRect *)(a2 + 168);
  CGFloat x = v87.origin.x;
  CGFloat y = v87.origin.y;
  if (!CGRectContainsRect(v87, *(CGRect *)(&v18 - 2)))
  {
    uint64_t v22 = *(void *)(a2 + 120);
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_34;
    }
    if (v24 == *(void *)(a2 + 104))
    {
      sub_1AD4B4558(a1);
      if (!a3) {
        goto LABEL_15;
      }
    }
    else
    {
      *(void *)(a2 + 120) = v24;
      sub_1AD4B48A0();
      if (!a3) {
        goto LABEL_15;
      }
    }
    swift_beginAccess();
    uint64_t v25 = *(void *)(a2 + 160);
    swift_beginAccess();
    *(void *)(a3 + 160) = v25;
    *(void *)(a3 + 120) = *(void *)(a2 + 120);
    swift_retain();
    sub_1AD4B48A0();
    swift_release();
  }
LABEL_15:
  if ((v8 & 1) == 0)
  {
    swift_beginAccess();
    CFIndex v46 = 0;
    while (1)
    {
      CGRect v47 = CTFramesetterCreateWithAttributedString(v5);
      fitRange.location = 0;
      fitRange.length = 0;
      v85.location = v46;
      v85.length = 0;
      CGSize v48 = CTFramesetterSuggestFrameSizeWithConstraints(v47, v85, 0, *(CGSize *)(a2 + 184), &fitRange);
      CFIndex v8 = fitRange.length;
      id v49 = -[__CFAttributedString attributedSubstringFromRange:](v5, sel_attributedSubstringFromRange_, fitRange.location, fitRange.length, v48.width, v48.height);
      objc_msgSend(v49, sel_boundingRectWithSize_options_context_, 1, 0, CGRectGetWidth(*(CGRect *)(a2 + 168)), INFINITY);
      CGFloat v50 = v96.origin.x;
      CGFloat v51 = v96.origin.y;
      CGFloat v52 = v96.size.width;
      CGFloat height = v96.size.height;
      double v54 = CGRectGetWidth(v96);
      v97.origin.CGFloat x = v50;
      v97.origin.CGFloat y = v51;
      v97.size.CGFloat width = v52;
      v97.size.CGFloat height = height;
      CGFloat v55 = ceil(CGRectGetHeight(v97));
      double v56 = *(double *)(a2 + 168);
      double v57 = *(double *)(a2 + 176);
      objc_msgSend(v49, sel_drawInRect_, v56, v57, v54, v55);
      CGFloat v79 = v56;
      CGFloat v80 = v55;
      v98.origin.CGFloat x = v56;
      v98.origin.CGFloat y = v57;
      CGFloat rect = v54;
      v98.size.CGFloat width = v54;
      v98.size.CGFloat height = v55;
      double v58 = CGRectGetHeight(v98);
      CGFloat v59 = *(double *)(a2 + 168);
      CGFloat v60 = *(double *)(a2 + 176);
      CGFloat v62 = *(double *)(a2 + 184);
      CGFloat v61 = *(double *)(a2 + 192);
      v99.origin.CGFloat x = v59;
      v99.origin.CGFloat y = v60;
      v99.size.CGFloat width = v62;
      v99.size.CGFloat height = v61;
      CGFloat v82 = CGRectGetMinX(v99) + 0.0;
      v100.origin.CGFloat x = v59;
      v100.origin.CGFloat y = v60;
      v100.size.CGFloat width = v62;
      v100.size.CGFloat height = v61;
      double v63 = v58 + CGRectGetMinY(v100);
      v101.origin.CGFloat x = v59;
      v101.origin.CGFloat y = v60;
      v101.size.CGFloat width = v62;
      v101.size.CGFloat height = v61;
      CGFloat v64 = CGRectGetWidth(v101);
      v102.origin.CGFloat x = v59;
      v102.origin.CGFloat y = v60;
      v102.size.CGFloat width = v62;
      v102.size.CGFloat height = v61;
      CGFloat v65 = CGRectGetHeight(v102);
      *(CGFloat *)(a2 + 168) = v82;
      *(double *)(a2 + 176) = v63;
      *(CGFloat *)(a2 + 184) = v64;
      *(CGFloat *)(a2 + 192) = v65 - v58;
      *(unsigned char *)(a2 + 200) = 0;
      if (a3)
      {
        v103.origin.CGFloat x = v79;
        v103.size.CGFloat height = v80;
        v103.origin.CGFloat y = v57;
        v103.size.CGFloat width = rect;
        double v66 = CGRectGetHeight(v103);
        v104.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
        CGFloat v67 = v104.origin.x;
        CGFloat v68 = v104.origin.y;
        CGFloat v69 = v104.size.width;
        CGFloat v70 = v104.size.height;
        CGFloat v71 = CGRectGetMinX(v104) + 0.0;
        v105.origin.CGFloat x = v67;
        v105.origin.CGFloat y = v68;
        v105.size.CGFloat width = v69;
        v105.size.CGFloat height = v70;
        double v72 = v66 + CGRectGetMinY(v105);
        v106.origin.CGFloat x = v67;
        v106.origin.CGFloat y = v68;
        v106.size.CGFloat width = v69;
        v106.size.CGFloat height = v70;
        CGFloat v73 = CGRectGetWidth(v106);
        v107.origin.CGFloat x = v67;
        v107.origin.CGFloat y = v68;
        v107.size.CGFloat width = v69;
        v107.size.CGFloat height = v70;
        CGFloat v74 = CGRectGetHeight(v107);
        *(CGFloat *)(a3 + 168) = v71;
        *(double *)(a3 + 176) = v72;
        *(CGFloat *)(a3 + 184) = v73;
        *(CGFloat *)(a3 + 192) = v74 - v66;
        *(unsigned char *)(a3 + 200) = 0;
      }
      BOOL v23 = __OFADD__(v46, v8);
      v46 += v8;
      if (v23)
      {
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        swift_once();
LABEL_4:
        objc_msgSend((id)qword_1E9A2E540, sel_lineHeight);
        double v13 = v14;
        goto LABEL_5;
      }
      if (v46 == Length)
      {

        return;
      }
      uint64_t v75 = *(void *)(a2 + 120);
      BOOL v23 = __OFADD__(v75, 1);
      uint64_t v76 = v75 + 1;
      if (v23) {
        goto LABEL_33;
      }
      if (v76 != *(void *)(a2 + 104)) {
        break;
      }
      sub_1AD4B4558(a1);
      if (a3) {
        goto LABEL_29;
      }
LABEL_19:
    }
    *(void *)(a2 + 120) = v76;
    sub_1AD4B48A0();
    if (!a3) {
      goto LABEL_19;
    }
LABEL_29:
    uint64_t v77 = *(void *)(a2 + 160);
    swift_beginAccess();
    *(void *)(a3 + 160) = v77;
    *(void *)(a3 + 120) = *(void *)(a2 + 120);
    swift_retain();
    sub_1AD4B48A0();
    swift_release();
    goto LABEL_19;
  }
  -[__CFAttributedString drawAtPoint:](v5, sel_drawAtPoint_, *(double *)(a2 + 168), *(double *)(a2 + 176));
  [(__CFAttributedString *)v5 size];
  double v27 = v26;
  CGFloat v28 = *(double *)(a2 + 168);
  CGFloat v29 = *(double *)(a2 + 176);
  CGFloat v30 = *(double *)(a2 + 184);
  CGFloat v31 = *(double *)(a2 + 192);
  v88.origin.CGFloat x = v28;
  v88.origin.CGFloat y = v29;
  v88.size.CGFloat width = v30;
  v88.size.CGFloat height = v31;
  CGFloat v32 = CGRectGetMinX(v88) + 0.0;
  v89.origin.CGFloat x = v28;
  v89.origin.CGFloat y = v29;
  v89.size.CGFloat width = v30;
  v89.size.CGFloat height = v31;
  double v33 = v27 + CGRectGetMinY(v89);
  v90.origin.CGFloat x = v28;
  v90.origin.CGFloat y = v29;
  v90.size.CGFloat width = v30;
  v90.size.CGFloat height = v31;
  CGFloat v34 = CGRectGetWidth(v90);
  v91.origin.CGFloat x = v28;
  v91.origin.CGFloat y = v29;
  v91.size.CGFloat width = v30;
  v91.size.CGFloat height = v31;
  CGFloat v35 = CGRectGetHeight(v91);
  *(CGFloat *)(a2 + 168) = v32;
  *(double *)(a2 + 176) = v33;
  *(CGFloat *)(a2 + 184) = v34;
  *(CGFloat *)(a2 + 192) = v35 - v27;
  *(unsigned char *)(a2 + 200) = 0;
  if (a3)
  {
    [(__CFAttributedString *)v5 size];
    double v37 = v36;
    v92.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
    CGFloat v38 = v92.origin.x;
    CGFloat v39 = v92.origin.y;
    CGFloat v40 = v92.size.width;
    CGFloat v41 = v92.size.height;
    CGFloat v42 = CGRectGetMinX(v92) + 0.0;
    v93.origin.CGFloat x = v38;
    v93.origin.CGFloat y = v39;
    v93.size.CGFloat width = v40;
    v93.size.CGFloat height = v41;
    double v43 = v37 + CGRectGetMinY(v93);
    v94.origin.CGFloat x = v38;
    v94.origin.CGFloat y = v39;
    v94.size.CGFloat width = v40;
    v94.size.CGFloat height = v41;
    CGFloat v44 = CGRectGetWidth(v94);
    v95.origin.CGFloat x = v38;
    v95.origin.CGFloat y = v39;
    v95.size.CGFloat width = v40;
    v95.size.CGFloat height = v41;
    CGFloat v45 = CGRectGetHeight(v95);
    *(CGFloat *)(a3 + 168) = v42;
    *(double *)(a3 + 176) = v43;
    *(CGFloat *)(a3 + 184) = v44;
    *(CGFloat *)(a3 + 192) = v45 - v37;
    *(unsigned char *)(a3 + 200) = 0;
  }
}

void sub_1AD7356A0(void *a1, uint64_t a2)
{
  char v2 = 0;
  sub_1AD7350C0(a1, a2, 0, &v2);
}

double sub_1AD7356D8(uint64_t a1)
{
  uint64_t v3 = *v1;
  v9.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
  objc_msgSend(v3, sel_boundingRectWithSize_options_context_, 1, 0, CGRectGetWidth(v9), INFINITY);
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetHeight(v11);
  return *(double *)(a1 + 168);
}

double sub_1AD735780(uint64_t a1)
{
  return NSAttributedString.minimumBoundingRectForContent(in:)(a1);
}

double sub_1AD7357A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFAttributedStringRef v4 = NSAttributedString.font.getter();
  if (v4)
  {
    CFAttributedStringRef v5 = v4;
    objc_msgSend(v4, sel_lineHeight);
  }
  else
  {
    if (qword_1E9A29310 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_1E9A2E540, sel_lineHeight);
  }
  sub_1AD73FD00();
  v8.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
  CGRectGetWidth(v8);
  double v6 = *(double *)(a1 + 168);

  return v6;
}

double PDFRenderable<>.minimumBoundingRectForContent(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFAttributedStringRef v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  CFAttributedStringRef v5 = NSAttributedString.font.getter();
  if (v5)
  {
    double v6 = v5;
    objc_msgSend(v5, sel_lineHeight);
  }
  else
  {
    if (qword_1E9A29310 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_1E9A2E540, sel_lineHeight);
  }
  sub_1AD73FD00();
  v9.origin.CGFloat x = PDFBuilder.Document.drawingContext.getter();
  CGRectGetWidth(v9);
  double v7 = *(double *)(a1 + 168);

  return v7;
}

uint64_t (*PDFAttributedStrings.attributedString.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFAttributedStrings.alignment.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFAttributedStrings.renderMethod.modify())(void, void)
{
  return nullsub_1;
}

char *PDFAttributedStrings.init(alignment:lineSplit:_:)@<X0>(char *a1@<X0>, char a2@<W1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  char v10 = *a1;
  uint64_t v6 = a3();
  HealthExperienceUI::PDFTextAlignment result = PDFAttributedStrings.init(alignment:lineSplit:items:)(&v10, a2, v6, (uint64_t)&v11);
  char v8 = v12;
  char v9 = v13;
  *(void *)a4 = v11;
  *(unsigned char *)(a4 + 8) = v8;
  *(unsigned char *)(a4 + 9) = v9;
  return result;
}

uint64_t sub_1AD735A70(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(v2 + 9)) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  return sub_1AD5B3B70(a1, a2, *(void *)v2, v3 | *(unsigned __int8 *)(v2 + 8));
}

uint64_t (*PDFText.attributedString.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFText.alignment.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFText.renderMethod.modify())(void, void)
{
  return nullsub_1;
}

void _s18HealthExperienceUI8PDFTitleV_9alignment10attributesACSS_AA16PDFTextAlignmentOSDySo21NSAttributedStringKeyaypGtcfC_0(char *a1@<X2>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  CFAttributedStringRef v5 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1AD2AB12C();
  uint64_t v6 = (void *)sub_1AD73F020();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithString_attributes_, v5, v6);

  *(void *)a2 = v7;
  *(unsigned char *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
}

double sub_1AD735BCC(uint64_t a1)
{
  return sub_1AD7357A4(a1, *v1);
}

uint64_t (*PDFTitle.attributedString.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFTitle.alignment.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFTitle.renderMethod.modify())(void, void)
{
  return nullsub_1;
}

id PDFCaption.attributedString.getter()
{
  return *v0;
}

void PDFCaption.attributedString.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*PDFCaption.attributedString.modify())(void, void)
{
  return nullsub_1;
}

void PDFCaption.alignment.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

unsigned char *PDFCaption.alignment.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 8) = *result;
  return result;
}

uint64_t (*PDFCaption.alignment.modify())(void, void)
{
  return nullsub_1;
}

void PDFCaption.renderMethod.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 9);
}

unsigned char *PDFCaption.renderMethod.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 9) = *result;
  return result;
}

uint64_t (*PDFCaption.renderMethod.modify())(void, void)
{
  return nullsub_1;
}

void sub_1AD735D24(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 9);
}

uint64_t (*PDFArticleTitle.attributedString.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFArticleTitle.alignment.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFArticleTitle.renderMethod.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFBody.attributedString.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFBody.alignment.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFBody.renderMethod.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFBodyList.attributedString.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFBodyList.alignment.modify())(void, void)
{
  return nullsub_1;
}

uint64_t (*PDFBodyList.renderMethod.modify())(void, void)
{
  return nullsub_1;
}

uint64_t PDFBodyList.init(_:alignment:attributes:boldAttributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v6 = *a3;
  sub_1AD73617C(a1, a2, a4);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a5 = v8;
  *(unsigned char *)(a5 + 8) = v6;
  *(unsigned char *)(a5 + 9) = 0;
  return result;
}

double sub_1AD735EC4(uint64_t a1)
{
  char v3 = *v1;
  double v4 = PDFBuilder.Document.drawingContext.getter();
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = v3;
  v18.origin.CGFloat x = v4;
  v18.origin.CGFloat y = v6;
  v18.size.CGFloat width = v8;
  v18.size.CGFloat height = v10;
  objc_msgSend(v11, sel_boundingRectWithSize_options_context_, 1, 0, CGRectGetWidth(v18), INFINITY);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRectGetHeight(v20);
  double v16 = *(double *)(a1 + 168);

  return v16;
}

uint64_t sub_1AD735FA4(uint64_t a1, uint64_t a2)
{
  sub_1AD736008();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1AD736008()
{
  if (!qword_1E9A34928)
  {
    sub_1AD736060();
    unint64_t v0 = sub_1AD740340();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A34928);
    }
  }
}

void sub_1AD736060()
{
  if (!qword_1E9A34930)
  {
    sub_1AD7360CC();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A34930);
    }
  }
}

unint64_t sub_1AD7360CC()
{
  unint64_t result = qword_1E9A34938;
  if (!qword_1E9A34938)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A34938);
  }
  return result;
}

uint64_t sub_1AD73612C()
{
  return swift_deallocObject();
}

void sub_1AD73613C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1AD734EA4(a1, a2, a3, a4, *(void ***)(v4 + 16));
}

uint64_t sub_1AD736144()
{
  return swift_deallocObject();
}

uint64_t sub_1AD736154()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1AD73617C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v83 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_init);
  *(void *)&long long v87 = a1;
  *((void *)&v87 + 1) = a2;
  unint64_t v6 = sub_1AD20F9FC();
  uint64_t v7 = MEMORY[0x1B3E667B0](10, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x1E4FBB1A0], v6);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 + 16);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v77 = 0;
    unint64_t v79 = 0xE000000000000000;
LABEL_32:
    CGFloat v62 = (void *)*MEMORY[0x1E4FB0738];
    if (*(void *)(a3 + 16))
    {
      id v63 = v62;
      unint64_t v64 = sub_1AD1F65C0((uint64_t)v63);
      if (v65)
      {
        sub_1AD1F63A8(*(void *)(a3 + 56) + 32 * v64, (uint64_t)&v87);
      }
      else
      {
        long long v87 = 0u;
        long long v88 = 0u;
      }
      unint64_t v66 = v79;

      if (*((void *)&v88 + 1))
      {
        sub_1AD2147D4(0, &qword_1EB7327F0);
        if (swift_dynamicCast())
        {
          id v67 = *(id *)&v86[0];
LABEL_42:
          *(void *)&long long v87 = v77;
          *((void *)&v87 + 1) = v66;
          sub_1AD73F300();
          CGFloat v68 = (void *)sub_1AD73F180();
          swift_bridgeObjectRelease();
          type metadata accessor for Key(0);
          sub_1AD2AB12C();
          CGFloat v69 = (void *)sub_1AD73F020();
          objc_msgSend(v68, sel_sizeWithAttributes_, v69);
          double v71 = v70;

          objc_msgSend(v67, sel_setFirstLineHeadIndent_, 0.0);
          objc_msgSend(v67, sel_setHeadIndent_, v71);
          sub_1AD257F70(MEMORY[0x1E4FBC860]);
          *((void *)&v88 + 1) = sub_1AD2147D4(0, &qword_1EB7327F0);
          *(void *)&long long v87 = v67;
          sub_1AD1F5614(&v87, v86);
          id v72 = v62;
          id v73 = v67;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          sub_1AD26FEC4(v86, v72, isUniquelyReferenced_nonNull_native);

          swift_bridgeObjectRelease();
          uint64_t v75 = (void *)sub_1AD73F020();
          swift_bridgeObjectRelease();
          objc_msgSend(v83, sel_addAttributes_range_, v75, 0, objc_msgSend(v83, sel_length));

          return;
        }
LABEL_41:
        id v67 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
        goto LABEL_42;
      }
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
      unint64_t v66 = v79;
    }
    sub_1AD1F65C4((uint64_t)&v87);
    goto LABEL_41;
  }
  uint64_t v80 = v9 - 1;
  uint64_t v82 = v7 + 32;
  swift_bridgeObjectRetain();
  uint64_t v76 = a3;
  uint64_t v77 = 0;
  unint64_t v10 = 0;
  uint64_t v78 = v8;
  unint64_t v79 = 0xE000000000000000;
  uint64_t v81 = v9;
  while (v10 < *(void *)(v8 + 16))
  {
    double v15 = (uint64_t *)(v82 + 32 * v10);
    uint64_t v16 = *v15;
    unint64_t v17 = v15[1];
    uint64_t v18 = v15[2];
    uint64_t v19 = v15[3];
    unint64_t v20 = (unint64_t)*v15 >> 14;
    swift_bridgeObjectRetain();
    unint64_t v85 = v20;
    if (v20 == v17 >> 14) {
      goto LABEL_7;
    }
    unint64_t v84 = v17 >> 14;
    if (sub_1AD740380() == 32 && v28 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    char v30 = sub_1AD740BC0();
    swift_bridgeObjectRelease();
    if (v30) {
      goto LABEL_16;
    }
    unint64_t v58 = (unint64_t)sub_1AD740370() >> 14;
    if (v58 == v84)
    {
LABEL_7:
      if (v10 != v80)
      {
        *(void *)&long long v87 = 10;
        *((void *)&v87 + 1) = 0xE100000000000000;
        swift_bridgeObjectRetain();
        uint64_t v21 = MEMORY[0x1B3E655A0](v16, v17, v18, v19);
        uint64_t v23 = v22;
        swift_bridgeObjectRelease();
        *(void *)&v86[0] = v21;
        *((void *)&v86[0] + 1) = v23;
        sub_1AD73F2F0();
        uint64_t v16 = MEMORY[0x1B3E666C0](v21, v23);
        unint64_t v17 = v24;
        uint64_t v18 = v25;
        uint64_t v27 = v26;
        swift_bridgeObjectRelease();
        uint64_t v19 = v27;
      }
      MEMORY[0x1B3E655A0](v16, v17, v18, v19);
      swift_bridgeObjectRelease();
      id v11 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
      swift_bridgeObjectRetain();
      char v12 = (void *)sub_1AD73F180();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_1AD2AB12C();
      char v13 = (void *)sub_1AD73F020();
      swift_bridgeObjectRelease();
      id v14 = objc_msgSend(v11, sel_initWithString_attributes_, v12, v13);

      objc_msgSend(v83, sel_appendAttributedString_, v14);
      goto LABEL_4;
    }
    while (sub_1AD740380() != 32 || v59 != 0xE100000000000000)
    {
      char v60 = sub_1AD740BC0();
      swift_bridgeObjectRelease();
      if (v60) {
        goto LABEL_28;
      }
      unint64_t v58 = (unint64_t)sub_1AD740370() >> 14;
      uint64_t v8 = v78;
      if (v58 == v84) {
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
LABEL_28:
    swift_bridgeObjectRelease();
    BOOL v61 = v58 >= v85;
    unint64_t v85 = v58;
    if (!v61)
    {
      __break(1u);
LABEL_30:
      swift_bridgeObjectRelease_n();
      goto LABEL_32;
    }
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_1AD7403A0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    uint64_t v38 = MEMORY[0x1B3E655A0](v31, v33, v35, v37);
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    if (v84 < v85) {
      goto LABEL_44;
    }
    uint64_t v41 = sub_1AD7403A0();
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v48 = MEMORY[0x1B3E655A0](v41, v43, v45, v47);
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    id v51 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v77 = v38;
    CGFloat v52 = (void *)sub_1AD73F180();
    unint64_t v79 = v40;
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1AD2AB12C();
    uint64_t v53 = (void *)sub_1AD73F020();
    swift_bridgeObjectRelease();
    id v54 = objc_msgSend(v51, sel_initWithString_attributes_, v52, v53);

    if (v10 != v80)
    {
      *(void *)&long long v87 = v48;
      *((void *)&v87 + 1) = v50;
      swift_bridgeObjectRetain();
      sub_1AD73F300();
      swift_bridgeObjectRelease();
    }
    a3 = v76;
    id v55 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    swift_bridgeObjectRetain();
    double v56 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
    double v57 = (void *)sub_1AD73F020();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v55, sel_initWithString_attributes_, v56, v57);

    objc_msgSend(v83, sel_appendAttributedString_, v54);
    objc_msgSend(v83, sel_appendAttributedString_, v14);

    uint64_t v8 = v78;
LABEL_4:
    ++v10;

    if (v10 == v81) {
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_44:
  __break(1u);
}

unint64_t sub_1AD736A14()
{
  unint64_t result = qword_1E9A34940;
  if (!qword_1E9A34940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34940);
  }
  return result;
}

unint64_t sub_1AD736A6C()
{
  unint64_t result = qword_1E9A34948;
  if (!qword_1E9A34948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A34948);
  }
  return result;
}

ValueMetadata *type metadata accessor for PDFTextAlignment()
{
  return &type metadata for PDFTextAlignment;
}

uint64_t dispatch thunk of AttributedStringRepresentable.attributedString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AttributedStringRepresentable.alignment.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AttributedStringRepresentable.renderMethod.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

unsigned char *_s18HealthExperienceUI16PDFTextAlignmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AD736BDCLL);
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

ValueMetadata *type metadata accessor for NSAttributedString.RenderMethod()
{
  return &type metadata for NSAttributedString.RenderMethod;
}

ValueMetadata *type metadata accessor for PDFAttributedStrings()
{
  return &type metadata for PDFAttributedStrings;
}

ValueMetadata *type metadata accessor for PDFText()
{
  return &type metadata for PDFText;
}

ValueMetadata *type metadata accessor for PDFTitle()
{
  return &type metadata for PDFTitle;
}

uint64_t initializeBufferWithCopyOfBuffer for PDFCaption(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  id v4 = v3;
  return a1;
}

ValueMetadata *type metadata accessor for PDFCaption()
{
  return &type metadata for PDFCaption;
}

ValueMetadata *type metadata accessor for PDFArticleTitle()
{
  return &type metadata for PDFArticleTitle;
}

ValueMetadata *type metadata accessor for PDFBody()
{
  return &type metadata for PDFBody;
}

uint64_t _s18HealthExperienceUI10PDFCaptionVwca_0(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t _s18HealthExperienceUI10PDFCaptionVwta_0(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

ValueMetadata *type metadata accessor for PDFBodyList()
{
  return &type metadata for PDFBodyList;
}

uint64_t sub_1AD736E18(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v20 = MEMORY[0x1E4FBC860];
    sub_1AD2F548C(0, v1, 0);
    uint64_t v2 = v20;
    id v4 = (unsigned char *)(a1 + 104);
    do
    {
      uint64_t v5 = *((void *)v4 - 7);
      uint64_t v6 = *((void *)v4 - 6);
      uint64_t v7 = *((void *)v4 - 5);
      long long v16 = *((_OWORD *)v4 - 2);
      uint64_t v8 = *((void *)v4 - 1);
      uint64_t v14 = *((void *)v4 - 2);
      uint64_t v15 = *((void *)v4 - 8);
      char v13 = *v4;
      unint64_t v9 = *(void *)(v2 + 16);
      unint64_t v10 = *(void *)(v2 + 24);
      uint64_t v20 = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_retain();
      if (v9 >= v10 >> 1)
      {
        sub_1AD2F548C(v10 > 1, v9 + 1, 1);
        uint64_t v2 = v20;
      }
      uint64_t v18 = &type metadata for EmbeddedDataSourceCollectionViewCell.Item;
      unint64_t v19 = sub_1AD7392F8();
      uint64_t v11 = swift_allocObject();
      *(void *)&long long v17 = v11;
      *(void *)(v11 + 16) = v15;
      *(void *)(v11 + 24) = v5;
      *(void *)(v11 + 32) = v6;
      *(void *)(v11 + 40) = v7;
      *(_OWORD *)(v11 + 48) = v16;
      *(void *)(v11 + 64) = v14;
      *(void *)(v11 + 72) = v8;
      *(unsigned char *)(v11 + 80) = v13;
      *(void *)(v2 + 16) = v9 + 1;
      sub_1AD20FE90(&v17, v2 + 40 * v9 + 32);
      v4 += 80;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1AD736F8C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for MultiColumnDataSource.LayoutEngine();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0x4072C00000000000;
  swift_unknownObjectWeakAssign();
  v8[3] = v3;
  void v8[4] = &protocol witness table for MultiColumnDataSource.LayoutEngine;
  v8[0] = v4;
  uint64_t v5 = *(uint64_t (**)(uint64_t, void *))(v1 + 664);
  swift_retain();
  uint64_t v6 = v5(a1, v8);
  *(void *)(v4 + 24) = &protocol witness table for MultiColumnDataSource;
  swift_unknownObjectWeakAssign();
  swift_release();
  return v6;
}

uint64_t MultiColumnDataSource.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for MultiColumnDataSource.LayoutEngine();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0x4072C00000000000;
  swift_unknownObjectWeakAssign();
  v8[3] = v3;
  void v8[4] = &protocol witness table for MultiColumnDataSource.LayoutEngine;
  v8[0] = v4;
  uint64_t v5 = *(uint64_t (**)(uint64_t, void *))(v1 + 656);
  swift_retain();
  uint64_t v6 = v5(a1, v8);
  *(void *)(v4 + 24) = &protocol witness table for MultiColumnDataSource;
  swift_unknownObjectWeakAssign();
  swift_release();
  return v6;
}

uint64_t sub_1AD737134(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  id v2 = objc_msgSend((id)swift_unknownObjectRetain(), sel_traitCollection);
  id v3 = objc_msgSend(v2, sel_preferredContentSizeCategory);
  swift_unknownObjectRelease();

  id v4 = objc_msgSend(self, sel_accessibilitySizeThresholdForAdjustedLayout);
  char v5 = sub_1AD73FE60();

  id v6 = objc_msgSend(v1, sel_traitCollection);
  uint64_t v7 = sub_1AD73FCB0();

  if ((v5 & 1) != 0 || v7 == 2)
  {

    return 1;
  }
  else if (v7 == 1)
  {
  }
  else
  {
    MEMORY[0x1F4188790](v8);
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = sub_1AD738864(v9, (uint64_t (*)(uint64_t, void *))sub_1AD73939C);
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_1AD736E18(v10);
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v11 + 16);

    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1AD7372E0()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_1AD738864(v0, (uint64_t (*)(uint64_t, void *))sub_1AD738398);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1AD736E18(v1);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1AD737384(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  sub_1AD1FFE38(a2, (uint64_t)v6);
  uint64_t v4 = sub_1AD738A38(a1, (uint64_t)v6);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v4;
}

uint64_t sub_1AD7373FC(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  sub_1AD1FFE38(a2, (uint64_t)v6);
  uint64_t v4 = sub_1AD737D14(a1, (uint64_t)v6);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v4;
}

uint64_t MultiColumnDataSource.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1AD7376CC();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v5 = *v4;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 48);
      swift_unknownObjectRetain();
      uint64_t v8 = (void *)v7(ObjectType, v5);
      objc_msgSend(v8, sel_unregisterObserver_, v0);
      swift_unknownObjectRelease();

      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  uint64_t v9 = v0 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_snapshot;
  sub_1AD20E2C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v1 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_layoutProvider);
  return v1;
}

uint64_t sub_1AD737610()
{
  MultiColumnDataSource.deinit();
  return swift_deallocClassInstance();
}

void MultiColumnDataSource.__allocating_init(arrangedSections:collapseEmptySections:layoutConstructor:)()
{
}

void MultiColumnDataSource.__allocating_init(arrangedSections:collapseEmptySections:layoutSectionProvider:)()
{
}

void sub_1AD7376A0()
{
}

uint64_t sub_1AD7376CC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_columnItems);
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1AD21E7A8(0, v2, 0);
    uint64_t v4 = 64;
    uint64_t v3 = v9;
    do
    {
      unint64_t v5 = *(void *)(v9 + 16);
      unint64_t v6 = *(void *)(v9 + 24);
      long long v8 = *(_OWORD *)(v1 + v4);
      swift_unknownObjectRetain();
      if (v5 >= v6 >> 1) {
        sub_1AD21E7A8(v6 > 1, v5 + 1, 1);
      }
      *(void *)(v9 + 16) = v5 + 1;
      *(_OWORD *)(v9 + 16 * v5 + 32) = v8;
      v4 += 72;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t sub_1AD7377BC()
{
  uint64_t v1 = v0;
  sub_1AD20E2C8();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v1 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_layoutProvider;
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1AD738864(v7, (uint64_t (*)(uint64_t, void *))sub_1AD73939C);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1AD736E18(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v9 + 16);
  uint64_t v11 = v1 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_snapshot;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  uint64_t v12 = sub_1AD73D260();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v34 = v10;
    uint64_t v35 = v9;
    uint64_t v14 = (uint64_t *)(v1 + OBJC_IVAR____TtC18HealthExperienceUI22MutableArrayDataSource_sections);
    uint64_t v36 = v1;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_beginAccess();
    uint64_t v33 = v12;
    uint64_t v15 = (uint64_t *)(v12 + 40);
    long long v16 = (void *)MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v17 = *v14;
      if (*(void *)(*v14 + 16))
      {
        uint64_t v18 = *(v15 - 1);
        uint64_t v19 = *v15;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        unint64_t v20 = sub_1AD20F694(v18, v19);
        if (v21)
        {
          uint64_t v22 = *(void *)(v17 + 56) + 48 * v20;
          uint64_t v24 = *(void *)v22;
          uint64_t v23 = *(void *)(v22 + 8);
          long long v37 = *(_OWORD *)(v22 + 16);
          uint64_t v25 = *(void *)(v22 + 32);
          uint64_t v26 = *(void *)(v22 + 40);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v16 = sub_1AD1FDAC8(0, v16[2] + 1, 1, v16);
          }
          unint64_t v28 = v16[2];
          unint64_t v27 = v16[3];
          if (v28 >= v27 >> 1) {
            long long v16 = sub_1AD1FDAC8((void *)(v27 > 1), v28 + 1, 1, v16);
          }
          void v16[2] = v28 + 1;
          CGFloat v29 = &v16[6 * v28];
          v29[4] = v24;
          v29[5] = v23;
          *((_OWORD *)v29 + 3) = v37;
          v29[8] = v25;
          v29[9] = v26;
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
        }
      }
      v15 += 2;
      --v13;
    }
    while (v13);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v10 = v34;
    uint64_t v9 = v35;
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRelease();
  if (v16[2])
  {
    uint64_t v30 = v16[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void *)(v30 + 16);
    swift_bridgeObjectRelease();
    if (v10 == v31) {
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1AD1BBA28(0, v9, 1);
  return swift_bridgeObjectRelease();
}

void sub_1AD737B80()
{
}

uint64_t MultiColumnDataSource.LayoutEngine.__allocating_init(columnDelegate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = 0x4072C00000000000;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t type metadata accessor for MultiColumnDataSource.LayoutEngine()
{
  return self;
}

uint64_t MultiColumnDataSource.__allocating_init(_:layoutProvider:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  uint64_t v4 = sub_1AD738A38(a1, a2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t MultiColumnDataSource.init(_:layoutProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1AD738A38(a1, a2);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1AD737CC8(uint64_t a1, uint64_t a2)
{
  return sub_1AD737D14(a1, a2);
}

uint64_t sub_1AD737D14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1AD73A670();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_childDataSourcesChangesSink) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_columnItems) = a1;
  sub_1AD1FFE38(a2, v3 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_layoutProvider);
  sub_1AD275004();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AD74C370;
  uint64_t v34 = a2;
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_1AD738864(v11, (uint64_t (*)(uint64_t, void *))sub_1AD73939C);
  uint64_t v13 = sub_1AD736E18(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD73A660();
  uint64_t v14 = sub_1AD73A620();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1AD1FBD54(MEMORY[0x1E4FBC860]);
  uint64_t v17 = swift_bridgeObjectRetain();
  uint64_t v18 = Array<A>.identifierToIndexDict()(v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0;
  *(void *)(inited + 48) = v13;
  *(void *)(inited + 56) = v18;
  *(void *)(inited + 64) = v14;
  *(void *)(inited + 72) = v16;
  sub_1AD1FFE38(a2, (uint64_t)v35);
  uint64_t v19 = swift_allocObject();
  sub_1AD20FE90(v35, v19 + 16);
  unint64_t v20 = (uint64_t (**)(long long *))(v3
                                            + OBJC_IVAR____TtC18HealthExperienceUI32MutableArrayDataSourceWithLayout_layoutSectionProvider);
  void *v20 = sub_1AD73926C;
  v20[1] = (uint64_t (*)(long long *))v19;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC18HealthExperienceUI32MutableArrayDataSourceWithLayout_collapseEmptySections) = 1;
  swift_retain();
  uint64_t v21 = sub_1AD1FBF24();
  uint64_t v23 = MutableArrayDataSource.init(arrangedSections:identifier:)(inited, v21, v22);
  swift_release();
  swift_retain();
  uint64_t v24 = sub_1AD7376CC();
  uint64_t v25 = *(void *)(v24 + 16);
  if (v25)
  {
    uint64_t v33 = a2;
    swift_bridgeObjectRetain();
    uint64_t v26 = (uint64_t *)(v24 + 40);
    do
    {
      uint64_t v27 = *v26;
      uint64_t ObjectType = swift_getObjectType();
      CGFloat v29 = *(uint64_t (**)(uint64_t, uint64_t))(v27 + 48);
      swift_unknownObjectRetain();
      uint64_t v30 = (void *)v29(ObjectType, v27);
      objc_msgSend(v30, sel_registerObserver_, v23);
      swift_unknownObjectRelease();

      v26 += 2;
      --v25;
    }
    while (v25);
    swift_release();
    swift_bridgeObjectRelease();
    a2 = v33;
  }
  else
  {
    swift_release();
  }
  __swift_destroy_boxed_opaque_existential_1(a2);
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_1AD738064(long long *a1, void *a2)
{
  long long v6 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = a2[3];
  uint64_t v4 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v3);
  long long v7 = v6;
  uint64_t v8 = v2;
  return (*(uint64_t (**)(long long *, uint64_t, uint64_t))(v4 + 8))(&v7, v3, v4);
}

uint64_t sub_1AD7380EC()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_layoutProvider;
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t MultiColumnDataSource.__deallocating_deinit()
{
  MultiColumnDataSource.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1AD738294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 40);
  uint64_t ObjectType = swift_getObjectType();
  BOOL v7 = SnapshotDataSource.isEmpty.getter(ObjectType, v5);
  sub_1AD1FFE38(a3, (uint64_t)v12);
  if (v7)
  {
    uint64_t v8 = v13;
    uint64_t v9 = v14;
    __swift_project_boxed_opaque_existential_1(v12, v13);
    char v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a1, v8, v9) ^ 1;
  }
  else
  {
    char v10 = 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10 & 1;
}

uint64_t MultiColumnDataSource.LayoutEngine.init(columnDelegate:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v2 + 24) = a2;
  *(void *)(v2 + 32) = 0x4072C00000000000;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1AD738398(uint64_t a1, uint64_t a2)
{
  return sub_1AD738294(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1AD7383A0(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *a1;
  uint64_t v3 = (void *)a1[1];
  uint64_t v5 = a1[2];
  if (MEMORY[0x1B3E68580](v1 + 16))
  {
    uint64_t v6 = *(void *)(v1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    v29[0] = v4;
    v29[1] = v3;
    v29[2] = v5;
    uint64_t v8 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 8))(v29, ObjectType, v6);
    swift_unknownObjectRelease();
    uint64_t v9 = self;
    id v10 = objc_msgSend(v9, sel_fractionalWidthDimension_, 1.0 / (double)v8);
    double v11 = *(double *)(v2 + 32);
    id v12 = objc_msgSend(v9, sel_estimatedDimension_, v11);
    uint64_t v13 = self;
    id v14 = objc_msgSend(v13, sel_sizeWithWidthDimension_heightDimension_, v10, v12);

    id v15 = objc_msgSend(self, sel_itemWithLayoutSize_, v14);
    uint64_t v16 = self;
    id v17 = objc_msgSend(v9, sel_fractionalWidthDimension_, 1.0);
    id v18 = objc_msgSend(v9, sel_estimatedDimension_, v11);
    id v19 = objc_msgSend(v13, sel_sizeWithWidthDimension_heightDimension_, v17, v18);

    id v20 = objc_msgSend(v16, sel_horizontalGroupWithLayoutSize_repeatingSubitem_count_, v19, v15, v8);
    uint64_t v21 = self;
    uint64_t v22 = self;
    id v23 = objc_msgSend(v3, sel_traitCollection);
    uint64_t v24 = sub_1AD73FCB0();

    objc_msgSend(v22, sel_interItemSpacingForWidthDesignation_, v24);
    id v25 = objc_msgSend(v21, sel_fixedSpacing_);
    objc_msgSend(v20, sel_setInterItemSpacing_, v25);

    id v26 = objc_msgSend(self, sel_sectionWithGroup_, v20);
    return (uint64_t)v26;
  }
  else
  {
    sub_1AD740680();
    sub_1AD73F300();
    sub_1AD740E30();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
    sub_1AD73F300();
    swift_unknownObjectRetain();
    sub_1AD73F220();
    sub_1AD73F300();
    swift_bridgeObjectRelease();
    sub_1AD276C68();
    swift_allocError();
    *(void *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = 0xE000000000000000;
    *(unsigned char *)(v28 + 16) = 1;
    return swift_willThrow();
  }
}

uint64_t MultiColumnDataSource.LayoutEngine.deinit()
{
  sub_1AD24D3D8(v0 + 16);
  return v0;
}

uint64_t MultiColumnDataSource.LayoutEngine.__deallocating_deinit()
{
  sub_1AD24D3D8(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1AD7387DC(uint64_t *a1)
{
  return sub_1AD7383A0(a1);
}

void MultiColumnDataSource.init(arrangedSections:collapseEmptySections:layoutConstructor:)()
{
}

void MultiColumnDataSource.init(arrangedSections:collapseEmptySections:layoutSectionProvider:)()
{
}

uint64_t sub_1AD738838()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t sub_1AD738864(uint64_t a1, uint64_t (*a2)(uint64_t, void *))
{
  uint64_t v21 = *(void *)(a1 + 16);
  if (!v21) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v2 = a2;
  uint64_t v3 = 0;
  uint64_t v4 = (unsigned char *)(a1 + 96);
  uint64_t v5 = MEMORY[0x1E4FBC860];
  do
  {
    uint64_t v6 = *((void *)v4 - 7);
    uint64_t v7 = *((void *)v4 - 6);
    uint64_t v8 = *((void *)v4 - 5);
    uint64_t v10 = *((void *)v4 - 4);
    uint64_t v9 = *((void *)v4 - 3);
    uint64_t v11 = *((void *)v4 - 2);
    uint64_t v12 = *((void *)v4 - 1);
    char v13 = *v4;
    uint64_t v26 = *((void *)v4 - 8);
    v27[0] = v26;
    v27[1] = v6;
    uint64_t v24 = v9;
    uint64_t v25 = v7;
    v27[2] = v7;
    v27[3] = v8;
    v27[4] = v10;
    v27[5] = v9;
    uint64_t v23 = v11;
    v27[6] = v11;
    v27[7] = v12;
    char v22 = v13;
    char v28 = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_retain();
    if (v2(v3, v27))
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v29 = v5;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1AD2F54C4(0, *(void *)(v5 + 16) + 1, 1);
        uint64_t v5 = v29;
      }
      unint64_t v16 = *(void *)(v5 + 16);
      unint64_t v15 = *(void *)(v5 + 24);
      unint64_t v17 = v16 + 1;
      if (v16 >= v15 >> 1)
      {
        sub_1AD2F54C4(v15 > 1, v16 + 1, 1);
        unint64_t v17 = v16 + 1;
        uint64_t v5 = v29;
      }
      *(void *)(v5 + 16) = v17;
      uint64_t v18 = v5 + 80 * v16;
      *(void *)(v18 + 32) = v3;
      *(void *)(v18 + 40) = v26;
      *(void *)(v18 + 48) = v6;
      *(void *)(v18 + 56) = v25;
      *(void *)(v18 + 64) = v8;
      *(void *)(v18 + 72) = v10;
      *(void *)(v18 + 80) = v24;
      *(void *)(v18 + 88) = v23;
      *(void *)(v18 + 96) = v12;
      *(unsigned char *)(v18 + 104) = v22;
      uint64_t v2 = a2;
    }
    else
    {
      swift_release();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    ++v3;
    v4 += 72;
  }
  while (v21 != v3);
  return v5;
}

uint64_t sub_1AD738A38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v51 = sub_1AD73A670();
  uint64_t v50 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51);
  uint64_t v49 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_childDataSourcesChangesSink) = 0;
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v52 = a1;
  if (v7)
  {
    uint64_t v48 = a2;
    uint64_t v57 = MEMORY[0x1E4FBC860];
    uint64_t v46 = v2;
    swift_retain();
    sub_1AD2F54E4(0, v7, 0);
    uint64_t v54 = type metadata accessor for EmbeddedDataSourceCollectionViewCell();
    uint64_t v8 = (long long *)(a1 + 32);
    unint64_t v53 = sub_1AD2C8E78();
    int64_t v47 = v7;
    int64_t v9 = v7;
    do
    {
      long long v55 = *v8;
      *(void *)&v56[0] = v54;
      swift_unknownObjectRetain();
      uint64_t v10 = sub_1AD73F220();
      uint64_t v12 = v11;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v14 = *((void *)&v55 + 1);
      unint64_t v15 = *(void (**)(uint64_t, uint64_t))(*((void *)&v55 + 1) + 8);
      swift_unknownObjectRetain();
      v15(ObjectType, v14);
      *(void *)&v56[0] = 0x6465646465626D45;
      *((void *)&v56[0] + 1) = 0xE90000000000005FLL;
      sub_1AD73F300();
      swift_bridgeObjectRelease();
      long long v16 = v56[0];
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = v55;
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = sub_1AD2C8EEC;
      *(void *)(v18 + 24) = v17;
      uint64_t v19 = v57;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1AD2F54E4(0, *(void *)(v19 + 16) + 1, 1);
        uint64_t v19 = v57;
      }
      unint64_t v21 = *(void *)(v19 + 16);
      unint64_t v20 = *(void *)(v19 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_1AD2F54E4(v20 > 1, v21 + 1, 1);
        uint64_t v19 = v57;
      }
      *(void *)(v19 + 16) = v21 + 1;
      uint64_t v22 = v19 + 72 * v21;
      *(_OWORD *)(v22 + 32) = v16;
      *(void *)(v22 + 48) = v10;
      *(void *)(v22 + 56) = v12;
      *(_OWORD *)(v22 + 64) = v55;
      *(void *)(v22 + 80) = sub_1AD2D70A4;
      *(void *)(v22 + 88) = v18;
      *(unsigned char *)(v22 + 96) = 1;
      ++v8;
      --v9;
    }
    while (v9);
    a2 = v48;
    a1 = v52;
    int64_t v7 = v47;
    uint64_t v3 = v46;
  }
  else
  {
    swift_retain();
    uint64_t v19 = MEMORY[0x1E4FBC860];
  }
  *(void *)(v3 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_columnItems) = v19;
  sub_1AD1FFE38(a2, v3 + OBJC_IVAR____TtC18HealthExperienceUI21MultiColumnDataSource_layoutProvider);
  swift_release();
  sub_1AD275004();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AD74C370;
  MEMORY[0x1F4188790](inited);
  *(&v45 - 2) = a2;
  uint64_t v24 = swift_bridgeObjectRetain();
  uint64_t v25 = sub_1AD738864(v24, (uint64_t (*)(uint64_t, void *))sub_1AD73939C);
  uint64_t v26 = sub_1AD736E18(v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v27 = v49;
  sub_1AD73A660();
  uint64_t v28 = sub_1AD73A620();
  uint64_t v30 = v29;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v27, v51);
  sub_1AD1FBD54(MEMORY[0x1E4FBC860]);
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = Array<A>.identifierToIndexDict()(v31);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0;
  *(void *)(inited + 48) = v26;
  *(void *)(inited + 56) = v32;
  *(void *)(inited + 64) = v28;
  *(void *)(inited + 72) = v30;
  sub_1AD1FFE38(a2, (uint64_t)v56);
  uint64_t v33 = swift_allocObject();
  sub_1AD20FE90(v56, v33 + 16);
  uint64_t v34 = (uint64_t (**)(long long *))(v3
                                            + OBJC_IVAR____TtC18HealthExperienceUI32MutableArrayDataSourceWithLayout_layoutSectionProvider);
  *uint64_t v34 = sub_1AD7393A4;
  v34[1] = (uint64_t (*)(long long *))v33;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC18HealthExperienceUI32MutableArrayDataSourceWithLayout_collapseEmptySections) = 1;
  swift_retain();
  uint64_t v35 = sub_1AD1FBF24();
  uint64_t v37 = MutableArrayDataSource.init(arrangedSections:identifier:)(inited, v35, v36);
  swift_release();
  if (v7)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v38 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v39 = *v38;
      uint64_t v40 = swift_getObjectType();
      int64_t v41 = v7;
      uint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t))(v39 + 48);
      swift_unknownObjectRetain();
      uint64_t v43 = (void *)v42(v40, v39);
      objc_msgSend(v43, sel_registerObserver_, v37);
      swift_unknownObjectRelease();

      v38 += 2;
      --v7;
    }
    while (v41 != 1);
    swift_release();
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v37;
}

uint64_t dispatch thunk of MultiColumnDataSourceLayoutDelegate.numberOfColumns(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_1AD739010()
{
  return type metadata accessor for CollapsibleMultiColumnDataSource(0);
}

uint64_t type metadata accessor for CollapsibleMultiColumnDataSource(uint64_t a1)
{
  return sub_1AD20CA30(a1, (uint64_t *)&unk_1E9A34950);
}

uint64_t sub_1AD739038()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_1AD739070()
{
  return type metadata accessor for MultiColumnDataSource(0);
}

uint64_t type metadata accessor for MultiColumnDataSource(uint64_t a1)
{
  return sub_1AD20CA30(a1, (uint64_t *)&unk_1EB73A150);
}

uint64_t sub_1AD739098()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for MultiColumnDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MultiColumnDataSource);
}

uint64_t dispatch thunk of MultiColumnDataSource.childDataSources.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 624))();
}

uint64_t dispatch thunk of MultiColumnDataSource.__allocating_init(_:layoutProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 656))();
}

uint64_t dispatch thunk of MultiColumnDataSource.snapshotDidChange(dataSourceID:snapshot:animated:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of MultiColumnDataSource.numberOfColumns(context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of MultiColumnDataSource.registerCells(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

uint64_t method lookup function for MultiColumnDataSource.LayoutEngine(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MultiColumnDataSource.LayoutEngine);
}

uint64_t dispatch thunk of MultiColumnDataSource.LayoutEngine.__allocating_init(columnDelegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MultiColumnDataSource.LayoutEngine.layout(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1AD739234()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1AD73926C(long long *a1)
{
  return sub_1AD738064(a1, (void *)(v1 + 16));
}

uint64_t sub_1AD739288()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD7392C0()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1AD7392F8()
{
  unint64_t result = qword_1EB73B7C8;
  if (!qword_1EB73B7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB73B7C8);
  }
  return result;
}

uint64_t sub_1AD73934C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD7393A4(long long *a1)
{
  return sub_1AD73926C(a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1AD739CD0()
{
  return MEMORY[0x1F411CE58]();
}

uint64_t sub_1AD739CE0()
{
  return MEMORY[0x1F411CE60]();
}

uint64_t sub_1AD739CF0()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1AD739D00()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1AD739D10()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1AD739D20()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1AD739D30()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1AD739D40()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1AD739D50()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1AD739D60()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1AD739D70()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1AD739D80()
{
  return MEMORY[0x1F411D688]();
}

uint64_t sub_1AD739D90()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1AD739DA0()
{
  return MEMORY[0x1F40E34B0]();
}

uint64_t sub_1AD739DB0()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1AD739DC0()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1AD739DD0()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1AD739DE0()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_1AD739DF0()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1AD739E00()
{
  return MEMORY[0x1F40E3518]();
}

uint64_t sub_1AD739E10()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1AD739E20()
{
  return MEMORY[0x1F40E3540]();
}

uint64_t sub_1AD739E30()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1AD739E40()
{
  return MEMORY[0x1F40E3560]();
}

uint64_t sub_1AD739E50()
{
  return MEMORY[0x1F40E3568]();
}

uint64_t sub_1AD739E60()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1AD739E70()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1AD739E80()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1AD739E90()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1AD739EA0()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1AD739EB0()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1AD739EC0()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1AD739ED0()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1AD739EE0()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1AD739EF0()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_1AD739F00()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1AD739F10()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1AD739F20()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1AD739F30()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1AD739F40()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1AD739F50()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1AD739F60()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1AD739F70()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1AD739F80()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1AD739F90()
{
  return MEMORY[0x1F40E3938]();
}

uint64_t sub_1AD739FA0()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1AD739FB0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1AD739FC0()
{
  return MEMORY[0x1F40E3B48]();
}

uint64_t sub_1AD739FD0()
{
  return MEMORY[0x1F40E3B60]();
}

uint64_t sub_1AD739FE0()
{
  return MEMORY[0x1F4165698]();
}

uint64_t sub_1AD739FF0()
{
  return MEMORY[0x1F41656C0]();
}

uint64_t sub_1AD73A000()
{
  return MEMORY[0x1F41656D8]();
}

uint64_t sub_1AD73A010()
{
  return MEMORY[0x1F41656E0]();
}

uint64_t sub_1AD73A020()
{
  return MEMORY[0x1F40F7D30]();
}

uint64_t sub_1AD73A030()
{
  return MEMORY[0x1F40F7D40]();
}

uint64_t sub_1AD73A040()
{
  return MEMORY[0x1F40E3BC0]();
}

uint64_t sub_1AD73A050()
{
  return MEMORY[0x1F40E3BF0]();
}

uint64_t sub_1AD73A060()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_1AD73A070()
{
  return MEMORY[0x1F40E3C20]();
}

uint64_t sub_1AD73A080()
{
  return MEMORY[0x1F40E3C90]();
}

uint64_t sub_1AD73A090()
{
  return MEMORY[0x1F40E3C98]();
}

uint64_t sub_1AD73A0A0()
{
  return MEMORY[0x1F40E3CD0]();
}

uint64_t sub_1AD73A0B0()
{
  return MEMORY[0x1F40E3CE8]();
}

uint64_t sub_1AD73A0C0()
{
  return MEMORY[0x1F40E3CF8]();
}

uint64_t sub_1AD73A0D0()
{
  return MEMORY[0x1F40E3D08]();
}

uint64_t sub_1AD73A0E0()
{
  return MEMORY[0x1F40E3D30]();
}

uint64_t sub_1AD73A0F0()
{
  return MEMORY[0x1F40E3D80]();
}

uint64_t sub_1AD73A100()
{
  return MEMORY[0x1F40E3D88]();
}

uint64_t sub_1AD73A110()
{
  return MEMORY[0x1F40E3D90]();
}

uint64_t sub_1AD73A120()
{
  return MEMORY[0x1F40E3DA8]();
}

uint64_t sub_1AD73A130()
{
  return MEMORY[0x1F40E3DC0]();
}

uint64_t sub_1AD73A140()
{
  return MEMORY[0x1F40E3DC8]();
}

uint64_t sub_1AD73A150()
{
  return MEMORY[0x1F40E3DF8]();
}

uint64_t sub_1AD73A160()
{
  return MEMORY[0x1F40E3E08]();
}

uint64_t sub_1AD73A170()
{
  return MEMORY[0x1F40E3E40]();
}

uint64_t sub_1AD73A180()
{
  return MEMORY[0x1F40E3E58]();
}

uint64_t sub_1AD73A190()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1AD73A1A0()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1AD73A1B0()
{
  return MEMORY[0x1F40E3EF8]();
}

uint64_t sub_1AD73A1C0()
{
  return MEMORY[0x1F40E3F10]();
}

uint64_t sub_1AD73A1D0()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1AD73A1E0()
{
  return MEMORY[0x1F40E4028]();
}

uint64_t sub_1AD73A1F0()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1AD73A200()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1AD73A210()
{
  return MEMORY[0x1F40E40C0]();
}

uint64_t sub_1AD73A220()
{
  return MEMORY[0x1F40E4178]();
}

uint64_t sub_1AD73A230()
{
  return MEMORY[0x1F40E42C0]();
}

uint64_t sub_1AD73A240()
{
  return MEMORY[0x1F40E42C8]();
}

uint64_t sub_1AD73A250()
{
  return MEMORY[0x1F40E42D8]();
}

uint64_t sub_1AD73A260()
{
  return MEMORY[0x1F40E42F0]();
}

uint64_t sub_1AD73A270()
{
  return MEMORY[0x1F40E4368]();
}

uint64_t sub_1AD73A280()
{
  return MEMORY[0x1F40E4388]();
}

uint64_t sub_1AD73A290()
{
  return MEMORY[0x1F40E43C0]();
}

uint64_t sub_1AD73A2A0()
{
  return MEMORY[0x1F40E43D0]();
}

uint64_t sub_1AD73A2B0()
{
  return MEMORY[0x1F40E4460]();
}

uint64_t sub_1AD73A310()
{
  return MEMORY[0x1F40E44F0]();
}

uint64_t sub_1AD73A320()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1AD73A330()
{
  return MEMORY[0x1F40E4518]();
}

uint64_t sub_1AD73A340()
{
  return MEMORY[0x1F41656F0]();
}

uint64_t sub_1AD73A350()
{
  return MEMORY[0x1F40F7D50]();
}

uint64_t sub_1AD73A360()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1AD73A370()
{
  return MEMORY[0x1F40E4680]();
}

uint64_t sub_1AD73A380()
{
  return MEMORY[0x1F40E4688]();
}

uint64_t sub_1AD73A390()
{
  return MEMORY[0x1F40E4690]();
}

uint64_t sub_1AD73A3A0()
{
  return MEMORY[0x1F40E4698]();
}

uint64_t sub_1AD73A3B0()
{
  return MEMORY[0x1F40E46A8]();
}

uint64_t sub_1AD73A3C0()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1AD73A3D0()
{
  return MEMORY[0x1F40E4868]();
}

uint64_t sub_1AD73A3E0()
{
  return MEMORY[0x1F40E48A0]();
}

uint64_t sub_1AD73A3F0()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1AD73A400()
{
  return MEMORY[0x1F40E4908]();
}

uint64_t sub_1AD73A410()
{
  return MEMORY[0x1F411D690]();
}

uint64_t sub_1AD73A420()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1AD73A430()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1AD73A440()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1AD73A450()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1AD73A460()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1AD73A470()
{
  return MEMORY[0x1F40E4A90]();
}

uint64_t sub_1AD73A480()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1AD73A490()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1AD73A4A0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1AD73A4B0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1AD73A4C0()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1AD73A4D0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1AD73A4E0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1AD73A4F0()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1AD73A500()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1AD73A510()
{
  return MEMORY[0x1F40E4F00]();
}

uint64_t sub_1AD73A520()
{
  return MEMORY[0x1F40E4F18]();
}

uint64_t sub_1AD73A530()
{
  return MEMORY[0x1F40E4F20]();
}

uint64_t sub_1AD73A540()
{
  return MEMORY[0x1F40E4F38]();
}

uint64_t sub_1AD73A550()
{
  return MEMORY[0x1F40E5078]();
}

uint64_t sub_1AD73A560()
{
  return MEMORY[0x1F411D698]();
}

uint64_t sub_1AD73A570()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1AD73A580()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1AD73A590()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1AD73A5A0()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1AD73A5B0()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1AD73A5C0()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1AD73A5D0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1AD73A5E0()
{
  return MEMORY[0x1F40E5348]();
}

uint64_t sub_1AD73A5F0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1AD73A600()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1AD73A610()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1AD73A620()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1AD73A630()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t _s18HealthExperienceUI18DirectSearchResultV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1AD73A650()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1AD73A660()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1AD73A670()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1AD73A680()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1AD73A690()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1AD73A6A0()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1AD73A6B0()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1AD73A6C0()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1AD73A6D0()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1AD73A6E0()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1AD73A6F0()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1AD73A700()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1AD73A710()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1AD73A720()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1AD73A730()
{
  return MEMORY[0x1F40E5A80]();
}

uint64_t sub_1AD73A740()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1AD73A750()
{
  return MEMORY[0x1F40E5AC8]();
}

uint64_t sub_1AD73A760()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1AD73A770()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1AD73A780()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1AD73A790()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1AD73A7A0()
{
  return MEMORY[0x1F40E5E50]();
}

uint64_t sub_1AD73A7B0()
{
  return MEMORY[0x1F40E5E60]();
}

uint64_t sub_1AD73A7C0()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1AD73A7D0()
{
  return MEMORY[0x1F40E5E90]();
}

uint64_t sub_1AD73A7E0()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1AD73A7F0()
{
  return MEMORY[0x1F4165708]();
}

uint64_t sub_1AD73A800()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1AD73A810()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1AD73A820()
{
  return MEMORY[0x1F4165748]();
}

uint64_t sub_1AD73A830()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1AD73A840()
{
  return MEMORY[0x1F40E5EA8]();
}

uint64_t sub_1AD73A850()
{
  return MEMORY[0x1F40E5EC0]();
}

uint64_t sub_1AD73A860()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1AD73A870()
{
  return MEMORY[0x1F4187468]();
}

uint64_t sub_1AD73A880()
{
  return MEMORY[0x1F40D9648]();
}

uint64_t sub_1AD73A890()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_1AD73A8A0()
{
  return MEMORY[0x1F40E5F60]();
}

uint64_t sub_1AD73A8B0()
{
  return MEMORY[0x1F40E5F70]();
}

uint64_t sub_1AD73A8C0()
{
  return MEMORY[0x1F40E5F80]();
}

uint64_t sub_1AD73A8E0()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1AD73A8F0()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1AD73A900()
{
  return MEMORY[0x1F411FD88]();
}

uint64_t sub_1AD73A910()
{
  return MEMORY[0x1F411FD98]();
}

uint64_t sub_1AD73A920()
{
  return MEMORY[0x1F411FDA0]();
}

uint64_t sub_1AD73A930()
{
  return MEMORY[0x1F411FDA8]();
}

uint64_t sub_1AD73A940()
{
  return MEMORY[0x1F411FDC0]();
}

uint64_t sub_1AD73A950()
{
  return MEMORY[0x1F411FDC8]();
}

uint64_t sub_1AD73A960()
{
  return MEMORY[0x1F411FE18]();
}

uint64_t sub_1AD73A970()
{
  return MEMORY[0x1F411FE20]();
}

uint64_t sub_1AD73A980()
{
  return MEMORY[0x1F411FE28]();
}

uint64_t sub_1AD73A990()
{
  return MEMORY[0x1F411FE40]();
}

uint64_t sub_1AD73A9A0()
{
  return MEMORY[0x1F411FE50]();
}

uint64_t sub_1AD73A9B0()
{
  return MEMORY[0x1F411FE58]();
}

uint64_t sub_1AD73A9C0()
{
  return MEMORY[0x1F411FE70]();
}

uint64_t sub_1AD73A9D0()
{
  return MEMORY[0x1F411FE88]();
}

uint64_t sub_1AD73A9E0()
{
  return MEMORY[0x1F411FEA0]();
}

uint64_t sub_1AD73A9F0()
{
  return MEMORY[0x1F411FEA8]();
}

uint64_t sub_1AD73AA00()
{
  return MEMORY[0x1F411FF10]();
}

uint64_t sub_1AD73AA10()
{
  return MEMORY[0x1F411FF18]();
}

uint64_t sub_1AD73AA20()
{
  return MEMORY[0x1F411FF20]();
}

uint64_t sub_1AD73AA30()
{
  return MEMORY[0x1F411FF28]();
}

uint64_t sub_1AD73AA40()
{
  return MEMORY[0x1F411FF30]();
}

uint64_t sub_1AD73AA50()
{
  return MEMORY[0x1F411FF40]();
}

uint64_t sub_1AD73AA60()
{
  return MEMORY[0x1F411FF48]();
}

uint64_t sub_1AD73AA70()
{
  return MEMORY[0x1F411FF60]();
}

uint64_t sub_1AD73AA80()
{
  return MEMORY[0x1F411FF68]();
}

uint64_t sub_1AD73AA90()
{
  return MEMORY[0x1F411FF80]();
}

uint64_t sub_1AD73AAA0()
{
  return MEMORY[0x1F411FF88]();
}

uint64_t sub_1AD73AAB0()
{
  return MEMORY[0x1F411FF90]();
}

uint64_t sub_1AD73AAC0()
{
  return MEMORY[0x1F411FF98]();
}

uint64_t sub_1AD73AAD0()
{
  return MEMORY[0x1F411FFA0]();
}

uint64_t sub_1AD73AAE0()
{
  return MEMORY[0x1F411FFA8]();
}

uint64_t sub_1AD73AAF0()
{
  return MEMORY[0x1F411FFB0]();
}

uint64_t sub_1AD73AB00()
{
  return MEMORY[0x1F411FFB8]();
}

uint64_t sub_1AD73AB10()
{
  return MEMORY[0x1F411FFC0]();
}

uint64_t sub_1AD73AB20()
{
  return MEMORY[0x1F411FFC8]();
}

uint64_t sub_1AD73AB30()
{
  return MEMORY[0x1F4120DE8]();
}

uint64_t sub_1AD73AB40()
{
  return MEMORY[0x1F411FFF8]();
}

uint64_t sub_1AD73AB50()
{
  return MEMORY[0x1F4120000]();
}

uint64_t sub_1AD73AB60()
{
  return MEMORY[0x1F4120008]();
}

uint64_t sub_1AD73AB70()
{
  return MEMORY[0x1F4120010]();
}

uint64_t sub_1AD73AB80()
{
  return MEMORY[0x1F4120028]();
}

uint64_t sub_1AD73AB90()
{
  return MEMORY[0x1F4120038]();
}

uint64_t sub_1AD73ABA0()
{
  return MEMORY[0x1F4120040]();
}

uint64_t sub_1AD73ABB0()
{
  return MEMORY[0x1F4120050]();
}

uint64_t sub_1AD73ABC0()
{
  return MEMORY[0x1F4120058]();
}

uint64_t sub_1AD73ABD0()
{
  return MEMORY[0x1F4120088]();
}

uint64_t sub_1AD73ABE0()
{
  return MEMORY[0x1F41200A0]();
}

uint64_t sub_1AD73ABF0()
{
  return MEMORY[0x1F41200B0]();
}

uint64_t sub_1AD73AC00()
{
  return MEMORY[0x1F41200C0]();
}

uint64_t sub_1AD73AC10()
{
  return MEMORY[0x1F41200D8]();
}

uint64_t sub_1AD73AC20()
{
  return MEMORY[0x1F41200E0]();
}

uint64_t sub_1AD73AC30()
{
  return MEMORY[0x1F41200E8]();
}

uint64_t sub_1AD73AC40()
{
  return MEMORY[0x1F41200F8]();
}

uint64_t sub_1AD73AC50()
{
  return MEMORY[0x1F4120100]();
}

uint64_t sub_1AD73AC60()
{
  return MEMORY[0x1F4120108]();
}

uint64_t sub_1AD73AC70()
{
  return MEMORY[0x1F4120118]();
}

uint64_t sub_1AD73AC80()
{
  return MEMORY[0x1F4120128]();
}

uint64_t sub_1AD73AC90()
{
  return MEMORY[0x1F4120138]();
}

uint64_t sub_1AD73ACA0()
{
  return MEMORY[0x1F4120140]();
}

uint64_t sub_1AD73ACB0()
{
  return MEMORY[0x1F4120148]();
}

uint64_t sub_1AD73ACC0()
{
  return MEMORY[0x1F4120158]();
}

uint64_t sub_1AD73ACD0()
{
  return MEMORY[0x1F4120160]();
}

uint64_t sub_1AD73ACE0()
{
  return MEMORY[0x1F4120168]();
}

uint64_t sub_1AD73ACF0()
{
  return MEMORY[0x1F4120170]();
}

uint64_t sub_1AD73AD00()
{
  return MEMORY[0x1F4120178]();
}

uint64_t sub_1AD73AD10()
{
  return MEMORY[0x1F4120180]();
}

uint64_t sub_1AD73AD20()
{
  return MEMORY[0x1F4120188]();
}

uint64_t sub_1AD73AD30()
{
  return MEMORY[0x1F4120190]();
}

uint64_t sub_1AD73AD40()
{
  return MEMORY[0x1F41201A0]();
}

uint64_t sub_1AD73AD50()
{
  return MEMORY[0x1F41201A8]();
}

uint64_t sub_1AD73AD60()
{
  return MEMORY[0x1F41201B0]();
}

uint64_t sub_1AD73AD70()
{
  return MEMORY[0x1F41201B8]();
}

uint64_t sub_1AD73AD80()
{
  return MEMORY[0x1F41201D8]();
}

uint64_t sub_1AD73AD90()
{
  return MEMORY[0x1F4120298]();
}

uint64_t sub_1AD73ADA0()
{
  return MEMORY[0x1F41202B8]();
}

uint64_t sub_1AD73ADB0()
{
  return MEMORY[0x1F41202D0]();
}

uint64_t sub_1AD73ADC0()
{
  return MEMORY[0x1F41202F8]();
}

uint64_t sub_1AD73ADD0()
{
  return MEMORY[0x1F4120DF0]();
}

uint64_t sub_1AD73ADE0()
{
  return MEMORY[0x1F4120398]();
}

uint64_t sub_1AD73ADF0()
{
  return MEMORY[0x1F41203A0]();
}

uint64_t sub_1AD73AE00()
{
  return MEMORY[0x1F41203A8]();
}

uint64_t sub_1AD73AE10()
{
  return MEMORY[0x1F41203B0]();
}

uint64_t sub_1AD73AE20()
{
  return MEMORY[0x1F41203B8]();
}

uint64_t sub_1AD73AE30()
{
  return MEMORY[0x1F41203C0]();
}

uint64_t sub_1AD73AE40()
{
  return MEMORY[0x1F41203C8]();
}

uint64_t sub_1AD73AE50()
{
  return MEMORY[0x1F41203D0]();
}

uint64_t sub_1AD73AE60()
{
  return MEMORY[0x1F41203E8]();
}

uint64_t sub_1AD73AE70()
{
  return MEMORY[0x1F4120430]();
}

uint64_t sub_1AD73AE80()
{
  return MEMORY[0x1F4120478]();
}

uint64_t sub_1AD73AE90()
{
  return MEMORY[0x1F4120480]();
}

uint64_t sub_1AD73AEA0()
{
  return MEMORY[0x1F4120488]();
}

uint64_t sub_1AD73AEB0()
{
  return MEMORY[0x1F4120490]();
}

uint64_t sub_1AD73AEC0()
{
  return MEMORY[0x1F4120498]();
}

uint64_t sub_1AD73AED0()
{
  return MEMORY[0x1F41204A0]();
}

uint64_t sub_1AD73AEE0()
{
  return MEMORY[0x1F41204A8]();
}

uint64_t sub_1AD73AEF0()
{
  return MEMORY[0x1F41204B0]();
}

uint64_t sub_1AD73AF00()
{
  return MEMORY[0x1F41204B8]();
}

uint64_t sub_1AD73AF10()
{
  return MEMORY[0x1F41204C0]();
}

uint64_t sub_1AD73AF20()
{
  return MEMORY[0x1F41204C8]();
}

uint64_t sub_1AD73AF30()
{
  return MEMORY[0x1F41204D0]();
}

uint64_t sub_1AD73AF40()
{
  return MEMORY[0x1F41204D8]();
}

uint64_t sub_1AD73AF50()
{
  return MEMORY[0x1F41204E0]();
}

uint64_t sub_1AD73AF60()
{
  return MEMORY[0x1F41204E8]();
}

uint64_t sub_1AD73AF70()
{
  return MEMORY[0x1F41204F0]();
}

uint64_t sub_1AD73AF80()
{
  return MEMORY[0x1F41204F8]();
}

uint64_t sub_1AD73AF90()
{
  return MEMORY[0x1F4120500]();
}

uint64_t sub_1AD73AFA0()
{
  return MEMORY[0x1F4120508]();
}

uint64_t sub_1AD73AFB0()
{
  return MEMORY[0x1F4120510]();
}

uint64_t sub_1AD73AFC0()
{
  return MEMORY[0x1F4120518]();
}

uint64_t sub_1AD73AFD0()
{
  return MEMORY[0x1F4120520]();
}

uint64_t sub_1AD73AFE0()
{
  return MEMORY[0x1F4120528]();
}

uint64_t sub_1AD73AFF0()
{
  return MEMORY[0x1F4120530]();
}

uint64_t sub_1AD73B000()
{
  return MEMORY[0x1F4120538]();
}

uint64_t sub_1AD73B010()
{
  return MEMORY[0x1F4120560]();
}

uint64_t sub_1AD73B020()
{
  return MEMORY[0x1F4120568]();
}

uint64_t sub_1AD73B030()
{
  return MEMORY[0x1F4120570]();
}

uint64_t sub_1AD73B040()
{
  return MEMORY[0x1F4120578]();
}

uint64_t sub_1AD73B050()
{
  return MEMORY[0x1F4120580]();
}

uint64_t sub_1AD73B060()
{
  return MEMORY[0x1F4120588]();
}

uint64_t sub_1AD73B070()
{
  return MEMORY[0x1F4120590]();
}

uint64_t sub_1AD73B080()
{
  return MEMORY[0x1F4120598]();
}

uint64_t sub_1AD73B090()
{
  return MEMORY[0x1F41205A0]();
}

uint64_t sub_1AD73B0A0()
{
  return MEMORY[0x1F41205A8]();
}

uint64_t sub_1AD73B0B0()
{
  return MEMORY[0x1F41205B0]();
}

uint64_t sub_1AD73B0C0()
{
  return MEMORY[0x1F4120630]();
}

uint64_t sub_1AD73B0D0()
{
  return MEMORY[0x1F4120660]();
}

uint64_t sub_1AD73B0E0()
{
  return MEMORY[0x1F4120700]();
}

uint64_t sub_1AD73B0F0()
{
  return MEMORY[0x1F4120710]();
}

uint64_t sub_1AD73B100()
{
  return MEMORY[0x1F4120730]();
}

uint64_t sub_1AD73B110()
{
  return MEMORY[0x1F4120738]();
}

uint64_t sub_1AD73B120()
{
  return MEMORY[0x1F4120750]();
}

uint64_t sub_1AD73B130()
{
  return MEMORY[0x1F4120768]();
}

uint64_t sub_1AD73B140()
{
  return MEMORY[0x1F4120778]();
}

uint64_t sub_1AD73B150()
{
  return MEMORY[0x1F4120780]();
}

uint64_t sub_1AD73B160()
{
  return MEMORY[0x1F4120788]();
}

uint64_t sub_1AD73B170()
{
  return MEMORY[0x1F4120790]();
}

uint64_t sub_1AD73B180()
{
  return MEMORY[0x1F4120798]();
}

uint64_t sub_1AD73B190()
{
  return MEMORY[0x1F4120828]();
}

uint64_t sub_1AD73B1A0()
{
  return MEMORY[0x1F4120830]();
}

uint64_t sub_1AD73B1B0()
{
  return MEMORY[0x1F4120838]();
}

uint64_t sub_1AD73B1C0()
{
  return MEMORY[0x1F4120840]();
}

uint64_t sub_1AD73B1D0()
{
  return MEMORY[0x1F41208B8]();
}

uint64_t sub_1AD73B1E0()
{
  return MEMORY[0x1F4120DF8]();
}

uint64_t sub_1AD73B1F0()
{
  return MEMORY[0x1F41208C0]();
}

uint64_t sub_1AD73B200()
{
  return MEMORY[0x1F41208C8]();
}

uint64_t sub_1AD73B210()
{
  return MEMORY[0x1F41208D0]();
}

uint64_t sub_1AD73B220()
{
  return MEMORY[0x1F41208D8]();
}

uint64_t sub_1AD73B230()
{
  return MEMORY[0x1F41208E0]();
}

uint64_t sub_1AD73B240()
{
  return MEMORY[0x1F41208E8]();
}

uint64_t sub_1AD73B250()
{
  return MEMORY[0x1F4120988]();
}

uint64_t sub_1AD73B260()
{
  return MEMORY[0x1F4120990]();
}

uint64_t sub_1AD73B270()
{
  return MEMORY[0x1F4120998]();
}

uint64_t sub_1AD73B280()
{
  return MEMORY[0x1F41209A0]();
}

uint64_t sub_1AD73B290()
{
  return MEMORY[0x1F4120A98]();
}

uint64_t sub_1AD73B2A0()
{
  return MEMORY[0x1F4120AA0]();
}

uint64_t sub_1AD73B2B0()
{
  return MEMORY[0x1F4120AB8]();
}

uint64_t sub_1AD73B2C0()
{
  return MEMORY[0x1F4120AE0]();
}

uint64_t sub_1AD73B2D0()
{
  return MEMORY[0x1F4120AE8]();
}

uint64_t sub_1AD73B2E0()
{
  return MEMORY[0x1F4120AF0]();
}

uint64_t sub_1AD73B2F0()
{
  return MEMORY[0x1F4120AF8]();
}

uint64_t sub_1AD73B300()
{
  return MEMORY[0x1F4120B00]();
}

uint64_t sub_1AD73B310()
{
  return MEMORY[0x1F4120B08]();
}

uint64_t sub_1AD73B320()
{
  return MEMORY[0x1F4120B10]();
}

uint64_t sub_1AD73B330()
{
  return MEMORY[0x1F4120B18]();
}

uint64_t sub_1AD73B340()
{
  return MEMORY[0x1F4120E00]();
}

uint64_t sub_1AD73B350()
{
  return MEMORY[0x1F4120E08]();
}

uint64_t sub_1AD73B360()
{
  return MEMORY[0x1F4120E10]();
}

uint64_t sub_1AD73B370()
{
  return MEMORY[0x1F4120E18]();
}

uint64_t sub_1AD73B380()
{
  return MEMORY[0x1F4120E28]();
}

uint64_t sub_1AD73B390()
{
  return MEMORY[0x1F4120E30]();
}

uint64_t sub_1AD73B3A0()
{
  return MEMORY[0x1F4120E40]();
}

uint64_t sub_1AD73B3B0()
{
  return MEMORY[0x1F4120E48]();
}

uint64_t sub_1AD73B3C0()
{
  return MEMORY[0x1F4120E50]();
}

uint64_t sub_1AD73B3D0()
{
  return MEMORY[0x1F4120E58]();
}

uint64_t sub_1AD73B3E0()
{
  return MEMORY[0x1F4120E60]();
}

uint64_t sub_1AD73B3F0()
{
  return MEMORY[0x1F4120E68]();
}

uint64_t sub_1AD73B400()
{
  return MEMORY[0x1F4120E70]();
}

uint64_t sub_1AD73B410()
{
  return MEMORY[0x1F4120E78]();
}

uint64_t sub_1AD73B420()
{
  return MEMORY[0x1F4120E80]();
}

uint64_t sub_1AD73B430()
{
  return MEMORY[0x1F4120B28]();
}

uint64_t sub_1AD73B440()
{
  return MEMORY[0x1F4120B30]();
}

uint64_t sub_1AD73B450()
{
  return MEMORY[0x1F4120B38]();
}

uint64_t sub_1AD73B460()
{
  return MEMORY[0x1F4120B48]();
}

uint64_t sub_1AD73B470()
{
  return MEMORY[0x1F4120B50]();
}

uint64_t sub_1AD73B480()
{
  return MEMORY[0x1F4120B58]();
}

uint64_t sub_1AD73B490()
{
  return MEMORY[0x1F4120B60]();
}

uint64_t sub_1AD73B4A0()
{
  return MEMORY[0x1F4120B68]();
}

uint64_t sub_1AD73B4B0()
{
  return MEMORY[0x1F4120B70]();
}

uint64_t sub_1AD73B4C0()
{
  return MEMORY[0x1F4120B88]();
}

uint64_t sub_1AD73B4D0()
{
  return MEMORY[0x1F4120B98]();
}

uint64_t sub_1AD73B4E0()
{
  return MEMORY[0x1F4120BA8]();
}

uint64_t sub_1AD73B4F0()
{
  return MEMORY[0x1F4120BB0]();
}

uint64_t sub_1AD73B500()
{
  return MEMORY[0x1F4120BC0]();
}

uint64_t sub_1AD73B510()
{
  return MEMORY[0x1F4120BD8]();
}

uint64_t sub_1AD73B520()
{
  return MEMORY[0x1F4120BE0]();
}

uint64_t sub_1AD73B530()
{
  return MEMORY[0x1F411D6E8]();
}

uint64_t sub_1AD73B540()
{
  return MEMORY[0x1F411D6F0]();
}

uint64_t sub_1AD73B550()
{
  return MEMORY[0x1F411D6F8]();
}

uint64_t sub_1AD73B560()
{
  return MEMORY[0x1F411D718]();
}

uint64_t sub_1AD73B570()
{
  return MEMORY[0x1F411D720]();
}

uint64_t sub_1AD73B580()
{
  return MEMORY[0x1F411D728]();
}

uint64_t sub_1AD73B590()
{
  return MEMORY[0x1F411D730]();
}

uint64_t sub_1AD73B5A0()
{
  return MEMORY[0x1F411D738]();
}

uint64_t sub_1AD73B5B0()
{
  return MEMORY[0x1F411D740]();
}

uint64_t sub_1AD73B5C0()
{
  return MEMORY[0x1F411D748]();
}

uint64_t sub_1AD73B5D0()
{
  return MEMORY[0x1F411D750]();
}

uint64_t sub_1AD73B5E0()
{
  return MEMORY[0x1F411D758]();
}

uint64_t sub_1AD73B5F0()
{
  return MEMORY[0x1F411D760]();
}

uint64_t sub_1AD73B600()
{
  return MEMORY[0x1F411D768]();
}

uint64_t sub_1AD73B610()
{
  return MEMORY[0x1F411D770]();
}

uint64_t sub_1AD73B620()
{
  return MEMORY[0x1F411D778]();
}

uint64_t sub_1AD73B630()
{
  return MEMORY[0x1F411D788]();
}

uint64_t sub_1AD73B640()
{
  return MEMORY[0x1F411D790]();
}

uint64_t sub_1AD73B650()
{
  return MEMORY[0x1F411D798]();
}

uint64_t sub_1AD73B660()
{
  return MEMORY[0x1F411D7A0]();
}

uint64_t sub_1AD73B670()
{
  return MEMORY[0x1F411D7A8]();
}

uint64_t sub_1AD73B680()
{
  return MEMORY[0x1F411D7B0]();
}

uint64_t sub_1AD73B690()
{
  return MEMORY[0x1F411D7B8]();
}

uint64_t sub_1AD73B6A0()
{
  return MEMORY[0x1F411D7C0]();
}

uint64_t sub_1AD73B6B0()
{
  return MEMORY[0x1F411D7C8]();
}

uint64_t sub_1AD73B6C0()
{
  return MEMORY[0x1F411D7D0]();
}

uint64_t sub_1AD73B6D0()
{
  return MEMORY[0x1F411D7D8]();
}

uint64_t sub_1AD73B6E0()
{
  return MEMORY[0x1F411D7E0]();
}

uint64_t sub_1AD73B6F0()
{
  return MEMORY[0x1F411D7E8]();
}

uint64_t sub_1AD73B700()
{
  return MEMORY[0x1F411D7F0]();
}

uint64_t sub_1AD73B710()
{
  return MEMORY[0x1F411D7F8]();
}

uint64_t sub_1AD73B720()
{
  return MEMORY[0x1F411D800]();
}

uint64_t sub_1AD73B730()
{
  return MEMORY[0x1F411D808]();
}

uint64_t sub_1AD73B740()
{
  return MEMORY[0x1F411D810]();
}

uint64_t sub_1AD73B750()
{
  return MEMORY[0x1F411D818]();
}

uint64_t sub_1AD73B760()
{
  return MEMORY[0x1F411D820]();
}

uint64_t sub_1AD73B770()
{
  return MEMORY[0x1F411D828]();
}

uint64_t sub_1AD73B780()
{
  return MEMORY[0x1F411D830]();
}

uint64_t sub_1AD73B790()
{
  return MEMORY[0x1F411D838]();
}

uint64_t sub_1AD73B7A0()
{
  return MEMORY[0x1F411D840]();
}

uint64_t sub_1AD73B7B0()
{
  return MEMORY[0x1F411D848]();
}

uint64_t sub_1AD73B7C0()
{
  return MEMORY[0x1F411D850]();
}

uint64_t sub_1AD73B7D0()
{
  return MEMORY[0x1F411D858]();
}

uint64_t sub_1AD73B7E0()
{
  return MEMORY[0x1F411D860]();
}

uint64_t sub_1AD73B7F0()
{
  return MEMORY[0x1F411D868]();
}

uint64_t sub_1AD73B800()
{
  return MEMORY[0x1F411D870]();
}

uint64_t sub_1AD73B810()
{
  return MEMORY[0x1F411D878]();
}

uint64_t sub_1AD73B820()
{
  return MEMORY[0x1F411D898]();
}

uint64_t sub_1AD73B830()
{
  return MEMORY[0x1F411D8A0]();
}

uint64_t sub_1AD73B840()
{
  return MEMORY[0x1F411D8A8]();
}

uint64_t sub_1AD73B850()
{
  return MEMORY[0x1F411D8B0]();
}

uint64_t sub_1AD73B860()
{
  return MEMORY[0x1F411D8B8]();
}

uint64_t sub_1AD73B870()
{
  return MEMORY[0x1F411D8C0]();
}

uint64_t sub_1AD73B880()
{
  return MEMORY[0x1F411D8C8]();
}

uint64_t sub_1AD73B890()
{
  return MEMORY[0x1F411D8D0]();
}

uint64_t sub_1AD73B8A0()
{
  return MEMORY[0x1F411D8D8]();
}

uint64_t sub_1AD73B8B0()
{
  return MEMORY[0x1F411D8E0]();
}

uint64_t sub_1AD73B8C0()
{
  return MEMORY[0x1F411D8E8]();
}

uint64_t sub_1AD73B8D0()
{
  return MEMORY[0x1F411D900]();
}

uint64_t sub_1AD73B8E0()
{
  return MEMORY[0x1F411D918]();
}

uint64_t sub_1AD73B8F0()
{
  return MEMORY[0x1F411D920]();
}

uint64_t sub_1AD73B900()
{
  return MEMORY[0x1F411D928]();
}

uint64_t sub_1AD73B910()
{
  return MEMORY[0x1F411D930]();
}

uint64_t sub_1AD73B920()
{
  return MEMORY[0x1F411D938]();
}

uint64_t sub_1AD73B930()
{
  return MEMORY[0x1F411D940]();
}

uint64_t sub_1AD73B940()
{
  return MEMORY[0x1F411D948]();
}

uint64_t sub_1AD73B950()
{
  return MEMORY[0x1F411D950]();
}

uint64_t sub_1AD73B960()
{
  return MEMORY[0x1F411D958]();
}

uint64_t sub_1AD73B970()
{
  return MEMORY[0x1F411D968]();
}

uint64_t sub_1AD73B980()
{
  return MEMORY[0x1F411D970]();
}

uint64_t sub_1AD73B990()
{
  return MEMORY[0x1F411D978]();
}

uint64_t sub_1AD73B9A0()
{
  return MEMORY[0x1F411D980]();
}

uint64_t sub_1AD73B9B0()
{
  return MEMORY[0x1F411D988]();
}

uint64_t sub_1AD73B9C0()
{
  return MEMORY[0x1F411D990]();
}

uint64_t sub_1AD73B9D0()
{
  return MEMORY[0x1F411D998]();
}

uint64_t sub_1AD73B9E0()
{
  return MEMORY[0x1F411D9A0]();
}

uint64_t sub_1AD73B9F0()
{
  return MEMORY[0x1F411D9A8]();
}

uint64_t sub_1AD73BA00()
{
  return MEMORY[0x1F411D9B0]();
}

uint64_t sub_1AD73BA10()
{
  return MEMORY[0x1F411D9B8]();
}

uint64_t sub_1AD73BA20()
{
  return MEMORY[0x1F411D9C0]();
}

uint64_t sub_1AD73BA30()
{
  return MEMORY[0x1F411D9C8]();
}

uint64_t sub_1AD73BA40()
{
  return MEMORY[0x1F411D9E0]();
}

uint64_t sub_1AD73BA50()
{
  return MEMORY[0x1F411D9F8]();
}

uint64_t sub_1AD73BA60()
{
  return MEMORY[0x1F411DA00]();
}

uint64_t sub_1AD73BA70()
{
  return MEMORY[0x1F411DA30]();
}

uint64_t sub_1AD73BA80()
{
  return MEMORY[0x1F411DA38]();
}

uint64_t sub_1AD73BA90()
{
  return MEMORY[0x1F411DA40]();
}

uint64_t sub_1AD73BAA0()
{
  return MEMORY[0x1F411DA48]();
}

uint64_t sub_1AD73BAB0()
{
  return MEMORY[0x1F411DA50]();
}

uint64_t sub_1AD73BAC0()
{
  return MEMORY[0x1F411DA58]();
}

uint64_t sub_1AD73BAD0()
{
  return MEMORY[0x1F411DA88]();
}

uint64_t sub_1AD73BAE0()
{
  return MEMORY[0x1F411DA90]();
}

uint64_t sub_1AD73BAF0()
{
  return MEMORY[0x1F411DA98]();
}

uint64_t sub_1AD73BB00()
{
  return MEMORY[0x1F411DAA0]();
}

uint64_t sub_1AD73BB10()
{
  return MEMORY[0x1F411DAA8]();
}

uint64_t sub_1AD73BB20()
{
  return MEMORY[0x1F411DAB0]();
}

uint64_t sub_1AD73BB30()
{
  return MEMORY[0x1F411DAB8]();
}

uint64_t sub_1AD73BB40()
{
  return MEMORY[0x1F411DAC0]();
}

uint64_t sub_1AD73BB50()
{
  return MEMORY[0x1F411DAC8]();
}

uint64_t sub_1AD73BB60()
{
  return MEMORY[0x1F411DAD0]();
}

uint64_t sub_1AD73BB70()
{
  return MEMORY[0x1F411DAD8]();
}

uint64_t sub_1AD73BB80()
{
  return MEMORY[0x1F411DAE0]();
}

uint64_t sub_1AD73BB90()
{
  return MEMORY[0x1F411DAE8]();
}

uint64_t sub_1AD73BBA0()
{
  return MEMORY[0x1F411DAF0]();
}

uint64_t sub_1AD73BBB0()
{
  return MEMORY[0x1F411DAF8]();
}

uint64_t sub_1AD73BBC0()
{
  return MEMORY[0x1F411DB00]();
}

uint64_t sub_1AD73BBD0()
{
  return MEMORY[0x1F411DB08]();
}

uint64_t sub_1AD73BBE0()
{
  return MEMORY[0x1F411DB18]();
}

uint64_t sub_1AD73BBF0()
{
  return MEMORY[0x1F411DB20]();
}

uint64_t sub_1AD73BC00()
{
  return MEMORY[0x1F411DB28]();
}

uint64_t sub_1AD73BC10()
{
  return MEMORY[0x1F411DB30]();
}

uint64_t sub_1AD73BC20()
{
  return MEMORY[0x1F411DB38]();
}

uint64_t sub_1AD73BC30()
{
  return MEMORY[0x1F411DB40]();
}

uint64_t _s18HealthExperienceUI32AdvertisableFeatureTableViewCellC15reuseIdentifierSSvgZ_0()
{
  return MEMORY[0x1F411DB48]();
}

uint64_t sub_1AD73BC50()
{
  return MEMORY[0x1F411DB50]();
}

uint64_t sub_1AD73BC60()
{
  return MEMORY[0x1F411DB58]();
}

uint64_t sub_1AD73BC70()
{
  return MEMORY[0x1F411DB60]();
}

uint64_t sub_1AD73BC80()
{
  return MEMORY[0x1F411DB68]();
}

uint64_t sub_1AD73BC90()
{
  return MEMORY[0x1F411DB70]();
}

uint64_t sub_1AD73BCA0()
{
  return MEMORY[0x1F411DB78]();
}

uint64_t sub_1AD73BCB0()
{
  return MEMORY[0x1F411DB80]();
}

uint64_t sub_1AD73BCC0()
{
  return MEMORY[0x1F411DB88]();
}

uint64_t sub_1AD73BCD0()
{
  return MEMORY[0x1F411DB90]();
}

uint64_t sub_1AD73BCE0()
{
  return MEMORY[0x1F411DBA0]();
}

uint64_t sub_1AD73BCF0()
{
  return MEMORY[0x1F411DBA8]();
}

uint64_t sub_1AD73BD00()
{
  return MEMORY[0x1F411DBC0]();
}

uint64_t sub_1AD73BD10()
{
  return MEMORY[0x1F411DBC8]();
}

uint64_t sub_1AD73BD20()
{
  return MEMORY[0x1F411DBF8]();
}

uint64_t sub_1AD73BD40()
{
  return MEMORY[0x1F411DC08]();
}

uint64_t sub_1AD73BD50()
{
  return MEMORY[0x1F411DC10]();
}

uint64_t sub_1AD73BD60()
{
  return MEMORY[0x1F411DC18]();
}

uint64_t sub_1AD73BD70()
{
  return MEMORY[0x1F411DC20]();
}

uint64_t sub_1AD73BD80()
{
  return MEMORY[0x1F411DC28]();
}

uint64_t sub_1AD73BD90()
{
  return MEMORY[0x1F411DC30]();
}

uint64_t sub_1AD73BDA0()
{
  return MEMORY[0x1F411DC38]();
}

uint64_t sub_1AD73BDB0()
{
  return MEMORY[0x1F411DC40]();
}

uint64_t sub_1AD73BDC0()
{
  return MEMORY[0x1F411DC48]();
}

uint64_t sub_1AD73BDD0()
{
  return MEMORY[0x1F411DC50]();
}

uint64_t sub_1AD73BDE0()
{
  return MEMORY[0x1F411DC58]();
}

uint64_t sub_1AD73BDF0()
{
  return MEMORY[0x1F411DC60]();
}

uint64_t sub_1AD73BE00()
{
  return MEMORY[0x1F411DC68]();
}

uint64_t sub_1AD73BE10()
{
  return MEMORY[0x1F411DC70]();
}

uint64_t sub_1AD73BE20()
{
  return MEMORY[0x1F411DC78]();
}

uint64_t sub_1AD73BE30()
{
  return MEMORY[0x1F411DC80]();
}

uint64_t sub_1AD73BE40()
{
  return MEMORY[0x1F411DC88]();
}

uint64_t sub_1AD73BE50()
{
  return MEMORY[0x1F411DC90]();
}

uint64_t sub_1AD73BE60()
{
  return MEMORY[0x1F411DC98]();
}

uint64_t sub_1AD73BE70()
{
  return MEMORY[0x1F411DCA0]();
}

uint64_t sub_1AD73BE80()
{
  return MEMORY[0x1F411DCA8]();
}

uint64_t sub_1AD73BE90()
{
  return MEMORY[0x1F411DCB8]();
}

uint64_t sub_1AD73BEA0()
{
  return MEMORY[0x1F411DCC0]();
}

uint64_t sub_1AD73BEB0()
{
  return MEMORY[0x1F411DCC8]();
}

uint64_t sub_1AD73BEC0()
{
  return MEMORY[0x1F411DCD0]();
}

uint64_t sub_1AD73BED0()
{
  return MEMORY[0x1F411DCE8]();
}

uint64_t sub_1AD73BEE0()
{
  return MEMORY[0x1F411DCF8]();
}

uint64_t sub_1AD73BEF0()
{
  return MEMORY[0x1F411DD00]();
}

uint64_t sub_1AD73BF00()
{
  return MEMORY[0x1F411DD08]();
}

uint64_t sub_1AD73BF10()
{
  return MEMORY[0x1F411DD10]();
}

uint64_t sub_1AD73BF20()
{
  return MEMORY[0x1F411DD18]();
}

uint64_t sub_1AD73BF30()
{
  return MEMORY[0x1F411DD20]();
}

uint64_t sub_1AD73BF40()
{
  return MEMORY[0x1F411DD28]();
}

uint64_t sub_1AD73BF50()
{
  return MEMORY[0x1F411DD30]();
}

uint64_t sub_1AD73BF60()
{
  return MEMORY[0x1F411DD38]();
}

uint64_t sub_1AD73BF70()
{
  return MEMORY[0x1F411DD40]();
}

uint64_t sub_1AD73BF80()
{
  return MEMORY[0x1F411DD48]();
}

uint64_t sub_1AD73BF90()
{
  return MEMORY[0x1F411DD50]();
}

uint64_t sub_1AD73BFA0()
{
  return MEMORY[0x1F411DD58]();
}

uint64_t sub_1AD73BFB0()
{
  return MEMORY[0x1F411DD60]();
}

uint64_t sub_1AD73BFC0()
{
  return MEMORY[0x1F411DD68]();
}

uint64_t sub_1AD73BFD0()
{
  return MEMORY[0x1F411DD78]();
}

uint64_t sub_1AD73BFE0()
{
  return MEMORY[0x1F411DD80]();
}

uint64_t sub_1AD73BFF0()
{
  return MEMORY[0x1F411DD88]();
}

uint64_t sub_1AD73C000()
{
  return MEMORY[0x1F411DD90]();
}

uint64_t sub_1AD73C010()
{
  return MEMORY[0x1F411DD98]();
}

uint64_t sub_1AD73C020()
{
  return MEMORY[0x1F411DDA0]();
}

uint64_t sub_1AD73C030()
{
  return MEMORY[0x1F411DDA8]();
}

uint64_t sub_1AD73C040()
{
  return MEMORY[0x1F411DDB0]();
}

uint64_t sub_1AD73C050()
{
  return MEMORY[0x1F411DDB8]();
}

uint64_t sub_1AD73C060()
{
  return MEMORY[0x1F411DDC0]();
}

uint64_t sub_1AD73C070()
{
  return MEMORY[0x1F411DDC8]();
}

uint64_t sub_1AD73C080()
{
  return MEMORY[0x1F411DDD0]();
}

uint64_t sub_1AD73C090()
{
  return MEMORY[0x1F411DDD8]();
}

uint64_t sub_1AD73C0A0()
{
  return MEMORY[0x1F411DDE0]();
}

uint64_t sub_1AD73C0B0()
{
  return MEMORY[0x1F411DDE8]();
}

uint64_t sub_1AD73C0C0()
{
  return MEMORY[0x1F411DDF0]();
}

uint64_t sub_1AD73C0D0()
{
  return MEMORY[0x1F411DDF8]();
}

uint64_t sub_1AD73C0E0()
{
  return MEMORY[0x1F411DE00]();
}

uint64_t sub_1AD73C0F0()
{
  return MEMORY[0x1F411DE08]();
}

uint64_t sub_1AD73C100()
{
  return MEMORY[0x1F411DE10]();
}

uint64_t sub_1AD73C110()
{
  return MEMORY[0x1F411DE18]();
}

uint64_t sub_1AD73C120()
{
  return MEMORY[0x1F411DE20]();
}

uint64_t sub_1AD73C130()
{
  return MEMORY[0x1F411DE28]();
}

uint64_t sub_1AD73C140()
{
  return MEMORY[0x1F411DE30]();
}

uint64_t sub_1AD73C150()
{
  return MEMORY[0x1F411DE38]();
}

uint64_t sub_1AD73C160()
{
  return MEMORY[0x1F411DE48]();
}

uint64_t sub_1AD73C170()
{
  return MEMORY[0x1F411DE50]();
}

uint64_t sub_1AD73C180()
{
  return MEMORY[0x1F411DE58]();
}

uint64_t sub_1AD73C190()
{
  return MEMORY[0x1F411DE60]();
}

uint64_t sub_1AD73C1A0()
{
  return MEMORY[0x1F411DE68]();
}

uint64_t sub_1AD73C1B0()
{
  return MEMORY[0x1F4121088]();
}

uint64_t sub_1AD73C1C0()
{
  return MEMORY[0x1F4121090]();
}

uint64_t sub_1AD73C1D0()
{
  return MEMORY[0x1F4121098]();
}

uint64_t sub_1AD73C1E0()
{
  return MEMORY[0x1F41210A0]();
}

uint64_t sub_1AD73C1F0()
{
  return MEMORY[0x1F41210A8]();
}

uint64_t sub_1AD73C200()
{
  return MEMORY[0x1F41210B0]();
}

uint64_t sub_1AD73C210()
{
  return MEMORY[0x1F41210B8]();
}

uint64_t sub_1AD73C220()
{
  return MEMORY[0x1F41210C0]();
}

uint64_t sub_1AD73C230()
{
  return MEMORY[0x1F41210C8]();
}

uint64_t sub_1AD73C240()
{
  return MEMORY[0x1F41210D0]();
}

uint64_t sub_1AD73C250()
{
  return MEMORY[0x1F411CEC8]();
}

uint64_t sub_1AD73C260()
{
  return MEMORY[0x1F411CED0]();
}

uint64_t sub_1AD73C270()
{
  return MEMORY[0x1F411CED8]();
}

uint64_t sub_1AD73C280()
{
  return MEMORY[0x1F411CEE0]();
}

uint64_t sub_1AD73C290()
{
  return MEMORY[0x1F411CEF0]();
}

uint64_t sub_1AD73C2A0()
{
  return MEMORY[0x1F411CEF8]();
}

uint64_t sub_1AD73C2B0()
{
  return MEMORY[0x1F411CF00]();
}

uint64_t sub_1AD73C2C0()
{
  return MEMORY[0x1F411CF08]();
}

uint64_t sub_1AD73C2D0()
{
  return MEMORY[0x1F411CF38]();
}

uint64_t sub_1AD73C2E0()
{
  return MEMORY[0x1F411CF40]();
}

uint64_t sub_1AD73C2F0()
{
  return MEMORY[0x1F411CF48]();
}

uint64_t sub_1AD73C300()
{
  return MEMORY[0x1F411CF50]();
}

uint64_t sub_1AD73C310()
{
  return MEMORY[0x1F411CF58]();
}

uint64_t sub_1AD73C320()
{
  return MEMORY[0x1F411CF60]();
}

uint64_t sub_1AD73C330()
{
  return MEMORY[0x1F411CF68]();
}

uint64_t sub_1AD73C340()
{
  return MEMORY[0x1F411CF80]();
}

uint64_t sub_1AD73C350()
{
  return MEMORY[0x1F411CF88]();
}

uint64_t sub_1AD73C360()
{
  return MEMORY[0x1F411CF90]();
}

uint64_t sub_1AD73C370()
{
  return MEMORY[0x1F411CF98]();
}

uint64_t sub_1AD73C380()
{
  return MEMORY[0x1F411CFA0]();
}

uint64_t sub_1AD73C390()
{
  return MEMORY[0x1F411CFA8]();
}

uint64_t sub_1AD73C3A0()
{
  return MEMORY[0x1F411CFB0]();
}

uint64_t sub_1AD73C3B0()
{
  return MEMORY[0x1F411CFB8]();
}

uint64_t sub_1AD73C3C0()
{
  return MEMORY[0x1F411CFC0]();
}

uint64_t sub_1AD73C3D0()
{
  return MEMORY[0x1F411CFC8]();
}

uint64_t sub_1AD73C3E0()
{
  return MEMORY[0x1F411CFD0]();
}

uint64_t sub_1AD73C3F0()
{
  return MEMORY[0x1F411CFD8]();
}

uint64_t sub_1AD73C400()
{
  return MEMORY[0x1F411CFE0]();
}

uint64_t sub_1AD73C410()
{
  return MEMORY[0x1F411CFE8]();
}

uint64_t sub_1AD73C420()
{
  return MEMORY[0x1F411CFF0]();
}

uint64_t sub_1AD73C430()
{
  return MEMORY[0x1F411CFF8]();
}

uint64_t sub_1AD73C440()
{
  return MEMORY[0x1F411D000]();
}

uint64_t sub_1AD73C450()
{
  return MEMORY[0x1F411D008]();
}

uint64_t sub_1AD73C460()
{
  return MEMORY[0x1F411D010]();
}

uint64_t sub_1AD73C470()
{
  return MEMORY[0x1F411D018]();
}

uint64_t sub_1AD73C480()
{
  return MEMORY[0x1F411D020]();
}

uint64_t sub_1AD73C490()
{
  return MEMORY[0x1F411D028]();
}

uint64_t sub_1AD73C4A0()
{
  return MEMORY[0x1F411D048]();
}

uint64_t sub_1AD73C4B0()
{
  return MEMORY[0x1F411D050]();
}

uint64_t sub_1AD73C4C0()
{
  return MEMORY[0x1F411D058]();
}

uint64_t sub_1AD73C4D0()
{
  return MEMORY[0x1F411D060]();
}

uint64_t sub_1AD73C4E0()
{
  return MEMORY[0x1F411D068]();
}

uint64_t sub_1AD73C4F0()
{
  return MEMORY[0x1F411D070]();
}

uint64_t sub_1AD73C500()
{
  return MEMORY[0x1F411D078]();
}

uint64_t sub_1AD73C510()
{
  return MEMORY[0x1F411D080]();
}

uint64_t sub_1AD73C520()
{
  return MEMORY[0x1F411D090]();
}

uint64_t sub_1AD73C530()
{
  return MEMORY[0x1F411D098]();
}

uint64_t sub_1AD73C540()
{
  return MEMORY[0x1F411D0A0]();
}

uint64_t sub_1AD73C550()
{
  return MEMORY[0x1F411D0A8]();
}

uint64_t sub_1AD73C560()
{
  return MEMORY[0x1F411D0B0]();
}

uint64_t sub_1AD73C570()
{
  return MEMORY[0x1F411D0B8]();
}

uint64_t sub_1AD73C580()
{
  return MEMORY[0x1F411D0C0]();
}

uint64_t sub_1AD73C590()
{
  return MEMORY[0x1F411D0C8]();
}

uint64_t sub_1AD73C5A0()
{
  return MEMORY[0x1F411D0D0]();
}

uint64_t sub_1AD73C5B0()
{
  return MEMORY[0x1F411EFB8]();
}

uint64_t sub_1AD73C5C0()
{
  return MEMORY[0x1F411EFC0]();
}

uint64_t sub_1AD73C5D0()
{
  return MEMORY[0x1F411EFC8]();
}

uint64_t sub_1AD73C5E0()
{
  return MEMORY[0x1F411EFD0]();
}

uint64_t sub_1AD73C5F0()
{
  return MEMORY[0x1F411EFD8]();
}

uint64_t sub_1AD73C600()
{
  return MEMORY[0x1F411EFE0]();
}

uint64_t sub_1AD73C610()
{
  return MEMORY[0x1F411EFE8]();
}

uint64_t sub_1AD73C620()
{
  return MEMORY[0x1F411EFF0]();
}

uint64_t sub_1AD73C630()
{
  return MEMORY[0x1F411EFF8]();
}

uint64_t sub_1AD73C640()
{
  return MEMORY[0x1F411F000]();
}

uint64_t sub_1AD73C650()
{
  return MEMORY[0x1F411F010]();
}

uint64_t sub_1AD73C660()
{
  return MEMORY[0x1F411F018]();
}

uint64_t sub_1AD73C670()
{
  return MEMORY[0x1F411F020]();
}

uint64_t sub_1AD73C680()
{
  return MEMORY[0x1F411F030]();
}

uint64_t sub_1AD73C690()
{
  return MEMORY[0x1F411F060]();
}

uint64_t sub_1AD73C6A0()
{
  return MEMORY[0x1F411F068]();
}

uint64_t sub_1AD73C6B0()
{
  return MEMORY[0x1F411F070]();
}

uint64_t sub_1AD73C6C0()
{
  return MEMORY[0x1F411F078]();
}

uint64_t sub_1AD73C6D0()
{
  return MEMORY[0x1F411F080]();
}

uint64_t sub_1AD73C6E0()
{
  return MEMORY[0x1F411F0B8]();
}

uint64_t sub_1AD73C700()
{
  return MEMORY[0x1F411F0C8]();
}

uint64_t sub_1AD73C710()
{
  return MEMORY[0x1F411F0D0]();
}

uint64_t sub_1AD73C720()
{
  return MEMORY[0x1F411F100]();
}

uint64_t sub_1AD73C730()
{
  return MEMORY[0x1F411F118]();
}

uint64_t sub_1AD73C740()
{
  return MEMORY[0x1F411F120]();
}

uint64_t sub_1AD73C750()
{
  return MEMORY[0x1F411F128]();
}

uint64_t sub_1AD73C760()
{
  return MEMORY[0x1F411F130]();
}

uint64_t sub_1AD73C770()
{
  return MEMORY[0x1F411F138]();
}

uint64_t sub_1AD73C780()
{
  return MEMORY[0x1F4120E98]();
}

uint64_t sub_1AD73C790()
{
  return MEMORY[0x1F4120EA0]();
}

uint64_t sub_1AD73C7A0()
{
  return MEMORY[0x1F4120EA8]();
}

uint64_t sub_1AD73C7B0()
{
  return MEMORY[0x1F4120EB0]();
}

uint64_t sub_1AD73C7C0()
{
  return MEMORY[0x1F4120EB8]();
}

uint64_t sub_1AD73C7D0()
{
  return MEMORY[0x1F4120ED8]();
}

uint64_t sub_1AD73C7E0()
{
  return MEMORY[0x1F4120EE0]();
}

uint64_t sub_1AD73C7F0()
{
  return MEMORY[0x1F4120EE8]();
}

uint64_t sub_1AD73C800()
{
  return MEMORY[0x1F4120EF0]();
}

uint64_t sub_1AD73C810()
{
  return MEMORY[0x1F4120EF8]();
}

uint64_t sub_1AD73C820()
{
  return MEMORY[0x1F4120F00]();
}

uint64_t sub_1AD73C830()
{
  return MEMORY[0x1F4120F08]();
}

uint64_t sub_1AD73C840()
{
  return MEMORY[0x1F4120F10]();
}

uint64_t sub_1AD73C850()
{
  return MEMORY[0x1F4120F18]();
}

uint64_t sub_1AD73C860()
{
  return MEMORY[0x1F4120F20]();
}

uint64_t sub_1AD73C870()
{
  return MEMORY[0x1F4120F28]();
}

uint64_t sub_1AD73C880()
{
  return MEMORY[0x1F4120F30]();
}

uint64_t sub_1AD73C890()
{
  return MEMORY[0x1F4120F38]();
}

uint64_t sub_1AD73C8A0()
{
  return MEMORY[0x1F4120F40]();
}

uint64_t sub_1AD73C8B0()
{
  return MEMORY[0x1F4120F50]();
}

uint64_t sub_1AD73C8C0()
{
  return MEMORY[0x1F4120F58]();
}

uint64_t sub_1AD73C8D0()
{
  return MEMORY[0x1F4120F60]();
}

uint64_t sub_1AD73C8E0()
{
  return MEMORY[0x1F4120F68]();
}

uint64_t sub_1AD73C8F0()
{
  return MEMORY[0x1F4120F70]();
}

uint64_t sub_1AD73C900()
{
  return MEMORY[0x1F4120F78]();
}

uint64_t sub_1AD73C910()
{
  return MEMORY[0x1F4120F80]();
}

uint64_t sub_1AD73C920()
{
  return MEMORY[0x1F4120F88]();
}

uint64_t sub_1AD73C930()
{
  return MEMORY[0x1F4120F90]();
}

uint64_t sub_1AD73C940()
{
  return MEMORY[0x1F4121000]();
}

uint64_t sub_1AD73C950()
{
  return MEMORY[0x1F4121008]();
}

uint64_t sub_1AD73C960()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1AD73C970()
{
  return MEMORY[0x1F41878E0]();
}

uint64_t sub_1AD73C980()
{
  return MEMORY[0x1F4187910]();
}

uint64_t sub_1AD73C990()
{
  return MEMORY[0x1F4187918]();
}

uint64_t sub_1AD73C9A0()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1AD73C9B0()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1AD73C9C0()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1AD73C9D0()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1AD73C9E0()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1AD73C9F0()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1AD73CA00()
{
  return MEMORY[0x1F41885A8]();
}

uint64_t sub_1AD73CA10()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1AD73CA20()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1AD73CA30()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1AD73CA40()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1AD73CA50()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1AD73CA60()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1AD73CA70()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1AD73CA80()
{
  return MEMORY[0x1F4120BF0]();
}

uint64_t _s18HealthExperienceUI0A44ChecklistStagedFeatureStatusFeedItemProviderPAAE6logger2os6LoggerVvg_0()
{
  return MEMORY[0x1F4120BF8]();
}

uint64_t sub_1AD73CAA0()
{
  return MEMORY[0x1F4120C18]();
}

uint64_t sub_1AD73CAB0()
{
  return MEMORY[0x1F4120C20]();
}

uint64_t sub_1AD73CAC0()
{
  return MEMORY[0x1F4120C28]();
}

uint64_t sub_1AD73CAD0()
{
  return MEMORY[0x1F4120C38]();
}

uint64_t sub_1AD73CAE0()
{
  return MEMORY[0x1F4120C40]();
}

uint64_t sub_1AD73CAF0()
{
  return MEMORY[0x1F4120C48]();
}

uint64_t sub_1AD73CB00()
{
  return MEMORY[0x1F4120C58]();
}

uint64_t sub_1AD73CB10()
{
  return MEMORY[0x1F4120C60]();
}

uint64_t sub_1AD73CB20()
{
  return MEMORY[0x1F4120C68]();
}

uint64_t sub_1AD73CB30()
{
  return MEMORY[0x1F4120C70]();
}

uint64_t sub_1AD73CB40()
{
  return MEMORY[0x1F4120C78]();
}

uint64_t sub_1AD73CB50()
{
  return MEMORY[0x1F4120C80]();
}

uint64_t sub_1AD73CB60()
{
  return MEMORY[0x1F4120C88]();
}

uint64_t sub_1AD73CB70()
{
  return MEMORY[0x1F411F160]();
}

uint64_t sub_1AD73CB80()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1AD73CB90()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1AD73CBA0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1AD73CBB0()
{
  return MEMORY[0x1F4165778]();
}

uint64_t sub_1AD73CBC0()
{
  return MEMORY[0x1F41658B8]();
}

uint64_t sub_1AD73CBD0()
{
  return MEMORY[0x1F41658C0]();
}

uint64_t sub_1AD73CBE0()
{
  return MEMORY[0x1F41658C8]();
}

uint64_t sub_1AD73CBF0()
{
  return MEMORY[0x1F41658D0]();
}

uint64_t sub_1AD73CC00()
{
  return MEMORY[0x1F41658F8]();
}

uint64_t sub_1AD73CC10()
{
  return MEMORY[0x1F4165900]();
}

uint64_t sub_1AD73CC20()
{
  return MEMORY[0x1F4165908]();
}

uint64_t sub_1AD73CC30()
{
  return MEMORY[0x1F4165910]();
}

uint64_t sub_1AD73CC40()
{
  return MEMORY[0x1F4165918]();
}

uint64_t sub_1AD73CC50()
{
  return MEMORY[0x1F4165948]();
}

uint64_t sub_1AD73CC60()
{
  return MEMORY[0x1F4165950]();
}

uint64_t sub_1AD73CC70()
{
  return MEMORY[0x1F4165958]();
}

uint64_t sub_1AD73CC80()
{
  return MEMORY[0x1F4165960]();
}

uint64_t sub_1AD73CC90()
{
  return MEMORY[0x1F4165968]();
}

uint64_t sub_1AD73CCA0()
{
  return MEMORY[0x1F4165988]();
}

uint64_t sub_1AD73CCB0()
{
  return MEMORY[0x1F4165990]();
}

uint64_t sub_1AD73CCC0()
{
  return MEMORY[0x1F41659A8]();
}

uint64_t sub_1AD73CCD0()
{
  return MEMORY[0x1F41659B0]();
}

uint64_t sub_1AD73CCE0()
{
  return MEMORY[0x1F41659C8]();
}

uint64_t sub_1AD73CCF0()
{
  return MEMORY[0x1F4165AA8]();
}

uint64_t sub_1AD73CD00()
{
  return MEMORY[0x1F4165AB0]();
}

uint64_t sub_1AD73CD10()
{
  return MEMORY[0x1F4165AE8]();
}

uint64_t sub_1AD73CD20()
{
  return MEMORY[0x1F4165AF8]();
}

uint64_t sub_1AD73CD30()
{
  return MEMORY[0x1F4165B00]();
}

uint64_t sub_1AD73CD40()
{
  return MEMORY[0x1F4165B08]();
}

uint64_t sub_1AD73CD50()
{
  return MEMORY[0x1F4165BC8]();
}

uint64_t sub_1AD73CD60()
{
  return MEMORY[0x1F4165BD8]();
}

uint64_t sub_1AD73CD70()
{
  return MEMORY[0x1F4165BE8]();
}

uint64_t sub_1AD73CD80()
{
  return MEMORY[0x1F4165BF8]();
}

uint64_t sub_1AD73CD90()
{
  return MEMORY[0x1F4165C00]();
}

uint64_t sub_1AD73CDA0()
{
  return MEMORY[0x1F4165C08]();
}

uint64_t sub_1AD73CDB0()
{
  return MEMORY[0x1F4165C28]();
}

uint64_t sub_1AD73CDC0()
{
  return MEMORY[0x1F4165C70]();
}

uint64_t sub_1AD73CDD0()
{
  return MEMORY[0x1F4165C78]();
}

uint64_t sub_1AD73CDE0()
{
  return MEMORY[0x1F4165CA0]();
}

uint64_t sub_1AD73CDF0()
{
  return MEMORY[0x1F4165CB0]();
}

uint64_t sub_1AD73CE00()
{
  return MEMORY[0x1F4165CC8]();
}

uint64_t sub_1AD73CE10()
{
  return MEMORY[0x1F4165CD0]();
}

uint64_t sub_1AD73CE20()
{
  return MEMORY[0x1F4165CE0]();
}

uint64_t sub_1AD73CE30()
{
  return MEMORY[0x1F4165CF0]();
}

uint64_t sub_1AD73CE40()
{
  return MEMORY[0x1F4165D18]();
}

uint64_t sub_1AD73CE50()
{
  return MEMORY[0x1F4165D28]();
}

uint64_t sub_1AD73CE60()
{
  return MEMORY[0x1F4165D30]();
}

uint64_t sub_1AD73CE70()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1AD73CE80()
{
  return MEMORY[0x1F4165D50]();
}

uint64_t sub_1AD73CE90()
{
  return MEMORY[0x1F4165D68]();
}

uint64_t sub_1AD73CEA0()
{
  return MEMORY[0x1F4165D70]();
}

uint64_t sub_1AD73CEB0()
{
  return MEMORY[0x1F4165D78]();
}

uint64_t sub_1AD73CEC0()
{
  return MEMORY[0x1F4165D80]();
}

uint64_t sub_1AD73CED0()
{
  return MEMORY[0x1F4165D88]();
}

uint64_t sub_1AD73CEE0()
{
  return MEMORY[0x1F4165D98]();
}

uint64_t sub_1AD73CEF0()
{
  return MEMORY[0x1F4165DD8]();
}

uint64_t sub_1AD73CF00()
{
  return MEMORY[0x1F4165DE0]();
}

uint64_t sub_1AD73CF10()
{
  return MEMORY[0x1F4165DE8]();
}

uint64_t sub_1AD73CF20()
{
  return MEMORY[0x1F4165DF0]();
}

uint64_t sub_1AD73CF30()
{
  return MEMORY[0x1F4165DF8]();
}

uint64_t sub_1AD73CF40()
{
  return MEMORY[0x1F4165E08]();
}

uint64_t sub_1AD73CF50()
{
  return MEMORY[0x1F4165E20]();
}

uint64_t sub_1AD73CF60()
{
  return MEMORY[0x1F4165E28]();
}

uint64_t sub_1AD73CF70()
{
  return MEMORY[0x1F4165E30]();
}

uint64_t sub_1AD73CF80()
{
  return MEMORY[0x1F4165E40]();
}

uint64_t sub_1AD73CF90()
{
  return MEMORY[0x1F4165E50]();
}

uint64_t sub_1AD73CFA0()
{
  return MEMORY[0x1F4165E58]();
}

uint64_t sub_1AD73CFB0()
{
  return MEMORY[0x1F4165E60]();
}

uint64_t sub_1AD73CFC0()
{
  return MEMORY[0x1F4165E78]();
}

uint64_t sub_1AD73CFD0()
{
  return MEMORY[0x1F4165E80]();
}

uint64_t sub_1AD73CFE0()
{
  return MEMORY[0x1F4165E88]();
}

uint64_t sub_1AD73CFF0()
{
  return MEMORY[0x1F4165E90]();
}

uint64_t sub_1AD73D000()
{
  return MEMORY[0x1F4165EA0]();
}

uint64_t sub_1AD73D010()
{
  return MEMORY[0x1F4165EA8]();
}

uint64_t sub_1AD73D020()
{
  return MEMORY[0x1F4165EB0]();
}

uint64_t sub_1AD73D030()
{
  return MEMORY[0x1F4165EC8]();
}

uint64_t sub_1AD73D040()
{
  return MEMORY[0x1F4165ED0]();
}

uint64_t sub_1AD73D050()
{
  return MEMORY[0x1F4165ED8]();
}

uint64_t sub_1AD73D060()
{
  return MEMORY[0x1F4165EE0]();
}

uint64_t _s18HealthExperienceUI29CollectionViewHeaderProvidingPAAE24makeDefaultConfiguration5UIKit013UIListContentJ0VyFZ_0()
{
  return MEMORY[0x1F4165EF0]();
}

uint64_t sub_1AD73D080()
{
  return MEMORY[0x1F4165F00]();
}

uint64_t sub_1AD73D090()
{
  return MEMORY[0x1F4165F08]();
}

uint64_t sub_1AD73D0A0()
{
  return MEMORY[0x1F4165F18]();
}

uint64_t sub_1AD73D0B0()
{
  return MEMORY[0x1F4165F20]();
}

uint64_t sub_1AD73D0C0()
{
  return MEMORY[0x1F4165F30]();
}

uint64_t sub_1AD73D0D0()
{
  return MEMORY[0x1F4165F38]();
}

uint64_t sub_1AD73D0E0()
{
  return MEMORY[0x1F4165F40]();
}

uint64_t sub_1AD73D0F0()
{
  return MEMORY[0x1F4165F48]();
}

uint64_t sub_1AD73D100()
{
  return MEMORY[0x1F4165F58]();
}

uint64_t sub_1AD73D110()
{
  return MEMORY[0x1F4165F60]();
}

uint64_t sub_1AD73D120()
{
  return MEMORY[0x1F4165F68]();
}

uint64_t sub_1AD73D130()
{
  return MEMORY[0x1F4165F78]();
}

uint64_t sub_1AD73D140()
{
  return MEMORY[0x1F4165F80]();
}

uint64_t sub_1AD73D150()
{
  return MEMORY[0x1F4165F88]();
}

uint64_t sub_1AD73D160()
{
  return MEMORY[0x1F4165F90]();
}

uint64_t sub_1AD73D170()
{
  return MEMORY[0x1F4165F98]();
}

uint64_t sub_1AD73D180()
{
  return MEMORY[0x1F4165FA0]();
}

uint64_t sub_1AD73D190()
{
  return MEMORY[0x1F4165FB8]();
}

uint64_t sub_1AD73D1A0()
{
  return MEMORY[0x1F4165FC0]();
}

uint64_t sub_1AD73D1B0()
{
  return MEMORY[0x1F4165FC8]();
}

uint64_t sub_1AD73D1C0()
{
  return MEMORY[0x1F4165FD0]();
}

uint64_t sub_1AD73D1D0()
{
  return MEMORY[0x1F4165FE0]();
}

uint64_t sub_1AD73D1E0()
{
  return MEMORY[0x1F4165FE8]();
}

uint64_t sub_1AD73D1F0()
{
  return MEMORY[0x1F4165FF0]();
}

uint64_t sub_1AD73D200()
{
  return MEMORY[0x1F4165FF8]();
}

uint64_t sub_1AD73D210()
{
  return MEMORY[0x1F4166000]();
}

uint64_t sub_1AD73D220()
{
  return MEMORY[0x1F4166008]();
}

uint64_t sub_1AD73D230()
{
  return MEMORY[0x1F4166010]();
}

uint64_t sub_1AD73D240()
{
  return MEMORY[0x1F4166018]();
}

uint64_t sub_1AD73D250()
{
  return MEMORY[0x1F4166020]();
}

uint64_t sub_1AD73D260()
{
  return MEMORY[0x1F4166028]();
}

uint64_t sub_1AD73D270()
{
  return MEMORY[0x1F4166030]();
}

uint64_t sub_1AD73D280()
{
  return MEMORY[0x1F4166038]();
}

uint64_t sub_1AD73D290()
{
  return MEMORY[0x1F4166040]();
}

uint64_t sub_1AD73D2A0()
{
  return MEMORY[0x1F4166048]();
}

uint64_t sub_1AD73D2B0()
{
  return MEMORY[0x1F4166050]();
}

uint64_t sub_1AD73D2C0()
{
  return MEMORY[0x1F4166068]();
}

uint64_t sub_1AD73D2D0()
{
  return MEMORY[0x1F4166070]();
}

uint64_t sub_1AD73D2E0()
{
  return MEMORY[0x1F4166078]();
}

uint64_t sub_1AD73D2F0()
{
  return MEMORY[0x1F4166090]();
}

uint64_t sub_1AD73D300()
{
  return MEMORY[0x1F41660A0]();
}

uint64_t sub_1AD73D310()
{
  return MEMORY[0x1F41660A8]();
}

uint64_t sub_1AD73D320()
{
  return MEMORY[0x1F41660C0]();
}

uint64_t sub_1AD73D330()
{
  return MEMORY[0x1F41660D0]();
}

uint64_t sub_1AD73D340()
{
  return MEMORY[0x1F41660E0]();
}

uint64_t sub_1AD73D350()
{
  return MEMORY[0x1F41660F0]();
}

uint64_t sub_1AD73D360()
{
  return MEMORY[0x1F41660F8]();
}

uint64_t sub_1AD73D370()
{
  return MEMORY[0x1F4166148]();
}

uint64_t sub_1AD73D380()
{
  return MEMORY[0x1F4166158]();
}

uint64_t sub_1AD73D390()
{
  return MEMORY[0x1F4166160]();
}

uint64_t sub_1AD73D3A0()
{
  return MEMORY[0x1F4166220]();
}

uint64_t sub_1AD73D3B0()
{
  return MEMORY[0x1F4166230]();
}

uint64_t sub_1AD73D3C0()
{
  return MEMORY[0x1F4166238]();
}

uint64_t sub_1AD73D3D0()
{
  return MEMORY[0x1F4166250]();
}

uint64_t sub_1AD73D3E0()
{
  return MEMORY[0x1F4166260]();
}

uint64_t sub_1AD73D3F0()
{
  return MEMORY[0x1F4166278]();
}

uint64_t sub_1AD73D400()
{
  return MEMORY[0x1F4166288]();
}

uint64_t sub_1AD73D410()
{
  return MEMORY[0x1F4166290]();
}

uint64_t sub_1AD73D420()
{
  return MEMORY[0x1F41662A8]();
}

uint64_t sub_1AD73D430()
{
  return MEMORY[0x1F41662F0]();
}

uint64_t sub_1AD73D440()
{
  return MEMORY[0x1F4166300]();
}

uint64_t sub_1AD73D450()
{
  return MEMORY[0x1F4166310]();
}

uint64_t sub_1AD73D460()
{
  return MEMORY[0x1F4166318]();
}

uint64_t sub_1AD73D470()
{
  return MEMORY[0x1F4166320]();
}

uint64_t sub_1AD73D480()
{
  return MEMORY[0x1F4166328]();
}

uint64_t sub_1AD73D490()
{
  return MEMORY[0x1F4166330]();
}

uint64_t sub_1AD73D4A0()
{
  return MEMORY[0x1F4166340]();
}

uint64_t sub_1AD73D4B0()
{
  return MEMORY[0x1F4166350]();
}

uint64_t sub_1AD73D4C0()
{
  return MEMORY[0x1F4166360]();
}

uint64_t sub_1AD73D4D0()
{
  return MEMORY[0x1F4166368]();
}

uint64_t sub_1AD73D4E0()
{
  return MEMORY[0x1F4166378]();
}

uint64_t sub_1AD73D4F0()
{
  return MEMORY[0x1F4166388]();
}

uint64_t sub_1AD73D500()
{
  return MEMORY[0x1F4166398]();
}

uint64_t sub_1AD73D510()
{
  return MEMORY[0x1F41663A8]();
}

uint64_t sub_1AD73D520()
{
  return MEMORY[0x1F41663B0]();
}

uint64_t sub_1AD73D530()
{
  return MEMORY[0x1F41663E8]();
}

uint64_t sub_1AD73D540()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1AD73D550()
{
  return MEMORY[0x1F41663F8]();
}

uint64_t sub_1AD73D560()
{
  return MEMORY[0x1F4166410]();
}

uint64_t sub_1AD73D570()
{
  return MEMORY[0x1F4166428]();
}

uint64_t sub_1AD73D580()
{
  return MEMORY[0x1F4166430]();
}

uint64_t sub_1AD73D590()
{
  return MEMORY[0x1F40D5820]();
}

uint64_t sub_1AD73D5A0()
{
  return MEMORY[0x1F40D5828]();
}

uint64_t sub_1AD73D5B0()
{
  return MEMORY[0x1F40D5830]();
}

uint64_t sub_1AD73D5C0()
{
  return MEMORY[0x1F40D5838]();
}

uint64_t sub_1AD73D5D0()
{
  return MEMORY[0x1F40D5840]();
}

uint64_t sub_1AD73D5E0()
{
  return MEMORY[0x1F40D5870]();
}

uint64_t sub_1AD73D5F0()
{
  return MEMORY[0x1F40D5890]();
}

uint64_t sub_1AD73D600()
{
  return MEMORY[0x1F40D58D0]();
}

uint64_t sub_1AD73D610()
{
  return MEMORY[0x1F40D58F8]();
}

uint64_t sub_1AD73D620()
{
  return MEMORY[0x1F40D5908]();
}

uint64_t sub_1AD73D630()
{
  return MEMORY[0x1F40D5918]();
}

uint64_t sub_1AD73D640()
{
  return MEMORY[0x1F40D5930]();
}

uint64_t sub_1AD73D650()
{
  return MEMORY[0x1F40D59F0]();
}

uint64_t sub_1AD73D660()
{
  return MEMORY[0x1F40D5A00]();
}

uint64_t sub_1AD73D670()
{
  return MEMORY[0x1F40D5A10]();
}

uint64_t sub_1AD73D680()
{
  return MEMORY[0x1F40D5A38]();
}

uint64_t sub_1AD73D690()
{
  return MEMORY[0x1F40D5A48]();
}

uint64_t sub_1AD73D6A0()
{
  return MEMORY[0x1F40D5B50]();
}

uint64_t sub_1AD73D6B0()
{
  return MEMORY[0x1F40D5B60]();
}

uint64_t sub_1AD73D6C0()
{
  return MEMORY[0x1F40D5B68]();
}

uint64_t sub_1AD73D6D0()
{
  return MEMORY[0x1F40D5B88]();
}

uint64_t sub_1AD73D6E0()
{
  return MEMORY[0x1F40D5C10]();
}

uint64_t sub_1AD73D6F0()
{
  return MEMORY[0x1F40D5C18]();
}

uint64_t sub_1AD73D700()
{
  return MEMORY[0x1F40D5C30]();
}

uint64_t sub_1AD73D710()
{
  return MEMORY[0x1F40D5C40]();
}

uint64_t sub_1AD73D720()
{
  return MEMORY[0x1F40D5C50]();
}

uint64_t sub_1AD73D730()
{
  return MEMORY[0x1F40D5CC8]();
}

uint64_t sub_1AD73D740()
{
  return MEMORY[0x1F40D5CE0]();
}

uint64_t sub_1AD73D750()
{
  return MEMORY[0x1F40D5CE8]();
}

uint64_t sub_1AD73D760()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1AD73D770()
{
  return MEMORY[0x1F40D6610]();
}

uint64_t sub_1AD73D780()
{
  return MEMORY[0x1F40D6620]();
}

uint64_t sub_1AD73D790()
{
  return MEMORY[0x1F40D6628]();
}

uint64_t sub_1AD73D7A0()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1AD73D7B0()
{
  return MEMORY[0x1F40D6660]();
}

uint64_t sub_1AD73D7C0()
{
  return MEMORY[0x1F40D6670]();
}

uint64_t sub_1AD73D7D0()
{
  return MEMORY[0x1F40D6680]();
}

uint64_t sub_1AD73D7E0()
{
  return MEMORY[0x1F40D6698]();
}

uint64_t sub_1AD73D7F0()
{
  return MEMORY[0x1F40D66B8]();
}

uint64_t sub_1AD73D800()
{
  return MEMORY[0x1F40D66C0]();
}

uint64_t sub_1AD73D810()
{
  return MEMORY[0x1F40D66C8]();
}

uint64_t sub_1AD73D820()
{
  return MEMORY[0x1F40D66D8]();
}

uint64_t sub_1AD73D830()
{
  return MEMORY[0x1F40D66F8]();
}

uint64_t sub_1AD73D840()
{
  return MEMORY[0x1F40D6718]();
}

uint64_t sub_1AD73D850()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1AD73D860()
{
  return MEMORY[0x1F40D6730]();
}

uint64_t sub_1AD73D870()
{
  return MEMORY[0x1F40D6758]();
}

uint64_t sub_1AD73D880()
{
  return MEMORY[0x1F40D6760]();
}

uint64_t sub_1AD73D890()
{
  return MEMORY[0x1F40D6768]();
}

uint64_t sub_1AD73D8A0()
{
  return MEMORY[0x1F40D6778]();
}

uint64_t sub_1AD73D8B0()
{
  return MEMORY[0x1F40D6788]();
}

uint64_t sub_1AD73D8C0()
{
  return MEMORY[0x1F40D6790]();
}

uint64_t sub_1AD73D8D0()
{
  return MEMORY[0x1F40D67D0]();
}

uint64_t sub_1AD73D8E0()
{
  return MEMORY[0x1F40D67E8]();
}

uint64_t sub_1AD73D8F0()
{
  return MEMORY[0x1F40D67F0]();
}

uint64_t sub_1AD73D900()
{
  return MEMORY[0x1F40D67F8]();
}

uint64_t sub_1AD73D910()
{
  return MEMORY[0x1F40D6800]();
}

uint64_t sub_1AD73D920()
{
  return MEMORY[0x1F40D6810]();
}

uint64_t sub_1AD73D930()
{
  return MEMORY[0x1F40D6818]();
}

uint64_t sub_1AD73D940()
{
  return MEMORY[0x1F40D6828]();
}

uint64_t sub_1AD73D950()
{
  return MEMORY[0x1F40D6830]();
}

uint64_t sub_1AD73D960()
{
  return MEMORY[0x1F40D6838]();
}

uint64_t sub_1AD73D970()
{
  return MEMORY[0x1F40D6850]();
}

uint64_t sub_1AD73D980()
{
  return MEMORY[0x1F40D6858]();
}

uint64_t sub_1AD73D990()
{
  return MEMORY[0x1F40D6890]();
}

uint64_t sub_1AD73D9A0()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1AD73D9B0()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1AD73D9C0()
{
  return MEMORY[0x1F411DED8]();
}

uint64_t sub_1AD73D9D0()
{
  return MEMORY[0x1F40D68E0]();
}

uint64_t sub_1AD73D9E0()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1AD73D9F0()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1AD73DA00()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1AD73DA10()
{
  return MEMORY[0x1F40D6948]();
}

uint64_t sub_1AD73DA20()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1AD73DA30()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1AD73DA40()
{
  return MEMORY[0x1F40F7D68]();
}

uint64_t sub_1AD73DA50()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1AD73DA60()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1AD73DA70()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1AD73DA80()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1AD73DA90()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1AD73DAA0()
{
  return MEMORY[0x1F40D6A58]();
}

uint64_t sub_1AD73DAB0()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1AD73DAC0()
{
  return MEMORY[0x1F40D6A70]();
}

uint64_t sub_1AD73DAD0()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1AD73DAE0()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1AD73DAF0()
{
  return MEMORY[0x1F40D6AB8]();
}

uint64_t sub_1AD73DB00()
{
  return MEMORY[0x1F40D6AC0]();
}

uint64_t sub_1AD73DB10()
{
  return MEMORY[0x1F40D6AD8]();
}

uint64_t sub_1AD73DB20()
{
  return MEMORY[0x1F40D6AF0]();
}

uint64_t sub_1AD73DB30()
{
  return MEMORY[0x1F40D6B00]();
}

uint64_t sub_1AD73DB40()
{
  return MEMORY[0x1F40D6B10]();
}

uint64_t sub_1AD73DB50()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1AD73DB60()
{
  return MEMORY[0x1F40D6B20]();
}

uint64_t sub_1AD73DB70()
{
  return MEMORY[0x1F40D6B30]();
}

uint64_t sub_1AD73DB80()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1AD73DB90()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1AD73DBA0()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_1AD73DBB0()
{
  return MEMORY[0x1F40D6B78]();
}

uint64_t sub_1AD73DBC0()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1AD73DBD0()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1AD73DBE0()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1AD73DBF0()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1AD73DC00()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1AD73DC10()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1AD73DC20()
{
  return MEMORY[0x1F40D6BB0]();
}

uint64_t sub_1AD73DC30()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1AD73DC40()
{
  return MEMORY[0x1F411DEE8]();
}

uint64_t sub_1AD73DC50()
{
  return MEMORY[0x1F411F168]();
}

uint64_t sub_1AD73DC60()
{
  return MEMORY[0x1F411F170]();
}

uint64_t sub_1AD73DC70()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1AD73DC80()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1AD73DC90()
{
  return MEMORY[0x1F40D6BE8]();
}

uint64_t sub_1AD73DCA0()
{
  return MEMORY[0x1F40D6C10]();
}

uint64_t sub_1AD73DCB0()
{
  return MEMORY[0x1F40D6C28]();
}

uint64_t sub_1AD73DCC0()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1AD73DCD0()
{
  return MEMORY[0x1F40D6C70]();
}

uint64_t sub_1AD73DCE0()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1AD73DCF0()
{
  return MEMORY[0x1F40D6CA0]();
}

uint64_t sub_1AD73DD00()
{
  return MEMORY[0x1F40D6CB8]();
}

uint64_t sub_1AD73DD10()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t sub_1AD73DD20()
{
  return MEMORY[0x1F40D6D28]();
}

uint64_t sub_1AD73DD30()
{
  return MEMORY[0x1F40D6D30]();
}

uint64_t sub_1AD73DD40()
{
  return MEMORY[0x1F40D6D40]();
}

uint64_t sub_1AD73DD50()
{
  return MEMORY[0x1F40D6D58]();
}

uint64_t sub_1AD73DD60()
{
  return MEMORY[0x1F40D6D60]();
}

uint64_t sub_1AD73DD70()
{
  return MEMORY[0x1F40D6D68]();
}

uint64_t sub_1AD73DD80()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1AD73DD90()
{
  return MEMORY[0x1F40D6D88]();
}

uint64_t sub_1AD73DDA0()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1AD73DDB0()
{
  return MEMORY[0x1F40D6D98]();
}

uint64_t sub_1AD73DDC0()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1AD73DDD0()
{
  return MEMORY[0x1F40D6DB0]();
}

uint64_t sub_1AD73DDE0()
{
  return MEMORY[0x1F40D6DE0]();
}

uint64_t sub_1AD73DDF0()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1AD73DE00()
{
  return MEMORY[0x1F40D6DF8]();
}

uint64_t sub_1AD73DE10()
{
  return MEMORY[0x1F40D6E08]();
}

uint64_t sub_1AD73DE20()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1AD73DE30()
{
  return MEMORY[0x1F40D6E28]();
}

uint64_t sub_1AD73DE40()
{
  return MEMORY[0x1F40D6E38]();
}

uint64_t sub_1AD73DE50()
{
  return MEMORY[0x1F40D6E40]();
}

uint64_t sub_1AD73DE60()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1AD73DE70()
{
  return MEMORY[0x1F40F8000]();
}

uint64_t sub_1AD73DE80()
{
  return MEMORY[0x1F40F8020]();
}

uint64_t sub_1AD73DE90()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1AD73DEA0()
{
  return MEMORY[0x1F40F8108]();
}

uint64_t sub_1AD73DEB0()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_1AD73DEC0()
{
  return MEMORY[0x1F40F81A0]();
}

uint64_t sub_1AD73DED0()
{
  return MEMORY[0x1F40F81D8]();
}

uint64_t sub_1AD73DEE0()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1AD73DEF0()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1AD73DF00()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1AD73DF10()
{
  return MEMORY[0x1F40F8388]();
}

uint64_t sub_1AD73DF20()
{
  return MEMORY[0x1F40F8390]();
}

uint64_t sub_1AD73DF30()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1AD73DF40()
{
  return MEMORY[0x1F40F84F8]();
}

uint64_t sub_1AD73DF50()
{
  return MEMORY[0x1F40F8500]();
}

uint64_t sub_1AD73DF60()
{
  return MEMORY[0x1F40F8508]();
}

uint64_t sub_1AD73DF70()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_1AD73DF80()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1AD73DF90()
{
  return MEMORY[0x1F40F8770]();
}

uint64_t sub_1AD73DFA0()
{
  return MEMORY[0x1F40F8780]();
}

uint64_t sub_1AD73DFB0()
{
  return MEMORY[0x1F40F8788]();
}

uint64_t sub_1AD73DFC0()
{
  return MEMORY[0x1F40F87A8]();
}

uint64_t sub_1AD73DFD0()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1AD73DFE0()
{
  return MEMORY[0x1F40F8808]();
}

uint64_t sub_1AD73DFF0()
{
  return MEMORY[0x1F40F8818]();
}

uint64_t sub_1AD73E000()
{
  return MEMORY[0x1F40F88E0]();
}

uint64_t sub_1AD73E010()
{
  return MEMORY[0x1F40F88E8]();
}

uint64_t sub_1AD73E020()
{
  return MEMORY[0x1F40F8A08]();
}

uint64_t sub_1AD73E030()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1AD73E040()
{
  return MEMORY[0x1F40F8A40]();
}

uint64_t sub_1AD73E050()
{
  return MEMORY[0x1F40F8A50]();
}

uint64_t sub_1AD73E060()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_1AD73E070()
{
  return MEMORY[0x1F40F8B98]();
}

uint64_t sub_1AD73E080()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1AD73E090()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1AD73E0A0()
{
  return MEMORY[0x1F40F8F40]();
}

uint64_t sub_1AD73E0B0()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1AD73E0C0()
{
  return MEMORY[0x1F40F8F88]();
}

uint64_t sub_1AD73E0D0()
{
  return MEMORY[0x1F40F8F98]();
}

uint64_t sub_1AD73E0E0()
{
  return MEMORY[0x1F40F8FF8]();
}

uint64_t sub_1AD73E0F0()
{
  return MEMORY[0x1F40F9010]();
}

uint64_t sub_1AD73E100()
{
  return MEMORY[0x1F40F9080]();
}

uint64_t sub_1AD73E110()
{
  return MEMORY[0x1F40F9088]();
}

uint64_t sub_1AD73E120()
{
  return MEMORY[0x1F40F9098]();
}

uint64_t sub_1AD73E140()
{
  return MEMORY[0x1F40F90C8]();
}

uint64_t sub_1AD73E150()
{
  return MEMORY[0x1F40F90E0]();
}

uint64_t sub_1AD73E160()
{
  return MEMORY[0x1F4121430]();
}

uint64_t sub_1AD73E170()
{
  return MEMORY[0x1F4121438]();
}

uint64_t sub_1AD73E180()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1AD73E190()
{
  return MEMORY[0x1F40F9110]();
}

uint64_t sub_1AD73E1A0()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1AD73E1B0()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1AD73E1C0()
{
  return MEMORY[0x1F40F9210]();
}

uint64_t sub_1AD73E1D0()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_1AD73E1E0()
{
  return MEMORY[0x1F40F9278]();
}

uint64_t sub_1AD73E1F0()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1AD73E200()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1AD73E210()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_1AD73E220()
{
  return MEMORY[0x1F40F92D0]();
}

uint64_t sub_1AD73E230()
{
  return MEMORY[0x1F40F92E8]();
}

uint64_t sub_1AD73E240()
{
  return MEMORY[0x1F40F9340]();
}

uint64_t sub_1AD73E250()
{
  return MEMORY[0x1F40F9350]();
}

uint64_t sub_1AD73E260()
{
  return MEMORY[0x1F40F9378]();
}

uint64_t sub_1AD73E270()
{
  return MEMORY[0x1F40F9380]();
}

uint64_t sub_1AD73E280()
{
  return MEMORY[0x1F40F93C0]();
}

uint64_t sub_1AD73E290()
{
  return MEMORY[0x1F40F93D0]();
}

uint64_t sub_1AD73E2A0()
{
  return MEMORY[0x1F40F9400]();
}

uint64_t sub_1AD73E2B0()
{
  return MEMORY[0x1F40F9410]();
}

uint64_t sub_1AD73E2C0()
{
  return MEMORY[0x1F40F9470]();
}

uint64_t sub_1AD73E2D0()
{
  return MEMORY[0x1F40F9480]();
}

uint64_t sub_1AD73E2E0()
{
  return MEMORY[0x1F40F9528]();
}

uint64_t sub_1AD73E2F0()
{
  return MEMORY[0x1F40F9530]();
}

uint64_t sub_1AD73E300()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1AD73E310()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1AD73E320()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1AD73E330()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1AD73E340()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1AD73E350()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1AD73E360()
{
  return MEMORY[0x1F40F9888]();
}

uint64_t sub_1AD73E370()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_1AD73E380()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1AD73E390()
{
  return MEMORY[0x1F40F9A80]();
}

uint64_t sub_1AD73E3A0()
{
  return MEMORY[0x1F40F9A90]();
}

uint64_t sub_1AD73E3B0()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_1AD73E3C0()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_1AD73E3D0()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_1AD73E3E0()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1AD73E3F0()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_1AD73E400()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1AD73E410()
{
  return MEMORY[0x1F40F9B78]();
}

uint64_t sub_1AD73E420()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1AD73E430()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1AD73E440()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1AD73E450()
{
  return MEMORY[0x1F40F9D90]();
}

uint64_t sub_1AD73E460()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_1AD73E470()
{
  return MEMORY[0x1F40F9DD8]();
}

uint64_t sub_1AD73E480()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1AD73E490()
{
  return MEMORY[0x1F40F9F88]();
}

uint64_t sub_1AD73E4A0()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1AD73E4B0()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1AD73E4C0()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_1AD73E4D0()
{
  return MEMORY[0x1F40FA0F8]();
}

uint64_t sub_1AD73E4E0()
{
  return MEMORY[0x1F40FA100]();
}

uint64_t sub_1AD73E4F0()
{
  return MEMORY[0x1F40FA288]();
}

uint64_t sub_1AD73E500()
{
  return MEMORY[0x1F40FA298]();
}

uint64_t sub_1AD73E510()
{
  return MEMORY[0x1F40FA2A8]();
}

uint64_t sub_1AD73E520()
{
  return MEMORY[0x1F40FA308]();
}

uint64_t sub_1AD73E530()
{
  return MEMORY[0x1F40FA348]();
}

uint64_t sub_1AD73E540()
{
  return MEMORY[0x1F40FA350]();
}

uint64_t sub_1AD73E550()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1AD73E560()
{
  return MEMORY[0x1F40FA430]();
}

uint64_t sub_1AD73E570()
{
  return MEMORY[0x1F40FA448]();
}

uint64_t sub_1AD73E580()
{
  return MEMORY[0x1F40FA450]();
}

uint64_t sub_1AD73E590()
{
  return MEMORY[0x1F40FA458]();
}

uint64_t sub_1AD73E5A0()
{
  return MEMORY[0x1F40FA748]();
}

uint64_t sub_1AD73E5B0()
{
  return MEMORY[0x1F40FA750]();
}

uint64_t sub_1AD73E5C0()
{
  return MEMORY[0x1F40FA758]();
}

uint64_t sub_1AD73E5D0()
{
  return MEMORY[0x1F40FA760]();
}

uint64_t sub_1AD73E5E0()
{
  return MEMORY[0x1F40FA7D0]();
}

uint64_t sub_1AD73E5F0()
{
  return MEMORY[0x1F40FA830]();
}

uint64_t sub_1AD73E600()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1AD73E610()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1AD73E620()
{
  return MEMORY[0x1F40FAAA8]();
}

uint64_t sub_1AD73E630()
{
  return MEMORY[0x1F40FAAC0]();
}

uint64_t sub_1AD73E640()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_1AD73E650()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_1AD73E660()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_1AD73E680()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_1AD73E690()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_1AD73E6A0()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_1AD73E6C0()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_1AD73E6D0()
{
  return MEMORY[0x1F40FABE0]();
}

uint64_t sub_1AD73E6E0()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1AD73E6F0()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1AD73E700()
{
  return MEMORY[0x1F40FAD78]();
}

uint64_t sub_1AD73E710()
{
  return MEMORY[0x1F40FAD88]();
}

uint64_t sub_1AD73E720()
{
  return MEMORY[0x1F40FAD98]();
}

uint64_t sub_1AD73E730()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1AD73E740()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1AD73E750()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1AD73E760()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1AD73E770()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1AD73E780()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1AD73E790()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1AD73E7A0()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_1AD73E7B0()
{
  return MEMORY[0x1F40FAE58]();
}

uint64_t sub_1AD73E7C0()
{
  return MEMORY[0x1F40FAE60]();
}

uint64_t sub_1AD73E7D0()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1AD73E7E0()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1AD73E7F0()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1AD73E800()
{
  return MEMORY[0x1F40FAF70]();
}

uint64_t sub_1AD73E810()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_1AD73E820()
{
  return MEMORY[0x1F40FAF98]();
}

uint64_t sub_1AD73E830()
{
  return MEMORY[0x1F40FAFA0]();
}

uint64_t sub_1AD73E840()
{
  return MEMORY[0x1F40FAFB0]();
}

uint64_t sub_1AD73E850()
{
  return MEMORY[0x1F40FAFC0]();
}

uint64_t sub_1AD73E860()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_1AD73E870()
{
  return MEMORY[0x1F40FAFF0]();
}

uint64_t sub_1AD73E880()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_1AD73E890()
{
  return MEMORY[0x1F40FB020]();
}

uint64_t sub_1AD73E8A0()
{
  return MEMORY[0x1F40FB050]();
}

uint64_t sub_1AD73E8B0()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_1AD73E8C0()
{
  return MEMORY[0x1F40FB0C8]();
}

uint64_t sub_1AD73E8D0()
{
  return MEMORY[0x1F40FB0F8]();
}

uint64_t sub_1AD73E8E0()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_1AD73E8F0()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_1AD73E900()
{
  return MEMORY[0x1F40FB148]();
}

uint64_t sub_1AD73E910()
{
  return MEMORY[0x1F40FB180]();
}

uint64_t sub_1AD73E920()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_1AD73E930()
{
  return MEMORY[0x1F40FB1F0]();
}

uint64_t sub_1AD73E940()
{
  return MEMORY[0x1F40FB310]();
}

uint64_t sub_1AD73E950()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1AD73E960()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_1AD73E970()
{
  return MEMORY[0x1F40FB440]();
}

uint64_t sub_1AD73E980()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1AD73E990()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1AD73E9A0()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_1AD73E9B0()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1AD73E9C0()
{
  return MEMORY[0x1F40D5D08]();
}

uint64_t sub_1AD73E9D0()
{
  return MEMORY[0x1F40D5D28]();
}

uint64_t sub_1AD73E9E0()
{
  return MEMORY[0x1F40D5D40]();
}

uint64_t sub_1AD73E9F0()
{
  return MEMORY[0x1F40D5D58]();
}

uint64_t sub_1AD73EA00()
{
  return MEMORY[0x1F40D5D80]();
}

uint64_t sub_1AD73EA10()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1AD73EA20()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1AD73EA30()
{
  return MEMORY[0x1F40FB648]();
}

uint64_t sub_1AD73EA40()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_1AD73EA50()
{
  return MEMORY[0x1F40FB780]();
}

uint64_t sub_1AD73EA60()
{
  return MEMORY[0x1F40FB7D8]();
}

uint64_t sub_1AD73EA70()
{
  return MEMORY[0x1F40FB808]();
}

uint64_t sub_1AD73EA80()
{
  return MEMORY[0x1F40FB840]();
}

uint64_t sub_1AD73EA90()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_1AD73EAA0()
{
  return MEMORY[0x1F40FB880]();
}

uint64_t sub_1AD73EAB0()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1AD73EAC0()
{
  return MEMORY[0x1F40FBA50]();
}

uint64_t sub_1AD73EAD0()
{
  return MEMORY[0x1F40FBA60]();
}

uint64_t sub_1AD73EAE0()
{
  return MEMORY[0x1F40FBB20]();
}

uint64_t sub_1AD73EAF0()
{
  return MEMORY[0x1F40FBB98]();
}

uint64_t sub_1AD73EB00()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1AD73EB10()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1AD73EB20()
{
  return MEMORY[0x1F40FBFC0]();
}

uint64_t sub_1AD73EB30()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_1AD73EB40()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_1AD73EB50()
{
  return MEMORY[0x1F40FC1B8]();
}

uint64_t sub_1AD73EB60()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_1AD73EB70()
{
  return MEMORY[0x1F40FC278]();
}

uint64_t sub_1AD73EB80()
{
  return MEMORY[0x1F40FC2A8]();
}

uint64_t sub_1AD73EB90()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1AD73EBA0()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1AD73EBB0()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_1AD73EBC0()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_1AD73EBD0()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1AD73EBE0()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_1AD73EBF0()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1AD73EC00()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1AD73EC10()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1AD73EC20()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1AD73EC30()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1AD73EC40()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1AD73EC50()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1AD73EC60()
{
  return MEMORY[0x1F40FC780]();
}

uint64_t sub_1AD73EC70()
{
  return MEMORY[0x1F40FC790]();
}

uint64_t sub_1AD73EC80()
{
  return MEMORY[0x1F40FC7A0]();
}

uint64_t sub_1AD73EC90()
{
  return MEMORY[0x1F40FC7C8]();
}

uint64_t sub_1AD73ECA0()
{
  return MEMORY[0x1F40FC7D0]();
}

uint64_t sub_1AD73ECB0()
{
  return MEMORY[0x1F40FC840]();
}

uint64_t sub_1AD73ECC0()
{
  return MEMORY[0x1F40FC858]();
}

uint64_t sub_1AD73ECD0()
{
  return MEMORY[0x1F40FC8B8]();
}

uint64_t sub_1AD73ECE0()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1AD73ECF0()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1AD73ED00()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1AD73ED10()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_1AD73ED20()
{
  return MEMORY[0x1F40FC950]();
}

uint64_t sub_1AD73ED30()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1AD73ED40()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1AD73ED50()
{
  return MEMORY[0x1F40D5D90]();
}

uint64_t sub_1AD73ED60()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1AD73ED70()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1AD73ED80()
{
  return MEMORY[0x1F40FC9E0]();
}

uint64_t sub_1AD73ED90()
{
  return MEMORY[0x1F40FCA00]();
}

uint64_t sub_1AD73EDA0()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_1AD73EDB0()
{
  return MEMORY[0x1F40FCA30]();
}

uint64_t sub_1AD73EDC0()
{
  return MEMORY[0x1F40FCA38]();
}

uint64_t sub_1AD73EDD0()
{
  return MEMORY[0x1F40FCA48]();
}

uint64_t sub_1AD73EDE0()
{
  return MEMORY[0x1F40FCA58]();
}

uint64_t sub_1AD73EDF0()
{
  return MEMORY[0x1F40FCBC8]();
}

uint64_t sub_1AD73EE00()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_1AD73EE10()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1AD73EE20()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1AD73EE30()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_1AD73EE40()
{
  return MEMORY[0x1F40FCCE0]();
}

uint64_t sub_1AD73EE50()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_1AD73EE60()
{
  return MEMORY[0x1F40FCD30]();
}

uint64_t sub_1AD73EE70()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_1AD73EE80()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_1AD73EE90()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1AD73EEA0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1AD73EEB0()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1AD73EEC0()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1AD73EED0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1AD73EEE0()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1AD73EEF0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1AD73EF00()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1AD73EF10()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1AD73EF20()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1AD73EF30()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1AD73EF40()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1AD73EF50()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1AD73EF60()
{
  return MEMORY[0x1F4121450]();
}

uint64_t sub_1AD73EF70()
{
  return MEMORY[0x1F4121458]();
}

uint64_t sub_1AD73EF80()
{
  return MEMORY[0x1F4121460]();
}

uint64_t sub_1AD73EF90()
{
  return MEMORY[0x1F4121468]();
}

uint64_t sub_1AD73EFA0()
{
  return MEMORY[0x1F4121470]();
}

uint64_t sub_1AD73EFB0()
{
  return MEMORY[0x1F4121480]();
}

uint64_t sub_1AD73EFC0()
{
  return MEMORY[0x1F40E7800]();
}

uint64_t sub_1AD73EFD0()
{
  return MEMORY[0x1F40E7808]();
}

uint64_t sub_1AD73EFE0()
{
  return MEMORY[0x1F40E7810]();
}

uint64_t sub_1AD73EFF0()
{
  return MEMORY[0x1F40E7820]();
}

uint64_t sub_1AD73F000()
{
  return MEMORY[0x1F40E7828]();
}

uint64_t sub_1AD73F010()
{
  return MEMORY[0x1F41036E0]();
}

uint64_t sub_1AD73F020()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1AD73F030()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1AD73F040()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1AD73F050()
{
  return MEMORY[0x1F4183338]();
}

uint64_t sub_1AD73F060()
{
  return MEMORY[0x1F4183420]();
}

uint64_t sub_1AD73F070()
{
  return MEMORY[0x1F4183440]();
}

uint64_t sub_1AD73F080()
{
  return MEMORY[0x1F4183480]();
}

uint64_t sub_1AD73F090()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1AD73F0A0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1AD73F0B0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1AD73F0C0()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1AD73F0D0()
{
  return MEMORY[0x1F4183638]();
}

uint64_t sub_1AD73F0E0()
{
  return MEMORY[0x1F4183640]();
}

uint64_t sub_1AD73F0F0()
{
  return MEMORY[0x1F4183658]();
}

uint64_t sub_1AD73F100()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1AD73F110()
{
  return MEMORY[0x1F411F180]();
}

uint64_t sub_1AD73F120()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1AD73F130()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1AD73F140()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_1AD73F150()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1AD73F160()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1AD73F170()
{
  return MEMORY[0x1F40E6160]();
}

uint64_t sub_1AD73F180()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1AD73F190()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1AD73F1A0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1AD73F1B0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1AD73F1D0()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1AD73F1E0()
{
  return MEMORY[0x1F40E6208]();
}

uint64_t sub_1AD73F1F0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1AD73F200()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1AD73F210()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1AD73F220()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1AD73F230()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1AD73F240()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1AD73F250()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1AD73F260()
{
  return MEMORY[0x1F4120D30]();
}

uint64_t sub_1AD73F270()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1AD73F280()
{
  return MEMORY[0x1F411DF00]();
}

uint64_t sub_1AD73F290()
{
  return MEMORY[0x1F411DF10]();
}

uint64_t sub_1AD73F2A0()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1AD73F2B0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1AD73F2C0()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1AD73F2D0()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1AD73F2E0()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1AD73F2F0()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1AD73F300()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1AD73F310()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1AD73F320()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1AD73F330()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1AD73F340()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1AD73F360()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1AD73F370()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1AD73F380()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1AD73F390()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1AD73F3A0()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1AD73F3B0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1AD73F3C0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1AD73F3D0()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1AD73F3E0()
{
  return MEMORY[0x1F411DF20]();
}

uint64_t sub_1AD73F3F0()
{
  return MEMORY[0x1F40D6E68]();
}

uint64_t sub_1AD73F400()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1AD73F410()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1AD73F420()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1AD73F430()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1AD73F440()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1AD73F450()
{
  return MEMORY[0x1F4183DA0]();
}

uint64_t sub_1AD73F460()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1AD73F470()
{
  return MEMORY[0x1F4183E18]();
}

uint64_t sub_1AD73F480()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1AD73F490()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1AD73F4A0()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1AD73F4B0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1AD73F4C0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1AD73F4D0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1AD73F4E0()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1AD73F4F0()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1AD73F510()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1AD73F520()
{
  return MEMORY[0x1F4183ED0]();
}

uint64_t sub_1AD73F530()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1AD73F540()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1AD73F550()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1AD73F560()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1AD73F570()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1AD73F580()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1AD73F590()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1AD73F5A0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1AD73F5B0()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1AD73F5C0()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1AD73F5D0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1AD73F5E0()
{
  return MEMORY[0x1F4187C38]();
}

uint64_t sub_1AD73F600()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1AD73F610()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1AD73F620()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1AD73F630()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1AD73F640()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1AD73F650()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1AD73F660()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1AD73F670()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1AD73F680()
{
  return MEMORY[0x1F4184018]();
}

uint64_t sub_1AD73F690()
{
  return MEMORY[0x1F411DF38]();
}

uint64_t sub_1AD73F6A0()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1AD73F6D0()
{
  return MEMORY[0x1F40E6408]();
}

uint64_t sub_1AD73F6E0()
{
  return MEMORY[0x1F40E6410]();
}

uint64_t sub_1AD73F6F0()
{
  return MEMORY[0x1F40E6428]();
}

uint64_t sub_1AD73F710()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1AD73F720()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1AD73F730()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1AD73F740()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1AD73F750()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1AD73F760()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1AD73F770()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1AD73F780()
{
  return MEMORY[0x1F4120D58]();
}

uint64_t sub_1AD73F790()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1AD73F7A0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1AD73F7B0()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1AD73F7C0()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1AD73F7D0()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1AD73F7E0()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1AD73F7F0()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1AD73F800()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1AD73F810()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1AD73F820()
{
  return MEMORY[0x1F4166458]();
}

uint64_t sub_1AD73F830()
{
  return MEMORY[0x1F411DF40]();
}

uint64_t sub_1AD73F840()
{
  return MEMORY[0x1F411DF48]();
}

uint64_t sub_1AD73F850()
{
  return MEMORY[0x1F411F190]();
}

uint64_t sub_1AD73F860()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1AD73F870()
{
  return MEMORY[0x1F40D9690]();
}

uint64_t sub_1AD73F880()
{
  return MEMORY[0x1F40D96B8]();
}

uint64_t sub_1AD73F890()
{
  return MEMORY[0x1F40D96C0]();
}

uint64_t sub_1AD73F8A0()
{
  return MEMORY[0x1F4166490]();
}

uint64_t sub_1AD73F8B0()
{
  return MEMORY[0x1F4120D78]();
}

uint64_t sub_1AD73F8C0()
{
  return MEMORY[0x1F411F1D8]();
}

uint64_t sub_1AD73F8D0()
{
  return MEMORY[0x1F411F200]();
}

uint64_t sub_1AD73F8E0()
{
  return MEMORY[0x1F4121068]();
}

uint64_t sub_1AD73F8F0()
{
  return MEMORY[0x1F4121070]();
}

uint64_t sub_1AD73F900()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1AD73F910()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1AD73F920()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1AD73F930()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1AD73F940()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1AD73F950()
{
  return MEMORY[0x1F411DF60]();
}

uint64_t sub_1AD73F960()
{
  return MEMORY[0x1F411DF68]();
}

uint64_t sub_1AD73F970()
{
  return MEMORY[0x1F411DF70]();
}

uint64_t sub_1AD73F980()
{
  return MEMORY[0x1F411DF78]();
}

uint64_t sub_1AD73F990()
{
  return MEMORY[0x1F411DF80]();
}

uint64_t sub_1AD73F9A0()
{
  return MEMORY[0x1F411DF88]();
}

uint64_t sub_1AD73F9B0()
{
  return MEMORY[0x1F411DF90]();
}

uint64_t sub_1AD73F9C0()
{
  return MEMORY[0x1F411DF98]();
}

uint64_t sub_1AD73F9D0()
{
  return MEMORY[0x1F411DFA0]();
}

uint64_t sub_1AD73F9E0()
{
  return MEMORY[0x1F411DFA8]();
}

uint64_t sub_1AD73F9F0()
{
  return MEMORY[0x1F411DFB0]();
}

uint64_t sub_1AD73FA00()
{
  return MEMORY[0x1F40E7960]();
}

uint64_t sub_1AD73FA10()
{
  return MEMORY[0x1F411DFB8]();
}

uint64_t sub_1AD73FA20()
{
  return MEMORY[0x1F411DFC0]();
}

uint64_t sub_1AD73FA30()
{
  return MEMORY[0x1F411DFC8]();
}

uint64_t sub_1AD73FA40()
{
  return MEMORY[0x1F411DFD0]();
}

uint64_t sub_1AD73FA50()
{
  return MEMORY[0x1F411DFD8]();
}

uint64_t sub_1AD73FA60()
{
  return MEMORY[0x1F4120D80]();
}

uint64_t sub_1AD73FA70()
{
  return MEMORY[0x1F411DFE0]();
}

uint64_t sub_1AD73FA80()
{
  return MEMORY[0x1F411F230]();
}

uint64_t sub_1AD73FA90()
{
  return MEMORY[0x1F411F238]();
}

uint64_t sub_1AD73FAA0()
{
  return MEMORY[0x1F41664B8]();
}

uint64_t sub_1AD73FAB0()
{
  return MEMORY[0x1F41664C8]();
}

uint64_t sub_1AD73FAC0()
{
  return MEMORY[0x1F41664E8]();
}

uint64_t sub_1AD73FAD0()
{
  return MEMORY[0x1F41664F8]();
}

uint64_t sub_1AD73FAE0()
{
  return MEMORY[0x1F40D9708]();
}

uint64_t sub_1AD73FAF0()
{
  return MEMORY[0x1F40E7998]();
}

uint64_t sub_1AD73FB00()
{
  return MEMORY[0x1F40E79A0]();
}

uint64_t sub_1AD73FB10()
{
  return MEMORY[0x1F4120D98]();
}

uint64_t sub_1AD73FB20()
{
  return MEMORY[0x1F4120DA0]();
}

uint64_t sub_1AD73FB30()
{
  return MEMORY[0x1F4120DB0]();
}

uint64_t sub_1AD73FB40()
{
  return MEMORY[0x1F40E66A0]();
}

uint64_t sub_1AD73FB50()
{
  return MEMORY[0x1F4166588]();
}

uint64_t sub_1AD73FB60()
{
  return MEMORY[0x1F4166590]();
}

uint64_t sub_1AD73FB70()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1AD73FB80()
{
  return MEMORY[0x1F41214A0]();
}

uint64_t sub_1AD73FB90()
{
  return MEMORY[0x1F41214A8]();
}

uint64_t sub_1AD73FBA0()
{
  return MEMORY[0x1F411DFE8]();
}

uint64_t sub_1AD73FBB0()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1AD73FBC0()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1AD73FBD0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1AD73FBE0()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1AD73FBF0()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1AD73FC00()
{
  return MEMORY[0x1F4187060]();
}

uint64_t sub_1AD73FC10()
{
  return MEMORY[0x1F4187078]();
}

uint64_t sub_1AD73FC20()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1AD73FC30()
{
  return MEMORY[0x1F4187090]();
}

uint64_t sub_1AD73FC40()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1AD73FC50()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1AD73FC60()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1AD73FC70()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1AD73FC80()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1AD73FC90()
{
  return MEMORY[0x1F41665C0]();
}

uint64_t sub_1AD73FCA0()
{
  return MEMORY[0x1F41665F8]();
}

uint64_t sub_1AD73FCB0()
{
  return MEMORY[0x1F41214B0]();
}

uint64_t sub_1AD73FCC0()
{
  return MEMORY[0x1F411F2D8]();
}

uint64_t sub_1AD73FCD0()
{
  return MEMORY[0x1F411F2E0]();
}

uint64_t sub_1AD73FCE0()
{
  return MEMORY[0x1F411F2E8]();
}

uint64_t sub_1AD73FCF0()
{
  return MEMORY[0x1F40E6740]();
}

uint64_t sub_1AD73FD00()
{
  return MEMORY[0x1F41214B8]();
}

uint64_t sub_1AD73FD10()
{
  return MEMORY[0x1F411DFF8]();
}

uint64_t sub_1AD73FD20()
{
  return MEMORY[0x1F411E000]();
}

uint64_t sub_1AD73FD30()
{
  return MEMORY[0x1F411E010]();
}

uint64_t sub_1AD73FD40()
{
  return MEMORY[0x1F41214E8]();
}

uint64_t sub_1AD73FD50()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1AD73FD60()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1AD73FD70()
{
  return MEMORY[0x1F411E018]();
}

uint64_t sub_1AD73FD80()
{
  return MEMORY[0x1F411F2F8]();
}

uint64_t sub_1AD73FD90()
{
  return MEMORY[0x1F411E020]();
}

uint64_t sub_1AD73FDA0()
{
  return MEMORY[0x1F411F300]();
}

uint64_t sub_1AD73FDB0()
{
  return MEMORY[0x1F411F308]();
}

uint64_t sub_1AD73FDC0()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1AD73FDD0()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1AD73FDE0()
{
  return MEMORY[0x1F4166650]();
}

uint64_t sub_1AD73FDF0()
{
  return MEMORY[0x1F4166658]();
}

uint64_t sub_1AD73FE00()
{
  return MEMORY[0x1F4166660]();
}

uint64_t sub_1AD73FE10()
{
  return MEMORY[0x1F4166668]();
}

uint64_t sub_1AD73FE20()
{
  return MEMORY[0x1F411F328]();
}

uint64_t sub_1AD73FE30()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1AD73FE40()
{
  return MEMORY[0x1F4166690]();
}

uint64_t sub_1AD73FE50()
{
  return MEMORY[0x1F4166698]();
}

uint64_t sub_1AD73FE60()
{
  return MEMORY[0x1F41666A0]();
}

uint64_t sub_1AD73FE70()
{
  return MEMORY[0x1F41666A8]();
}

uint64_t sub_1AD73FE80()
{
  return MEMORY[0x1F4120DB8]();
}

uint64_t sub_1AD73FE90()
{
  return MEMORY[0x1F4121078]();
}

uint64_t sub_1AD73FEA0()
{
  return MEMORY[0x1F4121080]();
}

uint64_t sub_1AD73FEB0()
{
  return MEMORY[0x1F40D7060]();
}

uint64_t sub_1AD73FEC0()
{
  return MEMORY[0x1F40D7078]();
}

uint64_t sub_1AD73FED0()
{
  return MEMORY[0x1F411E030]();
}

uint64_t sub_1AD73FEE0()
{
  return MEMORY[0x1F411E038]();
}

uint64_t sub_1AD73FEF0()
{
  return MEMORY[0x1F41666B8]();
}

uint64_t sub_1AD73FF00()
{
  return MEMORY[0x1F41666C0]();
}

uint64_t sub_1AD73FF10()
{
  return MEMORY[0x1F41666C8]();
}

uint64_t sub_1AD73FF20()
{
  return MEMORY[0x1F411E040]();
}

uint64_t sub_1AD73FF30()
{
  return MEMORY[0x1F41666F8]();
}

uint64_t sub_1AD73FF40()
{
  return MEMORY[0x1F4120DD8]();
}

uint64_t sub_1AD73FF50()
{
  return MEMORY[0x1F411E048]();
}

uint64_t sub_1AD73FF60()
{
  return MEMORY[0x1F41214F8]();
}

uint64_t sub_1AD73FF70()
{
  return MEMORY[0x1F411E058]();
}

uint64_t sub_1AD73FF80()
{
  return MEMORY[0x1F411F348]();
}

uint64_t sub_1AD73FF90()
{
  return MEMORY[0x1F411F350]();
}

uint64_t sub_1AD73FFA0()
{
  return MEMORY[0x1F411F358]();
}

uint64_t sub_1AD73FFB0()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1AD73FFC0()
{
  return MEMORY[0x1F41667D8]();
}

uint64_t sub_1AD73FFD0()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1AD73FFE0()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1AD73FFF0()
{
  return MEMORY[0x1F4166800]();
}

uint64_t sub_1AD740000()
{
  return MEMORY[0x1F4166818]();
}

uint64_t sub_1AD740010()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1AD740020()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1AD740030()
{
  return MEMORY[0x1F40E6918]();
}

uint64_t sub_1AD740040()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1AD740050()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1AD740060()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1AD740070()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1AD740080()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1AD740090()
{
  return MEMORY[0x1F40E6938]();
}

uint64_t sub_1AD7400A0()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1AD7400B0()
{
  return MEMORY[0x1F4166850]();
}

uint64_t sub_1AD7400C0()
{
  return MEMORY[0x1F4166860]();
}

uint64_t sub_1AD7400D0()
{
  return MEMORY[0x1F4166878]();
}

uint64_t sub_1AD7400E0()
{
  return MEMORY[0x1F4166888]();
}

uint64_t sub_1AD7400F0()
{
  return MEMORY[0x1F41668A0]();
}

uint64_t sub_1AD740100()
{
  return MEMORY[0x1F41668B0]();
}

uint64_t sub_1AD740110()
{
  return MEMORY[0x1F41668B8]();
}

uint64_t sub_1AD740120()
{
  return MEMORY[0x1F41668D8]();
}

uint64_t sub_1AD740130()
{
  return MEMORY[0x1F41668E0]();
}

uint64_t sub_1AD740140()
{
  return MEMORY[0x1F41668F0]();
}

uint64_t sub_1AD740150()
{
  return MEMORY[0x1F41668F8]();
}

uint64_t sub_1AD740160()
{
  return MEMORY[0x1F4166900]();
}

uint64_t sub_1AD740170()
{
  return MEMORY[0x1F4166908]();
}

uint64_t sub_1AD740180()
{
  return MEMORY[0x1F4166910]();
}

uint64_t sub_1AD740190()
{
  return MEMORY[0x1F4166950]();
}

uint64_t sub_1AD7401A0()
{
  return MEMORY[0x1F4166968]();
}

uint64_t sub_1AD7401B0()
{
  return MEMORY[0x1F4166970]();
}

uint64_t sub_1AD7401C0()
{
  return MEMORY[0x1F4166988]();
}

uint64_t sub_1AD7401D0()
{
  return MEMORY[0x1F4166998]();
}

uint64_t sub_1AD7401E0()
{
  return MEMORY[0x1F41669A8]();
}

uint64_t sub_1AD7401F0()
{
  return MEMORY[0x1F41669C0]();
}

uint64_t sub_1AD740200()
{
  return MEMORY[0x1F41669C8]();
}

uint64_t sub_1AD740210()
{
  return MEMORY[0x1F41669D8]();
}

uint64_t sub_1AD740220()
{
  return MEMORY[0x1F41669E8]();
}

uint64_t sub_1AD740230()
{
  return MEMORY[0x1F41669F0]();
}

uint64_t sub_1AD740240()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1AD740250()
{
  return MEMORY[0x1F4166A38]();
}

uint64_t sub_1AD740260()
{
  return MEMORY[0x1F4166A48]();
}

uint64_t sub_1AD740270()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1AD740280()
{
  return MEMORY[0x1F411E078]();
}

uint64_t sub_1AD740290()
{
  return MEMORY[0x1F411E080]();
}

uint64_t sub_1AD7402A0()
{
  return MEMORY[0x1F411E088]();
}

uint64_t sub_1AD7402B0()
{
  return MEMORY[0x1F411E090]();
}

uint64_t sub_1AD7402C0()
{
  return MEMORY[0x1F411E098]();
}

uint64_t sub_1AD7402D0()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1AD7402E0()
{
  return MEMORY[0x1F40E6AB0]();
}

uint64_t sub_1AD7402F0()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1AD740300()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1AD740310()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1AD740320()
{
  return MEMORY[0x1F4120DE0]();
}

uint64_t sub_1AD740330()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1AD740340()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1AD740350()
{
  return MEMORY[0x1F4184658]();
}

uint64_t sub_1AD740360()
{
  return MEMORY[0x1F41846D8]();
}

uint64_t sub_1AD740370()
{
  return MEMORY[0x1F4184720]();
}

uint64_t sub_1AD740380()
{
  return MEMORY[0x1F4184780]();
}

uint64_t sub_1AD740390()
{
  return MEMORY[0x1F4184788]();
}

uint64_t sub_1AD7403A0()
{
  return MEMORY[0x1F4184790]();
}

uint64_t sub_1AD7403B0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1AD7403C0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1AD7403D0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1AD7403E0()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1AD7403F0()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1AD740400()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1AD740410()
{
  return MEMORY[0x1F40E6CD8]();
}

uint64_t sub_1AD740420()
{
  return MEMORY[0x1F40E6CE8]();
}

uint64_t sub_1AD740430()
{
  return MEMORY[0x1F40E6CF0]();
}

uint64_t sub_1AD740440()
{
  return MEMORY[0x1F40E6CF8]();
}

uint64_t sub_1AD740450()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1AD740460()
{
  return MEMORY[0x1F40E6D58]();
}

uint64_t sub_1AD740470()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1AD740480()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1AD740490()
{
  return MEMORY[0x1F40E6D90]();
}

uint64_t sub_1AD7404A0()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1AD7404B0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1AD7404C0()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1AD7404D0()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1AD7404F0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1AD740500()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1AD740510()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1AD740520()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1AD740530()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1AD740540()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1AD740550()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1AD740560()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1AD740570()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1AD740580()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1AD740590()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1AD7405A0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1AD7405B0()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1AD7405C0()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1AD7405D0()
{
  return MEMORY[0x1F4184C10]();
}

uint64_t sub_1AD7405E0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1AD7405F0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1AD740600()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1AD740610()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1AD740620()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1AD740630()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1AD740640()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1AD740650()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1AD740670()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1AD740680()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1AD740690()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1AD7406A0()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1AD7406B0()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1AD7406C0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1AD7406D0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1AD7406E0()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1AD7406F0()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1AD740700()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1AD740710()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1AD740720()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1AD740730()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1AD740750()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1AD740760()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1AD740770()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1AD740780()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1AD740790()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1AD7407A0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1AD7407B0()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1AD7407C0()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1AD7407D0()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1AD7407E0()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1AD7407F0()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1AD740800()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1AD740810()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1AD740820()
{
  return MEMORY[0x1F4184FC0]();
}

uint64_t sub_1AD740830()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1AD740840()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1AD740850()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1AD740860()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1AD740870()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1AD740880()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1AD740890()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1AD7408A0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1AD7408B0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1AD7408C0()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1AD7408D0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1AD7408E0()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1AD7408F0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1AD740900()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1AD740910()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1AD740920()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1AD740930()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1AD740940()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1AD740950()
{
  return MEMORY[0x1F41853E0]();
}

uint64_t sub_1AD740960()
{
  return MEMORY[0x1F41853F0]();
}

uint64_t sub_1AD740970()
{
  return MEMORY[0x1F41853F8]();
}

uint64_t sub_1AD740980()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1AD740990()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1AD7409A0()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1AD7409B0()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1AD7409C0()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1AD7409D0()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1AD7409E0()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1AD7409F0()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1AD740A00()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1AD740A10()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1AD740A20()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1AD740A30()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1AD740A40()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1AD740A50()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1AD740A60()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1AD740A70()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1AD740A80()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1AD740A90()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1AD740AA0()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1AD740AB0()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1AD740AC0()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1AD740AD0()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1AD740AE0()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1AD740AF0()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1AD740B00()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1AD740B10()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1AD740B20()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1AD740B30()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1AD740B40()
{
  return MEMORY[0x1F4185748]();
}

uint64_t sub_1AD740B50()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1AD740B60()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1AD740B70()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1AD740B80()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1AD740B90()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1AD740BA0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1AD740BB0()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1AD740BC0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1AD740BE0()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1AD740BF0()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1AD740C00()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1AD740C10()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1AD740C20()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1AD740C30()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1AD740C40()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1AD740C80()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1AD740C90()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1AD740CA0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1AD740CB0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1AD740CC0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1AD740CD0()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1AD740CE0()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1AD740CF0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1AD740D00()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1AD740D10()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1AD740D20()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1AD740D30()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1AD740D40()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1AD740D50()
{
  return MEMORY[0x1F411F360]();
}

uint64_t sub_1AD740D60()
{
  return MEMORY[0x1F40D6E78]();
}

uint64_t sub_1AD740D70()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1AD740D80()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1AD740D90()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1AD740DA0()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_1AD740DB0()
{
  return MEMORY[0x1F4186070]();
}

uint64_t sub_1AD740DC0()
{
  return MEMORY[0x1F4186078]();
}

uint64_t sub_1AD740DD0()
{
  return MEMORY[0x1F41860D8]();
}

uint64_t sub_1AD740DE0()
{
  return MEMORY[0x1F41860E8]();
}

uint64_t sub_1AD740DF0()
{
  return MEMORY[0x1F41860F0]();
}

uint64_t sub_1AD740E00()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t sub_1AD740E30()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1F40D7298](aStr);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGPDFPageGetPageNumber(CGPDFPageRef page)
{
  return MEMORY[0x1F40DADA8](page);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  MEMORY[0x1F40DB4C0](t, (__n128)size, *(__n128 *)&size.height);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

uint64_t CPDateFormatStringForFormatType()
{
  return MEMORY[0x1F41092E0]();
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1F40DF6B8](frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1 = MEMORY[0x1F40DF6D0](frame);
  result.length = v2;
  result.location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1F40DF6E0](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x1F40DF700](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  MEMORY[0x1F40DF7F0](line, charIndex, secondaryOffset);
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1 = MEMORY[0x1F40DF810](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1F411C8F8]();
}

uint64_t HAFeatureFlagAlwaysRunGenerationOnSharingSetUp()
{
  return MEMORY[0x1F411E0A0]();
}

uint64_t HAFeatureFlagStewieEnabled()
{
  return MEMORY[0x1F411E0A8]();
}

uint64_t HAFeatureFlagViewLoggingEnabled()
{
  return MEMORY[0x1F411E0B0]();
}

uint64_t HKAllFeatureIdentifiers()
{
  return MEMORY[0x1F40E7A28]();
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAgeAndMaximumAge()
{
  return MEMORY[0x1F40E7A48]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x1F40E7A70]();
}

uint64_t HKAuthorizationStatusAllowsReading()
{
  return MEMORY[0x1F40E7AB0]();
}

uint64_t HKAuthorizationStatusAllowsSharing()
{
  return MEMORY[0x1F40E7AB8]();
}

uint64_t HKConditionallyRedactedHeartRhythmString()
{
  return MEMORY[0x1F40E7B50]();
}

uint64_t HKDecimalFormatter()
{
  return MEMORY[0x1F4121530]();
}

uint64_t HKDecodeDateForValue()
{
  return MEMORY[0x1F4121538]();
}

uint64_t HKDisplayCategoryIdentifierFromString()
{
  return MEMORY[0x1F4121540]();
}

uint64_t HKDisplayCategoryIdentifierToString()
{
  return MEMORY[0x1F4121548]();
}

uint64_t HKEncodeValueForDate()
{
  return MEMORY[0x1F4121550]();
}

uint64_t HKErrorTableViewCell()
{
  return MEMORY[0x1F4121558]();
}

uint64_t HKFormatValueAndUnit()
{
  return MEMORY[0x1F4121560]();
}

uint64_t HKFormattedFeetAndInches()
{
  return MEMORY[0x1F4121568]();
}

uint64_t HKHealthKeyColor()
{
  return MEMORY[0x1F4121588]();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return MEMORY[0x1F40E7D10]();
}

uint64_t HKHealthTintColor()
{
  return MEMORY[0x1F4121590]();
}

uint64_t HKHealthUIBuddyDirectionalEdgeInsets()
{
  return MEMORY[0x1F4121598]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1F40E7D50]();
}

uint64_t HKIntegerFormatter()
{
  return MEMORY[0x1F41215A8]();
}

uint64_t HKLocalizedNoDataString()
{
  return MEMORY[0x1F41215B0]();
}

uint64_t HKLocalizedStringForDateAndTemplate()
{
  return MEMORY[0x1F41215B8]();
}

uint64_t HKMostRecentSampleEndDateText()
{
  return MEMORY[0x1F41215C8]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x1F40E7F30]();
}

uint64_t HKStringFromProfileType()
{
  return MEMORY[0x1F40E8020]();
}

uint64_t HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory()
{
  return MEMORY[0x1F41215F8]();
}

uint64_t HKUIApplicationIsUsingAccessibilityContentSizeCategory()
{
  return MEMORY[0x1F4121600]();
}

uint64_t HKUIDefaultGregorianBirthday()
{
  return MEMORY[0x1F4121610]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x1F4121628]();
}

uint64_t HKUILocalizedString()
{
  return MEMORY[0x1F4121630]();
}

uint64_t HKUILocalizedWorkoutTypeName()
{
  return MEMORY[0x1F4121640]();
}

uint64_t HKUIObjectIsLarger()
{
  return MEMORY[0x1F4121650]();
}

uint64_t HKUIObjectIsSmaller()
{
  return MEMORY[0x1F4121658]();
}

uint64_t HKUIObjectMin()
{
  return MEMORY[0x1F4121660]();
}

uint64_t HKUIOnePixel()
{
  return MEMORY[0x1F4121668]();
}

uint64_t HKUnitPreferenceControllerAvailableUnitsForDisplayType()
{
  return MEMORY[0x1F4121678]();
}

uint64_t HKWheelchairUseDisplayName()
{
  return MEMORY[0x1F40E8078]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromHKCountrySetProvenance()
{
  return MEMORY[0x1F40E80D8]();
}

uint64_t NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return MEMORY[0x1F40E80E8]();
}

uint64_t NSStringFromHKFeatureIdentifier()
{
  return MEMORY[0x1F40E80F8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

void UIRectFrame(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t WDBundle()
{
  return MEMORY[0x1F4121410]();
}

uint64_t WDGetProfileNameForHealthStore()
{
  return MEMORY[0x1F4121418]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

uint64_t _HKWorkoutActivityTypeIsDeprecated()
{
  return MEMORY[0x1F40E8248]();
}

uint64_t _HKWorkoutActivityTypeIsValid()
{
  return MEMORY[0x1F40E8258]();
}

uint64_t _HKWorkoutDistanceTypeForActivityType()
{
  return MEMORY[0x1F40E82A8]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t health_dispatch_get_current_workloop()
{
  return MEMORY[0x1F411E0B8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x1F4186598]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1F4186780]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x1F4188248]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}